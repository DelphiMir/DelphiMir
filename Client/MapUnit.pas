unit MapUnit;

interface

uses
   {svn,} Windows, Classes, SysUtils, Grobal2, HUtil32, DXDraws, CliUtil,
   MShare, Share, FindMapPath;



type
// -------------------------------------------------------------------------------
// Map
// -------------------------------------------------------------------------------

  TMapHeaderEI = Packed Record
    szDesc: Array[1..20] Of char;
    wAttr: Word;
    width: Word;
    height: Word;
    cEventFileIdx: Char;
    cFogColor: Char;
  End;

  TMapInfoEi2OB = Packed Record
    bFlag: byte;
    bObj1Ani: byte;
    bObj2Ani: byte;                     //¶¯»­µÄÕÅÍ¼
    bFileIdx1: byte;                    //ÉÏ²ãOBÎÄ¼þºÅ
    bFileIdx2: byte;                    //ÏÂ²ãOBÎÄ¼þºÅ
    wObj1: Word;                        //ÏÂ²ãOBÍ¼Æ¬ºÅ
    wObj2: Word;                        //ÉÏ²ãOBÍ¼Æ¬ºÅ
    bDoorIdx: byte;
    bDoorOffset: byte;
    wLigntNEvent: word;
    wLigntNEvent1: byte;
  End;
  pTMapInfoEi2OB = ^TMapInfoEi2OB;

  TMapInfoEi2Tite = Packed Record
    bFileIdx: byte;
    wTileIdx: Word;
  End;
  pTmapinfoEi2Tite = ^TMapInfoEi2Tite;


  TMap = class
  private
    procedure LoadMapArr(nCurrX, nCurrY: integer);
    procedure LoadMapArrEI(nCurrX, nCurrY: Integer);
  public
    m_MArr          :array[0..MAXX * 3, 0..MAXY * 3] of TMapInfo;
    m_boIsEIMAP     :Boolean;
    m_boIsShanda    :Boolean;

    m_MArrEI2       :Array[0..40 * 3, 0..40 * 3] Of TMapInfoEi2Tite;      //¹Ù´Ú Å¸ÀÏ
    m_MArrEI2OB2    :Array[0..40 * 3, 0..40 * 3] Of TMapInfoEi2OB;        //¹è°æ Å¸ÀÏ
    m_nWidth        :Integer;     //¹Ì¸£3¸ÊÀÇ Æø
    m_nHeight       :Integer;     //¹Ì¸£3¸ÊÀÇ ³ôÀÌ

    m_boChange      :Boolean;
    m_ClientRect    :TRect;
    m_OldClientRect :TRect;
    m_nBlockLeft    :Integer;    //Å¸ÀÏ ÁÂÇ¥·Î ¿ÞÂÊ, ²À´ë±â ÁÂÇ¥
    m_nBlockTop     :Integer;
    m_nOldLeft      :Integer;
    m_nOldTop       :Integer;
    m_sOldMap       :String;
    m_nCurUnitX     :Integer;
    m_nCurUnitY     :Integer;
    m_sCurrentMap   :String;
    m_nSegXCount    :Integer;
    m_nSegYCount    :Integer;
    constructor Create;
    destructor Destroy;override;
    procedure UpdateMapSquare (cx, cy: integer);
    procedure UpdateMapPos (mx, my: integer);
    procedure ReadyReload;
    procedure LoadMap(sMapName:String;nMx,nMy:Integer);
    procedure MarkCanWalk (mx, my: integer; bowalk: Boolean);
    function  CanMove (mx, my: integer): Boolean;
    function  CanFly  (mx, my: integer): Boolean;
    function  GetDoor (mx, my: integer): Integer;
    function  IsDoorOpen (mx, my: integer): Boolean;
    function  OpenDoor (mx, my: integer): Boolean;
    function  CloseDoor (mx, my: integer): Boolean;

    function  MoveFish (mx, my: integer): Boolean;    //³¬½Ã ¹°°¡
  end;


implementation

uses
   ClMain;


constructor TMap.Create;
begin
   inherited Create;
   m_ClientRect  := Rect (0,0,0,0);
   m_boChange    :=False;
   m_sCurrentMap := '';
   m_nSegXCount  := 0;
   m_nSegYCount  := 0;
   m_nCurUnitX   := -1;
   m_nCurUnitY   := -1;
   m_nBlockLeft  := -1;
   m_nBlockTop   := -1;
   m_sOldMap     := '';
   m_boISEIMAP   := False;
   m_boIsShanda  := False;
end;

