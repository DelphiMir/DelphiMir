unit cliUtil;

interface

uses
  {svn,} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DXClass, WIL, Grobal2, StdCtrls, DirectX, DIB, HUtil32,
  wmutil; //, bmputil;


const
   MAXGRADE = 64;
   DIVUNIT = 4;


type
  TColorEffect = (ceNone, ceGrayScale, ceBright, ceBlack, ceWhite, ceRed, ceGreen, ceBlue, ceYellow, ceFuchsia, ceOrange, ceDarkness, ceAqua, ceLightPurple);

  TNearestIndexHeader = record
    Title: string[30];
    IndexCount: integer;
    desc: array[0..10] of byte;
  end;

function  HasMMX: Boolean;
procedure BuildColorLevels (ctable: TRGBQuads);
procedure BuildNearestIndex (ctable: TRGBQuads);
procedure SaveNearestIndex (flname: string);
function  LoadNearestIndex (flname: string): Boolean;
procedure DrawFog (ssuf: TDirectDrawSurface; fogmask: PByte; fogwidth: integer);
procedure MakeDark (ssuf: TDirectDrawSurface; darklevel: integer);
procedure FogCopy (PSource: Pbyte; ssx, ssy, swidth, sheight: integer;
                   PDest: Pbyte; ddx, ddy, dwidth, dheight, maxfog: integer);

procedure DrawBlend(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; blendmode: integer);
procedure DrawBlend2 (dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; ralpha: integer);
procedure DrawBlendEx3(DstSurf: TDirectDrawSurface; DstX, DstY: Integer; SrcSurf: TDirectDrawSurface; SrcSurfLeft, SrcSurfTop, SrcSurfWidth, SrcSurfHeight, BlendMode: Integer);
procedure DrawBlend3 (dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; blendmode: integer);
//procedure DrawBlendEx(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; ssufleft, ssuftop, ssufwidth, ssufheight, blendmode: integer);
procedure DrawBlendEx(DstSurf: TDirectDrawSurface; DstX, DstY: Integer; SrcSurf: TDirectDrawSurface; SrcSurfLeft, SrcSurfTop, SrcSurfWidth, SrcSurfHeight, BlendMode: Integer);
procedure DrawBlendalpha(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; ssufleft, ssuftop, ssufwidth, ssufheight, Alpha: integer);

procedure DrawEffect (x, y, width, height: integer; ssuf: TDirectDrawSurface; eff: TColorEffect);

procedure BuildRealRGB (ctable: TRGBQuads);

var
   DarkLevel : integer;


implementation

uses Share, MShare;

var
  Color256Mix: array[0..255, 0..255] of byte;
  Color256Anti: array[0..255, 0..255] of byte;
  HeavyDarkColorLevel: array[0..255, 0..255] of byte;
  LightDarkColorLevel: array[0..255, 0..255] of byte;
  DengunColorLevel: array[0..255, 0..255] of byte;
  BrightColorLevel: array[0..255] of byte;
  GrayScaleLevel: array[0..255] of byte;
  RedishColorLevel: array[0..255] of byte;
  BlackColorLevel: array[0..255] of byte;
  WhiteColorLevel: array[0..255] of byte;
  GreenColorLevel: array[0..255] of byte;
  YellowColorLevel: array[0..255] of byte;
  BlueColorLevel: array[0..255] of byte;
  FuchsiaColorLevel: array[0..255] of byte;

  Color256real: array[0..255, 0..255] of byte;

  ColorDeep          :TPixelFormat = pf32Bit;
function  HasMMX: Boolean;
var
   n: byte;
begin
   asm
      mov   eax, 1
      db $0F,$A2               /// CPUID
      test  edx, 00800000H
      mov   n, 1
      jnz   @@Found
      mov   n, 0
   @@Found:
   end;
   if n = 1 then Result := TRUE
   else Result := FALSE;
end;

