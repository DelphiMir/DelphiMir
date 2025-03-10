unit MShare;

interface
uses
  {svn, }Windows, Classes, SysUtils, cliutil, Forms, DXDraws, FindMapPath, ZLIB,
  Graphics, MyCommon,
  WIL, Actor, Grobal2, SDK, DXSounds, IniFiles, Share, RelationShip, DWinCtl;
const
  MAXBUYITEM = 100;
  MCC_IF = 1;
  MCC_WRITE = 2;
  MCC_ENDIF = 3;

type
  TTimerCommand = (tcSoftClose, tcReSelConnect, tcFastQueryChr, tcQueryItemPrice);
  TChrAction = (caWalk, caRun, caHorseRun, caHit, caSpell, caSitdown, caLeap);
  TConnectionStep = (cnsLogin, cnsSelChr, cnsReSelChr, cnsPlay);

  TUserSayMode = (usm_Hear, usm_Cry, usm_Whisper, usm_Lover, usm_Master, usm_Group, usm_Guild, usm_sys);
  TUserSayType = (us_All, us_Hear, us_Cry, us_Whisper, us_Lover, us_Master, us_Group, us_Guild, us_Sys, us_GuildAlly, us_None);

  TUserSaySet = set of TUserSayType;

  pTEMailInfo = ^TEMailInfo;      //¿ìÆí½Ã½ºÅÛ
  TEMailInfo = record
    ClientEMail: TClientEMailHeader;
    sText: string;
    nGold: Integer;
    Item: TNewClientItem;
  end;

  TMapDescList = record
    sMapName: string[50];
    MaxList: TList;
    MinList: TList;
  end;
  pTMapDescList = ^TMapDescList;

  TMapDesc = record
    sName: string[50];
    nX, nY: Word;
    nColor: TColor;
  end;
  pTMapDesc = ^TMapDesc;

  TMoveHMShow = packed record       //Å¸°ÝÄ¡
    Surface: TDirectDrawSurface;
    dwMoveHpTick: LongWord;
  end;
  pTMoveHMShow = ^TMoveHMShow;

  TBuff = Record    //¹öÇÁ
    btIdx: Integer;
    nImgIndex: word;
    nTime: Integer;
    str: String;
  End;
  pTBuff = ^TBuff;

  TItemDesc = record
    Name: string;
    Desc: string;
  end;
  pTItemDesc = ^TItemDesc;

  {===========================}
  //¹«°øÁ¤º¸
  nMagicType = Record
   MagicStr:  array[0..12] of String;
   StrColor : array[0..12] of Integer;
  end;

  sItemMome = Record
   sItemopes:  array[0..50] of String;
   nColor : array[0..50] of Integer;
  end;
{===========================}

  TMovingItem = record
    Index: integer;
    Index2: integer;
    Item: TClientItem;
    Owner: TObject;
  end;
  pTMovingItem = ^TMovingItem;

  TPowerBlock = array[0..100-1] of Word;
  // 2003/02/11 ViewObject...¹Ì´Ï¸Ê»ó¿¡ ±×·ì¿ø Ç¥½Ã
  TMiniViewObject = record
    Index: integer;
    x, y : integer;
    LastTick : longword;
  end;
  PTMiniViewObject = ^TMiniViewObject;

  TAutoPotItems = array[0..1] of TClientItem;

  TSelHero = record //¿µ¿õ»ý¼º
    Valid: Boolean;
    UserChr: TUserCharacterInfo;
    Selected: Boolean;
    AniIndex: Integer;
    DarkLevel: Integer;
    StartTime: LongWord;
    moretime: LongWord;
  end;

  TItemType = (i_HPDurg,i_MPDurg,i_HPMPDurg,i_OtherDurg,i_Weapon,i_Dress,i_Helmet,i_Necklace,i_Armring,i_Ring,i_Belt,i_Boots,i_Charm,i_Tiger,i_Book,i_PosionDurg,i_UseItem,i_Scroll,i_Stone,i_Gold,i_Other);
  TShowItem = record
    sItemName    :String;
    ItemType     :TItemType;
    boAutoPickup :Boolean;
    boShowName   :Boolean;
    nFColor      :Integer;
    nBColor      :Integer;
  end;
  pTShowItem = ^TShowItem;

  pTItemEffect = ^TItemEffect;
  TItemEffect = record
    Idx: integer;
    n_CurrentFrame: integer;
    n_StartFrame: integer;
    n_EndFrame: integer;
    n_NextFrame: integer;
    n_LastFrame: longword;
  end;

  TDrawEffect = record
    nIndex: Integer;
    dwDrawTick: LongWord;
  end;
  pTDrawEffect = ^TDrawEffect;

  TClickName = record
    nLeft, nRight: Word;
    sStr: string;
    Index: Integer;
  end;
  pTClickName = ^TClickName;

  TClickItem = record
    nLeft, nRight: Word;
    sStr: string;
    nIndex: Word;
    wIdent: Word;
    ItemIndex: Integer;
    Index: Integer;
    pc: TClientItem;
  end;
  pTClickItem = ^TClickItem;

  pTFaceImage = ^TFaceImage;
  TFaceImage = record
    ImageIndex: Integer;
    dwShowTime: LongWord;
    nShowX: Word;
  end;

  pTMarkImage = ^TMarkImage;
  TMarkImage = record
    ImageIndex: Integer;
  end;

  TSayImage = record
    nLeft, nRight: Word;
    nIndex: Word;
  end;
  pTSayImage = ^TSayImage;

  pTClientCheckMsg = ^TClientCheckMsg;
  TClientCheckMsg = packed record
    str: string;
    EndTime: LongWord;
    MsgIndex: Integer;
    MsgType: TCheckMsgClass;
    ShowTime: LongWord;
  end;

  pTSayMessage = ^TSayMessage;
  TSayMessage = record
    SayMag: string;
    FoColor: Integer;
    baColor: Integer;
    bSys: Boolean;

    SaySurface: TDirectDrawSurface;
    ClickList: TList;
    ItemList: TList;
    ImageList: TList;
    UserSayType: TUserSayType;
  end;


  TMissionFlagInfo = packed record
    nFlag: Integer;
    btValue: Byte;
  end;

  TMissionItemInfo = packed record
    sItemName: string[ActorNameLen];
    wItemCount: Word;
  end;

  pTMissionScript = ^TMissionScript;
  TMissionScript = packed record
    sCMDCode: Integer;
    sParam1: string;
    sParam2: string;
    sParam3: string;
    sParam4: string;
    nParam1: Integer;
    nParam2: Integer;
    nParam3: Integer;
    nParam4: Integer;
    sAllParam: string;
  end;


  pTClientMission = ^TClientMission;
  TClientMission = packed record
    boAccept: Boolean;
    sMissionMaster: string[MapNameLen * 2];
    sMissionName: string[MapNameLen];
    sMissionShowName: string[MapNameLen * 2];
    sNPCMapName: string[MapNameLen * 2];
    wNPCCurrX: Word;
    wNPCCurrY: Word;
    sCanAcceptText: string;
    sCanAcceptMapName: string;
    btJob: Byte;
    btSex: Byte;
    wLogoutIdx: Word;
    btCycCount: Byte;
    btCycVar: Byte;
    nMinLevel: Integer;
    nMaxLevel: Integer;
    AcceptFlag: array[0..2] of TMissionFlagInfo;
    //AcceptItem: array[0..2] of TMissionItemInfo;
    CompleteFlag: array[0..2] of TMissionFlagInfo;
    CompleteItem: array[0..2] of TMissionItemInfo;
    sKillMonName1: string[ActorNameLen];
    btKillCount1: Byte;
    sKillMonName2: string[ActorNameLen];
    btKillCount2: Byte;
    sMissionHint: string;
    MissionInfo: Pointer;
    NPC: TNPCActor;
    ScriptList: TList;
    boHide: Boolean;
  end;

  pTClientMissionInfo = ^TClientMissionInfo;
  TClientMissionInfo = packed record
    MissionIdx: Integer;
    MissionInfo: TMissionInfo;
    ClientMission: pTClientMission;
    DTreeNodes: pTDTreeNodes;
    nItemCount1: Word;
    nItemCount2: Word;
    nItemCount3: Word;
    boPinch: Boolean;
  end;


  TMapDescInfo = record
    sMapName: string;
    sDescName: string;
    nX, nY: Integer;
    FColor: TColor;
    boBigMap: Boolean;
  end;
  pTMapDescInfo = ^TMapDescInfo;


var
//  MonImg            :Array[0..100] of TMonImg;
  g_FaceIndexList: array[0..44] of Word = (
    0, 7, 12, 17, 23, 33, 38, 48, 59, 66,
    73, 84, 106, 114, 117, 122, 127, 134, 141, 154,
    156, 161, 167, 176, 188, 201, 218, 224, 227, 247,
    250, 255, 261, 266, 271, 290, 295, 298, 303, 309,
    313, 321, 324, 327, 330);

  g_FaceTextList1: array[0..High(g_FaceIndexList)] of string[15] = (
    '¾ªÑÈ', 'Ë£Àµ', 'Ïà·´', '¾ª»Å', '×ÔÒÔÎªÊÇ', '±¯ÉË', 'º¦Ðß', '¾Ü¾ø', 'À§ÃÎ', 'ÑÛÀá',
    'ÞÏÞÎ', '´óÅ­', 'ß´ß´', '¿©¿©', 'Ð¦Á³', '¶Ô²»Æð', '×°¿á', '·èÁË', '²»Ï²»¶', 'ÎüÊ³',
    '¿É°®', '°ÁÂý', 'ºñÑÕÎÞ³Ü', '¼¢¶ö', 'À§¾ë', 'Õð¾ª', 'Í´¿à', 'Âú×ã', 'ÀÏ°å', 'Õù¶·',
    '×çÖä', 'ÒÉÎÊ', '³ÁÄ¬...', '·ñ¶¨', 'Í´¿à', '´ò¼Ü', 'ÔÙ¼û', '±ã±ã', '×ì´½', 'ÐÄËé',
    'Ê§Áµ', '×î°ô', '×î»µ', 'ÎÕÊÖ', 'Ê¤Àû'

    );
  g_FaceIndexInfo: array[0..High(g_FaceIndexList)] of TFaceImage;


  g_MarkIndexList: array[0..89] of Word = (
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
    21, 22, 23, 24, 25, 26, 17, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
    61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
    71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90);

  g_MarkIndexInfo: array[0..High(g_MarkIndexList)] of TMarkImage;

  g_SayShowType: TUserSayType = us_All;
  g_SayEffectIndex: array[TUserSayType] of Boolean;
  g_SayType: TUserSayType = us_All;
  g_SayMode: TUserSayMode;
  g_SayModetype: TUserSayMode;

  g_FriendList: TStringList; //»õ·Î¿îÄ£±¸
  g_MyBlacklist: TStringList;

  g_SayUpDownLock: Boolean = False;


  g_sLogoText       :String = 'wf>QKZtS=Ap[icP';
  g_sGoldName       :String = '½ð±ÒÔö¼Ó';
  g_sGameGoldName   :String = 'ÓÎÏ·±Ò';
  g_sGamePointName  :String = 'PCµã';
  g_sWarriorName    :String = 'Õ½Ê¿';    //Á÷¾÷¸í
  g_sWizardName     :String = '·¨Ê¦';
  g_sTaoistName     :String = 'µÀÊ¿';
  g_sAssassinName   :String = '´Ì¿Í';
  g_sBonzeName      :String = 'ºÍÉÐ';
//  g_sArcherName     :String = '±Ã¼ö';
  g_sWarriorUPName    :String = '±ÌÑªÕ½Ê¿';    //Á÷¾÷¸í
  g_sWizardUPName     :String = 'ºëÐþ·¨Ê¦';
  g_sTaoistUPName     :String = 'ñ´ÏÉµÀÊ¿';
  g_sAssassinUPName   :String = '·ÉÑà´Ì¿Í';
  g_sBonzeUpName      :String = 'ÆÆ½äÉ®';
//  g_sArcherUPName     :String = '¾Ï±Í±Ã¼ö';
  g_sUnKnowName     :String = 'Î´Öª';

  g_sMainParam1     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
  g_sMainParam2     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
  g_sMainParam3     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
  g_sMainParam4     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
  g_sMainParam5     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
  g_sMainParam6     :String; //¶ÁÈ¡ÉèÖÃ²ÎÊý
//°ø°Ý¸ðµå
  g_AttackModeOfAll            :String = '[È«Ìå¹¥»÷]';
  g_AttackModeOfPeaceful       :String = '[ºÍÆ½¹¥»÷]';
  g_AttackModeOfGroup          :String = '[×é¶Ó¹¥»÷]';
  g_AttackModeOfGuild          :String = '[ÐÐ»á¹¥»÷]';
  g_AttackModeOfEnemy          :String = '[ÁªÃË¹¥»÷]';
  g_AttackModeOfRedWhite       :String = '[ÉÆ¶ñ¹¥»÷]';

  g_DXDraw           :TDXDraw;
  g_DWinMan          :TDWinManager;
  g_DXSound          :TDXSound;
  g_Sound            :TSoundEngine;

  g_WMainImages      :TWMImages;
  g_WMain2Images     :TWMImages;
  g_WMain3Images     :TWMImages;
  g_WGuildImages     :TWMImages;
  g_WTitleImages     :TWMImages; //Ãß°¡µÈ ¹öÆ°
  g_WAresImages      :TWMImages;
  g_WFaceImages      :TWMImages;
  g_WBuffIconImages  :TWMImages;
  g_WNewChrSelImages :TWMImages;
  g_WHeroChrSelImg   :TWMImages;
  g_WNewLoginImages  :TWMImages;
  g_WChrSelImages    :TWMImages;
  g_WGSkillImages    :TWMImages; //¹®ÆÄ¼ºÀå
  g_WMMapImages      :TWMImages;
  g_WFMMapImages     :TWMImages;
  g_WSMMapImages     :TWMImages;
  g_WMMapMir3Images  :TWMImages;
  g_WHumWingImages   :TWMImages;

  g_WWeapon_Effect                :TWMImages;
  g_WWeapon_Effect_Assassin_Left  :TWMImages;
  g_WWeapon_Effect_Assassin_Right :TWMImages;
  g_WWeapon_Effect_Common         :TWMImages;
  g_WWeapon_Effect_Killer_Left    :TWMImages;
  g_WWeapon_Effect_Killer_Right   :TWMImages;
  g_WWeapon_Effect_Monk           :TWMImages;
  g_WWeapon_Effect_Warrior        :TWMImages;
  g_WWeapon_Effect_Wizard         :TWMImages;
  g_WWeapon_Bonze_Effect          :TWMImages;

  g_WHumEffectImages :TWMImages;
  g_WHumWing_KillerImages   :TWMImages;       //ÀÚ°´ ÀÌÆÑÆ®
  g_WHumWing_BonzeImages    :TWMImages;
  g_WUpCom_EfImages  :TWMImages;
  g_WUpWarr_EfImages  :TWMImages;
  g_WUpWiz_EfImages  :TWMImages;
  g_WUpMonk_EfImages  :TWMImages;
  g_WUpAssa_EfImages :TWMImages;

  g_WBagItemImages   :TWMImages;
  g_WStateItemImages :TWMImages;  //»óÅÂÃ¢ ±âº»
  g_WStateItemComManImages :TWMImages;  //»óÅÂÃ¢ µî¼± °ø¿ë ³²ÀÚ
  g_WStateItemComWomanImages :TWMImages;  //»óÅÂÃ¢ µî¼± °ø¿ë ¿©ÀÚ
  g_WStateItemWarrManImages :TWMImages;  //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
  g_WStateItemWarrWoImages :TWMImages;  //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©)
  g_WStateItemWizManImages :TWMImages;  //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
  g_WStateItemWizWoImages :TWMImages;  //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
  g_WStateItemMonkManImages :TWMImages;  //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
  g_WStateItemMonkWoImages :TWMImages;  //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
  g_WStateItemAssManImages :TWMImages;  //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
  g_WStateItemAssWoImages :TWMImages;  //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)

  g_WState_Eff :TWMImages;
  g_WState_Eff_Assassin_Man :TWMImages;
  g_WState_Eff_Assassin_Woman :TWMImages;
  g_WState_Eff_Common_Man :TWMImages;
  g_WState_Eff_Common_Woman :TWMImages;
  g_WState_Eff_Monk_Man :TWMImages;
  g_WState_Eff_Monk_Woman :TWMImages;
  g_WState_Eff_Warrior_Man :TWMImages;
  g_WState_Eff_Warrior_Woman :TWMImages;
  g_WState_Eff_Wizard_Man :TWMImages;
  g_WState_Eff_Wizard_Woman :TWMImages;

  g_WState_Eff_BImages :TWMImages;
  g_WDnItemImages    :TWMImages;
  g_WHumImgImages    :TWMImages;
  g_WHum2ImgImages   :TWMImages;
  g_WHum3ImgImages   :TWMImages;
  g_WHum4ImgImages   :TWMImages;
  g_WHum_BonzeImgImages :TWMImages;
  g_WHum_CommonImgImages :TWMImages; //µî¼± ±âº»
  g_WTigerImgImages  :TWMImages;  //È£¶ûÀÌ
  g_WTigerUpImgImages  :TWMImages;  //µî¼± È£¶ûÀÌ
  g_WHum_KillerImgImages :TWMImages;         //ÀÚ°´
  g_WHum_Killer2ImgImages :TWMImages;         //ÀÚ°´
  g_WHum_Killer4ImgImages :TWMImages;
  g_WHumUp_WarrImgImages :TWMImages;         //º®Ç÷Àü»ç
  g_WHumUp_WizImgImages :TWMImages;         //È«Çö¼ú»ç
  g_WHumUp_MonkImgImages :TWMImages;         //ÀÍ¼±µµ»ç
  g_WHumUp_AssassinImgImages :TWMImages;         //ºñ¿¬ÀÚ°´
  g_WHairImgImages   :TWMImages;
  g_WHairComImgImages   :TWMImages;
  g_WHair_KillerImgImages   :TWMImages;           //ÀÚ°´¸Ó¸®
  g_WHair_WarriorUpImgImages   :TWMImages;           //º®Ç÷Àü»ç¸Ó¸®
  g_WHair_WizardUpImgImages   :TWMImages;           //È«Çö¼ú»ç¸Ó¸®
  g_WHair_MonkUpImgImages   :TWMImages;           //ÀÍ¼±µµ»ç¸Ó¸®
  g_WHair_AssassinImgImages   :TWMImages;           //ºñ¿¬ÀÚ°´¸Ó¸®
  //-----------------
  g_Fishing1Images       :TWMImages;     //³¬½Ã ¹«±â ÀÏ¹Ý ÀÌ¹ÌÁö
  g_Fishing2Images       :TWMImages;     //³¬½Ã ¹«±â µî¼± ÀÌ¹ÌÁö
  //-----------------------
  g_WHorseImgImages  :TWMImages;
  g_WWeaponImages    :TWMImages;
  g_WWeapon_CommImages    :TWMImages;     //µî¼±¹«±â
  g_WWeapon_BonzeImages   :TWMImages;
  g_WWeapon_Killer_RightImages :TWMImages;          //ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Killer_LeftImages :TWMImages;          //ÀÚ°´ ¿Þ ¼Õ
  g_WWeapon_WarrImages :TWMImages;          //º®Ç÷Àü»ç ¹«±â
  g_WWeapon_WizImages :TWMImages;          //È«Çö¼ú»ç ¹«±â
  g_WWeapon_MonkImages :TWMImages;          //ÀÍ¼±µµ»ç ¹«±â
  g_WWeapon_Assassin_RightImages :TWMImages;          //ºñ¿¬ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Assassin_LeftImages :TWMImages;          //ºñ¿¬ÀÚ°´ ¿Þ ¼Õ
  g_WTransFormImages :TWMImages; //º¯½ÅÅ»
  g_WTransFormEffectImages  :TWMImages;
  g_WTransFormWeaponEffectImages :TWMImages;
  g_WMagIconImages   :TWMImages;
  g_WMagIcon2Images  :TWMImages;
  g_WMagNewIconImages   :TWMImages;
  g_WMagNewIcon2Images  :TWMImages;

  g_WNpcImgImages    :TWMImages;
  g_WNewNpcImages    :TWMImages;
  g_WMagicImages     :TWMImages;
  g_WMagic0Images    :TWMImages;
  g_WMagic2Images    :TWMImages;
  g_WMagic3Images    :TWMImages;
  g_WMagic4Images    :TWMImages;
  g_WMagicNewImages  :TWMImages;
  g_WMagicUpImages   :TWMImages;
  g_WMagic_BonzeImages :TWMImages;
  g_WDecoImages      :TWMImages;
  g_WPetImg          :TWMImages;
  g_WDragonImg       :TWMImages;
  g_WEffectImg       :TWMImages;
  g_WKuLouImages     :TWMImages;
  g_WEventEffectImages:TWMImages;

  g_EiTiteArr: Array[0..71] Of TWMImages;
  g_WTilesImages     :TWMImages;
  g_WSmTilesImages   :TWMImages;
  g_WObjectArr       :array[0..22] of TWMImages;    //¿ÀºêÁ§Æ®  23°³

  g_wSTiles : Array[0..7] Of TWMImages;
  g_WSSmTiles  : Array[0..8] Of TWMImages;
  g_WAniImages :TWMImages;
  g_WSObjectArr       :array[0..29] of TWMImages;   //¿ÀºêÁ§Æ®  30°³
  g_WMonImagesArr    :array[0..9999] of TWMImages;

  WMon42Img: TWMImages;

  g_nRogueEnabled: Integer;

  g_DefColorTable: array[0..255] of TRGBQuad;
  g_PowerBlock:TPowerBlock = (   //10
	$55, $8B, $EC, $83, $C4, $E8, $89, $55, $F8, $89, $45, $FC, $C7, $45, $EC, $E8,
	$03, $00, $00, $C7, $45, $E8, $64, $00, $00, $00, $DB, $45, $EC, $DB, $45, $E8,
	$DE, $F9, $DB, $45, $FC, $DE, $C9, $DD, $5D, $F0, $9B, $8B, $45, $F8, $8B, $00,
	$8B, $55, $F8, $89, $02, $DD, $45, $F0, $8B, $E5, $5D, $C3,
	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, 
	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
	$00, $00, $00, $00, $00, $00, $00, $00
   );
  g_PowerBlock1:TPowerBlock = (
	$55, $8B, $EC, $83, $C4, $E8, $89, $55, $F8, $89, $45, $FC, $C7, $45, $EC, $64,
	$00, $00, $00, $C7, $45, $E8, $64, $00, $00, $00, $DB, $45, $EC, $DB, $45, $E8,
	$DE, $F9, $DB, $45, $FC, $DE, $C9, $DD, $5D, $F0, $9B, $8B, $45, $F8, $8B, $00,
	$8B, $55, $F8, $89, $02, $DD, $45, $F0, $8B, $E5, $5D, $C3,
	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, 
	$00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00,
	$00, $00, $00, $00, $00, $00, $00, $00
   );
  g_sServerName      :String; 
  g_sServerMiniName  :String;
  g_sServerAddr      :String = '127.0.0.1'; //³»Àå ¾ÆÀÌÇÇ
  g_nServerPort      :Integer = 7000;

  Deepcolor          :smallint;
