unit ViewOnlineHumanView;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Spin, Envir, Menus, RzButton;

type
  TfrmViewOnlineHumanView = class(TForm)
    PanelStatus: TPanel;
    GridHuman: TStringGrid;
    Timer: TTimer;
    Panel1: TPanel;
    ButtonRefGrid: TButton;
    Label1: TLabel;
    ComboBoxSort: TComboBox;
    EditSearchName: TEdit;
    ButtonSearch: TButton;
    ButtonView: TButton;
    ButtonKick: TButton;
    EditLevel: TSpinEdit;
    Label2: TLabel;
    MenuButtonOffLine: TRzMenuButton;
    PopupMenu: TPopupMenu;
    T1: TMenuItem;
    T2: TMenuItem;
    T3: TMenuItem;
    CheckBoxHero: TCheckBox;
    T4: TMenuItem;
    T5: TMenuItem;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonRefGridClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBoxSortClick(Sender: TObject);
    procedure GridHumanDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure T3Click(Sender: TObject);
    procedure CheckBoxHeroClick(Sender: TObject);
    procedure T4Click(Sender: TObject);
    procedure T5Click(Sender: TObject);
  private
    ViewList: TStringList;
    dwTimeOutTick: LongWord;
    procedure RefGridSession();
    procedure GetOnlineList(Envirnoment: TEnvirnoment);
    procedure SortOnlineList(nSort: Integer);
    procedure ShowHumanInfo();
    { Private declarations }
  public
    procedure Open(Envirnoment: TEnvirnoment);
    { Public declarations }
  end;

var
  frmViewOnlineHumanView: TfrmViewOnlineHumanView;
  SelEnvirnoment: TEnvirnoment;
implementation

uses UsrEngn, M2Share, ObjBase, ObjHero, HUtil32, HumanInfo, Grobal2;

{$R *.dfm}

{ TfrmViewOnlineHuman }

procedure TfrmViewOnlineHumanView.Open(Envirnoment: TEnvirnoment);
begin
  frmHumanInfo := TfrmHumanInfo.Create(Owner);
  dwTimeOutTick := GetTickCount();
  SelEnvirnoment := Envirnoment;
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
  Timer.Enabled := True;
  ShowModal;
  Timer.Enabled := False;
  frmHumanInfo.Free;
end;

procedure TfrmViewOnlineHumanView.GetOnlineList(Envirnoment: TEnvirnoment);
var
  I: Integer;
begin
  ViewList.Clear;
  if CheckBoxHero.Checked then begin
    try
      UserEngine.m_HeroObjectList.Lock;
      for I := 0 to UserEngine.m_HeroObjectList.Count - 1 do begin
        if Envirnoment = nil then begin
          ViewList.AddObject(UserEngine.m_HeroObjectList.Strings[I], UserEngine.m_HeroObjectList.Objects[I]);
        end else begin
          if Envirnoment = THeroObject(UserEngine.m_HeroObjectList.Objects[I]).m_PEnvir then begin
            ViewList.AddObject(UserEngine.m_HeroObjectList.Strings[I], UserEngine.m_HeroObjectList.Objects[I]);
          end;
        end;
      end;
    finally
      UserEngine.m_HeroObjectList.UnLock;
    end;
  end else begin
    try
      EnterCriticalSection(ProcessHumanCriticalSection);
      if UserEngine <> nil then begin
        for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
          if Envirnoment = nil then begin
            ViewList.AddObject(UserEngine.m_PlayObjectList.Strings[I], UserEngine.m_PlayObjectList.Objects[I]);
          end else begin
            if Envirnoment = TPlayObject(UserEngine.m_PlayObjectList.Objects[I]).m_PEnvir then begin
              ViewList.AddObject(UserEngine.m_PlayObjectList.Strings[I], UserEngine.m_PlayObjectList.Objects[I]);
            end;
          end;
        end;
      end;
    finally
      LeaveCriticalSection(ProcessHumanCriticalSection);
    end;
  end;
