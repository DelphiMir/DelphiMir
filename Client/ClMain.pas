unit ClMain;

interface

uses
  {svn, }nixtime, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  JSocket, ExtCtrls, DXDraws, DirectX, DXClass, DrawScrn, Bass,
  IntroScn, PlayScn, MapUnit, WIL, Grobal2, SDK, TlHelp32,
  Actor, DIB, StdCtrls, CliUtil, HUtil32, EdCode,
  DWinCtl, ClFunc, magiceff, SoundUtil, DXSounds, clEvent, IniFiles,
  Spin, ComCtrls, RelationShip , Grids, Mpeg, Menus, Mask, MShare, Share, StrUtils;{���ͳ�â}


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
    TimerStartGame: TTimer;    //�����Ǿ����ϴ�.
    TimerCheckRun: TTimer;     //�����Ǿ����ϴ�.
    TimerStopGame: TTimer;     //�����Ǿ����ϴ�.




    procedure StartGame(); //�����Ǿ����ϴ�.
    procedure StopGame();  //�����Ǿ����ϴ�.

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
    procedure Timer5ProcessTimer(Sender: TObject);   //�����Ǿ����ϴ�.
    procedure FormActivate(Sender: TObject);
    procedure Timer4ModuleTimer(Sender: TObject);     //�����Ǿ����ϴ�.
    procedure Timer3Timer(Sender: TObject);
    procedure TimerStartGameTimer(Sender: TObject);    //�����Ǿ����ϴ�.
    procedure TimerCheckRunTimer(Sender: TObject);     //�����Ǿ����ϴ�.
    procedure TimerStopGameTimer(Sender: TObject);     //�����Ǿ����ϴ�.
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
    procedure RunEffectTimerTimer(Sender: TObject);//�������

    procedure AutoPickUpItem();
    procedure AutoFishEp();       //���� �ڵ�
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
    function CheckUseMagicMonk (MaicId:Word): Boolean; //���Ż縮 Ȯ��

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

    procedure ClientSnow(DefMsg: pTDefaultMessage; body: string);//����������Ʈ
    procedure ClientStore(DefMsg: pTDefaultMessage); //���λ���
    procedure ClientDelStoreItem(body: string);     //���λ���
    procedure ClientGetSendUserStoreState(body: string);   //���λ���
    procedure ClientObjBuyStoreItemOK(); //���λ���
    procedure ClientObjBuyStoreItemFail(DefMsg: pTDefaultMessage); //���λ���
    procedure ClientObjStartStoreOK();      //���λ���
    procedure ClientObjStopStoreOK();        //���λ���
    procedure ClientObjStartStoreFail();     //���λ���

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
    procedure ClientGetAddItem2 (body: string; idx:integer);//����
    procedure ClientGetStorageAddItem (body: string;idx:integer);
    procedure ClientGetHeroStorageAddItem (body: string;idx:integer);
    procedure ClientGetGroupAddItem(Msg: pTDefaultMessage; Grade:Byte; sBody:String); //�׷������ ȹ�� �޽���
    procedure ClientGetAddStore (body: string);    //����
    procedure ClientGetAddHeroStore (body: string);    //����
    procedure ClientGetUpdateItem (body: string);
    procedure ClientGetComUpdateItem (body: string);
    procedure ClientGetDelItem (body: string; flag: integer );
    procedure ClientGetDelItems (body: string);
    procedure ClientGetBagItmes (body: string);    //����
    procedure ClientGetStoreItems (body: string);     //����
    procedure ClientGetHeroStoreItems (body: string);
    procedure ClientRentalItems (body: string);  //�뿩
    procedure ClientOwnerItems (body: string);  //�뿩

    procedure ClientPetInfo (body: string);  //���� ���� �޾Ƽ� �����ϱ�
    procedure ClientAucItems (body: string);      //���
    procedure ClientAuctionItems (body: string);   //��Ź
    procedure ClientComStorageItems (body: string); //����â��
    procedure ClientGuildStorageItems (body: string); //����â��
    procedure ClientGTList (body: string);
    procedure ClientDecoList (body: string);
    procedure ClientBBSList (body: string);     //����Խ���
    procedure ClientBBSMsg (body: string);     //����Խ���
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
    procedure ClientGetSendGoodsList (merchant, count: integer; body: string); //����
    procedure ClientGetSendMakeItemList (merchant, count: integer; body: string);    //��������
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

    procedure ClientObjStoragePWFail(DefMsg: pTDefaultMessage);   //â���ȣ
    procedure ClientObjStorageCheck(DefMsg: pTDefaultMessage);    //â���ȣ

    procedure ClientGetSendUserWake(merchant: Integer);
    procedure ClientGetSendUserReStore(merchant: Integer);

    procedure ClientGetSendUserRepair (merchant: integer);
    procedure ClientGetSendUserStorage (merchant, mode: integer);
    procedure ClientGetSendComStorage (merchant: integer);    //����â��
    procedure ClientGetSendGuildStorage (merchant: integer);    //����â��

    procedure ClientGetSendUserDisassemble (merchant: integer); //��������
    procedure ClientGetSendUserDismantle (merchant: integer);    //�Ϲݺ���
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
    procedure ClientGetDealRemoteAddItem (body: string);       //�ŷ�
    procedure ClientGetDealRemoteDelItem (body: string);       //�ŷ�
    procedure ClientGetRentalRemoteAddItem (body: string);       //�뿩
    procedure ClientGetRentalRemoteDelItem (body: string);       //�뿩
    procedure ClientGetSetItems(Msg: pTDefaultMessage; body: string);
    procedure ClientGetHintDataList(Msg: pTDefaultMessage; body: string);
    procedure ClientGetChangeGuildName (Msg: pTDefaultMessage; body: string);
    procedure ClientGetSendUserState (body: string);
    procedure ClientGetSendGuildGrow (body: string); //���ļ���
    procedure ClientGetSendGuildGrow2 (body: string); //���ļ���

    procedure ClientGetTagAlarm  (msg :TDefaultMessage;body: string);
    procedure ClientGetTagInfo   (msg :TDefaultMessage);

    procedure ClientObjBlasthit(DefMsg: pTDefaultMessage);   //������

    procedure ClientGetFriendResult(msg :TDefaultMessage;body: string);

    procedure ClientShowChangeItem;       //��ȯ
    procedure ClientObjGetGuild(Msg:pTDefaultMessage);  //���� ��ũ
    procedure ClientObjGetMask(Msg:pTDefaultMessage; Eff:string);    //����Ż ������

    procedure ClientMailList();
    procedure ClientGetMailList(msg: TDefaultMessage; body: string);
    procedure ClientMailResult(msg: TDefaultMessage);
    procedure ClientMailStatus(msg: TDefaultMessage; body: string);

    procedure RecalcNotReadCount;       //����

    procedure ClientRejectResult(msg: TDefaultMessage; body: string);
    procedure ClientGetTagRejectList(msg: TDefaultMessage; body: string);
    procedure ClientRejectListAdded(msg: TDefaultMessage; body: string);
    procedure ClientRejectListDeleted(msg: TDefaultMessage; body: string);
    procedure SetInputStatus();
    procedure ShowHumanMsg(Msg: pTDefaultMessage);
    procedure SendPowerBlock;

    procedure ClientGetSayMsg(Msg: TDefaultMessage; sBody: string);
    procedure ClientStorageSetPassWord();     //â���ȣ
    procedure ClientStorageInputPassWord(mode: integer);   //â���ȣ

    procedure ClientObjWakeUp(nItemIndex, mode: Integer; sData: string);
    procedure ClientObjWakeUpItemOK(sData: string);
    procedure ClientObjWakeUpItemFail(nFailCode, nMax: Integer; sData: string);
    //2003/007/08 ����    //���� ����
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

    //2003/007/08 ����    //���� ����
    procedure ClientGetLMList(msg: TDefaultMessage; body: string);
    procedure ClientGetLMOptionChange(msg: TDefaultMessage);
    procedure ClientGetLMRequest(msg: TDefaultMessage; body: string);
    procedure ClientGetLMResult(msg: TDefaultMessage; body: string);
    procedure ClientGetLMDelete(msg: TDefaultMessage; body: string);
    procedure EnableRogue();
    procedure DisableRogue();
    procedure ClientObjStruck(Msg: TDefaultMessage; sData: string);

    procedure ClientHeroCreate(merchant: Integer);  //���� ���
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

    RunEffectTimer: TTimer;    //�������
    WhisperName: string;
    ActionKey: word;

    procedure CmdShowHumanMsg(sParam1, sParam2, sParam3, sParam4, sParam5: String);
    procedure ProcOnIdle;
    procedure AppOnIdle (Sender: TObject; var Done: Boolean);
    procedure AppLogout;
    procedure AppLogout2;  //������
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
    procedure SendDropItem (name: string; itemserverindex: integer);    //������ ����
    procedure SendPickup;
    procedure SendPetPickup;
    procedure SendPetPickupMouse;
    procedure SendTakeOnItem (where: byte; itmindex: integer; itmname: string);
    procedure GotoUpwaoinItem(merchant, itemindex: integer; Data: string);   //���
    procedure BundleItem  (mode,MaxAmount:integer;MakeIndex:string);    //����
    procedure BundleStorageItem  (mode,MaxAmount:integer;MakeIndex:string);  //���� â��
    procedure SeparateItem(MakeIndex,amount:integer);   //����
    procedure SendTakeOffItem (where: byte; itmindex: integer; itmname: string);
    procedure SendEat (itmindex: integer; itmname: string);
    procedure UpgradeItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);            //����
    procedure UpgradeHeroItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);            //����
    procedure UpgradeItemResult (ItemIndex: integer; wResult : word; str: string);     //����
    procedure SendButchAnimal (x, y, dir, actorid: integer);
    procedure SendMagicKeyChange (magid: integer; keych: char);
    procedure SendHeroMagicKeyChange(magid: Integer; keych: Char);
    procedure SendMerchantDlgSelect (merchant: integer; rstr: string);
    procedure SendCheckMsgDlgSelect(merchant, nBut: Integer);
    procedure SendDismantleItem (merchant, itemindex: integer; itemname: string); //�Ϲݺ���
    procedure SendDismantlePrice (merchant, itemindex: integer; itemname: string);  //�Ϲݺ��ذ���
    procedure SendDisassemblePrice (merchant, itemindex: integer; itemname: string);  //���ذ���
    procedure SendDisassembleItem (merchant, itemindex: integer; itemname: string);
    procedure SendItemWakeUp (mode, itemindex: integer);       //����
    procedure SendQueryPrice (merchant, itemindex: integer; itemname: string);
    procedure SendQueryRepairCost (merchant, itemindex: integer; itemname: string);
    procedure SendQueryWakeCost(merchant, itemindex: Integer; itemname: string);
    procedure SendQueryReStoreCost(merchant, itemindex: Integer; itemname: string);
    procedure SendSellItem (merchant, itemindex: integer; itemname: string);
    procedure SendItemLock(merchant, itemindex: Integer; itemname: string);
    procedure SendItemWake(merchant, itemindex: Integer; itemname: string);
    procedure SendItemReStore(merchant, itemindex: Integer; itemname: string);
    procedure SendRepairItem (merchant, itemindex: integer; itemname: string);
    procedure SendCheckWeaponItem (merchant, itemindex: integer; itemname: string);  //���� Ȯ��
    procedure SendStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
    procedure SendHeroStorageItem (merchant, itemindex: integer; itemname: string; mode:Integer);
    procedure SendConsignItem (merchant, itemindex{,amount}: integer; cost: string);
    procedure SendStoragePassWord(nRecogId, Mode: Integer; PassWord: string); //â���ȣ
    procedure SendComStorageItem (merchant, itemindex{,amount}: integer);    //����â��
    procedure SendGuildStorageItem (merchant, itemindex{,amount}: integer);    //����â��
    procedure SendBuyItem (merchant, itemserverindex,amins: integer; itemname: string);   //����
    procedure SendPBuyItem (merchant, itemserverindex,amins: integer; itemname: string);
    procedure SendTakeBackStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
    procedure SendTakeBackHeroStorageItem (merchant, itemserverindex: integer; itemname: string; mode:Integer);
    procedure SendMakeItemSel (merchant: integer; itemname: string);  //��������
    procedure SendMakeItem (merchant: integer; data: string);       //��������
    procedure SendDropGold (dropgold: integer);
    procedure SendGroupMode ();
    procedure SendCreateGroup (ItemClass, boHero: Integer; withwho: string);
    procedure SendRentalTry;        //�뿩
    procedure SendDealTry;        //�ŷ�
    procedure SendGuildDlg;
    procedure SendCancelDeal;       //�ŷ�
    procedure SendCancelRental;       //�뿩
    procedure SendCancelExChange;  //ȯ�� ���
    procedure ClientBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //����

    procedure ClientHeroBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //��������
    procedure ClientCoolBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //����
    procedure ClientCoolTime(Body:String;Ttiem:integer); //����
    procedure ClientRockPapersGame(Gold:String; Rate:integer);
    procedure SendTigerSet (onoff: Boolean);    //ȣ����
    procedure SendGuildSet (guildimg: integer);    //���� ��ũ
    procedure SendGuildGrowUp (guildUP: integer);    //���ļ���

    procedure ClientAucBuff(Makeindex:String;Cost:integer);  //���


    procedure SendAddAutItem (ci: TClientItem; Price:Integer);  //���

    procedure SendAddRentalItem (ci: TClientItem;Day: integer);  //�뿩
    procedure SendDelRentalItem (ci: TClientItem);   //�뿩
    procedure SendChangeRentalGold (gold: integer);  //�뿩
    procedure SendRentalEnd;                        //�뿩

    procedure SendAddDealItem (ci: TClientItem);          //�ŷ�
    procedure SendDelDealItem (ci: TClientItem);         //�ŷ�
    procedure SendDelDealItem2 (ci: TClientItem);         //�ŷ�
    procedure SendChgStorePw (storepasswd, newstorepasswd: string);
    procedure SendChangeDealGold (gold: integer);          //�ŷ�
    procedure SendDealEnd;                                //�ŷ�

    procedure SendChangeExChangeGold (gold: integer);   //ȯ��
    procedure SendChangeExChangeGameGold (gold: integer);   //ȯ��
    procedure SendExChangeEnd;     //ȯ�� �Ϸ�
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

    // 2003/04/15 ģ��, ����
    procedure SendMail        (data: string);     //�޸�
    procedure SendReadingMail (Id: integer);      //�޸�
    procedure SendDelMail     (Id: integer);     //�޸�
    procedure SendLockMail    (Id: integer);      //�޸�
    procedure SendUnLockMail  (Id: integer);       //�޸�
    procedure SendMailList;                       //�޸�
    procedure SendRejectList;     //�ź���

    procedure SendAddReject   (data: string);
    procedure SendDelREject   (data: string);

    //���� ����
    procedure SendLMOPtionChange(OptionType: integer; Enable: integer);     //���� ����
    procedure SendLMRequest(ReqType: integer; ReqSeq: integer);
    procedure SendLMSeparate(ReqType: integer; Data: string);

    //���� ����
    procedure SendMERequest(ReqType: integer; ReqSeq: integer; ReqRe: integer; Data: string);
    procedure SendMESeparate(ReqType: integer; Data: string);

    procedure SendStartStore();   //���λ���
    procedure SendBuyStoreItem(sItems: string; nMakeIndex, nRecogId: Integer);  //���λ���

    procedure SendTradeGT(Answer:integer);
    procedure SendBBSListRequest(merchant: integer; menuindex: integer);     //����Խ���
    procedure SendBBSMsgRequest(Merchant: integer; Index: integer);          //����Խ���
    procedure SendBBSPost(Merchant,sticky,MasterPost: integer; sMsg: String); //����Խ���
    procedure SendBBSDelete(Merchant,index: integer);                         //����Խ���
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
    function CheckItemDelay (mode:integer): Boolean;     //�����ǿ�
    procedure SendWakeUpItem(UpgradeItemIndexs: Integer; mode: byte; sData:string);
    procedure SendWakeUp(UpgradeItemIndexs: Integer; mode: byte; sData:string);

    procedure QueryRogueEnabled;

    procedure SendAddAutoItem (itemindex: integer; itemname: string);
    procedure SendDelAutoItem (itemserverindex: integer; itemname: string);

    procedure SelectChr(sChrName:String);
    function  GetNpcImg(wAppr: Word; var WMImage: TWMImages): Boolean;
    function  GetWStateImg(Idx:Integer): TDirectDrawSurface;overload;    //����â(�⺻)
    function  GetWStateImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â(�⺻) overload

    function  GetWStateComManImg(Idx:Integer): TDirectDrawSurface;overload;    //����â(����볲��)
    function  GetWStateComManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â(����볲��) overload

    function  GetWStateComWomanImg(Idx:Integer): TDirectDrawSurface;overload;    //����â(����뿩��)
    function  GetWStateComWomanImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â(����뿩��) overload

    function  GetWStateWarrManImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ��������(��)
    function  GetWStateWarrManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â ��������(��) overload
    function  GetWStateWarrWoImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ��������(��)
    function  GetWStateWarrWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â ��������(��) overload

    function  GetWStateWizManImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ȫ������(��)
    function  GetWStateWizManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload;  //����â ȫ������(��) overload
    function  GetWStateWizWoImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ȫ������(��)
    function  GetWStateWizWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â ȫ������(��� overload

    function  GetWStateMonkManImg(Idx:Integer): TDirectDrawSurface;overload;    //����â �ͼ�����(��)
    function  GetWStateMonkManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â �ͼ�����(��) overload
    function  GetWStateMonkWoImg(Idx:Integer): TDirectDrawSurface;overload;    //����â �ͼ�����(��)
    function  GetWStateMonkWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â �ͼ�����(��) overload

    function  GetWStateAssManImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ���ڰ�(��)
    function  GetWStateAssManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â ���ڰ�(��) overload
    function  GetWStateAssWoImg(Idx:Integer): TDirectDrawSurface;overload;    //����â ���ڰ�(��)
    function  GetWStateAssWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface;overload; //����â ���ڰ�(��) overload

    function  GetWWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWWeapon_BonzeImg(Weapon, m_btSex, nFrame: Integer; var ax, ay: Integer): TDirectDrawSurface;
    function  GetWFishingWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //����
    function  GetWFishingUpWeaponImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //����
    function  GetWWeapon_Killer_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //�ڰ� ������
    function  GetWWeapon_Killer_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //�ڰ� �޼�

    function  GetWWeapon_CommonImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //�����
    function  GetWWeapon_WarrImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //��������
    function  GetWWeapon_WizImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //ȫ������
    function  GetWWeapon_MonkImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //�ͼ�����

    function  GetWWeapon_Assassin_RightImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //���ڰ� ������
    function  GetWWeapon_Assassin_LeftImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //���ڰ� �޼�

    function  GetWHumImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum3Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum4Img(Dress,m_btSex,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;
    function  GetWHum_BonzeImg(Dress,m_btSex, nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;

    function  GetWHum_CommonImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;//� �⺻
    function  GetWHum_KillerImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //�ڰ�
    function  GetWHum_Killer2Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //�ڰ�
    function  GetWHum_Killer4Img(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //�ڰ�
    function  GetWHumUp_WarrImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //��������
    function  GetWHumUp_WizImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //ȫ������
    function  GetWHumUp_MonkImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //�ͼ�����
    function  GetWHumUp_AssassinImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //���ڰ�
    procedure ProcessCommand(sData:String);
    procedure UseLoopNormalEffect(ActorID: integer; EffectIndex, LoopTime: word);
    procedure ClientGetDiceGame(Body:String); //�������
    procedure SendDiceitem (nFrame:Integer;shopok: string);   //�������
    procedure ClientWakeData(DefMsg: pTDefaultMessage; Body:String);   //�������
    procedure ClientGetShopData(Body:String);   //ȯ����
    procedure Sendshopbuyitem (shopok: string);   //ȯ����
    procedure ClientGifts(Body:String);     //ȯ����

//    procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
   // procedure WMSetFocus(var WMessage: TMessage); message WM_SETFOCUS;
   // procedure WMKillFocus(var WMessage: TMessage); message WM_KILLFOCUS;
    function CheckApiHook(): Boolean;

    procedure SendNewHero(merchant: Integer; uname, shair, sjob, ssex: string); //��������
    procedure HeroSeparateItem(MakeIndex,amount:integer);   //����
    procedure BundleHeroItem  (mode,MaxAmount:integer;MakeIndex:string);    //����
    procedure BundleHeroStorageItem  (mode,MaxAmount:integer;MakeIndex:string);
    procedure HeroEatItem(idx: Integer);
    procedure SendAutoHeroEat(itmindex: Integer; itmname: string);
    procedure SendHeroEat(itmindex: Integer; itmname: string);

    procedure SendHeroTakeOnItem (where: byte; itmindex: integer; itmname: string);
    procedure SendHeroTakeOffItem(where: Byte; itmindex: Integer; itmname: string);
    procedure SendItemToHeroBag(where: Byte; itmindex: Integer; itmname: string); //���� > ���� ��������
    procedure SendItemToMasterBag(where: Byte; itmindex: Integer; itmname: string); //���� > ���� ��������

    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;       //�����Ǿ����ϴ�.
    procedure ProcessMsg(wIdent: Word; sData: string);                      //�����Ǿ����ϴ�.
  end;
  TProgram = record                //�����Ǿ����ϴ�.
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

  function RunProgram(var ProgramInfo: TProgram; sHandle: string; dwWaitTime: LongWord): LongWord;     //�����Ǿ����ϴ�.
  function StopProgram(var ProgramInfo: TProgram; dwWaitTime: LongWord): Integer;                      //�����Ǿ����ϴ�.
  procedure SendProgramMsg(DesForm: THandle; wIdent: Word; sSendMsg: string);                          //�����Ǿ����ϴ�.
  function GetHardDiskSerial(const DriveLetter: Char): string;                                         //�����Ǿ����ϴ�.
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
  LocalLanguage    :TImeMode = imSAlpha;  //�ѱ�
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
  AngelFastDraw : Boolean; //����

  SkillBarNum : integer;
  SkillBarView : integer;
  SkillKeyMode : integer;

  VerInfoStr1, VerInfoStr2, VerInfoStr3, VerInfoStr4 : String; //����
  starttime: tdatetime; //����ð�
  StartTimeStr :String;
  t1:integer;

  LogInVer :String; //����
  HourExp :Integer;
  gAutoRun : Boolean;
  UpItemItem: TClientItem;
  DelTempItem: TClientItem;

  EffectNum : integer;        //�������

  SpeedHackUse: Boolean;
  // 2003/04/15 ģ��, ����
  MailLists     : TList;       //�޸�
  BlockLists    : TStringList;
  MailAlarm     : Boolean;      //�޸�
  WantMailList  : Boolean;     //�޸�
  WantBlockList  : Boolean;
  ConnectFriend : integer;
  ConnectBlack  : integer;
  NotReadMailCount : integer;      //�޸�

  savefilepath: string;
  GameGuard: TProgram;                   //�����Ǿ����ϴ�.
  g_dwStopTick: LongWord;                //�����Ǿ����ϴ�.
  g_dwStopTimeOut: LongWord = 10000;     //�����Ǿ����ϴ�.


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
   StrPCopy (pstr, '���Ĵ�˵2');
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
      FrmDlg.strlMacros.Strings[0] := (inifile.ReadString('Macros','1','���á�'));
      FrmDlg.strlMacros.Strings[1] := (inifile.ReadString('Macros','2','�ܸ��˼����㡣'));
      FrmDlg.strlMacros.Strings[2] := (inifile.ReadString('Macros','3','�������һ������'));
      FrmDlg.strlMacros.Strings[3] := (inifile.ReadString('Macros','4','������ҡ�'));
      FrmDlg.strlMacros.Strings[4] := (inifile.ReadString('Macros','5','��ʱ��Ϣһ�°ɡ�'));
      FrmDlg.strlMacros.Strings[5] := (inifile.ReadString('Macros','6','ף����Ϸ����졣'));
      FrmDlg.strlMacros.Strings[6] := (inifile.ReadString('Macros','7','�ټ���һ·˳�硣'));
      FrmDlg.strlMacros.Strings[7] := (inifile.ReadString('Macros','8','��ã��´��ټ���'));
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
      inifile.WriteString('Macros','1','���á�');
      inifile.WriteString('Macros','2','�ܸ��˼����㡣');
      inifile.WriteString('Macros','3','�������һ������');
      inifile.WriteString('Macros','4','������ҡ�');
      inifile.WriteString('Macros','5','��ʱ��Ϣһ�°ɡ�');
      inifile.WriteString('Macros','6','ף����Ϸ����졣');
      inifile.WriteString('Macros','7','�ټ���һ·˳�硣');
      inifile.WriteString('Macros','8','��ã��´��ټ���');
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
   if (WParam = 9) and (g_nLastHookKey = 18) and (GetTickCount - g_dwLastHookKeyTime < 500) then begin    //ALT+TAB ��Ʈ��
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


function GetdisplayDeepcolorX: integer; //�õ�ϵͳ�ֱ���X
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmPelsWidth;
end;

function GetdisplayDeepcolorY: integer; //�õ�ϵͳ�ֱ���y
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmPelsheight;
end;

function GetDisplayFrequency: Integer; //â���
var
  DeviceMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);
  Result := DeviceMode.dmDisplayFrequency;
end;

function GetdisplayDeepcolor: integer; //�õ�ϵͳɫ��
var
  devicemode: Tdevicemode;
begin
  enumdisplaysettings(nil, cardinal(-1), devicemode);
  result := devicemode.dmBitsPerPel;
end;

procedure ChangeDisplayFrequency(iFrequency: Integer); //����ˢ����,��Win2000�³ɹ�
var
  DeviceMode: TDeviceMode;
begin
  EnumDisplaySettings(nil, Cardinal(-1), DeviceMode);
  DeviceMode.dmDisplayFrequency := Cardinal(iFrequency);
  devicemode.dmBitsPerPel := 16;
  ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;

procedure reChangeDisplayFrequency(); //�Ļ�ԭ����ʾ����
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
       xtxx := GetDisplayFrequency; //â���
       xtxy := GetdisplayDeepcolor; //ɫ��
       frmmain.XTXTy := GetdisplayDeepcolorY; //768
       frmmain.TXTXX := getdisplaydeepcolorX; //1024
       if xtxy <> 16 then begin
         ChangeDisplayFrequency(xtxx); //â���
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


   //���� ���� �ʱ�ȭ
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

   g_FriendList := TStringList.Create; //���ο�ģ��
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

   g_BuffList := TList.create;     //����
   g_HeroBuffList      := TList.create;     //����
   g_CoolBuffList := TList.create;     //��Ÿ�ӹ���
   g_AucList := TList.create;  //���
   m_CoolTimeMSG      := TStringList.Create;

   //ȯ����
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
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);   //������ ����
   FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);

   FillChar(g_AutoPotItems, SizeOf(TClientItem) * 2, #0);
   FillChar(g_HeroUseItems, SizeOf(TClientItem) * MAXHEROUSEITEM, #0);
   FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
   MoveingItemIndex := -1;
   FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_DealItems, sizeof(TClientItem)*10, #0);             //�ŷ�
   FillChar (g_DealRemoteItems, sizeof(TClientItem)*20, #0);       //�ŷ�

   FillChar(HeroArr, SizeOf(TSelHero) * 4, #0);

   FillChar (g_RentalItems, sizeof(TClientItem), #0);             //�뿩
   FillChar (g_RentalRemoteItems, sizeof(TClientItem), #0);       //�뿩

   FillChar (G_BuyItem, sizeof(SBuyItem)*MAXBUYITEM, #0);     //����
   FillChar (G_UpWaponItem, sizeof(TClientItem)*16, #0);     //���
   FillChar (g_StoreItems, SizeOf(TStoreItem) * 15, #0);          //���λ���
   FillChar (g_StoreRemoteItems, SizeOf(TStoreItem) * 15, #0);     //���λ���

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
   g_boViewFog := True; //�㳷����
   DarkLevel := 0;     //�㳷����
   SocStr := '';
   ActionFailLock := FALSE;
   //g_boMapMoving := FALSE;
   g_boMapMovingWait := FALSE;

   g_boCheckSpeedHackDisplay := FALSE;
   g_boViewMiniMap := FALSE;

   //���� �ݱ� �ɼ�
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
   g_boCanWBHit   := FALSE;  //ǳ�˼�
   g_boCanCrsBHit := FALSE;

   AngelFastDraw := TRUE;       //����
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

   g_sItemWakeUpPriceStr := 0;  //����
   g_sDismantlePriceStr := '';

   GetFileCVersion(ParamStr(0), @g_FileVersionInfo);

   g_boItemHint := False;
   g_boSetHint  := False;
  // g_bobuttHint := False;

   t1:=0; //����ð�

   LogInVer := ''; //����
   HourExp:=0;

   g_boAllowGroup := FALSE;    //�׷�
   g_boCheckGroup := TRUE;
   g_boCheckHero := FALSE;
   g_GroupItemMode := FALSE;
   g_boHeroAiMode := 0;

   //g_boMsgDlgTimeCheck := False;  //�׷�
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
   g_CheckPetDB := True;    //���� db
   g_FishingOk := False;       //���� �� Ȯ��
   m_boWakeUp := False;
   g_AutoRate := False;
   g_AutoRateIn := 0;
   g_boFishCatch := False;   //���� �� ���..
   g_CheckEsc := False;      //Esc Ű�� ���� ���� �Ұ���
   g_AutoFish := False;
   g_FishTime := 0;
   g_FishTiming := 0;      //���� ���̹�
   g_AutoFishTick := GetTickCount;

   g_KeyDownTick := GetTickCount;
   g_boHeroProtect := False;
   g_TigerSet := False; //Ż��

   g_LegendMap := TLegendMap.Create;

   // 2003/04/15 ģ��, ����
   MailLists     := TList.Create;         //�޸�
   BlockLists    := TStringList.Create;
   MailAlarm     := false;               //�޸�
   WantMailList  := false;              //�޸�
   WantBlockList  := false;

   fLover := TRelationShipMgr.Create;        //���� ����
   fMentor := TMentorShipMgr.Create;  //���� ����

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

   RunEffectTimer := TTimer.Create (self); //�������
   RunEffectTimer.Interval := 400;
   RunEffectTimer.Enabled := False;
   RunEffectTimer.OnTimer := RunEffectTimerTimer;
   RunEffectTimer.Tag := 555;

   EffectNum := 0; //�������

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
   StartGame();      //�����Ǿ����ϴ�.
end;

procedure TfrmMain.OnProgramException (Sender: TObject; E: Exception);
begin
   DebugOutStr (E.Message);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
  procedure KillProcess(Const ProcName: String);            //�����Ǿ����ϴ�.
  var
   Process32: TProcessEntry32;
   SHandle:   THandle;  // the handle of the Windows object
   Next:      BOOL;
   ProcId   : DWORD;
  begin
    Process32.dwSize := SizeOf(TProcessEntry32);                           //�ڷḦ ���� ���� ũ�� ����
    SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);   //����� ����

    if Process32First(SHandle, Process32) then     //���� ó���� ���μ��������� ��´�.
    begin

      repeat
        Next := Process32Next(SHandle, Process32);                //���� ���μ��� ������ ��´�.
        if Next then                                              //���� ���� ����
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
  KillProcess(DecodeString_3des('7Wvy21rJMPboBb7gMA==', '56m2VipGate'));   //�����Ǿ����ϴ�.
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

   FreeAndNil(g_FriendList);     //���ο�ģ��
   FreeAndNil(g_MyBlacklist);
   //ȯ����

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

   g_BuffList.free;         //����
   g_HeroBuffList.free;
   g_AucList.free;     //���

   g_CoolBuffList.free;            //��Ÿ�ӹ���


   fLover.Free;          //���� ����
   fMentor.Free;       //���� ����

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

   if RunEffectTimer  <> nil then RunEffectTimer.Free;         //�������

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
   if g_boShowAllItem then begin  //������ ������ �̸����� �ٴ�
      if TabClickTime + 4000 > GetTickCount then begin    //3��
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

   DScreen.DrawScreenCool(DxDraw.Surface); //����
   g_DWinMan.DirectPaint (DxDraw.Surface);
   DScreen.DrawScreenTopGm (DxDraw.Surface);     //����
   DScreen.DrawScreenOldTop (DxDraw.Surface);
   DScreen.DrawScreenTop (DxDraw.Surface);     //������ ȹ��
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
        if (g_MovingItem.Item.Amount > 0) and (g_MovingItem.Item.S.StdMode in [0,1,3,45,46]) then begin   //����
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

   if g_boShowFormImage then begin          //����˵��ͼƬ
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

   //�α���ȭ�� ���� �α� (12���̿밡)
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
   if mrOk = FrmDlg.DSimpleMessageDlg2 ('��ȷ��Ҫ���ؽ�ɫѡ�������', [mbOk, mbCancel]) then begin
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

procedure TfrmMain.AppLogout2;     //������ ������ ��Ȱ
begin
   if mrOk = FrmDlg.DSimpleMessageDlg2 ('�㽫�����������ͣ���Ĵ�ׯ��\��ȷ��Ҫ�����ͣ���Ĵ�ׯ������', [mbOk, mbCancel]) then begin
        FrmMain.SendSay ('@REALIVEHOME');
   end;
end;

procedure TfrmMain.AppExit;
begin
  if (g_FishingOk = False) and (FrmDlg.DDiceGame.Visible = FALSE) then begin
    if mrOk = FrmDlg.DSimpleMessageDlg2 ('��ȷ��Ҫ�˳���Ϸ��', [mbOk, mbCancel]) then begin
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
             //��ũ���� ���� �ѹ�
   if not DxDraw.CanDraw then exit;

   Dirname := GetCurrentDir;
   if Copy(Dirname, Length(Dirname), 1) <> '\' then Dirname := Dirname + '\';
   Dirname := Dirname + 'Screenshot\';
   if not DirectoryExists(Dirname) then CreateDir(Dirname);

   while TRUE do begin
     flname := Dirname + 'Images' + IntToStr2(g_nCaptureSerial) + '.bmp';  //����
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
   checksum := 0; //äũ���������.
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
      DScreen.AddSysMsg('<CO$FFC0F0>' + flname + '<CE>�ѽ�ͼ�ɹ���', 40, 60, clYellow);
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
     49..55: begin    //����
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
    if (g_MySelf.m_btHorse <> 0) or (g_MySelf.m_nState and $00008000 <> 0) then begin    //Ż��
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
        DScreen.AddSysMsg('[���Ѿ��ƶ�����Ŀ�ĵء�]', 40, 60, clYellow);
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
        DScreen.AddSysMsg('[���Ѿ��ƶ�����Ŀ�ĵء�]', 40, 60, clYellow);
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
               if (g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0) then begin   //������ ������
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
                        if not bostop and not PlayScene.CrashMan(mx,my) then begin       //����� �ڵ����� ������ ����..
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

            caRun: begin  //�޸���

               if g_boCanStartRun or (g_nRunReadyCount >= 1) then begin //����?
                  crun := g_MySelf.CanRun;

                  if (g_MySelf.m_btHorse <> 0) then begin
                    if (GetDistance (mx, my, dx, dy) >= 3) and (crun > 0) then begin  //ȣ����
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

                    if ((g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0)) and (g_MySelf.m_nState and $00008000 <> 0) then begin    //��ź� + ������  ������
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
                      if g_MySelf.m_nState and $00008000 <> 0 then begin    //��ź�
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
                        if (g_MySelf.m_nState and $00004000 <> 0) or (g_MySelf.m_nState and $00000080 <> 0) then begin    //������  ������
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
   g_nTargetX := -1;    //�ѹ��� ��ĭ��..
   if g_MySelf.RealActionMsg.Ident > 0 then begin
      FailAction := g_MySelf.RealActionMsg.Ident;      //�����Ҷ� ���
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
            FrmDlg.SafeCloseDlg;      //��������
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
        if ChrArr[0].Selected then begin     //����Ű ĳ������
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
  or FrmDlg.EdStoreMsgEdit.Visible or FrmDlg.EdStoreMacrosEdit.Visible then exit; //ȯ���� �˻�, ��Ź �˻�
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
        if (not (g_MySelf.m_btHorse <> 0)) and (not (g_MySelf.m_nState and $00000200 <> 0)) then begin    //ȣ���� ����
          if (GetTickCount - g_dwLatestSpellTick > (g_dwSpellTime + g_dwMagicDelayTime)) then begin
            if (g_MyHero <> nil) and (ssShift in Shift) then begin
              ActionKey:=Key - 63;
            end else
            if (ssCtrl in Shift) or (g_boSkillBarNum = 2) then ActionKey:=Key - 100
            else ActionKey:=Key;
          end;
          Key := 0;
        end; //ȣ���� ��
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
    VK_ESCAPE: begin      //ESC Ű
      CloseAllWindows;
    end;
    VK_INSERT : begin
      g_boDrugOn := not g_boDrugOn;
    end;
    word('H'): begin       //���� ���
      if ssCtrl in Shift then begin
        SendSay ('@AttackMode');
      end;
    end;
    Word('C'): begin //���� ����â
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
    Word('I'): begin //���� ����
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

    word('S'): begin    //��������
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
    word('X'):     //������ ���� ����
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
                DScreen.AddChatBoardString ('��ս�����㲻���˳���Ϸ��', clYellow, clRed);
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
   if FrmDlg.DSelServerDlg.Visible then begin   //��������
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

   if (not FrmDlg.DFishProgressDlg.Visible) and g_DWinMan.KeyPress (Key) then exit;   //����

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

      if (FrmDlg.ESitemName.Visible) then exit; //����

      if (key = #43) then begin // ���� +
        if g_btSoundVolume <= 100 then begin
          g_btSoundVolume:= g_btSoundVolume + 5;
          if g_btSoundVolume >= 96 then g_btSoundVolume := 100;
          g_Sound.Volume := g_btSoundVolume;
          if g_btSoundVolume >= 1 then begin
            g_boSound := True;      //�Ҹ� �ѱ�
          end;
        end;
        if g_btMP3Volume <= 100 then begin
          g_btMP3Volume:= g_btMP3Volume + 5;
          if g_btMP3Volume >= 96 then g_btMP3Volume := 100;
          if g_btMP3Volume >= 1 then begin
            g_boBGSound := True;      //�Ҹ� �ѱ�
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
      if (key = #45) then begin // ���� -
        if g_btSoundVolume > 1 then begin
          g_btSoundVolume:= g_btSoundVolume - 5;
          if g_btSoundVolume <= 4 then g_btSoundVolume := 1;
          g_Sound.Volume := g_btSoundVolume;
          if g_btSoundVolume <= 1 then begin
            g_boSound := false;       //�Ҹ� ����
            SilenceSound;
          end;
        end;

        if g_btMP3Volume > 1 then begin
          g_btMP3Volume:= g_btMP3Volume - 5;
          if g_btMP3Volume <= 4 then g_btMP3Volume := 1;
          if g_btMP3Volume <= 1 then begin
            g_boBGSound := false;       //�Ҹ� ����
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

      byte('J'), byte('j'): begin//ȣ����
        if g_UseItems[U_TIGER].S.Name <> '' then begin
          FrmDlg.ToggleShowTigerDlg();
        end else
        DScreen.AddChatBoardString ('����Ҫװ���������ʹ�øù��ܡ�',ClRed,ClWhite);
      end;

      byte('N'), byte('n'): begin //����
        if (g_UseItems[U_WEAPON].S.Name <> '') and (g_UseItems[U_WEAPON].S.Shape in [47,48]) then begin
            FrmDlg.DFishDlg.Visible := not FrmDlg.DFishDlg.Visible;
        end else begin
          DScreen.AddChatBoardString ('����Ҫװ�����߲���ʹ�øù��ܡ�',ClRed,ClWhite);
        end;
      end;

      byte('Y') , byte('y'): begin  //��ȯ����
        if not PlayScene.EdChat.Visible then begin
            FrmDlg.OpenItemShopDBl();
        end;
      end;

      byte('E') , byte('e'): begin  //����
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
          DScreen.AddChatBoardString ('<�ر�Ч����ʾ>', clGreen, clWhite)
        end else begin
         AngelFastDraw := True;
         DScreen.AddChatBoardString ('<����Ч����ʾ>', clGreen, clWhite)
        end;
      end;


      byte('D') ,byte('d'):
          begin
              g_nRunReadyCount := 0;
              if gAutoRun then begin
                 gAutoRun := False;
                 DScreen.AddSayMsg('<�ر��Զ��ܹ���>', clGreen, clWhite, True, us_Sys);
              end
              else begin
                 gAutoRun := True;
                 DScreen.AddSayMsg('<�����Զ��ܹ���>', clGreen, clWhite, True, us_Sys);
              end;
          end;

      byte('V'), byte('v'):
          begin
              FrmDlg.DBotMiniMapClick(Nil,0,0);
          end;
      byte('F'), byte('f'): begin
            FrmDlg.DBotMasterClick(Nil,0,0);   //���� ����
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
            FrmMain.SendDealTry;   //�ŷ�
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
          FrmDlg.DBotLoverClick(Nil,0,0);    //����
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
              if (GetTickCount - BeltchekClick) > 400 then begin  //����
                  FrmDlg.SwapBujuk(byte(key) - byte('1'));   //����
                  EatItem (byte(key) - byte('1'));     //��Ʈ �������� ����Ѵ�.
              end;
            end;
         Byte('7'),Byte('8'): begin
           if (GetTickCount - BeltchekHeroClick) > 400 then begin  //����
             HeroEatItem(Byte(Key) - Byte('7'));
           end;
         end;
            //��ų��
         byte('`'):
            begin
              if g_boSkillSetting then begin
                if g_boSkillBarNum = 1 then g_boSkillBarNum := 2
                else if g_boSkillBarNum = 2 then g_boSkillBarNum := 1;
                DScreen.AddChatBoardString ('<���ܿ���� '+IntToStr(g_boSkillBarNum)+'>',ClGreen,ClWhite);
              end;
            end;

         27: //ESC
            begin
            end;
         13: //����
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
                   usm_Lover: PlayScene.EdChat.Text := '��';
                   usm_Master: PlayScene.EdChat.Text := '��';
                 end;
                 PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                 PlayScene.EdChat.SelLength := 0;
               end else begin
                 PlayScene.EdChat.Text := '';
               end;
              // end;
            end;
         byte(' '):    //�����̵� ��..
            begin
            if GetTickCount - g_dwLastMoveTick > 1000 then begin     //�̵��߿� Ż�� Ż �� ����
             if (g_UseItems[U_TIGER].S.Name <> '') and (g_FishingOk = False) then begin     //ȣ����
              if g_UseItems[U_TIGER].Dura > 0 then begin
               if (g_UseItems[U_PETS3].S.Name <> '') and (g_UseItems[U_PETS3].Dura > 0) then begin   //���� ����
                if not (g_MySelf.m_nState and $00004000 <> 0) and not (g_MySelf.m_nState and $00000080 <> 0) then begin   //������ ������
                  if GetTickCount > g_dwChangeTigerSetTick then begin
                     g_TigerSet := not g_TigerSet;
                     g_dwChangeTigerSetTick := GetTickCount + 3000; //3�� ������
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
               DScreen.AddChatBoardString ('����Ҫװ�����߲���ʹ�á�',ClRed,ClWhite);
               end;
              end else begin
               SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);
               DScreen.AddChatBoardString ('���������ҳ϶�̫�͡�',ClRed,ClWhite);
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
               end else if key = ',' then begin     //���� ����
                  if Copy(fLover.GetDisplay(0), length(STR_LOVER) + 1, 6) <> '' then
                  PlayScene.EdChat.Text := '��'
                  else
                  PlayScene.EdChat.Text := key;
                  PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                  PlayScene.EdChat.SelLength := 0;
               end else if key = '\' then begin     //���� ����

                  if fMentor.GetMode = 1 then begin
                   if Copy(fMentor.GetDisplay(0), length(STR_PUPIL) + 1, 6) <> '' then
                    PlayScene.EdChat.Text := '��'
                   else
                    PlayScene.EdChat.Text := key;
                    PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
                    PlayScene.EdChat.SelLength := 0;
                  end else begin
                    if Copy(fMentor.GetDisplay(0), length(STR_MENTOR) + 1, 6) <> '' then
                    PlayScene.EdChat.Text := '��'
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
       g_dwLatestMagicTick := GetTickCount; //������ ���� ���� �κ�..
   end;

   SpellSpend := Round(pcm.Def.wSpell / (pcm.Def.btTrainLv+1) * (pcm.Level+1)) + pcm.Def.btDefSpell;

   if pcm.Def.wMimicID = 75 then begin  //����
      SpellSpend2:= LoWord(g_MySelf.m_Abil.SC) + HiWord(g_MySelf.m_Abil.SC);
      SpellSpend := SpellSpend + SpellSpend2;
   end;

   if g_MySelf.m_nState and 00010000 <> 0 then begin //�ɿ���
      SpellSpend := SpellSpend * 2;
   end;

   if (SpellSpend <= g_MySelf.m_Abil.MP) or (pcm.Def.btEffectType = 0) then begin

      if pcm.Def.btEffectType = 0 then begin
         if pcm.Def.wMimicID = 26 then begin   //��ȭ��
            if GetTickCount - g_dwLatestFireHitTick < 10 * 1000 then begin
               exit;
            end;
         end;
         if pcm.Def.wMimicID = 110 then begin   //�����
            if GetTickCount - g_dwLatestDeathHitTick < 10 * 1000 then begin
               exit;
            end;
         end;
         if pcm.Def.wMimicID = 27 then begin  //���º�
            if GetTickCount - g_dwLatestRushRushTick < 3 * 1000 then begin
               exit;
            end;
         end;

         if pcm.Def.wMimicID = 38 then begin //�ַ���
          //  BoStopAfterAttack := TRUE;
            DrawEffectHum(8,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;
         if pcm.Def.wMagicId = 73 then begin    //õ��
            UseNormalEffect (NE_CHUNMU, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY);
         end;


         if pcm.Def.wMimicID = 117 then begin //�������
           // BoStopAfterAttack := TRUE;
            DrawEffectHum(74,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;
         if pcm.Def.wMimicID = 119 then begin //õȭ����
          //  BoStopAfterAttack := TRUE;
            DrawEffectHum(75,g_Myself.m_nCurrX,g_Myself.m_nCurrY,0);
         end;

         if pcm.Def.wMimicID = 62 then begin  //�ߵ��� ������
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
//����Ÿ�� (�߰� ���ؾ� ����Ÿ��)         //����
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
            PlayScene.CXYfromMouseXYMid (tx, ty, targx, targy); //���� ��Ȯ��
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
              if pcm.Def.wMimicID = 75 then begin  //���� ������
                g_dwMagicDelayTime := pcm.Def.dwDelayTime;
              end else
               g_dwMagicDelayTime := 200 + pcm.Def.dwDelayTime;

              g_dwMagicPKDelayTime := 0;
              if g_MagicTarget <> nil then
              if g_MagicTarget.m_btRace = 0 then
                g_dwMagicPKDelayTime := 300 + Random(1100); //(600+200 + MagicDelayTime div 5);

              g_MySelf.SendMsg (CM_SPELL, targx, targy, tdir, Integer(pmag), targid, '', 0);

            end;
         end;                    //����
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
      Dscreen.AddSysMsg ('<CO$FFFF>ħ��ֵ<CE>���㡣', 40, 60, clLime);
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
    g_dwLatestMagicTick := GetTickCount; //������ ���� ���� �κ�..
  end;

  SpellSpend := Round(pcm.Def.wSpell / (pcm.Def.btTrainLv+1) * (pcm.Level+1)) + pcm.Def.btDefSpell;

  if (SpellSpend <= g_MyHero.m_Abil.MP) or (pcm.Def.btEffectType = 0) then begin
    if (pcm.Def.btEffectType = 0) then begin     //�˹�,ȿ������

        if pcm.Def.wMagicId = 26 then begin //��ȭ��
          if GetTickCount - g_dwLatestFireHitTick < 10000 then begin
            Exit;
          end;   
        end;

        if pcm.Def.wMagicId = 38 then begin //�ַ���
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
        PlayScene.CXYfromMouseXYMid (tx, ty, targx, targy); //���� ��Ȯ��
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
  end else DScreen.AddSysMsg('Ӣ�۵�ħ��ֵ���㡣', 40,60, clYellow);
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
    NE_CLONEHIDE: //�нż�-�н� ������� ����Ʈ
      begin
         meff := TCharEffect.Create (690, 10, actor);
         meff.NextFrameTime := 150;
         meff.RepeatUntil := 0;
         PlaySound (48);
      end;

    NE_MONCAPTURE{9}: //���°�-��ȹ ����Ʈ
      begin
         meff := TCharEffect.Create (1020, 8, actor);
         meff.NextFrameTime := 110;
         meff.RepeatUntil := GetTickCount + LoopTime;
         meff.ImgLib := g_WMagic2Images;
         PlaySound (10475);
      end;

    NE_REVIVALCHARGE: //�һ���
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
      if (g_EatingItem.S.Name = '') and (g_ItemArr[idx].S.Name <> '') and (g_ItemArr[idx].S.StdMode <= 3)  then begin        //����
         if g_ItemArr[idx].Amount <= 1 then begin   //����
           g_EatingItem := g_ItemArr[idx];
           g_ItemArr[idx].S.Name := '';
         end;
         if (g_ItemArr[idx].S.StdMode = 4) and (g_ItemArr[idx].S.Shape < 100) then begin
            if (g_ItemArr[idx].S.Shape < 50) or (g_ItemArr[idx].S.Shape = 99) then begin
               if mrYes <> FrmDlg.DMessageDlg ('��ȷ��Ҫѧϰ����' + g_ItemArr[idx].S.Name + '��', [mbYes, mbNo]) then begin
                  g_ItemArr[idx] := g_EatingItem;
                  exit;
               end;
            end else begin
               if mrYes <> FrmDlg.DMessageDlg ('��ȷ��Ҫʹ��' + g_ItemArr[idx].S.Name + '��', [mbYes, mbNo]) then begin
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
         Fillquickslots(g_EatingItem.S.Name,g_EatingItem.S.StdMode,idx);  //������ �ۻ������ ����?
      end;
   end else begin
      if (idx = -1) and g_boItemMoving then begin
         g_boItemMoving := FALSE;
         if g_MovingItem.Item.Amount <= 1 then begin   //����
           g_EatingItem := g_MovingItem.Item;
           g_MovingItem.Item.S.Name := '';
         end else begin
           if g_EatOp then
            g_dwEatOpTime:= GetTickCount;     //����
           g_EatingItem := g_MovingItem.Item;
           g_ItemArr[g_MovingItem.Index] := g_EatingItem;
         end;
         if (g_EatingItem.S.StdMode = 4) and (g_EatingItem.S.Shape < 100) then begin
            if (g_EatingItem.S.Shape < 50) or (g_EatingItem.S.Shape = 99)then begin
               if mrYes <> FrmDlg.DMessageDlg ('��ȷ��Ҫѧϰ����' + g_EatingItem.S.Name + '��', [mbYes, mbNo]) then begin
                  AddItemBag (g_EatingItem);
                  exit;
               end;
            end else begin
               if mrYes <> FrmDlg.DMessageDlg ('��ȷ��Ҫ����' + g_EatingItem.S.Name + '��', [mbYes, mbNo]) then begin
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
           Fillquickslots(g_EatingItem.S.Name,g_EatingItem.S.StdMode,g_MovingItem.Index);  //����
      end;
   end;
end;


procedure TfrmMain.GetMoveHPShow(Actor: TActor; nCount: Word);    //ƮѪֵ
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
      m_nMoveHpList.Add(MoveShow);          //Ÿ��ġ
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
   if g_FocusItem <> nil then begin      //������ ������ �̸����� ���콺 ��Ŀ��
      PlayScene.ScreenXYfromMCXY (g_FocusItem.X, g_FocusItem.Y, mx, my);
      FColor := clWhite;
      case g_FocusItem.Grade of
        0,1: FColor := clWhite;
        2: FColor := $00FFDF42;    //����
        3: FColor := $000075FF;    //����
        4: FColor := $00FFAADE;    //�Ź�
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
   if ((ssLeft in Shift) or (ssRight in Shift) or gAutoRun) and (GetTickCount - mousedowntime > 300) then   //����?
      _DXDrawMouseDown(self, mbLeft, Shift, X, Y);

end;

procedure TfrmMain.DXDrawMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   mousedowntime := GetTickCount;    //����
   if g_MaskRun then begin   //����Ż
     g_nRunReadyCount := 1 ;
   end else begin
     g_nRunReadyCount := 0;
   if g_HumRunDress then begin      //����
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
  if (not (g_MySelf.m_btHorse <> 0)) and (not (g_MySelf.m_nState and $00000200 <> 0))  then begin   //���� ���� ȣ���� Ÿ�� ���� ����.
   if (g_MySelf.m_btJob = 8) then begin   //��ȭ� ���ڰ� ����
    if g_MySelf.m_btWeapon in [172..179,192..197,200..205,208,209] then  //��ȭ� ��
      nHitMsg := CM_HITLEFT + Random(2)
    else
      nHitMsg := CM_HIT;
   end else

   if g_MySelf.m_btJob = 3 then begin   //�ڰ� ����
    if (g_MySelf.m_btWeapon > 179) and (g_MySelf.m_btWeapon < 220) then begin    //�ڰ� ���� �϶�
      nHitMsg := CM_HITLEFT + Random(2);
    end else
      nHitMsg := CM_HIT;
    if (g_MySelf.m_btWeapon = 0) or (g_MySelf.m_btWeapon = 1) then begin
      nHitMsg := CM_HITLEFT + Random(2);
    end;
   end else
    nHitMsg := CM_HIT;


   if g_UseItems[U_WEAPON].S.StdMode = 6 then nHitMsg := CM_HEAVYHIT;
   if (g_MySelf.m_btMask > 0) and (g_MySelf.m_btMask <> 255) then nHitMsg := CM_HIT;       //����Ż

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
         if g_boCanTaguHit and (g_MySelf.m_Abil.MP >= 5) then begin     //Ÿ������ - �·�
            nHitMsg := CM_TAGUHIT;
         end else
         if g_boCanWBHit and (g_MySelf.m_Abil.MP >= 3) then begin //ǳ�˼�
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
            target.m_dwOpenHealthStart:=GetTickCount;      //����
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

   if (Button = mbRight) and g_boItemMoving then begin      //�Ƿ�ǰ���ƶ���Ʒ
     FrmDlg.CancelItemMoving;
     exit;
   end;
   if g_DWinMan.MouseDown (Button, Shift, X, Y) then exit; //����Ƶ���������������
   if (g_MySelf = nil) or (DScreen.CurrentScene <> PlayScene) then exit;  //��������˳�������

   if ssMiddle in Shift then begin
      g_nRunReadyCount := 0;
      if gAutoRun then begin
         gAutoRun := False;
         DScreen.AddSayMsg('<�ر��Զ��ܹ���>', clGreen, clWhite, True, us_Sys);
      end
      else begin
         gAutoRun := True;
         DScreen.AddSayMsg('<�����Զ��ܹ���>', clGreen, clWhite, True, us_Sys);
      end;
   end
   else if ssLeft in Shift then begin
      if gAutoRun then begin
         g_nRunReadyCount := 0;
         gAutoRun := False;
         DScreen.AddSayMsg('<�ر��Զ��ܹ���>', clGreen, clWhite, True, us_Sys);
      end;
   end;

   if g_boAutoMoveing then begin
      g_boAutoMoveing := False;
      g_boNpcMoveing := False;
      g_nMiniMapMoseX := -1;
      g_nMiniMapMoseY := -1;
      g_nMiniMapOldX := -1;
      DScreen.AddSysMsg('[ֹͣ�Զ��ƶ���]', 40, 60, clYellow);
      g_nMiniMapPath := nil;
   end;

   if (ssRight in Shift) or gAutoRun then begin
      if Shift = [ssRight] then Inc (g_nDupSelection);          //������ ��� ����
      target := PlayScene.GetAttackFocusCharacter (X, Y, g_nDupSelection, sel, FALSE);  //���..
      if g_nDupSelection <> sel then g_nDupSelection := 0;
      if target <> nil then begin
         if ssCtrl in Shift then begin     //��Ʈ��+������Ŭ�� = ��� ���� ����
            if GetTickCount - g_dwLastMoveTick > 1000 then begin          //�ٴٰ� ���� ������ �ȳ����� �Ϸ���
               if (target <> g_MySelf) and ((target.m_nState and $00000200 <> 0) or (target.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(target.m_sUserName)) then begin
               end else begin
                 if (target.m_btRace = 0) and (not target.m_boDeath) and (Not g_boDeathMatch) and (not g_boPKZONE) then begin     //���� ���� ����
                   SendClientMessage (CM_QUERYUSERSTATE, target.m_nRecogId, target.m_nCurrX, target.m_nCurrY, 0);
                   exit;
                 end;
               end;
            end;
         end;
      end else
         g_nDupSelection := 0;

      if g_MySelf.m_boStartStore then Exit; //���λ���

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

      if (abs(g_MySelf.m_nCurrX - g_nMouseCurrX) <= 2) and (abs(g_MySelf.m_nCurrY - g_nMouseCurrY) <= 2) then begin  //������/
         tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
         if CanNextAction and ServerAcceptNextAction then begin
            g_MySelf.SendMsg (CM_TURN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
         end;
      end else begin    //�ٱ�
         g_ChrAction := caRun;
         g_nTargetX := g_nMouseCurrX;
         g_nTargetY := g_nMouseCurrY;
         exit;
      end;
   end;

   if ssLeft in Shift then begin
     if g_MyHero <> nil then begin
       if ssCtrl in Shift then begin
         if GetTickCount - g_dwLastHeroMoveTick > 3000 then begin  //���� �̵�
           g_dwLastHeroMoveTick := GetTickCount();
           g_MyHero.target;
           exit;
         end;
       end;
     end;
     //����... ���� ������ ���õ�
      target := PlayScene.GetAttackFocusCharacter (X, Y, g_nDupSelection, sel, TRUE);
      PlayScene.CXYfromMouseXY (X, Y, g_nMouseCurrX, g_nMouseCurrY);
      g_TargetCret := nil;

      if (g_UseItems[U_WEAPON].S.Name <> '') and (target = nil)
         and not (g_MySelf.m_btHorse <> 0) and (not g_MySelf.m_boStartStore) and not (g_MySelf.m_nState and $00000200 <> 0) then begin   //ȣ���� Ÿ�� ����� �ȵ�
         if g_UseItems[U_WEAPON].S.Shape = 19 then begin //���
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

         if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin  //���� �⺻
           tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
           GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, nx, ny);
           if Map.MoveFish(nx, ny) and (not g_FishingOk) then begin   //���� �� Ȯ��
             if GetTickCount - g_dwFishSetTick > 3 * 1000 then begin
               if (g_MySelf.m_btJob in [4, 9]) then begin    //�·� �İ�� ����
                 if (g_MySelf.m_btMask <> 0) then begin
                   g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                   StartFishing;  //���� Ÿ�̸ӽ���
                   PlaySound2 (s_fishingwater);
                   g_boAutoDig := False;   //��
                   g_dwFishSetTick := GetTickCount;
                   exit;
                 end else begin
                   DScreen.AddSysMsg('<CO$FFFF>[ϵͳ]<CE> ���� <CO$FFFF>�����<CE> ����ʹ�õ��㹦�ܡ�',40, 60, clWhite);
                   exit;
                 end;
               end else begin
                 g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
                 StartFishing;  //���� Ÿ�̸ӽ���
                 PlaySound2 (s_fishingwater);
                 g_boAutoDig := False;   //��
                 g_dwFishSetTick := GetTickCount;
                 exit;
               end;
             end;
           end;
         end;

      end;

      if target = nil then begin
        if PlayScene.IsSelectMyself(X, Y) and (g_MySelf <> nil) and (not g_MySelf.m_boDeath) and g_MySelf.m_boStartStore then begin//���λ���
          if GetTickCount - g_dwQueryStoreTick > 1000 then begin
            g_dwQueryStoreTick := GetTickCount;
            SendClientMessage(CM_QUERYSTORE, g_MySelf.m_nRecogId, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, 0);
          end;
          Exit;
        end;
      end;

      if (ssAlt in Shift) and not (g_MySelf.m_btHorse <> 0) and (not g_MySelf.m_boStartStore) then begin
         //���
         tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
         if CanNextAction and ServerAcceptNextAction then begin
            target := PlayScene.ButchAnimal (g_nMouseCurrX, g_nMouseCurrY);    //�տ� ���� ��ü�� �ִ� ���
            if target <> nil then begin
               SendButchAnimal (g_nMouseCurrX, g_nMouseCurrY, tdir, target.m_nRecogId);
               g_MySelf.SendMsg (CM_SITDOWN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
               exit;
            end;
            g_MySelf.SendMsg (CM_SITDOWN, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, tdir, 0, 0, '', 0);
         end;
         g_nTargetX := -1;
      end else begin

         if (target <> nil) or (ssShift in Shift) then begin    //���ʸ��콺 Ŭ�� �Ǵ� Ÿ���� ����.
            g_nTargetX := -1;
            if target <> nil then begin
               //�ȴٰ� ���� �޴��� ������ ���� ����.
               if GetTickCount - g_dwLastMoveTick > 1500 then begin
                  if (target.m_btRace = RCC_MERCHANT) and (not g_MySelf.m_boStartStore) and (GetTickCount - g_dwClickNpcTick > 500) then begin
                    if not FrmDlg.DDealDlg.Visible then begin  //�ŷ�â �������� �ȵ�
                     //������ ���,
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
                      (pos('(', target.m_sUserName) = 0)  //���ξ��� ��(�ִ� ���� �������� �ؾ���)
                     )
                     or (ssShift in Shift) //����� �Ǽ��� �����ϴ� ���� ����
                     or (target.m_nNameColor = ENEMYCOLOR)    //���� �ڵ� ������ ��
                  then begin
                     AttackTarget (target);     //���콺 Ŭ��
                     g_dwLatestHitTick := GetTickCount;
                     {if BoStopAfterAttack then begin
                        BoStopAfterAttack := FALSE;
                        g_TargetCret := nil;
                     end;   }
                  end;
               end;

               if (not target.m_boDeath) and (target.m_btRace = 0) and target.m_boStartStore then begin //���λ���
                 if GetTickCount - g_dwQueryStoreTick > 1000 then begin
                   g_dwQueryStoreTick := GetTickCount;
                   SendClientMessage(CM_QUERYSTORE, target.m_nRecogId, target.m_nCurrX, target.m_nCurrY, 0);
                 end;
                 Exit;
               end;
            end else begin
               if (g_MySelf.m_btHorse = 0) and (not g_MySelf.m_boStartStore) and not (g_MySelf.m_nState and $00000200 <> 0) then begin   //ȣ���� �������� ����
                 tdir := GetNextDirection (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_nMouseCurrX, g_nMouseCurrY);
                 if CanNextAction and ServerAcceptNextAction and CanNextHit then begin
                   if (g_MySelf.m_btMask > 0) and (g_MySelf.m_btMask <> 255) then begin //����Ż
                     nHitMsg := CM_HIT+Random(3);
                   end else
                   if g_MySelf.m_btJob = 9 then begin //��ȭ� ����
                     if g_MySelf.m_btWeapon in [172..179,192..197,200..205,208,209] then  //��ȭ� ���ڰ� ���
                      nHitMsg := CM_HITLEFT+Random(4)
                     else
                      nHitMsg := CM_HIT+Random(3)
                   end else
                   if g_MySelf.m_btJob = 3 then begin   //�ڰ� ����
                     if (g_MySelf.m_btWeapon > 179) and (g_MySelf.m_btWeapon < 220) then begin    //�ڰ� ����
                       nHitMsg := CM_HITLEFT+Random(4);
                     end else
                       nHitMsg := CM_HIT+Random(3);
                     if (g_MySelf.m_btWeapon = 0) or (g_MySelf.m_btWeapon = 1) then begin
                       nHitMsg := CM_HITLEFT+Random(4);
                     end;
                   end else
                   nHitMsg := CM_HIT+Random(3);
                   if g_boCanLongHit and (TargetInSwordLongAttackRange (tdir)) then begin  //�Ƿ����ʹ�ô�ɱ
                     nHitMsg := CM_LONGHIT;
                   end;
                   if g_boCanTaguHit and (g_MySelf.m_Abil.MP >= 5) then begin  //Ÿ������ - �·�
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
                   if g_boCanWideHit and (g_MySelf.m_Abil.MP >= 3) and (TargetInSwordWideAttackRange (tdir)) then begin  //�Ƿ����ʹ�ð���
                     nHitMsg := CM_WIDEHIT;
                   end;
                   if g_boCanCrsHit and (g_MySelf.m_Abil.MP >= 6) and (TargetInSwordCrsAttackRange (tdir)) then begin  //�Ƿ����ʹ�ð���
                     nHitMsg := CM_CRSHIT;
                   end;
                   if g_boCanNanCrsHit and (g_MySelf.m_Abil.MP >= 6) and (TargetInSwordCrsAttackRange (tdir)) then begin  //�Ƿ����ʹ�ð���
                     nHitMsg := CM_NANCRSHIT;
                   end;
                   if g_boCanCrsBHit and (g_MySelf.m_Abil.MP >= 6){ and (TargetInSwordCrsAttackRange (tdir)) }then begin
                     nHitMsg := CM_CRBHIT;
                   end;
                   {if g_MySelf.m_btJob = 4 then b��egin   //�� ����
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
                  SendPickup;     //�ݱ�
               end;
            end else
            if XClickTime + 4000 > GetTickCount then begin
              g_FocusItem := PlayScene.GetPetDropItems (X, Y, itemnames);
              if g_FocusItem <> nil then begin      //������ ������ �̸����� ���콺 ��Ŀ��
                if (g_BoPetOn) and (g_nMouseCurrX = g_FocusItem.X) and (g_nMouseCurrY = g_FocusItem.Y) and (itemnames <> '') then begin
                   SendPetPickupMouse;
                   Exit;
                end;
              end;

            end else
             if GetTickCount - g_dwLastAttackTick > 1000 then begin //�����ϴ� Ŭ�� �Ǽ��̵��� ����
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
                   (pos('(', g_TargetCret.m_sUserName) = 0)      //�����ִ� ��(�������� �ؾ���)
                  )
                  or (g_TargetCret.m_nNameColor = ENEMYCOLOR)   //���� �ڵ� ������ ��
                  or ((ssShift in Shift) and (not PlayScene.EdChat.Visible)) then begin      //����� �Ǽ��� �����ϴ� ���� ����
                  AttackTarget (g_TargetCret); //����
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
   //�ڵ�����
   if g_boAutoPuckUpItem and
      (g_MySelf <> nil) and
      ((GetTickCount() - g_dwAutoPickupTick) > g_dwAutoPickupTime) then begin

     g_dwAutoPickupTick:=GetTickCount();
     AutoPickUpItem();
   end;

   //���� �ڵ�
   if g_AutoFish then begin
     if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin
       if (g_MySelf.m_btJob in [4, 9]) then begin
         if (g_MySelf.m_btMask <> 0) then begin
           if (GetTickCount() - g_AutoFishTick) > g_AutoFishUpTime then begin
             g_AutoFishTick:=GetTickCount();
             AutoFishEp();
           end;
         end else begin
           DScreen.AddSysMsg('<CO$FFFF>[ϵͳ]<CE> ���� <CO$FFFF>�����<CE> ����ʹ�õ��㹦�ܡ�',40, 60, clWhite);
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
        PlayScene.SetOperateHint(g_OperateHintList[g_nOperateHintIdx])    //���ΰ���
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


procedure TfrmMain.AutoFishEp();    //���� �ڵ�
var
 nx, ny:Integer;
begin
  if (g_UseItems[U_WEAPON].S.Shape in [47,48]) and (not (g_MySelf.m_btMask in [7..10])) and (g_MySelf.m_btHorse = 0) then begin
    if (g_FishingOk = False) then begin  //���� �� �� �ƴҶ�
      GetFrontPosition (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, nx, ny);
      if Map.MoveFish(nx, ny) and (g_UseItems[U_FISH1].S.Name <> '') and (g_UseItems[U_FISH5].S.Name <> '') then begin
        if (g_MySelf.m_btJob in [4, 9]) then begin       //�·� ����
          if (g_MySelf.m_btMask <> 0) then begin
            g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
            g_AutoFishTick:=GetTickCount();
            PlaySound2 (s_fishingwater);
            StartFishing;  //���� Ÿ�̸ӽ���
            exit;
          end else begin
            DScreen.AddSysMsg('<CO$FFFF>[ϵͳ]<CE> ���� <CO$FFFF>�����<CE> ����ʹ�õ��㹦�ܡ�',40, 60, clWhite);
            exit;
          end;
        end else begin
          g_MySelf.SendMsg (CM_FISHING1, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
          g_AutoFishTick:=GetTickCount();
          PlaySound2 (s_fishingwater);
          StartFishing;  //���� Ÿ�̸ӽ���
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
         SM_CHANGEMAP:  //���̵�
            begin
               FrmDlg.SafeCloseDlg;    //��������
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

               EffectNum := HIBYTE(WaitingMsg.Series);       //�������
               if (EffectNum < 0) then EffectNum := 0;
               if (EffectNum = 1) or (EffectNum = 2) then RunEffectTimer.Enabled := True
               else RunEffectTimer.Enabled := False;

               g_MySelf.CleanCharMapSetting (WaitingMsg.Param, WaitingMsg.Tag);

               g_nTargetX := -1;
               g_TargetCret := nil;
               g_FocusCret := nil;

               {if ((g_nAreaStateValue and $02) <> 0) or ((g_nAreaStateValue and $01) <> 0) or ((g_nAreaStateValue and $08) <> 0) then begin
                 DScreen.AddSysMsg ('�׾����� �������� <CO$FFFF>����߸��� �ʴ�<CE> �����Դϴ�.' , 40, 60, clWhite);
               end else begin
                 DScreen.AddSysMsg ('�׾����� �������� <CO$FFFF>����߸� �� �ִ�<CE> �����Դϴ�.', 40, 60, clWhite);
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
      DDealDlg.Visible := FALSE;         //�ŷ�
      DDealRemoteDlg.Visible := FALSE;         //�ŷ�
      DGuildGrowDlg.Visible := FALSE; //���ļ���

      DDRentalDlg.Visible := FALSE;         //�뿩
      DRentalRemoteDlg.Visible := FALSE;    //�뿩

      DGuildDlg.Visible := FALSE;
      DGuildEditNotice.Visible := FALSE;
      DUserState1.Visible := FALSE;
      DUserInfo.Visible := FALSE;
      DAdjustAbility.Visible := FALSE;

      if DLoverWindow.Visible then   //���� ����
       ToggleShowLoverDlg;
      if DMasterDlg.Visible then //���� ����
       ToggleShowMasterDlg;

      DMasterDlg.Visible := FALSE;      //����
      DRentalDlg.Visible := FALSE;  //�뿩
      if DMailListDlg.Visible then ToggleShowMailListDlg;
      if DBlockListDlg.Visible then ToggleShowBlockListDlg;
      if DMemo.Visible then DMemoCloseClick(DMemoClose, 0, 0);

      if DSales.Visible then CloseItemMarketDlg; //��Ź ����

      DOptions.Visible := FALSE;

      DShopMenuDlg.Visible := FALSE;
      DItemStore.Visible := FALSE;
      if DItemShopDlg.Visible then   //ȯ���� ����
        DItemShopCloseClick (DItemShopClose, 0, 0);

      if DStoragePWDlg.Visible then DStPWCloseClick(DStPWClose, 0, 0);
      if DSetPassWd.Visible then DSetPWCloseClick(DSetPWClose, 0, 0);
      if DInputStPwd.Visible then DInputStCloseClick(DInputStClose, 0, 0);
      if DChangeStPw.Visible then DCloseChPwClick(DCloseChPw, 0, 0);

      if DWinPet.Visible then //����
        ToggleShowPetDlg;

      if DUpWapondow.Visible then begin
        DUpWapondow.Visible := FALSE;   //���
        DUpWeapon.Visible := False;
        CloseDUpWapon;
      end;
      if DUpCheck.Visible then begin
       DUpCheck.Visible := False;
       CloseDUpWapon2;
      end;
      DHelpWin.Visible := FALSE;

      GiftsDT.Visible := FALSE;
      DDealMsgDlg.Visible := FALSE;  //��ȯ�ŷ�
      DRentalMsgDlg.Visible := FALSE; //�뿩�ŷ�
      DTigerDlg.Visible := FALSE;    //ȣ����â
      DFishDlg.Visible := FALSE; //���� ������ â

      DMenuWindows.Visible := False;
      g_boShowFormImage := False;
      PlayScene.EdChat.Visible := FALSE;

      if DStoreGridWin.Visible then CloseStoreDlg;     //���λ���
      if DUserStore.Visible then CloseUserStoreDlg;   //���λ���
      DStoreMsgDlg.Visible := False;    //���λ���

      DComStorage.Visible := False;//����â��
      DGuildStorage.Visible := False; //����â��

      LocalLanguage := imSAlpha;
      if DWItemSepa.Visible then ItemSepacloseClick(ItemSepaclose,0,0);

      if DExChangeDlg.Visible then begin
        DExChangeDlg.Visible := False;
        SendCancelExChange;
      end;
      if DBBSListDlg.Visible then begin         //����Խ���
        DBBSListDlg.Visible := False;
        ClearBBSlist();
      end;
      if DBBSMsgDlg.Visible then begin         //����Խ���
       ToggleBBSMsgWindow;
      end;

      if g_CheckEsc and g_FishingOk then begin    //Esc Ű�� ���� ���� �Ұ���
        ExitFishing;
        g_AutoFish := False;
      end;

      g_boViewMap := FALSE;
      DBigMapDlg.Visible := False;

      m_nStorageMode := 0;  m_Storemode := 0;
      g_Npcbookinx := -1;
      GrowIndex := 0; //���ļ���
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
 //  FrmDlg.MsgDlgClickTime := GetTickCount; //�׷�� �޽��� ? ����
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
   g_BuffList.Clear;    //����
   g_HeroBuffList.Clear;
   g_CoolBuffList.Clear;    //��Ÿ�ӹ���

    g_AucList.Clear;    //���
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

procedure TfrmMain.ResetGameVariables; //�α׾ƿ�
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


   FrmDlg.closeGiftsDTListDlg;     //ȯ����
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
   // 2003/04/15 ģ��, ����

   frmDlg.BlackListPage := 0;
   frmDlg.MailPage      := 0;
   frmDlg.BlockPage     := 0;
   frmDlg.CurrentBlock  := -1;
   NotReadMailCount := 0 ;

   g_boHeroAiMode :=0;

   LoverMacro.Enabled:= False;
   // 2003/04/15 ģ��, ����
   BlockLists.Clear;

   for I := 0 to g_SetItemsList.Count - 1 do
      Dispose(pTSetItems(g_SetItemsList[I]));

    g_SetItemsList.Clear;

   for i:=0 to MailLists.Count-1 do            //�޸�
      Dispose (PNMailItem (MailLists[i]));
   MailLists.Clear;
   WantMailList := false;               //�޸�
   MailAlarm    := false;
   WantBlockList := false;
   fLover.Clear;   //���� ����
   fMentor.Clear; //���� ����

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
   g_boCanWBHit   := FALSE;       //ǳ�˼�
   g_boCanCrsBHit  := FALSE;

   m_nStorageMode := 0;
   m_Storemode := 0;
   g_Npcbookinx := -1;
   g_boNextTimeFireHit := FALSE;
   g_boNextTimeDeathHit := FALSE;

   //���� �ݱ� �ɼ�
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

   g_TigerSet:= FALSE; //Ż��

   g_HumRunDress := False;
   g_MaskRun := False;
   g_boDropDrug := False;

   g_ShopSort := False;
   g_ShopSortMode := 0;
   g_BoPetOn := False;
   g_CheckPetDB := True;
   g_boDrugOn := False;
   m_boWakeUp := False;
   g_FishingOk := FALSE;        //���� �� Ȯ��
   g_boFishCatch := FALSE;    //���� �� ���..
   g_CheckEsc := FALSE;       //Esc Ű�� ���� ���� �Ұ���
   g_AutoFish := FALSE;
   g_FishTime := 0;
   g_FishTiming := 0;         //���� ���̹�

   g_CheckMacro := False;
   g_boSkillBarNum := 1;
   GroupIdList.Clear;
   ClearGroupMember();


   FillChar (g_StoreItems, SizeOf(TStoreItem) * 15, #0);            //���λ���
   FillChar (g_StoreRemoteItems, SizeOf(TStoreItem) * 15, #0);      //���λ���
   FillChar (G_UpWaponItem, sizeof(TClientItem)*16, #0);        //���
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);   //������ ����
   FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);

   FillChar(g_AutoPotItems, SizeOf(TClientItem) * 2, #0);

   FillChar(g_HeroUseItems, SizeOf(TClientItem) * MAXHEROUSEITEM, #0);
   FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
   MoveingItemIndex := -1;
   FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
   FillChar (G_BuyItem, sizeof(SBuyItem)*MAXBUYITEM, #0);     //����

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
   g_MagicList.Clear;       //���� ������� ����

   for I := 0 to g_HeroMagicList.Count - 1 do begin
     Dispose(PTClientMagic(g_HeroMagicList[I]));
   end;
   g_HeroMagicList.Clear;

   FrmDlg.closeGiftsDTListDlg;      //ȯ����
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
   // 2003/04/15 ģ��, ����
   frmDlg.BlackListPage := 0;
   frmDlg.MailPage      := 0;
   frmDlg.BlockPage     := 0;
   frmDlg.CurrentBlock  := -1;
   NotReadMailCount := 0 ;

   g_boHeroAiMode :=0;

   BlockLists.Clear;

   for i:=0 to MailLists.Count-1 do    //�޸�
      Dispose (PNMailItem (MailLists[i]));
   MailLists.Clear;
   WantMailList := false;            //�޸�
   MailAlarm    := false;
   WantBlockList:= false;

   fLover.Clear;    //���� ����
   fMentor.Clear; //���� ����
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
   g_boCanWBHit    := FALSE;       //ǳ�˼�

   g_boCanCrsBHit  := FALSE;

   LoverMacro.Enabled:= False;

   //���� �ݱ� �ɼ�
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

   g_TigerSet:= FALSE; //Ż��

   g_HumRunDress := False;
   g_MaskRun := False;
   g_boDropDrug := False;

   g_BoPetOn := False;
   g_CheckPetDB := True;
   g_boDrugOn := False;
   m_boWakeUp := False;
   g_FishingOk := FALSE;          //���� �� Ȯ��
   g_AutoRate := False;
   g_AutoRate := False;
   g_boFishCatch := FALSE;      //���� �� ���..
   g_CheckEsc := FALSE;         //Esc Ű�� ���� ���� �Ұ���
   g_AutoFish := FALSE;
   g_FishTime := 0;
   g_FishTiming := 0;       //���� ���̹�
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
begin                                //�α��� (���̵� ���ӽð� �޽���)
   g_boServerConnected := FALSE;
   if (g_ConnectionStep = cnsLogin) and not g_boSendLogin then begin
     FrmDlg.DMessageDlg ('�������ѶϿ�����...', [mbOk]);
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
  // SendSocket(EncodeMessage(Msg) + EncodeString(uid + '!' + passwd));      //���� �α���
  // SendSocket(EncodeMessage(Msg) + EncodeString(uid + '%' + passwd));     //���� �α���
   SendSocket(EncodeMessage(Msg) + EncodeString(uid + '^' + passwd));     //������ �α���
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
   //ǿ�е�¼
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
      if (Copy(str, 1, 2) = '��') then begin
       if Copy(fLover.GetDisplay(0), length(STR_LOVER) + 1, 6) <> '' then
        DScreen.AddSayMsg(#7 + g_MySelf.m_sUserName + #7 + ': ' + Copy(str, 3, Length(str) - 2), GetRGB(253), clWhite, False, us_Lover);
      end else
      if (Copy(str, 1, 2) = '��') then
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

procedure TfrmMain.SendDropItem (name: string; itemserverindex: integer);  //������ ����
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

procedure TfrmMain.SeparateItem(MakeIndex,amount:integer);      //����
begin
  SendClientMessage(CM_SEPARITEM, MakeIndex, amount, 0, 0, '');
end;

procedure TfrmMain.BundleItem  (mode,MaxAmount:integer;MakeIndex:string);      //����
begin
   SendClientMessage(CM_BUNDLEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.BundleStorageItem  (mode,MaxAmount:integer;MakeIndex:string);      //����
begin
  SendClientMessage(CM_BUNDLESTORAGEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.SendTakeOffItem (where: byte; itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_TAKEOFFITEM, itmindex, where, 0, 0, itmname);
end;

procedure TfrmMain.GotoUpwaoinItem(merchant, itemindex: integer; Data: string);  //���
begin
  SendClientMessage(CM_GOTOITEMID, merchant, Loword(itemindex), Hiword(itemindex), 0, Data);
end;


procedure TfrmMain.SendEat (itmindex: integer; itmname: string);
begin
   SendClientMessage(CM_EAT, itmindex, 0, 0, 0, itmname);
end;

procedure TFrmMain.UpgradeItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);  //����
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_UPGRADEITEM, ItemIndex, Loword(jewelIndex), Hiword(jewelIndex), 0);
   SendSocket (EncodeMessage (msg) + EncodeString (StrItem + '/' + StrJewel));

   FrmDlg.UpgradeItemEffect2;
end;

procedure TFrmMain.UpgradeHeroItem (ItemIndex, jewelIndex: integer; StrItem, StrJewel :String);  //����
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_HEROUPGRADEIT, ItemIndex, Loword(jewelIndex), Hiword(jewelIndex), 0);
   SendSocket (EncodeMessage (msg) + EncodeString (StrItem + '/' + StrJewel));

   FrmDlg.UpgradeItemEffect2;
end;

procedure TFrmMain.UpgradeItemResult (ItemIndex: integer; wResult : word; str: string);   //����
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
            FrmDlg.DMessageDlg ('������Ҫ�������л������...', [mbOk, mbAbort])
         else FrmDlg.DMessageDlg ('������...', [mbOk, mbAbort]);
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

procedure TfrmMain.SendDismantleItem (merchant, itemindex: integer; itemname: string);     //�Ϲݺ���
begin
  SendClientMessage(CM_DISMANTLE, merchant, Loword(itemindex), Hiword(itemindex), 0, itemname);
end;

procedure TfrmMain.SendDismantlePrice (merchant, itemindex: integer; itemname: string);     //�Ϲݺ��ذ���
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

procedure TfrmMain.SendCheckWeaponItem (merchant, itemindex: integer; itemname: string);   //����Ȯ��
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


procedure TfrmMain.SendComStorageItem (merchant, itemindex{, amount}: integer); //����â��
begin
   SendClientMessage(CM_COMSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), {amount}0);
end;

procedure TfrmMain.SendGuildStorageItem (merchant, itemindex{, amount}: integer); //����â��
begin
   SendClientMessage(CM_GUILDSTORAGEITEM, merchant, Loword(itemindex), Hiword(itemindex), {amount}0);
end;

procedure TfrmMain.SendBuyItem (merchant, itemserverindex,amins: integer; itemname: string);//����
begin
   SendClientMessage(CM_USERBUYITEM, merchant, Loword(itemserverindex), Hiword(itemserverindex), amins, itemname);
end;

procedure TfrmMain.SendPBuyItem (merchant, itemserverindex,amins: integer; itemname: string);//����
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

procedure TFrmMain.SendMakeItemSel (merchant: integer; itemname: string);      //��������
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_USERMAKEITEMSEL, merchant, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (itemname));
end;
procedure TFrmMain.SendMakeItem (merchant: integer; data: string);  //��������
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


procedure TfrmMain.ClientBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //����
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of
      1: DScreen.AddSysMsg ('<CO$FFFF>����Ĺ�����<CE> �ָ�������',40,60,clWhite);     //÷����  860         0
      2: DScreen.AddSysMsg ('<CO$FFFF>����ķ�����<CE> �ָ�������',40,60,clWhite);     //ȣ�ű⸷ 861        1
      3: DScreen.AddSysMsg ('<CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //�ı��ǹ���  862     307
      4: DScreen.AddSysMsg ('<CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //��������  862       2
      5: DScreen.AddSysMsg ('<CO$FFFF>ħ��<CE> �ָ�������',40,60,clWhite);            //�����ǹ���  863     308
      6: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);            //�����ǹ���  864     309
      7: DScreen.AddSysMsg ('<CO$FFFF>�����ٶ�<CE> �ָ�������',40,60,clWhite);        //��ǳ����  865       312
      8: DScreen.AddSysMsg ('<CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //����ġ����  866     300
      9: ;  // 867
     10: DScreen.AddSysMsg ('<CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //��ü  868           310
     11: DScreen.AddSysMsg ('<CO$FFFF>ħ��ֵ<CE> �ָ�������',40,60,clWhite);          //����  869           311
     12: DScreen.AddSysMsg ('<CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //����  870           10
     13: DScreen.AddSysMsg ('<CO$FFFF>ħ��������<CE> �ָ�������',40,60,clWhite);          //�׸�  871           11
     14: ;  // 872
     15: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);          //�����  873         13
     16: DScreen.AddSysMsg ('<CO$FFFF>�������<CE> ״̬����ʧ��',40,60,clWhite);             //ûǳ��� 874        14
     17: DScreen.AddSysMsg ('<CO$FFFF>׼ȷ<CE> �ָ�������',40,60,clWhite);            //��Ȯ�ǹ��� 875      320
     18: ;  // 876
     19: ;  // 877
     20: ;  // 878
     21: ;  // 879
     22: DScreen.AddSysMsg ('<CO$FFFF>��Ѹ��<CE> ״̬����ʧ��',40,60,clWhite);               //ü��ǳ  880         20
     23: DScreen.AddSysMsg ('<CO$FFFF>�ƶ��ٶ�<CE> �ָ�������',40,60,clWhite);        //��ź�  881         21
     24: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ״̬����ʧ��',40,60,clWhite);               //ǳ�ż�  882         22
     25: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);        //��ź� ��Ÿ��  883  23
     26: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);               //������  884         24
     27: DScreen.AddSysMsg ('<CO$FFFF>�һ���<CE> ��ȴʱ�������',40,60,clWhite);        //��ȭ�� ��Ÿ��  885  25
     28: ;  // 886
     29: ;  // 887
    // 30: DScreen.AddSysMsg ('<CO$FFFF>������ ��ȣ<CE> ����.',40,60,clWhite);          //�����ǰ�ȣ  888   30
     31: DScreen.AddSysMsg ('<CO$FFFF>��ʦ������<CE> ״̬����ʧ��',40,60,clWhite);          //����������  888     30
     32: ;  // 889
     33: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ״̬����ʧ��',40,60,clWhite);               //����Ż  890         19
     34: DScreen.AddSysMsg ('<CO$FFFF>�����ָ�<CE> �ָ�������',40,60,clWhite);     //�����  891       31
     35: DScreen.AddSysMsg ('<CO$FFFF>ħ���ָ�<CE> �ָ�������',40,60,clWhite);     //��������  892       32
     36: ;  // 893
     37: ;  // 894
     38: ;  // 895
     39: ;  // 896
     40: ;  // 897
     41: ;  // 898
    // 42: DScreen.AddSysMsg ('<CO$FFFF>���ļ��� ����<CE> ����.',40,60,clWhite);        //���ļ���  899     507
     43: ;  // 900
     44: DScreen.AddSysMsg ('<CO$FFFF>����ˮ<CE> ״̬����ʧ��',40,60,clWhite);               //��û��  901         305
     45: DScreen.AddSysMsg ('<CO$FFFF>�巷�㸮<CE> ״̬����ʧ��',40,60,clWhite);             //�巷�㸮  901       305
     46: ;  // 902
     47: ;  // 903
     48: ;  // 904
     49: DScreen.AddSysMsg ('<CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //���¼�  905         306
     50: DScreen.AddSysMsg ('<CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //NPC ����ġ 906      504
     51: ;  // 907
     52: DScreen.AddSysMsg ('<CO$FFFF>����ˮ<CE> ״̬����ʧ��',40,60,clWhite);               //õ�ɼ�  908         317
     53: DScreen.AddSysMsg ('<CO$FFFF>����������<CE> �ָ�������',40,60,clWhite);     //�����ǹ��� 909      318
     54: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ״̬����ʧ��',40,60,clWhite);                 //õ��  100           39
     55: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);          //õ�� ��Ÿ��  101    40
     56: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ħ���ָ�������',40,60,clWhite);   //�ɿ���  102         37
     57: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ��ȴʱ�������',40,60,clWhite);        //�ɿ��� ��Ÿ��  103  38
     58: DScreen.AddSysMsg ('<CO$FFFF>Ѫ������<CE> �����ٶȻָ�������',40,60,clWhite);  //����˹�  104            46
     59: DScreen.AddSysMsg ('<CO$FFFF>Ѫ������<CE> ��ȴʱ�������',40,60,clWhite);      //����˹� ��Ÿ��  105        47
     60: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ����״̬����ʧ��',40,60,clWhite);        //õ����  106               48
     61: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      //õ���� ��Ÿ��  107        49
     62: DScreen.AddSysMsg ('<CO$FFFF>è����<CE> ��ȴʱ�������',40,60,clWhite);        //������ ��Ÿ�� 108           50
     63: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ״̬����ʧ��',40,60,clWhite);             //���󰭸� 109                508
     64: DScreen.AddSysMsg ('<CO$FFFF>������Ӱ<CE> ״̬����ʧ��',40,60,clWhite);             //�������� 120                �״��
   //  65: ; // GM����1 121
   //  66: ; // GM����2 122
     67: ; // 123
     68: DScreen.AddSysMsg ('<CO$FFFF>����֮��<CE> ��ȴʱ�������',40,60,clWhite);      // �����Ǵ� ��Ÿ�� 124        16
     69: ; // 125
     70: DScreen.AddSysMsg ('<CO$FFFF>��ղ���<CE> ״̬����ʧ��',40,60,clWhite);             // �ݰ��ұ� 126               52
     71: DScreen.AddSysMsg ('<CO$FFFF>��ղ���<CE> ��ȴʱ�������',40,60,clWhite);      // �ݰ��ұ� ��Ÿ�� 127        53
     72: DScreen.AddSysMsg ('<CO$FFFF>�ϼ�<CE> ��ȴʱ�������',40,60,clWhite);          // �ϼ� ��Ÿ�� 128            54
     73: DScreen.AddSysMsg ('<CO$FFFF>���ɷ�<CE> ��ȴʱ�������',40,60,clWhite);        // �ڼ�ǳ ��Ÿ�� 129          55
     74: DScreen.AddSysMsg ('<CO$FFFF>����������<CE> ��ȴʱ�������',40,60,clWhite);    // ��������� ��Ÿ�� 80       56
     75: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);               // ������ 81                  57
     76: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 82           58
     77: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 107          49
     78: DScreen.AddSysMsg ('<CO$FFFF>�׻�ǿ��<CE> ��ȴʱ�������',40,60,clWhite);      // ��ȣ��Ÿ ��Ÿ�� 26         �״��
     79: DScreen.AddSysMsg ('<CO$FFFF>�׶�<CE> ��ȴʱ�������',40,60,clWhite);          // ���� ��Ÿ�� 27             �״��
     80: DScreen.AddSysMsg ('<CO$FFFF>�ű⹦��<CE> ��ȴʱ�������',40,60,clWhite);      // �ű⹦�� ��Ÿ�� 108        50
     81: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      // ���߷ڰ� ��Ÿ�� 84         59
     82: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      // �ϵ����� ��Ÿ�� 85         60
     83: DScreen.AddSysMsg ('<CO$FFFF>ɱ����<CE> ��ȴʱ�������',40,60,clWhite);        // ����� ��Ÿ�� 87
     84: DScreen.AddSysMsg ('<CO$FFFF>���� ����ֵ<CE> ״̬����ʧ��',40,60,clWhite);          // ���� ����ġ ���� 347       334
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92: //�Ʒ��� ����
    // 93: �����ǿ�
     94: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ״̬����ʧ��',40,60,clWhite);             // ��õ���� - 409
    // 95:
     96: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     97: DScreen.AddSysMsg ('<CO$FFFF>ħ��<CE> �ָ�������',40,60,clWhite);
     98: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     99: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     100: DScreen.AddSysMsg ('<CO$FFFF>ħ������<CE> �ָ�������',40,60,clWhite);
     101: DScreen.AddSysMsg ('<CO$FFFF>�������ֵ<CE> �ָ�������',40,60,clWhite);
     102: DScreen.AddSysMsg ('<CO$FFFF>���ħ��ֵ<CE> �ָ�������',40,60,clWhite);
     103: DScreen.AddSysMsg ('<CO$FFFF>�����ٶ�<CE> �ָ�������',40,60,clWhite);
     104: DScreen.AddSysMsg ('<CO$FFFF>׼ȷ<CE> �ָ�������',40,60,clWhite);
     105: DScreen.AddSysMsg ('<CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     106: DScreen.AddSysMsg ('<CO$FFFF>ħ�����<CE> �ָ�������',40,60,clWhite);
     107: DScreen.AddSysMsg ('<CO$FFFF>������<CE> �ָ�������',40,60,clWhite);
     109: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ״̬����ʧ��',40,60,clWhite);
     // 115:  //�������� 44
     // 116:  //�׷����
     117: DScreen.AddSysMsg ('<CO$FFFF>����Ч��<CE> ״̬����ʧ��',40,60,clWhite);    //�������� 510
     118: DScreen.AddSysMsg ('<CO$FFFF>���˳���ҩˮ<CE> ״̬����ʧ��',40,60,clWhite); //���ӹ���
     119: DScreen.AddSysMsg ('<CO$FFFF>��ӳ���ҩˮ<CE> ״̬����ʧ��',40,60,clWhite); //���ӹ���
     120: DScreen.AddSysMsg ('<CO$FFFF>�𻯵���<CE> ״̬����ʧ��',40,60,clWhite);
   end;
  end;

  for I := 0 to g_buffList.Count - 1 do begin
    buff := pTBuff(g_buffList.Items[i]);
    if (buff <> nil) and (buff.btIdx in [30,42,65,66,115,116,117]) and (buff.nImgIndex = ImagesNumber) and (Tiem = 0) then begin //���� �Ȼ�����°�
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


procedure TfrmMain.ClientHeroBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //����
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of
      1: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> �ָ�������',40,60,clWhite);     //÷����  860         0
      2: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>���������<CE> �ָ�������',40,60,clWhite);     //ȣ�ű⸷ 861        1
      3: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //�ı��ǹ���  862     307
      4: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //��������  862       2
      5: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ��<CE> �ָ�������',40,60,clWhite);            //�����ǹ���  863     308
      6: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);            //�����ǹ���  864     309
      7: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�����ٶ�<CE> �ָ�������',40,60,clWhite);        //��ǳ����  865       312
      8: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //����ġ����  866     300
      9: ;  // 867
     10: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //��ü  868           310
     11: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ��ֵ<CE> �ָ�������',40,60,clWhite);          //����  869           311
     12: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //����  870           10
     13: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ��������<CE> �ָ�������',40,60,clWhite);          //�׸�  871           11
     14: ;  // 872
     15: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);          //�����  873         13
     16: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�������<CE> ״̬����ʧ��',40,60,clWhite);             //ûǳ��� 874        14
     17: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>׼ȷ<CE> �ָ�������',40,60,clWhite);            //��Ȯ�ǹ��� 875      320
     18: ;  // 876
     19: ;  // 877
     20: ;  // 878
     21: ;  // 879
     22: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��Ѹ��<CE> ״̬����ʧ��',40,60,clWhite);               //ü��ǳ  880         20
     23: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�ƶ��ٶ�<CE> �ָ�������',40,60,clWhite);        //��ź�  881         21
     24: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> ״̬����ʧ��',40,60,clWhite);               //ǳ�ż�  882         22
     25: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);        //��ź� ��Ÿ��  883  23
     26: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);               //������  884         24
     27: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ȭ��<CE> ��ȴʱ�������',40,60,clWhite);        //��ȭ�� ��Ÿ��  885  25
     28: ;  // 886
     29: ;  // 887
    // 30: DScreen.AddSysMsg ('<CO$FFFF>������ ��ȣ<CE> ����.',40,60,clWhite);          //�����ǰ�ȣ  888   30
     31: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ʦ������<CE> ״̬����ʧ��',40,60,clWhite);          //����������  888     30
     32: ;  // 889
     33: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> ״̬����ʧ��',40,60,clWhite);               //����Ż  890         19
     34: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�����ָ�<CE> �ָ�������',40,60,clWhite);     //�����  891       31
     35: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ���ָ�<CE> �ָ�������',40,60,clWhite);     //��������  892       32
     36: ;  // 893
     37: ;  // 894
     38: ;  // 895
     39: ;  // 896
     40: ;  // 897
     41: ;  // 898
    // 42: DScreen.AddSysMsg ('������ <CO$FFFF>���ļ��� ����<CE> ����.',40,60,clWhite);        //���ļ���  899     507
     43: ;  // 900
     44: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����ˮ<CE> ״̬����ʧ��',40,60,clWhite);               //��û��  901         305
     45: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�巷�㸮<CE> ״̬����ʧ��',40,60,clWhite);             //�巷�㸮  901       305
     46: ;  // 902
     47: ;  // 903
     48: ;  // 904
     49: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> �ָ�������',40,60,clWhite);          //���¼�  905         306
     50: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����ֵ<CE> �ָ�������',40,60,clWhite);          //NPC ����ġ 906      504
     51: ;  // 907
     52: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����ˮ<CE> ״̬����ʧ��',40,60,clWhite);               //õ�ɼ�  908         317
     53: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����������<CE> �ָ�������',40,60,clWhite);     //�����ǹ��� 909      318
     54: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> ״̬����ʧ��',40,60,clWhite);                 //õ��  100           39
     55: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);          //õ�� ��Ÿ��  101    40
     56: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> ħ�����ָ�������',40,60,clWhite);   //�ɿ���  102         37
     57: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> ��ȴʱ�������',40,60,clWhite);        //�ɿ��� ��Ÿ��  103  38
     58: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>Ѫ������<CE> �����ٶȻָ�������',40,60,clWhite);  //����˹�  104            46
     59: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>Ѫ������<CE> ��ȴʱ�������',40,60,clWhite);      //����˹� ��Ÿ��  105        47
     60: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ����ʱ����ʧ��',40,60,clWhite);        //õ����  106               48
     61: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      //õ���� ��Ÿ��  107        49
     62: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>è����<CE> ��ȴʱ�������',40,60,clWhite);        //������ ��Ÿ�� 108           50
     63: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> ״̬����ʧ��',40,60,clWhite);             //���󰭸� 109                508
     64: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);             //�������� 120                �״��
   //  65: ; // GM����1 121
   //  66: ; // GM����2 122
     67: ; // 123
     68: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����֮��<CE> ��ȴʱ�������',40,60,clWhite);      // �����Ǵ� ��Ÿ�� 124        16
     69: ; // 125
     70: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ղ���<CE> ״̬����ʧ��',40,60,clWhite);             // �ݰ��ұ� 126               52
     71: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ղ���<CE> ��ȴʱ�������',40,60,clWhite);      // �ݰ��ұ� ��Ÿ�� 127        53
     72: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);          // �ϼ� ��Ÿ�� 128            54
     73: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>���ɷ�<CE> ��ȴʱ�������',40,60,clWhite);        // �ڼ�ǳ ��Ÿ�� 129          55
     74: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����������<CE> ��ȴʱ�������',40,60,clWhite);    // ��������� ��Ÿ�� 80       56
     75: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);               // ������ 81                  57
     76: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��Ӱ��<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 82           58
     77: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ӰѪ׹<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 107          49
     78: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ȣ��Ÿ<CE> ��ȴʱ�������',40,60,clWhite);      // ��ȣ��Ÿ ��Ÿ�� 26         �״��
     79: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�׶�<CE> ��ȴʱ�������',40,60,clWhite);          // ���� ��Ÿ�� 27             �״��
     80: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��ǿһ��<CE> ��ȴʱ�������',40,60,clWhite);      // �ű⹦�� ��Ÿ�� 108        50
     81: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      // ���߷ڰ� ��Ÿ�� 84         59
     82: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      // �ϵ����� ��Ÿ�� 85         60
     83: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ɱ����<CE> ��ȴʱ�������',40,60,clWhite);        // ����� ��Ÿ�� 87
     84: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>���� ����ֵ<CE> ״̬����ʧ��',40,60,clWhite);          // ���� ����ġ ���� 347       334
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92:
    // 93: �����ǿ�
     94: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ״̬����ʧ��',40,60,clWhite);             // ��õ���� - 409
    // 95:
     96: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     97: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ��<CE> �ָ�������',40,60,clWhite);
     98: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     99: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     100: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ������<CE> �ָ�������',40,60,clWhite);
     101: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�������ֵ<CE> �ָ�������',40,60,clWhite);
     102: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>���ħ��ֵ<CE> �ָ�������',40,60,clWhite);
     103: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�����ٶ�<CE> �ָ�������',40,60,clWhite);
     104: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>׼ȷ<CE> �ָ�������',40,60,clWhite);
     105: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>����<CE> �ָ�������',40,60,clWhite);
     106: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>ħ�����<CE> �ָ�������',40,60,clWhite);
     107: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>������<CE> �ָ�������',40,60,clWhite);
     109: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��������<CE> ״̬����ʧ��',40,60,clWhite);
    // 115:  //�������� 44
    // 116:  //�׷����
     120: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>�𻯵���<CE> ״̬����ʧ��',40,60,clWhite);
     121: DScreen.AddSysMsg ('Ӣ�۵� <CO$FFFF>��Ʒ��ֹ����<CE> ״̬����ʧ��',40,60,clWhite);       //�������
   end;
  end;

  for I := 0 to g_HeroBuffList.Count - 1 do begin
    buff := pTBuff(g_HeroBuffList.Items[i]);
    if (buff <> nil) and (buff.btIdx in [30,42,65,66,115,116,117]) and (buff.nImgIndex = ImagesNumber) and (Tiem = 0) then begin //���� �Ȼ�����°�
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

procedure TfrmMain.ClientCoolBuffSystem(Str:String;Tiem,ImagesNumber,Mode:integer); //����
var
  buff : pTBuff;
  I: integer;
begin
  if Tiem = 0 then begin
   case Mode of

     25: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);        //��ź� ��Ÿ��  883  23
     27: DScreen.AddSysMsg ('<CO$FFFF>�һ���<CE> ��ȴʱ�������',40,60,clWhite);        //��ȭ�� ��Ÿ��  885  25
     55: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);          //õ�� ��Ÿ��  101    40
     57: DScreen.AddSysMsg ('<CO$FFFF>������<CE> ��ȴʱ�������',40,60,clWhite);        //�ɿ��� ��Ÿ��  103  38
     59: DScreen.AddSysMsg ('<CO$FFFF>Ѫ������<CE> ��ȴʱ�������',40,60,clWhite);      //����˹� ��Ÿ��  105        47
     61: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      //õ���� ��Ÿ��  107        49
     62: DScreen.AddSysMsg ('<CO$FFFF>è����<CE> ��ȴʱ�������',40,60,clWhite);        //������ ��Ÿ�� 108           50
     68: DScreen.AddSysMsg ('<CO$FFFF>����֮��<CE> ��ȴʱ�������',40,60,clWhite);      // �����Ǵ� ��Ÿ�� 124        16
     71: DScreen.AddSysMsg ('<CO$FFFF>��ղ���<CE> ��ȴʱ�������',40,60,clWhite);      // �ݰ��ұ� ��Ÿ�� 127        53
     72: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);          // �ϼ� ��Ÿ�� 128            54
     73: DScreen.AddSysMsg ('<CO$FFFF>���ɷ�<CE> ��ȴʱ�������',40,60,clWhite);        // �ڼ�ǳ ��Ÿ�� 129          55
     74: DScreen.AddSysMsg ('<CO$FFFF>����������<CE> ��ȴʱ�������',40,60,clWhite);    // ��������� ��Ÿ�� 80       56
     75: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ״̬����ʧ��',40,60,clWhite);               // ������ 81                  57
     76: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 82           58
     77: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);        // ������ ��Ÿ�� 107          49
     78: DScreen.AddSysMsg ('<CO$FFFF>�׻�ǿ��<CE> ��ȴʱ�������',40,60,clWhite);      // ��ȣ��Ÿ ��Ÿ�� 26         �״��
     79: DScreen.AddSysMsg ('<CO$FFFF>�׶� ��Ÿ��<CE> ��ȴʱ�������',40,60,clWhite);          // ���� ��Ÿ�� 27             �״��
     80: DScreen.AddSysMsg ('<CO$FFFF>��ǿһ��<CE> ��ȴʱ�������',40,60,clWhite);      // �ű⹦�� ��Ÿ�� 108        50
     81: DScreen.AddSysMsg ('<CO$FFFF>��ǿһ��<CE> ��ȴʱ�������',40,60,clWhite);      // ���߷ڰ� ��Ÿ�� 84         59
     82: DScreen.AddSysMsg ('<CO$FFFF>��������<CE> ��ȴʱ�������',40,60,clWhite);      // �ϵ����� ��Ÿ�� 85         60
     83: DScreen.AddSysMsg ('<CO$FFFF>ɱ����<CE> ��ȴʱ�������',40,60,clWhite);        // ����� ��Ÿ�� 87
    // 85:
    // 86:
    // 87:
    // 88:
    // 89:
    // 90:
    // 91:
    // 92:
     93: DScreen.AddSysMsg ('<CO$FFFF>����֮�� ��ȴʱ��<CE> ������',40,60,clWhite);     //�����ǿ� ��Ÿ�� 79

     108: DScreen.AddSysMsg ('<CO$FFFF>��Ӱ��<CE> ��ȴʱ�������',40,60,clWhite);      //������ ��Ÿ��  67

     111: DScreen.AddSysMsg ('<CO$FFFF>���չ���<CE> ��ȴʱ�������',40,60,clWhite);      //�ݰ��� ��Ÿ�� 76
     //112:; //��ȣ�� ����
     113: DScreen.AddSysMsg ('<CO$FFFF>ǿ����<CE> ��ȴʱ�������',40,60,clWhite);      //��ȣ�� ��Ÿ�� 71
     114: DScreen.AddSysMsg ('<CO$FFFF>����<CE> ��ȴʱ�������',40,60,clWhite);       //��õ ��Ÿ�� 104
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



procedure TfrmMain.ClientAucBuff(Makeindex:String;Cost:integer); //���
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

procedure TfrmMain.ClientCoolTime(Body:String;Ttiem:integer);   //����
begin
 if (Body <> '') and (Ttiem >=0) then begin
   DScreen.AddCoolTime(body,Ttiem);
   if (Ttiem = 0) then begin
     DScreen.AddSysMsg ('���Գ���ȴʱ�������',40,60,clYellow);
   end;
 end;
end;

procedure TfrmMain.ClientRockPapersGame(Gold:String; Rate:integer);   //����������
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

procedure TfrmMain.SendRentalTry;     //�뿩
var
   who: string;
begin
   SendClientMessage(CM_RENTALTRY, 0, 0, 0, 0, who);
end;


procedure TfrmMain.SendDealTry;     //�ŷ�
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

procedure TfrmMain.SendCancelRental;       //�뿩
begin
   SendClientMessage(CM_RENTALCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendCancelDeal;       //�ŷ�
begin
   SendClientMessage(CM_DEALCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendCancelExChange;    //ȯ�� ���
begin
   SendClientMessage(CM_EXCANCEL, 0, 0, 0, 0);
end;

procedure TfrmMain.SendTigerSet (onoff: Boolean); //ȣ����
begin
   if onoff then begin
     SendClientMessage(CM_TIGERSET, 0, 1, 0, 0);   //Ÿ��
   end else begin
    SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);  //������
   end;
end;

procedure TfrmMain.SendGuildSet (guildimg: integer); //���� ��ũ
begin
   SendClientMessage(CM_GUILDSET, 0, guildimg, 0, 0);  //���� ��ũ
end;

procedure TfrmMain.SendGuildGrowUp (guildUp: integer); //���ļ���
begin
   SendClientMessage(CM_GUILDGROWUP, 0, guildUp, 1, 0);
end;

procedure TfrmMain.SendAddRentalItem (ci: TClientItem;Day: integer);    //�뿩
begin
   SendClientMessage(CM_RENTALADDITEM, ci.MakeIndex, ci.Amount, Day, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelRentalItem (ci: TClientItem);    //�뿩
begin
   SendClientMessage(CM_RENTALDELITEM, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendChangeRentalGold (gold: integer);        //�뿩
begin
   SendClientMessage(CM_RENTALCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendRentalEnd;                      //�뿩
begin
   SendClientMessage(CM_RENTALEND, 0, 0, 0, 0);
end;



procedure TfrmMain.SendAddDealItem (ci: TClientItem);    //�ŷ�
begin
   SendClientMessage(CM_DEALADDITEM, ci.MakeIndex, ci.Amount, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelDealItem (ci: TClientItem);     //�ŷ�
begin
   SendClientMessage(CM_DEALDELITEM, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendDelDealItem2 (ci: TClientItem);      //�ŷ�
begin
   SendClientMessage(CM_DEALDELITEM2, ci.MakeIndex, 0, 0, 0, ci.S.Name);
end;

procedure TfrmMain.SendChangeDealGold (gold: integer);        //�ŷ�
begin
   SendClientMessage(CM_DEALCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendDealEnd;                       //�ŷ�
begin
   SendClientMessage(CM_DEALEND, 0, 0, 0, 0);
end;

procedure TfrmMain.SendExChangeEnd;  //ȯ�� �Ϸ�
begin
   SendClientMessage(CM_EXCHANGEEND, 0, 0, 0, 0);
end;

procedure TfrmMain.SendChangeExChangeGold (gold: integer);   //ȯ��
begin
   SendClientMessage(CM_EXCHGGOLD, gold, 0, 0, 0);
end;

procedure TfrmMain.SendChangeExChangeGameGold (gold: integer);   //ȯ��
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

procedure TfrmMain.SendAddAutItem (ci: TClientItem; Price:Integer);    //���
begin
   SendClientMessage(CM_AUCADDITEM, ci.MakeIndex, 0, 0, 0, IntToStr(Price));
end;


procedure TfrmMain.SendBuyStoreItem(sItems: string; nMakeIndex, nRecogId: Integer);     //���λ���
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_BUYSTOREITEM, nRecogId, 0, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(sItems + '/' + IntToStr(nMakeIndex) + '/'));
end;

procedure TfrmMain.SendStartStore();     //���λ���
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

procedure TfrmMain.SendBBSListRequest(merchant: integer; menuindex: integer);      //����Խ���
begin
   SendClientMessage(CM_BBSLIST , merchant, menuindex, 0, 0, '');
end;

procedure TfrmMain.SendBBSMsgRequest(merchant: integer; index:integer);     //����Խ���
begin
   SendClientMessage(CM_BBSMSG , merchant, index, 0, 0, '');
end;

procedure TfrmMain.SendBBSPost(merchant,Sticky,MasterPost: integer; sMsg:String);   //����Խ���
begin
   SendClientMessage(CM_BBSPOST , merchant, Sticky, LoWord(MasterPost), HiWord(MasterPost), sMsg);
end;

procedure TfrmMain.SendBBSDelete(merchant,index:integer);               //����Խ���
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
      (GetTickCount - g_dwDizzyDelayStart > g_dwDizzyDelayTime) and (g_FishingOk = False) and (not m_boWakeUp) and    //���� ���϶� ���� ���� ����
      (GetTickCount - g_MySelf.m_dwSpiderMove > 2000) and
      ((GetTickCount - g_MySelf.g_dwMagicMove > 4000) or (g_MySelf.m_nState and $00040000 <> 0))  //���� ��ȯ õ����
   then begin                                                           
      Result := TRUE;
   end else
      Result := FALSE;
end;

function  TfrmMain.CanNextHeroAction: Boolean;       // 2003/07/15 �űԹ���, �����̻� �߰�...���
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
    if g_UseItems[U_ARMRINGL].S.Name <> '' then begin       //�����ڸ�
      if (g_UseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_UseItems[U_ARMRINGL].S.Shape in [7,8]) and (ROUND(g_UseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_UseItems[U_BUJUK].S.Name <> '' then begin       //�����ڸ�
      if (g_UseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_UseItems[U_BUJUK].S.Shape in [7,8]) and (ROUND(g_UseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('����Ҫװ���������',clRed,clWhite);
  end;
end;


function TfrmMain.CheckUseMagicHerobujuk(MaicId:Word):Boolean;
begin
  Result:=True;
  if MaicId in [105] then begin
    Result:=False;
    if g_HeroUseItems[U_ARMRINGL].S.Name <> '' then begin       //�����ڸ�
      if (g_HeroUseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_HeroUseItems[U_ARMRINGL].S.Shape in [7,8]) and (ROUND(g_HeroUseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_HeroUseItems[U_BUJUK].S.Name <> '' then begin       //�����ڸ�
      if (g_HeroUseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_HeroUseItems[U_BUJUK].S.Shape in [7,8]) and (ROUND(g_HeroUseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('����Ҫװ���������',clRed,clWhite);
  end;
end;

function TfrmMain.CheckUseMagicMonk(MaicId:Word):Boolean;
begin
  Result:=True;
  if MaicId in [113,115,116,118,127,129] then begin
  Result:=False;
    if g_UseItems[U_ARMRINGL].S.Name <> '' then begin       //�����ڸ�
      if (g_UseItems[U_ARMRINGL].S.StdMode = 25) then begin
         if (g_UseItems[U_ARMRINGL].S.Shape in [10]) and (ROUND(g_UseItems[U_ARMRINGL].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    if g_UseItems[U_BUJUK].S.Name <> '' then begin       //�����ڸ�
      if (g_UseItems[U_BUJUK].S.StdMode = 25) then begin
         if (g_UseItems[U_BUJUK].S.Shape in [10]) and (ROUND(g_UseItems[U_BUJUK].Dura / 10) >= 3) then begin
           Result:=True;
           exit;
         end;
      end;
    end;
    DScreen.AddChatBoardString('����Ҫװ������������',clRed,clWhite);
  end;
end;


function TfrmMain.CheckUseMagicWeapon(MaicId:Word):Boolean;
begin
  Result := True;
  if MaicId in [60,62,63,70,71,72,84,88,102,106,110] then begin
   if (g_UseItems[U_WEAPON].S.Name = '') or (g_UseItems[U_WEAPON].S.StdMode <> 99) then begin
     DScreen.AddChatBoardString('����Ҫװ��˫��������',clRed,clWhite);
     Result := False;
   end;
  end;
end;


function TfrmMain.CheckUseMagicHeroWeapon(MaicId:Word):Boolean;
begin
  Result := True;
  if MaicId in [60,62,63,70,71,72,84,88,102,106,110] then begin
   if (g_HeroUseItems[U_WEAPON].S.Name = '') or (g_HeroUseItems[U_WEAPON].S.StdMode <> 99) then begin
     DScreen.AddChatBoardString('�˼�����ҪӢ��װ��˫��������',clRed,clWhite);
     Result := False;
   end;
  end;
end;

function TfrmMain.CheckUseMagicTarget (MaicId:Word):Boolean;
begin
  Result := True;
  if (MaicId in [102]) and (g_MagicTarget = nil)  then begin
     DScreen.AddChatBoardString('������趨Ŀ�ꡣ',clWhite,clRed);
     Result := False;
  end;
end;

function TfrmMain.CheckUseMagicDelay (MaicId:integer):Boolean;    //���� ���� ������
var
  i : integer;
  Time  : String;
  buff  : pTBuff;  //����
begin
  Result := True;
  Time := '';
  for I := 0 to g_CoolBuffList.Count - 1 do begin
    buff := pTBuff(g_CoolBuffList.Items[i]);

    case MaicId of

      56 : begin   //�ϼ� ������
        if buff.btIdx = 72 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ��������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      68 : begin   //��ź� ������   ����
        if buff.btIdx = 25 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ��������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      71 : begin   //��ȭ�� ������   �һ���
        if buff.btIdx = 27 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ���һ���',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      73 : begin   //õ�� ������
        if buff.btIdx = 55 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      74 : begin   //�ɿ��� ������
        if buff.btIdx = 57 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ����������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      77 : begin   //����˹� ������
        if buff.btIdx = 59 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ��Ѫ��������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      78 : begin   //õ���� ������
        if buff.btIdx = 61 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ������������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      80 : begin   //������ ������
        if buff.btIdx = 62 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ��è������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      81 : begin   //�ݰ��ұ� ������
        if buff.btIdx = 71 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�ý�ղ�����',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      82 : begin   //�ڼ�ǳ ������
        if buff.btIdx = 73 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�����ɷ硣',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      83 : begin   //��������� ������
        if buff.btIdx = 74 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ������������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      84 : begin   //������ ������
        if buff.btIdx = 76 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ����Ӱ��',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      98 : begin   //�����Ǵ� ������
        if buff.btIdx = 68 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ������֮�ۡ�',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      102 : begin  //������ ������
        if buff.btIdx = 77 then begin
          if (buff.nTime <> 0) then begin
             //Time := format('%d��', [((buff.nTime - GetTickCount) Div 1000) Mod 60]);
             DScreen.AddChatBoardString('�����ڲ���ʹ��ӰѪ׹��',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      105 : begin  //��ȣ��Ÿ ������      �׻�ǿ��
        if buff.btIdx = 78 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�ð׻�ǿ�䡣',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      106 : begin  //���� ������
        if buff.btIdx = 79 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ���׶�',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      107 : begin  //�ű⹦�� ������
        if buff.btIdx = 80 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ����ǿһ����',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      108 : begin  //���߷ڰ� ������
        if buff.btIdx = 81 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ���������ס�',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      109 : begin  //�ϵ����� ������
        if buff.btIdx = 82 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�ð������硣',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      110 : begin  //����� ������
        if buff.btIdx = 83 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�ð������硣',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      113 : begin  //��õ���� ������
        if buff.btIdx = 95 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ������������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      121 : begin  //������ ������
        if buff.btIdx = 108 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ����Ӱ����',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

      122 : begin  //��ȣ�� ������
        if buff.btIdx = 110 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�÷���������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      123 : begin  //�ݰ��� ������
        if buff.btIdx = 111 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�û��չ�����',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      129 : begin  //��ȣ�� ������
        if buff.btIdx = 113 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ��ǿ������',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;
      137: begin      //��õ
        if buff.btIdx = 114 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���ʹ�����졣',clRed,clWhite);
             Result := False;
             exit;
          end;
        end;
      end;

    end;

  end;
end;


function TfrmMain.CheckItemDelay (mode:integer):Boolean;    //���� ���� ������
var
  i : integer;
  Time  : String;
  buff  : pTBuff;  //����
begin
  Result := True;
  Time := '';
  for I := 0 to g_CoolBuffList.Count - 1 do begin
    buff := pTBuff(g_CoolBuffList.Items[i]);

    case mode of

      110 : begin   //�����ǿ� ������
        if buff.btIdx = 93 then begin
          if (buff.nTime <> 0) then begin
             DScreen.AddChatBoardString('�����ڲ���װ������ս�¡�',clRed,clWhite);
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




procedure TfrmMain.Timer1Timer(Sender: TObject);    //�����Ǿ����ϴ�.
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

   if FindWindow('ConsoleWindowClass', Nil) <> 0 Then begin //Ŀ��Ʈâ �˻�
     hProcess := FindWindow('ConsoleWindowClass',nil);
     postmessage(hProcess,WM_CLOSE,0,0);
   end;
   if FindWindow('AutoHotkey', Nil) <> 0 Then begin //���� �˻�
     hProcess := FindWindow('AutoHotkey',nil);
     postmessage(hProcess,WM_CLOSE,0,0);
   end;

   if FindWindow(Nil, 'Speed Gear v7.1') <> 0 Then begin //���� �˻�
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
         FrmDlg.DMessageDlg ('���������ʹ�ü��ٹ��߻�������ҳ��򣬳��򽫶Ͽ����ӣ�����Ա��\' +
                             '�����IP��ַ���˺Ž��м�⣬�����û��ʹ�����֮��ķǷ�������\' +
                             '��ϵ����Ա������⡣(CODE=10001)',
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
      if (GetTickCount - g_dwFirstClientTime) > 10 * 60 * 1000 then begin     //30�� ���� �ʱ�ȭ
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
            FrmDlg.DMessageDlg ('�ѶϿ����ӡ� CODE=10000\' +
                                '��ǰ���粻�ȶ�����ϵͳ���ȶ���\' +
                                '��ر���ҳ�������������ӡ�',
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
      if tagstr = 'PWR'  then g_boNextTimePowerHit := True;  //�����˹�
      if tagstr = 'LNG'  then g_boCanLongHit := True;        //��˼�ɱ
      if tagstr = 'ULNG' then g_boCanLongHit := False;       //��˼�ɱ
      if tagstr = 'WID'  then g_boCanWideHit := True;        //�ݿ��˹�
      if tagstr = 'UWID' then g_boCanWideHit := False;       //�ݿ��˹�
      if tagstr = 'CRS'  then g_boCanCrsHit := True;         //��ǳ��
      if tagstr = 'UCRS' then g_boCanCrsHit := False;        //��ǳ��
      if tagstr = 'TWN'  then g_boCanTwnHit := True;         //�ַ���
      if tagstr = 'UTWN' then g_boCanTwnHit := False;        //�ַ���
      if tagstr = 'WB'   then g_boCanWBHit := True;          //ǳ�˼�
      if tagstr = 'UWB'  then g_boCanWBHit := False;         //ǳ�˼�
      if tagstr = 'TAGU'   then g_boCanTaguHit := True;      //Ÿ������
      if tagstr = 'UTAGU'  then g_boCanTaguHit := False;     //Ÿ������
      if tagstr = 'THWN'  then g_boCanThwnHit := True;         //�������
      if tagstr = 'UTHWN' then g_boCanThwnHit := False;        //�������
      if tagstr = 'FIWN'  then g_boFireShHit := True;        //õȭ����
      if tagstr = 'UFIWN' then g_boFireShHit := False;       //õȭ����

      if tagstr = 'CRBS'  then g_boCanCrsBHit := True;        //ȸǳõ���� - ����
      if tagstr = 'UCRBS' then g_boCanCrsBHit := False;       //ȸǳõ���� - ����

      if tagstr = 'NCRS'  then g_boCanNanCrsHit := True;      //��ȭ��ǳ��
      if tagstr = 'UNCRS' then g_boCanNanCrsHit := False;     //��ȭ��ǳ��

      if tagstr = 'FIR'  then begin    //��ȭ��
         g_boNextTimeFireHit := TRUE;
         g_dwLatestFireHitTick := GetTickCount;
      end;
      if tagstr = 'UFIR' then          //��ȭ��
         g_boNextTimeFireHit := False;

      if tagstr = 'DEA'  then begin    //�����
         g_boNextTimeDeathHit := TRUE;
         g_dwLatestDeathHitTick := GetTickCount;
      end;
      if tagstr = 'UDEA' then          //�����
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
               FrmDlg.DMessageDlg ('����˺��Ѿ������ɹ���\' +
                                   '�й��˺ŵ����⣬����Է���������վ��\' +
                                   '����һЩ����֮�������ǻἰʱ�ĸĽ���\' +
                                   'www.mir2t.com', [mbOk]);
            end;
         SM_NEWID_FAIL:
            begin
               case msg.Recog of
                  0: begin
                        FrmDlg.DMessageDlg ('' + MakeNewId + '�Ѿ���������ʹ�á�\' +
                                            '�����һ���µ��˺�����ע�ᡣ',
                                            [mbOk]);
                        LoginScene.NewIdRetry (FALSE);
                     end;
                  -2: FrmDlg.DMessageDlg ('��ǰ�޷������˺š�\���Ժ��ٴγ��ԡ�', [mbOk]);
                  else FrmDlg.DMessageDlg ('�˺Ŵ���ʧ�ܣ���ȷ������˺����Ƿ��пո���������ַ���', [mbOk]);
               end;
            end;
         SM_PASSWD_FAIL:
            begin
               case msg.Recog of
                  -1: FrmDlg.DMessageDlg ('�������', [mbOk]);
                  -2: FrmDlg.DMessageDlg ('���������������������Σ����Ժ��ٴν��г��ԡ�', [mbOk]);
                  -3: FrmDlg.DMessageDlg ('�����ʻ�Ŀǰ����ʹ���л����쳣��ֹ����������\���Ժ��ٴν��г��ԡ�', [mbOk]);
                  -4: FrmDlg.DMessageDlg ('���˺Ų����ڡ�\��ʹ���������˺š�', [mbOk]);
                  -5: FrmDlg.DMessageDlg ('���˺Ų������½��', [mbOk]);
                  -6: FrmDlg.DMessageDlg ('��¼���汾����,���������°汾��\����ϵ����Ա���ߵ�½�ٷ���վ���ظ���\www.mir2t.com', [mbOk]);
                  else
                  FrmDlg.DMessageDlg ('ID�����ڻ�δ֪����', [mbOk]);
               end;

               LoginScene.PassWdFail;
            end;

         SM_NEEDUPDATE_ACCOUNT:
            begin
               ClientGetNeedUpdateAccount (body);
            end;
         SM_UPDATEID_SUCCESS:
            begin
               FrmDlg.DMessageDlg ('����˻���Ϣ�Ѿ����£����ס����˺ź����롣\' +
                                   '�벻Ҫ������˺ź�������߱��ˣ���������������룬\' +
                                   '����ϵ��Ϸ����Ա�һء�\', [mbOk]);
               ClientGetSelectServer;
            end;
         SM_UPDATEID_FAIL:
            begin
               FrmDlg.DMessageDlg ('�˻�����ʧ�ܡ� ', [mbOk]);
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
         SM_RENEWHUM: begin  //ĳ���� ����
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
           FrmDlg.DMessageDlg ('��������֤ʧ�ܡ�', [mbOk]);
           Close;
         end;
         SM_NEWCHR_SUCCESS: begin
           SendQueryChr;
         end;
         SM_NEWCHR_FAIL: begin
           case msg.Recog of
             0: FrmDlg.DMessageDlg ('[ʧ��] ��ɫ���ֲ����ϴ���Ҫ��', [mbOk]);
             2: FrmDlg.DMessageDlg ('[ʧ��] �㴴���Ľ�ɫ���Ѿ����ڣ��뻻����������ע�ᡣ', [mbOk]);
             3: FrmDlg.DMessageDlg ('[ʧ��] ÿ���˺�ֻ���������������Ҫ�����µĽ�ɫ��\��ɾ��һ����ɫ���ٴδ�����', [mbOk]);
             4: FrmDlg.DMessageDlg ('[ʧ��] ��ɫ����ʧ�ܡ�\ �����¿ͻ��˰汾��Ϣ��\������ϵ����Ա��ѯ��', [mbOk]);
             5: FrmDlg.DMessageDlg ('[ʧ��] ������˼������ְҵ��ʱû�п��š�', [mbOk]);
            else FrmDlg.DMessageDlg ('[ʧ��] ����δ֪���󣬾���������鿴�ٷ���վ��', [mbOk]);
           end;
         end;
         SM_CHGPASSWD_SUCCESS: begin
           FrmDlg.DMessageDlg ('�����޸ĳɹ���', [mbOk]);
         end;
         SM_CHGPASSWD_FAIL: begin
           case msg.Recog of
             -1: FrmDlg.DMessageDlg ('ԭʼ����������޷��޸����롣', [mbOk]);
             -2: FrmDlg.DMessageDlg ('�˺��ѱ����������Ժ���г��ԡ�', [mbOk]);
             else FrmDlg.DMessageDlg ('����ĵ�����̫�̻��߷���δ֪����', [mbOk]);
           end;
         end;
         SM_DELCHR_SUCCESS: begin
           SendQueryChr;
         end;
         SM_DELCHR_FAIL: begin
           FrmDlg.DMessageDlg ('[ʧ��] ��ɫɾ��ʧ�ܣ�����ϵ����Ա��ѯ��', [mbOk]);
         end;
         SM_STARTPLAY: begin
           ClientGetStartPlay (body);
           exit;
         end;
         SM_STARTFAIL: begin
           FrmDlg.DMessageDlg ('�������ӵ���������������޶ȣ��ѶϿ����ӡ�', [mbOk]);
               FrmMain.Close;
           ClientGetSelectServer();
           exit;
         end;
         SM_ROGUEENABLED: EnableRogue();
         SM_ROGUEDISABLED: DisableRogue();
         SM_VERSION_FAIL: begin
//           FrmDlg.DMessageDlg ('�汾�������������°汾��(http://www.lom2.net)', [mbOk]);
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

//        DScreen.AddChatBoardString ('�汾�������������°汾��', clYellow, clRed);
//        FrmDlg.DMessageDlg ('�汾�������������°汾��', [mbOk]);
//        CSocket.Close;
//        FrmMain.Close;
//        frmSelMain.Close;
        exit;
//        FrmDlg.DMessageDlg ('�汾�������������°汾��(http://www.lom2.net)', [mbOk]);
//        Close;
        exit;
//     end;
    end;
      SM_NEWMAP: begin
        FrmDlg.SafeCloseDlg;         //��������
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

            EffectNum := HIBYTE(msg.Series);           //�������
            if (EffectNum < 0) then EffectNum := 0;
            if (EffectNum = 1) or (EffectNum = 2) then RunEffectTimer.Enabled := True
            else RunEffectTimer.Enabled := False;
      end;

      SM_LOGON: begin
        SendClientMessage(CM_TIGERSET, 0, 0, 0, 0);  //ȣ���� ���� ������
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
          SendClientMessage (CM_QUERYBAGITEMS, 0, 0, 0, 0, VerInfoStr4);    //���ӱ� ����
          SendClientMessage (CM_QUERYSTORAGEITEMS, 0, 0, 0, 0, GetHardDiskSerial('c')); //�����Ǿ����ϴ�.

          g_MySelf.m_btJob :=  HiByte(Loword(wl.lTag1));

          if Lobyte(Loword(wl.lTag1)) = 1 then begin
          g_boAllowGroup := TRUE; //�׷�
          end else g_boAllowGroup := FALSE;
          g_boServerChanging := FALSE;
        end;
       if g_wAvailIDDay > 0 then begin
          DScreen.AddChatBoardString ('���Ѿ�ͨ�������˺�������Ϸ��', clGreen, clWhite)
        end else if g_wAvailIPDay > 0 then begin
          DScreen.AddChatBoardString ('����ͨ���̶�IP��ַ������Ϸ��', clGreen, clWhite)
        end else if g_wAvailIPHour > 0 then begin
          DScreen.AddChatBoardString ('����ͨ��IPʱ���˺�������Ϸ��', clGreen, clWhite)
        end else if g_wAvailIDHour > 0 then begin
          DScreen.AddChatBoardString ('����ͨ������ʱ���˺�������Ϸ��', clGreen, clWhite)
        end;
        LoadUserConfig(CharName);
        LoadIDInfo(CharName);
        LoadItemDescList;
        LoadMagicDescList;
        DScreen.AddChatBoardString ('����Ϸֻ�����׶����桿��Ȩ�����ʹ�á� ' , clGreen, clWhite) ;
        {if ((g_nAreaStateValue and $02) <> 0) or ((g_nAreaStateValue and $01) <> 0) or ((g_nAreaStateValue and $08) <> 0) then begin
         DScreen.AddSysMsg ('�׾����� �������� <CO$FFFF>����߸��� �ʴ�<CE> �����Դϴ�.' , 40, 60, clWhite);
        end else begin
         DScreen.AddSysMsg ('�׾����� �������� <CO$FFFF>����߸� �� �ִ�<CE> �����Դϴ�.', 40, 60, clWhite);
        end; }
        if g_HumRunDress then begin   //����
         DScreen.AddChatBoardString ('�����ܹ��ܿ�����',ClGreen,ClWhite);
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
      SM_ATTATCKMODE: begin           //���ݸ��  ǥ��
        g_nAttatckMode := Msg.Recog;
      end;


      SM_GROUPCALL: begin           //õ������
        g_nGroupCall := Msg.Param;
      end;


      SM_TURN:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2);
               str := GetValidStr3 (data, data, ['/']);
               //data = �̸�
               //str = ����
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
                     THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); // desc.AddStatus;   //��ϼ�
                     THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                     THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //������
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //������
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //ȫ����
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
               end;
            end;
         end;

         SM_FOXSTATE:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2); //ĳ�� �̸�
               str := GetValidStr3 (data, data, ['/']);
               //data = �̸�
               //str = ����
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            PlayScene.SendMsg (SM_TURN, msg.Recog,
                                 msg.Param,
                                 msg.tag,
                                 msg.Series,
                                 desc.Feature,
                                 desc.Status,
                                 ''); //�̸�

            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  actor.TempState := Hibyte(msg.Series); //���õ�� ���� ���� ����

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
              FrmDlg.SafeCloseDlg;   //��������
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
                      THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); //desc.AddStatus;    //���� ��ũ
                      THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                      THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //������
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //������
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //ȫ����
               end;
            end;
         end;
      SM_SPACEMOVE_SHOW3,
      SM_SPACEMOVE_SHOW4:
         begin
            if Length(body) > GetCodeMsgSize(sizeof(TCharDesc)*4/3) then begin
               Body2 := Copy (Body, GetCodeMsgSize(sizeof(TCharDesc)*4/3)+1, Length(body));
               data := DecodeString (body2); //ĳ�� �̸�
               str := GetValidStr3 (data, data, ['/']);
               //data = �̸�
               //str = ����
            end else data := '';
            DecodeBuffer (body, @desc, sizeof(TCharDesc));
            if msg.Recog <> g_MySelf.m_nRecogId then begin //�ٸ� ĳ������ ���
              PlayScene.NewActor (msg.Recog, msg.Param, msg.tag, msg.Series, desc.feature, desc.Status);
            end;
            PlayScene.SendMsg (msg.Ident, msg.Recog,
                                 msg.Param{x},
                                 msg.tag{y},
                                 msg.Series{dir + light},
                                 desc.Feature,
                                 desc.Status,
                                 ''); //�̸�
            if data <> '' then begin
               actor := PlayScene.FindActor (msg.Recog);
               if actor <> nil then begin
                  actor.m_sDescUserName := GetValidStr3(data, actor.m_sUserName, ['\']);
                  if (Actor <> g_MySelf) and (Actor <> g_MyHero) then begin
                    Actor.m_btJob := LoByte(LoWord(desc.AddStatus2));
                    if Actor.m_btRace = RCC_USERHUMAN then begin
                      THumActor(Actor).m_btGuildMark := LoByte(LoWord(desc.AddStatus)); //desc.AddStatus;    //���� ��ũ
                      THumActor(Actor).m_btMask := HiByte(LoWord(desc.AddStatus));
                      THumActor(Actor).m_WEffect := HiByte(LoWord(desc.AddStatus2));
                    end;
                  end;
                  actor.m_nNameColor := GetRGB(Str_ToInt(str, 0));
                  Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;
                  Actor.m_WEffect := HiByte(LoWord(desc.AddStatus2));
                  Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //������
                  Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //������
                  Actor.m_btColumn := LoByte(HiWord(desc.AddStatus2));;  //ȫ����
               end;
            end;
         end;
      SM_WALK, SM_DOWN, SM_RUSH, SM_RUSHKUNG, SM_MAGICMOVE:  //������
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
             Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;       //���λ���
            end;
         end;

      SM_RUN,SM_HORSERUN,SM_SPEEDRUN,SM_DOWNRUN:   //��ź�  ,������
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
             Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;       //���λ���
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
      SM_HITLEFT, //����
      SM_POWERHIT,      //18
      SM_WBHIT,         //ǳ�˼�
      SM_WBHIT2,        //ǳ�˼�
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
      SM_FISHING1,   //���� ����
      SM_FISHING2:   //���� ��
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
      SM_81, SM_82, SM_83,   //����
      SM_84, SM_85, SM_86:   //����
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
            // 2003/03/04 �׷�� Ž���Ŀ� ����
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
            UseLoopNormalEffect (msg.Recog{RecogID}, msg.Series{����}, msg.Param{�ð�});
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
            FrmDlg.DMessageDlg ('���������ӱ�ǿ���жϡ�\' +
                                '�����ѳ�ʱ���û��������������ӡ�\' +
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
               Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;     //���λ���
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

            if FrmDlg.DMasterDlg.Visible then    //���� ����
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
        g_nMyLuckPoint     := Hibyte(LongWord(Msg.Recog));//���ǥ��
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
                DScreen.AddSysMsg('������ 1 �㾭��ֵ��', 30, 60, clWhite)
              else  DScreen.AddSysMsg('������ <CO$FFFF>' + GetGoldStr(LongWord(MakeLong(msg.Param,msg.Tag))) +'<CE> �㾭��ֵ��', 30, 60, clWhite);
            end else begin
              if LongWord(MakeLong(msg.Param,msg.Tag)) = 1 then
                DScreen.AddChatBoardString ('������ 1 �㾭��ֵ',clWhite, clRed)
              else  DScreen.AddChatBoardString ('������ ' + GetGoldStr(LongWord(MakeLong(msg.Param,msg.Tag))) +' �㾭��ֵ��',clWhite, clRed);
            end;
            g_nExpRate:= LongWord(MakeLong(msg.Param,msg.Tag));      //����ġ �۾�
         end;
                                                  
      SM_CHANGEFAMEPOINT:
         begin
            g_MySelf.FameName := DecodeString (body);
            g_MySelf.m_Abil.KillPoint := msg.Recog; //ų/����
         end;

      SM_CHANGEFAMEPOINT2:
         begin
            g_MySelf.FameName := DecodeString (body);
            g_MySelf.m_Abil.DeathPoint := msg.Recog; //ų/����
         end;

      SM_LEVELUP:
         begin
            //������ �޽���
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            if Actor <> nil then begin
              DrawEffectHumEx(12,Actor);    //������ ����

              if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
                DScreen.AddChatBoardString ('ף���㣬��������ˡ� HP,MP�ָ���������',$00800000, $00F7B5CE);
              end;
            end;

         end;

      SM_LEVELUP2:
         begin
            //���ȯ �޽���
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            Actor.m_dwHumUpTime := GetTickCount();
            if Actor <> nil then begin
              DrawEffectHumEx(17,Actor);   //�����Ʈ

             if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
              //  DScreen.AddChatBoardString ('�����մϴ�! ��ȭ��� �Ǿ����ϴ�.',$00800000, $00F7B5CE);
              end;
            end;
         end;

       SM_LEVELUP3:
         begin
            //���ʽ� ����Ʈ
            i := MakeLong(msg.Tag, msg.Series);
            Actor := PlayScene.FindActor (i);
            Actor.FeatureChanged;
            if Actor <> nil then begin
              DrawEffectHumEx(18,Actor);   //���ʽ� ����Ʈ

             if Actor = g_MySelf then begin
                g_MySelf.m_Abil.Level:=msg.Param;
               // DScreen.AddChatBoardString ('�����մϴ�! ��ȭ��� �Ǿ����ϴ�.',$00800000, $00F7B5CE);
              end;
            end;
         end;


      SM_AUCBUFF: Begin //���
         str := DecodeString (body);
         ClientAucBuff(str,MakeLong(msg.Param, msg.Tag));
      end;

      SM_BUFF: Begin //����
         str := DecodeString (body);
         ClientBuffSystem(str,msg.Tag,msg.Param,msg.Series);
      end;

      SM_COOLBUFF: Begin //����
         str := DecodeString (body);
         ClientCoolBuffSystem(str,msg.Tag,msg.Param,msg.Series);
      end;

      SM_COOLTIME:  //����
         begin
         str := DecodeString (body);
         ClientCoolTime(str,msg.Tag);   //����
      end;

      SM_ROCKPAPERS:  //����������
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
        {if Actor.m_Group <> nil then begin            //������ġ
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
                  if g_MySelf.m_nNameColor = 249 then        //�����̴� ������ ������ �� ���´�.
                     g_dwLatestStruckTick := GetTickCount;
               end else begin
                  if Actor.CanCancelAction then
                     Actor.CancelAction;
               end;
               if Actor.m_nState and $00000100 <> 0 then begin //�ݰ��ұ�

               end else
               Actor.UpdateMsg (SM_STRUCK, wl.lTag2, 0,      //�ǰ��ൿ
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
               Actor.m_boStartStore := LoByte(HiWord(desc.AddStatus)) > 0;        //���λ���
               Actor.m_btHumEffect := HiByte(HiWord(desc.AddStatus));  //������
               Actor.m_btEventEffect := HiByte(HiWord(desc.AddStatus2));  //������
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
      SM_LIPEITEMCOR:    //ȯ����
         begin
           str := DecodeString (body);
           FrmDlg.DMessageDlg (str, [mbOk]);
         end;
      SM_MYSHOPCART:    //ȯ����
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
      SM_WHISPER,      //�ӼӸ�
      ME_WHISPER,      //���� ���� �޽���
      LM_WHISPER,     //���� ���� �޽���
      SM_SYSMESSAGE:
         begin
            ClientGetSayMsg(Msg, DecodeString(body));
         end;

      SM_MOVEMESSAGE: begin     //ȭ�����
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
      SM_CHANGENAMECOLOR:           //���� ������.
         begin
            actor := PlayScene.FindActor (msg.Recog);
            if actor = nil then exit;

            if (Pos('(',actor.m_sUserName) <> 0) and (actor.m_nNameColor <> GetRGB(msg.Param)) then begin
              DrawEffectHumEx(12,actor);  //������ ����

            if (Pos(g_MySelf.m_sUserName,actor.m_sUserName) <> 0) then
                DScreen.AddChatBoardString ('��ı��������ˡ�',clWhite, clPurple);
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
      SM_ADDITEM:   //������ ȹ��
         begin
            ClientGetAddItem (body,msg.Series);
         end;
      SM_COUNTERITEMCHANGE:
         begin
            ChangeItemCount (msg.Recog, msg.Param, msg.Tag, DecodeString (body));
         end;
      SM_ADDITEM2: //����
         begin
            ClientGetAddItem2 (body,  msg.Series);
         end;
      SM_ADDSTORAGEITEM: ClientGetStorageAddItem (body,msg.Series);
      SM_ADDGROUPITEM:   //������ ȹ��
         begin
            ClientGetGroupAddItem(@Msg, msg.Tag, DecodeString (body));
         end;
      SM_UPGRADEITEM_RESULT:
         begin
            UpgradeItemResult(msg.Recog, msg.Param, DecodeString (body));    //����
         end;
      SM_BAGITEMS:   //����
         begin
            ClientGetBagItmes (body);
         end;
      SM_BAGITEMS2:    //����
        begin
          FillChar (g_ItemArr, sizeof(TClientItem)*MAXBAGITEMCL, #0);
          MoveingItemIndex:= -1;
        end;
      SM_STORAGEITEMS:  //����
        begin
          ClientGetStoreItems (body);
        end;
      SM_STORAGEITEMS2:  //����
        begin
          FillChar (g_StoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
        end;
      SM_ADDSTORAGE:   //����
        begin
          ClientGetAddStore (body);
        end;

      SM_RENTALITEMS:        //�뿩
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearRentalDlg;
            ClientRentalItems (body);
         end;

      SM_RENTALITEMS2:        //�뿩
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearRentalDlg2;
            ClientOwnerItems (body);
         end;

      SM_GETPETINFO:        //����
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearPetDlg;
            ClientPetInfo (body);
         end;
      SM_GETPETINFO_FAIL:    //����
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

            g_AuctionCurrPage := msg.Param;       //��Ź
            g_AuctionAmountofPages := msg.Tag;
            g_AuctionCurrSection := msg.Series;

            ClientAuctionItems (body);
         end;

      SM_COMSTORAGEITEMS:        //����â��
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            FrmDlg.ClearComStorageDlg;
            ClientComStorageItems (body);
         end;

      SM_GUILDSTORAGEITEMS:        //����â��
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
          if mrOk = FrmDlg.DMessageDlg ('��Ҫ���� ' +
            IntToStr(msg.Recog) + '��ҹ����л�ׯ԰��', [mbOk, mbCancel])
          then begin
            self.SendTradeGT(1);
          end else
            self.SendTradeGT(0);
        end;
      SM_BBSMSGLIST:         //����Խ���
        begin
          FrmDlg.ClearBBSList;
          g_GTCurrPage:= msg.Param;
          g_GTAmountOnPage:=msg.Tag;
          G_GTTotalPage:=msg.Series;
          ClientBBSList(body);
        end;
      SM_BBSMSG:               //����Խ���
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
      SM_OPENDOOR_LOCK  :DScreen.AddSysMsg ('<CO$FFFF>��<CE> �����ˡ�',40, 60,clLime);
      SM_CLOSEDOOR      :Map.CloseDoor (msg.param, msg.tag);


      SM_CANCLOSE_OK:
         begin
            if (GetTickCount - g_dwLatestStruckTick > 10000) and
               (GetTickCount - g_dwLatestMagicTick > 10000) and
               (GetTickCount - g_dwLatestHitTick > 10000) or
               (g_MySelf.m_boDeath) then begin
               AppLogOut;
            end else
                  DScreen.AddChatBoardString ('��ս�����޷��˳���Ϸ��', clYellow, clRed);
         end;

      SM_CANCLOSE_FAIL:
         begin
               DScreen.AddChatBoardString ('��ĳ���������ս���������޷��˳���Ϸ��', clYellow, clRed);
         end;

      SM_TAKEON_OK:
         begin
            g_MySelf.m_nFeature := msg.Recog;
            g_MySelf.FeatureChanged;
            if g_WaitingUseItem.Index in [0..MAXUSEITEM] then //������ ����
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
      SM_TAKEOFF_OK2:  //���� ����
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
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(msg.Recog-g_MySelf.m_nGold) + '<CE> ��ұ����֡�' ,40,60, clWhite);
            end;
            if MakeLong(msg.Param,msg.Tag) > g_MySelf.m_nGameGold then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGameGold) + '<CE> ��Ϸ�ұ����֡�' ,40,60,clOlive);
            end;
            g_MySelf.m_nGold := msg.Recog;
            g_MySelf.m_nGameGold:=MakeLong(msg.Param,msg.Tag);
         end;

      SM_POINTCHANGED:
         begin
            SoundUtil.PlaySound (s_money);
            if msg.Recog > g_MySelf.m_nPCPoint then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(msg.Recog-g_MySelf.m_nPCPoint) + '<CE> PC�㱻���֡�' ,40,60,clLime);
            end;
            if MakeLong(msg.Param,msg.Tag) > g_MySelf.m_nGameGold then begin
               DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGameGold) + '<CE> ��Ϸ�ұ����֡�' ,40,60,clOlive);
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
            //2012-2-3 ����Į�� �̸� �� ���̵���..
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

      SM_OPWWAPONMG:    //���
         Begin
           FrmDlg.ShowDUpWapon(msg.Recog); //���
         End;
      SM_CHECKWEAPON:    //���� Ȯ��
         Begin
           FrmDlg.ShowCheckWapon(msg.Recog);
         End;
      SM_SETPASSWORD: ClientStorageSetPassWord();      //â���ȣ
      SM_INPUTPASSWORD: ClientStorageInputPassWord(msg.Recog);   //â���ȣ

      SM_CORWAPONMG:   //���
         Begin
           FrmDlg.CloseDUpWapon;    //���
         End;

      SM_SENDGOODSLIST: //����
         begin
            ClientGetSendGoodsList (msg.Recog, msg.Param, body);
         end;
      SM_SENDGOODAPPR: //����
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
      SM_SENDUSERMAKEITEMLIST:             //��������
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
            FrmDlg.DMessageDlg ('�㲻�ܳ��������Ʒ��', [mbOk]);
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
            FrmDlg.DMessageDlg ('�㲻�����������Ʒ��', [mbOk]);
         end;

      SM_SENDUSERWAKE: ClientGetSendUserWake(Msg.Recog);
      SM_SENDWAKECOST: ClientObjWakeCost(Msg.Recog);
      SM_USERITEMWAKE_OK: ClientObjItemWakeOK(@Msg, DecodeString(Body));
      SM_USERITEMWAKE_FAIL: ClientObjItemWakeFail(@Msg);

      SM_SENDUSERRESTORE: ClientGetSendUserReStore(Msg.Recog);
      SM_SENDRESTORECOST: ClientObjReStoreCost(Msg.Recog);
      SM_USERITEMRESTORE_OK: ClientObjItemReStoreOK(@Msg, Body);
      SM_USERITEMRESTORE_FAIL: ClientObjItemReStoreFail(@Msg);

      SM_PRICEDISASSEMBLE:       //��������
         begin
            if g_DisassembleDlgItem.S.Name <> '' then begin
               if msg.Recog >= 0 then
                  g_sDisassemblePriceStr := IntToStr(msg.Recog) + ' ���'
               else g_sDisassemblePriceStr := '???? ���';
            end;
         end;
      SM_SENDUSERDISASSEMBLE:      //��������
         begin
            ClientGetSendUserDisassemble (msg.Recog);
         end;
      SM_SENDUSERWAKEUP:
         begin
            FrmDlg.ShowWakeUp;
         end;
      SM_DISASSEMBLE_OK:          //��������
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            g_DisassembleDlgItemWait.S.Name := '';
            PlaySound(s_Money);
         end;
      SM_DISASSEMBLE_FAIL:        //��������
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_DisassembleDlgItemWait);
            g_DisassembleDlgItemWait.S.Name := '';
            Case msg.Recog of
              1: FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
              2: FrmDlg.DMessageDlg ('�㲻�ֽܷ����Ʒ��', [mbOk]);
              3: FrmDlg.DMessageDlg ('�㲻��Я���������Ʒ��', [mbOk]);
            end;
         end;

      SM_PRICEDISMANTLE:  //�Ϲݺ���
         begin
            if g_DismantleDlgItem.S.Name <> '' then begin
               if msg.Recog >= 0 then
                  g_sDismantlePriceStr := GetGoldStr(msg.Recog) + '���'
               else g_sDismantlePriceStr := '????���';
            end;
         end;
      SM_SENDUSERDISMANTLE:    //�Ϲݺ���
         begin
            ClientGetSendUserDismantle (msg.Recog);
         end;
      SM_DISMANTLE_OK:      //�Ϲݺ���
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            g_DismantleDlgItemWait.S.Name := '';
            PlaySound(s_Money);
         end;
      SM_DISMANTLE_FAIL:       //�Ϲݺ���
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_DismantleDlgItemWait);
            g_DismantleDlgItemWait.S.Name := '';
            Case msg.Recog of
              1: FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
              2: FrmDlg.DMessageDlg ('�㲻�ֽܷ����Ʒ��', [mbOk]);
              3: FrmDlg.DMessageDlg ('�㲻��Я���������Ʒ��', [mbOk]);
            end;
         end;


      SM_USERCHECKWEAPON_OK:   //���� Ȯ��
         begin
            if g_UpWaponWait.S.Name <> '' then begin
               FrmDlg.LastestClickTime := GetTickCount;
               g_UpWaponWait.S.Name := '';
            end;
         end;
      SM_USERCHECKWEAPON_UPFAIL:    //���� ����
         begin
            if g_UpWaponWait.S.Name <> '' then begin
               FrmDlg.LastestClickTime := GetTickCount;
               g_UpWaponWait.S.Name := '';
            end;
         end;
      SM_USERCHECKWEAPON_FAIL:    //���� Ȯ��
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            AddItemBag (g_UpWaponWait);
            g_UpWaponWait.S.Name := '';
            FrmDlg.DMessageDlg ('�㻹����ȡ��������', [mbOk]);
         end;

      SM_AUC_OK:  //���
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_ActionItemWait.S.Name := '';
          g_ActionItems.S.Name := '';
          FrmDlg.CloseAction;
          ClientAucItems (body);
        end;

      SM_AUC_FAIL: //���
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('���۵ļ۸���СΪ 1,000 ��ҡ�', [mbOk]);
               2: FrmDlg.DMessageDlg ('���������ļ��ۼ۸�\���۵ļ۸񳬹������������޶ȡ�', [mbOk]);      //1��5õ
               3: FrmDlg.DMessageDlg ('û�з�����Ʒ��', [mbOk]);
               4: FrmDlg.DMessageDlg ('û���㹻�ı�֤��', [mbOk]);
               5: FrmDlg.DMessageDlg ('����۵���Ʒ��������������������������', [mbOk] );
               6: FrmDlg.DMessageDlg ('�㲻�ܼ��������Ʒ��', [mbOk]);
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
                  FrmDlg.DMessageDlg ('��ĸ��˲ֿ��Ѿ����ˣ��㲻�ܼ��������Ʒ��', [mbOk])  ;
                  AddItemBag (g_SellDlgItemSellWait);
               end else begin
                  FrmDlg.DMessageDlg ('�㲻�ܼĴ������Ʒ��', [mbOk]);
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
               1: FrmDlg.DMessageDlg ('������Ʒ�ļ۸�����Ϊ 1,000��ҡ�', [mbOk]);
               2: FrmDlg.DMessageDlg ('��������ʵļ��ۼ۸�\���۵ļ۸񳬹������������޶ȡ�', [mbOk]);      //1��5õ
               3: FrmDlg.DMessageDlg ('û�з�����Ʒ��', [mbOk]);
               4: FrmDlg.DMessageDlg ('û���㹻�ı�֤��', [mbOk]);    //��Ź
               5: FrmDlg.DMessageDlg ('����۵���Ʒ��������������������������', [mbOk] );
               6: FrmDlg.DMessageDlg ('�㲻�ܼ��������Ʒ��', [mbOk]);
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

      SM_GETRENTALITEMS_FAIL:    //�뿩
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearRentalDlg;
          if FrmDlg.DRentalDlg.Visible = false then
            FrmDlg.ToggleRentalDlg;
        end;

      SM_GETRENTALITEMS_FAIL2:    //�뿩
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearRentalDlg2;
          if FrmDlg.DRentalDlg.Visible = false then
            FrmDlg.ToggleRentalDlg2;
        end;


      SM_COMSTORAGE_OK:      //����â��
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_SellDlgItemSellWait.S.Name := '';
          g_SellDlgItem.S.Name := ''
        end;
      SM_COMSTORAGE_FAIL:    //����â��
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('�����ֿ��Ѿ����ˡ�', [mbOk] );
               2: FrmDlg.DMessageDlg ('�㲻�ܱ��������Ʒ��', [mbOk]);
               3: FrmDlg.DMessageDlg ('�ֿ����˲����ڡ�', [mbOk]);
               4: FrmDlg.DMessageDlg ('��Ʒ�����ڡ�', [mbOk]);
               5: FrmDlg.DMessageDlg ('��Ҳ��㡣.', [mbOk]);    //��Ź
            end;
            AddItemBagst(g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_GETCOMSTORAGEITEMS_FAIL:    //����â��
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearComStorageDlg;
          if FrmDlg.DComStorage.Visible = false then
            FrmDlg.ToggleComStorageWindow;
        end;
      SM_CLOSECOMSTORAGE:      //����â��
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          DScreen.ClearHint;
          FrmDlg.CloseDSellDlg;
          if FrmDlg.DComStorage.Visible = true then
            FrmDlg.ToggleComStorageWindow;
        end;

      SM_GUILDSTORAGE_OK:      //����â��
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          g_SellDlgItemSellWait.S.Name := '';
          g_SellDlgItem.S.Name := ''
        end;
      SM_GUILDSTORAGE_FAIL:         //����â��
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('�л�ֿ��Ѿ����ˡ�', [mbOk] );
               2: FrmDlg.DMessageDlg ('����Ʒ�޷��Ĵ档', [mbOk]);
               3: FrmDlg.DMessageDlg ('�ֿ����˲����ڡ�', [mbOk]);
               4: FrmDlg.DMessageDlg ('��Ʒ�����ڡ�', [mbOk]);
               5: FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
               6: FrmDlg.DMessageDlg ('�㻹û�м����лᡣ', [mbOk]);
            end;
            AddItemBagst(g_SellDlgItemSellWait);
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_GETGUILDSTORAGEITEMS_FAIL:       //����â��
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearGuildStorageDlg;
          if FrmDlg.DGuildStorage.Visible = false then
            FrmDlg.ToggleGuildStorageWindow;
        end;
      SM_CLOSEGUILDSTORAGE:        //����â��
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
            FrmDlg.LastestClickTime := GetTickCount; //2010-07-06 ���� ����
            if msg.Ident <> SM_TAKEBACKSTORAGEITEM_OK then begin
               if msg.Ident = SM_TAKEBACKSTORAGEITEM_FULLBAG then begin
                  mj := g_MovingItem.Index;
                  if mj >= 500 then begin   //����
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('���޷�ȡ�ء�', [mbOk]);
                   Exit;
                 end;
               end else
                 mj := g_MovingItem.Index;
                  if mj >= 500 then begin   //����
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('�����ڡ�', [mbOk]);
                   Exit;
                 end;
            end;
            //   FrmDlg.DelStorageItem (msg.Recog); //itemserverindex
         end;

      SM_KMSendMsg:   //�ߵ���
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


      SM_ToSendMsg:       //�䳪���� �޽���!
         begin
           str := DecodeString (body);
           Case msg.Recog of
             86: begin      //ȯ�� ���
               if msg.Param = 1 then begin
                g_boDropDrug := TRUE;
               end else begin
                g_boDropDrug := FALSE;
               end;
               if g_boDropDrug then begin
                 s1 := '��ֹ��Ʒ����'
               end else begin
                 s1 := '������Ʒ����';
               end;
               if g_HumRunDress then begin
                 s2:= '�����ܹ���\'+ s1;
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
             4: begin    //õ�� ����
               g_MySelf.SendMsg (CM_CPOWERHIT, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.Param, 0, 0, '', 0);
             end;

             89: begin      //����
               if msg.Param = 1 then begin
                g_HumRunDress := TRUE;
               end else begin
                g_HumRunDress := FALSE;
               end;
               if g_boDropDrug then begin
                 s1 := '��ֹ��Ʒ����'
               end else begin
                 s1 := '������Ʒ����';
               end;
               if g_HumRunDress then begin
                 s2:= '�����ܹ���\'+ s1;
               end else begin
                 s2:= s1;
               end;
               ClientBuffSystem(s2,1,281,92);
             end;
             90: begin      //����ȯ
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

             91: begin    //�ϰݺ�
              g_MySelf.SendMsg (CM_BALDO , g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.Param, 0, 0, '', 0);
             end;

             93: begin   //���ӱ�
               g_nGroupCall := Msg.Tag;
               LogInVer := str;
               g_boDropDrug := FALSE;
               if VerInfoStr2 = LogInVer then begin  //����
                 if g_boDropDrug then begin
                   s1 := '��ֹ��Ʒ����'
                 end else begin
                   s1 := '������Ʒ����';
                 end;
                 if g_HumRunDress then begin
                   s2:= '�����ܹ���\'+ s1;
                 end else begin
                   s2:= s1;
                 end;
                 ClientBuffSystem(s2,1,281,92);
               end else begin
                 Application.MessageBox(PAnsiChar(DecodeString_3des('a9fZg+rWm+npGHymc6ZNNZzFIWJyXVlWy/jjpA==','56m2VipGate')),   //���޸��ˡ�.
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

      SM_COMSTORAGEGIVE:  //����â��
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DStorageRefreshClick(Self,0,0);
         end;

      SM_GUILDSTORAGEGIVE:  //����â��
         begin
            FrmDlg.LastestClickTime := GetTickCount;

            if msg.Param <> 1 then
              g_MySelf.m_nGold := msg.Recog;

            FrmDlg.DGuildStorageReClick(Self,0,0);
         end;

      SM_RENTALGIVE:  //�뿩
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
               1: FrmDlg.DMessageDlg ('��Ʒ�������ꡣ', [mbOk]);
               2: FrmDlg.DMessageDlg ('��Ʒ�����ڡ�', [mbOk]);
               3: FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
               4: FrmDlg.DMessageDlg ('��ı����Ѿ����ˡ�', [mbOk]);
            end;
         end;
      SM_MAKEDRUG_SUCCESS:         //��������
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            g_MySelf.m_nGold := msg.Recog;
            PlaySound(s_Money);
            FrmDlg.DMessageDlg ('��Ʒ����ɹ���', [mbOk]);
         end;


       SM_MAKEDRUG_FAIL:   //��������
         begin
            FrmDlg.LastestClickTime := GetTickCount;
            case msg.Recog of
               1: FrmDlg.DMessageDlg ('��������', [mbOk]);
               2: FrmDlg.DMessageDlg ('�㲻��Я���������Ʒ��', [mbOk]);
               3: FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
               4: FrmDlg.DMessageDlg ('���ϲ��㡣.', [mbOk]);
               5: FrmDlg.DMessageDlg ('����ϳ�ʧ�ܡ�', [mbOk]);
               6: FrmDlg.DMessageDlg ('��ʯ�Ĵ���̫�͡�', [mbOk]);
            end;
         end;
      SM_716: begin
        if (Msg.Series in [11..21]) then begin        //����  ���� ������  �ݰ�����
          actor := PlayScene.FindActor (msg.Recog);
          if actor <> nil then
            DrawEffectHumEx(Msg.Series{type},actor)
        end else begin
          DrawEffectHum(Msg.Series{type},Msg.Param{x},Msg.Tag{y}, StrToInt(DecodeString(Body)));
          UseNormalEffect(msg.Series{����}, msg.Param{X}, msg.Tag{Y});
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
      SM_CREATEGROUP_OK:        //��û�� ���
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            g_boAllowGroup := TRUE;
            g_MySelf.m_boOpenHealth := TRUE;   //�׷� �ΰ� ü�� ���̱�
         end;
      SM_CREATEGROUP_FAIL:
         begin
            g_dwChangeGroupModeTick := GetTickCount;
            case msg.Recog of
             //  1: FrmDlg.DMessageDlg('Successfully sent a team invitation, please wait for the other party to respond!', [mbOk]);
             //  2: FrmDlg.DMessageDlg('[Failed]: Players already sent a team to the invitation, please do not repeat!', [mbOk]);
               -1: FrmDlg.DMessageDlg ('���Ѿ������˶��顣', [mbOk]);
               -2: FrmDlg.DMessageDlg ('�����Ķ�������ֲ���ȷ��', [mbOk]);
               -3: FrmDlg.DMessageDlg ('���Ѿ����������Ķ��顣', [mbOk]);
               -4: FrmDlg.DMessageDlg ('�Է��ܾ���ӡ�', [mbOk]);
               -5: FrmDlg.DMessageDlg ('����������ͶԷ���ӡ�', [mbOk]);
               -6: FrmDlg.DMessageDlg ('��ǰ�����Ѿ���Ա��', [mbOk]);
               -7: FrmDlg.DMessageDlg ('��ǰ��ͼ��ֹ��ӡ�', [mbOk]);
               -8: FrmDlg.DMessageDlg ('�Է����ڵĵ�ͼ��ֹ��ӡ�', [mbOk]);
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
               -1: FrmDlg.DMessageDlg ('��Ҫ����Ķ��鲻���ڡ�', [mbOk]);
               -2: FrmDlg.DMessageDlg ('��Ҫ����Ķ�������ִ���', [mbOk]);
               -3: FrmDlg.DMessageDlg ('���Ѿ������˶��顣', [mbOk]);
               -4: FrmDlg.DMessageDlg ('�Է��ܾ���ӡ�', [mbOk]);
               -5: FrmDlg.DMessageDlg ('�����Ѿ���Ա��', [mbOk]);
               -6: FrmDlg.DMessageDlg ('��ǰ��ͼ�Ķ��������Ѿ��ﵽ���ֵ��', [mbOk]);
               -7: FrmDlg.DMessageDlg ('�Է����ڵ�ͼ�Ķ��������Ѿ��ﵽ���ֵ��', [mbOk]);
               -8: FrmDlg.DMessageDlg ('�����ڵ�ͼ�Ķ��������Ѿ��ﵽ���ֵ��', [mbOk]);
               -9: FrmDlg.DMessageDlg ('��ǰ��ͼ�޷���ӡ�', [mbOk]);
               -10: FrmDlg.DMessageDlg ('�Է����ڵĵ�ͼ�޷���ӡ�', [mbOk]);
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
               -1: FrmDlg.DMessageDlg ('���鲻���ڡ�', [mbOk]);
               -2: FrmDlg.DMessageDlg ('���ִ���', [mbOk]);
               -3: FrmDlg.DMessageDlg ('�㻹û�г������顣', [mbOk]);
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

      SM_TIGERSETCHANGED:  //ȣ����
         begin
            if msg.Param > 0 then g_TigerSet := TRUE
            else g_TigerSet := FALSE;

            g_dwChangeTigerSetTick := GetTickCount + 3000;  //3�� ������
         end;

      SM_FISHCANCEL: begin //����
         begin
            ExitFishing;
         end;
      end;

      SM_FISHINC: begin //����
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
            FrmDlg.DMessageDlg ('�㻹û�м����лᡣ', [mbOk]);
         end;


      SM_RENTALTRY_FAIL: begin            //�뿩
        g_dwQueryMsgTick := GetTickCount;
        FrmDlg.DMessageDlg ('����ʧ�ܡ�', [mbOk]);
      end;
      SM_RENTALMENU:                    //�뿩
         begin
            g_dwQueryMsgTick := GetTickCount;
            g_sRentalWho := DecodeString (body);
            FrmDlg.OpenRentalDlg(msg.Recog);
         end;
      SM_RENTALCANCEL: begin            //�뿩
        FrmDlg.CancelItemMoving;
        MoveRentalItemToBag;
        if g_nRentalGold > 0 then begin
          g_MySelf.m_nGold := g_MySelf.m_nGold + g_nRentalGold;
          g_nRentalGold := 0;
        end;
        FrmDlg.CloseRentalDlg;
      end;
      SM_RENTALADDITEM_OK:             //�뿩
         begin
            g_dwRentalActionTick := GetTickCount;
            if g_RentalDlgItem.S.Name <> '' then begin
               AddRentalItem (g_RentalDlgItem);
               g_RentalDlgItem.S.Name := '';
            end;
         end;
      SM_RENTALADDITEM_FAIL: begin             //�뿩
        g_dwRentalActionTick:=GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin
          AddItemBag(g_RentalDlgItem);
          g_RentalDlgItem.S.Name:= '';
        end;
      end;
      SM_RENTALDELITEM_OK: begin             //�뿩
        g_dwRentalActionTick:=GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin

          g_RentalDlgItem.S.Name := '';
        end;
      end;
      SM_RENTALDELITEM_FAIL: begin              //�뿩
        g_dwRentalActionTick := GetTickCount;
        if g_RentalDlgItem.S.Name <> '' then begin
          DelItemBag (g_RentalDlgItem.S.Name, g_RentalDlgItem.MakeIndex);
          AddRentalItem (g_RentalDlgItem);
          if (g_MovingItem.Item.MakeIndex = g_RentalDlgItem.MakeIndex) and (g_MovingItem.Item.S.Name = g_RentalDlgItem.S.Name) then begin  //11-02-11 �ŷ� sql ���°�
             g_boItemMoving := FALSE;
             g_MovingItem.Item.S.Name := '';
          end;
          g_RentalDlgItem.S.Name := '';
        end;
      end;
      SM_RENTALREMOTEADDITEM: ClientGetRentalRemoteAddItem (body);        //�뿩
      SM_RENTALREMOTEDELITEM: ClientGetRentalRemoteDelItem (body);     //�뿩
      SM_RENTALCHGGOLD_OK: begin    //�뿩
        g_nRentalGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALCHGDAY_OK: begin    //�뿩
        g_nRentalDay:=msg.Recog;
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALCHGGOLD_FAIL: begin                                 //�뿩
        g_nRentalGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwRentalActionTick:=GetTickCount;
      end;
      SM_RENTALCHGDAY_FAIL: begin                                 //�뿩
        g_nRentalDay:=msg.Recog;
        g_dwRentalActionTick:=GetTickCount;
      end;

      SM_RENTALREMOTECHGGOLD: begin                       //�뿩
        g_nRentalRemoteGold:=msg.Recog;
        SoundUtil.PlaySound(s_money);
      end;

      SM_RENTALREMOTECHGDAY: begin                       //�뿩
        g_nRentalRemoteDay:=msg.Recog;
      end;

      SM_RENTALSUCCESS: begin             //�뿩
        FrmDlg.CloseRentalDlg;
      end;






      SM_DEALTRY_FAIL: begin              //�ŷ�
        g_dwQueryMsgTick := GetTickCount;
        FrmDlg.DMessageDlg ('���ױ�ȡ���ˡ�\���׵�˫�����������վ�š�', [mbOk]);
      end;
      SM_DEALMENU:                    //�ŷ�
         begin
            g_dwQueryMsgTick := GetTickCount;
            g_sDealWho := DecodeString (body);
            FrmDlg.OpenDealDlg;
         end;
      SM_DEALCANCEL: begin             //�ŷ�
        FrmDlg.CancelItemMoving;
        MoveDealItemToBag;
        if g_nDealGold > 0 then begin
          g_MySelf.m_nGold := g_MySelf.m_nGold + g_nDealGold;
          g_nDealGold := 0;
        end;
        FrmDlg.CloseDealDlg;
      end;
      SM_DEALADDITEM_OK:               //�ŷ�
         begin
            g_dwDealActionTick := GetTickCount;
            if g_DealDlgItem.S.Name <> '' then begin
               AddDealItem (g_DealDlgItem);
               g_DealDlgItem.S.Name := '';
            end;
         end;
      SM_DEALADDITEM_FAIL: begin             //�ŷ�
        g_dwDealActionTick:=GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin
          AddItemBag(g_DealDlgItem);
          g_DealDlgItem.S.Name:= '';
        end;
      end;
      SM_DEALDELITEM_OK: begin               //�ŷ�
        g_dwDealActionTick:=GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin

          g_DealDlgItem.S.Name := '';
        end;
      end;
      SM_DEALDELITEM_FAIL: begin                //�ŷ�
        g_dwDealActionTick := GetTickCount;
        if g_DealDlgItem.S.Name <> '' then begin
          DelItemBag (g_DealDlgItem.S.Name, g_DealDlgItem.MakeIndex);
          AddDealItem (g_DealDlgItem);
          if (g_MovingItem.Item.MakeIndex = g_DealDlgItem.MakeIndex) and (g_MovingItem.Item.S.Name = g_DealDlgItem.S.Name) then begin  //11-02-11 �ŷ� sql ���°�
             g_boItemMoving := FALSE;
             g_MovingItem.Item.S.Name := '';
          end;
          g_DealDlgItem.S.Name := '';
        end;
      end;
      SM_DEALREMOTEADDITEM: ClientGetDealRemoteAddItem (body);        //�ŷ�
      SM_DEALREMOTEDELITEM: ClientGetDealRemoteDelItem (body);       //�ŷ�
      SM_DEALCHGGOLD_OK: begin
        g_nDealGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwDealActionTick:=GetTickCount;
      end;
      SM_DEALCHGGOLD_FAIL: begin                                 //�ŷ�
        g_nDealGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
        g_dwDealActionTick:=GetTickCount;
      end;
      SM_DEALREMOTECHGGOLD: begin                       //�ŷ�
        g_nDealRemoteGold:=msg.Recog;
        SoundUtil.PlaySound(s_money);
      end;
      SM_DEALSUCCESS: begin              //�ŷ�
        FrmDlg.CloseDealDlg;
      end;

      SM_EXSUCCESS: begin  //ȯ�� ����
        g_nExChangeGold := 0;
        g_nExChangeGameGold := 0;
      end;

      SM_EXCANCEL: begin    //ȯ�� ���
         g_MySelf.m_nGold := msg.Recog;
         g_MySelf.m_nGameGold:=MakeLong(msg.Param,msg.Tag);
         g_nExChangeGold := 0;
         g_nExChangeGameGold := 0;
      end;

      SM_EXCHGRATE: begin     //ȯ�� �ü�
        str := DecodeString (body);
        g_nExChgGoldRate:=msg.Recog;
        g_nExChgGameGoldRate := StrToFloat(str);
      end;

      SM_EXCHGGOLD_OK: begin     //ȯ��  (���� - ��ȯ)
        g_nExChangeGameGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
      end;
      SM_EXCHGGOLD_FAIL: begin   //ȯ��
        g_nExChangeGameGold:=msg.Recog;
        g_MySelf.m_nGold:=MakeLong(msg.param, msg.tag);
      end;

      SM_EXCHGGAMEGOLD_OK: begin     //ȯ��  (��ȯ - ����)
        g_nExChangeGold:=msg.Recog;
        g_MySelf.m_nGameGold:=MakeLong(msg.param, msg.tag);
      end;
      SM_EXCHGGAMEGOLD_FAIL: begin   //ȯ��
        g_nExChangeGold:=msg.Recog;
        g_MySelf.m_nGameGold:=MakeLong(msg.param, msg.tag);
      end;


      SM_SENDUSERSTORAGEITEM: begin
        ClientGetSendUserStorage(msg.Recog, msg.Param);
      end;
      SM_SENDUCOMSTORAGEITEM : begin  //����â��
        ClientGetSendComStorage(msg.Recog);
      end;
      SM_SENDUGUILDSTORAGEITEM: begin  //����â��
        ClientGetSendGuildStorage(msg.Recog);
      end;
      SM_CHANGEGUILDNAME: begin
        ClientGetChangeGuildName(@Msg,DecodeString (body));
      end;
      SM_SENDUSERSTATE: begin
        ClientGetSendUserState(body);
      end;
      SM_SENDGUILDGROW: begin     //���ļ���
        ClientGetSendGuildGrow(body);
      end;
      SM_SENDGUILDGROW2: begin     //���ļ���
        ClientGetSendGuildGrow2(body);
      end;
      SM_GUILDADDMEMBER_OK: begin
        SendGuildMemberList;
      end;
      SM_GUILDADDMEMBER_FAIL: begin
        case msg.Recog of
          1: FrmDlg.DMessageDlg ('��û��Ȩ��ʹ��������', [mbOk]);
          2: FrmDlg.DMessageDlg ('���ĳ�Ա�����������վ�š�', [mbOk]);
          3: FrmDlg.DMessageDlg ('�Է��Ѿ��������лᡣ', [mbOk]);
          4: FrmDlg.DMessageDlg ('�Է��Ѿ������������лᡣ', [mbOk]);
          5: FrmDlg.DMessageDlg ('�Է�����������лᡣ', [mbOk]);
        end;
      end;
      SM_GUILDDELMEMBER_OK: begin
        SendGuildMemberList;
      end;
      SM_GUILDDELMEMBER_FAIL: begin
        case msg.Recog of
          1: FrmDlg.DMessageDlg('�㲻���л����š�', [mbOk]);
          2: FrmDlg.DMessageDlg('�Է������л��Ա��', [mbOk]);
          3: FrmDlg.DMessageDlg('�л����Ų���ɾ���Լ���', [mbOk]);
          4: FrmDlg.DMessageDlg('�Է������л��Ա��', [mbOk]);
        end;
      end;
      SM_GUILDRANKUPDATE_FAIL: begin
        case msg.Recog of
          -2: FrmDlg.DMessageDlg('[ʧ��] �㲻��ɾ���л����š�', [mbOk]);
          -3: FrmDlg.DMessageDlg('[ʧ��] �л�������1���л����š�', [mbOk]);
          -4: FrmDlg.DMessageDlg('[ʧ��] һ���л������2���л����š�', [mbOk]);
          -5: FrmDlg.DMessageDlg('[ʧ��] �㲻����ӻ���ɾ���л��Ա��', [mbOk]);
          -6: FrmDlg.DMessageDlg('[ʧ��] ��û�иı�������', [mbOk]);
          -7: FrmDlg.DMessageDlg('[ʧ��] ��ֻ����0��99֮�����ְλ��', [mbOk]);
        end;
      end;
      SM_GUILDMAKEALLY_OK,
      SM_GUILDMAKEALLY_FAIL: begin
        case msg.Recog of
          -1: FrmDlg.DMessageDlg ('����Ҫ��ԶԷ���', [mbOk]);
          -2: FrmDlg.DMessageDlg ('������Է���������л�ս����', [mbOk]);
          -3: FrmDlg.DMessageDlg ('�������ԶԷ��л����š�', [mbOk]);
          -4: FrmDlg.DMessageDlg ('�Է����������ˡ�', [mbOk]);
        end;
      end;
      SM_GUILDBREAKALLY_OK,
      SM_GUILDBREAKALLY_FAIL: begin
        case msg.Recog of
          -1: FrmDlg.DMessageDlg ('�㲻���л����š�', [mbOk]);
          -2: FrmDlg.DMessageDlg ('��ͶԷ�����ͬ�˹�ϵ��', [mbOk]);
          -3: FrmDlg.DMessageDlg ('�л᲻���ڡ�', [mbOk]);
        end;
      end;
      SM_BUILDGUILD_OK: begin
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.DMessageDlg ('�лᴴ���ɹ���', [mbOk]);
      end;
      SM_BUILDGUILD_FAIL: begin
        FrmDlg.LastestClickTime := GetTickCount;
        case msg.Recog of
          -1: FrmDlg.DMessageDlg('���Ѽ��������лᡣ', [mbOk]);
          -2: FrmDlg.DMessageDlg('�������ò��㡣', [mbOk]);
          -3: FrmDlg.DMessageDlg('����Ҫ����Žǲ��ܴ����лᡣ', [mbOk]);
          else FrmDlg.DMessageDlg('�л�����ֳ��ȱ�����1��16���ַ�֮�䡣', [mbOk]);
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
      // 2003/04/15 ģ��, ����
      SM_MAIL_ALARM: // �ű� �޼��� ����
         begin
            SendMailList;
            ClientGetTagAlarm (msg ,body);
         end;
      SM_MAIL_INFO:  // ���� ����
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

      SM_ME_LIST:  //���� ����
      begin
        ClientGetMEList(msg, body);
      end;
      SM_ME_INFO:  //���� ����
      begin
        ClientGetMEInfoList(msg, body);
      end;

      SM_LM_OPTION:       //���� ����
      begin
        ClientGetLMOptionChange(msg);    //���� ����
      end;
      SM_LM_REQUEST:      //���� ����
      begin
        ClientGetLMRequest(msg, DecodeString (body));    //���� ����
      end;
      SM_LM_LIST:    //���� ����
      begin
        ClientGetLMList(msg, body);
      end;
      SM_LM_RESULT:        //���� ����
      begin
        ClientGetLMREsult(msg, body);   //���� ����
      end;
      SM_LM_DELETE:         //���� ����
      begin
        ClientGetLMDelete(msg, body);   //���� ����
      end;

      SM_LM_DELETE_REQ: begin   //���� ����
        str := DecodeString(body);

          if mrYes = FrmDlg.DMessageDlg('�����'+str+'�����\�����Ҫ֧�� 10���ҵķ��á�',
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

      SM_CHANGESYSTEMOK: Begin  //��ȯ
        FrmDlg.CancelChanging2();
      end;
      SM_CHANGESYSTEM_FAIL: Begin  //��ȯ
        FrmDlg.CancelChanging2();
      end;

      SM_REPAIRITEMOK: begin
        g_boItemMoving := FALSE;
      end;
      SM_WAKELIST: begin //����
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.ClearWakeDlg;

        ClientWakeData(@msg, Body);
      end;
      SM_SHOPITEMLIST: begin //ȯ����
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
      SM_SHOPITEMLIST2 : begin //ȯ����
        FrmDlg.LastestClickTime := GetTickCount;
        FrmDlg.ClearShopDlg;
        g_ShopCurrPage := 1;
        g_ShopAmountofPages := 1;
        FrmDlg.DCategories12.Visible := True;
        FrmDlg.DCategories13.Visible := True;
        ClientGetShopData(Body);
      end;

      SM_GETSHOPITEMS_FAIL:     //ȯ����
        begin
          FrmDlg.LastestClickTime := GetTickCount;
          FrmDlg.ClearShopDlg;
          if msg.Param = 100 then g_ShopCurrSection := g_ShopCurrSection
           else g_ShopCurrSection := msg.Param;
          g_ShopCurrPage := 1;
          g_ShopAmountofPages := 1;
        end;
      SM_GIFTSITEMS: begin    //ȯ����
        ClientGifts(Body);
      end;

      SM_USERMARK: ClientObjGetGuild(@Msg);    //���� ��ũ

      SM_USERMASK: ClientObjGetMask(@Msg,Body);     //����Ż ������

      SM_GETDICE: begin    //�������
         StartDice := False;
         MainDiceimg := 282;
         CurrGame := 1;
         FakeGame := 1;
         MaxGame := msg.Tag + 1;
         SelectDice := 0;
         Succecs := True;
         ClientGetDiceGame(Body);
      end;
      SM_ONAUCTION: begin    //���
      //  g_AucMode := 0;
        FrmDlg.OpenAction;
      end;
      SM_GETDICE_FAIL: FrmDlg.ClearDiceDlg;
      SM_SHOWCHANGEITEM: ClientShowChangeItem;  //��ȯ
      SM_GETDICEITEM: begin
        FrmDlg.DDiceCloseClick(Nil, 0, 0);
      end;
      SM_SENDSNOW: ClientSnow(@Msg, DecodeString(Body));   //����������Ʈ

      SM_SENDSTORE: ClientStore(@Msg);              //���λ���
      SM_DELSTOREITEM: ClientDelStoreItem(Body);       //���λ���
      SM_USERSTOREITEMS: ClientGetSendUserStoreState(Body);   //���λ���
      SM_SENDBUYSTOREITEM_OK: ClientObjBuyStoreItemOK();   //���λ���
      SM_SENDBUYSTOREITEM_FAIL: ClientObjBuyStoreItemFail(@Msg); //���λ���
      SM_SENDSTARTSTORE_OK: ClientObjStartStoreOK(); //���λ���
      SM_SENDSTOPSTORE_OK: ClientObjStopStoreOK();   //���λ���
      SM_SENDSTARTSTORE_FAIL: ClientObjStartStoreFail(); //���λ���

      SM_BLASTHIT: ClientObjBlasthit(@Msg);   //������

      SM_HEROCREATE: ClientHeroCreate(Msg.Recog);   //���� ���
      SM_HEROINFO: ClientGetHeroInfo(@Msg);
      SM_HEROLOGON: ClientObjHeroLogOn(@Msg, Body);
      SM_HEROLOGON_OK: ClientObjHeroLogOnOK(@Msg);

      SM_HEROLOGOUT: ClientObjHeroLogOut(@Msg);
      SM_HEROLOGOUT_OK: ClientObjHeroLogOutOK(Msg.Recog);

      SM_HEROBUFF: ClientHeroBuffSystem(DecodeString(Body), Msg.Tag, Msg.Param, Msg.Series); //����

      SM_HEROABILITY: ClientObjHeroAbility(@Msg, Body);
      SM_HEROSUBABILITY: ClientObjHeroSubAbility(@Msg);
      SM_HEROBAGITEMS: ClientGetHeroBagItmes(@Msg, Body);
      SM_HEROADDITEM: ClientGetHeroAddItem(Body);
      SM_HEROADDITEM2: //��������
         begin
            ClientGetHeroAddItem2 (Body,Msg.Series);
         end;
      SM_HEROBAGITEMS2:    //����
        begin
          FillChar(g_HeroItemArr, SizeOf(TClientItem) * MAXHEROBAGITEM, #0);
        end;

      SM_HEROSTORAGEITEMS:  //��������
        begin
          ClientGetHeroStoreItems (body);
        end;
      SM_HEROSTORAGEITEMS2:  //��������
        begin
          FillChar (g_HeroStoreItem, sizeof(TClientItem)*MAXSTORAGEITEMCL, #0);
        end;
      SM_ADDHEROSTORAGE:   //��������
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

      SM_MASTERBAGTOHEROBAG_OK: ClientObjToHeroBagOK();    //���� > ���� ��������
      SM_MASTERBAGTOHEROBAG_FAIL: ClientObjToHeroBagFail();  //���� > ���� ���� �̵� ����
      SM_HEROBAGTOMASTERBAG_OK: ClientObjToMasterBagOK();  //���� > ���� ��������
      SM_HEROBAGTOMASTERBAG_FAIL: ClientObjToMasterBagFail();  //���� > ���� ���� �̵� ����
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
            if (g_MovingItem.Owner = FrmDlg.DAutoPot1) then begin   //����
              FrmDlg.CancelItemAuto;
              Exit;
            end;
          end;
        end;

      SM_AUTOADDITEM_OK,
      SM_AUTOADDITEM_FAIL: begin
          FrmDlg.LastestClickTime := GetTickCount;
          if msg.Ident <> SM_AUTOADDITEM_OK then begin
            FrmDlg.DMessageDlg ('�޷��Զ�ʹ��ҩˮ��', [mbOk]);
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
                  FrmDlg.DMessageDlg ('Ӣ�۵ı������������ܼ���������Ʒ��', [mbOk])  ;
                  AddItemBag (g_SellDlgItemSellWait);
               end else begin
                  FrmDlg.DMessageDlg ('�㲻�ܷ�����Ʒ��', [mbOk]);
                  AddItemBag (g_SellDlgItemSellWait);
               end;
            end;
            g_SellDlgItemSellWait.S.Name := '';
         end;
      SM_HERO_TAKEBACKSTORAGEITEM_OK,
      SM_HERO_TAKEBACKSTORAGEITEM_FAIL,
      SM_HERO_TAKEBACKSTORAGEITEM_FULLBAG:
         begin
            FrmDlg.LastestClickTime := GetTickCount; //2010-07-06 ���� ����
            if msg.Ident <> SM_HERO_TAKEBACKSTORAGEITEM_OK then begin
               if msg.Ident = SM_HERO_TAKEBACKSTORAGEITEM_FULLBAG then begin
                  mj := g_MovingItem.Index;
                  if mj >= 600 then begin   //����
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('�޷��ҵ���Ʒ��', [mbOk]);
                   Exit;
                 end;
               end else
                 mj := g_MovingItem.Index;
                  if mj >= 600 then begin   //����
                   FrmDlg.CancelItemMoving;
                   FrmDlg.DMessageDlg ('��Ʒ�����ڡ�', [mbOk]);
                   Exit;
                 end;
            end;
            //   FrmDlg.DelStorageItem (msg.Recog); //itemserverindex
         end;

      else begin
        if g_MySelf = nil then exit;     //��δ������Ϸʱ����������

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

procedure TfrmMain.ClientSnow(DefMsg: pTDefaultMessage; body: string);//����������Ʈ
begin
  g_boSnow := DefMsg.param > 0;
  g_nSnowLev := DefMsg.Recog;
  g_boFlower := DefMsg.Series > 0;
  g_boPKZONE := StrToBool(Body);
end;

procedure TfrmMain.ClientStore(DefMsg: pTDefaultMessage); //���λ���
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

procedure TfrmMain.ClientDelStoreItem(body: string);   //���λ���
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

procedure TfrmMain.ClientGetSendUserStoreState(body: string);   //���λ���
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

procedure TfrmMain.ClientObjBuyStoreItemOK(); //���λ���
begin
  g_SelectStoreItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjBuyStoreItemFail(DefMsg: pTDefaultMessage); //���λ���
begin
  case DefMsg.Recog of
    -1: begin
     if DefMsg.tag = 0 then begin
       FrmDlg.DMessageDlg('��Ҳ��㡣', [mbOk]);
     end else begin
       FrmDlg.DMessageDlg('��ȯ���㡣', [mbOk]);
     end;
    end;
    -2: FrmDlg.DMessageDlg('��Ʒ���ִ���', [mbOk]);
    -3: FrmDlg.DMessageDlg('��ı���������', [mbOk]);
    -4: FrmDlg.DMessageDlg('�����޷�ȡ�ؽ�ҡ�', [mbOk]);
    -5: FrmDlg.DMessageDlg('������ʱ�޷�ʹ�����̹��ܡ�', [mbOk]);
    -6: FrmDlg.DMessageDlg('�����޷�ȡ�ص�ȯ��', [mbOk]);
    -7: FrmDlg.DMessageDlg('����Ʒ��ֹ����', [mbOk]);
  else FrmDlg.DMessageDlg('����', [mbOk]);
  end;
end;

procedure TfrmMain.ClientObjStartStoreOK();       //���λ���
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

procedure TfrmMain.ClientObjStartStoreFail();     //���λ���
begin
  g_boStartStoreing := False;
  FrmDlg.EdStoreMsgEdit.Visible := True;
  FrmDlg.EdStoreMacrosEdit.Visible := True;
end;

procedure TfrmMain.ClientObjStopStoreOK();        //���λ���
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
   // FrmDlg.sHintStr := '������ ĳ���Ͱ� �����ϴ�.';
  //  FrmDlg.DBTHintClose.Caption := 'Ȯ ��';
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
      WaitAndPass (500); //0.5��
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
      WaitAndPass (500); //0.5��
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
                     FrmDlg.DMessageDlg ('����ǰID���õ�����Ϊֹ��', [mbOk])
                  else if g_wAvailIDDay <= 3 then
                     FrmDlg.DMessageDlg ('����ǰIP���û�ʣ: ' + IntToStr(g_wAvailIDDay) + ' �졣', [mbOk]);
               end else if g_wAvailIPDay > 0 then begin
                  if g_wAvailIPDay = 1 then
                     FrmDlg.DMessageDlg ('����ǰIP���õ�����Ϊֹ��', [mbOk])
                  else if g_wAvailIPDay <= 3 then
                     FrmDlg.DMessageDlg ('����ǰIP���û�ʣ ' + IntToStr(g_wAvailIPDay) + ' �졣', [mbOk]);
               end else if g_wAvailIPHour > 0 then begin
                  if g_wAvailIPHour <= 100 then
                     FrmDlg.DMessageDlg ('����ǰIP���û�ʣ ' + IntToStr(g_wAvailIPHour) + ' Сʱ��', [mbOk]);
               end else if g_wAvailIDHour > 0 then begin
                  FrmDlg.DMessageDlg ('����ǰID���û�ʣ ' + IntToStr(g_wAvailIDHour) + ' Сʱ��', [mbOk]);;
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
      WaitAndPass (500); //0.5��

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

      WaitAndPass (500); //0.5��
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

      WaitAndPass (500); //0.5��

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

      WaitAndPass (500); //0.5��
      if CSocket.Socket.Connected then
         CSocket.Socket.SendText ('$R' + addr + '/' + sport + '%');

      g_ConnectionStep := cnsPlay;
      ClearBag;
      ClearStore;

      DScreen.ClearChatBoard;

      WaitAndPass (300); //0.5��
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
    DScreen.AddChatBoardString('û�п��õĵ�ͼ��ʾ��', clWhite, clRed);
  if ((g_nMapIndex < 0) and g_boViewMap) then
    Dscreen.AddChatBoardString('û�п��õĵ�ͼ��ʾ��', clWhite, clRed);

  g_boDeathMatch := Msg.Series > 0;  //������ġ
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
    DScreen.AddSysMsg ('<CO$FFFF>' + GetGoldStr(MakeLong(msg.Param,msg.Tag)-g_MySelf.m_nGamePoint) + '<CE> ��Ϸ�㱻���֡�' ,40,60,clSkyBlue);
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
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
            end;
          end;
        end;
      end else begin }
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
            end;
          end;
        end;
     // end;
   end;
end;

procedure TfrmMain.ClientGetAddItem2 (body: string;idx:integer);  //����
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
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '(' + sCount + ')<CE>�� ������ϴ�.',40,60, clWhite);
            end;
          end;
        end;
      end else begin   }
        case idx of
          1: begin
            case cu.S.Grade of
              0, 1 : DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              2: DScreen.AddSysMsg ('<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              3: DScreen.AddSysMsg ('<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
              4: DScreen.AddSysMsg ('<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
            end;
          end;
        end;
    //  end;
   end;
end;

procedure TfrmMain.ClientGetStorageAddItem (body: string;idx:integer);  //����
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddItemStore2 (cu);
   end;
end;

procedure TfrmMain.ClientGetHeroStorageAddItem (body: string;idx:integer);  //����
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
            DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>����� <CO$FFFF>' + sBody + '(' + sCount + ')<CE��', 40, 60, clWhite);
          end else begin
            case Grade of
              0, 1 : DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>����� <CO$FFFF>' + sBody + '<CE>��', 40, 60, clWhite);
              2: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>����� <CO$00FFDF42>' + sBody + '<CE>��', 40, 60, clWhite);
              3: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>����� <CO$000075FF>' + sBody + '<CE>��', 40, 60, clWhite);
              4: DScreen.AddSysMsg('<CO$FFFF00>' + GroupMember.ClientGroup.UserName + '<CE>����� <CO$00FFAADE>' + sBody + '<CE>��', 40, 60, clWhite);
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
      for i:=0 to MAXUSEITEM do begin  //������ ����
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
      for i:=0 to MAXUSEITEM do begin  //������ ����
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
        for i:=0 to MAXUSEITEM do begin     //������ ����
           if (g_UseItems[i].S.Name = cu.S.Name) and (g_UseItems[i].MakeIndex = cu.MakeIndex) then begin
              g_UseItems[i].S.Name := '';
           end;
        end;
      end;
   end;
end;

procedure TfrmMain.ClientGetDelItems (body: string);   //���
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
         DelUpwaItemBag (iname, iindex);    //���
         for i:=0 to MAXUSEITEM do begin       //������ ����
            if (g_UseItems[i].S.Name = iname) and (g_UseItems[i].MakeIndex = iindex) then begin
               g_UseItems[i].S.Name := '';
            end;
         end;
      end else
         break;
   end;
end;


procedure TfrmMain.ClientGetBagItmes (body: string);  //����
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
   Loadbags (CharName + '.itm', @ItemSaveArr);  //��������
   if CompareItemArr then begin
      Move (ItemSaveArr, g_ItemArr, sizeof(TClientItem) * MAXBAGITEMCL);
   end;
   ArrangeItembag;
   g_boBagLoaded := TRUE;     //��������
end;


procedure TfrmMain.ClientGetStoreItems (body: string);      //����
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

procedure TfrmMain.ClientGetHeroStoreItems (body: string);      //����
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

procedure TfrmMain.ClientRentalItems (body: string); //�뿩
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

procedure TfrmMain.ClientOwnerItems (body: string); //�뿩
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


procedure TfrmMain.ClientPetInfo (body: string); //����
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

procedure TfrmMain.ClientAucItems (body: string);    //���
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

procedure TfrmMain.ClientComStorageItems (body: string); //����â��
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

procedure TfrmMain.ClientGuildStorageItems (body: string); //����â��
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

procedure TfrmMain.ClientBBSList (body: string);       //����Խ���
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

procedure TfrmMain.ClientBBSMsg (body: string);      //����Խ���
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


procedure TfrmMain.ClientGetFriendChange(Msg: pTDefaultMessage; body: string);      //���ο�ģ��
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
              DScreen.AddSysMsg('[����]<CO$FFFF> ' + body + '<CE> ��������Ϸ��', 40, 60, clWhite)
            else
              DScreen.AddSysMsg('[����]<CO$FFFF> ' + body + '<CE> �˳�����Ϸ��', 40, 60, clWhite);
            break;
          end;
        end;
      end;
    1: begin     //ģ��â ���ΰ�ħ
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
            DScreen.AddSysMsg('[����]<CO$FFFF> ' + body + '<CE> �ѴӺ����б���ɾ����', 40, 60, $32F4);
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
   FillChar (g_UseItems, sizeof(TClientItem)*MAXUSEITEM+1, #0);  //������ ����

   while TRUE do begin
      if body = '' then break;
      body := GetValidStr3 (body, str, ['/']);
      body := GetValidStr3 (body, data, ['/']);
      index := Str_ToInt (str, -1);
      if index in [0..MAXUSEITEM] then begin     //������ ����
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
   g_MagicList.Clear;        //���� ������� ����
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
   if uidx in [0..MAXUSEITEM] then begin    //������ ����
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

procedure TfrmMain.ClientGetSendGoodsList (merchant, count: integer; body: string); //����
var  //NPC��Ʒһ���б�
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
       pcg.Amount := pc.entItem.Amount;     //����
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

procedure TfrmMain.ClientGetSendMakeItemList (merchant, count: integer; body: string); //����
var  //NPC��Ʒһ���б�
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
       pcg.Amount := pc.entItem.Amount;     //����
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


procedure TfrmMain.ClientGetSendItemLock(merchant: Integer);        //����
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
   FrmDlg.DMessageDlg('��Ҳ��㡣', [mbOk])
  else
  FrmDlg.DMessageDlg('����Ʒ���ܷ�ӡ��', [mbOk]);
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
    FrmDlg.DMessageDlg('��Ҳ��㡣', [mbOk]);
  end else
  FrmDlg.DMessageDlg('����Ʒ�޷�ȡ�����ѡ�', [mbOk]);
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
    FrmDlg.DMessageDlg('��Ҳ��㡣', [mbOk]);
  end else
  FrmDlg.DMessageDlg('����Ʒ���ָܻ���', [mbOk]);
end;

procedure TfrmMain.ClientObjStoragePWFail(DefMsg: pTDefaultMessage);
begin
  if DefMsg.Ident = SM_STORAGEPW_FAIL then begin
    FrmDlg.DMessageDlg('�������', [mbOk]);
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
//������Ʒ���ֿ�
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

procedure TfrmMain.ClientGetSendComStorage (merchant: integer);   //����â��
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmComStorage;
   FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendGuildStorage (merchant: integer);   //����â��
begin
   FrmDlg.CloseDSellDlg;
   g_nCurMerchant := merchant;
   FrmDlg.SpotDlgMode := dmGuildStorage;
   FrmDlg.ShowShopSellDlg;
end;

procedure TfrmMain.ClientGetSendUserDisassemble (merchant: integer);  //��������
begin
   FrmDlg.CloseDisassembleDlg;
   g_nCurMerchant := merchant;
   FrmDlg.ShowDisassembleDlg;
end;

procedure TfrmMain.ClientGetSendUserDismantle (merchant: integer);     //�Ϲݺ���
begin
   FrmDlg.CloseDismantleDlg;
   g_nCurMerchant := merchant;
   FrmDlg.ShowDismantleDlg;
end;



procedure TfrmMain.ClientShowChangeItem;  //��ȯ
begin
  FrmDlg.DItemBag.Visible := True;
  FrmDlg.DItemBag.Top := 0;
  FrmDlg.DItemBag.Left := 0;
  FrmDlg.DChangeItem.Visible := True;
end;


procedure TfrmMain.ClientObjGetGuild(Msg: pTDefaultMessage); //���� ��ũ
var
  Actor: TActor;
begin
  if Msg.Recog = g_MySelf.m_nRecogId then begin
    g_MySelf.m_btGuildMark := Msg.param;
    g_MySelf.m_btColumn := Msg.Tag;       //ȫ����
    g_MySelf.m_btJob := Msg.Series;
   // g_MySelf.FeatureChanged;
  end else begin
    Actor := PlayScene.FindActor(Msg.Recog);
    if (Actor <> nil) and (Actor is THumActor) then begin
      THumActor(Actor).m_btGuildMark := Msg.param;
      THumActor(Actor).m_btColumn := Msg.Tag;  //ȫ����
      THumActor(Actor).m_btJob := Msg.Series;
    //  THumActor(Actor).FeatureChanged;
    end;
  end;
end;

procedure TfrmMain.ClientObjGetMask(Msg: pTDefaultMessage; Eff:string);   //����Ż  ������  ������
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
  DScreen.AddSysMsg('[<CO$FFFF>' + GroupMember.ClientGroup.UserName + '<CE>] �����˶��顣', 40, 60, clWhite);
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
      DScreen.AddSysMsg('[<CO$FFFF>' + GroupMember.ClientGroup.UserName + '<CE>] �˳��˶��顣', 40, 60, clWhite);
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

procedure TfrmMain.ClientGetGroupMembers (Msg: TDefaultMessage; bodystr: string);     //�׷� ü��
resourcestring
  ItemClass1 = ' <CO$F0CAA6>��Ʒ���䷽ʽ<CE> [<CO$FF> ��� <CE>] ::';
  ItemClass2 = ' <CO$F0CAA6>��Ʒ���䷽ʽ<CE> [<CO$FFFF> ���� <CE>] ::';
  Hero1 = ' <CO$FF00>�ٻ�Ӣ��<CE> [<CO$FF> �ջ� <CE>]';
  Hero2 = ' <CO$FF00>�ٻ�Ӣ��<CE> [<CO$FFFF> �ٻ� <CE>]';
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
     memb := '[<CO$FFFF>' + addname + '<CE>] �����˶��顣'
   else
     memb := '���鴴���ɹ���';
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
      if data = '<�лṫ��>' then begin
         FrmDlg.GuildStrs.AddObject (char(7) + '�лṫ��', TObject(clWhite));
         FrmDlg.GuildStrs.Add (' ');
         pstep := 1;
         continue;
      end;
      if data = '<�ж��л�>' then begin
         FrmDlg.GuildStrs.Add (' ');
         FrmDlg.GuildStrs.AddObject (char(7) + '�ж��л�', TObject(clWhite));
         FrmDlg.GuildStrs.Add (' ');
         pstep := 2;
         linestr := '';
         continue;
      end;
      if data = '<�����л�>' then begin
         if linestr <> '' then FrmDlg.GuildStrs.Add (linestr);
         linestr := '';
         FrmDlg.GuildStrs.Add (' ');
         FrmDlg.GuildStrs.AddObject (char(7) + '�����л�', TObject(clWhite));
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

procedure TFrmMain.SendMail (data: string);   //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_ADD, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;

procedure TFrmMain.SendLockMail (Id: integer);     //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 2, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendUnLockMail (Id: integer);      //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 1, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendDelMail (Id: integer);        //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_DELETE, Id, 3, 0, 0);
   SendSocket (EncodeMessage (msg));
end;


procedure TFrmMain.SendReadingMail (Id: integer);  //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_SETINFO, Id, 1, 0, 0);
   SendSocket (EncodeMessage (msg));
end;

procedure TFrmMain.SendMailList;      //�޸�
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_MAIL_LIST, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) );
end;

procedure TFrmMain.SendRejectList;           //�ź���
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_LIST, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) );
end;

procedure TFrmMain.SendAddReject (data: string );   //�ź��� ���
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_ADD, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;

procedure TFrmMain.SendDelReject (data: string);  //�ź��� ����
var
   msg: TDefaultMessage;
begin
   msg := MakeDefaultMsg (CM_REJECT_DELETE, 0, 0, 0, 0);
   SendSocket (EncodeMessage (msg) + EncodeString (data));
end;


procedure TFrmMain.RunEffectTimerTimer(Sender: TObject);    //�������
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



procedure TfrmMain.ClientGetDealRemoteAddItem (body: string);        //�ŷ�
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      AddDealRemoteItem (ci);
   end;
end;

procedure TfrmMain.ClientGetDealRemoteDelItem (body: string);       //�ŷ�
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      DelDealRemoteItem (ci);
   end;
end;


procedure TfrmMain.ClientGetRentalRemoteAddItem (body: string);        //�뿩
var
   ci: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @ci, sizeof(TClientItem));
      AddRentalRemoteItem (ci);
   end;
end;

procedure TfrmMain.ClientGetRentalRemoteDelItem (body: string);       //�뿩
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
          DScreen.AddChatBoardString ('���յ���һ�����ʼ�����ע����ա�', clWhite, clRed);
          MailAlarm := true;
     end;

end;
procedure TFrmMain.ClientGetTagInfo (msg :TDefaultMessage);    //�޸�
var
   i           : integer;
   Status, Id  : integer;
begin
   Id := Msg.Recog;
   Status  := msg.Param;

   for i := 0 to MailLists.Count - 1 do begin
    if PNMailItem(MailLists[i]).Id = Id then begin
         // �����ΰ�쿡�� ��������
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

procedure TfrmMain.ClientObjBlasthit(DefMsg: pTDefaultMessage); //������
var
  Actor: TActor;
begin
  Actor := PlayScene.FindActor(DefMsg.Recog);
  if Actor <> nil then begin
    Actor.SendMsg(DefMsg.ident, DefMsg.Recog, DefMsg.param {x}, DefMsg.tag {y}, Actor.m_btDir, 0, '', 0);
  end;
end;

procedure TfrmMain.ClientGetSendGuildGrow (body: string);    //���ļ���
var
   GuildGrow: TGuildGrowUp;
begin
   DecodeBuffer (body, @GuildGrow, SizeOf(TGuildGrowUp));
   FrmDlg.OpenGuildGrow(GuildGrow);
end;
procedure TfrmMain.ClientGetSendGuildGrow2 (body: string);    //���ļ���
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
      1: FrmDlg.DMessageDlg ('�㲻������Լ�Ϊ���ѡ�',[mbOk]);
      2: FrmDlg.DMessageDlg (str + ' �Ѿ�����ĺ����ˡ�',[mbOk]);
      3: FrmDlg.DMessageDlg (str + ' �����ڡ�',[mbOk]);
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

      NE_CHUNMU{184}: begin    //õ��
         Effect := THumanEffects.Create(effx, effy, g_WMagic3Images, 130, 10, 100, TRUE);
         PlaySound(10730);
      end;
      NE_STRUCKCHUNMU{185}: begin  //õ���ݰ�
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic3Images,
                                       140, //���� ��ġ
                                       3,   //������
                                       80,   //������
                                       True);
         PlaySound(10735);
      end;

      NE_KINGSTONE_RECALL_1{100}: begin//���õ�� ��ȯ, ���õ�ֿ��Կ� �ѷ���
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1370, //���� ��ġ
                                       10,   //������
                                       110,  //������
                                       True);
         PlaySound (2579);
      end;
      NE_KINGSTONE_RECALL_2{101}: begin//���õ�� ��ȯ, ĳ������ �ѷ���
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1390, //���� ��ġ
                                       10,   //������
                                       110,  //������
                                       True);
         PlaySound (10062);
      end;
      NE_KINGTURTLE_MOBSHOW{106}: begin    //����
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[24],
                                       3080, //���� ��ġ
                                       10,   //������
                                       90,   //������
                                       True);
         PlaySound (110);
      end;
      NE_OMAKING{107}: begin    //��Ȳ����
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[21],
                                       3520, //���� ��ġ
                                       30,   //������
                                       100,   //������
                                       True);
         PlaySound (2396);
      end;
      NE_POISONFOG{102}: begin//�̹��� ���Ȱ� ����Ʈ //####
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1280, //���� ��ġ
                                       10,   //������
                                       100,  //������
                                       True);
         PlaySound (2446);//8102
      end;
      NE_SN_MOVEHIDE{103}: begin//�̹��� ���� �����������Ʈ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1300, //���� ��ġ
                                       10,   //������
                                       80,   //������
                                       True);
         PlaySound (2447);//8103
      end;
      NE_SN_MOVESHOW{104}: begin//�̹��� ���� ��Ÿ��������Ʈ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1310, //���� ��ġ
                                       10,   //������
                                       80,   //������
                                       True);
         PlaySound (2447);//8103
      end;
      NE_SN_RELIVE{105}: begin//�̹��� ��Ȱ ����Ʈ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       1330, //���� ��ġ
                                       10,   //������
                                       100,  //������
                                       True);
         PlaySound (2448);//8104
      end;

      NE_FOX_MOVESHOW{109}: begin//���������� ��Ÿ���� ����Ʈ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[23],
                                       810,  //���� ��ġ
                                       10,   //������
                                       90,   //������
                                       True);
         PlaySound (110);
      end;
      NE_ICEKING1: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[43],
                                       1310,  //���� ��ġ
                                       10,   //������
                                       90,   //������
                                       True);
      end;
      NE_ICEKING2: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[43],
                                       1320,  //���� ��ġ
                                       10,   //������
                                       90,   //������
                                       True);
      end;

      NE_SOULSTONE_HIT{111}: begin//ȣȥ�� ���� ����Ʈ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[23],
                                       1410, //���� ��ġ
                                       10,   //������
                                       120,  //������
                                       True);
         PlaySound (157);//(442);
      end;

      NE_GOLD_MOVESHOW{110}: begin//ȯ�� ��ȣ�͸� ��ȯ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[30],
                                       4601,  //���� ��ġ
                                       6,   //������
                                       90,   //������
                                       True);
         PlaySound2 (s_Skeleton);
      end;

      NE_SURA{82}: begin//����õ����
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic0Images,
                                       1050,  //���� ��ġ
                                       20,   //������
                                       100,  //������
                                       True);
         PlaySound2 (as_140);
      end;

      NE_FIRECIRCLE{112}: begin// ȭ��⿰
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic2Images,
                                       910,  //���� ��ġ
                                       23,   //������
                                       100,  //������
                                       True);
         PlaySound (10450);
      end;

      NE_THUNDER{114}: begin    //����� ����        //�������
         PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);    //�������
         PlaySound (8301);
      end;
      NE_FIRE{115}: begin         //����� ���       //�������
         PlayScene.NewMagic (nil, MAGIC_DUN_FIRE1, MAGIC_DUN_FIRE1, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);   //�������
         PlayScene.NewMagic (nil, MAGIC_DUN_FIRE2, MAGIC_DUN_FIRE2, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);
         PlaySound (8302);
      end;

      NE_USERHEALING{116}: begin //NPC ����
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicImages,
                                       370,  //���� ��ġ
                                       10,   //������
                                       100,  //������
                                       True);
         PlaySound (10022);
      end;


      NE_FIRECIRCLEUP{133}: begin// ȭ��⿰ ��ȭ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicUpImages,
                                       630,  //���� ��ġ
                                       37,   //������
                                       100,  //������
                                       True);
         PlaySound (10450);
      end;
      NE_ICECIRCLE{136}: begin// ������
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       1910,  //���� ��ġ
                                       20,   //������
                                       100,  //������
                                       True);
         PlaySound2 (s_Super);
      end;
      NE_THUNDERCIRCLE{138}: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       3290,  //���� ��ġ
                                       25,   //������
                                       150,  //������
                                       True);
         PlaySound2 (s_THUNDERCIRCLE);
      end;
      NE_THUNDERCIRCLE2{139}: begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       3290,  //���� ��ġ
                                       25,   //������
                                       150,  //������
                                       True);
      end;
      NE_KYO{140}:begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       2850,  //���� ��ġ
                                       15,   //������
                                       150,  //������
                                       True);
         PlaySound2 (s_Kyo);
      end;
      NE_SINGI{141}:begin
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagicNewImages,
                                       915,  //���� ��ġ
                                       10,   //������
                                       150,  //������
                                       True);
         PlaySound2 (s_Singi);
      end;

      NE_THUNDER2{142}: begin    //����� ����        //�������
         PlayScene.NewMagic (nil, MAGIC_DUN_THUNDER2, MAGIC_DUN_THUNDER2, effx, effy, effx, effy, 0, mtThunder, FALSE, 30, bofly);    //�������
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
      NE_JUCJSAL{252}: begin// õ������ǳ
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic_BonzeImages,
                                       1510,  //���� ��ġ
                                       41,   //������
                                       100,  //������
                                       True);
         PlaySound2(MB_126_2);
      end;
      NE_FAHANGBO{253}: begin// ��Ȳ��
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMagic_BonzeImages,
                                       1800,  //���� ��ġ
                                       10,   //������
                                       100,  //������
                                       True);
         PlaySound2(MB_128_2);
      end;

      NE_BEAR_LIGHITING: begin//�� ����Ʈ�� ����
         Effect := TNormalDrawEffect.Create (effx, effy,
                                       g_WMonImagesArr[41],
                                       2830,  //���� ��ġ
                                       10,   //������
                                       120,  //������
                                       True);
      end;

   end;
   if Effect <> nil then begin
      Effect.MagOwner := g_Myself;  //�� ��������
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
    11: begin //ûǳ���
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicUpImages,1180,16,100,TRUE);
      PlaySound2(MWindMoon);
    end;
    12: begin //������ ����Ʈ ��
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1180,16,100,TRUE);
      PlaySound(156);
    end;
    13: begin      //������
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1090,10,50,TRUE);
      PlaySound(10485);
    end;
    14: begin //��������
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicUpImages,1200,16,100,TRUE);
      PlaySound2(MWindMoon);
    end;
    15: begin //��������
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,165,10,70,TRUE);
    end;
    16: begin // �һ�
      Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1220,20,115,TRUE);
      PlaySound(10543);
    end;
    17: begin //� ����Ʈ ��
     Effect:=TObjectEffects.Create(ObjectID,g_WEffectImg,760,94,100,TRUE);
     PlaySound2(s_HumUp);
    end;
    18: begin //���ʽ� ����Ʈ��
     Effect:=TObjectEffects.Create(ObjectID,g_WMagic2Images,1330,10,100,TRUE);
     PlaySound(2442);
    end;
    19: begin //� ���� ������
     Effect:=TObjectEffects.Create(ObjectID,g_WEffectImg,960,17,100,TRUE);
     PlaySound(197);
    end;
    20: begin     //������
      Effect:=TObjectEffects.Create(ObjectID,g_WMagicNewImages,1830,10,50,TRUE);
      PlaySound(8103);
    end;
    21: begin     //�ݰ�����
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

    NE_CLONESHOW: begin  //�н�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,670,10,150,TRUE);
    end;
    NE_CLONEHIDE: begin  //�н�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,690,10,150,TRUE);
      PlaySound (48);
    end;
    4: begin //������ ����Ʈ ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WEffectImg,610,10,100,TRUE);
      PlaySound(158);
    end;
    5: begin   //�����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,3760,6,150,TRUE);
      PlaySound(10765);
    end;
    8: begin   //�ַ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,210,6,120,TRUE);
    end;

    9: begin   //�ַ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,380,5,150,TRUE);
    end;
    10: begin //����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicImages,1600,10,30,TRUE);
      PlaySound (s_spacemove_in);
    end;

    11,12,13,14,15,16,17,18,19,20,21: begin //���
    end;



    22: begin   //�ŵ�����
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
    28: begin   //����˹�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1940,4,150,TRUE);
      PlaySound(10595);
    end;
    NE_MANAEATERS{29}: begin   //���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,2420,10,150,TRUE);
      PlaySound(10676);
    end;
    NE_SPIDERBOSS{30}: begin
      g_MySelf.m_dwSpiderMove  := GetTickCount;   //��������
      if g_MyHero <> nil then
        g_MyHero.m_dwSpiderMove := GetTickCount;
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtGumizul2,False,30,boFly);
      PlaySound(2779);
    end;
    NE_HEMORRHAGE{31}: begin   //��ǳ��
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 0 + (10 * Dir), 10, 150, TRUE);
      PlaySound(10765);
    end;
    NE_TICKHEMORRHAGE{32}: begin   //��ǳ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,60,10,100,TRUE);
      PlaySound(s_struck_body_longstick);
    end;
    NE_DARKCLONEHIDE{33}: begin   //��ȭ��
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic2Images, 2600, 10, 150, TRUE);
      PlaySound(10715);
    end;

    NE_BONZECLONE{251}: begin   //������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic_BonzeImages, 1170, 10, 100, TRUE);
      PlaySound2(MB_121_1);
    end;

    34: begin //õ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,140,2,100,TRUE);
    end;
    35: begin   //����  �Ź���
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[25],2980,10,100,TRUE);
      PlaySound(2779);
    end;
    36: begin   //ȣȥ�� ������Ʈ
      Effect:=THumanEffects.Create(nX,nY,g_WMonImagesArr[23],1410,10,100,TRUE);
      PlaySound(2530);
    end;
    37: begin   //���λ� ���ɺ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4240,20,100,TRUE);
      PlaySound(2797);
    end;
    38: begin   //���λ� õ���ȯ
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtIceShower,False,400,boFly);
      PlaySound (10523);
    end;
    39: begin //��Ͽ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,180,10,150,TRUE);
      PlaySound(10062);
    end;
    40: begin   //������ õ�󳫿�
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtFireShower,False,400,boFly);
      PlaySound (10533);
    end;
    41: begin        //���α� ����
    PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtHellThunder,False,80,boFly);
    end;
    42: begin     //�θ�� ��õȭ
    Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[27],3160,10,100,TRUE);
    PlaySound (2979);
    end;
    43: begin     //�θ�� ��õȭ
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
    NE_MANAEATERT{47}: begin   //���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,2400,10,150,TRUE);
      PlaySound(10675);
    end;
    48: begin   //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WEffectImg,580,10,100,TRUE);
      PlaySound2(s_armoreffect);
    end;
    49: begin   //������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1600,10,300,TRUE);
      PlaySound(10532);
    end;

    50: begin   //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],4610,6,120,TRUE);
      PlaySound (10392);
    end;

    51: begin //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[29],6880,10,120,TRUE);
      PlaySound(2527);
    end;

    52:begin    //���λ� �쵶����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4280,10,120,TRUE);
      PlaySound (2799);
    end;
    53:begin
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,140,2,150,TRUE);
      PlaySound(10735);
    end;
    NE_ILSUM{54}: begin    //�ϼ�
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic2Images, 1700 + (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
    end;
    NE_UPILSUM{55}: begin    //�ϼ���ȭ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagicUpImages, 300 + (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
    end;
    NE_MAILSUM{56}: begin    //��������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, (10 * Dir), 10, 80, TRUE);
      PlaySound (10566);
      PlaySound2 (as_130);
    end;
    NE_HWECHUN_1{57}: begin    //ȸõ��
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 720, 31, 75, TRUE);
      PlaySound2 (as_132_2);
    end;
    NE_HWECHUN_2{58}: begin    //ȸõ��
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 751, 39, 75, TRUE);
      PlaySound2 (as_132_3);
    end;
    62:begin  //�ϰݺ�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,880,6,100,TRUE);
      PlaySound(8204);
    end;
    63:begin  //�ϰݺ�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,870,5,100,TRUE);
      PlaySound2(s_effect);
    end;
    64: begin       //������ ����
      g_MySelf.m_dwSpiderMove  := GetTickCount;   //��������
      if g_MyHero <> nil then g_MyHero.m_dwSpiderMove := GetTickCount;
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],3760,10,120,TRUE);
      PlaySound(2787);
    end;
    65: begin    //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],4620,5,120,TRUE);
      PlaySound(3268);
    end;
    66: begin //�����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],2380,12,120,FALSE);
    end;

    67: begin //���ϼ� ��ü����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3360,13,120,TRUE);   //üũ�غ���
      PlaySound(3856);
    end;
    68: begin //���ϼ� 5x5
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3380,10,120,FALSE);
      PlaySound(3849);
    end;
    69: begin //���ϼ� 8x8
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3440,15,120,FALSE);   //üũ�غ���
      PlaySound(3859);
    end;
    70: begin //���ϼ� ������ �ھƳ�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],3480,15,120,FALSE);   //üũ�غ���
      PlaySound(3849);
    end;
    71: begin //������ ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4330,5,200,TRUE);
    end;

    72:begin    //���λ� ��ȭ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[25],4260,10,120,TRUE);
      PlaySound (2799);
    end;
    73:begin    //����ȣ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],7090,10,120,FALSE);
    end;
    74: begin   //�������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,350,7,120,TRUE);
    end;
    75: begin   //õȭ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,330,10,100,TRUE);
    end;

    NE_THUNDERHAGE{76}: begin   //��ȣ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic_BonzeImages,630,10,100,TRUE);
      PlaySound2(Thunder_Struck);
    end;
    77: begin    //õ������
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpFirerave,False,400,boFly);
      PlaySound2 (as_134_3);
      PlaySound (10533);
    end;
    NE_THUNDERDOWN{78}: begin    //��õ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic0Images,1120,39,50,TRUE);
      PlaySound (1923);
      PlaySound (8301);
    end;

    79: begin   //õ��
      PlaySound2 (as_138_4);
    end;
    NE_DRAGON_1{80}:begin //�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 980, 12, 80, FALSE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1000, 12, 80, TRUE);
      PlaySound2 (as_139_1);
    end;
    NE_DRAGON_2{81}:begin //�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1020, 10, 80, TRUE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1030, 10, 80, FALSE);
      Effect3 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1040, 10, 80, TRUE);
    end;

    NE_DRAGON_3{128}:begin //�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1020, 10, 80, TRUE);
      Effect2 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1030, 10, 80, FALSE);
      Effect3 := TNormalDrawEffect.Create(nX, nY, g_WMagic0Images, 1040, 10, 80, TRUE);
      PlaySound2 (as_139_3);
    end;

    83:begin    //����ȣ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],7080,10,120,FALSE);
    end;
    84:begin    //�θ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],3160,10,120,TRUE);
    end;
    85:begin    //����  ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4620,5,120,TRUE);
    end;
    86:begin    //����  ��� ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4630,10,120,TRUE);
      PlaySound(769);
    end;
    87:begin    //����  ��ȯ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4720,10,120,TRUE);
      PlaySound(767);
    end;
    88:begin    //����  ��ü �հ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4750,10,120,FALSE);
      PlaySound(766);
    end;
    89:begin    //���� ��ü ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[5],4740,10,120,TRUE);
      PlaySound(768);
    end;
    90: begin //���籪��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[33],5680,12,120,FALSE);
    end;
    91: begin //���籪��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[33],5720,8,120,FALSE);
      PlaySound2 (shamancat_att3);
    end;
    92: begin //�����屺
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[34],1580,10,120,TRUE);
    end;
    93: begin //�����屺
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[34],1590,8,120,TRUE);
    end;
    94: begin //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],3520,12,120,FALSE);
    end;
    95: begin //��������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[30],3540,10,120,FALSE);
    end;
    96:begin    //����� ������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[35],2760,20,80,FALSE);
      PlaySound(3738);
    end;
    97: begin     //�����ȣ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[23],800,10,90,TRUE);
      PlaySound (109);
    end;
    98: begin  //���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[32],430,7,120,TRUE);
    end;
    99: begin       //����������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic2Images,1920,4,120,False);
      PlaySound(9204);
    end;
    100..116: ;

    117: begin    //������ �� �Ȱ�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4510,21,120,TRUE);
    end;
    118: begin    //������ ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[36],4540,30,120,TRUE);
      PlaySound(3869);
    end;

    119: begin   //gm �̺�Ʈ ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,2140,20,120,TRUE);
      PlaySound2(super);
    end;

    120: begin   //�ݰ��ұ�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,550,20,120,TRUE);
      PlaySound(10815);
    end;
    121: begin   //�ڼ�ǳ
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,590,10,120,TRUE);
      PlaySound(10825);
    end;
    122: begin   //��������� - ��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,650,10,120,TRUE);
      PlaySound(10022);
    end;
    123: begin   //��������� - ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,660,10,120,TRUE);
    end;
    124: begin   //������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagic3Images,680,34,100,TRUE);
      PlaySound(10845);
    end;
    125: begin      //���������� ���
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1139,1,2000,FALSE);
    end;
    126: begin      //���������� ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1140,1,2000,FALSE);
    end;
    127: begin      //���������� �̱�
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMain2Images,1141,1,2000,FALSE);
    end;
    NE_CLOUD{129}: begin  //�ϵ�����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,3720,23,100,True);
      PlaySound2 (m_109_2);
    end;

    133: ;
    134: begin   //õ���ȯ ��ȭ
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpIceShower,False,400,boFly);
      PlaySound (10523);
    end;
    135: begin   //õ�󳫿� ��ȭ
      PlayScene.NewMagic (nil,80,80,nx,ny,nx,ny,0,mtUpFireShower,False,400,boFly);
      PlaySound (10533);
    end;
    136: ;
    137: begin   //������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMagicNewImages,1730,10,100,TRUE);
      PlaySound(4159);
    end;
    138,139,140: ;


    144: begin      //���� ������
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[41],5650,10,120,TRUE);
      PlaySound(4347);
    end;

    146: begin      //��ǳ����
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[40],8740,17,120,TRUE);
      PlaySound2(THUNDERCIRCLE);
    end;
    147: begin      //���漱��
      Effect:=TNormalDrawEffect.Create(nX,nY,g_WMonImagesArr[37],5980,13,120,TRUE);
      PlaySound(3856);
    end;
    148: begin  //���� ����
      Effect:=TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[41], 6030 + (10 * Dir), 3, 40, FALSE);
    end;
    149: begin //���� ����
      Effect:=TNormalDrawEffect.Create(nX,nY, g_WMonImagesArr[41],5750,10,80,TRUE);
      PlaySound(4349);
    end;

    NE_GUKDEA: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 4882 + (10 * Dir), 6, 85 - (g_MySelf.m_nHitSpeed div 2), TRUE);
    end;

    NE_GoStop1: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3662 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop2: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3672 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop3: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3682 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop4: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3692 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop5: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3702 + (60 * Dir), 8, 100, TRUE);
    end;
    NE_GoStop: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3490, 10, 150, False);
    end;

    NE_GoStop6: begin    //����Ż
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMagic3Images, 3510 + (30 * Dir), 16, 150, False);
    end;

    NE_OMAJESA : begin    //����������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3420, 11, 120, TRUE);
      PlaySound(3948);
    end;
    NE_GUSLE1  : begin    //��������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3550, 10, 120, TRUE);
    end;
    NE_GSLE2S  : begin    //ȸ������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3690, 10, 120, TRUE);
    end;
    NE_GUUSLE3T  : begin    //���ݷ±���
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 3820, 10, 120, TRUE);
    end;

    NE_OMADRAKKINH : begin    //�������
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[37], 5890 + (10 * Dir), 10, 120, TRUE);
      PlaySound(3987);//�������
    end;
    NE_NOSEMONKEY1: begin    //���ڿ�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 630, 10, 120, TRUE);
      PlaySound(4026);
    end;
    NE_NOSEMONKEY2: begin    //���ڿ�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 640, 10, 120, TRUE);
    end;
    NE_GUJANGWHA:  begin    //����ȭ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[38], 1980, 10, 120, False);
    end;
    NE_GHOSTFIRE:  begin    //ȥ��
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 2800, 10, 120, TRUE);
    end;
    NE_DARK_RECALL:  begin    //���漱�� ��ȯ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 4540, 10, 120, TRUE);
      PlaySound(4159);
    end;
    NE_BIG_SNAKE:  begin    //���
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[39], 6610, 10, 120, TRUE);
    end;
    NE_JUMAWIZARD:  begin    //�ָ�����
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 1120, 10, 120, False);
    end;
    NE_JUMAWIND:  begin    //�ָ�ǳ�û�
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 2760, 10, 120, TRUE);
    end;
    NE_SANDWIND :  begin    //����ǳ
      Effect := TNormalDrawEffect.Create(nX, nY, g_WMonImagesArr[40], 6190, 10, 120, TRUE);
    end;
    NE_ICEDEVIL :  begin    //�Ǳ� ����
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;

