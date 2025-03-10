unit WIL;

interface

uses
  Windows, Classes, Graphics, SysUtils, DXDraws, DXClass, Dialogs,
  DirectX, DIB, wmUtil, HUtil32;

var
  g_boUseDIBSurface  :Boolean = TRUE;
  g_boWilNoCache     :Boolean = FALSE;
  g_n4CBCEC          :Integer = 20020;//4CBCEC
  g_n4CBCF0          :Integer = 20021;//4CBCF0
type
  TLibType = (ltLoadBmp, ltLoadMemory, ltLoadMunual, ltUseCache);

   TDxImageArr   = array[0..MaxListSize div 4] of TDxImage;
   PTDxImageArr  = ^TDxImageArr;

   TWMImages = class (TComponent)
   private
      FFileName: String;              //0x24
      FImageCount: integer;           //0x28
      FLibType: TLibType;             //0x2C
      FDxDraw: TDxDraw;               //0x30
      FDDraw: TDirectDraw;            //0x34
      FMaxMemorySize: integer;        //0x38
      btVersion:Byte;                 //0x3C
      FAppr:Word;
      FInitized: boolean;
      FBitFormat:TPixelFormat;
      FBytesPerPixels:byte;

      procedure LoadIndex (idxfile: string);
      procedure LoadDxImage (position: integer; pdximg: PTDxImage);
      procedure FreeOldMemorys;
      function  FGetImageSurface (index: integer): TDirectDrawSurface;
      procedure FSetDxDraw (fdd: TDxDraw);
   protected
      lsDib: TDib;              //0x40
      m_dwMemChecktTick: LongWord;   //0x44
   public
      m_ImgArr    :pTDxImageArr;     //0x48
      m_IndexList :TList;         //0x50
      m_FileStream: TFileStream;      //0x54
      MainPalette: TRgbQuads;
      BitCount :Byte;
      constructor Create (AOwner: TComponent); override;
      destructor Destroy; override;

      procedure Initialize;
      procedure Finalize;
      procedure ClearCache;
      procedure LoadPalette;
      function  GetImage (index: integer; var px, py: integer): TDirectDrawSurface;
      function  GetCachedImage (index: integer; var px, py: integer): TDirectDrawSurface;
      function  GetCachedSurface (index: integer): TDirectDrawSurface;
      property Images[index: integer]: TDirectDrawSurface read FGetImageSurface;
      property DDraw: TDirectDraw read FDDraw write FDDraw;
   published
      property FileName: string read FFileName write FFileName;
      property ImageCount: integer read FImageCount;
      property DxDraw: TDxDraw read FDxDraw write FSetDxDraw;
      property LibType: TLibType read FLibType write FLibType;
      property MaxMemorySize: integer read FMaxMemorySize write FMaxMemorySize;
      property Appr:Word read FAppr write FAppr;
   end;
procedure ChangeDIBPixelFormat(adib: TDIB; pf: TPixelFormat);

procedure Register;

implementation

//uses
//   ClMain;//¼ÇÂ¼µ÷ÊÔÐÅÏ¢

procedure Register;
begin
   RegisterComponents('MirGame', [TWmImages]);
end;

procedure ChangeDIBPixelFormat(adib: TDIB; pf: TPixelFormat);
begin
  if pf = pf8bit then
  begin
    with aDib.PixelFormat do
    begin
      RBitMask := $FF0000;
      GBitMask := $00FF00;
      BBitMask := $0000FF;
    end;
    aDib.BitCount := 8;
  end
  else
    if pf = pf16bit then
    begin
      with aDib.PixelFormat do
      begin
        RBitMask := $F800;
        GBitMask := $07E0;
        BBitMask := $001F;
      end;
      aDib.BitCount := 16;
    end
    else
      if pf = pf24bit then
      begin
        with aDib.PixelFormat do
        begin
          RBitMask := $FF0000;
          GBitMask := $00FF00;
          BBitMask := $0000FF;
        end;
        aDib.BitCount := 24;
      end
      else
        if pf = pf32Bit then
        begin
          with aDib.PixelFormat do
          begin
            RBitMask := $FF0000;
            GBitMask := $00FF00;
            BBitMask := $0000FF;
          end;
          aDib.BitCount := 32;
        end;
end;