end;

procedure TfrmViewOnlineHumanView.RefGridSession;
var
  I: Integer;
  PlayObject: TPlayObject;
  HeroObject: THeroObject;
begin
  PanelStatus.Caption := '正在刷新表格...';
  GridHuman.Visible := False;
  GridHuman.Cells[0, 1] := '';
  GridHuman.Cells[1, 1] := '';
  GridHuman.Cells[2, 1] := '';
  GridHuman.Cells[3, 1] := '';
  GridHuman.Cells[4, 1] := '';
  GridHuman.Cells[5, 1] := '';
  GridHuman.Cells[6, 1] := '';
  GridHuman.Cells[7, 1] := '';
  GridHuman.Cells[8, 1] := '';
  GridHuman.Cells[9, 1] := '';
  GridHuman.Cells[10, 1] := '';
  GridHuman.Cells[11, 1] := '';
  GridHuman.Cells[12, 1] := '';
  GridHuman.Cells[13, 1] := '';
  GridHuman.Cells[14, 1] := '';
  GridHuman.Cells[15, 1] := '';

  GridHuman.Cells[16, 1] := '';
  GridHuman.Cells[17, 1] := '';
  if ViewList.Count <= 0 then begin
    GridHuman.RowCount := 2;
    GridHuman.FixedRows := 1;
  end else begin
    GridHuman.RowCount := ViewList.Count + 1;
  end;
  if CheckBoxHero.Checked then begin
    for I := 0 to ViewList.Count - 1 do begin
      HeroObject := THeroObject(ViewList.Objects[I]);
      if HeroObject <> nil then begin
        GridHuman.Cells[0, I + 1] := IntToStr(I);
        GridHuman.Cells[1, I + 1] := HeroObject.m_sCharName;
        GridHuman.Cells[2, I + 1] := IntToSex(HeroObject.m_btGender);
        GridHuman.Cells[3, I + 1] := IntToJob(HeroObject.m_btJob);
        GridHuman.Cells[4, I + 1] := IntToStr(HeroObject.m_Abil.Level);
        GridHuman.Cells[5, I + 1] := HeroObject.m_sMapName + '(' + g_MapManager.FindMapName(HeroObject.m_sMapName) + ')';
        GridHuman.Cells[6, I + 1] := IntToStr(HeroObject.m_nCurrX) + ':' + IntToStr(HeroObject.m_nCurrY);
        GridHuman.Cells[7, I + 1] := HeroObject.m_sUserID;
        GridHuman.Cells[8, I + 1] := TPlayObject(HeroObject.m_Master).m_sIPaddr;
        GridHuman.Cells[9, I + 1] := IntToStr(TPlayObject(HeroObject.m_Master).m_btPermission);
        GridHuman.Cells[10, I + 1] := '0';
        GridHuman.Cells[11, I + 1] := '0';
        GridHuman.Cells[12, I + 1] := '0';
        GridHuman.Cells[13, I + 1] := '0';
        GridHuman.Cells[14, I + 1] := BooleanToStr(HeroObject.m_boHeroLogOnOK);
        GridHuman.Cells[15, I + 1] := '0';

        GridHuman.Cells[16, I + 1] := '';
        GridHuman.Cells[17, I + 1] := IntToStr(HeroObject.MessageCount);
      end;
    end;
    GridHuman.Visible := True;
    if UserEngine <> nil then begin
      if SelEnvirnoment = nil then begin
        Caption := Format(' [在线人数：%s]', [UserEngine.GetOnlineCount]);
      end else begin
        Caption := SelEnvirnoment.sMapDesc + ' ' + Format(' [在线人数：%d]', [UserEngine.PlayObjectCount]);
      end;
    end;
  end else begin
    for I := 0 to ViewList.Count - 1 do begin
      PlayObject := TPlayObject(ViewList.Objects[I]);
      if PlayObject <> nil then begin
        GridHuman.Cells[0, I + 1] := IntToStr(I);
        GridHuman.Cells[1, I + 1] := PlayObject.m_sCharName;
        GridHuman.Cells[2, I + 1] := IntToSex(PlayObject.m_btGender);
        GridHuman.Cells[3, I + 1] := IntToJob(PlayObject.m_btJob);
        GridHuman.Cells[4, I + 1] := IntToStr(PlayObject.m_Abil.Level);
        GridHuman.Cells[5, I + 1] := PlayObject.m_sMapName + '(' + g_MapManager.FindMapName(PlayObject.m_sMapName) + ')';
        GridHuman.Cells[6, I + 1] := IntToStr(PlayObject.m_nCurrX) + ':' + IntToStr(PlayObject.m_nCurrY);
        GridHuman.Cells[7, I + 1] := PlayObject.m_sUserID;
        GridHuman.Cells[8, I + 1] := PlayObject.m_sIPaddr;
        GridHuman.Cells[9, I + 1] := IntToStr(PlayObject.m_btPermission);
        GridHuman.Cells[10, I + 1] := GetGoldStr(PlayObject.m_nGold); // GetIPLocal(PlayObject.m_sIPaddr);
        GridHuman.Cells[11, I + 1] := GetGoldStr(PlayObject.m_nGameGold);
        GridHuman.Cells[12, I + 1] := GetGoldStr(PlayObject.m_nGamePoint);
        GridHuman.Cells[13, I + 1] := GetGoldStr(PlayObject.m_nPCPoint);

        GridHuman.Cells[14, I + 1] := BooleanToStr(PlayObject.m_MyHero <> nil);
       // GridHuman.Cells[15, I + 1] := IntToStr(PlayObject.m_nPetPoint);

       // GridHuman.Cells[16, I + 1] := PlayObject.m_sAutoSendMsg;
        GridHuman.Cells[17, I + 1] := IntToStr(PlayObject.MessageCount);
      end;
    end;
    GridHuman.Visible := True;
    if UserEngine <> nil then begin
      if SelEnvirnoment = nil then begin
        Caption := Format(' [在线人数：%s]', [UserEngine.GetOnlineCount]);
      end else begin
        Caption := SelEnvirnoment.sMapDesc + ' ' + Format(' [Online：%d]', [UserEngine.PlayObjectCount]);
      end;
    end;
  end;
