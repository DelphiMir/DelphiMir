unit DrawScrn;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DXClass, DirectX, IntroScn, Actor, cliUtil, clFunc, MShare,
  HUtil32, FState, SDK, FState2;


const
   MAXSYSLINE = 8;

   BOTTOMBOARD = 1;
   VIEWCHATLINE = 4;
   AREASTATEICONBASE = 150;
   HEALTHBAR_BLACK = 0;
   HEALTHBAR_RED = 1;
   HEALTHBAR_BLUE = 10;
   HEALTHBAR_YELLOW = 11;
   HEALTHBAR_GREEN = 12;
   HEALTHBAR_PINK = 13;
   HEALTHBAR_SEA = 14;


type
  TDrawScreenXY = class
    m_OldSysMsgList: TList;
  private
    procedure DeleteSysMsg(nMaxCount: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddSysMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);
    procedure Draw(MSurface: TDirectDrawSurface);
  end;


  TDrawScreenXYManage = class
    m_DrawScreenXYManageList: TList;
  private
    function GetDrawScreenXY(nX, nY: Integer): TDrawScreenXY;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddSysMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);
    procedure Draw(MSurface: TDirectDrawSurface);
  end;

  pTSayHint = ^TSayHint;         //ÈùÆ®
  TSayHint = record
    SaySurface: TDirectDrawSurface;
    AddTime: LongWord;
    EffectTime: LongWord;
    EffectIndex: Integer;
  end;

  pTAddSysInfo = ^TAddSysInfo;
  TAddSysInfo = record
    str: string;
    Color: TColor;
    DefColor: TColor;
    boFirst: Boolean;
  end;

   THintStyle = (s_Windows, s_Legend, s_Item, s_BItem, s_Hint, s_KItem);

  TDrawScreenHintLines = class;
  TDrawScreenHintList = class;
  TDrawScreenHintManage = class;

  TDrawScreenHint = class
  private
    FOwner: TDrawScreenHintLines;
    FHint: string;
    FColor: TColor;
    FClientRect: TRect;
    function GetPosition(const Index: Integer): Integer;
    procedure SetPosition(const Index, Value: Integer);
  public
    sLeng: integer;
    constructor Create(AOwner: TDrawScreenHintLines);
    destructor Destroy; override;
    function Add(X, Y: Integer; AHint: string = '';
      AColor: TColor = clWhite): TRect;
    procedure Draw(Surface: TDirectDrawSurface);
    property Owner: TDrawScreenHintLines read FOwner write FOwner;
    property Hint: string read FHint write FHint;
    property Color: TColor read FColor write FColor;
    property Left: Integer index 0 read FClientRect.Left write SetPosition;
    property Top: Integer index 1 read FClientRect.Top write SetPosition;
    property Width: Integer index 2 read GetPosition write SetPosition;
    property Height: Integer index 3 read GetPosition write SetPosition;

  end;

  TDrawScreenHintLines = class
  private
    FOwner: TDrawScreenHintList;
    FList: TList;
    function GetLeft: Integer;
    function GetTop: Integer;
    function GetWidth: Integer;
    function GetHeight: Integer;
    function GetCount: Integer;
    function Get(Index: Integer): TDrawScreenHint;
  public
    constructor Create(AOwner: TDrawScreenHintList);
    destructor Destroy; override;

    function Add: TDrawScreenHint;
    procedure Draw(Surface: TDirectDrawSurface);
    property Owner: TDrawScreenHintList read FOwner write FOwner;
    property Left: Integer read GetLeft;
    property Top: Integer read GetTop;
    property Width: Integer read GetWidth;
    property Height: Integer read GetHeight;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TDrawScreenHint read Get;
  end;

  TDrawScreenHintList = class
  private
    FOwner: TDrawScreenHintManage;
    FList: TList;
    FHintStyle: THintStyle;
    FColor: TColor;
    function GetLeft: Integer;
    function GetTop: Integer;
    function GetWidth: Integer;
    function GetHeight: Integer;
    function GetCount: Integer;
    function Get(Index: Integer): TDrawScreenHintLines;
  public
    FWidth : Integer;
    constructor Create(AOwner: TDrawScreenHintManage);
    destructor Destroy; override;
    procedure Draw(Surface: TDirectDrawSurface);
    procedure Add(Lines: TDrawScreenHintLines);
    property Style: THintStyle read FHintStyle write FHintStyle;
    property Owner: TDrawScreenHintManage read FOwner write FOwner;
    property Left: Integer read GetLeft;
    property Top: Integer read GetTop;
    property Width: Integer read GetWidth;
    property Height: Integer read GetHeight;
    property Count: Integer read GetCount;
    property Color: TColor read FColor write FColor;
    property Items[Index: Integer]: TDrawScreenHintLines read Get;
  end;

  TDrawScreenHintManage = class
  private
    FList: TList;
    function Get(Index: Integer): TDrawScreenHintList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(List: TDrawScreenHintList);
    procedure Draw(Surface: TDirectDrawSurface);
    procedure Clear;
    property Items[Index: Integer]: TDrawScreenHintList read Get;
  end;


   TDrawScreen = class
   private
      m_SysMsgGM          :TStringList;
      m_DrawScreenXYManage: TDrawScreenXYManage;
   public
      m_NewSayMsgList: TList;
      m_SayTransferList: TList;

      m_SysMsgList        :TStringList;
      m_SysInfoList: TList;       //ÈùÆ®
      m_nShowSysTick: LongWord;            //ÈùÆ®

      CurrentScene: TScene;
      HintHeight, HintLeft: integer;

      ListHint4: TStringList;
      HintX4, HintY4, HintWidth4, HintHeight4: integer;
      HintUp4: Boolean;
      HintColor4: TColor;

      ListHint5: TStringList;
      HintX5, HintY5, HintWidth5, HintHeight5: integer;
      HintUp5: Boolean;
      HintColor5: TColor;

      DrawScreenHintManage: TDrawScreenHintManage;

      constructor Create;
      destructor Destroy; override;
      procedure KeyPress (var Key: Char);
      procedure KeyDown (var Key: Word; Shift: TShiftState);
      procedure MouseMove (Shift: TShiftState; X, Y: Integer);
      procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure Initialize;
      procedure Finalize;
      procedure ChangeScene (scenetype: TSceneType);
      procedure DrawScreen (MSurface: TDirectDrawSurface);
      procedure DrawScreenTop (MSurface: TDirectDrawSurface);  //¾ÆÀÌÅÛ È¹µæ
      procedure DrawScreenOldTop (MSurface: TDirectDrawSurface);
      procedure DrawScreenTopGm (MSurface: TDirectDrawSurface);  //È­¸é°øÁö
      procedure DrawScreenCool (MSurface: TDirectDrawSurface);  //¸®ÄÝ
      procedure AddCoolTime (msg: string;Tiem:integer);    //¸®ÄÝ

      procedure ClearSysMsg;
      procedure AddSysMsgEx(MSurface: TDirectDrawSurface; str: string; Color: TColor; boFirst: Boolean = True; DefColor: TColor = 0);     //ÈùÆ®
      procedure AddSysMsg(str: string; nX, nY: Integer; Color: TColor; boFirst: Boolean = True; DefColor: TColor = 0);    //ÈùÆ®

      procedure AddSysOldMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);

      procedure AddMoveMsg(sMsg: string);
      procedure AddChatBoardString (str: string; fcolor, bcolor: integer);
      procedure ClearChatBoard;

      procedure DelTransferMsg(SayMessage: pTSayMessage);
      procedure ChangeTransferMsg(UserSaySet: TUserSaySet; sayt: Byte = 0);

      procedure DisposeSayMsg(SayMessage: pTSayMessage);
      Function  NewSayMsgEx(nWidth, nHeight:Integer; UserSayType: TUserSayType): pTSayMessage;
      procedure AddSayMsg(str: string; FColor: Integer; BColor: Integer; boSys: Boolean; UserSayType: TUserSayType; boFirst: Boolean = True);


      procedure ShowHintA(X, Y: Integer; Str: string; Color: TColor; drawup: Boolean); overload;
      procedure ShowHintB(X, Y: Integer; HintStringList: TStringList; drawup: Boolean); overload;
      procedure DrawHintB(MSurface: TDirectDrawSurface);
      procedure ShowHintL(X, Y: Integer; HintStringList1, HintStringList2: TStringList; drawup: Boolean); overload;
      procedure ShowHintK(X, Y: Integer; HintStringList1, HintStringList2: TStringList; drawup: Boolean); overload;
      procedure ShowHintS(X, Y: Integer; HintStringList: TStringList; drawup: Boolean); overload;
      procedure MagicShowHint(X, Y: Integer; Magic: nMagicType;  Color: TColor; drawup, drawLeft: Boolean);

      procedure NewShowHint (x, y: integer; str: sItemMome;drawup: Boolean);
      procedure NewShowHint2 (x, y: integer; str: sItemMome;drawup: Boolean);
      procedure ClearHint;
      procedure DrawHint (MSurface: TDirectDrawSurface);

      procedure newDrawHint(MSurface: TDirectDrawSurface);
      procedure newDrawHint2(MSurface: TDirectDrawSurface);
   end;


implementation

uses
   ClMain, {MShare,} Share, Grobal2;


{-------------------------------------------------------------------------------}

constructor TDrawScreenHintManage.Create;
begin
  FList := TList.Create;
end;

destructor TDrawScreenHintManage.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do begin
    TDrawScreenHintList(FList.Items[I]).Free;
  end;
  FreeAndNil(FList);
  inherited;
end;

function TDrawScreenHintManage.Get(Index: Integer): TDrawScreenHintList;
begin
  Result := FList.Items[Index];
end;

procedure TDrawScreenHintManage.Draw(Surface: TDirectDrawSurface);
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do begin
    TDrawScreenHintList(FList.Items[I]).Draw(Surface);
  end;
end;

procedure TDrawScreenHintManage.Add(List: TDrawScreenHintList);
begin
  FList.Add(List);
end;

procedure TDrawScreenHintManage.Clear;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do begin
    TDrawScreenHintList(FList.Items[I]).Free;
  end;
  FList.Clear;
end;
{-------------------------------------------------------------------------------}


{-------------------------------------------------------------------------------}


constructor TDrawScreenHintList.Create(AOwner: TDrawScreenHintManage);
begin
  FOwner := AOwner;
  FOwner.Add(Self);
  FList := TList.Create;
end;

destructor TDrawScreenHintList.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do begin
    TDrawScreenHintLines(FList.Items[I]).Free;
  end;
  FreeAndNil(FList);
  inherited;
end;

procedure TDrawScreenHintList.Add(Lines: TDrawScreenHintLines);
begin
  FList.Add(Lines);
end;

function TDrawScreenHintList.GetLeft: Integer;          //ÈùÆ® »çÀÌÁî
begin
  if (Style = s_Item) or (Style = s_KItem) then begin
    if Count > 0 then Result := Items[0].Left - 4
    else Result := 0;
  end else begin
    if Count > 0 then Result := Items[0].Left - 4
    else Result := 0;
  end;
end;

function TDrawScreenHintList.GetTop: Integer;           //ÈùÆ® »çÀÌÁî
begin
  if (Style = s_Item) or (Style = s_KItem) then begin
    if Count > 0 then Result := Items[0].Top - 4
    else Result := 0;
  end else begin
    if Count > 0 then Result := Items[0].Top - 4
    else Result := 0;
  end;
end;

function TDrawScreenHintList.GetWidth: Integer;                  //ÈùÆ® »çÀÌÁî
var
  I, nW: Integer;
begin
  nW := 0;
  for I := 0 to Count - 1 do begin
    if nW < Items[I].Width then
      nW := Items[I].Width;       //Æø¿¬±¸
  end;
  if (Style = s_Item) or (Style = s_KItem) then
    Result := nW + 8
  else
    Result := nW + 8;

  FWidth := Result;
end;

function TDrawScreenHintList.GetHeight: Integer;            //ÈùÆ® »çÀÌÁî
begin
  if Count > 0 then
    if (Style = s_Item) or (Style = s_KItem) then
      Result := Items[Count - 1].Top - Items[0].Top + Items[Count - 1].Height + 8
    else
      Result := Items[Count - 1].Top - Items[0].Top + Items[Count - 1].Height + 8
  else Result := 0;
end;

procedure TDrawScreenHintList.Draw(Surface: TDirectDrawSurface);
var
  I: Integer;
  rc, rc2: TRect;
  nAlpha: Integer;
  d: TDirectDrawSurface;
  nW, nH: Integer;
