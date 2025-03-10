unit svMain;
// If you get an error on the next line, you need to reextract SourceFiles.rar
{$I defines.inc}
interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JSocket, ExtCtrls, Buttons, StdCtrls, IniFiles, M2Share,
  Grobal2, SDK, HUtil32, RunSock, Envir, ItmUnit, Magic, NoticeM, Guild, Event,
  Castle,  FrnEngn, UsrEngn, MudUtil, SyncObjs, Menus, ComCtrls, Grids, MD5Unit,
  DragonSystem, GuildTerritory, WSocket, jpeg{, HDDInfo};

type
  TFrmMain = class(TForm)
    Timer1: TTimer;
    RunTimer: TTimer;                 
    DBSocket: TClientSocket;
    ConnectTimer: TTimer;
    StartTimer: TTimer;
    SaveVariableTimer: TTimer;
    CloseTimer: TTimer;
    MainMenu: TMainMenu;
    MENU_CONTROL: TMenuItem;
    MENU_CONTROL_START: TMenuItem;
    MENU_CONTROL_STOP: TMenuItem;
    MENU_CONTROL_EXIT: TMenuItem;
    MENU_CONTROL_RELOAD_CONF: TMenuItem;
    MENU_CONTROL_CLEARLOGMSG: TMenuItem;
    MENU_HELP: TMenuItem;
    MENU_HELP_ABOUT: TMenuItem;
    MENU_MANAGE: TMenuItem;
    MENU_CONTROL_RELOAD: TMenuItem;
    MENU_CONTROL_RELOAD_ITEMDB: TMenuItem;
    MENU_CONTROL_RELOAD_MAGICDB: TMenuItem;
    MENU_CONTROL_RELOAD_MONSTERDB: TMenuItem;
    MENU_OPTION: TMenuItem;
    MENU_OPTION_GENERAL: TMenuItem;
    MENU_OPTION_SERVERCONFIG: TMenuItem;
    MENU_OPTION_GAME: TMenuItem;
    MENU_OPTION_FUNCTION: TMenuItem;
    MENU_CONTROL_RELOAD_MONSTERSAY: TMenuItem;
    MENU_CONTROL_RELOAD_DISABLEMAKE: TMenuItem;
    MENU_CONTROL_GATE: TMenuItem;
    MENU_CONTROL_GATE_OPEN: TMenuItem;
    MENU_CONTROL_GATE_CLOSE: TMenuItem;
    MENU_VIEW: TMenuItem;
    MENU_VIEW_GATE: TMenuItem;
    MENU_VIEW_SESSION: TMenuItem;
    MENU_VIEW_ONLINEHUMAN: TMenuItem;
    MENU_VIEW_LEVEL: TMenuItem;
    MENU_VIEW_LIST: TMenuItem;
    MENU_MANAGE_ONLINEMSG: TMenuItem;
    MENU_VIEW_KERNELINFO: TMenuItem;
    MENU_TOOLS: TMenuItem;
    MENU_TOOLS_MERCHANT: TMenuItem;
    MENU_OPTION_ITEMFUNC: TMenuItem;
    MENU_TOOLS_MONGEN: TMenuItem;
    MENU_CONTROL_RELOAD_STARTPOINT: TMenuItem;
    G1: TMenuItem;
    MENU_OPTION_MONSTER: TMenuItem;
    MENU_TOOLS_IPSEARCH: TMenuItem;
    MENU_MANAGE_CASTLE: TMenuItem;
    MemoLog: TMemo;
    GridGate: TStringGrid;
    Panel1: TPanel;
    Label20: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    MENU_TOOLS_GAMESHOP: TMenuItem;
    MENU_CONTROL_RELOAD_QFUNCTION: TMenuItem;
    MENU_CONTROL_RELOAD_ReLoaduser: TMenuItem;
    Label5: TLabel;
    LbRunSocketTime: TLabel;
    LbRunTime: TLabel;
    LbUserCount: TLabel;
    MENU_CONTROL_RELOAD_GameShop: TMenuItem;
    MENU_CONTROL_RELOAD_FISH: TMenuItem;
    LbRunTime2: TLabel;
    MENU_CONTROL_RELOAD_MINIMAP: TMenuItem;
    MENU_CONTROL_RELOAD_BIGMAP: TMenuItem;
    MENU_CONTROL_RELOAD_MAKEITEM: TMenuItem;
    Image1: TImage;
    MENU_CONTROL_RELOAD_CHANGITEM: TMenuItem;
    MENU_CONTROL_RELOAD_DISASSEMBLE: TMenuItem;
    MENU_CONTROL_RELOAD_QMANAGE: TMenuItem;
    MENU_CONTROL_RELOAD_ROBOT: TMenuItem;
    MENU_CONTROL_RELOAD_MONITEM: TMenuItem;
    Label3: TLabel;
    MENU_OPTION_HERO: TMenuItem;
    MENU_MANAGE_SYS: TMenuItem;
    MENU_MANAGE_GUILD: TMenuItem;
    ChatControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    ButtonSend: TButton;
    GmEdit: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    ChatEdit: TEdit;
    GeneralMsg: TMemo;
    CryMsg: TMemo;
    WhisperMsg: TMemo;
    ForGmMsg: TMemo;
    GuildMsg: TMemo;
    GroupMsg: TMemo;
    VoiceMsg: TMemo;
    SellMsg: TMemo;
    LoverMsg: TMemo;
    MasterMsg: TMemo;
    TabSheet11: TTabSheet;
    AllMsg: TMemo;
    TabSheet12: TTabSheet;
    CommandMsg: TMemo;
    MENU_VIEW_COM: TMenuItem;
    MENU_VIEW_QUEST: TMenuItem;
    MENU_CONTROL_RELOAD_BEN: TMenuItem;
  //  hdd: THDDInfo;

    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure MemoLogChange(Sender: TObject);
    procedure MemoLogDblClick(Sender: TObject);
    procedure MENU_CONTROL_EXITClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_CONFClick(Sender: TObject);
    procedure MENU_CONTROL_CLEARLOGMSGClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_ITEMDBClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MAGICDBClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MONSTERDBClick(Sender: TObject);
    procedure MENU_CONTROL_STARTClick(Sender: TObject);
    procedure MENU_CONTROL_STOPClick(Sender: TObject);
    procedure MENU_HELP_ABOUTClick(Sender: TObject);
    procedure MENU_OPTION_SERVERCONFIGClick(Sender: TObject);
    procedure MENU_OPTION_GENERALClick(Sender: TObject);
    procedure MENU_OPTION_GAMEClick(Sender: TObject);
    procedure MENU_OPTION_FUNCTIONClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MONSTERSAYClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_DISABLEMAKEClick(Sender: TObject);
    procedure MENU_CONTROL_GATE_OPENClick(Sender: TObject);
    procedure MENU_CONTROL_GATE_CLOSEClick(Sender: TObject);
    procedure MENU_CONTROLClick(Sender: TObject);
    procedure MENU_VIEW_GATEClick(Sender: TObject);
    procedure MENU_VIEW_SESSIONClick(Sender: TObject);
    procedure MENU_VIEW_ONLINEHUMANClick(Sender: TObject);
    procedure MENU_VIEW_LEVELClick(Sender: TObject);
    procedure MENU_VIEW_LISTClick(Sender: TObject);
    procedure MENU_MANAGE_ONLINEMSGClick(Sender: TObject);
    procedure MENU_VIEW_KERNELINFOClick(Sender: TObject);
    procedure MENU_TOOLS_MERCHANTClick(Sender: TObject);
    procedure MENU_OPTION_ITEMFUNCClick(Sender: TObject);
    procedure MENU_TOOLS_MONGENClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_STARTPOINTClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
    procedure MENU_OPTION_MONSTERClick(Sender: TObject);
    procedure MENU_TOOLS_IPSEARCHClick(Sender: TObject);
    procedure MENU_MANAGE_CASTLEClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MENU_TOOLS_GAMESHOPClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_QFUNCTIONClick(Sender: TObject);
    procedure MENU_MANAGE_GUILDClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_ReLoaduserClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_GameShopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_FISHClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MINIMAPClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_BIGMAPClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MAKEITEMClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_CHANGITEMClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_DISASSEMBLEClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_QMANAGEClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_ROBOTClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_MONITEMClick(Sender: TObject);
    procedure MENU_OPTION_HEROClick(Sender: TObject);
    procedure MENU_MANAGE_SYSClick(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);                        //ä�ýý���
    procedure ChatEditKeyPress(Sender: TObject; var Key: Char);
    procedure GeneralMsgChange(Sender: TObject);
    procedure CryMsgChange(Sender: TObject);
    procedure WhisperMsgChange(Sender: TObject);
    procedure ForGmMsgChange(Sender: TObject);
    procedure GuildMsgChange(Sender: TObject);
    procedure GroupMsgChange(Sender: TObject);
    procedure VoiceMsgChange(Sender: TObject);
    procedure SellMsgChange(Sender: TObject);
    procedure LoverMsgChange(Sender: TObject);
    procedure MasterMsgChange(Sender: TObject);
    procedure AllMsgChange(Sender: TObject);
    procedure CommandMsgChange(Sender: TObject);
    procedure MENU_VIEW_COMClick(Sender: TObject);
    procedure MENU_VIEW_QUESTClick(Sender: TObject);
    procedure MENU_CONTROL_RELOAD_BENClick(Sender: TObject);        //ä�ýý���
  private
    boServiceStarted  :Boolean;
    procedure GateSocketClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure GateSocketClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure GateSocketClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure GateSocketClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure DBSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure DBSocketError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure DBSocketRead(Sender: TObject; Socket: TCustomWinSocket);

    procedure Timer1Timer(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);
    procedure SaveVariableTimerTimer(Sender: TObject);
    procedure RunTimerTimer(Sender: TObject);
    procedure ConnectTimerTimer(Sender: TObject);
                
    procedure StartService();
    procedure StopService();
    procedure SaveItemNumber;
    function  LoadClientFile():Boolean;
    procedure StartEngine;
    procedure MakeStoneMines;        //���� �ε�
    procedure ReloadConfig(Sender: TObject);
    procedure ClearMemoLog();
    procedure CloseGateSocket();
    { Private declarations }
  public
    GateSocket:TServerSocket;
    LogUDP: TWSocket;
    procedure AppOnIdle (Sender: TObject; var Done: Boolean);
    procedure OnProgramException(Sender: TObject; E: Exception);
    procedure SetMenu(); virtual;
    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;
    function KTimeToStr: string;
  end;

  procedure LoadServerTable();
  procedure WriteConLog(MsgList:TStringList);
  procedure ChangeCaptionText(Msg:PChar;nLen:Integer);stdcall;
  procedure UserEngineThread(ThreadInfo:pTThreadInfo);stdcall;
  procedure ProcessGameRun();
  function GetMacAddress(const ServerName:string): string;
  function GetHardDiskSerial(const DriveLetter: Char): string;
var
  FrmMain: TFrmMain;
  g_GateSocket: TServerSocket;
  VerInfoStr1, VerInfoStr2, VerInfoStr3, VerInfoStr4: String; //����
    //����üũ
  g_SpeedHackCheck : integer;
  g_SpeedHackCheckChar : string;
  //���� �������� Merchant Index
  CurrentMerchantIndex : integer;
implementation
uses
  LocalDB, InterServerMsg, InterMsgClient, IdSrvClient, FSrvValue, ViewCompoundInfo,
  GeneralConfig, GameConfig, FunctionConfig, ObjRobot, ViewSession, HeroConfig,
  ViewOnlineHuman, ViewLevel, ViewList, OnlineMsg, ViewKernelInfo, UnitRegisterSoft,
  ConfigMerchant, ItemSet, ConfigMonGen, EDcode, UEncrypt, EncryptUnit,
  GameCommand, MonsterConfig, RunDB, CastleManage, ConfigGameShop,
  GuildManage, SysManager, ObjBase{, QuestSystem};