destructor TMap.Destroy;
begin
   inherited Destroy;
end;



procedure TMap.LoadMapArr(nCurrX, nCurrY: Integer);
var
  i: Integer;
  nLx: Integer;
  nRx: Integer;
  nTy: Integer;
  nBy: Integer;
  Header: TMapHeader;
  sFileNameEI: string;
begin
  m_boISEImap := False;
  m_boIsShanda := False;
  UNITY:=32;
  SafeFillChar(m_MArr, sizeof(m_MArr), #0);
  sFileNameEI := '.\Map\Mir3\' + m_sCurrentMap + '.map';
  if FileExists(sFileNameEI) then begin
    LoadMapArrEI(nCurrX, nCurrY);
    Exit;
  End;

  Header := g_LegendMap.MapHeader;
  m_boIsShanda := g_LegendMap.boShanda;
  nLx := (nCurrX - 1) * LOGICALMAPUNIT;
  nRx := (nCurrX + 2) * LOGICALMAPUNIT; //rx
  nTy := (nCurrY - 1) * LOGICALMAPUNIT;
  nBy := (nCurrY + 2) * LOGICALMAPUNIT;

  if nLx < 0 then nLx := 0;
  if nTy < 0 then nTy := 0;
  if nBy >= Header.wHeight then nBy := Header.wHeight;
  for i := nLx to nRx - 1 do begin
    if (i >= 0) and (i < Header.wWidth) then begin
      Move(g_LegendMap.MapData[Header.wHeight * i + nTy], m_MArr[i - nLx, 0], Sizeof(TMapInfo) * (nBy - nTy));
    end;
  end;
end;

Procedure TMap.LoadMapArrEI(nCurrX, nCurrY: Integer);          //¹Ì¸£3¸Ê
Var
  I                 : Integer;
  k                 : Integer;
  nAline            : Integer;
  nLx               : Integer;
  nRx               : Integer;
  nTy               : Integer;
  nBy               : Integer;
  sFileName         : String;
  nHandle           : Integer;
  HeaderEi          : TMapHeaderEI;
Begin
  m_boISEIMap:=True;
  m_boIsShanda := False;
  UNITY:=31;
  SafeFillchar(m_MArrEI2, SizeOf(m_MArrEI2), #0);
  SafeFillchar(m_MArrEI2OB2, SizeOf(m_MArrEI2OB2), #0);
  sFileName := '.\Map\Mir3\' + m_sCurrentMap + '.map';
  If FileExists(sFileName) Then Begin
    nHandle := FileOpen(sFileName, fmOpenRead Or fmShareDenyNone);
    If nHandle > 0 Then Begin
      FileSeek(nHandle, 0, 0);
      FileRead(nHandle, HeaderEI, SizeOf(TMapHeaderEI));
      nLx := (nCurrX - 1) * LOGICALMAPUNIT;
      nRx := (nCurrX + 2) * LOGICALMAPUNIT;
      nTy := (nCurrY - 1) * LOGICALMAPUNIT;
      nBy := (nCurrY + 2) * LOGICALMAPUNIT;

      If nLx < 0 Then nLx := 0;
      If nTy < 0 Then nTy := 0;

      m_nWidth := HeaderEI.Width;
      m_nHeight := HeaderEI.Height;
      If nBy >= HeaderEI.height Then nBy := HeaderEI.height;
      nAline := sizeof(TMapInfoEi2Tite) * (HeaderEI.height Div 2);
      For I := nLx Div 2 To nLx Div 2 + 44 Do Begin
         If (I >= 0) And (I < HeaderEI.Width) Then Begin
           FileSeek(nHandle, SizeOf(TMapHeaderEI) + (nAline * I) + (SizeOf(TMapInfoEi2Tite) * nTy Div 2), 0);
           FileRead(nHandle, m_MArrEI2[I - nLx Div 2, 0], nAline);     //¹Ù´Ú Å¸ÀÏ
         End;
      End;

      nAline := sizeof(TMapInfoEi2ob) * (HeaderEI.height);
      For I := nLx To nLx + 90 Do Begin
        If (I >= 0) And (I < HeaderEI.Width) Then Begin
          FileSeek(nHandle, SizeOf(HeaderEI) + (HeaderEI.width * HeaderEI.height * 3 Div 4) + (nAline * I) + (SizeOf(TMapInfoEi2ob) * nTy), 0);
          FileRead(nHandle, m_MArrEI2ob2[I - nLx, 0], SizeOf(TMapInfoEi2ob) * (nBy - nTy)); //¹è°æ Å¸ÀÏ
        end;
      End;
    end;
    FileClose(nHandle);
  end;
end;


procedure TMap.ReadyReload;
begin
   m_nCurUnitX := -1;
   m_nCurUnitY := -1;
end;

//cx, cy: Áß¾Ó, Counted by unit..
procedure TMap.UpdateMapSquare (cx, cy: integer);
begin
  if (cx <> m_nCurUnitX) or (cy <> m_nCurUnitY) then begin
    LoadMapArr(cx, cy);
    m_nCurUnitX := cx;
    m_nCurUnitY := cy;
  end;
end;
//ÁÖÄ³¸¯ÀÌ ÀÌµ¿½Ã ºó¹øÀÌ È£Ãâ..
procedure TMap.UpdateMapPos (mx, my: integer);
var
   cx, cy: integer;
   procedure Unmark (xx, yy: integer);
   var
      ax, ay: integer;
   begin
      if (cx = xx div LOGICALMAPUNIT) and (cy = yy div LOGICALMAPUNIT) then begin
         ax := xx - m_nBlockLeft;
         ay := yy - m_nBlockTop;
         m_MArr[ax,ay].wFrImg := m_MArr[ax,ay].wFrImg and $7FFF;
         m_MArr[ax,ay].wBkImg := m_MArr[ax,ay].wBkImg and $1FFFFFFF; // $7FFF;
      end;
   end;
begin
   cx := mx div LOGICALMAPUNIT;
   cy := my div LOGICALMAPUNIT;
   m_nBlockLeft := _MAX (0, (cx - 1) * LOGICALMAPUNIT);
   m_nBlockTop  := _MAX (0, (cy - 1) * LOGICALMAPUNIT);

   UpdateMapSquare (cx, cy);

   if (m_nOldLeft <> m_nBlockLeft) or (m_nOldTop <> m_nBlockTop) or (m_sOldMap <> m_sCurrentMap) then begin
      //3¹ø¸Ê ¼ºº®ÀÚ¸® ¹ö±× º¸Á¤ (2001-7-3)
      if m_sCurrentMap = '3' then begin
         Unmark (624, 278);
         Unmark (627, 278);
         Unmark (634, 271);
         Unmark (564, 287);
         Unmark (564, 286);
         Unmark (661, 277);
         Unmark (578, 296);
      end;
   end;
   m_nOldLeft := m_nBlockLeft;
   m_nOldTop := m_nBlockTop;
end;
//¸Êº¯°æ½Ã Ã³À½ ÇÑ¹ø È£Ãâ..
procedure TMap.LoadMap(sMapName:String;nMx,nMy:Integer);
begin
   m_nCurUnitX   := -1;
   m_nCurUnitY   := -1;
   m_sCurrentMap := sMapName;

   UpdateMapPos(nMx, nMy);
   m_sOldMap := m_sCurrentMap;
end;

procedure TMap.MarkCanWalk (mx, my: integer; bowalk: Boolean);
var
   cx, cy: integer;
begin
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) then exit;
   if m_boISEIMap then begin        //¹Ì¸£3¸Ê °ÉÀ» ¼ö ÀÖ´ÂÁö
     cx := mx - m_nBlockLeft;
     cy := my - m_nBlockTop;
     If (cx < 0) Or (cy < 0) Then  Exit;
     If bowalk Then
       Map.m_MArrEI2ob2[cx, cy].bFlag := 1
     Else
       Map.m_MArrEI2ob2[cx, cy].bFlag := 0;
  end else begin
   if bowalk then  //°ÉÀ» ¼ö ÀÖÀ½
      Map.m_MArr[cx, cy].wFrImg := Map.m_MArr[cx, cy].wFrImg and $7FFF
   else   //¸·ÇûÀ½
      Map.m_MArr[cx, cy].wFrImg := Map.m_MArr[cx, cy].wFrImg or $8000;  //¸ø¿òÁ÷ÀÌ°Ô ÇÑ´Ù.
  end;
end;

function  TMap.CanMove (mx, my: integer): Boolean;
var
   cx, cy: integer;
begin
   Result:=False;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) or (cx > MAXX * 3) or (cy > MAXY * 3) then exit;
   if m_boIsEIMap then begin
     cx := mx - m_nBlockLeft;
     cy := my - m_nBlockTop;
     If (cx < 0) Or (cy < 0) Then Exit;
     Result := Boolean((Map.m_MArrEI2ob2[cx, cy].bFlag) And $01);
     If result Then Begin
       If Map.m_MArrEI2ob2[cx, cy].bDoorIdx And $80 <> 0 Then Begin
         If (Map.m_MArrEI2ob2[cx, cy].bDoorOffset And $80) = 0 Then Result := FALSE;
       End;
     End;
   end else begin
     Result := ((Map.m_MArr[cx, cy].wBkImg and $20000000) + (Map.m_MArr[cx, cy].wFrImg and $8000)) = 0;  //8000
     if Result then begin  //¹®°Ë»ç
       if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin    //¹®Â¦ÀÌ ÀÖÀ½
         if (Map.m_MArr[cx, cy].btDoorOffset and  $80) = 0 then
            Result := FALSE;  //¹®ÀÌ ¾È ¿­·ÈÀ½.
        end;
     end;
   end;
end;

function  TMap.MoveFish (mx, my: integer): Boolean;    //³¬½Ã ¹°°¡
var
   cx, cy: integer;
begin
   Result:=False;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) then exit;
   if Map.m_MArr[cx, cy].btLight in [100,101] then begin
   Result:=True;
   end;
