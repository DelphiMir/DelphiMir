unit ObjHero;

interface

uses
  Windows, Classes, SysUtils, Forms, StrUtils, Math, Grobal2, ItmUnit, Envir, Common,
  DateUtils, ObjBase, SDK;

type
  THeroObject = class(TAnimalObject)
    m_sUserID: string[20]; //0x58C    登录帐号名
    m_DefMsg                  :TDefaultMessage;  //0x550
    m_dwThinkTick: LongWord;
    m_boDupMode: Boolean;         //人物重叠了
    m_nTargetX: Integer;          //目标坐标X
    m_nTargetY: Integer;          //目标坐标Y
    m_boRunAwayMode: Boolean;     //运行远离模式
    m_dwRunAwayStart: LongWord;   //
    m_dwRunAwayTime: LongWord;    //

    m_wHitMode: Word;             //攻击方式

    m_dwRunIntervalTime: LongWord;       //顿绰 加档?
    m_dwWalkIntervalTime: LongWord;      //走间隔时间
    m_dwTurnIntervalTime: LongWord;      //转动间隔时间

    m_SkillUseTick: array[0..200 - 1] of LongWord; //魔法使用间隔

    m_nItemBagCount: Integer;         //包裹容量

    m_btStatus: Byte;                 //傍拜规侥 0-傍拜屈 1-馆拜屈 2-措扁  4-荤侩磊沥狼 5-绒侥
    m_boProtectStatus: Boolean;       //碍力捞悼老锭
    m_boTarget: Boolean;              //碍力傍拜 疙飞
    m_boSpellTarget: Boolean;
    m_nProtectTargetX, m_nProtectTargetY: Integer; //守护坐标
    m_dwAutoAvoidTick: LongWord;      //自动躲避间隔
    m_btReLevel: Byte;               //转生等级

    m_dwMagicAttackInterval: LongWord;//魔法攻击间隔时间(Dword)
    m_dwMagicAttackTick: LongWord;    //魔法攻击时间(Dword)
    m_dwMagicAttackCount: LongWord;   //魔法攻击计数(Dword)
    m_nSelectMagic: Integer;          //查询魔法
    m_boIsUseMagic: Boolean;          //是否可以使用的魔法(True才可能躲避)

    m_btLastDirection: Byte;          //最后的方向

    m_nSessionID: Integer; //0x5C0
    m_dwSaveRcdTick: LongWord;
    m_dLogonTime: TDateTime;    //包府磊矫胶袍
    m_dwLogonTick: LongWord;    //包府磊矫胶袍

    m_sMasterName: string[14];
    m_nKillMonExpMultiple: Integer;
    m_nKillMonExpRate: Integer;
    m_nKillMonExpRate2: Integer;
    m_nKillMonExpRate9: Integer;
    m_dwKillMonExpRateTime: LongWord;
    m_dwKillMonExpRateTime2: LongWord;
    m_nPowerRate: Integer;
    m_nPowerRate3: Integer;
    m_nPowerRate5: Integer;
    m_dwPowerRateTime: LongWord;
    m_dwPowerRateTime3: LongWord;
    m_dwRateTick: LongWord;

    m_QuestFlag: TQuestFlag; //0x128 129

    m_boRcdSaved: Boolean;
    m_boHeroLogOut: Boolean;
    m_boHeroLogOnOK: Boolean;
    m_dwHeroLogOnTick: LongWord;
    m_nHeroLogOnCount: Integer;
    m_dwQueryItemBagTick: LongWord;
    m_boSelSelf: Boolean;
    m_nIncSelfHealthCount: Integer;
    m_nIncMasterHealthCount: Integer;
    m_BujukUseTick: LongWord;
    m_PosionUseTick: LongWord;

    m_dwQueryBagItemsTick        :LongWord; //啊规沥府
    procedure Herowalk();

  private
    function  AutoAvoid(): Boolean; //自动躲避
    function  CheckTargetXYCount(nX, nY, nRange: Integer): Integer;
    function  CheckTargetXYCount1(nX, nY, nRange: Integer): Integer;//战士判断目标使用 20080924
    function  CheckTargetXYCount2(): Integer;//半月弯刀判断目标函数 20081207
    function  CheckMasterXYOfDirection(TargeTBaseObject: TBaseObject;nX, nY, nDir, nRange: Integer): Integer;{检测指定方向和范围内,主人与英雄的距离}
    function  CheckTargetXYCountOfDirection(nX, nY, nDir, nRange: Integer): Integer;

    function  GetRangeTargetCount(nX, nY, nRange: Integer): Integer;
    function  GetRangeTargetCountByDir(nDir, nX, nY, nRange: Integer): Integer;
    function  CanLineAttack(nStep: Integer): Boolean; overload;

    function  CheckUserMagic(wMagIdx: Word): pTUserMagic;//检查使用魔法

    Function  CheckHeroAmulet(nType: Integer; nCount: Integer):Boolean;
    function  CheckHeroAmulet2(nCount: Integer; nType, num, mode:Integer; var Idx: Integer): Boolean;

    function  EatUseItems(nShape: Integer): Boolean;

    function  GetSpellPoint(UserMagic:pTUserMagic):Integer;
    function  AllowUseMagic(wMagIdx: Word): Boolean; virtual;
    function  UseMagicDelay(wMagIdx: Word):Integer;
    function  OrderAllowUseMagic(wMagIdx: Word): Integer;

    function  GetNearTargetCount(rage:Integer): Integer; overload;
    function  GetRangeFriendCount(nX, nY, nRange: Integer): Integer;
    function  FindVisibleActors(ActorObject: TBaseObject): Boolean;

    function UseSpell(UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; TargeTActorObject: TBaseObject; mode: byte): Boolean;

    function  StartAttack(wMagIdx: Word): Boolean; virtual;
    function  WarrAttackTarget(wMagIdx, wHitMode: Word): Boolean; virtual;    //康旷傍拜
    function  WarrorAttackTarget(wMagIdx: Word): Boolean; virtual;    //康旷傈荤
    function  WizardAttackTarget(wMagIdx: Word): Boolean; virtual;    //康旷贱荤
    function  TaoistAttackTarget(wMagIdx: Word): Boolean; virtual;    //康旷档荤
    function  AssassinAttackTarget(wMagIdx: Word): Boolean; virtual;  //康旷磊按

    function  IsSearchTarget: Boolean;

    function  IsNeedAvoid(): Boolean;   //是否需要躲避
    procedure RepairAllItem();
    function  SelectMagic(): Integer;
    procedure SearchViewRange;
    function  Think(): Boolean;
    function  IsHeroProperTarget(baseObject:TBaseObject):boolean;
    function  UseStdmodeFunItem(StdItem: pTStdItem): Boolean;

    procedure ClientQueryBagItems(int:byte);
    procedure ClientQueryAutoItems();
    procedure ItemTimeRun;                       //咯包
    procedure ClientQueryStorageItems(Idx:Integer);
    function AutoSpell(UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; BaseObject: TBaseObject): Boolean;
  public
    m_boNewHero: Boolean;
    constructor Create();// override;
    destructor Destroy; override;
    procedure Die; override;
    function Operate(ProcessMsg: pTProcessMessage): Boolean; override;
    function  AbilityUp(UserMagic: pTUserMagic): Boolean;
    function  AttackTarget(): Boolean;
    function EatItems(StdItem: TItem; UserItem:pTUserItem): Boolean;
    procedure GetExp(dwExp: LongWord); override;
    procedure WinExp(dwExp: LongWord); override;
    procedure GainExp(dwExp: LongWord); override;

    procedure HasLevelUp(nLevel: Integer); override;
    procedure HasLevelDown(nLevel: Integer);

    procedure RestHero();
    function  GetShowName(): string; override;
    function  GetGotoXY(BaseObject: TBaseObject; nCode:Byte): Boolean;
    function  GotoTargetXY(nTargetX, nTargetY, nCode: Integer): Boolean;
    procedure ClearCopyItem(wIndex, MakeIndex: Integer);
    procedure DelTargetCreat; override;

    function  DoSpell(UserMagic: pTUserMagic; nTargetX, nTargetY: Integer;
                       TargeTBaseObject: TBaseObject): Boolean;


    procedure SetPKFlag(BaseObject: TBaseObject); override;
    procedure SetLastHiter(BaseObject: TBaseObject); override;


    procedure Initialize; override;
    function  IsNeedGotoXY(): Boolean; //鸥南俊霸 蝶扼啊绰?
    function  WeaptonMakeLuck: Boolean;
    procedure MakeWeaponUnlock;
    function  RepairWeapon: Boolean;
    function  SuperRepairWeapon: Boolean;

    procedure RecalcLevelAbilitys(); override;
    procedure RecalcAbilitys; override;

    function  MagicAttackTarget(BaseObject: TBaseObject; tx, ty, wMagIdx: Word): Boolean; virtual;
    procedure LogOn();
    procedure LogOut();
    procedure RefBagItemCount;

    procedure RecalcHeroAddAbilitys;

    function  LevelUpFunc: Boolean;
    procedure WeightChanged;
    function  ReadBook(StdItem: TItem): Boolean;
    function  FindMagic(wMagIdx: Word): pTUserMagic; overload;
    procedure Run;
    function  RunToTargetXY(nTargetX, nTargetY: Integer): Boolean;
    procedure SysMsg(sMsg: string; MsgColor: TMsgColor; MsgType: TMsgType);
    procedure SendSocket(DefMsg: pTDefaultMessage; sMsg: string);
    procedure SendDefMessage(wIdent: Word; nRecog: Integer; nParam, nTag, nSeries: Word; sMsg: string);
    procedure SendUseitems();

    procedure SendUseMagic();
    function  GetUseMagicCount(): integer;
    function  GetUseMagicStatus(mode:integer): integer;
    function  GetCheckUseItem: Boolean;
    procedure SendDelMagic(UserMagic: pTUserMagic); {}
    procedure SendAddMagic(UserMagic: pTUserMagic);
    procedure SendAddItem(UserItem: pTUserItem);
    procedure SendAddItemMode(UserItem:pTUserItem;idx:integer);
    procedure SendAddStorage(UserItem:pTUserItem );
    procedure SendAddStorageMode(UserItem:pTUserItem;idx:integer);

    procedure SendAddAutoItemMode(UserItem:pTUserItem);
    procedure SendDelItemList(ItemList: TStringList);
    procedure SendDelItems(UserItem: pTUserItem);
    procedure SendDelAutoItems(UserItem: pTUserItem);
    procedure SendUpdateItem(UserItem: pTUserItem);

    procedure SearchTarget;

    procedure Struck(hiter: TBaseObject);
    function  WalkToTargetXY(nTargetX, nTargetY: Integer): Boolean;
    function  WalkToTargetXY2(nTargetX, nTargetY: Integer): Boolean;

    procedure MakeSaveRcd(var HumanRcd: THumData);
    procedure MakeGhost; override;

    procedure ClientaddBundleItems(mode,MaxAmount:integer;ItemIdx:String); //拱距2
    procedure ClientSeparateItems(bMakeIndex,namount:integer);    //拱距2
    procedure ClientaddBundleStorageItems(mode,MaxAmount:integer;ItemIdx:String);

    procedure ClientTakeOnItems(btWhere: Byte; nItemIdx: Integer; sItemName: string);
    procedure ClientTakeOffItems(btWhere: Byte; nItemIdx: Integer; sItemName: string);
    procedure ClientUseItems(nItemIdx: Integer; sItemName: string);
    procedure ClientAutoUseItems(nItemIdx: Integer; sItemName: string);
    procedure ClientChangeMagicKey(nSkillIdx: Integer; nKey: Integer);
    function CheckTakeOnItems(nWhere: Integer; var StdItem: TStdItem): Boolean;
    function IsEnoughBag(): Boolean;
    function GetHeroObjectInfo : String;
    function AddItemToBag(UserItem: pTUserItem; var boot:Boolean): Boolean; override;
    function AddItemToBagCategories(UserItem: PTUserItem;var boot:Boolean): Boolean; //拱距2

    procedure ScatterBagItems(ItemOfCreat: TBaseObject); override;
    procedure DropUseItems(BaseObject: TBaseObject; DieFromMob : Boolean); override;

    procedure CmdUpgradeItem (seedname, jewelryname: string; seedindex, jewelryindex, ExecCount : integer);        //胶媚
    function CheckJewelryItem (iStdMode: integer) : Boolean;          //胶媚
    function CheckSeedItem (puSeed: PTUserItem ;psSeed, psJewelry: TItem) : Integer;       //胶媚
    function CalcUpgradeProbability(puSeedItem, puJewelryItem: PTUserItem; psSeedItem, psJewelryItem: TItem;
             iExecCount: Integer; var iRetSum: integer; var fRetProb: Double) : integer;
    function  GetTotalValueOfOption( pu: PTUserItem; pstd, psJewelry: TItem; var strResult, strEtc: string ) : integer;     //胶媚
    function  DoUpgradeItem( puSeed: PTUserItem; psSeed, psJewelry: TItem ): integer;   //胶媚
    function  QuestTakeCheckItem(CheckItem:pTUserItem):Boolean;
    function  QuestTakeCheckItem2(CheckItem:pTUserItem; wBreakdown: Word):Boolean;
    function  RepairItemNormaly( psSeed: TItem; puSeed: PTUserItem ): Boolean;   //焕噶摹, 官蠢龙
    function  RepairItemSuper( psSeed: TItem; puSeed: PTUserItem ): Boolean;     //厘脚备, 犁窜
    function SumOfOptions(puSeedItem: PTUserItem; psSeedItem: TItem) : integer;       //胶媚
    procedure SendDelItemWithFlag (UserItem: pTUserItem; wBreakdown: Word);   //胶媚
    function  GemItem(Gem:Integer;ItemIdx:Integer):integer;    //焊苛(备 矫胶袍)
    procedure GemItemFail(UserItem:pTUserItem;msg:String);      //焊苛(备 矫胶袍)
  end;
  //{$ENDREGION}

implementation

uses M2Share, Guild, HUtil32, EDcode, ObjNpc, IdSrvClient, Event,
  ObjMon, LocalDB, Castle, svMain, MD5Unit, UsrEngn, Magic;

{ THeroObject }

constructor THeroObject.Create;
begin
  inherited;
  m_btRaceServer := RC_HEROOBJECT;
  m_boDupMode := False;
  m_dwThinkTick := GetTickCount();
  m_nViewRange := 12;
  m_nRunTime := 250;
  m_dwSearchTick := GetTickCount();
  m_btNameColor := g_Config.btHeroNameColor;

  m_nTargetX := -1;
  dwTick3F4 := GetTickCount();
  m_boFixedHideMode := True;

  m_dwRunIntervalTime := GetTickCount(); //顿绰 加档?
  m_dwWalkIntervalTime := g_Config.dwWalkIntervalTime;
  m_dwTurnIntervalTime := g_Config.dwTurnIntervalTime;


  m_dwHitTick := GetTickCount - LongWord(Random(3000));
  m_dwWalkTick := GetTickCount - LongWord(Random(3000));
  m_nWalkSpeed := g_Config.dwHeroWalkTime; //顿绰 加档
  m_nWalkStep := 10;
  m_dwWalkWait := 0;
  m_dwSearchEnemyTick := GetTickCount();
  m_boRunAwayMode := False;
  m_dwRunAwayStart := GetTickCount();
  m_dwRunAwayTime := 0;

  m_dwAutoAvoidTick := GetTickCount();

  m_nNextHitTime := 300;//下次攻击时间

  m_nItemBagCount := 42;

  m_btStatus := 0;
  m_boProtectStatus := False; //碍力捞悼老锭

  m_boTarget := False; //碍力傍拜 疙飞
  m_boSpellTarget := False;
  m_nProtectTargetX := -1; //守护坐标
  m_nProtectTargetY := -1; //守护坐标


  m_btReLevel := 0;

  m_nKillMonExpMultiple := 1;
  m_dwRateTick := GetTickCount();
  m_nKillMonExpRate := 100;
  m_nKillMonExpRate2 := 100;
  m_nKillMonExpRate9 := 100;
  m_boIsUseMagic := False;//是否能躲避 20080714

  m_nSelectMagic := 0;

  m_btLastDirection := m_btDirection;

  FillChar(m_SkillUseTick, SizeOf(m_SkillUseTick), 0);
  m_SkillUseTick[0] := GetTickCount;

  m_boNewHero := False;

  m_dwQueryItemBagTick := GetTickCount() - 3000;
  m_dwSaveRcdTick := GetTickCount();
  m_boSelSelf := False;
  m_nIncSelfHealthCount := 0;
  m_nIncMasterHealthCount := 0;


  m_nPowerRate := 100;
  m_nPowerRate3 := 100;
  m_nPowerRate5 := 100;
  m_sMasterName := '';
  m_boHeroLogOut := False;
  m_boHeroLogOnOK := False;
  m_dwHeroLogOnTick := GetTickCount();
  m_nHeroLogOnCount := 0;
  m_BujukUseTick := GetTickCount;
  m_PosionUseTick := GetTickCount;
end;

destructor THeroObject.Destroy;
begin
  inherited;
end;


procedure THeroObject.SetPKFlag(BaseObject: TBaseObject);
begin
  inherited SetPKFlag(BaseObject);
end;

procedure THeroObject.SetLastHiter(BaseObject: TBaseObject);
begin
  if m_boTarget then begin
    if BaseObject = m_TargetCret then begin
      inherited SetLastHiter(BaseObject);
    end else begin
      m_LastHiterTick := GetTickCount();
      m_ExpHitterTick := GetTickCount();
    end;
  end else begin
    inherited SetLastHiter(BaseObject);
  end;
end;


function THeroObject.Operate(ProcessMsg: pTProcessMessage): Boolean;
  function MINXY(AObject, BObject: TBaseObject): TBaseObject;
  var
    nA, nB: Integer;
  begin
    nA := abs(m_nCurrX - AObject.m_nCurrX) + abs(m_nCurrY - AObject.m_nCurrY);
    nB := abs(m_nCurrX - BObject.m_nCurrX) + abs(m_nCurrY - BObject.m_nCurrY);
    if nA > nB then Result := BObject else Result := AObject;
  end;
var
 // Health: THealth;
  CharDesc: TCharDesc;
  nObjCount: Integer;
  s1C: string;
  MessageBodyWL: TMessageBodyWL;
  MessageBodyW: TMessageBodyW;
  ShortMessage: TShortMessage;
  dwDelayTime: LongWord;
  nMsgCount: Integer;

  nDamage: Integer;
  nTargetX: Integer;
  nTargetY: Integer;
  nPower: Integer;
  nRage, tmp2: Integer;
  TargeTActorObject, AttackBaseObject: TBaseObject;
  strupgrade: string;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::Operate ';
begin
  Result := True;
  if ProcessMsg = nil then begin
    Result := False;
    Exit;
  end;
  //try
  case ProcessMsg.wIdent of
    RM_DELAYMAGIC: begin
        nPower := ProcessMsg.wParam;
        nTargetX := LoWord(ProcessMsg.nParam1);
        nTargetY := HiWord(ProcessMsg.nParam1);
        nRage := LoWord(ProcessMsg.nParam2);

        TargeTActorObject := TBaseObject(ProcessMsg.nParam3);

        if (TargeTActorObject <> nil) and
          (TargeTActorObject.GetMagStruckDamage(Self, nPower) > 0) then begin

          if (TargeTActorObject.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) or ((TargeTActorObject.m_Master <> nil) and (TargeTActorObject.m_Master.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT])) then begin
            if (m_TargetCret <> nil) and ((m_TargetCret.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) or ((m_TargetCret.m_Master <> nil) and (m_TargetCret.m_Master.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]))) then begin
              if ((MINXY(m_TargetCret, TargeTActorObject) = TargeTActorObject) or (Random(6) = 0)) and (GetTickCount() - m_dwTargetFocusTick > 1000 * 3) then SetTargetCreat(TargeTActorObject);
            end else begin
              SetTargetCreat(TargeTActorObject);
            end;
          end else begin
            if (m_TargetCret = nil) and IsProperTarget(TargeTActorObject) then SetTargetCreat(TargeTActorObject)
            else begin
              if ((m_TargetCret <> nil) and (MINXY(m_TargetCret, TargeTActorObject) = TargeTActorObject)) or (Random(6) = 0) then begin
                if (m_btJob in [1,2]) or ((m_TargetCret <> nil) and (GetTickCount() - m_dwTargetFocusTick > 1000 * 3)) then
                  if IsProperTarget(TargeTActorObject) then SetTargetCreat(TargeTActorObject);
              end;
            end;
          end;

          if TargeTActorObject.m_btRaceServer >= RC_ANIMAL then
            nPower := Round(nPower / 1.2);
          if (abs(nTargetX - TargeTActorObject.m_nCurrX) <= nRage) and (abs(nTargetY - TargeTActorObject.m_nCurrY) <= nRage) then begin
            TargeTActorObject.SendMsg(Self, RM_MAGSTRUCK, 0, nPower, 0, 0, '');
          end;
        end;
      end;

    RM_HEROLOGON_OK: begin
        SendDefMessage(SM_HEROLOGON_OK, Integer(ProcessMsg.BaseObject), m_btAiMode, 0, 0, '');
      end;

    RM_MAKEGHOST: begin
        SendDefMessage(SM_HEROLOGOUT_OK, Integer(ProcessMsg.BaseObject), 0, 0, 0, '');
        MakeGhost;
      end;
    RM_CHARSTATUSCHANGED: begin //10139 004D9E44
        SendDefMessage(SM_CHARSTATUSCHANGED,
                         Integer(ProcessMsg.BaseObject),
                         LoWord(ProcessMsg.nParam1),
                         HiWord(ProcessMsg.nParam1),
                         ProcessMsg.wParam,
                          '');
      end;

    CM_HEROLOGON_OK: begin
        RefBagItemCount;
        ClientQueryBagItems(1);
        ClientQueryStorageItems(0);
        m_boHeroLogOnOK := True;
      end;

    CM_HEROTAKEONITEM: begin //1003
        ClientTakeOnItems(ProcessMsg.nParam2, ProcessMsg.nParam1, ProcessMsg.sMsg);
      end;

    CM_HEROTAKEOFFITEM: begin //1004
        ClientTakeOffItems(ProcessMsg.nParam2, ProcessMsg.nParam1, ProcessMsg.sMsg);
      end;

    CM_HEROEAT: begin //1006
        ClientUseItems(ProcessMsg.nParam1, ProcessMsg.sMsg);
      end;

    CM_HEROAUTOEAT: begin //1006
        ClientAutoUseItems(ProcessMsg.nParam1, ProcessMsg.sMsg);
      end;

    CM_HEROMAGICKEYCHANGE: begin
        ClientChangeMagicKey(ProcessMsg.nParam1, ProcessMsg.nParam2);
      end;

    CM_HEROBUNDLEITEM: begin //1003
      ClientaddBundleItems(ProcessMsg.nParam2,ProcessMsg.nParam1,ProcessMsg.sMsg);  //拱距2
    end;
    CM_HEROBUNDLESTORAGEITEM: begin //1003
      ClientaddBundleStorageItems(ProcessMsg.nParam2,ProcessMsg.nParam1,ProcessMsg.sMsg);
    end;

    CM_HEROSEPARITEM: begin   //拱距2
        ClientSeparateItems(ProcessMsg.nParam1,ProcessMsg.nParam2) //拱距2
    end;

    CM_HEROUPGRADEIT: begin    //CmdUpgradeItem
      strupgrade := GetValidStr3(ProcessMsg.sMsg , ProcessMsg.sMsg, ['/']);
      CmdUpgradeItem (ProcessMsg.sMsg, strupgrade, ProcessMsg.nParam1, MakeLong(ProcessMsg.nParam2, ProcessMsg.nParam3), 0);
    end;
    CM_GEMHEROITEM:begin             //焊苛(备 矫胶袍)
      tmp2:=MakeLong(ProcessMsg.nParam2,ProcessMsg.nParam3);
      GemItem(ProcessMsg.nParam1,tmp2);
    end;

    RM_SENDDELITEMLIST: begin //10148  004D9D48  //SM_DELITEMS
        SendDelItemList(TStringList(ProcessMsg.nParam1));
        TStringList(ProcessMsg.nParam1).Free;
      end;

     RM_STRUCK: begin
        if (m_Master <> nil) and (not m_Master.m_boGhost) and (not m_boHeroLogOut) and (not m_boGhost) then begin
          if (ProcessMsg.BaseObject = Self) and (TBaseObject(ProcessMsg.nParam3 {AttackBaseObject}) <> nil) then begin
            SetLastHiter(TBaseObject(ProcessMsg.nParam3 {AttackBaseObject}));
            Struck(TBaseObject(ProcessMsg.nParam3 {AttackBaseObject})); {0FFEC}
            BreakHolySeizeMode();
            if (m_Master <> nil) and
              (TBaseObject(ProcessMsg.nParam3) <> m_Master) and   //林牢捞 乐绰 各
              (TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_PLAYOBJECT) then begin      //林牢俊霸 沥寸规困

              m_Master.SetPKFlag(TBaseObject(ProcessMsg.nParam3));
            end;
            if g_Config.boMonSayMsg then MonsterSayMsg(TBaseObject(ProcessMsg.nParam3), s_UnderFire);
          end;
        end;
      end;

    RM_WINEXP: begin
        m_DefMsg := MakeDefaultMsg(SM_HEROWINEXP, m_Abil.Exp, LoWord(ProcessMsg.nParam1), HiWord(ProcessMsg.nParam1), 0);
        SendSocket(@m_DefMsg, '');
      end;

    RM_LEVELUP: begin
        nObjCount := Integer(ProcessMsg.BaseObject);

        m_DefMsg:=MakeDefaultMsg(SM_HEROLEVELUP,m_Abil.Level,ProcessMsg.nParam1,LoWord(nObjCount),HiWord(nObjCount));
        SendSocket(@m_DefMsg,'');

        if ProcessMsg.BaseObject = Self then begin
          m_DefMsg := MakeDefaultMsg(SM_HEROABILITY, Integer(ProcessMsg.BaseObject), MakeWord(m_btJob, m_btGender), MakeWord(m_btLimitLevel, m_btAiMode), MakeWord(m_btHeroAutoDurg, 0));
          SendSocket(@m_DefMsg, EncodeBuffer(@m_WAbil, SizeOf(TAbility)));

          SendDefMessage(SM_HEROSUBABILITY,
              MakeLong(MakeWord(m_nAntiMagic, m_nLuck), 0),
              MakeWord(m_btHitPoint, m_btSpeedPoint),
              MakeWord(m_btAntiPoison, m_nPoisonRecover),
              MakeWord(m_nHealthRecover, m_nSpellRecover),
              '');
        end;
      end;
    RM_ABILITY: begin
        m_DefMsg := MakeDefaultMsg(SM_HEROABILITY,
          Integer(ProcessMsg.BaseObject),
          MakeWord(m_btJob, m_btGender),
          MakeWord(m_btLimitLevel, m_btAiMode),
          MakeWord(m_btHeroAutoDurg, 0));
        SendSocket(@m_DefMsg, EncodeBuffer(@m_WAbil, SizeOf(TAbility)));
      end;


    RM_BUFF : begin       //康旷 滚橇
          SendDefMessage(SM_HEROBUFF,
                         Integer(ProcessMsg.BaseObject),
                         ProcessMsg.nParam2,
                         ProcessMsg.nParam3,
                         ProcessMsg.wParam,
                         ProcessMsg.sMsg);
    end;

    RM_HEALTHSPELLCHANGED: begin
        m_DefMsg:=MakeDefaultMsg(SM_HEALTHSPELLCHANGED,
                                 Integer(ProcessMsg.BaseObject),
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.HP,
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.MP,
                                 TBaseObject(ProcessMsg.BaseObject).m_WAbil.MaxHP);
        SendSocket(@m_DefMsg,'');
      end;

    RM_QUERYBAGITEMS: begin
        if GetTickCount() - m_dwQueryItemBagTick > 3000 then begin
          m_dwQueryItemBagTick := GetTickCount();
          RefBagItemCount;
          ClientQueryBagItems(0);
        end;
      end;
    CM_QUERYHEROBAGITEMS: begin
        if GetTickCount - m_dwQueryBagItemsTick > 30 * 1000 then begin
          m_dwQueryBagItemsTick := GetTickCount;
          RefBagItemCount;
          ClientQueryBagItems(0);
        end else
          SysMsg(IntToStr(30 - (GetTickCount - m_dwQueryBagItemsTick) div 1000) + '秒以后可以再次使用。',c_RedWhite,t_Hint);
      end;
    RM_QUERYAUTOITEMS: begin
          ClientQueryAutoItems();
      end;
    RM_SENDUSEITEMS: SendUseitems();
    RM_SENDMYMAGIC: SendUseMagic;
    RM_WEIGHTCHANGED: begin
        SendDefMessage(SM_HEROWEIGHTCHANGED,
          m_WAbil.Weight,
          m_WAbil.WearWeight,
          m_WAbil.HandWeight,
          0,
          '');
      end;
    RM_MAGIC_LVEXP: begin
        SendDefMessage(SM_HEROMAGIC_LVEXP,
          ProcessMsg.nParam1,
          ProcessMsg.nParam2,
          LoWord(ProcessMsg.nParam3),
          HiWord(ProcessMsg.nParam3),
          '');
      end;
    RM_DURACHANGE: begin
        SendDefMessage(SM_HERODURACHANGE,
          ProcessMsg.nParam1,
          ProcessMsg.wParam,
          LoWord(ProcessMsg.nParam2),
          HiWord(ProcessMsg.nParam2),
          '');
      end;
    RM_SUBABILITY: begin
        SendDefMessage(SM_HEROSUBABILITY,
          MakeLong(MakeWord(m_nAntiMagic, m_nLuck), 0),
          MakeWord(m_btHitPoint, m_btSpeedPoint),
          MakeWord(m_btAntiPoison, m_nPoisonRecover),
          MakeWord(m_nHealthRecover, m_nSpellRecover),
          '');

      end;

  else begin
      Result := inherited Operate(ProcessMsg);
    end;
  end;
 { except
    MainOutMessage('ProcessMsg.wIdent:' + IntToStr(ProcessMsg.wIdent));
  end;}
end;



procedure THeroObject.ClientQueryStorageItems(Idx:Integer);   //咯包      //芒绊
var
  I,II:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  UserItem:PTUserItem;
  opt: integer;
  sUserItemName, stditemname: string;
begin
 if m_StorageItemList.Count > 0 then begin
  sSendMsg:='';
  II := 0;
  if Idx = 0 then begin
   SendDefMessage(SM_HEROSTORAGEITEMS2,0,0,0,0,'');
   M_StorageItemboot := false;
  end;
  
  for I := Idx to m_StorageItemList.Count - 1 do begin
    UserItem:=m_StorageItemList.Items[I];
    Item:=UserEngine.GetStdItem(UserItem.wIndex);
    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      opt := Item.GetItemAddValue(UserItem,ClientItem.S);
      sUserItemName := '';
      sUserItemName := FilterStdShowName(Item,Item.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName <> '' then
        ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
      ClientItem.Amount:=UserItem.Amount;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      ClientItem.UpgradeOpt := opt;
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
    end;
    inc(II);
    if II >= 25 then break;
  end;
  if sSendMsg <> '' then begin
    M_StorageItemstr.add(sSendMsg);
    if (i >= m_StorageItemList.Count - 1) then begin
       M_StorageItemboot := true;
    end;

  end;
  if (i < m_StorageItemList.Count - 1) then
  ClientQueryStorageItems(i+1);
 end;
end;

procedure THeroObject.ItemTimeRun;   //咯包       //芒绊
var
 I:Integer;
begin
  if M_StorageItemboot and (M_StorageItemstr.Count > 0) then begin
    if (GetTickCount - M_StorageItemTick) > 1000 then begin
      m_DefMsg:=MakeDefaultMsg(SM_HEROSTORAGEITEMS,Integer(Self),0,0,0);
      SendSocket(@m_DefMsg,M_StorageItemstr.Strings[0]);
      M_StorageItemstr.Delete(0);
      M_StorageItemTick := GetTickCount;
    end;
  end;
end;

procedure THeroObject.ClientQueryBagItems(int:byte);
var
  I:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  UserItem:PTUserItem;
  sUserItemName, stditemname: string;
  opt: integer;
begin
  sSendMsg:='';
  SendDefMessage(SM_HEROBAGITEMS2,0,0,0,0,'');
  for I := 0 to _Min(m_ItemList.Count - 1,25) do begin
    UserItem:=m_ItemList.Items[i];
    if UserItem = nil then Continue;
    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      opt := Item.GetItemAddValue(UserItem,ClientItem.S);

      sUserItemName := '';
      sUserItemName := FilterStdShowName(Item,Item.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName <> '' then
        ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
      ClientItem.Amount:=UserItem.Amount;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      ClientItem.UpgradeOpt := opt;
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
    end;

  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_HEROBAGITEMS,Integer(Self),0,m_btHeroAutoDurg,int);
    SendSocket(@m_DefMsg,sSendMsg);
  end;

  if (m_ItemList.Count - 1 < 26) then Exit;
  sSendMsg:='';
  
  for I := 26 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if UserItem = nil then Continue;
    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      opt := Item.GetItemAddValue(UserItem,ClientItem.S);
      sUserItemName := '';
      sUserItemName := FilterStdShowName(Item,Item.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName <> '' then
        ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

      ClientItem.Dura:=UserItem.Dura;
      ClientItem.DuraMax:=UserItem.DuraMax;
      ClientItem.Amount:=UserItem.Amount;
      ClientItem.MakeIndex:=UserItem.MakeIndex;
      ClientItem.UpgradeOpt := opt;
      sSendMsg:=sSendMsg + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
    end;

  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_HEROBAGITEMS,Integer(Self),0,m_btHeroAutoDurg,0);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;



procedure THeroObject.ClientQueryAutoItems();
var
  I, nCount: Integer;
  Item: TItem;
  sSENDMSG: string;
  ClientItem: TClientItem;
  UserItem: pTUserItem;
  sUserItemName: string;
  ItemBagList: TStringList;
  opt: integer;
begin
  sSENDMSG := '';
  for I := 0 to m_AutoItem.Count - 1 do begin
    UserItem := m_AutoItem.Items[I];
    Item := UserEngine.GetStdItem(UserItem.wIndex);
    if Item <> nil then begin
      Item.GetStandardItem(ClientItem.S);
      opt := Item.GetItemAddValue(UserItem,ClientItem.S);

      sUserItemName := '';
      sUserItemName := FilterShowName(Item.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName <> '' then
        ClientItem.s.Name := FilterShowName(sUserItemName);

      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount:=UserItem.Amount;
      ClientItem.UpgradeOpt := opt;

      sSENDMSG := sSENDMSG + EncodeBuffer(@ClientItem, SizeOf(TClientItem)) + '/';
    end;
  end;

  if sSENDMSG <> '' then begin
    m_DefMsg := MakeDefaultMsg(SM_HEROAUTOITEMS, Integer(Self), m_btHeroAutoDurg, 0, m_AutoItem.Count);
    SendSocket(@m_DefMsg, sSENDMSG);
  end;
end;

//英雄无极真气  20080323 修改
//0级提升道术40%   1级提升60%   2级提升80%  3级提升100%  时间都是6秒
function THeroObject.AbilityUp(UserMagic: pTUserMagic): Boolean;
var
  nSpellPoint, n14: Integer;
begin
  Result := False;
  nSpellPoint := GetSpellPointG(UserMagic);
  if nSpellPoint > 0 then begin
    if m_WAbil.MP < nSpellPoint then Exit;

  {  if g_Config.boAbilityUpFixMode then begin//无极真气使用固定时长模式 20081109
      n14:= g_Config.nAbilityUpFixUseTime;//无极真气使用固定时长 20081109
    end else n14:=(UserMagic.btLevel * 2)+ 2 + g_Config.nAbilityUpUseTime;//20080603
    m_dwStatusArrTimeOutTick[2] := GetTickCount + n14 * 1000;
    m_wStatusArrValue[2] := Round(HiWord(m_WAbil.SC)*(UserMagic.btLevel * 0.2 + 0.4));//提升值 20080827
    SysMsg('(英雄) 道术瞬时提升' + IntToStr(m_wStatusArrValue[2]) + '，持续 ' + IntToStr(n14) + ' 秒', c_Green, t_Hint);
                       }
    RecalcAbilitys();
  //  CompareSuitItem(False);//套装与身上装备对比 20080729
    SendMsg(m_Master, RM_ABILITY, 0, 0, 0, 0, '');
    SendMsg(m_Master, RM_SUBABILITY, 0, 0, 0, 0, '');
    Result := True;
  end;
end;

function THeroObject.AutoAvoid(): Boolean; //自动躲避
  function GetAvoidDir(): Integer;
  var
    n10: Integer;
    n14: Integer;
  begin
    n10 := m_TargetCret.m_nCurrX;
    n14 := m_TargetCret.m_nCurrY;
    Result := DR_DOWN;
    if n10 > m_nCurrX then begin
      Result := DR_LEFT;
      if n14 > m_nCurrY then Result := DR_DOWNLEFT;
      if n14 < m_nCurrY then Result := DR_UPLEFT;
    end else begin
      if n10 < m_nCurrX then begin
        Result := DR_RIGHT;
        if n14 > m_nCurrY then Result := DR_DOWNRIGHT;
        if n14 < m_nCurrY then Result := DR_UPRIGHT;
      end else begin
        if n14 > m_nCurrY then Result := DR_UP
        else if n14 < m_nCurrY then Result := DR_DOWN;
      end;
    end;
  end;
  function GetDirXY(nTargetX, nTargetY: Integer): Byte;
  var
    n10: Integer;
    n14: Integer;
  begin
    n10 := nTargetX;
    n14 := nTargetY;
    Result := DR_DOWN;//南
    if n10 > m_nCurrX then begin
      Result := DR_RIGHT;//东
      if n14 > m_nCurrY then Result := DR_DOWNRIGHT;//东南向
      if n14 < m_nCurrY then Result := DR_UPRIGHT;//东北向
    end else begin
      if n10 < m_nCurrX then begin
        Result := DR_LEFT;//西
        if n14 > m_nCurrY then Result := DR_DOWNLEFT;//西南向
        if n14 < m_nCurrY then Result := DR_UPLEFT;//西北向
      end else begin
        if n14 > m_nCurrY then Result := DR_DOWN//南
        else if n14 < m_nCurrY then Result := DR_UP;//正北
      end;
    end;
  end;
  function GetGotoXY(nDir: Integer; var nTargetX, nTargetY: Integer): Boolean;
  var
    n01: Integer;
  begin
    Result := False;
    n01 := 0;
    while True do begin
      case nDir of
        DR_UP: begin//北
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin //CheckTargetXYCountOfDirection
              Dec(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Dec(nTargetY, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
        DR_UPRIGHT: begin//东北
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Inc(nTargetX, 2);
              Dec(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Inc(nTargetX, 2);
              Dec(nTargetY, 2);
              Inc(n01, 2);
              Continue;
            end;
          end; 
        DR_RIGHT: begin//东
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Inc(nTargetX, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Inc(nTargetX, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
        DR_DOWNRIGHT: begin//东南
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Inc(nTargetX, 2);
              Inc(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Inc(nTargetX, 2);
              Inc(nTargetY, 2);
              Inc(n01);
              Continue;
            end;
          end;
        DR_DOWN: begin//南
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Inc(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Inc(nTargetY, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
        DR_DOWNLEFT: begin//西南
            if m_PEnvir.CanWalk(nTargetX, nTargetY,False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Dec(nTargetX, 2);
              Inc(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Dec(nTargetX, 2);
              Inc(nTargetY, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
        DR_LEFT: begin//西
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Dec(nTargetX, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Dec(nTargetX, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
        DR_UPLEFT: begin//西北向
            if m_PEnvir.CanWalk(nTargetX, nTargetY, False) and (CheckTargetXYCountOfDirection(nTargetX, nTargetY, nDir, 3) = 0) then begin
              Dec(nTargetX, 2);
              Dec(nTargetY, 2);
              Result := True;
              Break;
            end else begin
              if n01 >= 10 then Break;
              Dec(nTargetX, 2);
              Dec(nTargetY, 2);
              Inc(n01, 2);
              Continue;
            end;
          end;
      else begin
          Break;
        end;
      end;
    end;

  end;
  function GetAvoidXY(var nTargetX, nTargetY: Integer): Boolean;
  var
    n10, nDir: Integer;
    nX, nY: Integer;
  begin
    nX := nTargetX;
    nY := nTargetY;
    Result := GetGotoXY(m_btLastDirection, nTargetX, nTargetY);
    n10 := 0;
    while True do begin
      if n10 >= 7 then Break;
      if Result then Break;
      nTargetX := nX;
      nTargetY := nY;
      nDir := Random(7);
      Result := GetGotoXY(nDir, nTargetX, nTargetY);
      Inc(n10);
    end;
    m_btLastDirection := nDir;
  end;
  function GotoMasterXY(var nTargetX, nTargetY: Integer): Boolean;
  var
    nDir: Integer;
  begin
    Result := False;
    if (m_Master <> nil) and ((abs(m_Master.m_nCurrX - m_nCurrX) >= 6) or (abs(m_Master.m_nCurrY - m_nCurrY) >= 6)) and (not m_boProtectStatus) then begin
      nTargetX := m_nCurrX;
      nTargetY := m_nCurrY;
      nDir := GetDirXY(m_Master.m_nCurrX, m_Master.m_nCurrY);
      case nDir of
        DR_UP: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UPRIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_UPRIGHT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UPLEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_UPLEFT;
            end;
          end;
        DR_UPRIGHT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UP, nTargetX, nTargetY);
              m_btLastDirection := DR_UP;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_RIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_RIGHT;
            end;
          end;
        DR_RIGHT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UPRIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_UPRIGHT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWNRIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWNRIGHT;
            end;
          end;
        DR_DOWNRIGHT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_RIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_RIGHT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWN, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWN;
            end;
          end;
        DR_DOWN: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWNRIGHT, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWNRIGHT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWNLEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWNLEFT;
            end;
          end;
        DR_DOWNLEFT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWN, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWN;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_LEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_LEFT;
            end;
          end;
        DR_LEFT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_DOWNLEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_DOWNLEFT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UPLEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_UPLEFT;
            end;
          end;
        DR_UPLEFT: begin
            Result := GetGotoXY(nDir, nTargetX, nTargetY);
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_LEFT, nTargetX, nTargetY);
              m_btLastDirection := DR_LEFT;
            end;
            if not Result then begin
              nTargetX := m_nCurrX;
              nTargetY := m_nCurrY;
              Result := GetGotoXY(DR_UP, nTargetX, nTargetY);
              m_btLastDirection := DR_UP;
            end;
          end;
      end;
    end;
  end;
var
  nTargetX: Integer;
  nTargetY: Integer;
  nDir: Integer;
begin
  Result := True;
  if (m_TargetCret <> nil) and not m_TargetCret.m_boDeath then begin
    if GotoMasterXY(nTargetX, nTargetY) then begin
       Result := GotoTargetXY(nTargetX, nTargetY, 1);
    end else begin
      nTargetX := m_nCurrX ;
      nTargetY := m_nCurrY ;
      nDir:= GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      nDir:= GetBackDir(nDir);
      m_PEnvir.GetNextPosition(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,nDir,5,m_nTargetX,m_nTargetY);
      Result :=GotoTargetXY(m_nTargetX, m_nTargetY, 1);
    end;
  end;
end;


function THeroObject.AttackTarget(): Boolean;    //康旷傍拜
var
  nSelectMagic :integer;
  dwAttackTime: LongWord;
  ncode: integer;
resourcestring
  sExceptionMsg = 'THeroObject.AttackTarget Code:%d Name:%s';
begin
  Result := False;
  ncode := 0;
  try
    ncode := 1;
  if m_btStatus = 1 then begin  //傍拜啊瓷 惑怕啊 酒聪搁 (措扁惑怕, 绒侥惑怕)
    if m_TargetCret <> nil then m_TargetCret:= nil;
    Exit;
  end;
  ncode := 2;
  if InSafeZone and (m_TargetCret <> nil) then begin//救傈俊辑 傍拜措惑捞 乐阑锭
    if (m_TargetCret.m_btRaceServer = RC_PLAYOBJECT) or (m_TargetCret.m_btRaceServer = RC_HEROOBJECT) then begin      //荤恩苞 康旷篮 鸥百阑 绝局霖促.
       m_TargetCret:= nil;
       Exit;
    end;
  end;

  ncode := 3;
  if (m_TargetCret <> nil) then nSelectMagic := SelectMagic;
  ncode := 4;
  m_dwTargetFocusTick := GetTickCount();
  case m_btJob of
    0: begin  //康旷傈荤 AttackTarget
        ncode := 5;
        dwAttackTime := _MAX(0, Integer(g_Config.dwHeroWarrorAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime);
        ncode := 6;
        if (GetTickCount - m_dwHitTick > dwAttackTime) and (GetTickCount - m_SkillUseTick[0] > (Integer(g_Config.dwHeroWarrorAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime)) then begin
          m_dwHitTick := GetTickCount();
          m_boIsUseMagic := False;
          ncode := 7;
          Result := StartAttack(nSelectMagic);
          ncode := 8;
          if (nSelectMagic > 0) and (nSelectMagic <= High(m_SkillUseTick)) then begin     //立加 饶 2檬饶俊 then begin
            m_SkillUseTick[nSelectMagic] := GetTickCount;
            m_SkillUseTick[0] := GetTickCount;
          end;
        end;
        m_nSelectMagic := 0;
      end;
    1: begin      //康旷贱荤 AttackTarget
        ncode := 9;
        dwAttackTime := _MAX(0, Integer(g_Config.dwHeroWizardAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime);
        ncode := 10;
        if (GetTickCount - m_dwHitTick > dwAttackTime) and (GetTickCount - m_SkillUseTick[0] > (Integer(g_Config.dwHeroWizardAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime)) then begin
          m_dwHitTick := GetTickCount();
          m_boIsUseMagic := False;
          ncode := 11;
          Result := StartAttack(nSelectMagic);
          ncode := 12;
          if (nSelectMagic > 0) and (nSelectMagic <= High(m_SkillUseTick)) then begin
            m_SkillUseTick[nSelectMagic] := GetTickCount;
            m_SkillUseTick[0] := GetTickCount;
          end;
          ncode := 13;
          Exit;//20080719
        end;
        m_nSelectMagic := 0;//20080719
      end;
    2: begin   //康旷档荤   AttackTarget
        dwAttackTime := _MAX(0, Integer(g_Config.dwHeroTaoistAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime);
        if (GetTickCount - m_dwHitTick > dwAttackTime) and (GetTickCount - m_SkillUseTick[0] > (Integer(g_Config.dwHeroTaoistAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime)) then begin
          m_dwHitTick := GetTickCount();
          m_boIsUseMagic := False;
          Result := StartAttack(nSelectMagic);
          if (nSelectMagic > 0) and (nSelectMagic <= High(m_SkillUseTick)) then begin
            m_SkillUseTick[nSelectMagic] := GetTickCount;
            m_SkillUseTick[0] := GetTickCount;
          end;
          Exit;//20080719
        end;
        m_nSelectMagic := 0;
      end;
    3: begin   //康旷磊按 AttackTarget
        ncode := 5;
        dwAttackTime := _MAX(0, Integer(g_Config.dwHeroAssassinAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime);
        ncode := 6;
        if nSelectMagic = 60 then begin  //浅八贱
          if (GetTickCount - m_dwHitTick > dwAttackTime) then begin
            m_dwHitTick := GetTickCount();
            m_boIsUseMagic := False;
            ncode := 7;
            Result := StartAttack(nSelectMagic);
            ncode := 8;
          end;
        end else begin
          if (GetTickCount - m_dwHitTick > dwAttackTime) and (GetTickCount - m_SkillUseTick[0] > (Integer(g_Config.dwHeroAssassinAttackTime) - m_nHitSpeed * g_Config.dwHeroItemAttackTime)) then begin
            m_dwHitTick := GetTickCount();
            m_boIsUseMagic := False;
            ncode := 7;
            Result := StartAttack(nSelectMagic);
            ncode := 8;
            if (nSelectMagic > 0) and (nSelectMagic <= High(m_SkillUseTick)) then begin
              m_SkillUseTick[nSelectMagic] := GetTickCount;
              m_SkillUseTick[0] := GetTickCount;
            end;
          end;
        end;
        m_nSelectMagic := 0;
      end;
  end;
  except
    on E: Exception do begin
      MainOutMessage(Format(sExceptionMsg, [ncode, m_sCharName]));
    end;
  end;
end;

procedure THeroObject.ClearCopyItem(wIndex, MakeIndex: Integer);
var
  I: Integer;
  UserItem: pTUserItem;
begin
  Try
    for I := m_ItemList.Count - 1 downto 0 do begin
      if m_ItemList.Count <= 0 then Break;
      UserItem := m_ItemList.Items[I];
      if (UserItem.wIndex = wIndex) and (UserItem.MakeIndex = MakeIndex) then begin
        SendDelItems(UserItem);
        m_ItemList.Delete(I);
        Break;//20081014 只找到一件则退出，提高效率
      end;
    end;
  except
    MainOutMessage('{异常} THeroObject.ClearCopyItem');
  end;
end;

function THeroObject.CheckUserMagic(wMagIdx: Word): pTUserMagic;
var
  I: Integer;
begin
  Result := nil;
  if m_MagicList.Count > 0 then begin//20080630
    for I := 0 to m_MagicList.Count - 1 do begin
      if pTUserMagic(m_MagicList.Items[I]).MagicInfo.wMagicId = wMagIdx then begin
        Result := pTUserMagic(m_MagicList.Items[I]);
        Break;
      end;
    end;
  end;
end;

{检测指定方向和范围内坐标的怪物数量}
function THeroObject.CheckTargetXYCountOfDirection(nX, nY, nDir, nRange: Integer): Integer;
var
  BaseObject: TBaseObject;
  I: Integer;
begin
  Result := 0;
  if m_VisibleActors.Count > 0 then begin//20080630
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if BaseObject <> nil then begin
        if not BaseObject.m_boDeath then begin
          if IsProperTarget(BaseObject) and
            (not BaseObject.m_boHideMode or m_boCoolEye) then begin
            case nDir of
              DR_UP: begin
                  if (abs(nX - BaseObject.m_nCurrX) <= nRange) and ((BaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
                end;
              DR_UPRIGHT: begin
                  if ((BaseObject.m_nCurrX - nX) in [0..nRange]) and ((BaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
                end;
              DR_RIGHT: begin
                  if ((BaseObject.m_nCurrX - nX) in [0..nRange]) and (abs(nY - BaseObject.m_nCurrY) <= nRange) then Inc(Result);
                end;
              DR_DOWNRIGHT: begin
                  if ((BaseObject.m_nCurrX - nX) in [0..nRange]) and ((nY - BaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
                end;
              DR_DOWN: begin
                  if (abs(nX - BaseObject.m_nCurrX) <= nRange) and ((nY - BaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
                end;
              DR_DOWNLEFT: begin
                  if ((nX - BaseObject.m_nCurrX) in [0..nRange]) and ((nY - BaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
                end;
              DR_LEFT: begin
                  if ((nX - BaseObject.m_nCurrX) in [0..nRange]) and (abs(nY - BaseObject.m_nCurrY) <= nRange) then Inc(Result);
                end;
              DR_UPLEFT: begin
                  if ((nX - BaseObject.m_nCurrX) in [0..nRange]) and ((BaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
                end;
            end;
            //if Result > 2 then break;
          end;
        end;
      end;
    end;
  end;
end;

function THeroObject.CheckTargetXYCount(nX, nY, nRange: Integer): Integer;
var
  BaseObject: TBaseObject;
  I, nC, n10: Integer;
begin
  Result := 0;
  n10 := nRange;
  if m_VisibleActors.Count > 0 then begin//20080630
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if BaseObject <> nil then begin
        if not BaseObject.m_boDeath then begin
          if IsProperTarget(BaseObject) and
            (not BaseObject.m_boHideMode or m_boCoolEye) then begin
            nC := abs(nX - BaseObject.m_nCurrX) + abs(nY - BaseObject.m_nCurrY);
            if nC <= n10 then begin
              Inc(Result);
              //if Result > 2 then break;
            end;
          end;
        end;
      end;
    end;
  end;
end;
//战士判断使用 20080924
function THeroObject.CheckTargetXYCount1(nX, nY, nRange: Integer): Integer;
var
  BaseObject: TBaseObject;
  I, n10: Integer;
begin
  Result := 0;
  n10 := nRange;
  if m_VisibleActors.Count > 0 then begin
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if BaseObject <> nil then begin
        if not BaseObject.m_boDeath then begin
          if IsProperTarget(BaseObject) and
            (not BaseObject.m_boHideMode or m_boCoolEye) then begin
            if (abs(nX - BaseObject.m_nCurrX) <= n10) and (abs(nY - BaseObject.m_nCurrY) <= n10) then begin
              Inc(Result);
            end;
          end;
        end;
      end;
    end;
  end;
end;
//半月弯刀判断目标函数 20081207
function THeroObject.CheckTargetXYCount2(): Integer;
var
  nC, n10, I: Integer;
  nX, nY: Integer;
  BaseObject: TBaseObject;
begin
  Result := 0;
  nC := 0;
  if m_VisibleActors.Count > 0 then begin
    for I := 0 to m_VisibleActors.Count - 1 do begin
      n10 := (m_btDirection + g_Config.WideAttack[nC]) mod 8;
      if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, n10, 1, nX, nY) then begin
        BaseObject := m_PEnvir.GetMovingObject(nX, nY, True);
        if BaseObject <> nil then begin
          if not BaseObject.m_boDeath then begin
            if IsProperTarget(BaseObject) and (not BaseObject.m_boHideMode or m_boCoolEye) then begin
              Inc(Result);
            end;
          end;
        end;
      end;
      Inc(nC);
      if nC >= 3 then Break;
    end;
  end;
end;


function THeroObject.GetRangeTargetCount(nX, nY, nRange: Integer): Integer;
var
  BaseObjectList: TList;
  BaseObject: TBaseObject;
  I: Integer;
begin
  Result := 0;
  BaseObjectList := TList.Create;
  if GetMapBaseObjects(m_PEnvir, nX, nY, nRange, BaseObjectList) then begin
    for I := BaseObjectList.Count - 1 downto 0 do begin
      if not BaseObject.m_boDeath then begin
        if IsProperTarget(BaseObject) and (not BaseObject.m_boHideMode or m_boCoolEye) then begin
          BaseObject := TBaseObject(BaseObjectList.Items[I]);
        end;
      end;
    end;
    Result := BaseObjectList.Count;
  end;
  FreeAndNil(BaseObjectList);
end;

function THeroObject.GetRangeTargetCountByDir(nDir, nX, nY, nRange: Integer): Integer;
var
  I: Integer;
  BaseObject: TBaseObject;
  nCurrX, nCurrY: Integer;
begin
  Result := 0;
  nCurrX := nX;
  nCurrY := nY;
  for I := 1 to nRange do begin
    if m_PEnvir.GetNextPosition(nCurrX, nCurrY, nDir, 1, nCurrX, nCurrY) then begin
      BaseObject := TBaseObject(m_PEnvir.GetMovingObject(nCurrX, nCurrY, True));
      if (BaseObject <> nil) and (not BaseObject.m_boDeath) and (not BaseObject.m_boGhost) and (not BaseObject.m_boHideMode or m_boCoolEye) and IsProperTarget(BaseObject) then begin
        Inc(Result);
      end;
    end;
  end;
end;


function THeroObject.CanLineAttack(nStep: Integer): Boolean;
var
  I: Integer;
  btDir: Byte;
  nX, nY: Integer;
begin
  Result := False;
  nX := m_nCurrX;
  nY := m_nCurrY;
  btDir := GetNextDirection(nX, nY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  for I := 1 to nStep do begin
    if (m_TargetCret.m_nCurrX = nX) and (m_TargetCret.m_nCurrY = nY) then begin
      Result := True;
      Break;
    end;
    btDir := GetNextDirection(nX, nY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
    if not m_PEnvir.GetNextPosition(nX, nY, btDir, 1, nX, nY) then Break;
    if not m_PEnvir.CanWalkEx(nX, nY, FALSE) then Break;
  end;
end;

Function THeroObject.CheckHeroAmulet(nType: Integer; nCount: Integer):Boolean;
var
  I: Integer;
  UserItem: pTUserItem;
  AmuletStdItem: TItem;
begin
  try
  Result:= False;
  if m_UseItems[U_ARMRINGL].wIndex > 0 then begin
    AmuletStdItem := UserEngine.GetStdItem(m_UseItems[U_ARMRINGL].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of
        1: begin
            if (AmuletStdItem.Shape = 5) and (Round(m_UseItems[U_ARMRINGL].Dura / 100) >= nCount) then begin
              Result:= True;
              Exit;
            end;
          end;
        2: begin
            if (AmuletStdItem.Shape <= 2) and (Round(m_UseItems[U_ARMRINGL].Dura / 100) >= nCount) then begin
              Result:= True;
              Exit;
            end;
          end;
      end;
    end;
  end;

  if m_UseItems[U_BUJUK].wIndex > 0 then begin
    AmuletStdItem := UserEngine.GetStdItem(m_UseItems[U_BUJUK].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of //
        1: begin//符
            if (AmuletStdItem.Shape = 5) and (Round(m_UseItems[U_BUJUK].Dura / 100) >= nCount) then begin
              Result:= True;
              Exit;
            end;
          end;
        2: begin//毒
            if (AmuletStdItem.Shape <= 2) and (Round(m_UseItems[U_BUJUK].Dura / 100) >= nCount) then begin
              Result:= True;
              Exit;
            end;
          end;
      end;
    end;
  end;

  //检测人物包裹是否存在毒,护身符
  if m_ItemList.Count > 0 then begin//20080628
    for I := 0 to m_ItemList.Count - 1 do begin //人物包裹不为空
      UserItem := m_ItemList.Items[I];
      AmuletStdItem := UserEngine.GetStdItem(UserItem.wIndex);
      if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
        case nType of
          1: begin
              if (AmuletStdItem.Shape = 5) and (Round(UserItem.Dura / 100) >= nCount) then begin  //20071227
                Result:= True;
                Exit;
              end;
            end;
          2: begin
              if (AmuletStdItem.Shape <= 2) and (Round(UserItem.Dura / 100) >= nCount) then begin
                Result:= True;
                Exit;
              end;
            end;
        end;//case
      end;
    end;
  end;
  except
    on E: Exception do begin
      MainOutMessage('{异常} THeroObject.CheckHeroAmulet');
    end;
  end;
end;


function THeroObject.CheckHeroAmulet2(nCount:Integer; nType, num, mode:Integer; var Idx:Integer):Boolean;
var
  AmuletStdItem: TItem;
begin
  Result:=False;
  Idx:=0;
  if m_UseItems[U_ARMRINGL].wIndex > 0 then begin       //迫骂磊府
    AmuletStdItem:=UserEngine.GetStdItem(m_UseItems[U_ARMRINGL].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of
        1: begin       //何利
          if (AmuletStdItem.Shape = 5) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        2: begin    //刀啊风
          if (AmuletStdItem.Shape <= 2) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        4: begin    //刀啊风 (雀祸
          if (AmuletStdItem.Shape = 1) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        5: begin    //何利刀啊风
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        6: begin    //焊何 - 铰妨
          if (AmuletStdItem.Shape = 10) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        7: begin    //何利刀啊风
          if (AmuletStdItem.Shape in [7]) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        8: begin    //何利刀啊风
          if (AmuletStdItem.Shape in [8]) and (ROUND(m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;

      end;
    end;
  end;


  if m_UseItems[U_BUJUK].wIndex > 0 then begin    //何利 磊府
    AmuletStdItem:=UserEngine.GetStdItem(m_UseItems[U_BUJUK].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of    //
        1: begin
          if (AmuletStdItem.Shape = 5) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        2: begin
          if (AmuletStdItem.Shape <= 2) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        4: begin
          if (AmuletStdItem.Shape = 1) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        5: begin
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        6: begin     //焊何 - 铰妨
          if (AmuletStdItem.Shape = 10) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        7: begin
          if (AmuletStdItem.Shape in [7]) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        8: begin
          if (AmuletStdItem.Shape in [8]) and (ROUND(m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;
  if (not Result) and (mode = 1) then begin
    if (nType = 1) and (GetTickCount - m_BujukUseTick > 10 * 1000) then begin
       SysMsg('英雄只有装备护身符时才能使用此技能。',c_Red,t_Hint);  m_BujukUseTick := GetTickCount;
    end;
    if (nType = 2) and (GetTickCount - m_PosionUseTick > 10 * 1000) then begin
       SysMsg('英雄只有装备毒粉时才能使用此技能。',c_Red,t_Hint); m_PosionUseTick := GetTickCount;
    end;
    if (nType in [5,7,8]) and (GetTickCount - m_PosionUseTick > 10 * 1000) then begin
       SysMsg('英雄只有装备毒符包时才能使用此技能。',c_Red,t_Hint); m_PosionUseTick := GetTickCount;
    end;
  end;
end;

procedure THeroObject.DelTargetCreat;
begin
  inherited;
  m_nTargetX := -1;
  m_nTargetY := -1;
end;

function THeroObject.EatUseItems(nShape: Integer): Boolean;
begin
  Result := False;
end;


function THeroObject.EatItems(StdItem: TItem; UserItem:pTUserItem): Boolean;
var
  bo06: Boolean;
  nOldStatus: Integer;
  boNeedRecalc: Boolean;
  nRate, nTime, nHTime, nHP:Integer;
  Str, sMsg: String;
begin
  Result := False;
  if m_PEnvir.Flag.boNODRUG then begin
    SysMsg(sCanotUseDrugOnThisMap, c_Red, t_Hint);
    Exit;
  end;
  case StdItem.StdMode of
    0: begin     //拱距
        case StdItem.Shape of
          1: begin
              IncHealthSpell(StdItem.AC, StdItem.MAC);
              Result := True;
            end;
          2: begin      //固瘤荐
              m_boUserUnLockDurg := True;
              Result := True;
            end;
          3: begin
              IncHealthSpell(Round((m_WAbil.MaxHP / 100)*StdItem.AC),Round((m_WAbil.MaxMP / 100)*StdItem.MAC));
              Result := True;
            end;
          4: begin      //流诀喊 拱距
              nHP := 0;
              if m_btJob = StdItem.Need then begin
                nHP := StdItem.MAC - StdItem.AC;
                IncHealthSpell(StdItem.AC + Random(nHP),0);
                Result:=True;
              end;
            end;
          10: begin     //绵汗狼扁抚
              if not m_boDeath then
              if WeaptonMakeLuck() then Result:=True;
            end;
          11: begin     //公脚狼扁抚
              if not m_boDeath then
              if SuperRepairWeapon() then Result:=True;
            end;
        else begin
            if (StdItem.AC > 0) then begin
              Inc(m_nIncHealth, StdItem.AC);
            end;
            if (StdItem.MAC > 0) then begin
              Inc(m_nIncSpell, StdItem.MAC);
            end;
            Result := True;
          end;
        end;
      end;
    2: begin     //般摹扁 阂啊 券袍
        case StdItem.Shape of
          13: begin   //版氰摹 拱距
            if not m_boDeath then
              GetExp(StdItem.DuraMax);
            Result := True;
          end;
          14: begin     //何劝林巩辑
            if m_boDeath then begin
              if (Not m_PEnvir.Flag.boNOREVIVAL) then begin
                m_WAbil.HP:=m_WAbil.MaxHP;
                m_WAbil.MP:=m_WAbil.MaxMP;
                m_boDeath := False;
                SendMsg(self,RM_ABILITY,0,0,0,0,'');
                SendRefMsg(RM_ALIVE, m_btDirection, m_nCurrX,m_nCurrY, 0, '');
                SendRefMsg(RM_CHANGELIGHT, 0, 0, 0, 0, '');
                Result := True;
                RecalcAbilitys;
                RecalcHeroAddAbilitys();
                TPlayObject(m_Master).RecalcHeroAddAbilitys;
              end else begin
                SysMsg('无法使用。',c_RedWhite,t_Hint);
              end;
            end;
          end;
          15: begin     //澜剧函券辑
            if not m_boDeath then begin
              if m_UseItems[U_DRESS].wIndex = 0 then begin
                if m_btGender = 0 then m_btGender:= 1
                 else m_btGender:= 0;
                Result := True;
                SendMsg(Self, RM_ToSendMsg, 1, 90, m_btGender, 0, '');
                FeatureChanged();
                SysMsg('英雄的性别变了。',c_Green,t_Hint);
              end else begin
                Result := False;
                SysMsg('穿着盔甲时不能转换性别。',c_Red,t_Hint);
              end;
            end;
          end;
          16: begin       //版氰摹啊魂
            if not m_boDeath then begin
               Result := True;
               nRate := StdItem.AC;
               nTime := StdItem.DuraMax * 3600;
               m_nKillMonExpRate2 := nRate;
               m_dwKillMonExpRateTime2 := LongWord(nTime);
              // SysMsg(format(g_sChangeKillMonExpRateMsg,[m_nKillMonExpRate2 / 100,m_dwKillMonExpRateTime2]),c_Green,t_Hint);
               SysMsg('英雄获得的经验值增加了',c_GreenWhite,t_Hint);
               SendMsg (Self,RM_BUFF, 8, 0, 300, StdItem.DuraMax * 3600 , '经验值 + ' + IntToStr(nRate - 100) +'%\持续: ' );    //版氰摹啊魂 滚橇
            end;
          end;
          22: begin     //傍仿荐
            if not m_boDeath then begin
              Result := True;
              nRate := StdItem.AC;
              nTime := StdItem.DuraMax * 3600;
              m_nPowerRate3 := nRate;
              m_dwPowerRateTime3 := LongWord(nTime);
              SysMsg('英雄的攻击力增加了。',c_GreenWhite,t_Hint);
              SendMsg (Self,RM_BUFF, 49, 0, 306, StdItem.DuraMax * 3600, '攻击力 + ' + IntToStr(StdItem.AC - 100) +' \持续: ' );    //傍仿荐 滚橇
            end;
          end;
          24: begin     //沥犬狼拱距
            if not m_boDeath then begin
              Result := True;
              m_wStatusArrValue[18] := StdItem.AC;
              m_dwStatusArrTimeOutTick[18] := GetTickCount + StdItem.DuraMax * 3600 * 1000;
              RecalcAbilitys();
              SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
              SysMsg('英雄的准确增加了。',c_GreenWhite,t_Hint);
              SendMsg (Self, RM_BUFF, 17, 0, 320, StdItem.DuraMax * 3600, format('准确 + %d: ',[StdItem.AC]));    //沥犬狼拱距 滚橇
            end;
          end;

          25: begin     //固侩荤付澜措肺1
            if not m_boDeath then begin
              m_btHair := Random(3);
              Case m_btHair of
                 0: Str := '光头';
                 1: Str := '短发';
                 2: Str := '马尾辫';
                 3: Str := '长发';
              end;
              Result := True;
              FeatureChanged();
              SysMsg('英雄的发型变为 ' + Str + '。',c_Green,t_Hint);
            end;
          end;
          26: begin     //固侩荤付澜措肺2
            if not m_boDeath then begin
              m_btHair := 1 + Random(8);
              Case m_btHair of
                 1: Str := '短发';
                 2: Str := '马尾辫';
                 3: Str := '长发';
                 4: Str := '棕色头发';
                 5: Str := '红色头发';
                 6: Str := '蓝色头发';
                 7: Str := '棕色爆炸头';
                 8: Str := '红色爆炸头';
                 9: Str := '蓝色爆炸头';
              end;
              Result := True;
              FeatureChanged();
              SysMsg('英雄的发型变为' + Str + '。',c_Green,t_Hint);
            end;
          end;
          29: begin  //靛而规瘤 拱距
            if not m_boDeath then begin
              if StdItem.AniCount > 0 then begin
                m_wStatusArrValue[14]:=StdItem.AniCount;
                m_dwStatusArrTimeOutTick[14]:=GetTickCount + StdItem.DuraMax * 3600 * 1000;
                SendMsg(Self, RM_BUFF, 121, 0, 301, StdItem.DuraMax * 3600, '[ 防止爆出 ]\持续: ');
              end;
              Result := True;
              RecalcAbilitys();
            end;
          end;
          30: begin //荐访狼拱距
            if not m_boDeath then begin
              Result := True;
              m_wStatusArrValue[28] := 1;
              m_dwStatusArrTimeOutTick[28] := GetTickCount + StdItem.DuraMax * 3600 * 1000;
              SysMsg('英雄的技能熟练度增加了。',c_GreenWhite,t_Hint);
              RecalcAbilitys();
              SendMsg (Self,RM_BUFF, 53, 0, 318, StdItem.DuraMax * 3600, '经验值倍数2倍: ');   //荐访狼拱距 滚橇
            end;
          end;

          4: begin           //绵汗狼 扁抚 绵扁
            if not m_boDeath then
            if WeaptonMakeLuck() then Result:=True;
          end;

          9: begin     //荐府扁抚
            if not m_boDeath then
            if RepairWeapon() then Result:=True;
          end;
          10: begin     //公脚狼扁抚
            if not m_boDeath then
            if SuperRepairWeapon() then Result:=True;
          end;

        end;
      end;

    3: begin
        case StdItem.Shape of
        12: begin    //瓷仿摹 拱距
          boNeedRecalc := False;
          if not m_boDeath then begin
            if StdItem.DC > 0 then begin
              m_wStatusArrValue[0]:=StdItem.DC;
              m_wStatusArrFlag[0]:=0;
              m_dwStatusArrTimeOutTick[0{0x220}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时攻击增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时攻击增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint) ;
              SendMsg (Self,RM_BUFF, 3, 0, 307, StdItem.MAC2 , format('攻击 + %d\持续: ' ,[StdItem.DC]) );   //颇鲍狼拱距 滚橇
              boNeedRecalc:=True;
            end;
            if StdItem.MC > 0 then begin
              m_wStatusArrValue[1{0x219}]:=StdItem.MC;
              m_wStatusArrFlag[1]:=0;
              m_dwStatusArrTimeOutTick[1{0x224}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时魔法增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时魔法增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint)  ;
              SendMsg (Self,RM_BUFF, 5, 0, 308, StdItem.MAC2 , format('魔法 + %d\持续: ' ,[StdItem.MC]) );  //付仿狼拱距 滚橇
              boNeedRecalc:=True;
            end;
            if StdItem.SC > 0 then begin
              m_wStatusArrValue[2{0x21A}]:=StdItem.SC;
              m_wStatusArrFlag[2]:=0;
              m_dwStatusArrTimeOutTick[2{0x228}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时道术增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时道术增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint);
              SendMsg (Self,RM_BUFF, 6, 0, 309, StdItem.MAC2 , format('道术 + %d\持续: ' ,[StdItem.SC]) );  //档仿狼拱距 滚橇
              boNeedRecalc:=True;
            end;
            if StdItem.AC2 > 0 then begin
              m_wStatusArrValue[3{0x21B}]:=StdItem.AC2;
              m_wStatusArrFlag[3]:=0;
              m_dwStatusArrTimeOutTick[3{0x22C}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时攻击速度增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时攻击速度增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint);
              SendMsg (Self,RM_BUFF, 7, 0, 312, StdItem.MAC2, format('攻击速度 + %d\持续: ' ,[StdItem.AC2]) );  //堡浅拱距 滚橇
              boNeedRecalc:=True;
            end;
            if StdItem.AC > 0 then begin
              m_wStatusArrValue[4{0x21C}]:=StdItem.AC;
              m_wStatusArrFlag[4]:=0;
              m_dwStatusArrTimeOutTick[4{0x230}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时生命值增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时生命值增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint);
              SendMsg (Self,RM_BUFF, 10, 0, 310, StdItem.MAC2 , format('MAX HP + %d\持续: ' ,[StdItem.AC]) );  //腊眉 滚橇
              boNeedRecalc:=True;
            end;
            if StdItem.MAC > 0 then begin
              m_wStatusArrValue[5{0x21D}]:=StdItem.MAC;
              m_wStatusArrFlag[5]:=0;
              m_dwStatusArrTimeOutTick[5{0x234}]:=GetTickCount + StdItem.MAC2 * 1000;
              if StdItem.MAC2 >= 3600 then
                SysMsg('英雄的临时魔法值增加' + IntToStr(StdItem.MAC2 div 3600) + '小时。',c_Green,t_Hint)
              else
                SysMsg('英雄的临时魔法值增加' + IntToStr(StdItem.MAC2 div 60) + '分钟。',c_Green,t_Hint);
              SendMsg (Self,RM_BUFF, 11, 0, 311, StdItem.MAC2 , format('MAX MP + %d\持续: ' ,[StdItem.MAC]) );  //沥脚 滚橇
              boNeedRecalc:=True;
            end;
            if boNeedRecalc then begin
              RecalcAbilitys();
              SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
              Result := True;
            end;
          end;
        end;
        else begin
          Result := EatUseItems(StdItem.Shape);
        end;
        end;
      end;
  end;
end;

procedure THeroObject.GainExp(dwExp: LongWord);
begin
  WinExp(dwExp);
end;


procedure THeroObject.HasLevelUp(nLevel: Integer);
begin
  if (m_Abil.Level in [10,20,30,40,50]) and (nLevel = 1) then begin
     m_btLimitLevel := m_Abil.Level div 10;
  end else  m_btLimitLevel := 0;

  m_Abil.MaxExp := GetLevelExp(m_Abil.Level);
  RecalcLevelAbilitys();
  RecalcHeroAddAbilitys();
  TPlayObject(m_Master).RecalcHeroAddAbilitys;
  GetObjectEffect; //扁欺咙
  SendRefMsg (RM_LOOPNORMALEFFECT, integer(self), 0, 0, NE_LEVELUP, '');
  SendMsg(Self, RM_LEVELUP, 0, 0, 0, 0, '');
  RefBagItemCount;
  RecalcAbilitys();
  if (g_FunctionNPC <> nil) and (m_Master <> nil) then begin
    TPlayObject(m_Master).m_nScriptGotoCount := 0;
    g_FunctionNPC.GotoLable(TPlayObject(m_Master), '@HeroLevelUp', False);
  end;
end;

procedure THeroObject.HasLevelDown(nLevel: Integer);
begin
  m_Abil.MaxExp := GetLevelExp(m_Abil.Level);
  m_Abil.Exp := 0;
  RecalcLevelAbilitys();
  RecalcHeroAddAbilitys();
  TPlayObject(m_Master).RecalcHeroAddAbilitys;
  GetObjectEffect;
  SendMsg(Self, RM_LEVELUP, 0, 1, 0, 0, '');
  RecalcAbilitys();
  RefBagItemCount;
end;

//分配给英雄经验  20080110
procedure THeroObject.GetExp(dwExp: LongWord);
var
  dwAddExp: LongWord;
  lwExp: LongWord;
label RefExp;
begin
  if m_btLimitLevel > 0 then exit;
  lwExp := dwExp;

  RefExp:
  dwAddExp := m_Abil.MaxExp - m_Abil.Exp;
  if (lwExp >= dwAddExp) and (m_Abil.MaxExp > m_Abil.Exp) then begin   //巢篮 版氰摹焊促 甸绢柯 版氰摹啊 努版快 + 泅犁 版氰摹啊 鞘夸版氰摹 焊促 累篮版快
    if m_Abil.Level < MAXLEVEL then begin


      Inc(m_Abil.Level);
      lwExp := lwExp - dwAddExp;
      m_Abil.Exp := 0;
      AddBodyLuck(dwAddExp * 0.002);
      if (m_Abil.Level in [10,20,30,40,50]) and (m_btLimitLevel = 0) then begin
        HasLevelUp(1);
        Exit;
      end;
      HasLevelUp(2);
      AddBodyLuck(100);
      AddGameDataLog('12' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_Abil.Level) + #9 +
                     IntToStr(m_Abil.Exp) + #9 +
                     m_sCharName + #9 +
                     '0' + #9 +
                     '0' + #9 +
                     '1' + #9 +
                     '0' + #9 + '[升级]');
      IncHealthSpell(2000, 2000);

      try
        if g_FunctionNPC <> nil then begin
          TPlayObject(m_Master).m_nScriptGotoCount := 0;
          g_FunctionNPC.GotoLable(TPlayObject(m_Master), '@HeroGetExp', False);
        end;
      except
        MainOutMessage('[Exception] THeroObject::GetExp GotoLable HeroGetExp');
      end;

      if lwExp > 0 then begin
        goto RefExp;
        Exit;
      end;

    end;
  end else begin
    if m_Abil.MaxExp > m_Abil.Exp then begin     //老馆利牢 版氰摹 甸绢坷绰何盒
      Inc(m_Abil.Exp, lwExp);

      AddBodyLuck(lwExp * 0.002);

      try
        if g_FunctionNPC <> nil then begin
          TPlayObject(m_Master).m_nScriptGotoCount := 0;
          g_FunctionNPC.GotoLable(TPlayObject(m_Master), '@HeroGetExp', False);
        end;
      except
        MainOutMessage('[Exception] THeroObject::GetExp GotoLable HeroGetExp');
      end;

    end else begin
      Inc(m_Abil.Level);
      Dec(m_Abil.Exp, m_Abil.MaxExp);
      if (m_Abil.Level in [10,20,30,40,50]) and (m_btLimitLevel = 0) then begin
        HasLevelUp(1);
        Exit;
      end;
      HasLevelUp(2);
      AddBodyLuck(100);
      AddGameDataLog('12' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_Abil.Level) + #9 +
                     IntToStr(m_Abil.Exp) + #9 +
                     m_sCharName + #9 +
                     '0' + #9 +
                     '0' + #9 +
                     '1' + #9 +
                     '0' + #9 + '[升级]');

      IncHealthSpell(2000, 2000);
      goto RefExp;
      Exit;

    end;
  end;
  SendMsg(Self, RM_WINEXP, 0, dwExp, 0, 0, '');
end;

procedure THeroObject.WinExp(dwExp: LongWord);
begin
  if m_btLimitLevel > 0 then exit;
  if m_Abil.Level > 500 {g_Config.nLimitExpLevel} then begin
    dwExp := 1; //g_Config.nLimitExpValue;
    GetExp(dwExp);
  end else
  if dwExp > 0 then begin
    dwExp := g_Config.dwKillMonExpMultiple * dwExp;
    dwExp := LongWord(m_nKillMonExpMultiple) * dwExp;
    dwExp := Round((m_nKillMonExpRate / 100) * dwExp);
    dwExp := Round((m_nKillMonExpRate2 / 100) * dwExp);
    dwExp := Round((m_nKillMonExpRate9 / 100) * dwExp);
    dwExp := Round((m_nKillMonExpRate11 / 100) * dwExp);

    if m_PEnvir.Flag.boEXPRATE then
      dwExp := Round((m_PEnvir.Flag.nEXPRATE / 100) * dwExp);
    if m_boExpItem then begin
      dwExp := Round(m_rExpItem * dwExp);
    end;

    GetExp(dwExp);
  end;
end;


procedure THeroObject.RestHero();
begin
  if m_btStatus = 1 then begin //绒侥惑怕老 版快
    m_SkillUseTick[0] := GetTickCount;  //公傍剐府淀捞 静绰芭 规瘤..
    m_btStatus := 0;
  end else begin
    m_btStatus := 1;
  end;

  m_Master.m_boSlaveRelax := m_btStatus = 1;   //绒侥
  case m_btStatus of
      0: begin
         if m_Master.m_SlaveList.Count < 1 then
          SysMsg('下属行动: 攻击', c_Green, t_Hint);
        end;
      1: begin
          m_boProtectStatus := False;
          m_boHeroBackCall := False;
          if m_Master.m_SlaveList.Count < 1 then
          SysMsg('下属行动: 休息', c_Green, t_Hint);
      end;
  end;
end;

function THeroObject.GetShowName(): string;
begin
  Result :=m_sCharName +'\'+ m_Master.m_sCharName + '的英雄';
end;

//取刺杀位 20080604
function THeroObject.GetGotoXY(BaseObject: TBaseObject; nCode:Byte): Boolean;
begin
  Result := False;
  Case nCode of
    2:begin//刺杀位
      if (m_nCurrX - 2 <= BaseObject.m_nCurrX) and
        (m_nCurrX + 2 >= BaseObject.m_nCurrX) and
        (m_nCurrY - 2 <= BaseObject.m_nCurrY) and
        (m_nCurrY + 2 >= BaseObject.m_nCurrY) and
        ((m_nCurrX <> BaseObject.m_nCurrX) or
        (m_nCurrY <> BaseObject.m_nCurrY)) then begin
        Result := True;
        if ((m_nCurrX - 2) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 2;
          m_nTargetY:= m_nCurrY;
          Exit;
        end;
        if ((m_nCurrX + 2) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 2;
          m_nTargetY:= m_nCurrY;
          Exit;
        end;
        if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY - 2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX ;
          m_nTargetY:= m_nCurrY - 2;
          Exit;
        end;
        if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY + 2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX ;
          m_nTargetY:= m_nCurrY + 2;
          Exit;
        end;
        if ((m_nCurrX - 2) = BaseObject.m_nCurrX) and ((m_nCurrY -2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 2;
          m_nTargetY:= m_nCurrY - 2;
          Exit;
        end;
        if ((m_nCurrX + 2) = BaseObject.m_nCurrX) and ((m_nCurrY - 2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 2;
          m_nTargetY:= m_nCurrY - 2;
          Exit;
        end;
        if ((m_nCurrX - 2) = BaseObject.m_nCurrX) and ((m_nCurrY + 2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 2;
          m_nTargetY:= m_nCurrY + 2;
          Exit;
        end;
        if ((m_nCurrX + 2) = BaseObject.m_nCurrX) and ((m_nCurrY + 2) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 2;
          m_nTargetY:= m_nCurrY + 2;
          Exit;
        end;
      end;
    end;//2
    3:begin//3格
      if (m_nCurrX - 3 <= BaseObject.m_nCurrX) and
        (m_nCurrX + 3 >= BaseObject.m_nCurrX) and
        (m_nCurrY - 3 <= BaseObject.m_nCurrY) and
        (m_nCurrY + 3 >= BaseObject.m_nCurrY) and
        ((m_nCurrX <> BaseObject.m_nCurrX) or
        (m_nCurrY <> BaseObject.m_nCurrY)) then begin
        Result := True;
        if ((m_nCurrX - 3) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 3;
          m_nTargetY:= m_nCurrY;
          Exit;
        end;
        if ((m_nCurrX + 3) = BaseObject.m_nCurrX) and (m_nCurrY = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 3;
          m_nTargetY:= m_nCurrY;
          Exit;
        end;
        if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY - 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX ;
          m_nTargetY:= m_nCurrY - 3;
          Exit;
        end;
        if (m_nCurrX = BaseObject.m_nCurrX) and ((m_nCurrY + 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX ;
          m_nTargetY:= m_nCurrY + 3;
          Exit;
        end;
        if ((m_nCurrX - 3) = BaseObject.m_nCurrX) and ((m_nCurrY - 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 3;
          m_nTargetY:= m_nCurrY - 3;
          Exit;
        end;
        if ((m_nCurrX + 3) = BaseObject.m_nCurrX) and ((m_nCurrY - 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 3;
          m_nTargetY:= m_nCurrY - 3;
          Exit;
        end;
        if ((m_nCurrX - 3) = BaseObject.m_nCurrX) and ((m_nCurrY + 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX - 3;
          m_nTargetY:= m_nCurrY + 3;
          Exit;
        end;
        if ((m_nCurrX + 3) = BaseObject.m_nCurrX) and ((m_nCurrY + 3) = BaseObject.m_nCurrY) then begin
          m_nTargetX:= m_nCurrX + 3;
          m_nTargetY:= m_nCurrY + 3;
          Exit;
        end;
      end;
    end;//3
  end;//Case
end;

function THeroObject.GotoTargetXY(nTargetX, nTargetY, nCode: Integer): Boolean;
begin
  case nCode of
    0:begin
      if (abs(m_nCurrX - nTargetX) >= 2{1}) or (abs(m_nCurrY - nTargetY) >= 2{1}) then begin
        Result := RunToTargetXY(nTargetX, nTargetY);
      end else begin
        Result := WalkToTargetXY2(nTargetX, nTargetY); //转向
      end;
    end;//0
    1:begin//躲避模式
      if (abs(m_nCurrX - nTargetX) >= 1) or (abs(m_nCurrY - nTargetY) >= 1) then begin
        Result := RunToTargetXY(nTargetX, nTargetY);
      end else begin
        Result := WalkToTargetXY2(nTargetX, nTargetY); //转向
      end;
    end;//1
  end;
end;

procedure THeroObject.Herowalk();
var nX,nY:integer;
begin
  if (self.m_Master <> nil) then  begin
    if m_boHeroCall then begin
      if m_Master.GetFrontPosition(nX, nY) then
      if (m_TargetCret <> nil) then begin
        m_TargetCret := nil;
        DelTargetCreat;
      end;
      TBaseObject(self).SpaceMove(self.m_PEnvir.sMapName,nX,nY,2);
      m_boHeroCall := False;
    end else begin
      if m_Master.GetFrontPositionEx(nX, nY) then
      if (not m_boProtectStatus) and (m_btStatus <> 1) then begin
        if ((m_PEnvir <> m_Master.m_PEnvir) or (abs(m_nCurrX - m_Master.m_nCurrX)> 10) or (abs(m_nCurrY - m_Master.m_nCurrY)> 10)) then begin
          if (m_TargetCret <> nil) then begin
            m_TargetCret := nil;
            DelTargetCreat;
          end;
          TBaseObject(self).SpaceMove(self.m_PEnvir.sMapName,nX,nY,2);
        end;
      end else begin
        if (m_btStatus = 1) then begin
          if ((m_PEnvir <> m_Master.m_PEnvir)) then begin
            if (m_TargetCret <> nil) then begin
              m_TargetCret := nil;
              DelTargetCreat;
            end;
            TBaseObject(self).SpaceMove(self.m_PEnvir.sMapName,nX,nY,2);
          end;
        end;
      end;
    end;

  end;
end;


procedure THeroObject.Initialize();
begin
  inherited;
end;


function THeroObject.IsNeedGotoXY(): Boolean; //鸥南俊霸 蝶扼啊绰?
var
  dwAttackTime: LongWord;
begin
  Result := False;
  if (m_TargetCret <> nil) and (GetTickCount - m_dwAutoAvoidTick > 1100) then begin    //康旷傈荤 康旷磊按
    if m_btJob in [1,2] then begin   //康旷贱荤 康旷档荤
      if (m_btStatus <> 1) and (not m_boIsUseMagic) and ((abs(m_TargetCret.m_nCurrX - m_nCurrX) > 3) or (abs(m_TargetCret.m_nCurrY - m_nCurrY) > 3)) then begin
        Result := True;
        Exit;
      end;
      if (m_btStatus <> 1) and (m_Abil.Level < 22) then begin
        Result := True;
        Exit;
      end;
    end else begin
      Result := True;
      Exit;
    end;
  end;
end;

function THeroObject.IsNeedAvoid(): Boolean;
begin
  Result := False;
  if ((GetTickCount - m_dwAutoAvoidTick) > 1100) and m_boIsUseMagic then begin
    if (m_btJob in [1,2]) and (m_btStatus <> 1) and ((m_nSelectMagic = 0) or (m_WAbil.HP <= Round(m_WAbil.MaxHP * 0.25))) then begin  //康旷贱荤 康旷档荤
      m_dwAutoAvoidTick := GetTickCount();
      case m_btJob of
        1:if CheckTargetXYCount(m_nCurrX, m_nCurrY, 4) > 0 then begin      //康旷贱荤
            Result := True;
            Exit;
          end;
        2:if CheckTargetXYCount(m_nCurrX, m_nCurrY, 4{3}) > 0 then begin     //康旷档荤
            Result := True;
            Exit;
          end;
      end;
    end;
    if (not Result) and (m_WAbil.HP <= Round(m_WAbil.MaxHP * 0.15)) then Result := True;//20080711
  end;
end;

function THeroObject.IsSearchTarget: Boolean;
begin
  Result := False;
  if (m_TargetCret <> nil) then begin   //鸥百捞 乐促..
    if (m_TargetCret = Self) then m_TargetCret := nil;       //鸥百捞 唱促? //鸥百阑 绝局霖促.
  end;
  if (m_TargetCret = nil) and ((GetTickCount - m_dwSearchEnemyTick) > 400) and (m_btStatus = 0) then begin    //鸥百捞 绝促. 0.4檬付促 鸥百阑 茫澜,, 傍拜啊瓷惑怕老锭
    m_dwSearchEnemyTick := GetTickCount;
    Result := True;
    Exit;
  end;
end;


procedure THeroObject.RecalcLevelAbilitys();
var
  nLevel, n: Integer;
begin
  nLevel := m_Abil.Level;
  case m_btJob of
    3: begin   //康旷磊按    THeroObject.RecalcLevelAbilitys();
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / 5 + 3.4 + nLevel / 52) * nLevel)));
      m_Abil.MaxMP:=_MIN(High(Word),11 + ROUND(nLevel * 5));

      m_Abil.MaxWeight:=67 + ROUND((nLevel / 3.6) * nLevel);
      m_Abil.MaxWearWeight:=15 + ROUND((nLevel / 35) * nLevel);
      m_Abil.MaxHandWeight:=12 + ROUND((nLevel / 28) * nLevel);

      m_Abil.DC:= MakeLong(_MAX((nLevel div 5) - 1, 1), _MAX(1, (nLevel div 5)));      //颇鲍
      m_Abil.SC:= 0;
      m_Abil.MC:= 0;
      m_Abil.AC:=MakeLong(0, (nLevel div 14));
      m_Abil.MAC:= MakeLong(_MAX((nLevel div 10) - 1, 0), _MAX((nLevel div 6) - 1, 1));
    end;

    2: begin   //康旷档荤     THeroObject.RecalcLevelAbilitys();
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfTaosHP + g_Config.nLevelValueOfTaosHPRate) * nLevel)));

      m_Abil.MaxMP:=_MIN(High(Word),13 + ROUND(((nLevel / g_Config.nLevelValueOfTaosMP)* 2.2 * nLevel)));

      m_Abil.MaxWeight:=50 + ROUND((nLevel / 4) * nLevel);
      m_Abil.MaxWearWeight:=15 + ROUND((nLevel / 50) * nLevel);
      m_Abil.MaxHandWeight:=12 + ROUND((nLevel / 42) * nLevel);

      n:=nLevel div 7;
      m_Abil.DC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.MC:=0;
      m_Abil.SC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.AC:=0;

      n:=ROUND(nLevel / 6);
      m_Abil.MAC:=MakeLong(n div 2, n + 1);
    end;
    1: begin    //康旷贱荤     THeroObject.RecalcLevelAbilitys();
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfWizardHP + g_Config.nLevelValueOfWizardHPRate) * nLevel)));

      m_Abil.MaxMP:=_MIN(High(Word),13 + ROUND((nLevel / 5 + 2) * 2.2 * nLevel));
      m_Abil.MaxWeight:=50 + ROUND((nLevel / 5) * nLevel);
      m_Abil.MaxWearWeight:= 15 + ROUND((nLevel / 100) * nLevel);
      m_Abil.MaxHandWeight:= 12 + ROUND((nLevel / 90) * nLevel);

      n:=nLevel div 7;
      m_Abil.DC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.MC:=MakeLong(_MAX(n-1, 0), _MAX(1, n));
      m_Abil.SC:=0;
      m_Abil.AC:=0;
      m_Abil.MAC:=0;
    end;
    0: begin    //康旷傈荤  THeroObject.RecalcLevelAbilitys();
      m_Abil.MaxHP:=_MIN(High(Word),14 + ROUND(((nLevel / g_Config.nLevelValueOfWarrHP + g_Config.nLevelValueOfWarrHPRate + nLevel / 20) * nLevel)));

      m_Abil.MaxMP:=_MIN(High(Word),11 + ROUND(nLevel * 3.5));
      m_Abil.MaxWeight:= 50 + ROUND((nLevel / 3) * nLevel);
      m_Abil.MaxWearWeight:= 15 + ROUND((nLevel / 20) * nLevel);
      m_Abil.MaxHandWeight:= 12 + ROUND((nLevel / 13) * nLevel);

      m_Abil.DC:= MakeLong(_MAX((nLevel div 5) - 1, 1), _MAX(1, (nLevel div 5)));
      m_Abil.SC:= 0;
      m_Abil.MC:= 0;
      m_Abil.AC:= MakeLong(0, (nLevel div 11));
      m_Abil.MAC:= 0;
    end;

  end;
  if m_Abil.HP > m_Abil.MaxHP then m_Abil.HP := m_Abil.MaxHP;
  if m_Abil.MP > m_Abil.MaxMP then m_Abil.MP := m_Abil.MaxMP;
end;

procedure THeroObject.RecalcAbilitys;
begin
  inherited;
  SendUpdateMsg(Self, RM_CHARSTATUSCHANGED, m_nHitSpeed, m_nCharStatus, 0, 0, '');
end;

//英雄登录
procedure THeroObject.LogOn();
var
  I, k, nRecog, nError: Integer;
  II: Integer;
  UserItem: pTUserItem;
  UserItem1: pTUserItem;
  UItem:TUserItem;
  StdItem: TItem;
  s14: string;
  sItem: string;
  Magic: pTMagic;
  boot: Boolean;
  UserMagic: pTUserMagic;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::LogOn:%d';
begin
  nError := 0;
  try
    m_boHeroLogOnOK := True;
    m_dwHeroLogOnTick := GetTickCount();
    m_dLogonTime := Now();                  //包府磊矫胶袍
    m_dwLogonTick := GetTickCount();        //包府磊矫胶袍
    m_nHeroLogOnCount := 0;
    nError := 1;
    if m_boNewHero then begin
      New(UserItem);
      nError := 3;
      if m_btJob = 4 then begin      //流诀函版
        if UserEngine.CopyToUserItemFromName(g_Config.sBonzeWeapon,UserItem) then begin
          m_ItemList.Add(UserItem);
        end else Dispose(UserItem);
      end else begin
        if m_btJob in [3,8] then begin
          if UserEngine.CopyToUserItemFromName(g_Config.sAssassinWeapon,UserItem) then begin
            m_ItemList.Add(UserItem);
          end else Dispose(UserItem);
        end else begin
         if UserEngine.CopyToUserItemFromName(g_Config.sWoodenSword,UserItem) then begin
            m_ItemList.Add(UserItem);
          end else Dispose(UserItem);
        end;
      end;
      New(UserItem);
      nError := 4;
      if m_btGender = 0 then sItem := g_Config.sClothsMan
       else sItem := g_Config.sClothsWoman;
      nError := 5;
      if UserEngine.CopyToUserItemFromName(sItem, UserItem) then begin
        m_ItemList.Add(UserItem);
      end else Dispose(UserItem);
    end;
    nError := 6;
    for I := m_ItemList.Count - 1 downto 0 do begin
      if m_ItemList.Count <= 0 then Break;
      UserItem := m_ItemList.Items[I];
      nError := 7;
      if (UserEngine.GetStdItemName(UserItem.wIndex) = '') then begin
        Dispose(pTUserItem(m_ItemList.Items[I]));
        m_ItemList.Delete(I);
      end;
      nError := 8;
    end;
    nError := 9;
    if g_Config.boCheckUserItemPlace then begin
      for I := Low(THeroItems) to High(THeroItems) do begin
        if m_UseItems[I].wIndex > 0 then begin
          StdItem := UserEngine.GetStdItem(m_UseItems[I].wIndex);
          if StdItem <> nil then begin
            nError := 10;
            if not CheckUserItems(I,StdItem) then begin
              New(UserItem);
              UserItem^:=m_UseItems[I];
              if not AddItemToBag(UserItem,boot) then begin
                m_ItemList.Insert(0,UserItem);
              end;
              m_UseItems[I].wIndex:=0;
             end;
           end else m_UseItems[I].wIndex:=0;
        end;
      end;
    end;
    nError := 11;
    for I := Low(m_dwStatusArrTick) to High(m_dwStatusArrTick) do begin
      if m_wStatusTimeArr[I] > 0 then m_dwStatusArrTick[I] := GetTickCount();
    end;
    nError := 12;
    RecalcLevelAbilitys();
    nError := 13;
    RecalcAbilitys();
    nError := 14;
    nError := 15;
    if (g_ManageNPC <> nil) and (m_Master <> nil) then begin
      TPlayObject(m_Master).m_nScriptGotoCount := 0;
      g_ManageNPC.GotoLable(TPlayObject(m_Master),'@HeroLogin', False);
    end;
    nError := 16;
    m_boFixedHideMode := False;
    nError := 17;
    SendRefMsg(RM_HEROLOGON, MakeWord(m_btDirection, m_btJob), Integer(Self), m_nCurrX, m_nCurrY, '');
    nError := 18;
    nRecog := GetFeatureToLong();
    nError := 19;
    SendDefMessage(SM_FEATURECHANGED, Integer(Self), LoWord(nRecog), HiWord(nRecog), GetFeatureEx, '');
    nError := 20;
    SendMsg(Self, RM_SENDUSEITEMS, 0, 0, 0, 0, '');
    nError := 21;
    m_Abil.MaxExp := GetLevelExp(m_Abil.Level);
    nError := 22;
    SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
    nError := 23;
    SendMsg(Self, RM_SUBABILITY, 0, 0, 0, 0, '');
    nError := 24;
    SendMsg(Self, RM_QUERYBAGITEMS, 0, 0, 0, 0, '');
    nError := 25;
    SendMsg(Self, RM_SENDUSEITEMS, 0, 0, 0, 0, '');
    nError := 26;
    SendMsg(Self, RM_SENDMYMAGIC, 0, 0, 0, 0, '');
    nError := 27;
    SendMsg(Self, RM_HEROLOGON_OK, 0, 0, 0, 0, '');
    nError := 28;
    SendMsg(Self, RM_QUERYAUTOITEMS, 0, 0, 0, 0, '');

    if (g_ManageNPC <> nil) and (m_Master <> nil) then begin
      nError := 29;
      TPlayObject(m_Master).m_nScriptGotoCount := 0;
      nError := 30;
      g_ManageNPC.GotoLable(TPlayObject(m_Master), '@HeroLogin', False);
      nError := 31;
    end;

    RecalcHeroAddAbilitys();
    TPlayObject(m_Master).RecalcHeroAddAbilitys;
    if m_Master.m_boSlaveRelax then m_btStatus := 1;   //林牢捞 捞固 绒侥疙飞阑 郴啡促搁

  except
    on E: Exception do begin
      MainOutMessage(Format(sExceptionMsg, [nError]));
    end;
  end;
end;


procedure THeroObject.DropUseItems(BaseObject: TBaseObject; DieFromMob : Boolean);
var
  I: Integer;
  nRate: Integer;
  StdItem: TItem;
  DelList: TStringList;
  tCode:integer;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::DropUseItems : %d';
begin
  DelList := nil;
  tCode:=0;
  if m_boNoDropUseItem or m_boDropDurg then Exit;
  try
    tCode:=0;
    if (m_btRaceServer = RC_HEROOBJECT) then begin
      StdItem:=UserEngine.GetStdItem(m_UseItems[U_CHARM].wIndex);
      if StdItem <> nil then begin
        if ( (StdItem.StdMode = 63) and (StdItem.Shape = 5) ) then begin    //汗炼府
          tCode:=1;
          if DieFromMob then begin
            if StdItem.boCanDeathDrop then begin
              tCode:=2;
              if dellist = nil then dellist := TStringList.Create;
              tCode:=3;
              dellist.AddObject(UserEngine.GetStdItemName(m_UseItems[U_CHARM].wIndex), TObject(m_UseItems[U_CHARM].MakeIndex));
              tCode:=4;
              if StdItem.NeedIdentify = 1 then
                AddGameDataLog('16' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     StdItem.Name + #9 +
                     IntToStr(m_UseItems[U_CHARM].MakeIndex) + #9 +
                     BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                     '0'  + #9 + '[英雄爆出物品]');
              m_UseItems[U_CHARM].wIndex := 0;
              tCode:=5;
            end;
          end;
          m_boNoDropBagItem := True;  //啊规袍 焊龋
          tCode:=6;
          if DelList <> nil then begin
            tCode:=7;
            SendMsg(Self, RM_SENDDELITEMLIST, 0, Integer(DelList), 0, 0, '');
          end;
          Exit;
        end;
      end;
      //檬去矫府令 荤扼咙
      for i:=0 to U_CHARM do begin
            // 各茄抛 磷篮霸 酒聪搁 救荤扼柳促.
        if (i = U_CHARM) and (not DieFromMob) then continue;

        StdItem := UserEngine.GetStdItem (m_UseItems[i].wIndex);
        if StdItem <> nil then begin
          if ( StdItem.Reserved and 8 ) <> 0 then begin
             // 檬去矫府令档 各茄抛 磷篮霸 酒聪搁 救荤扼咙(sonmg 2004/06/24)
            if not DieFromMob then continue;
            tCode:=8;
            if DelList = nil then DelList := TStringList.Create;
               //滚弊 荐沥(sonmg 2005/03/14)
            DelList.AddObject(UserEngine.GetStdItemName(m_UseItems[i].wIndex), TObject(m_UseItems[i].MakeIndex));

            if StdItem.NeedIdentify = 1 then
              AddGameDataLog('16' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     StdItem.Name + #9 +
                     IntToStr(m_UseItems[i].MakeIndex) + #9 +
                     BoolToIntStr(m_btRaceServer = RC_PLAYOBJECT) + #9 +
                     '0'  + #9 + '[英雄爆出物品消失]');
              m_UseItems[i].wIndex := 0;
          end;
        end;
      end;
    end;

    nRate := g_Config.nHeroDieDropUseItemRate;

    for I := Low(THeroItems) to High(THeroItems) do begin
      if Random(nRate) = 0 then begin
        if (i = U_WEAPON) and (PKLevel < 3) then begin
          if Random(2) = 0 then continue;
        end;
        StdItem:=UserEngine.GetStdItem(m_UseItems[I].wIndex);
        if StdItem <> nil then begin
          if (m_btRaceServer = RC_HEROOBJECT) and (StdItem.Reserved and 10 = 0) then begin  //磷绢档 冻绢瘤瘤 臼绰 酒捞袍篮 力寇(bug荐沥 sonmg 2006/01/27)
            tCode:=9;
            if InDisableTakeOffList(m_UseItems[I].wIndex) or (not StdItem.boCanDeathDrop) or (m_UseItems[I].btValue[19] > 0) then Continue;

            if DropItemDown(@m_UseItems[I], 2, True, BaseObject, Self) then begin
              tCode:=14;
              if DelList = nil then DelList := TStringList.Create;
              DelList.AddObject(UserEngine.GetStdItemName(m_UseItems[U_CHARM].wIndex), TObject(m_UseItems[I].MakeIndex));
              m_UseItems[I].wIndex := 0;
            end;
          end;
        end;
      end;
    end;
    tCode:=15;
    if DelList <> nil then
      SendMsg(Self, RM_SENDDELITEMLIST, 0, Integer(DelList), 0, 0, '');
  except
    MainOutMessage(format(sExceptionMsg,[tCode]));
  end;
end;


procedure THeroObject.ScatterBagItems(ItemOfCreat: TBaseObject);
var
  I, DropWide: Integer;
  drcount, icount: integer;
  pu, newpu: PTUserItem;
  pstd: TItem;
  DelList: TStringList;
  tCode:integer;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::ScatterBagItems d%';
begin
  DelList := nil;
  if m_PEnvir.Flag.boNODROPITEM or m_boDropDurg then Exit; //不死戒指

  if m_boNoDropBagItem then begin
    m_boNoDropBagItem := false;
    Exit;
  end;

  DropWide := 2;

  tCode:=0;
  try
    tCode:=0;
    for I := m_ItemList.Count - 1 downto 0 do begin
      pu := pTUserItem(m_ItemList[I]);
      pstd := UserEngine.GetStdItem (pu.wIndex);
      tCode:=1;
      if pstd = nil then continue;
      tCode:=2;
      //磷菌阑锭 惑泅林赣聪绰 救冻备霸...(sonmg 2004/08/09)
      if (pstd.StdMode = 48) then continue;    //惑泅酒捞袍
      tCode:=3;
      if (m_btRaceServer = RC_HEROOBJECT) and ((not pstd.boCanDeathDrop) or (pu.btValue[19] > 0)) then continue;    //扁埃力, 豪牢
      tCode:=4;

      if (Random(g_Config.nHeroDieScatterBagRate) = 0) then begin
        if pstd.StdMode in [0,1,3,45,46] then begin
          icount := pu.Amount;
          drcount := _MAX(1, Random (icount div 2));  //例措肺 促 冻绢瘤瘤 臼澜
          icount := _MAX(0, icount - drcount); //荐沥(sonmg)
          if drcount > 0 then begin
            new (newpu);
            if UserEngine.CopyToUserItemFromName(pstd.Name, newpu) then begin
              newpu.Amount := drcount;
              if DropItemDown(newpu, DropWide, True, ItemOfCreat, Self) then begin
                pu.Amount := icount;
                if pu.Amount <= 0 then begin
                  pu := PTUserItem(m_ItemList[i]);
                  if m_btRaceServer = RC_HEROOBJECT then begin
                    if dellist = nil then dellist := TStringList.Create;
                                 //巢篮俺荐 0牢 酒捞袍阑 瘤快扁 困秦 努扼捞攫飘俊 舅覆.
                    tCode:=5;
                    dellist.AddObject(UserEngine.GetStdItemName(pu.wIndex), TObject(pu.MakeIndex));
                  end;
                  Dispose(PTUserItem(m_ItemList[i]));
                  m_ItemList.Delete (i);
                end else begin
                  tCode:=6;
                  SendMsg(self, RM_COUNTERITEMCHANGE, 0, pu.MakeIndex, pu.Amount, 0, FilterStdShowName(pstd,pstd.Name));
                end;
              end;
            end;
            tCode:=7;
            if newpu <> nil then Dispose( newpu );   // Memory Leak sonmg
          end;
        end else begin
          // 阁胶磐 靛酚 堡籍 鉴档 炼例.
          tCode:=8;
          pu := PTUserItem(m_ItemList[i]);
          tCode:=9;
          if DropItemDown(pu, DropWide, True, ItemOfCreat, Self) then begin
            if m_btRaceServer = RC_HEROOBJECT then begin
              tCode:=10;
              if DelList = nil then DelList := TStringList.Create;
              tCode:=11;
              DelList.AddObject(UserEngine.GetStdItemName(pu.wIndex), TObject(pu.MakeIndex));
            end;
            tCode:=12;
            m_ItemList.Delete(I);
            Dispose(pu);
          end;
          tCode:=13;
        end;
      end;
    end;
    if (DelList <> nil) then begin
      tCode:=14;
      SendMsg(Self, RM_SENDDELITEMLIST, 0, Integer(DelList), 0, 0, '');
    end;
  except
    MainOutMessage(format(sExceptionMsg,[tCode]));
  end;
end;

procedure THeroObject.LogOut(); //肺弊酒眶
var
  K :Integer;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::LogOut';
begin
 // UnHeroGroup;
  if m_boHeroLogOut then Exit;

  for K:=Low(m_dwStatusArrTick) to High(m_dwStatusArrTick) do begin  //胶抛捞飘 波林扁
    if K in [0..5,7..13,15..19,20..26] then begin   //胶抛捞飘
      if (m_wStatusTimeArr[K] > 0) then  m_wStatusTimeArr[K]:=0;
    end;
  end;

  m_boHeroLogOut := True;

  if (g_ManageNPC <> nil) and (m_Master <> nil) then begin
    TPlayObject(m_Master).m_nScriptGotoCount := 0;
    try
      g_ManageNPC.GotoLable(TPlayObject(m_Master), '@HeroLogOut', False);
    except
      MainOutMessage(sExceptionMsg + ' FunctionNPC::GotoLable @HeroLogOut');
    end;
  end;
  TPlayObject(m_Master).RecalcHeroAddAbilitys;
  SendRefMsg(RM_HEROLOGOUT, 0, Integer(Self), m_nCurrX, m_nCurrY, '');
  SendMsg(Self, RM_MAKEGHOST, 0, 0, 0, 0, '');
end;


procedure THeroObject.RefBagItemCount;
var
  I: Integer;
  nOldBagCount: Integer;
begin
  nOldBagCount := m_nItemBagCount;
  for I := High(g_Config.HeroBagItemCounts) downto Low(g_Config.HeroBagItemCounts) do begin
    if m_Abil.Level > g_Config.HeroBagItemCounts[I] then begin
      case I of
        0: m_nItemBagCount := 10;
        1: m_nItemBagCount := 10;
        2: m_nItemBagCount := 18;
        3: m_nItemBagCount := 26;
        4: m_nItemBagCount := 34;
        5: m_nItemBagCount := 42;
      end;
      Break;
    end;
  end;
  if nOldBagCount <> m_nItemBagCount then begin
    SendDefMessage(SM_HEROBAGCOUNT, Integer(Self), m_nItemBagCount, 0, 0, '');
  end;
end;


procedure THeroObject.RecalcHeroAddAbilitys();//康旷 滚橇
var
  str:string;
  btJob: byte;
  btLevel: Integer;
begin
   if (not m_boDeath) and (not m_boHeroLogOut) then begin
     btJob := m_btJob;
     btLevel := m_Abil.Level;
     str := '';
     case btJob of
       0: begin  //康旷 傈荤
           if m_btLimitLevel <> 1 then begin
             if btLevel >= 10 then begin
               m_nPowerRate5 := 100 + btLevel div 10 + (m_nHeroGrade);    //傍仿
             end else
             m_nPowerRate5 := 100 + 1 + btLevel div 10;   //傍拜仿
             m_wStatusArrValue[85] := 5 + (btLevel div 10) * (m_nHeroGrade);  //弥措HP惑铰
           end else begin
             m_nPowerRate5 := 100 + 1;
             m_wStatusArrValue[85] := 5;
           end;
           str := str + 'MAXHP + ' + IntToStr(m_wStatusArrValue[85]) + '\攻击 ' + IntToStr(m_nPowerRate5 - 100);
         end;
       1: begin //康旷 贱荤
           if m_btLimitLevel <> 1 then begin
             m_nKillMonExpRate9 := 100 + 1 + btLevel div 10;
             m_wStatusArrValue[86] := 5 + (btLevel div 10) * (m_nHeroGrade);  //弥措MP惑铰
           end else begin
             m_nKillMonExpRate9 := 100 + 1;
             m_wStatusArrValue[86] := 5;
           end;
           str := str + 'MAXMP + ' + IntToStr(m_wStatusArrValue[86]) + '\经验值 + ' + IntToStr(m_nKillMonExpRate9 - 100) + '%';
         end;
       2: begin //康旷 档荤
           if m_btLimitLevel <> 1 then begin
             if btLevel >= 10 then begin
               m_nPowerRate5 := 100 + btLevel div 10 + (m_nHeroGrade);    //傍仿
             end else
             m_nPowerRate5 := 100 + 1 + btLevel div 10;   //傍拜仿
             m_wStatusArrValue[87] := 5 + (btLevel div 10) * (m_nHeroGrade);  //眉仿雀汗
           end else begin
             m_nPowerRate5 := 100 + 1;
             m_wStatusArrValue[87] := 5;
           end;
           str := str + '生命恢复 + ' + IntToStr(m_wStatusArrValue[87]) + '%\攻击 ' + IntToStr(m_nPowerRate5 - 100);
         end;
       3: begin  //康旷 磊按
           if m_btLimitLevel <> 1 then begin
             m_wStatusArrValue[88] := 1 + btLevel div 10;    //沥犬
             m_wStatusArrValue[89] := 5 + (btLevel div 10) * (m_nHeroGrade);  //付仿雀汗
           end else begin
             m_wStatusArrValue[88] := 1;
             m_wStatusArrValue[89] := 5;
           end;
           str := str + '魔法恢复 + ' + IntToStr(m_wStatusArrValue[89]) + '%\准确 ' + IntToStr(m_wStatusArrValue[88]);
         end;
     end;
     SendMsg(self,RM_BUFF, 115, 0, 44, 1, '[ 康旷滚橇 ]\' + str); //康旷 滚橇
   end else begin
     m_wStatusArrValue[85] := 0;
     m_wStatusArrValue[86] := 0;
     m_wStatusArrValue[87] := 0;
     m_wStatusArrValue[88] := 0;
     m_wStatusArrValue[89] := 0;
     m_nPowerRate5 := 100;
     m_nKillMonExpRate9 := 100;
     SendMsg(self,RM_BUFF, 115, 0, 44, 0, ''); //康旷 滚橇
   end;
   RecalcAbilitys;
   SendMsg(Self,RM_ABILITY,0,0,0,0,'');
   SendMsg(Self,RM_SUBABILITY,0,0,0,0,'');
end;

function THeroObject.LevelUpFunc: Boolean;
begin
  Result := False;  //
  if (g_FunctionNPC <> nil) and (m_Master <> nil) then begin
    //NpcGotoLable(g_FunctionNPC, g_FunctionNPC.FGotoLable[NHeroLevelUp], False);
    Result := True;
  end;
end;
                    {

function THeroObject.Operate(ProcessMsg: pTProcessMessage): Boolean;
begin
  Result := True;
  if ProcessMsg = nil then begin
    Result := False;
    Exit;
  end;
  case ProcessMsg.wIdent of
    RM_STRUCK: begin//受物理打击
      if (ProcessMsg.BaseObject = Self) and (TBaseObject(ProcessMsg.nParam3 ) <> nil) then begin
        if (TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_PLAYOBJECT) then begin//20080531 增加
          if (not TBaseObject(ProcessMsg.nParam3).InSafeZone) and (not InSafeZone) then begin
             SetLastHiter(TBaseObject(ProcessMsg.nParam3 ));//设置最后打击自己的人
             Struck(TBaseObject(ProcessMsg.nParam3));
             BreakHolySeizeMode();
          end;
        end else begin
          SetLastHiter(TBaseObject(ProcessMsg.nParam3 ));//设置最后打击自己的人
          Struck(TBaseObject(ProcessMsg.nParam3));
          BreakHolySeizeMode();
        end;
        if (m_Master <> nil) and
          (TBaseObject(ProcessMsg.nParam3) <> m_Master) and
          ((TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_PLAYOBJECT) or
           (TBaseObject(ProcessMsg.nParam3).m_btRaceServer = RC_HEROOBJECT)) then begin//英雄灰色 20080721
           m_Master.SetPKFlag(TBaseObject(ProcessMsg.nParam3));
        end;
        if g_Config.boMonSayMsg then MonsterSayMsg(TBaseObject(ProcessMsg.nParam3), s_UnderFire);
      end;
      Result := True;
    end;
  else begin
    Result := inherited Operate(ProcessMsg);
  end;
  end;
end;          }

procedure THeroObject.WeightChanged;
begin
  if m_Master = nil then Exit;
  m_WAbil.Weight := RecalcBagWeight();
  SendUpdateMsg(m_Master, RM_WEIGHTCHANGED, 0, 0, 0, 0, '');
end;

function THeroObject.FindMagic(wMagIdx: Word): pTUserMagic;
var
  UserMagic: pTUserMagic;
  I: Integer;
begin
  Result := nil;
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic := m_MagicList.Items[I];
    if UserMagic.MagicInfo.wMagicId = wMagIdx then begin
      Result := UserMagic;
      Break;
    end;
  end;
end;


function THeroObject.ReadBook(StdItem: TItem): Boolean;
var
  Magic: pTMagic;
  UserMagic: pTUserMagic;
begin
  Result := False;
  Magic := UserEngine.FindHeroMagic(StdItem.Name);
  if Magic <> nil then begin
    if not IsTrainingSkill(Magic.wMagicId) then begin
      if (Magic.btJob = 99) or (Magic.btJob = m_btJob) then begin
        if m_Abil.Level >= Magic.TrainLevel[0] then begin
          New(UserMagic);
          UserMagic.MagicInfo := Magic;
          UserMagic.wMagIdx := Magic.wMagicId;
          UserMagic.btKey := 0;
          UserMagic.btLevel := 0;
          UserMagic.nTranPoint := 0;
          m_MagicList.Add(UserMagic);
          RecalcAbilitys();
          SendAddMagic(UserMagic);
          SysMsg('英雄已经学过技能' + Magic.sMagicName + '了。', c_Green, t_Hint);
          Result := True;
        end;
      end; //else SysMsg('(英雄) 不能学习此技能！！！', c_Red, t_Hint);
    end; //else SysMsg('(英雄) 已经学过此技能,不能再学习！！！', c_Red, t_Hint);
  end;
end;

//跑到目标坐标
function THeroObject.RunToTargetXY(nTargetX, nTargetY: Integer): Boolean;
var
  nDir: Integer;
  n10: Integer;
  n14: Integer;
begin
  Result := False;
  if m_boTransparent and (m_boHideMode) then m_wStatusTimeArr[STATE_TRANSPARENT ] := 1;//20080902 隐身,一动就显身
  if (m_wStatusTimeArr[POISON_STONE] <> 0) and (not g_Config.ClientConf.boParalyCanSpell) then Exit;//麻痹不能跑动

  if GetTickCount()- m_dwRunIntervalTime >  g_Config.dwRunIntervalTime then
  begin//20080925
    n10 := nTargetX;
    n14 := nTargetY;
    nDir:= GetNextDirection(m_nCurrX , m_nCurrY, n10, n14);//20081005
    if not RunTo(nDir, False, nTargetX, nTargetY) then begin
       Result := WalkToTargetXY(nTargetX, nTargetY);
       if Result then dwTick3F4 := GetTickCount();
    end else begin
      if (abs(nTargetX - m_nCurrX) <= 1) and (abs(nTargetY - m_nCurrY) <= 1) then begin
        Result := True;
        m_dwRunIntervalTime:= GetTickCount();//
      end;
    end;
  end;
end;

procedure THeroObject.Run;
var
  nX, nY, nDir: Integer;
  nCheckCode: Byte;
resourcestring
  sExceptionMsg = 'THeroObject.Run Code:%d';
begin
  nCheckCode:= 0;

  try
    if (not m_boHeroLogOut) and CanMove and (not m_boFixedHideMode) and (not m_boStoneMode) then begin
      nCheckCode:= 11;
      if (not m_boHeroLogOnOK) and (m_nHeroLogOnCount < 3) then begin
        if GetTickCount - m_dwHeroLogOnTick > 1000 * 5 then begin
          m_dwHeroLogOnTick := GetTickCount();
          MainOutMessage('你确定要使用吗？');
          //  SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
          //  SendMsg(Self, RM_SUBABILITY, 0, 0, 0, 0, '');
          //  SendMsg(Self, RM_SENDUSEITEMS, 0, 0, 0, 0, '');
          //  SendMsg(Self, RM_QUERYBAGITEMS, 0, 0, 0, 0, '');
          //  SendMsg(Self, RM_QUERYAUTOITEMS, 0, 0, 0, 0, '');
          //  SendMsg(Self, RM_SENDMYMAGIC, 0, 0, 0, 0, '');
            SendMsg(Self, RM_HEROLOGON_OK, 0, 0, 0, 0, '');
          Inc(m_nHeroLogOnCount);
        end;
      end;


      Herowalk;
      if Think then begin
        inherited Run;
        Exit;
      end;

      nCheckCode:= 12;
      ItemTimeRun;
      nCheckCode:= 13;
      if m_boFireHitSkill and ((GetTickCount - m_dwLatestFireHitTick) > 20000) then begin     //堪拳搬 秦力..
        m_boFireHitSkill := False;
        SysMsg(sSpiritsGone, c_Red, t_Hint);
        SendSocket(nil, '+UFIR');
      end;

      if m_boTwinHitSkill = 2 then begin  //街锋曼 秦力
        m_boTwinHitSkill := 0;
        SendSocket(nil,'+UTWN');
      end;

      if GetTickCount - m_dwRateTick > 1000 then begin
        m_dwRateTick := GetTickCount();
        if m_dwKillMonExpRateTime > 0 then begin
          Dec(m_dwKillMonExpRateTime);
          if m_dwKillMonExpRateTime = 0 then begin
            m_nKillMonExpRate := 100;
            SysMsg('英雄的经验值恢复正常。', c_Green, t_Hint);
          end;
        end;
        if m_dwPowerRateTime > 0 then begin
          Dec(m_dwPowerRateTime);
          if m_dwPowerRateTime = 0 then begin
            m_nPowerRate := 100;
            SysMsg('英雄的攻击力恢复正常。', c_Green, t_Hint);
          end;
        end;
        if m_dwKillMonExpRateTime2 > 0 then begin
          Dec(m_dwKillMonExpRateTime2);
          if m_dwKillMonExpRateTime2 = 0 then begin
            m_nKillMonExpRate2 := 100;
            SysMsg('英雄的经验值恢复正常。', c_Green, t_Hint);
          end;
        end;
        if m_dwPowerRateTime3 > 0 then begin
          Dec(m_dwPowerRateTime3);
          if m_dwPowerRateTime3 = 0 then begin
            m_nPowerRate3 := 100;
            SysMsg('英雄的攻击力恢复正常。', c_Green, t_Hint);
          end;
        end;
      end;

      nCheckCode:= 2;

      if IsSearchTarget then SearchTarget(); //鸥百 茫扁

      if m_boWalkWaitLocked then begin
        if (GetTickCount - m_dwWalkWaitTick) > m_dwWalkWait then m_boWalkWaitLocked := False;
      end;

      if not m_boWalkWaitLocked and ((GetTickCount - m_dwWalkTick) > GetWalkSpeed) then begin
        m_dwWalkTick := GetTickCount();
        Inc(m_nWalkCount);
        if m_nWalkCount > m_nWalkStep then begin
          m_nWalkCount := 0;
          m_boWalkWaitLocked := True;
          m_dwWalkWaitTick := GetTickCount();
        end;

        if not m_boRunAwayMode then begin
          if not m_boNoAttackMode then begin
            if m_boHeroBackCall then begin //硼阿 疙飞
              m_Master.GetBackPosition(nX, nY);
              if GotoTargetXY(nX, nY, 1) then m_boHeroBackCall:= False;
            end;

            if m_boProtectStatus then begin //碍力捞悼老锭
              if GotoTargetXY(m_nProtectTargetX, m_nProtectTargetY, 1) then m_boProtectStatus:= False;
            end;
            nCheckCode:= 6;
            if (m_TargetCret <> nil) and ((m_btAiMode in [0,1]) or (m_boTarget and (m_btAiMode = 2))) and (not m_boProtectStatus) and (not m_boHeroBackCall) then begin
                nCheckCode:= 111;
              if AttackTarget then begin//攻击
                nCheckCode:= 70;
                inherited Run;
                Exit;
              end else
              if IsNeedAvoid then begin //傍拜窍哥 框流牢促. 各捞 腹酒瘤搁?
                nCheckCode:= 71;
                AutoAvoid();
                inherited Run;
                Exit;
              end else begin
                nCheckCode:= 112;
                if IsNeedGotoXY then begin//鸥南俊霸 蝶扼啊绰?
                  nCheckCode:= 72;
                  m_nTargetX:= m_TargetCret.m_nCurrX;
                  m_nTargetY:= m_TargetCret.m_nCurrY;

                  if (m_btJob in [1, 2]) then begin  //康旷贱荤 康旷档荤 3沫第肺
                    if (m_Abil.Level < 22) then begin//贱荤档荤绰 饭骇 22 捞饶俊.. 3沫第肺 捞悼茄促
                    end else GetGotoXY(m_TargetCret, 3);
                  end else begin
                    GotoTargetXY( m_nTargetX, m_nTargetY, 1);  //鸥百俊霸 啊绰巴..
                  end;
                  inherited Run;
                  Exit;
                 end;
              end;
            end else begin
              if not m_boProtectStatus then m_nTargetX := -1;
              if not m_boHeroBackCall then m_nTargetX := -1;
            end;
          end;
          nCheckCode:= 8;
          if m_TargetCret <> nil then begin
            m_nTargetX := m_TargetCret.m_nCurrX;
            m_nTargetY := m_TargetCret.m_nCurrY;
          end;
          nCheckCode:= 81;
          SearchViewRange;

          nCheckCode:= 9;
          if m_Master <> nil then begin
            if m_boHeroBackCall then begin //硼阿
              m_Master.GetBackPosition(nX, nY);
              if (abs(m_nCurrX - nX) > 1) or (abs(m_nCurrY - nY) > 1) then begin//康旷苞 瘤沥茄 芭府啊 9捞惑?
                m_nTargetX := nX;
                m_nTargetY := nY;
                m_TargetCret := nil;
              end else begin
                m_nTargetX := -1;
              end;
            end else begin

            if m_boProtectStatus then begin //碍力捞悼老锭
              if (abs(m_nCurrX - m_nProtectTargetX) > 2) or (abs(m_nCurrY - m_nProtectTargetY) > 2) then begin//康旷苞 瘤沥茄 芭府啊 9捞惑?
                m_nTargetX := m_nProtectTargetX;
                m_nTargetY := m_nProtectTargetY;
                m_TargetCret := nil;
              end else begin
                m_nTargetX := -1;
              end;
            end else begin        //瘤开规绢啊 酒匆锭
              if (m_TargetCret = nil) and (not m_boProtectStatus) and (not m_boHeroBackCall) and (m_btStatus <> 1) then begin      //绒侥葛靛 酒匆锭
                nCheckCode:= 95;
                m_Master.GetBackPosition(nX, nY);
                if (abs(m_nTargetX - nX) > 2{2}) or (abs(m_nTargetY - nY ) > 2{2}) then begin//林牢第肺...啊绰
                  m_nTargetX := nX;
                  m_nTargetY := nY;
                  if (abs(m_nCurrX - nX) <= 3{3}) and (abs(m_nCurrY - nY) <= 3{3}) then begin//20081016
                    if m_PEnvir.GetMovingObject(nX, nY, True) <> nil then begin
                      m_nTargetX := m_nCurrX;
                      m_nTargetY := m_nCurrY;
                    end;
                  end;
                end;
              end; //if m_TargetCret = nil then begin
            end;

            end;
            if (not m_boProtectStatus) and (not m_boHeroBackCall) and (m_btStatus <> 1) and //绒侥葛靛啊 酒聪哥
              ((m_PEnvir <> m_Master.m_PEnvir) or
              (abs(m_nCurrX - m_Master.m_nCurrX) > 10) or
              (abs(m_nCurrY - m_Master.m_nCurrY) > 10)) then begin     //林牢苞 鞍篮甘俊 绝栏哥 10沫 国绢脸阑锭
              nCheckCode:= 99;
              SpaceMove(m_Master.m_PEnvir.sMapName, m_nTargetX, m_nTargetY, 1);
            end;
            if (m_TargetCret <> nil) then begin  //鸥百捞 乐促.
              if (m_TargetCret.m_PEnvir <> m_PEnvir) then DelTargetCreat();  //鸥百苞 促弗甘捞搁 鸥百阑 绝局霖促.
            end;
          end; //if m_Master <> nil then begin
        end else begin
          if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin
            m_boRunAwayMode := False;
            m_dwRunAwayTime := 0;
          end;
        end;
        nCheckCode:= 10;
        if (m_TargetCret = nil) and (m_btStatus <> 1) then begin     //绒侥葛靛 酒聪哥 鸥百捞 绝阑锭
          if m_nTargetX <> -1 then begin
            if (abs(m_nCurrX - m_nTargetX) >= 1) or (abs(m_nCurrY - m_nTargetY) >= 1) then begin
              GotoTargetXY(m_nTargetX, m_nTargetY, 0);
            end;
          end else begin
            Wondering();
          end;
        end;
      end;
    end else begin
      if (not m_boGhost) and m_boDeath then begin
        if GetTickCount - m_dwDeathTick > 1000 * 30 then begin  //磷绊唱辑 30檬饶 荤扼柳促..
          LogOut;
        end;
      end;
    end;
    inherited Run;
  except
    on E: Exception do begin
      MainOutMessage(Format(sExceptionMsg, [nCheckCode]));
    end;
  end;
end;

procedure THeroObject.Die;
var
  AttackBaseObject: TBaseObject;
  nCode: Integer;
  I: Integer;
  tStr: string;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::Die Name:%s ErrorCode:%d';
begin
  m_boDeath := True;
  m_dwDeathTick := GetTickCount();
  m_nIncSpell := 0;
  m_nIncHealth := 0;
  m_nIncHealing := 0;
  nCode := 0;
  try
    nCode := 1;
    if m_LastHiter <> nil then begin
      if (m_LastHiter.m_btRaceServer in [RC_PLAYOBJECT]) then
        SysMsg(Format(g_sYouHeroKilledByMsg, [m_LastHiter.m_sCharName]), c_Red, t_Hint);
      if (m_LastHiter.m_Master <> nil) and (m_LastHiter.m_Master.m_btRaceServer in [RC_PLAYOBJECT]) then
        SysMsg(Format(g_sYouHeroKilledByMsg, [m_LastHiter.m_Master.m_sCharName]), c_Red, t_Hint);
    end;
    nCode := 2;
    if (not m_PEnvir.Flag.boFightZone) and
      (not m_PEnvir.Flag.boFight3Zone) then begin
      AttackBaseObject := m_ExpHitter;
      if (m_ExpHitter <> nil) and (m_ExpHitter.m_Master <> nil) then begin
        AttackBaseObject := m_ExpHitter.m_Master;
      end;
      nCode := 3;
      if (not m_boNoItem) and (not m_PEnvir.Flag.boNODROPITEM) and (not m_PEnvir.Flag.boSAFE) and (not m_PEnvir.Flag.boFightZone) and (not InStartZone) then begin
        AttackBaseObject := m_ExpHitter;
        if (m_ExpHitter <> nil) and (m_ExpHitter.m_Master <> nil) then begin
          AttackBaseObject := m_ExpHitter.m_Master;
        end;
        if AttackBaseObject <> nil then begin
          if (g_Config.boHeroKillByHumanDropUseItem and (AttackBaseObject.m_btRaceServer = RC_PLAYOBJECT)) then
            DropUseItems(nil, True);
          if (g_Config.boHeroKillByMonstDropUseItem and (AttackBaseObject.m_btRaceServer <> RC_PLAYOBJECT)) then
            DropUseItems(nil, True);
        end;
        if g_Config.boHeroDieScatterBag then ScatterBagItems(nil);
      end;
    end;
    nCode := 4;
    RecalcHeroAddAbilitys;
    TPlayObject(m_Master).RecalcHeroAddAbilitys;

    if m_LastHiter <> nil then begin
      if m_LastHiter.m_btRaceServer = RC_PLAYOBJECT then tStr := m_LastHiter.m_sCharName
      else tStr := '#' + m_LastHiter.m_sCharName;
    end else tStr := '####';
      AddGameDataLog('19' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     'FZ-' + BoolToIntStr(m_PEnvir.Flag.boFightZone) +
                     '_F3-' + BoolToIntStr(m_PEnvir.Flag.boFight3Zone) + #9 +
                     '0' + #9 +
                     '1' + #9 +
                     tStr + #9 + '[攻击 / 英雄死亡]');
    nCode := 5;
    SendRefMsg(RM_DEATH, m_btDirection, m_nCurrX, m_nCurrY, 1, '');
  except
    on E: Exception do begin
      MainOutMessage(Format(sExceptionMsg, [m_sCharName, nCode]));
      MainOutMessage(E.Message);
    end;
  end;
end;


procedure THeroObject.RepairAllItem();
var
  nWhere,RepCount: Integer;
  StdItem: TItem;
  boRepair: Boolean;
begin
  boRepair := False;
  for nWhere := Low(THeroItems) to High(THeroItems) do begin
    if m_UseItems[nWhere].wIndex > 0 then begin
      StdItem := UserEngine.GetStdItem(m_UseItems[nWhere].wIndex);
      if StdItem <> nil then begin
        if (m_UseItems[nWhere].DuraMax > m_UseItems[nWhere].Dura)
          and (StdItem.StdMode <> 7) and (StdItem.StdMode <> 25) and (StdItem.StdMode <> 30) and (StdItem.StdMode <> 63) then begin
          m_UseItems[nWhere].Dura := m_UseItems[nWhere].DuraMax;
          SendMsg(Self, RM_DURACHANGE, nWhere, m_UseItems[nWhere].Dura, m_UseItems[nWhere].DuraMax, 0, '');
          boRepair := True;
        end;
      end;
    end;
  end;
  if boRepair then begin
    SysMsg('英雄的所有装备都已经修理完毕。', c_Green, t_Hint); //20071229
  end;
end;

function THeroObject.RepairWeapon: Boolean;
var
  nDura: Integer;
  UserItem: pTUserItem;
begin
  Result := False;
  UserItem := @m_UseItems[U_WEAPON];
  if (UserItem.wIndex <= 0) or (UserItem.DuraMax <= UserItem.Dura) then Exit;
  Dec(UserItem.DuraMax, (UserItem.DuraMax - UserItem.Dura) div g_Config.nRepairItemDecDura {30});
  nDura := _MIN(5000, UserItem.DuraMax - UserItem.Dura);
  if nDura > 0 then begin
    Inc(UserItem.Dura, nDura);
    if m_btRaceServer = RC_HEROOBJECT then begin
      SendMsg(m_Master, RM_DURACHANGE, 1, UserItem.Dura, UserItem.DuraMax, 0, '');
      SysMsg('英雄的武器已被修复。', c_Green, t_Hint);
    end;
    Result := True;
  end;
end;

function THeroObject.SuperRepairWeapon: Boolean;
begin
  Result := False;
  if m_UseItems[U_WEAPON].wIndex <= 0 then Exit;
  m_UseItems[U_WEAPON].Dura := m_UseItems[U_WEAPON].DuraMax;
  if m_btRaceServer = RC_HEROOBJECT then begin
    SendMsg(m_Master, RM_DURACHANGE, 1, m_UseItems[U_WEAPON].Dura, m_UseItems[U_WEAPON].DuraMax, 0, '');
    SysMsg('英雄的武器已被修复。', c_Green, t_Hint);
  end;
  Result := True;
end;

procedure THeroObject.SysMsg(sMsg: string; MsgColor: TMsgColor; MsgType: TMsgType);
begin
  if m_Master = nil then Exit;
  m_Master.SysMsg(sMsg, MsgColor, MsgType);
end;

procedure THeroObject.SendAddMagic(UserMagic: pTUserMagic);
var
  ClientMagic: TClientMagic;
begin
  ClientMagic.Key := Char(UserMagic.btKey);
  ClientMagic.Level := UserMagic.btLevel;
  ClientMagic.CurTrain := UserMagic.nTranPoint;
  ClientMagic.Def:=UserMagic.MagicInfo^;
  m_DefMsg := MakeDefaultMsg(SM_HEROADDMAGIC, 0, 0, 0, 1);
  SendSocket(@m_DefMsg, EncodeBuffer(@ClientMagic, SizeOf(TClientMagic)));
end;

procedure THeroObject.SendDelMagic(UserMagic: pTUserMagic);
begin
  m_DefMsg := MakeDefaultMsg(SM_HERODELMAGIC, UserMagic.wMagIdx, 0, 0, 1);
  SendSocket(@m_DefMsg, '');
end;


procedure THeroObject.SendSocket(DefMsg: pTDefaultMessage; sMsg: string);
begin
  if m_Master = nil then Exit;

  TPlayObject(m_Master).SendSocket(DefMsg, sMsg);
end;

procedure THeroObject.SendDefMessage(wIdent: Word; nRecog: Integer; nParam, nTag, nSeries: Word; sMsg: string);
begin
  if m_Master = nil then Exit;

  TPlayObject(m_Master).SendDefMessage(wIdent, nRecog, nParam, nTag, nSeries, sMsg);
end;
    {
procedure THeroObject.SendMsg(BaseObject: TBaseObject; wIdent, wParam: Word; nParam1, nParam2, nParam3: Integer; sMsg: string);
begin
  if m_Master = nil then Exit;
  SendMsg(BaseObject, wIdent, wParam, nParam1, nParam2, nParam3, sMsg);
 // m_Master.SendMsg(BaseObject, wIdent, wParam, nParam1, nParam2, nParam3, sMsg);
end;

procedure THeroObject.SendUpdateMsg(BaseObject: TBaseObject; wIdent, wParam: Word;
  lParam1, lParam2, lParam3: Integer; sMsg: string);
begin
  if m_Master = nil then Exit;
  m_Master.SendUpdateMsg(BaseObject, wIdent, wParam, lParam1, lParam2, lParam3, sMsg);
end; }

procedure THeroObject.SendUpdateItem(UserItem: pTUserItem);
var
  StdItem:TItem;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: string;
begin

  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    opt := StdItem.GetItemAddValue(UserItem,ClientItem.S);
    sUserItemName := '';
    sUserItemName := FilterStdShowName(StdItem,StdItem.Name);
    if UserItem.btValue[11] = 1 then
      sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
    if sUserItemName <> '' then
      ClientItem.s.Name := FilterStdShowName(StdItem,sUserItemName);

    ClientItem.MakeIndex:=UserItem.MakeIndex;
    ClientItem.Dura:=UserItem.Dura;
    ClientItem.DuraMax:=UserItem.DuraMax;
    ClientItem.Amount:=UserItem.Amount;
    ClientItem.UpgradeOpt := opt;
    m_DefMsg:=MakeDefaultMsg(SM_HEROUPDATEITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
  end;
end;


//发送使用的物品,即身上的装备
procedure THeroObject.SendUseitems();
var
  i:Integer;
  Item:TItem;
  sSendMsg:String;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: string;
begin
  sSendMsg:='';
  for I := Low(THeroItems) to High(THeroItems) do begin
    if m_UseItems[i].wIndex > 0 then begin
      Item:=UserEngine.GetStdItem(m_UseItems[i].wIndex);
      if Item <> nil then begin
        Item.GetStandardItem(ClientItem.S);
        opt := Item.GetItemAddValue(@m_UseItems[i],ClientItem.S);

        sUserItemName := '';
        sUserItemName := FilterStdShowName(Item,Item.Name);
        if m_UseItems[I].btValue[11] = 1 then
          sUserItemName := ItemUnit.GetCustomItemName(m_UseItems[I].MakeIndex, m_UseItems[I].wIndex);
        if sUserItemName <> '' then
          ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

        ClientItem.Dura:=m_UseItems[i].Dura;
        ClientItem.DuraMax:=m_UseItems[i].DuraMax;
        ClientItem.MakeIndex:=m_UseItems[i].MakeIndex;
        ClientItem.UpgradeOpt := opt;
        sSendMsg:=sSendMsg + IntToStr(i) + '/' + EncodeBuffer(@ClientItem,SizeOf(TClientItem)) + '/';
      end;
    end;
  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_SENDHEROUSEITEMS,0,0,0,0);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;

procedure THeroObject.SendDelItemList(ItemList: TStringList);
var
  I: Integer;
  s10:String;
begin
  s10:='';
  for I := 0 to ItemList.Count - 1 do begin
    s10:=s10 + ItemList.Strings[i] + '/' + IntToStr(Integer(ItemList.Objects[i])) + '/';
  end;
  m_DefMsg:=MakeDefaultMsg(SM_HERODELITEMS,0,0,0,ItemList.Count);
  SendSocket(@m_DefMsg,EncodeString(s10));
end;

procedure THeroObject.SendDelItems(UserItem: pTUserItem);
var
  StdItem:TItem;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: string;
begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    opt := StdItem.GetItemAddValue(UserItem,ClientItem.S);
    sUserItemName := '';
    sUserItemName := FilterStdShowName(StdItem,StdItem.Name);
    if UserItem.btValue[11] = 1 then
      sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
    if sUserItemName <> '' then
      ClientItem.s.Name := FilterStdShowName(StdItem,sUserItemName);
    ClientItem.MakeIndex:=UserItem.MakeIndex;
    ClientItem.Dura:=UserItem.Dura;
    ClientItem.DuraMax:=UserItem.DuraMax;
    ClientItem.Amount:=UserItem.Amount;
    ClientItem.UpgradeOpt := opt;
    m_DefMsg:=MakeDefaultMsg(SM_HERODELITEM,Integer(Self),0,0,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
  end;
end;


procedure THeroObject.SendDelAutoItems(UserItem: pTUserItem);
var
  StdItem:TItem;
  ClientItem: TClientItem;
  sUserItemName: string;
  opt: integer;
begin
  StdItem := UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    opt := StdItem.GetItemAddValue(UserItem,ClientItem.S);

    sUserItemName := '';
    sUserItemName := FilterShowName(StdItem.Name);
    if UserItem.btValue[11] = 1 then
      sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
    if sUserItemName <> '' then
      ClientItem.s.Name := FilterShowName(sUserItemName);

    ClientItem.MakeIndex := UserItem.MakeIndex;
    ClientItem.Dura := UserItem.Dura;
    ClientItem.DuraMax := UserItem.DuraMax;
    ClientItem.UpgradeOpt := 0;
    ClientItem.Amount:=UserItem.Amount;

    m_DefMsg := MakeDefaultMsg(SM_HEROAUTODELITEM, Integer(m_Master), 0, 0, 1);
    SendSocket(@m_DefMsg, EncodeBuffer(@ClientItem, SizeOf(TClientItem)));
  end;
end;

procedure THeroObject.SendAddItem(UserItem: pTUserItem);
var
  Item:TItem;
  StdItem:TStdItem;
  ClientItem:TClientItem;
  PlayObject:TPlayObject;
  I :integer;
  CharName1:TCharName1;
  sSendMsg:String;
  sUserItemName, stditemname: string;
  opt: integer;
begin
  sSendMsg:= '';
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if not (Item.StdMode in [2,46]) then begin

  if (Item.Reserved and 16 <> 0) then begin
    stditemname:= FilterStdShowName(Item,Item.Name);
    if (self.m_btJob in [g_Bonze,g_BonzeUp]) then begin         //铰妨
      if self.m_WAbil.Level >= 80 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '60');
      end else if self.m_WAbil.Level >= 70 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '50');
      end else if self.m_WAbil.Level >= 60 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '40');
      end else if self.m_WAbil.Level >= 50 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '30');
      end else if self.m_WAbil.Level >= 40 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '20');
      end else if self.m_WAbil.Level >= 30 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '10');
      end else begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '00');
      end;
    end else begin
      if self.m_WAbil.Level >= 80 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '6');
      end else if self.m_WAbil.Level >= 70 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '5');
      end else if self.m_WAbil.Level >= 60 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '4');
      end else if self.m_WAbil.Level >= 50 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '3');
      end else if self.m_WAbil.Level >= 40 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '2');
      end else if self.m_WAbil.Level >= 30 then begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '1');
      end else begin
        UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName);
      end;
    end;
    Item:=UserEngine.GetStdItem(UserItem.wIndex);
  end;

  if (Item.Reserved and 32 <> 0) then begin
    stditemname := FilterStdShowName(Item,Item.Name);
    if (self.m_btJob in [g_Warrior,g_WarriorUp]) then
      UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '1');
    if (self.m_btJob in [g_Wizard,g_WizardUp])then
      UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '2');
    if (self.m_btJob in [g_Monk,g_MonkUp]) then
      UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '3');
    if (self.m_btJob in [g_Assassin,g_AssassinUp]) then                     //磊按
      UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '4');
    if (self.m_btJob in [g_Bonze,g_BonzeUp]) then                         //铰妨
      UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '5');
    Item:=UserEngine.GetStdItem(UserItem.wIndex);
  end;

  end;


  if Item = nil then exit;
  Item.GetStandardItem(ClientItem.S);
  opt := Item.GetItemAddValue(UserItem, ClientItem.S);

  sUserItemName := '';

  sUserItemName := FilterStdShowName(Item,Item.Name);

  if UserItem.btValue[11] = 1 then
    sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
  if sUserItemName <> '' then
    ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  ClientItem.Amount:=UserItem.Amount;
  ClientItem.UpgradeOpt := opt;
  m_DefMsg:=MakeDefaultMsg(SM_HEROADDITEM,Integer(Self),0,0,1);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;


procedure THeroObject.SendAddItemMode(UserItem:pTUserItem;idx:integer);      //拱距2
var
  Item: TItem;
  ClientItem:TClientItem;
  sUserItemName: string;
  opt: integer;
begin
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;
  Item.GetStandardItem(ClientItem.S);
  opt := Item.GetItemAddValue(UserItem, ClientItem.S);

  sUserItemName := '';
  sUserItemName := FilterStdShowName(Item,Item.Name);
  if UserItem.btValue[11] = 1 then
   sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
  if sUserItemName <> '' then
   ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  ClientItem.Amount:=UserItem.Amount;
  ClientItem.UpgradeOpt := opt;

  m_DefMsg:=MakeDefaultMsg(SM_HEROADDITEM2,Integer(Self),0,0,idx);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;

procedure THeroObject.SendAddStorage(UserItem:pTUserItem); //004D0824      //咯包  //芒绊
var
  Item:TItem;
  StdItem:TStdItem;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: String;
begin
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;
  Item.GetStandardItem(ClientItem.S);
  opt := Item.GetItemAddValue(UserItem, ClientItem.S);

  sUserItemName := '';
  sUserItemName := FilterStdShowName(Item,Item.Name);
  if UserItem.btValue[11] = 1 then
   sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
  if sUserItemName <> '' then
   ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  ClientItem.Amount:=UserItem.Amount;
  ClientItem.UpgradeOpt := opt;
  m_DefMsg:=MakeDefaultMsg(SM_ADDHEROSTORAGE,Integer(Self),0,0,1);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;

procedure THeroObject.SendAddStorageMode(UserItem:pTUserItem;idx:integer);      //拱距2
var
  Item:TItem;
  StdItem:TStdItem;
  ClientItem:TClientItem;
  sUserItemName: string;
  opt: integer;
begin
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;
  Item.GetStandardItem(ClientItem.S);
  opt := Item.GetItemAddValue(UserItem, ClientItem.S);

  sUserItemName := '';
  sUserItemName := FilterStdShowName(Item,Item.Name);
  if UserItem.btValue[11] = 1 then
   sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
  if sUserItemName <> '' then
   ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

  ClientItem.S.Name := GetItemName(UserItem);
  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  ClientItem.Amount := UserItem.Amount;
  ClientItem.UpgradeOpt := opt;

  m_DefMsg:=MakeDefaultMsg(SM_ADDHEROSTORAGEITEM,Integer(Self),0,0,idx);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;

procedure THeroObject.SendAddAutoItemMode(UserItem:pTUserItem);      //拱距2
var
  StdItem: TItem;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: string;
begin
  StdItem := UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem = nil then exit;
  StdItem.GetStandardItem(ClientItem.S);
  opt := StdItem.GetItemAddValue(UserItem, ClientItem.S);

  sUserItemName := '';
  sUserItemName := FilterStdShowName(StdItem,StdItem.Name);
  if UserItem.btValue[11] = 1 then
   sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
  if sUserItemName <> '' then
   ClientItem.s.Name := FilterStdShowName(StdItem,sUserItemName);

  ClientItem.MakeIndex:=UserItem.MakeIndex;
  ClientItem.Dura:=UserItem.Dura;
  ClientItem.DuraMax:=UserItem.DuraMax;
  ClientItem.Amount:=UserItem.Amount;
  ClientItem.UpgradeOpt := opt;

  m_DefMsg:=MakeDefaultMsg(SM_HEROAUTOADDITEM,Integer(m_Master),0,0,0);
  SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
end;

//发送使用的魔法
procedure THeroObject.SendUseMagic();
var
  I           :Integer;
  sSendMsg    :String;
  UserMagic   :pTUserMagic;
  ClientMagic :TClientMagic;
begin
  sSendMsg:='';
  for I :=0 to m_MagicList.Count -1 do begin
    UserMagic:=m_MagicList.Items[I];
    ClientMagic.Key      := Chr(UserMagic.btKey);
    ClientMagic.Level    := UserMagic.btLevel;
    ClientMagic.CurTrain := UserMagic.nTranPoint;
    ClientMagic.Def      := UserMagic.MagicInfo^;
    sSendMsg:=sSendMsg + EncodeBuffer(@ClientMagic,SizeOf(TClientMagic)) + '/';
  end;
  if sSendMsg <> '' then begin
    m_DefMsg:=MakeDefaultMsg(SM_SENDMYHEROMAGIC,0,0,0,m_MagicList.Count);
    SendSocket(@m_DefMsg,sSendMsg);
  end;
end;

function THeroObject.GetUseMagicCount(): integer;
begin
  Result := m_MagicList.Count;
end;

function THeroObject.GetUseMagicStatus(mode:integer): integer;
var
  I           :Integer;
  UserMagic   :pTUserMagic;
begin
  Result := 0;
  for I :=0 to m_MagicList.Count -1 do begin
    UserMagic:=m_MagicList.Items[I];
    if UserMagic.MagicInfo.wMimicID = mode then begin
      Result := UserMagic.btLevel + 1;
      break;
    end;
  end;
end;

function THeroObject.GetCheckUseItem(): Boolean;
var
  boCheck: Boolean;
  I: Integer;
  StdItem: TItem;
begin
  Result := False;
  boCheck := False;
  if (m_StorageItemList.Count <= 0) then boCheck := True;
  if (m_ItemList.Count <= 0) then boCheck := True;
  if boCheck then begin
    if (m_AutoItem.count <= 0) then boCheck := True
    else boCheck := False;
  end;
  if boCheck then begin
    for i := Low(THeroItems) to High(THeroItems) do begin
      if m_UseItems[i].wIndex > 0 then begin
        StdItem := UserEngine.GetStdItem(m_UseItems[i].wIndex);
        if StdItem <> nil then begin
          Result := False;
          Break;
        end else begin
          Result := True;
        end;
      end else begin
        Result := True;
      end;
    end;
  end;

end;

function  THeroObject.IsHeroProperTarget(baseObject:TBaseObject):boolean;
begin
  result:= false;
  if (BaseObject = Self) or (BaseObject = m_master) or InSafeZone or (baseObject = nil) then exit;
  result:= true;
end;

procedure THeroObject.Struck(hiter: TBaseObject);
begin
  if (not m_boTarget) and (m_btAiMode <> 2) then begin  //措扁惑怕啊 酒聪咯具窃,,
    m_dwStruckTick := GetTickCount;
    if hiter <> nil then begin
      if (m_TargetCret = nil) then begin
        if IsProperTarget(hiter) or IsHeroProperTarget(hiter) then
           SetTargetCreat(hiter);
      end;
    end;
  end;
  m_dwHitTick := m_dwHitTick + LongWord(150 - _MIN(130, m_Abil.Level * 4));
end;

//查找目标
procedure THeroObject.SearchTarget;
var
  BaseObject, BaseObject18: TBaseObject;
  I, nC, n10: Integer;
begin
  if (m_TargetCret = nil) and m_boTarget then m_boTarget := False;    //碍力傍拜 疙飞阑 郴啡绰单 鸥百捞 绝栏搁 波林扁.
  if (m_TargetCret <> nil) and m_boTarget then begin    //碍力傍拜 疙飞吝 鸥百捞 乐促.
    if m_TargetCret.m_boDeath then m_boTarget := False;    //鸥百捞 磷菌促搁 波霖促.
  end;

  if (m_TargetCret = nil) and m_boSpellTarget then m_boSpellTarget := False;
  if m_boSpellTarget and (m_TargetCret <> nil) then begin
    m_boSpellTarget := False;
  end;


  if (m_btStatus = 0) and (m_btAiMode = 0) and (not m_boProtectStatus) and (not m_boTarget) and (GetTickCount - m_dwCallTargetTick > 2500)  {and (not m_boSpellTarget)} then begin  //傍拜啊瓷惑怕俊辑 碍力疙飞捞 绝促搁.
    BaseObject18 := nil;
    n10 := 15;  //裹困 15沫??
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if BaseObject <> nil then begin
        if not BaseObject.m_boDeath then begin
          if IsProperTarget(BaseObject) {and (not BaseObject.m_boHideMode or m_boCoolEye)} then begin
            nC := abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nC < n10 then begin
              n10 := nC;
              BaseObject18 := BaseObject;
            end;
          end;
        end;
      end;
    end;
    if BaseObject18 <> nil then begin
      SetTargetCreat(BaseObject18);     //鸥百栏肺 瘤沥
    end;
  end;
end;

//搜索查看范围
procedure THeroObject.SearchViewRange;
var
  I: Integer;
  nStartX: Integer;
  nEndX: Integer;
  nStartY: Integer;
  nEndY: Integer;
  n18: Integer;
  n1C: Integer;
  nIdx: Integer;
  MapCellInfo: pTMapCellinfo;
  OSObject: pTOSObject;
  BaseObject: TBaseObject;
  MapItem: PTMapItem;
  MapEvent: TEvent;
  VisibleBaseObject: pTVisibleBaseObject;
  VisibleMapItem: pTVisibleMapItem;
  nCheckCode: Byte;
  btType: Byte;
  nVisibleFlag: Integer;
begin
  //if m_btRaceServer = RC_PLAYOBJECT then Exit;
  if self = nil then Exit;//20080803 增加
  if m_PEnvir = nil then begin
    MainOutMessage('SearchViewRange nil PEnvir Name:'+ m_sCharName);
    KickException();//20081226 地图不存在，则踢出角色
    Exit;
  end;
  nCheckCode := 1;
  m_boIsVisibleActive := False; //先置为FALSE
  try
    if m_VisibleItems.Count > 0 then begin//20080629
      for I := 0 to m_VisibleItems.Count - 1 do begin
        //pTVisibleMapItem(m_VisibleItems.Items[I]).nVisibleFlag := 0;
        VisibleMapItem:= pTVisibleMapItem(m_VisibleItems.Items[I]);//20080526 增加
        if VisibleMapItem <> nil then VisibleMapItem.nVisibleFlag := 0;//20080526 增加
      end;
    end;
  except
    MainOutMessage(Format('THeroObject::SearchViewRange Code:%d', [nCheckCode]));
    KickException();
  end;
  nCheckCode := 2;
  try
    if m_VisibleActors.Count > 0 then begin//20080629
      for I := 0 to m_VisibleActors.Count - 1 do begin
        //pTVisibleBaseObject(m_VisibleActors.Items[I]).nVisibleFlag := 0;
        VisibleBaseObject:= pTVisibleBaseObject(m_VisibleActors.Items[I]); //20080526 增加
        if VisibleBaseObject <> nil then VisibleBaseObject.nVisibleBFlag := 0;//20080526 增加
      end;
    end;
  except
    MainOutMessage(Format('THeroObject::SearchViewRange Code:%d', [nCheckCode]));
    KickException();
  end;
  nStartX := m_nCurrX - m_nViewRange;
  nEndX := m_nCurrX + m_nViewRange;
  nStartY := m_nCurrY - m_nViewRange;
  nEndY := m_nCurrY + m_nViewRange;
  try
    nCheckCode := 3;
    for n18 := nStartX to nEndX do begin
      for n1C := nStartY to nEndY do begin
        nCheckCode := 4;
        if m_PEnvir.GetMapCellInfo(n18, n1C, MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          nCheckCode := 5;
          nIdx := 0;
          while (True) do begin
            if MapCellInfo.ObjList.Count <= nIdx then Break;
            OSObject := MapCellInfo.ObjList.Items[nIdx];
            nCheckCode := 51;
            if OSObject = nil then begin//处理异常 传奇代码 20080916
              MapCellInfo.ObjList.Delete(nIdx);
              nCheckCode := 52;
              if MapCellInfo.ObjList.Count > 0 then Continue;
              nCheckCode := 53;
              FreeAndNil(MapCellInfo.ObjList);
              break;
            end;
            if OSObject <> nil then begin
              nCheckCode := 61; //20081017
              try
                btType := OSObject.btType; //2006-10-14 防止内存出错
              except
                nCheckCode := 62;
                MapCellInfo.ObjList.Delete(nIdx); //20080916
                if MapCellInfo.ObjList.Count > 0 then Continue;
                nCheckCode := 63;
                FreeAndNil(MapCellInfo.ObjList);
                break;
              end;
              nCheckCode := 6;
              if btType = OS_MOVINGOBJECT then begin//20081017 修改
                if (GetTickCount - OSObject.dwAddTime) >= 60 * 1000 then begin
                  nCheckCode := 7;
                  MapCellInfo.ObjList.Delete(nIdx);//20080916 修改
                  DisPoseAndNil(OSObject);
                  if MapCellInfo.ObjList.Count > 0 then Continue;//20080916 修改
                  FreeAndNil(MapCellInfo.ObjList);
                  Break;
                end;
                nCheckCode := 8;
                BaseObject := TBaseObject(OSObject.CellObj);
                if BaseObject <> nil then begin
                  if (not BaseObject.m_boGhost) and (not BaseObject.m_boFixedHideMode) and (not BaseObject.m_boObMode) then begin
                    if (m_btRaceServer < RC_ANIMAL) or (m_Master <> nil) or m_boCrazyMode or m_boWantRefMsg or
                      ((BaseObject.m_Master <> nil) and (abs(BaseObject.m_nCurrX - m_nCurrX) <= 6) and (abs(BaseObject.m_nCurrY - m_nCurrY) <=  6)) or//20080815 由3格变6格(修正,赤月恶魔3格后,就不能攻击英雄)
                      (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                      nCheckCode := 9;
                      UpdateVisibleGay(BaseObject);
                    end;
                  end;
                end;
              end; //if OSObject.btType = OS_MOVINGOBJECT then begin

              //增加分身人搜索地面物品  20080707 注释
              nCheckCode := 10;
              if (m_btRaceServer = RC_HEROOBJECT) and (m_Master <> nil) then begin //20080729 修改
                if (OSObject <> nil) and (OSObject.btType = OS_ITEMOBJECT) then begin
                  nCheckCode := 11;
                  if (GetTickCount - OSObject.dwAddTime) > g_Config.dwClearDropOnFloorItemTime {60 * 60 * 1000} then begin
                    Dec(m_PEnvir.m_nItemCount);           //包府磊矫胶袍
                    Dec(g_MapManager.m_nItemCount);       //包府磊矫胶袍
                    if PTMapItem(OSObject.CellObj) <> nil then DisPoseAndNil(PTMapItem(OSObject.CellObj)); //防止占用内存不释放现象 20080702 修改
                    DisPoseAndNil(OSObject);
                    MapCellInfo.ObjList.Delete(nIdx);
                    if MapCellInfo.ObjList.Count > 0 then Continue;//20080916 增加
                    FreeAndNil(MapCellInfo.ObjList);
                    Break;
                  end;
                  MapItem := PTMapItem(OSObject.CellObj);
                  nCheckCode := 12;
                  UpdateVisibleItem(n18, n1C, MapItem);
                  nCheckCode := 13;
                  if (MapItem.OfBaseObject <> nil) or (MapItem.DropBaseObject <> nil) then begin
                    if (GetTickCount - MapItem.dwCanPickUpTick) > g_Config.dwFloorItemCanPickUpTime {2 * 60 * 1000} then begin
                      MapItem.OfBaseObject := nil;
                      MapItem.DropBaseObject := nil;
                    end else begin
                      nCheckCode := 14;
                      if TBaseObject(MapItem.OfBaseObject) <> nil then begin
                        if TBaseObject(MapItem.OfBaseObject).m_boGhost then MapItem.OfBaseObject := nil;
                      end;
                      if TBaseObject(MapItem.DropBaseObject) <> nil then begin
                        if TBaseObject(MapItem.DropBaseObject).m_boGhost then MapItem.DropBaseObject := nil;
                      end;
                    end;
                  end;
                end; //if OSObject.btType = OS_ITEMOBJECT then begin
              end;//增加分身人搜索地面物品
            end;
            Inc(nIdx);
          end;
        end;
      end;
    end;
  except
    on E: Exception do begin
      MainOutMessage(Format(' THeroObject::SearchViewRange %s %s %d %d %d', [m_sCharName, m_sMapName, m_nCurrX, m_nCurrY, nCheckCode]));
      KickException();
    end;
  end;

  try
   nCheckCode := 15;
   n18 := 0;
    while (True) do begin
      if m_VisibleItems.Count <= n18 then Break;
      nCheckCode := 16;
      VisibleMapItem := m_VisibleItems.Items[n18];
      nCheckCode := 17;
      if VisibleMapItem = nil then begin//20080526 增加
        m_VisibleItems.Delete(n18);//20080901
        Continue;
      end;
      
      try //20080901
        nCheckCode := 18;
        nVisibleFlag := VisibleMapItem.nVisibleFlag;
      except
        m_VisibleItems.Delete(n18);
        Continue;
      end;

      if {VisibleMapItem.nVisibleFlag}nVisibleFlag = 0 then begin//20080901 修改
        nCheckCode := 19;
        m_VisibleItems.Delete(n18);
        nCheckCode := 20;
        DisPoseAndNil(VisibleMapItem);
        Continue;
      end;
      Inc(n18);
    end;

    nCheckCode := 21;
    n18 := 0;
    while (True) do begin
      if m_VisibleActors.Count <= n18 then Break;
      nCheckCode := 22;
      VisibleBaseObject := m_VisibleActors.Items[n18];
      nCheckCode := 23;
      if VisibleBaseObject = nil then begin //20080526 增加
        m_VisibleActors.Delete(n18);//20080901
        Continue;
      end;

      try   //20080901
        nCheckCode := 24;
        nVisibleFlag := VisibleBaseObject.nVisibleBFlag;
      except
        m_VisibleActors.Delete(n18);
        Continue;
      end;

      if {VisibleBaseObject.nVisibleFlag}nVisibleFlag = 0 then begin//20080901 修改
        nCheckCode := 25;
        m_VisibleActors.Delete(n18);
        nCheckCode := 26;
        DisPoseAndNil(VisibleBaseObject);
        Continue;
      end;
      Inc(n18);
    end;
  except
    on E: Exception do begin
      MainOutMessage(Format('THeroObject::SearchViewRange %s %s %d %d %d', [m_sCharName, m_sMapName, m_nCurrX, m_nCurrY, nCheckCode]));
      KickException();
    end;
  end;
end;

function THeroObject.SelectMagic(): Integer;
  function IsUseSkillThrust: Boolean;
  var
    BaseObjectList: TList;
    BaseObject: TBaseObject;
    nx, ny: Integer;
  begin
    Result := False;
    if (m_TargetCret <> nil) then begin
      if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, 2, nX, nY) then begin
         BaseObject := TBaseObject(m_PEnvir.GetMovingObject(nX, nY, True));
        if BaseObject <> nil then
        Result:= True;
      end;
    end;
  end;
  function GetAttackDir2(nRange: Integer): Boolean;
  var
    nX, nY: Integer;
    BaseObject: TBaseObject;
  begin
    Result := False;
    if (m_TargetCret <> nil) then begin
      if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, nRange, nX, nY) then begin
        BaseObject := TBaseObject(m_PEnvir.GetMovingObject(nX, nY, True));
        if BaseObject <> nil then
        Result:= True;
      end;
    end;
  end;
  function UseFireCross: Boolean;
  begin
    if (m_TargetCret <> nil) and AllowUseMagic(22) and (GetTickCount - m_SkillUseTick[22] > 1000 * 5) then begin
      Result := True;
      if (not m_PEnvir.CanWalk(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY - 1, False)) or (m_PEnvir.GetEvent(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY - 1) <> nil) then
        if (not m_PEnvir.CanWalk(m_TargetCret.m_nCurrX - 1, m_TargetCret.m_nCurrY, False)) or (m_PEnvir.GetEvent(m_TargetCret.m_nCurrX - 1, m_TargetCret.m_nCurrY) <> nil) then
          if (not m_PEnvir.CanWalk(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, False)) or (m_PEnvir.GetEvent(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY) <> nil) then
            if (not m_PEnvir.CanWalk(m_TargetCret.m_nCurrX + 1, m_TargetCret.m_nCurrY, False)) or (m_PEnvir.GetEvent(m_TargetCret.m_nCurrX + 1, m_TargetCret.m_nCurrY) <> nil) then
              if (not m_PEnvir.CanWalk(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY + 1, False)) or (m_PEnvir.GetEvent(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY + 1) <> nil) then
                Result := False;
    end else Result := False;
  end;

  function QuickLighting: Boolean;
  begin
    Result := False;
    if AllowUseMagic(10) and CanLineAttack(6) then begin
      Result := True;
    end;
  end;

  function QuickFireRing: Boolean;
  begin
    Result := False;
    if AllowUseMagic(9) and CanLineAttack(4) then begin
      Result := True;
    end;
  end;

var
  btDir: Byte;
  nRangeTargetCount, nAmuletIdx, nDirRangeTargetCount: Integer;
  StdItem: TItem;
  boVisibleActors: Boolean;
  nSelfRangeTargetCount, nRangeTargetCountByDir: Integer;
begin
  Result := 0;
  case m_btJob of               //流诀函版
    0: begin     //康旷傈荤    SelectMagic
        if (m_TargetCret <> nil) then begin
          if AllowUseMagic(12) then begin
            if GetAttackDir(m_TargetCret, 1, btDir) and GetAttackDir2(2) and ((GetTickCount - m_SkillUseTick[12]) > 1 * 1000) then begin //绢八贱
              if m_boUseThrusting then begin
                Result := 12;
                Exit;
              end;
            end;
            if GetAttackDir(m_TargetCret, 2, btDir) and ((GetTickCount - m_SkillUseTick[12]) > 1 * 1000) then begin //绢八贱
              if IsUseSkillThrust and m_boUseThrusting then begin
                Result := 12;
                Exit;
              end;
            end;
          end;

          if AllowUseMagic(130) and (GetTickCount - m_SkillUseTick[130] > 1000 * 20) then begin  //付趋堡级
            nDirRangeTargetCount := GetRangeTargetCountByDir(m_btDirection, m_nCurrX, m_nCurrY, 1);
            if (nDirRangeTargetCount >= 1) then begin
              Result := 130;
              Exit;
            end;
          end;

          if AllowUseMagic(132) and (GetTickCount - m_SkillUseTick[132] > 1000 * 15) then begin      //雀玫拜
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 3) then begin  //雀玫拜 鸥百林困 3 利 5疙 捞惑
              Result := 132; //雀玫拜
              Exit;
            end;
          end;

          if AllowUseMagic(56) and (GetTickCount - m_SkillUseTick[56] > 1000 * 10) then begin  //老级
            nDirRangeTargetCount := GetRangeTargetCountByDir(m_btDirection, m_nCurrX, m_nCurrY, 1);
            if (nDirRangeTargetCount >= 1) then begin
              Result := 56;
              Exit;
            end;
          end;

          nRangeTargetCount := GetNearTargetCount(1);     //郴 林函鸥百
          if (nRangeTargetCount >= 2) then begin //康旷 抄拳趋浅曼
            if AllowUseMagic(131) and ((GetTickCount - m_SkillUseTick[131]) > 1 * 1000) then begin
              if m_boNanCrsHitkill then begin
                Result := 131;
                Exit;
              end;
            end;
          end;

          if AllowUseMagic(26) and (m_boFireHitSkill) and ((GetTickCount - m_SkillUseTick[26]) > 10 * 1000) then begin
            Result := 26;
            Exit;
          end;

          if AllowUseMagic(38) and (m_boTwinHitSkill = 1) and ((GetTickCount - m_SkillUseTick[38]) > 800) then begin
            Result := 38;
            Exit;
          end;

          if (Random(6) = 0) and AllowUseMagic(26) and ((GetTickCount - m_dwLatestFireHitTick) > 10 * 1000) and ((GetTickCount - m_SkillUseTick[26]) > 3 * 1000) then begin //康旷 堪拳搬
            AllowFireHitSkill;
            Result := 26;
            Exit;
          end;


          if (Random(6) = 0) and AllowUseMagic(7) then begin //康旷 抗档八过
            m_boPowerHit := True;
            Result := 7;
            Exit;
          end;

          if(Random(6) = 0) and AllowUseMagic(38) and ((GetTickCount - m_SkillUseTick[38]) > 6 * 1000) and ((GetTickCount - m_SkillUseTick[26]) > 3 * 1000) then begin //康旷 街锋曼
            AllowTwinHitSkill;
            Result := 38;
            Exit;
          end;

          nRangeTargetCount := GetNearTargetCount(1);     //郴 林函鸥百
          if (nRangeTargetCount >= 2) then begin //康旷 馆岿八过
            if AllowUseMagic(25) and ((GetTickCount - m_SkillUseTick[25]) > 1 * 1000) then begin
              if m_boUseHalfMoon and (not m_boNanCrsHitkill) then begin
                Result := 25;
                Exit;
              end;
            end;
          end;
        end;

      end;

    1: begin //康旷贱荤    SelectMagic

        if (AllowUseMagic(31)) and (m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP] = 0) and (not m_boAbilMagBubbleDefence) and (GetTickCount - m_SkillUseTick[31] > 1000 * 15) then begin
          Result := 31;   //林贱狼阜
          m_SkillUseTick[31] := GetTickCount;
          m_boSelSelf := True;
          Exit;
        end;

        if (m_TargetCret <> nil) and (not m_TargetCret.m_boDeath) then begin
          if (m_WAbil.HP <= m_WAbil.MaxHP div 4) or (Random(12) = 0) and (AllowUseMagic(48))  and (GetTickCount - m_SkillUseTick[48] > 800 * 1)  then begin
            Result := 48;    //软趋贱
            Exit;
          end;
        end;

        nRangeTargetCount := GetNearTargetCount(1);     //郴 林函鸥百
        if AllowUseMagic(133) and (GetTickCount - m_SkillUseTick[133] > 1000 * 7) then begin      //拳锋柳浅
          if (nRangeTargetCount >= 2) then begin  //拳锋柳浅 林困 3 利 2疙 捞惑
            Result := 133; //拳锋柳浅
            Exit;
          end;
        end;


        if AllowUseMagic(134) and (GetTickCount - m_SkillUseTick[134] > 1000 * 10) then begin      //玫惑气堪
          if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 3) then begin  //玫惑气堪 鸥百林困 3 利 5疙 捞惑
            Result := 134; //玫惑倡堪
            Exit;
          end;
        end;

        if AllowUseMagic(135) and (GetTickCount - m_SkillUseTick[135] > 1000 * 15) then begin      //倡玫汾
          if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 2) then begin  //倡玫汾 鸥百林困 3 利 2疙 捞惑
            Result := 135; //倡玫汾
            Exit;
          end;
        end;

        if AllowUseMagic(53) and (GetTickCount - m_SkillUseTick[53] > 1000 * 5) then begin      //玫惑倡堪
          if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 2) then begin  //玫惑倡堪 鸥百林困 3 利 5疙 捞惑
            Result := 53; //玫惑倡堪
            Exit;
          end;
        end;

        if (GetTickCount - m_SkillUseTick[10] > 5000) and m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, 5, m_nTargetX, m_nTargetY) then begin
          if ((m_TargetCret.m_btRaceServer = RC_PLAYOBJECT) or (m_TargetCret.m_btRaceServer = RC_HEROOBJECT) or (m_TargetCret.m_Master <> nil))
           and (GetDirBaseObjectsCount(m_btDirection,5)> 0) and
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)<=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=0)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=0) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)<=4)) or
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=2) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=2)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=3) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=3))  or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=4)))) then begin
            if AllowUseMagic(10) then begin
              m_SkillUseTick[10] := GetTickCount;
              Result := 10;//汾牢厘
              Exit;
            end else
            if AllowUseMagic(9) then begin
              m_SkillUseTick[10] := GetTickCount;
              Result := 9;//堪荤厘
              Exit;
            end;
          end else
          if (GetDirBaseObjectsCount(m_btDirection,5)> 1) and
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)<=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=0)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=0) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)<=4)) or
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=2) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=2)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=3) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=3))  or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=4)))) then begin
            if AllowUseMagic(10) then begin
              m_SkillUseTick[10] := GetTickCount;
              Result := 10;//汾牢厘
              Exit;
            end else
            if AllowUseMagic(9) then begin
              m_SkillUseTick[10] := GetTickCount;
              Result := 9;//堪荤厘
              Exit;
            end;
          end;
        end;

        if AllowUseMagic(32) and (GetTickCount - m_SkillUseTick[32] > 10000) and (m_TargetCret.m_Abil.Level < g_Config.nMagTurnUndeadLevel) and
          (m_TargetCret.m_btLifeAttrib = LA_UNDEAD) and (m_TargetCret.m_WAbil.Level < m_WAbil.Level -1) then begin
          m_SkillUseTick[32] := GetTickCount;
          Result := 32; //荤磊辣雀
          Exit;
        end;

        if CheckTargetXYCount(m_nCurrX, m_nCurrY, 2) > 1 then begin //裹困 2 利 1疙 捞惑
          if AllowUseMagic(22) and (GetTickCount - m_SkillUseTick[22] > 10000) and (g_EventManager.GetRangeEvent(m_PEnvir, Self, m_nCurrX, m_nCurrY, 6, ET_FIRE) <> 0) then begin
            if (m_TargetCret.m_btRaceServer <> 101) and (m_TargetCret.m_btRaceServer <> 102) and (m_TargetCret.m_btRaceServer <> 104) then begin//除祖玛怪,才放火墙 20081217
              m_SkillUseTick[22] := GetTickCount;
              Result := 22; //瘤堪贱
              Exit;
            end;
          end;
          if m_TargetCret.m_btRaceServer in [91,92,97,101,102,104] then begin
            if AllowUseMagic(24) and (GetTickCount - m_SkillUseTick[24] > 4000) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 2) then begin
              m_SkillUseTick[24] := GetTickCount;
              Result := 24; //汾汲拳
              Exit;
            end else
            if AllowUseMagic(11) then begin
              Result := 11; //碍拜
              Exit;
            end else
            if AllowUseMagic(33) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 2) > 2) then begin
              Result := 33; //葫汲浅
              Exit;

            end;
          end;
          
          case Random(3) of
            0: begin
                if AllowUseMagic(33) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1) then begin
                  Result := 33; //葫汲浅
                  Exit;
                end else
                if AllowUseMagic(23) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1) then begin
                  Result := 23; //气凯颇
                  Exit;
                end else
                if AllowUseMagic(11) then begin
                  Result := 11; //碍拜
                  Exit;
                end else
                if AllowUseMagic(5) then begin
                  Result := 5;//陛碍拳堪厘
                  Exit;
                end else   
                if AllowUseMagic(1) then begin
                  Result := 1;//拳堪厘
                  Exit;
                end;
              end;
            1: begin
                if AllowUseMagic(23) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1)  then begin
                  Result := 23; //气凯颇
                  Exit;
                end else
                if AllowUseMagic(33) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1) then begin//火球术,大火球,地狱火,爆裂火焰,冰咆哮  从高到低选择
                  Result := 33;//葫汲浅
                  Exit;
                end else
                if AllowUseMagic(11) then begin
                  Result := 11; //碍拜
                  Exit;
                end else
                if AllowUseMagic(5) then begin
                  Result := 5;//陛碍拳堪厘
                  Exit;
                end else
                if AllowUseMagic(1) then begin
                  Result := 1;//拳堪厘
                  Exit;
                end;
              end;
            2:begin
                if AllowUseMagic(11) then begin
                  Result := 11; //碍拜
                  Exit;
                end else
                if AllowUseMagic(23) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1) then begin
                  Result := 23; //气凯颇
                  Exit;
                end else
                if AllowUseMagic(33) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 1) then begin  //火球术,大火球,地狱火,爆裂火焰 从高到低选择
                  Result := 33; //葫汲浅
                  Exit;
                end else
                if AllowUseMagic(5) then begin
                  Result := 5;//陛碍拳堪厘
                  Exit;
                end else
                if AllowUseMagic(1) then begin
                  Result := 1;//拳堪厘
                  Exit;
                end;
              end;
          end;
        end else begin
          if CheckTargetXYCountOfDirection(m_nTargetX, m_nTargetY, m_btDirection, 3) = 1 then begin     //规氢俊 蝶弗 傍拜?
             if AllowUseMagic(22) and (GetTickCount - m_SkillUseTick[22] > 10000) and (g_EventManager.GetRangeEvent(m_PEnvir, Self, m_nCurrX, m_nCurrY, 6, ET_FIRE) = 0) then begin
               if (m_TargetCret.m_btRaceServer <> 101) and (m_TargetCret.m_btRaceServer <> 102) and (m_TargetCret.m_btRaceServer <> 104) then begin//除祖玛怪,才放火墙 20081217
                 m_SkillUseTick[22] := GetTickCount;
                 Result := 22;  //瘤堪贱
                 Exit;
               end;
             end;
             case Random(3) of
               0:begin
                  if AllowUseMagic(11) then begin
                    Result := 11;//碍拜
                    Exit;
                  end else
                  if AllowUseMagic(33) then begin
                    Result := 33; //葫汲浅
                    Exit;
                  end else
                  if AllowUseMagic(23) then begin
                    Result := 23; //气凯颇
                    Exit;
                  end else
                  if AllowUseMagic(5) then begin
                    Result := 5;//陛碍拳堪厘
                    Exit;
                  end else
                  if AllowUseMagic(1) then begin
                    Result := 1;//拳堪厘
                    Exit;
                  end;
               end;
               1:begin
                  if AllowUseMagic(11) then begin
                    Result := 11;//碍拜
                    Exit;
                  end else
                  if AllowUseMagic(33) then begin
                    Result := 33; //葫汲浅
                    Exit;
                  end else
                  if AllowUseMagic(23) then begin
                    Result := 23; //气凯颇
                    Exit;
                  end else       
                  if AllowUseMagic(5) then begin
                    Result := 5;//陛碍拳堪厘
                    Exit;
                  end else
                  if AllowUseMagic(1) then begin
                    Result := 1;//拳堪厘
                    Exit;
                  end;
               end;
               2:begin
                  if AllowUseMagic(11) then begin
                    Result := 11;//碍拜
                    Exit;
                  end else
                  if AllowUseMagic(33) then begin
                    Result := 33; //葫汲浅
                    Exit;
                  end else
                  if AllowUseMagic(23) then begin
                    Result := 23; //气凯颇
                    Exit;
                  end else
                  if AllowUseMagic(5) then begin
                    Result := 5;//陛碍拳堪厘
                    Exit;
                  end else
                  if AllowUseMagic(1) then begin
                    Result := 1;//拳堪厘
                    Exit;
                  end;

               end;
             end;
          end;
        end;

        if AllowUseMagic(33) then begin//葫汲浅
          Result := 33;
          Exit;
        end;
        if AllowUseMagic(32) and (m_TargetCret.m_Abil.Level < g_Config.nMagTurnUndeadLevel) and
        (m_TargetCret.m_btLifeAttrib = LA_UNDEAD) and (m_TargetCret.m_WAbil.Level < m_WAbil.Level -1) then begin //目标为不死系
          Result := 32; //荤磊辣雀
          Exit;
        end;          
        if AllowUseMagic(24) and (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) > 2) then begin//地狱雷光
          Result := 24;
          Exit;
        end;
        if AllowUseMagic(23) then begin//气凯颇
          Result := 23;
          Exit;
        end;
        if AllowUseMagic(11) then begin//碍拜
          Result := 11;
          Exit;
        end;
        if AllowUseMagic(10) and m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, 5, m_nTargetX, m_nTargetY) and
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)<=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=0)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=0) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)<=4)) or
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=2) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=2)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=3) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=3))  or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=4)))) then begin
          Result := 10;//汾牢厘
          Exit;
        end;
        if AllowUseMagic(9) and m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, 5, m_nTargetX, m_nTargetY) and
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)<=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=0)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=0) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)<=4)) or
          (((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=2) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=2)) or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=3) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=3))  or
          ((Abs(m_nCurrX-m_TargetCret.m_nCurrX)=4) and (Abs(m_nCurrY-m_TargetCret.m_nCurrY)=4)))) then begin
          Result := 9;//堪荤厘
          Exit;
        end;
        if AllowUseMagic(5) then begin
          Result := 5;//陛碍龋缴措
          Exit;
        end;
        if AllowUseMagic(1) then begin
          Result := 1;//拳堪厘
          Exit;
        end;      
        if AllowUseMagic(22) and (g_EventManager.GetRangeEvent(m_PEnvir, Self, m_nCurrX, m_nCurrY, 6, ET_FIRE) <> 0) then begin
          if (m_TargetCret.m_btRaceServer <> 101) and (m_TargetCret.m_btRaceServer <> 102) and (m_TargetCret.m_btRaceServer <> 104) then begin//除祖玛怪,才放火墙 20081217
            Result := 22; //瘤堪贱
            Exit;
          end;
        end;

      end;


    2: begin //康旷档荤  SelectMagic

          if (m_TargetCret <> nil) and (not m_TargetCret.m_boDeath) and (m_TargetCret <> m_Master) then begin
            if AllowUseMagic(6) and (GetTickCount - m_SkillUseTick[6] > 1000 * 15) then begin   //鞠楷贱
              if CheckHeroAmulet2(1, 5, 6, 1, nAmuletIdx) then begin    //鞠楷贱
                if CheckHeroAmulet2(1, 7, 6, 0, nAmuletIdx) and (m_TargetCret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
                  Result := 6;
                  Exit;
                end;
                if CheckHeroAmulet2(1, 8, 6, 0, nAmuletIdx) and (m_TargetCret.m_wStatusTimeArr[POISON_DAMAGEARMOR] = 0) then begin
                  Result := 6;
                  Exit;
                end;
              end;
            end;
            if AllowUseMagic(13) and (GetTickCount - m_SkillUseTick[13] > 1800) then begin
              if CheckHeroAmulet2(1, 5, 13, 1, nAmuletIdx) then begin //气混拌
                Result := 13;
                Exit;
              end;
            end;
            if AllowUseMagic(28) and (GetTickCount - m_SkillUseTick[28] > 1000 * 10) and   //沤扁颇楷
              (not m_TargetCret.m_boShowHP) and (m_TargetCret.m_Abil.Level > 99) then begin
              if CheckHeroAmulet2(1, 5, 28, 1, nAmuletIdx) then begin  //沤扁颇楷
                Result := 28;
                Exit;
              end;
            end;
          end;

          if m_WAbil.HP <= m_WAbil.MaxHP * 70 div 100 then begin
            if GetTickCount - m_SkillUseTick[29] > 1000 * 2 then begin
              if m_nIncSelfHealthCount <= 3 then begin
                if AllowUseMagic(2) and AllowUseMagic(29) then begin      //康旷雀汗贱 措雀汗贱
                  if GetRangeFriendCount(m_nCurrX, m_nCurrY, 3) > 1 then begin    //荤恩捞 1疙 捞惑 措雀汗贱
                    m_boSelSelf := True;
                    Inc(m_nIncSelfHealthCount);
                    Result := 29;
                    m_SkillUseTick[29] := GetTickCount;
                  end else begin                    //去磊 雀汗贱
                    m_boSelSelf := True;
                    Inc(m_nIncSelfHealthCount);
                    Result := 2;
                    m_SkillUseTick[2] := GetTickCount;
                  end;
                  Exit;
                end;
                if AllowUseMagic(29) then begin {措雀汗贱}
                  m_boSelSelf := True;
                  Inc(m_nIncSelfHealthCount);
                  Result := 29;
                  m_SkillUseTick[29] := GetTickCount;
                  Exit;
                end;
                if AllowUseMagic(2) then begin {康旷雀汗贱}
                  m_boSelSelf := True;
                  Inc(m_nIncSelfHealthCount);
                  Result := 2;
                  m_SkillUseTick[2] := GetTickCount;
                  Exit;
                end;
              end else begin
                m_SkillUseTick[29] := GetTickCount;
                m_nIncSelfHealthCount := 0;
              end;
            end;
          end;
          if m_Master <> nil then boVisibleActors := FindVisibleActors(m_Master);
          if (m_Master <> nil) and boVisibleActors then begin
            if m_Master.m_WAbil.HP <= m_Master.m_WAbil.MaxHP * 70 div 100 then begin
              if GetTickCount - m_SkillUseTick[2] > 1000 * 2 then begin
              if m_nIncMasterHealthCount <= 3 then begin
                if AllowUseMagic(2) and AllowUseMagic(29) then begin
                  if GetRangeFriendCount(m_Master.m_nCurrX, m_Master.m_nCurrY, 3) > 1 then begin
                    m_boSelSelf := False;
                    Inc(m_nIncMasterHealthCount);
                    Result := 29;
                    m_SkillUseTick[29] := GetTickCount;
                  end else begin
                    m_boSelSelf := False;
                    Inc(m_nIncMasterHealthCount);
                    Result := 2;
                    m_SkillUseTick[2] := GetTickCount;
                  end;
                  Exit;
                end;
                if AllowUseMagic(29) then begin {措雀汗贱}
                  m_boSelSelf := False;
                  Inc(m_nIncMasterHealthCount);
                  Result := 29;
                  m_SkillUseTick[29] := GetTickCount;
                  Exit;
                end;
                if AllowUseMagic(2) then begin {康旷雀汗贱}
                  m_boSelSelf := False;
                  Inc(m_nIncMasterHealthCount);
                  Result := 2;
                  m_SkillUseTick[2] := GetTickCount;
                  Exit;
                end;
              end else begin
                m_SkillUseTick[2] := GetTickCount;
                m_nIncMasterHealthCount := 0;
              end;
              end;
            end;
          end;

          if AllowUseMagic(83) and (GetTickCount - m_SkillUseTick[83] > 1000 * UseMagicDelay(83)) then begin      //澜剧坷青柳
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 5) >= 5) then begin  //澜剧坷青柳 鸥百林困 2 利 5疙 捞惑
              if CheckHeroAmulet2(5, 5, 83, 1, nAmuletIdx) then begin
                Result := 83; //澜剧坷青柳
                Exit;
              end;
            end;
          end;

          if AllowUseMagic(55) and (GetTickCount - m_SkillUseTick[55] > 1000 * 5) then begin      //刀公
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 3) then begin  //刀公 鸥百林困 2 利 3疙 捞惑
              if CheckHeroAmulet2(2, 7, 55, 1, nAmuletIdx) then begin     //刀公
                Result := 55; //刀公
                Exit;
              end;
            end;
          end;

          if AllowUseMagic(91) and (GetTickCount - m_SkillUseTick[91] > 1000 * 7) then begin      //刀魔贱
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 2) then begin  //刀魔贱 鸥百林困 2 利 3疙 捞惑
              if CheckHeroAmulet2(2, 5, 91, 1, nAmuletIdx) then begin  //刀魔贱
                Result := 91; //刀魔贱
                Exit;
              end;
            end;
          end;


          if AllowUseMagic(46) and (GetTickCount - m_SkillUseTick[46] > 1000 * 20) then begin      //历林贱
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 3) >= 2) then begin  //历林贱 鸥百林困 2 利 3疙 捞惑
              if CheckHeroAmulet2(1, 5, 46, 1, nAmuletIdx) then begin    //历林贱
                Result := 46; //历林贱
                Exit;
              end;
            end;
          end;

          if (m_Master <> nil) and boVisibleActors then begin
            if AllowUseMagic(15) and (m_Master.m_wStatusTimeArr[STATE_DEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[15] > 1000 * 3) then begin
              if CheckHeroAmulet2(1, 5, 15, 1, nAmuletIdx) then begin //措瘤盔龋
                m_boSelSelf := False;
                Result := 15;
                Exit;
              end;
            end;
            if AllowUseMagic(14) and (m_Master.m_wStatusTimeArr[STATE_MAGDEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[14] > 1000 * 3) then begin
              if CheckHeroAmulet2(1, 5, 14, 1, nAmuletIdx) then begin //亲付柳过
                m_boSelSelf := False;
                Result := 14;
                Exit;
              end;
            end;
            if (m_Master.m_dwStatusArrTimeOutTick[15] <= 0) and AllowUseMagic(36) and (GetTickCount - m_SkillUseTick[36] > 1000 * 3) then begin
              if CheckHeroAmulet2(1, 5, 36, 1, nAmuletIdx) then begin //公必柳扁
                m_boSelSelf := False;
                Result := 36;
                Exit;
              end;
            end;
            if AllowUseMagic(40) and m_Master.CheckPrivateClean and (GetTickCount - m_SkillUseTick[40] > 1000 * 3) then begin //沥拳贱
              m_boSelSelf := False;
              Result := 40;
              Exit;
            end;
          end;

          if AllowUseMagic(15) and (m_wStatusTimeArr[STATE_DEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[15] > 1000 * 3) then begin
            if CheckHeroAmulet2(1, 5, 15, 1, nAmuletIdx) then begin //措瘤盔龋
              m_boSelSelf := True;
              Result := 15;
              Exit;
            end;
          end;
          if AllowUseMagic(14) and (m_wStatusTimeArr[STATE_MAGDEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[14] > 1000 * 3) then begin
            if CheckHeroAmulet2(1, 5, 14, 1, nAmuletIdx) then begin //亲付柳过
              m_boSelSelf := True;
              Result := 14;
              Exit;
            end;
          end;
          if (m_dwStatusArrTimeOutTick[15] <= 0) and AllowUseMagic(36) and (GetTickCount - m_SkillUseTick[36] > 1000 * 3) then begin
            if CheckHeroAmulet2(1, 5, 36, 1, nAmuletIdx) then begin //公必柳扁
              m_boSelSelf := True;
              Result := 36;
              Exit;
            end;
          end;
          if AllowUseMagic(40) and CheckPrivateClean and (GetTickCount - m_SkillUseTick[40] > 1000 * 3) then begin     //沥拳贱
            m_boSelSelf := True;
            Result := 40;
            Exit;
          end;

      end;



    3: begin     //康旷磊按    SelectMagic
          if m_UseItems[U_Weapon].wIndex > 0 then
            StdItem:=UserEngine.GetStdItem(m_UseItems[U_Weapon].wIndex);

          if AllowUseMagic(59) and (m_AssassinHitSkill <> nil) then begin  //例疙八过 硅奎绰瘤
            Dec(m_btAssassinHitCount);
            if m_btAssassinHitPointCount = m_btAssassinHitCount then m_boAssassinHit := True;
            if m_btAssassinHitCount <= 0 then begin
              m_btAssassinHitCount := 7 + Random(11) - m_AssassinHitSkill.btLevel;
              m_btAssassinHitPointCount := Random(m_btAssassinHitCount);
            end;
          end;

          nRangeTargetCount := GetNearTargetCount(3);
          if AllowUseMagic(139) and (GetTickCount - m_SkillUseTick[139] > 1000 * (6 + UseMagicDelay(139))) then begin     //侩稼澜
            if (nRangeTargetCount >= 2) then begin //康旷 侩稼澜  夯牢林函 各捞 3付府 捞惑
              Result := 139;
              Exit;
            end;
          end;

          if AllowUseMagic(80) and (GetTickCount - m_SkillUseTick[80] > 1000 *  (5 + UseMagicDelay(80))) then begin     //功汲鄂
            if (CheckTargetXYCount(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 1) >= 1) then begin  //康旷 功汲鄂
              Result := 80;
              Exit;
            end;
          end;

          if AllowUseMagic(72) and (GetTickCount - m_SkillUseTick[72] > 1000 * 10) then begin     //岿窍抄公
            if (CheckTargetXYCount1(m_nCurrX, m_nCurrY, 1) > 2) and (StdItem.StdMode = 99) then begin //康旷岿窍抄公  夯牢林函 各捞 3付府 捞惑
              Result := 72;
              Exit;
            end;
          end;

          nRangeTargetCount := GetNearTargetCount(2);
          if AllowUseMagic(140) and (GetTickCount - m_SkillUseTick[140] > 1000 * (4 + UseMagicDelay(140))) then begin     //荐扼玫戈柳
            if (nRangeTargetCount >= 2) then begin //康旷荐扼玫戈柳  夯牢林函 各捞 3付府 捞惑
              Result := 140;
              Exit;
            end;
          end;

          if AllowUseMagic(63) then begin     //玫捞八
            if GetAttackDir(m_TargetCret, 2, btDir) and (GetTickCount - m_SkillUseTick[63] > 1000 * 7) and (StdItem.StdMode = 99) then begin //康旷玫捞八
              if IsUseSkillThrust then begin
                Result := 63;
                Exit;
              end;
            end;
          end;

          if AllowUseMagic(70) then begin
            if GetAttackDir(m_TargetCret, 1, btDir)  and (GetTickCount - m_SkillUseTick[70] > 1000 * 10) then begin   //康旷竿刀八扁
              if CheckHeroAmulet2(1, 5, 70, 0, nAmuletIdx) and (m_TargetCret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin   //竿刀八扁
                Result := 70;
                Exit;
               end;
            end;
          end;

          if AllowUseMagic(61) and (m_dwStatusArrTimeOutTick[9] <= 0) and (GetTickCount - m_SkillUseTick[61] > 1000 * 10) then begin //康旷眉脚浅
            if AllowUseMagic(69) then begin  //浅脚贱
              if (GetTickCount - m_SkillUseTick[69] > 1000 * 5) then begin
                Result := 61;
                m_boSelSelf := True;
                Exit;
              end;
            end else begin
              Result := 61;
              m_boSelSelf := True;
              Exit;
            end;
          end;

          if AllowUseMagic(69) and (m_dwStatusArrTimeOutTick[10] <= 0) and (GetTickCount - m_SkillUseTick[69] > 1000 * 10) then begin //康旷浅脚贱
            if AllowUseMagic(61) then begin  //眉脚浅
              if (GetTickCount - m_SkillUseTick[61] > 1000 * 5) then begin
                Result := 69;
                m_boSelSelf := True;
                Exit;
              end;
            end else begin
              Result := 69;
              m_boSelSelf := True;
              Exit;
            end;
          end;

          if AllowUseMagic(60) and (GetTickCount - m_SkillUseTick[60] > 50) and (StdItem.StdMode = 99) then begin     //康旷浅八贱
            if m_boUseWindblade then begin
              Result := 60;
              Exit;
            end;
          end;
      end;

  end;
end;

function THeroObject.Think(): Boolean;
var
  nOldX, nOldY, nAmuletIdx: Integer;
  UserMagic: pTUserMagic;//20071224
  nCheckCode: Byte;
  dwAttackTime: LongWord;
  nX, nY: Integer;
resourcestring
  sExceptionMsg = 'THeroObject.Think Code:%d';
begin
  Result := False;
  nCheckCode:= 0;
  Try
    if m_Master = nil then Exit;
    if (m_Master.m_nCurrX = m_nCurrX) and (m_Master.m_nCurrY = m_nCurrY) then begin //20080710
      m_boDupMode := True;
    end else begin
      if (GetTickCount - m_dwThinkTick) > 1000 then begin
        m_dwThinkTick := GetTickCount();
        if m_PEnvir.GetXYObjCount(m_nCurrX, m_nCurrY) >= 2 then m_boDupMode := True;
        nCheckCode:= 13;
        if (m_TargetCret <> nil) then begin
          if (not IsProperTarget(m_TargetCret)) then m_TargetCret := nil;
        end;
      end;
    end;
    nCheckCode:= 1;
    if m_boDupMode and (m_btStatus <> 1) and (GetTickCount()- dwTick3F4 > m_dwWalkIntervalTime) then begin //绒侥捞 酒匆锭
      dwTick3F4 := GetTickCount();
      nOldX := m_nCurrX;
      nOldY := m_nCurrY;
      WalkTo(Random(8), False);
      if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
        m_boDupMode := False;
        Result := True;
      end;
    end;
    nCheckCode:= 2;

     case m_btJob of             //流诀函版
      0: begin
        nCheckCode:= 4;
        if (m_TargetCret = nil) and (m_btStatus = 0) and (m_btAiMode <> 2) then begin
           m_boIsUseMagic := False;
        end;
      end;
      1: begin //康旷贱荤 Think
          nCheckCode:= 21;
          if (m_TargetCret = nil) and (m_btStatus = 0) and (m_btAiMode <> 2) then begin
            if (GetTickCount - m_SkillUseTick[0] > 1800) then begin     //立加 饶 2檬饶俊
              if (AllowUseMagic(31)) and (m_wStatusTimeArr[STATE_BUBBLEDEFENCEUP] = 0) and (not m_boAbilMagBubbleDefence) and (GetTickCount - m_SkillUseTick[31] > 1000 * 15)  then begin
                if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   m_SkillUseTick[31] := GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   UserMagic := FindMagic(31);
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, Self);
                end;
              end;
            end;
          end;
        end;

      2: begin //康旷档荤  Think
           nCheckCode:= 28;
           //林牢 刚历
           if (m_TargetCret = nil) and (m_btStatus = 0) and (m_btAiMode <> 2) then begin
             if (GetTickCount - m_SkillUseTick[0] > 1800) then begin     //立加 饶 2檬饶俊
               if AllowUseMagic(15) and (m_Master.m_wStatusTimeArr[STATE_DEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[15] > 1000 * 15) and CheckHeroAmulet2(1, 5, 15, 1, nAmuletIdx) then begin //给主人打魔防
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   m_SkillUseTick[15] := GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   UserMagic := FindMagic(15);
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_Master.m_nCurrX, m_Master.m_nCurrY, m_Master);
                 end;
               end;
               nCheckCode:= 26;
               if AllowUseMagic(14) and (m_Master.m_wStatusTimeArr[STATE_MAGDEFENCEUP] = 0) and (GetTickCount - m_SkillUseTick[14] > 1000 * 15) and CheckHeroAmulet2(1, 5, 14, 1, nAmuletIdx)  then begin //给主人打魔防
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   m_SkillUseTick[14] := GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   UserMagic := FindMagic(14);
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_Master.m_nCurrX, m_Master.m_nCurrY, m_Master);
                 end;
               end;
               if (m_Master.m_dwStatusArrTimeOutTick[15] <= 0) and AllowUseMagic(36) and (GetTickCount - m_SkillUseTick[36] > 1000 * 5) and CheckHeroAmulet2(1, 5, 36, 1, nAmuletIdx) then begin
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   m_SkillUseTick[36] := GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   UserMagic := FindMagic(36);
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_Master.m_nCurrX, m_Master.m_nCurrY, m_Master);
                 end;
               end;

             //康旷 夯牢
               if AllowUseMagic(15) and (m_wStatusTimeArr[STATE_DEFENCEUP] = 0) and CheckHeroAmulet2(1, 5, 15, 1, nAmuletIdx) and
                 (GetTickCount - m_SkillUseTick[15] > 1000 * 15) then begin
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   UserMagic := FindMagic(15);
                   m_SkillUseTick[15]:= GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   m_boIsUseMagic := False;
                  if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, self);
                 end;
               end;
               nCheckCode:= 29;
               if AllowUseMagic(14) and (m_wStatusTimeArr[STATE_MAGDEFENCEUP] = 0) and CheckHeroAmulet2(1, 5, 14, 1, nAmuletIdx) and
                (GetTickCount - m_SkillUseTick[14] > 1000 * 15) then begin
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   UserMagic := FindMagic(14);
                   m_SkillUseTick[14]:= GetTickCount;
                   m_SkillUseTick[0] := GetTickCount;
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, self);
                 end;
               end;
               if (m_dwStatusArrTimeOutTick[15] <= 0) and AllowUseMagic(36) and (GetTickCount - m_SkillUseTick[36] > 1000 * 5) and CheckHeroAmulet2(1, 5, 36, 1, nAmuletIdx) then begin
                 if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                   m_SkillUseTick[36] := GetTickCount;
                   UserMagic := FindMagic(36);
                   m_SkillUseTick[0] := GetTickCount;
                   m_boIsUseMagic := False;
                   if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, self);
                 end;
               end;

               if (m_Master.m_WAbil.HP <= Round(m_Master.m_WAbil.MaxHP * 0.7)) and (m_WAbil.MP > 10)
                 and (GetTickCount - m_SkillUseTick[2] > 3000) and (m_TargetCret = nil) then begin
                 if AllowUseMagic(29) then begin
                   if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                     m_SkillUseTick[2] := GetTickCount;
                     UserMagic := FindMagic(29);
                     m_SkillUseTick[0] := GetTickCount;
                     m_boIsUseMagic := False;
                     if UserMagic <> nil then DoSpell(UserMagic, m_Master.m_nCurrX, m_Master.m_nCurrY, m_Master);
                   end;
                 end else
                 if AllowUseMagic(2) then begin
                   if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                     m_SkillUseTick[2] := GetTickCount;
                     UserMagic := FindMagic(2);
                     m_SkillUseTick[0] := GetTickCount;
                     m_boIsUseMagic := False;
                    if UserMagic <> nil then DoSpell(UserMagic, m_Master.m_nCurrX, m_Master.m_nCurrY, m_Master);
                   end;
                 end;
               end;
               nCheckCode:= 23;
               if (m_WAbil.HP <= Round(m_WAbil.MaxHP * 0.7)) and (m_WAbil.MP > 10)
                 and (GetTickCount - m_SkillUseTick[2] > 3000) and (m_TargetCret= nil) then begin
                 if AllowUseMagic(29) then begin
                   if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                     m_SkillUseTick[2] := GetTickCount;
                     UserMagic := FindMagic(29);
                     m_SkillUseTick[0] := GetTickCount;
                     m_boIsUseMagic := False;
                     if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, Self);
                   end;
                 end else
                 if AllowUseMagic(2) then begin
                   if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                     m_SkillUseTick[2] := GetTickCount;
                     UserMagic := FindMagic(2);
                     m_SkillUseTick[0] := GetTickCount;
                     m_boIsUseMagic := False;
                     if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, Self);
                   end;
                 end;
               end;
             end;
           end;
        end;

       3: begin//康旷磊按 去磊 公傍静绰芭,,
         nCheckCode:= 20;
         if (m_TargetCret = nil) and (m_btStatus = 0) and (m_btAiMode <> 2) then begin
           if (GetTickCount - m_SkillUseTick[0] > 1800) then begin   //立加 饶 2檬饶俊
             if AllowUseMagic(61) and (m_dwStatusArrTimeOutTick[9] <= 0) and (GetTickCount - m_SkillUseTick[61] > 1000 * 10) then begin //眉脚浅
               if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                 UserMagic := FindMagic(61);
                 m_SkillUseTick[61]:= GetTickCount;
                 m_SkillUseTick[0] := GetTickCount;
                 m_boIsUseMagic := False;
                 if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, self);
               end;
             end;
             if AllowUseMagic(69) and (m_dwStatusArrTimeOutTick[10] <= 0) and (GetTickCount - m_SkillUseTick[69] > 1000 * 10) then begin //浅脚贱
               if (GetTickCount - m_SkillUseTick[0] > 500 * 1) then begin
                 UserMagic := FindMagic(69);
                 m_SkillUseTick[69]:= GetTickCount;
                 m_SkillUseTick[0] := GetTickCount;
                 m_boIsUseMagic := False;
                 if UserMagic <> nil then DoSpell(UserMagic, m_nCurrX, m_nCurrY, self);
               end;
             end;
           end;
         end;
       end;

     end;
     nCheckCode:= 3;
    //绒侥葛靛捞搁辑 汲沥蔼捞 捞悼啊瓷捞芭唱 // 绒侥葛靛 酒匆锭.
    if ((m_btStatus < 1) or ((m_btStatus = 1))) and (not m_boProtectStatus) and
      (m_PEnvir <> m_Master.m_PEnvir) and
      ((abs(m_nCurrX - m_Master.m_nCurrX) > 10) or
      (abs(m_nCurrY - m_Master.m_nCurrY) > 10)) then begin
      m_Master.GetBackPosition(nX, nY);
      SpaceMove(m_Master.m_PEnvir.sMapName, nX, nY, 1);
    end;
  except
    MainOutMessage(Format(sExceptionMsg, [nCheckCode]));
  end;
end;

function THeroObject.UseStdmodeFunItem(StdItem: pTStdItem): Boolean;
begin
  Result := True;
  //if StdItem.AniCount in [Low(g_FunctionNPC.FStdModeFunc)..High(g_FunctionNPC.FStdModeFunc)] then
   // NpcGotoLable(g_FunctionNPC, g_FunctionNPC.FStdModeFunc[StdItem.AniCount], False);
end;

//检测指定方向和范围内,目标与英雄的距离 20080426
function THeroObject.CheckMasterXYOfDirection(TargeTBaseObject: TBaseObject; nX, nY, nDir, nRange: Integer): Integer;
begin
  Result := 0;
  if TargeTBaseObject <> nil then begin
    if not TargeTBaseObject.m_boDeath then begin
        case nDir of
          DR_UP: begin
              if (abs(nX - TargeTBaseObject.m_nCurrX) <= nRange) and ((TargeTBaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
            end;
          DR_UPRIGHT: begin
              if ((TargeTBaseObject.m_nCurrX - nX) in [0..nRange]) and ((TargeTBaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
            end;
          DR_RIGHT: begin
              if ((TargeTBaseObject.m_nCurrX - nX) in [0..nRange]) and (abs(nY - TargeTBaseObject.m_nCurrY) <= nRange) then Inc(Result);
            end;
          DR_DOWNRIGHT: begin
              if ((TargeTBaseObject.m_nCurrX - nX) in [0..nRange]) and ((nY - TargeTBaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
            end;
          DR_DOWN: begin
              if (abs(nX - TargeTBaseObject.m_nCurrX) <= nRange) and ((nY - TargeTBaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
            end;
          DR_DOWNLEFT: begin
              if ((nX - TargeTBaseObject.m_nCurrX) in [0..nRange]) and ((nY - TargeTBaseObject.m_nCurrY) in [0..nRange]) then Inc(Result);
            end;
          DR_LEFT: begin
              if ((nX - TargeTBaseObject.m_nCurrX) in [0..nRange]) and (abs(nY - TargeTBaseObject.m_nCurrY) <= nRange) then Inc(Result);
            end;
          DR_UPLEFT: begin
              if ((nX - TargeTBaseObject.m_nCurrX) in [0..nRange]) and ((TargeTBaseObject.m_nCurrY - nY) in [0..nRange]) then Inc(Result);
            end;
        end;
    end;
  end;
end;

procedure THeroObject.MakeWeaponUnlock;
begin
  if m_UseItems[U_WEAPON].wIndex <= 0 then Exit;
  if m_UseItems[U_WEAPON].btValue[3] > 0 then begin
    Dec(m_UseItems[U_WEAPON].btValue[3]);
    SysMsg('英雄的武器被诅咒了。', c_Red, t_Hint);
  end else begin
    if m_UseItems[U_WEAPON].btValue[4] < 10 then begin
      Inc(m_UseItems[U_WEAPON].btValue[4]);
      SysMsg('英雄的武器被诅咒了。', c_Red, t_Hint);
    end;
  end;
  if m_btRaceServer = RC_HEROOBJECT then begin
    RecalcAbilitys();
    SendUpdateItem(@m_UseItems[U_WEAPON]);  //历林 钎矫
    SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
    SendMsg(Self, RM_SUBABILITY, 0, 0, 0, 0, '');
  end;
end;


function THeroObject.WeaptonMakeLuck: Boolean;       //康旷 绵扁
var
  StdItem: TItem;
  nRand: Integer;
  boMakeLuck: Boolean;
begin
  Result := False;
  if (m_UseItems[U_WEAPON].wIndex <= 0) or (m_UseItems[U_WEAPON].btValue[19] = 1) or (m_UseItems[U_WEAPON].btValue[19] > 2) then exit;  //措咯公扁 豪牢袍 绵扁 x
  nRand := 0;
  StdItem := UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
  if StdItem <> nil then begin
    nRand := abs((HiWord(StdItem.DC) - LoWord(StdItem.DC))) div 5;
  end;
  if Random(g_Config.nWeaponMakeUnLuckRate {20}) = 1 then begin
    MakeWeaponUnlock();
  end else begin
    boMakeLuck := False;
    if m_UseItems[U_WEAPON].btValue[4] > 0 then begin
      Dec(m_UseItems[U_WEAPON].btValue[4]);
      boMakeLuck := True;
    end else if m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint1 {1} then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      boMakeLuck := True;
    end else if (m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint2 {3}) and (Random(nRand + g_Config.nWeaponMakeLuckPoint2Rate {6}) = 1) then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      boMakeLuck := True;
    end else if (m_UseItems[U_WEAPON].btValue[3] < g_Config.nWeaponMakeLuckPoint3 {7}) and (Random(nRand * g_Config.nWeaponMakeLuckPoint3Rate {10 + 30}) = 1) then begin
      Inc(m_UseItems[U_WEAPON].btValue[3]);
      boMakeLuck := True;
    end;
    if m_btRaceServer = RC_HEROOBJECT then begin
      RecalcAbilitys();
      SendUpdateItem(@m_UseItems[U_WEAPON]);
      SendMsg(m_Master, RM_ABILITY, 0, 0, 0, 0, '');
      SendMsg(m_Master, RM_SUBABILITY, 0, 0, 0, 0, '');
    end;
    if boMakeLuck then SysMsg('英雄的武器获得了幸运。', c_Green, t_Hint);
    if not boMakeLuck then SysMsg('英雄的武器没有获得效果。', c_Green, t_Hint);
  end;
  Result := True;
end;

//走向目标
function THeroObject.WalkToTargetXY(nTargetX, nTargetY: Integer): Boolean;
var
  I: Integer;
  nDir: Integer;
  n10: Integer;
  n14: Integer;
  n20: Integer;
  nOldX: Integer;
  nOldY: Integer;
begin
  Result := False;
  if m_boTransparent and (m_boHideMode) then m_wStatusTimeArr[STATE_TRANSPARENT ] := 1;//隐身,一动就显身
  if (m_wStatusTimeArr[POISON_STONE] <> 0) and (not g_Config.ClientConf.boParalyCanSpell) then Exit;//麻痹不能跑动
  if (abs(nTargetX - m_nCurrX) > 1) or (abs(nTargetY - m_nCurrY) > 1) then begin
    if GetTickCount()- dwTick3F4 > m_dwWalkIntervalTime then
    begin //增加走间隔
      n10 := nTargetX;
      n14 := nTargetY;
      nDir := DR_DOWN;
      if n10 > self.m_nCurrX then begin
        nDir := DR_RIGHT;
        if n14 > m_nCurrY then nDir := DR_DOWNRIGHT;
        if n14 < m_nCurrY then nDir := DR_UPRIGHT;
      end else begin
        if n10 < m_nCurrX then begin
          nDir := DR_LEFT;
          if n14 > m_nCurrY then nDir := DR_DOWNLEFT;
          if n14 < m_nCurrY then nDir := DR_UPLEFT;
        end else begin
          if n14 > m_nCurrY then nDir := DR_DOWN
          else if n14 < m_nCurrY then nDir := DR_UP;
        end;
      end;
      nOldX := m_nCurrX;
      nOldY := m_nCurrY;
      WalkTo(nDir, False);
      if (abs(nTargetX - m_nCurrX) <= 1) and (abs(nTargetY - m_nCurrY) <= 1) then begin
         Result := True;
         dwTick3F4 := GetTickCount();
      end;
      if not Result then begin
        n20 := Random(3);
        for I := DR_UP to DR_UPLEFT do begin
          if (nOldX = m_nCurrX) and (nOldY = m_nCurrY) then begin
            if n20 <> 0 then Inc(nDir)
            else if nDir > 0 then Dec(nDir)
            else nDir := DR_UPLEFT;
            if (nDir > DR_UPLEFT) then nDir := DR_UP;
            WalkTo(nDir, False);
            if (abs(nTargetX - m_nCurrX) <= 1) and (abs(nTargetY - m_nCurrY) <= 1) then begin
              Result := True;
              dwTick3F4 := GetTickCount();
              Break;
            end;
          end;
        end;
      end;
    end;//20080217
  end;
end;

//转向
function THeroObject.WalkToTargetXY2(nTargetX, nTargetY: Integer): Boolean;
var
  I: Integer;
  nDir: Integer;
  n10: Integer;
  n14: Integer;
  n20: Integer;
  nOldX: Integer;
  nOldY: Integer;
begin
  Result := False;
  if m_boTransparent and (m_boHideMode) then m_wStatusTimeArr[STATE_TRANSPARENT ] := 1;//隐身,一动就显身
  if (m_wStatusTimeArr[POISON_STONE] <> 0) and (not g_Config.ClientConf.boParalyCanSpell) then Exit;//麻痹不能跑动
  if (nTargetX <> m_nCurrX) or (nTargetY <> m_nCurrY) then begin
    if GetTickCount()- dwTick3F4 > m_dwTurnIntervalTime then
    begin //增加转向间隔
      n10 := nTargetX;
      n14 := nTargetY;
      nDir := DR_DOWN;
      if n10 > m_nCurrX then begin
        nDir := DR_RIGHT;
        if n14 > m_nCurrY then nDir := DR_DOWNRIGHT;
        if n14 < m_nCurrY then nDir := DR_UPRIGHT;
      end else begin
        if n10 < m_nCurrX then begin
          nDir := DR_LEFT;
          if n14 > m_nCurrY then nDir := DR_DOWNLEFT;
          if n14 < m_nCurrY then nDir := DR_UPLEFT;
        end else begin
          if n14 > m_nCurrY then nDir := DR_DOWN
          else if n14 < m_nCurrY then nDir := DR_UP;
        end;
      end;
      nOldX := m_nCurrX;
      nOldY := m_nCurrY;
      WalkTo(nDir, False);
      if (nTargetX = m_nCurrX) and (nTargetY = m_nCurrY) then begin
        Result := True;
        dwTick3F4 := GetTickCount();
      end;
      if not Result then begin
        n20 := Random(3);
        for I := DR_UP to DR_UPLEFT do begin
          if (nOldX = m_nCurrX) and (nOldY = m_nCurrY) then begin
            if n20 <> 0 then Inc(nDir)
            else if nDir > 0 then Dec(nDir)
            else nDir := DR_UPLEFT;
            if (nDir > DR_UPLEFT) then nDir := DR_UP;
            WalkTo(nDir, False);
            if (nTargetX = m_nCurrX) and (nTargetY = m_nCurrY) then begin
              Result := True;
              dwTick3F4 := GetTickCount();
              Break;
            end;
          end;
        end;
      end;
    end;//20080217
  end;
end;

function THeroObject.WarrAttackTarget(wMagIdx, wHitMode: Word): Boolean;     //康旷傍拜
var
  bt06, nCode: Byte;
  dwDelayTime: LongWord;
  nRange: Integer;
begin
  Result := False;
  nCode:= 0;
try
   nCode:= 1;
  if m_TargetCret <> nil then begin
     nCode:= 2;
    nRange := 1;
    if (wMagIdx in [12, 63]) then nRange := 2;  //绢八贱, 玫捞八

    if CanAttack(m_TargetCret, nRange, bt06) then begin
      nCode:= 3;
      m_dwTargetFocusTick := GetTickCount();
      nCode:= 4;
      AttackDir(m_TargetCret, wHitMode, bt06);
      nCode:= 5;
      BreakHolySeizeMode();

      m_SkillUseTick[wMagIdx] := GetTickCount;
      m_SkillUseTick[0] := GetTickCount;
      m_dwHitTick := GetTickCount();

      Result := True;
    end else begin
      nCode:= 6;
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        nCode:= 7;
        SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      end else begin
        nCode:= 8;
        DelTargetCreat();
      end;
    end;
  end;
  except
    on E: Exception do begin
      MainOutMessage('THeroObject.WarrAttackTarget Code:'+inttostr(nCode));
    end;
  end;
end;

function THeroObject.GetSpellPoint(UserMagic: pTUserMagic): Integer;
begin
  Result := Round(UserMagic.MagicInfo.wSpell / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) + UserMagic.MagicInfo.btDefSpell;
end;

function THeroObject.UseMagicDelay(wMagIdx: Word):Integer;
var
  UserMagic: pTUserMagic;
  nSpellPoint: Integer;
begin
  Result := 0;
  UserMagic := FindMagic(wMagIdx);
  if UserMagic <> nil then begin
    Result := UserMagic.MagicInfo.dwUseDelayTime;
  end;
end;

function THeroObject.AllowUseMagic(wMagIdx: Word): Boolean;
var
  UserMagic: pTUserMagic;
  nSpellPoint: Integer;
begin
  Result := False;
    UserMagic := FindMagic(wMagIdx);
    if UserMagic <> nil then begin
      if not MagicManager.IsWarrSkill( UserMagic.wMagIdx) then begin
        if (UserMagic.btKey > 0) then begin
          nSpellPoint := GetSpellPoint(UserMagic);
          if (nSpellPoint > 0) and (nSpellPoint <= m_WAbil.MP) then
             Result := True;
        end;
      end else begin
        Result := (UserMagic.btKey > 0) or (UserMagic.wMagIdx = 7)  or (UserMagic.wMagIdx = 59);    //抗档, 例疙八过 虐 汲沥 救秦档 凳.
      end;
    end;
end;

function THeroObject.OrderAllowUseMagic(wMagIdx: Word): Integer;
var
  UserMagic: pTUserMagic;
  nSpellPoint: Integer;
  I, k: Integer;
begin
  Result := -1;
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic := m_MagicList.Items[I];
    for k := 1 to 7 do begin
      if (UserMagic.btKey > 0) and (Chr(UserMagic.btKey) = IntToStr(K)) and (UserMagic.wMagIdx = wMagIdx) then begin
        Result := UserMagic.wMagIdx;
        MainOutMessage('技能检测: ' + IntToStr(Result) + ' / '+ Chr(UserMagic.btKey) );
        Break;
      end;
    end;
  end;
end;


function THeroObject.GetNearTargetCount(rage:Integer): Integer; //林函鸥南
var
  nC, n10, I: Integer;
  nX, nY: Integer;
  BaseObject: TBaseObject;
begin
  Result := 0;
  for n10 := 0 to 7 do begin
    if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, n10, rage, nX, nY) then begin
      BaseObject := TBaseObject(m_PEnvir.GetMovingObject(nX, nY, True));
      if (BaseObject <> nil) and (not BaseObject.m_boDeath) and (not BaseObject.m_boGhost) and IsProperTarget(BaseObject) then begin
        Inc(Result);
      end;
    end;
  end;
end;



function THeroObject.GetRangeFriendCount(nX, nY, nRange: Integer): Integer;
var
  BaseObjectList: TList;
  BaseObject: TBaseObject;
  I: Integer;
begin
  Result := 0;
  BaseObjectList := TList.Create;
  if GetMapBaseObjects(m_PEnvir, nX, nY, nRange, BaseObjectList) then begin
    for I := BaseObjectList.Count - 1 downto 0 do begin
      BaseObject := TBaseObject(BaseObjectList.Items[I]);
      if (BaseObject.m_boHideMode and not m_boCoolEye) or (not IsProperFriend(BaseObject)) then begin
        BaseObjectList.Delete(I);
      end;
    end;
    Result := BaseObjectList.Count;
  end;
  FreeAndNil(BaseObjectList);
end;

function THeroObject.FindVisibleActors(ActorObject: TBaseObject): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to m_VisibleActors.Count - 1 do begin
    if (pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject = ActorObject) then begin
      Result := True;
      Break;
    end;
  end;
end;

function THeroObject.UseSpell(UserMagic: pTUserMagic; nTargetX, nTargetY: Integer;
  TargeTActorObject: TBaseObject; mode: byte): Boolean;
var
  nSpellPoint: Integer;
  n14: Integer;
  BaseObject: TBaseObject;
  dwCheckTime: LongWord;
  boIsWarrSkill: Boolean;
resourcestring
  sDisableMagicCross = '该地图上不能使用技能%s。';
begin
  Result := False;
  if m_boDeath or (m_wStatusTimeArr[POISON_STONE] <> 0) or (m_wStatusTimeArr[POISON_FREEZE] <> 0) or
      (m_wStatusTimeArr[POISON_STUN] <> 0) then Exit;

  boIsWarrSkill := MagicManager.IsWarrSkill(UserMagic.wMagIdx);
  Dec(m_nSpellTick, 450);
  m_nSpellTick := _MAX(0, m_nSpellTick);

  if (UserMagic.wMagIdx = SKILL_WINDBLADE) then begin   //浅八贱
    if not checkweapon(Self) then begin  //磊按 公扁 绝澜
      exit;
    end;
  end;

  case UserMagic.wMagIdx of //
    SKILL_ERGUM: begin //绢八贱()
        if m_MagicErgumSkill <> nil then begin
          if not m_boUseThrusting then begin
            ThrustingOnOff(True);
          end else begin
            ThrustingOnOff(False);
          end;
        end;
        Result := True;
      end;
    SKILL_BANWOL: begin //馆岿八过
        if m_MagicBanwolSkill <> nil then begin
          if not m_boUseHalfMoon then begin
            HalfMoonOnOff(True);
          end else begin
            HalfMoonOnOff(False);
          end;
        end;
        Result := True;
      end;

    SKILL_FIRESWORD: begin //堪拳搬
        if m_MagicFireSwordSkill <> nil then begin
          if AllowFireHitSkill then begin
            nSpellPoint := GetSpellPoint(UserMagic);
            if m_WAbil.MP >= nSpellPoint then begin
              if nSpellPoint > 0 then begin
                DamageSpell(nSpellPoint);
                HealthSpellChanged();
              end;

            end;
          end;
        end;
        Result := True;
      end;

    SKILL_TWINBLADE: begin //街锋曼
        if m_MagicTwnHitSkill <> nil then begin
          if AllowTwinHitSkill then begin
             nSpellPoint:=GetSpellPoint(UserMagic);
             if m_WAbil.MP >= nSpellPoint then begin
               if nSpellPoint > 0 then begin
                 DamageSpell(nSpellPoint);
                 HealthSpellChanged();
               end;

             end else
                ;
          end;
          Result := True;
        end;

      end;

    SKILL_WINDBLADE: begin   //康旷浅八贱
        if m_MagicWindbladeSkill <> nil then begin
          if not m_boUseWindblade then begin
            WindbladeOnOff(True);
          end else begin
            WindbladeOnOff(False);
          end;
        end;
        Result := True;
      end;

     SKILL_NANHWA{131}: begin   //抄拳趋浅曼
          if m_MagicNanCrsSkill <> nil then begin
            if not m_boNanCrsHitkill then begin
              if m_boUseHalfMoon then begin
                HalfMoonOnOff(False);
                SendSocket(nil,'+UWID');
              end;
              SkillNanCrsOnOff(True);
              SendSocket(nil,'+NCRS');
            end else begin
              SkillNanCrsOnOff(False);
              SendSocket(nil,'+UNCRS');
            end;
          end;
          Result:=True;
        end;

  else begin
      n14 := GetNextDirection(m_nCurrX, m_nCurrY, nTargetX, nTargetY);
      m_btDirection := n14;
      BaseObject := nil;
      if mode = 0 then begin
        case UserMagic.wMagIdx of
            SKILL_HEALLING,              //雀汗贱
            SKILL_HANGMAJINBUB,          //亲付柳过
            SKILL_DEJIWONHO ,            //措瘤盔龋
            SKILL_ENHANCER,              //公必柳扁
            SKILL_PURI,                  //沥拳贱
            SKILL_BODDYWIND,             //眉脚浅
            SKILL_PUNGSIN,               //浅脚贱
            SKILL_SHIELD,                //林贱狼阜
            SKILL_BIGHEALLING : begin    //措雀汗贱
              if m_boSelSelf then begin
                BaseObject := Self;
                nTargetX := m_nCurrX;
                nTargetY := m_nCurrY;
              end else begin
                if m_Master <> nil then begin
                  BaseObject := m_Master;
                  nTargetX := m_Master.m_nCurrX;
                  nTargetY := m_Master.m_nCurrY;
                end else begin
                  BaseObject := Self;
                  nTargetX := m_nCurrX;
                  nTargetY := m_nCurrY;
                end;
              end;
            end;
        else begin
          if CretInNearXY(TargeTActorObject, nTargetX, nTargetY) then begin
            BaseObject := TargeTActorObject;
            nTargetX := BaseObject.m_nCurrX;
            nTargetY := BaseObject.m_nCurrY;
          end;
        end;
        end;
      end else begin
          if CretInNearXY(TargeTActorObject, nTargetX, nTargetY) then begin
            BaseObject := TargeTActorObject;
            nTargetX := BaseObject.m_nCurrX;
            nTargetY := BaseObject.m_nCurrY;
            SetTargetCreat(TargeTActorObject);
          end;
      end;

      if not AutoSpell(UserMagic, nTargetX, nTargetY, BaseObject) then begin
        SendRefMsg(RM_MAGICFIREFAIL, 0, 0, 0, 0, '');
      end;
      Result := True;
    end;
  end;
end;

function THeroObject.AutoSpell(UserMagic: pTUserMagic; nTargetX,
  nTargetY: Integer; BaseObject: TBaseObject): Boolean;
var
  nSpellPoint: Integer;
begin
  Result := False;
  try
    if not MagicManager.IsWarrSkill(UserMagic.wMagIdx) then begin
      nSpellPoint := GetSpellPoint(UserMagic);
      if nSpellPoint > 0 then begin
        if m_WAbil.MP < nSpellPoint then Exit;
        DamageSpell(nSpellPoint);
        HealthSpellChanged();
      end;
      Result := DoSpell(UserMagic, nTargetX, nTargetY, BaseObject);
    end;
  except
    on E: Exception do begin
      MainOutMessage(Format('[Exception] THeroObject.AutoSpell MagID:%d X:%d Y:%d', [UserMagic.wMagIdx, nTargetX, nTargetY]));
      MainOutMessage(E.Message);
    end;
  end;
end;


function THeroObject.DoSpell(UserMagic: pTUserMagic; nTargetX, nTargetY: Integer;
  TargeTBaseObject: TBaseObject): Boolean;
  function directionDir(dir: integer): integer;
  begin
    if dir in [0..3] then begin
      Result := dir + 4;
    end else begin
      Result := dir - 4;
    end;
  end;
var
  boTrain: Boolean;
  boSpellFail: Boolean;
  boSpellFire: Boolean;
  btAmuletType: Byte;
  boMove: Boolean;
  nPower, n14, n1C, n18, nAmuletIdx: Integer;
  Gap, MoC, Dur: integer;
  nDelayTime: Integer;
  StdItem :TItem;
  VampPower   :Integer;
  function MPow(UserMagic: pTUserMagic): Integer; //004921C8
  begin
    Result := UserMagic.MagicInfo.wPower + Random(UserMagic.MagicInfo.wMaxPower - UserMagic.MagicInfo.wPower);
  end;
  function GetPower(nPower: Integer): Integer; //00493314
  begin
    Result := ROUND(nPower / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) +
      (UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower));
  end;
  function GetPower13(nInt: Integer): Integer; //0049338C
  var
    d10: Double;
    d18: Double;
  begin
    d10 := nInt / 3.0;
    d18 := nInt - d10;
    Result := ROUND(d18 / (UserMagic.MagicInfo.btTrainLv + 1) *
      (UserMagic.btLevel + 1) + d10 + (UserMagic.MagicInfo.btDefPower +
      Random(UserMagic.MagicInfo.btDefMaxPower -
      UserMagic.MagicInfo.btDefPower)));
  end;
  function GetRPow(wInt: Integer): Word; //取伤害中间随机值
  begin
    if HiWord(wInt) > LoWord(wInt) then begin
      Result := Random(HiWord(wInt) - LoWord(wInt) + 1) + LoWord(wInt);
    end
    else
      Result := LoWord(wInt);
  end;
  procedure sub_4934B4(PlayObject: TBaseObject);  //
  begin
    if PlayObject.m_UseItems[U_ARMRINGL].Dura < 1 then begin
      PlayObject.m_UseItems[U_ARMRINGL].Dura := 0;
      if PlayObject.m_btRaceServer = RC_PLAYOBJECT then begin
        TPlayObject(PlayObject).SendDelItems(@PlayObject.m_UseItems[U_ARMRINGL]);
      end else
        if PlayObject.m_btRaceServer = RC_HEROOBJECT then begin
        THeroObject(PlayObject).SendDelItems(@PlayObject.m_UseItems[U_ARMRINGL]);
      end;
      PlayObject.m_UseItems[U_ARMRINGL].wIndex := 0;
    end;
  end;
begin
  Result := False;
  boMove := False;
  if MagicManager.IsWarrSkill(UserMagic.wMagIdx) then exit;

  if (TargeTBaseObject <> nil) and ((abs(self.m_nCurrX - nTargetX) > g_Config.nMagicAttackRage) or
    (abs(self.m_nCurrY - nTargetY) > g_Config.nMagicAttackRage)) then begin
    Exit;
  end;

  SendRefMsg(RM_SPELL, UserMagic.MagicInfo.btEffect, nTargetX, nTargetY,  UserMagic.MagicInfo.wMagicId, '');
  boTrain := False;
  boSpellFail := False;
  boSpellFire := True;

  if (TargeTBaseObject <> nil) and TargeTBaseObject.m_boDeath then TargeTBaseObject := nil;

  case UserMagic.MagicInfo.wMagicId of //
    SKILL_FIREBALL {1}, //拳堪厘
    SKILL_FIREBALL2 {5}: begin //陛碍拳堪厘
        if MagCanHitTarget(m_nCurrX, m_nCurrY, TargeTBaseObject) then begin
          if IsProperTarget (TargeTBaseObject) then begin
            if (TargeTBaseObject.m_nAntiMagic <= Random(50)) and (abs(TargeTBaseObject.m_nCurrX-nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY-nTargetY) <= 1) then begin
               nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1);
              SendDelayMsg (m_Master, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2, integer(TargeTBaseObject), '', 600);
              boTrain:=True;
            end else
              TargeTBaseObject := nil;
          end else
           TargeTBaseObject := nil;
        end else
      end;

    SKILL_HEALLING {2}: begin //雀汗贱
        if TargeTBaseObject = nil then begin
          TargeTBaseObject:=Self;
          nTargetX:=m_nCurrX;
          nTargetY:=m_nCurrY;
        end;
        if IsProperFriend(TargeTBaseObject) then begin
          nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC) * 2,
                                      SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) * 2 + 1);
          if TargeTBaseObject.m_WAbil.HP < TargeTBaseObject.m_WAbil.MaxHP then begin
            TargeTBaseObject.SendDelayMsg(m_Master,RM_MAGHEALING,0,nPower,0,0,'',800);
            boTrain:=True;
          end;
          if m_boAbilSeeHealGauge then
            SendDefMsg(Self, SM_INSTANCEHEALGUAGE, Integer(TargeTBaseObject),
             TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, 0, '');
        end;
      end;
    SKILL_AMYOUNSUL{6}: begin {鞠楷贱}
        boSpellFail:=True;
        if IsProperTarget(TargeTBaseObject) then begin

          if CheckAmulet(Self,1,5,nAmuletIdx) then begin  //刀啊风 犬牢
            StdItem:=UserEngine.GetStdItem(m_UseItems[nAmuletIdx].wIndex);
            if StdItem <> nil then begin
              UseAmulet(SeLF,1,5,nAmuletIdx);
            if 6 >= Random(7 + TargeTBaseObject.m_btAntiPoison) then begin
              case StdItem.Shape of
                7: begin  //雀祸刀啊风 :吝刀
                  nPower:=GetPower13(30) + GetRPow(m_WAbil.SC);
                  TargeTBaseObject.SendDelayMsg(m_Master,RM_POISON,POISON_DECHEALTH,nPower,Integer(m_Master),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
                end;
                8: begin  //炔祸刀啊风 : 规绢仿皑家
                  if (TargeTBaseObject.m_LastHiter = nil) and (TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] > 0) then begin  //弧刀吧搁 踌刀篮 荤扼柳促.
                     TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] := 0;
                  end;
                  nPower:=GetPower13(30) + GetRPow(m_WAbil.SC);
                  TargeTBaseObject.SendDelayMsg(m_Master,RM_POISON,POISON_DAMAGEARMOR,nPower,Integer(m_Master),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
                end;
              end;
              // 哎乔 眉农(sonmg 2005/11/28)
              if ((TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) or (TargeTBaseObject.m_btRaceServer = RC_HEROOBJECT))
                  and ((m_btRaceServer = RC_PLAYOBJECT) or (m_btRaceServer = RC_HEROOBJECT)) then begin    //20110714
                //沥寸规绢甫 困茄 扁废..
                TargeTBaseObject.SetPKFlag (m_Master);
                TargeTBaseObject.SetLastHiter (m_Master);
              end else if (TargeTBaseObject.m_Master <> nil) then begin
              //吝刀等 家券各狼 林牢捞 锭赴荤恩捞 酒聪搁
                if TargeTBaseObject.m_Master <> Self then begin
                 //沥寸规绢甫 困茄 扁废..
                  TargeTBaseObject.SetPKFlag (m_Master);
                  TargeTBaseObject.SetLastHiter (m_Master);
                end;
              end;
             //-----------------------------------------
             if (TargeTBaseObject.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) or (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then
               boTrain:=True;
            end;
            SetTargetCreat(TargeTBaseObject);
            boSpellFail:=False;
            end;
          end;
        end;
      end;


    SKILL_FIRE{9}: begin  //堪荤厘
      n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
      if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
        m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,5,nTargetX,nTargetY);
        nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1);
        if MagPassThroughMagic(n14,n18,nTargetX,nTargetY,n1C,nPower,False) > 0 then
          boTrain:=True;
      end;
    end;
    SKILL_SHOOTLIGHTEN{10}: begin   //汾牢厘
      n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
      if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
        m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,8,nTargetX,nTargetY);
        nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1);
        if MagPassThroughMagic(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
          boTrain:=True;
      end;
    end;
    SKILL_LIGHTENING{11}: begin    //碍拜
      if IsProperTarget (TargeTBaseObject) then begin
        if (Random(50) >= TargeTBaseObject.m_nAntiMagic) then begin
          nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1);
          if TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD then
            nPower:=ROUND(nPower * 1.5);
          SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',600);
          boTrain:=True;
        end else TargeTBaseObject:=nil
      end else TargeTBaseObject:=nil;
    end;

    SKILL_FIRECHARM{13},   //气混拌
    SKILL_HANGMAJINBUB{14},  //亲付柳过
    SKILL_DEJIWONHO{15},     //措瘤盔龋
    SKILL_ENHANCER{36},    //公必柳扁
    SKILL_CURSE{46}     //历林贱
    : begin
      boSpellFail:=True;
        if CheckAmulet(Self,1,5,nAmuletIdx) then begin   //何利 犬牢
          UseAmulet(Self,1,5,nAmuletIdx);
          case UserMagic.MagicInfo.wMagicId of
          SKILL_FIRECHARM{13}: begin
            if MagCanHitTarget(m_nCurrX,m_nCurrY,TargeTBaseObject) then begin
              if IsProperTarget(TargeTBaseObject) then begin
                if Random(50) >= TargeTBaseObject.m_nAntiMagic then begin
                  if (abs(TargeTBaseObject.m_nCurrX - nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY - nTargetY) <= 1) then begin
                    nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),
                                                   SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) * 1 + 50);
                    SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',1200);
                    if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
                      boTrain:=True;
                  end;
                end;
              end;
            end else TargeTBaseObject:=nil;
          end;
          SKILL_HANGMAJINBUB{14}: begin    //亲付柳过
            nPower:= GetAttackPower(GetPower13(60) + 4 * LoWord(m_WAbil.SC),4 * SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1);
            if MagMakeDefenceArea(nTargetX,nTargetY,3,nPower,1) > 0 then
              boTrain:=True;
          end;
          SKILL_DEJIWONHO{15}: begin   //措瘤盔龋
            nPower:= GetAttackPower(GetPower13(60) + 4 * LoWord(m_WAbil.SC),4 * SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1);
            if MagMakeDefenceArea(nTargetX,nTargetY,3,nPower,0) > 0 then
              boTrain:=True;
          end;
          SKILL_ENHANCER{36}: begin //公必柳扁
             if TargeTBaseObject = nil then begin
               TargeTBaseObject := m_Master;
             end;
             n14 := GetAttackPower(GetPower13(60) + LoWord(m_WAbil.SC) * 5,
                  5 * ( SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1) );

             nPower := ((HiWord(m_WAbil.SC)-1) div 5) + 1;
                        if (nPower > 10) then nPower := 10;

             if AttPowerUp(nPower, n14) then
               boTrain:=True;

             if (TargeTBaseObject <> nil) and (TargeTBaseObject <> Self) and IsProperFriend(TargeTBaseObject) and
                (TargeTBaseObject.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) then begin
                if TargeTBaseObject.AttPowerUp(nPower, n14) then begin
                  TargeTBaseObject.SendRefMsg(RM_10205,0,0,0,15,'0');   //公必柳扁 捞蒲飘
                  boTrain:=True;
                end;
             end;
          end;

          SKILL_CURSE{46}: begin   //历林贱
            case UserMagic.btLevel of
              0   : n14 := 10;
              1   : n14 := 30;
              2   : n14 := 50;
              3   : n14 := 70;
            end;

            case UserMagic.btLevel of
              0   : nPower := 93;
              1   : nPower := 88;
              2   : nPower := 82;
              3   : nPower := 75;
            end;
              if MagMakeCurseArea(nTargetX,nTargetY,2, n14 ,nPower,UserMagic.btLevel,True ) > 0 then begin
                boTrain:=True;
              end;
          end;

          end;
          boSpellFail:=False;
        end;
      end;

    SKILL_EARTHFIRE{22}: begin   //瘤堪贱
      if MagicManager.MagMakeFireCross(Self,
                          GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                          SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1),
                          GetPower(10) + (Word(GetRPow(m_WAbil.MC)) shr 1),
                          nTargetX,
                          nTargetY) > 0 then
        boTrain:=True;
    end;

    SKILL_FIREBOOM{23}: begin
      if MagicManager.MagBigExplosion(Self,
                         GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         g_Config.nFireBoomRage{1}) then
        boTrain:=True;
    end;

    SKILL_LIGHTFLOWER{24}: begin  //汾汲拳
      if MagicManager.MagElecBlizzard(Self, GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1)) then
        boTrain:=True;
    end;

    SKILL_SHOWHP{28}: begin     //沤扁颇楷
        if (TargeTBaseObject <> nil) and not TargeTBaseObject.m_boShowHP then begin
          if Random(6) <= (UserMagic.btLevel + 3) then begin
            TargeTBaseObject.m_dwShowHPTick:=GetTickCount();
            TargeTBaseObject.m_dwShowHPInterval:=GetPower13(GetRPow(m_WAbil.SC) * 2 + 30) * 1000;
            TargeTBaseObject.SendDelayMsg(TargeTBaseObject,RM_DOOPENHEALTH,0,0,0,0,'',1500);
            boTrain:=True;
          end;
        end;
      end;
    SKILL_BIGHEALLING{29}: begin   //措雀汗贱
        nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC) * 2,
                                    SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) * 3 + 1);
        if MagicManager.MagBigHealing(Self,nPower,nTargetX,nTargetY) then boTrain:=True;
      end;

    SKILL_SHIELD{31}: begin   //林贱狼阜
      if MagBubbleDefenceUp(UserMagic.btLevel,GetPower(GetRPow(m_WAbil.MC) + 30)) then
            boTrain:=True;
    end;


    SKILL_KILLUNDEAD{32}:begin
      if IsProperTarget (TargeTBaseObject) then begin
        if MagicManager.MagTurnUndead(Self,TargeTBaseObject,nTargetX,nTargetY,UserMagic.btLevel) then
          boTrain:=True;
      end;
    end;

    SKILL_SNOWWIND{33}: begin   //葫汲浅
      if MagicManager.MagBigExplosion(Self,
                         GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         g_Config.nSnowWindRange{1}) then
        boTrain:=True;
    end;

    SKILL_PURI{40}: begin  //沥拳贱
        if TargeTBaseObject = nil then begin
          TargeTBaseObject := m_Master;
        end;
        if MagicManager.MagMakeUnTreatment(Self, UserMagic, TargeTBaseObject) then
          boTrain := True;
      end;

    SKILL_VAMP{48}: begin //软趋贱
      if IsProperTarget (TargeTBaseObject) then begin
        if (Random(50) >= TargeTBaseObject.m_nAntiMagic) then begin
          nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1);
          VampPower := round(npower div 5);
          if VampPower < 0 then begin
            SysMsg('Attack Failed',c_Red,t_Hint);
            exit;
          end;
          SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',1000);
          if m_WAbil.HP + VampPower > m_WAbil.MaxHP then begin
            m_WAbil.HP := m_WAbil.MaxHP;
          end else
            m_WAbil.HP := m_WAbil.HP + VampPower;
          SendDelayRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,13,'0',1000);   //软趋 捞蒲飘
          RecalcAbilitys();
          SendMsg(Self,RM_ABILITY,0,0,0,0,'');
          boTrain:=True;
        end else TargeTBaseObject:=nil
      end else TargeTBaseObject:=nil;
    end;

    SKILL_FIRESHOWER{53}: begin //玫惑倡堪
      nPower := GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                             SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) div 2 + 5);

      if MagicManager.MagBigExplosion4(Self, UserMagic, nPower, nTargetX,nTargetY, 2) then begin
        if MagicManager.MagMeteor(Self, UserMagic, nPower,18,nTargetX,nTargetY) then begin
          boTrain:=True;
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,49,'0',2500);
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,40,'0',1500);
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,40,'0',2700);
        end;
      end;
    end;


    SKILL_MASSPOISON{55}: begin {PoisonCloud - Taoist}  //刀公
      if CheckAmulet2(Self,2,5,55,nAmuletIdx) then begin  //雀祸 刀啊风 犬牢
        StdItem:=UserEngine.GetStdItem(m_UseItems[nAmuletIdx].wIndex);
        if StdItem <> nil then begin
          UseAmulet(Self,2,5,nAmuletIdx);     //雀祸 刀啊风 犬牢
          case StdItem.Shape of
            7: begin
              if MagicManager.MagPoisonCloud(Self, UserMagic, GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),
                             SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) + 20),9,nTargetX,nTargetY) then begin
                boTrain:=True;
              end;

            end;
          end;
        end;
      end;
    end;

    SKILL_REDBANWOL{56}: begin    //老级
         n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
         if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
           m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,nTargetX,nTargetY);
           nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                                      SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1);
           if MagPassIlsum(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
             boTrain:=True;

             SendRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,NE_ILSUM,IntToStr(m_btDirection));
             m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,2,nTargetX,nTargetY);
             if MagicManager.MagChangePosition(Self, nTargetX, nTargetY) then  //老级
         end;
    end;

    SKILL_BODDYWIND{61}: begin    //眉脚浅
        nPower := UserMagic.btLevel;
        case UserMagic.btLevel of
         0 : nPower := 2;
         1 : nPower := 4;
         2 : nPower := 6;
         3 : nPower := 8;
        end;
        case UserMagic.btLevel of
         0 : n14 := 20;
         1 : n14 := 30;
         2 : n14 := 55;
         3 : n14 := 70;
        end;
       if AttSpeedUp(nPower, n14) then boTrain:=True;
      end;

    SKILL_CHUNSWORD{63}: begin //玫捞八
        if CheckWeapon(Self) then begin
          n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
          if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
            m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,2,nTargetX,nTargetY);
            nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                                      SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC)));
            if MagPassThroughMagic2(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
             boTrain:=True;
          end;
        end else begin
          Result:=FALSE;
        end;
      end;


    SKILL_PUNGSIN{69}: begin   //浅脚贱
        if m_wStatusTimeArr[STATE_WINDMOON] > 0 then begin  //浅脚贱 碍拳
          case UserMagic.btLevel of
            0 : nPower := 5;
            1 : nPower := 6;
            2 : nPower := 7;
            3 : nPower := 8;
          end;
        end else begin
          case UserMagic.btLevel of
            0 : nPower := 1;
            1 : nPower := 2;
            2 : nPower := 3;
            3 : nPower := 4;
          end;
        end;
        n14 := GetAttackPower(GetPower13(30) + LoWord(m_WAbil.DC) * 10 div 3,
             SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))div 4);

        if SpeedUp(nPower, n14) then boTrain:=True;
      end;
    SKILL_POISONBLADE{70}: begin     //竿刀八扁
        if CheckWeapon(Self) then begin
          if CheckAmulet(Self,1,5,nAmuletIdx) then begin     //雀祸 刀啊风 犬牢
            UseAmulet(Self,1,5,nAmuletIdx);
            n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
            if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
              m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,nTargetX,nTargetY);
              nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                                       SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1);
              if MagPassThroughMagic3(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
                boTrain:=True;
            end;
          end;
        end;
      end;
    SKILL_MOONBLADE{72}: begin
        if CheckWeapon(Self) then begin    //岿窍抄公
          if MagicManager.MagMoonBlade(Self,UserMagic.btLevel,UserMagic) then boTrain:=True;
        end else begin
          Result:=FALSE;
        end;
      end;

    SKILL_CATSWORD{80}: begin //功汲鄂
      if MagCanHitTarget (m_nCurrX, m_nCurrY, TargeTBaseObject) then begin
        if IsProperTarget (TargeTBaseObject) then begin
          if (TargeTBaseObject.m_nAntiMagic <= Random(50)) then begin

            nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC), SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1);
            SendDelayMsg (Self, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2, integer(TargeTBaseObject), '', 600);
                  // 惑怕捞惑...敌拳魄沥
            if {(TargeTBaseObject.m_Abil.Level < 100) and }
              (TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] = 0) and
              (TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] = 0) and
              (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin    // 100->50
              MoC := 1;
              Gap := TargeTBaseObject.m_Abil.Level - m_Abil.Level;
              if Gap > 10 then Gap := 10;
              if Gap <-10 then Gap :=-10;
              if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
              if Random(15) < (18 + (UserMagic.btLevel - Gap) div Moc) then begin
                Dur := (900 * UserMagic.btLevel + 3300) div 1000;
                if (MoC = 1) and (Random(1) = 0) then
                  TargeTBaseObject.MakePosion(POISON_STUN, Dur, 1)
                else if (MoC = 2) and (Random(1) = 0) then
                  TargeTBaseObject.MakePosion(POISON_STONE, Dur, 1)
              end;
            end;
            if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then boTrain := TRUE;
          end else
            TargeTBaseObject := nil;
        end else
          TargeTBaseObject := nil;
      end else
        TargeTBaseObject := nil;
    end;


    SKILL_OHAENG{83}: begin //澜剧坷青柳
        if CheckAmulet2(Self,5,5,55,nAmuletIdx) then begin  //何利 犬牢
          StdItem:=UserEngine.GetStdItem(m_UseItems[nAmuletIdx].wIndex);
          if StdItem <> nil then begin
            UseAmulet(Self,5,5,nAmuletIdx);     //何利 荤侩
            nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),
                                    SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) + 20);
            if MagicManager.MagOhaeng(Self, UserMagic, nPower, 20, nTargetX, nTargetY) then begin
              boTrain:=True;
            end;
          end;
        end;
      end;

    SKILL_STING{91}: begin //刀魔贱
      boSpellFail:=True;
      if CheckAmulet(Self,2,5,nAmuletIdx) then begin   //刀啊风 犬牢
        StdItem:=UserEngine.GetStdItem(m_UseItems[nAmuletIdx].wIndex);
        if StdItem <> nil then begin
          UseAmulet(Self,2,5,nAmuletIdx);
          case StdItem.Shape of
            7: begin
              if MagicManager.MagBigExplosion6(Self,
                    UserMagic,
                    GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1),
                    nTargetX,nTargetY,1,0) then
                    boTrain:=True;
            end;
            8: begin
              if MagicManager.MagBigExplosion6(Self,
                    UserMagic,
                    GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1),
                    nTargetX,nTargetY,1,1) then
                    boTrain:=True;
            end;
          end;
          boSpellFail:=False;
        end;
      end;
    end;

    SKILL_UPREDBANWOL{130}: begin    //付趋堡级
       n1C:=GetNextDirection(m_nCurrX,m_nCurrY,nTargetX,nTargetY);
       if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,n14,n18) then begin
         m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,1,nTargetX,nTargetY);
         nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                                      SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1);

         if MagMaPassIlSum(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
           boTrain:=True;
         SendRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,NE_MAILSUM,IntToStr(m_btDirection));
         m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,n1C,2,nTargetX,nTargetY);
         if MagicManager.MagMaChangePosition(Self, nTargetX, nTargetY, m_nCurrX, m_nCurrY) then  //付趋堡级
         SendDelayRefMsg(RM_10205, 0, nTargetX, nTargetY, NE_MAILSUM, IntToStr(directionDir(m_btDirection)), 600);   //付趋堡级 捞蒲飘
       end;
    end;

    SKILL_HWECHUN{132}: begin  //雀玫拜 - 康旷 傈荤
      nPower := GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
              SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC)) div 2 + 1);
      if MagicManager.MagBigHweChun(Self, UserMagic, nPower, m_nCurrX, m_nCurrY, 2) then begin
        boTrain := True;
        SendDelayRefMsg(RM_10205,0, m_nCurrX, m_nCurrY, NE_HWECHUN_2, '0', 200);
      end;
    end;

    SKILL_FIREDRAGON{133}: begin //拳锋柳浅
        nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1);
        if MagicManager.MagDragonPushArround(Self,nPower,UserMagic.btLevel) > 0 then begin
          boTrain:=True;
        end;
    end;

    SKILL_CHUNSANG{134}: begin //玫惑气堪
      nPower := GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                             SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) div 2 + 1);
      if MagicManager.MagBigExplosion4(Self, UserMagic, nPower, nTargetX,nTargetY, 2) then begin
        if MagicManager.MagMeteor(Self, UserMagic, nPower,18,nTargetX,nTargetY) then begin
          boTrain:=True;
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,49,'0',2500);
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,77,'0',1500);
          SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,77,'0',2700);
        end;
      end;
    end;

    SKILL_THUNDERDOWN{135}: begin   //倡玫汾
        if MagicManager.MagThenderDownExplosion(Self,
                         GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC))+ 1),
                         nTargetX, nTargetY, 2) then begin
          boTrain:=True;
        end;
    end;
    SKILL_DARKDRAGON{139}: begin //侩稼澜
        SendRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,NE_DRAGON_1,'0');
        nPower := GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                             SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC)) div 2 + 5);

        if MagicManager.MagDragon(Self, UserMagic, nPower, 35, m_nCurrX, m_nCurrY) then begin
          boTrain:=True;
        end;
    end;

    SKILL_SURA {140}: begin //荐扼玫戈柳
        if MagicManager.MagSuraField(Self,GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
           SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1)) then begin
          boTrain:=True;
        end;
     end;

    else begin

    end;
  end;
  if boSpellFail then
    Exit;
  if boSpellFire then begin
    SendRefMsg(RM_MAGICFIRE, 0,
      MakeWord(UserMagic.MagicInfo.btEffectType, UserMagic.MagicInfo.btEffect),
      MakeLong(nTargetX, nTargetY),
      Integer(TargeTBaseObject),
      '');
  end;
  if (UserMagic.btLevel < 3) and (boTrain) then begin
    if UserMagic.MagicInfo.TrainLevel[UserMagic.btLevel] <= m_Abil.Level then begin
      TrainSkill(UserMagic, Random(3) + 1);
      if not CheckMagicLevelup(UserMagic) then begin
        SendDelayMsg(Self, RM_MAGIC_LVEXP, 0, UserMagic.MagicInfo.wMagicId, UserMagic.btLevel, UserMagic.nTranPoint, '', 1000);
      end;
    end;
  end;
  Result := True;
end;




function THeroObject.StartAttack(wMagIdx: Word): Boolean;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::StartAttack name=%s MagIdx=%d';
begin
  Result := False;
  try
    m_dwTargetFocusTick := GetTickCount();
    case m_btJob of            //流诀函版
      0: begin
          Result := WarrorAttackTarget(wMagIdx);     //康旷傈荤  StartAttack
        end;
      1: begin
          Result := WizardAttackTarget(wMagIdx);      //康旷贱荤   StartAttack
        end;
      2: begin
          Result := TaoistAttackTarget(wMagIdx);     //康旷档荤    StartAttack
        end;
      3: begin
          Result := AssassinAttackTarget(wMagIdx);     //康旷磊按   StartAttack
        end;
    end;
  //  if Result then Inc(m_RunPos.nAttackCount);
  except
    MainOutMessage(Format(sExceptionMsg, [m_sCharName, wMagIdx]));
  end;
end;


function THeroObject.WarrorAttackTarget(wMagIdx: Word): Boolean; //康旷傈荤
var
  nSelectMagic, nError: Integer;
  UserMagic: pTUserMagic;
  dwDelayTime: LongWord;
  nDir: Byte;
  boAttack: Boolean;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::WarrorAttackTarget name=%s MagIdx=%d Error=%d';
begin
  Result := False;
  m_wHitMode := 1;
  nError:= 0;
  try
    nError:=1;
  if wMagIdx > 0 then begin
    nError := 2;
    UserMagic := FindMagic(wMagIdx);
    nError := 3;
    if UserMagic <> nil then begin
      case wMagIdx of
        7: m_wHitMode := 6; //抗档八过
        12: m_wHitMode := 4; //绢八贱
        25: m_wHitMode := 5; //馆岿八过
        26: m_wHitMode := 7; //堪拳搬
        38: m_wHitMode := 9; //街锋曼
        131: m_wHitMode := 29; //抄拳趋浅曼
        56, 130, 132: begin        //老级, 付趋堡级, 雀玫拜
          nError := 4;
          Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
          Exit;
        end;
      end;
    end;
  end;
  nError := 5;
  Result := WarrAttackTarget(wMagIdx, m_wHitMode);
  except
    MainOutMessage(Format(sExceptionMsg, [m_sCharName, wMagIdx, nError]));
  end;
end;

function THeroObject.WizardAttackTarget(wMagIdx: Word): Boolean; //康旷贱荤
var
  wHitMode: Word;
  nSelectMagic, nError: Integer;
  UserMagic: pTUserMagic;
  dwDelayTime: LongWord;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::WizardAttackTarget name=%s MagIdx=%d Error=%d';
begin
  Result := False;
  m_wHitMode := 1;
  nError := 0;
  try
    nError := 1;
  if wMagIdx > 0 then begin
    nError := 2;
    UserMagic := FindMagic(wMagIdx);
    if UserMagic <> nil then begin
      m_boIsUseMagic := False;
      nError := 3;
      Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
      Exit;
    end;
  end;
  nError := 4;
  Result := WarrAttackTarget(wMagIdx, m_wHitMode);
  except
    MainOutMessage(Format(sExceptionMsg, [m_sCharName, wMagIdx, nError]));
  end;
end;

function THeroObject.TaoistAttackTarget(wMagIdx: Word): Boolean; //康旷档荤   TaoistAttackTarget
var
  wHitMode: Word;
  nSelectMagic, nError: Integer;
  UserMagic: pTUserMagic;
  nIndex, nCount, nAmuletIdx: Integer;
  dwDelayTime: LongWord;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::TaoistAttackTarget name=%s MagIdx=%d Error=%d';
begin
  Result := False;
  m_wHitMode := 1;
  nError := 0;
  try
    nError := 1;
  if wMagIdx > 0 then begin
    nError := 2;
    UserMagic := FindMagic(wMagIdx);
    if UserMagic <> nil then begin
      case wMagIdx of
        6, 13 : begin
          nError := 3;
          Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
          Exit;
        end;
        else begin
          m_boIsUseMagic := False;
          nError := 4;
          Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
          Exit;
        end;
      end;
    end;
  end;
  nError := 5;
  Result := WarrAttackTarget(wMagIdx, m_wHitMode);
  except
    MainOutMessage(Format(sExceptionMsg, [m_sCharName, wMagIdx, nError]));
  end;
end;

function THeroObject.AssassinAttackTarget(wMagIdx: Word): Boolean; //康旷磊按
var
  nSelectMagic, nError: Integer;
  UserMagic: pTUserMagic;
  dwDelayTime: LongWord;
  nDir: Byte;
  boAttack: Boolean;
  StdItem: TItem;
resourcestring
  sExceptionMsg = '[Exception] THeroObject::AssassinAttackTarget name=%s MagIdx=%d Error=%d';
begin
  Result := False;
  nError := 0;
  try
    nError := 1;
  StdItem := UserEngine.GetStdItem(m_UseItems[U_WEAPON].wIndex);
  nError :=2;
  if StdItem.StdMode = 99 then begin
    if Random(3) = 0 then m_wHitMode := 0
    else m_wHitMode := 1;
  end else m_wHitMode := 1;

  nError := 3;
  if wMagIdx > 0 then begin
    nError := 4;
    UserMagic := FindMagic(wMagIdx);
    if UserMagic <> nil then begin
      case wMagIdx of
        60: begin
          nError := 5;
          if (GetSpellPoint(UserMagic) <= m_WAbil.MP) and (StdItem.StdMode = 99) then begin
            m_wHitMode := 15; //康旷浅八贱
          end;
        end;
        63, 72: begin //康旷 玫捞八 岿窍抄公
          if StdItem.StdMode = 99 then begin
            nError := 6;
            Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
            Exit;
          end;
        end;
        61, 69, 70, 80, 139, 140 : begin //功汲鄂
          nError := 7;
          Result := UseSpell(UserMagic, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, m_TargetCret, 0);
          Exit;
        end;
      end;
    end;
  end;
  nError := 8;
  Result := WarrAttackTarget(wMagIdx, m_wHitMode);
  except
    MainOutMessage(Format(sExceptionMsg, [m_sCharName, wMagIdx, nError]));
  end;
end;

function THeroObject.MagicAttackTarget(BaseObject: TBaseObject; tx, ty, wMagIdx: Word): Boolean;
var
  UserMagic: pTUserMagic;
  boIsWarrSkill: Boolean;
begin
  Result := False;
  if (GetTickCount - m_SkillUseTick[0] > (800 - m_nHitSpeed * g_Config.dwHeroItemAttackTime) ) then begin
    m_SkillUseTick[0] := GetTickCount;
    if wMagIdx > 0 then begin
      UserMagic := FindMagic(wMagIdx);
      if UserMagic <> nil then begin
        boIsWarrSkill := MagicManager.IsWarrSkill(UserMagic.wMagIdx);
        if (wMagIdx in [56, 72, 80, 130, 132]) then begin  //老级 岿窍抄公 付趋堡级 雀玫拜 功汲鄂
          if (GetTickCount - m_SkillUseTick[wMagIdx] > 2200 + UserMagic.MagicInfo.dwDelayTime) then begin
            Result := UseSpell(UserMagic, tx, ty, BaseObject, 1);
            if not boIsWarrSkill then begin
              m_SkillUseTick[wMagIdx] := GetTickCount;
              m_dwHitTick := GetTickCount();
            end;
          end;
        end else begin
          if (wMagIdx in [46, 53, 55, 83, 91, 134, 135, 139, 140]) then begin  //玫惑倡堪 刀公 玫惑气堪 倡玫汾 历林贱 刀魔贱 澜剧坷青柳
            if (GetTickCount - m_SkillUseTick[wMagIdx] > 5000 + UserMagic.MagicInfo.dwDelayTime) then begin
              Result := UseSpell(UserMagic, tx, ty, BaseObject, 1);
              if not boIsWarrSkill then begin
                m_SkillUseTick[wMagIdx] := GetTickCount;
                m_dwHitTick := GetTickCount();
              end;
            end;
          end else begin
            if (GetTickCount - m_SkillUseTick[wMagIdx] > 1000 + UserMagic.MagicInfo.dwDelayTime) then begin
              Result := UseSpell(UserMagic, tx, ty, BaseObject, 1);
              if not boIsWarrSkill then begin
                m_SkillUseTick[wMagIdx] := GetTickCount;
                m_dwHitTick := GetTickCount();
              end;
            end;
          end;
        end;
        Exit;
      end;
    end;
  end;
end;


procedure THeroObject.MakeSaveRcd(var HumanRcd: THumData);//004B3580
var
  I: Integer;
  HumItems:pTHumItems;
  BagItems:pTBagItems;
  HumMagic:pTHumMagic;
  AutoItems: pTAutoItems;
  UserMagic:pTUserMagic;
  StorageItems:pTStorageItems;         //芒绊
begin
  HumanRcd.boIsHero := True;
  HumanRcd.btStatus := m_btStatus;
  HumanRcd.nHeroGrade := m_nHeroGrade;
  HumanRcd.btHeroAutoDurg := m_btHeroAutoDurg;
  HumanRcd.btLimitLevel := m_btLimitLevel;

  HumanRcd.sChrName:=m_sCharName;
  HumanRcd.sCurMap:=m_sMapName;
  HumanRcd.wCurX:=m_nCurrX;
  HumanRcd.wCurY:=m_nCurrY;
  HumanRcd.btDir:=m_btDirection;
  HumanRcd.btHair:=m_btHair;
  HumanRcd.btSex:=m_btGender;
  HumanRcd.btJob:=m_btJob;
  HumanRcd.nGold:=m_nGold;

  HumanRcd.Abil.Level:=m_Abil.Level;

  HumanRcd.Abil.AC := m_WAbil.AC;
  HumanRcd.Abil.MAC := m_WAbil.MAC;
  HumanRcd.Abil.DC := m_WAbil.DC;
  HumanRcd.Abil.MC := m_WAbil.MC;
  HumanRcd.Abil.SC := m_WAbil.SC;

  HumanRcd.Abil.HP:=m_Abil.HP;
  HumanRcd.Abil.MP:=m_Abil.MP;
  HumanRcd.Abil.MaxHP:=m_Abil.MaxHP;
  HumanRcd.Abil.MaxMP:=m_Abil.MaxMP;
  HumanRcd.Abil.Exp:=m_Abil.Exp;
  HumanRcd.Abil.MaxExp:=m_Abil.MaxExp;
  HumanRcd.Abil.Weight:=m_Abil.Weight;
  HumanRcd.Abil.MaxWeight:=m_Abil.MaxWeight;
  HumanRcd.Abil.WearWeight:=m_Abil.WearWeight;
  HumanRcd.Abil.MaxWearWeight:=m_Abil.MaxWearWeight;
  HumanRcd.Abil.HandWeight:=m_Abil.HandWeight;
  HumanRcd.Abil.MaxHandWeight:=m_Abil.MaxHandWeight;

  HumanRcd.Abil.HP := m_WAbil.HP;
  HumanRcd.Abil.MP := m_WAbil.MP;

  HumanRcd.Abil.KillPointCurr:=m_Abil.KillPointCurr;
  HumanRcd.Abil.KillPoint:=m_Abil.KillPoint;
  HumanRcd.Abil.DeathPointCurr:=m_Abil.DeathPointCurr;
  HumanRcd.Abil.DeathPoint:=m_Abil.DeathPoint;


  HumanRcd.wStatusTimeArr:=m_wStatusTimeArr;
  HumanRcd.sHomeMap:=m_sHomeMap;
  HumanRcd.wHomeX:=m_nHomeX;
  HumanRcd.wHomeY:=m_nHomeY;
  HumanRcd.nPKPoint:=m_nPkPoint;    //乔纳捞
  HumanRcd.BonusAbil:=m_BonusAbil;// 08/09
  HumanRcd.nBonusPoint:=m_nBonusPoint;// 08/09

  HumanRcd.sMasterName := m_sMasterName;

  HumanRcd.btAiMode:=m_btAiMode;
  HumanRcd.btReLevel:=m_btReLevel;       //傈流

  HumanRcd.btAttatckMode:=m_btAttatckMode;
  HumanRcd.btIncHealth:=m_nIncHealth;
  HumanRcd.btIncSpell:=m_nIncSpell;
  HumanRcd.btIncHealing:=m_nIncHealing;
  HumanRcd.btFightZoneDieCount:=m_nFightZoneDieCount;
  HumanRcd.sAccount:=m_sUserID;

  HumanRcd.nMasterUpExp:=m_nMasterUpExp;
  HumanRcd.boAllowGuildReCall:=m_boAllowGuildReCall;
  HumanRcd.wGroupRcallTime:=m_wGroupRcallTime;
  HumanRcd.dBodyLuck:=m_dBodyLuck;
  HumanRcd.boAllowGroupReCall:=m_boAllowGroupReCall;
  HumanRcd.QuestUnitOpen:=m_QuestUnitOpen;
  HumanRcd.QuestUnit:=m_QuestUnit;
  HumanRcd.QuestFlag:=m_QuestFlag;

  HumItems:=@HumanRcd.HumItems;
  HumItems[U_DRESS]:=m_UseItems[U_DRESS];
  HumItems[U_WEAPON]:=m_UseItems[U_WEAPON];
  HumItems[U_RIGHTHAND]:=m_UseItems[U_RIGHTHAND];
  HumItems[U_HELMET]:=m_UseItems[U_NECKLACE];
  HumItems[U_NECKLACE]:=m_UseItems[U_HELMET];
  HumItems[U_ARMRINGL]:=m_UseItems[U_ARMRINGL];
  HumItems[U_ARMRINGR]:=m_UseItems[U_ARMRINGR];
  HumItems[U_RINGL]:=m_UseItems[U_RINGL];
  HumItems[U_RINGR]:=m_UseItems[U_RINGR];
  HumItems[U_BUJUK]:=m_UseItems[U_BUJUK];
  HumItems[U_BELT]:=m_UseItems[U_BELT];
  HumItems[U_BOOTS]:=m_UseItems[U_BOOTS];
  HumItems[U_CHARM]:=m_UseItems[U_CHARM];

  BagItems:=@HumanRcd.BagItems;
  for I := 0 to m_ItemList.Count - 1 do begin
    if I >= MAXBAGITEM then break;
    BagItems[I]:=pTUserItem(m_ItemList.Items[I])^;
  end;
  HumMagic:=@HumanRcd.Magic;
  for I := 0 to m_MagicList.Count - 1 do begin
    if I >= MAXMAGIC then break;
    UserMagic:=m_MagicList.Items[I];
    HumMagic[I].wMagIdx:=UserMagic.wMagIdx;
    HumMagic[I].btLevel:=UserMagic.btLevel;
    HumMagic[I].btKey:=UserMagic.btKey;
    HumMagic[I].nTranPoint:=UserMagic.nTranPoint;
  end;

  AutoItems := @HumanRcd.AutoItems;
  for I := 0 to m_AutoItem.Count - 1 do begin
    if I >= 2 then Break;
    AutoItems[I] := pTUserItem(m_AutoItem.Items[I])^;
  end;

  StorageItems:=@HumanRcd.StorageItems;        //芒绊
  for I := 0 to m_StorageItemList.Count -1 do begin
    if I >= STORAGELIMIT then break;
    StorageItems[I]:=pTUserItem(m_StorageItemList.Items[I])^;
  end;
end;

procedure THeroObject.MakeGhost;
var
  I: Integer;
begin
  for I := 0 to m_SlaveList.Count - 1 do begin
    TBaseObject(m_SlaveList.Items[I]).MakeGhost;
  end;
  m_SlaveList.Clear;

  if (m_Master <> nil) then begin
    TPlayObject(m_Master).m_MyHero := nil;
    TPlayObject(m_Master).m_dwRecallHeroTick := GetTickCount;
  end;
  m_Master := nil;
  inherited;
end;


procedure THeroObject.ClientaddBundleItems(mode,MaxAmount:integer;ItemIdx:String); //拱距2
var
 I,II,minc,dinc,inde,modeidx:Integer;
 MUItem,DUItem:PTUserItem;
 mItemIdx,dItemIdx:Integer;
 stre:string;
begin
  if ItemIdx = '' then Exit;
  minc := -1;
  dinc := -1;
  ItemIdx := GetValidStr3(ItemIdx, stre, ['/']);
  dItemIdx := strtoint(ItemIdx);
  mItemIdx := StrToInt(stre);
  if mode in [0,1,3,45,46] then modeidx := MaxAmount;       //拱距 俺荐 20俺
  for I := 0 to m_ItemList.Count - 1 do begin
    MUItem:=m_ItemList.Items[i];
    if (MUItem = nil) then Continue;
    if (MUItem <> nil) and (MUItem.MakeIndex = mItemIdx) and (minc < 0) then begin
     minc := I;
    end;
  end;
  for II := 0 to m_ItemList.Count - 1 do begin
    DUItem:=m_ItemList.Items[ii];
    if (DUItem = nil) then Continue;
    if (DUItem <> nil) and (DUItem.MakeIndex = DItemIdx)  and (dinc < 0) then begin
     dinc := II;
    end;
  end;
  if (minc >= 0) and (dinc >= 0) then begin
    if (PTUserItem(m_ItemList.Items[dinc]).Amount + PTUserItem(m_ItemList.Items[minc]).Amount <= modeidx) then begin
      Inc(PTUserItem(m_ItemList.Items[dinc]).Amount,PTUserItem(m_ItemList.Items[minc]).Amount);
      SendAddItemMode(m_ItemList.Items[dinc],0);
      m_ItemList.Delete(minc);
    end else begin
      inde := (PTUserItem(m_ItemList.Items[dinc]).Amount + PTUserItem(m_ItemList.Items[minc]).Amount) -modeidx;
      PTUserItem(m_ItemList.Items[dinc]).Amount := modeidx;
      PTUserItem(m_ItemList.Items[minc]).Amount := inde;
      SendAddItemMode(PTUserItem(m_ItemList.Items[dinc]),0);
      SendAddItemMode(PTUserItem(m_ItemList.Items[minc]),0);
    end;
  end;
end;

procedure THeroObject.ClientSeparateItems(bMakeIndex,namount:integer);   //拱距2
var
 I,inde:Integer;
 sUItem,UserItem:PTUserItem;
 StdItem: TItem;
begin
  if (bMakeIndex <= 0) or (namount < 1) then Exit;
    if not IsEnoughBag then begin
    SysMsg ('你的背包满了。', c_Red,t_Hint);
    Exit;
  end;
  inde := 0;
  for I := 0 to m_ItemList.Count - 1 do begin
    sUItem:=m_ItemList.Items[i];
    if (sUItem = nil) then Continue;
    if (sUItem.MakeIndex = bMakeIndex) and (sUItem.Amount > namount) then begin
      StdItem:=UserEngine.GetStdItem(sUItem.wIndex);
      if sUItem.Amount > StdItem.MaxAmount then begin     //拱距 滚弊 盒府
         Dispose(sUItem);
         m_ItemList.Delete (i);
         WeightChanged();
         exit;
      end else begin
         inde := sUItem.Amount - namount;
         sUItem.Amount := namount;
         SendAddItemMode(sUItem,1);    //拱距
         New(UserItem);
         if UserEngine.CopyToUserItemFromName(StdItem.Name, UserItem, inde) then begin
           m_ItemList.Add(UserItem);
           SendAddItem(UserItem);
           WeightChanged();
         end else begin
           Dispose(UserItem);
         end;
         exit;
      end;
    end;
  end;
end;

procedure THeroObject.ClientaddBundleStorageItems(mode,MaxAmount:integer;ItemIdx:String); //拱距2
var
 I,II,minc,dinc,inde,modeidx:Integer;
 MUItem,DUItem:PTUserItem;
 mItemIdx,dItemIdx:Integer;
 stre:string;
begin
  modeidx := -1;
  if ItemIdx = '' then Exit;
  minc := -1;
  dinc := -1;
  ItemIdx := GetValidStr3(ItemIdx, stre, ['/']);
  dItemIdx := strtoint(ItemIdx);
  mItemIdx := StrToInt(stre);
  if mode in [0,1,3,45,46,49] then modeidx := MaxAmount;       //拱距 俺荐 20俺
  for I := 0 to m_StorageItemList.Count - 1 do begin
    MUItem:=m_StorageItemList.Items[i];
    if (MUItem = nil) then Continue;
    if (MUItem <> nil) and (MUItem.MakeIndex = mItemIdx) and (minc < 0) then begin
     minc := I;
    end;
  end;
  for II := 0 to m_StorageItemList.Count - 1 do begin
    DUItem:=m_StorageItemList.Items[ii];
    if (DUItem = nil) then Continue;
    if (DUItem <> nil) and (DUItem.MakeIndex = DItemIdx)  and (dinc < 0) then begin
     dinc := II;
    end;
  end;
  if (minc >= 0) and (dinc >= 0) then begin
    if (PTUserItem(m_StorageItemList.Items[dinc]).Amount + PTUserItem(m_StorageItemList.Items[minc]).Amount <= modeidx) then begin
      Inc(PTUserItem(m_StorageItemList.Items[dinc]).Amount,PTUserItem(m_StorageItemList.Items[minc]).Amount);
      SendAddStorageMode(m_StorageItemList.Items[dinc],0);
      m_StorageItemList.Delete(minc);
    end else begin
      inde := (PTUserItem(m_StorageItemList.Items[dinc]).Amount + PTUserItem(m_StorageItemList.Items[minc]).Amount) -modeidx;
      PTUserItem(m_StorageItemList.Items[dinc]).Amount := modeidx;
      PTUserItem(m_StorageItemList.Items[minc]).Amount := inde;
      SendAddStorageMode(PTUserItem(m_StorageItemList.Items[dinc]),0);
      SendAddStorage(PTUserItem(m_StorageItemList.Items[minc]));
    end;
  end;
end;


procedure THeroObject.ClientTakeOnItems(btWhere: Byte; nItemIdx: Integer; sItemName: string);
var
  I, n14, n18: Integer;
  UserItem, TakeOffItem: pTUserItem;
  StdItem, StdItem20, StdItemOff: TItem;
  StdItem58: TStdItem;
  sUserItemName, stditemname: string;
  boot:Boolean;
  boFind: Boolean;
label FailExit;
begin
  StdItem := nil;
  UserItem := nil;
  boFind := False;
  n14 := -1;

  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem := m_ItemList.Items[I];
    if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      sUserItemName := '';
      sUserItemName := FilterStdShowName(StdItem,StdItem.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName = '' then
        sUserItemName := UserEngine.GetStdItemName(UserItem.wIndex);

      if not (StdItem.StdMode in [2,46]) then begin

        if (StdItem.Reserved and 16 <> 0) then begin
          stditemname:= FilterStdShowName(StdItem,StdItem.Name);
          if (self.m_btJob in [g_Bonze,g_BonzeUp]) then begin         //铰妨
            if self.m_WAbil.Level >= 80 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '60');
            end else if self.m_WAbil.Level >= 70 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '50');
            end else if self.m_WAbil.Level >= 60 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '40');
            end else if self.m_WAbil.Level >= 50 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '30');
            end else if self.m_WAbil.Level >= 40 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '20');
            end else if self.m_WAbil.Level >= 30 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '10');
            end else begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '00');
            end;
          end else begin
            if self.m_WAbil.Level >= 80 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '6');
            end else if self.m_WAbil.Level >= 70 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '5');
            end else if self.m_WAbil.Level >= 60 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '4');
            end else if self.m_WAbil.Level >= 50 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '3');
            end else if self.m_WAbil.Level >= 40 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '2');
            end else if self.m_WAbil.Level >= 30 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '1');
            end else begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName);
            end;
          end;
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        end;

        if (StdItem.Reserved and 32 <> 0) then begin
        stditemname:= FilterStdShowName(StdItem,StdItem.Name);
        if (self.m_btJob = Jwarr) or (self.m_btJob = JUpwarr) then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '1');
        if (self.m_btJob = Jwizard) or (self.m_btJob = JUpwiz) then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '2');
        if (self.m_btJob = Jtaos) or (self.m_btJob = JUptao) then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '3');
        if (self.m_btJob = JAssassin) or (self.m_btJob = jUpAssa) then                       //磊按
          UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '4');
        if (self.m_btJob = jBonze) or (self.m_btJob = jUpBoz) then                         //铰妨
          UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '5');
          StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
        end;
      end;

      if StdItem <> nil then begin
        if CompareText(sUserItemName, sItemName) = 0 then begin
          n14 := I;
          boFind := True;
          Break;
        end;
      end;
    end;
    StdItem := nil;
    UserItem := nil;
  end;

  n18 := 0;
  if (StdItem <> nil) and (UserItem <> nil) and boFind then begin
    if CheckUserItems(btWhere, StdItem) then begin
      StdItem.GetStandardItem(StdItem58);
      StdItem.GetItemAddValue(UserItem,StdItem58);
      if CheckTakeOnItems(btWhere, StdItem58) then begin
        TakeOffItem := nil;
        if btWhere in [0..MAXHEROUSEITEM] then begin

          if m_UseItems[btWhere].wIndex > 0 then begin
            StdItem20 := UserEngine.GetStdItem(m_UseItems[btWhere].wIndex);
            if (StdItem20 <> nil) and
              (StdItem20.StdMode in [15,22,23,24,26]) then begin
              if (not m_boUserUnLockDurg) and (m_UseItems[btWhere].btValue[7] <> 0) then begin
                SysMsg(g_sCanotTakeOffItem, c_Red, t_Hint);
                n18 := -4;
                goto FailExit;
              end;
            end;
            if not m_boUserUnLockDurg and ((StdItem20.Reserved and 2) <> 0)then begin
              SysMsg(g_sCanotTakeOffItem , c_Red, t_Hint);
              n18 := -4;
              goto FailExit;
            end; //004DAE78
            if (StdItem20.Reserved and 4) <> 0 then begin
              SysMsg(g_sCanotTakeOffItem , c_Red, t_Hint);
              n18 := -4;
              goto FailExit;
            end;
            if InDisableTakeOffList(m_UseItems[btWhere].wIndex) then begin
              SysMsg(g_sCanotTakeOffItem , c_Red, t_Hint);
              goto FailExit;
            end;
            New(TakeOffItem);
            TakeOffItem^ := m_UseItems[btWhere];
            StdItemOff := UserEngine.GetStdItem(m_UseItems[btWhere].wIndex);
          end; //004DAEC7 if m_UseItems[btWhere].wIndex > 0 then begin


          m_UseItems[btWhere] := UserItem^;
          DelBagItem(n14);
          if TakeOffItem <> nil then begin
            AddItemToBag(TakeOffItem, boot);
            if boot then
            SendAddItem(TakeOffItem);

            if (m_btJob in [3,8]) and (StdItemOff.StdMode = 99 ) and (m_MagicWindbladeSkill <> nil) and m_boUseWindblade then begin  //浅八贱
               WindbladeOnOff(FALSE);
             //  SendSocket(nil,'+UWB');
            end;
          end;
          RecalcAbilitys();
          SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
          SendMsg(Self, RM_SUBABILITY, 0, 0, 0, 0, '');
          SendDefMessage(SM_HEROTAKEON_OK, GetFeatureToLong, GetFeatureEx, 0, 0, '');
          FeatureChanged();

          n18 := 1;
        end;
      end else n18 := -1;
    end else n18 := -1;
  end;
  FailExit:
  if n18 <= 0 then
    SendDefMessage(SM_HEROTAKEON_FAIL, n18, 0, 0, 0, '');
end;


procedure THeroObject.ClientTakeOffItems(btWhere: Byte; nItemIdx: Integer; sItemName: string);
var
  n10: Integer;
  StdItem: TItem;
  UserItem: pTUserItem;
  sUserItemName: string;
  boot:Boolean;
label FailExit;
begin
  n10 := 0;
  if (btWhere < 13) then begin
    if m_UseItems[btWhere].wIndex > 0 then begin
      if m_UseItems[btWhere].MakeIndex = nItemIdx then begin
        StdItem := UserEngine.GetStdItem(m_UseItems[btWhere].wIndex);
        if (StdItem <> nil) and
          (StdItem.StdMode in [15,22,23,24,26]) then begin
          if (not m_boUserUnLockDurg) and (m_UseItems[btWhere].btValue[7] <> 0) then begin
            SysMsg(g_sCanotTakeOffItem, c_Red, t_Hint);
            n10 := -4;
            goto FailExit;
          end;
        end;
        if not m_boUserUnLockDurg and ((StdItem.Reserved and 2) <> 0)then begin
          SysMsg(g_sCanotTakeOffItem, c_Red, t_Hint);
          n10 := -4;
          goto FailExit;
        end;
        if (StdItem.Reserved and 4) <> 0 then begin
          SysMsg(g_sCanotTakeOffItem, c_Red, t_Hint);
          n10 := -4;
          goto FailExit;
        end;
        if InDisableTakeOffList(m_UseItems[btWhere].wIndex) then begin
          SysMsg(g_sCanotTakeOffItem, c_Red, t_Hint);
          goto FailExit;
        end;

        sUserItemName := '';
        if m_UseItems[btWhere].btValue[11] = 1 then
          sUserItemName := ItemUnit.GetCustomItemName(m_UseItems[btWhere].MakeIndex, m_UseItems[btWhere].wIndex);
        if sUserItemName = '' then
          sUserItemName := UserEngine.GetStdItemName(m_UseItems[btWhere].wIndex);


        if CompareText(sUserItemName, sItemName) = 0 then begin
          New(UserItem);
          UserItem^ := m_UseItems[btWhere];
          if AddItemToBag(UserItem, boot) then begin
            m_UseItems[btWhere].wIndex := 0;
            if boot then
            SendAddItem(UserItem);

            if (m_btJob in [3,8]) and (StdItem.StdMode = 99 ) and (m_MagicWindbladeSkill <> nil) and m_boUseWindblade then begin  //浅八贱
              WindbladeOnOff(FALSE);
             // SendSocket(nil,'+UWB');
            end;

            RecalcAbilitys();
            SendMsg(Self, RM_ABILITY, 0, 0, 0, 0, '');
            SendMsg(Self, RM_SUBABILITY, 0, 0, 0, 0, '');
            SendDefMessage(SM_HEROTAKEOFF_OK, GetFeatureToLong, GetFeatureEx, 0, 0, '');
            FeatureChanged();
          end else begin
            Dispose(UserItem);
            n10 := -3;
          end;
        end;
      end;
    end else n10 := -2;
  end else n10 := -1;
  FailExit:
  if n10 <= 0 then
    SendDefMessage(SM_HEROTAKEOFF_FAIL, n10, 0, 0, 0, '');
end;

function THeroObject.CheckTakeOnItems(nWhere: Integer;var StdItem: TStdItem): Boolean; //004C5084
  function GetUserItemWeitht(nWhere: Integer): Integer;
  var
    I: Integer;
    n14: Integer;
    StdItem: TItem;
  begin
    n14 := 0;
    for I := Low(THeroItems) to High(THeroItems) do begin
      if (nWhere = -1) or (not (I = nWhere) and not (I = 1) and not (I = 2)) then begin
        StdItem := UserEngine.GetStdItem(m_UseItems[I].wIndex);
        if StdItem <> nil then Inc(n14, StdItem.Weight);
      end;
    end;
    Result := n14;
  end;
var
  Castle:TUserCastle;
  strtemp: string;
begin
  Result:=False;
  if (StdItem.StdMode in [10,12]) and (m_btGender <> gMan) then begin    //巢磊渴
    SysMsg(sWearNotOfWoMan,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode = 11) and (m_btGender <> gWoMan) then begin   //咯磊渴
    SysMsg(sWearNotOfMan,c_Red,t_Hint);
    exit;
  end;

  if (StdItem.StdMode in [10,11,12]) and (StdItem.AniCount = 110) and m_PEnvir.Flag.boNOPENETRATE then begin
    SysMsg('你不能在这里使用。',c_Red,t_Hint);
    exit;
  end;

  if (StdItem.StdMode in [10,11,12]) and (StdItem.AniCount = 110) and (GetTickCount - m_PenetrateLastTick < 20 * 1000) then begin    //噶磊狼渴
    SysMsg(IntToStr( 20 - (GetTickCount - m_PenetrateLastTick) div 1000) + '秒以后可以使用。',c_Red,t_Hint);
    exit;
  end;

  //2005 哗哗肺 捞亥飘 (2005/11/8~11/21)
   if StdItem.StdMode = 30 then begin
      if StdItem.Shape = 3 then begin
         //荤尔狼哗哗肺绰 楷牢捞 绝栏搁 馒侩且 荐 绝促.
         if TPlayObject(self).fLover <> nil then begin
            strtemp := TPlayObject(self).fLover.GetLoverName;
            if strtemp = '' then begin
               SysMsg ('只有情侣才可以使用。',c_Red,t_Hint);
               exit;
            end;
         end;
      end else if StdItem.Shape = 4 then begin
         //龋冠赣府绰 楷牢捞 乐栏搁 馒侩且 荐 绝促.
         if TPlayObject(self).fLover <> nil then begin
            strtemp := TPlayObject(self).fLover.GetLoverName;
            if strtemp <> '' then begin
               SysMsg ('情侣不可以使用。',c_Red,t_Hint);
               exit;
            end;
         end;
      end;
   end;

  if (StdItem.CheckBonze) and not (m_btJob in [g_Bonze, g_BonzeUp]) then begin   //铰妨父馒侩
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [12, 90, 103]) and not (m_btJob in [g_Bonze, g_BonzeUp]) then begin //铰妨渴 公扁 鸥流诀 给 涝澜.  呕巴
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [10, 11, 12, 90, 5, 6, 7, 99]) then begin     //铰妨啊 馒侩啊瓷茄 酒捞袍
    if (m_btJob in [g_Bonze, g_BonzeUp]) and not ( (StdItem.StdMode in [12, 90]) or ((StdItem.StdMode = 10) and (StdItem.Shape in [1, 2, 12]))
      or ((StdItem.StdMode in [5,6]) and (StdItem.Shape in [19])) or ((StdItem.StdMode in [7]) and (StdItem.Shape in [47,48])) ) then begin
      SysMsg(sWearNotOfJob,c_Red,t_Hint);
      exit;
    end;
  end;


  if (StdItem.StdMode = 99) and not (m_btJob in [3,8]) then begin   //99公扁 磊按父馒侩       //流诀函版
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.HumUp = 1) and (m_btJob <> g_WarriorUp) then begin    //壬1 寒趋 傈荤父
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.HumUp = 2) and (m_btJob <> g_WizardUp) then begin    //壬2 全泅 贱荤父
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.HumUp = 3) and (m_btJob <> g_MonkUp)  then begin     //壬3 劳急 档荤父
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.HumUp = 4) and (m_btJob <> g_AssassinUp) then begin   //壬4 厚楷 磊按父
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;

  if (StdItem.StdMode in [5,6,7]) and not (StdItem.Shape in [19,34..36,37,39..48,55,56,57,73..77]) and (m_btJob = g_WarriorUp) then begin  //寒趋傈荤 馒侩 公扁
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [5,6,7]) and not (StdItem.Shape in [19,34..36,37,39..48,55,56,57,78..81]) and (m_btJob = g_WizardUp) then begin   //全泅贱荤 馒侩 公扁
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [5,6,7]) and not (StdItem.Shape in [19,34..36,37,39..48,55,56,57,82..85]) and (m_btJob = g_MonkUp) then begin     //劳急档荤 馒侩 公扁
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [5,6,7,99,90]) and not (StdItem.Shape in [19,34..36,37,39..48,55,56,57,86..89,96..98,100..102,104]) and (m_btJob = g_AssassinUp) then begin  //厚楷磊按 馒侩 公扁
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;

  if ((StdItem.StdMode = 10) or (StdItem.StdMode = 11)) and (StdItem.CheckNoAss) and (m_btJob = g_Assassin) then begin  //弊贰侨胶 渴
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if ((StdItem.StdMode = 10) or (StdItem.StdMode = 11)) and ((StdItem.shape >= 100) or (StdItem.CheckAss)){and (116 > StdItem.shape)} and (m_btJob <> g_Assassin) then begin //磊按渴 鸥流诀 给涝澜
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if ((StdItem.StdMode = 10) or (StdItem.StdMode = 11)) and (((StdItem.Shape > 2) and (StdItem.shape < 9)) or ((StdItem.Shape > 12) and (StdItem.shape < 19))) and (m_btJob = g_Assassin) then begin    //傈荤,贱荤,档荤 渴吝 磊按 馒侩 啊瓷
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if ((StdItem.StdMode = 10) or (StdItem.StdMode = 11)) and ((StdItem.Shape > 24) and (StdItem.shape < 28)) and (m_btJob = g_Assassin) then begin   //傈荤,贱荤,档荤 渴吝 磊按 馒侩 啊瓷
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if ((StdItem.StdMode = 10) or (StdItem.StdMode = 11)) and ((StdItem.Shape > 30) and (StdItem.shape < 34)) and (m_btJob = g_Assassin) then begin   //傈荤,贱荤,档荤 渴吝 磊按 馒侩 啊瓷
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [10,11,12]) and (StdItem.HumUp = 0) and not (StdItem.Shape in [0,9,10,11,30]) and not (m_btJob in [0..4]) then begin   //肉0 阑 流诀 0..3 捞 酒囱 某腐(殿急) 馒侩 且 版快         //流诀函版
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [101]) and not (m_btJob in [0..4]) then begin   //呕巴 殿急 酒囱奶         //流诀函版
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (StdItem.StdMode in [102]) and not (m_btJob in [5..9]) then begin   //呕巴 殿急 奶       //流诀函版
    SysMsg(sWearNotOfJob,c_Red,t_Hint);
    exit;
  end;
  if (nWhere = 1) or (nWhere = 2) then begin
    if StdItem.Weight > m_WAbil.MaxHandWeight then begin
      SysMsg(sHandWeightNot,c_Red,t_Hint);
      exit;
    end;
  end else begin
    if (StdItem.Weight + GetUserItemWeitht(nWhere)) > m_WAbil.MaxWearWeight then begin
      SysMsg(sWearWeightNot,c_Red,t_Hint);
      exit;
    end;
  end;
 // Castle:=g_CastleManager.IsCastleMember(Self);
  case StdItem.Need of    //
    0: begin        //鞘夸饭骇
      if m_Abil.Level >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg('英雄的 ' + g_sLevelNot,c_Red,t_Hint);
      end;
    end;
    1: begin        //鞘夸 颇鲍
      if HiWord(m_WAbil.DC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sDCNot,c_Red,t_Hint);
      end;
    end;
    2: begin     //鞘夸付过
      if HiWord(m_WAbil.MC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sMCNot,c_Red,t_Hint);
      end;
    end;
    3: begin      //鞘夸档仿
      if HiWord(m_WAbil.SC) >= StdItem.NeedLevel then begin
        Result:=True;
      end else begin
        SysMsg(g_sSCNot,c_Red,t_Hint);
      end;
    end;
    8: begin      //鞘夸 颇鲍 付过
      if (HiWord(m_WAbil.DC) >= StdItem.NeedLevel) and (HiWord(m_WAbil.SC) >= StdItem.NeedOption) then begin
        Result:=True;
      end else begin
        if (HiWord(m_WAbil.DC) < StdItem.NeedLevel) then
          SysMsg('攻击力不足。', c_Red, t_Hint);
        if (HiWord(m_WAbil.SC) < StdItem.NeedOption) then
          SysMsg('魔法力不足。', c_Red, t_Hint);
      end;
    end;
    10: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (m_Abil.Level >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrLevelNot,c_Red,t_Hint);
      end;
    end;
    11: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.DC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrDCNot,c_Red,t_Hint);
      end;
    end;
    12: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.MC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrMCNot,c_Red,t_Hint);
      end;
    end;
    13: begin
      if( m_btJob = LoWord(StdItem.NeedLevel)) and (HiWord(m_WAbil.SC) >= HiWord(StdItem.NeedLevel)) then begin
        Result:=True;
      end else begin
        SysMsg(g_sJobOrSCNot,c_Red,t_Hint);
      end;
    end;

    4: begin
      if m_btReLevel >= StdItem.NeedLevel then begin   //傈流
        Result:=True;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    40: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if m_Abil.Level >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg('英雄的 ' + g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    41: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.DC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sDCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    42: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.MC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sMCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;
    43: begin
      if m_btReLevel >= LoWord(StdItem.NeedLevel) then begin
        if HiWord(m_WAbil.SC) >= HiWord(StdItem.NeedLevel) then begin
          Result:=True;
        end else begin
          SysMsg(g_sSCNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sReNewLevelNot,c_Red,t_Hint);
      end;
    end;

    6: begin  //巩颇
      if (m_MyGuild <> nil)then begin
        Result:=True;
      end else begin
        SysMsg(g_sGuildNot,c_Red,t_Hint);
      end;
    end;
    60: begin   //巩颇 巩林
      if (m_MyGuild <> nil) and (m_nGuildRankNo = 1) then begin
        Result:=True;
      end else begin
        SysMsg(g_sGuildMasterNot,c_Red,t_Hint);
      end;
    end;
    7: begin
      Castle:=g_CastleManager.CastleMember(Self,'沙巴克');
      if (m_MyGuild <> nil) and (Castle <> nil) then begin  //荤合巩
        Result:=True;
      end else begin
        SysMsg(g_sSabukHumanNot,c_Red,t_Hint);
      end;
    end;
    70: begin              //荤合巩林
      Castle:=g_CastleManager.CastleMember(Self,'沙巴克');
      if (m_MyGuild <> nil) and (Castle <> nil) and (m_nGuildRankNo = 1) then begin
        if m_Abil.Level >= StdItem.NeedLevel then begin
          Result:=True;
        end else begin
          SysMsg('英雄的 ' + g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sSabukMasterManNot,c_Red,t_Hint);
      end;
    end;
    80: begin   //沥汗磊
      Castle:=g_CastleManager.IsMasterCastleMember(Self);
      if (m_MyGuild <> nil) and (Castle <> nil) then begin
        if m_Abil.Level >= StdItem.NeedLevel then begin
          Result:=True;
        end else begin
          SysMsg('英雄的 ' + g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sCastleKingMan,c_Red,t_Hint);
      end;
    end;
    9: begin           //巢父巩盔
      Castle:=g_CastleManager.CastleMember(Self,'南满');
      if (m_MyGuild <> nil) and (Castle <> nil) then begin
        Result:=True;
      end else begin
        SysMsg(g_sNammanHumanNot,c_Red,t_Hint);
      end;
    end;
    90: begin   //巢父己巩林
      Castle:=g_CastleManager.CastleMember(Self,'南满');
      if (m_MyGuild <> nil) and (Castle <> nil) and (m_nGuildRankNo = 1) then begin
        if m_Abil.Level >= StdItem.NeedLevel then begin
          Result:=True;
        end else begin
          SysMsg('英雄的 ' + g_sLevelNot,c_Red,t_Hint);
        end;
      end else begin
        SysMsg(g_sNammanMasterManNot,c_Red,t_Hint);
      end;
    end;


    20: begin
      if m_btColumn > 0 then begin
        Result:=True;
      end else begin
        SysMsg('只有专栏列表才可以使用。',c_Red,t_Hint);
      end;
    end;
    21: begin
      if m_btColumn = 1 then begin
        Result:=True;
      end else begin
        SysMsg('只有宣传团长才可以使用。',c_Red,t_Hint);
      end;
    end;
    22: begin
      if m_btColumn = 2 then begin
        Result:=True;
      end else begin
        SysMsg('只有宣传成员才可以使用。',c_Red,t_Hint);
      end;
    end;
    23: begin
      if m_btColumn = 3 then begin
        Result:=True;
      end else begin
        SysMsg('只有记者团长才可以使用。',c_Red,t_Hint);
      end;
    end;
    24: begin
      if m_btColumn = 4 then begin
        Result:=True;
      end else begin
        SysMsg('只有记者成员才可以使用。',c_Red,t_Hint);
      end;
    end;
    25: begin
      if m_btColumn = 5 then begin
        Result:=True;
      end else begin
        SysMsg('只有精英团长才可以使用。',c_Red,t_Hint);
      end;
    end;
    26: begin
      if m_btColumn = 6 then begin
        Result:=True;
      end else begin
        SysMsg('只有精英成员才可以使用。',c_Red,t_Hint);
      end;
    end;


  end;
end;

procedure THeroObject.ClientUseItems(nItemIdx: Integer; sItemName: string); //英雄吃药
  function GetUnbindItemName(nShape: Integer): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 0 to g_UnbindList.Count - 1 do begin
      if Integer(g_UnbindList.Objects[I]) = nShape then begin
        Result := g_UnbindList.Strings[I];
        Break;
      end;
    end;
  end;
  function GetUnBindItems(sItemName: string; nCount: Integer): Boolean;
  var
    I: Integer;
    UserItem: pTUserItem;
    boot:Boolean;
  begin
    Result := False;
    for I := 0 to nCount - 1 do begin
      New(UserItem);
      if UserEngine.CopyToUserItemFromName(sItemName, UserItem) then begin
        AddItemToBag(UserItem,boot);   //拱距
        if boot then
        SendAddItem(UserItem);
        Result := True;
      end else begin
        Dispose(UserItem);
        Break;
      end;
    end;
  end;
var
  I, Rand, Ani, Much, ItemCount: Integer;
  boEatOK: Boolean;
  boSendUpDate: Boolean;
  UserItem: pTUserItem;
  StdItem: TItem;
  UserItem34: TUserItem;
  sMapName: string;
  nCurrX, nCurrY: Integer;
begin
  boEatOK := False;
  boSendUpDate := False;
  StdItem := nil;
//  if ((GetTickCount - m_dwCanUseItemTick > g_Config.nUseItemSpeed) or (g_Config.nUseItemSpeed <= 0)) then begin //2008-05-16增加物品使用间隔
  if (not m_boStore) then begin   //俺牢惑痢
    for I := m_ItemList.Count - 1 downto 0 do begin
      if m_ItemList.Count <= 0 then Break;
      UserItem := m_ItemList.Items[I];
      if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
        UserItem34 := UserItem^;
        StdItem := UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem <> nil then begin
          if not m_PEnvir.AllowStdItems(UserItem.wIndex) then begin
            SysMsg(Format(g_sCanotMapUseItemMsg, [StdItem.Name]), c_Red, t_Hint);
            Break;
          end;
          case StdItem.StdMode of
            0,1,3: begin //拱距2
                if EatItems(StdItem,UserItem) then begin
                  if (UserItem.Amount > StdItem.MaxAmount) then begin  //拱距 滚弊
                    Dispose(UserItem);
                    m_ItemList.Delete(I);
                    boEatOK:=True;
                  end else begin
                    if (UserItem.Amount > 1) then begin
                      Dec(UserItem.Amount,1);
                      boSendUpDate := True;
                  //    SendAddItemMode(UserItem,3);  //拱距
                      boEatOK:=True;
                    end else begin
                      Dispose(UserItem);
                      m_ItemList.Delete(I);
                      boEatOK:=True;
                    end;
                  end;
                end;
                break;

              end;
            2: begin //券袍
                case StdItem.Shape of
                  12: begin
                      RepairAllItem();
                      m_ItemList.Delete(I);
                      DisPoseAndNil(UserItem);
                      boEatOK := True;
                  end;
                  else begin
                    if EatItems(StdItem, UserItem) then begin
                      m_ItemList.Delete(I);
                      DisPoseAndNil(UserItem);
                      boEatOK:=True;
                    end;
                    break;
                  end;
                end;
              end;
            4: begin //公傍氓
                if ReadBook(StdItem) then begin
                  m_ItemList.Delete(I);
                  DisPoseAndNil(UserItem);
                  boEatOK := True;
                end;
              end;
            16: begin  //磊悼拱距林巩辑
                if m_btHeroAutoDurg in [0,1] then begin
                  if m_btHeroAutoDurg < 2 then begin
                    Inc(m_btHeroAutoDurg);
                  end else
                   m_btHeroAutoDurg := 2;
                  SysMsg('英雄自动使用药品栏还有' + IntToStr(m_btHeroAutoDurg) + '。',c_Red,t_Hint);
                  m_ItemList.Delete(I);
                  Dispose(UserItem);
                  UserItem := nil;
                  boEatOK := True;
                end else begin
                  SysMsg('英雄自动使用药品栏已满。',c_Red,t_Hint);
                end;
              end;
            17: begin  //秦规辑
                if ((m_btLimitLevel * 10) = m_Abil.Level) and (StdItem.NeedLevel = m_Abil.Level) then begin
                  Rand := Random(StdItem.Shape);
                  Much := Random(StdItem.AC);
                  Ani := Random(StdItem.Source);
                  if Much = 0 then begin
                    if StdItem.AniCount = 0 then begin
                      TPlayObject(m_Master).SendMsg(Self, RM_MENU_OK, 0, Integer(Self), 0, 0,
                      '恭喜，英雄的等级限制已成功解锁。\现在你可以升级到 ' + IntToStr((m_btLimitLevel+1) * 10) +'级。');
                       m_btLimitLevel := 0;
                       HasLevelDown(m_Abil.Level);
                    end else begin
                      if (Ani = 0) and (StdItem.Source > 0) then begin
                        m_Abil.Level := m_Abil.Level + 1;
                        HasLevelUp(2);
                        TPlayObject(m_Master).SendMsg(Self, RM_MENU_OK, 0, Integer(Self), 0, 0,
                        '英雄的等级限制已经解锁。\你可以升级' + IntToStr((m_btLimitLevel+1) * 10) +'个等级。\祝贺你，你的英雄升级了。');
                         m_btLimitLevel := 0;
                      end else begin
                        TPlayObject(m_Master).SendMsg(Self, RM_MENU_OK, 0, Integer(Self), 0, 0,
                       '恭喜，英雄的等级限制已经解锁。\你可以升级' + IntToStr((m_btLimitLevel+1) * 10) +'个等级。');
                        m_btLimitLevel := 0;
                        HasLevelDown(m_Abil.Level);
                      end;
                    end;
                  end else begin
                    if (StdItem.AniCount = 0) and (Rand <> 0) then begin
                      m_Abil.Level := m_Abil.Level - Rand;
                      HasLevelDown(m_Abil.Level);
                      TPlayObject(m_Master).SendMsg(Self, RM_MENU_OK, 0, Integer(Self), 0, 0,
                       '很抱歉，英雄等级解锁失败。\等级限制下降了' + IntToStr(Rand) +'级。');
                       m_btLimitLevel := 0;
                    end else begin
                      TPlayObject(m_Master).SendMsg(Self, RM_MENU_OK, 0, Integer(Self), 0, 0, '很抱歉，英雄等级解锁失败。');
                    end;
                  end;
                  m_ItemList.Delete(I);
                  Dispose(UserItem);
                  UserItem := nil;
                  boEatOK := True;
                end else begin
                  SysMsg('没有足够的等级或能力等级。', c_Red, t_Hint);
                end;
              end;
            31: begin //解包物品
                if StdItem.AniCount = 0 then begin
                  if (m_ItemList.Count + 6 - 1) <= m_nItemBagCount then begin
                    m_ItemList.Delete(I);
                    DisPoseAndNil(UserItem);
                    GetUnBindItems(GetUnbindItemName(StdItem.Shape), 6);
                    boEatOK := True;
                  end;
                end;
              end;
          end;
          Break;
        end;
      end;
    end;
  end;

  if boEatOK then begin
    WeightChanged();
    SendDefMessage(SM_HEROEAT_OK, 0, m_btHeroAutoDurg, m_btLimitLevel, 0, '');
    if StdItem.NeedIdentify = 1 then
      AddGameDataLog('11' + #9 +
        m_sMapName + #9 +
        IntToStr(m_nCurrX) + #9 +
        IntToStr(m_nCurrY) + #9 +
        m_sCharName + #9 +
        StdItem.Name +'('+ IntToStr(UserItem34.Amount) +')' + #9 +
        IntToStr(UserItem34.MakeIndex) + #9 +
        '1' + #9 +
        '0' + #9 + '[召唤英雄]');
  end else begin
    SendDefMessage(SM_HEROEAT_FAIL, 0, 0, 0, 0, '');
  end;
  if (UserItem <> nil) and boSendUpDate then begin
    SendUpdateItem(UserItem);
  end;
end;


procedure THeroObject.ClientAutoUseItems(nItemIdx: Integer; sItemName: string);
var
  I: Integer;
  boEatOK: Boolean;
  UserItem: pTUserItem;
  StdItem: TItem;
  UserItem34: TUserItem;
  sMapName: string;
  nCurrX, nCurrY: Integer;
begin
  boEatOK := False;
  StdItem := nil;
  if (not m_boDeath) and (not m_boGhost) and (m_WAbil.HP > 0) then begin
    for I := 0 to m_AutoItem.Count - 1 do begin
      UserItem := m_AutoItem.Items[I];
      if (UserItem <> nil) and (UserItem.MakeIndex = nItemIdx) then begin
        UserItem34 := UserItem^;
        StdItem := UserEngine.GetStdItem(UserItem.wIndex);
        if StdItem <> nil then begin
          if not m_PEnvir.AllowStdItems(UserItem.wIndex) then begin
            SysMsg(Format(g_sCanotMapUseItemMsg, [StdItem.Name]), c_Red, t_Hint);
            Break;
          end;

          case StdItem.StdMode of
            0: begin //拱距2
              if EatItems(StdItem,UserItem) then begin
                if (UserItem.Amount > StdItem.MaxAmount) then begin  //拱距 滚弊
                  Dispose(UserItem);
                  m_AutoItem.Delete(I);
                  boEatOK:=True;
                  SendDelAutoItems(UserItem);
                end else begin
                  if (UserItem.Amount > 1) then begin
                    Dec(UserItem.Amount,1);
                    SendAddAutoItemMode(UserItem);  //拱距
                    boEatOK:=True;
                  end else begin
                    Dispose(UserItem);
                    m_AutoItem.Delete(I);
                    boEatOK:=True;
                    SendDelAutoItems(UserItem);
                  end;
                end;
              end;
              break;
            end;
          end;
        end;
        Break;
      end;
    end;
  end;

  if boEatOK then begin
    WeightChanged();
    SysMsg('英雄自动药水栏使用了物品 '+ StdItem.Name + '。', c_Red, t_Hint);
    if StdItem.NeedIdentify = 1 then
      AddGameDataLog('11' + #9 +
        m_sMapName + #9 +
        IntToStr(m_nCurrX) + #9 +
        IntToStr(m_nCurrY) + #9 +
        m_sCharName + #9 +
        StdItem.Name +'('+ IntToStr(UserItem34.Amount) +')' + #9 +
        IntToStr(UserItem34.MakeIndex) + #9 +
        '1' + #9 +
        '0' + #9 + '[召唤英雄]');
  end;

end;

procedure THeroObject.ClientChangeMagicKey(nSkillIdx: Integer; nKey: Integer);
var
  I: Integer;
  UserMagic: pTUserMagic;
begin
  for I := 0 to m_MagicList.Count - 1 do begin
    UserMagic := m_MagicList.Items[I];
    if UserMagic.MagicInfo.wMagicId = nSkillIdx then begin
      UserMagic.btKey := nKey;
      Break;
    end;
  end;
end;

function THeroObject.IsEnoughBag(): Boolean;
begin
  Result := False;
  if m_ItemList.Count < m_nItemBagCount then
    Result := True;
end;

function THeroObject.GetHeroObjectInfo(): string;
begin
  Result := m_sCharName + ' ' +
    '职业:' + IntToJob(m_btJob) + ' ' +
    '地图:' + m_sMapName + '(' + m_PEnvir.sMapDesc + ') ' +
    '坐标:' + IntToStr(m_nCurrX) + '/' + IntToStr(m_nCurrY) + ' ' +
    '等级:' + IntToStr(m_Abil.Level) + ' ' +
    '经验值:' + IntToStr(m_Abil.Exp) + ' ' +
    '资质: ' + IntToHeroGrade(m_nHeroGrade);
end;

function THeroObject.AddItemToBag(UserItem: pTUserItem; var boot:Boolean): Boolean;
begin
  Result:=False;
  if AddItemToBagCategories(UserItem,boot) then begin
    WeightChanged();
    Result:=True;
  end;
end;

function THeroObject.AddItemToBagCategories(UserItem: PTUserItem;var boot:Boolean): Boolean;     //拱距2
var
 I,nc,itemidx:Integer;
 Item,jItem: TItem;
 UItem:PTUserItem;
begin
  Result:=False;
  nc := 0;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
   if Item = nil then exit;
   if (Item.StdMode in [0,1,3,45,46]) and (UserItem.Amount = 1) then begin      //拱距
     if (Item.StdMode in [0,1,3,45,46]) then
     itemidx := Item.MaxAmount; //拱距 肮荐
     for I := 0 to m_ItemList.Count - 1 do begin
       UItem:= m_ItemList.Items[i];
       if UItem = nil then Continue;
       jItem:=UserEngine.GetStdItem(UItem.wIndex);
       if jItem <> nil then begin
         if (UserItem.wIndex=UItem.wIndex) and (Item.Name=jItem.Name) and (Item.StdMode=jItem.StdMode) and (Item.Shape=jItem.Shape) then begin
           if UItem.Amount < itemidx then begin
             Inc(UItem.Amount,UserItem.Amount);
             inc(nc);
             SendAddItemMode(UItem,1);    //拱距2
             Result:=True;
             boot := false;
             Exit;
           end;
         end;
       end;
     end;
     boot := True;
     if (nc = 0) then begin
       if m_ItemList.Count < m_nItemBagCount then begin
          m_ItemList.Add(UserItem);
          Result:=True;
          Exit;
       end;
     end;   
   end else begin
     boot := True;
     if m_ItemList.Count < m_nItemBagCount then begin
      m_ItemList.Add(UserItem);
      Result:=True;
      Exit;
     end;
   end;
end;



///////////////////////////////////////////////////////////////
//added by sonmg...
procedure THeroObject.CmdUpgradeItem (seedname, jewelryname: string; seedindex, jewelryindex, ExecCount : integer);     //胶媚
var
   iResult: integer;
   i, j, k, iVal: integer;
   puSeed, puJewelry: PTUserItem;
   psSeed, psJewelry: TItem;
   strResult, strEtc: string;
   iSumOfOption: integer;
   fProbability: Double;
   iBeforeValue, iAfterValue: integer;
   iShape: integer;
   dellist: TStringList;
begin
   puSeed := nil;
   puJewelry := nil;
   psSeed := nil;
   psJewelry := nil;
   iSumOfOption := 0;
   fProbability := 0;
   iBeforeValue := 0;
   iAfterValue := 0;

   try
      if seedname = '' then
         exit;
      if jewelryname = '' then
         exit;

      ///////////////////////////////////////////////////
      // 焊苛幅 八荤
         for i := 0 to m_ItemList.Count-1 do begin
            if jewelryindex = PTUserItem(m_ItemList[i]).MakeIndex then begin
               psJewelry := UserEngine.GetStdItem (PTUserItem(m_ItemList[i]).wIndex);
               puJewelry := PTUserItem(m_ItemList[i]);
               break;
            end;
         end;
         if i = m_ItemList.Count then exit;
      ///////////////////////////////////////////////////
         for i := 0 to m_ItemList.Count-1 do begin
            if seedindex = PTUserItem(m_ItemList[i]).MakeIndex then begin
               psSeed := UserEngine.GetStdItem (PTUserItem(m_ItemList[i]).wIndex);
               puSeed := PTUserItem(m_ItemList[i]);
               break;
            end;
         end;
         if i = m_ItemList.Count then exit;


      if puSeed.wIndex > 0 then begin
         if CheckJewelryItem(psJewelry.StdMode) then begin
            iVal := CheckSeedItem(puSeed, psSeed, psJewelry);

            if iVal = 2 then begin
               iResult := CalcUpgradeProbability(puSeed, puJewelry, psSeed, psJewelry, ExecCount, iSumOfOption, fProbability);

               // 诀弊饭捞靛 捞傈 蔼阑 掘绢柯促.
               iBeforeValue := GetTotalValueOfOption(puSeed, psSeed, psJewelry, strResult, strEtc);

               case iResult of
                  2: begin //己傍
                     // 酒捞袍 诀弊饭捞靛 角青.
                     if DoUpgradeItem (puSeed, psSeed, psJewelry) = 0 then begin
                        SysMsg('此属性无法升级。', c_Green,t_Hint);
                        exit;
                     end;

                     // 诀弊饭捞靛 捞饶 蔼阑 掘绢柯促.
                     iAfterValue := GetTotalValueOfOption(puSeed, psSeed, psJewelry, strResult, strEtc);

                     // Jewelry 酒捞袍 昏力.
                     QuestTakeCheckItem (puJewelry);

                     SysMsg (seedname + '发出一道璀璨的光芒，' + strResult + strEtc + '。', c_Blue,t_Hint);

                     AddGameDataLog('36' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     seedname + #9 +
                     IntToStr(seedindex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 成功]' +
                      UpgradeResultToStr(iSumOfOption, strResult, iBeforeValue, iAfterValue, fProbability, psJewelry.StdMode));


                     //努扼捞攫飘肺 搬苞 皋矫瘤 傈价.
                     SendDefMessage (SM_UPGRADEITEM_RESULT, seedindex, iResult, 0, 0, seedname);    //焊苛

                  end;
                  1: begin // 阂函
                     // 诀弊饭捞靛 捞饶 蔼阑 掘绢柯促.
                     iAfterValue := GetTotalValueOfOption(puSeed, psSeed, psJewelry, strResult, strEtc);

                     // Jewelry 酒捞袍 昏力.
                     QuestTakeCheckItem (puJewelry);

                     // 烙矫 犬牢 皋矫瘤.
                     SysMsg (seedname + '没有发生任何变化.', c_Green,t_Hint);

                      AddGameDataLog('37' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     seedname + #9 +
                     IntToStr(seedindex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 不变]' +
                      UpgradeResultToStr(iSumOfOption, strResult, iBeforeValue, iAfterValue, fProbability, psJewelry.StdMode));

                     //努扼捞攫飘肺 搬苞 皋矫瘤 傈价.
                     SendDefMessage (SM_UPGRADEITEM_RESULT, seedindex, iResult, 0, 0, seedname);    //焊苛

                  end;
                  0: begin // 角菩(颇鲍)
                     // 诀弊饭捞靛 捞饶 蔼阑 掘绢柯促.
                     iAfterValue := GetTotalValueOfOption(puSeed, psSeed, psJewelry, strResult, strEtc);

                     // Jewelry 酒捞袍 昏力.
                     QuestTakeCheckItem (puJewelry);
                     // Seed 酒捞袍 昏力.
                     QuestTakeCheckItem2 ( puSeed, Word(true) ); // 颇鲍 瓤苞甫 困茄 菩哦

                     SysMsg ('物品('+ seedname +')破碎了。', c_Red,t_Hint);

                      AddGameDataLog('38' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     seedname + #9 +
                     IntToStr(seedindex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 破碎]' +
                      UpgradeResultToStr(iSumOfOption, strResult, iBeforeValue, iAfterValue, fProbability, psJewelry.StdMode));

                     //努扼捞攫飘肺 搬苞 皋矫瘤 傈价.
                     SendDefMessage (SM_UPGRADEITEM_RESULT, seedindex, iResult, 0, 0, seedname);   //焊苛

                  end;
                  else begin
                     // 辑滚俊 皋矫瘤甫 巢辫.
                   //  MainOutMessage ('[UpgradeItem] ' + UserName + ' DoUpgradeItem狼 搬苞蔼 捞惑' );
                  end;
               end;  // end of case.
            end else if iVal = 1 then begin
               SysMsg('该物品不能升级此项属性。', c_Red,t_Hint)
            end else if iVal = 3 then begin
               SysMsg('特殊物品无法升级。', c_Red,t_Hint)
            end else if iVal = 4 then begin
               SysMsg('租赁的物品无法升级。', c_Red,t_Hint)
            end else if iVal = 5 then begin
               SysMsg('封印的物品不能升级。', c_Red,t_Hint)
            // 官蠢龙侩前, 焕噶摹.
            end else if iVal = 11 then begin
               if RepairItemNormaly( psSeed, puSeed ) then begin
                  // 荐府侩前 酒捞袍 昏力.
                  QuestTakeCheckItem (puJewelry);
                  SendDefMessage (SM_UPGRADEITEM_RESULT, seedindex, iResult, 0, 0, seedname);   //焊苛
               end;
            end else if iVal = 12 then begin
               if RepairItemSuper( psSeed, puSeed ) then begin
                  // 荐府侩前 酒捞袍 昏力.
                  QuestTakeCheckItem (puJewelry);
                  SendDefMessage (SM_UPGRADEITEM_RESULT, seedindex, iResult, 0, 0, seedname);   //焊苛
               end;
            end else if iVal = 10 then begin
               SysMsg('此物品无法修理。', c_Red,t_Hint)
            end else
               SysMsg (seedname + ' : 无法使用。', c_Red,t_Hint);
         end;
      end;

   except
      MainOutMessage ('[Exception] THeroObject.CmdUpgradeItem');
   end;
end;

// 焊苛幅 酒捞袍 眉农.
function THeroObject.CheckJewelryItem (iStdMode: integer) : Boolean;         //胶媚
begin
   // 焊苛,脚林,畴馋.
   if iStdMode in [59,60,61] then Result := TRUE
   else Result := FALSE;
end;


////////////////////////
// SEED 酒捞袍 眉农.
function THeroObject.CheckSeedItem (puSeed: PTUserItem ;psSeed, psJewelry: TItem) : Integer;            //胶媚
begin

   /////////////////////////////////////////////////////////////////////////////
   //官蠢龙侩前 肚绰 焕噶摹.
   if psJewelry.StdMode = 59 then begin
      if psJewelry.Shape = 20 then begin
         //渴, 捧备, 脚惯, 倾府鹅
         if psSeed.StdMode in [10,11,12,15,62,64] then Result := 11
         else Result := 10;
         exit;
      end else if psJewelry.Shape = 21 then begin
         //格吧捞, 馆瘤, 迫骂
         if psSeed.StdMode in [19,20,21,22,23,24,26] then Result := 11
         else Result := 10;
         exit;
      end else if psJewelry.Shape = 22 then begin
         //格吧捞, 馆瘤, 迫骂
         if psSeed.StdMode in [10,11,12,15,62,64] then Result := 12
         else Result := 10;
         exit;
      end else if psJewelry.Shape = 23 then begin
         //格吧捞, 馆瘤, 迫骂
         if psSeed.StdMode in [19,20,21,22,23,24,26] then Result := 12
         else Result := 10;
         exit;
      end;
   end;

   /////////////////////////////////////////////////////////////////////////////


   // 公扁,渴,捧备,格吧捞,馆瘤,迫骂, 脚惯,骇飘.
   if psSeed.StdMode in [5,6,90,99,12,10,11,15,19,20,21,22,23,24,26,62,64] then Result := 2
   else Result := 0;

   // 蜡聪农 酒捞袍 眉农
   if (psSeed.Unique) then begin
      Result := 3;
      exit;
   end;

   // 公扁,渴,捧备,格吧捞,馆瘤,迫骂, 脚惯,骇飘.
   if (puSeed.btValue[19] = 1) then begin     //措咯 焊苛 陛瘤
     Result := 4;
     exit;
   end;

   if (puSeed.btValue[19] > 2) then begin     //豪牢 焊苛 陛瘤
     Result := 5;
     exit;
   end;


   case psSeed.StdMode of
      5, 6, 99, 90: // 公扁         规绢 付亲 沥犬 刮酶 吝历亲 付历亲 救凳
         begin
            if (psJewelry.AC > 0) or (psJewelry.MAC > 0) or (psJewelry.Accurate > 0) or
               (psJewelry.Agility > 0) or (psJewelry.MagAvoid > 0) or
               (psJewelry.ToxAvoid > 0) then begin
                  Result := 1;
            end;
         end;
      10, 11, 12: // 渴          //颇鲍 付过 档仿 沥犬 傍加 吝刀 敌拳 救凳
         begin
            if (psJewelry.DC > 0) or (psJewelry.MC > 0) or (psJewelry.SC > 0) or
               (psJewelry.Accurate > 0) or (psJewelry.AtkSpd > 0) or
               (psJewelry.Slowdown > 0) or (psJewelry.Tox > 0) then begin
                  Result := 1;
            end;
         end;
      15: // 捧备      颇鲍 付过 档仿 刮酶 傍加 敌拳 吝刀 救凳
         begin
            if (psJewelry.DC > 0) or (psJewelry.MC > 0) or (psJewelry.SC > 0) or
               (psJewelry.Agility > 0) or (psJewelry.AtkSpd > 0) or
               (psJewelry.Slowdown > 0) or (psJewelry.Tox > 0) then begin
                  Result := 1;
            end;
         end;
      19,20,21: // 格吧捞         //规绢,付亲 刮酶 吝刀历亲 救凳
         begin
            if (psJewelry.AC > 0) or (psJewelry.MAC > 0) or (psJewelry.Agility > 0) or
               (psJewelry.ToxAvoid > 0) then begin
                  Result := 1;
            end;
         end;
      22,23: // 馆瘤      //沥犬 刮酶 吝刀历亲 付过历亲 救凳
         begin
            if (psJewelry.Accurate > 0) or (psJewelry.Agility > 0) or
               (psJewelry.MagAvoid > 0) or (psJewelry.ToxAvoid > 0) then begin
                  Result := 1;
            end;
         end;
      24,26: // 迫骂26       //傍加 付历亲 吝刀历亲 敌拳 吝刀 救凳
         begin
            if (psJewelry.AtkSpd > 0) or (psJewelry.MagAvoid > 0) or
               (psJewelry.Slowdown > 0) or (psJewelry.Tox > 0) or
               (psJewelry.ToxAvoid > 0) then begin
                  Result := 1;
            end;
         end;
      62: // 脚惯         颇鲍 付过 档仿 沥犬 傍加 吝历亲 敌拳 吝刀 吝历亲 救凳
         begin
            if (psJewelry.DC > 0) or (psJewelry.MC > 0) or (psJewelry.SC > 0) or
               (psJewelry.Accurate > 0) or (psJewelry.AtkSpd > 0) or (psJewelry.MagAvoid > 0) or
               (psJewelry.Slowdown > 0) or (psJewelry.Tox > 0) or
               (psJewelry.ToxAvoid > 0) then begin
                  Result := 1;
            end;
         end;
      64: // 骇飘        //颇鲍 档仿 付过 傍加 付过历亲 敌拳 吝刀 救凳
         begin
            if (psJewelry.DC > 0) or (psJewelry.MC > 0) or (psJewelry.SC > 0) or
               (psJewelry.AtkSpd > 0) or (psJewelry.MagAvoid > 0) or
               (psJewelry.Slowdown > 0) or (psJewelry.Tox > 0) then begin
                  Result := 1;
            end;
         end;
      else
         begin
            Result := 0;
         end;
   end;

end;


///////////////////////////////////
// 犬伏 拌魂 棺 搬苞 府畔 窃荐.
function THeroObject.CalcUpgradeProbability(puSeedItem, puJewelryItem: PTUserItem; psSeedItem, psJewelryItem: TItem; iExecCount: Integer; var iRetSum: integer; var fRetProb: Double) : integer;      //胶媚
var
   iSucceed, iFail: Integer;
   iSum, iRandom: Integer;
   UpProb: array [0..10] of TUpgradeProb;
   i, testSucceed, testNoChange, testFail: Integer;

   /////////////////////////////////////////////
   // 犬伏蔼 檬扁拳.(捞犯霸 秦档 登唱? sonmg)
   procedure InitProbability;
   var
      MFactor, DFactor: integer;
   begin
      MFactor := 4;  //焊苛狼 1.5硅肺 荐沥(烙矫), 盔贰蔼 4
      DFactor := 2;
      with UpProb[0] do begin
         iBase := 10000;
         iValue[0] := 5000;   //焊苛
         iValue[1] := 5000;   //焊苛
         iValue[2] := 5000;   //焊苛
         //烙矫 1.5硅肺 荐沥
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);   //脚林
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);   //脚林
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);   //脚林
      end;
      with UpProb[1] do begin
         iBase := 10000;
         iValue[0] := 4500;
         iValue[1] := 3000;
         iValue[2] := 4000;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[2] do begin
         iBase := 10000;
         iValue[0] := 4000;
         iValue[1] := 1000;
         iValue[2] := 3000;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[3] do begin
         iBase := 10000;
         iValue[0] := 3500;
         iValue[1] := 500;
         iValue[2] := 1000;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[4] do begin
         iBase := 10000;
         iValue[0] := 3000;
         iValue[1] := 100;
         iValue[2] := 500;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[5] do begin
         iBase := 10000;
         iValue[0] := 1500;
         iValue[1] := 25;
         iValue[2] := 100;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[6] do begin
         iBase := 10000;
         iValue[0] := 400;
         iValue[1] := 5;
         iValue[2] := 25;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[7] do begin
         iBase := 10000;
         iValue[0] := 100;
         iValue[1] := 5;
         iValue[2] := 5;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[8] do begin
         iBase := 10000;
         iValue[0] := 25;
         iValue[1] := 5;
         iValue[2] := 5;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[9] do begin
         iBase := 10000;
         iValue[0] := 5;
         iValue[1] := 5;
         iValue[2] := 5;
         iValue[3] := Integer(iValue[0] * MFactor div DFactor);
         iValue[4] := Integer(iValue[1] * MFactor div DFactor);
         iValue[5] := Integer(iValue[2] * MFactor div DFactor);
      end;
      with UpProb[10] do begin
         iBase := 10000;
         iValue[0] := 0;
         iValue[1] := 0;
         iValue[2] := 0;
         iValue[3] := 0;
         iValue[4] := 0;
         iValue[5] := 0;
      end;
   end;
begin
   Result := 2;
   // 可记钦 10 捞惑篮 公矫. 可记钦 0捞窍绰 0肺 父电促.
   iSum := _MIN( 10, _MAX(0, SumOfOptions(puSeedItem, psSeedItem)) );
   iRetSum := iSum;

   // 犬伏蔼 檬扁拳.
   InitProbability;

   testSucceed := 0;
   testNoChange := 0;
   testFail := 0;
   iSucceed := 0;
   iFail := 0;
   iRandom := 0;

   if iExecCount < 1 then iExecCount := 1;

   //犬伏 抛胶飘
   for i := 0 to iExecCount - 1 do begin

      iRandom := Random( UpProb[iSum].iBase );

      if psJewelryItem.StdMode = 60 then begin
         if psSeedItem.StdMode in [5,6,99,90] then begin //公扁
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[0] * ABS( (29 + m_nBodyLuckLevel + (LOBYTE(psSeedItem.AC) + puSeedItem.btValue[3] - LOBYTE(psSeedItem.MAC) - puSeedItem.btValue[4]) / 2 ) / 30 ) ) );
         end else if psSeedItem.StdMode in [10,11,12] then begin //渴
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[0] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else if psSeedItem.StdMode in [24,26,62] then begin  //迫骂,脚惯
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[1] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else if psSeedItem.StdMode = 19 then begin  //格吧捞19
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[2] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else begin //扁鸥
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[2] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end;

         // 傍加 犬伏 蝶肺 利侩.(sonmg 2003/12/22)
         if psJewelryItem.Shape = 7 then
         begin
            iSucceed := (iSucceed * 60) div 100;
         end;

         iFail := Round( (UpProb[iSum].iBase - iSucceed) {* 0.65}* 0.7 );  //烙矫 0.65肺 荐沥, 盔贰蔼 0.7

         if (iRandom >= 0) and (iRandom < iSucceed) then
            Result := 2    //己傍
         else if (iRandom >= iSucceed) and (iRandom < iSucceed + iFail) then
            Result := 1   //阂函
         else
            Result := 0;   //颇颊
      end else if psJewelryItem.StdMode = 61 then begin
         if psSeedItem.StdMode in [5,6,99,90] then begin //公扁
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[3] * ABS( (29 + m_nBodyLuckLevel + (LOBYTE(psSeedItem.AC) + puSeedItem.btValue[3] - LOBYTE(psSeedItem.MAC) - puSeedItem.btValue[4]) / 2 ) / 30 ) ) );
         end else if psSeedItem.StdMode in [10,11,12] then begin //渴
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[3] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else if psSeedItem.StdMode in [24,26,62] then begin  //迫骂,脚惯
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[4] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else if psSeedItem.StdMode = 19 then begin  //格吧捞19
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[5] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end else begin //扁鸥
            iSucceed := _MIN( UpProb[iSum].iBase, Round( UpProb[iSum].iValue[5] * ABS( (29 + m_nBodyLuckLevel) / 30 ) ) );
         end;

         // 傍加 犬伏 蝶肺 利侩.(sonmg 2003/12/22)
         if psJewelryItem.Shape = 7 then
         begin
            iSucceed := (iSucceed * 60) div 100;
         end;

         // 脚林 柄瘤瘤 臼澜.
//         iFail := Integer( Round( 0.7 * (UpProb[iSum].iBase - iSucceed) ) );

         if (iRandom >= 0) and (iRandom < iSucceed) then
            Result := 2    //己傍
         else
            Result := 1;   //阂函
      end;

      fRetProb := iSucceed / UpProb[iSum].iBase;

      if Result = 2 then Inc(testSucceed)
      else if Result = 1 then Inc(testNoChange)
      else if Result = 0 then Inc(testFail);

   end;
 {
   
   if psJewelryItem.StdMode = 60 then begin
      MainOutMessage( '[UpgradeItem:犬伏] ' + '=> '
         + '可记钦:' + IntToStr(iSum) + ', 己傍犬伏:' + IntToStr(iSucceed)
         + ', 阂函犬伏:' + IntToStr(iFail) + ', 颇颊犬伏:' + IntToStr(UpProb[iSum].iBase-iSucceed-iFail)
         + ', iRandom:' + IntToStr(iRandom)
         + ', Body青款:' + IntToStr(m_nBodyLuckLevel) + ', 公扁青款:' + IntToStr(LOBYTE(psSeedItem.AC) + puSeedItem.btValue[3])
         + ', 公扁阂款:' + IntToStr(LOBYTE(psSeedItem.MAC) + puSeedItem.btValue[4]) );
   end else if psJewelryItem.StdMode = 61 then begin
      MainOutMessage( '[UpgradeItem:犬伏] ' + '=> '
         + '可记钦:' + IntToStr(iSum) + ', 己傍犬伏:' + IntToStr(iSucceed)
         + ', 阂函犬伏:' + IntToStr(UpProb[iSum].iBase-iSucceed)
         + ', iRandom:' + IntToStr(iRandom)
         + ', Body青款:' + IntToStr(m_nBodyLuckLevel) + ', 公扁青款:' + IntToStr(LOBYTE(psSeedItem.AC) + puSeedItem.btValue[3])
         + ', 公扁阂款:' + IntToStr(LOBYTE(psSeedItem.MAC) + puSeedItem.btValue[4]) );
   end;
          }

end;


// 牢郸胶肺 扁夯蔼+诀弊饭捞靛等蔼阑 府畔窍绰 窃荐
function THeroObject.GetTotalValueOfOption( pu: PTUserItem; pstd, psJewelry: TItem; var strResult, strEtc: string ): integer;      //胶媚
var
   iBaseValue, iUpgradeValue: integer;
   iOptionIndex: integer;
begin
   Result := 0;
   iBaseValue := 0;
   iUpgradeValue := 0;
   iOptionIndex := 0;

   ////////////////////////////////////////////////
   // 诀弊饭捞靛 可记 犬牢
   // 搬苞 巩磊凯 府畔.
   // 诀弊饭捞靛 且 荐 乐绰 可记篮 茄锅俊 窍唱(盖 贸澜 唱坷绰 可记阑 急琶茄促.)
   if psJewelry.DC > 0 then begin
      iOptionIndex := 100;
      strResult := '攻击';
      strEtc := '增加 ' + IntToStr(psJewelry.DC);
   end else if psJewelry.MC > 0 then begin
      iOptionIndex := 101;
      strResult := '魔法';
      strEtc := '增加 ' + IntToStr(psJewelry.MC);
   end else if psJewelry.SC > 0 then begin
      iOptionIndex := 102;
      strResult := '道术';
      strEtc := '增加 ' + IntToStr(psJewelry.SC);
   end else if psJewelry.AC > 0 then begin
      iOptionIndex := 103;
      strResult := '防御';
      strEtc := '增加 ' + IntToStr(psJewelry.AC);
   end else if psJewelry.MAC > 0 then begin
      iOptionIndex := 104;
      strResult := '魔法防御';
      strEtc := '增加 ' + IntToStr(psJewelry.MAC);
   end else if psJewelry.DuraMax > 0 then begin
      iOptionIndex := 105;
      strResult := '持久';
      strEtc := '增加 ' + IntToStr( Round( psJewelry.DuraMax / 1000 ) );
   end else if psJewelry.Accurate > 0 then begin
      iOptionIndex := 106;
      strResult := '准确';
      strEtc := '增加 ' + IntToStr(psJewelry.Accurate);
   end else if psJewelry.Agility > 0 then begin
      iOptionIndex := 107;
      strResult := '敏捷';
      strEtc := '增加 ' + IntToStr(psJewelry.Agility);
   end else if psJewelry.AtkSpd > 0 then begin
      iOptionIndex := 108;
      strResult := '攻击速度';
      strEtc := '增加 ' + IntToStr(psJewelry.AtkSpd);
   end else if psJewelry.Slowdown > 0 then begin
      iOptionIndex := 109;
      strResult := '减速';
      strEtc := '增加 ' + IntToStr(psJewelry.Slowdown);
   end else if psJewelry.Tox > 0 then begin
      iOptionIndex := 110;
      strResult := '中毒';
      strEtc := '增加 ' + IntToStr(psJewelry.Tox);
   end else if psJewelry.MagAvoid > 0 then begin
      iOptionIndex := 111;
      strResult := '魔法躲避';
      strEtc := '增加 ' + IntToStr(psJewelry.MagAvoid);
   end else if psJewelry.ToxAvoid > 0 then begin
      iOptionIndex := 112;
      strResult := '毒物躲避';
      strEtc := '增加 ' + IntToStr(psJewelry.ToxAvoid);
   end;
   ////////////////////////////////////////////////

   // iIndex蔼狼 狼固
   // 100:颇鲍, 101:付过, 102:档仿, 103:规绢, 104:付亲, 105:郴备
   // 106:沥犬, 107:刮酶, 108:傍加, 109:敌拳, 110:吝刀, 111:付历亲, 112:吝历亲
   case pstd.StdMode of
      ///////////////////////////////////////////////////////
      5, 6, 99, 90:  // 公扁
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                     iBaseValue := HIBYTE(pstd.DC);
                     iUpgradeValue := pu.btValue[0];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               101://付过
                  begin
                     iBaseValue := HIBYTE(pstd.MC);
                     iUpgradeValue := pu.btValue[1];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               102://档仿
                  begin
                     iBaseValue := HIBYTE(pstd.SC);
                     iUpgradeValue := pu.btValue[2];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               103://规绢
                  begin
                  end;
               104://付亲
                  begin
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬                    //公扁 沥犬
                  begin
                     iBaseValue := pstd.Accurate;
                     iUpgradeValue := pu.btValue[5];          //公扁 沥犬
                     Result := iBaseValue + iUpgradeValue;
                  end;
               107://刮酶
                  begin
                  end;
               108://傍加
                  begin
                     iBaseValue := ItemUnit.RealAttackSpeed( pstd.AtkSpd );
                     iUpgradeValue := ItemUnit.RealAttackSpeed( pu.btValue[6] );   //公扁 傍加
                     Result := iBaseValue + iUpgradeValue;
                  end;
               109://敌拳
                  begin
                     iBaseValue := pstd.Slowdown;
                     iUpgradeValue := pu.btValue[8];   //公扁 敌拳
                     Result := iBaseValue + iUpgradeValue;
                  end;
               110://吝刀
                  begin
                     iBaseValue := pstd.Tox;
                     iUpgradeValue := pu.btValue[9];  //公扁 吝刀
                     Result := iBaseValue + iUpgradeValue;
                  end;
               111://付历亲
                  begin
                  end;
               112://吝历亲
                  begin
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      10, 11, 12 : // 渴,
         begin
            case iOptionIndex of
               100://颇鲍
                  begin

                  end;
               101://付过
                  begin

                  end;
               102://档仿
                  begin

                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                  end;
               107://刮酶
                  begin
                     iBaseValue := pstd.Agility;
                     iUpgradeValue := pu.btValue[6];        //渴 刮酶
                     Result := iBaseValue + iUpgradeValue;
                  end;
               108://傍加
                  begin
                  end;
               109://敌拳
                  begin
                  end;
               110://吝刀
                  begin
                  end;
               111://付历亲
                  begin
                     iBaseValue := pstd.MagAvoid;
                     iUpgradeValue := pu.btValue[8];           //渴 付过历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
               112://吝历亲
                  begin
                     iBaseValue := pstd.ToxAvoid;
                     iUpgradeValue := pu.btValue[7];             //渴 吝刀历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////

      15: // 捧备
         begin
            case iOptionIndex of
               100://颇鲍
                  begin

                  end;
               101://付过
                  begin

                  end;
               102://档仿
                  begin

                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];               //捧备 规绢
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];              //捧备 付规
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin // 捧备俊父 秦寸
                     iBaseValue := pstd.Accurate;
                     iUpgradeValue := pu.btValue[8];         //捧备 沥犬
                     Result := iBaseValue + iUpgradeValue;
                  end;
               107://刮酶
                  begin // 渴俊父 秦寸

                  end;
               108://傍加
                  begin
                  end;
               109://敌拳
                  begin
                  end;
               110://吝刀
                  begin
                  end;
               111://付历亲
                  begin
                     iBaseValue := pstd.MagAvoid;
                     iUpgradeValue := pu.btValue[10];             //捧备 付过历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
               112://吝历亲
                  begin
                     iBaseValue := pstd.ToxAvoid;
                     iUpgradeValue := pu.btValue[9];           //捧备 吝刀历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      19,20,21: // 格吧捞19             //格吧捞19
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                     iBaseValue := HIBYTE(pstd.DC);
                     iUpgradeValue := pu.btValue[0];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               101://付过
                  begin
                     iBaseValue := HIBYTE(pstd.MC);
                     iUpgradeValue := pu.btValue[1];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               102://档仿
                  begin
                     iBaseValue := HIBYTE(pstd.SC);
                     iUpgradeValue := pu.btValue[2];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               103://规绢
                  begin
                  end;
               104://付亲
                  begin
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                     iBaseValue := pstd.Accurate;
                     iUpgradeValue := pu.btValue[15];           //格吧捞 沥犬
                     Result := iBaseValue + iUpgradeValue;
                  end;
               107://刮酶
                  begin
                  end;
               108://傍加
                  begin
                     iBaseValue := pstd.AtkSpd;
                     iUpgradeValue := pu.btValue[17];           //格吧捞 傍加
                     Result := iBaseValue + iUpgradeValue;
                  end;
               109://敌拳
                  begin
                     iBaseValue := pstd.Slowdown;
                     iUpgradeValue := pu.btValue[14];            //格吧捞 敌拳
                     Result := iBaseValue + iUpgradeValue;
                  end;
               110://吝刀
                  begin
                     iBaseValue := pstd.Tox;
                     iUpgradeValue := pu.btValue[9];          //格吧捞 吝刀
                     Result := iBaseValue + iUpgradeValue;
                  end;
               111://付历亲
                  begin
                     iBaseValue := pstd.MagAvoid;
                     iUpgradeValue := pu.btValue[12];         //格吧捞 付历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
               112://吝历亲
                  begin
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      22,23: // 馆瘤  //馆瘤22    //馆瘤23
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                     iBaseValue := HIBYTE(pstd.DC);
                     iUpgradeValue := pu.btValue[0];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               101://付过
                  begin
                     iBaseValue := HIBYTE(pstd.MC);
                     iUpgradeValue := pu.btValue[1];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               102://档仿
                  begin
                     iBaseValue := HIBYTE(pstd.SC);
                     iUpgradeValue := pu.btValue[2];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                  end;
               107://刮酶
                  begin
                  end;
               108://傍加
                  begin
                     iBaseValue := pstd.AtkSpd;
                     iUpgradeValue := pu.btValue[16];               //馆瘤 傍加
                     Result := iBaseValue + iUpgradeValue;
                  end;
               109://敌拳
                  begin
                     iBaseValue := pstd.Slowdown;
                     iUpgradeValue := pu.btValue[14];              //馆瘤 敌拳
                     Result := iBaseValue + iUpgradeValue;
                  end;
               110://吝刀
                  begin
                     iBaseValue := pstd.Tox;
                     iUpgradeValue := pu.btValue[9];                //馆瘤 吝刀
                     Result := iBaseValue + iUpgradeValue;
                  end;
               111://付历亲
                  begin
                  end;
               112://吝历亲
                  begin
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      24,26: // 迫骂         //迫骂26
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                     iBaseValue := HIBYTE(pstd.DC);
                     iUpgradeValue := pu.btValue[0];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               101://付过
                  begin
                     iBaseValue := HIBYTE(pstd.MC);
                     iUpgradeValue := pu.btValue[1];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               102://档仿
                  begin
                     iBaseValue := HIBYTE(pstd.SC);
                     iUpgradeValue := pu.btValue[2];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                     iBaseValue := pstd.Accurate;
                     iUpgradeValue := pu.btValue[15];                 //迫骂 沥犬
                     Result := iBaseValue + iUpgradeValue;
                  end;
               107://刮酶
                  begin
                     iBaseValue := pstd.Agility;
                     iUpgradeValue := pu.btValue[16];                 //迫骂 刮酶
                     Result := iBaseValue + iUpgradeValue;
                  end;
               108://傍加
                  begin
                  end;
               109://敌拳
                  begin
                  end;
               110://吝刀
                  begin
                  end;
               111://付历亲
                  begin
                  end;
               112://吝历亲
                  begin
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      62: // 脚惯        //脚惯
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                  end;
               101://付过
                  begin
                  end;
               102://档仿
                  begin
                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                  end;
               107://刮酶
                  begin
                     iBaseValue := pstd.Agility;
                     iUpgradeValue := pu.btValue[16];                 //脚惯 刮酶
                     Result := iBaseValue + iUpgradeValue;
                  end;
               108://傍加
                  begin
                  end;
               109://敌拳
                  begin
                  end;
               110://吝刀
                  begin
                  end;
               111://付历亲
                  begin
                  end;
               112://吝历亲
                  begin
                  end;
            end;//case iOptionIndex of
         end;
      ///////////////////////////////////////////////////////
      64: // 骇飘
         begin
            case iOptionIndex of
               100://颇鲍
                  begin
                  end;
               101://付过
                  begin
                  end;
               102://档仿
                  begin
                  end;
               103://规绢
                  begin
                     iBaseValue := HIBYTE(pstd.AC);
                     iUpgradeValue := pu.btValue[3];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               104://付亲
                  begin
                     iBaseValue := HIBYTE(pstd.MAC);
                     iUpgradeValue := pu.btValue[4];
                     Result := iBaseValue + iUpgradeValue;
                  end;
               105://郴备
                  begin
                     iBaseValue := Round( pstd.DuraMax / 1000 );
                     iUpgradeValue := Round( pu.DuraMax / 1000 );
                     Result := iUpgradeValue;   // 郴备
                  end;
               106://沥犬
                  begin
                     iBaseValue := pstd.Accurate;
                     iUpgradeValue := pu.btValue[15];                        //骇飘 沥犬
                     Result := iBaseValue + iUpgradeValue;
                  end;
               107://刮酶
                  begin
                     iBaseValue := pstd.Agility;
                     iUpgradeValue := pu.btValue[16];                       //骇飘 刮酶
                     Result := iBaseValue + iUpgradeValue;
                  end;
               108://傍加
                  begin
                  end;
               109://敌拳
                  begin
                  end;
               110://吝刀
                  begin
                  end;
               111://付历亲
                  begin
                  end;
               112://吝历亲
                  begin
                     iBaseValue := pstd.ToxAvoid;
                     iUpgradeValue := pu.btValue[8];        //骇飘 吝历亲
                     Result := iBaseValue + iUpgradeValue;
                  end;
            end;//case iOptionIndex of
         end;
   end;

end;


// added by sonmg.
function THeroObject.DoUpgradeItem( puSeed: PTUserItem; psSeed, psJewelry: TItem ): integer;  //胶媚
begin
   Result := 1;

   // 诀弊饭捞靛 蔼 馆康.
   case psSeed.StdMode of
      5, 6, 99, 90: // 公扁
         begin
            puSeed.btValue[0] := puSeed.btValue[0] + psJewelry.DC;
            puSeed.btValue[1] := puSeed.btValue[1] + psJewelry.MC;
            puSeed.btValue[2] := puSeed.btValue[2] + psJewelry.SC;

            if psJewelry.AtkSpd > 0 then begin
               // 傍加 诀弊饭捞靛
               puSeed.btValue[6] := ItemUnit.UpgradeAttackSpeed( puSeed.btValue[6], psJewelry.AtkSpd );
               // 傍加 茄拌甫 逞阑 版快 茄拌蔼阑 措涝窃.
               puSeed.btValue[6] := _MIN(15 + 10, puSeed.btValue[6]);
            end;
            puSeed.btValue[8] := puSeed.btValue[8] + psJewelry.Slowdown;   //公扁 敌拳
            puSeed.btValue[9] := puSeed.btValue[9] + psJewelry.Tox;        //公扁 吝刀
         end;
      10, 11, 12: // 渴
         begin
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;
            puSeed.btValue[6] := puSeed.btValue[6] + psJewelry.Agility;
            puSeed.btValue[8] := puSeed.btValue[8] + psJewelry.MagAvoid;
            puSeed.btValue[7] := puSeed.btValue[7] + psJewelry.ToxAvoid;
         end;
      15: // 捧备
         begin
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;
            puSeed.btValue[8] := puSeed.btValue[8] + psJewelry.Accurate;     //捧备 沥犬
            puSeed.btValue[9] := puSeed.btValue[9] + psJewelry.ToxAvoid;     //捧备 吝刀历亲
            puSeed.btValue[10] := puSeed.btValue[10] + psJewelry.MagAvoid;   //捧备 付过历亲
         end;
      19,20,21: // 格吧捞19           //格吧捞19
         begin
            puSeed.btValue[0] := puSeed.btValue[0] + psJewelry.DC;
            puSeed.btValue[1] := puSeed.btValue[1] + psJewelry.MC;
            puSeed.btValue[2] := puSeed.btValue[2] + psJewelry.SC;

            // 沥犬
            puSeed.btValue[15] := puSeed.btValue[15] + psJewelry.Accurate;
            //付过历亲
            puSeed.btValue[12] := puSeed.btValue[12] + psJewelry.MagAvoid;

            if psJewelry.AtkSpd > 0 then begin
               puSeed.btValue[17] := puSeed.btValue[17] + psJewelry.AtkSpd;
               // 傍加 茄拌甫 逞阑 版快 茄拌蔼阑 措涝窃.
               puSeed.btValue[17] := _MIN(15, puSeed.btValue[17]);
            end;
            puSeed.btValue[14] := puSeed.btValue[14] + psJewelry.Slowdown;
            puSeed.btValue[9] := puSeed.btValue[9] + psJewelry.Tox;
         end;
      22,23: // 馆瘤    //馆瘤22     //馆瘤23
         begin
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;
            puSeed.btValue[0] := puSeed.btValue[0] + psJewelry.DC;
            puSeed.btValue[1] := puSeed.btValue[1] + psJewelry.MC;
            puSeed.btValue[2] := puSeed.btValue[2] + psJewelry.SC;
            if psJewelry.AtkSpd > 0 then begin
               puSeed.btValue[16] := puSeed.btValue[16] + psJewelry.AtkSpd;
               // 傍加 茄拌甫 逞阑 版快 茄拌蔼阑 措涝窃.
               puSeed.btValue[16] := _MIN(15, puSeed.btValue[16]);            //馆瘤 傍加
            end;
            puSeed.btValue[14] := puSeed.btValue[14] + psJewelry.Slowdown;    //馆瘤 敌拳
            puSeed.btValue[9] := puSeed.btValue[9] + psJewelry.Tox;          //馆瘤 吝刀
         end;
      24,26: // 迫骂26      //迫骂26
         begin
            puSeed.btValue[0] := puSeed.btValue[0] + psJewelry.DC;
            puSeed.btValue[1] := puSeed.btValue[1] + psJewelry.MC;
            puSeed.btValue[2] := puSeed.btValue[2] + psJewelry.SC;
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;
            // 沥犬
            puSeed.btValue[15] := puSeed.btValue[15] + psJewelry.Accurate;
            // 刮酶
            puSeed.btValue[16] := puSeed.btValue[16] + psJewelry.Agility;
         end;
      62: // 脚惯     //脚惯
         begin
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;

            // 刮酶
            puSeed.btValue[16] := puSeed.btValue[16] + psJewelry.Agility;
         end;
      64: // 骇飘
         begin
            puSeed.btValue[3] := puSeed.btValue[3] + psJewelry.AC;
            puSeed.btValue[4] := puSeed.btValue[4] + psJewelry.MAC;

            // 沥犬
            puSeed.btValue[15] := puSeed.btValue[15] + psJewelry.Accurate;
            // 刮酶
            puSeed.btValue[16] := puSeed.btValue[16] + psJewelry.Agility;

            puSeed.btValue[8] := puSeed.btValue[8] + psJewelry.ToxAvoid;   //骇飘 吝刀历亲
         end;
      else
         begin
            Result := 0;
            exit;
         end;
   end;

   // 弥措郴备仿 诀弊饭捞靛
   puSeed.DuraMax := _MIN(65000, puSeed.DuraMax + psJewelry.DuraMax);

   SendUpdateItem (puSeed);
   SendMsg (self, RM_ABILITY, 0, 0, 0, 0, '');
   SendMsg (self, RM_SUBABILITY, 0, 0, 0, 0, '');
end;


function THeroObject.QuestTakeCheckItem(CheckItem: pTUserItem):Boolean; //004C4F6C
var
  I: Integer;
  UserItem: pTUserItem;
begin
  Result:=False;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if UserItem = CheckItem then begin
      SendDelItems(UserItem);
      Dispose(UserItem);
      m_ItemList.Delete(I);
      Result:=True;
      break;
    end;
  end;
  for I := Low(m_UseItems) to High(m_UseItems) do begin
    if @m_UseItems[I] = CheckItem then begin
      SendDelItems(@m_UseItems[I]);
      m_UseItems[I].wIndex:=0;
      Result:=True;
      break;
    end;
  end;
end;

function THeroObject.QuestTakeCheckItem2(CheckItem: pTUserItem; wBreakdown: Word):Boolean; //004C4F6C
var
  I: Integer;
  UserItem: pTUserItem;
begin
  Result:=False;
  for I := 0 to m_ItemList.Count - 1 do begin
    UserItem:=m_ItemList.Items[I];
    if UserItem = CheckItem then begin
      SendDelItemWithFlag (UserItem, wBreakdown);
      Dispose(UserItem);
      m_ItemList.Delete(I);
      Result:=True;
      break;
    end;
  end;
  for I := Low(m_UseItems) to High(m_UseItems) do begin
    if @m_UseItems[I] = CheckItem then begin
      SendDelItemWithFlag (@m_UseItems[I], wBreakdown);
      m_UseItems[I].wIndex:=0;
      Result:=True;
      break;
    end;
  end;
end;


// 老馆 酒捞袍 荐府(2004/03/17).
function THeroObject.RepairItemNormaly( psSeed: TItem; puSeed: PTUserItem ): Boolean;
var
   repair: integer;
   hum: THeroObject;
begin
   Result := FALSE;

   if psSeed <> nil then begin
      if not (psSeed.boCanRepair) or (puSeed.btValue[19] = 1) then begin
         SysMsg ('此装备无法修理。', c_Red,t_Hint);
         Result := FALSE;
         exit;
      end;

      repair := _MIN(5000, _MAX(0, puSeed.DuraMax - puSeed.Dura));   //DURAMAX荐沥
      if repair > 0 then begin
         puSeed.DuraMax := _MAX(0, puSeed.DuraMax - (repair div 30));   //DURAMAX荐沥
         puSeed.Dura := _MIN(puSeed.Dura + repair, puSeed.DuraMax);
         if m_btRaceServer = RC_HEROOBJECT then begin
            hum := THeroObject(self);
            hum.SendUpdateItem (puSeed);
         end;
         SysMsg ('''' + psSeed.Name + '''' + ' 修理完毕。', c_Green,t_Hint);
         Result := TRUE;
      end else begin
         SysMsg ('此装备不需要修理。', c_Red,t_Hint);
      end;
   end;
end;

function THeroObject.RepairItemSuper( psSeed: TItem; puSeed: PTUserItem ): Boolean;
var
   repair: integer;
   hum: THeroObject;
begin
   Result := FALSE;

   if psSeed <> nil then begin
      if not (psSeed.boCanRepair) then begin
         SysMsg ('此装备无法修理。', c_Red,t_Hint);
         Result := FALSE;
         exit;
      end;

      repair := _MIN(65000, _MAX(0, puSeed.DuraMax - puSeed.Dura));   //DURAMAX荐沥
      if repair > 0 then begin
         puSeed.Dura := _MIN(puSeed.Dura + repair, puSeed.DuraMax);
         if m_btRaceServer = RC_HEROOBJECT then begin
            hum := THeroObject(self);
            hum.SendUpdateItem (puSeed);
         end;
         SysMsg ('''' + psSeed.Name + '''' + ' 修理完毕。', c_Green,t_Hint);
         Result := TRUE;
      end else begin
         SysMsg ('此装备不需要修理。', c_Red,t_Hint);
      end;
   end;
end;


/////////////////////////
// 扁粮 加己蔼狼 钦.
function THeroObject.SumOfOptions(puSeedItem: PTUserItem; psSeedItem: TItem) : integer;            //胶媚
begin
   Result := 0;
   case psSeedItem.StdMode of
      5, 6, 99, 90:  // 公扁           颇鲍 付过 档仿 傍加 吝刀 敌拳  (沥犬 档 器窃)
         begin
            Result := puSeedItem.btValue[0] + puSeedItem.btValue[1] + puSeedItem.btValue[2]
                      + puSeedItem.btValue[5] + puSeedItem.btValue[9] + puSeedItem.btValue[8];
            // 傍加 钦魂(公扁).
            Result := Result + _MAX( 0, ItemUnit.RealAttackSpeed( puSeedItem.btValue[6] ) );
         end;
      10, 11, 12: // 渴     规绢 付亲 吝刀历亲 付过历亲 刮酶
         begin
            Result := puSeedItem.btValue[3] + puSeedItem.btValue[4]
                     + puSeedItem.btValue[6] + puSeedItem.btValue[7] + puSeedItem.btValue[8];       //渴 刮酶
         end;
      15:  //捧备
         begin
            Result := puSeedItem.btValue[3] + puSeedItem.btValue[4]
                     + puSeedItem.btValue[8] + puSeedItem.btValue[9] + puSeedItem.btValue[10];      //捧备 沥犬
         end;

      19,20,21: // 格吧捞19     //格吧捞19
         begin
            Result := puSeedItem.btValue[0] + puSeedItem.btValue[1]
                     + puSeedItem.btValue[2] + puSeedItem.btValue[9]
                     + puSeedItem.btValue[12] + puSeedItem.btValue[14] + puSeedItem.btValue[15];
            // 傍加 钦魂.
            if puSeedItem.btValue[17] > 0 then
               Result := Result + puSeedItem.btValue[17];
         end;
      22,23: // 馆瘤     //馆瘤22  //馆瘤23
         begin
            Result := puSeedItem.btValue[0] + puSeedItem.btValue[1] + puSeedItem.btValue[2]
                     + puSeedItem.btValue[3] + puSeedItem.btValue[4]
                     + puSeedItem.btValue[9] + puSeedItem.btValue[14];
            // 傍加 钦魂.
            if puSeedItem.btValue[16] > 0 then
               Result := Result + puSeedItem.btValue[16];
         end;
      24,26: // 迫骂        //迫骂26
         begin
            Result := puSeedItem.btValue[0] + puSeedItem.btValue[1] + puSeedItem.btValue[2]
                     + puSeedItem.btValue[3] + puSeedItem.btValue[4]
                     + puSeedItem.btValue[15] + puSeedItem.btValue[16];
         end;
      62: // 脚惯        //脚惯
         begin
            Result := puSeedItem.btValue[3] + puSeedItem.btValue[4] + puSeedItem.btValue[16];
         end;
      64: // 骇飘
         begin
            Result := puSeedItem.btValue[3] + puSeedItem.btValue[4] + puSeedItem.btValue[15]
                     + puSeedItem.btValue[16] + puSeedItem.btValue[8];          //骇飘 吝历亲
         end;
   end;

   // 郴备仿 钦魂.   //窜拌啊 1000 -> 2000 栏肺 刘啊 2003-11-7 PDS
   Result := Result + _MAX( 0, Round( (puSeedItem.DuraMax - psSeedItem.DuraMax) / 2000 ) );
end;

// 酒捞袍 诀弊饭捞靛 颇鲍 瓤苞甫 困茄 DelItem窃荐
procedure THeroObject.SendDelItemWithFlag (UserItem: pTUserItem; wBreakdown: Word);       //胶媚
var
  StdItem:TItem;
  ClientItem:TClientItem;
  opt: integer;
  sUserItemName: string;
begin
  StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
  if StdItem <> nil then begin
    StdItem.GetStandardItem(ClientItem.S);
    opt := StdItem.GetItemAddValue(UserItem,ClientItem.S);
    sUserItemName := '';
    sUserItemName := FilterStdShowName(StdItem,StdItem.Name);
    if UserItem.btValue[11] = 1 then
      sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
    if sUserItemName <> '' then
      ClientItem.s.Name := FilterStdShowName(StdItem,sUserItemName);

    ClientItem.MakeIndex:=UserItem.MakeIndex;
    ClientItem.Dura:=UserItem.Dura;
    ClientItem.DuraMax:=UserItem.DuraMax;
    ClientItem.Amount:=UserItem.Amount;
    ClientItem.UpgradeOpt := opt;
    m_DefMsg:=MakeDefaultMsg(SM_DELHEROITEM,Integer(Self),0,wBreakdown,1);
    SendSocket(@m_DefMsg,EncodeBuffer(@ClientItem,SizeOf(TClientItem)));
  end;
end;


function THeroObject.GemItem(Gem:Integer;Itemidx:integer):integer;       //焊苛(备 矫胶袍)
var
  UserItem,GemUserItem:pTUserItem; //the 'real item stats'
  Uitem, GItem: TItem; //the db item stats
  i: integer;
  StatType: byte;
  SuccesRate: integer;
  BreakItem: boolean;
  Succes: boolean;
  intact:boolean;
  ItmeNames: string;
  DuraAdd: Integer;
begin
  Result:=1;
  ItmeNames := '';
  if (Gem = Itemidx) or (Gem = 0) or (Itemidx = 0) then begin
    SendMsg(Self,RM_MENU_OK,0,Integer(self),0,0,'不能强化所选的物品。');
    exit; //cant be that the gem is also the item we using so :p
  end;

{find out what item we geming and what gem we using}
  for I := 0 to m_ItemList.Count - 1 do begin
    if pTUserItem(m_ItemList[i]).MakeIndex = Gem then //gem we using
      GemUserItem:= m_ItemList[i];
    if pTUserItem(m_ItemList[i]).MakeIndex = Itemidx then           // item we geming
      UserItem:= m_ItemList[i];
  end;
  GItem:=UserEngine.GetStdItem(GemUserItem.wIndex);
  UItem:=UserEngine.GetStdItem(UserItem.wIndex);
{check if all the items truly exist}
  if (GItem = nil) or (GemUserItem = nil) then begin
    SendMsg(Self,RM_MENU_OK,0,Integer(self),0,0,'This Gem/Orb is missing.');
    exit;
  end;
  if (Uitem = nil) or  (UserITem = nil) then begin
    GemItemFail(GemUserItem,'This item is missing.');
    exit;
  end;
{check if the gem used is allowed on the item we using it on}
  if (UItem.Unique) or (UserItem.btValue[19] = 1) or (UserItem.btValue[19] > 2) then begin      //措咯袍 豪牢 焊苛 x
    if (UItem.Unique) then
      SysMsg('特殊物品无法升级。', c_Red,t_Hint);
    if (UserItem.btValue[19] = 1) then
      SysMsg('租赁的物品无法升级。', c_Red,t_Hint);
    if (UserItem.btValue[19] > 2) then
      SysMsg('封印的单品不能升级。', c_Red,t_Hint);
    exit; //cant be that the gem is also the item we using so :p
  end;
  stattype:= GItem.AC;
  case GItem.AC of
    0,1,2: begin // dc,mc,sc
      if not (UItem.StdMode in [5,6,90,19,20,21,22,23,24,26,99]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    3,4: begin  //ac, amc
      if not (UItem.StdMode in [10,11,12,15,22,23,24,26,62,64]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    5: begin  //aspeed
      if not (UItem.StdMode in [5,6,90,19,20,21,22,23,99]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    6: begin //agil
      if not (UItem.StdMode in [10,11,12,24,26,62,64]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    7: begin  //dura
      if not (UItem.StdMode in [5,6,10,11,12,15,19,20,21,22,23,24,26,62,64,90,99]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    8: begin //吝刀历亲
      if not (UItem.StdMode in [10,11,12,15,64]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    9,14: begin //poison,freezing
      if not (UItem.StdMode in [5,6,19,20,21,22,23,90,99]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
    15: begin //acc
      if not (UItem.StdMode in [15,19,20,21,24,26,64]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;

    12: begin //antimagic
      if not (UItem.StdMode in [10,11,12,15,19,20,21]) then begin
        SysMsg('此物品不能升级该项属性。', c_Red,t_Hint);
        exit; //cant be that the gem is also the item we using so :p
      end;
    end;
  end;
{get succes rate and stuff}
  SuccesRate:= GItem.AC2;
  BreakItem:=FALSE;
  intact:=FALSE;
  if GItem.MAC = 0 then
   BreakItem:=TRUE;
   Succes:=TRUE;

{now add the stat to the item}
  if Succes then begin //if the gem worked
    case stattype of
      0,1,2,3,4,9: begin //颇鲍 付过 档仿 规绢 付过规绢 吝刀
        if Random(40) <= SuccesRate - UserItem.btValue[StatType] then begin
          Succes:=FALSE;
          BreakItem:=False;
        end else
        if Random(10) <= SuccesRate - UserItem.btValue[StatType] then begin
          inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
        end else
          Succes:=FALSE;
      end;

      5: begin //傍加
        if UItem.StdMode in [5,6,99,90] then begin//公扁 btvalue 6 荤侩 弊府绊  傍加 +/- 矫胶袍 (蔼 10 > +, 蔼 10 > -)
          if UserItem.btValue[6] > 10 then begin
            if Random(40) <= SuccesRate - (UserItem.btValue[6] - 10) then begin
              BreakItem:=False;
              Succes:=FALSE;
            end else
            if Random(10) <= SuccesRate - (UserItem.btValue[6] - 10) then begin
              UserItem.btValue[6] := ItemUnit.UpgradeAttackSpeed( UserItem.btValue[6], _MAX(1,Random(GItem.MAC2)) );
            end else
              Succes:=FALSE;
          end else begin
            if Random(40) <= SuccesRate then begin
             Succes:=FALSE;
             BreakItem:=False;
            end else
            if Random(10) <= SuccesRate then begin
              UserItem.btValue[6] := ItemUnit.UpgradeAttackSpeed( UserItem.btValue[6], _MAX(1,Random(GItem.MAC2)) );
            end else
            Succes:=FALSE;
          end;
        end else
        if UItem.StdMode in [19,20,21] then begin //格吧捞
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[17]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[17]) then begin
            inc(UserItem.btValue[17],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //馆瘤
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[16]) then begin
          BreakItem:=False;
          Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[16]) then begin
            inc(UserItem.btValue[16],_MAX(1,Random(GItem.MAC2)));
          end else
          Succes:=FALSE;
        end;
      end;

      6: begin //雀乔
        if UItem.StdMode in [10,11,12] then begin //渴
          if Random(40) <= SuccesRate - UserItem.btValue[StatType] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[StatType] then begin
            inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //迫骂 倾府鹅 脚惯
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[16]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[16]) then begin
            inc(UserItem.btValue[16],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end;
      end;

      7: begin //郴备
        if Random(40) <= SuccesRate - (_MAX(0,(UserItem.DuraMax div 1000) - (UItem.DuraMax div 1000)) div 2) then begin
          BreakItem:=False;
          Succes:=FALSE;
        end else
        if Random(10) <= SuccesRate - (_MAX(0,(UserItem.DuraMax div 1000) - (UItem.DuraMax div 1000)) div 2) then begin
          DuraAdd:= (GItem.MAC2 * 1000); //Babyhack thanks to Sean
          if (UserItem.DuraMax + DuraAdd) > high(UserItem.DuraMax) then begin
            UserItem.DuraMax := high(UserItem.DuraMax);
          end else
            inc(UserItem.DuraMax, DuraAdd);
        end else
          Succes:=FALSE;
      end;

      8: begin //吝刀历亲
        if UItem.StdMode in [64] then begin //骇飘
          if Random(40) <= SuccesRate - UserItem.btValue[StatType] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[StatType] then begin
            inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else
        if UItem.StdMode in [10,11,12] then begin //渴
          if Random(40) <= SuccesRate - UserItem.btValue[7] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[7] then begin
            inc(UserItem.btValue[7],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //捧备
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[9]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[9]) then begin
            inc(UserItem.btValue[9],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end;
      end;

      12: begin //付过历亲
        if UItem.StdMode in [19,20,21] then begin //格吧捞
          if Random(40) <= SuccesRate - UserItem.btValue[StatType] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[StatType] then begin
            inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else
        if UItem.StdMode in [15] then begin //捧备
          if Random(40) <= SuccesRate - UserItem.btValue[10] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[10] then begin
            inc(UserItem.btValue[10],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //渴
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[8]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[8]) then begin
            inc(UserItem.btValue[8],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end;
      end;

      14: begin //趣茄 敌拳
        if UItem.StdMode in [5,6,90,99] then begin //公扁
          if Random(40) <= SuccesRate - UserItem.btValue[8] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[8] then begin
            inc(UserItem.btValue[8],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //格吧捞 馆瘤
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[StatType]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[StatType]) then begin
            inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end;
      end;

      15: begin //沥犬
        if UItem.StdMode in [19,20,21,24,26,64] then begin //格吧捞 迫骂 倾府鹅
          if Random(40) <= SuccesRate - UserItem.btValue[StatType] then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - UserItem.btValue[StatType] then begin
            inc(UserItem.btValue[StatType],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end else begin //捧备
          if Random(40) <= SuccesRate - LoByte(UserItem.btValue[8]) then begin
            BreakItem:=False;
            Succes:=FALSE;
          end else
          if Random(10) <= SuccesRate - LoByte(UserItem.btValue[8]) then begin
            inc(UserItem.btValue[8],_MAX(1,Random(GItem.MAC2)));
          end else
            Succes:=FALSE;
        end;
      end;


    end;
  end;
{take away the used up orb + if a gem the failed item}
 { for i := 0 to m_ItemList.Count - 1 do begin //taking away our gem
    if pTUserItem(m_ItemList[i]).MakeIndex = GemUserItem.MakeIndex then begin
      m_ItemList.Delete(i);
      break
    end;
  end;
  Dispose(GemUserItem);   }
  QuestTakeCheckItem (GemUserItem);
  if (not Succes) and (BreakItem) then begin //if the orbing/geming failed and the item should break then take it away
    SendDelItems(UserItem);
    for i := 0 to m_ItemList.Count - 1 do begin
      if pTUserItem(m_ItemList[i]).MakeIndex = UserItem.MakeIndex then begin
        m_ItemList.Delete(i);
        break
      end;
    end;            //QuestTakeCheckItem (puJewelry);
    SendDefMessage (SM_UPGRADEITEM_RESULT, UserItem.MakeIndex , 2, 0, 0, UItem.Name);    //焊苛
    Dispose(UserItem);
    ItmeNames := FilterStdShowName2(UItem, UItem.Name);
    SysMsg('物品('+ItmeNames+')已破碎。', c_Red, t_Hint);


    if GItem.NeedIdentify = 1 then
      AddGameDataLog('38' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     GItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 破碎]');

    exit;
  end;
  if succes then begin
    SendUpdateItem(UserItem);
    //努扼捞攫飘肺 搬苞 皋矫瘤 傈价.
    SendDefMessage (SM_UPGRADEITEM_RESULT, UserItem.MakeIndex , 2, 0, 0, UItem.Name);    //焊苛
    ItmeNames := FilterStdShowName2(UItem, UItem.Name);
    case GItem.AC of
      0: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，攻击得到了'+ IntToStr(GItem.MAC2) + '点提升。', c_Blue,t_Hint);
      1: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，魔法得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      2: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，道术得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      3: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，防御得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      4: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，魔法防御得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      5: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，攻击速度得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      6: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，敏捷得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      7: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，持久得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      8: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，毒物躲避得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
      9: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，中毒得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
     12: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，魔法躲避得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
     14: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，减速得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
     15: SysMsg(''+ItmeNames+'发出一道璀璨的亮光，准确得到了'+ IntToStr(GItem.MAC2) +'点提升。', c_Blue,t_Hint);
    end;

    if GItem.NeedIdentify = 1 then
      AddGameDataLog('36' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     GItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 成功]');

  end else begin
    ItmeNames := FilterStdShowName2(UItem, UItem.Name);
    SysMsg(''+ItmeNames+'没有发生任何变化。', c_Green,t_Hint);
    SendDefMessage (SM_UPGRADEITEM_RESULT, UserItem.MakeIndex , 2, 0, 0, UItem.Name);    //焊苛

     if GItem.NeedIdentify = 1 then
      AddGameDataLog('37' +  #9 +
                     m_sMapName + #9 +
                     IntToStr(m_nCurrX) + #9 +
                     IntToStr(m_nCurrY) + #9 +
                     m_sCharName + #9 +
                     GItem.Name + #9 +
                     IntToStr(UserItem.MakeIndex) + #9 +
                     '1' + #9 +
                     '0' + #9 + '[宝玉/宝珠 不变]');
  end;
end;

procedure THeroObject.GemItemFail(UserItem:pTUserItem;msg:String);         //焊苛(备 矫胶袍)
begin
  SendMsg(Self,RM_MENU_OK,0,Integer(self),0,0,msg);
  SendAddItem(UserItem);
end;

end.

