unit GateShare;

interface
uses
  svn, SysUtils, Classes, Messages, JSocket, SyncObjs,IniFiles, Grobal2, Windows;
const
  GATEMAXSESSION      = 1000;
  MSGMAXLENGTH        = 20000;
  SENDCHECKSIZE       = 512;
  SENDCHECKSIZEMAX    = 4096;
type
  TGList = class(TList)
  private
    GLock: TRTLCriticalSection;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Lock;
    procedure UnLock;
  end;

  TSockaddr = record
    nIPaddr: Integer;
    nCount: Integer;
    dwIPCountTick1: LongWord;
    nIPCount1: Integer;
    dwIPCountTick2: LongWOrd;
    nIPCount2: Integer;
    dwDenyTick: LongWord;
    nIPDenyCount: Integer;
  end;
  pTSockaddr = ^TSockaddr;

  TBlockIPMethod = (mDisconnect,mBlock,mBlockList);
  TSessionInfo = record
    Socket           :TCustomWinSocket;//45AA8C
    sSocData         :String;          //45AA90
    sSendData        :String;          //45AA94
    nUserListIndex   :Integer;         //45AA98
    nPacketIdx       :Integer;         //45AA9C
    nPacketErrCount  :Integer;         //45AAA0  //数据包序号重复计数（客户端用封包发送数据检测）
    boStartLogon     :Boolean;         //45AAA4
    boSendLock       :Boolean;         //45AAA5
    boOverNomSize    :Boolean;
    nOverNomSizeCount:ShortInt; 
    dwSendLatestTime :LongWord;        //45AAA8
    nCheckSendLength :Integer;         //45AAAC
    boSendAvailable  :Boolean;         //45AAB0
    boSendCheck      :Boolean;         //45AAB1
    dwTimeOutTime    :LongWord; //0x28
    nReceiveLength   :Integer;         //45AAB8
    dwReceiveTick    :LongWord;        //45AABC Tick
    nSckHandle       :Integer;         //45AAC0
    sRemoteAddr      :String;          //45AAC4
    dwSayMsgTick     :LongWord;        //发言间隔控制
    dwHitTick        :LongWord;        //攻击时间
  end;
  
  pTSessionInfo =^TSessionInfo;
  TSendUserData = record
    nSocketIdx    :Integer;  //0x00
    nSocketHandle :Integer;  //0x04
    sMsg          :String;   //0x08
  end;
  pTSendUserData = ^TSendUserData;
  procedure AddMainLogMsg(Msg:String;nLevel:Integer);
  procedure LoadAbuseFile();
  procedure LoadBlockIPFile();
  procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  CS_MainLog                  :TCriticalSection;
  CS_FilterMsg                :TCriticalSection;
  MainLogMsgList              :TStringList;
  nShowLogLevel               :Integer = 3;
  GateClass                   :String  = 'GameGate';
  GateName                    :String  = '游戏通讯网关';
  TitleName                   :String  = '龙之传奇';
  ServerAddr                  :String  = '127.0.0.1';
  ServerPort                  :Integer = 5000;
  GateAddr                    :String  = '0.0.0.0';
  GatePort                    :Integer = 7200;
  boStarted                   :Boolean = False;
  boClose                     :Boolean = False;
  boShowBite                  :Boolean = True;  //显示B 或 KB
  boServiceStart              :Boolean = True;
  boGateReady                 :Boolean = True;  //0045AA74 网关是否就绪
  boCheckServerFail           :Boolean = False;  //网关 <->游戏服务器之间检测是否失败（超时）
//  dwCheckServerTimeOutTime    :LongWord = 60 * 1000 ;//网关 <->游戏服务器之间检测超时时间长度
  dwCheckServerTimeOutTime    :LongWord = 3 * 60 * 1000 ;//网关 <->游戏服务器之间检测超时时间长度
  AbuseList                   :TStringList; //004694F4
  SessionArray                :Array [0..GATEMAXSESSION -1] of TSessionInfo;
  SessionCount                :Integer;  //0x32C 连接会话数
  boShowSckData               :Boolean;  //0x324 是否显示SOCKET接收的信息

  g_dwGameCenterHandle: THandle;

  sReplaceWord                :String = '*';
  ReviceMsgList               :TList;    //0x45AA64
  SendMsgList                 :TList;    //0x45AA68
  nCurrConnCount              :Integer;
  boSendHoldTimeOut           :Boolean;
  dwSendHoldTick              :LongWord;
  n45AA80                     :Integer;
  n45AA84                     :Integer;
  dwCheckRecviceTick          :LongWord;
  dwCheckRecviceMin           :LongWord;
  dwCheckRecviceMax           :LongWord;

  dwCheckServerTick           :LongWord;
  dwCheckServerTimeMin        :LongWord;  
  dwCheckServerTimeMax        :LongWord;
  SocketBuffer                :PChar;    //45AA5C
  nBuffLen                    :Integer;  //45AA60
  List_45AA58                 :TList;
  boDecodeMsgLock             :Boolean;
  dwProcessReviceMsgTimeLimit :LongWord;
  dwProcessSendMsgTimeLimit   :LongWord;
  BlockIPList                 :TStringList;  //禁止连接IP列表
  TempBlockIPList             :TStringList;  //临时禁止连接IP列表
  CurrIPaddrList              :TGList;
  nMaxConnOfIPaddr            :Integer = 50;
  nMaxClientPacketSize        :Integer = 7000;
  nNomClientPacketSize        :Integer = 150;

  nIPCountLimitTime1: LongWord = 1000;
  nIPCountLimit1: Integer = 20;
  nIPCountLimitTime2: LongWord = 3000;
  nIPCountLimit2: Integer = 40;

  dwClientCheckTimeOut        :LongWord = 50;{3000}
  nMaxOverNomSizeCount        :Integer = 2;
  nMaxClientMsgCount          :Integer = 15;
  BlockMethod                 :TBlockIPMethod = mDisconnect;
  bokickOverPacketSize        :Boolean = True;