function TfrmMain.GetWStateWarrManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ��������(��)
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

function TfrmMain.GetWStateWarrManImg(Idx: Integer): TDirectDrawSurface;       //����â ��������(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;


function TfrmMain.GetWStateWarrWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ��������(��)
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

function TfrmMain.GetWStateWarrWoImg(Idx: Integer): TDirectDrawSurface;       //����â ��������(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;



function TfrmMain.GetWStateWizManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ȫ������(��)
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

function TfrmMain.GetWStateWizManImg(Idx: Integer): TDirectDrawSurface;       //����â ȫ������(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;


function TfrmMain.GetWStateWizWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ȫ������(��)
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

function TfrmMain.GetWStateWizWoImg(Idx: Integer): TDirectDrawSurface;       //����â ȫ������(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;



function TfrmMain.GetWStateMonkManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â �ͼ�����(��)
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

function TfrmMain.GetWStateMonkManImg(Idx: Integer): TDirectDrawSurface;       //����â �ͼ�����(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;


function TfrmMain.GetWStateMonkWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â �ͼ�����(��)
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

function TfrmMain.GetWStateMonkWoImg(Idx: Integer): TDirectDrawSurface;       //����â �ͼ�����(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;


function TfrmMain.GetWStateAssManImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ���ڰ�(��)
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