//  g_sServerAddr      :String = '112.144.160.144'; //³»Àå ¾ÆÀÌÇÇ
//  g_nServerPort      :Integer = 7000;

 // g_sServerAddr      :String = '112.147.77.213'; //Ãµ¿î ³»Àå ¾ÆÀÌÇÇ
 // g_nServerPort      :Integer = 7995; //7000;

  g_nTopDrawPos      :Integer = 0;
  g_nLeftDrawPos     :Integer = 0;

  g_sSelChrAddr      :String;
  g_nSelChrPort      :Integer;
  g_sRunServerAddr   :String;
  g_nRunServerPort   :Integer;

  g_boSendLogin      :Boolean; //ÊÇ·ñ·¢ËÍµÇÂ¼ÏûÏ¢
  g_boServerConnected:Boolean;
  g_SoftClosed       :Boolean; //Ð¡ÍËÓÎÏ·
  g_ChrAction        :TChrAction;
  g_ConnectionStep   :TConnectionStep;

  g_boSound          :Boolean; //¿ªÆôÉùÒô
  g_boAttSound       :Boolean;
  g_boBGSound        :Boolean; //¿ªÆô±³¾°ÒôÀÖ
  g_btMP3Volume      :Byte = 100;
  g_btSoundVolume    :Byte = 100;
  g_boCanSound: Boolean = True;

  g_boSkillSetting   :Boolean = TRUE;
  g_boSkillBarNum    :Integer = 1;               //¿É¼Ç ÃÊ±â
  g_boShowSkillBar   :Boolean;
  g_boEffect         :Boolean = TRUE;
  g_boNameAllView    :Boolean = False;
  AddHeight          :Integer;
  g_boHPView         :Boolean = False;
  g_boNameChNpView   :Boolean = False;
  g_boNameMonView    :Boolean = False;

  sPetOption         :string = '1:0:0:0:0:0:0:0:0/';

  nHero1Index        :Integer = 0;
  nHero2Index        :Integer = 1;
  nHero1Percent      :Integer = 70;
  nHero2Percent      :Integer = 70;


                   //¹Ì¸£ º»¼· ±Û¾¾Ã¼
  g_FontArr          :array[0..MAXFONT-1] of string = (
                     'ÌåÑéÇø',
                     'ËÎÌå',
                     '¿¬Ìå',
                     'ºÚÌå',
                     'ÌåÑéÇø',
                     'ËÎÌå',
                     '¿¬Ìå',
                     'ºÚÌå'
                    );

  g_nCurFont         :Integer = 0;
  g_sCurFontName     :String = 'ÌåÑéÇø';

  g_boShowFormImage:  Boolean = False;

  g_boFullScreen     :Boolean = True;
  g_InterfaceMode    :Boolean = True;
  g_BitCountMode     :Integer = 0;
  g_boFullScreen2    :Boolean = True;
  g_boDisableFlip    :Boolean = False;
  g_boWindowTest     :Boolean = False;
  
  g_boAutoLogin      :Boolean = False;
  g_boAutoServer     :Boolean = False;
  g_sAutoID          :String = 'username';
  g_sAutoPass        :String = 'password';
  g_sAutoServerName  :String = 'ÁúµÄ´«Ëµ';

  g_ImgMixSurface    :TDirectDrawSurface;
  ImgLargeMixSurface: TDirectDrawSurface;
  g_dddtypemode          :Boolean; //»óÀÎ

  m_CoolTimeMSG       :TStringList;

  g_EatOp        :Boolean;     //¹°¾à
  g_EatHeroOp        :Boolean;     //¹°¾à
  g_boFirstTime      :Boolean;
  g_boFirstTime2      :Boolean;
  g_boFirstTime3      :Boolean;
  g_sMapTitle        :String;
  g_nMapMusic        :Integer;

  fLover: TRelationShipMgr;       //¿¬ÀÎ ½ºÃÄ
  fMentor: TMentorShipMgr; //»çÁ¦ ½ºÃÄ

  SELECTEDFRAME      :Integer = 16;
  FREEZEFRAME        :Integer = 25;

  g_ServerList           :TStringList;
  g_MagicList            :TList;
  g_HeroMagicList        :TList;

  g_MemberGroup          :TList;
  GroupIdList            :TList;
  g_SaveItemList         :TList;
  g_MenuItemList         :TList;
  g_DropedItemList       :TList;
  g_ChangeFaceReadyList  :TList;


  g_AucList          :TList;    //°æ¸Å
  g_BuffList         :TList;    //¹öÇÁ
  g_HeroBuffList     :TList; 
  g_CoolBuffList     :TList;    //¹öÇÁ
  //È¯»óÁ¡
  g_ShopItemesp      :Tlist;
  g_GiftsItemlist    :Tlist;
  g_GiftsItemType    :Tlist;

  g_SoundList            :TStringList;
  g_HumRunDress          :Boolean = FALSE;//ÁúÁÖ
  g_MaskRun              :Boolean = FALSE;
  g_boDropDrug           :Boolean = FALSE; //È¯ÅÛ µå¶ø
  g_nAttatckMode         :Integer;//°ø°Ý¸ðµå
  g_nGrade               :Integer; //µî±Þ
  g_nGroupCall           :Integer;//ÃµÁöÇÕÀÏ
  g_nPresentExp          :Integer;
  g_nExpRate             :Integer;//°æÇèÄ¡
  g_nBonusPoint          :Integer;
  g_nSaveBonusPoint      :Integer;
  g_BonusTick            :TNakedAbility;
  g_BonusAbil            :TNakedAbility;
  g_NakedAbil            :TNakedAbility;
  g_BonusAbilChg         :TNakedAbility;

  g_sGuildName           :String;
  g_sGuildRankName       :String;
  g_nGuildMark           :integer;

  g_dwTenSecTick         :array [0..500] of LongWord;   //¹öÇÁ
  g_TenSecTick           :array [0..500] of Boolean;   //¹öÇÁ

  g_dwLastAttackTick     :LongWord;
  g_dwLastHeroMoveTick   :LongWord;  //¿µ¿õ ÀÌµ¿µô·¹ÀÌ µÎ±â
  g_dwLastHeroTurnTick   :LongWord;  //¿µ¿õ ¹æÇâ µô·¹ÀÌ
  g_dwLastMoveTick       :LongWord;
  g_dwLatestStruckTick   :LongWord;
  g_dwLatestSpellTick    :LongWord;
  g_dwLatestSpellTick2   :LongWord;
  g_dwLatestFireHitTick  :LongWord;
  g_dwLatestDeathHitTick :LongWord;
  g_dwLatestRushRushTick :LongWord;
  g_dwLatestHitTick      :LongWord;
  g_dwLatestMagicTick    :LongWord;

  g_dwRecallPetTick      :LongWord = 0; //¿µ¹° µô·¹ÀÌ

  g_dwMagicDelayTime     :LongWord;
  g_dwMagicPKDelayTime   :LongWord;

  g_nMouseCurrX          :Integer;
  g_nMouseCurrY          :Integer;
  g_nMouseX              :Integer;
  g_nMouseY              :Integer;

  g_nTargetX             :Integer;
  g_nTargetY             :Integer;
  g_TargetCret           :TActor;
  g_FocusCret            :TActor;

  g_MagicTarget          :TActor;

  g_KeyDownTick          :LongWord;   //¾÷ ´Ù¿îÅ°

  m_boWakeUp             :Boolean;
  g_FishingOk            :Boolean;    //³¬½ÃÁß ÀÌ´Ù.
  g_AutoRateIn           :integer;
  g_AutoRate             :Boolean;
  g_boFishCatch          :Boolean;    //³¬À» ¼öÀÖ´Ù(¼­¹ö·Î¿äÃ»)
  g_FishTime             :Integer;    //³¬½Ã °ÔÀÌÁö ¹Ù
  g_FishSuccess          :Integer;    //³¬½Ã ¼º°ø·ü ¹Ù
  g_FishTiming           :Integer;    //³¬À» Å×ÀÌ¹Ö
  g_IncFishSuccess       :Integer = 0;
  g_AutoFish             :Boolean;
  g_AutoFishTick         :LongWord;
  g_AutoFishUpTime       :LongWord = 2300;
  g_CheckEsc             :Boolean;    //Esc Å°·Î ³¬½Ã Á¾·á ÇÒ°ÇÁö.
  g_dwFishSetTick        :LongWord;

  g_CheckPetDB           :Boolean;
  g_BoPetOn              :Boolean;
  g_CheckMacro           :Boolean;    //°³ÀÎ»óÁ¡


  g_boDrugOn             :Boolean;

  QItemAmount            :Integer;   //¹°¾à
  QItemmsIdex            :Integer= -1;    //¹°¾à
  HItemmsIdex            :Integer= -1;    //¹°¾à
  //BoStopAfterAttack : Boolean;
  g_boAttackSlow         :Boolean;
  g_boMoveSlow , g_boMoveSlow2          :Boolean;
  g_nMoveSlowLevel      :Integer;
  g_nMoveSlowValue      :integer;
  g_boMapMoving          :Boolean;
  g_boMapMovingWait         :Boolean;

  g_boCheckSpeedHackDisplay :Boolean;
  g_boShowGreenHint         :Boolean = False;
  g_boViewMiniMap           :Boolean=False;
  g_nViewMinMapLv           :Integer;
  g_nMiniMapIndex           :Integer;

  g_nFPSping               :String = '';
  g_boReSelConnect: Boolean = False;
  g_dwReSelConnectTick: LongWord;
  g_ClientRect: TRect;
  
  g_LegendMap               :TLegendMap;
  //¿µ¹° ÁÝ±â ¿É¼Ç

  g_HeroCall : Boolean = False;
  g_HeroCallTick: LongWord;
  g_ClientCallRect: TRect;

  g_HeroBackCall : Boolean = False;
  g_HeroBackCallTick: LongWord;
  g_ClientBackCallRect: TRect;

  g_HeroMasterDefen: Boolean = False;
  g_HeroMasterDefenTick: LongWord;
  g_ClientDefenRect: TRect;

  g_boItemAuto            :integer = 1;

  g_boItemAll             :integer = 1;
  g_boItemGold            :integer = 0;
  g_boItemWeapon          :integer = 0;
  g_boItemDress           :integer = 0;
  g_boItemHelmet          :integer = 0;
  g_boItemBoots           :integer = 0;
  g_boItemBelt            :integer = 0;
  g_boItemAccessory       :integer = 0;
  g_boItemEtc             :integer = 0;


  g_MoExpMsg              :Boolean=True;

  g_boViewMap           :Boolean;
  g_nViewMapLv           :Integer;
  g_nMapIndex           :Integer;


  g_nMiniMapX: Integer;
  g_nMiniMapY: Integer;

  g_nMiniMapOldX: Integer = -1;
  g_nMiniMapOldY: Integer = -1;

  g_nMiniMapMosX: Integer;
  g_nMiniMapMosY: Integer;

  g_nMiniMapMaxX: Integer = -1;
  g_nMiniMapMaxY: Integer = -1;
  g_nMiniMapMoseX: Integer = -1;
  g_nMiniMapMoseY: Integer = -1;
  g_nMiniMapMaxMosX: Integer;
  g_nMiniMapMaxMosY: Integer;
  g_nMiniMapPath: TPath;
  g_boAutoMoveing: Boolean;
  g_boNpcMoveing: Boolean;
  g_dwClickNpcTick: LongWord = 0;
  g_nScriptGotoStr: string;
  g_nScriptGotoX: Integer;
  g_nScriptGotoY: Integer;

  g_MissionList: TList;
  g_MissionFlag: TMissionFlag;
  g_MissionInfoList: TList;
  g_MissionArithmometer: TMissionArithmometer;

  g_MissionDateStream: TMemoryStream;
  g_MapDescDateStream: TMemoryStream;

  g_OperateHintList: TStringList;
  g_nOperateHintIdx: Integer;
  g_dwOperateHintTick: LongWord;

  g_MapDescList: TList;
  g_MapDesc: pTMapDescList = nil;
  g_boAllLoadStream: Boolean;

  g_CompoundInfoList: TGStringList;
  
  g_FileVersionInfo: TFileVersionInfo;
  //NPC
  g_nCurMerchant            :Integer;
  g_nMDlgX                  :Integer;
  g_nMDlgY                  :Integer;
  g_dwChangeGroupModeTick   :LongWord;
  g_dwDealActionTick        :LongWord;
  g_dwAucActionTick         :LongWord;   //°æ¸Å½Ã°£
  g_dwRentalActionTick      :LongWord;   //´ë¿©½Ã°£
  g_dwQueryMsgTick          :LongWord;

  g_dwQueryMsgTick3         :LongWord;
  g_dwQueryMsgTick4         :LongWord;
  g_dwPetPickUp             :LongWord;
  g_nDupSelection           :Integer;
  g_dwChangeTigerSetTick    :LongWord;     //È£¶ûÀÌ
  g_TigerSet                :Boolean;      //È£¶ûÀÌ
  g_boHeroProtect: Boolean = False;
  g_dwRenewHeroHPTick: Longword;
  g_dwRenewHeroMPTick: Longword;

  BeltchekClick             :LongWord;  //¹°¾à °ü·Ã º§Æ®
  BeltchekHeroClick             :LongWord;  
  g_boAllowGroup            :Boolean;
  g_boCheckGroup            :Boolean = TRUE; //±×·ì
  g_boCheckHero             :Boolean = FALSE; //±×·ì¿µ¿õ
  g_GroupItemMode           :Boolean = False; //±×·ì ¾ÆÀÌÅÛ ¸ðµå

  g_nGameSetupData: LongWord;

  g_boHeroAiMode : byte;
  g_dwChangeAiModeTick: LongWord;
  //ÈËÎïÐÅÏ¢Ïà¹Ø
  g_nMySpeedPoint           :Integer; //Ãô½Ý
  g_nMyHitPoint             :Integer; //×¼È·
  g_nMyAntiPoison           :Integer; //Ä§·¨¶ã±Ü
  g_nMyPoisonRecover        :Integer; //ÖÐ¶¾»Ö¸´
  g_nMyHealthRecover        :Integer; //ÌåÁ¦»Ö¸´
  g_nMySpellRecover         :Integer; //Ä§·¨»Ö¸´
  g_nMyAntiMagic            :Integer; //Ä§·¨¶ã±Ü
  g_nMyLuckPoint            :Integer; //Çà¿îÇ¥½Ã

  g_nMyHeroSpeedPoint    : Integer; //Ãô½Ý
  g_nMyHeroHitPoint      : Integer; //×¼È·
  g_nMyHeroAntiPoison    : Integer; //Ä§·¨¶ã±Ü
  g_nMyHeroPoisonRecover : Integer; //ÖÐ¶¾»Ö¸´
  g_nMyHeroHealthRecover : Integer; //ÌåÁ¦»Ö¸´
  g_nMyHeroSpellRecover  : Integer; //Ä§·¨»Ö¸´
  g_nMyHeroAntiMagic     : Integer; //Ä§·¨¶ã±Ü
  g_nMyHeroLuckPoint     : Integer;
  g_nMyHeroHungryState   : Integer; //¼¢¶ö×´Ì¬

  g_wAvailIDDay             :Word;
  g_wAvailIDHour            :Word;
  g_wAvailIPDay             :Word;
  g_wAvailIPHour            :Word;

  g_MySelf                  :THumActor;
  g_MyHero                  :THumActor;
  g_UseItems                :array[0..MAXUSEITEM] of TClientItem;  //¾ÆÀÌÅÛ °¹¼ö
  g_ItemArr                 :array[0..MAXBAGITEMCL-1] of TClientItem;

  g_HeroUseItems            :array[0..MAXHEROUSEITEM] of TClientItem;
  g_HeroItemArr             :array[0..MAXHEROBAGITEM-1] of TClientItem;

  g_AutoPotItems            :TAutoPotItems;       //¿µ¿õ ÀÚµ¿¹°¾à

  MoveingItemIndex          :Integer;
  g_StoreItem               :array[0..MAXSTORAGEITEMCL-1] of TClientItem;
  g_HeroStoreItem           :array[0..MAXSTORAGEITEMCL-1] of TClientItem;
  g_ShopItem                :array[0..5] of TClientItem;   //È¯»óÁ¡
  G_BuyItem                 :array[0..MAXBUYITEM-1] of SBuyItem;   //»óÀÎ
  g_BankItem                :array[0..2] of TClientItem;

  g_boBagLoaded             :Boolean;
  g_boOptionLoaded          :Boolean; //¿É¼Ç ÀúÀå
  g_boServerChanging        :Boolean;

  g_AuctionItems            :array[0..9] of TAuctionItem;      //À§Å¹
  g_AuctionCurrPage         :Integer;
  g_AuctionAmountofPages    :Integer;
  g_AuctionCurrSection      :Integer;
  g_AuctionSortMode         :Integer;  //À§Å¹   1: °¡°ÝÅ«¼ø¼­(792) 2: °¡°Ý³·Àº¼ø¼­(794)

  g_DiceItems               :array[0..5] of TDiceGameItem;      //Ç÷·æ»óÀÚ
  CurrGame                  :Integer;
  FakeGame                  :Integer;
  TagItem                   :Integer;
  MaxGame                   :Integer;
  MainDiceimg               :integer;
  DiceimgIndex              :integer;
  TimeToDice                :integer;
  Diceimgtime               :longword;
  DiceStartTime             :longword;
  StartDice                 :Boolean;
  DiceRand                  :integer;
  SelectDice                :integer;
  Succecs                   :Boolean;
  DiceItemsrt               :String;

  g_WakeItems               :array[0..1] of TWakeItem;
  g_ItemWakeUp              :Integer; //¾ÆÀÌÅÛ°­È­

  HeroArr: array[0..3] of TSelHero;
  HeroIndex      : integer;

  g_ShopItems               :array[0..7] of TSeveShopItem;      //È¯»óÁ¡
  g_ShopCurrPage            :Integer;
  g_ShopAmountofPages       :Integer;
  g_ShopCurrSection         :Integer;
  g_ShopCurrJob             :Integer;
  g_ShopSort                :Boolean;  //È¯»óÁ¡
  g_ShopSortMode            :Integer;  //È¯»óÁ¡   1: °¡°ÝÅ«¼ø¼­(792) 2: °¡°Ý³·Àº¼ø¼­(794)

  g_ComStorageItem          :array[0..7] of TComStorageItem;      //°ø¿ëÃ¢°í
  g_GuildStorageItem        :array[0..49] of TGuildStorageItem;      //¹®ÆÄÃ¢°í

  g_RentalItem              :TRentalItem; //´ë¿©
  g_OwnerItem               :TOwnerItem; //´ë¿©

  g_PetInfo                 :array[0..4] of TPetInfo; //¿µ¹°
  //gt
  g_GTItems                 :array[0..9] of TClientGT;
  g_DecoItems               :array[0..11] of TDecoItem;
  g_BBSMsgList              :array[0..9] of TBBSMSG;        //Àå¿ø°Ô½ÃÆÇ
  g_GTCurrPage              :integer;
  g_GTTotalPage             :integer;
  g_GTAmountOnPage          :integer;
  g_DecoList                :TList;
  g_BBSMSG                  :String;
  g_BBSPoster               :String;
  g_MasterPost              :integer;
  //end of gt

  //¼üÅÌÏà¹Ø
  g_ToolMenuHook            :HHOOK;
  g_nLastHookKey            :Integer;
  g_dwLastHookKeyTime       :LongWord;


  g_nCaptureSerial          :Integer; //×¥Í¼ÎÄ¼þÃûÐòºÅ
  g_nSendCount              :Integer; //·¢ËÍ²Ù×÷¼ÆÊý
  g_nReceiveCount           :Integer; //½Ó¸Ä²Ù×÷×´Ì¬¼ÆÊý
  g_nTestSendCount          :Integer;
  g_nTestReceiveCount       :Integer;
  g_nSpellCount             :Integer; //Ê¹ÓÃÄ§·¨¼ÆÊý
  g_nSpellFailCount         :Integer; //Ê¹ÓÃÄ§·¨Ê§°Ü¼ÆÊý
  g_nFireCount              :Integer; //

  //ºÐÇØ
  g_DisassembleDlgItem      :TClientItem;
  g_DisassembleDlgItemWait  :TClientItem;
  g_sDisassemblePriceStr    :String;

  //ÀÏ¹ÝºÐÇØ
  g_DismantleDlgItem      :TClientItem;
  g_DismantleDlgItemWait  :TClientItem;
  g_sDismantlePriceStr    :String;

  //ÆÇ¸Å
  g_SellDlgItem             :TClientItem;
  g_SellDlgItemSellWait     :TClientItem;
  g_DealDlgItem             :TClientItem;
  g_RentalDlgItem           :TClientItem;

  //À§Å¹ ÆÇ¸Å¾ÆÀÌÅÛ
  g_MarketDlgItem           :TClientItem;
  g_MarketDlgItemSellWait   :TClientItem;

  MakingDlgItem: TClientItem;      //Á¦Á¶½ºÃÄ
  WakeUpDlgItem: TClientItem;

  g_boQueryPrice            :Boolean;
  g_boQuickSell             :Boolean;
  g_dwQueryPriceTime        :LongWord;
  g_sSellPriceStr           :String;


  Mensellidx                :Integer=0; //»óÀÎ
  Menboots                  :Integer=-1;   //»óÀÎ

  ComStorageboots           :Integer=-1;   //°ø¿ëÃ¢°í
  GuildStorageboots         :Integer=-1;   //¹®ÆÄÃ¢°í

  PetInfoBoots              :Integer=-1; //¿µ¹°

  g_GemItem1             :TClientItem;
  g_GemItem2             :TClientItem;
  g_GemItem3             :TClientItem;
  g_GemItem4             :TClientItem;
  g_GemItem5             :TClientItem;
  g_GemItem6             :TClientItem;

  //º¯È¯¿¬±¸
  g_ChangeItem1          :TClientItem;
  g_ChangeItem2          :TClientItem;
  g_ChangeItem3          :TClientItem;
  g_ChangeItem4          :TClientItem;
  g_ChangeItem5          :TClientItem;
  g_ChangeItem6          :TClientItem;


  G_UpWaponItem          :array[0..15] of TClientItem;    //Àç·Ã
  g_UpWapon              :TClientItem;   //Àç·Ã¹«±â
  g_UpWaponWait          :TClientItem;

  g_StartDate             :TDateTime;
  g_TotalDays             :Integer;
  g_MasterLevel           :byte;


  g_nExChangeGold         :Integer;
  g_nExChangeGameGold     :Integer;

  g_nExChgGoldRate        :Integer;   //È¯Àü ½Ã¼¼
  g_nExChgGameGoldRate    :double;   //È¯Àü ½Ã¼¼

  //°Å·¡
  g_DealItems               :array[0..9] of TClientItem;         //°Å·¡
  g_DealRemoteItems         :array[0..19] of TClientItem;
  g_nDealGold               :Integer;
  g_nDealRemoteGold         :Integer;
  g_boDealEnd               :Boolean;
  g_sDealWho                :String;  //°Å·¡ »ó´ë
  MakeItemArr: array[0..5] of TClientItem;      //Á¦Á¶½ºÃÄ

  //°æ¸Å
  g_ActionItems             :TClientItem;
  g_ActionItemWait          :TClientItem;
  n_ActionPrice             :Integer;
  n_AucPrice                :Integer;
  AuctionView               :Boolean = False;
  //g_AucMode                 :Integer;
  nAucItemIndex            :Integer;

  g_RentalItems             :TClientItem;         //´ë¿©
  g_RentalRemoteItems       :TClientItem;         //´ë¿©
  g_nRentalDay              :Integer;       //´ë¿©±â°£
  g_nRentalRemoteDay        :Integer;       //´ë¿©±â°£
  g_nRentalGold             :Integer;
  g_nRentalRemoteGold       :Integer;
  g_boRentalEnd             :Boolean;
  g_sRentalWho              :String;  //´ë¿© »ó´ë


  g_MouseItem               :TClientItem;
  g_MouseStateItem          :TClientItem;
  g_MouseUserStateItem      :TClientItem;

  g_boBagToStore            :Boolean;
  g_boStoreToBag            :Boolean;

  g_boItemMoving            :Boolean;  //ÕýÔÚÒÆ¶¯ÎïÆ·
  g_MovingItem              :TMovingItem;
  g_WaitingUseItem          :TMovingItem;
  g_FocusItem               :pTDropItem;

  g_MagicItem               :pTClientMagic;    //¹«°øÁ¤º¸

  UNITY                     :Integer = 32;
  g_boViewFog               :Boolean;
  g_boForceNotViewFog       :Boolean = FALSE;  // ¹ã³·¼³Á¤ 2009-03-25
  g_nDayBright              :Integer;
  g_nAreaStateValue         :Integer;  //°ø¼º

  g_boNoDarkness            :Boolean;
  g_nRunReadyCount          :Integer; //´Þ¸®±â °¡¿îÆ®

  g_EatingItem              :TClientItem;
  g_dwEatTime               :LongWord; //timeout...
  g_dwEatOpTime             :LongWord;    //¹°¾à
  g_HeroEatingItem          :TClientItem;
  g_dwHeroEatTime           :LongWord; //timeout...
  g_dwEatHeroOpTime         :LongWord;

  g_dwDizzyDelayStart       :LongWord;
  g_dwDizzyDelayTime        :LongWord;

  g_boDoFadeOut             :Boolean;
  g_boDoFadeIn              :Boolean;
  g_nFadeIndex              :Integer;
  g_boDoFastFadeOut         :Boolean;

  g_boAutoDig               :Boolean;  //°î±ªÀÌÁú
  g_boSelectMyself          :Boolean;  //Êó±êÊÇ·ñÖ¸µ½×Ô¼º

  //ÓÎÏ·ËÙ¶È¼ì²âÏà¹Ø±äÁ¿
  g_dwFirstServerTime       :LongWord;
  g_dwFirstClientTime       :LongWord;
  //ServerTimeGap: int64;
  g_nTimeFakeDetectCount    :Integer;
  g_dwSHGetTime             :LongWord;
  g_dwSHTimerTime           :LongWord;
  g_nSHFakeCount            :Integer;   //¼ì²é»úÆ÷ËÙ¶ÈÒì³£´ÎÊý£¬Èç¹û³¬¹ý4´ÎÔòÌáÊ¾ËÙ¶È²»ÎÈ¶¨
  SHHitSpeedCount           :integer;

  g_dwLatestClientTime2     :LongWord;
  g_dwFirstClientTimerTime  :LongWord; //timer
  g_dwLatestClientTimerTime :LongWord;
  g_dwFirstClientGetTime    :LongWord; //gettickcount
  g_dwLatestClientGetTime   :LongWord;
  g_nTimeFakeDetectSum      :Integer;
  g_nTimeFakeDetectTimer    :Integer;

  g_dwLastestClientGetTime  :LongWord;