//  nClientSendBlockSize        :Integer = 250; //发送给客户端数据包大小限制
  nClientSendBlockSize        :Integer = 1000; //发送给客户端数据包大小限制
  dwClientTimeOutTime         :LongWord = 5000;//客户端连接会话超时(指定时间内未有数据传输)
  Conf                        :TIniFile;
  sConfigFileName             :String = '.\Config.ini';
  nSayMsgMaxLen               :Integer = 70;    //发言字符长度
  dwSayMsgTime                :LongWord = 1000;  //发主间隔时间
  dwHitTime                   :LongWord = 300;  //攻击间隔时间
  dwSessionTimeOutTime        :LongWord = 60 * 60 * 1000;
implementation

constructor TGList.Create;
begin
  inherited Create;
  InitializeCriticalSection(GLock);
end;

destructor TGList.Destroy;
begin
  DeleteCriticalSection(GLock);
  inherited;
end;

procedure TGList.Lock;
begin
  EnterCriticalSection(GLock);
end;

procedure TGList.UnLock;
begin
  LeaveCriticalSection(GLock);
end;

procedure AddMainLogMsg(Msg:String;nLevel:Integer);
var
 tMsg:String;
begin
  try
    CS_MainLog.Enter;
    if nLevel <= nShowLogLevel then begin
      tMsg:='[' + TimeToStr(Now) + '] ' + Msg;
      MainLogMsgList.Add(tMsg);
    end;
  finally
    CS_MainLog.Leave;
  end;
end;
procedure LoadAbuseFile();
var
  sFileName:String;
begin
  AddMainLogMsg('Loading abuse file...',4);
  sFileName:='.\WordFilter.txt';
  if FileExists(sFileName) then begin
    try
      CS_FilterMsg.Enter;
      AbuseList.LoadFromFile(sFileName);
    finally
      CS_FilterMsg.Leave;
    end;
  end;
  AddMainLogMsg('Abuse file loaded...',4);
end;
procedure LoadBlockIPFile();
var
  sFileName:String;
begin
  AddMainLogMsg('Loading block ip file...',4);
  sFileName:='.\BlockIPList.txt';
  if FileExists(sFileName) then begin
    BlockIPList.LoadFromFile(sFileName);
  end;
  AddMainLogMsg('Block ip file loaded...',4);
end;

procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  SendData: TCopyDataStruct;
  nParam: Integer;
begin
  nParam := MakeLong(Word(tRunGate), wIdent);
  SendData.cbData := Length(sSendMsg) + 1;
  GetMem(SendData.lpData, SendData.cbData);
  StrCopy(SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle, WM_COPYDATA, nParam, Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;

initialization
begin
  {---- Adjust global SVN revision ----}
  SVNRevision('$Id: GateShare.pas 121 2006-08-06 01:10:41Z Dataforce $');
  Conf:=TIniFile.Create(sConfigFileName);
  nShowLogLevel:=Conf.ReadInteger(GateClass,'ShowLogLevel',nShowLogLevel);
  CS_MainLog:=TCriticalSection.Create;
  CS_FilterMsg:=TCriticalSection.Create;
  MainLogMsgList:=TStringList.Create;
  AbuseList:=TStringList.Create;
  ReviceMsgList:=TList.Create;
  SendMsgList:=TList.Create;
  List_45AA58:=TList.Create;
  boShowSckData:=False;
  BlockIPList:=TStringList.Create;
  TempBlockIPList:=TStringList.Create;
end;
finalization
begin
  List_45AA58.Free;
  ReviceMsgList.Free;
  SendMsgList.Free;
  AbuseList.Free;
  MainLogMsgList.Free;
  CS_MainLog.Free;
  CS_FilterMsg.Free;
  BlockIPList.Free;
  TempBlockIPList.Free;
  Conf.Free;
end; 

end.