begin
    d := g_WAresImages.Images[127];
    case Style of
      s_BItem:  d := g_WAresImages.Images[127];
      s_Item:  d := g_WMainImages.Images[405];
      s_KItem:  d := g_WAresImages.Images[127];
      s_Windows:  d := g_WMainImages.Images[405];
      s_Legend: d := g_WMainImages.Images[405];
      s_Hint: d := g_WMainImages.Images[406];
    end;
    if d <> nil then begin
      if (Style = s_BItem) or (Style = s_KItem) then begin
        rc := Bounds(Left, Top, Width, Height);
        Surface.Draw(Left, Top, rc, d, False);
      end else begin
        DrawBlendEx(Surface, Left + 1, Top, d, 0, 0, Width, Height, 0);
      end;
    end;


    SetBkMode (Surface.Canvas.Handle, TRANSPARENT);
    case Style of
      s_BItem: begin   //»óÁ¡¿ë
          rc := Bounds(Left, Top, Width, Height);
          Surface.Canvas.Brush.Color := clGray;
          Surface.Canvas.FrameRect(rc);
      end;
      s_KItem: begin     //¾ÆÀÌÅÛ¿ë
          rc := Bounds(Left, Top, Width, Height);
          Surface.Canvas.Brush.Color := clGray;
          Surface.Canvas.FrameRect(rc);
      end;
      s_Item: begin     //¾ÆÀÌÅÛ¿ë
          rc := Bounds(Left, Top, Width, Height);
          Surface.Canvas.Brush.Color := clGray;
          Surface.Canvas.FrameRect(rc);
      end;
      s_Windows: begin      //¹öÆ°
          rc := Bounds(Left, Top, Width, Height);
          if Color = ClWhite then begin    //¾ÆÀÌÅÛ ±âº» Å×µÎ¸®
             Surface.Canvas.Brush.Color := clGray;
          end else
          if Color = clYellow then begin   //¹öÆ° Å×µÎ¸®
             Surface.Canvas.Brush.Color := clOlive;
          end else
             Surface.Canvas.Brush.Color := GetRGB(9);

          Surface.Canvas.FrameRect(rc);
        end;
      s_Legend: begin           //¹öÆ°
          rc := Bounds(Left, Top, Width, Height);
          if Color = clWhite then begin    //¾ÆÀÌÅÛ ±âº» Å×µÎ¸®
             Surface.Canvas.Brush.Color := clGray;
          end else
          if Color = clYellow then begin   //¹öÆ° Å×µÎ¸®
             Surface.Canvas.Brush.Color := clOlive;
          end else
             Surface.Canvas.Brush.Color := GetRGB(9);

          Surface.Canvas.FrameRect(rc);
        end;
      s_Hint: begin
          rc := Bounds(Left, Top, Width, Height);
          Surface.Canvas.Brush.Color := clGray;
          Surface.Canvas.FrameRect(rc);
        end;
    end;
    for I := 0 to Count - 1 do begin
      Items[I].Draw(Surface);
    end;
    Surface.Canvas.Release;
end;

function TDrawScreenHintList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDrawScreenHintList.Get(Index: Integer): TDrawScreenHintLines;
begin
  Result := FList.Items[Index];
end;


{-------------------------------------------------------------------------------}

constructor TDrawScreenHintLines.Create(AOwner: TDrawScreenHintList);
begin
  FOwner := AOwner;
  FOwner.Add(Self);
  FList := TList.Create;
end;

destructor TDrawScreenHintLines.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do begin
    TDrawScreenHint(FList.Items[I]).Free;
  end;
  FreeAndNil(FList);
  inherited;
end;

function TDrawScreenHintLines.Add: TDrawScreenHint;
var
  Hint: TDrawScreenHint;
begin
  Hint := TDrawScreenHint.Create(Self);
  FList.Add(Hint);
  Result := Hint;
end;

function TDrawScreenHintLines.GetLeft: Integer;
begin
  if Count > 0 then Result := Items[0].Left
  else Result := 0;
end;

function TDrawScreenHintLines.GetTop: Integer;
begin
  if Count > 0 then Result := Items[0].Top
  else Result := 0;
end;

function TDrawScreenHintLines.GetWidth: Integer;
var
  I: Integer;
begin
  //nW := 0;
  Result := 0;
  for I := 0 to Count - 1 do begin
    //if nW < Items[I].Width then
    Result := Result + Items[I].Width;    //Æø¿¬±¸
  end;
  //Result := nW;
end;

function TDrawScreenHintLines.GetHeight: Integer;
var
  I, nH: Integer;
begin
  nH := 0;
  for I := 0 to Count - 1 do begin
    if nH < Items[I].Height then
      nH := Items[I].Height;
  end;
  Result := nH;
end;

procedure TDrawScreenHintLines.Draw(Surface: TDirectDrawSurface);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do begin
    Items[I].Draw(Surface);
  end;
end;

function TDrawScreenHintLines.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TDrawScreenHintLines.Get(Index: Integer): TDrawScreenHint;
begin
  Result := FList.Items[Index];
end;

{-------------------------------------------------------------------------------}

constructor TDrawScreenHint.Create(AOwner: TDrawScreenHintLines);
begin
  FOwner := AOwner;
  FClientRect := Bounds(0, 0, 0, 0);
end;

destructor TDrawScreenHint.Destroy;
begin
  inherited;
end;

function TDrawScreenHint.GetPosition(const Index: Integer): Integer;
begin
  case Index of
    2: Result := FClientRect.Right - FClientRect.Left;  //Æø¿¬±¸
    3: Result := FClientRect.Bottom - FClientRect.Top;
  else Result := 0;
  end;
end;

procedure TDrawScreenHint.SetPosition(const Index, Value: Integer);
var
  Aux: Integer;
  NewRect: TRect;
begin
  NewRect := FClientRect;
  case Index of
    0: begin
        Aux := NewRect.Right - NewRect.Left;
        NewRect.Left := Value;
        NewRect.Right := Value + Aux;
      end;
    1: begin
        Aux := NewRect.Bottom - NewRect.Top;
        NewRect.Top := Value;
        NewRect.Bottom := Value + Aux;
      end;
    2: NewRect.Right := NewRect.Left + Value;
    3: NewRect.Bottom := NewRect.Top + Value;
  end;
  FClientRect := NewRect;
end;

function TDrawScreenHint.Add(X, Y: Integer; AHint: string = '';
  AColor: TColor = clWhite): TRect;
var
  d: TDirectDrawSurface;
  data, cmdstr: String;
begin
  FHint := AHint;
  FColor := AColor;

  Left := X;
  Top := Y;

  if Hint <> '' then begin
    Width := Width + frmMain.Canvas.TextWidth(Hint);       //Æø¿¬±¸
    if Hint = '¡¡' then begin
      Height := _MAX(Height, frmMain.Canvas.TextHeight(Hint) - 2);               //ÈùÆ® »çÀÌÁî
    end else
      Height := _MAX(Height, frmMain.Canvas.TextHeight(Hint));
  end;
  data := Hint;
  if data <> '' then begin
    while (pos('<', data) > 0) and (pos('>', data) > 0) and (data <> '') do begin
      data := ArrestStringEx(data, '<', '>', cmdstr);
      if cmdstr <> '' then begin
        Width := Width - frmMain.Canvas.TextWidth('<'+cmdstr+'>');
      end;
    end;
  end;

  Result := Bounds(Left, Top, Width, Height);
end;

procedure TDrawScreenHint.Draw(Surface: TDirectDrawSurface);
var
  rc :TRect;
  FWidth: Integer;
  fdata, cmdstr, temp, cmd, cmdinfo, Str: string;
  nLeng, Len, I, cmdi: Integer;
  fColor: TColor;
  boCmd: Boolean;
  data: String;
begin
  if (Owner <> nil) and (Owner.Owner <> nil) then begin                    //ÈùÆ® »çÀÌÁî
    SetBkMode (Surface.Canvas.Handle, TRANSPARENT);
    FWidth := FOwner.FOwner.FWidth;
    if Hint = '¡¡' then begin
      rc := Bounds(Left - 4 , Top + 3, FWidth - 1 , 1);
      if Color = clYellow then begin   //¹öÆ° Å×µÎ¸®
        Surface.Canvas.Brush.Color := clOlive;
      end else
      Surface.Canvas.Brush.Color := clGray;
      Surface.Canvas.FrameRect(rc);
    end;

    if Hint <> '' then begin
      Str := Hint;
      len := Length(Str);
      nLeng := 1;
      fColor := Color;
      temp := '';
      cmdstr := '';
      cmdi := 1;
      boCmd := False;
      i := 1;
      while True do begin
        if i > len then begin
          Str := '';
          break;
        end;
        if boCmd then begin
          if Str[i] = '>' then begin
            boCmd := False;
            if Length(cmdstr) >= 2 then begin
              cmd := Copy(cmdstr, 1, 2);
              cmdinfo := Copy(cmdstr, 3, Length(cmdstr) - 2);
              if cmd = 'CO' then begin
                fColor := StrToIntDef(cmdinfo, Color);
              end;
              if cmd = 'CE' then begin
                fColor := Color;
              end;
            end;
            if i >= len then begin
              Str := '';
              break;
            end;
            Inc(I);
            Continue;
          end;
          if byte(Str[i]) >= $81 then begin
            cmdstr := cmdstr + Str[i];
            Inc(i);
            if i <= len then
              cmdstr := cmdstr + Str[i]
            else begin
              Str := '';
              break;
            end;
          end
          else
            cmdstr := cmdstr + Str[i];
          Inc(i);
          Continue;
        end
        else if Str[i] = '<' then begin
          boCmd := True;
          cmdi := i - 1;
          Inc(i);
          if temp <> '' then begin
            TextOutA(Surface, Left + nLeng, Top, fColor, temp);
            Inc(nLeng, Surface.Canvas.TextWidth(temp));
            temp := '';
          end;
          cmdstr := '';
          Continue;
        end
        else if byte(Str[i]) >= $81 then begin
          fdata := Str[i];
          Inc(i);
          if i <= len then
            fdata := fdata + Str[i]
          else
            break;
        end
        else
        fdata := Str[i];
        if (nLeng + Surface.Canvas.TextWidth(temp + fdata)) > (g_FScreenWidth - 10) then begin
          TextOutA(Surface, Left + nLeng, Top, fColor, temp);
          Str := Copy(Str, cmdi + 1, len - cmdi);
          temp := '';
          Break;
        end;
        if temp = '¡¡' then temp := '';
        if fdata = '¡¡' then fdata := '';
        temp := temp + fdata;
        cmdi := i;
        Inc(i);
      end;
      if temp <> '' then begin
        TextOutA(Surface, Left + nLeng, Top, fColor, temp);
        Str := '';
      end;
    end;
    Surface.Canvas.Release;
  end;
end;

{------------------------------------------------------------------------------}

constructor TDrawScreen.Create;
var
   i: integer;
begin
   CurrentScene := nil;

   DrawScreenHintManage := TDrawScreenHintManage.Create;
   m_DrawScreenXYManage := TDrawScreenXYManage.Create;
   m_SysMsgList := TStringList.Create;
   m_SysInfoList := TList.Create;          //ÈùÆ®
   m_nShowSysTick := GetTickCount;           //ÈùÆ®

   m_SysMsgGM := TStringList.Create;

   m_NewSayMsgList := TList.Create;
   m_SayTransferList := TList.Create;

   ListHint4 := TStringList.Create;
   ListHint5 := TStringList.Create;
end;

destructor TDrawScreen.Destroy;
var
  I: Integer;
  SayHint: pTSayHint;
begin
   ClearChatBoard;
   for i := 0 to m_SysMsgList.Count - 1 do begin
     SayHint := pTSayHint(m_SysMsgList.Objects[i]);
     SayHint.Saysurface.free;
     Dispose(SayHint);
   end;
   m_SysMsgList.Free;
   for I := 0 to m_SysInfoList.Count - 1 do begin       //ÈùÆ®
     Dispose(pTAddSysInfo(m_SysInfoList[I]));
   end;
   m_SysInfoList.Free;

   m_SysMsgGM.Free;
   ListHint4.Free;
   ListHint5.Free;

   m_NewSayMsgList.Free;
   m_SayTransferList.Free;
   m_DrawScreenXYManage.Free;
   DrawScreenHintManage.Free;

   inherited Destroy;
end;

procedure TDrawScreen.Initialize;
begin
end;

procedure TDrawScreen.Finalize;
begin
end;

procedure TDrawScreen.KeyPress (var Key: Char);
begin
   if CurrentScene <> nil then
      CurrentScene.KeyPress (Key);
end;

procedure TDrawScreen.KeyDown (var Key: Word; Shift: TShiftState);
begin
   if CurrentScene <> nil then
      CurrentScene.KeyDown (Key, Shift);
end;

procedure TDrawScreen.MouseMove (Shift: TShiftState; X, Y: Integer);
begin
   if CurrentScene <> nil then
      CurrentScene.MouseMove (Shift, X, Y);
end;

procedure TDrawScreen.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if CurrentScene <> nil then
      CurrentScene.MouseDown (Button, Shift, X, Y);
end;

procedure TDrawScreen.ChangeScene (scenetype: TSceneType);
begin
   if CurrentScene <> nil then
      CurrentScene.CloseScene;
   case scenetype of
      stLogin:  CurrentScene := LoginScene;     
      stSelectCountry:  ;
      stSelectChr: CurrentScene := SelectChrScene;
      stNewChr:     ;
      stPlayGame: CurrentScene := PlayScene;
   end;
   if CurrentScene <> nil then begin
      CurrentScene.OpenScene;
      if (scenetype = stLogin) and g_boAutoLogin then begin
         LoginScene.m_sLoginId := LowerCase(g_sAutoID);
         FrmMain.SendLogin(LowerCase(g_sAutoID),g_sAutoPass);
      end;
   end;
end;



Function  TDrawScreen.NewSayMsgEx(nWidth, nHeight:Integer; UserSayType: TUserSayType): pTSayMessage;
begin
  New(Result);
  Result.ClickList := nil;
  Result.ItemList := nil;
  Result.ImageList := nil;
  Result.SaySurface := TDirectDrawSurface.Create(frmMain.DxDraw.DDraw);
  Result.SaySurface.SystemMemory := True;
  Result.SaySurface.SetSize(nWidth, nHeight);
  Result.SaySurface.Fill(0);
  Result.UserSayType := UserSayType;