procedure BuildNearestIndex(ctable: TRGBQuads);
var
  MinDif, ColDif: integer;
  MatchColor: byte;
  pal0, pal1, pal2: TRGBQuad;
  procedure BuildMix;
  var
    i, j, n: integer;
  begin
    for i := 0 to 255 do begin
      pal0 := ctable[i];
      for j := 0 to 255 do begin
        pal1 := ctable[j];
        pal1.rgbRed := pal0.rgbRed div 2 + pal1.rgbRed div 2;
        pal1.rgbGreen := pal0.rgbGreen div 2 + pal1.rgbGreen div 2;
        pal1.rgbBlue := pal0.rgbBlue div 2 + pal1.rgbBlue div 2;
        MinDif := 768;
        MatchColor := 0;
        for n := 0 to 255 do begin
          pal2 := ctable[n];
          ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
            Abs(pal2.rgbGreen - pal1.rgbGreen) +
            Abs(pal2.rgbBlue - pal1.rgbBlue);
          if ColDif < MinDif then begin
            MinDif := ColDif;
            MatchColor := n;
          end;
        end;
        Color256Mix[i, j] := MatchColor;
      end;
    end;
  end;
  procedure BuildAnti;     //过滤多种黑色的数学算法
  var
    i, j: integer;
    MatchColor: byte;
  begin
    for i := 0 to 255 do begin          //这个算法支持32位真彩
      for j := 0 to 255 do begin
         MatchColor:= _MIN(255, Round(i + (255 - i) / 255 * j));
        Color256Anti[i, j] := MatchColor;
      end;
    end;
  end;
  procedure BuildColorLevels;
  var
    n, i, j, rr, gg, bb: integer;
  begin
    for n := 0 to 30 do begin
      for i := 0 to 255 do begin
        pal1 := ctable[i];
        rr := _MIN(Round(pal1.rgbRed * (n + 1) / 31) - 5, 255); //(n + (n-1)*3) / 121);
        gg := _MIN(Round(pal1.rgbGreen * (n + 1) / 31) - 5, 255); //(n + (n-1)*3) / 121);
        bb := _MIN(Round(pal1.rgbBlue * (n + 1) / 31) - 5, 255); //(n + (n-1)*3) / 121);
        pal1.rgbRed := _MAX(0, rr);
        pal1.rgbGreen := _MAX(0, gg);
        pal1.rgbBlue := _MAX(0, bb);
        MinDif := 768;
        MatchColor := 0;
        for j := 0 to 255 do begin
          pal2 := ctable[j];
          ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
            Abs(pal2.rgbGreen - pal1.rgbGreen) +
            Abs(pal2.rgbBlue - pal1.rgbBlue);
          if ColDif < MinDif then begin
            MinDif := ColDif;
            MatchColor := j;
          end;
        end;
        HeavyDarkColorLevel[n, i] := MatchColor;
      end;
    end;
    for n := 0 to 30 do begin
      for i := 0 to 255 do begin
        pal1 := ctable[i];
        pal1.rgbRed := _MIN(Round(pal1.rgbRed * (n * 3 + 47) / 140), 255);
        pal1.rgbGreen := _MIN(Round(pal1.rgbGreen * (n * 3 + 47) / 140), 255);
        pal1.rgbBlue := _MIN(Round(pal1.rgbBlue * (n * 3 + 47) / 140), 255);
        MinDif := 768;
        MatchColor := 0;
        for j := 0 to 255 do begin
          pal2 := ctable[j];
          ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
            Abs(pal2.rgbGreen - pal1.rgbGreen) +
            Abs(pal2.rgbBlue - pal1.rgbBlue);
          if ColDif < MinDif then begin
            MinDif := ColDif;
            MatchColor := j;
          end;
        end;
        LightDarkColorLevel[n, i] := MatchColor;
      end;
    end;
    for n := 0 to 30 do begin
      for i := 0 to 255 do begin
        pal1 := ctable[i];
        pal1.rgbRed := _MIN(Round(pal1.rgbRed * (n * 3 + 120) / 214), 255);
        pal1.rgbGreen := _MIN(Round(pal1.rgbGreen * (n * 3 + 120) / 214), 255);
        pal1.rgbBlue := _MIN(Round(pal1.rgbBlue * (n * 3 + 120) / 214), 255);
        MinDif := 768;
        MatchColor := 0;
        for j := 0 to 255 do begin
          pal2 := ctable[j];
          ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
            Abs(pal2.rgbGreen - pal1.rgbGreen) +
            Abs(pal2.rgbBlue - pal1.rgbBlue);
          if ColDif < MinDif then begin
            MinDif := ColDif;
            MatchColor := j;
          end;
        end;
        DengunColorLevel[n, i] := MatchColor;
      end;
    end;
    for n := 31 to 255 do
      for i := 0 to 255 do begin
        HeavyDarkColorLevel[n, i] := HeavyDarkColorLevel[30, i];
        LightDarkColorLevel[n, i] := LightDarkColorLevel[30, i];
        DengunColorLevel[n, i] := DengunColorLevel[30, i];
      end;
  end;
begin
  BuildMix;
  BuildAnti;
  BuildColorLevels;
end;

procedure BuildColorLevels(ctable: TRGBQuads);
var
  n, i, j, MinDif, ColDif: integer;
  pal1, pal2: TRGBQuad;
  MatchColor: byte;