//Íâ¹Ò¹¦ÄÜ±äÁ¿¿ªÊ¼
  g_dwDropItemFlashTime  :LongWord = 5 * 1000; //µØÃæÎïÆ·ÉÁÊ±¼ä¼ä¸ô
  g_nHitTime             :Integer  = 1400;  //°ø°Ý¼Óµµ
  g_nItemSpeed           :Integer  = 60;    //°ø°Ý¼Óµµ ¾ÆÀÌÅÛ
  g_dwSpellTime          :LongWord = 500;  //Ä§·¨¹¥¼ä¸ôÊ±¼ä

  g_boItemHint           :Boolean = True; //¾ÆÀÌÅÛ ¼¼ºÎÈùÆ® º¸±â
  g_bobuttHint           :Boolean = True;
  g_boSetHint            :Boolean = True;
  g_DeathColorEffect     :TColorEffect = ceGrayScale;
  g_boClientCanSet       :Boolean  = True;
  g_boCanRunHuman        :Boolean  = False;
  g_boCanRunMon          :Boolean  = False;
  g_boCanRunNpc          :Boolean  = False;
  g_boCanRunAllInWarZone :Boolean  = False;
  g_boCanStartRun        :Boolean  = False; //´Þ¸®±â ½ÃÀÛ  //ÁúÁÖ?
  m_btGroupMsg           :Boolean  = False; //±×·ì È¹µæ ¸Þ½ÃÁö
  g_boParalyCanRun       :Boolean  = False;//Âé±ÔÊÇ·ñ¿ÉÒÔÅÜ
  g_boParalyCanWalk      :Boolean  = False;//Âé±ÔÊÇ·ñ¿ÉÒÔ×ß
  g_boParalyCanHit       :Boolean  = False;//Âé±ÔÊÇ·ñ¿ÉÒÔ¹¥»÷
  g_boParalyCanSpell     :Boolean  = False;//Âé±ÔÊÇ·ñ¿ÉÒÔÄ§·¨
  g_boShowJobLevel       :Boolean  = True; //ÏÔÊ¾Ö°ÒµµÈ¼¶
  g_boMagicLock          :Boolean  = False; //Ä§·¨Ëø¶¨
  g_boAutoPuckUpItem     :Boolean  = False;

  g_Npcbookinx           :Integer=-1;
  m_nStorageMode         :integer;
  m_Storemode            :integer;

  g_boShowHumanInfo      :Boolean  = True;
  g_boShowMonsterInfo    :Boolean  = False;
  g_boShowNpcInfo        :Boolean  = False;
//Íâ¹Ò¹¦ÄÜ±äÁ¿½áÊø
  g_dwAutoPickupTick     :LongWord;
  g_dwAutoPickupTime     :LongWord = 50; //×Ô¶¯¼ñÎïÆ·¼ä¸ô
  g_AutoPickupList       :TList;
  g_QuestMsgList: TList;
  g_ClientCheckMsg: pTClientCheckMsg = nil;
  g_MagicLockActor       :TActor;
  g_boNextTimePowerHit   :Boolean;
  g_boCanLongHit         :Boolean;
  g_boCanTaguHit         :Boolean;
  g_boCanWideHit         :Boolean;
  g_boCanCrsHit          :Boolean;
  g_boCanNanCrsHit       :Boolean;
  g_boCanTwnHit          :Boolean;
  g_boCanThwnHit         :Boolean;
  g_boFireShHit          :Boolean;
  g_boNextTimeFireHit    :Boolean;
  g_boNextTimeDeathHit   :Boolean;
  g_boCanWBHit           :Boolean;      //Ç³°Ë¼ú
  g_boCanCrsBHit         :Boolean;

  g_ShowItemList         :TGList;
  g_boShowAllItem        :Boolean = True;    //¹Ù´Ú ¾ÆÀÌÅÛ ÀÌ¸§

  g_boDrawDropItem       :Boolean = True;

  g_boVerticalBelt       :Boolean = False;
  g_boVerticaHerolBelt       :Boolean = False;
  g_boModeC              :Integer = 0;
  g_boChatModeTrens      :Boolean = False;  //Ã¤ÆÃÃ¢ ¸ðµå
  g_boMarkMode           :Integer = 0;  //¹®ÆÄ ¸¶Å© ¸ðµå

  g_boShowHealth         :Boolean = True;

  Append2Tick             :LongWord;

  //°¢¼º
  g_ItemWakeUpDlgItem       :TClientItem;
  g_ItemWakeUpDlgItemWait   :TClientItem;
  g_sItemWakeUpPriceStr     :Integer;
  WakeUpItemArr             :array[0..1] of TClientItem;
  g_ItemWakeUpList: TStringList;

  g_SetItemsList: TList;

  g_ExtractStringList: TStringList;
  g_MagicDescList: TGStringList;
  g_ItemDescList: TGStringList;

  //-------»óÀÎ-------
  Npcoutindex            :Integer=0;
  NewstrmD               :string;
  MDlgStr                :string;
  RequireAddPoints: Boolean;
  MenuTop: integer;
  //-----------------

  //=========°æ¸Å  ========================
  g_AucItems   :TAucItem;

  //=========°³ÀÎ»óÁ¡  ========================
  g_StoreItems: array[0..14] of TStoreItem;
  g_StoreRemoteItems: array[0..14] of TStoreItem;
  g_SelectStoreItem: TStoreItem;

  g_boStartStoreing: Boolean = False;
  g_WaitingStoreItem: TMovingItem;
  g_sStoreMasterName: string = '';
  g_nStoreMasterRecogId: Integer = 0;
  g_dwStartStoreTick: LongWord;
  g_dwQueryStoreTick: LongWord;
 //==================================================

  g_boDeathMatch: Boolean = False;
  g_boPKZONE: Boolean = False;
  g_DrawSnowTick: array[0..12 - 1] of TDrawEffect;    //´«¿À´ÂÀÌÆå
  g_boSnow: Boolean = False;   //´«¿À´ÂÀÌÆå
  g_nSnowLev: Integer = 0;    //´«¿À´ÂÀÌÆå

  g_DrawFlowerTick: array[0..12 - 1] of TDrawEffect;    //²É³»¸®´ÂÀÌÆå
  g_boFlower: Boolean = False;   //²É³»¸®´ÂÀÌÆå

  g_SnowFlakeTick: array[0..500] of Integer;
  g_SnowFlakeStartTick: array[0..500] of Integer;
  g_SnowStart: Array[0..500] of Boolean;
  g_SnowFlakeX: array[0..500] of Integer;
  g_SnowFlakeY: array[0..500] of Integer;
  g_NewSnowX: Array[0..500] of Integer;
  g_NewSnowY: Array[0..500] of Integer;
  g_NewSnowYSpeed: Array[0..500] of Integer;
  g_SnowFlakeImage: Array [0..500] of TDirectDrawSurface;

  LoginImages     : Boolean = True;

  g_nSoundInt     : Integer = 0;        //½ºÃÄ »ç¿îµå

  g_boClose: Boolean = False;
  g_boCanDraw: Boolean = True;
  boSizeMove: Boolean = False;
  boInFocus: Boolean = True;

  g_nTestX:Integer = 71;
  g_nTestY:Integer = 212;
  g_CompoundSet: TCompoundSet;
  //¿µ¿õ
  g_dwRecallHeroTick: LongWord = 0;

  procedure LoadWMImagesLib(AOwner: TComponent);
  procedure InitWMImagesLib(DDxDraw: TDxDraw);
  procedure UnLoadWMImagesLib();
  function  GetObjsEx (nUnit,nIdx:Integer; var px, py: integer): TDirectDrawSurface;
  function  GetSObjsEx (nUnit,nIdx:Integer; var px, py: integer): TDirectDrawSurface;
  function  GetMonImg (nAppr:Integer):TWMImages;
  function  GetMonAction (nAppr:Integer):pTMonsterAction;
  function  GetJobName (nJob:Integer):String;
  function  GetHeroGradeName (nGrade:Integer):String;
  function GetsexName(sex: Integer): string;
  function GetScreenX(X:Integer): Integer;
  function GetScreenY(Y:Integer): Integer;
  function GetScreenY2(Y:Integer): Integer;
  procedure ClearShowItemList();
  function  GetItemType(ItemType:TItemType):String;
  function  GetShowItem(sItemName:String):pTShowItem;

  procedure CheckUseFish;    //³¬½Ã ¸± ±â´É
  function CheckFishItemIdx:Integer;    //³¬½Ã ³¬À» Å¸ÀÌ¹Ö Á¦°ø   ÀÔÁú
  procedure StartFishing;   //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
  procedure ExitFishing;   //³¬½Ã °­Á¦ Á¾·á
  procedure BitingFishExit;   //³¬½Ã ÀÔÁú ÀÚµ¿ Ã¨Áú Á¾·á
  procedure IncFishSuccess;     //³¬½Ã Ãß°¡ ¼º°ø·ü
  function CheckFishSuccess:integer;     //³¬½Ã ¼º°ø·ü
  function GetHumUseItemByBagItem(nStdMode: Integer): Integer;
  function GetHeroUseItemByBagItem(nStdMode: Integer): Integer;
  function GetStorePriceName(btType: Byte): string;  //°³ÀÎ»óÁ¡

  function FindPath(StartX, StartY, StopX, StopY: Integer): TPath; overload;
  function FindPath(StopX, StopY: Integer): TPath; overload;
  procedure DynArrayDelete(var A; elSize: Longint; index, Count: Integer);
  procedure ScriptGoto(sCmd: string);
  procedure GotoClickNpc(nX, nY: Integer);
  procedure ClearMissionList();
  procedure LoadMissionList(const StringList: TStringList);
  function GetMissionInfo(sMissionName: string): pTClientMission;
  function GetMissionFlagStatus(nFlag: Integer): Integer;

  procedure LoadMagicDescList;
  procedure UnLoadMagicDescList;
  function GetMagicDesc(sItemName: string): string;
  function GetMagicImages(typeimage: integer): TWMImages;
  function GetMagic2Images(typeimage: integer): TWMImages;
  procedure ClearGroupMember(boHint: Boolean = False; Hint: byte = 0; sys:string = '');

  procedure LoadItemDescList;
  procedure UnLoadItemDescList;
  function GetItemDesc(sItemName: string): string;
  function  CheckCanWakeUp(Item:TClientItem):Boolean;    //°¢¼º °¡´É¿©ºÎÈ®ÀÎ
  function  CheckCanDeal(Item:TClientItem):Boolean;    //°Å·¡ °¡´É¿©ºÎÈ®ÀÎ
  function  CheckCanSell(Item:TClientItem):Boolean;   //ÆÇ¸Å °¡´É¿©ºÎÈ®ÀÎ
  function  CheckUpwaionmode(mode:Integer):Boolean;    //Àç·Ã
  function  CheckUpWeapon(mode:Integer):Boolean;    //Àç·Ã
  function  CheckItemMode(mouseItem,dobItem:TClientItem):Boolean; //¹°¾à
  function  Checkkeyamount(amount:String):Boolean; //¹°¾à
  procedure LoadUserConfig(sUserName:String);
  procedure SaveUserConfig(sUserName:String);
  procedure SendClientMessage(msg, Recog, param, tag, series: integer; sMsg: String = '');
  procedure SendClientMessage2(msg, Recog, param, tag, series: integer; str: string);
  procedure SendClientSocket(Msg, Recog, param, tag, series: Integer; pszMsg: string = '');
  procedure stringtolists(str:string; cra:Char; onid,outid:Integer; var str1:string);
  function StrCountToInteger(str:string;cra:Char):Integer;

  procedure SelHeroNewJob(job: Integer);
  procedure SelHeroNewm_btSex(sex: Integer);
  procedure SelectHero(Index: Integer);

  function ZIPDecompress(const InBuf: Pointer; InBytes: Integer; OutEstimate: Integer; out OutBuf: PChar): Integer;
  function GetCompoundInfos(const sItemName: string): pTCompoundInfos;

  function GetMapDescList(sMapName: string): pTMapDescList;
  procedure LoadMapDescList(const StringList: TStringList);
  procedure ClearMapDescList();
  procedure PetOption(datat:string);
implementation
uses FState, HUtil32,clMain,EDCode;



procedure PetOption(datat:string); //¿µ¹°¿É¼Ç
var
  infostr : String;
  temp:     string;
begin
  datat := GetValidStr3(Datat, infostr, ['/']);
  if infostr <> '' then begin
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemAll := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemGold := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemWeapon := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemDress := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemHelmet := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemBoots := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemBelt := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemAccessory := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     g_boItemEtc := StrToInt(temp);
  end;
end;


procedure SelHeroNewJob(job: Integer);
begin
  if (job in [0..4]) and (HeroArr[HeroIndex].UserChr.job <> job) then begin
    HeroArr[HeroIndex].UserChr.job := job;
    SelectHero(HeroIndex);
  end;
end;

procedure SelHeroNewm_btSex(sex: Integer);
begin
  if sex <> HeroArr[HeroIndex].UserChr.sex then begin
    HeroArr[HeroIndex].UserChr.sex := sex;
    SelectHero(HeroIndex);
  end;
end;

procedure SelectHero(Index: Integer);
begin
  HeroArr[Index].Selected := True;
  HeroArr[Index].DarkLevel := 30;
  HeroArr[Index].AniIndex := 0;
  HeroArr[Index].StartTime := GetTickCount;
  HeroArr[Index].moretime := GetTickCount;
  case Index of
    0: begin
      HeroArr[1].Selected := False;
      HeroArr[2].Selected := False;
      HeroArr[3].Selected := False;
    end;
    1: begin
      HeroArr[0].Selected := False;
      HeroArr[2].Selected := False;
      HeroArr[3].Selected := False;
    end;
    2: begin
      HeroArr[1].Selected := False;
      HeroArr[0].Selected := False;
      HeroArr[3].Selected := False;
    end;
    3: begin
      HeroArr[1].Selected := False;
      HeroArr[2].Selected := False;
      HeroArr[0].Selected := False;
    end;
  end;
end;

procedure SendClientMessage(msg, Recog, param, tag, series: integer; sMsg: String = '');
var
   dmsg: TDefaultMessage;
begin
   dmsg := MakeDefaultMsg (msg, Recog, param, tag, series);
   if sMsg = '' then frmMain.SendSocket(EncodeMessage(dmsg))
   else frmMain.SendSocket(EncodeMessage(dmsg) + EncodeString(sMsg));
end;

procedure SendClientMessage2 (msg, Recog, param, tag, series: integer; str: string);
var
   dmsg: TDefaultMessage;
begin
   dmsg := MakeDefaultMsg (msg, Recog, param, tag, series);
   frmMain.SendSocket (EncodeMessage (dmsg) + EncodeString(str) );
end;

procedure SendClientSocket(Msg, Recog, param, tag, series: Integer; pszMsg: string = '');
var
  dmsg: TDefaultMessage;
begin
  dmsg := MakeDefaultMsg(Msg, Recog, param, tag, series);
  if pszMsg <> '' then
    frmMain.SendSocket(EncodeMessage(dmsg) + pszMsg)
  else
    frmMain.SendSocket(EncodeMessage(dmsg));
end;

procedure LoadWMImagesLib(AOwner: TComponent);
var
  I:Integer;
begin
  g_WMainImages        := TWMImages.Create(AOwner);
  g_WMain2Images       := TWMImages.Create(AOwner);
  g_WMain3Images       := TWMImages.Create(AOwner);
  g_WGuildImages       := TWMImages.Create(AOwner);
  g_WTitleImages       := TWMImages.Create(AOwner);
  g_WAresImages        := TWMImages.Create(AOwner);
  g_WFaceImages        := TWMImages.Create(AOwner);
  g_WBuffIconImages    := TWMImages.Create(AOwner);
  g_WNewLoginImages    := TWMImages.Create(AOwner);
  g_WNewChrSelImages   := TWMImages.Create(AOwner);
  g_WHeroChrSelImg     := TWMImages.Create(AOwner);
  g_WChrSelImages      := TWMImages.Create(AOwner);
  g_WGSkillImages      := TWMImages.Create(AOwner);      //¹®ÆÄ¼ºÀå
  g_WMMapImages        := TWMImages.Create(AOwner);
  g_WFMMapImages       := TWMImages.Create(AOwner);
  g_WSMMapImages       := TWMImages.Create(AOwner);
  g_WMMapMir3Images    := TWMImages.Create(AOwner);
  g_WTilesImages       := TWMImages.Create(AOwner);
  g_WSmTilesImages     := TWMImages.Create(AOwner);
  g_WAniImages         := TWMImages.Create(AOwner);
  WMon42Img            := TWMImages.Create(AOwner);
  g_WHumWingImages     := TWMImages.Create(AOwner);
  g_WWeapon_Effect     := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Assassin_Left  := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Assassin_Right := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Common         := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Killer_Left    := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Killer_Right   := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Monk           := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Warrior        := TWMImages.Create(AOwner);
  g_WWeapon_Effect_Wizard         := TWMImages.Create(AOwner);
  g_WWeapon_Bonze_Effect          := TWMImages.Create(AOwner);
  g_WHumEffectImages   := TWMImages.Create(AOwner);
  g_WHumWing_KillerImages     := TWMImages.Create(AOwner);       //ÀÚ°´ ÀÌÆÑÆ®
  g_WHumWing_BonzeImages     := TWMImages.Create(AOwner);
  g_WUpCom_EfImages  := TWMImages.Create(AOwner);
  g_WUpWarr_EfImages  := TWMImages.Create(AOwner);
  g_WUpWiz_EfImages  := TWMImages.Create(AOwner);
  g_WUpMonk_EfImages  := TWMImages.Create(AOwner);
  g_WUpAssa_EfImages := TWMImages.Create(AOwner);


  g_WBagItemImages     := TWMImages.Create(AOwner);
  g_WStateItemImages   := TWMImages.Create(AOwner);       //»óÅÂÃ¢ ±âº»
  g_WStateItemComManImages   := TWMImages.Create(AOwner);       //»óÅÂÃ¢ µî¼± °ø¿ë ³²ÀÚ
  g_WStateItemComWomanImages   := TWMImages.Create(AOwner);       //»óÅÂÃ¢ µî¼± °ø¿ë ¿©ÀÚ
  g_WStateItemWarrManImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
  g_WStateItemWarrWoImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©)
  g_WStateItemWizManImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
  g_WStateItemWizWoImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
  g_WStateItemMonkManImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
  g_WStateItemMonkWoImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
  g_WStateItemAssManImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
  g_WStateItemAssWoImages   := TWMImages.Create(AOwner); //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)
  g_WState_Eff_BImages     := TWMImages.Create(AOwner);

  g_WState_Eff                   := TWMImages.Create(AOwner);
  g_WState_Eff_Assassin_Man      := TWMImages.Create(AOwner);
  g_WState_Eff_Assassin_Woman    := TWMImages.Create(AOwner);
  g_WState_Eff_Common_Man        := TWMImages.Create(AOwner);
  g_WState_Eff_Common_Woman      := TWMImages.Create(AOwner);
  g_WState_Eff_Monk_Man          := TWMImages.Create(AOwner);
  g_WState_Eff_Monk_Woman        := TWMImages.Create(AOwner);
  g_WState_Eff_Warrior_Man       := TWMImages.Create(AOwner);
  g_WState_Eff_Warrior_Woman     := TWMImages.Create(AOwner);
  g_WState_Eff_Wizard_Man        := TWMImages.Create(AOwner);
  g_WState_Eff_Wizard_Woman      := TWMImages.Create(AOwner);

  g_WTransFormImages   := TWMImages.Create(AOwner); //º¯½ÅÅ»
  g_WTransFormEffectImages   := TWMImages.Create(AOwner); //º¯½ÅÅ»
  g_WTransFormWeaponEffectImages  := TWMImages.Create(AOwner);
  g_WDnItemImages      := TWMImages.Create(AOwner);
  g_WHumImgImages      := TWMImages.Create(AOwner);
  g_WHum2ImgImages     := TWMImages.Create(AOwner);
  g_WHum3ImgImages     := TWMImages.Create(AOwner);
  g_WHum4ImgImages     := TWMImages.Create(AOwner);
  g_WHum_BonzeImgImages  := TWMImages.Create(AOwner);
  g_WHum_CommonImgImages := TWMImages.Create(AOwner); //µî¼±±âº»
  g_WTigerImgImages    := TWMImages.Create(AOwner); //È£¶ûÀÌ
  g_WTigerUpImgImages    := TWMImages.Create(AOwner); //µî¼± È£¶ûÀÌ
  g_WHum_KillerImgImages     := TWMImages.Create(AOwner);  //ÀÚ°´
  g_WHum_Killer2ImgImages     := TWMImages.Create(AOwner);  //ÀÚ°´ // g_WHum_Archer_CommonImg     := TWMImages.Create(AOwner);
  g_WHum_Killer4ImgImages     := TWMImages.Create(AOwner);
  g_WHumUp_WarrImgImages     := TWMImages.Create(AOwner);  //º®Ç÷Àü»ç
  g_WHumUp_WizImgImages     := TWMImages.Create(AOwner);  //È«Çö¼ú»ç
  g_WHumUp_MonkImgImages     := TWMImages.Create(AOwner);  //ÀÍ¼±µµ»ç
  g_WHumUp_AssassinImgImages     := TWMImages.Create(AOwner);  //ºñ¿¬ÀÚ°´
  g_WHairImgImages     := TWMImages.Create(AOwner);
  g_WHairComImgImages     := TWMImages.Create(AOwner);
  g_WHair_KillerImgImages     := TWMImages.Create(AOwner);   //ÀÚ°´ ¸Ó¸®
  g_WHair_WarriorUpImgImages     := TWMImages.Create(AOwner);   //º®Ç÷Àü»ç ¸Ó¸®
  g_WHair_WizardUpImgImages     := TWMImages.Create(AOwner);   //È«Çö¼ú»ç¸Ó¸®
  g_WHair_MonkUpImgImages     := TWMImages.Create(AOwner);   //ÀÍ¼±µµ»ç ¸Ó¸®
  g_WHair_AssassinImgImages     := TWMImages.Create(AOwner);   //ºñ¿¬ÀÚ°´ ¸Ó¸®

  g_Fishing1Images       := TWMImages.Create(AOwner); //³¬½Ã
  g_Fishing2Images       := TWMImages.Create(AOwner); //³¬½Ã

  g_WHorseImgImages    := TWMImages.Create(AOwner);

  g_WWeaponImages      := TWMImages.Create(AOwner);
  g_WWeapon_CommImages      := TWMImages.Create(AOwner);     //µî¼±¹«±â
  g_WWeapon_BonzeImages     := TWMImages.Create(AOwner);
  g_WWeapon_Killer_RightImages := TWMImages.Create(AOwner);    //ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Killer_LeftImages := TWMImages.Create(AOwner);    //ÀÚ°´ ¿Þ¼Õ
  g_WWeapon_WarrImages := TWMImages.Create(AOwner);    //º®Ç÷Àü»ç ¹«±â
  g_WWeapon_WizImages := TWMImages.Create(AOwner);    //È«Çö¼ú»ç   ¹«±â
  g_WWeapon_MonkImages := TWMImages.Create(AOwner);    //ÀÍ¼±µµ»ç  ¹«±â
  g_WWeapon_Assassin_RightImages := TWMImages.Create(AOwner);    //ºñ¿¬ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Assassin_LeftImages := TWMImages.Create(AOwner);    //ºñ¿¬ÀÚ°´ ¿Þ¼Õ
  g_WMagIconImages     := TWMImages.Create(AOwner);
  g_WMagIcon2Images    := TWMImages.Create(AOwner);
  g_WMagNewIconImages  := TWMImages.Create(AOwner);
  g_WMagNewIcon2Images := TWMImages.Create(AOwner);
  g_WNpcImgImages      := TWMImages.Create(AOwner);
  g_WNewNpcImages      := TWMImages.Create(AOwner);
  g_WMagicImages       := TWMImages.Create(AOwner);
  g_WMagic0Images      := TWMImages.Create(AOwner);
  g_WMagic2Images      := TWMImages.Create(AOwner);
  g_WMagic3Images      := TWMImages.Create(AOwner);
  g_WMagic4Images      := TWMImages.Create(AOwner);
  g_WMagicNewImages    := TWMImages.Create(AOwner);
  g_WMagicUpImages     := TWMImages.Create(AOwner);
  g_WMagic_BonzeImages := TWMImages.Create(AOwner);
  g_WDecoImages        := TWMImages.Create(AOwner);
  g_WPetImg            := TWMImages.Create(AOwner);
  g_WDragonImg         := TWMImages.Create(AOwner);
  g_WEffectImg         := TWMImages.Create(AOwner);
  g_WKuLouImages       := TWMImages.Create(AOwner);
  for I := 0 To 71 do begin
    g_EiTiteArr[i]     := TWMImages.Create(AOwner);
  end;
  for I := 0 To 7 do begin
    g_wSTiles[i]     := TWMImages.Create(AOwner);
  end;
  for I := 0 To 8 do begin
    g_WSSmTiles[i]     := TWMImages.Create(AOwner);
  end;
  FillChar(g_WObjectArr,SizeOf(g_WObjectArr),0);
  FillChar(g_WSObjectArr,SizeOf(g_WSObjectArr),0);
  FillChar(g_WMonImagesArr,SizeOf(g_WMonImagesArr),0);