function TfrmMain.GetWStateAssManImg(Idx: Integer): TDirectDrawSurface;       //����â ���ڰ�(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;


function TfrmMain.GetWStateAssWoImg(Idx:Integer;var ax,ay:integer): TDirectDrawSurface; //����â ���ڰ�(��)
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

function TfrmMain.GetWStateAssWoImg(Idx: Integer): TDirectDrawSurface;       //����â ���ڰ�(��) overload
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
      Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
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
    Result:=WMImage.Images[Idx - FileIdx * 10000]; //ȡ��Ʒ����IDXλ��
  end;
end;

function TfrmMain.GetWWeapon_CommonImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;   //�����
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';           //� ����
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //�Ϲ� ����1
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

  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //�Ϲ� ����1
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';          //���ô�
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';     //� ���ô�
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //�ڰ� ������
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';       //�ڰ� ����
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

function TfrmMain.GetWWeapon_WarrImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //��������
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';         //��������
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

function TfrmMain.GetWWeapon_WizImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;   //ȫ������
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';         //ȫ������
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

function TfrmMain.GetWWeapon_MonkImg(Weapon,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface;  //�ͼ�����
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //�ͼ�����
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';    //���ڰ�  ������
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
  FileName:=WeaponImageDir + IntToStr(FileIdx) + '.wil';       //���ڰ� ����
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //�Ϲ� ��1
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //�Ϲ� ��2
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //�Ϲ� ��2
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //�Ϲ� ��2
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';   //�Ϲ� ��2
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //� �����
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
begin      //�ڰ�
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';     //�ڰ� ��1
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
begin      //�ڰ�
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';        //�ڰ� ��2
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
begin      //�ڰ�
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';        //�ڰ� ��2
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

function TfrmMain.GetWHumUp_WarrImg(Dress,m_btSex,m_btJob,nFrame:Integer;var ax,ay:integer): TDirectDrawSurface; //��������
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //���� ��
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
begin      //ȫ������
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //ȫ�� ��
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
begin      //�ͼ�����
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';    //�ͼ� ��
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
begin      //���ڰ�
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

  FileName:=HumImageDir + IntToStr(FileIdx) + '.wil';       //�� ��
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
          sMsg := '��' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '��' + #7 + UserName + #7 + ': ' + sTemp;
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
          sMsg := '��' + #7 + UserName + #7 + ':' + sTemp
        else
          sMsg := '��' + #7 + UserName + #7 + ': ' + sTemp;
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

  FrmDlg.DMessageDlg ('[' + g_ItemWakeUpDlgItem.S.Name + ']�� [' + g_ItemWakeUpList.Strings[FrmDlg.g_WakeUpItem] +
                       '] (' + IntToStr(g_ItemWakeUpDlgItem.S.btValue[18] - 1) + '�׶�)���ѵ� (' +
                       IntToStr(g_ItemWakeUpDlgItem.S.btValue[18]) + '�׶�)�ɹ��ˡ�\ף����!' ,[mbOk]);
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
        FrmDlg.DMessageDlg ('�����Ʒ���ܾ��ѡ�',[mbOk]);
      end;
    -1: begin
        m_boWakeUp := False;
        FrmDlg.DMessageDlg ('[' + g_ItemWakeUpDlgItem.S.Name + ']' + ' ����ʧ�ܣ������ˡ�', [mbOk]);
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
        FrmDlg.DMessageDlg ('���ܼ��������ˡ�',[mbOk]);
      end;
    -3: begin
        m_boWakeUp := False;
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('��Ҳ��㡣', [mbOk]);
      end;
    -4: begin
        m_boWakeUp := False;
        FrmDlg.DItemWakeUpDlg.Visible := True;
        FrmDlg.DItemBag.Visible := True;
        FrmDlg.DMessageDlg ('���ϲ��㡣', [mbOk]);
      end;
  end;
end;


procedure TFrmMain.ClientGetMEList(msg: TDefaultMessage; body: string);    //���� ����
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



procedure TFrmMain.ClientGetMEInfoList(msg: TDefaultMessage; body: string);    //���� ����
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
    0: FrmDlg.DMessageDlg('��սʧ�ܡ�\��ս��˫�����������վ�š�', [mbOk]);
    -1: FrmDlg.DMessageDlg('������ս��δ�����ܡ�', [mbOk]);
    -2: FrmDlg.DMessageDlg('��ս�����ѳ������ơ�', [mbOk]);
  else FrmDlg.DMessageDlg('��ս����ʧ�ܡ�', [mbOk]);
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

procedure TFrmMain.ClientGetLMList(msg: TDefaultMessage; body: string);    //���� ����
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

procedure TFrmMain.ClientGetLMOptionChange(msg: TDefaultMessage);          //���� ����
var
  optiontype, enable: integer;
begin
  optiontype := msg.Param;
  enable     := msg.Tag;
  case optiontype of
    1: begin  //����
      fLover.SetEnable(rsState_Lover, enable);
      if enable = 1 then
        DScreen.AddChatBoardString('�������', clRed, clWhite)
      else
        DScreen.AddChatBoardString('�ܾ����',
          clRed, clWhite);
    end;
    2: begin  //����
      fMentor.SetEnable(rsState_Master, enable);
    end;
  end;
end;

procedure TFrmMain.ClientGetLMRequest(msg: TDefaultMessage; body: string);   //���� ����
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
          if mrYes = FrmDlg.DMessageDlg(str2+'����˽�������\���Ļ������Ҫ֧��10���ҵķ��á�\���Ƿ�ͬ���飿',
            [mbYes, mbNo]) then
            SendLMRequest(ReqType, RsReq_AloowJoin)
          else
            SendLMRequest(ReqType, RsReq_DenyJoin);
        end;
      end;
    end;

    RsState_Master: begin  //���� ����
      case ReqSeq of
        RsReq_WhoWantJoin: begin
          if mrYes = FrmDlg.DMessageDlg(str2+'��Ҫ����Ϊʦ�����Ƿ�ͬ�⣿',
            [mbYes, mbNo]) then
            SendMERequest(ReqType, RsReq_AloowJoin, 1, str2)
          else
            SendMERequest(ReqType, RsReq_DenyJoin, 1, str2);
        end;
      end;
    end;

  end;
end;

procedure TFrmMain.ClientGetLMResult(msg: TDefaultMessage; body: string);      //���� ����
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
         RsError_DontJoin       ://= 3;         // ������ �� ����
            FrmDlg.DMessageDlg (str+'�Ƿ�ͬ����?', [mbOK]);
        RsError_DontLeave      ://= 4;         // ������ ����.
            FrmDlg.DMessageDlg (str+'������顣', [mbOK]);
        RsError_RejectMe       ://= 5;         // �źλ����̴�
            FrmDlg.DMessageDlg ('�����ڲ�ͬ���顣\������ϵ�����������鰴ť��', [mbOK]);
        RsError_RejectOther    ://= 6;         // �źλ����̴�
            FrmDlg.DMessageDlg (str+'��������顣', [mbOK]);
        RsError_LessLevelMe    ://= 7;         // ���Ƿ����� ����
            FrmDlg.DMessageDlg ('ֻ�еȼ�����22�����ϲſ��Խ�顣', [mbOK]);
        RsError_LessLevelOther ://= 8;         // �����Ƿ����� ����
            FrmDlg.DMessageDlg (str+'�ĵȼ�û��22����', [mbOK]);
        RsError_EqualSex       ://= 9;         // ������ ����
            FrmDlg.DMessageDlg ('ͬ��֮�䲻�ܽ�顣', [mbOK]);
        RsError_FullUser       ://= 10;        // �����ο��� ����á��
            FrmDlg.DMessageDlg (str+'�Ѿ�����ˣ�����ͬʱ�������˽�顣', [mbOK]);
        RsError_CancelJoin     ://= 11;        // �������
            DScreen.AddChatBoardString ('���Ѿ�ȡ������顣',clGreen,clWhite);
        RsError_DenyJoin       ://= 12;        // ������ ������
            FrmDlg.DMessageDlg (str+'�ܾ��������顣', [mbOK]);
        RsError_DontDelete     ://= 13;        // Ż���ų�� ����.
            FrmDlg.DMessageDlg (str+'������顣', [mbOK]);
        RsError_SuccessDelete  ://= 14;        // Ż�������
            begin
                PlaySound(155);
               FrmDlg.DMessageDlg (str+'��������ˡ�', [mbOK]);
            end;
        RsError_NotRelationShip://= 15;        // �������°� �ƴϴ�.
            FrmDlg.DMessageDlg ('��������顣', [mbOK]);
      end;
    end;


    RsState_Master: begin    //���� ����
      case errcode of
        Error_SuccessJoin://= 1;
            FrmDlg.DMessageDlg (str+'��ͽ�ɹ���', [mbOK]);
        Error_SuccessJoined://= 2;
            FrmDlg.DMessageDlg (str+'��ʦ�ɹ���', [mbOK]);
        Error_DontJoin       ://= 3;         // ������ �� ����
            FrmDlg.DMessageDlg (str+'�ܾ����������', [mbOK]);
        Error_FullUserOther  ://= 4;        // �����ο��� ����á��
            FrmDlg.DMessageDlg ('�Է��Ѿ���ͽ���ˡ�', [mbOK]);
        Error_RejectOther    ://= 5;         // �źλ����̴�
            FrmDlg.DMessageDlg ('���Ѿ���ʦ���ˡ���', [mbOK]);
        Error_HighLevelMe    ://= 6;         // ���Ƿ����� ����
            FrmDlg.DMessageDlg ('�ȼ� '+ IntToStr(level) +'�����²ſ��԰�ʦ��', [mbOK]);
        Error_LessLevelOther ://= 7;         // �����Ƿ����� ����
            FrmDlg.DMessageDlg ('�ȼ� ' + IntToStr(level) + ' �����ϲſ�����ͽ��', [mbOK]);
        Error_FullUser       ://= 8;        // �����ο��� ����á��
            FrmDlg.DMessageDlg ('�Է���������ͽ�ˡ�', [mbOK]);
        Error_DenyJoin       ://= 10;        // ������ ������
            FrmDlg.DMessageDlg (str+'�ܾ����������', [mbOK]);
        Error_DontDelete     ://= 11;        // Ż���ų�� ����.
            FrmDlg.DMessageDlg (str+'������ֹʦͽ��ϵ��', [mbOK]);

        Error_SuccessDelete  ://= 12;        // Ż�������
             FrmDlg.DMessageDlg ('���Ѿ�������ʦ�š�\ʦͽ��ϵ�Ѿ��Ͼ��ˡ�', [mbOK]);
        Error_NotRelationShip://= 13;        // �������°� �ƴϴ�.
            FrmDlg.DMessageDlg ('���ǲ���ʦͽ��ϵ��', [mbOK]);
        Error_RejectBroken: //=14;
            FrmDlg.DMessageDlg ('�����Ѿ��Ͼ���ʦͽ��ϵ��\'+
               FormatDateTime('yyyy��mm��dd��hhʱnn��' , UnixToDateTime(Day))  + ' �Ժ�ſ��Լ�����ʦ��ͽ��', [mbOK]);
        Error_RejectMeBroken://= 15;
            FrmDlg.DMessageDlg ('�Է��Ѿ��Ͼ���ʦͽ��ϵ��\'+
               FormatDateTime('yyyy��mm��dd��hhʱnn��' , UnixToDateTime(Day))  + ' �Ժ�ſ��Լ�����ʦ��ͽ��', [mbOK]);
        Error_SuccessDelete2  ://= 16;        // Ż�������
             FrmDlg.DMessageDlg (IntToStr(level) +'������ʦ��\ʦͽ��ϵ���Զ���ɢ��', [mbOK]);
      end;
    end;


  end;
end;

procedure TFrmMain.ClientGetLMDelete(msg: TDefaultMessage; body: string);      //���� ����
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
      if Actor.m_nState and $00000100 <> 0 then begin //�ݰ��ұ�

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

procedure TfrmMain.ClientHeroCreate(merchant: Integer);    //���� ���
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
  g_nMyHeroLuckPoint := Hibyte(LongWord(DefMsg.Recog));//���ǥ��
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
    sMsg := g_MyHero.m_sUserName  + ': ' + g_MySelf.m_sUserName + ' ������ܸ��ˡ�';
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
      0, 1 : DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
      2: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
      3: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
      4: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
    end;
  end;
end;

procedure TfrmMain.ClientGetHeroAddItem2 (body: string;idx:integer);  //����
var
   cu: TClientItem;
begin
   if body <> '' then begin
      DecodeBuffer (body, @cu, sizeof(TClientItem));
      AddHeroItemBag2 (cu);
     case idx of
      1: begin
        case cu.S.Grade of
          0, 1 : DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$FFFF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
          2: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$00FFDF42>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
          3: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$000075FF>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
           4: DScreen.AddSysMsg ('Ӣ�۵� ' + '<CO$00FFAADE>' + FilterShowName(cu.S, cu.S.Name) + '<CE> �����֡�',40,60, clWhite);
        end;
      end;
     end;
   end;
end;

procedure TfrmMain.ClientGetSendHerouseItems(body: string); //Ӣ��װ��
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

              sMsg := g_MyHero.m_sUserName + ' ������ ' + g_HeroUseItems[nWhere].S.Name + ' ��';
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

        sMsg := g_MyHero.m_sUserName + '������ ' + g_HeroUseItems[g_WaitingUseItem.Index].S.Name + ' ��';
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


procedure TfrmMain.ClientObjToMasterBagOK();  //���� > ���� ��������
begin
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToMasterBagFail();   //���� > ���� ���� �̵� ����
begin
  if g_WaitingUseItem.Item.S.Name <> '' then begin
    AddHeroItemBag(g_WaitingUseItem.Item);
  end;
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToHeroBagOK();        //���� > ���� ��������
begin
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TfrmMain.ClientObjToHeroBagFail();   //���� > ���� ���� �̵� ����
begin
  if g_WaitingUseItem.Item.S.Name <> '' then begin
    AddItemBag(g_WaitingUseItem.Item);
  end;
  g_WaitingUseItem.Item.S.Name := '';
end;

procedure TFrmMain.SendLMOptionChange(OptionType: integer; Enable: integer);      //���� ����
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
      sMsg := g_MyHero.m_sUserName + ': ' + '����������ˡ�';
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
        DScreen.AddSysMsg('Ӣ�ۻ���� 1 �㾭��ֵ��', 30, 60, clWhite)
      else DScreen.AddSysMsg('Ӣ�ۻ���� <CO$FFFF>' + GetGoldStr(LongWord(MakeLong(DefMsg.param, DefMsg.tag))) + '<CE> �㾭��ֵ��', 30, 60, clWhite);
    end else begin
      if LongWord(MakeLong(DefMsg.Param, DefMsg.Tag)) = 1 then
        DScreen.AddChatBoardString ('Ӣ�ۻ���� 1 �㾭��ֵ��',clWhite, clRed)
      else DScreen.AddChatBoardString ('Ӣ�ۻ���� ' + GetGoldStr(LongWord(MakeLong(DefMsg.Param, DefMsg.Tag))) +' �㾭��ֵ��',clWhite, clRed);
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
      DScreen.AddChatBoardString ('ף���㣬���Ӣ�������ˡ� HP,MP�ָ������ˡ�',$00800000, $00F7B5CE);
    end;
  end;
end;

procedure TFrmMain.SendLMRequest(ReqType: integer; ReqSeq: integer);       //���� ����
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_LM_REQUEST, ReqType, ReqSeq, 0, 0);
  SendSocket(EncodeMessage(msg));