begin
  BrightColorLevel[0] := 0;

  for i := 1 to 255 do begin
    pal1 := ctable[i];
    pal1.rgbRed := _MIN(Round(pal1.rgbRed * 1.3), 255);
    pal1.rgbGreen := _MIN(Round(pal1.rgbGreen * 1.3), 255);
    pal1.rgbBlue := _MIN(Round(pal1.rgbBlue * 1.3), 255);
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    BrightColorLevel[i] := MatchColor;
  end;
  GrayScaleLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := n; //Round(pal1.rgbRed * (n*3+25) / 118);
    pal1.rgbGreen := n; //Round(pal1.rgbGreen * (n*3+25) / 118);
    pal1.rgbBlue := n; //Round(pal1.rgbBlue * (n*3+25) / 118);
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    GrayScaleLevel[i] := MatchColor;
  end;
  BlackColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := Round((pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) / 3 * 0.6);
    pal1.rgbRed := n; //_MAX(8, Round(pal1.rgbRed * 0.7));
    pal1.rgbGreen := n; //_MAX(8, Round(pal1.rgbGreen * 0.7));
    pal1.rgbBlue := n; //_MAX(8, Round(pal1.rgbBlue * 0.7));
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    BlackColorLevel[i] := MatchColor;
  end;
  WhiteColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := _MIN(Round((pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) / 3 * 1.6), 255);
    pal1.rgbRed := n; //_MAX(8, Round(pal1.rgbRed * 0.7));
    pal1.rgbGreen := n; //_MAX(8, Round(pal1.rgbGreen * 0.7));
    pal1.rgbBlue := n; //_MAX(8, Round(pal1.rgbBlue * 0.7));
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    WhiteColorLevel[i] := MatchColor;
  end;
  RedishColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := n;
    pal1.rgbGreen := 0;
    pal1.rgbBlue := 0;
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    RedishColorLevel[i] := MatchColor;
  end;
  GreenColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := 0;
    pal1.rgbGreen := n;
    pal1.rgbBlue := 0;
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    GreenColorLevel[i] := MatchColor;
  end;
  YellowColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := n;
    pal1.rgbGreen := n;
    pal1.rgbBlue := 0;
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    YellowColorLevel[i] := MatchColor;
  end;
  BlueColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    //n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 5;
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := 0; //_MIN(Round(n*1.3), 255);
    pal1.rgbGreen := 0; //_MIN(Round(n), 255);
    pal1.rgbBlue := n; //_MIN(Round(n*1.3), 255);
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    BlueColorLevel[i] := MatchColor;
  end;
  FuchsiaColorLevel[0] := 0;
  for i := 1 to 255 do begin
    pal1 := ctable[i];
    n := (pal1.rgbRed + pal1.rgbGreen + pal1.rgbBlue) div 3;
    pal1.rgbRed := n;
    pal1.rgbGreen := 0;
    pal1.rgbBlue := n;
    MinDif := 768;
    MatchColor := 0;
    for j := 1 to 255 do begin
      pal2 := ctable[j];
      ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
        Abs(pal2.rgbGreen - pal1.rgbGreen) +
        Abs(pal2.rgbBlue - pal1.rgbBlue);
      if ColDif < MinDif then begin
        MinDif := ColDif;
        MatchColor := j;
      end;
    end;
    FuchsiaColorLevel[i] := MatchColor;
  end;
end;




procedure SaveNearestIndex(flname: string);
var
  nih: TNearestIndexHeader;
  fhandle: integer;
begin
  nih.Title := 'WEMADE Entertainment Inc.';
  nih.IndexCount := Sizeof(Color256Mix);
  if FileExists(flname) then begin
    fhandle := FileOpen(flname, fmOpenWrite or fmShareDenyNone);
  end else
    fhandle := FileCreate(flname);
  if fhandle > 0 then begin
    FileWrite(fhandle, nih, Sizeof(TNearestIndexHeader));
    FileWrite(fhandle, Color256Mix, Sizeof(Color256Mix));
    FileWrite(fhandle, Color256Anti, Sizeof(Color256Anti));
    FileWrite(fhandle, HeavyDarkColorLevel, Sizeof(HeavyDarkColorLevel));
    FileWrite(fhandle, LightDarkColorLevel, Sizeof(LightDarkColorLevel));
    FileWrite(fhandle, DengunColorLevel, Sizeof(DengunColorLevel));
    FileClose(fhandle);
  end;
end;

function LoadNearestIndex(flname: string): Boolean;
var
  nih: TNearestIndexHeader;
  fhandle, rsize: integer;
begin
  Result := FALSE;
  if FileExists(flname) then begin
    fhandle := FileOpen(flname, fmOpenRead or fmShareDenyNone);
    if fhandle > 0 then begin
      FileRead(fhandle, nih, Sizeof(TNearestIndexHeader));
      if nih.IndexCount = Sizeof(Color256Mix) then begin
        Result := TRUE;
        rsize := 256 * 256;
        if rsize <> FileRead(fhandle, Color256Mix, Sizeof(Color256Mix)) then Result := FALSE;
        if rsize <> FileRead(fhandle, Color256Anti, Sizeof(Color256Anti)) then Result := FALSE;
        if rsize <> FileRead(fhandle, HeavyDarkColorLevel, Sizeof(HeavyDarkColorLevel)) then Result := FALSE;
        if rsize <> FileRead(fhandle, LightDarkColorLevel, Sizeof(LightDarkColorLevel)) then Result := FALSE;
        if rsize <> FileRead(fhandle, DengunColorLevel, Sizeof(DengunColorLevel)) then Result := FALSE;
      end;
      FileClose(fhandle);
    end;
  end;
end;

procedure FogCopy (PSource: Pbyte; ssx, ssy, swidth, sheight: integer;
                   PDest: Pbyte; ddx, ddy, dwidth, dheight, maxfog: integer);
var
   i, j, n, k, row, srclen, scount, si, di, srcheight, spitch, dpitch: integer;
   sptr, dptr: PByte;