end;

procedure InitWMImagesLib(DDxDraw: TDxDraw);
var
  sFileName:String;
  I:Integer;
begin
  g_WMainImages.DxDraw    := DDxDraw;
  g_WMainImages.DDraw     := DDxDraw.DDraw;
  g_WMainImages.FileName  := MAINIMAGEFILE;
  g_WMainImages.LibType   := ltUseCache;
  g_WMainImages.Initialize;

  g_WMain2Images.DxDraw   := DDxDraw;
  g_WMain2Images.DDraw    := DDxDraw.DDraw;
  g_WMain2Images.FileName := MAINIMAGEFILE2;
  g_WMain2Images.LibType  := ltUseCache;
  g_WMain2Images.Initialize;

  g_WMain3Images.DxDraw   := DDxDraw;
  g_WMain3Images.DDraw    := DDxDraw.DDraw;
  g_WMain3Images.FileName := MAINIMAGEFILE3;
  g_WMain3Images.LibType  := ltUseCache;
  g_WMain3Images.Initialize;

  g_WGuildImages.DxDraw   := DDxDraw;
  g_WGuildImages.DDraw    := DDxDraw.DDraw;
  g_WGuildImages.FileName := GUILDMARK;
  g_WGuildImages.LibType  := ltUseCache;
  g_WGuildImages.Initialize;

  g_WTitleImages.DxDraw   := DDxDraw;
  g_WTitleImages.DDraw    := DDxDraw.DDraw;
  g_WTitleImages.FileName := TITLEIMAGEFILE;
  g_WTitleImages.LibType  := ltUseCache;
  g_WTitleImages.Initialize;

  g_WAresImages.DxDraw   := DDxDraw;
  g_WAresImages.DDraw    := DDxDraw.DDraw;
  g_WAresImages.FileName := SNOOPYIMAGEFILE;
  g_WAresImages.LibType  := ltUseCache;
  g_WAresImages.Initialize;

  g_WFaceImages.DxDraw   := DDxDraw;
  g_WFaceImages.DDraw    := DDxDraw.DDraw;
  g_WFaceImages.FileName := FACEFILE;
  g_WFaceImages.LibType  := ltUseCache;
  g_WFaceImages.Initialize;

  g_WBuffIconImages.DxDraw   := DDxDraw;
  g_WBuffIconImages.DDraw    := DDxDraw.DDraw;
  g_WBuffIconImages.FileName := BUFFICONFILE;
  g_WBuffIconImages.LibType  := ltUseCache;
  g_WBuffIconImages.Initialize;

  g_WNewChrSelImages.DxDraw   := DDxDraw;
  g_WNewChrSelImages.DDraw    := DDxDraw.DDraw;
  g_WNewChrSelImages.FileName := NEWCHRSELIMAGEFILE;
  g_WNewChrSelImages.LibType  := ltUseCache;
  g_WNewChrSelImages.Initialize;

  g_WHeroChrSelImg.DxDraw   := DDxDraw;
  g_WHeroChrSelImg.DDraw    := DDxDraw.DDraw;
  g_WHeroChrSelImg.FileName := HEROCHRSELIMAGEFILE;
  g_WHeroChrSelImg.LibType  := ltUseCache;
  g_WHeroChrSelImg.Initialize;


  g_WNewLoginImages.DxDraw   := DDxDraw;
  g_WNewLoginImages.DDraw    := DDxDraw.DDraw;
  g_WNewLoginImages.FileName := NEWLOGINIMAGEFILE;
  g_WNewLoginImages.LibType  := ltUseCache;
  g_WNewLoginImages.Initialize;

  g_WChrSelImages.DxDraw   := DDxDraw;
  g_WChrSelImages.DDraw    := DDxDraw.DDraw;
  g_WChrSelImages.FileName := CHRSELIMAGEFILE;
  g_WChrSelImages.LibType  := ltUseCache;
  g_WChrSelImages.Initialize;

  g_WGSkillImages.DxDraw   := DDxDraw;
  g_WGSkillImages.DDraw    := DDxDraw.DDraw;
  g_WGSkillImages.FileName := GSKILLIMAGEFILE;
  g_WGSkillImages.LibType  := ltUseCache;
  g_WGSkillImages.Initialize;

  g_WMMapImages.DxDraw     := DDxDraw;
  g_WMMapImages.DDraw      := DDxDraw.DDraw;
  g_WMMapImages.FileName   := MINMAPIMAGEFILE;
  g_WMMapImages.LibType    := ltUseCache;
  g_WMMapImages.Initialize;

  g_WFMMapImages.DxDraw    := DDxDraw;
  g_WFMMapImages.DDraw      := DDxDraw.DDraw;
  g_WFMMapImages.FileName   := FMMAPIMAGEFILE;
  g_WFMMapImages.LibType    := ltUseCache;
  g_WFMMapImages.Initialize;

  g_WMMapMir3Images.DxDraw    := DDxDraw;
  g_WMMapMir3Images.DDraw      := DDxDraw.DDraw;
  g_WMMapMir3Images.FileName   := MINIMAP3IMAGEFILE;
  g_WMMapMir3Images.LibType    := ltUseCache;
  g_WMMapMir3Images.Initialize;

  g_WSMMapImages.DxDraw    := DDxDraw;
  g_WSMMapImages.DDraw      := DDxDraw.DDraw;
  g_WSMMapImages.FileName   := SMMAPIMAGEFILE;
  g_WSMMapImages.LibType    := ltUseCache;
  g_WSMMapImages.Initialize;

  g_WTilesImages.DxDraw    := DDxDraw;
  g_WTilesImages.DDraw     := DDxDraw.DDraw;
  g_WTilesImages.FileName  := TITLESIMAGEFILE;
  g_WTilesImages.LibType   := ltUseCache;
  g_WTilesImages.Initialize;

  g_WSmTilesImages.DxDraw   := DDxDraw;
  g_WSmTilesImages.DDraw    := DDxDraw.DDraw;
  g_WSmTilesImages.FileName := SMLTITLESIMAGEFILE;
  g_WSmTilesImages.LibType  := ltUseCache;
  g_WSmTilesImages.Initialize;

  g_WHumWingImages.DxDraw   := DDxDraw;
  g_WHumWingImages.DDraw    := DDxDraw.DDraw;
  g_WHumWingImages.FileName := HUMWINGIMAGESFILE;
  g_WHumWingImages.LibType  := ltUseCache;
  g_WHumWingImages.Initialize;

  g_WWeapon_Effect.DxDraw   := DDxDraw;
  g_WWeapon_Effect.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect.FileName := WEAPONEFFECTFILE;
  g_WWeapon_Effect.LibType  := ltUseCache;
  g_WWeapon_Effect.Initialize;

  g_WWeapon_Effect_Assassin_Left.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Assassin_Left.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Assassin_Left.FileName := WEAPONEFFECT_Assassin_LFILE;
  g_WWeapon_Effect_Assassin_Left.LibType  := ltUseCache;
  g_WWeapon_Effect_Assassin_Left.Initialize;

  g_WWeapon_Effect_Assassin_Right.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Assassin_Right.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Assassin_Right.FileName := WEAPONEFFECT_Assassin_RFILE;
  g_WWeapon_Effect_Assassin_Right.LibType  := ltUseCache;
  g_WWeapon_Effect_Assassin_Right.Initialize;

  g_WWeapon_Effect_Common.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Common.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Common.FileName := WEAPONEFFECT_CommonFILE;
  g_WWeapon_Effect_Common.LibType  := ltUseCache;
  g_WWeapon_Effect_Common.Initialize;

  g_WWeapon_Effect_Killer_Left.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Killer_Left.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Killer_Left.FileName := WEAPONEFFECT_Killer_LFILE;
  g_WWeapon_Effect_Killer_Left.LibType  := ltUseCache;
  g_WWeapon_Effect_Killer_Left.Initialize;

  g_WWeapon_Effect_Killer_Right.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Killer_Right.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Killer_Right.FileName := WEAPONEFFECT_Killer_RFILE;
  g_WWeapon_Effect_Killer_Right.LibType  := ltUseCache;
  g_WWeapon_Effect_Killer_Right.Initialize;

  g_WWeapon_Effect_Monk.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Monk.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Monk.FileName := WEAPONEFFECT_MonkFILE;
  g_WWeapon_Effect_Monk.LibType  := ltUseCache;
  g_WWeapon_Effect_Monk.Initialize;

  g_WWeapon_Effect_Warrior.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Warrior.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Warrior.FileName := WEAPONEFFECT_WarriorFILE;
  g_WWeapon_Effect_Warrior.LibType  := ltUseCache;
  g_WWeapon_Effect_Warrior.Initialize;

  g_WWeapon_Effect_Wizard.DxDraw   := DDxDraw;
  g_WWeapon_Effect_Wizard.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Effect_Wizard.FileName := WEAPONEFFECT_WizardFILE;
  g_WWeapon_Effect_Wizard.LibType  := ltUseCache;
  g_WWeapon_Effect_Wizard.Initialize;

  g_WWeapon_Bonze_Effect.DxDraw   := DDxDraw;
  g_WWeapon_Bonze_Effect.DDraw    := DDxDraw.DDraw;
  g_WWeapon_Bonze_Effect.FileName := WEAPONEFFECTBONZEFILE;
  g_WWeapon_Bonze_Effect.LibType  := ltUseCache;
  g_WWeapon_Bonze_Effect.Initialize;

  g_WHumEffectImages.DxDraw   := DDxDraw;
  g_WHumEffectImages.DDraw    := DDxDraw.DDraw;
  g_WHumEffectImages.FileName := HUMEFFECTGIMAGESFILE;
  g_WHumEffectImages.LibType  := ltUseCache;
  g_WHumEffectImages.Initialize;

  g_WHumWing_KillerImages.DxDraw   := DDxDraw;
  g_WHumWing_KillerImages.DDraw    := DDxDraw.DDraw;
  g_WHumWing_KillerImages.FileName := HUMWINGIMAGESFILEKILLER;     //ÀÚ°´ ÀÌÆÑÆ®
  g_WHumWing_KillerImages.LibType  := ltUseCache;
  g_WHumWing_KillerImages.Initialize;

  g_WHumWing_BonzeImages.DxDraw   := DDxDraw;
  g_WHumWing_BonzeImages.DDraw    := DDxDraw.DDraw;
  g_WHumWing_BonzeImages.FileName := HUMWINGIMAGEBonze;
  g_WHumWing_BonzeImages.LibType  := ltUseCache;
  g_WHumWing_BonzeImages.Initialize;


  g_WUpCom_EfImages.DxDraw   := DDxDraw;
  g_WUpCom_EfImages.DDraw    := DDxDraw.DDraw;
  g_WUpCom_EfImages.FileName := HUMUPCOMEFFECT;
  g_WUpCom_EfImages.LibType  := ltUseCache;
  g_WUpCom_EfImages.Initialize;

  g_WUpWarr_EfImages.DxDraw   := DDxDraw;
  g_WUpWarr_EfImages.DDraw    := DDxDraw.DDraw;
  g_WUpWarr_EfImages.FileName := HUMUPWARREFFECT;
  g_WUpWarr_EfImages.LibType  := ltUseCache;
  g_WUpWarr_EfImages.Initialize;

  g_WUpWiz_EfImages.DxDraw   := DDxDraw;
  g_WUpWiz_EfImages.DDraw    := DDxDraw.DDraw;
  g_WUpWiz_EfImages.FileName := HUMUPWIZEFFECT;
  g_WUpWiz_EfImages.LibType  := ltUseCache;
  g_WUpWiz_EfImages.Initialize;

  g_WUpMonk_EfImages.DxDraw   := DDxDraw;
  g_WUpMonk_EfImages.DDraw    := DDxDraw.DDraw;
  g_WUpMonk_EfImages.FileName := HUMUPMONKEFFECT;
  g_WUpMonk_EfImages.LibType  := ltUseCache;
  g_WUpMonk_EfImages.Initialize;

  g_WUpAssa_EfImages.DxDraw   := DDxDraw;
  g_WUpAssa_EfImages.DDraw    := DDxDraw.DDraw;
  g_WUpAssa_EfImages.FileName := HUMUPASSAEFFECT;
  g_WUpAssa_EfImages.LibType  := ltUseCache;
  g_WUpAssa_EfImages.Initialize;


  g_WBagItemImages.DxDraw   := DDxDraw;
  g_WBagItemImages.DDraw    := DDxDraw.DDraw;
  g_WBagItemImages.FileName := BAGITEMIMAGESFILE;
  g_WBagItemImages.LibType  := ltUseCache;
  g_WBagItemImages.Initialize;

  g_WStateItemImages.DxDraw   := DDxDraw;
  g_WStateItemImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemImages.FileName := STATEITEMIMAGESFILE;   //»óÅÂÃ¢ ±âº»
  g_WStateItemImages.LibType  := ltUseCache;
  g_WStateItemImages.Initialize;

  g_WStateItemComManImages.DxDraw   := DDxDraw;
  g_WStateItemComManImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemComManImages.FileName := STATEITEMHUMUPMANIMAGESFILE;   //»óÅÂÃ¢ µî¼± °ø¿ë ³²ÀÚ
  g_WStateItemComManImages.LibType  := ltUseCache;
  g_WStateItemComManImages.Initialize;

  g_WStateItemComWomanImages.DxDraw   := DDxDraw;
  g_WStateItemComWomanImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemComWomanImages.FileName := STATEITEMHUMUPWOMANIMAGESFILE;   //»óÅÂÃ¢ µî¼± °ø¿ë ¿©ÀÚ
  g_WStateItemComWomanImages.LibType  := ltUseCache;
  g_WStateItemComWomanImages.Initialize;

  g_WStateItemWarrManImages.DxDraw   := DDxDraw;
  g_WStateItemWarrManImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemWarrManImages.FileName := STATEITEMWARRMANIMAGESFILE;        //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
  g_WStateItemWarrManImages.LibType  := ltUseCache;
  g_WStateItemWarrManImages.Initialize;

  g_WStateItemWarrWoImages.DxDraw   := DDxDraw;
  g_WStateItemWarrWoImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemWarrWoImages.FileName := STATEITEMWARRWOIMAGESFILE;        //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©)
  g_WStateItemWarrWoImages.LibType  := ltUseCache;
  g_WStateItemWarrWoImages.Initialize;

  g_WStateItemWizManImages.DxDraw   := DDxDraw;
  g_WStateItemWizManImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemWizManImages.FileName := STATEITEMWIZMANIMAGESFILE;        //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
  g_WStateItemWizManImages.LibType  := ltUseCache;
  g_WStateItemWizManImages.Initialize;

  g_WStateItemWizWoImages.DxDraw   := DDxDraw;
  g_WStateItemWizWoImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemWizWoImages.FileName := STATEITEMWIZWOIMAGESFILE;        //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
  g_WStateItemWizWoImages.LibType  := ltUseCache;
  g_WStateItemWizWoImages.Initialize;

  g_WStateItemMonkManImages.DxDraw   := DDxDraw;
  g_WStateItemMonkManImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemMonkManImages.FileName := STATEITEMMONKMANIMAGESFILE;        //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
  g_WStateItemMonkManImages.LibType  := ltUseCache;
  g_WStateItemMonkManImages.Initialize;

  g_WStateItemMonkWoImages.DxDraw   := DDxDraw;
  g_WStateItemMonkWoImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemMonkWoImages.FileName := STATEITEMMONKWOIMAGESFILE;        //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
  g_WStateItemMonkWoImages.LibType  := ltUseCache;
  g_WStateItemMonkWoImages.Initialize;

  g_WStateItemAssManImages.DxDraw   := DDxDraw;
  g_WStateItemAssManImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemAssManImages.FileName := STATEITEMASSMANIMAGESFILE;        //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
  g_WStateItemAssManImages.LibType  := ltUseCache;
  g_WStateItemAssManImages.Initialize;

  g_WStateItemAssWoImages.DxDraw   := DDxDraw;
  g_WStateItemAssWoImages.DDraw    := DDxDraw.DDraw;
  g_WStateItemAssWoImages.FileName := STATEITEMASSWOIMAGESFILE;        //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)
  g_WStateItemAssWoImages.LibType  := ltUseCache;
  g_WStateItemAssWoImages.Initialize;

  g_WState_Eff.DxDraw   := DDxDraw;
  g_WState_Eff.DDraw    := DDxDraw.DDraw;
  g_WState_Eff.FileName := STATEEFFECT;
  g_WState_Eff.LibType  := ltUseCache;
  g_WState_Eff.Initialize;

  g_WState_Eff_Assassin_Man.DxDraw   := DDxDraw;
  g_WState_Eff_Assassin_Man.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Assassin_Man.FileName := STATEEFFECT_Assassin_Man;
  g_WState_Eff_Assassin_Man.LibType  := ltUseCache;
  g_WState_Eff_Assassin_Man.Initialize;

  g_WState_Eff_Assassin_Woman.DxDraw   := DDxDraw;
  g_WState_Eff_Assassin_Woman.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Assassin_Woman.FileName := STATEEFFECT_Assassin_Woman;
  g_WState_Eff_Assassin_Woman.LibType  := ltUseCache;
  g_WState_Eff_Assassin_Woman.Initialize;

  g_WState_Eff_Common_Man.DxDraw   := DDxDraw;
  g_WState_Eff_Common_Man.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Common_Man.FileName := STATEEFFECT_Common_Man;
  g_WState_Eff_Common_Man.LibType  := ltUseCache;
  g_WState_Eff_Common_Man.Initialize;

  g_WState_Eff_Common_Woman.DxDraw   := DDxDraw;
  g_WState_Eff_Common_Woman.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Common_Woman.FileName := STATEEFFECT_Common_Woman;
  g_WState_Eff_Common_Woman.LibType  := ltUseCache;
  g_WState_Eff_Common_Woman.Initialize;

  g_WState_Eff_Monk_Man.DxDraw   := DDxDraw;
  g_WState_Eff_Monk_Man.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Monk_Man.FileName := STATEEFFECT_Monk_Man;
  g_WState_Eff_Monk_Man.LibType  := ltUseCache;
  g_WState_Eff_Monk_Man.Initialize;

  g_WState_Eff_Monk_Woman.DxDraw   := DDxDraw;
  g_WState_Eff_Monk_Woman.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Monk_Woman.FileName := STATEEFFECT_Monk_Woman;
  g_WState_Eff_Monk_Woman.LibType  := ltUseCache;
  g_WState_Eff_Monk_Woman.Initialize;

  g_WState_Eff_Warrior_Man.DxDraw   := DDxDraw;
  g_WState_Eff_Warrior_Man.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Warrior_Man.FileName := STATEEFFECT_Warrior_Man;
  g_WState_Eff_Warrior_Man.LibType  := ltUseCache;
  g_WState_Eff_Warrior_Man.Initialize;

  g_WState_Eff_Warrior_Woman.DxDraw   := DDxDraw;
  g_WState_Eff_Warrior_Woman.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Warrior_Woman.FileName := STATEEFFECT_Warrior_Woman;
  g_WState_Eff_Warrior_Woman.LibType  := ltUseCache;
  g_WState_Eff_Warrior_Woman.Initialize;

  g_WState_Eff_Wizard_Man.DxDraw   := DDxDraw;
  g_WState_Eff_Wizard_Man.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Wizard_Man.FileName := STATEEFFECT_Wizard_Man;
  g_WState_Eff_Wizard_Man.LibType  := ltUseCache;
  g_WState_Eff_Wizard_Man.Initialize;

  g_WState_Eff_Wizard_Woman.DxDraw   := DDxDraw;
  g_WState_Eff_Wizard_Woman.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_Wizard_Woman.FileName := STATEEFFECT_Wizard_Woman;
  g_WState_Eff_Wizard_Woman.LibType  := ltUseCache;
  g_WState_Eff_Wizard_Woman.Initialize;

  g_WState_Eff_BImages.DxDraw   := DDxDraw;
  g_WState_Eff_BImages.DDraw    := DDxDraw.DDraw;
  g_WState_Eff_BImages.FileName := STATEEFFECTBONZE;
  g_WState_Eff_BImages.LibType  := ltUseCache;
  g_WState_Eff_BImages.Initialize;

  g_WTransFormImages.DxDraw:=DDxDraw;
  g_WTransFormImages.DDraw:=DDxDraw.DDraw;
  g_WTransFormImages.FileName:=TRANSFORMIMAGEFILE;   //º¯½ÅÅ»
  g_WTransFormImages.LibType:=ltUseCache;
  g_WTransFormImages.Initialize;

  g_WTransFormEffectImages.DxDraw:=DDxDraw;
  g_WTransFormEffectImages.DDraw:=DDxDraw.DDraw;
  g_WTransFormEffectImages.FileName:=TRANSFORMEFFECTIMAGEFILE;   //º¯½ÅÅ»
  g_WTransFormEffectImages.LibType:=ltUseCache;
  g_WTransFormEffectImages.Initialize;

  g_WTransFormWeaponEffectImages.DxDraw:=DDxDraw;
  g_WTransFormWeaponEffectImages.DDraw:=DDxDraw.DDraw;
  g_WTransFormWeaponEffectImages.FileName:=TRANSFORMWEAPONEFFECTIMAGEFILE;   //º¯½ÅÅ»
  g_WTransFormWeaponEffectImages.LibType:=ltUseCache;
  g_WTransFormWeaponEffectImages.Initialize;

  g_WDnItemImages.DxDraw:=DDxDraw;
  g_WDnItemImages.DDraw:=DDxDraw.DDraw;
  g_WDnItemImages.FileName:=DNITEMIMAGESFILE;
  g_WDnItemImages.LibType:=ltUseCache;
  g_WDnItemImages.Initialize;

  g_WTigerImgImages.DxDraw:=DDxDraw;
  g_WTigerImgImages.DDraw:=DDxDraw.DDraw;
  g_WTigerImgImages.FileName:=TIGERIMGIMAGESFILE;     //È£¶ûÀÌ
  g_WTigerImgImages.LibType:=ltUseCache;
  g_WTigerImgImages.Initialize;

  g_WTigerUpImgImages.DxDraw:=DDxDraw;
  g_WTigerUpImgImages.DDraw:=DDxDraw.DDraw;
  g_WTigerUpImgImages.FileName:=TIGERUPIMGIMAGESFILE;     //µî¼± È£¶ûÀÌ
  g_WTigerUpImgImages.LibType:=ltUseCache;
  g_WTigerUpImgImages.Initialize;

  g_WHumImgImages.DxDraw:=DDxDraw;
  g_WHumImgImages.DDraw:=DDxDraw.DDraw;
  g_WHumImgImages.FileName:=HUMIMGIMAGESFILE;
  g_WHumImgImages.LibType:=ltUseCache;
  g_WHumImgImages.Initialize;

  g_WHum2ImgImages.DxDraw:=DDxDraw;
  g_WHum2ImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum2ImgImages.FileName:=HUM2IMGIMAGESFILE;
  g_WHum2ImgImages.LibType:=ltUseCache;
  g_WHum2ImgImages.Initialize;

  g_WHum3ImgImages.DxDraw:=DDxDraw;
  g_WHum3ImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum3ImgImages.FileName:=HUM3IMGIMAGESFILE;
  g_WHum3ImgImages.LibType:=ltUseCache;
  g_WHum3ImgImages.Initialize;

  g_WHum4ImgImages.DxDraw:=DDxDraw;
  g_WHum4ImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum4ImgImages.FileName:=HUM4IMGIMAGESFILE;
  g_WHum4ImgImages.LibType:=ltUseCache;
  g_WHum4ImgImages.Initialize;

  g_WHum_BonzeImgImages.DxDraw:=DDxDraw;
  g_WHum_BonzeImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum_BonzeImgImages.FileName:=HUMBONZEIMGIMAGESFILE;
  g_WHum_BonzeImgImages.LibType:=ltUseCache;
  g_WHum_BonzeImgImages.Initialize;

  g_WHum_CommonImgImages.DxDraw:=DDxDraw;
  g_WHum_CommonImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum_CommonImgImages.FileName:=HUMUP_COMMONIMGIMAGESFILE;       //µî¼± ±âº»
  g_WHum_CommonImgImages.LibType:=ltUseCache;
  g_WHum_CommonImgImages.Initialize;

  g_WHum_KillerImgImages.DxDraw:=DDxDraw;
  g_WHum_KillerImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum_KillerImgImages.FileName:=HUM_KillerIMGIMAGESFILE;
  g_WHum_KillerImgImages.LibType:=ltUseCache;
  g_WHum_KillerImgImages.Initialize;                  //ÀÚ°´

  g_WHum_Killer2ImgImages.DxDraw:=DDxDraw;
  g_WHum_Killer2ImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum_Killer2ImgImages.FileName:=HUM_Killer2IMGIMAGESFILE;
  g_WHum_Killer2ImgImages.LibType:=ltUseCache;
  g_WHum_Killer2ImgImages.Initialize;                  //ÀÚ°´

  g_WHum_Killer4ImgImages.DxDraw:=DDxDraw;
  g_WHum_Killer4ImgImages.DDraw:=DDxDraw.DDraw;
  g_WHum_Killer4ImgImages.FileName:=HUM_Killer4IMGIMAGESFILE;
  g_WHum_Killer4ImgImages.LibType:=ltUseCache;
  g_WHum_Killer4ImgImages.Initialize;                  //ÀÚ°´

  g_WHumUp_WarrImgImages.DxDraw:=DDxDraw;
  g_WHumUp_WarrImgImages.DDraw:=DDxDraw.DDraw;
  g_WHumUp_WarrImgImages.FileName:=HUMUP_WARRIMGIMAGESFILE;
  g_WHumUp_WarrImgImages.LibType:=ltUseCache;
  g_WHumUp_WarrImgImages.Initialize;                  //º®Ç÷Àü»ç

  g_WHumUp_WizImgImages.DxDraw:=DDxDraw;
  g_WHumUp_WizImgImages.DDraw:=DDxDraw.DDraw;
  g_WHumUp_WizImgImages.FileName:=HUMUP_WIZIMGIMAGESFILE;
  g_WHumUp_WizImgImages.LibType:=ltUseCache;
  g_WHumUp_WizImgImages.Initialize;                  //È«Çö¼ú»ç

  g_WHumUp_MonkImgImages.DxDraw:=DDxDraw;
  g_WHumUp_MonkImgImages.DDraw:=DDxDraw.DDraw;
  g_WHumUp_MonkImgImages.FileName:=HUMUP_MONKIMGIMAGESFILE;
  g_WHumUp_MonkImgImages.LibType:=ltUseCache;
  g_WHumUp_MonkImgImages.Initialize;                  //ÀÍ¼±µµ»ç

  g_WHumUp_AssassinImgImages.DxDraw:=DDxDraw;
  g_WHumUp_AssassinImgImages.DDraw:=DDxDraw.DDraw;
  g_WHumUp_AssassinImgImages.FileName:=HUMUP_AssassinIMGIMAGESFILE;
  g_WHumUp_AssassinImgImages.LibType:=ltUseCache;
  g_WHumUp_AssassinImgImages.Initialize;                  //ºñ¿¬ÀÚ°´


  g_WHairImgImages.DxDraw:=DDxDraw;
  g_WHairImgImages.DDraw:=DDxDraw.DDraw;
  g_WHairImgImages.FileName:=HAIRIMGIMAGESFILE;
  g_WHairImgImages.LibType:=ltUseCache;
  g_WHairImgImages.Initialize;

  g_WHairComImgImages.DxDraw:=DDxDraw;
  g_WHairComImgImages.DDraw:=DDxDraw.DDraw;
  g_WHairComImgImages.FileName:=HAIRCOMIMGIMAGESFILE;        //µî¼± ±âº» Çì¾î
  g_WHairComImgImages.LibType:=ltUseCache;
  g_WHairComImgImages.Initialize;

  g_WHair_KillerImgImages.DxDraw:=DDxDraw;             //ÀÚ°´ Çì¾î
  g_WHair_KillerImgImages.DDraw:=DDxDraw.DDraw;
  g_WHair_KillerImgImages.FileName:=HAIR_KillerIMGIMAGESFILE;
  g_WHair_KillerImgImages.LibType:=ltUseCache;
  g_WHair_KillerImgImages.Initialize;

  g_WHair_WarriorUpImgImages.DxDraw:=DDxDraw;             //º®Ç÷Àü»ç Çì¾î
  g_WHair_WarriorUpImgImages.DDraw:=DDxDraw.DDraw;
  g_WHair_WarriorUpImgImages.FileName:=HAIR_WARRIMGIMAGESFILE;
  g_WHair_WarriorUpImgImages.LibType:=ltUseCache;
  g_WHair_WarriorUpImgImages.Initialize;

  g_WHair_WizardUpImgImages.DxDraw:=DDxDraw;             //È«Çö¼ú»ç Çì¾î
  g_WHair_WizardUpImgImages.DDraw:=DDxDraw.DDraw;
  g_WHair_WizardUpImgImages.FileName:=HAIR_WIZIMGIMAGESFILE;
  g_WHair_WizardUpImgImages.LibType:=ltUseCache;
  g_WHair_WizardUpImgImages.Initialize;

  g_WHair_MonkUpImgImages.DxDraw:=DDxDraw;             //ÀÍ¼±µµ»ç Çì¾î
  g_WHair_MonkUpImgImages.DDraw:=DDxDraw.DDraw;
  g_WHair_MonkUpImgImages.FileName:=HAIR_MONKIMGIMAGESFILE;
  g_WHair_MonkUpImgImages.LibType:=ltUseCache;
  g_WHair_MonkUpImgImages.Initialize;

  g_WHair_AssassinImgImages.DxDraw:=DDxDraw;             //ºñ¿¬ÀÚ°´ Çì¾î
  g_WHair_AssassinImgImages.DDraw:=DDxDraw.DDraw;
  g_WHair_AssassinImgImages.FileName:=HAIR_AssassinIMGIMAGESFILE;
  g_WHair_AssassinImgImages.LibType:=ltUseCache;
  g_WHair_AssassinImgImages.Initialize;

  g_Fishing1Images.DxDraw:=DDxDraw;
  g_Fishing1Images.DDraw:=DDxDraw.DDraw;
  g_Fishing1Images.FileName:=Fishing;     //³¬½Ã ¹«±â ÀÏ¹Ý ÀÌ¹ÌÁö
  g_Fishing1Images.LibType:=ltUseCache;
  g_Fishing1Images.Initialize;

  g_Fishing2Images.DxDraw:=DDxDraw;
  g_Fishing2Images.DDraw:=DDxDraw.DDraw;
  g_Fishing2Images.FileName:=Fishing2;      //³¬½Ã ¹«±â µî¼± ÀÌ¹ÌÁö
  g_Fishing2Images.LibType:=ltUseCache;
  g_Fishing2Images.Initialize;
  //--------------------

  g_WHorseImgImages.DxDraw:=DDxDraw;
  g_WHorseImgImages.DDraw:=DDxDraw.DDraw;
  g_WHorseImgImages.FileName:=HORSEIMAGEFILE;
  g_WHorseImgImages.LibType:=ltUseCache;
  g_WHorseImgImages.Initialize;

  g_WWeaponImages.DxDraw:=DDxDraw;
  g_WWeaponImages.DDraw:=DDxDraw.DDraw;
  g_WWeaponImages.FileName:=WEAPONIMAGESFILE;
  g_WWeaponImages.LibType:=ltUseCache;
  g_WWeaponImages.Initialize;

  g_WWeapon_CommImages.DxDraw:=DDxDraw;
  g_WWeapon_CommImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_CommImages.FileName:=WEAPON_COMMIMAGESFILE;    //µî¼±¹«±â
  g_WWeapon_CommImages.LibType:=ltUseCache;
  g_WWeapon_CommImages.Initialize;

  g_WWeapon_BonzeImages.DxDraw:=DDxDraw;
  g_WWeapon_BonzeImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_BonzeImages.FileName:=WEAPONBONZEIMAGESFILE;    //µî¼±¹«±â
  g_WWeapon_BonzeImages.LibType:=ltUseCache;
  g_WWeapon_BonzeImages.Initialize;

  g_WWeapon_Killer_RightImages.DxDraw:=DDxDraw;            //ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Killer_RightImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_Killer_RightImages.FileName:=WEAPONIMAGESFILE3;
  g_WWeapon_Killer_RightImages.LibType:=ltUseCache;
  g_WWeapon_Killer_RightImages.Initialize;

  g_WWeapon_Killer_LeftImages.DxDraw:=DDxDraw;            //ÀÚ°´ ¿Þ ¼Õ
  g_WWeapon_Killer_LeftImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_Killer_LeftImages.FileName:=WEAPONIMAGESFILE2;
  g_WWeapon_Killer_LeftImages.LibType:=ltUseCache;
  g_WWeapon_Killer_LeftImages.Initialize;


  g_WWeapon_WarrImages.DxDraw:=DDxDraw;            //º®Ç÷Àü»ç
  g_WWeapon_WarrImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_WarrImages.FileName:=WEAPON_WARRIMAGESFILE;
  g_WWeapon_WarrImages.LibType:=ltUseCache;
  g_WWeapon_WarrImages.Initialize;

  g_WWeapon_WizImages.DxDraw:=DDxDraw;            //È«Çö¼ú»ç
  g_WWeapon_WizImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_WizImages.FileName:=WEAPON_WIZIMAGESFILE;
  g_WWeapon_WizImages.LibType:=ltUseCache;
  g_WWeapon_WizImages.Initialize;

  g_WWeapon_MonkImages.DxDraw:=DDxDraw;            //ÀÍ¼±µµ»ç
  g_WWeapon_MonkImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_MonkImages.FileName:=WEAPON_MONKIMAGESFILE;
  g_WWeapon_MonkImages.LibType:=ltUseCache;
  g_WWeapon_MonkImages.Initialize;

  g_WWeapon_Assassin_RightImages.DxDraw:=DDxDraw;          //ºñ¿¬ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Assassin_RightImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_Assassin_RightImages.FileName:=WEAPON_ASS_RIGHTIMAGESFILE;
  g_WWeapon_Assassin_RightImages.LibType:=ltUseCache;
  g_WWeapon_Assassin_RightImages.Initialize;

  g_WWeapon_Assassin_LeftImages.DxDraw:=DDxDraw;            //ºñ¿¬ÀÚ°´ ¿Þ ¼Õ
  g_WWeapon_Assassin_LeftImages.DDraw:=DDxDraw.DDraw;
  g_WWeapon_Assassin_LeftImages.FileName:=WEAPON_ASS_LEFTIMAGESFILE;
  g_WWeapon_Assassin_LeftImages.LibType:=ltUseCache;
  g_WWeapon_Assassin_LeftImages.Initialize;

  g_WMagIconImages.DxDraw:=DDxDraw;
  g_WMagIconImages.DDraw:=DDxDraw.DDraw;
  g_WMagIconImages.FileName:=MAGICONIMAGESFILE;
  g_WMagIconImages.LibType:=ltUseCache;
  g_WMagIconImages.Initialize;

  g_WMagIcon2Images.DxDraw:=DDxDraw;
  g_WMagIcon2Images.DDraw:=DDxDraw.DDraw;
  g_WMagIcon2Images.FileName:=MAGICON2IMAGESFILE;
  g_WMagIcon2Images.LibType:=ltUseCache;
  g_WMagIcon2Images.Initialize;

  g_WMagNewIconImages.DxDraw:=DDxDraw;
  g_WMagNewIconImages.DDraw:=DDxDraw.DDraw;
  g_WMagNewIconImages.FileName:=MAGNEWICONIMAGESFILE;
  g_WMagNewIconImages.LibType:=ltUseCache;
  g_WMagNewIconImages.Initialize;

  g_WMagNewIcon2Images.DxDraw:=DDxDraw;
  g_WMagNewIcon2Images.DDraw:=DDxDraw.DDraw;
  g_WMagNewIcon2Images.FileName:=MAGNEWICON2IMAGESFILE;
  g_WMagNewIcon2Images.LibType:=ltUseCache;
  g_WMagNewIcon2Images.Initialize;


  g_WNpcImgImages.DxDraw:=DDxDraw;
  g_WNpcImgImages.DDraw:=DDxDraw.DDraw;
  g_WNpcImgImages.FileName:=NPCIMAGESFILE;
  g_WNpcImgImages.LibType:=ltUseCache;
  g_WNpcImgImages.Initialize;

  g_WNewNpcImages.DxDraw:=DDxDraw;
  g_WNewNpcImages.DDraw:=DDxDraw.DDraw;
  g_WNewNpcImages.FileName:=NEWNPCIMAGESFILE;
  g_WNewNpcImages.LibType:=ltUseCache;
  g_WNewNpcImages.Initialize;

  g_WMagicImages.DxDraw:=DDxDraw;
  g_WMagicImages.DDraw:=DDxDraw.DDraw;
  g_WMagicImages.FileName:=MAGICIMAGESFILE;
  g_WMagicImages.LibType:=ltUseCache;
  g_WMagicImages.Initialize;

  g_WMagic0Images.DxDraw:=DDxDraw;
  g_WMagic0Images.DDraw:=DDxDraw.DDraw;
  g_WMagic0Images.FileName:=MAGIC0IMAGESFILE;
  g_WMagic0Images.LibType:=ltUseCache;
  g_WMagic0Images.Initialize;

  g_WMagic2Images.DxDraw:=DDxDraw;
  g_WMagic2Images.DDraw:=DDxDraw.DDraw;
  g_WMagic2Images.FileName:=MAGIC2IMAGESFILE;
  g_WMagic2Images.LibType:=ltUseCache;
  g_WMagic2Images.Initialize;

  g_WMagic3Images.DxDraw:=DDxDraw;
  g_WMagic3Images.DDraw:=DDxDraw.DDraw;
  g_WMagic3Images.FileName:=MAGIC3IMAGESFILE;
  g_WMagic3Images.LibType:=ltUseCache;
  g_WMagic3Images.Initialize;

  g_WMagic4Images.DxDraw:=DDxDraw;
  g_WMagic4Images.DDraw:=DDxDraw.DDraw;
  g_WMagic4Images.FileName:=MAGIC4IMAGESFILE;
  g_WMagic4Images.LibType:=ltUseCache;
  g_WMagic4Images.Initialize;

  g_WMagicNewImages.DxDraw:=DDxDraw;
  g_WMagicNewImages.DDraw:=DDxDraw.DDraw;
  g_WMagicNewImages.FileName:=MAGICNEWIMAGESFILE;
  g_WMagicNewImages.LibType:=ltUseCache;
  g_WMagicNewImages.Initialize;

  g_WMagicUpImages.DxDraw:=DDxDraw;
  g_WMagicUpImages.DDraw:=DDxDraw.DDraw;
  g_WMagicUpImages.FileName:=MAGICUPIMAGESFILE;
  g_WMagicUpImages.LibType:=ltUseCache;
  g_WMagicUpImages.Initialize;

  g_WMagic_BonzeImages.DxDraw:=DDxDraw;
  g_WMagic_BonzeImages.DDraw:=DDxDraw.DDraw;
  g_WMagic_BonzeImages.FileName:=MAGICBONZEIMAGESFILE;
  g_WMagic_BonzeImages.LibType:=ltUseCache;
  g_WMagic_BonzeImages.Initialize;

  g_WDecoImages.DxDraw:=DDxDraw;
  g_WDecoImages.DDraw:=DDxDraw.DDraw;
  g_WDecoImages.FileName:=DECOIMAGEFILE;
  g_WDecoImages.LibType:=ltUseCache;
  g_WDecoImages.Initialize;

  g_WPetImg.DxDraw:=DDxDraw;
  g_WPetImg.DDraw:=DDxDraw.DDraw;
  g_WPetImg.FileName:=PETIMAGEFILE;
  g_WPetImg.LibType:=ltUseCache;
  g_WPetImg.Initialize;

  g_WDragonImg.DxDraw:=DDxDraw;
  g_WDragonImg.DDraw:=DDxDraw.DDraw;
  g_WDragonImg.FileName:=DRAGONIMAGEFILE;
  g_WDragonImg.LibType:=ltUseCache;
  g_WDragonImg.Initialize;

  g_WEffectImg.DxDraw:=DDxDraw;
  g_WEffectImg.DDraw:=DDxDraw.DDraw;
  g_WEffectImg.FileName:=EFFECTIMAGEFILE;
  g_WEffectImg.LibType:=ltUseCache;
  g_WEffectImg.Initialize;

  g_WKuLouImages.DxDraw:=DDxDraw;
  g_WKuLouImages.DDraw:=DDxDraw.DDraw;
  g_WKuLouImages.FileName:=MONNEWKULOUFILE;
  g_WKuLouImages.LibType:=ltUseCache;
  g_WKuLouImages.Initialize;

  WMon42Img.DxDraw:=DDxDraw;
  WMon42Img.DDraw:=DDxDraw.DDraw;
  WMon42Img.FileName:= 'Data\Mon42.Wil';
  WMon42Img.LibType:=ltUseCache;
  WMon42Img.Initialize;

  g_WAniImages.DxDraw:=DDxDraw;
  g_WAniImages.DDraw:=DDxDraw.DDraw;
  g_WAniImages.FileName:= 'CustomData\Shanda-Mir2\AniTiles1.Wil';
  g_WAniImages.LibType:=ltUseCache;
  g_WAniImages.Initialize;

  g_wSTiles[0].DxDraw:=DDxDraw;
  g_wSTiles[0].DDraw:=DDxDraw.DDraw;
  g_wSTiles[0].FileName:=  'CustomData\Shanda-Mir2\Tiles.Wil';
  g_wSTiles[0].LibType:=ltUseCache;
  g_wSTiles[0].Initialize;

  g_wSTiles[1].DxDraw:=DDxDraw;
  g_wSTiles[1].DDraw:=DDxDraw.DDraw;
  g_wSTiles[1].FileName:=  'CustomData\Shanda-Mir2\Tiles2.Wil';
  g_wSTiles[1].LibType:=ltUseCache;
  g_wSTiles[1].Initialize;

  g_wSTiles[2].DxDraw:=DDxDraw;
  g_wSTiles[2].DDraw:=DDxDraw.DDraw;
  g_wSTiles[2].FileName:=  'CustomData\Shanda-Mir2\Tiles3.Wil';
  g_wSTiles[2].LibType:=ltUseCache;
  g_wSTiles[2].Initialize;

  g_wSTiles[3].DxDraw:=DDxDraw;
  g_wSTiles[3].DDraw:=DDxDraw.DDraw;
  g_wSTiles[3].FileName:=  'CustomData\Shanda-Mir2\Tiles4.Wil';
  g_wSTiles[3].LibType:=ltUseCache;
  g_wSTiles[3].Initialize;

  g_wSTiles[4].DxDraw:=DDxDraw;
  g_wSTiles[4].DDraw:=DDxDraw.DDraw;
  g_wSTiles[4].FileName:=  'CustomData\Shanda-Mir2\Tiles5.Wil';
  g_wSTiles[4].LibType:=ltUseCache;
  g_wSTiles[4].Initialize;

  g_wSTiles[5].DxDraw:=DDxDraw;
  g_wSTiles[5].DDraw:=DDxDraw.DDraw;
  g_wSTiles[5].FileName:=  'CustomData\Shanda-Mir2\Tiles6.Wil';
  g_wSTiles[5].LibType:=ltUseCache;
  g_wSTiles[5].Initialize;

  g_wSTiles[6].DxDraw:=DDxDraw;
  g_wSTiles[6].DDraw:=DDxDraw.DDraw;
  g_wSTiles[6].FileName:=  'CustomData\Shanda-Mir2\Tiles7.Wil';
  g_wSTiles[6].LibType:=ltUseCache;
  g_wSTiles[6].Initialize;

  g_wSTiles[7].DxDraw:=DDxDraw;
  g_wSTiles[7].DDraw:=DDxDraw.DDraw;
  g_wSTiles[7].FileName:=  'CustomData\Shanda-Mir2\Tiles8.Wil';
  g_wSTiles[7].LibType:=ltUseCache;
  g_wSTiles[7].Initialize;

  g_WSSmTiles[0].DxDraw:=DDxDraw;
  g_WSSmTiles[0].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[0].FileName:=  'CustomData\Shanda-Mir2\smtiles.Wil';
  g_WSSmTiles[0].LibType:=ltUseCache;
  g_WSSmTiles[0].Initialize;

  g_WSSmTiles[1].DxDraw:=DDxDraw;
  g_WSSmTiles[1].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[1].FileName:=  'CustomData\Shanda-Mir2\smtiles2.Wil';
  g_WSSmTiles[1].LibType:=ltUseCache;
  g_WSSmTiles[1].Initialize;

  g_WSSmTiles[2].DxDraw:=DDxDraw;
  g_WSSmTiles[2].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[2].FileName:=  'CustomData\Shanda-Mir2\smtiles3.Wil';
  g_WSSmTiles[2].LibType:=ltUseCache;
  g_WSSmTiles[2].Initialize;

  g_WSSmTiles[3].DxDraw:=DDxDraw;
  g_WSSmTiles[3].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[3].FileName:=  'CustomData\Shanda-Mir2\smtiles4.Wil';
  g_WSSmTiles[3].LibType:=ltUseCache;
  g_WSSmTiles[3].Initialize;

  g_WSSmTiles[4].DxDraw:=DDxDraw;
  g_WSSmTiles[4].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[4].FileName:=  'CustomData\Shanda-Mir2\smtiles5.Wil';
  g_WSSmTiles[4].LibType:=ltUseCache;
  g_WSSmTiles[4].Initialize;

  g_WSSmTiles[5].DxDraw:=DDxDraw;
  g_WSSmTiles[5].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[5].FileName:=  'CustomData\Shanda-Mir2\smtiles6.Wil';
  g_WSSmTiles[5].LibType:=ltUseCache;
  g_WSSmTiles[5].Initialize;

  g_WSSmTiles[6].DxDraw:=DDxDraw;
  g_WSSmTiles[6].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[6].FileName:=  'CustomData\Shanda-Mir2\smtiles7.Wil';
  g_WSSmTiles[6].LibType:=ltUseCache;
  g_WSSmTiles[6].Initialize;

  g_WSSmTiles[7].DxDraw:=DDxDraw;
  g_WSSmTiles[7].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[7].FileName:=  'CustomData\Shanda-Mir2\smtiles8.Wil';
  g_WSSmTiles[7].LibType:=ltUseCache;
  g_WSSmTiles[7].Initialize;

  g_WSSmTiles[8].DxDraw:=DDxDraw;
  g_WSSmTiles[8].DDraw:=DDxDraw.DDraw;
  g_WSSmTiles[8].FileName:=  'CustomData\Shanda-Mir2\smtiles9.Wil';
  g_WSSmTiles[8].LibType:=ltUseCache;
  g_WSSmTiles[8].Initialize;

  g_EiTiteArr[0].FileName := 'CustomData\Mir3\Tilesc.wil';
  g_EiTiteArr[1].FileName := 'CustomData\Mir3\Tiles30c.wil';
  g_EiTiteArr[2].FileName := 'CustomData\Mir3\Tiles5c.wil';
  g_EiTiteArr[3].FileName := 'CustomData\Mir3\Smtilesc.wil';
  g_EiTiteArr[4].FileName := 'CustomData\Mir3\Housesc.wil';
  g_EiTiteArr[5].FileName := 'CustomData\Mir3\Cliffsc.wil';
  g_EiTiteArr[6].FileName := 'CustomData\Mir3\Dungeonsc.wil';
  g_EiTiteArr[7].FileName := 'CustomData\Mir3\Innersc.wil';
  g_EiTiteArr[8].FileName := 'CustomData\Mir3\Furnituresc.wil';
  g_EiTiteArr[9].FileName := 'CustomData\Mir3\Wallsc.wil';
  g_EiTiteArr[10].FileName := 'CustomData\Mir3\SmObjectsc.wil';
  g_EiTiteArr[11].FileName := 'CustomData\Mir3\Animationsc.wil';
  g_EiTiteArr[12].FileName := 'CustomData\Mir3\Object1c.wil';
  g_EiTiteArr[13].FileName := 'CustomData\Mir3\Object2c.wil';

  g_EiTiteArr[15].FileName := 'CustomData\Mir3\Wood\Tilesc.wil';
  g_EiTiteArr[16].FileName := 'CustomData\Mir3\Wood\Tiles30c.wil';
  g_EiTiteArr[17].FileName := 'CustomData\Mir3\Wood\Tiles5c.wil';
  g_EiTiteArr[18].FileName := 'CustomData\Mir3\Wood\Smtilesc.wil';
  g_EiTiteArr[19].FileName := 'CustomData\Mir3\Wood\Housesc.wil';
  g_EiTiteArr[20].FileName := 'CustomData\Mir3\Wood\Cliffsc.wil';
  g_EiTiteArr[21].FileName := 'CustomData\Mir3\Wood\Dungeonsc.wil';
  g_EiTiteArr[22].FileName := 'CustomData\Mir3\Wood\Innersc.wil';
  g_EiTiteArr[23].FileName := 'CustomData\Mir3\Wood\Furnituresc.wil';
  g_EiTiteArr[24].FileName := 'CustomData\Mir3\Wood\Wallsc.wil';
  g_EiTiteArr[25].FileName := 'CustomData\Mir3\Wood\SmObjectsc.wil';
  g_EiTiteArr[26].FileName := 'CustomData\Mir3\Wood\Animationsc.wil';

  g_EiTiteArr[30].FileName := 'CustomData\Mir3\Sand\Tilesc.wil';
  g_EiTiteArr[31].FileName := 'CustomData\Mir3\Sand\Tiles30c.wil';
  g_EiTiteArr[32].FileName := 'CustomData\Mir3\Sand\Tiles5c.wil';
  g_EiTiteArr[33].FileName := 'CustomData\Mir3\Sand\Smtilesc.wil';
  g_EiTiteArr[34].FileName := 'CustomData\Mir3\Sand\Housesc.wil';
  g_EiTiteArr[35].FileName := 'CustomData\Mir3\Sand\Cliffsc.wil';
  g_EiTiteArr[36].FileName := 'CustomData\Mir3\Sand\Dungeonsc.wil';
  g_EiTiteArr[37].FileName := 'CustomData\Mir3\Sand\Innersc.wil';
  g_EiTiteArr[38].FileName := 'CustomData\Mir3\Sand\Furnituresc.wil';
  g_EiTiteArr[39].FileName := 'CustomData\Mir3\Sand\Wallsc.wil';
  g_EiTiteArr[40].FileName := 'CustomData\Mir3\Sand\SmObjectsc.wil';
  g_EiTiteArr[41].FileName := 'CustomData\Mir3\Sand\Animationsc.wil';


  g_EiTiteArr[45].FileName := 'CustomData\Mir3\Snow\Tilesc.wil';
  g_EiTiteArr[46].FileName := 'CustomData\Mir3\Snow\Tiles30c.wil';
  g_EiTiteArr[47].FileName := 'CustomData\Mir3\Snow\Tiles5c.wil';
  g_EiTiteArr[48].FileName := 'CustomData\Mir3\Snow\Smtilesc.wil';
  g_EiTiteArr[49].FileName := 'CustomData\Mir3\Snow\Housesc.wil';
  g_EiTiteArr[50].FileName := 'CustomData\Mir3\Snow\Cliffsc.wil';
  g_EiTiteArr[51].FileName := 'CustomData\Mir3\Snow\Dungeonsc.wil';
  g_EiTiteArr[52].FileName := 'CustomData\Mir3\Snow\Innersc.wil';
  g_EiTiteArr[53].FileName := 'CustomData\Mir3\Snow\Furnituresc.wil';
  g_EiTiteArr[54].FileName := 'CustomData\Mir3\Snow\Wallsc.wil';
  g_EiTiteArr[55].FileName := 'CustomData\Mir3\Snow\SmObjectsc.wil';
  g_EiTiteArr[56].FileName := 'CustomData\Mir3\Snow\Animationsc.wil';

  g_EiTiteArr[60].FileName := 'CustomData\Mir3\forest\Tilesc.wil';
  g_EiTiteArr[61].FileName := 'CustomData\Mir3\forest\Tiles30c.wil';
  g_EiTiteArr[62].FileName := 'CustomData\Mir3\forest\Tiles5c.wil';
  g_EiTiteArr[63].FileName := 'CustomData\Mir3\forest\Smtilesc.wil';
  g_EiTiteArr[64].FileName := 'CustomData\Mir3\forest\Housesc.wil';
  g_EiTiteArr[65].FileName := 'CustomData\Mir3\forest\Cliffsc.wil';
  g_EiTiteArr[66].FileName := 'CustomData\Mir3\forest\Dungeonsc.wil';
  g_EiTiteArr[67].FileName := 'CustomData\Mir3\forest\Innersc.wil';
  g_EiTiteArr[68].FileName := 'CustomData\Mir3\forest\Furnituresc.wil';
  g_EiTiteArr[69].FileName := 'CustomData\Mir3\forest\Wallsc.wil';
  g_EiTiteArr[70].FileName := 'CustomData\Mir3\forest\SmObjectsc.wil';
  g_EiTiteArr[71].FileName := 'CustomData\Mir3\forest\Animationsc.wil';
  for I := 0 To 71 do begin
    If FileExists(g_EiTiteArr[i].FileName) Then  begin
      g_EiTiteArr[i].DxDraw:=DDxDraw;
      g_EiTiteArr[i].DDraw:=DDxDraw.DDraw;
      g_EiTiteArr[i].LibType:=ltUseCache;
      g_EiTiteArr[i].Initialize;
    end;
  end;
