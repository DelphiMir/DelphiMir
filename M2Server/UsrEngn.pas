unit UsrEngn;

interface
uses
  {svn, }Windows, Classes, SysUtils, StrUtils, Forms, ObjBase, MudUtil, ObjNpc, Envir,
  ItmUnit, Grobal2, SDK, ObjHero;

type
  TUserEngine = class
    m_LoadPlaySection         :TRTLCriticalSection;
    m_LoadHeroSection         :TRTLCriticalSection;
    m_LoadPlayList            :TStringList;       //��DB��ȡ��������
    m_LoadHeroList            :TStringList; //��DB��ȡ��������
    m_HeroObjectList          :TGStringList;
    m_HeroObjectFreeList      :TList; //0x10
    m_PlayObjectFreeList      :TList;      //0x10

    m_dwProcessLoadHeroTick   :LongWord;
    nHeroPosition             :Integer;
    dwProcessHeroTimeMin      :Integer;
    dwProcessHeroTimeMax      :Integer;

    m_ChangeHumanDBGoldList   :TList;      //0x14
    dwShowOnlineTick          :LongWord; //0x18
    dwSendOnlineHumTime       :LongWord; //0x1C
    dwProcessMapDoorTick      :LongWord; //0x20
    dwProcessMissionsTime     :LongWord; //0x24
    dwRegenMonstersTick       :LongWord; //0x28
    dwProcessUsrLogTick       :LongWord;
    CalceTime                 :LongWord; //0x2C
    m_dwProcessLoadPlayTick   :LongWord; //0x30
    dwTime_34                 :LongWord; //0x34
    m_nCurrMonGen             :Integer;  //0x38
    MonCur     :Integer; //0x3C
    MonSubCur :Integer;  //0x40
    m_nProcHumIDx             :Integer;   //0x44 �������￪ʼ������ÿ�δ������������ƣ�
    nProcessHumanLoopTime     :Integer;
    nMerchantPosition         :Integer; //0x4C
    nNpcPosition              :Integer; //0x50
    StdItemList               :TList;     //List_54
    MonsterList               :TList;     //List_58
    m_MonGenList              :TList;     //List_5C
    m_MonFreeList             :TList;
    m_MagicList               :TList;     //List_60
    m_AdminList               :TGList;     //List_64
    m_ColumnList              :TGList;     //ȫ����
    m_MerchantList            :TGList;     //List_68
    m_DefiniensConst          :TStringList;
    QuestNPCList              :TList;     //0x6C
    //QuestInfoList             :TList;       //����Ʈ �׽�Ʈ
    List_70                   :TList;
    m_ChangeServerList        :TList;
    m_MagicEventList          :TList;    //0x78
    MonCount             :Integer; //��������
    MonCurCount    :Integer; //0x80������������λ�ã����ڼ����������
    MonRunCount               :Integer;
    MonCurRunCount      :Integer; //0x88����������������ͳ�ƴ����������
    boItemEvent               :Boolean;  //ItemEvent
    n90                       :Integer;
    dwProcessMonstersTick     :LongWord;
    dwProcessMerchantTimeMin  :Integer;
    dwProcessMerchantTimeMax  :Integer;
    dwProcessNpcTimeMin       :LongWord;
    dwProcessNpcTimeMax       :LongWord;
    m_NewHumanList            :TList;
    m_ListOfGateIdx           :TList;
    m_ListOfSocket            :TList;
    OldMagicList              :TList;
    EffectList                :TList;

  private
    procedure ProcessHumans();
    procedure ProcessHeros();
    procedure ProcessMonsters();
    procedure ProcessMerchants();
    procedure ProcessNpcs();
    procedure ProcessMissions();
    procedure ProcessEvents();
    procedure ProcessMapDoor();
    procedure SaveUsrLog();
    procedure NPCinitialize;
    procedure MerchantInitialize;
    procedure GTMerchant(Merchant:TMerchant);

    function  RegenMonsters(MonGen:pTMonGenInfo;nCount:integer): Boolean;
    procedure WriteShiftUserData;
    function  GetGenMonCount(MonGen:pTMonGenInfo):Integer;
    function  AddBaseObject(sMapName:String;nX,nY:Integer;nMonRace:Integer;sMonName:String):TBaseObject;
    function  AddBaseObjectEX(Map:TEnvirnoment;nX,nY:Integer;nMonRace:Integer;sMonName:String):TBaseObject;
    procedure GenShiftUserData();
    procedure KickOnlineUser(sChrName:String);
    function  SendSwitchData(PlayObject:TPlayObject;nServerIndex:Integer):Boolean;
    procedure SendChangeServer(PlayObject:TPlayObject;nServerIndex:Integer);
    procedure SaveHumanRcd(PlayObject:TPlayObject);
    procedure SaveHeroRcd(HeroObject: THeroObject);
    procedure AddToHumanFreeList(PlayObject:TPlayObject);
    procedure AddToHeroFreeList(HeroObject: THeroObject);
    procedure GetHumData(PlayObject:TPlayObject;var HumanRcd:THumData);
    procedure GetHeroData(HeroObject: THeroObject; var HumanRcd: THumData);

    function  GetHomeInfo(nJob:Integer; var nX:Integer;var nY:Integer):String;
    function  GetRandHomeX(PlayObject:TPlayObject):Integer;
    function  GetRandHomeY(PlayObject:TPlayObject):Integer;
    function  GetSwitchData(sChrName:String;nCode:Integer):pTSwitchDataInfo;
    procedure LoadSwitchData(SwitchData:pTSwitchDataInfo;var PlayObject:TPlayObject);
    procedure DelSwitchData(SwitchData:pTSwitchDataInfo);
    procedure MonInitialize(BaseObject:TBaseObject;sMonName:String);
    function  MapRageHuman(sMapName:String;nMapX,nMapY,nRage:Integer):Boolean;
    function  GetOnlineHumCount():Integer;
    function  GetUserCount(): Integer;
    function  GetLoadPlayCount():Integer;
    function  GetHeroCount(): Integer;

  public
    m_PlayObjectList          :TStringList;       //0x8
    constructor Create();
    destructor Destroy; override;
    procedure Initialize();
    function GetDefiniensConstText(sMsg: string): string;
    procedure ClearItemList();virtual;
    procedure SwitchMagicList();
    function GetOnlineCount: string;        //�����ڽý���
    procedure Run();
    procedure PrcocessData();
    function  MonGetRandomItems(mon: TBaseObject): integer;
    function  RegenMonsterByName(sMap:String;nX,nY:Integer;sMonName:String):TBaseObject;overload;
    function  RegenMonsterByName(pEnvir:TEnvirnoment;nX,nY:Integer;sMonName:String):TBaseObject;overload;
   // function  GetStdItem2(nIdx: Integer): TStdItem;
    function  GetStdItem(nItemIdx:Integer):TItem;overload;
    function  GetStdItem(sItemName:String):TItem;overload;
    function  GetStdItemWeight(nItemIdx:Integer):Integer;
    function  GetStdItemName(nItemIdx:Integer):String;
    function  GetStdItemNameV(nItemIdx: Integer): string;
    function  GetStdItemIdx(sItemName:String):Integer;
    function  FindOtherServerUser(sName:String;var nServerIndex):Boolean;
    procedure StoreCry(wIdent:Word;pMap:TEnvirnoment;nX,nY,nWide:Integer;btFColor,btBColor:Byte;sMsg:String);  //���λ��� ��ġ��
    procedure CryCry(wIdent:Word;pMap:TEnvirnoment;nX,nY,nWide:Integer;btFColor,btBColor:Byte;sMsg:String);
    procedure GuildAgitCry (msgtype: integer; env: TEnvirnoment; x, y, wide: integer; saying: string);     //��� ��ġ��
    procedure ProcessUserMessage(PlayObject:TPlayObject;DefMsg:pTDefaultMessage;Buff:PChar);
    procedure SendServerGroupMsg(nCode,nServerIdx:Integer;sMsg:String);
    function  GetMonRace(sMonName: String): Integer;
    function GetHeroObject(sName: string): THeroObject;
    function  GetPlayObject(sName:String):TPlayObject; overload;
    function  GetPlayObject(PlayObject: TPlayObject): TPlayObject; overload;
    function  GetPlayObjectEx(sName:String):TPlayObject;
    procedure KickPlayObjectEx(sName:String);
    function  FindMerchant(Merchant:TObject):TMerchant;
    function  FindNPC(GuildOfficial:TObject):TGuildOfficial;
    function  CopyToUserItemFromName(sItemName: String;Item:pTUserItem; count:integer = 1): Boolean; //����
    function  CopyToUserItemFromName2(sItemName: String;Item,sitem:pTUserItem;amont:integer): Boolean; //���� �ŷ�â
    function  GetMapOfRangeHumanCount(Envir:TEnvirnoment;nX,nY,nRange:integer):Integer;
    function  GetHumPermission(sUserName:String;var sIPaddr:String; var btPermission:Byte):Boolean;
    function  GetHumColumn(sUserName:String;var sIPaddr:String; var btColumn:Byte):Boolean;    //ȫ����

    procedure AddUserChat(sSay:String; ChatMode:integer); //ä�ýý���

    procedure AddUserOpenInfo(UserOpenInfo:pTUserOpenInfo);
    procedure AddHeroOpenInfo(UserOpenInfo: pTUserOpenInfo);
    function  OpenDoor(Envir:TEnvirnoment;nX,nY:Integer):Boolean;
    function  CloseDoor(Envir: TEnvirnoment; Door:pTDoorInfo):Boolean;
    procedure SendDoorStatus(Envir: TEnvirnoment; nX, nY: Integer; wIdent, wX: Word; nDoorX, nDoorY, nA: Integer;sStr:String);
    function  FindMagic(sMagicName:String):pTMagic;OverLoad;
    function _AllowUpgradeItem(Item: pTUserItem): Boolean;   //��ȯ
    function AccAllowUpgradeItem(Item: pTUserItem): Boolean;   //��ű���ȯ
    function  FindMagic(nMagIdx:Integer):pTMagic;OverLoad;

    function FindHeroMagic(sMagicName: string): pTMagic; overload;
    function FindHeroMagic(nMagIdx: Integer): pTMagic; overload;

    procedure AddMerchant(Merchant:TMerchant);
    function  GetMerchantList(Envir:TEnvirnoment;nX,nY,nRange:Integer;TmpList:TList):Integer;
    function  GetNpcList(Envir:TEnvirnoment;nX,nY,nRange:Integer;TmpList:TList):Integer;
    procedure ReloadMerchantList();
    procedure ReloadNpcList();
    procedure HumanExpire(sAccount:String);
    function  GetAreaAllUsers (env: TEnvirnoment; ulist: TList): integer;
    function  GetMapMonster(Envir:TEnvirnoment;List:TList):Integer;
    function  GetMapMonster2(Envir:TEnvirnoment;List:TList):Integer;   //�����ڽý��� ����
    function  GetMapRangeMonster(Envir:TEnvirnoment;nX,nY,nRange:Integer;List:TList):Integer;
    function  GetMapHuman(sMapName:String):Integer;
    function  GetMapRageHuman(Envir:TEnvirnoment;nRageX,nRageY,nRage:Integer;List:TList):Integer;
    procedure SendBroadCastMsg(sMsg:String;MsgType:TMsgType);
    procedure SendBroadTopMsg(sMsg: string); //�̵� ȭ�����
    procedure SendBroadTopDelayMsg(sMsg: string; dwDelay: LongWord); //�̵� ȭ�����
    procedure SendBroadCastMsgExt(sMsg:String;MsgType:TMsgType);
    procedure SendMoveMsg(sMsg: string);    //ȭ����� (npc)
    procedure sub_4AE514(GoldChangeInfo: pTGoldChangeInfo);
    procedure ClearMonSayMsg();
    procedure SendQuestMsg(sQuestName:String);
    procedure ClearMerchantData();
    // �ʿ� ������ �� ��Ű��(sonmg)
    function MakeItemToMap( DropMapName : string ; ItemName: String; Amount :integer; dx, dy:integer ):integer; //����
    property  MonsterCount:Integer read MonCount;
    property  OnlinePlayObject:Integer read GetOnlineHumCount;
    property  PlayObjectCount:Integer read GetUserCount;
    property  LoadPlayCount:Integer read GetLoadPlayCount;
    property  HeroObjectCount:Integer read GetHeroCount;
  end;
var
  g_dwEngineTick:LongWord;
  g_dwEngineRunTime:LongWord;

implementation

uses
  HUtil32, IdSrvClient, Guild, ObjMon, M2Share, EDcode, ObjGuard, ObjAxeMon,
  ObjMon2, ObjMon3, Event, InterMsgClient, InterServerMsg, ObjRobot, Castle,
  svMain;

{ TUserEngine }

constructor TUserEngine.Create();
begin
  InitializeCriticalSection(m_LoadPlaySection);
  InitializeCriticalSection(m_LoadHeroSection);
  m_LoadPlayList            := TStringList.Create;
  m_PlayObjectList          := TStringList.Create;
  m_PlayObjectFreeList      := TList.Create;
  m_HeroObjectList          := TGStringList.Create;
  m_LoadHeroList            := TStringList.Create; //��DB��ȡ��������
  m_HeroObjectFreeList      := TList.Create;

  nHeroPosition := 0;
  dwProcessHeroTimeMin := 0;
  dwProcessHeroTimeMax := 0;

  m_ChangeHumanDBGoldList   := TList.Create;
  dwShowOnlineTick          := GetTickCount;
  dwSendOnlineHumTime       := GetTickCount;
  dwProcessMapDoorTick      := GetTickCount;
  dwProcessMissionsTime     := GetTickCount;
  dwProcessMonstersTick     := GetTickCount;
  dwProcessUsrLogTick       := GetTickCount;
  dwRegenMonstersTick       := GetTickCount;
  m_dwProcessLoadPlayTick   := GetTickCount;
  dwTime_34                 := GetTickCount;
  m_nCurrMonGen             := 0;
  MonCur     := 0;
  MonSubCur := 0;
  m_nProcHumIDx             := 0;
  nProcessHumanLoopTime     := 0;
  nMerchantPosition         := 0;
  nNpcPosition              := 0;
  StdItemList               := TList.Create;     //List_54
  MonsterList               := TList.Create;
  m_MonGenList              := TList.Create;
  m_MonFreeList             := TList.Create;
  m_MagicList               := TList.Create;
  m_AdminList               := TGList.Create;
  m_ColumnList              := TGList.Create;    //ȫ����
  m_MerchantList            := TGList.Create;
  m_DefiniensConst          := TStringList.Create;
  QuestNPCList              := TList.Create;
  //QuestInfoList             := TList.Create;         //����Ʈ �׽�Ʈ
  List_70                   := TList.Create;
  m_ChangeServerList        := TList.Create;
  m_MagicEventList          := TList.Create;
  boItemEvent               := False;
  n90                       := 1800000;
  dwProcessMerchantTimeMin  := 0;
  dwProcessMerchantTimeMax  := 0;
  dwProcessNpcTimeMin       := 0;
  dwProcessNpcTimeMax       := 0;
  m_NewHumanList            := TList.Create;
  m_ListOfGateIdx           := TList.Create;
  m_ListOfSocket            := TList.Create;
  OldMagicList              := TList.Create;
  Effectlist                := TList.Create;

end;

destructor TUserEngine.Destroy;
var
  I          :Integer;
  II         :Integer;
  MonInfo    :pTMonInfo;
  MonGenInfo :pTMonGenInfo;
  MagicEvent :pTMagicEvent;
  tmpList    :TList;
begin
  for I := 0 to m_LoadPlayList.Count - 1 do begin
    Dispose(pTUserOpenInfo(m_LoadPlayList.Objects[I]));
  end;
  m_LoadPlayList.Free;

  for I := 0 to m_LoadHeroList.Count - 1 do begin
    Dispose(pTUserOpenInfo(m_LoadHeroList.Objects[I]));
  end;
  m_LoadHeroList.Free;
  for I := 0 to m_HeroObjectFreeList.Count - 1 do begin
    THeroObject(m_HeroObjectFreeList.Items[I]).Free;
  end;
  m_HeroObjectFreeList.Free;
  for I := 0 to m_HeroObjectList.Count - 1 do begin
    THeroObject(m_HeroObjectList.Objects[I]).Free;
  end;
  m_HeroObjectList.Free;


  for I := 0 to m_PlayObjectList.Count - 1 do begin
    TPlayObject(m_PlayObjectList.Objects[I]).Free;
  end;
  m_PlayObjectList.Free;

  for I := 0 to m_PlayObjectFreeList.Count - 1 do begin
    TPlayObject(m_PlayObjectFreeList.Items[I]).Free;
  end;
  m_PlayObjectFreeList.Free;

  for I := 0 to m_ChangeHumanDBGoldList.Count - 1 do begin
    Dispose(pTGoldChangeInfo(m_ChangeHumanDBGoldList.Items[I]));
  end;
  m_ChangeHumanDBGoldList.Free;

  for I := 0 to StdItemList.Count - 1 do begin
    Dispose(pTStdItem(StdItemList.Items[i]));
  end;
  StdItemList.Free;

  for I := 0 to MonsterList.Count - 1 do begin
    MonInfo:=MonsterList.Items[I];
    if MonInfo.ItemList <> nil then begin
      for II := 0 to MonInfo.ItemList.Count - 1 do begin
        Dispose(pTMonItem(MonInfo.ItemList.Items[II]));
      end;
      MonInfo.ItemList.Free;
    end;
    Dispose(MonInfo);
  end;
  MonsterList.Free;
  
  for I := 0 to m_MonGenList.Count - 1 do begin
    MonGenInfo:=m_MonGenList.Items[I];
    for II := 0 to MonGenInfo.CertList.Count - 1 do begin
      TBaseObject(MonGenInfo.CertList.Items[II]).Free;
    end;
    Dispose(pTMonGenInfo(m_MonGenList.Items[I]));
  end;
  m_MonGenList.Free;
  
  for I := 0 to m_MonFreeList.Count - 1 do begin
    TBaseObject(m_MonFreeList.Items[I]).Free;
  end;
  m_MonFreeList.Free;

  for I := 0 to m_MagicList.Count - 1 do begin
    Dispose(pTMagic(m_MagicList.Items[i]));
  end;
  m_MagicList.Free;

  m_AdminList.Free;
  m_ColumnList.Free;
  for I := 0 to m_MerchantList.Count - 1 do begin
    TMerchant(m_MerchantList.Items[i]).Free;
  end;
  m_MerchantList.Free;
  for I := 0 to QuestNPCList.Count - 1 do begin
    TNormNpc(QuestNPCList.Items[i]).Free;
  end;
  QuestNPCList.Free;
  
  {for I := 0 to QuestInfoList.Count - 1 do begin   //����Ʈ �׽�Ʈ
    TQuestInfo(QuestInfoList.Items[i]).Free;
  end;
  QuestInfoList.Free; }

  for I := 0 to m_DefiniensConst.Count - 1 do begin
    Dispose(PString(m_DefiniensConst.Objects[I]));
  end;
  m_DefiniensConst.Free;
  List_70.Free;
  for I := 0 to m_ChangeServerList.Count - 1 do begin
    Dispose(pTSwitchDataInfo(m_ChangeServerList.Items[i]));
  end;
  m_ChangeServerList.Free;
  for I := 0 to m_MagicEventList.Count - 1 do begin
    MagicEvent:=m_MagicEventList.Items[I];
    if MagicEvent.BaseObjectList <> nil then MagicEvent.BaseObjectList.Free;

    Dispose(MagicEvent);
  end;
  m_MagicEventList.Free;
  m_NewHumanList.Free;
  m_ListOfGateIdx.Free;
  m_ListOfSocket.Free;
  for I := 0 to OldMagicList.Count - 1 do begin
    tmpList:=TList(OldMagicList.Items[I]);
    for II := 0 to tmpList.Count - 1 do begin
      Dispose(pTMagic(tmpList.Items[II]));
    end;
    tmpList.Free;
  end;
  OldMagicList.Free;

  Effectlist.Free;


  DeleteCriticalSection(m_LoadPlaySection);
  DeleteCriticalSection(m_LoadHeroSection);
  inherited;
end;

procedure TUserEngine.Initialize; //004B200C
var
  i:Integer;
  MonGen:pTMonGenInfo;
begin
  MerchantInitialize();
  NPCinitialize();
  for i:=0 to m_MonGenList.Count -1 do begin
    MonGen:=m_MonGenList.Items[i];
    if MonGen <> nil then begin
      MonGen.nRace:= GetMonRace(MonGen.sMonName);
    end;
  end;
end;

function TUserEngine.GetMonRace(sMonName:String):Integer;//004ACDD8
var
  i:integer;
  MonInfo:pTMonInfo;
begin
  Result:= -1;
    for i:=0 to MonsterList.Count -1 do begin
      MonInfo:=MonsterList.Items[i];
      if CompareText(MonInfo.sName,sMonName) = 0 then begin
        Result:=MonInfo.btRace;               //�����̽�
        break;
      end;
    end;
end;
procedure TUserEngine.MerchantInitialize; //004AC96C
var
  I: Integer;
  Merchant:TMerchant;
  sCaption:String;
begin
  sCaption:=FrmMain.Caption;
  m_MerchantList.Lock;
  try
    for I := m_MerchantList.Count - 1 downto 0 do begin
      Merchant:=TMerchant(m_MerchantList.Items[i]);
      Merchant.m_PEnvir:=g_MapManager.FindMap(Merchant.m_sMapName);
      if Merchant.m_PEnvir <> nil then begin
        if Merchant.m_PEnvir.Flag.nGuildTerritory > 0 then
          GTMerchant(Merchant);
        Merchant.Initialize;
        if Merchant.m_boAddtoMapSuccess and (not Merchant.m_boIsHide) then begin
          MainOutMessage('���˼���ʧ�� - ' + Merchant.m_sCharName + ' ' + Merchant.m_sMapName + '(' + IntToStr(Merchant.m_nCurrX) + ':' + IntToStr(Merchant.m_nCurrY) + ')');
          m_MerchantList.Delete(i);
          Merchant.Free;
        end else begin
          Merchant.AddMapCount;       //�����ڽý���
          Merchant.LoadNPCScript();
          Merchant.LoadNPCData();
        end;
      end else begin
        MainOutMessage(Merchant.m_sCharName + ' - ���˼���ʧ�� (m.PEnvir=nil)');
        m_MerchantList.Delete(i);
        Merchant.Free;
      end;
      FrmMain.Caption:=sCaption + '[NPC������...(' + IntToStr(m_MerchantList.Count-I) + '/' + IntToStr(m_MerchantList.Count) + ')]';
      // Do Not UnComment!
//      Application.ProcessMessages;
    end;
  finally
    m_MerchantList.UnLock;
  end;
end;
procedure TUserEngine.NPCinitialize; //004ACC24
var
  I: Integer;
  NormNpc:TNormNpc;
begin
  for I := QuestNPCList.Count - 1 downto 0 do begin
    NormNpc:=TNormNpc(QuestNPCList.Items[i]);
    NormNpc.m_PEnvir:=g_MapManager.FindMap(NormNpc.m_sMapName);
    if NormNpc.m_PEnvir <> nil then begin
      NormNpc.Initialize;//FFFE
      if NormNpc.m_boAddtoMapSuccess and (not NormNpc.m_boIsHide) then begin
        MainOutMessage(NormNpc.m_sCharName + ' Npc������... ');
        QuestNPCList.Delete(i);
        NormNpc.Free;
      end else begin
        NormNpc.AddMapCount;        //�����ڽý���
        NormNpc.LoadNPCScript();
      end;
    end else begin
      MainOutMessage(NormNpc.m_sCharName + ' Npc������... (npc.PEnvir=nil) ');
      QuestNPCList.Delete(i);
      NormNpc.Free;
    end;
      
  end;