end;


procedure TDrawScreen.AddSayMsg(str: string; FColor: Integer; BColor: Integer; boSys: Boolean; UserSayType: TUserSayType; boFirst: Boolean = True);
var
  ClickName: pTClickName;
  ClickItem: pTClickItem;
  SayImage: pTSayImage;
  SayMessage: pTSayMessage;
  WideStr, WideStr2: WideString;
  i, ii, nid, nident, nindex: integer;
  nLen, nTextLen: integer;
  tstr, tstr2, AddStr, AddStr2, OldStr, OldStr2, cmdstr, sid, sident,sitemname, sindex, sfcolor, sbcolor: string;
  sname, sClickIndex: string;
  boClickName, boClickItem, boBeginColor, boImage: Boolean;
  nFColor, nBColor, tmClolor: Integer;
  d: TDirectDrawSurface;
  ClickIndex: integer;
  nError: integer;
begin
  if Str = '' then Exit;
  WideStr := str;
  nError := 0;
  try
  nError := 1;
  SayMessage := NewSayMsgEx(DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH, SAYLISTHEIGHT, UserSayType);
  nError := 2;
  if FColor = clblack then FColor := $40404;

  nLen := 0;
  nFColor := FColor;
  nBColor := BColor;
  nError := 3;
  with SayMessage.SaySurface do begin
    nError := 4;
    SetBkMode(Canvas.Handle, OPAQUE);
    Canvas.Font.Name := g_sCurFontName;
    Canvas.Font.Size := 9;
    boClickName := False;
    boClickItem := False;
    boBeginColor := False;
    boImage := False;
    AddStr := '';
    nError := 5;
    for I := 1 to Length(WideStr) do begin
      tstr := WideStr[i];
      OldStr := Copy(WideStr, I + 1, Length(WideStr));
      if boImage then begin
        if tstr = '|' then begin
          boImage := False;
          nindex := StrToIntDef(cmdstr, -1);
          if nIndex in [Low(g_FaceIndexInfo)..High(g_FaceIndexInfo)] then begin
            if (nLen + SAYFACEWIDTH) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
              OldStr := '|' + cmdstr + '|' + OldStr;
              TextOutEx(SayMessage.SaySurface, nLen, 0, '    ', nFColor, nBColor);
              cmdstr := '';
              Break;
            end else begin
              New(SayImage);
              SayImage.nLeft := nLen;
              SayImage.nRight := nLen + SAYFACEWIDTH;
              SayImage.nIndex := nIndex;
              TextOutEx(SayMessage.SaySurface, nLen, 0, '    ', nFColor, nBColor);
              Inc(nLen, SAYFACEWIDTH);
              if SayMessage.ImageList = nil then SayMessage.ImageList := TList.Create;
              SayMessage.ImageList.Add(SayImage);
            end;
          end;
          cmdstr := '';
        end else cmdstr := cmdstr + tstr;
      end else
      if boClickName then begin
        if tstr = #7 then begin
          ClickIndex := 0;
          boClickName := False;
          sClickIndex := GetValidStr3(cmdstr, sname, ['\']);
          if sClickIndex <> '' then ClickIndex := StrToIntDef(sClickIndex, 0);
          cmdstr := sname;
          nTextLen := Canvas.TextWidth(cmdstr);
          if (nLen + nTextLen) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
            WideStr2 := cmdstr;
            cmdstr := '';
            AddStr2 := '';
            for ii := 1 to Length(WideStr2) do begin
              tstr2 := WideStr2[ii];
              OldStr2 := Copy(WideStr2, ii + 1, Length(WideStr2));
              if (nLen + Canvas.TextWidth(AddStr2 + tstr2)) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
                nTextLen := Canvas.TextWidth(AddStr2);
                New(ClickName);
                ClickIndex := Integer(ClickName);
                ClickName.nLeft := nLen;
                ClickName.sStr := AddStr2;
                ClickName.nRight := nLen + nTextLen;
                ClickName.Index := ClickIndex;
                if SayMessage.ClickList = nil then SayMessage.ClickList := TList.Create;
                SayMessage.ClickList.Add(ClickName);
                if UserSayType in [us_Hear, us_Group, us_Guild] then begin
                  if (OldStr2 = (g_MySelf.m_sUserName)) or (OldStr2 = (g_MySelf.m_sUserName + '(' + g_sGuildName + ')'))  then
                    TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr2, $40404, $CEBA9C)
                  else TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr2, $40404, $B5BEBD);
                end else
                TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr2, nFColor, nBColor);
                Inc(nLen, nTextLen);
                AddStr2 := '';
                OldStr2 := tstr2 + OldStr2;
                break;
              end else AddStr2 := AddStr2 + tstr2;
            end;
            AddStr := '';
            OldStr := #7 + OldStr2 + '\' + IntToStr(ClickIndex) + #7 + OldStr;
            cmdstr := '';
            break;
          end else begin
            New(ClickName);
            ClickName.nLeft := nLen;
            ClickName.sStr := cmdstr;
            ClickName.nRight := nLen + nTextLen;
            ClickName.Index := ClickIndex;
            if UserSayType in [us_Hear, us_Group, us_Guild] then begin
              if (cmdstr = (g_MySelf.m_sUserName)) or (cmdstr = (g_MySelf.m_sUserName + '(' + g_sGuildName + ')')) then
                TextOutEx(SayMessage.SaySurface, nLen, 0, cmdstr, $40404, $CEBA9C)
              else TextOutEx(SayMessage.SaySurface,  nLen, 0, cmdstr, $40404, $B5BEBD);
            end else
            TextOutEx(SayMessage.SaySurface, nLen, 0, cmdstr, nFColor, nBColor);
            Inc(nLen, nTextLen);
            cmdstr := '';
            if SayMessage.ClickList = nil then SayMessage.ClickList := TList.Create;
            SayMessage.ClickList.Add(ClickName);
          end;

        end else cmdstr := cmdstr + tstr;
      end else
      if boClickItem then begin
        if tstr = '}' then begin
          boClickItem := False;
          cmdstr := GetValidStr3(cmdstr, sid, ['/']);
          cmdstr := GetValidStr3(cmdstr, sident, ['/']);
          cmdstr := GetValidStr3(cmdstr, sitemname, ['/']);
          cmdstr := GetValidStr3(cmdstr, sindex, ['/']);
          cmdstr := GetValidStr3(cmdstr, sname, ['/']);
          cmdstr := GetValidStr3(cmdstr, sClickIndex, ['/']);
          cmdstr := '';
          nid := StrToIntDef(sid, -1);
          nident := StrToIntDef(sident, -1);
          nindex := StrToIntDef(sindex, 0);
          if (nId >= 0) and (nident > 0) and (nindex <> 0) then begin
            if sitemname <> '' then begin
              ClickIndex := 0;
              if sClickIndex <> '' then begin
                cmdstr := sname;
                ClickIndex := StrToIntDef(sClickIndex, 0);
              end else cmdstr := '[' + sitemname + ']';
              Canvas.Font.Style := [fsBold];
              nTextLen := Canvas.TextWidth(cmdstr);
              Canvas.Font.Style := [];
              if (nLen + nTextLen) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
                WideStr2 := cmdstr;
                cmdstr := '';
                AddStr2 := '';
                for ii := 1 to Length(WideStr2) do begin
                  tstr2 := WideStr2[ii];
                  OldStr2 := Copy(WideStr2, ii + 1, Length(WideStr2));
                  if (nLen + Canvas.TextWidth(AddStr2 + tstr2)) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
                    nTextLen := Canvas.TextWidth(AddStr2);
                    New(ClickItem);
                    SafeFillChar(ClickItem^, SizeOf(TClickItem), #0);
                    ClickIndex := Integer(ClickItem);
                    ClickItem.nLeft := nLen;
                    ClickItem.sStr := AddStr2;
                    ClickItem.nRight := nLen + nTextLen;
                    ClickItem.nIndex := nid;
                    ClickItem.wIdent := nident;
                    ClickItem.ItemIndex := nindex;
                    ClickItem.Index := ClickIndex;
                    if SayMessage.ItemList = nil then SayMessage.ItemList := TList.Create;
                    SayMessage.ItemList.Add(ClickItem);
                    tmClolor := $80FF;
                    if (nBColor = clRed) or (nBColor = $DC) or (nBColor = $FF00) or (nBColor = $21ADEF) then
                      tmClolor := $FF0000;
                    if (nBColor = clYellow) or (nBColor = $E7F7) then
                      tmClolor := $FF0000;
                    Canvas.Font.Style := [fsBold];
                    BoldTextOut(SayMessage.SaySurface, nLen, 0, tmClolor, $40404, AddStr2);
                    Canvas.Font.Style := [];
                    Inc(nLen, nTextLen);
                    AddStr2 := '';
                    OldStr2 := tstr2 + OldStr2;
                    break;
                  end else AddStr2 := AddStr2 + tstr2;
                end;
                AddStr := '';
                OldStr := '{' + sid + '/' + sident + '/' + sitemname + '/' + sindex + '/' + OldStr2 + '/' + IntToStr(ClickIndex) + '}' + OldStr;
                cmdstr := '';
                Break;
              end else begin
                New(ClickItem);
                SafeFillChar(ClickItem^, SizeOf(TClickItem), #0);
                ClickItem.nLeft := nLen;
                ClickItem.sStr := cmdstr;
                ClickItem.nRight := nLen + nTextLen;
                ClickItem.nIndex := nid;
                ClickItem.wIdent := nident;
                ClickItem.ItemIndex := nindex;
                ClickItem.Index := ClickIndex;
                tmClolor := $80FF;
                if (nBColor = clRed) or (nBColor = $DC) or (nBColor = $FF00) or (nBColor = $21ADEF) then
                  tmClolor := $FF0000;
                if (nBColor = clYellow) or (nBColor = $E7F7) then
                  tmClolor := $FF0000;
                Canvas.Font.Style := [fsBold];
                BoldTextOut(SayMessage.SaySurface, nLen, 0, tmClolor, $40404, cmdstr);
                Canvas.Font.Style := [];
                Inc(nLen, nTextLen);
                cmdstr := '';
                if SayMessage.ItemList = nil then SayMessage.ItemList := TList.Create;
                SayMessage.ItemList.Add(ClickItem);
              end;
            end;
          end;
        end else cmdstr := cmdstr + tstr;
      end else
      if boBeginColor then begin
        if tstr = #6 then begin
          boBeginColor := False;
          sbcolor := GetValidStr3(cmdstr, sfcolor, ['/']);

          nFColor := StrToIntDef('$' + sfcolor, $FFFF);
          nBColor := StrToIntDef('$' + sbcolor, $FFFFFF);

          cmdstr := '';
        end else cmdstr := cmdstr + tstr;
      end else begin
        if tstr = #7 then begin
          boClickName := True;
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
        end else
        if tstr = '{' then begin
          boClickItem := True;
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
        end else
        if tstr = #6 then begin
          boBeginColor := True;
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
        end else
        if tstr = #5 then begin
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
          nFColor := FColor;
          nBColor := BColor;
        end else
        if tstr = '|' then begin
          boImage := True;
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
        end else
        if (nLen + Canvas.TextWidth(AddStr + tstr)) > (DEFSAYLISTWIDTH + g_FScreenWidth - DEFSCREENWIDTH - 1) then begin
          TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
          Inc(nLen, Canvas.TextWidth(AddStr));
          AddStr := '';
          cmdstr := '';
          OldStr := tstr + OldStr;
          Break;
        end else AddStr := AddStr + tstr;
      end;
    end;
    nError := 6;
    if AddStr <> '' then begin
      nError := 7;
      TextOutEx(SayMessage.SaySurface, nLen, 0, AddStr, nFColor, nBColor);
      Inc(nLen, Canvas.TextWidth(AddStr));
    end;
    Canvas.Release;
    nError := 8;
    m_NewSayMsgList.Add(SayMessage);
    if g_boModeC = 0 then begin
      nError := 9;
      if (UserSayType <> g_SayShowType) or (g_SayShowType = us_All) then begin
        m_SayTransferList.Add(SayMessage);
      end else
      if (UserSayType in [us_Hear, us_Cry, us_Whisper, us_Lover, us_Master, us_Group, us_Guild, us_Sys, us_GuildAlly]) then begin
        g_SayEffectIndex[UserSayType] := True;
      end;
    end else begin
      nError := 10;
      if (UserSayType = g_SayType) then begin
        m_SayTransferList.Add(SayMessage);
      end else
      if (UserSayType in [us_Hear, us_Cry, us_Whisper, us_Lover, us_Master, us_Group, us_Guild, us_Sys, us_GuildAlly]) then begin
        g_SayEffectIndex[UserSayType] := True;
      end;
    end;
    nError := 11;
    if m_NewSayMsgList.Count > 100 then begin
      SayMessage := m_NewSayMsgList[0];
      DelTransferMsg(SayMessage);
      DisposeSayMsg(SayMessage);
      Dispose(SayMessage);
      m_NewSayMsgList.Delete(0);
    end;
    nError := 12;
    FrmDlg.DSayUpDown.MaxPosition := _MAX(0, m_SayTransferList.count - FrmDlg.DNewSay.Height div SAYLISTHEIGHT);
    if not g_SayUpDownLock then
      FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.MaxPosition;
    if OldStr <> '' then
      AddSayMsg(OldStr, FColor, BColor, boSys, UserSayType, False);
    nError := 13;
  end;
  except
    DebugOutStr('AddSayMsg :: Error :=> ' + IntToStr(nError));
  end;
end;

procedure TDrawScreen.DisposeSayMsg(SayMessage: pTSayMessage);
var
  i: integer;
begin
  if SayMessage.ClickList <> nil then begin
    for I := 0 to SayMessage.ClickList.Count - 1 do begin
      Dispose(pTClickName(SayMessage.ClickList[i]));
    end;
    SayMessage.ClickList.Free;
    SayMessage.ClickList := nil;
  end;
  if SayMessage.ItemList <> nil then begin
    for I := 0 to SayMessage.ItemList.Count - 1 do begin
      Dispose(pTClickItem(SayMessage.ItemList[i]));
    end;
    SayMessage.ItemList.Free;
    SayMessage.ItemList := nil;
  end;
  if SayMessage.ImageList <> nil then begin
    for I := 0 to SayMessage.ImageList.Count - 1 do begin
      Dispose(pTSayImage(SayMessage.ImageList[i]));
    end;
    SayMessage.ImageList.Free;
    SayMessage.ImageList := nil;
  end;
  if SayMessage.SaySurface <> nil then begin
    SayMessage.SaySurface.Free;
    SayMessage.SaySurface := nil;
  end;
end;

procedure TDrawScreen.DelTransferMsg(SayMessage: pTSayMessage);
var
  i: Integer;
begin
  for I := 0 to m_SayTransferList.Count - 1 do begin
    if m_SayTransferList[I] = SayMessage then begin
      m_SayTransferList.Delete(I);
      break;
    end;
  end;
end;

procedure TDrawScreen.ChangeTransferMsg(UserSaySet: TUserSaySet; sayt: Byte = 0);
var
  i: Integer;
  UserSayType: TUserSayType;
begin
  if (sayt = 1) then begin
    for UserSayType := us_All to us_None do begin
      g_SayEffectIndex[UserSayType] := False;
    end;
  end;
  m_SayTransferList.Clear;
  for I := 0 to m_NewSayMsgList.Count - 1 do begin
    if (pTSayMessage(m_NewSayMsgList[I]).UserSayType in UserSaySet) then begin
      m_SayTransferList.Add(m_NewSayMsgList[I]);
    end;
  end;

  FrmDlg.DSayUpDown.MaxPosition := _MAX(0, m_SayTransferList.count - FrmDlg.DNewSay.Height div SAYLISTHEIGHT);
  if not g_SayUpDownLock then
    FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.MaxPosition;
end;


procedure TDrawScreen.AddSysMsg(str: string; nX, nY: Integer; Color: TColor; boFirst: Boolean = True; DefColor: TColor = 0);      //ÈùÆ®
var
  AddSysInfo: pTAddSysInfo;
begin
  New(AddSysInfo);
  AddSysInfo.str := str;
  AddSysInfo.Color := Color;
  AddSysInfo.DefColor := DefColor;
  AddSysInfo.boFirst := boFirst;
  m_SysInfoList.Add(AddSysInfo);
  if m_SysInfoList.Count > 9 then begin
    Dispose(pTAddSysInfo(m_SysInfoList[0]));
    m_SysInfoList.Delete(0);
  end;
  if m_SysMsgList.Count < 5 then
    m_nShowSysTick := 0;
end;

procedure TDrawScreen.ClearSysMsg;                 //ÈùÆ®
var
  SayHint: pTSayHint;
  I: Integer;
begin
  for I := 0 to m_SysMsgList.Count - 1 do begin
    SayHint := pTSayHint(m_SysMsgList.Objects[I]);
    SayHint.SaySurface.Free;
    Dispose(SayHint);
  end;
  m_SysMsgList.Clear;
  for I := 0 to m_SysInfoList.Count - 1 do begin
    Dispose(pTAddSysInfo(m_SysInfoList[I]));
  end;
  m_SysInfoList.Clear;
end;


procedure TDrawScreen.AddSysOldMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);
begin
  m_DrawScreenXYManage.AddSysMsg(Msg, nX, nY, Color, DefColor);
end;


procedure TDrawScreen.AddMoveMsg(sMsg: string);    //È­¸é°øÁö
begin
  if m_SysMsgGM.Count >= 1 then m_SysMsgGM.Delete(0);
  m_SysMsgGM.AddObject(sMsg, TObject(GetTickCount));
end;

procedure TDrawScreen.AddCoolTime (msg: string;Tiem:integer);  //¸®ÄÝ
begin
  if m_CoolTimeMSG.Count >= 1 then m_CoolTimeMSG.Delete(0);

  FrmMain.Timer2.Enabled := True;
  Tiem := Tiem * 1000;
  m_CoolTimeMSG.AddObject(msg,TObject(Tiem));
end;

procedure TDrawScreen.AddChatBoardString (str: string; fcolor, bcolor: integer);      //Ã¤ÆÃÃ¢
begin
   AddSayMsg(str, fcolor, bcolor, True, us_Sys);
end;


procedure TDrawScreen.ShowHintA(X, Y: Integer; Str: string; Color: TColor; drawup: Boolean);    //±âº» ÈùÆ®Ã¢(¹öÆ°)
var
  data: string;
  I, II, nY, nW, nH: Integer;

  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  DrawScreenHintList := TDrawScreenHintList.Create(DrawScreenHintManage);
  DrawScreenHintList.Style := s_Legend;
  DrawScreenHintList.Color := Color;
  while True do begin
    if Str = '' then Break;
    Str := GetValidStr3(Str, data, ['\']);
    if data <> '' then begin
      if DrawScreenHintList.Count > 0 then begin
        nY := DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Top + DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Height + 1;
      end else begin
        nY := Y;
      end;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, data, Color);
    end;
  end;

  if drawup then begin
    HintHeight := DrawScreenHintList.Height;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
      end;
    end;
  end;
  if DrawScreenHintList.Left < 0 then begin
    nW := Abs(DrawScreenHintList.Left);
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Left := DrawScreenHint.Left + nW;
      end;
    end;
  end;

  if DrawScreenHintList.Top < 0 then begin
    nH := Abs(DrawScreenHintList.Top);
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top + nH;
      end;
    end;
  end;

  if DrawScreenHintList.Left + DrawScreenHintList.Width > g_FScreenWidth then begin
    nW := g_FScreenWidth - DrawScreenHintList.Width;
    nW := DrawScreenHintList.Left - nW;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Left := DrawScreenHint.Left - nW;
      end;
    end;
  end;

  if DrawScreenHintList.Top + DrawScreenHintList.Height > g_FScreenHeight then begin
    nH := g_FScreenHeight - DrawScreenHintList.Height;
    nH := DrawScreenHintList.Top - nH;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top - nH;
      end;
    end;
  end;
end;

procedure TDrawScreen.ShowHintS(X, Y: Integer; HintStringList: TStringList; drawup: Boolean);     //»óÁ¡¿ë
  function GetStarsRow(Level: Byte): Integer;
  begin
    if Level >= 10 then begin
      Result := Level div 10;
      if Level mod 10 > 0 then Inc(Result);
    end else
      if Level > 0 then begin
      Result := 1;
    end else Result := 0;
  end;

var
  I, II, nX, nY, nRow, nH, nW: Integer;

  Level: Byte;
  nLevel: Integer;

  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  if HintStringList.Count > 0 then begin
    DrawScreenHintList := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList.Style := s_BItem;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList.Strings[0], TColor(HintStringList.Objects[0]));

    for I := 1 to HintStringList.Count - 1 do begin
      nY := DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Top + DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList.Strings[I], TColor(HintStringList.Objects[I]));
    end;

    if drawup then begin
      HintHeight := DrawScreenHintList.Height;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    if DrawScreenHintList.Left < 0 then begin
      nW := Abs(DrawScreenHintList.Left);
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
    end;

    if DrawScreenHintList.Top < 0 then begin
      nH := Abs(DrawScreenHintList.Top);
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
    end;

    if DrawScreenHintList.Left + DrawScreenHintList.Width > g_FScreenWidth then begin
      nW := g_FScreenWidth - DrawScreenHintList.Width;
      nW := DrawScreenHintList.Left - nW;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;
    end;

    if DrawScreenHintList.Top + DrawScreenHintList.Height > g_FScreenHeight then begin
      nH := g_FScreenHeight - DrawScreenHintList.Height;
      nH := DrawScreenHintList.Top - nH;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
    end;
  end;