end;

procedure UnLoadWMImagesLib();
var
  I:Integer;
begin
  for I := 0 to 71 do begin
    if g_eiTiteArr[I] <> nil then begin
      g_eiTiteArr[I].Finalize;
      g_eiTiteArr[I].Free;
    end;
  end;

  for I := Low(g_WObjectArr) to High(g_WObjectArr) do begin
    if g_WObjectArr[I] <> nil then begin
      g_WObjectArr[I].Finalize;
      g_WObjectArr[I].Free;
    end;
  end;

  for I := Low(g_WSObjectArr) to High(g_WSObjectArr) do begin
    if g_WSObjectArr[I] <> nil then begin
      g_WSObjectArr[I].Finalize;
      g_WSObjectArr[I].Free;
    end;
  end;
  for I := Low(g_WMonImagesArr) to High(g_WMonImagesArr) do begin
    if g_WMonImagesArr[I] <> nil then begin
      g_WMonImagesArr[I].Finalize;
      g_WMonImagesArr[I].Free;
    end;
  end;

  g_WMainImages.Finalize;
  g_WMainImages.Free;

  g_WMain2Images.Finalize;
  g_WMain2Images.Free;

  g_WMain3Images.Finalize;
  g_WMain3Images.Free;

  g_WGuildImages.Finalize;
  g_WGuildImages.Free;

  g_WTitleImages.Finalize;
  g_WTitleImages.Free;

  g_WAresImages.Finalize;
  g_WAresImages.Free;

  g_WFaceImages.Finalize;
  g_WFaceImages.Free;

  g_WBuffIconImages.Finalize;
  g_WBuffIconImages.Free;

  g_WChrSelImages.Finalize;
  g_WChrSelImages.Free;

  g_WNewChrSelImages.Finalize;
  g_WNewChrSelImages.Free;

  g_WHeroChrSelImg.Finalize;
  g_WHeroChrSelImg.Free;

  g_WNewLoginImages.Finalize;
  g_WNewLoginImages.Free;

  g_WGSkillImages.Finalize;
  g_WGSkillImages.Free;

  g_WMMapImages.Finalize;
  g_WMMapImages.Free;

  g_WFMMapImages.Finalize;
  g_WFMMapImages.Free;

  g_WMMapMir3Images.Finalize;
  g_WMMapMir3Images.Free;

  g_WSMMapImages.Finalize;
  g_WSMMapImages.Free;

  g_WTilesImages.Finalize;
  g_WTilesImages.Free;

  g_WSmTilesImages.Finalize;
  g_WSmTilesImages.Free;

  g_WAniImages.Finalize;
  g_WAniImages.Free;

  WMon42Img.Finalize;
  WMon42Img.Free;

  g_WHumWingImages.Finalize;
  g_WHumWingImages.Free;

  g_WWeapon_Effect.Finalize;
  g_WWeapon_Effect.Free;

  g_WWeapon_Effect_Assassin_Left.Finalize;
  g_WWeapon_Effect_Assassin_Left.Free;

  g_WWeapon_Effect_Assassin_Right.Finalize;
  g_WWeapon_Effect_Assassin_Right.Free;

  g_WWeapon_Effect_Common.Finalize;
  g_WWeapon_Effect_Common.Free;

  g_WWeapon_Effect_Killer_Left.Finalize;
  g_WWeapon_Effect_Killer_Left.Free;

  g_WWeapon_Effect_Killer_Right.Finalize;
  g_WWeapon_Effect_Killer_Right.Free;

  g_WWeapon_Effect_Monk.Finalize;
  g_WWeapon_Effect_Monk.Free;

  g_WWeapon_Effect_Warrior.Finalize;
  g_WWeapon_Effect_Warrior.Free;

  g_WWeapon_Effect_Wizard.Finalize;
  g_WWeapon_Effect_Wizard.Free;

  g_WWeapon_Bonze_Effect.Finalize;
  g_WWeapon_Bonze_Effect.Free;

  g_WHumEffectImages.Finalize;
  g_WHumEffectImages.Free;

  g_WHumWing_KillerImages.Finalize;
  g_WHumWing_KillerImages.Free;                       //ÀÚ°´ ÀÌÆÑÆ®

  g_WHumWing_BonzeImages.Finalize;
  g_WHumWing_BonzeImages.Free;

  g_WUpCom_EfImages.Finalize;
  g_WUpCom_EfImages.Free;
  g_WUpWarr_EfImages.Finalize;
  g_WUpWarr_EfImages.Free;
  g_WUpWiz_EfImages.Finalize;
  g_WUpWiz_EfImages.Free;
  g_WUpMonk_EfImages.Finalize;
  g_WUpMonk_EfImages.Free;
  g_WUpAssa_EfImages.Finalize;
  g_WUpAssa_EfImages.Free;


  g_WBagItemImages.Finalize;
  g_WBagItemImages.Free;

  g_WStateItemImages.Finalize;       //»óÅÂÃ¢ ±âº»
  g_WStateItemImages.Free;

  g_WStateItemComManImages.Finalize;       //»óÅÂÃ¢ µî¼± °ø¿ë ³²ÀÚ
  g_WStateItemComManImages.Free;

  g_WStateItemComWomanImages.Finalize;       //»óÅÂÃ¢ µî¼± °ø¿ë ¿©ÀÚ
  g_WStateItemComWomanImages.Free;


  g_WStateItemWarrManImages.Finalize;       //»óÅÂÃ¢ º®Ç÷Àü»ç(³²)
  g_WStateItemWarrManImages.Free;

  g_WStateItemWarrWoImages.Finalize;       //»óÅÂÃ¢ º®Ç÷Àü»ç(¿©)
  g_WStateItemWarrWoImages.Free;

  g_WStateItemWizManImages.Finalize;       //»óÅÂÃ¢ È«Çö¼ú»ç(³²)
  g_WStateItemWizManImages.Free;

  g_WStateItemWizWoImages.Finalize;       //»óÅÂÃ¢ È«Çö¼ú»ç(¿©)
  g_WStateItemWizWoImages.Free;

  g_WStateItemMonkManImages.Finalize;       //»óÅÂÃ¢ ÀÍ¼±µµ»ç(³²)
  g_WStateItemMonkManImages.Free;

  g_WStateItemMonkWoImages.Finalize;       //»óÅÂÃ¢ ÀÍ¼±µµ»ç(¿©)
  g_WStateItemMonkWoImages.Free;

  g_WStateItemAssManImages.Finalize;       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
  g_WStateItemAssManImages.Free;

  g_WStateItemAssWoImages.Finalize;       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)
  g_WStateItemAssWoImages.Free;

  g_WState_Eff_BImages.Finalize;      
  g_WState_Eff_BImages.Free;

  g_WTransFormImages.Finalize;       //º¯½ÅÅ»
  g_WTransFormImages.Free;

  g_WTransFormEffectImages.Finalize;       //º¯½ÅÅ»
  g_WTransFormEffectImages.Free;

  g_WTransFormWeaponEffectImages.Finalize;       //º¯½ÅÅ»
  g_WTransFormWeaponEffectImages.Free;


  g_WDnItemImages.Finalize;
  g_WDnItemImages.Free;

  g_WTigerImgImages.Finalize;     //È£¶ûÀÌ
  g_WTigerImgImages.Free;

  g_WTigerUpImgImages.Finalize;     //µî¼± È£¶ûÀÌ
  g_WTigerUpImgImages.Free;

  g_WHumImgImages.Finalize;
  g_WHumImgImages.Free;

  g_WHum2ImgImages.Finalize;
  g_WHum2ImgImages.Free;

  g_WHum3ImgImages.Finalize;
  g_WHum3ImgImages.Free;

  g_WHum4ImgImages.Finalize;
  g_WHum4ImgImages.Free;

  g_WHum_BonzeImgImages.Finalize;
  g_WHum_BonzeImgImages.Free;

  g_WHum_CommonImgImages.Finalize; //µî¼± ±âº»
  g_WHum_CommonImgImages.Free;

  g_WHum_KillerImgImages.Finalize;     //ÀÚ°´
  g_WHum_KillerImgImages.Free;

  g_WHum_Killer2ImgImages.Finalize;     //ÀÚ°´
  g_WHum_Killer2ImgImages.Free;

  g_WHum_Killer4ImgImages.Finalize;     //ÀÚ°´
  g_WHum_Killer4ImgImages.Free;

  g_WHumUp_WarrImgImages.Finalize;
  g_WHumUp_WarrImgImages.Free;

  g_WHumUp_WizImgImages.Finalize;
  g_WHumUp_WizImgImages.Free;

  g_WHumUp_MonkImgImages.Finalize;
  g_WHumUp_MonkImgImages.Free;

  g_WHumUp_AssassinImgImages.Finalize;     //ÀÚ°´
  g_WHumUp_AssassinImgImages.Free;

  g_WHairImgImages.Finalize;
  g_WHairImgImages.Free;

  g_WHairComImgImages.Finalize;
  g_WHairComImgImages.Free;

  g_WHair_KillerImgImages.Finalize;         //ÀÚ°´¸Ó¸®
  g_WHair_KillerImgImages.Free;

  g_WHair_WarriorUpImgImages.Finalize;         //º®Ç÷Àü»ç¸Ó¸®
  g_WHair_WarriorUpImgImages.Free;

  g_WHair_WizardUpImgImages.Finalize;         //È«Çö¼ú»ç¸Ó¸®
  g_WHair_WizardUpImgImages.Free;

  g_WHair_MonkUpImgImages.Finalize;         //ÀÍ¼±µµ»ç¸Ó¸®
  g_WHair_MonkUpImgImages.Free;

  g_WHair_AssassinImgImages.Finalize;         //ºñ¿¬ÀÚ°´¸Ó¸®
  g_WHair_AssassinImgImages.Free;

  g_Fishing1Images.Finalize;
  g_Fishing1Images.Free;

  g_Fishing2Images.Finalize;
  g_Fishing2Images.Free;
  //-----------------------

  g_WHorseImgImages.Finalize;
  g_WHorseImgImages.Free;

  g_WWeaponImages.Finalize;
  g_WWeaponImages.Free;

  g_WWeapon_CommImages.Finalize;      //µî¼±¹«±â
  g_WWeapon_CommImages.Free;

  g_WWeapon_BonzeImages.Finalize;
  g_WWeapon_BonzeImages.Free;

  g_WWeapon_Killer_LeftImages.Finalize;  //ÀÚ°´ ¿Þ¼Õ
  g_WWeapon_Killer_LeftImages.Free;

  g_WWeapon_Killer_RightImages.Finalize;    //ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Killer_RightImages.Free;

  g_WWeapon_WarrImages.Finalize;  //º®Ç÷Àü»ç
  g_WWeapon_WarrImages.Free;

  g_WWeapon_WizImages.Finalize;  //È«Çö¼ú»ç
  g_WWeapon_WizImages.Free;

  g_WWeapon_MonkImages.Finalize;  //ÀÍ¼±µµ»ç
  g_WWeapon_MonkImages.Free;

  g_WWeapon_Assassin_LeftImages.Finalize;  //ºñ¿¬ÀÚ°´ ¿Þ¼Õ
  g_WWeapon_Assassin_LeftImages.Free;

  g_WWeapon_Assassin_RightImages.Finalize;    //ºñ¿¬ÀÚ°´ ¿À¸¥¼Õ
  g_WWeapon_Assassin_RightImages.Free;

  g_WMagIconImages.Finalize;
  g_WMagIconImages.Free;

  g_WMagIcon2Images.Finalize;
  g_WMagIcon2Images.Free;

  g_WMagNewIconImages.Finalize;
  g_WMagNewIconImages.Free;

  g_WMagNewIcon2Images.Finalize;
  g_WMagNewIcon2Images.Free;

  g_WNpcImgImages.Finalize;
  g_WNpcImgImages.Free;

  g_WNewNpcImages.Finalize;
  g_WNewNpcImages.Free;

  g_WMagicImages.Finalize;
  g_WMagicImages.Free;

  g_WMagic0Images.Finalize;;
  g_WMagic0Images.Free;

  g_WMagic2Images.Finalize;;
  g_WMagic2Images.Free;

  g_WMagic3Images.Finalize;;
  g_WMagic3Images.Free;

  g_WMagic4Images.Finalize;;
  g_WMagic4Images.Free;

  g_WMagicNewImages.Finalize;
  g_WMagicNewImages.Free;

  g_WMagicUpImages.Finalize;
  g_WMagicUpImages.Free;

  g_WMagic_BonzeImages.Finalize;
  g_WMagic_BonzeImages.Free;

  g_WDecoImages.Finalize;
  g_WDecoImages.Free;

  g_WPetImg.Finalize;
  g_WPetImg.Free;

  g_WDragonImg.Finalize;
  g_WDragonImg.Free;

  g_WEffectImg.Finalize;
  g_WEffectImg.Free;

  g_WKuLouImages.Finalize;
  g_WKuLouImages.Free;

  for I := 0 to 7 do begin
    if g_wSTiles[I] <> nil then begin
      g_wSTiles[I].Finalize;
      g_wSTiles[I].Free;
    end;
  end;
  for I := 0 to 8 do begin
    if g_WSSmTiles[I] <> nil then begin
      g_WSSmTiles[I].Finalize;
      g_WSSmTiles[I].Free;
    end;
  end;