end;

procedure TfrmViewOnlineHumanView.FormCreate(Sender: TObject);
begin
  ViewList := TStringList.Create;
  GridHuman.Cells[0, 0] := '序号';
  if CheckBoxHero.Checked then begin
    GridHuman.Cells[1, 0] := '角色名';
  end else begin
    GridHuman.Cells[1, 0] := '角色名';
  end;
  GridHuman.Cells[2, 0] := '性别';
  GridHuman.Cells[3, 0] := '职业';
  GridHuman.Cells[4, 0] := '等级';
  GridHuman.Cells[5, 0] := '地图';
  GridHuman.Cells[6, 0] := '坐标';
  GridHuman.Cells[7, 0] := '登录账号';
  GridHuman.Cells[8, 0] := 'IP地址';
  GridHuman.Cells[9, 0] := '权限';
  GridHuman.Cells[10, 0] := '金币';
  GridHuman.Cells[11, 0] := g_Config.sGameGoldName;
  GridHuman.Cells[12, 0] := g_Config.sGamePointName;
  GridHuman.Cells[13, 0] := g_Config.sPCPointName;

  GridHuman.Cells[14, 0] := '英雄在线';
 // GridHuman.Cells[15, 0] := g_Config.sPetPointName;
  GridHuman.Cells[16, 0] := '';
  GridHuman.Cells[17, 0] := '正在处理的信息';
end;

procedure TfrmViewOnlineHumanView.ButtonRefGridClick(Sender: TObject);
begin
  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.FormDestroy(Sender: TObject);
begin
  ViewList.Free;
end;