begin
   if (PSource = nil) or (pDest = nil) then exit; 
   spitch := swidth;
   dpitch := dwidth;
   if ddx < 0 then begin
      ssx := ssx - ddx;
      swidth := swidth + ddx;
      ddx := 0;
   end;
   if ddy < 0 then begin
      ssy := ssy - ddy;
      sheight := sheight + ddy;
      ddy := 0;
   end;
   srclen := _MIN(swidth, dwidth-ddx);
   srcheight := _MIN(sheight, dheight-ddy);
   if (srclen <= 0) or (srcheight <= 0) then exit;

   asm
         mov   row, 0
      @@NextRow:
         mov   eax, row
         cmp   eax, srcheight
         jae   @@Finish

         mov   esi, psource
         mov   eax, ssy
         add   eax, row
         mov   ebx, spitch
         imul  eax, ebx
         add   eax, ssx
         add   esi, eax          //sptr

         mov   edi, pdest
         mov   eax, ddy
         add   eax, row
         mov   ebx, dpitch
         imul  eax, ebx
         add   eax, ddx
         add   edi, eax          //dptr

         mov   ebx, srclen
      @@FogNext:
         cmp   ebx, 0
         jbe   @@FinOne
         cmp   ebx, 8
         jb    @@FinOne   //@@EageNext

         db $0F,$6F,$06           /// movq  mm0, [esi]
         db $0F,$6F,$0F           /// movq  mm1, [edi]
         db $0F,$FE,$C8           /// paddd mm1, mm0
         db $0F,$7F,$0F           /// movq [edi], mm1

         sub   ebx, 8
         add   esi, 8
         add   edi, 8
         jmp   @@FogNext
      @@FinOne:
         inc   row
         jmp   @@NextRow

      @@Finish:
         db $0F,$77               /// emms
   end;
end;

procedure DrawFog (ssuf: TDirectDrawSurface; fogmask: PByte; fogwidth: integer);
var
   i, j, idx, row, n, count: integer;
   ddsd: TDDSurfaceDesc;
   sptr, mptr, pmix: PByte;
   bitindex, scount, dcount, srclen, destlen, srcheight: integer;
   lpitch: integer;
   src, msk: array[0..7] of byte;
   pSrc, psource, pColorLevel: Pbyte;
begin
   if ssuf.Width > g_FScreenWidth + 100 then exit;
   case DarkLevel of
      0: pColorLevel := @HeavyDarkColorLevel;
      1: pColorLevel := @LightDarkColorLevel;
      2: pColorLevel := @DengunColorLevel;
      else exit;
   end;

   try
      ddsd.dwSize := SizeOf(ddsd);
      ssuf.Lock (TRect(nil^), ddsd);
      srclen := _MIN(ssuf.Width, fogwidth);
      pSrc := @src;
      srcheight := ssuf.Height;
      lpitch := ddsd.lPitch;
      psource := ddsd.lpSurface;

      asm
            mov   row, 0
         @@NextRow:
            mov   ebx, row
            mov   eax, srcheight
            cmp   ebx, eax
            jae   @@DrawFogFin

            mov   esi, psource      //esi = ddsd.lpSurface;
            mov   eax, lpitch
            mov   ebx, row
            imul  eax, ebx
            add   esi, eax

            mov   edi, fogmask      //edi = fogmask
            mov   eax, fogwidth
            mov   ebx, row
            imul  eax, ebx
            add   edi, eax

            mov   ecx, srclen
            mov   edx, pColorLevel

         @@NextByte:
            cmp   ecx, 0
            jbe   @@Finish

            movzx eax, [edi].byte   //fogmask
            ///cmp   eax, 30
            ///ja    @@SkipByte
            imul  eax, 256
            movzx ebx, [esi].byte   //ddsd.lpSurface;
            add   eax, ebx
            mov   al, [edx+eax].byte //pColorLevel
            mov   [esi].byte, al
         ///@@SkipByte:
            dec   ecx
            inc   esi
            inc   edi
            jmp   @@NextByte

         @@Finish:
            inc   row
            jmp   @@NextRow

         @@DrawFogFin:
            db $0F,$77               /// emms
      end;
   finally
      ssuf.UnLock();
   end;
end;

procedure MakeDark (ssuf: TDirectDrawSurface; darklevel: integer);
begin
  if not darklevel in [1..30] then Exit;
   ssuf.SystemMemory := TRUE;
   ssuf.FillRectAlpha(ssuf.ClientRect,0,round((30-darklevel)*255/30));
end;


procedure DrawBlend(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; blendmode: integer);
begin
  DrawBlendEx(dsuf, x, y, ssuf, 0, 0, ssuf.width, ssuf.height, blendmode);
end;

procedure DrawBlendEx(DstSurf: TDirectDrawSurface; DstX, DstY: Integer; SrcSurf: TDirectDrawSurface; SrcSurfLeft, SrcSurfTop, SrcSurfWidth, SrcSurfHeight, BlendMode: Integer);
var
  SrcDDSD, DstDDSD: TDDSurfaceDesc;
  SrcBits, DstBits, SrcP, DstP: PDWord;
  SrcBits2, DstBits2, SrcP2, DstP2: PWord;
  w: Word;
  X, Y: Integer;
  SrcRect: TRect;
  srcwidth, srctop, srcbottom, srcleft, srcheight: Integer;
  a1,a2,a3,b1,b2,b3: Word;
  MASKPointer: Pointer;