end;

function  GetObjsEx (nUnit,nIdx:Integer; var px, py: integer): TDirectDrawSurface;
var
  sFileName:String;
begin
  Result:=nil;
  if not (nUnit in [Low(g_WObjectArr) .. High(g_WObjectArr)]) then nUnit:=0;
  if g_WObjectArr[nUnit] = nil then begin

    if nUnit = 0 then sFileName:=OBJECTIMAGEFILE
    else sFileName:=format(OBJECTIMAGEFILE1,[nUnit+1]);

    if not FileExists(sFileName) then exit;
    g_WObjectArr[nUnit]:=TWMImages.Create(nil);
    g_WObjectArr[nUnit].DxDraw:=g_DxDraw;
    g_WObjectArr[nUnit].DDraw:=g_DxDraw.DDraw;
    g_WObjectArr[nUnit].FileName:=sFileName;
    g_WObjectArr[nUnit].LibType:=ltUseCache;
    g_WObjectArr[nUnit].Initialize;
  end;
  Result:=g_WObjectArr[nUnit].GetCachedImage(nIdx,px,py);
end;

function  GetSObjsEx (nUnit,nIdx:Integer; var px, py: integer): TDirectDrawSurface;
var
  sFileName:String;
  nError: integer;
begin
  Result:=nil;
  nError:=0;
  try
    if not (nUnit in [Low(g_WSObjectArr) .. High(g_WSObjectArr)]) then nUnit:=0;
    if g_WSObjectArr[nUnit] = nil then begin
      nError:=1;
      if nUnit = 0 then sFileName:=SOBJECTIMAGEFILE
      else sFileName:=format(SOBJECTIMAGEFILE1,[nUnit+1]);
      nError:=2;
      if not FileExists(sFileName) then exit;
      nError:=3;
      g_WSObjectArr[nUnit]:=TWMImages.Create(nil);
      nError:=4;
      g_WSObjectArr[nUnit].DxDraw:=g_DxDraw;
      nError:=5;
      g_WSObjectArr[nUnit].DDraw:=g_DxDraw.DDraw;
      nError:=6;
      g_WSObjectArr[nUnit].FileName:=sFileName;
      nError:=7;
      g_WSObjectArr[nUnit].LibType:=ltUseCache;
      nError:=8;
      g_WSObjectArr[nUnit].Initialize;
    end;
    Result:=g_WSObjectArr[nUnit].GetCachedImage(nIdx,px,py);
  except
    DebugOutStr (IntToStr(nUnit) + '/' + IntToStr(nIdx) +'/'+  IntToStr(nError));
  end;
