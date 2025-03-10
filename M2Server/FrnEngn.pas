unit FrnEngn;

interface

uses
  {svn,} Windows, Classes, SysUtils,Grobal2;

type

  TFrontEngine = class(TThread)
    m_UserCriticalSection :TRTLCriticalSection;
    m_HeroCriticalSection :TRTLCriticalSection;
    m_LoadRcdList         :TList; //0x30
    m_SaveRcdList         :TList; //0x34
    m_ChangeGoldList      :TList; //0x38

    m_LoadHeroRcdList: TList; //0x30
    m_SaveHeroRcdList: TList; //0x34
  private
    m_LoadRcdTempList     :TList;
    m_SaveRcdTempList     :TList;

    m_LoadHeroRcdTempList: TList;
    m_SaveHeroRcdTempList: TList;
    procedure GetGameTime();
    procedure ProcessHumData();
    procedure ProcessHeroData();
    function  LoadHumFromDB(LoadUser:pTLoadDBInfo;var boReTry:Boolean):Boolean;
    function  LoadHeroFromDB(LoadUser: pTLoadDBInfo; var boReTry: Boolean): Boolean;
    function  ChangeUserGoldInDB(GoldChangeInfo:pTGoldChangeInfo):Boolean;
    procedure Run();
    { Private declarations }
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    function  SaveListCount():Integer;
    function  IsIdle():Boolean;
    function  IsFull():Boolean;
    procedure DeleteHuman(nGateIndex, nSocket: Integer);
    function  InSaveRcdList(sAccount, sChrName:String):Boolean;
    procedure AddChangeGoldList(sGameMasterName,sGetGoldUserName:String;nGold:Integer);
    procedure AddToLoadRcdList(sAccount,sChrName,sIPaddr:String;boFlag:Boolean;nSessionID:integer;nPayMent,nPayMode,nSoftVersionDate,nSocket,nGSocketIdx,nGateIdx:Integer);
    procedure AddToSaveRcdList(SaveRcd:pTSaveRcd);

    function InSaveHeroRcdList(sAccount, sChrName: string): Boolean;
    procedure AddToLoadHeroRcdList(PlayObject, NPC: TObject; DataType: THeroDataType; sMsg: string = '');
    procedure AddToSaveHeroRcdList(SaveRcd: pTSaveRcd);
  end;

implementation
uses
  M2Share, RunDB, ObjBase, ObjHero;
{ TFrontEngine }

constructor TFrontEngine.Create(CreateSuspended: Boolean);
begin
  inherited;
  InitializeCriticalSection(m_UserCriticalSection);
  InitializeCriticalSection(m_HeroCriticalSection);
  m_LoadRcdList     := TList.Create;
  m_SaveRcdList     := TList.Create;
  m_ChangeGoldList  := TList.Create;
  m_LoadRcdTempList := TList.Create;
  m_SaveRcdTempList := TList.Create;

  m_LoadHeroRcdList := TList.Create;
  m_SaveHeroRcdList := TList.Create;
  m_LoadHeroRcdTempList := TList.Create;
  m_SaveHeroRcdTempList := TList.Create;
//  FreeOnTerminate:=True;
end;

destructor TFrontEngine.Destroy;
begin
  m_LoadRcdList.Free;
  m_SaveRcdList.Free;
  m_ChangeGoldList.Free;
  m_LoadRcdTempList.Free;
  m_SaveRcdTempList.Free;

  m_LoadHeroRcdList.Free;
  m_SaveHeroRcdList.Free;
  m_LoadHeroRcdTempList.Free;
  m_SaveHeroRcdTempList.Free;
  DeleteCriticalSection(m_UserCriticalSection);
  DeleteCriticalSection(m_HeroCriticalSection);
  inherited;
end;
//004B5148
procedure TFrontEngine.Execute;
ResourceString
  sExceptionMsg = '[Exception] TFrontEngine::Execute';