end;

procedure TFrmMain.SendLMSeparate(ReqType: integer; Data: string);       //���� ����
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_LM_DELETE, ReqType, 0, 0, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(Data));
end;


procedure TFrmMain.SendMERequest(ReqType: integer; ReqSeq: integer; ReqRe: integer; Data: string);      //���� ����
var
  msg: TDefaultMessage;
begin
  msg := MakeDefaultMsg(CM_ME_REQUEST, ReqType, ReqSeq, ReqRe, 0);
  SendSocket(EncodeMessage(msg) + EncodeString(Data));
end;

procedure TFrmMain.SendMESeparate(ReqType: integer; Data: string);      //���� ����
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
      // SVN����
      if (SVN_ISTracking) and (SVN_DETAILS.Count > 0) then begin
        DScreen.AddChatBoardString ('SVN��Ϣ:', clRed, clWhite);
        for I := 0 to SVN_DETAILS.Count-1 do DScreen.AddChatBoardString (' ['+inttostr(I+1)+'] '+SVN_DETAILS.Strings[I], clRed, clWhite);
        DScreen.AddChatBoardString ('SVN����: '+inttostr(SVN_REVISION), clWhite, clGreen);
      end
      else begin
        DScreen.AddChatBoardString ('û��SVN��������', clWhite, clRed);
      end;
      DScreen.AddChatBoardString ('�޸�ʱ��: '+FormatDateTime('dd mmm yyyy/hh:nn:ss',UnixToDateTime(BUILDTIME))+' ('+inttostr(BUILDTIME)+')', clWhite, clGreen);
    end
    else if CompareText(sCmd,'server') = 0 then begin
      DScreen.AddChatBoardString ('�����������Ϣ..', clRed, clWhite);
      SendClientMessage(CM_SAY, 0, 0, 0, 0,'@svninfo '+sCmd);
    end
    else begin
      DScreen.AddChatBoardString ('!!��ָ��(client/server) (����:@svninfo client)', clWhite, clRed);
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
//      DScreen.AddChatBoardString(format('%sû�ҵ�������',[sHumanName]),clWhite,clRed);
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
      SM_DEATHHIT   : Result:='SM_DEATHHIT'; //�����
      SM_BACKSTEP   : Result:='SM_BACKSTEP';
      SM_TURN       : Result:='SM_TURN';
      SM_WALK       : Result:='SM_WALK';
      SM_DOWN       : Result:='SM_DOWN'; //������
      SM_SITDOWN    : Result:='SM_SITDOWN';
      SM_RUN        : Result:='SM_RUN';
      SM_SPEEDRUN   : Result:='SM_SPEEDRUN'; //��ź�
      SM_DOWNRUN    : Result:='SM_DOWNRUN'; //������ �޸���
      SM_HIT        : Result:='SM_HIT';
      SM_HEAVYHIT   : Result:='SM_HEAVYHIT';
      SM_FISHING1   : Result:='SM_FISHING1';     //���� ����
      SM_FISHING2   : Result:='SM_FISHING2';     //���� ��
      SM_BIGHIT     : Result:='SM_BIGHIT';
      SM_HITLEFT    : Result:='SM_HITLEFT'; //����
      SM_SPELL      : Result:='SM_SPELL';
      SM_POWERHIT   : Result:='SM_POWERHIT';
      SM_WBHIT      : Result:='SM_WBHIT';       //ǳ�˼�
      SM_WBHIT2     : Result:='SM_WBHIT2';          //ǳ�˼�
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
      SM_BALDO      : Result:='SM_BALDO';      //�ߵ���
      SM_HEAR           : Result:='SM_HEAR';
      SM_FEATURECHANGED : Result:='SM_FEATURECHANGED';
      SM_USERNAME          : Result:='SM_USERNAME';
      SM_WINEXP            : Result:='SM_WINEXP';
      SM_LEVELUP           : Result:='SM_LEVELUP';
      SM_LEVELUP2           : Result:='SM_LEVELUP2';  //���ȯ
      SM_LEVELUP3           : Result:='SM_LEVELUP3';  //���ʽ�����Ʈ
      SM_DAYCHANGING       : Result:='SM_DAYCHANGING';
      SM_ITEMSHOW          : Result:='SM_ITEMSHOW';
      SM_ITEMHIDE          : Result:='SM_ITEMHIDE';
      SM_MAGICFIRE         : Result:='SM_MAGICFIRE';
      SM_CHANGENAMECOLOR   : Result:='SM_CHANGENAMECOLOR';
      SM_CHARSTATUSCHANGED : Result:='SM_CHARSTATUSCHANGED';
      SM_SPACEMOVE_HIDE    : Result:='SM_SPACEMOVE_HIDE';
      SM_SPACEMOVE_HIDE3   : Result:='SM_SPACEMOVE_HIDE3';//�ϼ��̵�
      SM_SPACEMOVE_SHOW    : Result:='SM_SPACEMOVE_SHOW';
      SM_SPACEMOVE_SHOW3   : Result:='SM_SPACEMOVE_SHOW3';//�ϼ��̵�
      SM_SPACEMOVE_SHOW4   : Result:='SM_SPACEMOVE_SHOW4';//�ϼ��̵�
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