end;

function GetMonImg (nAppr:Integer):TWMImages;
var
  sFileName:String;
  nUnit:Integer;
begin
  Result:=nil;
  if nAppr < 1000 then nUnit:=nAppr div 10
  else nUnit:=nAppr;
  if nUnit in [70, 71 , 80, 81, 90] then begin
    if nUnit = 70 then Result := g_WPetImg;
    if nUnit = 71 then Result := g_WPetImg;
    if nUnit = 80 then Result := g_WDragonImg;
    if nUnit = 81 then Result := g_WKuLouImages;
    if nUnit = 90 then Result := g_WEffectImg;          //¼º¹®, ¼ºº®
  end else begin
    if (nUnit < Low(g_WMonImagesArr)) or (nUnit > High(g_WMonImagesArr)) then nUnit:=0;
    if g_WMonImagesArr[nUnit] = nil then begin

      sFileName:=format(MONIMAGEFILE,[nUnit+1]);
      if nUnit >= 1000 then sFileName:=format(MONIMAGEFILEEX,[nUnit]);

      g_WMonImagesArr[nUnit]:=TWMImages.Create(nil);
      g_WMonImagesArr[nUnit].DxDraw:=g_DxDraw;
      g_WMonImagesArr[nUnit].DDraw:=g_DxDraw.DDraw;
      g_WMonImagesArr[nUnit].FileName:=sFileName;;
      g_WMonImagesArr[nUnit].LibType:=ltUseCache;
      g_WMonImagesArr[nUnit].Initialize;

    end;
    Result:=g_WMonImagesArr[nUnit];
  end;
end;

function  GetMonAction (nAppr:Integer):pTMonsterAction;
var
  FileStream:TFileStream;
  sFileName:String;
  MonsterAction:TMonsterAction;
begin
  Result:=nil;
  sFileName:=format(MONPMFILE,[nAppr]);
  if FileExists (sFileName) then begin
    FileStream:=TFileStream.Create(sFileName,fmOpenRead or fmShareDenyNone);
    FileStream.Read (MonsterAction, SizeOf(MonsterAction));
    New(Result);
    Result^:=MonsterAction;
    FileStream.Free;
  end;
end;

//Á÷¾÷¸í
//0 Àü»ç
//1 ¼ú»ç
//2 µµ»ç
//3 ÀÚ°´
function  GetJobName (nJob:Integer):String;
begin
  Result:= '';
  case nJob of
    0:Result:=g_sWarriorName;
    1:Result:=g_sWizardName;
    2:Result:=g_sTaoistName;
    3:Result:=g_sAssassinName;  //ÀÚ°´
    4:Result:=g_sBonzeName;
    5:Result:=g_sWarriorUPName;
    6:Result:=g_sWizardUPName;
    7:Result:=g_sTaoistUPName;
    8:Result:=g_sAssassinUPName;  //ÀÚ°´
    9:Result:=g_sBonzeUpName;
  end;
end;

function GetHeroGradeName(nGrade: Integer): string;
begin
  Result:= '';
  case nGrade of
    0:Result:='Ò»°ã';
    1:Result:='Á¼ºÃ';
    2:Result:='ÓÅÐã';
    3:Result:='½Ü³ö';
    4:Result:='ÍêÃÀ';
    5:Result:='ÎÞè¦';
  end;
end;

function GetSexName(sex: Integer): string;
begin
  if sex = 0 then
    Result := 'ÄÐ'
  else
    Result := 'Å®';
end;

function GetScreenX(X:Integer): Integer; //800:600 ±âÁØ
begin
  case g_FScreenMode of
    1:   //1024:768
      begin
        Result := X + 112;
      end;
    else   //800:600
      begin
        Result := X;
      end;
  end;
end;

function GetScreenY(Y:Integer): Integer;
begin
    case g_FScreenMode of
    1:   //1024:768
      begin
        Result := Y + 168;
      end;
    else   //800:600
      begin
        Result := Y;
      end;
  end;
end;

function GetScreenY2(Y:Integer): Integer;
begin
    case g_FScreenMode of
    1:   //1024:768
      begin
        Result := Y + 84;
      end;
    else   //800:600
      begin
        Result := Y;
      end;
  end;
end;

function GetItemType(ItemType:TItemType):String;
begin
  case ItemType of
    i_HPDurg    :Result:='(HP)Potions';
    i_MPDurg    :Result:='(MP)Potions';
    i_HPMPDurg  :Result:='HPMPPotions';
    i_OtherDurg :Result:='Other Drugs';
    i_Weapon    :Result:='Weapons';
    i_Dress     :Result:='Armours';
    i_Helmet    :Result:='Helmets';
    i_Necklace  :Result:='Necklaces';
    i_Armring   :Result:='Bracelets';
    i_Ring      :Result:='Rings';
    i_Belt      :Result:='Belts';
    i_Boots     :Result:='Boots';
    i_Charm     :Result:='Charms';
    i_Tiger     :Result:='Tiger';
    i_Book      :Result:='Books';
    i_PosionDurg:Result:='Poisons';
    i_UseItem   :Result:='Use Items';
    i_Scroll    :Result:='Scrolls';
    i_Stone     :Result:='Stones';
    i_Gold      :Result:='Gold';
    i_Other     :Result:='Other';
  end;
end;

function GetShowItem(sItemName:String):pTShowItem;
var
  I:Integer;
begin
  Result:=nil;
  g_ShowItemList.Lock;
  try
    for I := 0 to g_ShowItemList.Count - 1 do begin
      if CompareText(pTShowItem(g_ShowItemList.Items[I]).sItemName,sItemName) = 0 then begin
        Result:=g_ShowItemList.Items[I];
        break;
      end;
    end;
  finally
    g_ShowItemList.UnLock;
  end;
end;

procedure ClearShowItemList();
var
  ShowItem:pTShowItem;
  I:Integer;
begin
  g_ShowItemList.Lock;
  try
    for I := 0 to g_ShowItemList.Count - 1 do begin
      ShowItem:=g_ShowItemList.Items[I];
      Dispose(ShowItem);
    end;
    g_ShowItemList.Clear;
  finally
    g_ShowItemList.UnLock;
  end;
end;


procedure CheckUseFish;   //³¬½Ã ¸± ÀÚµ¿Ã¨Áú
begin
  g_AutoRateIn := 0;
  if g_UseItems[U_FISH5].S.Name <> '' then begin  //¸± ÀÚµ¿Ã¨Áú
    if g_UseItems[U_FISH5].Dura > 0 then begin
      g_AutoRateIn := HiWord(g_UseItems[U_FISH5].S.MAC);
    end;
  end;

  if g_AutoRateIn > 100 then
     g_AutoRateIn := 100;

  if Random(100) <= g_AutoRateIn then begin
    g_AutoRate := True;
  end;
end;

function CheckFishItemIdx:Integer;   //³¬½Ã ³¬À» Å¸ÀÌ¹Ö Á¦°ø
begin
  Result := 0;

  if g_UseItems[U_FISH2].S.Name <> '' then begin  //Âî ÀÔÁúÈ®·ü
   if g_UseItems[U_FISH2].Dura > 0 then begin
    Result := LoWord(g_UseItems[U_FISH2].S.AC) + Random(HiWord(g_UseItems[U_FISH2].S.AC) - LoWord(g_UseItems[U_FISH2].S.AC));
   end;
  end;

  if Random(10) <= 5 + Random(Result)  then begin
    Result := Result + 80 + Random(80);
  end else begin
    Result := 218;
  end;

end;

procedure StartFishing;      //³¬½Ã Å¸ÀÌ¸Ó½ÃÀÛ
begin
  if not FrmDlg.DFishProgressDlg.Visible then begin  //³¬½ÃÃ¢ ²¨Á®ÀÖÀ»¶§
     g_FishingOk := True;      //³¬½Ã ÇÑ´Ù.
     CheckUseFish;
     g_FishTiming := CheckFishItemIdx;             //³¬½Ã ³¬À» Å¸ÀÌ¹Ö Á¦°ø
     if g_UseItems[U_FISH1].S.Name <> '' then
      FrmDlg.DFishProgressDlg.Visible := True;     //³¬½ÃÃ¢ Å°°í
      FrmMain.FishingTime.Enabled := True;
      g_FishTime := 0;
  end;
end;