begin
    if (DstSurf = nil) or (SrcSurf = nil) then Exit;
    if (DstSurf.Canvas = nil) or (SrcSurf.Canvas = nil) then Exit;

    if DstX >= DstSurf.Width then Exit;
    if DstY >= DstSurf.Height then Exit;

     if DstX < 0 then begin
        srcleft := -DstX;
        srcwidth := SrcSurfWidth + DstX;
        DstX := 0;
     end else begin
        srcleft := SrcSurfLeft;
        srcwidth := SrcSurfWidth;
     end;
     if DstY < 0 then begin
        srctop := -DstY;
        srcbottom := SrcSurfHeight;
        DstY := 0;
     end else begin
        srctop := SrcSurfTop;
        srcbottom := srctop + SrcSurfHeight;
     end;   
     if srcleft + srcwidth > SrcSurf.Width then srcwidth := SrcSurf.Width-srcleft;
     if srcbottom > SrcSurf.Height then
        srcbottom := SrcSurf.Height;//-srcheight;
     if DstX + srcwidth > DstSurf.Width then srcwidth := (DstSurf.Width-DstX) div 4 * 4;
     if DstY + srcbottom - srctop > DstSurf.Height then
        srcbottom := DstSurf.Height-DstY+srctop;
     if (DstX+srcwidth) * (DstY+srcbottom-srctop) > DstSurf.Width * DstSurf.Height then //烙矫..
        srcbottom := srctop + (srcbottom-srctop) div 2;
     if (srcwidth <= 0) or (srcbottom <= 0) or (srcleft >= SrcSurf.Width) or (srctop >= SrcSurf.Height) then exit;
     //  if srcWidth > g_FScreenWidth + 100 then exit;
     if srcWidth > g_FScreenWidth + 100 then exit;

    try
      if g_BitCountMode = 0 then begin
      SrcDDSD.dwSize := SizeOf(SrcDDSD);
      DstDDSD.dwSize := SizeOf(DstDDSD);
      DstSurf.Lock(TRect(nil^), DstDDSD);
      SrcSurf.Lock(TRect(nil^), SrcDDSD);
      SrcBits2 := SrcDDSD.lpSurface;
      DstBits2 := DstDDSD.lpSurface;
      if BlendMode = 1 then begin
        for Y := srctop to srcbottom - 1 do begin
          DstP2 := PWord(Integer(DstBits2) + (Y + DstY - srctop) * DstDDSD.lPitch + DstX * 2);
          SrcP2 := PWord(Integer(SrcBits2) + SrcDDSD.lPitch * Y + srcleft * 2);
          for X := {srcleft} 0 to srcwidth - 1 do begin
            if Srcp2^ > 0 then begin
              a1 := ((DstP2^ and $F800) shr 11);
              a2 := ((DstP2^ and $7E0) shr 5);
              a3 := (DstP2^ and $1F);
              b1 := ((SrcP2^ and $F800) shr 11);
              b2 := ((SrcP2^ and $7E0) shr 5);
              b3 := (SrcP2^ and $1F);
              a1 := _MIN(31, a1 + (31 - a1) * b1 div 31);
              a2 := _MIN(63, a2 + (63 - a2) * b2 div 63);
              a3 := _MIN(31, a3 + (31 - a3) * b3 div 31);
              DstP2^ := (a1 shl 11) or (a2 shl 5) or a3;
            end;
            DstP2 := PWord(Integer(DstP2) + 2);
            SrcP2 := PWord(Integer(SrcP2) + 2);
          end;
        end;
      end else begin
        for Y := srctop to srcbottom - 1 do begin
          DstP2 := PWord(Integer(DstBits2) + (Y + DstY - srctop) * DstDDSD.lPitch + DstX * 2);
          SrcP2 := PWord(Integer(SrcBits2) + SrcDDSD.lPitch * Y + srcleft * 2);
          for X := {srcleft} 0 to srcwidth - 1 do begin
            if Srcp2^ > 0 then begin
              a1 := ((DstP2^ and $F800) shr 11) div 2;
              a2 := ((DstP2^ and $7E0) shr 5) div 2;
              a3 := (DstP2^ and $1F) div 2;
              b1 := ((SrcP2^ and $F800) shr 11) div 2;
              b2 := ((SrcP2^ and $7E0) shr 5) div 2;
              b3 := (SrcP2^ and $1F) div 2;
              a1 := a1 + b1;
              a2 := a2 + b2;
              a3 := a3 + b3;
              DstP2^ := (a1 shl 11) or (a2 shl 5) or a3;
            end;
            DstP2 := PWord(Integer(DstP2) + 2);
            SrcP2 := PWord(Integer(SrcP2) + 2);
          end;
        end;
      end;

      end else begin
      SrcDDSD.dwSize := SizeOf(SrcDDSD);
      DstDDSD.dwSize := SizeOf(DstDDSD);
      DstSurf.Lock(TRect(nil^), DstDDSD);
      SrcSurf.Lock(TRect(nil^), SrcDDSD);
      SrcBits := SrcDDSD.lpSurface;
      DstBits := DstDDSD.lpSurface;
      //if BlendMode = 0 then begin
      if BlendMode = 1 then begin
        for Y :=  srctop to srcbottom - 1 do begin
          DstP := PDWord(Integer(DstBits) + (Y + DstY- srctop) * DstDDSD.lPitch + DstX * 4);
          SrcP := PDWord(Integer(SrcBits) + SrcDDSD.lPitch * Y + srcleft * 4);
          for X := 0 to srcwidth - 1 do begin
            if Srcp^>0 then begin
             a1:=((DstP^ and $FF0000) shr 16);
             a2:=((DstP^ and $FF00) shr 8);
             a3:=(DstP^ and $FF);
             b1:=((SrcP^ and $FF0000) shr 16);
             b2:=((SrcP^ and $FF00) shr 8);
             b3:=(SrcP^ and $FF);
             a1 := _MIN(255, a1  + (255-a1) * b1 div 255);
             a2 := _MIN(255, a2  + (255-a2) * b2 div 255);
             a3 := _MIN(255, a3  + (255-a3) * b3 div 255);
             DstP^ := (a1 shl 16) or (a2 shl 8) or a3;
            end;
            DstP := PDWord(Integer(DstP) + 4);
            SrcP := PDWord(Integer(SrcP) + 4);
          end;
        end;
      end else begin
        for Y :=  srctop to srcbottom - 1 do begin
          DstP := PDWord(Integer(DstBits) + (Y + DstY- srctop) * DstDDSD.lPitch + DstX * 4);
          SrcP := PDWord(Integer(SrcBits) + SrcDDSD.lPitch * Y + srcleft * 4);
          for X := 0 to srcwidth - 1 do begin
            if Srcp^>0 then begin
               a1:=((DstP^ and $FF0000) shr 16) div 2;
               a2:=((DstP^ and $FF00) shr 8) div 2;
               a3:=(DstP^ and $FF) div 2;
               b1:=((SrcP^ and $FF0000) shr 16) div 2;
               b2:=((SrcP^ and $FF00) shr 8) div 2;
              b3:=(SrcP^ and $FF) div 2;
              a1 := a1 + b1;
              a2 := a2 + b2;
              a3 := a3 + b3;
              DstP^ := (a1 shl 16) or (a2 shl 8) or a3;
            end;
            DstP := PDWord(Integer(DstP) + 4);
            SrcP := PDWord(Integer(SrcP) + 4);
          end;
        end;
      end;
      end;
    finally
      SrcSurf.UnLock();
      DstSurf.UnLock();
    end;