end;

procedure TDrawScreen.MagicShowHint(X, Y: Integer; Magic: nMagicType;  Color: TColor; drawup, drawLeft : Boolean);    //±âº» ÈùÆ®Ã¢(¹öÆ°)
var
  data: string;
  I, II, nY, nW, nH: Integer;

  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  DrawScreenHintList := TDrawScreenHintList.Create(DrawScreenHintManage);
  DrawScreenHintList.Style := s_Legend;
  DrawScreenHintList.Color := Color;
  for i:=0 to 12 do begin
    if Magic.MagicStr[i] = '' then Continue;
    if Magic.MagicStr[i] <> '' then begin
      if DrawScreenHintList.Count > 0 then begin
        nY := DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Top + DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Height + 1;
      end else begin
        nY := Y;
      end;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, Magic.MagicStr[i], TColor(Magic.StrColor[i]));
    end;
  end;

  if drawup then begin
    HintHeight := DrawScreenHintList.Height;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
      end;
    end;
  end;

  if drawLeft then begin
    HintLeft := DrawScreenHintList.Width;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Left := DrawScreenHint.Left - HintLeft;
      end;
    end;
  end;

  if DrawScreenHintList.Left < 0 then begin
    nW := Abs(DrawScreenHintList.Left);
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Left := DrawScreenHint.Left + nW;
      end;
    end;
  end;

  if DrawScreenHintList.Top < 0 then begin
    nH := Abs(DrawScreenHintList.Top);
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top + nH;
      end;
    end;
  end;

  if DrawScreenHintList.Left + DrawScreenHintList.Width > g_FScreenWidth then begin
    nW := g_FScreenWidth - DrawScreenHintList.Width;
    nW := DrawScreenHintList.Left - nW;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Left := DrawScreenHint.Left - nW;
      end;
    end;
  end;

  if DrawScreenHintList.Top + DrawScreenHintList.Height > g_FScreenHeight then begin
    nH := g_FScreenHeight - DrawScreenHintList.Height;
    nH := DrawScreenHintList.Top - nH;
    for I := 0 to DrawScreenHintList.Count - 1 do begin
      DrawScreenHintLines := DrawScreenHintList.Items[I];
      for II := 0 to DrawScreenHintLines.Count - 1 do begin
        DrawScreenHint := DrawScreenHintLines.Items[II];
        DrawScreenHint.Top := DrawScreenHint.Top - nH;
      end;
    end;
  end;
end;

procedure TDrawScreen.ShowHintB(X, Y: Integer; HintStringList: TStringList; drawup: Boolean);     //¾ÆÀÌÅÛ ºñ±³x
  function GetStarsRow(Level: Byte): Integer;
  begin
    if Level >= 10 then begin
      Result := Level div 10;
      if Level mod 10 > 0 then Inc(Result);
    end else
      if Level > 0 then begin
      Result := 1;
    end else Result := 0;
  end;

var
  I, II, nX, nY, nRow, nH, nW: Integer;

  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  if HintStringList.Count > 0 then begin
    DrawScreenHintList := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList.Style := s_Item;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList.Strings[0], TColor(HintStringList.Objects[0]) );


    for I := 1 to HintStringList.Count - 1 do begin
      nY := DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Top + DrawScreenHintList.Items[DrawScreenHintList.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList.Strings[I], TColor(HintStringList.Objects[I]));
    end;

    if drawup then begin
      HintHeight := DrawScreenHintList.Height;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    if DrawScreenHintList.Left < 0 then begin
      nW := Abs(DrawScreenHintList.Left);
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
    end;

    if DrawScreenHintList.Top < 0 then begin
      nH := Abs(DrawScreenHintList.Top);
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
    end;

    if DrawScreenHintList.Left + DrawScreenHintList.Width > g_FScreenWidth then begin
      nW := g_FScreenWidth - DrawScreenHintList.Width;
      nW := DrawScreenHintList.Left - nW;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;
    end;

    if DrawScreenHintList.Top + DrawScreenHintList.Height > g_FScreenHeight then begin
      nH := g_FScreenHeight - DrawScreenHintList.Height;
      nH := DrawScreenHintList.Top - nH;
      for I := 0 to DrawScreenHintList.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
    end;
  end;
end;