begin
  While not Terminated do begin
    try
      Run();
    except
      MainOutMessage(sExceptionMsg);
    end;
    Sleep(1);
  end;
end;

procedure TFrontEngine.GetGameTime;//004B50AC
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Time, Hour, Min, Sec, MSec);
  case Hour of
    5,6,7,8,9,10,16,17,18,19,20,21,22: g_nGameTime:=1;
    11,23: g_nGameTime:=2;
    4,15: g_nGameTime:=0;
    0,1,2,3,12,13,14: g_nGameTime:=3;
  end;
end;

function TFrontEngine.IsIdle: Boolean;
begin
  Result:=False;
  EnterCriticalSection(m_UserCriticalSection);
  try
    if m_SaveRcdList.Count = 0 then Result:=True;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;

end;
function TFrontEngine.SaveListCount: Integer;
begin
  Result:=0;
  EnterCriticalSection(m_UserCriticalSection);
  try
    Result:=m_SaveRcdList.Count;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

procedure TFrontEngine.ProcessHumData;
var
  I              :Integer;
  II             :Integer;
  TempList       :TList;
  ChangeGoldList :TList;
  LoadDBInfo     :pTLoadDBInfo;
  SaveRcd        :pTSaveRcd;
  GoldChangeInfo :pTGoldChangeInfo;
  boReTryLoadDB  :Boolean;
begin
  ChangeGoldList:=nil;
  EnterCriticalSection(m_UserCriticalSection);
  try
    for I:=0 to m_SaveRcdList.Count -1 do begin
      m_SaveRcdTempList.Add(m_SaveRcdList.Items[I]);
    end;

    TempList          := m_LoadRcdTempList;
    m_LoadRcdTempList := m_LoadRcdList;
    m_LoadRcdList     := TempList;

    if m_ChangeGoldList.Count > 0 then begin
      ChangeGoldList:=TList.Create;
      for I:=0 to m_ChangeGoldList.Count -1 do begin
        ChangeGoldList.Add(m_ChangeGoldList.Items[I]);
      end;
    end;
    m_ChangeGoldList.Clear;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
  for I:=0 to m_SaveRcdTempList.Count -1 do begin
    SaveRcd:=m_SaveRcdTempList.Items[I];
    if SaveHumRcdToDB(SaveRcd.sAccount,SaveRcd.sChrName,SaveRcd.nSessionID,SaveRcd.HumanRcd) or (SaveRcd.nReTryCount > 50) then begin
      if SaveRcd.PlayObject <> nil then begin
        TPlayObject(SaveRcd.PlayObject).m_boRcdSaved:=True;
      end;
      EnterCriticalSection(m_UserCriticalSection);
      try
        for II:=0 to m_SaveRcdList.Count - 1 do begin
          if m_SaveRcdList.Items[II] = SaveRcd then begin
            m_SaveRcdList.Delete(II);
            Dispose(SaveRcd);
            break;
          end;
        end;
      finally
        LeaveCriticalSection(m_UserCriticalSection);
      end;
    end else begin
      Inc(SaveRcd.nReTryCount);
    end;
  end;//004B4FDA
  m_SaveRcdTempList.Clear;

  for I:=0 to m_LoadRcdTempList.Count -1 do begin
    LoadDBInfo:= m_LoadRcdTempList.Items[I];
    if not LoadHumFromDB(LoadDBInfo,boReTryLoadDB) then
      RunSocket.CloseUser(LoadDBInfo.nGateIdx,LoadDBInfo.nSocket);
    if not boReTryLoadDB then begin
      Dispose(LoadDBInfo);
    end else begin
      EnterCriticalSection(m_UserCriticalSection);
      try
        m_LoadRcdList.Add(LoadDBInfo);
      finally
        LeaveCriticalSection(m_UserCriticalSection);
      end;
    end;
  end;//004B504D
  m_LoadRcdTempList.Clear;

  if ChangeGoldList <> nil then begin
    for I:=0 to ChangeGoldList.Count -1 do begin
      GoldChangeInfo:=ChangeGoldList.Items[I];
      ChangeUserGoldInDB(GoldChangeInfo);
      Dispose(GoldChangeInfo);
    end;//004B509F
    ChangeGoldList.Free;
  end;//004B50A7
