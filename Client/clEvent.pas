unit clEvent;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DirectX, DXClass, Grobal2, ExtCtrls, HUtil32, EdCode,
  CliUtil, MShare, Share, SoundUtil;


const

   ZOMBIDIGUPDUSTBASE = 420;
   STONEFRAGMENTBASE = 64;
   HOLYCURTAINBASE = 1390;
   FIREBURNBASE = 1630;            //지염술
   MASSPOISON = 1650;     //독무
   SCULPTUREFRAGMENT = 1349;
   POBAKBASE = 2360; //포박술
   ICEBURNBASE = 1550;

type
  TClEvent = class
    m_nX      :Integer;
    m_nY      :Integer;
    m_nDir    :Integer;
    m_nPx     :Integer;
    m_nPy     :Integer;
    m_nPx1     :Integer;
    m_nPy1     :Integer;
    m_nPx2     :Integer;
    m_nPy2     :Integer;
    m_nEventType  :Integer;
    m_nEventParam :Integer;
    m_nServerId   :Integer;
    m_Dsurface    :TDirectDrawSurface;
    m_sDsurface   :TDirectDrawSurface;
    m_boBlend     :Boolean;
    m_dwFrameTime :LongWord;
    m_dwCurframe  :LongWord;
    m_nLight      :Integer;
   private
   public
      constructor Create (svid, ax, ay, evtype: integer);
      destructor Destroy; override;
      procedure DrawEvent (backsurface: TDirectDrawSurface; ax, ay: integer); dynamic;
      procedure Run; dynamic;
   end;

   TClEventManager = class
   private
   public
      EventList: TList;
      constructor Create;
      destructor Destroy; override;
      procedure ClearEvents;
      function  AddEvent (evn: TClEvent): TClEvent;
      procedure DelEvent (evn: TClEvent);
      procedure DelEventById (svid: integer);
      function  GetEvent (ax, ay, etype: integer): TClEvent;
      procedure Execute;
   end;


implementation

uses
   ClMain;

constructor TClEvent.Create (svid, ax, ay, evtype: integer);
begin
   m_nServerId := svid;
   m_nX := ax;
   m_nY := ay;
   m_nEventType := evtype;
   m_nEventParam := 0;
   m_boBlend := FALSE;
   m_dwFrameTime := GetTickCount;
   m_dwCurframe := 0;
   m_nLight := 0;
end;

destructor TClEvent.Destroy;
begin
   inherited Destroy;
end;

procedure TClEvent.DrawEvent (backsurface: TDirectDrawSurface; ax, ay: integer);
begin
  if m_sDsurface <> nil then begin
    backsurface.Draw(ax + m_nPx1, ay + m_nPy1, m_sDsurface.ClientRect, m_sDsurface, TRUE);
  end;
  if m_Dsurface <> nil then begin
    if m_boBlend then
      DrawBlend (backsurface, ax + m_nPx, ay + m_nPy, m_Dsurface, 1)
    else
      backsurface.Draw(ax + m_nPx, ay+m_nPy, m_Dsurface.ClientRect, m_Dsurface, TRUE);
  end;
end;