procedure ExitFishing;      //³¬½Ã °­Á¦ Á¾·á
begin
   g_MySelf.SendMsg (CM_FISHING2, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
   g_boFishCatch := False;
   g_FishingOk := False;       //³¬½Ã Áß È®ÀÎ
   g_AutoRate := False;       //³¬½Ã ¸±
   g_AutoRateIn := 0;
   g_FishTime := 0;          //³¬½Ã ½Ã°£ ÃÊ±âÈ­
   g_FishTiming := 0;        //³¬À» Å×ÀÌ¹Ö
   FrmMain.FishingTime.Enabled := False;
   FrmDlg.DFishProgressDlg.Visible := False;
end;

procedure BitingFishExit;    //³¬½Ã ÅÛ ¾ò´Â Á¾·á
begin
   g_MySelf.SendMsg (CM_FISHING2, g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, g_MySelf.m_btDir, 0, 0, '', 0);
   g_boFishCatch := True;
   g_FishingOk := False;       //³¬½Ã Áß È®ÀÎ
   g_AutoRate := False;       //³¬½Ã ¸±
   g_AutoRateIn := 0;
   g_FishTime := 0;          //³¬½Ã ½Ã°£ ÃÊ±âÈ­
   g_FishTiming := 0;        //³¬À» Å×ÀÌ¹Ö
   FrmMain.FishingTime.Enabled := False;
   FrmDlg.DFishProgressDlg.Visible := False;
end;


procedure IncFishSuccess;    //³¬½Ã ¼º°ø·ü
begin
  if g_UseItems[U_FISH4].S.Name <> '' then begin
    if g_UseItems[U_FISH4].Dura > 0 then
     Inc(g_IncFishSuccess,  LoWord(g_UseItems[U_FISH4].S.AC) + Random(HiWord(g_UseItems[U_FISH4].S.AC) - LoWord(g_UseItems[U_FISH4].S.AC)) );
  end;
end;


function CheckFishSuccess:integer;    //³¬½Ã ¼º°ø·ü
 function CheckBrigt:integer;    //¹ã ³· ½Ã°£ È®ÀÎ
 begin
   Result:= 0;
    case g_nDayBright of            //¾ÆÄ§ Àú³è »õº®
         0: Result := 15;  //ÀèÃ÷
         1: Result := 9;  //°×Ìì
         2: Result := 11;  //»Æ»è
         3: Result := 13;  //Ò¹Íí
    end;
 end;
var
  i :integer;
begin
  Result:= 0;

  Result:= Result + CheckBrigt;
  if g_UseItems[U_WEAPON].S.Name <> '' then begin     //³¬½Ã´ë ¼º°ø·ü
    if g_UseItems[U_WEAPON].Dura > 0 then
     Result:= Result + HiByte(g_UseItems[U_WEAPON].S.Accurate * 2);
  end;

  if g_UseItems[U_FISH3].S.Name <> '' then begin     //¹Ì³¢ ¼º°ø·ü
    if g_UseItems[U_FISH3].Dura > 0 then
     Result:= Result + HiWord(g_UseItems[U_FISH3].S.AC);
  end;

  if g_UseItems[U_FISH5].S.Name <> '' then begin     //¸± ¼º°ø·ü
    if g_UseItems[U_FISH5].Dura > 0 then
     Result:= Result + HiWord(g_UseItems[U_FISH5].S.AC);
  end;
  Result:= Result + g_IncFishSuccess;

  if Result > 100 then  //¼º°ø·üÀº 100% ·Î Á¦ÇÑ
    Result := 100;
end;

function GetHumUseItemByBagItem(nStdMode: Integer): Integer;
begin
  Result := -1;
  case nStdMode of //StdMode
    5, 6, 7, 90, 99: begin
        if g_UseItems[U_WEAPON].s.Name <> '' then
          Result := U_WEAPON;
      end;
    10, 11, 12: begin
        if g_UseItems[U_DRESS].s.Name <> '' then
          Result := U_DRESS;
      end;
    15: begin
        if g_UseItems[U_HELMET].s.Name <> '' then
          Result := U_HELMET;
      end;
    19, 20, 21: begin   //¸ñ°ÉÀÌ
        if g_UseItems[U_NECKLACE].s.Name <> '' then
          Result := U_NECKLACE;
      end;
    22, 23: begin    //¹ÝÁö
        if g_UseItems[U_RINGL].s.Name <> '' then
          Result := U_RINGL
        else
          if g_UseItems[U_RINGR].s.Name <> '' then
          Result := U_RINGR;
      end;
    24, 26: begin //ÆÈÂî
        if g_UseItems[U_ARMRINGL].s.Name <> '' then
          Result := U_ARMRINGL
        else
          if g_UseItems[U_ARMRINGR].s.Name <> '' then
          Result := U_ARMRINGR;
      end;
    30, 28, 29: begin
        if g_UseItems[U_RIGHTHAND].s.Name <> '' then
          Result := U_RIGHTHAND;
      end;
    25, 51: if g_UseItems[U_BUJUK].s.Name <> '' then Result := U_BUJUK; //ºÎÀû
    62: if g_UseItems[U_BOOTS].s.Name <> '' then Result := U_BOOTS; //½Å¹ß
    63: if g_UseItems[U_CHARM].s.Name <> '' then Result := U_CHARM; //¼öÈ£¼®
    64: if g_UseItems[U_BELT].s.Name <> '' then Result := U_BELT; //Çã¸®¶ì
    101, 102: if g_UseItems[U_TIGER].s.Name <> '' then Result := U_TIGER;
  end;
end;


function GetHeroUseItemByBagItem(nStdMode: Integer): Integer;
begin
  Result := -1;
  case nStdMode of //StdMode
    5, 6, 7, 90, 99: begin
        if g_HeroUseItems[U_WEAPON].s.Name <> '' then
          Result := U_WEAPON;
      end;
    10, 11, 12: begin
        if g_HeroUseItems[U_DRESS].s.Name <> '' then
          Result := U_DRESS;
      end;
    15: begin
        if g_HeroUseItems[U_HELMET].s.Name <> '' then
          Result := U_HELMET;
      end;
    19, 20, 21: begin   //¸ñ°ÉÀÌ
        if g_HeroUseItems[U_NECKLACE].s.Name <> '' then
          Result := U_NECKLACE;
      end;
    22, 23: begin    //¹ÝÁö
        if g_HeroUseItems[U_RINGL].s.Name <> '' then
          Result := U_RINGL
        else
          if g_HeroUseItems[U_RINGR].s.Name <> '' then
          Result := U_RINGR;
      end;
    24, 26: begin //ÆÈÂî
        if g_HeroUseItems[U_ARMRINGL].s.Name <> '' then
          Result := U_ARMRINGL
        else
          if g_HeroUseItems[U_ARMRINGR].s.Name <> '' then
          Result := U_ARMRINGR;
      end;
    30, 28, 29: begin
        if g_HeroUseItems[U_RIGHTHAND].s.Name <> '' then
          Result := U_RIGHTHAND;
      end;
    25, 51: if g_HeroUseItems[U_BUJUK].s.Name <> '' then Result := U_BUJUK; //ºÎÀû
    62: if g_HeroUseItems[U_BOOTS].s.Name <> '' then Result := U_BOOTS; //½Å¹ß
    63: if g_HeroUseItems[U_CHARM].s.Name <> '' then Result := U_CHARM; //¼öÈ£¼®
    64: if g_HeroUseItems[U_BELT].s.Name <> '' then Result := U_BELT; //Çã¸®¶ì
  end;
end;

function GetStorePriceName(btType: Byte): string;       //°³ÀÎ»óÁ¡
begin
  Result := '½ð±Ò';
  case btType of
    0: Result := '½ð±Ò';
    1: Result := 'µãÈ¯';
  end;
end;

function FindPath(StartX, StartY, StopX, StopY: Integer): TPath;
begin
  Result := nil;
  Result := g_LegendMap.FindPath(StartX, StartY, StopX, StopY, 0);
  if High(Result) < 2 then begin
    Result := nil
  end;
end;

function FindPath(StopX, StopY: Integer): TPath;
begin
  Result := nil;
  Result := g_LegendMap.FindPath(g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, StopX, StopY, 0);
  if High(Result) < 2 then begin
    Result := nil
  end;
end;

procedure DynArrayDelete(var A; elSize: Longint; index, Count: Integer);
  function MIN(n1, n2: Integer): Integer;
  begin
    if n1 < n2 then
      Result := n1
    else
      Result := n2;
  end;
var
  len, MaxDelete: Integer;

  P: PLongint; //4   ¸ö×Ö½ÚµÄ³¤ÕûÐÎÖ¸Õë
begin
  P := PLongint(A); //   È¡µÄ   A   µÄµØÖ·
  if P = nil then
    Exit;
  len := PLongint(PChar(P) - 4)^; //   ±äÁ¿µÄ³¤¶È   £¬Æ«ÒÆÁ¿   -4
  if index >= len then //ÒªÉ¾³ýµÄÎ»ÖÃ³¬³ö·¶Î§£¬ÍË³ö
    Exit;
  MaxDelete := len - index; //   ×î¶àÉ¾³ýµÄÊýÁ¿
  Count := Min(Count, MaxDelete); //   È¡µÃÒ»¸ö½ÏÐ¡Öµ
  if Count = 0 then //   ²»ÒªÇóÉ¾³ý
    Exit;
  Dec(len, Count); //   ÒÆ¶¯µ½ÒªÉ¾³ýµÄÎ»ÖÃ
  MoveMemory(PChar(P) + index * elSize, PChar(P) + (index + Count) * elSize, (len - index) * elSize); //ÒÆ¶¯ÄÚ´æ
  Dec(P); //ÒÆ³ö   ¡°Êý×é³¤¶È¡±Î»ÖÃ
  Dec(P); //ÒÆ³ö¡°ÒýÓÃ¼ÆÊý¡±   Î»ÖÃ
  //ÖØÐÂÔÙ·ÖÅäµ÷ÕûÄÚ´æ,len   ÐÂµÄ³¤¶È.   Sizeof(Longint)   *   2   =   2*Dec(P)
  ReallocMem(P, len * elSize + Sizeof(Longint) * 2);
  Inc(P); //   Ö¸ÏòÊý×é³¤¶È
  P^ := len; //   new   length
  Inc(P); //   Ö¸ÏòÊý×éÔªËØ£¬¿ªÊ¼µÄÎ»ÖÃ
  PLongint(A) := P;
end;

procedure GotoClickNpc(nX, nY: Integer);
var
  Actor: TActor;
  i: Integer;
begin
  for i := PlayScene.m_ActorList.Count - 1 downto 0 do begin
    Actor := TActor(PlayScene.m_ActorList[i]);
    if (Actor.m_btRace = RCC_MERCHANT) and (Actor.m_nCurrX = nX) and (Actor.m_nCurrY = nY) then begin
      g_dwClickNpcTick := GetTickCount;
      SendClientMessage(CM_CLICKNPC, Actor.m_nRecogId, 0, 0, 0);
      break;
    end;
  end;
end;

procedure ScriptGoto(sCmd: string);
var
  sPlace, sX, sY, sMapName: string;
  nX, nY: Integer;
begin
  if g_MySelf = nil then exit;
  g_nScriptGotoStr := sCmd;
  ArrestStringEx(sCmd, '(', ')', sCmd);
  while (True) do begin
    if sCmd = '' then break;
    sCmd := GetValidStr3(sCmd, sPlace, [';', ' ']);
    if sPlace = '' then break;
    sPlace := GetValidStr3(sPlace, sMapName, [',', ' ']);
    sPlace := GetValidStr3(sPlace, sX, [',', ' ']);
    sPlace := GetValidStr3(sPlace, sY, [',', ' ']);
    nX := StrToIntDef(sX, -1);
    nY := StrToIntDef(sY, -1);
    if (sMapName <> '') and (CompareText(sMapName, g_sMapTitle) = 0) and (nX <> -1) and (nY <> -1) then begin
      if (abs(g_MySelf.m_nCurrX - nX) <= 3) and (abs(g_MySelf.m_nCurrY - nY) <= 3) then begin
        GotoClickNpc(nX, nY);
        exit;
      end;
      g_nMiniMapOldX := -1;
      g_nMiniMapPath := FindPath(nX, nY);
      if High(g_nMiniMapPath) > 2 then begin
        g_boAutoMoveing := False;
        g_nMiniMapMoseX := nX;
        g_nMiniMapMoseY := nY;
        g_nScriptGotoX := nX;
        g_nScriptGotoY := nY;
        g_boAutoMoveing := True;
        g_boNpcMoveing := True;
      end
      else begin
        g_nMiniMapMoseX := -1;
        g_nMiniMapMoseY := -1;
        g_nScriptGotoX := -1;
        g_nScriptGotoY := -1;
        DScreen.AddSysMsg('[Í£Ö¹×Ô¶¯ÒÆ¶¯¡£]', 40, 60, clYellow);
      end;
      exit;
    end;
  end;
  //DScreen.AddSysMsg('[ÎÞ·¨ÔÚµ±Ç°µØÍ¼Ê¹ÓÃ]', clRed);
end;


function GetMissionInfo(sMissionName: string): pTClientMission;
var
  ClientMission: pTClientMission;
  i: integer;
begin
  Result := nil;
  for I := 0 to g_MissionList.Count - 1 do begin
    ClientMission := pTClientMission(g_MissionList[i]);
    if CompareText(ClientMission.sMissionName,sMissionName) = 0 then begin
      Result := ClientMission;
      break;
    end;
  end;
end;

function GetMissionFlagStatus(nFlag: Integer): Integer;
var
  n10, n14: Integer;
begin
  Result := 0;
  Dec(nFlag);
  if nFlag < 0 then Exit;
  n10 := nFlag div 8;
  n14 := (nFlag mod 8);
  if (n10 in [Low(g_MissionFlag)..High(g_MissionFlag)]) then begin
    if ((128 shr n14) and (g_MissionFlag[n10])) <> 0 then
      Result := 1
    else
      Result := 0;
  end;
end;

procedure ClearMissionList();
var
  i: integer;
begin
  for I := 0 to g_MissionList.Count - 1 do begin
    Dispose(pTClientMission(g_MissionList[i]));
  end;
  g_MissionList.Clear;
end;

procedure LoadMissionList(const StringList: TStringList);
  procedure GetSceipt(ClientMission: pTClientMission; sStr: string);
  var
    sCmd, sParam1, sParam2, sParam3, sParam4, sAllParam: string;
    MissionScript: pTMissionScript;
    nCode: Integer;
  begin
    sStr := GetValidStr3(sStr, sCmd, [' ', #9]);
    sAllParam := sStr;
    nCode := 0;
    sStr := GetValidStr3(sStr, sParam1, [' ', #9]);
    sStr := GetValidStr3(sStr, sParam2, [' ', #9]);
    sStr := GetValidStr3(sStr, sParam3, [' ', #9]);
    sStr := GetValidStr3(sStr, sParam4, [' ', #9]);
    if CompareText(sCmd, '#IF') = 0 then begin
      nCode := MCC_IF;
    end else
    if CompareText(sCmd, '#WRITE') = 0 then begin
      nCode := MCC_WRITE;
    end else
    if CompareText(sCmd, '#ENDIF') = 0 then begin
      nCode := MCC_ENDIF;
    end;
    if nCode > 0 then begin
      New(MissionScript);
      MissionScript.sCMDCode := nCode;
      MissionScript.sParam1 := sParam1;
      MissionScript.sParam2 := sParam2;
      MissionScript.sParam3 := sParam3;
      MissionScript.sParam4 := sParam4;
      MissionScript.sAllParam := sAllParam;
      MissionScript.nParam1 := StrToIntDef(sParam1, 0);
      MissionScript.nParam2 := StrToIntDef(sParam2, 0);
      MissionScript.nParam3 := StrToIntDef(sParam3, 0);
      MissionScript.nParam4 := StrToIntDef(sParam4, 0);
      if ClientMission.ScriptList = nil then ClientMission.ScriptList := TList.Create;
      ClientMission.ScriptList.Add(MissionScript);
    end;
  end;
var
  I: Integer;
  sStr, sName, sValue: string;
  ClientMission: pTClientMission;
  boBegin: Boolean;
begin
  ClearMissionList();
  boBegin := False;
  ClientMission := nil;
  for I := 0 to StringList.Count - 1 do begin
    sStr := Trim(StringList[i]);
    if (sStr = '') or (sStr[1] = ';') then Continue;
    if boBegin then begin
      if sStr <> '}' then begin
        if sStr[1] = '#' then begin
          GetSceipt(ClientMission, sStr);
        end else begin
          if ClientMission <> nil then
            ClientMission.sMissionHint := ClientMission.sMissionHint + sStr;
        end;
      end else
        boBegin := False;
    end else
    if sStr[1] = '[' then begin
      if (ClientMission <> nil) then begin
        g_MissionList.Add(ClientMission);
        ClientMission := nil;
      end;
      ArrestStringEx(sStr, '[', ']', sName);
      if sName <> '' then begin
        New(ClientMission);
        SafeFillChar(ClientMission^, SizeOf(TClientMission), #0);
        ClientMission.sMissionName := sName;
        ClientMission.MissionInfo := nil;
        ClientMission.btJob := 99;
        ClientMission.btSex := 99;
        ClientMission.NPC := nil;
        ClientMission.boAccept := True;
        ClientMission.ScriptList := nil;
      end;
    end else
    if (sStr = '{') and (ClientMission <> nil) then begin
      boBegin := True;
    end else
    if (ClientMission <> nil) then begin
      sValue := GetValidStr3(sStr, sName, [';', ',', '=', ' ', #9]);
      if sName = 'Master' then begin
        ClientMission.sMissionMaster := sValue;
      end else
      if sName = 'Name' then begin
        ClientMission.sMissionShowName := sValue;
      end else
      if sName = 'Tips' then begin
        ClientMission.sCanAcceptText := sValue;
      end else
      if sName = 'Map' then begin
        ClientMission.sCanAcceptMapName := sValue;
      end else
      if sName = 'Hide_Show' then begin
        ClientMission.boHide := sValue = '1';
      end else
      if sName = 'Cancel' then begin
        ClientMission.wLogoutIdx := StrToIntDef(sValue, 0);
      end else
      if sName = 'Cycles' then begin
        ClientMission.btCycCount := StrToIntDef(sValue, 0);
      end else
      if sName = 'Loop variable' then begin
        ClientMission.btCycVar := StrToIntDef(sValue, 0);
      end else
      if sName = 'Accept' then begin
        if sValue = '1' then ClientMission.boAccept := False
        else ClientMission.boAccept := True;
      end else
      if CompareText(sName, 'NPC_Map') = 0 then begin
        ClientMission.sNPCMapName := sValue;
      end else
      if CompareText(sName, 'NPC_X') = 0 then begin
        ClientMission.wNPCCurrX := StrToIntDef(sValue, 0);
      end else
      if CompareText(sName, 'NPC_Y') = 0 then begin
        ClientMission.wNPCCurrY := StrToIntDef(sValue, 0);
      end else
      if sName = 'Condition_Variable' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.AcceptFlag[0].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = 'Condition_Value' then begin
        ClientMission.AcceptFlag[0].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = 'Ìõ¼þ_±äÁ¿2' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.AcceptFlag[1].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = 'Ìõ¼þ_±äÁ¿Öµ2' then begin
        ClientMission.AcceptFlag[1].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = 'Ìõ¼þ_±äÁ¿3' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.AcceptFlag[2].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = 'Ìõ¼þ_±äÁ¿Öµ3' then begin
        ClientMission.AcceptFlag[2].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = 'MinLevel' then begin
        ClientMission.nMinLevel := StrToIntDef(sValue, 0);
      end else
      if sName = 'MaxLevel' then begin
        ClientMission.nMaxLevel := StrToIntDef(sValue, 0);
      end else
      if sName = 'Job' then begin
        ClientMission.btJob := StrToIntDef(sValue, 0);
      end else
      if sName = 'Sex' then begin
        ClientMission.btSex := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.CompleteFlag[0].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿Öµ' then begin
        ClientMission.CompleteFlag[0].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿2' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.CompleteFlag[1].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿Öµ2' then begin
        ClientMission.CompleteFlag[1].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿3' then begin
        if Pos(']', sValue) > 0 then
          ArrestStringEx(sValue, '[', ']', sValue);
        ClientMission.CompleteFlag[2].nFlag := StrToIntDef(sValue, 0);
      end else
      if sName = '½áÊø_±äÁ¿Öµ3' then begin
        ClientMission.CompleteFlag[2].btValue := StrToIntDef(sValue, 0);
      end else
      if sName = 'Item1' then begin
        ClientMission.CompleteItem[0].sItemName := sValue;
      end else
      if sName = 'ItemCount1' then begin
        ClientMission.CompleteItem[0].wItemCount := StrToIntDef(sValue, 0);
      end else
      if sName = 'Item2' then begin
        ClientMission.CompleteItem[1].sItemName := sValue;
      end else
      if sName = 'ItemCount2' then begin
        ClientMission.CompleteItem[1].wItemCount := StrToIntDef(sValue, 0);
      end else
      if sName = 'Item3' then begin
        ClientMission.CompleteItem[2].sItemName := sValue;
      end else
      if sName = 'ItemCount3' then begin
        ClientMission.CompleteItem[2].wItemCount := StrToIntDef(sValue, 0);
      end else
      if sName = 'Kill_Mon1' then begin
        ClientMission.sKillMonName1 := sValue;
      end else
      if sName = 'Kill_MonCount1' then begin
        ClientMission.btKillCount1 := StrToIntDef(sValue, 0);
      end else
      if sName = 'Kill_Mon2' then begin
        ClientMission.sKillMonName2 := sValue;
      end else
      if sName = 'Kill_MonCount2' then begin
        ClientMission.btKillCount2 := StrToIntDef(sValue, 0);
      end;
    end;
  end;
  if (ClientMission <> nil) then begin
    g_MissionList.Add(ClientMission);
  end;
end;

procedure LoadMagicDescList;
var
  I, npos: Integer;
  sLineText: string;
  LoadList: TStringList;
  ItemDesc: pTItemDesc;
begin
  LoadList := TStringList.Create;
  if FileExists(MAGICDESCFILE) then begin
    try
      LoadList.LoadFromFile(MAGICDESCFILE);
    except
    end;
  end;

  for I := 0 to LoadList.Count - 1 do begin
    sLineText := Trim(LoadList.Strings[I]);
    if (sLineText <> '') and (sLineText[1] <> ';') then begin
      npos := Pos('=', sLineText);
      if npos > 0 then begin
        New(ItemDesc);
        ItemDesc.Name := Trim(Copy(sLineText, 1, npos - 1));
        ItemDesc.desc := Trim(Copy(sLineText, npos + 1, Length(sLineText)));
        g_MagicDescList.AddObject(ItemDesc.Name, TObject(ItemDesc));
      end;
    end;
  end;
  FreeAndNil(LoadList);
end;

procedure UnLoadMagicDescList;
var
  I: Integer;
begin
  for I := 0 to g_MagicDescList.Count - 1 do begin
    Dispose(pTItemDesc(g_MagicDescList.Objects[I]));
  end;
  FreeAndNil(g_MagicDescList);
end;

function GetMagicDesc(sItemName: string): string;
var
  I, nPos: Integer;
begin
  Result := '';
  nPos := Pos('(Bind)', sItemName);
  if nPos > 0 then
    sItemName := Copy(sItemName, 5, Length(sItemName) - 4);
  g_MagicDescList.Lock;
  try
    for I := 0 to g_MagicDescList.Count - 1 do begin
      if CompareText(g_MagicDescList.Strings[I], sItemName) = 0 then begin
        Result := pTItemDesc(g_MagicDescList.Objects[I]).desc;
        Break;
      end;
    end;
  finally
    g_MagicDescList.UnLock;
  end;
end;

function GetMagicImages(typeimage: integer): TWMImages;
var
  I, nPos: Integer;
begin
//  Result := nil ;
  if typeimage in [112..141] then begin
    Result := g_WMagNewIconImages;
  end else begin
    Result := g_WMagIconImages;
  end;

end;

function GetMagic2Images(typeimage: integer): TWMImages;
var
  I, nPos: Integer;
begin
 // Result := nil ;
  if typeimage in [112..141] then begin
    Result := g_WMagNewIcon2Images;
  end else begin
    Result := g_WMagIcon2Images;
  end;

end;


procedure ClearGroupMember(boHint: Boolean; Hint: byte; sys:string);
var
  GroupMember: pTGroupMember;
  i: Integer;
begin
  for i := 0 to g_MemberGroup.Count - 1 do begin
    GroupMember := g_MemberGroup.Items[i];
    Dispose(GroupMember);
  end;
  PlayScene.ClearGroup();
  g_MemberGroup.Clear;
  GroupIdList.Clear;
  FrmDlg.SetGroupWnd;
  if boHint then begin
    case Hint of
     0 : DScreen.AddSysMsg('[ÄãÒÑ¾­ÍË³öÁË¶ÓÎé¡£]', 40, 60, clWhite);     //»õ·Î °á¼º
     1 : DScreen.AddSysMsg('[ÄãµÄ¶ÓÎé½âÉ¢ÁË¡£]', 40, 60, clWhite);
 //    2 : DScreen.AddSysMsg('[<CO$FFFF00>' + sys + '<CE>' + '´ÔÀÌ <CO$FFFF>±×·ìÀåÀÌ<CE> µÇ¾ú½À´Ï´Ù.]', 40, 60, clWhite);
    end;
  end;
end;


procedure LoadItemDescList;
var
  I, npos: Integer;
  sLineText: string;
  LoadList: TStringList;
  ItemDesc: pTItemDesc;
begin
  LoadList := TStringList.Create;
  if FileExists(ITEMDESCFILE) then begin
    try
      LoadList.LoadFromFile(ITEMDESCFILE);
    except
    end;
  end;
  for I := 0 to LoadList.Count - 1 do begin
    sLineText := Trim(LoadList.Strings[I]);
    if (sLineText <> '') and (sLineText[1] <> ';') then begin
      npos := Pos('=', sLineText);
      if npos > 0 then begin
        New(ItemDesc);
        ItemDesc.Name := Trim(Copy(sLineText, 1, npos - 1));
        ItemDesc.desc := Trim(Copy(sLineText, npos + 1, Length(sLineText)));
        g_ItemDescList.AddObject(ItemDesc.Name, TObject(ItemDesc));
      end;
    end;
  end;
  FreeAndNil(LoadList);
end;

procedure UnLoadItemDescList;
var
  I: Integer;
begin
  for I := 0 to g_ItemDescList.Count - 1 do begin
    Dispose(pTItemDesc(g_ItemDescList.Objects[I]));
  end;
  FreeAndNil(g_ItemDescList);
end;

function GetItemDesc(sItemName: string): string;
var
  I, nPos: Integer;
begin
  Result := '';
  nPos := Pos('(Bind)', sItemName);
  if nPos > 0 then
    sItemName := Copy(sItemName, 5, Length(sItemName) - 4);
  g_ItemDescList.Lock;
  try
    for I := 0 to g_ItemDescList.Count - 1 do begin
      if CompareText(g_ItemDescList.Strings[I], sItemName) = 0 then begin
        Result := pTItemDesc(g_ItemDescList.Objects[I]).desc;
        Break;
      end;
    end;
  finally
    g_ItemDescList.UnLock;
  end;
end;

function  CheckCanWakeUp(Item:TClientItem):Boolean;    //°¢¼º °¡´É¿©ºÎ È®ÀÎ
begin
  Result:= False;
  if (item.S.StdMode in [5,6,90,99,10,11,12,15]) and (item.S.btValue[19] = 0) then //±â°£Á¦ ¾ÈµÊ
   Result:= True;
end;


function  CheckCanDeal(Item:TClientItem):Boolean;    //°Å·¡°¡´É¿©ºÎ È®ÀÎ
begin
  Result:= False;
  if (item.S.btValue[19] <> 1) and (item.S.btValue[19] <> 3) and item.S.boCanTrade then    //´ë¿©, ºÀÀÎ
   Result:= true;
end;


function  CheckCanSell(Item:TClientItem):Boolean;    //ÆÇ¸Å°¡´É¿©ºÎ È®ÀÎ
begin
  Result:= False;
  if (item.S.btValue[19] <> 1) and (item.S.btValue[19] <> 3) and item.S.boCanSell then    //´ë¿©, ºÀÀÎ
   Result:= true;
end;

function  CheckUpwaionmode(mode:Integer):Boolean;    //Àç·Ã
begin
  Result:= False;
  if mode in [19,20,21,22,23,24,26,43] then
   Result:= true;
end;

function  CheckUpWeapon(mode:Integer):Boolean;    //Àç·Ã
begin
  Result:= False;
  if mode in [5,6,99,90] then
   Result:= true;
end;

function  Checkkeyamount(amount:String):Boolean;    //¹°¾à
var
  i:Integer;
begin
 Result:= False;
   for i :=1 to length(amount) do begin
      if not (amount[i] in ['0'..'9'])then
      Result:= true;
   end;
end;

function  CheckItemMode(mouseItem,dobItem:TClientItem):Boolean;    //¹°¾à
var
  itemmax:Integer;
begin
 Result:= False;
 itemmax := 0;
 if (mouseItem.S.StdMode in [46]) and (dobItem.S.StdMode in [46]) then begin  //°¢¼º
  if mouseItem.S.StdMode in [46] then
    itemmax := dobItem.S.MaxAmount;
  if (mouseItem.S.Name = dobItem.S.Name) and (mouseItem.S.StdMode = dobItem.S.StdMode) and (mouseItem.S.Grade = dobItem.S.Grade) and
    (mouseItem.S.Shape = dobItem.S.Shape) and (mouseItem.Dura < itemmax) and (dobItem.Dura < itemmax) then
     Result:= True;
 end else
 if (mouseItem.S.StdMode in [0,1,3,45,49]) and (dobItem.S.StdMode in [0,1,3,45,49]) then begin  //¹°¾à
  if mouseItem.S.StdMode in [0,1,3,45,49] then
    itemmax := dobItem.S.MaxAmount;  //¹°¾à Àç·á °¹¼ö
  if (mouseItem.S.Name = dobItem.S.Name) and (mouseItem.S.StdMode = dobItem.S.StdMode) and
    (mouseItem.S.Shape = dobItem.S.Shape) and (mouseItem.Amount < itemmax) and (dobItem.Amount < itemmax) then
     Result:= True;
 end;
end;

procedure SaveUserConfig(sUserName:String);
var
  ShowItem:pTShowItem;
  Ini:TIniFile;
  sFileName:String;
  I:Integer;
  sItemName,sLineText:String;
  sType,sPickup,sShow,sFColor,sBColor:String;
begin
  if sUserName <> '' then sFileName := format(CONFIGFILE,[sUserName])
  else sFileName:=format(CONFIGFILE,['Config']);
  Ini:=TIniFile.Create(sFileName);
  g_ShowItemList.Lock;
  try
    for I := 0 to g_ShowItemList.Count - 1 do begin
      ShowItem:=g_ShowItemList.Items[I];
      sType:=IntToStr(Integer(ShowItem.ItemType));
      if ShowItem.boAutoPickup then sPickup:='1'
      else sPickup:='0';
      if ShowItem.boShowName then sShow:='1'
      else sShow:='0';
      Ini.WriteString('Items',ShowItem.sItemName,format('%s,%s,%s,%d,%d',[sType,sPickup,sShow,ShowItem.nFColor,ShowItem.nBColor]));
    end;
  finally
    g_ShowItemList.UnLock;
  end;
  Ini.Free;
end;

procedure LoadUserConfig(sUserName:String);
var
  ShowItem:pTShowItem;
  Ini:TIniFile;
  sFileName:String;
  Strings: TStringList;
  I:Integer;
  sItemName,sLineText:String;
  sType,sPickup,sShow,sFColor,sBColor:String;
begin
  sFileName:=format(CONFIGFILE,[sUserName]);
  if not FileExists(sFileName) then begin
    sFileName:=format(CONFIGFILE,['Config']);
  end;
  if FileExists(sFileName) then begin
    Ini:=TIniFile.Create(sFileName);
    Strings:=TStringList.Create;
    g_ShowItemList.Lock;
    try
      Ini.ReadSection('Items',Strings);
      for I := 0 to Strings.Count - 1 do begin
        sItemName:=Strings.Strings[I];
        if sItemName = '' then Continue;
        sLineText:=Ini.ReadString('Items',sItemName,'');
        sLineText:=GetValidStr3(sLineText,sType,[',']);
        sLineText:=GetValidStr3(sLineText,sPickup,[',']);
        sLineText:=GetValidStr3(sLineText,sShow,[',']);
        sLineText:=GetValidStr3(sLineText,sFColor,[',']);
        sLineText:=GetValidStr3(sLineText,sBColor,[',']);
        if (sType <> '') and (sPickup <> '') and (sShow <> '') and (sFColor <> '') and (sBColor <> '') then begin
          New(ShowItem);
          ShowItem.sItemName:=sItemName;
          ShowItem.ItemType:=TItemType(Str_ToInt(sType,0));
          ShowItem.boAutoPickup:= sPickup = '1';
          ShowItem.boShowName:= sShow = '1';
          ShowItem.nFColor:=Str_ToInt(sFColor,0);
          ShowItem.nBColor:=Str_ToInt(sBColor,0);
          g_ShowItemList.Add(ShowItem);
        end;
      end;
    finally
      g_ShowItemList.UnLock;
    end;
    Strings.Free;
    Ini.Free;
    exit;
  end;
end;

procedure stringtolists(str:string;cra:Char; onid,outid:Integer; var str1:string);
var
  data:string;
  I:Integer;
begin
   I:=-1;
   str1 := '';
  while True do begin
   if str = '' then break;
       str := GetValidStr3(str, data, [cra]);
       Inc(I);
     if I >= onid then
      str1 := str1+data+cra;
     if I >= outid+onid then exit;
  end;
end;

function StrCountToInteger(str:string;cra:Char):Integer;
var
  data:string;
  I:Integer;
begin
  Result := 0;
  I := 0;
 while True do begin
  if str = '' then break;
   str := GetValidStr3(str, data, [cra]);
   if str <> '' then
   Inc(I);
 end;
 if I > 0 then
  Result := I;
end;

function CCheck(code: Integer): Integer;
begin
  Result := code;
  if code < 0 then
    raise ECompressionError.Create('ZIP Error'); //!!
end;

function DCheck(code: Integer): Integer;
begin
  Result := code;
  if code < 0 then
    raise EDecompressionError.Create('ZIP Error');  //!!
end;

function ZIPDecompress(const InBuf: Pointer; InBytes: Integer; OutEstimate: Integer; out OutBuf: PChar): Integer;
var
  strm: TZStreamRec;
  P: Pointer;
  BufInc: Integer;
begin
  SafeFillChar(strm, sizeof(strm), 0);
  strm.zalloc := zlibAllocMem;
  strm.zfree := zlibFreeMem;
  BufInc := (InBytes + 255) and not 255;
  if OutEstimate = 0 then
    Result := BufInc
  else
    Result := OutEstimate;
  GetMem(OutBuf, Result);
  try
    strm.next_in := InBuf;
    strm.avail_in := InBytes;
    strm.next_out := OutBuf;
    strm.avail_out := Result;
    DCheck(inflateInit_(strm, zlib_version, sizeof(strm)));
    try
      while DCheck(inflate(strm, Z_FINISH)) <> Z_STREAM_END do
      begin
        P := OutBuf;
        Inc(Result, BufInc);
        ReallocMem(OutBuf, Result);
        strm.next_out := PChar(Integer(OutBuf) + (Integer(strm.next_out) - Integer(P)));
        strm.avail_out := BufInc;
      end;
    finally
      DCheck(inflateEnd(strm));
    end;
    ReallocMem(OutBuf, strm.total_out);
    Result := strm.total_out;
  except
    FreeMem(OutBuf);
    OutBuf := nil;
    //raise
  end;
end;


function GetCompoundInfos(const sItemName: string): pTCompoundInfos;
var
  nIndex: Integer;
begin
  Result := nil;
  nIndex := g_CompoundInfoList.IndexOf(sItemName);
  if nIndex < 0 then
    exit;
  Result := pTCompoundInfos(g_CompoundInfoList.Objects[nIndex]);
end;

procedure ClearMapDescList();
var
  i, ii: integer;
  MapDescList: pTMapDescList;
begin
  for i := 0 to g_MapDescList.Count - 1 do begin
    MapDescList := g_MapDescList[i];
    for ii := 0 to MapDescList.MaxList.Count - 1 do
      Dispose(pTMapDesc(MapDescList.MaxList[ii]));
    for ii := 0 to MapDescList.MinList.Count - 1 do
      Dispose(pTMapDesc(MapDescList.MinList[ii]));
    MapDescList.MaxList.Free;
    MapDescList.MinList.Free;
    Dispose(MapDescList);
  end;
  g_MapDescList.Clear;
end;

function GetMapDescList(sMapName: string): pTMapDescList;
var
  i: integer;
  MapDescList: pTMapDescList;
begin
  Result := nil;
  for i := 0 to g_MapDescList.Count - 1 do begin
    MapDescList := g_MapDescList[i];
    if MapDescList.sMapName = sMapname then begin
      Result := MapDescList;
      break;
    end;
  end;
end;

procedure LoadMapDescList(const StringList: TStringList);
  procedure AddMapDescToList(sMapName: string; MapDesc: pTMapDesc; boMax: Boolean);
  var
    i: integer;
    MapDescList: pTMapDescList;
  begin
    for I := g_MapDescList.Count - 1 downto 0 do begin
      MapDescList := g_MapDescList[i];
      if MapDescList.sMapName = sMapName then begin
        if boMax then
          MapDescList.MaxList.Add(MapDesc)
        else
          MapDescList.MinList.Add(MapDesc);
        exit;
      end;
    end;
    New(MapDescList);
    MapDescList.sMapName := sMapName;
    MapDescList.MaxList := TList.Create;
    MapDescList.MinList := TList.Create;
    if boMax then
      MapDescList.MaxList.Add(MapDesc)
    else
      MapDescList.MinList.Add(MapDesc);
    g_MapDescList.Add(MapDescList);
  end;
var
  i: integer;
  str: string;
  MapDesc: pTMapDesc;
  sMapName, sx, sy, sName, sColor, sMax: string;
begin
  ClearMapDescList();
  for I := 0 to StringList.Count - 1 do begin
    str := stringlist[I];
    if (str <> '') and (str[1] <> ';') then begin
      str := GetValidStr3(str, sMapName, [',', #9]);
      str := GetValidStr3(str, sx, [',', #9]);
      str := GetValidStr3(str, sy, [',', #9]);
      str := GetValidStr3(str, sName, [',', #9]);
      str := GetValidStr3(str, sColor, [',', #9]);
      str := GetValidStr3(str, sMax, [',', #9]);
      if (sMax <> '') then begin
        New(MapDesc);
        MapDesc.sName := sName;
        MapDesc.nX := StrToIntDef(sX, -1);
        MapDesc.nY := StrToIntDef(sY, -1);
        MapDesc.nColor := StrToIntDef(sColor, 0);
        AddMapDescToList(sMapName, MapDesc, (sMax = '0'));
      end;
    end;
  end;
end;


initialization
begin
   g_MissionList := TList.Create;
   g_OperateHintList := TStringList.Create;
end;

finalization
begin
  g_MissionList.Free;
  g_OperateHintList.Free;
end;

end.