end;

procedure TUserEngine.GTMerchant(Merchant:TMerchant); //004AC96C
var
  i:integer;
  Merchant2:TMerchant;
  Envir:TEnvirnoment;
begin
  for i:=0 to g_MapManager.Count -1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[I]);
    if (Envir.sMapName = Merchant.m_PEnvir.sMapName) and (Envir.Flag.nGuildTerritory <> Merchant.m_PEnvir.Flag.nGuildTerritory) then begin
      Merchant2:=TMerchant.Create;
      Merchant2.m_sScript      := Merchant.m_sScript;
      Merchant2.m_sMapName     := Merchant.m_sMapName;
      Merchant2.m_nCurrX       := Merchant.m_nCurrX;
      Merchant2.m_nCurrY       := Merchant.m_nCurrY;
      Merchant2.m_sCharName    := Merchant.m_sCharName;
      Merchant2.m_nFlag        := Merchant.m_nFlag;
      Merchant2.m_wAppr        := Merchant.m_wAppr;
      Merchant2.m_boCastle     := Merchant.m_boCastle;
      Merchant2.m_boCanMove    := Merchant.m_boCanMove;
      Merchant2.m_dwMoveTime   := Merchant.m_dwMoveTime;
      Merchant2.m_PEnvir       := Envir;
      Merchant2.Initialize;
      if Merchant2.m_boAddtoMapSuccess and (not Merchant2.m_boIsHide) then begin
        MainOutMessage('GT Merchant Initalize fail...' + Merchant2.m_sCharName + ' ' + Merchant2.m_sMapName + '(' + IntToStr(Merchant2.m_nCurrX) + ':' + IntToStr(Merchant2.m_nCurrY) + ')');
        Merchant2.Free;
      end else begin
        UserEngine.m_MerchantList.Lock;
        try
          UserEngine.m_MerchantList.Add(Merchant2);
        finally
          UserEngine.m_MerchantList.UnLock;
        end;
        Merchant2.LoadNPCScript();
        Merchant2.LoadNPCData();
      end;
    end;
  end;
end;

function TUserEngine.GetLoadPlayCount: Integer;//004AE7F0
begin
  Result:= m_LoadPlayList.Count;
end;

function TUserEngine.GetOnlineHumCount: Integer;//004AE7F0
begin
  Result:= m_PlayObjectList.Count;
end;

function TUserEngine.GetUserCount: Integer; //004AE7C0
begin
  Result:= m_PlayObjectList.Count;
end;

function TUserEngine.GetHeroCount: Integer; //004AE7C0
begin
  Result:= m_HeroObjectList.Count;
end;

function TUserEngine.GetOnlineCount: string;    //�����ڽý���
var
  nOnlineCount: Integer;
  nOnlineCount2: Integer;
begin
  nOnlineCount := GetUserCount;
  nOnlineCount2 := GetHeroCount;
  Result := Format('%d / ����Ӣ��: %d', [nOnlineCount, nOnlineCount2]);
end;

procedure TUserEngine.ProcessHumans;
  function IsLogined(sAccount, sChrName:String):Boolean;//004AFC68
  var
    i:Integer;
  begin
    Result:=False;
    if FrontEngine.InSaveRcdList(sAccount, sChrName) then begin
      Result:=True;
    end else begin
      for i:= 0 to m_PlayObjectList.Count - 1 do begin
        if CompareText(m_PlayObjectList.Strings[i], sChrName) = 0 then begin
          Result:=True;
          break;
        end;
      end;
    end;
  end;
  function MakeNewHuman(UserOpenInfo:pTUserOpenInfo):TPlayObject;  //004AFD28
  var
    PlayObject:TPlayObject;
    Abil:pTAbility;
    Envir:TEnvirnoment;
    nC:integer;
    SwitchDataInfo:pTSwitchDataInfo;
    Castle:TUserCastle;
  ResourceString
    sExceptionMsg      = '[Exception] TUserEngine::MakeNewHuman :: [%s]';
    sChangeServerFail1 = 'chg-server-fail-1 [%d] -> [%d] [%s] [%s]';
    sChangeServerFail2 = 'chg-server-fail-2 [%d] -> [%d] [%s] [%s]';
    sChangeServerFail3 = 'chg-server-fail-3 [%d] -> [%d] [%s] [%s]';
    sChangeServerFail4 = 'chg-server-fail-4 [%d] -> [%d] [%s] [%s]';
    sErrorEnvirIsNil   = '[Error] PlayObject.PEnvir = nil :: [%s]';
  label
    ReGetMap;
  begin
    Result:=nil;
    try
      PlayObject:=TPlayObject.Create;

      if not g_Config.boVentureServer then begin
        UserOpenInfo.sChrName:='';
        UserOpenInfo.LoadUser.nSessionID:=0;
        SwitchDataInfo:=GetSwitchData(UserOpenInfo.sChrName,UserOpenInfo.LoadUser.nSessionID);
      end else SwitchDataInfo:=nil;//004AFD95
      
      SwitchDataInfo:=nil;

      if SwitchDataInfo = nil then begin
        GetHumData(PlayObject,UserOpenInfo.HumanRcd);
        PlayObject.m_btRaceServer:= RC_PLAYOBJECT;
        if PlayObject.m_sHomeMap = '' then begin
          ReGetMap:
            PlayObject.m_sHomeMap:=GetHomeInfo(PlayObject.m_btJob,PlayObject.m_nHomeX,PlayObject.m_nHomeY);
            PlayObject.m_sMapName:=PlayObject.m_sHomeMap;
            PlayObject.m_nCurrX:=GetRandHomeX(PlayObject);
            PlayObject.m_nCurrY:=GetRandHomeY(PlayObject);
            if PlayObject.m_Abil.Level = 0 then begin
              Abil:=@PlayObject.m_Abil;
              Abil.Level:=1;
              Abil.AC:=0;
              Abil.MAC:=0;
              Abil.DC:=MakeLong(1,2);
              Abil.MC:=MakeLong(1,2);
              Abil.SC:=MakeLong(1,2);
              Abil.MP:=15;
              Abil.HP:=15;
              Abil.MaxHP:=15;
              Abil.MaxMP:=15;
              Abil.Exp:=0;
              Abil.MaxExp:=100;
              Abil.Weight:=0;
              Abil.MaxWeight:=30;
              PlayObject.m_boNewHuman:=True;
            end;
        end;


        Envir:=g_MapManager.GetMapInfo(nServerIndex,PlayObject.m_sMapName);
        if Envir <> nil then begin
           //���� ��� �̺�Ʈ �濡 �ִ� ��� �˻�
          if Envir.Flag.boFight3Zone then begin //���� ��� �̺�Ʈ �濡 ����.
            if (PlayObject.m_Abil.HP <= 0) and (PlayObject.m_nFightZoneDieCount < 3) then begin    //���� ���
              PlayObject.m_Abil.HP:=PlayObject.m_Abil.MaxHP;
              PlayObject.m_Abil.MP:=PlayObject.m_Abil.MaxMP;
              PlayObject.m_boDieInFight3Zone:=True;
            end else PlayObject.m_nFightZoneDieCount:=0;
          end;
          if Envir.Flag.VailantZone then begin       //��������� �ȿ� �ִ��� �˻�


          end; 
        end;

        PlayObject.m_MyGuild:=g_GuildManager.MemberOfGuild(PlayObject.m_sCharName);
        Castle:=g_CastleManager.InCastleWarArea(Envir);
        //������������ �����ϴ°��
        if (Envir <> nil) and (Castle <> nil) then begin
          if Castle.m_boUnderWar then begin  //�������϶�
            if not Castle.IsMember(PlayObject) then begin       //�������϶� �����İ� �ƴѰ��
              PlayObject.m_sMapName:=Castle.GetATMapName();
              PlayObject.m_nCurrX:=Castle.GetATHomeX;
              PlayObject.m_nCurrY:=Castle.GetATHomeY;
            end else begin     //�������� ��������(������)
              PlayObject.m_sMapName:=Castle.GetMapName();
              PlayObject.m_nCurrX:=Castle.GetHomeX;
              PlayObject.m_nCurrY:=Castle.GetHomeY;
            end;
          end else begin
            if Castle = nil then begin  //������ �̿� �������� �ƴҶ�
              PlayObject.m_sMapName:=PlayObject.m_sHomeMap;
              PlayObject.m_nCurrX:=PlayObject.m_nHomeX - 2 + Random(5);
              PlayObject.m_nCurrY:=PlayObject.m_nHomeY - 2 + Random(5);
            end else begin
              PlayObject.m_sMapName:=Castle.GetHMapName();
              PlayObject.m_nCurrX:=Castle.GetHHomeX;
              PlayObject.m_nCurrY:=Castle.GetHHomeY;
            end;
          end;
        end; //004B00C0

        if g_MapManager.FindMap(PlayObject.m_sMapName) = nil then PlayObject.m_Abil.HP:=0; //���� ���� �� ���   //���� ������ ó��
        if PlayObject.m_Abil.HP <= 0 then begin   //���� ���
          PlayObject.ClearStatusTime();
          if PlayObject.PKLevel < 2 then begin
            Castle:=g_CastleManager.IsCastleMember(PlayObject);
            if (Castle <> nil) and Castle.m_boUnderWar then begin  //�������̸� �ɹ��ϰ��
              PlayObject.m_sMapName:=Castle.GetMapName;
              PlayObject.m_nCurrX:=Castle.GetHomeX;
              PlayObject.m_nCurrY:=Castle.GetHomeY;
            end else begin       //�������Ҷ�
              PlayObject.m_sMapName:=PlayObject.m_sHomeMap;
              PlayObject.m_nCurrX:=PlayObject.m_nHomeX - 2 + Random(5);
              PlayObject.m_nCurrY:=PlayObject.m_nHomeY - 2 + Random(5);
            end;
          end else begin //004B0201  //�����̴� ���ۿ��� �����Ѵ�.
            PlayObject.m_sMapName:=g_Config.sRedDieHomeMap{'3'};        //������
            PlayObject.m_nCurrX:=Random(13) + g_Config.nRedDieHomeX{839};
            PlayObject.m_nCurrY:=Random(13) + g_Config.nRedDieHomeY{668};
          end;
          PlayObject.m_Abil.HP:=14;
        end; //004B023D

        PlayObject.AbilCopyToWAbil();
        Envir:=g_MapManager.GetMapInfo(nServerIndex,PlayObject.m_sMapName);
        if Envir <> nil then begin
          if Envir.Flag.nGuildTerritory > 0 then begin
            if (PlayObject.m_MyGuild <> nil) and (g_GuildTerritory.FindGuildTerritory(TGuild(PlayObject.m_MyGuild).sGuildName) <> nil) then begin
              Envir:= g_MapManager.GetMapInfoEx(nServerIndex,g_GuildTerritory.FindGuildTerritory(TGuild(PlayObject.m_MyGuild).sGuildName).TerritoryNumber,PlayObject.m_sMapName);
            end else begin
              PlayObject.m_sMapName:=g_Config.sHomeMap;
              Envir:=g_MapManager.FindMap(g_Config.sHomeMap);
              PlayObject.m_nCurrX:=g_Config.nHomeX;
              PlayObject.m_nCurrY:=g_Config.nHomeY;
            end;
          end;
        end;
        if Envir = nil then begin
          PlayObject.m_nSessionID:=UserOpenInfo.LoadUser.nSessionID;
          PlayObject.m_nSocket:=UserOpenInfo.LoadUser.nSocket;
          PlayObject.m_nGateIdx:=UserOpenInfo.LoadUser.nGateIdx;
          PlayObject.m_nGSocketIdx:=UserOpenInfo.LoadUser.nGSocketIdx;
          PlayObject.m_WAbil:=PlayObject.m_Abil;
          PlayObject.m_nServerIndex:=g_MapManager.GetMapOfServerIndex(PlayObject.m_sMapName);
          if PlayObject.m_Abil.HP <> 14 then begin
            MainOutMessage(format(sChangeServerFail1,[nServerIndex,PlayObject.m_nServerIndex,PlayObject.m_sMapName,PlayObject.m_sCharName]));
            {MainOutMessage('chg-server-fail-1 [' +
                           IntToStr(nServerIndex) +
                           '] -> [' +
                           IntToStr(PlayObject.m_nServerIndex) +
                           '] [' +
                           PlayObject.m_sMapName +
                           ']');}
          end;
          SendSwitchData(PlayObject,PlayObject.m_nServerIndex);
          SendChangeServer(PlayObject,PlayObject.m_nServerIndex);
          PlayObject.Free;
          exit;
        end;
        nC:=0;
        while (True) do begin  //004B03CC
          if Envir.CanWalk(PlayObject.m_nCurrX,PlayObject.m_nCurrY,True) then break;
          PlayObject.m_nCurrX:=PlayObject.m_nCurrX - 3 + Random(6);
          PlayObject.m_nCurrY:=PlayObject.m_nCurrY - 3 + Random(6);

          Inc(nC);
          if nC >= 5 then break;
        end;

        if not Envir.CanWalk(PlayObject.m_nCurrX,PlayObject.m_nCurrY,True) then begin
          MainOutMessage(format(sChangeServerFail2,[nServerIndex,PlayObject.m_nServerIndex,PlayObject.m_sMapName,PlayObject.m_sCharName]));
          {  MainOutMessage('chg-server-fail-2 [' +
                           IntToStr(nServerIndex) +
                           '] -> [' +
                           IntToStr(PlayObject.m_nServerIndex) +
                           '] [' +
                           PlayObject.m_sMapName +
                           ']');}
          PlayObject.m_sMapName:=g_Config.sHomeMap;
          Envir:=g_MapManager.FindMap(g_Config.sHomeMap);
          PlayObject.m_nCurrX:=g_Config.nHomeX;
          PlayObject.m_nCurrY:=g_Config.nHomeY;
        end;

        PlayObject.m_PEnvir:=Envir;
        if PlayObject.m_PEnvir = nil then begin
          MainOutMessage(format(sErrorEnvirIsNil,[PlayObject.m_sCharName]));
          goto ReGetMap;
        end else begin
          PlayObject.m_boReadyRun:=False;
        end;
      end else begin //004B0561
        GetHumData(PlayObject,UserOpenInfo.HumanRcd);
        PlayObject.m_sMapName:=SwitchDataInfo.sMap;
        PlayObject.m_nCurrX:=SwitchDataInfo.wX;
        PlayObject.m_nCurrY:=SwitchDataInfo.wY;
        PlayObject.m_Abil:=SwitchDataInfo.Abil;
        PlayObject.m_WAbil:=SwitchDataInfo.Abil;
        LoadSwitchData(SwitchDataInfo,PlayObject);
        DelSwitchData(SwitchDataInfo);
        Envir:=g_MapManager.GetMapInfo(nServerIndex,PlayObject.m_sMapName);
        if Envir <> nil then begin
          MainOutMessage(format(sChangeServerFail3,[nServerIndex,PlayObject.m_nServerIndex,PlayObject.m_sMapName,PlayObject.m_sCharName]));
            {MainOutMessage('chg-server-fail-3 [' +
                           IntToStr(nServerIndex) +
                           '] -> [' +
                           IntToStr(PlayObject.m_nServerIndex) +
                           '] [' +
                           PlayObject.m_sMapName +
                           ']');}
          PlayObject.m_sMapName:=g_Config.sHomeMap;
          Envir:=g_MapManager.FindMap(g_Config.sHomeMap);
          PlayObject.m_nCurrX:=g_Config.nHomeX;
          PlayObject.m_nCurrY:=g_Config.nHomeY;
        end else begin
          if not Envir.CanWalk(PlayObject.m_nCurrX,PlayObject.m_nCurrY,True) then begin
            MainOutMessage(format(sChangeServerFail4,[nServerIndex,PlayObject.m_nServerIndex,PlayObject.m_sMapName,PlayObject.m_sCharName]));
            {MainOutMessage('chg-server-fail-4 [' +
                           IntToStr(nServerIndex) +
                           '] -> [' +
                           IntToStr(PlayObject.m_nServerIndex) +
                           '] [' +
                           PlayObject.m_sMapName +
                           ']');}
            PlayObject.m_sMapName:=g_Config.sHomeMap;
            Envir:=g_MapManager.FindMap(g_Config.sHomeMap);
            PlayObject.m_nCurrX:=g_Config.nHomeX;
            PlayObject.m_nCurrY:=g_Config.nHomeY;
          end;
          PlayObject.AbilCopyToWAbil();
          PlayObject.m_PEnvir:=Envir;
          if PlayObject.m_PEnvir = nil then begin
            MainOutMessage(sErrorEnvirIsNil);
            goto ReGetMap;
          end else begin
            PlayObject.m_boReadyRun:=False;
            PlayObject.m_boLoginNoticeOK:=True;
            PlayObject.bo6AB:=True;
          end;
        end;
      end;//004B085C
      PlayObject.m_sUserID:=UserOpenInfo.LoadUser.sAccount;
      PlayObject.m_sIPaddr:=UserOpenInfo.LoadUser.sIPaddr;
      PlayObject.m_sIPLocal:=GetIPLocal(PlayObject.m_sIPaddr);
      PlayObject.m_nSocket:=UserOpenInfo.LoadUser.nSocket;
      PlayObject.m_nGSocketIdx:=UserOpenInfo.LoadUser.nGSocketIdx;
      PlayObject.m_nGateIdx:=UserOpenInfo.LoadUser.nGateIdx;
      PlayObject.m_nSessionID:=UserOpenInfo.LoadUser.nSessionID;
      PlayObject.m_nPayMent:=UserOpenInfo.LoadUser.nPayMent;
      PlayObject.m_nPayMode:=UserOpenInfo.LoadUser.nPayMode;
      PlayObject.m_dwLoadTick:=UserOpenInfo.LoadUser.dwNewUserTick;
//      PlayObject.m_nSoftVersionDate:=UserOpenInfo.HumInfo.nSoftVersionDate;
      PlayObject.m_nSoftVersionDateEx:=GetExVersionNO(UserOpenInfo.LoadUser.nSoftVersionDate,PlayObject.m_nSoftVersionDate);
      Result:=PlayObject;
    except
      MainOutMessage(format(sExceptionMsg,[PlayObject.m_sCharName]));
    end;
  end;
var
  dwUsrRotTime     :LongWord;
  dwCheckTime      :LongWord;  //0x10
  dwCurTick        :LongWord;
  nCheck30         :Integer; //0x30
  boCheckTimeLimit :Boolean; //0x31
  nIdx             :Integer;
  PlayObject       :TPlayObject;
  I                :Integer;
  UserOpenInfo     :pTUserOpenInfo;
  GoldChangeInfo   :pTGoldChangeInfo;
  LineNoticeMsg    :String;
ResourceString
  sExceptionMsg1 = '[Exception] TUserEngine::ProcessHumans -> Ready, Save, Load... Code:=%d';
  sExceptionMsg2 = '[Exception] TUserEngine::ProcessHumans ClosePlayer.Delete - Free';
  sExceptionMsg3 = '[Exception] TUserEngine::ProcessHumans ClosePlayer.Delete';
  sExceptionMsg4 = '[Exception] TUserEngine::ProcessHumans RunNotice';
  sExceptionMsg5 = '[Exception] TUserEngine::ProcessHumans Human.Operate Code: %d User: %s';
  sExceptionMsg6 = '[Exception] TUserEngine::ProcessHumans Human.Finalize Code: %d';
  sExceptionMsg7 = '[Exception] TUserEngine::ProcessHumans RunSocket.CloseUser Code: %d';
  sExceptionMsg8 = '[Exception] TUserEngine::ProcessHumans';