end;

function  TMap.CanFly(mx, my: integer): Boolean;
var
   cx, cy: integer;
begin
   Result:=False;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) then exit;
   Result := (Map.m_MArr[cx, cy].wFrImg and $8000) = 0;
   if Result then begin
      if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin
         if (Map.m_MArr[cx, cy].btDoorOffset and  $80) = 0 then
            Result := FALSE;
      end;
   end;
end;

function  TMap.GetDoor (mx, my: integer): Integer;
var
   cx, cy: integer;
begin
   Result := 0;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if m_boISEIMap then begin    //¹Ì¸£3¸Ê ¹®
     If Map.m_MArrEI2ob2[cx, cy].bDoorIdx And $80 > 0 Then Begin
       Result := Map.m_MArrEI2ob2[cx, cy].bDoorIdx And $7F;
     end;
   end else begin
     if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin
       Result := Map.m_MArr[cx, cy].btDoorIndex and $7F;
     end;
   end;
end;

function  TMap.IsDoorOpen (mx, my: integer): Boolean;
var
   cx, cy: integer;
begin
   Result := FALSE;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin
      Result := (Map.m_MArr[cx, cy].btDoorOffset and $80 <> 0);
   end;
end;

function  TMap.OpenDoor (mx, my: integer): Boolean;
var
   i, j, cx, cy, idx: integer;