end;

procedure DrawBlend3(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; blendmode: integer);
begin
  DrawBlendEx3(dsuf, x, y, ssuf, 0, 0, ssuf.width, ssuf.height, blendmode);
end;


procedure DrawBlendEx3(DstSurf: TDirectDrawSurface; DstX, DstY: Integer; SrcSurf: TDirectDrawSurface; SrcSurfLeft, SrcSurfTop, SrcSurfWidth, SrcSurfHeight, BlendMode: Integer);
var
  SrcDDSD, DstDDSD: TDDSurfaceDesc;
  SrcBits, DstBits, SrcP, DstP: PDWord;
  w: Word;
  X, Y: Integer;
  SrcRect: TRect;
  srcwidth, srctop, srcbottom, srcleft, srcheight: Integer;
  a1,a2,a3,b1,b2,b3: Word;
  MASKPointer: Pointer;
begin
    if DstX >= DstSurf.Width then exit;
    if DstY >= DstSurf.Height then exit;
    if DstX < 0 then begin
      srcwidth := SrcSurfWidth + DstX;
      srcleft := SrcSurfWidth - srcwidth;
      DstX := 0;
    end else begin
      srcleft := SrcSurfLeft;
      srcwidth := SrcSurfWidth;
    end;
    if DstY < 0 then begin
      srcheight := SrcSurfHeight + DstY;
      srctop := SrcSurfHeight - srcheight;
      DstY := 0;
    end else begin
      srctop := SrcSurfTop;
      srcheight := SrcSurfHeight;
    end;
    if (srcwidth <= 0) or (srcheight <= 0) or (srcleft >= SrcSurf.Width) or (srctop >= SrcSurf.Height) then exit;
    if blendMode = 1 then
      DstSurf.DrawAdd(rect(DstX, DstY,DstX+srcwidth, DstY+srcheight),rect(srcleft,srctop,srcleft+srcwidth,srctop+srcheight),SrcSurf,true, 150)
    else
    if blendMode = 2 then
      DstSurf.DrawAdd(rect(DstX, DstY,DstX+srcwidth, DstY+srcheight),rect(srcleft,srctop,srcleft+srcwidth,srctop+srcheight),SrcSurf,true, 110)
    else
      DstSurf.DrawAlpha(rect(DstX, DstY,DstX+srcwidth, DstY+srcheight),rect(srcleft,srctop,srcleft+srcwidth,srctop+srcheight),SrcSurf,true, 132);
end;



procedure DrawBlend2 (dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; ralpha: integer);
begin          
  DrawBlendalpha(dsuf, x, y, ssuf, 0, 0, ssuf.width, ssuf.height, ralpha);
end;

procedure DrawBlendalpha(dsuf: TDirectDrawSurface; x, y: integer; ssuf: TDirectDrawSurface; ssufleft, ssuftop, ssufwidth, ssufheight, Alpha: integer);
var
 srcleft,srctop,srcwidth,srcheight:Integer;
begin
   if x >= dsuf.Width then exit;
   if y >= dsuf.Height then exit;
   if x < 0 then begin
    srcwidth := ssufwidth + X;
    srcleft := ssufwidth - srcwidth;
    X := 0;
   end else begin
    srcleft := ssufleft;
    srcwidth := ssufwidth;
   end;
   if Y < 0 then begin
    srcheight := ssufheight + Y;
    srctop := ssufheight - srcheight;
    Y := 0;
   end else begin
    srctop := ssuftop;
    srcheight := ssufheight;
   end;
   if (srcwidth <= 0) or (srcheight <= 0) or (srcleft >= ssuf.Width) or (srctop >= ssuf.Height) then exit;

   dsuf.DrawAlpha(rect(x, y,x+srcwidth, y+srcheight),rect(srcleft,srctop,srcleft+srcwidth,srctop+srcheight),ssuf,true, Alpha);