begin
  nCheck30:=0;
  dwCheckTime:=GetTickCount();
  
  if (GetTickCount - m_dwProcessLoadPlayTick) > 200 then begin
    m_dwProcessLoadPlayTick:=GetTickCount();
    try
      EnterCriticalSection(m_LoadPlaySection);
      try

        for i:=0 to m_LoadPlayList.Count -1 do begin
          UserOpenInfo:=pTUserOpenInfo(m_LoadPlayList.Objects[i]);
          if not FrontEngine.IsFull and not IsLogined(UserOpenInfo.sAccount, m_LoadPlayList.Strings[i]) then begin

            PlayObject:=MakeNewHuman(UserOpenInfo);

            if PlayObject <> nil then begin
              PlayObject.AddMapCount;       //�����ڽý���
              //PlayObject.m_boClientFlag:=UserOpenInfo.LoadUser.boClinetFlag; //���ͻ��˱�־��������������
              m_PlayObjectList.AddObject(m_LoadPlayList.Strings[i],PlayObject);
              SendServerGroupMsg(SS_201,nServerIndex,PlayObject.m_sCharName);
              m_NewHumanList.Add(PlayObject);
            end;

          end else begin//004B0BF9
            KickOnlineUser(m_LoadPlayList.Strings[i]);
            m_ListOfGateIdx.Add(Pointer(UserOpenInfo.LoadUser.nGateIdx)); //004B0C39
            m_ListOfSocket.Add(Pointer(UserOpenInfo.LoadUser.nSocket));
          end;
          try
            Dispose(UserOpenInfo);
          except
            UserOpenInfo := nil;
            MainOutMessage('Error Dispose(UserOpenInfo)');
          end;
         // Dispose(pTUserOpenInfo(m_LoadPlayList.Objects[I]));
        end;//004B0C96
        m_LoadPlayList.Clear;
        for I:=0 to m_ChangeHumanDBGoldList.Count -1 do begin
          GoldChangeInfo:=m_ChangeHumanDBGoldList.Items[I];
          PlayObject:=GeTPlayObject(GoldChangeInfo.sGameMasterName);
          if PlayObject <> nil then begin
            PlayObject.GoldChange(GoldChangeInfo.sGetGoldUser,GoldChangeInfo.nGold);
          end;
          Dispose(GoldChangeInfo);
        end;
        m_ChangeHumanDBGoldList.Clear;
      finally
        LeaveCriticalSection(m_LoadPlaySection);
      end;

      //004B0D4A
      for I:=0 to m_NewHumanList.Count -1 do begin
         PlayObject:=TPlayObject(m_NewHumanList.Items[I]);

        RunSocket.SetGateUserList(PlayObject.m_nGateIdx,PlayObject.m_nSocket,PlayObject);

      end;
      m_NewHumanList.Clear;
      

      for i:=0 to m_ListOfGateIdx.Count -1 do begin

        RunSocket.CloseUser(Integer(m_ListOfGateIdx.Items[i]),Integer(m_ListOfSocket.Items[i]));//GateIdx,nSocket

      end;
      m_ListOfGateIdx.Clear;
      m_ListOfSocket.Clear;
    except
      on e: Exception do begin
        MainOutMessage(format(sExceptionMsg1,[0]));
        MainOutMessage(E.Message);
      end;
    end;
  end;//004B0E1E
  

  try
    for I := 0 to m_PlayObjectFreeList.Count - 1 do begin
      PlayObject:=TPlayObject(m_PlayObjectFreeList.Items[i]);
      if (GetTickCount - PlayObject.m_dwGhostTick) > g_Config.dwHumanFreeDelayTime {5 * 60 * 1000} then begin
        try
          TPlayObject(m_PlayObjectFreeList.Items[i]).Free;        //�ܻ��� ���´ٸ� �������� �� �ִ�.
        except
          MainOutMessage(sExceptionMsg2);
        end;
        
        m_PlayObjectFreeList.Delete(i);
        break;
      end else begin
        if PlayObject.m_boSwitchData and (PlayObject.m_boRcdSaved) then begin           //������ �ϰ� �� �Ŀ� ���� �̵��� ��Ų��.
          if SendSwitchData(PlayObject,PlayObject.m_nServerIndex) or (PlayObject.m_nWriteChgDataErrCount > 20) then begin
            PlayObject.m_boSwitchData:=False;
            PlayObject.m_boSwitchDataSended:=True;
            PlayObject.m_dwChgDataWritedTick:=GetTickCount();
          end else Inc(PlayObject.m_nWriteChgDataErrCount);
        end;
        if PlayObject.m_boSwitchDataSended and ((GetTickCount - PlayObject.m_dwChgDataWritedTick) > 100) then begin
          PlayObject.m_boSwitchDataSended:=False;
          SendChangeServer(PlayObject,PlayObject.m_nServerIndex);
        end;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg3);
  end;//004B0F91


  boCheckTimeLimit:=False;//004B0F91
  try
    dwCurTick:=GetTickCount();
    nIdx:=m_nProcHumIDx;
     while True do begin
       if m_PlayObjectList.Count <= nIdx then break;
       PlayObject:=TPlayObject(m_PlayObjectList.Objects[nIdx]);
       if Integer(dwCurTick - PlayObject.m_dwRunTick) > PlayObject.m_nRunTime then begin
         PlayObject.m_dwRunTick:=dwCurTick;
         if not PlayObject.m_boGhost then begin
           if not PlayObject.m_boLoginNoticeOK then begin
             try
               PlayObject.RunNotice();
             except
               MainOutMessage(sExceptionMsg4);
             end;
           end else begin//004B1058
             nCheck30:=10;
             try
               nCheck30:=11;
               if not PlayObject.m_boReadyRun then begin
                 PlayObject.m_boReadyRun:=True;//004B1075
                 PlayObject.UserLogon; //BaseObject.0FFFEh;
               end else begin
                 nCheck30:=12;
                 if (GetTickCount() - PlayObject.m_dwSearchTick) > PlayObject.m_dwSearchTime then begin
                   nCheck30:=13;
                   PlayObject.m_dwSearchTick:=GetTickCount();
                   nCheck30:=14;
                   PlayObject.SearchViewRange;
                   nCheck30:=15;
                   PlayObject.GameTimeChanged;
                 end;//004B10C4
                 nCheck30:=16;
                 if (GetTickCount() - PlayObject.m_dwShowLineNoticeTick) > g_Config.dwShowLineNoticeTime then begin
                   PlayObject.m_dwShowLineNoticeTick:=GetTickCount();
                   nCheck30:=17;
                   if LineNoticeList.Count > PlayObject.m_nShowLineNoticeIdx then begin
                     nCheck30:=18;
                     LineNoticeMsg:=g_ManageNPC.GetLineVariableText(PlayObject,
                        LineNoticeList.Strings[PlayObject.m_nShowLineNoticeIdx]);

                     case LineNoticeMsg[1] of  
                       'R': PlayObject.SysMsg(Copy(LineNoticeMsg,2,length(LineNoticeMsg) - 1),c_Red,t_Notice);
                       'G': PlayObject.SysMsg(Copy(LineNoticeMsg,2,length(LineNoticeMsg) - 1),c_Green,t_Notice);
                       'B': PlayObject.SysMsg(Copy(LineNoticeMsg,2,length(LineNoticeMsg) - 1),c_Blue,t_Notice);
                       'T': PlayObject.SendDefMsg(TBaseObject(Self), SM_TOPMSG, 0, 0, 0, 0, Copy(LineNoticeMsg, 2, Length(LineNoticeMsg) - 1));
                       else begin
                         PlayObject.SysMsg(LineNoticeMsg,TMsgColor(g_Config.nLineNoticeColor){c_Blue},t_Notice);
                       end;
                     end;
                   end;
                   nCheck30:=19;
                   Inc(PlayObject.m_nShowLineNoticeIdx);
                   if (LineNoticeList.Count <= PlayObject.m_nShowLineNoticeIdx) then
                     PlayObject.m_nShowLineNoticeIdx:=0;
                 end;
                 nCheck30:=20;
                 PlayObject.Run();
                 nCheck30:=21;
                 if not FrontEngine.IsFull and((GetTickCount() - PlayObject.m_dwSaveRcdTick) > g_Config.dwSaveHumanRcdTime) then begin
                   PlayObject.m_dwSaveRcdTick:=GetTickCount();
                   nCheck30:=22;
                   PlayObject.DealCancelA();
                   PlayObject.RentalCancelA();
                   nCheck30:=23;
                   SaveHumanRcd(PlayObject);
                 end;
                 nCheck30:=24;
               end;//004B119F
             except
               on e: Exception do begin
                 MainOutMessage(format(sExceptionMsg5,[nCheck30, PlayObject.m_sCharName]));
                 MainOutMessage(E.Message);
               end;
             end;
           end;
         end else begin//if not PlayObject.boIsGhost then begin  //CODE:004B11C5
           try
             m_PlayObjectList.Delete(nIdx);
             nCheck30:=2;

             PlayObject.Disappear();

             nCheck30:=3;
           except
             on e: Exception do begin
               MainOutMessage(format(sExceptionMsg6,[nCheck30]));
               MainOutMessage(E.Message);
             end;
           end;//004B1232
           try

             AddToHumanFreeList(PlayObject);

             nCheck30:=4;
             PlayObject.DealCancelA();
             PlayObject.RentalCancelA();

             SaveHumanRcd(PlayObject);

             RunSocket.CloseUser(PlayObject.m_nGateIdx,PlayObject.m_nSocket);

           except
             MainOutMessage(format(sExceptionMsg7,[nCheck30]));
           end;//004B12BA

           SendServerGroupMsg(SS_202,nServerIndex,PlayObject.m_sCharName);
           Continue;
         end;
       end;//if (dwTime14 - PlayObject.dw368) > PlayObject.dw36C then begin
       Inc(nIdx);//004B12E6
       if (GetTickCount - dwCheckTime) > g_dwHumLimit then begin
         boCheckTimeLimit:=True;
         m_nProcHumIDx:=nIdx;
         break;
       end;
     end;//while True do begin
     if not boCheckTimeLimit then m_nProcHumIDx:=0;
  except
    MainOutMessage(sExceptionMsg8);
  end;
  Inc(nProcessHumanLoopTime);
  g_nProcessHumanLoopTime:=nProcessHumanLoopTime;
  if m_nProcHumIDx = 0 then begin
    nProcessHumanLoopTime:=0;
    g_nProcessHumanLoopTime:=nProcessHumanLoopTime;
    dwUsrRotTime:=GetTickCount - g_dwUsrRotCountTick;
    dwUsrRotCountMin:=dwUsrRotTime;
    g_dwUsrRotCountTick:=GetTickCount();
    if dwUsrRotCountMax < dwUsrRotTime then dwUsrRotCountMax:=dwUsrRotTime;
  end;
  g_nHumCountMin:=GetTickCount - dwCheckTime;
  if g_nHumCountMax < g_nHumCountMin then g_nHumCountMax:=g_nHumCountMin;
end;