procedure TClEvent.Run;
begin
  m_Dsurface := nil;
  m_sDsurface := nil;
  if GetTickCount - m_dwFrameTime > 20 then begin
    m_dwFrameTime := GetTickCount;
    Inc (m_dwCurframe);
  end;
  case m_nEventType of
    ET_DIGOUTZOMBI: m_Dsurface := g_WMonImagesArr[5].GetCachedImage (ZOMBIDIGUPDUSTBASE+m_nDir, m_nPx, m_nPy);
    ET_PILESTONES: begin
      if m_nEventParam <= 0 then m_nEventParam := 1;
      if m_nEventParam > 5 then m_nEventParam := 5;
      m_Dsurface := g_WEffectImg.GetCachedImage (STONEFRAGMENTBASE+(m_nEventParam-1), m_nPx, m_nPy);
    end;
    ET_HOLYCURTAIN: begin
        m_Dsurface := g_WMagicImages.GetCachedImage(HOLYCURTAINBASE+(m_dwCurframe mod 10), m_nPx, m_nPy);
        m_boBlend := TRUE;
        m_nLight := 1;
    end;
    ET_FIRE: begin     //지염술
        m_Dsurface := g_WMagicImages.GetCachedImage(FIREBURNBASE+((m_dwCurframe div 2) mod 6), m_nPx, m_nPy);
        m_boBlend := TRUE;
        m_nLight := 1;
    end;

    ET_FIREUP: begin     //지염술 강화
        m_Dsurface := g_WMagicUpImages.GetCachedImage(400+((m_dwCurframe div 3) mod 6), m_nPx, m_nPy);
        m_boBlend := TRUE;
        m_nLight := 1;
    end;

    ET_ALLFIRE: begin     //만천염옥
        m_Dsurface := g_WMagicNewImages.GetCachedImage(1760+((m_dwCurframe div 2) mod 8), m_nPx, m_nPy);
        m_boBlend := TRUE;
        m_nLight := 1;
    end;

    ET_POISONCLOUD: begin      //독무
        m_Dsurface := g_WMagic2Images.GetCachedImage(MASSPOISON+((m_dwCurframe div 2) mod 20), m_nPx, m_nPy);
        m_boBlend := True;
        m_nLight := 1;
    end;

    ET_CHUNGONG: begin      //천공
        m_Dsurface := g_WMagic0Images.GetCachedImage(919+((m_dwCurframe div 3) mod 41), m_nPx, m_nPy);
        m_boBlend := True;
        m_nLight := 1;
    end;

    ET_UPPOISONCLOUD: begin      //독무 강화
      m_Dsurface := g_WMagicUpImages.GetCachedImage(510+((m_dwCurframe div 3) mod 20), m_nPx, m_nPy);
      m_boBlend := True;
      m_nLight := 1;
    end;

    ET_OHAENG: begin      //음양오행진
      m_Dsurface := g_WMagic3Images.GetCachedImage(630+((m_dwCurframe div 3) mod 11), m_nPx, m_nPy);
      m_boBlend := TRUE;
      m_nLight := 1;
    end;

    ET_SCULPEICE: begin
      m_Dsurface := g_WMonImagesArr[6].GetCachedImage(SCULPTUREFRAGMENT, m_nPx, m_nPy);
    end;

    ET_POBAK: begin     //포박술
      m_Dsurface := g_WMagic2Images.GetCachedImage(POBAKBASE+((m_dwCurframe div 3) mod 8), m_nPx, m_nPy);
      m_boBlend := TRUE;
      m_nLight := 2;
    end;

    ET_DRAGON: begin     //용솟음
      m_Dsurface := g_WMagic0Images.GetCachedImage(1012 + ((m_dwCurframe div 3) mod 3), m_nPx, m_nPy);
      m_sDsurface := g_WMagic0Images.GetCachedImage(992 + ((m_dwCurframe div 3) mod 3), m_nPx1, m_nPy1);
      m_boBlend := TRUE;
      m_nLight := 2;
    end;

    ET_MAHUL: begin     //마혈난무
      m_Dsurface := g_WMagic0Images.GetCachedImage(1081 + ((m_dwCurframe div 3) mod 34), m_nPx, m_nPy);
      m_boBlend := TRUE;
      m_nLight := 2;
    end;

    ET_NONE: begin
      m_Dsurface := nil;
      m_sDsurface := nil;
    end;
  end;
end;


{-----------------------------------------------------------------------------}



{-----------------------------------------------------------------------------}

constructor TClEventManager.Create;
begin
   EventList := TList.Create;
end;

destructor TClEventManager.Destroy;
var
  i: integer;
begin
  if EventList.Count > 0 then
  for i:=0 to EventList.Count-1 do
    TClEvent(EventList[i]).Free;
  EventList.Free;
  inherited Destroy;
end;

procedure TClEventManager.ClearEvents;
var
  i: integer;
begin
  if EventList.Count > 0 then
  for i:=0 to EventList.Count-1 do
    TClEvent(EventList[i]).Free;
  EventList.Clear;
end;

function  TClEventManager.AddEvent (evn: TClEvent): TClEvent;
var
  i: integer;
  event: TClEvent;
begin
  for i:=0 to EventList.Count-1 do
    if (EventList[i] = evn) or (TClEvent(EventList[i]).m_nServerId = evn.m_nServerId) then begin
      evn.Free;
      Result := nil;
      exit;
    end;
  EventList.Add (evn);
  Result := evn;
end;

procedure TClEventManager.DelEvent (evn: TClEvent);
var
  i: integer;
begin
  for i:=0 to EventList.Count-1 do
    if EventList[i] = evn then begin
      TClEvent(EventList[i]).Free;
      EventList.Delete (i);
      break;
    end;
end;

procedure TClEventManager.DelEventById (svid: integer);
var
  i: integer;
begin
  for i:=0 to EventList.Count-1 do
    if TClEvent(EventList[i]).m_nServerId = svid then begin
      TClEvent(EventList[i]).Free;
      EventList.Delete (i);
      break;
    end;
end;

function  TClEventManager.GetEvent (ax, ay, etype: integer): TClEvent;
var
  i: integer;
begin
  Result := nil;
  for i:=0 to EventList.Count-1 do
    if (TClEvent(EventList[i]).m_nX = ax) and (TClEvent(EventList[i]).m_nY = ay) and
       (TClEvent(EventList[i]).m_nEventType = etype) then begin
      Result := TClEvent(EventList[i]);
      break;
    end;
end;

procedure TClEventManager.Execute;
var
  i: integer;
begin
  for i:=0 to EventList.Count-1 do
    TClEvent(EventList[i]).Run;
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: clEvent.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.