end;


procedure TFrontEngine.ProcessHeroData();
var
  I: Integer;
  II: Integer;
  TempList: TList;
  LoadDBInfo: pTLoadDBInfo;
  SaveRcd: pTSaveRcd;
  GoldChangeInfo: pTGoldChangeInfo;
  boReTryLoadDB: Boolean;
  nCode: Integer;
  boSaveRcd: Boolean;
resourcestring
  sExceptionMsg = '[Exception] TFrontEngine::ProcessHeroData Code:%d';
begin
  try
    EnterCriticalSection(m_HeroCriticalSection);
    try
      for I := 0 to m_SaveHeroRcdList.Count - 1 do begin
        m_SaveHeroRcdTempList.Add(m_SaveHeroRcdList.Items[I]);
      end;
      nCode := 1;
      TempList := m_LoadHeroRcdTempList;
      nCode := 2;
      m_LoadHeroRcdTempList := m_LoadHeroRcdList;
      nCode := 3;
      m_LoadHeroRcdList := TempList;
      nCode := 4;
    finally
      LeaveCriticalSection(m_HeroCriticalSection);
    end;

    for I := 0 to m_SaveHeroRcdTempList.Count - 1 do begin
      SaveRcd := m_SaveHeroRcdTempList.Items[I];
      if SaveHeroRcdToDB(SaveRcd.sAccount, SaveRcd.sChrName, SaveRcd.nSessionID, SaveRcd.HumanRcd) or (SaveRcd.nReTryCount > 50) then begin
        if (SaveRcd.PlayObject <> nil) then begin
          THeroObject(SaveRcd.PlayObject).m_boRcdSaved := True;
        end;
        EnterCriticalSection(m_HeroCriticalSection);
        try
          for II := m_SaveHeroRcdList.Count - 1 downto 0 do begin
            if m_SaveHeroRcdList.Items[II] = SaveRcd then begin
              m_SaveHeroRcdList.Delete(II);
              nCode := 9;
              Dispose(SaveRcd);
              SaveRcd := nil;
              nCode := 10;
              Break;
            end;
          end;
        finally
          LeaveCriticalSection(m_HeroCriticalSection);
        end;
      end else begin
        Inc(SaveRcd.nReTryCount);
       // Break;   //快急焊幅
      end;
    end;
    m_SaveHeroRcdTempList.Clear;

    nCode := 11;
    for I := 0 to m_LoadHeroRcdTempList.Count - 1 do begin
      LoadDBInfo := m_LoadHeroRcdTempList.Items[I];
      if (not LoadHeroFromDB(LoadDBInfo, boReTryLoadDB)) then
        //RunSocket.CloseUser(LoadDBInfo.nGateIdx, LoadDBInfo.nSocket);
        if not boReTryLoadDB then begin
          Dispose(LoadDBInfo);
          LoadDBInfo := nil;
        end else begin //如果读取人物数据失败(数据还没有保存),则重新加入队列
          EnterCriticalSection(m_HeroCriticalSection);
          try
            m_LoadHeroRcdList.Add(LoadDBInfo);
          finally
            LeaveCriticalSection(m_HeroCriticalSection);
          end;
        end;
    end;
    m_LoadHeroRcdTempList.Clear;
  except
    MainOutMessage(Format(sExceptionMsg, [nCode]));
  end;
end;

function TFrontEngine.IsFull: Boolean;//004B4988
begin
  Result:=False;
  EnterCriticalSection(m_UserCriticalSection);
  try
    if m_SaveRcdList.Count >= 1000 then begin
      Result:=True;
    end;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