var
  sCaption:String;
  sCaptionExtText:String;
  l_dwRunTimeTick:LongWord;
  boRemoteOpenGateSocket:Boolean = False;
  boRemoteOpenGateSocketed:Boolean = False;
  sChar:String = ' ?';
  sRun:String = 'Run';
{$R *.dfm}


procedure ChangeCaptionText(Msg:PChar;nLen:Integer);stdcall;
var
  sMsg:String;
begin
  if (nLen > 0) and (nLen < 30) then begin
    setlength(sMsg,nLen);
    Move(Msg^,sMsg[1],nLen);
    sCaptionExtText:=sMsg;
  end;
end;

function GetAddressSpaceUsed: Cardinal;
var
  LMemoryStatus: TMemoryStatus;
begin
  {Set the structure size}
  LMemoryStatus.dwLength := SizeOf(LMemoryStatus);
  {Get the memory status}
  GlobalMemoryStatus(LMemoryStatus);
  {The result is the total address space less the free address space}
  Result := (LMemoryStatus.dwTotalVirtual - LMemoryStatus.dwAvailVirtual) shr 10;
end;

procedure LoadServerTable();//004E3E64
var
  i,ii,nServerIndex:Integer;
  LoadList:TStringList;
  GateList:TStringList;
  SrvNetInfo:pTSrvNetInfo;
  sLineText,sGateMsg:String;
  sServerIdx,sIPaddr,sPort:String;
