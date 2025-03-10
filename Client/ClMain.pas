unit ClMain;

interface

uses
  {svn, }nixtime, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JSocket, ExtCtrls, DXDraws, DirectX, DXClass, DrawScrn, Bass,
  IntroScn, PlayScn, MapUnit, WIL, Grobal2, SDK, TlHelp32,
  Actor, DIB, StdCtrls, CliUtil, HUtil32, EdCode,
  DWinCtl, ClFunc, magiceff, SoundUtil, DXSounds, clEvent, IniFiles,
  Spin, ComCtrls, RelationShip , Grids, Mpeg, Menus, Mask, MShare, Share, StrUtils;{ÀÎÅÍ³ÝÃ¢}


const
   BO_FOR_TEST = FALSE;
   EnglishVersion = TRUE;
   BoNeedPatch = TRUE;
   NEARESTPALETTEINDEXFILE = 'Data\npal.idx';
   MonImageDir = '.\Graphics\Monster\';
   NpcImageDir = '.\Graphics\Npc\';
   ItemImageDir = '.\Graphics\Items\';
   WeaponImageDir = '.\Graphics\Weapon\';
   HumImageDir = '.\Graphics\Human\';

type

  TKornetWorld = record
    CPIPcode:  string;
    SVCcode:   string;
    LoginID:   string;
    CheckSum:  string;
  end;

  TOneClickMode = (toNone, toKornetWorld);

  TfrmMain = class(TDxForm)
    CSocket: TClientSocket;
    Timer1: TTimer;
    MouseTimer: TTimer;
    WaitMsgTimer: TTimer;
    SelChrWaitTimer: TTimer;
    CmdTimer: TTimer;
    SpeedHackTimer: TTimer;
    DXDraw: TDXDraw;
    Timer2: TTimer;
    FishingTime: TTimer;
    StoreMacro: TTimer;
    LoverMacro: TTimer;
    Timer5Process: TTimer;
    Timer4Module: TTimer;
    Timer3: TTimer;
    TimerStartGame: TTimer;    //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    TimerCheckRun: TTimer;     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    TimerStopGame: TTimer;     //¼öÁ¤µÇ¾ú½À´Ï´Ù.




    procedure StartGame(); //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure StopGame();  //¼öÁ¤µÇ¾ú½À´Ï´Ù.

    procedure DXDrawInitialize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DXDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DXDrawFinalize(Sender: TObject);
    procedure CSocketConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure CSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure CSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure DXDrawMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DXDrawDblClick(Sender: TObject);
    procedure WaitMsgTimerTimer(Sender: TObject);
    procedure SelChrWaitTimerTimer(Sender: TObject);
    procedure DXDrawClick(Sender: TObject);
    procedure CmdTimerTimer(Sender: TObject);
    procedure SendTimeTimerTimer(Sender: TObject);
    procedure DelitemProg;
    procedure SpeedHackTimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DelitemProg2;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FishingTimeTimer(Sender: TObject);
    procedure StoreMacroTimer(Sender: TObject);
    procedure LoverMacroTimer(Sender: TObject);
    procedure Timer5ProcessTimer(Sender: TObject);   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure FormActivate(Sender: TObject);
    procedure Timer4ModuleTimer(Sender: TObject);     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure Timer3Timer(Sender: TObject);
    procedure TimerStartGameTimer(Sender: TObject);    //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure TimerCheckRunTimer(Sender: TObject);     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure TimerStopGameTimer(Sender: TObject);     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  //  procedure Timer4Timer(Sender: TObject);
  private
    SocStr, BufferStr: string;
    TimerCmd: TTimerCommand;
    MakeNewId: string;
    ActionLockTime: LongWord;
    LastHitTick: LongWord;
    ActionFailLock: Boolean;
    ActionFailLockTime:LongWord;
    FailAction, FailDir: integer;
  //  ActionKey: word;
    CursorSurface: TDirectDrawSurface;
    mousedowntime: longword;
    WaitingMsg: TDefaultMessage;
    WaitingStr: string;
    procedure RunEffectTimerTimer(Sender: TObject);//¸¶·æ¹ø°³

    procedure AutoPickUpItem();
    procedure AutoFishEp();       //³¬½Ã ÀÚµ¿
    procedure ProcessKeyMessages;
    procedure ProcessActionMessages;
    procedure GetAutoMovingXY();
    procedure CheckSpeedHack (rtime: Longword);
    procedure DecodeMessagePacket (datablock: string);
    procedure ActionFailed;
    function CheckUseMagicbujuk (MaicId:Word): Boolean;
    function CheckUseMagicWeapon (MaicId:Word): Boolean;

    function CheckUseMagicHerobujuk (MaicId:Word): Boolean;
    function CheckUseMagicHeroWeapon (MaicId:Word): Boolean;

    function CheckUseMagicTarget (MaicId:Word): Boolean;
    function CheckUseMagicDelay (MaicId:integer): Boolean;
    function CheckUseMagicMonk (MaicId:Word): Boolean; //Áø½Å»ç¸® È®ÀÎ

    function FindMagic(wMagicId: Word): PTClientMagic;
    procedure UseMagic (tx, ty: integer; pcm: PTClientMagic);
    procedure HeroUseMagic(tx, ty: Integer; pcm: PTClientMagic);
    procedure UseMagicSpell (who, effnum, targetx, targety, magic_id: integer);
    procedure UseMagicFire (who, efftype, effnum, targetx, targety, target: integer);
    procedure UseMagicFireFail (who: integer);
    procedure CloseAllWindows;
    procedure CloseAllWindows2;
    procedure ClearDropItems;
    procedure ResetGameVariables;
    procedure ChangeServerClearGameVariables;
    procedure _DXDrawMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AttackTarget (target: TActor);
    function  CheckDoorAction (dx, dy: integer): Boolean;

    procedure ClientSnow(DefMsg: pTDefaultMessage; body: string);//´«¿À´ÂÀÌÆåÆ®
    procedure ClientStore(DefMsg: pTDefaultMessage); //°³ÀÎ»óÁ¡
    procedure ClientDelStoreItem(body: string);     //°³ÀÎ»óÁ¡
    procedure ClientGetSendUserStoreState(body: string);   //°³ÀÎ»óÁ¡
    procedure ClientObjBuyStoreItemOK(); //°³ÀÎ»óÁ¡
    procedure ClientObjBuyStoreItemFail(DefMsg: pTDefaultMessage); //°³ÀÎ»óÁ¡
    procedure ClientObjStartStoreOK();      //°³ÀÎ»óÁ¡
    procedure ClientObjStopStoreOK();        //°³ÀÎ»óÁ¡
    procedure ClientObjStartStoreFail();     //°³ÀÎ»óÁ¡

    procedure ClientGetRenewHum(Msg: pTDefaultMessage; Body: string);
    procedure ClientGetPasswdSuccess (body: string);
    procedure ClientGetNeedUpdateAccount (body: string);
    procedure ClientGetSelectServer;
    procedure ClientGetPasswordOK(Msg:TDefaultMessage;sBody:String);
    procedure ClientGetReceiveChrs (body: string);
    procedure ClientGetStartPlay (body: string);
    procedure ClientGetReconnect (body: string);
    procedure ClientGetServerConfig(Msg:TDefaultMessage;sBody:String);
    procedure ClientGetMapDescription (Msg:TDefaultMessage;sBody:String);
    procedure ClientGetGameGoldName (Msg:TDefaultMessage;sBody:String);
    procedure ClientGetSayItem(Msg: TDefaultMessage; sBody: string);
    procedure ClientGetAdjustBonus (bonus: integer; body: string);
    procedure ClientGetAddItem (body: string; idx:integer);
    procedure ClientGetAddItem2 (body: string; idx:integer);//¹°¾à
    procedure ClientGetStorageAddItem (body: string;idx:integer);
    procedure ClientGetHeroStorageAddItem (body: string;idx:integer);
    procedure ClientGetGroupAddItem(Msg: pTDefaultMessage; Grade:Byte; sBody:String); //±×·ì¾ÆÀÌÅÛ È¹µæ ¸Þ½ÃÁö
    procedure ClientGetAddStore (body: string);    //¿©°ü
    procedure ClientGetAddHeroStore (body: string);    //¿©°ü
    procedure ClientGetUpdateItem (body: string);
    procedure ClientGetComUpdateItem (body: string);
    procedure ClientGetDelItem (body: string; flag: integer );
    procedure ClientGetDelItems (body: string);
    procedure ClientGetBagItmes (body: string);    //°¡¹æ
    procedure ClientGetStoreItems (body: string);     //¿©°ü
    procedure ClientGetHeroStoreItems (body: string);
    procedure ClientRentalItems (body: string);  //´ë¿©
    procedure ClientOwnerItems (body: string);  //´ë¿©

    procedure ClientPetInfo (body: string);  //¿µ¹° Á¤º¸ ¹Þ¾Æ¼­ ÀúÀåÇÏ±â
    procedure ClientAucItems (body: string);      //°æ¸Å
    procedure ClientAuctionItems (body: string);   //À§Å¹
    procedure ClientComStorageItems (body: string); //°ø¿ëÃ¢°í
    procedure ClientGuildStorageItems (body: string); //¹®ÆÄÃ¢°í
    procedure ClientGTList (body: string);
    procedure ClientDecoList (body: string);
    procedure ClientBBSList (body: string);     //Àå¿ø°Ô½ÃÆÇ
    procedure ClientBBSMsg (body: string);     //Àå¿ø°Ô½ÃÆÇ
    procedure ClientGetDropItemFail (iname: string; sindex: integer);
    procedure ClientGetFriendChange(Msg: pTDefaultMessage; body: string);
    procedure ClientGetShowItem (itemid, x, y, looks: integer; body: string);
    procedure ClientGetHideItem (itemid, x, y: integer);
    procedure ClientGetSenduseItems (body: string);
    procedure ClientGetSendAddUseItems (body: string);
    procedure ClientGetAddMagic (body: string);
    procedure ClientGetDelMagic (magid: integer);
    procedure ClientGetMyMagics (body: string);
    procedure ClientGetSound(soundid :integer);
    procedure ClientGetMagicLvExp (magid, maglv, magtrain: integer);
    procedure ClientGetDuraChange (uidx, newdura, newduramax: integer);
    procedure ClientGetMerchantSay (merchant, face: integer; saying: string);
    procedure ClientGetSendGoodsList (merchant, count: integer; body: string); //»óÀÎ
    procedure ClientGetSendMakeItemList (merchant, count: integer; body: string);    //Á¦Á¶½ºÃÄ
    procedure ClientGetSendUserSell (merchant: integer);
    procedure ClientGetSendItemLock (merchant: Integer);
    procedure ClientObjItemLockOK(DefMsg: pTDefaultMessage; sDate: string);
    procedure ClientObjItemLockFail(DefMsg: pTDefaultMessage);

    procedure ClientObjWakeCost(nGold: Integer);
    procedure ClientObjItemWakeOK(DefMsg: pTDefaultMessage; sDate: string);
    procedure ClientObjItemWakeFail(DefMsg: pTDefaultMessage);

    procedure ClientObjReStoreCost(nGold: Integer);
    procedure ClientObjItemReStoreOK(DefMsg: pTDefaultMessage; sDate: string);
    procedure ClientObjItemReStoreFail(DefMsg: pTDefaultMessage);

    procedure ClientObjStoragePWFail(DefMsg: pTDefaultMessage);   //Ã¢°í¾ÏÈ£
    procedure ClientObjStorageCheck(DefMsg: pTDefaultMessage);    //Ã¢°í¾ÏÈ£

    procedure ClientGetSendUserWake(merchant: Integer);
    procedure ClientGetSendUserReStore(merchant: Integer);

    procedure ClientGetSendUserRepair (merchant: integer);
    procedure ClientGetSendUserStorage (merchant, mode: integer);
    procedure ClientGetSendComStorage (merchant: integer);    //°ø¿ëÃ¢°í
    procedure ClientGetSendGuildStorage (merchant: integer);    //°ø¿ëÃ¢°í

    procedure ClientGetSendUserDisassemble (merchant: integer); //°¢¼ººÐÇØ
    procedure ClientGetSendUserDismantle (merchant: integer);    //ÀÏ¹ÝºÐÇØ
    procedure ClientGetCompoundInfos(body: string);
    procedure ClientGetSendNotice (body: string);
    procedure ClientGetDataFile(Msg: TDefaultMessage; bodystr: string);
    procedure ClientGetCheckMsg(Msg: pTDefaultMessage; bodystr: string);

    procedure ClientGetAddMembers(Msg: pTDefaultMessage; bodystr: string);
    procedure ClientGetDelMembers(Msg: pTDefaultMessage; bodystr: string);
    procedure ClientGetGroupMembers (Msg: TDefaultMessage; bodystr: string);
    procedure ClientGetGroupInfo(Msg: TDefaultMessage; bodystr: string);
    procedure ClientGetOpenGuildDlg (mode: Integer; bodystr: string);
    procedure ClientGetSendGuildMemberList (body: string);
    procedure ClientGetDealRemoteAddItem (body: string);       //°Å·¡
    procedure ClientGetDealRemoteDelItem (body: string);       //°Å·¡
    procedure ClientGetRentalRemoteAddItem (body: string);       //´ë¿©
    procedure ClientGetRentalRemoteDelItem (body: string);       //´ë¿©
    procedure ClientGetSetItems(Msg: pTDefaultMessage; body: string);
    procedure ClientGetHintDataList(Msg: pTDefaultMessage; body: string);
    procedure ClientGetChangeGuildName (Msg: pTDefaultMessage; body: string);
    procedure ClientGetSendUserState (body: string);
    procedure ClientGetSendGuildGrow (body: string); //¹®ÆÄ¼ºÀå
    procedure ClientGetSendGuildGrow2 (body: string); //¹®ÆÄ¼ºÀå

    procedure ClientGetTagAlarm  (msg :TDefaultMessage;body: string);
    procedure ClientGetTagInfo   (msg :TDefaultMessage);

    procedure ClientObjBlasthit(DefMsg: pTDefaultMessage);   //ÂüÁø°Ý

    procedure ClientGetFriendResult(msg :TDefaultMessage;body: string);

    procedure ClientShowChangeItem;       //º¯È¯
    procedure ClientObjGetGuild(Msg:pTDefaultMessage);  //¹®ÆÄ ¸¶Å©
    procedure ClientObjGetMask(Msg:pTDefaultMessage; Eff:string);    //º¯½ÅÅ» ±âÆÛÁü

    procedure ClientMailList();
    procedure ClientGetMailList(msg: TDefaultMessage; body: string);
    procedure ClientMailResult(msg: TDefaultMessage);
    procedure ClientMailStatus(msg: TDefaultMessage; body: string);

    procedure RecalcNotReadCount;       //ÂÊÁö

    procedure ClientRejectResult(msg: TDefaultMessage; body: string);
    procedure ClientGetTagRejectList(msg: TDefaultMessage; body: string);
    procedure ClientRejectListAdded(msg: TDefaultMessage; body: string);
    procedure ClientRejectListDeleted(msg: TDefaultMessage; body: string);
    procedure SetInputStatus();
    procedure ShowHumanMsg(Msg: pTDefaultMessage);
    procedure SendPowerBlock;

    procedure ClientGetSayMsg(Msg: TDefaultMessage; sBody: string);
    procedure ClientStorageSetPassWord();     //Ã¢°í¾ÏÈ£
    procedure ClientStorageInputPassWord(mode: integer);   //Ã¢°í¾ÏÈ£

    procedure ClientObjWakeUp(nItemIndex, mode: Integer; sData: string);
    procedure ClientObjWakeUpItemOK(sData: string);
    procedure ClientObjWakeUpItemFail(nFailCode, nMax: Integer; sData: string);
    //2003/007/08 »çÁ¦    //»çÁ¦ ½ºÃÄ
    procedure ClientGetMEList(msg: TDefaultMessage; body: string);
    procedure ClientGetMEInfoList(msg: TDefaultMessage; body: string);
    procedure ClientObjDueltryFail(nFailCode: Integer);
    procedure ClientObjDuelMenu(sData: string);
    procedure ClientObjDuelCancel();
    procedure ClientObjDuelAddItemOK();
    procedure ClientObjDuelDelItemOK();
    procedure ClientObjDuelDelItemFail();
    procedure ClientObjDuelChgGoldOK(DefMsg: pTDefaultMessage);
    procedure ClientObjDuelChgGoldFail(DefMsg: pTDefaultMessage);
    procedure ClientObjDuelRemotChgGold(DefMsg: pTDefaultMessage);
    procedure ClientObjDuelStartCount(DefMsg: pTDefaultMessage);
    procedure ClientGetDuelRemoteAddItem(body: string);
    procedure ClientGetDuelRemoteDelItem(body: string);

    //2003/007/08 ¿¬ÀÎ    //¿¬ÀÎ ½ºÃÄ
    procedure ClientGetLMList(msg: TDefaultMessage; body: string);
    procedure ClientGetLMOptionChange(msg: TDefaultMessage);
    procedure ClientGetLMRequest(msg: TDefaultMessage; body: string);
    procedure ClientGetLMResult(msg: TDefaultMessage; body: string);
    procedure ClientGetLMDelete(msg: TDefaultMessage; body: string);
    procedure EnableRogue();
    procedure DisableRogue();
    procedure ClientObjStruck(Msg: TDefaultMessage; sData: string);

    procedure ClientHeroCreate(merchant: Integer);  //¿µ¿õ °í¿ë
    procedure ClientGetHeroInfo(DefMsg: pTDefaultMessage);
    procedure ClientObjHeroLogOn(DefMsg: pTDefaultMessage; sData: string);
    procedure ClientObjHeroLogOnOK(DefMsg: pTDefaultMessage);

    procedure ClientObjHeroLogOut(DefMsg: pTDefaultMessage);
    procedure ClientObjHeroLogOutOK(nRecog: Integer);

    procedure ClientObjHeroAbility(DefMsg: pTDefaultMessage; sData: string);
    procedure ClientObjHeroSubAbility(DefMsg: pTDefaultMessage);
    procedure ClientGetHeroBagItmes(DefMsg: pTDefaultMessage; body: string);
    procedure ClientGetSendHerouseItems(body: string);
    procedure ClientObjHeroBagCount(DefMsg: pTDefaultMessage);
    procedure ClientGetHeroAddItem(body: string);
    procedure ClientGetHeroAddItem2(body: string; idx:integer);
    procedure ClientObjHeroTakeOnOK(DefMsg: pTDefaultMessage; sData: string);
    procedure ClientObjHeroTakeOnFail();
    procedure ClientObjHeroTakeOffOK(DefMsg: pTDefaultMessage; sData: string);
    procedure ClientObjHeroTakeOffFail();

    procedure ClientObjToMasterBagOK();
    procedure ClientObjToMasterBagFail();
    procedure ClientObjToHeroBagOK();
    procedure ClientObjToHeroBagFail();

    procedure ClientObjHeroEatOK(DefMsg: pTDefaultMessage);
    procedure ClientObjHeroEatFail();
    procedure ClientGetHeroMagicLvExp(magid, maglv, magtrain: Integer);
    procedure ClientGetHeroDuraChange(uidx, newdura, newduramax: Integer);
    procedure ClientObjHeroWeigthChanged(DefMsg: pTDefaultMessage);
    procedure ClientObjHeroWinExp(DefMsg: pTDefaultMessage);
    procedure ClientObjHeroLevelUp(DefMsg: pTDefaultMessage);

    procedure ClientGetMyHeroMagics(body: string);
    procedure ClientGetHeroAddMagic(body: string);
    procedure ClientGetHeroDelMagic(magid: Integer);
    procedure ClientGetHeroUpdateItem(body: string);
    procedure ClientObjHeroAiMode(nOpen: Integer);

    procedure ClientGetHeroAutoItmes(DefMsg: pTDefaultMessage; body: string);
    procedure ClientGetAddHeroAuto (body: string);
    procedure ClientGetHeroDelItems(body: string);
    procedure ClientGetHeroDelItem(body: string);
    procedure ClientGetHeDelItem (body: string; flag: integer );
    procedure ClientGetHeroAutoDelItem(body: string);
    procedure ClientGetHeroAutoAddItem(body: string; idx:integer);
    procedure AutoUseItem();
    procedure AutoHeroItem();
    function AutoHeroEatItem(idx: Integer): Boolean;
  public
    LoginId, LoginPasswd, CharName: string;
    Certification: integer;
    ActionLock: Boolean;
    DXRETime:LongWord;
    //MainSurface: TDirectDrawSurface;
    NpcImageList:TList;
    ItemImageList:TList;
    WeaponImageList:TList;
    HumImageList:TList;

    xtxx: integer;
    xtxy: integer;
    XTXTy: integer;
    TXTXX: integer;

    RunEffectTimer: TTimer;    //¸¶·æ¹ø°³
    WhisperName: string;
    ActionKey: word;

    procedure CmdShowHumanMsg(sParam1, sParam2, sParam3, sParam4, sParam5: String);
    procedure ProcOnIdle;
    procedure AppOnIdle (Sender: TObject; var Done: Boolean);
    procedure AppLogout;
    procedure AppLogout2;  //Á×À¸¸é
    procedure AppExit;
    procedure PrintScreenNow;
    procedure EatItem (idx: integer);
    procedure GetMoveHPShow(Actor: TActor; nCount: Word);
    procedure UseNormalEffect (effnum, effx, effy: integer);
    procedure DrawEffectHum(nType,nX,nY:Integer; Dir: Integer);
    procedure DrawEffectHumEx(nType: integer;ObjectID:TActor);
    procedure SendLogin (uid, passwd: string);
    procedure SendNewAccount (ue: TUserEntry; ua: TUserEntryAdd);
    procedure SendUpdateAccount (ue: TUserEntry; ua: TUserEntryAdd);
    procedure SendSelectServer (svname: string);
    procedure SendChgPw (id, passwd, newpasswd: string);
    procedure SendNewChr (uid, uname, shair, sjob, ssex: string);
    procedure SendQueryChr;
    procedure SendDelChr (chrname: string);
    procedure SendSelChr (chrname: string);
    procedure SendViewDelHum();
    procedure SendRenewHum(chrname: string);
    procedure SendRunLogin;
    procedure SendSay (str: string);
    procedure SendActMsg (ident, x, y, dir: integer);
    procedure SendSpellMsg (ident, x, y, dir, target: integer);
    procedure SendQueryUserName (targetid, x, y: integer);
    procedure SendDropItem (name: string; itemserverindex: integer);    //¾ÆÀÌÅÛ ¹ö¸²
    procedure SendPickup;
    procedure SendPetPickup;
    procedure SendPetPickupMouse;
    procedure SendTakeOnItem (where: byte; itmindex: integer; itmname: string);
    procedure GotoUpwaoinItem(merchant, itemindex: integer; Data: string);   //Àç·Ã
    procedure BundleItem  (mode,MaxAmount:integer;MakeIndex:string);    //¹°¾à
    procedure BundleStorageItem  (mode,MaxAmount:integer;MakeIndex:string);  //¹°¾à Ã¢°í
    procedure SeparateItem(MakeIndex,amount:integer);   //¹°¾à
    procedure SendTakeOffItem (where: byte; itmindex: integer; itmname: string);
    procedure SendEat (itmindex: integer; itmname: string);
    procedure UpgradeItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);            //½ºÃÄ
    procedure UpgradeHeroItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);            //½ºÃÄ
    procedure UpgradeItemResult (ItemIndex: integer; wResult : word; str: string);     //º¸¿Á
    procedure SendButchAnimal (x, y, dir, actorid: integer);
    procedure SendMagicKeyChange (magid: integer; keych: char);
    procedure SendHeroMagicKeyChange(magid: Integer; keych: Char);
    procedure SendMerchantDlgSelect (merchant: integer; rstr: string);
    procedure SendCheckMsgDlgSelect(merchant, nBut: Integer);
    procedure SendDismantleItem (merchant, itemindex: integer; itemname: string); //ÀÏ¹ÝºÐÇØ
    procedure SendDismantlePrice (merchant, itemindex: integer; itemname: string);  //ÀÏ¹ÝºÐÇØ°¡°Ý
    procedure SendDisassemblePrice (merchant, itemindex: integer; itemname: string);  //ºÐÇØ°¡°Ý
    procedure SendDisassembleItem (merchant, itemindex: integer; itemname: string);
    procedure SendItemWakeUp (mode, itemindex: integer);       //°¢¼º
    procedure SendQueryPrice (merchant, itemindex: integer; itemname: string);
    procedure SendQueryRepairCost (merchant, itemindex: integer; itemname: string);
    procedure SendQueryWakeCost(merchant, itemindex: Integer; itemname: string);
    procedure SendQueryReStoreCost(merchant, itemindex: Integer; itemname: string);
    procedure SendSellItem (merchant, itemindex: integer; itemname: string);
    procedure SendItemLock(merchant, itemindex: Integer; itemname: string);
    procedure SendItemWake(merchant, itemindex: Integer; itemname: string);
    procedure SendItemReStore(merchant, itemindex: Integer; itemname: string);
    procedure SendRepairItem (merchant, itemindex: integer; itemname: string);
    procedure SendCheckWeaponItem (merchant, itemindex: integer; itemname: string);  //Á¦·Ã È®ÀÎ
    procedure SendStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
    procedure SendHeroStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
    procedure SendConsignItem (merchant, itemindex{,amount}: integer; cost: string);
    procedure SendStoragePassWord(nRecogId, Mode: Integer; PassWord: string); //Ã¢°í¾ÏÈ£
    procedure SendComStorageItem (merchant, itemindex{,amount}: integer);    //°ø¿ëÃ¢°í
    procedure SendGuildStorageItem (merchant, itemindex{,amount}: integer);    //¹®ÆÄÃ¢°í
    procedure SendBuyItem (merchant, itemserverindex,amins: integer; itemname: string);   //¹°¾à
    procedure SendPBuyItem (merchant, itemserverindex,amins: integer; itemname: string);
    procedure SendTakeBackStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
    procedure SendTakeBackHeroStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
    procedure SendMakeItemSel (merchant: integer; itemname: string);  //Á¦Á¶½ºÃÄ
    procedure SendMakeItem (merchant: integer; data: string);       //Á¦Á¶½ºÃÄ
    procedure SendDropGold (dropgold: integer);
    procedure SendGroupMode ();
    procedure SendCreateGroup (ItemClass, boHero: Integer; withwho: string);
    procedure SendRentalTry;        //´ë¿©
    procedure SendDealTry;        //°Å·¡
    procedure SendGuildDlg;
    procedure SendCancelDeal;       //°Å·¡
    procedure SendCancelRental;       //´ë¿©
    procedure SendCancelExChange;  //È¯Àü Ãë¼Ò
    procedure ClientBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¹öÇÁ

    procedure ClientHeroBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¿µ¿õ¹öÇÁ
    procedure ClientCoolBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¹öÇÁ
    procedure ClientCoolTime(Body:String;Ttiem:integer); //¸®ÄÝ
    procedure ClientRockPapersGame(Gold:String; Rate:integer);
    procedure SendTigerSet (onoff: Boolean);    //È£¶ûÀÌ
    procedure SendGuildSet (guildimg: integer);    //¹®ÆÄ ¸¶Å©
    procedure SendGuildGrowUp (guildUP: integer);    //¹®ÆÄ¼ºÀå

    procedure ClientAucBuff(Makeindex:String;Cost:integer);  //°æ¸Å


    procedure SendAddAutItem (ci: TClientItem; Price:Integer);  //°æ¸Å

    procedure SendAddRentalItem (ci: TClientItem;Day: integer);  //´ë¿©
    procedure SendDelRentalItem (ci: TClientItem);   //´ë¿©
    procedure SendChangeRentalGold (gold: integer);  //´ë¿©
    procedure SendRentalEnd;                        //´ë¿©

    procedure SendAddDealItem (ci: TClientItem);          //°Å·¡
    procedure SendDelDealItem (ci: TClientItem);         //°Å·¡
    procedure SendDelDealItem2 (ci: TClientItem);         //°Å·¡
    procedure SendChgStorePw (storepasswd, newstorepasswd: string);
    procedure SendChangeDealGold (gold: integer);          //°Å·¡
    procedure SendDealEnd;                                //°Å·¡

    procedure SendChangeExChangeGold (gold: integer);   //È¯Àü
    procedure SendChangeExChangeGameGold (gold: integer);   //È¯Àü
    procedure SendExChangeEnd;     //È¯Àü ¿Ï·á
    procedure SendAddGroupMember (withwho: string);
    procedure SendDelGroupMember (withwho: string);
    procedure SendGuildHome;
    procedure SendGuildMemberList;
    procedure SendGuildAddMem (who: string);
    procedure SendGuildDelMem (who: string);
    procedure SendGuildUpdateNotice (notices: string);
    procedure SendGuildUpdateGrade (rankinfo: string);
    procedure SendSpeedHackUser(code: integer);
    procedure SendGetSayItem(nid, ItemIndex: Integer);
    procedure SendAdjustBonus (remain: integer; babil: TNakedAbility);
    procedure SendPassword(sPassword:String;nIdent:Integer);
    procedure SendGTListRequest(merchant: integer; menuindex: integer);
    procedure SendBuyGT(merchant: integer; GTNumber: integer);
    procedure SendDecoListRequest(merchant: integer; menuindex: integer);
    procedure SendBuyDeco(merchant: integer; Appr: integer);

    // 2003/04/15 Ä£±¸, ÂÊÁö
    procedure SendMail        (data: string);     //¸Þ¸ð
    procedure SendReadingMail (Id: integer);      //¸Þ¸ð
    procedure SendDelMail     (Id: integer);     //¸Þ¸ð
    procedure SendLockMail    (Id: integer);      //¸Þ¸ð
    procedure SendUnLockMail  (Id: integer);       //¸Þ¸ð
    procedure SendMailList;                       //¸Þ¸ð
    procedure SendRejectList;     //°ÅºÎÀÚ

    procedure SendAddReject   (data: string);
    procedure SendDelREject   (data: string);

    //¿¬ÀÎ ½ºÃÄ
    procedure SendLMOPtionChange(OptionType: integer; Enable: integer);     //»çÁ¦ ½ºÃÄ
    procedure SendLMRequest(ReqType: integer; ReqSeq: integer);
    procedure SendLMSeparate(ReqType: integer; Data: string);

    //»çÁ¦ ½ºÃÄ
    procedure SendMERequest(ReqType: integer; ReqSeq: integer; ReqRe: integer; Data: string);
    procedure SendMESeparate(ReqType: integer; Data: string);

    procedure SendStartStore();   //°³ÀÎ»óÁ¡
    procedure SendBuyStoreItem(sItems: string; nMakeIndex, nRecogId: Integer);  //°³ÀÎ»óÁ¡

    procedure SendTradeGT(Answer:integer);
    procedure SendBBSListRequest(merchant: integer; menuindex: integer);     //Àå¿ø°Ô½ÃÆÇ
    procedure SendBBSMsgRequest(Merchant: integer; Index: integer);          //Àå¿ø°Ô½ÃÆÇ
    procedure SendBBSPost(Merchant,sticky,MasterPost: integer; sMsg: String); //Àå¿ø°Ô½ÃÆÇ
    procedure SendBBSDelete(Merchant,index: integer);                         //Àå¿ø°Ô½ÃÆÇ
    function  GetMagicByKey (Key: char): PTClientMagic;
    function GetHeroMagicByKey(Key: Char): PTClientMagic;
    function  TargetInSwordLongAttackRange (ndir: integer): Boolean;
    function  TargetInSwordWideAttackRange (ndir: integer): Boolean;
    function  TargetInSwordCrsAttackRange(ndir: integer): Boolean;
    procedure OnProgramException (Sender: TObject; E: Exception);
    procedure SendSocket (sendstr: string);
    function  ServerAcceptNextAction: Boolean;
    function  CanNextAction: Boolean;
    function CanNextHeroAction: Boolean;
    function  CanNextHit: Boolean;
    function  IsUnLockAction (action, adir: integer): Boolean;
    procedure ActiveCmdTimer (cmd: TTimerCommand);
    function  IsGroupMember (uname: string): Boolean;
    function CheckItemDelay (mode:integer): Boolean;     //¸ÁÀÚÀÇ¿Ê
    procedure SendWakeUpItem(UpgradeItemIndexs: Integer; mode: byte; sData:string);
    procedure SendWakeUp(UpgradeItemIndexs: Integer; mode: byte; sData:string);

    procedure QueryRogueEnabled;

    procedure SendAddAutoItem (itemindex: integer; itemname: string);
    procedure SendDelAutoItem (itemserverindex: integer; itemname: string);

    procedure SelectChr(sChrName:String);
    function  GetNpcImg(wAppr: Word; var WMImage: TWMImages): Boolean;
    function  GetWStateImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢(±âº»)
    function  GetWStateImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢(±âº») overload

    function  GetWStateComManImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢(µî¼±°ø¿ë³²ÀÚ)
    function  GetWStateComManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢(µî¼±°ø¿ë³²ÀÚ) overload

    function  GetWStateComWomanImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢(µî¼±°ø¿ë¿©ÀÚ)
    function  GetWStateComWomanImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢(µî¼±°ø¿ë¿©ÀÚ) overload

    function  GetWStateWarrManImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
    function  GetWStateWarrManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ º®Ç÷Àü»ç(³²) overload
    function  GetWStateWarrWoImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ º¯Ç÷Àü»ç(¿©)
    function  GetWStateWarrWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ º¯Ç÷Àü»ç(¿©) overload

    function  GetWStateWizManImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
    function  GetWStateWizManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload;  //»óÅÂÃ¢ È«Çö¼ú»ç(³²) overload
    function  GetWStateWizWoImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
    function  GetWStateWizWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ È«Çö¼ú»ç(¿©Õ overload

    function  GetWStateMonkManImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
    function  GetWStateMonkManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²) overload
    function  GetWStateMonkWoImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
    function  GetWStateMonkWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©) overload

    function  GetWStateAssManImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
    function  GetWStateAssManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²) overload
    function  GetWStateAssWoImg(Idx:Integer): TDirectDrawSurface;overload;    //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)
    function  GetWStateAssWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©) overload

    function  GetWWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWWeapon_BonzeImg(Weapon, m_btSex, nFrame: Integer; var ax, ay: Integer): TDirectDrawSurface;
    function  GetWFishingWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //³¬½Ã
    function  GetWFishingUpWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //³¬½Ã
    function  GetWWeapon_Killer_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ÀÚ°´ ¿À¸¥¼Õ
    function  GetWWeapon_Killer_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ÀÚ°´ ¿Þ¼Õ

    function  GetWWeapon_CommonImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //µî¼±¹«±â
    function  GetWWeapon_WarrImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //º®Ç÷Àü»ç
    function  GetWWeapon_WizImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //È«Çö¼ú»ç
    function  GetWWeapon_MonkImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ÀÍ¼±µµ»ç

    function  GetWWeapon_Assassin_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ºñ¿¬ÀÚ°´ ¿À¸¥¼Õ
    function  GetWWeapon_Assassin_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ºñ¿¬ÀÚ°´ ¿Þ¼Õ

    function  GetWHumImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum3Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum4Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum_BonzeImg(Dress,m_btSex, nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;

    function  GetWHum_CommonImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;//µî¼± ±âº»
    function  GetWHum_KillerImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ÀÚ°´
    function  GetWHum_Killer2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ÀÚ°´
    function  GetWHum_Killer4Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ÀÚ°´
    function  GetWHumUp_WarrImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //º®Ç÷Àü»ç
    function  GetWHumUp_WizImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //È«Çö¼ú»ç
    function  GetWHumUp_MonkImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ÀÍ¼±µµ»ç
    function  GetWHumUp_AssassinImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ºñ¿¬ÀÚ°´
    procedure ProcessCommand(sData:String);
    procedure UseLoopNormalEffect(ActorID: integer; EffectIndex, LoopTime: word);
    procedure ClientGetDiceGame(Body:String); //Ç÷·æ»óÀÚ
    procedure SendDiceitem (nFrame:Integer;shopok: string);   //Ç÷·æ»óÀÚ
    procedure ClientWakeData(DefMsg: pTDefaultMessage; Body:String);   //°¢¼ºÀç·á
    procedure ClientGetShopData(Body:String);   //È¯»óÁ¡
    procedure Sendshopbuyitem (shopok: string);   //È¯»óÁ¡
    procedure ClientGifts(Body:String);     //È¯»óÁ¡

//    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
   // procedure WMSetFocus(var WMessage: TMessage); message WM_SETFOCUS;
   // procedure WMKillFocus(var WMessage: TMessage); message WM_KILLFOCUS;
    function CheckApiHook(): Boolean;

    procedure SendNewHero(merchant: Integer; uname, shair, sjob, ssex: string); //¿µ¿õ»ý¼º
    procedure HeroSeparateItem(MakeIndex,amount:integer);   //¹°¾à
    procedure BundleHeroItem  (mode,MaxAmount:integer;MakeIndex:string);    //¹°¾à
    procedure BundleHeroStorageItem  (mode,MaxAmount:integer;MakeIndex:string);
    procedure HeroEatItem(idx: Integer);
    procedure SendAutoHeroEat(itmindex: Integer; itmname: string);
    procedure SendHeroEat(itmindex: Integer; itmname: string);

    procedure SendHeroTakeOnItem (where: byte; itmindex: integer; itmname: string);
    procedure SendHeroTakeOffItem(where: Byte; itmindex: Integer; itmname: string);
    procedure SendItemToHeroBag(where: Byte; itmindex: Integer; itmname: string); //ÁÖÀÎ > ¿µ¿õ °¡¹æÀ¸·Î
    procedure SendItemToMasterBag(where: Byte; itmindex: Integer; itmname: string); //¿µ¿õ > ÁÖÀÎ °¡¹æÀ¸·Î

    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;       //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    procedure ProcessMsg(wIdent: Word; sData: string);                      //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  end;
  TProgram = record                //¼öÁ¤µÇ¾ú½À´Ï´Ù.
    boGetStart: Boolean;
    boReStart: Boolean; //Program exception stop, whether to restart
    btStartStatus: Byte; //0,1,2,3 Does not start, is starting, has started, shutting down
    sProgramFile: string[50];
    sDirectory: string[100];
    ProcessInfo: TProcessInformation;
    ProcessHandle: THandle;
    MainFormHandle: THandle;
    nMainFormX: Integer;
    nMainFormY: Integer;
  end;
  function IsDebug():Boolean;
  function IsDebugA():Boolean;
  function  CheckMirProgram: Boolean;
  procedure PomiTextOut (dsurface: TDirectDrawSurface; x, y: integer; str: string);
  procedure ImageTextOut (dsurface: TDirectDrawSurface; x, y: integer; str: string);
  procedure WaitAndPass (msec: longword);
  function  GetRGB (c256: byte): integer;
  procedure DebugOutStr (msg: string);

  procedure LoadMacros;
  procedure SaveMacros;
  procedure CreateMacros;

  function RunProgram(var ProgramInfo: TProgram; sHandle: string; dwWaitTime: LongWord): LongWord;     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  function StopProgram(var ProgramInfo: TProgram; dwWaitTime: LongWord): Integer;                      //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  procedure SendProgramMsg(DesForm: THandle; wIdent: Word; sSendMsg: string);                          //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  function GetHardDiskSerial(const DriveLetter: Char): string;                                         //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  nLeft            :integer = 10;
  nTop             :integer = 10;
  nWidth           :integer;
  nHeight          :integer;
  g_boShowMemoLog  :Boolean = False;
  g_boShowRecog    :Integer = 0;
  frmMain          :TfrmMain;
  DScreen          :TDrawScreen;
  LoginScene       :TLoginScene;
  SelectChrScene   :TSelectChrScene;
//  LoadingScene     :TLoading;
//  LoginNoticeScene :TLoginNotice;
  PlayScene        :TPlayScene;
  LocalLanguage    :TImeMode = imSAlpha;  //ÇÑ±Û
  TestServerAddr   :String = '127.0.0.1';
  EventMan         :TClEventManager;
  KornetWorld      :TKornetWorld;
  Map              :TMap;
  BoOneClick       :Boolean;
  OneClickMode     :TOneClickMode;
  m_boPasswordIntputStatus:Boolean = False;
  CouplePower : Boolean;
  TabClickTime     : longword;
  ItemHintTime     : longword;
  SetHintTime     : longword;
  XClickTime     : longword;
  AngelFastDraw : Boolean; //¿ù·É

  SkillBarNum : integer;
  SkillBarView : integer;
  SkillKeyMode : integer;

  VerInfoStr1, VerInfoStr2, VerInfoStr3, VerInfoStr4 : String; //¹öÀü
  starttime: tdatetime; //°æ°ú½Ã°£
  StartTimeStr :String;
  t1:integer;

  LogInVer :String; //¹öÀü
  HourExp :Integer;
  gAutoRun : Boolean;
  UpItemItem: TClientItem;
  DelTempItem: TClientItem;

  EffectNum : integer;        //¸¶·æ¹ø°³

  SpeedHackUse: Boolean;
  // 2003/04/15 Ä£±¸, ÂÊÁö
  MailLists     : TList;       //¸Þ¸ð
  BlockLists    : TStringList;
  MailAlarm     : Boolean;      //¸Þ¸ð
  WantMailList  : Boolean;     //¸Þ¸ð
  WantBlockList  : Boolean;
  ConnectFriend : integer;
  ConnectBlack  : integer;
  NotReadMailCount : integer;      //¸Þ¸ð

  savefilepath: string;
  GameGuard: TProgram;                   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  g_dwStopTick: LongWord;                //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  g_dwStopTimeOut: LongWord = 10000;     //¼öÁ¤µÇ¾ú½À´Ï´Ù.


implementation

uses
  FState, FindMapPath, ShellAPI, FState2, MyCommon, MD5Unit;

{$R *.DFM}
var
  ShowMsgActor:TActor;

function  CheckMirProgram: Boolean;
var
   pstr: array[0..255] of char;
   mirapphandle: HWnd;
begin
   Result := FALSE;
   StrPCopy (pstr, 'ÁúµÄ´«Ëµ2');
   mirapphandle := FindWindow (nil, pstr);
   if (mirapphandle <> 0) and (mirapphandle <> Application.Handle) then begin
{$IFNDEF COMPILE}
      SetActiveWindow(mirapphandle);
      Result := TRUE;
{$ENDIF}
      exit;
   end;
end;

procedure PomiTextOut (dsurface: TDirectDrawSurface; x, y: integer; str: string);
var
   i, n: integer;
   d: TDirectDrawSurface;
begin
   for i:=1 to Length(str) do begin
      n := byte(str[i]) - byte('0');
      if n in [0..9] then begin
         d := g_WMainImages.Images[30 + n];
         if d <> nil then
            dsurface.Draw (x + i*8, y, d.ClientRect, d, TRUE);
      end else begin
         if str[i] = '-' then begin
            d := g_WMainImages.Images[40];
            if d <> nil then
               dsurface.Draw (x + i*8, y, d.ClientRect, d, TRUE);
         end;
      end;
   end;
end;


procedure ImageTextOut (dsurface: TDirectDrawSurface; x, y: integer; str: string);
var
   i, n: integer;
   d: TDirectDrawSurface;
begin
   for i:=1 to Length(str) do begin
      n := byte(str[i]) - byte('0');
      if n in [0..9] then begin
         d := g_WMain2Images.Images[900 + n];
         if d <> nil then
            dsurface.Draw (x + i*16, y, d.ClientRect, d, TRUE);
      end else begin
         if str[i] = ':' then begin
            d := g_WMain2Images.Images[910];
            if d <> nil then
               dsurface.Draw (x + i*17, y, d.ClientRect, d, TRUE);
         end;
      end;
   end;
end;

procedure LoadMacros;
var
  iniFile: TIniFile;
  iX: Integer;
begin
  try
    with FrmDlg.strlMacros do
    begin
      Clear;
      for iX := 0 to 7 do
        Add('');
    end;
  except
    //
  end;
  try
    if NOT FileExists('.\macros.ini') then
    begin
      CreateMacros;
    end;
    iniFile := TIniFile.Create('.\macros.ini');
    if iniFile <> nil then
    begin
      FrmDlg.strlMacros.Strings[0] := (inifile.ReadString('Macros','1','ÄúºÃ¡£'));
      FrmDlg.strlMacros.Strings[1] := (inifile.ReadString('Macros','2','ºÜ¸ßÐË¼ûµ½Äã¡£'));
      FrmDlg.strlMacros.Strings[2] := (inifile.ReadString('Macros','3','ÄãÏë¸øÎÒÒ»Æð´ò¹ÖÂð£¿'));
      FrmDlg.strlMacros.Strings[3] := (inifile.ReadString('Macros','4','Çë¸ú×ÅÎÒ¡£'));
      FrmDlg.strlMacros.Strings[4] := (inifile.ReadString('Macros','5','ÔÝÊ±ÐÝÏ¢Ò»ÏÂ°É¡£'));
      FrmDlg.strlMacros.Strings[5] := (inifile.ReadString('Macros','6','×£ÄãÓÎÏ·µÄÓä¿ì¡£'));
      FrmDlg.strlMacros.Strings[6] := (inifile.ReadString('Macros','7','ÔÙ¼û£¬Ò»Â·Ë³·ç¡£'));
      FrmDlg.strlMacros.Strings[7] := (inifile.ReadString('Macros','8','ÄãºÃ£¬ÏÂ´ÎÔÙ¼û¡£'));
      iniFile.Free;
    end;
  except
    {bad practice}
  end;
end;

procedure SaveMacros;
var
  iniFile: TIniFile;
begin
  try
    if NOT FileExists('.\macros.ini') then
    begin
      CreateMacros;
    end else
    begin
      iniFile := TIniFile.Create('.\macros.ini');
      if iniFile <> nil then
      begin
        inifile.WriteString('Macros','1',FrmDlg.strlMacros.Strings[0]);
        inifile.WriteString('Macros','2',FrmDlg.strlMacros.Strings[1]);
        inifile.WriteString('Macros','3',FrmDlg.strlMacros.Strings[2]);
        inifile.WriteString('Macros','4',FrmDlg.strlMacros.Strings[3]);
        inifile.WriteString('Macros','5',FrmDlg.strlMacros.Strings[4]);
        inifile.WriteString('Macros','6',FrmDlg.strlMacros.Strings[5]);
        inifile.WriteString('Macros','7',FrmDlg.strlMacros.Strings[6]);
        inifile.WriteString('Macros','8',FrmDlg.strlMacros.Strings[7]);
        iniFile.Free;
      end;
    end;
  except
    {bad practice}
  end;
end;

procedure CreateMacros;
var
  iniFile: TIniFile;
begin
    iniFile := TIniFile.Create('.\macros.ini');
    if iniFile <> nil then
    begin
      inifile.WriteString('Macros','1','ÄúºÃ¡£');
      inifile.WriteString('Macros','2','ºÜ¸ßÐË¼ûµ½Äã¡£');
      inifile.WriteString('Macros','3','ÄãÏë¸øÎÒÒ»Æð´ò¹ÖÂð£¿');
      inifile.WriteString('Macros','4','Çë¸ú×ÅÎÒ¡£');
      inifile.WriteString('Macros','5','ÔÝÊ±ÐÝÏ¢Ò»ÏÂ°É¡£');
      inifile.WriteString('Macros','6','×£ÄãÓÎÏ·µÄÓä¿ì¡£');
      inifile.WriteString('Macros','7','ÔÙ¼û£¬Ò»Â·Ë³·ç¡£');
      inifile.WriteString('Macros','8','ÄãºÃ£¬ÏÂ´ÎÔÙ¼û¡£');
      iniFile.Free;
    end;
end;

procedure WaitAndPass (msec: longword);
var
   start: longword;
begin
   start := GetTickCount;
   while GetTickCount - start < msec do begin
      Application.ProcessMessages;
   end;
end;

function GetRGB (c256: byte): integer;
begin
  with frmMain.DxDraw do begin
    Result:=RGB(DefColorTable[c256].rgbRed,
                DefColorTable[c256].rgbGreen,
                DefColorTable[c256].rgbBlue);
  end;
end;


procedure DebugOutStr (msg: string);
var
   flname: string;
   fhandle: TextFile;
begin
   //Exit;
   flname := '.\!debug.txt';
   if FileExists(flname) then begin
      AssignFile (fhandle, flname);
      Append (fhandle);
   end else begin
      AssignFile (fhandle, flname);
      Rewrite (fhandle);
   end;
   WriteLn (fhandle, DateTimeToStr(Now) + ' ' + msg);
   CloseFile (fhandle);

   //if (DScreen.CurrentScene = PlayScene) then
   //DScreen.AddChatBoardString(msg, clWhite, clBlack);
end;

function KeyboardHookProc (Code: Integer; WParam: Longint; var Msg: TMsg): Longint; stdcall;
begin
   Result:=0;
   if (WParam = 9) and (g_nLastHookKey = 18) and (GetTickCount - g_dwLastHookKeyTime < 500) then begin    //ALT+TAB ¾ËÆ®ÅÇ
      if FrmMain.WindowState <> wsMinimized then begin
         FrmMain.WindowState := wsMinimized;
      end else
         Result := CallNextHookEx(g_ToolMenuHook, Code, WParam, Longint(@Msg));
      exit;
   end;
   g_nLastHookKey := WParam;
   g_dwLastHookKeyTime := GetTickCount;

   Result := CallNextHookEx(g_ToolMenuHook, Code, WParam, Longint(@Msg));
end;


function GetdisplayDeepcolorX: integer; //µÃµ½ÏµÍ³·Ö±çÂÊX
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmPelsWidth;
end;

function GetdisplayDeepcolorY: integer; //µÃµ½ÏµÍ³·Ö±çÂÊy
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmPelsheight;
end;

function GetDisplayFrequency: Integer; //Ã¢¸ðµå
var
  DeviceMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);
  Result := DeviceMode.dmDisplayFrequency;
end;

function GetdisplayDeepcolor: integer; //µÃµ½ÏµÍ³É«Éî
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmBitsPerPel;
end;

procedure ChangeDisplayFrequency(iFrequency: Integer); //¸ü¸ÄË¢ÐÂÂÊ,ÔÚWin2000ÏÂ³É¹¦
var
  DeviceMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);
  DeviceMode.dmDisplayFrequency := Cardinal(iFrequency);
  devicemode.dmBitsPerPel := 16;
  ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure reChangeDisplayFrequency(); //¸Ä»ØÔ­ÓÐÏÔÊ¾ÉèÖÃ
var
  DeviceMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);
  DeviceMode.dmDisplayFrequency := Cardinal(frmmain.xtxx);
  devicemode.dmBitsPerPel := frmmain.xtxy;
  devicemode.dmPelsheight := frmmain.XTXTy;
  devicemode.dmPelswidth := frmmain.TXTXX;
  ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  flname: string;
  ini: TIniFile;
  PositionsX, PositionsY: Integer;
begin
  PositionsX := 0;
  PositionsY := 0;
  ini := TIniFile.Create('.\Mir2.ini');
   if ini <> nil then begin
      g_sServerAddr := ini.ReadString ('Setup', 'ServerAddr', g_sServerAddr);
      g_nServerPort := ini.ReadInteger ('Setup', 'ServerPort', g_nServerPort);
      LocalLanguage := imSAlpha;

      g_boWindowTest := False;
      g_boDisableFlip := ini.ReadBool ('Setup', 'DisableFlip', g_boDisableFlip);
      g_boFullScreen := ini.ReadBool ('Setup', 'FullScreen', g_boFullScreen);
      g_InterfaceMode := ini.ReadBool ('Option', 'InterfaceMode', g_InterfaceMode);
      g_BitCountMode := ini.ReadInteger ('Option', 'BitCountMode', g_BitCountMode);
      g_boFullScreen2 := ini.ReadBool ('Setup', 'FullScreen', g_boFullScreen2);
      g_FScreenMode := ini.ReadInteger ('Setup', 'ScreenMode', g_FScreenMode);
      g_FScreenMode2 := ini.ReadInteger ('Setup', 'ScreenMode', g_FScreenMode2);

      g_sCurFontName := ini.ReadString ('Setup', 'FontName', g_sCurFontName);
      PositionsX := ini.ReadInteger ('Positions', 'Left', PositionsX);
      PositionsY := ini.ReadInteger ('Positions', 'Top', PositionsY);


      g_boEffect := ini.ReadBool ('Option', 'ViewEffect', g_boEffect);
      g_boSound := ini.ReadBool ('Option', 'Sound', g_boSound);
      g_btSoundVolume := ini.ReadInteger ('Option', 'SoundVolume', g_btSoundVolume);
      g_boBGSound := ini.ReadBool ('Option', 'BMGSound', g_boBGSound);
      g_btMP3Volume := ini.ReadInteger ('Option', 'BGMVolume', g_btMP3Volume);

      g_boShowAllItem := ini.ReadBool ('Option', 'DropItemView', g_boShowAllItem);
      g_boNameAllView := ini.ReadBool ('Option', 'ViewAllName', g_boNameAllView);
      g_boNameChNpView := ini.ReadBool ('Option', 'ViewChNpName', g_boNameChNpView);
      g_boNameMonView := ini.ReadBool ('Option', 'ViewMonName', g_boNameMonView);
      g_boHPView := ini.ReadBool ('Option', 'ViewHPType', g_boHPView);
      g_boMarkMode := ini.ReadInteger ('Option', 'GuildMarkMode', g_boMarkMode);

      g_boShowHealth := ini.ReadBool ('Option', 'ShowHealth', g_boShowHealth);
      g_MoExpMsg := ini.ReadBool ('Option', 'ExpMsgMode', g_MoExpMsg);

      AuctionView := ini.ReadBool ('Option', 'AuctionView', AuctionView);
      //g_boShowGreenHint := ini.ReadBool ('Option', 'ShowHintScreen', g_boShowGreenHint);

      nHero1Index  := ini.ReadInteger ('Hero', 'Hero1Index', nHero1Index);
      nHero2Index  := ini.ReadInteger ('Hero', 'Hero2Index', nHero2Index);
      nHero1Percent := ini.ReadInteger ('Hero', 'Hero1Percent', nHero1Percent);
      nHero2Percent := ini.ReadInteger ('Hero', 'Hero2Percent', nHero2Percent);

      sPetOption := ini.ReadString('Pet', 'PetOption', sPetOption);
      PetOption(sPetOption);
      ini.Free;
   end;

   if g_BitCountMode = 0 then begin
     DxDraw.Display.BitCount := 16;
   end else begin
     DxDraw.Display.BitCount := 32;
   end;
   g_DWinMan:=TDWinManager.Create(Self);
   g_DXDraw:=DXDraw;
   Randomize;

   if PositionsX > 1280 then PositionsX := 500;
   if PositionsY > 720 then PositionsY := 200;

   ini := TIniFile.Create ('.\Auto.ini');
   if ini <> nil then begin
     g_boAutoLogin := ini.ReadBool ('Auto', 'AutoLogin', g_boAutoLogin);
   //  g_boAutoServer := ini.ReadBool ('Auto', 'AutoServer', g_boAutoServer);
     g_sAutoID := ini.ReadString ('Auto', 'AutoID', g_sAutoID);
     g_sAutoPass := ini.ReadString ('Auto', 'AutoPass', g_sAutoPass);
   //  g_sAutoServerName := ini.ReadString ('Auto', 'AutoServerName', g_sAutoServerName);
     ini.Free;
   end;

{$IF CLIENTTYPE = RMCLIENT}
//    g_sLogoText:=RMCLIENTTITLE;
{$IFEND}

   Caption:=DecodeString(DecodeString(RMCLIENTTITLE));
   if g_boFullScreen then begin
  //   StoreWindow;
   //  DXDraw.Cursor := crNone;
     frmMain.BorderStyle := bsNone;
     DXDraw.Options := DXDraw.Options + [doFullScreen];
   end else begin
  //   RestoreWindow;
  //   DXDraw.Cursor := crDefault;
     if g_BitCountMode = 0 then begin
       xtxx := GetDisplayFrequency; //Ã¢¸ðµå
       xtxy := GetdisplayDeepcolor; //É«Éî
       frmmain.XTXTy := GetdisplayDeepcolorY; //768
       frmmain.TXTXX := getdisplaydeepcolorX; //1024
       if xtxy <> 16 then begin
         ChangeDisplayFrequency(xtxx); //Ã¢¸ðµå
       end;
     end;
     frmMain.Align:=alNone;
     frmMain.BorderStyle := bsSingle;
     frmMain.Position := poMainFormCenter;
     DXDraw.Options := DXDraw.Options - [doFullScreen];
     frmMain.Left := PositionsX;
     frmMain.Top := PositionsY;
   end;

   case g_FScreenMode of
    1:
      begin
        g_FScreenWidth := DEFMAXSCREENWIDTH;
        g_FScreenHeight := DEFMAXSCREENHEIGHT;
      end;
    else
      begin
        g_FScreenWidth := DEFSCREENWIDTH;
        g_FScreenHeight := DEFSCREENHEIGHT;
      end;
  end;

   LoadWMImagesLib(nil);
   NpcImageList:=TList.Create;
   ItemImageList:=TList.Create;
   WeaponImageList:=TList.Create;
   HumImageList:=TList.Create;
   g_DXSound:=TDXSound.Create(Self);
   g_DXSound.Initialize;
   DXDraw.Display.Width:=g_FScreenWidth;
   DXDraw.Display.Height:=g_FScreenHeight;


   //»ç¿îµå °ü·Ã ÃÊ±âÈ­
  if g_DXSound.Initialized then begin
    g_Sound:= TSoundEngine.Create (g_DXSound.DSound);
    g_Sound.Volume := g_btSoundVolume;
  end else begin
    g_Sound:= nil;
  end;
  LoadDecoList();

   g_ToolMenuHook := SetWindowsHookEx(WH_KEYBOARD, @KeyboardHookProc, 0, GetCurrentThreadID);

   g_SoundList := TStringList.Create;
   flname := '.\wav\mirsound.lst';
   LoadSoundList (flname);

   DScreen := TDrawScreen.Create;
   LoginScene := TLoginScene.Create;
   SelectChrScene := TSelectChrScene.Create;

   g_FriendList := TStringList.Create; //»õ·Î¿îÄ£±¸
   g_MyBlacklist := TStringList.Create;
   PlayScene := TPlayScene.Create;
   Map              := TMap.Create;
   g_nMiniMapPath := nil;
   g_DropedItemList := TList.Create;
   g_MagicList        := TList.Create;

   g_HeroMagicList := TList.Create;

   EventMan := TClEventManager.Create;
   g_ChangeFaceReadyList := TList.Create;
   g_ServerList:=TStringList.Create;

   g_AutoPickupList :=TList.Create;
   g_ShowItemList   :=TGList.Create;

   g_BuffList := TList.create;     //¹öÇÁ
   g_HeroBuffList      := TList.create;     //¹öÇÁ
   g_CoolBuffList := TList.create;     //ÄðÅ¸ÀÓ¹öÇÁ
   g_AucList := TList.create;  //°æ¸Å
   m_CoolTimeMSG      := TStringList.Create;

   //È¯»óÁ¡
   g_ShopItemesp        := TList.Create;
   g_GiftsItemlist      := TList.Create;
   g_GiftsItemType      := TList.Create;

   g_MapDescList := TList.Create;
   g_CompoundInfoList := TGStringList.Create;
   ZeroMemory(@g_CompoundSet, SizeOf(TCompoundSet));
   
   g_boAllLoadStream := False;

   g_MissionDateStream := TMemoryStream.Create;
   g_MapDescDateStream := TMemoryStream.Create;
   Try
     g_MissionDateStream.LoadFromFile(GETMISSIONDESCFILE);
   Except
   End;
   Try
     g_MapDescDateStream.LoadFromFile(GETMAPDESCFILE);
   Except
   End;

   g_MySelf := nil;
   g_MyHero := nil;
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);   //¾ÆÀÌÅÛ °¹¼ö
   FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);

   FillChar(g_AutoPotItems, SizeOf(TClientItem) * 2, #0);
   FillChar(g_HeroUseItems, SizeOf(TClientItem) * MAXHEROUSEITEM, #0);
   FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
   MoveingItemIndex := -1;
   FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_DealItems, sizeof(TClientItem)*10, #0);             //°Å·¡
   FillChar (g_DealRemoteItems, sizeof(TClientItem)*20, #0);       //°Å·¡

   FillChar(HeroArr, SizeOf(TSelHero) * 4, #0);

   FillChar (g_RentalItems, sizeof(TClientItem), #0);             //´ë¿©
   FillChar (g_RentalRemoteItems, sizeof(TClientItem), #0);       //´ë¿©

   FillChar (G_BuyItem, sizeof(SBuyItem)*MAXBUYITEM, #0);     //»óÀÎ
   FillChar (G_UpWaponItem, sizeof(TClientItem)*16, #0);     //Àç·Ã
   FillChar (g_StoreItems, SizeOf(TStoreItem) * 15, #0);          //°³ÀÎ»óÁ¡
   FillChar (g_StoreRemoteItems, SizeOf(TStoreItem) * 15, #0);     //°³ÀÎ»óÁ¡

   g_SaveItemList := TList.Create;
   g_MenuItemList := TList.Create;
   g_WaitingUseItem.Item.S.Name := '';
   g_EatingItem.S.Name := '';
   g_HeroEatingItem.S.Name := '';

   g_SayUpDownLock := False;
   g_SayMode := usm_Hear;
   SafeFillChar(g_SayEffectIndex, SizeOf(g_SayEffectIndex), False);
   g_nTargetX := -1;
   g_nTargetY := -1;
   g_TargetCret := nil;
   g_FocusCret := nil;
   g_FocusItem := nil;
   g_MagicTarget := nil;

   g_nTestSendCount := 0;
   g_nTestReceiveCount := 0;
   g_boServerChanging := FALSE;
   g_boBagLoaded := FALSE;
   g_boOptionLoaded := FALSE;

   g_boAutoDig := FALSE;

   g_dwLatestClientTime2 := 0;
   g_dwFirstClientTime := 0;
   g_dwFirstServerTime := 0;
   g_dwFirstClientTimerTime := 0;
   g_dwLatestClientTimerTime := 0;
   g_dwFirstClientGetTime := 0;
   g_dwLatestClientGetTime := 0;

   g_nTimeFakeDetectCount := 0;
   g_nTimeFakeDetectTimer := 0;
   g_nTimeFakeDetectSum := 0;

   g_dwSHGetTime := 0;
   g_dwSHTimerTime := 0;
   g_nSHFakeCount := 0;
   SHHitSpeedCount := 0;

   g_nDayBright := 3;
   g_nAreaStateValue := 0;
   g_ConnectionStep := cnsLogin;
   g_boSendLogin:=False;
   g_boServerConnected := FALSE;
   g_boViewFog := True; //¹ã³·¼³Á¤
   DarkLevel := 0;     //¹ã³·¼³Á¤
   SocStr := '';
   ActionFailLock := FALSE;
   //g_boMapMoving := FALSE;
   g_boMapMovingWait := FALSE;

   g_boCheckSpeedHackDisplay := FALSE;
   g_boViewMiniMap := FALSE;

   //¿µ¹° ÁÝ±â ¿É¼Ç
   g_boItemAuto       := 1;
   g_boItemAll        := 1;
   g_boItemGold       := 0;
   g_boItemWeapon     := 0;
   g_boItemDress      := 0;
   g_boItemHelmet     := 0;
   g_boItemBoots      := 0;
   g_boItemBelt       := 0;
   g_boItemAccessory  := 0;
   g_boItemEtc        := 0;

   FailDir := 0;
   FailAction := 0;
   g_nDupSelection := 0;

   g_dwLastAttackTick := GetTickCount;
   g_dwLastHeroMoveTick := GetTickCount;
   g_dwLastHeroTurnTick := GetTickCount;
   g_dwLastMoveTick := GetTickCount;
   g_dwLatestSpellTick := GetTickCount;
   g_dwLatestSpellTick2 := 0;

   g_dwAutoPickupTick := GetTickCount;
   g_boFirstTime := TRUE;
   g_boFirstTime2 := TRUE;
   g_boFirstTime3 := TRUE;
   g_boItemMoving := FALSE;
   g_boDoFadeIn := FALSE;
   g_boDoFadeOut := FALSE;
   g_boDoFastFadeOut := FALSE;
   g_boAttackSlow := FALSE;
   g_boMoveSlow := FALSE;
   g_boMoveSlow2 := FALSE;
   //BoStopAfterAttack := FALSE;
   g_boNextTimePowerHit := FALSE;
   g_boCanLongHit := FALSE;
   g_boCanTaguHit := FALSE;
   g_boCanWideHit := FALSE;
   g_boCanCrsHit   := False;
   g_boCanTwnHit   := False;
   g_boCanNanCrsHit := False;
   g_boCanThwnHit  := False;
   g_boFireShHit   := False;
   g_boCanWBHit   := FALSE;  //Ç³°Ë¼ú
   g_boCanCrsBHit := FALSE;

   AngelFastDraw := TRUE;       //¿ù·É
   CouplePower := False;

   g_boSnow:= False;
   g_boFlower:= False;
   g_nSnowLev := 0;

   g_QuestMsgList := TList.Create;

   LoverMacro.Enabled:= False;

   g_boNextTimeFireHit := FALSE;
   g_boNextTimeDeathHit := FALSE;

   g_boNoDarkness := FALSE;
   g_SoftClosed := FALSE;
   g_boQueryPrice := FALSE;
   g_sSellPriceStr := '';

   nAucItemIndex := 0;
   g_sDisassemblePriceStr := '';

   g_sItemWakeUpPriceStr := 0;  //°¢¼º
   g_sDismantlePriceStr := '';

   GetFileCVersion(ParamStr(0), @g_FileVersionInfo);

   g_boItemHint := False;
   g_boSetHint  := False;
  // g_bobuttHint := False;

   t1:=0; //°æ°ú½Ã°£

   LogInVer := ''; //¹öÀü
   HourExp:=0;

   g_boAllowGroup := FALSE;    //±×·ì
   g_boCheckGroup := TRUE;
   g_boCheckHero := FALSE;
   g_GroupItemMode := FALSE;
   g_boHeroAiMode := 0;

   //g_boMsgDlgTimeCheck := False;  //±×·ì
   g_MemberGroup := TList.Create;
   GroupIdList  := TList.Create;
   MainWinHandle := DxDraw.Handle;

   BoOneClick := False;
   OneClickMode := toNone;

   g_boAttSound := False;
   //g_boSound:=True;
  // g_boBGSound:=True;

   g_HumRunDress := False;
   g_MaskRun := False;
   g_boDropDrug := False;

   g_ShopSort := False;
   g_ShopSortMode := 0;
   g_BoPetOn := False;
   g_boDrugOn := False;
   g_CheckPetDB := True;    //¿µ¹° db
   g_FishingOk := False;       //³¬½Ã Áß È®ÀÎ
   m_boWakeUp := False;
   g_AutoRate := False;
   g_AutoRateIn := 0;
   g_boFishCatch := False;   //³¬½Ã ÅÛ ¾ò´Â..
   g_CheckEsc := False;      //Esc Å°·Î ³¬½Ã Á¾·á ÇÒ°ÇÁö
   g_AutoFish := False;
   g_FishTime := 0;
   g_FishTiming := 0;      //³¬À» Å×ÀÌ¹Ö
   g_AutoFishTick := GetTickCount;

   g_KeyDownTick := GetTickCount;
   g_boHeroProtect := False;
   g_TigerSet := False; //Å»°Í

   g_LegendMap := TLegendMap.Create;

   // 2003/04/15 Ä£±¸, ÂÊÁö
   MailLists     := TList.Create;         //¸Þ¸ð
   BlockLists    := TStringList.Create;
   MailAlarm     := false;               //¸Þ¸ð
   WantMailList  := false;              //¸Þ¸ð
   WantBlockList  := false;

   fLover := TRelationShipMgr.Create;        //¿¬ÀÎ ½ºÃÄ
   fMentor := TMentorShipMgr.Create;  //»çÁ¦ ½ºÃÄ

   g_ItemWakeUpList := TStringList.Create;
   g_ItemDescList := TGStringList.Create;
   g_MagicDescList := TGStringList.Create;
   g_ExtractStringList := TStringList.Create;

   g_SetItemsList := TList.Create;

   g_CheckMacro := False;

   SkillBarNum := 1;
   SkillBarView := 0;
   SkillKeyMode := 1;

   gAutoRun := False;

   RunEffectTimer := TTimer.Create (self); //¸¶·æ¹ø°³
   RunEffectTimer.Interval := 400;
   RunEffectTimer.Enabled := False;
   RunEffectTimer.OnTimer := RunEffectTimerTimer;
   RunEffectTimer.Tag := 555;

   EffectNum := 0; //¸¶·æ¹ø°³

   SpeedHackUse := False;

   if g_sMainParam1 = '' then begin
     CSocket.Address:=g_sServerAddr;
     CSocket.Port:=g_nServerPort;
   end else begin
      if (g_sMainParam1 <> '') and (g_sMainParam2 = '') then
         CSocket.Address := g_sMainParam1;
      if (g_sMainParam2 <> '') and (g_sMainParam3 = '') then begin
         CSocket.Address := g_sMainParam1;
         CSocket.Port := Str_ToInt (g_sMainParam2, 0);
      end;
      if (g_sMainParam3 <> '') then begin
         if CompareText (g_sMainParam1, '/KWG') = 0 then begin

         end else begin
            CSocket.Address := g_sMainParam2;
            CSocket.Port := Str_ToInt (g_sMainParam3, 0);
            BoOneClick := TRUE;
         end;
      end;
   end;
   if BO_FOR_TEST then
      CSocket.Address := TestServerAddr;



   CSocket.Active:=True;

   //DebugOutStr ('----------------------- started ------------------------');

   Application.OnException := OnProgramException;
   Application.OnIdle := AppOnIdle;
   StartGame();      //¼öÁ¤µÇ¾ú½À´Ï´Ù.
end;

procedure TfrmMain.OnProgramException (Sender: TObject; E: Exception);
begin
   DebugOutStr (E.Message);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
  procedure KillProcess(Const ProcName: String);            //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  var
   Process32: TProcessEntry32;
   SHandle:   THandle;  // the handle of the Windows object
   Next:      BOOL;
   ProcId   : DWORD;
  begin
    Process32.dwSize := SizeOf(TProcessEntry32);                           //ÀÚ·á¸¦ ¹ÞÀ» º¯¼ö Å©±â ¼³Á¤
    SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);   //ÇîµéÀ» ±¸ÇÔ

    if Process32First(SHandle, Process32) then     //°¡Àå Ã³À½ÀÇ ÇÁ·Î¼¼½ºÁ¤º¸¸¦ ¾ò´Â´Ù.
    begin

      repeat
        Next := Process32Next(SHandle, Process32);                //´ÙÀ½ ÇÁ·Î¼¼½º Á¤º¸¸¦ ¾ò´Â´Ù.
        if Next then                                              //ÀÌÇÏ À§¿Í µ¿ÀÏ
        begin
          GetWindowThreadProcessID( SHandle, @ProcId);
          if Process32.szExeFile = ProcName then begin
            ProcId := DWORD(Process32.th32ProcessID);
            SHandle := OpenProcess(PROCESS_ALL_ACCESS, True, ProcId);
            TerminateProcess(SHandle , 0);
          end;
        end;
      until not Next;
    end;

    CloseHandle(SHandle);
  end;
var
  I: Integer;
begin
  KillProcess(DecodeString_3des('7Wvy21rJMPboBb7gMA==', '56m2VipGate'));   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
  g_boClose := True;
  ClearShowItemList();
  FreeAndNil(g_ShowItemList);
  FreeAndNil(g_AutoPickupList);
   if g_ToolMenuHook <> 0 then UnhookWindowsHookEx(g_ToolMenuHook);
   Timer1.Enabled := FALSE;
   Timer2.Enabled := FALSE;
   Timer4Module.Enabled := FALSE;
   Timer5Process.Enabled := FALSE;
   UnLoadWMImagesLib();

   ClearMapDescList;

   for I := 0 to NpcImageList.Count - 1 do begin
     TWMImages(NpcImageList.Items[I]).Finalize;
   end;
   for I := 0 to ItemImageList.Count - 1 do begin
     TWMImages(ItemImageList.Items[I]).Finalize;
   end;
   for I := 0 to WeaponImageList.Count - 1 do begin
     TWMImages(WeaponImageList.Items[I]).Finalize;
   end;
   for I := 0 to HumImageList.Count - 1 do begin
     TWMImages(HumImageList.Items[I]).Finalize;
   end;

   DScreen.Finalize;
   PlayScene.Finalize;
   DScreen.Free;
   LoginScene.Free;
   SelectChrScene.Free;
   PlayScene.Free;
   FreeAndNil(g_SaveItemList);
   FreeAndNil(g_MenuItemList);
   for I := 0 to g_SetItemsList.Count - 1 do
    Dispose(pTSetItems(g_SetItemsList[I]));
   FreeAndNil(g_SetItemsList);

   FreeAndNil(g_FriendList);     //»õ·Î¿îÄ£±¸
   FreeAndNil(g_MyBlacklist);
   //È¯»óÁ¡

   g_MapDescList.Free;

   for i := 0 to g_CompoundInfoList.Count - 1 do
    Dispose(pTCompoundInfos(g_CompoundInfoList.Objects[i]));
   FreeAndNil(g_CompoundInfoList);

   g_ShopItemesp.Free;
   g_GiftsItemlist.Free;
   g_GiftsItemType.Free;

   g_LegendMap.Free;
   g_QuestMsgList.Free;

   //DebugOutStr ('----------------------- closed -------------------------');
   Map.Free;
   g_DropedItemList.Free;
   g_MagicList.Free;

   for I := 0 to g_HeroMagicList.Count - 1 do begin
     Dispose(PTClientMagic(g_HeroMagicList[I]));
   end;
   g_HeroMagicList.Free;

   g_ChangeFaceReadyList.Free;

   g_BuffList.free;         //¹öÇÁ
   g_HeroBuffList.free;
   g_AucList.free;     //°æ¸Å

   g_CoolBuffList.free;            //ÄðÅ¸ÀÓ¹öÇÁ


   fLover.Free;          //¿¬ÀÎ ½ºÃÄ
   fMentor.Free;       //»çÁ¦ ½ºÃÄ

   m_CoolTimeMSG.Free;

   g_ServerList.Free;

   g_Sound.Free;
   g_SoundList.Free;
   EventMan.Free;
   NpcImageList.Free;
   ItemImageList.Free;
   WeaponImageList.Free;
   HumImageList.Free;

   MailLists.Free;
   BlockLists.Free;

   g_MemberGroup.Free;
   GroupIdList.Free;
   g_ItemWakeUpList.Free;
   g_ExtractStringList.Free;

   ClearMissionList();
   g_DecoList.Free;
   
   UnLoadItemDescList;
   UnLoadMagicDescList;

   if RunEffectTimer  <> nil then RunEffectTimer.Free;         //¸¶·æ¹ø°³

   g_DXSound.Free;
   g_DWinMan.Free;

   BASS_StreamFree(MusicHS);
   BASS_Free;
   if g_BitCountMode = 0 then
     reChangeDisplayFrequency();
end;

function ComposeColor(Dest, Src: TRGBQuad; Percent: Integer): TRGBQuad;
begin
  with Result do
  begin
    rgbRed := Src.rgbRed+((Dest.rgbRed-Src.rgbRed)*Percent div 256);
    rgbGreen := Src.rgbGreen+((Dest.rgbGreen-Src.rgbGreen)*Percent div 256);
    rgbBlue := Src.rgbBlue+((Dest.rgbBlue-Src.rgbBlue)*Percent div 256);
    rgbReserved := 0;
  end;
end;

procedure TfrmMain.DXDrawInitialize(Sender: TObject);
  procedure RefLoginWin(Len: Integer);
  var
    d: TDirectDrawSurface;
  begin
    DxDraw.Surface.Fill(0);
    with DxDraw.Surface.Canvas do begin
      d := g_WNewLoginImages.Images[697];
      if d <> nil then
        DXDraw.Surface.Draw((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, FALSE);
      d := g_WMainImages.Images[88];
      if d <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 114, 12, d.ClientRect, d, TRUE);
      end;
      d := g_WMainImages.Images[87];
      if d <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 222, 12, d.ClientRect, d, TRUE);
      end;
      d := g_WMainImages.Images[89];
      if d <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 330, 12, d.ClientRect, d, TRUE);
      end;


      {d := g_WMain2Images.Images[424];
      if d <> nil then
        DXDraw.Surface.Draw(249, 457 + 60, d.ClientRect, d, True);
      d := g_WMain2Images.Images[423];
      if d <> nil then begin
        rc := d.ClientRect;
        rc.Right := Trunc(d.Width * (len / 100));
        DXDraw.Surface.Draw(249, 457 + 60, rc, d, True);
      end;  }
    end;
    DxDraw.Flip;
  end;
begin
   if g_boFirstTime then begin
      g_boFirstTime := FALSE;

      DxDraw.SurfaceWidth := g_FScreenWidth;
      DxDraw.SurfaceHeight := g_FScreenHeight;
(*
{$IF USECURSOR = DEFAULTCURSOR}
      DxDraw.Cursor:=crHourGlass;
{$ELSE}
      DxDraw.Cursor:=crNone;
{$IFEND}    *)

      DxDraw.Surface.Canvas.Font.Assign (FrmMain.Font);

      FrmMain.Font.Name := g_sCurFontName;
      FrmMain.Canvas.Font.Name := g_sCurFontName;
      DxDraw.Surface.Canvas.Font.Name := g_sCurFontName;
      PlayScene.EdChat.Font.Name := g_sCurFontName;

      Refresh;
      InitWMImagesLib(DxDraw);

      RefLoginWin(10);

      DxDraw.DefColorTable := g_WMainImages.MainPalette;
      DxDraw.ColorTable := DxDraw.DefColorTable;
      DxDraw.UpdatePalette;
      RefLoginWin(30);

      //256 Blend utility
      if not LoadNearestIndex (NEARESTPALETTEINDEXFILE) then begin
         BuildNearestIndex (DxDraw.ColorTable);
         SaveNearestIndex (NEARESTPALETTEINDEXFILE);
      end;
      RefLoginWin(40);
      BuildColorLevels (DxDraw.ColorTable);
      RefLoginWin(50);
      DScreen.Initialize;
      RefLoginWin(60);
      PlayScene.Initialize;
      RefLoginWin(70);
      FrmDlg.Initialize;
      FrmDlg2.Initialize;
      LoadMacros;
      FrmDlg.InitializeEx;
      RefLoginWin(90);
      g_ImgMixSurface := TDirectDrawSurface.Create (frmMain.DxDraw.DDraw);
      g_ImgMixSurface.SystemMemory := TRUE;
      g_ImgMixSurface.SetSize(800, 700);

      ImgLargeMixSurface := TDirectDrawSurface.Create (FrmMain.DXDraw.DDraw);
      ImgLargeMixSurface.SystemMemory := TRUE;
      ImgLargeMixSurface.SetSize (800, 700);

      RefLoginWin(100);

   end else begin
      DXDraw.Display.Width := g_FScreenWidth;
      DXDraw.Display.Height := g_FScreenHeight;
      DXDraw.SurfaceWidth := g_FScreenWidth;
      DXDraw.SurfaceHeight := g_FScreenHeight;
      g_boNoDarkness := TRUE;
      g_boUseDIBSurface := True;
      if doFullScreen in DxDraw.Options then begin   //g_boFullScreen
      //  BorderIcons := [];
        WindowState := wsMaximized;
        if g_BitCountMode = 0 then begin
          DxDraw.Display.BitCount := 16;
        end else begin
          DxDraw.Display.BitCount := 32;
        end;
      end else begin
        WindowState := wsNormal;
     //   BorderIcons := [biSystemMenu, biMinimize];
        Self.ClientWidth := g_FScreenWidth;
        Self.ClientHeight := g_FScreenHeight;
        Self.Left := Round((Screen.Width - Self.Width) / 2);
        Self.Top := Round((Screen.Height - Self.Height) / 2);
      end;
      Self.Font.Name := g_sCurFontName;
      Self.Canvas.Font.Name := g_sCurFontName;
      DXDraw.Surface.Canvas.Font.Assign(frmMain.Font);
      DXDraw.Surface.Canvas.Font.Name := g_sCurFontName;
   end;
   g_boCanDraw := True;
end;

procedure TfrmMain.DXDrawFinalize(Sender: TObject);
begin
  if g_boClose then Exit;
  g_boCanDraw := False;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TIniFile;
begin
   ini := TIniFile.Create('.\Mir2.ini');
   if ini <> nil then begin
     if not g_boFullScreen then begin
       ini.WriteInteger ('Positions', 'Left', frmMain.Left);
       ini.WriteInteger ('Positions', 'Top', frmMain.Top);
     end;
     ini.WriteBool ('Setup', 'FullScreen', g_boFullScreen2);
     ini.WriteInteger ('Setup', 'ScreenMode', g_FScreenMode2);
     ini.WriteBool ('Option', 'Sound', g_boSound);
     ini.WriteInteger ('Option', 'SoundVolume', g_btSoundVolume);
     ini.WriteBool ('Option', 'BMGSound', g_boBGSound);
     ini.WriteInteger ('Option', 'BGMVolume', g_btMP3Volume);
     ini.WriteBool ('Option', 'InterfaceMode', g_InterfaceMode);
     ini.WriteInteger ('Option', 'BitCountMode', g_BitCountMode);
    // ini.WriteBool ('Option', 'ShowHintScreen', g_boShowGreenHint);
     ini.Free;
   end;
   if g_boBagLoaded then
     Savebags (CharName + '.itm', @g_ItemArr);
   g_boBagLoaded := FALSE;
   SaveIDInfo(CharName);
   ClearBGMEx;

   if g_boAllLoadStream then begin
     Try
       g_MissionDateStream.SaveToFile(GETMISSIONDESCFILE);
     Except
     End;
     Try
       g_MapDescDateStream.SaveToFile(GETMAPDESCFILE);
     Except
     End;
   end;
   application.Terminate;
end;

{------------------------------------------------------------}

procedure TfrmMain.ProcOnIdle;
var
   done: Boolean;
begin
   AppOnIdle (self, done);
   //DXTimerTimer (self, 0);
end;

procedure TfrmMain.AppOnIdle (Sender: TObject; var Done: Boolean);
var
   p: TPoint;
   d,e: TDirectDrawSurface;
begin
   Done := TRUE;
   if not DXDraw.CanDraw then Exit;
   if MusicHS >= BASS_ERROR_ENDED then begin
    if (WindowState <> wsMinimized) and g_boCanDraw {and (not boSizeMove)} then begin
      if BASS_ChannelIsActive(MusicHS) = BASS_ACTIVE_PAUSED then begin
        ChangeBGMState(bgmPlay);
      end;
    end
    else begin
      if BASS_ChannelIsActive(MusicHS) = BASS_ACTIVE_PLAYING then begin
        ChangeBGMState(bgmPause);
      end;
    end;
   end;

 //  if GetTickCount - DXRETime > 4 then  begin
   ProcessKeyMessages;
   ProcessActionMessages;
   DScreen.DrawScreen (DxDraw.Surface);
 //  if not DXDraw.CanDraw then Exit;
   if g_boShowAllItem then begin  //¶³¾îÁø ¾ÆÀÌÅÛ ÀÌ¸§º¸±â ¹Ù´Ú
      if TabClickTime + 4000 > GetTickCount then begin    //3ÃÊ
         PlayScene.DropItemsShow
      end;
   end;
   if g_boItemHint and (ItemHintTime + 3000 > GetTickCount) then begin
   end else begin
     g_boItemHint := False;
   end;
   if g_boSetHint and (SetHintTime + 3000 > GetTickCount) then begin
   end else begin
     g_boSetHint := False;
   end;

   DScreen.DrawScreenCool(DxDraw.Surface); //¸®ÄÝ
   g_DWinMan.DirectPaint (DxDraw.Surface);
   DScreen.DrawScreenTopGm (DxDraw.Surface);     //°øÁö
   DScreen.DrawScreenOldTop (DxDraw.Surface);
   DScreen.DrawScreenTop (DxDraw.Surface);     //¾ÆÀÌÅÛ È¹µæ
   DScreen.DrawHintB (DxDraw.Surface);
   DScreen.DrawHint (DxDraw.Surface);
   DScreen.newDrawHint (DxDraw.Surface);
   DScreen.newDrawHint2 (DxDraw.Surface);

   if g_boItemMoving then begin
      if (g_MovingItem.Item.S.Name <> g_sGoldName) and (g_MovingItem.Item.S.Name <> g_sGameGoldName) then
         d := g_WBagItemImages.Images[g_MovingItem.Item.S.Looks]
      else d := g_WBagItemImages.Images[115];
      if d <> nil then begin
         GetCursorPos (p);
         p := ScreenToClient(p);
         DxDraw.Surface.Draw (p.x-(d.ClientRect.Right div 2) + 4,
                              p.y-(d.ClientRect.Bottom div 2) + 4,
                              d.ClientRect,
                              d,
                              TRUE);
        if (g_MovingItem.Item.Amount > 0) and (g_MovingItem.Item.S.StdMode in [0,1,3,45,46]) then begin   //¹°¾à
          if (g_MovingItem.Item.S.Name <> g_sGoldName) and (g_MovingItem.Item.S.Name <> g_sGameGoldName) then begin
             SetBkMode (DxDraw.Surface.Canvas.Handle, TRANSPARENT);
             DxDraw.Surface.Canvas.Font.Color := clYellow;
             DxDraw.Surface.Canvas.TextOut(p.x-(d.ClientRect.Right div 2)+ 22, p.y-(d.ClientRect.Bottom div 2) + 24 , IntToStr(g_MovingItem.Item.Amount));
             DxDraw.Surface.Canvas.Font.Color := clWhite;
             DxDraw.Surface.Canvas.Release;
          end;
        end;                
      end;
   end;

   if g_boShowFormImage then begin          //½çÃæËµÃ÷Í¼Æ¬
   if g_MySelf.m_Abil.level < 2 then   begin
     if g_FScreenWidth = 800 then begin
       d := g_WAresImages.Images[300];
       e := g_WAresImages.Images[302];
       if d <> nil then begin
         DrawBlendEx (DxDraw.Surface, (g_FScreenWidth - e.Width) div 2, (g_FScreenHeight - e.Height) div 2, e, 0, 0, e.Width, e.Height, 0);
         DxDraw.Surface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, TRUE);
       end else
         g_boShowFormImage := False;
     end else begin
       d := g_WAresImages.Images[301];
       e := g_WAresImages.Images[303];
       if d <> nil then begin
         DrawBlendEx (DxDraw.Surface, (g_FScreenWidth - e.Width) div 2, (g_FScreenHeight - e.Height) div 2, e, 0, 0, e.Width, e.Height, 0);
         DxDraw.Surface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, TRUE);
       end else
         g_boShowFormImage := False;
     end;
   end;
   end;

   if g_boDoFadeOut then begin
      if g_nFadeIndex < 1 then g_nFadeIndex := 1;
      MakeDark (DxDraw.Surface, g_nFadeIndex);
      if g_nFadeIndex <= 1 then g_boDoFadeOut := FALSE
      else Dec (g_nFadeIndex, 2);
   end else
   if g_boDoFadeIn then begin
      if g_nFadeIndex > 29 then g_nFadeIndex := 29;
      MakeDark (DxDraw.Surface, g_nFadeIndex);
      if g_nFadeIndex >= 29 then g_boDoFadeIn := FALSE
      else Inc (g_nFadeIndex, 2);
   end else
   if g_boDoFastFadeOut then begin
      if g_nFadeIndex < 1 then g_nFadeIndex := 1;
      MakeDark (DxDraw.Surface, g_nFadeIndex);
      if g_nFadeIndex > 1 then Dec (g_nFadeIndex, 4);
   end;

   //·Î±×ÀÎÈ­¸é À§ÂÊ ·Î±× (12¼¼ÀÌ¿ë°¡)
   if (g_ConnectionStep = cnsLogin) and LoginImages then begin
     with DxDraw.Surface.Canvas do begin
      d := g_WMainImages.Images[88];
      if d <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 114, 12, d.ClientRect, d, TRUE);
      end;
      e := g_WMainImages.Images[87];
      if d <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 222, 12, e.ClientRect, e, TRUE);
      end;
      e := g_WMainImages.Images[89];
      if e <> nil then begin
         DxDraw.Surface.Draw (g_FScreenWidth - 330, 12, e.ClientRect, e, TRUE);
      end;
     end;
   end;

 //  FClientRect:=FrmMain.ClientRect;
 //  windows.ClientToScreen(FrmMain.Handle, FClientRect.TopLeft);
   if g_boFullScreen then
     DxDraw.Primary.Draw (0, 0, DxDraw.Surface.ClientRect, DxDraw.Surface, FALSE)
   else
     DxDraw.Flip;
 //   DXRETime := GetTickCount;
//  end;
end;

procedure TfrmMain.AppLogout;
begin
  if (g_FishingOk = False) and (FrmDlg.DDiceGame.Visible = FALSE) then begin
   if mrOk = FrmDlg.DSimpleMessageDlg2 ('ÄãÈ·¶¨Òª·µ»Ø½ÇÉ«Ñ¡Ôñ½çÃæÂð£¿', [mbOk, mbCancel]) then begin
      SendClientMessage (CM_SOFTCLOSE, 0, 0, 0, 0);
      CloseAllWindows;
      CloseAllWindows2;

      if not BoOneClick then begin
         g_SoftClosed := TRUE;
         ActiveCmdTimer (tcSoftClose);
      end else begin
         ActiveCmdTimer (tcReSelConnect);
      end;

      if g_boBagLoaded then
        Savebags (CharName + '.itm', @g_ItemArr);
      g_boBagLoaded := FALSE;
      SaveIDInfo(CharName);
   end;
  end;
end;

procedure TfrmMain.AppLogout2;     //Á×À¸¸é ¸¶À»·Î ºÎÈ°
begin
   if mrOk = FrmDlg.DSimpleMessageDlg2 ('Äã½«¸´»îÔÚÄã×îºóÍ£ÁôµÄ´å×¯£¡\ÄãÈ·¶¨ÒªÔÚ×îºóÍ£ÁôµÄ´å×¯¸´»îÂð£¿', [mbOk, mbCancel]) then begin
        FrmMain.SendSay ('@REALIVEHOME');
   end;
end;

procedure TfrmMain.AppExit;
begin
  if (g_FishingOk = False) and (FrmDlg.DDiceGame.Visible = FALSE) then begin
    if mrOk = FrmDlg.DSimpleMessageDlg2 ('ÄãÈ·¶¨ÒªÍË³öÓÎÏ·Âð£¿', [mbOk, mbCancel]) then begin
      if g_boBagLoaded then
        Savebags (CharName + '.itm', @g_ItemArr);
      g_boBagLoaded := FALSE;
      SaveIDInfo(CharName);
      DScreen.ClearHint;
      FrmMain.Close;
    end;
  end;
end;


procedure TfrmMain.PrintScreenNow;
   function IntToStr2(n: integer): string;
   begin
      if n < 10 then Result := '0' + IntToStr(n)
      else Result := IntToStr(n);
   end;
var
   i, k, n, checksum: integer;
   flname: string;
   sptr, dptr: PByte;
   Dirname: string;
   ddsd: TDDSurfaceDesc;
   dib: TDIB;
   nWidth: Integer;
begin
             //½ºÅ©¸°¼¦ »çÁø ³Ñ¹ö
   if not DxDraw.CanDraw then exit;

   Dirname := GetCurrentDir;
   if Copy(Dirname, Length(Dirname), 1) <> '\' then Dirname := Dirname + '\';
   Dirname := Dirname + 'Screenshot\';
   if not DirectoryExists(Dirname) then CreateDir(Dirname);

   while TRUE do begin
     flname := Dirname + 'Images' + IntToStr2(g_nCaptureSerial) + '.bmp';  //½º¼¦
     if not FileExists (flname) then break;
     Inc (g_nCaptureSerial);
   end;
   PlaySound2(bmg_Camera);
   dib := TDIB.Create;
   if g_BitCountMode = 0 then begin
     Dib.PixelFormat.RBitMask := $F800;
     Dib.PixelFormat.GBitMask := $07E0;
     Dib.PixelFormat.BBitMask := $001F;
     nWidth := 2;
     DIB.BitCount := 16;
   end else begin
     Dib.PixelFormat.RBitMask := $FF0000;
     Dib.PixelFormat.GBitMask := $00FF00;
     Dib.PixelFormat.BBitMask := $0000FF;
     nWidth := 4;
     DIB.BitCount := 32;
   end;
   DIB.Width := g_FScreenWidth;
   DIB.Height := g_FScreenHeight;
   DIB.ColorTable := g_WMainImages.MainPalette;
   DIB.UpdatePalette;

   ddsd.dwSize := SizeOf(ddsd);
   checksum := 0; //Ã¤Å©½æÀ»¸¸µç´Ù.
   try
      DxDraw.Surface.Lock(TRect(nil^), ddsd);
      for i := (600 - 120) to g_FScreenHeight - 10 do
      begin
        sptr := PBYTE(integer(ddsd.lpSurface) + (g_FScreenHeight - 1 - i) * ddsd.lPitch + 200);
        for k := 0 to 400 - 1 do begin
          checksum := checksum + byte(pbyte(integer(sptr) + k)^);
        end;
      end;
   finally
      DxDraw.Surface.Unlock();
   end;

   try
      SetBkMode (DxDraw.Surface.Canvas.Handle, TRANSPARENT);
      DxDraw.Surface.Canvas.Font.Color := clWhite;
      n := 0;
      if g_Myself <> nil then begin
         DXDraw.Surface.Canvas.TextOut (0, 0, g_sServerName + ' ' + g_Myself.m_sUserName);
         Inc (n, 1);
      end;
      DXDraw.Surface.Canvas.TextOut (0, (n)*12,   'CheckSum=' + IntToStr(checksum));
      DXDraw.Surface.Canvas.TextOut (0, (n+1)*12,  DateToStr(Date));
      DXDraw.Surface.Canvas.TextOut (0, (n+2)*12,  TimeToStr(Time));
      //DXDraw.Surface.Canvas.TextOut (0, (n+3)*12,  'Ver ' + VerInfoStr2);
      DxDraw.Surface.Canvas.Release;
      DxDraw.Surface.Lock (TRect(nil^), ddsd);
      for i := 0 to dib.Height-1 do begin
         sptr := PBYTE(integer(ddsd.lpSurface) + (dib.Height - 1 - i)*ddsd.lPitch);
         dptr := PBYTE(integer(dib.PBits) + i * g_FScreenWidth * nWidth);
         Move (sptr^, dptr^, g_FScreenWidth * nWidth);
      end;
      DScreen.AddSysMsg('<CO$FFC0F0>' + flname + '<CE>ÒÑ½ØÍ¼³É¹¦¡£', 40, 60, clYellow);
   finally
      DxDraw.Surface.Unlock();
   end;
   dib.SaveToFile (flname);
   dib.Clear;
   dib.Free;
end;


{------------------------------------------------------------}

procedure TfrmMain.ProcessKeyMessages;
begin
   case ActionKey of
     VK_F1, VK_F2, VK_F3, VK_F4, VK_F5, VK_F6, VK_F7, VK_F8: begin
       UseMagic (g_nMouseX, g_nMouseY, GetMagicByKey (char ((ActionKey-VK_F1) + byte('1')) ));
       ActionKey := 0;
       g_nTargetX := -1;
       exit;
     end;
     12..19: begin
       UseMagic (g_nMouseX, g_nMouseY, GetMagicByKey (char ((ActionKey-12) + byte('1') + byte($14)) ));
       ActionKey := 0;
       g_nTargetX := -1;
       exit;
     end;
     49..55: begin    //¿µ¿õ
        HeroUseMagic(g_nMouseX, g_nMouseY, GetHeroMagicByKey(Char((ActionKey - 49) + Byte('1'))));
        ActionKey := 0;
        g_nTargetX := -1;
        Exit;
      end;
   end;
end;


procedure TfrmMain.GetAutoMovingXY();
var
  I: Integer;
  Actor: TActor;
  Count: Integer;
  ni: Integer;
label
  LB_WALK, LB_STOP;
begin
  if g_MySelf = nil then exit;
  Count := 0;
  LB_WALK:
  if g_boNpcMoveing and (abs(g_MySelf.m_nCurrX - g_nScriptGotoX) <= 2) and
    (abs(g_MySelf.m_nCurrY - g_nScriptGotoY) <= 2) and
    (not PlayScene.CanWalkEx2(g_nScriptGotoX, g_nScriptGotoY)) then begin
    GotoClickNpc(g_nScriptGotoX, g_nScriptGotoY);
    g_nMiniMapPath := nil;
    g_boAutoMoveing := False;
    g_boNpcMoveing := False;
    g_nMiniMapMoseX := -1;
    g_nMiniMapMoseY := -1;
    g_nMiniMapPath := nil;
    exit;
  end;
  if High(g_nMiniMapPath) >= 0 then begin
    for I := Low(g_nMiniMapPath) to High(g_nMiniMapPath) do begin
      if (g_MySelf.m_nCurrX = g_nMiniMapPath[i].X) and (g_MySelf.m_nCurrY = g_nMiniMapPath[i].Y) then begin
        DynArrayDelete(g_nMiniMapPath, SizeOf(TPoint), 0, I + 1);
        break;
      end;
    end;
    if High(g_nMiniMapPath) < 0 then begin
      goto LB_STOP;
    end;
    if (g_MySelf.m_btHorse <> 0) or (g_MySelf.m_nState and $00008000 <> 0) then begin    //Å»°Í
      nI := 0;
      for I := Low(g_nMiniMapPath) to High(g_nMiniMapPath) do begin
        if CheckBeeline(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) and
          PlayScene.CanHorseRunEx(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) and
          (GetDistance(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) = 3) then begin
          g_ChrAction := caRun;
          g_nTargetX := g_nMiniMapPath[i].X;
          g_nTargetY := g_nMiniMapPath[i].Y;
          exit;
        end;
        Inc(nI);
        if nI >= 10 then
          break;
      end;

      if (High(g_nMiniMapPath) >= 2) and
        CheckBeeline(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[2].X, g_nMiniMapPath[2].Y) then begin
        g_ChrAction := caRun;
        g_nTargetX := g_nMiniMapPath[2].X;
        g_nTargetY := g_nMiniMapPath[2].Y;
        if (not PlayScene.CanHorseRunEx(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nTargetX, g_nTargetY)) or
          (GetDistance(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nTargetX, g_nTargetY) <= 2) then begin
          g_ChrAction := caWalk;
          g_nTargetX := g_nMiniMapPath[0].X;
          g_nTargetY := g_nMiniMapPath[0].Y;
        end;
      end
      else begin
        g_ChrAction := caWalk;
        g_nTargetX := g_nMiniMapPath[0].X;
        g_nTargetY := g_nMiniMapPath[0].Y;
      end;
    end
    else begin   //if g_MySelf.m_btHorse <> 0 then begi
      nI := 0;
      for I := Low(g_nMiniMapPath) to High(g_nMiniMapPath) do begin
        if CheckBeeline(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) and
          PlayScene.CanRunEX2(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) and
          (GetDistance(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[i].X, g_nMiniMapPath[i].Y) = 2) then begin
          g_ChrAction := caRun;
          g_nTargetX := g_nMiniMapPath[i].X;
          g_nTargetY := g_nMiniMapPath[i].Y;
          exit;
        end;
        Inc(nI);
        if nI >= 10 then
          break;
      end;
      if (High(g_nMiniMapPath) >= 1) and
        CheckBeeline(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMiniMapPath[1].X, g_nMiniMapPath[1].Y) then begin
        g_ChrAction := caRun;
        g_nTargetX := g_nMiniMapPath[1].X;
        g_nTargetY := g_nMiniMapPath[1].Y;
        if (not PlayScene.CanRunEX2(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nTargetX, g_nTargetY)) or
          (GetDistance(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nTargetX, g_nTargetY) <= 1) then begin
          g_ChrAction := caWalk;
          g_nTargetX := g_nMiniMapPath[0].X;
          g_nTargetY := g_nMiniMapPath[0].Y;
        end;
      end
      else begin
        g_ChrAction := caWalk;
        g_nTargetX := g_nMiniMapPath[0].X;
        g_nTargetY := g_nMiniMapPath[0].Y;
      end;
    end;

    if g_ChrAction = caWalk then begin
      if not PlayScene.CanWalkEx2(g_nTargetX, g_nTargetY) then begin
        for i := PlayScene.m_ActorList.Count - 1 downto 0 do begin
          Actor := TActor(PlayScene.m_ActorList[i]);
          if not ((actor.m_boDeath or (g_boNpcMoveing and (Actor.m_nCurrX = g_nScriptGotoX) and (Actor.m_nCurrY = g_nScriptGotoY)))) then
          begin
            g_LegendMap.SetTerrainType(Actor.m_nCurrX, Actor.m_nCurrY, False);
          end;
        end;
        Try
          g_nMiniMapPath := FindPath(g_nMiniMapPath[High(g_nMiniMapPath)].X, g_nMiniMapPath[High(g_nMiniMapPath)].Y);
        Finally
          for i := PlayScene.m_ActorList.Count - 1 downto 0 do begin
            Actor := TActor(PlayScene.m_ActorList[i]);
            if not ((actor.m_boDeath or (g_boNpcMoveing and (Actor.m_nCurrX = g_nScriptGotoX) and (Actor.m_nCurrY = g_nScriptGotoY)))) then
            begin
              g_LegendMap.SetTerrainType(Actor.m_nCurrX, Actor.m_nCurrY, True);
            end;
          end;
        End;
        if High(g_nMiniMapPath) >= 0 then begin
          Inc(Count);
          if Count > 5 then begin
            if g_boNpcMoveing and (abs(g_MySelf.m_nCurrX - g_nScriptGotoX) <= 5) and
              (abs(g_MySelf.m_nCurrY - g_nScriptGotoY) <= 5) then
            begin
              GotoClickNpc(g_nScriptGotoX, g_nScriptGotoY);
              g_nMiniMapPath := nil;
              g_boAutoMoveing := False;
              g_boNpcMoveing := False;
              g_nMiniMapMoseX := -1;
              g_nMiniMapMoseY := -1;
              g_nMiniMapPath := nil;
              exit;
            end;
           // if not g_boNpcMoveing then
            DScreen.AddSysMsg('[Unable to reach destination]', 40, 60, clWhite);
            g_boAutoMoveing := False;
            g_boNpcMoveing := False;
            g_nMiniMapMoseX := -1;
            g_nMiniMapMoseY := -1;
            g_nMiniMapPath := nil;
            exit;
          end;
          goto LB_WALK
        end
        else begin
          if g_boNpcMoveing and (abs(g_MySelf.m_nCurrX - g_nScriptGotoX) <= 5) and
              (abs(g_MySelf.m_nCurrY - g_nScriptGotoY) <= 5) then
          begin
            GotoClickNpc(g_nScriptGotoX, g_nScriptGotoY);
            g_nMiniMapPath := nil;
            g_boAutoMoveing := False;
            g_boNpcMoveing := False;
            g_nMiniMapMoseX := -1;
            g_nMiniMapMoseY := -1;
            g_nMiniMapPath := nil;
            exit;
          end;
        //  if not g_boNpcMoveing then
          DScreen.AddSysMsg('[Unable to reach destination]', 40, 60, clWhite);
          g_boAutoMoveing := False;
          g_boNpcMoveing := False;
          g_nMiniMapMoseX := -1;
          g_nMiniMapMoseY := -1;
          g_nMiniMapPath := nil;
          exit;
        end;
      end;
    end;
  end
  else begin
    LB_STOP:
    if (High(g_nMiniMapPath) < 0) then begin
      if not g_boNpcMoveing then
        DScreen.AddSysMsg('[ÄãÒÑ¾­ÒÆ¶¯µ½ÁËÄ¿µÄµØ¡£]', 40, 60, clYellow);
      g_nMiniMapPath := nil;
      g_boAutoMoveing := False;
      g_boNpcMoveing := False;
      g_nMiniMapMoseX := -1;
      g_nMiniMapMoseY := -1;
      g_nMiniMapPath := nil;
      exit;
    end;
    if (g_MySelf.m_nCurrX = g_nMiniMapPath[0].X) and (g_MySelf.m_nCurrY = g_nMiniMapPath[0].Y) then begin
      g_nMiniMapPath := nil;
    end;
    if (High(g_nMiniMapPath) < 0) then begin
      if not g_boNpcMoveing then
        DScreen.AddSysMsg('[ÄãÒÑ¾­ÒÆ¶¯µ½ÁËÄ¿µÄµØ¡£]', 40, 60, clYellow);
      g_nMiniMapPath := nil;
      g_boAutoMoveing := False;
      g_boNpcMoveing := False;
      g_nMiniMapMoseX := -1;
      g_nMiniMapMoseY := -1;
      g_nMiniMapPath := nil;
      exit;
    end;
    g_ChrAction := caWalk;
    g_nTargetX := g_nMiniMapPath[0].X;
    g_nTargetY := g_nMiniMapPath[0].Y;
    if not PlayScene.CanWalkEx2(g_nTargetX, g_nTargetY) then begin
      DScreen.AddSysMsg('[Unable to reach destination]', 40, 60, clWhite);
      g_nMiniMapPath := nil;
      g_boAutoMoveing := False;
      g_boNpcMoveing := False;
      g_nMiniMapMoseX := -1;
      g_nMiniMapMoseY := -1;
      g_nMiniMapPath := nil;
    end;
  end;
end;

procedure TfrmMain.ProcessActionMessages;
var
   mx, my, dx, dy, crun: integer;
   ndir, adir, mdir: byte;
   bowalk, bostop: Boolean;
label
   LB_WALK;
begin
   if g_MySelf = nil then exit;

   if g_boAutoMoveing and CanNextAction and ServerAcceptNextAction and (not g_boMapMovingWait) then
    GetAutoMovingXY();

   if (g_nTargetX >= 0) and CanNextAction and ServerAcceptNextAction then begin
      if (g_nTargetX <> g_MySelf.m_nCurrX) or (g_nTargetY <> g_MySelf.m_nCurrY) then begin
         mx := g_MySelf.m_nCurrX;
         my := g_MySelf.m_nCurrY;
         dx := g_nTargetX;
         dy := g_nTargetY;
         ndir := GetNextDirection (mx, my, dx, dy);
         case g_ChrAction of
            caWalk: begin
               LB_WALK:

               crun := g_MySelf.CanWalk;
               mx := g_MySelf.m_nCurrX;
               my := g_MySelf.m_nCurrY;
               if (g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0) then begin   //¿ù¿µ¼ú ¿ù¿µ¹«
                  if IsUnLockAction (CM_DOWN, ndir) and (crun > 0) then begin
                     GetNextPosXY (ndir, mx, my);
                   //  bowalk := TRUE;
                     bostop := FALSE;
                     if not PlayScene.CanWalk (mx, my) then begin
                        bowalk := FALSE;
                        adir := 0;
                        if not bowalk then begin
                           mx := g_MySelf.m_nCurrX;
                           my := g_MySelf.m_nCurrY;
                           GetNextPosXY (ndir, mx, my);
                           if CheckDoorAction (mx, my) then
                              bostop := TRUE;
                        end;
                        if not bostop and not PlayScene.CrashMan(mx,my) then begin       //»ç¶÷Àº ÀÚµ¿À¸·Î ÇÇÇÏÁö ¾ÊÀ½..
                          mx := g_MySelf.m_nCurrX;
                          my := g_MySelf.m_nCurrY;
                          adir := PrivDir(ndir);
                          GetNextPosXY (adir, mx, my);
                          if not Map.CanMove(mx,my) then begin
                            mx := g_MySelf.m_nCurrX;
                            my := g_MySelf.m_nCurrY;
                            adir := NextDir (ndir);
                            GetNextPosXY (adir, mx, my);
                            if Map.CanMove(mx,my) then
                               bowalk := TRUE;
                          end else
                            bowalk := TRUE;
                        end;
                        if bowalk then begin
                          g_MySelf.UpdateMsg (CM_DOWN, mx, my, adir, 0, 0, '', 0);
                          g_dwLastMoveTick := GetTickCount;
                        end else begin
                          mdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, dx, dy);
                          if mdir <> g_MySelf.m_btDir then
                            g_MySelf.SendMsg (CM_TURN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, 0, 0, '', 0);
                          g_nTargetX := -1;
                        end;
                     end else begin
                       g_MySelf.UpdateMsg (CM_DOWN, mx, my, ndir, 0, 0, '', 0);
                       g_dwLastMoveTick := GetTickCount;
                     end;
                  end else begin
                    g_nTargetX := -1;
                  end;
               end else begin

                 if IsUnLockAction (CM_WALK, ndir) and (crun > 0) then begin
                   GetNextPosXY (ndir, mx, my);
                //    bowalk := TRUE;
                   bostop := FALSE;
                   if not PlayScene.CanWalk (mx, my) then begin
                     bowalk := FALSE;
                     adir := 0;
                     if not bowalk then begin
                        mx := g_MySelf.m_nCurrX;
                        my := g_MySelf.m_nCurrY;
                        GetNextPosXY (ndir, mx, my);
                        if CheckDoorAction (mx, my) then
                           bostop := TRUE;
                     end;
                     if not bostop and not PlayScene.CrashMan(mx, my) then begin
                        mx := g_MySelf.m_nCurrX;
                        my := g_MySelf.m_nCurrY;
                        adir := PrivDir(ndir);
                        GetNextPosXY (adir, mx, my);
                        if not Map.CanMove(mx, my) then begin
                           mx := g_MySelf.m_nCurrX;
                           my := g_MySelf.m_nCurrY;
                           adir := NextDir (ndir);
                           GetNextPosXY (adir, mx, my);
                           if Map.CanMove(mx, my) then
                              bowalk := TRUE;
                        end else
                           bowalk := TRUE;
                     end;
                     if bowalk then begin
                        g_MySelf.UpdateMsg (CM_WALK, mx, my, adir, 0, 0, '', 0);
                        g_dwLastMoveTick := GetTickCount;
                     end else begin
                        mdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, dx, dy);
                        if mdir <> g_MySelf.m_btDir then
                           g_MySelf.SendMsg (CM_TURN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, 0, 0, '', 0);
                        g_nTargetX := -1;
                     end;
                   end else begin
                     g_MySelf.UpdateMsg (CM_WALK, mx, my, ndir, 0, 0, '', 0);
                     g_dwLastMoveTick := GetTickCount;
                   end;
                 end else begin
                   g_nTargetX := -1;
                 end;
               end;
            end;

            caRun: begin  //´Þ¸®±â

               if g_boCanStartRun or (g_nRunReadyCount >= 1) then begin //ÁúÁÖ?
                  crun := g_MySelf.CanRun;

                  if (g_MySelf.m_btHorse <> 0) then begin
                    if (GetDistance (mx, my, dx, dy) >= 3) and (crun > 0) then begin  //È£¶ûÀÌ
                      if IsUnLockAction (CM_SPEEDRUN, ndir) then begin
                        GetNextSpeedRunXY(ndir, mx, my);
                        if PlayScene.CanRunEx (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mx, my) then begin
                          g_MySelf.UpdateMsg (CM_SPEEDRUN, mx, my, ndir, 0, 0, '', 0);
                          g_dwLastMoveTick := GetTickCount;
                        end else begin
                         goto LB_WALK;// TTTT;
                        end;
                      end else
                       g_nTargetX := -1;
                    end else begin
                      goto LB_WALK;
                    end;
                  end else begin

                    if ((g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0)) and (g_MySelf.m_nState and $00008000 <> 0) then begin    //°æ½Åº¸ + ¿ù¿µ¼ú  ¿ù¿µ¹«
                      if (GetDistance (mx, my, dx, dy) >= 2) and (crun > 0) then begin
                        if IsUnLockAction (CM_DOWNRUN, ndir) then begin
                          GetNextRunXY (ndir, mx, my);
                          if PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mx, my) then begin
                            g_MySelf.UpdateMsg (CM_DOWNRUN, mx, my, ndir, 0, 0, '', 0);
                            g_dwLastMoveTick := GetTickCount;
                          end else begin
                            goto LB_WALK;// TTTT;
                          end;
                        end else
                          g_nTargetX := -1;
                      end else begin
                        goto LB_WALK;
                      end;
                    end else begin
                      if g_MySelf.m_nState and $00008000 <> 0 then begin    //°æ½Åº¸
                        if (GetDistance (mx, my, dx, dy) >= 3) and (crun > 0) then begin
                          if IsUnLockAction (CM_SPEEDRUN, ndir) then begin
                            GetNextSpeedRunXY (ndir, mx, my);
                            if PlayScene.CanRunEx (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mx, my) then begin
                              g_MySelf.UpdateMsg (CM_SPEEDRUN, mx, my, ndir, 0, 0, '', 0);
                              g_dwLastMoveTick := GetTickCount;
                            end else begin
                              goto LB_WALK;// TTTT;
                            end;
                          end else
                            g_nTargetX := -1;
                        end else begin
                           goto LB_WALK;
                        end;
                      end else begin
                        if (g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0) then begin    //¿ù¿µ¼ú  ¿ù¿µ¹«
                          if (GetDistance (mx, my, dx, dy) > 1) and (crun > 0) then begin
                            if IsUnLockAction (CM_DOWN, ndir) then begin
                              GetNextPosXY (ndir, mx, my);
                              if PlayScene.CanWalk (mx, my) then begin
                                g_MySelf.UpdateMsg (CM_DOWN, mx, my, ndir, 0, 0, '', 0);
                                g_dwLastMoveTick := GetTickCount;
                              end else begin
                               goto LB_WALK;// TTTT;
                              end;
                            end else
                             g_nTargetX := -1;
                          end else begin
                            goto LB_WALK;
                          end;
                        end else begin
                          if (GetDistance (mx, my, dx, dy) >= 2) and (crun > 0) then begin
                           if IsUnLockAction (CM_RUN, ndir) then begin
                             GetNextRunXY (ndir, mx, my);
                             if PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mx, my) then begin
                               g_MySelf.UpdateMsg (CM_RUN, mx, my, ndir, 0, 0, '', 0);
                               g_dwLastMoveTick := GetTickCount;
                             end else begin
                               goto LB_WALK;// TTTT;
                             end;
                           end else
                             g_nTargetX := -1;
                          end else begin
                            goto LB_WALK;
                          end;
                        end;
                      end;
                    end;
                  end;
               end else begin
                 Inc (g_nRunReadyCount);
                 goto LB_WALK;
               end;
            end;
         end;
      end;
   end;
   g_nTargetX := -1;    //ÇÑ¹ø¿¡ ÇÑÄ­¾¿..
   if g_MySelf.RealActionMsg.Ident > 0 then begin
      FailAction := g_MySelf.RealActionMsg.Ident;      //½ÇÆÐÇÒ¶§ ´ëºñ
      FailDir := g_MySelf.RealActionMsg.Dir;
     // ActionFailLockTime := GetTickCount;
      if (g_MySelf.RealActionMsg.Ident = CM_SPELL) or (g_MySelf.RealActionMsg.Ident = CM_BOW) then begin
         SendSpellMsg (g_MySelf.RealActionMsg.Ident,
                       g_MySelf.RealActionMsg.X,
                       g_MySelf.RealActionMsg.Y,
                       g_MySelf.RealActionMsg.Dir,
                       g_MySelf.RealActionMsg.State);
      end else
         SendActMsg (g_MySelf.RealActionMsg.Ident,
                  g_MySelf.RealActionMsg.X,
                  g_MySelf.RealActionMsg.Y,
                  g_MySelf.RealActionMsg.Dir);
      g_MySelf.RealActionMsg.Ident := 0;

      if g_nMDlgX <> -1 then
         if (abs(g_nMDlgX-g_MySelf.m_nCurrX) >= 8) or (abs(g_nMDlgY-g_MySelf.m_nCurrY) >= 8) then begin
            FrmDlg.CloseMDlg;
            FrmDlg.SafeCloseDlg;      //Á¦Á¶½ºÃÄ
            g_nMDlgX := -1;
            g_Npcbookinx := -1;
         end;
   end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ini: TIniFile;
  Result:string;
  str:string;
begin
  if m_boWakeUp then exit;
  if FrmDlg.DSelectChr.Visible then begin

    if GetTickCount - g_KeyDownTick > 800 then begin
      with SelectChrScene do begin
        if ChrArr[0].Selected then begin     //¹æÇâÅ° Ä³¸¯¼±ÅÃ
          case Key of
            VK_UP : begin
              if ChrArr[3].Valid then
                SelectChrScene.SelChrSelect4Click
              else
              if ChrArr[2].Valid then
                SelectChrScene.SelChrSelect3Click
              else SelectChrScene.SelChrSelect2Click;
              g_KeyDownTick:=GetTickCount
            end;
            VK_DOWN : begin
              if ChrArr[1].Valid then
                SelectChrScene.SelChrSelect2Click;
                g_KeyDownTick:=GetTickCount
            end;
          end;
        end else
        if ChrArr[1].Selected then begin
          case Key of
            VK_UP : begin SelectChrScene.SelChrSelect1Click; g_KeyDownTick:=GetTickCount end;
            VK_DOWN : begin
              if ChrArr[2].Valid then
                SelectChrScene.SelChrSelect3Click
              else SelectChrScene.SelChrSelect1Click;
              g_KeyDownTick:=GetTickCount
            end;
          end;
        end else
        if ChrArr[2].Selected then begin
          case Key of
            VK_UP : begin SelectChrScene.SelChrSelect2Click; g_KeyDownTick:=GetTickCount end;
            VK_DOWN : begin
              if ChrArr[3].Valid then
                SelectChrScene.SelChrSelect4Click
              else SelectChrScene.SelChrSelect1Click;
              g_KeyDownTick:=GetTickCount;
            end;
          end;
        end else
        if ChrArr[3].Selected then begin
          case Key of
            VK_UP : begin SelectChrScene.SelChrSelect3Click; g_KeyDownTick:=GetTickCount end;
            VK_DOWN : begin SelectChrScene.SelChrSelect1Click; g_KeyDownTick:=GetTickCount end;
          end;
        end;

      end;
    end;

  end;      

  case Key of
    VK_PAUSE: begin
      Key:=0;
      PrintScreenNow();
    end;
  end;

  if g_DWinMan.KeyDown (Key, Shift)and m_boWakeUp then exit;

  if (FrmDlg.EdSalesEdit.Visible) or (FrmDlg.CostSalesEdit.Visible) or (FrmDlg.EdShopEdit.Visible) or FrmDlg.ESitemName.Visible or FrmDlg.EdStoreDlgEdit.Visible
  or FrmDlg.EdStoreMsgEdit.Visible or FrmDlg.EdStoreMacrosEdit.Visible then exit; //È¯»óÁ¡ °Ë»ö, À§Å¹ °Ë»ö
  if (g_MySelf = nil) or (DScreen.CurrentScene <> PlayScene) then exit;



  case Key of
    VK_F1, VK_F2, VK_F3, VK_F4,
    VK_F5, VK_F6, VK_F7, VK_F8: begin
      if (GetKeyState(VK_MENU) AND 128) = 128 then begin   {ALT down}
         case Key of
           VK_F1:
             str := FrmDlg.strlMacros.Strings[0];
           VK_F2:
             str := FrmDlg.strlMacros.Strings[1];
           VK_F3:
             str := FrmDlg.strlMacros.Strings[2];
           VK_F4:
             str := FrmDlg.strlMacros.Strings[3];
           VK_F5:
             str := FrmDlg.strlMacros.Strings[4];
           VK_F6:
             str := FrmDlg.strlMacros.Strings[5];
           VK_F7:
             str := FrmDlg.strlMacros.Strings[6];
           VK_F8:
             str := FrmDlg.strlMacros.Strings[7];
         end;
         SendSay(str);
         Key := 0;
      end else begin
        if (not (g_MySelf.m_btHorse <> 0)) and (not (g_MySelf.m_nState and $00000200 <> 0)) then begin    //È£¶ûÀÌ ½ÃÀÛ
          if (GetTickCount - g_dwLatestSpellTick > (g_dwSpellTime + g_dwMagicDelayTime)) then begin
            if (g_MyHero <> nil) and (ssShift in Shift) then begin
              ActionKey:=Key - 63;
            end else
            if (ssCtrl in Shift) or (g_boSkillBarNum = 2) then ActionKey:=Key - 100
            else ActionKey:=Key;
          end;
          Key := 0;
        end; //È£¶ûÀÌ ³¡
      end;
    end;
    VK_F9: begin
      FrmDlg.OpenItemBag;
      Key := 0;
    end;
    VK_F10: begin
      FrmDlg.StatePage := 0;
      FrmDlg.OpenMyStatus;
      Key := 0;
    end;
    VK_F11: begin
      FrmDlg.StatePage := 3;
      FrmDlg.OpenMyStatus;
      Key := 0;
    end;
    VK_F12: begin
      if NOT FrmDlg.DMacros.Visible then
        begin
          FrmDlg.DMacros.Visible := NOT FrmDlg.DMacros.Visible;
          FrmDlg.ToggleMacrosFieldVisability;
          FrmDlg.DMacros.ShowModal;
        end else
        begin
          FrmDlg.DMacros.Visible := NOT FrmDlg.DMacros.Visible;
          FrmDlg.ToggleMacrosFieldVisability;
          SetImeMode (PlayScene.EdChat.Handle, imSAlpha);
        end;
    end;
    VK_ESCAPE: begin      //ESC Å°
      CloseAllWindows;
    end;
    VK_INSERT : begin
      g_boDrugOn := not g_boDrugOn;
    end;
    word('H'): begin       //°ø°Ý ¸ðµå
      if ssCtrl in Shift then begin
        SendSay ('@AttackMode');
      end;
    end;
    Word('C'): begin //¿µ¿õ »óÅÂÃ¢
        if ssCtrl in Shift then begin
          if g_MyHero <> nil then begin
            if not PlayScene.EdChat.Visible then begin
              FrmDlg.HeroStatePage := 0;
              FrmDlg.OpenHeroStatus;
              Key := 0;
            end;
          end;
        end;
    end;
    Word('I'): begin //¿µ¿õ °¡¹æ
        if ssCtrl in Shift then begin
          if g_MyHero <> nil then begin
            if not PlayScene.EdChat.Visible then begin
              FrmDlg.DButtonHeroBagClick(Nil, 0, 0);
              Key := 0;
            end;
          end;
        end;
      end;

    Byte('1'): begin
      if g_MyHero <> nil then begin
        if ssCtrl in Shift then begin
          FrmDlg.DHeroCallClick(nil,0,0);
        end;
      end;
    end;
    Byte('2'): begin
      if g_MyHero <> nil then begin
        if ssCtrl in Shift then begin
          FrmDlg.DHeroBackClick(nil,0,0);
        end;
      end;
    end;
    Byte('3'): begin
      if g_MyHero <> nil then begin
        if ssCtrl in Shift then begin
          FrmDlg.DHeroDefenClick(nil,0,0);
        end;
      end;
    end;

    word('A'): begin
      if ssCtrl in Shift then begin
        SendSay ('@Rest');
      end else begin
        if not PlayScene.EdChat.Visible then begin
          if g_BoPetOn and (g_boItemAuto = 2) then begin
            if GetTickCount > g_dwPetPickUp then begin
              g_dwPetPickUp := GetTickCount + 1000;
              SendPetPickup;
              TabClickTime := GetTickCount;
            end;
          end;
        end
      end;
    end;

    word('S'): begin    //°¡¹æÁ¤¸®
      if ssCtrl in Shift then begin
       //
      end else begin
        if not PlayScene.EdChat.Visible then begin
        end
      end;
    end;

     word('Z'): begin
        if not PlayScene.EdChat.Visible then begin
          if ssCtrl in Shift then begin
            FrmDlg.DBeltSwapClick(Nil,0,0);
            if g_MyHero <> nil then
              FrmDlg.DBeltHeroSwapClick(Nil, 0, 0);
          end;
        end;
      end;

    word('F'): begin
      if ssCtrl in Shift then begin
        if g_nCurFont < MAXFONT-1 then Inc(g_nCurFont)
        else g_nCurFont := 0;
        g_sCurFontName := g_FontArr[g_nCurFont];
        FrmMain.Font.Name := g_sCurFontName;
        FrmMain.Canvas.Font.Name := g_sCurFontName;
        DxDraw.Surface.Canvas.Font.Name := g_sCurFontName;
        PlayScene.EdChat.Font.Name := g_sCurFontName;

        ini := TIniFile.Create('.\Mir2.ini');
        if ini <> nil then begin
          ini.WriteString ('Setup', 'FontName' , g_sCurFontName);
          ini.Free;
        end;
      end;
    end;
    word('X'):     //ÀüÅõÁß Á¢¼Ó Á¾·á
         begin
            if g_MySelf = nil then exit;
            if ssAlt in Shift then begin
               SendClientMessage (CM_CANCLOSE, 0, 0, 0, 0);
            end else begin
              if not PlayScene.EdChat.Visible then
                if g_BoPetOn then begin
                  TabClickTime := GetTickCount;
                  XClickTime := GetTickCount;
                end;
            end;

         end;
      word('G'): begin
         if ssCtrl in Shift then begin
           if g_FocusCret <> nil then begin
             if g_MemberGroup.Count = 0 then
               SendCreateGroup(Integer(g_GroupItemMode), Integer(g_boCheckHero), g_FocusCret.m_sUserName)
             else SendAddGroupMember(g_FocusCret.m_sUserName);
             PlayScene.EdChat.Text:=g_FocusCret.m_sUserName;
           end;
         end;
      end;

      word('Q'):
          begin
            if g_MySelf = nil then exit;
            if ssAlt in Shift then begin
              if (GetTickCount - g_dwLatestStruckTick > 10000) and
                 (GetTickCount - g_dwLatestMagicTick > 10000) and
                 (GetTickCount - g_dwLatestHitTick > 10000) or
                 (g_MySelf.m_boDeath) then AppExit
              else
                DScreen.AddChatBoardString ('ÔÚÕ½¶·ÖÐÄã²»ÄÜÍË³öÓÎÏ·¡£', clYellow, clRed);
            end else begin
              if not PlayScene.EdChat.Visible then begin
              end;
            end;
          end;
   end;

   if (GetKeyState(VK_MENU) AND 128) = 128 then begin   {ALT down}
     Key := 0;
   end;
   case Key of
     VK_UP: FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.Position - 1;
     VK_DOWN: FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.Position + 1;
     VK_PRIOR: FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.Position - (FrmDlg.DNewSay.Height div SAYLISTHEIGHT - 1);
     VK_NEXT: FrmDlg.DSayUpDown.Position := FrmDlg.DSayUpDown.Position + (FrmDlg.DNewSay.Height div SAYLISTHEIGHT - 1);
     VK_F10: Key := 0;
   end;
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if FrmDlg.DSelServerDlg.Visible then begin   //¼­¹ö¼±ÅÃ
      case byte(key) of
         byte('1'): FrmDlg.DSServer1Click(FrmDlg.DSServer1, 1,1);
         byte('2'): FrmDlg.DSServer1Click(FrmDlg.DSServer2, 1,1);
         byte('3'): FrmDlg.DSServer1Click(FrmDlg.DSServer3, 1,1);
         byte('4'): FrmDlg.DSServer1Click(FrmDlg.DSServer4, 1,1);
         byte('5'): FrmDlg.DSServer1Click(FrmDlg.DSServer5, 1,1);
         byte('6'): FrmDlg.DSServer1Click(FrmDlg.DSServer6, 1,1);
         byte('7'): FrmDlg.DSServer1Click(FrmDlg.DSServer7, 1,1);
         byte('8'): FrmDlg.DSServer1Click(FrmDlg.DSServer8, 1,1);
      end;
      Exit;
   end;

   if (not FrmDlg.DFishProgressDlg.Visible) and g_DWinMan.KeyPress (Key) then exit;   //³¬½Ã

   if (key = #13) and FrmDlg.DSelectChr.Visible and (not FrmDlg.DCreateChr.Visible) and FrmDlg.DscStart.Enabled then begin
       SelectChrScene.SelChrStartClick;
   end;

   if (key = #13) and FrmDlg.DWItemSepa.Visible then begin
      FrmDlg.ItemSepaOkClick(nil,0,0);
      Exit;
   end;
   if m_boWakeUp then exit;

   if DScreen.CurrentScene = PlayScene then begin
      if PlayScene.EdChat.Visible or  FrmDlg.EdMacro1.Focused or FrmDlg.EdMacro2.Focused or FrmDlg.EdMacro3.Focused or
        FrmDlg.EdMacro4.Focused or FrmDlg.EdMacro5.Focused or FrmDlg.EdMacro6.Focused or FrmDlg.EdMacro7.Focused or
        FrmDlg.EdMacro8.Focused or
        FrmDlg.EStoragePW1.Visible or FrmDlg.EStoragePW2.Visible or FrmDlg.EStoragePW3.Visible or
        FrmDlg.EdSalesEdit.Visible or FrmDlg.CostSalesEdit.Visible or FrmDlg.EdShopEdit.Visible or FrmDlg.ESitemName.Visible
        or FrmDlg.EdStoreDlgEdit.Visible or FrmDlg.EdStoreMsgEdit.Visible or FrmDlg.EdStoreMacrosEdit.Visible
        or FrmDlg.EdHeroName.Visible or FrmDlg.MemoMail.Visible or FrmDlg.edCharID.Visible then begin
         exit;
      end;

      if (FrmDlg.ESitemName.Visible) then exit; //¹°¾à

      if (key = #43) then begin // º¼·ý +
        if g_btSoundVolume <= 100 then begin
          g_btSoundVolume:= g_btSoundVolume + 5;
          if g_btSoundVolume >= 96 then g_btSoundVolume := 100;
          g_Sound.Volume := g_btSoundVolume;
          if g_btSoundVolume >= 1 then begin
            g_boSound := True;      //¼Ò¸® ÄÑ±â
          end;
        end;
        if g_btMP3Volume <= 100 then begin
          g_btMP3Volume:= g_btMP3Volume + 5;
          if g_btMP3Volume >= 96 then g_btMP3Volume := 100;
          if g_btMP3Volume >= 1 then begin
            g_boBGSound := True;      //¼Ò¸® ÄÑ±â
          end;
          if g_boBGSound and (g_btMP3Volume > 0) then begin
            if MusicHS >= BASS_ERROR_ENDED then begin
              if BASS_ChannelIsActive(MusicHS) <> BASS_ACTIVE_PLAYING then begin
                  PlayMapMusic(True);
              end else
                BASS_ChannelSetAttribute(MusicHS, BASS_ATTRIB_VOL, g_btMP3Volume / 100);
            end else
             PlayMapMusic(True);
          end
          else ClearBGM;
        end;
      end;
      if (key = #45) then begin // º¼·ý -
        if g_btSoundVolume > 1 then begin
          g_btSoundVolume:= g_btSoundVolume - 5;
          if g_btSoundVolume <= 4 then g_btSoundVolume := 1;
          g_Sound.Volume := g_btSoundVolume;
          if g_btSoundVolume <= 1 then begin
            g_boSound := false;       //¼Ò¸® ¿ÀÇÁ
            SilenceSound;
          end;
        end;

        if g_btMP3Volume > 1 then begin
          g_btMP3Volume:= g_btMP3Volume - 5;
          if g_btMP3Volume <= 4 then g_btMP3Volume := 1;
          if g_btMP3Volume <= 1 then begin
            g_boBGSound := false;       //¼Ò¸® ¿ÀÇÁ
          end;
          if g_boBGSound and (g_btMP3Volume > 0) then begin
            if MusicHS >= BASS_ERROR_ENDED then begin
              if BASS_ChannelIsActive(MusicHS) <> BASS_ACTIVE_PLAYING then begin
                  PlayMapMusic(True);
              end else
                BASS_ChannelSetAttribute(MusicHS, BASS_ATTRIB_VOL, g_btMP3Volume / 100);
            end else
             PlayMapMusic(True);
          end
          else ClearBGM;
        end;
      end;


      case byte(key) of

      byte('J'), byte('j'): begin//È£¶ûÀÌ
        if g_UseItems[U_TIGER].S.Name <> '' then begin
          FrmDlg.ToggleShowTigerDlg();
        end else
        DScreen.AddChatBoardString ('ÄãÐèÒª×°±¸×øÆï²ÅÄÜÊ¹ÓÃ¸Ã¹¦ÄÜ¡£',ClRed,ClWhite);
      end;

      byte('N'), byte('n'): begin //³¬½Ã
        if (g_UseItems[U_WEAPON].S.Name <> '') and (g_UseItems[U_WEAPON].S.Shape in [47,48]) then begin
            FrmDlg.DFishDlg.Visible := not FrmDlg.DFishDlg.Visible;
        end else begin
          DScreen.AddChatBoardString ('ÄãÐèÒª×°±¸µö¾ß²ÅÄÜÊ¹ÓÃ¸Ã¹¦ÄÜ¡£',ClRed,ClWhite);
        end;
      end;

      byte('Y') , byte('y'): begin  //¹ÐÈ¯»óÁ¡
        if not PlayScene.EdChat.Visible then begin
            FrmDlg.OpenItemShopDBl();
        end;
      end;

      byte('E') , byte('e'): begin  //¿µ¹°
        if not PlayScene.EdChat.Visible then begin
            FrmDlg.ToggleShowPetDlg;
        end;
      end;

      byte('A') ,byte('a'): begin
       if (GetKeyState(VK_LCONTROL) AND 128) = 128 then
        SendSay ('@Rest');
      end;

      byte('H') ,byte('h'): begin
        FrmDlg.OpenHelpWin();
      end;


      byte('U') ,byte('u'): begin
        if AngelFastDraw then begin
          AngelFastDraw := False;
          DScreen.AddChatBoardString ('<¹Ø±ÕÐ§¹ûÏÔÊ¾>', clGreen, clWhite)
        end else begin
         AngelFastDraw := True;
         DScreen.AddChatBoardString ('<¿ªÆôÐ§¹ûÏÔÊ¾>', clGreen, clWhite)
        end;
      end;


      byte('D') ,byte('d'):
          begin
              g_nRunReadyCount := 0;
              if gAutoRun then begin
                 gAutoRun := False;
                 DScreen.AddSayMsg('<¹Ø±Õ×Ô¶¯ÅÜ¹¦ÄÜ>', clGreen, clWhite, True, us_Sys);
              end
              else begin
                 gAutoRun := True;
                 DScreen.AddSayMsg('<¿ªÆô×Ô¶¯ÅÜ¹¦ÄÜ>', clGreen, clWhite, True, us_Sys);
              end;
          end;

      byte('V'), byte('v'):
          begin
              FrmDlg.DBotMiniMapClick(Nil,0,0);
          end;
      byte('F'), byte('f'): begin
            FrmDlg.DBotMasterClick(Nil,0,0);   //»çÁ¦ ½ºÃÄ
          end;
      byte('B'), byte('b'): begin
            FrmDlg.DBotBigMapClick(Nil,0,0);
          end;
      byte('Q'), byte('q'): begin
        FrmDlg.DBotQuestClick(nil,0,0);
      end;
      byte('T'), byte('t'): begin
          if GetTickCount > g_dwQueryMsgTick then begin
            g_dwQueryMsgTick := GetTickCount + 3000;
            FrmMain.SendDealTry;   //°Å·¡
          end;
      end;

      byte('K'), byte('k'): begin
        FrmDlg.ToggleShowRentalDlg;
      end;

      byte('G'), byte('g'): begin
        if (GetKeyState(VK_MENU) AND 128) = 128 then begin
           if g_FocusCret <> nil then
             SendDelGroupMember(g_FocusCret.m_sUserName)
        end else begin
            if FrmDlg.DGuildDlg.Visible then begin
              FrmDlg.DGuildDlg.Visible := FALSE;
            end else
            if GetTickCount > g_dwQueryMsgTick then begin
               g_dwQueryMsgTick := GetTickCount + 3000;
               FrmMain.SendGuildDlg;
            end;
        end;
      end;

      byte('O'), byte('o'): begin
          FrmDlg.DOptionClick;
      end;

      byte('P'), byte('p'): begin
          FrmDlg.ToggleShowGroupDlg;
      end;

      byte('Z') , byte('z'): begin
          FrmDlg.DBeltCloseClick(Nil,0,0);
          if g_MyHero <> nil then
             FrmDlg.DBeltHeroCloseClick(Nil, 0, 0);
      end;

      byte('L'), byte('l'): begin
          FrmDlg.DBotLoverClick(Nil,0,0);    //¿¬ÀÎ
      end;

      byte('C'), byte('c'): begin
          FrmDlg.StatePage := 0;
          FrmDlg.OpenMyStatus;
      end;

      byte('I'), byte('i'): begin
          FrmDlg.OpenItemBag;
      end;

      byte('S'), byte('s'): begin
          FrmDlg.StatePage := 3;
          FrmDlg.OpenMyStatus;
      end;

      byte('W'), byte('w'): begin
        FrmDlg2.DWinFriend.Visible := not FrmDlg2.DWinFriend.Visible;
      end;

      byte('M'), byte('m'): begin
        FrmDlg.DBotMemoClick(nil, 0, 0);
      end;

      byte('R'), byte('r'): begin
       if FrmDlg.DSkillbar.Visible then
         FrmDlg.DOptionsSkillBarOffClick(Nil,0,0)
       else
         FrmDlg.DOptionsSkillBarOnClick(Nil,0,0)
      end;


      byte('['): begin
         FrmDlg.DAutoPickUpClick(FrmDlg.DAutoPickUp,0,0);
      end;

         byte('1')..byte('6'):
            begin
              if (GetTickCount - BeltchekClick) > 400 then begin  //¹°¾à
                  FrmDlg.SwapBujuk(byte(key) - byte('1'));   //ºÎÀû
                  EatItem (byte(key) - byte('1'));     //º§Æ® ¾ÆÀÌÅÛÀ» »ç¿ëÇÑ´Ù.
              end;
            end;
         Byte('7'),Byte('8'): begin
           if (GetTickCount - BeltchekHeroClick) > 400 then begin  //¹°¾à
             HeroEatItem(Byte(Key) - Byte('7'));
           end;
         end;
            //½ºÅ³¹Ù
         byte('`'):
            begin
              if g_boSkillSetting then begin
                if g_boSkillBarNum = 1 then g_boSkillBarNum := 2
                else if g_boSkillBarNum = 2 then g_boSkillBarNum := 1;
                DScreen.AddChatBoardString ('<¼¼ÄÜ¿ì½ÝÀ¸ '+IntToStr(g_boSkillBarNum)+'>',ClGreen,ClWhite);
              end;
            end;

         27: //ESC
            begin
            end;
         13: //¿£ÅÍ
            begin
               PlayScene.EdChat.Visible := TRUE;
               PlayScene.EdChat.SetFocus;
               SetImeMode (PlayScene.EdChat.Handle, imSHanguel);
              { if FrmDlg.BoGuildChat then begin
                  PlayScene.EdChat.Text := '!~';
                  PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                  PlayScene.EdChat.SelLength := 0;
               end else begin  }
               if g_SayMode <> usm_Hear then begin
                 case g_SayMode of
                   usm_Whisper: PlayScene.EdChat.Text := '/';
                   usm_Cry: PlayScene.EdChat.Text := '!';
                   usm_Group: PlayScene.EdChat.Text := '!!';
                   usm_Guild: PlayScene.EdChat.Text := '!~';
                   usm_Lover: PlayScene.EdChat.Text := '¢½';
                   usm_Master: PlayScene.EdChat.Text := '¡Ý';
                 end;
                 PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                 PlayScene.EdChat.SelLength := 0;
               end else begin
                 PlayScene.EdChat.Text := '';
               end;
              // end;
            end;
         byte(' '):    //½ºÆäÀÌµå ¹Ù..
            begin
            if GetTickCount - g_dwLastMoveTick > 1000 then begin     //ÀÌµ¿Áß¿¡ Å»°Í Å» ¼ö ¾øÀ½
             if (g_UseItems[U_TIGER].S.Name <> '') and (g_FishingOk = False) then begin     //È£¶ûÀÌ
              if g_UseItems[U_TIGER].Dura > 0 then begin
               if (g_UseItems[U_PETS3].S.Name <> '') and (g_UseItems[U_PETS3].Dura > 0) then begin   //¾ÈÀå Âø¿ë
                if not (g_MySelf.m_nState and $00004000 <> 0) and not (g_MySelf.m_nState and $00000080 <> 0) then begin   //¿ù¿µ¼ú ¿ù¿µ¹«
                  if GetTickCount > g_dwChangeTigerSetTick then begin
                     g_TigerSet := not g_TigerSet;
                     g_dwChangeTigerSetTick := GetTickCount + 3000; //3ÃÊ µô·¹ÀÌ
                     SendTigerSet (g_TigerSet);
                     if g_TigerSet then
                      if g_UseItems[U_TIGER].S.StdMode = 101 Then
                         PlaySound2(s_TigerSet1)
                      else
                         PlaySound2(s_TigerSet2);
                  end;
                end else
               end else begin
               SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);
               DScreen.AddChatBoardString ('ÄãÐèÒª×°±¸°°¾ß²ÅÄÜÊ¹ÓÃ¡£',ClRed,ClWhite);
               end;
              end else begin
               SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);
               DScreen.AddChatBoardString ('ÄãµÄ×øÆïµÄÖÒ³Ï¶ÈÌ«µÍ¡£',ClRed,ClWhite);
              end;
             end;
            end;
            end;
         byte('@'),
         byte('!'),
         byte(','),
         byte('/'),
         byte('\'):
            begin
               PlayScene.EdChat.Visible := TRUE;
               PlayScene.EdChat.SetFocus;
               SetImeMode (PlayScene.EdChat.Handle, imSHanguel);
               if key = '/' then begin
                  if WhisperName = '' then
                     PlayScene.EdChat.Text := key
                  else
                  if Length(WhisperName) > 2 then
                  PlayScene.EdChat.Text := '/' + WhisperName + ' '
                  else
                  PlayScene.EdChat.Text := key;
                  PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                  PlayScene.EdChat.SelLength := 0;
               end else if key = ',' then begin     //¿¬ÀÎ ½ºÃÄ
                  if Copy(fLover.GetDisplay(0), length(STR_LOVER) + 1, 6) <> '' then
                  PlayScene.EdChat.Text := '¢½'
                  else
                  PlayScene.EdChat.Text := key;
                  PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                  PlayScene.EdChat.SelLength := 0;
               end else if key = '\' then begin     //»çÁ¦ ½ºÃÄ

                  if fMentor.GetMode = 1 then begin
                   if Copy(fMentor.GetDisplay(0), length(STR_PUPIL) + 1, 6) <> '' then
                    PlayScene.EdChat.Text := '¡Ý'
                   else
                    PlayScene.EdChat.Text := key;
                    PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                    PlayScene.EdChat.SelLength := 0;
                  end else begin
                    if Copy(fMentor.GetDisplay(0), length(STR_MENTOR) + 1, 6) <> '' then
                    PlayScene.EdChat.Text := '¡Ý'
                   else
                    PlayScene.EdChat.Text := key;
                    PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                    PlayScene.EdChat.SelLength := 0;
                  end;

               end else begin
                  PlayScene.EdChat.Text := key;
                  PlayScene.EdChat.SelStart := 1;
                  PlayScene.EdChat.SelLength := 0;
               end;
               LocalLanguage := imSAlpha;
            end;

      end;
      key := #0;
   end;
end;

function  TfrmMain.GetMagicByKey (Key: char): PTClientMagic;
var
   i: integer;
   pm: PTClientMagic;
begin
   Result := nil;
   for i:=0 to g_MagicList.Count-1 do begin
      pm := PTClientMagic (g_MagicList[i]);
      if pm.Key = Key then begin
         Result := pm;
         break;
      end;
   end;
end;

function TfrmMain.GetHeroMagicByKey(Key: Char): PTClientMagic;
var
  I: Integer;
  pm: PTClientMagic;
begin
  Result := nil;
  for I := 0 to g_HeroMagicList.Count - 1 do begin
    pm := PTClientMagic(g_HeroMagicList[I]);
    if pm.Key = Key then begin
      Result := pm;
      Break;
    end;
  end;
end;

procedure TfrmMain.UseMagic (tx, ty: integer; pcm: PTClientMagic);
var
   tdir, targx, targy, targid: integer;
   pmag: PTUseMagicInfo;
   SpellSpend ,SpellSpend2: word;
begin
   if pcm = nil then exit;


   if (pcm.Def.wMimicID in [1,5,6,8..13,20,22..28,32..35,37..39,43..49,52,53,55..57,60,62..65,70..72,73,75,77,78,80,81..94,98,101..111]) then begin
       g_dwLatestMagicTick := GetTickCount; //ÀüÅõÁß Á¢¼Ó Á¾·á ºÎºÐ..
   end;

   SpellSpend := Round(pcm.Def.wSpell / (pcm.Def.btTrainLv+1) * (pcm.Level+1)) + pcm.Def.btDefSpell;

   if pcm.Def.wMimicID = 75 then begin  //¹ø³ú
      SpellSpend2:= LoWord(g_MySelf.m_Abil.SC) + HiWord(g_MySelf.m_Abil.SC);
      SpellSpend := SpellSpend + SpellSpend2;
   end;

   if g_MySelf.m_nState and 00010000 <> 0 then begin //½É¿¬¼ú
      SpellSpend := SpellSpend * 2;
   end;

   if (SpellSpend <= g_MySelf.m_Abil.MP) or (pcm.Def.btEffectType = 0) then begin

      if pcm.Def.btEffectType = 0 then begin
         if pcm.Def.wMimicID = 26 then begin   //¿°È­°á
            if GetTickCount - g_dwLatestFireHitTick < 10 * 1000 then begin
               exit;
            end;
         end;
         if pcm.Def.wMimicID = 110 then begin   //»ì»ýµµ
            if GetTickCount - g_dwLatestDeathHitTick < 10 * 1000 then begin
               exit;
            end;
         end;
         if pcm.Def.wMimicID = 27 then begin  //¹«ÅÂº¸
            if GetTickCount - g_dwLatestRushRushTick < 3 * 1000 then begin
               exit;
            end;
         end;

         if pcm.Def.wMimicID = 38 then begin //½Ö·æÂü
          //  BoStopAfterAttack := TRUE;
            DrawEffectHum(8,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;
         if pcm.Def.wMagicId = 73 then begin    //Ãµ¹«
            UseNormalEffect (NE_CHUNMU, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY);
         end;


         if pcm.Def.wMimicID = 117 then begin //³ú·æºÀ¹ý
           // BoStopAfterAttack := TRUE;
            DrawEffectHum(74,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;
         if pcm.Def.wMimicID = 119 then begin //ÃµÈ­ºÀ¹ý
          //  BoStopAfterAttack := TRUE;
            DrawEffectHum(75,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;

         if pcm.Def.wMimicID = 62 then begin  //¹ßµµ¼ú µô·¹ÀÌ
           if (GetTickCount - g_dwLatestSpellTick2 > 500) then begin
             g_dwLatestSpellTick2 := GetTickCount;
             if CheckUseMagicWeapon(pcm.Def.wMimicID) then
             SendSpellMsg (CM_SPELL, g_MySelf.m_btDir, 0, pcm.Def.wMagicId, 0);
             g_dwMagicDelayTime := 0;
           end else
         end else begin
           if GetTickCount - g_dwLatestSpellTick > g_dwSpellTime then begin
              g_dwLatestSpellTick := GetTickCount;
              g_dwMagicDelayTime := 0;
              if CheckUseMagicWeapon(pcm.Def.wMimicID) then
              SendSpellMsg (CM_SPELL, g_MySelf.m_btDir, 0, pcm.Def.wMagicId, 0);
           end;
         end;
      end else begin
         if g_FScreenWidth = 800 then begin
           tdir := GetFlyDirection (390, 254, tx, ty);
         end else begin
           tdir := GetFlyDirection({364 }390+ ((g_FScreenWidth - DEFSCREENWIDTH) div 2), {288} 254+ ((g_FScreenHeight - DEFSCREENHEIGHT) div 2 + 12), tx, ty);
         end;
//¿ÀÅäÅ¸°Ù (Ãß°¡ ¾ÈÇØ¾ß ¿ÀÅäÅ¸°Ù)         //¸¶¹ý
         if (pcm.Def.wMimicID in [2,14,15,19,9,10,20,22,23,29,33,36,40,44..47,49,52..57,62,63,70,72..74,77..79,81..84,86,89..98,101..104,106..109,
              111,114,115,117..128,130,132..135,137..141])
            then begin
           g_MagicTarget:=g_FocusCret;
         end else begin
           if not g_boMagicLock or (PlayScene.IsValidActor (g_FocusCret) and (not g_FocusCret.m_boDeath)) then begin
             g_MagicLockActor:=g_FocusCret;
           end;
           g_MagicTarget:=g_MagicLockActor;
         end;

         if not PlayScene.IsValidActor (g_MagicTarget) then
            g_MagicTarget := nil;

         if (g_MagicTarget = nil) then begin
            PlayScene.CXYfromMouseXYMid (tx, ty, targx, targy); //¸¶¹ý Á¤È®µµ
            targid := 0;
         end else begin
            targx := g_MagicTarget.m_nCurrX;
            targy := g_MagicTarget.m_nCurrY;
            targid := g_MagicTarget.m_nRecogId;
         end;
         if CanNextAction and ServerAcceptNextAction then begin
            new (pmag);
            FillChar (pmag^, sizeof(TUseMagicInfo), #0);
            pmag.EffectNumber := pcm.Def.btEffect;
            pmag.MagicSerial := pcm.Def.wMagicID;
            pmag.MimicSerial := pcm.Def.wMimicID;
            pmag.ServerMagicCode := 0;
            if CheckUseMagicWeapon(pmag.MimicSerial) and CheckUseMagicTarget(pmag.MimicSerial) and CheckUseMagicDelay(pmag.MimicSerial)
               and CheckUseMagicbujuk(pmag.MimicSerial) and CheckUseMagicMonk(pmag.MimicSerial) then begin

              g_dwLatestSpellTick := GetTickCount;
              if pcm.Def.wMimicID = 75 then begin  //¹ø³ú µô·¹ÀÌ
                g_dwMagicDelayTime := pcm.Def.dwDelayTime;
              end else
               g_dwMagicDelayTime := 200 + pcm.Def.dwDelayTime;

              g_dwMagicPKDelayTime := 0;
              if g_MagicTarget <> nil then
              if g_MagicTarget.m_btRace = 0 then
                g_dwMagicPKDelayTime := 300 + Random(1100); //(600+200 + MagicDelayTime div 5);

              g_MySelf.SendMsg (CM_SPELL, targx, targy, tdir, Integer(pmag), targid, '', 0);

            end;
         end;                    //ÇÇÅë
         if (g_MagicTarget <> nil) and (g_MagicTarget <> g_Myself) and (not g_MagicTarget.m_boDeath) then begin
          if (g_MagicTarget.m_btRace <> RCC_MERCHANT) and not(g_MagicTarget.m_btRace in [240..251]) and (g_MagicTarget.m_btRace <> RCC_GUARD) then begin
            if g_MagicTarget.m_Abil.HP > 5 then begin
              g_MagicTarget.m_noInstanceOpenHealth:=TRUE;
              g_MagicTarget.m_dwOpenHealthTime:=3*1000;
              g_MagicTarget.m_dwOpenHealthStart:=GetTickCount;
            end;
          end;
         end;

      end;
   end else
      Dscreen.AddSysMsg ('<CO$FFFF>Ä§·¨Öµ<CE>²»×ã¡£', 40, 60, clLime);
end;



procedure TfrmMain.HeroUseMagic(tx, ty: Integer; pcm: PTClientMagic);
var
   tdir, targx, targy, targid: integer;
   meff: TMagicEff;
   pmag: PTUseMagicInfo;
   SpellSpend : word;
begin
  if (pcm = nil) then Exit;

  if (pcm.Def.wMimicID in [1,5,6,8..13,20,22..28,32..35,37..39,43..49,52,53,55..57,60,62..65,70..72,73,75,77,78,80,81..94,98,101..109]) then begin
    g_dwLatestMagicTick := GetTickCount; //ÀüÅõÁß Á¢¼Ó Á¾·á ºÎºÐ..
  end;

  SpellSpend := Round(pcm.Def.wSpell / (pcm.Def.btTrainLv+1) * (pcm.Level+1)) + pcm.Def.btDefSpell;

  if (SpellSpend <= g_MyHero.m_Abil.MP) or (pcm.Def.btEffectType = 0) then begin
    if (pcm.Def.btEffectType = 0) then begin     //°Ë¹ý,È¿°ú¾øÀ½

        if pcm.Def.wMagicId = 26 then begin //¿°È­°á
          if GetTickCount - g_dwLatestFireHitTick < 10000 then begin
            Exit;
          end;   
        end;

        if pcm.Def.wMagicId = 38 then begin //½Ö·æÂü
           meff := TCharEffect.Create (210, 6, g_MyHero);
           meff.NextFrameTime := 120;
           meff.ImgLib := g_WMagic2Images;
           PlayScene.m_EffectList.Add (meff);
        end;
        if CheckUseMagicHeroWeapon(pcm.Def.wMimicID) then begin
          if GetTickCount - g_dwLatestSpellTick > 500 then begin
            g_dwLatestSpellTick := GetTickCount;
            g_dwMagicDelayTime := 0; //pcm.Def.DelayTime;
            SendClientMessage(CM_HEROSPELL, 0, 0, 1, pcm.Def.wMagicId);
          end;
        end;
    end else begin

      g_MagicTarget:=g_FocusCret;

      if not PlayScene.IsValidActor (g_MagicTarget) then g_MagicTarget := nil;

      if (g_MagicTarget = nil) then begin
        PlayScene.CXYfromMouseXYMid (tx, ty, targx, targy); //¸¶¹ý Á¤È®µµ
        targid := 0;
      end else begin
        targx := g_MagicTarget.m_nCurrX;
        targy := g_MagicTarget.m_nCurrY;
        targid := g_MagicTarget.m_nRecogId;
      end;

      if CanNextHeroAction and ServerAcceptNextAction then begin
        if CheckUseMagicHeroWeapon(pcm.Def.wMimicID) and CheckUseMagicHerobujuk(pcm.Def.wMimicID) then begin
          g_dwLatestSpellTick := GetTickCount;
          g_dwMagicDelayTime := 200 + pcm.Def.dwDelayTime;

          g_dwMagicPKDelayTime := 0;
          if g_MagicTarget <> nil then
          if g_MagicTarget.m_btRace = 0 then
            g_dwMagicPKDelayTime := 300 + Random(1100); //(600+200 + MagicDelayTime div 5);
          SendClientMessage(CM_HEROSPELL, targid, targx, targy, pcm.Def.wMagicId);
        end;
      end;
    end;
  end else DScreen.AddSysMsg('Ó¢ÐÛµÄÄ§·¨Öµ²»×ã¡£', 40,60, clYellow);
end;


function TfrmMain.FindMagic(wMagicId: Word): PTClientMagic;
var
  I: Integer;
  pm: PTClientMagic;
begin
  Result := nil;
  for I := 0 to g_MagicList.Count - 1 do begin
    pm := PTClientMagic(g_MagicList[I]);
    if pm.Def.wMagicId = wMagicId then begin
      Result := pm;
      Break;
    end;
  end;
end;

procedure TfrmMain.UseMagicSpell (who, effnum, targetx, targety, magic_id: integer);
var
   actor: TActor;
   adir: integer;
   UseMagic: PTUseMagicInfo;
begin
   actor := PlayScene.FindActor (who);
   if actor <> nil then begin
      adir := GetFlyDirection (actor.m_nCurrX, actor.m_nCurrY, targetx, targety);
      new (UseMagic);
      FillChar (UseMagic^, sizeof(TUseMagicInfo), #0);
      UseMagic.EffectNumber := effnum; //magnum;
      UseMagic.ServerMagicCode := 0;
      UseMagic.MagicSerial := magic_id;
      actor.SendMsg (SM_SPELL, 0, 0, adir, Integer(UseMagic), 0, '', 0);
      Inc (g_nSpellCount);
   end else
      Inc (g_nSpellFailCount);
end;

procedure TfrmMain.UseMagicFire (who, efftype, effnum, targetx, targety, target: integer);
var
   actor: TActor;
   sound: integer;
begin
   sound:=0;
   actor := PlayScene.FindActor (who);
   if actor <> nil then begin

      actor.SendMsg (SM_MAGICFIRE, target{111magid}, efftype, effnum, targetx, targety, '', sound);
      //efftype = EffectType
      //effnum = Effect

      //if actor = Myself then Dec (SpellCount);
      if g_nFireCount < g_nSpellCount then
         Inc (g_nFireCount);
   end;
   g_MagicTarget := nil;
end;

procedure TfrmMain.UseMagicFireFail (who: integer);
var
   actor: TActor;
begin
   actor := PlayScene.FindActor (who);
   if actor <> nil then begin
      actor.SendMsg (SM_MAGICFIRE_FAIL, 0, 0, 0, 0, 0, '', 0);
   end;
   g_MagicTarget := nil;
end;


procedure TFrmMain.UseLoopNormalEffect(ActorID: integer; EffectIndex, LoopTime: word);
var
  actor: TActor;
  meff:  TMagicEff;
begin
  meff  := nil;
  if not g_boEffect then Exit;
  actor := PlayScene.FindActor(ActorID);

  case EffectIndex of
    NE_CLONEHIDE: //ºÐ½Å¼ú-ºÐ½Å »ç¶óÁö´Â ÀÓÆåÆ®
      begin
         meff := TCharEffect.Create (690, 10, actor);
         meff.NextFrameTime := 150;
         meff.RepeatUntil := 0;
         PlaySound (48);
      end;

    NE_MONCAPTURE{9}: //Æ÷½Â°Ë-Æ÷È¹ ÀÓÆåÆ®
      begin
         meff := TCharEffect.Create (1020, 8, actor);
         meff.NextFrameTime := 110;
         meff.RepeatUntil := GetTickCount + LoopTime;
         meff.ImgLib := g_WMagic2Images;
         PlaySound (10475);
      end;

    NE_REVIVALCHARGE: //¼Ò»ý¼ú
    begin
      meff := TCharEffect.Create(1680, 10, actor);
      meff.NextFrameTime := 100;
      meff.RepeatUntil := GetTickCount + 5000;
      meff.ImgLib := g_WMagic2Images;
      PlaySound (10544);
    end;

    NE_LEVELUP:
      begin
         PlaySound(156);
         meff := TCharEffect.Create (1180, 16, actor);
         meff.NextFrameTime := 100;
         meff.RepeatUntil := GetTickCount + LoopTime;
         meff.ImgLib := g_WMagic2Images;
      end;

    NE_RELIVE: begin
         meff := TCharEffect.Create (1220, 20, actor);
         meff.NextFrameTime := 100;
         meff.RepeatUntil := 0;
         meff.ImgLib := g_WMagic2Images;
        PlaySound(10543);
    end;
  end;

  if meff <> nil then begin
     // meff.ImgLib := g_WMagic2Images;
      PlayScene.m_EffectList.Add (meff);
   end;
end;



procedure TfrmMain.EatItem (idx: integer);
begin
   if idx in [0..MAXBAGITEMCL-1] then begin
      if (g_EatingItem.S.Name <> '') and (GetTickCount - g_dwEatTime > 5 * 1000) then begin
         g_EatingItem.S.Name := '';
      end;
      if (g_EatingItem.S.Name = '') and (g_ItemArr[idx].S.Name <> '') and (g_ItemArr[idx].S.StdMode <= 3)  then begin        //¹°¾à
         if g_ItemArr[idx].Amount <= 1 then begin   //¹°¾à
           g_EatingItem := g_ItemArr[idx];
           g_ItemArr[idx].S.Name := '';
         end;
         if (g_ItemArr[idx].S.StdMode = 4) and (g_ItemArr[idx].S.Shape < 100) then begin
            if (g_ItemArr[idx].S.Shape < 50) or (g_ItemArr[idx].S.Shape = 99) then begin
               if mrYes <> FrmDlg.DMessageDlg ('ÄãÈ·¶¨ÒªÑ§Ï°¼¼ÄÜ' + g_ItemArr[idx].S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
                  g_ItemArr[idx] := g_EatingItem;
                  exit;
               end;
            end else begin
               if mrYes <> FrmDlg.DMessageDlg ('ÄãÈ·¶¨ÒªÊ¹ÓÃ' + g_ItemArr[idx].S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
                  g_ItemArr[idx] := g_EatingItem;
                  exit;
               end;
            end;
         end;
         g_dwEatTime := GetTickCount;
         BeltchekClick := GetTickCount;
         SendEat (g_ItemArr[idx].MakeIndex, g_ItemArr[idx].S.Name );
         ItemUseSound (g_ItemArr[idx].S.StdMode);
         if idx in [0..5] then
         Fillquickslots(g_EatingItem.S.Name,g_EatingItem.S.StdMode,idx);  //°¡¹æÂü ÅÛ»ç¶óÁö´Â ¹ö±×?
      end;
   end else begin
      if (idx = -1) and g_boItemMoving then begin
         g_boItemMoving := FALSE;
         if g_MovingItem.Item.Amount <= 1 then begin   //¹°¾à
           g_EatingItem := g_MovingItem.Item;
           g_MovingItem.Item.S.Name := '';
         end else begin
           if g_EatOp then
            g_dwEatOpTime:= GetTickCount;     //¹°¾à
           g_EatingItem := g_MovingItem.Item;
           g_ItemArr[g_MovingItem.Index] := g_EatingItem;
         end;
         if (g_EatingItem.S.StdMode = 4) and (g_EatingItem.S.Shape < 100) then begin
            if (g_EatingItem.S.Shape < 50) or (g_EatingItem.S.Shape = 99)then begin
               if mrYes <> FrmDlg.DMessageDlg ('ÄãÈ·¶¨ÒªÑ§Ï°¼¼ÄÜ' + g_EatingItem.S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
                  AddItemBag (g_EatingItem);
                  exit;
               end;
            end else begin
               if mrYes <> FrmDlg.DMessageDlg ('ÄãÈ·¶¨ÒªÊÇÓÃ' + g_EatingItem.S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
                  AddItemBag (g_EatingItem);
                  exit;
               end;
            end;
         end;
         g_dwEatTime := GetTickCount;
         BeltchekClick := GetTickCount;
         SendEat (g_EatingItem.MakeIndex, g_EatingItem.S.Name );
         ItemUseSound (g_EatingItem.S.StdMode);
         if g_MovingItem.Index in [0..5] then
           Fillquickslots(g_EatingItem.S.Name,g_EatingItem.S.StdMode,g_MovingItem.Index);  //¹°¾à
      end;
   end;
end;


procedure TfrmMain.GetMoveHPShow(Actor: TActor; nCount: Word);    //Æ®ÑªÖµ
var
  MoveShow: pTMoveHMShow;
  str: string;
  i, n: integer;
  d: TDirectDrawSurface;
  boAdd: Boolean;
begin
  if (g_MySelf = nil) or (not g_boShowHealth) or (Actor = nil) or (actor.m_btRace in [50,240..251]) then exit;
  with Actor do begin
    n := 0;
    boAdd := False;
    New(MoveShow);
    MoveShow.dwMoveHpTick := GetTickCount;
    if nCount > 0 then begin
      if nCount >= 300 then begin
        n := 24;
      end else begin
        n := 0;
      end;
      str := IntToStr(nCount);
      MoveShow.Surface := nil;
      MoveShow.Surface := TDirectDrawSurface.Create(DxDraw.DDraw);
      MoveShow.Surface.SystemMemory := True;
      MoveShow.Surface.SetSize(Length(str) * 9, 14);
      if MoveShow.Surface = nil then Exit;
      MoveShow.Surface.Fill(0);
      for I := 1 to Length(str) do begin
        d := g_WAresImages.Images[80 + n + StrToIntDef(Str[I], 0)];
        if d <> nil then begin
          MoveShow.Surface.Draw((I - 1) * 9, 0, d.ClientRect, d, False);
          boAdd := True;
        end;
      end;
    end
    else begin
      d := g_WAresImages.Images[116];
      if d <> nil then begin
        MoveShow.Surface := nil;
        MoveShow.Surface := TDirectDrawSurface.Create(DxDraw.DDraw);
        MoveShow.Surface.SystemMemory := True;
        MoveShow.Surface.SetSize(Length(str) * 9, 12);
        if MoveShow.Surface = nil then Exit;
        MoveShow.Surface.Fill(0);

        MoveShow.Surface.Draw(0, 0, d.ClientRect, d, False);
        boAdd := True;
      end;
    end;
    if boAdd then begin
      m_nMoveHpList.Add(MoveShow);          //Å¸°ÝÄ¡
    end
    else begin
      MoveShow.Surface.Free;
      Dispose(MoveShow);
    end;
  end;
end;


function  TfrmMain.TargetInSwordLongAttackRange (ndir: integer): Boolean;
var
   nx, ny: integer;
   actor: TActor;
begin
   Result := FALSE;
   GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, ndir, nx, ny);
   GetFrontPosition (nx, ny, ndir, nx, ny);
   if (abs(g_MySelf.m_nCurrX - nx) = 2) or (abs(g_MySelf.m_nCurrY-ny) = 2) then begin
      actor := PlayScene.FindActorXY (nx, ny);
      if actor <> nil then
         if not actor.m_boDeath then
            Result := TRUE;
   end;
end;

function  TfrmMain.TargetInSwordWideAttackRange (ndir: integer): Boolean;
var
   nx, ny, rx, ry, mdir: integer;
   actor, ractor: TActor;
begin
   Result := FALSE;
   GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, ndir, nx, ny);
   actor := PlayScene.FindActorXY (nx, ny);

   mdir := (ndir + 1) mod 8;
   GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
   ractor := PlayScene.FindActorXY (rx, ry);
   if ractor = nil then begin
      mdir := (ndir + 2) mod 8;
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
      ractor := PlayScene.FindActorXY (rx, ry);
   end;
   if ractor = nil then begin
      mdir := (ndir + 7) mod 8;
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
      ractor := PlayScene.FindActorXY (rx, ry);
   end;

   if (actor <> nil) and (ractor <> nil) then
      if not actor.m_boDeath and not ractor.m_boDeath then
         Result := TRUE;
end;
function  TfrmMain.TargetInSwordCrsAttackRange (ndir: integer): Boolean;
var
   nx, ny, rx, ry, mdir: integer;
   actor, ractor: TActor;
begin
   Result := FALSE;
   GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, ndir, nx, ny);
   actor := PlayScene.FindActorXY (nx, ny);

   mdir := (ndir + 1) mod 8;
   GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
   ractor := PlayScene.FindActorXY (rx, ry);
   if ractor = nil then begin
      mdir := (ndir + 2) mod 8;
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
      ractor := PlayScene.FindActorXY (rx, ry);
   end;
   if ractor = nil then begin
      mdir := (ndir + 7) mod 8;
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, mdir, rx, ry);
      ractor := PlayScene.FindActorXY (rx, ry);
   end;

   if (actor <> nil) and (ractor <> nil) then
      if not actor.m_boDeath and not ractor.m_boDeath then
         Result := TRUE;
end;

{--------------------- Mouse Interface ----------------------}

procedure TfrmMain.DXDrawMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
   mx, my, sel: integer;
   target: TActor;
   itemnames: string;
   FColor : TColor;
begin
   if g_DWinMan.MouseMove (Shift, X, Y) then exit;
   if (g_MySelf = nil) or (DScreen.CurrentScene <> PlayScene) then exit;
   g_boSelectMyself := PlayScene.IsSelectMyself (X, Y);

   target := PlayScene.GetAttackFocusCharacter (X, Y, g_nDupSelection, sel, FALSE);
   if g_nDupSelection <> sel then g_nDupSelection := 0;
   if target <> nil then begin
      if (target.m_sUserName = '') and (GetTickCount - target.m_dwSendQueryUserNameTime > 10 * 1000) then begin
         target.m_dwSendQueryUserNameTime := GetTickCount;
         SendQueryUserName (target.m_nRecogId, target.m_nCurrX, target.m_nCurrY);
      end;
      g_FocusCret := target;
   end else
      g_FocusCret := nil;

   g_FocusItem := PlayScene.GetDropItems (X, Y, itemnames);
   if g_FocusItem <> nil then begin      //¶³¾îÁø ¾ÆÀÌÅÛ ÀÌ¸§º¸±â ¸¶¿ì½º Æ÷Ä¿½º
      PlayScene.ScreenXYfromMCXY (g_FocusItem.X, g_FocusItem.Y, mx, my);
      FColor := clWhite;
      case g_FocusItem.Grade of
        0,1: FColor := clWhite;
        2: FColor := $00FFDF42;    //º¸¹°
        3: FColor := $000075FF;    //¼º¹°
        4: FColor := $00FFAADE;    //½Å¹°
      end;
      DScreen.ShowHintA (mx - (Canvas.TextWidth(g_FocusItem.Name) div 2) + 1, my - 4, itemnames, FColor, TRUE);
   end else
      DScreen.ClearHint;

   g_nMiniMapMaxX := -1;
   g_nMiniMapX := -1;
   FrmDlg2.FaceSelectindex := -1;
   FrmDlg2.GuldSelectindex := -1;

   PlayScene.CXYfromMouseXY (X, Y, g_nMouseCurrX, g_nMouseCurrY);
   g_nMouseX := X;
   g_nMouseY := Y;
   g_MouseItem.S.Name := '';
   g_MouseStateItem.S.Name := '';
   g_MouseUserStateItem.S.Name := '';
   if ((ssLeft in Shift) or (ssRight in Shift) or gAutoRun) and (GetTickCount - mousedowntime > 300) then   //ÁúÁÖ?
      _DXDrawMouseDown(self, mbLeft, Shift, X, Y);

end;

procedure TfrmMain.DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   mousedowntime := GetTickCount;    //ÁúÁÖ
   if g_MaskRun then begin   //º¯½ÅÅ»
     g_nRunReadyCount := 1 ;
   end else begin
     g_nRunReadyCount := 0;
   if g_HumRunDress then begin      //ÁúÁÖ
     g_nRunReadyCount := 1 ;
   end else begin
     g_nRunReadyCount := 0 ;
   end;
   end;
   if m_boWakeUp then exit;
   _DXDrawMouseDown (Sender, Button, Shift, X, Y);
end;

procedure TfrmMain.AttackTarget (target: TActor);
var
   tdir, dx, dy, nHitMsg : integer;
begin
  if (g_MySelf = nil) then exit;
  if (not (g_MySelf.m_btHorse <> 0)) and (not (g_MySelf.m_nState and $00000200 <> 0))  then begin   //°ø°Ý µµÁß È£¶ûÀÌ Å¸¸é °ø°Ý ¸ØÃã.
   if (g_MySelf.m_btJob = 8) then begin   //¿ìÈ­µî¼± ºñ¿¬ÀÚ°´ °ø°Ý
    if g_MySelf.m_btWeapon in [172..179,192..197,200..205,208,209] then  //¿ìÈ­µî¼± ºñ¿¬
      nHitMsg := CM_HITLEFT + Random(2)
    else
      nHitMsg := CM_HIT;
   end else

   if g_MySelf.m_btJob = 3 then begin   //ÀÚ°´ °ø°Ý
    if (g_MySelf.m_btWeapon > 179) and (g_MySelf.m_btWeapon < 220) then begin    //ÀÚ°´ ¹«±â ÀÏ¶§
      nHitMsg := CM_HITLEFT + Random(2);
    end else
      nHitMsg := CM_HIT;
    if (g_MySelf.m_btWeapon = 0) or (g_MySelf.m_btWeapon = 1) then begin
      nHitMsg := CM_HITLEFT + Random(2);
    end;
   end else
    nHitMsg := CM_HIT;


   if g_UseItems[U_WEAPON].S.StdMode = 6 then nHitMsg := CM_HEAVYHIT;
   if (g_MySelf.m_btMask > 0) and (g_MySelf.m_btMask <> 255) then nHitMsg := CM_HIT;       //º¯½ÅÅ»

   tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, target.m_nCurrX, target.m_nCurrY);

   if (abs(g_MySelf.m_nCurrX - target.m_nCurrX) <= 1) and (abs(g_MySelf.m_nCurrY-target.m_nCurrY) <= 1) and (not target.m_boDeath) then begin
      if CanNextAction and ServerAcceptNextAction and CanNextHit then begin

         if g_boNextTimeFireHit and (g_MySelf.m_Abil.MP >= 7) then begin
            g_boNextTimeFireHit := FALSE;
            nHitMsg := CM_FIREHIT;
         end else
         if g_boNextTimeDeathHit and (g_MySelf.m_Abil.MP >= 7) then begin
            g_boNextTimeDeathHit := FALSE;
            nHitMsg := CM_DEATHHIT;
         end else
         if g_boNextTimePowerHit then begin
            g_boNextTimePowerHit := FALSE;
            nHitMsg := CM_POWERHIT;
         end else
         if g_boCanTwnHit and (g_MySelf.m_Abil.MP >= 10) then begin
            g_boCanTwnHit := FALSE;
            nHitMsg := CM_TWINHIT;
         end else
         if g_boCanThwnHit and (g_MySelf.m_Abil.MP >= 12) then begin
            g_boCanThwnHit := FALSE;
            nHitMsg := CM_THUNDERHIT;
         end else
         if g_boFireShHit and (g_MySelf.m_Abil.MP >= 20) then begin
            g_boFireShHit := FALSE;
            nHitMsg := CM_FIRESHAOLIN;
         end else
         if g_boCanWideHit and (g_MySelf.m_Abil.MP >= 3) then begin //and (TargetInSwordWideAttackRange (tdir)) then begin
            nHitMsg := CM_WIDEHIT;
         end else
         if g_boCanCrsHit and (g_MySelf.m_Abil.MP >= 6) then begin
            nHitMsg := CM_CRSHIT;
         end else
         if g_boCanNanCrsHit and (g_MySelf.m_Abil.MP >= 6) then begin
            nHitMsg := CM_NANCRSHIT;
         end else
         if g_boCanCrsBHit and (g_MySelf.m_Abil.MP >= 6) then begin
            nHitMsg := CM_CRBHIT;
         end else
         if g_boCanLongHit and (TargetInSwordLongAttackRange (tdir)) then begin
            nHitMsg := CM_LONGHIT;
         end else
         if g_boCanTaguHit and (g_MySelf.m_Abil.MP >= 5) then begin     //Å¸±¸ºÀ¹ý - ½Â·Á
            nHitMsg := CM_TAGUHIT;
         end else
         if g_boCanWBHit and (g_MySelf.m_Abil.MP >= 3) then begin //Ç³°Ë¼ú
             nHitMsg := CM_WBHIT;
            g_MySelf.SendMsg (nHitMsg, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
             nHitMsg := CM_WBHIT2;
         end;

         g_MySelf.SendMsg (nHitMsg, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
         g_dwLatestHitTick := GetTickCount;
         if (Target.m_btRace <> RCC_MERCHANT) and not (Target.m_btRace in [240..251]) and (target.m_btRace <> RCC_GUARD) then begin
          if target.m_Abil.HP > 5 then begin
            target.m_noInstanceOpenHealth:= TRUE;
            target.m_dwOpenHealthTime:=3*1000;
            target.m_dwOpenHealthStart:=GetTickCount;      //ÇÇÅë
          end;
         end;
      end;
      g_dwLastAttackTick := GetTickCount;
   end else begin
      if (abs(g_MySelf.m_nCurrX - target.m_nCurrX) <= 2) and (abs(g_MySelf.m_nCurrY-target.m_nCurrY) <= 2) and (not target.m_boDeath) then
         g_ChrAction := caWalk
      else g_ChrAction := caWalk;
      GetBackPosition (target.m_nCurrX, target.m_nCurrY, tdir, dx, dy);
      g_nTargetX := dx;
      g_nTargetY := dy;
   end;
  end;
end;

procedure TfrmMain._DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   tdir, nx, ny, nHitMsg, sel: integer;
   target: TActor;
   itemnames: String;
begin
   ActionKey := 0;
   g_nMouseX := X;
   g_nMouseY := Y;
   g_boAutoDig := FALSE;

   if (Button = mbRight) and g_boItemMoving then begin      //ÊÇ·ñµ±Ç°ÔÚÒÆ¶¯ÎïÆ·
     FrmDlg.CancelItemMoving;
     exit;
   end;
   if g_DWinMan.MouseDown (Button, Shift, X, Y) then exit; //Êó±êÒÆµ½´°¿ÚÉÏÁËÔòÌø¹ý
   if (g_MySelf = nil) or (DScreen.CurrentScene <> PlayScene) then exit;  //Èç¹ûÈËÎïÍË³öÔòÌø¹ý

   if ssMiddle in Shift then begin
      g_nRunReadyCount := 0;
      if gAutoRun then begin
         gAutoRun := False;
         DScreen.AddSayMsg('<¹Ø±Õ×Ô¶¯ÅÜ¹¦ÄÜ>', clGreen, clWhite, True, us_Sys);
      end
      else begin
         gAutoRun := True;
         DScreen.AddSayMsg('<¿ªÆô×Ô¶¯ÅÜ¹¦ÄÜ>', clGreen, clWhite, True, us_Sys);
      end;
   end
   else if ssLeft in Shift then begin
      if gAutoRun then begin
         g_nRunReadyCount := 0;
         gAutoRun := False;
         DScreen.AddSayMsg('<¹Ø±Õ×Ô¶¯ÅÜ¹¦ÄÜ>', clGreen, clWhite, True, us_Sys);
      end;
   end;

   if g_boAutoMoveing then begin
      g_boAutoMoveing := False;
      g_boNpcMoveing := False;
      g_nMiniMapMoseX := -1;
      g_nMiniMapMoseY := -1;
      g_nMiniMapOldX := -1;
      DScreen.AddSysMsg('[Í£Ö¹×Ô¶¯ÒÆ¶¯¡£]', 40, 60, clYellow);
      g_nMiniMapPath := nil;
   end;

   if (ssRight in Shift) or gAutoRun then begin
      if Shift = [ssRight] then Inc (g_nDupSelection);          //°ãÃÆÀ» °æ¿ì ¼±ÅÃ
      target := PlayScene.GetAttackFocusCharacter (X, Y, g_nDupSelection, sel, FALSE);  //¸ðµÎ..
      if g_nDupSelection <> sel then g_nDupSelection := 0;
      if target <> nil then begin
         if ssCtrl in Shift then begin     //ÄÁÆ®·Ñ+¿À¸¥ÂÊÅ¬¸¯ = »ó´ë Á¤º¸ º¸±â
            if GetTickCount - g_dwLastMoveTick > 1000 then begin          //¶Ù´Ù°¡ »ó´ë¹æ Á¤º¸°¡ ¾È³ª¿À°Ô ÇÏ·Á°í
               if (target <> g_MySelf) and ((target.m_nState and $00000200 <> 0) or (target.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(target.m_sUserName)) then begin
               end else begin
                 if (target.m_btRace = 0) and (not target.m_boDeath) and (Not g_boDeathMatch) and (not g_boPKZONE) then begin     //»ó´ë¹æ Á¤º¸ º¸±â
                   SendClientMessage (CM_QUERYUSERSTATE, target.m_nRecogId, target.m_nCurrX, target.m_nCurrY, 0);
                   exit;
                 end;
               end;
            end;
         end;
      end else
         g_nDupSelection := 0;

      if g_MySelf.m_boStartStore then Exit; //°³ÀÎ»óÁ¡

      PlayScene.CXYfromMouseXY (X, Y, g_nMouseCurrX, g_nMouseCurrY);
      if g_MyHero <> nil then begin
        if ssCtrl in Shift then begin
          tdir := GetNextDirection(g_MyHero.m_nCurrX, g_MyHero.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
          if CanNextHeroAction and (GetTickCount - g_dwLastHeroTurnTick > 1000)then begin
            g_dwLastHeroTurnTick := GetTickCount();
            g_MyHero.HeroTurn(g_MyHero.m_nCurrX, g_MyHero.m_nCurrY, tdir);
          end;
          exit;
        end;
      end;

      if (abs(g_MySelf.m_nCurrX - g_nMouseCurrX) <= 2) and (abs(g_MySelf.m_nCurrY - g_nMouseCurrY) <= 2) then begin  //¹æÇâÅÏ/
         tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
         if CanNextAction and ServerAcceptNextAction then begin
            g_MySelf.SendMsg (CM_TURN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
         end;
      end else begin    //¶Ù±â
         g_ChrAction := caRun;
         g_nTargetX := g_nMouseCurrX;
         g_nTargetY := g_nMouseCurrY;
         exit;
      end;
   end;

   if ssLeft in Shift then begin
     if g_MyHero <> nil then begin
       if ssCtrl in Shift then begin
         if GetTickCount - g_dwLastHeroMoveTick > 3000 then begin  //¿µ¿õ ÀÌµ¿
           g_dwLastHeroMoveTick := GetTickCount();
           g_MyHero.target;
           exit;
         end;
       end;
     end;
     //°ø°Ý... ³ÐÀº ¹üÀ§·Î ¼±ÅÃµÊ
      target := PlayScene.GetAttackFocusCharacter (X, Y, g_nDupSelection, sel, TRUE);
      PlayScene.CXYfromMouseXY (X, Y, g_nMouseCurrX, g_nMouseCurrY);
      g_TargetCret := nil;

      if (g_UseItems[U_WEAPON].S.Name <> '') and (target = nil)
         and not (g_MySelf.m_btHorse <> 0) and (not g_MySelf.m_boStartStore) and not (g_MySelf.m_nState and $00000200 <> 0) then begin   //È£¶ûÀÌ Å¸¸é °î±ªÀÌÁú ¾ÈµÊ
         if g_UseItems[U_WEAPON].S.Shape = 19 then begin //°î±ªÀÌ
            tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
            GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, nx, ny);
            if not Map.CanMove(nx, ny) or (ssShift in Shift) then begin
               if CanNextAction and ServerAcceptNextAction and CanNextHit then begin
                  g_MySelf.SendMsg (CM_HIT+1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
               end;
               g_boAutoDig := TRUE;
               exit;
            end;
         end;

         if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin  //³¬½Ã ±âº»
           tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
           GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, nx, ny);
           if Map.MoveFish(nx, ny) and (not g_FishingOk) then begin   //³¬½Ã Áß È®ÀÎ
             if GetTickCount - g_dwFishSetTick > 3 * 1000 then begin
               if (g_MySelf.m_btJob in [4, 9]) then begin    //½Â·Á ÆÄ°è½Â ³¬½Ã
                 if (g_MySelf.m_btMask <> 0) then begin
                   g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                   StartFishing;  //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
                   PlaySound2 (s_fishingwater);
                   g_boAutoDig := False;   //±¤
                   g_dwFishSetTick := GetTickCount;
                   exit;
                 end else begin
                   DScreen.AddSysMsg('<CO$FFFF>[ÏµÍ³]<CE> ºÍÉÐ <CO$FFFF>±äÉíºó<CE> ¿ÉÒÔÊ¹ÓÃµöÓã¹¦ÄÜ¡£',40, 60, clWhite);
                   exit;
                 end;
               end else begin
                 g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                 StartFishing;  //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
                 PlaySound2 (s_fishingwater);
                 g_boAutoDig := False;   //±¤
                 g_dwFishSetTick := GetTickCount;
                 exit;
               end;
             end;
           end;
         end;

      end;

      if target = nil then begin
        if PlayScene.IsSelectMyself(X, Y) and (g_MySelf <> nil) and (not g_MySelf.m_boDeath) and g_MySelf.m_boStartStore then begin//°³ÀÎ»óÁ¡
          if GetTickCount - g_dwQueryStoreTick > 1000 then begin
            g_dwQueryStoreTick := GetTickCount;
            SendClientMessage(CM_QUERYSTORE, g_MySelf.m_nRecogId, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, 0);
          end;
          Exit;
        end;
      end;

      if (ssAlt in Shift) and not (g_MySelf.m_btHorse <> 0) and (not g_MySelf.m_boStartStore) then begin
         //°í±â
         tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
         if CanNextAction and ServerAcceptNextAction then begin
            target := PlayScene.ButchAnimal (g_nMouseCurrX, g_nMouseCurrY);    //¾Õ¿¡ µ¿¹° ½ÃÃ¼°¡ ÀÖ´Â °æ¿ì
            if target <> nil then begin
               SendButchAnimal (g_nMouseCurrX, g_nMouseCurrY, tdir, target.m_nRecogId);
               g_MySelf.SendMsg (CM_SITDOWN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
               exit;
            end;
            g_MySelf.SendMsg (CM_SITDOWN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
         end;
         g_nTargetX := -1;
      end else begin

         if (target <> nil) or (ssShift in Shift) then begin    //¿ÞÂÊ¸¶¿ì½º Å¬¸¯ ¶Ç´Â Å¸°ÙÀÌ ÀÖÀ½.
            g_nTargetX := -1;
            if target <> nil then begin
               //°È´Ù°¡ »óÀÎ ¸Þ´º°¡ ³ª¿À´Â °ÍÀ» ¹æÁö.
               if GetTickCount - g_dwLastMoveTick > 1500 then begin
                  if (target.m_btRace = RCC_MERCHANT) and (not g_MySelf.m_boStartStore) and (GetTickCount - g_dwClickNpcTick > 500) then begin
                    if not FrmDlg.DDealDlg.Visible then begin  //°Å·¡Ã¢ ÄÑÀÖÀ¸¸é ¾ÈµÊ
                     //»óÀÎÀÎ °æ¿ì,
                     g_dwClickNpcTick := GetTickCount;
                     SendClientMessage (CM_CLICKNPC, target.m_nRecogId, 0, 0, 0);
                     FrmDlg.CloseMDlg;
                     g_Npcbookinx := -1;
                     exit;
                    end;
                  end;
               end;

               if (not target.m_boDeath) and not (g_MySelf.m_btHorse <> 0) and (not g_MySelf.m_boStartStore) and not (g_MySelf.m_nState and $00000200 <> 0) then begin
                  g_TargetCret := target;
                  if ((target.m_btRace <> RCC_USERHUMAN) and
                      (target.m_btRace <> RCC_GUARD) and
                      (target.m_btRace <> RCC_MERCHANT) and
                      not (target.m_btRace in [240..251]) and
                      (pos('(', target.m_sUserName) = 0)  //ÁÖÀÎ¾ø´Â ¸÷(ÀÖ´Â ¸÷Àº °­Á¦°ø°Ý ÇØ¾ßÇÔ)
                     )
                     or (ssShift in Shift) //»ç¶÷À» ½Ç¼ö·Î °ø°ÝÇÏ´Â °ÍÀ» ¸·À½
                     or (target.m_nNameColor = ENEMYCOLOR)    //ÀûÀº ÀÚµ¿ °ø°ÝÀÌ µÊ
                  then begin
                     AttackTarget (target);     //¸¶¿ì½º Å¬¸¯
                     g_dwLatestHitTick := GetTickCount;
                     {if BoStopAfterAttack then begin
                        BoStopAfterAttack := FALSE;
                        g_TargetCret := nil;
                     end;   }
                  end;
               end;

               if (not target.m_boDeath) and (target.m_btRace = 0) and target.m_boStartStore then begin //°³ÀÎ»óÁ¡
                 if GetTickCount - g_dwQueryStoreTick > 1000 then begin
                   g_dwQueryStoreTick := GetTickCount;
                   SendClientMessage(CM_QUERYSTORE, target.m_nRecogId, target.m_nCurrX, target.m_nCurrY, 0);
                 end;
                 Exit;
               end;
            end else begin
               if (g_MySelf.m_btHorse = 0) and (not g_MySelf.m_boStartStore) and not (g_MySelf.m_nState and $00000200 <> 0) then begin   //È£¶ûÀÌ ¾ÈÅÀÀ»¶§ °ø°Ý
                 tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
                 if CanNextAction and ServerAcceptNextAction and CanNextHit then begin
                   if (g_MySelf.m_btMask > 0) and (g_MySelf.m_btMask <> 255) then begin //º¯½ÅÅ»
                     nHitMsg := CM_HIT+Random(3);
                   end else
                   if g_MySelf.m_btJob = 9 then begin //¿ìÈ­µî¼± °ø°Ý
                     if g_MySelf.m_btWeapon in [172..179,192..197,200..205,208,209] then  //¿ìÈ­µî¼± ºñ¿¬ÀÚ°´ ¸ð¼Ç
                      nHitMsg := CM_HITLEFT+Random(4)
                     else
                      nHitMsg := CM_HIT+Random(3)
                   end else
                   if g_MySelf.m_btJob = 3 then begin   //ÀÚ°´ °ø°Ý
                     if (g_MySelf.m_btWeapon > 179) and (g_MySelf.m_btWeapon < 220) then begin    //ÀÚ°´ ¹«±â
                       nHitMsg := CM_HITLEFT+Random(4);
                     end else
                       nHitMsg := CM_HIT+Random(3);
                     if (g_MySelf.m_btWeapon = 0) or (g_MySelf.m_btWeapon = 1) then begin
                       nHitMsg := CM_HITLEFT+Random(4);
                     end;
                   end else
                   nHitMsg := CM_HIT+Random(3);
                   if g_boCanLongHit and (TargetInSwordLongAttackRange (tdir)) then begin  //ÊÇ·ñ¿ÉÒÔÊ¹ÓÃ´ÌÉ±
                     nHitMsg := CM_LONGHIT;
                   end;
                   if g_boCanTaguHit and (g_MySelf.m_Abil.MP >= 5) then begin  //Å¸±¸ºÀ¹ý - ½Â·Á
                     nHitMsg := CM_TAGUHIT;
                   end;
                   if g_boCanThwnHit and (g_MySelf.m_Abil.MP >= 12) then begin
                     g_boCanThwnHit := FALSE;
                     nHitMsg := CM_THUNDERHIT;
                   end;
                   if g_boFireShHit and (g_MySelf.m_Abil.MP >= 20) then begin
                     g_boFireShHit := FALSE;
                     nHitMsg := CM_FIRESHAOLIN;
                   end;
                   if g_boCanWideHit and (g_MySelf.m_Abil.MP >= 3) and (TargetInSwordWideAttackRange (tdir)) then begin  //ÊÇ·ñ¿ÉÒÔÊ¹ÓÃ°ëÔÂ
                     nHitMsg := CM_WIDEHIT;
                   end;
                   if g_boCanCrsHit and (g_MySelf.m_Abil.MP >= 6) and (TargetInSwordCrsAttackRange (tdir)) then begin  //ÊÇ·ñ¿ÉÒÔÊ¹ÓÃ°ëÔÂ
                     nHitMsg := CM_CRSHIT;
                   end;
                   if g_boCanNanCrsHit and (g_MySelf.m_Abil.MP >= 6) and (TargetInSwordCrsAttackRange (tdir)) then begin  //ÊÇ·ñ¿ÉÒÔÊ¹ÓÃ°ëÔÂ
                     nHitMsg := CM_NANCRSHIT;
                   end;
                   if g_boCanCrsBHit and (g_MySelf.m_Abil.MP >= 6){ and (TargetInSwordCrsAttackRange (tdir)) }then begin
                     nHitMsg := CM_CRBHIT;
                   end;
                   {if g_MySelf.m_btJob = 4 then b¼öegin   //±Ã °ø°Ý
                     g_MySelf.SendMsg (CM_BOW, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                   end else   }
                   g_MySelf.SendMsg (nHitMsg, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                 end;
                 g_dwLastAttackTick := GetTickCount;
               end;
            end;
         end else begin
            if g_MySelf.m_boStartStore then Exit;

            if (g_nMouseCurrX = (g_MySelf.m_nCurrX)) and (g_nMouseCurrY = (g_MySelf.m_nCurrY)) then begin
               if CanNextAction and ServerAcceptNextAction then begin
                  SendPickup;     //ÁÝ±â
               end;
            end else
            if XClickTime + 4000 > GetTickCount then begin
              g_FocusItem := PlayScene.GetPetDropItems (X, Y, itemnames);
              if g_FocusItem <> nil then begin      //¶³¾îÁø ¾ÆÀÌÅÛ ÀÌ¸§º¸±â ¸¶¿ì½º Æ÷Ä¿½º
                if (g_BoPetOn) and (g_nMouseCurrX = g_FocusItem.X) and (g_nMouseCurrY = g_FocusItem.Y) and (itemnames <> '') then begin
                   SendPetPickupMouse;
                   Exit;
                end;
              end;

            end else
             if GetTickCount - g_dwLastAttackTick > 1000 then begin //°ø°ÝÇÏ´Â Å¬¸¯ ½Ç¼öÀÌµ¿À» ¹æÁö
               if ssCtrl in Shift then begin
                 g_ChrAction := caRun;
               end else begin
                 g_ChrAction := caWalk;
               end;
               g_nTargetX := g_nMouseCurrX;
               g_nTargetY := g_nMouseCurrY;
             end;
         end;
      end;
   end;
end;

procedure TfrmMain.DXDrawDblClick(Sender: TObject);
var
   pt: TPoint;
begin
   GetCursorPos (pt);
   pt := ScreenToClient(pt);
   if g_DWinMan.DblClick (pt.X, pt.Y) then exit;
end;

function  TfrmMain.CheckDoorAction (dx, dy: integer): Boolean;
var
   door: integer;
begin
   Result := FALSE;
   //if not Map.CanMove (dx, dy) then begin
      //if (Abs(dx-Myself.XX) <= 2) and (Abs(dy-Myself.m_nCurrY) <= 2) then begin
         door := Map.GetDoor (dx, dy);
         if door > 0 then begin
            if not Map.IsDoorOpen (dx, dy) then begin
               SendClientMessage (CM_OPENDOOR, door, dx, dy, 0);
               Result := TRUE;
            end;    
         end;
      //end;
   //end;
end;

procedure TfrmMain.DXDrawMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FrmDlg.SayDlgDown := False;
   if g_DWinMan.MouseUp (Button, Shift, X, Y) then exit;
   g_nTargetX := -1;
end;

procedure TfrmMain.DXDrawClick(Sender: TObject);
var
   pt: TPoint;
begin
   GetCursorPos (pt);
   pt := ScreenToClient(pt);
   if g_DWinMan.Click (pt.X, pt.Y) then exit;
end;

procedure TfrmMain.MouseTimerTimer(Sender: TObject);
var
   pt: TPoint;
   keyvalue: TKeyBoardState;
   shift: TShiftState;
begin

   GetCursorPos (pt);
   SetCursorPos (pt.X, pt.Y);

   if g_TargetCret <> nil then begin
      if ActionKey > 0 then begin

         ProcessKeyMessages;
      end else begin
         if not g_TargetCret.m_boDeath and PlayScene.IsValidActor(g_TargetCret) then begin
            FillChar(keyvalue, sizeof(TKeyboardState), #0);
            if GetKeyboardState (keyvalue) then begin
               shift := [];
               if ((keyvalue[VK_SHIFT] and $80) <> 0) then shift := shift + [ssShift];
               if ((g_TargetCret.m_btRace <> RCC_USERHUMAN) and
                   (g_TargetCret.m_btRace <> RCC_GUARD) and
                   (g_TargetCret.m_btRace <> RCC_MERCHANT) and
                   not (g_TargetCret.m_btRace in [240..251]) and
                   (pos('(', g_TargetCret.m_sUserName) = 0)      //ÁÖÀÎÀÖ´Â ¸÷(°­Á¦°ø°Ý ÇØ¾ßÇÔ)
                  )
                  or (g_TargetCret.m_nNameColor = ENEMYCOLOR)   //ÀûÀº ÀÚµ¿ °ø°ÝÀÌ µÊ
                  or ((ssShift in Shift) and (not PlayScene.EdChat.Visible)) then begin      //»ç¶÷À» ½Ç¼ö·Î °ø°ÝÇÏ´Â °ÍÀ» ¸·À½
                  AttackTarget (g_TargetCret); //¿ÀÅä
               end;
            end;
         end else
            g_TargetCret := nil;
      end;
   end;
   if g_boAutoDig then begin
      if CanNextAction and ServerAcceptNextAction and CanNextHit then begin
         g_MySelf.SendMsg (CM_HIT+1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
      end;
   end;
   //ÀÚµ¿½Àµæ
   if g_boAutoPuckUpItem and
      (g_MySelf <> nil) and
      ((GetTickCount() - g_dwAutoPickupTick) > g_dwAutoPickupTime) then begin

     g_dwAutoPickupTick:=GetTickCount();
     AutoPickUpItem();
   end;

   //³¬½Ã ÀÚµ¿
   if g_AutoFish then begin
     if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin
       if (g_MySelf.m_btJob in [4, 9]) then begin
         if (g_MySelf.m_btMask <> 0) then begin
           if (GetTickCount() - g_AutoFishTick) > g_AutoFishUpTime then begin
             g_AutoFishTick:=GetTickCount();
             AutoFishEp();
           end;
         end else begin
           DScreen.AddSysMsg('<CO$FFFF>[ÏµÍ³]<CE> ºÍÉÐ <CO$FFFF>±äÉíºó<CE> ¿ÉÒÔÊ¹ÓÃµöÓã¹¦ÄÜ¡£',40, 60, clWhite);
         end;
       end else begin
         if (GetTickCount() - g_AutoFishTick) > g_AutoFishUpTime then begin
           g_AutoFishTick:=GetTickCount();
           AutoFishEp();
         end;
       end;
     end;
   end;

   if GetTickCount > g_dwOperateHintTick then begin
     g_dwOperateHintTick := GetTickCount + 15000;
     Inc(g_nOperateHintIdx);
     if g_nOperateHintIdx >= g_OperateHintList.Count then g_nOperateHintIdx := 0;
     if (g_nOperateHintIdx >= 0) and (g_nOperateHintIdx < g_OperateHintList.Count) then
      if g_OperateHintList[g_nOperateHintIdx] <> '' then
        PlayScene.SetOperateHint(g_OperateHintList[g_nOperateHintIdx])    //¶óÀÎ°øÁö
      else
        g_dwOperateHintTick := 0;
   end;
end;

procedure TfrmMain.AutoPickUpItem;
var
  I: Integer;
  DropItem:pTDropItem;
  ShowItem:pTShowItem;
begin
  if CanNextAction and ServerAcceptNextAction then begin
    if g_AutoPickupList = nil then exit;
      
    g_AutoPickupList.Clear;
    PlayScene.GetXYDropItemsList(g_MySelf.m_nCurrX,g_MySelf.m_nCurrY,g_AutoPickupList);
    for I := 0 to g_AutoPickupList.Count - 1 do begin
      DropItem:=g_AutoPickupList.Items[I];
      ShowItem:=GetShowItem(DropItem.Name);
      if (ShowItem <> nil) and (ShowItem.boAutoPickup) then
        SendPickup;
    end;
  end;
end;


procedure TfrmMain.AutoFishEp();    //³¬½Ã ÀÚµ¿
var
 nx, ny:Integer;
begin
  if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin
    if (g_FishingOk = False) then begin  //³¬½Ã Áß ÀÌ ¾Æ´Ò¶§
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, nx, ny);
      if Map.MoveFish(nx, ny) and (g_UseItems[U_FISH1].S.Name <> '') and (g_UseItems[U_FISH5].S.Name <> '') then begin
        if (g_MySelf.m_btJob in [4, 9]) then begin       //½Â·Á ³¬½Ã
          if (g_MySelf.m_btMask <> 0) then begin
            g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
            g_AutoFishTick:=GetTickCount();
            PlaySound2 (s_fishingwater);
            StartFishing;  //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
            exit;
          end else begin
            DScreen.AddSysMsg('<CO$FFFF>[ÏµÍ³]<CE> ºÍÉÐ <CO$FFFF>±äÉíºó<CE> ¿ÉÒÔÊ¹ÓÃµöÓã¹¦ÄÜ¡£',40, 60, clWhite);
            exit;
          end;
        end else begin
          g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
          g_AutoFishTick:=GetTickCount();
          PlaySound2 (s_fishingwater);
          StartFishing;  //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
          exit;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.WaitMsgTimerTimer(Sender: TObject);
var
  btMapType: Byte;
begin
   if g_MySelf = nil then exit;
   if g_MySelf.ActionFinished then begin
      WaitMsgTimer.Enabled := FALSE;

      case WaitingMsg.Ident of
         SM_CHANGEMAP:  //¸ÊÀÌµ¿
            begin
               FrmDlg.SafeCloseDlg;    //Á¦Á¶½ºÃÄ
               g_boMapMovingWait := FALSE;
               //g_boMapMoving := FALSE;

               Map.m_OldClientRect.Left := -1;
               if g_LegendMap.Title <> WaitingStr then begin
                 ClearBGM;
                 if (g_LegendMap.LoadFormatType(WaitingStr + '.map', btMapType) in [0..2]) then begin
                   g_LegendMap.LoadFileData(WaitingStr + '.map', btMapType);
                 end;
               end;
               g_LegendMap.Title := WaitingStr;

               if g_boAutoMoveing and g_boNpcMoveing and (g_nScriptGotoStr <> '') then
                 g_boNpcMoveing := True
               else
                 g_boNpcMoveing := False;
               g_boAutoMoveing := False;
               g_nMiniMapPath := nil;

               if g_nMDlgX <> -1 then begin
                  FrmDlg.CloseMDlg;
                  g_nMDlgX := -1;
                  g_Npcbookinx := -1;
               end;
               ClearDropItems;
               EventMan.ClearEvents;
               PlayScene.CleanObjects;
               g_sMapTitle := '';
               g_MapDesc := nil;
               PlayScene.SendMsg (SM_CHANGEMAP, 0,
                                    WaitingMsg.Param{x},
                                    WaitingMsg.tag{y},
                                    LOBYTE(WaitingMsg.Series){darkness},
                                    0, 0,
                                    WaitingStr{mapname});

               EffectNum := HIBYTE(WaitingMsg.Series);       //¸¶·æ¹ø°³
               if (EffectNum < 0) then EffectNum := 0;
               if (EffectNum = 1) or (EffectNum = 2) then RunEffectTimer.Enabled := True
               else RunEffectTimer.Enabled := False;

               g_MySelf.CleanCharMapSetting (WaitingMsg.Param, WaitingMsg.Tag);

               g_nTargetX := -1;
               g_TargetCret := nil;
               g_FocusCret := nil;

               {if ((g_nAreaStateValue and $02) <> 0) or ((g_nAreaStateValue and $01) <> 0) or ((g_nAreaStateValue and $08) <> 0) then begin
                 DScreen.AddSysMsg ('Á×¾úÀ»¶§ ¾ÆÀÌÅÛÀ» <CO$FFFF>¶³¾î¶ß¸®Áö ¾Ê´Â<CE> Áö¿ªÀÔ´Ï´Ù.' , 40, 60, clWhite);
               end else begin
                 DScreen.AddSysMsg ('Á×¾úÀ»¶§ ¾ÆÀÌÅÛÀ» <CO$FFFF>¶³¾î¶ß¸± ¼ö ÀÖ´Â<CE> Áö¿ªÀÔ´Ï´Ù.', 40, 60, clWhite);
               end;  }

            end;
      end;
   end;
end;

{----------------------- Socket -----------------------}

procedure TfrmMain.SelChrWaitTimerTimer(Sender: TObject);
begin
   SelChrWaitTimer.Enabled := FALSE;
   SendQueryChr;
end;

procedure TfrmMain.ActiveCmdTimer (cmd: TTimerCommand);
begin
   CmdTimer.Enabled := TRUE;
   TimerCmd := cmd;
end;

procedure TfrmMain.CmdTimerTimer(Sender: TObject);
begin
   CmdTimer.Enabled := FALSE;
   CmdTimer.Interval := 1000;
   case TimerCmd of
      tcSoftClose:
         begin
            CmdTimer.Enabled := FALSE;
            CSocket.Socket.Close;
         end;
      tcReSelConnect:
         begin
            ResetGameVariables;
            DScreen.ChangeScene (stSelectChr);
            g_ConnectionStep := cnsReSelChr;

            if not BoOneClick then begin
              with CSocket do begin
                  Active := FALSE;
                  Address := g_sSelChrAddr;
                  Port := g_nSelChrPort;
                  Active := TRUE;
               end;

            end else begin
               if CSocket.Socket.Connected then
                  CSocket.Socket.SendText ('$S' + g_sSelChrAddr + '/' + IntToStr(g_nSelChrPort) + '%');
               CmdTimer.Interval := 1;
               ActiveCmdTimer (tcFastQueryChr);
            end;

         end;
      tcFastQueryChr:
         begin
            SendQueryChr;
         end;
   end;
end;

procedure TfrmMain.CloseAllWindows;
begin
   with FrmDlg do begin
      DItemBag.Visible := FALSE;
      DMsgDlg.Visible := FALSE;
      DStateWin.Visible := FALSE;
      FrmDlg.CloseHeroAllWindows;
      DHeroMenu.Visible := False;
      if DMerchantDlg.Visible then begin
        DItemBag.Left := 0;
        DMerchantDlg.Visible := FALSE;
      end;
      DSellDlg.Visible := FALSE;
      if DMakeItemDlg.Visible then DMakeItemDlgOkClick(DMakeItemDlgCancel, 0, 0);
      if DDisassembleDlg.Visible then DDisaCloseClick(DDisaClose, 0, 0);
      if DDismantleDlg.Visible then DDismantleCloseClick(DDismantleClose, 0, 0);
      DKeySelDlg.Visible := FALSE;
      if DGroupDlg.Visible then DGrpDlgCloseClick(DGrpDlgClose, 0, 0);
      DDealDlg.Visible := FALSE;         //°Å·¡
      DDealRemoteDlg.Visible := FALSE;         //°Å·¡
      DGuildGrowDlg.Visible := FALSE; //¹®ÆÄ¼ºÀå

      DDRentalDlg.Visible := FALSE;         //´ë¿©
      DRentalRemoteDlg.Visible := FALSE;    //´ë¿©

      DGuildDlg.Visible := FALSE;
      DGuildEditNotice.Visible := FALSE;
      DUserState1.Visible := FALSE;
      DUserInfo.Visible := FALSE;
      DAdjustAbility.Visible := FALSE;

      if DLoverWindow.Visible then   //¿¬ÀÎ ½ºÃÄ
       ToggleShowLoverDlg;
      if DMasterDlg.Visible then //»çÁ¦ ½ºÃÄ
       ToggleShowMasterDlg;

      DMasterDlg.Visible := FALSE;      //»çÁ¦
      DRentalDlg.Visible := FALSE;  //´ë¿©
      if DMailListDlg.Visible then ToggleShowMailListDlg;
      if DBlockListDlg.Visible then ToggleShowBlockListDlg;
      if DMemo.Visible then DMemoCloseClick(DMemoClose, 0, 0);

      if DSales.Visible then CloseItemMarketDlg; //À§Å¹ Á¾·á

      DOptions.Visible := FALSE;

      DShopMenuDlg.Visible := FALSE;
      DItemStore.Visible := FALSE;
      if DItemShopDlg.Visible then   //È¯»óÁ¡ Á¾·á
        DItemShopCloseClick (DItemShopClose, 0, 0);

      if DStoragePWDlg.Visible then DStPWCloseClick(DStPWClose, 0, 0);
      if DSetPassWd.Visible then DSetPWCloseClick(DSetPWClose, 0, 0);
      if DInputStPwd.Visible then DInputStCloseClick(DInputStClose, 0, 0);
      if DChangeStPw.Visible then DCloseChPwClick(DCloseChPw, 0, 0);

      if DWinPet.Visible then //¿µ¹°
        ToggleShowPetDlg;

      if DUpWapondow.Visible then begin
        DUpWapondow.Visible := FALSE;   //Àç·Ã
        DUpWeapon.Visible := False;
        CloseDUpWapon;
      end;
      if DUpCheck.Visible then begin
       DUpCheck.Visible := False;
       CloseDUpWapon2;
      end;
      DHelpWin.Visible := FALSE;

      GiftsDT.Visible := FALSE;
      DDealMsgDlg.Visible := FALSE;  //±³È¯°Å·¡
      DRentalMsgDlg.Visible := FALSE; //´ë¿©°Å·¡
      DTigerDlg.Visible := FALSE;    //È£¶ûÀÌÃ¢
      DFishDlg.Visible := FALSE; //³¬½Ã ¾ÆÀÌÅÛ Ã¢

      DMenuWindows.Visible := False;
      g_boShowFormImage := False;
      PlayScene.EdChat.Visible := FALSE;

      if DStoreGridWin.Visible then CloseStoreDlg;     //°³ÀÎ»óÁ¡
      if DUserStore.Visible then CloseUserStoreDlg;   //°³ÀÎ»óÁ¡
      DStoreMsgDlg.Visible := False;    //°³ÀÎ»óÁ¡

      DComStorage.Visible := False;//°ø¿ëÃ¢°í
      DGuildStorage.Visible := False; //¹®ÆÄÃ¢°í

      LocalLanguage := imSAlpha;
      if DWItemSepa.Visible then ItemSepacloseClick(ItemSepaclose,0,0);

      if DExChangeDlg.Visible then begin
        DExChangeDlg.Visible := False;
        SendCancelExChange;
      end;
      if DBBSListDlg.Visible then begin         //Àå¿ø°Ô½ÃÆÇ
        DBBSListDlg.Visible := False;
        ClearBBSlist();
      end;
      if DBBSMsgDlg.Visible then begin         //Àå¿ø°Ô½ÃÆÇ
       ToggleBBSMsgWindow;
      end;

      if g_CheckEsc and g_FishingOk then begin    //Esc Å°·Î ³¬½Ã Á¾·á ÇÒ°ÇÁö
        ExitFishing;
        g_AutoFish := False;
      end;

      g_boViewMap := FALSE;
      DBigMapDlg.Visible := False;

      m_nStorageMode := 0;  m_Storemode := 0;
      g_Npcbookinx := -1;
      GrowIndex := 0; //¹®ÆÄ¼ºÀå
      if DMacros.Visible then
      begin
      ToggleMacrosFieldVisability;
      DMacros.Visible := False;
      end;
   end;
   with FrmDlg2 do begin
     DWinFriend.Visible := False;
     DGuildMarkDlg.Visible := False;
     DWndFace.Visible := False;
     DWndCompound.Visible := False;
     DWindowTop.Visible := False;
     FboTopSend := False;
   end;
   if g_nMDlgX <> -1 then begin
      FrmDlg.CloseMDlg;
      g_nMDlgX := -1;
      g_Npcbookinx := -1;
   end;
  // g_boItemMoving := FALSE;

   FrmDlg.CancelItemMoving;
   g_MovingItem.Owner := nil;
 //  g_boMsgDlgTimeCheck := False;
 //  FrmDlg.MsgDlgClickTime := GetTickCount; //±×·ì¿ø ¸Þ½ÃÁö ? °ü·Ã
end;

procedure TfrmMain.CloseAllWindows2;
begin
   with FrmDlg do begin
      DWndGroup.Visible := False;
      DViewMiniMap.Visible := False;
      DBottom.Visible := FALSE;
      DItmeDuraWin.Visible := FALSE;
      DItmeDuraWin2.Visible := FALSE;
      DScreen.ClearHint;
      g_boViewMiniMap := FALSE;
      g_boViewMap := FALSE;
      DBigMapDlg.Visible := False;
      DMiniMap.Visible := False;
      DSkillBar.Visible := false;
      DHeroSkillBar.Visible := false;
      FrmDlg.DNeWSay.Visible := False;
      ResetGameVariables; //20110713
      m_TopMsgList.Clear;
      DTopMsg.Visible := False;
      DTopMsg.GSurface.Fill(0);
      ShowHeroControl;
   end;
   with FrmDlg2 do begin
     DBuffDlg.Visible := False;
     DBuffDlg.Left := (g_FScreenWidth - 149);
     DBuffDlg.Top  := 2;
     DHeroBuffDlg.Visible := False;
     DHeroBuffDlg.Left := (g_FScreenWidth - 23);
     DHeroBuffDlg.Top  := 183;
     DCoolBuffDlg.Visible := False;
     DCoolBuffDlg.Left := (g_FScreenWidth - 149);
     DCoolBuffDlg.Top  := 84;
     DWndDeath.Visible := False;
   end;
   if g_nMDlgX <> -1 then begin
      FrmDlg.CloseMDlg;
      g_nMDlgX := -1;
   end;

   FrmDlg.CancelItemMoving;
   g_MovingItem.Owner := nil;
   g_BuffList.Clear;    //¹öÇÁ
   g_HeroBuffList.Clear;
   g_CoolBuffList.Clear;    //ÄðÅ¸ÀÓ¹öÇÁ

    g_AucList.Clear;    //°æ¸Å
end;

procedure TfrmMain.ClearDropItems;
var
  I:Integer;
begin
  for I:=0 to g_DropedItemList.Count - 1 do begin
    Dispose (PTDropItem(g_DropedItemList[I]));
  end;
  g_DropedItemList.Clear;
end;

procedure TfrmMain.ResetGameVariables; //·Î±×¾Æ¿ô
var
   i: integer;
begin
try
   SilenceSound;
   CloseAllWindows;
   ClearDropItems;
   ClearShowItemList();

   for i:=0 to g_MagicList.Count - 1  do begin
    Dispose(pTClientMagic(g_MagicList[i]));
   end;
   g_MagicList.Clear;

   for I := 0 to g_HeroMagicList.Count - 1 do begin
      Dispose(PTClientMagic(g_HeroMagicList[I]));
    end;
    g_HeroMagicList.Clear;


   FrmDlg.closeGiftsDTListDlg;     //È¯»óÁ¡
   m_CoolTimeMSG.Clear;

   DScreen.ClearHint;

    for i := 0 to g_QuestMsgList.Count - 1 do begin
      if pTClientCheckMsg(g_QuestMsgList[i]) <> g_ClientCheckMsg then
        Dispose(pTClientCheckMsg(g_QuestMsgList[i]));
    end;

    if g_ClientCheckMsg <> nil then
      Dispose(g_ClientCheckMsg);
    g_ClientCheckMsg := nil;

   g_boItemMoving := FALSE;
   g_MovingItem.Owner := nil;
   g_WaitingUseItem.Item.S.Name := '';
   g_EatingItem.S.name := '';
   g_HeroEatingItem.S.Name := '';
   g_nTargetX := -1;
   g_TargetCret := nil;
   g_FocusCret := nil;
   g_MagicTarget := nil;
   ActionLock := FALSE;
   g_nMapMusic := -1;
  // PlayMapMusic(False);
   // 2003/04/15 Ä£±¸, ÂÊÁö

   frmDlg.BlackListPage := 0;
   frmDlg.MailPage      := 0;
   frmDlg.BlockPage     := 0;
   frmDlg.CurrentBlock  := -1;
   NotReadMailCount := 0 ;

   g_boHeroAiMode :=0;

   LoverMacro.Enabled:= False;
   // 2003/04/15 Ä£±¸, ÂÊÁö
   BlockLists.Clear;

   for I := 0 to g_SetItemsList.Count - 1 do
      Dispose(pTSetItems(g_SetItemsList[I]));

    g_SetItemsList.Clear;

   for i:=0 to MailLists.Count-1 do            //¸Þ¸ð
      Dispose (PNMailItem (MailLists[i]));
   MailLists.Clear;
   WantMailList := false;               //¸Þ¸ð
   MailAlarm    := false;
   WantBlockList := false;
   fLover.Clear;   //¿¬ÀÎ ½ºÃÄ
   fMentor.Clear; //»çÁ¦ ½ºÃÄ

   g_sGuildRankName := '';
   g_sGuildName := '';                                       
   g_nGuildMark := 0;

   //g_boMapMoving := FALSE;
   WaitMsgTimer.Enabled := FALSE;
   g_boMapMovingWait := FALSE;
   g_boNextTimePowerHit := FALSE;
   g_boCanLongHit := FALSE;
   g_boCanTaguHit := FALSE;
   g_boCanWideHit := FALSE;
   g_boCanCrsHit   := False;
   g_boCanNanCrsHit := False;
   g_boCanTwnHit   := False;
   g_boFireShHit     := False;
   g_boCanThwnHit  := False;
   g_boCanWBHit   := FALSE;       //Ç³°Ë¼ú
   g_boCanCrsBHit  := FALSE;

   m_nStorageMode := 0;
   m_Storemode := 0;
   g_Npcbookinx := -1;
   g_boNextTimeFireHit := FALSE;
   g_boNextTimeDeathHit := FALSE;

   //¿µ¹° ÁÝ±â ¿É¼Ç
   g_boItemAuto       := 1;
   g_boItemAll        := 1;
   g_boItemGold       := 0;
   g_boItemWeapon     := 0;
   g_boItemDress      := 0;
   g_boItemHelmet     := 0;
   g_boItemBoots      := 0;
   g_boItemBelt       := 0;
   g_boItemAccessory  := 0;
   g_boItemEtc        := 0;

   FrmDlg2.ClearCompoundItemInfo(True);

   g_TigerSet:= FALSE; //Å»°Í

   g_HumRunDress := False;
   g_MaskRun := False;
   g_boDropDrug := False;

   g_ShopSort := False;
   g_ShopSortMode := 0;
   g_BoPetOn := False;
   g_CheckPetDB := True;
   g_boDrugOn := False;
   m_boWakeUp := False;
   g_FishingOk := FALSE;        //³¬½Ã Áß È®ÀÎ
   g_boFishCatch := FALSE;    //³¬½Ã ÅÛ ¾ò´Â..
   g_CheckEsc := FALSE;       //Esc Å°·Î ³¬½Ã Á¾·á ÇÒ°ÇÁö
   g_AutoFish := FALSE;
   g_FishTime := 0;
   g_FishTiming := 0;         //³¬À» Å×ÀÌ¹Ö

   g_CheckMacro := False;
   g_boSkillBarNum := 1;
   GroupIdList.Clear;
   ClearGroupMember();


   FillChar (g_StoreItems, SizeOf(TStoreItem) * 15, #0);            //°³ÀÎ»óÁ¡
   FillChar (g_StoreRemoteItems, SizeOf(TStoreItem) * 15, #0);      //°³ÀÎ»óÁ¡
   FillChar (G_UpWaponItem, sizeof(TClientItem)*16, #0);        //Àç·Ã
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);   //¾ÆÀÌÅÛ °¹¼ö
   FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);

   FillChar(g_AutoPotItems, SizeOf(TClientItem) * 2, #0);

   FillChar(g_HeroUseItems, SizeOf(TClientItem) * MAXHEROUSEITEM, #0);
   FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
   MoveingItemIndex := -1;
   FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (G_BuyItem, sizeof(SBuyItem)*MAXBUYITEM, #0);     //»óÀÎ

   with SelectChrScene do begin
      FillChar (ChrArr, sizeof(TSelChar)*4, #0);
      ChrArr[0].FreezeState := TRUE;
      ChrArr[1].FreezeState := TRUE;
      ChrArr[2].FreezeState := TRUE;
      ChrArr[3].FreezeState := TRUE;
   end;
   PlayScene.ClearActors;
   ClearDropItems;
   EventMan.ClearEvents;
   PlayScene.CleanObjects;
   //DxDrawRestoreSurface (self);
   g_MySelf := nil;
   g_MyHero := nil;
   g_QuestMsgList.Clear;
except
//  on e: Exception do
//    PlayScene.MemoLog.Lines.Add(e.Message);
end;
end;

procedure TfrmMain.ChangeServerClearGameVariables;
var
   i: integer;
begin
   CloseAllWindows;
   ClearDropItems;
   for i:=0 to g_MagicList.Count-1 do
      Dispose (PTClientMagic (g_MagicList[i]));
   g_MagicList.Clear;       //¹«°ø »ç¶óÁö´Â ¹ö±×

   for I := 0 to g_HeroMagicList.Count - 1 do begin
     Dispose(PTClientMagic(g_HeroMagicList[I]));
   end;
   g_HeroMagicList.Clear;

   FrmDlg.closeGiftsDTListDlg;      //È¯»óÁ¡
   g_boItemMoving := FALSE;
   g_MovingItem.Owner := nil;
   g_WaitingUseItem.Item.S.Name := '';
   g_EatingItem.S.name := '';
   g_HeroEatingItem.S.Name := '';
   g_nTargetX := -1;
   g_TargetCret := nil;
   g_FocusCret := nil;
   g_MagicTarget := nil;
   ActionLock := FALSE;

   ClearGroupMember();
   GroupIdList.Clear;
   // 2003/04/15 Ä£±¸, ÂÊÁö
   frmDlg.BlackListPage := 0;
   frmDlg.MailPage      := 0;
   frmDlg.BlockPage     := 0;
   frmDlg.CurrentBlock  := -1;
   NotReadMailCount := 0 ;

   g_boHeroAiMode :=0;

   BlockLists.Clear;

   for i:=0 to MailLists.Count-1 do    //¸Þ¸ð
      Dispose (PNMailItem (MailLists[i]));
   MailLists.Clear;
   WantMailList := false;            //¸Þ¸ð
   MailAlarm    := false;
   WantBlockList:= false;

   fLover.Clear;    //¿¬ÀÎ ½ºÃÄ
   fMentor.Clear; //»çÁ¦ ½ºÃÄ
   g_sGuildRankName := '';
   g_sGuildName := '';
   g_nGuildMark := 0;


   m_CoolTimeMSG.Clear;

   //g_boMapMoving := FALSE;
   WaitMsgTimer.Enabled := FALSE;
   g_boMapMovingWait := FALSE;
   g_boNextTimePowerHit := FALSE;
   g_boCanLongHit := FALSE;
   g_boCanTaguHit := FALSE;
   g_boCanWideHit := FALSE;
   g_boCanCrsHit   := False;
   g_boCanNanCrsHit := False;
   g_boCanTwnHit   := False;
   g_boCanThwnHit  := False;
   g_boFireShHit   := False;
   g_boCanWBHit    := FALSE;       //Ç³°Ë¼ú

   g_boCanCrsBHit  := FALSE;

   LoverMacro.Enabled:= False;

   //¿µ¹° ÁÝ±â ¿É¼Ç
   g_boItemAuto       := 1;
   g_boItemAll        := 1;
   g_boItemGold       := 0;
   g_boItemWeapon     := 0;
   g_boItemDress      := 0;
   g_boItemHelmet     := 0;
   g_boItemBoots      := 0;
   g_boItemBelt       := 0;
   g_boItemAccessory  := 0;
   g_boItemEtc        := 0;

   FrmDlg2.ClearCompoundItemInfo(True);

   g_boModeC := 0;
   g_boSkillBarNum := 1;

   g_TigerSet:= FALSE; //Å»°Í

   g_HumRunDress := False;
   g_MaskRun := False;
   g_boDropDrug := False;

   g_BoPetOn := False;
   g_CheckPetDB := True;
   g_boDrugOn := False;
   m_boWakeUp := False;
   g_FishingOk := FALSE;          //³¬½Ã Áß È®ÀÎ
   g_AutoRate := False;
   g_AutoRate := False;
   g_boFishCatch := FALSE;      //³¬½Ã ÅÛ ¾ò´Â..
   g_CheckEsc := FALSE;         //Esc Å°·Î ³¬½Ã Á¾·á ÇÒ°ÇÁö
   g_AutoFish := FALSE;
   g_FishTime := 0;
   g_FishTiming := 0;       //³¬À» Å×ÀÌ¹Ö
   g_AutoRateIn := 0;

   g_CheckMacro := False;

   ClearDropItems;
   EventMan.ClearEvents;
   PlayScene.CleanObjects;

end;

procedure TfrmMain.CSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
   packet: array[0..255] of char;
   strbuf: array[0..255] of char;
   str: string;
begin
   g_boServerConnected := TRUE;
   if g_ConnectionStep = cnsLogin then begin
      if OneClickMode = toKornetWorld then begin
         FillChar (packet, 256, #0);
         str := 'KwGwMGS';             StrPCopy (strbuf, str);  Move (strbuf, (@packet[0])^, Length(str));
         str := 'CONNECT';             StrPCopy (strbuf, str);  Move (strbuf, (@packet[8])^, Length(str));
         str := KornetWorld.CPIPcode;  StrPCopy (strbuf, str);  Move (strbuf, (@packet[16])^, Length(str));
         str := KornetWorld.SVCcode;   StrPCopy (strbuf, str);  Move (strbuf, (@packet[32])^, Length(str));
         str := KornetWorld.LoginID;   StrPCopy (strbuf, str);  Move (strbuf, (@packet[48])^, Length(str));
         str := KornetWorld.CheckSum;  StrPCopy (strbuf, str);  Move (strbuf, (@packet[64])^, Length(str));
         Socket.SendBuf (packet, 256);
      end;
      DScreen.ChangeScene (stLogin);
{$IF USECURSOR = DEFAULTCURSOR}
      DxDraw.Cursor:=crDefault;
{$IFEND}
   end;

   if g_ConnectionStep = cnsSelChr then begin
      LoginScene.OpenLoginDoor;
      SelChrWaitTimer.Enabled := TRUE;
   end;
   if g_ConnectionStep = cnsReSelChr then begin
      CmdTimer.Interval := 1;
      ActiveCmdTimer (tcFastQueryChr);
      with FrmDlg.DscStart do begin
        Enabled := False;
        g_ClientRect := Bounds(SurfaceX(Left), SurfaceY(Top), Width, Height);
      end;
      g_dwReSelConnectTick := GetTickCount + 500;
      g_boReSelConnect := True;
   end;
   if g_ConnectionStep = cnsPlay then begin
      ClearBGM;
      if not g_boServerChanging then begin
         ClearBag;
         ClearStore;

         DScreen.ClearChatBoard;
      end else begin
         ChangeServerClearGameVariables;
      end;
      SendRunLogin;
      ClearBGMEx;
      PlaySound2(bmg_enter);
   end;
   SocStr := '';
   BufferStr := '';
end;

procedure TfrmMain.CSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin                                //·Î±×ÀÎ (¾ÆÀÌµð Á¢¼Ó½Ã°£ ¸Þ½ÃÁö)
   g_boServerConnected := FALSE;
   if (g_ConnectionStep = cnsLogin) and not g_boSendLogin then begin
     FrmDlg.DMessageDlg ('·þÎñÆ÷ÒÑ¶Ï¿ªÁ¬½Ó...', [mbOk]);
     Close;
   end;
   if g_SoftClosed then begin
      g_SoftClosed := FALSE;
      ActiveCmdTimer (tcReSelConnect);
   end;
end;

procedure TfrmMain.CSocketError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
   ErrorCode := 0;
   Socket.Close;
end;

procedure TfrmMain.CSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var
   n: integer;
   data, data2: string;
begin
   data := Socket.ReceiveText;
   //if pos('GOOD', data) > 0 then DScreen.AddSysMsg (data);

   n := pos('*', data);
   if n > 0 then begin
      data2 := Copy (data, 1, n-1);
      data := data2 + Copy (data, n+1, Length(data));
      //SendSocket ('*');
      CSocket.Socket.SendText ('*');
   end;
   SocStr := SocStr + data;
end;

{-------------------------------------------------------------}

procedure TfrmMain.SendSocket (sendstr: string);
const
   code: byte = 1;
begin
   if CSocket.Socket.Connected then begin
      CSocket.Socket.SendText ('#' + IntToStr(code) + sendstr + '!');
     Inc (code);
     if code >= 10 then code := 1;
   end;

end;

procedure TfrmMain.SendLogin (uid, passwd: string);
var
  Msg: TDefaultMessage;
begin
  LoginID := uid;
  LoginPasswd := passwd;
  Msg := MakeDefaultMsg(CM_IDPASSWORD,
    g_FileVersionInfo.wBuild,
    g_FileVersionInfo.wMajor,
    g_FileVersionInfo.wMinor,
    g_FileVersionInfo.wRelease);
  // SendSocket(EncodeMessage(Msg) + EncodeString(uid + '!' + passwd));      //³»²¨ ·Î±×ÀÎ
  // SendSocket(EncodeMessage(Msg) + EncodeString(uid + '%' + passwd));     //³ª³ë ·Î±×ÀÎ
   SendSocket(EncodeMessage(Msg) + EncodeString(uid + '^' + passwd));     //³ªÁ¾¼® ·Î±×ÀÎ
   g_boSendLogin:=True;
end;

procedure TfrmMain.SendNewAccount (ue: TUserEntry; ua: TUserEntryAdd);
var
  msg: TDefaultMessage;
begin
   MakeNewId := ue.sAccount;
   msg := MakeDefaultMsg (CM_ADDNEWUSER, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeBuffer(@ue, sizeof(TUserEntry)) + EncodeBuffer(@ua, sizeof(TUserEntryAdd)));
end;

procedure TfrmMain.SendUpdateAccount (ue: TUserEntry; ua: TUserEntryAdd);
var
  msg: TDefaultMessage;
begin
   MakeNewId := ue.sAccount;
   msg := MakeDefaultMsg (CM_UPDATEUSER, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeBuffer(@ue, sizeof(TUserEntry)) + EncodeBuffer(@ua, sizeof(TUserEntryAdd)));
end;

procedure TfrmMain.SendSelectServer (svname: string);
begin
   g_sServerName := svname;
   SendClientMessage(CM_SELECTSERVER, 0, 0, 0, 0, svname);
end;


procedure TfrmMain.SendChgPw (id, passwd, newpasswd: string);
begin
   SendClientMessage(CM_CHANGEPASSWORD, 0, 0, 0, 0, id + #9 + passwd + #9 + newpasswd);
end;

procedure TfrmMain.SendNewChr (uid, uname, shair, sjob, ssex: string);
begin
   SendClientMessage(CM_NEWCHR, 0, 0, 0, 0, uid + '/' + uname + '/' + shair + '/' + sjob + '/' + ssex);
end;

procedure TfrmMain.SendQueryChr;
begin
   SendClientMessage(CM_QUERYCHR, 0, 0, 0, 0, LoginId + '/' + IntToStr(Certification));
end;

procedure TfrmMain.SendDelChr (chrname: string);
begin
   SendClientMessage(CM_DELCHR, 0, 0, 0, 0,chrname);
end;

procedure TfrmMain.SendSelChr (chrname: string);
begin
   CharName := chrname;
   SendClientMessage(CM_SELCHR, 0, 0, 0, 0, LoginId + '/' + chrname);
   PlayScene.EdAccountt.Visible:=False;
   PlayScene.EdChrNamet.Visible:=False;
end;

procedure TfrmMain.SendViewDelHum;
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_VIEWDELHUM, 0, 0, 0, 0);
  SendSocket(EncodeMessage(msg));
end;

procedure TfrmMain.SendRenewHum(chrname: string);
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_RENEWHUM, 0, 0, 0, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(chrname));
end;

procedure TfrmMain.SendRunLogin;
var
   sSendMsg:String;
begin
   //Ç¿ÐÐµÇÂ¼
   {
   str := '**' +
          PlayScene.EdAccountt.Text + '/' +
          PlayScene.EdChrNamet.Text + '/' +
          IntToStr(Certification) + '/' +
          IntToStr(VERSION_NUMBER) + '/';
  }

(*   str := '**' +
          LoginId + '/' +
          CharName + '/' +
          IntToStr(Certification) + '/' +
          IntToStr(VERSION_NUMBER) + '/';

//          IntToStr(VERSION_NUMBER_0522) + '/';

   //if NewGameStart then begin
   //   str := str + '0';
   //   NewGameStart := FALSE;
   //end else str := str + '1';
   str := str + '9';*)
   sSendMsg:=format('**%s/%s/%d/%d/%d',[LoginId,CharName,Certification,CLIENT_VERSION_NUMBER,RUNLOGINCODE]);
   SendSocket (EncodeString (sSendMsg));

end;

procedure TfrmMain.SendSay (str: string);
  function FormatSayStr(sMsg: string): string;
  var
    nC: Integer;
    s10: string;
    tempstr: string;
    i: integer;
    nmode,ItemIndex: Integer;
    ItemStr,mode, sName,sident: string;
  begin
    nC := 0;
    tempstr := sMsg;
    Result := sMsg;
    while (True) do begin
      if TagCount(tempstr, '}') < 1 then
        break;
      tempstr := ArrestStringEx(tempstr, '{', '}', s10);

      s10 := GetValidStr3(s10, mode, ['/']);
      nmode := StrToInt(mode);
      ItemIndex := StrToIntDef(s10, -1);
      ItemStr := '';
      if ItemIndex > 0 then begin
        for I := Low(g_ItemArr) to High(g_ItemArr) do begin
          if (g_ItemArr[i].s.Name <> '') and (g_ItemArr[i].MakeIndex = ItemIndex) then begin
            ItemStr := '{0/' + IntToStr(g_ItemArr[I].S.Looks) + '/' + FilterShowName(g_ItemArr[i].S,g_ItemArr[i].s.Name) +  '/' +IntToStr(-ItemIndex) + '}';
            break;
          end;
        end;
      end;
      Result := AnsiReplaceText(Result, '{' + mode + '/' + s10 + '}', ItemStr);
      Inc(nC);
      if nC >= 3 then
        break;
    end;
  end;
var
   msg: TDefaultMessage;
begin
   if str <> '' then begin
     if m_boPasswordIntputStatus then begin
       m_boPasswordIntputStatus      := False;
       PlayScene.EdChat.PasswordChar := #0;
       PlayScene.EdChat.Visible      := False;
       SendPassword(str,1);
       exit;
     end;
   {  if CompareLstr(str,'/cmd',length('/cmd')) or CompareLstr(str,'@svninfo',length('@svninfo')) then begin
       ProcessCommand(str);
       exit;
     end;     }

      if str = '/debug check' then begin
        g_boShowMemoLog:=not g_boShowMemoLog;
        PlayScene.MemoLog.Clear;
        PlayScene.MemoLog.Visible:=g_boShowMemoLog;
        exit;
      end;
      if str = '/debug powerblock' then begin
        SendPowerBlock();
        exit;
      end;

      if str = '/check speedhack' then begin
         g_boCheckSpeedHackDisplay := not g_boCheckSpeedHackDisplay;
         exit;
      end;


      if str = '@password' then begin
         if PlayScene.EdChat.PasswordChar = #0 then
            PlayScene.EdChat.PasswordChar := '*'
         else PlayScene.EdChat.PasswordChar := #0;
         exit;   
      end;
      if PlayScene.EdChat.PasswordChar = '*' then
        PlayScene.EdChat.PasswordChar:= #0;

    //  SendClientMessage(CM_SAY, 0, 0, 0, 0, str);

      msg := MakeDefaultMsg(CM_SAY, 0, 0, 0, 0);
      SendSocket(EncodeMessage(msg) + EncodeString(str));

      if str[1] = '/' then begin
        str := GetValidStr3(Copy(str, 2, Length(str) - 1), WhisperName, [' ']);
        if (WhisperName <> '') and {(str <> '') and }(pos('{', WhisperName) = 0) and (pos('#', WhisperName) = 0) then begin
          str := '/' + #7 + WhisperName + #7 + ' ' + FormatSayStr(str);
          DScreen.AddSayMsg(str, GetRGB(180), clWhite, False, us_Whisper);
        end;
      end else
      if (Copy(str, 1, 2) = '¢½') then begin
       if Copy(fLover.GetDisplay(0), length(STR_LOVER) + 1, 6) <> '' then
        DScreen.AddSayMsg(#7 + g_MySelf.m_sUserName + #7 + ': ' + Copy(str, 3, Length(str) - 2), GetRGB(253), clWhite, False, us_Lover);
      end else
      if (Copy(str, 1, 2) = '¡Ý') then
       if fMentor.GetMode = 1 then begin
        if Copy(fMentor.GetDisplay(0), length(STR_PUPIL) + 1, 6) <> '' then
         DScreen.AddSayMsg(#7 + g_MySelf.m_sUserName + #7 + ': ' + Copy(str, 3, Length(str) - 2), GetRGB(219), clWhite, False, us_Master);
       end else begin
        if Copy(fMentor.GetDisplay(0), length(STR_MENTOR) + 1, 6) <> '' then
         DScreen.AddSayMsg(#7 + g_MySelf.m_sUserName + #7 + ': ' + Copy(str, 3, Length(str) - 2), GetRGB(219), clWhite, False, us_Master);
       end;

   end;
end;

procedure TfrmMain.SendActMsg (ident, x, y, dir: integer);
begin
   SendClientMessage(ident, MakeLong(x,y), 0, dir, 0);
   ActionLock := TRUE;
   ActionLockTime := GetTickCount;
   Inc (g_nSendCount);
end;

procedure TfrmMain.SendSpellMsg (ident, x, y, dir, target: integer);
begin
   SendClientMessage(ident, MakeLong(x,y), Loword(target), dir, Hiword(target));   //CM_SPELL
   ActionLock := TRUE;
   ActionLockTime := GetTickCount;
   Inc (g_nSendCount);
end;

procedure TfrmMain.SendQueryUserName (targetid, x, y: integer);
begin
   SendClientMessage(CM_QUERYUSERNAME, targetid, x, y, 0);
end;

procedure TfrmMain.SendDropItem (name: string; itemserverindex: integer);  //¾ÆÀÌÅÛ ¹ö¸²
begin
  SendClientMessage(CM_DROPITEM, itemserverindex, 0, 0, 0, name);
end;

procedure TfrmMain.SendPickup;
begin
   SendClientMessage(CM_PICKUP, 0, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, 0);
end;

procedure TfrmMain.SendPetPickup;
begin
   SendClientMessage(CM_PETBANAUTO, 0, 0, 0, 0);
end;

procedure TfrmMain.SendPetPickupMouse;
begin
   SendClientMessage(CM_PETMOUSE, 0, g_nMouseCurrX, g_nMouseCurrY, 0);
end;

procedure TfrmMain.SendTakeOnItem (where: byte; itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_TAKEONITEM, itmindex, where, 0, 0, itmname);
end;

procedure TfrmMain.SeparateItem(MakeIndex,amount:integer);      //¹°¾à
begin
  SendClientMessage(CM_SEPARITEM, MakeIndex, amount, 0, 0, '');
end;

procedure TfrmMain.BundleItem  (mode,MaxAmount:integer;MakeIndex:string);      //¹°¾à
begin
   SendClientMessage(CM_BUNDLEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.BundleStorageItem  (mode,MaxAmount:integer;MakeIndex:string);      //¹°¾à
begin
  SendClientMessage(CM_BUNDLESTORAGEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.SendTakeOffItem (where: byte; itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_TAKEOFFITEM, itmindex, where, 0, 0, itmname);
end;

procedure TfrmMain.GotoUpwaoinItem(merchant, itemindex: integer; Data: string);  //Àç·Ã
begin
  SendClientMessage(CM_GOTOITEMID, merchant, Loword(itemindex), Hiword(itemindex), 0, Data);
end;


procedure TfrmMain.SendEat (itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_EAT, itmindex, 0, 0, 0, itmname);
end;

procedure TFrmMain.UpgradeItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);  //½ºÃÄ
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_UPGRADEITEM, ItemIndex, Loword(jewelIndex), Hiword(jewelIndex), 0);
   SendSocket (EncodeMessage (msg) + EncodeString (StrItem + '/' + StrJewel));

   FrmDlg.UpgradeItemEffect2;
end;

procedure TFrmMain.UpgradeHeroItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);  //½ºÃÄ
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_HEROUPGRADEIT, ItemIndex, Loword(jewelIndex), Hiword(jewelIndex), 0);
   SendSocket (EncodeMessage (msg) + EncodeString (StrItem + '/' + StrJewel));

   FrmDlg.UpgradeItemEffect2;
end;

procedure TFrmMain.UpgradeItemResult (ItemIndex: integer; wResult : word; str: string);   //º¸¿Á
begin
   FrmDlg.UpgradeItemEffect( wResult);
   PlaySound (10310 );
end;

procedure TfrmMain.SendButchAnimal (x, y, dir, actorid: integer);
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_BUTCH, actorid, x, y, dir);
   SendSocket (EncodeMessage (msg));
end;

procedure TfrmMain.SendMagicKeyChange (magid: integer; keych: char);
begin
   SendClientMessage(CM_MAGICKEYCHANGE, magid, byte(keych), 0, 0);
end;

procedure TfrmMain.SendHeroMagicKeyChange(magid: Integer; keych: Char);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_HEROMAGICKEYCHANGE, magid, Byte(keych), 0, 0);
  SendSocket(EncodeMessage(Msg));
end;

procedure TfrmMain.SendCheckMsgDlgSelect(merchant, nBut: Integer);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_CHECKMSG, merchant, 0, 0, nBut);
  SendSocket(EncodeMessage(Msg));
end;

procedure TfrmMain.SendMerchantDlgSelect (merchant: integer; rstr: string);
var
   param: string;
begin
   if Length(rstr) >= 2 then begin
      if (rstr[1] = '@') and (rstr[2] = '@') then begin
         if rstr = '@@buildguildnow' then
            FrmDlg.DMessageDlg ('ÇëÊäÈëÒª´´½¨µÄÐÐ»áµÄÃû×Ö...', [mbOk, mbAbort])
         else FrmDlg.DMessageDlg ('ÇëÊäÈë...', [mbOk, mbAbort]);
         param := Trim (FrmDlg.DlgEditText);
         rstr := rstr + #13 + param;
      end
      else if CompareLStr(rstr, '@Move(', Length('@Move('))then begin
        FrmDlg.CloseMDlg;
        g_nMDlgX := -1;
        g_Npcbookinx := -1;
        ScriptGoto(rstr);
        exit;
      end;
   end;
   SendClientMessage(CM_MERCHANTDLGSELECT, merchant, 0, 0, 0, rstr);
end;

procedure TfrmMain.SendDismantleItem (merchant, itemindex: integer; itemname: string);     //ÀÏ¹ÝºÐÇØ
begin
  SendClientMessage(CM_DISMANTLE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendDismantlePrice (merchant, itemindex: integer; itemname: string);     //ÀÏ¹ÝºÐÇØ°¡°Ý
begin
   SendClientMessage(CM_PRICEDISMANTLEBLE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendDisassemblePrice (merchant, itemindex: integer; itemname: string);
begin
   SendClientMessage(CM_PRICEDISASSEMBLE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendDisassembleItem (merchant, itemindex: integer; itemname: string);
begin
  SendClientMessage(CM_DISASSEMBLE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendItemWakeUp (mode, itemindex: integer);
begin
   SendClientMessage(CM_ITEMWAKEUP, mode, Loword(itemindex), Hiword(itemindex), 0, '');
end;

procedure TfrmMain.SendQueryPrice (merchant, itemindex: integer; itemname: string);
begin
   SendClientMessage(CM_MERCHANTQUERYSELLPRICE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendQueryRepairCost (merchant, itemindex: integer; itemname: string);
begin
   SendClientMessage(CM_MERCHANTQUERYREPAIRCOST, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendQueryWakeCost(merchant, itemindex: Integer; itemname: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_MERCHANTQUERYWAKECOST, merchant, LoWord(itemindex), HiWord(itemindex), 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itemname));
end;

procedure TfrmMain.SendQueryReStoreCost(merchant, itemindex: Integer; itemname: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_MERCHANTQUERYRESTORECOST, merchant, LoWord(itemindex), HiWord(itemindex), 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itemname));
end;

procedure TfrmMain.SendSellItem (merchant, itemindex: integer; itemname: string{; Amount: Integer});
begin
  SendClientMessage(CM_USERSELLITEM, merchant, Loword(itemindex), Hiword(itemindex), {Amount}0, itemname);
end;

procedure TfrmMain.SendItemLock(merchant, itemindex: Integer; itemname: string);
begin
  SendClientMessage(CM_USERITEMLOCK, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendItemWake(merchant, itemindex: Integer; itemname: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_USERITEMWAKE, merchant, LoWord(itemindex), HiWord(itemindex), 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itemname));
end;

procedure TfrmMain.SendItemReStore(merchant, itemindex: Integer; itemname: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_USERITEMRESTORE, merchant, LoWord(itemindex), HiWord(itemindex), 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itemname));
end;

procedure TfrmMain.SendRepairItem (merchant, itemindex: integer; itemname: string);
begin
   SendClientMessage(CM_USERREPAIRITEM, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendCheckWeaponItem (merchant, itemindex: integer; itemname: string);   //Á¦·ÃÈ®ÀÎ
begin
   SendClientMessage(CM_USERCHWEAPONITEM, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
begin
   SendClientMessage(CM_USERSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), mode, itemname);
end;

procedure TfrmMain.SendHeroStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
begin
   SendClientMessage(CM_HEROSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), mode, itemname);
end;

procedure TfrmMain.SendConsignItem (merchant, itemindex{, amount}: integer; cost: string);
begin
   SendClientMessage(CM_CONSIGNITEM, merchant, Loword(itemindex), Hiword(itemindex), {amount}0, cost);
end;

procedure TfrmMain.SendStoragePassWord(nRecogId, Mode: Integer; PassWord: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_STORAGEPASSWORD, nRecogId, Mode, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(PassWord));
end;


procedure TfrmMain.SendComStorageItem (merchant, itemindex{, amount}: integer); //°ø¿ëÃ¢°í
begin
   SendClientMessage(CM_COMSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), {amount}0);
end;

procedure TfrmMain.SendGuildStorageItem (merchant, itemindex{, amount}: integer); //¹®ÆÄÃ¢°í
begin
   SendClientMessage(CM_GUILDSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), {amount}0);
end;

procedure TfrmMain.SendBuyItem (merchant, itemserverindex,amins: integer; itemname: string);//¹°¾à
begin
   SendClientMessage(CM_USERBUYITEM, merchant, Loword(itemserverindex), Hiword(itemserverindex), amins, itemname);
end;

procedure TfrmMain.SendPBuyItem (merchant, itemserverindex,amins: integer; itemname: string);//¹°¾à
begin
   SendClientMessage(CM_USERPBUYITEM, merchant, Loword(itemserverindex), Hiword(itemserverindex), amins, itemname);
end;

procedure TfrmMain.SendTakeBackStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
begin
  SendClientMessage(CM_USERTAKEBACKSTORAGEITEM, merchant, Loword(itemserverindex), Hiword(itemserverindex), mode, itemname);
end;

procedure TfrmMain.SendTakeBackHeroStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
begin
  SendClientMessage(CM_HEROTAKEBACKSTORAGEITEM, merchant, Loword(itemserverindex), Hiword(itemserverindex), mode, itemname);
end;

procedure TFrmMain.SendMakeItemSel (merchant: integer; itemname: string);      //Á¦Á¶½ºÃÄ
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_USERMAKEITEMSEL, merchant, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (itemname));
end;
procedure TFrmMain.SendMakeItem (merchant: integer; data: string);  //Á¦Á¶½ºÃÄ
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_USERMAKEITEM, merchant, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;

procedure TfrmMain.SendDropGold (dropgold: integer);
begin
  SendClientMessage(CM_DROPGOLD, dropgold, 0, 0, 0);
end;

procedure TfrmMain.SendGroupMode ();
begin
   SendClientMessage(CM_GROUPMODE, Integer(g_boAllowGroup), Integer(g_boCheckGroup), Integer(g_boCheckHero), Integer(g_GroupItemMode))   //on
end;

procedure TfrmMain.SendCreateGroup (ItemClass, boHero: Integer; withwho: string);
begin
   if withwho <> '' then begin
      SendClientMessage(CM_CREATEGROUP, ItemClass, boHero, 0, 0, withwho);
   end;
end;


procedure TfrmMain.ClientBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¹öÇÁ
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of
      1: DScreen.AddSysMsg ('<CO$FFFF>×ÔÉíµÄ¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //Ã·±âÆø  860         0
      2: DScreen.AddSysMsg ('<CO$FFFF>×ÔÉíµÄ·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //È£½Å±â¸· 861        1
      3: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //ÆÄ±«ÀÇ¹°¾à  862     307
      4: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //¹«±ØÁø±â  862       2
      5: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //¸¶·ÂÀÇ¹°¾à  863     308
      6: DScreen.AddSysMsg ('<CO$FFFF>µÀÊõ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //µµ·ÂÀÇ¹°¾à  864     309
      7: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);        //±¤Ç³¹°¾à  865       312
      8: DScreen.AddSysMsg ('<CO$FFFF>¾­ÑéÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //°æÇèÄ¡°¡»ê  866     300
      9: ;  // 867
     10: DScreen.AddSysMsg ('<CO$FFFF>ÉúÃüÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //À°Ã¼  868           310
     11: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨Öµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //Á¤½Å  869           311
     12: DScreen.AddSysMsg ('<CO$FFFF>·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //´ëÁö  870           10
     13: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //Ç×¸¶  871           11
     14: ;  // 872
     15: DScreen.AddSysMsg ('<CO$FFFF>±¬ÂÊ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //µå·ÓÀ²  873         13
     16: DScreen.AddSysMsg ('<CO$FFFF>Çå·çÃ÷ÔÂ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //Ã»Ç³¸í¿ù 874        14
     17: DScreen.AddSysMsg ('<CO$FFFF>×¼È·<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //Á¤È®ÀÇ¹°¾à 875      320
     18: ;  // 876
     19: ;  // 877
     20: ;  // 878
     21: ;  // 879
     22: DScreen.AddSysMsg ('<CO$FFFF>ÌåÑ¸·ç<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ã¼½ÅÇ³  880         20
     23: DScreen.AddSysMsg ('<CO$FFFF>ÒÆ¶¯ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);        //°æ½Åº¸  881         21
     24: DScreen.AddSysMsg ('<CO$FFFF>·çÉíÊõ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ç³½Å¼ú  882         22
     25: DScreen.AddSysMsg ('<CO$FFFF>ÇáÉí²½<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //°æ½Åº¸ ÄðÅ¸ÀÓ  883  23
     26: DScreen.AddSysMsg ('<CO$FFFF>ÔÂÓ°Êõ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //¿ù¿µ¼ú  884         24
     27: DScreen.AddSysMsg ('<CO$FFFF>ÁÒ»ðÉí<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¿­È­½Å ÄðÅ¸ÀÓ  885  25
     28: ;  // 886
     29: ;  // 887
    // 30: DScreen.AddSysMsg ('<CO$FFFF>½º½ÂÀÇ °¡È£<CE> ÇØÁ¦.',40,60,clWhite);          //½º½ÂÀÇ°¡È£  888   30
     31: DScreen.AddSysMsg ('<CO$FFFF>ÀÏÊ¦µÄÍþÑÏ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);          //½º½ÂÀÇÀ§¾ö  888     30
     32: ;  // 889
     33: DScreen.AddSysMsg ('<CO$FFFF>±äÉí<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //º¯½ÅÅ»  890         19
     34: DScreen.AddSysMsg ('<CO$FFFF>ÉúÃü»Ö¸´<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //Èí¼º´ë¹ý  891       31
     35: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨»Ö¸´<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //°­¸¶Áø¹ý  892       32
     36: ;  // 893
     37: ;  // 894
     38: ;  // 895
     39: ;  // 896
     40: ;  // 897
     41: ;  // 898
    // 42: DScreen.AddSysMsg ('<CO$FFFF>¹®ÆÄ¼ºÀå ¹öÇÁ<CE> ÇØÁ¦.',40,60,clWhite);        //¹®ÆÄ¼ºÀå  899     507
     43: ;  // 900
     44: DScreen.AddSysMsg ('<CO$FFFF>ÓñÇåË®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //¿ÁÃ»¼ö  901         305
     45: DScreen.AddSysMsg ('<CO$FFFF>µå··Çã¸®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //µå··Çã¸®  901       305
     46: ;  // 902
     47: ;  // 903
     48: ;  // 904
     49: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //°ø·Â¼ö  905         306
     50: DScreen.AddSysMsg ('<CO$FFFF>¾­ÑéÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //NPC °æÇèÄ¡ 906      504
     51: ;  // 907
     52: DScreen.AddSysMsg ('<CO$FFFF>ÌìÁéË®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ãµ·É¼ö  908         317
     53: DScreen.AddSysMsg ('<CO$FFFF>¼¼ÄÜÊìÁ·¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //¼ö·ÃÀÇ¹°¾à 909      318
     54: DScreen.AddSysMsg ('<CO$FFFF>ÌìÎñ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);                 //Ãµ¹«  100           39
     55: DScreen.AddSysMsg ('<CO$FFFF>ÌìÎñ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          //Ãµ¹« ÄðÅ¸ÀÓ  101    40
     56: DScreen.AddSysMsg ('<CO$FFFF>ÉîÑÓÊõ<CE> Ä§·¨»Ö¸´Õý³£¡£',40,60,clWhite);   //½É¿¬¼ú  102         37
     57: DScreen.AddSysMsg ('<CO$FFFF>ÉîÑÓÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //½É¿¬¼ú ÄðÅ¸ÀÓ  103  38
     58: DScreen.AddSysMsg ('<CO$FFFF>ÑªÁú½£·¨<CE> ¹¥»÷ËÙ¶È»Ö¸´Õý³£¡£',40,60,clWhite);  //Ç÷·æ°Ë¹ý  104            46
     59: DScreen.AddSysMsg ('<CO$FFFF>ÑªÁú½£·¨<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ç÷·æ°Ë¹ý ÄðÅ¸ÀÓ  105        47
     60: DScreen.AddSysMsg ('<CO$FFFF>ÌìÉÏÃØÊõ<CE> ³ÖÐø×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);        //Ãµ»óºñ¼ú  106               48
     61: DScreen.AddSysMsg ('<CO$FFFF>ÌìÉÏÃØÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ãµ»óºñ¼ú ÄðÅ¸ÀÓ  107        49
     62: DScreen.AddSysMsg ('<CO$FFFF>Ã¨ÉàÀ¼<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¹¦¼³¶õ ÄðÅ¸ÀÓ 108           50
     63: DScreen.AddSysMsg ('<CO$FFFF>ÌìÉñ½µÁÙ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //¼ö¶ó°­¸² 109                508
     64: DScreen.AddSysMsg ('<CO$FFFF>ºìÁúÎèÓ°<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //ÀûÇ÷¹«¿µ 120                ±×´ë·Î
   //  65: ; // GM¹öÇÁ1 121
   //  66: ; // GM¹öÇÁ2 122
     67: ; // 123
     68: DScreen.AddSysMsg ('<CO$FFFF>ËÀÍöÖ®ÑÛ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¸ÁÀÚÀÇ´« ÄðÅ¸ÀÓ 124        16
     69: ; // 125
     70: DScreen.AddSysMsg ('<CO$FFFF>½ð¸Õ²»»µ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             // ±Ý°­ºÒ±« 126               52
     71: DScreen.AddSysMsg ('<CO$FFFF>½ð¸Õ²»»µ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ±Ý°­ºÒ±« ÄðÅ¸ÀÓ 127        53
     72: DScreen.AddSysMsg ('<CO$FFFF>ÀÏ¼¶<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ÀÏ¼¶ ÄðÅ¸ÀÓ 128            54
     73: DScreen.AddSysMsg ('<CO$FFFF>À×ÏÉ·ç<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ·Ú¼±Ç³ ÄðÅ¸ÀÓ 129          55
     74: DScreen.AddSysMsg ('<CO$FFFF>ÒõÑôÎåÐÐÕó<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);    // À½¾ç¿ÀÇàÁø ÄðÅ¸ÀÓ 80       56
     75: DScreen.AddSysMsg ('<CO$FFFF>ÔÂÓ°Îí<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               // ¿ù¿µ¹« 81                  57
     76: DScreen.AddSysMsg ('<CO$FFFF>ÔÂÓ°Îí<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿ù¿µ¹« ÄðÅ¸ÀÓ 82           58
     77: DScreen.AddSysMsg ('<CO$FFFF>¿µÀûÃß<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿µÀûÃß ÄðÅ¸ÀÓ 107          49
     78: DScreen.AddSysMsg ('<CO$FFFF>°×»¢Ç¿Âä<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¹éÈ£°­Å¸ ÄðÅ¸ÀÓ 26         ±×´ë·Î
     79: DScreen.AddSysMsg ('<CO$FFFF>Ñ×¶ñ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ±³¾Ç ÄðÅ¸ÀÓ 27             ±×´ë·Î
     80: DScreen.AddSysMsg ('<CO$FFFF>½Å±â¹¦»ê<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ½Å±â¹¦»ê ÄðÅ¸ÀÓ 108        50
     81: DScreen.AddSysMsg ('<CO$FFFF>ÔÆÖÐÂäÀ×<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¿îÁß·Ú°Ý ÄðÅ¸ÀÓ 84         59
     82: DScreen.AddSysMsg ('<CO$FFFF>°µ¶¾¸¿½ç<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¾Ïµ¶¸¸°è ÄðÅ¸ÀÓ 85         60
     83: DScreen.AddSysMsg ('<CO$FFFF>É±Éúµ¶<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // »ì»ýµµ ÄðÅ¸ÀÓ 87
     84: DScreen.AddSysMsg ('<CO$FFFF>¼ÖÇÃ ¾­ÑéÖµ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);          // ¼ÖÇÃ °æÇèÄ¡ ÇØÁ¦ 347       334
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92: //¾Æ·¹½º ¹öÇÁ
    // 93: ¸ÁÀÚÀÇ¿Ê
     94: DScreen.AddSysMsg ('<CO$FFFF>ÏÈÌìÕæÆø<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             // ¼±ÃµÁø±â - 409
    // 95:
     96: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     97: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     98: DScreen.AddSysMsg ('<CO$FFFF>µÀÊõ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     99: DScreen.AddSysMsg ('<CO$FFFF>·ÀÓù<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     100: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨·ÀÓù<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     101: DScreen.AddSysMsg ('<CO$FFFF>×î´óÉúÃüÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     102: DScreen.AddSysMsg ('<CO$FFFF>×î´óÄ§·¨Öµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     103: DScreen.AddSysMsg ('<CO$FFFF>¹¥»÷ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     104: DScreen.AddSysMsg ('<CO$FFFF>×¼È·<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     105: DScreen.AddSysMsg ('<CO$FFFF>Ãô½Ý<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     106: DScreen.AddSysMsg ('<CO$FFFF>Ä§·¨¶ã±Ü<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     107: DScreen.AddSysMsg ('<CO$FFFF>¶¾Îï¶ã±Ü<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     109: DScreen.AddSysMsg ('<CO$FFFF>·ý»¢¹÷·¨<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);
     // 115:  //¿µ¿õ¹öÇÁ 44
     // 116:  //±×·ì¹öÇÁ
     117: DScreen.AddSysMsg ('<CO$FFFF>³èÎïÐ§¹û<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);    //¿µ¹°¹öÇÁ 510
     118: DScreen.AddSysMsg ('<CO$FFFF>¸öÈË³ÖÐøÒ©Ë®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite); //Áö¼Ó¹°¾à
     119: DScreen.AddSysMsg ('<CO$FFFF>×é¶Ó³ÖÐøÒ©Ë®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite); //Áö¼Ó¹°¾à
     120: DScreen.AddSysMsg ('<CO$FFFF>Óð»¯µÇÏÉ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);
   end;
  end;

  for I := 0 to g_buffList.Count - 1 do begin
    buff := pTBuff(g_buffList.Items[i]);
    if (buff <> nil) and (buff.btIdx in [30,42,65,66,115,116,117]) and (buff.nImgIndex = ImagesNumber) and (Tiem = 0) then begin //¹öÇÁ ¾È»ç¶óÁö´Â°Í
      buff.nTime := GetTickCount + (Tiem + 1) * 1000;
      buff.str := Str;
      buff.btIdx := 0;
      exit;
    end;
    If (buff <> nil) and (buff.btIdx = Mode) and (buff.nImgIndex = ImagesNumber) then begin
       buff.nTime := GetTickCount + (Tiem + 1) * 1000;
       buff.str := Str;
       buff.btIdx := Mode;
       exit;
    end;
  end;
  if (Tiem <> 0) then begin
    New(buff);
    buff.nImgIndex := ImagesNumber;
    buff.nTime := GetTickCount + (Tiem + 1) * 1000;
    buff.str := Str;
    buff.btIdx := Mode;
    g_BuffList.Add(buff);
    if not FrmDlg2.DBuffDlg.Visible then FrmDlg2.DBuffDlg.Visible := True;
    if FrmDlg2.DBuffDlg.Visible then begin
      if g_BuffList.Count <= 10 then begin
        FrmDlg2.DBuffDlg.Left := (FrmDlg2.DBuffDlg.Left - 23);
      end;
    end;
  end;
end;


procedure TfrmMain.ClientHeroBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¹öÇÁ
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of
      1: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×ÔÉí¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //Ã·±âÆø  860         0
      2: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×ÔÉí·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //È£½Å±â¸· 861        1
      3: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //ÆÄ±«ÀÇ¹°¾à  862     307
      4: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //¹«±ØÁø±â  862       2
      5: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //¸¶·ÂÀÇ¹°¾à  863     308
      6: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>µÀÊõ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //µµ·ÂÀÇ¹°¾à  864     309
      7: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);        //±¤Ç³¹°¾à  865       312
      8: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¾­ÑéÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //°æÇèÄ¡°¡»ê  866     300
      9: ;  // 867
     10: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÉúÃüÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //À°Ã¼  868           310
     11: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨Öµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //Á¤½Å  869           311
     12: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //´ëÁö  870           10
     13: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨·ÀÓùÁ¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //Ç×¸¶  871           11
     14: ;  // 872
     15: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>±¬ÂÊ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //µå·ÓÀ²  873         13
     16: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Çå·çÃ÷ÔÂ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //Ã»Ç³¸í¿ù 874        14
     17: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×¼È·<CE> »Ö¸´Õý³£¡£',40,60,clWhite);            //Á¤È®ÀÇ¹°¾à 875      320
     18: ;  // 876
     19: ;  // 877
     20: ;  // 878
     21: ;  // 879
     22: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌåÑ¸·ç<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ã¼½ÅÇ³  880         20
     23: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÒÆ¶¯ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);        //°æ½Åº¸  881         21
     24: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>·çÉíÊõ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ç³½Å¼ú  882         22
     25: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÇáÉí²½<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //°æ½Åº¸ ÄðÅ¸ÀÓ  883  23
     26: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÔÂÓ°Êõ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //¿ù¿µ¼ú  884         24
     27: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¿­È­½Å<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¿­È­½Å ÄðÅ¸ÀÓ  885  25
     28: ;  // 886
     29: ;  // 887
    // 30: DScreen.AddSysMsg ('<CO$FFFF>½º½ÂÀÇ °¡È£<CE> ÇØÁ¦.',40,60,clWhite);          //½º½ÂÀÇ°¡È£  888   30
     31: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÀÏÊ¦µÄÍþÑÏ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);          //½º½ÂÀÇÀ§¾ö  888     30
     32: ;  // 889
     33: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>±äÉí<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //º¯½ÅÅ»  890         19
     34: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÉúÃü»Ö¸´<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //Èí¼º´ë¹ý  891       31
     35: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨»Ö¸´<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //°­¸¶Áø¹ý  892       32
     36: ;  // 893
     37: ;  // 894
     38: ;  // 895
     39: ;  // 896
     40: ;  // 897
     41: ;  // 898
    // 42: DScreen.AddSysMsg ('¿µ¿õÀÇ <CO$FFFF>¹®ÆÄ¼ºÀå ¹öÇÁ<CE> ÇØÁ¦.',40,60,clWhite);        //¹®ÆÄ¼ºÀå  899     507
     43: ;  // 900
     44: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÓñÇåË®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //¿ÁÃ»¼ö  901         305
     45: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>µå··Çã¸®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //µå··Çã¸®  901       305
     46: ;  // 902
     47: ;  // 903
     48: ;  // 904
     49: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷Á¦<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //°ø·Â¼ö  905         306
     50: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¾­ÑéÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);          //NPC °æÇèÄ¡ 906      504
     51: ;  // 907
     52: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÁéË®<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               //Ãµ·É¼ö  908         317
     53: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¼¼ÄÜÊìÁ·¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);     //¼ö·ÃÀÇ¹°¾à 909      318
     54: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÎñ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);                 //Ãµ¹«  100           39
     55: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÎñ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          //Ãµ¹« ÄðÅ¸ÀÓ  101    40
     56: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÉîÑÓÊõ<CE> Ä§·¨Á¦»Ö¸´Õý³£¡£',40,60,clWhite);   //½É¿¬¼ú  102         37
     57: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÉîÑÓÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //½É¿¬¼ú ÄðÅ¸ÀÓ  103  38
     58: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÑªÁú½£·¨<CE> ¹¥»÷ËÙ¶È»Ö¸´Õý³£¡£',40,60,clWhite);  //Ç÷·æ°Ë¹ý  104            46
     59: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÑªÁú½£·¨<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ç÷·æ°Ë¹ý ÄðÅ¸ÀÓ  105        47
     60: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÉÏÃØÊõ<CE> ³ÖÐøÊ±¼äÏûÊ§¡£',40,60,clWhite);        //Ãµ»óºñ¼ú  106               48
     61: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÉÏÃØÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ãµ»óºñ¼ú ÄðÅ¸ÀÓ  107        49
     62: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ã¨ÉàÀ¼<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¹¦¼³¶õ ÄðÅ¸ÀÓ 108           50
     63: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÌìÉñ½µÁÙ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //¼ö¶ó°­¸² 109                508
     64: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ºìÁúÓ°Îè<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             //ÀûÇ÷¹«¿µ 120                ±×´ë·Î
   //  65: ; // GM¹öÇÁ1 121
   //  66: ; // GM¹öÇÁ2 122
     67: ; // 123
     68: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ËÀÍöÖ®ÑÛ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¸ÁÀÚÀÇ´« ÄðÅ¸ÀÓ 124        16
     69: ; // 125
     70: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>½ð¸Õ²»»µ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             // ±Ý°­ºÒ±« 126               52
     71: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>½ð¸Õ²»»µ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ±Ý°­ºÒ±« ÄðÅ¸ÀÓ 127        53
     72: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÈÕÉÁ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ÀÏ¼¶ ÄðÅ¸ÀÓ 128            54
     73: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>À×ÏÉ·ç<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ·Ú¼±Ç³ ÄðÅ¸ÀÓ 129          55
     74: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÒõÑôÎåÐÐÕó<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);    // À½¾ç¿ÀÇàÁø ÄðÅ¸ÀÓ 80       56
     75: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÔÂÓ°Îí<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               // ¿ù¿µ¹« 81                  57
     76: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÔÂÓ°Îí<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿ù¿µ¹« ÄðÅ¸ÀÓ 82           58
     77: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ó°Ñª×¹<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿µÀûÃß ÄðÅ¸ÀÓ 107          49
     78: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹éÈ£°­Å¸<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¹éÈ£°­Å¸ ÄðÅ¸ÀÓ 26         ±×´ë·Î
     79: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ñ×¶ñ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ±³¾Ç ÄðÅ¸ÀÓ 27             ±×´ë·Î
     80: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÖÁÇ¿Ò»»÷<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ½Å±â¹¦»ê ÄðÅ¸ÀÓ 108        50
     81: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÔÆÖÐÂäÀ×<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¿îÁß·Ú°Ý ÄðÅ¸ÀÓ 84         59
     82: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÔÆÖÐÂäÀ×<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¾Ïµ¶¸¸°è ÄðÅ¸ÀÓ 85         60
     83: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>É±Éúµ¶<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // »ì»ýµµ ÄðÅ¸ÀÓ 87
     84: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¼ÖÇÃ ¾­ÑéÖµ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);          // ¼ÖÇÃ °æÇèÄ¡ ÇØÁ¦ 347       334
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92:
    // 93: ¸ÁÀÚÀÇ¿Ê
     94: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÏÈÌìÕæÆø<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);             // ¼±ÃµÁø±â - 409
    // 95:
     96: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     97: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     98: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>µÀÊõ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     99: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>·ÀÓù<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     100: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨·ÀÓù<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     101: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×î´óÉúÃüÖµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     102: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×î´óÄ§·¨Öµ<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     103: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¹¥»÷ËÙ¶È<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     104: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>×¼È·<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     105: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ãô½Ý<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     106: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Ä§·¨¶ã±Ü<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     107: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>¶¾Îï¶ã±Ü<CE> »Ö¸´Õý³£¡£',40,60,clWhite);
     109: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>·ý»¢¹÷·¨<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);
    // 115:  //¿µ¿õ¹öÇÁ 44
    // 116:  //±×·ì¹öÇÁ
     120: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>Óð»¯µÇÏÉ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);
     121: DScreen.AddSysMsg ('Ó¢ÐÛµÄ <CO$FFFF>ÎïÆ·½ûÖ¹µôÂÊ<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);       //µå¶ø¹æÁö
   end;
  end;

  for I := 0 to g_HeroBuffList.Count - 1 do begin
    buff := pTBuff(g_HeroBuffList.Items[i]);
    if (buff <> nil) and (buff.btIdx in [30,42,65,66,115,116,117]) and (buff.nImgIndex = ImagesNumber) and (Tiem = 0) then begin //¹öÇÁ ¾È»ç¶óÁö´Â°Í
      buff.nTime := GetTickCount + (Tiem + 1) * 1000;
      buff.str := Str;
      buff.btIdx := 0;
      exit;
    end;
    If (buff <> nil) and (buff.btIdx = Mode) and (buff.nImgIndex = ImagesNumber) then begin
      buff.nTime := GetTickCount + (Tiem + 1) * 1000;
      buff.str := Str;
      buff.btIdx := Mode;
      exit;
    end;
  end;
  if (Tiem <> 0) then begin
    New(buff);
    buff.nImgIndex := ImagesNumber;
    buff.nTime := GetTickCount + (Tiem + 1) * 1000;
    buff.str := Str;
    buff.btIdx := Mode;
    g_HeroBuffList.Add(buff);
    if not FrmDlg2.DHeroBuffDlg.Visible then FrmDlg2.DHeroBuffDlg.Visible := True;
    if FrmDlg2.DHeroBuffDlg.Visible then begin
      if g_HeroBuffList.Count <= 10 then begin
        FrmDlg2.DHeroBuffDlg.Left := (FrmDlg2.DHeroBuffDlg.Left - 23);
      end;
    end;
  end;
end;

procedure TfrmMain.ClientCoolBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //¹öÇÁ
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of

     25: DScreen.AddSysMsg ('<CO$FFFF>ÇáÉí²½<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //°æ½Åº¸ ÄðÅ¸ÀÓ  883  23
     27: DScreen.AddSysMsg ('<CO$FFFF>ÁÒ»ðÉí<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¿­È­½Å ÄðÅ¸ÀÓ  885  25
     55: DScreen.AddSysMsg ('<CO$FFFF>ÌìÎñ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          //Ãµ¹« ÄðÅ¸ÀÓ  101    40
     57: DScreen.AddSysMsg ('<CO$FFFF>ÉîÑÓÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //½É¿¬¼ú ÄðÅ¸ÀÓ  103  38
     59: DScreen.AddSysMsg ('<CO$FFFF>ÑªÁú½£·¨<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ç÷·æ°Ë¹ý ÄðÅ¸ÀÓ  105        47
     61: DScreen.AddSysMsg ('<CO$FFFF>ÌìÉÏÃØÊõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //Ãµ»óºñ¼ú ÄðÅ¸ÀÓ  107        49
     62: DScreen.AddSysMsg ('<CO$FFFF>Ã¨ÉàÀ¼<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        //¹¦¼³¶õ ÄðÅ¸ÀÓ 108           50
     68: DScreen.AddSysMsg ('<CO$FFFF>ËÀÍöÖ®ÑÛ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¸ÁÀÚÀÇ´« ÄðÅ¸ÀÓ 124        16
     71: DScreen.AddSysMsg ('<CO$FFFF>½ð¸Õ²»»µ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ±Ý°­ºÒ±« ÄðÅ¸ÀÓ 127        53
     72: DScreen.AddSysMsg ('<CO$FFFF>ÈÕÉÁ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ÀÏ¼¶ ÄðÅ¸ÀÓ 128            54
     73: DScreen.AddSysMsg ('<CO$FFFF>À×ÏÉ·ç<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ·Ú¼±Ç³ ÄðÅ¸ÀÓ 129          55
     74: DScreen.AddSysMsg ('<CO$FFFF>ÒõÑôÎåÐÐÕó<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);    // À½¾ç¿ÀÇàÁø ÄðÅ¸ÀÓ 80       56
     75: DScreen.AddSysMsg ('<CO$FFFF>ÔÂÓ°Îí<CE> ×´Ì¬ÒÑÏûÊ§¡£',40,60,clWhite);               // ¿ù¿µ¹« 81                  57
     76: DScreen.AddSysMsg ('<CO$FFFF>ÔÂÓ°Îí<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿ù¿µ¹« ÄðÅ¸ÀÓ 82           58
     77: DScreen.AddSysMsg ('<CO$FFFF>¿µÀûÃßÀÓ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // ¿µÀûÃß ÄðÅ¸ÀÓ 107          49
     78: DScreen.AddSysMsg ('<CO$FFFF>°×»¢Ç¿Âä<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¹éÈ£°­Å¸ ÄðÅ¸ÀÓ 26         ±×´ë·Î
     79: DScreen.AddSysMsg ('<CO$FFFF>Ñ×¶ñ ÄðÅ¸ÀÓ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);          // ±³¾Ç ÄðÅ¸ÀÓ 27             ±×´ë·Î
     80: DScreen.AddSysMsg ('<CO$FFFF>ÖÁÇ¿Ò»»÷<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ½Å±â¹¦»ê ÄðÅ¸ÀÓ 108        50
     81: DScreen.AddSysMsg ('<CO$FFFF>ÖÁÇ¿Ò»»÷<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¿îÁß·Ú°Ý ÄðÅ¸ÀÓ 84         59
     82: DScreen.AddSysMsg ('<CO$FFFF>°µ¶¾¸¿½ç<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      // ¾Ïµ¶¸¸°è ÄðÅ¸ÀÓ 85         60
     83: DScreen.AddSysMsg ('<CO$FFFF>É±Éúµ¶<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);        // »ì»ýµµ ÄðÅ¸ÀÓ 87
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92:
     93: DScreen.AddSysMsg ('<CO$FFFF>ËÀÍöÖ®ÑÛ ÀäÈ´Ê±¼ä<CE> ½áÊø¡£',40,60,clWhite);     //¸ÁÀÚÀÇ¿Ê ÄðÅ¸ÀÓ 79

     108: DScreen.AddSysMsg ('<CO$FFFF>ò×Ó°Êõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //ÀºÇü¼ú ÄðÅ¸ÀÓ  67

     111: DScreen.AddSysMsg ('<CO$FFFF>»÷¿Õ¹÷·¨<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //°Ý°øÀå ÄðÅ¸ÀÓ 76
     //112:; //º¹È£Àå °¨Àü
     113: DScreen.AddSysMsg ('<CO$FFFF>Ç¿»¤Êõ<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);      //°­È£¼ú ÄðÅ¸ÀÓ 71
     114: DScreen.AddSysMsg ('<CO$FFFF>ÏÈÌì<CE> ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clWhite);       //¼±Ãµ ÄðÅ¸ÀÓ 104
   end;
  end;

  for I := 0 to g_CoolbuffList.Count - 1 do begin
    buff := pTBuff(g_CoolbuffList.Items[i]);
    If (buff <> nil) and (buff.btIdx = Mode) and (buff.nImgIndex = ImagesNumber) then begin
       buff.nTime := GetTickCount + (Tiem + 1) * 1000;
       buff.str := Str;
       buff.btIdx := Mode;
       exit;
    end;
  end;
  if (Tiem <> 0) then begin
    New(buff);
    buff.nImgIndex := ImagesNumber;
    buff.nTime := GetTickCount + (Tiem + 1) * 1000;
    buff.str := Str;
    buff.btIdx := Mode;
    g_CoolbuffList.Add(buff);
    if not FrmDlg2.DCoolBuffDlg.Visible then FrmDlg2.DCoolBuffDlg.Visible := True;
    if FrmDlg2.DCoolBuffDlg.Visible then begin
      if g_CoolbuffList.Count <= 10 then begin
       FrmDlg2.DCoolBuffDlg.Left := (FrmDlg2.DCoolBuffDlg.Left - 23);
      end;
    end;
  end;

end;



procedure TfrmMain.ClientAucBuff(Makeindex:String;Cost:integer); //°æ¸Å
var
  Aucbuff : pTAucBuffItem;
  I: integer;
begin
  for I := 0 to g_AucList.Count - 1 do begin
    Aucbuff := pTAucBuffItem(g_AucList.Items[i]);
    If (Aucbuff <> nil) and (Aucbuff.Item.MakeIndex = StrToInt(MakeIndex)) then begin
       Aucbuff.APrice := Cost;
       exit;
    end;
  end;
end;

procedure TfrmMain.ClientCoolTime(Body:String;Ttiem:integer);   //¸®ÄÝ
begin
 if (Body <> '') and (Ttiem >=0) then begin
   DScreen.AddCoolTime(body,Ttiem);
   if (Ttiem = 0) then begin
     DScreen.AddSysMsg ('á÷ÁÔ³¡ÀäÈ´Ê±¼ä½áÊø¡£',40,60,clYellow);
   end;
 end;
end;

procedure TfrmMain.ClientRockPapersGame(Gold:String; Rate:integer);   //°¡À§¹ÙÀ§º¸
begin
  if (Gold <> '') and (Rate >=0) then begin
    FrmDlg2.DRPSDlg.Visible := True;
    FrmDlg2.DGoReStart.Visible := False;
    FrmDlg2.DGoResult.Visible := True;
    FrmDlg2.RockRate := Rate;
    FrmDlg2.RockGold := StrToInt(Gold);
  end else begin
    FrmDlg2.DRPSDlg.Visible := False;
    FrmDlg2.DGoReStart.Visible := False;
    FrmDlg2.DGoResult.Visible := False;
    FrmDlg2.RockRate := 0;
    FrmDlg2.RockGold := 0;
  end;
end;

procedure TfrmMain.SendRentalTry;     //´ë¿©
var
   who: string;
begin
   SendClientMessage(CM_RENTALTRY, 0, 0, 0, 0, who);
end;


procedure TfrmMain.SendDealTry;     //°Å·¡
var
   who: string;
begin
   (*proper := FALSE;
   GetFrontPosition (Myself.XX, Myself.m_nCurrY, Myself.Dir, fx, fy);
   with PlayScene do
      for i:=0 to ActorList.Count-1 do begin
         actor := TActor (ActorList[i]);
         if {(actor.m_btRace = 0) and} (actor.XX = fx) and (actor.m_nCurrY = fy) then begin
            proper := TRUE;
            who := actor.UserName;
            break;
         end;
      end;
   if proper then begin*)
      SendClientMessage(CM_DEALTRY, 0, 0, 0, 0, who);
   //end;
end;

procedure TfrmMain.SendGuildDlg;
begin
   SendClientMessage(CM_OPENGUILDDLG, 0, 0, 0, 0);
end;

procedure TfrmMain.SendCancelRental;       //´ë¿©
begin
   SendClientMessage(CM_RENTALCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendCancelDeal;       //°Å·¡
begin
   SendClientMessage(CM_DEALCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendCancelExChange;    //È¯Àü Ãë¼Ò
begin
   SendClientMessage(CM_EXCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendTigerSet (onoff: Boolean); //È£¶ûÀÌ
begin
   if onoff then begin
     SendClientMessage(CM_TIGERSET, 0, 1, 0, 0);   //Å¸±â
   end else begin
    SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);  //³»¸®±â
   end;
end;

procedure TfrmMain.SendGuildSet (guildimg: integer); //¹®ÆÄ ¸¶Å©
begin
   SendClientMessage(CM_GUILDSET, 0, guildimg, 0, 0);  //¹®ÆÄ ¸¶Å©
end;

procedure TfrmMain.SendGuildGrowUp (guildUp: integer); //¹®ÆÄ¼ºÀå
begin
   SendClientMessage(CM_GUILDGROWUP, 0, guildUp, 1, 0);
end;

procedure TfrmMain.SendAddRentalItem (ci: TClientItem;Day: integer);    //´ë¿©
begin
   SendClientMessage(CM_RENTALADDITEM, ci.MakeIndex, ci.Amount, Day, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelRentalItem (ci: TClientItem);    //´ë¿©
begin
   SendClientMessage(CM_RENTALDELITEM, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendChangeRentalGold (gold: integer);        //´ë¿©
begin
   SendClientMessage(CM_RENTALCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendRentalEnd;                      //´ë¿©
begin
   SendClientMessage(CM_RENTALEND, 0, 0, 0, 0);
end;



procedure TfrmMain.SendAddDealItem (ci: TClientItem);    //°Å·¡
begin
   SendClientMessage(CM_DEALADDITEM, ci.MakeIndex, ci.Amount, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelDealItem (ci: TClientItem);     //°Å·¡
begin
   SendClientMessage(CM_DEALDELITEM, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelDealItem2 (ci: TClientItem);      //°Å·¡
begin
   SendClientMessage(CM_DEALDELITEM2, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendChangeDealGold (gold: integer);        //°Å·¡
begin
   SendClientMessage(CM_DEALCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendDealEnd;                       //°Å·¡
begin
   SendClientMessage(CM_DEALEND, 0, 0, 0, 0);
end;

procedure TfrmMain.SendExChangeEnd;  //È¯Àü ¿Ï·á
begin
   SendClientMessage(CM_EXCHANGEEND, 0, 0, 0, 0);
end;

procedure TfrmMain.SendChangeExChangeGold (gold: integer);   //È¯Àü
begin
   SendClientMessage(CM_EXCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendChangeExChangeGameGold (gold: integer);   //È¯Àü
begin
   SendClientMessage(CM_EXCHGAMEGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendAddGroupMember (withwho: string);
begin
   if withwho <> '' then begin
      SendClientMessage(CM_ADDGROUPMEMBER, 0, 0, 0, 0, withwho);
   end;
end;

procedure TfrmMain.SendDelGroupMember (withwho: string);
begin
   if withwho <> '' then begin
      SendClientMessage(CM_DELGROUPMEMBER, 0, 0, 0, 0, withwho);
   end;
end;

procedure TfrmMain.SendGuildHome;
begin
   SendClientMessage(CM_GUILDHOME, 0, 0, 0, 0);
end;

procedure TfrmMain.SendGuildMemberList;
begin
   SendClientMessage(CM_GUILDMEMBERLIST, 0, 0, 0, 0);
end;

procedure TfrmMain.SendGuildAddMem (who: string);
begin
   if Trim(who) <> '' then begin
      SendClientMessage(CM_GUILDADDMEMBER, 0, 0, 0, 0, who);
   end;
end;

procedure TfrmMain.SendGuildDelMem (who: string);
begin
   if Trim(who) <> '' then begin
      SendClientMessage(CM_GUILDDELMEMBER, 0, 0, 0, 0, who);
   end;
end;

procedure TfrmMain.SendGuildUpdateNotice (notices: string);
begin
   SendClientMessage(CM_GUILDUPDATENOTICE, 0, 0, 0, 0, notices);
end;

procedure TfrmMain.SendGuildUpdateGrade (rankinfo: string);
begin
   SendClientMessage(CM_GUILDUPDATERANKINFO, 0, 0, 0, 0, rankinfo);
end;

procedure TfrmMain.SendSpeedHackUser(code: integer);
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_SPEEDHACKUSER, code, 0, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TfrmMain.SendGetSayItem(nid, ItemIndex: Integer);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_GETSAYITEM, ItemIndex, nid, 0, 0);
  SendSocket(EncodeMessage(Msg));
end;

procedure TfrmMain.SendAdjustBonus (remain: integer; babil: TNakedAbility);
var
  msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_ADJUST_BONUS, remain, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeBuffer (@babil, sizeof(TNakedAbility)));
end;

procedure TfrmMain.SendPowerBlock();
var
  msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_POWERBLOCK, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeBuffer (@g_PowerBlock, sizeof(TPowerBlock)));
end;

procedure TfrmMain.SendGTListRequest(merchant, menuindex: integer);
begin
   SendClientMessage(CM_REQUESTGTLIST , merchant, menuindex, 0, 0, '');
end;

procedure TfrmMain.SendBuyGT(merchant, GTNumber: integer);
begin
   SendClientMessage(CM_BUYGT , merchant, GTNumber, 0, 0, '');
end;

procedure TfrmMain.SendDecoListRequest(merchant, menuindex: integer);
begin
   SendClientMessage(CM_REQUESTDECOLIST , merchant, menuindex, 0, 0, '');
end;

procedure TfrmMain.SendBuyDeco(merchant, Appr: integer);
begin
   SendClientMessage(CM_BUYDECOITEM , merchant, Appr, 0, 0, '');
end;

procedure TfrmMain.SendAddAutItem (ci: TClientItem; Price:Integer);    //°æ¸Å
begin
   SendClientMessage(CM_AUCADDITEM, ci.MakeIndex, 0, 0, 0, IntToStr(Price));
end;


procedure TfrmMain.SendBuyStoreItem(sItems: string; nMakeIndex, nRecogId: Integer);     //°³ÀÎ»óÁ¡
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_BUYSTOREITEM, nRecogId, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(sItems + '/' + IntToStr(nMakeIndex) + '/'));
end;

procedure TfrmMain.SendStartStore();     //°³ÀÎ»óÁ¡
var
  I, nCount: Integer;
  itemindex: TItemIndex;
  sText: string;
  Msg: TDefaultMessage;
begin
  sText := '';
  nCount := 0;
  for I := 0 to 14 do begin
    if g_StoreItems[I].Item.S.Name <> '' then begin
      itemindex.btSellType := g_StoreItems[I].btSellType;
      itemindex.itemname := g_StoreItems[I].Item.S.Name;
      itemindex.MakeIndex := g_StoreItems[I].Item.MakeIndex;
      itemindex.Price := g_StoreItems[I].Item.S.Price;
      sText := sText + EncodeBuffer(@itemindex, SizeOf(TItemIndex)) + '/' + FrmDlg.EdStoreMsgEdit.Text + '/';
      Inc(nCount);
    end;
  end;
  Msg := MakeDefaultMsg(CM_STARTSTORE, nCount, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + sText);
end;

procedure TfrmMain.SendTradeGT(Answer:integer);
begin
  SendClientMessage(CM_TRADEGT , Answer, 0, 0, 0, '');
end;

procedure TfrmMain.SendBBSListRequest(merchant: integer; menuindex: integer);      //Àå¿ø°Ô½ÃÆÇ
begin
   SendClientMessage(CM_BBSLIST , merchant, menuindex, 0, 0, '');
end;

procedure TfrmMain.SendBBSMsgRequest(merchant: integer; index:integer);     //Àå¿ø°Ô½ÃÆÇ
begin
   SendClientMessage(CM_BBSMSG , merchant, index, 0, 0, '');
end;

procedure TfrmMain.SendBBSPost(merchant,Sticky,MasterPost: integer; sMsg:String);   //Àå¿ø°Ô½ÃÆÇ
begin
   SendClientMessage(CM_BBSPOST , merchant, Sticky, LoWord(MasterPost), HiWord(MasterPost), sMsg);
end;

procedure TfrmMain.SendBBSDelete(merchant,index:integer);               //Àå¿ø°Ô½ÃÆÇ
begin
   SendClientMessage(CM_BBSDELETE , merchant, index, 0, 0, '');
end;

procedure TfrmMain.SendChgStorePw (storepasswd, newstorepasswd: string);
begin
//   SendClientMessage(CM_CHANGEPASSWORD, 0, 0, 0, 0, storepasswd + #9 + newstorepasswd);
end;
{---------------------------------------------------------------}


function  TfrmMain.ServerAcceptNextAction: Boolean;
begin
   Result := TRUE;
   if ActionLock then begin
      if GetTickCount - ActionLockTime > 10 * 1000 then begin
         ActionLock := FALSE;
      end;
      Result := FALSE;
   end;
end;

function  TfrmMain.CanNextAction: Boolean;
begin
   if (g_MySelf.IsIdle) and (g_MySelf.m_nState and $04000000 = 0) and (g_MySelf.m_nState and $20000000 = 0) and
      (GetTickCount - g_dwDizzyDelayStart > g_dwDizzyDelayTime) and (g_FishingOk = False) and (not m_boWakeUp) and    //³¬½Ã ÁßÀÏ¶§ ´ÙÀ½ ¿¢¼Ç ±ÝÁö
      (GetTickCount - g_MySelf.m_dwSpiderMove > 2000) and
      ((GetTickCount - g_MySelf.g_dwMagicMove > 4000) or (g_MySelf.m_nState and $00040000 <> 0))  //³«¿° ºùÈ¯ Ãµ»óºñ¼ú
   then begin                                                           
      Result := TRUE;
   end else
      Result := FALSE;
end;

function  TfrmMain.CanNextHeroAction: Boolean;       // 2003/07/15 ½Å±Ô¹«°ø, »óÅÂÀÌ»ó Ãß°¡...°áºù
begin
   if (g_MyHero.m_nState and $04000000 = 0) and
      (g_MyHero.m_nState and $20000000 = 0) and
      (GetTickCount - g_MyHero.m_dwSpiderMove > 2000) and
      (GetTickCount - g_dwDizzyDelayStart > g_dwDizzyDelayTime) and (not m_boWakeUp)
   then begin
      Result := TRUE;
   end else
      Result := FALSE;
end;


function  TfrmMain.CanNextHit: Boolean;
var
   NextHitTime, LevelFastTime:Integer;
begin
   LevelFastTime:= _MIN (370, (g_MySelf.m_Abil.Level * 14));
   LevelFastTime:= _MIN (800, LevelFastTime + (g_MySelf.m_nHitSpeed) * g_nItemSpeed{60});

   if (g_boAttackSlow) then
      NextHitTime:= g_nHitTime{1400} - LevelFastTime + 1500
   else
      NextHitTime:= g_nHitTime{1400} - LevelFastTime;

   if NextHitTime < 0 then
      NextHitTime:= 0;

   if GetTickCount - LastHitTick > LongWord(NextHitTime) then begin
      LastHitTick:=GetTickCount;
      Result:=True;
   end else
      Result:=False;
end;

procedure TfrmMain.ActionFailed;
begin
   g_nTargetX := -1;
   g_nTargetY := -1;
   ActionFailLock := TRUE;
   ActionFailLockTime :=GetTickCount();
   g_MySelf.MoveFail;
end;

function TfrmMain.CheckUseMagicbujuk(MaicId:Word):Boolean;
begin
  Result:=True;
  if MaicId in [105] then begin
  Result:=False;
    if g_UseItems[U_ARMRINGL].S.Name <> '' then begin       //ÆÈÂîÀÚ¸®
      if (g_UseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_UseItems[U_ARMRINGL].S.Shape in [7,8]) and (ROUND(g_UseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_UseItems[U_BUJUK].S.Name <> '' then begin       //ºÎÀûÀÚ¸®
      if (g_UseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_UseItems[U_BUJUK].S.Shape in [7,8]) and (ROUND(g_UseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('ÄãÐèÒª×°±¸»¤Éí·û¡£',clRed,clWhite);
  end;
end;


function TfrmMain.CheckUseMagicHerobujuk(MaicId:Word):Boolean;
begin
  Result:=True;
  if MaicId in [105] then begin
    Result:=False;
    if g_HeroUseItems[U_ARMRINGL].S.Name <> '' then begin       //ÆÈÂîÀÚ¸®
      if (g_HeroUseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_HeroUseItems[U_ARMRINGL].S.Shape in [7,8]) and (ROUND(g_HeroUseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_HeroUseItems[U_BUJUK].S.Name <> '' then begin       //ºÎÀûÀÚ¸®
      if (g_HeroUseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_HeroUseItems[U_BUJUK].S.Shape in [7,8]) and (ROUND(g_HeroUseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('ÄãÐèÒª×°±¸»¤Éí·û¡£',clRed,clWhite);
  end;
end;

function TfrmMain.CheckUseMagicMonk(MaicId:Word):Boolean;
begin
  Result:=True;
  if MaicId in [113,115,116,118,127,129] then begin
  Result:=False;
    if g_UseItems[U_ARMRINGL].S.Name <> '' then begin       //ÆÈÂîÀÚ¸®
      if (g_UseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_UseItems[U_ARMRINGL].S.Shape in [10]) and (ROUND(g_UseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_UseItems[U_BUJUK].S.Name <> '' then begin       //ºÎÀûÀÚ¸®
      if (g_UseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_UseItems[U_BUJUK].S.Shape in [10]) and (ROUND(g_UseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('ÄãÐèÒª×°±¸½ðÉíÉáÀû£¬',clRed,clWhite);
  end;
end;


function TfrmMain.CheckUseMagicWeapon(MaicId:Word):Boolean;
begin
  Result := True;
  if MaicId in [60,62,63,70,71,72,84,88,102,106,110] then begin
   if (g_UseItems[U_WEAPON].S.Name = '') or (g_UseItems[U_WEAPON].S.StdMode <> 99) then begin
     DScreen.AddChatBoardString('ÄãÐèÒª×°±¸Ë«ÊÖÎäÆ÷¡£',clRed,clWhite);
     Result := False;
   end;
  end;
end;


function TfrmMain.CheckUseMagicHeroWeapon(MaicId:Word):Boolean;
begin
  Result := True;
  if MaicId in [60,62,63,70,71,72,84,88,102,106,110] then begin
   if (g_HeroUseItems[U_WEAPON].S.Name = '') or (g_HeroUseItems[U_WEAPON].S.StdMode <> 99) then begin
     DScreen.AddChatBoardString('´Ë¼¼ÄÜÐèÒªÓ¢ÐÛ×°±¸Ë«ÊÖÎäÆ÷¡£',clRed,clWhite);
     Result := False;
   end;
  end;
end;

function TfrmMain.CheckUseMagicTarget (MaicId:Word):Boolean;
begin
  Result := True;
  if (MaicId in [102]) and (g_MagicTarget = nil)  then begin
     DScreen.AddChatBoardString('Äã±ØÐëÉè¶¨Ä¿±ê¡£',clWhite,clRed);
     Result := False;
  end;
end;

function TfrmMain.CheckUseMagicDelay (MaicId:integer):Boolean;    //¹öÇÁ ¸¶¹ý µô·¹ÀÌ
var
  i : integer;
  Time  : String;
  buff  : pTBuff;  //¹öÇÁ
begin
  Result := True;
  Time := '';
  for I := 0 to g_CoolBuffList.Count - 1 do begin
    buff := pTBuff(g_CoolBuffList.Items[i]);

    case MaicId of

      56 : begin   //ÀÏ¼¶ µô·¹ÀÌ
        if buff.btIdx = 72 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÈÕÉÁ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      68 : begin   //°æ½Åº¸ µô·¹ÀÌ   ÇáÉí²½
        if buff.btIdx = 25 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÇáÉí²½¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      71 : begin   //¿­È­½Å µô·¹ÀÌ   ÁÒ»ðÉí
        if buff.btIdx = 27 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÁÒ»ðÉí¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      73 : begin   //Ãµ¹« µô·¹ÀÌ
        if buff.btIdx = 55 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÌìÎñ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      74 : begin   //½É¿¬¼ú µô·¹ÀÌ
        if buff.btIdx = 57 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÉîÑÓÊõ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      77 : begin   //Ç÷·æ°Ë¹ý µô·¹ÀÌ
        if buff.btIdx = 59 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÑªÁú½£·¨¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      78 : begin   //Ãµ»óºñ¼ú µô·¹ÀÌ
        if buff.btIdx = 61 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÌìÉÏÃØÊõ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      80 : begin   //¹¦¼³¶õ µô·¹ÀÌ
        if buff.btIdx = 62 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÃ¨ÉàÀ¼¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      81 : begin   //±Ý°­ºÒ±« µô·¹ÀÌ
        if buff.btIdx = 71 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ½ð¸Õ²»»µ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      82 : begin   //·Ú¼±Ç³ µô·¹ÀÌ
        if buff.btIdx = 73 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÀ×ÏÉ·ç¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      83 : begin   //À½¾ç¿ÀÇàÁø µô·¹ÀÌ
        if buff.btIdx = 74 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÒõÑôÎåÐÐÕó¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      84 : begin   //¿ù¿µ¹« µô·¹ÀÌ
        if buff.btIdx = 76 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÔÂÓ°Îí¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      98 : begin   //¸ÁÀÚÀÇ´« µô·¹ÀÌ
        if buff.btIdx = 68 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃËÀÍöÖ®ÑÛ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      102 : begin  //¿µÀûÃß µô·¹ÀÌ
        if buff.btIdx = 77 then begin
          if (buff.nTime <> 0) then begin
             //Time := format('%dÃÊ', [((buff.nTime - GetTickCount) Div 1000) Mod 60]);
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÓ°Ñª×¹¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      105 : begin  //¹éÈ£°­Å¸ µô·¹ÀÌ      °×»¢Ç¿Âä
        if buff.btIdx = 78 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ°×»¢Ç¿Âä¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      106 : begin  //±³¾Ç µô·¹ÀÌ
        if buff.btIdx = 79 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÑ×¶ñ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      107 : begin  //½Å±â¹¦»ê µô·¹ÀÌ
        if buff.btIdx = 80 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÖÁÇ¿Ò»»÷¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      108 : begin  //¿îÁß·Ú°Ý µô·¹ÀÌ
        if buff.btIdx = 81 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÔÆÖÐÂäÀ×¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      109 : begin  //¾Ïµ¶¸¸°è µô·¹ÀÌ
        if buff.btIdx = 82 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ°µ¶¾¸¿½ç¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      110 : begin  //»ì»ýµµ µô·¹ÀÌ
        if buff.btIdx = 83 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ°µ¶¾¸¿½ç¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      113 : begin  //¼±ÃµÁø±â µô·¹ÀÌ
        if buff.btIdx = 95 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÏÈÌìÕæÆø¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      121 : begin  //ÀºÇü¼ú µô·¹ÀÌ
        if buff.btIdx = 108 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃò×Ó°Êõ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      122 : begin  //º¹È£Àå µô·¹ÀÌ
        if buff.btIdx = 110 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ·ý»¢¹÷·¨¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      123 : begin  //°Ý°øÀå µô·¹ÀÌ
        if buff.btIdx = 111 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃ»÷¿Õ¹÷·¨¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      129 : begin  //°­È£¼ú µô·¹ÀÌ
        if buff.btIdx = 113 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÇ¿»¤Êõ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      137: begin      //¼±Ãµ
        if buff.btIdx = 114 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜÊ¹ÓÃÏÈÌì¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

    end;

  end;
end;


function TfrmMain.CheckItemDelay (mode:integer):Boolean;    //¹öÇÁ ¸¶¹ý µô·¹ÀÌ
var
  i : integer;
  Time  : String;
  buff  : pTBuff;  //¹öÇÁ
begin
  Result := True;
  Time := '';
  for I := 0 to g_CoolBuffList.Count - 1 do begin
    buff := pTBuff(g_CoolBuffList.Items[i]);

    case mode of

      110 : begin   //¸ÁÀÚÀÇ¿Ê µô·¹ÀÌ
        if buff.btIdx = 93 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('ÄãÏÖÔÚ²»ÄÜ×°±¸ËÀÉñÕ½ÒÂ¡£',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

    end;

  end;
end;


function  TfrmMain.IsUnLockAction (action, adir: integer): Boolean;
begin
   if ActionFailLock then begin
     if GetTickCount() - ActionFailLockTime > 1000 then
     ActionFailLock:=False;
   end;
   if (ActionFailLock) {or (g_boMapMoving)} or g_boMapMovingWait or (g_boServerChanging) then begin
      Result := FALSE;
   end else Result := TRUE;
end;

function TfrmMain.IsGroupMember (uname: string): Boolean;
var
   i: integer;
   GroupMember: pTGroupMember;
begin
   Result := FALSE;
   for i:=0 to g_MemberGroup.Count-1 do begin
      GroupMember := g_MemberGroup[i];
      if GroupMember.ClientGroup.UserName = uname then begin
         Result := TRUE;
         break;
      end;
   end;
end;

procedure TfrmMain.SendWakeUpItem(UpgradeItemIndexs: Integer; mode: byte; sData:string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_SENDWAKEUPITEM, UpgradeItemIndexs, mode, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(sData));
end;

procedure TfrmMain.SendWakeUp(UpgradeItemIndexs: Integer; mode: byte; sData:string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_SENDWAKEUP, UpgradeItemIndexs, mode, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(sData));
end;

procedure TfrmMain.QueryRogueEnabled();
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_QUERYROGUE, 0, 0, 0, 0);
  SendSocket(EncodeMessage(Msg));
end;
{-------------------------------------------------------------}

procedure TfrmMain.SendAddAutoItem (itemindex: integer; itemname: string);
begin
   SendClientMessage(CM_AUTOADDITEM, 0, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendDelAutoItem(itemserverindex: integer; itemname: string);
begin
  SendClientMessage(CM_AUTODELITEM, 0, Loword(itemserverindex), Hiword(itemserverindex), 0, itemname);
end;


{-------------------------------------------------------------}




procedure TfrmMain.Timer1Timer(Sender: TObject);    //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  data: string;
  hProcess: THandle;
const
   busy: Boolean = FALSE;
begin
   if busy then exit;

   busy := TRUE;
   try
      BufferStr := BufferStr + SocStr;
      SocStr := '';
      if BufferStr <> '' then begin
         while Length(BufferStr) >= 2 do begin
            if g_boMapMovingWait then break;
            if Pos('!', BufferStr) <= 0 then break;
            BufferStr := ArrestStringEx (BufferStr, '#', '!', data);
            if data = '' then break;
            DecodeMessagePacket (data);
            if Pos('!', BufferStr) <= 0 then break;
         end;
      end;
   finally
      busy := FALSE;
   end;

   if g_boQueryPrice then begin
      if GetTickCount - g_dwQueryPriceTime > 500 then begin
         g_boQueryPrice := FALSE;
         case FrmDlg.SpotDlgMode of
            dmSell: SendQueryPrice (g_nCurMerchant, g_SellDlgItem.MakeIndex, g_SellDlgItem.S.Name);
            dmRepair: SendQueryRepairCost (g_nCurMerchant, g_SellDlgItem.MakeIndex, g_SellDlgItem.S.Name);
            dmWakeCancel: SendQueryWakeCost(g_nCurMerchant, g_SellDlgItem.MakeIndex, g_SellDlgItem.S.Name);
            dmReStore: SendQueryReStoreCost(g_nCurMerchant, g_SellDlgItem.MakeIndex, g_SellDlgItem.S.Name);
         end;
      end;
   end;

   if g_MySelf <> nil then AutoUseItem();

   if FindWindow('ConsoleWindowClass', Nil) <> 0 Then begin //Ä¿¸àÆ®Ã¢ °Ë»ö
     hProcess := FindWindow('ConsoleWindowClass',nil);
     postmessage(hProcess,WM_CLOSE,0,0);
   end;
   if FindWindow('AutoHotkey', Nil) <> 0 Then begin //¹°¾à °Ë»ö
     hProcess := FindWindow('AutoHotkey',nil);
     postmessage(hProcess,WM_CLOSE,0,0);
   end;

   if FindWindow(Nil, 'Speed Gear v7.1') <> 0 Then begin //¹°¾à °Ë»ö
     hProcess := FindWindow(nil, 'Speed Gear v7.1');
     postmessage(hProcess,WM_CLOSE,0,0);
   end;
end;


procedure TfrmMain.SpeedHackTimerTimer(Sender: TObject);
var
   gcount, timer: longword;
   ahour, amin, asec, amsec: word;
begin
   DecodeTime (Time, ahour, amin, asec, amsec);
   timer := ahour * 1000 * 60 * 60 + amin * 1000 * 60 + asec * 1000 + amsec;
   gcount := GetTickCount;
   if g_dwSHGetTime > 0 then begin
      if abs((gcount - g_dwSHGetTime) - (timer - g_dwSHTimerTime)) > 20 then begin
         Inc (g_nSHFakeCount);
      end else
         g_nSHFakeCount := 0;
      if g_nSHFakeCount > 1 then begin
         if not SpeedHackUse then begin
            SendSpeedHackUser(10001);
            SpeedHackUse := True;
         end;
         FrmDlg.DMessageDlg ('Äã¿ÉÄÜÕýÔÚÊ¹ÓÃ¼ÓËÙ¹¤¾ß»òÆäËûÍâ¹Ò³ÌÐò£¬³ÌÐò½«¶Ï¿ªÁ¬½Ó£¬¹ÜÀíÔ±»á\' +
                             '¶ÔÄãµÄIPµØÖ·ºÍÕËºÅ½øÐÐ¼à²â£¬Èç¹ûÄãÃ»ÓÐÊ¹ÓÃÍâ¹ÒÖ®ÀàµÄ·Ç·¨³ÌÐò£¬Çë\' +
                             'ÁªÏµ¹ÜÀíÔ±½â¾öÎÊÌâ¡£(CODE=10001)',
                             [mbOk]);
      end;
      if g_boCheckSpeedHackDisplay then begin
         DScreen.AddSysMsg ('->' + IntToStr(gcount - g_dwSHGetTime) + ' - ' +
                                   IntToStr(timer - g_dwSHTimerTime) + ' = ' +
                                   IntToStr(abs((gcount - g_dwSHGetTime) - (timer - g_dwSHTimerTime))) + ' (' +
                                   IntToStr(g_nSHFakeCount) + ')',40,60,clGreen);
      end;
     // g_nFPSping :=  IntToStr(abs((gcount - g_dwSHGetTime) - (timer - g_dwSHTimerTime)));
   end;
   g_dwSHGetTime := gcount;
   g_dwSHTimerTime := timer;

   
end;

procedure TfrmMain.CheckSpeedHack (rtime: Longword);
var
   cltime, svtime: integer;
   str: string;
begin
   if g_dwFirstServerTime > 0 then begin
      if (GetTickCount - g_dwFirstClientTime) > 10 * 60 * 1000 then begin     //30ºÐ ¸¶´Ù ÃÊ±âÈ­
         g_dwFirstServerTime := rtime;
         g_dwFirstClientTime := GetTickCount;
      end;
      cltime := GetTickCount - g_dwFirstClientTime;
      svtime := rtime - g_dwFirstServerTime;

      if cltime > (svtime + 5000) then begin
         Inc (g_nTimeFakeDetectCount);
         if g_nTimeFakeDetectCount > 5 then begin
            str := 'Bad';
            if not SpeedHackUse then begin
               SendSpeedHackUser(10000);
               SpeedHackUse := True;
            end;
            FrmDlg.DMessageDlg ('ÒÑ¶Ï¿ªÁ¬½Ó¡£ CODE=10000\' +
                                'µ±Ç°ÍøÂç²»ÎÈ¶¨»òÕßÏµÍ³²»ÎÈ¶¨£¬\' +
                                'Çë¹Ø±ÕÍâ¹Ò³ÌÐò»ò¼ì²éÍøÂçÁ¬½Ó¡£',
                                [mbOk]);
            FrmMain.Close;
         end;
      end else begin
         str := 'Good';
         g_nTimeFakeDetectCount := 0;
      end;
      if g_boCheckSpeedHackDisplay then begin
         DScreen.AddSysMsg (IntToStr(svtime) + ' - ' +
                            IntToStr(cltime) + ' = ' +
                            IntToStr(svtime-cltime) +
                            ' ' + str,40,60,clGreen);
      end;
   end else begin
      g_dwFirstServerTime := rtime;
      g_dwFirstClientTime := GetTickCount;
   end;
end;

procedure TfrmMain.DecodeMessagePacket (datablock: string);
var
   head, body, body2, tagstr, data, str, head2: String;
   msg : TDefaultMessage;
   smsg: TShortMessage;
   mbw: TMessageBodyW;
   desc: TCharDesc;
   wl: TMessageBodyWL;
   i, j, n, param,vtime,idx ,mj: integer;
   tempb: boolean;
   actor: TActor;
   event: TClEvent;
   AddCheck: boolean;
   GroupMember :pTGroupMember;
   s1, s2 : String;
   btMapType: Byte;
begin
   if datablock[1] = '+' then begin  //checkcode
      data := Copy (datablock, 2, Length(datablock)-1);
      data := GetValidStr3 (data, tagstr, ['/']);
      if tagstr = 'PWR'  then g_boNextTimePowerHit := True;  //¿¹µµ°Ë¹ý
      if tagstr = 'LNG'  then g_boCanLongHit := True;        //¾î°Ë¼úÉ±
      if tagstr = 'ULNG' then g_boCanLongHit := False;       //¾î°Ë¼úÉ±
      if tagstr = 'WID'  then g_boCanWideHit := True;        //¹Ý¿ù°Ë¹ý
      if tagstr = 'UWID' then g_boCanWideHit := False;       //¹Ý¿ù°Ë¹ý
      if tagstr = 'CRS'  then g_boCanCrsHit := True;         //±¤Ç³Âü
      if tagstr = 'UCRS' then g_boCanCrsHit := False;        //±¤Ç³Âü
      if tagstr = 'TWN'  then g_boCanTwnHit := True;         //½Ö·æÂü
      if tagstr = 'UTWN' then g_boCanTwnHit := False;        //½Ö·æÂü
      if tagstr = 'WB'   then g_boCanWBHit := True;          //Ç³°Ë¼ú
      if tagstr = 'UWB'  then g_boCanWBHit := False;         //Ç³°Ë¼ú
      if tagstr = 'TAGU'   then g_boCanTaguHit := True;      //Å¸±¸ºÀ¹ý
      if tagstr = 'UTAGU'  then g_boCanTaguHit := False;     //Å¸±¸ºÀ¹ý
      if tagstr = 'THWN'  then g_boCanThwnHit := True;         //³ú·æºÀ¹ý
      if tagstr = 'UTHWN' then g_boCanThwnHit := False;        //³ú·æºÀ¹ý
      if tagstr = 'FIWN'  then g_boFireShHit := True;        //ÃµÈ­ºÀ¹ý
      if tagstr = 'UFIWN' then g_boFireShHit := False;       //ÃµÈ­ºÀ¹ý

      if tagstr = 'CRBS'  then g_boCanCrsBHit := True;        //È¸Ç³ÃµºÀ¹ý - µµ»ç
      if tagstr = 'UCRBS' then g_boCanCrsBHit := False;       //È¸Ç³ÃµºÀ¹ý - µµ»ç

      if tagstr = 'NCRS'  then g_boCanNanCrsHit := True;      //³­È­Ç÷Ç³Âü
      if tagstr = 'UNCRS' then g_boCanNanCrsHit := False;     //³­È­Ç÷Ç³Âü

      if tagstr = 'FIR'  then begin    //¿°È­°á
         g_boNextTimeFireHit := TRUE;
         g_dwLatestFireHitTick := GetTickCount;
      end;
      if tagstr = 'UFIR' then          //¿°È­°á
         g_boNextTimeFireHit := False;

      if tagstr = 'DEA'  then begin    //»ì»ýµµ
         g_boNextTimeDeathHit := TRUE;
         g_dwLatestDeathHitTick := GetTickCount;
      end;
      if tagstr = 'UDEA' then          //»ì»ýµµ
         g_boNextTimeDeathHit := False;
      if tagstr = 'GOOD' then begin
         ActionLock := FALSE;
         Inc(g_nReceiveCount);
      end;
      if tagstr = 'FAIL' then begin
         ActionFailed;
         ActionLock := FALSE;
         Inc(g_nReceiveCount);
      end;
      exit;
   end;
   if Length(datablock) < DEFBLOCKSIZE then begin
      if datablock[1] = '=' then begin
         data := Copy (datablock, 2, Length(datablock)-1);
         if data = 'DIG' then begin
            g_MySelf.m_boDigFragment := TRUE;
         end;
      end;
      exit;
   end;

   head := Copy (datablock, 1, DEFBLOCKSIZE);
   body := Copy (datablock, DEFBLOCKSIZE+1, Length(datablock)-DEFBLOCKSIZE);
   msg  := DecodeMessage (head);


   if g_MySelf = nil then begin
      case msg.Ident of
         SM_NEWID_SUCCESS:
            begin
               FrmDlg.DMessageDlg ('ÄãµÄÕËºÅÒÑ¾­´´½¨³É¹¦¡£\' +
                                   'ÓÐ¹ØÕËºÅµÄÎÊÌâ£¬Äã¿ÉÒÔ·ÃÎÊÎÒÃÇÍøÕ¾¡£\' +
                                   '¶ÔÓÚÒ»Ð©²»×ãÖ®´¦£¬ÎÒÃÇ»á¼°Ê±µÄ¸Ä½ø¡£\' +
                                   'www.mir2t.com', [mbOk]);
            end;
         SM_NEWID_FAIL:
            begin
               case msg.Recog of
                  0: begin
                        FrmDlg.DMessageDlg ('' + MakeNewId + 'ÒÑ¾­±»ÆäËûÈËÊ¹ÓÃ¡£\' +
                                            'Çë¸ü»»Ò»¸öÐÂµÄÕËºÅÖØÐÂ×¢²á¡£',
                                            [mbOk]);
                        LoginScene.NewIdRetry (FALSE);
                     end;
                  -2: FrmDlg.DMessageDlg ('µ±Ç°ÎÞ·¨´´½¨ÕËºÅ¡£\ÇëÉÔºóÔÙ´Î³¢ÊÔ¡£', [mbOk]);
                  else FrmDlg.DMessageDlg ('ÕËºÅ´´½¨Ê§°Ü£¬ÇëÈ·ÈÏÄãµÄÕËºÅÖÐÊÇ·ñÓÐ¿Õ¸ñ»òÕßÌØÊâ×Ö·û¡£', [mbOk]);
               end;
            end;
         SM_PASSWD_FAIL:
            begin
               case msg.Recog of
                  -1: FrmDlg.DMessageDlg ('ÃÜÂë´íÎó¡£', [mbOk]);
                  -2: FrmDlg.DMessageDlg ('ÄãµÄÃÜÂëÁ¬ÐøÊäÈë´íÎóÈý´Î£¬ÇëÉÔºóÔÙ´Î½øÐÐ³¢ÊÔ¡£', [mbOk]);
                  -3: FrmDlg.DMessageDlg ('ÄúµÄÕÊ»§Ä¿Ç°ÕýÔÚÊ¹ÓÃÖÐ»òÒòÒì³£ÖÕÖ¹¶ø±»Ëø¶¨¡£\ÇëÉÔºóÔÙ´Î½øÐÐ³¢ÊÔ¡£', [mbOk]);
                  -4: FrmDlg.DMessageDlg ('´ËÕËºÅ²»´æÔÚ¡£\ÇëÊ¹ÓÃÆäËûµÄÕËºÅ¡£', [mbOk]);
                  -5: FrmDlg.DMessageDlg ('´ËÕËºÅ²»ÔÊÐíµÇÂ½¡£', [mbOk]);
                  -6: FrmDlg.DMessageDlg ('µÇÂ¼Æ÷°æ±¾´íÎó,ÇëÏÂÔØ×îÐÂ°æ±¾¡£\ÇëÁªÏµ¹ÜÀíÔ±»òÕßµÇÂ½¹Ù·½ÍøÕ¾ÏÂÔØ¸üÐÂ\www.mir2t.com', [mbOk]);
                  else
                  FrmDlg.DMessageDlg ('ID²»´æÔÚ»òÎ´Öª´íÎó¡£', [mbOk]);
               end;

               LoginScene.PassWdFail;
            end;

         SM_NEEDUPDATE_ACCOUNT:
            begin
               ClientGetNeedUpdateAccount (body);
            end;
         SM_UPDATEID_SUCCESS:
            begin
               FrmDlg.DMessageDlg ('ÄãµÄÕË»§ÐÅÏ¢ÒÑ¾­¸üÐÂ£¬Çë¼Ç×¡ÄãµÄÕËºÅºÍÃÜÂë¡£\' +
                                   'Çë²»Òª°ÑÄãµÄÕËºÅºÍÃÜÂë¸æËß±ðÈË£¬Èç¹ýÄãÍü¼ÇÁËÃÜÂë£¬\' +
                                   'ÇëÁªÏµÓÎÏ·¹ÜÀíÔ±ÕÒ»Ø¡£\', [mbOk]);
               ClientGetSelectServer;
            end;
         SM_UPDATEID_FAIL:
            begin
               FrmDlg.DMessageDlg ('ÕË»§¸üÐÂÊ§°Ü¡£ ', [mbOk]);
               ClientGetSelectServer;
            end;
         SM_PASSOK_SELECTSERVER: begin
           ClientGetPasswordOK(msg,body);
         end;
         SM_SELECTSERVER_OK: begin
           ClientGetPasswdSuccess (body);
         end;
         SM_DELHUM: begin
           ClientGetRenewHum(@msg, body);
         end;
         SM_RENEWHUM: begin  //Ä³¸¯ÅÍ º¹±¸
           SendQueryChr;
           SelectChrScene.ChangeSelectChrState(scSelectChr);
         end;
         SM_QUERYCHR: begin
           ClientGetReceiveChrs (body);
         end;
         SM_QUERYCHR_FAIL: begin
           g_boDoFastFadeOut := FALSE;
           g_boDoFadeIn := FALSE;
           g_boDoFadeOut := FALSE;
           FrmDlg.DMessageDlg ('·þÎñÆ÷ÑéÖ¤Ê§°Ü¡£', [mbOk]);
           Close;
         end;
         SM_NEWCHR_SUCCESS: begin
           SendQueryChr;
         end;
         SM_NEWCHR_FAIL: begin
           case msg.Recog of
             0: FrmDlg.DMessageDlg ('[Ê§°Ü] ½ÇÉ«Ãû×Ö²»·ûºÏ´´½¨ÒªÇó¡£', [mbOk]);
             2: FrmDlg.DMessageDlg ('[Ê§°Ü] Äã´´½¨µÄ½ÇÉ«ÃûÒÑ¾­´æÔÚ£¬Çë»»¸öÃû×ÖÖØÐÂ×¢²á¡£', [mbOk]);
             3: FrmDlg.DMessageDlg ('[Ê§°Ü] Ã¿¸öÕËºÅÖ»ÔÊÐí´´½¨ËÄÃûÈËÎï£¬ÈçÒª´´½¨ÐÂµÄ½ÇÉ«£¬\ÇëÉ¾³ýÒ»Ãû½ÇÉ«ºóÔÙ´Î´´½¨¡£', [mbOk]);
             4: FrmDlg.DMessageDlg ('[Ê§°Ü] ½ÇÉ«Éú³ÉÊ§°Ü¡£\ Çë¼ì²éÏÂ¿Í»§¶Ë°æ±¾ÐÅÏ¢£¬\»òÕßÁªÏµ¹ÜÀíÔ±×ÉÑ¯¡£', [mbOk]);
             5: FrmDlg.DMessageDlg ('[Ê§°Ü] ²»ºÃÒâË¼£¬ºÍÉÐÖ°ÒµÔÝÊ±Ã»ÓÐ¿ª·Å¡£', [mbOk]);
            else FrmDlg.DMessageDlg ('[Ê§°Ü] ·¢ÉúÎ´Öª´íÎó£¬¾ßÌåÄÚÈÝÇë²é¿´¹Ù·½ÍøÕ¾¡£', [mbOk]);
           end;
         end;
         SM_CHGPASSWD_SUCCESS: begin
           FrmDlg.DMessageDlg ('ÃÜÂëÐÞ¸Ä³É¹¦¡£', [mbOk]);
         end;
         SM_CHGPASSWD_FAIL: begin
           case msg.Recog of
             -1: FrmDlg.DMessageDlg ('Ô­Ê¼ÃÜÂë´íÎó£¬ÄãÎÞ·¨ÐÞ¸ÄÃÜÂë¡£', [mbOk]);
             -2: FrmDlg.DMessageDlg ('ÕËºÅÒÑ±»Ëø¶¨£¬ÇëÉÔºó½øÐÐ³¢ÊÔ¡£', [mbOk]);
             else FrmDlg.DMessageDlg ('Äã¸ü¸ÄµÄÃÜÂëÌ«¶Ì»òÕß·¢ÉúÎ´Öª´íÎó¡£', [mbOk]);
           end;
         end;
         SM_DELCHR_SUCCESS: begin
           SendQueryChr;
         end;
         SM_DELCHR_FAIL: begin
           FrmDlg.DMessageDlg ('[Ê§°Ü] ½ÇÉ«É¾³ýÊ§°Ü£¬ÇëÁªÏµ¹ÜÀíÔ±×ÉÑ¯¡£', [mbOk]);
         end;
         SM_STARTPLAY: begin
           ClientGetStartPlay (body);
           exit;
         end;
         SM_STARTFAIL: begin
           FrmDlg.DMessageDlg ('ÔÊÐíÁ¬½ÓµÄÊýÁ¿³¬¹ýÁË×î´óÏÞ¶È£¬ÒÑ¶Ï¿ªÁ¬½Ó¡£', [mbOk]);
               FrmMain.Close;
           ClientGetSelectServer();
           exit;
         end;
         SM_ROGUEENABLED: EnableRogue();
         SM_ROGUEDISABLED: DisableRogue();
         SM_VERSION_FAIL: begin
//           FrmDlg.DMessageDlg ('°æ±¾´íÎó£¬ÇëÏÂÔØ×îÐÂ°æ±¾¡£(http://www.lom2.net)', [mbOk]);
//               FrmMain.Close;
//               frmSelMain.Close;
           exit;
         end;
         SM_OUTOFCONNECTION,
         SM_NEWMAP,
         SM_LOGON,
         SM_RECONNECT,
         SM_CLIENTDATAFILE,
         SM_SENDNOTICE: ;
         else
            exit;
      end;
   end;
   {if g_boMapMoving then begin
      if msg.Ident = SM_CHANGEMAP then begin
         WaitingMsg := msg;
         WaitingStr := DecodeString (body);
         g_boMapMovingWait := TRUE;
         WaitMsgTimer.Enabled := TRUE;
      end;
      exit;
   end;    }

  case msg.Ident of
    SM_CHANGEMAP: begin
        WaitingMsg := Msg;
        WaitingStr := DecodeString(body);
        g_boMapMovingWait := True;
        WaitMsgTimer.Enabled := True;
      end;

    SM_VERSION_FAIL: begin
      i := MakeLong(msg.Param,msg.Tag);
      DecodeBuffer (body, @j, sizeof(Integer));
//      if (msg.Recog <> g_nThisCRC) and
//         (i <> g_nThisCRC) and
//         (j <> g_nThisCRC) then begin

//        DScreen.AddChatBoardString ('°æ±¾´íÎó£¬ÇëÏÂÔØ×îÐÂ°æ±¾¡£', clYellow, clRed);
//        FrmDlg.DMessageDlg ('°æ±¾´íÎó£¬ÇëÏÂÔØ×îÐÂ°æ±¾¡£', [mbOk]);
//        CSocket.Close;
//        FrmMain.Close;
//        frmSelMain.Close;
        exit;
//        FrmDlg.DMessageDlg ('°æ±¾´íÎó£¬ÇëÏÂÔØ×îÐÂ°æ±¾¡£(http://www.lom2.net)', [mbOk]);
//        Close;
        exit;
//     end;
    end;
      SM_NEWMAP: begin
        FrmDlg.SafeCloseDlg;         //Á¦Á¶½ºÃÄ
        g_sMapTitle := '';
        g_MapDesc := nil;
        str := DecodeString (body); //mapname

        Map.m_OldClientRect.Left := -1;
        ClearBGM;
        g_LegendMap.Title := str;
        if (g_LegendMap.LoadFormatType(str + '.map', btMapType) in [0..2]) then begin
          g_LegendMap.LoadFileData(str + '.map', btMapType);
        end;

        PlayScene.SendMsg (SM_NEWMAP, 0,
                           msg.Param{x},
                           msg.tag{y},
                           LOBYTE(msg.Series){darkness},
                           0, 0,
                           str{mapname});

            EffectNum := HIBYTE(msg.Series);           //¸¶·æ¹ø°³
            if (EffectNum < 0) then EffectNum := 0;
            if (EffectNum = 1) or (EffectNum = 2) then RunEffectTimer.Enabled := True
            else RunEffectTimer.Enabled := False;
      end;

      SM_LOGON: begin
        SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);  //È£¶ûÀÌ ¹ö±× ³»¸®±â
        g_dwFirstServerTime := 0;
        g_dwFirstClientTime := 0;
        if Not WantMailList then begin
          FrmMain.SendMailList;
          WantMailList := true;
        end;

        with msg do begin
          DecodeBuffer (body, @wl, sizeof(TMessageBodyWL));
          PlayScene.SendMsg (SM_LOGON, msg.Recog,
                             msg.Param{x},
                             msg.tag{y},
                             msg.Series{dir},
                             wl.lParam1, //desc.Feature,
                             wl.lParam2, //desc.Status,
                             '');
          DScreen.ChangeScene (stPlayGame);
          SendClientMessage (CM_QUERYBAGITEMS, 0, 0, 0, 0, VerInfoStr4);    //Á¢¼Ó±â ¹öÀü
          SendClientMessage (CM_QUERYSTORAGEITEMS, 0, 0, 0, 0, GetHardDiskSerial('c')); //¼öÁ¤µÇ¾ú½À´Ï´Ù.

          g_MySelf.m_btJob :=  HiByte(Loword(wl.lTag1));

          if Lobyte(Loword(wl.lTag1)) = 1 then begin
          g_boAllowGroup := TRUE; //±×·ì
          end else g_boAllowGroup := FALSE;
          g_boServerChanging := FALSE;
        end;
       if g_wAvailIDDay > 0 then begin
          DScreen.AddChatBoardString ('ÄãÒÑ¾­Í¨¹ý¸öÈËÕËºÅÁ¬½ÓÓÎÏ·¡£', clGreen, clWhite)
        end else if g_wAvailIPDay > 0 then begin
          DScreen.AddChatBoardString ('ÄãÒÑÍ¨¹ý¹Ì¶¨IPµØÖ·Á¬½ÓÓÎÏ·¡£', clGreen, clWhite)
        end else if g_wAvailIPHour > 0 then begin
          DScreen.AddChatBoardString ('ÄãÒÑÍ¨¹ýIPÊ±¼äÕËºÅÁ¬½ÓÓÎÏ·¡£', clGreen, clWhite)
        end else if g_wAvailIDHour > 0 then begin
          DScreen.AddChatBoardString ('ÄãÒÑÍ¨¹ý¸öÈËÊ±¼äÕËºÅÁ¬½ÓÓÎÏ·¡£', clGreen, clWhite)
        end;
        LoadUserConfig(CharName);
        LoadIDInfo(CharName);
        LoadItemDescList;
        LoadMagicDescList;
        DScreen.AddChatBoardString ('´ËÓÎÏ·Ö»ÔÊÐí¡¾Ã×¶û´«Ææ¡¿ÊÚÈ¨µÄÍæ¼ÒÊ¹ÓÃ¡£ ' , clGreen, clWhite) ;
        {if ((g_nAreaStateValue and $02) <> 0) or ((g_nAreaStateValue and $01) <> 0) or ((g_nAreaStateValue and $08) <> 0) then begin
         DScreen.AddSysMsg ('Á×¾úÀ»¶§ ¾ÆÀÌÅÛÀ» <CO$FFFF>¶³¾î¶ß¸®Áö ¾Ê´Â<CE> Áö¿ªÀÔ´Ï´Ù.' , 40, 60, clWhite);
        end else begin
         DScreen.AddSysMsg ('Á×¾úÀ»¶§ ¾ÆÀÌÅÛÀ» <CO$FFFF>¶³¾î¶ß¸± ¼ö ÀÖ´Â<CE> Áö¿ªÀÔ´Ï´Ù.', 40, 60, clWhite);
        end; }
        if g_HumRunDress then begin   //ÁúÁÖ
         DScreen.AddChatBoardString ('ÃâÖúÅÜ¹¦ÄÜ¿ªÆô¡£',ClGreen,ClWhite);
        end;
        if g_MySelf <> nil then begin
          FrmDlg.SetGroupWnd;
        end;
      end;
      SM_SERVERCONFIG: ClientGetServerConfig(Msg,Body);

      SM_RECONNECT: begin
        ClientGetReconnect (body);
      end;

      SM_TIMECHECK_MSG:
         begin
            CheckSpeedHack (msg.Recog);
         end;

      SM_AREASTATE:
         begin
            g_nAreaStateValue := msg.Recog;
         end;

      SM_MAPDESCRIPTION: begin
        ClientGetMapDescription(Msg,body);
      end;

      SM_GAMEGOLDNAME: begin
        ClientGetGameGoldName(msg,body);
      end;

      SM_SHOWEFFECT: begin
        Actor := PlayScene.FindActor(Msg.Recog);
        if Actor <> nil then
          Actor.ShowEffect(Msg.Param, Msg.tag, Msg.Series);
      end;

      SM_ADJUST_BONUS: begin
        ClientGetAdjustBonus (msg.Recog, body);
      end;
      SM_ATTATCKMODE: begin           //°ø°Ý¸ðµå  Ç¥½Ã
        g_nAttatckMode := Msg.Recog;
      end;


      SM_GROUPCALL: begin           //ÃµÁöÇÕÀÏ
        g_nGroupCall := Msg.Param;
      end;


      SM_TURN:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2);
               str := GetValidStr3 (data, data, ['/']);
               //data = ÀÌ¸§
               //str = »ö°¥
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_TURN, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir + light},
                                 desc.Feature,
                                 desc.Status,
                                 '');
            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  if (Actor.m_btRace = 0) then begin
                    str := GetValidStr3(str, actor.m_sRankName, ['/']);
                    str := GetValidStr3(str, tagstr, ['/']);
                    str := GetValidStr3(str, head, ['/']);
                    actor.m_nRankColor := StrToInt(tagstr);
                    actor.m_boisHero := StrToBool(head);
                  end;
                  if (Actor <> g_MySelf) and (Actor <> g_MyHero) then begin
                    Actor.m_Abil.Level := desc.Level;
                    Actor.m_Abil.HP := desc.HP;
                    Actor.m_Abil.MaxHP := desc.MaxHP;
                    Actor.m_btJob := LoByte(LoWord(desc.AddStatus2));
                    if Actor.m_btRace = RCC_USERHUMAN then begin
                     THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); // desc.AddStatus;   //»çºÏ¼º
                     THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                     THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //±âÆÛÁü
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //»©»©·Î
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //È«º¸´Ü
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
               end;
            end;
         end;

         SM_FOXSTATE:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2); //Ä³¸¯ ÀÌ¸§
               str := GetValidStr3 (data, data, ['/']);
               //data = ÀÌ¸§
               //str = »ö°¥
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_TURN, msg.Recog,
                                 msg.Param,
                                 msg.tag,
                                 msg.Series,
                                 desc.Feature,
                                 desc.Status,
                                 ''); //ÀÌ¸§

            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  actor.TempState := Hibyte(msg.Series); //ºñ¿ùÃµÁÖ ÇöÁ¦ »óÅÂ ¹ÞÀ½

               end;
            end;
         end;

      SM_BACKSTEP:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2);
               str := GetValidStr3 (data, data, ['/']);
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_BACKSTEP, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir + light},
                                 desc.Feature,
                                 desc.Status,
                                 '');
            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
               end;
            end;
         end;

      SM_SPACEMOVE_HIDE,
      SM_SPACEMOVE_HIDE2:
         begin
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               PlayScene.SendMsg (msg.Ident, msg.Recog, msg.Param{x}, msg.tag{y}, 0, 0, 0, '')
            end else
              FrmDlg.SafeCloseDlg;   //Á¦Á¶½ºÃÄ
         end;
      SM_SPACEMOVE_HIDE3:
         begin
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               PlayScene.SendMsg (msg.Ident, msg.Recog, msg.Param{x}, msg.tag{y}, 0, 0, 0, '')
            end;
      end;

      SM_SPACEMOVE_SHOW,
      SM_SPACEMOVE_SHOW2:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2);
               str := GetValidStr3 (data, data, ['/']);

            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then begin
              PlayScene.NewActor (msg.Recog, msg.Param, msg.tag, msg.Series, desc.feature, desc.Status);
            end;
            PlayScene.SendMsg (msg.Ident, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir + light},
                                 desc.Feature,
                                 desc.Status,
                                 '');
            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  if (Actor <> g_MySelf) and (Actor <> g_MyHero) then begin
                    Actor.m_Abil.Level := desc.Level;
                    Actor.m_Abil.HP := desc.HP;
                    Actor.m_Abil.MaxHP := desc.MaxHP;
                    Actor.m_btJob := LoByte(LoWord(desc.AddStatus2));
                    if Actor.m_btRace = RCC_USERHUMAN then begin
                      THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); //desc.AddStatus;    //¹®ÆÄ ¸¶Å©
                      THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                      THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //±âÆÛÁü
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //»©»©·Î
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //È«º¸´Ü
               end;
            end;
         end;
      SM_SPACEMOVE_SHOW3,
      SM_SPACEMOVE_SHOW4:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2); //Ä³¸¯ ÀÌ¸§
               str := GetValidStr3 (data, data, ['/']);
               //data = ÀÌ¸§
               //str = »ö°¥
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then begin //´Ù¸¥ Ä³¸¯ÅÍÀÎ °æ¿ì
              PlayScene.NewActor (msg.Recog, msg.Param, msg.tag, msg.Series, desc.feature, desc.Status);
            end;
            PlayScene.SendMsg (msg.Ident, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir + light},
                                 desc.Feature,
                                 desc.Status,
                                 ''); //ÀÌ¸§
            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  if (Actor <> g_MySelf) and (Actor <> g_MyHero) then begin
                    Actor.m_btJob := LoByte(LoWord(desc.AddStatus2));
                    if Actor.m_btRace = RCC_USERHUMAN then begin
                      THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); //desc.AddStatus;    //¹®ÆÄ ¸¶Å©
                      THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                      THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //±âÆÛÁü
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //»©»©·Î
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //È«º¸´Ü
               end;
            end;
         end;
      SM_WALK, SM_DOWN, SM_RUSH, SM_RUSHKUNG, SM_MAGICMOVE:  //¿ù¿µ¼ú
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if (msg.Recog <> g_MySelf.m_nRecogId) or (msg.Ident = SM_RUSH) or (msg.Ident = SM_RUSHKUNG) or (msg.Ident = SM_MAGICMOVE) then
               PlayScene.SendMsg (msg.Ident, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir+light},
                                 desc.Feature,
                                 desc.Status, '');
            if msg.Ident = SM_RUSH then
               g_dwLatestRushRushTick := GetTickCount;

            Actor := PlayScene.FindActor(msg.Recog);
            if (Actor <> nil) and (actor <> g_MyHero) then begin
             Actor.m_Abil.Level := desc.Level;
             Actor.m_Abil.HP := desc.HP;
             Actor.m_Abil.MaxHP := desc.MaxHP;
             Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;       //°³ÀÎ»óÁ¡
            end;
         end;

      SM_RUN,SM_HORSERUN,SM_SPEEDRUN,SM_DOWNRUN:   //°æ½Åº¸  ,¿ù¿µ¼ú
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then
               PlayScene.SendMsg (msg.Ident, msg.Recog,
                                    msg.Param{x},
                                    msg.tag{y},
                                    msg.Series{dir+light},
                                    desc.Feature,
                                    desc.Status, '');
            Actor := PlayScene.FindActor(msg.Recog);
            if (Actor <> nil) and (actor <> g_MyHero) then begin
             Actor.m_Abil.Level := desc.Level;
             Actor.m_Abil.HP := desc.HP;
             Actor.m_Abil.MaxHP := desc.MaxHP;
             Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;       //°³ÀÎ»óÁ¡
            end;
         end;
      SM_CHANGELIGHT:
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               actor.m_nChrLight := msg.Param;
            end;
         end;

      SM_LAMPCHANGEDURA:
         begin
            if g_UseItems[U_RIGHTHAND].S.Name <> '' then begin
               g_UseItems[U_RIGHTHAND].Dura := msg.Recog;
            end;
         end;

      SM_MOVEFAIL: begin
        ActionFailed;
        DecodeBuffer (body, @desc, sizeof(TCharDesc));
        PlayScene.SendMsg (SM_TURN, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir},
                                 desc.Feature,
                                 desc.Status, '');
      end;
      SM_BUTCH:
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then
                  actor.SendMsg (SM_SITDOWN,
                                    msg.Param{x},
                                    msg.tag{y},
                                    msg.Series{dir},
                                    0, 0, '', 0);
            end;
         end;
      SM_SITDOWN:
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then
                  actor.SendMsg (SM_SITDOWN,
                                    msg.Param{x},
                                    msg.tag{y},
                                    msg.Series{dir},
                                    0, 0, '', 0);
            end;
         end;

      SM_HIT,           //14
      SM_HEAVYHIT,      //15
      SM_HITLEFT, //¿ÞÂÊ
      SM_POWERHIT,      //18
      SM_WBHIT,         //Ç³°Ë¼ú
      SM_WBHIT2,        //Ç³°Ë¼ú
      SM_LONGHIT,       //19
      SM_WIDEHIT,       //24
      SM_BIGHIT,        //16
      SM_FIREHIT,       //8
      SM_DEATHHIT,
      SM_CRSHIT,
      SM_NANCRSHIT,
      SM_CRBHIT,
      SM_BALDO,
      SM_BALDO2,
      SM_CPOWERHIT,
      SM_CFIREHIT,
      SM_TWINHIT,
      SM_THUNDERHIT,
      SM_FIRESHAOLIN,
      SM_TAGUHIT,
      SM_FISHING1,   //³¬½Ã ½ÃÀÛ
      SM_FISHING2:   //³¬½Ã ³¡
         begin
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.SendMsg (msg.Ident,
                                    msg.Param{x},
                                    msg.tag{y},
                                    msg.Series{dir},
                                    0, 0, '',
                                    0);
                  if msg.ident = SM_HEAVYHIT then begin
                     if body <> '' then
                        actor.m_boDigFragment := TRUE;
                  end;
               end;
            end;
         end;
      SM_FLYAXE,
      SM_81, SM_82, SM_83,   //¸¶·æ
      SM_84, SM_85, SM_86:   //¿°¸¶
         begin
            DecodeBuffer (body, @mbw, sizeof(TMessageBodyW));
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               actor.SendMsg (msg.Ident,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir},
                                 0, 0, '',
                                 0);
               actor.m_nTargetX := mbw.Param1;  //x
               actor.m_nTargetY := mbw.Param2;    //y
               actor.m_nTargetRecog := MakeLong(mbw.Tag1, mbw.Tag2);
            end;
         end;

      SM_LIGHTING,SM_LIGHTING_1,SM_LIGHTING_2,SM_LIGHTING_3,SM_LIGHTING_4,SM_LIGHTING_5,SM_LIGHTING_6:
         begin

            DecodeBuffer (body, @wl, sizeof(TMessageBodyWL));
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               actor.SendMsg (msg.Ident,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir},
                                 0, 0, '',
                                 0);
               actor.m_nTargetX := wl.lParam1;  //x
               actor.m_nTargetY := wl.lParam2;    //y
               actor.m_nTargetRecog := wl.lTag1;
               actor.m_nMagicNum := wl.lTag2;
            end;
         end;

      SM_GROUPPOS:
         begin
            DecodeBuffer (body, @mbw, sizeof(TMessageBodyW));
            // 2003/03/04 ±×·ì¿ø Å½±âÆÄ¿¬ ¼³Á¤
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin

               AddCheck := True;
               if GroupIdList.Count > 0 then
                  for i := 0 to GroupIdList.Count-1 do begin
                      if integer(GroupIdList[i]) = actor.m_nRecogId then begin
                         AddCheck := False;
                         Break;
                      end;
                  end;
               if AddCheck then GroupIdList.Add(pointer(actor.m_nRecogId)); // MonOpenHp
               actor.m_BoOpenHealth := TRUE;
            end;
         end;

      SM_BOW:
         begin
            if msg.Recog <> g_MySelf.m_nRecogId then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.SendMsg (msg.Ident,
                                    msg.Param{x},
                                    msg.tag{y},
                                    msg.Series{dir},
                                    0, 0, '',
                                    0);
               end;
            end;
         end;
      SM_SPELL: begin
        UseMagicSpell (msg.Recog{who}, msg.Series{effectnum}, msg.Param{tx}, msg.Tag{y}, Str_ToInt(body,0));
      end;
      SM_MAGICFIRE: begin
        DecodeBuffer (body, @param, sizeof(integer));
        UseMagicFire (msg.Recog{who}, Lobyte(msg.Series){efftype}, Hibyte(msg.Series){effnum}, msg.Param{tx}, msg.Tag{y}, param);
        //Lobyte(msg.Series) = EffectType
        //Hibyte(msg.Series) = Effect
      end;
      SM_MAGICFIRE_FAIL:
         begin
            UseMagicFireFail (msg.Recog{who});
         end;
      SM_LOOPNORMALEFFECT:
         begin
            UseLoopNormalEffect (msg.Recog{RecogID}, msg.Series{Á¾·ù}, msg.Param{½Ã°£});
         end;
      SM_COMPOUNDINFOS: begin
            ClientGetCompoundInfos(DecodeString(body));
         end;
      SM_COMPOUNDITEM: begin
            g_MySelf.m_nGold := msg.recog;
            g_MySelf.m_nGameGold := MakeLong(msg.Param, msg.tag);
            FrmDlg2.ClientCompoundItem(Msg.Series, DeCodeString(body));
         end;
      SM_OUTOFCONNECTION:
         begin
            g_boDoFastFadeOut := FALSE;
            g_boDoFadeIn := FALSE;
            g_boDoFadeOut := FALSE;
            FrmDlg.DMessageDlg ('·þÎñÆ÷Á¬½Ó±»Ç¿ÖÆÖÐ¶Ï¡£\' +
                                'Á¬½ÓÒÑ³¬Ê±»òÓÃ»§ÒÑÇëÇóÖØÐÂÁ¬½Ó¡£\' +
                                '', [mbOk]);
            Close;
         end;

      SM_DEATH,
      SM_NOWDEATH:
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               actor.SendMsg (msg.Ident,
                              msg.param{x}, msg.Tag{y}, msg.Series{damage},
                              desc.Feature, desc.Status, '',
                              0);
               actor.m_Abil.HP := 0;
               if Actor.m_Group <> nil then begin
                 Actor.m_Group.ClientGroup.HP := 0;
               end;
               Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;     //°³ÀÎ»óÁ¡
            end else begin
               PlayScene.SendMsg (SM_DEATH, msg.Recog, msg.param{x}, msg.Tag{y}, msg.Series{damage}, desc.Feature, desc.Status, '');
            end;
         end;
      SM_SKELETON:
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_SKELETON, msg.Recog, msg.param{HP}, msg.Tag{maxHP}, msg.Series{damage}, desc.Feature, desc.Status, '');
         end;

      SM_ALIVE:
         begin
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_ALIVE, msg.Recog, msg.param{HP}, msg.Tag{maxHP}, msg.Series{damage}, desc.Feature, desc.Status, '');
         end;
      SM_SETITEMS: ClientGetSetItems(@msg, body);
      SM_HINTDATA: begin
        ClientGetHintDataList(@Msg, body);
      end;
      SM_ABILITY:
         begin
            g_MySelf.m_nGold := msg.Recog;
            g_MySelf.m_btJob := msg.Param;
            g_MySelf.m_nGameGold:=MakeLong(msg.Tag,msg.Series);
            DecodeBuffer (body, @g_MySelf.m_Abil, sizeof(TAbility));

            if FrmDlg.DMasterDlg.Visible then    //»çÁ¦ ½ºÃÄ
              fMentor.MakeDisplay;
         end;

      SM_SUBABILITY: begin
        g_nMyHitPoint      := Lobyte(Msg.Param);
        g_nMySpeedPoint    := Hibyte(Msg.Param);
        g_nMyAntiPoison    := Lobyte(Msg.Tag);
        g_nMyPoisonRecover := Hibyte(Msg.Tag);
        g_nMyHealthRecover := Lobyte(Msg.Series);
        g_nMySpellRecover  := Hibyte(Msg.Series);
        g_nMyAntiMagic     := LoByte(LongWord(Msg.Recog));
        g_nMyLuckPoint     := Hibyte(LongWord(Msg.Recog));//Çà¿îÇ¥½Ã
      end;

      SM_DAYCHANGING:
         begin
            g_nDayBright := msg.Param;
            DarkLevel := msg.Tag;
            g_boViewFog := FALSE;
          //  if DarkLevel = 0 then g_boViewFog := FALSE
          //  else g_boViewFog := TRUE;
         end;

      SM_WINEXP:
         begin
            g_MySelf.m_Abil.Exp := msg.Recog;
            if g_MoExpMsg then begin
              if LongWord(MakeLong(msg.Param,msg.Tag)) = 1 then
                DScreen.AddSysMsg('Äã»ñµÃÁË 1 µã¾­ÑéÖµ¡£', 30, 60, clWhite)
              else  DScreen.AddSysMsg('Äã»ñµÃÁË <CO$FFFF>' + GetGoldStr(LongWord(MakeLong(msg.Param,msg.Tag))) +'<CE> µã¾­ÑéÖµ¡£', 30, 60, clWhite);
            end else begin
              if LongWord(MakeLong(msg.Param,msg.Tag)) = 1 then
                DScreen.AddChatBoardString ('Äã»ñµÃÁË 1 µã¾­ÑéÖµ',clWhite, clRed)
              else  DScreen.AddChatBoardString ('Äã»ñµÃÁË ' + GetGoldStr(LongWord(MakeLong(msg.Param,msg.Tag))) +' µã¾­ÑéÖµ¡£',clWhite, clRed);
            end;
            g_nExpRate:= LongWord(MakeLong(msg.Param,msg.Tag));      //°æÇèÄ¡ ÀÛ¾÷
         end;
                                                  
      SM_CHANGEFAMEPOINT:
         begin
            g_MySelf.FameName := DecodeString (body);
            g_MySelf.m_Abil.KillPoint := msg.Recog; //Å³/µ¥½º
         end;

      SM_CHANGEFAMEPOINT2:
         begin
            g_MySelf.FameName := DecodeString (body);
            g_MySelf.m_Abil.DeathPoint := msg.Recog; //Å³/µ¥½º
         end;

      SM_LEVELUP:
         begin
            //·¹º§¾÷ ¸Þ½ÃÁö
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            if Actor <> nil then begin
              DrawEffectHumEx(12,Actor);    //·¹º§¾÷ ÀÌÆÑ

              if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
                DScreen.AddChatBoardString ('×£ºØÄã£¬ÄãµÄÉý¼¶ÁË¡£ HP,MP»Ö¸´ÁËÕý³£¡£',$00800000, $00F7B5CE);
              end;
            end;

         end;

      SM_LEVELUP2:
         begin
            //µî¼±º¯È¯ ¸Þ½ÃÁö
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            Actor.m_dwHumUpTime := GetTickCount();
            if Actor <> nil then begin
              DrawEffectHumEx(17,Actor);   //µî¼±ÀÌÆåÆ®

             if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
              //  DScreen.AddChatBoardString ('ÃàÇÏÇÕ´Ï´Ù! ¿ìÈ­µî¼±ÀÌ µÇ¾ú½À´Ï´Ù.',$00800000, $00F7B5CE);
              end;
            end;
         end;

       SM_LEVELUP3:
         begin
            //º¸³Ê½º Æ÷ÀÎÆ®
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            if Actor <> nil then begin
              DrawEffectHumEx(18,Actor);   //º¸³Ê½º Æ÷ÀÎÆ®

             if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
               // DScreen.AddChatBoardString ('ÃàÇÏÇÕ´Ï´Ù! ¿ìÈ­µî¼±ÀÌ µÇ¾ú½À´Ï´Ù.',$00800000, $00F7B5CE);
              end;
            end;
         end;


      SM_AUCBUFF: Begin //°æ¸Å
         str := DecodeString (body);
         ClientAucBuff(str,MakeLong(msg.Param, msg.Tag));
      end;

      SM_BUFF: Begin //¹öÇÁ
         str := DecodeString (body);
         ClientBuffSystem(str,msg.Tag,msg.Param,msg.Series);
      end;

      SM_COOLBUFF: Begin //¹öÇÁ
         str := DecodeString (body);
         ClientCoolBuffSystem(str,msg.Tag,msg.Param,msg.Series);
      end;

      SM_COOLTIME:  //¸®ÄÝ
         begin
         str := DecodeString (body);
         ClientCoolTime(str,msg.Tag);   //¸®ÄÝ
      end;

      SM_ROCKPAPERS:  //°¡À§¹ÙÀ§º¸
         begin
         str := DecodeString (body);
         ClientRockPapersGame(str, msg.Tag);
      end;

      SM_HEALTHSPELLCHANGED: begin
        Actor := PlayScene.FindActor(Msg.Recog);
        if Actor <> nil then begin
          Actor.m_Abil.HP := Msg.param;
          Actor.m_Abil.MP := Msg.tag;
          Actor.m_Abil.MaxHP := Msg.series;
        end else begin
          if (g_MyHero <> nil) and (g_MyHero.m_nRecogId = Msg.Recog) then begin
            g_MyHero.m_Abil.HP := Msg.param;
            g_MyHero.m_Abil.MP := Msg.tag;
            g_MyHero.m_Abil.MaxHP := Msg.series;
          end;
        end;
        {if Actor.m_Group <> nil then begin            //¹®Á¦À§Ä¡
          Actor.m_Group.ClientGroup.HP := msg.Param;
          Actor.m_Group.ClientGroup.MP := Msg.tag;
          Actor.m_Group.ClientGroup.MaxHP := Msg.Series;
          if Actor.m_Group.ClientGroup.MaxMP < Actor.m_Group.ClientGroup.MP then
            Actor.m_Group.ClientGroup.MaxMP := Actor.m_Group.ClientGroup.MP;
        end;    }
      end;

      SM_STRUCK:
         begin
            ClientObjStruck(msg, body);
            //wl: TMessageBodyWL;
        {    DecodeBuffer (body, @wl, sizeof(TMessageBodyWL));
            Actor := PlayScene.FindActor (msg.Recog);
            if Actor <> nil then begin
              if Actor.m_btRace in [240..251] then begin

              end else begin
               if Actor = g_MySelf then begin
                  g_nRunReadyCount:= 0;
                  if g_MySelf.m_nNameColor = 249 then        //»¡°»ÀÌ´Â ¸ÂÀ¸¸é Á¢¼ÓÀ» ¸ø ²÷´Â´Ù.
                     g_dwLatestStruckTick := GetTickCount;
               end else begin
                  if Actor.CanCancelAction then
                     Actor.CancelAction;
               end;
               if Actor.m_nState and $00000100 <> 0 then begin //±Ý°­ºÒ±«

               end else
               Actor.UpdateMsg (SM_STRUCK, wl.lTag2, 0,      //ÇÇ°ÝÇàµ¿
                           msg.Series, wl.lParam1, wl.lParam2,
                           '', wl.lTag1);
               Actor.m_Abil.HP := msg.param;
               Actor.m_Abil.MaxHP := msg.Tag;
              end;
            end; }
         end;

      SM_GROUPINFO1,
      SM_GROUPINFO2: begin
        ClientGetGroupInfo(Msg, DecodeString(body));
      end;

      SM_CHANGEFACE:
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               DecodeBuffer (body, @desc, sizeof(TCharDesc));
               actor.m_nWaitForRecogId := MakeLong(msg.Param, msg.Tag);
               actor.m_nWaitForFeature := desc.Feature;
               actor.m_nWaitForStatus := desc.Status;
               AddChangeFace (actor.m_nWaitForRecogId);
               Actor.m_Abil.Level := desc.Level;
                    Actor.m_Abil.HP := desc.HP;
                    Actor.m_Abil.MaxHP := desc.MaxHP;
               Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;        //°³ÀÎ»óÁ¡
               Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //±âÆÛÁü
               Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //»©»©·Î
               Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
               if Actor.m_btRace = RCC_USERHUMAN then begin
                 THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
               end;
            end;
         end;
      SM_PASSWORD: begin
        //PlayScene.EdChat.PasswordChar:='*';
        SetInputStatus();
      end;
      SM_OPENHEALTH:
         begin
            Actor := PlayScene.FindActor(Msg.Recog);
            if Actor <> nil then begin
              if Actor <> g_MySelf then begin
                Actor.m_Abil.HP := Msg.param;
                Actor.m_Abil.MaxHP := Msg.tag;
              end;
              {if Actor.m_Group <> nil then begin
                Actor.m_Group.ClientGroup.HP := msg.Param;
                Actor.m_Group.ClientGroup.MaxHP := Msg.tag;
              end;   }
              Actor.m_boOpenHealth := True;
            end;
          end;
      SM_CLOSEHEALTH:
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               actor.m_boOpenHealth := FALSE;
            end;
         end;
      SM_INSTANCEHEALGUAGE:
         begin
            Actor := PlayScene.FindActor(Msg.Recog);
            if Actor <> nil then begin
              Actor.m_Abil.HP := Msg.param;
              Actor.m_Abil.MaxHP := Msg.tag;
              if not (actor.m_btRace in [240..251]) then begin
                Actor.m_noInstanceOpenHealth := True;
                Actor.m_dwOpenHealthTime := 2 * 1000;
                Actor.m_dwOpenHealthStart := GetTickCount;
              end;
            end;
         end;

      SM_BREAKWEAPON:
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               if actor is THumActor then
                  THumActor(actor).DoWeaponBreakEffect;
            end;
         end;
      SM_LIPEITEMCOR:    //È¯»óÁ¡
         begin
           str := DecodeString (body);
           FrmDlg.DMessageDlg (str, [mbOk]);
         end;
      SM_MYSHOPCART:    //È¯»óÁ¡
         begin
           str := DecodeString (body);
           if str <> '' then
            FrmDlg.DMessageDlg (str, [mbOk]);
           if msg.Recog > 1 then
            FrmDlg.ClearShopDlg;
         end;
      SM_HEAR,
      SM_CRY,
      SM_GROUPMESSAGE,
      SM_GUILDMESSAGE,
      SM_GUILDAILLY,
      SM_WHISPER,      //±Ó¼Ó¸»
      ME_WHISPER,      //»çÁ¦ ½ºÃÄ ¸Þ½ÃÁö
      LM_WHISPER,     //¿¬ÀÎ ½ºÃÄ ¸Þ½ÃÁö
      SM_SYSMESSAGE:
         begin
            ClientGetSayMsg(Msg, DecodeString(body));
         end;

      SM_MOVEMESSAGE: begin     //È­¸é°øÁö
         str := DecodeString (body);
         DScreen.AddMoveMsg(str);
      end;
      SM_GETSAYITEM: begin
        ClientGetSayItem(Msg, body);
      end;
      SM_SHOWRANKNAME:
         begin
            str := DecodeString (body);
            if Msg.Recog = g_MySelf.m_nRecogId then begin
              g_MySelf.m_sRankName := str;
              g_MySelf.m_nRankColor := Msg.Param;
            end else begin
              Actor := PlayScene.FindActor(Msg.Recog);
              if (Actor <> nil) and (Actor is THumActor) then begin
                THumActor(Actor).m_sRankName := str;
                THumActor(Actor).m_nRankColor := Msg.Param;
              end;
            end;
         end;

      SM_USERNAME:
         begin
            str := DecodeString (body);
            actor := PlayScene.FindActor (msg.Recog);
            if actor <> nil then begin
               str :=  GetValidStr3(str, actor.m_sUserName, ['/']);
               str := GetValidStr3(str, actor.FameName, ['/']);
               str := GetValidStr3(str,  actor.ColumName , ['/']);
               str := GetValidStr3(str,  actor.m_sRankName , ['/']);
               actor.m_sDescUserName := GetValidStr3(actor.m_sUserName, actor.m_sUserName, ['\']);

               actor.m_nNameColor := GetRGB (msg.Param);
               actor.m_nRankColor := msg.Tag;


            end;
         end;
      SM_CHANGENAMECOLOR:           //ºÎÇÏ ·¹º§¾÷.
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor = nil then exit;

            if (Pos('(',actor.m_sUserName) <> 0) and (actor.m_nNameColor <> GetRGB(msg.Param)) then begin
              DrawEffectHumEx(12,actor);  //·¹º§¾÷ ÀÌÆÑ

            if (Pos(g_MySelf.m_sUserName,actor.m_sUserName) <> 0) then
                DScreen.AddChatBoardString ('ÄãµÄ±¦±¦Éý¼¶ÁË¡£',clWhite, clPurple);
            end;

            actor.m_nNameColor := GetRGB (msg.Param);
         end;



      SM_HIDE,
      SM_GHOST,
      SM_DISAPPEAR:
         begin
            if g_MySelf.m_nRecogId <> msg.Recog then
               PlayScene.SendMsg (SM_HIDE, msg.Recog, msg.Param{x}, msg.tag{y}, 0, 0, 0, '');
         end;

      SM_DIGUP:
         begin
            DecodeBuffer (body, @wl, sizeof(TMessageBodyWL));
            actor := PlayScene.FindActor (msg.Recog);
            if actor = nil then
               actor := PlayScene.NewActor (msg.Recog, msg.Param, msg.tag, msg.Series, wl.lParam1, wl.lParam2);
            actor.m_nCurrentEvent := wl.lTag1;
            actor.SendMsg (SM_DIGUP,
                           msg.Param{x},
                           msg.tag{y},
                           msg.Series{dir + light},
                           wl.lParam1,
                           wl.lParam2, '', 0);
         end;
      SM_DIGDOWN:
         begin
            PlayScene.SendMsg (SM_DIGDOWN, msg.Recog, msg.Param{x}, msg.tag{y}, msg.series, 0, 0, '');
         end;
      SM_SHOWEVENT:
         begin
            DecodeBuffer (body, @smsg, sizeof(TShortMessage));
            event := TClEvent.Create (msg.Recog, Loword(msg.Tag){x}, msg.Series{y}, msg.Param{e-type});
            event.m_nDir := 0;
            event.m_nEventParam := smsg.Ident;
            EventMan.AddEvent (event);
         end;
      SM_HIDEEVENT:
         begin
            EventMan.DelEventById (msg.Recog);
         end;
      SM_ADDITEM:   //¾ÆÀÌÅÛ È¹µæ
         begin
            ClientGetAddItem (body,msg.Series);
         end;
      SM_COUNTERITEMCHANGE:
         begin
            ChangeItemCount (msg.Recog, msg.Param, msg.Tag, DecodeString (body));
         end;
      SM_ADDITEM2: //¹°¾à
         begin
            ClientGetAddItem2 (body,  msg.Series);
         end;
      SM_ADDSTORAGEITEM: ClientGetStorageAddItem (body,msg.Series);
      SM_ADDGROUPITEM:   //¾ÆÀÌÅÛ È¹µæ
         begin
            ClientGetGroupAddItem(@Msg, msg.Tag, DecodeString (body));
         end;
      SM_UPGRADEITEM_RESULT:
         begin
            UpgradeItemResult(msg.Recog, msg.Param, DecodeString (body));    //º¸¿Á
         end;
      SM_BAGITEMS:   //°¡¹æ
         begin
            ClientGetBagItmes (body);
         end;
      SM_BAGITEMS2:    //°¡¹æ
        begin
          FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);
          MoveingItemIndex:= -1;
        end;
      SM_STORAGEITEMS:  //¿©°ü
        begin
          ClientGetStoreItems (body);
        end;
      SM_STORAGEITEMS2:  //¿©°ü
        begin
          FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
        end;
      SM_ADDSTORAGE:   //¿©°ü
        begin
          ClientGetAddStore (body);
        end;

      SM_RENTALITEMS:        //´ë¿©
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearRentalDlg;
            ClientRentalItems (body);
         end;

      SM_RENTALITEMS2:        //´ë¿©
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearRentalDlg2;
            ClientOwnerItems (body);
         end;

      SM_GETPETINFO:        //¿µ¹°
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearPetDlg;
            ClientPetInfo (body);
         end;
      SM_GETPETINFO_FAIL:    //¿µ¹°
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearPetDlg;
        end;
      SM_SUMMONPET:
        begin
           g_BoPetOn := False;
        end;
      SM_NOTSUMMONPET:
        begin
           g_BoPetOn := True;
        end;

      SM_AUCTIONITEMS:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearAuctionDlg;

            g_AuctionCurrPage := msg.Param;       //À§Å¹
            g_AuctionAmountofPages := msg.Tag;
            g_AuctionCurrSection := msg.Series;

            ClientAuctionItems (body);
         end;

      SM_COMSTORAGEITEMS:        //°ø¿ëÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearComStorageDlg;
            ClientComStorageItems (body);
         end;

      SM_GUILDSTORAGEITEMS:        //¹®ÆÄÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearGuildStorageDlg;
            ClientGuildStorageItems (body);
         end;

      SM_GTList:
        begin
          FrmDlg.ClearGTlist;
          g_GTCurrPage:= msg.Param;
          g_GTAmountOnPage:=msg.Tag;
          G_GTTotalPage:=msg.Series;
          ClientGTList(body);
        end;
      SM_GTDECOLIST:
        begin
          FrmDlg.ClearDecoList;
          g_GTCurrPage:= msg.Param;
          g_GTAmountOnPage:=msg.Tag;
          G_GTTotalPage:=msg.Series;
          ClientDecoList(body);
        end;
      SM_GTTRADE:
        begin
          if mrOk = FrmDlg.DMessageDlg ('ÄãÒª»¨·Ñ ' +
            IntToStr(msg.Recog) + '½ð±Ò¹ºÂòÐÐ»á×¯Ô°Âð£¿', [mbOk, mbCancel])
          then begin
            self.SendTradeGT(1);
          end else
            self.SendTradeGT(0);
        end;
      SM_BBSMSGLIST:         //Àå¿ø°Ô½ÃÆÇ
        begin
          FrmDlg.ClearBBSList;
          g_GTCurrPage:= msg.Param;
          g_GTAmountOnPage:=msg.Tag;
          G_GTTotalPage:=msg.Series;
          ClientBBSList(body);
        end;
      SM_BBSMSG:               //Àå¿ø°Ô½ÃÆÇ
        begin
          g_MasterPost:= msg.Recog;
          ClientBBSMsg(body);
          FrmDlg.GuildCommanderMode := False;
          if msg.param = 1 then FrmDlg.GuildCommanderMode := True;
        end;
      SM_UPDATEITEM:
         begin
            ClientGetUpdateItem (body);
         end;
      SM_COMUPDATEITEM:
         begin
            ClientGetComUpdateItem (body);
         end;
      SM_DELITEM:
         begin
            ClientGetDelItem (body, msg.Tag);
         end;
      SM_DELITEMS:
         begin
            ClientGetDelItems (body);
         end;

      SM_DROPITEM_SUCCESS:
         begin
            DelDropItem (DecodeString(body), msg.Recog);
         end;
      SM_DROPITEM_FAIL:
         begin
            ClientGetDropItemFail (DecodeString(body), msg.Recog);
         end;

      SM_FRIEND_LOGIN: begin
        ClientGetFriendChange(@Msg, body);
      end;
      SM_ITEMSHOW       :ClientGetShowItem (msg.Recog, msg.param{x}, msg.Tag{y}, msg.Series{looks}, DecodeString(body));
      SM_ITEMHIDE       :ClientGetHideItem (msg.Recog, msg.param, msg.Tag);
      SM_OPENDOOR_OK    :Map.OpenDoor (msg.param, msg.tag);
      SM_OPENDOOR_LOCK  :DScreen.AddSysMsg ('<CO$FFFF>ÃÅ<CE> ±»ËøÁË¡£',40, 60,clLime);
      SM_CLOSEDOOR      :Map.CloseDoor (msg.param, msg.tag);


      SM_CANCLOSE_OK:
         begin
            if (GetTickCount - g_dwLatestStruckTick > 10000) and
               (GetTickCount - g_dwLatestMagicTick > 10000) and
               (GetTickCount - g_dwLatestHitTick > 10000) or
               (g_MySelf.m_boDeath) then begin
               AppLogOut;
            end else
                  DScreen.AddChatBoardString ('ÔÚÕ½¶·ÖÐÎÞ·¨ÍË³öÓÎÏ·¡£', clYellow, clRed);
         end;

      SM_CANCLOSE_FAIL:
         begin
               DScreen.AddChatBoardString ('ÄãµÄ³èÎïÕý´¦ÓÚÕ½¶·Õý£¬ÄãÎÞ·¨ÍË³öÓÎÏ·¡£', clYellow, clRed);
         end;

      SM_TAKEON_OK:
         begin
            g_MySelf.m_nFeature := msg.Recog;
            g_MySelf.FeatureChanged;
            if g_WaitingUseItem.Index in [0..MAXUSEITEM] then //¾ÆÀÌÅÛ °¹¼ö
               g_UseItems[g_WaitingUseItem.Index] := g_WaitingUseItem.Item;
            g_WaitingUseItem.Item.S.Name := '';
         end;

      SM_TAKEON_FAIL:
         begin
            AddItemBag (g_WaitingUseItem.Item);
            g_WaitingUseItem.Item.S.Name := '';
         end;
      SM_TAKEOFF_OK:
         begin
            g_MySelf.m_nFeature := msg.Recog;
            g_MySelf.FeatureChanged;
            g_WaitingUseItem.Item.S.Name := '';
         end;
      SM_TAKEOFF_OK2:  //¹°¾à °ü·Ã
         begin
            g_UseItems[msg.Recog].S.Name := '';
         end;
      SM_TAKEOFF_FAIL:
         begin
            if g_WaitingUseItem.Index < 0 then begin
               n := -(g_WaitingUseItem.Index+1);
               g_UseItems[n] := g_WaitingUseItem.Item;
            end;
            g_WaitingUseItem.Item.S.Name := '';
         end;
      SM_EXCHGTAKEON_OK:       ;
      SM_EXCHGTAKEON_FAIL:     ;

      SM_SENDUSEITEMS:
         begin
            ClientGetSenduseItems (body);
         end;
      SM_WEIGHTCHANGED:
         begin
            str:=DecodeString(body);
            g_MySelf.m_Abil.Weight := msg.Recog;
            g_MySelf.m_Abil.WearWeight := msg.Param;
            g_MySelf.m_Abil.HandWeight := msg.Tag;
         end;
      SM_GOLDCHANGED:
         begin
            SoundUtil.PlaySound (s_money);
            if msg.Recog > g_MySelf.m_nGold then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(msg.Recog-g_MySelf.m_nGold) + '<CE> ½ð±Ò±»·¢ÏÖ¡£' ,40,60, clWhite);
            end;
            if MakeLong(msg.Param,msg.Tag) > g_MySelf.m_nGameGold then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGameGold) + '<CE> ÓÎÏ·±Ò±»·¢ÏÖ¡£' ,40,60,clOlive);
            end;
            g_MySelf.m_nGold := msg.Recog;
            g_MySelf.m_nGameGold:=MakeLong(msg.Param,msg.Tag);
         end;

      SM_POINTCHANGED:
         begin
            SoundUtil.PlaySound (s_money);
            if msg.Recog > g_MySelf.m_nPCPoint then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(msg.Recog-g_MySelf.m_nPCPoint) + '<CE> PCµã±»·¢ÏÖ¡£' ,40,60,clLime);
            end;
            if MakeLong(msg.Param,msg.Tag) > g_MySelf.m_nGameGold then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGameGold) + '<CE> ÓÎÏ·±Ò±»·¢ÏÖ¡£' ,40,60,clOlive);
            end;
            g_MySelf.m_nPCPoint := msg.Recog;
            g_MySelf.m_nGameGold:=MakeLong(msg.Param,msg.Tag);
         end;

      SM_FEATURECHANGED: begin
        PlayScene.SendMsg (msg.Ident, msg.Recog, 0, 0, 0, MakeLong(msg.Param, msg.Tag), MakeLong(msg.Series,0), '');
      end;
      SM_CHARSTATUSCHANGED: begin
        PlayScene.SendMsg (msg.Ident, msg.Recog, 0, 0, 0, MakeLong(msg.Param, msg.Tag), msg.Series, '');
      end;
      SM_CLEAROBJECTS:
         begin
            PlayScene.CleanObjects;
           // g_boMapMoving := TRUE;
            //2012-2-3 ³×ÀÓÄ®¶ó ÀÌ¸§ »ö ¸ÊÀÌµ¿½Ã..
            actor := PlayScene.FindActor (msg.Recog);
            if actor = nil then exit;
            actor.m_nNameColor := GetRGB (msg.Param);
         end;

      SM_EAT_OK:
         begin
            g_EatingItem.S.Name := '';
            ArrangeItembag;
         end;
      SM_EAT_FAIL:
         begin
            AddItemBag (g_EatingItem);
            g_EatingItem.S.Name := '';
         end;

      SM_ADDMAGIC:
         begin
            if body <> '' then
               ClientGetAddMagic (body);
         end;
      SM_SENDMYMAGIC: if body <> '' then ClientGetMyMagics (body);

      SM_DELMAGIC:
         begin
            ClientGetDelMagic (msg.Recog);
         end;
      SM_MAGIC_LVEXP:
         begin
            ClientGetMagicLvExp (msg.Recog{magid}, msg.Param{lv}, MakeLong(msg.Tag, msg.Series));
         end;
      SM_SOUND:
         begin
            ClientGetSound(msg.Param);
         end;
      SM_DURACHANGE:
         begin
            ClientGetDuraChange (msg.Param{useitem index}, msg.Recog, MakeLong(msg.Tag, msg.Series));
         end;

      SM_MERCHANTSAY:
         begin
            ClientGetMerchantSay (msg.Recog, msg.Param, DecodeString (body));
         end;
      SM_MERCHANTDLGCLOSE:
         begin
            FrmDlg.CloseMDlg;
            g_Npcbookinx := -1;
         end;

      SM_OPWWAPONMG:    //Àç·Ã
         Begin
           FrmDlg.ShowDUpWapon(msg.Recog); //Àç·Ã
         End;
      SM_CHECKWEAPON:    //Á¦·Ã È®ÀÎ
         Begin
           FrmDlg.ShowCheckWapon(msg.Recog);
         End;
      SM_SETPASSWORD: ClientStorageSetPassWord();      //Ã¢°í¾ÏÈ£
      SM_INPUTPASSWORD: ClientStorageInputPassWord(msg.Recog);   //Ã¢°í¾ÏÈ£

      SM_CORWAPONMG:   //Àç·Ã
         Begin
           FrmDlg.CloseDUpWapon;    //Àç·Ã
         End;

      SM_SENDGOODSLIST: //»óÀÎ
         begin
            ClientGetSendGoodsList (msg.Recog, msg.Param, body);
         end;
      SM_SENDGOODAPPR: //»óÀÎ
         begin
           FillChar (G_BuyItem, sizeof(SBuyItem)*MAXBUYITEM, #0);
           FrmDlg.ResetMenuDlg;
           FrmDlg.SpotDlgMode := dmSell;
           g_nCurMerchant := msg.Recog;
           if Msg.Param > 0 then
           FrmDlg.BoMakeItemMenu := True
           else
           FrmDlg.BoMakeItemMenu := False;

         end;
      SM_SENDUSERMAKEITEMLIST:             //Á¦Á¶½ºÃÄ
         begin
            ClientGetSendMakeItemList (msg.Recog, msg.Param, body);
         end;
      SM_SENDITEMLOCK: ClientGetSendItemLock(msg.Recog);
      SM_USERITEMLOCK_OK: ClientObjItemLockOK(@msg, DecodeString(Body));
      SM_USERITEMLOCK_FAIL: ClientObjItemLockFail(@msg);
      SM_SENDUSERSELL:
         begin
            ClientGetSendUserSell (msg.Recog);
         end;
      SM_SENDUSERREPAIR:
         begin
            ClientGetSendUserRepair (msg.Recog);
         end;
      SM_SENDBUYPRICE:
         begin
            if g_SellDlgItem.S.Name <> '' then begin
               if msg.Recog > 0 then
                  g_sSellPriceStr := IntToStr(msg.Recog) + ' ' + g_sGoldName
               else g_sSellPriceStr := '???? ' + g_sGoldName;
            end;
         end;
      SM_USERSELLITEM_OK:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            g_SellDlgItemSellWait.S.Name := '';
            PlaySound(s_Money);
         end;

      SM_USERSELLITEM_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
            FrmDlg.DMessageDlg ('Äã²»ÄÜ³öÊÛÕâ¼þÎïÆ·¡£', [mbOk]);
         end;

      SM_SENDREPAIRCOST:
         begin
            if g_SellDlgItem.S.Name <> '' then begin
               if msg.Recog >= 0 then
                  g_sSellPriceStr := IntToStr(msg.Recog) + ' ' + g_sGoldName
               else g_sSellPriceStr := '???? ' + g_sGoldName;
            end;
         end;
      SM_USERREPAIRITEM_OK:
         begin
            if g_SellDlgItemSellWait.S.Name <> '' then begin
               FrmDlg.LastestClickTime := GetTickCount;
               g_MySelf.m_nGold := msg.Recog;
               g_SellDlgItemSellWait.Dura := msg.Param;
               g_SellDlgItemSellWait.DuraMax := msg.Tag;
               AddItemBag (g_SellDlgItemSellWait);
               g_SellDlgItemSellWait.S.Name := '';
            end;
         end;
      SM_USERREPAIRITEM_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
            FrmDlg.DMessageDlg ('Äã²»ÄÜÐÞÀíÕâ¼þÎïÆ·¡£', [mbOk]);
         end;

      SM_SENDUSERWAKE: ClientGetSendUserWake(Msg.Recog);
      SM_SENDWAKECOST: ClientObjWakeCost(Msg.Recog);
      SM_USERITEMWAKE_OK: ClientObjItemWakeOK(@Msg, DecodeString(Body));
      SM_USERITEMWAKE_FAIL: ClientObjItemWakeFail(@Msg);

      SM_SENDUSERRESTORE: ClientGetSendUserReStore(Msg.Recog);
      SM_SENDRESTORECOST: ClientObjReStoreCost(Msg.Recog);
      SM_USERITEMRESTORE_OK: ClientObjItemReStoreOK(@Msg, Body);
      SM_USERITEMRESTORE_FAIL: ClientObjItemReStoreFail(@Msg);

      SM_PRICEDISASSEMBLE:       //°¢¼ººÐÇØ
         begin
            if g_DisassembleDlgItem.S.Name <> '' then begin
               if msg.Recog >= 0 then
                  g_sDisassemblePriceStr := IntToStr(msg.Recog) + ' ½ð±Ò'
               else g_sDisassemblePriceStr := '???? ½ð±Ò';
            end;
         end;
      SM_SENDUSERDISASSEMBLE:      //°¢¼ººÐÇØ
         begin
            ClientGetSendUserDisassemble (msg.Recog);
         end;
      SM_SENDUSERWAKEUP:
         begin
            FrmDlg.ShowWakeUp;
         end;
      SM_DISASSEMBLE_OK:          //°¢¼ººÐÇØ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            g_DisassembleDlgItemWait.S.Name := '';
            PlaySound(s_Money);
         end;
      SM_DISASSEMBLE_FAIL:        //°¢¼ººÐÇØ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_DisassembleDlgItemWait);
            g_DisassembleDlgItemWait.S.Name := '';
            Case msg.Recog of
              1: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
              2: FrmDlg.DMessageDlg ('Äã²»ÄÜ·Ö½â´ËÎïÆ·¡£', [mbOk]);
              3: FrmDlg.DMessageDlg ('Äã²»ÄÜÐ¯´ø¸ü¶àµÄÎïÆ·¡£', [mbOk]);
            end;
         end;

      SM_PRICEDISMANTLE:  //ÀÏ¹ÝºÐÇØ
         begin
            if g_DismantleDlgItem.S.Name <> '' then begin
               if msg.Recog >= 0 then
                  g_sDismantlePriceStr := GetGoldStr(msg.Recog) + '½ð±Ò'
               else g_sDismantlePriceStr := '????½ð±Ò';
            end;
         end;
      SM_SENDUSERDISMANTLE:    //ÀÏ¹ÝºÐÇØ
         begin
            ClientGetSendUserDismantle (msg.Recog);
         end;
      SM_DISMANTLE_OK:      //ÀÏ¹ÝºÐÇØ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            g_DismantleDlgItemWait.S.Name := '';
            PlaySound(s_Money);
         end;
      SM_DISMANTLE_FAIL:       //ÀÏ¹ÝºÐÇØ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_DismantleDlgItemWait);
            g_DismantleDlgItemWait.S.Name := '';
            Case msg.Recog of
              1: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
              2: FrmDlg.DMessageDlg ('Äã²»ÄÜ·Ö½â´ËÎïÆ·¡£', [mbOk]);
              3: FrmDlg.DMessageDlg ('Äã²»ÄÜÐ¯´ø¸ü¶àµÄÎïÆ·¡£', [mbOk]);
            end;
         end;


      SM_USERCHECKWEAPON_OK:   //Á¦·Ã È®ÀÎ
         begin
            if g_UpWaponWait.S.Name <> '' then begin
               FrmDlg.LastestClickTime := GetTickCount;
               g_UpWaponWait.S.Name := '';
            end;
         end;
      SM_USERCHECKWEAPON_UPFAIL:    //Á¦·Ã ½ÇÆÐ
         begin
            if g_UpWaponWait.S.Name <> '' then begin
               FrmDlg.LastestClickTime := GetTickCount;
               g_UpWaponWait.S.Name := '';
            end;
         end;
      SM_USERCHECKWEAPON_FAIL:    //Á¦·Ã È®ÀÎ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_UpWaponWait);
            g_UpWaponWait.S.Name := '';
            FrmDlg.DMessageDlg ('Äã»¹²»ÄÜÈ¡»ØÎäÆ÷¡£', [mbOk]);
         end;

      SM_AUC_OK:  //°æ¸Å
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_ActionItemWait.S.Name := '';
          g_ActionItems.S.Name := '';
          FrmDlg.CloseAction;
          ClientAucItems (body);
        end;

      SM_AUC_FAIL: //°æ¸Å
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('¼ÄÊÛµÄ¼Û¸ñ×îÐ¡Îª 1,000 ½ð±Ò¡£', [mbOk]);
               2: FrmDlg.DMessageDlg ('ÇëÊäÈëºÏÀíµÄ¼ÄÊÛ¼Û¸ñ¡£\¼ÄÊÛµÄ¼Û¸ñ³¬¹ýÁËÔÊÐíµÄ×î´óÏÞ¶È¡£', [mbOk]);      //1¾ï5Ãµ
               3: FrmDlg.DMessageDlg ('Ã»ÓÐ·¢ÏÖÎïÆ·¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('Ã»ÓÐ×ã¹»µÄ±£Ö¤½ð¡£', [mbOk]);
               5: FrmDlg.DMessageDlg ('Äã¼ÄÊÛµÄÎïÆ·µÄÊýÁ¿³¬¹ýÁËÔÊÐíµÄ×î´óÊýÁ¿¡£', [mbOk] );
               6: FrmDlg.DMessageDlg ('Äã²»ÄÜ¼ÄÊÛÕâ¼þÎïÆ·¡£', [mbOk]);
            end;
            AddItemBagst(g_ActionItemWait);
            g_ActionItemWait.S.Name := '';
         end;


      SM_STORAGE_OK,
      SM_STORAGE_FULL,
      SM_STORAGE_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            if msg.Ident <> SM_STORAGE_OK then begin
               if msg.Ident = SM_STORAGE_FULL then begin
                  FrmDlg.DMessageDlg ('ÄãµÄ¸öÈË²Ö¿âÒÑ¾­ÂúÁË£¬Äã²»ÄÜ¼ÌÐø´æ·ÅÎïÆ·¡£', [mbOk])  ;
                  AddItemBag (g_SellDlgItemSellWait);
               end else begin
                  FrmDlg.DMessageDlg ('Äã²»ÄÜ¼Ä´æÕâ¼þÎïÆ·¡£', [mbOk]);
                  AddItemBag (g_SellDlgItemSellWait);
               end;
            end;
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_CONSIGN_OK:
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_MarketDlgItemSellWait.S.Name := '';
          g_MarketDlgItem.S.Name := '';
          FrmDlg.DSalesRefreshClick(Self,0,0);
        end;
      SM_CONSIGN_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('¼ÄÊÛÎïÆ·µÄ¼Û¸ñÖÁÉÙÎª 1,000½ð±Ò¡£', [mbOk]);
               2: FrmDlg.DMessageDlg ('ÇëÊäÈëºÏÊÊµÄ¼ÄÊÛ¼Û¸ñ¡£\¼ÄÊÛµÄ¼Û¸ñ³¬¹ýÁËÔÊÐíµÄ×î´óÏÞ¶È¡£', [mbOk]);      //1¾ï5Ãµ
               3: FrmDlg.DMessageDlg ('Ã»ÓÐ·¢ÏÖÎïÆ·¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('Ã»ÓÐ×ã¹»µÄ±£Ö¤½ð¡£', [mbOk]);    //À§Å¹
               5: FrmDlg.DMessageDlg ('Äã¼ÄÊÛµÄÎïÆ·µÄÊýÁ¿³¬¹ýÁËÔÊÐíµÄ×î´óÊýÁ¿¡£', [mbOk] );
               6: FrmDlg.DMessageDlg ('Äã²»ÄÜ¼ÄÊÛÕâ¼þÎïÆ·¡£', [mbOk]);
            end;
            AddItemBagst(g_MarketDlgItemSellWait);
            g_MarketDlgItemSellWait.S.Name := '';
         end;
      SM_GETAUCTIONITEMS_FAIL:
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearAuctionDlg;

          g_AuctionCurrSection := msg.Param;
          g_AuctionCurrPage := 1;
          g_AuctionAmountofPages := 1;

          if Not FrmDlg.DSales.Visible then
            FrmDlg.ToggleAuctionWindow;
        end;
      SM_CLOSEAUCTION:
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          DScreen.ClearHint;
          FrmDlg.CloseDSellDlg;
          if FrmDlg.DSales.Visible then
            FrmDlg.ToggleAuctionWindow;
        end;

      SM_STORAGEPW_SUC,
      SM_STORAGEPW_FAIL: ClientObjStoragePWFail(@msg);
      SM_STORAGEPW_CHK: ClientObjStorageCheck(@msg);

      SM_GETRENTALITEMS_FAIL:    //´ë¿©
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearRentalDlg;
          if FrmDlg.DRentalDlg.Visible = false then
            FrmDlg.ToggleRentalDlg;
        end;

      SM_GETRENTALITEMS_FAIL2:    //´ë¿©
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearRentalDlg2;
          if FrmDlg.DRentalDlg.Visible = false then
            FrmDlg.ToggleRentalDlg2;
        end;


      SM_COMSTORAGE_OK:      //°ø¿ëÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_SellDlgItemSellWait.S.Name := '';
          g_SellDlgItem.S.Name := ''
        end;
      SM_COMSTORAGE_FAIL:    //°ø¿ëÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('¹«¹²²Ö¿âÒÑ¾­ÂúÁË¡£', [mbOk] );
               2: FrmDlg.DMessageDlg ('Äã²»ÄÜ±£´æÕâ¼þÎïÆ·¡£', [mbOk]);
               3: FrmDlg.DMessageDlg ('²Ö¿âÉÌÈË²»´æÔÚ¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('ÎïÆ·²»´æÔÚ¡£', [mbOk]);
               5: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£.', [mbOk]);    //À§Å¹
            end;
            AddItemBagst(g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_GETCOMSTORAGEITEMS_FAIL:    //°ø¿ëÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearComStorageDlg;
          if FrmDlg.DComStorage.Visible = false then
            FrmDlg.ToggleComStorageWindow;
        end;
      SM_CLOSECOMSTORAGE:      //°ø¿ëÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          DScreen.ClearHint;
          FrmDlg.CloseDSellDlg;
          if FrmDlg.DComStorage.Visible = true then
            FrmDlg.ToggleComStorageWindow;
        end;

      SM_GUILDSTORAGE_OK:      //¹®ÆÄÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_SellDlgItemSellWait.S.Name := '';
          g_SellDlgItem.S.Name := ''
        end;
      SM_GUILDSTORAGE_FAIL:         //¹®ÆÄÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('ÐÐ»á²Ö¿âÒÑ¾­ÂúÁË¡£', [mbOk] );
               2: FrmDlg.DMessageDlg ('´ËÎïÆ·ÎÞ·¨¼Ä´æ¡£', [mbOk]);
               3: FrmDlg.DMessageDlg ('²Ö¿âÉÌÈË²»´æÔÚ¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('ÎïÆ·²»´æÔÚ¡£', [mbOk]);
               5: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
               6: FrmDlg.DMessageDlg ('Äã»¹Ã»ÓÐ¼ÓÈëÐÐ»á¡£', [mbOk]);
            end;
            AddItemBagst(g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_GETGUILDSTORAGEITEMS_FAIL:       //¹®ÆÄÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearGuildStorageDlg;
          if FrmDlg.DGuildStorage.Visible = false then
            FrmDlg.ToggleGuildStorageWindow;
        end;
      SM_CLOSEGUILDSTORAGE:        //¹®ÆÄÃ¢°í
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          DScreen.ClearHint;
          FrmDlg.CloseDSellDlg;
          if FrmDlg.DGuildStorage.Visible = true then
            FrmDlg.ToggleGuildStorageWindow;
        end;


      SM_TAKEBACKSTORAGEITEM_OK,
      SM_TAKEBACKSTORAGEITEM_FAIL,
      SM_TAKEBACKSTORAGEITEM_FULLBAG:
         begin
            FrmDlg.LastestClickTime := GetTickCount; //2010-07-06 ¿©°ü ¹ö±×
            if msg.Ident <> SM_TAKEBACKSTORAGEITEM_OK then begin
               if msg.Ident = SM_TAKEBACKSTORAGEITEM_FULLBAG then begin
                  mj := g_MovingItem.Index;
                  if mj >= 500 then begin   //¿©°ü
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('ÄãÎÞ·¨È¡»Ø¡£', [mbOk]);
                   Exit;
                 end;
               end else
                 mj := g_MovingItem.Index;
                  if mj >= 500 then begin   //¿©°ü
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('²»´æÔÚ¡£', [mbOk]);
                   Exit;
                 end;
            end;
            //   FrmDlg.DelStorageItem (msg.Recog); //itemserverindex
         end;

      SM_KMSendMsg:   //¹ßµµ¼ú
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor = nil then exit;
             case random(4) of
              0..1 :begin
                actor.SendMsg (CM_BALDO, actor.m_nCurrX, actor.m_nCurrY, msg.Param, 0, 0, '', 0);
              end;
              2..3 :begin
                if (THumActor(Actor).m_btMask > 0) and (THumActor(Actor).m_btMask <> 255) then
                  actor.SendMsg (CM_BALDO, actor.m_nCurrX, actor.m_nCurrY, msg.Param, 0, 0, '', 0)
                else
                  actor.SendMsg (CM_BALDO2, actor.m_nCurrX, actor.m_nCurrY, msg.Param, 0, 0, '', 0);
              end;
              else begin
                actor.SendMsg (CM_BALDO, actor.m_nCurrX, actor.m_nCurrY, msg.Param, 0, 0, '', 0);
              end;
             end;
         end;


      SM_ToSendMsg:       //Åä³ª¿À´Â ¸Þ½ÃÁö!
         begin
           str := DecodeString (body);
           Case msg.Recog of
             86: begin      //È¯ÅÛ µå¶ø
               if msg.Param = 1 then begin
                g_boDropDrug := TRUE;
               end else begin
                g_boDropDrug := FALSE;
               end;
               if g_boDropDrug then begin
                 s1 := '½ûÖ¹ÎïÆ·µôÂä'
               end else begin
                 s1 := 'ÔÊÐíÎïÆ·µôÂä';
               end;
               if g_HumRunDress then begin
                 s2:= 'ÃâÖúÅÜ¹¦ÄÜ\'+ s1;
               end else begin
                 s2:= s1;
               end;
                ClientBuffSystem(s2,1,281,92);
             end;

             2: begin
               g_nGrade := strToInt(str);
             end;
             3: begin
               g_MySelf.SendMsg (CM_CFIREHIT, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.Param, 0, 0, '', 0);
             end;
             4: begin    //Ãµ¹« ¿¹µµ
               g_MySelf.SendMsg (CM_CPOWERHIT, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.Param, 0, 0, '', 0);
             end;

             89: begin      //ÁúÁÖ
               if msg.Param = 1 then begin
                g_HumRunDress := TRUE;
               end else begin
                g_HumRunDress := FALSE;
               end;
               if g_boDropDrug then begin
                 s1 := '½ûÖ¹ÎïÆ·µôÂä'
               end else begin
                 s1 := 'ÔÊÐíÎïÆ·µôÂä';
               end;
               if g_HumRunDress then begin
                 s2:= 'ÃâÖúÅÜ¹¦ÄÜ\'+ s1;
               end else begin
                 s2:= s1;
               end;
               ClientBuffSystem(s2,1,281,92);
             end;
             90: begin      //¼ºÀüÈ¯
              if msg.Recog = 1 then begin
                if g_MyHero <> nil then begin
                  if msg.Param = 1 then g_MyHero.m_btSex := 1
                  else  g_MyHero.m_btSex := 0;
                end;
              end else begin
                if msg.Param = 1 then g_MySelf.m_btSex := 1
                else g_MySelf.m_btSex := 0;
              end;
             end;

             91: begin    //ÀÏ°Ýºñ
              g_MySelf.SendMsg (CM_BALDO , g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.Param, 0, 0, '', 0);
             end;

             93: begin   //Á¢¼Ó±â
               g_nGroupCall := Msg.Tag;
               LogInVer := str;
               g_boDropDrug := FALSE;
               if VerInfoStr2 = LogInVer then begin  //¹öÀü
                 if g_boDropDrug then begin
                   s1 := '½ûÖ¹ÎïÆ·µôÂä'
                 end else begin
                   s1 := 'ÔÊÐíÎïÆ·µôÂä';
                 end;
                 if g_HumRunDress then begin
                   s2:= 'ÃâÖúÅÜ¹¦ÄÜ\'+ s1;
                 end else begin
                   s2:= s1;
                 end;
                 ClientBuffSystem(s2,1,281,92);
               end else begin
                 Application.MessageBox(PAnsiChar(DecodeString_3des('a9fZg+rWm+npGHymc6ZNNZzFIWJyXVlWy/jjpA==','56m2VipGate')),   //±»ÐÞ¸ÄÁË¡£.
                   PAnsiChar(DecodeString_3des('FRVtgQ==','56m2VipGate')), MB_OK + MB_ICONERROR);
                 Close;
               end;
             end;

           end;
         end;
      SM_AUCTIONGIVE:
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DSalesRefreshClick(Self,0,0);
         end;

      SM_COMSTORAGEGIVE:  //°ø¿ëÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DStorageRefreshClick(Self,0,0);
         end;

      SM_GUILDSTORAGEGIVE:  //¹®ÆÄÃ¢°í
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DGuildStorageReClick(Self,0,0);
         end;

      SM_RENTALGIVE:  //´ë¿©
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DRRefreshClick(Self,0,0);
         end;

      SM_GETTOPINFO: begin
        if Msg.Series = 1 then begin
          FrmDlg.DMessageDlg(DecodeString(body), [mbOk]);
          FrmDlg2.FboTopSend := False;
        end else begin
          FrmDlg2.FboTopSend := False;
          FrmDlg2.FnMaxTopPage := Msg.tag;
          FrmDlg2.FnMinTopPage := Msg.Param;
          if body <> '' then begin
            DecodeBuffer(Body, @FrmDlg2.FTopInfo[0], SizeOf(TClientTopInfo));
          end else begin
            FillChar(FrmDlg2.FTopInfo, SizeOf(TClientTopInfo), #0);
          end;
        end;
      end;

      SM_BUYITEM_SUCCESS:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            FrmDlg.SoldOutGoods (MakeLong(msg.Param, msg.Tag));
            PlaySound(s_Money);
         end;
      SM_BUYITEM_SUCCESS2:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nPCPoint := msg.Recog;
            FrmDlg.SoldOutGoods (MakeLong(msg.Param, msg.Tag));
            PlaySound(s_Money);
         end;
      SM_BUYITEM_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('ÎïÆ·ÒÑÏúÊÛÍê¡£', [mbOk]);
               2: FrmDlg.DMessageDlg ('ÎïÆ·²»´æÔÚ¡£', [mbOk]);
               3: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('ÄãµÄ±³°üÒÑ¾­ÂúÁË¡£', [mbOk]);
            end;
         end;
      SM_MAKEDRUG_SUCCESS:         //Á¦Á¶½ºÃÄ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            PlaySound(s_Money);
            FrmDlg.DMessageDlg ('ÎïÆ·ÖÆÔì³É¹¦¡£', [mbOk]);
         end;


       SM_MAKEDRUG_FAIL:   //Á¦Á¶½ºÃÄ
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('·¢Éú´íÎó¡£', [mbOk]);
               2: FrmDlg.DMessageDlg ('Äã²»ÄÜÐ¯´ø¸ü¶àµÄÎïÆ·¡£', [mbOk]);
               3: FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
               4: FrmDlg.DMessageDlg ('²ÄÁÏ²»×ã¡£.', [mbOk]);
               5: FrmDlg.DMessageDlg ('±¦ÓñºÏ³ÉÊ§°Ü¡£', [mbOk]);
               6: FrmDlg.DMessageDlg ('¿óÊ¯µÄ´¿¶ÈÌ«µÍ¡£', [mbOk]);
            end;
         end;
      SM_716: begin
        if (Msg.Series in [11..21]) then begin        //ÈíÇ÷  ¹«±Ø ÁøÀ§º¸  °Ý°ø¼·¹°
          actor := PlayScene.FindActor (msg.Recog);
          if actor <> nil then
            DrawEffectHumEx(Msg.Series{type},actor)
        end else begin
          DrawEffectHum(Msg.Series{type},Msg.Param{x},Msg.Tag{y}, StrToInt(DecodeString(Body)));
          UseNormalEffect(msg.Series{Á¾·ù}, msg.Param{X}, msg.Tag{Y});
        end;
      end;
      SM_TEST:
         begin
            Inc (g_nTestReceiveCount);
         end;

      SM_CLIENTDATAFILE: begin
        ClientGetDataFile(Msg, body);
      end;
      SM_SENDNOTICE: begin
        ClientGetSendNotice (body);
      end;
      SM_GROUPMODECHANGED:
         begin
            g_boAllowGroup := ByteToBool(msg.Recog);
            g_boCheckGroup := ByteToBool(msg.Param);
            g_boCheckHero := ByteToBool(msg.Tag);
            g_GroupItemMode := ByteToBool(msg.Series);
            g_dwChangeGroupModeTick := GetTickCount;
         end;
      SM_CREATEGROUP_OK:        //½ÅÃ»ÇÑ »ç¶÷
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            g_boAllowGroup := TRUE;
            g_MySelf.m_boOpenHealth := TRUE;   //±×·ì ¸Î°í Ã¼·Â º¸ÀÌ±â
         end;
      SM_CREATEGROUP_FAIL:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            case msg.Recog of
             //  1: FrmDlg.DMessageDlg('Successfully sent a team invitation, please wait for the other party to respond!', [mbOk]);
             //  2: FrmDlg.DMessageDlg('[Failed]: Players already sent a team to the invitation, please do not repeat!', [mbOk]);
               -1: FrmDlg.DMessageDlg ('ÄãÒÑ¾­¼ÓÈëÁË¶ÓÎé¡£', [mbOk]);
               -2: FrmDlg.DMessageDlg ('Äã¼ÓÈëµÄ¶ÓÎéµÄÃû×Ö²»ÕýÈ·¡£', [mbOk]);
               -3: FrmDlg.DMessageDlg ('ÄãÒÑ¾­¼ÓÈëÆäËüµÄ¶ÓÎé¡£', [mbOk]);
               -4: FrmDlg.DMessageDlg ('¶Ô·½¾Ü¾ø×é¶Ó¡£', [mbOk]);
               -5: FrmDlg.DMessageDlg ('ÄãÕýÔÚÉêÇëºÍ¶Ô·½×é¶Ó¡£', [mbOk]);
               -6: FrmDlg.DMessageDlg ('µ±Ç°¶ÓÎéÒÑ¾­ÂúÔ±¡£', [mbOk]);
               -7: FrmDlg.DMessageDlg ('µ±Ç°µØÍ¼½ûÖ¹×é¶Ó¡£', [mbOk]);
               -8: FrmDlg.DMessageDlg ('¶Ô·½ËùÔÚµÄµØÍ¼½ûÖ¹×é¶Ó¡£', [mbOk]);
            end;
         end;
      SM_GROUPADDMEM_OK:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            ClientGetAddMembers(@Msg, Body);
         end;
      SM_GROUPADDMEM_FAIL:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            case msg.Recog of
               -1: FrmDlg.DMessageDlg ('ÄãÒª¼ÓÈëµÄ¶ÓÎé²»´æÔÚ¡£', [mbOk]);
               -2: FrmDlg.DMessageDlg ('ÄãÒª¼ÓÈëµÄ¶ÓÎéµÄÃû×Ö´íÎó¡£', [mbOk]);
               -3: FrmDlg.DMessageDlg ('ÄãÒÑ¾­¼ÓÈëÁË¶ÓÎé¡£', [mbOk]);
               -4: FrmDlg.DMessageDlg ('¶Ô·½¾Ü¾ø×é¶Ó¡£', [mbOk]);
               -5: FrmDlg.DMessageDlg ('¶ÓÎéÒÑ¾­ÂúÔ±¡£', [mbOk]);
               -6: FrmDlg.DMessageDlg ('µ±Ç°µØÍ¼µÄ¶ÓÎéÊýÁ¿ÒÑ¾­´ïµ½×î´óÖµ¡£', [mbOk]);
               -7: FrmDlg.DMessageDlg ('¶Ô·½ËùÔÚµØÍ¼µÄ¶ÓÎéÊýÁ¿ÒÑ¾­´ïµ½×î´óÖµ¡£', [mbOk]);
               -8: FrmDlg.DMessageDlg ('ÄãËùÔÚµØÍ¼µÄ¶ÓÎéÊýÁ¿ÒÑ¾­´ïµ½×î´óÖµ¡£', [mbOk]);
               -9: FrmDlg.DMessageDlg ('µ±Ç°µØÍ¼ÎÞ·¨×é¶Ó¡£', [mbOk]);
               -10: FrmDlg.DMessageDlg ('¶Ô·½ËùÔÚµÄµØÍ¼ÎÞ·¨×é¶Ó¡£', [mbOk]);
            end;
         end;
      SM_GROUPDELMEM_OK:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            ClientGetDelMembers(@Msg, body);
         end;
      SM_GROUPDELMEM_FAIL:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            case msg.Recog of
               -1: FrmDlg.DMessageDlg ('¶ÓÎé²»´æÔÚ¡£', [mbOk]);
               -2: FrmDlg.DMessageDlg ('Ãû×Ö´íÎó¡£', [mbOk]);
               -3: FrmDlg.DMessageDlg ('Äã»¹Ã»ÓÐ³ÉÁ¢¶ÓÎé¡£', [mbOk]);
            end;
         end;
      SM_GROUPCANCEL: begin
        ClearGroupMember(True, msg.Recog, DecodeString(body));
        g_MySelf.m_boOpenHealth := FALSE;
        try
          for i := 0 to g_MemberGroup.Count-1 do begin
            GroupMember := g_MemberGroup[i];
            actor := PlayScene.FindActor (integer(GroupMember.ClientGroup.UserID));
            if actor <> nil then actor.m_boOpenHealth := False;
          end;
            g_MemberGroup.Clear;  // MonOpenHp
          except
          end;
      end;
      SM_GROUPMEMBERS:
         begin
            g_MySelf.m_boOpenHealth := TRUE;
            ClientGetGroupMembers (msg, DecodeString(Body));
         end;
      SM_CHECKMSG: begin
        ClientGetCheckMsg(@Msg, DecodeString(body));
      end;

      SM_TIGERSETCHANGED:  //È£¶ûÀÌ
         begin
            if msg.Param > 0 then g_TigerSet := TRUE
            else g_TigerSet := FALSE;

            g_dwChangeTigerSetTick := GetTickCount + 3000;  //3ÃÊ µô·¹ÀÌ
         end;

      SM_FISHCANCEL: begin //³¬½Ã
         begin
            ExitFishing;
         end;
      end;

      SM_FISHINC: begin //³¬½Ã
         begin
           if msg.Param > 0 then begin
              IncFishSuccess;
           end else begin
              g_IncFishSuccess := 0;
           end;
         end;
      end;


      SM_OPENGUILDDLG:
         begin
            g_dwQueryMsgTick := GetTickCount;
            ClientGetOpenGuildDlg (msg.Series, body);
         end;

      SM_SENDGUILDMEMBERLIST:
         begin
            g_dwQueryMsgTick := GetTickCount;
            ClientGetSendGuildMemberList (body);
         end;

      SM_OPENGUILDDLG_FAIL:
         begin
            g_dwQueryMsgTick := GetTickCount;
            FrmDlg.DMessageDlg ('Äã»¹Ã»ÓÐ¼ÓÈëÐÐ»á¡£', [mbOk]);
         end;


      SM_RENTALTRY_FAIL: begin            //´ë¿©
        g_dwQueryMsgTick := GetTickCount;
        FrmDlg.DMessageDlg ('½»Ò×Ê§°Ü¡£', [mbOk]);
      end;
      SM_RENTALMENU:                    //´ë¿©
         begin
            g_dwQueryMsgTick := GetTickCount;
            g_sRentalWho := DecodeString (body);
            FrmDlg.OpenRentalDlg(msg.Recog);
         end;
      SM_RENTALCANCEL: begin            //´ë¿©
        FrmDlg.CancelItemMoving;
        MoveRentalItemToBag;
        if g_nRentalGold > 0 then begin
          g_MySelf.m_nGold := g_MySelf.m_nGold + g_nRentalGold;
          g_nRentalGold := 0;
        end;
        FrmDlg.CloseRentalDlg;
      end;
      SM_RENTALADDITEM_OK:             //´ë¿©
         begin
            g_dwRentalActionTick := GetTickCount;
            if g_RentalDlgItem.S.Name <> '' then begin
               AddRentalItem (g_RentalDlgItem);
               g_RentalDlgItem.S.Name := '';
            end;
         end;
      SM_RENTALADDITEM_FAIL: begin             //´ë¿©
        g_dwRentalActionTick:=GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin
          AddItemBag(g_RentalDlgItem);
          g_RentalDlgItem.S.Name:= '';
        end;
      end;
      SM_RENTALDELITEM_OK: begin             //´ë¿©
        g_dwRentalActionTick:=GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin

          g_RentalDlgItem.S.Name := '';
        end;
      end;
      SM_RENTALDELITEM_FAIL: begin              //´ë¿©
        g_dwRentalActionTick := GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin
          DelItemBag (g_RentalDlgItem.S.Name, g_RentalDlgItem.MakeIndex);
          AddRentalItem (g_RentalDlgItem);
          if (g_MovingItem.Item.MakeIndex = g_RentalDlgItem.MakeIndex) and (g_MovingItem.Item.S.Name = g_RentalDlgItem.S.Name) then begin  //11-02-11 °Å·¡ sql ‹š¿Â°Í
             g_boItemMoving := FALSE;
             g_MovingItem.Item.S.Name := '';
          end;
          g_RentalDlgItem.S.Name := '';
        end;
      end;
      SM_RENTALREMOTEADDITEM: ClientGetRentalRemoteAddItem (body);        //´ë¿©
      SM_RENTALREMOTEDELITEM: ClientGetRentalRemoteDelItem (body);     //´ë¿©
      SM_RENTALCHGGOLD_OK: begin    //´ë¿©
        g_nRentalGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALCHGDAY_OK: begin    //´ë¿©
        g_nRentalDay:=msg.Recog;
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALCHGGOLD_FAIL: begin                                 //´ë¿©
        g_nRentalGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwRentalActionTick:=GetTickCount;
      end;
      SM_RENTALCHGDAY_FAIL: begin                                 //´ë¿©
        g_nRentalDay:=msg.Recog;
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALREMOTECHGGOLD: begin                       //´ë¿©
        g_nRentalRemoteGold:=msg.Recog;
        SoundUtil.PlaySound(s_money);
      end;

      SM_RENTALREMOTECHGDAY: begin                       //´ë¿©
        g_nRentalRemoteDay:=msg.Recog;
      end;

      SM_RENTALSUCCESS: begin             //´ë¿©
        FrmDlg.CloseRentalDlg;
      end;






      SM_DEALTRY_FAIL: begin              //°Å·¡
        g_dwQueryMsgTick := GetTickCount;
        FrmDlg.DMessageDlg ('½»Ò×±»È¡ÏûÁË¡£\½»Ò×µÄË«·½±ØÐëÃæ¶ÔÃæÕ¾×Å¡£', [mbOk]);
      end;
      SM_DEALMENU:                    //°Å·¡
         begin
            g_dwQueryMsgTick := GetTickCount;
            g_sDealWho := DecodeString (body);
            FrmDlg.OpenDealDlg;
         end;
      SM_DEALCANCEL: begin             //°Å·¡
        FrmDlg.CancelItemMoving;
        MoveDealItemToBag;
        if g_nDealGold > 0 then begin
          g_MySelf.m_nGold := g_MySelf.m_nGold + g_nDealGold;
          g_nDealGold := 0;
        end;
        FrmDlg.CloseDealDlg;
      end;
      SM_DEALADDITEM_OK:               //°Å·¡
         begin
            g_dwDealActionTick := GetTickCount;
            if g_DealDlgItem.S.Name <> '' then begin
               AddDealItem (g_DealDlgItem);
               g_DealDlgItem.S.Name := '';
            end;
         end;
      SM_DEALADDITEM_FAIL: begin             //°Å·¡
        g_dwDealActionTick:=GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin
          AddItemBag(g_DealDlgItem);
          g_DealDlgItem.S.Name:= '';
        end;
      end;
      SM_DEALDELITEM_OK: begin               //°Å·¡
        g_dwDealActionTick:=GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin

          g_DealDlgItem.S.Name := '';
        end;
      end;
      SM_DEALDELITEM_FAIL: begin                //°Å·¡
        g_dwDealActionTick := GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin
          DelItemBag (g_DealDlgItem.S.Name, g_DealDlgItem.MakeIndex);
          AddDealItem (g_DealDlgItem);
          if (g_MovingItem.Item.MakeIndex = g_DealDlgItem.MakeIndex) and (g_MovingItem.Item.S.Name = g_DealDlgItem.S.Name) then begin  //11-02-11 °Å·¡ sql ‹š¿Â°Í
             g_boItemMoving := FALSE;
             g_MovingItem.Item.S.Name := '';
          end;
          g_DealDlgItem.S.Name := '';
        end;
      end;
      SM_DEALREMOTEADDITEM: ClientGetDealRemoteAddItem (body);        //°Å·¡
      SM_DEALREMOTEDELITEM: ClientGetDealRemoteDelItem (body);       //°Å·¡
      SM_DEALCHGGOLD_OK: begin
        g_nDealGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwDealActionTick:=GetTickCount;
      end;
      SM_DEALCHGGOLD_FAIL: begin                                 //°Å·¡
        g_nDealGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwDealActionTick:=GetTickCount;
      end;
      SM_DEALREMOTECHGGOLD: begin                       //°Å·¡
        g_nDealRemoteGold:=msg.Recog;
        SoundUtil.PlaySound(s_money);
      end;
      SM_DEALSUCCESS: begin              //°Å·¡
        FrmDlg.CloseDealDlg;
      end;

      SM_EXSUCCESS: begin  //È¯Àü ¼º°ø
        g_nExChangeGold := 0;
        g_nExChangeGameGold := 0;
      end;

      SM_EXCANCEL: begin    //È¯Àü Ãë¼Ò
         g_MySelf.m_nGold := msg.Recog;
         g_MySelf.m_nGameGold:=MakeLong(msg.Param,msg.Tag);
         g_nExChangeGold := 0;
         g_nExChangeGameGold := 0;
      end;

      SM_EXCHGRATE: begin     //È¯Àü ½Ã¼¼
        str := DecodeString (body);
        g_nExChgGoldRate:=msg.Recog;
        g_nExChgGameGoldRate := StrToFloat(str);
      end;

      SM_EXCHGGOLD_OK: begin     //È¯Àü  (±ÝÀü - ¹ÐÈ¯)
        g_nExChangeGameGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
      end;
      SM_EXCHGGOLD_FAIL: begin   //È¯Àü
        g_nExChangeGameGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
      end;

      SM_EXCHGGAMEGOLD_OK: begin     //È¯Àü  (¹ÐÈ¯ - ±ÝÀü)
        g_nExChangeGold:=msg.Recog;
        g_MySelf.m_nGameGold:=MakeLong(msg.param, msg.tag);
      end;
      SM_EXCHGGAMEGOLD_FAIL: begin   //È¯Àü
        g_nExChangeGold:=msg.Recog;
        g_MySelf.m_nGameGold:=MakeLong(msg.param, msg.tag);
      end;


      SM_SENDUSERSTORAGEITEM: begin
        ClientGetSendUserStorage(msg.Recog, msg.Param);
      end;
      SM_SENDUCOMSTORAGEITEM : begin  //°ø¿ëÃ¢°í
        ClientGetSendComStorage(msg.Recog);
      end;
      SM_SENDUGUILDSTORAGEITEM: begin  //¹®ÆÄÃ¢°í
        ClientGetSendGuildStorage(msg.Recog);
      end;
      SM_CHANGEGUILDNAME: begin
        ClientGetChangeGuildName(@Msg,DecodeString (body));
      end;
      SM_SENDUSERSTATE: begin
        ClientGetSendUserState(body);
      end;
      SM_SENDGUILDGROW: begin     //¹®ÆÄ¼ºÀå
        ClientGetSendGuildGrow(body);
      end;
      SM_SENDGUILDGROW2: begin     //¹®ÆÄ¼ºÀå
        ClientGetSendGuildGrow2(body);
      end;
      SM_GUILDADDMEMBER_OK: begin
        SendGuildMemberList;
      end;
      SM_GUILDADDMEMBER_FAIL: begin
        case msg.Recog of
          1: FrmDlg.DMessageDlg ('ÄãÃ»ÓÐÈ¨ÀûÊ¹ÓÃÕâ¸öÃüÁî¡£', [mbOk]);
          2: FrmDlg.DMessageDlg ('Èë»áµÄ³ÉÔ±±ØÐëÃæ¶ÔÕÆÃÅÕ¾×Å¡£', [mbOk]);
          3: FrmDlg.DMessageDlg ('¶Ô·½ÒÑ¾­¼ÓÈëÁËÐÐ»á¡£', [mbOk]);
          4: FrmDlg.DMessageDlg ('¶Ô·½ÒÑ¾­¼ÓÈëÁËÆäËûÐÐ»á¡£', [mbOk]);
          5: FrmDlg.DMessageDlg ('¶Ô·½²»ÔÊÐí¼ÓÈëÐÐ»á¡£', [mbOk]);
        end;
      end;
      SM_GUILDDELMEMBER_OK: begin
        SendGuildMemberList;
      end;
      SM_GUILDDELMEMBER_FAIL: begin
        case msg.Recog of
          1: FrmDlg.DMessageDlg('Äã²»ÊÇÐÐ»áÕÆÃÅ¡£', [mbOk]);
          2: FrmDlg.DMessageDlg('¶Ô·½²»ÊÇÐÐ»á³ÉÔ±¡£', [mbOk]);
          3: FrmDlg.DMessageDlg('ÐÐ»áÕÆÃÅ²»ÄÜÉ¾³ý×Ô¼º¡£', [mbOk]);
          4: FrmDlg.DMessageDlg('¶Ô·½²»ÊÇÐÐ»á³ÉÔ±¡£', [mbOk]);
        end;
      end;
      SM_GUILDRANKUPDATE_FAIL: begin
        case msg.Recog of
          -2: FrmDlg.DMessageDlg('[Ê§°Ü] Äã²»ÄÜÉ¾³ýÐÐ»áÕÆÃÅ¡£', [mbOk]);
          -3: FrmDlg.DMessageDlg('[Ê§°Ü] ÐÐ»áÖÁÉÙÓÐ1ÃûÐÐ»áÕÆÃÅ¡£', [mbOk]);
          -4: FrmDlg.DMessageDlg('[Ê§°Ü] Ò»¸öÐÐ»á×î¶àÓÐ2ÃûÐÐ»áÕÆÃÅ¡£', [mbOk]);
          -5: FrmDlg.DMessageDlg('[Ê§°Ü] Äã²»ÄÜÌí¼Ó»òÕßÉ¾³ýÐÐ»á³ÉÔ±¡£', [mbOk]);
          -6: FrmDlg.DMessageDlg('[Ê§°Ü] ÄãÃ»ÓÐ¸Ä±äÃûµ¥¡£', [mbOk]);
          -7: FrmDlg.DMessageDlg('[Ê§°Ü] ÄúÖ»ÄÜÔÚ0ºÍ99Ö®¼äµ÷ÕûÖ°Î»¡£', [mbOk]);
        end;
      end;
      SM_GUILDMAKEALLY_OK,
      SM_GUILDMAKEALLY_FAIL: begin
        case msg.Recog of
          -1: FrmDlg.DMessageDlg ('ÄãÐèÒªÃæ¶Ô¶Ô·½¡£', [mbOk]);
          -2: FrmDlg.DMessageDlg ('ÄãÕýÓë¶Ô·½¹«»á½øÐÐÐÐ»áÕ½Õù¡£', [mbOk]);
          -3: FrmDlg.DMessageDlg ('Äã±ØÐëÃæ¶Ô¶Ô·½ÐÐ»áÕÆÃÅ¡£', [mbOk]);
          -4: FrmDlg.DMessageDlg ('¶Ô·½²»ÔÊÐíÁªÃË¡£', [mbOk]);
        end;
      end;
      SM_GUILDBREAKALLY_OK,
      SM_GUILDBREAKALLY_FAIL: begin
        case msg.Recog of
          -1: FrmDlg.DMessageDlg ('Äã²»ÊÇÐÐ»áÕÆÃÅ¡£', [mbOk]);
          -2: FrmDlg.DMessageDlg ('ÄãºÍ¶Ô·½²»ÊÇÍ¬ÃË¹ØÏµ¡£', [mbOk]);
          -3: FrmDlg.DMessageDlg ('ÐÐ»á²»´æÔÚ¡£', [mbOk]);
        end;
      end;
      SM_BUILDGUILD_OK: begin
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.DMessageDlg ('ÐÐ»á´´½¨³É¹¦¡£', [mbOk]);
      end;
      SM_BUILDGUILD_FAIL: begin
        FrmDlg.LastestClickTime := GetTickCount;
        case msg.Recog of
          -1: FrmDlg.DMessageDlg('ÄãÒÑ¼ÓÈëÆäËûÐÐ»á¡£', [mbOk]);
          -2: FrmDlg.DMessageDlg('´´½¨·ÑÓÃ²»×ã¡£', [mbOk]);
          -3: FrmDlg.DMessageDlg('ÄãÐèÒªÎÖÂêºÅ½Ç²ÅÄÜ´´½¨ÐÐ»á¡£', [mbOk]);
          else FrmDlg.DMessageDlg('ÐÐ»áµÄÃû×Ö³¤¶È±ØÐëÔÚ1ÖÁ16¸ö×Ö·ûÖ®¼ä¡£', [mbOk]);
        end;
      end;

      SM_MENU_OK: begin
        FrmDlg.LastestClickTime:=GetTickCount;
        if body <> '' then
          FrmDlg.DMessageDlg(DecodeString(body), [mbOk]);
      end;
      SM_SIMPLE_OK: begin
        FrmDlg.LastestClickTime:=GetTickCount;
        if body <> '' then
          FrmDlg.DSimpleMessageDlg2(DecodeString(body), [mbOk]);
      end;

      SM_DLGMSG: begin
        if body <> '' then
          FrmDlg.DMessageDlg(DecodeString(body), [mbOk]);
      end;
      SM_DONATE_OK: begin
        FrmDlg.LastestClickTime:=GetTickCount;
      end;
      SM_DONATE_FAIL: begin
        FrmDlg.LastestClickTime:=GetTickCount;
      end;

      SM_SENDWAKEUPITEM : ClientObjWakeUp(Msg.Recog, Msg.Param, body);

      SM_SENDWAKEUPITEM_OK : ClientObjWakeUpItemOK(body);
      SM_SENDWAKEUPITEM_FAIL : ClientObjWakeUpItemFail(Msg.Recog, Msg.Param, body);

      SM_PLAYDICE: begin
        Body2:=Copy(Body,GetCodeMsgSize(sizeof(TMessageBodyWL)*4/3) + 1, Length(body));
        DecodeBuffer(body,@wl,SizeOf(TMessageBodyWL));
        data:=DecodeString(Body2);
        FrmDlg.m_nDiceCount:=Msg.Param;       //QuestActionInfo.nParam1
        FrmDlg.m_Dice[0].nDicePoint:=LoByte(LoWord(Wl.lParam1)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[1].nDicePoint:=HiByte(LoWord(Wl.lParam1)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[2].nDicePoint:=LoByte(HiWord(Wl.lParam1)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[3].nDicePoint:=HiByte(HiWord(Wl.lParam1)); //UserHuman.m_DyVal[0]

        FrmDlg.m_Dice[4].nDicePoint:=LoByte(LoWord(Wl.lParam2)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[5].nDicePoint:=HiByte(LoWord(Wl.lParam2)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[6].nDicePoint:=LoByte(HiWord(Wl.lParam2)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[7].nDicePoint:=HiByte(HiWord(Wl.lParam2)); //UserHuman.m_DyVal[0]

        FrmDlg.m_Dice[8].nDicePoint:=LoByte(LoWord(Wl.lTag1)); //UserHuman.m_DyVal[0]
        FrmDlg.m_Dice[9].nDicePoint:=HiByte(LoWord(Wl.lTag1)); //UserHuman.m_DyVal[0]
        FrmDlg.DialogSize:=0;
        FrmDlg.DMessageDlg('',[]);
        SendMerchantDlgSelect(Msg.Recog,data);
      end;
      SM_TOPMSG: begin
        body := DecodeString(body);
        body := AnsiReplaceText(body, '#6', #6);
        body := AnsiReplaceText(body, '#5', #5);
        FrmDlg.m_TopMsgList.AddObject(body, nil);
        FrmDlg.DTopMsg.Visible := True;
      end;
      SM_FRIEND_RESULT: begin
        ClientGetFriendResult(Msg,Body);
      end;

      SM_MAILLIST: begin
        ClientMailList();
      end;

      SM_MAIL_LIST: begin
        if body <> '' then ClientGetMailList(Msg,Body);
      end;
      // 2003/04/15 Ä£±¸, ÂÊÁö
      SM_MAIL_ALARM: // ½Å±Ô ¸Þ¼¼Áö µµÂø
         begin
            SendMailList;
            ClientGetTagAlarm (msg ,body);
         end;
      SM_MAIL_INFO:  // ÂÊÁö Á¤º¸
         begin
            ClientGetTagInfo (msg);
         end;

      SM_MAIL_RESULT: begin
        ClientMailResult(Msg);
      end;
      SM_MAILSTATUS: begin
        ClientMailStatus(Msg,Body);
      end;
      SM_REJECT_LIST: begin
        ClientGetTagRejectList(Msg,Body);
      end;
      SM_REJECT_RESULT: begin
        ClientRejectResult(Msg,Body);
      end;
      SM_REJECT_ADD: begin
        ClientRejectListAdded(Msg,Body);
      end;
      SM_REJECT_DELETE: begin
        ClientRejectListDeleted(Msg,Body);
      end;

      SM_ME_LIST:  //»çÁ¦ ½ºÃÄ
      begin
        ClientGetMEList(msg, body);
      end;
      SM_ME_INFO:  //»çÁ¦ ½ºÃÄ
      begin
        ClientGetMEInfoList(msg, body);
      end;

      SM_LM_OPTION:       //¿¬ÀÎ ½ºÃÄ
      begin
        ClientGetLMOptionChange(msg);    //»çÁ¦ ½ºÃÄ
      end;
      SM_LM_REQUEST:      //¿¬ÀÎ ½ºÃÄ
      begin
        ClientGetLMRequest(msg, DecodeString (body));    //»çÁ¦ ½ºÃÄ
      end;
      SM_LM_LIST:    //¿¬ÀÎ ½ºÃÄ
      begin
        ClientGetLMList(msg, body);
      end;
      SM_LM_RESULT:        //¿¬ÀÎ ½ºÃÄ
      begin
        ClientGetLMREsult(msg, body);   //»çÁ¦ ½ºÃÄ
      end;
      SM_LM_DELETE:         //¿¬ÀÎ ½ºÃÄ
      begin
        ClientGetLMDelete(msg, body);   //»çÁ¦ ½ºÃÄ
      end;

      SM_LM_DELETE_REQ: begin   //¿¬ÀÎ ½ºÃÄ
        str := DecodeString(body);

          if mrYes = FrmDlg.DMessageDlg('ÄãÏëºÍ'+str+'Àë»éÂð£¿\Àë»éÐèÒªÖ§¸¶ 10Íò½ð±ÒµÄ·ÑÓÃ¡£',
            [mbYes, mbNo]) then begin
            SendClientMessage2(CM_LM_DELETE_REQ_OK,  RsState_Lover, 0, 0, 0, str);
          end else begin
            SendClientMessage2(CM_LM_DELETE_REQ_FAIL, RsState_Lover, 0, 0, 0, str);
          end;
      end;





      SM_ALIVEREQ :begin
       if body <> '' then begin
        // FrmDlg.DMsgDlg.DialogResult := mrNo;
        if mrOk = FrmDlg.DSimpleMessageDlg2 (DecodeString(body), [mbOk, mbCancel]) then begin
          SendClientMessage(CM_ALIVE_OK,0,0,0,0);
        end else begin

        end;
       end;
      end;

      SM_CHANGESYSTEMOK: Begin  //º¯È¯
        FrmDlg.CancelChanging2();
      end;
      SM_CHANGESYSTEM_FAIL: Begin  //º¯È¯
        FrmDlg.CancelChanging2();
      end;

      SM_REPAIRITEMOK: begin
        g_boItemMoving := FALSE;
      end;
      SM_WAKELIST: begin //°¢¼º
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.ClearWakeDlg;

        ClientWakeData(@msg, Body);
      end;
      SM_SHOPITEMLIST: begin //È¯»óÁ¡
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.ClearShopDlg;

        g_ShopCurrPage := msg.Param;
        g_ShopAmountofPages := msg.Tag;
        if msg.Series = 100 then g_ShopCurrSection := g_ShopCurrSection
        else g_ShopCurrSection := msg.Series;

        FrmDlg.DCategories12.Visible := False;
        FrmDlg.DCategories13.Visible := False;

        ClientGetShopData(Body);
      end;
      SM_SHOPITEMLIST2 : begin //È¯»óÁ¡
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.ClearShopDlg;
        g_ShopCurrPage := 1;
        g_ShopAmountofPages := 1;
        FrmDlg.DCategories12.Visible := True;
        FrmDlg.DCategories13.Visible := True;
        ClientGetShopData(Body);
      end;

      SM_GETSHOPITEMS_FAIL:     //È¯»óÁ¡
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearShopDlg;
          if msg.Param = 100 then g_ShopCurrSection := g_ShopCurrSection
           else g_ShopCurrSection := msg.Param;
          g_ShopCurrPage := 1;
          g_ShopAmountofPages := 1;
        end;
      SM_GIFTSITEMS: begin    //È¯»óÁ¡
        ClientGifts(Body);
      end;

      SM_USERMARK: ClientObjGetGuild(@Msg);    //¹®ÆÄ ¸¶Å©

      SM_USERMASK: ClientObjGetMask(@Msg,Body);     //º¯½ÅÅ» ±âÆÛÁü

      SM_GETDICE: begin    //Ç÷·æ»óÀÚ
         StartDice := False;
         MainDiceimg := 282;
         CurrGame := 1;
         FakeGame := 1;
         MaxGame := msg.Tag + 1;
         SelectDice := 0;
         Succecs := True;
         ClientGetDiceGame(Body);
      end;
      SM_ONAUCTION: begin    //°æ¸Å
      //  g_AucMode := 0;
        FrmDlg.OpenAction;
      end;
      SM_GETDICE_FAIL: FrmDlg.ClearDiceDlg;
      SM_SHOWCHANGEITEM: ClientShowChangeItem;  //º¯È¯
      SM_GETDICEITEM: begin
        FrmDlg.DDiceCloseClick(Nil, 0, 0);
      end;
      SM_SENDSNOW: ClientSnow(@Msg, DecodeString(Body));   //´«¿À´ÂÀÌÆåÆ®

      SM_SENDSTORE: ClientStore(@Msg);              //°³ÀÎ»óÁ¡
      SM_DELSTOREITEM: ClientDelStoreItem(Body);       //°³ÀÎ»óÁ¡
      SM_USERSTOREITEMS: ClientGetSendUserStoreState(Body);   //°³ÀÎ»óÁ¡
      SM_SENDBUYSTOREITEM_OK: ClientObjBuyStoreItemOK();   //°³ÀÎ»óÁ¡
      SM_SENDBUYSTOREITEM_FAIL: ClientObjBuyStoreItemFail(@Msg); //°³ÀÎ»óÁ¡
      SM_SENDSTARTSTORE_OK: ClientObjStartStoreOK(); //°³ÀÎ»óÁ¡
      SM_SENDSTOPSTORE_OK: ClientObjStopStoreOK();   //°³ÀÎ»óÁ¡
      SM_SENDSTARTSTORE_FAIL: ClientObjStartStoreFail(); //°³ÀÎ»óÁ¡

      SM_BLASTHIT: ClientObjBlasthit(@Msg);   //ÂüÁø°Ý

      SM_HEROCREATE: ClientHeroCreate(Msg.Recog);   //¿µ¿õ °í¿ë
      SM_HEROINFO: ClientGetHeroInfo(@Msg);
      SM_HEROLOGON: ClientObjHeroLogOn(@Msg, Body);
      SM_HEROLOGON_OK: ClientObjHeroLogOnOK(@Msg);

      SM_HEROLOGOUT: ClientObjHeroLogOut(@Msg);
      SM_HEROLOGOUT_OK: ClientObjHeroLogOutOK(Msg.Recog);

      SM_HEROBUFF: ClientHeroBuffSystem(DecodeString(Body), Msg.Tag, Msg.Param, Msg.Series); //¹öÇÁ

      SM_HEROABILITY: ClientObjHeroAbility(@Msg, Body);
      SM_HEROSUBABILITY: ClientObjHeroSubAbility(@Msg);
      SM_HEROBAGITEMS: ClientGetHeroBagItmes(@Msg, Body);
      SM_HEROADDITEM: ClientGetHeroAddItem(Body);
      SM_HEROADDITEM2: //¿µ¿õ¹°¾à
         begin
            ClientGetHeroAddItem2 (Body,Msg.Series);
         end;
      SM_HEROBAGITEMS2:    //°¡¹æ
        begin
          FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
        end;

      SM_HEROSTORAGEITEMS:  //¿µ¿õ¿©°ü
        begin
          ClientGetHeroStoreItems (body);
        end;
      SM_HEROSTORAGEITEMS2:  //¿µ¿õ¿©°ü
        begin
          FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
        end;
      SM_ADDHEROSTORAGE:   //¿µ¿õ¿©°ü
        begin
          ClientGetAddHeroStore (body);
        end;
      SM_ADDHEROSTORAGEITEM : ClientGetHeroStorageAddItem (body,msg.Series);

      SM_SENDHEROUSEITEMS: ClientGetSendHerouseItems(Body);
      SM_HEROBAGCOUNT: ClientObjHeroBagCount(@Msg);
      SM_HEROTAKEON_OK: ClientObjHeroTakeOnOK(@Msg, DecodeString(Body));
      SM_HEROTAKEON_FAIL: ClientObjHeroTakeOnFail();
      SM_HEROTAKEOFF_OK: ClientObjHeroTakeOffOK(@Msg, DecodeString(Body));
      SM_HEROTAKEOFF_FAIL: ClientObjHeroTakeOffFail();

      SM_MASTERBAGTOHEROBAG_OK: ClientObjToHeroBagOK();    //ÁÖÀÎ > ¿µ¿õ °¡¹æÀ¸·Î
      SM_MASTERBAGTOHEROBAG_FAIL: ClientObjToHeroBagFail();  //ÁÖÀÎ > ¿µ¿õ °¡¹æ ÀÌµ¿ ½ÇÆÐ
      SM_HEROBAGTOMASTERBAG_OK: ClientObjToMasterBagOK();  //¿µ¿õ > ÁÖÀÎ °¡¹æÀ¸·Î
      SM_HEROBAGTOMASTERBAG_FAIL: ClientObjToMasterBagFail();  //¿µ¿õ > ÁÖÀÎ °¡¹æ ÀÌµ¿ ½ÇÆÐ
      SM_HEROEAT_OK: ClientObjHeroEatOK(@Msg);
      SM_HEROEAT_FAIL: ClientObjHeroEatFail();
      SM_HEROMAGIC_LVEXP: ClientGetHeroMagicLvExp(Msg.Recog {magid}, Msg.param {lv}, MakeLong(Msg.tag, Msg.series));
      SM_HERODURACHANGE: ClientGetHeroDuraChange(Msg.param {useitem index}, Msg.Recog, MakeLong(Msg.tag, Msg.series));
      SM_HEROWEIGHTCHANGED: ClientObjHeroWeigthChanged(@Msg);

      SM_HEROWINEXP: ClientObjHeroWinExp(@Msg);
      SM_HEROLEVELUP: ClientObjHeroLevelUp(@Msg);

      SM_SENDMYHEROMAGIC: ClientGetMyHeroMagics(Body);
      SM_HEROADDMAGIC: ClientGetHeroAddMagic(Body);
      SM_HERODELMAGIC: ClientGetHeroDelMagic(Msg.Recog);


      SM_HEROUPDATEITEM: ClientGetHeroUpdateItem(Body);
      SM_HEROAIMODE: ClientObjHeroAiMode(Msg.param);

      SM_AUTODELITEM_OK,
      SM_AUTODELITEM_FAIL: begin
          FrmDlg.LastestClickTime := GetTickCount;
          if msg.Ident <> SM_AUTODELITEM_OK then begin
            if (g_MovingItem.Owner = FrmDlg.DAutoPot1) then begin   //¿©°ü
              FrmDlg.CancelItemAuto;
              Exit;
            end;
          end;
        end;

      SM_AUTOADDITEM_OK,
      SM_AUTOADDITEM_FAIL: begin
          FrmDlg.LastestClickTime := GetTickCount;
          if msg.Ident <> SM_AUTOADDITEM_OK then begin
            FrmDlg.DMessageDlg ('ÎÞ·¨×Ô¶¯Ê¹ÓÃÒ©Ë®¡£', [mbOk]);
            AddHeroItemBag (g_SellDlgItemSellWait);
          end;
          g_SellDlgItemSellWait.S.Name := '';
        end;

      SM_HEROAUTOITEMS: ClientGetHeroAutoItmes(@Msg, Body);
      SM_ADDHEROAUTO: ClientGetAddHeroAuto (body);

      SM_HEROAUTODELITEM: ClientGetHeroAutoDelItem(Body);
      SM_HEROAUTOADDITEM: ClientGetHeroAutoAddItem (Body,Msg.Series);

      SM_HERODELITEMS: ClientGetHeroDelItems(Body);
      SM_HERODELITEM: ClientGetHeroDelItem(Body);

      SM_DELHEROITEM:
         begin
            ClientGetHeDelItem (body, msg.Tag);
         end;

      SM_HERO_STORAGE_OK,
      SM_HERO_STORAGE_FULL,
      SM_HERO_STORAGE_FAIL:
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            if msg.Ident <> SM_HERO_STORAGE_OK then begin
               if msg.Ident = SM_HERO_STORAGE_FULL then begin
                  FrmDlg.DMessageDlg ('Ó¢ÐÛµÄ±³°üÒÑÂú£¬²»ÄÜ¼ÌÐø·ÅÈëÎïÆ·¡£', [mbOk])  ;
                  AddItemBag (g_SellDlgItemSellWait);
               end else begin
                  FrmDlg.DMessageDlg ('Äã²»ÄÜ·ÅÈëÎïÆ·¡£', [mbOk]);
                  AddItemBag (g_SellDlgItemSellWait);
               end;
            end;
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_HERO_TAKEBACKSTORAGEITEM_OK,
      SM_HERO_TAKEBACKSTORAGEITEM_FAIL,
      SM_HERO_TAKEBACKSTORAGEITEM_FULLBAG:
         begin
            FrmDlg.LastestClickTime := GetTickCount; //2010-07-06 ¿©°ü ¹ö±×
            if msg.Ident <> SM_HERO_TAKEBACKSTORAGEITEM_OK then begin
               if msg.Ident = SM_HERO_TAKEBACKSTORAGEITEM_FULLBAG then begin
                  mj := g_MovingItem.Index;
                  if mj >= 600 then begin   //¿©°ü
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('ÎÞ·¨ÕÒµ½ÎïÆ·¡£', [mbOk]);
                   Exit;
                 end;
               end else
                 mj := g_MovingItem.Index;
                  if mj >= 600 then begin   //¿©°ü
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('ÎïÆ·²»´æÔÚ¡£', [mbOk]);
                   Exit;
                 end;
            end;
            //   FrmDlg.DelStorageItem (msg.Recog); //itemserverindex
         end;

      else begin
        if g_MySelf = nil then exit;     //ÔÚÎ´½øÈëÓÎÏ·Ê±²»´¦ÀíÏÂÃæ

        PlayScene.MemoLog.Lines.Add('Ident: ' + IntToStr(msg.Ident));
        PlayScene.MemoLog.Lines.Add('Recog: ' + IntToStr(msg.Recog));
        PlayScene.MemoLog.Lines.Add('Param: ' + IntToStr(msg.Param));
        PlayScene.MemoLog.Lines.Add('Tag: ' + IntToStr(msg.Tag));
        PlayScene.MemoLog.Lines.Add('Series: ' + IntToStr(msg.Series));
      end;
   end;

   if Pos('#', datablock) > 0 then
      DScreen.AddSysMsg (datablock,40,60,clGreen);
end;

procedure TfrmMain.ClientSnow(DefMsg: pTDefaultMessage; body: string);//´«¿À´ÂÀÌÆåÆ®
begin
  g_boSnow := DefMsg.param > 0;
  g_nSnowLev := DefMsg.Recog;
  g_boFlower := DefMsg.Series > 0;
  g_boPKZONE := StrToBool(Body);
end;

procedure TfrmMain.ClientStore(DefMsg: pTDefaultMessage); //°³ÀÎ»óÁ¡
var
  Actor: TActor;
begin
  if DefMsg.Recog = g_MySelf.m_nRecogId then begin
    g_MySelf.m_boStartStore := DefMsg.param > 0;
    if (g_nStoreMasterRecogId = DefMsg.Recog) and (not g_MySelf.m_boStartStore) then begin
      FrmDlg.CloseUserStoreDlg;
    end;
  end else begin
    Actor := PlayScene.FindActor(DefMsg.Recog);
    if (Actor <> nil) and (Actor is THumActor) then begin
      Actor.m_boStartStore := DefMsg.param > 0;
      if (g_nStoreMasterRecogId = DefMsg.Recog) and (not Actor.m_boStartStore) then begin
        FrmDlg.CloseUserStoreDlg;
      end
    end;
  end;
end;

procedure TfrmMain.ClientDelStoreItem(body: string);   //°³ÀÎ»óÁ¡
var
  ci: TClientItem;
begin
  if body <> '' then begin
    DecodeBuffer(body, @ci, SizeOf(TClientItem));
    DelStoreItem(ci);
    DelStoreRemoteItem(ci);

    if g_MySelf.m_boStartStore then begin
      SendSay (FrmDlg.EdStoreMsgEdit.Text);
    end;
  end;
end;

procedure TfrmMain.ClientGetSendUserStoreState(body: string);   //°³ÀÎ»óÁ¡
type
  TOpen = procedure;
var
  UserStoreState: TUserStoreStateInfo;
begin
  FillChar(UserStoreState, SizeOf(TUserStoreStateInfo), #0);
  DecodeBuffer(body, @UserStoreState, SizeOf(TUserStoreStateInfo));
  UserStoreState.NameColor := GetRGB(UserStoreState.NameColor);
  Move(UserStoreState.UseItems, g_StoreRemoteItems, SizeOf(TStoreItem) * 15);
  g_sStoreMasterName := UserStoreState.UserName;
  g_nStoreMasterRecogId := UserStoreState.RecogId;

  FrmDlg.OpenUserStoreDlg;
end;

procedure TfrmMain.ClientObjBuyStoreItemOK(); //°³ÀÎ»óÁ¡
begin
  g_SelectStoreItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjBuyStoreItemFail(DefMsg: pTDefaultMessage); //°³ÀÎ»óÁ¡
begin
  case DefMsg.Recog of
    -1: begin
     if DefMsg.tag = 0 then begin
       FrmDlg.DMessageDlg('½ð±Ò²»×ã¡£', [mbOk]);
     end else begin
       FrmDlg.DMessageDlg('µãÈ¯²»×ã¡£', [mbOk]);
     end;
    end;
    -2: FrmDlg.DMessageDlg('ÎïÆ·Ãû×Ö´íÎó¡£', [mbOk]);
    -3: FrmDlg.DMessageDlg('ÄãµÄ±³°üÒÑÂú¡£', [mbOk]);
    -4: FrmDlg.DMessageDlg('Âô·½ÎÞ·¨È¡»Ø½ð±Ò¡£', [mbOk]);
    -5: FrmDlg.DMessageDlg('Âô¶«Î÷Ê±ÎÞ·¨Ê¹ÓÃÉÌÆÌ¹¦ÄÜ¡£', [mbOk]);
    -6: FrmDlg.DMessageDlg('Âô·½ÎÞ·¨È¡»ØµãÈ¯¡£', [mbOk]);
    -7: FrmDlg.DMessageDlg('´ËÎïÆ·½ûÖ¹¹ºÂò¡£', [mbOk]);
  else FrmDlg.DMessageDlg('´íÎó¡£', [mbOk]);
  end;
end;

procedure TfrmMain.ClientObjStartStoreOK();       //°³ÀÎ»óÁ¡
var
  btDir: Byte;
begin
  g_TargetCret := nil;
  g_FocusCret := nil;
  g_MagicTarget := nil;
  g_boStartStoreing := False;
  btDir := g_MySelf.m_btDir;

  g_MySelf.SendMsg(CM_TURN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, btDir, 0, 0, '', 0);


  g_MySelf.m_boStartStore := True;
  FrmDlg.EdStoreMsgEdit.Visible := False;
  FrmDlg.EdStoreMacrosEdit.Visible := False;
  FrmDlg.DItemBag.Visible := False;
end;

procedure TfrmMain.ClientObjStartStoreFail();     //°³ÀÎ»óÁ¡
begin
  g_boStartStoreing := False;
  FrmDlg.EdStoreMsgEdit.Visible := True;
  FrmDlg.EdStoreMacrosEdit.Visible := True;
end;

procedure TfrmMain.ClientObjStopStoreOK();        //°³ÀÎ»óÁ¡
begin
  g_boStartStoreing := False;
  g_MySelf.m_boStartStore := False;
  if (g_nStoreMasterRecogId = g_MySelf.m_nRecogId) and FrmDlg.DUserStore.Visible then begin
    FrmDlg.CloseUserStoreDlg;
  end;
  g_sStoreMasterName := '';
  g_nStoreMasterRecogId := 0;
end;
procedure TfrmMain.ClientGetRenewHum(Msg: pTDefaultMessage; Body: string);
var
  I: integer;
  str, uname, sjob, slevel, ssex: string;
begin
  if Msg.Recog > 0 then begin
    with SelectChrScene do begin
      SafeFillChar(RenewChr, SizeOf(RenewChr), #0);
      str := DecodeString(body);
      for I := 0 to Msg.Recog - 1 do begin
        if I >= High(RenewChr) then
          break;
        str := GetValidStr3(str, uname, ['/']);
        str := GetValidStr3(str, sjob, ['/']);
        str := GetValidStr3(str, slevel, ['/']);
        str := GetValidStr3(str, ssex, ['/']);
        if (uname <> '') and (slevel <> '') then begin
          RenewChr[I].Name := uname;
          RenewChr[I].Job := StrToIntDef(sJob, 0);
          RenewChr[I].Level := StrToIntDef(sLevel, 0);
          RenewChr[I].Sex := StrToIntDef(ssex, 0);
        end;
        //FrmDlg.DRenewChr.Left := 30;
        //FrmDlg.DRenewChr.Top := 0;
        //FrmDlg.DRenewChr.Visible := True;
        DScreen.ChangeScene(stSelectChr);
        SelectChrScene.ChangeSelectChrState(scRenewChr);
      end;
    end;
  end
  else begin
  //  FrmDlg.HintBack := stSelectChr;
   // FrmDlg.sHintStr := '»èÁ¦µÈ Ä³¸¯ÅÍ°¡ ¾ø½À´Ï´Ù.';
  //  FrmDlg.DBTHintClose.Caption := 'È® ÀÎ';
 //   FrmDlg.boHintFocus := True;
  end;
end;
procedure TfrmMain.ClientGetPasswdSuccess (body: string);
var
   str, runaddr, runport, certifystr: string;
begin
   str := DecodeString (body);
   str := GetValidStr3 (str, runaddr, ['/']);
   str := GetValidStr3 (str, runport, ['/']);
   str := GetValidStr3 (str, certifystr, ['/']);
   Certification := Str_ToInt(certifystr, 0);

   if not BoOneClick then begin
      CSocket.Active:=False;
      CSocket.Host:='';
      CSocket.Port:=0;
      FrmDlg.DSelServerDlg.Visible := FALSE;
      WaitAndPass (500); //0.5Ãë
      g_ConnectionStep := cnsSelChr;
      with CSocket do begin
         g_sSelChrAddr := runaddr;
         g_nSelChrPort := Str_ToInt (runport, 0);
         Address := g_sSelChrAddr;
         Port := g_nSelChrPort;
         Active := TRUE;
      end;
   end else begin
      FrmDlg.DSelServerDlg.Visible := FALSE;
      g_sSelChrAddr := runaddr;
      g_nSelChrPort := Str_ToInt (runport, 0);
      if CSocket.Socket.Connected then
         CSocket.Socket.SendText ('$S' + runaddr + '/' + runport + '%');
      WaitAndPass (500); //0.5Ãë
      g_ConnectionStep := cnsSelChr;
      LoginScene.OpenLoginDoor;
      SelChrWaitTimer.Enabled := TRUE;
   end;
end;
procedure TfrmMain.ClientGetPasswordOK(Msg: TDefaultMessage;
  sBody: String);
var
  I: Integer;
  sServerName:String;
  sServerStatus:String;
  nCount:Integer;
begin
  sBody:=DeCodeString(sBody);
//  FrmDlg.DMessageDlg (sBody + '/' + IntToStr(Msg.Series), [mbOk]);
  nCount:=_MIN(8,msg.Series);
  g_ServerList.Clear;
  for I := 0 to nCount - 1 do begin
    sBody:=GetValidStr3(sBody,sServerName,['/']);
    sBody:=GetValidStr3(sBody,sServerStatus,['/']);
    g_ServerList.AddObject(sServerName,TObject(Str_ToInt(sServerStatus,0)));
  end;


               g_wAvailIDDay := Loword(msg.Recog);
               g_wAvailIDHour := Hiword(msg.Recog);
               g_wAvailIPDay := msg.Param;
               g_wAvailIPHour := msg.Tag;

               if g_wAvailIDDay > 0 then begin
                  if g_wAvailIDDay = 1 then
                     FrmDlg.DMessageDlg ('Äúµ±Ç°ID·ÑÓÃµ½½ñÌìÎªÖ¹¡£', [mbOk])
                  else if g_wAvailIDDay <= 3 then
                     FrmDlg.DMessageDlg ('Äúµ±Ç°IP·ÑÓÃ»¹Ê£: ' + IntToStr(g_wAvailIDDay) + ' Ìì¡£', [mbOk]);
               end else if g_wAvailIPDay > 0 then begin
                  if g_wAvailIPDay = 1 then
                     FrmDlg.DMessageDlg ('Äúµ±Ç°IP·ÑÓÃµ½½ñÌìÎªÖ¹¡£', [mbOk])
                  else if g_wAvailIPDay <= 3 then
                     FrmDlg.DMessageDlg ('Äúµ±Ç°IP·ÑÓÃ»¹Ê£ ' + IntToStr(g_wAvailIPDay) + ' Ìì¡£', [mbOk]);
               end else if g_wAvailIPHour > 0 then begin
                  if g_wAvailIPHour <= 100 then
                     FrmDlg.DMessageDlg ('Äúµ±Ç°IP·ÑÓÃ»¹Ê£ ' + IntToStr(g_wAvailIPHour) + ' Ð¡Ê±¡£', [mbOk]);
               end else if g_wAvailIDHour > 0 then begin
                  FrmDlg.DMessageDlg ('Äúµ±Ç°ID·ÑÓÃ»¹Ê£ ' + IntToStr(g_wAvailIDHour) + ' Ð¡Ê±¡£', [mbOk]);;
               end;

               if not LoginScene.m_boUpdateAccountMode then
                  ClientGetSelectServer;
end;

procedure TfrmMain.ClientGetSelectServer;
begin
  LoginScene.HideLoginBox;
  FrmDlg.ShowSelectServerDlg;
end;

procedure TfrmMain.ClientGetNeedUpdateAccount (body: string);
var
   ue: TUserEntry;
begin
   DecodeBuffer (body, @ue, sizeof(TUserEntry));
   LoginScene.UpdateAccountInfos (ue);
end;

procedure TfrmMain.ClientGetReceiveChrs (body: string);
var
   i, select: integer;
   str, uname, sjob, shair, slevel, ssex, sLogin: string;
begin
   SelectChrScene.ClearChrs;
   str := DecodeString (body);
   for i:=0 to 3 do begin
      str := GetValidStr3 (str, uname, ['/']);
      str := GetValidStr3 (str, sjob, ['/']);
      str := GetValidStr3 (str, shair, ['/']);
      str := GetValidStr3 (str, slevel, ['/']);
      str := GetValidStr3 (str, ssex, ['/']);
      sLogin := ' ';
   //   str := GetValidStr3 (str, sLogin, ['/']);
      select := 0;
      if (uname <> '') and (slevel <> '') and (ssex <> '') then begin
         if uname[1] = '*' then begin
            select := i;
            uname := Copy (uname, 2, Length(uname)-1);
         end;
         SelectChrScene.AddChr (uname, Str_ToInt(sjob, 0), Str_ToInt(shair, 0), Str_ToInt(slevel, 0), Str_ToInt(ssex, 0), sLogin);
      end;
      with SelectChrScene do begin
         if select = 0 then begin
            ChrArr[0].FreezeState := FALSE;
            ChrArr[0].Selected := TRUE;
            ChrArr[1].FreezeState := TRUE;
            ChrArr[1].Selected := FALSE;
            ChrArr[2].FreezeState := TRUE;
            ChrArr[2].Selected := FALSE;
            ChrArr[3].FreezeState := TRUE;
            ChrArr[3].Selected := FALSE;
         end
         else if select = 1 then begin
            ChrArr[0].FreezeState := TRUE;
            ChrArr[0].Selected := FALSE;
            ChrArr[1].FreezeState := FALSE;
            ChrArr[1].Selected := TRUE;
            ChrArr[2].FreezeState := TRUE;
            ChrArr[2].Selected := FALSE;
            ChrArr[3].FreezeState := TRUE;
            ChrArr[3].Selected := FALSE;
         end
         else if select = 2 then begin
            ChrArr[0].FreezeState := TRUE;
            ChrArr[0].Selected := FALSE;
            ChrArr[1].FreezeState := TRUE;
            ChrArr[1].Selected := FALSE;
            ChrArr[2].FreezeState := FALSE;
            ChrArr[2].Selected := TRUE;
            ChrArr[3].FreezeState := TRUE;
            ChrArr[3].Selected := FALSE;
         end
         else begin
            ChrArr[0].FreezeState := TRUE;
            ChrArr[0].Selected := FALSE;
            ChrArr[1].FreezeState := TRUE;
            ChrArr[1].Selected := FALSE;
            ChrArr[2].FreezeState := TRUE;
            ChrArr[2].Selected := FALSE;
            ChrArr[3].FreezeState := FALSE;
            ChrArr[3].Selected := TRUE;
         end;
      end;
   end;
   PlayScene.EdAccountt.Text:=LoginId;
end;

procedure TfrmMain.ClientGetStartPlay (body: string);
var
   str, addr, sport: string;
begin
   str := DecodeString (body);
   sport := GetValidStr3 (str, g_sRunServerAddr, ['/']);
   g_nRunServerPort:=Str_ToInt (sport, 0);

   if not BoOneClick then begin
      CSocket.Active := FALSE;
      CSocket.Host:='';
      CSocket.Port:=0;
      WaitAndPass (500); //0.5Ãë

      g_ConnectionStep := cnsPlay;
      with CSocket do begin
         Address := g_sRunServerAddr;
         Port := g_nRunServerPort;
         Active := TRUE;
      end;
   end else begin
      SocStr := '';
      BufferStr := '';
      if CSocket.Socket.Connected then
         CSocket.Socket.SendText ('$R' + addr + '/' + sport + '%');

      g_ConnectionStep := cnsPlay;
      ClearBag;
      ClearStore;

      DScreen.ClearChatBoard;

      WaitAndPass (500); //0.5Ãë
      SendRunLogin;
   end;
end;

procedure TfrmMain.ClientGetReconnect (body: string);
var
   str, addr, sport: string;
begin
   str := DecodeString (body);
   sport := GetValidStr3 (str, addr, ['/']);

   if not BoOneClick then begin
      if g_boBagLoaded then
        Savebags (CharName + '.itm', @g_ItemArr);
      g_boBagLoaded := FALSE;

      g_boServerChanging := TRUE;
      CSocket.Active := FALSE;
      CSocket.Host:='';
      CSocket.Port:=0;

      WaitAndPass (500); //0.5Ãë

      g_ConnectionStep := cnsPlay;
      with CSocket do begin
         Address := addr;
         Port := Str_ToInt (sport, 0);
         Active := TRUE;
      end;

   end else begin
      if g_boBagLoaded then
        Savebags (CharName + '.itm', @g_ItemArr);
      g_boBagLoaded := FALSE;

      SocStr := '';
      BufferStr := '';
      g_boServerChanging := TRUE;

      if CSocket.Socket.Connected then
         CSocket.Socket.SendText ('$C' + addr + '/' + sport + '%');

      WaitAndPass (500); //0.5Ãë
      if CSocket.Socket.Connected then
         CSocket.Socket.SendText ('$R' + addr + '/' + sport + '%');

      g_ConnectionStep := cnsPlay;
      ClearBag;
      ClearStore;

      DScreen.ClearChatBoard;

      WaitAndPass (300); //0.5Ãë
      ChangeServerClearGameVariables;

      SendRunLogin;
   end;
end;

procedure TfrmMain.ClientGetMapDescription(Msg:TDefaultMessage;sBody:String);
var
  sTitle:String;
begin
  sBody:=DecodeString(sBody);
  sBody:=GetValidStr3(sBody, sTitle, [#13]);

  g_nMiniMapIndex := Msg.Param - 1;
  g_nMapIndex := Msg.Tag - 1;
  if ((g_nMiniMapIndex < 0) and g_boViewMiniMap) then
    DScreen.AddChatBoardString('Ã»ÓÐ¿ÉÓÃµÄµØÍ¼ÏÔÊ¾¡£', clWhite, clRed);
  if ((g_nMapIndex < 0) and g_boViewMap) then
    Dscreen.AddChatBoardString('Ã»ÓÐ¿ÉÓÃµÄµØÍ¼ÏÔÊ¾¡£', clWhite, clRed);

  g_boDeathMatch := Msg.Series > 0;  //µ¥½º¸ÅÄ¡
  g_sMapTitle:=sTitle;
  g_MapDesc := GetMapDescList(sTitle);
  g_nMapMusic:=Msg.Recog;
  PlayMapMusic(True);
  if g_boNpcMoveing and (g_nScriptGotoStr <> '') then
    ScriptGoto(g_nScriptGotoStr);
end;

procedure TfrmMain.ClientGetGameGoldName(Msg:TDefaultMessage;sBody: String);
var
  sData:String;
begin
  if sBody <> '' then begin
    sBody:=DecodeString(sBody);
    sBody:=GetValidStr3(sBody, sData, [#13]);
    g_sGameGoldName:=sData;
    g_sGamePointName:=sBody;
  end;
  if MakeLong(msg.Param,msg.Tag) > g_MySelf.m_nGamePoint then begin
    DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGamePoint) + '<CE> ÓÎÏ·µã±»·¢ÏÖ¡£' ,40,60,clSkyBlue);
  end;

  g_MySelf.m_nGameGold:=Msg.Recog;
  g_MySelf.m_nGamePoint:=MakeLong(Msg.Param,Msg.Tag);
  g_MySelf.m_boHero := ByteToBool(Msg.Series);
  if g_MySelf.m_boHero then begin
    FrmDlg.DButtonMenuHero.Visible := True;
    FrmDlg.DButtonReCallHero.Visible := True;
  end else begin
    FrmDlg.DButtonMenuHero.Visible := False;
    FrmDlg.DButtonReCallHero.Visible := False;
  end;
end;


procedure TfrmMain.ClientGetSayItem(Msg: TDefaultMessage; sBody: string);
var
  pc: TClientItem;
  i, II: integer;
  ClickItem: pTClickItem;
  pMessage: pTSayMessage;
begin
  SafeFillChar(pc, SizeOf(TClientItem), #0);
  DecodeBuffer (sBody, @pc, sizeof(TClientItem));
  with FrmDlg, DScreen do begin
    OpenSayItemShow(pc);
    for I := 0 to m_NewSayMsgList.Count - 1 do begin
      pMessage := m_NewSayMsgList[I];
      if (pMessage.ItemList <> nil) and (pMessage.ItemList.Count > 0) then begin
        for ii := 0 to pMessage.ItemList.Count - 1 do begin
          ClickItem := pMessage.ItemList[ii];
          if (ClickItem.ItemIndex = msg.Recog) and (ClickItem.nIndex = msg.Param) then begin
            ClickItem.pc := pc;
            Exit;
          end;
        end;
      end;
    end;
  end;

end;

procedure TfrmMain.ClientGetAdjustBonus (bonus: integer; body: string);
var
   str1, str2, str3: string;
begin
   g_nBonusPoint := bonus;
   body := GetValidStr3 (body, str1, ['/']);
   str3 := GetValidStr3 (body, str2, ['/']);
   DecodeBuffer (str1, @g_BonusTick, sizeof(TNakedAbility));
   DecodeBuffer (str2, @g_BonusAbil, sizeof(TNakedAbility));
   DecodeBuffer (str3, @g_NakedAbil, sizeof(TNakedAbility));
   FillChar (g_BonusAbilChg, sizeof(TNakedAbility), #0);
end;

procedure TfrmMain.ClientGetAddItem (body: string;idx:integer);
var
   cu: TClientItem;
   sCount: string;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemBag (cu);
     { if cu.Amount > 0 then begin
        sCount := IntToStr(cu.Amount);
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
            end;
          end;
        end;
      end else begin }
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
            end;
          end;
        end;
     // end;
   end;
end;

procedure TfrmMain.ClientGetAddItem2 (body: string;idx:integer);  //¹°¾à
var
   cu: TClientItem;
   sCount: string;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemBag2 (cu);
      {if cu.Amount > 0 then begin
        sCount := IntToStr(cu.Amount);
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>¸¦ ¾ò¾ú½À´Ï´Ù.',40,60, clWhite);
            end;
          end;
        end;
      end else begin   }
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
            end;
          end;
        end;
    //  end;
   end;
end;

procedure TfrmMain.ClientGetStorageAddItem (body: string;idx:integer);  //¹°¾à
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemStore2 (cu);
   end;
end;

procedure TfrmMain.ClientGetHeroStorageAddItem (body: string;idx:integer);  //¹°¾à
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemHeroStore2 (cu);
   end;
end;

procedure TfrmMain.ClientGetGroupAddItem(Msg: pTDefaultMessage; Grade:Byte; sBody:String);
var
  GroupMember: pTGroupMember;
  i: Integer;
  sCount: string;
begin
  if g_MemberGroup.Count > 0 then begin
    for i := 0 to g_MemberGroup.Count - 1 do begin
      GroupMember := g_MemberGroup[i];
      if GroupMember.ClientGroup.UserID = msg.Recog then begin
        if sBody <> '' then begin
          sCount := IntToStr(msg.Param);
          if StrToInt(sCount) > 1 then begin
            DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>»ñµÃÁË <CO$FFFF>' + sBody + '(' + sCount + ')<CE¡£', 40, 60, clWhite);
          end else begin
            case Grade of
              0, 1 : DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>»ñµÃÁË <CO$FFFF>' + sBody + '<CE>¡£', 40, 60, clWhite);
              2: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>»ñµÃÁË <CO$00FFDF42>' + sBody + '<CE>¡£', 40, 60, clWhite);
              3: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>»ñµÃÁË <CO$000075FF>' + sBody + '<CE>¡£', 40, 60, clWhite);
              4: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>»ñµÃÁË <CO$00FFAADE>' + sBody + '<CE>¡£', 40, 60, clWhite);
            end;
          end;
        end;
        break;
      end;
    end;
  end;
end;

procedure TfrmMain.ClientGetAddStore (body: string);
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemStore (cu);
   end;
end;

procedure TfrmMain.ClientGetAddHeroStore (body: string);
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemHeroStore (cu);
   end;
end;

procedure TfrmMain.ClientGetUpdateItem (body: string);
var
   i: integer;
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      UpdateItemBag (cu);
      for i:=0 to MAXUSEITEM do begin  //¾ÆÀÌÅÛ °¹¼ö
         if (g_UseItems[i].S.Name = cu.S.Name) and (g_UseItems[i].MakeIndex = cu.MakeIndex) then begin
            g_UseItems[i] := cu;
         end;
      end;
   end;
end;

procedure TfrmMain.ClientGetComUpdateItem (body: string);
var
   i: integer;
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      UpdateItemBag (cu);
      FrmDlg2.FCompoundUserItem := cu;
      for i:=0 to MAXUSEITEM do begin  //¾ÆÀÌÅÛ °¹¼ö
         if (g_UseItems[i].S.Name = cu.S.Name) and (g_UseItems[i].MakeIndex = cu.MakeIndex) then begin
            g_UseItems[i] := cu;
         end;
      end;
   end;
end;

procedure TfrmMain.ClientGetDelItem (body: string; flag: integer );
var
   i: integer;
   cu: TClientItem;
begin
   if body <> '' then begin
      if flag = 1 then begin
         DecodeBuffer (body, @DelTempItem, sizeof(TClientItem));
      end
      else begin
        DecodeBuffer (body, @cu, sizeof(TClientItem));
        DelItemBag (cu.S.Name, cu.MakeIndex);
        for i:=0 to MAXUSEITEM do begin     //¾ÆÀÌÅÛ °¹¼ö
           if (g_UseItems[i].S.Name = cu.S.Name) and (g_UseItems[i].MakeIndex = cu.MakeIndex) then begin
              g_UseItems[i].S.Name := '';
           end;
        end;
      end;
   end;
end;

procedure TfrmMain.ClientGetDelItems (body: string);   //Àç·Ã
var
   i, iindex: integer;
   str, iname: string;
begin
   body := DecodeString (body);
   while body <> '' do begin
      body := GetValidStr3 (body, iname, ['/']);
      body := GetValidStr3 (body, str, ['/']);
      if (iname <> '') and (str <> '') then begin
         iindex := Str_ToInt(str, 0);
         DelItemBag (iname, iindex);
         DelUpwaItemBag (iname, iindex);    //Àç·Ã
         for i:=0 to MAXUSEITEM do begin       //¾ÆÀÌÅÛ °¹¼ö
            if (g_UseItems[i].S.Name = iname) and (g_UseItems[i].MakeIndex = iindex) then begin
               g_UseItems[i].S.Name := '';
            end;
         end;
      end else
         break;
   end;
end;


procedure TfrmMain.ClientGetBagItmes (body: string);  //°¡¹æ
var
   str: string;
   cu: TClientItem;

   ItemSaveArr: array[0..MAXBAGITEMCL-1] of TClientItem;

   function CompareItemArr: Boolean;
   var
      i, j: integer;
      flag: Boolean;
   begin
      flag := TRUE;
      for i:=0 to MAXBAGITEMCL-1 do begin
         if ItemSaveArr[i].S.Name <> '' then begin
            flag := FALSE;
            for j:=0 to MAXBAGITEMCL-1 do begin
               if (g_ItemArr[j].S.Name = ItemSaveArr[i].S.Name) and
                  (g_ItemArr[j].MakeIndex = ItemSaveArr[i].MakeIndex) then begin
                  if (g_ItemArr[j].Dura = ItemSaveArr[i].Dura) and
                     (g_ItemArr[j].DuraMax = ItemSaveArr[i].DuraMax){ and
                     (g_ItemArr[j].Amount = ItemSaveArr[i].Amount)} then begin
                     flag := TRUE;
                  end;
                  break;
               end;
            end;
            if not flag then break;
         end;
      end;
      if flag then begin
         for i:=0 to MAXBAGITEMCL-1 do begin
            if g_ItemArr[i].S.Name <> '' then begin
               flag := FALSE;
               for j:=0 to MAXBAGITEMCL-1 do begin
                  if (g_ItemArr[i].S.Name = ItemSaveArr[j].S.Name) and
                     (g_ItemArr[i].MakeIndex = ItemSaveArr[j].MakeIndex) then begin
                     if (g_ItemArr[i].Dura = ItemSaveArr[j].Dura) and
                        (g_ItemArr[i].DuraMax = ItemSaveArr[j].DuraMax) {and
                        (g_ItemArr[i].Amount = ItemSaveArr[j].Amount) }then begin
                        flag := TRUE;
                     end;
                     break;
                  end;
               end;
               if not flag then break;
            end;
         end;
      end;
      Result := flag;
   end;

begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TClientItem));
      AddItemBag (cu);
   end;

   FillChar (ItemSaveArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);
   Loadbags (CharName + '.itm', @ItemSaveArr);  //°¡¹æÀúÀå
   if CompareItemArr then begin
      Move (ItemSaveArr, g_ItemArr, sizeof(TClientItem) * MAXBAGITEMCL);
   end;
   ArrangeItembag;
   g_boBagLoaded := TRUE;     //°¡¹æÀúÀå
end;


procedure TfrmMain.ClientGetStoreItems (body: string);      //¿©°ü
var
  str: string;
  cu: TClientItem;
begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TClientItem));
      AddItemStore (cu);
   end;
end;

procedure TfrmMain.ClientGetHeroStoreItems (body: string);      //¿©°ü
var
  str: string;
  cu: TClientItem;
begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TClientItem));
      AddItemHeroStore (cu);
   end;
end;

procedure TfrmMain.ClientRentalItems (body: string); //´ë¿©
var
   str: string;
   cu: TRentalItem;
begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TRentalItem));
      g_RentalItem := cu;
   end;
   if FrmDlg.DRentalDlg.Visible = false then
     FrmDlg.ToggleRentalDlg;
end;

procedure TfrmMain.ClientOwnerItems (body: string); //´ë¿©
var
   str: string;
   cu: TOwnerItem;
begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TOwnerItem));
      g_OwnerItem := cu;
   end;
   if FrmDlg.DRentalDlg.Visible = false then
     FrmDlg.ToggleRentalDlg2;
end;


procedure TfrmMain.ClientPetInfo (body: string); //¿µ¹°
var
   str: string;
   cu: TPetInfo;
   i: integer;
begin
   i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TPetInfo));
      g_PetInfo[i] := cu;
      inc(i);
   end;
   if g_CheckPetDB then
    g_CheckPetDB := False;
   if FrmDlg.DWinPet.Visible then
    FrmDlg.DPet1Click(FrmDlg.DPet1,1,1);
end;

procedure TfrmMain.ClientAucItems (body: string);    //°æ¸Å
var
   str: string;
   cu: TAucItem;
   AucBuff: pTAucbuffItem;
begin
  //i:= 0;
  // while TRUE do begin
   if body <> '' then begin
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TAucItem));
      g_AucItems := cu;
   end;
  //    inc(i);
//   end;

   New(AucBuff);
   AucBuff.Item := g_AucItems.Item;
   AucBuff.nTime := GetTickCount + 180 * 1000;
   AucBuff.str := g_AucItems.Item.S.Name;
   AucBuff.Price := g_AucItems.Price;
   AucBuff.APrice := 0;
   AucBuff.Solder := '';
   AucBuff.Seller := g_AucItems.Seller;
   g_AucList.Add(AucBuff);

end;

procedure TfrmMain.ClientAuctionItems (body: string);
var
   str: string;
   cu: TAuctionItem;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TAuctionItem));
      g_AuctionItems[i] := cu;
      inc(i);
   end;
   if Not FrmDlg.DSales.Visible then
     FrmDlg.ToggleAuctionWindow;
end;

procedure TfrmMain.ClientComStorageItems (body: string); //°ø¿ëÃ¢°í
var
   str: string;
   cu: TComStorageItem;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TComStorageItem));
      g_ComStorageItem[i] := cu;
      inc(i);
   end;
   if FrmDlg.DComStorage.Visible = false then
     FrmDlg.ToggleComStorageWindow;
end;

procedure TfrmMain.ClientGuildStorageItems (body: string); //¹®ÆÄÃ¢°í
var
   str: string;
   cu: TGuildStorageItem;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TGuildStorageItem));
      g_GuildStorageItem[i] := cu;
      inc(i);
   end;
   if FrmDlg.DGuildStorage.Visible = false then
     FrmDlg.ToggleGuildStorageWindow;
end;

procedure TfrmMain.ClientGTList (body: string);
var
   str: string;
   cu: TClientGT;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TClientGT));

      g_GTItems[i] := cu;
      inc(i);
   end;
   if FrmDlg.DGTList.Visible = false then
     FrmDlg.ToggleGTListWindow;
end;

procedure TfrmMain.ClientDecoList (body: string);
var
   str: string;
   cu: TDecoItem;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TDecoItem));
      g_DecoItems[i] := cu;
      inc(i);
   end;
   if FrmDlg.DDecoListDlg.Visible = false then
     FrmDlg.ToggleDecoListWindow;
end;

procedure TfrmMain.ClientBBSList (body: string);       //Àå¿ø°Ô½ÃÆÇ
var
   str: string;
   cu: TBBSMSG;
   i: integer;
begin
  i:= 0;
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      DecodeBuffer (str, @cu, sizeof(TBBSMSG));
      g_BBSMsgList[i] := cu;
      inc(i);
   end;
   if FrmDlg.DBBSListDlg.Visible = false then
     FrmDlg.ToggleBBSListWindow;
end;

procedure TfrmMain.ClientBBSMsg (body: string);      //Àå¿ø°Ô½ÃÆÇ
var
   str: string;
begin
  if (body = '') then exit;
  body := GetValidStr3 (body, str, ['/']);
  if (str = '') then exit;
  g_BBSPoster := DecodeString(str);
  body := GetValidStr3 (body, str, ['/']);
  if (str = '') then exit;
  g_BBSMSG := DecodeString(str);
  FrmDlg.ToggleBBSMsgWindow;
end;

procedure TfrmMain.ClientGetDropItemFail (iname: string; sindex: integer);
var
   pc: PTClientItem;
begin
   pc := GetDropItem (iname, sindex);
   if pc <> nil then begin
      AddItemBag (pc^);
      DelDropItem (iname, sindex);
   end;
end;


procedure TfrmMain.ClientGetFriendChange(Msg: pTDefaultMessage; body: string);      //»õ·Î¿îÄ£±¸
var
  i: integer;
  sName, sIndex: string;
begin
  case Msg.Series of
    0: begin
        body := DecodeString(body);
        for I := 0 to g_FriendList.Count - 1 do begin
          if CompareText(g_FriendList[i], body) = 0 then begin
            g_FriendList.Objects[i] := TObject(Msg.Param);
            if msg.Param = 1 then
              DScreen.AddSysMsg('[ºÃÓÑ]<CO$FFFF> ' + body + '<CE> ½øÈëÁËÓÎÏ·¡£', 40, 60, clWhite)
            else
              DScreen.AddSysMsg('[ºÃÓÑ]<CO$FFFF> ' + body + '<CE> ÍË³öÁËÓÎÏ·¡£', 40, 60, clWhite);
            break;
          end;
        end;
      end;
    1: begin     //Ä£±¸Ã¢ »õ·Î°íÄ§
        g_FriendList.Clear;
        body := DecodeString(body);
        while True do begin
          if body = '' then
            break;
          body := GetValidStr3(body, sName, ['/']);
          body := GetValidStr3(body, sIndex, ['/']);
          if (sName <> '') and (sIndex <> '') then begin
            if sIndex = '1' then
              g_FriendList.AddObject(sName, TObject(1))
            else
              g_FriendList.AddObject(sName, nil);
          end;
        end;
      end;
    2: begin
        g_FriendList.AddObject(DecodeString(body), TObject(1));
      end;
    3: begin
        body := DecodeString(body);
        for I := 0 to g_FriendList.Count - 1 do begin
          if CompareText(g_FriendList[i], body) = 0 then begin
            DScreen.AddSysMsg('[ºÃÓÑ]<CO$FFFF> ' + body + '<CE> ÒÑ´ÓºÃÓÑÁÐ±íÖÐÉ¾³ý¡£', 40, 60, $32F4);
            g_FriendList.Delete(i);
            break;
          end;
        end;
      end;
  end;
end;

procedure TfrmMain.ClientGetShowItem (itemid, x, y, looks: integer; body: string);
var
  I:Integer;
  DropItem:PTDropItem;
  itmname, sOp, sDeco: String;
begin
  for i:=0 to g_DropedItemList.Count-1 do begin
    if PTDropItem(g_DropedItemList[i]).Id = itemid then
      exit;
  end;
  New(DropItem);
  DropItem.Id := itemid;
  DropItem.X := x;
  DropItem.Y := y;
  DropItem.Looks := looks;
  sDeco := '0';
  sOp := '0';
  if body <> '' then begin
    body := GetValidStr3 (body, itmname, ['/']);
    body := GetValidStr3 (body, sOp, ['/']);
    body := GetValidStr3 (body, sDeco, ['/']);
  end;
  DropItem.Name := itmname;
  DropItem.Grade := StrToInt(Trim(sOp));
  if Str_ToInt (sDeco, 0) = 0 then DropItem.BoDeco := False
  else DropItem.BoDeco := True;

  DropItem.FlashTime := GetTickCount - LongWord(Random(3000));
  DropItem.BoFlash := FALSE;
  g_DropedItemList.Add(DropItem);
end;

procedure TfrmMain.ClientGetHideItem (itemid, x, y: integer);
var
  I:Integer;
  DropItem:PTDropItem;
begin
  for I:=0 to g_DropedItemList.Count - 1 do begin
    DropItem:=g_DropedItemList[I];
    if DropItem.Id = itemid then begin
      Dispose (DropItem);
      g_DropedItemList.Delete(I);
      break;
    end;
  end;
end;

procedure TfrmMain.ClientGetSendAddUseItems (body: string);
var
   index: integer;
   str, data: string;
   cu: TClientItem;
begin
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      body := GetValidStr3 (body, data, ['/']);
      index := Str_ToInt (str, -1);
      if index in [9..12] then begin
         DecodeBuffer (data, @cu, sizeof(TClientItem));
         g_UseItems[index] := cu;
      end;
   end;
end;
procedure TfrmMain.ClientGetSenduseItems (body: string);
var
   index: integer;
   str, data: string;
   cu: TClientItem;
begin
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);  //¾ÆÀÌÅÛ °¹¼ö

   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      body := GetValidStr3 (body, data, ['/']);
      index := Str_ToInt (str, -1);
      if index in [0..MAXUSEITEM] then begin     //¾ÆÀÌÅÛ °¹¼ö
         DecodeBuffer (data, @cu, sizeof(TClientItem));
         g_UseItems[index] := cu;
      end;
   end;
end;

procedure TfrmMain.ClientGetAddMagic (body: string);
var
   pcm: PTClientMagic;
begin
   new (pcm);
   DecodeBuffer (body, @(pcm^), sizeof(TClientMagic));
   g_MagicList.Add (pcm);
end;

procedure TfrmMain.ClientGetDelMagic (magid: integer);
var
   i: integer;
begin
   for i:=g_MagicList.Count-1 downto 0 do begin
      if PTClientMagic(g_MagicList[i]).Def.wMagicId = magid then begin
         Dispose (PTClientMagic(g_MagicList[i]));
         g_MagicList.Delete (i);
         break;
      end;
   end;
end;

procedure TfrmMain.ClientGetMyMagics (body: string);
var
   i: integer;
   data: string;
   pcm: PTClientMagic;
begin
   for i:=0 to g_MagicList.Count-1 do
      Dispose (PTClientMagic (g_MagicList[i]));
   g_MagicList.Clear;        //¹«°ø »ç¶óÁö´Â ¹ö±×
   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, data, ['/']);
      if data <> '' then begin
         new (pcm);
         DecodeBuffer (data, @(pcm^), sizeof(TClientMagic));
         g_MagicList.Add (pcm);
      end else
         break;
   end;
end;

procedure TfrmMain.ClientGetMagicLvExp (magid, maglv, magtrain: integer);
var
   i: integer;
begin
   for i:=g_MagicList.Count-1 downto 0 do begin
      if PTClientMagic(g_MagicList[i]).Def.wMagicId = magid then begin
         PTClientMagic(g_MagicList[i]).Level := maglv;
         PTClientMagic(g_MagicList[i]).CurTrain := magtrain;
         break;
      end;
   end;
end;

procedure TFrmMain.ClientGetSound( soundid: integer);
begin
   SilenceSound;
    if soundid <> 0 then
    begin
        PlaySound( soundid );
    end
end;

procedure TfrmMain.ClientGetDuraChange (uidx, newdura, newduramax: integer);
begin
   if uidx in [0..MAXUSEITEM] then begin    //¾ÆÀÌÅÛ °¹¼ö
      if g_UseItems[uidx].S.Name <> '' then begin
        if newdura < 0 then begin
          g_UseItems[uidx].Dura :=0;
        end else
         g_UseItems[uidx].Dura := newdura;
        g_UseItems[uidx].DuraMax := newduramax;
      end;
   end;
end;

procedure TfrmMain.ClientGetMerchantSay (merchant, face: integer; saying: string);
var
   npcname: string;
begin
   g_nMDlgX := g_MySelf.m_nCurrX;
   g_nMDlgY := g_MySelf.m_nCurrY;
   if g_nCurMerchant <> merchant then begin
      g_nCurMerchant := merchant;
      FrmDlg.ResetMenuDlg;
      FrmDlg.CloseMDlg;
   end;
//   ShowMessage(saying);
   saying := GetValidStr3 (saying, npcname, ['/']);
   FrmDlg.ShowMDlg (face, npcname, saying);
end;

procedure TfrmMain.ClientGetSendGoodsList (merchant, count: integer; body: string); //»óÀÎ
var  //NPCÎïÆ·Ò»¼¶ÁÐ±í
   data: string;
   pcg: PTClientGoods;
   pc:SBuyItem;
begin
      while TRUE do begin
       if body = '' then break;
       body := GetValidStr3 (body, data, ['/']);
       DecodeBuffer (data, @pc, sizeof(SBuyItem));
       AddBuyItemBag(pc);
       new (pcg);
       pcg.Name := pc.entItem.S.Name;
       pcg.Price := pc.Price;
       pcg.Stock := pc.Stock;
       pcg.Looks := pc.entItem.S.Looks;
       pcg.Amount := pc.entItem.Amount;     //¹°¾à
       pcg.modes :=  pc.entItem.S.StdMode;
       pcg.Grade := -1;
       FrmDlg.MenuList.Add (pcg);
      end;
      if Count = 1 then FrmDlg.BoPCItemMenu := TRUE
      else FrmDlg.BoPCItemMenu := FALSE;
      FrmDlg.ShowNewShopMenuDlg;
      FrmDlg.CurDetailItem := '';
      g_dddtypemode := False;
end;

procedure TfrmMain.ClientGetSendMakeItemList (merchant, count: integer; body: string); //»óÀÎ
var  //NPCÎïÆ·Ò»¼¶ÁÐ±í
   data: string;
   pcg: PTClientGoods;
   pc:SBuyItem;
begin
      while TRUE do begin
       if body = '' then break;
       body := GetValidStr3 (body, data, ['/']);
       DecodeBuffer (data, @pc, sizeof(SBuyItem));
       AddBuyItemBag(pc);
       new (pcg);
       pcg.Name := pc.entItem.S.Name;
       pcg.Price := pc.Price;
       pcg.Stock := pc.Stock;
       pcg.Looks := pc.entItem.S.Looks;
       pcg.Amount := pc.entItem.Amount;     //¹°¾à
       pcg.modes :=  pc.entItem.S.StdMode;
       pcg.Grade := -1;
       FrmDlg.MenuList.Add (pcg);
      end;
      FrmDlg.BoMakeItemMenu := True;
      FrmDlg.ShowNewShopMenuDlg;
      FrmDlg.CurDetailItem := '';
      g_dddtypemode := False;
end;


procedure TfrmMain.ClientGetSendUserSell (merchant: integer);
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmSell;
   FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendUserWake(merchant: Integer);
begin
  FrmDlg.CloseDSellDlg;
  g_nCurMerchant := merchant;
  FrmDlg.SpotDlgMode := dmWakeCancel;
  FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendUserReStore(merchant: Integer);
begin
  FrmDlg.CloseDSellDlg;
  g_nCurMerchant := merchant;
  FrmDlg.SpotDlgMode := dmReStore;
  FrmDlg.ShowShopSellDlg;
end;


procedure TfrmMain.ClientGetSendItemLock(merchant: Integer);        //ºÀÀÎ
begin
  FrmDlg.CloseDSellDlg;
  g_nCurMerchant := merchant;
  FrmDlg.SpotDlgMode := dmLock;
  FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientObjItemLockOK(DefMsg: pTDefaultMessage; sDate: string);
begin
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    FrmDlg.LastestClickTime := GetTickCount;
    g_MySelf.m_nGold := DefMsg.Recog;
    g_SellDlgItemSellWait.S.btValue[19] := DefMsg.Param;
    g_SellDlgItemSellWait.S.MaxDate := StrToInt(sDate);

    AddItemBag(g_SellDlgItemSellWait);
    g_SellDlgItemSellWait.S.Name := '';
  end;
end;

procedure TfrmMain.ClientObjItemLockFail(DefMsg: pTDefaultMessage);
begin
  FrmDlg.LastestClickTime := GetTickCount;
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    AddItemBag(g_SellDlgItemSellWait);
  end;
  g_SellDlgItemSellWait.S.Name := '';
  if DefMsg.Recog > 0 then
   FrmDlg.DMessageDlg('½ð±Ò²»×ã¡£', [mbOk])
  else
  FrmDlg.DMessageDlg('´ËÎïÆ·²»ÄÜ·âÓ¡¡£', [mbOk]);
end;


procedure TfrmMain.ClientObjWakeCost(nGold: Integer);
begin
  if g_SellDlgItem.S.Name <> '' then begin
    if nGold >= 0 then
      g_sSellPriceStr := IntToStr(nGold) + ' ' + g_sGoldName
    else g_sSellPriceStr := '???? ' + g_sGoldName;
  end;
end;

procedure TfrmMain.ClientObjItemWakeOK(DefMsg: pTDefaultMessage; sDate: string);
begin
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    FrmDlg.LastestClickTime := GetTickCount;
    g_MySelf.m_nGold := DefMsg.Recog;
    SoundUtil.PlaySound(s_money);
    g_SellDlgItemSellWait.S.btValue[12 + g_SellDlgItemSellWait.S.btValue[18]] := 0;
    g_SellDlgItemSellWait.S.btValue[18] := g_SellDlgItemSellWait.S.btValue[18] - 1;
    if g_SellDlgItemSellWait.S.btValue[18] = 0 then
     g_SellDlgItemSellWait.S.btValue[12] := 0;
    AddItemBag(g_SellDlgItemSellWait);
    g_SellDlgItemSellWait.S.Name := '';
  end;
end;

procedure TfrmMain.ClientObjItemWakeFail(DefMsg: pTDefaultMessage);
begin
  FrmDlg.LastestClickTime := GetTickCount;
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    AddItemBag(g_SellDlgItemSellWait);
  end;
  g_SellDlgItemSellWait.S.Name := '';
  if DefMsg.Recog = 1 then begin
    FrmDlg.DMessageDlg('½ð±Ò²»×ã¡£', [mbOk]);
  end else
  FrmDlg.DMessageDlg('´ËÎïÆ·ÎÞ·¨È¡Ïû¾õÐÑ¡£', [mbOk]);
end;


procedure TfrmMain.ClientObjReStoreCost(nGold: Integer);
begin
  if g_SellDlgItem.S.Name <> '' then begin
    if nGold >= 0 then
      g_sSellPriceStr := IntToStr(nGold) + ' ' + g_sGoldName
    else g_sSellPriceStr := '???? ' + g_sGoldName;
  end;
end;

procedure TfrmMain.ClientObjItemReStoreOK(DefMsg: pTDefaultMessage; sDate: string);
begin
  if sDate <> '' then begin
    DecodeBuffer(sDate, @g_SellDlgItemSellWait, SizeOf(TClientItem));
  end;
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    FrmDlg.LastestClickTime := GetTickCount;
    g_MySelf.m_nGold := DefMsg.Recog;
    SoundUtil.PlaySound(s_money);
    AddItemBag(g_SellDlgItemSellWait);
    g_SellDlgItemSellWait.S.Name := '';

  end;
end;

procedure TfrmMain.ClientObjItemReStoreFail(DefMsg: pTDefaultMessage);
begin
  FrmDlg.LastestClickTime := GetTickCount;
  if g_SellDlgItemSellWait.S.Name <> '' then begin
    AddItemBag(g_SellDlgItemSellWait);
  end;
  g_SellDlgItemSellWait.S.Name := '';
  if DefMsg.Recog = 1 then begin
    FrmDlg.DMessageDlg('½ð±Ò²»×ã¡£', [mbOk]);
  end else
  FrmDlg.DMessageDlg('´ËÎïÆ·²»ÄÜ»Ö¸´¡£', [mbOk]);
end;

procedure TfrmMain.ClientObjStoragePWFail(DefMsg: pTDefaultMessage);
begin
  if DefMsg.Ident = SM_STORAGEPW_FAIL then begin
    FrmDlg.DMessageDlg('ÃÜÂë´íÎó¡£', [mbOk]);
  end else begin
    if FrmDlg.DStoragePWDlg.Visible then FrmDlg.DStPWCloseClick(Nil, 0, 0);
    FrmDlg.DCloseChPwClick(Nil, 0, 0);
  end;
end;

procedure TfrmMain.ClientObjStorageCheck(DefMsg: pTDefaultMessage);
begin
  if DefMsg.Recog = 1 then begin
    FrmDlg.ShowScStoragePW;
  end else begin
    ClientStorageSetPassWord();
  end;
end;

procedure TfrmMain.ClientGetSendUserRepair (merchant: integer);
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmRepair;
   FrmDlg.ShowShopSellDlg;
end;
//±£´æÎïÆ·µ½²Ö¿â
procedure TfrmMain.ClientGetSendUserStorage (merchant, mode: integer);
begin
   FrmDlg.CloseDSellDlg;
   if mode = 0 then begin
     g_nCurMerchant := merchant;
     m_nStorageMode := 0;
   end else begin
     g_nCurMerchant := 0;
     m_nStorageMode := mode;
   end;
   FrmDlg.SpotDlgMode := dmStorage;
   FrmDlg.ShowStoreDlg;
end;

procedure TfrmMain.ClientGetSendComStorage (merchant: integer);   //°ø¿ëÃ¢°í
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmComStorage;
   FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendGuildStorage (merchant: integer);   //¹®ÆÄÃ¢°í
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmGuildStorage;
   FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendUserDisassemble (merchant: integer);  //°¢¼ººÐÇØ
begin
   FrmDlg.CloseDisassembleDlg;
   g_nCurMerchant := merchant;
   FrmDlg.ShowDisassembleDlg;
end;

procedure TfrmMain.ClientGetSendUserDismantle (merchant: integer);     //ÀÏ¹ÝºÐÇØ
begin
   FrmDlg.CloseDismantleDlg;
   g_nCurMerchant := merchant;
   FrmDlg.ShowDismantleDlg;
end;



procedure TfrmMain.ClientShowChangeItem;  //º¯È¯
begin
  FrmDlg.DItemBag.Visible := True;
  FrmDlg.DItemBag.Top := 0;
  FrmDlg.DItemBag.Left := 0;
  FrmDlg.DChangeItem.Visible := True;
end;


procedure TfrmMain.ClientObjGetGuild(Msg: pTDefaultMessage); //¹®ÆÄ ¸¶Å©
var
  Actor: TActor;
begin
  if Msg.Recog = g_MySelf.m_nRecogId then begin
    g_MySelf.m_btGuildMark := Msg.param;
    g_MySelf.m_btColumn := Msg.Tag;       //È«º¸´Ü
    g_MySelf.m_btJob := Msg.Series;
   // g_MySelf.FeatureChanged;
  end else begin
    Actor := PlayScene.FindActor(Msg.Recog);
    if (Actor <> nil) and (Actor is THumActor) then begin
      THumActor(Actor).m_btGuildMark := Msg.param;
      THumActor(Actor).m_btColumn := Msg.Tag;  //È«º¸´Ü
      THumActor(Actor).m_btJob := Msg.Series;
    //  THumActor(Actor).FeatureChanged;
    end;
  end;
end;

procedure TfrmMain.ClientObjGetMask(Msg: pTDefaultMessage; Eff:string);   //º¯½ÅÅ»  ±âÆÛÁü  »©»©·Î
var
  Actor: TActor;
begin
  if Msg.Recog = g_MySelf.m_nRecogId then begin
    g_MySelf.m_btMask := Msg.param;
    if Msg.Param > 0 then g_MaskRun := True
      else g_MaskRun := False;
    g_MySelf.m_btHumEffect := Msg.Tag;
    g_MySelf.m_btEventEffect := Msg.Series;
    g_MySelf.m_WEffect := StrToInt(Eff);
   // g_MySelf.FeatureChanged;
  end else begin
    Actor := PlayScene.FindActor(Msg.Recog);
    if (Actor <> nil) and (Actor is THumActor) then begin
      THumActor(Actor).m_btMask := Msg.param;
      THumActor(Actor).m_btHumEffect := Msg.Tag;
      THumActor(Actor).m_btEventEffect := Msg.Series;
      THumActor(Actor).m_WEffect := StrToInt(Eff);
   //   THumActor(Actor).FeatureChanged;
    end;
  end;
end;


procedure TfrmMain.ClientGetCompoundInfos(body: string);
var
  i: Integer;
  sMsg, sItemName: string;
  pCompoundInfos: pTCompoundInfos;
begin
  for i := 0 to g_CompoundInfoList.Count - 1 do
    Dispose(pTCompoundInfos(g_CompoundInfoList.Objects[i]));
  g_CompoundInfoList.Clear;
  body := GetValidStr3(body, sMsg, ['/']);
  DecodeBuffer(sMsg, PAnsiChar(@g_CompoundSet), SizeOf(TCompoundSet));
  while body <> '' do begin
    body := GetValidStr3(body, sItemName, ['/']);
    body := GetValidStr3(body, sMsg, ['/']);
    sItemName := DecodeString(sItemName);
    if (sItemName = '') or (sMsg = '') then
      Continue;
    New(pCompoundInfos);
    ZeroMemory(pCompoundInfos, SizeOf(TCompoundInfos));
    DecodeBuffer(sMsg, PAnsiChar(pCompoundInfos), SizeOf(TCompoundInfos));
    g_CompoundInfoList.AddObject(sItemName, TObject(pCompoundInfos));
  end;
end;

procedure TfrmMain.ClientGetSendNotice (body: string);
var
  MissionMD5: string;
begin
   MissionMD5 := GetMD5TextByBuffer(g_MissionDateStream.Memory, g_MissionDateStream.Size) + #9;
   MissionMD5 := MissionMD5 + GetMD5TextByBuffer(g_MapDescDateStream.Memory, g_MapDescDateStream.Size) + #9;
   SendClientMessage(CM_LOGINNOTICEOK_EX, 0, 0, 0, 0, MissionMD5);
end;


procedure TfrmMain.ClientGetDataFile(Msg: TDefaultMessage; bodystr: string);
  procedure Decompress(nIndex: Integer; Buffer: PChar; BufferLen: Integer);
  var
    OutLen: Integer;
    OutBuffer: PChar;
    LoadList: TStringList;
    MemoryStream: TMemoryStream;
  begin
    if BufferLen <= 0 then Exit;
    OutLen := ZIPDecompress(Buffer, BufferLen, 0, OutBuffer);
    if (OutLen > 0) then begin
      MemoryStream := TMemoryStream.Create;
      MemoryStream.Write(OutBuffer^, OutLen);
      MemoryStream.Position := 0;
      case nIndex of
        1: begin
            LoadList := TStringList.Create;
            LoadList.LoadFromStream(MemoryStream);
            LoadMissionList(LoadList);
            LoadList.Free;
          end;
        4: begin
            LoadList := TStringList.Create;
            LoadList.LoadFromStream(MemoryStream);
            LoadMapDescList(LoadList);
            LoadList.Free;
          end;
      end;
      MemoryStream.Free;
      FreeMem(OutBuffer);
    end;
  end;
var
  MemoryStream: TMemoryStream;
begin
  case Msg.Series of
    0: begin
        if not g_boAllLoadStream then begin
          Decompress(1, g_MissionDateStream.Memory, g_MissionDateStream.Size);
          Decompress(4, g_MapDescDateStream.Memory, g_MapDescDateStream.Size);
        end;
        g_boAllLoadStream := True;
        SendClientMessage(CM_LOGINNOTICEOK, 0, 0, 0, 0);
      end;
    1..5: begin
        case Msg.Series of
            1: MemoryStream := g_MissionDateStream;
            4: MemoryStream := g_MapDescDateStream;
          else MemoryStream := nil;
        end;
        if Msg.Recog > 0 then begin
          MemoryStream.Size := Msg.Recog;
          DecodeLongBuffer(bodystr, MemoryStream.Memory, Msg.Recog);
          if g_boAllLoadStream then Decompress(Msg.Series, MemoryStream.Memory, Msg.Recog);
        end else begin
          MemoryStream.Clear;
        end;
      end;
  end;
end;

procedure TfrmMain.ClientGetCheckMsg(Msg: pTDefaultMessage; bodystr: string);
var
  ClientCheckMsg: pTClientCheckMsg;
begin
  New(ClientCheckMsg);
  ClientCheckMsg.str := bodystr;
  ClientCheckMsg.EndTime := GetTickCount + msg.Param * 1000;
  ClientCheckMsg.MsgIndex := msg.Recog;
  ClientCheckMsg.MsgType := TCheckMsgClass(msg.Series);
  ClientCheckMsg.ShowTime := GetTickCount;
  g_QuestMsgList.Add(ClientCheckMsg);
  FrmDlg.RefCheckButtonXY;
end;

procedure TfrmMain.ClientGetAddMembers(Msg: pTDefaultMessage; bodystr: string);
var
  ClientGroup: TClientGroup;
  GroupMember: pTGroupMember;
  i: Integer;
  actor: TActor;
begin
  try
      for i := 0 to GroupIdList.Count-1 do begin
          actor := PlayScene.FindActor (integer(GroupIdList[i]));
          if actor <> nil then actor.m_BoOpenHealth := False;
      end;
      GroupIdList.Clear; // MonOpenHp
  except
  end;
  DecodeBuffer(bodystr, @ClientGroup, SizeOf(ClientGroup));
  New(GroupMember);
  GroupMember.ClientGroup := ClientGroup;
  GroupMember.isScreen := nil;
  g_MemberGroup.Add(GroupMember);
  FrmDlg.m_boChangeGroup := True;
  FrmDlg.SetGroupWnd();
  PlayScene.SetMembersGroup(GroupMember, True);
  DScreen.AddSysMsg('[<CO$FFFF>' + GroupMember.ClientGroup.UserName + '<CE>] ¼ÓÈëÁË¶ÓÎé¡£', 40, 60, clWhite);
end;

procedure TfrmMain.ClientGetDelMembers(Msg: pTDefaultMessage; bodystr: string);
var
  i: Integer;
  actor: TActor;
  GroupMember: pTGroupMember;
begin
  try
      for i := 0 to GroupIdList.Count-1 do begin
          actor := PlayScene.FindActor (integer(GroupIdList[i]));
          if actor <> nil then actor.m_BoOpenHealth := False;
      end;
      GroupIdList.Clear; // MonOpenHp
  except
  end;
  for i := 0 to g_MemberGroup.Count - 1 do begin
    GroupMember := g_MemberGroup[i];
    if GroupMember.ClientGroup.UserID = Msg.Recog then begin
      g_MemberGroup.Delete(i);
      PlayScene.SetMembersGroup(GroupMember, False);
      DScreen.AddSysMsg('[<CO$FFFF>' + GroupMember.ClientGroup.UserName + '<CE>] ÍË³öÁË¶ÓÎé¡£', 40, 60, clWhite);
      Dispose(GroupMember);
      FrmDlg.m_boChangeGroup := True;
      FrmDlg.SetGroupWnd();
      Break;
    end;
  end;
end;

procedure TfrmMain.ClientGetGroupInfo(Msg: TDefaultMessage; bodystr: string);
var
  GroupMember: pTGroupMember;
  i: Integer;
begin
  for i := 0 to g_MemberGroup.Count do begin
    GroupMember := g_MemberGroup.Items[i];
    if GroupMember.ClientGroup.UserID = Msg.Recog then begin
      if Msg.Ident = SM_GROUPINFO1 then begin
        GroupMember.ClientGroup.HP := Msg.Param;
        GroupMember.ClientGroup.MP := Msg.tag;
        GroupMember.ClientGroup.MaxHP := Msg.Series;
        GroupMember.ClientGroup.MaxMP := StrToIntDef(bodystr, GroupMember.ClientGroup.MaxMP);
        if (GroupMember.isScreen <> nil) and (TActor(GroupMember.isScreen).m_Group = GroupMember) then begin
          TActor(GroupMember.isScreen).m_Abil.HP := Msg.Param;
          TActor(GroupMember.isScreen).m_Abil.MaxHP := Msg.Series;
        end;

      end
      else if Msg.Ident = SM_GROUPINFO2 then begin
        GroupMember.ClientGroup.Level := msg.Param;
        GroupMember.ClientGroup.MaxMP := msg.Series;
      end;
      Break;
    end;
  end;
end;

procedure TfrmMain.ClientGetGroupMembers (Msg: TDefaultMessage; bodystr: string);     //±×·ì Ã¼·Â
resourcestring
  ItemClass1 = ' <CO$F0CAA6>ÎïÆ··ÖÅä·½Ê½<CE> [<CO$FF> Ëæ»ú <CE>] ::';
  ItemClass2 = ' <CO$F0CAA6>ÎïÆ··ÖÅä·½Ê½<CE> [<CO$FFFF> ×ÔÓÉ <CE>] ::';
  Hero1 = ' <CO$FF00>ÕÙ»½Ó¢ÐÛ<CE> [<CO$FF> ÊÕ»Ø <CE>]';
  Hero2 = ' <CO$FF00>ÕÙ»½Ó¢ÐÛ<CE> [<CO$FFFF> ÕÙ»½ <CE>]';
var
   memb, addname: string;
   actor: TActor;
   i : integer;
   ClientGroup: TClientGroup;
   GroupMember: pTGroupMember;
begin
   ClearGroupMember();
   g_GroupItemMode := ByteToBool(msg.Recog);
   g_boCheckHero := ByteToBool(msg.Param);
   try
      for i := 0 to GroupIdList.Count-1 do begin
          actor := PlayScene.FindActor (integer(GroupIdList[i]));
          if actor <> nil then actor.m_BoOpenHealth := False;
      end;
      GroupIdList.Clear; // MonOpenHp
   except
   end;
   addname := '';
   while TRUE do begin
      if bodystr = '' then break;
      bodystr := GetValidStr3(bodystr, memb, ['/']);
      if memb <> '' then begin
        DecodeBuffer(memb, @ClientGroup, SizeOf(ClientGroup));
        New(GroupMember);
        GroupMember.ClientGroup := ClientGroup;
        GroupMember.isScreen := nil;
        g_MemberGroup.Add(GroupMember);
        if addname = '' then
          addname := ClientGroup.UserName;
      end else
         break;
   end;

   PlayScene.SetMembersGroup(g_MemberGroup);
   FrmDlg.m_boChangeGroup := True;
   FrmDlg.SetGroupWnd();
   if g_MemberGroup.Count > 1 then
     memb := '[<CO$FFFF>' + addname + '<CE>] ¼ÓÈëÁË¶ÓÎé¡£'
   else
     memb := '¶ÓÎé´´½¨³É¹¦¡£';
   if g_GroupItemMode then
    memb := memb + ItemClass1
   else
    memb := memb + ItemClass2;
   if g_boCheckHero then
    DScreen.AddSysMsg(memb + Hero1, 40, 60, clWhite)
   else
    DScreen.AddSysMsg(memb + Hero2, 40, 60, clWhite);
end;

procedure TfrmMain.ClientGetOpenGuildDlg (mode: Integer; bodystr: string);
var
   str, data, linestr, s1: string;
   pstep: integer;
begin
   if g_boShowMemoLog then PlayScene.MemoLog.Lines.Add('ClientGetOpenGuildDlg');

   str := DecodeString (bodystr);
   str := GetValidStr3 (str, FrmDlg.Guild, [#13]);
   str := GetValidStr3 (str, FrmDlg.GuildFlag, [#13]);
   str := GetValidStr3 (str, data, [#13]);
   if data = '1' then FrmDlg.GuildCommanderMode := TRUE
   else FrmDlg.GuildCommanderMode := FALSE;

   FrmDlg.GuildStrs.Clear;
   FrmDlg.GuildNotice.Clear;
   pstep := 0;
   while TRUE do begin
      if str = '' then break;
      str := GetValidStr3 (str, data, [#13]);
      if data = '<ÐÐ»á¹«¸æ>' then begin
         FrmDlg.GuildStrs.AddObject (char(7) + 'ÐÐ»á¹«¸æ', TObject(clWhite));
         FrmDlg.GuildStrs.Add (' ');
         pstep := 1;
         continue;
      end;
      if data = '<µÐ¶ÔÐÐ»á>' then begin
         FrmDlg.GuildStrs.Add (' ');
         FrmDlg.GuildStrs.AddObject (char(7) + 'µÐ¶ÔÐÐ»á', TObject(clWhite));
         FrmDlg.GuildStrs.Add (' ');
         pstep := 2;
         linestr := '';
         continue;
      end;
      if data = '<ÁªÃËÐÐ»á>' then begin
         if linestr <> '' then FrmDlg.GuildStrs.Add (linestr);
         linestr := '';
         FrmDlg.GuildStrs.Add (' ');
         FrmDlg.GuildStrs.AddObject (char(7) + 'ÁªÃËÐÐ»á', TObject(clWhite));
         FrmDlg.GuildStrs.Add (' ');
         pstep := 3;
         continue;
      end;

      if pstep = 1 then
         FrmDlg.GuildNotice.Add (data);

      if data <> '' then begin
         if data[1] = '<' then begin
            ArrestStringEx (data, '<', '>', s1);
            if s1 <> '' then begin
               FrmDlg.GuildStrs.Add (' ');
               FrmDlg.GuildStrs.AddObject (char(7) + s1, TObject(clWhite));
               FrmDlg.GuildStrs.Add (' ');
               continue;
            end;
         end;
      end;
      if (pstep = 2) or (pstep = 3) then begin
         if Length(linestr) > 80 then begin
            FrmDlg.GuildStrs.Add (linestr);
            linestr := '';
            linestr := linestr + fmstr (data, 18);
         end else begin
            linestr := linestr + fmstr (data, 18);
         end;
         continue;
      end;

      FrmDlg.GuildStrs.Add (data);
   end;

   if linestr <> '' then FrmDlg.GuildStrs.Add (linestr);
   FrmDlg.GuildMode := mode;
   FrmDlg.ShowGuildDlg;
end;

procedure TfrmMain.ClientGetSendGuildMemberList (body: string);
var
   str, data, rankname, members: string;
   rank: integer;
begin
   str := DecodeString (body);
   FrmDlg.GuildStrs.Clear;
   FrmDlg.GuildMembers.Clear;
   rank := 0;
   while TRUE do begin
      if str = '' then break;
      str := GetValidStr3 (str, data, ['/']);
      if data <> '' then begin
         if data[1] = '#' then begin
            rank := Str_ToInt (Copy(data, 2, Length(data)-1), 0);
            continue;
         end;
         if data[1] = '*' then begin
            if members <> '' then FrmDlg.GuildStrs.Add (members);
            rankname := Copy(data, 2, Length(data)-1);
            members := '';
            FrmDlg.GuildStrs.Add (' ');
            if FrmDlg.GuildCommanderMode then
               FrmDlg.GuildStrs.AddObject (fmStr('(' + IntToStr(rank) + ')', 3) + '<' + rankname + '>', TObject(clWhite))
            else
               FrmDlg.GuildStrs.AddObject ('<' + rankname + '>', TObject(clWhite));
            FrmDlg.GuildMembers.Add ('#' + IntToStr(rank) + ' <' + rankname + '>');
            continue;
         end;
         if Length (members) > 80 then begin
            FrmDlg.GuildStrs.Add (members);
            members := '';
         end;
         members := members + FmStr(data, 18);
         FrmDlg.GuildMembers.Add (data);
      end;
   end;
   if members <> '' then
      FrmDlg.GuildStrs.Add (members);
end;

procedure TFrmMain.DelitemProg;
var
cu: TClientItem;
begin
  DelItemBag(cu.S.Name, cu.MakeIndex);
end;

procedure TFrmMain.SendMail (data: string);   //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_ADD, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;

procedure TFrmMain.SendLockMail (Id: integer);     //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 2, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendUnLockMail (Id: integer);      //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 1, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendDelMail (Id: integer);        //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_DELETE, Id, 3, 0, 0);
   SendSocket (EncodeMessage (msg));
end;


procedure TFrmMain.SendReadingMail (Id: integer);  //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 1, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendMailList;      //¸Þ¸ð
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_LIST, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) );
end;

procedure TFrmMain.SendRejectList;           //°ÅºÎÀÚ
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_LIST, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) );
end;

procedure TFrmMain.SendAddReject (data: string );   //°ÅºÎÀÚ µî·Ï
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_ADD, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;

procedure TFrmMain.SendDelReject (data: string);  //°ÅºÎÀÚ »èÁ¦
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_DELETE, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;


procedure TFrmMain.RunEffectTimerTimer(Sender: TObject);    //¸¶·æ¹ø°³
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin

    tx := g_Myself.m_nCurrX;
    ty := g_Myself.m_nCurrY;

    Randomize;
    RunEffectTimer.Tag := RunEffectTimer.Tag + 1;
    n := random(4);
    kx := random(5)+1;
    ky := random(4)+1;
    if RunEffectTimer.Tag > 1000000 then RunEffectTimer.Tag := 1000;

    if EffectNum = 1 then begin
       case random(5)of
          0: RunEffectTimer.Interval := 400;
          1: RunEffectTimer.Interval := 600;
          2: RunEffectTimer.Interval := 800;
          3: RunEffectTimer.Interval := 1000;
          4: RunEffectTimer.Interval := 1500;
       end;

       case n of
          0: if Map.CanMove(tx+kx,ty-ky) then
                PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, tx+kx, ty-ky, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          1: if Map.CanMove(tx-kx,ty+ky) then
                PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, tx-kx, ty+ky, tx-kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          2: if Map.CanMove(tx-kx,ty-ky) then
                PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, tx-kx, ty-ky, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          3: if Map.CanMove(tx+kx,ty+ky) then
                PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, tx+kx, ty+ky, tx+kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
       end;
       PlaySound (8301);

    end
    else if EffectNum = 2 then begin
       case random(RunEffectTimer.Tag) mod 5 of
          0: RunEffectTimer.Interval := 1000;
          1: RunEffectTimer.Interval := 1500;
          2: RunEffectTimer.Interval := 2000;
          3: RunEffectTimer.Interval := 2500;
          4: RunEffectTimer.Interval := 3000;
       end;

       case n of
          0: if Map.CanMove(tx+kx,ty-ky) then begin
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, tx+kx, ty-ky, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, tx+kx, ty-ky, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          end;
          1: if Map.CanMove(tx-kx,ty+ky) then begin
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, tx-kx, ty+ky, tx-kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, tx-kx, ty+ky, tx-kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          end;
          2: if Map.CanMove(tx-kx,ty-ky) then begin
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, tx-kx, ty-ky, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, tx-kx, ty-ky, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          end;
          3: if Map.CanMove(tx+kx,ty+ky) then begin
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, tx+kx, ty+ky, tx+kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
                PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, tx+kx, ty+ky, tx+kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          end;
       end;
       PlaySound (8302);
    end;

end;



procedure TfrmMain.ClientGetDealRemoteAddItem (body: string);        //°Å·¡
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      AddDealRemoteItem (ci);
   end;
end;

procedure TfrmMain.ClientGetDealRemoteDelItem (body: string);       //°Å·¡
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      DelDealRemoteItem (ci);
   end;
end;


procedure TfrmMain.ClientGetRentalRemoteAddItem (body: string);        //´ë¿©
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      AddRentalRemoteItem (ci);
   end;
end;

procedure TfrmMain.ClientGetRentalRemoteDelItem (body: string);       //´ë¿©
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      DelRentalRemoteItem (ci);
   end;
end;

procedure TfrmMain.ClientGetSetItems(Msg: pTDefaultMessage; body: string);
var
  I, nIdx, k, j: Integer;
  sSetItem, sIdx, sItems, sValues, sItem, sValue: string;
  SetItem: pTSetItems;
  boItem, boValue: Boolean;
begin
  for I := 0 to g_SetItemsList.Count - 1 do
    Dispose(pTSetItems(g_SetItemsList[I]));
  g_SetItemsList.Clear;

  while True do begin
    if body = '' then break;
    body := GetValidStr3(body, sSetItem, ['/']);
    if sSetItem = '' then Continue;
    sSetItem := DecodeString(sSetItem);
    sValues := GetValidStr3(sSetItem, sItems, [';']);
    if sItems = '' then Continue;
    if sValues = '' then Continue;
    New(SetItem);
    FillChar(SetItem^, SizeOf(TSetItems), #0);
    boItem := False;
    boValue := False;
    while True do begin
      if sItems = '' then break;
      sItems := GetValidStr3(sItems, sItem, ['/']);
      sItem := GetValidStr3(sItem, sIdx, ['.']);
      nIdx := StrToIntDef(sIdx, -1);
      if nIdx in [Low(SetItem.Items)..High(SetItem.Items)] then begin
        SetItem.Items[nIdx] := sItem;
      end;
    end;
    while True do begin
      if sValues = '' then break;
      sValues := GetValidStr3(sValues, sValue, ['/']);
      sValue := GetValidStr3(sValue, sIdx, ['.']);
      nIdx := StrToIntDef(sIdx, -1);
      if nIdx in [Low(SetItem.Value)..High(SetItem.Value)] then begin
        SetItem.Value[nIdx] := StrToIntDef(sValue, 0);
      end;
    end;
    g_SetItemsList.Add(SetItem);
  end;
end;

procedure TfrmMain.ClientGetHintDataList(Msg: pTDefaultMessage; body: string);
var
  OutLen: integer;
  Buffer, OutBuffer: PChar;
begin
  if body <> '' then begin
    GetMem(Buffer, Msg.Recog);
    Try
      DecodeBuffer(body, Buffer, Msg.Recog);
      OutLen := ZIPDecompress(Buffer, Msg.Recog, 0, OutBuffer);
      if (OutLen > 0) then begin
        g_OperateHintList.Clear;
        g_OperateHintList.SetText(OutBuffer);
        g_nOperateHintIdx := Random(g_OperateHintList.Count);
        g_dwOperateHintTick := GetTickCount;
        FreeMem(OutBuffer);
      end;
    Finally
      FreeMem(Buffer);
    End;
  end;
end;

procedure TfrmMain.ClientGetChangeGuildName (Msg: pTDefaultMessage; body: string);
var
   str: string;
begin
   str := GetValidStr3 (body, g_sGuildName, ['/']);
   g_sGuildRankName := Trim (str);

   g_nGuildMark := Msg.param;
end;

procedure TFrmMain.ClientGetTagAlarm (msg :TDefaultMessage;body: string);
var
   notreadcount : integer;
begin
     notreadcount := msg.Param;
     if ( notreadcount > 0 ) then begin
          DScreen.AddChatBoardString ('ÄãÊÕµ½ÁËÒ»·âÐÂÓÊ¼þ£¬Çë×¢Òâ²éÊÕ¡£', clWhite, clRed);
          MailAlarm := true;
     end;

end;
procedure TFrmMain.ClientGetTagInfo (msg :TDefaultMessage);    //¸Þ¸ð
var
   i           : integer;
   Status, Id  : integer;
begin
   Id := Msg.Recog;
   Status  := msg.Param;

   for i := 0 to MailLists.Count - 1 do begin
    if PNMailItem(MailLists[i]).Id = Id then begin
         // »èÁ¦ÀÎ°æ¿ì¿¡´Â »èÁ¦ÇÏÀÚ
         if Status = 3 then begin
            dispose( MailLists[i] );
            MailLists.Delete( i );
         end else begin
            PNMailItem(MailLists[i]).Status := Status;
         end;
         break;
    end;
   end;

   RecalcNotReadCount;

end;


procedure TfrmMain.ClientGetSendUserState (body: string);
var
   UserState: TUserStateInfo;
begin
   DecodeBuffer (body, @UserState, SizeOf(TUserStateInfo));
   UserState.NameColor := GetRGB(UserState.NameColor);
   FrmDlg.OpenUserState(UserState);
end;

procedure TfrmMain.ClientObjBlasthit(DefMsg: pTDefaultMessage); //ÂüÁø°Ý
var
  Actor: TActor;
begin
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    Actor.SendMsg(DefMsg.ident, DefMsg.Recog, DefMsg.param {x}, DefMsg.tag {y}, Actor.m_btDir, 0, '', 0);
  end;
end;

procedure TfrmMain.ClientGetSendGuildGrow (body: string);    //¹®ÆÄ¼ºÀå
var
   GuildGrow: TGuildGrowUp;
begin
   DecodeBuffer (body, @GuildGrow, SizeOf(TGuildGrowUp));
   FrmDlg.OpenGuildGrow(GuildGrow);
end;
procedure TfrmMain.ClientGetSendGuildGrow2 (body: string);    //¹®ÆÄ¼ºÀå
var
   GuildGrow: TGuildGrowUp;
begin
   DecodeBuffer (body, @GuildGrow, SizeOf(TGuildGrowUp));
   FrmDlg.OpenGuildGrow2(GuildGrow);
end;

procedure TfrmMain.ClientGetFriendResult(msg :TDefaultMessage;body: string);
var
   i  : integer;
   str : String;
begin
   str := DecodeString (body);
   i := msg.Param;
   case i of
      1: FrmDlg.DMessageDlg ('Äã²»ÄÜÌí¼Ó×Ô¼ºÎªºÃÓÑ¡£',[mbOk]);
      2: FrmDlg.DMessageDlg (str + ' ÒÑ¾­ÊÇÄãµÄºÃÓÑÁË¡£',[mbOk]);
      3: FrmDlg.DMessageDlg (str + ' ²»´æÔÚ¡£',[mbOk]);
   end;
end;

procedure TfrmMain.SendTimeTimerTimer(Sender: TObject);
var
   tcount: longword;
begin
//   tcount := GetTickCount;
//   SendClientMessage (CM_CLIENT_CHECKTIME, tcount, Loword(LatestClientGetTime), Hiword(LatestClientGetTime), 0);
//   g_dwLastestClientGetTime := tcount;
end;
procedure TFrmMain.UseNormalEffect (effnum, effx, effy: integer);
var
   Effect: TMagicEff;
   k: integer;
   bofly: Boolean;
begin
   Effect := nil;
   if not g_boEffect then Exit;
   case effnum of

      NE_CHUNMU{184}: begin    //Ãµ¹«
         Effect := THumanEffects.Create(effx, effy, g_WMagic3Images, 130, 10, 100, TRUE);
         PlaySound(10730);
      end;
      NE_STRUCKCHUNMU{185}: begin  //Ãµ¹«¹Ý°Ý
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic3Images,
                                       140, //½ÃÀÛ À§Ä¡
                                       3,   //ÇÁ·¡ÀÓ
                                       80,   //µô·¹ÀÌ
                                       True);
         PlaySound(10735);
      end;

      NE_KINGSTONE_RECALL_1{100}: begin//ºñ¿ùÃµÁÖ ¼ÒÈ¯, ºñ¿ùÃµÁÖ¿¡°Ô¿¡ »Ñ·ÁÁÜ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1370, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       110,  //µô·¹ÀÌ
                                       True);
         PlaySound (2579);
      end;
      NE_KINGSTONE_RECALL_2{101}: begin//ºñ¿ùÃµÁÖ ¼ÒÈ¯, Ä³¸¯¿¡°Ô »Ñ·ÁÁÜ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1390, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       110,  //µô·¹ÀÌ
                                       True);
         PlaySound (10062);
      end;
      NE_KINGTURTLE_MOBSHOW{106}: begin    //Çö¹«
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[24],
                                       3080, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       90,   //µô·¹ÀÌ
                                       True);
         PlaySound (110);
      end;
      NE_OMAKING{107}: begin    //ÆÄÈ²¸¶½Å
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[21],
                                       3520, //½ÃÀÛ À§Ä¡
                                       30,   //ÇÁ·¡ÀÓ
                                       100,   //µô·¹ÀÌ
                                       True);
         PlaySound (2396);
      end;
      NE_POISONFOG{102}: begin//ÀÌ¹«±â µ¶¾È°³ ÀÓÆåÆ® //####
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1280, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound (2446);//8102
      end;
      NE_SN_MOVEHIDE{103}: begin//ÀÌ¹«±â ¿öÇÁ »ç¶óÁö´ÂÀÓÆåÆ®
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1300, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       80,   //µô·¹ÀÌ
                                       True);
         PlaySound (2447);//8103
      end;
      NE_SN_MOVESHOW{104}: begin//ÀÌ¹«±â ¿öÇÁ ³ªÅ¸³ª´ÂÀÓÆåÆ®
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1310, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       80,   //µô·¹ÀÌ
                                       True);
         PlaySound (2447);//8103
      end;
      NE_SN_RELIVE{105}: begin//ÀÌ¹«±â ºÎÈ° ÀÓÆåÆ®
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1330, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound (2448);//8104
      end;

      NE_FOX_MOVESHOW{109}: begin//¼ú»çºñ¿ù¿©¿ì ³ªÅ¸³ª´Â ÀÓÆåÆ®
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[23],
                                       810,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       90,   //µô·¹ÀÌ
                                       True);
         PlaySound (110);
      end;
      NE_ICEKING1: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[43],
                                       1310,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       90,   //µô·¹ÀÌ
                                       True);
      end;
      NE_ICEKING2: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[43],
                                       1320,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       90,   //µô·¹ÀÌ
                                       True);
      end;

      NE_SOULSTONE_HIT{111}: begin//È£È¥¼® °ø°Ý ÀÓÆåÆ®
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[23],
                                       1410, //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       120,  //µô·¹ÀÌ
                                       True);
         PlaySound (157);//(442);
      end;

      NE_GOLD_MOVESHOW{110}: begin//È¯»ç ºñÈ£±Í¸¶ ¼ÒÈ¯
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[30],
                                       4601,  //½ÃÀÛ À§Ä¡
                                       6,   //ÇÁ·¡ÀÓ
                                       90,   //µô·¹ÀÌ
                                       True);
         PlaySound2 (s_Skeleton);
      end;

      NE_SURA{82}: begin//¼ö¶óÃµ¸êÁø
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic0Images,
                                       1050,  //½ÃÀÛ À§Ä¡
                                       20,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound2 (as_140);
      end;

      NE_FIRECIRCLE{112}: begin// È­·æ±â¿°
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       910,  //½ÃÀÛ À§Ä¡
                                       23,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound (10450);
      end;

      NE_THUNDER{114}: begin    //¿ë´øÁ¯ ¹ø°³        //¸¶·æ¹ø°³
         PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);    //¸¶·æ¹ø°³
         PlaySound (8301);
      end;
      NE_FIRE{115}: begin         //¿ë´øÁ¯ ¿ë¾Ï       //¸¶·æ¹ø°³
         PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);   //¸¶·æ¹ø°³
         PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);
         PlaySound (8302);
      end;

      NE_USERHEALING{116}: begin //NPC Èú¸µ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicImages,
                                       370,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound (10022);
      end;


      NE_FIRECIRCLEUP{133}: begin// È­·æ±â¿° °­È­
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicUpImages,
                                       630,  //½ÃÀÛ À§Ä¡
                                       37,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound (10450);
      end;
      NE_ICECIRCLE{136}: begin// ºù¿ù°Ý
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       1910,  //½ÃÀÛ À§Ä¡
                                       20,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound2 (s_Super);
      end;
      NE_THUNDERCIRCLE{138}: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       3290,  //½ÃÀÛ À§Ä¡
                                       25,   //ÇÁ·¡ÀÓ
                                       150,  //µô·¹ÀÌ
                                       True);
         PlaySound2 (s_THUNDERCIRCLE);
      end;
      NE_THUNDERCIRCLE2{139}: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       3290,  //½ÃÀÛ À§Ä¡
                                       25,   //ÇÁ·¡ÀÓ
                                       150,  //µô·¹ÀÌ
                                       True);
      end;
      NE_KYO{140}:begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       2850,  //½ÃÀÛ À§Ä¡
                                       15,   //ÇÁ·¡ÀÓ
                                       150,  //µô·¹ÀÌ
                                       True);
         PlaySound2 (s_Kyo);
      end;
      NE_SINGI{141}:begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       915,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       150,  //µô·¹ÀÌ
                                       True);
         PlaySound2 (s_Singi);
      end;

      NE_THUNDER2{142}: begin    //¿ë´øÁ¯ ¹ø°³        //¸¶·æ¹ø°³
         PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER2, MAGIC_DUN_THUNDER2, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);    //¸¶·æ¹ø°³
         PlaySound (8301);
      end;

      NE_Enchant_Good: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 900, 20, 100, TRUE);
         PlaySound2 (Enchant_Good);
      end;
      NE_Enchant_Fail: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 920, 10, 100, TRUE);
         PlaySound2 (Enchant_Fail);
      end;
      NE_Enchant_Good1: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 840, 20, 100, FALSE);
      end;
      NE_Enchant_Fail1: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 860, 10, 100, FALSE);
      end;
      NE_Hammer_Good: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 880, 5, 130, TRUE);
         PlaySound2 (Enchant_Hammer_Good);
         UseNormalEffect(NE_Hammer_Good1, effx, effy);
      end;
      NE_Hammer_Miss: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 890, 5, 120, TRUE);
         PlaySound2 (Enchant_Hammer_Miss);
         UseNormalEffect(NE_Hammer_Miss1, effx, effy);
      end;
      NE_Hammer_Good1: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 820, 5, 130, FALSE);
      end;
      NE_Hammer_Miss1: begin
         Effect := TNormalDrawEffect.Create(effx, effy, g_WMagic3Images, 830, 5, 120, FALSE);
      end;
      NE_JUCJSAL{252}: begin// ÃµÀÎÀû»ìÇ³
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic_BonzeImages,
                                       1510,  //½ÃÀÛ À§Ä¡
                                       41,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound2(MB_126_2);
      end;
      NE_FAHANGBO{253}: begin// ÆÄÈ²º¸
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic_BonzeImages,
                                       1800,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       100,  //µô·¹ÀÌ
                                       True);
         PlaySound2(MB_128_2);
      end;

      NE_BEAR_LIGHITING: begin//°õ ¶óÀÌÆ®´× °ø°Ý
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[41],
                                       2830,  //½ÃÀÛ À§Ä¡
                                       10,   //ÇÁ·¡ÀÓ
                                       120,  //µô·¹ÀÌ
                                       True);
      end;

   end;
   if Effect <> nil then begin
      Effect.MagOwner := g_Myself;  //³» ±âÁØÀ¸·Î
      PlayScene.m_EffectList.Add (Effect);
   end;
end;

procedure TfrmMain.DrawEffectHumex(nType: Integer;ObjectID:TActor);  //12 13 15 16 17 18 19 20 21
var
  Effect :TMagicEff;
  boFly:Boolean;
begin
  Effect:=nil;
  case nType of
    11: begin //Ã»Ç³¸í¿ù
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicUpImages,1180,16,100,TRUE);
      PlaySound2(MWindMoon);
    end;
    12: begin //·¹º§¾÷ ÀÌÆåÆ® Éý
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1180,16,100,TRUE);
      PlaySound(156);
    end;
    13: begin      //ÈíÇ÷¼ú
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1090,10,50,TRUE);
      PlaySound(10485);
    end;
    14: begin //ÀûÇ÷¹«¿µ
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicUpImages,1200,16,100,TRUE);
      PlaySound2(MWindMoon);
    end;
    15: begin //¹«±ØÁø±â
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,165,10,70,TRUE);
    end;
    16: begin // ¼Ò»ý
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1220,20,115,TRUE);
      PlaySound(10543);
    end;
    17: begin //µî¼± ÀÌÆåÆ® Éý
     Effect:=TObjectEffects.Create(ObjectID,g_WEffectImg,760,94,100,TRUE);
     PlaySound2(s_HumUp);
    end;
    18: begin //º¸³Ê½º Æ÷ÀÎÆ®Éý
     Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1330,10,100,TRUE);
     PlaySound(2442);
    end;
    19: begin //µî¼± Á¢¼Ó ÀÌÆÑÉý
     Effect:=TObjectEffects.Create(ObjectID,g_WEffectImg,960,17,100,TRUE);
     PlaySound(197);
    end;
    20: begin     //ÁøÀ§º¸
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicNewImages,1830,10,50,TRUE);
      PlaySound(8103);
    end;
    21: begin     //°Ý°ø¼·¹°
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicNewImages,1670,10,50,TRUE);
      PlaySound(10655);
    end;
  end;
  if Effect <> nil then begin
    Effect.MagOwner:=ObjectID;
    PlayScene.m_EffectList.Add(Effect);
  end;
end;
procedure TfrmMain.DrawEffectHum(nType, nX, nY: Integer; Dir: Integer);
var
  Effect, Effect2, Effect3 :TMagicEff;
  boFly:Boolean;
  aowner: TActor;
  Around, Targe: TActor;

begin
  Effect:=nil;
  Effect2:=nil;
  Effect3:=nil;
  if not g_boEffect then Exit;
  case nType of
    0: begin
    end;
    1: Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[13],410,6,120,False);

    NE_CLONESHOW: begin  //ºÐ½Å
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,670,10,150,TRUE);
    end;
    NE_CLONEHIDE: begin  //ºÐ½Å
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,690,10,150,TRUE);
      PlaySound (48);
    end;
    4: begin //·¹º§¾÷ ÀÌÆåÆ® Éý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WEffectImg,610,10,100,TRUE);
      PlaySound(158);
    end;
    5: begin   //»ì»ýµµ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,3760,6,150,TRUE);
      PlaySound(10765);
    end;
    8: begin   //½Ö·æÂü
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,210,6,120,TRUE);
    end;

    9: begin   //½Ö·æÂü
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,380,5,150,TRUE);
    end;
    10: begin //ÀÌÇü
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicImages,1600,10,30,TRUE);
      PlaySound (s_spacemove_in);
    end;

    11,12,13,14,15,16,17,18,19,20,21: begin //»ç¿ë
    end;



    22: begin   //°ÅµµÀû±Í
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[29],4750,10,120,TRUE);
    end;
    23: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMagic2Images,1410,10,120,TRUE);
      PlaySound(2547);
    end;
    24: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[23],1440,10,120,TRUE);
      PlaySound(2546);
    end;
    25: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMagic2Images,0,10,120,TRUE);
      PlaySound(2528);
    end;
    26: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[23],2120,20,120,TRUE);
      PlaySound(2577);
    end;
    27: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[23],2140,20,120,TRUE);
      PlaySound(2578);
    end;
    28: begin   //Àý¸í°Ë¹ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1940,4,150,TRUE);
      PlaySound(10595);
    end;
    NE_MANAEATERS{29}: begin   //Èí±â
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,2420,10,150,TRUE);
      PlaySound(10676);
    end;
    NE_SPIDERBOSS{30}: begin
      g_MySelf.m_dwSpiderMove  := GetTickCount;   //¸ø¿òÁ÷ÀÓ
      if g_MyHero <> nil then
        g_MyHero.m_dwSpiderMove := GetTickCount;
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtGumizul2,False,30,boFly);
      PlaySound(2779);
    end;
    NE_HEMORRHAGE{31}: begin   //Ç÷Ç³°Ý
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 0 + (10 * Dir), 10, 150, TRUE);
      PlaySound(10765);
    end;
    NE_TICKHEMORRHAGE{32}: begin   //Ç÷Ç³°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,60,10,100,TRUE);
      PlaySound(s_struck_body_longstick);
    end;
    NE_DARKCLONEHIDE{33}: begin   //¿­È­½Å
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic2Images, 2600, 10, 150, TRUE);
      PlaySound(10715);
    end;

    NE_BONZECLONE{251}: begin   //ÀºÇü¼ú
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic_BonzeImages, 1170, 10, 100, TRUE);
      PlaySound2(MB_121_1);
    end;

    34: begin //Ãµ¹«
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,140,2,100,TRUE);
    end;
    35: begin   //¿ùÁö  °Å¹ÌÁÙ
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[25],2980,10,100,TRUE);
      PlaySound(2779);
    end;
    36: begin   //È£È¥¼® µ¹ÀÌÆåÆ®
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[23],1410,10,100,TRUE);
      PlaySound(2530);
    end;
    37: begin   //Á¶ÀÎ»ó ´«²Éº¸¶ó
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4240,20,100,TRUE);
      PlaySound(2797);
    end;
    38: begin   //Á¶ÀÎ»ó Ãµ»óºùÈ¯
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtIceShower,False,400,boFly);
      PlaySound (10523);
    end;
    39: begin //´ë¾Ï¿¬¼ú
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,180,10,150,TRUE);
      PlaySound(10062);
    end;
    40: begin   //¼®¸¶¼ö Ãµ»ó³«¿°
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtFireShower,False,400,boFly);
      PlaySound (10533);
    end;
    41: begin        //¼öµÎ±Í ¹ø°³
    PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtHellThunder,False,80,boFly);
    end;
    42: begin     //ÀÎ¸é±Í ¸êÃµÈ­
    Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[27],3160,10,100,TRUE);
    PlaySound (2979);
    end;
    43: begin     //ÀÎ¸é±Í ¸êÃµÈ­
    Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[27],3170,20,200,TRUE);

    end;
    44: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[27],2690,10,100,TRUE);
      PlaySound(2967);
    end;
    45: begin
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[27],2700,10,100,TRUE);
      PlaySound(2969);
    end;
    46: begin
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtRedThunder2,False,30,boFly);
      PlaySound(8301);
    end;
    NE_MANAEATERT{47}: begin   //Èí±â
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,2400,10,150,TRUE);
      PlaySound(10675);
    end;
    48: begin   //¿µÁ¤°©ÁÖ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WEffectImg,580,10,100,TRUE);
      PlaySound2(s_armoreffect);
    end;
    49: begin   //³«¿°Áø
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1600,10,300,TRUE);
      PlaySound(10532);
    end;

    50: begin   //ºù¿°±ÍÀå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],4610,6,120,TRUE);
      PlaySound (10392);
    end;

    51: begin //µ¶ÀÎÀû±Í
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[29],6880,10,120,TRUE);
      PlaySound(2527);
    end;

    52:begin    //Á¶ÀÎ»ó ³ìµ¶°ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4280,10,120,TRUE);
      PlaySound (2799);
    end;
    53:begin
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,140,2,150,TRUE);
      PlaySound(10735);
    end;
    NE_ILSUM{54}: begin    //ÀÏ¼¶
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic2Images, 1700 + (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
    end;
    NE_UPILSUM{55}: begin    //ÀÏ¼¶°­È­
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagicUpImages, 300 + (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
    end;
    NE_MAILSUM{56}: begin    //¸¶Ç÷±¤¼¶
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
      PlaySound2 (as_130);
    end;
    NE_HWECHUN_1{57}: begin    //È¸Ãµ°Ý
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 720, 31, 75, TRUE);
      PlaySound2 (as_132_2);
    end;
    NE_HWECHUN_2{58}: begin    //È¸Ãµ°Ý
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 751, 39, 75, TRUE);
      PlaySound2 (as_132_3);
    end;
    62:begin  //ÀÏ°Ýºñ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,880,6,100,TRUE);
      PlaySound(8204);
    end;
    63:begin  //ÀÏ°Ýºñ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,870,5,100,TRUE);
      PlaySound2(s_effect);
    end;
    64: begin       //¼®¸¶¼ö ½ºÅÏ
      g_MySelf.m_dwSpiderMove  := GetTickCount;   //¸ø¿òÁ÷ÀÓ
      if g_MyHero <> nil then g_MyHero.m_dwSpiderMove := GetTickCount;
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],3760,10,120,TRUE);
      PlaySound(2787);
    end;
    65: begin    //ºù¿°±ÍÀå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],4620,5,120,TRUE);
      PlaySound(3268);
    end;
    66: begin //Èë°ÅÀÎ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],2380,12,120,FALSE);
    end;

    67: begin //¿©ÇÏ¼ö ÀüÃ¼Æø¹ß
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3360,13,120,TRUE);   //Ã¼Å©ÇØº¸ÀÚ
      PlaySound(3856);
    end;
    68: begin //¿©ÇÏ¼ö 5x5
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3380,10,120,FALSE);
      PlaySound(3849);
    end;
    69: begin //¿©ÇÏ¼ö 8x8
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3440,15,120,FALSE);   //Ã¼Å©ÇØº¸ÀÚ
      PlaySound(3859);
    end;
    70: begin //¿©ÇÏ¼ö À§¿¡¼­ ¼Ú¾Æ³²
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3480,15,120,FALSE);   //Ã¼Å©ÇØº¸ÀÚ
      PlaySound(3849);
    end;
    71: begin //°øÀÛÁÖ ½ºÅÏ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4330,5,200,TRUE);
    end;

    72:begin    //Á¶ÀÎ»ó µÐÈ­°ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4260,10,120,TRUE);
      PlaySound (2799);
    end;
    73:begin    //°í´ë¼öÈ£Àå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],7090,10,120,FALSE);
    end;
    74: begin   //³ú·æºÀ¹ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,350,7,120,TRUE);
    end;
    75: begin   //ÃµÈ­ºÀ¹ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,330,10,100,TRUE);
    end;

    NE_THUNDERHAGE{76}: begin   //º¹È£Àå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,630,10,100,TRUE);
      PlaySound2(Thunder_Struck);
    end;
    77: begin    //Ãµ»óÆø¿°
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpFirerave,False,400,boFly);
      PlaySound2 (as_134_3);
      PlaySound (10533);
    end;
    NE_THUNDERDOWN{78}: begin    //³«Ãµ·Ú
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic0Images,1120,39,50,TRUE);
      PlaySound (1923);
      PlaySound (8301);
    end;

    79: begin   //Ãµ°ø
      PlaySound2 (as_138_4);
    end;
    NE_DRAGON_1{80}:begin //¿ë¼ÚÀ½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 980, 12, 80, FALSE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1000, 12, 80, TRUE);
      PlaySound2 (as_139_1);
    end;
    NE_DRAGON_2{81}:begin //¿ë¼ÚÀ½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1020, 10, 80, TRUE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1030, 10, 80, FALSE);
      Effect3 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1040, 10, 80, TRUE);
    end;

    NE_DRAGON_3{128}:begin //¿ë¼ÚÀ½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1020, 10, 80, TRUE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1030, 10, 80, FALSE);
      Effect3 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1040, 10, 80, TRUE);
      PlaySound2 (as_139_3);
    end;

    83:begin    //°í´ë¼öÈ£Àå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],7080,10,120,FALSE);
    end;
    84:begin    //ÀÎ¸é¼ö
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],3160,10,120,TRUE);
    end;
    85:begin    //¿ø¿À  °ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4620,5,120,TRUE);
    end;
    86:begin    //¿ø¿À  Çìºñ °ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4630,10,120,TRUE);
      PlaySound(769);
    end;
    87:begin    //¿ø¿À  ¼ÒÈ¯
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4720,10,120,TRUE);
      PlaySound(767);
    end;
    88:begin    //¿ø¿À  ÀüÃ¼ ¼Õ°ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4750,10,120,FALSE);
      PlaySound(766);
    end;
    89:begin    //¿ø¿À ÀüÃ¼ Æø¹ß
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4740,10,120,TRUE);
      PlaySound(768);
    end;
    90: begin //¹«´ç±ªÀÌ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[33],5680,12,120,FALSE);
    end;
    91: begin //¹«´ç±ªÀÌ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[33],5720,8,120,FALSE);
      PlaySound2 (shamancat_att3);
    end;
    92: begin //Áø¹¦Àå±º
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[34],1580,10,120,TRUE);
    end;
    93: begin //Áø¹¦Àå±º
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[34],1590,8,120,TRUE);
    end;
    94: begin //¿°¸¶ÅÂÀÚ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],3520,12,120,FALSE);
    end;
    95: begin //¿°¸¶ÅÂÀÚ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],3540,10,120,FALSE);
    end;
    96:begin    //¼ö¾î±Í µ¹µ¢ÀÌ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[35],2760,20,80,FALSE);
      PlaySound(3738);
    end;
    97: begin     //ºñ¿ùÀûÈ£
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[23],800,10,90,TRUE);
      PlaySound (109);
    end;
    98: begin  //¸ê±Í
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[32],430,7,120,TRUE);
    end;
    99: begin       //Áö¿Á¹®Áö±â
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1920,4,120,False);
      PlaySound(9204);
    end;
    100..116: ;

    117: begin    //°øÀÛÁÖ µ¶ ¾È°³
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4510,21,120,TRUE);
    end;
    118: begin    //°øÀÛÁÖ µ¶
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4540,30,120,TRUE);
      PlaySound(3869);
    end;

    119: begin   //gm ÀÌº¥Æ® ÀÌÆÑ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,2140,20,120,TRUE);
      PlaySound2(super);
    end;

    120: begin   //±Ý°­ºÒ±«
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,550,20,120,TRUE);
      PlaySound(10815);
    end;
    121: begin   //·Ú¼±Ç³
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,590,10,120,TRUE);
      PlaySound(10825);
    end;
    122: begin   //À½¾ç¿ÀÇàÁø - Èú
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,650,10,120,TRUE);
      PlaySound(10022);
    end;
    123: begin   //À½¾ç¿ÀÇàÁø - °ø°Ý
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,660,10,120,TRUE);
    end;
    124: begin   //¿ù¿µ¹«
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,680,34,100,TRUE);
      PlaySound(10845);
    end;
    125: begin      //°¡À§¹ÙÀ§º¸ ºñ±è
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1139,1,2000,FALSE);
    end;
    126: begin      //°¡À§¹ÙÀ§º¸ Á³À½
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1140,1,2000,FALSE);
    end;
    127: begin      //°¡À§¹ÙÀ§º¸ ÀÌ±è
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1141,1,2000,FALSE);
    end;
    NE_CLOUD{129}: begin  //¾Ïµ¶¸¸°è
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,3720,23,100,True);
      PlaySound2 (m_109_2);
    end;

    133: ;
    134: begin   //Ãµ»óºùÈ¯ °­È­
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpIceShower,False,400,boFly);
      PlaySound (10523);
    end;
    135: begin   //Ãµ»ó³«¿° °­È­
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpFireShower,False,400,boFly);
      PlaySound (10533);
    end;
    136: ;
    137: begin   //¿µÀûÃß
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,1730,10,100,TRUE);
      PlaySound(4159);
    end;
    138,139,140: ;


    144: begin      //¾ç¿ë¿Õ Áö¿°¼ú
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[41],5650,10,120,TRUE);
      PlaySound(4347);
    end;

    146: begin      //¸¶Ç³¼®±«
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[40],8740,17,120,TRUE);
      PlaySound2(THUNDERCIRCLE);
    end;
    147: begin      //¾ÏÈæ¼±Àå
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[37],5980,13,120,TRUE);
      PlaySound(3856);
    end;
    148: begin  //¾ç¿ë¿Õ µîÀå
      Effect:=TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[41], 6030 + (10 * Dir), 3, 40, FALSE);
    end;
    149: begin //¾ç¿ë¿Õ ÈíÇ÷
      Effect:=TNormalDrawEffect.Create(nX,nY, g_WMonImagesArr[41],5750,10,80,TRUE);
      PlaySound(4349);
    end;

    NE_GUKDEA: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 4882 + (10 * Dir), 6, 85 - (g_MySelf.m_nHitSpeed div 2), TRUE);
    end;

    NE_GoStop1: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3662 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop2: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3672 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop3: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3682 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop4: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3692 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop5: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3702 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3490, 10, 150, False);
    end;

    NE_GoStop6: begin    //ºñ±¤ÀÇÅ»
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3510 + (30 * Dir), 16, 150, False);
    end;

    NE_OMAJESA : begin    //¿À¸¶Á¦»çÀå
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3420, 11, 120, TRUE);
      PlaySound(3948);
    end;
    NE_GUSLE1  : begin    //¹ø°³±¸½½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3550, 10, 120, TRUE);
    end;
    NE_GSLE2S  : begin    //È¸º¹±¸½½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3690, 10, 120, TRUE);
    end;
    NE_GUUSLE3T  : begin    //°ø°Ý·Â±¸½½
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3820, 10, 120, TRUE);
    end;

    NE_OMADRAKKINH : begin    //¿À¸¶Èæ·É
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 5890 + (10 * Dir), 10, 120, TRUE);
      PlaySound(3987);//¿À¸¶Èæ·É
    end;
    NE_NOSEMONKEY1: begin    //±äÄÚ¿ø¼þÀÌ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 630, 10, 120, TRUE);
      PlaySound(4026);
    end;
    NE_NOSEMONKEY2: begin    //±äÄÚ¿ø¼þÀÌ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 640, 10, 120, TRUE);
    end;
    NE_GUJANGWHA:  begin    //°ÅÀåÈ­
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 1980, 10, 120, False);
    end;
    NE_GHOSTFIRE:  begin    //È¥ºÒ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 2800, 10, 120, TRUE);
    end;
    NE_DARK_RECALL:  begin    //¾ÏÈæ¼±Àå ¼ÒÈ¯
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 4540, 10, 120, TRUE);
      PlaySound(4159);
    end;
    NE_BIG_SNAKE:  begin    //´ë¸Á
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 6610, 10, 120, TRUE);
    end;
    NE_JUMAWIZARD:  begin    //ÁÖ¸¶¼ú»ç
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 1120, 10, 120, False);
    end;
    NE_JUMAWIND:  begin    //ÁÖ¸¶Ç³±Ã»ç
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 2760, 10, 120, TRUE);
    end;
    NE_SANDWIND :  begin    //¸ð·¡ÆøÇ³
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 6190, 10, 120, TRUE);
    end;
    NE_ICEDEVIL :  begin    //¾Ç±Í ÀÚÆø
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[42], 5720, 10, 120, TRUE);
    end;
  end;
  if Effect <> nil then begin
    Effect.MagOwner:=g_MySelf;
    PlayScene.m_EffectList.Add(Effect);
  end;
  if Effect2 <> nil then begin
    Effect2.MagOwner:=g_MySelf;
    PlayScene.m_EffectList.Add(Effect2);
  end;
  if Effect3 <> nil then begin
    Effect3.MagOwner:=g_MySelf;
    PlayScene.m_EffectList.Add(Effect3);
  end;
end;
function IsDebugA():Boolean;
var
  isDebuggerPresent: function:Boolean;
  DllModule: THandle;
begin
  DllModule := LoadLibrary('kernel32.dll');
  isDebuggerPresent := GetProcAddress(DllModule, PChar(DecodeString('io@^LIefGNq<K@TxL?A<ACP')));    //'IsDebuggerPresent'
  Result:=isDebuggerPresent;
end;

function IsDebug():Boolean;
var
  isDebuggerPresent: function:Boolean;
  DllModule: THandle;
begin
  DllModule := LoadLibrary('kernel32.dll');
  isDebuggerPresent := GetProcAddress(DllModule, PChar(DecodeString('io@^LIefGNq<K@TxL?A<ACP')));    //'IsDebuggerPresent'
  Result:=isDebuggerPresent;
end;

procedure TfrmMain.SelectChr(sChrName: String);
begin
  PlayScene.EdChrNamet.Text:=sChrName;
end;

function TfrmMain.GetNpcImg(wAppr: Word; var WMImage: TWMImages): Boolean;
var
  I: Integer;
  FileName:String;
begin
  Result:=False;
  for I := 0 to NpcImageList.Count - 1 do begin
    WMImage:=TWMImages(NpcImageList.Items[I]);
    if WMImage.Appr = wAppr then begin
      Result:=True;
      exit;
    end;
  end;
  FileName:=NpcImageDir + IntToStr(wAppr) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=wAppr;
    WMImage.Initialize;
    NpcImageList.Add(WMImage);
    Result:=True;
  end;
end;

function TfrmMain.GetWStateImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateImg(Idx: Integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateComManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemComManImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateComManImg(Idx: Integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemComManImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;

function TfrmMain.GetWStateComWomanImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemComWomanImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateComWomanImg(Idx: Integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemComWomanImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;

function TfrmMain.GetWStateWarrManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWarrManImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateWarrManImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ º®Ç÷Àü»ç(³²) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWarrManImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateWarrWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWarrWoImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateWarrWoImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWarrWoImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;



function TfrmMain.GetWStateWizManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWizManImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateWizManImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ È«Çö¼ú»ç(³²) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWizManImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateWizWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWizWoImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateWizWoImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ È«Çö¼ú»ç(¿©) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemWizWoImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;



function TfrmMain.GetWStateMonkManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemMonkManImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateMonkManImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemMonkManImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateMonkWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemMonkWoImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateMonkWoImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemMonkWoImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateAssManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemAssManImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateAssManImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemAssManImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;


function TfrmMain.GetWStateAssWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemAssWoImages.GetCachedImage(idx,ax,ay);
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(Idx - FileIdx * 10000,ax,ay);
  end;
end;

function TfrmMain.GetWStateAssWoImg(Idx: Integer): TDirectDrawSurface;       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©) overload
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  if Idx < 10000 then begin
    Result:=g_WStateItemAssWoImages.Images[idx];
    exit;
  end;
  FileIdx:=Idx div 10000;
  for I := 0 to ItemImageList.Count - 1 do begin
    WMImage:=TWMImages(ItemImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
      exit;
    end;
  end;
  FileName:=ItemImageDir + 'St' + IntToStr(FileIdx) + '.wil';
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    ItemImageList.Add(WMImage);
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //È¡ÎïÆ·ËùÔÚIDXÎ»ÖÃ
  end;
end;

function TfrmMain.GetWWeapon_CommonImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;   //µî¼±¹«±â
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_CommImages.GetCachedImage({(HUMANFRAME - 512)} HUWEAPONFRAME * Weapon  + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage({(HUMANFRAME - 512)} HUWEAPONFRAME * m_btSex  + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';           //µî¼± °ø¿ë
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage({(HUMANFRAME - 512)} HUWEAPONFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeaponImages.GetCachedImage({(HUMANFRAME - 512)}HUWEAPONFRAME * Weapon  + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage({(HUMANFRAME - 512)}HUWEAPONFRAME * m_btSex  + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //ÀÏ¹Ý ¿þÆù1
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage({(HUMANFRAME - 512)}HUWEAPONFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWWeapon_BonzeImg(Weapon, m_btSex, nFrame: Integer; var ax, ay: Integer): TDirectDrawSurface;
var
  I: Integer;
  FileName: string;
  FileIdx: Integer;
  WMImage: TWMImages;
begin
  Result := nil;
  FileIdx:=(Weapon - m_btSex) div 2;
  if (FileIdx < 110) then begin
      Result := g_WWeapon_BonzeImages.GetCachedImage(HUMBONZE * Weapon + nFrame, ax, ay);
    Exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMBONZE + nFrame, ax, ay);
      exit;
    end;
  end;

  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //ÀÏ¹Ý ¿þÆù1
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMBONZE + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWFishingWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
     Result:=g_Fishing1Images.GetCachedImage( (192 * Weapon)  + nFrame ,ax,ay);
    exit;
  end;


  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage((192 * m_btSex) + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';          //³¬½Ã´ë
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage( (192 * m_btSex) + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWFishingUpWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

if (FileIdx < 110) then begin
    Result:=g_Fishing2Images.GetCachedImage( (192 * Weapon) + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage((192 * m_btSex) + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //µî¼± ³¬½Ã´ë
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage((192 * m_btSex) + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeapon_Killer_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_Killer_RightImages.GetCachedImage(HUMKILLFRAME *Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //ÀÚ°´ ¿À¸¥ÂÊ
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWWeapon_Killer_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_Killer_LeftImages.GetCachedImage(HUMKILLFRAME * Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';       //ÀÚ°´ ¿ÞÂÊ
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeapon_WarrImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //º®Ç÷Àü»ç
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_WarrImages.GetCachedImage(HUMUPWARRFRAME *Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPWARRFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';         //º®Ç÷Àü»ç
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWARRFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeapon_WizImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;   //È«Çö¼ú»ç
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_WizImages.GetCachedImage(HUMUPWIZ_MONKDFRAME *Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';         //È«Çö¼ú»ç
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeapon_MonkImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ÀÍ¼±µµ»ç
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_MonkImages.GetCachedImage(HUMUPWIZ_MONKDFRAME*Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //ÀÍ¼±µµ»ç
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWWeapon_Assassin_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_Assassin_RightImages.GetCachedImage(HUMUPASSFRAME *Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //ºñ¿¬ÀÚ°´  ¿À¸¥ÂÊ
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWWeapon_Assassin_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Weapon - m_btSex) div 2;

  if (FileIdx < 110) then begin
    Result:=g_WWeapon_Assassin_LeftImages.GetCachedImage(HUMUPASSFRAME * Weapon + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to WeaponImageList.Count - 1 do begin
    WMImage:=TWMImages(WeaponImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';       //ºñ¿¬ÀÚ°´ ¿ÞÂÊ
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    WeaponImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHumImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 32) then begin
    Result:=g_WHumImgImages.GetCachedImage(HUMANFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //ÀÏ¹Ý ¿Ê1
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHum2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 34) then begin
    Result:=g_WHum2ImgImages.GetCachedImage(HUMANFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //ÀÏ¹Ý ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHum3Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 34) then begin
    Result:=g_WHum3ImgImages.GetCachedImage(HUMANFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //ÀÏ¹Ý ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWHum4Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 34) then begin
    Result:=g_WHum4ImgImages.GetCachedImage(HUMANFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //ÀÏ¹Ý ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHum_BonzeImg(Dress, m_btSex, nFrame: Integer; var ax, ay: Integer): TDirectDrawSurface;
var
  I: Integer;
  FileName: string;
  FileIdx: Integer;
  WMImage:TWMImages;
begin
  Result := nil;
  FileIdx := (Dress - m_btSex) div 2;

  if FileIdx <= 16 then begin
    Result := g_WHum_BonzeImgImages.GetCachedImage(HUMBONZE * Dress + nFrame, ax, ay);
    Exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMBONZE + nFrame, ax, ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //ÀÏ¹Ý ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMBONZE + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWHum_CommonImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 25) then begin
    Result:=g_WHum_CommonImgImages.GetCachedImage(HUMANFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //µî¼± °ø¿ë¿Ê
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMANFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHum_KillerImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //ÀÚ°´
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 40) then begin
    Result:=g_WHum_KillerImgImages.GetCachedImage(HUMKILLFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';     //ÀÚ°´ ¿Ê1
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHum_Killer2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //ÀÚ°´
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 40) then begin
    Result:=g_WHum_Killer2ImgImages.GetCachedImage(HUMKILLFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';        //ÀÚ°´ ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWHum_Killer4Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //ÀÚ°´
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 40) then begin
    Result:=g_WHum_Killer4ImgImages.GetCachedImage(HUMKILLFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';        //ÀÚ°´ ¿Ê2
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMKILLFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHumUp_WarrImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //º®Ç÷Àü»ç
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 20) then begin
    Result:=g_WHumUp_WarrImgImages.GetCachedImage(HUMUPWARRFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPWARRFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //º®Ç÷ ¿Ê
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWARRFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

function TfrmMain.GetWHumUp_WizImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //È«Çö¼ú»ç
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 20) then begin
    Result:=g_WHumUp_WizImgImages.GetCachedImage(HUMUPWIZ_MONKDFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //È«Çö ¿Ê
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
  end;
end;


function TfrmMain.GetWHumUp_MonkImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //ÀÍ¼±µµ»ç
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 20) then begin
    Result:=g_WHumUp_MonkImgImages.GetCachedImage(HUMUPWIZ_MONKDFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //ÀÍ¼± ¿Ê
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPWIZ_MONKDFRAME * m_btSex + nFrame,ax,ay);
  end;
end;



function TfrmMain.GetWHumUp_AssassinImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
var
  I:Integer;
  FileName:String;
  FileIdx:Integer;
  WMImage:TWMImages;
begin      //ºñ¿¬ÀÚ°´
  Result:=nil;
  FileIdx:=(Dress - m_btSex) div 2;

  if (FileIdx < 20) then begin
    Result:=g_WHumUp_AssassinImgImages.GetCachedImage(HUMUPASSFRAME * Dress + nFrame,ax,ay);
    exit;
  end;

  for I := 0 to HumImageList.Count - 1 do begin
    WMImage:=TWMImages(HumImageList.Items[I]);
    if WMImage.Appr = FileIdx then begin
      Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
      exit;
    end;
  end;

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //ºñ¿¬ ¿Ê
  if FileExists(FileName) then begin
    WMImage:=TWMImages.Create(nil);
    WMImage.FileName:=FileName;
    WMImage.LibType:=ltUseCache;
    WMImage.DDraw:=DXDraw.DDraw;
    WMImage.Appr:=FileIdx;
    WMImage.Initialize;
    HumImageList.Add(WMImage);
    Result:=WMImage.GetCachedImage(HUMUPASSFRAME * m_btSex + nFrame,ax,ay);
  end;
end;

procedure TfrmMain.ClientGetSayMsg(Msg: TDefaultMessage; sBody: string);
  function FormatSayStr(sMsg: string; var UserName: string): string;
  var
    sTemp, sFilterText: string;
    I: Integer;
  begin
    UserName := '';
    if Pos(#9, sMsg) > 0 then begin
      sTemp := GetValidStr3(sMsg, UserName, [#9]);
     { for I := 0 to g_FilterMsgList.Count -1 do begin
        sFilterText := g_FilterMsgList[I];
        if AnsiContainsText(sTemp, sFilterText) then begin
          sTemp := AnsiReplaceText(sTemp, sFilterText, '*');
        end;
      end;     }
      if Msg.Ident = SM_WHISPER then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := #7 + UserName + #7 + '=>' + sTemp
        else
          sMsg := #7 + UserName + #7 + '=> ' + sTemp;
      end
      else
      if Msg.Ident = SM_CRY then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := '(!)' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '(!)' + #7 + UserName + #7 + ': ' + sTemp;
      end
      else
      if Msg.Ident = LM_WHISPER then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := '¢½' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '¢½' + #7 + UserName + #7 + ': ' + sTemp;
      end
      else
      if Msg.Ident = SM_GROUPMESSAGE then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := '-' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '-' + #7 + UserName + #7 + ': ' + sTemp;
      end else
      if Msg.Ident = ME_WHISPER then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := '¡Ý' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '¡Ý' + #7 + UserName + #7 + ': ' + sTemp;
      end else
      if Msg.Ident = SM_GUILDAILLY then begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := #7 + UserName + #7 + sTemp
        else
          sMsg := #7 + UserName + #7 + sTemp;
      end else begin
        if (sTemp <> '') and (sTemp[1] = ' ') then
          sMsg := #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := #7 + UserName + #7 + ': ' + sTemp;
      end;
    end;
    Result := sMsg;
  end;

var
  FColor, BColor: integer;
  boSys: Boolean;
  Actor: TActor;
  sData, UserName: string;
  idx: integer;
  UserSayType: TUserSayType;
begin
  if sbody = '' then Exit;
  sData := sbody;

  {if Msg.Ident <> SM_SYSMESSAGE then begin
    sData := AnsiReplaceText(sData, #6, '');
    sData := AnsiReplaceText(sData, #7, '');
    sData := AnsiReplaceText(sData, #5, '');
  end;   }

  FColor := GetRGB(Lobyte(msg.Param));
  BColor := GetRGB(Hibyte(msg.Param));

  sData := FormatSayStr(sData, UserName);

  boSys := False;
  idx := g_MyBlacklist.IndexOf(UserName);
  case Msg.Ident of
    SM_HEAR: begin
        if idx > -1 then exit;
        Actor := PlayScene.FindActor(Msg.Recog);
        if Actor <> nil then
          Actor.Say(sData);
        UserSayType := us_Hear;
      end;
    SM_CRY: begin
        if idx > -1 then exit;
        UserSayType := us_Cry;
      end;
    SM_WHISPER: begin
        if idx > -1 then exit;
        UserSayType := us_Whisper;
      end;
    LM_WHISPER: begin
        if idx > -1 then exit;
        UserSayType := us_Lover;
      end;
    ME_WHISPER: begin
        if idx > -1 then exit;
        UserSayType := us_Master;
      end;
    SM_GROUPMESSAGE: begin
        if idx > -1 then exit;
        UserSayType := us_Group;
      end;
    SM_GUILDMESSAGE: begin
        if idx > -1 then exit;
        UserSayType := us_Guild;
        FrmDlg.AddGuildChat (sData);
      end;
    SM_GUILDAILLY: begin
        if idx > -1 then exit;
        UserSayType := us_Guild;
        FrmDlg.AddGuildChat (sData);
      end;
    SM_SYSMESSAGE: begin
       { sData := AnsiReplaceText(sData, '#5', #5);
        sData := AnsiReplaceText(sData, '#6', #6);
        sData := AnsiReplaceText(sData, '#7', #7); }
        boSys := True;
        UserSayType := us_Sys;
      end;
    else exit;
  end;
  sData := AnsiReplaceText(sData, '#5', #5);
  sData := AnsiReplaceText(sData, '#6', #6);
  sData := AnsiReplaceText(sData, '#7', #7);

  DScreen.AddSayMsg(sData, FColor, BColor, boSys, UserSayType);
end;

procedure TfrmMain.ClientStorageSetPassWord();
begin
  FrmDlg.CloseMDlg;
  FrmDlg.DItemBag.Visible := False;
  g_Npcbookinx := -1;
  g_nMDlgX := -1;
  FrmDlg.ShowSetStoragePW;
end;

procedure TfrmMain.ClientStorageInputPassWord(mode: integer);
begin
  FrmDlg.DItemBag.Visible := False;
  FrmDlg.ShowInputStoragePW;
  m_nStorageMode := mode;
end;


procedure TfrmMain.ClientObjWakeUp(nItemIndex, mode: Integer; sData: string);
begin
    FrmMain.SendWakeUpItem(g_ItemWakeUpDlgItem.MakeIndex, FrmDlg.g_WakeUpMode, sData);
end;

procedure TfrmMain.ClientObjWakeUpItemOK(sData: string);
begin
  m_boWakeUp := False;
  if sData <> '' then begin
    DecodeBuffer(sData, @g_ItemWakeUpDlgItem, SizeOf(TClientItem));
  end;
  AddItemBag(g_ItemWakeUpDlgItem);

  DelWakeUpItem;

  FrmDlg.ClearWakeDlg;

  FrmDlg.DMessageDlg ('[' + g_ItemWakeUpDlgItem.S.Name + ']´Ó [' + g_ItemWakeUpList.Strings[FrmDlg.g_WakeUpItem] +
                       '] (' + IntToStr(g_ItemWakeUpDlgItem.S.btValue[18] - 1) + '½×¶Î)¾õÐÑµ½ (' +
                       IntToStr(g_ItemWakeUpDlgItem.S.btValue[18]) + '½×¶Î)³É¹¦ÁË¡£\×£ºØÄã!' ,[mbOk]);
  g_ItemWakeUpDlgItem.S.Name := '';
  //FrmDlg.DItemWakeUpDlg.Visible := True;
  //FrmDlg.DItemBag.Visible := True;
end;

procedure TfrmMain.ClientObjWakeUpItemFail(nFailCode, nMax: Integer;
  sData: string);
var
  Item: TClientItem;
begin
  if sData <> '' then begin
    DecodeBuffer(sData, @g_ItemWakeUpDlgItem, SizeOf(TClientItem));
  end;
  case nFailCode of
    0: begin
        m_boWakeUp := False;
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('Õâ¼þÎïÆ·²»ÄÜ¾õÐÑ¡£',[mbOk]);
      end;
    -1: begin
        m_boWakeUp := False;
        FrmDlg.DMessageDlg ('[' + g_ItemWakeUpDlgItem.S.Name + ']' + ' ¾õÐÑÊ§°Ü£¬ÆÆËéÁË¡£', [mbOk]);
        g_ItemWakeUpDlgItem.S.Name := '';
        DelWakeUpItem;
        FrmDlg.ClearWakeDlg;
       // FrmDlg.DItemWakeUpDlg.Visible := True;
       // FrmDlg.DItemBag.Visible := True;
      end;
    -2: begin
        m_boWakeUp := False;
        AddItemBag(g_ItemWakeUpDlgItem);
        g_ItemWakeUpDlgItem.S.Name := '';
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('²»ÄÜ¼ÌÐø¾õÐÑÁË¡£',[mbOk]);
      end;
    -3: begin
        m_boWakeUp := False;
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('½ð±Ò²»×ã¡£', [mbOk]);
      end;
    -4: begin
        m_boWakeUp := False;
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('²ÄÁÏ²»×ã¡£', [mbOk]);
      end;
  end;
end;


procedure TFrmMain.ClientGetMEList(msg: TDefaultMessage; body: string);    //»çÁ¦ ½ºÃÄ
var
  _state:   integer;
  _level:  integer;
  _Job:    integer;
  _Date:    string;
  _ServerDate: string;
  _OName:   string;
  _Name:    string;
  _Mode:    integer;
  _online:  integer;
  Count, i: integer;
  str:      string;
  infostr:  string;
  temp:     string;
begin
  str   := DecodeString(body);
  Count := msg.Param;

  for i := 0 to Count - 1 do begin
    str := GetValidStr3(str, infostr, ['/']);

    if infostr <> '' then begin
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _State  := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, _OName, [':']);
      infostr := GetValidStr3(InfoStr, _Name, [':']);

      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Level  := Str_ToInt(temp, 1);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Job    := Str_ToInt(temp, 0);

      infostr := GetValidStr3(InfoStr, _Date, [':']);
      infostr := GetValidStr3(InfoStr, _ServerDate, [':']);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Mode    := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _online    := Str_ToInt(temp, 0);

      fMentor.Add(_OName, _Name, _State, _Level, _Job, _Date, _ServerDate, _Mode , _online);

    end;
  end;
end;



procedure TFrmMain.ClientGetMEInfoList(msg: TDefaultMessage; body: string);    //»çÁ¦ ½ºÃÄ
var
  _state:   integer;
  _level:  integer;
  _Job:    integer;
  _Date:    string;
  _ServerDate: string;
  _OName:   string;
  _Name:    string;
  _Mode:    integer;
  _online:  integer;
  Count, i: integer;
  str:      string;
  infostr:  string;
  temp:     string;
begin
  str   := DecodeString(body);
  Count := msg.Param;

  for i := 0 to Count - 1 do begin
    str := GetValidStr3(str, infostr, ['/']);

    if infostr <> '' then begin
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _State  := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, _OName, [':']);
      infostr := GetValidStr3(InfoStr, _Name, [':']);

      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Level  := Str_ToInt(temp, 1);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Job    := Str_ToInt(temp, 0);

      infostr := GetValidStr3(InfoStr, _Date, [':']);
      infostr := GetValidStr3(InfoStr, _ServerDate, [':']);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Mode    := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _online    := Str_ToInt(temp, 0);

      fMentor.Change(_Name, _Level, _Job , _online);

    end;
  end;
end;



procedure TfrmMain.ClientObjDueltryFail(nFailCode: Integer);
begin
  g_dwQueryMsgTick := GetTickCount;
  case nFailCode of
    0: FrmDlg.DMessageDlg('ÌôÕ½Ê§°Ü¡£\ÌôÕ½µÄË«·½±ØÐëÃæ¶ÔÃæÕ¾×Å¡£', [mbOk]);
    -1: FrmDlg.DMessageDlg('ÄúµÄÌôÕ½ÉÐÎ´±»½ÓÊÜ¡£', [mbOk]);
    -2: FrmDlg.DMessageDlg('ÌôÕ½ÇëÇóÒÑ³¬³öÏÞÖÆ¡£', [mbOk]);
  else FrmDlg.DMessageDlg('ÌôÕ½ÇëÇóÊ§°Ü¡£', [mbOk]);
  end;
end;

procedure TfrmMain.ClientObjDuelMenu(sData: string);
begin

end;

procedure TfrmMain.ClientObjDuelCancel();
begin

end;


procedure TfrmMain.ClientObjDuelAddItemOK();
begin

end;

procedure TfrmMain.ClientObjDuelDelItemOK();
begin

end;

procedure TfrmMain.ClientObjDuelDelItemFail();
begin

end;

procedure TfrmMain.ClientObjDuelChgGoldOK(DefMsg: pTDefaultMessage);
begin

end;

procedure TfrmMain.ClientObjDuelChgGoldFail(DefMsg: pTDefaultMessage);
begin

end;

procedure TfrmMain.ClientObjDuelRemotChgGold(DefMsg: pTDefaultMessage);
begin

end;

procedure TfrmMain.ClientObjDuelStartCount(DefMsg: pTDefaultMessage);
begin

end;

procedure TfrmMain.ClientGetDuelRemoteAddItem(body: string);
begin

end;

procedure TfrmMain.ClientGetDuelRemoteDelItem(body: string);
begin

end;

procedure TFrmMain.ClientGetLMList(msg: TDefaultMessage; body: string);    //¿¬ÀÎ ½ºÃÄ
var
  _state:   integer;
  _level:   integer;
  _Sex:     integer;
  _Date:    string;
  _ServerDate: string;
  _Name:    string;
  _MapInfo: string;
  Count, i: integer;
  str:      string;
  infostr:  string;
  temp:     string;
begin
  str   := DecodeString(body);
  Count := msg.Param;

  for i := 0 to Count - 1 do begin
    str := GetValidStr3(str, infostr, ['/']);

    if infostr <> '' then begin
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _State  := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, _Name, [':']);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Level  := Str_ToInt(temp, 1);
      infostr := GetValidStr3(InfoStr, temp, [':']);
      _Sex    := Str_ToInt(temp, 0);
      infostr := GetValidStr3(InfoStr, _Date, [':']);
      infostr := GetValidStr3(InfoStr, _ServerDate, [':']);
      infostr := GetValidStr3(InfoStr, _MapInfo, [':']);

      fLover.Add(g_MySelf.m_sUserName, _Name, _State, _Level, _Sex,
        _Date, _ServerDate, _MapInfo);

    end;
  end;
end;

procedure TFrmMain.ClientGetLMOptionChange(msg: TDefaultMessage);          //¿¬ÀÎ ½ºÃÄ
var
  optiontype, enable: integer;
begin
  optiontype := msg.Param;
  enable     := msg.Tag;
  case optiontype of
    1: begin  //¿¬ÀÎ
      fLover.SetEnable(rsState_Lover, enable);
      if enable = 1 then
        DScreen.AddChatBoardString('ÔÊÐíÇó»é', clRed, clWhite)
      else
        DScreen.AddChatBoardString('¾Ü¾øÇó»é',
          clRed, clWhite);
    end;
    2: begin  //»çÁ¦
      fMentor.SetEnable(rsState_Master, enable);
    end;
  end;
end;

procedure TFrmMain.ClientGetLMRequest(msg: TDefaultMessage; body: string);   //¿¬ÀÎ ½ºÃÄ
var
  str , str2 , g_Name:string;
  ReqType: integer;
  ReqSeq:  integer;
begin
//  str := DecodeString (body);

  str := GetValidStr3 (body, str2, ['/']);
  g_Name := Trim (str);

  ReqType := msg.Param;
  ReqSeq  := msg.Tag;

  case ReqType of
    RsState_Lover: begin
      case ReqSeq of
        RsReq_WhoWantJoin: begin
          if mrYes = FrmDlg.DMessageDlg(str2+'Ìá³öÁË½á»éµÄÇëÇó£¬\½á»éµÄ»°Àë»éÐèÒªÖ§¸¶10Íò½ð±ÒµÄ·ÑÓÃ¡£\ÄãÊÇ·ñÍ¬Òâ½á»é£¿',
            [mbYes, mbNo]) then
            SendLMRequest(ReqType, RsReq_AloowJoin)
          else
            SendLMRequest(ReqType, RsReq_DenyJoin);
        end;
      end;
    end;

    RsState_Master: begin  //»çÁ¦ ½ºÃÄ
      case ReqSeq of
        RsReq_WhoWantJoin: begin
          if mrYes = FrmDlg.DMessageDlg(str2+'ÏëÒª°ÝÄãÎªÊ¦£¬ÄãÊÇ·ñÍ¬Òâ£¿',
            [mbYes, mbNo]) then
            SendMERequest(ReqType, RsReq_AloowJoin, 1, str2)
          else
            SendMERequest(ReqType, RsReq_DenyJoin, 1, str2);
        end;
      end;
    end;

  end;
end;

procedure TFrmMain.ClientGetLMResult(msg: TDefaultMessage; body: string);      //¿¬ÀÎ ½ºÃÄ
var
  str:     string;
  reqtype: integer;
  errcode: integer;
  level  : integer;
  Day :    integer;
begin
  str     := DecodeString(body);
  reqtype := msg.Param;
  errcode := msg.Tag;
  level   := msg.Series;
  Day     := msg.Recog;

  case reqtype of
    RsState_Lover: begin
      case errcode of
        RsError_SuccessJoin://= 1;
        begin
          PlaySound(154);
          if g_FriendList.IndexOf(str) = 0 then begin
            //
          end else begin
            SendClientMessage(CM_FRIEND_CHENGE, 0, 0, 0, 0, str);
          end;
        end;
        RsError_SuccessJoined://= 2;
        begin
          PlaySound(154);
          if g_FriendList.IndexOf(str) = 0 then begin
            //
          end else begin
            SendClientMessage(CM_FRIEND_CHENGE, 0, 0, 0, 0, str);
          end;
        end;
         RsError_DontJoin       ://= 3;         // Âü°¡ÇÒ ¼ö ¾ø´Ù
            FrmDlg.DMessageDlg (str+'ÊÇ·ñÍ¬Òâ½á»é?', [mbOK]);
        RsError_DontLeave      ://= 4;         // ¶°³¯¼ö ¾ø´Ù.
            FrmDlg.DMessageDlg (str+'²»ÄÜÀë»é¡£', [mbOK]);
        RsError_RejectMe       ://= 5;         // °ÅºÎ»óÅÂÀÌ´Ù
            FrmDlg.DMessageDlg ('ÄãÏÖÔÚ²»Í¬Òâ½á»é¡£\Çëµã»÷¹ØÏµ½çÃæµÄÔÊÐíÇó»é°´Å¥¡£', [mbOK]);
        RsError_RejectOther    ://= 6;         // °ÅºÎ»óÅÂÀÌ´Ù
            FrmDlg.DMessageDlg (str+'²»ÔÊÐíÇó»é¡£', [mbOK]);
        RsError_LessLevelMe    ://= 7;         // ³ªÀÇ·¹º§ÀÌ ³·´Ù
            FrmDlg.DMessageDlg ('Ö»ÓÐµÈ¼¶³¬¹ý22¼¶ÒÔÉÏ²Å¿ÉÒÔ½á»é¡£', [mbOK]);
        RsError_LessLevelOther ://= 8;         // »ó´ë¹æÀÇ·¹º§ÀÌ ³·´Ù
            FrmDlg.DMessageDlg (str+'µÄµÈ¼¶Ã»ÓÐ22¼¶¡£', [mbOK]);
        RsError_EqualSex       ://= 9;         // ¼ºº°ÀÌ °°´Ù
            FrmDlg.DMessageDlg ('Í¬ÐÔÖ®¼ä²»ÄÜ½á»é¡£', [mbOK]);
        RsError_FullUser       ://= 10;        // Âü¿©ÀÎ¿øÀÌ °¡µæÃ¡´Ù
            FrmDlg.DMessageDlg (str+'ÒÑ¾­½á»éÁË£¬²»ÄÜÍ¬Ê±ºÍÁ½¸öÈË½á»é¡£', [mbOK]);
        RsError_CancelJoin     ://= 11;        // Âü°¡Ãë¼Ò
            DScreen.AddChatBoardString ('ÄãÒÑ¾­È¡ÏûÁËÇó»é¡£',clGreen,clWhite);
        RsError_DenyJoin       ://= 12;        // Âü°¡¸¦ °ÅÀýÇÔ
            FrmDlg.DMessageDlg (str+'¾Ü¾øÁËÄãµÄÇó»é¡£', [mbOK]);
        RsError_DontDelete     ://= 13;        // Å»Åð½ÃÅ³¼ö ¾ø´Ù.
            FrmDlg.DMessageDlg (str+'²»ÄÜÀë»é¡£', [mbOK]);
        RsError_SuccessDelete  ://= 14;        // Å»Åð½ÃÄ×À½
            begin
                PlaySound(155);
               FrmDlg.DMessageDlg (str+'ºÍÄãÀë»éÁË¡£', [mbOK]);
            end;
        RsError_NotRelationShip://= 15;        // ±³Á¦»óÅÂ°¡ ¾Æ´Ï´Ù.
            FrmDlg.DMessageDlg ('²»ÔÊÐíÇó»é¡£', [mbOK]);
      end;
    end;


    RsState_Master: begin    //»çÁ¦ ½ºÃÄ
      case errcode of
        Error_SuccessJoin://= 1;
            FrmDlg.DMessageDlg (str+'ÊÕÍ½³É¹¦¡£', [mbOK]);
        Error_SuccessJoined://= 2;
            FrmDlg.DMessageDlg (str+'°ÝÊ¦³É¹¦¡£', [mbOK]);
        Error_DontJoin       ://= 3;         // Âü°¡ÇÒ ¼ö ¾ø´Ù
            FrmDlg.DMessageDlg (str+'¾Ü¾øÁËÄãµÄÇëÇó¡£', [mbOK]);
        Error_FullUserOther  ://= 4;        // Âü¿©ÀÎ¿øÀÌ °¡µæÃ¡´Ù
            FrmDlg.DMessageDlg ('¶Ô·½ÒÑ¾­ÓÐÍ½µÜÁË¡£', [mbOK]);
        Error_RejectOther    ://= 5;         // °ÅºÎ»óÅÂÀÌ´Ù
            FrmDlg.DMessageDlg ('ÄãÒÑ¾­ÓÐÊ¦¸µÁË¡£¡£', [mbOK]);
        Error_HighLevelMe    ://= 6;         // ³ªÀÇ·¹º§ÀÌ ³·´Ù
            FrmDlg.DMessageDlg ('µÈ¼¶ '+ IntToStr(level) +'¼¶ÒÔÏÂ²Å¿ÉÒÔ°ÝÊ¦¡£', [mbOK]);
        Error_LessLevelOther ://= 7;         // »ó´ë¹æÀÇ·¹º§ÀÌ ³·´Ù
            FrmDlg.DMessageDlg ('µÈ¼¶ ' + IntToStr(level) + ' ¼¶ÒÔÉÏ²Å¿ÉÒÔÊÕÍ½¡£', [mbOK]);
        Error_FullUser       ://= 8;        // Âü¿©ÀÎ¿øÀÌ °¡µæÃ¡´Ù
            FrmDlg.DMessageDlg ('¶Ô·½²»ÄÜÔÙÊÕÍ½ÁË¡£', [mbOK]);
        Error_DenyJoin       ://= 10;        // Âü°¡¸¦ °ÅÀýÇÔ
            FrmDlg.DMessageDlg (str+'¾Ü¾øÁËÄãµÄÇëÇó¡£', [mbOK]);
        Error_DontDelete     ://= 11;        // Å»Åð½ÃÅ³¼ö ¾ø´Ù.
            FrmDlg.DMessageDlg (str+'²»ÄÜÖÕÖ¹Ê¦Í½¹ØÏµ¡£', [mbOK]);

        Error_SuccessDelete  ://= 12;        // Å»Åð½ÃÄ×À½
             FrmDlg.DMessageDlg ('ÄãÒÑ¾­±³ÅÑÁËÊ¦ÃÅ¡£\Ê¦Í½¹ØÏµÒÑ¾­¶Ï¾øÁË¡£', [mbOK]);
        Error_NotRelationShip://= 13;        // ±³Á¦»óÅÂ°¡ ¾Æ´Ï´Ù.
            FrmDlg.DMessageDlg ('ÄãÃÇ²»ÊÇÊ¦Í½¹ØÏµ¡£', [mbOK]);
        Error_RejectBroken: //=14;
            FrmDlg.DMessageDlg ('ÄãÃÇÒÑ¾­¶Ï¾øÁËÊ¦Í½¹ØÏµ¡£\'+
               FormatDateTime('yyyyÄêmmÔÂddÈÕhhÊ±nn·Ö' , UnixToDateTime(Day))  + ' ÒÔºó²Å¿ÉÒÔ¼ÌÐø°ÝÊ¦ÊÕÍ½¡£', [mbOK]);
        Error_RejectMeBroken://= 15;
            FrmDlg.DMessageDlg ('¶Ô·½ÒÑ¾­¶Ï¾øÁËÊ¦Í½¹ØÏµ¡£\'+
               FormatDateTime('yyyyÄêmmÔÂddÈÕhhÊ±nn·Ö' , UnixToDateTime(Day))  + ' ÒÔºó²Å¿ÉÒÔ¼ÌÐø°ÝÊ¦ÊÕÍ½¡£', [mbOK]);
        Error_SuccessDelete2  ://= 16;        // Å»Åð½ÃÄ×À½
             FrmDlg.DMessageDlg (IntToStr(level) +'¼¶Äã»á³öÊ¦¡£\Ê¦Í½¹ØÏµ»á×Ô¶¯½âÉ¢¡£', [mbOK]);
      end;
    end;


  end;
end;

procedure TFrmMain.ClientGetLMDelete(msg: TDefaultMessage; body: string);      //¿¬ÀÎ ½ºÃÄ
var
  str:     string;
  ReqType: integer;
begin
  str     := DecodeString(body);
  ReqType := msg.Param;

  if ReqType = RsState_Lover then begin
   fLover.Delete(str);
  end else
  if ReqType = RsState_Master then begin
   fMentor.Delete(Str);
  end;
end;

procedure TfrmMain.EnableRogue();
begin
  g_nRogueEnabled := 1;
  //ShowMessage('Enabled');
end;

procedure TfrmMain.DisableRogue();
begin
  g_nRogueEnabled := 0;
  //ShowMessage('Disabled');
end;

procedure TfrmMain.ClientObjStruck(Msg: TDefaultMessage;
  sData: string);
var
  MessageBodyWL: TMessageBodyWL;
  Actor: TActor;
begin
  DecodeBuffer(sData, @MessageBodyWL, SizeOf(TMessageBodyWL));
  Actor := PlayScene.FindActor(Msg.Recog);
  if Actor <> nil then begin
    if Actor.m_btRace in [240..251] then begin

    end else begin
      if Actor = g_MySelf then begin
        g_nRunReadyCount:= 0;
        if g_MySelf.m_nNameColor = 249 then
          g_dwLatestStruckTick := GetTickCount;

      end else begin
        if Actor.CanCancelAction then
          Actor.CancelAction;
      end;
      if Actor.m_nState and $00000100 <> 0 then begin //±Ý°­ºÒ±«

      end else
        Actor.UpdateMsg(SM_STRUCK, MessageBodyWL.lTag2, 0,
          Msg.series {damage}, MessageBodyWL.lParam1, MessageBodyWL.lParam2,
          '', MessageBodyWL.lTag1);

      GetMoveHPShow(Actor, msg.Series);
      Actor.m_Abil.HP := Msg.param;
      Actor.m_Abil.MaxHP := Msg.tag;

      if Actor.m_Group <> nil then begin
        Actor.m_Group.ClientGroup.HP := msg.Param;
        Actor.m_Group.ClientGroup.MaxHP := Msg.tag;
      end;
    end;
  end;
end;

procedure TfrmMain.ClientHeroCreate(merchant: Integer);    //¿µ¿õ °í¿ë
begin
  FrmDlg.CloseDSellDlg;
  g_nCurMerchant := merchant;

  FrmDlg.ShowCreateHeroNew;
  FrmDlg.CloseMDlg;
  g_Npcbookinx := -1;
end;

procedure TfrmMain.ClientGetHeroInfo(DefMsg: pTDefaultMessage);
begin
  g_MySelf.m_boHero := ByteToBool(DefMsg.Series);
  if g_MySelf.m_boHero then begin
    FrmDlg.DButtonMenuHero.Visible := True;
    FrmDlg.DButtonReCallHero.Visible := True;
  end else begin
    FrmDlg.DButtonMenuHero.Visible := False;
    FrmDlg.DButtonReCallHero.Visible := False;
  end;
end;

procedure TfrmMain.ClientObjHeroLogOn(DefMsg: pTDefaultMessage; sData: string);
var
  Actor: TActor;
  MsgWL: TMessageBodyWL;
begin
  DecodeBuffer(sData, @MsgWL, SizeOf(TMessageBodyWL));

  PlayScene.SendMsg(SM_HEROLOGON, DefMsg.Recog,
    DefMsg.param {x},
    DefMsg.tag {y},
    DefMsg.series {dir},
    MsgWL.lParam1, //desc.Feature,
    MsgWL.lParam2, //desc.Status,
    '');
  if (MsgWL.lTag2 = g_MySelf.m_nRecogId) then begin
    Actor := PlayScene.FindActor(DefMsg.Recog);
    if Actor <> nil then begin
      g_MyHero := THumActor(Actor);
      FillChar(g_AutoPotItems, SizeOf(TClientItem) * 2, #0);
      FrmDlg.ShowHeroControl;
    end;
  end;
end;

procedure TfrmMain.ClientObjHeroLogOnOK(DefMsg: pTDefaultMessage);
var
  Actor: TActor;
begin
  if g_MyHero <> nil then begin
    SendClientMessage(CM_HEROLOGON_OK, 0, 0, 0, 0);
  end;
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    g_boHeroAiMode := DefMsg.Param;
    THumActor(Actor).m_boisHero := True;
    Actor.m_boisHero := True;
  end;
end;

procedure TfrmMain.ClientObjHeroLogOut(DefMsg: pTDefaultMessage);
var
  Actor: TActor;
begin
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if (Actor <> nil) {and (Actor = g_MyHero)} then begin
    Actor.SendMsg(SM_HEROLOGOUT, DefMsg.Recog, DefMsg.param, DefMsg.tag, 0, 0, '', 0);
  end;
end;


procedure TfrmMain.ClientObjHeroLogOutOK(nRecog: Integer);
var
  I: Integer;
  Actor: TActor;
begin
  g_boHeroProtect := False;
  if g_MyHero <> nil then begin
    g_MyHero := nil;
  end;
  for I := 0 to g_HeroMagicList.Count - 1 do begin
    Dispose(PTClientMagic(g_HeroMagicList.Items[I]));
  end;
  g_HeroMagicList.Clear;

  FillChar(g_HeroUseItems, SizeOf(TClientItem) * MAXHEROUSEITEM, #0);
  FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
  FillChar(g_HeroStoreItem, sizeof(TClientItem)* MAXSTORAGEITEMCL, #0);
  FrmDlg.CloseHeroAllWindows;

  g_HeroBuffList.Clear;
  FrmDlg.ShowHeroControl;
end;


procedure TfrmMain.ClientObjHeroAbility(DefMsg: pTDefaultMessage;
  sData: string);
var
  Actor: TActor;
begin
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    DecodeBuffer(sData, @Actor.m_Abil, SizeOf(TAbility));
    Actor.m_btJob := LoByte(DefMsg.param);
    Actor.m_btSex := HiByte(DefMsg.param);
    Actor.m_btLimitLevel := LoByte(DefMsg.tag);
    g_boHeroAiMode := HiByte(DefMsg.tag);
    Actor.m_btHeroAutoDurg := LoByte(DefMsg.series);      //ability
    Actor.m_boisHero := True;
    g_MyHero.m_boisHero := True;
    g_boHeroProtect := True;
  end;
end;

procedure TfrmMain.ClientObjHeroSubAbility(DefMsg: pTDefaultMessage);
begin
  g_nMyHeroHitPoint := LoByte(DefMsg.param);
  g_nMyHeroSpeedPoint := HiByte(DefMsg.param);
  g_nMyHeroAntiPoison := LoByte(DefMsg.tag);
  g_nMyHeroPoisonRecover := HiByte(DefMsg.tag);
  g_nMyHeroHealthRecover := LoByte(DefMsg.series);
  g_nMyHeroSpellRecover := HiByte(DefMsg.series);
  g_nMyHeroAntiMagic := LoByte(LongWord(DefMsg.Recog));
  g_nMyHeroLuckPoint := Hibyte(LongWord(DefMsg.Recog));//Çà¿îÇ¥½Ã
end;


procedure TfrmMain.ClientGetHeroBagItmes(DefMsg: pTDefaultMessage; body: string);
var
  sData, Str: string;
  cu: TClientItem;
  sMsg: String;
begin
  //ClearHeroBag;
  sData := body;
  while True do begin
    if sData = '' then Break;
    sData := GetValidStr3(sData, Str, ['/']);
    if Str <> '' then begin
      DecodeBuffer(Str, @cu, SizeOf(TClientItem));
      AddHeroItemBag(cu);
    end;
  end;
  ArrangeHeroItemBag;

  g_MyHero.m_btHeroAutoDurg := DefMsg.Tag;     //bag

  if DefMsg.Series = 1 then begin
    sMsg := g_MyHero.m_sUserName  + ': ' + g_MySelf.m_sUserName + ' ¼ûµ½ÄãºÜ¸ßÐË¡£';
    DScreen.AddChatBoardString(sMsg, GetRGB(0), GetRGB(239));
    g_MyHero.Say(sMsg);
    FrmDlg.DSkillBar.Visible := False;
  end;
end;


procedure TfrmMain.ClientGetHeroAddItem(body: string);
var
  cu: TClientItem;
begin
  if body <> '' then begin
    DecodeBuffer(body, @cu, SizeOf(TClientItem));
    AddHeroItemBag(cu);
    case cu.S.Grade of
      0, 1 : DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
      2: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
      3: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
      4: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
    end;
  end;
end;

procedure TfrmMain.ClientGetHeroAddItem2 (body: string;idx:integer);  //¹°¾à
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddHeroItemBag2 (cu);
     case idx of
      1: begin
        case cu.S.Grade of
          0, 1 : DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
          2: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
          3: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
           4: DScreen.AddSysMsg ('Ó¢ÐÛµÄ ' + '<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> ±»·¢ÏÖ¡£',40,60, clWhite);
        end;
      end;
     end;
   end;
end;

procedure TfrmMain.ClientGetSendHerouseItems(body: string); //Ó¢ÐÛ×°±¸
var
  Index: Integer;
  Str, Data, sMsg: string;
  cu: TClientItem;
begin
  FillChar(g_HeroUseItems, SizeOf(TClientItem) * High(g_HeroUseItems), #0);
  sMsg := body;
  while True do begin
    if sMsg = '' then Break;
    sMsg := GetValidStr3(sMsg, Str, ['/']);
    sMsg := GetValidStr3(sMsg, Data, ['/']);
    Index := Str_ToInt(Str, -1);
    if Index in [0..MAXHEROUSEITEM] then begin
      if Data <> '' then begin
        DecodeBuffer(Data, @cu, SizeOf(TClientItem));
        g_HeroUseItems[Index] := cu;
      end;
    end;
  end;
end;

procedure TfrmMain.ClientObjHeroBagCount(DefMsg: pTDefaultMessage);
var
  Actor: TActor;
begin
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if (Actor <> nil) and (Actor is THumActor) then begin
    THumActor(Actor).m_nBagCount := DefMsg.param;
    Actor.m_boisHero := True;
    THumActor(Actor).m_boisHero := True;
    if g_MyHero <> nil then
    g_MyHero.m_nBagCount := DefMsg.param;
  end;
end;


procedure TfrmMain.ClientObjHeroTakeOnOK(DefMsg: pTDefaultMessage; sData: string);
var
  I: Integer;
  sWhere: string;
  nWhere: Integer;
  sItemName, sMsg: string;
  sMakeIndex: string;
  nMakeIndex: Integer;
begin
  sMsg := '';
  if g_MyHero <> nil then begin
    g_MyHero.m_nFeature := DefMsg.Recog;
    if g_WaitingUseItem.Item.S.Name = '' then begin
      sData := GetValidStr3(sData, sWhere, ['/']);
      sData := GetValidStr3(sData, sItemName, ['/']);
      sData := GetValidStr3(sData, sMakeIndex, ['/']);
      nWhere := Str_ToInt(sWhere, -1);
      nMakeIndex := Str_ToInt(sMakeIndex, -1);

      if nWhere in [0..MAXHEROUSEITEM] then begin
        for I := 0 to g_MyHero.m_nBagCount - 1 do begin
          if g_HeroItemArr[I].S.Name <> '' then begin
            if (g_HeroItemArr[I].S.Name = sItemName) and (g_HeroItemArr[I].MakeIndex = nMakeIndex) then begin
              g_HeroUseItems[nWhere] := g_HeroItemArr[I];
              g_HeroItemArr[I].S.Name := '';

              sMsg := g_MyHero.m_sUserName + ' ´©ÉÏÁË ' + g_HeroUseItems[nWhere].S.Name + ' ¡£';
              DScreen.AddChatBoardString(sMsg, GetRGB(0), GetRGB(239));
              g_MyHero.Say(sMsg);

              Break;
            end;
          end;
        end;
      end;
    end else begin
      if g_WaitingUseItem.Index in [0..MAXHEROUSEITEM] then
        g_HeroUseItems[g_WaitingUseItem.Index] := g_WaitingUseItem.Item;

        sMsg := g_MyHero.m_sUserName + '´©ÉÏÁË ' + g_HeroUseItems[g_WaitingUseItem.Index].S.Name + ' ¡£';
        DScreen.AddChatBoardString(sMsg, GetRGB(0), GetRGB(239));
        g_MyHero.Say(sMsg);
    end;
    g_WaitingUseItem.Item.S.Name := '';
    g_MyHero.FeatureChanged;
  end;
end;

procedure TfrmMain.ClientObjHeroTakeOnFail();
begin
  AddHeroItemBag(g_WaitingUseItem.Item);
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjHeroTakeOffOK(DefMsg: pTDefaultMessage; sData: string);
var
  sWhere: string;
  nWhere: Integer;
  sItemName: string;
  sMakeIndex: string;
  nMakeIndex: Integer;
begin
  if g_MyHero <> nil then begin

    g_MyHero.m_nFeature := DefMsg.Recog;
    g_MyHero.FeatureChanged;
    if g_WaitingUseItem.Item.S.Name = '' then begin
      sData := GetValidStr3(sData, sWhere, ['/']);
      sData := GetValidStr3(sData, sItemName, ['/']);
      sData := GetValidStr3(sData, sMakeIndex, ['/']);
      nWhere := Str_ToInt(sWhere, -1);
      nMakeIndex := Str_ToInt(sMakeIndex, -1);
      if nWhere in [0..MAXHEROUSEITEM] then begin
        if (g_HeroUseItems[nWhere].S.Name = sItemName) and (g_HeroUseItems[nWhere].MakeIndex = nMakeIndex) then begin
          g_HeroUseItems[nWhere].S.Name := '';
        end;
      end;
    end;
    g_WaitingUseItem.Item.S.Name := '';
  end;
end;

procedure TfrmMain.ClientObjHeroTakeOffFail();
var
  nIndex: Integer;
begin
  if g_WaitingUseItem.Index < 0 then begin
    nIndex := -(g_WaitingUseItem.Index + 1);
    g_HeroUseItems[nIndex] := g_WaitingUseItem.Item;
  end;
  g_WaitingUseItem.Item.S.Name := '';
end;


procedure TfrmMain.ClientObjToMasterBagOK();  //¿µ¿õ > ÁÖÀÎ °¡¹æÀ¸·Î
begin
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToMasterBagFail();   //¿µ¿õ > ÁÖÀÎ °¡¹æ ÀÌµ¿ ½ÇÆÐ
begin
  if g_WaitingUseItem.Item.S.Name <> '' then begin
    AddHeroItemBag(g_WaitingUseItem.Item);
  end;
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToHeroBagOK();        //ÁÖÀÎ > ¿µ¿õ °¡¹æÀ¸·Î
begin
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToHeroBagFail();   //ÁÖÀÎ > ¿µ¿õ °¡¹æ ÀÌµ¿ ½ÇÆÐ
begin
  if g_WaitingUseItem.Item.S.Name <> '' then begin
    AddItemBag(g_WaitingUseItem.Item);
  end;
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TFrmMain.SendLMOptionChange(OptionType: integer; Enable: integer);      //¿¬ÀÎ ½ºÃÄ
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_LM_OPTION, OptionType, Enable, 0, 0);
  SendSocket(EncodeMessage(msg));
end;


procedure TfrmMain.ClientObjHeroEatOK(DefMsg: pTDefaultMessage);
var
  sMsg: String;
begin
  if g_MyHero <> nil then begin
    if ((g_HeroEatingItem.S.StdMode = 3) and (g_HeroEatingItem.S.Shape = 12))
     or ((g_HeroEatingItem.S.StdMode = 2) and (g_HeroEatingItem.S.Shape in [16,22,24])) then begin
      sMsg := g_MyHero.m_sUserName + ': ' + 'µÄ×ÊÖÊÌá¸ßÁË¡£';
      DScreen.AddChatBoardString(sMsg, GetRGB(0), GetRGB(239));
      g_MyHero.Say(sMsg);
    end;
    g_HeroEatingItem.S.Name := '';
    ArrangeHeroItemBag;
    g_MyHero.m_btLimitLevel := DefMsg.Tag;
    g_MyHero.m_btHeroAutoDurg := DefMsg.Param;   //eat
  end;

end;

procedure TfrmMain.ClientObjHeroEatFail();
begin 
  if g_MyHero <> nil then begin
    AddHeroItemBag(g_HeroEatingItem);
    g_HeroEatingItem.S.Name := '';
  end;
end;

procedure TfrmMain.ClientGetHeroMagicLvExp(magid, maglv, magtrain: Integer);
var
  I: Integer;
begin
  for I := 0 to g_HeroMagicList.Count - 1 do begin
    if PTClientMagic(g_HeroMagicList[I]).Def.wMagicId = magid then begin
      PTClientMagic(g_HeroMagicList[I]).Level := maglv;
      PTClientMagic(g_HeroMagicList[I]).CurTrain := magtrain;
      Break;
    end;
  end;
end;

procedure TfrmMain.ClientGetHeroDuraChange(uidx, newdura, newduramax: Integer);
begin
  if uidx in [0..MAXHEROUSEITEM] then begin
    if g_HeroUseItems[uidx].S.Name <> '' then begin
      if newdura < 0 then begin
        g_HeroUseItems[uidx].Dura :=0;
      end else
      g_HeroUseItems[uidx].Dura := newdura;
      g_HeroUseItems[uidx].DuraMax := newduramax;
    end;
  end;
end;

procedure TfrmMain.ClientObjHeroWeigthChanged(DefMsg: pTDefaultMessage);
begin
  if g_MyHero <> nil then begin
    g_MyHero.m_Abil.Weight := DefMsg.Recog;
    g_MyHero.m_Abil.WearWeight := DefMsg.param;
    g_MyHero.m_Abil.HandWeight := DefMsg.tag;
  end;
end;

procedure TfrmMain.ClientObjHeroWinExp(DefMsg: pTDefaultMessage);
begin
  if g_MyHero <> nil then begin
    g_MyHero.m_Abil.Exp := LongWord(DefMsg.Recog);
    if g_MoExpMsg then begin
      if LongWord(MakeLong(DefMsg.Param, DefMsg.Tag)) = 1 then
        DScreen.AddSysMsg('Ó¢ÐÛ»ñµÃÁË 1 µã¾­ÑéÖµ¡£', 30, 60, clWhite)
      else DScreen.AddSysMsg('Ó¢ÐÛ»ñµÃÁË <CO$FFFF>' + GetGoldStr(LongWord(MakeLong(DefMsg.param, DefMsg.tag))) + '<CE> µã¾­ÑéÖµ¡£', 30, 60, clWhite);
    end else begin
      if LongWord(MakeLong(DefMsg.Param, DefMsg.Tag)) = 1 then
        DScreen.AddChatBoardString ('Ó¢ÐÛ»ñµÃÁË 1 µã¾­ÑéÖµ¡£',clWhite, clRed)
      else DScreen.AddChatBoardString ('Ó¢ÐÛ»ñµÃÁË ' + GetGoldStr(LongWord(MakeLong(DefMsg.Param, DefMsg.Tag))) +' µã¾­ÑéÖµ¡£',clWhite, clRed);
    end;
  end;
end;

procedure TfrmMain.ClientObjHeroLevelUp(DefMsg: pTDefaultMessage);
var
  I: Integer;
  Actor: TActor;
begin
  i := MakeLong(DefMsg.Tag, DefMsg.Series);
  Actor := PlayScene.FindActor (i);
  Actor.FeatureChanged;
  if Actor <> nil then begin
    if Actor = g_MyHero then begin
      g_MyHero.m_Abil.Level:=DefMsg.Recog;
      if DefMsg.Param <> 1 then
      DScreen.AddChatBoardString ('×£ºØÄã£¬ÄãºÍÓ¢ÐÛÉý¼¶ÁË¡£ HP,MP»Ö¸´Õý³£ÁË¡£',$00800000, $00F7B5CE);
    end;
  end;
end;

procedure TFrmMain.SendLMRequest(ReqType: integer; ReqSeq: integer);       //¿¬ÀÎ ½ºÃÄ
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_LM_REQUEST, ReqType, ReqSeq, 0, 0);
  SendSocket(EncodeMessage(msg));
end;

procedure TFrmMain.SendLMSeparate(ReqType: integer; Data: string);       //¿¬ÀÎ ½ºÃÄ
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_LM_DELETE, ReqType, 0, 0, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(Data));
end;


procedure TFrmMain.SendMERequest(ReqType: integer; ReqSeq: integer; ReqRe: integer; Data: string);      //»çÁ¦ ½ºÃÄ
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_ME_REQUEST, ReqType, ReqSeq, ReqRe, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(Data));
end;

procedure TFrmMain.SendMESeparate(ReqType: integer; Data: string);      //»çÁ¦ ½ºÃÄ
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_ME_DELETE, ReqType, 0, 0, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(Data));
end;


procedure TfrmMain.SendPassword(sPassword: String;nIdent:Integer);
begin
   SendClientMessage(CM_PASSWORD,0,nIdent,0,0,sPassword);
end;

procedure TfrmMain.SetInputStatus;
begin
  if m_boPasswordIntputStatus then begin
    m_boPasswordIntputStatus:=False;
    PlayScene.EdChat.PasswordChar:=#0;
    PlayScene.EdChat.Visible:=False;
  end else begin
    m_boPasswordIntputStatus:=True;
    PlayScene.EdChat.PasswordChar:='*';
    PlayScene.EdChat.Visible:=True;
    PlayScene.EdChat.SetFocus;
  end;
end;

procedure TfrmMain.ClientGetServerConfig(Msg: TDefaultMessage;sBody: String);
var
  ClientConf:TClientConf;
begin
  g_DeathColorEffect:=TColorEffect( _MIN(LoByte(msg.Param),8) );
  g_boCanRunHuman:=LoByte(LoWord(msg.Recog)) = 1;
  g_boCanRunMon:=HiByte(LoWord(msg.Recog)) = 1;
  g_boCanRunNpc:=LoByte(HiWord(msg.Recog)) = 1;
  g_boCanRunAllInWarZone:=HiByte(HiWord(msg.Recog)) = 1;
  sBody:=DecodeString(sBody);
  DecodeBuffer(sBody,@ClientConf,SizeOf(ClientConf));
  g_boCanRunHuman        :=ClientConf.boRunHuman;
  g_boCanRunMon          :=ClientConf.boRunMon;
  g_boCanRunNpc          :=ClientConf.boRunNpc;
  g_boCanRunAllInWarZone :=ClientConf.boWarRunAll;
  g_DeathColorEffect     :=TColorEffect(_MIN(8,ClientConf.btDieColor));
  //g_nHitTime             :=ClientConf.wHitIime;
  //g_dwSpellTime          :=ClientConf.wSpellTime;
  g_nItemSpeed           :=ClientConf.btItemSpeed;
  g_boCanStartRun        :=ClientConf.boCanStartRun;
  g_boParalyCanRun       :=ClientConf.boParalyCanRun;
  g_boParalyCanWalk      :=ClientConf.boParalyCanWalk;
  g_boParalyCanHit       :=ClientConf.boParalyCanHit;
  g_boParalyCanSpell     :=ClientConf.boParalyCanSpell;
  g_boShowJobLevel       :=ClientConf.boShowJobLevel;
  g_boMagicLock          :=True;
  g_boAutoPuckUpItem     :=ClientConf.boAutoPuckUpItem;
end;

procedure TfrmMain.ProcessCommand(sData: String);
var
  sCmd,sCmd1,sParam1,sParam2,sParam3,sParam4,sParam5:String;
  I: Integer;
begin
  sData:=GetValidStr3(sData,sCmd1,[' ',':',#9]);
  sData:=GetValidStr3(sData,sCmd,[' ',':',#9]);
  sData:=GetValidStr3(sData,sParam1,[' ',':',#9]);
  sData:=GetValidStr3(sData,sParam2,[' ',':',#9]);
  sData:=GetValidStr3(sData,sParam3,[' ',':',#9]);
  sData:=GetValidStr3(sData,sParam4,[' ',':',#9]);
  sData:=GetValidStr3(sData,sParam5,[' ',':',#9]);

 { if CompareText(sCmd1,'@svninfo') = 0 then begin
    if CompareText(sCmd,'client') = 0 then begin
      // SVNÊý¾Ý
      if (SVN_ISTracking) and (SVN_DETAILS.Count > 0) then begin
        DScreen.AddChatBoardString ('SVNÐÅÏ¢:', clRed, clWhite);
        for I := 0 to SVN_DETAILS.Count-1 do DScreen.AddChatBoardString (' ['+inttostr(I+1)+'] '+SVN_DETAILS.Strings[I], clRed, clWhite);
        DScreen.AddChatBoardString ('SVNÐÞÕý: '+inttostr(SVN_REVISION), clWhite, clGreen);
      end
      else begin
        DScreen.AddChatBoardString ('Ã»ÓÐSVNÐÞÕýÊý¾Ý', clWhite, clRed);
      end;
      DScreen.AddChatBoardString ('ÐÞ¸ÄÊ±¼ä: '+FormatDateTime('dd mmm yyyy/hh:nn:ss',UnixToDateTime(BUILDTIME))+' ('+inttostr(BUILDTIME)+')', clWhite, clGreen);
    end
    else if CompareText(sCmd,'server') = 0 then begin
      DScreen.AddChatBoardString ('ÇëÇó·þÎñÆ÷ÐÅÏ¢..', clRed, clWhite);
      SendClientMessage(CM_SAY, 0, 0, 0, 0,'@svninfo '+sCmd);
    end
    else begin
      DScreen.AddChatBoardString ('!!ÇëÖ¸¶¨(client/server) (ÀýÈç:@svninfo client)', clWhite, clRed);
    end;
  end
  else }
  if CompareText(sCmd,'ShowHumanMsg') = 0 then begin
    CmdShowHumanMsg(sParam1,sParam2,sParam3,sParam4,sParam5);
    exit;
  end;
  {
  g_boShowMemoLog:=not g_boShowMemoLog;
  PlayScene.MemoLog.Clear;
  PlayScene.MemoLog.Visible:=g_boShowMemoLog;
  }
end;
procedure TfrmMain.CmdShowHumanMsg(sParam1,sParam2,sParam3,sParam4,sParam5: String);
var
  sHumanName:String;
begin
  sHumanName:=sParam1;
  if (sHumanName <> '') and (sHumanName[1] = 'C') then begin
    PlayScene.MemoLog.Clear;
    exit;
  end;

//  if sHumanName <> '' then begin
//    ShowMsgActor:=PlayScene.FindActor(sHumanName);
//    if ShowMsgActor = nil then begin
//      DScreen.AddChatBoardString(format('%sÃ»ÕÒµ½£¡£¡£¡',[sHumanName]),clWhite,clRed);
//      exit;
//    end;
//  end;
  g_boShowMemoLog := not g_boShowMemoLog;
  PlayScene.MemoLog.Clear;
  PlayScene.MemoLog.Visible:=g_boShowMemoLog;
end;

procedure TfrmMain.ShowHumanMsg(Msg:pTDefaultMessage);
  function GetIdent(nIdent:Integer):String;
  begin
    case nIdent of
      SM_RUSH       : Result:='SM_RUSH';
      SM_RUSHKUNG   : Result:='SM_RUSHKUNG';
      SM_FIREHIT    : Result:='SM_FIREHIT';
      SM_DEATHHIT   : Result:='SM_DEATHHIT'; //»ì»ýµµ
      SM_BACKSTEP   : Result:='SM_BACKSTEP';
      SM_TURN       : Result:='SM_TURN';
      SM_WALK       : Result:='SM_WALK';
      SM_DOWN       : Result:='SM_DOWN'; //¿ù¿µ¼ú
      SM_SITDOWN    : Result:='SM_SITDOWN';
      SM_RUN        : Result:='SM_RUN';
      SM_SPEEDRUN   : Result:='SM_SPEEDRUN'; //°æ½Åº¸
      SM_DOWNRUN    : Result:='SM_DOWNRUN'; //¿ù¿µ¼ú ´Þ¸®±â
      SM_HIT        : Result:='SM_HIT';
      SM_HEAVYHIT   : Result:='SM_HEAVYHIT';
      SM_FISHING1   : Result:='SM_FISHING1';     //³¬½Ã ½ÃÀÛ
      SM_FISHING2   : Result:='SM_FISHING2';     //³¬½Ã ³¡
      SM_BIGHIT     : Result:='SM_BIGHIT';
      SM_HITLEFT    : Result:='SM_HITLEFT'; //¿ÞÂÊ
      SM_SPELL      : Result:='SM_SPELL';
      SM_POWERHIT   : Result:='SM_POWERHIT';
      SM_WBHIT      : Result:='SM_WBHIT';       //Ç³°Ë¼ú
      SM_WBHIT2     : Result:='SM_WBHIT2';          //Ç³°Ë¼ú
      SM_LONGHIT    : Result:='SM_LONGHIT';
      SM_DIGUP      : Result:='SM_DIGUP';
      SM_DIGDOWN    : Result:='SM_DIGDOWN';
      SM_FLYAXE     : Result:='SM_FLYAXE';
      SM_LIGHTING   : Result:='SM_LIGHTING';
      SM_LIGHTING_1 : Result:='SM_LIGHTING_1';
      SM_LIGHTING_2 : Result:='SM_LIGHTING_2';
      SM_LIGHTING_3 : Result:='SM_LIGHTING_3';
      SM_LIGHTING_4 : Result:='SM_LIGHTING_4';
      SM_LIGHTING_5 : Result:='SM_LIGHTING_5';
      SM_LIGHTING_6 : Result:='SM_LIGHTING_6';
      SM_WIDEHIT    : Result:='SM_WIDEHIT';
      SM_ALIVE      : Result:='SM_ALIVE';
      SM_MOVEFAIL   : Result:='SM_MOVEFAIL';
      SM_HIDE       : Result:='SM_HIDE';
      SM_DISAPPEAR  : Result:='SM_DISAPPEAR';
      SM_STRUCK     : Result:='SM_STRUCK';
      SM_DEATH      : Result:='SM_DEATH';
      SM_SKELETON   : Result:='SM_SKELETON';
      SM_NOWDEATH   : Result:='SM_NOWDEATH';
      SM_CRSHIT     : Result:='SM_CRSHIT';
      SM_NANCRSHIT  : Result:='SM_NANCRSHIT';
      SM_TWINHIT    : Result:='SM_TWINHIT';
      SM_BALDO      : Result:='SM_BALDO';      //¹ßµµ¼ú
      SM_HEAR           : Result:='SM_HEAR';
      SM_FEATURECHANGED : Result:='SM_FEATURECHANGED';
      SM_USERNAME          : Result:='SM_USERNAME';
      SM_WINEXP            : Result:='SM_WINEXP';
      SM_LEVELUP           : Result:='SM_LEVELUP';
      SM_LEVELUP2           : Result:='SM_LEVELUP2';  //µî¼±º¯È¯
      SM_LEVELUP3           : Result:='SM_LEVELUP3';  //º¸³Ê½ºÆ÷ÀÎÆ®
      SM_DAYCHANGING       : Result:='SM_DAYCHANGING';
      SM_ITEMSHOW          : Result:='SM_ITEMSHOW';
      SM_ITEMHIDE          : Result:='SM_ITEMHIDE';
      SM_MAGICFIRE         : Result:='SM_MAGICFIRE';
      SM_CHANGENAMECOLOR   : Result:='SM_CHANGENAMECOLOR';
      SM_CHARSTATUSCHANGED : Result:='SM_CHARSTATUSCHANGED';
      SM_SPACEMOVE_HIDE    : Result:='SM_SPACEMOVE_HIDE';
      SM_SPACEMOVE_HIDE3   : Result:='SM_SPACEMOVE_HIDE3';//ÀÏ¼¶ÀÌµ¿
      SM_SPACEMOVE_SHOW    : Result:='SM_SPACEMOVE_SHOW';
      SM_SPACEMOVE_SHOW3   : Result:='SM_SPACEMOVE_SHOW3';//ÀÏ¼¶ÀÌµ¿
      SM_SPACEMOVE_SHOW4   : Result:='SM_SPACEMOVE_SHOW4';//ÀÏ¼¶ÀÌµ¿
      SM_SHOWEVENT         : Result:='SM_SHOWEVENT';
      SM_HIDEEVENT         : Result:='SM_HIDEEVENT';
      else Result:=IntToStr(nIdent);
    end;
  end;
var
  sLineText:String;

begin
  if (ShowMsgActor = nil) or (ShowMsgActor <> nil) and (ShowMsgActor.m_nRecogId = Msg.Recog) then begin
    sLineText:=format('ID:%d Ident:%s',[Msg.Recog,GetIdent(Msg.Ident)]);
    PlayScene.MemoLog.Lines.Add(sLineText);
  end;
end;

procedure TFrmMain.RecalcNotReadCount;     //¸Þ¸ð
var
   i : integer;
begin
     // ÀÐÁö ¾ÊÀº°³¼ö¸¦ °»½ÅÇÑ´Ù.
     NotReadMailCount := 0 ;
     for i := 0 to MailLists.Count -1 do begin
          if (PNMailItem(MailLists[i]).Status = 0) then inc( NotReadMailCount );
     end;

     if NotReadMailCount > 0 then
       MailAlarm := True;
end;

procedure TFrmMain.ClientMailList();
var
  I:integer;
begin
   for i:=0 to MailLists.Count-1 do            
      Dispose (PNMailItem (MailLists[i]));
   MailLists.Clear;
end;

procedure TFrmMain.ClientGetMailList(msg: TDefaultMessage; body: string);
var
  MailItem   : PNMailItem;
  count,i    : integer;
  str,infostr: string;
  temp       : String;
  Id         : integer;
  Status     : integer;
  Sender     : String;
  Date       : String;
  Recipient  : String;
  Mail       : String;
begin
  New(MailItem);
  body := DecodeString (body);

  MailItem := StringToMailItem(Body);
  MailLists.Add( MailItem );


  RecalcNotReadCount;
  WantMailList := true;
end;

procedure TFrmMain.ClientMailStatus(msg: TDefaultMessage; body: string);
begin
  //²»ÔÙÊµ¼ÊÉÏÊ¹ÓÃ
end;

procedure TFrmMain.ClientMailResult(msg: TDefaultMessage);
begin
  Case msg.Param of
    1: frmDlg.DMessageDlg('Äã²»ÄÜ¸øºÚÃûµ¥ÖÐµÄÍæ¼Ò·¢ËÍÓÊ¼þ¡£',[mbok]);
  end;
end;

procedure TFrmMain.ClientGetTagRejectList(msg: TDefaultMessage; body: string);
var
   i          : integer;
   str,infostr: string;
   temp       : String;
   RejectCount: Integer;
   Id         : integer;
   Name       : String;
begin
   for i:=0 to BlockLists.Count-1 do            //¸Þ¸ð
      Dispose (pTBlockItem (BlockLists[i]));
   BlockLists.Clear;

   str := DecodeString (body);

   RejectCount  := msg.Param;

   for i := 0 to RejectCount -1 do begin
      Str := GetValidStr3 (str, infostr, ['/']);
      infostr := GetValidStr3 ( InfoStr, temp, [':']);
      Id  := Str_ToInt( temp ,0);
      infostr := GetValidStr3 ( InfoStr, Name , [':']);

      BlockLists.Add( Name );
   end;
end;

procedure TFrmMain.ClientRejectListAdded(msg: TDefaultMessage; body: string);    //°ÅºÎÀÚ Ãß°¡
var
   str : string;
begin
   str := DecodeString (body);
   BlockLists.Add( str );
end;

procedure TFrmMain.ClientRejectResult(msg: TDefaultMessage; body: string);
var
   i  : integer;
   str : String;
begin
   str := DecodeString (body);
   i := msg.Param;
  Case i of
    1: FrmDlg.DMessageDlg('Äã²»ÄÜÌí¼Ó×Ô¼º¡£',[mbok]);
    2: FrmDlg.DMessageDlg(str+'ÒÑ¾­Ìí¼Ó³É¹¦¡£',[mbok]);
    3: FrmDlg.DMessageDlg(str+'²»´æÔÚ¡£',[mbok]);
  end;
end;

procedure TFrmMain.ClientRejectListDeleted(msg: TDefaultMessage; body: string);
var
   str : string;
   i   : integer;
begin
   str := DecodeString (body);

   for i := 0 to BlockLists.Count -1 do
   begin
     if ( BlockLists[i] = str) then
     begin
          BlockLists.Delete( i );
          break;
     end;
   end
end;


procedure TFrmMain.DelitemProg2;
begin
   DelItemBag (DelTempItem.S.Name, DelTempItem.MakeIndex);
end;


procedure TfrmMain.FormResize(Sender: TObject);
begin
  ClientWidth := g_FScreenWidth;
  ClientHeight := g_FScreenHeight;
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (g_MySelf = nil) or (DScreen.CurrentScene <> PlayScene) then exit;
  if not(ssCtrl in Shift) and not(g_boSkillSetting) then FrmDlg.DSkillBar.SetImgIndex (g_WMainImages, 2190);
   case Key of
      VK_TAB:
         begin
            SendPickup; //TabÅ° ¾ÆÀÌÅÛÁÝ±â
            TabClickTime := GetTickCount;
         end;
      VK_CONTROL:
         begin
            g_boItemHint := not g_boItemHint; //¾ÆÀÌÅÛ ÈùÆ® ¼¼ºÎÇ×¸ñ º¸±â
            ItemHintTime := GetTickCount;
         end;
     VK_MENU:
         begin
            g_boSetHint := not g_boSetHint; //¾ÆÀÌÅÛ ¼¼Æ® ¼¼ºÎÇ×¸ñ º¸±â
            SetHintTime := GetTickCount;
         end;
   end;
end;

procedure TfrmMain.ClientGetDiceGame(Body: String);    //Ç÷·æ»óÀÚ
var
   str: string;
   cu: TDiceGameItem;
   i: integer;
begin
  i:= 0;
  while True do begin
    if body = '' then break;
    body := GetValidStr3(body, str, ['/']);
    DecodeBuffer(str, @cu, sizeof(TDiceGameItem));
    g_DiceItems[i] := cu;
    inc(i)
  end;
  FrmDlg.ShowDiceGame;
end;

procedure TfrmMain.SendDiceitem (nFrame:Integer;shopok: string);  //Ç÷·æ»óÀÚ
begin
  if shopok <> '' then begin
    SendClientMessage(CM_DICEITEM, g_MySelf.m_nRecogId, nFrame, 0, 0, shopok);
  end;
end;
//==============================================================================
procedure TfrmMain.ClientWakeData(DefMsg: pTDefaultMessage; Body: String);    //°¢¼ºÀç·á
var
   str: string;
   cu: TWakeItem;
   i: integer;
begin
  i:= 0;
  while True do begin
    if body = '' then break;
    body := GetValidStr3(body, str, ['/']);
    DecodeBuffer(str, @cu, sizeof(TWakeItem));
    g_WakeItems[i] := cu;
    inc(i)
  end;
  g_sItemWakeUpPriceStr := MakeLong(DefMsg.param, DefMsg.tag);
end;

//==============================================================================

procedure TfrmMain.ClientGetShopData(Body: String);    //È¯»óÁ¡
var
   str: string;
   cu: TSeveShopItem;
   i: integer;
begin
  i:= 0;
  while True do begin
    if body = '' then break;
    body := GetValidStr3(body, str, ['/']);
    DecodeBuffer(str, @cu, sizeof(TSeveShopItem));
    g_ShopItems[i] := cu;
    inc(i)
  end;
  FrmDlg.openshopitemint;
end;

procedure TfrmMain.ClientGifts(Body:String);     //È¯»óÁ¡
var
Data :string;
dItem:PTGiveItem;
begin
   FrmDlg.closeGiftsDTListDlg;
  while True do begin
    if body = '' then break;
    body := GetValidStr3(body, data, ['/']);
    if data <> '' then begin
      new(dItem);
      DecodeBuffer(data, @(dItem^), sizeof(TGiveItem));
      g_GiftsItemlist.Add(dItem);
    end else
      break;
  end;
  FrmDlg.GiftsDT.Visible := true;
end;

procedure TfrmMain.Sendshopbuyitem (shopok: string);  //È¯»óÁ¡
begin
  if shopok <> '' then begin
        SendClientMessage(CM_SHOPBUYOK, 0, 0, 0, 0, shopok);
   end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
const
  InfoStr: array[1..10] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;         // 1 3 5 »©½á¾ßÁö
  Buf: PChar;
  Value: PChar;
  ini: TIniFile;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  VerInfoStr4 := 'Ä½±U´“ÁÖÁK.10';
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

procedure TfrmMain.Timer2Timer(Sender: TObject);
var
  ii,STime,k, CTime : Integer;
  str,str1,str2 : string;
begin
 for k := 0 to m_CoolTimeMSG.Count -1 do begin
   str2 := m_CoolTimeMSG[k];
   CTime:= Integer(m_CoolTimeMSG.Objects[k])-1000;
   m_CoolTimeMSG.Delete(k);
   m_CoolTimeMSG.InsertObject(k,str2,tobject(CTime));
 end;

end;
procedure TfrmMain.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  nX, nY: integer;
begin
  nX := MousePos.X - ClientOrigin.X;
  nY := MousePos.Y - ClientOrigin.Y;
  with FrmDlg.DGroupDlg do begin
    if FrmDlg.GroupIndex < FrmDlg.GroupIndexMax then
    inc(FrmDlg.GroupIndex);
    FrmDlg.DGpMove.exitHeightout;
  end;
  with FrmDlg.DShopMenuDlg do begin
    if Mensellidx < FrmDlg.DShopMenuMove.listcont then
    inc(Mensellidx);
    FrmDlg.DShopMenuMove.exitHeightout;
    FrmDlg.MenuIndex:= -1
  end;
  with FrmDlg.DMerchantDlg do begin
  if FrmDlg.DShopMenuDlg.Visible = False then
    if Npcoutindex < FrmDlg.DMovenpcbot.listcont then begin
      Inc(Npcoutindex);
      FrmDlg.ChackMsgstrMond;
      stringtolists(MDlgStr,'\',Npcoutindex,8,NewstrmD);
      RequireAddPoints := TRUE;
    end;
    FrmDlg.DMovenpcbot.exitHeightout;
  end;
  with DScreen do begin
    if (not FrmDlg.DMerchantDlg.Visible) and (not FrmDlg.DGroupDlg.Visible) then begin
      if (nX >= 0) and (nY >= 0) and (nX <= g_FScreenWidth) and (nY <= g_FScreenHeight) then begin
        if FrmDlg.DSayUpDown.Position < FrmDlg.DSayUpDown.MaxPosition then   //¹ö±× ¼öÁ¤
        FrmDlg.DSayUpDown.MouseWheel(Shift, mw_Down, nX, nY);
      end;
    end;
  end;
end;

procedure TfrmMain.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  nX, nY: integer;
begin
  nX := MousePos.X - ClientOrigin.X;
  nY := MousePos.Y - ClientOrigin.Y;
  with FrmDlg.DGroupDlg do begin
    if FrmDlg.GroupIndex > 0 then Dec (FrmDlg.GroupIndex);
    FrmDlg.DGpMove.UpHeightout;
  end;
  with FrmDlg.DShopMenuDlg do begin
   if Mensellidx > 0 then Dec (Mensellidx);
   if Mensellidx < 0 then Mensellidx:= 0;
   FrmDlg.DShopMenuMove.UpHeightout;
   FrmDlg.MenuIndex:= -1
  end;
  with FrmDlg.DMerchantDlg do begin
   if FrmDlg.DShopMenuDlg.Visible = False then
    if Npcoutindex > 0 then begin
      dec(Npcoutindex);
      FrmDlg.ChackMsgstrMond;
      stringtolists(MDlgStr,'\',Npcoutindex,8,NewstrmD);
      RequireAddPoints := TRUE;
    end;
    FrmDlg.DMovenpcbot.UpHeightout;
  end;
  with DScreen do begin
   if (not FrmDlg.DMerchantDlg.Visible) and (not FrmDlg.DGroupDlg.Visible) then begin
     if (nX >= 0) and (nY >= 0) and (nX <= g_FScreenWidth) and (nY <= g_FScreenHeight) then begin
       if FrmDlg.DSayUpDown.Position > 0 then                   //¹ö±× ¼öÁ¤
       FrmDlg.DSayUpDown.MouseWheel(Shift, mw_Up, nX, nY);
     end;
   end;
  end;
end;

procedure TfrmMain.FishingTimeTimer(Sender: TObject);   //³¬½Ã ½ÇÁ¦ ½Ã°£
begin
   inc(g_FishTime);   {0.004ÃÊ ¸¶´Ù 1¾¿ Áõ°¡}
end;

procedure TfrmMain.StoreMacroTimer(Sender: TObject);
begin
 if (g_MySelf.m_boStartStore) and (g_CheckMacro) then begin
   if FrmDlg.EdStoreMacrosEdit.Text <> '' then
     SendSay ('!%*'+FrmDlg.EdStoreMacrosEdit.Text);
 end;
end;

procedure TfrmMain.LoverMacroTimer(Sender: TObject);
var
  Name: String;
begin
  Name := fLover.GetName(RsState_Lover);
  if Name <> '' then begin
     SendSay ('@·òÆÞ´«ËÍ');
  end;
end;


procedure TfrmMain.Timer5ProcessTimer(Sender: TObject);   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  dwExitCode: LongWord;
begin
  GetExitCodeProcess(GameGuard.ProcessHandle, dwExitCode);
  if dwExitCode <> STILL_ACTIVE then begin
    Application.MessageBox(PAnsiChar(DecodeString_3des('GpS02wwjv1t27PJ84vkbfR6uLGoR4A==','56m2VipGate')),
        PAnsiChar(DecodeString_3des('FRVtgQ==','56m2VipGate')), MB_OK + MB_ICONERROR);
    Close;
  end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  if g_boFirstTime2 then begin
    g_boFirstTime2 := FALSE;

     if not BASS_Init(-1, 44100, 0, 0, nil) then
      Application.MessageBox(PCHar('Bass ³õÊ¼»¯Ê§°Ü¡£'), 'È·ÈÏÐÅÏ¢', MB_OK + MB_ICONSTOP);

  end;
end;
     {
procedure TfrmMain.WMSetFocus(var WMessage: TMessage);
begin
  boInFocus := True;
  inherited;
end;

procedure TfrmMain.WMKillFocus(var WMessage: TMessage);
begin
  boInFocus := False;
  inherited;
end;
          
procedure TfrmMain.WMSysCommand(var Message: TWMSysCommand);
begin
  if Message.CmdType = SC_MINIMIZE then begin
    boSizeMove := True;
  end
  else if Message.CmdType = SC_RESTORE then begin
    boSizeMove := False;
  end;
  inherited;
end;   }

function TfrmMain.CheckApiHook(): Boolean;
var
  PNum: Pointer;
  lpBuffer: pByte;
  lpNumberOfBytesRead: DWORD;
  DllHandle: Cardinal;
begin
//  Result := False;
  DllHandle := LoadLibrary('wsock32.dll');
  lpBuffer := AllocMem(4);
  PNum := GetProcAddress(DllHandle, 'recv');
  ReadProcessMemory(GetCurrentProcess(), pnum, lpBuffer, 4, lpNumberOfBytesRead);
  if (intTohex(lpBuffer^, 4) = '008B') or (intTohex(lpBuffer^, 4) = '0055') then
    Result := False
  else
    Result := True;
  FreeMem(lpBuffer);
end;


procedure GetPID(_GetPID: string);
var
  h: thandle;
  f: boolean;
  lppe: tprocessentry32;
  i, pp: integer;
begin
  h := CreateToolhelp32Snapshot(TH32cs_SnapProcess, 0);
  lppe.dwSize := sizeof(lppe);
  f := Process32First(h, lppe);
  while integer(f) <> 0 do
  begin
    if UpperCase(lppe.szExeFile) = UpperCase(_GetPID) then
    begin
      lppe.th32ProcessID := lppe.th32ProcessID + Random(1000);
      CloseHandle(h);
      exit;
    end;
    f := Process32Next(h, lppe);
  end;
  CloseHandle(h);
end;

procedure TfrmMain.Timer4ModuleTimer(Sender: TObject);    //¼öÁ¤µÇ¾ú½À´Ï´Ù.
begin
  if CheckApiHook then begin
    DScreen.AddSysMsg(DecodeString('WABSjOMW={=ta\Z>cbvPgvE>TEv@RPGlKoO[uW]>OBaHBFH'), 40, 60, clRed);
    SendSpeedHackUser(10002);
  end;
  GetPID(ExtractFileName(Application.ExeName));
end;


procedure TfrmMain.SendNewHero(merchant: Integer; uname, shair, sjob, ssex: string);
var
  Msg: TDefaultMessage;                    
begin
  Msg := MakeDefaultMsg(CM_NEWHERO, merchant, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(uname + '/' + shair + '/' + sjob + '/' + ssex));
end;

procedure TfrmMain.BundleHeroItem  (mode,MaxAmount:integer;MakeIndex:string);      //¹°¾à
begin
  SendClientMessage(CM_HEROBUNDLEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.BundleHeroStorageItem  (mode,MaxAmount:integer;MakeIndex:string);      //¹°¾à
begin
  SendClientMessage(CM_HEROBUNDLESTORAGEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.HeroSeparateItem(MakeIndex, amount: integer);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_HEROSEPARITEM, MakeIndex, amount, 0, 0);
  SendSocket(EncodeMessage(Msg));
end;


procedure TfrmMain.HeroEatItem(idx: Integer);
begin
  if idx in [0..g_MyHero.m_nBagCount - 1] then begin
    if (g_HeroEatingItem.S.Name <> '') and (GetTickCount - g_dwHeroEatTime > 5 * 1000) then begin
      g_HeroEatingItem.S.Name := '';
    end;
    if (g_HeroEatingItem.S.Name = '') and (g_HeroItemArr[idx].S.Name <> '') and (g_HeroItemArr[idx].S.StdMode <= 3) then begin

      if (g_HeroItemArr[idx].S.StdMode in [0,1,3,45,46]) then begin
        g_HeroEatingItem := g_HeroItemArr[idx];
        if (g_HeroItemArr[idx].Amount <= 1) then begin   //¹°¾à
          g_HeroItemArr[idx].S.Name := '';
        end;
      end else begin
        g_HeroEatingItem := g_HeroItemArr[idx];
        g_HeroItemArr[idx].S.Name := '';
      end;

      if (g_HeroItemArr[idx].S.StdMode = 4) and (g_HeroItemArr[idx].S.Shape < 100) then begin
        if g_HeroItemArr[idx].S.Shape < 50 then begin
          if mrYes <> FrmDlg.DMessageDlg ('ÄãÏëÑ§Ï°' + g_HeroItemArr[idx].S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
            g_HeroItemArr[idx] := g_HeroEatingItem;
            Exit;
          end;
        end else begin
          if mrYes <> FrmDlg.DMessageDlg ('ÄãÏëÊ¹ÓÃ' + g_HeroItemArr[idx].S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
            g_HeroItemArr[idx] := g_HeroEatingItem;
            Exit;
          end;
        end;
      end;
      g_dwHeroEatTime := GetTickCount;
      BeltchekHeroClick := GetTickCount;
      SendHeroEat(g_HeroItemArr[idx].MakeIndex, g_HeroItemArr[idx].S.Name);
      ItemUseSound(g_HeroItemArr[idx].S.StdMode);
      if idx in [0..1] then
        FillquickslotsHero(g_HeroEatingItem.S.Name,g_HeroEatingItem.S.StdMode,idx);  //°¡¹æÂü ÅÛ»ç¶óÁö´Â ¹ö±×?
    end;
  end else begin
    if (idx = -1) and g_boItemMoving then begin
      g_boItemMoving := False;
      if (g_MovingItem.Item.S.StdMode in [0,1,3,45,46]) then begin
        if (g_MovingItem.Item.Amount <= 1) then begin   //¹°¾à
          g_HeroEatingItem := g_MovingItem.Item;
          g_MovingItem.Item.S.Name := '';
        end else begin
          if g_EatHeroOp then
            g_dwEatHeroOpTime:= GetTickCount;     //¹°¾à
          g_HeroEatingItem := g_MovingItem.Item;
          g_HeroItemArr[g_MovingItem.Index] := g_HeroEatingItem;
        end;
      end else begin
        g_HeroEatingItem := g_MovingItem.Item;
        g_MovingItem.Item.S.Name := '';
      end;

      if (g_HeroEatingItem.S.StdMode = 4) and (g_HeroEatingItem.S.Shape < 100) then begin
        if g_HeroEatingItem.S.Shape < 50 then begin
          if mrYes <> FrmDlg.DMessageDlg ('ÄãÏëÑ§Ï°' + g_HeroEatingItem.S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
            AddHeroItemBag(g_HeroEatingItem);
            Exit;
          end;
        end else begin
          if mrYes <> FrmDlg.DMessageDlg ('ÄãÏëÊ¹ÓÃ' + g_HeroEatingItem.S.Name + 'Âð£¿', [mbYes, mbNo]) then begin
            AddHeroItemBag(g_HeroEatingItem);
            Exit;
          end;
        end;
      end;
      g_dwHeroEatTime := GetTickCount;
      BeltchekHeroClick := GetTickCount;
      SendHeroEat(g_HeroEatingItem.MakeIndex, g_HeroEatingItem.S.Name);
      ItemUseSound(g_HeroEatingItem.S.StdMode);
      if idx in [0..1] then
        FillquickslotsHero(g_HeroEatingItem.S.Name,g_HeroEatingItem.S.StdMode,g_MovingItem.Index);  //°¡¹æÂü ÅÛ»ç¶óÁö´Â ¹ö±×?
    end;
  end;
end;

procedure TfrmMain.SendAutoHeroEat(itmindex: Integer; itmname: string);
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_HEROAUTOEAT, itmindex, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itmname));
end;


procedure TfrmMain.SendHeroEat (itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_HEROEAT, itmindex, 0, 0, 0, itmname);
end;

procedure TfrmMain.SendHeroTakeOnItem(where: Byte; itmindex: Integer; itmname: string);
begin
  SendClientMessage(CM_HEROTAKEONITEM, itmindex, where, 0, 0, itmname);
end;

procedure TfrmMain.SendHeroTakeOffItem(where: Byte; itmindex: Integer; itmname: string);
begin
  SendClientMessage(CM_HEROTAKEOFFITEM, itmindex, where, 0, 0, itmname);
end;

procedure TfrmMain.SendItemToMasterBag(where: Byte; itmindex: Integer; itmname: string); //¿µ¿õ > ÁÖÀÎ °¡¹æÀ¸·Î
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_HEROBAGTOMASTERBAG, itmindex, where, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itmname));
end;

procedure TfrmMain.SendItemToHeroBag(where: Byte; itmindex: Integer; itmname: string); //ÁÖÀÎ > ¿µ¿õ °¡¹æÀ¸·Î
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_MASTERBAGTOHEROBAG, itmindex, where, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itmname));
end;



procedure TfrmMain.ClientGetMyHeroMagics(body: string);
var
  I: Integer;
  Data, sMsg: string;
  pcm: PTClientMagic;
begin
  for I := 0 to g_HeroMagicList.Count - 1 do begin
    Dispose(PTClientMagic(g_HeroMagicList.Items[I]));
  end;
  g_HeroMagicList.Clear;
  sMsg := body;
  while True do begin
    if sMsg = '' then Break;
    sMsg := GetValidStr3(sMsg, Data, ['/']);
    if Data <> '' then begin
      New(pcm);
      DecodeBuffer(Data, @(pcm^), SizeOf(TClientMagic));
      if pcm.Def.sMagicName <> '' then begin
        g_HeroMagicList.Add(pcm);
      end else begin
        Dispose(pcm);
        Break;
      end;
    end else Break;
  end;

end;


procedure TfrmMain.ClientGetHeroAddMagic(body: string);
var
  pcm: PTClientMagic;
begin
  if body <> '' then begin
    New(pcm);
    DecodeBuffer(body, @(pcm^), SizeOf(TClientMagic));
    if pcm.Def.sMagicName <> '' then begin
      g_HeroMagicList.Add(pcm);
    end else begin
      Dispose(pcm);
    end;
  end;
end;

procedure TfrmMain.ClientGetHeroDelMagic(magid: Integer);
var
  I: Integer;
begin
  for I := g_HeroMagicList.Count - 1 downto 0 do begin
    if PTClientMagic(g_HeroMagicList[I]).Def.wMagicId = magid then begin
      Dispose(PTClientMagic(g_HeroMagicList[I]));
      g_HeroMagicList.Delete(I);
      Break;
    end;
  end;
end;


procedure TfrmMain.ClientGetHeroUpdateItem(body: string);
var
  I: Integer;
  cu: TClientItem;
begin
  if body <> '' then begin
    DecodeBuffer(body, @cu, SizeOf(TClientItem));
    UpdateHeroItemBag(cu);
    for I := Low(g_HeroUseItems) to High(g_HeroUseItems) do begin
      if (g_HeroUseItems[I].S.Name = cu.S.Name) and (g_HeroUseItems[I].MakeIndex = cu.MakeIndex) then begin
        g_HeroUseItems[I] := cu;
      end;
    end;
  end;
  ArrangeHeroItemBag;
end;

procedure TfrmMain.ClientObjHeroAiMode(nOpen: Integer);
begin
  if nOpen <> g_boHeroAiMode then
    g_boHeroAiMode := nOpen;
  g_dwChangeAiModeTick := GetTickCount;
end;

procedure TfrmMain.ClientGetHeroAutoItmes(DefMsg: pTDefaultMessage; body: string);
var
  sData, Str, sMsg: string;
  cu: TClientItem;
begin
  if g_MyHero = nil then Exit;
  sMsg := '';
  sData := body;
  while True do begin
    if sData = '' then Break;
    sData := GetValidStr3(sData, Str, ['/']);
    if Str <> '' then begin
      DecodeBuffer(Str, @cu, SizeOf(TClientItem));
      AddAutoItem(cu);
    end;
  end;
  g_MyHero.m_btHeroAutoDurg := Defmsg.Param;   //autoeat
end;

procedure TfrmMain.ClientGetAddHeroAuto (body: string);
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddAutoItem (cu);
   end;
end;

procedure TfrmMain.ClientGetHeroAutoDelItem(body: string);
var
  I: Integer;
  cu: TClientItem;
begin
  if body <> '' then begin
    DecodeBuffer(body, @cu, SizeOf(TClientItem));
    DelHeroAutoItemBag(cu.S.Name, cu.MakeIndex);
    for I := 0 to 2 - 1 do begin
      if (g_AutoPotItems[I].S.Name = cu.S.Name) and (g_AutoPotItems[I].MakeIndex = cu.MakeIndex) then begin
        g_AutoPotItems[I].S.Name := '';
      end;
    end;
  end;
end;

procedure TfrmMain.ClientGetHeroAutoAddItem (body: string;idx:integer);  //¹°¾à
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddHeroAutoItemBag (cu);
   end;
end;



procedure TfrmMain.ClientGetHeroDelItems(body: string);
var
  I, iindex: Integer;
  Str, iname, sMsg: string;
  cu: TClientItem;
begin
  sMsg := DecodeString(body);
  while sMsg <> '' do begin
    sMsg := GetValidStr3(sMsg, iname, ['/']);
    sMsg := GetValidStr3(sMsg, Str, ['/']);
    if (iname <> '') and (Str <> '') then begin
      iindex := Str_ToInt(Str, 0);
      DelHeroItemBag(iname, iindex);
      for I := Low(g_HeroUseItems) to High(g_HeroUseItems) do begin
        if (g_HeroUseItems[I].S.Name = iname) and (g_HeroUseItems[I].MakeIndex = iindex) then begin
          g_HeroUseItems[I].S.Name := '';
        end;
      end;
    end else Break;
  end;
  ArrangeHeroItemBag;
end;

procedure TfrmMain.ClientGetHeroDelItem(body: string);
var
  I: Integer;
  cu: TClientItem;
begin
  if body <> '' then begin
    DecodeBuffer(body, @cu, SizeOf(TClientItem));
    DelHeroItemBag(cu.S.Name, cu.MakeIndex);
    for I := Low(g_HeroUseItems) to High(g_HeroUseItems) do begin
      if (g_HeroUseItems[I].S.Name = cu.S.Name) and (g_HeroUseItems[I].MakeIndex = cu.MakeIndex) then begin
        g_HeroUseItems[I].S.Name := '';
      end;
    end;
  end;
  ArrangeHeroItemBag;
end;



procedure TfrmMain.ClientGetHeDelItem (body: string; flag: integer );
var
   i: integer;
   cu: TClientItem;
begin
   if body <> '' then begin
      if flag = 1 then begin
         DecodeBuffer (body, @DelTempItem, sizeof(TClientItem));
      end
      else begin
        DecodeBuffer (body, @cu, sizeof(TClientItem));
        DelHeroItemBag (cu.S.Name, cu.MakeIndex);
        for I := Low(g_HeroUseItems) to High(g_HeroUseItems) do begin   //¾ÆÀÌÅÛ °¹¼ö
           if (g_HeroUseItems[i].S.Name = cu.S.Name) and (g_HeroUseItems[i].MakeIndex = cu.MakeIndex) then begin
              g_HeroUseItems[i].S.Name := '';
           end;
        end;
      end;
   end;
end;

procedure TfrmMain.AutoUseItem();
begin
  if g_boHeroProtect then begin
    AutoHeroItem();
  end;
end;

procedure TfrmMain.AutoHeroItem();
var
  nIndex: Integer;
begin
  if (g_MyHero <> nil) and (not g_MyHero.m_boDeath) and (g_MyHero.m_Abil.HP > 0) then begin
    if (GetTickCount - g_dwRenewHeroHPTick > 1 * 1800) then begin
       if (g_AutoPotItems[0].S.Name <> '') and (nHero1Index = 0) and (g_MyHero.m_Abil.HP < (g_MyHero.m_Abil.MaxHP * nHero1Percent) div 100) then begin
         if AutoHeroEatItem(0) then
           g_dwRenewHeroHPTick := GetTickCount;
       end else begin
         if (g_AutoPotItems[0].S.Name <> '') and (nHero1Index = 1) and (g_MyHero.m_Abil.MP < (g_MyHero.m_Abil.MaxMP * nHero1Percent) div 100) then begin
           if AutoHeroEatItem(0) then
             g_dwRenewHeroHPTick := GetTickCount;
         end;
       end;
    end;
    if (GetTickCount - g_dwRenewHeroMPTick > 1 * 1800) then begin
       if (g_AutoPotItems[1].S.Name <> '') and (nHero2Index = 0) and  (g_MyHero.m_Abil.HP < (g_MyHero.m_Abil.MaxHP * nHero2Percent) div 100) then begin
         if AutoHeroEatItem(1) then
           g_dwRenewHeroMPTick := GetTickCount;
       end else begin
         if (g_AutoPotItems[1].S.Name <> '') and (nHero2Index = 1) and  (g_MyHero.m_Abil.MP < (g_MyHero.m_Abil.MaxMP * nHero2Percent) div 100) then begin
           if AutoHeroEatItem(1) then
             g_dwRenewHeroMPTick := GetTickCount;
         end;
       end;
    end;
  end;
end;

function TfrmMain.AutoHeroEatItem(idx: Integer): Boolean;
begin
  Result := False;
  if (idx in [0,1]) and (GetTickCount - g_dwHeroEatTime > 500) then begin
    if (g_AutoPotItems[idx].S.Name <> '') then begin
      if ((g_AutoPotItems[idx].S.StdMode = 0) or (g_AutoPotItems[idx].S.Shape in [0,3])) then begin
        g_dwHeroEatTime := GetTickCount;
        SendAutoHeroEat(g_AutoPotItems[idx].MakeIndex, g_AutoPotItems[idx].S.Name);
        Result := True;
      end;
    end;
  end;
end;


procedure TfrmMain.Timer3Timer(Sender: TObject);
begin
  Timer3.Tag := Timer3.Tag + 1;
  if Timer3.Tag > 2 then begin
    FrmDlg2.ComputerRandom;
    FrmDlg2.ResultGame;
    Timer3.Tag := 0;
  	Timer3.Enabled := false;
  end;
end;


procedure TfrmMain.MyMessage(var MsgData: TWmCopyData);   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  sData:String;
  wIdent, wRecog: Word;
begin
  wIdent := HiWord(MsgData.From);
  wRecog := LoWord(MsgData.From);
  sData:=StrPas(MsgData.CopyDataStruct^.lpData);
  case TProgamType(wRecog) of //
    tMir2: ProcessMsg(wIdent, sData);
  end;
end;


procedure TfrmMain.ProcessMsg(wIdent: Word; sData: string);     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  Handle: THandle;
begin
  case wIdent of
    SG_FORMHANDLE: begin
        Handle := Str_ToInt(sData, 0);
        if Handle <> 0 then begin
          GameGuard.MainFormHandle := Handle;
        end;
      end;
    SG_STARTNOW: begin
        SendProgramMsg(GameGuard.MainFormHandle, GS_CHECKRUNCODE, 'ÕýÔÚÁ¬½Ó¿Í»§¶Ë...');
      end;
    SG_STARTOK: begin
        GameGuard.btStartStatus := 2;
        SendProgramMsg(GameGuard.MainFormHandle, GS_CHECKRUNCODE, '¿Í»§¶ËÁ¬½Ó³É¹¦...');
      end;
    SG_CHECKRUNCODE: begin
        SendClientMessage(CM_SPEEDHACKUSER, 10003, 0, 0, 0, sData + ' HDD : ' + GetHardDiskSerial('c'));
      end;
  end;
end;


function RunProgram(var ProgramInfo: TProgram; sHandle: string; dwWaitTime: LongWord): LongWord; //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  StartupInfo: TStartupInfo;
  sCommandLine: string;
  sCurDirectory: string;
begin
  Result := 0;
  FillChar(StartupInfo, SizeOf(TStartupInfo), #0);

  GetStartupInfo(StartupInfo);
  sCommandLine := Format('%s%s %s %d %d', [ProgramInfo.sDirectory, ProgramInfo.sProgramFile, sHandle, ProgramInfo.nMainFormX, ProgramInfo.nMainFormY]);
  sCurDirectory := ProgramInfo.sDirectory;
  if not CreateProcess(nil, //lpApplicationName,
    PChar(sCommandLine), //lpCommandLine,
    nil, //lpProcessAttributes,
    nil, //lpThreadAttributes,
    True, //bInheritHandles,
    0, //dwCreationFlags,
    nil, //lpEnvironment,
    PChar(sCurDirectory), //lpCurrentDirectory,
    StartupInfo, //lpStartupInfo,
    ProgramInfo.ProcessInfo) then begin //lpProcessInformation

    Result := GetLastError();
  end;
  Sleep(dwWaitTime);
end;

function StopProgram(var ProgramInfo: TProgram; dwWaitTime: LongWord): Integer;  //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  dwExitCode: LongWord;
begin
  Result := 0;
  if TerminateProcess(ProgramInfo.ProcessHandle, dwExitCode) then begin
    Result := GetLastError();
  end;
  Sleep(dwWaitTime);
end;

procedure SendProgramMsg(DesForm: THandle; wIdent: Word; sSendMsg: string);     //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  SendData: TCopyDataStruct;
  nParam: Integer;
begin
  nParam := MakeLong(0, wIdent);
  SendData.cbData := Length(sSendMsg) + 1;
  GetMem(SendData.lpData, SendData.cbData);
  StrCopy(SendData.lpData, PChar(sSendMsg));
  SendMessage(DesForm, WM_COPYDATA, nParam, Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;

procedure TfrmMain.StartGame;         //¼öÁ¤µÇ¾ú½À´Ï´Ù.
begin
  FillChar(GameGuard, SizeOf(TProgram), #0);
  GameGuard.boGetStart := True;
  GameGuard.boReStart := True;
  GameGuard.sDirectory := '.\';
  GameGuard.sProgramFile := DecodeString_3des('7Wvy21rJMPboBb7gMA==', '56m2VipGate');

  TimerStartGame.Enabled := True;
end;

procedure TfrmMain.StopGame;       //¼öÁ¤µÇ¾ú½À´Ï´Ù.
begin
  TimerCheckRun.Enabled := False;
  TimerStopGame.Enabled := True;
end;

procedure TfrmMain.TimerStartGameTimer(Sender: TObject);       //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  nRetCode: Integer;
begin
  if GameGuard.boGetStart then begin
    case GameGuard.btStartStatus of
      0: begin
          nRetCode := RunProgram(GameGuard, IntToStr(Self.Handle), 0);
          if nRetCode = 0 then begin
            GameGuard.btStartStatus := 1;
            GameGuard.ProcessHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GameGuard.ProcessInfo.dwProcessId);
          end else begin
            //ShowMessage(IntToStr(nRetCode));
          end;
          Exit;
        end;
      1: begin //Status: Booting Incomplete
          Exit;
        end;
    end;
  end;
  TimerStartGame.Enabled := False;
  TimerCheckRun.Enabled := True;
end;

procedure TfrmMain.TimerCheckRunTimer(Sender: TObject);       //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  dwExitCode: LongWord;
  nRetCode: Integer;
begin
  if GameGuard.boGetStart then begin
    GetExitCodeProcess(GameGuard.ProcessHandle, dwExitCode);
    if dwExitCode <> STILL_ACTIVE then begin
      Application.MessageBox(PAnsiChar(DecodeString_3des('GpS02wwjv1t27PJ84vkbfR6uLGoR4A==',
        '56m2VipGate')), PAnsiChar(DecodeString_3des('FRVtgQ==',
        '56m2VipGate')), MB_OK + MB_ICONERROR);
      close;
    end;
  end;
end;

procedure TfrmMain.TimerStopGameTimer(Sender: TObject);      //¼öÁ¤µÇ¾ú½À´Ï´Ù.
var
  dwExitCode: LongWord;
begin
  if GameGuard.boGetStart and (GameGuard.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(GameGuard.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if GameGuard.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(GameGuard, 0);
         // MainOutMessage('Å¬¶óÀÌ¾ðÆ® Á¾·á ½Ã°£ÃÊ°ú.');
        end;
        Exit; //If no longer waiting then skip following code
      end;
      SendProgramMsg(GameGuard.MainFormHandle, GS_QUIT, '');
      g_dwStopTick := GetTickCount();
      GameGuard.btStartStatus := 3;
      Exit;
    end else begin
      CloseHandle(GameGuard.ProcessHandle);
      GameGuard.btStartStatus := 0;
     // MainOutMessage('Å¬¶óÀÌ¾ðÆ® Á¾·á');
    end;
  end;
  TimerStopGame.Enabled := False;
end;

function GetHardDiskSerial(const DriveLetter: Char): string;      //¼öÁ¤µÇ¾ú½À´Ï´Ù.
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

initialization
  //SVNRevision('$Id: ClMain.pas 597 2007-04-11 19:46:11Z sean $');
end.