procedure TFrmMain.RecalcNotReadCount;     //�޸�
var
   i : integer;
begin
     // ���� ���������� �����Ѵ�.
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
  //����ʵ����ʹ��
end;

procedure TFrmMain.ClientMailResult(msg: TDefaultMessage);
begin
  Case msg.Param of
    1: frmDlg.DMessageDlg('�㲻�ܸ��������е���ҷ����ʼ���',[mbok]);
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
   for i:=0 to BlockLists.Count-1 do            //�޸�
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

procedure TFrmMain.ClientRejectListAdded(msg: TDefaultMessage; body: string);    //�ź��� �߰�
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
    1: FrmDlg.DMessageDlg('�㲻������Լ���',[mbok]);
    2: FrmDlg.DMessageDlg(str+'�Ѿ���ӳɹ���',[mbok]);
    3: FrmDlg.DMessageDlg(str+'�����ڡ�',[mbok]);
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
            SendPickup; //TabŰ �������ݱ�
            TabClickTime := GetTickCount;
         end;
      VK_CONTROL:
         begin
            g_boItemHint := not g_boItemHint; //������ ��Ʈ �����׸� ����
            ItemHintTime := GetTickCount;
         end;
     VK_MENU:
         begin
            g_boSetHint := not g_boSetHint; //������ ��Ʈ �����׸� ����
            SetHintTime := GetTickCount;
         end;
   end;