constructor TWMImages.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   FFileName := '';
   FLibType := ltUseCache;
   FImageCount := 0;

   FDDraw := nil;
   FDxDraw := nil;
   m_FileStream := nil;

   m_ImgArr := nil;
   m_IndexList := TList.Create;
   lsDib := TDib.Create;
   lsDib.BitCount := 8;

   m_dwMemChecktTick := GetTickCount;
   btVersion:=0;
   Finitized := false;
end;

destructor TWMImages.Destroy;
begin
   FreeAndNil(m_IndexList);
   if m_FileStream <> nil then FreeAndNil(m_FileStream);
   lsDib.Free;
   inherited Destroy;
end;

procedure TWMImages.Initialize;
var
  Idxfile: String;
  Header :TWMImageHeader;
begin
   if not (csDesigning in ComponentState) then begin
     if Finitized then Finalize;
      if FFileName = '' then begin
         raise Exception.Create ('FileName not assigned..');
         exit;
      end;
      if (LibType <> ltLoadBmp) and (FDDraw = nil) then begin
         raise Exception.Create ('DDraw not assigned..');
         exit;
      end;
      if FileExists (FFileName) then begin
         if m_FileStream = nil then m_FileStream := TFileStream.Create (FFileName, fmOpenRead or fmShareDenyNone);
         m_FileStream.Read (Header, SizeOf(TWMImageHeader));

         if (header.VerFlag = 0) or (header.ColorCount >= 65536) then begin
           btVersion:=1;
           m_FileStream.Seek(-4,soFromCurrent);
         end;

         FImageCount := Header.ImageCount;
         if header.ColorCount=256 then begin
           FBitFormat:=pf8Bit; FBytesPerPixels:=1;
         end else if header.ColorCount=65536 then begin
           FBitFormat:=pf16bit; FBytesPerPixels:=2;
         end else if header.colorcount=16777216 then begin
           FBitFormat:=pf24Bit; FBytesPerPixels:=4;
         end else if header.ColorCount>16777216 then begin
           FBitFormat:=pf32Bit; FBytesPerPixels:=4;
         end;
         ChangeDIBPixelFormat(lsDIB,FBitFormat);
         
         if (LibType = ltUseCache) then begin
           m_ImgArr:=AllocMem(SizeOf(TDxImage) * FImageCount);
           if m_ImgArr = nil then
            raise Exception.Create (self.Name + ' ImgArr = nil');
         end;

         idxfile := ExtractFilePath(FFileName) + ExtractFileNameOnly(FFileName) + '.WIX';
         LoadPalette;

         LoadIndex (idxfile);
      end else begin

      end;
      FInitized := true;
   end;
end;

procedure TWMImages.Finalize;
var
   i: integer;
begin
  //if m_ImgArr <> nil then begin
    for i:=0 to FImageCount-1 do begin
      if m_ImgArr[i].Surface <> nil then begin
         m_ImgArr[i].Surface.Free;
         m_ImgArr[i].Surface := nil;
      end;
    end;
  //end;
  //FreeMem(m_ImgArr);

  //m_ImgArr := nil;
  //FImageCount := 0;
  if m_FileStream <> nil then
    FreeAndNil(m_FileStream);

  if m_FileStream <> nil then begin
    m_FileStream.Free;
    m_FileStream := nil;
  end;
  FInitized := false;
end;

procedure TWMImages.LoadPalette;
begin
   if btVersion <> 0 then
     m_FileStream.Seek (sizeof(TWMImageHeader) - 4, 0)
   else
     m_FileStream.Seek (sizeof(TWMImageHeader), 0);
   m_FileStream.Read (MainPalette, sizeof(TRgbQuad) * 256);
end;

procedure TWMImages.LoadIndex (idxfile: string);
var
   fhandle, i, value: integer;
   header: TWMIndexHeader;
   pvalue: PInteger;
begin
   m_IndexList.Clear;
   if FileExists (idxfile) then begin
      fhandle := FileOpen (idxfile, fmOpenRead or fmShareDenyNone);
      if fhandle > 0 then begin
         if btVersion <> 0 then
           FileRead (fhandle, header, sizeof(TWMIndexHeader) - 4)
         else
           FileRead (fhandle, header, sizeof(TWMIndexHeader));
           
         GetMem (pvalue, 4*header.IndexCount);
         FileRead (fhandle, pvalue^, 4*header.IndexCount);
         for i:=0 to header.IndexCount-1 do begin
            value := PInteger(integer(pvalue) + 4*i)^;
            m_IndexList.Add (pointer(value));
         end;
         FreeMem (pvalue);
         FileClose (fhandle);
      end;
   end;