end;

procedure DrawEffect(x, y, width, height: integer; ssuf: TDirectDrawSurface; eff: TColorEffect);
var
   i, j, n,srclen: integer;
   sddsd: TDDSURFACEDESC;
   wptr:PWord;
   b1,b2,b3:byte;
   dwPtr:PDWord;
begin
   if eff = ceNone then Exit;
  // case ColorDeep of
   if g_BitCountMode = 0 then begin
        case eff of
          ceBright: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := _Min(31, round(((wptr^ and $F800) shr 11) * 1.3));
                    b2 := _Min(63, round(((wptr^ and $7E0) shr 5) * 1.3));
                    b3 := _Min(31, round((wptr^ and $1F) * 1.3));
                    wptr^ := (b1 shl 11) or (b2 shl 5) or b3;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceOrange :begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                wptr :=PWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  b1 := _Min(255,round(((wptr^ and $F800) shr 16) * 1.2));
                  b2 := _Min(100,round(((wptr^ and $7E0) shr 8) div 2));
                  b3 := _Min(0,round((wptr^ and $1F) * 1));
                  wptr^ := (b1 shl 16) or (b2 shl 8) or b3;
                  wptr := PWord(integer(wptr) + 2);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
          end;
          ceDarkness:begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                wptr :=PWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  b1 := _Min(150, round(((wptr^ and $F800) shr 16) * 1));
                  b2 := _Min(255, round(((wptr^ and $7E0) shr 8) * 1));
                  b3 := _Min(150, round((wptr^ and $1F) * 1));
                  wptr^ := (b1 shl 16) or (b2 shl 8) or b3;
                  wptr := PWord(integer(wptr) + 2);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
          end;
          ceAqua :begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                wptr :=PWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  b1 := _Min(0, round(((wptr^ and $F800) shr 16) * 1));
                  b2 := _Min(255, round(((wptr^ and $7E0) shr 8) * 0.6));
                  b3 := _Min(255, round((wptr^ and $1F) * 0.6));
                  wptr^ := (b1 shl 16) or (b2 shl 8) or b3;
                  wptr := PWord(integer(wptr)+2);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
          end;
          ceGrayScale: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(LongInt(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3) div 4;
                    wptr^ := (n shl 11) or (n shl 6) or n;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceBlack: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := round(((b1 + b2 + b3) div 4) * 0.6);
                    wptr^ := (n shl 11) or (n shl 6) or n;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceWhite: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := round(((b1 + b2 + b3) div 4) * 1.6);
                    wptr^ := (n shl 11) or (n shl 6) or n;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceRed: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3);
                    if (n < 4) and (n > 0) then
                      wptr^ := 1
                    else wptr^ := (n div 4) shl 11;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceGreen: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3);
                    if (n < 4) and (n > 0) then
                      wptr^ := 1
                    else wptr^ := (n div 4) shl 6;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceBlue: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3);
                    if (n < 4) and (n > 0) then
                      wptr^ := 1
                    else wptr^ := n div 4;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceYellow: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3);
                    if (n < 4) and (n > 0) then
                      wptr^ := 1
                    else n := n div 4;
                    wptr^ := (n shl 11) or (n shl 6);
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
          ceFuchsia: begin
              try
                sddsd.dwSize := SizeOf(sddsd);
                ssuf.Lock(TRect(nil^), sddsd);
                srclen := width;
                for i := 0 to height - 1 do begin
                  wptr := PWord(integer(sddsd.lpSurface) + (y + i) * sddsd.lPitch + x);
                  for j := 0 to srclen - 1 do
                  begin
                    b1 := (wptr^ and $F800) shr 11;
                    b2 := (wptr^ and $7E0) shr 5;
                    b3 := wptr^ and $1F;
                    n := (b1 + b2 + b3) div 4;
                    wptr^ := (n shl 11) or n;
                    wptr := PWord(integer(wptr) + 2);
                  end;
                end;
              finally
                ssuf.UnLock;
              end;
            end;
        end;
   end else begin
       case eff of
         ceBright :begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=_Min(255,round((dwPtr^ shr 16)*1.3));
                   b2:=_Min(255,round(((dwPtr^ and $FF00) shr 8)*1.3));
                   b3:=_Min(255,round((dwPtr^ and $FF)*1.3));
                   dwPtr^:=(b1 shl 16) or (b2 shl 8) or b3;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;


         ceOrange :begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=_Min(255,round((dwPtr^ shr 16)*1.2));
                   b2:=_Min(100,round(((dwPtr^ and $FF00) shr 8) div 2));
                   b3:=_Min(0,round((dwPtr^ and $FF)*1));
                   dwPtr^:=(b1 shl 16) or (b2 shl 8) or b3;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;
         ceDarkness:begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=_Min(150,round((dwPtr^ shr 16)*1));
                   b2:=_Min(255,round(((dwPtr^ and $FF00) shr 8)*1));
                   b3:=_Min(150,round((dwPtr^ and $FF)*1));
                   dwPtr^:=(b1 shl 16) or (b2 shl 8) or b3;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;
         ceLightPurple :begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=_Min(181,round((dwPtr^ shr 16) div 2));
                   b2:=_Min(0,round(((dwPtr^ and $FF00) shr 8)*1));
                   b3:=_Min(255,round((dwPtr^ and $FF) div 2 * 1.6));
                   dwPtr^:=(b1 shl 16) or (b2 shl 8) or b3;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;
         ceAqua :begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=_Min(0,round((dwPtr^ shr 16)*1));
                   b2:=_Min(255,round(((dwPtr^ and $FF00) shr 8)*0.6));
                   b3:=_Min(255,round((dwPtr^ and $FF)*0.6));
                   dwPtr^:=(b1 shl 16) or (b2 shl 8) or b3;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;

         ceGrayScale:begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (LongInt(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                 else begin
                   b1:=dwPtr^ shr 16;
                   b2:=(dwPtr^ and $FF00) shr 8;
                   b3:=dwPtr^ and $FF;
                   n:=(b1+b2+b3) div 3;
                   dwPtr^:=(n shl 16) or (n shl 8) or n;
                 end;
                 dwPtr:=PDWord(integer(dwPtr)+4);
               end;
             end;
           finally
             ssuf.UnLock;
           end;
         end;
         ceBlack:begin
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
             for i:=0 to height-1 do begin
               dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
               for j:=0 to srclen -1 do
               begin
                 if dwPtr^=$FFFFFFF then
                   dwPtr^:=0
                  else begin
                    b1:=dwPtr^ shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:=dwPtr^ and $FF;
                    n:=round(((b1+b2+b3) div 3)*0.6);
                    dwPtr^:=(n shl 16) or (n shl 8) or n;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
         end;
         ceWhite:begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=dwPtr^  shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:=dwPtr^ and $FF;
                    n:=round(((b1+b2+b3) div 3)*1.6);
                    dwPtr^:=(n shl 16) or (n shl 8) or n;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
         end;
         ceRed:begin 
           try
             sddsd.dwSize := SizeOf(sddsd);
             ssuf.Lock (TRect(nil^), sddsd);
             srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=(dwPtr^ and $FF0000) shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:= dwPtr^ and $FF;
                    n:=(b1+b2+b3) div 3;
                    dwPtr^:=n shl 16;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
           finally
              ssuf.UnLock;
           end;
         end;
         ceGreen:begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=(dwPtr^ and $FF0000) shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:= dwPtr^ and $FF;
                    n:=(b1+b2+b3) div 3;
                    dwPtr^:=n shl 8;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
         end;
         ceBlue:begin
            try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=(dwPtr^ and $FF0000) shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:= dwPtr^ and $FF;
                    dwPtr^:=(b1+b2+b3) div 3;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
            finally
              ssuf.UnLock;
            end;
         end;
         ceYellow:begin
           try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=(dwPtr^ and $FF0000) shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:= dwPtr^ and $FF;
                    n:=(b1+b2+b3) div 3;
                    dwPtr^:=(n shl 16) or (n shl 8);
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
           finally
              ssuf.UnLock;
           end;
         end;
         ceFuchsia:begin
           try
              sddsd.dwSize := SizeOf(sddsd);
              ssuf.Lock (TRect(nil^), sddsd);
              srclen := width;
              for i:=0 to height-1 do begin
                dwPtr :=PDWord (integer(sddsd.lpSurface) + (y+i) * sddsd.lPitch + x);
                for j:=0 to srclen -1 do
                begin
                  if dwPtr^=$FFFFFFF then
                    dwPtr^:=0
                  else begin
                    b1:=(dwPtr^ and $FF0000) shr 16;
                    b2:=(dwPtr^ and $FF00) shr 8;
                    b3:= dwPtr^ and $FF;
                    n:=(b1+b2+b3) div 3;
                    dwPtr^:=(n shl 16) or n;
                  end;
                  dwPtr:=PDWord(integer(dwPtr)+4);
                end;
              end;
           finally
              ssuf.UnLock;
           end;
         end;
       end;
   end;
end;

procedure BuildRealRGB(ctable: TRGBQuads);
var
   MinDif, ColDif: Integer;
   MatchColor: Byte;
   pal0, pal1, pal2: TRGBQuad;
   I, j, n: integer;
begin
  for I:=0 to 255 do begin
     pal0 := ctable[i];
     for j:=0 to 255 do begin
        pal1 := ctable[j];
        pal1.rgbRed := pal0.rgbRed;
        pal1.rgbGreen := pal0.rgbGreen;
        pal1.rgbBlue := pal0.rgbBlue;
        MinDif := 1;
        MatchColor := 0;
        for n:=0 to 255 do begin
           pal2 := ctable[n];
           ColDif := Abs(pal2.rgbRed - pal1.rgbRed) +
                     Abs(pal2.rgbGreen - pal1.rgbGreen) +
                     Abs(pal2.rgbBlue - pal1.rgbBlue);
           if ColDif < MinDif then begin
              MinDif := ColDif;
              MatchColor := n;
           end;
        end;
        Color256real[i, j] := MatchColor;
     end;
  end;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: cliUtil.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.