end;

procedure TfrmMain.ClientGetDiceGame(Body: String);    //�������
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

procedure TfrmMain.SendDiceitem (nFrame:Integer;shopok: string);  //�������
begin
  if shopok <> '' then begin
    SendClientMessage(CM_DICEITEM, g_MySelf.m_nRecogId, nFrame, 0, 0, shopok);
  end;
end;
//==============================================================================
procedure TfrmMain.ClientWakeData(DefMsg: pTDefaultMessage; Body: String);    //�������
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

procedure TfrmMain.ClientGetShopData(Body: String);    //ȯ����
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

procedure TfrmMain.ClientGifts(Body:String);     //ȯ����
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

procedure TfrmMain.Sendshopbuyitem (shopok: string);  //ȯ����
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
  n, Len, i: DWORD;         // 1 3 5 �������
  Buf: PChar;
  Value: PChar;
  ini: TIniFile;
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
        if FrmDlg.DSayUpDown.Position < FrmDlg.DSayUpDown.MaxPosition then   //���� ����
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
       if FrmDlg.DSayUpDown.Position > 0 then                   //���� ����
       FrmDlg.DSayUpDown.MouseWheel(Shift, mw_Up, nX, nY);
     end;
   end;
  end;
end;

procedure TfrmMain.FishingTimeTimer(Sender: TObject);   //���� ���� �ð�
begin
   inc(g_FishTime);   {0.004�� ���� 1�� ����}
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
     SendSay ('@���޴���');
  end;