procedure TUserEngine.ProcessHeros();
  function MakeNewHero(PlayObject: TPlayObject; UserOpenInfo: pTUserOpenInfo): THeroObject;
    function GetNextDirectionForDirection(btDirection: Byte): Byte;
    begin
      Result := 0;
      case btDirection of
        DR_UP: Result := DR_UPRIGHT;
        DR_DOWN: Result := DR_DOWNLEFT;
        DR_LEFT: Result := DR_UPLEFT;
        DR_RIGHT: Result := DR_DOWNRIGHT;
        DR_UPLEFT: Result := DR_UP;
        DR_UPRIGHT: Result := DR_RIGHT;
        DR_DOWNLEFT: Result := DR_LEFT;
        DR_DOWNRIGHT: Result := DR_DOWN;
      end;
    end;
  var
    HeroObject: THeroObject;
    p28: TBaseObject;
    Abil: pTAbility;
    n20, n24, n1C: Integer;
    I: Integer;
    bo10: Boolean;
    btDirection: Byte;
  begin
    Result := nil;
    HeroObject := nil;
    if PlayObject.m_MyHero <> nil then Exit;
    HeroObject := THeroObject.Create;
    HeroObject.m_nSessionID := PlayObject.m_nSessionID;

    GetHeroData(HeroObject, UserOpenInfo.HumanRcd);
    HeroObject.m_btRaceServer:= RC_HEROOBJECT;
    if HeroObject.m_sMapName = '' then begin
      HeroObject.m_sHomeMap := PlayObject.m_sHomeMap;
      HeroObject.m_sMapName := PlayObject.m_sMapName;
      HeroObject.m_PEnvir := PlayObject.m_PEnvir;
      HeroObject.m_btStatus := 0;
      bo10 := False;
      n20 := 0;
      n24 := 0;
      PlayObject.GetBackPosition(n20, n24);
      if PlayObject.m_PEnvir.CanWalk(n20, n24, TRUE) then begin
        bo10 := True;
        HeroObject.m_nCurrX := n20;
        HeroObject.m_nCurrY := n24;
      end;

      if not bo10 then begin
        btDirection := GetNextDirectionForDirection(PlayObject.m_btDirection);
        for I := 0 to 7 do begin
          PlayObject.GetBackPosition(btDirection, n20, n24);
          if PlayObject.m_PEnvir.CanWalk(n20, n24, TRUE) then begin
            bo10 := True;
            HeroObject.m_nCurrX := n20;
            HeroObject.m_nCurrY := n24;
            Break;
          end;
          btDirection := GetNextDirectionForDirection(btDirection);
        end;

        if not bo10 then begin
          n1C := 0;
          while (True) do begin
            if PlayObject.m_PEnvir.CanWalk(HeroObject.m_nCurrX, HeroObject.m_nCurrY, True) then Break;
            HeroObject.m_nCurrX := HeroObject.m_nCurrX - 2 + Random(4);
            HeroObject.m_nCurrY := HeroObject.m_nCurrY - 2 + Random(4);
            Inc(n1C);
            if n1C >= 5 then Break;
          end;
        end;
      end;

      HeroObject.m_btDirection := Random(8);
      //if HeroObject.m_Abil.Level >= 0 then begin

      Abil := @HeroObject.m_Abil;
      Abil.Level := g_Config.nHeroStartLevel;
      Abil.AC := 0;
      Abil.MAC := 0;
      Abil.DC := MakeLong(1, 2);
      Abil.MC := MakeLong(1, 2);
      Abil.SC := MakeLong(1, 2);
      Abil.MP := 15;
      Abil.HP := 15;
      Abil.MaxHP := 15;
      Abil.MaxMP := 15;
      Abil.Exp := 0;
      Abil.MaxExp := 100;
      Abil.Weight := 100;
      Abil.MaxWeight := 100;

      HeroObject.m_boNewHero := True;
    end;

    if HeroObject.m_Abil.HP <= 0 then begin
      HeroObject.m_Abil.HP := 14;
      FillChar(HeroObject.m_wStatusTimeArr, SizeOf(TStatusTime), #0);
      FillChar(HeroObject.m_btStatusValue, SizeOf(byte)*MAX_STATUS_ATTRIBUTE, #0);
    end;

    if HeroObject.m_PEnvir = nil then begin
      //HeroObject.m_PEnvir := g_MapManager.FindMap(HeroObject.m_sMapName);
      //if HeroObject.m_PEnvir = nil then begin
      HeroObject.m_sHomeMap := PlayObject.m_sHomeMap;
      HeroObject.m_sMapName := PlayObject.m_sMapName;
      //end;
    end;
    HeroObject.m_PEnvir := PlayObject.m_PEnvir;


    bo10 := False;
    n20 := 0;
    n24 := 0;
    PlayObject.GetBackPosition(n20, n24);
    if PlayObject.m_PEnvir.CanWalk(n20, n24, True) then begin
      bo10 := True;
      HeroObject.m_nCurrX := n20;
      HeroObject.m_nCurrY := n24;
    end;

    if not bo10 then begin
      btDirection := GetNextDirectionForDirection(PlayObject.m_btDirection);
      for I := 0 to 7 do begin
        PlayObject.GetBackPosition(btDirection, n20, n24);
        if PlayObject.m_PEnvir.CanWalk(n20, n24, True) then begin
          bo10 := True;
          HeroObject.m_nCurrX := n20;
          HeroObject.m_nCurrY := n24;
          Break;
        end;
        btDirection := GetNextDirectionForDirection(btDirection);
      end;

      if not bo10 then begin
        n1C := 0;
        while (True) do begin
          if PlayObject.m_PEnvir.CanWalk(HeroObject.m_nCurrX, HeroObject.m_nCurrY, True) then Break;
          HeroObject.m_nCurrX := HeroObject.m_nCurrX - 2 + Random(4);
          HeroObject.m_nCurrY := HeroObject.m_nCurrY - 2 + Random(4);
          Inc(n1C);
          if n1C >= 5 then Break;
        end;
      end;
    end;

    HeroObject.m_WAbil := HeroObject.m_Abil;

    if PlayObject is TPlayObject then
      HeroObject.m_Master := PlayObject;

    HeroObject.Initialize();

    if HeroObject.m_boAddtoMapSuccess then begin
      p28 := nil;
      if HeroObject.m_PEnvir.m_nWidth < 50 then n20 := 2
      else n20 := 3;
      if (HeroObject.m_PEnvir.m_nHeight < 250) then begin
        if (HeroObject.m_PEnvir.m_nHeight < 30) then n24 := 2
        else n24 := 20;
      end else n24 := 50;

      n1C := 0;
      while (True) do begin
        if not HeroObject.m_PEnvir.CanWalk(HeroObject.m_nCurrX, HeroObject.m_nCurrY, True) then begin
          if (HeroObject.m_PEnvir.m_nWidth - n24 - 1) > HeroObject.m_nCurrX then begin
            Inc(HeroObject.m_nCurrX, n20);
          end else begin
            HeroObject.m_nCurrX := Random(HeroObject.m_PEnvir.m_nWidth div 2) + n24;
            if HeroObject.m_PEnvir.m_nHeight - n24 - 1 > HeroObject.m_nCurrY then begin
              Inc(HeroObject.m_nCurrY, n20);
            end else begin
              HeroObject.m_nCurrY := Random(HeroObject.m_PEnvir.m_nHeight div 2) + n24;
            end;
          end;
        end else begin
          p28 := HeroObject.m_PEnvir.AddToMap(HeroObject.m_nCurrX, HeroObject.m_nCurrY, OS_MOVINGOBJECT, HeroObject);

          Break;
        end;
        Inc(n1C);
        if n1C >= 31 then Break;
      end;
      if p28 = nil then begin
        FreeAndNil(HeroObject);
      end;
    end;

    Result := HeroObject;
  end;

  function IsLogined(sAccount, sChrName: string): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    if FrontEngine.InSaveRcdList(sAccount, sChrName) then begin
      Result := True;
    end else begin
      for I := 0 to m_HeroObjectList.Count - 1 do begin
        if (CompareText(THeroObject(m_HeroObjectList.Objects[I]).m_sUserID, sAccount) = 0) and
          (CompareText(m_HeroObjectList.Strings[I], sChrName) = 0) then begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
var
  dwRunTick, dwCurrTick: LongWord;
  nIdx, I: Integer;
  HeroObject: THeroObject;
  boProcessLimit: Boolean;
  UserOpenInfo: pTUserOpenInfo;
  PlayObject: TPlayObject;
resourcestring
  sExceptionMsg1 = '[Exception] TUserEngine::ProcessHeros -> Ready, Save, Load... Code:=%d';
  sExceptionMsg2 = '[Exception] TUserEngine::ProcessHeros';
begin
  if (GetTickCount - m_dwProcessLoadHeroTick) > 200 then begin
    m_dwProcessLoadHeroTick := GetTickCount();
    try
      EnterCriticalSection(m_LoadHeroSection);
      try
        for I := 0 to m_LoadHeroList.Count - 1 do begin
          UserOpenInfo := pTUserOpenInfo(m_LoadHeroList.Objects[I]);
          if not IsLogined(UserOpenInfo.sAccount, m_LoadHeroList.Strings[I]) then begin
            PlayObject := GetPlayObject(TPlayObject(UserOpenInfo.LoadUser.PlayObject));
            if (PlayObject <> nil) and (not PlayObject.m_boGhost) then begin
              PlayObject.m_boWaitHeroDate := False;
              case UserOpenInfo.LoadUser.HeroData of
                l_Create: begin
                    case UserOpenInfo.nResult of
                      0: begin    //�̸� ������ ��������
                          PlayObject.m_sTempHeroName := '';
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@HeroNameFilter', False);
                          end;
                        end;
                      1: begin    //���� ���� ����
                          PlayObject.m_sHeroCharName := PlayObject.m_sTempHeroName;
                     //     MainOutMessage('�������� ����');
                          PlayObject.m_sTempHeroName := '';
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@CreateHeroOK', False);
                            PlayObject.SendDefMessage(SM_HEROINFO, 0, 0, 0, BoolToInt(PlayObject.m_sHeroCharName <> ''), '');
                          end;
                        end;
                      2: begin  //�̹� �����ϰų� ������ �̸�
                          PlayObject.m_sTempHeroName := '';
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@HeroNameExists', False);
                          end;
                        end;
                      3: begin     //���� ���� Ȯ��
                          PlayObject.m_sTempHeroName := '';
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@HeroOverChrCount', False);
                          end;
                        end;
                      4: begin    //���� ���� ����
                          PlayObject.m_sTempHeroName := '';
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@CreateHeroFail', False);
                          end;
                        end;
                    else begin
                        PlayObject.m_sTempHeroName := '';
                        if g_FunctionNPC <> nil then begin
                          PlayObject.m_nScriptGotoCount := 0;
                          g_FunctionNPC.GotoLable(PlayObject, '@CreateHeroFailEx', False);
                        end;
                      end;
                    end;
                  end;
                l_Delete: begin
                    case UserOpenInfo.nResult of
                      0: begin     //���� ����
                          if UserOpenInfo.NPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            TMerchant(UserOpenInfo.NPC).GotoLable(PlayObject, '@DeleteHeroFail', False);
                          end;
                        //  MainOutMessage('�������� ����');
                        end;
                      1: begin    //���� ���� �Ϸ�
                          PlayObject.m_sHeroCharName := '';
                        //  MainOutMessage('�������� �Ϸ�');
                          if UserOpenInfo.NPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            TMerchant(UserOpenInfo.NPC).GotoLable(PlayObject, '@DeleteHeroOK', False);
                            PlayObject.SendDefMessage(SM_HEROINFO, 0, 0, 0, BoolToInt(PlayObject.m_sHeroCharName <> ''), '');
                          end;
                          if g_FunctionNPC <> nil then begin
                            PlayObject.m_nScriptGotoCount := 0;
                            g_FunctionNPC.GotoLable(PlayObject, '@DeleteHeroOK', False);
                          end;
                        end;
                    end;
                  end;
                l_Load: begin
                    case UserOpenInfo.nResult of
                      0: begin
                      //    MainOutMessage('�����ε� ����');
                        end;
                      1: begin //��ȡ�ɹ�
                          HeroObject := MakeNewHero(PlayObject, UserOpenInfo);
                          if HeroObject <> nil then begin
                            PlayObject.m_MyHero := HeroObject;
                            HeroObject.m_Master := PlayObject;
                            HeroObject.m_sUserID := PlayObject.m_sUserID;
                            HeroObject.m_sMasterName := PlayObject.m_sCharName;
                            HeroObject.AddMapCount;  //�����ڽý���
                            HeroObject.LogOn;
                            m_HeroObjectList.AddObject(m_LoadHeroList.Strings[I], HeroObject);
                       //     MainOutMessage('�����ε� ����');
                          end;
                        end;
                    end;
                  end;
              end;
            end;
          end;
          Dispose(UserOpenInfo);
        end;
        m_LoadHeroList.Clear;
      finally
        LeaveCriticalSection(m_LoadHeroSection);
      end;
    except
      on E: Exception do begin
        MainOutMessage(Format(sExceptionMsg1, [0]));
        MainOutMessage(E.Message);
      end;
    end;
  end;

  try
    for I := 0 to m_HeroObjectFreeList.Count - 1 do begin
      HeroObject := THeroObject(m_HeroObjectFreeList.Items[I]);
      if (GetTickCount - HeroObject.m_dwGhostTick) > g_Config.dwHumanFreeDelayTime  then begin
        try
          THeroObject(m_HeroObjectFreeList.Items[I]).Free;
        except
          on E: Exception do begin
            MainOutMessage(Format(sExceptionMsg1, [1]));
            MainOutMessage(E.Message);
          end;
        end;
        m_HeroObjectFreeList.Delete(I);
        Break;
      end;
    end;
  except
    on E: Exception do begin
      MainOutMessage(Format(sExceptionMsg1, [2]));
      MainOutMessage(E.Message);
    end;
  end;

  dwRunTick := GetTickCount();
  boProcessLimit := False;
  try
    dwCurrTick := GetTickCount();
    m_HeroObjectList.Lock;
    try
      nIdx := nHeroPosition;
      while True do begin
        if m_HeroObjectList.Count <= nIdx then Break;
        HeroObject := THeroObject(m_HeroObjectList.Objects[nIdx]);
        if not HeroObject.m_boGhost then begin
          if Integer(dwCurrTick - HeroObject.m_dwRunTick) > HeroObject.m_nRunTime then begin
            if (GetTickCount - HeroObject.m_dwSearchTick) > HeroObject.m_dwSearchTime then begin
              HeroObject.m_dwSearchTick := GetTickCount();
              HeroObject.SearchViewRange();
            end;
            if Integer(dwCurrTick - HeroObject.m_dwRunTick) > HeroObject.m_nRunTime then begin
              HeroObject.m_dwRunTick := dwCurrTick;
              HeroObject.Run;

              if not FrontEngine.IsFull and ((GetTickCount() - HeroObject.m_dwSaveRcdTick) > g_Config.dwSaveHumanRcdTime) then begin
                HeroObject.m_dwSaveRcdTick := GetTickCount();
                SaveHeroRcd(HeroObject);
              end;
            end;
          end;
        end else begin
          m_HeroObjectList.Delete(nIdx);
          AddToHeroFreeList(HeroObject);
          SaveHeroRcd(HeroObject);
          try
            if HeroObject.m_Master <> nil then begin
              if TPlayObject(HeroObject.m_Master).m_MyHero = HeroObject then
                TPlayObject(HeroObject.m_Master).m_MyHero := nil;
            end;
          except
            MainOutMessage(sExceptionMsg2 + ' Free');
          end;
          Continue;
        end;
        Inc(nIdx);
        if (GetTickCount - dwRunTick) > g_dwHeroLimit then begin
          nHeroPosition := nIdx;
          boProcessLimit := True;
          Break;
        end;
      end;
    finally
      m_HeroObjectList.UnLock;
    end;
    if not boProcessLimit then begin
      nHeroPosition := 0;
    end;
  except
    MainOutMessage(sExceptionMsg2);
  end;
  dwProcessHeroTimeMin := GetTickCount - dwRunTick;
  if dwProcessHeroTimeMin > dwProcessHeroTimeMax then dwProcessHeroTimeMax := dwProcessHeroTimeMin;
end;

procedure TUserEngine.ProcessMerchants;//004B1B8C
var
  dwRunTick,dwCurrTick:LongWord;
  i:integer;
  MerchantNPC:TMerchant;
  boProcessLimit:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::ProcessMerchants';
begin
  dwRunTick:=GetTickCount();
  boProcessLimit:=False;
  try
    dwCurrTick:=GetTickCount();
    m_MerchantList.Lock;
    try
      for i:=nMerchantPosition to m_MerchantList.Count -1 do begin
        MerchantNPC:=m_MerchantList.Items[i];
        if not MerchantNPC.m_boGhost then begin
          if Integer(dwCurrTick - MerchantNPC.m_dwRunTick) > MerchantNPC.m_nRunTime then begin
            if (GetTickCount - MerchantNPC.m_dwSearchTick) > MerchantNPC.m_dwSearchTime then begin
              MerchantNPC.m_dwSearchTick:=GetTickCount();
              MerchantNPC.SearchViewRange();
            end;//004B1C3C
            if Integer(dwCurrTick - MerchantNPC.m_dwRunTick) > MerchantNPC.m_nRunTime then begin
              MerchantNPC.m_dwRunTick:=dwCurrTick;
              MerchantNPC.Run;  {FFFFB}
            end;
          end;//004B1C6B
        end else begin//004B1C6B
          if (GetTickCount - MerchantNPC.m_dwGhostTick) > 60 * 1000 then begin
            MerchantNPC.Free;
            m_MerchantList.Delete(i);
            break;
          end;
        end;
        if (GetTickCount - dwRunTick) > g_dwNpcLimit then begin
          nMerchantPosition:=i;
          boProcessLimit:=True;
          Break;
        end;//004B1C8C
      end;//004B1C98
    finally
      m_MerchantList.UnLock;
    end;
    if not boProcessLimit then begin
      nMerchantPosition:=0;
    end;//004B1CA6
  except
    MainOutMessage(sExceptionMsg);
  end;
  dwProcessMerchantTimeMin:=GetTickCount - dwRunTick;
  if dwProcessMerchantTimeMin > dwProcessMerchantTimeMax then dwProcessMerchantTimeMax:=dwProcessMerchantTimeMin;
  if dwProcessNpcTimeMin > dwProcessNpcTimeMax then dwProcessNpcTimeMax:=dwProcessNpcTimeMin;
end;

procedure TUserEngine.ProcessMissions;
begin

end;

procedure TUserEngine.ProcessMonsters;
  function GetZenTime(tMap: TEnvirnoment; dwTime:LongWord):LongWord;      //������� ���� ���� ���� �����Ⱑ �ٲ�.
  var
    r:Real;
  begin
    if tMap <> nil then begin
      if tMap.m_nMobZenDelay >= 100 then begin                          //�����ڽý��� ����
        Result := dwTime + Round((dwTime * ((tMap.m_nMobZenDelay / 10) - 10)) / 10);
      end else begin
        Result := dwTime - Round((dwTime * ((tMap.m_nMobZenDelay / 10) - 10)) / 10);  //- Round((dwTime / 10) * ((tMap.m_nMobZenDelay / 10)));
      end;
    end else begin
      Result := dwTime;
    end;
  end;
var
  dwCurrentTick    :LongWord;
  dwRunTick        :LongWord;
  dwMonProcTick    :LongWord;
  MonGen           :pTMonGenInfo;
  nGenCount        :Integer;
  nGenModCount     :Integer;
  lack   :Boolean;
  boRegened        :Boolean;
  I                :Integer;
  k :Integer;
  Monster          :TBaseObject;
  tCode            :Integer;
  nTemp:LongWord;
  Map:TEnvirnoment;
  boCanCreate      :Boolean;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::ProcessMonsters %d %s';
begin
  tCode     := 0;
  dwRunTick := GetTickCount();
  try
    tCode          := 0;
    lack := False;
    dwCurrentTick  := GetTickCount();
    MonGen         := nil;

    if ((GetTickCount - dwRegenMonstersTick) > g_Config.dwRegenMonstersTime) then begin
      dwRegenMonstersTick:=GetTickCount();
      if m_nCurrMonGen < m_MonGenList.Count then begin
        MonGen:=m_MonGenList.Items[m_nCurrMonGen];
      end;

      if m_nCurrMonGen < m_MonGenList.Count - 1 then begin
        Inc(m_nCurrMonGen);
      end else begin
        m_nCurrMonGen:=0;
      end;//004B1718

      if (MonGen <> nil) and (MonGen.sMonName <> '') and not g_Config.boVentureServer then begin
        Map := g_MapManager.FindMap(MonGen.sMapName);
        nTemp := GetTickCount - MonGen.dwStartTick;
        if (MonGen.dwStartTick = 0) or (nTemp > GetZenTime(Map, MonGen.dwZenTime)) then begin
          nGenCount := GetGenMonCount(MonGen);   //���� �����ִ� ��
          boRegened := True;
          nGenModCount := MonGen.nCount;                                        //�����ڽý��� ����
          if nGenModCount >= g_Config.nMobGenCount then begin                   //�����ڽý��� ����
            nGenModCount := Round(MonGen.nCount * (Map.m_nMobZenRate / 100));        //��ǥ �� �� ����  //�����ڽý��� ����
          end else begin
            nGenModCount := MonGen.nCount;
          end;
          if (Map.Flag.boNOHUMNOMON or Map.m_boHumGen) and (Map.HumCount = 0) then
            boCanCreate := False
          else
            boCanCreate := True;
          if (nGenModCount > nGenCount) and (boCanCreate) then begin
            boRegened:=RegenMonsters(MonGen,nGenModCount - nGenCount);
          end;//004B1798
          if boRegened then begin
            MonGen.dwStartTick:=GetTickCount();
          end;
        end;//004B17A9
        g_sMonGenInfo1:=MonGen.sMonName + ',' + IntToStr(m_nCurrMonGen) + '/' + IntToStr(m_MonGenList.Count)     //�����ڽý��� ����
          + '/' + IntToStr(nGenModCount)+ '/' + IntToStr(nGenCount);
      end;//004B1851
    end;//004B1851

    g_nMonGenTime:=GetTickCount - dwCurrentTick;
    if g_nMonGenTime > g_nMonGenTimeMin then g_nMonGenTimeMin:=g_nMonGenTime;
    if g_nMonGenTime > g_nMonGenTimeMax then g_nMonGenTimeMax:=g_nMonGenTime;

    //Refresh monster end

      dwMonProcTick:=GetTickCount();
      MonCurRunCount:=0;
      tCode:=1;
      //004B187B
      for I:= MonCur to m_MonGenList.Count -1 do begin
        MonGen:=m_MonGenList.Items[I];
        tCode:=11;
        if MonSubCur < MonGen.CertList.Count then begin
          k:=MonSubCur;
        end else begin//4B18A8
          k:=0;
        end;
        MonSubCur:=0;
        //4B18B5
        while (True) do begin
          if k >= MonGen.CertList.Count then break;
          Monster:=TBaseObject(MonGen.CertList.Items[k]);
          tCode:=12;
          if (Monster <> nil) then begin
            if (not Monster.m_boGhost) then begin
              if Integer(dwCurrentTick - Monster.m_dwRunTick) > Monster.m_nRunTime then begin
                Monster.m_dwRunTick:=dwRunTick;
                if (dwCurrentTick - Monster.m_dwSearchTick) > Monster.m_dwSearchTime then begin
                  Monster.m_dwSearchTick:=GetTickCount();
                  tCode:=13;
                  Monster.SearchViewRange()
                end;
                tCode:=14;
                if (not Monster.m_boIsVisibleActive) and (Monster.m_nProcessRunCount < g_Config.nProcessMonsterInterval) then begin
                  Inc(Monster.m_nProcessRunCount);
                end else begin
                  try
                    tCode := 15;
                    Monster.Run;
                    tCode := 16;
                    Monster.m_nProcessRunCount:=0;
                    Inc (MonCurRunCount);
                  except
                    tCode := 17;
                    MonGen.CertList.Delete(k);
                    tCode := 18;
                    Monster := nil;
                  end; 
                end;
              end;
              tCode := 20;
              Inc(MonCurCount);
            end else begin
              tCode := 21;
              //5���� ������ free ��Ų��.
              if (GetTickCount - Monster.m_dwGhostTick) > 5 * 60 * 1000 then begin
                tcode:=22;
                MonGen.CertList.Delete(k);
                tcode:=23;
                Monster.Free;
                tcode:=24;
                Monster := nil;
                tcode:=25;
                Continue;
              end;
            end;
          end;
          tcode:=26;
          Inc(k);
          if (GetTickCount - dwMonProcTick) > g_dwMonLimit then begin
            g_sMonGenInfo2 := Monster.m_sCharName + '/' + IntToStr(k) +
            '/' + IntToStr(MonGen.CertList.Count) +
            '/' + IntToStr(i) +
            '/' + IntToStr(m_MonGenList.Count);
            lack:=True;
            MonSubCur:=k;
            break;
          end;
        end; //while (True) do begin
        if lack then break;
      end;//for I:= MonCur to MonGenList.Count -1 do begin
      //004B1A5D

      tCode:=2;
      if I >= m_MonGenList.Count then begin
        MonCur:=0;
        MonCount:=MonCurCount;
        MonCurCount:=0;
        MonRunCount:=(MonRunCount + MonCurRunCount) div 2;
      end;//4B1AAF

      if not lack then begin
        MonCur:=0;
      end else begin
        MonCur:=I;
      end;
      g_nMonProcTime:=GetTickCount - dwMonProcTick;
      if g_nMonProcTime > g_nMonProcTimeMin then g_nMonProcTimeMin:=g_nMonProcTime;
      if g_nMonProcTime > g_nMonProcTimeMax then g_nMonProcTimeMax:=g_nMonProcTime;

  except
    on e: Exception do begin
      if Monster <> nil then begin
       // Monster.KickException;
        MainOutMessage(Format(sExceptionMsg, [tCode, Monster.m_sCharName]) + ' Address:' + IntToHex(Integer(@Monster), 8) + ' Ghost:' + BoolToStr(Monster.m_boGhost));
        MainOutMessage(E.Message);
      end else begin
        MainOutMessage(Format(sExceptionMsg, [tCode, '']));
        MainOutMessage(E.Message);
      end;
    end;
  end;
  g_nMonTimeMin:=GetTickCount - dwRunTick;
  if g_nMonTimeMax < g_nMonTimeMin then g_nMonTimeMax:=g_nMonTimeMin;
end;
function TUserEngine.GetGenMonCount(MonGen:pTMonGenInfo):Integer;//4AE19C
var
  I          :Integer;
  nCount     :Integer;
  BaseObject :TBaseObject;
begin
  nCount:=0;
  for I:=0 to MonGen.CertList.Count -1 do begin
    BaseObject:=TBaseObject(MonGen.CertList.Items[I]);
    if not BaseObject.m_boDeath and not BaseObject.m_boGhost then Inc(nCount);
  end;
  Result:=nCount;
end;

procedure TUserEngine.ProcessNpcs;
var
  dwRunTick,dwCurrTick:LongWord;
  i:integer;
  NPC:TNormNpc;
  boProcessLimit:Boolean;
begin
  dwRunTick:=GetTickCount();
  boProcessLimit:=False;
  try
    dwCurrTick:=GetTickCount();
    for i:=nNpcPosition to QuestNPCList.Count -1 do begin
      NPC:=QuestNPCList.Items[i];
      if not NPC.m_boGhost then begin
        if Integer(dwCurrTick - NPC.m_dwRunTick) > NPC.m_nRunTime then begin
          if (GetTickCount - NPC.m_dwSearchTick) > NPC.m_dwSearchTime then begin
            NPC.m_dwSearchTick:=GetTickCount();
            NPC.SearchViewRange();
          end;
          if Integer(dwCurrTick - NPC.m_dwRunTick) > NPC.m_nRunTime then begin
            NPC.m_dwRunTick:=dwCurrTick;
            NPC.Run;  {FFFFB}
          end;
        end;
      end else begin
        if (GetTickCount - NPC.m_dwGhostTick) > 60 * 1000 then begin
          NPC.Free;
          QuestNPCList.Delete(i);
          break;
        end;
      end;
      if (GetTickCount - dwRunTick) > g_dwNpcLimit then begin
        nNpcPosition:=i;
        boProcessLimit:=True;
        Break;
      end;
    end;
    if not boProcessLimit then begin
      nNpcPosition:=0;
    end;
  except
    MainOutMessage('[Exceptioin] TUserEngine.ProcessNpcs');
  end;
  dwProcessNpcTimeMin:=GetTickCount - dwRunTick;
  if dwProcessNpcTimeMin > dwProcessNpcTimeMax then dwProcessNpcTimeMax:=dwProcessNpcTimeMin;
end;
//004ADE3C
function TUserEngine.RegenMonsterByName(sMap: String; nX, nY: Integer;
  sMonName: String):TBaseObject;
var
  nRace:Integer;
  BaseObject:TBaseObject;
  n18:Integer;
  MonGen:pTMonGenInfo;
begin
  nRace:=GetMonRace(sMonName);
  BaseObject:=AddBaseObject(sMap,nX,nY,nRace,sMonName);
  if BaseObject <> nil then begin
    n18:=m_MonGenList.Count - 1;
    if n18 < 0 then n18:=0;
    MonGen:=m_MonGenList.Items[n18];
    MonGen.CertList.Add(BaseObject);
    BaseObject.AddMapCount;   //�����ڽý���
  end;
  Result:=BaseObject;
end;
function TUserEngine.RegenMonsterByName(pEnvir:TEnvirnoment; nX, nY: Integer;
  sMonName: String):TBaseObject;
var
  nRace:Integer;
  BaseObject:TBaseObject;
  n18:Integer;
  MonGen:pTMonGenInfo;
begin
  nRace:=GetMonRace(sMonName);
  BaseObject:=AddBaseObjectEx(pEnvir,nX,nY,nRace,sMonName);
  if BaseObject <> nil then begin
    n18:=m_MonGenList.Count - 1;
    if n18 < 0 then n18:=0;
    MonGen:=m_MonGenList.Items[n18];
    MonGen.CertList.Add(BaseObject);
    BaseObject.AddMapCount;       //�����ڽý���
  end;
  Result:=BaseObject;
end;

procedure TUserEngine.Run; //004B20B8
//var
//  i:integer;
//  dwProcessTick:LongWord;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::Run';
begin
    CalceTime:=GetTickCount;
    try
      if (GetTickCount() - dwShowOnlineTick) > g_Config.dwConsoleShowUserCountTime then begin
        dwShowOnlineTick:=GetTickCount();
        NoticeManager.LoadingNotice;

        MainOutMessage('��������: ' + IntToStr(GetUserCount) + ' / '+ '����Ӣ����: ' +IntToStr(GetHeroCount));

        g_CastleManager.Save;
      end;
      if (GetTickCount() - dwSendOnlineHumTime) > 10000 then begin
        dwSendOnlineHumTime:=GetTickCount();
        FrmIDSoc.SendOnlineHumCountMsg(GetOnlineHumCount);
      end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg);
      MainOutMessage(E.Message);
    end;
  end;
end;

{function TUserEngine.GetStdItem2(nIdx: Integer): TStdItem;
var
  nItemIdx: Integer;
begin
  Result := nil;
  nItemIdx := nIdx;
  Dec(nItemIdx);
  if (nItemIdx >= 0) and (StdItemList.Count > nItemIdx) then begin
    Result := StdItemList.Items[nItemIdx];
    if Result.Name = '' then Result := nil;
  end;
end;    }

function TUserEngine.GetStdItem(nItemIdx: Integer): TItem; //004AC2F8
begin
  Result:=nil;
    Dec(nItemIdx);
    if (nItemIdx >= 0) and (StdItemList.Count > nItemIdx) then begin
      Result:=StdItemList.Items[nItemIdx];
      if Result.Name = '' then Result:=nil;
    end;
end;
function TUserEngine.GetStdItem(sItemName:String): TItem; //004AC348
var
  I: Integer;
  StdItem:TItem;
begin
  Result:=nil;
  if sItemName = '' then exit;
    for I := 0 to StdItemList.Count - 1 do begin
      StdItem:=StdItemList.Items[i];
      if CompareText(StdItem.Name,sItemName) = 0 then begin
        Result:=StdItem;
        break;
      end;
    end;
end;

function TUserEngine.GetStdItemWeight(nItemIdx: Integer): Integer; //004AC2B0
var
  StdItem:TItem;
begin
    Dec(nItemIdx);
    if (nItemIdx >= 0) and (StdItemList.Count > nItemIdx) then begin
      StdItem:=StdItemList.Items[nItemIdx];
      Result:=StdItem.Weight;
    end else begin
      Result:=0;
    end;
end;

function TUserEngine.GetStdItemName(nItemIdx: Integer): String;//004AC1AC
begin
  Result:='';
  Dec(nItemIdx);
    if (nItemIdx >= 0) and (StdItemList.Count > nItemIdx) then begin
      if TItem(StdItemList.Items[nItemIdx]).StdMode in [46] then
        Result := FilterShowName(TItem(StdItemList.Items[nItemIdx]).Name)
      else
      if TItem(StdItemList.Items[nItemIdx]).Reserved in [16,32] then
        Result := FilterShowName(TItem(StdItemList.Items[nItemIdx]).Name)
      else
      Result:=TItem(StdItemList.Items[nItemIdx]).Name;
    end else Result:='';
end;

function TUserEngine.GetStdItemNameV(nItemIdx: Integer): string;
begin
  Result := '';
  Dec(nItemIdx);
  if (nItemIdx >= 0) and (StdItemList.Count > nItemIdx) then begin
    if TItem(StdItemList.Items[nItemIdx]).Reserved in [16,32] then
      Result := FilterShowName(TItem(StdItemList.Items[nItemIdx]).Name)
    else
    Result := TItem(StdItemList.Items[nItemIdx]).Name;
  end else Result := '';
end;

function TUserEngine.FindOtherServerUser(sName: String;
  var nServerIndex): Boolean;
begin
  Result:=False;
end;

//004AEA00
procedure TUserEngine.StoreCry(wIdent: Word; pMap: TEnvirnoment; nX, nY,    //���λ��� ��ġ��
  nWide: Integer;btFColor,btBColor:Byte; sMsg: String);
var
  i:integer;
  PlayObject:TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
    if not PlayObject.m_boGhost and
      (PlayObject.m_PEnvir = pMap) and
      (PlayObject.m_boBanStoreShout) and
      (abs(PlayObject.m_nCurrX - nX) < nWide) and
      (abs(PlayObject.m_nCurrY - nY) < nWide) then begin

      //PlayObject.SendMsg(nil,wIdent,0,0,$FFFF,0,sMsg);
      PlayObject.SendMsg(nil,wIdent,0,btFColor,btBColor,0,sMsg);
    end;
  end;
end;


procedure TUserEngine.CryCry(wIdent: Word; pMap: TEnvirnoment; nX, nY,
  nWide: Integer;btFColor,btBColor:Byte; sMsg: String);
var
  i:integer;
  PlayObject:TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
    if not PlayObject.m_boGhost and
      (PlayObject.m_PEnvir = pMap) and
      (PlayObject.m_boBanShout) and
      (abs(PlayObject.m_nCurrX - nX) < nWide) and
      (abs(PlayObject.m_nCurrY - nY) < nWide) then begin

      //PlayObject.SendMsg(nil,wIdent,0,0,$FFFF,0,sMsg);
      PlayObject.SendMsg(nil,wIdent,0,btFColor,btBColor,0,sMsg);
    end;
  end;
end;

procedure TUserEngine.GuildAgitCry (msgtype: integer; env: TEnvirnoment; x, y, wide: integer; saying: string);     //��� ��ġ��
var
   i: integer;
   hum: TPlayObject;
begin
   for i:=0 to m_PlayObjectList.Count-1 do begin
      hum := TPlayObject(m_PlayObjectList.Objects[i]);
      if (not hum.m_boGhost) and (hum.m_boBanShout) then begin
         // ���ְ� ��� ���� ������, ���� ��ȣ�� ��� ���� �ִ� ��� ������� ����.
         if (env.sMapName = g_Config.sGTHomeMap) or
               (env.sMapName = g_Config.sGTCallMap) or
               (env.sMapName = g_Config.sGTCallMap2) or
               (env.sMapName = g_Config.sGTCallMap3) then begin
            if hum.m_PEnvir.Flag.nGuildTerritory = env.Flag.nGuildTerritory then begin
              hum.SysMsg (saying, c_Green2, t_TN);
            end;
         end;
      end;
   end;
end;

function  TUserEngine.MonGetRandomItems (mon: TBaseObject):Integer;//004AD2E8
var
   i: integer;
   ItemList:TList;
   iname: string;
   MonItem:pTMonItem;
   UserItem:pTUserItem;
   StdItem:TItem;
   Monster:pTMonInfo;
   RealMaxPoint: integer;
   PlayObject :TPlayObject;
   vCompoundInfos: pTCompoundInfos;
begin
   RealMaxPoint := 0;
   ItemList:= nil;
     for i:=0 to MonsterList.Count-1 do begin
       Monster:=MonsterList.Items[i];
       if CompareText(Monster.sName, mon.m_sCharName) = 0 then begin
         ItemList:=Monster.Itemlist;
         break;
       end;
     end;
   if ItemList <> nil then begin
      for i:=0 to ItemList.Count-1 do begin
         MonItem:=pTMonItem(ItemList[i]);

         //  RealMaxPoint := Random(_MAX(1,  MonItem.MaxPoint div 5 ))  //����� 5�� �̺�Ʈ(�׼�)

           RealMaxPoint := Random(MonItem.MaxPoint);

         if MonItem.SelPoint >= RealMaxPoint then begin  //������ ����� �����
           if CompareText(MonItem.ItemName, sSTRING_GOLDNAME) = 0 then begin
             mon.IncGold( (MonItem.Count div 2) + Random(MonItem.Count) );
            end else begin
               iname := '';
               if iname = '' then
                  iname := MonItem.ItemName;

               New(UserItem);
               if CopyToUserItemFromName (iname, UserItem) then begin
                  UserItem.Dura := Round ((UserItem.DuraMax / 100) * (20+Random(80)));

                  StdItem:=GetStdItem(UserItem.wIndex);
                  
                  if Random(g_Config.nMonRandomAddValue{10}) = 0 then
                     StdItem.RandomUpgradeItem(UserItem);
                  if StdItem.StdMode in [15,22,23,24,26] then begin    //������  �ɼ�  ��������
                    if (StdItem.Shape = 130) or (StdItem.Shape = 131) or (StdItem.Shape = 132) then begin
                      StdItem.RandomUpgradeUnknownItem(UserItem);
                    end;
                  end;
                  mon.m_ItemList.Add(UserItem)
               end else
                  Dispose(UserItem);
            end;
         end;
      end;
   end;
   Result:= 1;
end;

function TUserEngine._AllowUpgradeItem(Item: pTUserItem): Boolean;    //��ȯ
var
  StdItem: TItem;
  PlayObject: TPlayObject;
begin
  Result := False;
  
  StdItem := UserEngine.GetStdItem(Item.wIndex);
  if StdItem = nil then Exit;

  if not (Item.btValue[19] in [0,2]) then Exit;
  case StdItem.StdMode of
    5,6,90,99,10,11,12,101,102: Result := True;
  end;
end;

function TUserEngine.AccAllowUpgradeItem(Item: pTUserItem): Boolean;     //��ű���ȯ
var
  StdItem: TItem;
  PlayObject: TPlayObject;
begin
  Result := False;

  StdItem := UserEngine.GetStdItem(Item.wIndex);
  if StdItem = nil then Exit;

  case StdItem.StdMode of
    5,6,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64: Result := True;
  end;
end;

//004AC404
function TUserEngine.CopyToUserItemFromName(sItemName:String;Item:pTUserItem ;count:integer):Boolean;  //����
var
  I: Integer;
  StdItem:TItem;
begin
  Result:=False;
    if sItemName <> '' then begin
      for I := 0 to StdItemList.Count - 1 do begin
        StdItem:=StdItemList.Items[i];
       // if (CompareText(GetStdItemName(Item.wIndex),sItemName) = 0) then begin
        if CompareText(StdItem.Name,sItemName) = 0 then begin
          FillChar(Item^,SizeOf(TUserItem),#0);
          Item.wIndex:=i + 1;
          Item.MakeIndex:=GetItemNumber();
          Item.Dura:=StdItem.DuraMax;
          Item.DuraMax:=StdItem.DuraMax;
          if StdItem.StdMode in [0,1,3,45,46] then begin
            if count <= 1 then Item.Amount := 1
              else Item.Amount := count;
          end else begin
            Item.Amount := 1;
          end;
          Result:=True;
          break;
        end;
      end;
    end;
end;

function TUserEngine.CopyToUserItemFromName2(sItemName: String;Item,sitem:pTUserItem;amont:integer):Boolean; //���� �ŷ�â
var
  I: Integer;
  StdItem:TItem;
begin
  Result:=False;
    if sItemName <> '' then begin
      for I := 0 to StdItemList.Count - 1 do begin
        StdItem:=StdItemList.Items[i];
        if CompareText(StdItem.Name,sItemName) = 0 then begin
          FillChar(Item^,SizeOf(TUserItem),#0);
          Item.wIndex:=i + 1;
          Item.MakeIndex:=sitem.MakeIndex;
          Item.Dura:=sitem.DuraMax;
          Item.DuraMax:=sitem.DuraMax;
          Item.Amount:=amont;
          Result:=True;
          break;
        end;
      end;
    end;
end;

procedure TUserEngine.ProcessUserMessage(PlayObject:TPlayObject;DefMsg:pTDefaultMessage;Buff:PChar); //004B232C
var
  sMsg:String;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::ProcessUserMessage..';
begin
  if (DefMsg = nil) then exit;
  try
    if Buff = nil then sMsg:=''
    else sMsg:=StrPas(Buff);

    case DefMsg.Ident of
      CM_BOW,
      CM_SPELL: begin //3017
        if g_Config.boSpellSendUpdateMsg then begin
          PlayObject.SendUpdateMsg(PlayObject,
                            DefMsg.Ident,
                            DefMsg.Tag,
                            LoWord(DefMsg.Recog),
                            HiWord(DefMsg.Recog),
                            MakeLong(DefMsg.Param,
                            DefMsg.Series),
                            '');
        end else begin
          PlayObject.SendMsg(PlayObject,
                            DefMsg.Ident,
                            DefMsg.Tag,
                            LoWord(DefMsg.Recog),
                            HiWord(DefMsg.Recog),
                            MakeLong(DefMsg.Param,
                            DefMsg.Series),
                            '');
        end;
      end;

      CM_QUERYUSERNAME: begin//80
        PlayObject.SendMsg(PlayObject,DefMsg.Ident,0,DefMsg.Recog,DefMsg.Param{x},DefMsg.Tag{y},'');
      end;


      CM_MAIL_LIST,
      CM_MAIL_ADD,
      CM_MAIL_SETINFO,
      CM_MAIL_DELETE,
      CM_REJECT_LIST,
      CM_REJECT_ADD,
      CM_REJECT_DELETE: begin
        PlayObject.SendMsg(PlayObject, DefMsg.Ident, DefMsg.Series, DefMsg.Recog, DefMsg.Param, DefMsg.Tag, DecodeString(sMsg));
      end;


      CM_DROPITEM,
      CM_TAKEONITEM,
      CM_TAKEOFFITEM,
      CM_1005,

      CM_PRICEDISASSEMBLE,
      CM_DISASSEMBLE,

      CM_ITEMWAKEUP,
      
      CM_PRICEDISMANTLEBLE,
      CM_DISMANTLE,
      
      CM_MERCHANTDLGSELECT,
      CM_MERCHANTQUERYSELLPRICE,
      CM_USERSELLITEM,
      CM_USERITEMLOCK,
      CM_USERITEMRESTORE,
      CM_USERITEMWAKE,
      CM_USERBUYITEM,
      CM_USERPBUYITEM,
      CM_CREATEGROUP,
      CM_ADDGROUPMEMBER,
      CM_DELGROUPMEMBER,
      CM_USERREPAIRITEM,
      CM_USERCHWEAPONITEM, //���� Ȯ��
      CM_MERCHANTQUERYREPAIRCOST,
      CM_MERCHANTQUERYWAKECOST,
      CM_MERCHANTQUERYRESTORECOST,
      CM_LM_DELETE,               //���� ����
      CM_LM_DELETE_REQ_OK,
      CM_LM_DELETE_REQ_FAIL,
      CM_ME_DELETE,      //���� ����
      CM_DEALTRY,
      CM_DEALADDITEM,
      CM_DEALDELITEM,
      CM_DEALDELITEM2,
      CM_UPGRADEITEM,     //����

      CM_USERMAKEITEMSEL,  //��������
      CM_USERMAKEITEM,     //��������

      CM_RENTALTRY,
      CM_RENTALADDITEM,
      CM_RENTALDELITEM,

      CM_BUYSTOREITEM,     //���λ���
      CM_USERSTORAGEITEM,          //â��
      CM_USERTAKEBACKSTORAGEITEM,     //â��
      CM_AUTOADDITEM,
      CM_AUTODELITEM,
      
      CM_STORAGEPASSWORD,     //â����ȣ
      CM_CHECKSTORAGEPW,      //â����ȣ

      CM_UPONFISH,//����
      CM_UPONFISH2,//����

      CM_MASTERBAGTOHEROBAG, //���� > ���� ��������
      CM_HEROBAGTOMASTERBAG, //���� > ���� ��������

      CM_HEROSTORAGEITEM,  //���� > ����â����
      CM_HEROTAKEBACKSTORAGEITEM, //����â�� > ���� ����
      CM_BUNDLEITEM, //���� ��ġ��
      CM_BUNDLESTORAGEITEM,
      CM_GOTOITEMID,     //���
      CM_GUILDADDMEMBER,
      CM_GUILDDELMEMBER,
      CM_GUILDUPDATENOTICE,
      CM_GUILDUPDATERANKINFO: begin
        PlayObject.SendMsg(PlayObject,
                          DefMsg.Ident,
                          DefMsg.Series,
                          DefMsg.Recog,
                          DefMsg.Param,
                          DefMsg.Tag,
                          DecodeString(sMsg));
      end;
      CM_PASSWORD,
      CM_CHGPASSWORD,
      CM_SETPASSWORD: begin
        PlayObject.SendMsg(PlayObject,
                          DefMsg.Ident,
                          DefMsg.Param,
                          DefMsg.Recog,
                          DefMsg.Series,
                          DefMsg.Tag,
                          DecodeString(sMsg));
      end;
      CM_ADJUST_BONUS: begin //1043
        PlayObject.SendMsg(PlayObject,
                          DefMsg.Ident,
                          DefMsg.Series,
                          DefMsg.Recog,
                          DefMsg.Param,
                          DefMsg.Tag,
                          sMsg);
      end;

      CM_HORSERUN,
      CM_SPEEDRUN, //��ź�
      CM_DOWNRUN,   //������ �޸���
      CM_TURN,
      CM_WALK,                                                  //���Ļ��
      CM_DOWN,    //������
      CM_SITDOWN,
      CM_RUN,
      CM_HIT,
      CM_HEAVYHIT,
      CM_BIGHIT,
      CM_HITLEFT, //�޼�
      CM_POWERHIT,
      CM_LONGHIT,
      CM_TAGUHIT,
      CM_CRSHIT,      //��ǳ��
      CM_NANCRSHIT,   //��ȭ��ǳ��
      CM_TWINHIT,
      CM_THUNDERHIT,
      CM_FIRESHAOLIN,
      CM_CRBHIT,
      CM_BALDO,   //�ߵ���
      CM_BALDO2,   //�ߵ���
      CM_WIDEHIT,
      CM_WBHIT,  //ǳ�˼�
      CM_WBHIT2,  //ǳ�˼�
      CM_FIREHIT,
      CM_DEATHHIT, //�����
      CM_CPOWERHIT,
      CM_CFIREHIT,
      CM_FISHING1,    //���� ����
      CM_FISHING2: begin  //���� ��
        if g_Config.boActionSendActionMsg then begin //ʹ��UpdateMsg ���Է�ֹ��Ϣ�������ж������
          PlayObject.SendActionMsg(PlayObject,
                          DefMsg.Ident,
                          DefMsg.Tag,
                          LoWord(DefMsg.Recog),{x}
                          HiWord(DefMsg.Recog),{y}
                          0,
                          '');
        end else begin
          PlayObject.SendMsg(PlayObject,
                          DefMsg.Ident,                                  //���Ļ��
                          DefMsg.Tag,
                          LoWord(DefMsg.Recog),{x}
                          HiWord(DefMsg.Recog),{y}
                          0,
                          '');
        end;
      end;

    
      CM_SAY: begin
        PlayObject.SendMsg(PlayObject,CM_SAY,0,0,0,0,DecodeString(sMsg));
      end;

      CM_HEROTAKEONITEM,
      CM_HEROTAKEOFFITEM,
      CM_HEROAUTOEAT,
      CM_HEROEAT,
      CM_HEROBUNDLEITEM,
      CM_HEROBUNDLESTORAGEITEM,
      CM_HEROSEPARITEM,
      CM_HEROUPGRADEIT,
      CM_GEMHEROITEM,
      CM_HEROMAGICKEYCHANGE,
      CM_QUERYHEROBAGITEMS: begin
          if PlayObject.m_MyHero <> nil then
            PlayObject.m_MyHero.SendMsg(PlayObject.m_MyHero, DefMsg.Ident, DefMsg.Series,
               DefMsg.Recog, DefMsg.Param, DefMsg.Tag, DeCodeString(sMsg));
        end;

      CM_HEROLOGON_OK: begin
          if PlayObject.m_MyHero <> nil then
            PlayObject.m_MyHero.SendMsg(PlayObject.m_MyHero,
              DefMsg.Ident,
              DefMsg.Series,
              DefMsg.Recog,
              DefMsg.Param,
              DefMsg.Tag,
              '');
        end;

      else begin
        PlayObject.SendMsg(PlayObject,
                          DefMsg.Ident,
                          DefMsg.Series,
                          DefMsg.Recog,
                          DefMsg.Param,
                          DefMsg.Tag,
                          sMsg);
      end;
    end;
    if PlayObject.m_boReadyRun then begin
      case DefMsg.Ident of
        CM_TURN,CM_WALK,CM_DOWN,CM_SITDOWN,CM_RUN,CM_HIT,CM_HEAVYHIT,CM_BIGHIT,CM_HITLEFT, CM_FIRESHAOLIN,
        CM_POWERHIT,CM_LONGHIT, CM_CPOWERHIT, CM_CFIREHIT, CM_TAGUHIT, CM_THUNDERHIT, CM_CRBHIT, CM_NANCRSHIT,
        CM_WIDEHIT,CM_FIREHIT,CM_CRSHIT,CM_TWINHIT,CM_WBHIT,CM_WBHIT2,CM_BALDO,CM_BALDO2,CM_FISHING1, //���� ����
        CM_FISHING2,CM_DEATHHIT: begin //���� ��
          Dec(PlayObject.m_dwRunTick,100);
        end;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;
//004AF728
procedure TUserEngine.SendServerGroupMsg(nCode, nServerIdx: Integer;
  sMsg: String);
begin
  if nServerIndex = 0 then begin
    FrmSrvMsg.SendSocketMsg(IntToStr(nCode) + '/' + EncodeString(IntToStr(nServerIdx)) + '/' + EncodeString(sMsg));
  end else begin
    FrmMsgClient.SendSocket(IntToStr(nCode) + '/' + EncodeString(IntToStr(nServerIdx)) + '/' + EncodeString(sMsg));
  end;    
end;
function TUserEngine.AddBaseObject(sMapName:String;nX,nY:Integer;nMonRace:Integer;sMonName:String):TBaseObject;//004AD56C
var
Map:TEnvirnoment;
begin
  Map:=g_MapManager.FindMap(sMapName);
  result:=AddBaseObjectEx(map,nx,ny,nMonRace,sMonName);
end;
function TUserEngine.AddBaseObjectEx(Map:TEnvirnoment;nX,nY:Integer;nMonRace:Integer;sMonName:String):TBaseObject;//004AD56C
var
  Cert:TBaseObject;
  n1C,n20,n24:Integer;
  p28:Pointer;
begin
  Result:=nil;
  Cert:=nil;


  if Map = nil then exit;
  if not Map.m_boMonGen then exit;         //�����ڽý���
  case nMonRace of              //���̽�

    SUPREGUARD: Cert:=TSuperGuard.Create;             //���(11)
    PETSUPREGUARD: Cert:=TPetSuperGuard.Create;       //���(12)
    13: Cert := TMoveSuperGuard.Create;               //���(13)
    ARCHER_POLICE: Cert:=TArcherPolice.Create;        //�ü����(20)

    ANIMAL_CHICKEN: begin                             //��(51)
      Cert:=TMonster.Create;
      Cert.m_boAnimal:=True;
      Cert.m_nMeatQuality:=Random(3500) + 3000;
      Cert.m_nBodyLeathery:=50;
    end;
    ANIMAL_DEER: begin                                //�罿(52)
      if Random(30) = 0 then begin
        Cert:=TChickenDeer.Create;
        Cert.m_boAnimal:=True;
        Cert.m_nMeatQuality:=Random(20000) + 10000;
        Cert.m_nBodyLeathery:=150;
      end else begin
        Cert:=TMonster.Create;
        Cert.m_boAnimal:=True;
        Cert.m_nMeatQuality:=Random(8000) + 8000;
        Cert.m_nBodyLeathery:=150;
      end;
    end;
    ANIMAL_WOLF: begin                                //����(53)
      Cert:=TATMonster.Create;
      Cert.m_boAnimal:=True;
      Cert.m_nMeatQuality:=Random(8000) + 8000;
      Cert.m_nBodyLeathery:=150;
    end;
    RC_RUNAWAY: Cert:=TChickenDeer.Create;            //�޾Ƴ��³�(54)
    TRAINER: begin                                    //���ñ���(55)
      Cert:=TTrainer.Create;
    end;
    56: Cert:= TSaveGuardMonster.Create;   //��ȣ�ͻ�
    57: Cert:= TIceGuard.Create;   //��������
    58: Cert:= TGoldGuard.Create;  //ȯ�����
    59: Cert:= TAglyGuard.Create;  //��ȣ�͸�
    60: Cert:= TAgainst.Create;    //��õ��
    61: Cert:= TDarkShine.Create;  //��õ��
    62: Cert:= TLeafhopper.Create; //���
    63: Cert:= THanShine.Create;   //��õ��
    64: Cert:= TCrazyShine.Create;   //���ѽ�
    65: Cert:= TAutumn.Create;      //���
    66: Cert:= TRhinoceros.Create;    //����
    67: Cert:= TNightattack.Create;    //�߰���ȣ��
    68: Cert:= TConvene.Create;   //��ȭ����
    69: Cert:= TFireConvene.Create;   //��������
    70: Cert:= TBanyaGuardMonster.Create;  //�ݾ��»� ���
    71: Cert:= TDeadCowKingMonster.Create;      //���õ��
    72: Cert:= TNammanKingMonster.Create;      //�ܹ�
    73: Cert:= TOldKingMonster.Create;      //�����ȣ��
    74: Cert:= TFaceMob.Create;   //�θ��
    75: Cert:= TExplosionDark.Create;   //ĥ���
    76: Cert:= TGoblinKing.Create;   //����
    77: Cert:= TCatKing.Create;   //���屺
    78: Cert:= TBigPotKing.Create;   //ȣ��õ
    79: Cert:= TGeneralCat.Create;   //�����屺
    MONSTER_OMA: Cert:=TMonster.Create;               //�⺻(80)
    MONSTER_OMAKNIGHT: Cert:=TATMonster.Create;       //�⺻(81)
    MONSTER_SPITSPIDER: Cert:=TSpitSpider.Create;
    83: Cert:=TSlowATMonster.Create;
    84: Cert:=TScorpion.Create;
    MONSTER_STICK: Cert:=TStickMonster.Create;
    86: Cert:=TATMonster.Create;
    MONSTER_DUALAXE: Cert:=TDualAxeMonster.Create;
    88: Cert:=TATMonster.Create;
    89: Cert:=TATMonster.Create;
    90: Cert:=TGasAttackMonster.Create;
    91: Cert:=TMagCowMonster.Create;
    92: Cert:=TCowKingMonster.Create;  //���Ϳ�
    MONSTER_THONEDARK: Cert:=TThornDarkMonster.Create;
    MONSTER_LIGHTZOMBI: Cert:=TLightingZombi.Create;
    MONSTER_DIGOUTZOMBI: begin
      Cert:=TDigOutZombi.Create;
      if Random(2) = 0 then Cert.bo2BA:=True;
    end;
    MONSTER_ZILKINZOMBI: begin
      Cert:=TZilKinZombi.Create;
      if Random(4) = 0 then Cert.bo2BA:=True;
    end;
    97: begin
      Cert:=TCowMonster.Create;
      if Random(2) = 0 then Cert.bo2BA:=True;
    end;
    98: Cert:= TBigSnakeWarm.Create; //���;
    99: Cert:= TJumaWizard.Create;   //�ָ�����
    MONSTER_WHITESKELETON: Cert:=TWhiteSkeleton.Create;  //��� (100)
    MONSTER_SCULTURE: begin
      Cert:=TScultureMonster.Create;
      Cert.bo2BA:=True;
    end;
    MONSTER_SCULTUREKING: Cert:=TScultureKingMonster.Create; //�ָ��� (102)
    MONSTER_BEEQUEEN: Cert:=TBeeQueen.Create;
    104: Cert:=TArcherMonster.Create;
    105: Cert:=TGasMothMonster.Create;//���⳪��
    106: Cert:=TGasDungMonster.Create;
    107: Cert:=TCentipedeKingMonster.Create;     //�˷��
    108: Cert:=TWildKing.Create;   //�߼���
    109: Cert:=TLegendScultureKingMonster.Create;    //�����ָ���
    110: Cert:=TCastleDoor.Create;        //����
    111: Cert:=TWallStructure.Create;     //����
    MONSTER_ARCHERGUARD: Cert:=TArcherGuard.Create;        //�ü����
    MONSTER_ELFMONSTER: Cert:=TElfMonster.Create;    //�ż�
    MONSTER_ELFWARRIOR: Cert:=TElfWarriorMonster.Create;     //�ż�
    115: Cert:=TBigHeartMonster.Create;
    116: Cert:=TSpiderHouseMonster.Create;
    117: Cert:=TExplosionSpider.Create;
    118: Cert:=THighRiskSpider.Create;
    119: Cert:=TBigPoisionSpider.Create;    //û�Ž�
    120: Cert:=TSoccerBall.Create;
    121: Cert:=TRobberMon.Create;  //�ŵ�����
    122: Cert:=TSideArms.Create;   //�а�����
    123: Cert:=TDaggerMon.Create;   //��������
    124: Cert:=TDarkGuard.Create;   //�ߺ���ȣ�� ������ȣ�� ��ȥ��ȣ�� ������ȣ��
    125: Cert:=TFireCat.Create; //�ұ���
    126: Cert:=THammerCat.Create; //����ġ����
    127: Cert:=TBlackHammerCat.Create; //������ġ����
    128: Cert:=TArmorCat.Create; //������
    129: Cert:=TShamanCat.Create; //���籪��
    130: Cert:=TDoubleCriticalMonster.Create;   //��õ����
    131: Cert:=TRonObject.Create;
    132: Cert:=TSandMobObject.Create;
    133: Cert:=TMagicMonObject.Create;
    134: Cert:=TSkeletonKingMonster.Create;   //�ذ�ݿ�
    135: Cert:=TBamTreeMonster.Create;      //����
    MONSTER_DARKANGEL: Cert:=TDarkAngelMon.Create;      //ȥ��
    137: Cert:=TPBKingMonster.Create;  //��Ȳ���� ��
    138: Cert:=TDragon.Create;       //��õ����
    139: Cert:=TDragonStatue.Create;   //�뼮��
    140: Cert:=TDragonBody.Create;     //��õ���� ��
    MONSTER_ANGEL: Cert:=TAngelMon.Create;      //����
    RC_CLONE: Cert := TCloneMon.create;    //142
    143: Cert:=TJumaThunder.Create;      //�ָ��ݷ���(143)
    144: Cert:=TCrystalSpider.Create;
    145: begin
     Cert:=TPushedMon.Create; //ȣ�⿬
     TPushedMon(Cert).AttackWide := 1;
    end;
    146: Cert:=TGoldenImugi.Create;         //�η�ݻ�
    147: Cert:=TNoseMonkey.Create;          //���ڿ�����
    148: Cert:=TFoxWarrior.Create;          //�����ȣ
    149: begin
     Cert:=TPushedMon.Create; //ȣ���
     TPushedMon(Cert).AttackWide := 2;
    end;
    150: Cert := TStickBlockMonster.Create;  //ȣȥ��
    151: Cert:=TFoxWizard.Create;  //�����ȣ
    152: Cert:=TFoxTaoist.Create;  //�����ȣ
    MONSTER_STONE: Cert := TStoneMonster.Create;      //�縶���� ��������
    RC_DARKCLONE: Cert := TDarkClone.create;    //154
    155: Cert:=TFoxBead.Create;         //���õ��
    156: Cert:=TFoxPillar.Create;   //ȣȥ�⼮
    157: Cert:=TGhostAdmiral.Create;   //������
    158: Cert:=TGhostAdmiral.Create;   //������
    159: Cert:=TGhostAdmiral.Create;   //������
    160: Cert:=THellGuard.Create;      //����������
    161: Cert:=TMillstoneKing.Create;    //������
    162: Cert:=TSpiderHouseMonster2.Create;
    163: Cert:=TExplosionSpider2.Create;
    164: Cert:=TCrystalSpider2.Create;
    165: Cert:=TGumimasin.Create;
    166: Cert:=TGuJangHwa.Create;                 //����ȭ
    MONSTER_SCULTURE2: Cert:=TScultureMonster2.Create; //167
    168: Cert:=TGumiBoss.Create;
    169: Cert:=TImpressionKingMon.Create;   //���λ�
    170: Cert:=TPotMon.Create;   //ȣ�߱�2
    171: Cert:=THellMonster.Create;   //������ ������
    172: Cert:=THellMonster2.Create;  //���α�
    173: Cert:=THellMonster3.Create;  //�θ��
    174: Cert:=THellMonster4.Create;  //�Ľű�
    175: Cert:=TPotMon1.Create;   //ȣ�߱�1
    176: Cert:=TIceHellMonster.Create;  //�ݺ�����
    177: Cert:=TIceHellMonster2.Create;  //������ȣ��
    178: Cert:=TIceHellKing.Create;  //�Ѻ���ȣ��
    179: Cert:=TWaterSlave.Create;   //�ͻ��ѳ뿹
    180: Cert:=TSpitSpider.Create; //���ǶǾƸ�
    //2005/12/14
    181: begin
       Cert := TATMonster.Create;
       Cert.MultiplyTargetLevelMin := 70;
       Cert.MultiplyTargetLevelMax := 120;
    end;
    182:begin
       Cert := TPhisicalFarAttackMonster.Create;
       Cert.MultiplyTargetLevelMin := 60;
       Cert.MultiplyTargetLevelMax := 130;
    end;
    183: Cert:=TBossTurtle.Create;     //��������
    184: Cert:=TMermaidMon.Create;   //�����
    185: Cert:=TMermaidMon2.Create;  //����
    186: Cert:=TGreatKing.Create;  //��������
    187: Cert:=TMermaidMon3.Create;  //�ο�
    188: Cert:=TMerMaidKingMon.Create;      //�����
    189: Cert:=TEarthToad.Create; //���β���
    190: Cert:=THumMon.Create;   //�ΰ���
    191: Cert:=TBirdMan.Create;  //������
    192: Cert:=TBigRhino.Create;    //ū�Լ�����
    193: Cert:=TStonegolem.Create;    //������
    194: Cert:=TEarthGolem.Create;    //�����
    195: Cert:=TGanesha.Create; //���׼�
    196: Cert:=TBossTreeman.Create; //���ϼ�
    197: Cert:=TPeacockspider.Create; //������
    198: Cert:=TLegendFoxWizard.Create;  //��������ȣ
    199: Cert:=TLegendFoxTaoist.Create;  //��������ȣ
    200: Cert:=TElectronicScolpionMon.Create;  //����
    201: Cert:=THeal.Create;
    202: Cert:=TLegendFoxWarrior.Create;    //��������ȣ
    203: Cert:=TTeleMonster.Create;
    204: Cert:=TElectBossMon.Create;       //���漱��
    205: Cert:=TWindLead.Create;           //��ǳ����
    206: Cert:=TKhazard.Create;            //���δ���

    207: Cert:=TEvilMir.Create;            //��õ���� (��)

    208: Cert:=TGreenMonster.Create;
    209: Cert:=TRedMonster.Create;
    210: Cert:=TFrostTiger.Create;    //ȯ����ȣ
    211: Cert:=TGhostShipMon.Create;       //�����ǾǷ�
    212: Cert:=TFramNoMon.Create;          //��뱺
    213: Cert:=TTransMon.Create;           //���̵Ȱ��ú�

    214: Cert:=TFireMonster.Create;
    215: Cert:=TFireBallMonster.Create;

    216: Cert:=TDarkWolf.Create;                    //�����漺��, �̵���ȣ, ����
    217, 220: Cert:=TTeguOmaMonster.Create;         //�±�����   ��������
    218: Cert:=TGegunOmaMon.Create;                 //�űǿ���
    219: Cert:=TDamukOmaMon.Create;                 //�ٸ����, �����溴
    221: Cert:=TOmaJeSaMonster.Create;              //����������
    222,223,224: Cert:=TDigOutGusle.Create;         //����
    225: Cert:=TOmaDarkKing.Create;                 //�������
    226: Cert:=TGhostFire.Create;                   //ȥ��
    227: Cert:=TJumaFireArc.Create;                 //�ָ�ȭ�û�
    228: Cert:=TJumaWindArc.Create;                 //�ָ�ǳ�û�
    229: Cert:=TJumaWarrior.Create;                 //�ָ��˻�
    230: Cert:=TGukguljang.Create;                   //�ݱ���
    231: Cert:= TExplosion2Dark.Create;            //��ȣ
    232: Cert := TSkeletonSoldier.Create;           //�ذ���
    JIN_WHITESKELETON: Cert := TJinWhiteSkeleton.Create;         //����
    234: Cert:=TDragonPart.Create;

    240: Cert:=TPetObject.Create;               //����

    246: Cert:=TNammanStructure.Create;
    247: Cert:=TSabukStructure.Create;          //����
    248: Cert:=TNammanCastleDoor2.Create;       //����������
    249: Cert:=TNammanCastleDoor.Create;        //�����ܼ���
    250: Cert:=TWallFlag.Create;  //���ɱ��
    RC_BONZECLONE: Cert := TBonzeClone.create;    //251

    //RC_HEROOBJECT(255)
    
    //====������===
    261: Cert:=TTreeTuttle.Create;     //���ź���
    262: Cert:=TTreeJungBack.Create;   //�ﳪ������
    263: Cert:=TBear.Create;           //��, ǥ��
    264: Cert:=TWarriorM.Create;       //����������
    265: Cert:=TWizardM.Create;        //�����ܼ���
    266: Cert:=TTaoistM.Create;        //�����ܵ���
    267: Cert:=TAngelMon2.Create;      //������
    268: Cert:=TAssassinM.Create;      //�������ڰ�
    269: Cert:=TWarriorM2.Create;      //��������
    270: Cert:=TWizardM2.Create;       //������
    271: Cert:=TTaoistM2.Create;       //��������
    272: Cert:=TAssassinM2.Create;     //������
    273: Cert:=TAchorMonster.Create;   //�������
    274: Cert:=TJobking.Create;        //����
    //������ �ʵ�
    275: Cert := TIceSoldier.Create;   //�����ͺ�
    276: Cert := TIceArc.Create;       //�����ͱû�
    277: Cert := IIceZone.Create;      //��������
    278: Cert := IIceDevil.Create;     //�Ǳ�
    279: Cert := TIceKingBoss.Create;  //���¶�
  end;

  if Cert <> nil then begin
    if not (Cert.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) then begin
    MonInitialize(Cert,sMonName);
    Cert.m_PEnvir:=Map;
    Cert.m_sMapName:=Map.sMapName;
    Cert.m_nCurrX:=nX;
    Cert.m_nCurrY:=nY;
    Cert.m_btDirection:=Random(8);
    Cert.m_sCharName:=sMonName;
    Cert.m_WAbil:=Cert.m_Abil;
    if Random(100) < Cert.m_btCoolEye then Cert.m_boCoolEye:=True;    //BoViewFixedHide
   // if not (Cert.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) then
    MonGetRandomItems(Cert);
    Cert.Initialize(); //004ADC97 $0FFFE
    if Cert.m_boAddtoMapSuccess then begin      //���ڸ��� �������̴� �ڸ�
      p28:=nil;
      if Cert.m_PEnvir.m_nWidth < 50 then  n20:=2
      else n20:=3;
      if (Cert.m_PEnvir.m_nHeight < 250) then begin
        if (Cert.m_PEnvir.m_nHeight < 30) then  n24:=2
        else n24:=20;
      end else n24:=50;

      n1C:=0;
      while (True) do begin          //��ħ �� ���
        if not Cert.m_PEnvir.CanWalk(Cert.m_nCurrX,Cert.m_nCurrY,True{False}) then begin  //FALSE) then begin
          if (Cert.m_PEnvir.m_nWidth - n24 -1) > Cert.m_nCurrX then begin
            Inc(Cert.m_nCurrX,n20);
          end else begin //004ADD9D
            Cert.m_nCurrX:=Random(Cert.m_PEnvir.m_nWidth div 2) + n24;
            if Cert.m_PEnvir.m_nHeight - n24 -1 > Cert.m_nCurrY then begin
              Inc(Cert.m_nCurrY,n20);
            end else begin //004ADDBE
              Cert.m_nCurrY:=Random(Cert.m_PEnvir.m_nHeight div 2) + n24;
            end;
          end;
        end else begin //004ADDC0
          p28:=Cert.m_PEnvir.AddToMap(Cert.m_nCurrX,Cert.m_nCurrY,OS_MOVINGOBJECT,Cert);
          break;
        end;
        Inc(n1C);
        if n1C >= 31 then break;
      end;

      if p28 = nil then begin
        FreeAndNil(Cert);
      end;
    end;
    end;
  end;

  Result:=Cert;
end;


function TUserEngine.RegenMonsters(MonGen:pTMonGenInfo;nCount:integer): Boolean;//004ADF04
var
  dwStartTick:LongWord;

  nX:Integer;
  nY:Integer;
  i:Integer;
  Cert:TBaseObject;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::RegenMonsters';
begin
  Result:=True;
  dwStartTick:=GetTickCount();
  try
    if MonGen.nRace > 0 then begin
      if Random(100) < MonGen.nMissionGenRate then begin
        nX:=(MonGen.nX - MonGen.nRange) + Random(MonGen.nRange * 2 + 1);
        nY:=(MonGen.nY - MonGen.nRange) + Random(MonGen.nRange * 2 + 1);
        for i:=0 to nCount -1 do begin
          Cert:=AddBaseObject(MonGen.sMapName,((nX - 10) + Random(20)),((nY - 10) + Random(20)),MonGen.nRace,MonGen.sMonName);
          if Cert <> nil then begin
            MonGen.CertList.Add(Cert);
            Cert.AddMapCount;             //�����ڽý���
          end;
          if (GetTickCount - dwStartTick) > g_dwZenLimit then begin
            Result:=False;
            Break;
          end;
        end;//4AE058
      end else begin//004AE063
        for i:=0 to nCount -1 do begin
          nX:=(MonGen.nX - MonGen.nRange) + Random(MonGen.nRange * 2 + 1);
          nY:=(MonGen.nY - MonGen.nRange) + Random(MonGen.nRange * 2 + 1);
          Cert:=AddBaseObject(MonGen.sMapName,nX,nY,MonGen.nRace,MonGen.sMonName);
          if Cert <> nil then begin
            MonGen.CertList.Add(Cert);
            Cert.AddMapCount;         //�����ڽý���
          end;
          if (GetTickCount - dwStartTick) > g_dwZenLimit then begin
            Result:=False;
            break;
          end;
        end;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;
procedure TUserEngine.WriteShiftUserData();
//004AF510
begin

end;

function TUserEngine.GetHeroObject(sName: string): THeroObject;
var
  I: Integer;
begin
  Result := nil;
  m_HeroObjectList.Lock;
  try
    for I := 0 to m_HeroObjectList.Count - 1 do begin
      if (CompareText(m_HeroObjectList.Strings[I], sName) = 0) then begin
        Result := THeroObject(m_HeroObjectList.Objects[I]);
        Break;
      end;
    end;
  finally
    m_HeroObjectList.UnLock;
  end;
end;
function TUserEngine.GetPlayObject(sName: String): TPlayObject;//004AE640
var
  i:Integer;
  PlayObject:TPlayObject;
begin
  Result:=nil;
  for i:=0 to m_PlayObjectList.Count -1 do begin
    if CompareText(m_PlayObjectList.Strings[i],sName) = 0 then begin
      PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
      if not PlayObject.m_boGhost then begin
       if not (PlayObject.m_boPasswordLocked and PlayObject.m_boObMode and PlayObject.m_boAdminMode) then
        Result:=PlayObject;
      end;
      Break;
    end;
  end;
end;
function TUserEngine.GetPlayObject(PlayObject: TPlayObject): TPlayObject;
var
  I: Integer;
begin
  Result := nil;
  if PlayObject = nil then Exit;
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    if (PlayObject = TPlayObject(m_PlayObjectList.Objects[I])) then begin
      Result := TPlayObject(m_PlayObjectList.Objects[I]);
      Break;
    end;
  end;
end;
procedure TUserEngine.KickPlayObjectEx(sName:String);
var
  i:Integer;
  PlayObject:TPlayObject;
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  for i:=0 to m_PlayObjectList.Count -1 do begin
    if CompareText(m_PlayObjectList.Strings[i],sName) = 0 then begin
      PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
      PlayObject.m_boEmergencyClose:=True;
      Break;
    end;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;  
end;
function TUserEngine.GetPlayObjectEx(sName: String): TPlayObject;//004AE640
var
  I          :Integer;
begin
  Result:=nil;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    for I:=0 to m_PlayObjectList.Count -1 do begin
      if CompareText(m_PlayObjectList.Strings[I],sName) = 0 then begin
        Result:=TPlayObject(m_PlayObjectList.Objects[I]);
        Break;
      end;
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TUserEngine.FindMerchant(Merchant:TObject):TMerchant;//004AC858
var
  I: Integer;
begin
  Result:=nil;
  m_MerchantList.Lock;
  try
    for I := 0 to m_MerchantList.Count - 1 do begin
      if TObject(m_MerchantList.Items[i]) = Merchant then begin
        Result:=TMerchant(m_MerchantList.Items[i]);
        break;
      end;
    end;
  finally
    m_MerchantList.UnLock;
  end;
end;

function TUserEngine.FindNPC(GuildOfficial:TObject):TGuildOfficial;//004ACB24
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to QuestNPCList.Count - 1 do begin
    if TObject(QuestNPCList.Items[i]) = GuildOfficial then begin
      Result:=TGuildOfficial(QuestNPCList.Items[i]);
      break;
    end;
  end;
end;

//4AE810
function TUserEngine.GetMapOfRangeHumanCount(Envir: TEnvirnoment; nX, nY,
  nRange: integer): Integer;
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  Result:=0;
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
    if not PlayObject.m_boGhost and (PlayObject.m_PEnvir = Envir) then begin
      if (abs(PlayObject.m_nCurrX - nX) < nRange) and (abs(PlayObject.m_nCurrY - nY) < nRange) then Inc(Result);
    end;
  end;
end;

function TUserEngine.GetHumPermission(sUserName:String;var sIPaddr:String; var btPermission:Byte):Boolean;//4AE590
var
  I         :Integer;
  AdminInfo :pTAdminInfo;
begin
  Result:=False;
  btPermission:=g_Config.nStartPermission;
  m_AdminList.Lock;
  try
    for I := 0 to m_AdminList.Count - 1 do begin
      AdminInfo:=m_AdminList.Items[I];
      if CompareText(AdminInfo.sChrName,sUserName) = 0 then begin
        btPermission := AdminInfo.nLv;
        sIPaddr      := AdminInfo.sIPaddr;
        Result       := True;
        break;
      end;
    end;
  finally
    m_AdminList.UnLock;
  end;
end;


function TUserEngine.GetHumColumn(sUserName:String;var sIPaddr:String; var btColumn:Byte):Boolean;//ȫ����
var
  I         :Integer;
  ColumnInfo:pTColumnInfo;
begin
  Result:=False;
  btColumn:=0;
  m_ColumnList.Lock;
  try
    for I := 0 to m_ColumnList.Count - 1 do begin
      ColumnInfo:=m_ColumnList.Items[I];
      if CompareText(ColumnInfo.sChrName,sUserName) = 0 then begin
        btColumn     := ColumnInfo.nLv;
        sIPaddr      := ColumnInfo.sIPaddr;
        Result       := True;
        break;
      end;
    end;
  finally
    m_ColumnList.UnLock;
  end;
end;

procedure TUserEngine.GenShiftUserData;
//004AEF6C
begin

end;

procedure TUserEngine.AddUserChat(sSay:String; ChatMode:integer);  //ä�ýý���
var
  sMsg: String;
begin
  sMsg := Trim(sSay);
  if not (ChatMode in [1]) then
  FrmMain.AllMsg.Lines.Add(sSay);
  case ChatMode of
     0:  FrmMain.GeneralMsg.Lines.Add(sSay);   //�Ϲ�
     1:  FrmMain.CommandMsg.Lines.Add(sSay);   //����
     2:  FrmMain.WhisperMsg.Lines.Add(sSay);   //�ӼӸ�
     3:  FrmMain.SellMsg.Lines.Add(sSay);      //����
     4:  FrmMain.GroupMsg.Lines.Add(sSay);     //�׷�
     5,6:  FrmMain.GuildMsg.Lines.Add(sSay);   //����, ����
     7:  FrmMain.CryMsg.Lines.Add(sSay);       //��ġ��
     8:  FrmMain.LoverMsg.Lines.Add(sSay);     //����
     9:  FrmMain.MasterMsg.Lines.Add(sSay);    //����
     10: FrmMain.ForGmMsg.Lines.Add(sSay);     //��ڿ���
     11: FrmMain.VoiceMsg.Lines.Add(sSay);     //����
  end;
end;

//004AE3FC
procedure TUserEngine.AddUserOpenInfo(UserOpenInfo: pTUserOpenInfo);
begin
  EnterCriticalSection(m_LoadPlaySection);
  try
    m_LoadPlayList.AddObject(UserOpenInfo.sChrName,Tobject(UserOpenInfo));
  finally
    LeaveCriticalSection(m_LoadPlaySection);
  end;
end;

procedure TUserEngine.AddHeroOpenInfo(UserOpenInfo: pTUserOpenInfo);
begin
  EnterCriticalSection(m_LoadHeroSection);
  try
    m_LoadHeroList.AddObject(UserOpenInfo.sChrName, TObject(UserOpenInfo));
  finally
    LeaveCriticalSection(m_LoadHeroSection);
  end;
end;

//004AEB80
procedure TUserEngine.KickOnlineUser(sChrName: String);
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
    if CompareText(PlayObject.m_sCharName,sChrName) = 0 then begin
      PlayObject.m_boKickFlag:=True;
      break;
    end;
  end;
end;
//004AF85C
function TUserEngine.SendSwitchData(PlayObject: TPlayObject;nServerIndex: Integer): Boolean;
begin
  Result:=True;
end;
//004AF988
procedure TUserEngine.SendChangeServer(PlayObject: TPlayObject;nServerIndex: Integer);
var
  sIPaddr:String;
  nPort:Integer;
ResourceString
  sMsg = '%s/%d';
begin
  if GetMultiServerAddrPort(nServerIndex,sIPaddr,nPort) then begin
    PlayObject.SendDefMessage(SM_RECONNECT,0,0,0,0,format(sMsg,[sIPaddr,nPort]));
  end;
end;

procedure TUserEngine.SaveHumanRcd(PlayObject: TPlayObject); //004AE488
var
  SaveRcd:pTSaveRcd;
begin
  New(SaveRcd);
  FillChar(SaveRcd^,SizeOf(TSaveRcd),#0);
  SaveRcd.sAccount:=PlayObject.m_sUserID;
  SaveRcd.sChrName:=PlayObject.m_sCharName;
  SaveRcd.nSessionID:=PlayObject.m_nSessionID;
  SaveRcd.PlayObject:=PlayObject;
  PlayObject.MakeSaveRcd(SaveRcd.HumanRcd);
  FrontEngine.AddToSaveRcdList(SaveRcd);
end;

procedure TUserEngine.SaveHeroRcd(HeroObject: THeroObject);
var
  SaveRcd: pTSaveRcd;
begin
  New(SaveRcd);
  FillChar(SaveRcd^, SizeOf(TSaveRcd), #0);
  SaveRcd.sAccount := HeroObject.m_sUserID;
  SaveRcd.sChrName := HeroObject.m_sCharName;
  SaveRcd.nSessionID := HeroObject.m_nSessionID;
  SaveRcd.PlayObject := HeroObject;
  HeroObject.MakeSaveRcd(SaveRcd.HumanRcd);
  FrontEngine.AddToSaveHeroRcdList(SaveRcd);
end;

procedure TUserEngine.AddToHumanFreeList(PlayObject: TPlayObject);//004AE45C
begin
  PlayObject.m_dwGhostTick:=GetTickCount();
  m_PlayObjectFreeList.Add(PlayObject);
end;

procedure TUserEngine.AddToHeroFreeList(HeroObject: THeroObject);
begin
  HeroObject.m_dwGhostTick := GetTickCount();
  m_HeroObjectFreeList.Add(HeroObject);
end;
//004AEE98
function TUserEngine.GetSwitchData(sChrName: String; nCode: Integer): pTSwitchDataInfo;
var
  i:integer;
  SwitchData:pTSwitchDataInfo;
begin
  Result:=nil;
  for I := 0 to m_ChangeServerList.Count - 1 do begin
    SwitchData:=m_ChangeServerList.Items[i];
    if (CompareText(SwitchData.sChrName,sChrName) = 0) and (SwitchData.nCode = nCode) then begin
      Result:=SwitchData;
      break;
    end;
  end;
end;

procedure TUserEngine.GetHumData(PlayObject: TPlayObject;
  var HumanRcd: THumData); //004B3050
var
  HumItems      :pTHumItems;
  BagItems      :pTBagItems;
  UserItem      :PTUserItem;
  HumMagic      :pTHumMagic;
  AutoItems     :pTAutoItems;
  UserMagic     :pTUserMagic;
  MagicInfo     :pTMagic;
  StorageItems  :pTStorageItems;    //â��
  I             :integer;
begin
  PlayObject.m_sCharName          := HumanRcd.sChrName;
  PlayObject.m_sMapName           := HumanRcd.sCurMap;
  PlayObject.m_nCurrX             := HumanRcd.wCurX;
  PlayObject.m_nCurrY             := HumanRcd.wCurY;
  PlayObject.m_btDirection        := HumanRcd.btDir;
  PlayObject.m_btHair             := HumanRcd.btHair;
  PlayObject.m_btGender           := HumanRcd.btSex;
  PlayObject.m_btJob              := HumanRcd.btJob;
  PlayObject.m_nGold              := HumanRcd.nGold;

  PlayObject.m_Abil.Level         := HumanRcd.Abil.Level;
  PlayObject.m_Abil.HP            := HumanRcd.Abil.HP;
  PlayObject.m_Abil.MP            := HumanRcd.Abil.MP;
  PlayObject.m_Abil.MaxHP         := HumanRcd.Abil.MaxHP;
  PlayObject.m_Abil.MaxMP         := HumanRcd.Abil.MaxMP;
  PlayObject.m_Abil.Exp           := HumanRcd.Abil.Exp;
  PlayObject.m_Abil.MaxExp        := HumanRcd.Abil.MaxExp;
  PlayObject.m_Abil.Weight        := HumanRcd.Abil.Weight;
  PlayObject.m_Abil.MaxWeight     := HumanRcd.Abil.MaxWeight;
  PlayObject.m_Abil.WearWeight    := HumanRcd.Abil.WearWeight;
  PlayObject.m_Abil.MaxWearWeight := HumanRcd.Abil.MaxWearWeight;
  PlayObject.m_Abil.HandWeight    := HumanRcd.Abil.HandWeight;
  PlayObject.m_Abil.MaxHandWeight := HumanRcd.Abil.MaxHandWeight;

  PlayObject.m_Abil.KillPoint     := HumanRcd.Abil.KillPoint;     //ų/����
  PlayObject.m_Abil.DeathPoint    := HumanRcd.Abil.DeathPoint;    //ų/����
  PlayObject.m_Abil.KillPointCurr := HumanRcd.Abil.KillPointCurr;     //ų/����
  PlayObject.m_Abil.DeathPointCurr:= HumanRcd.Abil.DeathPointCurr;    //ų/����

  //PlayObject.m_Abil:=HumanRcd.Abil;

  PlayObject.m_wStatusTimeArr     := HumanRcd.wStatusTimeArr;
  PlayObject.m_sHomeMap           := HumanRcd.sHomeMap;
  PlayObject.m_nHomeX             := HumanRcd.wHomeX;
  PlayObject.m_nHomeY             := HumanRcd.wHomeY;
  PlayObject.m_BonusAbil          := HumanRcd.BonusAbil;// 08/09
  PlayObject.m_nBonusPoint        := HumanRcd.nBonusPoint;// 08/09
  PlayObject.m_btAiMode           := HumanRcd.btAiMode;
  PlayObject.m_btReLevel          := HumanRcd.btReLevel;       //����

  PlayObject.m_sMasterName        := HumanRcd.sMasterName;

  PlayObject.m_sStoragePwd        := HumanRcd.sStoragePwd;     //â����ȣ
  if PlayObject.m_sStoragePwd <> '' then
    PlayObject.m_boStoragePwd := True;                         //â����ȣ

  PlayObject.m_nGameGold          := HumanRcd.nGameGold;
  PlayObject.m_nBankGold          := HumanRcd.nBankGold;    
  PlayObject.m_nGamePoint         := HumanRcd.nGamePoint;
  PlayObject.m_nPCPoint           := HumanRcd.nPCPoint;

  PlayObject.m_nPkPoint           := HumanRcd.nPkPoint;     //������

  PlayObject.m_nKillPoint         := HumanRcd.nKillPoint;    //ų/����
  PlayObject.m_nDeathPoint        := HumanRcd.nDeathPoint;   //ų/����

  if HumanRcd.btAllowGroup > 0 then PlayObject.m_boAllowGroup:=True      //�׷�
  else PlayObject.m_boAllowGroup  := False;      //�׷�
  PlayObject.m_btAttatckMode      := HumanRcd.btAttatckMode;      //���ݸ��
  PlayObject.m_nIncHealth         := HumanRcd.btIncHealth;
  PlayObject.m_nIncSpell          := HumanRcd.btIncSpell;
  PlayObject.m_nIncHealing        := HumanRcd.btIncHealing;
  PlayObject.m_nFightZoneDieCount := HumanRcd.btFightZoneDieCount;
  PlayObject.m_sUserID            := HumanRcd.sAccount;
  PlayObject.m_boLockLogon        := HumanRcd.boLockLogon;

  PlayObject.m_nMasterUpExp       := HumanRcd.nMasterUpExp;
  PlayObject.m_boAllowGuildReCall := HumanRcd.boAllowGuildReCall;
  PlayObject.m_wGroupRcallTime    := HumanRcd.wGroupRcallTime;
  PlayObject.m_dBodyLuck          := HumanRcd.dBodyLuck;
  PlayObject.m_boAllowGroupReCall := HumanRcd.boAllowGroupReCall;  //�׷�
  PlayObject.m_QuestUnitOpen      := HumanRcd.QuestUnitOpen;
  PlayObject.m_QuestUnit          := HumanRcd.QuestUnit;
  PlayObject.m_QuestFlag          := HumanRcd.QuestFlag;

  PlayObject.m_MissionFlag        := HumanRcd.MissionFlag;      //����Ʈ
  PlayObject.m_MissionInfo        := HumanRcd.MissionInfo;
  PlayObject.m_MissionIndex       := HumanRcd.MissionIndex;        //����Ʈ
  PlayObject.m_MissionArithmometer := HumanRcd.MissionArithmometer;                //����Ʈ

  PlayObject.m_btLimitLevel       := HumanRcd.btLimitLevel;
  PlayObject.m_nHeroGrade         := HumanRcd.nHeroGrade;
  PlayObject.m_btHeroAutoDurg     := HumanRcd.btHeroAutoDurg;
  PlayObject.m_sHeroCharName      := HumanRcd.sHeroChrName;

  HumItems                           := @HumanRcd.HumItems;
  PlayObject.m_UseItems[U_DRESS]     := HumItems[U_DRESS];
  PlayObject.m_UseItems[U_WEAPON]    := HumItems[U_WEAPON];
  PlayObject.m_UseItems[U_RIGHTHAND] := HumItems[U_RIGHTHAND];
  PlayObject.m_UseItems[U_NECKLACE]  := HumItems[U_HELMET];
  PlayObject.m_UseItems[U_HELMET]    := HumItems[U_NECKLACE];
  PlayObject.m_UseItems[U_ARMRINGL]  := HumItems[U_ARMRINGL];
  PlayObject.m_UseItems[U_ARMRINGR]  := HumItems[U_ARMRINGR];
  PlayObject.m_UseItems[U_RINGL]     := HumItems[U_RINGL];
  PlayObject.m_UseItems[U_RINGR]     := HumItems[U_RINGR];
  PlayObject.m_UseItems[U_BUJUK]     := HumItems[U_BUJUK];
  PlayObject.m_UseItems[U_BELT]      := HumItems[U_BELT];
  PlayObject.m_UseItems[U_BOOTS]     := HumItems[U_BOOTS];
  PlayObject.m_UseItems[U_CHARM]     := HumItems[U_CHARM];
  PlayObject.m_UseItems[U_TIGER]     := HumItems[U_TIGER];  //ȣ����

  PlayObject.m_UseItems[U_PETS1]     := HumItems[U_PETS1];     //ȣ����
  PlayObject.m_UseItems[U_PETS2]     := HumItems[U_PETS2];
  PlayObject.m_UseItems[U_PETS3]     := HumItems[U_PETS3];
  PlayObject.m_UseItems[U_PETS4]     := HumItems[U_PETS4];
  PlayObject.m_UseItems[U_PETS5]     := HumItems[U_PETS5];      //ȣ����

  PlayObject.m_UseItems[U_FISH1]     := HumItems[U_FISH1];    //����
  PlayObject.m_UseItems[U_FISH2]     := HumItems[U_FISH2];
  PlayObject.m_UseItems[U_FISH3]     := HumItems[U_FISH3];
  PlayObject.m_UseItems[U_FISH4]     := HumItems[U_FISH4];
  PlayObject.m_UseItems[U_FISH5]     := HumItems[U_FISH5];

  BagItems:=@HumanRcd.BagItems;
  for I := Low(TBagItems) to high(TBagItems) do begin
    if BagItems[i].wIndex > 0 then begin
      New(UserItem);
      UserItem^:=BagItems[i];
      PlayObject.m_ItemList.Add(UserItem);
    end;
  end;
  HumMagic:=@HumanRcd.Magic;
  for I := Low(THumMagic) to high(THumMagic) do begin
    MagicInfo:=UserEngine.FindMagic(HumMagic[i].wMagIdx);
    if MagicInfo <> nil then begin
      New(UserMagic);
      UserMagic.MagicInfo  := MagicInfo;
      UserMagic.wMagIdx    := HumMagic[i].wMagIdx;
      UserMagic.btLevel    := HumMagic[i].btLevel;
      UserMagic.btKey      := HumMagic[i].btKey;
      UserMagic.nTranPoint := HumMagic[i].nTranPoint;
      PlayObject.m_MagicList.Add(UserMagic);
    end;
  end;

  AutoItems := @HumanRcd.AutoItems;
  for I := Low(TAutoItems) to High(TAutoItems) do begin
    if AutoItems[I].wIndex > 0 then begin
      New(UserItem);
      UserItem^ := AutoItems[I];
      PlayObject.m_AutoItem.Add(UserItem);
    end;
  end;

  StorageItems:=@HumanRcd.StorageItems;       //â��
  for I := Low(TStorageItems) to high(TStorageItems) do begin
    if StorageItems[I].wIndex > 0 then begin
      New(UserItem);
      UserItem^:=StorageItems[I];
      PlayObject.m_StorageItemList.Add(UserItem);
    end;
  end;
end;


procedure TUserEngine.GetHeroData(HeroObject: THeroObject;
  var HumanRcd: THumData);
var
  I: Integer;
  HumItems: pTHumItems;
  BagItems: pTBagItems;
  UserItem: pTUserItem;
  AutoItems: pTAutoItems;
  HumMagic: pTHumMagic;
  StorageItems  :pTStorageItems;    //â��
  UserMagic: pTUserMagic;
  MagicInfo: pTMagic;
begin

  HeroObject.m_sCharName := HumanRcd.sChrName;
  HeroObject.m_sMapName := HumanRcd.sCurMap;
  HeroObject.m_nCurrX := HumanRcd.wCurX;
  HeroObject.m_nCurrY := HumanRcd.wCurY;
  HeroObject.m_btDirection := HumanRcd.btDir;
  HeroObject.m_btHair := HumanRcd.btHair;
  HeroObject.m_btGender := HumanRcd.btSex;
  HeroObject.m_btJob := HumanRcd.btJob;
  HeroObject.m_nGold := HumanRcd.nGold;

  HeroObject.m_Abil.Level := HumanRcd.Abil.Level;

  HeroObject.m_Abil.HP := HumanRcd.Abil.HP;
  HeroObject.m_Abil.MP := HumanRcd.Abil.MP;
  HeroObject.m_Abil.MaxHP := HumanRcd.Abil.MaxHP;
  HeroObject.m_Abil.MaxMP := HumanRcd.Abil.MaxMP;
  HeroObject.m_Abil.Exp := HumanRcd.Abil.Exp;
  HeroObject.m_Abil.MaxExp := HumanRcd.Abil.MaxExp;
  HeroObject.m_Abil.Weight := HumanRcd.Abil.Weight;
  HeroObject.m_Abil.MaxWeight := HumanRcd.Abil.MaxWeight;
  HeroObject.m_Abil.WearWeight := HumanRcd.Abil.WearWeight;
  HeroObject.m_Abil.MaxWearWeight := HumanRcd.Abil.MaxWearWeight;
  HeroObject.m_Abil.HandWeight := HumanRcd.Abil.HandWeight;
  HeroObject.m_Abil.MaxHandWeight := HumanRcd.Abil.MaxHandWeight;

  HeroObject.m_Abil.KillPoint     := HumanRcd.Abil.KillPoint;     //ų/����
  HeroObject.m_Abil.DeathPoint    := HumanRcd.Abil.DeathPoint;    //ų/����
  HeroObject.m_Abil.KillPointCurr := HumanRcd.Abil.KillPointCurr;     //ų/����
  HeroObject.m_Abil.DeathPointCurr:= HumanRcd.Abil.DeathPointCurr;    //ų/����


  HeroObject.m_wStatusTimeArr := HumanRcd.wStatusTimeArr;
  HeroObject.m_sHomeMap := HumanRcd.sHomeMap;
  HeroObject.m_nHomeX := HumanRcd.wHomeX;
  HeroObject.m_nHomeY := HumanRcd.wHomeY;

  HeroObject.m_BonusAbil          := HumanRcd.BonusAbil;// 08/09
  HeroObject.m_nBonusPoint        := HumanRcd.nBonusPoint;// 08/09
  HeroObject.m_btAiMode           := HumanRcd.btAiMode;
  HeroObject.m_btReLevel          := HumanRcd.btReLevel;       //����

  HeroObject.m_nPkPoint := HumanRcd.nPKPOINT;
  HeroObject.m_nKillPoint         := HumanRcd.nKillPoint;    //ų/����
  HeroObject.m_nDeathPoint        := HumanRcd.nDeathPoint;   //ų/����

  HeroObject.m_btAttatckMode := HumanRcd.btAttatckMode;
 // HeroObject.m_btHeroAtMode := HumData.btHeroAtMode;
  HeroObject.m_nIncHealth := HumanRcd.btIncHealth;
  HeroObject.m_nIncSpell := HumanRcd.btIncSpell;
  HeroObject.m_nIncHealing := HumanRcd.btIncHealing;
  HeroObject.m_nFightZoneDieCount := HumanRcd.btFightZoneDieCount;
  HeroObject.m_sUserID := HumanRcd.sAccount;

  HeroObject.m_dBodyLuck := HumanRcd.dBodyLuck;

  HeroObject.m_btHeroAutoDurg := HumanRcd.btHeroAutoDurg;
  HeroObject.m_nHeroGrade := HumanRcd.nHeroGrade;
  HeroObject.m_btLimitLevel := HumanRcd.btLimitLevel;
  HeroObject.m_QuestFlag := HumanRcd.QuestFlag;
  HeroObject.m_btStatus := HumanRcd.btStatus;

  HumItems := @HumanRcd.HumItems;

  HeroObject.m_UseItems[U_DRESS] := HumItems[U_DRESS];
  HeroObject.m_UseItems[U_WEAPON] := HumItems[U_WEAPON];
  HeroObject.m_UseItems[U_RIGHTHAND] := HumItems[U_RIGHTHAND];
  HeroObject.m_UseItems[U_NECKLACE] := HumItems[U_HELMET];
  HeroObject.m_UseItems[U_HELMET] := HumItems[U_NECKLACE];
  HeroObject.m_UseItems[U_ARMRINGL] := HumItems[U_ARMRINGL];
  HeroObject.m_UseItems[U_ARMRINGR] := HumItems[U_ARMRINGR];
  HeroObject.m_UseItems[U_RINGL] := HumItems[U_RINGL];
  HeroObject.m_UseItems[U_RINGR] := HumItems[U_RINGR];
  HeroObject.m_UseItems[U_BUJUK] := HumItems[U_BUJUK];
  HeroObject.m_UseItems[U_BELT] := HumItems[U_BELT];
  HeroObject.m_UseItems[U_BOOTS] := HumItems[U_BOOTS];
  HeroObject.m_UseItems[U_CHARM] := HumItems[U_CHARM];

  BagItems := @HumanRcd.BagItems;
  for I := Low(TBagItems) to High(TBagItems) do begin
    if BagItems[I].wIndex > 0 then begin
      New(UserItem);
      UserItem^ := BagItems[I];
      HeroObject.m_ItemList.Add(UserItem);
    end;
  end;

  HumMagic := @HumanRcd.Magic;
  for I := Low(THumMagic) to high(THumMagic) do begin
    MagicInfo:=UserEngine.FindHeroMagic(HumMagic[i].wMagIdx);
    if MagicInfo <> nil then begin
      New(UserMagic);
      UserMagic.MagicInfo  := MagicInfo;
      UserMagic.wMagIdx    := HumMagic[i].wMagIdx;
      UserMagic.btLevel    := HumMagic[i].btLevel;
      UserMagic.btKey      := HumMagic[i].btKey;
      UserMagic.nTranPoint := HumMagic[i].nTranPoint;
      HeroObject.m_MagicList.Add(UserMagic);
    end;
  end;

  AutoItems := @HumanRcd.AutoItems;
  for I := Low(TAutoItems) to High(TAutoItems) do begin
    if AutoItems[I].wIndex > 0 then begin
      New(UserItem);
      UserItem^ := AutoItems[I];
      HeroObject.m_AutoItem.Add(UserItem);
    end;
  end;

  StorageItems:=@HumanRcd.StorageItems;       //â��
  for I := Low(TStorageItems) to high(TStorageItems) do begin
    if StorageItems[I].wIndex > 0 then begin
      New(UserItem);
      UserItem^:=StorageItems[I];
      HeroObject.m_StorageItemList.Add(UserItem);
    end;
  end;

end;
//004B1E50
function TUserEngine.GetHomeInfo(nJob:Integer; var nX, nY: Integer): String;
var
  I   :Integer;
  Point:pTStartPoint;
begin
  if g_Config.boJobHomePoint then begin
    case nJob of
      jWarr, jUpWarr:begin
        Result := g_Config.sWarriorHomeMap;
        nX     := g_Config.nWarriorHomeX;
        nY     := g_Config.nWarriorHomeY;
      end;
      jWizard, jUpWiz:begin
        Result := g_Config.sWizardHomeMap;
        nX     := g_Config.nWizardHomeX;
        nY     := g_Config.nWizardHomeY;
      end;
      jTaos, jUpTao:begin
        Result := g_Config.sTaoistHomeMap;
        nX     := g_Config.nTaoistHomeX;
        nY     := g_Config.nTaoistHomeY;
      end;
      jAssassin, jUpAssa:begin       //�ڰ� //���ڰ�
        Result := g_Config.sAssassinHomeMap;
        nX     := g_Config.nAssassinHomeX;
        nY     := g_Config.nAssassinHomeY;
      end;
      jBonze, jUpBoz:begin       //�·� //�İ��
        Result := g_Config.sBonzeHomeMap;
        nX     := g_Config.nBonzeHomeX;
        nY     := g_Config.nBonzeHomeY;
      end;
      else begin
        Result := g_Config.sHomeMap;
        nX     := g_Config.nHomeX;
        nY     := g_Config.nHomeY;
      end;
    end;
  end else begin
    g_StartPoint.Lock;
    try
      if g_StartPoint.Count > 0 then begin
        if g_StartPoint.Count > 1 then I:=Random(g_Config.nStartPointSize{2})
        else I:=0;
        Point:=g_StartPoint.Items[I];
        Result := Point.sMapName;
        nX     := Point.nX;
        nY     := Point.nY;
      end else begin
        Result := g_Config.sHomeMap;
        nX     := g_Config.nHomeX;
        nX     := g_Config.nHomeY;
      end;
    finally
      g_StartPoint.UnLock;
    end;
  end;
end;
//004DA6DC
function TUserEngine.GetRandHomeX(PlayObject: TPlayObject): Integer;
begin
  Result:=Random(3) + (PlayObject.m_nHomeX - 2) ;
end;
//004DA708
function TUserEngine.GetRandHomeY(PlayObject: TPlayObject): Integer;
begin
  Result:=Random(3) + (PlayObject.m_nHomeY - 2) ;
end;
//004AF2DC
procedure TUserEngine.LoadSwitchData(SwitchData: pTSwitchDataInfo;var
  PlayObject: TPlayObject);
var
  nCount:Integer;
  i: integer;
  SlaveInfo: pTSlaveInfo;
begin
  if SwitchData.boC70 then begin

  end;
  PlayObject.m_boBanStoreShout:= SwitchData.boBanStoreShout;
  PlayObject.m_boBanShout     := SwitchData.boBanShout;
  PlayObject.m_boHearWhisper  := SwitchData.boHearWhisper;
  PlayObject.m_boBanGuildChat := SwitchData.boBanGuildChat;
  PlayObject.m_boBanGroupChat := SwitchData.boBanGroupChat;
  PlayObject.m_boBanSysMsg    := SwitchData.boBanSysMsg;
  PlayObject.m_boHearMsg      := SwitchData.boHearMsg;      //�Ϲ� ��ȭ
  PlayObject.m_boAdminMode    := SwitchData.boAdminMode;
  PlayObject.m_boObMode       := SwitchData.boObMode;
  
  nCount:=0;
  while (True) do begin
    if SwitchData.BlockWhisperArr[nCount] = '' then break;
    PlayObject.m_BlockWhisperList.Add(SwitchData.BlockWhisperArr[nCount]);
    Inc(nCount);
    if nCount >= High(SwitchData.BlockWhisperArr) then break;
  end;

  nCount:=0;
  while (True) do begin //004AF3CA
    if SwitchData.SlaveArr[nCount].sSlaveName = '' then break;
    New(SlaveInfo);
    SlaveInfo^:=SwitchData.SlaveArr[nCount];
    PlayObject.SendDelayMsg(PlayObject,RM_10401,0,Integer(SlaveInfo),0,0,'',500);
    Inc(nCount);
    if nCount >= 5 then break;
  end;

  nCount:=0;
  while (True) do begin //004AF3CA
    PlayObject.m_wStatusArrValue[nCount]:=SwitchData.StatusValue[nCount];
    PlayObject.m_dwStatusArrTimeOutTick[nCount]:=SwitchData.StatusTimeOut[nCount];
    Inc(nCount);
    if nCount >= 6 then break;
  end;

  for i:=0 to EXTRAABIL_SIZE-1 do begin
      PlayObject.ExtraAbil[i] := SwitchData.ExtraAbil[i];

      if SwitchData.ExtraAbilTimes[i] > 0 then
      PlayObject.ExtraAbilTimes[i] := SwitchData.ExtraAbilTimes[i] + GetTickCount  //����� �ð��� ���� �ð���
      else
      PlayObject.ExtraAbilTimes[i] := 0 ;
   end;
end;
//004AF4A4 
procedure TUserEngine.DelSwitchData(SwitchData: pTSwitchDataInfo);
var
  I: Integer;
  SwitchDataInfo: pTSwitchDataInfo;
begin
  for I := 0 to m_ChangeServerList.Count - 1 do begin
    SwitchDataInfo:=m_ChangeServerList.Items[i];
    if SwitchDataInfo = SwitchData then begin
      Dispose(SwitchDataInfo);
      m_ChangeServerList.Delete(I);
      break;
    end;
  end;    // for
end;

//004AE398
function TUserEngine.FindMagic(nMagIdx: Integer): pTMagic;
var
  I: Integer;
  Magic:pTMagic;
begin
  Result:=nil;
    for I := 0 to m_MagicList.Count - 1 do begin
      Magic:=m_MagicList.Items[i];
      if Magic.wMagicId = nMagIdx then begin
        Result:=Magic;
        break;
      end;
    end;
end;

function TUserEngine.FindHeroMagic(nMagIdx: Integer): pTMagic;
var
  I: Integer;
  Magic: pTMagic;
begin
  Result := nil;
    for I := 0 to m_MagicList.Count - 1 do begin
      Magic := m_MagicList.Items[I];
      if Magic <> nil then begin
        if Magic.wMagicId = nMagIdx then begin
          Result := Magic;
          Break;
        end;
      end;
    end;
end;

function TUserEngine.FindHeroMagic(sMagicName: string): pTMagic;
var
  I: Integer;
  Magic: pTMagic;
begin
  Result := nil;
    for I := 0 to m_MagicList.Count - 1 do begin
      Magic := m_MagicList.Items[I];
      if Magic <> nil then begin
        if CompareText(Magic.sMagicName, sMagicName) = 0 then begin
          Result := Magic;
          Break;
        end;
      end;
    end;
end;

//004ACE94
procedure TUserEngine.MonInitialize(BaseObject: TBaseObject; sMonName: String);
var
  I: Integer;
  Monster:pTMonInfo;
begin
    for I := 0 to MonsterList.Count - 1 do begin
      Monster:=MonsterList.Items[i];
      if CompareText(Monster.sName,sMonName) = 0 then begin
        BaseObject.m_btRaceServer:=Monster.btRace;        //�����̽�
        BaseObject.m_btRaceImg:=Monster.btRaceImg;
        BaseObject.m_wAppr:=Monster.wAppr;
        BaseObject.m_Abil.Level:=Monster.wLevel;
        BaseObject.m_btLifeAttrib:=Monster.btLifeAttrib ;
        BaseObject.m_btCoolEye:=Monster.wCoolEye ;
        BaseObject.m_dwFightExp:=Monster.dwExp;
        BaseObject.m_Abil.HP:=Monster.wHP;
        BaseObject.m_Abil.MaxHP:=Monster.wHP;
       // BaseObject.m_btMonsterWeapon:=LoByte(Monster.wMP);
        //BaseObject.m_Abil.MP:=Monster.wMP;
        BaseObject.m_Abil.MP:=0;
        BaseObject.m_Abil.MaxMP:=Monster.wMP;
        BaseObject.m_Abil.AC:=MakeLong(Monster.wAC,Monster.wAC);
        BaseObject.m_Abil.MAC:=MakeLong(Monster.wMAC,Monster.wMAC);
        BaseObject.m_Abil.DC:=MakeLong(Monster.wDC,Monster.wMaxDC);
        BaseObject.m_Abil.MC:=MakeLong(Monster.wMC,Monster.wMC);
        BaseObject.m_Abil.SC:=MakeLong(Monster.wSC,Monster.wSC);
        BaseObject.m_btSpeedPoint:=Monster.wSpeed;
        BaseObject.m_btHitPoint:=Monster.wHitPoint;
        BaseObject.m_nWalkSpeed:=Monster.wWalkSpeed;
        BaseObject.m_nWalkStep:=Monster.wWalkStep;
        BaseObject.m_dwWalkWait:=Monster.wWalkWait;
        BaseObject.m_nNextHitTime:=Monster.wAttackSpeed;
        BaseObject.m_boNastyMode:=Monster.boAggro;
        BaseObject.m_boNoTame:=Monster.boTame;
        BaseObject.m_NoPoison:=Monster.NoPoison;
        break;
      end;
    end;
end;

function TUserEngine.OpenDoor(Envir: TEnvirnoment; nX,
  nY: Integer): Boolean; //004AC698
var
  Door:pTDoorInfo;
begin
  Result:=False;
  Door:=Envir.GetDoor(nX,nY);
  if (Door <> nil) and not Door.Status.boOpened and not Door.Status.bo01 then begin
    Door.Status.boOpened:=True;
    Door.Status.dwOpenTick:=GetTickCount();
    SendDoorStatus(Envir,nX,nY,RM_DOOROPEN,0,nX,nY,0,'');
    Result:=True;
  end;    
end;
function TUserEngine.CloseDoor(Envir: TEnvirnoment; Door:pTDoorInfo): Boolean; //004AC77B
begin
  Result:=False;
  if (Door <> nil) and (Door.Status.boOpened) then begin
    Door.Status.boOpened:=False;
    SendDoorStatus(Envir,Door.nX,Door.nY,RM_DOORCLOSE,0,Door.nX,Door.nY,0,'');
    Result:=True;
  end;
end;

procedure TUserEngine.SendDoorStatus(Envir: TEnvirnoment; nX, nY: Integer;
  wIdent, wX: Word; nDoorX, nDoorY, nA: Integer;sStr:String);  //004AC518
var
  I: Integer;
  n10,n14: Integer;
  n1C,n20,n24,n28:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  n1C:=nX - 12;
  n24:=nX + 12;
  n20:=nY - 12;
  n28:=nY + 12;
  for n10:= n1C to n24 do begin
    for n14:= n20 to n28 do begin
      if Envir.GetMapCellInfo(n10,n14,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
        for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
          OSObject:=MapCellInfo.ObjList.Items[i];
          if (OSObject <> nil) and (OSObject.btType = OS_MOVINGOBJECT) then begin
            BaseObject:=TBaseObject(OSObject.CellObj);
            if (BaseObject <> nil) and
               (not BaseObject.m_boGhost) and
               (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
              BaseObject.SendMsg(BaseObject,wIdent,wX,nDoorX,nDoorY,nA,sStr);
            end;
          end;            
        end;
      end;
    end;
  end;
end;

procedure TUserEngine.ProcessMapDoor; //004AC78C
var
  I     :Integer;
  II    :Integer;
  Envir :TEnvirnoment;
  Door  :pTDoorInfo;
begin
  for I:= 0 to g_MapManager.Count - 1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[I]);
    for II:= 0 to Envir.m_DoorList.Count - 1 do begin
      Door:=Envir.m_DoorList.Items[II];
      if Door.Status.boOpened then begin
        if (GetTickCount - Door.Status.dwOpenTick) > 5 * 1000 then
          CloseDoor(Envir,Door);
      end;
    end;
  end;
end;

procedure TUserEngine.SaveUsrLog();
var
  i:Integer;
  sTxt:String;
  LogFile :TextFile;
  PlayObject:TPlayObject;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::SaveUsrLog()';
begin
  try
    if (GetTickCount() - dwProcessUsrLogTick) > 8*60*1000 {8 mins} then begin
      dwProcessUsrLogTick:=GetTickCount();

      AssignFile(LogFile, sUsrLogFileName);
      Rewrite(LogFile);

      WriteLn(LogFile, ';��ɫ��, �Ա�, ְҵ, ����ģʽ, �ȼ�, ��ͼ, x y ����, ��½ID, IP, Ȩ��');

      try
        EnterCriticalSection(ProcessHumanCriticalSection);
        for i := 0 to m_PlayObjectList.Count - 1 do begin
          PlayObject := m_PlayObjectList.Objects[i] as TPlayObject;

          sTxt := Format('%s,%d,%d,%d,%d,%s,%d-%d,%s,%s,%d',
                         [PlayObject.m_sCharName,PlayObject.m_btGender,PlayObject.m_btJob,
                         PlayObject.m_btAttatckMode,PlayObject.m_Abil.Level,PlayObject.m_sMapName,PlayObject.m_nCurrX,PlayObject.m_nCurrY,
                         PlayObject.m_sUserID,PlayObject.m_sIPaddr,PlayObject.m_btPermission]);

          WriteLn(LogFile, sTxt);
        end;
      finally
        LeaveCriticalSection(ProcessHumanCriticalSection);
      end;

      CloseFile(LogFile);
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TUserEngine.ProcessEvents; //004AED70
var
  I,II,III   :Integer;
  MagicEvent :pTMagicEvent;
  BaseObject :TBaseObject;
begin
  for I := m_MagicEventList.Count - 1 downto 0 do begin
    MagicEvent:=m_MagicEventList.Items[I];
    if MagicEvent <> nil then begin
      for II := MagicEvent.BaseObjectList.Count - 1 downto 0 do begin
        BaseObject:=TBaseObject(MagicEvent.BaseObjectList.Items[II]);       //��迡 ���� �׾��� , Ǯ�ȴ��� Ȯ��
        if BaseObject.m_boDeath or (BaseObject.m_boGhost) or ((not BaseObject.m_boHolySeize) and (not BaseObject.m_boPobakSeize)) then begin
          MagicEvent.BaseObjectList.Delete(II);
        end;
      end;
      if (MagicEvent.BaseObjectList.Count <= 0) or
         ((GetTickCount - MagicEvent.dwStartTick) > MagicEvent.dwTime) or
         ((GetTickCount - MagicEvent.dwStartTick) > 180000) then begin    //3��  ���
        MagicEvent.BaseObjectList.Free;
        III:=0;
        while (True) do begin
          if MagicEvent.Events[III] <> nil then begin
            MagicEvent.Events[III].Close();
          end;
          Inc(III);
          if III >= 8 then break;
        end;
        Dispose(MagicEvent);
        m_MagicEventList.Delete(I);
      end;
    end;
  end;
end;

function TUserEngine.FindMagic(sMagicName: String): pTMagic; //004AE2E4
var
  I: Integer;
  Magic:pTMagic;
begin
  Result:=nil;
    for I := 0 to m_MagicList.Count - 1 do begin
      Magic:=m_MagicList.Items[i];
      if CompareText(Magic.sMagicName,sMagicName) = 0 then begin
        Result:=Magic;
        break;
      end;
    end;
end;
function TUserEngine.GetMapRangeMonster(Envir:TEnvirnoment;nX,nY,nRange:Integer;List:TList):Integer;
var
  I,II: Integer;
  MonGen:pTMonGenInfo;
  BaseObject:TBaseObject;
begin
  Result:=0;
  if Envir = nil then exit;
  for I := 0 to m_MonGenList.Count - 1 do begin
    MonGen:=m_MonGenList.Items[I];
    if (MonGen = nil) then Continue;
    if (MonGen.Envir <> nil) and (MonGen.Envir <> Envir) then Continue;

    for II := 0 to MonGen.CertList.Count - 1 do begin
      BaseObject:=TBaseObject(MonGen.CertList.Items[II]);
      if not BaseObject.m_boDeath and not BaseObject.m_boGhost and (BaseObject.m_PEnvir = Envir) and (abs(BaseObject.m_nCurrX - nX) <= nRange) and (abs(BaseObject.m_nCurrY - nY) <= nRange) then begin
        if List <> nil then List.Add(BaseObject);
        Inc(Result);
      end;
    end;
  end;
end;

procedure TUserEngine.AddMerchant(Merchant:TMerchant);
begin
  UserEngine.m_MerchantList.Lock;
  try
    Merchant.m_NpcType := n_Merchant;
    UserEngine.m_MerchantList.Add(Merchant);
  finally
    UserEngine.m_MerchantList.UnLock;
  end;
end;

function TUserEngine.GetMerchantList(Envir: TEnvirnoment; nX, nY,
  nRange: Integer; TmpList: TList): Integer; //004ACB84
var
  I: Integer;
  Merchant:TMerchant;
begin
  m_MerchantList.Lock;
  try
    for I := 0 to m_MerchantList.Count - 1 do begin
      Merchant:=TMerchant(m_MerchantList.Items[i]);
      if (Merchant.m_PEnvir = Envir) and
         (abs(Merchant.m_nCurrX - nX) <= nRange) and
         (abs(Merchant.m_nCurrY - nY) <= nRange) then begin

        TmpList.Add(Merchant);
      end;
    end;    // for
  finally
    m_MerchantList.UnLock;
  end;
  Result:=TmpList.Count
end;
function TUserEngine.GetNpcList(Envir: TEnvirnoment; nX, nY,
  nRange: Integer; TmpList: TList): Integer;
var
  I: Integer;
  Npc:TNormNpc;
begin
  for I := 0 to QuestNPCList.Count - 1 do begin
    Npc:=TNormNpc(QuestNPCList.Items[i]);
    if (Npc.m_PEnvir = Envir) and
       (abs(Npc.m_nCurrX - nX) <= nRange) and
       (abs(Npc.m_nCurrY - nY) <= nRange) then begin

      TmpList.Add(Npc);
    end;
  end;    // for
  Result:=TmpList.Count
end;
procedure TUserEngine.ReloadMerchantList();
var
  I: Integer;
  Merchant:TMerchant;
begin
  m_MerchantList.Lock;
  try
    for I := 0 to m_MerchantList.Count - 1 do begin
      Merchant:=TMerchant(m_MerchantList.Items[i]);
      if not Merchant.m_boGhost then begin
        Merchant.ClearScript;
        Merchant.LoadNPCScript;
      end;
    end;    // for
  finally
    m_MerchantList.UnLock;
  end;
end;
procedure TUserEngine.ReloadNpcList();
var
  I: Integer;
  Npc:TNormNpc;
begin
  for I := 0 to QuestNPCList.Count - 1 do begin
    Npc:=TNormNpc(QuestNPCList.Items[i]);
    Npc.ClearScript;
    Npc.LoadNPCScript;
  end; 
end;

function  TUserEngine.GetAreaAllUsers (env: TEnvirnoment; ulist: TList): integer;
var
   i, n: integer;
   PlayObject:TPlayObject;
begin
   n := 0;
   for i:=0 to m_PlayObjectList.Count-1 do
   begin
      PlayObject := TPlayObject(m_PlayObjectList.Objects[i]);
      if (not PlayObject.m_BoGhost) and (PlayObject.m_PEnvir = env) then
      begin
            ulist.Add (PlayObject);
            Inc (n);
      end;
   end;
   Result := n;
end;

function TUserEngine.GetMapMonster(Envir: TEnvirnoment; List: TList): Integer; //004AE20C
var
  I,II: Integer;
  MonGen:pTMonGenInfo;
  BaseObject:TBaseObject;
begin
  Result:=0;
  if Envir = nil then exit;
  for I := 0 to m_MonGenList.Count - 1 do begin
    MonGen:=m_MonGenList.Items[I];
    if MonGen = nil then Continue;
    for II := 0 to MonGen.CertList.Count - 1 do begin
      BaseObject:=TBaseObject(MonGen.CertList.Items[II]);
      if (not BaseObject.m_boDeath) and (not BaseObject.m_boGhost) and (BaseObject.m_PEnvir = Envir) and (BaseObject.m_btRaceServer <> RC_PET) then begin
        if List <> nil then List.Add(BaseObject);
        Inc(Result);
      end;
    end;
  end;
end;


function TUserEngine.GetMapMonster2(Envir: TEnvirnoment; List: TList): Integer; //004AE20C   //�����ڽý��� ����
var
  I,II: Integer;
  MonGen:pTMonGenInfo;
  BaseObject:TBaseObject;
begin
  Result:=0;
  if Envir = nil then exit;
  for I := 0 to m_MonGenList.Count - 1 do begin
    MonGen:=m_MonGenList.Items[I];
    if MonGen = nil then Continue;
    for II := 0 to MonGen.CertList.Count - 1 do begin
      BaseObject:=TBaseObject(MonGen.CertList.Items[II]);
      if (not BaseObject.m_boDeath) and (not BaseObject.m_boGhost) and (BaseObject.m_PEnvir = Envir) and (BaseObject.m_btRaceServer <> RC_PET) then begin
        if List <> nil then List.Add(BaseObject);
        Inc(Result);
      end;
    end;
  end;
end;

procedure TUserEngine.HumanExpire(sAccount: String);//004AFBB0
var
  I          :Integer;
  PlayObject :TPlayObject;
begin
  if not g_Config.boKickExpireHuman then exit;    
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
    if CompareText(PlayObject.m_sUserID,sAccount) = 0  then begin
      PlayObject.m_boExpire:=True;
      break;
    end;
  end;
end;

function TUserEngine.GetMapHuman(sMapName: String): Integer; //004AE954
var
  I: Integer;
  Envir: TEnvirnoment;
  PlayObject:TPlayObject;
begin
  Result:=0;
  Envir:=g_MapManager.FindMap(sMapName);
  if Envir = nil then exit;
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
    if not PlayObject.m_boDeath and not PlayObject.m_boGhost and
      (PlayObject.m_PEnvir = Envir)then
      Inc(Result);
  end;
end;

function TUserEngine.GetMapRageHuman(Envir: TEnvirnoment; nRageX,
  nRageY,nRage:Integer;List: TList): Integer; //004AE8AC
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  Result:=0;
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
    if not PlayObject.m_boDeath and
       not PlayObject.m_boGhost and
       (PlayObject.m_PEnvir = Envir) and
       (abs(PlayObject.m_nCurrX - nRageX) <= nRage) and
       (abs(PlayObject.m_nCurrY - nRageY) <= nRage) then begin
      List.Add(PlayObject);
      Inc(Result);
    end;
  end;
end;

function TUserEngine.GetStdItemIdx(sItemName: String): Integer;
var
  I: Integer;
  Item:TItem;
begin
  Result:= -1;
  if sItemName = '' then exit;
    for I := 0 to StdItemList.Count - 1 do begin
      Item:=StdItemList.Items[i];
      if CompareText(Item.Name,sItemName) = 0 then begin
        Result:= I + 1;
        break;
      end;
    end;
end;
//==========================================
//��ÿ�����﷢����Ϣ
//�̰߳�ȫ
//==========================================
procedure TUserEngine.SendBroadCastMsgExt(sMsg: String;MsgType:TMsgType); //004AEAF0
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
    for I := 0 to m_PlayObjectList.Count - 1 do begin
      PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
      if not PlayObject.m_boGhost then
        PlayObject.SysMsg(sMsg,c_Red,MsgType);
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

procedure TUserEngine.SendMoveMsg(sMsg: string);  //ȭ����� (npc)
var
  I: Integer;
  PlayObject: TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject := TPlayObject(m_PlayObjectList.Objects[I]);
    if (PlayObject <> nil) and (not PlayObject.m_boGhost) then begin
      PlayObject.MoveMsg(sMsg);
    end;
  end;
end;

procedure TUserEngine.SendBroadCastMsg(sMsg: String;MsgType:TMsgType); //004AEAF0
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[i]);
    if not PlayObject.m_boGhost then
      PlayObject.SysMsg(sMsg,c_Red,MsgType);
  end;
end;

procedure TUserEngine.SendBroadTopMsg(sMsg: string);
var
  i: Integer;
  PlayObject: TPlayObject;
begin
  for i := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject := TPlayObject(m_PlayObjectList.Objects[i]);
    if PlayObject <> nil then begin
      if (not PlayObject.m_boGhost) then
        PlayObject.SendDefMsg(TBaseObject(Self), SM_TOPMSG, 0, 0, 0, 0, sMsg);
    end;
  end;
end;

procedure TUserEngine.SendBroadTopDelayMsg(sMsg: string; dwDelay: LongWord);
var
  i: Integer;
  PlayObject: TPlayObject;
begin
  for i := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject := TPlayObject(m_PlayObjectList.Objects[i]);
    if PlayObject <> nil then begin
      if (not PlayObject.m_boGhost) then
        PlayObject.SendDelayMsg(PlayObject, SM_TOPMSG, 0, 0, 0, 0, sMsg, dwDelay);
    end;
  end;
end;

procedure TUserEngine.sub_4AE514(GoldChangeInfo: pTGoldChangeInfo); //004AE514
var
  GoldChange:pTGoldChangeInfo;
begin
  New(GoldChange);
  GoldChange^:=GoldChangeInfo^;
  EnterCriticalSection(m_LoadPlaySection);
  try
    m_ChangeHumanDBGoldList.Add(GoldChange);
  finally
    LeaveCriticalSection(m_LoadPlaySection);
  end;
end;
procedure TUserEngine.ClearMonSayMsg;
var
  I,II: Integer;
  MonGen:pTMonGenInfo;
  MonBaseObject:TBaseObject;
begin
  for I := 0 to m_MonGenList.Count - 1 do begin
    MonGen:=m_MonGenList.Items[I];
    for II := 0 to MonGen.CertList.Count - 1 do begin
      MonBaseObject:=TBaseObject(MonGen.CertList.Items[II]);
      MonBaseObject.m_SayMsgList:=nil;
    end;
  end;
end;


function TUserEngine.GetDefiniensConstText(sMsg: string): string;
var
  nC, nIdx, n10: Integer;
  s10, s14, s18, sStr: string;
  tempstr: string;
begin
  nC := 0;
  tempstr := sMsg;
  while (True) do begin
    if Pos(']', tempstr) <= 0 then break;
    tempstr := ArrestStringEx(tempstr, '[', ']', s10);
    if s10 = '' then break;
    if s10[1] = '$' then begin
      s10 := Copy(s10, 2, Length(s10) - 1);
      nIdx := m_DefiniensConst.IndexOf(s10);
      sStr := '[$' + s10 + ']';
      n10 := Pos(sStr, sMsg);
      if n10 > 0 then begin
        s14 := Copy(sMsg, 1, n10 - 1);
        s18 := Copy(sMsg, Length(sStr) + n10, Length(sMsg));
        if nIdx > -1 then begin
          sMsg := s14 + PString(m_DefiniensConst.Objects[nIdx])^ + s18;
        end else begin
          MainOutMessage('�ű������� ' + s10 + ' δ�ҵ�');
          sMsg := s14 + '????' + s18;
        end;
      end;
    end;
    Inc(nC);
    if nC >= 101 then break;
  end;
  Result := sMsg;
end;

procedure TUserEngine.PrcocessData;
var
  dwUsrTimeTick:LongWord;
  sMsg:String;
ResourceString
  sExceptionMsg = '[Exception] TUserEngine::ProcessData';
begin
  try
    dwUsrTimeTick:=GetTickCount();

    ProcessHumans();

    ProcessHeros();
    if g_Config.boSendOnlineCount and (GetTickCount - g_dwSendOnlineTick > g_Config.dwSendOnlineTime) then begin
      g_dwSendOnlineTick:=GetTickCount();
   //   sMsg:=AnsiReplaceText(g_sSendOnlineCountMsg,'%c',IntToStr(ROUND(GetOnlineHumCount * (g_Config.nSendOnlineCountRate / 10))));
      sMsg :=  Format(g_sSendOnlineCountMsg, [ROUND(GetOnlineHumCount * (g_Config.nSendOnlineCountRate / 10)), GetHeroCount]);
      SendBroadCastMsg(sMsg,t_System)
    end;

    ProcessMonsters();

    ProcessMerchants();

    ProcessNpcs();

    if (GetTickCount() - dwProcessMissionsTime) > 1000 then begin
      dwProcessMissionsTime:=GetTickCount();
      ProcessMissions();
      ProcessEvents();
    end;

    if (GetTickCount() - dwProcessMapDoorTick) > 500 then begin
      dwProcessMapDoorTick:=GetTickCount();
      ProcessMapDoor();
    end;
    SaveUsrLog;

    gFireDragon.Run;   //����

    g_nUsrTimeMin:=GetTickCount() - dwUsrTimeTick;
    if g_nUsrTimeMax < g_nUsrTimeMin then g_nUsrTimeMax:=g_nUsrTimeMin;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

function TUserEngine.MapRageHuman(sMapName: String; nMapX, nMapY,
  nRage: Integer): Boolean;
var
  nX,nY:Integer;
  Envir:TEnvirnoment;
begin
  Result:=False;
  Envir:=g_MapManager.FindMap(sMapName);
  if Envir <> nil then begin
    for nX:= nMapX - nRage to nMapX + nRage do begin
      for nY:= nMapY - nRage to nMapY + nRage do begin
        if Envir.GetXYHuman(nMapX, nMapY) then begin
          Result:=True;
          exit;
        end;
      end;
    end;
  end;
end;

procedure TUserEngine.SendQuestMsg(sQuestName:String);
var
  I:Integer;
  PlayObject:TPlayObject;
begin
  for I := 0 to m_PlayObjectList.Count - 1 do begin
    PlayObject:=TPlayObject(m_PlayObjectList.Objects[I]);
    if not PlayObject.m_boDeath and not PlayObject.m_boGhost then
      g_ManageNPC.GotoLable(PlayObject,sQuestName,False);
  end;
end;
procedure TUserEngine.ClearItemList();
var
  I: Integer;
begin
  I:=0;
  while (True) do begin
    StdItemList.Exchange(Random(StdItemList.Count),StdItemList.Count -1);
    Inc(I);
    if I >= StdItemList.Count then break;
  end;
  ClearMerchantData();
end;
procedure TUserEngine.SwitchMagicList();
begin
  if m_MagicList.Count > 0 then begin
    OldMagicList.Add(m_MagicList);
    m_MagicList:=TList.Create;
  end;
end;
procedure TUserEngine.ClearMerchantData();
var
  I: Integer;
  Merchant:TMerchant;
begin
  m_MerchantList.Lock;
  try
    for I := 0 to m_MerchantList.Count - 1 do begin
      Merchant:=TMerchant(m_MerchantList.Items[I]);
      Merchant.ClearData();
    end;
  finally
    m_MerchantList.UnLock;
  end;
end;



function TUserEngine.MakeItemToMap( DropMapName: string; ItemName: String; Amount: integer; dx, dy:integer ):integer;
var
   ps: TItem;
   newpu: PTUserItem;
   pmi, pr: PTMapItem;
   iTemp: integer;
   dropenvir : TEnvirnoment;
begin
   result := 0;

   if ItemName = sSTRING_GOLDNAME then begin
      ItemName := sSTRING_GOLDNAME{'����'};
      Amount := Random( ( Amount div 2 ) +1 ) + ( Amount div 2 );
   end;

   try
      /////////////////////////////////////////////
      //MakeItemToMap
      ps := GetStdItem ( ItemName );

      if ps <> nil then begin
         new (newpu);
         if CopyToUserItemFromName(ps.Name, newpu) then begin
            new (pmi);
            pmi.UserItem := newpu^;

            if ItemName = sSTRING_GOLDNAME{'����'} then begin
               pmi.Name := sSTRING_GOLDNAME{'����'};
               pmi.Count := Amount;
               pmi.Looks := GetGoldShape (Amount);
               pmi.OfBaseObject := nil;
               pmi.dwCanPickUpTick := GetTickCount;
               pmi.DropBaseObject := nil;
               MainOutMessage( '[�����] ');
            end else begin
               // ī��Ʈ ������
               if (ps.StdMode in [0,1,3,45,46]) then begin
                  iTemp := newpu.Amount;
                  if iTemp > 1 then
                     pmi.Name := ps.Name + '(' + IntToStr(iTemp) + ')'  // gadget :ī���;�����
                  else
                     pmi.Name := ps.Name;
               end else
                  pmi.Name := ps.Name;

               pmi.Looks := ps.Looks;
               if ps.StdMode = 45 then begin  //�ֻ���, ����
                  pmi.Looks := GetRandomLook (pmi.Looks, ps.Shape);
               end;
               pmi.AniCount := ps.AniCount;
               pmi.Reserved := 0;
               pmi.Grade := ps.Grade;
               pmi.Count := 1;
               pmi.OfBaseObject := nil;
               pmi.dwCanPickUpTick := GetTickCount;
               pmi.DropBaseObject := nil;
            end;

            dropenvir := g_MapManager.FindMap( DropMapName );
            pr := dropenvir.AddToMap (dx, dy, OS_ITEMOBJECT, TObject(pmi));
            if pr = pmi then begin
               // ������� MakeIndex;
               result := pmi.useritem.MakeIndex ;
            end else begin
               //�����ΰ��
               Dispose (pmi);
            end;
         end;

         if newpu <> nil then Dispose( newpu );   // Memory Leak sonmg
      end;
      /////////////////////////////////////////////
   except
      MainOutMessage( '[Exception] TUserEngine.MakeItemToMap' );
   end;
end;

initialization
begin
  {---- Adjust global SVN revision ----}
  //SVNRevision('$Id: UsrEngn.pas 596 2007-04-11 00:14:13Z sean $');
end;
finalization
begin

end;

end.
