unit ObjNpc;

interface
uses
  {svn,} Windows, Classes, SysUtils, StrUtils, DateUtils, ObjBase,Grobal2,SDK,IniFiles;
const
  CMD_RACE_0 = 0; //self
  CMD_RACE_1 = 1; //hero
  CMD_RACE_2 = 2; //Master
  CMD_RACE_3 = 3; //mon
  CMD_RACE_4 = 4; //obj
  CMD_RACE_5 = 5;
  CMD_RACE_6 = 6;
  CMD_RACE_7 = 7;
  CMD_RACE_8 = 8;
  CMD_RACE_9 = 9;
type
  TNormNpc = class;
  TUpgradeInfo = record //0x40
    sUserName    :String[ActorNameLen];//0x00
    UserItem     :TUserItem; //0x10
    btDc         :Byte;      //0x28
    btSc         :Byte;      //0x29
    btMc         :Byte;      //0x2A
    btDura       :Byte;      //0x2B
    n2C          :Integer;
    dtTime       :TDateTime; //0x30
    dwGetBackTick:LongWord;  //0x38
    n3C          :Integer;
  end;
  pTUpgradeInfo = ^TUpgradeInfo;
  TItemPrice = Record
    wIndex  :Word;
    nPrice  :Integer;
    nAmount :Integer; //拱距
  end;
  pTItemPrice = ^TItemPrice;

  TGoods = record  //0x1C
    sItemName       :String[22];
    nCount          :Integer;
    dwRefillTime    :LongWord;
    dwRefillTick    :LongWord;
    xCount          :Integer;
  end;
  pTGoods = ^TGoods;

  TMakeItems = record
    nAmount :Integer;
    nDuras :Integer;
  end;
  PTMakeItems = ^TMakeItems; //拱距

  TScriptObject = class
  private
    ScriptList: array of string;
    ScriptCmd: array of Integer;
  public
    procedure Clear;
    function Cmd(sCmd: string): string;
    function GetActorObject(NPC: TNormNpc; PlayObject: TPlayObject): TBaseObject;
  end;


  TQuestActionInfo = record  //0x1C
    nCmdCode    :Integer;  //0x00
    sParam1     :String;   //0x04
    nParam1     :Integer;  //0x08
    sParam2     :String;   //0x0C
    nParam2     :Integer;  //0x10
    sParam3     :String;   //0x14
    nParam3     :Integer;  //0x18
    sParam4     :String;
    nParam4     :Integer;
    sParam5     :String;
    nParam5     :Integer;
    sParam6     :String;
    nParam6     :Integer;
    Script: TScriptObject;
  end;
  pTQuestActionInfo = ^TQuestActionInfo;
  TQuestConditionInfo = record //0x14
    nCmdCode    :Integer; //0x00
    sParam1     :String;  //0x04
    nParam1     :Integer; //0x08
    sParam2     :String;  //0x0C
    nParam2     :Integer; //0x10
    sParam3     :String;
    nParam3     :Integer;
    sParam4     :String;
    nParam4     :Integer;
    sParam5     :String;
    nParam5     :Integer;
    sParam6     :String;
    nParam6     :Integer;
    Script: TScriptObject;
  end;
  pTQuestConditionInfo = ^TQuestConditionInfo;
  TSayingProcedure = record //0x14
    ConditionList  :TList;  //0x00
    ActionList     :TList;  //0x04
    sSayMsg        :String; //0x08
    ElseActionList :TList;  //0x0C
    sElseSayMsg    :String; //0x10
  end;
  pTSayingProcedure = ^TSayingProcedure;
  TSayingRecord = record //0x08
    sLabel           :String;
    ProcedureList    :TList; //0x04
    boExtJmp         :boolean; //是否允许外部跳转    
  end;
  pTSayingRecord = ^TSayingRecord;

  TTimeLabel = record
    nType: Integer;
    nIndex: Integer;
    sLabel: string;
    dwTick: LongWord;
    dwTime: LongWord;
    boChangeMapDelete: Boolean;
    boDelete: Boolean;
    Npc: TNormNpc;
    Envir: TObject;
  end;
  pTTimeLabel = ^TTimeLabel;
  TNormNpc = class(TAnimalObject) //0x564
    m_NpcType     :TNpcType;
    n54C          :Integer;  //0x54C
    m_nFlag       :ShortInt;  //0x550 //用于标识此NPC是否有效，用于重新加载NPC列表(-1 为无效)
    m_ScriptList  :TList;    //0x554
    m_sFilePath   :String;   //0x558 脚本文件所在目录
    m_boIsHide    :Boolean;  //0x55C 此NPC是否是隐藏的，不显示在地图中
    m_boIsQuest   :Boolean;  //0x55D NPC类型为地图任务型的，加载脚本时的脚本文件名为 角色名-地图号.txt
    m_sPath       :String;  //0x560

  private
    procedure ScriptActionError(PlayObject:TPlayObject;sErrMsg:String;QuestActionInfo:pTQuestActionInfo;sCmd:String);
    procedure ScriptConditionError(PlayObject:TPlayObject;QuestConditionInfo: pTQuestConditionInfo;sCmd:String);

    procedure ExeAction(PlayObject:TPlayObject;sParam1,sParam2,sParam3:String;nParam1,nParam2,nParam3:Integer);
    procedure ActionOfChangeLevel(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfGiveItem(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfGiveOptionItem(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfClearSkill(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfDelNoJobSkill(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfDelSkill(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfAddSkill(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfAddHeroSkill(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfSkillLevel(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfChangePkPoint(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfChangeExp(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);

    procedure ActionOfChangeJob(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfChangeJobUp(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);   //殿急 函券
    procedure ActionOfRecallGroupMembers(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfClearNameList(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfMapTing(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfMission(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfMobPlace(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo;nX,nY,nCount,nRange:Integer);

    procedure ActionOfGameGold(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfGamePoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfChangePcPoint(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);

    procedure ActionOfAutoAddGameGold(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo;nPoint,nTime:integer);
    procedure ActionOfAutoSubGameGold(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo;nPoint,nTime:integer);
    procedure ActionOfChangeHairStyle(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfLineMsg(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfChangeNameColor(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfClearPassword(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfReNewLevel(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfChangeGender(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfKillSlave(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfKillMonExpRate(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfBeginnerExpRate(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo);
    procedure ActionOfMasterExpRate(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo); //荤力 版摹
    procedure ActionOfTempPowerUp(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo); //袍颇况诀
    procedure ActionOfHealing(PlayObject:TPlayObject;QuestActionInfo:pTQuestActionInfo); //NPC 鳃傅
    procedure ActionOfSnow(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);       //传坷绰捞棋
    procedure ActionOfFlower(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfPowerRate(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfChangeMode(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfChangePerMission(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfKill(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfKick(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfBonusPoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfRestReNewLevel(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);

    procedure ActionOfLock(BaseObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfUnLock(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfClearDuelMap(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGetDuelItems(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);

    procedure ActionOfClearNeedItems(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfClearMakeItems(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfUpgradeItems(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfUpgradeItemsEx(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfMonGenEx(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfClearMapMon(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);

    procedure ActionOfSetMapMode(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfPkZone(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfRestBonusPoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfTakeCastleGold(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfHumanHP(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfHumanMP(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildMode(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildBuildPoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildAuraePoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildstabilityPoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildFlourishPoint(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfOpenMagicBox(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfSetRankLevelName(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGmExecute(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGuildChiefItemCount(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfAddNameDateList(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfDelNameDateList(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfMobFireBurn(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfMessageBox(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfSetScriptFlag(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfAutoGetExp(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfRecallmob(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfVar(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfLoadVar(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfSaveVar(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfCalcVar(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);

    procedure ActionOfGuildRecall(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGroupAddList(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfClearList(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGroupRecall(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfGroupMoveMap(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfAddGuild(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);      //檬焊巩颇
    procedure ActionOfRankName(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);

    procedure ActionOfChangeItem(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);    //殿急酒捞袍栏肺 函券 (函券芒)
    procedure ActionOfChangeUpItem(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfAccChangeItem(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);  //厘脚备函券
    procedure ActionOfDeleteHero(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
    procedure ActionOfRockPapers(PlayObject: TPlayObject;QuestActionInfo: pTQuestActionInfo);  //啊困官困焊

    function  ConditionOfCheckGroupCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;     //弊缝盔 牢盔荐 眉农
    function  ConditionOfCheckGroupNearby(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckPoseDir(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckPoseLevel(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckPoseGender(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;

    function  ConditionOfCheckColumn(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;     //全焊窜
    function  ConditionOfCheckLevelEx(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckSlaveCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckBonusPoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckAccountIPList(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckNameIPList(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;



    function  ConditionOfCheckHaveGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckIsGuildMaster(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckIsCastleaGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleaGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleaMasterGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;

    function  ConditionOfCastleMasterKing(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckIsCastleMaster(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckGameGold(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckGamePoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckNameListPostion(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckReNewLevel(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckSlaveLevel(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckSlaveName(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;

    function  ConditionOfCheckMasterUseExp(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;      //荤力 版摹

    function  ConditionOfCheckPcPoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckOfGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckOfGuildCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;    //檬焊巩颇
    function  ConditionOfCheckPayMent(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckUseItem(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckBagSize(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckListCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckDC(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckMC(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckSC(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckHP(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckMP(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckItemType(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckExp(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleGold(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckPasswordErrorCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfIsLockPassword(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfIsLockStorage(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;

    function  ConditionOfCheckGuildMode(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;

    function  ConditionOfCheckGuildBuildPoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckGuildAuraePoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckStabilityPoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckFlourishPoint(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckRangeMonCount(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckItemAddValue(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckInMapRange(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckIsDefenseGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckAttackWarGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckDefenseWarGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleArea(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleDoorStatus(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckIsDefenseAllyGuild(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleChageDay(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckCastleWarDay(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckOnlineLongMin(PlayObject:TPlayObject;QuestConditionInfo:pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckChiefItemCount(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckNameDateList(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckMapHumanCount(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckMapMonCount(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckVar(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckServerName(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckMap(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckPos(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfReviveSlave(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckHasMagic(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
    function  ConditionOfCheckMagicLvl(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckHasHorse(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckOnHorse(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckGroupClass(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfRandomEx(PlayObject: TPlayObject;QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function  ConditionOfCheckSafeZone(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo): Boolean;
    function GetDynamicVarList(PlayObject: TPlayObject;sType:String;var sName:String):TList;
    procedure ActionOfSaveSlaves(PlayObject: TPlayObject;  QuestActionInfo: pTQuestActionInfo);

    function ConditionOfCheckHasHero(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo): Boolean;  //康旷捞 乐绰瘤?

  public
    constructor Create();
    destructor Destroy; override;
    procedure Initialize();override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run; override; //FFFB
    procedure Click(PlayObject: TPlayObject);virtual; //FFEB
    procedure UserSelect(PlayObject:TPlayObject;sData:String);virtual; //FFEA
    procedure GetVariableText(PlayObject:TPlayObject;var sMsg:String;sVariable:String);virtual; //FFE9
    function  GetLineVariableText(PlayObject:TPlayObject;sMsg:String):String;
    procedure GotoLable(AObject: TPlayObject;sLabel:String;boExtJmp:Boolean);
    function  sub_49ADB8(sMsg,sStr,sText:String):String;
    procedure LoadNPCScript();
    procedure ClearScript();virtual;
    procedure SendMsgToUser(PlayObject:TPlayObject;sMsg:String);
    procedure SendCustemMsg(PlayObject:TPlayObject;sMsg:String);virtual;
    procedure SendCustemMsg2(PlayObject:TPlayObject;sMsg:String);virtual;
  end;
  TMerchant = class(TNormNpc) //0x594
    m_sScript         :String;  //0x568
    n56C              :Integer;
    m_nPriceRate      :Integer; //0x570   物品价格倍率 默认为 100%
    bo574             :Boolean;
    m_boCastle        :Boolean; //0x575    //己俊辑 包府窍绰 惑痢 (荤合己捞 茄俺 乐阑 版快俊 秦寸凳)
    dwRefillGoodsTick :LongWord; //0x578
    dwClearExpreUpgradeTick         :LongWord; //0x57C
    m_ItemTypeList    :TList;   //0x580  NPC买卖物品类型列表，脚本中前面的 +1 +30 之类的
    m_RefillGoodsList :TList;   //0x584
    m_GoodsList       :TList;   //0x588
    m_ItemPriceList   :TList;  //0x58C
    //m_QuestsList      :TList;
    m_UpgradeWeaponList :TList;
    m_boCanMove         :Boolean;
    m_dwMoveTime        :LongWord;
    m_dwMoveTick        :LongWord;
    m_boBuy             :Boolean;
    m_boSell            :Boolean;
    m_boLockUp: Boolean;
    m_boWakeUp  :Boolean;
    m_boMakeNewHero: Boolean;
    m_boWake: Boolean;
    m_boReStore: Boolean;
    m_boDisassemble     :Boolean;       //阿己盒秦
    m_boDismantle       :Boolean;       //老馆盒秦
    m_boMakeDrug        :Boolean;
    m_boMakeGem         :Boolean;
    m_boPrices          :Boolean;
    m_boStorage         :Boolean;   //芒绊
    m_boComStoragement  :Boolean;   //傍侩芒绊
    m_boGuildStoragement:Boolean;   //巩颇芒绊
    m_boUpgradenow      :Boolean;
    m_boCheckWeapon     :Boolean;   //力访 犬牢
    m_boGetBackupgnow   :Boolean;
    m_boRepair          :Boolean;
    m_boS_repair        :Boolean;
    m_boSendmsg         :Boolean;
    m_boSendmsg2        :Boolean;
    m_boUseItemName     :Boolean;
    CreateIndex         :integer;   //积己瞪 锭 鉴瞒利栏肺 何咯登绰 Index(何窍 盒魂俊 捞侩茄促).
  private
    procedure ClearExpreUpgradeListData();
    function GetItemPrice(nIndex:Integer): Integer;
    function GetUserPrice(PlayObject:TPlayObject;nPrice: Integer): Integer;
    function CheckItemType(nStdMode: Integer): Boolean;
    procedure CheckItemPrice(nIndex,xIndex: Integer); //惑牢
     function  GetRefillList(nIndex,xIndex: Integer): TList;    //惑牢
    procedure AddItemPrice(nIndex,xIndex, nPrice: Integer); //惑牢
    function GetUserItemPrice(UserItem: pTUserItem): Integer;
    function GetSellItemPrice(nPrice:integer):Integer;
    procedure GetBackupgWeapon(User: TPlayObject);  //力访
    procedure ChangeUseItemName(PlayObject:TPlayObject;sLabel,sItemName:String);
    procedure SaveUpgradingList;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;
    procedure Run;override;
    procedure UserSelect(PlayObject:TPlayObject;sData:String);override;
    procedure LoadNPCData();
    procedure SaveNPCData();
    procedure LoadUpgradeList();
    procedure RefillGoods();
    procedure LoadNPCScript();
    procedure Click(PlayObject: TPlayObject);override;
    procedure ClearScript();override;
    procedure ClearData();
    procedure GetVariableText(PlayObject:TPlayObject;var sMsg:String;sVariable:String);override; //FFE9
    procedure UpgradeWapon(User: TPlayObject;nMakeIndex:Integer;Data:string);    //犁访
    procedure ClientBuyItem(PlayObject:TPlayObject;sItemName:String;nInt,aint:Integer);    //惑牢
    procedure ClientPBuyItem(PlayObject:TPlayObject;sItemName:String;nInt,aint:Integer);
    procedure ClientQuerySellPrice(PlayObject:TPlayObject;UserItem:pTUserItem);  //惑牢
    function  ClientSellItem(PlayObject:TPlayObject;UserItem:pTUserItem):Boolean;
    function  ClientItemLock(PlayObject: TPlayObject; UserItem: pTUserItem): Boolean;
    function ClientItemWake(PlayObject: TPlayObject; UserItem: pTUserItem): Boolean;
    function ClientItemReStore(PlayObject: TPlayObject; UserItem: pTUserItem): Boolean;
    procedure UserPriceDisassemble(PlayObject:TPlayObject;UserItem:pTUserItem);         //阿己盒秦
    function  UserDisassembleItem(PlayObject:TPlayObject;UserItem:pTUserItem):Boolean;    //阿己盒秦

    procedure UserPriceDismantle(PlayObject:TPlayObject;UserItem:pTUserItem);          //老馆盒秦
    function  UserDismantleItem(PlayObject:TPlayObject;UserItem:pTUserItem):Boolean;    //老馆盒秦

    procedure SayMakeItemMaterials (whocret: TPlayObject; selstr: string);  //力炼胶媚
    procedure UserManufactureItem (whocret: TPlayObject; itmname: string);         //力炼胶媚
    function CheckMakeItemCondition (hum: TPlayObject; itemname: string; sItemMakeIndex, sItemName, sItemCount: array of string; var iPrice, iMakeCount: Integer): Integer;    //力炼胶媚
    function GetGradeOfGuardStoneByName ( strGuardStone: string ): Integer;    //力炼胶媚
    procedure ClientQueryRepairCost(PlayObject:TPlayObject;UserItem:pTUserItem);
    procedure ClientQueryWakeCost(PlayObject: TPlayObject; UserItem: pTUserItem);
    procedure ClientQueryWakeReStore(PlayObject: TPlayObject; UserItem: pTUserItem);
    function  ClientRepairItem(PlayObject:TPlayObject;UserItem:pTUserItem):Boolean;
    function  ClientCheckWeapon(PlayObject:TPlayObject;UserItem:pTUserItem):Boolean;   //力访犬牢
    procedure ClientRequestGTList(PlayObject:TPlayObject;PageCount:byte);
    procedure ClientDeleteBBSMsg(PlayObject:TPlayObject;Index:integer);       //厘盔霸矫魄
    procedure ClientRequestDecoList(PlayObject:TPlayObject;PageCount:byte);
    procedure ClientBuyGT(PlayObject:TPlayObject;GTNumber:byte);
    procedure ClientBuyDecoItem(PlayObject:TPlayObject;Appr:integer);
    procedure ClientRequestBBSMsgList(PlayObject:TPlayObject;Pagecount:byte);   //厘盔霸矫魄
    procedure ClientRequestBBSMsg(PlayObject:TPlayObject;Index:integer);     //厘盔霸矫魄
    procedure ClientPostBBSMsg(PlayObject:TPlayObject;sMsg:String;boSticky:boolean; MasterPost:integer);   //厘盔霸矫魄
    procedure SendCustemMsg(PlayObject:TPlayObject;sMsg:String);override;
    procedure SendCustemMsg2(PlayObject:TPlayObject;sMsg:String);override;
  end;
  TGuildOfficial = class(TNormNpc) //0x568
  private
    function ReQuestBuildGuild(PlayObject: TPlayObject;
      sGuildName: String): Integer;
    function ReQuestGuildWar(PlayObject: TPlayObject;
      sGuildName: String): Integer;
    procedure DoNate(PlayObject: TPlayObject);
  public
    constructor Create();
    destructor Destroy; override;
    procedure GetVariableText(PlayObject:TPlayObject;var sMsg:String;sVariable:String);override; //FFE9    
    procedure Run;override; //FFFB
    procedure Click(PlayObject: TPlayObject);override; //FFEB
    procedure UserSelect(PlayObject:TPlayObject;sData:String);override; //FFEA
    procedure SendCustemMsg(PlayObject:TPlayObject;sMsg:String);override;
    procedure SendCustemMsg2(PlayObject:TPlayObject;sMsg:String);override;
  end;
  TTrainer = class(TNormNpc) //0x574
    n564    :Integer;
    strucktime    :LongWord;
    n56C    :Integer;
    n570    :Integer;
  private
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run;override;    
  end;
//  TCastleManager = class(TMerchant)
  TCastleOfficial = class(TMerchant)
  private
    procedure HireArcher(sIndex: String;PlayObject:TPlayObject);
    procedure HireGuard(sIndex: String;PlayObject:TPlayObject);
    procedure RepairDoor(PlayObject: TPlayObject);
    procedure RepairFirstDoor(PlayObject: TPlayObject);
    procedure RepairSecondDoor(PlayObject: TPlayObject);
    procedure RepairWallNow(nWallIndex:Integer;PlayObject:TPlayObject);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Click(PlayObject: TPlayObject);override; //FFEB
    procedure UserSelect(PlayObject:TPlayObject;sData:String);override; //FFEA
    procedure GetVariableText(PlayObject:TPlayObject;var sMsg:String;sVariable:String);override; //FFE9
    procedure SendCustemMsg(PlayObject:TPlayObject;sMsg:String);override;
    procedure SendCustemMsg2(PlayObject:TPlayObject;sMsg:String);override;
  end;
implementation

uses Castle, M2Share, HUtil32, LocalDB, Envir, Guild, EDcode, ObjMon2, ObjHero,
  Event, ItmUnit, GuildTerritory;


//===============================TQuestConditionInfo============================

procedure TScriptObject.Clear;
begin
  SetLength(ScriptCmd, 0);
  SetLength(ScriptList, 0);
end;

function TScriptObject.GetActorObject(NPC: TNormNpc; PlayObject: TPlayObject): TBaseObject;
var
  I: Integer;
  sCharName: string;
  OnlineUser: TPlayObject;
  ActorObject: TBaseObject;
  sVar1, sValue1: string;
  nValue1: Integer;
  VarInfo1: TVarInfo;
begin
  if Length(ScriptCmd) <= 1 then begin
    Result := PlayObject;
  end else begin
    ActorObject := PlayObject;
    for I := 0 to Length(ScriptCmd) - 1 do begin
      case ScriptCmd[I] of
        CMD_RACE_0: begin //self
            ActorObject := PlayObject;
          end;
        CMD_RACE_1: begin //hero
            if (ActorObject <> nil) and (ActorObject.m_btRaceServer = RC_PLAYOBJECT) then begin
              ActorObject := TPlayObject(ActorObject).m_MyHero;
            end else begin
              ActorObject := nil;
              Break;
            end;
          end;
        {CMD_RACE_2: begin //Master
            if (ActorObject <> nil) then begin
              ActorObject := ActorObject.m_Master;
            end else begin
              ActorObject := nil;
              Break;
            end;
          end;
        CMD_RACE_3: begin //mon
            if (ActorObject <> nil) then begin
              ActorObject := ActorObject.m_KillTargetCret;
            end else begin
              ActorObject := nil;
              Break;
            end;
          end;
        CMD_RACE_4: begin //obj
            if (ActorObject <> nil) then begin
              if (ActorObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                VarInfo1 := NPC.GetVarValue(TPlayObject(ActorObject), ScriptList[I], sVar1, sValue1, nValue1);
                sCharName := sValue1;
              end else sCharName := ScriptList[I];
              //if not NPC.GetValValue(ActorObject, ScriptList[I], sCharName) then sCharName := ScriptList[I];
              ActorObject := UserEngine.GetPlayObject(sCharName);
            end else begin
              ActorObject := nil;
              Break;
            end;
          end;    }
      else break;
      end;
    end;
    Result := ActorObject;
  end;
end;

function TScriptObject.Cmd(sCmd: string): string;
var
  TempList: TStringList;
  sCheckType: string;
  I: Integer;
begin
  SetLength(ScriptCmd, 0);
  SetLength(ScriptList, 0);
  Result := sCmd;
  if Pos('.', sCmd) > 0 then begin
    TempList := TStringList.Create;
    ExtractStrings(['.'], [], PChar(sCmd), TempList);
    Result := UpperCase(Trim(TempList.Strings[TempList.Count - 1]));
    TempList.Delete(TempList.Count - 1);
    TempList.Strings[0] := UpperCase(Trim(TempList.Strings[0]));
    if TempList.Strings[0] <> 'SELF' then TempList.Insert(0, 'SELF');
    SetLength(ScriptCmd, TempList.Count);
    SetLength(ScriptList, TempList.Count);
    for I := 0 to TempList.Count - 1 do begin
      if UpperCase(Trim(TempList.Strings[I])) = 'SELF' then begin
        ScriptCmd[I] := CMD_RACE_0;
      end else begin
        if UpperCase(Trim(TempList.Strings[I])) = 'HERO' then begin
          ScriptCmd[I] := CMD_RACE_1;
      {end else
        if UpperCase(Trim(TempList.Strings[I])) = 'MASTER' then begin
        ScriptCmd[I] := CMD_RACE_2;
      end else
        if UpperCase(Trim(TempList.Strings[I])) = 'MON' then begin
        ScriptCmd[I] := CMD_RACE_3;
      end else begin
        ScriptCmd[I] := CMD_RACE_4;    }
        end;
      end;
      ScriptList[I] := UpperCase(Trim(TempList.Strings[I]));
    end;
    TempList.Free;
  end else begin
    SetLength(ScriptCmd, 1);
    ScriptCmd[0] := CMD_RACE_0;
  end;
end;



procedure TCastleOfficial.Click(PlayObject: TPlayObject); //004A4588
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC error: no castle found',c_Red,t_Hint);
    exit;
  end;
  if TUserCastle(m_Castle).IsMasterGuild(TGUild(PlayObject.m_MyGuild)) or (PlayObject.m_btPermission >= 3)then
    inherited Click(PlayObject);
end;

procedure TCastleOfficial.GetVariableText(PlayObject: TPlayObject;
  var sMsg: String; sVariable: String);
var
  sText:String;
  CastleDoor:TCastleDoor;
  NammanCastleDoor:TNammanCastleDoor;
  NammanCastleDoor2:TNammanCastleDoor2;
begin
  inherited;
  if m_Castle = nil then begin
    sMsg:='????';
    exit;
  end;
  if sVariable = '$CASTLEGOLD' then begin
    sText:=IntToStr(TUserCastle(m_Castle).m_nTotalGold);
    sMsg:=sub_49ADB8(sMsg,'<$CASTLEGOLD>',sText);
  end else
  if sVariable = '$TODAYINCOME' then begin
    sText:=IntToStr(TUserCastle(m_Castle).m_nTodayIncome);
    sMsg:=sub_49ADB8(sMsg,'<$TODAYINCOME>',sText);
  end else
  if sVariable = '$CASTLEDOORSTATE' then begin
    CastleDoor:=TCastleDoor(TUserCastle(m_Castle).m_MainDoor.BaseObject);
    if CastleDoor.m_boDeath then sText:='被打破了'
    else if CastleDoor.m_boOpened then sText:='打开'
    else sText:='关闭';
    sMsg:=sub_49ADB8(sMsg,'<$CASTLEDOORSTATE>',sText);
  end else

  if sVariable = '$CASTLEFDOORSTATE' then begin
    NammanCastleDoor:=TNammanCastleDoor(TUserCastle(m_Castle).m_FirstDoor.BaseObject);
    if NammanCastleDoor.m_boDeath then sText:='被打破了'
    else if NammanCastleDoor.m_boOpened then sText:='打开'
    else sText:='关闭';
    sMsg:=sub_49ADB8(sMsg,'<$CASTLEFDOORSTATE>',sText);
  end else

  if sVariable = '$CASTLESDOORSTATE' then begin
    NammanCastleDoor2:=TNammanCastleDoor2(TUserCastle(m_Castle).m_SecondDoor.BaseObject);
    if NammanCastleDoor2.m_boDeath then sText:='被打破了'
    else if NammanCastleDoor2.m_boOpened then sText:='打开'
    else sText:='关闭';
    sMsg:=sub_49ADB8(sMsg,'<$CASTLESDOORSTATE>',sText);
  end else

  if sVariable = '$REPAIRDOORGOLD' then begin
    sText:=IntToStr(g_Config.nRepairDoorPrice);
    sMsg:=sub_49ADB8(sMsg,'<$REPAIRDOORGOLD>',sText);
  end else
  if sVariable = '$REPAIRWALLGOLD' then begin
    sText:=IntToStr(g_Config.nRepairWallPrice);
    sMsg:=sub_49ADB8(sMsg,'<$REPAIRWALLGOLD>',sText);
  end else
  if sVariable = '$GUARDFEE' then begin
    sText:=GetGoldStr(g_Config.nHireGuardPrice);
    sMsg:=sub_49ADB8(sMsg,'<$GUARDFEE>',sText);
  end else
  if sVariable = '$ARCHERFEE' then begin
    sText:=GetGoldStr(g_Config.nHireArcherPrice);
    sMsg:=sub_49ADB8(sMsg,'<$ARCHERFEE>',sText);
  end else
  if sVariable = '$GUARDRULE' then begin
    sText:='无效';
    sMsg:=sub_49ADB8(sMsg,'<$GUARDRULE>',sText);
  end;

end;
procedure TCastleOfficial.UserSelect(PlayObject: TPlayObject; sData: String);
var
  s18,s20,sMsg,sLabel:String;
  boCanJmp:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TCastleManager::UserSelect... ';
begin
  inherited;
  try
    PlayObject.m_nScriptGotoCount:=0;
    if m_Castle = nil then begin
      PlayObject.SysMsg('This Npc is not standing inside any Castle',c_Red,t_Hint);
      exit;
    end;
    if (sData <> '') and (sData[1] = '@') then begin
      sMsg:=GetValidStr3(sData,sLabel,[#13]);
      s18:='';
      PlayObject.m_sScriptLable:=sData;
      if TUserCastle(m_Castle).IsMasterGuild(TGUild(PlayObject.m_MyGuild)) and (PlayObject.IsGuildMaster) then begin
        boCanJmp:= PlayObject.LableIsCanJmp(sLabel);
        if CompareText(sLabel,sSL_SENDMSG) = 0 then begin
          if sMsg = '' then exit;
        end;
        if CompareText(sLabel,sSL_SENDMSG2) = 0 then begin
          if sMsg = '' then exit;
        end;
        GotoLable(PlayObject,sLabel,not boCanJmp);
        //GotoLable(PlayObject,sLabel,not PlayObject.LableIsCanJmp(sLabel));
        if not boCanJmp then exit;
        if CompareText(sLabel,sSL_SENDMSG) = 0 then begin
          SendCustemMsg(PlayObject,sMsg);
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
        end else
        if CompareText(sLabel,sSL_SENDMSG2) = 0 then begin
          SendCustemMsg2(PlayObject,sMsg);
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
        end else
        if CompareText(sLabel,sCASTLENAME) = 0 then begin
          sMsg:=Trim(sMsg);
          if sMsg <> '' then begin
            TUserCastle(m_Castle).m_sName:=sMsg;
            TUserCastle(m_Castle).Save;
            TUserCastle(m_Castle).m_MasterGuild.RefMemberName;
            s18:='名字已经改变...';
          end else begin
            s18:='你还没有输入新的名字';
          end;
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
        end else
        if CompareText(sLabel,sWITHDRAWAL) = 0 then begin
          case TUserCastle(m_Castle).WithDrawalGolds(PlayObject,Str_ToInt(sMsg,0)) of
            -4: s18:='你输入的数值错误，请检查并重新输入。';
            -3: s18:='你无法携带更多的金币。';
            -2: s18:='城堡内没有足够的金币。';
            -1: s18:= TUserCastle(m_Castle).m_sOwnGuild + '的城主才可以使用。';
            1: GotoLable(PlayObject,sMAIN,False);
          end;
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
        end else
        if CompareText(sLabel,sRECEIPTS) = 0 then begin
          case TUserCastle(m_Castle).ReceiptGolds(PlayObject,Str_ToInt(sMsg,0)) of
            -4: s18:='你输入的数值错误，请检查并重新输入。';
            -3: s18:='金币的数量超过了城堡允许的最大限度。';
            -2: s18:='你没有足够的金币。';
            -1: s18:= TUserCastle(m_Castle).m_sOwnGuild + '的城主才可以使用。';
            1: GotoLable(PlayObject,sMAIN,False);
          end;
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
        end else
        if CompareText(sLabel,sOPENMAINDOOR) = 0 then begin
          TUserCastle(m_Castle).MainDoorControl(False);     //荤合 沥巩
        end else
        if CompareText(sLabel,sCLOSEMAINDOOR) = 0 then begin
          TUserCastle(m_Castle).MainDoorControl(True);        //荤合 沥巩
        end else

        if CompareText(sLabel,sOPENFIRSTDOOR) = 0 then begin
          TUserCastle(m_Castle).FirstDoorControl(False);     //荤合 沥巩
        end else
        if CompareText(sLabel,sCLOSEFIRSTDOOR) = 0 then begin
          TUserCastle(m_Castle).FirstDoorControl(True);        //荤合 沥巩
        end else

        if CompareText(sLabel,sOPENSECONDDOOR) = 0 then begin
          TUserCastle(m_Castle).SecondDoorControl(False);     //荤合 沥巩
        end else
        if CompareText(sLabel,sCLOSESECONDDOOR) = 0 then begin
          TUserCastle(m_Castle).SecondDoorControl(True);        //荤合 沥巩
        end else

        if CompareText(sLabel,sREPAIRFDOORNOW) = 0 then begin
          RepairFirstDoor(PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareText(sLabel,sREPAIRSDOORNOW) = 0 then begin
          RepairSecondDoor(PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else


        if CompareText(sLabel,sREPAIRDOORNOW) = 0 then begin
          RepairDoor(PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareText(sLabel,sREPAIRWALLNOW1) = 0 then begin
          RepairWallNow(1,PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareText(sLabel,sREPAIRWALLNOW2) = 0 then begin
          RepairWallNow(2,PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareText(sLabel,sREPAIRWALLNOW3) = 0 then begin
          RepairWallNow(3,PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareText(sLabel,sREPAIRWALLNOW4) = 0 then begin
          RepairWallNow(4,PlayObject);
          GotoLable(PlayObject,sMAIN,False);
        end else
        if CompareLStr(sLabel,sHIREGUARDNOW,length(sHIREGUARDNOW)) then begin
          s20:=Copy(sLabel,length(sHIREGUARDNOW) + 1,length(sLabel));
          HireGuard(s20,PlayObject);
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'');
          //GotoLable(PlayObject,sHIREGUARDOK,False);
        end else
        if CompareLStr(sLabel,sHIREARCHERNOW,length(sHIREARCHERNOW)) then begin
          s20:=Copy(sLabel,length(sHIREARCHERNOW) + 1,length(sLabel));
          HireArcher(s20,PlayObject);
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'');
        end else
        if CompareText(sLabel,sEXIT) = 0 then begin
          PlayObject.SendMsg(Self,RM_MERCHANTDLGCLOSE,0,Integer(Self),0,0,'');
        end else
        if CompareText(sLabel,sBACK) = 0 then begin
          if PlayObject.m_sScriptGoBackLable = '' then PlayObject.m_sScriptGoBackLable:=sMAIN;
          GotoLable(PlayObject,PlayObject.m_sScriptGoBackLable,False);
        end;
      end else begin
        s18:='你没有足够的权限。';
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,s18);
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
//  inherited;

end;
procedure TCastleOfficial.HireGuard(sIndex:String;PlayObject:TPlayObject);//004A413C
var
  n10:Integer;
  ObjUnit:pTObjUnit;
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误:没有找到城堡信息。',c_Red,t_Hint);
    exit;
  end;
  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nHireGuardPrice then begin
    n10:=Str_ToInt(sIndex,0) - 1;
    if n10 <= MAXCALSTEGUARD then begin
      if TUserCastle(m_Castle).m_Guard[n10].BaseObject = nil then begin
        if not TUserCastle(m_Castle).m_boUnderWar then begin
          ObjUnit:=@TUserCastle(m_Castle).m_Guard[n10];
          ObjUnit.BaseObject:=UserEngine.RegenMonsterByName(TUserCastle(m_Castle).m_sMapName,
                                                          ObjUnit.nX,
                                                          ObjUnit.nY,
                                                          ObjUnit.sName);
          if ObjUnit.BaseObject <> nil then begin
            Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nHireGuardPrice);
            ObjUnit.BaseObject.m_Castle:=TUserCastle(m_Castle);
            TGuardUnit(ObjUnit.BaseObject).m_nX550:=ObjUnit.nX;
            TGuardUnit(ObjUnit.BaseObject).m_nY554:=ObjUnit.nY;
            TGuardUnit(ObjUnit.BaseObject).m_nDirection:=3;
            PlayObject.SysMsg('你雇佣了守卫。',c_Green,t_Hint);
          end;

        end else begin
          PlayObject.SysMsg('你现在不能雇佣守卫。',c_Red,t_Hint);
        end;
      end else begin
        PlayObject.SysMsg('当前位置已经存在守卫。',c_Red,t_Hint);
      end;
    end else begin
      PlayObject.SysMsg('此命令无效。',c_Red,t_Hint);
    end;
  end else begin
    PlayObject.SysMsg('城堡里没有足够的钱。',c_Red,t_Hint);
  end;
end;
procedure TCastleOfficial.HireArcher(sIndex:String;PlayObject:TPlayObject);//004A433C
var
  n10:Integer;
  ObjUnit:pTObjUnit;
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误: 己阑 茫阑荐 绝澜.',c_Red,t_Hint);
    exit;
  end;

  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nHireArcherPrice then begin
    n10:=Str_ToInt(sIndex,0) - 1;
    if n10 <= MAXCASTLEARCHER then begin
      if TUserCastle(m_Castle).m_Archer[n10].BaseObject = nil then begin
        if not TUserCastle(m_Castle).m_boUnderWar then begin
          ObjUnit:=@TUserCastle(m_Castle).m_Archer[n10];
          ObjUnit.BaseObject:=UserEngine.RegenMonsterByName(TUserCastle(m_Castle).m_sMapName,
                                                          ObjUnit.nX,
                                                          ObjUnit.nY,
                                                          ObjUnit.sName);
          if ObjUnit.BaseObject <> nil then begin
            Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nHireArcherPrice);
            ObjUnit.BaseObject.m_Castle:=TUserCastle(m_Castle);
            TGuardUnit(ObjUnit.BaseObject).m_nX550:=ObjUnit.nX;
            TGuardUnit(ObjUnit.BaseObject).m_nY554:=ObjUnit.nY;
            TGuardUnit(ObjUnit.BaseObject).m_nDirection:=3;
            PlayObject.SysMsg('你雇佣了弓箭手。',c_Green,t_Hint);
          end;

        end else begin
          PlayObject.SysMsg('你现在不能雇用弓箭手。',c_Red,t_Hint);
        end;
      end else begin
        PlayObject.SysMsg('当前位置已经存在弓箭手。',c_Red,t_Hint);
      end;
    end else begin
      PlayObject.SysMsg('此命令无效。',c_Red,t_Hint);
    end;
  end else begin
    PlayObject.SysMsg('城堡里没有足够的钱。',c_Red,t_Hint);
  end;
end;
{ TMerchant }

procedure TMerchant.AddItemPrice(nIndex,xIndex:Integer;nPrice:Integer); //惑牢
var
  ItemPrice:pTItemPrice;
begin
  New(ItemPrice);
  ItemPrice.wIndex:=nIndex*xIndex;
  ItemPrice.nPrice:=nPrice;
  ItemPrice.nAmount:=xIndex;
  m_ItemPriceList.Add(ItemPrice);
  FrmDB.SaveGoodPriceRecord(Self,m_sScript + '-' + m_sMapName);
end;
procedure TMerchant.CheckItemPrice(nIndex,xIndex:Integer); //惑牢
var
  I: Integer;
  ItemPrice:pTItemPrice;
  n10:Integer;
  StdItem:TItem;
begin
  for I := 0 to m_ItemPriceList.Count - 1 do begin
    ItemPrice:=m_ItemPriceList.Items[i];
    if (ItemPrice.wIndex = nIndex) and (ItemPrice.nAmount = xIndex) then begin
      n10:=ItemPrice.nPrice;
      if ROUND(n10 * 1.1) > n10 then begin
        n10:=ROUND(n10 * 1.1);
      end else Inc(n10);
      exit;
    end;
  end;    
  StdItem:=UserEngine.GetStdItem(nIndex);
  if StdItem <> nil then begin
    AddItemPrice(nIndex,xIndex,ROUND(StdItem.Price * 1.1));
  end;
end;
function TMerchant.GetRefillList(nIndex,xIndex:Integer):TList; //惑牢
var
  I: Integer;
  List:TList;
begin
  Result:=nil;
  if nIndex <= 0 then exit;
  for I := 0 to m_GoodsList.Count - 1 do begin
    List:=TList(m_GoodsList.Items[i]);
    if List.Count > 0 then begin
      if (pTUserItem(List.Items[0]).wIndex = nIndex) and (pTUserItem(List.Items[0]).Amount = xIndex) then begin
        Result:=List;
        Break;
      end;
    end;
  end;
end;

procedure TMerchant.RefillGoods;//惑牢
  procedure RefillItems(var List:TList;sItemName:String;iser,nInt:Integer); //0049F824
  var
    I: Integer;
    UserItem:pTUserItem;
  begin
    if List = nil then begin
      List:=TList.Create;
      m_GoodsList.Add(List);
    end;
    for I := 0 to nInt - 1 do begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sItemName,UserItem,iser) then begin
        List.Insert(0,UserItem);
      end else Dispose(UserItem);
    end;
  end;
  procedure DelReFillItem(var List:TList;nInt:Integer); //0049F8F8
  var
    I: Integer;
  begin
    for I := List.Count - 1 downto 0 do begin
      if nInt <= 0 then break;
      Dispose(pTUserItem(List.Items[i]));
      List.Delete(i);
      Dec(nInt);
    end;
  end;

var
  I,II: Integer;
  Goods:pTGoods;
  nIndex,nRefillCount:Integer;
  RefillList,RefillList20:TList;
  bo21:Boolean;
  nCheck:Integer;
ResourceString
  sExceptionMsg = '[Exception] TMerchant::RefillGoods %s/%d:%d [%s] Code:%d';
begin //0049F950
  try
    nCheck := 0;
    for I := 0 to m_RefillGoodsList.Count - 1 do begin
      Goods:=m_RefillGoodsList.Items[i];
      if Goods = nil then Continue; //拱距
      if (GetTickCount - Goods.dwRefillTick) > Goods.dwRefillTime * 60 * 1000 then begin
        Goods.dwRefillTick:=GetTickCount();
        nIndex:=UserEngine.GetStdItemIdx(Goods.sItemName);
        nCheck := 1;
        if nIndex >= 0 then begin
          RefillList:=GetRefillList(nIndex,Goods.xCount);
          nRefillCount:=0;
          nCheck := 2;
          if RefillList <> nil then nRefillCount:=RefillList.Count;
          nCheck := 3;
          if Goods.nCount > nRefillCount then begin
            nCheck := 4;
            CheckItemPrice(nIndex,Goods.xCount);  //拱距
            RefillItems(RefillList,Goods.sItemName,Goods.xCount,Goods.nCount - nRefillCount);
            FrmDB.SaveGoodRecord(Self,m_sScript + '-' + m_sMapName);
            FrmDB.SaveGoodPriceRecord(Self,m_sScript + '-' + m_sMapName);
          end;
          nCheck := 5;
          if Goods.nCount < nRefillCount then begin
            nCheck := 6;
            DelReFillItem(RefillList,nRefillCount - Goods.nCount);
            FrmDB.SaveGoodRecord(Self,m_sScript + '-' + m_sMapName);
            FrmDB.SaveGoodPriceRecord(Self,m_sScript + '-' + m_sMapName);
          end;
        end; //0049FB83
      end;
    end;
    for I := 0 to m_GoodsList.Count - 1 do begin
      RefillList20:=TList(m_GoodsList.Items[I]);
      if RefillList20.Count > 1000 then begin
        nCheck := 7;
        bo21:=False;
        for II := 0 to m_RefillGoodsList.Count - 1 do begin
          Goods:=m_RefillGoodsList.Items[II];
          nIndex:=UserEngine.GetStdItemIdx(Goods.sItemName);
          nCheck := 8;
          if pTItemPrice(RefillList20.Items[0]).wIndex = nIndex then begin
            bo21:=True;
            break;
          end;
        end;
        if not bo21 then begin
          nCheck := 9;
          DelReFillItem(RefillList20,RefillList20.Count - 1000);
        end else begin
          nCheck := 10;
          DelReFillItem(RefillList20,RefillList20.Count - 5000);
        end;
      end; //0049FC79
    end;
  except
    on e: Exception do
    MainOutMessage(format(sExceptionMsg,[m_sCharName,m_nCurrX,m_nCurrY,e.Message,nCheck]));
  end;
end;
function TMerchant.CheckItemType(nStdMode:Integer):Boolean; //0049F374
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to m_ItemTypeList.Count - 1 do begin
    if Integer(m_ItemTypeList.Items[i]) = nStdMode then begin
      Result:=True;
      break;
    end;      
  end;
end;
function TMerchant.GetItemPrice(nIndex:Integer):Integer; //0049F374
var
  I: Integer;
  ItemPrice:pTItemPrice;
  StdItem:TItem;
begin
  Result:= -1;
  for I := 0 to m_ItemPriceList.Count - 1 do begin
    ItemPrice:=m_ItemPriceList.Items[i];
    if (ItemPrice.wIndex = nIndex) and (ItemPrice.nAmount = 1) then begin    //拱距
      Result:=ItemPrice.nPrice;
      break;
    end;
  end;    // for
  if Result < 0 then begin
    StdItem:=UserEngine.GetStdItem(nIndex);
    if StdItem <> nil then begin
      if CheckItemType(StdItem.StdMode) then
        Result:=StdItem.Price;
    end;
  end;    
end;
procedure TMerchant.SaveUpgradingList(); //0049FF84
begin
  try
    //FrmDB.SaveUpgradeWeaponRecord(m_sCharName,m_UpgradeWeaponList);
    FrmDB.SaveUpgradeWeaponRecord(m_sScript + '-' + m_sMapName,m_UpgradeWeaponList);
  except
    MainOutMessage('Failure in saving upgradinglist - ' + m_sCharName);
  end;
end;


procedure TMerchant.UpgradeWapon(User: TPlayObject;nMakeIndex:Integer;Data:string); //004A0920 //炼制武器//犁访
  procedure sub_4A0218(ItemList,Uplisr:TList;var btDc:Byte;var btSc:Byte;var btMc:Byte;var btDura:Byte);
  var
    I,II: Integer;
    DuraList:TList;
    UserItem:pTUserItem;
    StdItem:TItem;
    StdItem80:TStdItem;
    DelItemList:TStringList;
    nDc,nSc,nMc,nDcMin,nDcMax,nScMin,nScMax,nMcMin,nMcMax,nDura,nItemCount:Integer;
  begin
    nDcMin:=0;
    nDcMax:=0;
    nScMin:=0;
    nScMax:=0;
    nMcMin:=0;
    nMcMax:=0;
    nDura:=0;
    nItemCount:=0;
    DelItemList:=nil;
    DuraList:=TList.Create;
    for I := ItemList.Count - 1 downto 0 do begin
      UserItem:=ItemList.Items[I];
      if UserItem = nil then Continue;
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if (StdItem <> nil) and (checkUPItemnameidx(Uplisr,StdItem.Name,UserItem.MakeIndex)) then begin   //犁访
       if StdItem.Name = g_Config.sBlackStone then begin //孺枚
         DuraList.Add(Pointer(ROUND(UserItem.Dura / 1.0e3))); //黑铁矿石品质列表?
         if DelItemList = nil then DelItemList:=TStringList.Create;
         DelItemList.AddObject(g_Config.sBlackStone,TObject(UserItem.MakeIndex)); //加到删除物品列表
         DisPose(UserItem);
         ItemList.Delete(I);  // 删除人物身上物品
       end else begin
         if IsAccessory(UserItem.wIndex) then begin  //厘脚备
          //StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
           if StdItem <> nil then begin
            StdItem.GetStandardItem(StdItem80);
            StdItem.GetItemAddValue(UserItem,StdItem80);
            nDc:=0;
            nSc:=0;
            nMc:=0;
            case StdItem80.StdMode of
              19,20,21: begin //004A0421
                nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC);
                nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC);
                nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC);
              end;
              22,23: begin //004A046E
                nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC);
                nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC);
                nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC);
              end;
              24,26: begin
                nDc:=HiWord(StdItem80.DC) + LoWord(StdItem80.DC) + 1;
                nSc:=HiWord(StdItem80.SC) + LoWord(StdItem80.SC) + 1;
                nMc:=HiWord(StdItem80.MC) + LoWord(StdItem80.MC) + 1;
              end;
            end;
            if nDcMin < nDc then begin
              nDcMax:=nDcMin;
              nDcMin:=nDc;
            end else begin
              if nDcMax < nDc then nDcMax:=nDc;
            end;
            if nScMin < nSc then begin
              nScMax:=nScMin;
              nScMin:=nSc;
            end else begin
              if nScMax < nSc then nScMax:=nSc;
            end;
            if nMcMin < nMc then begin
              nMcMax:=nMcMin;
              nMcMin:=nMc;
            end else begin
              if nMcMax < nMc then nMcMax:=nMc;
            end;
            if DelItemList = nil then DelItemList:=TStringList.Create;  //删除列表为空是创建
            DelItemList.AddObject(StdItem.Name,TObject(UserItem.MakeIndex));   //写入删除列表
            //004A06DB
            if StdItem.NeedIdentify = 1 then    //力访 犁丰
            AddGameDataLog('26' +  #9 +
                           User.m_sMapName + #9 +
                           IntToStr(User.m_nCurrX) + #9 +
                           IntToStr(User.m_nCurrY) + #9 +
                           User.m_sCharName + #9 +
                           StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                           IntToStr(UserItem.MakeIndex) + #9 +
                           '1' + #9 +
                           '0' + #9 + '[升级 材料 使用]');
            DisPose(UserItem);
            ItemList.Delete(I); //删除物品
           end;
         end;
       end;
      end;
    end;    // for
    for I := 0 to DuraList.Count - 1 do begin //黑铁矿石品质列表
      if DuraList.Count <= 0 then break;
      for II := DuraList.Count -1 downto i + 1 do begin
        if Integer(DuraList.Items[II]) > Integer(DuraList.Items[II- 1]) then
          DuraList.Exchange(II,II-1);
      end;    // for
    end;    // for
    for I := 0 to DuraList.Count - 1 do begin
      nDura:=nDura + Integer(DuraList.Items[I]);
      Inc(nItemCount);
      if nItemCount >= 5 then break;
    end;
    btDura:=ROUND(_MIN(5,nItemCount) + _MIN(5,nItemCount) * ((nDura /nItemCount) / 5.0));
    btDc:=nDcMin + nDcMin div 5 + nDcMax div 3;
    btSc:=nScMin + nScMin div 5 + nScMax div 3;
    btMc:=nMcMin + nMcMin div 5 + nMcMax div 3;
    if DelItemList <> nil then
      User.SendMsg(Self,RM_SENDDELITEMLIST,0,Integer(DelItemList),0,0,'');  //发送删除列表到客户端
    if DuraList <> nil then FreeAndNil(DuraList);
      
  end;
var
  I: Integer;
  bo0D:Boolean;
  UpgradeInfo:pTUpgradeInfo;
  UserItem:pTUserItem;
  StdItem:TItem;
  UpwaitemList:TList;
  s1,sItemName,sUserItemName:string;
  Upites:pTUpwaiItem;  //犁访
begin
  bo0D:=False;
  s1:='';
  sItemName:='';
  for I := 0 to m_UpgradeWeaponList.Count - 1 do begin  //甸绊 乐绰 公扁狼 诀弊饭捞靛甫 该变促.
    UpgradeInfo:=m_UpgradeWeaponList.Items[I];
    if UpgradeInfo = nil then Continue;
    if UpgradeInfo.sUserName = User.m_sCharName then begin
      GotoLable(User,sUPGRADEING,False);  //npc俊 夸没 捞固 力访吝捞促..
      User.SendMsg(User,RM_CORWAPONMG,0,0,0,0,'');              //犁访 阂啊
      exit;
    end;
  end;
  UpwaitemList:=TList.Create;       //犁访 犁丰 府胶飘
  for I := 0 to 15 do begin
    if Data <> '' then begin
      Data:=GetValidStr3(Data,s1,['/']);
      Data:=GetValidStr3(Data, sItemName, ['/']);

      if s1 <> '' then begin
        New(Upites);
        DecodeBuffer(s1, @(Upites^), sizeof(TUpwaiItem));
        UpwaitemList.Add(Upites);
      end;
    end;
  end;

  for I := 0 to User.m_ItemList.Count - 1 do begin
   UserItem:=User.m_ItemList.Items[i];
   if (UserItem <> nil) and (UserItem.MakeIndex = nMakeIndex) then begin
     sUserItemName:=GetItemName(UserItem);

    if CompareText(sUserItemName,sItemName) = 0 then begin


     StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

    //公扁棵啡唱                              //陛傈乐唱 犬牢
     if (StdItem.StdMode in [5,6,90,99]) and (User.m_nGold >= g_Config.nUpgradeWeaponPrice) and
         checkUPItemname(UpwaitemList,g_Config.sBlackStone) then begin //孺枚档乐唱 犬牢    //犁访
        User.DecGold(g_Config.nUpgradeWeaponPrice); //陛傈 啊廉皑
       if m_boCastle or g_Config.boGetAllNpcTax then begin   //5%狼 技陛捞 叭腮促.
         if m_Castle <> nil then begin
           TUserCastle(m_Castle).IncRateGold(g_Config.nUpgradeWeaponPrice);
         end else
         if g_Config.boGetAllNpcTax then begin  //力访沁阑锭 技陛叭扁 傈眉
           g_CastleManager.IncRateGold(g_Config.nUpgradeWeaponPrice);
         end;
       end;
       User.GoldChanged();  //发送人物的金币数到客户端
       New(UpgradeInfo);  //创建新的NPC保存物品
       UpgradeInfo.sUserName:=User.m_sCharName; //物品持有者
       UpgradeInfo.UserItem:=UserItem^;

    //004A0B2F
       if StdItem.NeedIdentify = 1 then      //力访 嘎辫
         AddGameDataLog('25' +  #9 +
                   User.m_sMapName + #9 +
                   IntToStr(User.m_nCurrX) + #9 +
                   IntToStr(User.m_nCurrY) + #9 +
                   User.m_sCharName + #9 +
                   StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                   IntToStr(UserItem.MakeIndex) + #9 +
                   '1' + #9 +
                   '0' + #9 + '[升级 开始]');


       User.SendDelItems(UserItem);
       User.m_ItemList.Delete(I);
       User.WeightChanged();
       User.RecalcAbilitys();   //瓷仿摹 货肺绊摹绊
       User.FeatureChanged();   //馒侩捞固瘤档
       User.SendMsg(User,RM_ABILITY,0,0,0,0,''); //刷新发送人物属性值
       sub_4A0218(User.m_ItemList,UpwaitemList,UpgradeInfo.btDc,UpgradeInfo.btSc,UpgradeInfo.btMc,UpgradeInfo.btDura);
       UpgradeInfo.dtTime:=Now(); //力访 矫埃朝楼
       UpgradeInfo.dwGetBackTick:=GetTickCount();
       m_UpgradeWeaponList.Add(UpgradeInfo);
       SaveUpgradingList();
       bo0D:=True;
     end;

     break;
    end;
   end;
  end;
  if bo0D then begin
    GotoLable(User,sUPGRADEOK,False);  //犁访 茄促
  end else begin
    GotoLable(User,sUPGRADEFAIL,False); //犁访 阂啊
    User.SendMsg(User,RM_CORWAPONMG,0,0,0,0,'');      //犁访 阂啊
  end;
  if UpwaitemList <> nil then UpwaitemList.Free;
  if Upites <> nil then  Dispose (Upites);
end;
procedure TMerchant.GetBackupgWeapon(User:TPlayObject); //004A0CB8    //力访
var
  I: Integer;
  UpgradeInfo:pTUpgradeInfo;
  n10,n18,n1C,n90:Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  boot:Boolean;   //拱距
begin
  n18:=0;
  UpgradeInfo:=nil;
  if not User.IsEnoughBag then begin
    GotoLable(User,sGETBACKUPGFULL,False);
    exit;
  end;
  for I := 0 to m_UpgradeWeaponList.Count - 1 do begin
    if pTUpgradeInfo(m_UpgradeWeaponList.Items[I]).sUserName = User.m_sCharName then begin
      n18:=1;
      if ((GetTickCount - pTUpgradeInfo(m_UpgradeWeaponList.Items[I]).dwGetBackTick) > g_Config.dwUPgradeWeaponGetBackTime) or (User.m_btPermission >= 4) then begin
        UpgradeInfo:=m_UpgradeWeaponList.Items[I];
        m_UpgradeWeaponList.Delete(I);
        SaveUpgradingList();
        n18:=2;
        break;
      end;
    end;
  end;

  if UpgradeInfo <> nil then begin
    case UpgradeInfo.btDura of    //
      0..8: begin //004A0DE5
       if UpgradeInfo.UserItem.DuraMax > 3000 then begin
         Dec(UpgradeInfo.UserItem.DuraMax,3000);
       end else begin
         UpgradeInfo.UserItem.DuraMax:=UpgradeInfo.UserItem.DuraMax shr 1;
       end;
       if UpgradeInfo.UserItem.Dura > UpgradeInfo.UserItem.DuraMax then
         UpgradeInfo.UserItem.Dura:=UpgradeInfo.UserItem.DuraMax;
      end;
      9..15: begin //004A0E41
       if Random(UpgradeInfo.btDura) < 6 then begin
         if UpgradeInfo.UserItem.DuraMax > 1000 then
           Dec(UpgradeInfo.UserItem.DuraMax,1000);
         if UpgradeInfo.UserItem.Dura > UpgradeInfo.UserItem.DuraMax then
           UpgradeInfo.UserItem.Dura:=UpgradeInfo.UserItem.DuraMax;
       end;
         
      end;
      18..255: begin
        case Random(UpgradeInfo.btDura - 18) of
          1..4: Inc(UpgradeInfo.UserItem.DuraMax,1000);
          5..7: Inc(UpgradeInfo.UserItem.DuraMax,2000);
          8..255: Inc(UpgradeInfo.UserItem.DuraMax,4000)
        end;
      end;
    end;
    if (UpgradeInfo.btDc = UpgradeInfo.btMc) and (UpgradeInfo.btMc = UpgradeInfo.btSc) then begin
      n1C:=Random(3);
    end else begin
      n1C:= -1;
    end;
    if ((UpgradeInfo.btDc >= UpgradeInfo.btMc) and (UpgradeInfo.btDc >= UpgradeInfo.btSc)) or
      (n1C = 0) then begin
      n90:=_MIN(11,UpgradeInfo.btDc);
      n10:=_MIN(85,n90 shl 3 - n90 + 10 + UpgradeInfo.UserItem.btValue[3] - UpgradeInfo.UserItem.btValue[4] + User.m_nBodyLuckLevel);

      if Random(g_Config.nUpgradeWeaponDCRate) < n10 then begin//if Random(100) < n10 then begin
        UpgradeInfo.UserItem.btValue[10]:=10;

        if (n10 > 63) and (Random(g_Config.nUpgradeWeaponDCTwoPointRate) = 0) then//if (n10 > 63) and (Random(30) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 11;

        if (n10 > 79) and (Random(g_Config.nUpgradeWeaponDCThreePointRate) = 0) then//if (n10 > 79) and (Random(200) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 12;
      end else UpgradeInfo.UserItem.btValue[10]:=1; //004A0F89
    end;

    if ((UpgradeInfo.btMc >= UpgradeInfo.btDc) and (UpgradeInfo.btMc >= UpgradeInfo.btSc)) or
       (n1C = 1) then begin
      n90:=_MIN(11,UpgradeInfo.btMc);
      n10:=_MIN(85,n90 shl 3 - n90 + 10 + UpgradeInfo.UserItem.btValue[3] - UpgradeInfo.UserItem.btValue[4] + User.m_nBodyLuckLevel);

      if Random(g_Config.nUpgradeWeaponMCRate) < n10 then begin//if Random(100) < n10 then begin
        UpgradeInfo.UserItem.btValue[10]:=20;

        if (n10 > 63) and (Random(g_Config.nUpgradeWeaponMCTwoPointRate) = 0) then//if (n10 > 63) and (Random(30) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 21;

        if (n10 > 79) and (Random(g_Config.nUpgradeWeaponMCThreePointRate) = 0) then//if (n10 > 79) and (Random(200) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 22;
      end else UpgradeInfo.UserItem.btValue[10]:=1;
    end;

    if ((UpgradeInfo.btSc >= UpgradeInfo.btMc) and (UpgradeInfo.btSc >= UpgradeInfo.btDc)) or
       (n1C = 2) then begin
      n90:=_MIN(11,UpgradeInfo.btSc);
      n10:=_MIN(85,n90 shl 3 - n90 + 10 + UpgradeInfo.UserItem.btValue[3] - UpgradeInfo.UserItem.btValue[4] + User.m_nBodyLuckLevel);

      if Random(g_Config.nUpgradeWeaponSCRate) < n10 then begin//if Random(100) < n10 then begin
        UpgradeInfo.UserItem.btValue[10]:=30;

        if (n10 > 63) and (Random(g_Config.nUpgradeWeaponSCTwoPointRate) = 0) then//if (n10 > 63) and (Random(30) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 31;

        if (n10 > 79) and (Random(g_Config.nUpgradeWeaponSCThreePointRate) = 0) then//if (n10 > 79) and (Random(200) = 0) then
          UpgradeInfo.UserItem.btValue[10]:= 32;
      end else UpgradeInfo.UserItem.btValue[10]:=1;
    end;
    New(UserItem);
    UserItem^:=UpgradeInfo.UserItem;
    DisPose(UpgradeInfo);
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    //004A120E
    if StdItem.NeedIdentify = 1 then       //力访 茫澜
    AddGameDataLog('24' +  #9 +
                   User.m_sMapName + #9 +
                   IntToStr(User.m_nCurrX) + #9 +
                   IntToStr(User.m_nCurrY) + #9 +
                   User.m_sCharName + #9 +
                   StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                   IntToStr(UserItem.MakeIndex) + #9 +
                   '1' + #9 +
                   '0' + #9 + '[升级 取回]');
    User.AddItemToBag(UserItem,boot);
    if boot then
    User.SendAddItem(UserItem,1);
  end;
  case n18 of
    0: GotoLable(User,sGETBACKUPGFAIL,False);
    1: GotoLable(User,sGETBACKUPGING,False);
    2: GotoLable(User,sGETBACKUPGOK,False);
  end;
  
end;
function TMerchant.GetUserPrice(PlayObject:TPlayObject;nPrice:Integer):Integer; //0049F6E0
var
  n14:Integer;
begin
  {
  if m_boCastle then begin
    if UserCastle.IsMasterGuild(TGuild(PlayObject.m_MyGuild)) then begin
      n14:=_MAX(60,ROUND(m_nPriceRate * 8.0000000000000000001e-1));//80%
      Result:=ROUND(nPrice / 1.0e2 * n14); //100
    end else begin
      Result:=ROUND(nPrice / 1.0e2 * m_nPriceRate);
    end;
  end else begin
    Result:=ROUND(nPrice / 1.0e2 * m_nPriceRate);
  end;
  }
  if m_boCastle then begin
//    if UserCastle.IsMasterGuild(TGuild(PlayObject.m_MyGuild)) then begin
    if (m_Castle <> nil) and TUserCastle(m_Castle).IsMasterGuild(TGuild(PlayObject.m_MyGuild)) then begin
      n14:=_MAX(60,ROUND(m_nPriceRate * (g_Config.nCastleMemberPriceRate / 100)));//80%
      Result:=ROUND(nPrice / 100 * n14); //100
    end else begin
      Result:=ROUND(nPrice / 100 * m_nPriceRate);
    end;
  end else begin
    Result:=ROUND(nPrice / 100 * m_nPriceRate);
  end;
end;

//购买物品发送物品列表
procedure TMerchant.UserSelect(PlayObject:TPlayObject;sData:String);//惑牢
  procedure SuperRepairItem(User:TPlayObject); //004A159C
  begin
    User.SendMsg(Self,RM_SENDUSERSREPAIR,0,Integer(Self),0,0,'');
  end;

  procedure PBuyItem(User:TPlayObject;nInt:integer); //004A1378
  var
    I,n10,nPrice: Integer;
    aSendMsg,sName:String;
    UserItem:pTUserItem;
    ClientItem:TClientItem;
    mtItem:SBuyItem;
    Item:TItem;
    List14:TList;
    opt: integer;
 begin
  if m_GoodsList.Count > 0 then begin
    aSendMsg:= '';
    n10:=0;
    if nInt = 0 then
    User.SendDefMessage(SM_SENDGOODAPPR,Integer(Self),0,0,0,'');

    User.PointChanged;
    for I := nInt to m_GoodsList.Count - 1 do begin
      List14:=TList(m_GoodsList.Items[i]);
      if List14.count<=0 then  continue;  //
      UserItem:=List14.Items[0];
      if UserItem=nil then begin   //==抱错
        List14.Delete(0);          //
        continue;                  //
      end;                         //
      Item:=UserEngine.GetStdItem(UserItem.wIndex);
      if Item <> nil then begin
        //取自定义物品名称
        sName:=GetItemName(UserItem);
        Item.GetStandardItem(ClientItem.S);
        opt := Item.GetItemAddValue(UserItem,ClientItem.S);
        ClientItem.Dura:=UserItem.Dura;
        ClientItem.DuraMax:=UserItem.DuraMax;
        ClientItem.MakeIndex:=UserItem.MakeIndex;
        ClientItem.Amount:=UserItem.Amount;
        ClientItem.S.Name := sName;
        ClientItem.UpgradeOpt := opt;
        nPrice:=GetUserPrice(User,GetItemPrice(UserItem.wIndex));
        nPrice := nPrice * ClientItem.Amount;
        mtItem.Price := nPrice;
        mtItem.Stock := List14.Count;
        mtItem.entItem := ClientItem;
        aSendMsg:=aSendMsg + EncodeBuffer(@mtItem,SizeOf(SBuyItem)) + '/';
        Inc(n10);
        if n10 > 25 then break;
      end;
    end;
    if aSendMsg <> '' then begin
     User.m_DefMsg:=MakeDefaultMsg(SM_SENDGOODSLIST,0,1,0,0);
     User.SendSocket(@User.m_DefMsg,aSendMsg);
    end;
    if (I < m_GoodsList.Count - 1) then
    PBuyItem(User,I+1);
  end;
  end;

  procedure BuyItem(User:TPlayObject;nInt:integer); //004A1378
  var
    I,n10,nPrice: Integer;
    aSendMsg,sName:String;
    UserItem:pTUserItem;
    ClientItem:TClientItem;
    mtItem:SBuyItem;
    Item:TItem;
    List14:TList;
    opt: integer;
 begin
  if m_GoodsList.Count > 0 then begin
    aSendMsg:= '';
    n10:=0;
    if nInt = 0 then
    User.SendDefMessage(SM_SENDGOODAPPR,Integer(Self),0,0,0,'');

    for I := nInt to m_GoodsList.Count - 1 do begin
      List14:=TList(m_GoodsList.Items[i]);
      if List14.count<=0 then  continue;  //
      UserItem:=List14.Items[0];
      if UserItem=nil then begin   //==抱错
        List14.Delete(0);          //
        continue;                  //
      end;                         //
      Item:=UserEngine.GetStdItem(UserItem.wIndex);
      if Item <> nil then begin
        //取自定义物品名称
        sName:=GetItemName(UserItem);
        Item.GetStandardItem(ClientItem.S);
        opt := Item.GetItemAddValue(UserItem,ClientItem.S);
        ClientItem.Dura:=UserItem.Dura;
        ClientItem.DuraMax:=UserItem.DuraMax;
        ClientItem.MakeIndex:=UserItem.MakeIndex;
        ClientItem.Amount:=UserItem.Amount;
        ClientItem.S.Name := sName;
        ClientItem.UpgradeOpt := opt;
        nPrice:=GetUserPrice(User,GetItemPrice(UserItem.wIndex));
        nPrice := nPrice * ClientItem.Amount;
        mtItem.Price := nPrice;
        mtItem.Stock := List14.Count;
        mtItem.entItem := ClientItem;
        aSendMsg:=aSendMsg + EncodeBuffer(@mtItem,SizeOf(SBuyItem)) + '/';
        Inc(n10);
        if n10 > 25 then break;
      end;
    end;
    if aSendMsg <> '' then begin
     User.m_DefMsg:=MakeDefaultMsg(SM_SENDGOODSLIST,0,0,0,0);
     User.SendSocket(@User.m_DefMsg,aSendMsg);
    end;
    if (I < m_GoodsList.Count - 1) then
    BuyItem(User,I+1);
  end;
  end;
  procedure SendMakeItmeList (who: TPlayObject;nInt,mode:integer);      //力炼胶媚
  const
    MAKEPRICE = 100;
    function ItemStdModeboot(mone:Integer):Integer;
    begin
      case mone of
        3:Result:=1;    //澜侥
        0,1,2:Result:=2;   //拱距
        37,60,61:Result:=3;     //焊苛 脚林
        25,30,59,70,71,72,73,74,80,81,82,83,84:Result:=4;   //扁鸥酒捞袍
        40,41,42,43,44,45,46,47:Result:=5;      //犁丰袍
        5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,63,64,100 :Result:=6;     //力炼傈侩
      end;
    end;
  var
   i, j, n10: integer;
   data: string;
   cg: TClientGoods;
   pu: PTUserItem;
   pstd: TItem;
   List14:TList;
   sName, sMakeItemName, sMakePrice: string;
   ClientItem:TClientItem;
   mtItem:SBuyItem;
   opt: integer;
  begin
    if m_GoodsList.Count > 0 then begin
     data := '';
     n10:=0;
     if nInt = 0 then
     who.SendDefMessage(SM_SENDGOODAPPR,Integer(Self),1,0,0,'');

     for i := nInt to m_GoodsList.Count-1 do begin
        List14:=TList(m_GoodsList.Items[i]);
        if List14.count<=0 then continue;
          pu := List14.Items[0];
          if pu = nil then begin
            List14.Delete(0);
            continue;
          end;
        pstd := UserEngine.GetStdItem (pu.wIndex);
        if (pstd <> nil) and (ItemStdModeboot(pstd.StdMode)= mode) then begin
          sName:=GetItemName(pu);
          pstd.GetStandardItem(ClientItem.S);
          opt := pstd.GetItemAddValue(pu,ClientItem.S);
          ClientItem.Dura:=pu.Dura;
          ClientItem.DuraMax:=pu.DuraMax;
          ClientItem.MakeIndex:=pu.MakeIndex;
          ClientItem.Amount:=pu.Amount;
          ClientItem.S.Name := sName;
          ClientItem.UpgradeOpt := opt;
          mtItem.Price:= MAKEPRICE;   //11-02-21 //力炼 陛傈

          for j:=0 to g_MakeItemList.Count-1 do begin
              sMakePrice := GetValidStr3(g_MakeItemList[j], sMakeItemName, [':']);
              if sName = sMakeItemName then begin
                 mtItem.Price := Str_ToInt(sMakePrice, 0);
                 break;
              end;
          end;
          mtItem.Stock := List14.Count;;
          mtItem.entItem := ClientItem;
          data:=data + EncodeBuffer(@mtItem,SizeOf(SBuyItem)) + '/';
          Inc(n10);
          if n10 > 25 then break;
        end;
     end;

     if data <> '' then begin
      who.m_DefMsg:=MakeDefaultMsg(SM_SENDUSERMAKEITEMLIST,0,0,1,0);
      who.SendSocket(@who.m_DefMsg,data);
     end;
     if (I < m_GoodsList.Count - 1) then
        SendMakeItmeList(who,I+1,mode);
    end;
  end;
  procedure WakeupItem(User:TPlayObject); //004A1544
  begin
    User.SendMsg(Self,RM_SENDUSERWAKEUP,0,Integer(Self),0,0,'');
  end;
  procedure DisassembleItem(User:TPlayObject);  //阿己盒秦
  begin
    User.SendMsg(Self,RM_SENDUSERDISASSEMBLE,0,Integer(Self),0,0,'');
  end;
  procedure DismantleItem(User:TPlayObject); //老馆盒秦
  begin
    User.SendMsg(Self,RM_SENDUSERDISMANTLE,0,Integer(Self),0,0,'');
  end;
  procedure SellItem(User:TPlayObject); //004A1544
  begin
    User.SendMsg(Self,RM_SENDUSERSELL,0,Integer(Self),0,0,'');
  end;
  procedure LockItem(User: TPlayObject);
  begin
    User.SendMsg(Self, RM_SENDITEMLOCK, 0, Integer(Self), 0, 0, '');
  end;
  procedure WakeCancelItem(User: TPlayObject);
  begin
    User.SendMsg(Self, RM_SENDUSERWAKE, 0, Integer(Self), 0, 0, '');
  end;
  procedure ReStoreItem(User: TPlayObject);
  begin
    User.SendMsg(Self, RM_SENDUSERRESTORE, 0, Integer(Self), 0, 0, '');
  end;
  procedure RepairItem(User:TPlayObject); //004A1570
  begin
    User.SendMsg(Self,RM_SENDUSERREPAIR,0,Integer(Self),0,0,'');
  end;

  procedure ItemPrices(User:TPlayObject); //
  begin

  end;
  procedure MakeHeroName(User: TPlayObject);
  begin
    User.SendMsg(Self, RM_HEROCREATE, 0, Integer(Self), 0, 0, '');
  end;
  procedure Storage(User:TPlayObject); //芒绊
  begin
    User.SendMsg(Self,RM_USERSTORAGEITEM,0,Integer(Self),0,0,'');
  end;
  procedure ComStorage(User:TPlayObject); //004A1648     //傍侩芒绊
  begin
    User.SendMsg(Self,RM_USERCOMSTORAGE,0,Integer(Self),0,0,'');
  end;
  procedure GuildStorage(User:TPlayObject); //004A1648     //巩颇芒绊
  begin
    User.SendMsg(Self,RM_USERGUILDSTORAGE,0,Integer(Self),0,0,'');
  end;
{guild territory procedures}
  procedure AgitMove(PlayObject:TPlayObject); //厘盔 捞悼
  begin
    if PlayObject.m_myGuild <> nil then begin
      if TGuild(PlayObject.m_MyGuild).m_Territory = nil then begin
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你的行会还没有行会庄园。');
        exit;
      end;
      if PlayObject.MoveToGT(TTerritory(TGuild(PlayObject.m_MyGuild).m_Territory).TerritoryNumber) then begin   //厘盔 捞悼
        PlayObject.SysMsg('你已经传送到了行会庄园。',c_Green ,t_Hint);
      end else
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你的行会还没有行会庄园。');
     end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你无法移动到行会庄园。');
  end;
  procedure AgitForSale(PlayObject:TPlayObject;sMsg:String);
  var
    amount:integer;
  begin
    sMsg:=Trim(sMsg);
   amount:=Str_ToInt(sMsg,0);
    if amount > 0 then begin
      try
        if TTerritory(m_PEnvir.m_GuildTerritory).StartSale(amount) then begin
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你的行会庄园已经出售。');
        end else
          PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你的行会庄园正在出售当中。');
      except
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'请输入你的行会庄园的出售价格。');
      end;
    end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'请输入你的行会庄园的出售价格。');
  end;
  procedure AgitExtend(PlayObject:TPlayObject);
  begin
    if PlayObject.DecGold(g_config.nGTEXTENDFEE) then begin   //take 100k
      PlayObject.GoldChanged();
    end else begin
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'金币不足。');
      exit;
    end;
    TTerritory(m_PEnvir.m_GuildTerritory).Extend();
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'庄园的租赁期限延长了。 你的租赁期限还有' + TTerritory(m_PEnvir.m_GuildTerritory).DaysRemaining() + '天。');
  end;
  procedure AgitreMain(PlayObject:TPlayObject); //厘盔 扁埃 炼雀
  begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'行会庄园的使用期限还剩下' + TTerritory(m_PEnvir.m_GuildTerritory).DaysRemaining() + '天。');
  end;
  procedure AgitOneRecall(PlayObject:TPlayObject; sMsg:string);    //厘盔 俺牢 家券
  begin
    sMsg:=Trim(sMsg);
    if sMsg <> '' then begin
       PlayObject.IndividualGuildGT(sMsg);
    end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'请输入你要传唤的人的名字。');
  end;
  procedure AgitForSaleCancel(PlayObject:TPlayObject);
  begin
    if TTerritory(m_PEnvir.m_GuildTerritory).StopSale() then begin
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你已经取消了行会庄园的销售。');
    end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你没有销售的行会庄园。');
  end;
  procedure AgitReg(PlayObject:TPlayObject);
  begin
    if PlayObject.m_MyGuild = nil then begin
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你还没有加入行会。');
      exit;
    end;
    if PlayObject.IsGuildMaster = False then begin
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有拥有行会庄园的行会成员才可以进入庄园进行交易。');
      exit;
    end;
    if g_GuildTerritory.FindGuildTerritoryEx(TGuild(PlayObject.m_MyGuild).sGuildName) <> nil then begin
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你只能拥有一个行会庄园。');
      exit;
    end;
    if TGuild(PlayObject.m_MyGuild).Count <= g_Config.nGTNumberOfPeople then begin
       PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'行会庄园要求行会至少有 '+IntToStr(g_Config.nGTNumberOfPeople)+'名成员。');
       exit;
    end;

    if PlayObject.m_nGold >= g_config.nGTBuyFee then begin
      if g_GuildTerritory.BuyFirstFreeGT(TGuild(PlayObject.m_MyGuild).sGuildName) then begin
        PlayObject.DecGold(g_config.nGTBuyFee);
        PlayObject.GoldChanged();
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'恭喜，你租赁到了行会庄园。');
      end else
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'没有正在出售的行会庄园。');
    end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'金币不足。');
  end;
var
  sLabel,s18,sMsg:String;
  boCanJmp:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TMerchant::UserSelect... Data: %s';
begin //004A1820
  inherited;
  if not (ClassNameIs(TMerchant.ClassName)) then exit;

  try
    PlayObject.m_nScriptGotoCount := 0;
    if not m_boCastle or not ((m_Castle <> nil) and TUserCastle(m_Castle).m_boUnderWar) then begin
      if not PlayObject.m_boDeath and (sData <> '') and (sData[1] = '@') then begin
        sMsg:=GetValidStr3(sData, sLabel, [#13]);
        s18:='';
        PlayObject.m_sScriptLable:=sData;
        boCanJmp:= PlayObject.LableIsCanJmp(sLabel);
        if CompareText(sLabel,sSL_SENDMSG) = 0 then begin
          if sMsg = '' then exit;
        end;
        if CompareText(sLabel,sSL_SENDMSG2) = 0 then begin
          if sMsg = '' then exit;
        end;
        GotoLable(PlayObject,sLabel,not boCanJmp);
        if not boCanJmp then exit;
          
        if CompareText(sLabel,sSL_SENDMSG) = 0 then begin
          if m_boSendmsg then SendCustemMsg(PlayObject,sMsg);
        end else
        if CompareText(sLabel,sSL_SENDMSG2) = 0 then begin
          if m_boSendmsg2 then SendCustemMsg2(PlayObject,sMsg);
        end else
        if CompareText(sLabel,sSUPERREPAIR) = 0 then begin
          if m_boS_repair then SuperRepairItem(PlayObject);
        end else
        if CompareText(sLabel,sBUY) = 0 then begin
          if m_boBuy then BuyItem(PlayObject,0);
        end else
        if CompareText(sLabel,sPBUY) = 0 then begin
          if m_boBuy then PBuyItem(PlayObject,0);
        end else
        if CompareText(sLabel,sMAKEGEM) = 0 then begin
       //   if m_boMakeGem then BuyItem2(PlayObject,0);
        end else
        //------------------力炼--------------------------//
        if CompareText(sLabel,sMAKEFOOD) = 0 then begin        //澜侥
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,1);
        end else
        if CompareText(sLabel,sMAKEPOTION) = 0 then begin     //拱距
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,2);
        end else
        if CompareText(sLabel,sMAKEGEMS) = 0 then begin       //焊苛
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,3);
        end else
        if CompareText(sLabel,sMAKEITEM) = 0 then begin      //扁鸥捞捞袍
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,4);
        end else
        if CompareText(sLabel,sMAKETUFF) = 0 then begin      //力炼傈侩
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,5);
        end else
        if CompareText(sLabel,sMAKEETC) = 0 then begin    //犁丰酒捞袍
          if m_boMakeGem then SendMakeItmeList(PlayObject,0,6);
        end else
        //----------------------------------------------------//
        if CompareText(sLabel,sSELL) = 0 then begin
          if m_boSell then SellItem(PlayObject);
        end else
        if CompareText(sLabel, sWake) = 0 then begin   //阿己秒家
          if m_boWake then WakeCancelItem(PlayObject);
        end else
        if CompareText(sLabel, sReStore) = 0 then begin   //阿己秒家
          if m_boReStore then ReStoreItem(PlayObject);
        end else
        if CompareText(sLabel, sLockUp) = 0 then begin     //豪牢
          if m_boLockUp then LockItem(PlayObject);
        end else
        if CompareText(sLabel,sWAKEUPITEM) = 0 then begin
          if m_boWakeUp then WakeupItem(PlayObject);
        end else
        if CompareText(sLabel,sDISASSEMBLE) = 0 then begin
          if m_boDisassemble then DisassembleItem(PlayObject);   //阿己盒秦
        end else
        if CompareText(sLabel,sDISMANTLE) = 0 then begin
          if m_boDismantle then DismantleItem(PlayObject);       //老馆盒秦
        end else
        if CompareText(sLabel,sREPAIR) = 0 then begin
          if m_boRepair then RepairItem(PlayObject);
        end else
        if CompareText(sLabel,sMAKEDURG) = 0 then begin
       //   if m_boMakeDrug then MakeDurg(PlayObject);
        end else
        if CompareText(sLabel,sPRICES) = 0 then begin
          if m_boPrices then ItemPrices(PlayObject);
        end else

        if CompareText(sLabel, sMakeNewHero) = 0 then begin
          if m_boMakeNewHero then MakeHeroName(PlayObject);
        end else

        if CompareText(sLabel,sSTORAGE) = 0 then begin   //芒绊
          if m_boStorage then Storage(PlayObject);
        end else
        if CompareText(sLabel, sSETSTORAGEPW) = 0 then begin     //芒绊鞠龋
          PlayObject.SendMsg(Self, RM_SETPASSWORD, 0, 0, 0, 0, '');
        end else
          if CompareText(sLabel, sSTORAGEPW) = 0 then begin       //芒绊鞠龋
          PlayObject.SendMsg(Self, RM_INPUTPASSWORD, 0, 0, 0, 0, '');
        end else

        if CompareText(sLabel,sCOMSTORAGE) = 0 then begin        //傍侩芒绊 拱扒 棵府扁
          if m_boComStoragement then ComStorage(PlayObject);
        end else
        if CompareText(sLabel,sGUILDSTORAGE) = 0 then begin        //巩颇芒绊 拱扒 棵府扁
          if m_boGuildStoragement then GuildStorage(PlayObject);
        end else
        if CompareText(sLabel,sUPGRADENOW) = 0 then begin       //力访
        if m_boUpgradenow then PlayObject.SendMsg(Self,RM_OPWWAPONMG,0,Integer(Self),0,0,'');
        end else
        if CompareText(sLabel,sCHECKWEAPON) = 0 then begin       //力访 犬牢
        if m_boCheckWeapon then PlayObject.SendMsg(Self,RM_CHECKWEAPON,0,Integer(Self),0,0,'');
        end else
        if CompareText(sLabel,sGETBACKUPGNOW) = 0 then begin     //力访
          if m_boGetBackupgnow then GetBackupgWeapon(PlayObject);
        end else
        if CompareLStr(sLabel,sUSEITEMNAME,Length(sUSEITEMNAME)) then begin
          if m_boUseItemName then ChangeUseItemName(PlayObject,sLabel,sMsg);
        end else
        if CompareText(sLabel,sEXIT) = 0 then begin
          PlayObject.SendMsg(Self,RM_MERCHANTDLGCLOSE,0,Integer(Self),0,0,'');
        end else
        if CompareText(sLabel,sBACK) = 0 then begin
          if PlayObject.m_sScriptGoBackLable = '' then PlayObject.m_sScriptGoBackLable:=sMAIN;
          GotoLable(PlayObject,PlayObject.m_sScriptGoBackLable,False);
        end;
        if CompareText(sLabel,sagitmove) = 0 then begin     //厘盔 捞悼
          AgitMove(PlayObject);
        end;
        if CompareText(sLabel,sagitbuy) = 0 then begin
          ClientRequestGTList(PlayObject,0)
        end;
        if CompareText(sLabel,sagitreg) = 0 then begin
          AgitReg(PlayObject);
        end;

         //懦单胶 疙飞绢
        if CompareText(sLabel,sKDZero) = 0 then begin   //懦单胶 力肺
            PlayObject.ZeroFamePoint;
        end;

{guild territory commands}
        if m_PEnvir.Flag.nGuildTerritory > 0 then begin //all commands below need to be used inside a gt
          if CompareText(sLabel,sga_decomon_count) = 0 then begin
                PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'总的装饰数量: ' + IntToStr(TTerritory(m_PEnvir.m_GuildTerritory).DecoCount(m_PEnvir)));
          end;
          if CompareText(sLabel,sga_decoitem_buy) = 0 then begin
            ClientRequestDecoList(PlayObject,0);
          end;
          if CompareText(sLabel,sgaboardlist) = 0 then begin
            if (PlayObject.m_MyGuild <>  nil) and  (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              ClientRequestBBSMsgList(PlayObject,0);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有拥有行会庄园的行会成员才可以看到行会庄园的公告。');
          end;
          if CompareText(sLabel,sAgitRecall) = 0 then begin   //厘盔 傈眉 家券
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              PlayObject.RecallGuildGT();
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;
          if CompareText(sLabel,sagitextend) = 0 then begin
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              AgitExtend(PlayObject);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;

          if CompareText(sLabel,sAgitremain) = 0 then begin   //厘盔 扁埃
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              AgitreMain(PlayObject);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;

          if CompareText(sLabel,sAgitoneRecall) = 0 then begin    //厘盔 俺牢 家券
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              AgitOneRecall(PlayObject,sMsg);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;
          if CompareText(sLabel,sagitforsale) = 0 then begin
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              AgitForSale(PlayObject,sMsg);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;
          if CompareText(sLabel,sAgitOrSaleCancel) = 0 then begin
            if (PlayObject.m_MyGuild <> nil) and (PlayObject.m_nGuildRankNo =1) and (TGuild(PlayObject.m_myGuild).sGuildName = TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
              AgitForSaleCancel(PlayObject);
            end else
              PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是拥有行会庄园的行会成员。');
          end;
        end;
      end;//004A1A3E
    end;//004A187E
  except
    MainOutMessage(format(sExceptionMsg,[sData]));
  end;
end;
procedure TMerchant.Run(); //004A2ECC
var
  nCheckCode:Integer;
  dwCurrentTick: longword;
  dwDelayTick: longword;
ResourceString
  sExceptionMsg1 = '[Exception] TMerchant::Run... Code = %d';
  sExceptionMsg2 = '[Exception] TMerchant::Run -> Move Code = %d';
begin
  nCheckCode:=0;
  try
    //--------------------------------
    //Merchant 何窍 盒魂 内靛
    dwCurrentTick := GetTickCount;
    dwDelayTick   := CreateIndex * 500;
    if dwCurrentTick < dwDelayTick then dwDelayTick := 0;
    //--------------------------------

    if (dwCurrentTick - dwRefillGoodsTick) > 5 * 60 * 1000 + dwDelayTick then begin
      dwRefillGoodsTick := dwCurrentTick - dwDelayTick;
      RefillGoods();
    end;
    nCheckCode:=1;
    if (dwCurrentTick - dwClearExpreUpgradeTick) > 10 * 60 * 1000 then begin
      dwClearExpreUpgradeTick := dwCurrentTick;
      ClearExpreUpgradeListData();
    end;
    nCheckCode:=2;
    if Random(50) = 0 then begin
      TurnTo(Random(8));
    end else begin
      if Random(50) = 0 then
        SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    end;
    nCheckCode:=3;
    if m_boCastle and (m_Castle <> nil) and TUserCastle(m_Castle).m_boUnderWar then begin
      //傈里吝俊 荤合己救狼 惑痢篮 巩阑 摧绰促.
      if not m_boFixedHideMode then begin
        SendRefMsg(RM_DISAPPEAR,0,0,0,0,'');
        m_boFixedHideMode:=True;
      end;
    end else begin
      if m_boFixedHideMode then begin
        //乞惑矫
        m_boFixedHideMode:=False;
        SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
      end;
    end;
    nCheckCode:=4;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg1,[nCheckCode]));
      MainOutMessage(E.Message);
    end;
  end;
  try
    if m_boCanMove and (GetTickCount - m_dwMoveTick > m_dwMoveTime * 1000) then begin
      m_dwMoveTick:=GetTickCount();
      SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
      MapRandomMove(m_sMapName,0);
    end;
  except
    on e: Exception do begin
      MainOutMessage(format(sExceptionMsg2,[nCheckCode]));
      MainOutMessage(E.Message);
    end;
  end;
  inherited;
end;
function TMerchant.Operate(ProcessMsg:pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);

end;

procedure TMerchant.LoadNPCData; //0049F044
var
  sFile:String;
begin
  sFile:=m_sScript + '-' + m_sMapName;
  FrmDB.LoadGoodRecord(Self,sFile);
  FrmDB.LoadGoodPriceRecord(Self,sFile);
  LoadUpgradeList();
end;

procedure TMerchant.SaveNPCData;
var
  sFile:String;
begin
  sFile:=m_sScript + '-' + m_sMapName;
  FrmDB.SaveGoodRecord(Self,sFile);
  FrmDB.SaveGoodPriceRecord(Self,sFile);
end;

constructor TMerchant.Create; //0049EC70
begin
  inherited;
  m_btRaceImg    := RCC_MERCHANT;
  m_wAppr        := 0;
  m_nPriceRate   := 100;
  m_boCastle     := False;
  m_ItemTypeList := TList.Create;
  m_RefillGoodsList := TList.Create;
  m_GoodsList       := TList.Create;
  m_ItemPriceList   := TList.Create;
  m_UpgradeWeaponList     := TList.Create;
  //m_QuestsList      := TList.Create;
  dwRefillGoodsTick       :=GetTickCount();
  dwClearExpreUpgradeTick := GetTickCount();
  m_boBuy                 := False;
  m_boSell                := False;
  m_boLockUp := False;
  m_boWake := False;
  m_boReStore := False;
  m_boWakeUp             := False;
  m_boMakeNewHero         := False;
  m_boDisassemble         := False;
  m_boDismantle           := False;
  m_boMakeDrug            := False;
  m_boMakeGem             := False;
  m_boPrices              := False;
  m_boStorage             := False;     //芒绊
  m_boUpgradenow          := False;
  m_boCheckWeapon         := False;
  m_boGetBackupgnow       := False;
  m_boRepair              := False;
  m_boS_repair            := False;
  m_boUseItemName         := False;
  m_dwMoveTick            := GetTickCount();
  CreateIndex             := 0;
end;

destructor TMerchant.Destroy; //0049ED70
var
  I    :Integer;
  II   :Integer;
  List :TList;
begin
  m_ItemTypeList.Free;
  for I := 0 to m_RefillGoodsList.Count - 1 do begin
    DisPose(pTGoods(m_RefillGoodsList.Items[i]));
  end;
  m_RefillGoodsList.Free;
  SaveNPCData();
  for I := 0 to m_GoodsList.Count - 1 do begin
    List:=TList(m_GoodsList.Items[I]);
    for II := 0 to List.Count - 1 do begin
      Dispose(pTUserItem(List.Items[II]));
    end;
    List.Free;
  end;
  m_GoodsList.Free;

  {for I := 0 to m_QuestsList.Count - 1 do begin
    DisPose(pTGoods(m_QuestsList.Items[i]));
  end;
  m_QuestsList.Free; }

  for I := 0 to m_ItemPriceList.Count - 1 do begin
    Dispose(pTItemPrice(m_ItemPriceList.Items[I]));
  end;
  m_ItemPriceList.Free;
  for I := 0 to m_UpgradeWeaponList.Count - 1 do begin
    Dispose(pTUpgradeInfo(m_UpgradeWeaponList.Items[I]));
  end;
  m_UpgradeWeaponList.Free;
  inherited;
end;

procedure TMerchant.ClearExpreUpgradeListData; //004A01A0
var
  I: Integer;
  UpgradeInfo:pTUpgradeInfo;
begin
  for I := m_UpgradeWeaponList.Count - 1 downto  0 do begin
    UpgradeInfo:=m_UpgradeWeaponList.Items[I];
    if Integer(ROUND(Now - UpgradeInfo.dtTime)) >= g_Config.nClearExpireUpgradeWeaponDays then begin
      Dispose(UpgradeInfo);
      m_UpgradeWeaponList.Delete(I);
    end;
  end;
end;

procedure TMerchant.LoadNPCScript; //0049EF7C
var
  sC:String;
begin
  m_ItemTypeList.Clear;
  m_sPath:=sMarket_Def;
  sC:=m_sScript + '-' + m_sMapName;
  FrmDB.LoadScriptFile(Self, sMarket_Def, sC,True, False);
//  call    sub_49ABE0
end;

procedure TMerchant.Click(PlayObject: TPlayObject); //0049FF24
begin
//  GotoLable(PlayObject,'@main');
  inherited;
end;

procedure TMerchant.GetVariableText(PlayObject: TPlayObject;
  var sMsg: String; sVariable: String); //0049FD04
var
  sText:String;
begin
  inherited;
  if sVariable = '$PRICERATE' then begin
    sText:=IntToStr(m_nPriceRate);
    sMsg:=sub_49ADB8(sMsg,'<$PRICERATE>',sText);
  end;
  if sVariable = '$UPGRADEWEAPONFEE' then begin
    sText:=GetGoldStr(g_Config.nUpgradeWeaponPrice);
    sMsg:=sub_49ADB8(sMsg,'<$UPGRADEWEAPONFEE>',sText);
  end;
  if sVariable = '$USERWEAPON' then begin
    if PlayObject.m_UseItems[U_WEAPON].wIndex <> 0 then begin
      sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_WEAPON].wIndex);
    end else begin
      sText:='Weapon';
    end;
    sMsg:=sub_49ADB8(sMsg,'<$USERWEAPON>',sText);
  end;

end;
function  TMerchant.GetUserItemPrice(UserItem:pTUserItem):Integer; //0049F428
var
  n10:Integer;
  StdItem:TItem;
  n20:real;
  nC:Integer;
  n14:Integer;
begin
  n10:=GetItemPrice(UserItem.wIndex);
  if n10 > 0 then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) and
       (StdItem.StdMode > 4) and
       (StdItem.DuraMax > 0) and
       (UserItem.DuraMax > 0) then begin
      if StdItem.StdMode = 40 then begin //肉
        if UserItem.Dura <= UserItem.DuraMax then begin
          n20:=(n10 / 2.0 / UserItem.DuraMax * (UserItem.DuraMax - UserItem.Dura));
          n10:=_MAX(2,ROUND(n10-n20));
        end else begin
          n10:=n10 + ROUND(n10 / UserItem.DuraMax * 2.0 * (UserItem.DuraMax - UserItem.Dura));
        end;
      end; //0049F528
      if (StdItem.StdMode = 43) then begin  //ores
        if UserItem.DuraMax < 10000 then UserItem.DuraMax:= 10000;
        if UserItem.Dura <= UserItem.DuraMax then begin
          n20:=(n10 / 2.0 / UserItem.DuraMax * (UserItem.DuraMax - UserItem.Dura));
          n10:=_MAX(2,ROUND(n10-n20));
        end else begin
          n10:=n10 + ROUND(n10 / UserItem.DuraMax * 1.3 * (UserItem.Dura - UserItem.DuraMax));
        end;
      end; //0049F5C5
      if StdItem.StdMode > 4 then begin
        n14:=0;
        nC:=0;
        while (True) do begin
          if (StdItem.StdMode = 5) or (StdItem.StdMode = 6) or (StdItem.StdMode = 99)  then begin
            if (nC <> 4) or (nC <> 9) then begin
              if nC = 6 then begin
                if UserItem.btValue[nC] > 10 then begin
                  n14:=n14+ (UserItem.btValue[nC] - 10) * 2;
                end;
              end else begin
                n14:=n14+ UserItem.btValue[nC];
              end;
            end;
          end else begin
            Inc(n14,UserItem.btValue[nC]);
          end;
          Inc(nC);
          if nC >= 8 then break;
        end;    // while
        if n14 > 0 then begin
          inc(n10,n10 div 5 * n14);
        end;
        n10:=ROUND(n10 / StdItem.DuraMax * UserItem.DuraMax);
        n20:=(n10 / 2.0 / UserItem.DuraMax * (UserItem.DuraMax - UserItem.Dura));
        n10:=_MAX(2,ROUND(n10-n20));
      end; //0049F6BF
    end; //0049F6BF
  end;
  Result:=n10;
end;
procedure TMerchant.ClientBuyItem(PlayObject: TPlayObject; sItemName: String;     //扁埃力  惑牢
  nInt,aint: Integer); //004A2334
var
  I,II: Integer;
  bo29:Boolean;
  List20:TList;
  UserItem,UserItem2:pTUserItem;
  StdItem:TItem;
  n1C,nPrice:Integer;
  sUserItemName:String;
  boSucces:Boolean;
  nDateNow: DWord;
  nDateNow2: Integer;
  boot:Boolean;
begin
  bo29:=False;
  n1C:=1;
  for I := 0 to m_GoodsList.Count - 1 do begin
    if bo29 or (bo574)then break;
    List20:=TList(m_GoodsList.Items[i]);
    //if List20.Count <= 0 then Continue;
    UserItem:=List20.Items[0];

    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      //取自定义物品名称
      sUserItemName := GetItemName(UserItem);
      if PlayObject.IsAddWeightAvailable(StdItem.Weight) then begin
        if (sUserItemName = sItemName) and (UserItem.Amount = aint) then begin
          for II := 0 to List20.Count - 1 do begin
            UserItem:=List20.Items[II];
            if (StdItem.StdMode <= 100) or
               (StdItem.StdMode = 42) or
               (StdItem.StdMode = 45) or      //般摹扁
               (StdItem.StdMode = 31) or
               (UserItem.MakeIndex = nInt) then begin

              nPrice:=GetUserPrice(PlayObject,GetUserItemPrice(UserItem));
              if StdItem.StdMode in [0,1,3,45,46] then   //拱距
              nPrice := nPrice*UserItem.Amount;
              if (PlayObject.m_nGold >= nPrice) and (nPrice > 0) then begin
                boSucces:=FALSE;
                UserItem2:=PlayObject.CheckItems(StdItem.Name);
                if (StdItem.StdMode = 2) and (StdItem.Shape = 7) then begin  //檬措厘
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),1));
                  UserItem.btValue[19] := 2;

                  UserItem.btValue[11] := 2;
                  UserItem.btValue[0] := m_PEnvir.Flag.nGuildTerritory;//gt number
                end;

                if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //馆娄
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DDay)));
                  UserItem.btValue[19] := 2;
                end;

                if (StdItem.StdMode = 2) and (StdItem.Shape in [18]) then begin  //函脚呕
                  UserItem.MaxDate := DateTimeToUnix(IncHour(now(),(StdItem.DuraMax)));
                  UserItem.btValue[19] := 2;
                end;

                if (StdItem.StdMode = 2) and (StdItem.Shape in [20,21,23,27]) then begin  //龋困捍 龋困谅荤 玫飞荐 苛没荐
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DuraMax)));
                  UserItem.btValue[19] := 2;
                end;

                if PlayObject.IsEnoughBag then begin
                  if PlayObject.AddItemToBag(UserItem,boot) then begin
                    if boot then
                    PlayObject.SendAddItem(UserItem,1);
                    boSucces:=TRUE;
                  end;
                end else
                  n1C:=4;

                if boSucces then begin

              //   Dec(PlayObject.m_nGold,nPrice);
                  PlayObject.DecGold(nPrice);
                  PlayObject.GoldChanged;
                  if m_boCastle or g_Config.boGetAllNpcTax then begin   //备概沁阑锭 技陛叭扁 傈眉
                    if m_Castle <> nil then begin
                      TUserCastle(m_Castle).IncRateGold(nPrice);
                    end else
                    if g_Config.boGetAllNpcTax then begin       //备概沁阑锭 技陛叭扁 傈眉
                      g_CastleManager.IncRateGold(g_Config.nUpgradeWeaponPrice);
                    end;
                  end;
                  //004A25DC
                  if StdItem.NeedIdentify = 1 then    //酒捞袍 备概
                    AddGameDataLog('9' +  #9 +
                                 PlayObject.m_sMapName + #9 +
                                 IntToStr(PlayObject.m_nCurrX) + #9 +
                                 IntToStr(PlayObject.m_nCurrY) + #9 +
                                 PlayObject.m_sCharName + #9 +
                                 StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                                 IntToStr(UserItem.MakeIndex) + #9 +
                                 '1' + #9 +
                                 m_sCharName + #9 + '[NPC 购买]');

                  List20.Delete(II);
                  if List20.Count <= 0 then begin
                    List20.Free;
                    m_GoodsList.Delete(i);
                  end;
                  n1C:=0;
                end else n1C:=2;
              end else n1C:=3;
              bo29:=True;
              break;
            end;
          end;
        end;
      end else n1C:=2;  //004A2639
    end;
  end;    // for
  if n1C = 0 then begin
    PlayObject.SendMsg(Self,RM_BUYITEM_SUCCESS,0,PlayObject.m_nGold,nInt,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_BUYITEM_FAIL,0,n1C,0,0,'');
  end;

end;



procedure TMerchant.ClientPBuyItem(PlayObject: TPlayObject; sItemName: String;     //扁埃力  惑牢
  nInt,aint: Integer); //004A2334
var
  I,II: Integer;
  bo29:Boolean;
  List20:TList;
  UserItem,UserItem2:pTUserItem;
  StdItem:TItem;
  n1C,nPrice:Integer;
  sUserItemName:String;
  boSucces:Boolean;
  nDateNow: DWord;
  nDateNow2: Integer;
  boot:Boolean;
begin
  bo29:=False;
  n1C:=1;
  for I := 0 to m_GoodsList.Count - 1 do begin
    if bo29 or (bo574)then break;
    List20:=TList(m_GoodsList.Items[i]);

    UserItem:=List20.Items[0];

    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      sUserItemName := GetItemName(UserItem);
      if PlayObject.IsAddWeightAvailable(StdItem.Weight) then begin
        if (sUserItemName = sItemName) and (UserItem.Amount = aint) then begin
          for II := 0 to List20.Count - 1 do begin
            UserItem:=List20.Items[II];
            if (StdItem.StdMode <= 100) or
               (StdItem.StdMode = 42) or
               (StdItem.StdMode = 45) or      //般摹扁
               (StdItem.StdMode = 31) or
               (UserItem.MakeIndex = nInt) then begin

              nPrice:=GetUserPrice(PlayObject,GetUserItemPrice(UserItem));
              if StdItem.StdMode in [0,1,3,45,46] then   //拱距
              nPrice := nPrice*UserItem.Amount;
              if (PlayObject.m_nPCPoint >= nPrice) and (nPrice > 0) then begin
                boSucces:=FALSE;
                UserItem2:=PlayObject.CheckItems(StdItem.Name);
                if (StdItem.StdMode = 2) and (StdItem.Shape = 7) then begin  //檬措厘
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),1));
                  UserItem.btValue[19] := 2;

                  UserItem.btValue[11] := 2;
                  UserItem.btValue[0] := m_PEnvir.Flag.nGuildTerritory;//gt number
                end;

                if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //馆娄
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DDay)));
                  UserItem.btValue[19] := 2;
                end;

                if (StdItem.StdMode = 2) and (StdItem.Shape in [18]) then begin  //函脚呕
                  UserItem.MaxDate := DateTimeToUnix(IncHour(now(),(StdItem.DuraMax)));
                  UserItem.btValue[19] := 2;
                end;

                if (StdItem.StdMode = 2) and (StdItem.Shape in [20,21,23,27]) then begin  //龋困捍 龋困谅荤 玫飞荐 苛没荐
                  UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DuraMax)));
                  UserItem.btValue[19] := 2;
                end;


                if PlayObject.IsEnoughBag then begin
                  if PlayObject.AddItemToBag(UserItem,boot) then begin
                    if boot then
                    PlayObject.SendAddItem(UserItem,1);
                    boSucces:=TRUE;
                  end;
                end else
                  n1C:=4;

                if boSucces then begin
                  PlayObject.DecPCPoint(nPrice);
                  PlayObject.PointChanged;

                  if StdItem.NeedIdentify = 1 then    //酒捞袍 备概
                    AddGameDataLog('9' +  #9 +
                                 PlayObject.m_sMapName + #9 +
                                 IntToStr(PlayObject.m_nCurrX) + #9 +
                                 IntToStr(PlayObject.m_nCurrY) + #9 +
                                 PlayObject.m_sCharName + #9 +
                                 StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                                 IntToStr(UserItem.MakeIndex) + #9 +
                                 '1' + #9 +
                                 m_sCharName + #9 + '[NPC 购买]');

                  List20.Delete(II);
                  if List20.Count <= 0 then begin
                    List20.Free;
                    m_GoodsList.Delete(i);
                  end;
                  n1C:=0;
                end else n1C:=2;
              end else n1C:=3;
              bo29:=True;
              break;
            end;
          end;
        end;
      end else n1C:=2;  //004A2639
    end;
  end;    // for
  if n1C = 0 then begin
    PlayObject.SendMsg(Self,RM_BUYITEM_SUCCESS2,0,PlayObject.m_nPCPoint,nInt,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_BUYITEM_FAIL,0,n1C,0,0,'');
  end;

end;


procedure TMerchant.ClientQuerySellPrice(PlayObject: TPlayObject;    //惑牢
  UserItem: pTUserItem);
var
  nC:Integer;
  StdItem:TItem;
begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  nC:=GetSellItemPrice(GetUserItemPrice(UserItem));

  if UserEngine.GetStdItem(UserItem.wIndex).StdMode in [0,1,3,45,46] then begin     //拱距
   if UserItem.Amount > StdItem.MaxAmount then begin    //拱距 滚弊 厩侩 阜扁
    nC := 1;
   end else
    nC := nC * UserItem.Amount;           //惑牢 啊拜
  end;
  if (nC >= 0) then begin
    PlayObject.SendMsg(Self,RM_SENDBUYPRICE,0,nC,0,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_SENDBUYPRICE,0,0,0,0,'');
  end;
end;

function TMerchant.GetSellItemPrice(nPrice: integer): Integer; //0049F7A4
begin
  Result:=ROUND(nPrice / 2.0);
end;

function TMerchant.ClientSellItem(PlayObject: TPlayObject;    //惑牢 啊拜
  UserItem: pTUserItem{;nAmount:Integer}):Boolean; //004A1CD8
  function sub_4A1C84(UserItem: pTUserItem):Boolean;
  var
    StdItem:TItem;
  begin
    Result:=True;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) then begin
     if (not StdItem.boCanSell) or (UserItem.btValue[19] > 0) then begin     //扁埃力 措咯袍 豪牢 魄概陛瘤
      PlayObject.SendMsg(Self,RM_USERSELLITEM_FAIL,0,0,0,0,'');
      Result:=False;
      exit;
     end;
     if (StdItem.StdMode = 25) or (StdItem.StdMode = 30) then begin
      if UserItem.Dura < 4000 then Result:=False;
     end;
    end;
  end;
var
  nPrice:integer;
  StdItem:TItem;
begin  //004A1CD8
  Result:=False;

  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

  nPrice:=GetSellItemPrice(GetUserItemPrice(UserItem));
  if (UserEngine.GetStdItem(UserItem.wIndex).StdMode in [0,1,3,45,46])then begin     //般摹扁
   if UserItem.Amount > StdItem.MaxAmount then begin       //拱距 滚弊 厩侩 阜扁
    nPrice := 1;
   end else
    nPrice := nPrice * UserItem.Amount;            //惑牢 啊拜
  end;
  if (nPrice > 0) and (not bo574) and
     sub_4A1C84(UserItem) then begin
    if PlayObject.IncGold(nPrice) then begin
      if m_boCastle or g_Config.boGetAllNpcTax then begin      //魄概沁阑锭 技陛叭扁 傈眉
        if m_Castle <> nil then begin
          TUserCastle(m_Castle).IncRateGold(nPrice);
        end else
        if g_Config.boGetAllNpcTax then begin                 //魄概沁阑锭 技陛叭扁 傈眉
          g_CastleManager.IncRateGold(g_Config.nUpgradeWeaponPrice);
        end;
      end;
      PlayObject.SendMsg(Self,RM_USERSELLITEM_OK,0,PlayObject.m_nGold,0,0,'');

      //004A1E95
      if StdItem.NeedIdentify = 1 then      //[NPC 魄概]
        AddGameDataLog('10' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     StdItem.Name+'('+ IntToStr(UserItem.Amount)+')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     sSTRING_GOLDNAME + ' ' + IntToStr(nPrice) + #9 +
                     m_sCharName + #9 + '[NPC 出售]');
      Result:=True;
    end else begin//004A1EA0
      PlayObject.SendMsg(Self,RM_USERSELLITEM_FAIL,0,0,0,0,'');
    end;
  end else begin
    PlayObject.SendMsg(Self,RM_USERSELLITEM_FAIL,0,0,0,0,'');
  end;

end;


function TMerchant.ClientItemLock(PlayObject: TPlayObject;   //酒捞袍 豪牢
  UserItem: pTUserItem): Boolean;
  function CanItemLock(UserItem: pTUserItem): Boolean;
  var
    StdItem: TItem;
  begin
    Result := False;
    StdItem := UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem.StdMode in [5,6,7,12,90,99,10,11,15,19,20,21,22,23,24,26,62,64])
       and (UserItem.btValue[19] = 0) then begin
       Result := True;
    end;
  end;
var
  nPrice: Integer;
  StdItem: TItem;
  sCheckItemName: string;
begin
  Result := False;
  if CanItemLock(UserItem) then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    nPrice := 5000;
    if PlayObject.DecGold(nPrice) then begin
      UserItem.btValue[19] := (2 + UserItem.btValue[19]) + 1;
      UserItem.MaxDate := DateTimeToUnix(IncDay(now(), 7 * (UserItem.btValue[19] - 2) ));
      PlayObject.SendMsg(Self, RM_USERITEMLOCK_OK, 0, PlayObject.m_nGold, UserItem.btValue[19], 0, IntToStr(UserItem.MaxDate));
      {if StdItem.NeedIdentify = 1 then
        AddGameDataLog('10' + #9 +
          PlayObject.m_sMapName + #9 +
          IntToStr(PlayObject.m_nCurrX) + #9 +
          IntToStr(PlayObject.m_nCurrY) + #9 +
          PlayObject.m_sCharName + #9 +
          //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
          StdItem.Name + #9 +
          IntToStr(UserItem.MakeIndex) + #9 +
          '1' + #9 +
          m_sCharName); }
      Result := True;
    end else begin
      PlayObject.SendMsg(Self, RM_USERITEMLOCK_FAIL, 0, 1, 0, 0, '');
      exit;
    end;
  end else begin
    PlayObject.SendMsg(Self, RM_USERITEMLOCK_FAIL, 0, 0, 0, 0, '');
    exit;
  end;
end;


function TMerchant.ClientItemWake(PlayObject: TPlayObject;
  UserItem: pTUserItem): Boolean;
  function CanItemWake(UserItem: pTUserItem): Boolean;
  var
    StdItem: pTStdItem;
  begin
    Result := False;
    if UserItem.btValue[18] > 0 then begin
       Result := True;
    end;
  end;
var
  nPrice: Integer;
  StdItem: TItem;
  sCheckItemName: string;
begin
  Result := False;
  if CanItemWake(UserItem) then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    nPrice := 5000 * StdItem.Grade * UserItem.btValue[18];
    if PlayObject.DecGold(nPrice) then begin

      UserItem.btValue[12 + UserItem.btValue[18]] := 0;
      UserItem.btValue[18] := UserItem.btValue[18] - 1;
      if UserItem.btValue[18] = 0 then
      UserItem.btValue[12] := 0;
      PlayObject.SendMsg(Self, RM_USERITEMWAKE_OK, 0, PlayObject.m_nGold, 0, 0, '');
      {if StdItem.NeedIdentify = 1 then
        AddGameDataLog('10' + #9 +
          PlayObject.m_sMapName + #9 +
          IntToStr(PlayObject.m_nCurrX) + #9 +
          IntToStr(PlayObject.m_nCurrY) + #9 +
          PlayObject.m_sCharName + #9 +
          //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
          StdItem.Name + #9 +
          IntToStr(UserItem.MakeIndex) + #9 +
          '1' + #9 +
          m_sCharName); }
      Result := True;
    end else begin
      PlayObject.SendMsg(Self, RM_USERITEMWAKE_FAIL, 0, 1, 0, 0, '');
      exit;
    end;
  end else begin
    PlayObject.SendMsg(Self, RM_USERITEMWAKE_FAIL, 0, 0, 0, 0, '');
    exit;
  end;
end;

function TMerchant.ClientItemReStore(PlayObject: TPlayObject;
  UserItem: pTUserItem): Boolean;
  function CanItemReStore(UserItem: pTUserItem): Boolean;
  var
    StdItem: TItem;
    i : Integer;
  begin
    Result := False;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem.StdMode in [5,6,7,90,99,10,11,12,15] then begin
      for i := 0 to 10 do begin
        if UserItem.btValue[i] > 0 then begin
          if i <> 4 then
            Result := True;
        end;
      end;
    end else begin
      for i := 0 to 18 do begin
        if UserItem.btValue[i] > 0 then begin
          if i <> 11 then
          Result := True;
        end;
      end;
    end;

  end;
var
  nPrice, i: Integer;
  StdItem: TItem;
  sCheckItemName: string;
  StdItem80: TStdItem;
  ClientItem: TClientItem;
  sUserItemName: string;
  opt: integer;

begin
  Result := False;
  if CanItemReStore(UserItem) then begin
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    nPrice := (5000 * StdItem.Grade)  +  (StdItem.NeedLevel * 1000);
    if PlayObject.DecGold(nPrice) then begin

      if StdItem.StdMode in [5,6,90,99,10,11,12,15] then begin
        for i := 0 to 10 do begin
          if UserItem.btValue[i] > 0 then begin
            if i = 4 then Continue;
            UserItem.btValue[i] := 0;
          end;
        end;
      end else begin
        for i := 0 to 18 do begin
          if UserItem.btValue[i] > 0 then begin
            if i = 11 then Continue;
            UserItem.btValue[i] := 0;
          end;
        end;
      end;
      if StdItem <> nil then begin
        StdItem.GetStandardItem(StdItem80);
        opt := StdItem.GetItemAddValue(UserItem, StdItem80);
        ClientItem.s := StdItem80;

        sUserItemName := '';
        sUserItemName := FilterStdShowName(StdItem,StdItem80.Name);
        if UserItem.btValue[11] = 1 then
          sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
        if sUserItemName <> '' then
          ClientItem.s.Name := FilterStdShowName(StdItem,sUserItemName);


        ClientItem.MakeIndex := UserItem.MakeIndex;
        ClientItem.Dura := UserItem.Dura;
        ClientItem.DuraMax := UserItem.DuraMax;
        ClientItem.UpgradeOpt := opt;
        ClientItem.Amount := UserItem.Amount;
      end;

      PlayObject.m_DefMsg := MakeDefaultMsg(SM_USERITEMRESTORE_OK, PlayObject.m_nGold, 0, 0, 0);
      PlayObject.SendSocket(@PlayObject.m_DefMsg, EncodeBuffer(@ClientItem, SizeOf(TClientItem)));
      {if StdItem.NeedIdentify = 1 then
        AddGameDataLog('10' + #9 +
          PlayObject.m_sMapName + #9 +
          IntToStr(PlayObject.m_nCurrX) + #9 +
          IntToStr(PlayObject.m_nCurrY) + #9 +
          PlayObject.m_sCharName + #9 +
          //UserEngine.GetStdItemName(UserItem.wIndex) + #9 +
          StdItem.Name + #9 +
          IntToStr(UserItem.MakeIndex) + #9 +
          '1' + #9 +
          m_sCharName); }
      Result := True;
    end else begin
      PlayObject.SendMsg(Self, RM_USERITEMRESTORE_FAIL, 0, 1, 0, 0, '');
      exit;
    end;
  end else begin
    PlayObject.SendMsg(Self, RM_USERITEMRESTORE_FAIL, 0, 0, 0, 0, '');
    exit;
  end;
end;

procedure TMerchant.UserPriceDisassemble(PlayObject: TPlayObject; UserItem: pTUserItem); //阿己盒秦
var
  iPrice:Integer;
  StdItem:TItem;
begin
  iPrice := -1;
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem.DisassembleItem then
    iPrice := (StdItem.Grade * 3000) + (StdItem.NeedLevel * 1000);

  if (iPrice >= 0) then begin
    PlayObject.SendMsg(Self,RM_PRICEDISASSEMBLE,0,iPrice,0,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_PRICEDISASSEMBLE,0,0,0,0,'');
  end;
end;

function TMerchant.UserDisassembleItem(PlayObject: TPlayObject; UserItem: pTUserItem):Boolean;
  function CheckDisassemble(UserItem: pTUserItem):Boolean;
  var
    StdItem:TItem;
  begin
    Result:=True;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) then begin
      if (not StdItem.DisassembleItem) or (UserItem.btValue[19] > 0) then begin
        PlayObject.SendDefMessage(SM_DISASSEMBLE_FAIL,2,0,0,0,'');
        Result:=False;
        exit;
      end;
    end;
  end;
var
  nn, j, I, nPrice, nCount, nMode:integer;
  StdItem:TItem;
  list: TStringList;
  UserItem1 : pTUserItem;
  sCheckItemName : String;
  sCheckItemCount : integer;
  boot : Boolean;
  nRandom: integer;
begin
  Result:=False;
  nn := -1;
  nPrice := -1;
  nCount := 0;
  nMode := 0;
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

  if StdItem.StdMode in [5,6,90,99,19,20,21,22,24,26] then
   nMode := 1;
  if StdItem.StdMode in [10,11,12,15,62,64] then
   nMode := 2;

  if StdItem.DisassembleItem then
    list := GetDisassembleCondition (IntToStr(nMode), nRandom);
    nPrice := (StdItem.Grade * 3000) + (StdItem.NeedLevel * 1000);

  if (nPrice >= 0) and CheckDisassemble(UserItem) then begin
    if PlayObject.DecGold(nPrice) then begin
      if PlayObject.IsEnoughBag then begin
        if List <> nil then begin
          for j:= 0 to List.Count-1 do begin
            sCheckItemName := List[j];
            nCount := Random(StdItem.Grade + 1);
            for I := 0 to nCount do begin
              New(UserItem1);
              if UserEngine.CopyToUserItemFromName(sCheckItemName + IntToStr(Random(StdItem.Grade) + 1) ,UserItem1) and (Random(nRandom) = 0) then begin
                PlayObject.AddItemToBag(UserItem1,boot);
                if boot then
                PlayObject.SendAddItem(UserItem1, 1);
                WeightChanged();
              end;
            end;
          end;
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('40' + #9 +
            PlayObject.m_sMapName + #9 +
            IntToStr(PlayObject.m_nCurrX) + #9 +
            IntToStr(PlayObject.m_nCurrY) + #9 +
            PlayObject.m_sCharName + #9 +
            StdItem.Name + '(' + GetGoldStr(nPrice) + '傈)'+ #9 +
            IntToStr(UserItem.MakeIndex) + #9 +
            '1' + #9 +
            m_sCharName + #9 + '[觉醒分解]');
          nn := 0;
          Result:=True;
        end else nn := 2;
      end else nn := 3;
    end else nn := 1;
  end else nn := 2;

  if nn = 0 then begin
    PlayObject.SendMsg(Self,RM_DISASSEMBLE_OK,nn,PlayObject.m_nGold,0,0,'');
  end else
    PlayObject.SendDefMessage(SM_DISASSEMBLE_FAIL,nn,0,0,0,'');
end;

function TMerchant.UserDismantleItem(PlayObject: TPlayObject; UserItem: pTUserItem):Boolean;      //老馆盒秦
  function CheckDisassemble(UserItem: pTUserItem):Boolean;
  var
    StdItem:TItem;
  begin
    Result:=True;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) then begin
      if (not StdItem.DisassembleItem) or (UserItem.btValue[19] > 0) then begin      //扁埃力 措咯袍 豪牢 盒秦 陛瘤
        PlayObject.SendMsg(Self,SM_DISMANTLE_FAIL,2,0,0,0,'');
        Result:=False;
        exit;
      end;
    end;
  end;
var
  nn, j, I, nPrice, nCount:integer;
  StdItem:TItem;
  list: TStringList;
  UserItem1 : pTUserItem;
  sCheckItemName, sUserItemName : String;
  sCheckItemCount : integer;
  boot : Boolean;
begin
  Result:=False;
  nn := -1;
  nPrice := -1;
  sUserItemName := '';
  nCount := 0;
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

  if (StdItem <> nil) and StdItem.DisassembleItem and (UserItem.btValue[19] = 0) then begin
    sUserItemName := UserEngine.GetStdItemName(UserItem.wIndex);
    List := GetDismantleCondition (sUserItemName, nPrice);
  end;

  if (nPrice >= 0) and CheckDisassemble(UserItem) then begin
    if PlayObject.DecGold(nPrice) then begin
    if PlayObject.IsEnoughBag then begin
      if List <> nil then begin
        for j:= 0 to List.Count-1 do begin
          sCheckItemName := List[j];
          sCheckItemCount := integer(List.Objects[j]);

          nCount := Random(sCheckItemCount);
          for I := 0 to nCount - 1 do begin
            New(UserItem1);
            if UserEngine.CopyToUserItemFromName(sCheckItemName,UserItem1) then begin
              PlayObject.AddItemToBag(UserItem1,boot);
              if boot then
              PlayObject.SendAddItem(UserItem1,1);
              WeightChanged();
            end;
          end;
        end;
        PlayObject.SysMsg('物品' + sUserItemName + '已被分解。',c_BlueWhite,t_Hint);
        if StdItem.NeedIdentify = 1 then
           AddGameDataLog('39' +  #9 +
           PlayObject.m_sMapName + #9 +
           IntToStr(PlayObject.m_nCurrX) + #9 +
           IntToStr(PlayObject.m_nCurrY) + #9 +
           PlayObject.m_sCharName + #9 +
           StdItem.Name+'('+ IntToStr(UserItem.Amount)+')' + #9 +
           IntToStr(UserItem.MakeIndex) + #9 +
           sSTRING_GOLDNAME + ' ' + IntToStr(nPrice) + #9 +
           m_sCharName + #9 + '[一般分解]');
        nn := 0;
        Result:=True;
      end else nn := 2;
    end else nn := 3;
    end else nn := 1;
  end else nn := 2;

  if nn = 0 then begin
    PlayObject.SendMsg(Self,RM_DISMANTLE_OK,nn,PlayObject.m_nGold,0,0,'');
  end else
    PlayObject.SendDefMessage(SM_DISMANTLE_FAIL,nn,0,0,0,'');
end;


procedure TMerchant.UserPriceDismantle(PlayObject: TPlayObject; UserItem: pTUserItem);
var
  iPrice:Integer;
  StdItem:TItem;
  list: TStringList;
  sUserItemName:String;
begin
  iPrice := -1;
  sUserItemName := '';
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem.DisassembleItem then begin
    sUserItemName := UserEngine.GetStdItemName(UserItem.wIndex);
    list := GetDismantleCondition (sUserItemName, iPrice);
  end;

  if (iPrice >= 0) then begin
    PlayObject.SendMsg(Self,RM_PRICEDISMANTLE,0,iPrice,0,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_PRICEDISMANTLE,0,0,0,0,'');
  end;
end;


// 力炼 酒捞袍 犁丰 汲疙.
procedure TMerchant.SayMakeItemMaterials (whocret: TPlayObject; selstr: string);     //力炼胶媚
var
   rmsg: string;
begin
   rmsg := '@';

   // selstr is itemname...
   rmsg := rmsg + selstr;

   GotoLable(whocret,rmsg,False);
end;

//////////////////////////////////////////
// 力炼 包访 惑荐
//////////////////////////////////////////
const
   MAX_SOURCECNT    = 6;
   //---------------//
   // 炼扒 搬苞
   COND_FAILURE     = 0;
   COND_GEMFAIL     = 1;
   COND_SUCCESS     = 2;
   COND_MINERALFAIL = 3;
   COND_NOMONEY     = 4;
   COND_BAGFULL     = 5;
   //---------------//
   // 荐龋籍 殿鞭
   GSG_ERROR       = 0;
   GSG_SMALL       = 1; //(家)
   GSG_MEDIUM      = 2; //(吝)
   GSG_LARGE       = 3; //(措)
   GSG_GREATLARGE  = 4; //(漂)
   GSG_SUPERIOR    = 5; //瘤籍 or 脚籍
   //---------------//
//////////////////////////////////////////

// 酒捞袍 力炼 橇肺矫廉.
procedure TMerchant.UserManufactureItem (whocret: TPlayObject; itmname: string);   //力炼胶媚
const
   MAKEPRICE = 100;
var
   i, j, rcode: integer;
   done, boot: Boolean;
   list: TList;
   pu, newpu: PTUserItem;
   pstd: TItem;
   sMakeItemName: string;
   sItemMakeIndex: array [1..MAX_SOURCECNT] of string;
   sItemName: array [1..MAX_SOURCECNT] of string;
   sItemCount: array [1..MAX_SOURCECNT] of string;
   iCheckResult: Integer;
   iMakePrice, iMakeCount: integer;
   strSourceLog: string;

begin
   iMakePrice := MAKEPRICE;
   strSourceLog := '';

   try
      // RightStr := GetValidStr3 (OrgStr, LeftStr of Separator, Separator);
      itmname := GetValidStr3 (itmname, sMakeItemName, ['/']);
      for i:= 1 to MAX_SOURCECNT do begin
         itmname := GetValidStr3 (itmname, sItemMakeIndex[i], [':']);
         itmname := GetValidStr3 (itmname, sItemName[i], [':']);
         itmname := GetValidStr3 (itmname, sItemCount[i], ['/']);
      end;
      ///////////////////////////////////////////
{$IFDEF DEBUG}   //sonmg
      whocret.SysMsg (sMakeItemName, 0);
      for i := 1 to MAX_SOURCECNT do begin
         whocret.SysMsg (sItemMakeIndex[i] + sItemName[i] + sItemCount[i], 0);
         //力炼 犁丰 肺弊
         strSourceLog := strSourceLog + sItemName[i];
         if i <> MAX_SOURCECNT then
            strSourceLog := strSourceLog + ','; //付瘤阜 犁丰啊 酒聪搁 ','甫 嘿牢促.
      end;
{$ENDIF}
      ///////////////////////////////////////////

      done := FALSE;
      rcode := 1;
      for i:=0 to m_GoodsList.Count-1 do begin
         if done then break;
         list := m_GoodsList[i];
         pu := PTUserItem (list[0]);
         pstd := UserEngine.GetStdItem (pu.wIndex);
         if pstd <> nil then begin
            if pstd.Name = sMakeItemName then begin
               //酒捞袍 父靛绰 厚侩档 窃膊 眉农茄促.
               iCheckResult := CheckMakeItemCondition (whocret, sMakeItemName, sItemMakeIndex, sItemName, sItemCount, iMakePrice, iMakeCount);
               if iCheckResult <> COND_NOMONEY then begin
                  if iCheckResult = COND_SUCCESS then begin
                     for j:=0 to iMakeCount-1 do begin
                        new (newpu);
                        UserEngine.CopyToUserItemFromName (sMakeItemName, newpu);

                        if whocret.AddItemToBag(newpu,boot) then begin
                           whocret.DecGold( iMakePrice );
                           if boot then
                           whocret.SendAddItem (newpu,1);  //父甸扁 己傍...



                           if pstd.NeedIdentify = 1 then
                           //肺弊巢辫
                           AddGameDataLog('2'#9 + //力累_
                                       whocret.m_sMapName + ''#9 +
                                       IntToStr(whocret.m_nCurrX) + ''#9 +
                                       IntToStr(whocret.m_nCurrY) + ''#9 +
                                       whocret.m_sCharName + ''#9 +
                                       UserEngine.GetStdItemName (newpu.wIndex) + ''#9 +
                                       IntToStr(newpu.MakeIndex) + ''#9 +
                                       '1'#9 +
                                       m_sCharName + ''#9 + '[升级成功]');
                           rcode := 0;
                        end else begin
                           Dispose (newpu);
                           rcode := 2;
                        end;
                     end;
                  end else if iCheckResult = COND_GEMFAIL then begin
                     // 焊苛 力炼 角菩矫俊档 捣篮 狐廉 唱埃促.
//                     whocret.Gold := whocret.Gold - iMakePrice;
                     whocret.DecGold( iMakePrice );
                     whocret.GoldChanged;

                      if pstd.NeedIdentify = 1 then
                     //肺弊巢辫
                       AddGameDataLog('2'#9 + //力累_角菩
                                 whocret.m_sMapName + ''#9 +
                                 IntToStr(whocret.m_nCurrX) + ''#9 +
                                 IntToStr(whocret.m_nCurrY) + ''#9 +
                                 whocret.m_sCharName + ''#9 +
                                 'FAIL'#9 +
                                 '0'#9 +
                                 '1'#9 +
                                 m_sCharName+ ''#9 + '[升级失败]');
                     rcode := 5;
                  end else if iCheckResult = COND_MINERALFAIL then begin
                     rcode := 6;
                  end else if iCheckResult = COND_BAGFULL then begin
                     rcode := 7;
                  end else
                     rcode := 4;
               end else
                  rcode := 3;
            end;
         end;
      end;

      if rcode = 0 then begin
         whocret.SendMsg (self, RM_MAKEDRUG_SUCCESS, 0, whocret.m_nGold, 0, 0, '');
      end else begin
         whocret.SendMsg (self, RM_MAKEDRUG_FAIL, 0, rcode, 0, 0, '');
      end;
   except
      MainOutMessage ('[Exception] TMerchant.UserManufactureItem');
   end;
end;

////////////////////////////////////////////////////////////
// 荐龋籍狼 殿鞭阑 掘绢郴绰 窃荐.
function TMerchant.GetGradeOfGuardStoneByName ( strGuardStone: string ): Integer;    //力炼胶媚
begin
   Result := GSG_ERROR;
      //扁夯蔼
      if CompareBackLStr(strGuardStone, '(小)', 4) = TRUE then begin
         Result := GSG_SMALL;
      end else if CompareBackLStr(strGuardStone, '(中)', 4) = TRUE then begin
         Result := GSG_MEDIUM;
      end else if CompareBackLStr(strGuardStone, '(大)', 4) = TRUE then begin
         Result := GSG_LARGE;
      end else if CompareBackLStr(strGuardStone, '(特)', 4) = TRUE then begin
         Result := GSG_GREATLARGE;
      end else if CompareBackLStr(strGuardStone, '完美', 4) = TRUE then begin
         Result := GSG_SUPERIOR;
      end else if CompareBackLStr(strGuardStone, '无瑕', 4) = TRUE then begin
         Result := GSG_SUPERIOR;
      end else begin
         Result := GSG_ERROR;
      end;
end;

////////////////////////////////////////////////////////////
// 力炼措惑俊 鞘夸茄 格废苞 傈价罐篮 格废阑 厚背窍咯
// 炼扒俊 嘎绰瘤 酒囱瘤 眉农窍绊 酒捞袍阑 昏力窍绰 窃荐.
function TMerchant.CheckMakeItemCondition (hum: TPlayObject; itemname: string; sItemMakeIndex, sItemName, sItemCount: array of string; var iPrice, iMakeCount: Integer): Integer;      //力炼胶媚
var
   list: TStringList;
   k, i, j, icnt: integer;
   sourcecount, counteritmcount, itemp: integer;
   sourcemindex: integer;
   sourcename: string;
   condition: Integer;
   dellist: TStringList;
   pu: PTUserItem;
   ps: TItem;
   iGuardStoneGrade: integer;
   iProbability: Integer;
   fTemporary: Real;
   iRequiredGuardStoneGrade: Integer;            //力炼胶媚
   iSumOutfitAbil, iOutfitGrade: Integer;        //力炼胶媚
   // 货肺款 List
   sNewName: array [0..MAX_SOURCECNT-1] of string;
   sNewCount: array [0..MAX_SOURCECNT-1] of string;
   sNewMIndex: array [0..MAX_SOURCECNT-1] of string;
   iListDoubleCount: array [0..MAX_SOURCECNT-1] of Integer;
   checkcount: integer;
   bCheckMIndex: Boolean;
   // 胶农赋飘 巩磊凯 沥狼
   strPendant, strGuardStone, strGuardStone15, strGuardStoneXLHigher : string;
   delitemname : string;
begin
   strPendant := '';
   strGuardStone := '';
   strGuardStone15 := '';
   strGuardStoneXLHigher := '';
   //扁夯蔼
   strPendant := '<首饰>';
   strGuardStone := '<守护石>';
   strGuardStone15 := '<守护石15>';
   strGuardStoneXLHigher := '<守护石(特)以上>';

   iProbability := 0;
   fTemporary := 0;
   condition := COND_FAILURE;
   iRequiredGuardStoneGrade := 0;  //荐龋籍 眠啊 犬伏 殿鞭
   iOutfitGrade := 0;   //厘脚备 眠啊 犬伏 殿鞭
   iSumOutfitAbil := 0;
   iGuardStoneGrade := GSG_ERROR;

   list := GetMakeItemCondition (itemname, iPrice);

   // 啊规芒 咯盒狼 傍埃 犬牢
   if hum.IsEnoughBag = FALSE then begin
      Result := COND_BAGFULL;
      hum.SysMsg('你的背包满了，制造失败。', c_Red,t_Hint);
      exit;
   end;

   if list <> nil then begin
      // 傈价巩磊凯 牢磊荐焊促 农搁 救凳.
      if list.Count > MAX_SOURCECNT then
         MainOutMessage ('[Caution!] list.Count Overflow in TMerchant.UserManufactureItem');

      condition := COND_SUCCESS;

      // 焊苛 鸥涝 八荤(荐龋籍狼 辆幅肺 八荤 sonmg)
      for j:= 0 to list.Count-1 do begin
         if UPPERCASE(list[j]) = strGuardStone then begin
            iRequiredGuardStoneGrade := 1;  // 鸥涝 A
         end else if UPPERCASE(list[j]) = strGuardStoneXLHigher then begin
            iRequiredGuardStoneGrade := 2;  // 鸥涝 B
         end else if UPPERCASE(list[j]) = strGuardStone15 then begin
            iRequiredGuardStoneGrade := 3;  // 鸥涝 C (荐龋籍篮 老馆, 堡籍鉴档 15捞惑)
         end;
      end;

      //------ 犁丰 八荤 ------//
      // 1.傈价巩磊凯捞 啊规芒俊 葛滴 乐绰瘤(Name苞 MakeIndex) 八荤
      // 乐栏搁 List俊辑 秦寸 酒捞袍 捞抚苞 MakeIndex 诀单捞飘(StdMode曼炼)
      for k:=0 to MAX_SOURCECNT-1 do begin  //傈价巩磊凯
         sourcemindex := Str_ToInt(sItemMakeIndex[k], 0);
         sourcename := sItemName[k];
         sourcecount := Str_ToInt(sItemCount[k], 0);

         for i:=0 to hum.m_ItemList.Count-1 do begin
            pu := PTUserItem (hum.m_ItemList[i]);
            // 酒捞袍 捞抚 厚背
            if sItemName[k] = UserEngine.GetStdItemName(pu.wIndex) then begin
               ps := UserEngine.GetStdItem (pu.wIndex);
               if ps <> nil then
               begin
                  // 墨款飘 酒捞袍.
                  if (ps.StdMode in [0,1,3,45,46]) then begin
                     if pu.amount < sourcecount then begin
                        sourcecount := sourcecount - pu.amount;
                     end else begin
                        itemp := sourcecount;
                        sourcecount := _MAX(0, itemp - pu.amount);
                     end;

                     if sourcecount <= 0 then begin
                        for j:= 0 to list.Count-1 do begin
                           if list[j] = sourcename then begin
                              sNewMIndex[j] := sItemMakeIndex[k];
                              sNewName[j] := sourcename;
                              sNewCount[j] := sItemCount[k];
                           end;
                        end;

                        break;
                     end;
                  end else begin
                     // MakeIndex 厚背
                     if sourcemindex = pu.MakeIndex then begin
                        for j:= 0 to list.Count-1 do begin
                           if list[j] = sourcename then begin
                              // 鞍篮 酒捞袍捞 滴俺 捞惑 乐阑 版快 墨款飘 刘啊
                              if sNewName[j] = sourcename then begin
                                 sNewCount[j] := IntToStr( Str_ToInt(sNewCount[j], 0) + 1 );
                              end else begin
                                 sNewCount[j] := sItemCount[k];
                                 sNewMIndex[j] := sItemMakeIndex[k];
                              end;

                              sNewName[j] := sourcename;
                           end;
                        end;

                        // <厘脚备> <荐龋籍> <荐龋籍(漂)捞惑> 酒捞袍捞 乐栏搁
                        // 傈价巩磊凯俊 乐绰 酒捞袍阑 list俊 殿废茄促.
                        if ps.StdMode in [19,20,21, 22,23, 24,26] then begin
                           for j:= 0 to list.Count-1 do begin
                              if UPPERCASE(list[j]) = strPendant then begin
                                 sNewMIndex[j] := sItemMakeIndex[k];
                                 sNewName[j] := sourcename;
                                 sNewCount[j] := sItemCount[k];

                                 // 厘脚备 颇鲍,付仿,档仿 醚钦俊 蝶扼 殿鞭 搬沥...
                                 iSumOutfitAbil := HIBYTE(ps.DC) + HIBYTE(ps.MC) + HIBYTE(ps.SC);
                                 if ps.StdMode in [22,23] then begin //馆瘤
                                    if iSumOutfitAbil <= 3 then
                                       iOutfitGrade := 0   //啊焙
                                    else if iSumOutfitAbil = 4 then
                                       iOutfitGrade := 1   //唱焙
                                    else
                                       iOutfitGrade := 2;   //促焙
                                 end else if ps.StdMode in [24,26] then begin //迫骂
                                    if HIBYTE(ps.DC) > 0 then begin //颇鲍 嘿篮 迫骂
                                       if iSumOutfitAbil = 1 then
                                          iOutfitGrade := 0   //啊焙
                                       else if iSumOutfitAbil = 2 then
                                          iOutfitGrade := 1   //唱焙
                                       else
                                          iOutfitGrade := 2;   //促焙
                                    end else begin
                                       if iSumOutfitAbil = 1 then
                                          iOutfitGrade := 0   //啊焙
                                       else if iSumOutfitAbil in [2,3] then
                                          iOutfitGrade := 1   //唱焙
                                       else
                                          iOutfitGrade := 2;   //促焙
                                    end;
                                 end else begin //格吧捞
                                    if iSumOutfitAbil <= 3 then
                                       iOutfitGrade := 0   //啊焙
                                    else if iSumOutfitAbil in [4,5] then
                                       iOutfitGrade := 1   //唱焙
                                    else
                                       iOutfitGrade := 2;   //促焙
                                 end;
                              end;
                           end;
                        end;
                        if ps.StdMode = 63 then begin
                           // 荐龋籍 殿鞭阑 掘绢辰促.
                           iGuardStoneGrade := GetGradeOfGuardStoneByName( sourcename );

                           for j := 0 to list.Count-1 do begin
                              if iGuardStoneGrade < GSG_GREATLARGE then begin
                                 if (UPPERCASE(list[j]) = strGuardStone) or (UPPERCASE(list[j]) = strGuardStone15) then begin
                                    sNewMIndex[j] := sItemMakeIndex[k];
                                    sNewName[j] := sourcename;
                                    sNewCount[j] := sItemCount[k];
                                 end;
                              end else if iGuardStoneGrade >= GSG_GREATLARGE then begin
                                 if (UPPERCASE(list[j]) = strGuardStone) or (UPPERCASE(list[j]) = strGuardStone15) or (UPPERCASE(list[j]) = strGuardStoneXLHigher) then begin
                                    sNewMIndex[j] := sItemMakeIndex[k];
                                    sNewName[j] := sourcename;
                                    sNewCount[j] := sItemCount[k];
                                 end;
                              end else begin
                                 // 荐龋籍 捞抚捞 捞惑窍促搁 Error : 犬牢秦 毫具窃.
                                 MainOutMessage('[Caution!] TMerchant.UserManufactureItem iGuardStoneGrade = GSG_ERROR');
                              end;
                           end;
                        end;

                        //------ 堡籍 鉴档 八荤 ------//
                        if ps.StdMode = 43 then begin //堡籍
                           if iRequiredGuardStoneGrade = 1 then begin  // 鸥涝 A
                              if pu.Dura < 11500 then begin // 鉴档 12
                                 condition := COND_MINERALFAIL;
                              end;
                           end else if iRequiredGuardStoneGrade = 2 then begin  // 鸥涝 B
                              if pu.Dura < 14500 then begin // 鉴档 15
                                 condition := COND_MINERALFAIL;
                              end;
                           end else if iRequiredGuardStoneGrade = 3 then begin  // 鸥涝 C
                              if pu.Dura < 14500 then begin // 鉴档 15
                                 condition := COND_MINERALFAIL;
                              end;
                           end;
                        end;

                        dec (sourcecount);  //肮荐 皑家..
                     end;
                  end;
               end;//if ps <> nil then
            end;
         end;

         if sourcecount > 0 then begin
            condition := COND_FAILURE;  //肮荐 固崔捞搁 炼扒 救嘎澜埃林.
            break;
         end;
      end;



      // 2.货肺款 List啊 list狼 炼扒俊 父练窍绰瘤 八荤
      // 割 俺鳖瘤 父甸 荐 乐绰瘤 犬牢
      if (condition = COND_SUCCESS) or (condition = COND_MINERALFAIL) then begin
         checkcount := list.Count;
         for k:=0 to list.Count-1 do begin  //货肺款 List
            sourcename := sNewName[k];
            sourcecount := Str_ToInt(sNewCount[k], 0);

            if (sourcename = list[k]) and (sourcecount >= Integer(list.Objects[k])) then begin
               iListDoubleCount[k] := sourcecount div Integer(list.Objects[k]);
               Dec(checkcount);
            end else if ( (UPPERCASE(list[k]) = strPendant) or (UPPERCASE(list[k]) = strGuardStone) or (UPPERCASE(list[k]) = strGuardStone15)
            or (UPPERCASE(list[k]) = strGuardStoneXLHigher) ) and (sourcecount >= Integer(list.Objects[k])) then begin
               iListDoubleCount[k] := sourcecount div Integer(list.Objects[k]);
               Dec(checkcount);
            end;
         end;

         if checkcount > 0 then
            condition := COND_FAILURE;  //肮荐 固崔捞搁 炼扒 救嘎澜埃林.
      end;

      //------ 犁丰 昏力 ------//
      // 啊规芒俊辑 货肺款 List俊 秦寸窍绰 酒捞袍阑 昏力茄促.
      // 父甸 荐 乐绰 俺荐父怒 昏力窍绊 唱赣瘤绰 昏力窍瘤 臼澜...
      if condition = COND_SUCCESS then begin
         //------ 父甸 荐 乐绰 俺荐 拌魂(弥家蔼) -----//
         iMakeCount := iListDoubleCount[0];
         for k:=0 to list.Count-1 do begin
            if iMakeCount > iListDoubleCount[k] then
               iMakeCount := iListDoubleCount[k];
//               hum.SysMsg(IntToStr(iListDoubleCount[k]), 1);
         end;
//            hum.SysMsg('父靛绰 酒捞袍 俺荐 : ' + IntToStr(iMakeCount), 2);

         // 鞘夸茄 陛傈捞 乐绰瘤 犬牢
         if (hum.m_nGold < iPrice * iMakeCount) then begin
            Result := COND_NOMONEY;
            exit;
         end;

         // 啊规芒 咯盒捞 乐绰瘤 犬牢 (sonmg 2004/02/21)
         if hum.m_Itemlist.Count + iMakeCount > MAXBAGITEM then begin
            Result := COND_BAGFULL;
            hum.SysMsg('你的背包满了，制造失败。', c_Red,t_Hint);
            exit;
         end;

         //檬扁拳
         dellist := nil;

         // 老窜 货肺款 List 亲格 公炼扒 昏力
         // 力炼绰 父靛绰 酒捞袍 俺荐父怒 Loop.
         // => 墨款飘绰 list狼 墨款飘父怒 昏力
         // ==> 墨款飘 酒捞袍捞 酒囱单 2俺 捞惑 乐绰 版快绰 MakeIndex甫
         //     傈价府胶飘(sMakeItemIndex)俊辑 曼炼茄促.
         //
         // 舅酒笛 巴 : 荐龋籍捞唱 厘脚备啊 器窃等 力炼绰 滴 俺 捞惑 茄波锅俊
         // 力炼啊 救登绊 唱吝俊 棵妨柳 酒捞袍栏肺 力炼啊 等促.(sonmg 2003/12/19)
         for j:=0 to iMakeCount-1 do begin
            for k:=0 to list.Count-1 do begin  //货肺款 List
               sourcemindex := Str_ToInt(sNewMIndex[k], 0);
               sourcename := sNewName[k];
               // 墨款飘绰 list狼 墨款飘父怒 昏力(鞘夸茄 父怒父 昏力)
               sourcecount := Integer(list.Objects[k]);
               counteritmcount := Integer(list.Objects[k]);

               for i:=hum.m_ItemList.Count-1 downto 0 do begin
                  pu := PTUserItem (hum.m_ItemList[i]);
                  if sourcecount > 0 then begin
                     if sourcename = UserEngine.GetStdItemName(pu.wIndex) then begin
                        ps := UserEngine.GetStdItem (pu.wIndex);
                        if ps <> nil then
                        begin
                           //墨款飘 酒捞袍.
                           if (ps.StdMode in [0,1,3,45,46]) then begin
                              if pu.Amount < counteritmcount then begin
                                 counteritmcount := counteritmcount - pu.Amount;
                                 pu.Amount := 0;
                              end else begin
                                 itemp := counteritmcount;
                                 counteritmcount := _MAX(0, itemp - pu.Amount);
                                 pu.Amount := pu.Amount - itemp;
                              end;

                              if pu.Amount > 0 then begin
                                 hum.SendMsg(self, RM_COUNTERITEMCHANGE, 0, pu.MakeIndex, pu.Amount, 0, FilterStdShowName(ps,ps.Name));
                                 continue;
                              end;
                           end else begin
                              // MakeIndex 厚背
                              if pu.MakeIndex <> Str_ToInt(sNewMIndex[k], 0) then begin
                                 bCheckMIndex := FALSE;
                                 for icnt:= 0 to MAX_SOURCECNT-1 do begin
                                    if pu.MakeIndex = Str_ToInt(sItemMakeIndex[icnt], 0) then begin
                                       bCheckMIndex := TRUE;
                                       break;
                                    end;
                                 end;

                                 if bCheckMIndex = FALSE then
                                    continue;
                              end;
                           end;

                           //老馆 酒捞袍 肚绰 墨款飘 酒捞袍 昏力
                           if dellist = nil then dellist := TStringList.Create;
                           delitemname := UserEngine.GetStdItemName(pu.wIndex);
                           dellist.AddObject(delitemname, TObject(PTUserItem (hum.m_ItemList[i]).MakeIndex));

                           if ps.NeedIdentify = 1 then
                           //肺弊巢辫
                           AddGameDataLog('2'#9 + //力炼昏_
                                       hum.m_sMapName + ''#9 +
                                       IntToStr(hum.m_nCurrX) + ''#9 +
                                       IntToStr(hum.m_nCurrY) + ''#9 +
                                       hum.m_sCharName + ''#9 +
                                       delitemname + ''#9 +
                                       IntToStr(PTUserItem (hum.m_ItemList[i]).MakeIndex) + ''#9 +
                                       '1'#9 +
                                       m_sCharName + ''#9 + '[升级材料使用]');

                           Dispose (PTUserItem(hum.m_ItemList[i]));
                           hum.m_ItemList.Delete (i);
                           dec (sourcecount);
                        end;//if ps <> nil then
                     end;
                  end else
                     break;
               end;
            end;
         end;
         if dellist <> nil then //dellist篮  RM_DELITEMS俊辑 Free凳.
            hum.SendMsg (self, RM_SENDDELITEMLIST, 0, integer(dellist), 0, 0, '');

         // 傍烹(1瞒) 焊苛 力炼 犬伏 利侩...
         if iRequiredGuardStoneGrade > 0 then begin
            fTemporary := (hum.m_dBodyLuck - hum.m_nPkPoint) / 250;

            if iRequiredGuardStoneGrade = 1 then
               iProbability := 50
            else if iRequiredGuardStoneGrade = 2 then
               iProbability := 50
            else if iRequiredGuardStoneGrade = 3 then
               iProbability := 50;

            if fTemporary >= 100 then
               iProbability := iProbability + 5
            else if (fTemporary < 100) and (fTemporary >= 50) then
               iProbability := iProbability + 3;

            // 荐龋籍喊 眠啊 犬伏 利侩 (sonmg 2003/12/19)
            case iGuardStoneGrade of
               GSG_SMALL         : iProbability := iProbability + 5;
               GSG_MEDIUM        : iProbability := iProbability + 10;
               GSG_LARGE         : iProbability := iProbability + 15;
               GSG_GREATLARGE    : iProbability := iProbability + 30;
               GSG_SUPERIOR      : iProbability := iProbability + 50;
            end;
         end;

         // 2瞒 焊苛 力炼 犬伏 利侩...
         if (iRequiredGuardStoneGrade = 1) or (iRequiredGuardStoneGrade = 3) then begin
            // 焊苛 鸥涝A 力炼 犬伏 利侩...
            if iOutfitGrade = 0 then begin
               iProbability := iProbability + 10;
            end else if iOutfitGrade = 1 then begin
               iProbability := iProbability + 20;
            end else if iOutfitGrade = 2 then begin
               iProbability := iProbability + 40;
            end;



            if Random(100) < iProbability then begin
               condition := COND_SUCCESS;
            end else begin
               condition := COND_GEMFAIL;
            end;
         end else if iRequiredGuardStoneGrade = 2 then begin
            // 焊苛 鸥涝B 力炼 犬伏 利侩...
            // 2瞒 犬伏 绝澜.



            if Random(100) < iProbability then begin
               condition := COND_SUCCESS;
            end else begin
               condition := COND_GEMFAIL;
            end;
         end;
      end;
   end;



   if condition = COND_SUCCESS then begin
      // 力炼 己傍 肺弊 -> 绵家
 //     MainOutMessage( '[Manufacture Success 力炼己傍] ' + hum.UserName + ' ' + itemname + '(' + IntToStr(iMakeCount) + '俺)');

   end;

   Result := condition;
end;


procedure TMerchant.ClientQueryRepairCost(PlayObject: TPlayObject;
  UserItem: pTUserItem); //004A1F30
var
  nPrice,nRepairPrice:Integer;
begin
  nPrice:=GetUserPrice(PlayObject,GetUserItemPrice(UserItem));
  if (nPrice > 0) and (UserItem.DuraMax > UserItem.Dura) then begin
    if UserItem.DuraMax > 0 then begin
      nRepairPrice:=ROUND(nPrice div 3 / UserItem.DuraMax * (UserItem.DuraMax - UserItem.Dura));
    end else begin
      nRepairPrice:=nPrice;
    end;
    if (PlayObject.m_sScriptLable = sSUPERREPAIR) then begin
      if m_boS_repair then nRepairPrice:=nRepairPrice * g_Config.nSuperRepairPriceRate{3}
      else nRepairPrice:= -1;
    end else begin
      if not m_boRepair then nRepairPrice:= -1;        
    end;
    PlayObject.SendMsg(Self,RM_SENDREPAIRCOST,0,nRepairPrice,0,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_SENDREPAIRCOST,0,-1,0,0,'');
  end;    
end;

procedure TMerchant.ClientQueryWakeCost(PlayObject: TPlayObject;
  UserItem: pTUserItem);
var
  nPrice, nRepairPrice: Integer;
  StdItem:TItem;
begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    nPrice := 5000 * StdItem.Grade * UserItem.btValue[18];
    if (nPrice > 0) then begin
      nRepairPrice := nPrice;
    end;
    if not m_boWake then nRepairPrice := -1;
    PlayObject.SendMsg(Self, RM_SENDWAKECOST, 0, nRepairPrice, 0, 0, '');
  end else begin
    PlayObject.SendMsg(Self, RM_SENDWAKECOST, 0, -1, 0, 0, '');
  end;
end;

procedure TMerchant.ClientQueryWakeReStore(PlayObject: TPlayObject;
  UserItem: pTUserItem);
var
  nPrice, I, nRepairPrice: Integer;
  StdItem:TItem;
begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    nPrice := (5000 * StdItem.Grade) + (StdItem.NeedLevel * 1000);
    if (nPrice > 0) then begin
      nRepairPrice := nPrice;
    end;
    if not m_boReStore then nRepairPrice := -1;
    PlayObject.SendMsg(Self, RM_SENDRESTORECOST, 0, nRepairPrice, 0, 0, '');
  end else begin
    PlayObject.SendMsg(Self, RM_SENDRESTORECOST, 0, -1, 0, 0, '');
  end;
end;

function TMerchant.ClientRepairItem(PlayObject: TPlayObject;
  UserItem: pTUserItem): Boolean; //004A2024
var
  nPrice,nRepairPrice:Integer;
  StdItem:Titem;
  boCanRepair:Boolean;
begin
  Result:=False;
  boCanRepair:=True;
  if (PlayObject.m_sScriptLable = sSUPERREPAIR) and not m_boS_repair  then begin
    boCanRepair:=False;
  end;
  if (PlayObject.m_sScriptLable <> sSUPERREPAIR) and not m_boRepair  then begin
    boCanRepair:=False;
  end;
  if PlayObject.m_sScriptLable = '@fail_s_repair' then begin
    SendMsgToUser(PlayObject,'Sorry, I cant special repair this item\ \ \<Main/@main>');
    PlayObject.SendMsg(Self,RM_USERREPAIRITEM_FAIL,0,0,0,0,'');
    exit;
  end;
  nPrice:=GetUserPrice(PlayObject,GetUserItemPrice(UserItem));
  if PlayObject.m_sScriptLable = sSUPERREPAIR then begin
    nPrice:=nPrice * g_Config.nSuperRepairPriceRate{3};
  end;
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    if boCanRepair and (nPrice > 0) and (UserItem.DuraMax > UserItem.Dura) and (StdItem.StdMode <> 43) then begin
      if UserItem.DuraMax > 0 then begin
        nRepairPrice:=ROUND(nPrice div 3 / UserItem.DuraMax * (UserItem.DuraMax - UserItem.Dura));
      end else begin
        nRepairPrice:=nPrice;
      end;
      if PlayObject.DecGold(nRepairPrice) then begin
        if m_boCastle or g_Config.boGetAllNpcTax then begin        //荐府沁阑锭 技陛叭扁 傈眉
          if m_Castle <> nil then begin
            TUserCastle(m_Castle).IncRateGold(nRepairPrice);
          end else
          if g_Config.boGetAllNpcTax then begin               //荐府沁阑锭 技陛叭扁 傈眉
            g_CastleManager.IncRateGold(g_Config.nUpgradeWeaponPrice);
          end;
        end;
        if PlayObject.m_sScriptLable = sSUPERREPAIR then begin
         if not StdItem.boCanSpecialRepair then begin  //荐府阂啊
         PlayObject.SendMsg(Self,RM_USERREPAIRITEM_FAIL,0,0,0,0,'');
         exit;
         end;
          UserItem.Dura:=UserItem.DuraMax;
          PlayObject.SendMsg(Self,RM_USERREPAIRITEM_OK,0,PlayObject.m_nGold,UserItem.Dura,UserItem.DuraMax,'');
          GotoLable(PlayObject,sSUPERREPAIROK,False);
        end else begin
         if (not StdItem.boCanRepair) or (UserItem.btValue[19] = 1) then begin   //荐府阂啊   //措咯袍 老馆荐府 x
          PlayObject.SendMsg(Self,RM_USERREPAIRITEM_FAIL,0,0,0,0,'');
          exit;
         end;
          Dec(UserItem.DuraMax,(UserItem.DuraMax - UserItem.Dura) div g_Config.nRepairItemDecDura{30});
          UserItem.Dura:=UserItem.DuraMax;
          PlayObject.SendMsg(Self,RM_USERREPAIRITEM_OK,0,PlayObject.m_nGold,UserItem.Dura,UserItem.DuraMax,'');
          GotoLable(PlayObject,sREPAIROK,False);
        end;
        Result:=True;
      end else PlayObject.SendMsg(Self,RM_USERREPAIRITEM_FAIL,0,0,0,0,''); //004A2238
    end else PlayObject.SendMsg(Self,RM_USERREPAIRITEM_FAIL,0,0,0,0,'');  //004A2253
  end;
end;


function TMerchant.ClientCheckWeapon(PlayObject: TPlayObject;   //力访 犬牢
  UserItem: pTUserItem): Boolean; //004A2024
  procedure CheckWeaponUpgradeStatus(UserItem:pTUserItem); //004C27C0
  begin
    if (UserItem.btValue[0] + UserItem.btValue[1] + UserItem.btValue[2]) < g_Config.nUpgradeWeaponMaxPoint then begin
      case UserItem.btValue[10] of
        1: UserItem.wIndex:=0;
        10..13: UserItem.btValue[0]:=UserItem.btValue[0] + UserItem.btValue[10] - 9;
        20..23: UserItem.btValue[1]:=UserItem.btValue[1] + UserItem.btValue[10] - 19;
        30..33: UserItem.btValue[2]:=UserItem.btValue[2] + UserItem.btValue[10] - 29;
      end;
    end else UserItem.wIndex:=0;
    UserItem.btValue[10]:=0;
  end;
var
  StdItem:Titem;
begin
  Result:=False;
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
   if (StdItem.StdMode in [5,6,90,99]) and (UserItem.btValue[10] > 0) then begin
     CheckWeaponUpgradeStatus(UserItem);
     if UserItem.wIndex = 0 then begin
       PlayObject.SysMsg(g_sTheWeaponBroke,c_Red,t_Hint);
       PlayObject.SendMsg(Self,RM_USERCHECKWEAPON_UPFAIL,0,0,0,0,'');
         if StdItem.NeedIdentify = 1 then
                  AddGameDataLog('21' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[升级 失败]');

     end else begin
       PlayObject.SysMsg(sTheWeaponRefineSuccessfull,c_Green,t_Hint);
     //  PlayObject:=TPlayObject(Self);
       PlayObject.SendUpdateItem(UserItem);
       PlayObject.SendAddItem(UserItem,1);
       PlayObject.SendMsg(Self,RM_USERCHECKWEAPON_OK,0,0,0,0,'');
         if StdItem.NeedIdentify = 1 then
                    AddGameDataLog('20' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     StdItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[升级 成功]');

     end;
     Result:=True;
   end else PlayObject.SendMsg(Self,RM_USERCHECKWEAPON_FAIL,0,0,0,0,'');
  end;
end;


procedure TMerchant.ClientRequestGTList(PlayObject:TPlayObject;PageCount:byte);
var
  sSendMsg:String;
  GTCount:byte;
  i:integer;
  ClientGT:TClientGT;
  GT:TTerritory;
begin
  sSendMsg:='';
  GTCount := 0;
  for i:= PageCount * 10 to g_GuildTerritory.GTlist.Count -1 do begin
    GT:= g_GuildTerritory.GTlist[i];
    if GT = nil then continue;
    ClientGT:=GT.GetClientGT();
    if ClientGT.Number <> 0 then begin
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientGT,SizeOf(TClientGT)) + '/';
      inc(GTCount);
      if GTCount = 10 then break;
    end;
  end;
  PlayObject.m_DefMsg:=MakeDefaultMsg(SM_GTLIST,Integer(Self),PageCount,GTCount, (g_GuildTerritory.GTlist.Count div 10) - 1);
  PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
end;

procedure TMerchant.ClientRequestDecoList(PlayObject:TPlayObject;PageCount:byte);       //惑泅酒捞袍
var
  sSendMsg:String;
  i,Count:integer;
  Decoration:TDecoItem;
begin
  sSendMsg:='';
  count:=0;
  for i:= PageCount * 12 to g_DecorationList.Count -1 do begin
    if g_DecorationList[i] = nil then continue;
    Decoration.Appr:= pTDecoItem(g_DecorationList[i]).Appr;  //yes i know there should be a simple one line edit here but i just couldnt remember wether it was @ or ^lol
    Decoration.Name:= pTDecoItem(g_DecorationList[i]).Name;
    Decoration.Price:= pTDecoItem(g_DecoRationList[i]).Price;
    sSendMsg:=sSendMsg + EncodeBuffer(@Decoration,SizeOf(TDecoItem)) + '/';
    inc(Count);
    if Count = 12 then break;
  end;
  PlayObject.m_DefMsg:=MakeDefaultMsg(SM_GTDECOLIST,Integer(Self),PageCount,Count,g_DecorationList.Count div 12);
  PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
end;


procedure TMerchant.ClientBuyGT(PlayObject:TPlayObject;GTNumber:byte);
var
  GT:TTerritory;
  value:integer;
begin
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你还没有加入行会。');
    exit;
  end;
  if PlayObject.IsGuildMaster = False then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有行会掌门才可以申请行会庄园。');
    exit;
  end;
  if TGuild(PlayObject.m_MyGuild).m_Territory <> nil then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你只能拥有一个行会庄园。');
    exit;
  end;
  GT:= g_GuildTerritory.FindGuildTerritory(GTNumber);
  if GT = nil then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'此编号行会庄园不存在。');
    exit;
  end;
  if GT.ForSale = True then begin
    value:=GT.ForSaleGold;
    if PlayObject.m_nGold >= value then begin
      if GT.Buy(TGuild(PlayObject.m_MyGuild).sGuildName) then begin
        PlayObject.DecGold(value);
        PlayObject.GoldChanged();
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'恭喜，你现在拥有一个行会庄园。');
      end else
        PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'此编号行会庄园当前不能使用。');
    end else
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'金币不足。');
  end else
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'此编号行会庄园当前不能使用。');
end;

procedure TMerchant.ClientBuyDecoItem(PlayObject:TPlayObject;Appr:integer);
var
  UserItem:pTUserItem;
  starttime:DWord;
  Decoration:pTDecoItem;
  i:integer;
  boot:Boolean;
begin
  Decoration:= nil;
  for i:= 0 to g_DecorationList.Count -1 do begin
    if pTDecoItem(g_DecorationList[i]).Appr = Appr then begin
      Decoration:=g_DecorationList[i];
      break;
    end;
  end;
  if Decoration = nil then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'没有找到装饰物品。');
    exit;
  end;
  if PlayObject.IsEnoughBag = False then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你的背包满了。');
    exit;
  end;
  New(UserItem);
  if UserEngine.CopyToUserItemFromName(g_Config.sGTDeco,UserItem) = False then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'Your server host is stupid and didnt bother configuring his server');
    exit;//shouldnt really happen but
  end;
  if (PlayObject.m_nGold < Decoration.Price) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'金币不足。');
    exit;
  end;
  starttime:=DateTimeToUnix(now());
  UserItem.MakeIndex:=GetItemNumberEx();
  UserItem.btValue[0] := TTerritory(m_PEnvir.m_GuildTerritory).TerritoryNumber;
  UserItem.btValue[5] := LoByte(Appr);
  UserItem.btValue[6] := HiByte(Appr);
  UserItem.btValue[1] := LoByte(LoWord(starttime));
  UserItem.btValue[2] := HiByte(LoWord(starttime));
  UserItem.btValue[3] := LoByte(HiWord(starttime));
  UserItem.btValue[4] := HiByte(HiWord(starttime));
  UserItem.Dura := Appr;
  if PlayObject.AddItemToBag(UserItem,boot) then begin
  if boot then
    PlayObject.SendAddItem(UserItem,1);
    PlayObject.DecGold(Decoration.Price);
    PlayObject.GoldChanged();
  end else begin
    dispose(UserItem);
  end;
end;

procedure TMerchant.ClientRequestBBSMsgList(PlayObject:TPlayObject;PageCount:byte);    //厘盔霸矫魄
var
  sSendMsg:String;
  i,Count:integer;
  BBSMsg:TBBSMSG;
  MsgList:TList;
  TotalCount:integer;
begin
  sSendMsg:='';
  count:=0;
  TotalCount:=0;
  MsgList:=FrmDB.LoadBBSMsgList(TGuild(PlayObject.m_MyGuild).sGuildName,PageCount);
  if MsgList.Count > 0 then begin
    for i:= 0 to MsgList.Count -1 do begin
      if (I < PageCount * 10) or (I > (PageCount + 1) * 10) then
        continue;
      BBSMsg.index:=pTBBSMSG(MsgList[i]).index;
      BBSMsg.Sticky:=pTBBSMSG(MsgList[i]).Sticky;
      BBSMsg.Poster:=pTBBSMSG(MsgList[i]).Poster;
      BBSMsg.Msg:=pTBBSMSG(MsgList[i]).Msg;
      BBSMsg.MasterIndex := pTBBSMSG(MsgList[i]).MasterIndex;
      sSendMsg:=sSendMsg + EncodeBuffer(@BBSMsg,SizeOf(TBBSMSG)) + '/';
      inc(Count);
      if Count = 10 then break;
    end;
    TotalCount:= (MsgList.count - 1) div 10;
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_BBSMSGLIST,Integer(Self),PageCount,Count,TotalCount);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end else begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_BBSMSGLIST,Integer(Self),PageCount,0,TotalCount);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
  for i:=0  to MsgList.Count -1 do begin
    dispose(MsgList[i]);
  end;
  MsgList.Free;

end;

procedure TMerchant.ClientRequestBBSMsg(PlayObject:TPlayObject;Index:integer);      //厘盔霸矫魄
var
  sSendMsg:String;
  BBSMsg:pTBBSMSGL;
  GuildLeader:integer;
begin
  sSendMsg:='';
  if (PlayObject.m_MyGuild = nil) or (m_PEnvir.m_GuildTerritory = nil) or (TGuild(PlayObject.m_MyGuild).sGuildName <> TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有拥有行会庄园的行会成员才可以使用。');
    exit;
  end;
  BBSMsg:=FrmDB.LoadBBSMsg(Index);
  if (BBSMSG = nil) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'无法确认的帖子。');
    exit;
  end;
  GuildLeader:=0;
  if PlayObject.IsGuildMaster then
    GuildLeader:=1;
  sSendMsg:= EncodeString(BBSMSG.Poster) + '/' + EncodeString(BBSMSG.Msg) + '/';
  PlayObject.m_DefMsg:=MakeDefaultMsg(SM_BBSMSG,BBSMSG.MasterIndex,GuildLeader,0,0);
  PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  dispose(BBSMsg);
end;

procedure TMerchant.ClientDeleteBBSMsg(PlayObject:TPlayObject;Index:integer);        //厘盔霸矫魄
var
  sSendMsg:String;
  BBSMsg:pTBBSMSGL;
begin
  sSendMsg:='';
  if (PlayObject.m_MyGuild = nil) or (m_PEnvir.m_GuildTerritory = nil) or (TGuild(PlayObject.m_MyGuild).sGuildName <> TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有拥有行会庄园的行会成员才可以使用。');
    exit;
  end;

  if Not PlayObject.IsGuildMaster then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有行会掌门才可以删除这篇文章。');
    exit;
  end;

  BBSMsg:=FrmDB.LoadBBSMsg(Index);
  if (BBSMSG = nil) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'无法确认的帖子。');
    exit;
  end;
  FrmDB.DeleteBBSMsg(BBSMsg.index);
  PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'帖子已经被删除。');
  dispose(BBSMsg);
end;

procedure TMerchant.ClientPostBBSMsg(PlayObject:TPlayObject;sMsg:String;boSticky:boolean; MasterPost:integer);     //厘盔霸矫魄
var
  BBSMsg:pTBBSMSGL;
begin
  if (PlayObject.m_MyGuild = nil) or (m_PEnvir.m_GuildTerritory = nil) or (TGuild(PlayObject.m_MyGuild).sGuildName <> TTerritory(m_PEnvir.m_GuildTerritory).GuildName) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'只有拥有行会庄园的行会成员才可以使用。');
    exit;
  end;
  if (boSticky = True) and (PlayObject.IsGuildMaster = False) then begin
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(Self),0,0,'你不是行会掌门。');
    exit;
  end;
  new(BBSMsg);
  BBSMsg.Sticky:=boSticky;
  BBSMsg.Poster:=PlayObject.m_sCharName;
  BBSMsg.Msg := trim(sMsg);
  BBSMsg.MasterIndex := MasterPost;
  FrmDB.SaveBBSMsg(BBSMsg,TGuild(PlayObject.m_MyGuild).sGuildName);
  dispose(BBSMsg);
end;


procedure TMerchant.ClearScript;
begin
  m_boBuy:=False;
  m_boSell:=False;
  m_boLockUp := False;
  m_boMakeNewHero         := False;
  m_boWakeUp := False;
  m_boWake := False;
  m_boReStore := False;
  m_boDisassemble:=False;
  m_boDismantle:=False;
  m_boMakeDrug:=False;
  m_boMakeGem:=False;
  m_boPrices:=False;
  m_boStorage:=False;           //芒绊
  m_boUpgradenow:=False;
  m_boCheckWeapon:=False;
  m_boGetBackupgnow:=False;
  m_boRepair:=False;
  m_boS_repair:=False;
  m_boUseItemName:=False;
  inherited;  
end;

procedure TMerchant.LoadUpgradeList;//004A006C
var
  I: Integer;
begin
  for I := 0 to m_UpgradeWeaponList.Count - 1 do begin
    Dispose(pTUpgradeInfo(m_UpgradeWeaponList.Items[I]));
  end;    // for
  m_UpgradeWeaponList.Clear;
  try
    //FrmDB.LoadUpgradeWeaponRecord(m_sCharName,m_UpgradeWeaponList);
    FrmDB.LoadUpgradeWeaponRecord(m_sScript + '-' + m_sMapName,m_UpgradeWeaponList);
  except
    MainOutMessage('Failure in loading upgradinglist - ' + m_sCharName);
  end;
end;


procedure TMerchant.SendCustemMsg(PlayObject: TPlayObject; sMsg: String);
begin
  inherited;

end;

procedure TMerchant.SendCustemMsg2(PlayObject: TPlayObject; sMsg: String);
begin
  inherited;

end;
//清除临时文件，包括交易库存，价格表
procedure TMerchant.ClearData;
var
  I,II: Integer;
  UserItem:pTUserItem;
  ItemList:TList;
  ItemPrice:pTItemPrice;
ResourceString
  sExceptionMsg = '[Exception] TMerchant::ClearData';
begin
try
  for I := 0 to m_GoodsList.Count - 1 do begin
    ItemList:=TList(m_GoodsList.Items[I]);
    for II:=0 to ItemList.Count - 1 do begin
      UserItem:=ItemList.Items[II];
      Dispose(UserItem);
    end;
    ItemList.Free;
   // SaveNPCData();
  end;
  m_GoodsList.Clear;
  for I := 0 to m_ItemPriceList.Count - 1 do begin
    ItemPrice:=m_ItemPriceList.Items[I];
    Dispose(ItemPrice);
  end;
  m_ItemPriceList.Clear;
  SaveNPCData();
except
  on e: Exception do begin
    MainOutMessage(sExceptionMsg);
    MainOutMessage(E.Message);
  end;
end;
end;


procedure TMerchant.ChangeUseItemName(PlayObject: TPlayObject;
  sLabel,sItemName: String);
var
  sWhere:String;
  btWhere:Byte;
  UserItem:pTUserItem;
  sMsg:String;
begin
  if not PlayObject.m_boChangeItemNameFlag then begin
    exit;
  end;
  PlayObject.m_boChangeItemNameFlag:=False;

  sWhere:=Copy(sLabel,length(sUSEITEMNAME) + 1,length(sLabel) - length(sUSEITEMNAME));
  btWhere:=Str_ToInt(sWhere,-1);
  if btWhere in [Low(THumanUseItems)..High(THumanUseItems)] then begin
    UserItem:=@PlayObject.m_UseItems[btWhere];
    if UserItem.wIndex = 0 then begin
      sMsg:=format(g_sYourUseItemIsNul,[GetUseItemName(btWhere)]);
      PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(PlayObject),0,0,sMsg);
      exit;
    end;

    if UserItem.btValue[11] = 1 then begin
      ItemUnit.DelCustomItemName(UserItem.MakeIndex,UserItem.wIndex);
    end;
      
    if sItemName <> '' then begin
      ItemUnit.AddCustomItemName(UserItem.MakeIndex,UserItem.wIndex,sItemName);
      UserItem.btValue[11]:=1;
    end else begin
      ItemUnit.DelCustomItemName(UserItem.MakeIndex,UserItem.wIndex);
      UserItem.btValue[11]:=0;
    end;
    ItemUnit.SaveCustomItemName();
    PlayObject.SendMsg(PlayObject,RM_SENDUSEITEMS,0,0,0,0,'');
    PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(PlayObject),0,0,'');
  end;
end;

{ TTrainer }

constructor TTrainer.Create;//004A385C
begin
  inherited;
  strucktime:=GetTickCount();
  n56C:=0;
  n570:=0;
end;

destructor TTrainer.Destroy;
begin

  inherited;
end;

function TTrainer.Operate(ProcessMsg: pTProcessMessage):Boolean; //004A38C4
begin
  case ProcessMsg.wIdent of
        RM_10101:
         begin
            if (Integer(ProcessMsg.BaseObject) = RM_STRUCK) and (ProcessMsg.wParam <> 0) then begin
               Inc(n56C,ProcessMsg.wParam);
               strucktime:=GetTickCount();
               Inc (n570);
               ProcessSayMsg ('攻击力为 ' + IntToStr(ProcessMsg.wParam) + ', 平均值为 ' + IntToStr(n56C div n570));
            end;
         end;
      RM_MAGSTRUCK:
         begin
            if (ProcessMsg.nParam1 <> 0) then begin
               n56C := n56C + ProcessMsg.nParam1;
               strucktime:=GetTickCount();
               Inc (n570);
               ProcessSayMsg ('攻击力为 ' + IntToStr(ProcessMsg.nParam1) + ', 平均值为 ' + IntToStr(n56C div n570));
            end;
         end;
      RM_MAGSTRUCK_MINE:
         begin
            if (ProcessMsg.nParam1 <> 0) then begin
               n56C := n56C + ProcessMsg.nParam1;
               strucktime:=GetTickCount();
               Inc (n570);
               ProcessSayMsg ('攻击力为 ' + IntToStr(ProcessMsg.nParam1) + ', 平均值为 ' + IntToStr(n56C div n570));
            end;
         end;
      RM_HEMORRHAGE_STRUCK:
         begin
            if (ProcessMsg.nParam1 <> 0) then begin
               strucktime:=GetTickCount();
               ProcessSayMsg ('血风击持续伤害 ' + IntToStr(ProcessMsg.nParam1));
            end;
         end;
      RM_THUNDER_STRUCK:
         begin
            if (ProcessMsg.nParam1 <> 0) then begin
               strucktime:=GetTickCount();
               ProcessSayMsg ('俘虎棍法持续伤害 ' + IntToStr(ProcessMsg.nParam1));
            end;
         end;
   end;
end;

procedure TTrainer.Run; //004A3A18
begin
  if n570 > 0 then begin
    if (GetTickCount - strucktime) > 3 * 1000 then begin
      ProcessSayMsg('总的攻击力为: ' + IntToStr(n56C) + ', 总平均攻击力为: ' + IntToStr(n56C div n570));
      n570:=0;
      n56C:=0;
    end;
  end;
  inherited;
end;


{ TNormNpc }

procedure TNormNpc.ActionOfAddNameDateList(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I:Integer;
  LoadList:TStringList;
  boFound:Boolean;
  sListFileName,sLineText,sHumName,sDate:String;
begin
  sListFileName:=g_Config.sEnvirDir + m_sPath + QuestActionInfo.sParam1;
  LoadList:=TStringList.Create;
  if FileExists(sListFileName) then begin
    try
      LoadList.LoadFromFile(sListFileName);
    except
      MainOutMessage('读取失败.... => ' + sListFileName);
    end;
  end;
  boFound:=False;
  for I := 0 to LoadList.Count - 1 do begin
    sLineText:=Trim(LoadList.Strings[i]);
    sLineText:=GetValidStr3(sLineText,sHumName,[' ',#9]);
    sLineText:=GetValidStr3(sLineText,sDate,[' ',#9]);
    if CompareText(sHumName,PlayObject.m_sCharName) = 0 then begin
      LoadList.Strings[I]:=PlayObject.m_sCharName + #9 + DateToStr(Date);
      boFound:=True;
      break;
    end;
  end;
  if not boFound then
    LoadList.Add(PlayObject.m_sCharName + #9 + DateToStr(Date));

  try
    LoadList.SaveToFile(sListFileName);
  except
    MainOutMessage('保存失败.... => ' + sListFileName);
  end;
  LoadList.Free;
end;

procedure TNormNpc.ActionOfDelNameDateList(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  LoadList:TStringList;
  sLineText,sListFileName,sHumName,sDate:String;
  boFound:Boolean;
begin
  sListFileName:=g_Config.sEnvirDir + m_sPath + QuestActionInfo.sParam1;
  LoadList:=TStringList.Create;
  if FileExists(sListFileName) then begin
    try
      LoadList.LoadFromFile(sListFileName);
    except
      MainOutMessage('读取失败.... => ' + sListFileName);
    end;
  end;
  boFound:=False;
  for I := 0 to LoadList.Count - 1 do begin
    sLineText:=Trim(LoadList.Strings[i]);
    sLineText:=GetValidStr3(sLineText,sHumName,[' ',#9]);
    sLineText:=GetValidStr3(sLineText,sDate,[' ',#9]);
    if CompareText(sHumName,PlayObject.m_sCharName) = 0 then begin
      LoadList.Delete(i);
      boFound:=True;
      break;
    end;
  end;
  if boFound then begin
    try
      LoadList.SaveToFile(sListFileName);
    except
      MainOutMessage('保存失败.... => ' + sListFileName);
    end;
  end;
  LoadList.Free;
end;

procedure TNormNpc.ActionOfAddSkill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  Magic:pTMagic;
  UserMagic:pTUserMagic;
  nLevel:Integer;
begin
  nLevel:=_MIN(3,Str_ToInt(QuestActionInfo.sParam2,0));
  Magic := UserEngine.FindMagic(QuestActionInfo.sParam1);

  if Magic <> nil then begin
    if not PlayObject.IsTrainingSkill(Magic.wMagicId) then begin
      New(UserMagic);
      UserMagic.MagicInfo  := Magic;
      UserMagic.wMagIdx    := Magic.wMagicId;
      UserMagic.btKey      := 0;
      UserMagic.btLevel    := nLevel;
      UserMagic.nTranPoint := 0;
      PlayObject.m_MagicList.Add(UserMagic);
      PlayObject.SendAddMagic(UserMagic);
      PlayObject.RecalcAbilitys();
      if g_Config.boShowScriptActionMsg then begin
        PlayObject.SysMsg(Magic.sMagicName + '成功学习技能。', c_Green, t_Hint);
      end;
        
    end;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_ADDSKILL);
  end;


end;


procedure TNormNpc.ActionOfAddHeroSkill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I, nMaxLevel: Integer;
  Magic: pTMagic;
  UserMagic: pTUserMagic;
  nLevel: Integer;
  boIsHero: Boolean;
  nMagicCount: Integer;
  HeroObject: THeroObject;
begin
  Magic := UserEngine.FindHeroMagic(QuestActionInfo.sParam1);
  if Magic <> nil then begin

    nLevel := _MIN(nMaxLevel, Str_ToInt(QuestActionInfo.sParam2, 0));

    if not THeroObject(PlayObject.m_MyHero).IsTrainingSkill(Magic.wMagicId) then begin
      New(UserMagic);
      UserMagic.MagicInfo := Magic;
      UserMagic.wMagIdx := Magic.wMagicId;
      UserMagic.btKey := 0;
      UserMagic.btLevel := nLevel;
      UserMagic.nTranPoint := 0;
      THeroObject(PlayObject.m_MyHero).m_MagicList.Add(UserMagic);
      THeroObject(PlayObject.m_MyHero).SendAddMagic(UserMagic);
      THeroObject(PlayObject.m_MyHero).RecalcAbilitys();
     // TPlayObject(PlayObject.m_MyHero).SysMsg('康旷捞 ' + Magic.sMagicName + '捞(啊) 荐访登菌嚼聪促.', c_Green, t_Hint);
    end;
  end else begin
    ScriptActionError(PlayObject, '', QuestActionInfo, sSC_ADDHEROSKILL);
  end;
end;

procedure TNormNpc.ActionOfAutoAddGameGold(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo; nPoint, nTime: Integer);
begin
  if CompareText(QuestActionInfo.sParam1,'START') = 0 then begin
    if (nPoint > 0) and (nTime > 0) then begin
      PlayObject.m_nIncGameGold:=nPoint;
      PlayObject.m_dwIncGameGoldTime:=LongWord(nTime * 1000);
      PlayObject.m_dwIncGameGoldTick:=GetTickCount();
      PlayObject.m_boIncGameGold:=True;
      exit;
    end;
  end;
  if CompareText(QuestActionInfo.sParam1,'STOP') = 0 then begin
    PlayObject.m_boIncGameGold:=False;
    exit;
  end;
  ScriptActionError(PlayObject,'',QuestActionInfo,sSC_AUTOADDGAMEGOLD);
end;

//SETAUTOGETEXP 时间 点数 是否安全区 地图号
procedure TNormNpc.ActionOfAutoGetExp(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nTime,nPoint:Integer;
  boIsSafeZone:Boolean;
  sMap:String;
  Envir:TEnvirnoment;
begin
  Envir:=nil;
  nTime:=Str_ToInt(QuestActionInfo.sParam1,-1);
  nPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  boIsSafeZone:=QuestActionInfo.sParam3[1] = '1';
  sMap:=QuestActionInfo.sParam4;
  if sMap <> '' then begin
    Envir:=g_MapManager.FindMap(sMap);
  end;
    

  if (nTime <= 0) or (nPoint <= 0) or ((sMap <> '') and (Envir = nil)) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SETAUTOGETEXP);
    exit;
  end;
  PlayObject.m_boAutoGetExpInSafeZone:=boIsSafeZone;
  PlayObject.m_AutoGetExpEnvir:=Envir;
  PlayObject.m_nAutoGetExpTime:=nTime * 1000;
  PlayObject.m_nAutoGetExpPoint:=nPoint;
end;

procedure TNormNpc.ActionOfAutoSubGameGold(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo; nPoint, nTime: integer);
begin
  if CompareText(QuestActionInfo.sParam1,'START') = 0 then begin
    if (nPoint > 0) and (nTime > 0) then begin
      PlayObject.m_nDecGameGold:=nPoint;
      PlayObject.m_dwDecGameGoldTime:=LongWord(nTime * 1000);
      PlayObject.m_dwDecGameGoldTick:=0;
      PlayObject.m_boDecGameGold:=True;
      exit;
    end;
  end;
  if CompareText(QuestActionInfo.sParam1,'STOP') = 0 then begin
    PlayObject.m_boDecGameGold:=False;
    exit;
  end;
  ScriptActionError(PlayObject,'',QuestActionInfo,sSC_AUTOSUBGAMEGOLD);

end;

procedure TNormNpc.ActionOfChangeExp(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nExp:LongWord; //18/08 Damian - nExp changed from Integer.
  cMethod:Char;
begin
  nExp:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nExp < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEEXP);
    exit;
  end;
    
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
        if nExp >= 0 then begin
          PlayObject.m_Abil.Exp:=nExp;
          PlayObject.SendMsg(Self,RM_ABILITY,0,0,0,0,'');
      end;
    end;
    '-': begin
      if PlayObject.m_Abil.Exp > nExp then begin
        Dec(PlayObject.m_Abil.Exp,nExp);
      end else begin
        PlayObject.m_Abil.Exp:=0;
      end;
      PlayObject.SendMsg(Self,RM_ABILITY,0,0,0,0,'');
    end;
    '+': begin
      PlayObject.GetExp(nExp);
      {
      if PlayObject.m_WAbil.Exp + nExp < PlayObject.m_WAbil.MaxExp then begin
        dwInt:=nExp;
      end else
         dwInt:=PlayObject.m_WAbil.MaxExp-PlayObject.m_WAbil.Exp;
      Inc(PlayObject.m_WAbil.Exp,dwInt);
      PlayObject.SendMsg(PlayObject,RM_WINEXP,0,dwInt,0,0,'');
      }
    end;
  end;
end;

procedure TNormNpc.ActionOfChangeHairStyle(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nHair:Integer;
begin
  nHair:=Str_ToInt(QuestActionInfo.sParam1,-1);
  if (QuestActionInfo.sParam1 <> '') and (nHair >= 0) then begin
    PlayObject.m_btHair:=nHair;
    PlayObject.FeatureChanged;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_HAIRSTYLE);
  end;    
end;

procedure TNormNpc.ActionOfChangeJob(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  FameGrade: integer;
begin

  if CompareLStr(QuestActionInfo.sParam1,sWarrior,Length(sWarrior)) then PlayObject.m_btJob:=jWarr;
  if CompareLStr(QuestActionInfo.sParam1,sWizard,Length(sWizard)) then PlayObject.m_btJob:=jWizard;
  if CompareLStr(QuestActionInfo.sParam1,sTaos,Length(sTaos)) then PlayObject.m_btJob:=jTaos;
  if CompareLStr(QuestActionInfo.sParam1,sAssassin,Length(sAssassin)) then PlayObject.m_btJob:=jAssassin;    //磊按
  if CompareLStr(QuestActionInfo.sParam1,sBonze,Length(sBonze)) then PlayObject.m_btJob:=jBonze;
  if CompareLStr(QuestActionInfo.sParam1,sUpWarr,Length(sUpWarr)) then PlayObject.m_btJob:=jUpWarr;
  if CompareLStr(QuestActionInfo.sParam1,sUpWiz,Length(sUpWiz)) then PlayObject.m_btJob:=jUpWiz;
  if CompareLStr(QuestActionInfo.sParam1,sUpTao,Length(sUpTao)) then PlayObject.m_btJob:=jUpTao;
  if CompareLStr(QuestActionInfo.sParam1,sUpAssa,Length(sUpAssa)) then PlayObject.m_btJob:=jUpAssa;    //殿急磊按
  if CompareLStr(QuestActionInfo.sParam1,sUpBonze,Length(sUpBonze)) then PlayObject.m_btJob:=jUpBoz;

  if PlayObject.m_btJob < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEJOB);
    exit;
  end;

  PlayObject.m_btJob:= PlayObject.m_btJob;
  PlayObject.RecalcAbilitys();
  PlayObject.HasLevelUp(0);
  PlayObject.FeatureChanged();

  PlayObject.SendMsg (self, RM_CHANGEFAMEPOINT, 0, m_Abil.KillPointCurr, 0, 0, PlayObject.GetFameName(FameGrade));
  PlayObject.SendMsg (self, RM_CHANGEFAMEPOINT2, 0, m_Abil.DeathPointCurr, 0, 0, PlayObject.GetFameName(FameGrade));

end;

procedure TNormNpc.ActionOfChangeJobUp(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  FameGrade: integer;
begin
 if (PlayObject.m_UseItems[U_WEAPON].wIndex = 0) and (PlayObject.m_UseItems[U_DRESS].wIndex = 0) and (PlayObject.m_UseItems[U_TIGER].wIndex = 0) then begin
  if CompareLStr(QuestActionInfo.sParam1,sWarrior,Length(sWarrior)) then PlayObject.m_btJob:=jWarr;
  if CompareLStr(QuestActionInfo.sParam1,sWizard,Length(sWizard)) then PlayObject.m_btJob:=jWizard;
  if CompareLStr(QuestActionInfo.sParam1,sTaos,Length(sTaos)) then PlayObject.m_btJob:=jTaos;
  if CompareLStr(QuestActionInfo.sParam1,sAssassin,Length(sAssassin)) then PlayObject.m_btJob:=jAssassin;    //磊按
  if CompareLStr(QuestActionInfo.sParam1,sBonze,Length(sBonze)) then PlayObject.m_btJob:=jBonze;
  if CompareLStr(QuestActionInfo.sParam1,sUpWarr,Length(sUpWarr)) then PlayObject.m_btJob:=jUpWarr;
  if CompareLStr(QuestActionInfo.sParam1,sUpWiz,Length(sUpWiz)) then PlayObject.m_btJob:=jUpWiz;
  if CompareLStr(QuestActionInfo.sParam1,sUpTao,Length(sUpTao)) then PlayObject.m_btJob:=jUpTao;
  if CompareLStr(QuestActionInfo.sParam1,sUpAssa,Length(sUpAssa)) then PlayObject.m_btJob:=jUpAssa;    //殿急磊按
  if CompareLStr(QuestActionInfo.sParam1,sUpBonze,Length(sUpBonze)) then PlayObject.m_btJob:=jUpBoz;

  if PlayObject.m_btJob < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEJOBUP);
    exit;
  end;

   PlayObject.m_btJob:= PlayObject.m_btJob;
   PlayObject.HasLevelUp2(0);
   PlayObject.RecalcAbilitys();
   PlayObject.FeatureChanged;

   PlayObject.SendMsg (self, RM_CHANGEFAMEPOINT, 0, m_Abil.KillPointCurr, 0, 0, PlayObject.GetFameName(FameGrade));
   PlayObject.SendMsg (self, RM_CHANGEFAMEPOINT2, 0, m_Abil.DeathPointCurr, 0, 0, PlayObject.GetFameName(FameGrade));

 end else begin
    PlayObject.SysMsg('当你装备衣服、武器和坐骑时不能羽化登仙。',c_Red,t_Hint);
 end;
end;

procedure TNormNpc.ActionOfChangeLevel(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  boChgOK:Boolean;
  nLevel:Integer;
  nLv:Integer;
  nOldLevel:Integer;
  cMethod:Char;
begin
  boChgOK:=False;
  nOldLevel:=PlayObject.m_Abil.Level;
  nLevel:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nLevel < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGELEVEL);
    exit;
  end;
    
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      if (nLevel > 0) and (nLevel <= MAXLEVEL) then begin
        PlayObject.m_Abil.Level:=nLevel;
        boChgOK:=True;
      end;
    end;
    '-': begin
      nLv:=_MAX(0,PlayObject.m_Abil.Level - nLevel);
      nLv:=_MIN(MAXLEVEL,nLv);
      PlayObject.m_Abil.Level:=nLv;
      boChgOK:=True;
    end;
    '+': begin
      nLv:=_MAX(0,PlayObject.m_Abil.Level + nLevel);
      nLv:=_MIN(MAXLEVEL,nLv);
      PlayObject.m_Abil.Level:=nLv;
      boChgOK:=True;
    end;
  end;
  if boChgOK then
    PlayObject.HasLevelUp(nOldLevel);
  
end;

procedure TNormNpc.ActionOfChangePkPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nPKPoint:Integer;
  nPoint:Integer;
  nOldPKLevel:Integer;
  cMethod:Char;
begin
  nOldPKLevel:=PlayObject.PKLevel;
  nPKPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nPKPoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEPKPOINT);
    exit;
  end;
    
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      if (nPKPoint >= 0) then begin
        PlayObject.m_nPkPoint:=nPKPoint;
      end;
    end;
    '-': begin
      nPoint:=_MAX(0,PlayObject.m_nPkPoint - nPKPoint);
      PlayObject.m_nPkPoint:=nPoint;
    end;
    '+': begin
      nPoint:=_MAX(0,PlayObject.m_nPkPoint + nPKPoint);
      PlayObject.m_nPkPoint:=nPoint;
    end;
  end;
  if nOldPKLevel <> PlayObject.PKLevel then
    PlayObject.RefNameColor;
end;

procedure TNormNpc.ActionOfClearMapMon(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  MonList:TList;
  Mon:TBaseObject;
  II:Integer;
begin
  MonList:=TList.Create;
  UserEngine.GetMapMonster(g_MapManager.FindMap(QuestActionInfo.sParam1),MonList);
  for II := 0 to MonList.Count - 1 do begin
    Mon:=TBaseObject(MonList.Items[II]);
    if Mon.m_Master <> nil then Continue;
    if GetNoClearMonList(Mon.m_sCharName) then Continue;
      
    Mon.m_boNoItem:=True;
    Mon.MakeGhost;
  end;
  MonList.Free;
end;

procedure TNormNpc.ActionOfClearNameList(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  LoadList:TStringList;
  sListFileName:String;
begin
  sListFileName:=g_Config.sEnvirDir + m_sPath + QuestActionInfo.sParam1;
  LoadList:=TStringList.Create;
  {
  if FileExists(sListFileName) then begin
    try
      LoadList.LoadFromFile(sListFileName);
    except
      MainOutMessage('loading fail.... => ' + sListFileName);
    end;
  end;
  }
  LoadList.Clear;
  try
    LoadList.SaveToFile(sListFileName);
  except
    MainOutMessage('saving fail.... => ' + sListFileName);
  end;
  LoadList.Free;
end;

procedure TNormNpc.ActionOfClearSkill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I:Integer;
  UserMagic:pTUserMagic;
begin
  for I:= PlayObject.m_MagicList.Count - 1 downto 0 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    PlayObject.SendDelMagic(UserMagic);
    Dispose(UserMagic);
    PlayObject.m_MagicList.Delete(I);
  end;
  PlayObject.RecalcAbilitys();
end;

procedure TNormNpc.ActionOfDelNoJobSkill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I:Integer;
  UserMagic:pTUserMagic;
begin
  for I:= PlayObject.m_MagicList.Count - 1 downto 0 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if UserMagic.MagicInfo.btJob <> PlayObject.m_btJob then begin
      PlayObject.SendDelMagic(UserMagic);
      Dispose(UserMagic);
      PlayObject.m_MagicList.Delete(I);
    end;
  end;
end;

procedure TNormNpc.ActionOfDelSkill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  sMagicName:String;
  Magic:pTMagic;
  UserMagic:pTUserMagic;
begin
  sMagicName:=QuestActionInfo.sParam1;

  Magic := UserEngine.FindMagic(sMagicName);
  if Magic = nil then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_DELSKILL);
    exit;
  end;
  for I := 0 to PlayObject.m_MagicList.Count - 1 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if UserMagic.MagicInfo = Magic then begin
      PlayObject.SendDelMagic(UserMagic);
      PlayObject.m_MagicList.Delete(I);
      Dispose(UserMagic);
      PlayObject.RecalcAbilitys();
      break;
    end;
  end;

end;

procedure TNormNpc.ActionOfGameGold(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nGameGold:Integer;
  nOldGameGold:Integer;
  cMethod:Char;
begin
  nOldGameGold:=PlayObject.m_nGameGold;
  nGameGold:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nGameGold < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_GAMEGOLD);
    exit;
  end;
    
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      if (nGameGold >= 0) then begin
        PlayObject.m_nGameGold:=nGameGold;
      end;
    end;
    '-': begin
      nGameGold:=_MAX(0,PlayObject.m_nGameGold - nGameGold);
      PlayObject.m_nGameGold:=nGameGold;
    end;
    '+': begin
      nGameGold:=_MAX(0,PlayObject.m_nGameGold + nGameGold);
      PlayObject.m_nGameGold:=nGameGold;
    end;
  end;
  //'%d'#9'%s'#9'%d'#9'%d'#9'%s'#9'%s'#9'%d'#9'%s'#9'%s'
  if g_boGameLogGameGold then begin
    AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEGOLD,
                                        PlayObject.m_sMapName,
                                        PlayObject.m_nCurrX,
                                        PlayObject.m_nCurrY,
                                        PlayObject.m_sCharName,
                                        g_Config.sGameGoldName,
                                        nGameGold,
                                        cMethod,
                                        m_sCharName,'[NPC]']));
  end;
  if nOldGameGold <> PlayObject.m_nGameGold then
    PlayObject.GoldChanged;
end;

procedure TNormNpc.ActionOfGamePoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nGamePoint:Integer;
  nOldGamePoint:Integer;
  cMethod:Char;
begin
  nOldGamePoint:=PlayObject.m_nGamePoint;
  nGamePoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nGamePoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_GAMEPOINT);
    exit;
  end;

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      if (nGamePoint >= 0) then begin
        PlayObject.m_nGamePoint:=nGamePoint;
      end;
    end;
    '-': begin
      nGamePoint:=_MAX(0,PlayObject.m_nGamePoint - nGamePoint);
      PlayObject.m_nGamePoint:=nGamePoint;
    end;
    '+': begin
      nGamePoint:=_MAX(0,PlayObject.m_nGamePoint + nGamePoint);
      PlayObject.m_nGamePoint:=nGamePoint;
    end;
  end;
  //'%d'#9'%s'#9'%d'#9'%d'#9'%s'#9'%s'#9'%d'#9'%s'#9'%s'
  if g_boGameLogGamePoint then begin
    AddGameDataLog(format(g_sGameLogMsg1,[LOG_GAMEPOINT,
                                        PlayObject.m_sMapName,
                                        PlayObject.m_nCurrX,
                                        PlayObject.m_nCurrY,
                                        PlayObject.m_sCharName,
                                        g_Config.sGamePointName,
                                        nGamePoint,
                                        cMethod,
                                        m_sCharName,'[NPC]']));
  end;
  if nOldGamePoint <> PlayObject.m_nGamePoint then
    PlayObject.GameGoldChanged;
end;

procedure TNormNpc.ActionOfChangePcPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nPCPoint:Integer;
  nOldPCPoint:Integer;
  cMethod:Char;
begin
  nOldPCPoint:=PlayObject.m_nPCPoint;
  nPCPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nPCPoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_PCPOINT);
    exit;
  end;

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      if (nPCPoint >= 0) then begin
        PlayObject.m_nPCPoint:=nPCPoint;
      end;
    end;
    '-': begin
      nPCPoint:=_MAX(0,PlayObject.m_nPCPoint - nPCPoint);
      PlayObject.m_nPCPoint:=nPCPoint;
    end;
    '+': begin
      nPCPoint:=_MAX(0,PlayObject.m_nPCPoint + nPCPoint);
      PlayObject.m_nPCPoint:=nPCPoint;
    end;
  end;

  if nOldPCPoint <> PlayObject.m_nPCPoint then
    PlayObject.PointChanged();;
end;

procedure TNormNpc.ActionOfLineMsg(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  sMsg:String;
begin
  sMsg:=GetLineVariableText(PlayObject,QuestActionInfo.sParam2);

  if PlayObject.m_PEnvir <> nil then
    sMsg := AnsiReplaceText(sMsg, '%m', PlayObject.m_PEnvir.sMapDesc)
  else sMsg := AnsiReplaceText(sMsg, '%m', '????');
  sMsg := AnsiReplaceText(sMsg, '%x', IntToStr(PlayObject.m_nCurrX));
  sMsg := AnsiReplaceText(sMsg, '%y', IntToStr(PlayObject.m_nCurrY));

  sMsg:=AnsiReplaceText(sMsg,'%s',PlayObject.m_sCharName);
  sMsg:=AnsiReplaceText(sMsg,'%d',m_sCharName);
  case QuestActionInfo.nParam1 of
    0: UserEngine.SendBroadCastMsg(sMsg,t_System);
    1: UserEngine.SendBroadCastMsg('(*) ' + sMsg,t_System);
    2: UserEngine.SendBroadCastMsg('[' + m_sCharName + ']' + sMsg,t_System);
    3: UserEngine.SendBroadCastMsg('[' + PlayObject.m_sCharName + ']' + sMsg,t_System);
    4: ProcessSayMsg(sMsg);
    5: PlayObject.SysMsg(sMsg,c_Red,t_Say);
    6: PlayObject.SysMsg(sMsg,c_Green,t_Say);
    7: PlayObject.SysMsg(sMsg,c_Blue,t_Say);
    8: PlayObject.SendGroupText('-' + sMsg);
    9: begin
      if PlayObject.m_MyGuild <> nil then begin
        TGuild(PlayObject.m_MyGuild).SendGuildMsg(sMsg);
        UserEngine.SendServerGroupMsg(SS_208,nServerIndex,TGuild(PlayObject.m_MyGuild).sGuildName + '/' + PlayObject.m_sCharName + '/' +sMsg);
      end;
    end;
    10 : UserEngine.SendMoveMsg(sMsg);
    11 : UserEngine.SendBroadTopMsg(sMsg);  //捞悼 皋矫瘤
    else begin
      ScriptActionError(PlayObject,'',QuestActionInfo,sSENDMSG);
    end;
  end;
end;

procedure TNormNpc.ActionOfMapTing(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin

end;


procedure TNormNpc.ActionOfMessageBox(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin
  PlayObject.SendMsg(Self,RM_MENU_OK,0,Integer(PlayObject),0,0,GetLineVariableText(PlayObject,QuestActionInfo.sParam1));
end;

procedure TNormNpc.ActionOfMission(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin
  if (QuestActionInfo.sParam1 <> '') and (QuestActionInfo.nParam2 > 0) and (QuestActionInfo.nParam3 > 0) then begin
    g_sMissionMap:=QuestActionInfo.sParam1;
    g_nMissionX:=QuestActionInfo.nParam2;
    g_nMissionY:=QuestActionInfo.nParam3;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MISSION);
  end;
end;

//MOBFIREBURN MAP X Y TYPE TIME POINT
procedure TNormNpc.ActionOfMobFireBurn(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  sMap:String;
  nX,nY,nType,nTime,nPoint:Integer;
  FireBurnEvent:TFireBurnEvent;
  Envir:TEnvirnoment;
  OldEnvir:TEnvirnoment;
begin
  sMap:=QuestActionInfo.sParam1;
  nX:=Str_ToInt(QuestActionInfo.sParam2,-1);
  nY:=Str_ToInt(QuestActionInfo.sParam3,-1);
  nType:=Str_ToInt(QuestActionInfo.sParam4,-1);
  nTime:=Str_ToInt(QuestActionInfo.sParam5,-1);
  nPoint:=Str_ToInt(QuestActionInfo.sParam6,-1);
  if (sMap = '') or (nX < 0) or (nY < 0) or (nType < 0) or (nTime < 0) or (nPoint < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MOBFIREBURN);
    exit;
  end;
  Envir:=g_MapManager.FindMap(sMap);
  if Envir <> nil then begin
    OldEnvir:=PlayObject.m_PEnvir;
    PlayObject.m_PEnvir:=Envir;
    FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY,nType,nTime * 1000,nPoint);
    g_EventManager.AddEvent(FireBurnEvent);
    PlayObject.m_PEnvir:=OldEnvir;
    exit;
  end;
  ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MOBFIREBURN);

end;

procedure TNormNpc.ActionOfMobPlace(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo;nX,nY,nCount,nRange:Integer);
var
  I:integer;
  nRandX,nRandY:Integer;
  Mon:TBaseObject;
begin
  for I := 0 to nCount - 1 do begin
    nRandX:=Random(nRange * 2 + 1) + (nX - nRange);
    nRandY:=Random(nRange * 2 + 1) + (nY - nRange);
    Mon:=UserEngine.RegenMonsterByName(g_sMissionMap,nRandX,nRandY,QuestActionInfo.sParam1);
    if Mon <> nil then begin
      Mon.m_boMission:=True;
      Mon.m_nMissionX:=g_nMissionX;
      Mon.m_nMissionY:=g_nMissionY;
    end else begin
      ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MOBPLACE);
      break;
    end;
  end;
end;

procedure TNormNpc.ActionOfRecallGroupMembers(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin

end;


procedure TNormNpc.ActionOfSetRankLevelName(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  sRankLevelName:String;
begin
  sRankLevelName:=QuestActionInfo.sParam1;
  if sRankLevelName = '' then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SETRANKLEVELNAME);
    exit;
  end;
  PlayObject.m_sRankLevelName:=sRankLevelName;      //珐农匙烙
  PlayObject.RefShowName;
end;


procedure TNormNpc.ActionOfSetScriptFlag(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  boFlag:Boolean;
  nWhere:Integer;
begin
  nWhere:=Str_ToInt(QuestActionInfo.sParam1,-1);
  boFlag:=Str_ToInt(QuestActionInfo.sParam2,-1) = 1;
  case nWhere of    //
    0: begin
      PlayObject.m_boSendMsgFlag:=boFlag;
      PlayObject.m_boSendMsgFlag1:=boFlag;
    end;
    1: begin
      PlayObject.m_boChangeItemNameFlag:=boFlag;
    end;
    else begin
      ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SETSCRIPTFLAG);
    end;
  end;
end;

procedure TNormNpc.ActionOfSkillLevel(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  Magic:pTMagic;
  UserMagic:pTUserMagic;
  nLevel:Integer;
  cMethod:Char;
begin
  nLevel:=Str_ToInt(QuestActionInfo.sParam3,0);
  if nLevel < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SKILLLEVEL);
    exit;
  end;
  cMethod:=QuestActionInfo.sParam2[1];
  Magic:=UserEngine.FindMagic(QuestActionInfo.sParam1);
  if Magic <> nil then begin
    for I := 0 to PlayObject.m_MagicList.Count - 1 do begin
      UserMagic:=PlayObject.m_MagicList.Items[I];
      if UserMagic.MagicInfo = Magic then begin
        case cMethod of
          '=': begin
            if nLevel >= 0 then begin
              nLevel:=_MAX(3,nLevel);
              UserMagic.btLevel:=nLevel;
            end;
          end;
          '-': begin
            if UserMagic.btLevel >= nLevel then begin
              Dec(UserMagic.btLevel,nLevel);
            end else begin
              UserMagic.btLevel:=0;
            end;
          end;
          '+': begin
            if UserMagic.btLevel + nLevel <= 3 then begin
              Inc(UserMagic.btLevel,nLevel);
            end else begin
              UserMagic.btLevel:=3;
            end;
          end;
        end;
        PlayObject.SendDelayMsg(PlayObject,RM_MAGIC_LVEXP,0,UserMagic.MagicInfo.wMagicId,UserMagic.btLevel,UserMagic.nTranPoint,'',100);
        break;
      end;
    end;
  end;
end;


procedure TNormNpc.ActionOfTakeCastleGold(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nGold:Integer;
begin
  nGold:=Str_ToInt(QuestActionInfo.sParam1,-1);
  if (nGold < 0) or (m_Castle = nil) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_TAKECASTLEGOLD);
    exit;
  end;
    
  if nGold <= TUserCastle(m_Castle).m_nTotalGold then begin
    Dec(TUserCastle(m_Castle).m_nTotalGold,nGold);
  end else begin
    TUserCastle(m_Castle).m_nTotalGold:=0;
  end;
end;

procedure TNormNpc.ClearScript; //0049E914
var
  III,IIII: Integer;
  I,II: Integer;
  Script:pTScript;
  SayingRecord:pTSayingRecord;
  SayingProcedure:pTSayingProcedure;
  QuestConditionInfo: pTQuestConditionInfo;
  QuestActionInfo: pTQuestActionInfo;
begin
  for I := 0 to m_ScriptList.Count - 1 do begin
    Script:=m_ScriptList.Items[i];
    for II := 0 to Script.RecordList.Count - 1 do begin
      SayingRecord:=Script.RecordList.Items[II];
      for III := 0 to SayingRecord.ProcedureList.Count - 1 do begin
        SayingProcedure:=SayingRecord.ProcedureList.Items[III];
        for IIII := 0 to SayingProcedure.ConditionList.Count - 1 do begin
          QuestConditionInfo := pTQuestConditionInfo(SayingProcedure.ConditionList.Items[IIII]);
          QuestConditionInfo.Script.Free;
          Dispose(pTQuestConditionInfo(SayingProcedure.ConditionList.Items[IIII]));
        end;
        for IIII := 0 to SayingProcedure.ActionList.Count - 1 do begin
          QuestActionInfo := pTQuestActionInfo(SayingProcedure.ActionList.Items[IIII]);
          QuestActionInfo.Script.Free;
          Dispose(pTQuestActionInfo(SayingProcedure.ActionList.Items[IIII]));
        end;
        for IIII := 0 to SayingProcedure.ElseActionList.Count - 1 do begin
          QuestActionInfo := pTQuestActionInfo(SayingProcedure.ElseActionList.Items[IIII]);
          QuestActionInfo.Script.Free;
          Dispose(pTQuestActionInfo(SayingProcedure.ElseActionList.Items[IIII]));
        end;
        SayingProcedure.ConditionList.Free;
        SayingProcedure.ActionList.Free;
        SayingProcedure.ElseActionList.Free;
        Dispose(SayingProcedure);
      end;    // for
      SayingRecord.ProcedureList.Free;
      Dispose(SayingRecord);
    end;    // for
    Script.RecordList.Free;
    Dispose(Script);
  end;    // for
  m_ScriptList.Clear;
end;

procedure TNormNpc.Click(PlayObject: TPlayObject); //0049EC18
begin
  PlayObject.m_nScriptGotoCount:=0;
  PlayObject.m_sScriptGoBackLable:='';
  PlayObject.m_sScriptCurrLable:='';
  GotoLable(PlayObject,'@main',False);
end;

function TNormNpc.ConditionOfCheckAccountIPList(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  LoadList:TStringList;
  sCharName:String;
  sCharAccount:String;
  sCharIPaddr:String;
  sLine:String;
  sName:String;
  sIPaddr:String;
begin
  Result:=False;
  LoadList:=TStringList.Create;
  try
    sCharName:=PlayObject.m_sCharName;
    sCharAccount:=PlayObject.m_sUserID;
    sCharIPaddr:=PlayObject.m_sIPaddr;
    if FileExists(g_Config.sEnvirDir + QuestConditionInfo.sParam1) then begin
      LoadList.LoadFromFile(g_Config.sEnvirDir + QuestConditionInfo.sParam1);
      for I := 0 to LoadList.Count - 1 do begin
        sLine:=LoadList.Strings[i];
        if sLine[1] = ';' then Continue;          
        sIPaddr:=GetValidStr3(sLine,sName,[' ','/',#9]);
        sIPaddr:=Trim(sIPaddr);
        if (sName = sCharAccount) and (sIPaddr = sCharIPaddr) then begin
          Result:=True;
          break;
        end;          
      end;
    end else begin
      ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKACCOUNTIPLIST);
    end;
  finally
    LoadList.Free
  end;
end;

function TNormNpc.ConditionOfCheckBagSize(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nSize:Integer;
begin
  Result:=False;
  nSize:=QuestConditionInfo.nParam1;
  if (nSize <= 0) or (nSize > MAXBAGITEM) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKBAGSIZE);
    exit;
  end;
  if PlayObject.m_ItemList.Count + nSize <= MAXBAGITEM then
    Result:=True;      
end;

function TNormNpc.ConditionOfCheckBonusPoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nTotlePoint:Integer;
  cMethod:Char;
begin
  Result:=False;
  nTotlePoint:=m_BonusAbil.DC +
               m_BonusAbil.MC +
               m_BonusAbil.SC +
               m_BonusAbil.AC +
               m_BonusAbil.MAC +
               m_BonusAbil.HP +
               m_BonusAbil.MP +
               m_BonusAbil.Hit +
               m_BonusAbil.Speed +
               m_BonusAbil.X2;

  nTotlePoint:=nTotlePoint + m_nBonusPoint;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nTotlePoint = QuestConditionInfo.nParam2 then Result:=True;
    '>': if nTotlePoint > QuestConditionInfo.nParam2 then Result:=True;
    '<': if nTotlePoint < QuestConditionInfo.nParam2 then Result:=True;
    else if nTotlePoint >= QuestConditionInfo.nParam2 then Result:=True;
  end;
end;


function TNormNpc.ConditionOfCheckHP(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethodMin,cMethodMax:Char;
  nMin,nMax:Integer;
  function CheckHigh():Boolean;
  begin
    Result:=False;
    case cMethodMax of
      '=': begin
        if PlayObject.m_WAbil.MaxHP = nMax then begin
          Result:=True;
        end;
      end;
      '>': begin
        if PlayObject.m_WAbil.MaxHP > nMax then begin
          Result:=True;
        end;
      end;
      '<': begin
        if PlayObject.m_WAbil.MaxHP < nMax then begin
          Result:=True;
        end;
      end;
      else begin
        if PlayObject.m_WAbil.MaxHP >= nMax then begin
          Result:=True;
        end;
      end;
    end;
  end;
begin
  Result:=False;
  cMethodMin:=QuestConditionInfo.sParam1[1];
  cMethodMax:=QuestConditionInfo.sParam1[3];
  nMin:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nMax:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (nMin < 0) or (nMax < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKHP);
    exit;
  end;
    
  case cMethodMin of
    '=': begin
      if (m_WAbil.HP = nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '>': begin
      if (PlayObject.m_WAbil.HP > nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '<': begin
      if (PlayObject.m_WAbil.HP < nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    else begin
      if (PlayObject.m_WAbil.HP >= nMin) then begin
        Result:=CheckHigh;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckMP(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethodMin,cMethodMax:Char;
  nMin,nMax:Integer;
  function CheckHigh():Boolean;
  begin
    Result:=False;
    case cMethodMax of
      '=': begin
        if PlayObject.m_WAbil.MaxMP = nMax then begin
          Result:=True;
        end;
      end;
      '>': begin
        if PlayObject.m_WAbil.MaxMP > nMax then begin
          Result:=True;
        end;
      end;
      '<': begin
        if PlayObject.m_WAbil.MaxMP < nMax then begin
          Result:=True;
        end;
      end;
      else begin
        if PlayObject.m_WAbil.MaxMP >= nMax then begin
          Result:=True;
        end;
      end;
    end;
  end;
begin
  Result:=False;
  cMethodMin:=QuestConditionInfo.sParam1[1];
  cMethodMax:=QuestConditionInfo.sParam1[3];
  nMin:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nMax:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (nMin < 0) or (nMax < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKMP);
    exit;
  end;
    
  case cMethodMin of
    '=': begin
      if (m_WAbil.MP = nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '>': begin
      if (PlayObject.m_WAbil.MP > nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '<': begin
      if (PlayObject.m_WAbil.MP < nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    else begin
      if (PlayObject.m_WAbil.MP >= nMin) then begin
        Result:=CheckHigh;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckDC(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethodMin,cMethodMax:Char;
  nMin,nMax:Integer;
  function CheckHigh():Boolean;
  begin
    Result:=False;
    case cMethodMax of
      '=': begin
        if HiWord(PlayObject.m_WAbil.DC) = nMax then begin
          Result:=True;
        end;
      end;
      '>': begin
        if HiWord(PlayObject.m_WAbil.DC) > nMax then begin
          Result:=True;
        end;
      end;
      '<': begin
        if HiWord(PlayObject.m_WAbil.DC) < nMax then begin
          Result:=True;
        end;
      end;
      else begin
        if HiWord(PlayObject.m_WAbil.DC) >= nMax then begin
          Result:=True;
        end;
      end;
    end;
  end;
begin
  Result:=False;
  cMethodMin:=QuestConditionInfo.sParam1[1];
  cMethodMax:=QuestConditionInfo.sParam1[3];
  nMin:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nMax:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (nMin < 0) or (nMax < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKDC);
    exit;
  end;
    
  case cMethodMin of
    '=': begin
      if (LoWord(PlayObject.m_WAbil.DC) = nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '>': begin
      if (LoWord(PlayObject.m_WAbil.DC) > nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '<': begin
      if (LoWord(PlayObject.m_WAbil.DC) < nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    else begin
      if (LoWord(PlayObject.m_WAbil.DC) >= nMin) then begin
        Result:=CheckHigh;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckMC(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethodMin,cMethodMax:Char;
  nMin,nMax:Integer;
  function CheckHigh():Boolean;
  begin
    Result:=False;
    case cMethodMax of
      '=': begin
        if HiWord(PlayObject.m_WAbil.MC) = nMax then begin
          Result:=True;
        end;
      end;
      '>': begin
        if HiWord(PlayObject.m_WAbil.MC) > nMax then begin
          Result:=True;
        end;
      end;
      '<': begin
        if HiWord(PlayObject.m_WAbil.MC) < nMax then begin
          Result:=True;
        end;
      end;
      else begin
        if HiWord(PlayObject.m_WAbil.MC) >= nMax then begin
          Result:=True;
        end;
      end;
    end;
  end;
begin
  Result:=False;
  cMethodMin:=QuestConditionInfo.sParam1[1];
  cMethodMax:=QuestConditionInfo.sParam1[3];
  nMin:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nMax:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (nMin < 0) or (nMax < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKMC);
    exit;
  end;
    
  case cMethodMin of
    '=': begin
      if (LoWord(PlayObject.m_WAbil.MC) = nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '>': begin
      if (LoWord(PlayObject.m_WAbil.MC) > nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '<': begin
      if (LoWord(PlayObject.m_WAbil.MC) < nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    else begin
      if (LoWord(PlayObject.m_WAbil.MC) >= nMin) then begin
        Result:=CheckHigh;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckSC(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethodMin,cMethodMax:Char;
  nMin,nMax:Integer;
  function CheckHigh():Boolean;
  begin
    Result:=False;
    case cMethodMax of
      '=': begin
        if HiWord(PlayObject.m_WAbil.SC) = nMax then begin
          Result:=True;
        end;
      end;
      '>': begin
        if HiWord(PlayObject.m_WAbil.SC) > nMax then begin
          Result:=True;
        end;
      end;
      '<': begin
        if HiWord(PlayObject.m_WAbil.SC) < nMax then begin
          Result:=True;
        end;
      end;
      else begin
        if HiWord(PlayObject.m_WAbil.SC) >= nMax then begin
          Result:=True;
        end;
      end;
    end;
  end;
begin
  Result:=False;
  cMethodMin:=QuestConditionInfo.sParam1[1];
  cMethodMax:=QuestConditionInfo.sParam1[3];
  nMin:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nMax:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (nMin < 0) or (nMax < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKSC);
    exit;
  end;
    
  case cMethodMin of
    '=': begin
      if (LoWord(PlayObject.m_WAbil.SC) = nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '>': begin
      if (LoWord(PlayObject.m_WAbil.SC) > nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    '<': begin
      if (LoWord(PlayObject.m_WAbil.SC) < nMin) then begin
        Result:=CheckHigh;
      end;
    end;
    else begin
      if (LoWord(PlayObject.m_WAbil.SC) >= nMin) then begin
        Result:=CheckHigh;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckExp(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  dwExp:LongWord;
begin
  Result:=False;
  dwExp:=Str_ToInt(QuestConditionInfo.sParam2, 0);
  if dwExp = 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKEXP);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_Abil.Exp = dwExp then Result:=True;
    '>': if PlayObject.m_Abil.Exp > dwExp then Result:=True;
    '<': if PlayObject.m_Abil.Exp < dwExp then Result:=True;
    else if PlayObject.m_Abil.Exp >= dwExp then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckFlourishPoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nPoint:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nPoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKFLOURISHPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;    
  Guild:=TGuild(PlayObject.m_MyGuild);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if Guild.nFlourishing = nPoint then Result:=True;
    '>': if Guild.nFlourishing > nPoint then Result:=True;
    '<': if Guild.nFlourishing < nPoint then Result:=True;
    else if Guild.nFlourishing >= nPoint then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckChiefItemCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nCount:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nCount:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKFLOURISHPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;    
  Guild:=TGuild(PlayObject.m_MyGuild);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if Guild.nChiefItemCount = nCount then Result:=True;
    '>': if Guild.nChiefItemCount > nCount then Result:=True;
    '<': if Guild.nChiefItemCount < nCount then Result:=True;
    else if Guild.nChiefItemCount >= nCount then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckGuildAuraePoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nPoint:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nPoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKAURAEPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if Guild.nAurae = nPoint then Result:=True;
    '>': if Guild.nAurae > nPoint then Result:=True;
    '<': if Guild.nAurae < nPoint then Result:=True;
    else if Guild.nAurae >= nPoint then Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckGuildMode(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nPoint:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nPoint:=Str_ToInt(QuestConditionInfo.sParam1, 0);
  if nPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKGUILDMODE);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);
  if Guild <> nil then begin
    if Guild.nGuildMode = nPoint then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckGuildBuildPoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nPoint:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nPoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKBUILDPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if Guild.nBuildPoint = nPoint then Result:=True;
    '>': if Guild.nBuildPoint > nPoint then Result:=True;
    '<': if Guild.nBuildPoint < nPoint then Result:=True;
    else if Guild.nBuildPoint >= nPoint then Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckStabilityPoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nPoint:Integer;
  Guild:TGuild;
begin
  Result:=False;
  nPoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKSTABILITYPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if Guild.nStability = nPoint then Result:=True;
    '>': if Guild.nStability > nPoint then Result:=True;
    '<': if Guild.nStability < nPoint then Result:=True;
    else if Guild.nStability >= nPoint then Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckGameGold(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nGameGold:Integer;
begin
  Result:=False;
  nGameGold:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nGameGold < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKGAMEGOLD);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_nGameGold = nGameGold then Result:=True;
    '>': if PlayObject.m_nGameGold > nGameGold then Result:=True;
    '<': if PlayObject.m_nGameGold < nGameGold then Result:=True;
    else if PlayObject.m_nGameGold >= nGameGold then Result:=True;
  end;
end;
function TNormNpc.ConditionOfCheckGamePoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nGamePoint:Integer;
begin
  Result:=False;
  nGamePoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nGamePoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKGAMEPOINT);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_nGamePoint = nGamePoint then Result:=True;
    '>': if PlayObject.m_nGamePoint > nGamePoint then Result:=True;
    '<': if PlayObject.m_nGamePoint < nGamePoint then Result:=True;
    else if PlayObject.m_nGamePoint >= nGamePoint then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckGroupCount(PlayObject: TPlayObject;      //弊缝盔 牢盔荐 眉农
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nCount:Integer;
begin
  Result:=False;
  if PlayObject.m_GroupOwner = nil then exit;
  nCount:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKGROUPCOUNT);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_GroupOwner.m_GroupMembers.Count = nCount then Result:=True;
    '>': if PlayObject.m_GroupOwner.m_GroupMembers.Count > nCount then Result:=True;
    '<': if PlayObject.m_GroupOwner.m_GroupMembers.Count < nCount then Result:=True;
    else if PlayObject.m_GroupOwner.m_GroupMembers.Count >= nCount then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckGroupNearby(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  PlayObjectEx : TPlayObject;
  I:Integer;
begin
  Result:=False;
  if PlayObject.m_GroupOwner <> nil then begin
    for I := 0 to PlayObject.m_GroupMembers.Count - 1 do begin
     PlayObjectEx:=TPlayObject(PlayObject.m_GroupMembers.Objects[i]);
      if PlayObjectEx <> nil then begin
        if PlayObject.m_sMapName <> '' then begin
          if PlayObject.m_sMapName <> PlayObjectEx.m_sMapName then begin
            Result:=False;
          end else begin
            Result := True;
          end;
        end;
      end;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckHaveGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=PlayObject.m_MyGuild <> nil; 
end;

function TNormNpc.ConditionOfCheckInMapRange(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  sMapName:String;
  nX,nY,nRange:Integer;
begin
  Result:=False;
  sMapName:=QuestConditionInfo.sParam1;
  nX:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  nY:=Str_ToInt(QuestConditionInfo.sParam3,-1);
  nRange:=Str_ToInt(QuestConditionInfo.sParam4,-1);
  if (sMapName = '') or (nX < 0) or (nY < 0) or (nRange < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKINMAPRANGE);
    exit;
  end;
  if CompareText(PlayObject.m_sMapName,sMapName) <> 0 then exit;
  if (abs(PlayObject.m_nCurrX - nX) <= nRange) and (abs(PlayObject.m_nCurrY - nY) <= nRange) then
    Result:=True;
end;

function TNormNpc.ConditionOfCheckCastleChageDay(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nDay:Integer;
  cMethod:Char;
  nChangeDay:Integer;
begin
  Result:=False;
  nDay:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if (nDay < 0) or (m_Castle = nil) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CASTLECHANGEDAY);
    exit;
  end;
  nChangeDay:=GetDayCount(Now,TUserCastle(m_Castle).m_ChangeDate);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nChangeDay = nDay then Result:=True;
    '>': if nChangeDay > nDay then Result:=True;
    '<': if nChangeDay < nDay then Result:=True;
    else if nChangeDay >= nDay then Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckCastleWarDay(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nDay:Integer;
  cMethod:Char;
  nWarDay:Integer;
begin
  Result:=False;
  nDay:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if (nDay < 0) or (m_Castle = nil) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CASTLEWARDAY);
    exit;
  end;
  nWarDay:=GetDayCount(Now,TUserCastle(m_Castle).m_WarDate);
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nWarDay = nDay then Result:=True;
    '>': if nWarDay > nDay then Result:=True;
    '<': if nWarDay < nDay then Result:=True;
    else if nWarDay >= nDay then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckCastleDoorStatus(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nDay:Integer;
  nDoorStatus:Integer;
  CastleDoor:TCastleDoor;
begin
  Result:=False;
  nDay:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  nDoorStatus:=-1;
  if CompareText(QuestConditionInfo.sParam1,'破碎') = 0 then nDoorStatus:=0;
  if CompareText(QuestConditionInfo.sParam1,'打开') = 0 then nDoorStatus:=1;
  if CompareText(QuestConditionInfo.sParam1,'关闭') = 0 then nDoorStatus:=2;
    
  if (nDay < 0) or (m_Castle = nil) or (nDoorStatus < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKCASTLEDOOR);
    exit;
  end;
  CastleDoor:=TCastleDoor(TUserCastle(m_Castle).m_MainDoor.BaseObject);

  case nDoorStatus of
    0: if CastleDoor.m_boDeath then Result:=True;
    1: if CastleDoor.m_boOpened then Result:=True;
    2: if not CastleDoor.m_boOpened then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckIsDefenseAllyGuild(
  PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if m_Castle = nil then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_ISDEFENSEALLYGUILD);
    exit;
  end;
    
  if PlayObject.m_MyGuild = nil then exit;
  Result:=TUserCastle(m_Castle).IsDefenseAllyGuild(TGuild(PlayObject.m_MyGuild));
end;

function TNormNpc.ConditionOfCheckIsDefenseGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if m_Castle = nil then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_ISDEFENSEGUILD);
    exit;
  end;

  if PlayObject.m_MyGuild = nil then exit;
  Result:=TUserCastle(m_Castle).IsDefenseGuild(TGuild(PlayObject.m_MyGuild));
end;

function TNormNpc.ConditionOfCheckIsCastleaGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  Number: Integer;
begin
  Result:=False;
  Number:=Str_ToInt(QuestConditionInfo.sParam1,0);
  if g_CastleManager.IsCastleNumBerMember(PlayObject, Number) <> nil then     //己巩颇巩盔 立加犬牢
    Result:=True;
end;

function TNormNpc.ConditionOfCheckCastleaGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if g_CastleManager.CastleMember(PlayObject, QuestConditionInfo.sParam1) <> nil then begin
    Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckCastleaMasterGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if g_CastleManager.IsMasterCastleMember(PlayObject) <> nil then begin  //沥汗磊 犬牢
    Result:=True;
  end;
end;

function TNormNpc.ConditionOfCastleMasterKing(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if PlayObject.IsGuildMaster and (g_CastleManager.IsMasterCastleMember(PlayObject) <> nil) then    //沥汗磊 巩林 立加犬牢
    Result:=True;
end;

function TNormNpc.ConditionOfCheckIsCastleMaster(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  Number: Integer;
begin
  Result:=False;
  Number:=Str_ToInt(QuestConditionInfo.sParam1,0);
  if PlayObject.IsGuildMaster and (g_CastleManager.IsCastleNumBerMember(PlayObject, Number) <> nil) then    //己巩林 立加犬牢
    Result:=True;
end;

function TNormNpc.ConditionOfCheckIsGuildMaster(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=PlayObject.IsGuildMaster;
end;

function TNormNpc.ConditionOfCheckAttackWarGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if m_Castle = nil then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_ATTACKWARGUILD);
    exit;
  end;
  if (PlayObject.m_MyGuild <> nil) and (not TUserCastle(m_Castle).IsDefenseWarGuild(TGuild(PlayObject.m_MyGuild))) then
    Result:=True;
end;

function TNormNpc.ConditionOfCheckDefenseWarGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if m_Castle = nil then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_DEFENSEWARGUILD);
    exit;
  end;

  if PlayObject.m_MyGuild = nil then exit;
  Result:=TUserCastle(m_Castle).IsDefenseWarGuild(TGuild(PlayObject.m_MyGuild));
end;

function TNormNpc.ConditionOfCheckCastleArea(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if m_Castle = nil then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKCASTLEAREA);
    exit;
  end;

  Result:= TUserCastle(m_Castle).InCastleWarArea(PlayObject.m_PEnvir);
end;

function TNormNpc.ConditionOfCheckListCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result := False;
end;



function TNormNpc.ConditionOfCheckItemAddValue(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  nWhere:Integer;
  nAddAllValue,nAddValue:Integer;
  UserItem:pTUserItem;
  cMethod:Char;
begin
  Result:=False;
  nWhere:=Str_ToInt(QuestConditionInfo.sParam1,-1);
  nAddValue:=Str_ToInt(QuestConditionInfo.sParam3,-1);
  if not (nWhere in [Low(THumanUseItems)..High(THumanUseItems)]) or (nAddValue < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKITEMADDVALUE);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nWhere];
  if UserItem.wIndex = 0 then begin
    exit;
  end;
  nAddAllValue:=0;
  for I := Low(UserItem.btValue) to High(UserItem.btValue) do begin
    Inc(nAddAllValue,UserItem.btValue[I]);
  end;

  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nAddAllValue = nAddValue then Result:=True;
    '>': if nAddAllValue > nAddValue then Result:=True;
    '<': if nAddAllValue < nAddValue then Result:=True;
    else if nAddAllValue >= nAddValue then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckItemType(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nWhere:Integer;
  nType:Integer;
  UserItem:pTUserItem;
  Stditem:Titem;
begin
  Result:=False;
  nWhere:=Str_ToInt(QuestConditionInfo.sParam1,-1);
  nType:=Str_ToInt(QuestConditionInfo.sParam2,-1);
  if not (nWhere in [Low(THumanUseItems)..High(THumanUseItems)]) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKITEMTYPE);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nWhere];
  if UserItem.wIndex = 0 then exit;
  Stditem:=UserEngine.GetStdItem(UserItem.wIndex);
  if (Stditem <> nil) and (Stditem.StdMode = nType) then begin
    Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckLevelEx(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nLevel:Integer;
  cMethod:Char;
begin
  Result:=False;
  nLevel:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nLevel < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKLEVELEX);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_Abil.Level = nLevel then Result:=True;
    '>': if PlayObject.m_Abil.Level > nLevel then Result:=True;
    '<': if PlayObject.m_Abil.Level < nLevel then Result:=True;
    else if PlayObject.m_Abil.Level >= nLevel then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckColumn(PlayObject: TPlayObject;      //全焊窜
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nColumn:Integer;
  cMethod:Char;
begin
  Result:=False;
  nColumn:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if not (nColumn in [0..6]) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKCOLUMN);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_btColumn = nColumn then Result:=True;
    '>': if PlayObject.m_btColumn > nColumn then Result:=True;
    '<': if PlayObject.m_btColumn < nColumn then Result:=True;
    else if PlayObject.m_btColumn >= nColumn then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckNameListPostion(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  LoadList:TStringList;
  sCharName:String;
  nNamePostion,nPostion:Integer;
  sLine:String;
begin
  Result:=False;
  nNamePostion:= -1;
  LoadList:=TStringList.Create;
  try
    sCharName:=PlayObject.m_sCharName;
    if FileExists(g_Config.sEnvirDir + QuestConditionInfo.sParam1) then begin
      LoadList.LoadFromFile(g_Config.sEnvirDir + QuestConditionInfo.sParam1);
      for I := 0 to LoadList.Count - 1 do begin
        sLine:=Trim(LoadList.Strings[i]);
        if sLine[1] = ';' then Continue;
        if CompareText(sLine,sCharName) = 0 then begin
          nNamePostion:=I;
          break;
        end;
      end;
    end else begin
      ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKNAMELISTPOSITION);
    end;
  finally
    LoadList.Free
  end;
  nPostion:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPostion < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKNAMELISTPOSITION);
    exit;
  end;
  if nNamePostion >= nPostion then
    Result:=True;
end;

function TNormNpc.ConditionOfCheckNameIPList(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  LoadList:TStringList;
  sCharName:String;
  sCharAccount:String;
  sCharIPaddr:String;
  sLine:String;
  sName:String;
  sIPaddr:String;
begin
  Result:=False;
  LoadList:=TStringList.Create;
  try
    sCharName:=PlayObject.m_sCharName;
    sCharAccount:=PlayObject.m_sUserID;
    sCharIPaddr:=PlayObject.m_sIPaddr;
    if FileExists(g_Config.sEnvirDir + QuestConditionInfo.sParam1) then begin
      LoadList.LoadFromFile(g_Config.sEnvirDir + QuestConditionInfo.sParam1);
      for I := 0 to LoadList.Count - 1 do begin
        sLine:=LoadList.Strings[i];
        if sLine[1] = ';' then Continue;
        sIPaddr:=GetValidStr3(sLine,sName,[' ','/',#9]);
        sIPaddr:=Trim(sIPaddr);
        if (sName = sCharName) and (sIPaddr = sCharIPaddr) then begin
          Result:=True;
          break;
        end;
      end;
    end else begin
      ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKNAMEIPLIST);
    end;
  finally
    LoadList.Free
  end;
end;

function TNormNpc.ConditionOfCheckPoseDir(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  PoseHuman:TBaseObject;
begin
  Result:=False;
  PoseHuman:=PlayObject.GetPoseCreate();
  if (PoseHuman <> nil) and (PoseHuman.GetPoseCreate = PlayObject) and (PoseHuman.m_btRaceServer = RC_PLAYOBJECT) then begin
    case QuestConditionInfo.nParam1 of
      1: if PoseHuman.m_btGender = PlayObject.m_btGender then Result:=True; //要求相同性别
      2: if PoseHuman.m_btGender <> PlayObject.m_btGender then Result:=True; //要求不同性别
      else Result:=True; //无参数时不判别性别
    end;
  end;
end;

function TNormNpc.ConditionOfCheckPoseGender(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  PoseHuman:TBaseObject;
  btSex:Byte;
begin
  Result:=False;
  btSex:=0;
  if CompareText(QuestConditionInfo.sParam1,sMAN) = 0 then begin
    btSex:=0;
  end else
  if CompareText(QuestConditionInfo.sParam1,sMALE) = 0 then begin
    btSex:=0;
  end else
  if CompareText(QuestConditionInfo.sParam1,sWOMAN) = 0 then begin
    btSex:=1;
  end else
  if CompareText(QuestConditionInfo.sParam1,sFEMALE) = 0 then begin
    btSex:=1;
  end;
  PoseHuman:=PlayObject.GetPoseCreate();
  if (PoseHuman <> nil) and (PoseHuman.m_btRaceServer = RC_PLAYOBJECT) then begin
    if PoseHuman.m_btGender = btSex then Result:=True;
  end;
end;


function TNormNpc.ConditionOfCheckPoseLevel(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nLevel:Integer;
  PoseHuman:TBaseObject;
  cMethod:Char;
begin
  Result:=False;
  nLevel:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nLevel < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKPOSELEVEL);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  PoseHuman:=PlayObject.GetPoseCreate();
  if (PoseHuman <> nil) and (PoseHuman.m_btRaceServer = RC_PLAYOBJECT) then begin
    case cMethod of
      '=': if PoseHuman.m_Abil.Level = nLevel then Result:=True;
      '>': if PoseHuman.m_Abil.Level > nLevel then Result:=True;
      '<': if PoseHuman.m_Abil.Level < nLevel then Result:=True;
      else if PoseHuman.m_Abil.Level >= nLevel then Result:=True;
    end;
  end;
    
end;



function TNormNpc.ConditionOfCheckServerName(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if QuestConditionInfo.sParam1 = g_Config.sServerName then Result:=True;
end;



function TNormNpc.ConditionOfCheckSlaveCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nCount:Integer;
  cMethod:Char;
begin
  Result:=False;
  nCount:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKSLAVECOUNT);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_SlaveList.Count = nCount then Result:=True;
    '>': if PlayObject.m_SlaveList.Count > nCount then Result:=True;
    '<': if PlayObject.m_SlaveList.Count < nCount then Result:=True;
    else if PlayObject.m_SlaveList.Count >= nCount then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckMap(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo):Boolean;
begin
  if QuestConditionInfo.sParam1 = PlayObject.m_sMapName then
    Result:=True
  else
    Result:=False;
end;

function TNormNpc.ConditionOfCheckPos(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  nX,nY:integer;
begin
  nX:=QuestConditionInfo.nParam2;
  nY:=QuestConditionInfo.nParam3;

  if (QuestConditionInfo.sParam1 = PlayObject.m_sMapName) and (nX = PlayObject.m_nCurrX) and (nY = PlayObject.m_nCurrY) then
    Result:=True
  else
    Result:=False;
end;

function TNormNpc.ConditionOfReviveSlave(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  I,resultc,nSlaveCount:Integer;
  s18:String;
  myFile:TextFile;
  LoadList:TStringList;
  sFileName,Petname,lvl,lvlexp:String;
begin
  resultc:=-1;
  sFileName:=g_Config.sEnvirDir + 'PetData\' + PlayObject.m_sCharName + '.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    Case playobject.m_btJob of     //流诀函版
      0,3,4,8,9 : nSlavecount:=1;
      1,6 : nSlavecount:=5;
      2,7 : nSlavecount:=2;
    end;
  for I := 0 to LoadList.Count - 1 do begin
      s18:=Trim(LoadList.Strings[I]);
      if (s18 <> '') and (s18[1] <> ';') then begin
       s18:=GetValidStr3(s18,PetName, ['/']);
       s18:=GetValidStr3(s18,lvl, ['/']);
       s18:=GetValidStr3(s18,lvlexp, ['/']);
     PlayObject.MakeSlave(PetName,str_ToInt(lvl,0),str_ToInt(lvlexp,0),nslavecount,10 * 24 * 60 * 60);
     resultc:=i;
      end;
  end;
if loadlist.count > 0 then begin
result:=true;
  AssignFile(myFile, sFileName);
   ReWrite(myFile);
   CloseFile(myFile);
end;
  end;
end;

function TNormNpc.ConditionOfCheckHasMagic(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  I:Integer;
  UserMagic:pTUserMagic;
begin
  Result:=False;
  for I := 0 to PlayObject.m_MagicList.Count - 1 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if CompareText(UserMagic.MagicInfo.sMagicName,QuestConditionInfo.sParam1) = 0 then begin
      Result:=True;

      break;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckMagicLvl(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  I:Integer;
  UserMagic:pTUserMagic;
begin
  Result:=False;
  for I := 0 to PlayObject.m_MagicList.Count - 1 do begin
    UserMagic:=PlayObject.m_MagicList.Items[I];
    if CompareText(UserMagic.MagicInfo.sMagicName,QuestConditionInfo.sParam1) = 0 then begin
      if (UserMagic.btLevel = QuestConditionInfo.nParam2) then
        Result:=True;

      break;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckHasHorse(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
begin
  Result:=False;

  if PlayObject.m_btHorseType <> 0 then Result:=True;
end;

function TNormNpc.ConditionOfCheckOnHorse(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
begin
  Result := PlayObject.m_boOnHorse;
end;

function TNormNpc.ConditionOfCheckGroupClass(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  I,nCount,nJob:Integer;
  cMethod:Char;
  PlayObjectEx: TPlayObject;
begin
  Result := False;
  nJob := -1;
  nCount := 0;

  if CompareLStr(QuestConditionInfo.sParam1,sWarrior,Length(sWarrior)) then nJob:=jWarr;
  if CompareLStr(QuestConditionInfo.sParam1,sWizard,Length(sWizard)) then nJob:=jWizard;
  if CompareLStr(QuestConditionInfo.sParam1,sTaos,Length(sTaos)) then nJob:=jTaos;
  if CompareLStr(QuestConditionInfo.sParam1,sAssassin,Length(sAssassin)) then nJob:=jAssassin; //磊按
  if CompareLStr(QuestConditionInfo.sParam1,sUpWarr,Length(sUpWarr)) then nJob:=jUpWarr;
  if CompareLStr(QuestConditionInfo.sParam1,sUpWiz,Length(sUpWiz)) then nJob:=jUpWiz;
  if CompareLStr(QuestConditionInfo.sParam1,sUpTao,Length(sUpTao)) then nJob:=jUpTao;
  if CompareLStr(QuestConditionInfo.sParam1,sUpAssa,Length(sUpAssa)) then nJob:=jUpAssa; //殿急磊按

  if nJob < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHANGEJOB);
    exit;
  end;

  if PlayObject.m_GroupOwner <> nil then begin
    for I := 0 to PlayObject.m_GroupMembers.Count - 1 do begin
      PlayObjectEx:=TPlayObject(PlayObject.m_GroupMembers.Objects[i]);

      if PlayObjectEx.m_btJob = nJob then
        Inc(nCount);

    end;
  end;

  cMethod:=QuestConditionInfo.sParam2[1];
  case cMethod of
    '=': if nCount = QuestConditionInfo.nParam3 then Result:=True;
    '>': if nCount > QuestConditionInfo.nParam3 then Result:=True;
    '<': if nCount < QuestConditionInfo.nParam3 then Result:=True;
    else if nCount >= QuestConditionInfo.nParam3 then Result:=True;
  end;
end;

function TNormNpc.ConditionOfRandomEx(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo):Boolean;
var
  nRand:Integer;
  cMethod:Char;
begin
  Result := False;

  Randomize;
  nRand  := Random(QuestConditionInfo.nParam1);

  cMethod:=QuestConditionInfo.sParam2[1];
  case cMethod of
    '=': if nRand = QuestConditionInfo.nParam3 then Result:=True;
    '>': if nRand > QuestConditionInfo.nParam3 then Result:=True;
    '<': if nRand < QuestConditionInfo.nParam3 then Result:=True;
    else if nRand >= QuestConditionInfo.nParam3 then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckSafeZone(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result := PlayObject.InSafeZone;
end;

function TNormNpc.ConditionOfCheckHasHero(PlayObject: TPlayObject; QuestConditionInfo: pTQuestConditionInfo): Boolean; //康旷捞 乐绰瘤?
begin
  Result := PlayObject.m_sHeroCharName <> '';
end;

constructor TNormNpc.Create; //0049AA38
begin
  inherited;
  m_boSuperMan:=True;
  m_btRaceServer:=RC_NPC;
  m_nLight:=2;
  m_btAntiPoison:=99;
  m_ScriptList:=TList.Create;
  m_boStickMode:=True;
  m_sFilePath:='';
  m_boIsHide:=False;
  m_boIsQuest:=True;
end;

destructor TNormNpc.Destroy; //0049AAE4
begin
  ClearScript();
  {
  for I := 0 to ScriptList.Count - 1 do begin
    Dispose(pTScript(ScriptList.Items[I]));
  end;
  }
  m_ScriptList.Free;
  inherited;
end;

procedure TNormNpc.ExeAction(PlayObject: TPlayObject; sParam1, sParam2,
  sParam3: String; nParam1, nParam2, nParam3: Integer);
var
  nInt1:Integer;
  dwInt:LongWord;
begin
  //================================================
  //更改人物当前经验值
  //EXEACTION CHANGEEXP 0 经验数  设置为指定经验值
  //EXEACTION CHANGEEXP 1 经验数  增加指定经验
  //EXEACTION CHANGEEXP 2 经验数  减少指定经验
  //================================================
  if CompareText(sParam1,'CHANGEEXP') = 0 then begin
    nInt1:=Str_ToInt(sParam2,-1);
    case nInt1 of    //
      0: begin
        if nParam3 >= 0 then begin
          PlayObject.m_Abil.Exp:=LongWord(nParam3);
          PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
        end;
      end;
      1: begin
        if PlayObject.m_Abil.Exp >= LongWord(nParam3) then begin
          if (PlayObject.m_Abil.Exp - LongWord(nParam3)) > (High(LongWord) - PlayObject.m_Abil.Exp) then begin
            dwInt:=High(LongWord) - PlayObject.m_Abil.Exp;
          end else begin
            dwInt:=LongWord(nParam3);
          end;
        end else begin
          if (LongWord(nParam3) - PlayObject.m_Abil.Exp) > (High(LongWord) - LongWord(nParam3)) then begin
            dwInt:=High(LongWord) - LongWord(nParam3);
          end else begin
            dwInt:=LongWord(nParam3);
          end;
        end;
        Inc(PlayObject.m_Abil.Exp,dwInt);
        PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
      end;
      2: begin
        if PlayObject.m_Abil.Exp > LongWord(nParam3) then begin
          Dec(PlayObject.m_Abil.Exp,LongWord(nParam3));
        end else begin
          PlayObject.m_Abil.Exp:=0;
        end;
        PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
      end;
    end;
    PlayObject.SysMsg('Exp changed: ' + IntToStr(PlayObject.m_Abil.Exp) + '/' + IntToStr(PlayObject.m_Abil.MaxExp),c_Green,t_Hint);
    exit;
  end;

  //================================================
  //更改人物当前等级
  //EXEACTION CHANGELEVEL 0 等级数  设置为指定等级
  //EXEACTION CHANGELEVEL 1 等级数  增加指定等级
  //EXEACTION CHANGELEVEL 2 等级数  减少指定等级
  //================================================
  if CompareText(sParam1,'CHANGELEVEL') = 0 then begin
    nInt1:=Str_ToInt(sParam2,-1);
    case nInt1 of    //
      0: begin
        if nParam3 >= 0 then begin
          PlayObject.m_Abil.Level:=LongWord(nParam3);
          PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
        end;
      end;
      1: begin
        if PlayObject.m_Abil.Level >= LongWord(nParam3) then begin
          if (PlayObject.m_Abil.Level - LongWord(nParam3)) > (High(Word) - PlayObject.m_Abil.Level) then begin
            dwInt:=High(Word) - PlayObject.m_Abil.Level;
          end else begin
            dwInt:=LongWord(nParam3);
          end;
        end else begin
          if (LongWord(nParam3) - PlayObject.m_Abil.Level) > (High(Word) - LongWord(nParam3)) then begin
            dwInt:=High(LongWord) - LongWord(nParam3);
          end else begin
            dwInt:=LongWord(nParam3);
          end;
        end;
        Inc(PlayObject.m_Abil.Level,dwInt);
        PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
      end;
      2: begin
        if PlayObject.m_Abil.Level > LongWord(nParam3) then begin
          Dec(PlayObject.m_Abil.Level,LongWord(nParam3));
        end else begin
          PlayObject.m_Abil.Level:=0;
        end;
        PlayObject.HasLevelUp(PlayObject.m_Abil.Level -1);
      end;
    end;
    PlayObject.SysMsg('等级变更: ' + IntToStr(PlayObject.m_Abil.Level),c_Green,t_Hint);
    exit;
  end;

  //================================================
  //杀死人物
  //EXEACTION KILL 0 人物死亡,不显示凶手信息
  //EXEACTION KILL 1 人物死亡不掉物品,不显示凶手信息
  //EXEACTION KILL 2 人物死亡,显示凶手信息为NPC
  //EXEACTION KILL 3 人物死亡不掉物品,显示凶手信息为NPC
  //================================================
  if CompareText(sParam1,'KILL') = 0 then begin
    nInt1:=Str_ToInt(sParam2,-1);
    case nInt1 of    //
      1: begin
        PlayObject.m_boNoItem:=True;
        PlayObject.Die;
      end;
      2: begin
        PlayObject.SetLastHiter(Self);
        PlayObject.Die;
      end;
      3: begin
        PlayObject.m_boNoItem:=True;
        PlayObject.SetLastHiter(Self);
        PlayObject.Die;
      end;
      else begin
        PlayObject.Die;
      end;
    end;
    exit;
  end;

  //================================================
  //踢人物下线
  //EXEACTION KICK
  //================================================
  if CompareText(sParam1,'KICK') = 0 then begin
    PlayObject.m_boKickFlag:=True;
    exit;
  end;


  //==============================================================================
end;

function TNormNpc.GetLineVariableText(PlayObject: TPlayObject;
  sMsg: String): String;
var
  nC:Integer;
  s10:String;
begin
  nC:=0;
  while (True) do begin
    if TagCount(sMsg,'>') < 1 then break;
    ArrestStringEx(sMsg,'<','>',s10);
    GetVariableText(PlayObject,sMsg,s10);
    Inc(nC);
    if nC >= 101 then break;
  end;
  Result:=sMsg;
end;

procedure TNormNpc.GetVariableText(PlayObject:TPlayObject;var sMsg:String;sVariable:String); //0049AEA4
var
  sText,s14  :String;
  I          :Integer;
  n18        :Integer;
  wHour      :Word;
  wMinute    :Word;
  wSecond    :Word;
  nSecond    :Integer;
  DynamicVar :pTDynamicVar;
  boFoundVar :Boolean;
  s1C, s1D, S1F, s1G: string;
  LoadList: TStringList;
  s10, sListFileName, sName, nCount: String;
begin
  if CompareLStr(sVariable, '$C(', Length('$C(')) then begin
    s1C := sVariable[Length(sVariable)];
    ArrestStringEx(sVariable, '(', ')', s1D);
    sListFileName := g_Config.sEnvirDir + sNpc_def + 'QUESTS\拱距扁刘.txt';
    if FileExists(sListFileName) then begin
      LoadList := TStringList.Create;
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('loading fail.... => ' + sListFileName);
      end;
      for I := 0 to LoadList.Count - 1 do begin
        s10 := Trim(LoadList.Strings[I]);
        if s10[1] = ';' then Continue;
        nCount := GetValidStr3(s10, sName, [' ', '/', #9]);
        nCount := Trim(nCount);
        if CompareText(s1D, sName) = 0 then begin
          sText := nCount;
          Break;
        end;
      end;
      sMsg := sub_49ADB8(sMsg, '<$C('+s1D+')>', sText);
      LoadList.Free;
    end else begin
      MainOutMessage('file not found => ' + sListFileName);
    end;

    Exit;
  end;
//全局信息
  if sVariable = '$SERVERNAME' then begin
    sMsg:=sub_49ADB8(sMsg,'<$SERVERNAME>',g_Config.sServerName);
    exit;
  end;
  if sVariable = '$SERVERIP' then begin
    sMsg:=sub_49ADB8(sMsg,'<$SERVERIP>',g_Config.sServerIPaddr);
    exit;
  end;
  if sVariable = '$WEBSITE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$WEBSITE>',g_Config.sWebSite);
    exit;
  end;
  if sVariable = '$BBSSITE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BBSSITE>',g_Config.sBbsSite);
    exit;
  end;
  if sVariable = '$CLIENTDOWNLOAD' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CLIENTDOWNLOAD>',g_Config.sClientDownload);
    exit;
  end;
  if sVariable = '$QQ' then begin
    sMsg:=sub_49ADB8(sMsg,'<$QQ>',g_Config.sQQ);
    exit;
  end;
  if sVariable = '$PHONE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$PHONE>',g_Config.sPhone);
    exit;
  end;
  if sVariable = '$BANKACCOUNT0' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT0>',g_Config.sBankAccount0);
    exit;
  end;
  if sVariable = '$BANKACCOUNT1' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT1>',g_Config.sBankAccount1);
    exit;
  end;
  if sVariable = '$BANKACCOUNT2' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT2>',g_Config.sBankAccount2);
    exit;
  end;
  if sVariable = '$BANKACCOUNT3' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT3>',g_Config.sBankAccount3);
    exit;
  end;
  if sVariable = '$BANKACCOUNT4' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT4>',g_Config.sBankAccount4);
    exit;
  end;
  if sVariable = '$BANKACCOUNT5' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT5>',g_Config.sBankAccount5);
    exit;
  end;
  if sVariable = '$BANKACCOUNT6' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT6>',g_Config.sBankAccount6);
    exit;
  end;
  if sVariable = '$BANKACCOUNT7' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT7>',g_Config.sBankAccount7);
    exit;
  end;
  if sVariable = '$BANKACCOUNT8' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT8>',g_Config.sBankAccount8);
    exit;
  end;
  if sVariable = '$BANKACCOUNT9' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BANKACCOUNT9>',g_Config.sBankAccount9);
    exit;
  end;
  if sVariable = '$GAMEGOLDNAME' then begin
    sMsg:=sub_49ADB8(sMsg,'<$GAMEGOLDNAME>',g_Config.sGameGoldName);
    exit;
  end;
  if sVariable = '$GAMEPOINTNAME' then begin
    sMsg:=sub_49ADB8(sMsg,'<$GAMEPOINTNAME>',g_Config.sGamePointName);
    exit;
  end;
  if sVariable = '$USERCOUNT' then begin
    sText:=IntToStr(UserEngine.PlayObjectCount);
    sMsg:=sub_49ADB8(sMsg,'<$USERCOUNT>',sText);
    exit;
  end;
  if sVariable = '$MACRUNTIME' then begin
    sText:=CurrToStr(GetTickCount / (24 * 60 * 60 * 1000));
    sMsg:=sub_49ADB8(sMsg,'<$MACRUNTIME>',sText);
    exit;
  end;
  if sVariable = '$SERVERRUNTIME' then begin
    nSecond:=(GetTickCount() - g_dwStartTick) div 1000;
    wHour:=nSecond div 3600;
    wMinute:=(nSecond div 60) mod 60;         //矫埃
    wSecond:=nSecond mod 60;
    sText:=format('%d:%d:%d',[wHour,wMinute,wSecond]);
    sMsg:=sub_49ADB8(sMsg,'<$SERVERRUNTIME>',sText);
    exit;
  end;
  if sVariable = '$DATETIME' then begin
//    sText:=DateTimeToStr(Now);          //矫埃
    sText:=FormatDateTime('dddddd, hh:mm:nn', Now);
    sMsg:=sub_49ADB8(sMsg,'<$DATETIME>',sText);
    exit;
  end;

  if sVariable = '$HIGHLEVELINFO' then begin
    if g_HighLevelHuman <> nil then begin
      sText:=TPlayObject(g_HighLevelHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHLEVELINFO>',sText);
    exit;
  end;
  if sVariable = '$HIGHPKINFO' then begin
    if g_HighPKPointHuman <> nil then begin
      sText:=TPlayObject(g_HighPKPointHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHPKINFO>',sText);
    exit;
  end;
  if sVariable = '$HIGHDCINFO' then begin
    if g_HighDCHuman <> nil then begin
      sText:=TPlayObject(g_HighDCHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHDCINFO>',sText);
    exit;
  end;
  if sVariable = '$HIGHMCINFO' then begin
    if g_HighMCHuman <> nil then begin
      sText:=TPlayObject(g_HighMCHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHMCINFO>',sText);
    exit;
  end;
  if sVariable = '$HIGHSCINFO' then begin
    if g_HighSCHuman <> nil then begin
      sText:=TPlayObject(g_HighSCHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHSCINFO>',sText);
    exit;
  end;
  if sVariable = '$HIGHONLINEINFO' then begin
    if g_HighOnlineHuman <> nil then begin
      sText:=TPlayObject(g_HighOnlineHuman).GetMyInfo;
    end else sText:='????';
    sMsg:=sub_49ADB8(sMsg,'<$HIGHONLINEINFO>',sText);
    exit;
  end;

  if sVariable = '$AGITGUILDNAME' then begin
    sText:=TTerritory(m_PEnvir.m_GuildTerritory).GetGuildName();
    sMsg:=sub_49ADB8(sMsg,'<$AGITGUILDNAME>',sText);
    exit;
  end;

  if sVariable = '$GUILDAGITEXTENDFEE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$GUILDAGITEXTENDFEE>',GetGoldStr(g_Config.nGTExtendFee));
    exit;
  end;

  if sVariable = '$MASTEREXPTIME' then begin      //荤力 版摹
    sMsg:=sub_49ADB8(sMsg,'<$MASTEREXPTIME>',inttostr(PlayObject.m_nMasterUpExp));
    exit;
  end;
//个人信息
  if sVariable = '$USERNAME' then begin
    sMsg:=sub_49ADB8(sMsg,'<$USERNAME>',PlayObject.m_sCharName);
    exit;
  end;
  if sVariable = '$GUILDNAME' then begin
    if PlayObject.m_MyGuild <> nil then begin
      sMsg:=sub_49ADB8(sMsg,'<$GUILDNAME>',TGuild(PlayObject.m_MyGuild).sGuildName);
    end else begin
      sMsg:='无';
    end;
    exit;
  end;
  if sVariable = '$RANKNAME' then begin
    sMsg:=sub_49ADB8(sMsg,'<$RANKNAME>',PlayObject.m_sGuildRankName);
    exit;
  end;

  if sVariable = '$LEVEL' then begin
    sText:=IntToStr(PlayObject.m_Abil.Level);
    sMsg:=sub_49ADB8(sMsg,'<$LEVEL>',sText);
    exit;
  end;

  if sVariable = '$HP' then begin
    sText:=IntToStr(PlayObject.m_WAbil.HP);
    sMsg:=sub_49ADB8(sMsg,'<$HP>',sText);
    exit;
  end;
  if sVariable = '$MAXHP' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MaxHP);
    sMsg:=sub_49ADB8(sMsg,'<$MAXHP>',sText);
    exit;
  end;

  if sVariable = '$MP' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MP);
    sMsg:=sub_49ADB8(sMsg,'<$MP>',sText);
    exit;
  end;
  if sVariable = '$MAXMP' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MaxMP);
    sMsg:=sub_49ADB8(sMsg,'<$MAXMP>',sText);
    exit;
  end;

  if sVariable = '$AC' then begin
    sText:=IntToStr(LoWord(PlayObject.m_WAbil.AC));
    sMsg:=sub_49ADB8(sMsg,'<$AC>',sText);
    exit;
  end;
  if sVariable = '$MAXAC' then begin
    sText:=IntToStr(HiWord(PlayObject.m_WAbil.AC));
    sMsg:=sub_49ADB8(sMsg,'<$MAXAC>',sText);
    exit;
  end;
  if sVariable = '$MAC' then begin
    sText:=IntToStr(LoWord(PlayObject.m_WAbil.MAC));
    sMsg:=sub_49ADB8(sMsg,'<$MAC>',sText);
    exit;
  end;
  if sVariable = '$MAXMAC' then begin
    sText:=IntToStr(HiWord(PlayObject.m_WAbil.MAC));
    sMsg:=sub_49ADB8(sMsg,'<$MAXMAC>',sText);
    exit;
  end;

  if sVariable = '$DC' then begin
    sText:=IntToStr(LoWord(PlayObject.m_WAbil.DC));
    sMsg:=sub_49ADB8(sMsg,'<$DC>',sText);
    exit;
  end;
  if sVariable = '$MAXDC' then begin
    sText:=IntToStr(HiWord(PlayObject.m_WAbil.DC));
    sMsg:=sub_49ADB8(sMsg,'<$MAXDC>',sText);
    exit;
  end;

  if sVariable = '$MC' then begin
    sText:=IntToStr(LoWord(PlayObject.m_WAbil.MC));
    sMsg:=sub_49ADB8(sMsg,'<$MC>',sText);
    exit;
  end;
  if sVariable = '$MAXMC' then begin
    sText:=IntToStr(HiWord(PlayObject.m_WAbil.MC));
    sMsg:=sub_49ADB8(sMsg,'<$MAXMC>',sText);
    exit;
  end;

  if sVariable = '$SC' then begin
    sText:=IntToStr(LoWord(PlayObject.m_WAbil.SC));
    sMsg:=sub_49ADB8(sMsg,'<$SC>',sText);
    exit;
  end;
  if sVariable = '$MAXSC' then begin
    sText:=IntToStr(HiWord(PlayObject.m_WAbil.SC));
    sMsg:=sub_49ADB8(sMsg,'<$MAXSC>',sText);
    exit;
  end;

  if sVariable = '$EXP' then begin
    sText:=IntToStr(PlayObject.m_Abil.Exp);
    sMsg:=sub_49ADB8(sMsg,'<$EXP>',sText);
    exit;
  end;
  if sVariable = '$MAXEXP' then begin
    sText:=IntToStr(PlayObject.m_Abil.MaxExp);
    sMsg:=sub_49ADB8(sMsg,'<$MAXEXP>',sText);
    exit;
  end;

  if sVariable = '$PKPOINT' then begin
    sText:=IntToStr(PlayObject.m_nPkPoint);
    sMsg:=sub_49ADB8(sMsg,'<$PKPOINT>',sText);
    exit;
  end;

  if sVariable = '$HW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.HandWeight);
    sMsg:=sub_49ADB8(sMsg,'<$HW>',sText);
    exit;
  end;
  if sVariable = '$MAXHW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MaxHandWeight);
    sMsg:=sub_49ADB8(sMsg,'<$MAXHW>',sText);
    exit;
  end;

  if sVariable = '$BW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.Weight);
    sMsg:=sub_49ADB8(sMsg,'<$BW>',sText);
    exit;
  end;
  if sVariable = '$MAXBW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MaxWeight);
    sMsg:=sub_49ADB8(sMsg,'<$MAXBW>',sText);
    exit;
  end;

  if sVariable = '$WW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.WearWeight);
    sMsg:=sub_49ADB8(sMsg,'<$WW>',sText);
    exit;
  end;
  if sVariable = '$MAXWW' then begin
    sText:=IntToStr(PlayObject.m_WAbil.MaxWearWeight);
    sMsg:=sub_49ADB8(sMsg,'<$MAXWW>',sText);
    exit;
  end;

  if sVariable = '$GOLDCOUNT' then begin
    sText:=IntToStr(PlayObject.m_nGold) + '/' + IntToStr(PlayObject.m_nGoldMax);
    sMsg:=sub_49ADB8(sMsg,'<$GOLDCOUNT>',sText);
    exit;
  end;
  if sVariable = '$GAMEGOLD' then begin
    sText:=IntToStr(PlayObject.m_nGameGold);
    sMsg:=sub_49ADB8(sMsg,'<$GAMEGOLD>',sText);
    exit;
  end;
  if sVariable = '$GAMEPOINT' then begin
    sText:=IntToStr(PlayObject.m_nGamePoint);
    sMsg:=sub_49ADB8(sMsg,'<$GAMEPOINT>',sText);
    exit;
  end;
  if sVariable = '$PCPOINT' then begin  //PC规 器牢飘
    sText:=IntToStr(PlayObject.m_nPCPoint);
    sMsg:=sub_49ADB8(sMsg,'<$PCPOINT>',sText);
    exit;
  end;

  if sVariable = '$LOGINTIME' then begin
    sText:=DateTimeToStr(PlayObject.m_dLogonTime);
    sMsg:=sub_49ADB8(sMsg,'<$LOGINTIME>',sText);
    exit;
  end;
  if sVariable = '$LOGINLONG' then begin
    sText:=IntToStr((GetTickCount - PlayObject.m_dwLogonTick) div 60000) + '盒';
    sMsg:=sub_49ADB8(sMsg,'<$LOGINLONG>',sText);
    exit;
  end;
  if sVariable = '$DRESS' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_DRESS].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$DRESS>',sText);
    exit;
  end else
  if sVariable = '$WEAPON' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_WEAPON].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$WEAPON>',sText);
    exit;
  end else
  if sVariable = '$RIGHTHAND' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_RIGHTHAND].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$RIGHTHAND>',sText);
    exit;
  end else
  if sVariable = '$HELMET' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_HELMET].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$HELMET>',sText);
    exit;
  end else
  if sVariable = '$NECKLACE' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_NECKLACE].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$NECKLACE>',sText);
    exit;
  end else
  if sVariable = '$RING_R' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_RINGR].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$RING_R>',sText);
    exit;
  end else
  if sVariable = '$RING_L' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_RINGL].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$RING_L>',sText);
    exit;
  end else 
  if sVariable = '$ARMRING_R' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_ARMRINGR].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$ARMRING_R>',sText);
    exit;
  end else
  if sVariable = '$ARMRING_L' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_ARMRINGL].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$ARMRING_L>',sText);
    exit;
  end else
  if sVariable = '$BUJUK' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BUJUK].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$BUJUK>',sText);
    exit;
  end else
  if sVariable = '$BELT' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BELT].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$BELT>',sText);
    exit;
  end else
  if sVariable = '$BOOTS' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BOOTS].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$BOOTS>',sText);
    exit;
  end else
  if sVariable = '$CHARM' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_CHARM].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$CHARM>',sText);
    exit;
  end else
  if sVariable = '$TIGER' then begin  //龋尔捞
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_TIGER].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$TIGER>',sText);
    exit;
  end else
  if sVariable = '$PETS1' then begin       //龋尔捞
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS1].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PETS1>',sText);
    exit;
  end else
  if sVariable = '$PETS2' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS2].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PETS2>',sText);
    exit;
  end else
  if sVariable = '$PETS3' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS3].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PETS3>',sText);
    exit;
  end else
  if sVariable = '$PETS4' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS4].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PETS4>',sText);
    exit;
  end else
  if sVariable = '$PETS5' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS5].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PETS5>',sText);
    exit;
  end else
  if sVariable = '$PFISH1' then begin                                            //超矫
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH1].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PFISH1>',sText);
    exit;
  end else
  if sVariable = '$PFISH2' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH2].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PFISH2>',sText);
    exit;
  end else
  if sVariable = '$PFISH3' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH3].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PFISH3>',sText);
    exit;
  end else
  if sVariable = '$PFISH4' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH4].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PFISH4>',sText);
    exit;
  end else
  if sVariable = '$PFISH5' then begin
    sText:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH5].wIndex);
    sMsg:=sub_49ADB8(sMsg,'<$PFISH5>',sText);
    exit;
  end else
  if sVariable = '$IPADDR' then begin
    sText:=PlayObject.m_sIPaddr;
    sMsg:=sub_49ADB8(sMsg,'<$IPADDR>',sText);
    exit;
  end else
  if sVariable = '$IPLOCAL' then begin
    sText:=PlayObject.m_sIPLocal;// GetIPLocal(PlayObject.m_sIPaddr);
    sMsg:=sub_49ADB8(sMsg,'<$IPLOCAL>',sText);
    exit;
  end else
  if sVariable = '$GUILDBUILDPOINT' then begin
    if PlayObject.m_MyGuild = nil then begin
      sText:='无';
    end else begin
      sText:=IntToStr(TGuild(PlayObject.m_MyGuild).nBuildPoint);
    end;
    sMsg:=sub_49ADB8(sMsg,'<$GUILDBUILDPOINT>',sText);
    exit;
  end else
  if sVariable = '$GUILDAURAEPOINT' then begin
    if PlayObject.m_MyGuild = nil then begin
      sText:='无';
    end else begin
      sText:=IntToStr(TGuild(PlayObject.m_MyGuild).nAurae);
    end;
    sMsg:=sub_49ADB8(sMsg,'<$GUILDAURAEPOINT>',sText);
    exit;
  end else
  if sVariable = '$GUILDSTABILITYPOINT' then begin
    if PlayObject.m_MyGuild = nil then begin
      sText:='无';
    end else begin
      sText:=IntToStr(TGuild(PlayObject.m_MyGuild).nStability);
    end;
    sMsg:=sub_49ADB8(sMsg,'<$GUILDSTABILITYPOINT>',sText);
    exit;
  end;
  if sVariable = '$GUILDFLOURISHPOINT' then begin
    if PlayObject.m_MyGuild = nil then begin
      sText:='无';
    end else begin
      sText:=IntToStr(TGuild(PlayObject.m_MyGuild).nFlourishing);
    end;
    sMsg:=sub_49ADB8(sMsg,'<$GUILDFLOURISHPOINT>',sText);
    exit;
  end;

//其它信息
  if sVariable = '$REQUESTCASTLEWARITEM' then begin
    sText:=g_Config.sZumaPiece;
    sMsg:=sub_49ADB8(sMsg,'<$REQUESTCASTLEWARITEM>',sText);
    exit;
  end;
  if sVariable = '$REQUESTCASTLEWARDAY' then begin
    sText:=g_Config.sZumaPiece;
    sMsg:=sub_49ADB8(sMsg,'<$REQUESTCASTLEWARDAY>',sText);
    exit;
  end;
  if sVariable = '$REQUESTBUILDGUILDITEM' then begin
    sText:=g_Config.sWoomaHorn;
    sMsg:=sub_49ADB8(sMsg,'<$REQUESTBUILDGUILDITEM>',sText);
    exit;
  end;
  //傍己包访
  if CompareLStr(sVariable,'$OWNERGUILD(',Length('$OWNERGUILD(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    m_Castle:=g_CastleManager.GetCastle(StrToInt(s14));
    if m_Castle <> nil then begin
      sText:=TUserCastle(m_Castle).m_sOwnGuild;
      if sText = '' then sText:='管理员';
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',sText);
    exit;
  end;

  if CompareLStr(sVariable,'$CASTLENAME(',Length('$CASTLENAME(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    m_Castle:=g_CastleManager.GetCastle(StrToInt(s14));
    if m_Castle <> nil then begin
      sText:=TUserCastle(m_Castle).m_sName;
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',sText);
    exit;
  end;

  if sVariable = '$CASTLERUNTIME' then begin
    sText:=IntToStr(g_Config.dwCastleWarTime div 60000);
    sMsg:=sub_49ADB8(sMsg,'<$CASTLERUNTIME>',sText);
    exit;
  end;

  if CompareLStr(sVariable,'$LORD(',Length('$LORD(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    m_Castle:=g_CastleManager.GetCastle(StrToInt(s14));
    if m_Castle <> nil then begin
      if TUserCastle(m_Castle).m_MasterGuild <> nil then begin
        sText:=TUserCastle(m_Castle).m_MasterGuild.GetChiefName();
      end else sText:='城主';
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',sText);
    exit;
  end;

  if sVariable = '$GUILDWARFEE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$GUILDWARFEE>',GetGoldStr(g_Config.nGuildWarPrice));
    exit;
  end;
  if sVariable = '$BUILDGUILDFEE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$BUILDGUILDFEE>',GetGoldStr(g_Config.nBuildGuildPrice));
    exit;
  end;

  if CompareLStr(sVariable,'$CASTLEWARDATE(',Length('$CASTLEWARDATE(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    m_Castle:=g_CastleManager.GetCastle(StrToInt(s14));
    if m_Castle <> nil then begin
      sText:=TUserCastle(m_Castle).GetWarDate();
      sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',sText);
    end else begin
      sText:='????';
    end;
    exit;
  end;

  if sVariable = '$CASTLECHANGEDATE' then begin
    if m_Castle <> nil then begin
      sText:=DateTimeToStr(TUserCastle(m_Castle).m_ChangeDate);
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<$CASTLECHANGEDATE>',sText);
    exit;
  end;

  if sVariable = '$CASTLEWARLASTDATE' then begin
    if m_Castle <> nil then begin
      sText:=DateTimeToStr(TUserCastle(m_Castle).m_WarDate);
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<$CASTLEWARLASTDATE>',sText);
    exit;
  end;
  if sVariable = '$CASTLEGETDAYS' then begin
    if m_Castle <> nil then begin
      sText:=IntToStr(GetDayCount(Now,TUserCastle(m_Castle).m_ChangeDate));
    end else begin
      sText:='????';
    end;
    sMsg:=sub_49ADB8(sMsg,'<$CASTLEGETDAYS>',sText);
    exit;
  end;



  if sVariable = '$CMD_DATE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_DATE>',g_GameCommand.DATA.sCmd);
    exit;
  end;
  if sVariable = '$CMD_ALLOWMSG' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ALLOWMSG>',g_GameCommand.ALLOWMSG.sCmd);
    exit;
  end;


  if sVariable = '$CMD_BANSTORE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_BANSTORE>',g_GameCommand.BANSTORE.sCmd);
    exit;
  end;
  if sVariable = '$CMD_LETSHOUT' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_LETSHOUT>',g_GameCommand.LETSHOUT.sCmd);
    exit;
  end;
  if sVariable = '$CMD_LETTRADE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_LETTRADE>',g_GameCommand.LETTRADE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_LETGUILD' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_LETGUILD>',g_GameCommand.LETGUILD.sCmd);
    exit;
  end;

 if sVariable = '$CMD_ENERGY' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ENERGY>',g_GameCommand.ENERGY.sCmd);
    exit;
  end;

  if sVariable = '$CMD_ENDGUILD' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ENDGUILD>',g_GameCommand.ENDGUILD.sCmd);
    exit;
  end;

  if sVariable = '$CMD_BANGUILDCHAT' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_BANGUILDCHAT>',g_GameCommand.BANGUILDCHAT.sCmd);
    exit;
  end;

  if sVariable = '$CMD_BANGROUPCHAT' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_BANGROUPCHAT>',g_GameCommand.BANGROUPCHAT.sCmd);
    exit;
  end;

  if sVariable = '$CMD_BANSYSMSG' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_BANSYSMSG>',g_GameCommand.BANSYSMSG.sCmd);
    exit;
  end;

  if sVariable = '$CMD_BANHEARMSG' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_BANHEARMSG>',g_GameCommand.BANHEARMSG.sCmd);
    exit;
  end;

  if sVariable = '$CMD_AUTHALLY' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_AUTHALLY>',g_GameCommand.AUTHALLY.sCmd);
    exit;
  end;

  if sVariable = '$CMD_ALLIANCE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ALLIANCE>',g_GameCommand.ALLIANCE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_CANCELALLIANCE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_CANCELALIANCE>',g_GameCommand.CANCELALLIANCE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_USERMOVE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_USERMOVE>',g_GameCommand.USERMOVE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_SEARCHING' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_SEARCHING>',g_GameCommand.SEARCHING.sCmd);
    exit;
  end;

  if sVariable = '$CMD_ALLOWGROUPCALL' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ALLOWGROUPCALL>',g_GameCommand.ALLOWGROUPCALL.sCmd);
    exit;
  end;

  if sVariable = '$CMD_HOMEMOVE' then begin      //付阑捞悼
    sMsg:=sub_49ADB8(sMsg,'<$CMD_HOMEMOVE>',g_GameCommand.HOMEMOVE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_REALIVEHOME' then begin      //付阑何劝
    sMsg:=sub_49ADB8(sMsg,'<$CMD_REALIVEHOME>',g_GameCommand.REALIVEHOME.sCmd);
    exit;
  end;

  if sVariable = '$CMD_MASKCLEAR' then begin      //函脚呕 秦力
    sMsg:=sub_49ADB8(sMsg,'<$CMD_MASKCLEAR>',g_GameCommand.MASKCLEAR.sCmd);
    exit;
  end;

  if sVariable = '$CMD_GMEVENT' then begin      //gm 捞亥飘
    sMsg:=sub_49ADB8(sMsg,'<$CMD_GMEVENT>',g_GameCommand.GMEVENT.sCmd);
    exit;
  end;

  if sVariable = '$CMD_GROUPRECALLL' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_GROUPRECALLL>',g_GameCommand.GROUPRECALLL.sCmd);
    exit;
  end;

  if sVariable = '$CMD_ATTACKMODE' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_ATTACKMODE>',g_GameCommand.ATTACKMODE.sCmd);
    exit;
  end;

  if sVariable = '$CMD_REST' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_REST>',g_GameCommand.REST.sCmd);
    exit;
  end;
  if sVariable = '$SAVEITEM' then begin
    sMsg:=sub_49ADB8(sMsg,'<$SAVEITEM>',IntToStr(PlayObject.m_StorageItemList.Count));
    exit;
  end;
  if sVariable = '$REMAINSAVEITEM' then begin
    sMsg:=sub_49ADB8(sMsg,'<$REMAINSAVEITEM>',IntToStr(STORAGELIMIT-PlayObject.m_StorageItemList.Count));
    exit;
  end;
  if sVariable = '$CMD_STORAGESETPASSWORD' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_STORAGESETPASSWORD>',g_GameCommand.SETPASSWORD.sCmd);
    exit;
  end;
  if sVariable = '$CMD_STORAGECHGPASSWORD' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_STORAGECHGPASSWORD>',g_GameCommand.CHGPASSWORD.sCmd);
    exit;
  end;
  if sVariable = '$CMD_STORAGELOCK' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_STORAGELOCK>',g_GameCommand.LOCK.sCmd);
    exit;
  end;
  if sVariable = '$CMD_STORAGEUNLOCK' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_STORAGEUNLOCK>',g_GameCommand.UNLOCKSTORAGE.sCmd);
    exit;
  end;
  if sVariable = '$CMD_UNLOCK' then begin
    sMsg:=sub_49ADB8(sMsg,'<$CMD_UNLOCK>',g_GameCommand.UNLOCK.sCmd);
    exit;
  end;
  if CompareLStr(sVariable,'$HUMAN(',Length('$HUMAN(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    boFoundVar:=False;
    for I := 0 to PlayObject.m_DynamicVarList.Count - 1 do begin
      DynamicVar:=PlayObject.m_DynamicVarList.Items[I];
      if CompareText(DynamicVar.sName,s14) = 0 then begin
        case DynamicVar.VarType of    
          vInteger : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(DynamicVar.nInternet));
            boFoundVar:=True;
          end;
          vString  : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',DynamicVar.sString);
            boFoundVar:=True;
          end;
        end;
        break;
      end;
    end;
    if not boFoundVar then sMsg:='??';

    exit;
  end;
  if CompareLStr(sVariable,'$GUILD(',Length('$GUILD(')) then begin
    if PlayObject.m_MyGuild = nil then exit;
    ArrestStringEx(sVariable,'(',')',s14);
    boFoundVar:=False;
    for I := 0 to TGuild(PlayObject.m_MyGuild).m_DynamicVarList.Count - 1 do begin
      DynamicVar:=TGuild(PlayObject.m_MyGuild).m_DynamicVarList.Items[I];
      if CompareText(DynamicVar.sName,s14) = 0 then begin
        case DynamicVar.VarType of
          vInteger : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(DynamicVar.nInternet));
            boFoundVar:=True;
          end;
          vString  : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',DynamicVar.sString);
            boFoundVar:=True;
          end;
        end;
        break;
      end;
    end;
    if not boFoundVar then sMsg:='??';
    exit;
  end;
  if CompareLStr(sVariable,'$GLOBAL(',Length('$GLOBAL(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    boFoundVar:=False;
    for I := 0 to g_DynamicVarList.Count - 1 do begin
      DynamicVar:=g_DynamicVarList.Items[I];
      if CompareText(DynamicVar.sName,s14) = 0 then begin
        case DynamicVar.VarType of
          vInteger : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(DynamicVar.nInternet));
            boFoundVar:=True;
          end;
          vString  : begin
            sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',DynamicVar.sString);
            boFoundVar:=True;
          end;
        end;
        break;
      end;
    end;
    if not boFoundVar then sMsg:='??';
    exit;
  end;
  if CompareLStr(sVariable,'$STR(',Length('$STR(')) then begin
    ArrestStringEx(sVariable,'(',')',s14);
    n18:=GetValNameNo(s14);
    if n18 >= 0 then begin
      case n18 of
        0..9: begin
          sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(PlayObject.m_nVal[n18]));
        end;
        100..119: begin
          sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(g_Config.GlobalVal[n18 - 100]));
        end;
        200..209: begin
          sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(PlayObject.m_DyVal[n18 - 200]));
        end;
        300..399: begin
          sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(PlayObject.m_nMval[n18 - 300]));
        end;
        400..499: begin
          sMsg:=sub_49ADB8(sMsg,'<' + sVariable + '>',IntToStr(g_Config.GlobaDyMval[n18 - 400]));
        end;
      end;
    end;
  end;
end;

procedure TNormNpc.GotoLable(AObject: TPlayObject;sLabel:String;boExtJmp:Boolean); //0049E584
var
  I,II,III: Integer;
  List1C:TStringList;
  bo11:Boolean;
  n18:Integer;
  n20:Integer;
  sSendMsg:String;
  Script:pTScript;
  Script3C:pTScript;
  SayingRecord:pTSayingRecord;
  SayingProcedure:pTSayingProcedure;
  UserItem:pTUserItem;
  PlayObject: TPlayObject;
  BaseObject: TBaseObject;
  sC:String;
  pqa: PTQuestActioninfo;
  function IsPlayObject: Boolean;
  begin
    Result := (BaseObject <> nil) and (BaseObject.m_btRaceServer = RC_PLAYOBJECT) and (BaseObject = PlayObject);
  end;
  function IsHeroObject: Boolean;
  begin
    Result := (BaseObject <> nil) and (BaseObject.m_btRaceServer = RC_HEROOBJECT);
  end;
  function CheckQuestStatus(ScriptInfo:pTScript):Boolean;//0049BA00
  var
    I:Integer;
  begin
    Result:=True;
    if not ScriptInfo.boQuest then exit;
    I:=0;
    while (True) do begin
      if (ScriptInfo.QuestInfos[I].nRandRage > 0) and (Random(ScriptInfo.QuestInfos[I].nRandRage) <> 0) then begin
        Result:=False;
        break;
      end;
      if PlayObject.GetQuestFalgStatus(ScriptInfo.QuestInfos[I].wFlag) <> ScriptInfo.QuestInfos[I].btValue then begin
        Result:=False;
        break;
      end;
      Inc(I);
      if I >= 10 then break;
    end;    // while
  end;
  function CheckItemW(sItemType:String;nParam:Integer):pTUserItem; //0049BA7C
  var
    nCount:Integer;
  begin
    Result:=nil;
    if CompareLStr(sItemType,'[NECKLACE]',4) then begin
      if PlayObject.m_UseItems[U_NECKLACE].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_NECKLACE];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[RING]',4) then begin
      if PlayObject.m_UseItems[U_RINGL].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_RINGL];
      end;
      if PlayObject.m_UseItems[U_RINGR].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_RINGR];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[ARMRING]',4) then begin
      if PlayObject.m_UseItems[U_ARMRINGL].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_ARMRINGL];
      end;
      if PlayObject.m_UseItems[U_ARMRINGR].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_ARMRINGR];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[WEAPON]',4) then begin
      if PlayObject.m_UseItems[U_WEAPON].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_WEAPON];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[HELMET]',4) then begin
      if PlayObject.m_UseItems[U_HELMET].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_HELMET];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[BUJUK]',4) then begin
      if PlayObject.m_UseItems[U_BUJUK].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_BUJUK];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[BELT]',4) then begin
      if PlayObject.m_UseItems[U_BELT].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_BELT];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[BOOTS]',4) then begin
      if PlayObject.m_UseItems[U_BOOTS].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_BOOTS];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[CHARM]',4) then begin
      if PlayObject.m_UseItems[U_CHARM].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_CHARM];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[TIGER]',4) then begin  //龋尔捞
      if PlayObject.m_UseItems[U_TIGER].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_TIGER];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PETS1]',4) then begin    //龋尔捞
      if PlayObject.m_UseItems[U_PETS1].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_PETS1];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PETS2]',4) then begin
      if PlayObject.m_UseItems[U_PETS2].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_PETS2];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PETS3]',4) then begin
      if PlayObject.m_UseItems[U_PETS3].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_PETS3];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PETS4]',4) then begin
      if PlayObject.m_UseItems[U_PETS4].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_PETS4];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PETS5]',4) then begin
      if PlayObject.m_UseItems[U_PETS5].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_PETS5];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PFISH1]',4) then begin    //超矫
      if PlayObject.m_UseItems[U_FISH1].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_FISH1];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PFISH2]',4) then begin
      if PlayObject.m_UseItems[U_FISH2].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_FISH2];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PFISH3]',4) then begin
      if PlayObject.m_UseItems[U_FISH3].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_FISH3];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PFISH4]',4) then begin
      if PlayObject.m_UseItems[U_FISH4].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_FISH4];
      end;
      exit;
    end;
    if CompareLStr(sItemType,'[PFISH5]',4) then begin
      if PlayObject.m_UseItems[U_FISH5].wIndex > 0 then begin
        Result:=@PlayObject.m_UseItems[U_FISH5];
      end;
      exit;
    end;
    Result:=PlayObject.sub_4C4CD4(sItemType,nCount);
    if nCount < nParam then
      Result:=nil;
  end;
  function CheckStringList(sHumName,sListFileName:String):Boolean;//0049B47C
  var
    I: Integer;
    LoadList:TStringList;
  begin
    Result:=False;
    sListFileName:=g_Config.sEnvirDir + sListFileName;
    if FileExists(sListFileName) then begin
      LoadList:=TStringList.Create;
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('加载失败.... => ' + sListFileName);
      end;
      for I := 0 to LoadList.Count - 1 do begin
        if CompareText(Trim(LoadList.Strings[I]),sHumName) = 0 then begin
          Result:=True;
          break;
        end;
      end;
      LoadList.Free;
    end else begin
      MainOutMessage('保存失败 => ' + sListFileName);
    end;
  end;

  function CheckCountList(sListFileName, sItemName, sCount: string): Boolean;  //肮荐 葛酒坷扁
  var
    I: Integer;
    LoadList: TStringList;
    s10, sName, nCount: String;
  begin
    Result := False;
    sListFileName := g_Config.sEnvirDir + sListFileName;
    if FileExists(sListFileName) then begin
      LoadList := TStringList.Create;
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('加载失败.... => ' + sListFileName);
      end;
      for I := 0 to LoadList.Count - 1 do begin
        s10 := Trim(LoadList.Strings[I]);
        if s10[1] = ';' then Continue;
        nCount := GetValidStr3(s10, sName, [' ', '/', #9]);
        nCount := Trim(nCount);
        if CompareText(sItemName, sName) = 0 then begin
          if StrToInt(nCount) >= StrToInt(sCount) then begin
            Result := True;
            Break;
          end;
        end;
      end;
      LoadList.Free;
    end else begin
      MainOutMessage('file not found => ' + sListFileName);
    end;
  end;


  function QuestCheckCondition(ConditionList:TList):Boolean; //0049BCA8
  var
    I: Integer;
    QuestConditionInfo:pTQuestConditionInfo;
    n10,n14,n18,n1C,nMaxDura,nDura:Integer;
    Hour, Min, Sec, MSec: Word;
    Envir:TEnvirnoment;
    StdItem:TItem;
    nFame, param: integer;   //懦单胶
  begin
    Result:=True;
    for I := 0 to ConditionList.Count - 1 do begin
      QuestConditionInfo:=ConditionList.Items[i];
      BaseObject := QuestConditionInfo.Script.GetActorObject(Self, AObject); //转换运行对象
      if BaseObject = nil then begin
        Result := False;
        Break;
      end else begin
        if BaseObject.m_btRaceServer = RC_PLAYOBJECT then
          PlayObject := TPlayObject(BaseObject) else PlayObject := nil;
      end;
      case QuestConditionInfo.nCmdCode of    //
        nCHECK: begin
          n14:=Str_ToInt(QuestConditionInfo.sParam1,0);
          n18:=Str_ToInt(QuestConditionInfo.sParam2,0);
          n10:=PlayObject.GetQuestFalgStatus(n14);
          if n10 = 0 then begin
            if n18 <> 0 then Result:=False;
          end else begin
            if n18 = 0 then Result:=False;
          end;
        end;
        nRANDOM: begin
           Randomize;
          if Random(QuestConditionInfo.nParam1) <> 0 then
            Result:=False;
        end;
        nGENDER: begin
          if CompareText(QuestConditionInfo.sParam1,sMAN) = 0 then begin
            if PlayObject.m_btGender <> gMan then Result:=False;
          end else begin
            if PlayObject.m_btGender <> gWoMan then Result:=False;
          end;
        end;
        nDAYTIME: begin
          if CompareText(QuestConditionInfo.sParam1,sSUNRISE) = 0 then begin
            if g_nGameTime <> 0 then Result:=False;
          end;
          if CompareText(QuestConditionInfo.sParam1,sDAY) = 0 then begin
            if g_nGameTime <> 1 then Result:=False;
          end;
          if CompareText(QuestConditionInfo.sParam1,sSUNSET) = 0 then begin
            if g_nGameTime <> 2 then Result:=False;
          end;
          if CompareText(QuestConditionInfo.sParam1,sNIGHT) = 0 then begin
            if g_nGameTime <> 3 then Result:=False;
          end;
        end;
        nCHECKOPEN: begin
          n14:=Str_ToInt(QuestConditionInfo.sParam1,0);
          n18:=Str_ToInt(QuestConditionInfo.sParam2,0);
          n10:=PlayObject.GetQuestUnitOpenStatus(n14);
          if n10 = 0 then begin
            if n18 <> 0 then Result:=False;
          end else begin
            if n18 = 0 then Result:=False;
          end;
        end;
        nCHECKUNIT: begin
          n14:=Str_ToInt(QuestConditionInfo.sParam1,0);
          n18:=Str_ToInt(QuestConditionInfo.sParam2,0);
          n10:=PlayObject.GetQuestUnitStatus(n14);
          if n10 = 0 then begin
            if n18 <> 0 then Result:=False;
          end else begin
            if n18 = 0 then Result:=False;
          end;
        end;
        nCHECKLEVEL: if PlayObject.m_Abil.Level < QuestConditionInfo.nParam1 then Result:=False;
        nCHECKJOB: begin
          if CompareLStr(QuestConditionInfo.sParam1,sWarrior,Length(sWarrior)) then begin
            if PlayObject.m_btJob <> jWarr then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sWizard,Length(sWizard)) then begin
            if PlayObject.m_btJob <> jWizard then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sTaos,Length(sTaos)) then begin
            if PlayObject.m_btJob <> jTaos then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sAssassin,Length(sAssassin)) then begin
            if PlayObject.m_btJob <> jAssassin then Result:=False;       //磊按
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sBonze,Length(sBonze)) then begin
            if PlayObject.m_btJob <> jBonze then Result:=False;       //铰妨
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sUpWarr,Length(sUpWarr)) then begin
            if PlayObject.m_btJob <> jUpWarr then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sUpWiz,Length(sUpWiz)) then begin
            if PlayObject.m_btJob <> jUpWiz then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sUpTao,Length(sUpTao)) then begin
            if PlayObject.m_btJob <> jUpTao then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sUpAssa,Length(sUpAssa)) then begin
            if PlayObject.m_btJob <> jUpAssa then Result:=False;       //殿急磊按
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sUpBonze,Length(sUpBonze)) then begin
            if PlayObject.m_btJob <> jUpBoz then Result:=False;       //殿急磊按
          end;
        end;
        nCHECKHEROJOB: begin    //康旷流诀
            if CompareLStr(QuestConditionInfo.sParam1, sWARRIOR, Length(sWARRIOR)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jWarr then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sWIZARD, Length(sWIZARD)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jWizard then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sTAOS, Length(sTAOS)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jTaos then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sAssassin, Length(sAssassin)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jAssassin then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sBonze, Length(sBonze)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jBonze then Result := False;
            end;

            if CompareLStr(QuestConditionInfo.sParam1, sUPWARR, Length(sUPWARR)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jUpWarr then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sUPWIZ, Length(sUPWIZ)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jUpWiz then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sUpTao, Length(sUpTao)) then begin
              if THeroObject(BaseObject).m_btJob <> jUpTao then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sUpAssa, Length(sUpAssa)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jUpAssa then Result := False;
            end;
            if CompareLStr(QuestConditionInfo.sParam1, sUpBonze, Length(sUpBonze)) then begin
              if THeroObject(PlayObject.m_MyHero).m_btJob <> jUpBoz then Result := False;
            end;

          end;
        nCHECKBBCOUNT: if PlayObject.m_SlaveList.Count < QuestConditionInfo.nParam1 then Result:=False;
        nCHECKITEM: begin    //拱距 眉农
          UserItem:=PlayObject.FindItemNameEx(QuestConditionInfo.sParam1,n1C,nMaxDura,nDura);
          if n1C < QuestConditionInfo.nParam2 then
            Result:=False;
        end;
        nCHECKITEMW: begin
          UserItem:=CheckItemW(QuestConditionInfo.sParam1,QuestConditionInfo.nParam2);
          if UserItem = nil then
            Result:=False;
        end;

        nCHECKGOLD: if PlayObject.m_nGold < QuestConditionInfo.nParam1 then Result:=False;
        nISTAKEITEM: if sC <> QuestConditionInfo.sParam1 then Result:=False;
        nCHECKDURA: begin
          UserItem:=PlayObject.FindItemNameEx(QuestConditionInfo.sParam1,n1C,nMaxDura,nDura);
          if ROUND(nDura / 1000) < QuestConditionInfo.nParam2 then
            Result:=False;
        end;
        nCHECKDURAEVA: begin
          UserItem:=PlayObject.FindItemNameEx(QuestConditionInfo.sParam1,n1C,nMaxDura,nDura);
          if n1C > 0 then begin
            if ROUND(nMaxDura / n1C / 1000) < QuestConditionInfo.nParam2 then
              Result:=False;
          end else Result:=False;
        end;
        nDAYOFWEEK: begin
          if CompareLStr(QuestConditionInfo.sParam1,sSUN,Length(sSUN)) then begin
            if DayOfWeek(Now) <> 1 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sMON,Length(sMON)) then begin
            if DayOfWeek(Now) <> 2 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sTUE,Length(sTUE)) then begin
            if DayOfWeek(Now) <> 3 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sWED,Length(sWED)) then begin
            if DayOfWeek(Now) <> 4 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sTHU,Length(sTHU)) then begin
            if DayOfWeek(Now) <> 5 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sFRI,Length(sFRI)) then begin
            if DayOfWeek(Now) <> 6 then Result:=False;
          end;
          if CompareLStr(QuestConditionInfo.sParam1,sSAT,Length(sSAT)) then begin
            if DayOfWeek(Now) <> 7 then Result:=False;
          end;
        end;
        nHOUR: begin
          if (QuestConditionInfo.nParam1 <> 0) and (QuestConditionInfo.nParam2 = 0) then
            QuestConditionInfo.nParam2:=QuestConditionInfo.nParam1;
          DecodeTime(Time,Hour, Min, Sec, MSec);
          if (Hour < QuestConditionInfo.nParam1) or (Hour > QuestConditionInfo.nParam2) then
            Result:=False;
        end;
        nMIN: begin
          if (QuestConditionInfo.nParam1 <> 0) and (QuestConditionInfo.nParam2 = 0) then
            QuestConditionInfo.nParam2:=QuestConditionInfo.nParam1;
          DecodeTime(Time,Hour, Min, Sec, MSec);
          if (Min < QuestConditionInfo.nParam1) or (Min > QuestConditionInfo.nParam2) then
            Result:=False;
        end;
        nCHECKPKPOINT: if PlayObject.PKLevel < QuestConditionInfo.nParam1 then Result:=False;
          
        nCHECKLUCKYPOINT: if PlayObject.m_nBodyLuckLevel < QuestConditionInfo.nParam1 then Result:=False;
        nCHECKMONMAP: begin
          Envir:=g_MapManager.FindMap(QuestConditionInfo.sParam1);
          if Envir <> nil then begin
            if UserEngine.GetMapMonster(Envir,nil) < QuestConditionInfo.nParam2 then Result:=False;
          end;

        end;
        nCHECKMONAREA:;
        nCHECKHUM: begin //0049C4CB
          if UserEngine.GetMapHuman(QuestConditionInfo.sParam1) < QuestConditionInfo.nParam2 then Result:=False;
        end;


        nCHECKBAGGAGE: begin
          if PlayObject.IsEnoughBag then begin
            if QuestConditionInfo.sParam1 <> '' then begin
              Result:=False;
              StdItem:=UserEngine.GetStdItem(QuestConditionInfo.sParam1);
              if StdItem <> nil then begin
                if PlayObject.IsAddWeightAvailable(StdItem.Weight) then
                  Result:=True;
              end;
            end;
          end else Result:=False;
        end;
        nCHECKNAMELIST: if not CheckStringList(PlayObject.m_sCharName,m_sPath + QuestConditionInfo.sParam1) then Result:=False;      //眉农
        nCHECKACCOUNTLIST: if not CheckStringList(PlayObject.m_sUserID,m_sPath + QuestConditionInfo.sParam1) then Result:=False;
        nCHECKIPLIST: if not CheckStringList(PlayObject.m_sIPaddr,m_sPath + QuestConditionInfo.sParam1) then Result:=False;
        nCHECKCOUNTLIST: if not CheckCountList(m_sPath + QuestConditionInfo.sParam1, QuestConditionInfo.sParam2, QuestConditionInfo.sParam3) then Result := False;       //肮荐 葛酒坷扁

        nEQUAL: begin  //0049C5AC
          n10:=GetValNameNo(QuestConditionInfo.sParam1);
          if n10 >= 0 then begin
            case n10 of    //
              0..9: begin
                if PlayObject.m_nVal[n10] <> QuestConditionInfo.nParam2 then Result:=False;
              end;
              100..119: begin
                if g_Config.GlobalVal[n10 - 100] <> QuestConditionInfo.nParam2 then Result:=False;
              end;
              200..209: begin
                if PlayObject.m_DyVal[n10 - 200] <> QuestConditionInfo.nParam2 then Result:=False;
              end;
              300..399: begin
                if PlayObject.m_nMval[n10 - 300] <> QuestConditionInfo.nParam2 then Result:=False;
              end;
              400..499: begin
                if g_Config.GlobaDyMval[n10 - 400] <> QuestConditionInfo.nParam2 then Result:=False;
              end;
           end;    // case
          end else Result:=False;
        end;
        nLARGE: begin //0049C658
          n10:=GetValNameNo(QuestConditionInfo.sParam1);
          if n10 >= 0 then begin
            case n10 of    //
              0..9: begin
                if PlayObject.m_nVal[n10] <= QuestConditionInfo.nParam2 then Result:=False;
              end;
              100..119: begin
                if g_Config.GlobalVal[n10 - 100] <= QuestConditionInfo.nParam2 then Result:=False;
              end;
              200..209: begin
                if PlayObject.m_DyVal[n10 - 200] <= QuestConditionInfo.nParam2 then Result:=False;
              end;
              300..399: begin
                if PlayObject.m_nMval[n10 - 300] <= QuestConditionInfo.nParam2 then Result:=False;
              end;
              400..499: begin
                if g_Config.GlobaDyMval[n10 - 400] <= QuestConditionInfo.nParam2 then Result:=False;
              end;
           end;    // case
          end else Result:=False;            
        end;

        nSMALL: begin  //0049C704
          n10:=GetValNameNo(QuestConditionInfo.sParam1);
          if n10 >= 0 then begin
            case n10 of    //
              0..9: begin
                if PlayObject.m_nVal[n10] >= QuestConditionInfo.nParam2 then Result:=False;
              end;
              100..119: begin
                if g_Config.GlobalVal[n10 - 100] >= QuestConditionInfo.nParam2 then Result:=False;
              end;
              200..209: begin
                if PlayObject.m_DyVal[n10 - 200] >= QuestConditionInfo.nParam2 then Result:=False;
              end;
              300..399: begin
                if PlayObject.m_nMval[n10 - 300] >= QuestConditionInfo.nParam2 then Result:=False;
              end;
              400..499: begin
                if g_Config.GlobaDyMval[n10 - 400] >= QuestConditionInfo.nParam2 then Result:=False;
              end;
           end;
          end else Result:=False;
        end;
        //懦单胶 疙飞绢
        nCHECKFAMEGRADE: begin        //懦单胶 殿鞭 犬牢
           PlayObject.GetFameName(nFame);
           if nFame < QuestConditionInfo.nParam1 then begin
              Result := FALSE;
           end;
        end;

       nCHECKLOVERDAY: begin  //楷牢 胶媚 扁埃 眉农
          if TPlayObject(PlayObject).fLover <> nil then begin
            param := Str_ToInt( QuestConditionInfo.sParam1, 0 );
             if Str_ToInt( TPlayObject(PlayObject).fLover.GetLoverDays, 0 ) < param then
               Result := FALSE;
             end else begin
               Result := FALSE;
             end;
        end;


        nCHECKKILLPOINT: begin    //懦 器牢飘 犬牢
           nFame := PlayObject.m_Abil.KillPointCurr;
           if nFame < QuestConditionInfo.nParam1 then begin
              Result := FALSE;
           end;
        end;


        nSC_ISSYSOP: if not (PlayObject.m_btPermission >= 4) then Result:=False;
        nSC_ISADMIN: if not (PlayObject.m_btPermission >= 6) then Result:=False;

        nUNDERWAR: begin     //傍己吝牢瘤
          m_Castle:=g_CastleManager.GetCastle(QuestConditionInfo.nParam1);
          if m_Castle <> nil then begin
            if not TUserCastle(m_Castle).m_boUnderWar then begin
              Result:=False;
            end;
          end;
        end;

        nSC_CHECKGROUPCOUNT:    if not ConditionOfCheckGroupCount(PlayObject,QuestConditionInfo) then Result:=False;     //弊缝盔 牢盔荐 眉农
        nSC_CHECKPOSEDIR:       if not ConditionOfCheckPoseDir(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKPOSELEVEL:     if not ConditionOfCheckPoseLevel(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKPOSEGENDER:    if not ConditionOfCheckPoseGender(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKCOLUMN:        if not ConditionOfCheckColumn(PlayObject,QuestConditionInfo) then Result:=False; //全焊窜
        nSC_CHECKLEVELEX:       if not ConditionOfCheckLevelEx(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKBONUSPOINT:    if not ConditionOfCheckBonusPoint(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_HASGUILD:           if not ConditionOfCheckHaveGuild(PlayObject,QuestConditionInfo) then Result:=False;

        nCHECKGROUPNEARBY:      if not ConditionOfCheckGroupNearby(PlayObject,QuestConditionInfo) then Result:=False;    //弊缝盔甸捞 鞍篮 甘俊 乐唱 眉农

        nSC_ISGUILDMASTER:      if not ConditionOfCheckIsGuildMaster(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CASTLEMASTERKING:   if not ConditionOfCastleMasterKing(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKCASTLEMASTER:  if not ConditionOfCheckIsCastleMaster(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ISCASTLEGUILD:      if not ConditionOfCheckIsCastleaGuild(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_CHECKCASTLEGUILD   :if not ConditionOfCheckCastleaGuild(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_CHECKCASTLEKING    :if not ConditionOfCheckCastleaMasterGuild(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_ATTACKWARGUILD      :if not ConditionOfCheckAttackWarGuild(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_DEFENSEWARGUILD     :if not ConditionOfCheckDefenseWarGuild(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_CHECKCASTLEAREA     :if not ConditionOfCheckCastleArea(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKCASTLERECALL   :if PlayObject.m_boCastleRecall then Result:=False;
        nSC_CHECKCASTLEDOOR    :if not ConditionOfCheckCastleDoorStatus(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ISDEFENSEALLYGUILD :if not ConditionOfCheckIsDefenseAllyGuild(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKNAMEIPLIST:    if not ConditionOfCheckNameIPList(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKACCOUNTIPLIST: if not ConditionOfCheckAccountIPList(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKSLAVECOUNT:    if not ConditionOfCheckSlaveCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ISNEWHUMAN:         if not PlayObject.m_boNewHuman then Result:=False;
        nSC_ISNEWHERO: if (not THeroObject(PlayObject.m_MyHero).m_boNewHero) then Result := False;
        nSC_CHECKGAMEGOLD:      if not ConditionOfCheckGameGold(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKGAMEPOINT:     if not ConditionOfCheckGamePoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKNAMELISTPOSITION:  if not ConditionOfCheckNameListPostion(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKGUILDLIST: begin
          if PlayObject.m_MyGuild <> nil then begin
            if not CheckStringList(TGuild(PlayObject.m_MyGuild).sGuildName,m_sPath + QuestConditionInfo.sParam1) then Result:=False;
          end else Result:=False;
        end;
        nSC_CHECKRENEWLEVEL:    if not ConditionOfCheckReNewLevel(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKSLAVELEVEL:    if not ConditionOfCheckSlaveLevel(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_MASTERUSEEXP:       if not ConditionOfCheckMasterUseExp(PlayObject,QuestConditionInfo) then Result:=False;  //荤力 版摹

        nSC_CHECKSLAVENAME:     if not ConditionOfCheckSlaveName(PlayObject,QuestConditionInfo) then Result:=False;

        nSC_CHECKPCPOINT:       if not ConditionOfCheckPcPoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_HAVEHERO:           if not ConditionOfCheckHasHero(PlayObject, QuestConditionInfo) then Result := False;
        nSC_CHECKONLINE         :Result := True;
        nSC_CHECKOFGUILD:       if not ConditionOfCheckOfGuild(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKOFGUILDCOUNT:  if not ConditionOfCheckOfGuildCount(PlayObject,QuestConditionInfo) then Result:=False;  //檬焊巩颇
        nSC_CHECKPAYMENT:       if not ConditionOfCheckPayMent(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKUSEITEM:       if not ConditionOfCheckUseItem(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKBAGSIZE:       if not ConditionOfCheckBagSize(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKLISTCOUNT:     if not ConditionOfCheckListCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKDC:            if not ConditionOfCheckDC(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMC:            if not ConditionOfCheckMC(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKSC:            if not ConditionOfCheckSC(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKHP:            if not ConditionOfCheckHP(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMP:            if not ConditionOfCheckMP(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKITEMTYPE:      if not ConditionOfCheckItemType(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKEXP:           if not ConditionOfCheckExp(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKCASTLEGOLD:    if not ConditionOfCheckCastleGold(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_PASSWORDERRORCOUNT: if not ConditionOfCheckPasswordErrorCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ISLOCKPASSWORD:     if not ConditionOfIsLockPassword(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ISLOCKSTORAGE:      if not ConditionOfIsLockStorage(PlayObject,QuestConditionInfo) then Result:=False;     //芒绊鞠龋
        nSC_CHECKGUILDMODE      :if not ConditionOfCheckGuildMode(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKBUILDPOINT     :if not ConditionOfCheckGuildBuildPoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKAURAEPOINT     :if not ConditionOfCheckGuildAuraePoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKSTABILITYPOINT :if not ConditionOfCheckStabilityPoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKFLOURISHPOINT  :if not ConditionOfCheckFlourishPoint(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKRANGEMONCOUNT  :if not ConditionOfCheckRangeMonCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKITEMADDVALUE   :if not ConditionOfCheckItemAddValue(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKINMAPRANGE     :if not ConditionOfCheckInMapRange(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CASTLECHANGEDAY     :if not ConditionOfCheckCastleChageDay(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CASTLEWARDAY        :if not ConditionOfCheckCastleWarDay(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_ONLINELONGMIN       :if not ConditionOfCheckOnlineLongMin(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKGUILDCHIEFITEMCOUNT :if not ConditionOfCheckChiefItemCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKNAMEDATELIST   :if not ConditionOfCheckNameDateList(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMAPHUMANCOUNT  :if not ConditionOfCheckMapHumanCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMAPMONCOUNT    :if not ConditionOfCheckMapMonCount(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKVAR            :if not ConditionOfCheckVar(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKSERVERNAME     :if not ConditionOfCheckServerName(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMAP            :if not ConditionOfCheckMap(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKPOS            :if not ConditionOfCheckPos(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_REVIVESLAVE         :if not ConditionOfReviveSlave(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKMAGIC          :if not ConditionOfCheckHasMagic(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHKMAGICLEVEL       :if not ConditionOfCheckMagicLvl(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKHORSE          :if not ConditionOfCheckHasHorse(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKRIDING         :if not ConditionOfCheckOnHorse(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_CHECKGROUPCLASS     :if not ConditionOfCheckGroupClass(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_RANDOMEX            :if not ConditionOfRandomEx(PlayObject,QuestConditionInfo) then Result:=False;
        nSC_INSAFEZONE          :if not ConditionOfCheckSafeZone(PlayObject, QuestConditionInfo) then Result := False;
        nSC_ISGROUPMASTER: begin
            if PlayObject.m_GroupOwner <> nil then begin
              if PlayObject.m_GroupOwner <> PlayObject then
                Result := False;
            end else Result := False;
          end;

      end;
      if not Result then break;        
    end;
  end;
  function JmpToLable(sLabel:String):Boolean;
  begin
    Result:=False;
    Inc(PlayObject.m_nScriptGotoCount);
    if PlayObject.m_nScriptGotoCount > g_Config.nScriptGotoCountLimit{10} then exit;
    GotoLable(PlayObject,sLabel,False);
    PlayObject.m_nScriptGotoCount := 0;
    Result:=True;
  end;
  procedure GoToQuest(nQuest:Integer); //0049C898        //涅胶飘巩
  var
    I: Integer;
    Script:pTScript;
  begin
    for I := 0 to m_ScriptList.Count - 1 do begin
      Script:=m_ScriptList.Items[I];
      if Script.nQuest = nQuest then begin
        PlayObject.m_Script:=Script;
        PlayObject.m_NPC:=Self;
        GotoLable(PlayObject,sMAIN,False);
        break;
      end;
    end;
  end;

  procedure AddList(sHumName,sListFileName:String); //0049B620
  var
    I: Integer;
    LoadList:TStringList;
    s10:String;
    bo15:Boolean;
  begin
    sListFileName:=g_Config.sEnvirDir + sListFileName;
    LoadList:=TStringList.Create;
    if FileExists(sListFileName) then begin
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('loading fail.... => ' + sListFileName);
      end;
    end;
    bo15:=False;
    for I := 0 to LoadList.Count - 1 do begin
      s10:=Trim(LoadList.Strings[i]);
      if CompareText(sHumName,s10) = 0 then begin
        bo15:=True;
        break;
      end;
    end;
    if not bo15 then begin
      LoadList.Add(sHumName);
      try
        LoadList.SaveToFile(sListFileName);
      except
        MainOutMessage('saving fail.... => ' + sListFileName);
      end;
    end;
      
    LoadList.Free;
  end;
  procedure DelList(sHumName,sListFileName:String); //0049B7F8
  var
    I: Integer;
    LoadList:TStringList;
    s10:String;
    bo15:Boolean;
  begin
    sListFileName:=g_Config.sEnvirDir + sListFileName;
    LoadList:=TStringList.Create;
    if FileExists(sListFileName) then begin
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('loading fail.... => ' + sListFileName);
      end;
    end;
    bo15:=False;
    for I := 0 to LoadList.Count - 1 do begin
      s10:=Trim(LoadList.Strings[i]);
      if CompareText(sHumName,s10) = 0 then begin
        LoadList.Delete(i);
        bo15:=True;
        break;
      end;
    end;
    if bo15 then begin
      try
        LoadList.SaveToFile(sListFileName);
      except
        MainOutMessage('saving fail.... => ' + sListFileName);
      end;
    end;
    LoadList.Free;
  end;

  procedure AddCountList(sListFileName, sItemName: string);      //肮荐 葛酒坷扁
  var
    I: Integer;
    LoadList: TStringList;
    s10, sName, sCount: String;
    bo15: Boolean;
    UserItem: pTUserItem;
    StdItem: TItem;
    nCount: Integer;
  begin
    nCount := 0;
    UserItem := nil;
    StdItem := nil;
    for I := PlayObject.m_ItemList.Count - 1 downto 0 do begin
      UserItem := pTUserItem(PlayObject.m_ItemList[i]);
      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      if (StdItem <> nil) and (CompareText(StdItem.Name, sItemName) = 0) then begin
        if StdItem.NeedIdentify = 1 then
              AddGameDataLog('10' + #9 +
              PlayObject.m_sMapName + #9 +
              IntToStr(PlayObject.m_nCurrX) + #9 +
              IntToStr(PlayObject.m_nCurrY) + #9 +
              PlayObject.m_sCharName + #9 +
              sName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
              IntToStr(UserItem.MakeIndex) + #9 +
              '1' + #9 +
              m_sCharName + #9 + '[NPC 取出]');
        if StdItem.StdMode in [0,1,3,45,46] then begin
          nCount := nCount + UserItem.Amount;
        end else begin
          nCount := nCount + 1;
        end;
        PlayObject.SendDelItems(UserItem);
        PlayObject.m_ItemList.Delete(I);
        Dispose(UserItem);
      end else begin
        break;
      end;
    end;

    sListFileName := g_Config.sEnvirDir + sListFileName;
    LoadList := TStringList.Create;
    if FileExists(sListFileName) then begin
      try
        LoadList.LoadFromFile(sListFileName);
      except
        MainOutMessage('loading fail.... => ' + sListFileName);
      end;
    end;
    bo15 := True;
    sCount := '0';
    for I := 0 to LoadList.Count - 1 do begin
      s10 := Trim(LoadList.Strings[I]);
      if s10[1] = ';' then Continue;
      sCount := GetValidStr3(s10, sName, [' ', '/', #9]);
      sCount := Trim(sCount);
      if CompareText(sItemName, sName) = 0 then begin
        nCount := nCount + StrToInt(sCount);
        LoadList.Delete(I);
        Break;
      end;
    end;

    if bo15 then begin
      LoadList.Add(sItemName+'/'+IntToStr(nCount));
      try
        LoadList.SaveToFile(sListFileName);
      except
        MainOutMessage('saving fail.... => ' + sListFileName);
      end;
    end;
    LoadList.Free;
  end;


  procedure TakeItem(sName:String;nCount:Integer);
  var
    I: Integer;
    UserItem:pTUserItem;
    StdItem:TItem;
  begin
    UserItem := nil;
    StdItem := nil;
    if CompareText(sName, sSTRING_GOLDNAME) = 0 then begin
      PlayObject.DecGold(nCount);
      PlayObject.GoldChanged();
      SC:=sSTRING_GOLDNAME;
       if g_boGameLogGold then
        AddGameDataLog('10' + #9 +
          PlayObject.m_sMapName + #9 +
          IntToStr(PlayObject.m_nCurrX) + #9 +
          IntToStr(PlayObject.m_nCurrY) + #9 +
          PlayObject.m_sCharName + #9 +
          sSTRING_GOLDNAME + #9 +
          IntToStr(nCount) + #9 +
          '1' + #9 +
          m_sCharName + #9 + '[NPC 取出]');
    end else
    for I := PlayObject.m_ItemList.Count - 1 downto 0 do begin
      if nCount <= 0 then Break;
      UserItem:= pTUserItem(PlayObject.m_ItemList[i]);
      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      if StdItem <> nil then begin
        if CompareText(StdItem.Name, sName) = 0 then begin
          if StdItem.StdMode in [0,1,3,45,46] then begin   //犁丰    //般摹扁袍
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('10' + #9 +
              PlayObject.m_sMapName + #9 +
              IntToStr(PlayObject.m_nCurrX) + #9 +
              IntToStr(PlayObject.m_nCurrY) + #9 +
              PlayObject.m_sCharName + #9 +
              sName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
              IntToStr(UserItem.MakeIndex) + #9 +
              '1' + #9 +
              m_sCharName + #9 + '[NPC 取出]');

            if UserItem.Amount >= nCount then begin    // 酒捞袍 肮荐啊 力矫茄 酒捞袍焊促 鞍芭唱 努锭 (ok)
              UserItem.Amount := UserItem.Amount - nCount;  //酒捞袍 肮荐俊辑 力矫茄 酒捞袍 哗林扁.
              if UserItem.Amount <= 0 then begin    //酒捞袍 肮荐啊 0捞登芭唱 利栏搁 酒捞袍 绝局林扁
                if PlayObject.m_btRaceServer = RC_PLAYOBJECT then begin
                  PlayObject.SendDelItems(UserItem);
                end;
                DisPose(UserItem);
                PlayObject.m_ItemList.Delete(I);
              end else begin
                PlayObject.SendMsg(self, RM_COUNTERITEMCHANGE, 0, UserItem.MakeIndex, UserItem.Amount, 0, FilterStdShowName(StdItem,StdItem.Name));
              end;
              nCount := nCount - UserItem.Amount;
            end else begin
              nCount := nCount - UserItem.Amount;
             
              if PlayObject.m_btRaceServer = RC_PLAYOBJECT then begin
                PlayObject.SendDelItems(UserItem);
              end;
              DisPose(UserItem);
              PlayObject.m_ItemList.Delete(I);
              continue;
            end;
            SC:=UserEngine.GetStdItemName(UserItem.wIndex);
            break;
          end else begin
             if StdItem.NeedIdentify = 1 then
               AddGameDataLog('10' + #9 +
               PlayObject.m_sMapName + #9 +
               IntToStr(PlayObject.m_nCurrX) + #9 +
               IntToStr(PlayObject.m_nCurrY) + #9 +
               PlayObject.m_sCharName + #9 +
               sName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
               IntToStr(UserItem.MakeIndex) + #9 +
               '1' + #9 +
                m_sCharName + #9 + '[NPC 取出]');
             PlayObject.SendDelItems(UserItem);
             SC := UserEngine.GetStdItemName(UserItem.wIndex);
             DisPose(UserItem);
             PlayObject.m_ItemList.Delete(I);
             Dec(nCount);
          end;
        end;
      end;
    end;
  end;
  procedure GiveItem(sItemName:String;nItemCount:Integer); //0049D1D0
  var
    I: Integer;
    UserItem:pTUserItem;
    StdItem:TItem;
    boot:Boolean;
  begin

    if CompareText(sItemName,sSTRING_GOLDNAME) = 0 then begin
      PlayObject.IncGold(nItemCount);
      PlayObject.GoldChanged();
      //0049D2FE
    if g_boGameLogGold then
      AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(nItemCount) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
      exit;
    end;
    if UserEngine.GetStdItemIdx(sItemName) > 0 then begin
      if not (nItemCount in [1..50]) then nItemCount:=1; //12.28 改上一条

        
      for I := 0 to nItemCount - 1 do begin //nItemCount 为0时出死循环
        if PlayObject.IsEnoughBag then begin
          New(UserItem);
          if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
            if PlayObject.AddItemToBag(UserItem,boot) then begin
            if boot then
             PlayObject.SendAddItem(UserItem,1);
            end;
            StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
            //0049D46B
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
          end else Dispose(UserItem);
        end else begin
          New(UserItem);
          if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
            StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
            //0049D5A5
            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
            PlayObject.DropItemDown(UserItem,3,False,PlayObject,nil);
          end;
          Dispose(UserItem);
        end;
      end;
    end;
  end;
  procedure TakeWItem(sItemName:String;nItemCount:Integer);//0049CCF8
  var
    I: Integer;
    sName:String;
  begin
    if CompareLStr(sItemName,'[NECKLACE]',4) then begin
      if PlayObject.m_UseItems[U_NECKLACE].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_NECKLACE]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_NECKLACE].wIndex);
        PlayObject.m_UseItems[U_NECKLACE].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[RING]',4) then begin
      if PlayObject.m_UseItems[U_RINGL].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_RINGL]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_RINGL].wIndex);
        PlayObject.m_UseItems[U_RINGL].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
      if PlayObject.m_UseItems[U_RINGR].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_RINGR]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_RINGR].wIndex);
        PlayObject.m_UseItems[U_RINGR].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[ARMRING]',4) then begin
      if PlayObject.m_UseItems[U_ARMRINGL].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_ARMRINGL]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_ARMRINGL].wIndex);
        PlayObject.m_UseItems[U_ARMRINGL].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
      if PlayObject.m_UseItems[U_ARMRINGR].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_ARMRINGR]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_ARMRINGR].wIndex);
        PlayObject.m_UseItems[U_ARMRINGR].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[WEAPON]',4) then begin
      if PlayObject.m_UseItems[U_WEAPON].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_WEAPON]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_WEAPON].wIndex);
        PlayObject.m_UseItems[U_WEAPON].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[HELMET]',4) then begin
      if PlayObject.m_UseItems[U_HELMET].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_HELMET]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_HELMET].wIndex);
        PlayObject.m_UseItems[U_HELMET].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[DRESS]',4) then begin
      if PlayObject.m_UseItems[U_DRESS].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_DRESS]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_DRESS].wIndex);
        PlayObject.m_UseItems[U_DRESS].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_BUJUK]',4) then begin
      if PlayObject.m_UseItems[U_BUJUK].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_BUJUK]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BUJUK].wIndex);
        PlayObject.m_UseItems[U_BUJUK].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_BELT]',4) then begin
      if PlayObject.m_UseItems[U_BELT].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_BELT]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BELT].wIndex);
        PlayObject.m_UseItems[U_BELT].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_BOOTS]',4) then begin
      if PlayObject.m_UseItems[U_BOOTS].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_BOOTS]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_BOOTS].wIndex);
        PlayObject.m_UseItems[U_BOOTS].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_CHARM]',4) then begin
      if PlayObject.m_UseItems[U_CHARM].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_CHARM]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_CHARM].wIndex);
        PlayObject.m_UseItems[U_CHARM].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_TIGER]',4) then begin //龋尔捞
      if PlayObject.m_UseItems[U_TIGER].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_TIGER]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_TIGER].wIndex);
        PlayObject.m_UseItems[U_TIGER].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_PETS1]',4) then begin    //龋尔捞
      if PlayObject.m_UseItems[U_PETS1].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_PETS1]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS1].wIndex);
        PlayObject.m_UseItems[U_PETS1].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_PETS2]',4) then begin
      if PlayObject.m_UseItems[U_PETS2].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_PETS2]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS2].wIndex);
        PlayObject.m_UseItems[U_PETS2].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_PETS3]',4) then begin
      if PlayObject.m_UseItems[U_PETS3].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_PETS3]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS3].wIndex);
        PlayObject.m_UseItems[U_PETS3].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_PETS4]',4) then begin
      if PlayObject.m_UseItems[U_PETS4].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_PETS4]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS4].wIndex);
        PlayObject.m_UseItems[U_PETS4].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_PETS5]',4) then begin
      if PlayObject.m_UseItems[U_PETS5].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_PETS5]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_PETS5].wIndex);
        PlayObject.m_UseItems[U_PETS5].wIndex:=0;
        PlayObject.RecalcAbilitys();
        PlayObject.FeatureChanged;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_FISH1]',4) then begin        //超矫
      if PlayObject.m_UseItems[U_FISH1].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_FISH1]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH1].wIndex);
        PlayObject.m_UseItems[U_FISH1].wIndex:=0;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_FISH2]',4) then begin
      if PlayObject.m_UseItems[U_FISH2].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_FISH2]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH2].wIndex);
        PlayObject.m_UseItems[U_FISH2].wIndex:=0;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_FISH3]',4) then begin
      if PlayObject.m_UseItems[U_FISH3].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_FISH3]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH3].wIndex);
        PlayObject.m_UseItems[U_FISH3].wIndex:=0;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_FISH4]',4) then begin
      if PlayObject.m_UseItems[U_FISH4].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_FISH4]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH4].wIndex);
        PlayObject.m_UseItems[U_FISH4].wIndex:=0;
        exit;
      end;
    end;
    if CompareLStr(sItemName,'[U_FISH5]',4) then begin
      if PlayObject.m_UseItems[U_FISH5].wIndex > 0 then begin
        PlayObject.SendDelItems(@PlayObject.m_UseItems[U_FISH5]);
        sC:=UserEngine.GetStdItemName(PlayObject.m_UseItems[U_FISH5].wIndex);
        PlayObject.m_UseItems[U_FISH5].wIndex:=0;
        exit;
      end;
    end;
    for I := Low(THumanUseItems) to High(THumanUseItems) do begin
      if nItemCount <= 0 then exit;
      if PlayObject.m_UseItems[i].wIndex > 0 then begin
        sName:=UserEngine.GetStdItemName(PlayObject.m_UseItems[i].wIndex);
        if CompareText(sName,sItemName) = 0 then begin
          PlayObject.SendDelItems(@PlayObject.m_UseItems[i]);
          PlayObject.m_UseItems[i].wIndex:=0;
          PlayObject.RecalcAbilitys();
         PlayObject.FeatureChanged;
          Dec(nItemCount);
        end;
      end;
    end;
  end;

  function QuestActionProcess(ActionList:TList):Boolean; //0049D660
  var
    I,II,k:Integer;
    QuestActionInfo:pTQuestActionInfo;
    n14,n18,n1C,n28,n2C:Integer;
    n20X,n24Y,n34,n38,n3C,n40:Integer;
    s4C,s50:String;
    s44,s48:String;
    Envir:TEnvirnoment;
    List58:TList;
    User:TPlayObject;
  begin
    Result:=True;
    n18:=0;
    n34:=0;
    n38:=0;
    n3C:=0;
    n40:=0;
    for I := 0 to ActionList.Count - 1 do begin
      QuestActionInfo:=ActionList.Items[i];
      BaseObject := QuestActionInfo.Script.GetActorObject(Self, AObject); //转换运行对象
      if BaseObject = nil then begin
        Result := False;
        Break;
      end else begin
        if BaseObject.m_btRaceServer = RC_PLAYOBJECT then
          PlayObject := TPlayObject(BaseObject) else PlayObject := nil;
      end;


      case QuestActionInfo.nCmdCode of    //
        nSET: begin
          n28:=Str_ToInt(QuestActionInfo.sParam1,0);
          n2C:=Str_ToInt(QuestActionInfo.sParam2,0);
          PlayObject.SetQuestFlagStatus(n28,n2C);
        end;
        n_GETAUCTIONITEMS: begin   //困殴 npc 疙飞绢
          FrmDB.GetAuctionItems(QuestActionInfo.sParam1,PlayObject);
        end;
        n_CLOSEAUCTION: begin   //困殴 npc 疙飞绢 辆丰
          PlayObject.SendDefMessage(SM_CLOSEAUCTION,0,0,0,0,'');
        end;
        n_GETCOMSTORAGEITEMS: begin   //傍侩芒绊 npc 疙飞绢
          FrmDB.GetComStorageItems(PlayObject);
        end;
        n_CLOSECOMSTORAGE: begin   //傍侩芒绊 npc 疙飞绢 辆丰
          PlayObject.SendDefMessage(SM_CLOSECOMSTORAGE,0,0,0,0,'');
        end;
        n_GETGUILDSTORAGEITEMS: begin   //巩颇芒绊 npc 疙飞绢
          FrmDB.GetGuildStorageItems(PlayObject);
        end;
        n_CLOSEGUILDSTORAGE: begin   //巩颇芒绊 npc 疙飞绢 辆丰
          PlayObject.SendDefMessage(SM_CLOSEGUILDSTORAGE,0,0,0,0,'');
        end;
        nTAKE: TakeItem(QuestActionInfo.sParam1,QuestActionInfo.nParam2{, QuestActionInfo.sParam2});
        nSC_GIVEOPTION: ActionOfGiveOptionItem(PlayObject,QuestActionInfo);
        nSC_GIVE: ActionOfGiveItem(PlayObject,QuestActionInfo);
        nTAKEW: TakeWItem(QuestActionInfo.sParam1,QuestActionInfo.nParam2);
        nCLOSE: PlayObject.SendMsg(Self,RM_MERCHANTDLGCLOSE,0,Integer(Self),0,0,'');
        nRESET: begin
          for II := 0 to QuestActionInfo.nParam2 - 1 do begin
            PlayObject.SetQuestFlagStatus(QuestActionInfo.nParam1 + II,0);
          end;
        end;
        nSETOPEN: begin
          n28:=Str_ToInt(QuestActionInfo.sParam1,0);
          n2C:=Str_ToInt(QuestActionInfo.sParam2,0);
          PlayObject.SetQuestUnitOpenStatus(n28,n2C);
        end;
        nSETUNIT: begin
          n28:=Str_ToInt(QuestActionInfo.sParam1,0);
          n2C:=Str_ToInt(QuestActionInfo.sParam2,0);
          PlayObject.SetQuestUnitStatus(n28,n2C);
        end;
        nRESETUNIT: begin
          for II := 0 to QuestActionInfo.nParam2 - 1 do begin
            PlayObject.SetQuestUnitStatus(QuestActionInfo.nParam1 + II,0);
          end;
        end;
        nBREAK: Result:=False;
        nTIMERECALL: begin
          PlayObject.m_boTimeRecall:=True;
          PlayObject.m_sMoveMap:=PlayObject.m_sMapName;
          PlayObject.m_nMoveX:=PlayObject.m_nCurrX;
          PlayObject.m_nMoveY:=PlayObject.m_nCurrY;
          PlayObject.m_dwTimeRecallTick:=GetTickCount + LongWord(QuestActionInfo.nParam1 * 60 * 1000);  //府妮
          PlayObject.SendMsg(Self,RM_COOLTIME,0,0,0, (QuestActionInfo.nParam1 * 60) , PlayObject.m_sMoveMap); //府妮 滚橇
        end;
        nCASTLERECALL: begin
          PlayObject.m_boCastleRecall:=True;
          PlayObject.m_dwCastleRecallTick:=GetTickCount + LongWord(QuestActionInfo.nParam1 * 60 * 1000);  //府妮
          PlayObject.SendMsg(Self,RM_COOLTIME,0,0,0, (QuestActionInfo.nParam1 * 60) , '攻城战');
        end;

        nSC_PARAM1: begin
          n34:=QuestActionInfo.nParam1;
          s44:=QuestActionInfo.sParam1;
        end;
        nSC_PARAM2: begin
          n38:=QuestActionInfo.nParam1;
          s48:=QuestActionInfo.sParam1;
        end;
        nSC_PARAM3: begin
          n3C:=QuestActionInfo.nParam1;
          s4C:=QuestActionInfo.sParam1;
        end;
        nSC_PARAM4: begin
          n40:=QuestActionInfo.nParam1;
          s50:=QuestActionInfo.sParam1;
        end;                                                                                          
        nSC_EXEACTION: begin
          n40:=QuestActionInfo.nParam1;
          s50:=QuestActionInfo.sParam1;
          ExeAction(PlayObject,QuestActionInfo.sParam1,QuestActionInfo.sParam2,QuestActionInfo.sParam3,QuestActionInfo.nParam1,QuestActionInfo.nParam2,QuestActionInfo.nParam3);
        end;

        nMAPMOVE: begin          //nomove累诀
          PlayObject.SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
          PlayObject.NoSpaceMove(QuestActionInfo.sParam1,QuestActionInfo.nParam2,QuestActionInfo.nParam3,0);
          bo11:=True;
        end;

        nRANDOMMAPMOVE: begin          //nomove累诀
          PlayObject.SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
          PlayObject.NoSpaceMove(QuestActionInfo.sParam1,QuestActionInfo.nParam2 + Random(3),QuestActionInfo.nParam3 + Random(3),0);
          bo11:=True;
        end;

        nGTMAPMOVE: begin
          if m_PEnvir.Flag.nGuildTerritory > 0 then begin
            PlayObject.SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
            PlayObject.SpaceGTMoveEX(QuestActionInfo.sParam1,QuestActionInfo.nParam2,QuestActionInfo.nParam3,0,m_PEnvir.Flag.nGuildTerritory);
            bo11:=True;
          end else
            ScriptActionError(PlayObject,'你无法移动到庄园。',QuestActionInfo,'');
        end;
        nMAP: begin
          PlayObject.SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
          PlayObject.MapRandomMove(QuestActionInfo.sParam1,0);
          bo11:=True;
        end;
        nTAKECHECKITEM: begin
          if UserItem <> nil then begin
            PlayObject.QuestTakeCheckItem(UserItem);
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sTAKECHECKITEM);
          end;
        end;
        nMONGEN: begin
          for II := 0 to QuestActionInfo.nParam2 - 1 do begin
            n20X:=Random(QuestActionInfo.nParam3 * 2 + 1) + (n38 - QuestActionInfo.nParam3);
            n24Y:=Random(QuestActionInfo.nParam3 * 2 + 1) + (n3C - QuestActionInfo.nParam3);
            UserEngine.RegenMonsterByName(s44,n20X,n24Y,QuestActionInfo.sParam1);
          end;
        end;
        nMONCLEAR: begin
          List58:=TList.Create;
          UserEngine.GetMapMonster(g_MapManager.FindMap(QuestActionInfo.sParam1),List58);
          for II := 0 to List58.Count - 1 do begin
            TBaseObject(List58.Items[II]).m_boNoItem:=True;
            TBaseObject(List58.Items[II]).m_WAbil.HP:=0;
          end;    // for
          List58.Free;
        end;
        nMOV: begin
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                PlayObject.m_nVal[n14]:=QuestActionInfo.nParam2;
              end;
              100..119: begin
                g_Config.GlobalVal[n14 - 100]:=QuestActionInfo.nParam2;
              end;
              200..209: begin
                PlayObject.m_DyVal[n14 - 200]:=QuestActionInfo.nParam2;
              end;
              300..399: begin
                PlayObject.m_nMval[n14 - 300]:=QuestActionInfo.nParam2;
              end;
              400..499: begin
                g_Config.GlobaDyMval[n14 - 400]:=QuestActionInfo.nParam2;
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sMOV);
              end;
            end;
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sMOV);
          end;
        end;
        nINC: begin
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Inc(PlayObject.m_nVal[n14],QuestActionInfo.nParam2);
                end else begin
                  Inc(PlayObject.m_nVal[n14]);
                end;
              end;
              100..119: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Inc(g_Config.GlobalVal[n14 - 100],QuestActionInfo.nParam2);
                end else begin
                  Inc(g_Config.GlobalVal[n14 - 100]);
                end;
              end;
              200..209: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Inc(PlayObject.m_DyVal[n14 - 200],QuestActionInfo.nParam2);
                end else begin
                  Inc(PlayObject.m_DyVal[n14 - 200]);
                end;
              end;
              300..399: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Inc(PlayObject.m_nMval[n14 - 300],QuestActionInfo.nParam2);
                end else begin
                  Inc(PlayObject.m_nMval[n14 - 300]);
                end;
              end;
              400..499: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Inc(g_Config.GlobaDyMval[n14 - 400],QuestActionInfo.nParam2);
                end else begin
                  Inc(g_Config.GlobaDyMval[n14 - 400]);
                end;
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sINC);
              end;
            end;    // case
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sINC);
          end;
        end;
        nDEC: begin
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Dec(PlayObject.m_nVal[n14],QuestActionInfo.nParam2);
                end else begin
                  Dec(PlayObject.m_nVal[n14]);
                end;
              end;
              100..119: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Dec(g_Config.GlobalVal[n14 - 100],QuestActionInfo.nParam2);
                end else begin
                  Dec(g_Config.GlobalVal[n14 - 100]);
                end;
              end;
              200..209: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Dec(PlayObject.m_DyVal[n14 - 200],QuestActionInfo.nParam2);
                end else begin
                  Dec(PlayObject.m_DyVal[n14 - 200]);
                end;
              end;
              300..399: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Dec(PlayObject.m_nMval[n14 - 300],QuestActionInfo.nParam2);
                end else begin
                  Dec(PlayObject.m_nMval[n14 - 300]);
                end;
              end;
              400..499: begin
                if QuestActionInfo.nParam2 > 1 then begin
                  Dec(g_Config.GlobaDyMval[n14 - 400],QuestActionInfo.nParam2);
                end else begin
                  Dec(g_Config.GlobaDyMval[n14 - 400]);
                end;
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sDEC);
              end;
            end;
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sDEC);
          end;
        end;
        nSUM: begin
          n18:=0;
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                n18:=PlayObject.m_nVal[n14];
              end;
              100..119: begin
                n18:=g_Config.GlobalVal[n14 - 100];
              end;
              200..209: begin
                n18:=PlayObject.m_DyVal[n14 - 200];
              end;
              300..399: begin
                n18:=PlayObject.m_nMval[n14 - 300];
              end;
              400..499: begin
                n18:=g_Config.GlobaDyMval[n14 - 400];
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sSUM);
              end;
           end;    // case
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sSUM);
          end;
          n1C:=0;
          n14:=GetValNameNo(QuestActionInfo.sParam2);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                n1C:=PlayObject.m_nVal[n14];
              end;
              100..119: begin
                n1C:=g_Config.GlobalVal[n14 - 100];
              end;
              200..209: begin
                n1C:=PlayObject.m_DyVal[n14 - 200];
              end;
              300..399: begin
                n1C:=PlayObject.m_nMval[n14 - 300];
              end;
             400..499: begin
                n1C:=g_Config.GlobaDyMval[n14 - 400];
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sSUM);
              end;
            end;
          end else begin
            //ScriptActionError(PlayObject,'',QuestActionInfo,sSUM);
          end;
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                PlayObject.m_nVal[9]:=PlayObject.m_nVal[9] + n18 + n1C;
              end;
              100..119: begin
                g_Config.GlobalVal[9]:=g_Config.GlobalVal[9] + n18 + n1C;
              end;
              200..209: begin
                PlayObject.m_DyVal[9]:=PlayObject.m_DyVal[9] + n18 + n1C;
              end;
              300..399: begin
                PlayObject.m_nMval[99]:=PlayObject.m_nMval[99] + n18 + n1C;
              end;
              400..499: begin
                g_Config.GlobaDyMval[99]:=g_Config.GlobaDyMval[99] + n18 + n1C;
              end;
            end;
          end;
        end;
        nBREAKTIMERECALL: begin
          PlayObject.m_boTimeRecall:=False;
          PlayObject.m_boTimeRecallGroup:=False;
        end;
        nCHANGEMODE: begin
          case QuestActionInfo.nParam1 of    
            1: PlayObject.CmdChangeAdminMode('',10,'',Str_ToInt(QuestActionInfo.sParam2,0) = 1);
            2: PlayObject.CmdChangeSuperManMode('',10,'',Str_ToInt(QuestActionInfo.sParam2,0) = 1);
            3: PlayObject.CmdChangeObMode('',10,'',Str_ToInt(QuestActionInfo.sParam2,0) = 1);
            else begin
              ScriptActionError(PlayObject,'',QuestActionInfo,sCHANGEMODE);
            end;
          end;
        end;
        nPKPOINT: begin
          if QuestActionInfo.nParam1 = 0 then begin
            PlayObject.m_nPkPoint:=0;
          end else begin
            if QuestActionInfo.nParam1 < 0 then begin
              if (PlayObject.m_nPkPoint + QuestActionInfo.nParam1) >= 0 then begin
                Inc(PlayObject.m_nPkPoint,QuestActionInfo.nParam1);
              end else PlayObject.m_nPkPoint:=0;
            end else begin
              if (PlayObject.m_nPkPoint + QuestActionInfo.nParam1) > 10000 then begin
                PlayObject.m_nPkPoint:=10000;
              end else begin
                Inc(PlayObject.m_nPkPoint,QuestActionInfo.nParam1);
              end;
            end;              
          end;
          PlayObject.RefNameColor();
        end;
        nCHANGEXP: begin

        end;
        nSC_RECALLMOB: ActionOfRecallmob(PlayObject,QuestActionInfo);
        {
        nSC_RECALLMOB: begin
          if QuestActionInfo.nParam3 <= 1 then begin
            PlayObject.MakeSlave(QuestActionInfo.sParam1,3,Str_ToInt(QuestActionInfo.sParam2,0),100,10 * 24 * 60 * 60);
          end else begin
            PlayObject.MakeSlave(QuestActionInfo.sParam1,3,Str_ToInt(QuestActionInfo.sParam2,0),100,QuestActionInfo.nParam3 * 60)
          end;
        end;
        }
        nKICK: begin
          PlayObject.m_boReconnection:=True;
          PlayObject.m_boSoftClose:=True;
        end;
        nMOVR: begin
          n14:=GetValNameNo(QuestActionInfo.sParam1);
          if n14 >= 0 then begin
            case n14 of    //
              0..9: begin
                PlayObject.m_nVal[n14]:=Random(QuestActionInfo.nParam2);
              end;
              100..119: begin
                g_Config.GlobalVal[n14 - 100]:=Random(QuestActionInfo.nParam2);
              end;
              200..209: begin
                PlayObject.m_DyVal[n14 - 200]:=Random(QuestActionInfo.nParam2);
              end;
              300..399: begin
                PlayObject.m_nMval[n14 - 300]:=Random(QuestActionInfo.nParam2);
              end;
              400..499: begin
                g_Config.GlobaDyMval[n14 - 400]:=Random(QuestActionInfo.nParam2);
              end;
              else begin
                ScriptActionError(PlayObject,'',QuestActionInfo,sMOVR);
              end;
            end;    // case
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sMOVR);
          end;
        end;
        nEXCHANGEMAP: begin
          Envir:=g_MapManager.FindMap(QuestActionInfo.sParam1);
          if Envir <> nil then begin
            List58:=TList.Create;
            UserEngine.GetMapRageHuman(Envir,0,0,1000,List58);
            if List58.Count > 0 then begin
              User:=TPlayObject(List58.Items[0]);
              User.MapRandomMove(Self.m_sMapName,0);
            end;
            List58.Free;
            PlayObject.MapRandomMove(QuestActionInfo.sParam1,0);
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sEXCHANGEMAP);
          end;

        end;
        nRECALLMAP: begin
          Envir:=g_MapManager.FindMap(QuestActionInfo.sParam1);
          if Envir <> nil then begin
            List58:=TList.Create;
            UserEngine.GetMapRageHuman(Envir,0,0,1000,List58);
            for II := 0 to List58.Count - 1 do begin
              User:=TPlayObject(List58.Items[II]);
              User.MapRandomMove(Self.m_sMapName,0);
              if II > 20 then break;
            end;
            List58.Free;
          end else begin
            ScriptActionError(PlayObject,'',QuestActionInfo,sRECALLMAP);
          end;
        end;
        nADDBATCH: List1C.AddObject(QuestActionInfo.sParam1,TObject(n18));
        nBATCHDELAY: n18:=QuestActionInfo.nParam1 * 1000;
        nBATCHMOVE: begin
          for II := 0 to List1C.Count - 1 do begin
            PlayObject.SendDelayMsg(Self,RM_10155,0,0,0,0,List1C.Strings[II],Integer(List1C.Objects[II]) + n20);
            Inc(n20,Integer(List1C.Objects[II]));
          end;
        end;
        nPLAYDICE: begin //0049E209
          PlayObject.m_sPlayDiceLabel:=QuestActionInfo.sParam2;
          PlayObject.SendMsg(Self,
                            RM_PLAYDICE,
                            QuestActionInfo.nParam1,
                            MakeLong(MakeWord(PlayObject.m_DyVal[0],PlayObject.m_DyVal[1]),MakeWord(PlayObject.m_DyVal[2],PlayObject.m_DyVal[3])),
                            MakeLong(MakeWord(PlayObject.m_DyVal[4],PlayObject.m_DyVal[5]),MakeWord(PlayObject.m_DyVal[6],PlayObject.m_DyVal[7])),
                            MakeLong(MakeWord(PlayObject.m_DyVal[8],PlayObject.m_DyVal[9]),0),
                            QuestActionInfo.sParam2);
          bo11:=True;
        end;
        nADDNAMELIST: AddList(PlayObject.m_sCharName,m_sPath + QuestActionInfo.sParam1);
        nDELNAMELIST: DelList(PlayObject.m_sCharName,m_sPath + QuestActionInfo.sParam1);
        nADDCOUNTLIST: AddCountList(m_sPath + QuestActionInfo.sParam1, QuestActionInfo.sParam2);       //肮荐 葛酒坷扁
        nADDGUILDLIST: if PlayObject.m_MyGuild <> nil then AddList(TGuild(PlayObject.m_MyGuild).sGuildName,m_sPath + QuestActionInfo.sParam1);
        nDELGUILDLIST: if PlayObject.m_MyGuild <> nil then DelList(TGuild(PlayObject.m_MyGuild).sGuildName,m_sPath + QuestActionInfo.sParam1);
        nSC_LINEMSG,nSENDMSG:     ActionOfLineMsg(PlayObject,QuestActionInfo);

        nADDACCOUNTLIST: AddList(PlayObject.m_sUserID,m_sPath + QuestActionInfo.sParam1);
        nDELACCOUNTLIST: DelList(PlayObject.m_sUserID,m_sPath + QuestActionInfo.sParam1);
        nADDIPLIST: AddList(PlayObject.m_sIPaddr,m_sPath + QuestActionInfo.sParam1);
        nDELIPLIST: DelList(PlayObject.m_sIPaddr,m_sPath + QuestActionInfo.sParam1);
        nGOQUEST:   GoToQuest(QuestActionInfo.nParam1);
        nENDQUEST:  PlayObject.m_Script:=nil;
        nGOTO: begin
          if not JmpToLable(QuestActionInfo.sParam1) then begin
            MainOutMessage('[检查名字] NPC:' + m_sCharName +
                           ' 位置:' + m_sMapName +'(' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) + ')' +
                           ' 事件:' + sGOTO + ' ' + QuestActionInfo.sParam1);
            Result:=False;
            exit;
          end;
        end;

        nSOUND: begin
          PlayObject.SendMsg( self, RM_SOUND , 0 ,Str_ToInt( QuestActionInfo.sParam1,0), 0 , 0 ,'');
        end;

        n_MOVETOLOVER:   //楷牢 菊栏肺 捞悼
               begin
                  if TPlayObject(PlayObject).fLover <> nil then begin
                     if TPlayObject(PlayObject).fLover.GetLoverName <> '' then
                        TPlayObject(PlayObject).CmdCharSpaceMove( TPlayObject(PlayObject).fLover.GetLoverName );
                  end;
               end;
        n_BREAKLOVER:   //楷牢 包拌 老规 秦力
               begin
                  TPlayObject(PlayObject).CmdBreakLoverRelation;
               end;

        //懦单胶 疙飞绢
        nUSEKILLPOINT:   //懦 器牢飘 荤侩
               begin
                  PlayObject.UseCurrentFamePoint(QuestActionInfo.nParam1);
               end;

        nSC_HAIRCOLOR:;
        nSC_WEARCOLOR:;
        nSC_HAIRSTYLE:     ActionOfChangeHairStyle(PlayObject,QuestActionInfo);
        nSC_MONRECALL:;
        nSC_HORSECALL:;
        nSC_HAIRRNDCOL:;
        nSC_KILLHORSE:;
        nSC_RANDSETDAILYQUEST:;

        nSC_RECALLGROUPMEMBERS: ActionOfRecallGroupMembers(PlayObject,QuestActionInfo);
        nSC_CLEARNAMELIST:   ActionOfClearNameList(PlayObject,QuestActionInfo);
        nSC_MAPTING:         ActionOfMapTing(PlayObject,QuestActionInfo);
        nSC_CHANGELEVEL:     ActionOfChangeLevel(PlayObject,QuestActionInfo);


        nSC_CLEARSKILL:      ActionOfClearSkill(PlayObject,QuestActionInfo);
        nSC_DELNOJOBSKILL:   ActionOfDelNoJobSkill(PlayObject,QuestActionInfo);
        nSC_DELSKILL:        ActionOfDelSkill(PlayObject,QuestActionInfo);
        nSC_ADDSKILL:        ActionOfAddSkill(PlayObject,QuestActionInfo);
        nSC_ADDHEROSKILL: ActionOfAddHeroSkill(PlayObject, QuestActionInfo);
        nSC_SKILLLEVEL:      ActionOfSkillLevel(PlayObject,QuestActionInfo);
        nSC_CHANGEPKPOINT:   ActionOfChangePkPoint(PlayObject,QuestActionInfo);
        nSC_CHANGEEXP:       ActionOfChangeExp(PlayObject,QuestActionInfo);
        nSC_PCPOINT:         ActionOfChangePcPoint(PlayObject,QuestActionInfo);
        nSC_CHANGEJOB:       ActionOfChangeJob(PlayObject,QuestActionInfo);
        nSC_CHANGEJOBUP:     ActionOfChangeJobUp(PlayObject,QuestActionInfo);  //殿急函券
        nSC_MISSION:         ActionOfMission(PlayObject,QuestActionInfo);
        nSC_MOBPLACE:        ActionOfMobPlace(PlayObject,QuestActionInfo,n34,n38,n3C,n40);
        nSC_GAMEGOLD:        ActionOfGameGold(PlayObject,QuestActionInfo);
        nSC_GAMEPOINT:       ActionOfGamePoint(PlayObject,QuestActionInfo);
        nSC_AUTOADDGAMEGOLD: ActionOfAutoAddGameGold(PlayObject,QuestActionInfo,n34,n38);
        nSC_AUTOSUBGAMEGOLD: ActionOfAutoSubGameGold(PlayObject,QuestActionInfo,n34,n38);
        nSC_CHANGENAMECOLOR: ActionOfChangeNameColor(PlayObject,QuestActionInfo);
        nSC_CLEARPASSWORD:   ActionOfClearPassword(PlayObject,QuestActionInfo);
        nSC_RENEWLEVEL:      ActionOfReNewLevel(PlayObject,QuestActionInfo);
        nSC_KILLSLAVE:       ActionOfKillSlave(PlayObject,QuestActionInfo);
        nSC_CHANGEGENDER:    ActionOfChangeGender(PlayObject,QuestActionInfo);
        nSC_KILLMONEXPRATE:  ActionOfKillMonExpRate(PlayObject,QuestActionInfo);
        nSC_BEGINNEREXPRATE: ActionOfBeginnerExpRate(PlayObject,QuestActionInfo);
        nSC_MASTEREXPRATE:   ActionOfMasterExpRate(PlayObject,QuestActionInfo);    //荤力 版摹
        nSC_TEMPPOWERUP:     ActionOfTempPowerUp(PlayObject,QuestActionInfo);
        nSC_HEALING:         ActionOfHealing(PlayObject,QuestActionInfo);     //npc 鳃傅
        nSC_SNOW:            ActionOfSnow(PlayObject, QuestActionInfo);     //传坷绰捞棋
        nSC_FLOWER:          ActionOfFlower(PlayObject, QuestActionInfo);
        nSC_POWERRATE:       ActionOfPowerRate(PlayObject,QuestActionInfo);
        nSC_CHANGEMODE:      ActionOfChangeMode(PlayObject,QuestActionInfo);
        nSC_CHANGEPERMISSION:ActionOfChangePerMission(PlayObject,QuestActionInfo);
        nSC_KILL:            ActionOfKill(PlayObject,QuestActionInfo);
        nSC_KICK:            ActionOfKick(PlayObject,QuestActionInfo);
        nSC_BONUSPOINT:      ActionOfBonusPoint(PlayObject,QuestActionInfo);
        nSC_RESTRENEWLEVEL:  ActionOfRestReNewLevel(PlayObject,QuestActionInfo);

        nSC_LOCK:            ActionOfLock(PlayObject, QuestActionInfo);
        nSC_UNLOCK:          ActionOfUnLock(PlayObject, QuestActionInfo);
        nSC_CLEARDUELMAP:    ActionOfClearDuelMap(PlayObject, QuestActionInfo);
        nSC_GETDUELITEMS:    ActionOfGetDuelItems(PlayObject, QuestActionInfo);

        nSC_CLEARNEEDITEMS:  ActionOfClearNeedItems(PlayObject,QuestActionInfo);
        nSC_CLEARMAEKITEMS:  ActionOfClearMakeItems(PlayObject,QuestActionInfo);
        nSC_SETSENDMSGFLAG:  PlayObject.m_boSendMsgFlag:=True;
        nSC_UPGRADEITEMS:    ActionOfUpgradeItems(PlayObject,QuestActionInfo);
        nSC_UPGRADEITEMSEX:  ActionOfUpgradeItemsEx(PlayObject,QuestActionInfo);
        nSC_MONGENEX:        ActionOfMonGenEx(PlayObject,QuestActionInfo);
        nSC_CLEARMAPMON:     ActionOfClearMapMon(PlayObject,QuestActionInfo);
        nSC_SETMAPMODE:      ActionOfSetMapMode(PlayObject,QuestActionInfo);
        nSC_PKZONE:          ActionOfPkZone(PlayObject,QuestActionInfo);
        nSC_RESTBONUSPOINT:  ActionOfRestBonusPoint(PlayObject,QuestActionInfo);
        nSC_TAKECASTLEGOLD:  ActionOfTakeCastleGold(PlayObject,QuestActionInfo);
        nSC_HUMANHP:         ActionOfHumanHP(PlayObject,QuestActionInfo);
        nSC_HUMANMP:         ActionOfHumanMP(PlayObject,QuestActionInfo);
        nSC_GUILDMODE        :ActionOfGuildMode(PlayObject,QuestActionInfo);
        nSC_BUILDPOINT       :ActionOfGuildBuildPoint(PlayObject,QuestActionInfo);
        nSC_AURAEPOINT       :ActionOfGuildAuraePoint(PlayObject,QuestActionInfo);
        nSC_STABILITYPOINT   :ActionOfGuildstabilityPoint(PlayObject,QuestActionInfo);
        nSC_FLOURISHPOINT    :ActionOfGuildflourishPoint(PlayObject,QuestActionInfo);
        nSC_OPENMAGICBOX     :ActionOfOpenMagicBox(PlayObject,QuestActionInfo);
        nSC_SETRANKLEVELNAME :ActionOfSetRankLevelName(PlayObject,QuestActionInfo);
        nSC_GMEXECUTE        :ActionOfGmExecute(PlayObject,QuestActionInfo);
        nSC_GUILDCHIEFITEMCOUNT :ActionOfGuildChiefItemCount(PlayObject,QuestActionInfo);
        nSC_ADDNAMEDATELIST  :ActionOfAddNameDateList(PlayObject,QuestActionInfo);
        nSC_DELNAMEDATELIST  :ActionOfDelNameDateList(PlayObject,QuestActionInfo);
        nSC_MOBFIREBURN      :ActionOfMobFireBurn(PlayObject,QuestActionInfo);
        nSC_MESSAGEBOX       :ActionOfMessageBox(PlayObject,QuestActionInfo);
        nSC_SETSCRIPTFLAG    :ActionOfSetScriptFlag(PlayObject,QuestActionInfo);
        nSC_SETAUTOGETEXP    :ActionOfAutoGetExp(PlayObject,QuestActionInfo);
        nSC_VAR              :ActionOfVar(PlayObject,QuestActionInfo);
        nSC_LOADVAR          :ActionOfLoadVar(PlayObject,QuestActionInfo);
        nSC_SAVEVAR          :ActionOfSaveVar(PlayObject,QuestActionInfo);
        nSC_CALCVAR          :ActionOfCalcVar(PlayObject,QuestActionInfo);
        nSC_SAVESLAVES       :ActionOfSaveSlaves(PlayObject, QuestActionInfo);

        nSC_GUILDRECALL      :ActionOfGuildRecall(PlayObject,QuestActionInfo);
        nSC_GROUPADDLIST     :ActionOfGroupAddList(PlayObject,QuestActionInfo);
        nSC_CLEARLIST        :ActionOfClearList(PlayObject,QuestActionInfo);
        nSC_GROUPRECALL      :ActionOfGroupRecall(PlayObject,QuestActionInfo);
        nSC_GROUPMOVEMAP     :ActionOfGroupMoveMap(PlayObject,QuestActionInfo);
        nSC_ADDBEGINNER      :ActionOfAddGuild(PlayObject,QuestActionInfo);    //檬焊巩颇
        nSC_SETSENDMSGFLAG1: PlayObject.m_boSendMsgFlag1:=True;

        nSETNEWRANKNAME      :ActionOfRankName(PlayObject,QuestActionInfo);

        nSC_CHANGEITEM       :ActionOfChangeItem(PlayObject,QuestActionInfo);    //殿急酒捞袍栏肺 函券 (函券芒)
        nSC_CHANGEITEMUP     :ActionOfChangeUpItem(PlayObject,QuestActionInfo);  //函券 浚乔矫
        nSC_ACCCHANGEITEM    :ActionOfAccChangeItem(PlayObject,QuestActionInfo); //厘脚备函券
        nSC_ROCKPAPERS       :ActionOfRockPapers(PlayObject, QuestActionInfo); //啊困官困焊
        nSC_DELETEHERO       :ActionOfDeleteHero(PlayObject, QuestActionInfo);
        nSC_RECALLHERO       :PlayObject.ClientHeroLogOn(1);
        nSC_HEROLOGOUT       :if PlayObject.m_MyHero <> nil then THeroObject(PlayObject.m_MyHero).LogOut();
      end;
    end;
  end;
  procedure SendMerChantSayMsg(sMsg:String;boFlag:Boolean); //0049E3E0
  var
    s10,s14:String;
    nC:Integer;
  begin
    s14:=sMsg;
    nC:=0;
    while (True) do begin
      if TagCount(s14,'>') < 1 then break;
      s14:=ArrestStringEx(s14,'<','>',s10);
      GetVariableText(PlayObject,sMsg,s10);
      Inc(nC);
      if nC >= 101 then break;
    end;
    PlayObject.GetScriptLabel(sMsg);
    if boFlag then begin
      PlayObject.SendFirstMsg(Self,RM_MERCHANTSAY,0,0,0,0,m_sCharName + '/' + sMsg);
    end else begin
      PlayObject.SendMsg(Self,RM_MERCHANTSAY,0,0,0,0,m_sCharName + '/' + sMsg);
    end;      
  end;
begin   //0049E584
  Script := nil;
  BaseObject := AObject;
  PlayObject := AObject;
  List1C := TStringList.Create;
  n18:=1000;
  n20:=0;
  if PlayObject.m_NPC <> Self then begin
    PlayObject.m_NPC:=nil;
    PlayObject.m_Script:=nil;
    FillChar(PlayObject.m_nVal,SizeOf(PlayObject.m_nVal),#0);
  end;
  if CompareText(sLabel,'@main') = 0 then begin
    for I := 0 to m_ScriptList.Count - 1 do begin
      Script3C:=m_ScriptList.Items[i];
      for II := 0 to Script3C.RecordList.Count - 1 do begin
        SayingRecord:=Script3C.RecordList.Items[II];
     //   mainoutmessage('SayingRecord.sLabel:' + SayingRecord.sLabel + 'label: ' + slabel);
        if CompareText(sLabel,SayingRecord.sLabel) = 0 then begin
          Script:=Script3C;
          PlayObject.m_Script:=Script;
          PlayObject.m_NPC:=Self;
          break;
        end;
        if Script <> nil then break;
      end;
    end;
  end; //0049E6CB
  if (Script = nil) then begin
    if (PlayObject.m_Script <> nil) then begin
      for I := m_ScriptList.Count - 1 downto 0 do begin
        if m_ScriptList.Items[i] = PlayObject.m_Script then begin
          Script:=m_ScriptList.Items[i];
        end;
      end;
    end; //0049E72F
    if (Script = nil) then begin
      for I := m_ScriptList.Count - 1 downto 0 do begin
        if CheckQuestStatus(pTScript(m_ScriptList.Items[i])) then begin
          Script:=m_ScriptList.Items[i];
          PlayObject.m_Script:=Script;
          PlayObject.m_NPC:=Self;
        end;
      end;
    end;
  end; //0049E79B

  //跳转到指定示签，执行
  if (Script <> nil) then begin
    for II := 0 to Script.RecordList.Count - 1 do begin
      SayingRecord:=Script.RecordList.Items[II];
      if CompareText(sLabel,SayingRecord.sLabel) = 0 then begin
        if boExtJmp and not SayingRecord.boExtJmp then break;
        sSendMsg:='';
        for III := 0 to SayingRecord.ProcedureList.Count - 1 do begin
          SayingProcedure:=SayingRecord.ProcedureList.Items[III];
          bo11:=False;
          if QuestCheckCondition(SayingProcedure.ConditionList) then begin
            sSendMsg:=sSendMsg + SayingProcedure.sSayMsg;
            if not QuestActionProcess(SayingProcedure.ActionList) then break;
            if bo11 then SendMerChantSayMsg(sSendMsg,True);
          end else begin //0049E865
            sSendMsg:=sSendMsg + SayingProcedure.sElseSayMsg;
            if not QuestActionProcess(SayingProcedure.ElseActionList) then break;
            if bo11 then SendMerChantSayMsg(sSendMsg,True);
          end; //0049E8A2
        end; //for III := 0 to SayingRecord.List04.Count - 1 do begin
        if sSendMsg <> '' then SendMerChantSayMsg(sSendMsg,False);
        break;
      end; //if CompareText(sLabel,SayingRecord.s00) = 0 then begin
    end; //for II := 0 to XXXInfo.List58.Count - 1 do begin
  end; //if (XXXInfo <> nil) then begin
  List1C.Free;
end;

procedure TNormNpc.LoadNPCScript; //0049EAF0
var
  s08:String;
begin
  if m_boIsQuest then begin
    m_sPath:=sNpc_def;
    s08:=m_sCharName + '-' + m_sMapName;
    FrmDB.LoadNpcScript(Self,m_sFilePath,s08);
  end else begin //0049EB8E
    m_sPath:=m_sFilePath;
    FrmDB.LoadNpcScript(Self,m_sFilePath,m_sCharName);
  end;
end;
function TNormNpc.Operate(ProcessMsg:pTProcessMessage):Boolean;//0049AB64
begin
  Result:=inherited Operate(ProcessMsg);
end;

procedure TNormNpc.Run; //0049ABCC
begin
  if m_Master <> nil then m_Master:=nil; //不允许召唤为宝宝
    
  inherited;
end;

procedure TNormNpc.ScriptActionError(PlayObject: TPlayObject;sErrMsg:String;
  QuestActionInfo: pTQuestActionInfo; sCmd: String);
var
  sMsg:String;
ResourceString
  sOutMessage = '[任务命令] %s 命令:%s NPC:%s 地图:%s(%d:%d) Param1:%s Param2:%s Param3:%s Param4:%s Param5:%s Param6:%s';
begin
  sMsg:=format(sOutMessage,[sErrMsg,
                            sCmd,
                            m_sCharName,
                            m_sMapName,
                            m_nCurrX,
                            m_nCurrY,
                            QuestActionInfo.sParam1,
                            QuestActionInfo.sParam2,
                            QuestActionInfo.sParam3,
                            QuestActionInfo.sParam4,
                            QuestActionInfo.sParam5,
                            QuestActionInfo.sParam6]);
  MainOutMessage(sMsg);
end;

procedure TNormNpc.ScriptConditionError(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo; sCmd: String);
var
  sMsg:String;
begin
  sMsg:='命令:' + sCmd +
        ' NPC:' + m_sCharName +
        ' 地图:' + m_sMapName +
        ' (' + IntToStr(m_nCurrX) + ':' + IntToStr(m_nCurrY) +
        ') Param1:' + QuestConditionInfo.sParam1 +
        ' Param2:' + QuestConditionInfo.sParam2 +
        ' Param3:' + QuestConditionInfo.sParam3 +
        ' Param4:' + QuestConditionInfo.sParam4 +
        ' Param5:' + QuestConditionInfo.sParam5;
  MainOutMessage('[Npc 错误] ' + sMsg);
end;

procedure TNormNpc.SendMsgToUser(PlayObject: TPlayObject; sMsg: String); //0049AD14
begin
  PlayObject.SendMsg(Self,RM_MERCHANTSAY,0,0,0,0,m_sCharName + '/' + sMsg);
end;

function TNormNpc.sub_49ADB8(sMsg, sStr, sText: String): String;  //0049ADB8
var
  n10:Integer;
  s14,s18:String;
begin
  n10:=Pos(sStr,sMsg);
  if n10 > 0 then begin
    s14:=Copy(sMsg,1,n10 -1);
    s18:=Copy(sMsg,Length(sStr) + n10,Length(sMsg));
    Result:=s14 + sText + s18;
  end else Result:=sMsg;    
end;

procedure TNormNpc.UserSelect(PlayObject:TPlayObject;sData:String); //0049EC28
var
  sMsg,sLabel:String;
begin
  PlayObject.m_nScriptGotoCount:=0;
//==============================================
//处理脚本命令 @back 返回上级标签内容
  if (sData <> '') and (sData[1] = '@') then begin
    sMsg:=GetValidStr3(sData,sLabel,[#13]);
    if (PlayObject.m_sScriptCurrLable <> sLabel) then begin
      if (sLabel <> sBACK) then begin
        PlayObject.m_sScriptGoBackLable:=PlayObject.m_sScriptCurrLable;
        PlayObject.m_sScriptCurrLable:=sLabel;
      end else begin
        if PlayObject.m_sScriptCurrLable <> '' then begin
          PlayObject.m_sScriptCurrLable:='';
        end else begin
          PlayObject.m_sScriptGoBackLable:='';
        end;
      end;
    end;
  end;
//==============================================
end;

procedure TNormNpc.ActionOfChangeNameColor(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nColor:Integer;
begin
  nColor:=QuestActionInfo.nParam1;
  if (nColor < 0) or (nColor > 255 ) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGENAMECOLOR);
    exit;
  end;
  PlayObject.m_btNameColor:=nColor;
  PlayObject.RefNameColor();
end;

procedure TNormNpc.ActionOfClearPassword(PlayObject: TPlayObject;     //芒绊鞠龋
  QuestActionInfo: pTQuestActionInfo);
begin
  PlayObject.m_sStoragePwd:='';
  PlayObject.m_boStoragePwd:=False;
end;
//RECALLMOB 怪物名称 等级 叛变时间 变色(0,1) 固定颜色(1 - 7)
//变色为0 时固定颜色才起作用
procedure TNormNpc.ActionOfRecallmob(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  Mon:TBaseObject;
begin
  if QuestActionInfo.nParam3 <= 1 then begin
    Mon:=PlayObject.MakeSlave(QuestActionInfo.sParam1,3,Str_ToInt(QuestActionInfo.sParam2,0),100,10 * 24 * 60 * 60);
  end else begin
    Mon:=PlayObject.MakeSlave(QuestActionInfo.sParam1,3,Str_ToInt(QuestActionInfo.sParam2,0),100,QuestActionInfo.nParam3 * 60)
  end;
end;

procedure TNormNpc.ActionOfReNewLevel(PlayObject: TPlayObject;        //傈流
  QuestActionInfo: pTQuestActionInfo);
var
  nReLevel,nLevel:Integer;
  nBounsuPoint:Integer;
begin
  nReLevel:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nLevel:=Str_ToInt(QuestActionInfo.sParam2, -1);
  nBounsuPoint:=Str_ToInt(QuestActionInfo.sParam3, -1);
  if (nReLevel < 0) or (nLevel < 0) or (nBounsuPoint < 0) or (nBounsuPoint > g_Config.nBonusPointHack) then begin        //焊呈胶器牢飘 琴
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_RENEWLEVEL);
    exit;
  end;
    
  if (PlayObject.m_btReLevel + nReLevel) <= 255 then begin
    Inc(PlayObject.m_btReLevel,nReLevel);
    if nLevel > 0 then PlayObject.m_Abil.Level:=nLevel;
    if g_Config.boReNewLevelClearExp then PlayObject.m_Abil.Exp:=0;
    Inc(PlayObject.m_nBonusPoint,nBounsuPoint);
    PlayObject.SendMsg (PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    PlayObject.HasLevelUp(0);
    PlayObject.RefShowName();
    PlayObject.RefUserState();
    PlayObject.RecalcAbilitys();
  end;
end;

procedure TNormNpc.ActionOfChangeGender(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nGender:Integer;
begin
  nGender:=Str_ToInt(QuestActionInfo.sParam1, -1);
  if not (nGender in [0,1]) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEGENDER);
    exit;
  end;
      
  PlayObject.m_btGender:=nGender;
  PlayObject.FeatureChanged;
end;

procedure TNormNpc.ActionOfKillSlave(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  Slave:TBaseObject;
begin
  for I := 0 to PlayObject.m_SlaveList.Count - 1 do begin
    Slave:=TBaseObject(PlayObject.m_SlaveList.Items[I]);
    Slave.m_WAbil.HP:=0;
  end;
end;

procedure TNormNpc.ActionOfTempPowerUp(PlayObject: TPlayObject;    //TempPowerUp
  QuestActionInfo: pTQuestActionInfo);
var
 nPower:Integer;
 nTime:Integer;
 nAbil:Integer;
begin
  nAbil:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nPower:=Str_ToInt(QuestActionInfo.sParam2, -1);
  nTime:=Str_ToInt(QuestActionInfo.sParam3, -1);
  if {(nAbil < 0) or} (nPower < 0) or (nTime < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_TEMPPOWERUP);
    exit;
  end;
  if CompareText(QuestActionInfo.sParam1,'DC') = 0 then begin     //颇鲍
    PlayObject.TempPowerUp(0, nPower, nTime)
  end;
  if CompareText(QuestActionInfo.sParam1,'MC') = 0 then begin     //付过
    PlayObject.TempPowerUp(1, nPower, nTime)
  end;
  if CompareText(QuestActionInfo.sParam1,'SC') = 0 then begin     //档仿
    PlayObject.TempPowerUp(2, nPower, nTime)
  end;
  if CompareText(QuestActionInfo.sParam1,'ASPEED') = 0 then begin  //傍加
    PlayObject.TempPowerUp(3, nPower, nTime)
  end;
  if CompareText(QuestActionInfo.sParam1,'HP') = 0 then begin     //眉仿
    PlayObject.TempPowerUp(4, nPower, nTime)
  end;
  if CompareText(QuestActionInfo.sParam1,'MP') = 0 then begin    //付仿
    PlayObject.TempPowerUp(5, nPower, nTime)
  end;
end;

procedure TNormNpc.ActionOfHealing(PlayObject: TPlayObject;    //NPC 鳃傅
  QuestActionInfo: pTQuestActionInfo);
var
 nHP:Integer;
 nMP:Integer;
begin
  nHP:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nMP:=Str_ToInt(QuestActionInfo.sParam2, -1);

  if (nHP < 0) or (nMP < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_HEALING);
    exit;
  end;

  PlayObject.SendRefMsg(RM_10205, 0, PlayObject.m_nCurrX, PlayObject.m_nCurrY, NE_USERHEALING,'0');
  PlayObject.m_nIncHealing := PlayObject.m_nIncHealing + nHP;
  PlayObject.m_nIncSpell := PlayObject.m_nIncSpell + nMP;
  PlayObject.m_nPerHealing := 5;
  PlayObject.m_nPerSpell := (PlayObject.m_Abil.Level div 10 + 5);
end;

procedure TNormNpc.ActionOfSnow(PlayObject: TPlayObject;        //传坷绰捞棋
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  sMapName: string;
  Envir: TEnvirnoment;
  nLevel: Integer;
  boOldSnow: Boolean;
  nOldLevel: Integer;
  OnLineObject: TPlayObject;
begin
  sMapName := QuestActionInfo.sParam1;
  nLevel := Str_ToInt(QuestActionInfo.sParam2, -1);
  Envir := g_MapManager.FindMap(sMapName);
  if (nLevel < 0) or (Envir = nil) then begin
    ScriptActionError(PlayObject, '', QuestActionInfo, sSC_SNOW);
    Exit;
  end;
  boOldSnow := Envir.m_boSNOW;
  nOldLevel := Envir.m_nSNOWLEVEL;
  Envir.m_boSNOW := nLevel > 0;
  Envir.m_nSNOWLEVEL := nLevel;
  if (boOldSnow <> Envir.m_boSNOW) or (Envir.m_nSNOWLEVEL <> nOldLevel) then begin
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      OnLineObject := TPlayObject(UserEngine.m_PlayObjectList.Objects[I]);
      if (not OnLineObject.m_boGhost) and
        (not OnLineObject.m_boDeath) and
        (OnLineObject.m_PEnvir = Envir) then
        OnLineObject.SendDefMessage(SM_SENDSNOW, Envir.m_nSNOWLEVEL, Integer(Envir.m_boSNOW), 0, Integer(Envir.m_boFLOWER), '');
    end;
  end;
end;

procedure TNormNpc.ActionOfFlower(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  sMapName: string;
  Envir: TEnvirnoment;
  nLevel: Integer;
  boOldSnow: Boolean;
  nOldLevel: Integer;
  OnLineObject: TPlayObject;
begin
  sMapName := QuestActionInfo.sParam1;
  nLevel := Str_ToInt(QuestActionInfo.sParam2, -1);
  Envir := g_MapManager.FindMap(sMapName);
  if (nLevel < 0) or (Envir = nil) then begin
    ScriptActionError(PlayObject, '', QuestActionInfo, sSC_FLOWER);
    Exit;
  end;
  boOldSnow := Envir.m_boFLOWER;
  nOldLevel := Envir.m_nFLOWERLEVEL;
  Envir.m_boFLOWER := nLevel > 0;
  Envir.m_nFLOWERLEVEL := nLevel;
  if (boOldSnow <> Envir.m_boFLOWER) or (Envir.m_nFLOWERLEVEL <> nOldLevel) then begin
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      OnLineObject := TPlayObject(UserEngine.m_PlayObjectList.Objects[I]);
      if (not OnLineObject.m_boGhost) and
        (not OnLineObject.m_boDeath) and
        (OnLineObject.m_PEnvir = Envir) then
        OnLineObject.SendDefMessage(SM_SENDSNOW, Envir.m_nSNOWLEVEL, Integer(Envir.m_boSNOW), Envir.m_nFLOWERLEVEL, Integer(Envir.m_boFLOWER), '');
    end;
  end;
end;

procedure TNormNpc.ActionOfKillMonExpRate(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
 nRate:Integer;
 nTime:Integer;
begin
  nRate:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nTime:=Str_ToInt(QuestActionInfo.sParam2, -1);
  if (nRate < 0) or (nTime < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_KILLMONEXPRATE);
    exit;
  end;

  PlayObject.m_nKillMonExpRate:=nRate;
  PlayObject.m_dwKillMonExpRateTime:=LongWord(nTime);
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SendMsg(self, RM_BUFF, 50, 0, 504, nTime, '经验值 + ' + intToStr(nRate - 100) + '%: '); //NPC 版氰摹滚橇
  end;
end;

procedure TNormNpc.ActionOfBeginnerExpRate(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
 nRate:Integer;
 nTime:Integer;
begin
  nRate:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nTime:=Str_ToInt(QuestActionInfo.sParam2, -1);
  if (nRate < 0) or (nTime < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_BEGINNEREXPRATE);
    exit;
  end;

  PlayObject.m_nKillMonExpRate5:=nRate;
  PlayObject.m_dwKillMonExpRateTime5:=LongWord(nTime);
end;

procedure TNormNpc.ActionOfMasterExpRate(PlayObject: TPlayObject;     //荤力 版摹
  QuestActionInfo: pTQuestActionInfo);
var
 nRate:Integer;
 nMode:Integer;
begin
  nRate:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nMode:=Str_ToInt(QuestActionInfo.sParam2, -1);
  if (nRate < 0) or (nMode < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MASTEREXPRATE);
    exit;
  end;

  if nMode = 1 then begin
   if PlayObject.m_nMasterUpExp > 0 then begin
    PlayObject.m_nKillMonExpRate4:=nRate;
    PlayObject.m_dwKillMonExpRateTime4:= LongWord( PlayObject.m_nMasterUpExp );
    PlayObject.SendMsg(self, RM_BUFF, 31, 0, 30, PlayObject.m_nMasterUpExp, '[ 老师的威严 ]\经验值 + ' + intToStr(nRate - 100) + '%: '); //胶铰狼困决 滚橇
   end;
  end else begin
   PlayObject.m_nKillMonExpRate4:=nRate;
   PlayObject.m_dwKillMonExpRateTime4:= 0;
   PlayObject.SendMsg(self, RM_BUFF, 31, 0, 30, 0, ''); //胶铰狼困决 滚橇
  end;
end;

procedure TNormNpc.ActionOfMonGenEx(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  sMapName,sMonName:String;
  nMapX,nMapY,nRange,nCount:Integer;
  nRandX,nRandY:Integer;
begin
  sMapName:=QuestActionInfo.sParam1;
  nMapX:=Str_ToInt(QuestActionInfo.sParam2, -1);
  nMapY:=Str_ToInt(QuestActionInfo.sParam3, -1);
  sMonName:=QuestActionInfo.sParam4;
  nRange:=QuestActionInfo.nParam5;
  nCount:=QuestActionInfo.nParam6;
  if (sMapName = '') or (nMapX <= 0) or (nMapY <= 0) or (sMonName = '') or (nRange <= 0) or (nCount <= 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MONGENEX);
    exit;
  end;
  for I := 0 to nCount - 1 do begin
    nRandX:=Random(nRange * 2 + 1) + (nMapX - nRange);
    nRandY:=Random(nRange * 2 + 1) + (nMapY - nRange);
    if UserEngine.RegenMonsterByName(sMapName,nRandX,nRandY,sMonName) = nil then begin
      //ScriptActionError(PlayObject,'',QuestActionInfo,sSC_MONGENEX);
      break;
    end;
  end;
end;



procedure TNormNpc.ActionOfOpenMagicBox(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  Monster:TBaseObject;
  sMonName:String;
  nX,nY:Integer;
begin
  sMonName:=QuestActionInfo.sParam1;
  if sMonName = '' then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_OPENMAGICBOX);
    exit;
  end;
  PlayObject.GetFrontPosition(nX,nY);
  Monster:=UserEngine.RegenMonsterByName(PlayObject.m_PEnvir.sMapName,nX,nY,sMonName);
  if Monster = nil then begin
    exit;
  end;
  Monster.Die;
    
end;

procedure TNormNpc.ActionOfPkZone(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nX,nY:Integer;
  FireBurnEvent:TFireBurnEvent;
  nMinX,nMaxX,nMinY,nMaxY:Integer;
  nRange,nType,nTime,nPoint:Integer;
begin


  nRange:=Str_ToInt(QuestActionInfo.sParam1,-1);
  nType:=Str_ToInt(QuestActionInfo.sParam2,-1);
  nTime:=Str_ToInt(QuestActionInfo.sParam3,-1);
  nPoint:=Str_ToInt(QuestActionInfo.sParam4,-1);
  if (nRange < 0) or (nType < 0) or (nTime < 0) or (nPoint < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_PKZONE);
    exit;
  end;
  {
  nMinX:=PlayObject.m_nCurrX - nRange;
  nMaxX:=PlayObject.m_nCurrX + nRange;
  nMinY:=PlayObject.m_nCurrY - nRange;
  nMaxY:=PlayObject.m_nCurrY + nRange;
  }
  nMinX:=m_nCurrX - nRange;
  nMaxX:=m_nCurrX + nRange;
  nMinY:=m_nCurrY - nRange;
  nMaxY:=m_nCurrY + nRange;
  for nX:= nMinX to nMaxX do begin
    for nY:= nMinY to nMaxY do begin
      if ((nX < nMaxX) and (nY = nMinY)) or
         ((nY < nMaxY) and (nX = nMinX)) or
         (nX = nMaxX) or (nY = nMaxY) then begin
        FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY,nType,nTime * 1000,nPoint);
        g_EventManager.AddEvent(FireBurnEvent);
      end;
    end;
  end;

end;

procedure TNormNpc.ActionOfPowerRate(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
 nRate:Integer;
 nTime:Integer;
begin
  nRate:=Str_ToInt(QuestActionInfo.sParam1, -1);
  nTime:=Str_ToInt(QuestActionInfo.sParam2, -1);
  if (nRate < 0) or (nTime < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_POWERRATE);
    exit;
  end;
    
  PlayObject.m_nPowerRate:=nRate;
  PlayObject.m_dwPowerRateTime:=LongWord(nTime);
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sChangePowerRateMsg,[PlayObject.m_nPowerRate / 100,PlayObject.m_dwPowerRateTime]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfChangeMode(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nMode:Integer;
  boOpen:Boolean;
begin
  nMode:=QuestActionInfo.nParam1;
  boOpen:=Str_ToInt(QuestActionInfo.sParam2,-1) = 1;
  if nMode in [1..3] then begin
    case nMode of    //
      1: begin
        PlayObject.m_boAdminMode:=boOpen;
        if PlayObject.m_boAdminMode then PlayObject.SysMsg(sGameMasterMode,c_Green,t_Hint)
        else PlayObject.SysMsg(sReleaseGameMasterMode,c_Green,t_Hint);
      end;
      2: begin
        PlayObject.m_boSuperMan:=boOpen;
        if PlayObject.m_boSuperMan then PlayObject.SysMsg(sSupermanMode,c_Green,t_Hint)
        else PlayObject.SysMsg(sReleaseSupermanMode,c_Green,t_Hint);
      end;
      3: begin
        PlayObject.m_boObMode:=boOpen;
        if PlayObject.m_boObMode then PlayObject.SysMsg(sObserverMode,c_Green,t_Hint)
        else PlayObject.SysMsg(g_sReleaseObserverMode,c_Green,t_Hint);
      end;
    end;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEMODE);
  end;

end;

procedure TNormNpc.ActionOfChangePerMission(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nPermission:Integer;
begin
  nPermission:=Str_ToInt(QuestActionInfo.sParam1, -1);
  if nPermission in [0..10] then begin
    PlayObject.m_btPermission:=nPermission;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEPERMISSION);
    exit;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sChangePermissionMsg,[PlayObject.m_btPermission]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfGiveItem(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  sItemName:String;
  nItemCount:Integer;
  boot:Boolean;
  nDateNow:DWord;
  nDateNow2:Integer;
begin
  sItemName := QuestActionInfo.sParam1;
  nItemCount := QuestActionInfo.nParam2;
  if (sItemName = '') or (nItemCount <= 0) then begin
    ScriptActionError(PlayObject, '', QuestActionInfo, sSC_GIVE);
    Exit;
  end;
  if nItemCount <= 0 then Exit;
  if CompareText(sItemName, sSTRING_GOLDNAME) = 0 then begin
    PlayObject.IncGold(nItemCount);
    PlayObject.GoldChanged();
    //0049D2FE
    if g_boGameLogGold then
      AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(nItemCount) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
      exit;
  end;

  if UserEngine.GetStdItemIdx(sItemName) > 0 then begin
    if not (nItemCount in [1..50]) then nItemCount:=1; //12.28 改上一条
    for I := 0 to nItemCount - 1 do begin //nItemCount 为0时出死循环
      if PlayObject.IsEnoughBag then begin
        New(UserItem);
        if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin

          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
           if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //馆娄
              UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DDay)));
              UserItem.btValue[19]:=2;
           end;

           if (StdItem.StdMode = 2) and (StdItem.Shape in [18]) then begin  //函脚呕
              UserItem.MaxDate := DateTimeToUnix(IncHour(now(),(StdItem.DuraMax)));
              UserItem.btValue[19]:=2;
           end;
           if (StdItem.StdMode = 2) and (StdItem.Shape in [20,21,23,27]) then begin  //龋困捍  龋困谅荤
              UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DuraMax)));
              UserItem.btValue[19]:=2;
           end;

           if PlayObject.AddItemToBag(UserItem,boot) then begin
              if boot then
             PlayObject.SendAddItem(UserItem,1);
            end;

          //0049D46B
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
        end else Dispose(UserItem);
      end else begin
        New(UserItem);
        if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
          //0049D5A5
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
            PlayObject.DropItemDown(UserItem,3,False,PlayObject,nil);
        end;
        Dispose(UserItem);
      end;
    end;
  end;
end;



procedure TNormNpc.ActionOfGiveOptionItem(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  sItemName:String;
  nItemCount,nJob,nVCount:Integer;
  boot:Boolean;
  nDateNow:DWord;
  nDateNow2:Integer;
begin
  sItemName := QuestActionInfo.sParam1;
  nItemCount := QuestActionInfo.nParam2;
  nJob := QuestActionInfo.nParam3;
  nVCount := QuestActionInfo.nParam4;
  if (sItemName = '') or (nItemCount <= 0) or (nJob < 0) or (nVCount < 0) then begin
    ScriptActionError(PlayObject, '', QuestActionInfo, sSC_GIVEOPTION);
    Exit;
  end;
  if nItemCount <= 0 then Exit;
  if CompareText(sItemName, sSTRING_GOLDNAME) = 0 then begin
    exit;
  end;

  if UserEngine.GetStdItemIdx(sItemName) > 0 then begin
    if not (nItemCount in [1..50]) then nItemCount:=1; //12.28 改上一条
    for I := 0 to nItemCount - 1 do begin //nItemCount 为0时出死循环
      if PlayObject.IsEnoughBag then begin
        New(UserItem);
        if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
          if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //馆娄
            UserItem.MaxDate := DateTimeToUnix(IncDay(now(),(StdItem.DDay)));
            UserItem.btValue[19]:=2;
          end;

          if nJob in [0,3] then begin  //傈荤 磊按
            if (StdItem.StdMode in [5,6,90,99]) then begin    //公扁
              UserItem.btValue[0] := nVCount;
            end;
            if (StdItem.StdMode in [19,20,21]) then begin    //格吧捞
              UserItem.btValue[0] := nVCount;
            end;
            if (StdItem.StdMode in [22,23]) then begin  //馆瘤
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
            if (StdItem.StdMode in [24,26]) then begin      //迫骂
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
            if (StdItem.StdMode in [62,64]) then begin      //骇飘 脚惯
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[15] := nVCount;
            end;
          end;
          if nJob in [1] then begin  //贱荤
            if (StdItem.StdMode in [5,6,90,99]) then begin       //公扁
              UserItem.btValue[1] := nVCount;
            end;
            if (StdItem.StdMode in [19,20,21]) then begin   //格吧捞
              UserItem.btValue[1] := nVCount;
            end;
            if (StdItem.StdMode in [22,23]) then begin     //馆瘤
              UserItem.btValue[1] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
            end;
            if (StdItem.StdMode in [24,26]) then begin      //迫骂
              UserItem.btValue[1] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
            if (StdItem.StdMode in [62,64]) then begin      //骇飘 脚惯
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
          end;
          if nJob in [2] then begin  //档荤
            if (StdItem.StdMode in [5,6,90,99]) then begin     //公扁
              UserItem.btValue[2] := nVCount;
            end;
            if (StdItem.StdMode in [19,20,21]) then begin        //格吧捞
              UserItem.btValue[2] := nVCount;
            end;
            if (StdItem.StdMode in [22,23]) then begin         //馆瘤
              UserItem.btValue[2] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
            end;
            if (StdItem.StdMode in [24,26]) then begin      //迫骂
              UserItem.btValue[2] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
            if (StdItem.StdMode in [62,64]) then begin    //骇飘 脚惯
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
          end;
          if nJob in [4] then begin  //铰妨
            if (StdItem.StdMode in [5,6,90,99]) then begin   //公扁
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[2] := nVCount;
            end;
            if (StdItem.StdMode in [19,20,21]) then begin    //格吧捞
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[2] := nVCount;
            end;
            if (StdItem.StdMode in [22,23]) then begin      //馆瘤
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[2] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
            end;
            if (StdItem.StdMode in [24,26]) then begin      //迫骂
              UserItem.btValue[0] := nVCount;
              UserItem.btValue[2] := nVCount;
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[16] := nVCount;
            end;
            if (StdItem.StdMode in [62,64]) then begin       //骇飘 脚惯
              UserItem.btValue[3] := nVCount;
              UserItem.btValue[4] := nVCount;
              UserItem.btValue[15] := nVCount;
            end;
          end;

          if (StdItem.StdMode in [10,11,12]) then begin      //渴
            UserItem.btValue[3] := nVCount;
            UserItem.btValue[4] := nVCount;
            UserItem.btValue[6] := nVCount;
          end;
          if (StdItem.StdMode in [15]) then begin        //捧备
            UserItem.btValue[3] := nVCount;
            UserItem.btValue[4] := nVCount;
          end;

          if PlayObject.AddItemToBag(UserItem,boot) then begin
            if boot then
             PlayObject.SendAddItem(UserItem,1);
          end;
          //0049D46B
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
        end else Dispose(UserItem);
      end else begin
        New(UserItem);
        if UserEngine.CopyToUserItemFromName(sItemName,UserItem) then begin
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
          //0049D5A5
          if StdItem.NeedIdentify = 1 then
            AddGameDataLog('9' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sItemName+'('+ IntToStr(UserItem.Amount) +')' + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     m_sCharName + #9 + '[NPC 放入]');
            PlayObject.DropItemDown(UserItem,3,False,PlayObject,nil);
        end;
        Dispose(UserItem);
      end;
    end;
  end;
end;

procedure TNormNpc.ActionOfGmExecute(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  sData:String;
  btOldPermission:Byte;
  sParam1,sParam2,sParam3,sParam4,sParam5,sParam6:String;
begin
  sParam1:=QuestActionInfo.sParam1;
  sParam2:=QuestActionInfo.sParam2;
  sParam3:=QuestActionInfo.sParam3;
  sParam4:=QuestActionInfo.sParam4;
  sParam5:=QuestActionInfo.sParam5;
  sParam6:=QuestActionInfo.sParam6;
  if CompareText(sParam2,'Self') = 0 then sParam2:=PlayObject.m_sCharName;
    
  sData:=format('@%s %s %s %s %s %s',[sParam1,
                                      sParam2,
                                      sParam3,
                                      sParam4,
                                      sParam5,
                                      sParam6]);
  btOldPermission:=PlayObject.m_btPermission;
  try
    PlayObject.m_btPermission:=10;
    PlayObject.ProcessUserLineMsg(sData);
  finally
    PlayObject.m_btPermission:=btOldPermission;
  end;
end;

procedure TNormNpc.ActionOfGuildAuraePoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nAuraePoint:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nAuraePoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nAuraePoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_AURAEPOINT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildAuraePointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      Guild.nAurae:=nAuraePoint;
    end;
    '-': begin
      if Guild.nAurae >= nAuraePoint then begin
        Guild.nAurae:=Guild.nAurae - nAuraePoint;
      end else begin
        Guild.nAurae:=0;
      end;
    end;
    '+': begin
      if (High(Integer) - Guild.nAurae) >= nAuraePoint then begin
        Guild.nAurae:=Guild.nAurae + nAuraePoint;
      end else begin
        Guild.nAurae:=High(Integer);
      end;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptGuildAuraePointMsg,[Guild.nAurae]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfGuildMode(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nGuildM:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nGuildM:=Str_ToInt(QuestActionInfo.sParam1,0);
  if nGuildM < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_GUILDMODE);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildBuildPointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);
  if Guild <> nil then begin
    Guild.nGuildMode:=nGuildM;
  end;
end;

procedure TNormNpc.ActionOfGuildBuildPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);

var
  nBuildPoint:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nBuildPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nBuildPoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_BuildPoint);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildBuildPointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      Guild.nBuildPoint:=nBuildPoint;
    end;
    '-': begin
      if Guild.nBuildPoint >= nBuildPoint then begin
        Guild.nBuildPoint:=Guild.nBuildPoint - nBuildPoint;
      end else begin
        Guild.nBuildPoint:=0;
      end;
    end;
    '+': begin
      if (High(Integer) - Guild.nBuildPoint) >= nBuildPoint then begin
        Guild.nBuildPoint:=Guild.nBuildPoint + nBuildPoint;
      end else begin
        Guild.nBuildPoint:=High(Integer);
      end;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptGuildBuildPointMsg,[Guild.nBuildPoint]),c_Green,t_Hint);
  end;

end;

procedure TNormNpc.ActionOfGuildChiefItemCount(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nItemCount:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nItemCount:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nItemCount < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_GUILDCHIEFITEMCOUNT);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildFlourishPointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      Guild.nChiefItemCount:=nItemCount;
    end;
    '-': begin
      if Guild.nChiefItemCount >= nItemCount then begin
        Guild.nChiefItemCount:=Guild.nChiefItemCount - nItemCount;
      end else begin
        Guild.nChiefItemCount:=0;
      end;
    end;
    '+': begin
      if (High(Integer) - Guild.nChiefItemCount) >= nItemCount then begin
        Guild.nChiefItemCount:=Guild.nChiefItemCount + nItemCount;
      end else begin
        Guild.nChiefItemCount:=High(Integer);
      end;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptChiefItemCountMsg,[Guild.nChiefItemCount]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfGuildFlourishPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);

var
  nFlourishPoint:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nFlourishPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nFlourishPoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_FlourishPoint);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildFlourishPointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      Guild.nFlourishing:=nFlourishPoint;
    end;
    '-': begin
      if Guild.nFlourishing >= nFlourishPoint then begin
        Guild.nFlourishing:=Guild.nFlourishing - nFlourishPoint;
      end else begin
        Guild.nFlourishing:=0;
      end;
    end;
    '+': begin
      if (High(Integer) - Guild.nFlourishing) >= nFlourishPoint then begin
        Guild.nFlourishing:=Guild.nFlourishing + nFlourishPoint;
      end else begin
        Guild.nFlourishing:=High(Integer);
      end;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptGuildFlourishPointMsg,[Guild.nFlourishing]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfGuildstabilityPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);

var
  nStabilityPoint:Integer;
  cMethod:Char;
  Guild:TGuild;
begin
  nStabilityPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nStabilityPoint < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_StabilityPoint);
    exit;
  end;
  if PlayObject.m_MyGuild = nil then begin
    PlayObject.SysMsg(g_sScriptGuildStabilityPointNoGuild,c_Red,t_Hint);
    exit;
  end;
  Guild:=TGuild(PlayObject.m_MyGuild);

  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      Guild.nStability:=nStabilityPoint;
    end;
    '-': begin
      if Guild.nStability >= nStabilityPoint then begin
        Guild.nStability:=Guild.nStability - nStabilityPoint;
      end else begin
        Guild.nStability:=0;
      end;
    end;
    '+': begin
      if (High(Integer) - Guild.nStability) >= nStabilityPoint then begin
        Guild.nStability:=Guild.nStability + nStabilityPoint;
      end else begin
        Guild.nStability:=High(Integer);
      end;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptGuildStabilityPointMsg,[Guild.nStability]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfHumanHP(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nHP:Integer;
  cMethod:Char;
begin
  nHP:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nHP < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_HUMANHP);
    exit;
  end;
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      PlayObject.m_WAbil.HP:=nHP;
    end;
    '-': begin
      if PlayObject.m_WAbil.HP >= nHP then begin
        Dec(PlayObject.m_WAbil.HP,nHP);
      end else begin
        PlayObject.m_WAbil.HP:=0;
      end;
    end;
    '+': begin
      Inc(PlayObject.m_WAbil.HP,nHP);
      if PlayObject.m_WAbil.HP > PlayObject.m_WAbil.MaxHP then PlayObject.m_WAbil.HP:=PlayObject.m_WAbil.MaxHP;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptChangeHumanHPMsg,[PlayObject.m_WAbil.MaxHP]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfHumanMP(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nMP:Integer;
  cMethod:Char;
begin
  nMP:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if nMP < 0 then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_HUMANMP);
    exit;
  end;
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      PlayObject.m_WAbil.MP:=nMP;
    end;
    '-': begin
      if PlayObject.m_WAbil.MP >= nMP then begin
        Dec(PlayObject.m_WAbil.MP,nMP);
      end else begin
        PlayObject.m_WAbil.MP:=0;
      end;
    end;
    '+': begin
      Inc(PlayObject.m_WAbil.MP,nMP);
      if PlayObject.m_WAbil.MP > PlayObject.m_WAbil.MaxMP then PlayObject.m_WAbil.MP:=PlayObject.m_WAbil.MaxMP;
    end;
  end;
  if g_Config.boShowScriptActionMsg then begin
    PlayObject.SysMsg(format(g_sScriptChangeHumanMPMsg,[PlayObject.m_WAbil.MaxMP]),c_Green,t_Hint);
  end;
end;

procedure TNormNpc.ActionOfKick(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin
  PlayObject.m_boKickFlag:=True;
end;

procedure TNormNpc.ActionOfKill(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nMode:Integer;
begin
  nMode:=Str_ToInt(QuestActionInfo.sParam1,-1);
  if nMode in [0..3] then begin
    case nMode of    //
      1: begin
        PlayObject.m_boNoItem:=True;
        PlayObject.Die;
      end;
      2: begin
        PlayObject.SetLastHiter(Self);
        PlayObject.Die;
      end;
      3: begin
        PlayObject.m_boNoItem:=True;
        PlayObject.SetLastHiter(Self);
        PlayObject.Die;
      end;
      else begin
        PlayObject.Die;
      end;
    end;
  end else begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_KILL);
  end;
    
end;

procedure TNormNpc.ActionOfBonusPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nBonusPoint:Integer;
  cMethod:Char;
begin
  nBonusPoint:=Str_ToInt(QuestActionInfo.sParam2,-1);
  if (nBonusPoint < 0) or (nBonusPoint > g_Config.nBonusPointHack) then begin       //焊呈胶器牢飘 琴
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_BONUSPOINT);
    exit;
  end;
    
  cMethod:=QuestActionInfo.sParam1[1];
  case cMethod of
    '=': begin
      FillChar(PlayObject.m_BonusAbil,SizeOf(TNakedAbility),#0);
      PlayObject.HasLevelUp3(0);
      PlayObject.m_nBonusPoint:=nBonusPoint;
      PlayObject.SendMsg (PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    end;
    '-': begin

    end;
    '+': begin
      Inc(PlayObject.m_nBonusPoint,nBonusPoint);
      PlayObject.SendMsg(PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    end;
  end;
end;


procedure TNormNpc.ActionOfRestBonusPoint(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nTotleUsePoint:Integer;  
begin
    nTotleUsePoint:=PlayObject.m_BonusAbil.DC +
                    PlayObject.m_BonusAbil.MC +
                    PlayObject.m_BonusAbil.SC +
                    PlayObject.m_BonusAbil.AC +
                    PlayObject.m_BonusAbil.MAC +
                    PlayObject.m_BonusAbil.HP +
                    PlayObject.m_BonusAbil.MP +
                    PlayObject.m_BonusAbil.Hit +
                    PlayObject.m_BonusAbil.Speed +
                    PlayObject.m_BonusAbil.X2;
    FillChar(PlayObject.m_BonusAbil,SizeOf(TNakedAbility),#0);


    Inc(PlayObject.m_nBonusPoint,nTotleUsePoint);
    if (nTotleUsePoint > g_Config.nBonusPointHack) then begin    //焊呈胶器牢飘 琴
      MainOutMessage('[使用非法程序]奖励积分 : ' + GetGoldStr(PlayObject.m_nBonusPoint)
                  + ' 角色名 : ' + PlayObject.m_sCharName + ' ID : ' + PlayObject.m_sUserID + ' [IP : ' + PlayObject.m_sIPaddr + ']');
      PlayObject.m_nBonusPoint := 0;
      PlayObject.SysMsg('[检测]回收积分。',c_Red,t_Hint);
    end;
    PlayObject.SendMsg (PlayObject,RM_ADJUST_BONUS,0,0,0,0,'');
    PlayObject.HasLevelUp3(0);
    PlayObject.SysMsg('统计数据已重置。',c_Red,t_Hint);
end;

procedure TNormNpc.ActionOfRestReNewLevel(PlayObject: TPlayObject;   //傈流
  QuestActionInfo: pTQuestActionInfo);
begin
  PlayObject.m_btReLevel:=0;
  PlayObject.HasLevelUp(0);
end;


procedure TNormNpc.ActionOfClearDuelMap(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin

end;

procedure TNormNpc.ActionOfGetDuelItems(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin

end;

procedure TNormNpc.ActionOfUnLock(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
begin

end;

procedure TNormNpc.ActionOfLock(BaseObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin

end;

procedure TNormNpc.ActionOfSetMapMode(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  Envir:TEnvirnoment;
  sMapName:String;
  sMapMode,sParam1,sParam2{,sParam3,sParam4}:String;
begin
  sMapName:=QuestActionInfo.sParam1;
  sMapMode:=QuestActionInfo.sParam2;
  sParam1:=QuestActionInfo.sParam3;
  sParam2:=QuestActionInfo.sParam4;
//  sParam3:=QuestActionInfo.sParam5;
//  sParam4:=QuestActionInfo.sParam6;

  Envir:=g_MapManager.FindMap(sMapName);
  if (Envir = nil) or (sMapMode = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SETMAPMODE);
    exit;
  end;
  if CompareText(sMapMode,'SAFE') = 0 then begin
    if (sParam1 <> '')then begin
      Envir.Flag.boSAFE:=True;
    end else begin
      Envir.Flag.boSAFE:=False;
    end;
  end else
  if CompareText(sMapMode,'DARK') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boDarkness:=True;
    end else begin
      Envir.Flag.boDarkness:=False;
    end;
  end else
  if CompareText(sMapMode,'FIGHT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boFightZone:=True;
    end else begin
      Envir.Flag.boFightZone:=False;
    end;
  end else
  if CompareText(sMapMode,'FIGHT3') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boFight3Zone:=True;
    end else begin
      Envir.Flag.boFight3Zone:=False;
    end;
  end else
  if CompareText(sMapMode,'PKZONE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKZONE:=True;
    end else begin
      Envir.Flag.boPKZONE:=False;
    end;
  end else
  if CompareText(sMapMode,'VAILANT') = 0 then begin    //侩竿狼傈厘
    if (sParam1 <> '') then begin
      Envir.Flag.VailantZone:=True;
    end else begin
      Envir.Flag.VailantZone:=False;
    end;
  end else
  if CompareText(sMapMode,'DAY') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boDayLight:=True;
    end else begin
      Envir.Flag.boDayLight:=False;
    end;
  end else
  if CompareText(sMapMode,'QUIZ') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boQUIZ:=True;
    end else begin
      Envir.Flag.boQUIZ:=False;
    end;
  end else
  if CompareText(sMapMode,'NORECONNECT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORECONNECT:=True;
      Envir.Flag.sNoReconnectMap:=sParam1;
    end else begin
      Envir.Flag.boNORECONNECT:=False;
    end;
  end else
  if CompareText(sMapMode,'MUSIC') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMUSIC:=True;
      Envir.Flag.nMUSICID:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boMUSIC:=False;
    end;
  end else
  if CompareText(sMapMode,'DEATHMATCH') = 0 then begin   //单胶概摹
    if (sParam1 <> '') then begin
      Envir.Flag.boDEATHMATCH:=True;
    end else begin
      Envir.Flag.boDEATHMATCH:=False;
    end;
  end else
  if CompareText(sMapMode,'NOTGROUP') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNotGroup:=True;
    end else begin
      Envir.Flag.boNotGroup:=False;
    end;
  end else
  if CompareText(sMapMode,'EXPRATE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boEXPRATE:=True;
      Envir.Flag.nEXPRATE:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boEXPRATE:=False;
    end;
  end else
  if CompareText(sMapMode,'PKWINLEVEL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKWINLEVEL:=True;
      Envir.Flag.nPKWINLEVEL:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKWINLEVEL:=False;
    end;
  end else
  if CompareText(sMapMode,'PKWINEXP') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKWINEXP:=True;
      Envir.Flag.nPKWINEXP:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKWINEXP:=False;
    end;
  end else
  if CompareText(sMapMode,'PKLOSTLEVEL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKLOSTLEVEL:=True;
      Envir.Flag.nPKLOSTLEVEL:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKLOSTLEVEL:=False;
    end;
  end else
  if CompareText(sMapMode,'PKLOSTEXP') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boPKLOSTEXP:=True;
      Envir.Flag.nPKLOSTEXP:=Str_ToInt(sParam1,-1);
    end else begin
      Envir.Flag.boPKLOSTEXP:=False;
    end;
  end else
  if CompareText(sMapMode,'DECHP') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boDECHP:=True;
      Envir.Flag.nDECHPTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nDECHPPOINT:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boDECHP:=False;
    end;
  end else
  if CompareText(sMapMode,'DECGAMEGOLD') = 0 then begin
    if (sParam1 <> '') and (sParam2 <> '') then begin
      Envir.Flag.boDECGAMEGOLD:=True;
      Envir.Flag.nDECGAMEGOLDTIME:=Str_ToInt(sParam1,-1);
      Envir.Flag.nDECGAMEGOLD:=Str_ToInt(sParam2,-1);
    end else begin
      Envir.Flag.boDECGAMEGOLD:=False;
    end;
  end else
  if CompareText(sMapMode,'RUNHUMAN') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boRUNHUMAN:=True;
    end else begin
      Envir.Flag.boRUNHUMAN:=False;
    end;
  end else
  if CompareText(sMapMode,'RUNMON') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boRUNMON:=True;
    end else begin
      Envir.Flag.boRUNMON:=False;
    end;
  end else
  if CompareText(sMapMode,'NEEDHOLE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNEEDHOLE:=True;
    end else begin
      Envir.Flag.boNEEDHOLE:=False;
    end;
  end else
  if CompareText(sMapMode,'NORECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORECALL:=True;
    end else begin
      Envir.Flag.boNORECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NOGUILDRECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOGUILDRECALL:=True;
    end else begin
      Envir.Flag.boNOGUILDRECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NODEARRECALL') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODEARRECALL:=True;
    end else begin
      Envir.Flag.boNODEARRECALL:=False;
    end;
  end else
  if CompareText(sMapMode,'NORANDOMMOVE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNORANDOMMOVE:=True;
    end else begin
      Envir.Flag.boNORANDOMMOVE:=False;
    end;
  end else
  if CompareText(sMapMode,'NOCASTLEMOVE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOCASTLEMOVE:=True;
    end else begin
      Envir.Flag.boNOCASTLEMOVE:=False;
    end;
  end else
  if CompareText(sMapMode,'NODRUG') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODRUG:=True;
    end else begin
      Envir.Flag.boNODRUG:=False;
    end;
  end else
  if CompareText(sMapMode,'MINE') = 0 then begin      //堡魂 甘牢器 疙飞绢
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE:=True;
    end else begin
      Envir.Flag.boMINE:=False;
    end;
  end else
  if CompareText(sMapMode,'WHITEMINE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE2:=True;
    end else begin
      Envir.Flag.boMINE2:=False;
    end;
  end else
  if CompareText(sMapMode,'EVENTMINE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE3:=True;
    end else begin
      Envir.Flag.boMINE3:=False;
    end;
  end else
  if CompareText(sMapMode,'GREENMINE') = 0 then begin //籍檬堡魂
    if (sParam1 <> '') then begin
      Envir.Flag.boMINE4:=True;
    end else begin
      Envir.Flag.boMINE4:=False;
    end;
  end else
  if CompareText(sMapMode,'NOTHROWITEM') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOTHROWITEM:=True;
    end else begin
      Envir.Flag.boNOTHROWITEM:=False;
    end;
  end else
  if CompareText(sMapMode,'NODROPITEM') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNODROPITEM:=True;
    end else begin
      Envir.Flag.boNODROPITEM:=False;
    end;
  end else
  if CompareText(sMapMode,'NOPOSITIONMOVE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOPOSITIONMOVE:=True;
    end else begin
      Envir.Flag.boNOPOSITIONMOVE:=False;
    end;
  end else
  if CompareText(sMapMode,'NOHORSE') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOHORSE:=True;
    end else begin
      Envir.Flag.boNOHORSE:=False;
    end;
  end else
  if CompareText(sMapMode,'NOCHAT') = 0 then begin
    if (sParam1 <> '') then begin
      Envir.Flag.boNOCHAT:=True;
    end else begin
      Envir.Flag.boNOCHAT:=False;
    end;
  end else
  if CompareText(sMapMode,'FISHEVENT') = 0 then begin       //超矫 捞亥飘
    if (sParam1 <> '') then begin
      Envir.Flag.boFISHEVENT:=True;
    end else begin
      Envir.Flag.boFISHEVENT:=False;
    end;
  end;
  if CompareText(sMapMode,'NOTIGER') = 0 then begin       //呕巴 阂啊
    if (sParam1 <> '') then begin
      Envir.Flag.boNOTIGER:=True;
    end else begin
      Envir.Flag.boNOTIGER:=False;
    end;
  end;
  if CompareText(sMapMode,'ALLATTMAP') = 0 then begin       //吝赋巩颇 傍拜
    if (sParam1 <> '') then begin
      Envir.Flag.boALLATTMAP:=True;
    end else begin
      Envir.Flag.boALLATTMAP:=False;
    end;
  end;
  if CompareText(sMapMode,'NOPENETRATE') = 0 then begin       //噶磊狼渴 阂啊
    if (sParam1 <> '') then begin
      Envir.Flag.boNOPENETRATE:=True;
    end else begin
      Envir.Flag.boNOPENETRATE:=False;
    end;
  end;
  if CompareText(sMapMode,'NOREVIVAL') = 0 then begin       //何劝 阂啊
    if (sParam1 <> '') then begin
      Envir.Flag.boNOREVIVAL:=True;
    end else begin
      Envir.Flag.boNOREVIVAL:=False;
    end;
  end;

end;

function TNormNpc.ConditionOfCheckRangeMonCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  sMapName:String;
  nX,nY,nRange,nCount:Integer;
  cMethod:Char;
  nMapRangeCount:Integer;
  Envir:TEnvirnoment;
  MonList:TList;
  BaseObject:TBaseObject;
begin
  Result:=False;
  sMapName:=QuestConditionInfo.sParam1;
  nX:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  nY:=Str_ToInt(QuestConditionInfo.sParam3, -1);
  nRange:=Str_ToInt(QuestConditionInfo.sParam4, -1);
  cMethod:=QuestConditionInfo.sParam5[1];
  nCount:=Str_ToInt(QuestConditionInfo.sParam6, -1);
  Envir:=g_MapManager.FindMap(sMapName);
  if (Envir = nil) or (nX < 0) or (nY < 0) or (nRange < 0) or (nCount < 0) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKRANGEMONCOUNT);
    exit;
  end;
  MonList:=TList.Create;
  nMapRangeCount:=Envir.GetRangeBaseObject(nX,nY,nRange,True,MonList);
  for I := MonList.Count - 1 downto 0 do begin
    BaseObject:=TBaseObject(MonList.Items[I]);
    if (BaseObject.m_btRaceServer < RC_ANIMAL) or (BaseObject.m_btRaceServer = RC_ARCHERGUARD) or (BaseObject.m_Master <> nil) then
      MonList.Delete(I);
  end;
  nMapRangeCount:=MonList.Count;
  case cMethod of
    '=': if nMapRangeCount = nCount then Result:=True;
    '>': if nMapRangeCount > nCount then Result:=True;
    '<': if nMapRangeCount < nCount then Result:=True;
    else if nMapRangeCount >= nCount then Result:=True;
  end;
  MonList.Free;
end;

function TNormNpc.ConditionOfCheckReNewLevel(PlayObject: TPlayObject;       //傈流
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nLevel:Integer;
  cMethod:Char;
begin
  Result:=False;
  nLevel:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nLevel < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKRENEWLEVEL);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_btReLevel = nLevel then Result:=True;
    '>': if PlayObject.m_btReLevel > nLevel then Result:=True;
    '<': if PlayObject.m_btReLevel < nLevel then Result:=True;
    else if PlayObject.m_btReLevel >= nLevel then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckSlaveLevel(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  nLevel:Integer;
  cMethod:Char;
  BaseObject:TBaseObject;
  nSlaveLevel:Integer;
begin
  Result:=False;
  nLevel:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nLevel < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKSLAVELEVEL);
    exit;
  end;
  nSlaveLevel:=-1;
  for I := 0 to PlayObject.m_SlaveList.Count - 1 do begin
    BaseObject:=TBaseObject(PlayObject.m_SlaveList.Items[I]);
    if BaseObject.m_Abil.Level > nSlaveLevel then nSlaveLevel:=BaseObject.m_Abil.Level;
  end;
  if nSlaveLevel < 0 then exit;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nSlaveLevel = nLevel then Result:=True;
    '>': if nSlaveLevel > nLevel then Result:=True;
    '<': if nSlaveLevel < nLevel then Result:=True;
    else if nSlaveLevel >= nLevel then Result:=True;
  end;
end;


function TNormNpc.ConditionOfCheckMasterUseExp(PlayObject: TPlayObject;     //荤力 版摹
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  nLevel:Integer;
  cMethod:Char;
  BaseObject:TBaseObject;
  nSlaveLevel:Integer;
begin
  Result:=False;
  if PlayObject.m_nKillMonExpRate4 > 100 then begin
   Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckUseItem(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nWhere:Integer;
begin
  Result:=False;
  nWhere:=Str_ToInt(QuestConditionInfo.sParam1,-1);
  if (nWhere < 0) or (nWhere > High(THumanUseItems))then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKUSEITEM);
    exit;
  end;
  if PlayObject.m_UseItems[nWhere].wIndex > 0 then
    Result:=True;
end;

function TNormNpc.ConditionOfCheckVar(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I              :Integer;
  sType          :String;
  sVarName       :String;
  sVarValue      :String;
  nVarValue      :Integer;
  sName          :String;
  sMethod        :String;
  cMethod        :Char;
  DynamicVar     :pTDynamicVar;
  boFoundVar     :Boolean;
  DynamicVarList :TList;
ResourceString
  sVarFound     = '变量%s已存在，变量类型:%s';
  sVarTypeError = '变量类型错误，错误类型:%s 当前支持类型(HUMAN、GUILD、GLOBAL)';
begin
  Result    := False;
  boFoundVar:= False;
  sType     := QuestConditionInfo.sParam1;
  sVarName  := QuestConditionInfo.sParam2;
  sMethod   := QuestConditionInfo.sParam3;
  nVarValue := Str_ToInt(QuestConditionInfo.sParam4,0);
  sVarValue := QuestConditionInfo.sParam4;
  
  if (sType = '') or (sVarName = '') or (sMethod = '') then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKVAR);
    exit;
  end;
  cMethod        := sMethod[1];
  DynamicVarList := GetDynamicVarList(PlayObject,sType,sName);
  if DynamicVarList = nil then begin
    ScriptConditionError(PlayObject, QuestConditionInfo, sSC_CHECKVAR);
    exit;
  end;
  for I := 0 to DynamicVarList.Count - 1 do begin
    DynamicVar:=DynamicVarList.Items[I];
    if CompareText(DynamicVar.sName,sVarName) = 0 then begin
      case DynamicVar.VarType of
        vInteger: begin
          case cMethod of
            '=': if DynamicVar.nInternet = nVarValue then Result:=True;
            '>': if DynamicVar.nInternet > nVarValue then Result:=True;
            '<': if DynamicVar.nInternet < nVarValue then Result:=True;
            else if DynamicVar.nInternet >= nVarValue then Result:=True;
          end;
        end;
        vString: ;
      end;

      boFoundVar:=True;
      break;
    end;
  end;
  //if not boFoundVar then
  //  ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKVAR);

end;




function TNormNpc.ConditionOfCheckCastleGold(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nGold:Integer;
begin
  Result:=False;
  nGold:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if (nGold < 0) or (m_Castle = nil) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKCASTLEGOLD);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if TUserCastle(m_Castle).m_nTotalGold = nGold then Result:=True;
    '>': if TUserCastle(m_Castle).m_nTotalGold > nGold then Result:=True;
    '<': if TUserCastle(m_Castle).m_nTotalGold < nGold then Result:=True;
    else if TUserCastle(m_Castle).m_nTotalGold >= nGold then Result:=True;
  end;

end;

function TNormNpc.ConditionOfCheckPcPoint(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nPcPoint:Integer;
  cMethod:Char;
begin
  Result:=False;
  nPcPoint:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nPcPoint < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKPCPOINT);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_nPCPoint = nPcPoint then Result:=True;
    '>': if PlayObject.m_nPCPoint > nPcPoint then Result:=True;
    '<': if PlayObject.m_nPCPoint < nPcPoint then Result:=True;
    else if PlayObject.m_nPCPoint >= nPcPoint then Result:=True;
  end;
end;



procedure TNormNpc.ActionOfClearNeedItems(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  nNeed:Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
begin
  nNeed:=Str_ToInt(QuestActionInfo.sParam1,-1);
  if (nNeed < 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CLEARNEEDITEMS);
    exit;
  end;
  for I := PlayObject.m_ItemList.Count - 1 downto 0 do begin
    UserItem:=PlayObject.m_ItemList.Items[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) and (StdItem.Need = nNeed) then begin
      PlayObject.SendDelItems(UserItem);
      Dispose(UserItem);
      PlayObject.m_ItemList.Delete(I);
    end;
  end;

  for I := PlayObject.m_StorageItemList.Count - 1 downto 0 do begin
    UserItem:=PlayObject.m_StorageItemList.Items[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if (StdItem <> nil) and (StdItem.Need = nNeed) then begin
      Dispose(UserItem);
      PlayObject.m_StorageItemList.Delete(I);
    end;
  end;
end;

procedure TNormNpc.ActionOfClearMakeItems(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  nMakeIndex:Integer;
  sItemName:String;
  UserItem:pTUserItem;
  StdItem:TItem;
  boMatchName:Boolean;
begin
  sItemName:=QuestActionInfo.sParam1;
  nMakeIndex:=QuestActionInfo.nParam2;
  boMatchName:=QuestActionInfo.sParam3 = '1';
  if (sItemName = '') or (nMakeIndex <= 0) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CLEARMAKEITEMS);
    exit;
  end;
  for I := PlayObject.m_ItemList.Count - 1 downto 0 do begin
    UserItem:=PlayObject.m_ItemList.Items[I];
    if UserItem.MakeIndex <> nMakeIndex then Continue;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if not boMatchName or ((StdItem <> nil) and (CompareText(StdItem.Name,sItemName) = 0)) then begin
      PlayObject.SendDelItems(UserItem);
      Dispose(UserItem);
      PlayObject.m_ItemList.Delete(I);
    end;
  end;

  for I := PlayObject.m_StorageItemList.Count - 1 downto 0 do begin
    UserItem:=PlayObject.m_ItemList.Items[I];
    if UserItem.MakeIndex <> nMakeIndex then Continue;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if not boMatchName or ((StdItem <> nil) and (CompareText(StdItem.Name,sItemName) = 0)) then begin
      Dispose(UserItem);
      PlayObject.m_StorageItemList.Delete(I);
    end;
  end;

  for I := Low(PlayObject.m_UseItems) to High(PlayObject.m_UseItems) do begin
    UserItem:=@PlayObject.m_UseItems[I];
    if UserItem.MakeIndex <> nMakeIndex then Continue;
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if not boMatchName or ((StdItem <> nil) and (CompareText(StdItem.Name,sItemName) = 0)) then begin
      UserItem.wIndex:=0;
    end;
  end;
end;

procedure TNormNpc.SendCustemMsg(PlayObject: TPlayObject; sMsg: String);
begin
  if not g_Config.boSendCustemMsg then begin
    PlayObject.SysMsg(g_sSendCustMsgCanNotUseNowMsg,c_Red,t_Hint);
    exit;
  end;
  if PlayObject.m_boSendMsgFlag then begin
    PlayObject.m_boSendMsgFlag:=False;
    UserEngine.SendBroadCastMsg(PlayObject.m_sCharName + ': ' +  sMsg,t_Cust);
  end else begin


  end;
end;

procedure TNormNpc.SendCustemMsg2(PlayObject: TPlayObject; sMsg: String);
begin
  if not g_Config.boSendCustemMsg then begin
    PlayObject.SysMsg(g_sSendCustMsgCanNotUseNowMsg,c_Red,t_Hint);
    exit;
  end;
  if PlayObject.m_boSendMsgFlag1 then begin
    PlayObject.m_boSendMsgFlag1:=False;
    UserEngine.SendBroadCastMsg(PlayObject.m_sCharName + ': ' +  sMsg,t_Cust1);
  end else begin


  end;
end;

function TNormNpc.ConditionOfCheckOfGuild(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:=False;
  if QuestConditionInfo.sParam1 = '' then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKOFGUILD);
    exit;
  end;
  if (PlayObject.m_MyGuild <> nil) then begin
    if CompareText(TGuild(PlayObject.m_MyGuild).sGuildName,QuestConditionInfo.sParam1) = 0 then begin
      Result:=True;
    end;
  end;
end;

function TNormNpc.ConditionOfCheckOfGuildCount(PlayObject: TPlayObject;   //檬焊巩颇
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
 sGuildName :String;
begin
  Result:=False;
  sGuildName := QuestConditionInfo.sParam1;
  if sGuildName = '' then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKOFGUILDCOUNT);
    exit;
  end;
  if g_GuildManager.MemberOfGuildCount(sGuildName) >= 400 then begin
     Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckOnlineLongMin(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  cMethod:Char;
  nOnlineMin:Integer;
  nOnlineTime:Integer;
begin
  Result:=False;
  nOnlineMin:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nOnlineMin < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_ONLINELONGMIN);
    exit;
  end;
  nOnlineTime:=(GetTickCount - PlayObject.m_dwLogonTick) div 60000;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nOnlineTime = nOnlineMin then Result:=True;
    '>': if nOnlineTime > nOnlineMin then Result:=True;
    '<': if nOnlineTime < nOnlineMin then Result:=True;
    else if nOnlineTime >= nOnlineMin then Result:=True;
  end;
end;

function TNormNpc.ConditionOfCheckPasswordErrorCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nErrorCount:Integer;
  cMethod:Char;
begin
  Result:=False;
  nErrorCount:=Str_ToInt(QuestConditionInfo.sParam2, -1);
  if nErrorCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_PASSWORDERRORCOUNT);
    exit;
  end;
  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if PlayObject.m_btPwdFailCount = nErrorCount then Result:=True;
    '>': if PlayObject.m_btPwdFailCount > nErrorCount then Result:=True;
    '<': if PlayObject.m_btPwdFailCount < nErrorCount then Result:=True;
    else if PlayObject.m_btPwdFailCount >= nErrorCount then Result:=True;
  end;
end;

function TNormNpc.ConditionOfIsLockPassword(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:= PlayObject.m_boPasswordLocked;
end;

function TNormNpc.ConditionOfIsLockStorage(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
begin
  Result:= PlayObject.m_boStoragePwd;      //芒绊鞠龋
end;

function TNormNpc.ConditionOfCheckPayMent(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
 nPayMent:Integer;
begin
  Result:=False;
  nPayMent:=Str_ToInt(QuestConditionInfo.sParam1, -1);
  if nPayMent < 1 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKPAYMENT);
    exit;
  end;

  if PlayObject.m_nPayMent = nPayMent then Result:=True;

end;

function TNormNpc.ConditionOfCheckSlaveName(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nCount: Integer;
  sSlaveName:String;
  cMethod:Char;
begin
  Result:=False;

  sSlaveName:=QuestConditionInfo.sParam1;
  if sSlaveName = '' then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKSLAVENAME);
    exit;
  end;    

  nCount := PlayObject.SlaveCount(sSlaveName);

  cMethod:=QuestConditionInfo.sParam1[1];
  case cMethod of
    '=': if nCount = QuestConditionInfo.nParam3 then Result:=True;
    '>': if nCount > QuestConditionInfo.nParam3 then Result:=True;
    '<': if nCount < QuestConditionInfo.nParam3 then Result:=True;
    else if nCount >= QuestConditionInfo.nParam3 then Result:=True;
  end;
end;

procedure TNormNpc.ActionOfUpgradeItems(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nRate,nWhere,nValType,nPoint,nAddPoint:Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
begin
  nWhere:=Str_ToInt(QuestActionInfo.sParam1,-1);
  nRate:=Str_ToInt(QuestActionInfo.sParam2,-1);
  nPoint:=Str_ToInt(QuestActionInfo.sParam3,-1);
  if (nWhere < 0) or (nWhere > High(THumanUseItems)) or (nRate < 0) or (nPoint < 0) or (nPoint > 255) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_UPGRADEITEMS);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nWhere];
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if (UserItem.wIndex <= 0) or (StdItem = nil) then begin
    PlayObject.SysMsg('Item does not exist',c_Red,t_Hint);
    exit;
  end;
  nRate:=Random(nRate);
  nPoint:=Random(nPoint);
  nValType:=Random(14);
  if nRate <> 0 then begin
    PlayObject.SysMsg('nrate should be 0',c_Red,t_Hint);
    exit;
  end;
  if nValType = 14 then begin
    nAddPoint:=(nPoint * 1000);
    if UserItem.DuraMax + nAddPoint > High(Word) then begin
      nAddPoint:=High(Word) - UserItem.DuraMax;
    end;


    UserItem.DuraMax:=UserItem.DuraMax + nAddPoint;
  end else begin
    nAddPoint:=nPoint;
    if UserItem.btValue[nValType] + nAddPoint > High(Byte) then begin
      nAddPoint:=High(Byte) - UserItem.btValue[nValType];
    end;
      
    UserItem.btValue[nValType]:=UserItem.btValue[nValType] + nAddPoint;
  end;
  PlayObject.SendUpdateItem(UserItem);
  PlayObject.SysMsg('Item improved, new stats:',c_Green,t_Hint);
  PlayObject.SysMsg(StdItem.Name + ': ' +
                         IntToStr(UserItem.Dura) + '/' +
                         IntToStr(UserItem.DuraMax) + '/' +
                         IntToStr(UserItem.btValue[0]) + '/' +
                         IntToStr(UserItem.btValue[1]) + '/' +
                         IntToStr(UserItem.btValue[2]) + '/' +

                         IntToStr(UserItem.btValue[3]) + '/' +
                         IntToStr(UserItem.btValue[4]) + '/' +
                         IntToStr(UserItem.btValue[5]) + '/' +
                         IntToStr(UserItem.btValue[6]) + '/' +
                         IntToStr(UserItem.btValue[7]) + '/' +
                         IntToStr(UserItem.btValue[8]) + '/' +
                         IntToStr(UserItem.btValue[9]) + '/' +
                         IntToStr(UserItem.btValue[10]) + '/' +
                         IntToStr(UserItem.btValue[11]) + '/' +
                         IntToStr(UserItem.btValue[12]) + '/' +
                         IntToStr(UserItem.btValue[13])
                         ,c_Blue,t_Hint);

end;

procedure TNormNpc.ActionOfUpgradeItemsEx(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  nRate,nWhere,nValType,nPoint,nAddPoint:Integer;
  UserItem:pTUserItem;
  StdItem:TItem;
  nUpgradeItemStatus:Integer;
  nRatePoint:Integer;
begin
  nWhere:=Str_ToInt(QuestActionInfo.sParam1,-1);
  nValType:=Str_ToInt(QuestActionInfo.sParam2,-1);
  nRate:=Str_ToInt(QuestActionInfo.sParam3,-1);
  nPoint:=Str_ToInt(QuestActionInfo.sParam4,-1);
  nUpgradeItemStatus:=Str_ToInt(QuestActionInfo.sParam5,-1);
  if (nValType < 0) or (nValType > 14) or (nWhere < 0) or (nWhere > High(THumanUseItems)) or (nRate < 0) or (nPoint < 0) or (nPoint > 255) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_UPGRADEITEMSEX);
    exit;
  end;
  UserItem:=@PlayObject.m_UseItems[nWhere];
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if (UserItem.wIndex <= 0) or (StdItem = nil) then begin
    PlayObject.SysMsg('Item not found',c_Red,t_Hint);
    exit;
  end;
  nRatePoint:=Random(nRate * 10);
  nPoint:=_MAX(1,Random(nPoint));

  if not (nRatePoint in[0..10]) then begin
    case nUpgradeItemStatus of    //
      0: begin
        PlayObject.SysMsg('Upgrade failed',c_Red,t_Hint);
      end;
      1: begin
        PlayObject.SendDelItems(UserItem);
        UserItem.wIndex:=0;
        PlayObject.SysMsg('Item has been destroyed',c_Red,t_Hint);
      end;
      2: begin
        PlayObject.SysMsg('Upgrade succesfull',c_Red,t_Hint);
        if nValType <> 14 then
          UserItem.btValue[nValType]:=0;
      end;
    end;
    exit;
  end;
  if nValType = 14 then begin
    nAddPoint:=(nPoint * 1000);
    if UserItem.DuraMax + nAddPoint > High(Word) then begin
      nAddPoint:=High(Word) - UserItem.DuraMax;
    end;


    UserItem.DuraMax:=UserItem.DuraMax + nAddPoint;
  end else begin
    nAddPoint:=nPoint;
    if UserItem.btValue[nValType] + nAddPoint > High(Byte) then begin
      nAddPoint:=High(Byte) - UserItem.btValue[nValType];
    end;
      
    UserItem.btValue[nValType]:=UserItem.btValue[nValType] + nAddPoint;
  end;
  PlayObject.SendUpdateItem(UserItem);
  PlayObject.SysMsg('New item stats:',c_Green,t_Hint);
  PlayObject.SysMsg(StdItem.Name + ': ' +
                         IntToStr(UserItem.Dura) + '/' +
                         IntToStr(UserItem.DuraMax) + '-' +
                         IntToStr(UserItem.btValue[0]) + '/' +
                         IntToStr(UserItem.btValue[1]) + '/' +
                         IntToStr(UserItem.btValue[2]) + '/' +
                         IntToStr(UserItem.btValue[3]) + '/' +
                         IntToStr(UserItem.btValue[4]) + '/' +
                         IntToStr(UserItem.btValue[5]) + '/' +
                         IntToStr(UserItem.btValue[6]) + '/' +
                         IntToStr(UserItem.btValue[7]) + '/' +
                         IntToStr(UserItem.btValue[8]) + '/' +
                         IntToStr(UserItem.btValue[9]) + '/' +
                         IntToStr(UserItem.btValue[10]) + '/' +
                         IntToStr(UserItem.btValue[11]) + '/' +
                         IntToStr(UserItem.btValue[12]) + '/' +
                         IntToStr(UserItem.btValue[13])
                         ,c_Blue,t_Hint);

end;
//声明变量
//VAR 数据类型(Integer String) 类型(HUMAN GUILD GLOBAL) 变量值
procedure TNormNpc.ActionOfVar(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I              :Integer;
  sType          :String;
  VarType        :TVarType;
  sVarName       :String;
  sVarValue      :String;
  nVarValue      :Integer;
  sName          :String;
  DynamicVar     :pTDynamicVar;
  boFoundVar     :Boolean;
  DynamicVarList :TList;
ResourceString
  sVarFound     = '变量%s已存在，变量类型:%s';
  sVarTypeError = '变量类型错误，错误类型:%s 当前支持类型(HUMAN、GUILD、GLOBAL)';
begin
  sType     := QuestActionInfo.sParam2;
  sVarName  := QuestActionInfo.sParam3;
  sVarValue := QuestActionInfo.sParam4;
  nVarValue := Str_ToInt(QuestActionInfo.sParam4,0);
  VarType   := vNone;
  if CompareText(QuestActionInfo.sParam1,'Integer') = 0 then VarType:=vInteger;
  if CompareText(QuestActionInfo.sParam1,'String') = 0 then VarType:=vString;

  if (sType = '') or (sVarName = '') or (VarType = vNone) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_VAR);
    exit;
  end;
  New(DynamicVar);
  DynamicVar.sName     := sVarName;
  DynamicVar.VarType   := VarType;
  DynamicVar.nInternet := nVarValue;
  DynamicVar.sString   := sVarValue;
  boFoundVar           := False;
  DynamicVarList       := GetDynamicVarList(PlayObject,sType,sName);
  if DynamicVarList = nil then begin
    Dispose(DynamicVar);
    ScriptActionError(PlayObject,format(sVarTypeError,[sType]),QuestActionInfo,sSC_VAR);
    exit;
  end;
  for I := 0 to DynamicVarList.Count - 1 do begin
    if CompareText(pTDynamicVar(DynamicVarList.Items[I]).sName,sVarName) = 0 then begin
      boFoundVar:=True;
      break;
    end;
  end;
  if not boFoundVar then begin
    DynamicVarList.Add(DynamicVar);
  end else begin
    DisPose(DynamicVar);
    //ScriptActionError(PlayObject,format(sVarFound,[sVarName,sType]),QuestActionInfo,sSC_VAR);
  end;

end;
//读取变量值
//LOADVAR 变量类型 变量名 文件名
procedure TNormNpc.ActionOfLoadVar(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I              :Integer;
  sType          :String;
  sVarName       :String;
  sFileName      :String;
  sName          :String;
  DynamicVar     :pTDynamicVar;
  boFoundVar     :Boolean;
  DynamicVarList :TList;
  IniFile        :TIniFile;
ResourceString
  sVarFound     = '变量%s不存在，变量类型:%s';
  sVarTypeError = '变量类型错误，错误类型:%s 当前支持类型(HUMAN、GUILD、GLOBAL)';
begin
  sType     := QuestActionInfo.sParam1;
  sVarName  := QuestActionInfo.sParam2;
  sFileName := g_Config.sEnvirDir + m_sPath + QuestActionInfo.sParam3;
  if (sType = '') or (sVarName = '') or not FileExists(sFileName) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_LOADVAR);
    exit;
  end;
  boFoundVar     := False;
  DynamicVarList := GetDynamicVarList(PlayObject,sType,sName);
  if DynamicVarList = nil then begin
    ScriptActionError(PlayObject,format(sVarTypeError,[sType]),QuestActionInfo,sSC_VAR);
    exit;
  end;  
  IniFile:=TIniFile.Create(sFileName);
  for I := 0 to DynamicVarList.Count - 1 do begin
    DynamicVar:=DynamicVarList.Items[I];
    if CompareText(DynamicVar.sName,sVarName) = 0 then begin
      case DynamicVar.VarType of
        vInteger :DynamicVar.nInternet:=IniFile.ReadInteger(sName,DynamicVar.sName,0);
        vString  :DynamicVar.sString:=IniFile.ReadString(sName,DynamicVar.sName,'');
      end;
      boFoundVar:=True;
      break;
    end;
  end;
 // if not boFoundVar then
  //  ScriptActionError(PlayObject,format(sVarFound,[sVarName,sType]),QuestActionInfo,sSC_LOADVAR);
  IniFile.Free;
end;

//保存变量值
//SAVEVAR 变量类型 变量名 文件名
procedure TNormNpc.ActionOfSaveVar(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I              :Integer;
  sType          :String;
  sVarName       :String;
  sFileName      :String;
  sName          :String;
  DynamicVar     :pTDynamicVar;
  boFoundVar     :Boolean;
  DynamicVarList :TList;
  IniFile        :TIniFile;
ResourceString
  sVarFound     = '变量%s不存在，变量类型:%s';
  sVarTypeError = '变量类型错误，错误类型:%s 当前支持类型(HUMAN、GUILD、GLOBAL)';
begin
  sType     := QuestActionInfo.sParam1;
  sVarName  := QuestActionInfo.sParam2;
  sFileName := g_Config.sEnvirDir + m_sPath + QuestActionInfo.sParam3;
  if (sType = '') or (sVarName = '') or not FileExists(sFileName) then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_SAVEVAR);
    exit;
  end;
  boFoundVar := False;
  DynamicVarList := GetDynamicVarList(PlayObject,sType,sName);
  if DynamicVarList = nil then begin
    ScriptActionError(PlayObject,format(sVarTypeError,[sType]),QuestActionInfo,sSC_VAR);
    exit;
  end;
  IniFile:=TIniFile.Create(sFileName);
  for I := 0 to DynamicVarList.Count - 1 do begin
    DynamicVar:=DynamicVarList.Items[I];
    if CompareText(DynamicVar.sName,sVarName) = 0 then begin
      case DynamicVar.VarType of
        vInteger :IniFile.WriteInteger(sName,DynamicVar.sName,DynamicVar.nInternet);
        vString  :IniFile.WriteString(sName,DynamicVar.sName,DynamicVar.sString);
      end;
      boFoundVar:=True;
      break;
    end;
  end;
  //if not boFoundVar then
  //  ScriptActionError(PlayObject,format(sVarFound,[sVarName,sType]),QuestActionInfo,sSC_SAVEVAR);
  IniFile.Free;
end;
//对变量进行运算(+、-、*、/)
procedure TNormNpc.ActionOfCalcVar(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  I              :Integer;
  sType          :String;
  sVarName       :String;
  sName          :String;
  sVarValue      :String;
  nVarValue      :Integer;
  sMethod        :String;
  cMethod        :Char;
  DynamicVar     :pTDynamicVar;
  boFoundVar     :Boolean;
  DynamicVarList :TList;
ResourceString
  sVarFound     = '变量%s不存在，变量类型:%s';
  sVarTypeError = '变量类型错误，错误类型:%s 当前支持类型(HUMAN、GUILD、GLOBAL)';
begin
  sType     := QuestActionInfo.sParam1;
  sVarName  := QuestActionInfo.sParam2;
  sMethod   := QuestActionInfo.sParam3;
  sVarValue := QuestActionInfo.sParam4;
  nVarValue := Str_ToInt(QuestActionInfo.sParam4,0);
  
  if (sType = '') or (sVarName = '') or (sMethod = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CALCVAR);
    exit;
  end;
  boFoundVar     := False;
  cMethod        := sMethod[1];
  DynamicVarList := GetDynamicVarList(PlayObject,sType,sName);
  if DynamicVarList = nil then begin
    ScriptActionError(PlayObject,format(sVarTypeError,[sType]),QuestActionInfo,sSC_CALCVAR);
    exit;
  end;
  for I := 0 to DynamicVarList.Count - 1 do begin
    DynamicVar:=DynamicVarList.Items[I];
    if CompareText(DynamicVar.sName,sVarName) = 0 then begin
      case DynamicVar.VarType of
        vInteger : begin
          case cMethod of
            '=': DynamicVar.nInternet := nVarValue;
            '+': DynamicVar.nInternet := DynamicVar.nInternet + nVarValue;
            '-': DynamicVar.nInternet := DynamicVar.nInternet - nVarValue;
            '*': DynamicVar.nInternet := DynamicVar.nInternet * nVarValue;
            '/': DynamicVar.nInternet := DynamicVar.nInternet div nVarValue;
          end;
        end;
        vString  : begin
          case cMethod of
            '=': DynamicVar.sString := sVarValue;
            '+': DynamicVar.sString := DynamicVar.sString + sVarValue;
            '-': DynamicVar.sString := AnsiReplaceText(DynamicVar.sString, sVarValue, '');
          end;
        end;
      end;
      boFoundVar:=True;
      break;
    end;
  end;

  //if not boFoundVar then
  //  ScriptActionError(PlayObject,format(sVarFound,[sVarName,sType]),QuestActionInfo,sSC_CALCVAR);

end;


procedure TNormNpc.ActionOfGuildRecall(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
begin
  if PlayObject.m_MyGuild <> nil then begin
    //PlayObject.GuildRecall('GuildRecall','');
  end;
end;

procedure TNormNpc.ActionOfGroupAddList(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  ffile:string;
  I:integer;
begin
  ffile:=QuestActionInfo.sParam1;
  if PlayObject.m_GroupOwner <> nil then begin
    for I := 0 to PlayObject.m_GroupMembers.Count - 1 do begin
    PlayObject:=TPlayObject(PlayObject.m_GroupMembers.Objects[i]);
      //AddListEx(PlayObject.m_sCharName,ffile);
    end;
  end;
end;

//if DeleteFile(fileName)
procedure TNormNpc.ActionOfClearList(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  ffile:string;
  myFile : TextFile;
begin

ffile:=g_Config.sEnvirDir + QuestActionInfo.sParam1;
if FileExists(ffile) then begin
  AssignFile(myFile, ffile);
   ReWrite(myFile);
   CloseFile(myFile);
end;
end;

procedure TNormNpc.ActionOfRankName(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
  sRankName: String;
  nRankColor: integer;
begin
  sRankName := QuestActionInfo.sParam1;
  nRankColor := StrToInt(QuestActionInfo.sParam2);

  PlayObject.m_sRankName:=sRankName;
  PlayObject.m_nRankColor:=nRankColor;

  if sRankName = '' then
    PlayObject.m_sRankName := ' ';
  if nRankColor < 0 then
    PlayObject.m_nRankColor := 0;

  PlayObject.SendRefMsg(RM_SHOWRANKNAME, 0, PlayObject.m_nRankColor, 0, 0, PlayObject.m_sRankName);
  PlayObject.RefShowName();
end;


procedure TNormNpc.ActionOfChangeItem(PlayObject: TPlayObject;      //殿急酒捞袍栏肺 函券 (函券芒)
  QuestActionInfo: pTQuestActionInfo);
begin
  PlayObject.SendDefMessage(SM_SHOWCHANGEITEM, 0, 0, 0, 0, '');
end;

procedure TNormNpc.ActionOfChangeUpItem(PlayObject: TPlayObject;     //函券 浚乔矫
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  UserItem, UserItem1:pTUserItem;
  StdItem, StdItem1:TItem;
  sItemName, sItemName2, sUserItemName:String;
  nItemCount:Integer;
  boot:Boolean;
  nDateNow:DWord;
begin
  UserItem:=nil;
  StdItem:=nil;
  sUserItemName := '';
  sItemName := QuestActionInfo.sParam1;
  sItemName2 := QuestActionInfo.sParam2;
  if (sItemName = '') or (sItemName2 = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEITEMUP);
    Exit;
  end;
  if (sItemName = '') or (sItemName2 = '') then Exit;

  for i:=0 to PlayObject.m_ItemList.Count-1 do begin
   UserItem1:=PlayObject.m_ItemList.Items[i];
   if UserItem1 <> nil then begin
    StdItem1 := UserEngine.GetStdItem(UserItem1.wIndex);
    sUserItemName := UserEngine.GetStdItemName(UserItem1.wIndex);
    if StdItem1 <> nil then begin
     if sUserItemName = sItemName then begin
       if UserEngine._AllowUpgradeItem(UserItem1) then begin    //函券

         if PlayObject.IsEnoughBag then begin
           New(UserItem);
           if UserEngine.CopyToUserItemFromName(sItemName2,UserItem) then begin
             StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

             StdItem.ChangeItemUpgrade (UserItem, UserItem1, 2);      //殿急袍栏肺 函券

             if PlayObject.m_btRaceServer = RC_PLAYOBJECT then begin
                PlayObject.SendDelItems(UserItem1);
             end;
              DisPose(UserItem1);
              PlayObject.m_ItemList.Delete(I);

             if PlayObject.AddItemToBag(UserItem,boot) then begin
              if boot then
              PlayObject.SendAddItem(UserItem,1);
             end;

             PlayObject.SysMsg('普通物品' + sItemName + ' 成功转化为羽化登仙物品 ' + sItemName2 + '。',c_Red,t_Hint);
             exit;
           end;

         end else begin
           PlayObject.SysMsg('你的背包已经满了。',c_Red,t_Hint);
           exit;
         end;

       end else begin
         PlayObject.SysMsg('此物品无法转换。',c_Red,t_Hint);
         exit;
       end;
     end;

    end;
   end;
  end;

end;


procedure TNormNpc.ActionOfAccChangeItem(PlayObject: TPlayObject;     //厘脚备函券
  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  UserItem, UserItem1:pTUserItem;
  StdItem, StdItem1:TItem;
  sItemName, sItemName2, sUserItemName:String;
  nItemCount:Integer;
  boot:Boolean;
  nDateNow:DWord;
begin
  UserItem:=nil;
  StdItem:=nil;
  sUserItemName := '';
  sItemName := QuestActionInfo.sParam1;
  sItemName2 := QuestActionInfo.sParam2;
  if (sItemName = '') or (sItemName2 = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_CHANGEITEMUP);
    Exit;
  end;
  if (sItemName = '') or (sItemName2 = '') then Exit;

  for i:=0 to PlayObject.m_ItemList.Count-1 do begin
   UserItem1:=PlayObject.m_ItemList.Items[i];
   if UserItem1 <> nil then begin
    StdItem1 := UserEngine.GetStdItem(UserItem1.wIndex);
    sUserItemName := UserEngine.GetStdItemName(UserItem1.wIndex);
    if StdItem1 <> nil then begin
     if sUserItemName = sItemName then begin
       if UserEngine.AccAllowUpgradeItem(UserItem1) then begin    //厘脚备函券

         if PlayObject.IsEnoughBag then begin
           New(UserItem);
           if UserEngine.CopyToUserItemFromName(sItemName2,UserItem) then begin
             StdItem:=UserEngine.GetStdItem(UserItem.wIndex);

             StdItem.ChangeItemUpgrade (UserItem, UserItem1, 2);

             if PlayObject.m_btRaceServer = RC_PLAYOBJECT then begin
                PlayObject.SendDelItems(UserItem1);
             end;
              DisPose(UserItem1);
              PlayObject.m_ItemList.Delete(I);

             if PlayObject.AddItemToBag(UserItem,boot) then begin
              if boot then
              PlayObject.SendAddItem(UserItem,1);
             end;

             PlayObject.SysMsg('普通物品' + sItemName + ' 成功转化为羽化登仙物品 ' + sItemName2 + '。',c_Red,t_Hint);
             exit;
           end;

         end else begin
           PlayObject.SysMsg('你的背包已经满了。',c_Red,t_Hint);
           exit;
         end;

       end;
     end;

    end;
   end;
  end;

end;


procedure TNormNpc.ActionOfRockPapers(PlayObject: TPlayObject;     //啊困官困焊
  QuestActionInfo: pTQuestActionInfo);
var
  sRate, sGold:String;
begin
  sRate := QuestActionInfo.sParam1;
  sGold := QuestActionInfo.sParam2;
  if (sRate = '') or (sGold = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_ROCKPAPERS);
    Exit;
  end;
  if (sRate = '') or (sGold = '') then Exit;

  if PlayObject.m_nGold >= StrToInt(sGold) then begin
    PlayObject.DecGold(StrToInt(sGold));
    PlayObject.GoldChanged();
    if g_boGameLogGold then
        AddGameDataLog('49' +  #9 +
          PlayObject.m_sMapName + #9 +
          IntToStr(PlayObject.m_nCurrX) + #9 +
          IntToStr(PlayObject.m_nCurrY) + #9 +
          PlayObject.m_sCharName + #9 +
          sSTRING_GOLDNAME + #9 +
          IntToStr(PlayObject.m_nGold) + #9 +
          '1' + #9 +
          GetGoldStr(StrToInt(sGold)) + #9 + '[石头剪刀布/划拳]');
    PlayObject.SendMsg(Self, RM_ROCKPAPERS, 0, 0, 0, StrToInt(sRate), sGold);
  end else begin
    PlayObject.SysMsg('金币不足。', c_Red, t_Hint);
    PlayObject.SendMsg(Self, RM_ROCKPAPERS, 0, 0, 0, 0, '');
  end;
end;

procedure TNormNpc.ActionOfDeleteHero(PlayObject: TPlayObject; QuestActionInfo: pTQuestActionInfo);
begin
  if PlayObject.m_boWaitHeroDate then begin
    Exit;
  end;

  if (PlayObject.m_sHeroCharName <> '') then begin
    FrontEngine.AddToLoadHeroRcdList(PlayObject, Self, l_Delete);   //唱畴力茄
    PlayObject.m_btHeroAutoDurg := 0;
  end else begin
    GotoLable(PlayObject, '@NotHaveHero', False);
  end;
end;

procedure TNormNpc.ActionOfGroupRecall(PlayObject: TPlayObject;
  QuestActionInfo: pTQuestActionInfo);
var
 i : integer;
 PlayObjectEx: TPlayObject;
begin
    for i:=0 to PlayObject.m_GroupMembers.Count-1 do begin
      PlayObjectEx:=TPlayObject(PlayObject.m_GroupMembers.Objects[i]);
      if PlayObjectEx <> nil then begin
          PlayObjectEx.m_boTimeRecall:=False;
          PlayObjectEx.m_boTimeRecallGroup:=True;
          PlayObjectEx.m_sMoveMap:=PlayObjectEx.m_sMapName;
          PlayObjectEx.m_nMoveX:=PlayObjectEx.m_nCurrX;
          PlayObjectEx.m_nMoveY:=PlayObjectEx.m_nCurrY;
          PlayObjectEx.m_dwTimeRecallTick:=GetTickCount + LongWord(QuestActionInfo.nParam1 * 60 * 1000);     //府妮
          PlayObjectEx.SendMsg(Self,RM_COOLTIME,0,0,0, (QuestActionInfo.nParam1 * 60) , PlayObjectEx.m_sMoveMap); //府妮 滚橇
      end;
    end;
end;

procedure TNormNpc.ActionOfGroupMoveMap(PlayObject: TPlayObject;    //弊缝盔 捞悼 疙飞绢
  QuestActionInfo: pTQuestActionInfo);
var
  I:integer;
  PlayObjectEx:TPlayObject;
  Envir:TEnvirnoment;
  boFlag:Boolean;
begin
  boFlag := False;
  if PlayObject.m_GroupOwner <> nil then begin
    Envir:=g_MapManager.FindMap(QuestActionInfo.sParam1);
    if Envir <> nil then begin
   //   if Envir.CanWalk(QuestActionInfo.nParam2,QuestActionInfo.nParam3,True) then begin   //框流老 荐 乐绰 甘牢啊?
        for I := 0 to PlayObject.m_GroupMembers.Count - 1 do begin
          PlayObjectEx:=TPlayObject(PlayObject.m_GroupMembers.Objects[i]);
          if PlayObjectEx <> nil then begin
           if PlayObjectEx.m_sMapName = m_sMapName then begin
            if (QuestActionInfo.sParam2 = '') and (QuestActionInfo.sParam3 = '') then begin  // x y 谅钎 绝澜 罚待 公宏
             PlayObjectEx.RandomSpaceMove(QuestActionInfo.sParam1, 0);
            end else begin
             PlayObjectEx.SpaceMove(QuestActionInfo.sParam1,QuestActionInfo.nParam2,QuestActionInfo.nParam3,0);
            end;
           end;
          end;
        end;
        boFlag := True;
     // end;
    end;
  end;

  if not boFlag then
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_GROUPMOVEMAP);
end;

procedure TNormNpc.ActionOfAddGuild(PlayObject: TPlayObject;     //檬焊巩颇
  QuestActionInfo: pTQuestActionInfo);
var
  sGuildName     :String;
begin
  sGuildName     := QuestActionInfo.sParam1;
  if (sGuildName = '') then begin
    ScriptActionError(PlayObject,'',QuestActionInfo,sSC_ADDBEGINNER);
    exit;
  end;
  if PlayObject <> nil then begin
     PlayObject.m_MyGuild:=g_GuildManager.FindGuild(sGuildName);
     if PlayObject.m_MyGuild <> nil then begin
       TGuild(PlayObject.m_MyGuild).AddMember(PlayObject);
       PlayObject.m_sGuildRankName:=TGuild(PlayObject.m_MyGuild).GetRankName(PlayObject,PlayObject.m_nGuildRankNo);
       PlayObject.RefShowName();
       PlayObject.SysMsg(TGuild(PlayObject.m_MyGuild).sGuildName +' 加入了行会。' + ' 职位: ' + PlayObject.m_sGuildRankName ,c_Green,t_Hint);
    end;
  end;
end;

procedure TNormNpc.Initialize;
begin
  inherited;
  m_Castle:=g_CastleManager.InCastleArea(Self);
end;

function TNormNpc.ConditionOfCheckNameDateList(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  I: Integer;
  LoadList:TStringList;
  sListFileName,sLineText,sHumName,sDate:String;
  boDeleteExprie,boNoCompareHumanName:Boolean;
  dOldDate:TDateTime;
  cMethod:Char;
  nValNo,nValNoDay,nDayCount,nDay:Integer;
begin
  Result:=False;
  nDayCount:=Str_ToInt(QuestConditionInfo.sParam3, -1);
  nValNo:=GetValNameNo(QuestConditionInfo.sParam4);
  nValNoDay:=GetValNameNo(QuestConditionInfo.sParam5);
  boDeleteExprie:=CompareText(QuestConditionInfo.sParam6,'清理') = 0;
  boNoCompareHumanName:=CompareText(QuestConditionInfo.sParam6,'1') = 0;
  cMethod:=QuestConditionInfo.sParam2[1];
  if nDayCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKNAMEDATELIST);
    exit;
  end;
  sListFileName:=g_Config.sEnvirDir + m_sPath + QuestConditionInfo.sParam1;
  if FileExists(sListFileName) then begin
    LoadList:=TStringList.Create;
    try
      LoadList.LoadFromFile(sListFileName);
    except
      MainOutMessage('loading fail.... => ' + sListFileName);
    end;
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=Trim(LoadList.Strings[I]);
      sLineText:=GetValidStr3(sLineText,sHumName,[' ',#9]);
      sLineText:=GetValidStr3(sLineText,sDate,[' ',#9]);
      if (CompareText(sHumName,PlayObject.m_sCharName) = 0) or boNoCompareHumanName then begin
        nDay:= High(Integer);
        if TryStrToDateTime(sDate,dOldDate) then
          nDay:=GetDayCount(Now,dOldDate);
        case cMethod of
          '=': if nDay = nDayCount then Result:=True;
          '>': if nDay > nDayCount then Result:=True;
          '<': if nDay < nDayCount then Result:=True;
          else if nDay >= nDayCount then Result:=True;
        end;
        if nValNo >= 0 then begin
          case nValNo of
            0..9: begin
              PlayObject.m_nVal[nValNo]:=nDay;
            end;
            100..119: begin
              g_Config.GlobalVal[nValNo - 100]:=nDay;
            end;
            200..209: begin
              PlayObject.m_DyVal[nValNo - 200]:=nDay;
            end;
            300..399: begin
              PlayObject.m_nMval[nValNo - 300]:=nDay;
            end;
            400..499: begin
              g_Config.GlobaDyMval[nValNo - 400]:=nDay;
            end;
          end;
        end;

        if nValNoDay >= 0 then begin
          case nValNoDay of
            0..9: begin
              PlayObject.m_nVal[nValNoDay]:=nDayCount - nDay;
            end;
            100..119: begin
              g_Config.GlobalVal[nValNoDay - 100]:=nDayCount - nDay;
            end;
            200..209: begin
              PlayObject.m_DyVal[nValNoDay - 200]:=nDayCount - nDay;
            end;
            300..399: begin
              PlayObject.m_nMval[nValNoDay - 300]:=nDayCount - nDay;
            end;
          end;
        end;
        if not Result then begin
          if boDeleteExprie then begin
            LoadList.Delete(I);
            try
              LoadList.SaveToFile(sListFileName);
            except
              MainOutMessage('Save fail.... => ' + sListFileName);
            end;
          end;
        end;
        break;
      end;
    end;
    LoadList.Free;
  end else begin
    MainOutMessage('文件未找到 => ' + sListFileName);
  end;
end;
//CHECKMAPHUMANCOUNT MAP = COUNT
function TNormNpc.ConditionOfCheckMapHumanCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nCount,nHumanCount:Integer;
  cMethod:Char;
begin
  Result:=False;
  nCount:=Str_ToInt(QuestConditionInfo.sParam3, -1);
  if nCount < 0 then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKMAPHUMANCOUNT);
    exit;
  end;
  nHumanCount:=UserEngine.GetMapHuman(QuestConditionInfo.sParam1);

  cMethod:=QuestConditionInfo.sParam2[1];
  case cMethod of
    '=': if nHumanCount = nCount then Result:=True;
    '>': if nHumanCount > nCount then Result:=True;
    '<': if nHumanCount < nCount then Result:=True;
    else if nHumanCount >= nCount then Result:=True;
  end;
end;


function TNormNpc.ConditionOfCheckMapMonCount(PlayObject: TPlayObject;
  QuestConditionInfo: pTQuestConditionInfo): Boolean;
var
  nCount,nMonCount:Integer;
  cMethod:Char;
  Envir: TEnvirnoment;
begin
  Result:=False;
  nCount:=Str_ToInt(QuestConditionInfo.sParam3, -1);
  Envir:=g_MapManager.FindMap(QuestConditionInfo.sParam1);
  if (nCount < 0) or (Envir = nil) then begin
    ScriptConditionError(PlayObject,QuestConditionInfo,sSC_CHECKMAPMONCOUNT);
    exit;
  end;

  nMonCount:=UserEngine.GetMapMonster(Envir,nil);

  cMethod:=QuestConditionInfo.sParam2[1];
  case cMethod of
    '=': if nMonCount = nCount then Result:=True;
    '>': if nMonCount > nCount then Result:=True;
    '<': if nMonCount < nCount then Result:=True;
    else if nMonCount >= nCount then Result:=True;
  end;
end;


function TNormNpc.GetDynamicVarList(PlayObject: TPlayObject;
  sType: String;var sName:String): TList;
begin
  Result:=nil;
  if CompareLStr(sType,'HUMAN',length('HUMAN')) then begin
    Result:=PlayObject.m_DynamicVarList;
    sName:=PlayObject.m_sCharName;
  end else
  if CompareLStr(sType,'GUILD',length('GUILD')) then begin
    if PlayObject.m_MyGuild = nil then exit;
    Result:=TGuild(PlayObject.m_MyGuild).m_DynamicVarList;
    sName:=TGuild(PlayObject.m_MyGuild).sGuildName;
  end else
  if CompareLStr(sType,'GLOBAL',length('GLOBAL')) then begin
    Result:=g_DynamicVarList;
    sName:='GLOBAL';
  end;
end;

procedure TNormNpc.ActionOfSaveSlaves(PlayObject: TPlayObject;  QuestActionInfo: pTQuestActionInfo);
var
  I: Integer;
  BaseObject :TBaseObject;
  templist,SaveList:TStringList;
  sfilename,sfilename2:string;
begin
  if playobject.m_slavelist.Count > 0  then begin
    sFileName:=g_Config.sEnvirDir + 'PetData\' + PlayObject.m_sCharName + '.txt';
    sFileName2:=g_Config.sEnvirDir + 'PetData\';
    if FileExists(sFileName) then begin
      templist:=TStringList.Create;
      SaveList:=TStringList.Create;
      SaveList.SaveToFile(sfilename);
      SaveList.Free;
    end else begin
      SaveList:=TStringList.Create;
      SaveList.SaveToFile(sfilename);
      SaveList.Free;
    end;
    SaveList:=TStringList.Create;
    for I := 0 to playobject.m_SlaveList.Count - 1 do begin
      BaseObject:=TBaseObject(PlayObject.m_SlaveList.Items[i]);
      SaveList.Add(baseobject.m_sCharName + '/' + inttostr(baseobject.m_btSlaveMakeLevel) + '/' + inttostr(baseobject.m_btSlaveExpLevel));
      baseobject.m_WAbil.HP:=0;
    end;
      SaveList.SaveToFile(sfilename);
      SaveList.Free;
  end;
end;



{ TGuildOfficial }

procedure TGuildOfficial.Click(PlayObject: TPlayObject);//004A30F4
begin
//  GotoLable(PlayObject,'@main');
  inherited;
end;

procedure TGuildOfficial.GetVariableText(PlayObject: TPlayObject;
  var sMsg: String; sVariable: String);
var
  I,II: Integer;
  sText:String;
  List:TStringList;
  sStr:String;
begin
  inherited;
  if sVariable = '$REQUESTCASTLELIST' then begin
    sText:='';
    List:=TStringList.Create;
    g_CastleManager.GetCastleNameList(List);
    for I := 0 to List.Count - 1 do begin
      II:=I + 1;
      if ((II div 2) * 2 = II) then sStr:='\'
      else sStr:='';

      sText:=sText + format('<%s/@requestcastlewarnow%d> %s',[List.Strings[I],I,sStr]);
    end;
    sText:=sText + '\ \';
    List.Free;
    sMsg:=sub_49ADB8(sMsg,'<$REQUESTCASTLELIST>',sText);
  end;
end;

procedure TGuildOfficial.Run; //004A37F0
begin
  if Random(40) = 0 then begin
    TurnTo(Random(8));
  end else begin
    if Random(30) = 0 then
      SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  end;
  inherited;
end;

procedure TGuildOfficial.UserSelect(PlayObject: TPlayObject; sData: String);
var
  sMsg,sLabel:String;
  boCanJmp:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TGuildOfficial::UserSelect... ';
begin
  inherited;
  try
    PlayObject.m_nScriptGotoCount:=0;
    if (sData <> '') and (sData[1] = '@') then begin
      sMsg:=GetValidStr3(sData,sLabel,[#13]);

      boCanJmp:= PlayObject.LableIsCanJmp(sLabel);

      GotoLable(PlayObject,sLabel,not boCanJmp);

      //GotoLable(PlayObject,sLabel,not PlayObject.LableIsCanJmp(sLabel));
      if not boCanJmp then exit;
      if CompareText(sLabel,sBUILDGUILDNOW) = 0 then begin
        ReQuestBuildGuild(PlayObject,sMsg);
      end else
      if CompareText(sLabel,sSCL_GUILDWAR) = 0 then begin
        ReQuestGuildWar(PlayObject,sMsg);
      end else
      if CompareText(sLabel,sDONATE) = 0 then begin
        DoNate(PlayObject);
      end else
      if CompareText(sLabel,sEXIT) = 0 then begin
        PlayObject.SendMsg(Self,RM_MERCHANTDLGCLOSE,0,Integer(Self),0,0,'');
      end else
      if CompareText(sLabel,sBACK) = 0 then begin
        if PlayObject.m_sScriptGoBackLable = '' then PlayObject.m_sScriptGoBackLable:=sMAIN;
        GotoLable(PlayObject,PlayObject.m_sScriptGoBackLable,False);
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
//  inherited;
end;
function TGuildOfficial.ReQuestBuildGuild(PlayObject: TPlayObject; sGuildName: String):Integer; //004A3124
var
  UserItem:pTUserItem;
begin
  Result:=0;
  sGuildName:=Trim(sGuildName);
  UserItem:=nil;
  if (sGuildName = '') or (length(sGuildName) > GuildNameLen) then begin
    Result:= -4;
  end;
  if PlayObject.m_MyGuild = nil then begin
    if PlayObject.m_nGold >= g_Config.nBuildGuildPrice then begin
      UserItem:=PlayObject.CheckItems(g_Config.sWoomaHorn);
      if UserItem = nil then begin
        Result:= -3; //'你没有准备好需要的全部物品。'
      end;
    end else Result:= -2; //'缺少创建费用。'
  end else Result:= -1;  //'您已经加入其它行会。'
  if Result = 0 then begin
    if g_GuildManager.AddGuild(sGuildName,PlayObject.m_sCharName) then begin
      UserEngine.SendServerGroupMsg(SS_205,nServerIndex,sGuildName + '/' + PlayObject.m_sCharName);
      PlayObject.SendDelItems(UserItem);
      PlayObject.DelBagItem(UserItem.MakeIndex,g_Config.sWoomaHorn);
      PlayObject.DecGold(g_Config.nBuildGuildPrice);
      PlayObject.GoldChanged();
      PlayObject.m_MyGuild:=g_GuildManager.MemberOfGuild(PlayObject.m_sCharName);
      if PlayObject.m_MyGuild <> nil then begin
        PlayObject.m_sGuildRankName:=TGuild(PlayObject.m_MyGuild).GetRankName(PlayObject,PlayObject.m_nGuildRankNo);
        PlayObject.RefShowName();
      end;
    end else Result:= -4;
  end;
  if Result >= 0 then begin
    PlayObject.SendMsg(Self,RM_BUILDGUILD_OK,0,0,0,0,'');
  end else begin
    PlayObject.SendMsg(Self,RM_BUILDGUILD_FAIL,0,Result,0,0,'');
  end;
end;
function TGuildOfficial.ReQuestGuildWar(PlayObject: TPlayObject; sGuildName: String):Integer; //004A3368
begin
  PlayObject.ReQuestGuildWar(sGuildName);
  Result:=1;
end;
procedure TGuildOfficial.DoNate(PlayObject: TPlayObject); //004A346C
begin
  PlayObject.SendMsg(Self,RM_DONATE_OK,0,0,0,0,'');
end;

procedure TCastleOfficial.RepairDoor(PlayObject: TPlayObject); //004A3FB8
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误: 没有找到城堡信息。',c_Red,t_Hint);
    exit;
  end;
  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nRepairDoorPrice then begin
    if TUserCastle(m_Castle).RepairDoor then begin
      Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nRepairDoorPrice);
      PlayObject.SysMsg('已经修复成功。',c_Green,t_Hint);
    end else begin
      PlayObject.SysMsg('你现在不能修复..',c_Green,t_Hint);
    end;
  end else begin
    PlayObject.SysMsg('城堡里的资金不足。',c_Red,t_Hint);
  end;
end;

procedure TCastleOfficial.RepairFirstDoor(PlayObject: TPlayObject); //004A3FB8
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误: 没有找到城堡信息。',c_Red,t_Hint);
    exit;
  end;
  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nRepairDoorPrice then begin
    if TUserCastle(m_Castle).RepairFirstDoor then begin
      Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nRepairDoorPrice);
      PlayObject.SysMsg('已经修复成功。',c_Green,t_Hint);
    end else begin
      PlayObject.SysMsg('你现在不能修复..',c_Green,t_Hint);
    end;
  end else begin
    PlayObject.SysMsg('城堡里的资金不足。',c_Red,t_Hint);
  end;
end;

procedure TCastleOfficial.RepairSecondDoor(PlayObject: TPlayObject); //004A3FB8
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误: 没有找到城堡信息。',c_Red,t_Hint);
    exit;
  end;
  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nRepairDoorPrice then begin
    if TUserCastle(m_Castle).RepairSecondDoor then begin
      Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nRepairDoorPrice);
      PlayObject.SysMsg('已经修复成功。',c_Green,t_Hint);
    end else begin
      PlayObject.SysMsg('你现在不能修复..',c_Green,t_Hint);
    end;
  end else begin
    PlayObject.SysMsg('城堡里的资金不足。',c_Red,t_Hint);
  end;
end;

procedure TCastleOfficial.RepairWallNow(nWallIndex: Integer;
  PlayObject: TPlayObject); //004A4074
begin
  if m_Castle = nil then begin
    PlayObject.SysMsg('NPC 错误: 没有找到城堡信息。',c_Red,t_Hint);
    exit;
  end;

  if TUserCastle(m_Castle).m_nTotalGold >= g_Config.nRepairWallPrice then begin
    if nWallIndex in [1, 2] then begin
      if TUserCastle(m_Castle).RepairSabukWall(nWallIndex) then begin
        Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nRepairWallPrice);
        PlayObject.SysMsg('已经修复成功..',c_Green,t_Hint);
      end else begin
        PlayObject.SysMsg('你现在不能修复..',c_Green,t_Hint);
      end;
    end else begin
      if TUserCastle(m_Castle).RepairNammanWall(nWallIndex) then begin
        Dec(TUserCastle(m_Castle).m_nTotalGold,g_Config.nRepairWallPrice);
        PlayObject.SysMsg('已经修复成功..',c_Green,t_Hint);
      end else begin
        PlayObject.SysMsg('你现在不能修复..',c_Green,t_Hint);
      end;
    end;
  end else begin
    PlayObject.SysMsg('城堡里的资金不足。',c_Red,t_Hint);
  end;
end;

constructor TCastleOfficial.Create;
begin
  inherited Create;

end;

destructor TCastleOfficial.Destroy;
begin

  inherited;
end;

constructor TGuildOfficial.Create;
begin
  inherited;
  m_btRaceImg:=RCC_MERCHANT;
  m_wAppr:=8;
end;

destructor TGuildOfficial.Destroy;
begin

  inherited;
end;

procedure TGuildOfficial.SendCustemMsg(PlayObject: TPlayObject;
  sMsg: String);
begin
  inherited;

end;

procedure TGuildOfficial.SendCustemMsg2(PlayObject: TPlayObject;
  sMsg: String);
begin
  inherited;

end;

procedure TCastleOfficial.SendCustemMsg(PlayObject: TPlayObject;
  sMsg: String);
begin
  if not g_Config.boSubkMasterSendMsg then begin
    PlayObject.SysMsg(g_sSubkMasterMsgCanNotUseNowMsg,c_Red,t_Hint);
    exit;
  end;
  if PlayObject.m_boSendMsgFlag then begin
    PlayObject.m_boSendMsgFlag:=False;
    UserEngine.SendBroadCastMsg(PlayObject.m_sCharName + ': ' +  sMsg,t_Castle);
  end else begin

  end;
end;

procedure TCastleOfficial.SendCustemMsg2(PlayObject: TPlayObject;
  sMsg: String);
begin
  if not g_Config.boSubkMasterSendMsg then begin
    PlayObject.SysMsg(g_sSubkMasterMsgCanNotUseNowMsg,c_Red,t_Hint);
    exit;
  end;
  if PlayObject.m_boSendMsgFlag then begin
    PlayObject.m_boSendMsgFlag:=False;
    UserEngine.SendBroadCastMsg(PlayObject.m_sCharName + ': ' +  sMsg,t_Castle);
  end else begin

  end;
end;


{---- Adjust global SVN revision ----}
initialization
  ////SVNRevision('$Id: ObjNpc.pas 531 2006-12-19 13:13:36Z damian $');
end.