procedure TDrawScreen.ShowHintL(X, Y: Integer; HintStringList1, HintStringList2: TStringList; drawup: Boolean);      //¾ÆÀÌÅÛ ºñ±³ÇÒ¶§
var
  I, II, nX, nY, nRow, nW, nH: Integer;
  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList1: TDrawScreenHintList;
  DrawScreenHintList2: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  DrawScreenHintList1 := nil;
  DrawScreenHintList2 := nil;
  if HintStringList1.Count > 0 then begin
    DrawScreenHintList1 := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList1.Style := s_Item;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList1);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList1.Strings[0], TColor(HintStringList1.Objects[0]));

    for I := 1 to HintStringList1.Count - 1 do begin
      nY := DrawScreenHintList1.Items[DrawScreenHintList1.Count - 1].Top + DrawScreenHintList1.Items[DrawScreenHintList1.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList1);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList1.Strings[I], TColor(HintStringList1.Objects[I]));
    end;

    X := DrawScreenHintList1.Left + DrawScreenHintList1.Width + 6;
  end;

  if HintStringList2.Count > 0 then begin
    DrawScreenHintList2 := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList2.Style := s_Item;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList2);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList2.Strings[0], TColor(HintStringList2.Objects[0]));

    for I := 1 to HintStringList2.Count - 1 do begin
      nY := DrawScreenHintList2.Items[DrawScreenHintList2.Count - 1].Top + DrawScreenHintList2.Items[DrawScreenHintList2.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList2);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList2.Strings[I], TColor(HintStringList2.Objects[I]));
    end;
  end;

  if (DrawScreenHintList1 <> nil) and (DrawScreenHintList2 <> nil) then begin

    if drawup then begin
      HintHeight := DrawScreenHintList1.Height;
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    if drawup then begin
      HintHeight := DrawScreenHintList2.Height;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    nX := _MIN(DrawScreenHintList1.Left, DrawScreenHintList2.Left);
    if nX < 0 then begin
      nW := Abs(nX);
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
    end;

    nY := _MIN(DrawScreenHintList1.Top, DrawScreenHintList2.Top);
    if nY < 0 then begin
      nH := Abs(nY);
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
    end;

    if DrawScreenHintList2.Left + DrawScreenHintList2.Width > g_FScreenWidth then begin
      nW := g_FScreenWidth - DrawScreenHintList2.Width;
      nW := DrawScreenHintList2.Left - nW;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;

      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;
    end;

    nY := _MIN(DrawScreenHintList1.Top, DrawScreenHintList2.Top);
    nH := _MAX(DrawScreenHintList1.Height, DrawScreenHintList2.Height);
    if nY + nH > g_FScreenHeight then begin
      nH := nY - (g_FScreenHeight - nH);

      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
    end;
  end;
end;


procedure TDrawScreen.ShowHintk(X, Y: Integer; HintStringList1, HintStringList2: TStringList; drawup: Boolean);      //¾ÆÀÌÅÛ ºñ±³ÇÒ¶§
var
  I, II, nX, nY, nRow, nW, nH: Integer;
  rc: TRect;
  DrawScreenHint: TDrawScreenHint;
  DrawScreenHintList1: TDrawScreenHintList;
  DrawScreenHintList2: TDrawScreenHintList;
  DrawScreenHintLines: TDrawScreenHintLines;
begin
  ClearHint;
  DrawScreenHintList1 := nil;
  DrawScreenHintList2 := nil;
  if HintStringList1.Count > 0 then begin
    DrawScreenHintList1 := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList1.Style := s_KItem;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList1);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList1.Strings[0], TColor(HintStringList1.Objects[0]));

    for I := 1 to HintStringList1.Count - 1 do begin
      nY := DrawScreenHintList1.Items[DrawScreenHintList1.Count - 1].Top + DrawScreenHintList1.Items[DrawScreenHintList1.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList1);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList1.Strings[I], TColor(HintStringList1.Objects[I]));
    end;

    X := DrawScreenHintList1.Left + DrawScreenHintList1.Width + 6;
  end;

  if HintStringList2.Count > 0 then begin
    DrawScreenHintList2 := TDrawScreenHintList.Create(DrawScreenHintManage);
    DrawScreenHintList2.Style := s_KItem;
    DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList2);
    DrawScreenHint := DrawScreenHintLines.Add;
    DrawScreenHint.Add(X, Y, HintStringList2.Strings[0], TColor(HintStringList2.Objects[0]));

    for I := 1 to HintStringList2.Count - 1 do begin
      nY := DrawScreenHintList2.Items[DrawScreenHintList2.Count - 1].Top + DrawScreenHintList2.Items[DrawScreenHintList2.Count - 1].Height + 1;
      DrawScreenHintLines := TDrawScreenHintLines.Create(DrawScreenHintList2);
      DrawScreenHint := DrawScreenHintLines.Add;
      DrawScreenHint.Add(X, nY, HintStringList2.Strings[I], TColor(HintStringList2.Objects[I]));
    end;
  end;

  if (DrawScreenHintList1 <> nil) and (DrawScreenHintList2 <> nil) then begin

    if drawup then begin
      HintHeight := DrawScreenHintList1.Height;
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    if drawup then begin
      HintHeight := DrawScreenHintList2.Height;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - HintHeight;
        end;
      end;
    end;

    nX := _MIN(DrawScreenHintList1.Left, DrawScreenHintList2.Left);
    if nX < 0 then begin
      nW := Abs(nX);
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left + nW;
        end;
      end;
    end;

    nY := _MIN(DrawScreenHintList1.Top, DrawScreenHintList2.Top);
    if nY < 0 then begin
      nH := Abs(nY);
      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top + nH;
        end;
      end;
    end;

    if DrawScreenHintList2.Left + DrawScreenHintList2.Width > g_FScreenWidth then begin
      nW := g_FScreenWidth - DrawScreenHintList2.Width;
      nW := DrawScreenHintList2.Left - nW;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;

      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Left := DrawScreenHint.Left - nW;
        end;
      end;
    end;

    nY := _MIN(DrawScreenHintList1.Top, DrawScreenHintList2.Top);
    nH := _MAX(DrawScreenHintList1.Height, DrawScreenHintList2.Height);
    if nY + nH > g_FScreenHeight then begin
      nH := nY - (g_FScreenHeight - nH);

      for I := 0 to DrawScreenHintList1.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList1.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
      for I := 0 to DrawScreenHintList2.Count - 1 do begin
        DrawScreenHintLines := DrawScreenHintList2.Items[I];
        for II := 0 to DrawScreenHintLines.Count - 1 do begin
          DrawScreenHint := DrawScreenHintLines.Items[II];
          DrawScreenHint.Top := DrawScreenHint.Top - nH;
        end;
      end;
    end;
  end;
end;


procedure TDrawScreen.NewShowHint (x, y: integer; str: sItemMome;drawup: Boolean);
var
   w,i: integer;
begin
   ClearHint;
   HintX4 := x;
   HintY4 := y;
   HintWidth4 := 0;
   HintHeight4 := 0;
   HintUp4 := drawup;
   for i:=0 to 50-1 do begin
      if str.sItemopes[i] = '' then continue;
      w := FrmMain.Canvas.TextWidth (str.sItemopes[i] ) + 4 * 2;
      if w > HintWidth4 then HintWidth4 := w;
      if str.sItemopes[i] <> '' then begin
         ListHint4.AddObject(str.sItemopes[i] ,tobject(str.nColor[i]));
      end;
   end;
   HintHeight4 := (FrmMain.Canvas.TextHeight('A') + 1) * ListHint4.Count + 3 * 2;
   if HintUp4 then
      HintY4 := HintY4 - HintHeight4;
end;

procedure TDrawScreen.NewShowHint2 (x, y: integer; str: sItemMome;drawup: Boolean);
var
   w,i: integer;
begin
   ClearHint;
   HintX5 := x;
   HintY5 := y;
   HintWidth5 := 0;
   HintHeight5 := 0;
   HintUp5 := drawup;
   for i:=0 to 50-1 do begin
      if str.sItemopes[i] = '' then continue;
      w := FrmMain.Canvas.TextWidth (str.sItemopes[i] ) + 4 * 2;
      if w > HintWidth5 then HintWidth5 := w;
      if str.sItemopes[i] <> '' then begin
         ListHint5.AddObject(str.sItemopes[i] ,tobject(str.nColor[i]));
      end;
   end;
   HintHeight5 := (FrmMain.Canvas.TextHeight('A') + 1) * ListHint5.Count + 3 * 2;
   if HintUp5 then
      HintY5 := HintY5 - HintHeight5;
end;


procedure TDrawScreen.ClearHint;
begin
   ListHint4.Clear;
   ListHint5.Clear;
   DrawScreenHintManage.Clear;
end;

procedure TDrawScreen.ClearChatBoard;
var
   i :Integer;
  SayHint: ptSayHint;
   SayMessage: pTSayMessage;
begin
   for i := 0 to m_SysMsgList.Count - 1 do begin
    SayHint := ptSayHint(m_SysMsgList.Objects[i]);
    SayHint.Saysurface.free;
    Dispose(SayHint);
  end;
  m_SysMsgList.Clear;

  for I := 0 to m_SysInfoList.Count - 1 do begin          //ÈùÆ®
    Dispose(pTAddSysInfo(m_SysInfoList[I]));
  end;
  m_SysInfoList.Clear;
  for I := 0 to m_NewSayMsgList.Count - 1 do begin
    SayMessage := m_NewSayMsgList[i];
    DisposeSayMsg(SayMessage);
    Dispose(SayMessage);
  end;
  m_NewSayMsgList.Clear;
  m_SayTransferList.Clear;

  m_SysMsgGM.Clear;

end;