procedure TFrontEngine.AddToLoadRcdList(sAccount, sChrName, sIPaddr: String;
  boFlag: Boolean; nSessionID, nPayMent, nPayMode,nSoftVersionDate,nSocket,nGSocketIdx,nGateIdx: Integer);
//004B46A0
var
  LoadRcdInfo:pTLoadDBInfo;
begin
  New(LoadRcdInfo);
  LoadRcdInfo.sAccount         := sAccount;
  LoadRcdInfo.sCharName        := sChrName;
  LoadRcdInfo.sIPaddr          := sIPaddr;
  //LoadRcdInfo.boClinetFlag     := boFlag;
  LoadRcdInfo.nSessionID       := nSessionID;
  LoadRcdInfo.nSoftVersionDate := nSoftVersionDate;
  LoadRcdInfo.nPayMent         := nPayMent;
  LoadRcdInfo.nPayMode         := nPayMode;
  LoadRcdInfo.nSocket          := nSocket;
  LoadRcdInfo.nGSocketIdx      := nGSocketIdx;
  LoadRcdInfo.nGateIdx         := nGateIdx;
  LoadRcdInfo.dwNewUserTick    := GetTickCount();
  LoadRcdInfo.PlayObject       := nil;
  LoadRcdInfo.nReLoadCount     := 0;

  EnterCriticalSection(m_UserCriticalSection);
  try
    m_LoadRcdList.Add(LoadRcdInfo);
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

function TFrontEngine.LoadHumFromDB(LoadUser: pTLoadDBInfo;var boReTry:Boolean): Boolean;//004B4B10
var
  HumanRcd     :THumData;
  UserOpenInfo :pTUserOpenInfo;
ResourceString
  sReLoginFailMsg = '[Error](%s/%s/%s/%d)';
begin
  Result  := False;
  boReTry := False;
  if InSaveRcdList(LoadUser.sAccount, LoadUser.sCharName) then begin
    boReTry:=True;
    exit;
  end;
  if (UserEngine.GetPlayObjectEx(LoadUser.sCharName) <> nil) then begin
    UserEngine.KickPlayObjectEx(LoadUser.sCharName);
    boReTry:=True;
    exit;
  end;
  if not LoadHumRcdFromDB(LoadUser.sAccount,LoadUser.sCharName,LoadUser.sIPaddr,HumanRcd,LoadUser.nSessionID) then begin
    RunSocket.SendOutConnectMsg(LoadUser.nGateIdx,LoadUser.nSocket,LoadUser.nGSocketIdx);
  end else begin
    New(UserOpenInfo);
    UserOpenInfo.sAccount := LoadUser.sAccount;
    UserOpenInfo.sChrName := LoadUser.sCharName;
    UserOpenInfo.LoadUser := LoadUser^;
    UserOpenInfo.HumanRcd := HumanRcd;
    UserEngine.AddUserOpenInfo(UserOpenInfo);
    Result:=True;
  end;
end;

function TFrontEngine.LoadHeroFromDB(LoadUser: pTLoadDBInfo; var boReTry: Boolean): Boolean;
var
  HumanRcd: THumData;
  UserOpenInfo: pTUserOpenInfo;
  PlayObject: TPlayObject;
  boLoad: Boolean;
  nResult: Integer;