begin
  for I:=0 to ServerTableList.Count -1 do begin
    TList(ServerTableList.Items[I]).Free;
  end;
  ServerTableList.Clear;
  if FileExists('.\!servertable.txt') then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile('.\!servertable.txt');
    for I:=0 to LoadList.Count - 1 do begin
      sLineText:=Trim(LoadList.Strings[i]);
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sGateMsg:=Trim(GetValidStr3(sLineText, sServerIdx, [' ', #9]));
        nServerIndex := Str_ToInt(sServerIdx,0);

        if (sGateMsg <> '') and (nServerIndex > 0) then begin
          GateList:=TStringList.Create;
          for II:=0 to 30 do begin
            if sGateMsg = '' then break;
            sGateMsg:=Trim(GetValidStr3(sGateMsg, sIPaddr, [' ', #9]));
            sGateMsg:=Trim(GetValidStr3(sGateMsg, sPort, [' ', #9]));
            if (sIPaddr <> '') and (sPort <> '') then begin
              GateList.AddObject(sIPaddr,TObject(Str_ToInt(sPort,0)));
            end;
          end;
          ServerTableList.Add(GateList);
        end;
      end;
    end;
    LoadList.Free;
  end else begin
    ShowMessage('�Ҳ����ļ�<!servertable.txt>');
  end;
end;

procedure WriteConLog(MsgList:TStringList);
var
  I: Integer;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  sLogDir,sLogFileName:String;
  LogFile:TextFile;
begin
  if MsgList.Count <= 0 then exit;
  DecodeDate(Date, Year, Month, Day);
  DecodeTime(Time, Hour, Min, Sec, MSec);
  if not DirectoryExists(g_Config.sConLogDir) then begin
    CreateDir(g_Config.sConLogDir);
  end;
  sLogDir:=g_Config.sConLogDir + IntToStr(Year) + '-' + IntToStr2(Month) + '-' + IntToStr2(Day);
  if not DirectoryExists(sLogDir) then begin
    CreateDirectory(PChar(sLogDir),nil);
  end;
  sLogFileName:=sLogDir + '\C-' + IntToStr(nServerIndex) + '-' + IntToStr2(Hour) + 'H' + IntToStr2((Min div 10 * 2) * 5) + 'M.txt';
  AssignFile(LogFile,sLogFileName);
  if not FileExists(sLogFileName) then begin
    Rewrite(LogFile);
  end else begin
    Append(LogFile);
  end;
  for I := 0 to MsgList.Count - 1 do begin
    WriteLn(LogFile,'1' + #9 + MsgList.Strings[I]);
  end;    // for
  CloseFile(LogFile);
end;


procedure TFrmMain.SaveItemNumber();
var
  I:Integer;
begin
try
  Config.WriteInteger('Setup','ItemNumber',g_Config.nItemNumber);
  Config.WriteInteger('Setup','ItemNumberEx',g_Config.nItemNumberEx);
  for I := Low(g_Config.GlobalVal) to High(g_Config.GlobalVal) do begin
    Config.WriteInteger('Setup','GlobalVal' + IntToStr(I),g_Config.GlobalVal[I])
  end;
  Config.WriteInteger('Setup','WinLotteryCount',g_Config.nWinLotteryCount);
  Config.WriteInteger('Setup','NoWinLotteryCount',g_Config.nNoWinLotteryCount);
  Config.WriteInteger('Setup','WinLotteryLevel1',g_Config.nWinLotteryLevel1);
  Config.WriteInteger('Setup','WinLotteryLevel2',g_Config.nWinLotteryLevel2);
  Config.WriteInteger('Setup','WinLotteryLevel3',g_Config.nWinLotteryLevel3);
  Config.WriteInteger('Setup','WinLotteryLevel4',g_Config.nWinLotteryLevel4);
  Config.WriteInteger('Setup','WinLotteryLevel5',g_Config.nWinLotteryLevel5);
  Config.WriteInteger('Setup','WinLotteryLevel6',g_Config.nWinLotteryLevel6);

except

end;
end;
procedure TFrmMain.AppOnIdle (Sender: TObject; var Done: Boolean);
begin
//   MainOutMessage ('Idle');
end;
procedure TFrmMain.OnProgramException (Sender: TObject; E: Exception);
begin
  MainOutMessage(E.Message);
end;


function TFrmMain.KTimeToStr: string;
var
  Min, Sec, MSec: DWORD;
begin
 GetVolumeInformation('C:\',nil,0,@Min,Sec,MSec,nil,0);
 Result :=  Encrypt(IntToHex(HiWord(Min), 4) + IntToHex(LoWord(Min), 4) , 13579);
end;


procedure TFrmMain.DBSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
 ErrorCode:=0;
 Socket.Close;
end;

procedure TFrmMain.DBSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
  tStr:String;
begin
  EnterCriticalSection(UserDBSection);
  try
    tStr:=Socket.ReceiveText;
    g_Config.sDBSocketRecvText:=g_Config.sDBSocketRecvText + tStr;

    if not g_Config.boDBSocketWorking then begin
      g_Config.sDBSocketRecvText:='';
    end;
  finally
    LeaveCriticalSection(UserDBSection);
  end;
end;


procedure TFrmMain.Timer1Timer(Sender: TObject); //004E5418
var
  boWriteLog :Boolean;
  i          :Integer;
  nRow       :Integer;
  wHour      :Word;
  wMinute    :Word;
  wSecond    :Word;
  tSecond    :Integer;
  sSrvType   :String;
  tTimeCount :Currency;
  GateInfo   :pTGateInfo;
//  sGate,tGate      :String;
  LogFile :TextFile;
  MemoryStatus: TMemoryStatus;
  s28:String;
begin
//  Caption:=sCaption + ' [' + sCaptionExtText + ']';
  Caption:= format('%s - %s',[g_sTitleName,sCaption]);
  EnterCriticalSection(LogMsgCriticalSection);
  try
    if MemoLog.Lines.Count > 500 then MemoLog.Clear;
    if CommandMsg.Lines.Count > 500 then CommandMsg.Clear;
    if AllMsg.Lines.Count > 500 then AllMsg.Clear;
    if GeneralMsg.Lines.Count > 500 then GeneralMsg.Clear;    //ä�ýý���
    if CryMsg.Lines.Count > 500 then CryMsg.Clear;
    if WhisperMsg.Lines.Count > 500 then WhisperMsg.Clear;
    if ForGmMsg.Lines.Count > 500 then ForGmMsg.Clear;
    if GuildMsg.Lines.Count > 500 then GuildMsg.Clear;
    if GroupMsg.Lines.Count > 500 then GroupMsg.Clear;
    if VoiceMsg.Lines.Count > 500 then VoiceMsg.Clear;
    if SellMsg.Lines.Count > 500 then SellMsg.Clear;
    if LoverMsg.Lines.Count > 500 then LoverMsg.Clear;
    if MasterMsg.Lines.Count > 500 then MasterMsg.Clear;
    boWriteLog:=True;
    if MainLogMsgList.Count > 0 then begin
      try
        if not FileExists(sLogFileName) then begin
          AssignFile(LogFile,sLogFileName);
          Rewrite(LogFile);
        end else begin
          AssignFile(LogFile,sLogFileName);
          Append(LogFile);
        end;
        boWriteLog:=False;
      except
        MemoLog.Lines.Add('д����־�ļ�ʧ��...');
      end;
    end;
    for i:=0 to MainLogMsgList.Count - 1 do begin
      MemoLog.Lines.Add(MainLogMsgList.Strings[i]);
      if not boWriteLog then begin
        Writeln(LogFile,MainLogMsgList.Strings[i]);
      end;
    end;
    MainLogMsgList.Clear;
    if not boWriteLog then CloseFile(LogFile);
    for I := 0 to LogStringList.Count - 1 do begin
//      MemoryStream:=TMemoryStream.Create;
//      try
        s28:='1' + #9 + IntToStr(g_Config.nServerNumber) + #9 + IntToStr(nServerIndex) + #9 + LogStringList.Strings[I] + #2;
//        MemoryStream.Write(s28[1],length(s28));
        LogUDP.Send(@s28[1],length(s28));
//      finally
//        MemoryStream.Free;
//      end;
    end;
    LogStringList.Clear;
    if LogonCostLogList.Count > 0 then begin
      WriteConLog(LogonCostLogList);
    end;
    LogonCostLogList.Clear;  
  finally
    LeaveCriticalSection(LogMsgCriticalSection);
  end;


  if nServerIndex = 0 then begin
    sSrvType:='[M]';
  end else begin
    if FrmMsgClient.MsgClient.Socket.Connected then begin
      sSrvType:='[S]';
    end else begin
      sSrvType:='[ ]';
    end;
  end;
  //����߳� ����ʱ��
  //g_dwEngineRunTime:=GetTickCount - g_dwEngineTick;

  tSecond:=(GetTickCount() - g_dwStartTick) div 1000;
  wHour:=tSecond div 3600;
  wMinute:=(tSecond div 60) mod 60;
  wSecond:=tSecond mod 60;

 { LbUserCount.Caption:= 'Mob Count: ' + IntToStr(UserEngine.MonsterCount) + ' ' + '[' +
    IntToStr(g_nGateRecvMsgLenMin) + '/' +
    IntToStr(g_nGateRecvMsgLenMax) + ']' + '[' +
    IntToStr(UserEngine.OnlinePlayObject) + '/' +
    IntToStr(UserEngine.PlayObjectCount) + ']' + '[' +
    IntToStr(UserEngine.LoadPlayCount) + '/' +
    IntToStr(UserEngine.m_PlayObjectFreeList.Count) + ']';    }
  LbUserCount.Caption := 'ˢ������:' + IntToStr(UserEngine.MonsterCount);

  Label3.Caption :=  '��������:' + IntToStr(UserEngine.PlayObjectCount)
     + ' - �ٻ�Ӣ����:' + IntToStr(UserEngine.HeroObjectCount);

  tTimeCount:=GetTickCount() / (24 * 60 * 60 * 1000);
  LbRunSocketTime.Caption := '����������ʱ�� : ' +'[' + IntToStr(wHour) + ':' +
    IntToStr(wMinute) + ':' +
    IntToStr(wSecond) + sSrvType + ' - ' + CurrToStr(tTimeCount) + ']';

  Label1.Caption := Format('����(%d/%d) ����(%d/%d) �û�(%d/%d)', [nRunTimeMin, nRunTimeMax, g_nSockCountMin, g_nSockCountMax, g_nUsrTimeMin, g_nUsrTimeMax]);
  Label2.Caption := Format('��ɫ%d/%d �û�%d/%d ����%d/%d Npc%d/%d' , [g_nHumCountMin,
    g_nHumCountMax,
      dwUsrRotCountMin,
      dwUsrRotCountMax,
      UserEngine.dwProcessMerchantTimeMin,
      UserEngine.dwProcessMerchantTimeMax,
      UserEngine.dwProcessNpcTimeMin,
      UserEngine.dwProcessNpcTimeMax,
      g_nProcessHumanLoopTime]);


  Label20.Caption:=format('MonG:%d/%d/%d MonP:%d/%d/%d ObjRun:%d/%d',[g_nMonGenTime,g_nMonGenTimeMin,g_nMonGenTimeMax,g_nMonProcTime,g_nMonProcTimeMin,g_nMonProcTimeMax,g_nBaseObjTimeMin,g_nBaseObjTimeMax]);

  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  GlobalMemoryStatus(MemoryStatus);
  LbRunTime.Caption:= Format('%s%dM', ['�ڴ��С:', MemoryStatus.dwTotalPhys div 1000000]) + ' - '
                     + Format('%s%dM', ['�����ڴ�', MemoryStatus.dwAvailPhys div 1000000]);
  LbRunTime2.Caption:= Format('%s%d %%', ['ʹ���ڴ�:', MemoryStatus.dwMemoryLoad]);
  Label5.Caption := g_sMonGenInfo1 + ' - ' + g_sMonGenInfo2;

  nRow:=1;
  for i:= Low(g_GateArr) to High(g_GateArr) do begin
    GridGate.Cells[0,I + 1]:='';
    GridGate.Cells[1,I + 1]:='';
    GridGate.Cells[2,I + 1]:='';
    GridGate.Cells[3,I + 1]:='';
    GridGate.Cells[4,I + 1]:='';
    GridGate.Cells[5,I + 1]:='';
    GridGate.Cells[6,I + 1]:='';
    GateInfo:=@g_GateArr[i];
    //GateInfo:=@RunSocket.GateList[i];
    if GateInfo.boUsed and (GateInfo.Socket <> nil) then begin
      GridGate.Cells[0,nRow]:=IntToStr(I);
      GridGate.Cells[1,nRow]:=GateInfo.sAddr + ':' + IntToStr(GateInfo.nPort);
      GridGate.Cells[2,nRow]:=IntToStr(GateInfo.nSendMsgCount);
      GridGate.Cells[3,nRow]:=IntToStr(GateInfo.nSendedMsgCount);
      GridGate.Cells[4,nRow]:=IntToStr(GateInfo.nSendRemainCount);
      if GateInfo.nSendMsgBytes < 1024 then begin
        GridGate.Cells[5,nRow]:=IntToStr(GateInfo.nSendMsgBytes) + 'b';
      end else begin
        GridGate.Cells[5,nRow]:=IntToStr(GateInfo.nSendMsgBytes div 1024) + 'kb';
      end;
      GridGate.Cells[6,nRow]:=IntToStr(GateInfo.nUserCount) + '/' + IntToStr(GateInfo.UserList.Count);
      Inc(nRow);
    end;
  end;

  Inc(nRunTimeMax);

  if g_nSockCountMax   > 0 then Dec(g_nSockCountMax);
  if g_nUsrTimeMax     > 0 then Dec(g_nUsrTimeMax);
  if g_nHumCountMax    > 0 then Dec(g_nHumCountMax);
  if g_nMonTimeMax     > 0 then Dec(g_nMonTimeMax);
  if dwUsrRotCountMax  > 0 then Dec(dwUsrRotCountMax);
  if g_nMonGenTimeMin  > 1 then Dec(g_nMonGenTimeMin,2);
  if g_nMonProcTimeMin > 1 then Dec(g_nMonProcTimeMin,2);
  if g_nBaseObjTimeMax > 0 then Dec(g_nBaseObjTimeMax);
end;

procedure TFrmMain.StartTimerTimer(Sender: TObject);//004E4848
var
  nCode:Integer;
  IsSuccess : Boolean;
begin
  //SendGameCenterMsg(SG_STARTNOW, 'M2���� ������');
  StartTimer.Enabled:=False;
  FrmDB:=TFrmDB.Create();
  StartService();

  try
    if SizeOf(THumData)<> SIZEOFTHUMAN then begin
      ShowMessage('SizeOf(THuman) ' + IntToStr(sizeof(THumData)) + ' <> SIZEOFTHUMAN ' + IntToStr(SIZEOFTHUMAN));
      Close;
      exit;
    end;
    if not LoadClientFile then begin
      Close;
      exit;
    end;

   { if CompareText( GetMacAddress('') ,DecodeString_3des('mwJR8bsl/8mH+uRcDRgyTIE=', '56m2VipGate')) <> 0 then begin   //�輺��
      Close;
      exit;
    end;    }
    {if CompareText( GetMacAddress('') ,DecodeString_3des('6wwEDPhLgAJAZpbpoFxDLoE=', '56m2VipGate')) <> 0 then begin   //������ ��
      Close;
      exit;
    end; }
   { if CompareText( GetMacAddress('') ,DecodeString_3des('mqOcOxEsRU6NtL1+A67MHS8=', '56m2VipGate')) <> 0 then begin   //������ ����
      Close;
      exit;
    end;    }
    {if CompareText( GetHardDiskSerial('c') ,DecodeString_3des('kybQm4UJSYU=', '56m2VipGate')) <> 0 then begin   //������  ����
      Close;
      exit;
    end; }
   { if CompareText( GetHardDiskSerial('c') ,DecodeString_3des('7jugnfJ5u00=', '56m2VipGate')) <> 0 then begin   //������  ��
      Close;
      exit;
    end;   }
          

    SafeFillChar(g_SayItemList, SizeOf(g_SayItemList), #0);
    g_SayItemIndex := 0;

    FrmDB.InitDBM;
    LoadGameLogItemNameList();
    LoadDenyIPAddrList();
    LoadDenyAccountList();
    LoadDenyChrNameList();
    LoadNoClearMonList();
    LoadDenyHDDList();              //�����Ǿ����ϴ�.

    //thedeath
    nEMKills:=0;//make sure all the em values are set
    dwEMSpellTick:=GetTickCount();//em value again
    dwEMDied:=0;//em didnt die yet

    MemoLog.Lines.Add('���ڼ�����Ʒ���ݿ�...');
    nCode:=FrmDB.LoadItemsDB;
    if nCode < 0 then begin
      if nCode = -3 then
      MemoLog.Lines.Add('StdItems.DB: TBL_STDITEM �в����ڸ���Ʒ��' + '����= ' + IntToStr(nCode))
      else
      MemoLog.Lines.Add('StdItems.DB: FLD_ID ���пհ׵�λ�á�' + '����= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('��Ʒ���ݿ����(%d)..',[UserEngine.StdItemList.Count]));
    {$IFDEF UseTXT}
      MemoLog.Lines.Add('�ļ�����: [�ı��ļ�]');
    {$ELSE}
      MemoLog.Lines.Add('�ļ�����: [���ݿ� ]');
    {$ENDIF}
    MemoLog.Lines.Add('���ڼ��ص�ͼ����....');
    nCode:= FrmDB.LoadMapInfo;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MapInfo.txt: ��ȡʱ�������� ' + '����= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('��ͼ�ļ�����(%d)..',[g_MapManager.Count]));

    {$IFDEF UseTXT}
      nCode:= FrmDB.LoadMinMap;
      if nCode < 0 then begin
        MemoLog.Lines.Add('MinMap.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
        exit;
      end;

      nCode:= FrmDB.LoadBigMap;
      if nCode < 0 then begin
        MemoLog.Lines.Add('BigMap.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
        exit;
      end;

    {$ENDIF}

    // ����� �ý��� �ε�
      MemoLog.Lines.Add('���ڼ�������ħ������...');            //����
      MemoLog.Lines.Add( gFireDragon.Initialize( g_Config.sEnvirDir + DRAGONITEMFILE , IsSuccess ) );
      if (not IsSuccess) then begin
       MemoLog.Lines.Add( DRAGONITEMFILE +'��ȡʱ��������');
       exit;
      end;

    nCode:= FrmDB.LoadDecorationList;
    if nCode < 0 then begin
      MemoLog.Lines.Add('DecorationList.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;

    g_GuildTerritory.LoadAll();
    MemoLog.Lines.Add('���ڼ��ع������ݿ�...');
    nCode:= FrmDB.LoadMonsterDB;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Monster.DB: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('�������ݿ����(%d).',[UserEngine.MonsterList.Count]));

    MemoLog.Lines.Add('���ڼ��ؼ������ݿ�...');
    nCode:= FrmDB.LoadMagicDB;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Magic.DB: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('�������ݿ����(%d).',[UserEngine.m_MagicList.Count]));

    nCode:= FrmDB.LoadMonGen;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MonGen.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add(format('ˢ���ļ�����(%d).',[UserEngine.m_MonGenList.Count]));

    MemoLog.Lines.Add('���ڼ��ع���˵������...');
    LoadMonSayMsg();
    MemoLog.Lines.Add(format('����˵�����ü���(%d).',[g_MonSayMsgList.Count]));
    LoadDisableTakeOffList();
    LoadUserCmdList(); //������ɾ�
    LoadMonDropLimitList();
    FrmDB.LoadDefiniensConst;
    LoadDisableMakeItem();
    LoadDisableConsignItem();      //��Ź
    LoadDisableRentalItem(); //�뿩

    LoadAllowSellOffItem();
    LoadDisableMoveMap;
    ItemUnit.LoadCustomItemName();
    LoadDisableSendMsgList();
    LoadItemBindIPaddr();
    LoadItemBindAccount();
    LoadItemBindCharName();



    nCode:= FrmDB.LoadUnbindList;
    if nCode < 0 then begin
      MemoLog.Lines.Add('UnbindList.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('����ļ��Ѽ������...');

    nCode:= FrmDB.LoadMapQuest;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MapQuest.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('��ͼ����������...');

    nCode := FrmDB.LoadMapEvent;
    if nCode < 0 then begin
      MemoLog.Lines.Add('MapEvent.txt ��ȡʱ��������');
      Exit;
    end;
    MemoLog.Lines.Add('��ͼ�¼��������...');

    nCode:= FrmDB.LoadQuestDiary;
    if nCode < 0 then begin
      MemoLog.Lines.Add('QuestDiary\*.txt: ��ȡʱ��������' + '����: ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('QuestDiary�������...');

    if not LoadLineNotice(g_Config.sNoticeDir + 'LineNotice.txt') then  begin
      MemoLog.Lines.Add('LineNotice.txt: ��ȡʱ��������...');
    end;
    MemoLog.Lines.Add('���߹�����Ϣ�������...');

    if not LoadLineHint(g_Config.sNoticeDir + 'LineHint.txt') then begin
      MemoLog.Lines.Add('LineHint.txt: ��ȡʱ��������...');
    end;
    MemoLog.Lines.Add('��ʾ��Ϣ�������...');
    FrmDB.LoadAdminList();
    MemoLog.Lines.Add('����Ա�б�������...');
    FrmDB.LoadColumnList();    //ȫ����
    MemoLog.Lines.Add('�����Ϣ�������...');
    g_GuildManager.LoadGuildInfo();
    MemoLog.Lines.Add('�л���Ϣ�������....');

    g_CastleManager.LoadCastleList();
    MemoLog.Lines.Add('�Ǳ���Ϣ�������..');

    g_CastleManager.Initialize;
    MemoLog.Lines.Add('�Ǳ���ʼ���ɹ�..');
    if (nServerIndex=0) then FrmSrvMsg.StartMsgServer
    else FrmMsgClient.ConnectMsgServer;
    StartEngine();
    boStartReady:=True;
    Sleep(500);

{$IF DBSOCKETMODE = TIMERENGINE}
    ConnectTimer.Enabled:=True;
{$ELSE}
    FillChar(g_Config.DBSOcketThread,SizeOf(g_Config.DBSOcketThread),0);
    g_Config.DBSOcketThread.Config:=@g_Config;
    g_Config.DBSOcketThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @DBSocketThread,
                                                 @g_Config.DBSOcketThread,
                                                 0,
                                                 g_Config.DBSOcketThread.dwThreadID);
{$IFEND}
{$IF IDSOCKETMODE = THREADENGINE}
    FillChar(g_Config.IDSocketThread,SizeOf(g_Config.IDSocketThread),0);
    g_Config.IDSocketThread.Config:=@g_Config;
    g_Config.IDSocketThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @IDSocketThread,
                                                 @g_Config.IDSocketThread,
                                                 0,
                                                 g_Config.IDSocketThread.dwThreadID);

{$IFEND}
     g_dwRunTick := GetTickCount();

    n4EBD1C  := 0;
    g_dwUsrRotCountTick := GetTickCount();
{$IF USERENGINEMODE = THREADENGINE}
    FillChar(g_Config.UserEngineThread,SizeOf(g_Config.UserEngineThread),0);
    g_Config.UserEngineThread.Config:=@g_Config;
    g_Config.UserEngineThread.hThreadHandle:=CreateThread(nil,
                                                 0,
                                                 @UserEngineThread,
                                                 @g_Config.UserEngineThread,
                                                 0,
                                                 g_Config.UserEngineThread.dwThreadID);
 {$ELSE}

{$IFEND}
    RunTimer.Enabled:=True;
    SendGameCenterMsg(SG_STARTOK, '�������������...');
    GateSocket.Address:=g_Config.sGateAddr;
    GateSocket.Port:=g_Config.nGatePort;
    g_GateSocket:=GateSocket;

    boRemoteOpenGateSocket:=True;
  except
    on e: Exception do
      MainOutMessage('StartTimer exception:' + E.Message);
  end;
end;

procedure TFrmMain.StartEngine(); //004E5F2C
var
  nCode:Integer;
  nCheckCode:Integer;
  ssMsg: String;
ResourceString
  sExceptionMsg = '[Exception] TFrmMain::StartEngine - Code=%d';
begin
  nCheckCode := 0;
  try
{$IF IDSOCKETMODE = TIMERENGINE}
    FrmIDSoc.Initialize;
{$IFEND}

    nCheckCode := 1;
    g_MapManager.LoadMapDoor;
    MemoLog.Lines.Add('IDSoc��ʼ��...');

    nCheckCode := 2;
    MakeStoneMines(); //���� �ε�
    MemoLog.Lines.Add('�ڿ���Ϣ�������..');

    nCheckCode := 3;
    nCode:= FrmDB.LoadMerchant;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Merchant.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;

    nCheckCode := 4;
    if not g_Config.boVentureServer then begin
     nCode:= FrmDB.LoadGuardList;
     if nCode < 0 then begin
        MemoLog.Lines.Add('GuardList.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      end;
    end;

    nCheckCode := 5;
    nCode:= FrmDB.LoadNpcs;
    if nCode < 0 then begin
      MemoLog.Lines.Add('Npc.txt : ��ȡ���ļ�ʱ����' + '����e= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('Npc��Ϣ�������...');

    {nCode := FrmDB.LoadQuestList;      //����Ʈ �׽�Ʈ
    if nCode < 0 then begin
      MemoLog.Lines.Add('TBL_QUEST : �� ������ �д� ���� ���� �߻��߽��ϴ�.' + 'Code= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('����Ʈ����Ʈ �ε�...'); }

    nCheckCode := 6;
    nCode:= FrmDB.LoadMakeItemList; //��������
    if nCode < 0 then begin
      MemoLog.Lines.Add('MakeItemList.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;

    nCode:= FrmDB.LoadChangeItemList; //��ȯ����
    if nCode < 0 then begin
      MemoLog.Lines.Add('ChangeItemList.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;

    nCode:= FrmDB.LoadWakeList;
    if nCode < 0 then begin
      MemoLog.Lines.Add('ItemUpgrade.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('���Ѳ��ϼ������...');


    nCode:= FrmDB.LoadDisassembleList;
    if nCode < 0 then begin
      MemoLog.Lines.Add('DisassembleList.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('�߼����ѷֽ���Ʒ�������...');

    nCode:= FrmDB.LoadDismantleList;         //�Ϲݺ���
    if nCode < 0 then begin
      MemoLog.Lines.Add('DismantleList.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      exit;
    end;
    MemoLog.Lines.Add('һ����ѷֽ���Ʒ�������...');

    nCheckCode := 7;
    nCode:= FrmDB.LoadStartPoint;
    if nCode < 0 then begin
      MemoLog.Lines.Add('StartPoint.txt : ��ȡ���ļ�ʱ����' + '����= ' + IntToStr(nCode));
      Close;
    end;

    FrmDB.LoadMissionData();
    MemoLog.Lines.Add('������Ϣ�������...');

    FrmDB.LoadMapDesc();
    MemoLog.Lines.Add('��ͼ˵����Ϣ�������...');


    nCheckCode := 8;
    MemoLog.Lines.Add('���ڼ��ص�ȯ��������...');
    nCode:=FrmDB.LoadShopItemList();              //ȯ����
    if nCode < 0 then MemoLog.Lines.Add('��ȯ�ٻ��̵��Ѽ���...')
    else MemoLog.Lines.Add('��ȯ�ٻ��̵���Ʒ����' + '[' + Inttostr(nCode) +']');

    MemoLog.Lines.Add('���ڼ��ص����������...');    //����
    nCode:=FrmDB.LoadFishItemList();
    if nCode < 0 then MemoLog.Lines.Add('������������Ѽ���...')
    else MemoLog.Lines.Add('���������Ʒ����' + '[' + Inttostr(nCode) +']');

    MemoLog.Lines.Add('���ڼ��ص�����Ʒ����...');    //���� �̺�Ʈ
    nCode:=FrmDB.LoadFishEventItemList();
    if nCode < 0 then MemoLog.Lines.Add('������Ʒ���ü������...')
    else MemoLog.Lines.Add('������Ʒ����' + '[' + Inttostr(nCode) +']');

    nCheckCode := 9;
    FrontEngine.Resume;
    MemoLog.Lines.Add('��Ϸ���������ʼ���ɹ�...');

    nCheckCode := 10;
    UserEngine.Initialize;
    MemoLog.Lines.Add('�����������������ɹ�..');

    if TestUpServer then begin      //�ο�
      MemoLog.Lines.Add(DeCodeString(DeCodeString('w]Mi`OXvfeDikWmsAyUfIWUis=cAYYoIfbgUYOSAV`NFLHseVDe?YqxvvP<@kAwQ'))); //���԰汾����������
    end;
  except
    MainOutMessage(format(sExceptionMsg, [nCheckCode]));
  end;
end;

procedure TFrmMain.MakeStoneMines();//004E5E88        //���� �ε�
var
  i,nW,nH:Integer;
  Envir:TEnvirnoment;
begin
  for i:=0 to g_MapManager.Count -1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[i]);
    if Envir.Flag.boMINE or Envir.Flag.boMINE2 or Envir.Flag.boMINE3 or Envir.Flag.boMINE4 then begin //���ʱ���
      for nW:=0 to Envir.m_nWidth - 1 do begin
        for nH:=0 to Envir.m_nHeight - 1 do begin
          //if (nW mod 2 = 0) and (nH mod 2 = 0) then
            TStoneMineEvent.Create(Envir,nW,nH,ET_MINE);
        end;
      end;
    end;      
  end;
end;
function TFrmMain.LoadClientFile():Boolean;
begin
  MemoLog.Lines.Add('���ڼ��ؿͻ��˰汾��Ϣ...');
  if not (g_Config.sClientFile1='') then g_Config.nClientFile1_CRC:=CalcFileCRC(g_Config.sClientFile1);
  if not (g_Config.sClientFile2='') then g_Config.nClientFile2_CRC:=CalcFileCRC(g_Config.sClientFile2);
  if not (g_Config.sClientFile3='') then g_Config.nClientFile3_CRC:=CalcFileCRC(g_Config.sClientFile3);

  if (g_Config.nClientFile1_CRC<>0) or (g_Config.nClientFile2_CRC<>0) or (g_Config.nClientFile3_CRC<>0) then begin
    Result:=True;
  end else begin
    MemoLog.Lines.Add('�ͻ��˰汾��Ϣ����ʧ�ܣ����� !setup.txt -> [setup] -> clientfile1..');
    MemoLog.Lines.Add('���ͻ����ں˸��Ƶ�M2�к�ȷ���� !setup.txt�пͻ��˵����֡�');
    Result:=TRUE;
  end;
end;
procedure TFrmMain.FormCreate(Sender: TObject);
var
  nX,nY:Integer;

ResourceString
  sGateIdx       = '  ����';
  sGateIPaddr    = '       ���ص�ַ';
  sGateListMsg   = '  ��������';
  sGateSendCount = '   ��������';
  sGateMsgCount  = '  ʣ������';
  sGateSendKB    = '  ����(KB)';
  sGateUserCount = '  ����';
begin
  Randomize;
  g_dwGameCenterHandle:=Str_ToInt(ParamStr(1),0);
  nX:=Str_ToInt(ParamStr(2),-1);
  nY:=Str_ToInt(ParamStr(3),-1);
  if (nX >= 0) or (nY >= 0) then begin
    Left:=nX;
    Top:=nY;
  end;
  SendGameCenterMsg(SG_FORMHANDLE,IntToStr(Self.Handle));


  LogUDP := TWSocket.Create(nil);

  GridGate.RowCount:= 21;
  GridGate.Cells[0,0]:=sGateIdx;
  GridGate.Cells[1,0]:=sGateIPaddr;
  GridGate.Cells[2,0]:=sGateListMsg;
  GridGate.Cells[3,0]:=sGateSendCount;
  GridGate.Cells[4,0]:=sGateMsgCount;
  GridGate.Cells[5,0]:=sGateSendKB;
  GridGate.Cells[6,0]:=sGateUserCount;

  {
  GridGate.Cells[0,1]:='0';
  GridGate.Cells[1,1]:='888.888.888.888:8888';
  GridGate.Cells[2,1]:='10000';
  GridGate.Cells[3,1]:='10000';
  GridGate.Cells[4,1]:='10000';
  GridGate.Cells[5,1]:='10000';
  }

  TestUpServer := False;  //�ο�

  GateSocket:=TServerSocket.Create(Owner);
  GateSocket.OnClientConnect    := GateSocketClientConnect;
  GateSocket.OnClientDisconnect := GateSocketClientDisconnect;
  GateSocket.OnClientError      := GateSocketClientError;
  GateSocket.OnClientRead       := GateSocketClientRead;

  DBSocket.OnConnect        := DBSocketConnect;
  DBSocket.OnError          := DBSocketError;
  DBSocket.OnRead           := DBSocketRead;

  Timer1.OnTimer            := Timer1Timer;
  RunTimer.OnTimer          := RunTimerTimer;
  StartTimer.OnTimer        := StartTimerTimer;
  SaveVariableTimer.OnTimer := SaveVariableTimerTimer;
  ConnectTimer.OnTimer      := ConnectTimerTimer;
  CloseTimer.OnTimer        := CloseTimerTimer;

  MemoLog.OnChange          := MemoLogChange;
  StartTimer.Enabled        := True;

  for nX := Low(g_TopInfo) to High(g_TopInfo) do
    g_TopInfo[nX] := nil;

     //����üũ
   g_SpeedHackCheck := 300;
   CurrentMerchantIndex := 0;
   g_SpeedHackCheckChar := '';
   SendGameCenterMsg(SG_STARTNOW, '����������Ϸ������...');
end;
procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
ResourceString
  sCloseServerYesNo = '��ȷ��Ҫ�ر���Ϸ��������';
  sCloseServerTitle = 'ȷ����Ϣ';
begin
  if not boServiceStarted then begin
//    Application.Terminate;
    exit;
  end;
  if g_boExitServer then begin
    boStartReady:=False;
    StopService();
//    Sleep(500);
    exit;
  end;
  CanClose:=False;
//  if MessageDlg('�Ƿ�ȷ���˳���������', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
  if Application.MessageBox(PChar(sCloseServerYesNo),PChar(sCloseServerTitle),MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    g_boExitServer:=True;
    CloseGateSocket();
    g_Config.boKickAllUser:=True;
    RunSocket.CloseAllGate;
    GateSocket.Close;
    CloseTimer.Enabled:=True;
{$IF IniSystem = 1}
    SaveSettings;
{$IFEND}
  end;
end;


procedure TFrmMain.FormShow(Sender: TObject);     //m2���� �������� ��ȣ
const
 InfoStr: array[1..10] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
 S: string;
 n, Len, i: DWORD;         // 1 3 5 �������
 Buf: PChar;
 Value: PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  VerInfoStr4 := 'Ľ�U�����K.10';
  if n > 0 then begin
   Buf := AllocMem(n);
   GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to 10 do
      if VerQueryValue(Buf, PChar('StringFileInfo\041203b5\' + InfoStr[i]), Pointer(Value), Len) then
      case i of
        1:VerInfoStr1 := Value;
        3:VerInfoStr2 := Value;
        5:VerInfoStr3 := Value;
      end;
     FreeMem(Buf, n);
  end;
end;

procedure TFrmMain.CloseTimerTimer(Sender: TObject);
ResourceString
  sCloseServer = '%s [���ڱ��������Ϣ(%d/%d)...]';
begin 
  Caption:=format(sCloseServer,[g_Config.sServerName,UserEngine.OnlinePlayObject,FrontEngine.SaveListCount]);
  if UserEngine.OnlinePlayObject = 0 then begin
    if FrontEngine.IsIdle then begin
      CloseTimer.Enabled:=False;
      Application.Terminate;
    end;
  end;
end;

procedure TFrmMain.SaveVariableTimerTimer(Sender: TObject);
begin
{$IF IniSystem = 1}
  SaveSettings;
{$ELSE}
  SaveItemNumber();
{$IFEND}
end;

procedure TFrmMain.GateSocketClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  RunSocket.CloseErrGate(Socket,ErrorCode);
end;

procedure TFrmMain.GateSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.CloseGate(Socket);
end;

procedure TFrmMain.GateSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.AddGate(Socket);
end;

procedure TFrmMain.GateSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RunSocket.SocketRead(Socket);
end;

procedure TFrmMain.RunTimerTimer(Sender: TObject);
begin
  if boStartReady then begin
     RunSocket.Run;
{$IF IDSOCKETMODE = TIMERENGINE}
    FrmIDSoc.Run;
{$IFEND}
    UserEngine.Run;
    g_GuildTerritory.Run;
{$IF USERENGINEMODE = TIMERENGINE}
      ProcessGameRun();
{$IFEND}
    //EventManager.Run;
    if nServerIndex = 0 then
      FrmSrvMsg.Run
    else FrmMsgClient.Run;
  end;
  Inc(n4EBD1C);
  if (GetTickCount - g_dwRunTick) > 250 then begin
    g_dwRunTick:=GetTickCount();
    nRunTimeMin:=n4EBD1C;
    if nRunTimeMax > nRunTimeMin then nRunTimeMax:=nRunTimeMin;
    n4EBD1C:=0;
  end;
  if boRemoteOpenGateSocket then begin
    if not boRemoteOpenGateSocketed then begin
      boRemoteOpenGateSocketed:=True;
      try
        if assigned(g_GateSocket) then begin
          g_GateSocket.Active:=True;
        end;
      except
        on e: Exception do begin
          MainOutMessage(E.Message);
        end;
      end;
    end;
  end;
end;

procedure TFrmMain.ConnectTimerTimer(Sender: TObject);
begin
  if DBSocket.Active then exit;
  DBSocket.Active:=True;
end;

procedure TFrmMain.ReloadConfig(Sender: TObject);
begin
try
{$IF IniSystem = 1}
  LoadSettings;
{$ELSE}
  LoadConfig();
{$IFEND}

//  LoadMonSayMsg();
  FrmIDSoc.Timer1Timer(Sender);
  if not (nServerIndex = 0) then begin
    if not FrmMsgClient.MsgClient.Active then begin
      FrmMsgClient.MsgClient.Active:=True;
    end;
  end;
  LogUDP.Close;
  LogUDP.Proto := 'UDP';
  LogUDP.Addr :=g_Config.sLogServerAddr;
  LogUDP.Port := inttostr(g_Config.nLogServerPort);
  LogUDP.Connect;
  LoadServerTable();
  LoadClientFile();
finally

end;
end;

procedure TFrmMain.MemoLogChange(Sender: TObject);
begin
  if MemoLog.Lines.Count > 500 then MemoLog.Clear;
end;

procedure TFrmMain.MemoLogDblClick(Sender: TObject);
begin
  ClearMemoLog();
end;

procedure TFrmMain.MENU_CONTROL_EXITClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_CONFClick(Sender: TObject);
begin
  ReloadConfig(Sender);
end;

procedure TFrmMain.MENU_CONTROL_CLEARLOGMSGClick(Sender: TObject);
begin
  ClearMemoLog();
end;

procedure TFrmMain.SpeedButton1Click(Sender: TObject);
begin
  ReloadConfig(Sender);
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_ITEMDBClick(Sender: TObject);
begin
  FrmDB.LoadItemsDB();
  MainOutMessage('���¼�����Ʒ���ݿ�ɹ�...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MAGICDBClick(Sender: TObject);
begin
  FrmDB.LoadMagicDB();
  MainOutMessage('���¼��ؼ������ݿ�ɹ�...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MONSTERDBClick(Sender: TObject);
begin
  FrmDB.LoadMonsterDB();
  MainOutMessage('���¼��ع������ݿ�ɹ�...');
end;

procedure TFrmMain.StartService;
var
  TimeNow: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec:Word;
  F: TextFile;
  Config:pTM2Config;
 
begin
  Config:=@g_Config;
  MENU_CONTROL_START.Enabled:=False;
  MENU_CONTROL_STOP.Enabled:=False;

  nRunTimeMax       := 99999;
  g_nSockCountMax   := 0;
  g_nUsrTimeMax     := 0;
  g_nHumCountMax    := 0;
  g_nMonTimeMax     := 0;
  g_nMonGenTimeMax  := 0;
  g_nMonProcTime    := 0;
  g_nMonProcTimeMin := 0;
  g_nMonProcTimeMax := 0;
  dwUsrRotCountMin  := 0;
  dwUsrRotCountMax  := 0;
  g_nProcessHumanLoopTime  := 0;
  m_nSaveDBError      := 0;
  g_dwHumLimit        := 30;
  g_dwHeroLimit       := 30;
  g_dwMonLimit        := 30;
  g_dwZenLimit        := 5;
  g_dwNpcLimit        := 5;
  g_dwSocLimit        := 10;
  nDecLimit         := 20;

  Config.sDBSocketRecvText := '';
  Config.boDBSocketWorking :=False;
  Config.nLoadDBErrorCount := 0;
  Config.nLoadDBCount      := 0;
  Config.nSaveDBCount      := 0;
  Config.nDBQueryID        := 0;
  Config.nItemNumber       := 0;
  Config.nItemNumberEx     :=High(Integer) div 2;
  boStartReady               := False;
  g_boExitServer             := False;
  boFilterWord               := True;
  Config.nWinLotteryCount  := 0;
  Config.nNoWinLotteryCount:= 0;
  Config.nWinLotteryLevel1 := 0;
  Config.nWinLotteryLevel2 := 0;
  Config.nWinLotteryLevel3 := 0;
  Config.nWinLotteryLevel4 := 0;
  Config.nWinLotteryLevel5 := 0;
  Config.nWinLotteryLevel6 := 0;
  FillChar(g_Config.GlobalVal, SizeOf(g_Config.GlobalVal), #0);
  FillChar(g_Config.GlobaDyMval, SizeOf(g_Config.GlobaDyMval), #0);


  LoadConfig();
  Memo              := MemoLog;
  nServerIndex      := 0;
  RunSocket         := TRunSocket.Create();
  MainLogMsgList    := TStringList.Create;
  LogStringList     := TStringList.Create;
  LogonCostLogList  := TStringList.Create;
  g_MapManager      := TMapManager.Create;
  ItemUnit          := TItemUnit.Create;
  MagicManager      := TMagicManager.Create;
  NoticeManager     := TNoticeManager.Create;
  g_GuildManager    := TGuildManager.Create;
  g_EventManager    := TEventManager.Create;
  g_CastleManager   := TCastleManager.Create;
  g_GuildTerritory  := TGTManager.Create;
  FrontEngine       := TFrontEngine.Create(True);
  gFireDragon       := TDragonSystem.Create;    //����
  UserEngine        := TUserEngine.Create();
  RobotManage       := TRobotManage.Create;
  g_MakeItemList    := TStringList.Create;
  g_ChangeItemList  := TStringList.Create;
  g_DismantleList   := TStringList.Create;
  g_DisassembleList := TStringList.Create;  //��������
  g_WakeItemList    := TStringList.Create;
  g_StartPoint      := TGList.Create;
  ServerTableList   := TList.Create;
  g_DenySayMsgList  := TQuickList.Create;
  BigMapList        := TStringList.Create;
  MiniMapList       := TStringList.Create;
  g_UnbindList      := TStringList.Create;
  LineNoticeList    := TStringList.Create;
  QuestDiaryList    := TList.Create;
  ItemEventList     := TStringList.Create;

  g_MonSayMsgList       := TStringList.Create;
  g_DisableMakeItemList := TGStringList.Create;
  g_EnableMakeItemList  := TGStringList.Create;
  g_DisableSellOffList  := TGStringList.Create;
  g_DisableMoveMapList  := TGStringList.Create;
  g_ItemNameList        := TGList.Create;
  g_DisableSendMsgList  := TGStringList.Create;
  g_MonDropLimitLIst    := TGStringList.Create;
  g_DisableTakeOffList  := TGStringList.Create;

  g_GameLogItemNameList := TGStringList.Create;
  g_DenyIPAddrList      := TGStringList.Create;
  g_DenyChrNameList     := TGStringList.Create;
  g_DenyAccountList     := TGStringList.Create;
  g_DenyHDDList         := TGStringList.Create;              //�����Ǿ����ϴ�.
  g_NoClearMonList      := TGStringList.Create;
  g_CompoundInfoList    := TGStringList.Create;   //�������ռ�
  g_UserCmdList         := TGStringList.Create;
  g_DisableConsignItemList := TGStringList.Create;     //��Ź
  g_DisableRentalItemList := TGStringList.Create;     //�뿩
  g_SetItemsList        := TList.Create;

  g_ItemBindIPaddr      :=TGList.Create;
  g_ItemBindAccount     :=TGList.Create;
  g_ItemBindCharName    :=TGList.Create;
  g_DecorationList      :=TList.Create;
//  n4EBBD0           := 0;


  g_MapEventListOfDropItem := TGList.Create;
  g_MapEventListOfPickUpItem := TGList.Create;
  g_MapEventListOfMine := TGList.Create;
  g_MapEventListOfWalk := TGList.Create;
  g_MapEventListOfRun := TGList.Create;
  
  InitializeCriticalSection(LogMsgCriticalSection);
  InitializeCriticalSection(ProcessMsgCriticalSection);
  InitializeCriticalSection(ProcessHumanCriticalSection);

  InitializeCriticalSection(Config.UserIDSection);
  InitializeCriticalSection(UserDBSection);

  g_DynamicVarList  := TList.Create;

  //------------
  G_ServerShopList  := TGList.Create; //ȯ����
  g_FishItmeList    := TGList.Create;    //����
  g_FishEventItmeList    := TGList.Create;    //���� �̺�Ʈ


  TimeNow:=Now();
  DecodeDate(TimeNow, Year, Month, Day);
  DecodeTime(TimeNow, Hour, Min, Sec, MSec);
  sLogFileName:=g_Config.sLogDir{'.\Log\'} + IntToStr(Year) + '-' + IntToStr2(Month) + '-' + IntToStr2(Day) + '.' + IntToStr2(Hour) + '-' + IntToStr2(Min) + '.txt';
  
  if not DirectoryExists(g_Config.sLogDir) then begin
    if CreateDir(Config.sLogDir) then begin
      AssignFile(F, sLogFileName);
      Rewrite(F);
      CloseFile(F);
    end;
  end;


  nShiftUsrDataNameNo := 1;

  DBSocket.Address  := g_Config.sDBAddr;
  DBSocket.Port     := g_Config.nDBPort;
//  DBSocket.Active   := True;

  sCaption        := g_Config.sServerName;
  Caption:= format('%s - %s',[g_sTitleName,sCaption]);
  LoadServerTable();

  //LogUDP.RemoteHost   := g_Config.sLogServerAddr;
//  LogUDP.RemotePort   := g_Config.nLogServerPort;
  LogUDP.Close;
  LogUDP.Proto := 'UDP';
  LogUDP.Addr :=g_Config.sLogServerAddr;
  LogUDP.Port := inttostr(g_Config.nLogServerPort);
  LogUDP.Connect;  
//  ConnectTimer.Enabled:= True;

  Application.OnIdle  := AppOnIdle;
  Application.OnException := OnProgramException;
  dwRunDBTimeMax        := GetTickCount();
  g_dwStartTick         := GetTickCount();
  Timer1.Enabled      := True;
//  StartTimer.Enabled  := True;

  boServiceStarted:=True;
  MENU_CONTROL_STOP.Enabled:=True;


end;

procedure TFrmMain.StopService;
var
  I: Integer;
  Config:pTM2Config;
  ThreadInfo:pTThreadInfo;
begin
  Config:=@g_Config;
  MENU_CONTROL_START.Enabled:=False;
  MENU_CONTROL_STOP.Enabled:=False;
  Timer1.Enabled:=False;
  RunTimer.Enabled:=False;
  FrmIDSoc.Close;
  GateSocket.Close;
  Memo:=nil;
  SaveItemNumber();
  g_CastleManager.Free;
  g_GuildTerritory.Free;
//  UserCastle.Save;
//  UserCastle.Free;

{$IF USERENGINEMODE = THREADENGINE}
  ThreadInfo:=@Config.UserEngineThread;
  ThreadInfo.boTerminaled:=True;
  if WaitForSingleObject(ThreadInfo.hThreadHandle,1000) <> 0 then begin
    SuspendThread(ThreadInfo.hThreadHandle);
  end;
{$IFEND}
{$IF DBSOCKETMODE = THREADENGINE}
  ThreadInfo:=@Config.DBSocketThread;
  ThreadInfo.boTerminaled:=True;
  if WaitForSingleObject(ThreadInfo.hThreadHandle,1000) <> 0 then begin
    SuspendThread(ThreadInfo.hThreadHandle);
  end;
{$IFEND}
  FrontEngine.Terminate();
//  FrontEngine.WaitFor;
  FrontEngine.Free;
  MagicManager.Free;
  UserEngine.Free;
  RobotManage.Free;
  RunSocket.Free;

  ConnectTimer.Enabled:=False;
  DBSocket.Close;

  MainLogMsgList.Free;
  LogStringList.Free;
  LogonCostLogList.Free;
  g_MapManager.Free;
  ItemUnit.Free;

  NoticeManager.Free;
  g_GuildManager.Free;
  for I := 0 to g_MakeItemList.Count - 1 do begin          //��������
    TStringList(g_MakeItemList.Objects[I]).Free;
  end;
  g_MakeItemList.Free;

  for I := 0 to g_ChangeItemList.Count - 1 do begin
    TStringList(g_ChangeItemList.Objects[I]).Free;
  end;
  g_ChangeItemList.Free;

  for I := 0 to g_DismantleList.Count - 1 do begin
    TStringList(g_DismantleList.Objects[I]).Free;
  end;
  g_DismantleList.Free;

  for I := 0 to g_DisassembleList.Count - 1 do begin
    TStringList(g_DisassembleList.Objects[I]).Free;
  end;
  g_DisassembleList.Free;

  for I := 0 to g_WakeItemList.Count - 1 do begin
    TStringList(g_WakeItemList.Objects[I]).Free;
  end;
  g_WakeItemList.Free;


  gFireDragon.Free;      //����

  g_StartPoint.Free;
  ServerTableList.Free;
  g_DenySayMsgList.Free;
  BigMapList.Free;
  MiniMapList.Free;
  g_UnbindList.Free;
  LineNoticeList.Free;
  QuestDiaryList.Free;
  ItemEventList.Free;

  for I := 0 to g_SetItemsList.Count - 1 do begin
    Dispose(pTSetItems(g_SetItemsList[I]));
  end;

  for I := 0 to g_CompoundInfoList.Count - 1 do begin           //�������ռ�
    Dispose(pTCompoundInfos(g_CompoundInfoList.Objects[I]));
  end;
  FreeAndNil(g_CompoundInfoList);             //�������ռ�
  
  g_MonSayMsgList.Free;
  g_DisableMakeItemList.Free;
  g_EnableMakeItemList.Free;
  g_DisableSellOffList.Free;
  g_DisableMoveMapList.Free;
  g_ItemNameList.Free;
  g_DisableSendMsgList.Free;
  g_MonDropLimitLIst.Free;
  g_DisableTakeOffList.Free;

  g_GameLogItemNameList.Free;
  g_DenyIPAddrList.Free;
  g_DenyChrNameList.Free;
  g_DenyHDDList.Free;                                  //�����Ǿ����ϴ�.
  g_DenyAccountList.Free;
  g_NoClearMonList.Free;
  g_UserCmdList.Free;

  FreeAndNil(g_DisableRentalItemList);   //�뿩�Ұ�
  FreeAndNil(g_DisableConsignItemList);       //��Ź
  FreeAndNil(g_ServerShopList);     //ȯ����
  FreeAndNil(g_FishItmeList);    //����
  FreeAndNil(g_FishEventItmeList);  //���� �̺�Ʈ
  FreeAndNil(g_SetItemsList);

  for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindIPaddr.Items[I]));
  end;
  for I := 0 to g_ItemBindAccount.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindAccount.Items[I]));
  end;
  for I := 0 to g_ItemBindCharName.Count - 1 do begin
    DisPose(pTItemBind(g_ItemBindCharName.Items[I]));
  end;
  g_ItemBindIPaddr.Free;
  g_ItemBindAccount.Free;
  g_ItemBindCharName.Free;

  DeleteCriticalSection(LogMsgCriticalSection);
  DeleteCriticalSection(ProcessMsgCriticalSection);
  DeleteCriticalSection(ProcessHumanCriticalSection);

  DeleteCriticalSection(Config.UserIDSection);
  DeleteCriticalSection(UserDBSection);


  for I := 0 to g_DynamicVarList.Count - 1 do begin
    Dispose(pTDynamicVar(g_DynamicVarList.Items[I]));
  end;
  g_DynamicVarList.Free;
  
  boServiceStarted:=False;
  MENU_CONTROL_START.Enabled:=True;
end;

procedure TFrmMain.MENU_CONTROL_STARTClick(Sender: TObject);
begin
  StartService();
end;

procedure TFrmMain.MENU_CONTROL_STOPClick(Sender: TObject);
begin
  StopService();
end;

procedure TFrmMain.MENU_HELP_ABOUTClick(Sender: TObject);
begin
  frmRegister := TfrmRegister.Create(Owner);
  frmRegister.Open();
  frmRegister.Free;
end;

procedure TFrmMain.DBSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  MainOutMessage('���ݿ������(' + Socket.RemoteAddress + ':' +  IntToStr(Socket.RemotePort) + ')���ӳɹ�...');
end;

procedure TFrmMain.MENU_OPTION_SERVERCONFIGClick(Sender: TObject);
begin
  FrmServerValue:=TFrmServerValue.Create(Owner);
  FrmServerValue.Top:=Self.Top + 20;
  FrmServerValue.Left:=Self.Left;
  FrmServerValue.AdjuestServerConfig();
  FrmServerValue.Free;
end;

procedure TFrmMain.MENU_OPTION_GENERALClick(Sender: TObject);
begin
  frmGeneralConfig:=TfrmGeneralConfig.Create(Owner);
  frmGeneralConfig.Top:=Self.Top + 20;
  frmGeneralConfig.Left:=Self.Left;
  frmGeneralConfig.Open();
  frmGeneralConfig.Free;
  Caption:=g_Config.sServerName;
end;

procedure TFrmMain.MENU_OPTION_GAMEClick(Sender: TObject);
begin
  frmGameConfig:=TfrmGameConfig.Create(Owner);
  frmGameConfig.Top:=Self.Top + 20;
  frmGameConfig.Left:=Self.Left;
  frmGameConfig.Open;
  frmGameConfig.Free;
end;


procedure TFrmMain.MENU_OPTION_FUNCTIONClick(Sender: TObject);
begin
  frmFunctionConfig:=TfrmFunctionConfig.Create(Owner);
  frmFunctionConfig.Top:=Self.Top + 20;
  frmFunctionConfig.Left:=Self.Left;
  frmFunctionConfig.Open;
  frmFunctionConfig.Free;
end;

procedure TFrmMain.G1Click(Sender: TObject);
begin
  frmGameCmd:=TfrmGameCmd.Create(Owner);
  frmGameCmd.Top:=Self.Top + 20;
  frmGameCmd.Left:=Self.Left;
  frmGameCmd.Open;
  frmGameCmd.Free;
end;

procedure TFrmMain.MENU_OPTION_MONSTERClick(Sender: TObject);
begin
  frmMonsterConfig:=TfrmMonsterConfig.Create(Owner);
  frmMonsterConfig.Top:=Self.Top + 20;
  frmMonsterConfig.Left:=Self.Left;
  frmMonsterConfig.Open;
  frmMonsterConfig.Free;
end;
procedure TFrmMain.MENU_CONTROL_RELOAD_MONSTERSAYClick(Sender: TObject);
begin
  UserEngine.ClearMonSayMsg();
  LoadMonSayMsg();
  MainOutMessage('���¼��ع���˵�����óɹ�...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_DISABLEMAKEClick(Sender: TObject);
begin
  LoadDisableTakeOffList();
  LoadDisableMakeItem();
  LoadDisableConsignItem();      //��Ź
  LoadDisableRentalItem(); //�뿩�Ұ�

  LoadAllowSellOffItem();
  LoadDisableMoveMap();
  ItemUnit.LoadCustomItemName();
  LoadDisableSendMsgList();
  LoadGameLogItemNameList();
  LoadItemBindIPaddr();
  LoadItemBindAccount();
  LoadItemBindCharName();
  LoadDenyIPAddrList();
  LoadDenyAccountList();
  LoadDenyChrNameList();
  LoadDenyHDDList();                   //�����Ǿ����ϴ�.
  LoadNoClearMonList();
  FrmDB.LoadAdminList();
  FrmDB.LoadColumnList();   //ȫ����
  MainOutMessage('���¼��ؽ������óɹ�...');
  MainOutMessage('���¼����������óɹ�...');
  MainOutMessage('���¼��ز����������óɹ�...');
  MainOutMessage('���¼��ز��ɼ������óɹ�...');
  MainOutMessage('���¼��ز��ɳ������óɹ�...');
  MainOutMessage('���¼�����������������óɹ�...');
  MainOutMessage('���¼��ص��Զ�����Ʒ�������óɹ�...');
  MainOutMessage('���¼��ص���Ʒ��־���óɹ�... ');
  MainOutMessage('���¼��ذ󶨵�½���óɹ�...');
  MainOutMessage('���¼��ؽ�ֹ��½���óɹ�...');
  MainOutMessage('���¼��ز�����������óɹ�...');
  MainOutMessage('���¼��ع���Ա���óɹ�...');
  MainOutMessage('���¼��سƺ����óɹ�...');
end;


procedure TFrmMain.MENU_CONTROL_RELOAD_STARTPOINTClick(Sender: TObject);
begin
  FrmDB.LoadStartPoint();
  MainOutMessage('���¼��س����ص����óɹ�....');
end;

procedure TFrmMain.MENU_CONTROL_GATE_OPENClick(Sender: TObject);
ResourceString
  sGatePortOpen = '��Ϸ����(%s:%d)�Ѵ�...';
begin
  if not GateSocket.Active then begin
    GateSocket.Active:=True;
    MainOutMessage(format(sGatePortOpen,[GateSocket.Address,GateSocket.Port]));
  end;
end;

procedure TFrmMain.MENU_CONTROL_GATE_CLOSEClick(Sender: TObject);
begin
  CloseGateSocket();
end;
procedure TFrmMain.CloseGateSocket;
var
  I: Integer;
ResourceString
  sGatePortClose = '��Ϸ����(%s:%d)�ѹر�...';
begin
  if GateSocket.Active then begin
    for I := 0 to GateSocket.Socket.ActiveConnections - 1 do begin
      GateSocket.Socket.Connections[I].Close;
    end;
    GateSocket.Active:=False;
    MainOutMessage(format(sGatePortClose,[GateSocket.Address,GateSocket.Port]));
  end;
end;

procedure TFrmMain.MENU_CONTROLClick(Sender: TObject);
begin
  if GateSocket.Active then begin
    MENU_CONTROL_GATE_OPEN.Enabled:=False;
    MENU_CONTROL_GATE_CLOSE.Enabled:=True;
  end else begin
    MENU_CONTROL_GATE_OPEN.Enabled:=True;
    MENU_CONTROL_GATE_CLOSE.Enabled:=False;
  end;
end;

procedure UserEngineProcess(Config:pTM2Config;ThreadInfo:pTThreadInfo);
var
  nRunTime  :Integer;
  dwRunTick :LongWord;
begin
  l_dwRunTimeTick:=0;
  dwRunTick:=GetTickCount();
  ThreadInfo.dwRunTick:=dwRunTick;
  while not ThreadInfo.boTerminaled do begin
    nRunTime:=GetTickCount - ThreadInfo.dwRunTick;
    if ThreadInfo.nRunTime < nRunTime then ThreadInfo.nRunTime:=nRunTime;
    if ThreadInfo.nMaxRunTime < nRunTime then ThreadInfo.nMaxRunTime:=nRunTime;
    if GetTickCount - dwRunTick >= 1000 then begin
      dwRunTick:=GetTickCount();
      if ThreadInfo.nRunTime > 0 then Dec(ThreadInfo.nRunTime);
    end;
      
    ThreadInfo.dwRunTick:=GetTickCount();
    ThreadInfo.boActived:=True;
    ThreadInfo.nRunFlag:=125;
    if Config.boThreadRun then
      ProcessGameRun();
    Sleep(1);
  end;
end;
procedure UserEngineThread(ThreadInfo:pTThreadInfo);stdcall;
var
  nErrorCount:Integer;
ResourceString
  sExceptionMsg = '[Exception] UserEngineThread ErrorCount = %d';
begin
  nErrorCount:=0;
  while True do begin
    try
      UserEngineProcess(ThreadInfo.Config,ThreadInfo);
      break;
    except
      Inc(nErrorCount);
      if nErrorCount > 10 then break;
      MainOutMessage(format(sExceptionMsg,[nErrorCount]));
    end;
  end;
  ExitThread(0);
end;
procedure ProcessGameRun();
var
  I:Integer;
begin
      EnterCriticalSection(ProcessHumanCriticalSection);
      try
        UserEngine.PrcocessData;
        g_EventManager.Run;
        RobotManage.Run;
        if GetTickCount - l_dwRunTimeTick > 10000 then begin
          l_dwRunTimeTick:=GetTickCount();
          g_GuildManager.Run;
          //CastleManager.Run;
          //UserCastle.Run;
          g_CastleManager.Run;
          g_DenySayMsgList.Lock;
          try
            for I:=g_DenySayMsgList.Count - 1 downto 0 do begin
              if GetTickCount > LongWord(g_DenySayMsgList.Objects[I]) then begin
                g_DenySayMsgList.Delete(I);
              end;
            end;
          finally
            g_DenySayMsgList.UnLock;
          end;
        end;
      finally
        LeaveCriticalSection(ProcessHumanCriticalSection);
      end;
end;

function GetHardDiskSerial(const DriveLetter: Char): string;
var 
  NotUsed:     DWORD; 
  VolumeFlags: DWORD; 
  VolumeInfo:  array[0..MAX_PATH] of Char; 
  VolumeSerialNumber: DWORD; 
begin 
  GetVolumeInformation(PChar(DriveLetter + ':\'),
    nil, SizeOf(VolumeInfo), @VolumeSerialNumber, NotUsed,
    VolumeFlags, nil, 0);
  Result := Format('%8.8X',[VolumeSerialNumber])
end;

function GetMacAddress(const ServerName: string): string;
type
  TNetTransportEnum = function(ServerName: PWideChar; Level: DWORD;
      var Buffer: Pointer; PrefMaxLen: LongInt; var EntriesRead: DWORD;
      var TotalEntries: DWORD; var ResumeHandle: DWORD): DWORD; stdcall;

  TNetApiBufferFree = function(Buffer: Pointer): DWORD; stdcall;

  PTransportInfo = ^TTransportInfo;
  TTransportInfo = record
        QualityOfService: DWORD;
        NumberOfVCS: DWORD;
        TransportName: PWChar;
        TransportAddress: PWChar;
        WANISH: boolean;
  end;
var
  ErrorCode, ResumeHandle, EntriesRead, TotalEntries: DWORD;
  LibHandle: THandle;
  MachineName, MacAddr, Retvar: string;
  Buffer: Pointer;
  Info: PTransportInfo;
  NetTransportEnum: TNetTransportEnum;
  NetApiBufferFree: TNetApiBufferFree;
  ServerNameW: array[0..128] of WideChar;
  EntryIndex, MacAddrIndex, RetVarIndex: Integer;
begin
  MachineName := Trim(ServerName);
  Retvar := '00500900300700300';
  if (MachineName <> '') and (Length(MachineName) >= 2) then
  begin
        if Copy(MachineName, 1, 2) <> '\\' then
            MachineName := '\\' + MachineName
  end;
  Buffer := nil;
  ResumeHandle := 0;
  LibHandle := LoadLibrary('NETAPI32.DLL');

  if LibHandle <> 0 then
  begin
        @NetTransportEnum := GetProcAddress(LibHandle, 'NetWkstaTransportEnum');
        @NetApiBufferFree := GetProcAddress(LibHandle, 'NetApiBufferFree');

        StringToWideChar(MachineName, ServerNameW, 129);
        ErrorCode := NetTransportEnum(ServerNameW, 0, Buffer, -1, EntriesRead,
            TotalEntries, ResumeHandle);
    if ErrorCode = 0 then
    begin
        Info := Buffer;

        for EntryIndex := 1 to EntriesRead do
        begin
            if Pos('TCPIP', UpperCase(Info^.TransportName)) <> 0 then
            begin
                RetVarIndex := 1;
                MacAddr := Info^.TransportAddress;

                for MacAddrIndex := 1 to 12 do
                begin
                    RetVar[RetVarIndex] := MacAddr[MacAddrIndex];
                    Inc(RetVarIndex);
                    if RetVarIndex in [3,6,9,12,15] then
                        Inc(RetVarIndex);
                end;
            end;
            Inc(Info);
        end;
        if Buffer <> nil then
            NetApiBufferFree(Buffer);
    end;
    try
        FreeLibrary(LibHandle);
    except
          // Silent Error
    end;
  end;
  Result := RetVar;
end;

procedure TFrmMain.MENU_VIEW_GATEClick(Sender: TObject);
begin
  MENU_VIEW_GATE.Checked:= not MENU_VIEW_GATE.Checked;
  GridGate.Visible:=MENU_VIEW_GATE.Checked;
end;

procedure TFrmMain.MENU_VIEW_SESSIONClick(Sender: TObject);
begin
  frmViewSession:=TfrmViewSession.Create(Owner);
  frmViewSession.Top:=Top + 20;
  frmViewSession.Left:=Left;
  frmViewSession.Open();
  frmViewSession.Free;
end;

procedure TFrmMain.MENU_VIEW_ONLINEHUMANClick(Sender: TObject);
begin
  frmViewOnlineHuman:=TfrmViewOnlineHuman.Create(Owner);
  frmViewOnlineHuman.Top:=Top + 20;
  frmViewOnlineHuman.Left:=Left;
  frmViewOnlineHuman.Open(nil);
  frmViewOnlineHuman.Free;
end;

procedure TFrmMain.MENU_VIEW_LEVELClick(Sender: TObject);
begin
  frmViewLevel:=TfrmViewLevel.Create(Owner);
  frmViewLevel.Top:=Top + 20;
  frmViewLevel.Left:=Left;
  frmViewLevel.Open();
  frmViewLevel.Free;
end;

procedure TFrmMain.MENU_VIEW_LISTClick(Sender: TObject);
begin
  frmViewList:=TfrmViewList.Create(Owner);
  frmViewList.Top:=Top + 20;
  frmViewList.Left:=Left;
  frmViewList.Open();
  frmViewList.Free;
end;

procedure TFrmMain.MENU_MANAGE_ONLINEMSGClick(Sender: TObject);
begin
  frmOnlineMsg:=TfrmOnlineMsg.Create(Owner);
  frmOnlineMsg.Top:=Top + 20;
  frmOnlineMsg.Left:=Left;
  frmOnlineMsg.Open();
  frmOnlineMsg.Free;
end;


procedure TFrmMain.SetMenu;
begin
  FrmMain.Menu:=MainMenu;
end;

procedure TFrmMain.MENU_VIEW_KERNELINFOClick(Sender: TObject);
begin
  frmViewKernelInfo:=TfrmViewKernelInfo.Create(Owner);
  frmViewKernelInfo.Top:=Top + 20;
  frmViewKernelInfo.Left:=Left;
  frmViewKernelInfo.Open();
  frmViewKernelInfo.Free;
end;

procedure TFrmMain.MENU_TOOLS_MERCHANTClick(Sender: TObject);
begin
  frmConfigMerchant:=TfrmConfigMerchant.Create(Owner);
  frmConfigMerchant.Top:=Top + 20;
  frmConfigMerchant.Left:=Left;
  frmConfigMerchant.Open(nil);
  frmConfigMerchant.Free;
end;

procedure TFrmMain.MENU_OPTION_ITEMFUNCClick(Sender: TObject);
begin
  frmItemSet:=TfrmItemSet.Create(Owner);
  frmItemSet.Top:=Top + 20;
  frmItemSet.Left:=Left;
  frmItemSet.Open();
  frmItemSet.Free;
end;

procedure TFrmMain.ClearMemoLog;
begin
 if Application.MessageBox('��ȷ��Ҫɾ����¼�� ','ȷ����Ϣ',MB_YESNO + MB_ICONQUESTION) = mrYes then begin
   MemoLog.Clear;
 end;
end;

procedure TFrmMain.MENU_TOOLS_MONGENClick(Sender: TObject);
begin
  frmConfigMonGen:=TfrmConfigMonGen.Create(Owner);
  frmConfigMonGen.Top:=Top + 20;
  frmConfigMonGen.Left:=Left;
  frmConfigMonGen.Open(nil);
  frmConfigMonGen.Free;
end;

procedure TFrmMain.MyMessage(var MsgData: TWmCopyData);
var
  sData:String;
  wIdent:Word;
  TopHeader: TTopHeader;
begin
  wIdent:=HiWord(MsgData.From);
//  ProgramType:=TProgamType(LoWord(MsgData.From));
  sData:=StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of    //
    GS_QUIT: begin
      g_boExitServer:=True;
      CloseGateSocket();
      g_Config.boKickAllUser:=True;
      CloseTimer.Enabled:=True;
    end;
    1: ;
    2: ;
    3: ;
    1000: begin
        MsgData.Result := 1;
      end;
    1001: begin
        TopHeader := pTTopHeader(MsgData.CopyDataStruct^.lpData)^;
        if (TopHeader.btType in [0..14]) then begin
          if (TopHeader.wCount > 0) then begin
            SetLength(g_TopInfo[TopHeader.btType], TopHeader.wCount);
            Move(PChar(MsgData.CopyDataStruct.lpData)[SizeOf(TopHeader)], g_TopInfo[TopHeader.btType][0], TopHeader.wCount * SizeOf(TTopInfo));
          end else g_TopInfo[TopHeader.btType] := nil;
        end;
      end;
  end;    // case
end;

procedure TFrmMain.MENU_TOOLS_IPSEARCHClick(Sender: TObject);
var
  sIPaddr:String;
begin
  sIPaddr:=InputBox('IP����','����IP��ַ���ҡ�','127.0.0.1');
  if not IsIPaddr(sIPaddr) then begin
    Application.MessageBox('��������Ч��IP��ַ�� ','����',MB_OK + MB_ICONERROR);
    exit;
  end;
  MemoLog.Lines.Add(format('%s:%s',[sIPaddr,GetIPLocal(sIPaddr)]));
end;


procedure TFrmMain.MENU_MANAGE_CASTLEClick(Sender: TObject);
begin
  frmCastleManage:=TfrmCastleManage.Create(Owner);
  frmCastleManage.Top:=Top + 20;
  frmCastleManage.Left:=Left;
  frmCastleManage.Open();
  frmCastleManage.Free;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TMemIniFile;
begin
  ini := TMemIniFile.Create(g_Config.PosFile);
  ini.WriteInteger('GameServer','Left',frmMain.Left);
  ini.WriteInteger('GameServer','Top',frmMain.Top);
  ini.UpdateFile;
  ini.Free; 
end;

procedure TFrmMain.MENU_TOOLS_GAMESHOPClick(Sender: TObject);
begin
  frmConfigGameShop:=TfrmConfigGameShop.Create(Owner);
  frmConfigGameShop.Top:=Top + 20;
  frmConfigGameShop.Left:=Left;
  frmConfigGameShop.Open();
  frmConfigGameShop.Free;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_QFUNCTIONClick(Sender: TObject);
begin
  if g_FunctionNPC<> nil then begin
    g_FunctionNPC.ClearScript;
    g_FunctionNPC.LoadNpcScript;
    MainOutMessage('���¼���QFunction�������...');
  end;
end;

procedure TFrmMain.MENU_MANAGE_GUILDClick(Sender: TObject);
begin
  frmGuildManage := TfrmGuildManage.Create(Owner);
  frmGuildManage.Top := Top + 20;
  frmGuildManage.Left := Left;
  frmGuildManage.Open();
  frmGuildManage.Free;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_ReLoaduserClick(Sender: TObject);     //������ɾ�
begin
  LoadUserCmdList();
  MainOutMessage('���¼����û������������...');
end;


procedure TFrmMain.MENU_CONTROL_RELOAD_GameShopClick(Sender: TObject);
begin
  FrmDB.LoadShopItemList();
  MainOutMessage('���¼��������������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_FISHClick(Sender: TObject);
begin
  FrmDB.LoadFishItemList();
  MainOutMessage('���¼��ص�����Ʒ�������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MINIMAPClick(Sender: TObject);
begin
  FrmDB.LoadMinMap();
  g_MapManager.ReSetMinMap();
  MainOutMessage('���¼���С��ͼ�������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_BIGMAPClick(Sender: TObject);
begin
  FrmDB.LoadBigMap();
  g_MapManager.ReSetBigMap();
  MainOutMessage('���¼��ش��ͼ�������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MAKEITEMClick(Sender: TObject);
begin
  FrmDB.LoadMakeItemList();
  MainOutMessage('���¼���������Ʒ�������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_CHANGITEMClick(Sender: TObject);
begin
  FrmDB.LoadChangeItemList();
  MainOutMessage('���¼�����Ʒת���������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_DISASSEMBLEClick(Sender: TObject);
begin
  FrmDB.LoadDismantleList();         //�Ϲݺ���
  MainOutMessage('���¼��طֽ���Ʒ�������...');
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_QMANAGEClick(Sender: TObject);
begin
  if g_ManageNPC<> nil then begin
    g_ManageNPC.ClearScript;
    g_ManageNPC.LoadNpcScript;
    MainOutMessage('���¼���QManage�������...');
  end;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_ROBOTClick(Sender: TObject);
begin
  if g_RobotNPC <> nil then begin
    g_RobotNPC.ClearScript();
    g_RobotNPC.LoadNpcScript();
    RobotManage.RELOADROBOT();
    MainOutMessage('���¼���Robot�������...');
  end;
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_MONITEMClick(Sender: TObject);
var
  i: Integer;
  Monster: pTMonInfo;
begin
  try
    for i := 0 to UserEngine.MonsterList.Count - 1 do begin
      Monster := UserEngine.MonsterList.Items[i];
      FrmDB.LoadMonitems(Monster.sName, Monster.ItemList);
    end;
    MainOutMessage('���¼��ع��ﱬ�����...');
  except
    MainOutMessage('���¼��ع��ﱬ��ʧ��...');
  end;
end;

procedure TFrmMain.MENU_OPTION_HEROClick(Sender: TObject);
begin
  frmHeroConfig := TfrmHeroConfig.Create(Owner);
  frmHeroConfig.Top := Top;
  frmHeroConfig.Left := Left;
  frmHeroConfig.Open();
  frmHeroConfig.Free;
end;

procedure TFrmMain.MENU_MANAGE_SYSClick(Sender: TObject);
begin
  frmSysManager := TfrmSysManager.Create(Owner);
  frmSysManager.Top := Top + 20;
  frmSysManager.Left := Left;
  frmSysManager.Open();
  frmSysManager.Free;
end;

procedure TFrmMain.ButtonSendClick(Sender: TObject);         //ä�ýý���
var
  Msg:string;
  PlayObject:TPlayObject;
begin
  Msg:=ChatEdit.Text;
  if Trim(Msg) <> '' then begin
    if Trim(GmEdit.Text) <> '' then
      PlayObject := UserEngine.GetPlayObject(GmEdit.Text);
    if PlayObject <> nil then begin
      PlayObject.ProcessUserLineMsg(Trim(Msg));
    end;
  end;
  ChatEdit.Text:='';
end;

procedure TFrmMain.ChatEditKeyPress(Sender: TObject; var Key: Char);  //ä�ýý���
var
  Msg:string;
  PlayObject:TPlayObject;
begin
try
  case Ord(Key) of
    13:
      begin
        Msg:=ChatEdit.Text;
        if Trim(Msg) <> '' then begin
          if Trim(GmEdit.Text) <> '' then
            PlayObject := UserEngine.GetPlayObject(GmEdit.Text);
          if PlayObject <> nil then begin
              PlayObject.ProcessUserLineMsg(Msg);
          end;
        end;
        ChatEdit.Text:='';
      end;
  end;
finally
end;
end;


procedure TFrmMain.GeneralMsgChange(Sender: TObject);
begin
  if GeneralMsg.Lines.Count > 500 then GeneralMsg.Clear; 
end;

procedure TFrmMain.CryMsgChange(Sender: TObject);
begin
    if CryMsg.Lines.Count > 500 then CryMsg.Clear;
end;

procedure TFrmMain.WhisperMsgChange(Sender: TObject);
begin
    if WhisperMsg.Lines.Count > 500 then WhisperMsg.Clear;
end;

procedure TFrmMain.ForGmMsgChange(Sender: TObject);
begin
    if ForGmMsg.Lines.Count > 500 then ForGmMsg.Clear;
end;

procedure TFrmMain.GuildMsgChange(Sender: TObject);
begin
    if GuildMsg.Lines.Count > 500 then GuildMsg.Clear;
end;

procedure TFrmMain.GroupMsgChange(Sender: TObject);
begin
    if GroupMsg.Lines.Count > 500 then GroupMsg.Clear;
end;

procedure TFrmMain.VoiceMsgChange(Sender: TObject);
begin
    if VoiceMsg.Lines.Count > 500 then VoiceMsg.Clear;
end;

procedure TFrmMain.SellMsgChange(Sender: TObject);
begin
    if SellMsg.Lines.Count > 500 then SellMsg.Clear;
end;

procedure TFrmMain.LoverMsgChange(Sender: TObject);
begin
    if LoverMsg.Lines.Count > 500 then LoverMsg.Clear;
end;

procedure TFrmMain.MasterMsgChange(Sender: TObject);
begin
    if MasterMsg.Lines.Count > 500 then MasterMsg.Clear;
end;

procedure TFrmMain.AllMsgChange(Sender: TObject);
begin
    if AllMsg.Lines.Count > 500 then AllMsg.Clear;
end;

procedure TFrmMain.CommandMsgChange(Sender: TObject);
begin
  if CommandMsg.Lines.Count > 500 then CommandMsg.Clear;
end;

procedure TFrmMain.MENU_VIEW_COMClick(Sender: TObject);
begin
  FrmViewCompoundInfo.Open();
end;

procedure TFrmMain.MENU_VIEW_QUESTClick(Sender: TObject);
begin
  {QuestInfoForm := TQuestInfoForm.Create(Owner);
  QuestInfoForm.Top := Top + 20;
  QuestInfoForm.Left := Left;
  QuestInfoForm.Open();
  QuestInfoForm.Free;  }
end;

procedure TFrmMain.MENU_CONTROL_RELOAD_BENClick(Sender: TObject);     //�����Ǿ����ϴ�.
begin
  LoadDenyIPAddrList();
  MainOutMessage('���¼��ؽ�ֹIP��¼�������...');
  LoadDenyAccountList();
  MainOutMessage('���¼��ؽ�ֹ�˺ŵ�¼�������...');
  LoadDenyChrNameList();
  MainOutMessage('���¼��ؽ�ֹ��ɫ��¼�������...');
  LoadDenyHDDList();
  MainOutMessage('���¼��ؽ�ֹӲ�����¼�������...');
end;

initialization
begin
  {---- Adjust global SVN revis ion ----}
  //SVNRevision('$Id: svMain.pas 562 2007-01-19 16:33:33Z sean $');
end;
finalization
begin

end;

end.