end;

{----------------- Private Variables ---------------------}

function  TWMImages.FGetImageSurface (index: integer): TDirectDrawSurface;
begin
   Result := nil;
   if LibType = ltUseCache then begin
      Result := GetCachedSurface (index);
   end else
      if LibType = ltLoadMemory then begin
         if (index >= 0) and (index < ImageCount) then
            Result := m_ImgArr[index].Surface;
      end;
         
end;

procedure TWMImages.FSetDxDraw (fdd: TDxDraw);
begin
   FDxDraw := fdd;
end;

procedure TWMImages.LoadDxImage (position: integer; pdximg: PTDxImage);
var
   imginfo: TWMImageInfo;
   ddsd: TDDSURFACEDESC;
   SBits, PSrc, DBits: PByte;
   n, slen: integer;
   ms:TMemoryStream;
   w:Word;
   size:DWord;
begin
     m_FileStream.Seek (position, 0);
     if btVersion <> 0 then m_FileStream.Read (imginfo, SizeOf(TWMImageInfo)-4)
     else m_FileStream.Read (imginfo, SizeOf(TWMImageInfo));

     if (imginfo.nWidth < 2) or (imgInfo.nHeight < 2) then begin
        pdximg.npx := imginfo.px;
        pdximg.npy := imginfo.py;
        pdximg.surface := TDirectDrawSurface.Create (FDDraw);
        pdximg.surface.SystemMemory := TRUE;
        pdximg.surface.SetSize (imginfo.nWidth, imginfo.nHeight);
        pdximg.surface.Canvas.Release;
        pdximg.surface.TransparentColor := 0;
        exit;
     end;
     if g_boUseDIBSurface and (FBitFormat <> pfDevice) then begin
        if (FBitFormat = pf8bit) then begin
           slen  := WidthBytes(imginfo.nWidth);
           try
              lsDib.Clear;
              lsDib.Width := slen;
              lsDib.Height := imginfo.nHeight;
              ChangeDIBPixelFormat(lsDIB, FBitFormat);
           except

           end;
           lsDib.ColorTable := MainPalette;
           lsDib.UpdatePalette;
           DBits := lsDib.PBits;
           m_FileStream.Read (DBits^, slen * imgInfo.nHeight * FBytesPerPixels );
        end else if FBitFormat = pf16bit then begin
           try
              lsDib.Clear;
              lsDib.Width := imginfo.nWidth;
              lsDib.Height := imginfo.nHeight;
              ChangeDIBPixelFormat(lsDIB,FBitFormat);
           except

           end;
           lsDib.ColorTable := MainPalette;
           lsDib.UpdatePalette;
           DBits := lsDib.PBits;
           m_FileStream.Read (DBits^, imginfo.nWidth * imgInfo.nHeight * FBytesPerPixels );
        end else begin
         {  ms:=TMemoryStream.Create;
           try
              m_FileStream.Read(w,4);
              m_FileStream.Read(size,4);
              ms.Write(w,4);
              ms.Write(size,4);
              ms.CopyFrom(m_FileStream,size);
              ms.Seek(0,0);
              lsBitmap.LoadFromStream(ms);
              lsBitmap.TransparentColor:=0;
           finally
             ms.Free;
           end;    }
        end;

        pdximg.npx := imginfo.px;
        pdximg.npy := imginfo.py;
        pdximg.surface := TDirectDrawSurface.Create (FDDraw);
        pdximg.surface.SystemMemory := TRUE;
        if FBitFormat=pf8bit then
           pdximg.surface.SetSize (WidthBytes(imginfo.nWidth), imginfo.nHeight)
        else  pdximg.surface.SetSize (imginfo.nWidth, imginfo.nHeight);

        pdximg.surface.Canvas.Draw(0, 0, lsDib);
        pdximg.surface.Canvas.Release;
        pdximg.surface.TransparentColor := 0;
     end else begin
        slen  := WidthBytes(imginfo.nWidth);
        GetMem (PSrc, slen * imgInfo.nHeight * FBytesPerPixels);
        SBits := PSrc;
        m_FileStream.Read (PSrc^, slen * imgInfo.nHeight * FBytesPerPixels);
        try
           pdximg.surface := TDirectDrawSurface.Create (FDDraw);
           pdximg.surface.SystemMemory := TRUE;
           pdximg.surface.SetSize (slen, imginfo.nHeight);
           pdximg.npx := imginfo.px;
           pdximg.npy := imginfo.py;
           ddsd.dwSize := SizeOf(ddsd);
           pdximg.surface.Lock (TRect(nil^), ddsd);
           DBits := ddsd.lpSurface;
           for n:=imginfo.nHeight-1 downto 0 do begin
              SBits := PByte (Integer(PSrc) + slen * n * FBytesPerPixels);
              Move(SBits^, DBits^, slen * FBytesPerPixels);
              Inc (integer(DBits), ddsd.lPitch);
           end;
           pdximg.surface.TransparentColor := 0;
        finally
           pdximg.surface.UnLock ();
           FreeMem (PSrc);
        end;
     end;