begin
  Result := False;
  boReTry := False;
  boLoad := False;
  nResult := 0;
  if InSaveHeroRcdList(LoadUser.sAccount, LoadUser.sCharName) then begin
    boReTry := True; //反回TRUE,则重新加入队列
    Result := True;
    Exit;
  end;

  case LoadUser.HeroData of
    l_Create: boLoad := CreateHeroRcd(LoadUser.sAccount, TPlayObject(LoadUser.PlayObject).m_sCharName, LoadUser.sCharName, LoadUser.sMsg, LoadUser.nSessionID, nResult);
    l_Delete: boLoad := DeleteHeroRcd(LoadUser.sAccount, LoadUser.sCharName, LoadUser.nSessionID, nResult);
    l_Load: boLoad := LoadHeroRcdFromDB(LoadUser.sAccount, LoadUser.sCharName, LoadUser.sIPaddr, HumanRcd, LoadUser.nSessionID);
  end;
  New(UserOpenInfo);
  UserOpenInfo.sAccount := LoadUser.sAccount;
  UserOpenInfo.sChrName := LoadUser.sCharName;
  UserOpenInfo.LoadUser := LoadUser^;
  UserOpenInfo.HumanRcd := HumanRcd;
  UserOpenInfo.nResult := nResult;
  UserOpenInfo.NPC := LoadUser.NPC;
  if UserOpenInfo.NPC = nil then
    UserOpenInfo.NPC := g_FunctionNPC;

  if LoadUser.HeroData = l_Load then begin
    if HumanRcd.sChrName = '' then begin
      UserOpenInfo.nResult := 0;
    end else begin
      UserOpenInfo.nResult := 1;
    end;
  end;
  //MainOutMessage('[DB]康旷沥焊 傈券 捞抚 :'+LoadUser.sCharName+ '/'+ HumanRcd.sChrName +' 沥焊: '+ IntToStr(UserOpenInfo.nResult));
  UserEngine.AddHeroOpenInfo(UserOpenInfo);
  Result := True;
end;

function TFrontEngine.InSaveRcdList(sAccount, sChrName:String): Boolean;//004B4A48
var
  I: Integer;
begin
  Result:=False;
  EnterCriticalSection(m_UserCriticalSection);
  try
    for I := 0 to m_SaveRcdList.Count - 1 do begin
      if (pTSaveRcd(m_SaveRcdList.Items[I]).sAccount = sAccount) and
        (pTSaveRcd(m_SaveRcdList.Items[I]).sChrName = sChrName) then begin
        Result:=True;
        break;
      end;
    end;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