end;


procedure TfrmMain.Timer5ProcessTimer(Sender: TObject);   //�����Ǿ����ϴ�.
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
      Application.MessageBox(PCHar('Bass ��ʼ��ʧ�ܡ�'), 'ȷ����Ϣ', MB_OK + MB_ICONSTOP);

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

procedure TfrmMain.Timer4ModuleTimer(Sender: TObject);    //�����Ǿ����ϴ�.
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

procedure TfrmMain.BundleHeroItem  (mode,MaxAmount:integer;MakeIndex:string);      //����
begin
  SendClientMessage(CM_HEROBUNDLEITEM, MaxAmount, mode, 0, 0, MakeIndex);
end;

procedure TfrmMain.BundleHeroStorageItem  (mode,MaxAmount:integer;MakeIndex:string);      //����
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
        if (g_HeroItemArr[idx].Amount <= 1) then begin   //����
          g_HeroItemArr[idx].S.Name := '';
        end;
      end else begin
        g_HeroEatingItem := g_HeroItemArr[idx];
        g_HeroItemArr[idx].S.Name := '';
      end;

      if (g_HeroItemArr[idx].S.StdMode = 4) and (g_HeroItemArr[idx].S.Shape < 100) then begin
        if g_HeroItemArr[idx].S.Shape < 50 then begin
          if mrYes <> FrmDlg.DMessageDlg ('����ѧϰ' + g_HeroItemArr[idx].S.Name + '��', [mbYes, mbNo]) then begin
            g_HeroItemArr[idx] := g_HeroEatingItem;
            Exit;
          end;
        end else begin
          if mrYes <> FrmDlg.DMessageDlg ('����ʹ��' + g_HeroItemArr[idx].S.Name + '��', [mbYes, mbNo]) then begin
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
        FillquickslotsHero(g_HeroEatingItem.S.Name,g_HeroEatingItem.S.StdMode,idx);  //������ �ۻ������ ����?
    end;
  end else begin
    if (idx = -1) and g_boItemMoving then begin
      g_boItemMoving := False;
      if (g_MovingItem.Item.S.StdMode in [0,1,3,45,46]) then begin
        if (g_MovingItem.Item.Amount <= 1) then begin   //����
          g_HeroEatingItem := g_MovingItem.Item;
          g_MovingItem.Item.S.Name := '';
        end else begin
          if g_EatHeroOp then
            g_dwEatHeroOpTime:= GetTickCount;     //����
          g_HeroEatingItem := g_MovingItem.Item;
          g_HeroItemArr[g_MovingItem.Index] := g_HeroEatingItem;
        end;
      end else begin
        g_HeroEatingItem := g_MovingItem.Item;
        g_MovingItem.Item.S.Name := '';
      end;

      if (g_HeroEatingItem.S.StdMode = 4) and (g_HeroEatingItem.S.Shape < 100) then begin
        if g_HeroEatingItem.S.Shape < 50 then begin
          if mrYes <> FrmDlg.DMessageDlg ('����ѧϰ' + g_HeroEatingItem.S.Name + '��', [mbYes, mbNo]) then begin
            AddHeroItemBag(g_HeroEatingItem);
            Exit;
          end;
        end else begin
          if mrYes <> FrmDlg.DMessageDlg ('����ʹ��' + g_HeroEatingItem.S.Name + '��', [mbYes, mbNo]) then begin
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
        FillquickslotsHero(g_HeroEatingItem.S.Name,g_HeroEatingItem.S.StdMode,g_MovingItem.Index);  //������ �ۻ������ ����?
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