end;

procedure TWMImages.ClearCache;
var
   i: integer;
begin
   for i:=0 to ImageCount - 1 do begin
      if m_ImgArr[i].Surface <> nil then begin
         m_ImgArr[i].Surface.Free;
         m_ImgArr[i].Surface := nil;
      end;
   end;
end;

function  TWMImages.GetImage (index: integer; var px, py: integer): TDirectDrawSurface;
begin
   if (index >= 0) and (index < ImageCount) then begin
      px := m_ImgArr[index].nPx;
      py := m_ImgArr[index].nPy;
      Result := m_ImgArr[index].surface;
   end else
      Result := nil;
end;

procedure TWMImages.FreeOldMemorys;
var
   i: integer;
begin
   for i:=0 to ImageCount-1 do begin
      if m_ImgArr[i].Surface <> nil then begin
         if GetTickCount - m_ImgArr[i].dwLatestTime > 1 * 60 * 1000 then begin     //¸Þ¸ð¸® ¸¯ ¹æÁö(¿ø·¡´Â 5ºÐ ¸¶´Ù)
            m_ImgArr[i].Surface.Free;
            m_ImgArr[i].Surface := nil;
         end;
      end;
   end;
end;

//Cache
function  TWMImages.GetCachedSurface (index: integer): TDirectDrawSurface;
var
  nPosition:Integer;
begin
  Result := nil;
  try
    if (index < 0) or (index >= ImageCount) then exit;
    if GetTickCount - m_dwMemChecktTick > 5000 then begin
      m_dwMemChecktTick := GetTickCount;
      FreeOldMemorys;
    end;
    if m_ImgArr[index].Surface = nil then begin
      if index < m_IndexList.Count then begin
         nPosition:= Integer(m_IndexList[index]);
         LoadDxImage (nPosition, @m_ImgArr[index]);
         m_ImgArr[index].dwLatestTime := GetTickCount;
         Result := m_ImgArr[index].Surface;
      end;
    end else begin
      m_ImgArr[index].dwLatestTime := GetTickCount;
      Result := m_ImgArr[index].Surface;
    end;

   except
    //DebugOutStr ('GetCachedSurface 3 Index: ' + IntToStr(index) + ' Error Code: ' + IntToStr(nErrCode));
   end;
end;

function  TWMImages.GetCachedImage (index: integer; var px, py: integer): TDirectDrawSurface;
var
   position: integer;
begin
   Result := nil;
   try
     if (index < 0) or (index >= ImageCount) then exit;
     if GetTickCount - m_dwMemChecktTick > 5000 then begin
       m_dwMemChecktTick := GetTickCount;
       FreeOldMemorys;
     end;
     if m_ImgArr[index].Surface = nil then begin //cache
       if index < m_IndexList.Count then begin
         position := Integer(m_IndexList[index]);
         LoadDxImage (position, @m_ImgArr[index]);
         m_ImgArr[index].dwLatestTime := GetTickCount;
         px := m_ImgArr[index].nPx;
         py := m_ImgArr[index].nPy;
         Result := m_ImgArr[index].Surface;
       end;
     end else begin
       m_ImgArr[index].dwLatestTime := GetTickCount;
       px := m_ImgArr[index].nPx;
       py := m_ImgArr[index].nPy;
       Result := m_ImgArr[index].Surface;
     end;

   except
    //DebugOutStr ('GetCachedImage 3 Index: ' + IntToStr(index) + ' Error Code: ' + IntToStr(nErrCode));
   end;
end;

end.