function TFrontEngine.InSaveHeroRcdList(sAccount, sChrName: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  EnterCriticalSection(m_HeroCriticalSection);
  try
    for I := 0 to m_SaveHeroRcdList.Count - 1 do begin
      if (pTSaveRcd(m_SaveHeroRcdList.Items[I]).sAccount = sAccount) and
        (pTSaveRcd(m_SaveHeroRcdList.Items[I]).sChrName = sChrName) then begin
        Result := True;
        Break;
      end;
    end;
  finally
    LeaveCriticalSection(m_HeroCriticalSection);
  end;
end;

procedure TFrontEngine.AddToLoadHeroRcdList(PlayObject, NPC: TObject; DataType: THeroDataType; sMsg: string);
var
  LoadRcdInfo: pTLoadDBInfo;
begin
  New(LoadRcdInfo);
  TPlayObject(PlayObject).m_boWaitHeroDate := True;
  LoadRcdInfo.sAccount := TPlayObject(PlayObject).m_sUserID;
  if DataType = l_Create then begin
    LoadRcdInfo.sCharName := TPlayObject(PlayObject).m_sTempHeroName;
  end else begin
    LoadRcdInfo.sCharName := TPlayObject(PlayObject).m_sHeroCharName;
  end;
  LoadRcdInfo.sIPaddr := TPlayObject(PlayObject).m_sIPaddr;
  LoadRcdInfo.nSessionID := TPlayObject(PlayObject).m_nSessionID;
  LoadRcdInfo.nSoftVersionDate := TPlayObject(PlayObject).m_nSoftVersionDate;
  LoadRcdInfo.nPayMent := TPlayObject(PlayObject).m_nPayMent;
  LoadRcdInfo.nPayMode := TPlayObject(PlayObject).m_nPayMode;
  LoadRcdInfo.nSocket := TPlayObject(PlayObject).m_nSocket;
  LoadRcdInfo.nGSocketIdx := TPlayObject(PlayObject).m_nGSocketIdx;
  LoadRcdInfo.nGateIdx := TPlayObject(PlayObject).m_nGateIdx;
  LoadRcdInfo.dwNewUserTick := GetTickCount();
  LoadRcdInfo.PlayObject := PlayObject;
  LoadRcdInfo.nReLoadCount := 0;
  LoadRcdInfo.HeroData := DataType;
  LoadRcdInfo.sMsg := sMsg;
  LoadRcdInfo.NPC := NPC;

  //MainOutMessage('康旷沥焊 傈券 捞抚 :'+LoadRcdInfo.sCharName+' 沥焊: '+sMsg);
  EnterCriticalSection(m_HeroCriticalSection);
  try
    m_LoadHeroRcdList.Add(LoadRcdInfo);
  finally
    LeaveCriticalSection(m_HeroCriticalSection);
  end;
end;

procedure TFrontEngine.AddToSaveHeroRcdList(SaveRcd: pTSaveRcd); //004B49EC
begin
  EnterCriticalSection(m_HeroCriticalSection);
  try
    m_SaveHeroRcdList.Add(SaveRcd);
  finally
    LeaveCriticalSection(m_HeroCriticalSection);
  end;
end;

procedure TFrontEngine.AddChangeGoldList(sGameMasterName, sGetGoldUserName: String;
  nGold: Integer); //004B4828
var
  GoldInfo:pTGoldChangeInfo;
begin
  New(GoldInfo);
  GoldInfo.sGameMasterName:=sGameMasterName;
  GoldInfo.sGetGoldUser:=sGetGoldUserName;
  GoldInfo.nGold:=nGold;
  m_ChangeGoldList.Add(GoldInfo);
end;

procedure TFrontEngine.AddToSaveRcdList(SaveRcd: pTSaveRcd);//004B49EC
begin
  EnterCriticalSection(m_UserCriticalSection);
  try
    m_SaveRcdList.Add(SaveRcd);
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

procedure TFrontEngine.DeleteHuman(nGateIndex,nSocket:Integer);//004B45EC
var
  I: Integer;
  LoadRcdInfo:pTLoadDBInfo;
begin
  EnterCriticalSection(m_UserCriticalSection);
  try
    for I := 0 to m_LoadRcdList.Count - 1 do begin
      LoadRcdInfo:=m_LoadRcdList.Items[I];
      if (LoadRcdInfo.nGateIdx = nGateIndex) and (LoadRcdInfo.nSocket = nSocket) then begin
        Dispose(LoadRcdInfo);
        m_LoadRcdList.Delete(I);
        break;
      end;
    end;
  finally
    LeaveCriticalSection(m_UserCriticalSection);
  end;
end;

function TFrontEngine.ChangeUserGoldInDB(GoldChangeInfo: pTGoldChangeInfo): Boolean;
var
  HumanRcd:THumData;
begin
  Result:=False;
  if LoadHumRcdFromDB('1',GoldChangeInfo.sGetGoldUser,'1',HumanRcd,1) then begin
    if ((HumanRcd.nGold + GoldChangeInfo.nGold) > 0) and ((HumanRcd.nGold + GoldChangeInfo.nGold) < 2000000000) then begin
      Inc(HumanRcd.nGold,GoldChangeInfo.nGold);
      if SaveHumRcdToDB('1',GoldChangeInfo.sGetGoldUser,1,HumanRcd) then begin
        UserEngine.sub_4AE514(GoldChangeInfo);
        Result:=True;
      end;
    end;
  end;
end;

procedure TFrontEngine.Run;
begin
  ProcessHumData();
  ProcessHeroData();
  GetGameTime();
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: FrnEngn.pas 186 2006-08-09 18:31:50Z DeathWish $');
end.