procedure TDrawScreen.DrawScreen (MSurface: TDirectDrawSurface);
   procedure NameTextOut (surface: TDirectDrawSurface; x, y, fcolor, bcolor: integer; namestr: string);
   var
      i, row: integer;
      nstr: string;
   begin
      row := 0;
      for i:=0 to 4 do begin
         if namestr = '' then break;
         namestr := GetValidStr3 (namestr, nstr, ['\']);
         BoldTextOut (surface,
                      x - surface.Canvas.TextWidth(nstr) div 2,
                      y + row * 12,
                      fcolor, bcolor, nstr);
         Inc (row);
      end;
   end;
var
   i, k, line, sx, sy, fcolor, bcolor, hh, Y: integer;
   actor: TActor;
   str, uname: string;
   dsurface: TDirectDrawSurface;
   d: TDirectDrawSurface;
   rc: TRect;
   infoMsg :String;                               //ÇÇÅë
   TabClickTime     : longword;
begin
   MSurface.Fill(0);
   if CurrentScene <> nil then CurrentScene.PlayScene (MSurface);

   if g_MySelf = nil then exit;

   if CurrentScene = PlayScene then begin
      with MSurface do begin
         with PlayScene do begin
            for k:=0 to m_ActorList.Count-1 do begin
               actor := m_ActorList[k];
               if g_FScreenWidth = 800 then begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end else begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end;
               if (actor.m_BoOpenHealth or actor.m_noInstanceOpenHealth) and (not actor.m_boDeath) and not (actor.m_btRace in [240..251]) and (actor.m_btRace <> 90) then begin  //¸¶·æ ÇÇÅë
                  if actor.m_noInstanceOpenHealth then
                     if GetTickCount - actor.m_dwOpenHealthStart > actor.m_dwOpenHealthTime then
                        actor.m_noInstanceOpenHealth := FALSE;
                  d := g_WMain2Images.Images[HEALTHBAR_BLACK];
                  if d <> nil then
                    if ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(actor.m_sUserName)) then begin
                    end else
                    if (actor.m_nState and $00004000 <> 0 ) and (actor.m_btRace = 157) then begin  //»ç·É¸÷ ¾Èº¸ÀÌ°Ô ÇÇÅë
                    end else
                    if (actor.m_nState and $00004000 <> 0 ) and     //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÇÇÅë
                      ((abs(actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(actor.m_sUserName)) then begin
                    end else MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 10, d.ClientRect, d, TRUE);

                    if actor.m_btRace = 0 then d := g_WMain2Images.Images[HEALTHBAR_RED] // 2010/03/05 Ã¼·ÂÇ¥½Ã Â÷º°È­
                    else d := g_WMain2Images.Images[HEALTHBAR_RED];
                    if d <> nil then begin
                       rc := d.ClientRect;
                       if actor.m_Abil.MaxHP > 0 then
                         rc.Right := Round((rc.Right-rc.Left) / actor.m_Abil.MaxHP * actor.m_Abil.HP);
                         if ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(actor.m_sUserName)) then begin
                         end else
                         if (actor.m_nState and $00004000 <> 0 ) and (actor.m_btRace = 157) then begin  //»ç·É¸÷ ¾Èº¸ÀÌ°Ô ÇÇÅë
                         end else
                         if (actor.m_nState and $00004000 <> 0 ) and             //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÇÇÅë
                            ((abs(actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(actor.m_sUserName)) then begin
                         end else MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 10, rc, d, TRUE);
                    end;
               end;
               if (actor = g_MySelf) and (actor.m_nState and $00080000 <> 0) then begin   //³¬½Ã Áß ÀÔÁú ÀÌÆÑÆ®
                  if (g_FishTime > g_FishTiming) and (g_FishTime < 180) then begin
                     d := g_WMainImages.Images[1350 + FrmDlg.AutoTimeIdx2];
                     if d <> nil then
                        MSurface.Draw (actor.m_nSayX - d.Width div 2 - 2, actor.m_nSayY - 50, d.ClientRect, d, TRUE)
                  end;
               end;

               if (Actor = g_MyHero) and (not actor.m_boDeath) then begin      //¿µ¿õ ¸¶Åë
                  d := g_WMain2Images.Images[0];
                  if d <> nil then
                    MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 7, d.ClientRect, d, TRUE);

                  d := g_WMain2Images.Images[10];
                  if d <> nil then begin
                    rc := d.ClientRect;
                    if (actor.m_Abil.MaxMP > 0) and (actor.m_Abil.MP <> 0) then
                      rc.Right := Round((rc.Right-rc.Left) / actor.m_Abil.MaxMP * actor.m_Abil.MP)
                    else
                      rc.Right := Round((rc.Right-rc.Left) / 1);
                    MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 7, rc, d, TRUE);
                  end;
               end;

               if (Actor = g_MyHero) and (not actor.m_boDeath) then begin   //¿µ¿õ ÇÇÅë
                 d := g_WMain2Images.Images[0];
                 if d <> nil then
                   MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 10, d.ClientRect, d, TRUE);

                 d := g_WMain2Images.Images[1];
                 if d <> nil then begin
                   rc := d.ClientRect;
                   if (actor.m_Abil.MaxHP > 0) and (actor.m_Abil.HP <> 0) then
                      rc.Right := Round((rc.Right-rc.Left) / actor.m_Abil.MaxHP * actor.m_Abil.HP)
                   else
                      rc.Right := Round((rc.Right-rc.Left) / 1);
                    MSurface.Draw (actor.m_nSayX - d.Width div 2, actor.m_nSayY - 10, rc, d, TRUE);
                 end;
               end;

            end;
         end;

         SetBkMode(Canvas.Handle, TRANSPARENT);
         if (g_FocusCret <> nil) and PlayScene.IsValidActor (g_FocusCret) then begin
            if g_FocusCret.m_btRace = 50 then
            g_FocusCret.m_nNameColor := ClLime; //¿£ÇÇ½Ã ÀÌ¸§ »ö
            if g_FocusCret.m_btRace in [240..251] then
            g_FocusCret.m_nNameColor := $00FFDD44; //¿µ¹° ÀÌ¸§ »ö
            if ((g_FocusCret.m_nState and $00000200 <> 0) or (g_FocusCret.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(g_FocusCret.m_sUserName)) then begin
            end else

            if (g_FocusCret.m_nState and $00004000 <> 0 ) and (g_FocusCret.m_btRace = 157) then begin  //»ç·É¸÷ ¾Èº¸ÀÌ°Ô ÀÌ¸§
            end else

            if (g_FocusCret.m_nState and $00004000 <> 0 ) and        //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÀÌ¸§
            ((abs(g_FocusCret.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(g_FocusCret.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(g_FocusCret.m_sUserName)) then begin
            end else

            if ((g_FocusCret.m_sUserName = 'ÄÏÂúòùòð') and (g_FocusCret.m_btRace = 19)) then begin
              uname := '';
            end else

            if g_boDeathMatch then
              uname := 'ÌôÕ½'
            else
              uname := g_FocusCret.m_sUserName + '\' + g_FocusCret.m_sDescUserName;

            if (not g_boNameChNpView) or (not g_boNameAllView) then begin
              if g_FocusCret.m_btRace in [0, 50] then begin
                if g_boPKZONE and (g_FocusCret.m_btRace = 0) and (g_FocusCret <> g_MySelf) then
                   uname := 'PKZONE';
                NameTextOut (MSurface,  g_FocusCret.m_nSayX, g_FocusCret.m_nSayY + 30, g_FocusCret.m_nNameColor, clBlack, uname);
              end;
            end;
            if (not g_boNameMonView) or (not g_boNameAllView) then begin
              if (g_FocusCret.m_btRace <> 0) and (g_FocusCret.m_btRace <> 50) then begin
                if g_boPKZONE then uname := 'PKZONE';
                 if g_FocusCret.m_btRace in [240..251] then
                    NameTextOut (MSurface,  g_FocusCret.m_nSayX, g_FocusCret.m_nSayY, g_FocusCret.m_nNameColor, clBlack, uname)
                 else
                   NameTextOut (MSurface,  g_FocusCret.m_nSayX, g_FocusCret.m_nSayY + 30, g_FocusCret.m_nNameColor, clBlack, uname);
              end;
            end;
         end;
         if g_boSelectMyself and ((not g_boNameAllView) or (not g_boNameChNpView)) then begin  //Ä¿¼­°¡ °¡¸®Å°´Â °÷ ÀÌ¸§
            if (Actor <> g_MySelf) and ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
            end else
            if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0 ) and (Actor.m_btRace = 157) then begin  //»ç·É¸÷ ¾Èº¸ÀÌ°Ô ÀÌ¸§
            end else

            if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0) and         //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÀÌ¸§
            ((abs(Actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(Actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
            end else

            if ((actor.m_sUserName = 'ÄÏÂúòùòð') and (actor.m_btRace = 19)) then begin
              uname := '';
            end else
            
            if g_boDeathMatch then
              uname := 'ÌôÕ½'
            else
              uname := g_MySelf.m_sUserName + '\' + g_MySelf.m_sDescUserName;

            NameTextOut (MSurface,
                      g_MySelf.m_nSayX,
                      g_MySelf.m_nSayY + 30,
                      g_MySelf.m_nNameColor, clBlack,
                      uname);
         end;

         if g_boNameAllView then begin        //ÀÌ¸§
            with PlayScene do begin
              for k:=0 to m_ActorList.Count-1 do begin
                actor := m_ActorList[k];
                if g_FScreenWidth = 800 then begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end else begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end;
                if actor.m_btRace = 50 then
                  actor.m_nNameColor := clLime;   //¿£ÇÇ½Ã ÀÌ¸§ »ö
                if actor.m_btRace in [240..251] then
                  actor.m_nNameColor := $00FFDD44; //¿µ¹° ÀÌ¸§ »ö
                if (Actor <> g_MySelf) and ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
                  end else
                if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0 ) and (Actor.m_btRace = 157) then begin  //»ç·É¸÷ ¾Èº¸ÀÌ°Ô ÀÌ¸§
                  end else
                if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0 ) and         //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÀÌ¸§
                  ((abs(Actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(Actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
                  end else
                if (actor.m_nSayX > 0) and (actor.m_nSayX < g_FScreenWidth) and (actor.m_nSayY > 0) and (actor.m_nSayY < (g_FScreenHeight - 100)) then begin
                  if (actor.m_sUserName = 'ÄÏÂúòùòð') and (actor.m_btRace = 19) then begin
                    uname := '';
                  end else
                  if g_boDeathMatch then
                    uname := 'ÌôÕ½'
                  else
                    uname := actor.m_sUserName + '\' + actor.m_sDescUserName;
                  if g_boNameChNpView then begin
                    if actor.m_btRace in [0, 50] then begin
                      if g_boPKZONE and (Actor.m_btRace = 0) and (actor <> g_MySelf) then
                        uname := 'PKZONE';
                      NameTextOut (MSurface, actor.m_nSayX, actor.m_nSayY + 30, actor.m_nNameColor, clBlack, uname);
                    end;
                  end;
                  if g_boNameMonView then begin
                    if (actor.m_btRace <> 0) and (actor.m_btRace <> 50) and (not actor.m_boDeath) then begin
                      if g_boPKZONE then uname := 'PKZONE';
                      if actor.m_btRace in [240..251] then
                        NameTextOut (MSurface, actor.m_nSayX, actor.m_nSayY, actor.m_nNameColor, clBlack, uname)
                      else
                        NameTextOut (MSurface, actor.m_nSayX, actor.m_nSayY + 30, actor.m_nNameColor, clBlack, uname);
                    end;
                  end;
                end;
              end;
             end;
         end;

         Canvas.Font.Color := clWhite;


         //System Message

         if (g_nAreaStateValue and $04) <> 0 then begin
           if g_boShowGreenHint then begin
             BoldTextOut (MSurface, 0, 13, clWhite, clBlack, '¹¥³ÇÇøÓò');
           end else begin
             BoldTextOut (MSurface, 0, 0, clWhite, clBlack, '¹¥³ÇÇøÓò');
           end;
         end;


         Canvas.Release;

            //ÏÔÊ¾½ÇÉ«Ëµ»°ÎÄ×Ö
         with PlayScene do begin
            for k:=0 to m_ActorList.Count-1 do begin
               actor := m_ActorList[k];
               if g_FScreenWidth = 800 then begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end else begin
                  if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
                   (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
                  (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //°úºÎÇÏ Å×½ºÆ®
                end;


               if (Actor <> g_MySelf) and ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
               end else
               if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0 ) and         //¿ù¿µ¼ú ¾Èº¸ÀÌ°Ô ÀÌ¸§
                  ((abs(Actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(Actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin
               end else begin

                  Actor.DrawStruck(MSurface);
                  Actor.ShowSayMsg(MSurface);
                  if (Actor.m_btRace = 0) and (not Actor.m_boisHero) and (not g_boPKZONE) then begin
                     Actor.ShowRankName(MSurface);
                  end;
               end;
            end;
         end; 


      end;
   end;
end;



procedure TDrawScreen.AddSysMsgEx(MSurface: TDirectDrawSurface; str: string; Color: TColor; boFirst: Boolean; DefColor: TColor);  //ÈùÆ®
  function GetStrLen: Integer;
  var
    nLen: Integer;
    sTempStr: string;
    sLenStr: string;
  begin
    sTempStr := GetValidStr3(str, sLenStr, ['<']);
    nLen := MSurface.Canvas.TextWidth(sLenStr);
    while sTempStr <> '' do begin
      sTempStr := GetValidStr3(sTempStr, sLenStr, ['>']);
      if sTempStr = '' then break;
      sTempStr := GetValidStr3(sTempStr, sLenStr, ['<']);
      Inc(nLen, MSurface.Canvas.TextWidth(sLenStr));
    end;
    Result := nLen;
  end;
var
  fdata, cmdstr, temp, cmd, cmdinfo: string;
  nLeng, Len, I, cmdi: Integer;
  boCmd: Boolean;
  fColor, bColor: TColor;
  SaySurface: TDirectDrawSurface;
  SayHint: pTSayHint;
  tempstr: string;
  nError:integer;
begin
  tempstr := '';
  if Str = '' then Exit;
  if boFirst then tempstr := str;
  nError := 0;
  try
  nError := 1;
  SetBkMode(MSurface.Canvas.Handle, TRANSPARENT);
  nLeng := GetStrLen;
  nError := 2;
  SaySurface := TDirectDrawSurface.Create(frmMain.DxDraw.DDraw);
  SaySurface.SystemMemory := True;
  SaySurface.SetSize(nLeng + 2, ADDSaYHEIGHT);
  SaySurface.Fill(0);
  nError := 3;
  with SaySurface do begin
    nError := 4;
    len := Length(str);
    SetBkMode(Canvas.Handle, TRANSPARENT);
    nLeng := 1;
    fColor := Color;
    bColor := $40404;
    if not boFirst then nLeng := 10;
    temp := '';
    cmdstr := '';
    cmdi := 1;
    boCmd := False;
    i := 1;
    nError := 5;
    while True do begin
      nError := 6;
      if i > len then begin
        str := '';
        break;
      end;
      nError := 7;
      if boCmd then begin
        nError := 8;
        if str[i] = '>' then begin
          nError := 9;
          boCmd := False;
          nError := 10;
          if Length(cmdstr) >= 2 then begin
            cmd := Copy(cmdstr, 1, 2);
            cmdinfo := Copy(cmdstr, 3, Length(cmdstr) - 2);
            if cmd = 'CO' then begin
              fColor := StrToIntDef(cmdinfo, Color);
            end;
            if cmd = 'CE' then begin
              if DefColor <> 0 then
                fColor := DefColor
              else
                fColor := Color;
            end;
          end;
          nError := 11;
          if i >= len then begin
            str := '';
            break;
          end;
          Inc(I);
          Continue;
        end;
        nError := 12;
        if byte(str[i]) >= $81 then begin
          nError := 13;
          cmdstr := cmdstr + str[i];
          Inc(i);
          if i <= len then
            cmdstr := cmdstr + str[i]
          else begin
            str := '';
            break;
          end;
        end
        else
          cmdstr := cmdstr + str[i];
        Inc(i);
        Continue;
      end
      else if str[i] = '<' then begin
        nError := 14;
        boCmd := True;
        cmdi := i - 1;
        Inc(i);
        if temp <> '' then begin
          BoldTextOut(SaySurface, nLeng, 2, fColor, bColor, temp);
          Inc(nLeng, Canvas.TextWidth(temp));
          temp := '';
        end;
        cmdstr := '';
        Continue;
      end
      else if byte(str[i]) >= $81 then begin
        fdata := str[i];
        Inc(i);
        if i <= len then
          fdata := fdata + str[i]
        else
          break;
      end
      else
        fdata := str[i];
        nError := 15;
      if (nLeng + Canvas.TextWidth(temp + fdata)) > (g_FScreenWidth - 10) then begin
        BoldTextOut(SaySurface, nLeng, 2, fColor, bColor , temp);
        str := Copy(str, cmdi + 1, len - cmdi);
        temp := '';
        Break;
      end;
      nError := 16;
      temp := temp + fdata;
      cmdi := i;
      Inc(i);
    end;
    nError := 17;
    if temp <> '' then begin
      BoldTextOut(SaySurface, nLeng, 2, fColor, bColor, temp);
      str := '';
    end;
    nError := 18;
    Canvas.Release;
    New(SayHint);
    SayHint.SaySurface := SaySurface;
    SayHint.AddTime := GetTickCount;
    SayHint.EffectTime := GetTickCount;
    SayHint.EffectIndex := 0;
    nError := 19;
    if m_SysMsgList.Count > 30 then begin
      SayHint := pTSayHint(m_SysMsgList.Objects[0]);
      SayHint.SaySurface.Free;
      Dispose(SayHint);
      m_SysMsgList.Delete(0);
    end;
    nError := 20;
    m_SysMsgList.AddObject(tempstr, TObject(SayHint));
  end;
  MSurface.Canvas.Release;
  except
    DebugOutStr('AddSysMsgEX :: Error :=> ' + IntToStr(nError));
  end;
end;


procedure TDrawScreen.DrawScreenTop(MSurface: TDirectDrawSurface);       //ÈùÆ®
var
  ax, ay: integer;
  SayHint: pTSayHint;
  i: integer;
  nAlpha: Integer;
  boTop: Boolean;
  EffectTime: LongWord;
  AddSysInfo: pTAddSysInfo;
  nError:Integer;
begin
  if g_MySelf = nil then Exit;
  if CurrentScene = PlayScene then begin
  nError := 0;
  try
    nError := 1;
  if GetTickCount > m_nShowSysTick then begin
    nError := 2;
    if m_SysInfoList.Count > 6 then begin
      nError := 3;
      for I := 0 to m_SysMsgList.Count - 1 do begin
        nError := 4;
        SayHint := pTSayHint(m_SysMsgList.Objects[i]);
        SayHint.SaySurface.Free;
        Dispose(SayHint);
        nError := 5;
      end;
      m_SysMsgList.Clear;
    end;
    nError := 6;
    for I := 0 to m_SysInfoList.Count - 1 do begin
      nError := 7;
      AddSysInfo := m_SysInfoList[I];
      nError := 8;
      AddSysMsgEx(MSurface, AddSysInfo.str, AddSysInfo.Color, AddSysInfo.boFirst, AddSysInfo.DefColor);
      nError := 9;
      Dispose(AddSysInfo);
    end;
    nError := 10;
    m_SysInfoList.Clear;
    m_nShowSysTick := GetTickCount + 1000;
  end;

  ay := 60 + 358 + (g_FScreenHeight - 600);       //ÈùÆ® ¸Þ½ÃÁö À§Ä¡
  I := 0;
  nAlpha := 0;
  boTop := False;
  nError := 11;
  if m_SysMsgList.Count > ADDSAYCOUNT then EffectTime := _MAX(100 - (m_SysMsgList.Count - ADDSAYCOUNT) * 10, 30)
  else EffectTime := 100;
  nError := 12;
  while True do begin
    nError := 13;
    if (I >= m_SysMsgList.Count) or (I > ADDSAYCOUNT) then break;
    SayHint := pTSayHint(m_SysMsgList.Objects[i]);
    ax := 30;
    nError := 14;
    if SayHint.SaySurface <> nil then begin

      nError := 15;
      if I = ADDSAYCOUNT then begin
        if boTop then begin
          DrawBlendalpha(MSurface, ax, ay , SayHint.SaySurface, SayHint.SaySurface.ClientRect.Left,
               SayHint.SaySurface.ClientRect.Top, SayHint.SaySurface.ClientRect.Right,
               SayHint.SaySurface.ClientRect.Bottom,(250 - nAlpha));
        end;
        break;
      end;
      nError := 16;
      if (((GetTickCount - SayHint.AddTime) > 4000) or (m_SysMsgList.Count > ADDSAYCOUNT)) and (I = 0) then begin
        boTop := True;
        if GetTickCount > SayHint.EffectTime then begin
          SayHint.EffectTime := GetTickCount + EffectTime;
          Inc(SayHint.EffectIndex);
        end;
        nError := 17;
        if SayHint.EffectIndex >= 8 then begin
          boTop := False;
          SayHint.SaySurface.Free;
          Dispose(SayHint);
          m_SysMsgList.Delete(i);
          nError := 18;
          Continue;
        end else begin
          nError := 19;
          nAlpha := Round(250 - 250 / 7 * SayHint.EffectIndex);
          Inc(ay, SayHint.EffectIndex * 2);
          DrawBlendalpha(MSurface, ax, ay , SayHint.SaySurface, SayHint.SaySurface.ClientRect.Left,
               SayHint.SaySurface.ClientRect.Top, SayHint.SaySurface.ClientRect.Right,
               SayHint.SaySurface.ClientRect.Bottom,  nAlpha);
          nError := 20;
        end;
      end else begin
        nError := 21;
        MSurface.Draw(ax, ay, SayHint.SaySurface.ClientRect, SayHint.SaySurface, True);
      end;
      Inc(I);
      nError := 22;
      Dec(ay, ADDSAYHEIGHT);
    end;
  end;
  except
    DebugOutStr('AddSysMsg :: Error := > ' + IntToStr(nError));
  end;
  end;
end;


procedure TDrawScreen.DrawScreenOldTop (MSurface: TDirectDrawSurface);
var
   i,ii, sx, sy: integer;
begin
   if g_MySelf = nil then exit;

   if CurrentScene = PlayScene then begin
      with MSurface do begin
      m_DrawScreenXYManage.Draw(MSurface);
      end;
   end;
end;


procedure TDrawScreen.DrawScreenTopGm (MSurface: TDirectDrawSurface);
var
   i,ii, sx, sy : integer;
   d, e :TDirectDrawSurface;
begin
   if g_MySelf = nil then exit;

   if CurrentScene = PlayScene then begin
     with MSurface do begin
         if m_SysMsgGM.Count > 0 then begin
          sx := g_FScreenWidth div 2;//410;
          sy := 55;
           for i:=0 to m_SysMsgGM.Count-1 do begin
           e := g_WMainImages.Images[1361];
             if e <> nil then
              DrawBlendEx (MSurface, (g_FScreenWidth - e.Width) div 2, sy + (i*16), e, 0, 0, e.Width , e.Height, 0);

           d := g_WMainImages.Images[1360];
             if d <> nil then
              MSurface.Draw ((g_FScreenWidth - e.Width) div 2 , sy + (i*16) , d.ClientRect, d, True);

              SetBkMode (Canvas.Handle, TRANSPARENT);
              Canvas.Font.Size := 9;
              Canvas.Font.Style := [fsBold];
              Canvas.Font.Color := clYellow;
              BoldTextOut(MSurface, sx - Canvas.TextWidth(m_SysMsgGM[i]) div 2 , sy + 7 + (i*16) , clYellow ,clBlack, m_SysMsgGM[i]);
              Canvas.Font.Color := clWhite;
              Canvas.Font.Size := 9;
              Canvas.Font.Style := [];
              Canvas.Release;
           end;
           if GetTickCount - longword(m_SysMsgGM.Objects[0]) >= 10 * 1000 then
               m_SysMsgGM.Delete (0);
         end;
      end;
   end;
end;


procedure TDrawScreen.DrawScreenCool (MSurface: TDirectDrawSurface);  //¸®ÄÝ
var
   i,ii, sx, sy , tx: integer;
   d :TDirectDrawSurface;
   Time:String;
begin
   if g_MySelf = nil then exit;
   Time := '';
   tx := 0;
   if CurrentScene = PlayScene then begin
     with MSurface do begin
         if m_CoolTimeMSG.Count > 0 then begin
          sx := 40;
          sy := 25;
           for i:=0 to m_CoolTimeMSG.Count-1 do begin
              SetBkMode (Canvas.Handle, TRANSPARENT);
              if Integer(m_CoolTimeMSG.Objects[i]) >= 60 * 60 * 1000 then begin // 1½Ã°£ ÀÌ»óÀÏ¶§
                Time := IntToStr(Integer(m_CoolTimeMSG.Objects[i]) Div 1000 Div 60 div 60)+':'
                 + IntToStr(Integer(m_CoolTimeMSG.Objects[i]) Div 1000 Div 60 - ((Integer(m_CoolTimeMSG.Objects[i]) div 1000 div 60 div 60) * 60))+':'+
                      IntToStr(Integer(m_CoolTimeMSG.Objects[i]) Div 1000 - ((Integer(m_CoolTimeMSG.Objects[i]) div 1000 div 60) * 60));
              end else
              if Integer(m_CoolTimeMSG.Objects[i]) >= 60 * 1000 then begin
                Time := IntToStr(Integer(m_CoolTimeMSG.Objects[i]) Div 1000 Div 60)+':'+
                      IntToStr(Integer(m_CoolTimeMSG.Objects[i]) Div 1000 - ((Integer(m_CoolTimeMSG.Objects[i]) div 1000 div 60) * 60));
              end else
                Time := '0:' + IntToStr(Integer(m_CoolTimeMSG.Objects[i])Div 1000 - ((Integer(m_CoolTimeMSG.Objects[i]) div 1000 div 60) * 60));

              tx:= Canvas.TextWidth(Time);
              Canvas.Release;
              ImageTextOut(MSurface, sx + (g_FScreenWidth - 800) + 650 - tx div 2 , sy + (g_FScreenHeight - 600) + 400 + (i*16) , Time);
           end;

           for ii:=0 to m_CoolTimeMSG.Count-1 do begin
             if Integer(m_CoolTimeMSG.Objects[ii]) <= 0 then begin
               m_CoolTimeMSG.Delete(ii);
             end;
           end;


         end;
      end;
   end;
end;


procedure TDrawScreen.DrawHintB(MSurface: TDirectDrawSurface);
begin
  if g_MySelf = nil then exit;
  if CurrentScene = PlayScene then begin
    with MSurface do begin
      DrawScreenHintManage.Draw(MSurface);
    end;
  end;

end;

procedure TDrawScreen.DrawHint (MSurface: TDirectDrawSurface);
var
   str,str1,str2,fstr : string;
   SColor :TColor;
   Actor: TActor;
begin
   with MSurface do begin
     SetBkMode (Canvas.Handle, TRANSPARENT);

     if g_MySelf <> nil then begin
        if g_boShowGreenHint then begin
          BoldTextOut (MSurface, 51 + g_FScreenWidth div 3, 1, clWhite, clBlack, 'Ä¿±êÐÅÏ¢: ');
          Canvas.Font.Size := 8;
          BoldTextOut (MSurface, 228, g_FScreenHeight - 22, clWhite , clBlack, 'µ±Ç°¾­Ñé:' + GetValueStr(g_MySelf.m_Abil.Exp));
          BoldTextOut (MSurface, 345, g_FScreenHeight - 22, clWhite , clBlack, 'ÐèÇó¾­Ñé:' + GetValueStr(g_MySelf.m_Abil.MaxExp - g_MySelf.m_Abil.Exp));
          BoldTextOut (MSurface, 502, g_FScreenHeight - 22, clWhite , clBlack, 'µ±Ç°Ê±¼ä:'+ TimeToStr(Time));
        //  str2:= 'PCµã:' + GetGoldStr(g_MySelf.m_nPCPoint);
          BoldTextOut (MSurface, 32, g_FScreenHeight - 150, clLime , clBlack, str2);
         // str2:= 'ÓÎÏ·µã:' + GetGoldStr(g_MySelf.m_nGamePoint);
          BoldTextOut (MSurface, 32, g_FScreenHeight - 164, clSkyBlue , clBlack, str2);
          Canvas.Font.Size := 9;
          if (g_FocusCret <> nil) then begin
            Actor := PlayScene.FindActor(g_FocusCret.m_nRecogId);
            if Actor.m_btRace <> 0 then begin
              if Actor.m_btRace = 50 then begin
               str := '[NPC]';
               SColor := clLime;
              end else begin
                if Actor.m_btRace in [54,55,81,82] then begin
                  str := '[³èÎï]';
                  SColor := clSkyBlue;
                end else begin
                  if Actor.m_btRace in [240..251] then begin
                     str := '[ÁéÎï]';
                     SColor := clAqua;
                  end else begin
                    if Actor.m_btRace in [12,45] then begin
                      str := '[ÎÀÊ¿]';
                      SColor := clAqua;
                    end else begin
                      str := '[¹ÖÎï]';
                      SColor := clRed;
                    end;
                  end;
                end;
              end;
            end else begin
              str := '[Î´Öª]';
              SColor := clYellow;
            end;
            BoldTextOut (MSurface, 133 + ((g_FScreenWidth div 3) - MSurface.Canvas.TextWidth(str) div 2), 1, SColor , clBlack, str);
            BoldTextOut (MSurface, 155 + (g_FScreenWidth div 3), 1, clCream , clBlack, Actor.m_sUserName );
            Canvas.Font.Size := 10;
            str1 := 'HP:(' + IntToStr(Actor.m_Abil.HP) + '/' + IntToStr(Actor.m_Abil.MaxHP) + ')';
            BoldTextOut (MSurface, ((g_FScreenWidth div 2) - MSurface.Canvas.TextWidth(str) div 2) - 50, 14, clRed , clBlack, str1);
          //  str2 := 'MP:(' + IntToStr(Actor.m_Abil.MP) + '/' + IntToStr(Actor.m_Abil.MaxMP) + ')';
          //  BoldTextOut (MSurface, ((g_FScreenWidth div 2) - MSurface.Canvas.TextWidth(str) div 2) + 50, 14, clSkyBlue , clBlack, str2);
            Canvas.Font.Size := 9;
            str:='';
            str1:='';
            str2:='';
          end else begin
            BoldTextOut (MSurface, 153 + g_FScreenWidth div 3, 1, clCream , clBlack, 'ÎÞ' );
          end;
          if g_nMiniMapMoseX <> -1 then begin
            Canvas.Font.Size := 8;
            BoldTextOut (MSurface, g_FScreenWidth - 120, g_FScreenHeight - 152, clCream , clBlack, 'Ä¿µÄµØ:');
            BoldTextOut (MSurface, g_FScreenWidth - 120, g_FScreenHeight - 138, clCream , clBlack, 'ËùÐèÊ±¼ä:');
            str2 := IntToStr(g_nMiniMapMoseX) + ':' + IntToStr(g_nMiniMapMoseY);
            BoldTextOut (MSurface, g_FScreenWidth - 75, g_FScreenHeight - 152, clYellow , clBlack, str2);
            str2 := IntToStr(High(g_nMiniMapPath)) + 'Ãë';
            BoldTextOut (MSurface, g_FScreenWidth - 62, g_FScreenHeight - 138, clYellow , clBlack, str2);
            Canvas.Font.Size := 9;
          end;
        end;

      end;
      Canvas.Release;
   end;

end;

procedure TDrawScreen.newDrawHint (MSurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   i, hx, hy, nColor: integer;
   fstr : String;
begin
   hx:=0;
   hy:=0;
   if g_MySelf = nil then exit;
   if ListHint4.Count > 0 then begin
     d := g_WMainImages.Images[394];
      if d <> nil then begin
         if HintWidth4 > d.Width then HintWidth4 := d.Width;
         if HintHeight4 > d.Height then HintHeight4 := d.Height;
         if HintX4 + HintWidth4 > g_FScreenWidth then hx := g_FScreenWidth - HintWidth4
         else hx := HintX4;
         if HintY4 < 0 then hy := 0
         else hy := HintY4;
         if hx < 0 then hx := 0;
         DrawBlendEx (MSurface, hx, hy, d, 0, 0, HintWidth4, HintHeight4, 0);
      end;

     with MSurface do begin
      SetBkMode (Canvas.Handle, TRANSPARENT);
       if ListHint4.Count > 0 then begin
         for i:=0 to ListHint4.Count -1 do begin
           nColor:=Integer(ListHint4.Objects[i]);
          if nColor > -1 then Canvas.Font.Color := nColor
          else Canvas.Font.Color := clWhite;

          Canvas.TextOut (hx+4, hy+3 + (Canvas.TextHeight('A')+1) * i, ListHint4.Strings[i]);
         end;
         for i:=0 to 0 do begin
          Canvas.Font.Color := clYellow;
          fstr := Copy(ListHint4.Strings[0], 1, pos(' ', ListHint4.Strings[0])-1 );
          Canvas.TextOut (hx+4, hy+3 + (Canvas.TextHeight('A')+1) * i, fstr);
         end;
         Canvas.Brush.Color := clDkGray;
         Canvas.FrameRect(Rect(hx, hy, hx + HintWidth4 - 1, hy + HintHeight4));
         Canvas.Brush.Style :=  bsClear;
       end;
       Canvas.Release;
     end;
  end;
end;


procedure TDrawScreen.newDrawHint2 (MSurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   i, hx, hy, nColor: integer;
   fstr : String;
begin
   hx:=0;
   hy:=0;
   if g_MySelf = nil then exit;
   if ListHint5.Count > 0 then begin
     d := g_WMainImages.Images[406];
      if d <> nil then begin
         if HintWidth5 > d.Width then HintWidth5 := d.Width;
         if HintHeight5 > d.Height then HintHeight5 := d.Height;
         if HintX5 + HintWidth5 > g_FScreenWidth then hx := g_FScreenWidth - HintWidth5
         else hx := HintX5;
         if HintY5 < 0 then hy := 0
         else hy := HintY5;
         if hx < 0 then hx := 0;
         DrawBlendEx (MSurface, hx, hy, d, 0, 0, HintWidth5, HintHeight5, 0);
      end;

     with MSurface do begin
      SetBkMode (Canvas.Handle, TRANSPARENT);
       if ListHint5.Count > 0 then begin
         for i:=0 to ListHint5.Count -1 do begin
           nColor:=Integer(ListHint5.Objects[i]);
          if nColor > -1 then Canvas.Font.Color := nColor
          else Canvas.Font.Color := clWhite;

          Canvas.TextOut (hx+4, hy+3 + (Canvas.TextHeight('A')+1) * i, ListHint5.Strings[i]);
         end;
         for i:=0 to 0 do begin
          Canvas.Font.Color := clYellow;
          fstr := Copy(ListHint5.Strings[0], 1, pos(' ', ListHint5.Strings[0])-1 );
          Canvas.TextOut (hx+4, hy+3 + (Canvas.TextHeight('A')+1) * i, fstr);
         end;
         Canvas.Brush.Color := clDkGray;
         Canvas.FrameRect(Rect(hx, hy, hx + HintWidth5 - 1, hy + HintHeight5));
         Canvas.Brush.Style :=  bsClear;
       end;
       Canvas.Release;
     end;
  end;
end;


{------------------------------------------------------------------------------}


constructor TDrawScreenXY.Create;
begin
  m_OldSysMsgList := TList.Create;
end;

destructor TDrawScreenXY.Destroy;
var
  I: Integer;
begin
  for I := 0 to m_OldSysMsgList.Count - 1 do begin
    Dispose(m_OldSysMsgList.Items[I]);
  end;
  m_OldSysMsgList.Free;
end;

procedure TDrawScreenXY.DeleteSysMsg(nMaxCount: Integer);
var
  SysMsg: pTOSysMsg;
begin
  while True do begin
    if m_OldSysMsgList.Count <= 0 then Break;
    SysMsg := pTOSysMsg(m_OldSysMsgList.Items[0]);
    if (GetTickCount - SysMsg.dwSpellTime < 3000) and (m_OldSysMsgList.Count <= nMaxCount) then Break;
    m_OldSysMsgList.Delete(0);
    Dispose(SysMsg);
  end;
end;

procedure TDrawScreenXY.AddSysMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);
var
  SysMsg: pTOSysMsg;
  sY: Integer;
begin
  DeleteSysMsg(9);
  New(SysMsg);
  SysMsg.sSysMsg := Msg;
  SysMsg.Color := Color;
  SysMsg.DefColor := DefColor;
  SysMsg.nX := nX;
  SysMsg.nY := nY;
  SysMsg.dwSpellTime := GetTickCount;
  m_OldSysMsgList.Add(SysMsg);
end;

{procedure TDrawScreenXY.Draw(MSurface: TDirectDrawSurface);
var
  I, nPosition: Integer;
  SysMsg: pTOSysMsg;
begin
  with MSurface do begin
    nPosition := 0;
    SetBkMode (Canvas.Handle, TRANSPARENT);
    for I := 0 to m_OldSysMsgList.Count - 1 do begin
      SysMsg := pTOSysMsg(m_OldSysMsgList.Items[I]);
      if nPosition = 0 then nPosition := SysMsg.nY;
      BoldTextOut(MSurface,SysMsg.nX, nPosition, SysMsg.Color, clblack, SysMsg.sSysMsg); //clGreen
      Inc(nPosition, 16);
    end;
    Canvas.Release;
  end;
  DeleteSysMsg(11);
end;       }

procedure TDrawScreenXY.Draw(MSurface: TDirectDrawSurface);
  function GetStrLen(Str: string): Integer;
  var
    nLen: Integer;
    sTempStr: string;
    sLenStr: string;
  begin
    sTempStr := GetValidStr3(str, sLenStr, ['<']);
    nLen := MSurface.Canvas.TextWidth(sLenStr);
    while sTempStr <> '' do begin
      sTempStr := GetValidStr3(sTempStr, sLenStr, ['>']);
      if sTempStr = '' then break;
      sTempStr := GetValidStr3(sTempStr, sLenStr, ['<']);
      Inc(nLen, MSurface.Canvas.TextWidth(sLenStr));
    end;
    Result := nLen;
  end;
var
  K, nPosition: Integer;
  SysMsg: pTOSysMsg;
  nLeng, Len, i, cmdi: Integer;
  boCmd: Boolean;
  fdata, cmdstr, temp, cmd, cmdinfo, str: string;
  fColor, bColor, DefColor: TColor;
  nError: integer;
begin
  try
    nError := 0;
    with MSurface do begin
      nError := 1;
      nPosition := 0;
      SetBkMode (Canvas.Handle, TRANSPARENT);
      nError := 2;
      for K := 0 to m_OldSysMsgList.Count - 1 do begin
        SysMsg := pTOSysMsg(m_OldSysMsgList.Items[K]);
        if nPosition = 0 then nPosition := SysMsg.nY;
        nError := 3;
        str := SysMsg.sSysMsg;

        fColor := SysMsg.Color;
        bColor := clBlack;
        DefColor := SysMsg.DefColor;
        nError := 4;
        nLeng := GetStrLen(str);
        len := Length(str);
        nLeng := 1;
        temp := '';
        cmdstr := '';
        cmdi := 1;
        boCmd := False;
        i := 1;
        nError := 5;
        while True do begin
          if i > len then begin
            str := '';
            break;
          end;
          nError := 6;
          if boCmd then begin
            nError := 7;
            if str[i] = '>' then begin
              boCmd := False;
              nError := 8;
              if Length(cmdstr) >= 2 then begin
                cmd := Copy(cmdstr, 1, 2);
                cmdinfo := Copy(cmdstr, 3, Length(cmdstr) - 2);
                if cmd = 'CO' then begin
                  fColor := StrToIntDef(cmdinfo, SysMsg.Color);
                end;
                if cmd = 'CE' then begin
                  if DefColor <> 0 then
                    fColor := DefColor
                  else
                  fColor := SysMsg.Color;
                end;
              end;
              nError := 9;
              if i >= len then begin
                str := '';
                break;
              end;
              nError := 10;
              Inc(I);
              Continue;
            end;
            nError := 11;
            if byte(str[i]) >= $81 then begin
              cmdstr := cmdstr + str[i];
              Inc(i);
              if i <= len then
                cmdstr := cmdstr + str[i]
              else begin
                str := '';
                break;
              end;
            end else
              cmdstr := cmdstr + str[i];
            Inc(i);
            Continue;
          end
          else if str[i] = '<' then begin
            nError := 12;
            boCmd := True;
            cmdi := i - 1;
            Inc(i);
            nError := 13;
            if temp <> '' then begin
              BoldTextOut(MSurface, SysMsg.nX + nLeng, nPosition, fColor, bColor, temp);
              Inc(nLeng, Canvas.TextWidth(temp));
             temp := '';
            end;
            nError := 14;
            cmdstr := '';
            Continue;
          end
          else if byte(str[i]) >= $81 then begin
            nError := 15;
            fdata := str[i];
            Inc(i);
            if i <= len then
              fdata := fdata + str[i]
            else
              break;
          end
          else
            fdata := str[i];
          nError := 16;
          if (SysMsg.nX + nLeng + Canvas.TextWidth(temp + fdata)) > (g_FScreenWidth - 10) then begin
            BoldTextOut(MSurface, SysMsg.nX + nLeng, nPosition, fColor, bColor , temp);
            str := Copy(str, cmdi + 1, len - cmdi);
            temp := '';
            Break;
          end;
          nError := 17;
          temp := temp + fdata;
          cmdi := i;
          Inc(i);
        end;
        nError := 18;
        if temp <> '' then begin
          BoldTextOut(MSurface, SysMsg.nX + nLeng, nPosition, fColor, bColor, temp);
          str := '';
        end;
        nError := 19;
        Inc(nPosition, 16);
      end;
      nError := 20;
      Canvas.Release;
    end;
    DeleteSysMsg(9);
  except
    DebugOutStr('TDrawScreenXY.Draw :: Error :=> ' + IntToStr(nError));
  end;
end;

{------------------------------------------------------------------------------}

constructor TDrawScreenXYManage.Create;
begin
  m_DrawScreenXYManageList := TList.Create;
end;

destructor TDrawScreenXYManage.Destroy;
var
  I: Integer;
begin
  for I := 0 to m_DrawScreenXYManageList.Count - 1 do begin
    TDrawScreenXY(m_DrawScreenXYManageList.Items[I]).Free;
  end;
  m_DrawScreenXYManageList.Free;
end;

function TDrawScreenXYManage.GetDrawScreenXY(nX, nY: Integer): TDrawScreenXY;
var
  I, II: Integer;
  DrawScreenXY: TDrawScreenXY;
  boFound: Boolean;
  SysMsg: pTOSysMsg;
begin
  Result := nil;
  boFound := False;
  for I := 0 to m_DrawScreenXYManageList.Count - 1 do begin
    DrawScreenXY := TDrawScreenXY(m_DrawScreenXYManageList.Items[I]);
    for II := 0 to DrawScreenXY.m_OldSysMsgList.Count - 1 do begin
      SysMsg := pTOSysMsg(DrawScreenXY.m_OldSysMsgList.Items[II]);
      if (SysMsg.nX <> nX) or (SysMsg.nY <> nY) then begin
        Break;
      end else begin
        boFound := True;
        Result := DrawScreenXY;
        Break;
      end;
    end;
    if boFound then Break;
  end;
end;

procedure TDrawScreenXYManage.AddSysMsg(Msg: string; nX, nY: Integer; Color: TColor; DefColor: TColor = 0);
var
  DrawScreenXY: TDrawScreenXY;
begin
  DrawScreenXY := GetDrawScreenXY(nX, nY);
  if DrawScreenXY = nil then begin
    DrawScreenXY := TDrawScreenXY.Create;
    m_DrawScreenXYManageList.Add(DrawScreenXY);
  end;
  DrawScreenXY.AddSysMsg(Msg, nX, nY, Color, DefColor);
end;

procedure TDrawScreenXYManage.Draw(MSurface: TDirectDrawSurface);
var
  I: Integer;
begin
  for I := 0 to m_DrawScreenXYManageList.Count - 1 do begin
    TDrawScreenXY(m_DrawScreenXYManageList.Items[I]).Draw(MSurface);
  end;
end;

{------------------------------------------------------------------------------}


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: DrawScrn.pas 499 2006-10-31 21:26:22Z sean $');
end.