procedure TfrmViewOnlineHumanView.ComboBoxSortClick(Sender: TObject);
begin
  if ComboBoxSort.ItemIndex < 0 then Exit;
  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  SortOnlineList(ComboBoxSort.ItemIndex);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.SortOnlineList(nSort: Integer);
var
  I: Integer;
  sIPaddr: string;
  sIPLocal: string;
  btPermission: Integer;
  SortList: TStringList;
begin
  SortList := TStringList.Create;
  case nSort of
    0: begin
        ViewList.Sort;
        Exit;
      end;
    1: begin
        for I := 0 to ViewList.Count - 1 do begin
          SortList.AddObject(IntToStr(TBaseObject(ViewList.Objects[I]).m_btGender), ViewList.Objects[I]);
        end;
      end;
    2: begin
        for I := 0 to ViewList.Count - 1 do begin
          SortList.AddObject(IntToStr(TBaseObject(ViewList.Objects[I]).m_btJob), ViewList.Objects[I]);
        end;
      end;
    3: begin
        for I := 0 to ViewList.Count - 1 do begin
          SortList.AddObject(IntToStr(TBaseObject(ViewList.Objects[I]).m_Abil.Level), ViewList.Objects[I]);
        end;
      end;
    4: begin
        for I := 0 to ViewList.Count - 1 do begin
          SortList.AddObject(TBaseObject(ViewList.Objects[I]).m_sMapName, ViewList.Objects[I]);
        end;
      end;
    5: begin
        for I := 0 to ViewList.Count - 1 do begin
          if TBaseObject(ViewList.Objects[I]).m_btRaceServer = RC_PLAYOBJECT then begin
            sIPaddr := TPlayObject(ViewList.Objects[I]).m_sIPaddr;
          end else begin
            sIPaddr := TPlayObject(TBaseObject(ViewList.Objects[I]).m_Master).m_sIPaddr;
          end;
          SortList.AddObject(sIPaddr, ViewList.Objects[I]);
        end;
      end;
    6: begin
        for I := 0 to ViewList.Count - 1 do begin
          if TBaseObject(ViewList.Objects[I]).m_btRaceServer = RC_PLAYOBJECT then begin
            btPermission := TPlayObject(ViewList.Objects[I]).m_btPermission;
          end else begin
            btPermission := TPlayObject(TBaseObject(ViewList.Objects[I]).m_Master).m_btPermission;
          end;
          SortList.AddObject(IntToStr(btPermission), ViewList.Objects[I]);
        end;
      end;
    7: begin
        for I := 0 to ViewList.Count - 1 do begin
          if TBaseObject(ViewList.Objects[I]).m_btRaceServer = RC_PLAYOBJECT then begin
            sIPLocal := TPlayObject(ViewList.Objects[I]).m_sIPLocal;
          end else begin
            sIPLocal := TPlayObject(TBaseObject(ViewList.Objects[I]).m_Master).m_sIPLocal;
          end;
          SortList.AddObject(sIPLocal, ViewList.Objects[I]);
        end;
      end;
  end;
  ViewList.Free;
  ViewList := SortList;
  ViewList.Sort;
end;

procedure TfrmViewOnlineHumanView.GridHumanDblClick(Sender: TObject);
begin
  ShowHumanInfo();
end;

procedure TfrmViewOnlineHumanView.TimerTimer(Sender: TObject);
begin
  if (GetTickCount - dwTimeOutTick > 30000) and (ViewList.Count > 0) then begin
    ViewList.Clear;
    RefGridSession();
  end;
end;

procedure TfrmViewOnlineHumanView.ButtonSearchClick(Sender: TObject);
var
  I: Integer;
  sHumanName: string;
  BaseObject: TBaseObject;