procedure TfrmMain.SendItemToMasterBag(where: Byte; itmindex: Integer; itmname: string); //���� > ���� ��������
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_HEROBAGTOMASTERBAG, itmindex, where, 0, 0);
  SendSocket(EncodeMessage(Msg) + EncodeString(itmname));
end;

procedure TfrmMain.SendItemToHeroBag(where: Byte; itmindex: Integer; itmname: string); //���� > ���� ��������
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

procedure TfrmMain.ClientGetHeroAutoAddItem (body: string;idx:integer);  //����
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
        for I := Low(g_HeroUseItems) to High(g_HeroUseItems) do begin   //������ ����
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


procedure TfrmMain.MyMessage(var MsgData: TWmCopyData);   //�����Ǿ����ϴ�.
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


procedure TfrmMain.ProcessMsg(wIdent: Word; sData: string);     //�����Ǿ����ϴ�.
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
        SendProgramMsg(GameGuard.MainFormHandle, GS_CHECKRUNCODE, '�������ӿͻ���...');
      end;
    SG_STARTOK: begin
        GameGuard.btStartStatus := 2;
        SendProgramMsg(GameGuard.MainFormHandle, GS_CHECKRUNCODE, '�ͻ������ӳɹ�...');
      end;
    SG_CHECKRUNCODE: begin
        SendClientMessage(CM_SPEEDHACKUSER, 10003, 0, 0, 0, sData + ' HDD : ' + GetHardDiskSerial('c'));
      end;
  end;
end;


function RunProgram(var ProgramInfo: TProgram; sHandle: string; dwWaitTime: LongWord): LongWord; //�����Ǿ����ϴ�.
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

function StopProgram(var ProgramInfo: TProgram; dwWaitTime: LongWord): Integer;  //�����Ǿ����ϴ�.
var
  dwExitCode: LongWord;
begin
  Result := 0;
  if TerminateProcess(ProgramInfo.ProcessHandle, dwExitCode) then begin
    Result := GetLastError();
  end;
  Sleep(dwWaitTime);
end;

procedure SendProgramMsg(DesForm: THandle; wIdent: Word; sSendMsg: string);     //�����Ǿ����ϴ�.
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

procedure TfrmMain.StartGame;         //�����Ǿ����ϴ�.
begin
  FillChar(GameGuard, SizeOf(TProgram), #0);
  GameGuard.boGetStart := True;
  GameGuard.boReStart := True;
  GameGuard.sDirectory := '.\';
  GameGuard.sProgramFile := DecodeString_3des('7Wvy21rJMPboBb7gMA==', '56m2VipGate');

  TimerStartGame.Enabled := True;
end;

procedure TfrmMain.StopGame;       //�����Ǿ����ϴ�.
begin
  TimerCheckRun.Enabled := False;
  TimerStopGame.Enabled := True;
end;

procedure TfrmMain.TimerStartGameTimer(Sender: TObject);       //�����Ǿ����ϴ�.
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

procedure TfrmMain.TimerCheckRunTimer(Sender: TObject);       //�����Ǿ����ϴ�.
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

procedure TfrmMain.TimerStopGameTimer(Sender: TObject);      //�����Ǿ����ϴ�.
var
  dwExitCode: LongWord;
begin
  if GameGuard.boGetStart and (GameGuard.btStartStatus in [2, 3]) then begin
    GetExitCodeProcess(GameGuard.ProcessHandle, dwExitCode);
    if dwExitCode = STILL_ACTIVE then begin
      if GameGuard.btStartStatus = 3 then begin
        if GetTickCount - g_dwStopTick > g_dwStopTimeOut then begin
          StopProgram(GameGuard, 0);
         // MainOutMessage('Ŭ���̾�Ʈ ���� �ð��ʰ�.');
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
     // MainOutMessage('Ŭ���̾�Ʈ ����');
    end;
  end;
  TimerStopGame.Enabled := False;
end;

function GetHardDiskSerial(const DriveLetter: Char): string;      //�����Ǿ����ϴ�.
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
