unit GMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, INIFiles, ExtCtrls, IdTCPClient, IdHTTP,
  Spin, JSocket, RzSpnEdt, Mask, RzEdit, RzBtnEdt, ShlObj, ActiveX, ShellApi,
  VCLUnZip, VCLZip, Common;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditGameDir: TEdit;
    Label2: TLabel;
    EditHeroDB: TEdit;
    ButtonNext1: TButton;
    ButtonNext2: TButton;
    GroupBox2: TGroupBox;
    ButtonPrv2: TButton;
    EditGameName: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditGameExtIPaddr: TEdit;
    GroupBox5: TGroupBox;
    EditM2ServerProgram: TEdit;
    EditDBServerProgram: TEdit;
    EditLoginSrvProgram: TEdit;
    EditLogServerProgram: TEdit;
    EditLoginGateProgram: TEdit;
    EditSelGateProgram: TEdit;
    EditRunGateProgram: TEdit;
    ButtonStartGame: TButton;
    CheckBoxM2Server: TCheckBox;
    CheckBoxDBServer: TCheckBox;
    CheckBoxLoginServer: TCheckBox;
    CheckBoxLogServer: TCheckBox;
    CheckBoxLoginGate: TCheckBox;
    CheckBoxSelGate: TCheckBox;
    CheckBoxRunGate: TCheckBox;
    EditRunGate1Program: TEdit;
    EditRunGate2Program: TEdit;
    TimerStartGame: TTimer;
    TimerStopGame: TTimer;
    TimerCheckRun: TTimer;
    MemoLog: TMemo;
    ButtonReLoadConfig: TButton;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    EditLoginGate_MainFormX: TSpinEdit;
    Label10: TLabel;
    EditLoginGate_MainFormY: TSpinEdit;
    GroupBox3: TGroupBox;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    EditSelGate_MainFormX: TSpinEdit;
    EditSelGate_MainFormY: TSpinEdit;
    TabSheet7: TTabSheet;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    EditLoginServer_MainFormX: TSpinEdit;
    EditLoginServer_MainFormY: TSpinEdit;
    TabSheet8: TTabSheet;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    EditDBServer_MainFormX: TSpinEdit;
    EditDBServer_MainFormY: TSpinEdit;
    TabSheet9: TTabSheet;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    EditLogServer_MainFormX: TSpinEdit;
    EditLogServer_MainFormY: TSpinEdit;
    TabSheet10: TTabSheet;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    EditM2Server_MainFormX: TSpinEdit;
    EditM2Server_MainFormY: TSpinEdit;
    TabSheet11: TTabSheet;
    ButtonSave: TButton;
    ButtonGenGameConfig: TButton;
    ButtonPrv3: TButton;
    ButtonNext3: TButton;
    TabSheet12: TTabSheet;
    ButtonPrv4: TButton;
    ButtonNext4: TButton;
    ButtonPrv5: TButton;
    ButtonNext5: TButton;
    ButtonPrv6: TButton;
    ButtonNext6: TButton;
    ButtonPrv7: TButton;
    ButtonNext7: TButton;
    ButtonPrv8: TButton;
    ButtonNext8: TButton;
    ButtonPrv9: TButton;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    EditRunGate_MainFormX: TSpinEdit;
    EditRunGate_MainFormY: TSpinEdit;
    GroupBox19: TGroupBox;
    Label23: TLabel;
    EditRunGate_Connt: TSpinEdit;
    TabSheet13: TTabSheet;
    ButtonLoginServerConfig: TButton;
    CheckBoxDynamicIPMode: TCheckBox;
    GroupBox20: TGroupBox;
    CheckBoxDisableAutoGame: TCheckBox;
    ServerSocket: TServerSocket;
    Timer: TTimer;
    GroupBox22: TGroupBox;
    LabelRunGate_GatePort1: TLabel;
    EditRunGate_GatePort1: TEdit;
    ButtonRunGateDefault: TButton;
    ButtonSelGateDefault: TButton;
    ButtonGeneralDefalult: TButton;
    ButtonLoginGateDefault: TButton;
    ButtonLoginSrvDefault: TButton;
    ButtonDBServerDefault: TButton;
    ButtonLogServerDefault: TButton;
    ButtonM2ServerDefault: TButton;
    GroupBox23: TGroupBox;
    Label28: TLabel;
    EditLoginGate_GatePort: TEdit;
    GroupBox24: TGroupBox;
    Label29: TLabel;
    EditSelGate_GatePort: TEdit;
    TabSheet15: TTabSheet;
    GroupBox25: TGroupBox;
    EditSearchLoginAccount: TEdit;
    Label30: TLabel;
    ButtonSearchLoginAccount: TButton;
    GroupBox26: TGroupBox;
    Label31: TLabel;
    EditLoginAccount: TEdit;
    Label32: TLabel;
    EditLoginAccountPasswd: TEdit;
    Label33: TLabel;
    EditLoginAccountUserName: TEdit;
    Label34: TLabel;
    EditLoginAccountSSNo: TEdit;
    Label35: TLabel;
    EditLoginAccountBirthDay: TEdit;
    Label36: TLabel;
    EditLoginAccountQuiz: TEdit;
    Label37: TLabel;
    EditLoginAccountAnswer: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    EditLoginAccountQuiz2: TEdit;
    EditLoginAccountAnswer2: TEdit;
    Label40: TLabel;
    EditLoginAccountMobilePhone: TEdit;
    EditLoginAccountMemo1: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    EditLoginAccountEMail: TEdit;
    EditLoginAccountMemo2: TEdit;
    CkFullEditMode: TCheckBox;
    ButtonLoginAccountOK: TButton;
    Label44: TLabel;
    EditLoginAccountPhone: TEdit;
    GroupBox27: TGroupBox;
    CheckBoxboLoginGate_GetStart: TCheckBox;
    GroupBox28: TGroupBox;
    CheckBoxboSelGate_GetStart: TCheckBox;
    TabSheetDebug: TTabSheet;
    GroupBox29: TGroupBox;
    GroupBox30: TGroupBox;
    Label45: TLabel;
    EditM2CheckCodeAddr: TEdit;
    TimerCheckDebug: TTimer;
    Label46: TLabel;
    EditM2CheckCode: TEdit;
    ButtonM2Suspend: TButton;
    GroupBox31: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    EditDBCheckCodeAddr: TEdit;
    EditDBCheckCode: TEdit;
    Button3: TButton;
    GroupBox32: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    EditM2Server_TestLevel: TSpinEdit;
    EditM2Server_TestGold: TSpinEdit;
    Label49: TLabel;
    EditSelGate_GatePort1: TEdit;
    GroupBox33: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    EditLoginServerGatePort: TEdit;
    EditLoginServerServerPort: TEdit;
    GroupBox34: TGroupBox;
    CheckBoxboLoginServer_GetStart: TCheckBox;
    GroupBox35: TGroupBox;
    CheckBoxDBServerGetStart: TCheckBox;
    GroupBox36: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    EditDBServerGatePort: TEdit;
    EditDBServerServerPort: TEdit;
    GroupBox37: TGroupBox;
    CheckBoxLogServerGetStart: TCheckBox;
    GroupBox38: TGroupBox;
    Label54: TLabel;
    EditLogServerPort: TEdit;
    GroupBox39: TGroupBox;
    Label55: TLabel;
    EditM2ServerGatePort: TEdit;
    GroupBox40: TGroupBox;
    CheckBoxM2ServerGetStart: TCheckBox;
    Label56: TLabel;
    EditM2ServerMsgSrvPort: TEdit;
    Label57: TLabel;
    EditDBCheckStr: TEdit;
    Label58: TLabel;
    EditM2CheckStr: TEdit;
    GroupBox41: TGroupBox;
    LabelVersion: TLabel;
    Label60: TLabel;
    Label63: TLabel;
    GroupBox4: TGroupBox;
    ListViewDataBackup: TListView;
    GroupBox6: TGroupBox;
    ButtonBackChg: TButton;
    ButtonBackDel: TButton;
    ButtonBackAdd: TButton;
    ButtonBackStart: TButton;
    ButtonBackSave: TButton;
    RadioButtonBackMode1: TRadioButton;
    Label5: TLabel;
    Label6: TLabel;
    RzButtonEditSource: TRzButtonEdit;
    RzButtonEditDest: TRzButtonEdit;
    RadioButtonBackMode2: TRadioButton;
    RzSpinEditHour1: TRzSpinEdit;
    RzSpinEditHour2: TRzSpinEdit;
    Label7: TLabel;
    RzSpinEditMin1: TRzSpinEdit;
    Label8: TLabel;
    CheckBoxBackUp: TCheckBox;
    Label64: TLabel;
    RzSpinEditMin2: TRzSpinEdit;
    Label65: TLabel;
    CheckBoxZip: TCheckBox;
    LabelBackMsg: TLabel;
    TimerUpDate: TTimer;
    TimerAutoStartServer: TTimer;
    CheckBoxAutoStartServer: TCheckBox;
    Label59: TLabel;
    EditAutoStartDelayTime: TSpinEdit;
    Label66: TLabel;
    Image: TImage;
    TabSheet14: TTabSheet;
    GroupBox60: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    Button1: TButton;
    chkRanking: TCheckBox;
    procedure ButtonNext1Click(Sender: TObject);
    procedure ButtonPrv2Click(Sender: TObject);
    procedure ButtonNext2Click(Sender: TObject);
    procedure ButtonPrv3Click(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonGenGameConfigClick(Sender: TObject);
    procedure ButtonStartGameClick(Sender: TObject);
    procedure TimerStartGameTimer(Sender: TObject);
    procedure CheckBoxDBServerClick(Sender: TObject);
    procedure CheckBoxLoginServerClick(Sender: TObject);
    procedure CheckBoxM2ServerClick(Sender: TObject);
    procedure CheckBoxLogServerClick(Sender: TObject);
    procedure CheckBoxLoginGateClick(Sender: TObject);
    procedure CheckBoxSelGateClick(Sender: TObject);
    procedure CheckBoxRunGateClick(Sender: TObject);
    procedure TimerStopGameTimer(Sender: TObject);
    procedure TimerCheckRunTimer(Sender: TObject);
    procedure ButtonReLoadConfigClick(Sender: TObject);
    procedure EditLoginGate_MainFormXChange(Sender: TObject);
    procedure EditLoginGate_MainFormYChange(Sender: TObject);
    procedure EditSelGate_MainFormXChange(Sender: TObject);
    procedure EditSelGate_MainFormYChange(Sender: TObject);
    procedure EditLoginServer_MainFormXChange(Sender: TObject);
    procedure EditLoginServer_MainFormYChange(Sender: TObject);
    procedure EditDBServer_MainFormXChange(Sender: TObject);
    procedure EditDBServer_MainFormYChange(Sender: TObject);
    procedure EditLogServer_MainFormXChange(Sender: TObject);
    procedure EditLogServer_MainFormYChange(Sender: TObject);
    procedure EditM2Server_MainFormXChange(Sender: TObject);
    procedure EditM2Server_MainFormYChange(Sender: TObject);
    procedure MemoLogChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonNext3Click(Sender: TObject);
    procedure ButtonNext4Click(Sender: TObject);
    procedure ButtonNext5Click(Sender: TObject);
    procedure ButtonNext6Click(Sender: TObject);
    procedure ButtonNext7Click(Sender: TObject);
    procedure ButtonPrv4Click(Sender: TObject);
    procedure ButtonPrv5Click(Sender: TObject);
    procedure ButtonPrv6Click(Sender: TObject);
    procedure ButtonPrv7Click(Sender: TObject);
    procedure ButtonPrv8Click(Sender: TObject);
    procedure ButtonNext8Click(Sender: TObject);
    procedure ButtonPrv9Click(Sender: TObject);
    procedure EditRunGate_ConntChange(Sender: TObject);
    procedure ButtonLoginServerConfigClick(Sender: TObject);
    procedure CheckBoxDynamicIPModeClick(Sender: TObject);
    procedure CheckBoxDisableAutoGameClick(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure TimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditNoticeUrlChange(Sender: TObject);
    procedure EditClientFormChange(Sender: TObject);
    procedure MemoGameListChange(Sender: TObject);
    procedure ButtonRunGateDefaultClick(Sender: TObject);
    procedure ButtonGeneralDefalultClick(Sender: TObject);
    procedure ButtonLoginGateDefaultClick(Sender: TObject);
    procedure ButtonSelGateDefaultClick(Sender: TObject);
    procedure ButtonLoginSrvDefaultClick(Sender: TObject);
    procedure ButtonDBServerDefaultClick(Sender: TObject);
    procedure ButtonLogServerDefaultClick(Sender: TObject);
    procedure ButtonM2ServerDefaultClick(Sender: TObject);
    procedure ButtonSearchLoginAccountClick(Sender: TObject);
    procedure CkFullEditModeClick(Sender: TObject);
    procedure ButtonLoginAccountOKClick(Sender: TObject);
    procedure EditLoginAccountChange(Sender: TObject);
    procedure CheckBoxboLoginGate_GetStartClick(Sender: TObject);
    procedure CheckBoxboSelGate_GetStartClick(Sender: TObject);
    procedure TimerCheckDebugTimer(Sender: TObject);
    procedure ButtonM2SuspendClick(Sender: TObject);
    procedure EditM2Server_TestLevelChange(Sender: TObject);
    procedure EditM2Server_TestGoldChange(Sender: TObject);
    procedure CheckBoxboLoginServer_GetStartClick(Sender: TObject);
    procedure CheckBoxDBServerGetStartClick(Sender: TObject);
    procedure CheckBoxLogServerGetStartClick(Sender: TObject);
    procedure CheckBoxM2ServerGetStartClick(Sender: TObject);
    procedure ButtonBackStartClick(Sender: TObject);
    procedure ButtonBackSaveClick(Sender: TObject);
    procedure ButtonBackAddClick(Sender: TObject);
    procedure ButtonBackDelClick(Sender: TObject);
    procedure ButtonBackChgClick(Sender: TObject);
    procedure ListViewDataBackupClick(Sender: TObject);
    procedure RzButtonEditSourceButtonClick(Sender: TObject);
    procedure RzButtonEditDestButtonClick(Sender: TObject);
    procedure RadioButtonBackMode1Click(Sender: TObject);
    procedure RadioButtonBackMode2Click(Sender: TObject);
    procedure TimerUpDateTimer(Sender: TObject);
    procedure TimerAutoStartServerTimer(Sender: TObject);
    procedure CheckBoxAutoStartServerClick(Sender: TObject);
    procedure EditAutoStartDelayTimeChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkRankingClick(Sender: TObject);
  private
    m_boOpen: Boolean;
    m_nStartStatus: Integer;
    m_dwShowTick: LongWord;
    procedure RefGameConsole();
    procedure GenGameConfig();
    procedure GenDBServerConfig();
    procedure GenLoginServerConfig();
    procedure GenLogServerConfig();
    procedure GenM2ServerConfig();
    procedure GenLoginGateConfig();
    procedure GenSelGateConfig();
    procedure GenRunGateConfig;
    procedure StartGame();
    procedure StopGame();
    procedure MainOutMessage(sMsg: string);
    procedure ProcessDBServerMsg(wIdent: Word; sData: string);
    procedure ProcessLoginSrvMsg(wIdent: Word; sData: string);
    procedure ProcessLoginSrvGetUserAccount(sData: string);
    procedure ProcessLoginSrvChangeUserAccountStatus(sData: string);
    procedure UserAccountEditMode(boChecked: Boolean);
    procedure ProcessLogServerMsg(wIdent: Word; sData: string);
    procedure ProcessRankingMsg(wIdent: Word; sData: string);

    procedure ProcessLoginGateMsg(wIdent: Word; sData: string);
    procedure ProcessLoginGate1Msg(wIdent: Word; sData: string);

    procedure ProcessSelGateMsg(wIdent: Word; sData: string);
    procedure ProcessSelGate1Msg(wIdent: Word; sData: string);

    procedure ProcessRunGateMsg(wIdent: Word; sData: string);
    procedure ProcessM2ServerMsg(wIdent: Word; sData: string);
    procedure GetMutRunGateConfing(nIndex: Integer);


    procedure ProcessClientPacket();
    procedure SendGameList(Socket: TCustomWinSocket);
    procedure SendSocket(Socket: TCustomWinSocket; SendMsg: string);
    function StartService(): Boolean;
    procedure StopService();
    procedure RefGameDebug();
    procedure GenMutSelGateConfig(nIndex: Integer);

    procedure LoadBackList();
    procedure RefBackListToView();
    { Private declarations }
  public
    procedure ProcessMessage(var Msg: TMsg; var Handled: Boolean);
    procedure MyMessage(var MsgData: TWmCopyData); message WM_COPYDATA;

    { Public declarations }
  end;
  FUNCTION IsHungAppWindow(hwnd: HWND): boolean; stdcall; external user32 name 'IsHungAppWindow';      //응답없음 상태 체크
var
  frmMain: TfrmMain;

implementation

uses GShare, HUtil32, Grobal2, GLoginServer, EncryptUnit2, DataBackUp, EDcode;
{$R *.dfm}
//Folder browse functions    uses ShlObj, ActiveX

function SelectDirCB(Wnd: HWND; uMsg: UINT; lParam, lpData: lParam): Integer stdcall;
begin
  if (uMsg = BFFM_INITIALIZED) and (lpData <> 0) then
    SendMessage(Wnd, BFFM_SETSELECTION, Integer(True), lpData);
  Result := 0;
end;

function SelectDirectory(const Caption: string; const Root: WideString;
  var Directory: string; Owner: THandle): Boolean;
var
  WindowList: Pointer;
  BrowseInfo: TBrowseInfo;
  Buffer: PChar;
  RootItemIDList, ItemIDList: PItemIDList;
  ShellMalloc: IMalloc;
  IDesktopFolder: IShellFolder;
  Eaten, Flags: LongWord;
begin
  Result := False;
  if not DirectoryExists(Directory) then
    Directory := '';
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  if (ShGetMalloc(ShellMalloc) = S_OK) and (ShellMalloc <> nil) then begin
    Buffer := ShellMalloc.Alloc(MAX_PATH);
    try
      RootItemIDList := nil;
      if Root <> '' then begin
        SHGetDesktopFolder(IDesktopFolder);
        IDesktopFolder.ParseDisplayName(Application.Handle, nil,
          POleStr(Root), Eaten, RootItemIDList, Flags);
      end;
      with BrowseInfo do begin
        hwndOwner := Owner; //Application.Handle;
        pidlRoot := RootItemIDList;
        pszDisplayName := Buffer;
        lpszTitle := PChar(Caption);
        ulFlags := BIF_RETURNONLYFSDIRS;
        if Directory <> '' then begin
          lpfn := SelectDirCB;
          lParam := Integer(PChar(Directory));
        end;
      end;
      WindowList := DisableTaskWindows(0);
      try
        ItemIDList := ShBrowseForFolder(BrowseInfo);
      finally
        EnableTaskWindows(WindowList);
      end;
      Result := ItemIDList <> nil;
      if Result then begin
        ShGetPathFromIDList(ItemIDList, Buffer);
        ShellMalloc.Free(ItemIDList);
        Directory := Buffer;
      end;
    finally
      ShellMalloc.Free(Buffer);
    end;
  end;
end;

procedure TfrmMain.MainOutMessage(sMsg: string);
begin
  sMsg := '[' + DateTimeToStr(Now) + '] ' + sMsg;
  MemoLog.Lines.Add(sMsg);
end;

procedure TfrmMain.ButtonNext1Click(Sender: TObject);
var
  sGameDirectory: string;
  sHeroDBName: string;
  sGameName: string;
  sExtIPAddr: string;
begin
  sGameDirectory := Trim(EditGameDir.Text);
  sHeroDBName := Trim(EditHeroDB.Text);

  sGameName := Trim(EditGameName.Text);
  sExtIPAddr := Trim(EditGameExtIPaddr.Text);
  if sGameName = '' then begin
    Application.MessageBox('Server Name entered incorrectly', 'Error', MB_OK + MB_ICONEXCLAMATION);
    EditGameName.SetFocus;
    Exit;
  end;
  if (sExtIPAddr = '') or not IsIPaddr(sExtIPAddr) then begin
    Application.MessageBox('IP Address is invalid', 'Error', MB_OK + MB_ICONEXCLAMATION);
    EditGameExtIPaddr.SetFocus;
    Exit;
  end;

  if (sGameDirectory = '') or not DirectoryExists(sGameDirectory) then begin
    Application.MessageBox('Server Directory not found', 'Error', MB_OK + MB_ICONEXCLAMATION);
    EditGameDir.SetFocus;
    Exit;
  end;
  if not (sGameDirectory[Length(sGameDirectory)] = '\') then begin
    Application.MessageBox('Last Character in Directory must be "\"', 'Error', MB_OK + MB_ICONEXCLAMATION);
    EditGameDir.SetFocus;
    Exit;
  end;
  {if sHeroDBName = '' then begin
    Application.MessageBox('Database name entered incorrectly', 'Error', MB_OK + MB_ICONEXCLAMATION);
    EditHeroDB.SetFocus;
    Exit;
  end; }
  g_sGameDirectory := sGameDirectory;
  g_sGameName := sGameName;
  g_sExtIPaddr := sExtIPAddr;
  g_boDynamicIPMode := CheckBoxDynamicIPMode.Checked;

  PageControl3.ActivePageIndex := 1;
end;

procedure TfrmMain.ButtonPrv2Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 0;
end;

procedure TfrmMain.ButtonNext2Click(Sender: TObject);
var
  nPort: Integer;
begin
  nPort := Str_ToInt(Trim(EditLoginGate_GatePort.Text), -1);
  if (nPort < 0) or (nPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditLoginGate_GatePort.SetFocus;
    Exit;
  end;
  g_nLoginGate_GatePort := nPort;
  PageControl3.ActivePageIndex := 2;
end;

procedure TfrmMain.ButtonPrv3Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 1;
end;

procedure TfrmMain.ButtonNext3Click(Sender: TObject);
var
  nPort: Integer;
begin
  nPort := Str_ToInt(Trim(EditSelGate_GatePort.Text), -1);
  if (nPort < 0) or (nPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditSelGate_GatePort.SetFocus;
    Exit;
  end;
  g_nSeLGate_GatePort := nPort;

  nPort := Str_ToInt(Trim(EditSelGate_GatePort1.Text), -1);
  if (nPort < 0) or (nPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditSelGate_GatePort1.SetFocus;
    Exit;
  end;
  g_nSeLGate_GatePort1 := nPort;
  PageControl3.ActivePageIndex := 3;
end;

procedure TfrmMain.ButtonNext4Click(Sender: TObject);
var
  nPort1: Integer;
begin
  nPort1 := Str_ToInt(Trim(EditRunGate_GatePort1.Text), -1);

  if (nPort1 < 0) or (nPort1 > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditRunGate_GatePort1.SetFocus;
    Exit;
  end;

  g_RunGateInfo[0].nGatePort := nPort1;
  PageControl3.ActivePageIndex := 4;
end;

procedure TfrmMain.ButtonNext5Click(Sender: TObject);
var
  nGatePort, nServerPort: Integer;
begin
  nGatePort := Str_ToInt(Trim(EditLoginServerGatePort.Text), -1);
  nServerPort := Str_ToInt(Trim(EditLoginServerServerPort.Text), -1);

  if (nGatePort < 0) or (nGatePort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditLoginServerGatePort.SetFocus;
    Exit;
  end;
  if (nServerPort < 0) or (nServerPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditLoginServerServerPort.SetFocus;
    Exit;
  end;
  g_nLoginServer_GatePort := nGatePort;
  g_nLoginServer_ServerPort := nServerPort;
  PageControl3.ActivePageIndex := 5;
end;

procedure TfrmMain.ButtonNext6Click(Sender: TObject);
var
  nGatePort, nServerPort: Integer;
begin
  nGatePort := Str_ToInt(Trim(EditDBServerGatePort.Text), -1);
  nServerPort := Str_ToInt(Trim(EditDBServerServerPort.Text), -1);

  if (nGatePort < 0) or (nGatePort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditDBServerGatePort.SetFocus;
    Exit;
  end;
  if (nServerPort < 0) or (nServerPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditDBServerServerPort.SetFocus;
    Exit;
  end;
  g_nDBServer_Config_GatePort := nGatePort;
  g_nDBServer_Config_ServerPort := nServerPort;
  PageControl3.ActivePageIndex := 6;
end;

procedure TfrmMain.ButtonNext7Click(Sender: TObject);
var
  nPort: Integer;
begin
  nPort := Str_ToInt(Trim(EditLogServerPort.Text), -1);
  if (nPort < 0) or (nPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditLogServerPort.SetFocus;
    Exit;
  end;
  g_nLogServer_Port := nPort;
  PageControl3.ActivePageIndex := 7;
end;

procedure TfrmMain.ButtonNext8Click(Sender: TObject);
var
  nGatePort, nMsgSrvPort: Integer;
begin
  nGatePort := Str_ToInt(Trim(EditM2ServerGatePort.Text), -1);
  nMsgSrvPort := Str_ToInt(Trim(EditM2ServerMsgSrvPort.Text), -1);
  if (nGatePort < 0) or (nGatePort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditM2ServerGatePort.SetFocus;
    Exit;
  end;
  if (nMsgSrvPort < 0) or (nMsgSrvPort > 65535) then begin
    Application.MessageBox('Port entered incorrectly', 'Error', MB_OK + MB_ICONERROR);
    EditM2ServerMsgSrvPort.SetFocus;
    Exit;
  end;
  g_nM2Server_GatePort := nGatePort;
  g_nM2Server_MsgSrvPort := nMsgSrvPort;
  PageControl3.ActivePageIndex := 8;
end;

procedure TfrmMain.ButtonPrv4Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 2;
end;

procedure TfrmMain.ButtonPrv5Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 3;
end;

procedure TfrmMain.ButtonPrv6Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 4;
end;

procedure TfrmMain.ButtonPrv7Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 5;
end;

procedure TfrmMain.ButtonPrv8Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 6;
end;

procedure TfrmMain.ButtonPrv9Click(Sender: TObject);
begin
  PageControl3.ActivePageIndex := 7;
end;

procedure TfrmMain.ButtonSaveClick(Sender: TObject);
begin
  //  ButtonSave.Enabled:=False;
  g_IniConf.WriteInteger('GameConf', 'dwStopTimeOut', g_dwStopTimeOut);
  g_IniConf.WriteString('GameConf', 'GameDirectory', g_sGameDirectory);

  g_IniConf.WriteString('GameConf', 'GameName', g_sGameName);
  g_IniConf.WriteString('GameConf', 'ExtIPaddr', g_sExtIPaddr);
  g_IniConf.WriteInteger('GameConf', 'AutoStartDelayTime', g_nAutoStartDelayTime);
  g_IniConf.WriteBool('GameConf', 'GetAutoStartServer', g_boAutoStartServer);

  g_IniConf.WriteBool('GameConf', 'DynamicIPMode', g_boDynamicIPMode);
  g_IniConf.WriteInteger('DBServer', 'MainFormX', g_nDBServer_MainFormX);
  g_IniConf.WriteInteger('DBServer', 'MainFormY', g_nDBServer_MainFormY);
  g_IniConf.WriteInteger('DBServer', 'GatePort', g_nDBServer_Config_GatePort);
  g_IniConf.WriteInteger('DBServer', 'ServerPort', g_nDBServer_Config_ServerPort);
  g_IniConf.WriteBool('DBServer', 'DisableAutoGame', g_boDBServer_DisableAutoGame);
  g_IniConf.WriteBool('DBServer', 'GetStart', g_boDBServer_GetStart);

  g_IniConf.WriteInteger('M2Server', 'MainFormX', g_nM2Server_MainFormX);
  g_IniConf.WriteInteger('M2Server', 'MainFormY', g_nM2Server_MainFormY);
  g_IniConf.WriteInteger('M2Server', 'TestLevel', g_nM2Server_TestLevel);
  g_IniConf.WriteInteger('M2Server', 'TestGold', g_nM2Server_TestGold);

  g_IniConf.WriteInteger('M2Server', 'GatePort', g_nM2Server_GatePort);
  g_IniConf.WriteInteger('M2Server', 'MsgSrvPort', g_nM2Server_MsgSrvPort);
  g_IniConf.WriteBool('M2Server', 'GetStart', g_boM2Server_GetStart);

  g_IniConf.WriteInteger('RunGate', 'GatePort1', g_RunGateInfo[0].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort2', g_RunGateInfo[1].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort3', g_RunGateInfo[2].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort4', g_RunGateInfo[3].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort5', g_RunGateInfo[4].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort6', g_RunGateInfo[5].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort7', g_RunGateInfo[6].nGatePort);
  g_IniConf.WriteInteger('RunGate', 'GatePort8', g_RunGateInfo[7].nGatePort);

  g_IniConf.WriteInteger('LoginGate', 'MainFormX', g_nLoginGate_MainFormX);
  g_IniConf.WriteInteger('LoginGate', 'MainFormY', g_nLoginGate_MainFormY);
  g_IniConf.WriteBool('LoginGate', 'GetStart', g_boLoginGate_GetStart);
  g_IniConf.WriteInteger('LoginGate', 'GatePort', g_nLoginGate_GatePort);

  g_IniConf.WriteInteger('SelGate', 'MainFormX', g_nSelGate_MainFormX);
  g_IniConf.WriteInteger('SelGate', 'MainFormY', g_nSelGate_MainFormY);
  g_IniConf.WriteBool('SelGate', 'GetStart', g_boSelGate_GetStart);

  g_IniConf.WriteInteger('SelGate', 'GatePort', g_nSeLGate_GatePort);
  g_IniConf.WriteInteger('SelGate', 'GatePort1', g_nSeLGate_GatePort1);

  g_IniConf.WriteInteger('RunGate', 'Count', g_nRunGate_Count);

  g_IniConf.WriteInteger('LoginServer', 'MainFormX', g_nLoginServer_MainFormX);
  g_IniConf.WriteInteger('LoginServer', 'MainFormY', g_nLoginServer_MainFormY);
  g_IniConf.WriteInteger('LoginServer', 'GatePort', g_nLoginServer_GatePort);
  g_IniConf.WriteInteger('LoginServer', 'ServerPort', g_nLoginServer_ServerPort);
  g_IniConf.WriteBool('LoginServer', 'GetStart', g_boLoginServer_GetStart);

  g_IniConf.WriteInteger('LogServer', 'MainFormX', g_nLogServer_MainFormX);
  g_IniConf.WriteInteger('LogServer', 'MainFormY', g_nLogServer_MainFormY);

  g_IniConf.WriteInteger('LogServer', 'Port', g_nLogServer_Port);
  g_IniConf.WriteBool('LogServer', 'GetStart', g_boLogServer_GetStart);


  Application.MessageBox('Server Config file has been saved', 'Message', MB_OK + MB_ICONINFORMATION);
  if Application.MessageBox('Do you want to generate a new Server Config file?', 'Message', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    ButtonGenGameConfigClick(ButtonGenGameConfig);
  end;
  PageControl3.ActivePageIndex := 0;
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmMain.LoadBackList();
var
  I: Integer;
  List: TStringList;
  Conini: Tinifile;
  BackUpObject: TBackUpObject;
  sSource, sDest: string;
  wHour, wMin: Word;
  btBackMode: Byte;
  boGetBack: Boolean;
  boZip: Boolean;
begin
  ButtonBackDel.Enabled := False;
  ButtonBackChg.Enabled := False;
  g_BackUpManager := TBackUpManager.Create;
  List := TStringList.Create;
  Conini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'BackList.txt');
  Conini.ReadSections(List);
  if Conini <> nil then begin
    for I := 0 to List.Count - 1 do begin
      sSource := Conini.ReadString(List.Strings[I], 'Source', '');
      sDest := Conini.ReadString(List.Strings[I], 'Save', '');
      wHour := Conini.ReadInteger(List.Strings[I], 'Hour', 0);
      wMin := Conini.ReadInteger(List.Strings[I], 'Min', 0);
      btBackMode := Conini.ReadInteger(List.Strings[I], 'BackMode', 0);
      boGetBack := Conini.ReadBool(List.Strings[I], 'GetBack', True);
      boZip := Conini.ReadBool(List.Strings[I], 'Zip', True);
      if (sSource <> '') and (sDest <> '') then begin
        BackUpObject := TBackUpObject.Create;
        BackUpObject.m_nIndex := I;
        BackUpObject.m_sSourceDir := sSource;
        BackUpObject.m_sDestDir := sDest;
        BackUpObject.m_btBackUpMode := btBackMode;
        BackUpObject.m_boBackUp := boGetBack;
        BackUpObject.m_boZip := boZip;
        BackUpObject.m_wHour := wHour;
        BackUpObject.m_wMin := wMin;
        g_BackUpManager.AddObjectToList(BackUpObject);
      end;
    end;
    Conini.Free;
  end;
  List.Free;
end;

procedure TfrmMain.RefBackListToView();
var
  I: Integer;
  BackUpObject: TBackUpObject;
  ListItem: TListItem;
begin
  ListViewDataBackup.Items.Clear;
  for I := 0 to g_BackUpManager.m_BackUpList.Count - 1 do begin
    BackUpObject := TBackUpObject(g_BackUpManager.m_BackUpList.Items[I]);
    ListItem := ListViewDataBackup.Items.Add;
    ListItem.Caption := BackUpObject.m_sSourceDir;
    ListItem.SubItems.AddObject(BackUpObject.m_sDestDir, BackUpObject);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Caption := m_sCapTion;
  LabelVersion.Caption := m_sVersion;

  m_boOpen := False;
  g_nFormIdx := g_IniConf.ReadInteger('Setup', 'FormID', g_nFormIdx);
  Application.OnMessage := ProcessMessage;
  PageControl1.ActivePageIndex := 0;
  PageControl3.ActivePageIndex := 0;
  m_nStartStatus := 0;
  m_nBackStartStatus := 0;
  MemoLog.Clear;

  LoadConfig();
  LoadBackList();
  RefBackListToView();
  if not StartService() then Exit;
  RefGameConsole();
  TabSheetDebug.TabVisible := False;
  if g_boShowDebugTab then begin
    TabSheetDebug.TabVisible := True;
    TimerCheckDebug.Enabled := True;
  end;

  m_boOpen := True;
  Image.Picture.Icon.Handle := ExtractIcon(hInstance, PChar(Application.ExeName), 0);
  //MainOutMessage('Game Controller started successfully...');
//  SetWindowPos(Self.Handle,HWND_TOPMOST,Self.Left,Self.Top,Self.Width,Self.Height,$40);
end;

procedure TfrmMain.ButtonGenGameConfigClick(Sender: TObject);
begin
  //  ButtonGenGameConfig.Enabled:=False;
  GenGameConfig();
  RefGameConsole();
  Application.MessageBox('Server Config file has been generated', 'Message', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmMain.GenGameConfig;
begin
  GenDBServerConfig();
  GenLoginServerConfig();
  GenLogServerConfig();
  GenM2ServerConfig();
  GenLoginGateConfig();
  GenSelGateConfig();
  GenRunGateConfig();
end;

procedure TfrmMain.GenDBServerConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
  SaveList: TStringList;
begin
  sIniFile := g_sGameDirectory + g_sDBServer_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  IniGameConf := Tinifile.Create(sIniFile + g_sDBServer_ConfigFile);

  IniGameConf.WriteString('Setup', 'ServerName', g_sGameName);
  IniGameConf.WriteString('Setup', 'ServerAddr', g_sExtIPaddr {g_sDBServer_Config_ServerAddr});   //아이피
  IniGameConf.WriteInteger('Setup', 'ServerPort', g_nDBServer_Config_ServerPort);
  IniGameConf.WriteString('Setup', 'MapFile', '.\' + g_sDBServer_Config_MapFile);
  IniGameConf.WriteBool('Setup', 'ViewHackMsg', g_boDBServer_Config_ViewHackMsg);
  IniGameConf.WriteBool('Setup', 'DynamicIPMode', g_boDynamicIPMode);
  IniGameConf.WriteBool('Setup', 'DisableAutoGame', g_boDBServer_DisableAutoGame);
  IniGameConf.WriteString('Setup', 'GateAddr', g_sExtIPaddr{g_sDBServer_Config_GateAddr});
  IniGameConf.WriteInteger('Setup', 'GatePort', g_nDBServer_Config_GatePort);

  IniGameConf.WriteString('Server', 'IDSAddr', g_sExtIPaddr {g_sLoginServer_ServerAddr}); //Login server IP
  IniGameConf.WriteInteger('Server', 'IDSPort', g_nLoginServer_ServerPort); //Login Server Port


  IniGameConf.WriteInteger('DBClear', 'Interval', g_nDBServer_Config_Interval);
  IniGameConf.WriteInteger('DBClear', 'Level1', g_nDBServer_Config_Level1);
  IniGameConf.WriteInteger('DBClear', 'Level2', g_nDBServer_Config_Level2);
  IniGameConf.WriteInteger('DBClear', 'Level3', g_nDBServer_Config_Level3);
  IniGameConf.WriteInteger('DBClear', 'Day1', g_nDBServer_Config_Day1);
  IniGameConf.WriteInteger('DBClear', 'Day2', g_nDBServer_Config_Day2);
  IniGameConf.WriteInteger('DBClear', 'Day3', g_nDBServer_Config_Day3);
  IniGameConf.WriteInteger('DBClear', 'Month1', g_nDBServer_Config_Month1);
  IniGameConf.WriteInteger('DBClear', 'Month2', g_nDBServer_Config_Month2);
  IniGameConf.WriteInteger('DBClear', 'Month3', g_nDBServer_Config_Month3);

  IniGameConf.WriteString('DB', 'Dir', g_sDBServerDirectory + g_sDBServer_Config_Dir);
  IniGameConf.WriteString('DB', 'IdDir', g_sDBServerDirectory + g_sDBServer_Config_IdDir);
  IniGameConf.WriteString('DB', 'HumDir', g_sDBServerDirectory + g_sDBServer_Config_HumDir);
  IniGameConf.WriteString('DB', 'FeeDir', g_sDBServerDirectory + g_sDBServer_Config_FeeDir);
  IniGameConf.WriteString('DB', 'BackupDir', g_sDBServerDirectory + g_sDBServer_Config_BackupDir);
  IniGameConf.WriteString('DB', 'ConnectDir', g_sDBServerDirectory + g_sDBServer_Config_ConnectDir);
  IniGameConf.WriteString('DB', 'LogDir', g_sDBServerDirectory + g_sDBServer_Config_LogDir);

  IniGameConf.Free;

  SaveList := TStringList.Create;
  SaveList.Add(g_sExtIPaddr);
  SaveList.SaveToFile(sIniFile + g_sDBServer_AddrTableFile);

  SaveList.Clear;
  case g_nRunGate_Count of
    1: SaveList.Add(Format('%s %s %d', [{g_sLocalIPaddr}g_sExtIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort]));

    2: SaveList.Add(Format('%s %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort]));

    3: SaveList.Add(Format('%s %s %d %s %d %s %d',
        [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort]));

    4: SaveList.Add(Format('%s %s %d %s %d %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[3].nGatePort]));

    5: SaveList.Add(Format('%s %s %d %s %d %s %d %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[3].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[4].nGatePort]));

    6: SaveList.Add(Format('%s %s %d %s %d %s %d %s %d %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[3].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[4].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[5].nGatePort]));

    7: SaveList.Add(Format('%s %s %d %s %d %s %d %s %d %s %d %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[3].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[4].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[5].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[6].nGatePort]));

    8: SaveList.Add(Format('%s %s %d %s %d %s %d %s %d %s %d %s %d %s %d %s %d', [g_sLocalIPaddr,
        g_sExtIPaddr, g_RunGateInfo[0].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[1].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[2].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[3].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[4].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[5].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[6].nGatePort,
          g_sExtIPaddr, g_RunGateInfo[7].nGatePort]));
  end;

  SaveList.SaveToFile(sIniFile + g_sDBServer_ServerinfoFile);
  SaveList.Free;

  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_Dir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_IdDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_HumDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_FeeDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_BackupDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_ConnectDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sDBServer_Directory + g_sDBServer_Config_LogDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
end;

procedure TfrmMain.GenLoginServerConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
  SaveList: TStringList;
begin
  sIniFile := g_sGameDirectory + g_sLoginServer_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  IniGameConf := Tinifile.Create(sIniFile + g_sLoginServer_ConfigFile);
  IniGameConf.WriteInteger('Server', 'ReadyServers', g_sLoginServer_ReadyServers);

  IniGameConf.WriteString('Server', 'DBServer', g_sExtIPaddr {g_sLoginServer_GateAddr});
  IniGameConf.WriteString('Server', 'FeeServer', g_sExtIPaddr {g_sLoginServer_GateAddr});
  IniGameConf.WriteString('Server', 'LogServer', g_sExtIPaddr {g_sLoginServer_GateAddr});

  IniGameConf.WriteString('Server', 'TestServer', BoolToStr2(g_sLoginServer_TestServer));
  IniGameConf.WriteBool('Server', 'DynamicIPMode', g_boDynamicIPMode);
  IniGameConf.WriteString('Server', 'GateAddr', g_sLoginServer_GateAddr);
  IniGameConf.WriteInteger('Server', 'GatePort', g_nLoginServer_GatePort);
  IniGameConf.WriteString('Server', 'ServerAddr', g_sLoginServer_ServerAddr);
  IniGameConf.WriteInteger('Server', 'ServerPort', g_nLoginServer_ServerPort);

  IniGameConf.WriteString('DB', 'IdDir', g_sLoginServerDirectory + g_sLoginServer_IdDir);
  IniGameConf.WriteString('DB', 'FeedIDList', g_sLoginServerDirectory + g_sLoginServer_FeedIDList);
  IniGameConf.WriteString('DB', 'FeedIPList', g_sLoginServerDirectory + g_sLoginServer_FeedIPList);
  IniGameConf.WriteString('DB', 'CountLogDir', g_sLoginServerDirectory + g_sLoginServer_CountLogDir);
  IniGameConf.WriteString('DB', 'WebLogDir', g_sLoginServerDirectory + g_sLoginServer_WebLogDir);

  IniGameConf.Free;

  SaveList := TStringList.Create;

  SaveList.Add(Format('%s %s %s %s %s:%d', [g_sGameName, g_sGameName,{g_sLocalIPaddr, g_sLocalIPaddr}g_sExtIPaddr, g_sExtIPaddr, g_sExtIPaddr, g_nSeLGate_GatePort]));

  SaveList.SaveToFile(sIniFile + g_sLoginServer_AddrTableFile);

  SaveList.Clear;
  SaveList.Add({g_sLocalIPaddr}g_sExtIPaddr);
  SaveList.SaveToFile(sIniFile + g_sLoginServer_ServeraddrFile);

  SaveList.Clear;
  SaveList.Add(Format('%s %s %d', [g_sGameName, g_sGameName, g_nLimitOnlineUser]));
  SaveList.SaveToFile(sIniFile + g_sLoginServerUserLimitFile);
  SaveList.Free;

  sIniFile := g_sGameDirectory + g_sLoginServer_Directory + g_sLoginServer_IdDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  sIniFile := g_sGameDirectory + g_sLoginServer_Directory + g_sLoginServer_CountLogDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  sIniFile := g_sGameDirectory + g_sLoginServer_Directory + g_sLoginServer_WebLogDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
end;

procedure TfrmMain.GenLogServerConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
begin
  sIniFile := g_sGameDirectory + g_sLogServer_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  IniGameConf := Tinifile.Create(sIniFile + g_sLogServer_ConfigFile);
  IniGameConf.WriteString('Setup', 'ServerName', g_sGameName);
  IniGameConf.WriteInteger('Setup', 'Port', g_nLogServer_Port);
  IniGameConf.WriteString('Setup', 'BaseDir', g_sLogServerDirectory + g_sLogServer_BaseDir);

  sIniFile := sIniFile + g_sLogServer_BaseDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  IniGameConf.Free;
end;

procedure TfrmMain.GenM2ServerConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
  SaveList: TStringList;
begin
  sIniFile := g_sGameDirectory + g_sM2Server_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  IniGameConf := Tinifile.Create(sIniFile + g_sM2Server_ConfigFile);

  IniGameConf.WriteString('Server', 'ServerName', g_sGameName);
  IniGameConf.WriteInteger('Server', 'ServerNumber', g_nM2Server_ServerNumber);
  IniGameConf.WriteInteger('Server', 'ServerIndex', g_nM2Server_ServerIndex);

  IniGameConf.WriteString('Server', 'VentureServer', BoolToStr2(g_boM2Server_VentureServer));
  IniGameConf.WriteString('Server', 'TestServer', BoolToStr2(g_boM2Server_TestServer));
  IniGameConf.WriteInteger('Server', 'TestLevel', g_nM2Server_TestLevel);
  IniGameConf.WriteInteger('Server', 'TestGold', g_nM2Server_TestGold);
  IniGameConf.WriteInteger('Server', 'TestServerUserLimit', g_nLimitOnlineUser);
  IniGameConf.WriteString('Server', 'ServiceMode', BoolToStr2(g_boM2Server_ServiceMode));
  IniGameConf.WriteString('Server', 'NonPKServer', BoolToStr2(g_boM2Server_NonPKServer));

  IniGameConf.WriteString('Server', 'DBAddr', g_sExtIPaddr{g_sDBServer_Config_ServerAddr});
  IniGameConf.WriteInteger('Server', 'DBPort', g_nDBServer_Config_ServerPort);
  IniGameConf.WriteString('Server', 'IDSAddr', g_sExtIPaddr {g_sLoginServer_ServerAddr});
  IniGameConf.WriteInteger('Server', 'IDSPort', g_nLoginServer_ServerPort);
  IniGameConf.WriteString('Server', 'MsgSrvAddr', g_sExtIPaddr{g_sM2Server_MsgSrvAddr});
  IniGameConf.WriteInteger('Server', 'MsgSrvPort', g_nM2Server_MsgSrvPort);
  IniGameConf.WriteString('Server', 'LogServerAddr', g_sExtIPaddr{g_sLogServer_ServerAddr});
  IniGameConf.WriteInteger('Server', 'LogServerPort', g_nLogServer_Port);
  IniGameConf.WriteString('Server', 'GateAddr', g_sExtIPaddr{g_sM2Server_GateAddr});
  IniGameConf.WriteInteger('Server', 'GatePort', g_nM2Server_GatePort);


  IniGameConf.WriteInteger('Server', 'UserFull', g_nLimitOnlineUser);

  IniGameConf.WriteString('Share', 'BaseDir', g_sM2ServerDirectory + g_sM2Server_BaseDir);
  IniGameConf.WriteString('Share', 'GuildDir', g_sM2ServerDirectory + g_sM2Server_GuildDir);
  IniGameConf.WriteString('Share', 'GuildFile', g_sM2ServerDirectory + g_sM2Server_GuildFile);
  IniGameConf.WriteString('Share', 'VentureDir', g_sM2ServerDirectory + g_sM2Server_VentureDir);
  IniGameConf.WriteString('Share', 'ConLogDir', g_sM2ServerDirectory + g_sM2Server_ConLogDir);
  IniGameConf.WriteString('Share', 'LogDir', g_sM2ServerDirectory + g_sM2Server_LogDir);

  IniGameConf.WriteString('Share', 'CastleDir', g_sM2ServerDirectory + g_sM2Server_CastleDir);
  IniGameConf.WriteString('Share', 'EnvirDir', g_sM2ServerDirectory + g_sM2Server_EnvirDir);
  IniGameConf.WriteString('Share', 'MapDir', g_sM2ServerDirectory + g_sM2Server_MapDir);
  IniGameConf.WriteString('Share', 'NoticeDir', g_sM2ServerDirectory + g_sM2Server_NoticeDir);
  IniGameConf.WriteString('Share', 'CastleFile', g_sM2ServerDirectory + g_sM2Server_CastleFile);


  IniGameConf.Free;

  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_BaseDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_GuildDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_VentureDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_ConLogDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_LogDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_CastleDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_EnvirDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_MapDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  sIniFile := g_sGameDirectory + g_sM2Server_Directory + g_sM2Server_NoticeDir;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;

  sIniFile := g_sGameDirectory + g_sM2Server_Directory;
  SaveList := TStringList.Create;
 // SaveList.Add('GM');
  SaveList.SaveToFile(sIniFile + g_sM2Server_AbuseFile);

  SaveList.Clear;
  SaveList.Add(g_sExtIPaddr{g_sLocalIPaddr});
  SaveList.SaveToFile(sIniFile + g_sM2Server_RunAddrFile);

  SaveList.Clear;
  SaveList.Add('0' + ' ' + g_sExtIPaddr + ' ' + IntToStr(g_RunGateInfo[0].nGatePort));
  SaveList.SaveToFile(sIniFile + g_sM2Server_ServerTableFile);
  SaveList.Free;
end;

procedure TfrmMain.GenLoginGateConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
begin
  sIniFile := g_sGameDirectory + g_sLoginGate_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  IniGameConf := Tinifile.Create(sIniFile + g_sLoginGate_ConfigFile);
  IniGameConf.WriteString('LoginGate', 'Title', g_sGameName);
  IniGameConf.WriteString('LoginGate', 'ServerAddr', g_sExtIPaddr {g_sLoginGate_ServerAddr});
  IniGameConf.WriteInteger('LoginGate', 'ServerPort', g_nLoginServer_GatePort {g_nLoginGate_ServerPort});
  IniGameConf.WriteString('LoginGate', 'GateAddr', g_sLoginGate_GateAddr);
  IniGameConf.WriteInteger('LoginGate', 'GatePort', g_nLoginGate_GatePort);
  {IniGameConf.WriteInteger('LoginGate', 'ShowLogLevel', g_nLoginGate_ShowLogLevel);
  //IniGameConf.WriteInteger('LoginGate', 'MaxConnOfIPaddr', g_nLoginGate_MaxConnOfIPaddr);
  IniGameConf.WriteInteger('LoginGate', 'BlockMethod', g_nLoginGate_BlockMethod);
  IniGameConf.WriteInteger('LoginGate', 'KeepConnectTimeOut', g_nLoginGate_KeepConnectTimeOut); }
  IniGameConf.Free;
end;

procedure TfrmMain.GenSelGateConfig();
var
  IniGameConf: Tinifile;
  sIniFile: string;
begin
  sIniFile := g_sGameDirectory + g_sSelGate_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  IniGameConf := Tinifile.Create(sIniFile + g_sSelGate_ConfigFile);
  IniGameConf.WriteString('SelGate', 'Title', g_sGameName);
  IniGameConf.WriteString('SelGate', 'ServerAddr', g_sExtIPaddr{g_sSelGate_ServerAddr});
  IniGameConf.WriteInteger('SelGate', 'ServerPort', g_nDBServer_Config_GatePort {g_nSelGate_ServerPort});
  IniGameConf.WriteString('SelGate', 'GateAddr', g_sSelGate_GateAddr);
  IniGameConf.WriteInteger('SelGate', 'GatePort', g_nSeLGate_GatePort);

  IniGameConf.Free;
end;

procedure TfrmMain.GenMutSelGateConfig(nIndex: Integer);
var
  IniGameConf: Tinifile;
  sIniFile: string;
  sGateAddr: string;
  nGatePort: Integer;
  sServerAddr: string;
begin
  sIniFile := g_sGameDirectory + g_sSelGate_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  case nIndex of //
    0, 2: begin
        sGateAddr := g_sSelGate_GateAddr;
        nGatePort := g_nSeLGate_GatePort;
        sServerAddr := g_sLocalIPaddr;
      end;
    {1: begin
        sGateAddr := g_sSelGate_GateAddr1;
        nGatePort := g_nSeLGate_GatePort1;
        sServerAddr := g_sExtIPaddr;
      end;}
  end;
  IniGameConf := Tinifile.Create(sIniFile + g_sSelGate_ConfigFile);
  IniGameConf.WriteString('SelGate', 'Title', g_sGameName);
  IniGameConf.WriteString('SelGate', 'ServerAddr', g_sExtIPaddr{g_sSelGate_ServerAddr});
  IniGameConf.WriteInteger('SelGate', 'ServerPort', g_nDBServer_Config_GatePort {g_nSelGate_ServerPort});
  IniGameConf.WriteString('SelGate', 'GateAddr', sGateAddr);
  IniGameConf.WriteInteger('SelGate', 'GatePort', nGatePort);

  IniGameConf.Free;
end;

procedure TfrmMain.GenRunGateConfig;
var
  IniGameConf: Tinifile;
  sIniFile: string;
begin
  sIniFile := g_sGameDirectory + g_sRunGate_Directory;
  if not DirectoryExists(sIniFile) then begin
    CreateDir(sIniFile);
  end;
  IniGameConf := Tinifile.Create(sIniFile + g_sRunGate_ConfigFile);
  IniGameConf.WriteString('GameGate', 'Title', g_sGameName);
  IniGameConf.WriteString('GameGate', 'ServerAddr', g_sExtIPaddr{g_sRunGate_ServerAddr});
  IniGameConf.WriteInteger('GameGate', 'ServerPort', g_nM2Server_GatePort {g_nRunGate_ServerPort});
  IniGameConf.WriteString('GameGate', 'GateAddr', g_sRunGate_GateAddr);
  IniGameConf.WriteInteger('GameGate', 'GatePort', g_RunGateInfo[0].nGatePort);

  IniGameConf.Free;
end;

procedure TfrmMain.RefGameConsole;
begin
  m_boOpen := False;
  EditLoginSrvProgram.Text := g_sGameDirectory + g_sLoginServer_Directory + g_sLoginServer_ProgramFile;
  EditLogServerProgram.Text := g_sGameDirectory + g_sLogServer_Directory + g_sLogServer_ProgramFile;
  EditLoginGateProgram.Text := g_sGameDirectory + g_sLoginGate_Directory + g_sLoginGate_ProgramFile;
  EditSelGateProgram.Text := g_sGameDirectory + g_sSelGate_Directory + g_sSelGate_ProgramFile;
  EditRunGateProgram.Text := g_sGameDirectory + g_sRunGate_Directory + g_sRunGate_ProgramFile;
  EditRunGate1Program.Text := g_sGameDirectory + g_sRunGate_Directory + g_sRunGate_ProgramFile;
  EditRunGate2Program.Text := g_sGameDirectory + g_sRunGate_Directory + g_sRunGate_ProgramFile;

  CheckBoxM2Server.Checked := g_boM2Server_GetStart;
  CheckBoxM2Server.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sM2Server_Directory, g_sM2Server_ProgramFile]);

  CheckBoxDBServer.Checked := g_boDBServer_GetStart;
  CheckBoxDBServer.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sDBServer_Directory, g_sDBServer_ProgramFile]);

  CheckBoxLoginServer.Checked := g_boLoginServer_GetStart;
  CheckBoxLoginServer.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sLoginServer_Directory, g_sLoginServer_ProgramFile]);

  CheckBoxLogServer.Checked := g_boLogServer_GetStart;
  CheckBoxLogServer.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sLogServer_Directory, g_sLogServer_ProgramFile]);

  CheckBoxLoginGate.Checked := g_boLoginGate_GetStart;
  CheckBoxLoginGate.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sLoginGate_Directory, g_sLoginGate_ProgramFile]);

  CheckBoxSelGate.Checked := g_boSelGate_GetStart;
  CheckBoxSelGate.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sSelGate_Directory, g_sSelGate_ProgramFile]);

  CheckBoxRunGate.Checked := g_RunGateInfo[0].boGetStart;
  CheckBoxRunGate.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sRunGate_Directory, g_sRunGate_ProgramFile]);

  chkRanking.Checked := g_boRanking_GetStart;
  chkRanking.Hint := Format('Program location: %s%s%s', [g_sGameDirectory, g_sRanking_Directory, g_sRanking_ProgramFile]);

  EditGameDir.Text := g_sGameDirectory;

  EditGameName.Text := g_sGameName;
  EditGameExtIPaddr.Text := g_sExtIPaddr;
  CheckBoxDynamicIPMode.Checked := g_boDynamicIPMode;
  EditGameExtIPaddr.Enabled := not g_boDynamicIPMode;

  EditLoginGate_MainFormX.Value := g_nLoginGate_MainFormX;
  EditLoginGate_MainFormY.Value := g_nLoginGate_MainFormY;
  CheckBoxboLoginGate_GetStart.Checked := g_boLoginGate_GetStart;
  EditLoginGate_GatePort.Text := IntToStr(g_nLoginGate_GatePort);

  EditSelGate_MainFormX.Value := g_nSelGate_MainFormX;
  EditSelGate_MainFormY.Value := g_nSelGate_MainFormY;
  CheckBoxboSelGate_GetStart.Checked := g_boSelGate_GetStart;
  EditSelGate_GatePort.Text := IntToStr(g_nSeLGate_GatePort);
  EditSelGate_GatePort1.Text := IntToStr(g_nSeLGate_GatePort1);

  EditRunGate_Connt.Value := g_nRunGate_Count;
  EditRunGate_GatePort1.Text := IntToStr(g_RunGateInfo[0].nGatePort);

  EditLoginServer_MainFormX.Value := g_nLoginServer_MainFormX;
  EditLoginServer_MainFormY.Value := g_nLoginServer_MainFormY;
  EditLoginServerGatePort.Text := IntToStr(g_nLoginServer_GatePort);
  EditLoginServerServerPort.Text := IntToStr(g_nLoginServer_ServerPort);
  CheckBoxboLoginServer_GetStart.Checked := g_boLoginServer_GetStart;

  EditDBServer_MainFormX.Value := g_nDBServer_MainFormX;
  EditDBServer_MainFormY.Value := g_nDBServer_MainFormY;
  EditDBServerGatePort.Text := IntToStr(g_nDBServer_Config_GatePort);
  EditDBServerServerPort.Text := IntToStr(g_nDBServer_Config_ServerPort);


  CheckBoxDisableAutoGame.Checked := g_boDBServer_DisableAutoGame;
  CheckBoxDBServerGetStart.Checked := g_boDBServer_GetStart;

  EditLogServer_MainFormX.Value := g_nLogServer_MainFormX;
  EditLogServer_MainFormY.Value := g_nLogServer_MainFormY;
  EditLogServerPort.Text := IntToStr(g_nLogServer_Port);
  CheckBoxLogServerGetStart.Checked := g_boLogServer_GetStart;

  EditM2Server_MainFormX.Value := g_nM2Server_MainFormX;
  EditM2Server_MainFormY.Value := g_nM2Server_MainFormY;
  EditM2Server_TestLevel.Value := g_nM2Server_TestLevel;
  EditM2Server_TestGold.Value := g_nM2Server_TestGold;
  EditM2ServerGatePort.Text := IntToStr(g_nM2Server_GatePort);
  EditM2ServerMsgSrvPort.Text := IntToStr(g_nM2Server_MsgSrvPort);

  CheckBoxM2ServerGetStart.Checked := g_boM2Server_GetStart;


  CheckBoxAutoStartServer.Checked := g_boAutoStartServer;
  EditAutoStartDelayTime.Value := g_nAutoStartDelayTime;
  TimerAutoStartServer.Enabled := g_boAutoStartServer;
  m_boOpen := True;
end;

procedure TfrmMain.CheckBoxDBServerClick(Sender: TObject);
begin
  g_boDBServer_GetStart := CheckBoxDBServer.Checked;
end;

procedure TfrmMain.CheckBoxLoginServerClick(Sender: TObject);
begin
  g_boLoginServer_GetStart := CheckBoxLoginServer.Checked;
end;

procedure TfrmMain.CheckBoxM2ServerClick(Sender: TObject);
begin
  g_boM2Server_GetStart := CheckBoxM2Server.Checked;
end;

procedure TfrmMain.CheckBoxLogServerClick(Sender: TObject);
begin
  g_boLogServer_GetStart := CheckBoxLogServer.Checked;
end;

procedure TfrmMain.CheckBoxLoginGateClick(Sender: TObject);
begin
  g_boLoginGate_GetStart := CheckBoxLoginGate.Checked;
end;

procedure TfrmMain.CheckBoxSelGateClick(Sender: TObject);
begin
  g_boSelGate_GetStart := CheckBoxSelGate.Checked;
end;

procedure TfrmMain.CheckBoxRunGateClick(Sender: TObject);
begin
  if Sender = CheckBoxRunGate then begin
    g_RunGateInfo[0].boGetStart := CheckBoxRunGate.Checked;
  end;
end;

procedure TfrmMain.ButtonStartGameClick(Sender: TObject);
begin
  SetWindowPos(Self.Handle, Self.Handle, Self.Left, Self.Top, Self.Width, Self.Height, $40);
  case m_nStartStatus of
    0: begin
        if Application.MessageBox('서버를 시작하시겠습니까?', '서버시작', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          StartGame();
        end;
      end;
    1: begin
        if Application.MessageBox('서버를 재시작 하시겠습니까?', '서버재시작', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          TimerStartGame.Enabled := False;
          m_nStartStatus := 2;
          ButtonStartGame.Caption := g_sButtonStopGame;
        end;
      end;
    2: begin
        if Application.MessageBox('서버를 종료하시겠습니까?', '서버정료', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          StopGame();
        end;
      end;
    3: begin
        if Application.MessageBox('서버를 재시작 하시겠습니까?', '서버재시작', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
          TimerStopGame.Enabled := False;
          m_nStartStatus := 2;
          ButtonStartGame.Caption := g_sButtonStopGame;
        end;
      end;
  end;
  {
  if CreateProcess(nil,
                   PChar(sProgamFile),
                   nil,
                   nil,
                   False,
                   IDLE_PRIORITY_CLASS,
                   nil,
                   nil,
                   StartUpInfo,
                   ProcessInfo) then begin
  }
end;

procedure TfrmMain.StartGame;
var
  I: Integer;
begin
  FillChar(DBServer, SizeOf(TProgram), #0);
  DBServer.boGetStart := g_boDBServer_GetStart;
  DBServer.boReStart := True;
  DBServer.sDirectory := g_sGameDirectory + g_sDBServer_Directory;
  DBServer.sProgramFile := g_sDBServer_ProgramFile;
  DBServer.nMainFormX := g_nDBServer_MainFormX;
  DBServer.nMainFormY := g_nDBServer_MainFormY;

  FillChar(LoginServer, SizeOf(TProgram), #0);
  LoginServer.boGetStart := g_boLoginServer_GetStart;
  LoginServer.boReStart := True;
  LoginServer.sDirectory := g_sGameDirectory + g_sLoginServer_Directory;
  LoginServer.sProgramFile := g_sLoginServer_ProgramFile;
  LoginServer.nMainFormX := g_nLoginServer_MainFormX;
  LoginServer.nMainFormY := g_nLoginServer_MainFormY;

  FillChar(LogServer, SizeOf(TProgram), #0);
  LogServer.boGetStart := g_boLogServer_GetStart;
  LogServer.boReStart := True;
  LogServer.sDirectory := g_sGameDirectory + g_sLogServer_Directory;
  LogServer.sProgramFile := g_sLogServer_ProgramFile;
  LogServer.nMainFormX := g_nLogServer_MainFormX;
  LogServer.nMainFormY := g_nLogServer_MainFormY;

  FillChar(M2Server, SizeOf(TProgram), #0);
  M2Server.boGetStart := g_boM2Server_GetStart;
  M2Server.boReStart := True;
  M2Server.sDirectory := g_sGameDirectory + g_sM2Server_Directory;
  M2Server.sProgramFile := g_sM2Server_ProgramFile;
  M2Server.nMainFormX := g_nM2Server_MainFormX;
  M2Server.nMainFormY := g_nM2Server_MainFormY;

  FillChar(RunGate, SizeOf(RunGate), #0);
  for I := Low(RunGate) to High(RunGate) do begin
    RunGate[I].btStartStatus := 0;
    RunGate[I].boGetStart := g_RunGateInfo[I].boGetStart;
    RunGate[I].boReStart := True;
    RunGate[I].sDirectory := g_sGameDirectory + g_sRunGate_Directory;
    RunGate[I].sProgramFile := g_sRunGate_ProgramFile;
  end;

  FillChar(SelGate, SizeOf(TProgram), #0);
  SelGate.boGetStart := g_boSelGate_GetStart;
  SelGate.boReStart := True;
  SelGate.sDirectory := g_sGameDirectory + g_sSelGate_Directory;
  SelGate.sProgramFile := g_sSelGate_ProgramFile;
  SelGate.nMainFormX := g_nSelGate_MainFormX;
  SelGate.nMainFormY := g_nSelGate_MainFormY;

  FillChar(LoginGate, SizeOf(TProgram), #0);
  LoginGate.boGetStart := g_boLoginGate_GetStart;
  LoginGate.boReStart := True;
  LoginGate.sDirectory := g_sGameDirectory + g_sLoginGate_Directory;
  LoginGate.sProgramFile := g_sLoginGate_ProgramFile;
  LoginGate.nMainFormX := g_nLoginGate_MainFormX;
  LoginGate.nMainFormY := g_nLoginGate_MainFormY;

  FillChar(Ranking, SizeOf(TProgram), #0);
  Ranking.boGetStart := g_boRanking_GetStart;
  Ranking.boReStart := True;
  Ranking.sDirectory := g_sGameDirectory + g_sRanking_Directory;
  Ranking.sProgramFile := g_sRanking_ProgramFile;
  Ranking.nMainFormX := g_nRanking_MainFormX;
  Ranking.nMainFormY := g_nRanking_MainFormY;


  ButtonStartGame.Caption := g_sButtonStopStartGame;
  m_nStartStatus := 1;
  TimerStartGame.Enabled := True;
end;

procedure TfrmMain.StopGame;
begin
  ButtonStartGame.Caption := g_sButtonStopStopGame;
  MainOutMessage('서버종료 시작');
  TimerCheckRun.Enabled := False;
  TimerStopGame.Enabled := True;
  m_nStartStatus := 3;
end;

procedure TfrmMain.TimerStartGameTimer(Sender: TObject);
  function GetStartRunGate: Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(RunGate) to High(RunGate) do begin
      if RunGate[I].boGetStart and (RunGate[I].btStartStatus = 1) then begin
        Result := True;
        Break;
      end;
    end;
  end;
var
  nRetCode: Integer;
  I: Integer;
  boStartRunGateOK: Boolean;
begin
  if DBServer.boGetStart then begin
    case DBServer.btStartStatus of
      0: begin
          nRetCode := RunProgram(DBServer, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            DBServer.btStartStatus := 1;
            DBServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, DBServer.ProcessInfo.dwProcessId);
          end else begin
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        DBServer.btStartStatus:=2;
          Exit;
        end;
    end;
  end;
  if LoginServer.boGetStart then begin
    case LoginServer.btStartStatus of //
      0: begin
          nRetCode := RunProgram(LoginServer, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            LoginServer.btStartStatus := 1;
            LoginServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginServer.ProcessInfo.dwProcessId);
          end else begin
            LoginServer.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        LoginServer.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  if LogServer.boGetStart then begin
    case LogServer.btStartStatus of //
      0: begin
          nRetCode := RunProgram(LogServer, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            LogServer.btStartStatus := 1;
            LogServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LogServer.ProcessInfo.dwProcessId);
          end else begin
            LogServer.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        LogServer.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  if M2Server.boGetStart then begin
    case M2Server.btStartStatus of //
      0: begin
          nRetCode := RunProgram(M2Server, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            M2Server.btStartStatus := 1;
            M2Server.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, M2Server.ProcessInfo.dwProcessId);
          end else begin
            M2Server.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        M2Server.btStartStatus:=2;
          Exit;
        end;
      2: begin //Status: Booting Complete
          if not g_boGetM2ServerVersion then begin
            g_boGetM2ServerVersion := True;
            SendProgramMsg(M2Server.MainFormHandle, GS_GETM2SERVERVERSION, IntToStr(Self.Handle));
          end;
        end;
    end;

  end;

  if GetStartRunGate then Exit; //Waiting for gate to start
  boStartRunGateOK := True;
  for I := Low(RunGate) to High(RunGate) do begin
    if RunGate[I].boGetStart then begin
      if RunGate[I].btStartStatus = 0 then begin
        GetMutRunGateConfing(I);
        nRetCode := RunProgram(RunGate[I], IntToStr(Self.Handle), 2000);
        if nRetCode = 0 then begin
          RunGate[I].btStartStatus := 1;
          RunGate[I].ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, RunGate[I].ProcessInfo.dwProcessId);
        end else begin
          RunGate[I].btStartStatus := 9;
        end;
        boStartRunGateOK := False;
        Break;
      end;
    end;
  end;
  if not boStartRunGateOK then Exit;

  if SelGate.boGetStart then begin
    case SelGate.btStartStatus of //
      0: begin
          GenMutSelGateConfig(0);
          nRetCode := RunProgram(SelGate, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            SelGate.btStartStatus := 1;
            SelGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, SelGate.ProcessInfo.dwProcessId);
          end else begin
            SelGate.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        SelGate.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  if SelGate1.boGetStart then begin
    case SelGate1.btStartStatus of //
      0: begin
          GenMutSelGateConfig(1);
          nRetCode := RunProgram(SelGate1, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            SelGate1.btStartStatus := 1;
            SelGate1.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, SelGate1.ProcessInfo.dwProcessId);
          end else begin
            SelGate1.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        SelGate1.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  if LoginGate.boGetStart then begin
    case LoginGate.btStartStatus of //
      0: begin
          nRetCode := RunProgram(LoginGate, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            LoginGate.btStartStatus := 1;
            LoginGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginGate.ProcessInfo.dwProcessId);
          end else begin
            LoginGate.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        LoginGate.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  if Ranking.boGetStart then begin
    case Ranking.btStartStatus of //
      0: begin
          nRetCode := RunProgram(Ranking, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            Ranking.btStartStatus := 1;
            Ranking.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, Ranking.ProcessInfo.dwProcessId);
          end else begin
            Ranking.btStartStatus := 9;
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          //        LogServer.btStartStatus:=2;
          Exit;
        end;
    end;
  end;

  TimerStartGame.Enabled := False;
  TimerCheckRun.Enabled := True;
  ButtonStartGame.Caption := g_sButtonStopGame;
  //  ButtonStartGame.Enabled:=True;
  m_nStartStatus := 2;
  //  SetWindowPos(Self.Handle,HWND_TOPMOST,Self.Left,Self.Top,Self.Width,Self.Height,$40);
end;

procedure TfrmMain.TimerStopGameTimer(Sender: TObject);
  function GetStopRunGate: Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := Low(RunGate) to High(RunGate) do begin
      if RunGate[I].btStartStatus in [2, 3] then begin
        Result := True;
        Break;
      end;
    end;
  end;
var
  dwExitCode: LongWord;
  I: Integer;
begin
  if LoginGate.boGetStart and (LoginGate.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(LoginGate.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if LoginGate.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(LoginGate, 0);
          MainOutMessage('LoginGate has been forced to stop');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(LoginGate.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      LoginGate.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(LoginGate.ProcessHandle);
      LoginGate.btStartStatus := 0;
      MainOutMessage('로그인게이트 종료');
    end;
  end;

  if SelGate.boGetStart and (SelGate.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(SelGate.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if SelGate.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(SelGate, 0);
          MainOutMessage('SelGate timeout. The gate has been forced to close');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(SelGate.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      SelGate.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(SelGate.ProcessHandle);
      SelGate.btStartStatus := 0;
      MainOutMessage('셀게이트 종료');
    end;
  end;

  for I := Low(RunGate) to High(RunGate) do begin
    if RunGate[I].boGetStart and (RunGate[I].btStartStatus in [2, 3]) then begin
      GetExitCodeProcess(RunGate[I].ProcessHandle, dwExitCode);
      if dwExitCode = STILL_ACTIVE then begin
        if RunGate[I].btStartStatus = 3 then begin
          if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
            StopProgram(RunGate[I], 0);
            case I of
              0: MainOutMessage('Run Gate 0 timeout. The gate has been forced to close...');
              1: MainOutMessage('Run Gate 1 timeout. The gate has been forced to close...');
              2: MainOutMessage('Run Gate 2 timeout. The gate has been forced to close...');
              3: MainOutMessage('Run Gate 3 timeout. The gate has been forced to close...');
              4: MainOutMessage('Run Gate 4 timeout. The gate has been forced to close...');
              5: MainOutMessage('Run Gate 5 timeout. The gate has been forced to close...');
              6: MainOutMessage('Run Gate 6 timeout. The gate has been forced to close...');
              7: MainOutMessage('Run Gate 7 timeout. The gate has been forced to close...');
            end;
          end;
          Break; //If no longer waiting then skip following code
        end;
        SendProgramMsg(RunGate[I].MainFormHandle, GS_QUIT, '');
        g_dwStopTick := GetTickCount();
        RunGate[I].btStartStatus := 3;
        Break;
      end else begin
        CloseHandle(RunGate[I].ProcessHandle);
        RunGate[I].btStartStatus := 0;
        case I of
          0: MainOutMessage('런게이트 종료');
          1: MainOutMessage('Run Gate 1 has stopped...');
          2: MainOutMessage('Run Gate 2 has stopped...');
          3: MainOutMessage('Run Gate 3 has stopped...');
          4: MainOutMessage('Run Gate 4 has stopped...');
          5: MainOutMessage('Run Gate 5 has stopped...');
          6: MainOutMessage('Run Gate 6 has stopped...');
          7: MainOutMessage('Run Gate 7 has stopped...');
        end;
        Break;
      end;
    end;
  end;

  if GetStopRunGate then Exit;

  if M2Server.boGetStart and (M2Server.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(M2Server.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if M2Server.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(M2Server, 1000);
          MainOutMessage('M2Server timeout');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(M2Server.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      M2Server.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(M2Server.ProcessHandle);
      M2Server.btStartStatus := 0;
      MainOutMessage('M2서버 종료');
    end;
  end;

  if LoginServer.boGetStart and (LoginServer.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(LoginServer.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if LoginServer.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(LoginServer, 1000);
          MainOutMessage('로그인서버 종료');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(LoginServer.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      LoginServer.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(LoginServer.ProcessHandle);
      LoginServer.btStartStatus := 0;
      MainOutMessage('로그인서버 종료');
    end;
  end;

  if LogServer.boGetStart and (LogServer.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(LogServer.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if LogServer.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(LogServer, 0);
          MainOutMessage('Log Server timeout');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(LogServer.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      LogServer.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(LogServer.ProcessHandle);
      LogServer.btStartStatus := 0;
      MainOutMessage('로그서버 종료');
    end;
  end;

  if DBServer.boGetStart and (DBServer.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(DBServer.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if DBServer.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(DBServer, 0);
          MainOutMessage('DBServer timeout');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(DBServer.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      DBServer.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(DBServer.ProcessHandle);
      DBServer.btStartStatus := 0;
      MainOutMessage('DB서버 종료');
    end;
  end;


  if Ranking.boGetStart and (Ranking.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(Ranking.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if Ranking.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(Ranking, 0);
          MainOutMessage('Rannkin timeout');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(Ranking.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      Ranking.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(Ranking.ProcessHandle);
      Ranking.btStartStatus := 0;
      MainOutMessage('랭킹 종료');
    end;
  end;

  TimerStopGame.Enabled := False;
  ButtonStartGame.Caption := g_sButtonStartGame;
  m_nStartStatus := 0;
end;

procedure TfrmMain.TimerCheckRunTimer(Sender: TObject);
var
  dwExitCode: LongWord;
  nRetCode: Integer;
  I: Integer;
begin
  if DBServer.boGetStart then begin
    GetExitCodeProcess(DBServer.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(DBServer, IntToStr(Self.Handle), 0);

      if nRetCode = 0 then begin
        CloseHandle(DBServer.ProcessHandle);
        DBServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, DBServer.ProcessInfo.dwProcessId);
        MainOutMessage('DBServer : 강제 종료되었습니다. 재시작 중...');
      end;
   { end else begin
      if IsHungAppWindow(DBServer.ProcessHandle) then begin
        StopProgram(DBServer, 0);
        CloseHandle(DBServer.ProcessHandle);
        DBServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, DBServer.ProcessInfo.dwProcessId);
        MainOutMessage('DBServer : 응답없음 상태로인하여 재시작 됩니다...');
      end; }
    end;
  end;

  if LoginServer.boGetStart then begin
    GetExitCodeProcess(LoginServer.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(LoginServer, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(LoginServer.ProcessHandle);
        LoginServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginServer.ProcessInfo.dwProcessId);
        MainOutMessage('LoginSrv : 강제 종료되었습니다. 재시작 중...');
      end;
    {end else begin
      if IsHungAppWindow(LoginServer.ProcessHandle) then begin
        StopProgram(LoginServer, 0);
        CloseHandle(LoginServer.ProcessHandle);
        LoginServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginServer.ProcessInfo.dwProcessId);
        MainOutMessage('LoginSrv : 응답없음 상태로인하여 재시작 됩니다...');
      end;  }
    end;
  end;

  if LogServer.boGetStart then begin
    GetExitCodeProcess(LogServer.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(LogServer, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(LogServer.ProcessHandle);
        LogServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LogServer.ProcessInfo.dwProcessId);
        MainOutMessage('Log server : 강제 종료되었습니다. 재시작 중...');
      end;
    {end else begin
      if IsHungAppWindow(LogServer.ProcessHandle) then begin
        StopProgram(LogServer, 0);
        CloseHandle(LogServer.ProcessHandle);
        LogServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LogServer.ProcessInfo.dwProcessId);
        MainOutMessage('Log server : 응답없음 상태로인하여 재시작 됩니다...');
      end;  }
    end;
  end;

  if M2Server.boGetStart then begin
    GetExitCodeProcess(M2Server.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(M2Server, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(M2Server.ProcessHandle);
        M2Server.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, M2Server.ProcessInfo.dwProcessId);
        MainOutMessage('M2Server : 강제 종료되었습니다. 재시작 중...');
      end;
    {end else begin
      if IsHungAppWindow(M2Server.ProcessHandle) then begin
        StopProgram(M2Server, 0);
        CloseHandle(M2Server.ProcessHandle);
        M2Server.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, M2Server.ProcessInfo.dwProcessId);
        MainOutMessage('M2Server : 응답없음 상태로인하여 재시작 됩니다...');
      end; }
    end;
  end;

  for I := Low(RunGate) to High(RunGate) do begin
    if RunGate[I].boGetStart then begin
      GetExitCodeProcess(RunGate[I].ProcessHandle, dwExitCode);
      if dwExitCode <> STILL_ACTIVE then begin
        RunGate[I].MainFormHandle := 0;
        GetMutRunGateConfing(I);
        nRetCode := RunProgram(RunGate[I], IntToStr(Self.Handle), 2000);
        if nRetCode = 0 then begin
          CloseHandle(RunGate[I].ProcessHandle);
          RunGate[I].ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, RunGate[I].ProcessInfo.dwProcessId);
          //RunGate[I].btStartStatus:=3;
          case I of
            0: MainOutMessage('RunGate : 강제 종료되었습니다. 재시작 중...');
            1: MainOutMessage('Run Gate 1 was abnormally shut down and has been restarted...');
            2: MainOutMessage('Run Gate 2 was abnormally shut down and has been restarted...');
            4: MainOutMessage('Run Gate 4 was abnormally shut down and has been restarted...');
            3: MainOutMessage('Run Gate 3 was abnormally shut down and has been restarted...');
            5: MainOutMessage('Run Gate 5 was abnormally shut down and has been restarted...');
            6: MainOutMessage('Run Gate 6 was abnormally shut down and has been restarted...');
            7: MainOutMessage('Run Gate 7 was abnormally shut down and has been restarted...');
          end;
        end;
        Break;
      {end else begin
        if IsHungAppWindow(RunGate[I].ProcessHandle) then begin
          RunGate[I].MainFormHandle := 0;
          GetMutRunGateConfing(I);
          StopProgram(RunGate[I], 0);
          CloseHandle(RunGate[I].ProcessHandle);
          RunGate[I].ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, RunGate[I].ProcessInfo.dwProcessId);
          case I of
            0: MainOutMessage('RunGate : 응답없음 상태로인하여 재시작 됩니다...');
            1: MainOutMessage('Run Gate 1 was abnormally shut down and has been restarted...');
            2: MainOutMessage('Run Gate 2 was abnormally shut down and has been restarted...');
            4: MainOutMessage('Run Gate 4 was abnormally shut down and has been restarted...');
            3: MainOutMessage('Run Gate 3 was abnormally shut down and has been restarted...');
            5: MainOutMessage('Run Gate 5 was abnormally shut down and has been restarted...');
            6: MainOutMessage('Run Gate 6 was abnormally shut down and has been restarted...');
            7: MainOutMessage('Run Gate 7 was abnormally shut down and has been restarted...');
          end;
          Break;
        end;   }
      end;
    end;
  end;

  if SelGate.boGetStart then begin
    GetExitCodeProcess(SelGate.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(SelGate, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(SelGate.ProcessHandle);
        SelGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, SelGate.ProcessInfo.dwProcessId);
        MainOutMessage('SelGate : 강제 종료되었습니다. 재시작 중...');
      end;
    {end else begin
      if IsHungAppWindow(SelGate.ProcessHandle) then begin
        StopProgram(SelGate, 0);
        CloseHandle(SelGate.ProcessHandle);
        SelGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, SelGate.ProcessInfo.dwProcessId);
        MainOutMessage('SelGate : 응답없음 상태로인하여 재시작 됩니다...');
      end;  }
    end;
  end;

  if LoginGate.boGetStart then begin
    GetExitCodeProcess(LoginGate.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(LoginGate, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(LoginGate.ProcessHandle);
        LoginGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginGate.ProcessInfo.dwProcessId);
        MainOutMessage('LoginGate : 강제 종료되었습니다. 재시작 중...');
      end;
    {end else begin
      if IsHungAppWindow(LoginGate.ProcessHandle) then begin
        StopProgram(LoginGate, 0);
        CloseHandle(LoginGate.ProcessHandle);
        LoginGate.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, LoginGate.ProcessInfo.dwProcessId);
        MainOutMessage('LoginGate : 응답없음 상태로인하여 재시작 됩니다...');
      end; }
    end;
  end;

  if Ranking.boGetStart then begin
    GetExitCodeProcess(Ranking.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      nRetCode := RunProgram(Ranking, IntToStr(Self.Handle), 0);
      if nRetCode = 0 then begin
        CloseHandle(Ranking.ProcessHandle);
        Ranking.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, Ranking.ProcessInfo.dwProcessId);
        MainOutMessage('Ranking : 강제 종료되었습니다. 재시작 중...');
      end;
    end;
  end;
end;

procedure TfrmMain.ProcessMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.message = WM_SENDPROCMSG then begin
    //    ShowMessage('asfd');
    Handled := True;
  end;
end;

procedure TfrmMain.MyMessage(var MsgData: TWmCopyData);
var
  sData: string;
  wIdent, wRecog: Word;
begin
  wIdent := HiWord(MsgData.From);
  wRecog := LoWord(MsgData.From);
  //ProgramType:=TProgamType(LoWord(MsgData.From));
  sData := StrPas(MsgData.CopyDataStruct^.lpData);
  case TProgamType(wRecog) of //
    tDBServer: ProcessDBServerMsg(wIdent, sData);
    tLoginSrv: ProcessLoginSrvMsg(wIdent, sData);
    tLogServer: ProcessLogServerMsg(wIdent, sData);
    tM2Server: ProcessM2ServerMsg(wIdent, sData);
    tLoginGate: ProcessLoginGateMsg(wIdent, sData);
    tLoginGate1: ProcessLoginGate1Msg(wIdent, sData);
    tSelGate: ProcessSelGateMsg(wIdent, sData);
    tSelGate1: ProcessSelGate1Msg(wIdent, sData);
    tRunGate: ProcessRunGateMsg(wIdent, sData);
    tRanking: ProcessRankingMsg(wIdent, sData);
  end;
end;

procedure TfrmMain.ProcessDBServerMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          DBServer.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        DBServer.btStartStatus := 2;
        MainOutMessage(sData);
      end;
    SG_CHECKCODEADDR: begin
        g_dwDBCheckCodeAddr := Str_ToInt(sData, -1);
      end;
    3: ;
  end;
end;

procedure TfrmMain.ProcessLoginGateMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          LoginGate.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        LoginGate.btStartStatus := 2;
        MainOutMessage(sData);
      end;
    2: ;
    3: ;
  end;
end;

procedure TfrmMain.ProcessLoginGate1Msg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          LoginGate1.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        LoginGate1.btStartStatus := 2;
        MainOutMessage(sData);
      end;
    1: ;
    2: ;
    3: ;
  end;
end;

procedure TfrmMain.ProcessSelGateMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          SelGate.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        if SelGate.btStartStatus <> 2 then begin
          SelGate.btStartStatus := 2;
        end else begin
          SelGate1.btStartStatus := 2;
        end;
        MainOutMessage(sData);
      end;
  end;
end;

procedure TfrmMain.ProcessSelGate1Msg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          SelGate1.MainFormHandle := Handle;
        end;
      end;
    1: ;
    2: ;
    3: ;
  end;
end;

procedure TfrmMain.ProcessM2ServerMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
  sServerVersion: string;
  sUpDateVersion: string;
  dwExitCode: LongWord;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          M2Server.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        M2Server.btStartStatus := 2;
        MainOutMessage(sData);
      end;
    SG_CHECKCODEADDR: begin
        g_dwM2CheckCodeAddr := Str_ToInt(sData, -1);
      end;
    SG_GETM2SERVERVERSION: begin
        sData := GetValidStr3(sData, sServerVersion, ['/']);
        sData := GetValidStr3(sData, sUpDateVersion, ['/']);
        g_nServerVersion := Str_ToInt(sServerVersion, -1);
        g_nUpDateVersion := Str_ToInt(sUpDateVersion, -1);
        TimerUpDate.Enabled := True;
      end;
    SG_DBSAVEOUT: begin     //DBSERVER 강제종료 디비서버 강제종료
        if DBServer.boGetStart and (DBServer.btStartStatus in [2, 3]) then begin
          MainOutMessage(sData);
          StopProgram(DBServer, 0);
          CloseHandle(DBServer.ProcessHandle);
          DBServer.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, DBServer.ProcessInfo.dwProcessId);
          MainOutMessage('DB서버 강제 종료');
        end;
      end;
  end;
end;

procedure TfrmMain.ProcessLoginSrvMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          LoginServer.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        LoginServer.btStartStatus := 2;
        MainOutMessage(sData);
      end;
    SG_USERACCOUNT: begin
        ProcessLoginSrvGetUserAccount(sData);
      end;
    SG_USERACCOUNTCHANGESTATUS: begin
        ProcessLoginSrvChangeUserAccountStatus(sData);
      end;
  end;
end;

procedure TfrmMain.ProcessLogServerMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          LogServer.MainFormHandle := Handle;
          //        SetWindowPos(Self.Handle,Handle,Self.Left,Self.Top,Self.Width,Self.Height,$40);
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        LogServer.btStartStatus := 2;
        MainOutMessage(sData);
      end;
  end;
end;

procedure TfrmMain.ProcessRankingMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          Ranking.MainFormHandle := Handle;
        end;
      end;
    SG_STARTNOW: begin
        MainOutMessage(sData);
      end;
    SG_STARTOK: begin
        Ranking.btStartStatus := 2;
        MainOutMessage(sData);
      end;
  end;
end;

procedure TfrmMain.ProcessRunGateMsg(wIdent: Word; sData: string);
var
  Handle: THandle;
  I: Integer;
begin
  Handle := Str_ToInt(sData, 0);
  if Handle <> 0 then begin
    case wIdent of
      SG_FORMHANDLE: begin
          for I := Low(RunGate) to High(RunGate) do begin
            if RunGate[I].boGetStart and (RunGate[I].MainFormHandle = 0) then begin
              RunGate[I].MainFormHandle := Handle;
              Break;
            end;
          end;
        end;
      SG_STARTNOW: begin
          for I := Low(RunGate) to High(RunGate) do begin
            if RunGate[I].MainFormHandle = Handle then begin
              case I of
                0: MainOutMessage('런게이트 시작중');
                1: MainOutMessage('Run Gate 1 Starting...');
                2: MainOutMessage('Run Gate 2 Starting...');
                3: MainOutMessage('Run Gate 3 Starting...');
                4: MainOutMessage('Run Gate 4 Starting...');
                5: MainOutMessage('Run Gate 5 Starting...');
                6: MainOutMessage('Run Gate 6 Starting...');
                7: MainOutMessage('Run Gate 7 Starting...');
              end;
              Break;
            end;
          end;
        end;
      SG_STARTOK: begin
          for I := Low(RunGate) to High(RunGate) do begin
            if RunGate[I].MainFormHandle = Handle then begin
              RunGate[I].btStartStatus := 2;
              case I of
                0: MainOutMessage('런게이트 시작완료');
                1: MainOutMessage('Run Gate 1 Started...');
                2: MainOutMessage('Run Gate 2 Started...');
                3: MainOutMessage('Run Gate 3 Started...');
                4: MainOutMessage('Run Gate 4 Started...');
                5: MainOutMessage('Run Gate 5 Started...');
                6: MainOutMessage('Run Gate 6 Started...');
                7: MainOutMessage('Run Gate 7 Started...');
              end;
              Break;
            end;
          end;
        end;
    end;
  end;
end;

procedure TfrmMain.ButtonReLoadConfigClick(Sender: TObject);
begin
  LoadConfig();
  RefGameConsole();
  Application.MessageBox('Configuration file reloaded.', 'Message', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmMain.EditLoginGate_MainFormXChange(Sender: TObject);
begin
  if EditLoginGate_MainFormX.Text = '' then begin
    EditLoginGate_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLoginGate_MainFormX := EditLoginGate_MainFormX.Value;
end;

procedure TfrmMain.EditLoginGate_MainFormYChange(Sender: TObject);
begin
  if EditLoginGate_MainFormY.Text = '' then begin
    EditLoginGate_MainFormY.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLoginGate_MainFormY := EditLoginGate_MainFormY.Value;
end;

procedure TfrmMain.CheckBoxboLoginGate_GetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boLoginGate_GetStart := CheckBoxboLoginGate_GetStart.Checked;
end;

procedure TfrmMain.EditSelGate_MainFormXChange(Sender: TObject);
begin
  if EditSelGate_MainFormX.Text = '' then begin
    EditSelGate_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nSelGate_MainFormX := EditSelGate_MainFormX.Value;
end;

procedure TfrmMain.EditSelGate_MainFormYChange(Sender: TObject);
begin
  if EditSelGate_MainFormY.Text = '' then begin
    EditSelGate_MainFormY.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nSelGate_MainFormY := EditSelGate_MainFormY.Value;
end;

procedure TfrmMain.CheckBoxboSelGate_GetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boSelGate_GetStart := CheckBoxboSelGate_GetStart.Checked;
end;

procedure TfrmMain.EditLoginServer_MainFormXChange(Sender: TObject);
begin
  if EditLoginServer_MainFormX.Text = '' then begin
    EditLoginServer_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLoginServer_MainFormX := EditLoginServer_MainFormX.Value;
end;

procedure TfrmMain.EditLoginServer_MainFormYChange(Sender: TObject);
begin
  if EditLoginServer_MainFormY.Text = '' then begin
    EditLoginServer_MainFormY.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLoginServer_MainFormY := EditLoginServer_MainFormY.Value;
end;

procedure TfrmMain.CheckBoxboLoginServer_GetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boLoginServer_GetStart := CheckBoxboLoginServer_GetStart.Checked;
end;

procedure TfrmMain.EditDBServer_MainFormXChange(Sender: TObject);
begin
  if EditDBServer_MainFormX.Text = '' then begin
    EditDBServer_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nDBServer_MainFormX := EditDBServer_MainFormX.Value;
end;

procedure TfrmMain.EditDBServer_MainFormYChange(Sender: TObject);
begin
  if EditDBServer_MainFormY.Text = '' then begin
    EditDBServer_MainFormY.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nDBServer_MainFormY := EditDBServer_MainFormY.Value;
end;

procedure TfrmMain.CheckBoxDisableAutoGameClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boDBServer_DisableAutoGame := CheckBoxDisableAutoGame.Checked;
end;


procedure TfrmMain.CheckBoxDBServerGetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boDBServer_GetStart := CheckBoxDBServerGetStart.Checked;
end;

procedure TfrmMain.EditLogServer_MainFormXChange(Sender: TObject);
begin
  if EditLogServer_MainFormX.Text = '' then begin
    EditLogServer_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLogServer_MainFormX := EditLogServer_MainFormX.Value;
end;

procedure TfrmMain.EditLogServer_MainFormYChange(Sender: TObject);
begin
  if EditLogServer_MainFormY.Text = '' then begin
    EditLogServer_MainFormY.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nLogServer_MainFormY := EditLogServer_MainFormY.Value;
end;

procedure TfrmMain.CheckBoxLogServerGetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boLogServer_GetStart := CheckBoxLogServerGetStart.Checked;
end;

procedure TfrmMain.EditM2Server_MainFormXChange(Sender: TObject);
begin
  if EditM2Server_MainFormX.Text = '' then begin
    EditM2Server_MainFormX.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nM2Server_MainFormX := EditM2Server_MainFormX.Value;
end;

procedure TfrmMain.EditM2Server_MainFormYChange(Sender: TObject);
begin
  if EditM2Server_TestLevel.Text = '' then begin
    EditM2Server_TestLevel.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nM2Server_TestLevel := EditM2Server_TestLevel.Value;
end;

procedure TfrmMain.EditM2Server_TestLevelChange(Sender: TObject);
begin
  if EditM2Server_TestLevel.Text = '' then begin
    EditM2Server_TestLevel.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nM2Server_TestLevel := EditM2Server_TestLevel.Value;
end;

procedure TfrmMain.EditM2Server_TestGoldChange(Sender: TObject);
begin
  if EditM2Server_TestGold.Text = '' then begin
    EditM2Server_TestGold.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nM2Server_TestGold := EditM2Server_TestGold.Value;
end;

procedure TfrmMain.CheckBoxM2ServerGetStartClick(Sender: TObject);
begin
  if not m_boOpen then Exit;
  g_boM2Server_GetStart := CheckBoxM2ServerGetStart.Checked;
end;

procedure TfrmMain.MemoLogChange(Sender: TObject);
begin
  if MemoLog.Lines.Count > 100 then
    MemoLog.Clear;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if m_nStartStatus = 2 then begin
    if Application.MessageBox('서버가 실행중입니다. 서버를 종료하시겠습니까?', '서버종료', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
      ButtonStartGameClick(ButtonStartGame);
    end;
    CanClose := False;
    Exit;
  end;

  if Application.MessageBox('종료하시겠습니까?', '종료', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    CanClose := True;
  end else begin
    CanClose := False;
  end;

  if g_BackUpManager <> nil then begin
    try
      g_BackUpManager.Free;
    except
    end;
  end;
end;

procedure TfrmMain.GetMutRunGateConfing(nIndex: Integer);
var
  IniGameConf: Tinifile;
  sIniFile: string;
begin
  if (nIndex >= 0) and (nIndex < MAXRUNGATECOUNT) then begin
    sIniFile := g_sGameDirectory + g_sRunGate_Directory;
    if not DirectoryExists(sIniFile) then begin
      CreateDir(sIniFile);
    end;
    IniGameConf := Tinifile.Create(sIniFile + g_sRunGate_ConfigFile);
    IniGameConf.WriteString('GameGate', 'Title', g_sGameName);
    IniGameConf.WriteString('GameGate', 'GateAddr', g_RunGateInfo[nIndex].sGateAddr);
    IniGameConf.WriteInteger('GameGate', 'GatePort', g_RunGateInfo[nIndex].nGatePort);
    IniGameConf.Free;
  end;
end;

procedure TfrmMain.EditRunGate_ConntChange(Sender: TObject);
begin
  if EditRunGate_Connt.Text = '' then begin
    EditRunGate_Connt.Text := '0';
  end;
  if not m_boOpen then Exit;
  g_nRunGate_Count := EditRunGate_Connt.Value;
  g_RunGateInfo[0].boGetStart := g_nRunGate_Count >= 1;
  if g_RunGateInfo[4].boGetStart then begin
    g_sDBServer_Config_GateAddr := g_sAllIPaddr;
  end else begin
    g_sDBServer_Config_GateAddr := g_sLocalIPaddr;
  end;
  RefGameConsole();
end;

procedure TfrmMain.ButtonLoginServerConfigClick(Sender: TObject);
begin
  frmLoginServerConfig.Open;
end;

procedure TfrmMain.CheckBoxDynamicIPModeClick(Sender: TObject);
begin
  EditGameExtIPaddr.Enabled := not CheckBoxDynamicIPMode.Checked;
end;

function TfrmMain.StartService: Boolean;
begin
  Result := False;
  MainOutMessage('게임센터 시작');
  g_SessionList := TStringList.Create;

  g_nClientForm := g_IniConf.ReadInteger('Client', 'ClientForm', g_nClientForm);
  g_nServerPort := g_IniConf.ReadInteger('Client', 'ServerPort', g_nServerPort);
  g_sServerAddr := g_IniConf.ReadString('Client', 'ServerAddr', g_sServerAddr);

  g_sServerAddr := g_IniConf.ReadString('Client', 'ServerAddr', g_sServerAddr);
  g_nServerPort := g_IniConf.ReadInteger('Client', 'ServerPort', g_nServerPort);

  try
    ServerSocket.Address := g_sServerAddr;
    ServerSocket.Port := g_nServerPort;
    ServerSocket.Active := True;
    m_dwShowTick := GetTickCount();
    Timer.Enabled := True;
  except
    on e: ESocketError do begin
      MainOutMessage(Format('Port %d is in use, please ensure you are only running one copy of the GameCenter', [g_nServerPort]));
      MainOutMessage(e.message);
      Exit;
    end;
  end;
  MainOutMessage('게임센터 시작완료');
  Result := True;
end;

procedure TfrmMain.StopService;
begin
  Timer.Enabled := False;
  g_SessionList.Free;
  g_IniConf.Free;
end;

procedure TfrmMain.ProcessClientPacket;
var
  I: Integer;
  sLineText, sData, sDefMsg: string;
  nDataLen: Integer;
  DefMsg: TDefaultMessage;
  Socket: TCustomWinSocket;
begin
  for I := 0 to g_SessionList.Count - 1 do begin
    Socket := TCustomWinSocket(g_SessionList.Objects[I]);
    sLineText := g_SessionList.Strings[I];
    if sLineText = '' then Continue;
    while TagCount(sLineText, '!') > 0 do begin
      sLineText := ArrestStringEx(sLineText, '#', '!', sData);
      nDataLen := Length(sData);
      if (nDataLen >= DEFBLOCKSIZE) then begin
        sDefMsg := Copy(sData, 1, DEFBLOCKSIZE);
        DefMsg := DecodeMessage(sDefMsg);
        case DefMsg.Ident of
          CM_GETGAMELIST: begin
              SendGameList(Socket);
            end;
        end;
      end;
    end;
    g_SessionList.Strings[I] := sLineText;
  end;
end;

procedure TfrmMain.SendGameList(Socket: TCustomWinSocket);
var
  DefMsg: TDefaultMessage;
  sSendText: string;
  sNoticeUrl: string;
begin
  sSendText := '';

  DefMsg := MakeDefaultMsg(SM_SENDGAMELIST, 0, 0, 0, 0);
  SendSocket(Socket, EncodeMessage(DefMsg) + sSendText);

  DefMsg := MakeDefaultMsg(SM_SENDGAMELIST, g_nClientForm, 1, 0, 0);
  SendSocket(Socket, EncodeMessage(DefMsg) + EncodeString(sNoticeUrl));
end;

procedure TfrmMain.SendSocket(Socket: TCustomWinSocket; SendMsg: string);
begin
  SendMsg := '#' + SendMsg + '!';
  if Socket.Connected then
    Socket.SendText(SendMsg);
end;

procedure TfrmMain.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
  boFound: Boolean;
begin
  boFound := False;
  for I := 0 to g_SessionList.Count - 1 do begin
    if g_SessionList.Objects[I] = Socket then begin
      boFound := True;
      Break;
    end;
  end;
  if not boFound then begin
    g_SessionList.AddObject('', Socket)
  end;
end;

procedure TfrmMain.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
begin
  for I := 0 to g_SessionList.Count - 1 do begin
    if g_SessionList.Objects[I] = Socket then begin
      g_SessionList.Delete(I);
      Break;
    end;
  end;
end;

procedure TfrmMain.ServerSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmMain.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
begin
  for I := 0 to g_SessionList.Count - 1 do begin
    if g_SessionList.Objects[I] = Socket then begin
      g_SessionList.Strings[I] := g_SessionList.Strings[I] + Socket.ReceiveText;
      Break;
    end;
  end;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  ProcessClientPacket();
  if GetTickCount - m_dwShowTick > 1000 then begin
    m_dwShowTick := GetTickCount();
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  g_IniConf.WriteInteger('Client', 'ClientForm', g_nClientForm);
  g_IniConf.WriteString('Client', 'ServerAddr', g_sServerAddr);
  g_IniConf.WriteInteger('Client', 'ServerPort', g_nServerPort);
end;

procedure TfrmMain.EditNoticeUrlChange(Sender: TObject);
begin
  if not m_boOpen then Exit;
end;

procedure TfrmMain.EditClientFormChange(Sender: TObject);
begin
  if not m_boOpen then Exit;
end;

procedure TfrmMain.MemoGameListChange(Sender: TObject);
begin
  if not m_boOpen then Exit;
end;

procedure TfrmMain.ButtonGeneralDefalultClick(Sender: TObject);
begin
  EditGameDir.Text := '.\';
  EditHeroDB.Text := ' ';
  EditGameName.Text := 'Mir2-TheAres';
  EditGameExtIPaddr.Text := '127.0.0.1';
  CheckBoxDynamicIPMode.Checked := False;
end;

procedure TfrmMain.ButtonRunGateDefaultClick(Sender: TObject);
begin
  EditRunGate_Connt.Value := 1;
  EditRunGate_GatePort1.Text := '7200';
end;

procedure TfrmMain.ButtonLoginGateDefaultClick(Sender: TObject);
begin
  EditLoginGate_MainFormX.Text := '0';
  EditLoginGate_MainFormY.Text := '0';
  EditLoginGate_GatePort.Text := '7000';
end;

procedure TfrmMain.ButtonSelGateDefaultClick(Sender: TObject);
begin
  EditSelGate_MainFormX.Text := '0';
  EditSelGate_MainFormY.Text := '163';
  EditSelGate_GatePort.Text := '7100';
end;

procedure TfrmMain.ButtonLoginSrvDefaultClick(Sender: TObject);
begin
  EditLoginServer_MainFormX.Text := '251';
  EditLoginServer_MainFormY.Text := '0';
  EditLoginServerGatePort.Text := '5500';
  EditLoginServerServerPort.Text := '5600';
  CheckBoxboLoginServer_GetStart.Checked := True;
end;

procedure TfrmMain.ButtonDBServerDefaultClick(Sender: TObject);
begin
  EditDBServer_MainFormX.Text := '0';
  EditDBServer_MainFormY.Text := '326';
  CheckBoxDisableAutoGame.Checked := False;
  EditDBServerGatePort.Text := '5100';
  EditDBServerServerPort.Text := '6000';
  CheckBoxDBServerGetStart.Checked := True;
end;

procedure TfrmMain.ButtonLogServerDefaultClick(Sender: TObject);
begin
  EditLogServer_MainFormX.Text := '251';
  EditLogServer_MainFormY.Text := '239';
  EditLogServerPort.Text := '10000';
  CheckBoxLogServerGetStart.Checked := True;
end;

procedure TfrmMain.ButtonM2ServerDefaultClick(Sender: TObject);
begin
  EditM2Server_MainFormX.Text := '560';
  EditM2Server_MainFormY.Text := '0';
  EditM2Server_TestLevel.Value := 1;
  EditM2Server_TestGold.Value := 0;
  EditM2ServerGatePort.Text := '5000';
  EditM2ServerMsgSrvPort.Text := '4900';
  CheckBoxM2ServerGetStart.Checked := True;
end;

procedure TfrmMain.ButtonSearchLoginAccountClick(Sender: TObject);
var
  sAccount: string;
begin
  if LoginServer.btStartStatus <> 2 then begin
    Application.MessageBox('로그인서버를 실행해 주세요.', '알림', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  sAccount := Trim(EditSearchLoginAccount.Text);
  if sAccount = '' then begin
    Application.MessageBox('Account Name must not be empty', 'Message', MB_OK + MB_ICONERROR);
    EditSearchLoginAccount.SetFocus;
    Exit;
  end;
  EditLoginAccount.Text := '';
  EditLoginAccountPasswd.Text := '';
  EditLoginAccountUserName.Text := '';
  EditLoginAccountSSNo.Text := '';
  EditLoginAccountBirthDay.Text := '';
  EditLoginAccountPhone.Text := '';
  EditLoginAccountMobilePhone.Text := '';
  EditLoginAccountQuiz.Text := '';
  EditLoginAccountAnswer.Text := '';
  EditLoginAccountQuiz2.Text := '';
  EditLoginAccountAnswer2.Text := '';
  EditLoginAccountEMail.Text := '';
  EditLoginAccountMemo1.Text := '';
  EditLoginAccountMemo2.Text := '';
  CkFullEditMode.Checked := False;
  UserAccountEditMode(False);
  EditLoginAccount.Enabled := False;
  SendProgramMsg(LoginServer.MainFormHandle, GS_USERACCOUNT, sAccount);
end;

procedure TfrmMain.ProcessLoginSrvGetUserAccount(sData: string);
var
  DBRecord: TAccountDBRecord;
  DefMsg: TDefaultMessage;
  sDefMsg: string;
begin
  if Length(sData) < DEFBLOCKSIZE then Exit;
  sDefMsg := Copy(sData, 1, DEFBLOCKSIZE);
  sData := Copy(sData, DEFBLOCKSIZE + 1, Length(sData) - DEFBLOCKSIZE);
  DefMsg := DecodeMessage(sDefMsg);

  case DefMsg.Ident of //
    SG_USERACCOUNTNOTFOUND: begin
        Application.MessageBox('Account not found', 'Message', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
  else begin
      DecodeBuffer(sData, @DBRecord, SizeOf(DBRecord));
    end;
  end;
  EditLoginAccount.Text := DBRecord.UserEntry.sAccount;
  EditLoginAccountPasswd.Text := DBRecord.UserEntry.sPassword;
  EditLoginAccountUserName.Text := DBRecord.UserEntry.sUserName;
  EditLoginAccountSSNo.Text := DBRecord.UserEntry.sSSNo;
  EditLoginAccountBirthDay.Text := DBRecord.UserEntryAdd.sBirthDay;
  EditLoginAccountPhone.Text := DBRecord.UserEntry.sPhone;
  EditLoginAccountMobilePhone.Text := DBRecord.UserEntryAdd.sMobilePhone;
  EditLoginAccountQuiz.Text := DBRecord.UserEntry.sQuiz;
  EditLoginAccountAnswer.Text := DBRecord.UserEntry.sAnswer;
  EditLoginAccountQuiz2.Text := DBRecord.UserEntryAdd.sQuiz2;
  EditLoginAccountAnswer2.Text := DBRecord.UserEntryAdd.sAnswer2;
  EditLoginAccountEMail.Text := DBRecord.UserEntry.sEMail;
  EditLoginAccountMemo1.Text := DBRecord.UserEntryAdd.sMemo;
  EditLoginAccountMemo2.Text := DBRecord.UserEntryAdd.sMemo2;
  ButtonLoginAccountOK.Enabled := False;
  //  ShowMessage(sData);
end;

procedure TfrmMain.EditLoginAccountChange(Sender: TObject);
begin
  ButtonLoginAccountOK.Enabled := True;
end;

procedure TfrmMain.CkFullEditModeClick(Sender: TObject);
begin
  UserAccountEditMode(CkFullEditMode.Checked);
end;

procedure TfrmMain.UserAccountEditMode(boChecked: Boolean);
begin
  boChecked := CkFullEditMode.Checked;
  EditLoginAccountUserName.Enabled := boChecked;
  EditLoginAccountSSNo.Enabled := boChecked;
  EditLoginAccountBirthDay.Enabled := boChecked;
  EditLoginAccountQuiz.Enabled := boChecked;
  EditLoginAccountAnswer.Enabled := boChecked;
  EditLoginAccountQuiz2.Enabled := boChecked;
  EditLoginAccountAnswer2.Enabled := boChecked;
  EditLoginAccountMobilePhone.Enabled := boChecked;
  EditLoginAccountPhone.Enabled := boChecked;
  EditLoginAccountMemo1.Enabled := boChecked;
  EditLoginAccountMemo2.Enabled := boChecked;
  EditLoginAccountEMail.Enabled := boChecked;
end;

procedure TfrmMain.ButtonLoginAccountOKClick(Sender: TObject);
var
  DBRecord: TAccountDBRecord;
  DefMsg: TDefaultMessage;
  sAccount, sPassword, sUserName, sSSNo, sPhone, sQuiz, sAnswer, sEMail, sQuiz2, sAnswer2, sBirthDay, sMobilePhone, sMemo, sMemo2: string;
begin
  sAccount := Trim(EditLoginAccount.Text);
  sPassword := Trim(EditLoginAccountPasswd.Text);
  sUserName := Trim(EditLoginAccountUserName.Text);
  sSSNo := Trim(EditLoginAccountSSNo.Text);
  sPhone := Trim(EditLoginAccountPhone.Text);
  sQuiz := Trim(EditLoginAccountQuiz.Text);
  sAnswer := Trim(EditLoginAccountAnswer.Text);
  sEMail := Trim(EditLoginAccountEMail.Text);
  sQuiz2 := Trim(EditLoginAccountQuiz2.Text);
  sAnswer2 := Trim(EditLoginAccountAnswer2.Text);
  sBirthDay := Trim(EditLoginAccountBirthDay.Text);
  sMobilePhone := Trim(EditLoginAccountMobilePhone.Text);
  sMemo := Trim(EditLoginAccountMemo1.Text);
  sMemo2 := Trim(EditLoginAccountMemo2.Text);
  if sAccount = '' then begin
    Application.MessageBox('Account Name cannot be empty', 'Message', MB_OK + MB_ICONERROR);
    EditLoginAccount.SetFocus;
    Exit;
  end;
  if sPassword = '' then begin
    Application.MessageBox('Account Password cannot be empty', 'Message', MB_OK + MB_ICONERROR);
    EditLoginAccountPasswd.SetFocus;
    Exit;
  end;
  FillChar(DBRecord, SizeOf(DBRecord), 0);
  DBRecord.UserEntry.sAccount := sAccount;
  DBRecord.UserEntry.sPassword := sPassword;
  DBRecord.UserEntry.sUserName := sUserName;
  DBRecord.UserEntry.sSSNo := sSSNo;
  DBRecord.UserEntry.sPhone := sPhone;
  DBRecord.UserEntry.sQuiz := sQuiz;
  DBRecord.UserEntry.sAnswer := sAnswer;
  DBRecord.UserEntry.sEMail := sEMail;
  DBRecord.UserEntryAdd.sQuiz2 := sQuiz2;
  DBRecord.UserEntryAdd.sAnswer2 := sAnswer2;
  DBRecord.UserEntryAdd.sBirthDay := sBirthDay;
  DBRecord.UserEntryAdd.sMobilePhone := sMobilePhone;
  DBRecord.UserEntryAdd.sMemo := sMemo;
  DBRecord.UserEntryAdd.sMemo2 := sMemo2;
  DefMsg := MakeDefaultMsg(0, 0, 0, 0, 0);
  SendProgramMsg(LoginServer.MainFormHandle, GS_CHANGEACCOUNTINFO, EncodeMessage(DefMsg) + EncodeBuffer(@DBRecord, SizeOf(DBRecord)));
  ButtonLoginAccountOK.Enabled := False;
end;

procedure TfrmMain.ProcessLoginSrvChangeUserAccountStatus(sData: string);
var
  DefMsg: TDefaultMessage;
  sDefMsg: string;
begin
  if Length(sData) < DEFBLOCKSIZE then Exit;
  sDefMsg := Copy(sData, 1, DEFBLOCKSIZE);
  sData := Copy(sData, DEFBLOCKSIZE + 1, Length(sData) - DEFBLOCKSIZE);
  DefMsg := DecodeMessage(sDefMsg);
  case DefMsg.Recog of //
    -1: Application.MessageBox('계정정보를 확인할 수 없습니다.', '알림', MB_OK + MB_ICONERROR);
    1: Application.MessageBox('계정정보 변경완료!', '알림', MB_OK + MB_ICONINFORMATION);
    2: Application.MessageBox('계정정보 변경실패~', '오류', MB_OK + MB_ICONINFORMATION);
  end; // case
end;

procedure TfrmMain.RefGameDebug;
begin
  {EditM2CheckCodeAddr.Text := IntToHex(g_dwM2CheckCodeAddr, 2);
  FillChar(CheckCode, SizeOf(CheckCode), 0);
  ReadProcessMemory(M2Server.ProcessHandle, Pointer(g_dwM2CheckCodeAddr), @CheckCode, SizeOf(CheckCode), dwReturn);
  if dwReturn = SizeOf(CheckCode) then begin
    EditM2CheckCode.Text := IntToStr(CheckCode.dwThread0);
    EditM2CheckStr.Text := string(CheckCode.sThread0);
  end;

  EditDBCheckCodeAddr.Text := IntToHex(g_dwDBCheckCodeAddr, 2);
  FillChar(CheckCode, SizeOf(CheckCode), 0);
  ReadProcessMemory(DBServer.ProcessHandle, Pointer(g_dwDBCheckCodeAddr), @CheckCode, SizeOf(CheckCode), dwReturn);
  if dwReturn = SizeOf(CheckCode) then begin
    EditDBCheckCode.Text := IntToStr(CheckCode.dwThread0);
    EditDBCheckStr.Text := string(CheckCode.sThread0);
  end;}
end;

procedure TfrmMain.TimerCheckDebugTimer(Sender: TObject);
begin
  RefGameDebug();
end;

procedure TfrmMain.ButtonM2SuspendClick(Sender: TObject);
begin
  SuspendThread(M2Server.ProcessInfo.hThread);
end;

procedure TfrmMain.ButtonBackStartClick(Sender: TObject);
begin
  case m_nBackStartStatus of
    0: begin
        m_nBackStartStatus := 1;
        ButtonBackStart.Caption := 'Stop &Backup';
        g_BackUpManager.Start();
        LabelBackMsg.Font.Color := clGreen;
        LabelBackMsg.Caption := 'Data backup has started...';
      end;
    1: begin
        m_nBackStartStatus := 0;
        ButtonBackStart.Caption := 'Start &Backup';
        g_BackUpManager.Stop();
        LabelBackMsg.Font.Color := clRed;
        LabelBackMsg.Caption := 'Data backup has been stopped...';
      end;
  end;
end;

procedure TfrmMain.ButtonBackSaveClick(Sender: TObject);
var
  I: Integer;
  BackUpObject: TBackUpObject;
  Conini: Tinifile;
begin
  ButtonBackSave.Enabled := False;
  DeleteFile(ExtractFilePath(ParamStr(0)) + 'BackList.txt');
  Conini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + 'BackList.txt');
  if Conini <> nil then begin
    for I := 0 to g_BackUpManager.m_BackUpList.Count - 1 do begin
      BackUpObject := TBackUpObject(g_BackUpManager.m_BackUpList.Items[I]);
      Conini.WriteString(IntToStr(I), 'Source', BackUpObject.m_sSourceDir);
      Conini.WriteString(IntToStr(I), 'Save', BackUpObject.m_sDestDir);
      Conini.WriteInteger(IntToStr(I), 'Hour', BackUpObject.m_wHour);
      Conini.WriteInteger(IntToStr(I), 'Min', BackUpObject.m_wMin);
      Conini.WriteInteger(IntToStr(I), 'BackMode', BackUpObject.m_btBackUpMode);
      Conini.WriteBool(IntToStr(I), 'GetBack', BackUpObject.m_boBackUp);
      Conini.WriteBool(IntToStr(I), 'Zip', BackUpObject.m_boZip);
    end;
    Conini.Free;
  end;
  Application.MessageBox('Save succesful', 'Message', MB_OK + MB_ICONINFORMATION);
  ButtonBackSave.Enabled := True;
end;

procedure TfrmMain.ButtonBackAddClick(Sender: TObject);
var
  BackUpObject: TBackUpObject;
  sSource, sDest: string;
  wHour, wMin: Word;
begin
  sSource := Trim(RzButtonEditSource.Text);
  sDest := Trim(RzButtonEditDest.Text);
  if sSource = '' then begin
    Application.MessageBox('Please select the Data Directory', 'Message', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if sDest = '' then begin
    Application.MessageBox('Please Select the Backup Directory', 'Message', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if g_BackUpManager.FindObject(sSource) <> nil then begin
    Application.MessageBox('Data Directory already exists', 'Message', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if RadioButtonBackMode1.Checked then begin
    wHour := RzSpinEditHour1.IntValue;
    wMin := RzSpinEditMin1.IntValue;
  end else begin
    wHour := RzSpinEditHour2.IntValue;
    wMin := RzSpinEditMin2.IntValue;
  end;
  BackUpObject := TBackUpObject.Create;
  BackUpObject.m_nIndex := g_BackUpManager.m_BackUpList.Count;
  BackUpObject.m_sSourceDir := sSource;
  BackUpObject.m_sDestDir := sDest;
  BackUpObject.m_wHour := wHour;
  BackUpObject.m_wMin := wMin;
  BackUpObject.m_boBackUp := CheckBoxBackUp.Checked;
  if RadioButtonBackMode1.Checked then begin
    BackUpObject.m_btBackUpMode := 0;
  end else begin
    BackUpObject.m_btBackUpMode := 1;
  end;
  BackUpObject.m_boZip := CheckBoxZip.Checked;
  g_BackUpManager.AddObjectToList(BackUpObject);
  RefBackListToView();
  Application.MessageBox('Success', 'Message', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmMain.ButtonBackDelClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := ListViewDataBackup.Selected;
  if ListItem <> nil then begin
    if g_BackUpManager.DeleteObject(ListItem.Caption) then begin
      RefBackListToView();
      Application.MessageBox('Delete success', 'Message', MB_OK + MB_ICONINFORMATION);
    end else Application.MessageBox('Delete failed', 'Message', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmMain.ButtonBackChgClick(Sender: TObject);
var
  ListItem: TListItem;
  BackUpObject: TBackUpObject;
  sSource, sDest: string;
  wHour, wMin: Word;
begin
  ListItem := ListViewDataBackup.Selected;
  if ListItem <> nil then begin
    sSource := Trim(RzButtonEditSource.Text);
    sDest := Trim(RzButtonEditDest.Text);
    if sSource = '' then begin
      Application.MessageBox('Please select the Data Directory', 'Message', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    if sDest = '' then begin
      Application.MessageBox('Please select the Backup Directory', 'Message', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    {if g_BackUpManager.FindObject(sSource) <> nil then begin
      Application.MessageBox('This backup already exists!', 'Message', MB_OK + MB_ICONERROR);
      Exit;
    end;}
    if RadioButtonBackMode1.Checked then begin
      wHour := RzSpinEditHour1.IntValue;
      wMin := RzSpinEditMin1.IntValue;
    end else begin
      wHour := RzSpinEditHour2.IntValue;
      wMin := RzSpinEditMin2.IntValue;
    end;
    ListItem.Caption := sSource;
    ListItem.SubItems.Strings[0] := sDest;
    BackUpObject := TBackUpObject(ListItem.SubItems.Objects[0]);
    BackUpObject.m_sSourceDir := sSource;
    BackUpObject.m_sDestDir := sDest;
    BackUpObject.m_wHour := wHour;
    BackUpObject.m_wMin := wMin;
    BackUpObject.m_boBackUp := CheckBoxBackUp.Checked;
    if RadioButtonBackMode1.Checked then begin
      BackUpObject.m_btBackUpMode := 0;
    end else begin
      BackUpObject.m_btBackUpMode := 1;
    end;
    BackUpObject.m_boZip := CheckBoxZip.Checked;
    Application.MessageBox('Success', 'Message', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TfrmMain.ListViewDataBackupClick(Sender: TObject);
var
  ListItem: TListItem;
  BackUpObject: TBackUpObject;
begin
  try
    ListItem := ListViewDataBackup.Selected;
    BackUpObject := TBackUpObject(ListItem.SubItems.Objects[0]);
    RzButtonEditSource.Text := BackUpObject.m_sSourceDir;
    RzButtonEditDest.Text := BackUpObject.m_sDestDir;
    CheckBoxBackUp.Checked := BackUpObject.m_boBackUp;
    if BackUpObject.m_btBackUpMode = 0 then begin
      RadioButtonBackMode1.Checked := True;
      RadioButtonBackMode2.Checked := False;
      RzSpinEditHour1.IntValue := BackUpObject.m_wHour;
      RzSpinEditMin1.IntValue := BackUpObject.m_wMin;
    end else begin
      RadioButtonBackMode1.Checked := False;
      RadioButtonBackMode2.Checked := True;
      RzSpinEditHour2.IntValue := BackUpObject.m_wHour;
      RzSpinEditMin2.IntValue := BackUpObject.m_wMin;
    end;
    CheckBoxZip.Checked := BackUpObject.m_boZip;
    RzSpinEditHour1.Enabled := RadioButtonBackMode1.Checked;
    RzSpinEditMin1.Enabled := RadioButtonBackMode1.Checked;
    RzSpinEditHour2.Enabled := RadioButtonBackMode2.Checked;
    RzSpinEditMin2.Enabled := RadioButtonBackMode2.Checked;
    ButtonBackDel.Enabled := True;
    ButtonBackChg.Enabled := True;
  except
    ButtonBackDel.Enabled := False;
    ButtonBackChg.Enabled := False;
  end;
end;

procedure TfrmMain.RadioButtonBackMode1Click(Sender: TObject);
begin
  RzSpinEditHour2.Enabled := not RadioButtonBackMode1.Checked;
  RzSpinEditMin2.Enabled := not RadioButtonBackMode1.Checked;
  RzSpinEditHour1.Enabled := RadioButtonBackMode1.Checked;
  RzSpinEditMin1.Enabled := RadioButtonBackMode1.Checked;
end;

procedure TfrmMain.RadioButtonBackMode2Click(Sender: TObject);
begin
  RzSpinEditHour1.Enabled := not RadioButtonBackMode2.Checked;
  RzSpinEditMin1.Enabled := not RadioButtonBackMode2.Checked;
  RzSpinEditHour2.Enabled := RadioButtonBackMode2.Checked;
  RzSpinEditMin2.Enabled := RadioButtonBackMode2.Checked;
end;

procedure TfrmMain.RzButtonEditSourceButtonClick(Sender: TObject);
var
  NewDir: string;
begin
  NewDir := RzButtonEditSource.Text;
  if SelectDirectory('Please select the folders you want backed up', '', NewDir, Handle) then begin
    RzButtonEditSource.Text := NewDir;
  end;
end;

procedure TfrmMain.RzButtonEditDestButtonClick(Sender: TObject);
var
  NewDir: string;
begin
  NewDir := RzButtonEditDest.Text;
  if SelectDirectory('Select the backup folder', '', NewDir, Handle) then begin
    RzButtonEditDest.Text := NewDir;
  end;
end;

procedure TfrmMain.TimerUpDateTimer(Sender: TObject);
var
  I: Integer;
  IdHTTP: TIdHTTP;
  sList: TStringList;
  sGameRemoteAddress: string;


  sLineText: string;

  sVersion: string;
  sUpDate: string;
  sHomePage: string;
begin
  if m_nStartStatus <> 2 then Exit;
  TimerUpDate.Enabled := False;
  if (g_nServerVersion >= 0) and (g_nUpDateVersion >= 0) then begin
    case g_nServerVersion of
      0: MainOutMessage('Current M2Server version:' + IntToStr(g_nUpDateVersion));
      1: MainOutMessage('Current Hero M2Server version:' + IntToStr(g_nUpDateVersion));
    end;
    IdHTTP := TIdHTTP.Create(nil);
    //IdHTTP.ReadTimeout := 10000;
    sList := TStringList.Create;
    try
      try
        sGameRemoteAddress := DecryptString(Trim(g_sGameRemoteAddress));
        sList.Text := IdHTTP.Get(sGameRemoteAddress);
        for I := 0 to sList.Count - 1 do begin
          sLineText := Trim(sList.Strings[I]);
          if (sLineText = '') or (sLineText[1] = ';') then Continue;
          sLineText := GetValidStr3(sLineText, sVersion, ['|']);
          sLineText := GetValidStr3(sLineText, sUpDate, ['|']);
          sLineText := GetValidStr3(sLineText, sHomePage, ['|']);
          if (Str_ToInt(sVersion, -1) = g_nServerVersion) then begin
            if Str_ToInt(sUpDate, -1) <> g_nUpDateVersion then begin
              MainOutMessage('Found new M2Server update.');
              if Application.MessageBox('Do you want to update the M2Server?',
                'Message',
                MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                ShellExecute(0, 'Open', PChar(Trim(sHomePage)), nil, nil, SW_SHOWNORMAL);
              end;
            end;
            Break;
          end;
        end;
      except
        sList.Text := '';
      end;
    finally
      sList.Free;
      IdHTTP.Free;
    end;
  end;
end;

procedure TfrmMain.TimerAutoStartServerTimer(Sender: TObject);
begin
  Inc(g_nAutoStartTimeCount);
  if g_nAutoStartTimeCount >= g_nAutoStartDelayTime then begin
    TimerAutoStartServer.Enabled := False;
    SetWindowPos(Self.Handle, Self.Handle, Self.Left, Self.Top, Self.Width, Self.Height, $40);
    case m_nStartStatus of
      0: begin
          StartGame();
        end;
    end;
  end;
end;

procedure TfrmMain.CheckBoxAutoStartServerClick(Sender: TObject);
begin
  g_boAutoStartServer := CheckBoxAutoStartServer.Checked;
end;

procedure TfrmMain.EditAutoStartDelayTimeChange(Sender: TObject);
begin
  g_nAutoStartDelayTime := EditAutoStartDelayTime.Value;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
  procedure DeleteAllFile(sDir: string);
  var
    sr: TSearchRec;
    I: Integer;
  begin
    I := FindFirst(sDir + '*.*', faAnyFile or faDirectory, sr);
    Try
      while i = 0 do begin
        if (Sr.Attr and faDirectory) = faDirectory then begin
          if (sr.Name[1] <> '.') and (sr.Name[1] <> '..') then begin
            DeleteAllFile(sDir + sr.Name + '\');
            RemoveDir(sDir + sr.Name + '\');
          end;
        end
        else if (Sr.Attr and faDirectory) = 0 then begin
          if sr.Name[1] <> '.' then begin
            DeleteFile(sDir + sr.Name);
          end;
        end;
        i := FindNext(sr);
      end;
    finally
      FindClose(sr);
    end;
  end;
var
  TempString, TempString2: TStringList;
  I: Integer;
  INI: TINIFile;
begin
  if m_nStartStatus = 0 then begin
    Button1.Enabled := False;
    TempString := TStringList.Create;
    TempString2 := TStringList.Create;
    Try
      if CheckBox1.Checked then begin
        DeleteFile('.\DBServer\FDB\Hum.DB');
        DeleteFile('.\DBServer\FDB\Mir.DB');
        DeleteFile('.\DBServer\FDB\Mir.DB.idx');
      end;
      if CheckBox2.Checked then begin
        DeleteFile('.\LoginSrv\IDDB\Id.DB');
        DeleteFile('.\LoginSrv\IDDB\Id.DB.idx');
      end;
      if CheckBox8.Checked then begin
        DeleteAllFile('.\M2Server\Envir\Market_Upg\');
      end;
      if CheckBox3.Checked then begin
        DeleteAllFile('.\M2Server\Envir\Market_Saved\');
      end;
      if CheckBox7.Checked then begin
        DeleteAllFile('.\M2Server\Envir\Market_Prices\');
      end;
      if CheckBox6.Checked then begin
        if FileExists('.\M2Server\!Setup.txt') then begin
          INI := TINIFile.Create('.\M2Server\!Setup.txt');
          INI.WriteInteger('Setup', 'ItemNumber', 10000);
          INI.WriteInteger('Setup', 'ItemNumberEx', 2000000000);
          INI.Free;
        end;
      end;
      if CheckBox10.Checked then begin
        DeleteAllFile('.\LoginSrv\ChrLog\');
        DeleteAllFile('.\LoginSrv\CountLog\');
      end;
      if CheckBox11.Checked then begin
        DeleteAllFile('.\M2Server\Log\');
        DeleteAllFile('.\M2Server\ConLog\');
      end;
      if CheckBox12.Checked then begin
        DeleteAllFile('.\LogServer\BaseDir\');
      end;
    {  if CheckBox3.Checked then begin
        DeleteAllFile('.\M2Sever\GuildBase\Guilds\');
        if FileExists('.\M2Sever\GuildBase\GuildList.txt') then
          TempString.SaveToFile('.\M2Sever\GuildBase\GuildList.txt');
      end;  }
   {   if CheckBox4.Checked then begin
        TempString2.LoadFromFile('.\M2Sever\Castle\List.txt');
        for I := 0 to TempString2.Count - 1 do begin
          if FileExists('.\M2Sever\Castle\' + TempString2[I] + '\AttackSabukWall.txt') then
            TempString.SaveToFile('.\M2Sever\Castle\' + TempString2[I] + '\AttackSabukWall.txt');
          if FileExists('.\M2Sever\Castle\' + TempString2[I] + '\SabukW.txt') then begin
            INI := TINIFile.Create('.\M2Sever\Castle\' + TempString2[I] + '\SabukW.txt');
            INI.WriteString('Setup', 'OwnGuild', '');
            INI.WriteString('Setup', 'ChangeDate', '');
            INI.WriteString('Setup', 'WarDate', '');
            INI.WriteString('Setup', 'IncomeToday', '');
            INI.WriteString('Setup', 'TotalGold', '0');
            INI.WriteString('Setup', 'TodayIncome', '0');

            INI.WriteString('Defense', 'MainDoorHP', '10000');
            INI.WriteString('Defense', 'LeftWallHP', '5000');
            INI.WriteString('Defense', 'CenterWallHP', '5000');
            INI.WriteString('Defense', 'RightWallHP', '5000');
            INI.WriteString('Defense', 'Archer_1_HP', '2000');
            INI.WriteString('Defense', 'Archer_2_HP', '2000');
            INI.WriteString('Defense', 'Archer_3_HP', '2000');
            INI.WriteString('Defense', 'Archer_4_HP', '2000');
            INI.WriteString('Defense', 'Archer_5_HP', '2000');
            INI.WriteString('Defense', 'Archer_6_HP', '2000');
            INI.WriteString('Defense', 'Archer_7_HP', '2000');
            INI.WriteString('Defense', 'Archer_8_HP', '2000');
            INI.WriteString('Defense', 'Archer_9_HP', '2000');
            INI.WriteString('Defense', 'Archer_10_HP', '2000');
            INI.WriteString('Defense', 'Archer_11_HP', '2000');
            INI.WriteString('Defense', 'Archer_12_HP', '2000');
            INI.Free;
          end;
        end;     }
      {  if CheckBox5.Checked then begin
          DeleteFile('.\M2Sever\Global.ini');
        end;  }

      {  if CheckBox7.Checked then begin
          if FileExists('.\M2Sever\Envir\UnForceMaster.txt') then
            TempString.SaveToFile('.\Mir200\Envir\UnForceMaster.txt');
          if FileExists('.\M2Sever\Envir\UnFriend.txt') then
            TempString.SaveToFile('.\Mir200\Envir\UnFriend.txt');
          if FileExists('.\M2Sever\Envir\UnMarry.txt') then
            TempString.SaveToFile('.\Mir200\Envir\UnMarry.txt');
          if FileExists('.\M2Sever\Envir\UnMaster.txt') then
            TempString.SaveToFile('.\Mir200\Envir\UnMaster.txt');
        end;     }

      {  if CheckBox9.Checked then begin
          DeleteFile('.\M2Sever\EMail\EMailData.dat');
          DeleteFile('.\M2Sever\EMail\EMailName.txt');
        end;
      end;     }
    Finally
      TempString.Free;
      TempString2.Free;
      Button1.Enabled := True;
    End;
    Application.MessageBox('데이터 정리가 완료되었습니다.', '알림', MB_OK + MB_ICONINFORMATION);
  end else
    Application.MessageBox('게임서버가 실행중입니다. 종료 후 정리하세요.', '알림', MB_OK + MB_ICONWARNING);
end;

procedure TfrmMain.chkRankingClick(Sender: TObject);
begin
  g_boRanking_GetStart := chkRanking.Checked;
end;

end.