begin
  sHumanName := Trim(EditSearchName.Text);
  {if sHumanName = '' then begin
    Application.MessageBox('请输入一个人物名称！！！', '错误信息', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end; }
  if sHumanName = '' then begin
    if CheckBoxHero.Checked then begin
      Application.MessageBox('请输入英雄的名字!!!', '警告', MB_OK + MB_ICONEXCLAMATION);
    end else begin
      Application.MessageBox('请输入角色的名字!!', '警告', MB_OK + MB_ICONEXCLAMATION);
    end;
    Exit;
  end;

  if (Sender = ButtonSearch) and (sHumanName <> '') then begin
    for I := 0 to ViewList.Count - 1 do begin
      BaseObject := TBaseObject(ViewList.Objects[I]);
      if CompareText(BaseObject.m_sCharName, sHumanName) = 0 then begin
        GridHuman.Row := I + 1;
        Exit;
      end;
    end;
    if CheckBoxHero.Checked then begin
      Application.MessageBox('英雄不在线!!', '警告', MB_OK + MB_ICONINFORMATION);
    end else begin
      Application.MessageBox('角色不在线!!', '警告', MB_OK + MB_ICONINFORMATION);
    end;
    Exit;
  end;
  if Sender = ButtonKick then begin
    for I := 0 to ViewList.Count - 1 do begin
      BaseObject := TBaseObject(ViewList.Objects[I]);
      if ((sHumanName <> '') and AnsiContainsText(BaseObject.m_sCharName, sHumanName)) or (BaseObject.m_Abil.Level < EditLevel.Value) then begin
        if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
          TPlayObject(BaseObject).m_boEmergencyClose := True;
         // TPlayObject(BaseObject).m_boNotOnlineAddExp := False;
         // TPlayObject(BaseObject).m_boPlayOffLine := False;
        end else begin
          THeroObject(BaseObject).LogOut;
        end;
      end;

    end;
    dwTimeOutTick := GetTickCount();
    GetOnlineList(SelEnvirnoment);
    RefGridSession();
  end;
end;

procedure TfrmViewOnlineHumanView.ButtonViewClick(Sender: TObject);
begin
  ShowHumanInfo();
end;

procedure TfrmViewOnlineHumanView.ShowHumanInfo;
var
  nSelIndex: Integer;
  sPlayObjectName: string;
  BaseObject: TBaseObject;
begin
  nSelIndex := GridHuman.Row;
  Dec(nSelIndex);
  if (nSelIndex < 0) or (ViewList.Count <= nSelIndex) then begin
    if CheckBoxHero.Checked then begin
      Application.MessageBox('请选择英雄并设置!!', '警告', MB_OK + MB_ICONINFORMATION);
    end else begin
      Application.MessageBox('请选择角色并设置!!!', '警告', MB_OK + MB_ICONINFORMATION);
    end;
    Exit;
  end;
  sPlayObjectName := GridHuman.Cells[1, nSelIndex + 1];

  if CheckBoxHero.Checked then begin
    BaseObject := UserEngine.GetHeroObject(sPlayObjectName);
  end else begin
    BaseObject := UserEngine.GetPlayObject(sPlayObjectName);
  end;
  if BaseObject = nil then begin
    if CheckBoxHero.Checked then begin
      Application.MessageBox('这个英雄已经离线了!!', '警告', MB_OK + MB_ICONINFORMATION);
    end else begin
      Application.MessageBox('这个角色已经离线了!!', '警告', MB_OK + MB_ICONINFORMATION);
    end;
    Exit;
  end;

  frmHumanInfo.BaseObject := TPlayObject(ViewList.Objects[nSelIndex]);
  frmHumanInfo.Top := Self.Top + 20;
  frmHumanInfo.Left := Self.Left;
  frmHumanInfo.Open();
end;

procedure TfrmViewOnlineHumanView.T1Click(Sender: TObject);
var
  I: Integer;
  PlayObject: TPlayObject;
  HeroObject: THeroObject;
begin
  {if CheckBoxHero.Checked then begin
    try
      UserEngine.m_HeroObjectList.Lock;
      for I := 0 to UserEngine.m_HeroObjectList.Count - 1 do begin
        HeroObject := THeroObject(UserEngine.m_HeroObjectList.Objects[I]);
        if (HeroObject.m_Master <> nil) then begin
          PlayObject := TPlayObject(HeroObject.m_Master);
          if PlayObject.m_boNotOnlineAddExp then begin
            PlayObject.m_boNotOnlineAddExp := False;
            PlayObject.m_boPlayOffLine := False;
            PlayObject.m_boEmergencyClose := True;
          end;
        end;
      end;
    finally
      UserEngine.m_HeroObjectList.UnLock;
    end;
  end else begin }
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      PlayObject := TPlayObject(UserEngine.m_PlayObjectList.Objects[I]);
   //   if PlayObject.m_boNotOnlineAddExp then begin
      //  PlayObject.m_boNotOnlineAddExp := False;
      //  PlayObject.m_boPlayOffLine := False;
        PlayObject.m_boEmergencyClose := True;
    //  end;
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;

  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.T2Click(Sender: TObject);
var
  I: Integer;
  PlayObject: TPlayObject;
begin
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      PlayObject := TPlayObject(UserEngine.m_PlayObjectList.Objects[I]);
      if {PlayObject.m_boNotOnlineAddExp and} (PlayObject.m_MyHero <> nil) then begin
        THeroObject((PlayObject.m_MyHero)).LogOut;
      end;
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.T3Click(Sender: TObject);
var
  I: Integer;
  PlayObject: TPlayObject;
begin
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      PlayObject := TPlayObject(UserEngine.m_PlayObjectList.Objects[I]);
      {if PlayObject.m_boAI then begin
        PlayObject.m_boEmergencyClose := True;
      end;  }
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.CheckBoxHeroClick(Sender: TObject);
begin
  //ButtonKickPlayOffLine.Enabled := not CheckBoxHero.Checked;
  ComboBoxSort.Clear;
  if CheckBoxHero.Checked then begin
    ButtonView.Caption:= '&英雄信息';
    ComboBoxSort.Items.Add ('角色名');
    ComboBoxSort.Items.Add ('性别');
    ComboBoxSort.Items.Add ('职业');
    ComboBoxSort.Items.Add ('等级');
    ComboBoxSort.Items.Add ('地图');
  end else begin
    ButtonView.Caption:= '&角色信息';
    ComboBoxSort.Items.Add ('角色名');
    ComboBoxSort.Items.Add ('性别');
    ComboBoxSort.Items.Add ('职业');
    ComboBoxSort.Items.Add ('等级');
    ComboBoxSort.Items.Add ('地图');
    ComboBoxSort.Items.Add ('IP地址');
    ComboBoxSort.Items.Add ('权限');
    ComboBoxSort.Items.Add ('本地IP');
  end;
  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

procedure TfrmViewOnlineHumanView.T4Click(Sender: TObject);
var
  I: Integer;
  BaseObject: TBaseObject;
begin
    for I := 0 to ViewList.Count - 1 do begin
      BaseObject := TBaseObject(ViewList.Objects[I]);
      if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
        TPlayObject(BaseObject).m_boEmergencyClose := True;
       // TPlayObject(BaseObject).m_boNotOnlineAddExp := False;
       // TPlayObject(BaseObject).m_boPlayOffLine := False;
      end;
    end;
    dwTimeOutTick := GetTickCount();
    GetOnlineList(SelEnvirnoment);
    RefGridSession();
end;

procedure TfrmViewOnlineHumanView.T5Click(Sender: TObject);
var
  I: Integer;
  BaseObject: TBaseObject;
begin
  for I := 0 to ViewList.Count - 1 do begin
     BaseObject := TBaseObject(ViewList.Objects[I]);
     if TPlayObject(BaseObject).m_MyHero <> nil then begin
       THeroObject((TPlayObject(BaseObject).m_MyHero)).LogOut;
     end;
  end;

  dwTimeOutTick := GetTickCount();
  GetOnlineList(SelEnvirnoment);
  RefGridSession();
end;

end.