begin
   Result := FALSE;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) then exit;
   if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin
      idx := Map.m_MArr[cx, cy].btDoorIndex and $7F;
      for i:=cx - 10 to cx + 10 do
         for j:=cy - 10 to cy + 10 do begin
            if (i > 0) and (j > 0) then
               if (Map.m_MArr[i, j].btDoorIndex and $7F) = idx then
                  Map.m_MArr[i, j].btDoorOffset := Map.m_MArr[i, j].btDoorOffset or $80;
         end;
   end;
end;

function  TMap.CloseDoor (mx, my: integer): Boolean;
var
   i, j, cx, cy, idx: integer;
begin
   Result := FALSE;
   cx := mx - m_nBlockLeft;
   cy := my - m_nBlockTop;
   if (cx < 0) or (cy < 0) then exit;
   if m_boIsEIMap then begin    //¹Ì¸£3¸Ê ¹® ´ÝÈù
     If Map.m_MArrEI2ob2[cx, cy].bDoorIdx And $80 > 0 Then Begin
       idx := Map.m_MArrEI2ob2[cx, cy].bDoorIdx And $7F;
       For I := cx - 8 To cx + 10 Do
       For j := cy - 8 To cy + 10 Do Begin
        If (Map.m_MArrEI2ob2[I, j].bDoorIdx And $7F) = idx Then
          Map.m_MArrEI2ob2[I, j].bDoorOffset := Map.m_MArrEI2ob2[I, j].bDoorOffset And $7F;
       End;
     End;
   End else begin
     if Map.m_MArr[cx, cy].btDoorIndex and $80 > 0 then begin
        idx := Map.m_MArr[cx, cy].btDoorIndex and $7F;
        for i:=cx-8 to cx+10 do
          for j:=cy-8 to cy+10 do begin
            if (Map.m_MArr[i, j].btDoorIndex and $7F) = idx then
              Map.m_MArr[i, j].btDoorOffset := Map.m_MArr[i, j].btDoorOffset and $7F;
          end;
     end;
   end;
end;


const
   SCALE = 4;



{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: MapUnit.pas 512 2006-11-29 18:43:28Z Vexusdev $');
end.
