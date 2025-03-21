unit M2Share;

interface

uses
  {svn,} Windows, Messages, Classes, SysUtils, StdCtrls, Graphics, RunSock, Envir, ItmUnit, Magic, NoticeM, Guild, Event, Forms, ZLIB,
  Castle, FrnEngn, UsrEngn, MudUtil, Grobal2, ObjBase, ObjRobot, ObjNpc, SyncObjs, IniFiles, SDK, EncryptUnit, WinSock, MD5Unit, GuildTerritory, DragonSystem;

ResourceString
  g_sTitleName   = 'M2';
  g_sProductName = 'M2';
  g_sVersion     = 'Build 20151006';
  g_sUpDateTime  = '2015/10/06';
  g_sProgram     = 'M2';
  g_sWebSite     = '';

const
  DEBUG        = 1;
  CHECKNEWMSG  = 0;

  NOEXCEPTION  = 0;
  TRYEXCEPTION = 1;
  CATEXCEPTION = TRYEXCEPTION;

  DEMOCLIENT   = 0;

  OEM          = 0;
  OEM775       = 1;
  OEMVER       = OEM;

  IniSystem    = 0; //0:Old, 1:New

  MAXCHANGELEVEL = 500;

  OLDMONSTERMODE    = 0;
  NEWMONSTERMODE    = 1;
  PROCESSMONSTMODE  = NEWMONSTERMODE;

  THREADENGINE      = 0;
  TIMERENGINE       = 1;
  DBSOCKETMODE      = TIMERENGINE;
  IDSOCKETMODE      = TIMERENGINE;
  USERENGINEMODE    = TIMERENGINE;

  MAXUPGUILDLEVEL  = 35; //巩颇己厘
  MAXUPLEVEL  = High(Word) {65535};
  MAXHUMPOWER = High(Word) {65535};

  BODYLUCKUNIT = 5000;

  DEFHIT       = 5;
  DEFSPEED     = 15;

  //流诀函版
  jWarr        = 0;
  jWizard      = 1;
  jTaos        = 2;
  jAssassin    = 3;   //磊按
  jBonze       = 4;   //铰妨

  jUpWarr      = 5;
  jUpWiz       = 6;
  jUpTao       = 7;
  jUpAssa      = 8;
  jUpBoz       = 9;  //铰妨

  SIZEOFTHUMAN           = 7959;     //荤捞令 坷宏 绒刚

  MONSTER_SANDMOB        = 3;
  MONSTER_ROCKMAN        = 4;
  MONSTER_RON            = 9;
  MONSTER_MINORNUMA      = 18;
  ARCHER_POLICE          = 20;

  SUPREGUARD             = 11;
  PETSUPREGUARD          = 12;

  ANIMAL_CHICKEN         = 51;
  ANIMAL_DEER            = 52;
  ANIMAL_WOLF            = 53;
  RC_RUNAWAY             = 54;
  TRAINER                = 55;

  MONSTER_OMA            = 80;
  MONSTER_OMAKNIGHT      = 81;
  MONSTER_SPITSPIDER     = 82;
  MONSTER_STICK          = 85;
  MONSTER_DUALAXE        = 87;
  MONSTER_THONEDARK      = 93;
  MONSTER_LIGHTZOMBI     = 94;
  MONSTER_DIGOUTZOMBI    = 95;
  MONSTER_ZILKINZOMBI    = 96;
  MONSTER_WHITESKELETON  = 100;
  MONSTER_SCULTURE       = 101;
  MONSTER_SCULTUREKING   = 102;
  MONSTER_BEEQUEEN       = 103;
  MONSTER_ARCHERGUARD    = 112;
  MONSTER_ELFMONSTER     = 113; //脚荐
  MONSTER_ELFWARRIOR     = 114;
  MONSTER_BEE            = 125;
  MONSTER_DARKANGEL      = 136; //去飞
  MONSTER_ANGEL          = 141; //岿飞
  RC_CLONE               = 142;
  MONSTER_MAGUNGSA       = 143;
  MONSTER_STONE          = 153;
  RC_DARKCLONE           = 154;
  RC_BONZECLONE          = 251;
  MONSTER_SCULTURE2      = 167;
  JIN_WHITESKELETON      = 233;  //柳榜

  sMAN        = 'MAN';
  sWOMAN      = 'WOMAN';
  sMALE       = 'MALE';
  sFEMALE     = 'FEMALE';


  sSUNRISE    = 'SUNRISE';
  sDAY        = 'DAY';
  sSUNSET     = 'SUNSET';
  sNIGHT      = 'NIGHT';

  sWarrior    = 'Warrior';
  sWizard     = 'Wizard';
  sTaos       = 'Taoist';
  sAssassin   = 'Assassin';      //磊按
  sBonze      = 'Bonze';
  sUpWarr     = 'UpWarr';     //寒趋傈荤
  sUpWiz      = 'UpWiz';      //全泅贱荤
  sUpTao      = 'UpTao';      //劳急档荤
  sUpAssa     = 'UpAssa';    //厚楷磊按
  sUpBonze    = 'UpBonze';

  sSUN        = 'SUN';
  sMON        = 'MON';
  sTUE        = 'TUE';
  sWED        = 'WED';
  sTHU        = 'THU';
  sFRI        = 'FRI';
  sSAT        = 'SAT';

//NPC #IF 犬牢
  sCHECK      = 'CHECK';
  nCHECK      = 1;
  sRANDOM     = 'RANDOM';
  nRANDOM     = 2;
  sGENDER     = 'GENDER';
  nGENDER     = 3;
  sDAYTIME    = 'DAYTIME';
  nDAYTIME    = 4;
  sCHECKOPEN  = 'CHECKOPEN';
  nCHECKOPEN  = 5;
  sCHECKUNIT  = 'CHECKUNIT';
  nCHECKUNIT  = 6;
  sCHECKLEVEL = 'CHECKLEVEL';
  nCHECKLEVEL = 7;
  sCHECKJOB   = 'CHECKJOB';
  nCHECKJOB   = 8;
  sCHECKBBCOUNT      = 'CHECKBBCOUNT';
  nCHECKBBCOUNT      = 9;
  sCHECKHEROJOB = 'CHECKHEROJOB';
  nCHECKHEROJOB = 10;

  sCHECKITEM         = 'CHECKITEM';
  nCHECKITEM         = 20;
  sCHECKITEMW        = 'CHECKITEMW';
  nCHECKITEMW        = 21;
  sCHECKGOLD         = 'CHECKGOLD';
  nCHECKGOLD         = 22;
  sISTAKEITEM        = 'ISTAKEITEM';
  nISTAKEITEM        = 23;
  sCHECKDURA         = 'CHECKDURA';
  nCHECKDURA         = 24;
  sCHECKDURAEVA           = 'CHECKDURAEVA';
  nCHECKDURAEVA           = 25;
  sDAYOFWEEK              = 'DAYOFWEEK';
  nDAYOFWEEK              = 26;
  sHOUR                   = 'HOUR';
  nHOUR                   = 27;
  sMIN                    = 'MIN';
  nMIN                    = 28;
  sCHECKPKPOINT           = 'CHECKPKPOINT';
  nCHECKPKPOINT           = 29;
  sCHECKLUCKYPOINT        = 'CHECKLUCKYPOINT';
  nCHECKLUCKYPOINT        = 30;
  sCHECKMONMAP            = 'CHECKMONMAP';
  nCHECKMONMAP            = 31;
  sCHECKMONAREA           = 'CHECKMONAREA';
  nCHECKMONAREA           = 32;
  sCHECKHUM               = 'CHECKHUM';
  nCHECKHUM               = 33;
  sCHECKBAGGAGE           = 'CHECKBAGGAGE';
  nCHECKBAGGAGE           = 34;
  sEQUAL                  = 'EQUAL';
  nEQUAL                  = 35;
  sLARGE                  = 'LARGE';
  nLARGE                  = 36;
  sSMALL                  = 'SMALL';
  nSMALL                  = 37;
  sSC_CHECKMAGIC          = 'CHECKMAGIC';
  nSC_CHECKMAGIC          = 38;
  sSC_CHKMAGICLEVEL       = 'CHKMAGICLEVEL';
  nSC_CHKMAGICLEVEL       = 39;
  sSC_CHECKMONRECALL      = 'CHECKMONRECALL';
  nSC_CHECKMONRECALL      = 40;
  sSC_CHECKHORSE          = 'CHECKHORSE';
  nSC_CHECKHORSE          = 41;
  sSC_CHECKRIDING         = 'CHECKRIDING';
  nSC_CHECKRIDING         = 42;
  sSC_STARTDAILYQUEST     = 'STARTDAILYQUEST';
  nSC_STARTDAILYQUEST     = 45;
  sSC_CHECKDAILYQUEST     = 'CHECKDAILYQUEST';
  nSC_CHECKDAILYQUEST     = 46;
  sSC_RANDOMEX            = 'RANDOMEX';
  nSC_RANDOMEX            = 47;
  sCHECKNAMELIST          = 'CHECKNAMELIST';      //眉农
  nCHECKNAMELIST          = 48;
  sSC_CHECKWEAPONLEVEL    = 'CHECKWEAPONLEVEL';
  nSC_CHECKWEAPONLEVEL    = 49;
  sSC_CHECKWEAPONATOM     = 'CHECKWEAPONATOM';
  nSC_CHECKWEAPONATOM     = 50;
  sSC_CHECKREFINEWEAPON   = 'CHECKREFINEWEAPON';
  nSC_CHECKREFINEWEAPON   = 51;
  sSC_CHECKWEAPONMCTYPE   = 'CHECKWEAPONMCTYPE';
  nSC_CHECKWEAPONMCTYPE   = 52;
  sSC_CHECKREFINEITEM     = 'CHECKREFINEITEM';
  nSC_CHECKREFINEITEM     = 53;
  sSC_HASWEAPONATOM       = 'HASWEAPONATOM';
  nSC_HASWEAPONATOM       = 54;
  sSC_ISGUILDMASTER       = 'ISGUILDMASTER';
  nSC_ISGUILDMASTER       = 55;
  sSC_CANPROPOSECASTLEWAR = 'CANPROPOSECASTLEWAR';
  nSC_CANPROPOSECASTLEWAR = 56;
  sSC_CANHAVESHOOTER      = 'CANHAVESHOOTER';
  nSC_CANHAVESHOOTER      = 57;
  sSC_CHECKFAME           = 'CHECKFAME';
  nSC_CHECKFAME           = 58;
  sSC_ISONCASTLEWAR       = 'ISONCASTLEWAR';     //傍己吝
  nSC_ISONCASTLEWAR       = 59;
  sSC_ISONREADYCASTLEWAR  = 'ISONREADYCASTLEWAR';
  nSC_ISONREADYCASTLEWAR  = 60;
  sSC_ISCASTLEGUILD       = 'ISCASTLEGUILD';
  nSC_ISCASTLEGUILD       = 61;
  sSC_ISATTACKGUILD       = 'ISATTACKGUILD';
  nSC_ISATTACKGUILD       = 63;
  sSC_ISDEFENSEGUILD      = 'ISDEFENSEGUILD';
  nSC_ISDEFENSEGUILD      = 65;
  sSC_CHECKSHOOTER        = 'CHECKSHOOTER';
  nSC_CHECKSHOOTER        = 66;
  sSC_CHECKSAVEDSHOOTER   = 'CHECKSAVEDSHOOTER';
  nSC_CHECKSAVEDSHOOTER   = 67;
  sSC_HASGUILD            = 'HAVEGUILD';
  nSC_HASGUILD            = 68;
  sSC_CHECKCASTLEDOOR     = 'CHECKCASTLEDOOR';
  nSC_CHECKCASTLEDOOR     = 69;
  sSC_CHECKCASTLEDOOROPEN = 'CHECKCASTLEDOOROPEN';
  nSC_CHECKCASTLEDOOROPEN = 70;
  sSC_CHECKPOS            = 'CHECKPOS';
  nSC_CHECKPOS            = 71;
  sSC_CANCHARGESHOOTER    = 'CANCHARGESHOOTER';
  nSC_CANCHARGESHOOTER    = 72;
  sSC_ISDEFENSEALLYGUILD  = 'ISDEFENSEALLYGUILD';
  nSC_ISDEFENSEALLYGUILD  = 74;  
  sSC_TESTTEAM            = 'TESTTEAM';
  nSC_TESTTEAM            = 75;
  sSC_ISSYSOP             = 'ISSYSOP';
  nSC_ISSYSOP             = 76;  
  sSC_ISADMIN             = 'ISADMIN';
  nSC_ISADMIN             = 77;
  sSC_CHECKBONUS          = 'CHECKBONUS';
  nSC_CHECKBONUS          = 78;
  sSC_CHECKMARRIAGE       = 'CHECKMARRIAGE';
  nSC_CHECKMARRIAGE       = 79;
  sSC_CHECKMARRIAGERING   = 'CHECKMARRIAGERING';
  nSC_CHECKMARRIAGERING   = 80;
  sCHECKCOUNTLIST         = 'CHECKCOUNTLIST';     //肮荐 葛酒坷扁
  nCHECKCOUNTLIST         = 81;

  sUNDERWAR               = 'UNDERWAR';
  nUNDERWAR               = 82;

  sSC_ATTACKWARGUILD      = 'ATTACKWARGUILD';
  nSC_ATTACKWARGUILD      = 83;
  sSC_DEFENSEWARGUILD     = 'DEFENSEWARGUILD';
  nSC_DEFENSEWARGUILD     = 84;

  sSC_CHECKCASTLEAREA     = 'CHECKCASTLEAREA';
  nSC_CHECKCASTLEAREA     = 85;

  sSC_CHECKCASTLERECALL   = 'CHECKCASTLERECALL';
  nSC_CHECKCASTLERECALL   = 86;

  sSC_CHECKCASTLEGUILD    = 'CHECKCASTLEGUILD';
  nSC_CHECKCASTLEGUILD    = 87;

  sSC_CHECKCASTLEKING     = 'CHECKCASTLEKING';
  nSC_CHECKCASTLEKING     = 88;

  sSC_CHECKGMETERM        = 'CHECKGMETERM';
  nSC_CHECKGMETERM        = 100;
  sSC_CHECKOPENGME        = 'CHECKOPENGME';
  nSC_CHECKOPENGME        = 101;
  sSC_CHECKENTERGMEMAP    = 'CHECKENTERGMEMAP';
  nSC_CHECKENTERGMEMAP    = 102;  
  sSC_CHECKSERVER         = 'CHECKSERVER';
  nSC_CHECKSERVER         = 103;
  sSC_ELARGE              = 'ELARGE';
  nSC_ELARGE              = 104;
  sSC_ESMALL              = 'ESMALL';
  nSC_ESMALL              = 105;
  sSC_CHECKGROUPCOUNT     = 'CHECKGROUPCOUNT';      //弊缝盔 牢盔荐 眉农
  nSC_CHECKGROUPCOUNT     = 106;
  sSC_CHECKACCESSORY      = 'CHECKACCESSORY';
  nSC_CHECKACCESSORY      = 107;
  sSC_ONERROR             = 'ONERROR';
  nSC_ONERROR             = 108;
  sSC_CHECKARMOR          = 'CHECKARMOR';
  nSC_CHECKARMOR          = 109;
  sCHECKACCOUNTLIST       = 'CHECKACCOUNTLIST';
  nCHECKACCOUNTLIST       = 135;
  sCHECKIPLIST            = 'CHECKIPLIST';
  nCHECKIPLIST            = 136;

  sSC_CHECKPOSEDIR        = 'CHECKPOSEDIR';
  nSC_CHECKPOSEDIR        = 138;
  sSC_CHECKPOSELEVEL      = 'CHECKPOSELEVEL';
  nSC_CHECKPOSELEVEL      = 139;
  sSC_CHECKPOSEGENDER     = 'CHECKPOSEGENDER';
  nSC_CHECKPOSEGENDER     = 140;
  sSC_CHECKLEVELEX        = 'CHECKLEVELEX';
  nSC_CHECKLEVELEX        = 141;
  sSC_CHECKBONUSPOINT     = 'CHECKBONUSPOINT';
  nSC_CHECKBONUSPOINT     = 142;
  sSC_CHECKCOLUMN         = 'CHECKCOLUMN';  //全焊窜
  nSC_CHECKCOLUMN         = 143;

  sSC_CHECKNAMEIPLIST     = 'CHECKNAMEIPLIST';
  nSC_CHECKNAMEIPLIST     = 152;
  sSC_CHECKACCOUNTIPLIST  = 'CHECKACCOUNTIPLIST';
  nSC_CHECKACCOUNTIPLIST  = 153;
  sSC_CHECKSLAVECOUNT     = 'CHECKSLAVECOUNT';
  nSC_CHECKSLAVECOUNT     = 154;
  sSC_CHECKCASTLEMASTER   = 'ISCASTLEMASTER';
  nSC_CHECKCASTLEMASTER   = 155;
  sSC_ISNEWHUMAN          = 'ISNEWHUMAN';
  nSC_ISNEWHUMAN          = 156;
  sSC_CASTLEMASTERKING    = 'CASTLEMASTERKING';
  nSC_CASTLEMASTERKING    = 157;

  sSC_ISNEWHERO = 'ISNEWHERO';
  nSC_ISNEWHERO = 158;

  sSC_CHECKGAMEGOLD       = 'CHECKGAMEGOLD';
  nSC_CHECKGAMEGOLD       = 159;
  sSC_CHECKGAMEPOINT      = 'CHECKGAMEPOINT';
  nSC_CHECKGAMEPOINT      = 160;
  sSC_CHECKNAMELISTPOSITION   = 'CHECKNAMELISTPOSITION';
  nSC_CHECKNAMELISTPOSITION   = 161;
  sSC_CHECKGUILDLIST      = 'CHECKGUILDLIST';
  nSC_CHECKGUILDLIST      = 162;
  sSC_CHECKRENEWLEVEL     = 'CHECKRENEWLEVEL';
  nSC_CHECKRENEWLEVEL     = 163;
  sSC_CHECKSLAVELEVEL     = 'CHECKSLAVELEVEL';
  nSC_CHECKSLAVELEVEL     = 164;
  sSC_CHECKSLAVENAME      = 'CHECKSLAVENAME';
  nSC_CHECKSLAVENAME      = 165;

  sSC_CHECKOFGUILD        = 'CHECKOFGUILD';
  nSC_CHECKOFGUILD        = 167;
  sSC_CHECKPAYMENT        = 'CHECKPAYMENT';
  nSC_CHECKPAYMENT        = 168;
  sSC_CHECKUSEITEM        = 'CHECKUSEITEM';
  nSC_CHECKUSEITEM        = 169;
  sSC_CHECKBAGSIZE        = 'CHECKBAGSIZE';
  nSC_CHECKBAGSIZE        = 170;
  sSC_CHECKLISTCOUNT      = 'CHECKLISTCOUNT';
  nSC_CHECKLISTCOUNT      = 171;
  sSC_CHECKDC             = 'CHECKDC';
  nSC_CHECKDC             = 172;
  sSC_CHECKMC             = 'CHECKMC';
  nSC_CHECKMC             = 173;
  sSC_CHECKSC             = 'CHECKSC';
  nSC_CHECKSC             = 174;
  sSC_CHECKHP             = 'CHECKHP';
  nSC_CHECKHP             = 175;
  sSC_CHECKMP             = 'CHECKMP';
  nSC_CHECKMP             = 176;
  sSC_CHECKITEMTYPE       = 'CHECKITEMTYPE';
  nSC_CHECKITEMTYPE       = 180;
  sSC_CHECKEXP            = 'CHECKEXP';
  nSC_CHECKEXP            = 181;
  sSC_CHECKCASTLEGOLD     = 'CHECKCASTLEGOLD';
  nSC_CHECKCASTLEGOLD     = 182;
  sSC_PASSWORDERRORCOUNT  = 'PASSWORDERRORCOUNT';
  nSC_PASSWORDERRORCOUNT  = 183;
  sSC_ISLOCKPASSWORD      = 'ISLOCKPASSWORD';
  nSC_ISLOCKPASSWORD      = 184;
  sSC_ISLOCKSTORAGE       = 'ISLOCKSTORAGE';
  nSC_ISLOCKSTORAGE       = 185;
  sSC_CHECKBUILDPOINT     = 'CHECKGUILDBUILDPOINT';
  nSC_CHECKBUILDPOINT     = 186;
  sSC_CHECKAURAEPOINT     = 'CHECKGUILDAURAEPOINT';
  nSC_CHECKAURAEPOINT     = 187;
  sSC_CHECKSTABILITYPOINT = 'CHECKGUILDSTABILITYPOINT';
  nSC_CHECKSTABILITYPOINT = 188;
  sSC_CHECKFLOURISHPOINT  = 'CHECKGUILDFLOURISHPOINT';
  nSC_CHECKFLOURISHPOINT  = 189;
  sSC_CHECKGUILDMODE      = 'CHECKGUILDMODE';
  nSC_CHECKGUILDMODE      = 190;
  sSC_CHECKRANGEMONCOUNT  = 'CHECKRANGEMONCOUNT';
  nSC_CHECKRANGEMONCOUNT  = 191;
  sSC_CHECKITEMADDVALUE   = 'CHECKITEMADDVALUE';
  nSC_CHECKITEMADDVALUE   = 192;
  sSC_CHECKINMAPRANGE     = 'CHECKINMAPRANGE';
  nSC_CHECKINMAPRANGE     = 193;
  sSC_CASTLECHANGEDAY     = 'CASTLECHANGEDAY';
  nSC_CASTLECHANGEDAY     = 194;
  sSC_CASTLEWARDAY        = 'CASTLEWARDAY';
  nSC_CASTLEWARDAY        = 195;
  sSC_ONLINELONGMIN       = 'ONLINELONGMIN';
  nSC_ONLINELONGMIN       = 196;
  sSC_CHECKGUILDCHIEFITEMCOUNT = 'CHECKGUILDCHIEFITEMCOUNT';
  nSC_CHECKGUILDCHIEFITEMCOUNT = 197;
  sSC_CHECKNAMEDATELIST   = 'CHECKNAMEDATELIST';
  nSC_CHECKNAMEDATELIST   = 198;
  sSC_CHECKMAPHUMANCOUNT  = 'CHECKMAPHUMANCOUNT';
  nSC_CHECKMAPHUMANCOUNT  = 199;
  sSC_CHECKMAPMONCOUNT    = 'CHECKMAPMONCOUNT';
  nSC_CHECKMAPMONCOUNT    = 200;
  sSC_CHECKVAR            = 'CHECKVAR';
  nSC_CHECKVAR            = 201;
  sSC_CHECKSERVERNAME     = 'CHECKSERVERNAME';
  nSC_CHECKSERVERNAME     = 202;
  sSC_CHECKMAP            = 'CHECKMAP';
  nSC_CHECKMAP            = 203;
  sSC_INSAFEZONE          = 'INSAFEZONE';
  nSC_INSAFEZONE          = 204;
  sSC_REVIVESLAVE         = 'REVIVESLAVES'; //检查领取宠物
  nSC_REVIVESLAVE         = 206;
  sSC_CHECKGROUPCLASS     = 'CHECKGROUPCLASS';
  nSC_CHECKGROUPCLASS     = 208;
  sSC_ISGROUPMASTER       = 'ISGROUPMASTER';
  nSC_ISGROUPMASTER       = 210;
  sSC_CHECKOFGUILDCOUNT   = 'CHECKOFGUILDCOUNT';  //初级门派
  nSC_CHECKOFGUILDCOUNT   = 211;
  sCHECKGROUPNEARBY       = 'CHECKGROUPNEARBY';
  nCHECKGROUPNEARBY       = 213;
  //技能指令
  sCHECKFAMEGRADE         = 'CHECKFAMEGRADE';  //懦单胶 殿鞭犬牢
  nCHECKFAMEGRADE         = 214;
  sCHECKKILLPOINT         = 'CHECKKILLPOINT'; //懦 器牢飘 眉农
  nCHECKKILLPOINT         = 215;
  sCHECKLOVERDAY          = 'CHECKLOVERDAY';  //楷牢 胶媚 扁埃  眉农
  nCHECKLOVERDAY          = 216;
  sSC_MASTERUSEEXP        = 'MASTERUSEEXP';    //荤力 版摹
  nSC_MASTERUSEEXP        = 217;
  sSC_GETDUELMAP          = 'GETDUELMAP';
  nSC_GETDUELMAP          = 218;
  sSC_CHECKPCPOINT        = 'CHECKPCPOINT';
  nSC_CHECKPCPOINT        = 219;

  sSC_HAVEHERO = 'HAVEHERO';    //康旷捞 乐绰瘤?
  nSC_HAVEHERO = 220;

  sSC_CHECKONLINE = 'CHECKONLINE';
  nSC_CHECKONLINE = 221;

//NPC ACT 指令
  sSET             = 'SET';
  nSET             = 1;
  sTAKE            = 'TAKE';
  nTAKE            = 2;
  sSC_GIVE         = 'GIVE';
  nSC_GIVE         = 3;
  sTAKEW           = 'TAKEW';
  nTAKEW           = 4;
  sCLOSE           = 'CLOSE';
  nCLOSE           = 5;
  sRESET           = 'RESET';
  nRESET           = 6;
  sSETOPEN         = 'SETOPEN';
  nSETOPEN         = 7;
  sSETUNIT         = 'SETUNIT';
  nSETUNIT         = 8;
  sRESETUNIT       = 'RESETUNIT';
  nRESETUNIT       = 9;
  sBREAK           = 'BREAK';
  nBREAK           = 10;
  sTIMERECALL      = 'TIMERECALL';
  nTIMERECALL      = 11;
  sSC_PARAM1       = 'PARAM1';
  nSC_PARAM1       = 12;
  sSC_PARAM2       = 'PARAM2';
  nSC_PARAM2       = 13;
  sSC_PARAM3       = 'PARAM3';
  nSC_PARAM3       = 14;
  sSC_PARAM4       = 'PARAM4';
  nSC_PARAM4       = 15;
  sSC_EXEACTION    = 'EXEACTION';
  nSC_EXEACTION    = 16;
  s_GETAUCTIONITEMS = 'GETAUCTIONITEMS';
  n_GETAUCTIONITEMS = 17;
  s_CLOSEAUCTION = 'CLOSEAUCTION';
  n_CLOSEAUCTION = 18;
  sMAPMOVE         = 'MAPMOVE';
  nMAPMOVE         = 19;
  sMAP             = 'MAP';
  nMAP             = 20;
  sTAKECHECKITEM   = 'TAKECHECKITEM';
  nTAKECHECKITEM   = 21;
  sMONGEN          = 'MONGEN';
  nMONGEN          = 22;
  sSC_MONGENP      = 'MONGENP';
  nSC_MONGENP      = 23;
  sMONCLEAR        = 'MONCLEAR';
  nMONCLEAR        = 24;
  sMOV             = 'MOV';
  nMOV             = 25;
  sINC             = 'INC';
  nINC             = 26;
  sDEC             = 'DEC';
  nDEC             = 27;
  sSUM             = 'SUM';
  nSUM             = 28;
  sSC_DIV          = 'DIV';
  sSC_MUL          = 'MUL';
  sSC_PERCENT      = 'PERCENT';
  sBREAKTIMERECALL = 'BREAKTIMERECALL';
  nBREAKTIMERECALL = 29;
  sSENDMSG         = 'SENDMSG';
  nSENDMSG         = 30;
  sCHANGEMODE      = 'CHANGEMODE';
  nCHANGEMODE      = 31;
  sPKPOINT         = 'PKPOINT';
  nPKPOINT         = 32;
  sCHANGEXP        = 'CHANGEXP';
  nCHANGEXP        = 33;
  sSC_RECALLMOB    = 'RECALLMOB';
  nSC_RECALLMOB    = 34;
  sKICK            = 'KICK';
  nKICK            = 35;
  sMOVR            = 'MOVR';
  nMOVR            = 50;
  sEXCHANGEMAP     = 'EXCHANGEMAP';
  nEXCHANGEMAP     = 51;
  sRECALLMAP       = 'RECALLMAP';
  nRECALLMAP       = 52;
  sADDBATCH        = 'ADDBATCH';
  nADDBATCH        = 53;
  sBATCHDELAY      = 'BATCHDELAY';
  nBATCHDELAY      = 54;
  sBATCHMOVE       = 'BATCHMOVE';
  nBATCHMOVE       = 55;
  sPLAYDICE        = 'PLAYDICE';
  nPLAYDICE        = 56;
  sSC_PASTEMAP     = 'PASTEMAP';
  sSC_LOADGEN      = 'LOADGEN';
  sADDNAMELIST     = 'ADDNAMELIST';
  nADDNAMELIST     = 57;
  sDELNAMELIST     = 'DELNAMELIST';
  nDELNAMELIST     = 58;
  sADDGUILDLIST    = 'ADDGUILDLIST';
  nADDGUILDLIST    = 59;
  sDELGUILDLIST    = 'DELGUILDLIST';
  nDELGUILDLIST    = 60;
  sADDACCOUNTLIST  = 'ADDACCOUNTLIST';
  nADDACCOUNTLIST  = 61;
  sDELACCOUNTLIST  = 'DELACCOUNTLIST';
  nDELACCOUNTLIST  = 62;
  sADDIPLIST       = 'ADDIPLIST';
  nADDIPLIST       = 63;
  sDELIPLIST       = 'DELIPLIST';
  nDELIPLIST       = 64;
  sADDCOUNTLIST    = 'ADDCOUNTLIST';            //肮荐 葛酒坷扁
  nADDCOUNTLIST    = 65;
  sRANDOMMAPMOVE   = 'RANDOMMAPMOVE';
  nRANDOMMAPMOVE   = 66;
  sCASTLERECALL    = 'CASTLERECALL';
  nCASTLERECALL    = 67;
  sSETNEWRANKNAME  = 'SETNEWRANKNAME';
  nSETNEWRANKNAME  = 68;

  sGOQUEST         = 'GOQUEST';
  nGOQUEST         = 100;
  sENDQUEST        = 'ENDQUEST';
  nENDQUEST        = 101;
  sGOTO            = 'GOTO';
  nGOTO            = 102;
  sSOUND           = 'SOUND';
  nSOUND           = 103;
  sSC_HAIRCOLOR    = 'HAIRCOLOR';
  nSC_HAIRCOLOR    = 104;
  sSC_WEARCOLOR    = 'WEARCOLOR';
  nSC_WEARCOLOR    = 105;
  sSC_HAIRSTYLE    = 'HAIRSTYLE';
  nSC_HAIRSTYLE    = 106;
  sSC_MONRECALL    = 'MONRECALL';
  nSC_MONRECALL    = 107;
  sSC_HORSECALL    = 'HORSECALL';
  nSC_HORSECALL    = 108;
  sSC_HAIRRNDCOL   = 'HAIRRNDCOL';
  nSC_HAIRRNDCOL   = 109;
  sSC_RANDSETDAILYQUEST  = 'RANDSETDAILYQUEST';
  nSC_RANDSETDAILYQUEST  = 110;
  sSC_REFINEWEAPON       = 'REFINEWEAPON';
  nSC_REFINEWEAPON       = 113;
  sSC_RECALLGROUPMEMBERS = 'RECALLGROUPMEMBERS';
  nSC_RECALLGROUPMEMBERS = 117;
  sSC_MAPTING            = 'MAPTING';
  nSC_MAPTING            = 118;
  sSC_WRITEWEAPONNAME    = 'WRITEWEAPONNAME';
  nSC_WRITEWEAPONNAME    = 119;
  sSC_DELAYGOTO          = 'DELAYGOTO';
  nSC_DELAYGOTO          = 120;
  sSC_ENABLECMD          = 'ENABLECMD';
  nSC_ENABLECMD          = 121;
  sSC_LINEMSG            = 'LINEMSG';
  nSC_LINEMSG            = 122;
  sSC_EVENTMSG           = 'EVENTMSG';
  nSC_EVENTMSG           = 123;
  sSC_SOUNDMSG           = 'SOUNDMSG';
  nSC_SOUNDMSG           = 124;
  sSC_SETMISSION         = 'SETMISSION';
  nSC_SETMISSION         = 125;
  sSC_CLEARMISSION       = 'CLEARMISSION';
  nSC_CLEARMISSION       = 126;
  sSC_MONPWR             = 'MONPWR';
  nSC_MONPWR             = 127;
  sSC_ENTER_OK           = 'ENTER_OK';
  nSC_ENTER_OK           = 128;
  sSC_ENTER_FAIL         = 'ENTER_FAIL';
  nSC_ENTER_FAIL         = 129;
  sSC_MONADDITEM         = 'MONADDITEM';
  nSC_MONADDITEM         = 130;
  sSC_CHANGEWEATHER      = 'CHANGEWEATHER';
  nSC_CHANGEWEATHER      = 131;
  sSC_CHANGEWEAPONATOM   = 'CHANGEWEAPONATOM';
  nSC_CHANGEWEAPONATOM   = 132;
  sSC_GETREPAIRCOST      = 'GETREPAIRCOST';
  nSC_GETREPAIRCOST      = 134;
  sSC_KILLHORSE          = 'KILLHORSE';
  nSC_KILLHORSE          = 133;
  sSC_REPAIRITEM         = 'REPAIRITEM';
  nSC_REPAIRITEM         = 135;
  sSC_USEREMERGENCYCLOSE = 'USEREMERGENCYCLOSE';
  nSC_USEREMERGENCYCLOSE = 138;
  sSC_BUILDGUILD         = 'BUILDGUILD';
  nSC_BUILDGUILD         = 139;
  sSC_GUILDWAR           = 'GUILDWAR';
  nSC_GUILDWAR           = 140;
  sSC_CHANGEUSERNAME     = 'CHANGEUSERNAME';
  nSC_CHANGEUSERNAME     = 141;
  sSC_CHANGEMONLEVEL     = 'CHANGEMONLEVEL';
  nSC_CHANGEMONLEVEL     = 142;
  sSC_DROPITEMMAP        = 'DROPITEMMAP';
  nSC_DROPITEMMAP        = 143;
  sSC_CLEARITEMMAP       = 'CLEARITEMMAP';
  nSC_CLEARITEMMAP       = 170;
  sSC_PROPOSECASTLEWAR   = 'PROPOSECASTLEWAR';
  nSC_PROPOSECASTLEWAR   = 144;
  sSC_FINISHCASTLEWAR    = 'FINISHCASTLEWAR';
  nSC_FINISHCASTLEWAR    = 145;
  sSC_MOVENPC            = 'MOVENPC';
  nSC_MOVENPC            = 146;
  sSC_SPEAK              = 'SPEAK';
  nSC_SPEAK              = 147;
  sSC_SENDCMD            = 'SENDCMD';
  nSC_SENDCMD            = 148;
  sSC_INCFAME            = 'INCFAME';
  nSC_INCFAME            = 149;
  sSC_DECFAME            = 'DECFAME';
  nSC_DECFAME            = 150;
  sSC_CAPTURECASTLEFLAG  = 'CAPTURECASTLEFLAG';
  nSC_CAPTURECASTLEFLAG  = 151;
  sSC_MAKESHOOTER        = 'MAKESHOOTER';
  nSC_MAKESHOOTER        = 153;
  sSC_KILLSHOOTER        = 'KILLSHOOTER';
  nSC_KILLSHOOTER        = 154;
  sSC_LEAVESHOOTER       = 'LEAVESHOOTER';
  nSC_LEAVESHOOTER       = 155;
  sSC_CHANGEMAPATTR      = 'CHANGEMAPATTR';
  nSC_CHANGEMAPATTR      = 157;
  sSC_RESETMAPATTR       = 'RESETMAPATTR';
  nSC_RESETMAPATTR       = 158;
  sSC_MAKECASTLEDOOR     = 'MAKECASTLEDOOR';
  nSC_MAKECASTLEDOOR     = 159;
  sSC_REPAIRCASTLEDOOR   = 'REPAIRCASTLEDOOR';
  nSC_REPAIRCASTLEDOOR   = 160;
  sSC_CHARGESHOOTER      = 'CHARGESHOOTER';
  nSC_CHARGESHOOTER      = 161;
  sSC_SETAREAATTR        = 'SETAREAATTR';
  nSC_SETAREAATTR        = 162;
  sSC_CLEARDELAYGOTO     = 'CLEARDELAYGOTO';
  nSC_CLEARDELAYGOTO     = 163;
  sSC_TESTFLAG           = 'TESTFLAG';
  nSC_TESTFLAG           = 164;
  sSC_APPLYFLAG          = 'APPLYFLAG';
  nSC_APPLYFLAG          = 165;
  sSC_PASTEFLAG          = 'PASTEFLAG';
  nSC_PASTEFLAG          = 166;
  sSC_GETBACKCASTLEGOLD  = 'GETBACKCASTLEGOLD';
  nSC_GETBACKCASTLEGOLD  = 167;
  sSC_GETBACKUPGITEM     = 'GETBACKUPGITEM';
  nSC_GETBACKUPGITEM     = 168;
  sSC_TINGWAR            = 'TINGWAR';
  nSC_TINGWAR            = 169;
  sSC_SAVEPASSWD         = 'SAVEPASSWD';
  nSC_SAVEPASSWD         = 171;
  sSC_CREATENPC          = 'CREATENPC';
  nSC_CREATENPC          = 172;
  sSC_TAKEBONUS          = 'TAKEBONUS';
  nSC_TAKEBONUS          = 173;
  sSC_SYSMSG             = 'SYSMSG';
  nSC_SYSMSG             = 174;
  sSC_LOADVALUE          = 'LOADVALUE';
  nSC_LOADVALUE          = 175;
  sSC_SAVEVALUE          = 'SAVEVALUE';
  nSC_SAVEVALUE          = 176;
  sSC_SAVELOG            = 'SAVELOG';
  nSC_SAVELOG            = 177;
  sSC_GETMARRIED         = 'GETMARRIED';     //搬去
  nSC_GETMARRIED         = 178;
  sSC_DIVORCE            = 'DIVORCE';
  nSC_DIVORCE            = 189;
  sSC_CAPTURESAYING      = 'CAPTURESAYING';
  nSC_CAPTURESAYING      = 190;
  sSC_CANCELMARRIAGERING = 'CANCELMARRIAGERING';
  nSC_CANCELMARRIAGERING = 191;
  sSC_OPENUSERMARKET     = 'OPENUSERMARKET';
  nSC_OPENUSERMARKET     = 192;
  sSC_SETTYPEUSERMARKET  = 'SETTYPEUSERMARKET';
  nSC_SETTYPEUSERMARKET  = 193;
  sSC_CHECKSOLDITEMSUSERMARKET = 'CHECKSOLDITEMSUSERMARKET';
  nSC_CHECKSOLDITEMSUSERMARKET = 194;
  sSC_SETGMEMAP          = 'SETGMEMAP';
  nSC_SETGMEMAP          = 200;
  sSC_SETGMEPOINT        = 'SETGMEPOINT';
  nSC_SETGMEPOINT        = 201;
  sSC_SETGMETIME         = 'SETGMETIME';
  nSC_SETGMETIME         = 209;
  sSC_STARTNEWGME        = 'STARTNEWGME';
  nSC_STARTNEWGME        = 202;
  sSC_MOVETOGMEMAP       = 'MOVETOGMEMAP';
  mSC_MOVETOGMEMAP       = 203;
  sSC_FINISHGME          = 'FINISHGME';
  nSC_FINISHGME          = 204;
  sSC_CONTINUEGME        = 'CONTINUEGME';
  nSC_CONTINUEGME        = 205;
  sSC_SETGMEPLAYTIME     = 'SETGMEPLAYTIME';
  nSC_SETGMEPLAYTIME     = 206;
  sSC_SETGMEPAUSETIME    = 'SETGMEPAUSETIME';
  nSC_SETGMEPAUSETIME    = 207;
  sSC_SETGMELIMITUSER    = 'SETGMELIMITUSER';
  nSC_SETGMELIMITUSER    = 208;
  sSC_SETEVENTMAP        = 'SETEVENTMAP';
  nSC_SETEVENTMAP        = 210;
  sSC_RESETEVENTMAP      = 'RESETEVENTMAP';
  nSC_RESETEVENTMAP      = 211;
  sSC_TESTREFINEPOINTS   = 'TESTREFINEPOINTS';
  nSC_TESTREFINEPOINTS   = 220;
  sSC_RESETREFINEWEAPON  = 'RESETREFINEWEAPON';
  nSC_RESETREFINEWEAPON  = 221;
  sSC_TESTREFINEACCESSORIES = 'TESTREFINEACCESSORIES';
  nSC_TESTREFINEACCESSORIES = 222;
  sSC_REFINEACCESSORIES  = 'REFINEACCESSORIES';
  nSC_REFINEACCESSORIES  = 223;
  sSC_APPLYMONMISSION    = 'APPLYMONMISSION';
  nSC_APPLYMONMISSION    = 225;
  sSC_MAPMOVER           = 'MAPMOVER';
  nSC_MAPMOVER           = 226;
  sSC_ADDSTR             = 'ADDSTR';
  nSC_ADDSTR             = 227;
  sSC_SETEVENTDAMAGE     = 'SETEVENTDAMAGE';
  nSC_SETEVENTDAMAGE     = 228;
  sSC_FORMATSTR          = 'FORMATSTR';
  nSC_FORMATSTR          = 229;
  sSC_CLEARPATH          = 'CLEARPATH';
  nSC_CLEARPATH          = 230;
  sSC_ADDPATH            = 'ADDPATH';
  nSC_ADDPATH            = 231;
  sSC_APPLYPATH          = 'APPLYPATH';
  nSC_APPLYPATH          = 232;
  sSC_MAPSPELL           = 'MAPSPELL';
  nSC_MAPSPELL           = 233;
  sSC_GIVEEXP            = 'GIVEEXP';
  nSC_GIVEEXP            = 234;
  sSC_GROUPMOVE          = 'GROUPMOVE';
  nSC_GROUPMOVE          = 235;
  sSC_GIVEEXPMAP         = 'GIVEEXPMAP';
  nSC_GIVEEXPMAP         = 236;
  sSC_APPLYMONEX         = 'APPLYMONEX';
  nSC_APPLYMONEX         = 237;
  sSC_CLEARNAMELIST      = 'CLEARNAMELIST';
  nSC_CLEARNAMELIST      = 238;
  sSC_TINGCASTLEVISITOR  = 'TINGCASTLEVISITOR';
  nSC_TINGCASTLEVISITOR  = 239;
  sSC_MAKEHEALZONE       = 'MAKEHEALZONE';
  nSC_MAKEHEALZONE       = 240;
  sSC_MAKEDAMAGEZONE     = 'MAKEDAMAGEZONE';
  nSC_MAKEDAMAGEZONE     = 241;
  sSC_CLEARZONE          = 'CLEARZONE';
  nSC_CLEARZONE          = 242;
  sSC_READVALUESQL       = 'READVALUESQL';
  nSC_READVALUESQL       = 250;
  sSC_READSTRINGSQL      = 'READSTRINGSQL';
  nSC_READSTRINGSQL      = 255;
  sSC_WRITEVALUESQL      = 'WRITEVALUESQL';
  nSC_WRITEVALUESQL      = 251;
  sSC_INCVALUESQL        = 'INCVALUESQL';
  nSC_INCVALUESQL        = 252;
  sSC_DECVALUESQL        = 'DECVALUESQL';
  nSC_DECVALUESQL        = 253;
  sSC_UPDATEVALUESQL     = 'UPDATEVALUESQL';
  nSC_UPDATEVALUESQL     = 254;
  sSC_KILLSLAVE          = 'KILLSLAVE';
  nSC_KILLSLAVE          = 260;
  sSC_SETITEMEVENT       = 'SETITEMEVENT';
  nSC_SETITEMEVENT       = 261;
  sSC_REMOVEITEMEVENT    = 'REMOVEITEMEVENT';
  nSC_REMOVEITEMEVENT    = 262;
  sSC_RETURN             = 'RETURN';
  nSC_RETURN             = 263;
  sSC_CLEARCASTLEOWNER   = 'CLEARCASTLEOWNER';
  nSC_CLEARCASTLEOWNER   = 270;
  sSC_DISSOLUTIONGUILD   = 'DISSOLUTIONGUILD';
  nSC_DISSOLUTIONGUILD   = 271;
  sSC_CHANGEGENDER       = 'CHANGEGENDER';
  nSC_CHANGEGENDER       = 272;
  sSC_SETFAME            = 'SETFAME';
  nSC_SETFAME            = 273;
  sSC_CHANGELEVEL  = 'CHANGELEVEL';
  nSC_CHANGELEVEL  = 300;

  sSC_GIVEOPTION   = 'GIVEOPTION';
  nSC_GIVEOPTION   = 301;

  sSC_CLEARSKILL   = 'CLEARSKILL';
  nSC_CLEARSKILL   = 305;
  sSC_DELNOJOBSKILL= 'DELNOJOBSKILL';
  nSC_DELNOJOBSKILL= 306;
  sSC_DELSKILL     = 'DELSKILL';
  nSC_DELSKILL     = 307;
  sSC_ADDSKILL     = 'ADDSKILL';
  nSC_ADDSKILL     = 308;
  sSC_SKILLLEVEL   = 'SKILLLEVEL';
  nSC_SKILLLEVEL   = 309;
  sSC_CHANGEPKPOINT      = 'CHANGEPKPOINT';
  nSC_CHANGEPKPOINT      = 310;
  sSC_CHANGEEXP          = 'CHANGEEXP';
  nSC_CHANGEEXP          = 311;
  sSC_CHANGEJOB          = 'CHANGEJOB';
  nSC_CHANGEJOB          = 312;
  sSC_MISSION            = 'MISSION';
  nSC_MISSION            = 313;
  sSC_MOBPLACE           = 'MOBPLACE';
  nSC_MOBPLACE           = 314;

  sSC_ADDHEROSKILL = 'ADDHEROSKILL';
  nSC_ADDHEROSKILL = 315;

  sSC_GAMEGOLD           = 'GAMEGOLD';
  nSC_GAMEGOLD           = 317;
  sSC_AUTOADDGAMEGOLD    = 'AUTOADDGAMEGOLD';
  nSC_AUTOADDGAMEGOLD    = 318;
  sSC_AUTOSUBGAMEGOLD    = 'AUTOSUBGAMEGOLD';
  nSC_AUTOSUBGAMEGOLD    = 319;
  sSC_CHANGENAMECOLOR    = 'CHANGENAMECOLOR';
  nSC_CHANGENAMECOLOR    = 320;
  sSC_CLEARPASSWORD      = 'CLEARPASSWORD';
  nSC_CLEARPASSWORD      = 321;
  sSC_RENEWLEVEL         = 'RENEWLEVEL';
  nSC_RENEWLEVEL         = 322;
  sSC_KILLMONEXPRATE     = 'KILLMONEXPRATE';
  nSC_KILLMONEXPRATE     = 323;
  sSC_POWERRATE          = 'POWERRATE';
  nSC_POWERRATE          = 324;
  sSC_CHANGEMODE         = 'CHANGEMODE';
  nSC_CHANGEMODE         = 325;
  sSC_CHANGEPERMISSION   = 'CHANGEPERMISSION';
  nSC_CHANGEPERMISSION   = 326;
  sSC_KILL               = 'KILL';
  nSC_KILL               = 327;
  sSC_KICK               = 'KICK';
  nSC_KICK               = 328;
  sSC_BONUSPOINT         = 'BONUSPOINT';
  nSC_BONUSPOINT         = 329;
  sSC_RESTRENEWLEVEL     = 'RESTRENEWLEVEL';
  nSC_RESTRENEWLEVEL     = 330;



  sSC_CLEARNEEDITEMS     = 'CLEARNEEDITEMS';
  nSC_CLEARNEEDITEMS     = 336;
  sSC_CLEARMAKEITEMS     = 'CLEARMAKEITEMS';
  nSC_CLEARMAEKITEMS     = 337;
  sSC_SETSENDMSGFLAG     = 'SETSENDMSGFLAG';
  nSC_SETSENDMSGFLAG     = 338;
  sSC_UPGRADEITEMS       = 'UPGRADEITEM';
  nSC_UPGRADEITEMS       = 339;
  sSC_UPGRADEITEMSEX     = 'UPGRADEITEMEX';
  nSC_UPGRADEITEMSEX     = 340;
  sSC_MONGENEX           = 'MONGENEX';
  nSC_MONGENEX           = 341;
  sSC_CLEARMAPMON        = 'CLEARMAPMON';
  nSC_CLEARMAPMON        = 342;
  sSC_SETMAPMODE         = 'SETMAPMODE';
  nSC_SETMAPMODE         = 343;
  sSC_GAMEPOINT          = 'GAMEPOINT';
  nSC_GAMEPOINT          = 344;
  sSC_PKZONE             = 'PKZONE';
  nSC_PKZONE             = 345;
  sSC_RESTBONUSPOINT    = 'RESTBONUSPOINT';
  nSC_RESTBONUSPOINT    = 346;
  sSC_TAKECASTLEGOLD     = 'TAKECASTLEGOLD';
  nSC_TAKECASTLEGOLD     = 347;
  sSC_HUMANHP            = 'HUMANHP';
  nSC_HUMANHP            = 348;
  sSC_HUMANMP            = 'HUMANMP';
  nSC_HUMANMP            = 349;
  sSC_BUILDPOINT         = 'GUILDBUILDPOINT';
  nSC_BUILDPOINT         = 350;
  sSC_AURAEPOINT         = 'GUILDAURAEPOINT';
  nSC_AURAEPOINT         = 351;
  sSC_STABILITYPOINT     = 'GUILDSTABILITYPOINT';
  nSC_STABILITYPOINT     = 352;
  sSC_FLOURISHPOINT      = 'GUILDFLOURISHPOINT';
  nSC_FLOURISHPOINT      = 353;
  sSC_OPENMAGICBOX       = 'OPENITEMBOX'{'OPENMAGICBOX'};
  nSC_OPENMAGICBOX       = 354;
  sSC_SETRANKLEVELNAME   = 'SETRANKLEVELNAME';
  nSC_SETRANKLEVELNAME   = 355;
  sSC_GMEXECUTE          = 'GMEXECUTE';
  nSC_GMEXECUTE          = 356;
  sSC_GUILDCHIEFITEMCOUNT = 'GUILDCHIEFITEMCOUNT';
  nSC_GUILDCHIEFITEMCOUNT = 357;
  sSC_ADDNAMEDATELIST     = 'ADDNAMEDATELIST';
  nSC_ADDNAMEDATELIST     = 358;
  sSC_DELNAMEDATELIST     = 'DELNAMEDATELIST';
  nSC_DELNAMEDATELIST     = 359;
  sSC_MOBFIREBURN         = 'MOBFIREBURN';
  nSC_MOBFIREBURN         = 360;
  sSC_MESSAGEBOX          = 'MESSAGEBOX';
  nSC_MESSAGEBOX          = 361;
  sSC_SETSCRIPTFLAG       = 'SETSCRIPTFLAG';
  nSC_SETSCRIPTFLAG       = 362;
  sSC_SETAUTOGETEXP       = 'SETAUTOGETEXP';
  nSC_SETAUTOGETEXP       = 363;
  sSC_VAR                 = 'VAR';
  nSC_VAR                 = 364;
  sSC_LOADVAR             = 'LOADVAR';
  nSC_LOADVAR             = 365;
  sSC_SAVEVAR             = 'SAVEVAR';
  nSC_SAVEVAR             = 366;
  sSC_CALCVAR             = 'CALCVAR';
  nSC_CALCVAR             = 367;
  sSC_GUILDRECALL         = 'GUILDRECALL';
  nSC_GUILDRECALL         = 368;
  sSC_GROUPADDLIST        = 'GROUPADDLIST';
  nSC_GROUPADDLIST        = 369;
  sSC_CLEARLIST           = 'CLEARLIST';
  nSC_CLEARLIST           = 370;
  sSC_GROUPRECALL         = 'GROUPRECALL';   //弊缝捞悼鸥捞赣
  nSC_GROUPRECALL         = 371;
  sSC_GROUPMOVEMAP        = 'GROUPMOVEMAP';
  nSC_GROUPMOVEMAP        = 372;
  sSC_SAVESLAVES          = 'SAVESLAVES';
  nSC_SAVESLAVES          = 373;
  sGTMAPMOVE              = 'GTMAPMOVE';
  nGTMAPMOVE              = 374;
  sSC_ADDBEGINNER         = 'ADDBEGINNER';        //檬焊巩颇
  nSC_ADDBEGINNER         = 375;

  sSC_TEMPPOWERUP         = 'TEMPPOWERUP';
  nSC_TEMPPOWERUP         = 377;
  sSC_CHANGEJOBUP         = 'CHANGEJOBUP';
  nSC_CHANGEJOBUP         = 378;                //殿急函券
  sSC_SETSENDMSGFLAG1     = 'SETSENDMSGFLAG1';  //绊己
  nSC_SETSENDMSGFLAG1     = 379;
  //懦单胶 疙飞绢
  sUSEKILLPOINT           = 'USEKILLPOINT';      //懦痢荐 荤侩
  nUSEKILLPOINT           = 380;
  sSC_CHANGEITEM          = 'CHANGEITEM';  //函券
  nSC_CHANGEITEM          = 381;
  sSC_CHANGEITEMUP        = 'CHANGEITEMUP';  //函券 浚乔矫
  nSC_CHANGEITEMUP        = 382;

  sSC_BEGINNEREXPRATE     = 'BEGINNEREXPRATE';
  nSC_BEGINNEREXPRATE     = 383;
  s_GETCOMSTORAGEITEMS    = 'GETCOMSTORAGEITEMS';   //傍侩芒绊
  n_GETCOMSTORAGEITEMS    = 384;
  s_CLOSECOMSTORAGE       = 'CLOSECOMSTORAGE';
  n_CLOSECOMSTORAGE       = 385;
  s_GETGUILDSTORAGEITEMS  = 'GETGUILDSTORAGEITEMS'; //巩颇芒绊
  n_GETGUILDSTORAGEITEMS  = 386;
  s_CLOSEGUILDSTORAGE     = 'CLOSEGUILDSTORAGE';   //巩颇芒绊
  n_CLOSEGUILDSTORAGE     = 387;
  s_MOVETOLOVER           = 'MOVETOLOVER';   //楷牢 胶媚 捞悼  菊栏肺 捞悼
  n_MOVETOLOVER           = 388;
  s_BREAKLOVER            = 'BREAKLOVER';   //楷牢 胶媚 秦力
  n_BREAKLOVER            = 389;
  sSC_MASTEREXPRATE       = 'MASTEREXPRATE';   //荤力 版摹
  nSC_MASTEREXPRATE       = 390;
  sSC_HEALING             = 'HEALING';     //NPC 鳃傅
  nSC_HEALING             = 391;
  sSC_SNOW                = 'SNOW';   //传坷绰捞棋
  nSC_SNOW                = 392;
  sSC_FLOWER              = 'FLOWER';
  nSC_FLOWER              = 393;

  sSC_LOCK = 'LOCK';
  nSC_LOCK = 394;

  sSC_UNLOCK = 'UNLOCK';
  nSC_UNLOCK = 395;

  sSC_CLEARDUELMAP = 'CLEARDUELMAP';
  nSC_CLEARDUELMAP = 396;

  sSC_GETDUELITEMS = 'GETDUELITEMS';
  nSC_GETDUELITEMS = 397;

  sSC_PCPOINT = 'PCPOINT';
  nSC_PCPOINT = 398;

  sSC_ACCCHANGEITEM        = 'ACCCHANGEITEM';  //厘脚备函券
  nSC_ACCCHANGEITEM        = 399;

  sSC_DELETEHERO = 'DELETEHERO';
  nSC_DELETEHERO = 400;

  sSC_RECALLHERO = 'RECALLHERO';
  nSC_RECALLHERO = 401;

  sSC_HEROLOGOUT = 'HEROLOGOUT';
  nSC_HEROLOGOUT = 402;

  sSC_ROCKPAPERS      = 'ROCKPAPERS';   //啊困官困焊
  nSC_ROCKPAPERS      = 403;

  sSC_GUILDMODE       = 'GUILDMODE';
  nSC_GUILDMODE       = 404;


//胶农赋飘 疙飞绢
  sSL_SENDMSG      = '@@sendmsg';
  sSL_SENDMSG2     = '@@sendmsg2';
  sSUPERREPAIR     = '@s_repair';
  sSUPERREPAIROK   = '~@s_repair';
  sSUPERREPAIRFAIL = '@fail_s_repair';
  sREPAIR          = '@repair';
  sREPAIROK        = '~@repair';
  sBUY             = '@buy';
  sPBUY             = '@pbuy';
  sSELL            = '@sell';
  sLockUp          = '@Lock';
  sWake            = '@Wake';
  sReStore         = '@ReStore';
  sWAKEUPITEM      = '@Wakeupitem';
  sDISASSEMBLE     = '@disassemble';
  sDISMANTLE       = '@dismantle';
  sMAKEDURG        = '@makedrug';
  sMAKEGEM         = '@makegemlist';

  sMAKEFOOD        = '@makefood';  //力炼
  sMAKEPOTION      = '@makepotion';//力炼
  sMAKEGEMS        = '@makegem'; //力炼
  sMAKEITEM        = '@makeitem'; //力炼
  sMAKETUFF        = '@makestuff'; //力炼
  sMAKEETC         = '@makeetc'; //力炼

  sPRICES          = '@prices';
  sSTORAGE         = '@storage';        //芒绊
  sSETSTORAGEPW    = '@setstoragepw';   //芒绊鞠龋
  sSTORAGEPW       = '@storagepw';      //芒绊鞠龋

  sCONSIGN         = '@consign';        //困殴 拱扒 棵府扁
  sCOMSTORAGE      = '@comstorage';  //傍侩芒绊
  sGUILDSTORAGE    = '@guildstorage';  //巩颇芒绊
  sUPGRADENOW      = '@upgradenow';
  sUPGRADEING      = '~@upgradenow_ing';
  sUPGRADEOK       = '~@upgradenow_ok';
  sUPGRADEFAIL     = '~@upgradenow_fail';
  sCHECKWEAPON     = '@checkweapon';    //力访犬牢

  sGETBACKUPGNOW   = '@getbackupgnow';
  sGETBACKUPGOK    = '~@getbackupgnow_ok';
  sGETBACKUPGFAIL  = '~@getbackupgnow_fail';
  sGETBACKUPGFULL  = '~@getbackupgnow_bagfull';
  sGETBACKUPGING   = '~@getbackupgnow_ing';
  sEXIT            = '@exit';
  sBACK            = '@back';
  sMAIN            = '@main';
  sFAILMAIN        = '~@main';
  sUSEITEMNAME     = '@@useitemname';
  sBUILDGUILDNOW   = '@@buildguildnow';
  sSCL_GUILDWAR    = '@@guildwar';
  sDONATE          = '@@donate';

  sCASTLENAME      = '@@castlename';
  sWITHDRAWAL      = '@@withdrawal';
  sRECEIPTS        = '@@receipts';
  sOPENMAINDOOR    = '@openmaindoor';
  sCLOSEMAINDOOR   = '@closemaindoor';

  sOPENFIRSTDOOR    = '@openfirstdoor';
  sCLOSEFIRSTDOOR   = '@closefirstdoor';

  sOPENSECONDDOOR    = '@openseconddoor';
  sCLOSESECONDDOOR   = '@closeseconddoor';
  sREPAIRFDOORNOW   = '@repairfirstdoor';
  sREPAIRSDOORNOW   = '@repairseconddoor';

  sREPAIRDOORNOW   = '@repairdoornow';
  sREPAIRWALLNOW1  = '@repairwallnow1';
  sREPAIRWALLNOW2  = '@repairwallnow2';
  sREPAIRWALLNOW3  = '@repairwallnow3';
  sREPAIRWALLNOW4  = '@repairwallnow4';
  sHIREARCHERNOW   = '@hirearchernow';
  sHIREGUARDNOW    = '@hireguardnow';
  sHIREGUARDOK     = '@hireguardok';

  sAgitRecall      = '@agitrecall';
  sAgitoneRecall   = '@@agitonerecall';
  sAgitExtend      = '@agitextend';
  sAgitForSale     = '@@agitforsale';
  sAgitOrSaleCancel= '@agitforsalecancel';
  sAgitremain      = '@agitremain'; //厘盔 炼雀

  sKDZero          = '@kdzero'; //懦单胶 力肺 

  sga_decomon_count= '@ga_decomon_count';
  sga_decoitem_buy = '@ga_decoitem_buy';
  sagitreg         = '@agitreg';
  sagitmove        = '@agitmove';
  sagitbuy         = '@agitbuy';
  sgaboardlist     = '@gaboardlist';
  sMarket_Def      = 'Market_Def\';
  sNpc_def         = 'Npc_def\';
  sQuest_Def       = 'Quests\';

  sMakeNewHero     = '@MakeNewHero';

type
{$IF IniSystem = 1}
  TConfHeader = record
    sName:String[20];
    nVersion:Integer;
  end;
{$IFEND}

  TItemBind = record
    nMakeIdex:Integer;
    nItemIdx :Integer;
    sBindName:String[20];
  end;

  pTItemBind = ^TItemBind;
  TConsoleData = packed record
    nCrcExtInt   :Integer;
    nCrcDllInt   :Integer;
  end;
  pTConsoleData = ^TConsoleData;
{$IF OEMVER = OEM775}
  TLevelInfo = record
    wHP        :Word;
    wMP        :Word;
    dwExp      :LongWord;
    wAC        :Word;
    wMaxAC     :Word;
    wACLimit   :Word;
    wMAC       :Word;
    wMaxMAC    :Word;
    wMACLimit  :Word;
    wDC        :Word;
    wMaxDC     :Word;
    wDCLimit   :Word;
    dwDCExp    :LongWord;
    wMC        :Word;
    wMaxMC     :Word;
    wMCLimit   :Word;
    dwMCExp    :LongWord;
    wSC        :Word;
    wMaxSC     :Word;
    wSCLimit   :Word;
    dwSCExp    :LongWord;
  end;
{$IFEND}


procedure SetProcessName(sName:String);
function  GetExVersionNO(nVersionDate:Integer; var nOldVerstionDate:Integer):Integer;
function  GetNextDirection (sx, sy, dx, dy: Integer): byte;
function  GetNextDirectionNew (sx, sy, dx, dy: Integer): byte; //sonmg荐沥(2004/06/23)
function  LoadLineNotice(FileName:String):Boolean;
function  LoadLineHint(FileName: string): Boolean;
function  GetMultiServerAddrPort(btServerIndex:Byte;var sIPaddr:String;var nPort:Integer):Boolean;
procedure MainOutMessage(Msg:String);

function  GetGoldStr (gold: integer): string;     //陛傈
function  GetTakeOnPosition(smode: integer): integer;
function  AddDateTimeOfDay(DateTime:TDateTime;nDay:Integer):TDateTime;
function  GetGoldShape(nGold:Integer):Word;
function  GetRandomLook(nBaseLook,nRage:Integer):Integer;
function  FilterShowName(sName:String):String;
function  FilterStdShowName(Std:TItem; sName:String):String;
function  FilterStdShowName2(Std:TItem; sName:String):String;
function  CheckGuildName(sGuildName:String):Boolean;
function  CheckUserItems(nIdx:integer;StdItem:TItem):Boolean;
function  GetItemNumber():Integer;
function  GetItemNumberEx():Integer;
function  GetValNameNo(sText:String):Integer;
function  IsAccessory(nIndex:Integer):Boolean;
function  GetDisassembleCondition (itemname: string; var iPrice: Integer): TStringList;
function  GetWakeUpCondition (StdMode, mode, iValue, Grade: string): TStringList;
function  GetDismantleCondition (itemname: string; var iPrice: Integer): TStringList;
function  GetMakeItemCondition (itemname: string; var iPrice: Integer): TStringList;     //力炼胶媚
function  GetChangeItemJob (itemname: string; sJob: integer): TStringList;
procedure AddLogonCostLog(sMsg:String);
procedure AddGameDataLog(sMsg:String);
procedure TrimStringList(sList:TStringList);
function CanMakeItem(sItemName:String):Boolean;
function CanConsignItem(sItemName:String):Boolean; //困殴 陛瘤
function CanRentalItem(sItemName:String):Boolean; //措咯 阂啊
function CanMoveMap(sMapName:String):Boolean;
function CanSellItem(sItemName:String):Boolean;
function LoadMonSayMsg():Boolean;
function LoadItemBindIPaddr():Boolean;
function SaveItemBindIPaddr():Boolean;
function LoadItemBindAccount():Boolean;
function SaveItemBindAccount():Boolean;
function LoadItemBindCharName():Boolean;
function SaveItemBindCharName():Boolean;
function LoadDisableMakeItem():Boolean;
function SaveDisableMakeItem():Boolean;
function LoadDisableConsignItem():Boolean;     //困殴
function SaveDisableConsignItem():Boolean;        //困殴

function LoadDisableRentalItem():Boolean;     //措咯  阂啊
function SaveDisableRentalItem():Boolean;       //措咯 阂啊

function LoadDisableMoveMap():Boolean;
function SaveDisableMoveMap():Boolean;
function LoadAllowSellOffItem():Boolean;
function SaveAllowSellOffItem():Boolean;
procedure LoadUserCmdList();
procedure SaveUserCmdList();

function GetUseItemName(nIndex:Integer):String;
function GetUseItemIdx(sName:String):Integer;
function LoadMonDropLimitList():Boolean;
function SaveMonDropLimitList():Boolean;
function LoadDisableTakeOffList():Boolean;
function SaveDisableTakeOffList():Boolean;
function InDisableTakeOffList(nItemIdx:Integer):Boolean;
function LoadDisableSendMsgList():Boolean;
function SaveDisableSendMsgList():Boolean;
function GetDisableSendMsgList(sHumanName:String):Boolean;
function LoadGameLogItemNameList():Boolean;
function GetGameLogItemNameList(sItemName:String):Byte;
function SaveGameLogItemNameList():Boolean;
function LoadDenyIPAddrList():Boolean;
function GetDenyIPAddrList(sIPaddr:String):Boolean;
function SaveDenyIPAddrList():Boolean;
function LoadDenyAccountList():Boolean;
function GetDenyAccountList(sAccount:String):Boolean;
function SaveDenyAccountList():Boolean;
function LoadDenyChrNameList():Boolean;
function GetDenyChrNameList(sChrName:String):Boolean;
function SaveDenyChrNameList():Boolean;

function GetDenyHDDList(sHddName:String):Boolean;        //荐沥登菌嚼聪促.
function LoadDenyHDDList():Boolean;                      //荐沥登菌嚼聪促.
function SaveDenyHDDList():Boolean;                      //荐沥登菌嚼聪促.

function LoadNoClearMonList():Boolean;
function GetNoClearMonList(sMonName:String):Boolean;
function SaveNoClearMonList():Boolean;
procedure LoadGameCommand();
procedure LoadString();
function checkUPItemname(itemlist:TList; Name:String):Boolean;       //犁访
function checkUPItemnameidx(itemlist:TList; Name:string; idx:Integer):Boolean;  //犁访

function SetSayItem(UserItem: pTUserItem): Integer;
function GetSayItem(Index: Integer): pTUserItem;

{$IF IniSystem = 1}
procedure LoadSettings;
procedure SaveSettings;
{$ELSE}
procedure LoadExp();
procedure LoadConfig();
{$IFEND}

function GetRGB(c256:Byte):TColor;stdcall;
procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
function  GetIPLocal(sIPaddr:String):String;
function  IsCheapStuff(StdMode:Byte):Boolean;
function  CompareIPaddr(sIPaddr,dIPaddr:String):Boolean;

function GetCompoundInfo(const sItemName: string; nLevel: Integer): pTCompoundInfo;     //酒捞袍钦己
function GetCompoundInfos(const sItemName: string): pTCompoundInfos;
procedure SaveCompoundInfos;
procedure UpgradeCompoundItem(AUserItem: pTUserItem; AUpgradeCom: pTCompoundInfo);

var
  g_dwGameCenterHandle:THandle;
  IsDebuggerPresent:function():Boolean;stdcall;
  g_ServerShopList   :TGList;    //券惑痢
  g_FishItmeList     :TGList;      //超矫
  g_FishEventItmeList    :TGList;  //超矫 捞亥飘
  TestUpServer            :boolean = False;
{$IF OEMVER = OEM775}
  Level775          :TIniFile;
{$IFEND}
  Config            :TIniFile;
  SqlConf           :TIniFile;
  ExpConf           :TIniFile;
  CommandConf       :TIniFile;
  StringConf        :TIniFile;
  Memo              :TMemo;
  nServerIndex      :Integer = 0;      //0x004EBC04
  RunSocket         :TRunSocket;       //0x004EBB84
  MainLogMsgList    :TStringList;      //0x004EBC60
  LogStringList     :TStringList;      //0x004EBC64
  LogonCostLogList  :TStringList;      //0x004EBC68
  g_MapManager      :TMapManager;       //0x004EBB90
  ItemUnit          :TItemUnit;
  MagicManager      :TMagicManager;    //0x004EBB98
  NoticeManager     :TNoticeManager;   //0x004EBB9C
  g_GuildManager    :TGuildManager;    //0x004EBBA0
  g_EventManager    :TEventManager;    //0x004EBBA4
  gFireDragon       :TDragonSystem;      //付锋
  g_CastleManager   :TCastleManager;
  g_GuildTerritory  :TGTManager;
  g_CompoundInfoList: TGStringList;            //酒捞袍钦己
  g_UserCmdList     :TGStringList;       //蜡历疙飞绢
  FrontEngine       :TFrontEngine;     //0x004EBB88
  UserEngine        :TUserEngine;      //0x004EBB8C
  RobotManage       :TRobotManage;
  g_MakeItemList    :TStringList;
  g_ChangeItemList  :TStringList;
  g_DismantleList   :TStringList;
  g_WakeItemList    :TStringList;
  g_DisassembleList :TStringList;        //阿己盒秦
  g_StartPoint      :TGList;
  g_RedStartPoint   :TStartPoint;
  ServerTableList   :TList;            //0x004EBBB4
  g_DenySayMsgList  :TQuickList;       //0x004EBBB8
  MiniMapList       :TStringList;      //0x004EBBBC
  BigMapList        :TStringList;
  g_UnbindList      :TStringList;      //0x004EBBC0
  LineNoticeList    :TStringList;      //0x004EBBC4
  QuestDiaryList    :TList;            //0x004EBBC8
  ItemEventList     :TStringList;      //0x004EBBCC
  g_MonSayMsgList   :TStringList;
  g_DisableMakeItemList :TGStringList;
  g_EnableMakeItemList  :TGStringList;
  g_DisableSellOffList  :TGStringList;
  g_DisableMoveMapList  :TGStringList;
  g_DisableConsignItemList :TGStringList;     //困殴
  g_DisableRentalItemList  :TGStringList;    //措咯 阂啊
  g_ItemNameList        :TGList;
  g_DisableSendMsgList  :TGStringList;
  g_MonDropLimitLIst    :TGStringList;
  g_DisableTakeOffList  :TGStringList;

  g_ItemBindIPaddr      :TGList;
  g_ItemBindAccount     :TGList;
  g_ItemBindCharName    :TGList;

  g_GameLogItemNameList :TGStringList;
  g_boGameLogGold       :Boolean;
  g_boGameLogGameGold   :Boolean;
  g_boGameLogGamePoint  :Boolean;
  g_boGameLogHumanDie   :Boolean;
  g_DenyIPAddrList      :TGStringList;
  g_DenyChrNameList     :TGStringList;
  g_DenyAccountList     :TGStringList;
  g_DenyHDDList         :TGStringList;              //荐沥登菌嚼聪促.
  g_NoClearMonLIst      :TGStringList;
  g_SetItemsList        :TList;
  g_SetItemsArr         :array of Boolean;
  n4EBBD0               :Integer;
  g_DecorationList      :TList;
  g_GameShopItemList    :TList;

  g_SayItemList: array[0..MAXSAYITEMCOUNT] of TUserItem;
  g_SayItemIndex: Integer;


  g_MapEventListOfDropItem: TGList;
  g_MapEventListOfPickUpItem: TGList;
  g_MapEventListOfMine: TGList;
  g_MapEventListOfWalk: TGList;
  g_MapEventListOfRun: TGList;

  LogMsgCriticalSection             :TRTLCriticalSection;  //0x4EBC40
  ProcessMsgCriticalSection         :TRTLCriticalSection;  //0x4EBC44
  UserDBSection                     :TRTLCriticalSection;
  ProcessHumanCriticalSection       :TRTLCriticalSection;


  g_nTotalHumCount    :integer;           //0x004EB3C3
  g_boMission       :Boolean;
  g_sMissionMap     :String;
  g_nMissionX       :Integer;
  g_nMissionY       :Integer;

  boStartReady      :Boolean;           //0x4EBC78
  g_boExitServer    :Boolean;           //004EBC79
  boFilterWord      :Boolean;

  sLogFileName      :String;  //004EBBFC
  sUsrLogFileName   :String = '.\UsrLog.txt';
  nRunTimeMin       :Integer;
  nRunTimeMax       :Integer;
  g_nBaseObjTimeMin  :Integer;
  g_nBaseObjTimeMax  :Integer;
  g_nSockCountMin    :Integer;
  g_nSockCountMax    :Integer;
  g_nUsrTimeMin      :Integer;
  g_nUsrTimeMax      :Integer;
  g_nHumCountMin     :Integer;
  g_nHumCountMax     :Integer;
  g_nMonTimeMin      :Integer;
  g_nMonTimeMax      :Integer;
  g_nMonGenTime     :Integer;
  g_nMonGenTimeMin  :Integer;
  g_nMonGenTimeMax  :Integer;
  g_nMonProcTime    :Integer;
  g_nMonProcTimeMin :Integer;
  g_nMonProcTimeMax :Integer;
  dwUsrRotCountMin  :Integer;
  dwUsrRotCountMax  :Integer;

  g_dwUsrRotCountTick :LongWord; //0x4EBD48          :LongWord;
  g_nProcessHumanLoopTime  :Integer; //0x004EBD54
  m_nSaveDBError      :Integer = 0;
  g_dwHumLimit        :LongWord = 30;   //0x4EBD98
  g_dwHeroLimit       :LongWord = 30;
  g_dwMonLimit        :LongWord = 30;   //0x4EBD9C
  g_dwZenLimit        :LongWord = 5;    //0x4EBDA0
  g_dwNpcLimit        :LongWord = 5;    //0x4EBDA4
  g_dwSocLimit        :LongWord = 10;   //0x4EBDA8
  g_dwSocCheckTimeOut :LongWord = 50;//2 * 1000;
  nDecLimit           :Integer  = 20;   //0x4EBDAC

  nShiftUsrDataNameNo :Integer;
{$IF OEMVER = OEM775}
  sConfig775FileName:String = '.\775.txt';
{$IFEND}
  sConfigFileName   :String = '.\!Setup.txt';
  sSqlConfigFileName:String = '.\SqlConnect.ini';
  sExpConfigFileName:String = '.\Exps.ini';
  sCommandFileName  :String = '.\Command.ini';
  sStringFileName   :String = '.\String.ini';

  dwRunDBTimeMax      :LongWord; //0x004EBC98
  g_dwStartTick       :LongWord; //0x004EBD14

  g_dwRunTick          :LongWord; //0x4EBD18;
  n4EBD1C           :Integer;

  g_nGameTime       :Integer;

  g_sMonGenInfo1    :String;  //0x4EBD58
  g_sMonGenInfo2    :String;  //0x4EBD78
  g_sProcessName    :String;
  g_sOldProcessName :String;

  g_ManageNPC         :TNormNpc;
  g_RobotNPC          :TNormNpc;
  g_FunctionNPC       :TMerchant;
  g_DynamicVarList    :TList;
  nCurrentMonthly   :Integer;    //0x004EBD00
  nTotalTimeUsage   :Integer;    //0x004EBD04
  nLastMonthlyTotalUsage :Integer;  //0x004EBD08
  nGrossTotalCnt    :Integer;    //0x004EBD0C
  nGrossResetCnt    :Integer;    //0x004EBD10
  n4EBB68           :Integer;    //0x004EBB68
  n4EBB6C           :Integer;    //0x004EBB6C

  //(火龙代码)
  nEMDrops         :Integer;//holds how often em part has dropped this round
  nEMKills         :Integer;//total times em been killed since reboot
  nEMHitCount      :Integer;//counter to keep track of how often empart been hit
  dwEMSpellTick    :LongWord;//to avoid all the fake parts using the spell use one common timer
  dwEMDied         :LongWord;//keep track of em's alive/dead and when


  ColorTable:array[0..255] of TRGBQuad;
  ColorArray:array[0..1023] of Byte =(
        $00, $00, $00, $00, $00, $00, $80, $00, $00, $80, $00, $00, $00, $80, $80, $00,
	$80, $00, $00, $00, $80, $00, $80, $00, $80, $80, $00, $00, $C0, $C0, $C0, $00,
	$97, $80, $55, $00, $C8, $B9, $9D, $00, $73, $73, $7B, $00, $29, $29, $2D, $00,
	$52, $52, $5A, $00, $5A, $5A, $63, $00, $39, $39, $42, $00, $18, $18, $1D, $00,
	$10, $10, $18, $00, $18, $18, $29, $00, $08, $08, $10, $00, $71, $79, $F2, $00,
	$5F, $67, $E1, $00, $5A, $5A, $FF, $00, $31, $31, $FF, $00, $52, $5A, $D6, $00,
	$00, $10, $94, $00, $18, $29, $94, $00, $00, $08, $39, $00, $00, $10, $73, $00,
	$00, $18, $B5, $00, $52, $63, $BD, $00, $10, $18, $42, $00, $99, $AA, $FF, $00,
	$00, $10, $5A, $00, $29, $39, $73, $00, $31, $4A, $A5, $00, $73, $7B, $94, $00,
	$31, $52, $BD, $00, $10, $21, $52, $00, $18, $31, $7B, $00, $10, $18, $2D, $00,
	$31, $4A, $8C, $00, $00, $29, $94, $00, $00, $31, $BD, $00, $52, $73, $C6, $00,
	$18, $31, $6B, $00, $42, $6B, $C6, $00, $00, $4A, $CE, $00, $39, $63, $A5, $00,
	$18, $31, $5A, $00, $00, $10, $2A, $00, $00, $08, $15, $00, $00, $18, $3A, $00,
	$00, $00, $08, $00, $00, $00, $29, $00, $00, $00, $4A, $00, $00, $00, $9D, $00,
	$00, $00, $DC, $00, $00, $00, $DE, $00, $00, $00, $FB, $00, $52, $73, $9C, $00,
	$4A, $6B, $94, $00, $29, $4A, $73, $00, $18, $31, $52, $00, $18, $4A, $8C, $00,
	$11, $44, $88, $00, $00, $21, $4A, $00, $10, $18, $21, $00, $5A, $94, $D6, $00,
	$21, $6B, $C6, $00, $00, $6B, $EF, $00, $00, $77, $FF, $00, $84, $94, $A5, $00,
	$21, $31, $42, $00, $08, $10, $18, $00, $08, $18, $29, $00, $00, $10, $21, $00,
	$18, $29, $39, $00, $39, $63, $8C, $00, $10, $29, $42, $00, $18, $42, $6B, $00,
	$18, $4A, $7B, $00, $00, $4A, $94, $00, $7B, $84, $8C, $00, $5A, $63, $6B, $00,
	$39, $42, $4A, $00, $18, $21, $29, $00, $29, $39, $46, $00, $94, $A5, $B5, $00,
	$5A, $6B, $7B, $00, $94, $B1, $CE, $00, $73, $8C, $A5, $00, $5A, $73, $8C, $00,
	$73, $94, $B5, $00, $73, $A5, $D6, $00, $4A, $A5, $EF, $00, $8C, $C6, $EF, $00,
	$42, $63, $7B, $00, $39, $56, $6B, $00, $5A, $94, $BD, $00, $00, $39, $63, $00,
	$AD, $C6, $D6, $00, $29, $42, $52, $00, $18, $63, $94, $00, $AD, $D6, $EF, $00,
	$63, $8C, $A5, $00, $4A, $5A, $63, $00, $7B, $A5, $BD, $00, $18, $42, $5A, $00,
	$31, $8C, $BD, $00, $29, $31, $35, $00, $63, $84, $94, $00, $4A, $6B, $7B, $00,
	$5A, $8C, $A5, $00, $29, $4A, $5A, $00, $39, $7B, $9C, $00, $10, $31, $42, $00,
	$21, $AD, $EF, $00, $00, $10, $18, $00, $00, $21, $29, $00, $00, $6B, $9C, $00,
	$5A, $84, $94, $00, $18, $42, $52, $00, $29, $5A, $6B, $00, $21, $63, $7B, $00,
	$21, $7B, $9C, $00, $00, $A5, $DE, $00, $39, $52, $5A, $00, $10, $29, $31, $00,
	$7B, $BD, $CE, $00, $39, $5A, $63, $00, $4A, $84, $94, $00, $29, $A5, $C6, $00,
	$18, $9C, $10, $00, $4A, $8C, $42, $00, $42, $8C, $31, $00, $29, $94, $10, $00,
	$10, $18, $08, $00, $18, $18, $08, $00, $10, $29, $08, $00, $29, $42, $18, $00,
	$AD, $B5, $A5, $00, $73, $73, $6B, $00, $29, $29, $18, $00, $4A, $42, $18, $00,
	$4A, $42, $31, $00, $DE, $C6, $63, $00, $FF, $DD, $44, $00, $EF, $D6, $8C, $00,
	$39, $6B, $73, $00, $39, $DE, $F7, $00, $8C, $EF, $F7, $00, $00, $E7, $F7, $00,
	$5A, $6B, $6B, $00, $A5, $8C, $5A, $00, $EF, $B5, $39, $00, $CE, $9C, $4A, $00,
	$B5, $84, $31, $00, $6B, $52, $31, $00, $D6, $DE, $DE, $00, $B5, $BD, $BD, $00,
	$84, $8C, $8C, $00, $DE, $F7, $F7, $00, $18, $08, $00, $00, $39, $18, $08, $00,
	$29, $10, $08, $00, $00, $18, $08, $00, $00, $29, $08, $00, $A5, $52, $00, $00,
	$DE, $7B, $00, $00, $4A, $29, $10, $00, $6B, $39, $10, $00, $8C, $52, $10, $00,
	$A5, $5A, $21, $00, $5A, $31, $10, $00, $84, $42, $10, $00, $84, $52, $31, $00,
	$31, $21, $18, $00, $7B, $5A, $4A, $00, $A5, $6B, $52, $00, $63, $39, $29, $00,
	$DE, $4A, $10, $00, $21, $29, $29, $00, $39, $4A, $4A, $00, $18, $29, $29, $00,
	$29, $4A, $4A, $00, $42, $7B, $7B, $00, $4A, $9C, $9C, $00, $29, $5A, $5A, $00,
	$14, $42, $42, $00, $00, $39, $39, $00, $00, $59, $59, $00, $2C, $35, $CA, $00,
	$21, $73, $6B, $00, $00, $31, $29, $00, $10, $39, $31, $00, $18, $39, $31, $00,
	$00, $4A, $42, $00, $18, $63, $52, $00, $29, $73, $5A, $00, $18, $4A, $31, $00,
	$00, $21, $18, $00, $00, $31, $18, $00, $10, $39, $18, $00, $4A, $84, $63, $00,
	$4A, $BD, $6B, $00, $4A, $B5, $63, $00, $4A, $BD, $63, $00, $4A, $9C, $5A, $00,
	$39, $8C, $4A, $00, $4A, $C6, $63, $00, $4A, $D6, $63, $00, $4A, $84, $52, $00,
	$29, $73, $31, $00, $5A, $C6, $63, $00, $4A, $BD, $52, $00, $00, $FF, $10, $00,
	$18, $29, $18, $00, $4A, $88, $4A, $00, $4A, $E7, $4A, $00, $00, $5A, $00, $00,
	$00, $88, $00, $00, $00, $94, $00, $00, $00, $DE, $00, $00, $00, $EE, $00, $00,
	$00, $FB, $00, $00, $94, $5A, $4A, $00, $B5, $73, $63, $00, $D6, $8C, $7B, $00,
	$D6, $7B, $6B, $00, $FF, $88, $77, $00, $CE, $C6, $C6, $00, $9C, $94, $94, $00,
	$C6, $94, $9C, $00, $39, $31, $31, $00, $84, $18, $29, $00, $84, $00, $18, $00,
	$52, $42, $4A, $00, $7B, $42, $52, $00, $73, $5A, $63, $00, $F7, $B5, $CE, $00,
	$9C, $7B, $8C, $00, $CC, $22, $77, $00, $FF, $AA, $DD, $00, $2A, $B4, $F0, $00,
	$9F, $00, $DF, $00, $B3, $17, $E3, $00, $F0, $FB, $FF, $00, $A4, $A0, $A0, $00,
	$80, $80, $80, $00, $00, $00, $FF, $00, $00, $FF, $00, $00, $00, $FF, $FF, $00,
	$FF, $00, $00, $00, $FF, $00, $FF, $00, $FF, $FF, $00, $00, $FF, $FF, $FF, $00
        );

  g_GMRedMsgCmd            :Char = '!';
  g_nGMREDMSGCMD           :Integer = 6;

  g_GMRedMsgCmd1            :Char = '@';
  g_nGMREDMSGCMD1           :Integer = 6;

  g_dwSendOnlineTick         :LongWord;

  g_HighLevelHuman     :TObject = nil;
  g_HighPKPointHuman   :TObject = nil;
  g_HighDCHuman        :TObject = nil;
  g_HighMCHuman        :TOBject = nil;
  g_HighSCHuman        :TObject = nil;
  g_HighOnlineHuman    :TObject = nil;

  g_dwSpiritMutinyTick      :LongWord;

  g_Config                  :TM2Config = (
    nConfigSize             :SizeOf(TM2Config);
    sServerName             :'龙的传说';
    sServerIPaddr           :'127.0.0.1';
    sWebSite                :'http://www.smir2.com';
    sBbsSite                :'http://www.smir2.com';
    sClientDownload         :'http://www.smir2.com';
    sQQ                     :'N/A';
    sPhone                  :'N/A';
    sBankAccount0           :'N/A';
    sBankAccount1           :'N/A';
    sBankAccount2           :'N/A';
    sBankAccount3           :'N/A';
    sBankAccount4           :'N/A';
    sBankAccount5           :'N/A';
    sBankAccount6           :'N/A';
    sBankAccount7           :'N/A';
    sBankAccount8           :'N/A';
    sBankAccount9           :'N/A';
    nServerNumber           :0;
    boVentureServer         :False;
    boTestServer            :True;
    boServiceMode           :False;
    boNonPKServer           :False;
    nTestLevel              :1;
    nTestGold               :0;
    nTestUserLimit          :1000;
    nUserLimit              :2000;
    slim                    :'l\';
    nSendBlock              :1024;
    nCheckBlock             :8000;
    nAvailableBlock         :8000;
    nGateLoad               :0;
    nUserFull               :1000;
    nZenFastStep            :300;
    sGateAddr               :'127.0.0.1';
    nGatePort               :5000;
    sDBAddr                 :'127.0.0.1';
    nDBPort                 :6000;
    sIDSAddr                :'127.0.0.1';
    nIDSPort                :5600;
    sMsgSrvAddr             :'127.0.0.1';
    nMsgSrvPort             :4900;
    sLogServerAddr          :'127.0.0.1';
    nLogServerPort          :10000;
    boDiscountForNightTime  :False;
    nHalfFeeStart           :2;
    nHalfFeeEnd             :10;
    boTimeEventUse          :False;   //立加矫埃 捞亥飘荤侩
    nMinEvent               :0;   //割盒付促?
    nHourEvent              :1;   //割矫埃付促?
    nWakeUpRate             :75;
    boViewHackMessage       :FALSE;
    boViewAdmissionFailure  :False;
    sBaseDir                :'.\Share\';
    sGuildDir               :'.\GuildBase\Guilds\';
    sGuildFile              :'.\GuildBase\GuildList.txt';
    sVentureDir             :'.\ShareV\';
    sConLogDir              :'.\ConLog\';
    sCastleDir              :'.\Envir\Castle\';
    sCastleFile             :'.\Envir\Castle\List.txt';
    sEnvirDir               :'.\Envir\';
    sMapDir                 :'.\Map\Mir2\';
    sMapEIDir               :'.\Map\Mir3\';
    sShandaMapDir           :'.\Map\Shanda\';
    sNoticeDir              :'.\Notice\';
    sLogDir                 :'.\Log\';
    sPlugDir                :'.\Plug-in\';
    sClientFile1            :'mir.exe';
    sClientFile2            :'mir2.exe';
    sClientFile3            :'mir3.exe';

    sLevel50Effect          :50;
    sLevel60Effect          :60;
    sLevel70Effect          :70;
    sLevelComEffect         :80;
    sClothsMan              :'布衣(男)';
    sClothsWoman            :'布衣(女)';
    sWoodenSword            :'木棍';
    sAssassinWeapon         :'虎牙刀';
    sBonzeWeapon            :'木棍';
    sCandle                 :'蜡烛';
    sBasicDrug              :'体力恢复药(小)';
    sGoldStone              :'金矿';
    sSilverStone            :'银矿';
    sSteelStone             :'铁矿';
    sCopperStone            :'铜矿';
    sBlackStone             :'黑铁矿石';
    sGreenStone             :'锈铁矿';
    sGemStone1              :'红宝石矿';
    sGemStone2              :'紫晶矿';
    sGemStone3              :'软玉矿';
    sGemStone4              :'铂金矿';

    sLegendZuma             :('古代咒魔护法','古代咒魔神将','古代魔弓使','古代楔蛾');
    sZuma                   :('咒魔护法','咒魔神将','魔弓使','楔蛾');
    sPotMon                 :('悲月素狐','咒魔护法','烟魂怪黑兽','奥玛重尉兵','斩冤鬼','大刀赤鬼','寒泉鬼','血魔','守护鬼使','冰炎鬼将',
                              '般若左使','魔焰守护将','飞毒蛛','骷髅精灵','幻影寒虎','奥玛勇士','咒术鬼','投眼虫','尸王','黑色恶蛆');
    sPotMon1                :('黑血蛇','牛面鬼王','白野猪','黑蛇王','夜攻守护鬼','咒魔击雷将','邪恶钳虫','触龙神','舌刃大虫','咒魔石尊',
                              '鬼猪王','黑天魔王','破凰魔神','月氏镰神将','鸟人像','石魔兽','寒冰守护鬼','怨恶','古代守护长','丹墨');
    sBee                    :'蝙蝠';
    sSpider                 :'爆蛛';
    sSpider2                :'爆魔蛛';
    sWoomaHorn              :'沃玛号角';
    sZumaPiece              :'祖玛头像';
    sGameGoldName           :'游戏币';
    sGamePointName          :'游戏点';
    sPCPointName            :'PC点';
    DBSocket                :INVALID_SOCKET;
    nHealthFillTime         :300;
    nSpellFillTime          :800;
    nMonUpLvNeedKillBase    :100;
    nMonUpLvRate            :16;
    MonUpLvNeedKillCount    :(0,0,50,100,200,300,600,1200);
    SlaveColor              :($FF,$FE,$93,$9A,$E5,$A8,$B4,$FC,249);
    WideAttack              :(7,1,2);
    CrsAttack               :(7,1,2,3,4,5,6);
    SpitMap                 :(
                    ((0, 0, 1, 0, 0),     //DR_UP
                     (0, 0, 1, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0)),
                    ((0, 0, 0, 0, 1),     //DR_UPRIGHT
                     (0, 0, 0, 1, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0)),
                    ((0, 0, 0, 0, 0),     //DR_RIGHT
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 1, 1),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0)),
                    ((0, 0, 0, 0, 0),     //DR_DOWNRIGHT
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 1, 0),
                     (0, 0, 0, 0, 1)),
                    ((0, 0, 0, 0, 0),     //DR_DOWN
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 1, 0, 0),
                     (0, 0, 1, 0, 0)),
                    ((0, 0, 0, 0, 0),     //DR_DOWNLEFT
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 1, 0, 0, 0),
                     (1, 0, 0, 0, 0)),
                    ((0, 0, 0, 0, 0),     //DR_LEFT
                     (0, 0, 0, 0, 0),
                     (1, 1, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0)),
                    ((1, 0, 0, 0, 0),     //DR_UPLEFT
                     (0, 1, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0),
                     (0, 0, 0, 0, 0))
                    );

    sHomeMap                :'0';
    nHomeX                  :289;
    nHomeY                  :618;
    sRedHomeMap             :'3';
    nRedHomeX               :845;
    nRedHomeY               :674;
    sRedDieHomeMap          :'3';
    nRedDieHomeX            :839;
    nRedDieHomeY            :668;
    boJobHomePoint          :False;
    sWarriorHomeMap         :'0';
    nWarriorHomeX           :289;
    nWarriorHomeY           :618;
    sWizardHomeMap          :'0';
    nWizardHomeX            :650;
    nWizardHomeY            :631;
    sTaoistHomeMap          :'0';
    nTaoistHomeX            :334;
    nTaoistHomeY            :266;
    sAssassinHomeMap        :'0';
    nAssassinHomeX          :289;
    nAssassinHomeY          :618;           //磊按
    sBonzeHomeMap           :'0';
    nBonzeHomeX             :289;
    nBonzeHomeY             :618;
    dwDecPkPointTime        :2 * 60 * 1000;
    nDecPkPointCount        :1;
    dwPKFlagTime            :60 * 1000;
    nKillHumanAddPKPoint    :100;
    nKillHumanDecLuckPoint  :500;
    dwDecLightItemDrugTime  :500;
    nSafeZoneSize           :10;
    nStartPointSize         :2;
    dwHumanGetMsgTime       :200;
    nGroupMembersMax        :10;
    sFireBallSkill          :'火球术';
    sHealSkill              :'治愈术';
    ReNewNameColor          :($FF,$FE,$93,$9A,$E5,$A8,$B4,$FC,$B4,$FC);
    dwReNewNameColorTime    :2000;
    boReNewChangeColor      :True;
    boReNewLevelClearExp    :True;
    boNeutralityAttack      :False;
    BonusAbilofWarr         :(DC:17;MC:20;SC:20;AC:20;MAC:20;HP:1;MP:3;Hit:20;Speed:35;X2:0);
    BonusAbilofWizard       :(DC:17;MC:25;SC:30;AC:20;MAC:15;HP:2;MP:1;Hit:25;Speed:35;X2:0);
    BonusAbilofTaos         :(DC:20;MC:30;SC:17;AC:20;MAC:15;HP:2;MP:1;Hit:30;Speed:30;X2:0);
    BonusAbilofAssassin     :(DC:17;MC:20;SC:20;AC:20;MAC:15;HP:2;MP:2;Hit:25;Speed:35;X2:0);      //磊按
    BonusAbilofBonze        :(DC:17;MC:20;SC:20;AC:20;MAC:15;HP:2;MP:2;Hit:25;Speed:35;X2:0);
    NakedAbilofWarr         :(DC:512;MC:2560;SC:20;AC:768;MAC:1280;HP:0;MP:0;Hit:0;Speed:0;X2:0);
    NakedAbilofWizard       :(DC:512;MC:512;SC:2560;AC:1280;MAC:768;HP:0;MP:0;Hit:5;Speed:0;X2:0);
    NakedAbilofTaos         :(DC:20;MC:30;SC:17;AC:20;MAC:15;HP:2;MP:1;Hit:30;Speed:30;X2:0);
    NakedAbilofAssassin     :(DC:512;MC:512;SC:2560;AC:1280;MAC:768;HP:0;MP:0;Hit:0;Speed:0;X2:0);      //磊按
    NakedAbilofBonze        :(DC:512;MC:512;SC:2560;AC:1280;MAC:768;HP:0;MP:0;Hit:0;Speed:0;X2:0);
    nUpgradeWeaponMaxPoint  :20;
    nUpgradeWeaponPrice     :10000;
    dwUPgradeWeaponGetBackTime     :60 * 60 * 1000;
    nClearExpireUpgradeWeaponDays  :8;
    nUpgradeWeaponDCRate           :100;
    nUpgradeWeaponDCTwoPointRate   :30;
    nUpgradeWeaponDCThreePointRate :200;
    nUpgradeWeaponSCRate           :100;
    nUpgradeWeaponSCTwoPointRate   :30;
    nUpgradeWeaponSCThreePointRate :200;
    nUpgradeWeaponMCRate           :100;
    nUpgradeWeaponMCTwoPointRate   :30;
    nUpgradeWeaponMCThreePointRate :200;
    dwProcessMonstersTime          :10;
    dwRegenMonstersTime            :200;
    nMonGenRate                    :10;
    nProcessMonRandRate            :5;
    nProcessMonLimitCount          :5;
    nSoftVersionDate               :20020522;
    boCanOldClientLogon            :True;
    dwConsoleShowUserCountTime     :10 * 60 * 1000;
    dwShowLineNoticeTime           :5 * 60 * 1000;
    nLineNoticeColor               :2;
    nStartCastlewarDay             :(1,3,5); //傍己 拳 格 配
    nStartCastlewarTime            :20;
    nStartCastlewarMin             :0;
    dwCastleFlagRegenTime          :5 * 60 * 1000;
    dwShowCastleWarEndMsgTime      :10 * 60 * 1000;
    dwCastleWarTime                :2 * 60 * 60 * 1000;
    dwGuildWarTime                 :3 * 60 * 60 * 1000;
    nBuildGuildPrice               :1000000;
    nGuildMarkPrice                :10000000; //巩颇 付农 啊拜
    nGuildWarPrice                 :30000;
    nMakeDurgPrice                 :100;
    nHumanMaxGold                  :150000000;
    nHumanTryModeMaxGold           :100000;
    nTryModeLevel                  :7;
    boTryModeUseStorage            :False;
    nCanShoutMsgLevel              :7;
    boShowMakeItemMsg              :False;
    boShutRedMsgShowGMName         :False;
    nSayMsgMaxLen                  :80;
    dwSayMsgTime                   :3 * 1000;
    nSayMsgCount                   :5;
    dwDisableSayMsgTime            :30 * 1000;
    nSayRedMsgMaxLen               :255;
    boShowGuildName                :True;
    boShowRankLevelName            :False;
    boShowColumnName               :True; //漠烦捞抚
    boMonSayMsg                    :False;
    nStartPermission               :0;
    boKillHumanWinLevel            :False;
    boKilledLostLevel              :False;
    boPKServer                     :True; //懦单胶 葛靛
    nFishSuccess                   :10;  //超矫 犬伏 捞亥飘(款康磊侩)
    boKillHumanWinExp              :False;
    boKilledLostExp                :False;
    nKillHumanWinLevel             :1;
    nKilledLostLevel               :1;
    nKillHumanWinExp               :100000;
    nKillHumanLostExp              :100000;
    nHumanLevelDiffer              :10;
    nMonsterPowerRate              :10;
    nItemsPowerRate                :10;
    nItemsACPowerRate              :10;
    boSendOnlineCount              :True;
    nSendOnlineCountRate           :10;
    dwSendOnlineTime               :5 * 60 * 1000;
    dwSaveHumanRcdTime             :10 * 60 * 1000;
    dwHumanFreeDelayTime           :5 * 60 * 1000;
    dwMakeGhostTime                :3 * 60 * 1000;
    dwClearDropOnFloorItemTime     :60 * 60 * 1000;
    dwFloorItemCanPickUpTime       :2 * 60 * 1000;
    dwEatTick                      :400;
    boPasswordLockSystem           :False;
    boLockDealAction               :False;
    boLockDropAction               :False;
    boLockGetBackItemAction        :False;
    boLockHumanLogin               :False;
    boLockWalkAction               :False;
    boLockRunAction                :False;
    boLockHitAction                :False;
    boLockSpellAction              :False;
    boLockSendMsgAction            :False;
    boLockUserItemAction           :False;
    boLockInObModeAction           :False;
    nPasswordErrorCountLock        :3;
    nBonusPointHack                :3001;
    nMobGenCount                   :10;           //包府磊矫胶袍 函版
    boPasswordErrorKick            :False;
    nSendRefMsgRange               :12;
    boDecLampDura                  :True;

    boDiableHumanRun               :False;
    boRunHuman                     :False;
    boRunMon                       :False;
    boRunNpc                       :False;
    boRunGuard                     :False;
    boWarDisHumRun                 :False;
    boGMRunAll                     :True;

    dwTryRentalTime                :3000;    //措咯
    dwRentalOKTime                 :1000;    //措咯

    dwTryDealTime                  :3000;
    dwDealOKTime                   :1000;
    boCanNotGetBackDeal            :True;
    boDisableDeal                  :False;
    nMasterOKLevel                 :500;
    nMasterOKCreditPoint           :0;
    nMasterOKBonusPoint            :0;
    boPKLevelProtect               :False;
    nPKProtectLevel                :10;
    nLoverRecallTime               :10; //楷牢家券 掉饭捞
    nMasterLevel                   :34; //荤力 饭骇
    nRedPKProtectLevel             :10;
    nItemPowerRate                 :10000;
    nItemExpRate                   :10000;
    nScriptGotoCountLimit          :30;
    btHearMsgFColor                :$00;
    btHearMsgBColor                :$FF;
    btWhisperMsgFColor             :$FC;
    btWhisperMsgBColor             :$FF;
    btGMWhisperMsgFColor           :$FF;
    btGMWhisperMsgBColor           :$38;
    btCryMsgFColor                 :$0;
    btCryMsgBColor                 :$97;
    btGreenMsgFColor               :$DB;
    btGreenMsgBColor               :$FF;
    btBlueMsgFColor                :$FF;
    btBlueMsgBColor                :$FC;
    btRedMsgFColor                 :$FF;
    btRedMsgBColor                 :$38;
    btGuildMsgFColor               :$DB;
    btGuildMsgBColor               :$FF;
    btGroupMsgFColor               :$C4;
    btGroupMsgBColor               :$FF;
    btCustMsgFColor                :$FC;
    btCustMsgBColor                :$FF;
    btCustMsg1FColor               :$FF;
    btCustMsg1BColor               :$DB;
    btAllGuildMsgFColor            :20;
    btAllGuildMsgBColor            :255;
    nMonRandomAddValue             :10;
    nMakeRandomAddValue            :10;
    nWeaponDCAddValueMaxLimit      :12;
    nWeaponDCAddValueRate          :15;
    nWeaponMCAddValueMaxLimit      :12;
    nWeaponMCAddValueRate          :15;
    nWeaponSCAddValueMaxLimit      :12;
    nWeaponSCAddValueRate          :15;
    nDressDCAddRate                :40;
    nDressDCAddValueMaxLimit       :6;
    nDressDCAddValueRate           :20;
    nDressMCAddRate                :40;
    nDressMCAddValueMaxLimit       :6;
    nDressMCAddValueRate           :20;
    nDressSCAddRate                :40;
    nDressSCAddValueMaxLimit       :6;
    nDressSCAddValueRate           :20;
    nNeckLace202124DCAddRate                    :40;
    nNeckLace202124DCAddValueMaxLimit           :6;
    nNeckLace202124DCAddValueRate               :20;
    nNeckLace202124MCAddRate                    :40;
    nNeckLace202124MCAddValueMaxLimit           :6;
    nNeckLace202124MCAddValueRate               :20;
    nNeckLace202124SCAddRate                    :40;
    nNeckLace202124SCAddValueMaxLimit           :6;
    nNeckLace202124SCAddValueRate               :20;
    nNeckLace19DCAddRate                    :30;
    nNeckLace19DCAddValueMaxLimit           :6;
    nNeckLace19DCAddValueRate               :20;
    nNeckLace19MCAddRate                    :30;
    nNeckLace19MCAddValueMaxLimit           :6;
    nNeckLace19MCAddValueRate               :20;
    nNeckLace19SCAddRate                    :30;
    nNeckLace19SCAddValueMaxLimit           :6;
    nNeckLace19SCAddValueRate               :20;
    nArmRing26DCAddRate                    :30;
    nArmRing26DCAddValueMaxLimit           :6;
    nArmRing26DCAddValueRate               :20;
    nArmRing26MCAddRate                    :30;
    nArmRing26MCAddValueMaxLimit           :6;
    nArmRing26MCAddValueRate               :20;
    nArmRing26SCAddRate                    :30;
    nArmRing26SCAddValueMaxLimit           :6;
    nArmRing26SCAddValueRate               :20;
    nRing22DCAddRate                    :30;
    nRing22DCAddValueMaxLimit           :6;
    nRing22DCAddValueRate               :20;
    nRing22MCAddRate                    :30;
    nRing22MCAddValueMaxLimit           :6;
    nRing22MCAddValueRate               :20;
    nRing22SCAddRate                    :30;
    nRing22SCAddValueMaxLimit           :6;
    nRing22SCAddValueRate               :20;
    nRing23DCAddRate                    :30;
    nRing23DCAddValueMaxLimit           :6;
    nRing23DCAddValueRate               :20;
    nRing23MCAddRate                    :30;
    nRing23MCAddValueMaxLimit           :6;
    nRing23MCAddValueRate               :20;
    nRing23SCAddRate                    :30;
    nRing23SCAddValueMaxLimit           :6;
    nRing23SCAddValueRate               :20;
    nHelMetDCAddRate                    :30;
    nHelMetDCAddValueMaxLimit           :6;
    nHelMetDCAddValueRate               :20;
    nHelMetMCAddRate                    :30;
    nHelMetMCAddValueMaxLimit           :6;
    nHelMetMCAddValueRate               :20;
    nHelMetSCAddRate                    :30;
    nHelMetSCAddValueMaxLimit           :6;
    nHelMetSCAddValueRate               :20;
    //固瘤捧备 规绢
    nUnknowHelMetACAddValueMin1Limit    :12;
    nUnknowHelMetACAddValueMax1Limit    :13;
    nUnknowHelMetACAddValueMin2Limit    :9;
    nUnknowHelMetACAddValueMax2Limit    :10;
    //固瘤捧备 付亲
    nUnknowHelMetMACAddValueMinLimit    :9;
    nUnknowHelMetMACAddValueMaxLimit    :10;

    nUnknowHelMetDCAddValueMinLimit     :6;
    nUnknowHelMetDCAddValueMaxLimit     :7;
    nUnknowHelMetMCAddValueMinLimit     :6;
    nUnknowHelMetMCAddValueMaxLimit     :7;
    nUnknowHelMetSCAddValueMinLimit     :6;
    nUnknowHelMetSCAddValueMaxLimit     :7;

    nUnknowRingDCAddValueMinLimit       :12;
    nUnknowRingDCAddValueMaxLimit       :13;
    nUnknowRingMCAddValueMinLimit       :12;
    nUnknowRingMCAddValueMaxLimit       :13;
    nUnknowRingSCAddValueMinLimit       :12;
    nUnknowRingSCAddValueMaxLimit       :13;

    nUnknowNecklaceACAddValueMinLimit   :12;
    nUnknowNecklaceACAddValueMaxLimit   :13;
    nUnknowNecklaceMACAddValueMinLimit  :9;
    nUnknowNecklaceMACAddValueMaxLimit  :10;
    nUnknowNecklaceDCAddValueMinLimit   :6;
    nUnknowNecklaceDCAddValueMaxLimit   :7;
    nUnknowNecklaceMCAddValueMinLimit   :6;
    nUnknowNecklaceMCAddValueMaxLimit   :7;
    nUnknowNecklaceSCAddValueMinLimit   :6;
    nUnknowNecklaceSCAddValueMaxLimit   :7;


    nMonOneDropGoldCount                :2000;
    nMakeMineHitRate                    :4;
    nMakeMineRate                       :12;
    nStoneTypeRate                      :120;
    nStoneTypeRateMin                   :56;
    nGoldStoneMin                       :1;
    nGoldStoneMax                       :2;
    nSilverStoneMin                     :3;
    nSilverStoneMax                     :20;
    nSteelStoneMin                      :21;
    nSteelStoneMax                      :45;
    nBlackStoneMin                      :46;
    nBlackStoneMax                      :56;
    nStoneMinDura                       :3000;
    nStoneGeneralDuraRate               :13000;
    nStoneAddDuraRate                   :20;
    nStoneAddDuraMax                    :10000;
    nWinLottery6Min                     :1;
    nWinLottery6Max                     :4999;
    nWinLottery5Min                     :14000;
    nWinLottery5Max                     :15999;
    nWinLottery4Min                     :16000;
    nWinLottery4Max                     :16149;
    nWinLottery3Min                     :16150;
    nWinLottery3Max                     :16169;
    nWinLottery2Min                     :16170;
    nWinLottery2Max                     :16179;
    nWinLottery1Min                     :16180;
    nWinLottery1Max                     :16185;//16180 + 1820;
    nWinLottery1Gold                    :1000000;
    nWinLottery2Gold                    :200000;
    nWinLottery3Gold                    :100000;
    nWinLottery4Gold                    :10000;
    nWinLottery5Gold                    :1000;
    nWinLottery6Gold                    :500;
    nWinLotteryRate                     :30000;
    nWinLotteryCount                    :0;
    nNoWinLotteryCount                  :0;
    nWinLotteryLevel1                   :0;
    nWinLotteryLevel2                   :0;
    nWinLotteryLevel3                   :0;
    nWinLotteryLevel4                   :0;
    nWinLotteryLevel5                   :0;
    nWinLotteryLevel6                   :0;

    nMagMassPoisonDelay                 :4;  //刀公 掉饭捞


    GlobalVal                           :(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
    nItemNumber                         :0;
    nItemNumberEx                       :High(Integer) div 2;
    nGuildRecallTime                    :180;
    nGroupRecallTime                    :180;
    boControlDropItem                   :False;
    boInSafeDisableDrop                 :False;
    nCanDropGold                        :1000;
    nCanDropPrice                       :500;
    boSendCustemMsg                     :True;
    boSubkMasterSendMsg                 :True;
    nSuperRepairPriceRate               :3;
    nRepairItemDecDura                  :30;
    boDieScatterBag                     :True;
    nDieScatterBagRate                  :3;
    boDieRedScatterBagAll               :True;
    Reserved64dell                      :False;
    nDieDropUseItemRate                 :30;
    nDieRedDropUseItemRate              :15;
    boDieDropGold                       :False;
    boKillByHumanDropUseItem            :True;
    boKillByMonstDropUseItem            :True;
    boKickExpireHuman                   :False;
    nGuildRankNameLen                   :16;
    nGuildMemberMaxLimit                :200;
    nGuildNameLen                       :16;
    nAttackPosionRate                   :5;
    nAttackPosionTime                   :5;
    dwRevivalTime                       :60 * 1000;
    boUserMoveCanDupObj                 :False;
    boUserMoveCanOnItem                 :True;
    dwUserMoveTime                      :10;
    dwPKDieLostExpRate                  :1000;
    nPKDieLostLevelRate                 :20000;
    btPKFlagNameColor                   :47;
    btPKLevel1NameColor                 :251;
    btPKLevel2NameColor                 :249;
    btAllyAndGuildNameColor             :180;
    btWarGuildNameColor                 :69;
    btCatleGuildNameColor               :154; //荤合巩 捞抚祸
    btNamCatleGuildNameColor            :154; //巢父巩 捞抚祸
    btKingCatleGuildNameColor           :154; //沥汗磊
    btCatleWarGuildNameColor            :58;
    btInFreePKAreaNameColor             :221;
    boSpiritMutiny                      :False;
    dwSpiritMutinyTime                  :30 * 60 * 1000;
    nSpiritPowerRate                    :2;
    boMasterDieMutiny                   :False;
    nMasterDieMutinyRate                :5;
    nMasterDieMutinyPower               :10;
    nMasterDieMutinySpeed               :5;
    boOldClientShowHiLevel              :True;
    boShowScriptActionMsg               :True;
    nRunSocketDieLoopLimit              :100;
    boThreadRun                         :False;
    boShowExceptionMsg                  :False;
    boShowPreFixMsg                     :False;
    nMagicAttackRage                    :8;
    sSkeleton                           :'变异骷髅';
    sJinSkeleton                        :'圣骷髅';
    nSkeletonCount                      :1;

//    g_Config.BoneFammArray                       :array[0..9] of TRecallMigic;
    sDragon                             :'神兽';
    sDragon1                            :'神兽1';
    nDragonCount                        :1;
//    g_Config.DogzArray                           :array[0..9] of TRecallMigic;
    sAngel                              :'月灵';
    sDarkAngel                          :'魂灵';
    sGuard45                            :'神武警卫兵';
    sGuard50                            :'偏将警卫兵';
    sGuard55                            :'猛虎警卫兵';
    sGuard60                            :'天龙警卫兵';
    sArcher45                           :'神武护卫左使';
    sArcher50                           :'偏将护卫左使';
    sArcher55                           :'猛虎护卫左使';
    sArcher60                           :'天龙护卫左使';
    sClone                              :'Clone';
    sCloneAssassin                      :'刺客分身';
    sBonzeClone                         :'骷髅分身';
    sBonzeMob                           :'碍龋';
    nAmyOunsulPoint                     :10;

    boDisableInSafeZoneFireCross        :False;
    boGroupMbAttackPlayObject           :False;

    dwPosionDecHealthTime               :2500;
    nPosionDamagarmor                   :12;
    boLimitSwordLong                    :False;
    nSwordLongPowerRate                 :100;
    nFireBoomRage                       :1;
    nSnowWindRange                      :1;
    ConsigitemIdx                       :5;
    ComStorageIdx                       :8;
    PetLimitIdx                         :5;
    GuildStorageIdx                     :30;
    GiftitemIdx                         :10;  //急拱罐扁 力茄
    nElecBlizzardRange                  :2;
    nLightFlowerStruckLevel             :70;   //汾汲拳
    nMagTurnUndeadLevel                 :70;
    nMagTammingLevel                    :70;
    nMagTammingTargetLevel              :10;
    nMagTammingHPRate                   :100;
    nMagTammingCount                    :5;
    nMabMabeHitRandRate                 :100;
    nMabMabeHitMinLvLimit               :10;
    nMabMabeHitSucessRate               :21;
    nMabMabeHitMabeTimeRate             :20;
    
    sSabukCastleName                    :'沙巴克';
    sSabukCastleHomeMap                 :'SABUK_CASTLE1';
    nSabukCastleHomeX                   :207;
    nSabukCastleHomeY                   :153;

    sNammanCastleName                   :'南满';
    sNammanCastleHomeMap                :'NAMMAN_CASTLE';
    nNammanCastleHomeX                  :259;
    nNammanCastleHomeY                  :100;

    nCastleTaxRate                      :5;
    boGetAllNpcTax                      :False;
    nHireGuardPrice                     :300000;
    nHireArcherPrice                    :300000;
    nCastleGoldMax                      :10000000;
    nCastleOneDayGold                   :2000000;
    nRepairDoorPrice                    :2000000;
    nRepairWallPrice                    :500000;
    nCastleMemberPriceRate              :80;
    sGTHomeMap                          :'GA0';
    nGTHomeX                            :119;
    nGTHomeY                            :122;
    sGTCallMap                          :'GA1';
    sGTCallMap2                         :'GA2';
    sGTCallMap3                         :'GA3';
    nGTCallX                            :21;
    nGTCallY                            :32;
    nGTExtendFee                        :1000000;
    nGTBuyFee                           :10000000;
    nGTNumberOfPeople                   :20;
    sGTDeco                             :'梦想囊';
    nMaxHitMsgCount                     :2;
    nMaxSpellMsgCount                   :2;
    nMaxRunMsgCount                     :2;
    nMaxWalkMsgCount                    :1;
    nMaxTurnMsgCount                    :1;
    nMaxDigUpMsgCount                   :1;
    boSpellSendUpdateMsg                :True;
    boActionSendActionMsg               :True;
    boKickOverSpeed                     :False;
    btSpeedControlMode                  :0;
    nOverSpeedKickCount                 :10;
    dwDropOverSpeed                     :10;

    dwRunIntervalTime                   :500;
    dwWalkIntervalTime                  :600;
    dwTurnIntervalTime                  :600;

    boDisableStruck                     :False;
    boDisableSelfStruck                 :False;
    dwStruckTime                        :100;
    dwKillMonExpMultiple                :1;

    boHighLevelKillMonFixExp            :False;
    boAddUserItemNewValue               :True;
    sLineNoticePreFix                   :'[!]';
    sSysMsgPreFix                       :'[*]';
    sGuildMsgPreFix                     :'[行会]';
    sGroupMsgPreFix                     :'[编组]';
    sHintMsgPreFix                      :'[Hint]';
    sGMRedMsgpreFix                     :'[管理]';
    sMonSayMsgpreFix                    :'[怪物]';
    sCustMsgpreFix                      :'[*]';
    sCastleMsgpreFix                    :'[l^l^l]';
    sGuildNotice                        :'行会公告e';
    sGuildWar                           :'敌对行会';
    sGuildAll                           :'联盟行会';
    sGuildMember                        :'行会成员';
    sGuildMemberRank                    :'行会成员';
    sGuildChief                         :'行会掌门';
    boKickAllUser                       :False;
    boTestSpeedMode                     :False;
    ClientConf                          :(
                                          boClientCanSet    :True;
                                          boRunHuman        :False;
                                          boRunMon          :False;
                                          boRunNpc          :False;
                                          boWarRunAll       :False;
                                          btDieColor        :0;
                                          wSpellTime        :500;
                                          wHitIime          :1400;
                                          wItemFlashTime    :5 * 100;
                                          btItemSpeed       :25;
                                          boCanStartRun     :False;  //龙林?
                                          boParalyCanRun    :False;
                                          boParalyCanWalk   :False;
                                          boParalyCanHit    :False;
                                          boParalyCanSpell  :False;
                                          boShowJobLevel    :True;
                                          boDuraAlert       :False;
                                          boMagicLock       :False;
                                          boAutoPuckUpItem  :False;
                                         );
    nWeaponMakeUnLuckRate               :20;
    nWeaponMakeLuckPoint1               :1;
    nWeaponMakeLuckPoint2               :3;
    nWeaponMakeLuckPoint3               :7;
    nWeaponMakeLuckPoint2Rate           :6;
    nWeaponMakeLuckPoint3Rate           :10 + 30;
    boCheckUserItemPlace                :True;
    SafeAreaHint                        :1;

{$IF DEMOCLIENT = 1}
    nClientKey                          :6534;
{$ELSE}
    nClientKey                          :500;
{$IFEND}
    nLevelValueOfTaosHP                 :6;
    nLevelValueOfTaosHPRate             :2.5;
    nLevelValueOfTaosMP                 :8;
    nLevelValueOfWizardHP               :15;
    nLevelValueOfWizardHPRate           :1.8;
    nLevelValueOfWarrHP                 :4;
    nLevelValueOfWarrHPRate             :4.5;       //臭栏搁 利霸 坷福绰..
    nLevelValueOfAssassinHP             :3;         //磊按 乔 惑铰 厚啦
    nLevelValueOfAssassinHPRate         :4.6;
    nLevelValueOfAssassinMP             :8;
    nProcessMonsterInterval             :2;
    nExpRate                            :1; //版氰摹
    nExChangeGameGoldRate               :0.005; //券傈 厚啦 (陛傈 - 剐券)
    nExChangeGoldRate                   :200;  //券傈 厚啦 (剐券 - 陛傈)

    boSafeCanStore: True;          //救傈 俺牢惑痢
    boOpenStoreGMMode: True;        //俺牢惑痢吝 傍拜 寸窍唱 汲沥
    boOpenStoreCheckLevel: True;   //俺牢惑痢 饭骇 力茄 荤侩
    nOpenStoreCheckLevel: 50;     //俺牢惑痢 饭骇 力茄

    nAllowGameGoldLevel: 50;    //券面傈 饭骇 力茄
    nAllowPCPointLevel : 50;


    //弊缝 版氰摹 汲沥过
    nGroupExpRate                       :(1, 1, 1.9, 2.7, 3.4, 4.5, 4.9, 5.2, 5.4, 5.5, 5.5, 5.4, 5.5, 5.6);

    nGroupBuffHp                        :50;
    nGroupBuffRecHp                     :25;
    nGroupBuffExp                       :10;
    nGroupBuffPo                        :10;

    nDBSocketSendLen                    :0;
    sTestGAPassword                     :'';
    boUseSQL                            :False;
    SQLHost                             :'127.0.0.1';
    SQLPort                             :3306;
    SQLUsername                         :'sa';
    SQLPassword                         :'password';
    SQLDatabase                         :'mir2';
    SQLType                             :'mssql';

    PosFile                             :'.\Positions.ini';
    boDropGoldToPlayBag                 :True;
    //咯扁辑何磐 康旷
    btHeroNameColor                     :240;
    nRecallHeroTime                     :30;
    sRecallHeroHint                     :'召唤英雄/收回英雄 %d秒以后才可以再次召唤英雄。';
    HeroBagItemCounts                   :(0, 10, 20, 30, 40, 50);
    nHeroStartLevel                     :1;

    dwHeroWarrorAttackTime: 900;
    dwHeroWizardAttackTime: 900;
    dwHeroTaoistAttackTime: 900;
    dwHeroAssassinAttackTime: 900;
    dwHeroItemAttackTime: 20;

    dwHeroWalkTime :600;
    boHeroKillByMonstDropUseItem: True;
    boHeroKillByHumanDropUseItem: True;
    boHeroDieScatterBag: True;
    nHeroDieDropUseItemRate: 30;
    nHeroDieScatterBagRate: 10;
  );
//===============================================================

  g_sADODBString       :String = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=.\Envir\Data.mdb;Persist Security Info=False';  //ADO Connection string


{$IF OEMVER = OEM775}
  g_LevelInfo          :array[0..MAXLEVEL] of TLevelInfo;
{$IFEND}

  g_dwOldNeedGuldExps:TLevelNeedGuildExp = (    //巩颇己厘 版氰摹
        100, //1
        200, //2
        300, //3
        400, //4
        600, //5
        900, //6
        1200, //7
        1700, //8
        2500, //9
        6000, //10
        8000, //11
        10000, //12
        15000, //13
        30000, //14
        40000, //15
        50000, //16
        70000, //17
        100000, //18
        120000, //19
        140000, //20
        250000, //21
        300000, //22
        350000, //23
        400000, //24
        500000, //25
        700000, //26
        1000000, //27
        1400000, //28
        1800000, //29
        2000000, //30
        2400000, //31
        2800000, //32
        3200000, //33
        3600000, //34
        4000000); //35

  g_dwOldNeedExps:TLevelNeedExp = (
        100, //1
        200, //2
        300, //3
        400, //4
        600, //5
        900, //6
        1200, //7
        1700, //8
        2500, //9
        6000, //10
        8000, //11
        10000, //12
        15000, //13
        30000, //14
        40000, //15
        50000, //16
        70000, //17
        100000, //18
        120000, //19
        140000, //20
        250000, //21
        300000, //22
        350000, //23
        400000, //24
        500000, //25
        700000, //26
        1000000, //27
        1400000, //28
        1800000, //29
        2000000, //30
        2400000, //31
        2800000, //32
        3200000, //33
        3600000, //34
        4000000, //35
        4800000, //36
        5600000, //37
        8200000, //38
        9000000, //39
        12000000, //40
        16000000, //41
        30000000, //42
        50000000, //43
        80000000, //44
        120000000, //45
        480000000, //46
        1000000000, //47
        3000000000, //48
        3500000000, //49
        4000000000, //50
        4000000000, //51
        4000000000, //52
        4000000000, //53
        4000000000, //54
        4000000000, //55
        4000000000, //56
        4000000000, //57
        4000000000, //58
        4000000000, //59
        4000000000, //60
        4000000000, //61
        4000000000, //62
        4000000000, //63
        4000000000, //64
        4000000000, //65
        4000000000, //66
        4000000000, //67
        4000000000, //68
        4000000000, //69
        4000000000, //70
        4000000000, //71
        4000000000, //72
        4000000000, //73
        4000000000, //74
        4000000000, //75
        4000000000, //76
        4000000000, //77
        4000000000, //78
        4000000000, //79
        4000000000, //80
        4000000000, //81
        4000000000, //82
        4000000000, //83
        4000000000, //84
        4000000000, //85
        4000000000, //86
        4000000000, //87
        4000000000, //88
        4000000000, //89
        4000000000, //90
        4000000000, //91
        4000000000, //92
        4000000000, //93
        4000000000, //94
        4000000000, //95
        4000000000, //96
        4000000000, //97
        4000000000, //98
        4000000000, //99
        4000000000, //100
        4000000000, //101
        4000000000, //102
        4000000000, //103
        4000000000, //104
        4000000000, //105
        4000000000, //106
        4000000000, //107
        4000000000, //108
        4000000000, //109
        4000000000, //110
        4000000000, //111
        4000000000, //112
        4000000000, //113
        4000000000, //114
        4000000000, //115
        4000000000, //116
        4000000000, //117
        4000000000, //118
        4000000000, //119
        4000000000, //120
        4000000000, //121
        4000000000, //122
        4000000000, //123
        4000000000, //124
        4000000000, //125
        4000000000, //126
        4000000000, //127
        4000000000, //128
        4000000000, //129
        4000000000, //130
        4000000000, //131
        4000000000, //132
        4000000000, //133
        4000000000, //134
        4000000000, //135
        4000000000, //136
        4000000000, //137
        4000000000, //138
        4000000000, //139
        4000000000, //140
        4000000000, //141
        4000000000, //142
        4000000000, //143
        4000000000, //144
        4000000000, //145
        4000000000, //146
        4000000000, //147
        4000000000, //148
        4000000000, //149
        4000000000, //150
        4000000000, //151
        4000000000, //152
        4000000000, //153
        4000000000, //154
        4000000000, //155
        4000000000, //156
        4000000000, //157
        4000000000, //158
        4000000000, //159
        4000000000, //160
        4000000000, //161
        4000000000, //162
        4000000000, //163
        4000000000, //164
        4000000000, //165
        4000000000, //166
        4000000000, //167
        4000000000, //168
        4000000000, //169
        4000000000, //170
        4000000000, //171
        4000000000, //172
        4000000000, //173
        4000000000, //174
        4000000000, //175
        4000000000, //176
        4000000000, //177
        4000000000, //178
        4000000000, //179
        4000000000, //180
        4000000000, //181
        4000000000, //182
        4000000000, //183
        4000000000, //184
        4000000000, //185
        4000000000, //186
        4000000000, //187
        4000000000, //188
        4000000000, //189
        4000000000, //190
        4000000000, //191
        4000000000, //192
        4000000000, //193
        4000000000, //194
        4000000000, //195
        4000000000, //196
        4000000000, //197
        4000000000, //198
        4000000000, //199
        4000000000, //200
        4000000000, //201
        4000000000, //202
        4000000000, //203
        4000000000, //204
        4000000000, //205
        4000000000, //206
        4000000000, //207
        4000000000, //208
        4000000000, //209
        4000000000, //210
        4000000000, //211
        4000000000, //212
        4000000000, //213
        4000000000, //214
        4000000000, //215
        4000000000, //216
        4000000000, //217
        4000000000, //218
        4000000000, //219
        4000000000, //220
        4000000000, //221
        4000000000, //222
        4000000000, //223
        4000000000, //224
        4000000000, //225
        4000000000, //226
        4000000000, //227
        4000000000, //228
        4000000000, //229
        4000000000, //230
        4000000000, //231
        4000000000, //232
        4000000000, //233
        4000000000, //234
        4000000000, //235
        4000000000, //236
        4000000000, //237
        4000000000, //238
        4000000000, //239
        4000000000, //240
        4000000000, //241
        4000000000, //242
        4000000000, //243
        4000000000, //244
        4000000000, //245
        4000000000, //246
        4000000000, //247
        4000000000, //248
        4000000000, //249
        4000000000, //250
        4000000000, //251
        4000000000, //252
        4000000000, //253
        4000000000, //254
        4000000000, //255
        4000000000, //256
        4000000000, //257
        4000000000, //258
        4000000000, //259
        4000000000, //260
        4000000000, //261
        4000000000, //262
        4000000000, //263
        4000000000, //264
        4000000000, //265
        4000000000, //266
        4000000000, //267
        4000000000, //268
        4000000000, //269
        4000000000, //270
        4000000000, //271
        4000000000, //272
        4000000000, //273
        4000000000, //274
        4000000000, //275
        4000000000, //276
        4000000000, //277
        4000000000, //278
        4000000000, //279
        4000000000, //280
        4000000000, //281
        4000000000, //282
        4000000000, //283
        4000000000, //284
        4000000000, //285
        4000000000, //286
        4000000000, //287
        4000000000, //288
        4000000000, //289
        4000000000, //290
        4000000000, //291
        4000000000, //292
        4000000000, //293
        4000000000, //294
        4000000000, //295
        4000000000, //296
        4000000000, //297
        4000000000, //298
        4000000000, //299
        4000000000, //300
        4000000000, //301
        4000000000, //302
        4000000000, //303
        4000000000, //304
        4000000000, //305
        4000000000, //306
        4000000000, //307
        4000000000, //308
        4000000000, //309
        4000000000, //310
        4000000000, //311
        4000000000, //312
        4000000000, //313
        4000000000, //314
        4000000000, //315
        4000000000, //316
        4000000000, //317
        4000000000, //318
        4000000000, //319
        4000000000, //320
        4000000000, //321
        4000000000, //322
        4000000000, //323
        4000000000, //324
        4000000000, //325
        4000000000, //326
        4000000000, //327
        4000000000, //328
        4000000000, //329
        4000000000, //330
        4000000000, //331
        4000000000, //332
        4000000000, //333
        4000000000, //334
        4000000000, //335
        4000000000, //336
        4000000000, //337
        4000000000, //338
        4000000000, //339
        4000000000, //340
        4000000000, //341
        4000000000, //342
        4000000000, //343
        4000000000, //344
        4000000000, //345
        4000000000, //346
        4000000000, //347
        4000000000, //348
        4000000000, //349
        4000000000, //350
        4000000000, //351
        4000000000, //352
        4000000000, //353
        4000000000, //354
        4000000000, //355
        4000000000, //356
        4000000000, //357
        4000000000, //358
        4000000000, //359
        4000000000, //360
        4000000000, //361
        4000000000, //362
        4000000000, //363
        4000000000, //364
        4000000000, //365
        4000000000, //366
        4000000000, //367
        4000000000, //368
        4000000000, //369
        4000000000, //370
        4000000000, //371
        4000000000, //372
        4000000000, //373
        4000000000, //374
        4000000000, //375
        4000000000, //376
        4000000000, //377
        4000000000, //378
        4000000000, //379
        4000000000, //380
        4000000000, //381
        4000000000, //382
        4000000000, //383
        4000000000, //384
        4000000000, //385
        4000000000, //386
        4000000000, //387
        4000000000, //388
        4000000000, //389
        4000000000, //390
        4000000000, //391
        4000000000, //392
        4000000000, //393
        4000000000, //394
        4000000000, //395
        4000000000, //396
        4000000000, //397
        4000000000, //398
        4000000000, //399
        4000000000, //400
        4000000000, //401
        4000000000, //402
        4000000000, //403
        4000000000, //404
        4000000000, //405
        4000000000, //406
        4000000000, //407
        4000000000, //408
        4000000000, //409
        4000000000, //410
        4000000000, //411
        4000000000, //412
        4000000000, //413
        4000000000, //414
        4000000000, //415
        4000000000, //416
        4000000000, //417
        4000000000, //418
        4000000000, //419
        4000000000, //420
        4000000000, //421
        4000000000, //422
        4000000000, //423
        4000000000, //424
        4000000000, //425
        4000000000, //426
        4000000000, //427
        4000000000, //428
        4000000000, //429
        4000000000, //430
        4000000000, //431
        4000000000, //432
        4000000000, //433
        4000000000, //434
        4000000000, //435
        4000000000, //436
        4000000000, //437
        4000000000, //438
        4000000000, //439
        4000000000, //440
        4000000000, //441
        4000000000, //442
        4000000000, //443
        4000000000, //444
        4000000000, //445
        4000000000, //446
        4000000000, //447
        4000000000, //448
        4000000000, //449
        4000000000, //450
        4000000000, //451
        4000000000, //452
        4000000000, //453
        4000000000, //454
        4000000000, //455
        4000000000, //456
        4000000000, //457
        4000000000, //458
        4000000000, //459
        4000000000, //460
        4000000000, //461
        4000000000, //462
        4000000000, //463
        4000000000, //464
        4000000000, //465
        4000000000, //466
        4000000000, //467
        4000000000, //468
        4000000000, //469
        4000000000, //470
        4000000000, //471
        4000000000, //472
        4000000000, //473
        4000000000, //474
        4000000000, //475
        4000000000, //476
        4000000000, //477
        4000000000, //478
        4000000000, //479
        4000000000, //480
        4000000000, //481
        4000000000, //482
        4000000000, //483
        4000000000, //484
        4000000000, //485
        4000000000, //486
        4000000000, //487
        4000000000, //488
        4000000000, //489
        4000000000, //490
        4000000000, //491
        4000000000, //492
        4000000000, //493
        4000000000, //494
        4000000000, //495
        4000000000, //496
        4000000000, //497
        4000000000, //498
        4000000000, //499
        4000000000 //500
        );
   g_dwHeroNeedExps: TLevelNeedExp = (
    100, //1
    200, //2
    300, //3
    400, //4
    600, //5
    900, //6
    1200, //7
    1700, //8
    2500, //9
    6000, //10
    8000, //11
    10000, //12
    15000, //13
    30000, //14
    40000, //15
    50000, //16
    70000, //17
    100000, //18
    120000, //19
    140000, //20
    250000, //21
    300000, //22
    350000, //23
    400000, //24
    500000, //25
    700000, //26
    1000000, //27
    1400000, //28
    1800000, //29
    2000000, //30
    2400000, //31
    2800000, //32
    3200000, //33
    3600000, //34
    4000000, //35
    4800000, //36
    5600000, //37
    8200000, //38
    9000000, //39
    12000000, //40
    16000000, //41
    30000000, //42
    50000000, //43
    80000000, //44
    120000000, //45
    480000000, //46
    1000000000, //47
    3000000000, //48
    3500000000, //49
    4000000000, //50
    4000000000, //51
    4000000000, //52
    4000000000, //53
    4000000000, //54
    4000000000, //55
    4000000000, //56
    4000000000, //57
    4000000000, //58
    4000000000, //59
    4000000000, //60
    4000000000, //61
    4000000000, //62
    4000000000, //63
    4000000000, //64
    4000000000, //65
    4000000000, //66
    4000000000, //67
    4000000000, //68
    4000000000, //69
    4000000000, //70
    4000000000, //71
    4000000000, //72
    4000000000, //73
    4000000000, //74
    4000000000, //75
    4000000000, //76
    4000000000, //77
    4000000000, //78
    4000000000, //79
    4000000000, //80
    4000000000, //81
    4000000000, //82
    4000000000, //83
    4000000000, //84
    4000000000, //85
    4000000000, //86
    4000000000, //87
    4000000000, //88
    4000000000, //89
    4000000000, //90
    4000000000, //91
    4000000000, //92
    4000000000, //93
    4000000000, //94
    4000000000, //95
    4000000000, //96
    4000000000, //97
    4000000000, //98
    4000000000, //99
    4000000000, //100
    4000000000, //101
    4000000000, //102
    4000000000, //103
    4000000000, //104
    4000000000, //105
    4000000000, //106
    4000000000, //107
    4000000000, //108
    4000000000, //109
    4000000000, //110
    4000000000, //111
    4000000000, //112
    4000000000, //113
    4000000000, //114
    4000000000, //115
    4000000000, //116
    4000000000, //117
    4000000000, //118
    4000000000, //119
    4000000000, //120
    4000000000, //121
    4000000000, //122
    4000000000, //123
    4000000000, //124
    4000000000, //125
    4000000000, //126
    4000000000, //127
    4000000000, //128
    4000000000, //129
    4000000000, //130
    4000000000, //131
    4000000000, //132
    4000000000, //133
    4000000000, //134
    4000000000, //135
    4000000000, //136
    4000000000, //137
    4000000000, //138
    4000000000, //139
    4000000000, //140
    4000000000, //141
    4000000000, //142
    4000000000, //143
    4000000000, //144
    4000000000, //145
    4000000000, //146
    4000000000, //147
    4000000000, //148
    4000000000, //149
    4000000000, //150
    4000000000, //151
    4000000000, //152
    4000000000, //153
    4000000000, //154
    4000000000, //155
    4000000000, //156
    4000000000, //157
    4000000000, //158
    4000000000, //159
    4000000000, //160
    4000000000, //161
    4000000000, //162
    4000000000, //163
    4000000000, //164
    4000000000, //165
    4000000000, //166
    4000000000, //167
    4000000000, //168
    4000000000, //169
    4000000000, //170
    4000000000, //171
    4000000000, //172
    4000000000, //173
    4000000000, //174
    4000000000, //175
    4000000000, //176
    4000000000, //177
    4000000000, //178
    4000000000, //179
    4000000000, //180
    4000000000, //181
    4000000000, //182
    4000000000, //183
    4000000000, //184
    4000000000, //185
    4000000000, //186
    4000000000, //187
    4000000000, //188
    4000000000, //189
    4000000000, //190
    4000000000, //191
    4000000000, //192
    4000000000, //193
    4000000000, //194
    4000000000, //195
    4000000000, //196
    4000000000, //197
    4000000000, //198
    4000000000, //199
    4000000000, //200
    4000000000, //201
    4000000000, //202
    4000000000, //203
    4000000000, //204
    4000000000, //205
    4000000000, //206
    4000000000, //207
    4000000000, //208
    4000000000, //209
    4000000000, //210
    4000000000, //211
    4000000000, //212
    4000000000, //213
    4000000000, //214
    4000000000, //215
    4000000000, //216
    4000000000, //217
    4000000000, //218
    4000000000, //219
    4000000000, //220
    4000000000, //221
    4000000000, //222
    4000000000, //223
    4000000000, //224
    4000000000, //225
    4000000000, //226
    4000000000, //227
    4000000000, //228
    4000000000, //229
    4000000000, //230
    4000000000, //231
    4000000000, //232
    4000000000, //233
    4000000000, //234
    4000000000, //235
    4000000000, //236
    4000000000, //237
    4000000000, //238
    4000000000, //239
    4000000000, //240
    4000000000, //241
    4000000000, //242
    4000000000, //243
    4000000000, //244
    4000000000, //245
    4000000000, //246
    4000000000, //247
    4000000000, //248
    4000000000, //249
    4000000000, //250
    4000000000, //251
    4000000000, //252
    4000000000, //253
    4000000000, //254
    4000000000, //255
    4000000000, //256
    4000000000, //257
    4000000000, //258
    4000000000, //259
    4000000000, //260
    4000000000, //261
    4000000000, //262
    4000000000, //263
    4000000000, //264
    4000000000, //265
    4000000000, //266
    4000000000, //267
    4000000000, //268
    4000000000, //269
    4000000000, //270
    4000000000, //271
    4000000000, //272
    4000000000, //273
    4000000000, //274
    4000000000, //275
    4000000000, //276
    4000000000, //277
    4000000000, //278
    4000000000, //279
    4000000000, //280
    4000000000, //281
    4000000000, //282
    4000000000, //283
    4000000000, //284
    4000000000, //285
    4000000000, //286
    4000000000, //287
    4000000000, //288
    4000000000, //289
    4000000000, //290
    4000000000, //291
    4000000000, //292
    4000000000, //293
    4000000000, //294
    4000000000, //295
    4000000000, //296
    4000000000, //297
    4000000000, //298
    4000000000, //299
    4000000000, //300
    4000000000, //301
    4000000000, //302
    4000000000, //303
    4000000000, //304
    4000000000, //305
    4000000000, //306
    4000000000, //307
    4000000000, //308
    4000000000, //309
    4000000000, //310
    4000000000, //311
    4000000000, //312
    4000000000, //313
    4000000000, //314
    4000000000, //315
    4000000000, //316
    4000000000, //317
    4000000000, //318
    4000000000, //319
    4000000000, //320
    4000000000, //321
    4000000000, //322
    4000000000, //323
    4000000000, //324
    4000000000, //325
    4000000000, //326
    4000000000, //327
    4000000000, //328
    4000000000, //329
    4000000000, //330
    4000000000, //331
    4000000000, //332
    4000000000, //333
    4000000000, //334
    4000000000, //335
    4000000000, //336
    4000000000, //337
    4000000000, //338
    4000000000, //339
    4000000000, //340
    4000000000, //341
    4000000000, //342
    4000000000, //343
    4000000000, //344
    4000000000, //345
    4000000000, //346
    4000000000, //347
    4000000000, //348
    4000000000, //349
    4000000000, //350
    4000000000, //351
    4000000000, //352
    4000000000, //353
    4000000000, //354
    4000000000, //355
    4000000000, //356
    4000000000, //357
    4000000000, //358
    4000000000, //359
    4000000000, //360
    4000000000, //361
    4000000000, //362
    4000000000, //363
    4000000000, //364
    4000000000, //365
    4000000000, //366
    4000000000, //367
    4000000000, //368
    4000000000, //369
    4000000000, //370
    4000000000, //371
    4000000000, //372
    4000000000, //373
    4000000000, //374
    4000000000, //375
    4000000000, //376
    4000000000, //377
    4000000000, //378
    4000000000, //379
    4000000000, //380
    4000000000, //381
    4000000000, //382
    4000000000, //383
    4000000000, //384
    4000000000, //385
    4000000000, //386
    4000000000, //387
    4000000000, //388
    4000000000, //389
    4000000000, //390
    4000000000, //391
    4000000000, //392
    4000000000, //393
    4000000000, //394
    4000000000, //395
    4000000000, //396
    4000000000, //397
    4000000000, //398
    4000000000, //399
    4000000000, //400
    4000000000, //401
    4000000000, //402
    4000000000, //403
    4000000000, //404
    4000000000, //405
    4000000000, //406
    4000000000, //407
    4000000000, //408
    4000000000, //409
    4000000000, //410
    4000000000, //411
    4000000000, //412
    4000000000, //413
    4000000000, //414
    4000000000, //415
    4000000000, //416
    4000000000, //417
    4000000000, //418
    4000000000, //419
    4000000000, //420
    4000000000, //421
    4000000000, //422
    4000000000, //423
    4000000000, //424
    4000000000, //425
    4000000000, //426
    4000000000, //427
    4000000000, //428
    4000000000, //429
    4000000000, //430
    4000000000, //431
    4000000000, //432
    4000000000, //433
    4000000000, //434
    4000000000, //435
    4000000000, //436
    4000000000, //437
    4000000000, //438
    4000000000, //439
    4000000000, //440
    4000000000, //441
    4000000000, //442
    4000000000, //443
    4000000000, //444
    4000000000, //445
    4000000000, //446
    4000000000, //447
    4000000000, //448
    4000000000, //449
    4000000000, //450
    4000000000, //451
    4000000000, //452
    4000000000, //453
    4000000000, //454
    4000000000, //455
    4000000000, //456
    4000000000, //457
    4000000000, //458
    4000000000, //459
    4000000000, //460
    4000000000, //461
    4000000000, //462
    4000000000, //463
    4000000000, //464
    4000000000, //465
    4000000000, //466
    4000000000, //467
    4000000000, //468
    4000000000, //469
    4000000000, //470
    4000000000, //471
    4000000000, //472
    4000000000, //473
    4000000000, //474
    4000000000, //475
    4000000000, //476
    4000000000, //477
    4000000000, //478
    4000000000, //479
    4000000000, //480
    4000000000, //481
    4000000000, //482
    4000000000, //483
    4000000000, //484
    4000000000, //485
    4000000000, //486
    4000000000, //487
    4000000000, //488
    4000000000, //489
    4000000000, //490
    4000000000, //491
    4000000000, //492
    4000000000, //493
    4000000000, //494
    4000000000, //495
    4000000000, //496
    4000000000, //497
    4000000000, //498
    4000000000, //499
    4000000000 //500
    );

//===============================================================

//===============================================================
//游戏命令
  g_GameCommand            :TGameCommand = (
   DATA                   :(sCmd:'Date';nPerMissionMin:0;nPerMissionMax:10);
    PRVMSG                 :(sCmd:'PrvMsg';nPerMissionMin:0;nPerMissionMax:10);
    ALLOWMSG               :(sCmd:'AllowMsg';nPerMissionMin:0;nPerMissionMax:10);
    BANSTORE               :(sCmd:'BanStore';nPerMissionMin:0;nPerMissionMax:10);
    LETSHOUT               :(sCmd:'LetShout';nPerMissionMin:0;nPerMissionMax:10);
    LETTRADE               :(sCmd:'LetTrade';nPerMissionMin:0;nPerMissionMax:10);
    LETGUILD               :(sCmd:'LetGuild';nPerMissionMin:0;nPerMissionMax:10);
    ENERGY                 :(sCmd:'Energy';nPerMissionMin:0;nPerMissionMax:0);  //50饭骇
    ENDGUILD               :(sCmd:'EndGuild';nPerMissionMin:0;nPerMissionMax:10);
    BANGUILDCHAT           :(sCmd:'BanGuildChat';nPerMissionMin:0;nPerMissionMax:10);
    BANGROUPCHAT           :(sCmd:'BanGroupChat';nPerMissionMin:0;nPerMissionMax:10);
    BANSYSMSG              :(sCmd:'BanSysMsg';nPerMissionMin:0;nPerMissionMax:10);
    BANHEARMSG             :(sCmd:'BanHearMsg';nPerMissionMin:0;nPerMissionMax:10);
    AUTHALLY               :(sCmd:'AuthAlly';nPerMissionMin:0;nPerMissionMax:10);
    ALLIANCE               :(sCmd:'Alliance';nPerMissionMin:0;nPerMissionMax:10);
    CANCELALLIANCE         :(sCmd:'CancelAlliance';nPerMissionMin:0;nPerMissionMax:10);
    DIARY                  :(sCmd:'Diary';nPerMissionMin:0;nPerMissionMax:10);
    USERMOVE               :(sCmd:'Move';nPerMissionMin:0;nPerMissionMax:10);
    SEARCHING              :(sCmd:'Searching';nPerMissionMin:0;nPerMissionMax:10);
    ALLOWGROUPCALL         :(sCmd:'AllowGroupRecall';nPerMissionMin:0;nPerMissionMax:10);
    GROUPRECALLL           :(sCmd:'GroupRecall';nPerMissionMin:0;nPerMissionMax:10);
    ALLOWGUILDRECALL       :(sCmd:'AllowGuildRecall';nPerMissionMin:0;nPerMissionMax:10);
    GUILDRECALLL           :(sCmd:'GuildRecall';nPerMissionMin:0;nPerMissionMax:10);
    UNLOCKSTORAGE          :(sCmd:'UnLockStorage';nPerMissionMin:0;nPerMissionMax:10);
    UNLOCK                 :(sCmd:'UnLock';nPerMissionMin:0;nPerMissionMax:10);
    LOCK                   :(sCmd:'Lock';nPerMissionMin:0;nPerMissionMax:10);
    PASSWORDLOCK           :(sCmd:'PasswordLock';nPerMissionMin:0;nPerMissionMax:10);
    SETPASSWORD            :(sCmd:'SetPassword';nPerMissionMin:0;nPerMissionMax:10);
    CHGPASSWORD            :(sCmd:'ChgPassword';nPerMissionMin:0;nPerMissionMax:10);
    CLRPASSWORD            :(sCmd:'ClrPassword';nPerMissionMin:10;nPerMissionMax:10);
    UNPASSWORD             :(sCmd:'UnPassword';nPerMissionMin:0;nPerMissionMax:10);
    MEMBERFUNCTION         :(sCmd:'MemberFunc';nPerMissionMin:0;nPerMissionMax:10);
    MEMBERFUNCTIONEX       :(sCmd:'MemberFuncEx';nPerMissionMin:0;nPerMissionMax:10);

    DEARRECALL             :(sCmd:'DearRecall';nPerMissionMin:0;nPerMissionMax:10);
    DEARBREAK              :(sCmd:'DEARBREAK';nPerMissionMin:0;nPerMissionMax:10);


    ATTACKMODE             :(sCmd:'AttackMode';nPerMissionMin:0;nPerMissionMax:10);
    REST                   :(sCmd:'Rest';nPerMissionMin:0;nPerMissionMax:10);
    TAKEONHORSE            :(sCmd:'OnHorse';nPerMissionMin:0;nPerMissionMax:10);
    TAKEOFHORSE            :(sCmd:'OffHorse';nPerMissionMin:0;nPerMissionMax:10);
    HUMANLOCAL             :(sCmd:'HumanLocal';nPerMissionMin:3;nPerMissionMax:10);
    MOVE                   :(sCmd:'GMMove';nPerMissionMin:3;nPerMissionMax:6);
    POSITIONMOVE           :(sCmd:'PositionMove';nPerMissionMin:3;nPerMissionMax:6);
    POSITIONGTMOVE         :(sCmd:'PositionGtMove';nPerMissionMin:10;nPerMissionMax:10); //厘盔 捞悼
    HOMEMOVE               :(sCmd:'HomeMove';nPerMissionMin:0;nPerMissionMax:10); //付阑捞悼
    REALIVEHOME            :(sCmd:'ReAliveHome';nPerMissionMin:0;nPerMissionMax:10); //付阑何劝
    MASKCLEAR              :(sCmd:'MaskClear';nPerMissionMin:0;nPerMissionMax:10);   //函脚呕 秦力
    GMEVENT                :(sCmd:'GMEvent';nPerMissionMin:10;nPerMissionMax:10);    //GM 捞亥飘
    INFO                   :(sCmd:'Info';nPerMissionMin:3;nPerMissionMax:10);
    MOBLEVEL               :(sCmd:'MobLevel';nPerMissionMin:3;nPerMissionMax:10);
    MOBCOUNT               :(sCmd:'MobCount';nPerMissionMin:3;nPerMissionMax:10);
    HUMANCOUNT             :(sCmd:'HumanCount';nPerMissionMin:3;nPerMissionMax:10);
    MAP                    :(sCmd:'Map';nPerMissionMin:3;nPerMissionMax:10);
    KICK                   :(sCmd:'Kick';nPerMissionMin:10;nPerMissionMax:10);
    TING                   :(sCmd:'Ting';nPerMissionMin:10;nPerMissionMax:10);
    SUPERTING              :(sCmd:'SuperTing';nPerMissionMin:10;nPerMissionMax:10);
    MAPMOVE                :(sCmd:'MapMove';nPerMissionMin:10;nPerMissionMax:10);
    SHUTUP                 :(sCmd:'Shutup';nPerMissionMin:10;nPerMissionMax:10);
    RELEASESHUTUP          :(sCmd:'ReleaseShutup';nPerMissionMin:10;nPerMissionMax:10);
    SHUTUPLIST             :(sCmd:'ShutupList';nPerMissionMin:10;nPerMissionMax:10);
    SVNINFO                :(sCmd:'SvnInfo';nPerMissionMin:10;nPerMissionMax:10);
    GAMEMASTER             :(sCmd:'GameMaster';nPerMissionMin:10;nPerMissionMax:10);
    OBSERVER               :(sCmd:'Observer';nPerMissionMin:10;nPerMissionMax:10);
    SUEPRMAN               :(sCmd:'Superman';nPerMissionMin:10;nPerMissionMax:10);
    LEVEL                  :(sCmd:'Level';nPerMissionMin:10;nPerMissionMax:10);
    SABUKWALLGOLD          :(sCmd:'SabukWallGold';nPerMissionMin:10;nPerMissionMax:10);
    RECALL                 :(sCmd:'Recall';nPerMissionMin:10;nPerMissionMax:10);
    REGOTO                 :(sCmd:'ReGoto';nPerMissionMin:10;nPerMissionMax:10);
    SHOWFLAG               :(sCmd:'showflag';nPerMissionMin:10;nPerMissionMax:10);
    SHOWOPEN               :(sCmd:'showopen';nPerMissionMin:10;nPerMissionMax:10);
    SHOWUNIT               :(sCmd:'showunit';nPerMissionMin:10;nPerMissionMax:10);
    ATTACK                 :(sCmd:'Attack';nPerMissionMin:10;nPerMissionMax:10);
    MOB                    :(sCmd:'Mob';nPerMissionMin:10;nPerMissionMax:10);
    MOBNPC                 :(sCmd:'MobNpc';nPerMissionMin:10;nPerMissionMax:10);
    DELNPC                 :(sCmd:'DelNpc';nPerMissionMin:10;nPerMissionMax:10);

    ALLLOCK                :(sCmd:'ALLKAN';nPerMissionMin:0;nPerMissionMax:10);
    SFC                    :(sCmd:'SFC';nPerMissionMin:0;nPerMissionMax:10);
    TRACK                  :(sCmd:'TRACK';nPerMissionMin:0;nPerMissionMax:10);

    FIVEGO                 :(sCmd:'FIVEGO';nPerMissionMin:0;nPerMissionMax:10);
    MAPCLICKMOVE           :(sCmd:'MAPCLICKMOVE';nPerMissionMin:0;nPerMissionMax:10);

    SHOUTGREEN             :(sCmd:'SHOUTGREEN';nPerMissionMin:0;nPerMissionMax:10);
    SHOUTPURPLE            :(sCmd:'SHOUTPURPLE';nPerMissionMin:0;nPerMissionMax:10);

    NPCSCRIPT              :(sCmd:'NpcScript';nPerMissionMin:10;nPerMissionMax:10);
    RECALLMOB              :(sCmd:'RecallMob';nPerMissionMin:10;nPerMissionMax:10);
    LUCKYPOINT             :(sCmd:'LuckyPoint';nPerMissionMin:10;nPerMissionMax:10);
    LOTTERYTICKET          :(sCmd:'LotteryTicket';nPerMissionMin:10;nPerMissionMax:10);
    RELOADGUILD            :(sCmd:'ReloadGuild';nPerMissionMin:10;nPerMissionMax:10);
    LOADGUILD              :(sCmd:'loadGuild';nPerMissionMin:10;nPerMissionMax:10);  //檬焊巩颇
    RELOADLINENOTICE       :(sCmd:'ReloadLineNotice';nPerMissionMin:10;nPerMissionMax:10);
    RELOADABUSE            :(sCmd:'ReloadAbuse';nPerMissionMin:10;nPerMissionMax:10);
    BACKSTEP               :(sCmd:'Backstep';nPerMissionMin:10;nPerMissionMax:10);
    BALL                   :(sCmd:'Ball';nPerMissionMin:10;nPerMissionMax:10);
    FREEPENALTY            :(sCmd:'FreePK';nPerMissionMin:10;nPerMissionMax:10);
    KILLDEATHZERO          :(sCmd:'KillDeathZero';nPerMissionMin:10;nPerMissionMax:10);   //懦/单胶 檬扁拳
    PKPOINT                :(sCmd:'PKpoint';nPerMissionMin:10;nPerMissionMax:10);
    INCPKPOINT             :(sCmd:'IncPkPoint';nPerMissionMin:10;nPerMissionMax:10);
    CHANGELUCK             :(sCmd:'ChangeLuck';nPerMissionMin:10;nPerMissionMax:10);

    HAIR                   :(sCmd:'hair';nPerMissionMin:10;nPerMissionMax:10);
    TRAINING               :(sCmd:'Training';nPerMissionMin:10;nPerMissionMax:10);
    DELETESKILL            :(sCmd:'DeleteSkill';nPerMissionMin:10;nPerMissionMax:10);
    CHANGEJOB              :(sCmd:'ChangeJob';nPerMissionMin:10;nPerMissionMax:10);    //殿急函券
    CHANGEJOBUP            :(sCmd:'ChangeJobUp';nPerMissionMin:10;nPerMissionMax:10);
    CHANGEGENDER           :(sCmd:'ChangeGender';nPerMissionMin:10;nPerMissionMax:10);
    NAMECOLOR              :(sCmd:'NameColor';nPerMissionMin:10;nPerMissionMax:10);
    MISSION                :(sCmd:'Mission';nPerMissionMin:10;nPerMissionMax:10);
    MOBPLACE               :(sCmd:'MobPlace';nPerMissionMin:10;nPerMissionMax:10);
    TRANSPARECY            :(sCmd:'Transparency';nPerMissionMin:10;nPerMissionMax:10);
    DELETEITEM             :(sCmd:'DeleteItem';nPerMissionMin:10;nPerMissionMax:10);
    LEVEL0                 :(sCmd:'Level0';nPerMissionMin:10;nPerMissionMax:10);
    CLEARMISSION           :(sCmd:'ClearMission';nPerMissionMin:10;nPerMissionMax:10);
    SETFLAG                :(sCmd:'setflag';nPerMissionMin:10;nPerMissionMax:10);
    SETOPEN                :(sCmd:'setopen';nPerMissionMin:10;nPerMissionMax:10);
    SETUNIT                :(sCmd:'setunit';nPerMissionMin:10;nPerMissionMax:10);
    RECONNECTION           :(sCmd:'Reconnection';nPerMissionMin:10;nPerMissionMax:10);
    DISABLEFILTER          :(sCmd:'DisableFilter';nPerMissionMin:10;nPerMissionMax:10);
    CHGUSERFULL            :(sCmd:'CHGUSERFULL';nPerMissionMin:10;nPerMissionMax:10);
    CHGZENFASTSTEP         :(sCmd:'CHGZENFASTSTEP';nPerMissionMin:10;nPerMissionMax:10);
    CONTESTPOINT           :(sCmd:'ContestPoint';nPerMissionMin:10;nPerMissionMax:10);
    STARTCONTEST           :(sCmd:'StartContest';nPerMissionMin:10;nPerMissionMax:10);
    ENDCONTEST             :(sCmd:'EndContest';nPerMissionMin:10;nPerMissionMax:10);
    ANNOUNCEMENT           :(sCmd:'Announcement';nPerMissionMin:10;nPerMissionMax:10);
    OXQUIZROOM             :(sCmd:'OXQuizRoom';nPerMissionMin:10;nPerMissionMax:10);
    GSA                    :(sCmd:'gsa';nPerMissionMin:10;nPerMissionMax:10);
    CHANGEITEMNAME         :(sCmd:'ChangeItemName';nPerMissionMin:10;nPerMissionMax:10);
    DISABLESENDMSG         :(sCmd:'DisableSendMsg';nPerMissionMin:10;nPerMissionMax:10);
    ENABLESENDMSG          :(sCmd:'EnableSendMsg';nPerMissionMin:10;nPerMissionMax:10);
    DISABLESENDMSGLIST     :(sCmd:'DisableSendMsgList';nPerMissionMin:10;nPerMissionMax:10);
    KILL                   :(sCmd:'Kill';nPerMissionMin:10;nPerMissionMax:10);
    MAKE                   :(sCmd:'make';nPerMissionMin:10;nPerMissionMax:10);

    SMAKE                  :(sCmd:'Supermake';nPerMissionMin:10;nPerMissionMax:10);
    YOURMAKE               :(sCmd:'YourMake';nPerMissionMin:10;nPerMissionMax:10);
    BONUSPOINT             :(sCmd:'BonusPoint';nPerMissionMin:10;nPerMissionMax:10);
    DELBONUSPOINT          :(sCmd:'DelBonusPoint';nPerMissionMin:10;nPerMissionMax:10);
    RESTBONUSPOINT         :(sCmd:'RestBonusPoint';nPerMissionMin:10;nPerMissionMax:10);
    FIREBURN               :(sCmd:'FireBurn';nPerMissionMin:10;nPerMissionMax:10);
    TESTFIRE               :(sCmd:'TestFire';nPerMissionMin:10;nPerMissionMax:10);
    TESTSTATUS             :(sCmd:'TestStatus';nPerMissionMin:10;nPerMissionMax:10);
    DELGOLD                :(sCmd:'DelGold';nPerMissionMin:10;nPerMissionMax:10);
    ADDGOLD                :(sCmd:'AddGold';nPerMissionMin:10;nPerMissionMax:10);
    DELGAMEGOLD            :(sCmd:'DelGamePoint';nPerMissionMin:10;nPerMissionMax:10);
    ADDGAMEGOLD            :(sCmd:'AddGamePoint';nPerMissionMin:10;nPerMissionMax:10);
    GAMEGOLD               :(sCmd:'GameGold';nPerMissionMin:10;nPerMissionMax:10);
    GAMEPOINT              :(sCmd:'GamePoint';nPerMissionMin:10;nPerMissionMax:10);
    PCPOINT                :(sCmd:'PCPoint';nPerMissionMin:10;nPerMissionMax:10);
    TESTGOLDCHANGE         :(sCmd:'Test_GOLD_Change';nPerMissionMin:10;nPerMissionMax:10);
    REFINEWEAPON           :(sCmd:'RefineWeapon';nPerMissionMin:10;nPerMissionMax:10);
    RELOADADMIN            :(sCmd:'ReloadAdmin';nPerMissionMin:10;nPerMissionMax:10);
    RELOADCOLUMN           :(sCmd:'ReloadColumn';nPerMissionMin:10;nPerMissionMax:10);    //全焊窜
    RELOADNPC              :(sCmd:'ReloadNpc';nPerMissionMin:10;nPerMissionMax:10);
    ADDKILLPOINT           :(sCmd:'AddKillPoint';nPerMissionMin:10;nPerMissionMax:10);  //懦 器牢飘 林扁
    ADDDEATHPOINT          :(sCmd:'AddDeathPoint';nPerMissionMin:10;nPerMissionMax:10);  //单胶 器牢飘 林扁
    RELOADMANAGE           :(sCmd:'ReloadManage';nPerMissionMin:10;nPerMissionMax:10);
    RELOADROBOTMANAGE      :(sCmd:'ReloadRobotManage';nPerMissionMin:10;nPerMissionMax:10);
    RELOADROBOT            :(sCmd:'ReloadRobot';nPerMissionMin:10;nPerMissionMax:10);
    RELOADMONITEMS         :(sCmd:'ReloadMonItems';nPerMissionMin:10;nPerMissionMax:10);
    RELOADDIARY            :(sCmd:'ReloadDiary';nPerMissionMin:10;nPerMissionMax:10);
    RELOADITEMDB           :(sCmd:'ReloadItemDB';nPerMissionMin:10;nPerMissionMax:10);
    RELOADSHOPITEMDB       :(sCmd:'ReloadShopItemDB';nPerMissionMin:10;nPerMissionMax:10);   //券惑痢 府肺靛
    RELOADMAKEITEM         :(sCmd:'ReloadMakeItem';nPerMissionMin:10;nPerMissionMax:10);      //力炼 府肺靛
    RELOADFISHITEMDB       :(sCmd:'ReloadFishItemDB';nPerMissionMin:10;nPerMissionMax:10);   //超矫 府肺靛
    RELOADMAGICDB          :(sCmd:'ReloadMagicDB';nPerMissionMin:10;nPerMissionMax:10);
    RELOADMONSTERDB        :(sCmd:'ReloadMonsterDB';nPerMissionMin:10;nPerMissionMax:10);
    RELOADMINMAP           :(sCmd:'ReLoadMinMap';nPerMissionMin:10;nPerMissionMax:10);
    RELOADBIGMAP           :(sCmd:'ReLoadBigMap';nPerMissionMin:10;nPerMissionMax:10);
    REALIVE                :(sCmd:'ReAlive';nPerMissionMin:10;nPerMissionMax:10);
    ADJUESTLEVEL           :(sCmd:'AdjustLevel';nPerMissionMin:10;nPerMissionMax:10);
    ADJUESTEXP             :(sCmd:'AdjustExp';nPerMissionMin:10;nPerMissionMax:10);
    ADDGUILD               :(sCmd:'AddGuild';nPerMissionMin:10;nPerMissionMax:10);
    DELGUILD               :(sCmd:'DelGuild';nPerMissionMin:10;nPerMissionMax:10);
    CHANGESABUKLORD        :(sCmd:'ChangeSabukLord';nPerMissionMin:10;nPerMissionMax:10);
    FORCEDWALLCONQUESTWAR  :(sCmd:'ForcedWallconquestWar';nPerMissionMin:10;nPerMissionMax:10);
    ADDTOITEMEVENT         :(sCmd:'AddToItemEvent';nPerMissionMin:10;nPerMissionMax:10);
    ADDTOITEMEVENTASPIECES :(sCmd:'AddToItemEventAsPieces';nPerMissionMin:10;nPerMissionMax:10);
    ITEMEVENTLIST          :(sCmd:'ItemEventList';nPerMissionMin:10;nPerMissionMax:10);
    STARTINGGIFTNO         :(sCmd:'StartingGiftNo';nPerMissionMin:10;nPerMissionMax:10);
    DELETEALLITEMEVENT     :(sCmd:'DeleteAllItemEvent';nPerMissionMin:10;nPerMissionMax:10);
    STARTITEMEVENT         :(sCmd:'StartItemEvent';nPerMissionMin:10;nPerMissionMax:10);
    ITEMEVENTTERM          :(sCmd:'ItemEventTerm';nPerMissionMin:10;nPerMissionMax:10);
    ADJUESTTESTLEVEL       :(sCmd:'AdjustTestLevel';nPerMissionMin:10;nPerMissionMax:10);
    TRAININGSKILL          :(sCmd:'TrainingSkill';nPerMissionMin:10;nPerMissionMax:10);
    OPDELETESKILL          :(sCmd:'OPDeleteSkill';nPerMissionMin:10;nPerMissionMax:10);
    CHANGEWEAPONDURA       :(sCmd:'ChangeWeaponDura';nPerMissionMin:10;nPerMissionMax:10);
    RELOADGUILDALL         :(sCmd:'ReloadGuildAll';nPerMissionMin:10;nPerMissionMax:10);
    WHO                    :(sCmd:'Who ';nPerMissionMin:3;nPerMissionMax:10);
    TOTAL                  :(sCmd:'Total ';nPerMissionMin:5;nPerMissionMax:10);
    TESTGA                 :(sCmd:'Testga';nPerMissionMin:10;nPerMissionMax:10);
    MAPINFO                :(sCmd:'MapInfo';nPerMissionMin:10;nPerMissionMax:10);
    SBKDOOR                :(sCmd:'SbkDoor';nPerMissionMin:10;nPerMissionMax:10);


    STARTQUEST             :(sCmd:'StartQuest';nPerMissionMin:10;nPerMissionMax:10);
    SETPERMISSION          :(sCmd:'SetPermission';nPerMissionMin:10;nPerMissionMax:10);
    SETCOLUMN              :(sCmd:'SetColumn';nPerMissionMin:10;nPerMissionMax:10);
    CLEARMON               :(sCmd:'ClearMon';nPerMissionMin:10;nPerMissionMax:10);
    RENEWLEVEL             :(sCmd:'ReNewLevel';nPerMissionMin:10;nPerMissionMax:10);
    DENYIPLOGON            :(sCmd:'DenyIPLogon';nPerMissionMin:10;nPerMissionMax:10);
    DENYACCOUNTLOGON       :(sCmd:'DenyAccountLogon';nPerMissionMin:10;nPerMissionMax:10);
    DENYCHARNAMELOGON      :(sCmd:'DenyCharNameLogon';nPerMissionMin:10;nPerMissionMax:10);
    DELDENYIPLOGON         :(sCmd:'DelDenyIPLogon';nPerMissionMin:10;nPerMissionMax:10);
    DELDENYACCOUNTLOGON    :(sCmd:'DelDenyAccountLogon';nPerMissionMin:10;nPerMissionMax:10);
    DELDENYCHARNAMELOGON   :(sCmd:'DelDenyCharNameLogon';nPerMissionMin:10;nPerMissionMax:10);
    SHOWDENYIPLOGON        :(sCmd:'ShowDenyIPLogon';nPerMissionMin:10;nPerMissionMax:10);
    SHOWDENYACCOUNTLOGON   :(sCmd:'ShowDenyAccountLogon';nPerMissionMin:10;nPerMissionMax:10);
    SHOWDENYCHARNAMELOGON  :(sCmd:'ShowDenyCharNameLogon';nPerMissionMin:10;nPerMissionMax:10);
    VIEWWHISPER            :(sCmd:'ViewWhisper';nPerMissionMin:10;nPerMissionMax:10);
    SPIRIT                 :(sCmd:'Spirit';nPerMissionMin:10;nPerMissionMax:10);
    SPIRITSTOP             :(sCmd:'EndSpirit';nPerMissionMin:10;nPerMissionMax:10);
    SETMAPMODE             :(sCmd:'SetMapMode';nPerMissionMin:10;nPerMissionMax:10);
    SHOWMAPMODE            :(sCmd:'ShowMapMode';nPerMissionMin:10;nPerMissionMax:10);
    TESTSERVERCONFIG       :(sCmd:'TestServerConfig';nPerMissionMin:10;nPerMissionMax:10);
    SERVERSTATUS           :(sCmd:'ServerStatus';nPerMissionMin:10;nPerMissionMax:10);
    TESTGETBAGITEM         :(sCmd:'TestGetBagItem';nPerMissionMin:10;nPerMissionMax:10);
    CLEARBAG               :(sCmd:'ClearBag';nPerMissionMin:10;nPerMissionMax:10);
    SHOWUSEITEMINFO        :(sCmd:'ShowUseItemInfo';nPerMissionMin:10;nPerMissionMax:10);
    BINDUSEITEM            :(sCmd:'BindUseItem';nPerMissionMin:10;nPerMissionMax:10);
    MOBFIREBURN            :(sCmd:'MobFireBurn';nPerMissionMin:10;nPerMissionMax:10);
    TESTSPEEDMODE          :(sCmd:'TestSpeedMode';nPerMissionMin:10;nPerMissionMax:10);
    GetUserItem            :(sCmd:'USERITEM'; nPermissionMin: 10; nPermissionMax: 10);   //雀荐
    AddUserItem            :(sCmd:'USERITEM'; nPermissionMin: 10; nPermissionMax: 10);   //林扁
    LOCKLOGON              :(sCmd:'LockLogin';nPerMissionMin:0;nPerMissionMax:0);
    TRADEGT                :(sCmd:'TradeGT';nPerMissionMin:0;nPerMissionMax:0);

  );



//===============================================================

//===============================================================
//游戏显示文字内容参数
  sClientSoftVersionError     :String = '登录器版本错误。';
  sDownLoadNewClientSoft      :String = '请下载最新的登录器再进入游戏。';
  sForceDisConnect            :String = '你已断开游戏连接。';
  sClientSoftVersionTooOld    :String = '你的登录器版本太旧。';
  sDownLoadAndUseNewClient    :String = '请下载最新的客户端进入游戏。';
  sOnlineUserFull             :String = '服务器已经满员。';
  sYouNowIsTryPlayMode        :String = '你正在通过测试模式连接游戏。';
  g_sNowIsFreePlayMode        :String = '你正在通过免费模式连接游戏。';
  sAttackModeOfAll            :String = '[攻击模式: 全体攻击]';
  sAttackModeOfPeaceful       :String = '[攻击模式: 和平攻击]';
  sAttackModeOfGroup          :String = '[攻击模式: 编组攻击]';
  sAttackModeOfGuild          :String = '[攻击模式: 行会攻击]';
  sAttackModeOFEnemy          :String = '[攻击模式: 联盟攻击]';
  sAttackModeOfRedWhite       :String = '[攻击模式: 善恶攻击]';
  sStartChangeAttackModeHelp  :String = '更改攻击模式，快捷键: CTRL-H';
  sStartNoticeMsg             :String = '欢迎来到龙的传说2，详细信息请查看我们的网站。';

  sThrustingOn                :String = '开启刺杀剑术。';
  sThrustingOff               :String = '关闭刺杀剑术。';
  sTaguOn                     :String = '开启罗汉棍法。';
  sTaguOff                    :String = '关闭罗汉棍法。';

  sHalfMoonOn                 :String = '开启半月弯刀。';
  sHalfMoonOff                :String = '关闭半月弯刀。';
  sWindbladeOn                :String = '开启风剑术。';
  sWindbladeOff               :String = '关闭风剑术。';
  sCrsHitOn                   :String = '开启狂风斩。';
  sCrsHitOff                  :String = '关闭狂风斩。';
  sNanCrsHitOn                :String = '开启抄拳趋浅曼';
  sNanCrsHitOff               :String = '关闭抄拳趋浅曼';
  sCrsBHitOn                  :String = '开启风天棍法。';
  sCrsBHitOff                 :String = '关闭风天棍法。';

  sFireSpiritsSummoned        :String = '你的武器因精神火球而炽热。';
  sHeroFireSpiritsSummoned   :String = '英雄的武器因精神火球而炽热。';

  sFireSpiritsFail            :String = '召唤烈火精灵失败。';
  sSpiritsGone                :String = '精神火球消失。';
  sMateDoTooweak              :String = '缺乏冲撞力量。';

  g_sTheWeaponBroke           :String = '你的武器破碎了。';
  sTheWeaponRefineSuccessfull :String = '你的武器升级成功。';

  sPetRest1                    :String = '属下行动: 休息';
  sPetAttack1                  :String = '属下行动: 攻击';

  sWearNotOfWoMan             :String = '男性用品。';
  sWearNotOfMan               :String = '女性用品。';
  sWearNotOfJob               :String = '此物品不允许该职业使用。';
  sHandWeightNot              :String = '腕力不足。';
  sWearWeightNot              :String = '穿戴负重不足。';
  g_sItemIsNotThisAccount     :String = '此物品不允许该账号使用。';
  g_sItemIsNotThisIPaddr      :String = '此物品不允许该IP使用。';
  g_sItemIsNotThisCharName    :String = '此物品不允许该角色使用。';
  g_sLevelNot                 :String = '等级不足。';
  g_sJobOrLevelNot            :String = '职业不符或者等级不足。';
  g_sJobOrDCNot               :String = '职业不符或者攻击不足。';
  g_sJobOrMCNot               :String = '职业不符或者魔法不足。';
  g_sJobOrSCNot               :String = '职业不符或者道术不足。';
  g_sDCNot                    :String = '供给不足。';
  g_sMCNot                    :String = '魔法不足。';
  g_sSCNot                    :String = '道术不足。';
  g_sReNewLevelNot            :String = '等级不足。';
  g_sGuildNot                 :String = '此物品只允许行会成员才可以使。';
  g_sGuildMasterNot           :String = '此物品只允许行会掌门才可以使。';
  g_sSabukHumanNot            :String = '此物品只允许沙巴克成员才可以使。';
  g_sSabukMasterManNot        :String = '此物品只允许沙巴克城主才可以使。';
  g_sNammanHumanNot           :String = '此物品只允许南满成员才可以使。';
  g_sNammanMasterManNot       :String = '此物品只允许南满城主才可以使。';
  g_sCastleKingMan            :String = '此物品只有城主才可以使用。';
  g_sCanottWearIt             :String = '无法使用。';

  sCanotUseDrugOnThisMap      :String = '当前地图禁止使用。';
  sGameMasterMode             :String = '你已经进入管理模式。';
  sReleaseGameMasterMode      :String = '你已经退出管理模式。';
  sObserverMode               :String = '你已经进入隐身模式。';
  g_sReleaseObserverMode      :String = '你已经退出隐身模式。';
  sSupermanMode               :String = '你已经进入无敌模式。';
  sReleaseSupermanMode        :String = '你已经退出无敌模式。';
  sYouFoundNothing            :String = '你没有获得任何物品。';

  g_sNoPasswordLockSystemMsg  :String = '你还没有设置系统密码。';
  g_sAlreadySetPasswordMsg    :String = '你已经设置密码。';
  g_sReSetPasswordMsg         :String = '请重新设置密码，';
  g_sPasswordOverLongMsg      :String = '你的密码长度太长: 密码的长度为4~7个字符。';
  g_sReSetPasswordOKMsg       :String = '密码设置成功。';
  g_sReSetPasswordNotMatchMsg :String = '两次输入的密码不一致。';
  g_sPleaseInputUnLockPasswordMsg :String = '请输入解锁密码:';
  g_sStorageUnLockOKMsg           :String = '仓库解锁成功。';
  g_sPasswordUnLockOKMsg          :String = '密码解锁密码。';
  g_sStorageAlreadyUnLockMsg      :String = '你的仓库已经设置解锁密码。';
  g_sStorageNoPasswordMsg         :String = '你的产库还没有设置解锁密码。';
  g_sUnLockPasswordFailMsg        :String = '解锁密码输入错误。';
  g_sLockStorageSuccessMsg        :String = '仓库解锁密码设置成功。';
  g_sStoragePasswordClearMsg      :String = '仓库密码已经清除。';
  g_sPleaseUnloadStoragePasswordMsg  :String = '密码已删除。';
  g_sStorageAlreadyLockMsg        :String = '仓库已经锁定。';
  g_sStoragePasswordLockedMsg     :String = '仓库密码已经锁定。';
  g_sSetPasswordMsg               :String = '请输入密码，密码的长度为4~7个字符。';
  g_sPleaseInputOldPasswordMsg    :String = '请输入原始的密码: ';
  g_sOldPasswordIsClearMsg        :String = '原始密码已经清除成功。';
  g_sPleaseUnLockPasswordMsg      :String = '仓库锁定时无法更改它。';
  g_sNoPasswordSetMsg             :String = '已取消密码修改。';
  g_sOldPasswordIncorrectMsg      :String = '你输入的原始密码错误。';
  g_sStorageIsLockedMsg           :String = '仓库已经锁定。';
  g_sActionIsLockedMsg            :String = '密码已经锁定。';
  g_sPasswordNotSetMsg            :String = '你不能修改密码。';
  g_sNotPasswordProtectMode       :String = '新的密码不能与原始密码相同。';
  g_sCanotDropGoldMsg             :String = '你不能丢弃金币。';
  g_sCanotDropInSafeZoneMsg       :String = '安全区不能丢弃物品。';
  g_sCanotDropItemMsg             :String = '此物品不能丢弃。';
  g_sCanotUseItemMsg              :String = '此物品不能使用。';

  g_sCanotTryRentalMsg            :String = '你不能租赁。';
  g_sPleaseTryRentalLaterMsg      :String = '请稍后再进行租赁。';

  g_sCanotTryDealMsg              :String = '你不能交易。';
  g_sPleaseTryDealLaterMsg        :String = '请稍后再进行交易。';
  g_sDealItemsDenyGetBackMsg      :String = '交易时不能将物品移动到背包内。';
  g_sDealItemsDenyGetBackMsg2     :String = '交易时不能将物品移动到交易栏。';
  g_sDisableDealItemsMsg          :String = '对方不同意交易。';
  g_sDealActionCancelMsg          :String = '对方取消了交易。';
  g_sPoseDisableDealMsg           :String = '交易失败。';
  g_sDealSuccessMsg               :String = '交易成功，';
  g_sDealOKTooFast                :String = '过早的点击了交易按钮。';
  g_sYourBagSizeTooSmall          :String = '你的背包已经满了。';
  g_sDealHumanBagSizeTooSmall     :String = '对方的背包已经满了。';
  g_sYourGoldLargeThenLimit       :String = '你的金币超过了允许携带的最大限度，';
  g_sDealHumanGoldLargeThenLimit  :String = '对方的金币超过了允许携带的最大限度。';
  g_sYourGameGoldLargeThenLimit   :String = '你的游戏币已经超过了允许携带的最大限度。';
  g_sYouDealOKMsg                 :String = '你已经提出了交易请求，请对方确认交易。';
  g_sPoseDealOKMsg                :String = '对方已经提出了交易请求，请点击交易按钮确认。';
  g_sKickClientUserMsg            :String = '客户端错误。';

  g_sCanotMapUseItemMsg           :string = '当前地图不允许使用%s。';      //荤侩陛瘤1

  g_sMyInfo                       :String;//'『<用户名>』:  %name 『<地图>』:  %map (%x:%y) 『<等级>』:  %level 『<金币>』:  %gold 『<PK值>』:  %pk 『<生命值>』:  %minhp/%maxhp 『<魔法值>』:  %minmp/%maxmp 『<攻击>』:  %mindc/%maxdc 『<魔法>』:  %minmc/%maxmc 『<道术>』:  %minsc/%maxsc 『<在线时间>』:  %logontime 『<登陆时间>』:  %logontimelong ';
  g_sSendOnlineCountMsg           :String = '当前在线人数：%d，在线英雄数：%d。';

  g_sOpenedDealMsg                :String = '对方请求与你进行交易。';
  g_sSendCustMsgCanNotUseNowMsg   :String = '当前无法使用。';
  g_sSubkMasterMsgCanNotUseNowMsg :String = '只有沙巴克城主才能使用。';
  g_sWeaponRepairSuccess          :String = '武器已经修复成功。';
  g_sTigerRepairSuccess           :String = '坐骑的忠诚度已经恢复。';
  g_sDefenceUpTime                :String = '防御力增加%d秒。';
  g_sMagDefenceUpTime             :String = '付魔法防御力增加%d秒。';
  g_sWindMoonUpTime               :String = '清风明月状态持续%d秒。';
  g_sBloodMoonUpTime              :String = '红龙影舞状态持续%d秒。';
  g_sHeathRecoveryUpTime          :String = '生命恢复增加%d秒。';
  g_sSpellRecoveryUpTime          :String = '魔法恢复增加%d秒。';
  g_sMagProtectionFieldTime       :String = '护身气幕的防御效果增加%d秒。';     //龋脚扁阜
  g_sAttPowerUpTime               :String = '攻击力等级%d分%d秒。';
  g_sAttPowerBonzeUpTime          :String = '攻击、道术增加%d盒%d秒。';
  g_sSpeedPointUpTime             :String = '风身术状态持续%d秒。';
  g_sSuraMagDefenceUpTime         :String = '天神降临状态持续%d秒。';
  g_sSunChunHPUpTime              :String = '先天真气状态持续%d秒，最大生命值增加%d。';
  g_sTenMuUpTime                  :String = '天务效果持续%d秒。';
  g_sAttPowerDownTime             :String = '诅咒术降低了属性，持续%d分%d秒。';
  g_sMagRageTime                  :String = '剑气爆的魔法防御效果增加%d秒。';     //梅扁气
  g_sSunChunTime                  :String = '先天气功的效果增加%d秒。';
  g_sMagicUpTime                  :String = '深延术的效果持续%d秒。';     //缴楷贱
  g_sBloodUpTime                  :String = '血龙剑法的效果持续%d秒。';     //趋锋八过
  g_sSkyTime                      :String = '天上秘术的效果持续%d秒。';     //玫惑厚贱

  g_sAttSpeedUpTime               :String = '体迅风的效果持续%d秒。';
  g_sWalkSpeedUpTime              :String = '轻身步的效果持续%d秒。';
  g_sMoonTime                     :String = '月影术的效果持续%d秒。';
  g_sYeongMuTime                  :String = '月影雾的效果持续 %d秒。';
  g_sMaskManTime                  :String = '男剑客效果。';
  g_sMaskWoManTime                :String = '女剑客效果。';
  g_sWinLottery1Msg               :String = '祝贺你，你获得了一等奖。';
  g_sWinLottery2Msg               :String = '祝贺你，你获得了二等奖。';
  g_sWinLottery3Msg               :String = '祝贺你，你获得了三等奖。';
  g_sWinLottery4Msg               :String = '祝贺你，你获得了四等奖。';
  g_sWinLottery5Msg               :String = '祝贺你，你获得了五等奖。';
  g_sWinLottery6Msg               :String = '祝贺你，你获得了六等奖。';
  g_sNotWinLotteryMsg             :String = '没有中奖....';
  g_sWeaptonMakeLuck              :String = '你的武器获得了幸运。';
  g_sWeaptonNotMakeLuck           :String = '无效，';
  g_sTheWeaponIsCursed            :String = '你的武器被诅咒了。';
  g_sCanotTakeOffItem             :String = '你不能取下这件装备。';
  g_sTryModeCanotUseStorage       :String = '测试模式不允许使用仓库功能。';
  g_sCanotGetItems                :String = '你没有获得任何物品。';

  g_sNowCurrDateTime              :String = '当前时间: ';
  g_sEnableHearWhisper            :String = '[允许私聊]';
  g_sDisableHearWhisper           :String = '[拒绝私聊]';
  g_sEnableShoutMsg               :String = '[允许喊话]';
  g_sDisableShoutMsg              :String = '[拒绝喊话]';
  g_sEnableStoreMsg               :String = '[允许摊位喊话]';
  g_sDisableStoreMsg              :String = '[拒绝摊位喊话]';
  g_sEnableGroupChat              :String = '[允许组队聊天]';
  g_sDisableGroupChat             :String = '[拒绝组队聊天]';
  g_sEnableSysMsg                 :String = '[允许系统通知]';
  g_sDisableSysMsg                :String = '[拒绝系统通知]';
  g_sEnableHearMsg                :String = '[允许一般聊天]';
  g_sDisableHearMsg               :String = '[拒绝一般聊天]';
  g_sEnableDealMsg                :String = '[允许交易]';
  g_sDisableDealMsg               :String = '[拒绝交易]';
  g_sEnableGuildChat              :String = '[允许行会聊天]';
  g_sDisableGuildChat             :String = '[拒绝行会聊天]';
  g_sEnableJoinGuild              :String = '[允许加入行会]';
  g_sDisableJoinGuild             :String = '[拒绝加入行会]';
  g_sEnableAuthAllyGuild          :String = '[允许行会联盟]';
  g_sDisableAuthAllyGuild         :String = '[拒绝行会联盟]';
  g_sEnableGroupRecall            :String = '[允许天地合一侩]';
  g_sDisableGroupRecall           :String = '[拒绝天地合一]';
  g_sEnableGuildRecall            :String = '[允许行会召唤]';
  g_sDisableGuildRecall           :String = '[拒绝行会召唤]';
  g_sPleaseInputPassword          :String = '请输入你的密码:';
  g_sTheMapDisableMove            :String = '%s地图不允许使用传送戒指。';
  g_sTheMapNotFound               :String = '%s地图不存在。';
  g_sYourIPaddrDenyLogon          :String = '你的IP地址禁止登陆。';
  g_sYourAccountDenyLogon         :String = '你的账号禁止登陆。';
  g_sYourCharNameDenyLogon        :String = '你的角色禁止登陆。';
  g_sYourHDDDenyLogon             :String = '你的账号在其他地址登陆。';   //荐沥登菌嚼聪促.
  g_sCanotPickUpItem              :String = '在一定时间内你不能捡取物品。';
  g_sCanotSendmsg                 :String = '你拒绝私聊。';
  g_sUserDenyWhisperMsg           :String = '对方拒绝私聊。';
  g_sUserNotOnLine                :String = '对方不在线。';
  g_sRevivalRecoverMsg            :String = '复活戒指功能成效。1分钟后可以再次使用。';
  g_sClientVersionTooOld          :String = '你的客户端版本太旧，无法正常显示最新效果。';

  g_sCastleGuildName              :String = '%guildname(%castlename)';  //捞抚 流氓
  g_sNoCastleGuildName            :String = '%guildname';                //捞抚 流氓
  g_sWarrReNewName                :String = '%chrname\*<战士>*';
  g_sWizardReNewName              :String = '%chrname\*<法师>*';
  g_sTaosReNewName                :String = '%chrname\*<道士>*';
  g_sAssassinReNewName            :String = '%chrname\*<刺客>*';     //磊按
  g_sWarrUPReNewName              :String = '%chrname\*<碧血战士>*';
  g_sWizardUPReNewName            :String = '%chrname\*<弘玄法师>*';
  g_sTaosUPReNewName              :String = '%chrname\*<翊仙道士>*';
  g_sAssassinUPReNewName          :String = '%chrname\*<飞燕刺客>*';     //磊按
  g_sRankLevelName                :String = '%s\Level';
  g_sHumanShowName                :String = '%chrname\%guildname';

  g_sColumn1                      :String = '<宣传团长>';
  g_sColumn2                      :String = '<宣传成员>';
  g_sColumn3                      :String = '<记者团长>';
  g_sColumn4                      :String = '<记者成员>';
  g_sColumn5                      :String = '<精英团长>';
  g_sColumn6                      :String = '<精英成员>';

  g_sChangePermissionMsg          :String = '权限级别: %d';
  g_sChangeKillMonExpRateMsg      :String = '经验值增加: %g / %d';
  g_sChangeMasterExpRateMsg       :String = '老师的威严BUFF效果持续%d分钟。';
  g_sChangePowerRateMsg           :String = '攻击力增加: %g / %d';

  g_sScriptChangeHumanHPMsg       :String = '生命值: %d';
  g_sScriptChangeHumanMPMsg       :String = '魔法值: %d';
  g_sScriptGuildAuraePointNoGuild :String = '巩颇俊 啊涝登绢乐瘤 臼嚼聪促.';
  g_sScriptGuildAuraePointMsg     :String = '巩颇器牢飘: %d';
  g_sScriptGuildBuildPointNoGuild :String = '寸脚篮 巩颇俊 啊涝登绢 乐瘤 臼嚼聪促.';
  g_sScriptGuildBuildPointMsg     :String = '巩颇磊陛: %d';
  g_sScriptGuildFlourishPointNoGuild :String = '寸脚篮 巩颇俊 啊涝登绢 乐瘤 臼嚼聪促.';
  g_sScriptGuildFlourishPointMsg  :String = '巩颇器牢飘: %d';
  g_sScriptGuildStabilityPointNoGuild:String = 'FixMsg[104]: %d';
  g_sScriptGuildStabilityPointMsg :String = '巩颇胶湃器牢飘: %d';
  g_sScriptChiefItemCountMsg      :String = 'FixMsg[106]: %d';

  g_sDisableSayMsg                :String = '[由于你发言过于频繁:%d秒内禁止发言。]';
  g_sOnlineCountMsg               :String = '当前在线人数：%d，在线英雄数：%d。';
  g_sTotalOnlineCountMsg          :String = '当前服务器在线人数为：%d。';
  g_sYouNeedLevelMsg              :String = '只有等级达到%d级以上才可以使用喊话功能。';
  g_sThisMapDisableSendCyCyMsg    :String = '当前地图不能使用喊话功能。';
  g_sYouCanSendCyCyLaterMsg       :String = '%d以后才可以使用喊话功能。';
  g_sYouIsDisableSendMsg          :String = '你被禁言了。';
  g_sYouMurderedMsg               :String = '你%s杀死了。';
  g_sYouKilledByMsg               :String = '[你被%s杀死了。]';
  g_sYouHeroKilledByMsg           :String = '[你的英雄英雄被%s杀死了。]';
  g_sYouLoverKilledByMsg          :String = '[你的爱人被%s杀死了。]';
  g_sYouProtectedByLawOfDefense   :String = '[你受到正当防卫规则的保护。]';
  g_sYouProtectedByLawOfDefenseKilld :String = '[你被%s杀死了 - 对方受到正当防卫规则的保护]';
  g_sYourUseItemIsNul             :String = '你当前不能使用物品%s。';

  g_sGroupCheckMsg                :string = '你是否同意加入%s(%d)的队伍？\物品分配规则[%s] :: 召唤英雄[%s]';
  g_sGroupItemClass1              :string = '自由捡取';
  g_sGroupItemClass2              :string = '自动分配';
  g_sGroupHero1                   :string = '允许';
  g_sGroupHero2                   :string = '禁止';
ResourceString
  g_sGameLogMsg1                   = '%d'#9'%s'#9'%d'#9'%d'#9'%s'#9'%s'#9'%d'#9'%s'#9'%s'#9'%s';
  g_sHumanDieEvent                 = '人物已经死亡。';
  g_sHitOverSpeed                  = '[攻击速度超速] %s :%d :%d';
  g_sRunOverSpeed                  = '[跑步速度超速] %s :%d :%d';
  g_sWalkOverSpeed                 = '[移动速度超速] %s :%d :%d';
  g_sSpellOverSpeed                = '[施法速度超速] %s :%d :%d';
  g_sBunOverSpeed                  = '[自动速度超速] %s :%d :%d';

 // g_sGameCommandPermissionTooLow   = '款康磊 鼻茄捞 绝嚼聪促.';
  g_sGameCommandParamUnKnow        = '使用方法 : @%s %s';
  g_sGameCommandMoveHelpMsg        = '<地图 号码>';
  g_sGameCommandPositionMoveHelpMsg         = '<地图 名称> <X 坐标> <Y 坐标>';
  g_sGameCommandPositionGtMoveHelpMsg       = '<地图 名称(GA0~GA3)> <X 坐标> <Y 坐标> <庄园号码(1~10)>';
  g_sGameCommandPositionMoveCanotMoveToMap  = '当前位置移动错误: %s X:%s Y:%s';
  g_sGameCommandInfoHelpMsg                 = '<角色名>';
//  g_sGameCommandHumanNotOnLine             :String = '%s not found.';
  g_sNowNotOnLineOrOnOtherServer            = '%s不在线。';
  g_sGameCommandMobCountHelpMsg             = '<地图>';
  g_sGameCommandMobCountMapNotFound         = '没有发现地图。';
  g_sGameCommandMobCountMonsterCount        = '怪物数量: %d';
  g_sGameCommandHumanCountHelpMsg           = '<地图>';
  g_sGameCommandKickHumanHelpMsg            = '<角色名>';
  g_sGameCommandTingHelpMsg                 = '<角色名>';
  g_sGameCommandSuperTingHelpMsg            = '<角色名> <范围(0-10)>';
  g_sGameCommandMapMoveHelpMsg              = '<地图> <坐标>';
  g_sGameCommandMapMoveMapNotFound          = '地图%s不存在。';
  g_sGameCommandShutupHelpMsg               = '<角色名> <时间(分)>';
  g_sGameCommandShutupHumanMsg              = '%s被禁言%d分。';
  g_sGameCommandGamePointHelpMsg            = '<角色名> <操作(+,-,=)> <金额(1-100000000)>';
  g_sGameCommandGamePointHumanMsg           = '你的游戏点已经从%d变成%d。';
  g_sGameCommandGamePointGMMsg              = '%s的游戏点由%d变为%d。';

  g_sGameCommandPCPointHumanMsg             = '你的PC点已经从%d变为%d。';
  g_sGameCommandPCPointGMMsg                = '%s的PC点由%d变为%d。';
  
  g_sGameCommandAddLuckPointHelpMsg         = '<角色名> <幸运值(1-2000000)>';

  g_sGameCommandGameGoldHelpMsg             = '<角色名> <操作>(+,-,=) <金额(1-200000000)>';
  g_sGameCommandGameGoldHumanMsg            = '%s %d %d%s FixMsg[115]';
  g_sGameCommandGameGoldGMMsg               = '%s %s %d %d%s FixMsg[116]';

  g_sGameCommandMapInfoMsg                  = '地图信息: %s(%s)';
  g_sGameCommandMapInfoSizeMsg              = '地图大小: X(%d) Y(%d)';

  g_sGameCommandShutupReleaseHelpMsg        = '<角色名>';
  g_sGameCommandShutupReleaseCanSendMsg     = '禁止聊天。';
  g_sGameCommandShutupReleaseHumanCanSendMsg  = '%s秒以后可以聊天。';
  g_sGameCommandShutupListIsNullMsg         = '禁止聊天列表已经被清空。';

  g_sGameCommandLevelConsoleMsg             = '[级别变更成功] %s (%d -> %d)';
  g_sGameCommandSbkGoldHelpMsg              = '<沙巴克名字> <操作(=,-,+)> <金额(1-100000000)>';
  g_sGameCommandSbkGoldCastleNotFoundMsg    = '沙巴克行会不存在。';
  g_sGameCommandSbkGoldShowMsg              = '%s今天的收入为：%d，总收入为: %d';
  g_sGameCommandRecallHelpMsg               = '<角色名>';
  g_sGameCommandReGotoHelpMsg               = '<角色名>';
  g_sGameCommandShowHumanFlagHelpMsg        = '<角色名> <Flag No>';
  g_sGameCommandShowHumanFlagONMsg          = '%s: [%d] = ON';
  g_sGameCommandShowHumanFlagOFFMsg         = '%s: [%d] = OFF';

  g_sGameCommandShowHumanUnitHelpMsg        = '<角色名> <分队名>';
  g_sGameCommandShowHumanUnitONMsg          = '%s: [%d] = ON';
  g_sGameCommandShowHumanUnitOFFMsg         = '%s: [%d] = OFF';
  g_sGameCommandMobHelpMsg                  = '<怪物> <数量> <等级>';
  g_sGameCommandMobMsg                      = 'DB中没有该怪物(DB: Mob)...';
  g_sGameCommandMobNpcHelpMsg               = 'NPC ?() ?(0,1) FixMsg[119]';
  g_sGameCommandNpcScriptHelpMsg            = 'FixMsg[120]';
  g_sGameCommandRecallMobHelpMsg            = '<怪物> <数量> <等级>';
  g_sGameCommandLuckPointHelpMsg            = '<角色名>';

  g_sGameCommandLuckPointMsg                = '%s - 幸运等级:%d 幸运值:%g 物品幸运值:%d';
  g_sGameCommandLotteryTicketMsg            = '彩票: %d FixMsg[15]: %d : %d : %d : %d : %d : %d : %d ';
  g_sGameCommandReloadGuildHelpMsg          = '<行会名>';
  g_sGameCommandReloadGuildOnMasterserver   = '重载行会信息成功。';
  g_sGameCommandReloadGuildNotFoundGuildMsg = '%s这个行会不存在。';
  g_sGameCommandReloadGuildSuccessMsg       = '%s(行会)信息重载成功。';

  g_sGameCommandReloadLineNoticeSuccessMsg  = '重新加载公告信息成功。';
  g_sGameCommandReloadLineNoticeFailMsg     = '重新加载公告信息失败。';
  g_sGameCommandFreePKHelpMsg               = '<角色名>';
  g_sGameCommandFreePKHumanMsg              = 'PK数值已清除。';
  g_sGameCommandFreePKMsg                   = 'PK数值已清除。';
  g_sGameCommandPKPointHelpMsg              = '<角色名>';
  g_sGameCommandPKPointMsg                  = 'PK数值: %d';
  g_sGameCommandIncPkPointHelpMsg           = '<角色名> <PK 数值>';
  g_sGameCommandHumanLocalHelpMsg           = '<角色名>';
  g_sGameCommandHumanLocalMsg               = '%s FixMsg[13]:%s';
  g_sGameCommandPrvMsgHelpMsg               = '<角色名>';
  g_sGameCommandPrvMsgUnLimitMsg            = '%s FixMsg[12]...';
  g_sGameCommandPrvMsgLimitMsg              = '%s 已退出游戏。';
  g_sGamecommandMakeHelpMsg                 = ' <物品名> <数量>';
  g_sGamecommandMakeItemNameOrPerMissionNot = '物品制造失败。';
  g_sGamecommandMakeInCastleWarRange        = 'FixMsg[9]';
  g_sGamecommandMakeInSafeZoneRange         = 'FixMsg[8]';
  g_sGamecommandMakeItemNameNotFound        = 'DB数据库中物品'+'%s'+'不存在。';
  g_sGamecommandSuperMakeHelpMsg            = '<装备物品号码> <选项编号> <数值>';
  g_sGamecommandYourMakeHelpMsg             = '<角色名> <装备物品号码> <选项编号> <数值>';
  g_sGameCommandViewWhisperHelpMsg          = ' <角色名>';
  g_sGameCommandViewWhisperMsg1             = '显示所有私聊信息...';
  g_sGameCommandViewWhisperMsg2             = '不显示所有私聊信息..';
  g_sGameCommandReAliveHelpMsg              = ' <角色名>';
  g_sGameCommandReAliveMsg                  = '%s复活成功。';
  g_sGameCommandChangeJobHelpMsg            = ' <角色名> <职业(Warrior Wizard Taoist Assassin)>';
  g_sGameCommandGMEventAbillHelpMsg         = ' <属性(0:初始化, 1~9:属性)> <属性值(0:初始化, 最大值255)> <适用最小等级> <适用最大等级>';
  g_sGameCommandChangeJobUpHelpMsg          = ' <角色名> <职业(UpWarr UpWiz UpTao UpAssa)>';
  g_sGameCommandChangeJobMsg                = '职业变更成功。';
  g_sGameCommandChangeJobHumanMsg           = '职业变更成功。';
  g_sGameCommandTestGetBagItemsHelpMsg      = '(FixMsg[3])';
  g_sGameCommandShowUseItemInfoHelpMsg      = '<角色名>';
  g_sGameCommandBindUseItemHelpMsg          = '<角色名> ? ? FixMsg[4]';
  g_sGameCommandBindUseItemNoItemMsg        = '%s %s FixMsg[2]';
  g_sGameCommandBindUseItemAlreadBindMsg    = '%s %s FixMsg[1]';
  g_sGameCommandMobFireBurnHelpMsg          = '使用方法: %s %s %s %s %s %s %s';
  g_sGameCommandMobFireBurnMapNotFountMsg   = '地图%s不存在。';
  g_sGameCommandTradeGTMsg                  = ' <数量>';

ResourceString
  U_DRESSNAME       = 'Dress';
  U_WEAPONNAME      = 'Weapon';
  U_RIGHTHANDNAME   = 'RightHand';
  U_NECKLACENAME    = 'Necklace';
  U_HELMETNAME      = 'Helmet';
  U_ARMRINGLNAME    = 'BraceL';
  U_ARMRINGRNAME    = 'BraceR';
  U_RINGLNAME       = 'RingL';
  U_RINGRNAME       = 'RingR';

  U_BUJUKNAME       = 'Bujuk';
  U_BELTNAME        = 'Belt';
  U_BOOTSNAME       = 'Boots';
  U_CHARMNAME       = 'Charm';
  U_TIGERNAME       = 'Tiger';   //龋尔捞

//===============================================================
var
  IPLocal:TIPLocal = nil;
  nIPLocal:Integer = -1;
  g_TopInfo: array[0..14] of array of TTopInfo;

  g_sMissionData: string;
  g_sMissionDataMD5: string;
  g_nMissionDataLen: Integer;

  g_sMapDescData: string;
  g_sMapDescDataMD5: string;
  g_nMapDescDataLen: Integer;

  g_sHintData: string;
  g_nHintDataLen: Integer;

type
  TZIPLevel = 0..9;

  TMsgStringList = class(TStringList)
  public
    procedure LoadFromFile(const FileName: string); override;
  end;

function MyFileExists(const FileName: string): Boolean;
function ZIPCompress(const InBuf: Pointer; InBytes: Integer; Level: TZIPLevel; out OutBuf: PChar): Integer;
function ZIPDecompress(const InBuf: Pointer; InBytes: Integer; OutEstimate: Integer; out OutBuf: PChar): Integer;

implementation

uses HUtil32, EDcode, svMain;
var
  nAddGameDataLog:Integer = -1;
procedure SetProcessName(sName:String);
begin
//  g_sOldProcessName:=g_sProcessName;
//  g_sProcessName:=sName;
end;

//004E40B0
function LoadLineNotice(FileName:String):Boolean;
var
  i:integer;
  sText:String;
begin
  Result:=False;
  if FileExists(FileName) then begin
    LineNoticeList.LoadFromFile(FileName);
    i:=0;
    while (True) do begin
      if LineNoticeList.Count <= i then break;
      sText:=Trim(LineNoticeList.Strings[i]);
      if (sText = '') or (sText[1] = ';') then begin
        LineNoticeList.Delete(i);
        Continue;
      end;
      LineNoticeList.Strings[i]:=sText;
      Inc(i);
    end;
    Result:=True;
  end;
end;


function LoadLineHint(FileName: string): Boolean;
var
  sText: string;
  StrList: TStringList;
  OutLen: Integer;
  OutBuffer: PChar;
begin
  Result := False;
  g_sHintData := '';
  g_nHintDataLen := 0;
  if FileExists(FileName) then begin
    StrList := TStringList.Create;
    StrList.LoadFromFile(FileName);
    sText := StrList.Text;
    OutLen := ZIPCompress(PChar(sText), Length(sText) + 1, 9, OutBuffer);
    if OutLen > 0 then begin
      g_nHintDataLen := OutLen;
      g_sHintData := EncodeLongBuffer(OutBuffer, OutLen);
      FreeMem(OutBuffer);
    end;
    Result := True;
    StrList.Free;
  end;
end;

function  GetMultiServerAddrPort(btServerIndex:Byte;var sIPaddr:String;var nPort:Integer):Boolean;
var
  nServer:Integer;
  GateList:TStringList;
begin
  Result:=False;

  if btServerIndex < ServerTableList.Count then begin
    GateList := ServerTableList.Items[btServerIndex];

    if GateList <> nil then begin
      nServer := Random(GateList.Count); //pick random server

      sIPaddr := GateList.Strings[nServer];
      nPort   := Integer(GateList.Objects[nServer]);
      Result  := True;
    end;
  end;

  if not Result then
    MainOutMessage('获取多服务器地址失败..');
end;
procedure MainOutMessage(Msg:String);
begin
  if not g_Config.boShowExceptionMsg then begin
    if (length(Msg) > 2) and ((Msg[2] = 'E') or (Msg[1] = 'A')) then
      exit;
  end;
  EnterCriticalSection(LogMsgCriticalSection);
  try
    MainLogMsgList.Add('['+DateTimeToStr(Now) + '] ' + Msg);
  finally
    LeaveCriticalSection(LogMsgCriticalSection);
  end;
end;

function  GetExVersionNO(nVersionDate:Integer; var nOldVerstionDate:Integer):Integer;
begin
  Result:=0;
  nOldVerstionDate:=0;
                    
  if nVersionDate > 100000000 then begin
    While (nVersionDate > 100000000) do begin
      Dec(nVersionDate,100000000);
      Inc(Result,100000000);
    end;
  end;
  nOldVerstionDate:=nVersionDate;
end;
function GetNextDirection (sx, sy, dx, dy: Integer): byte;//004B2C38
var
   flagx, flagy: integer;
begin
   Result := DR_DOWN;
   if sx < dx then flagx := 1
   else if sx = dx then flagx := 0
   else flagx := -1;
   if abs(sy-dy) > 2
    then if (sx >= dx-1) and (sx <= dx+1) then flagx := 0;

   if sy < dy then flagy := 1
   else if sy = dy then flagy := 0
   else flagy := -1;
   if abs(sx-dx) > 2 then if (sy > dy-1) and (sy <= dy+1) then flagy := 0;

   if (flagx = 0)  and (flagy = -1) then Result := DR_UP;
   if (flagx = 1)  and (flagy = -1) then Result := DR_UPRIGHT;
   if (flagx = 1)  and (flagy = 0)  then Result := DR_RIGHT;
   if (flagx = 1)  and (flagy = 1)  then Result := DR_DOWNRIGHT;
   if (flagx = 0)  and (flagy = 1)  then Result := DR_DOWN;
   if (flagx = -1) and (flagy = 1)  then Result := DR_DOWNLEFT;
   if (flagx = -1) and (flagy = 0)  then Result := DR_LEFT;
   if (flagx = -1) and (flagy = -1) then Result := DR_UPLEFT;
end;
function GetNextDirectionNew (sx, sy, dx, dy: Integer): byte;
var
   flagx, flagy: integer;
begin
   Result := DR_DOWN;
   if sx < dx then flagx := 1
   else if sx = dx then flagx := 0
   else flagx := -1;
   if abs(sy-dy) > 2 then begin
      if (sx >= dx-1) and (sx <= dx+1) then
         flagx := 0;
   end;

   if sy < dy then flagy := 1
   else if sy = dy then flagy := 0
   else flagy := -1;
   if abs(sx-dx) > 2 then begin
      if (sy >= dy-1) and (sy <= dy+1) then
         flagy := 0;
   end;

   if (flagx = 0)  and (flagy = -1) then Result := DR_UP;
   if (flagx = 1)  and (flagy = -1) then Result := DR_UPRIGHT;
   if (flagx = 1)  and (flagy = 0)  then Result := DR_RIGHT;
   if (flagx = 1)  and (flagy = 1)  then Result := DR_DOWNRIGHT;
   if (flagx = 0)  and (flagy = 1)  then Result := DR_DOWN;
   if (flagx = -1) and (flagy = 1)  then Result := DR_DOWNLEFT;
   if (flagx = -1) and (flagy = 0)  then Result := DR_LEFT;
   if (flagx = -1) and (flagy = -1) then Result := DR_UPLEFT;
end;
function CheckUserItems(nIdx:integer;StdItem:TItem):Boolean; //004B2D70
begin
  Result:=False;
  case nIdx of
    U_DRESS:     if StdItem.StdMode in [10,11,12] then Result:=True;
    U_WEAPON:    if (StdItem.StdMode = 5) or (StdItem.StdMode = 6) or (StdItem.StdMode = 7) or (StdItem.StdMode = 99) or (StdItem.StdMode = 90) then Result:=True;
    U_RIGHTHAND: if (StdItem.StdMode = 29) or (StdItem.StdMode = 30) or (StdItem.StdMode = 28) then Result:=True;
    U_NECKLACE:  if (StdItem.StdMode = 19) or (StdItem.StdMode = 20) or (StdItem.StdMode = 21) then Result:=True;
    U_HELMET:    if StdItem.StdMode = 15 then Result:=True;
    U_ARMRINGL:  if (StdItem.StdMode = 24) or (StdItem.StdMode = 25) or (StdItem.StdMode = 26) then Result:=True;
    U_ARMRINGR:  if (StdItem.StdMode = 24) or (StdItem.StdMode = 26) then Result:=True;
    U_RINGL,
    U_RINGR:     if (StdItem.StdMode = 22) or (StdItem.StdMode = 23) then Result:=True;
    U_BUJUK:     if (StdItem.StdMode = 25) or (StdItem.StdMode = 51) then Result:=True;
    U_BELT:      if (StdItem.StdMode = 54) or (StdItem.StdMode = 64) then Result:=True;
    U_BOOTS:     if (StdItem.StdMode = 62) then Result:=True;
    U_CHARM:     if (StdItem.StdMode = 53) or (StdItem.StdMode = 63) then Result:=True;
    U_TIGER:     if (StdItem.StdMode = 101) or (StdItem.StdMode = 102) then Result:=True; //龋尔捞
    U_PETS1:     if (StdItem.StdMode = 70) then Result:=True;     //龋尔捞
    U_PETS2:     if (StdItem.StdMode = 71) then Result:=True;
    U_PETS3:     if (StdItem.StdMode = 72) then Result:=True;
    U_PETS4:     if (StdItem.StdMode = 73) then Result:=True;
    U_PETS5:     if (StdItem.StdMode = 74) then Result:=True;

    U_FISH1:     if (StdItem.StdMode = 80) then Result:=True;      //超矫
    U_FISH2:     if (StdItem.StdMode = 81) then Result:=True;
    U_FISH3:     if (StdItem.StdMode = 82) then Result:=True;
    U_FISH4:     if (StdItem.StdMode = 83) then Result:=True;
    U_FISH5:     if (StdItem.StdMode = 84) then Result:=True;

  end;
end;


function  GetGoldStr (gold: integer): string;   //陛傈
var
   i, n: integer;
   str: string;
begin
   str := IntToStr (gold);
   n := 0;
   Result := '';
   for i:=Length(str) downto 1 do begin
      if n = 3 then begin
         Result := str[i] + ',' + Result;
         n := 1;
      end else begin
         Result := str[i] + Result;
         Inc(n);
      end;
   end;
end;

function GetTakeOnPosition(smode: integer): integer;
begin
  Result := -1;
  case smode of
    5, 6, 7, 90, 99    :Result := U_WEAPON;   //公扁 ,殿急 公扁 (寒趋 劳急 全泅 厚楷)
    10, 11, 12      :Result := U_DRESS;//渴  ,殿急 渴 (寒趋 劳急 全泅 厚楷)
    15          :Result := U_HELMET;   //捧备
    19, 20, 21  :Result := U_NECKLACE; //格吧捞
    22, 23      :Result := U_RINGL;    //馆瘤
    24, 26      :Result := U_ARMRINGL;  //迫骂
    30, 28, 29  :Result := U_RIGHTHAND;  //榷阂
    25, 51      :Result := U_BUJUK; //何利
    52, 62      :Result := U_BOOTS; //脚惯
    53, 63      :Result := U_CHARM; //荐龋籍
    54, 64      :Result := U_BELT;  //骇飘
  end;
end;

function AddDateTimeOfDay(DateTime:TDateTime;nDay:Integer):TDateTime;//00455DD4
var
  Year,Month,Day:Word;
begin
  if nDay > 0 then begin
    Dec(nDay);
    DecodeDate(DateTime,Year,Month,Day);
    while (True) do begin
      if MonthDays[False][Month] >= (Day + nDay) then break;
      nDay:=(Day + nDay) - MonthDays[False][Month] -1;
      Day:=1;
      if Month <= 11 then begin
        Inc(Month);
        Continue;
      end;
      Month:=1;
      if Year = 99 then begin
        Year:=2000;
        Continue;
      end;
      Inc(Year);
    end;    // while
    //TryEncodeDate(Year,Month,Day,Result);
    Inc(Day,nDay);
    Result:=EncodeDate(Year,Month,Day);
  end else begin
    Result:=DateTime;
  end;

end;
function GetGoldShape(nGold:Integer):Word;
//00455E98
begin
  Result:=112;
  if nGold >= 30 then Result:=113;
  if nGold >= 70 then Result:=114;
  if nGold >= 300 then Result:=115;
  if nGold >= 1000 then Result:=116;
end;
function GetRandomLook(nBaseLook,nRage:Integer):Integer; //00455EEC
begin
  Result:=nBaseLook + Random(nRage);
end;
function CheckGuildName(sGuildName:String):Boolean;//00455BF4
var
  I: Integer;
begin
  Result:=True;
  if length(sGuildName) > g_Config.nGuildNameLen then begin
    Result:=False;
    exit;
  end;    
  for I := 1 to length(sGuildname) do begin
    if (sGuildName[I] < '0'{30}) or
       (sGuildName[I] = '/'{2F}) or
       (sGuildName[I] = '\'{5C}) or
       (sGuildName[I] = ':'{3A}) or
       (sGuildName[I] = '*') or
       (sGuildName[I] = ' ') or       
       (sGuildName[I] = '"') or
       (sGuildName[I] = '''') or
       (sGuildName[I] = '<'{3C}) or
       (sGuildName[I] = '|'{7C}) or
       (sGuildName[I] = '?'{3F}) or
       (sGuildName[I] = '>'{3E}) then begin
      Result:=False;
    end;
  end;
end;
function GetItemNumber():Integer;//004E3E34
begin
  Inc(g_Config.nItemNumber);
  if g_Config.nItemNumber > (High(Integer) div 2 - 1) then begin
    g_Config.nItemNumber:=1;
  end;
  Result:=g_Config.nItemNumber;
end;
function GetItemNumberEx():Integer;
begin
  Inc(g_Config.nItemNumberEx);
  if g_Config.nItemNumberEx < High(Integer) div 2 then g_Config.nItemNumberEx:=High(Integer) div 2;
    
  if g_Config.nItemNumberEx > (High(Integer) - 1) then begin
    g_Config.nItemNumberEx:=High(Integer) div 2;
  end;
  Result:=g_Config.nItemNumberEx;
end;
function  FilterShowName(sName:String):String;
var
  I: Integer;
  sC:String;
  bo11:Boolean;
begin
  Result:='';
  sC:='';
  bo11:=False;
  for I := 1 to length(sName)do begin
    if ((sName[i] >= '0') and (sName[i] <= '9')) or (sName[i] = '-') then begin
      Result:=Copy(sName,1,I - 1);
      sC:=Copy(sName,i,length(sName));
      bo11:=True;
      break;
    end;
  end;
  if not bo11 then Result:=sName;    
end;

function  FilterStdShowName(Std:TItem; sName:String):String;
var
  I: Integer;
  sC:String;
  bo11:Boolean;
begin
  Result:='';
  sC:='';
  bo11:=False;
  for I := 1 to length(sName)do begin
    if Std.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,46,55,56,62,63,64] then begin
      if ((sName[i] >= '0') and (sName[i] <= '9')) or (sName[i] = '-') then begin
        Result:=Copy(sName,1,I - 1);
        sC:=Copy(sName,i,length(sName));
        bo11:=True;
        break;
      end;
    end;
  end;
  if not bo11 then Result:=sName;
end;

function  FilterStdShowName2(Std:TItem; sName:String):String;
var
  I: Integer;
  sC:String;
  bo11:Boolean;
begin
  Result:='';
  sC:='';
  bo11:=False;
  for I := 1 to length(sName)do begin
    if Std.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,55,56,62,63,64] then begin
      if ((sName[i] >= '0') and (sName[i] <= '9')) or (sName[i] = '-') then begin
        Result:=Copy(sName,1,I - 1);
        sC:=Copy(sName,i,length(sName));
        bo11:=True;
        break;
      end;
    end;
  end;
  if not bo11 then Result:=sName;
end;

function  GetValNameNo(sText:String):Integer; //0049ABF0
var
  nValNo:integer;
begin
  Result:= -1;
  if length(sText) >= 2 then begin
    if UpCase(sText[1]) = 'P' then begin
      nValNo:=Str_ToInt(sText[2], -1);
      if nValNo < 10 then Result:= nValNo;
    end;
    if UpCase(sText[1]) = 'G' then begin
      if length(sText) = 3 then begin
        nValNo:=Str_ToInt(Copy(sText,2,2), -1);
        if nValNo < 20 then Result:= nValNo + 100;
      end else begin
        nValNo:=Str_ToInt(sText[2], -1);
        if nValNo < 10 then Result:= nValNo + 100;
      end;
    end;
    if UpCase(sText[1]) = 'M' then begin
      if length(sText) = 3 then begin
        nValNo:=Str_ToInt(Copy(sText,2,2), -1);
        if nValNo < 100 then Result:= nValNo + 300;
      end else begin
        nValNo:=Str_ToInt(sText[2], -1);
        if nValNo < 10 then Result:= nValNo + 300;
      end;
    end;
    if UpCase(sText[1]) = 'I' then begin
      if length(sText) = 3 then begin
        nValNo:=Str_ToInt(Copy(sText,2,2), -1);
        if nValNo < 100 then Result:= nValNo + 400;
      end else begin
        nValNo:=Str_ToInt(sText[2], -1);
        if nValNo < 10 then Result:= nValNo + 400;
      end;
    end;
    if UpCase(sText[1]) = 'D' then begin
      nValNo:=Str_ToInt(sText[2], -1);
      if nValNo < 10 then Result:= nValNo + 200;
    end;
  end;
end;
function IsAccessory(nIndex:Integer):Boolean; //004B2E94
var
  Item:TItem;
begin
  Item:=UserEngine.GetStdItem(nIndex);
  if Item.ItemType = ITEM_ACCESSORY then Result:=True
  //if Item.StdMode in [19,20,21,22,23,24,26] then Result:=True
  else Result:=False;

end;

function  GetDisassembleCondition (itemname: string; var iPrice: Integer): TStringList;
var
   i: integer;
   sDisassembleName: string;
   sDisassemblePrice: string;
begin
   Result := nil;
   for i:=0 to g_DisassembleList.Count-1 do begin      //阿己盒秦
      sDisassemblePrice := GetValidStr3(g_DisassembleList[i], sDisassembleName, [':']);
      if sDisassembleName = itemname then begin
         Result := TStringList (g_DisassembleList.Objects[i]);
         iPrice := Str_ToInt(sDisassemblePrice, 0);
         break;
      end;
   end;
end;

function  GetWakeUpCondition (StdMode, mode, iValue, Grade: string): TStringList;
var
   i: integer;

   sWakeStdMode: string;
   sWakeMode: string;
   sWakeValue: string;
   sWakeGrade: string;
   sMsg: string;
begin
   Result := nil;
   for i := 0 to g_WakeItemList.Count - 1 do begin
      sMsg := g_WakeItemList[i];
      sMsg := GetValidStr3(sMsg, sWakeStdMode, [':']);
      sMsg := GetValidStr3(sMsg, sWakeMode, [':']);
      sWakeGrade := GetValidStr3(sMsg, sWakeValue, [':']);
      if (sWakeStdMode = StdMode) and (sWakeMode = mode) and (sWakeValue = iValue) and (sWakeGrade = Grade) then begin
           Result := TStringList (g_WakeItemList.Objects[i]);
           break;
      end;
   end;
end;

function  GetDismantleCondition (itemname: string; var iPrice: Integer): TStringList;
var
   i: integer;
   sDismantleName: string;
   sDismantlePrice: string;
begin
   Result := nil;
   for i:=0 to g_DismantleList.Count-1 do begin
      sDismantlePrice := GetValidStr3(g_DismantleList[i], sDismantleName, [':']);
      if sDismantleName = itemname then begin
         Result := TStringList (g_DismantleList.Objects[i]);
         iPrice := Str_ToInt(sDismantlePrice, 0);
         break;
      end;
   end;
end;
function  GetMakeItemCondition (itemname: string; var iPrice: Integer): TStringList;        //力炼胶媚
var
   i: integer;
   sMakeItemName: string;
   sMakeItemPrice: string;
begin
   Result := nil;
   for i:=0 to g_MakeItemList.Count-1 do begin
      sMakeItemPrice := GetValidStr3(g_MakeItemList[i], sMakeItemName, [':']);
      if sMakeItemName = itemname then begin
         Result := TStringList (g_MakeItemList.Objects[i]);
         iPrice := Str_ToInt(sMakeItemPrice, 0);
         break;
      end;
   end;
end;
function  GetChangeItemJob (itemname: string; sJob: integer): TStringList;
var
   i: integer;
   sChangeItemName: string;
   Job: string;
begin
   Result := nil;
   for i:=0 to g_ChangeItemList.Count-1 do begin
      Job := GetValidStr3(g_ChangeItemList[i], sChangeItemName, [':']);
      if sChangeItemName = itemname then begin


        if (99 = StrToint(Job)) then begin
          Result := TStringList (g_ChangeItemList.Objects[i]);
          break;
        end;

        if ((sJob = StrToint(Job)) or ((sJob-5)= StrToint(Job))) then begin
          Result := TStringList (g_ChangeItemList.Objects[i]);
          break;
        end;

      end;
   end;
end;

procedure AddGameDataLog(sMsg:String);
begin
  //调用插件中的日志处理函数，返回值为True 时直接退出函数，False 时使用默认函数处理游戏日志
  EnterCriticalSection(LogMsgCriticalSection);
  try
    LogStringList.Add(sMsg);
  finally
    LeaveCriticalSection(LogMsgCriticalSection);
  end;
end;
procedure AddLogonCostLog(sMsg:String);//004E437C
begin
  EnterCriticalSection(LogMsgCriticalSection);
  try
    LogonCostLogList.Add(sMsg);
  finally
    LeaveCriticalSection(LogMsgCriticalSection);
  end;
end;
procedure TrimStringList(sList:TStringList); //0x00455D48
var
  n8:Integer;
  sC:String;
begin
  n8:=0;
  while (True) do begin
    if (sList.Count) <= n8 then break;
    sC:=Trim(sList.Strings[n8]);
    if sC = '' then begin
      sList.Delete(n8);
      Continue;
    end;
    Inc(n8);
  end;
end;
function CanConsignItem(sItemName:String):Boolean;      //困殴 陛瘤
var
  I: Integer;
begin
  Result:=False;
  g_DisableConsignItemList.Lock;
  try
    for I := 0 to g_DisableConsignItemList.Count - 1 do begin
      if CompareText(g_DisableConsignItemList[I],sItemName) = 0 then begin
        Result:=True;
        exit;
      end;
    end;
  finally
    g_DisableConsignItemList.UnLock;
  end;
end;

function CanRentalItem(sItemName:String):Boolean;      //措咯 阂啊 陛瘤
var
  I: Integer;
begin
  Result:=False;
  g_DisableRentalItemList.Lock;
  try
    for I := 0 to g_DisableRentalItemList.Count - 1 do begin
      if CompareText(g_DisableRentalItemList[I],sItemName) = 0 then begin
        Result:=True;
        exit;
      end;
    end;
  finally
    g_DisableRentalItemList.UnLock;
  end;
end;

function CanMakeItem(sItemName:String):Boolean;
var
  I: Integer;
begin
  Result:=True;
  g_DisableMakeItemList.Lock;
  try
    for I := 0 to g_DisableMakeItemList.Count - 1 do begin
      if CompareText(g_DisableMakeItemList.Strings[I],sItemName) = 0 then begin
        Result:=False;
        exit;
      end;
    end;
  finally
    g_DisableMakeItemList.UnLock;
  end;
end;

function CanMoveMap(sMapName:String):Boolean;
var
  I: Integer;
begin
  Result:=True;
  g_DisableMoveMapList.Lock;
  try
    for I := 0 to g_DisableMoveMapList.Count - 1 do begin
      if CompareText(g_DisableMoveMapList.Strings[I],sMapName) = 0 then begin
        Result:=False;
        break;
      end;
    end;
  finally
    g_DisableMoveMapList.UnLock;
  end;
end;

function CanSellItem(sItemName:String):Boolean;
var
  i:Integer;
begin
  Result:=True;
  g_DisableSellOffList.Lock;
  try
    for i := 0 to g_DisableSellOffList.Count - 1 do begin
      if CompareText(g_DisableSellOffList.Strings[i],sItemName) = 0 then begin
        Result:=False;
        break;
      end;
    end;
  finally
    g_DisableSellOffList.UnLock;
  end;
end;

function LoadItemBindIPaddr():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText,sMakeIndex,sItemIndex,sBindName:String;
  nMakeIndex,nItemIndex:Integer;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindIPaddr.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_ItemBindIPaddr.Lock;
    try
      for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
        Dispose(pTItemBind(g_ItemBindIPaddr.Items[I]));
      end;
      g_ItemBindIPaddr.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        sLineText:=Trim(LoadList.Strings[I]);
        if sLineText[1] = ';' then Continue;
        sLineText:=GetValidStr3(sLineText,sItemIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sMakeIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sBindName,[' ',',',#9]);
        nMakeIndex:=Str_ToInt(sMakeIndex,-1);
        nItemIndex:=Str_ToInt(sItemIndex,-1);
        if (nMakeIndex > 0) and (nItemIndex > 0) and (sBindName <> '') then begin
          New(ItemBind);
          ItemBind.nMakeIdex:=nMakeIndex;
          ItemBind.nItemIdx:=nItemIndex;
          ItemBind.sBindName:=sBindName;
          g_ItemBindIPaddr.Add(ItemBind);
        end;
      end;
    finally
      g_ItemBindIPaddr.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveItemBindIPaddr():Boolean;
var
  I:integer;
  SaveList:TStringList;
  sFileName:String;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindIPaddr.txt';
  SaveList:=TStringList.Create;
  g_ItemBindIPaddr.Lock;
  try
    for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
      ItemBind:=g_ItemBindIPaddr.Items[I];
      SaveList.Add(IntToStr(ItemBind.nItemIdx) + #9 + IntToStr(ItemBind.nMakeIdex) + #9 + ItemBind.sBindName);
    end;
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  SaveList.SaveToFile(sFileName);
  SaveList.Free;
  Result:=True;
end;
function LoadItemBindAccount():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText,sMakeIndex,sItemIndex,sBindName:String;
  nMakeIndex,nItemIndex:Integer;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindAccount.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_ItemBindAccount.Lock;
    try
      for I := 0 to g_ItemBindAccount.Count - 1 do begin
        Dispose(pTItemBind(g_ItemBindAccount.Items[I]));
      end;
      g_ItemBindAccount.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        sLineText:=Trim(LoadList.Strings[I]);
        if sLineText[1] = ';' then Continue;
        sLineText:=GetValidStr3(sLineText,sItemIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sMakeIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sBindName,[' ',',',#9]);
        nMakeIndex:=Str_ToInt(sMakeIndex,-1);
        nItemIndex:=Str_ToInt(sItemIndex,-1);
        if (nMakeIndex > 0) and (nItemIndex > 0) and (sBindName <> '') then begin
          New(ItemBind);
          ItemBind.nMakeIdex:=nMakeIndex;
          ItemBind.nItemIdx:=nItemIndex;
          ItemBind.sBindName:=sBindName;
          g_ItemBindAccount.Add(ItemBind);
        end;
      end;
    finally
      g_ItemBindAccount.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveItemBindAccount():Boolean;
var
  I:integer;
  SaveList:TStringList;
  sFileName:String;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindAccount.txt';
  SaveList:=TStringList.Create;
  g_ItemBindAccount.Lock;
  try
    for I := 0 to g_ItemBindAccount.Count - 1 do begin
      ItemBind:=g_ItemBindAccount.Items[I];
      SaveList.Add(IntToStr(ItemBind.nItemIdx) + #9 + IntToStr(ItemBind.nMakeIdex) + #9 + ItemBind.sBindName);
    end;
  finally
    g_ItemBindAccount.UnLock;
  end;
  SaveList.SaveToFile(sFileName);
  SaveList.Free;
  Result:=True;
end;
function LoadItemBindCharName():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText,sMakeIndex,sItemIndex,sBindName:String;
  nMakeIndex,nItemIndex:Integer;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindChrName.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_ItemBindCharName.Lock;
    try
      for I := 0 to g_ItemBindCharName.Count - 1 do begin
        Dispose(pTItemBind(g_ItemBindCharName.Items[I]));
      end;
      g_ItemBindCharName.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        sLineText:=Trim(LoadList.Strings[I]);
        if sLineText[1] = ';' then Continue;
        sLineText:=GetValidStr3(sLineText,sItemIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sMakeIndex,[' ',',',#9]);
        sLineText:=GetValidStr3(sLineText,sBindName,[' ',',',#9]);
        nMakeIndex:=Str_ToInt(sMakeIndex,-1);
        nItemIndex:=Str_ToInt(sItemIndex,-1);
        if (nMakeIndex > 0) and (nItemIndex > 0) and (sBindName <> '') then begin
          New(ItemBind);
          ItemBind.nMakeIdex:=nMakeIndex;
          ItemBind.nItemIdx:=nItemIndex;
          ItemBind.sBindName:=sBindName;
          g_ItemBindCharName.Add(ItemBind);
        end;
      end;
    finally
      g_ItemBindCharName.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function SaveItemBindCharName():Boolean;
var
  I:integer;
  SaveList:TStringList;
  sFileName:String;
  ItemBind:pTItemBind;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemBindChrName.txt';
  SaveList:=TStringList.Create;
  g_ItemBindCharName.Lock;
  try
    for I := 0 to g_ItemBindCharName.Count - 1 do begin
      ItemBind:=g_ItemBindCharName.Items[I];
      SaveList.Add(IntToStr(ItemBind.nItemIdx) + #9 + IntToStr(ItemBind.nMakeIdex) + #9 + ItemBind.sBindName);
    end;
  finally
    g_ItemBindCharName.UnLock;
  end;
  SaveList.SaveToFile(sFileName);
  SaveList.Free;
  Result:=True;
end;
function LoadDisableMakeItem():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableMakeItem.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableMakeItemList.Lock;
    try
      g_DisableMakeItemList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DisableMakeItemList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DisableMakeItemList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveDisableMakeItem():Boolean;
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableMakeItem.txt';
  g_DisableMakeItemList.Lock;
  try
    g_DisableMakeItemList.SaveToFile(sFileName);
  finally
    g_DisableMakeItemList.UnLock;
  end;
  Result:=True;
end;
function LoadDisableConsignItem():Boolean;      //困殴
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableConsignItem.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableConsignItemList.Lock;
    try
      g_DisableConsignItemList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DisableConsignItemList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DisableConsignItemList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveDisableConsignItem():Boolean;     //困殴
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableConsignItem.txt';
  g_DisableConsignItemList.Lock;
  try
    g_DisableConsignItemList.SaveToFile(sFileName);
  finally
    g_DisableConsignItemList.UnLock;
  end;
  Result:=True;
end;

function LoadDisableRentalItem():Boolean;      //困殴
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableRentalItem.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableRentalItemList.Lock;
    try
      g_DisableRentalItemList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DisableRentalItemList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DisableRentalItemList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveDisableRentalItem():Boolean;     //困殴
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableRentalItem.txt';
  g_DisableRentalItemList.Lock;
  try
    g_DisableRentalItemList.SaveToFile(sFileName);
  finally
    g_DisableRentalItemList.UnLock;
  end;
  Result:=True;
end;

function LoadDisableMoveMap():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableMoveMap.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableMoveMapList.Lock;
    try
      g_DisableMoveMapList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DisableMoveMapList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DisableMoveMapList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;
function SaveDisableMoveMap():Boolean;
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableMoveMap.txt';
  g_DisableMoveMapList.Lock;
  try
    g_DisableMoveMapList.SaveToFile(sFileName);
  finally
    g_DisableMoveMapList.UnLock;
  end;
  Result:=True;
end;

function LoadAllowSellOffItem():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'AllowSellOffItem.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableSellOffList.Lock;
    try
      g_DisableSellOffList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DisableSellOffList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DisableSellOffList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function SaveAllowSellOffItem():Boolean;
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'AllowSellOffItem.txt';
  g_DisableSellOffList.Lock;
  try
    g_DisableSellOffList.SaveToFile(sFileName);
  finally
    g_DisableSellOffList.UnLock;
  end;
  Result:=True;
end;

procedure LoadUserCmdList();    //蜡历疙飞绢
var
  i                         : Integer;
  sFileName                 : string;
  LoadList                  : TStringList;
  sLineText                 : string;
  sUserCmd                  : string;
  sCmdNo                    : string;
  nCmdNo                    : Integer;
begin
  sFileName := g_Config.sEnvirDir + 'UserCmdList.txt';
  if not FileExists(sFileName) then begin
    LoadList := Classes.TStringList.Create();
    LoadList.Add(';;不能更该命令，可以添加新的命令!!');
    LoadList.SaveToFile(sFileName);
    LoadList.Free;
    Exit;
  end;
  g_UserCmdList.Lock;
  try
    g_UserCmdList.Clear;
    LoadList := TStringList.Create();
    LoadList.LoadFromFile(sFileName);
    for i := 0 to LoadList.Count - 1 do begin
      sLineText := LoadList.Strings[i];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText := GetValidStr3(sLineText, sUserCmd, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sCmdNo, [' ', #9]);
        nCmdNo := Str_ToInt(sCmdNo, -1);
        if (sUserCmd <> '') and (nCmdNo >= 0) then
          g_UserCmdList.AddObject(sUserCmd, TObject(nCmdNo));
      end;
    end;
  finally
    g_UserCmdList.UnLock;
  end;
  LoadList.Free;
end;


procedure SaveUserCmdList();     //蜡历疙飞绢
var
  i                         : Integer;
  sFileName                 : string;
  LoadList                  : TStringList;
begin
  sFileName := g_Config.sEnvirDir + 'UserCmdList.txt';
  g_UserCmdList.Lock;
  try
    LoadList := TStringList.Create();
    for i := 0 to g_UserCmdList.Count - 1 do
      LoadList.Add(g_UserCmdList.Strings[i] + #9 + IntToStr(Integer(g_UserCmdList.Objects[i])));
  finally
    g_UserCmdList.UnLock;
  end;
  LoadList.SaveToFile(sFileName);
  LoadList.Free;
end;

function GetUseItemIdx(sName:String):Integer;
begin
  Result:=-1;
  if CompareText(sName,U_DRESSNAME) = 0 then begin
    Result:=0;
  end else
  if CompareText(sName,U_WEAPONNAME) = 0 then begin
    Result:=1;
  end else
  if CompareText(sName,U_RIGHTHANDNAME) = 0 then begin
    Result:=2;
  end else
  if CompareText(sName,U_NECKLACENAME) = 0 then begin
    Result:=3;
  end else
  if CompareText(sName,U_HELMETNAME) = 0 then begin
    Result:=4;
  end else
  if CompareText(sName,U_ARMRINGLNAME) = 0 then begin
    Result:=5;
  end else
  if CompareText(sName,U_ARMRINGRNAME) = 0 then begin
    Result:=6;
  end else
  if CompareText(sName,U_RINGLNAME) = 0 then begin
    Result:=7;
  end else
  if CompareText(sName,U_RINGRNAME) = 0 then begin
    Result:=8;
  end else
  if CompareText(sName,U_BUJUKNAME) = 0 then begin
    Result:=9;
  end else
  if CompareText(sName,U_BELTNAME) = 0 then begin
    Result:=10;
  end else
  if CompareText(sName,U_BOOTSNAME) = 0 then begin
    Result:=11;
  end else
  if CompareText(sName,U_CHARMNAME) = 0 then begin
    Result:=12;
  end;
  if CompareText(sName,U_TIGERNAME) = 0 then begin   //龋尔捞
    Result:=13;
  end;
end;

function GetUseItemName(nIndex:Integer):String;

begin
  case nIndex of
    0: Result:=U_DRESSNAME;
    1: Result:=U_WEAPONNAME;
    2: Result:=U_RIGHTHANDNAME;
    3: Result:=U_NECKLACENAME;
    4: Result:=U_HELMETNAME;
    5: Result:=U_ARMRINGLNAME;
    6: Result:=U_ARMRINGRNAME;
    7: Result:=U_RINGLNAME;
    8: Result:=U_RINGRNAME;
    9: Result:=U_BUJUKNAME;
    10:Result:=U_BELTNAME;
    11:Result:=U_BOOTSNAME;
    12:Result:=U_CHARMNAME;
    13:Result:=U_TIGERNAME; //龋尔捞
  end;
end;

function LoadDisableSendMsgList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableSendMsgList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DisableSendMsgList.Clear;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      g_DisableSendMsgList.Add(Trim(LoadList.Strings[I]));
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;


function SetSayItem(UserItem: pTUserItem): Integer;
begin
  Inc(g_SayItemIndex);
  if g_SayItemIndex > MAXSAYITEMCOUNT then
    g_SayItemIndex := 0;
  if g_SayItemIndex < 0 then
    g_SayItemIndex := 0;
  g_SayItemList[g_SayItemIndex] := UserItem^;
  Result := g_SayItemIndex;
end;

function GetSayItem(Index: Integer): pTUserItem;
begin
  Result := nil;
  if (Index >= 0) and (Index <= MAXSAYITEMCOUNT) then
    Result := @g_SayItemList[Index];
end;

function LoadMonDropLimitList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sLineText:String;
  sFileName:String;
  sItemName,sItemCount,sDataBool,sDataInt:String;
  nItemCount,nDataBool,nDataInt:Integer;
  MonDrop:pTMonDrop;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'MonDropLimitList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_MonDropLimitLIst.Clear;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=Trim(LoadList.Strings[I]);
      if (sLineText = '') or (sLineText[1] = ';') then Continue;
      sLineText:=GetValidStr3(sLineText, sItemName, [' ','/',',',#9]);
      sLineText:=GetValidStr3(sLineText, sItemCount, [' ','/',',',#9]);
      sLineText:=GetValidStr3(sLineText, sDataBool, [' ','/',',',#9]);
      sLineText:=GetValidStr3(sLineText, sDataInt, [' ','/',',',#9]);
      nItemCount:=Str_ToInt(sItemCount, -1);
      nDataBool:=Str_ToInt(sDataBool, 0);
      nDataInt:=Str_ToInt(sDataInt, 0);
      if (sItemName <> '') and (nItemCount >= 0) then begin
        New(MonDrop);
        MonDrop.sItemName:=sItemName;
        MonDrop.nDropCount:=0;
        MonDrop.nNoDropCount:=0;
        MonDrop.nCountLimit:=nItemCount;
        MonDrop.DateBool:=ByteToBool(nDataBool);
        MonDrop.DateLimit:=nDataInt;
        g_MonDropLimitList.AddObject(sItemName,TObject(MonDrop));
      end;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function SaveMonDropLimitList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  MonDrop:pTMonDrop;
begin
  sFileName:=g_Config.sEnvirDir + 'MonDropLimitList.txt';
  LoadList:=TStringList.Create;
  for I := 0 to g_MonDropLimitList.Count - 1 do begin
    MonDrop:=pTMonDrop(g_MonDropLimitList.Objects[I]);
    sLineText:=MonDrop.sItemName + #9 + IntToStr(MonDrop.nCountLimit) + #9 + IntToStr(BoolToInt(MonDrop.DateBool)) + #9 + IntToStr(MonDrop.DateLimit);
    LoadList.Add(sLineText);
  end;
  LoadList.SaveToFile(sFileName);
  LoadList.Free;
  Result:=True;
end;

function LoadDisableTakeOffList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sLineText:String;
  sFileName:String;
  sItemName,sItemIdx:String;
  nItemIdx:Integer;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DisableTakeOffList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    LoadList.LoadFromFile(sFileName);
    g_DisableTakeOffList.Lock;
    try
      g_DisableTakeOffList.Clear;
      for I := 0 to LoadList.Count - 1 do begin
        sLineText:=Trim(LoadList.Strings[I]);
        if (sLineText = '') or (sLineText[1] = ';') then Continue;
        sLineText:=GetValidStr3(sLineText, sItemName, [' ','/',',',#9]);
        sLineText:=GetValidStr3(sLineText, sItemIdx, [' ','/',',',#9]);
        nItemIdx:=Str_ToInt(sItemIdx,-1);
        if (sItemName <> '') and (nItemIdx >= 0) then begin
          g_DisableTakeOffList.AddObject(sItemName,TObject(nItemIdx));
        end;
      end;
    finally
      g_DisableTakeOffList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function SaveDisableTakeOffList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableTakeOffList.txt';
  LoadList:=TStringList.Create;
  g_DisableTakeOffList.Lock;
  try
    for I := 0 to g_DisableTakeOffList.Count - 1 do begin
      sLineText:=g_DisableTakeOffList.Strings[I] + #9 + IntToStr(Integer(g_DisableTakeOffList.Objects[I]));
      LoadList.Add(sLineText);
    end;
  finally
    g_DisableTakeOffList.UnLock;
  end;
  LoadList.SaveToFile(sFileName);
  LoadList.Free;
  Result:=True;
end;
function InDisableTakeOffList(nItemIdx:Integer):Boolean;
var
  I: Integer;
begin
  Result:=False;
  g_DisableTakeOffList.Lock;
  try
    for I := 0 to g_DisableTakeOffList.Count - 1 do begin
      if Integer(g_DisableTakeOffList.Objects[I]) = nItemIdx - 1 then begin
        Result:=True;
        break;
      end;        
    end;
  finally
    g_DisableTakeOffList.UnLock;
  end;
end;

function SaveDisableSendMsgList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'DisableSendMsgList.txt';
  LoadList:=TStringList.Create;
  for I := 0 to g_DisableSendMsgList.Count - 1 do begin
    LoadList.Add(g_DisableSendMsgList.Strings[I]);
  end;
  LoadList.SaveToFile(sFileName);
  LoadList.Free;
  Result:=True;
end;
function GetDisableSendMsgList(sHumanName:String):Boolean;
var
  I: Integer;
begin
  Result:=False;
  for I := 0 to g_DisableSendMsgList.Count - 1 do begin
    if CompareText(sHumanName,g_DisableSendMsgList.Strings[I]) = 0 then begin
      Result:=True;
      break;
    end;
  end;
end;
function LoadGameLogItemNameList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'GameLogItemNameList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_GameLogItemNameList.Lock;
    try
      g_GameLogItemNameList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_GameLogItemNameList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_GameLogItemNameList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function GetGameLogItemNameList(sItemName:String):Byte;
var
  I: Integer;
begin
  Result:=0;
  g_GameLogItemNameList.Lock;
  try
    for I := 0 to g_GameLogItemNameList.Count - 1 do begin
      if CompareText(sItemName,g_GameLogItemNameList.Strings[I]) = 0 then begin
        Result:=1;
        break;
      end;
    end;
  finally
    g_GameLogItemNameList.UnLock;
  end;
end;

function SaveGameLogItemNameList():Boolean;
var
  sFileName:String;
begin
  sFileName:=g_Config.sEnvirDir + 'GameLogItemNameList.txt';
  g_GameLogItemNameList.Lock;
  try
    g_GameLogItemNameList.SaveToFile(sFileName);
  finally
    g_GameLogItemNameList.UnLock;
  end;
  Result:=True;
end;

function checkUPItemname(itemlist:TList; Name:String):Boolean;    //犁访
var
  I:integer;
  waiItem:pTUpwaiItem;
begin
  Result:= false;
  if itemlist.Count < 0 then Exit;
  for I := 0 to itemlist.Count - 1 do begin
    waiItem := itemlist.Items[i];
    if waiItem.Names = Name then begin
     Result:= true;
     break;
    end;
  end;
end;

function checkUPItemnameidx(itemlist:TList; Name:string; idx:Integer):Boolean;      //犁访
var
  I:integer;
  waiItem:pTUpwaiItem;
begin
  Result:= false;
  if itemlist.Count < 0 then Exit;
  for I := 0 to itemlist.Count - 1 do begin
    waiItem := itemlist.Items[i];
    if (waiItem.Names = Name) and (waiItem.ItemID = idx) then begin
      Result:= true;
      break
    end;
  end;
end;

function LoadDenyIPAddrList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DenyIPAddrList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DenyIPAddrList.Lock;
    try
      g_DenyIPAddrList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DenyIPAddrList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DenyIPAddrList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function GetDenyIPAddrList(sIPaddr:String):Boolean;
var
  I: Integer;
begin
  Result:=False;
  g_DenyIPAddrList.Lock;
  try
    for I := 0 to g_DenyIPAddrList.Count - 1 do begin
      if CompareText(sIPaddr,g_DenyIPAddrList.Strings[I]) = 0 then begin
        Result:=True;
        break;
      end;
    end;
  finally
    g_DenyIPAddrList.UnLock;
  end;
end;

function SaveDenyIPAddrList():Boolean;
var
  I:Integer;
  sFileName:String;
  SaveList:TStringList;
begin
  sFileName:=g_Config.sEnvirDir + 'DenyIPAddrList.txt';
  SaveList:=TStringList.Create;
  g_DenyIPAddrList.Lock;
  try
    for I := 0 to g_DenyIPAddrList.Count - 1 do begin
      if Integer(g_DenyIPAddrList.Objects[I]) <> 0 then begin
        SaveList.Add(g_DenyIPAddrList.Strings[I]);
      end;
    end;
    SaveList.SaveToFile(sFileName);
  finally
    g_DenyIPAddrList.UnLock;
  end;
  SaveList.Free;
  Result:=True;
end;

function LoadDenyChrNameList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DenyChrNameList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DenyChrNameList.Lock;
    try
      g_DenyChrNameList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DenyChrNameList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DenyChrNameList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function GetDenyChrNameList(sChrName:String):Boolean;
var
  I: Integer;
begin
  Result:=False;
  g_DenyChrNameList.Lock;
  try
    for I := 0 to g_DenyChrNameList.Count - 1 do begin
      if CompareText(sChrName,g_DenyChrNameList.Strings[I]) = 0 then begin
        Result:=True;
        break;
      end;
    end;
  finally
    g_DenyChrNameList.UnLock;
  end;
end;

function SaveDenyChrNameList():Boolean;
var
  I:Integer;
  sFileName:String;
  SaveList:TStringList;
begin
  sFileName:=g_Config.sEnvirDir + 'DenyChrNameList.txt';
  SaveList:=TStringList.Create;
  g_DenyChrNameList.Lock;
  try
    for I := 0 to g_DenyChrNameList.Count - 1 do begin
      if Integer(g_DenyChrNameList.Objects[I]) <> 0 then begin
        SaveList.Add(g_DenyChrNameList.Strings[I]);
      end;
    end;
    SaveList.SaveToFile(sFileName);
  finally
    g_DenyChrNameList.UnLock;
  end;
  SaveList.Free;
  Result:=True;
end;

function LoadDenyAccountList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DenyAccountList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DenyAccountList.Lock;
    try
      g_DenyAccountList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DenyAccountList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DenyAccountList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function GetDenyHDDList(sHddName:String):Boolean;    //荐沥登菌嚼聪促.
var
  I: Integer;
begin
  Result:=False;
  g_DenyHDDList.Lock;
  try
    for I := 0 to g_DenyHDDList.Count - 1 do begin
      if CompareText(sHddName,g_DenyHDDList.Strings[I]) = 0 then begin
        Result:=True;
        break;
      end;
    end;
  finally
    g_DenyHDDList.UnLock;
  end;
end;

function LoadDenyHDDList():Boolean;       //荐沥登菌嚼聪促.
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'DenyHDDList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_DenyHDDList.Lock;
    try
      g_DenyHDDList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_DenyHDDList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_DenyHDDList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function SaveDenyHDDList():Boolean;              //荐沥登菌嚼聪促.
var
  I:Integer;
  sFileName:String;
  SaveList:TStringList;
begin
  sFileName:=g_Config.sEnvirDir + 'DenyHDDList.txt';
  SaveList:=TStringList.Create;
  g_DenyHDDList.Lock;
  try
    for I := 0 to g_DenyHDDList.Count - 1 do begin
      if Integer(g_DenyHDDList.Objects[I]) <> 0 then begin
        SaveList.Add(g_DenyHDDList.Strings[I]);
      end;
    end;
    SaveList.SaveToFile(sFileName);
  finally
    g_DenyHDDList.UnLock;
  end;
  SaveList.Free;
  Result:=True;
end;

function GetDenyAccountList(sAccount:String):Boolean;
var
  I: Integer;
begin
  Result:=False;
  g_DenyAccountList.Lock;
  try
    for I := 0 to g_DenyAccountList.Count - 1 do begin
      if CompareText(sAccount,g_DenyAccountList.Strings[I]) = 0 then begin
        Result:=True;
        break;
      end;
    end;
  finally
    g_DenyAccountList.UnLock;
  end;
end;

function SaveDenyAccountList():Boolean;
var
  I: Integer;
  sFileName:String;
  SaveList:TStringList;
begin
  sFileName:=g_Config.sEnvirDir + 'DenyAccountList.txt';
  SaveList:=TStringList.Create;
  g_DenyAccountList.Lock;
  try
    for I := 0 to g_DenyAccountList.Count - 1 do begin
      if Integer(g_DenyAccountList.Objects[I]) <> 0 then begin
        SaveList.Add(g_DenyAccountList.Strings[I]);
      end;
    end;
    SaveList.SaveToFile(sFileName);
  finally
    g_DenyAccountList.UnLock;
  end;
  SaveList.Free;
  Result:=True;
end;

function LoadNoClearMonList():Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'NoClearMonList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    g_NoClearMonList.Lock;
    try
      g_NoClearMonList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        g_NoClearMonList.Add(Trim(LoadList.Strings[I]));
      end;
    finally
      g_NoClearMonList.UnLock;
    end;
    Result:=True;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function GetNoClearMonList(sMonName:String):Boolean;
var
  I: Integer;
begin
  Result:=False;
  g_NoClearMonList.Lock;
  try
    for I := 0 to g_NoClearMonList.Count - 1 do begin
      if CompareText(sMonName,g_NoClearMonList.Strings[I]) = 0 then begin
        Result:=True;
        break;
      end;
    end;
  finally
    g_NoClearMonList.UnLock;
  end;
end;

function SaveNoClearMonList():Boolean;
var
  I: Integer;
  sFileName:String;
  SaveList:TStringList;
begin
  sFileName:=g_Config.sEnvirDir + 'NoClearMonList.txt';
  SaveList:=TStringList.Create;
  g_NoClearMonList.Lock;
  try
    for I := 0 to g_NoClearMonList.Count - 1 do begin
      SaveList.Add(g_NoClearMonList.Strings[I]);
    end;
    SaveList.SaveToFile(sFileName);
  finally
    g_NoClearMonList.UnLock;
  end;
  SaveList.Free;
  Result:=True;
end;

function LoadMonSayMsg():Boolean;
var
  I,II:integer;
  sStatus,sRate,sColor,sMonName,sSayMsg:String;
  nStatus,nRate,nColor:Integer;
  LoadList:TStringList;
  sLineText:String;
  MonSayMsg:pTMonSayMsg;
  sFileName:String;
  MonSayList:TList;
  boSearch:Boolean;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'MonSayMsg.txt';
  if FileExists(sFileName) then begin
    g_MonSayMsgList.Clear;
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=Trim(LoadList.Strings[I]);
      if (sLineText <> '') and (sLineText[1] < ';') then begin
        sLineText:=GetValidStr3(sLineText, sStatus, [' ','/',',',#9]);
        sLineText:=GetValidStr3(sLineText, sRate, [' ','/',',',#9]);
        sLineText:=GetValidStr3(sLineText, sColor, [' ','/',',',#9]);
        sLineText:=GetValidStr3(sLineText, sMonName, [' ','/',',',#9]);
        sLineText:=GetValidStr3(sLineText, sSayMsg, [' ','/',',',#9]);
        if (sStatus <> '') and (sRate <> '')and (sColor <> '') and (sMonName <> '') and (sSayMsg <> '') then begin
          nStatus:=Str_ToInt(sStatus, -1);
          nRate:=Str_ToInt(sRate,-1);
          nColor:=Str_ToInt(sColor,-1);
          if (nStatus >= 0) and (nRate >= 0) and (nColor >= 0) then begin
            New(MonSayMsg);
            case nStatus of
              0: MonSayMsg.State:=s_KillHuman;
              1: MonSayMsg.State:=s_UnderFire;
              2: MonSayMsg.State:=s_Die;
              3: MonSayMsg.State:=s_MonGen;
              else MonSayMsg.State:=s_UnderFire;
            end;
            case nColor of
              0: MonSayMsg.Color:=c_Red;
              1: MonSayMsg.Color:=c_Green;
              2: MonSayMsg.Color:=c_Blue;
              3: MonSayMsg.Color:=c_White;
              else MonSayMsg.Color:=c_White;
            end;
            MonSayMsg.nRate:=nRate;
            MonSayMsg.sSayMsg:=sSayMsg;
            boSearch:=False;
            for II := 0 to g_MonSayMsgList.Count - 1 do begin
              if CompareText(g_MonSayMsgList.Strings[II],sMonName) = 0 then begin
                TList(g_MonSayMsgList.Objects[II]).Add(MonSayMsg);
                boSearch:=True;
                break;
              end;
            end;
            if not boSearch then begin
              MonSayList:=TList.Create;
              MonSayList.Add(MonSayMsg);
              g_MonSayMsgList.AddObject(sMonName,TObject(MonSayList));
            end;
          end;
        end;
      end;
    end;
    LoadList.Free;
    Result:=True;
  end;
end;

{$IF IniSystem = 0}
procedure LoadExp();
var
  I: Integer;
  LoadInteger:Integer;
  LoadString:String;
begin
  LoadInteger:=ExpConf.ReadInteger('Exp','KillMonExpMultiple',-1);
  if LoadInteger < 0 then begin
    ExpConf.WriteInteger('Exp','KillMonExpMultiple',g_Config.dwKillMonExpMultiple);
  end else begin
    g_Config.dwKillMonExpMultiple:=ExpConf.ReadInteger('Exp','KillMonExpMultiple',g_Config.dwKillMonExpMultiple);
  end;

  LoadInteger:=ExpConf.ReadInteger('Exp','HighLevelKillMonFixExp',-1);
  if LoadInteger < 0 then begin
    ExpConf.WriteBool('Exp','HighLevelKillMonFixExp',g_Config.boHighLevelKillMonFixExp);
  end else begin
    g_Config.boHighLevelKillMonFixExp:=ExpConf.ReadBool('Exp','HighLevelKillMonFixExp',g_Config.boHighLevelKillMonFixExp);
  end;

  for I := 1 to high(g_Config.dwNeedExps) do begin
    LoadString:=ExpConf.ReadString('Exp','Level' + IntToStr(I),'');
    LoadInteger:=Str_ToInt(LoadString,0);
    if LoadInteger = 0 then begin
      ExpConf.WriteString('Exp','Level' + IntToStr(I),IntToStr(g_dwOldNeedExps[I]));
      g_Config.dwNeedExps[I]:=g_dwOldNeedExps[I];
    end else begin
      g_Config.dwNeedExps[I]:=LoadInteger;
    end;
  end;

  for I := 1 to high(g_Config.dwNeedGuldExps) do begin
    LoadString:=ExpConf.ReadString('GuildExp','GuildLevel' + IntToStr(I),'');
    LoadInteger:=Str_ToInt(LoadString,0);
    if LoadInteger = 0 then begin
      ExpConf.WriteString('GuildExp','GuildLevel' + IntToStr(I),IntToStr(g_dwOldNeedGuldExps[I]));
      g_Config.dwNeedGuldExps[I]:=g_dwOldNeedGuldExps[I];
    end else begin
      g_Config.dwNeedGuldExps[I]:=LoadInteger;
    end;
  end;

  for I := 1 to high(g_Config.dwHeroNeedExps) do begin
    LoadString := ExpConf.ReadString('HeroExp', 'Level' + IntToStr(I), '');
    LoadInteger := Str_ToInt(LoadString, 0);
    if LoadInteger = 0 then begin
      ExpConf.WriteString('HeroExp', 'Level' + IntToStr(I), IntToStr(g_dwHeroNeedExps[I]));
      g_Config.dwHeroNeedExps[I] := g_dwHeroNeedExps[I];
    end else begin
      g_Config.dwHeroNeedExps[I] := LongWord(LoadInteger);
    end;
  end;

{$IF OEMVER = OEM775}
  for I := 1 to high(g_LevelInfo) do begin
    LoadInteger:=Level775.ReadInteger('HP','HP' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('HP','HP' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wHP:=Level775.ReadInteger('HP','HP' + IntToStr(I),g_LevelInfo[I].wHP);
    end;

    LoadInteger:=Level775.ReadInteger('MP','MP' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MP','MP' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMP:=Level775.ReadInteger('MP','MP' + IntToStr(I),g_LevelInfo[I].wMP);
    end;

    LoadString:=Level775.ReadString('Exp','Exp' + IntToStr(I),'');
    LoadInteger:=Str_ToInt(LoadString,0);
    if LoadInteger = 0 then begin
      Level775.WriteString('Exp','Exp' + IntToStr(I),'1000');
      g_LevelInfo[I].dwExp:=g_dwOldNeedExps[I];
    end else begin
      g_LevelInfo[I].dwExp:=LoadInteger;
    end;

    LoadInteger:=Level775.ReadInteger('AC','AC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('AC','AC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wAC:=Level775.ReadInteger('AC','AC' + IntToStr(I),g_LevelInfo[I].wAC);
    end;

    LoadInteger:=Level775.ReadInteger('MaxAC','MaxAC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MaxAC','MaxAC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMaxAC:=Level775.ReadInteger('MaxAC','MaxAC' + IntToStr(I),g_LevelInfo[I].wMaxAC);
    end;
    LoadInteger:=Level775.ReadInteger('ACLimit','ACLimit' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('ACLimit','ACLimit' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wACLimit:=Level775.ReadInteger('ACLimit','ACLimit' + IntToStr(I),g_LevelInfo[I].wACLimit);
    end;

    LoadInteger:=Level775.ReadInteger('MAC','MAC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MAC','MAC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMAC:=Level775.ReadInteger('MAC','MAC' + IntToStr(I),g_LevelInfo[I].wMAC);
    end;

    LoadInteger:=Level775.ReadInteger('MaxMAC','MaxMAC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MaxMAC','MaxMAC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMaxMAC:=Level775.ReadInteger('MaxMAC','MaxMAC' + IntToStr(I),g_LevelInfo[I].wMaxMAC);
    end;
    LoadInteger:=Level775.ReadInteger('MACLimit','MACLimit' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MACLimit','MACLimit' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMACLimit:=Level775.ReadInteger('MACLimit','MACLimit' + IntToStr(I),g_LevelInfo[I].wMACLimit);
    end;

    LoadInteger:=Level775.ReadInteger('DC','DC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('DC','DC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wDC:=Level775.ReadInteger('DC','DC' + IntToStr(I),g_LevelInfo[I].wDC);
    end;

    LoadInteger:=Level775.ReadInteger('MaxDC','MaxDC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MaxDC','MaxDC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMaxDC:=Level775.ReadInteger('MaxDC','MaxDC' + IntToStr(I),g_LevelInfo[I].wMaxDC);
    end;
    LoadInteger:=Level775.ReadInteger('DCLimit','DCLimit' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('DCLimit','DCLimit' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wDCLimit:=Level775.ReadInteger('DCLimit','DCLimit' + IntToStr(I),g_LevelInfo[I].wDCLimit);
    end;

    LoadInteger:=Level775.ReadInteger('MC','MC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MC','MC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMC:=Level775.ReadInteger('MC','MC' + IntToStr(I),g_LevelInfo[I].wMC);
    end;

    LoadInteger:=Level775.ReadInteger('MaxMC','MaxMC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MaxMC','MaxMC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMaxMC:=Level775.ReadInteger('MaxMC','MaxMC' + IntToStr(I),g_LevelInfo[I].wMaxMC);
    end;
    LoadInteger:=Level775.ReadInteger('MCLimit','MCLimit' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MCLimit','MCLimit' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMCLimit:=Level775.ReadInteger('MCLimit','MCLimit' + IntToStr(I),g_LevelInfo[I].wMCLimit);
    end;

    LoadInteger:=Level775.ReadInteger('SC','SC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('SC','SC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wSC:=Level775.ReadInteger('SC','SC' + IntToStr(I),g_LevelInfo[I].wSC);
    end;

    LoadInteger:=Level775.ReadInteger('MaxSC','MaxSC' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('MaxSC','MaxSC' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wMaxSC:=Level775.ReadInteger('MaxSC','MaxSC' + IntToStr(I),g_LevelInfo[I].wMaxSC);
    end;
    LoadInteger:=Level775.ReadInteger('SCLimit','SCLimit' + IntToStr(I),-1);
    if LoadInteger < 0 then begin
      Level775.WriteInteger('SCLimit','SCLimit' + IntToStr(I),100);
    end else begin
      g_LevelInfo[I].wSCLimit:=Level775.ReadInteger('SCLimit','SCLimit' + IntToStr(I),g_LevelInfo[I].wSCLimit);
    end;
  end;
{$IFEND}
end;
{$IFEND}

procedure LoadGameCommand();
var
  LoadString:String;
  nLoadInteger:Integer;
begin
  LoadString:=CommandConf.ReadString('Command','Date','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Date',g_GameCommand.DATA.sCmd)
  else g_GameCommand.DATA.sCmd:=LoadString;

  nLoadInteger:=CommandConf.ReadInteger('Permission','Date',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Date', g_GameCommand.DATA.nPermissionMin)
  else g_GameCommand.DATA.nPermissionMin:=nLoadInteger;
  
  LoadString:=CommandConf.ReadString('Command','PrvMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PrvMsg',g_GameCommand.PRVMSG.sCmd)
  else g_GameCommand.PRVMSG.sCmd:=LoadString;

  nLoadInteger:=CommandConf.ReadInteger('Permission','PrvMsg',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PrvMsg', g_GameCommand.PRVMSG.nPermissionMin)
  else g_GameCommand.PRVMSG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AllowMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AllowMsg',g_GameCommand.ALLOWMSG.sCmd)
  else g_GameCommand.ALLOWMSG.sCmd:=LoadString;

  nLoadInteger:=CommandConf.ReadInteger('Permission','AllowMsg',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AllowMsg', g_GameCommand.ALLOWMSG.nPermissionMin)
  else g_GameCommand.ALLOWMSG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','BanStore','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BanStore',g_GameCommand.BANSTORE.sCmd)
  else g_GameCommand.BANSTORE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','LetShout','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LetShout',g_GameCommand.LETSHOUT.sCmd)
  else g_GameCommand.LETSHOUT.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','LetTrade','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LetTrade',g_GameCommand.LETTRADE.sCmd)
  else g_GameCommand.LETTRADE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','LetGuild','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LetGuild',g_GameCommand.LETGUILD.sCmd)
  else g_GameCommand.LETGUILD.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','Energy','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Energy',g_GameCommand.ENERGY.sCmd)
  else g_GameCommand.ENERGY.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','EndGuild','');
  if LoadString = '' then
    CommandConf.WriteString('Command','EndGuild',g_GameCommand.ENDGUILD.sCmd)
  else g_GameCommand.ENDGUILD.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','BanGuildChat','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BanGuildChat',g_GameCommand.BANGUILDCHAT.sCmd)
  else g_GameCommand.BANGUILDCHAT.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','BanSysMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BanSysMsg',g_GameCommand.BANSYSMSG.sCmd)
  else g_GameCommand.BANSYSMSG.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','BanHearMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BanHearMsg',g_GameCommand.BANHEARMSG.sCmd)
  else g_GameCommand.BANHEARMSG.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','BanGroupChat','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BanGroupChat',g_GameCommand.BANGROUPCHAT.sCmd)
  else g_GameCommand.BANGROUPCHAT.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','AuthAlly','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AuthAlly',g_GameCommand.AUTHALLY.sCmd)
  else g_GameCommand.AUTHALLY.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','Alliance','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Alliance',g_GameCommand.ALLIANCE.sCmd)
  else g_GameCommand.ALLIANCE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','CancelAlliance','');
  if LoadString = '' then
    CommandConf.WriteString('Command','CancelAlliance',g_GameCommand.CANCELALLIANCE.sCmd)
  else g_GameCommand.CANCELALLIANCE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','ViewDiary','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ViewDiary',g_GameCommand.DIARY.sCmd)
  else g_GameCommand.DIARY.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','UserMove','');
  if LoadString = '' then
    CommandConf.WriteString('Command','UserMove',g_GameCommand.USERMOVE.sCmd)
  else g_GameCommand.USERMOVE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','Searching','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Searching',g_GameCommand.SEARCHING.sCmd)
  else g_GameCommand.SEARCHING.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','AllowGroupCall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AllowGroupCall',g_GameCommand.ALLOWGROUPCALL.sCmd)
  else g_GameCommand.ALLOWGROUPCALL.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','GroupCall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GroupCall',g_GameCommand.GROUPRECALLL.sCmd)
  else g_GameCommand.GROUPRECALLL.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','AllowGuildReCall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AllowGuildReCall',g_GameCommand.ALLOWGUILDRECALL.sCmd)
  else g_GameCommand.ALLOWGUILDRECALL.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','GuildReCall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GuildReCall',g_GameCommand.GUILDRECALLL.sCmd)
  else g_GameCommand.GUILDRECALLL.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','StorageUnLock','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageUnLock',g_GameCommand.UNLOCKSTORAGE.sCmd)
  else g_GameCommand.UNLOCKSTORAGE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','PasswordUnLock','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PasswordUnLock',g_GameCommand.UNLOCK.sCmd)
  else g_GameCommand.UNLOCK.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','StorageLock','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageLock',g_GameCommand.LOCK.sCmd)
  else g_GameCommand.LOCK.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','StorageSetPassword','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageSetPassword',g_GameCommand.SETPASSWORD.sCmd)
  else g_GameCommand.SETPASSWORD.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','PasswordLock','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PasswordLock',g_GameCommand.PASSWORDLOCK.sCmd)
  else g_GameCommand.PASSWORDLOCK.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','StorageChgPassword','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageChgPassword',g_GameCommand.CHGPASSWORD.sCmd)
  else g_GameCommand.CHGPASSWORD.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','StorageClearPassword','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageClearPassword',g_GameCommand.CLRPASSWORD.sCmd)
  else g_GameCommand.CLRPASSWORD.sCmd:=LoadString;

  nLoadInteger:=CommandConf.ReadInteger('Permission','StorageClearPassword',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','StorageClearPassword', g_GameCommand.CLRPASSWORD.nPermissionMin)
  else g_GameCommand.CLRPASSWORD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','StorageUserClearPassword','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StorageUserClearPassword',g_GameCommand.UNPASSWORD.sCmd)
  else g_GameCommand.UNPASSWORD.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','MemberFunc','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MemberFunc',g_GameCommand.MEMBERFUNCTION.sCmd)
  else g_GameCommand.MEMBERFUNCTION.sCmd:=LoadString;
  
  LoadString:=CommandConf.ReadString('Command','MemberFuncEx','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MemberFuncEx',g_GameCommand.MEMBERFUNCTIONEX.sCmd)
  else g_GameCommand.MEMBERFUNCTIONEX.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','DearRecall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DearRecall',g_GameCommand.DEARRECALL.sCmd)
  else g_GameCommand.DEARRECALL.sCmd:=LoadString;


  LoadString:=CommandConf.ReadString('Command','DearBreak','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DearBreak',g_GameCommand.DEARBREAK.sCmd)
  else g_GameCommand.DEARBREAK.sCmd:=LoadString;



  LoadString:=CommandConf.ReadString('Command','AttackMode','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AttackMode',g_GameCommand.ATTACKMODE.sCmd)
  else g_GameCommand.ATTACKMODE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','Rest','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Rest',g_GameCommand.REST.sCmd)
  else g_GameCommand.REST.sCmd:=LoadString;

   LoadString:=CommandConf.ReadString('Command','TakeOnHorse','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TakeOnHorse',g_GameCommand.TAKEONHORSE.sCmd)
  else g_GameCommand.TAKEONHORSE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','TakeOffHorse','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TakeOffHorse',g_GameCommand.TAKEOFHORSE.sCmd)
  else g_GameCommand.TAKEOFHORSE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','HumanLocal','');
  if LoadString = '' then
    CommandConf.WriteString('Command','HumanLocal',g_GameCommand.HUMANLOCAL.sCmd)
  else g_GameCommand.HUMANLOCAL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','HumanLocal',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','HumanLocal', g_GameCommand.HUMANLOCAL.nPermissionMin)
  else g_GameCommand.HUMANLOCAL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GMMove','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GMMove',g_GameCommand.MOVE.sCmd)
  else g_GameCommand.MOVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MoveMin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MoveMin', g_GameCommand.MOVE.nPermissionMin)
  else g_GameCommand.MOVE.nPermissionMin:=nLoadInteger;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MoveMax',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MoveMax', g_GameCommand.MOVE.nPermissionMax)
  else g_GameCommand.MOVE.nPermissionMax:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','PositionMove','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PositionMove',g_GameCommand.POSITIONMOVE.sCmd)
  else g_GameCommand.POSITIONMOVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','PositionMoveMin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PositionMoveMin', g_GameCommand.POSITIONMOVE.nPermissionMin)
  else g_GameCommand.POSITIONMOVE.nPermissionMin:=nLoadInteger;
  nLoadInteger:=CommandConf.ReadInteger('Permission','PositionMoveMax',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PositionMoveMax', g_GameCommand.POSITIONMOVE.nPermissionMax)
  else g_GameCommand.POSITIONMOVE.nPermissionMax:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','PositionGtMove','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PositionGtMove',g_GameCommand.POSITIONGTMOVE.sCmd)
  else g_GameCommand.POSITIONGTMOVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','PositionGtMoveMin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PositionGtMoveMin', g_GameCommand.POSITIONGTMOVE.nPermissionMin)
  else g_GameCommand.POSITIONGTMOVE.nPermissionMin:=nLoadInteger;


   LoadString:=CommandConf.ReadString('Command','HomeMove','');      //付阑捞悼
  if LoadString = '' then
    CommandConf.WriteString('Command','HomeMove',g_GameCommand.HOMEMOVE.sCmd)
  else g_GameCommand.HOMEMOVE.sCmd:=LoadString;

  LoadString:=CommandConf.ReadString('Command','ReAliveHome','');      //付阑何劝
  if LoadString = '' then
    CommandConf.WriteString('Command','ReAliveHome',g_GameCommand.REALIVEHOME.sCmd)
  else g_GameCommand.REALIVEHOME.sCmd:=LoadString;


  LoadString:=CommandConf.ReadString('Command','MASKCLEAR','');      //付阑何劝
  if LoadString = '' then
    CommandConf.WriteString('Command','MASKCLEAR',g_GameCommand.MASKCLEAR.sCmd)
  else g_GameCommand.MASKCLEAR.sCmd:=LoadString;


  LoadString:=CommandConf.ReadString('Command','GMEVENT','');        //gm 捞亥飘
  if LoadString = '' then
    CommandConf.WriteString('Command','GMEVENT',g_GameCommand.GMEVENT.sCmd)
  else g_GameCommand.GMEVENT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','GMEVENT',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GMEVENT', g_GameCommand.GMEVENT.nPermissionMin)
  else g_GameCommand.GMEVENT.nPermissionMin:=nLoadInteger;



  LoadString:=CommandConf.ReadString('Command','Info','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Info',g_GameCommand.INFO.sCmd)
  else g_GameCommand.INFO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Info',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Info', g_GameCommand.INFO.nPermissionMin)
  else g_GameCommand.INFO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MobLevel','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MobLevel',g_GameCommand.MOBLEVEL.sCmd)
  else g_GameCommand.MOBLEVEL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MobLevel',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MobLevel', g_GameCommand.MOBLEVEL.nPermissionMin)
  else g_GameCommand.MOBLEVEL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MobCount','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MobCount',g_GameCommand.MOBCOUNT.sCmd)
  else g_GameCommand.MOBCOUNT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MobCount',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MobCount', g_GameCommand.MOBCOUNT.nPermissionMin)
  else g_GameCommand.MOBCOUNT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','HumanCount','');
  if LoadString = '' then
    CommandConf.WriteString('Command','HumanCount',g_GameCommand.HUMANCOUNT.sCmd)
  else g_GameCommand.HUMANCOUNT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','HumanCount',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','HumanCount', g_GameCommand.HUMANCOUNT.nPermissionMin)
  else g_GameCommand.HUMANCOUNT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Map','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Map',g_GameCommand.MAP.sCmd)
  else g_GameCommand.MAP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Map',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Map', g_GameCommand.MAP.nPermissionMin)
  else g_GameCommand.MAP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Kick','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Kick',g_GameCommand.KICK.sCmd)
  else g_GameCommand.KICK.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Kick',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Kick', g_GameCommand.KICK.nPermissionMin)
  else g_GameCommand.KICK.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Ting','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Ting',g_GameCommand.TING.sCmd)
  else g_GameCommand.TING.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Ting',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Ting', g_GameCommand.TING.nPermissionMin)
  else g_GameCommand.TING.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SuperTing','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SuperTing',g_GameCommand.SUPERTING.sCmd)
  else g_GameCommand.SUPERTING.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SuperTing',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SuperTing', g_GameCommand.SUPERTING.nPermissionMin)
  else g_GameCommand.SUPERTING.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MapMove','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MapMove',g_GameCommand.MAPMOVE.sCmd)
  else g_GameCommand.MAPMOVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MapMove',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MapMove', g_GameCommand.MAPMOVE.nPermissionMin)
  else g_GameCommand.MAPMOVE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Shutup','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Shutup',g_GameCommand.SHUTUP.sCmd)
  else g_GameCommand.SHUTUP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Shutup',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Shutup', g_GameCommand.SHUTUP.nPermissionMin)
  else g_GameCommand.SHUTUP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReleaseShutup','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReleaseShutup',g_GameCommand.RELEASESHUTUP.sCmd)
  else g_GameCommand.RELEASESHUTUP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReleaseShutup',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReleaseShutup', g_GameCommand.RELEASESHUTUP.nPermissionMin)
  else g_GameCommand.RELEASESHUTUP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShutupList','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShutupList',g_GameCommand.SHUTUPLIST.sCmd)
  else g_GameCommand.SHUTUPLIST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShutupList',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShutupList', g_GameCommand.SHUTUPLIST.nPermissionMin)
  else g_GameCommand.SHUTUPLIST.nPermissionMin:=nLoadInteger;

  g_GameCommand.SVNINFO.sCmd := 'svninfo';
  nLoadInteger:=CommandConf.ReadInteger('Permission','SvnInfo',-1);
  if nLoadInteger < 0 then CommandConf.WriteInteger('Permission','SvnInfo', g_GameCommand.SVNINFO.nPermissionMin)
  else g_GameCommand.SVNINFO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GameMaster','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GameMaster',g_GameCommand.GAMEMASTER.sCmd)
  else g_GameCommand.GAMEMASTER.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','GameMaster',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GameMaster', g_GameCommand.GAMEMASTER.nPermissionMin)
  else g_GameCommand.GAMEMASTER.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ObServer','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ObServer',g_GameCommand.OBSERVER.sCmd)
  else g_GameCommand.OBSERVER.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ObServer',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ObServer', g_GameCommand.OBSERVER.nPermissionMin)
  else g_GameCommand.OBSERVER.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SuperMan','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SuperMan',g_GameCommand.SUEPRMAN.sCmd)
  else g_GameCommand.SUEPRMAN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SuperMan',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SuperMan', g_GameCommand.SUEPRMAN.nPermissionMin)
  else g_GameCommand.SUEPRMAN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Level','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Level',g_GameCommand.LEVEL.sCmd)
  else g_GameCommand.LEVEL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Level',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Level', g_GameCommand.LEVEL.nPermissionMin)
  else g_GameCommand.LEVEL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SabukWallGold','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SabukWallGold',g_GameCommand.SABUKWALLGOLD.sCmd)
  else g_GameCommand.SABUKWALLGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SabukWallGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SabukWallGold', g_GameCommand.SABUKWALLGOLD.nPermissionMin)
  else g_GameCommand.SABUKWALLGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Recall','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Recall',g_GameCommand.RECALL.sCmd)
  else g_GameCommand.RECALL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Recall',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Recall', g_GameCommand.RECALL.nPermissionMin)
  else g_GameCommand.RECALL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReGoto','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReGoto',g_GameCommand.REGOTO.sCmd)
  else g_GameCommand.REGOTO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReGoto',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReGoto', g_GameCommand.REGOTO.nPermissionMin)
  else g_GameCommand.REGOTO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Flag','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Flag',g_GameCommand.SHOWFLAG.sCmd)
  else g_GameCommand.SHOWFLAG.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Flag',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Flag', g_GameCommand.SHOWFLAG.nPermissionMin)
  else g_GameCommand.SHOWFLAG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShowOpen','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShowOpen',g_GameCommand.SHOWOPEN.sCmd)
  else g_GameCommand.SHOWOPEN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShowOpen',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShowOpen', g_GameCommand.SHOWOPEN.nPermissionMin)
  else g_GameCommand.SHOWOPEN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShowUnit','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShowUnit',g_GameCommand.SHOWUNIT.sCmd)
  else g_GameCommand.SHOWUNIT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShowUnit',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShowUnit', g_GameCommand.SHOWUNIT.nPermissionMin)
  else g_GameCommand.SHOWUNIT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Attack','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Attack',g_GameCommand.ATTACK.sCmd)
  else g_GameCommand.ATTACK.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Attack',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Attack', g_GameCommand.ATTACK.nPermissionMin)
  else g_GameCommand.ATTACK.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Mob','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Mob',g_GameCommand.MOB.sCmd)
  else g_GameCommand.MOB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Mob',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Mob', g_GameCommand.MOB.nPermissionMin)
  else g_GameCommand.MOB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MobNpc','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MobNpc',g_GameCommand.MOBNPC.sCmd)
  else g_GameCommand.MOBNPC.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MobNpc',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MobNpc', g_GameCommand.MOBNPC.nPermissionMin)
  else g_GameCommand.MOBNPC.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelNpc','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelNpc',g_GameCommand.DELNPC.sCmd)
  else g_GameCommand.DELNPC.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelNpc',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelNpc', g_GameCommand.DELNPC.nPermissionMin)
  else g_GameCommand.DELNPC.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','NpcScript','');
  if LoadString = '' then
    CommandConf.WriteString('Command','NpcScript',g_GameCommand.NPCSCRIPT.sCmd)
  else g_GameCommand.NPCSCRIPT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','NpcScript',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','NpcScript', g_GameCommand.NPCSCRIPT.nPermissionMin)
  else g_GameCommand.NPCSCRIPT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','RecallMob','');
  if LoadString = '' then
    CommandConf.WriteString('Command','RecallMob',g_GameCommand.RECALLMOB.sCmd)
  else g_GameCommand.RECALLMOB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','RecallMob',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','RecallMob', g_GameCommand.RECALLMOB.nPermissionMin)
  else g_GameCommand.RECALLMOB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','FiveGo','');
  if LoadString = '' then
    CommandConf.WriteString('Command','FiveGo',g_GameCommand.FIVEGO.sCmd)
  else g_GameCommand.FIVEGO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','FiveGo',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','FiveGo', g_GameCommand.FIVEGO.nPermissionMin)
  else g_GameCommand.FIVEGO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MAPCLICKMOVE','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MAPCLICKMOVE',g_GameCommand.MAPCLICKMOVE.sCmd)
  else g_GameCommand.MAPCLICKMOVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MAPCLICKMOVE',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MAPCLICKMOVE', g_GameCommand.MAPCLICKMOVE.nPermissionMin)
  else g_GameCommand.MAPCLICKMOVE.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','SHOUTGREEN','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SHOUTGREEN',g_GameCommand.SHOUTGREEN.sCmd)
  else g_GameCommand.SHOUTGREEN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SHOUTGREEN',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SHOUTGREEN', g_GameCommand.SHOUTGREEN.nPermissionMin)
  else g_GameCommand.SHOUTGREEN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SHOUTPURPLE','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SHOUTPURPLE',g_GameCommand.SHOUTPURPLE.sCmd)
  else g_GameCommand.SHOUTPURPLE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SHOUTGREEN',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SHOUTPURPLE', g_GameCommand.SHOUTPURPLE.nPermissionMin)
  else g_GameCommand.SHOUTPURPLE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','LuckPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LuckPoint',g_GameCommand.LUCKYPOINT.sCmd)
  else g_GameCommand.LUCKYPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','LuckPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','LuckPoint', g_GameCommand.LUCKYPOINT.nPermissionMin)
  else g_GameCommand.LUCKYPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','LotteryTicket','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LotteryTicket',g_GameCommand.LOTTERYTICKET.sCmd)
  else g_GameCommand.LOTTERYTICKET.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','LotteryTicket',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','LotteryTicket', g_GameCommand.LOTTERYTICKET.nPermissionMin)
  else g_GameCommand.LOTTERYTICKET.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadGuild','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadGuild',g_GameCommand.RELOADGUILD.sCmd)
  else g_GameCommand.RELOADGUILD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadGuild',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadGuild', g_GameCommand.RELOADGUILD.nPermissionMin)
  else g_GameCommand.RELOADGUILD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','loadGuild','');         //檬焊巩颇
  if LoadString = '' then
    CommandConf.WriteString('Command','loadGuild',g_GameCommand.LOADGUILD.sCmd)
  else g_GameCommand.LOADGUILD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','loadGuild',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','loadGuild', g_GameCommand.LOADGUILD.nPermissionMin)
  else g_GameCommand.LOADGUILD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadLineNotice','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadLineNotice',g_GameCommand.RELOADLINENOTICE.sCmd)
  else g_GameCommand.RELOADLINENOTICE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadLineNotice',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadLineNotice', g_GameCommand.RELOADLINENOTICE.nPermissionMin)
  else g_GameCommand.RELOADLINENOTICE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadAbuse','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadAbuse',g_GameCommand.RELOADABUSE.sCmd)
  else g_GameCommand.RELOADABUSE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadAbuse',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadAbuse', g_GameCommand.RELOADABUSE.nPermissionMin)
  else g_GameCommand.RELOADABUSE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','BackStep','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BackStep',g_GameCommand.BACKSTEP.sCmd)
  else g_GameCommand.BACKSTEP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','BackStep',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','BackStep', g_GameCommand.BACKSTEP.nPermissionMin)
  else g_GameCommand.BACKSTEP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Ball','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Ball',g_GameCommand.BALL.sCmd)
  else g_GameCommand.BALL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Ball',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Ball', g_GameCommand.BALL.nPermissionMin)
  else g_GameCommand.BALL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','FreePenalty','');
  if LoadString = '' then
    CommandConf.WriteString('Command','FreePenalty',g_GameCommand.FREEPENALTY.sCmd)
  else g_GameCommand.FREEPENALTY.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','FreePenalty',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','FreePenalty', g_GameCommand.FREEPENALTY.nPermissionMin)
  else g_GameCommand.FREEPENALTY.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','KillDeathZero','');  //懦/单胶 檬扁拳
  if LoadString = '' then
    CommandConf.WriteString('Command','KillDeathZero',g_GameCommand.KILLDEATHZERO.sCmd)
  else g_GameCommand.KILLDEATHZERO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','KillDeathZero',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','KillDeathZero', g_GameCommand.KILLDEATHZERO.nPermissionMin)
  else g_GameCommand.KILLDEATHZERO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','PkPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PkPoint',g_GameCommand.PKPOINT.sCmd)
  else g_GameCommand.PKPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','PkPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PkPoint', g_GameCommand.PKPOINT.nPermissionMin)
  else g_GameCommand.PKPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','IncPkPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','IncPkPoint',g_GameCommand.INCPKPOINT.sCmd)
  else g_GameCommand.INCPKPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','IncPkPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','IncPkPoint', g_GameCommand.INCPKPOINT.nPermissionMin)
  else g_GameCommand.INCPKPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeLuck','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeLuck',g_GameCommand.CHANGELUCK.sCmd)
  else g_GameCommand.CHANGELUCK.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeLuck',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeLuck', g_GameCommand.CHANGELUCK.nPermissionMin)
  else g_GameCommand.CHANGELUCK.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','Hair','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Hair',g_GameCommand.HAIR.sCmd)
  else g_GameCommand.HAIR.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Hair',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Hair', g_GameCommand.HAIR.nPermissionMin)
  else g_GameCommand.HAIR.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Training','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Training',g_GameCommand.TRAINING.sCmd)
  else g_GameCommand.TRAINING.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Training',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Training', g_GameCommand.TRAINING.nPermissionMin)
  else g_GameCommand.TRAINING.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DeleteSkill','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DeleteSkill',g_GameCommand.DELETESKILL.sCmd)
  else g_GameCommand.DELETESKILL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DeleteSkill',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DeleteSkill', g_GameCommand.DELETESKILL.nPermissionMin)
  else g_GameCommand.DELETESKILL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeJob','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeJob',g_GameCommand.CHANGEJOB.sCmd)
  else g_GameCommand.CHANGEJOB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeJob',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeJob', g_GameCommand.CHANGEJOB.nPermissionMin)
  else g_GameCommand.CHANGEJOB.nPermissionMin:=nLoadInteger;

   LoadString:=CommandConf.ReadString('Command','ChangeJobUp','');         //殿急函券
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeJobUp',g_GameCommand.CHANGEJOBUP.sCmd)
  else g_GameCommand.CHANGEJOBUP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeJobUp',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeJobUp', g_GameCommand.CHANGEJOBUP.nPermissionMin)
  else g_GameCommand.CHANGEJOBUP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeGender','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeGender',g_GameCommand.CHANGEGENDER.sCmd)
  else g_GameCommand.CHANGEGENDER.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeGender',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeGender', g_GameCommand.CHANGEGENDER.nPermissionMin)
  else g_GameCommand.CHANGEGENDER.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','NameColor','');
  if LoadString = '' then
    CommandConf.WriteString('Command','NameColor',g_GameCommand.NAMECOLOR.sCmd)
  else g_GameCommand.NAMECOLOR.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','NameColor',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','NameColor', g_GameCommand.NAMECOLOR.nPermissionMin)
  else g_GameCommand.NAMECOLOR.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Mission','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Mission',g_GameCommand.MISSION.sCmd)
  else g_GameCommand.MISSION.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Mission',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Mission', g_GameCommand.MISSION.nPermissionMin)
  else g_GameCommand.MISSION.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MobPlace','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MobPlace',g_GameCommand.MOBPLACE.sCmd)
  else g_GameCommand.MOBPLACE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MobPlace',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MobPlace', g_GameCommand.MOBPLACE.nPermissionMin)
  else g_GameCommand.MOBPLACE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Transparecy','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Transparecy',g_GameCommand.TRANSPARECY.sCmd)
  else g_GameCommand.TRANSPARECY.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Transparecy',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Transparecy', g_GameCommand.TRANSPARECY.nPermissionMin)
  else g_GameCommand.TRANSPARECY.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DeleteItem','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DeleteItem',g_GameCommand.DELETEITEM.sCmd)
  else g_GameCommand.DELETEITEM.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DeleteItem',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DeleteItem', g_GameCommand.DELETEITEM.nPermissionMin)
  else g_GameCommand.DELETEITEM.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Level0','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Level0',g_GameCommand.LEVEL0.sCmd)
  else g_GameCommand.LEVEL0.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Level0',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Level0', g_GameCommand.LEVEL0.nPermissionMin)
  else g_GameCommand.LEVEL0.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ClearMission','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ClearMission',g_GameCommand.CLEARMISSION.sCmd)
  else g_GameCommand.CLEARMISSION.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ClearMission',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ClearMission', g_GameCommand.CLEARMISSION.nPermissionMin)
  else g_GameCommand.CLEARMISSION.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetFlag','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetFlag',g_GameCommand.SETFLAG.sCmd)
  else g_GameCommand.SETFLAG.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetFlag',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetFlag', g_GameCommand.SETFLAG.nPermissionMin)
  else g_GameCommand.SETFLAG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetOpen','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetOpen',g_GameCommand.SETOPEN.sCmd)
  else g_GameCommand.SETOPEN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetOpen',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetOpen', g_GameCommand.SETOPEN.nPermissionMin)
  else g_GameCommand.SETOPEN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetUnit','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetUnit',g_GameCommand.SETUNIT.sCmd)
  else g_GameCommand.SETUNIT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetUnit',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetUnit', g_GameCommand.SETUNIT.nPermissionMin)
  else g_GameCommand.SETUNIT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReConnection','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReConnection',g_GameCommand.RECONNECTION.sCmd)
  else g_GameCommand.RECONNECTION.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReConnection',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReConnection', g_GameCommand.RECONNECTION.nPermissionMin)
  else g_GameCommand.RECONNECTION.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DisableFilter','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DisableFilter',g_GameCommand.DISABLEFILTER.sCmd)
  else g_GameCommand.DISABLEFILTER.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DisableFilter',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DisableFilter', g_GameCommand.DISABLEFILTER.nPermissionMin)
  else g_GameCommand.DISABLEFILTER.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeUserFull','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeUserFull',g_GameCommand.CHGUSERFULL.sCmd)
  else g_GameCommand.CHGUSERFULL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeUserFull',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeUserFull', g_GameCommand.CHGUSERFULL.nPermissionMin)
  else g_GameCommand.CHGUSERFULL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeZenFastStep','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeZenFastStep',g_GameCommand.CHGZENFASTSTEP.sCmd)
  else g_GameCommand.CHGZENFASTSTEP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeZenFastStep',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeZenFastStep', g_GameCommand.CHGZENFASTSTEP.nPermissionMin)
  else g_GameCommand.CHGZENFASTSTEP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ContestPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ContestPoint',g_GameCommand.CONTESTPOINT.sCmd)
  else g_GameCommand.CONTESTPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ContestPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ContestPoint', g_GameCommand.CONTESTPOINT.nPermissionMin)
  else g_GameCommand.CONTESTPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','StartContest','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StartContest',g_GameCommand.STARTCONTEST.sCmd)
  else g_GameCommand.STARTCONTEST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','StartContest',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','StartContest', g_GameCommand.STARTCONTEST.nPermissionMin)
  else g_GameCommand.STARTCONTEST.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','EndContest','');
  if LoadString = '' then
    CommandConf.WriteString('Command','EndContest',g_GameCommand.ENDCONTEST.sCmd)
  else g_GameCommand.ENDCONTEST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','EndContest',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','EndContest', g_GameCommand.ENDCONTEST.nPermissionMin)
  else g_GameCommand.ENDCONTEST.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Announcement','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Announcement',g_GameCommand.ANNOUNCEMENT.sCmd)
  else g_GameCommand.ANNOUNCEMENT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Announcement',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Announcement', g_GameCommand.ANNOUNCEMENT.nPermissionMin)
  else g_GameCommand.ANNOUNCEMENT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','OXQuizRoom','');
  if LoadString = '' then
    CommandConf.WriteString('Command','OXQuizRoom',g_GameCommand.OXQUIZROOM.sCmd)
  else g_GameCommand.OXQUIZROOM.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','OXQuizRoom',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','OXQuizRoom', g_GameCommand.OXQUIZROOM.nPermissionMin)
  else g_GameCommand.OXQUIZROOM.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Gsa','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Gsa',g_GameCommand.GSA.sCmd)
  else g_GameCommand.GSA.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Gsa',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Gsa', g_GameCommand.GSA.nPermissionMin)
  else g_GameCommand.GSA.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeItemName','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeItemName',g_GameCommand.CHANGEITEMNAME.sCmd)
  else g_GameCommand.CHANGEITEMNAME.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeItemName',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeItemName', g_GameCommand.CHANGEITEMNAME.nPermissionMin)
  else g_GameCommand.CHANGEITEMNAME.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DisableSendMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DisableSendMsg',g_GameCommand.DISABLESENDMSG.sCmd)
  else g_GameCommand.DISABLESENDMSG.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DisableSendMsg',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DisableSendMsg', g_GameCommand.DISABLESENDMSG.nPermissionMin)
  else g_GameCommand.DISABLESENDMSG.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','EnableSendMsg','');
  if LoadString = '' then
    CommandConf.WriteString('Command','EnableSendMsg',g_GameCommand.ENABLESENDMSG.sCmd)
  else g_GameCommand.ENABLESENDMSG.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','EnableSendMsg',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','EnableSendMsg', g_GameCommand.ENABLESENDMSG.nPermissionMin)
  else g_GameCommand.ENABLESENDMSG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DisableSendMsgList','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DisableSendMsgList',g_GameCommand.DISABLESENDMSGLIST.sCmd)
  else g_GameCommand.DISABLESENDMSGLIST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DisableSendMsgList',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DisableSendMsgList', g_GameCommand.DISABLESENDMSGLIST.nPermissionMin)
  else g_GameCommand.DISABLESENDMSGLIST.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Kill','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Kill',g_GameCommand.KILL.sCmd)
  else g_GameCommand.KILL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Kill',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Kill', g_GameCommand.KILL.nPermissionMin)
  else g_GameCommand.KILL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Make','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Make',g_GameCommand.MAKE.sCmd)
  else g_GameCommand.MAKE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MakeMin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MakeMin', g_GameCommand.MAKE.nPermissionMin)
  else g_GameCommand.MAKE.nPermissionMin:=nLoadInteger;

  nLoadInteger:=CommandConf.ReadInteger('Permission','MakeMax',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MakeMax', g_GameCommand.MAKE.nPermissionMax)
  else g_GameCommand.MAKE.nPermissionMax:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SuperMake','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SuperMake',g_GameCommand.SMAKE.sCmd)
  else g_GameCommand.SMAKE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SuperMake',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SuperMake', g_GameCommand.SMAKE.nPermissionMin)
  else g_GameCommand.SMAKE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','YourMakeItem','');
  if LoadString = '' then
    CommandConf.WriteString('Command','YourMakeItem',g_GameCommand.YOURMAKE.sCmd)
  else g_GameCommand.YOURMAKE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','YourMakeItem',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','YourMakeItem', g_GameCommand.YOURMAKE.nPermissionMin)
  else g_GameCommand.YOURMAKE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','BonusPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','BonusPoint',g_GameCommand.BONUSPOINT.sCmd)
  else g_GameCommand.BONUSPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','BonusPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','BonusPoint', g_GameCommand.BONUSPOINT.nPermissionMin)
  else g_GameCommand.BONUSPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelBonuPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelBonuPoint',g_GameCommand.DELBONUSPOINT.sCmd)
  else g_GameCommand.DELBONUSPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelBonuPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelBonuPoint', g_GameCommand.DELBONUSPOINT.nPermissionMin)
  else g_GameCommand.DELBONUSPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','RestBonuPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','RestBonuPoint',g_GameCommand.RESTBONUSPOINT.sCmd)
  else g_GameCommand.RESTBONUSPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','RestBonuPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','RestBonuPoint', g_GameCommand.RESTBONUSPOINT.nPermissionMin)
  else g_GameCommand.RESTBONUSPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','FireBurn','');
  if LoadString = '' then
    CommandConf.WriteString('Command','FireBurn',g_GameCommand.FIREBURN.sCmd)
  else g_GameCommand.FIREBURN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','FireBurn',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','FireBurn', g_GameCommand.FIREBURN.nPermissionMin)
  else g_GameCommand.FIREBURN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','TestStatus','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TestStatus',g_GameCommand.TESTSTATUS.sCmd)
  else g_GameCommand.TESTSTATUS.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','TestStatus',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','TestStatus', g_GameCommand.TESTSTATUS.nPermissionMin)
  else g_GameCommand.TESTSTATUS.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelGold','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelGold',g_GameCommand.DELGOLD.sCmd)
  else g_GameCommand.DELGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelGold', g_GameCommand.DELGOLD.nPermissionMin)
  else g_GameCommand.DELGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddGold','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AddGold',g_GameCommand.ADDGOLD.sCmd)
  else g_GameCommand.ADDGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddGold', g_GameCommand.ADDGOLD.nPermissionMin)
  else g_GameCommand.ADDGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelGameGold','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelGameGold',g_GameCommand.DELGAMEGOLD.sCmd)
  else g_GameCommand.DELGAMEGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelGameGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelGameGold', g_GameCommand.DELGAMEGOLD.nPermissionMin)
  else g_GameCommand.DELGAMEGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddGamePoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AddGamePoint',g_GameCommand.ADDGAMEGOLD.sCmd)
  else g_GameCommand.ADDGAMEGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddGameGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddGameGold', g_GameCommand.ADDGAMEGOLD.nPermissionMin)
  else g_GameCommand.ADDGAMEGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GameGold','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GameGold',g_GameCommand.GAMEGOLD.sCmd)
  else g_GameCommand.GAMEGOLD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','GameGold',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GameGold', g_GameCommand.GAMEGOLD.nPermissionMin)
  else g_GameCommand.GAMEGOLD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GamePoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GamePoint',g_GameCommand.GAMEPOINT.sCmd)
  else g_GameCommand.GAMEPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','GamePoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GamePoint', g_GameCommand.GAMEPOINT.nPermissionMin)
  else g_GameCommand.GAMEPOINT.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','PCPoint','');
  if LoadString = '' then
    CommandConf.WriteString('Command','PCPoint',g_GameCommand.PCPOINT.sCmd)
  else g_GameCommand.PCPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','PCPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','PCPoint', g_GameCommand.PCPOINT.nPermissionMin)
  else g_GameCommand.PCPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','TestGoldChange','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TestGoldChange',g_GameCommand.TESTGOLDCHANGE.sCmd)
  else g_GameCommand.TESTGOLDCHANGE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','TestGoldChange',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','TestGoldChange', g_GameCommand.TESTGOLDCHANGE.nPermissionMin)
  else g_GameCommand.TESTGOLDCHANGE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','RefineWeapon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','RefineWeapon',g_GameCommand.REFINEWEAPON.sCmd)
  else g_GameCommand.REFINEWEAPON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','RefineWeapon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','RefineWeapon', g_GameCommand.REFINEWEAPON.nPermissionMin)
  else g_GameCommand.REFINEWEAPON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadAdmin','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadAdmin',g_GameCommand.RELOADADMIN.sCmd)
  else g_GameCommand.RELOADADMIN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadAdmin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadAdmin', g_GameCommand.RELOADADMIN.nPermissionMin)
  else g_GameCommand.RELOADADMIN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadColumn','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadColumn',g_GameCommand.RELOADCOLUMN.sCmd)
  else g_GameCommand.RELOADCOLUMN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadColumn',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadColumn', g_GameCommand.RELOADCOLUMN.nPermissionMin)
  else g_GameCommand.RELOADCOLUMN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadNpc','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadNpc',g_GameCommand.RELOADNPC.sCmd)
  else g_GameCommand.RELOADNPC.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadNpc',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadNpc', g_GameCommand.RELOADNPC.nPermissionMin)
  else g_GameCommand.RELOADNPC.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','AddKillPoint','');              //懦 器牢飘 林扁 疙飞绢
  if LoadString = '' then
    CommandConf.WriteString('Command','AddKillPoint',g_GameCommand.ADDKILLPOINT.sCmd)
  else g_GameCommand.ADDKILLPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddKillPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddKillPoint', g_GameCommand.ADDKILLPOINT.nPermissionMin)
  else g_GameCommand.ADDKILLPOINT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddDeathPoint','');              //单胶 器牢飘 林扁 疙飞绢
  if LoadString = '' then
    CommandConf.WriteString('Command','AddDeathPoint',g_GameCommand.ADDDEATHPOINT.sCmd)
  else g_GameCommand.ADDDEATHPOINT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddDeathPoint',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddDeathPoint', g_GameCommand.ADDDEATHPOINT.nPermissionMin)
  else g_GameCommand.ADDDEATHPOINT.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','ReloadManage','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadManage',g_GameCommand.RELOADMANAGE.sCmd)
  else g_GameCommand.RELOADMANAGE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadManage',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadManage', g_GameCommand.RELOADMANAGE.nPermissionMin)
  else g_GameCommand.RELOADMANAGE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadRobotManage','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadRobotManage',g_GameCommand.RELOADROBOTMANAGE.sCmd)
  else g_GameCommand.RELOADROBOTMANAGE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadRobotManage',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadRobotManage', g_GameCommand.RELOADROBOTMANAGE.nPermissionMin)
  else g_GameCommand.RELOADROBOTMANAGE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadRobot','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadRobot',g_GameCommand.RELOADROBOT.sCmd)
  else g_GameCommand.RELOADROBOT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadRobot',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadRobot', g_GameCommand.RELOADROBOT.nPermissionMin)
  else g_GameCommand.RELOADROBOT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadMonitems','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadMonitems',g_GameCommand.RELOADMONITEMS.sCmd)
  else g_GameCommand.RELOADMONITEMS.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadMonitems',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadMonitems', g_GameCommand.RELOADMONITEMS.nPermissionMin)
  else g_GameCommand.RELOADMONITEMS.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadDiary','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadDiary',g_GameCommand.RELOADDIARY.sCmd)
  else g_GameCommand.RELOADDIARY.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadDiary',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadDiary', g_GameCommand.RELOADDIARY.nPermissionMin)
  else g_GameCommand.RELOADDIARY.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadItemDB','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadItemDB',g_GameCommand.RELOADITEMDB.sCmd)
  else g_GameCommand.RELOADITEMDB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadItemDB',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadItemDB', g_GameCommand.RELOADITEMDB.nPermissionMin)
  else g_GameCommand.RELOADITEMDB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadShopItemDB','');    //券惑痢 府肺靛
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadShopItemDB',g_GameCommand.RELOADSHOPITEMDB.sCmd)
  else g_GameCommand.RELOADSHOPITEMDB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadShopItemDB',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadShopItemDB', g_GameCommand.RELOADSHOPITEMDB.nPermissionMin)
  else g_GameCommand.RELOADSHOPITEMDB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadMakeItem','');    //力炼 府肺靛
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadMakeItem',g_GameCommand.RELOADMAKEITEM.sCmd)
  else g_GameCommand.RELOADMAKEITEM.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadMakeItem',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadMakeItem', g_GameCommand.RELOADMAKEITEM.nPermissionMin)
  else g_GameCommand.RELOADMAKEITEM.nPermissionMin:=nLoadInteger;



  LoadString:=CommandConf.ReadString('Command','ReloadFishItemDB','');    //超矫府肺靛
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadFishItemDB',g_GameCommand.RELOADFISHITEMDB.sCmd)
  else g_GameCommand.RELOADFISHITEMDB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadFishItemDB',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadFishItemDB', g_GameCommand.RELOADFISHITEMDB.nPermissionMin)
  else g_GameCommand.RELOADFISHITEMDB.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','ReloadMagicDB','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadMagicDB',g_GameCommand.RELOADMAGICDB.sCmd)
  else g_GameCommand.RELOADMAGICDB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadMagicDB',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadMagicDB', g_GameCommand.RELOADMAGICDB.nPermissionMin)
  else g_GameCommand.RELOADMAGICDB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadMonsterDB','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadMonsterDB',g_GameCommand.RELOADMONSTERDB.sCmd)
  else g_GameCommand.RELOADMONSTERDB.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadMonsterDB',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadMonsterDB', g_GameCommand.RELOADMONSTERDB.nPermissionMin)
  else g_GameCommand.RELOADMONSTERDB.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReAlive','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReAlive',g_GameCommand.REALIVE.sCmd)
  else g_GameCommand.REALIVE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReAlive',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReAlive', g_GameCommand.REALIVE.nPermissionMin)
  else g_GameCommand.REALIVE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AdjuestTLevel','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AdjuestTLevel',g_GameCommand.ADJUESTLEVEL.sCmd)
  else g_GameCommand.ADJUESTLEVEL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AdjuestTLevel',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AdjuestTLevel', g_GameCommand.ADJUESTLEVEL.nPermissionMin)
  else g_GameCommand.ADJUESTLEVEL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AdjuestExp','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AdjuestExp',g_GameCommand.ADJUESTEXP.sCmd)
  else g_GameCommand.ADJUESTEXP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AdjuestExp',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AdjuestExp', g_GameCommand.ADJUESTEXP.nPermissionMin)
  else g_GameCommand.ADJUESTEXP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddGuild','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AddGuild',g_GameCommand.ADDGUILD.sCmd)
  else g_GameCommand.ADDGUILD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddGuild',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddGuild', g_GameCommand.ADDGUILD.nPermissionMin)
  else g_GameCommand.ADDGUILD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelGuild','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelGuild',g_GameCommand.DELGUILD.sCmd)
  else g_GameCommand.DELGUILD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelGuild',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelGuild', g_GameCommand.DELGUILD.nPermissionMin)
  else g_GameCommand.DELGUILD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeSabukLord','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeSabukLord',g_GameCommand.CHANGESABUKLORD.sCmd)
  else g_GameCommand.CHANGESABUKLORD.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeSabukLord',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeSabukLord', g_GameCommand.CHANGESABUKLORD.nPermissionMin)
  else g_GameCommand.CHANGESABUKLORD.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ForcedWallConQuestWar','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ForcedWallConQuestWar',g_GameCommand.FORCEDWALLCONQUESTWAR.sCmd)
  else g_GameCommand.FORCEDWALLCONQUESTWAR.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ForcedWallConQuestWar',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ForcedWallConQuestWar', g_GameCommand.FORCEDWALLCONQUESTWAR.nPermissionMin)
  else g_GameCommand.FORCEDWALLCONQUESTWAR.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddToItemEvent','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AddToItemEvent',g_GameCommand.ADDTOITEMEVENT.sCmd)
  else g_GameCommand.ADDTOITEMEVENT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddToItemEvent',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddToItemEvent', g_GameCommand.ADDTOITEMEVENT.nPermissionMin)
  else g_GameCommand.ADDTOITEMEVENT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AddToItemEventAspieces','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AddToItemEventAspieces',g_GameCommand.ADDTOITEMEVENTASPIECES.sCmd)
  else g_GameCommand.ADDTOITEMEVENTASPIECES.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AddToItemEventAspieces',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AddToItemEventAspieces', g_GameCommand.ADDTOITEMEVENTASPIECES.nPermissionMin)
  else g_GameCommand.ADDTOITEMEVENTASPIECES.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ItemEventList','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ItemEventList',g_GameCommand.ITEMEVENTLIST.sCmd)
  else g_GameCommand.ITEMEVENTLIST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ItemEventList',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ItemEventList', g_GameCommand.ITEMEVENTLIST.nPermissionMin)
  else g_GameCommand.ITEMEVENTLIST.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','StartIngGiftNO','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StartIngGiftNO',g_GameCommand.STARTINGGIFTNO.sCmd)
  else g_GameCommand.STARTINGGIFTNO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','StartIngGiftNO',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','StartIngGiftNO', g_GameCommand.STARTINGGIFTNO.nPermissionMin)
  else g_GameCommand.STARTINGGIFTNO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DeleteAllItemEvent','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DeleteAllItemEvent',g_GameCommand.DELETEALLITEMEVENT.sCmd)
  else g_GameCommand.DELETEALLITEMEVENT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DeleteAllItemEvent',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DeleteAllItemEvent', g_GameCommand.DELETEALLITEMEVENT.nPermissionMin)
  else g_GameCommand.DELETEALLITEMEVENT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','StartItemEvent','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StartItemEvent',g_GameCommand.STARTITEMEVENT.sCmd)
  else g_GameCommand.STARTITEMEVENT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','StartItemEvent',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','StartItemEvent', g_GameCommand.STARTITEMEVENT.nPermissionMin)
  else g_GameCommand.STARTITEMEVENT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ItemEventTerm','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ItemEventTerm',g_GameCommand.ITEMEVENTTERM.sCmd)
  else g_GameCommand.ITEMEVENTTERM.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ItemEventTerm',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ItemEventTerm', g_GameCommand.ITEMEVENTTERM.nPermissionMin)
  else g_GameCommand.ITEMEVENTTERM.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','AdjuestTestLevel','');
  if LoadString = '' then
    CommandConf.WriteString('Command','AdjuestTestLevel',g_GameCommand.ADJUESTTESTLEVEL.sCmd)
  else g_GameCommand.ADJUESTTESTLEVEL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','AdjuestTestLevel',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','AdjuestTestLevel', g_GameCommand.ADJUESTTESTLEVEL.nPermissionMin)
  else g_GameCommand.ADJUESTTESTLEVEL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','OpTraining','');
  if LoadString = '' then
    CommandConf.WriteString('Command','OpTraining',g_GameCommand.TRAININGSKILL.sCmd)
  else g_GameCommand.TRAININGSKILL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','OpTraining',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','OpTraining', g_GameCommand.TRAININGSKILL.nPermissionMin)
  else g_GameCommand.TRAININGSKILL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','OpDeleteSkill','');
  if LoadString = '' then
    CommandConf.WriteString('Command','OpDeleteSkill',g_GameCommand.OPDELETESKILL.sCmd)
  else g_GameCommand.OPDELETESKILL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','OpDeleteSkill',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','OpDeleteSkill', g_GameCommand.OPDELETESKILL.nPermissionMin)
  else g_GameCommand.OPDELETESKILL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ChangeWeaponDura','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ChangeWeaponDura',g_GameCommand.CHANGEWEAPONDURA.sCmd)
  else g_GameCommand.CHANGEWEAPONDURA.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ChangeWeaponDura',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ChangeWeaponDura', g_GameCommand.CHANGEWEAPONDURA.nPermissionMin)
  else g_GameCommand.CHANGEWEAPONDURA.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReloadGuildAll','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReloadGuildAll',g_GameCommand.RELOADGUILDALL.sCmd)
  else g_GameCommand.RELOADGUILDALL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReloadGuildAll',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReloadGuildAll', g_GameCommand.RELOADGUILDALL.nPermissionMin)
  else g_GameCommand.RELOADGUILDALL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Who','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Who',g_GameCommand.WHO.sCmd)
  else g_GameCommand.WHO.sCmd:=LoadString;

  nLoadInteger:=CommandConf.ReadInteger('Permission','Who',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Who', g_GameCommand.WHO.nPermissionMin)
  else g_GameCommand.WHO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','Total','');
  if LoadString = '' then
    CommandConf.WriteString('Command','Total',g_GameCommand.TOTAL.sCmd)
  else g_GameCommand.TOTAL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','Total',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','Total', g_GameCommand.TOTAL.nPermissionMin)
  else g_GameCommand.TOTAL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','TestGa','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TestGa',g_GameCommand.TESTGA.sCmd)
  else g_GameCommand.TESTGA.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','TestGa',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','TestGa', g_GameCommand.TESTGA.nPermissionMin)
  else g_GameCommand.TESTGA.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','MapInfo','');
  if LoadString = '' then
    CommandConf.WriteString('Command','MapInfo',g_GameCommand.MAPINFO.sCmd)
  else g_GameCommand.MAPINFO.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','MapInfo',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','MapInfo', g_GameCommand.MAPINFO.nPermissionMin)
  else g_GameCommand.MAPINFO.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SbkDoor','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SbkDoor',g_GameCommand.SBKDOOR.sCmd)
  else g_GameCommand.SBKDOOR.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SbkDoor',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SbkDoor', g_GameCommand.SBKDOOR.nPermissionMin)
  else g_GameCommand.SBKDOOR.nPermissionMin:=nLoadInteger;


  LoadString:=CommandConf.ReadString('Command','StartQuest','');
  if LoadString = '' then
    CommandConf.WriteString('Command','StartQuest',g_GameCommand.STARTQUEST.sCmd)
  else g_GameCommand.STARTQUEST.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','StartQuest',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','StartQuest', g_GameCommand.STARTQUEST.nPermissionMin)
  else g_GameCommand.STARTQUEST.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetPermission','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetPermission',g_GameCommand.SETPERMISSION.sCmd)
  else g_GameCommand.SETPERMISSION.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetPermission',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetPermission', g_GameCommand.SETPERMISSION.nPermissionMin)
  else g_GameCommand.SETPERMISSION.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetColumn','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetColumn',g_GameCommand.SETCOLUMN.sCmd)
  else g_GameCommand.SETCOLUMN.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetColumn',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetColumn', g_GameCommand.SETCOLUMN.nPermissionMin)
  else g_GameCommand.SETCOLUMN.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ClearMon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ClearMon',g_GameCommand.CLEARMON.sCmd)
  else g_GameCommand.CLEARMON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ClearMon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ClearMon', g_GameCommand.CLEARMON.nPermissionMin)
  else g_GameCommand.CLEARMON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ReNewLevel','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ReNewLevel',g_GameCommand.RENEWLEVEL.sCmd)
  else g_GameCommand.RENEWLEVEL.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ReNewLevel',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ReNewLevel', g_GameCommand.RENEWLEVEL.nPermissionMin)
  else g_GameCommand.RENEWLEVEL.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DenyIPaddrLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DenyIPaddrLogon',g_GameCommand.DENYIPLOGON.sCmd)
  else g_GameCommand.DENYIPLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DenyIPaddrLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DenyIPaddrLogon', g_GameCommand.DENYIPLOGON.nPermissionMin)
  else g_GameCommand.DENYIPLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DenyAccountLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DenyAccountLogon',g_GameCommand.DENYACCOUNTLOGON.sCmd)
  else g_GameCommand.DENYACCOUNTLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DenyAccountLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DenyAccountLogon', g_GameCommand.DENYACCOUNTLOGON.nPermissionMin)
  else g_GameCommand.DENYACCOUNTLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DenyCharNameLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DenyCharNameLogon',g_GameCommand.DENYCHARNAMELOGON.sCmd)
  else g_GameCommand.DENYCHARNAMELOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DenyCharNameLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DenyCharNameLogon', g_GameCommand.DENYCHARNAMELOGON.nPermissionMin)
  else g_GameCommand.DENYCHARNAMELOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelDenyIPLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelDenyIPLogon',g_GameCommand.DELDENYIPLOGON.sCmd)
  else g_GameCommand.DELDENYIPLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelDenyIPLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelDenyIPLogon', g_GameCommand.DELDENYIPLOGON.nPermissionMin)
  else g_GameCommand.DELDENYIPLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelDenyAccountLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelDenyAccountLogon',g_GameCommand.DELDENYACCOUNTLOGON.sCmd)
  else g_GameCommand.DELDENYACCOUNTLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelDenyAccountLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelDenyAccountLogon', g_GameCommand.DELDENYACCOUNTLOGON.nPermissionMin)
  else g_GameCommand.DELDENYACCOUNTLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','DelDenyCharNameLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','DelDenyCharNameLogon',g_GameCommand.DELDENYCHARNAMELOGON.sCmd)
  else g_GameCommand.DELDENYCHARNAMELOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','DelDenyCharNameLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','DelDenyCharNameLogon', g_GameCommand.DELDENYCHARNAMELOGON.nPermissionMin)
  else g_GameCommand.DELDENYCHARNAMELOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShowDenyIPLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShowDenyIPLogon',g_GameCommand.SHOWDENYIPLOGON.sCmd)
  else g_GameCommand.SHOWDENYIPLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShowDenyIPLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShowDenyIPLogon', g_GameCommand.SHOWDENYIPLOGON.nPermissionMin)
  else g_GameCommand.SHOWDENYIPLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShowDenyAccountLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShowDenyAccountLogon',g_GameCommand.SHOWDENYACCOUNTLOGON.sCmd)
  else g_GameCommand.SHOWDENYACCOUNTLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShowDenyAccountLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShowDenyAccountLogon', g_GameCommand.SHOWDENYACCOUNTLOGON.nPermissionMin)
  else g_GameCommand.SHOWDENYACCOUNTLOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShowDenyCharNameLogon','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShowDenyCharNameLogon',g_GameCommand.SHOWDENYCHARNAMELOGON.sCmd)
  else g_GameCommand.SHOWDENYCHARNAMELOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShowDenyCharNameLogon',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShowDenyCharNameLogon', g_GameCommand.SHOWDENYCHARNAMELOGON.nPermissionMin)
  else g_GameCommand.SHOWDENYCHARNAMELOGON.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ViewWhisper','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ViewWhisper',g_GameCommand.VIEWWHISPER.sCmd)
  else g_GameCommand.VIEWWHISPER.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ViewWhisper',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ViewWhisper', g_GameCommand.VIEWWHISPER.nPermissionMin)
  else g_GameCommand.VIEWWHISPER.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SpiritStart','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SpiritStart',g_GameCommand.SPIRIT.sCmd)
  else g_GameCommand.SPIRIT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SpiritStart',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SpiritStart', g_GameCommand.SPIRIT.nPermissionMin)
  else g_GameCommand.SPIRIT.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SpiritStop','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SpiritStop',g_GameCommand.SPIRITSTOP.sCmd)
  else g_GameCommand.SPIRITSTOP.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SpiritStop',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SpiritStop', g_GameCommand.SPIRITSTOP.nPermissionMin)
  else g_GameCommand.SPIRITSTOP.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','SetMapMode','');
  if LoadString = '' then
    CommandConf.WriteString('Command','SetMapMode',g_GameCommand.SETMAPMODE.sCmd)
  else g_GameCommand.SETMAPMODE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','SetMapMode',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','SetMapMode', g_GameCommand.SETMAPMODE.nPermissionMin)
  else g_GameCommand.SETMAPMODE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ShoweMapMode','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ShoweMapMode',g_GameCommand.SHOWMAPMODE.sCmd)
  else g_GameCommand.SHOWMAPMODE.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ShoweMapMode',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ShoweMapMode', g_GameCommand.SHOWMAPMODE.nPermissionMin)
  else g_GameCommand.SHOWMAPMODE.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','ClearBag','');
  if LoadString = '' then
    CommandConf.WriteString('Command','ClearBag',g_GameCommand.CLEARBAG.sCmd)
  else g_GameCommand.CLEARBAG.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','ClearBag',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','ClearBag', g_GameCommand.CLEARBAG.nPermissionMin)
  else g_GameCommand.CLEARBAG.nPermissionMin:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','LockLogin','');
  if LoadString = '' then
    CommandConf.WriteString('Command','LockLogin',g_GameCommand.LOCKLOGON.sCmd)
  else g_GameCommand.LOCKLOGON.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','LockLogin',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','LockLogin', g_GameCommand.LOCKLOGON.nPermissionMin)
  else g_GameCommand.LOCKLOGON.nPermissionMin:=nLoadInteger;

  LoadString := CommandConf.ReadString('Command', 'GETUSERITEM', '');    //雀荐
  if LoadString = '' then
    CommandConf.WriteString('Command', 'GETUSERITEM', g_GameCommand.GetUserItem.sCmd)
  else g_GameCommand.GetUserItem.sCmd := LoadString;
  nLoadInteger := CommandConf.ReadInteger('Permission', 'GETUSERITEM', -1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission', 'GETUSERITEM', g_GameCommand.GetUserItem.nPermissionMin)
  else g_GameCommand.GetUserItem.nPermissionMin := nLoadInteger;

  LoadString := CommandConf.ReadString('Command', 'ADDUSERITEM', '');    //林扁
  if LoadString = '' then
    CommandConf.WriteString('Command', 'ADDUSERITEM', g_GameCommand.AddUserItem.sCmd)
  else g_GameCommand.AddUserItem.sCmd := LoadString;
  nLoadInteger := CommandConf.ReadInteger('Permission', 'ADDUSERITEM', -1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission', 'ADDUSERITEM', g_GameCommand.AddUserItem.nPermissionMin)
  else g_GameCommand.AddUserItem.nPermissionMin := nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GMRedMsgCmd','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GMRedMsgCmd',g_GMRedMsgCmd)
  else g_GMRedMsgCmd:=LoadString[1];
  nLoadInteger:=CommandConf.ReadInteger('Permission','GMRedMsgCmd',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GMRedMsgCmd', g_nGMREDMSGCMD)
  else g_nGMREDMSGCMD:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','GMRedMsgCmd1','');
  if LoadString = '' then
    CommandConf.WriteString('Command','GMRedMsgCmd1',g_GMRedMsgCmd1)
  else g_GMRedMsgCmd1:=LoadString[1];
  nLoadInteger:=CommandConf.ReadInteger('Permission','GMRedMsgCmd1',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','GMRedMsgCmd1', g_nGMREDMSGCMD1)
  else g_nGMREDMSGCMD1:=nLoadInteger;

  LoadString:=CommandConf.ReadString('Command','TradeGT','');
  if LoadString = '' then
    CommandConf.WriteString('Command','TradeGT',g_GameCommand.TradeGT.sCmd)
  else g_GameCommand.TradeGT.sCmd:=LoadString;
  nLoadInteger:=CommandConf.ReadInteger('Permission','TradeGT',-1);
  if nLoadInteger < 0 then
    CommandConf.WriteInteger('Permission','TradeGT', g_GameCommand.TradeGT.nPermissionMin)
  else g_GameCommand.TradeGT.nPermissionMin:=nLoadInteger;
end;

procedure LoadString();
  function LoadConfigString(sSection,sIdent,sDefault: String):String;
  var
    sString:String;
  begin
    sString:=StringConf.ReadString(sSection,sIdent,'');
    if sString = '' then begin
      StringConf.WriteString(sSection,sIdent,sDefault);
      Result:=sDefault;
    end else begin
      Result:=sString;
    end;
  end;
var
  LoadString:String;
begin
  LoadString:=StringConf.ReadString('String','ClientSoftVersionError','');
  if LoadString = '' then
    StringConf.WriteString('String','ClientSoftVersionError',sClientSoftVersionError)
  else sClientSoftVersionError:=LoadString;

  LoadString:=StringConf.ReadString('String','DownLoadNewClientSoft','');
  if LoadString = '' then
    StringConf.WriteString('String','DownLoadNewClientSoft',sDownLoadNewClientSoft)
  else sDownLoadNewClientSoft:=LoadString;

  LoadString:=StringConf.ReadString('String','ForceDisConnect','');
  if LoadString = '' then
    StringConf.WriteString('String','ForceDisConnect',sForceDisConnect)
  else sForceDisConnect:=LoadString;

  LoadString:=StringConf.ReadString('String','ClientSoftVersionTooOld','');
  if LoadString = '' then
    StringConf.WriteString('String','ClientSoftVersionTooOld',sClientSoftVersionTooOld)
  else sClientSoftVersionTooOld:=LoadString;

  LoadString:=StringConf.ReadString('String','DownLoadAndUseNewClient','');
  if LoadString = '' then
    StringConf.WriteString('String','DownLoadAndUseNewClient',sDownLoadAndUseNewClient)
  else sDownLoadAndUseNewClient:=LoadString;

  LoadString:=StringConf.ReadString('String','OnlineUserFull','');
  if LoadString = '' then
    StringConf.WriteString('String','OnlineUserFull',sOnlineUserFull)
  else sOnlineUserFull:=LoadString;

  LoadString:=StringConf.ReadString('String','YouNowIsTryPlayMode','');
  if LoadString = '' then
    StringConf.WriteString('String','YouNowIsTryPlayMode',sYouNowIsTryPlayMode)
  else sYouNowIsTryPlayMode:=LoadString;

  LoadString:=StringConf.ReadString('String','NowIsFreePlayMode','');
  if LoadString = '' then
    StringConf.WriteString('String','NowIsFreePlayMode',g_sNowIsFreePlayMode)
  else g_sNowIsFreePlayMode:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOfAll','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOfAll',sAttackModeOfAll)
  else sAttackModeOfAll:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOfPeaceful','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOfPeaceful',sAttackModeOfPeaceful)
  else sAttackModeOfPeaceful:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOfGroup','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOfGroup',sAttackModeOfGroup)
  else sAttackModeOfGroup:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOfGuild','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOfGuild',sAttackModeOfGuild)
  else sAttackModeOfGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOFEnemy','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOFEnemy',sAttackModeOfGuild)
  else sAttackModeOfGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','AttackModeOfRedWhite','');
  if LoadString = '' then
    StringConf.WriteString('String','AttackModeOfRedWhite',sAttackModeOfRedWhite)
  else sAttackModeOfRedWhite:=LoadString;

  LoadString:=StringConf.ReadString('String','StartChangeAttackModeHelp','');
  if LoadString = '' then
    StringConf.WriteString('String','StartChangeAttackModeHelp',sStartChangeAttackModeHelp)
  else sStartChangeAttackModeHelp:=LoadString;

  LoadString:=StringConf.ReadString('String','StartNoticeMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','StartNoticeMsg',sStartNoticeMsg)
  else sStartNoticeMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','ThrustingOn','');
  if LoadString = '' then
    StringConf.WriteString('String','ThrustingOn',sThrustingOn)
  else sThrustingOn:=LoadString;

  LoadString:=StringConf.ReadString('String','ThrustingOff','');
  if LoadString = '' then
    StringConf.WriteString('String','ThrustingOff',sThrustingOff)
  else sThrustingOff:=LoadString;

  LoadString:=StringConf.ReadString('String','HalfMoonOn','');
  if LoadString = '' then
    StringConf.WriteString('String','HalfMoonOn',sHalfMoonOn)
  else sHalfMoonOn:=LoadString;

  LoadString:=StringConf.ReadString('String','HalfMoonOff','');
  if LoadString = '' then
    StringConf.WriteString('String','HalfMoonOff',sHalfMoonOff)
  else sHalfMoonOff:=LoadString;

  LoadString:=StringConf.ReadString('String','WindBladeOn','');    //浅八贱
  if LoadString = '' then
    StringConf.WriteString('String','WindBladeOn',sWindBladeOn)
  else sWindBladeOn:=LoadString;

  LoadString:=StringConf.ReadString('String','WindBladeOff','');      //浅八贱
  if LoadString = '' then
    StringConf.WriteString('String','WindBladeOff',sWindBladeOff)
  else sWindBladeOff:=LoadString;

  sCrsHitOn  := LoadConfigString('String','CrsHitOn',sCrsHitOn);
  sCrsHitOff := LoadConfigString('String','CrsHitOff',sCrsHitOff);

  LoadString:=StringConf.ReadString('String','FireSpiritsSummoned','');
  if LoadString = '' then
    StringConf.WriteString('String','FireSpiritsSummoned',sFireSpiritsSummoned)
  else sFireSpiritsSummoned:=LoadString;

  LoadString:=StringConf.ReadString('String','FireSpiritsFail','');
  if LoadString = '' then
    StringConf.WriteString('String','FireSpiritsFail',sFireSpiritsFail)
  else sFireSpiritsFail:=LoadString;

  LoadString:=StringConf.ReadString('String','SpiritsGone','');
  if LoadString = '' then
    StringConf.WriteString('String','SpiritsGone',sSpiritsGone)
  else sSpiritsGone:=LoadString;


  LoadString:=StringConf.ReadString('String','MateDoTooweak','');
  if LoadString = '' then
    StringConf.WriteString('String','MateDoTooweak',sMateDoTooweak)
  else sMateDoTooweak:=LoadString;

  LoadString:=StringConf.ReadString('String','TheWeaponBroke','');
  if LoadString = '' then
    StringConf.WriteString('String','TheWeaponBroke',g_sTheWeaponBroke)
  else g_sTheWeaponBroke:=LoadString;

  LoadString:=StringConf.ReadString('String','TheWeaponRefineSuccessfull','');
  if LoadString = '' then
    StringConf.WriteString('String','TheWeaponRefineSuccessfull',sTheWeaponRefineSuccessfull)
  else sTheWeaponRefineSuccessfull:=LoadString;

  LoadString:=StringConf.ReadString('String','PetRest1','');
  if LoadString = '' then
    StringConf.WriteString('String','PetRest1',sPetRest1)
  else sPetRest1:=LoadString;

  LoadString:=StringConf.ReadString('String','PetAttack1','');
  if LoadString = '' then
    StringConf.WriteString('String','PetAttack1',sPetAttack1)
  else sPetAttack1:=LoadString;

  LoadString:=StringConf.ReadString('String','WearNotOfWoMan','');
  if LoadString = '' then
    StringConf.WriteString('String','WearNotOfWoMan',sWearNotOfWoMan)
  else sWearNotOfWoMan:=LoadString;

  LoadString:=StringConf.ReadString('String','WearNotOfMan','');
  if LoadString = '' then
    StringConf.WriteString('String','WearNotOfMan',sWearNotOfMan)
  else sWearNotOfMan:=LoadString;

  LoadString:=StringConf.ReadString('String','WearNotOfJob','');
  if LoadString = '' then
    StringConf.WriteString('String','WearNotOfJob',sWearNotOfJob)
  else sWearNotOfJob:=LoadString;

  LoadString:=StringConf.ReadString('String','HandWeightNot','');
  if LoadString = '' then
    StringConf.WriteString('String','HandWeightNot',sHandWeightNot)
  else sHandWeightNot:=LoadString;

  LoadString:=StringConf.ReadString('String','WearWeightNot','');
  if LoadString = '' then
    StringConf.WriteString('String','WearWeightNot',sWearWeightNot)
  else sWearWeightNot:=LoadString;

  LoadString:=StringConf.ReadString('String','ItemIsNotThisAccount','');
  if LoadString = '' then
    StringConf.WriteString('String','ItemIsNotThisAccount',g_sItemIsNotThisAccount)
  else g_sItemIsNotThisAccount:=LoadString;

  LoadString:=StringConf.ReadString('String','ItemIsNotThisIPaddr','');
  if LoadString = '' then
    StringConf.WriteString('String','ItemIsNotThisIPaddr',g_sItemIsNotThisIPaddr)
  else g_sItemIsNotThisIPaddr:=LoadString;

  LoadString:=StringConf.ReadString('String','ItemIsNotThisCharName','');
  if LoadString = '' then
    StringConf.WriteString('String','ItemIsNotThisCharName',g_sItemIsNotThisCharName)
  else g_sItemIsNotThisCharName:=LoadString;

  LoadString:=StringConf.ReadString('String','LevelNot','');
  if LoadString = '' then
    StringConf.WriteString('String','LevelNot',g_sLevelNot)
  else g_sLevelNot:=LoadString;

  LoadString:=StringConf.ReadString('String','JobOrLevelNot','');
  if LoadString = '' then
    StringConf.WriteString('String','JobOrLevelNot',g_sJobOrLevelNot)
  else g_sJobOrLevelNot:=LoadString;

  LoadString:=StringConf.ReadString('String','JobOrDCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','JobOrDCNot',g_sJobOrDCNot)
  else g_sJobOrDCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','JobOrMCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','JobOrMCNot',g_sJobOrMCNot)
  else g_sJobOrMCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','JobOrSCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','JobOrSCNot',g_sJobOrSCNot)
  else g_sJobOrSCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','DCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','DCNot', g_sDCNot)
  else  g_sDCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','MCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','MCNot', g_sMCNot)
  else  g_sMCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','SCNot','');
  if LoadString = '' then
    StringConf.WriteString('String','SCNot', g_sSCNot)
  else  g_sSCNot:=LoadString;

  LoadString:=StringConf.ReadString('String','ReNewLevelNot','');
  if LoadString = '' then
    StringConf.WriteString('String','ReNewLevelNot', g_sReNewLevelNot)
  else  g_sReNewLevelNot:=LoadString;

  LoadString:=StringConf.ReadString('String','GuildNot','');
  if LoadString = '' then
    StringConf.WriteString('String','GuildNot', g_sGuildNot )
  else  g_sGuildNot :=LoadString;

  LoadString:=StringConf.ReadString('String','GuildMasterNot','');
  if LoadString = '' then
    StringConf.WriteString('String','GuildMasterNot', g_sGuildMasterNot )
  else  g_sGuildMasterNot :=LoadString;

  LoadString:=StringConf.ReadString('String','SabukHumanNot','');
  if LoadString = '' then
    StringConf.WriteString('String','SabukHumanNot', g_sSabukHumanNot )
  else  g_sSabukHumanNot :=LoadString;

  LoadString:=StringConf.ReadString('String','SabukMasterManNot','');
  if LoadString = '' then
    StringConf.WriteString('String','SabukMasterManNot', g_sSabukMasterManNot )
  else  g_sSabukMasterManNot :=LoadString;

  LoadString:=StringConf.ReadString('String','CanottWearIt','');
  if LoadString = '' then
    StringConf.WriteString('String','CanottWearIt',g_sCanottWearIt)
  else g_sCanottWearIt:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotUseDrugOnThisMap','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotUseDrugOnThisMap',sCanotUseDrugOnThisMap)
  else sCanotUseDrugOnThisMap:=LoadString;

  LoadString:=StringConf.ReadString('String','GameMasterMode','');
  if LoadString = '' then
    StringConf.WriteString('String','GameMasterMode',sGameMasterMode)
  else sGameMasterMode:=LoadString;

  LoadString:=StringConf.ReadString('String','ReleaseGameMasterMode','');
  if LoadString = '' then
    StringConf.WriteString('String','ReleaseGameMasterMode',sReleaseGameMasterMode)
  else sReleaseGameMasterMode:=LoadString;

  LoadString:=StringConf.ReadString('String','ObserverMode','');
  if LoadString = '' then
    StringConf.WriteString('String','ObserverMode',sObserverMode)
  else sObserverMode:=LoadString;

  LoadString:=StringConf.ReadString('String','ReleaseObserverMode','');
  if LoadString = '' then
    StringConf.WriteString('String','ReleaseObserverMode',g_sReleaseObserverMode)
  else g_sReleaseObserverMode:=LoadString;

  LoadString:=StringConf.ReadString('String','SupermanMode','');
  if LoadString = '' then
    StringConf.WriteString('String','SupermanMode',sSupermanMode)
  else sSupermanMode:=LoadString;

  LoadString:=StringConf.ReadString('String','ReleaseSupermanMode','');
  if LoadString = '' then
    StringConf.WriteString('String','ReleaseSupermanMode',sReleaseSupermanMode)
  else sReleaseSupermanMode:=LoadString;

  LoadString:=StringConf.ReadString('String','YouFoundNothing','');
  if LoadString = '' then
    StringConf.WriteString('String','YouFoundNothing',sYouFoundNothing)
  else sYouFoundNothing:=LoadString;

  LoadString:=StringConf.ReadString('String','LineNoticePreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','LineNoticePreFix',g_Config.sLineNoticePreFix)
  else g_Config.sLineNoticePreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','SysMsgPreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','SysMsgPreFix',g_Config.sSysMsgPreFix)
  else g_Config.sSysMsgPreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','GuildMsgPreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','GuildMsgPreFix',g_Config.sGuildMsgPreFix)
  else g_Config.sGuildMsgPreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','GroupMsgPreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','GroupMsgPreFix',g_Config.sGroupMsgPreFix)
  else g_Config.sGroupMsgPreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','HintMsgPreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','HintMsgPreFix',g_Config.sHintMsgPreFix)
  else g_Config.sHintMsgPreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','GMRedMsgpreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','GMRedMsgpreFix',g_Config.sGMRedMsgpreFix)
  else g_Config.sGMRedMsgpreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','MonSayMsgpreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','MonSayMsgpreFix',g_Config.sMonSayMsgpreFix)
  else g_Config.sMonSayMsgpreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','CustMsgpreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','CustMsgpreFix',g_Config.sCustMsgpreFix)
  else g_Config.sCustMsgpreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','CastleMsgpreFix','');
  if LoadString = '' then
    StringConf.WriteString('String','CastleMsgpreFix',g_Config.sCastleMsgpreFix)
  else g_Config.sCastleMsgpreFix:=LoadString;

  LoadString:=StringConf.ReadString('String','NoPasswordLockSystemMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','NoPasswordLockSystemMsg',g_sNoPasswordLockSystemMsg)
  else g_sNoPasswordLockSystemMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','AlreadySetPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','AlreadySetPassword',g_sAlreadySetPasswordMsg)
  else g_sAlreadySetPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ReSetPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','ReSetPassword',g_sReSetPasswordMsg)
  else g_sReSetPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PasswordOverLong','');
  if LoadString = '' then
    StringConf.WriteString('String','PasswordOverLong',g_sPasswordOverLongMsg)
  else g_sPasswordOverLongMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ReSetPasswordOK','');
  if LoadString = '' then
    StringConf.WriteString('String','ReSetPasswordOK',g_sReSetPasswordOKMsg)
  else g_sReSetPasswordOKMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ReSetPasswordNotMatch','');
  if LoadString = '' then
    StringConf.WriteString('String','ReSetPasswordNotMatch',g_sReSetPasswordNotMatchMsg)
  else g_sReSetPasswordNotMatchMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PleaseInputUnLockPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','PleaseInputUnLockPassword',g_sPleaseInputUnLockPasswordMsg)
  else g_sPleaseInputUnLockPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageUnLockOK','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageUnLockOK',g_sStorageUnLockOKMsg)
  else g_sStorageUnLockOKMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageAlreadyUnLock','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageAlreadyUnLock',g_sStorageAlreadyUnLockMsg)
  else g_sStorageAlreadyUnLockMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageNoPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageNoPassword',g_sStorageNoPasswordMsg)
  else g_sStorageNoPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','UnLockPasswordFail','');
  if LoadString = '' then
    StringConf.WriteString('String','UnLockPasswordFail',g_sUnLockPasswordFailMsg)
  else g_sUnLockPasswordFailMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','LockStorageSuccess','');
  if LoadString = '' then
    StringConf.WriteString('String','LockStorageSuccess',g_sLockStorageSuccessMsg)
  else g_sLockStorageSuccessMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StoragePasswordClearMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','StoragePasswordClearMsg',g_sStoragePasswordClearMsg)
  else g_sStoragePasswordClearMsg:=LoadString;
  LoadString:=StringConf.ReadString('String','PleaseUnloadStoragePasswordMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PleaseUnloadStoragePasswordMsg',g_sPleaseUnloadStoragePasswordMsg)
  else g_sPleaseUnloadStoragePasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageAlreadyLock','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageAlreadyLock',g_sStorageAlreadyLockMsg)
  else g_sStorageAlreadyLockMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StoragePasswordLocked','');
  if LoadString = '' then
    StringConf.WriteString('String','StoragePasswordLocked',g_sStoragePasswordLockedMsg)
  else g_sStoragePasswordLockedMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageSetPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageSetPassword',g_sSetPasswordMsg)
  else g_sSetPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PleaseInputOldPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','PleaseInputOldPassword',g_sPleaseInputOldPasswordMsg)
  else g_sPleaseInputOldPasswordMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PasswordIsClearMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PasswordIsClearMsg',g_sOldPasswordIsClearMsg)
  else g_sOldPasswordIsClearMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','NoPasswordSet','');
  if LoadString = '' then
    StringConf.WriteString('String','NoPasswordSet',g_sNoPasswordSetMsg)
  else g_sNoPasswordSetMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','OldPasswordIncorrect','');
  if LoadString = '' then
    StringConf.WriteString('String','OldPasswordIncorrect',g_sOldPasswordIncorrectMsg)
  else g_sOldPasswordIncorrectMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','StorageIsLocked','');
  if LoadString = '' then
    StringConf.WriteString('String','StorageIsLocked',g_sStorageIsLockedMsg)
  else g_sStorageIsLockedMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PleaseTryDealLaterMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PleaseTryDealLaterMsg',g_sPleaseTryDealLaterMsg)
  else g_sPleaseTryDealLaterMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DealItemsDenyGetBackMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DealItemsDenyGetBackMsg',g_sDealItemsDenyGetBackMsg)
  else g_sDealItemsDenyGetBackMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DealItemsDenyGetBackMsg2','');
  if LoadString = '' then
    StringConf.WriteString('String','DealItemsDenyGetBackMsg2',g_sDealItemsDenyGetBackMsg2)
  else g_sDealItemsDenyGetBackMsg2:=LoadString;


  LoadString:=StringConf.ReadString('String','DisableDealItemsMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableDealItemsMsg',g_sDisableDealItemsMsg)
  else g_sDisableDealItemsMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotTryDealMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotTryDealMsg',g_sCanotTryDealMsg)
  else g_sCanotTryDealMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DealActionCancelMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DealActionCancelMsg',g_sDealActionCancelMsg)
  else g_sDealActionCancelMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PoseDisableDealMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PoseDisableDealMsg',g_sPoseDisableDealMsg)
  else g_sPoseDisableDealMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DealSuccessMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DealSuccessMsg',g_sDealSuccessMsg)
  else g_sDealSuccessMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DealOKTooFast','');
  if LoadString = '' then
    StringConf.WriteString('String','DealOKTooFast',g_sDealOKTooFast)
  else g_sDealOKTooFast:=LoadString;

  LoadString:=StringConf.ReadString('String','YourBagSizeTooSmall','');
  if LoadString = '' then
    StringConf.WriteString('String','YourBagSizeTooSmall',g_sYourBagSizeTooSmall)
  else g_sYourBagSizeTooSmall:=LoadString;

  LoadString:=StringConf.ReadString('String','DealHumanBagSizeTooSmall','');
  if LoadString = '' then
    StringConf.WriteString('String','DealHumanBagSizeTooSmall',g_sDealHumanBagSizeTooSmall)
  else g_sDealHumanBagSizeTooSmall:=LoadString;

  LoadString:=StringConf.ReadString('String','YourGoldLargeThenLimit','');
  if LoadString = '' then
    StringConf.WriteString('String','YourGoldLargeThenLimit',g_sYourGoldLargeThenLimit)
  else g_sYourGoldLargeThenLimit:=LoadString;

  LoadString:=StringConf.ReadString('String','DealHumanGoldLargeThenLimit','');
  if LoadString = '' then
    StringConf.WriteString('String','DealHumanGoldLargeThenLimit',g_sDealHumanGoldLargeThenLimit)
  else g_sDealHumanGoldLargeThenLimit:=LoadString;

  LoadString:=StringConf.ReadString('String','YourGameGoldLargeThenLimit','');
  if LoadString = '' then
    StringConf.WriteString('String','YourGameGoldLargeThenLimit',g_sYourGameGoldLargeThenLimit)
  else g_sYourGameGoldLargeThenLimit:=LoadString;

  LoadString:=StringConf.ReadString('String','YouDealOKMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouDealOKMsg',g_sYouDealOKMsg)
  else g_sYouDealOKMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PoseDealOKMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PoseDealOKMsg',g_sPoseDealOKMsg)
  else g_sPoseDealOKMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','KickClientUserMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','KickClientUserMsg',g_sKickClientUserMsg)
  else g_sKickClientUserMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ActionIsLockedMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ActionIsLockedMsg',g_sActionIsLockedMsg)
  else g_sActionIsLockedMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','PasswordNotSetMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','PasswordNotSetMsg',g_sPasswordNotSetMsg)
  else g_sPasswordNotSetMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','NotPasswordProtectMode','');
  if LoadString = '' then
    StringConf.WriteString('String','NotPasswordProtectMode',g_sNotPasswordProtectMode)
  else g_sNotPasswordProtectMode:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotDropGoldMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotDropGoldMsg',g_sCanotDropGoldMsg)
  else g_sCanotDropGoldMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotDropInSafeZoneMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotDropInSafeZoneMsg',g_sCanotDropInSafeZoneMsg)
  else g_sCanotDropInSafeZoneMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotDropItemMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotDropItemMsg',g_sCanotDropItemMsg)
  else g_sCanotDropItemMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotDropItemMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotDropItemMsg',g_sCanotDropItemMsg)
  else g_sCanotDropItemMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotUseItemMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotUseItemMsg',g_sCanotUseItemMsg)
  else g_sCanotUseItemMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','MyInfo','');
  if LoadString = '' then
    StringConf.WriteString('String','MyInfo',g_sMyInfo)
  else g_sMyInfo:=LoadString;

  LoadString:=StringConf.ReadString('String','OpenedDealMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','OpenedDealMsg',g_sOpenedDealMsg)
  else g_sOpenedDealMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','SendCustMsgCanNotUseNowMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','SendCustMsgCanNotUseNowMsg',g_sSendCustMsgCanNotUseNowMsg)
  else g_sSendCustMsgCanNotUseNowMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','SubkMasterMsgCanNotUseNowMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','SubkMasterMsgCanNotUseNowMsg',g_sSubkMasterMsgCanNotUseNowMsg)
  else g_sSubkMasterMsgCanNotUseNowMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','SendOnlineCountMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','SendOnlineCountMsg',g_sSendOnlineCountMsg)
  else g_sSendOnlineCountMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','WeaponRepairSuccess','');
  if LoadString = '' then
    StringConf.WriteString('String','WeaponRepairSuccess',g_sWeaponRepairSuccess)
  else g_sWeaponRepairSuccess:=LoadString;

  LoadString:=StringConf.ReadString('String','TigerRepairSuccess','');
  if LoadString = '' then
    StringConf.WriteString('String','TigerRepairSuccess',g_sTigerRepairSuccess)
  else g_sTigerRepairSuccess:=LoadString;


  LoadString:=StringConf.ReadString('String','DefenceUpTime','');
  if LoadString = '' then
    StringConf.WriteString('String','DefenceUpTime',g_sDefenceUpTime)
  else g_sDefenceUpTime:=LoadString;

  LoadString:=StringConf.ReadString('String','MagDefenceUpTime','');
  if LoadString = '' then
    StringConf.WriteString('String','MagDefenceUpTime',g_sMagDefenceUpTime)
  else g_sMagDefenceUpTime:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery1Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery1Msg',g_sWinLottery1Msg)
  else g_sWinLottery1Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery2Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery2Msg',g_sWinLottery2Msg)
  else g_sWinLottery2Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery3Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery3Msg',g_sWinLottery3Msg)
  else g_sWinLottery3Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery4Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery4Msg',g_sWinLottery4Msg)
  else g_sWinLottery4Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery5Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery5Msg',g_sWinLottery5Msg)
  else g_sWinLottery5Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','WinLottery6Msg','');
  if LoadString = '' then
    StringConf.WriteString('String','WinLottery6Msg',g_sWinLottery6Msg)
  else g_sWinLottery6Msg:=LoadString;

  LoadString:=StringConf.ReadString('String','NotWinLotteryMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','NotWinLotteryMsg',g_sNotWinLotteryMsg)
  else g_sNotWinLotteryMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','WeaptonMakeLuck','');
  if LoadString = '' then
    StringConf.WriteString('String','WeaptonMakeLuck',g_sWeaptonMakeLuck)
  else g_sWeaptonMakeLuck:=LoadString;

  LoadString:=StringConf.ReadString('String','WeaptonNotMakeLuck','');
  if LoadString = '' then
    StringConf.WriteString('String','WeaptonNotMakeLuck',g_sWeaptonNotMakeLuck)
  else g_sWeaptonNotMakeLuck:=LoadString;

  LoadString:=StringConf.ReadString('String','TheWeaponIsCursed','');
  if LoadString = '' then
    StringConf.WriteString('String','TheWeaponIsCursed',g_sTheWeaponIsCursed)
  else g_sTheWeaponIsCursed:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotTakeOffItem','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotTakeOffItem',g_sCanotTakeOffItem)
  else g_sCanotTakeOffItem:=LoadString;

  LoadString:=StringConf.ReadString('String','TryModeCanotUseStorage','');
  if LoadString = '' then
    StringConf.WriteString('String','TryModeCanotUseStorage',g_sTryModeCanotUseStorage)
  else g_sTryModeCanotUseStorage:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotGetItemsMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotGetItemsMsg',g_sCanotGetItems)
  else g_sCanotGetItems:=LoadString;


  LoadString:=StringConf.ReadString('String','NowCurrDateTime','');
  if LoadString = '' then
    StringConf.WriteString('String','NowCurrDateTime',g_sNowCurrDateTime)
  else g_sNowCurrDateTime:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableHearWhisper','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableHearWhisper',g_sEnableHearWhisper)
  else g_sEnableHearWhisper:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableHearWhisper','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableHearWhisper',g_sDisableHearWhisper)
  else g_sDisableHearWhisper:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableStoreMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableStoreMsg',g_sEnableStoreMsg)
  else g_sEnableStoreMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableStoreMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableStoreMsg',g_sDisableStoreMsg)
  else g_sDisableStoreMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','EnableShoutMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableShoutMsg',g_sEnableShoutMsg)
  else g_sEnableShoutMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableShoutMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableShoutMsg',g_sDisableShoutMsg)
  else g_sDisableShoutMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableDealMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableDealMsg',g_sEnableDealMsg)
  else g_sEnableDealMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableDealMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableDealMsg',g_sDisableDealMsg)
  else g_sDisableDealMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableGuildChat','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableGuildChat',g_sEnableGuildChat)
  else g_sEnableGuildChat:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableGuildChat','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableGuildChat',g_sDisableGuildChat)
  else g_sDisableGuildChat:=LoadString;


  LoadString:=StringConf.ReadString('String','EnableGroupChat','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableGroupChat',g_sEnableGroupChat)
  else g_sEnableGroupChat:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableGroupChat','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableGroupChat',g_sDisableGroupChat)
  else g_sDisableGroupChat:=LoadString;


  LoadString:=StringConf.ReadString('String','EnableSysMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableSysMsg',g_sEnableSysMsg)
  else g_sEnableSysMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableSysMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableSysMsg',g_sDisableSysMsg)
  else g_sDisableSysMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','EnableHearMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableHearMsg',g_sEnableHearMsg)
  else g_sEnableHearMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableHearMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableHearMsg',g_sDisableHearMsg)
  else g_sDisableHearMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','EnableJoinGuild','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableJoinGuild',g_sEnableJoinGuild)
  else g_sEnableJoinGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableJoinGuild','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableJoinGuild',g_sDisableJoinGuild)
  else g_sDisableJoinGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableAuthAllyGuild','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableAuthAllyGuild',g_sEnableAuthAllyGuild)
  else g_sEnableAuthAllyGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableAuthAllyGuild','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableAuthAllyGuild',g_sDisableAuthAllyGuild)
  else g_sDisableAuthAllyGuild:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableGroupRecall','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableGroupRecall',g_sEnableGroupRecall)
  else g_sEnableGroupRecall:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableGroupRecall','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableGroupRecall',g_sDisableGroupRecall)
  else g_sDisableGroupRecall:=LoadString;

  LoadString:=StringConf.ReadString('String','EnableGuildRecall','');
  if LoadString = '' then
    StringConf.WriteString('String','EnableGuildRecall',g_sEnableGuildRecall)
  else g_sEnableGuildRecall:=LoadString;

  LoadString:=StringConf.ReadString('String','DisableGuildRecall','');
  if LoadString = '' then
    StringConf.WriteString('String','DisableGuildRecall',g_sDisableGuildRecall)
  else g_sDisableGuildRecall:=LoadString;

  LoadString:=StringConf.ReadString('String','PleaseInputPassword','');
  if LoadString = '' then
    StringConf.WriteString('String','PleaseInputPassword',g_sPleaseInputPassword)
  else g_sPleaseInputPassword:=LoadString;

  LoadString:=StringConf.ReadString('String','TheMapDisableMove','');
  if LoadString = '' then
    StringConf.WriteString('String','TheMapDisableMove',g_sTheMapDisableMove)
  else g_sTheMapDisableMove:=LoadString;

  LoadString:=StringConf.ReadString('String','TheMapNotFound','');
  if LoadString = '' then
    StringConf.WriteString('String','TheMapNotFound',g_sTheMapNotFound)
  else g_sTheMapNotFound:=LoadString;

  LoadString:=StringConf.ReadString('String','YourIPaddrDenyLogon','');
  if LoadString = '' then
    StringConf.WriteString('String','YourIPaddrDenyLogon',g_sYourIPaddrDenyLogon)
  else g_sYourIPaddrDenyLogon:=LoadString;

  LoadString:=StringConf.ReadString('String','YourAccountDenyLogon','');
  if LoadString = '' then
    StringConf.WriteString('String','YourAccountDenyLogon',g_sYourAccountDenyLogon)
  else g_sYourAccountDenyLogon:=LoadString;

  LoadString:=StringConf.ReadString('String','YourCharNameDenyLogon','');
  if LoadString = '' then
    StringConf.WriteString('String','YourCharNameDenyLogon',g_sYourCharNameDenyLogon)
  else g_sYourCharNameDenyLogon:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotPickUpItem','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotPickUpItem',g_sCanotPickUpItem)
  else g_sCanotPickUpItem:=LoadString;

  LoadString:=StringConf.ReadString('String','CanotSendmsg','');
  if LoadString = '' then
    StringConf.WriteString('String','CanotSendmsg',g_sCanotSendmsg)
  else g_sCanotSendmsg:=LoadString;

  LoadString:=StringConf.ReadString('String','UserDenyWhisperMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','UserDenyWhisperMsg',g_sUserDenyWhisperMsg)
  else g_sUserDenyWhisperMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','UserNotOnLine','');
  if LoadString = '' then
    StringConf.WriteString('String','UserNotOnLine',g_sUserNotOnLine)
  else g_sUserNotOnLine:=LoadString;

  LoadString:=StringConf.ReadString('String','RevivalRecoverMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','RevivalRecoverMsg',g_sRevivalRecoverMsg)
  else g_sRevivalRecoverMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ClientVersionTooOld','');
  if LoadString = '' then
    StringConf.WriteString('String','ClientVersionTooOld',g_sClientVersionTooOld)
  else g_sClientVersionTooOld:=LoadString;

  LoadString:=StringConf.ReadString('String','CastleGuildName','');
  if LoadString = '' then
    StringConf.WriteString('String','CastleGuildName',g_sCastleGuildName)
  else g_sCastleGuildName:=LoadString;

  LoadString:=StringConf.ReadString('String','NoCastleGuildName','');
  if LoadString = '' then
    StringConf.WriteString('String','NoCastleGuildName',g_sNoCastleGuildName)
  else g_sNoCastleGuildName:=LoadString;

  LoadString:=StringConf.ReadString('String','WarrReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','WarrReNewName',g_sWarrReNewName)
  else g_sWarrReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','WizardReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','WizardReNewName',g_sWizardReNewName)
  else g_sWizardReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','TaosReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','TaosReNewName',g_sTaosReNewName)
  else g_sTaosReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','AssassinReNewName','');          //磊按
  if LoadString = '' then
    StringConf.WriteString('String','AssassinReNewName',g_sAssassinReNewName)
  else g_sAssassinReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','WarrUPReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','WarrUPReNewName',g_sWarrUPReNewName)
  else g_sWarrUPReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','WizardUPReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','WizardUPReNewName',g_sWizardUPReNewName)
  else g_sWizardUPReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','TaosUPReNewName','');
  if LoadString = '' then
    StringConf.WriteString('String','TaosUPReNewName',g_sTaosUPReNewName)
  else g_sTaosUPReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','AssassinUPReNewName','');          //磊按
  if LoadString = '' then
    StringConf.WriteString('String','AssassinUPReNewName',g_sAssassinUPReNewName)
  else g_sAssassinUPReNewName:=LoadString;

  LoadString:=StringConf.ReadString('String','RankLevelName','');
  if LoadString = '' then
    StringConf.WriteString('String','RankLevelName',g_sRankLevelName)
  else g_sRankLevelName:=LoadString;


  LoadString:=StringConf.ReadString('String','HumanShowName','');
  if LoadString = '' then
    StringConf.WriteString('String','HumanShowName',g_sHumanShowName)
  else g_sHumanShowName:=LoadString;

  //====================================================

  LoadString:=StringConf.ReadString('String','Column1','');
  if LoadString = '' then
    StringConf.WriteString('String','Column1',g_sColumn1)
  else g_sColumn1:=LoadString;

  LoadString:=StringConf.ReadString('String','Column2','');
  if LoadString = '' then
    StringConf.WriteString('String','Column2',g_sColumn2)
  else g_sColumn2:=LoadString;

  LoadString:=StringConf.ReadString('String','Column3','');
  if LoadString = '' then
    StringConf.WriteString('String','Column3',g_sColumn3)
  else g_sColumn3:=LoadString;

  LoadString:=StringConf.ReadString('String','Column4','');
  if LoadString = '' then
    StringConf.WriteString('String','Column4',g_sColumn4)
  else g_sColumn4:=LoadString;

  LoadString:=StringConf.ReadString('String','Column5','');
  if LoadString = '' then
    StringConf.WriteString('String','Column5',g_sColumn5)
  else g_sColumn5:=LoadString;

  LoadString:=StringConf.ReadString('String','Column6','');
  if LoadString = '' then
    StringConf.WriteString('String','Column6',g_sColumn6)
  else g_sColumn6:=LoadString;

  //====================================================

  LoadString:=StringConf.ReadString('String','ChangePermissionMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ChangePermissionMsg',g_sChangePermissionMsg)
  else g_sChangePermissionMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ChangeKillMonExpRateMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ChangeKillMonExpRateMsg',g_sChangeKillMonExpRateMsg)
  else g_sChangeKillMonExpRateMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ChangeMasterExpRateMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ChangeMasterExpRateMsg',g_sChangeMasterExpRateMsg)
  else g_sChangeMasterExpRateMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ChangePowerRateMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ChangePowerRateMsg',g_sChangePowerRateMsg)
  else g_sChangePowerRateMsg:=LoadString;



  LoadString:=StringConf.ReadString('String','ScriptChangeHumanHPMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ScriptChangeHumanHPMsg',g_sScriptChangeHumanHPMsg)
  else g_sScriptChangeHumanHPMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ScriptChangeHumanMPMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ScriptChangeHumanMPMsg',g_sScriptChangeHumanMPMsg)
  else g_sScriptChangeHumanMPMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouCanotDisableSayMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouCanotDisableSayMsg',g_sDisableSayMsg)
  else g_sDisableSayMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','OnlineCountMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','OnlineCountMsg',g_sOnlineCountMsg)
  else g_sOnlineCountMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','TotalOnlineCountMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','TotalOnlineCountMsg',g_sTotalOnlineCountMsg)
  else g_sTotalOnlineCountMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouNeedLevelSendMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouNeedLevelSendMsg',g_sYouNeedLevelMsg)
  else g_sYouNeedLevelMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','ThisMapDisableSendCyCyMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','ThisMapDisableSendCyCyMsg',g_sThisMapDisableSendCyCyMsg)
  else g_sThisMapDisableSendCyCyMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouCanSendCyCyLaterMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouCanSendCyCyLaterMsg',g_sYouCanSendCyCyLaterMsg)
  else g_sYouCanSendCyCyLaterMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouIsDisableSendMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouIsDisableSendMsg',g_sYouIsDisableSendMsg)
  else g_sYouIsDisableSendMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouMurderedMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouMurderedMsg',g_sYouMurderedMsg)
  else g_sYouMurderedMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouKilledByMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouKilledByMsg',g_sYouKilledByMsg)
  else g_sYouKilledByMsg:=LoadString;

  LoadString:=StringConf.ReadString('String','YouLoverKilledByMsg','');
  if LoadString = '' then
    StringConf.WriteString('String','YouLoverKilledByMsg',g_sYouLoverKilledByMsg)
  else g_sYouLoverKilledByMsg:=LoadString;


  LoadString:=StringConf.ReadString('String','YouProtectedByLawOfDefense','');
  if LoadString = '' then
    StringConf.WriteString('String','YouProtectedByLawOfDefense',g_sYouProtectedByLawOfDefense)
  else g_sYouProtectedByLawOfDefense:=LoadString;

  LoadString:=StringConf.ReadString('String','YouProtectedByLawOfDefenseKilld','');
  if LoadString = '' then
    StringConf.WriteString('String','YouProtectedByLawOfDefenseKilld',g_sYouProtectedByLawOfDefenseKilld)
  else g_sYouProtectedByLawOfDefenseKilld:=LoadString;



end;

{$IF IniSystem = 1}
procedure LoadSettings;
var
  m_nFileHandle    :Integer;
  m_Header         :TConfHeader;
  OldConfig        :TM2Config;
begin
  LoadString();
  LoadGameCommand();
  if FileExists(sConfigFileName) then begin
    m_nFileHandle:=FileOpen(sConfigFileName,fmOpenReadWrite or fmShareDenyNone);
    if m_nFileHandle > 0 then begin
      FileRead(m_nFileHandle,m_Header,SizeOf(TConfHeader));

      OldConfig := g_Config;
      if (FileRead(m_nFileHandle,g_Config,SizeOf(TM2Config)) <> SizeOf(TM2Config)) then begin
        //problem! incorrect size.. wrong file?
        g_Config := OldConfig; //Restore it..
        //let's recreate the file...
        FillChar(m_Header,SizeOf(TConfHeader),#0);
        m_Header.sName:= 'Damian�';
        m_Header.nVersion := 1;

        FileSeek(m_nFileHandle,0,0);
        FileWrite(m_nFileHandle,m_Header,SizeOf(TConfHeader));
        FileWrite(m_nFileHandle,g_Config,SizeOf(TM2Config));
      end;
      FileClose(m_nFileHandle);
    end;
  end else begin
    m_nFileHandle:=FileCreate(sConfigFileName);
    if m_nFileHandle > 0 then begin
      FillChar(m_Header,SizeOf(TConfHeader),#0);
      m_Header.sName:= 'Damian�';
      m_Header.nVersion := 1;

      FileWrite(m_nFileHandle,m_Header,SizeOf(TConfHeader));
      FileWrite(m_nFileHandle,g_Config,SizeOf(TM2Config));
      FileClose(m_nFileHandle);
    end;
  end;
end;

procedure SaveSettings;
var
  m_nFileHandle    :Integer;
  m_Header         :TConfHeader;
begin
  //Basically we are overwriting the old file, whether
  //it exists or not..
  m_nFileHandle:=FileCreate(sConfigFileName);
  if m_nFileHandle > 0 then begin
    FillChar(m_Header,SizeOf(TConfHeader),#0);
    m_Header.sName:= 'Damian�';
    m_Header.nVersion := 1;

    FileWrite(m_nFileHandle,m_Header,SizeOf(TConfHeader));
    FileWrite(m_nFileHandle,g_Config,SizeOf(TM2Config));
    FileClose(m_nFileHandle);
  end;
end;

{$ELSE}

procedure LoadConfig();
var
  I, II: Integer;
  Ini: TMemIniFile;
  nLoadInteger:Integer;
  nLoadFloat:Double;
  sLoadString:String;
begin
  LoadString();
  LoadGameCommand();
  LoadExp();
  //============================================================================  

  if Config.ReadString('Setup','Positions','.\Positions.ini') = '' then
    Config.WriteString('Setup','Positions',g_Config.PosFile);
  g_Config.PosFile:=Config.ReadString('Setup','Positions',g_Config.PosFile);

  ini := TMemIniFile.Create(g_Config.PosFile);
  frmMain.Left := ini.ReadInteger('GameServer','Left',(Screen.Width Div 2)-(frmMain.Width Div 2));
  frmMain.Top := ini.ReadInteger('GameServer','Top',(Screen.Height Div 2)-(frmMain.Height Div 2)-30);
  if ini.ReadString('GameServer','Resizeable','0') = '1' then begin
    frmMain.BorderStyle := bsSizeable;
    frmMain.BorderIcons := [biSystemMenu,biMinimize,biMaximize]
  end;
  ini.Free;



  if Config.ReadString('SQL','UseSQL','') = '' then
    Config.WriteString('SQL','UseSQL',BoolToStr2(g_Config.boUseSQL));
  g_Config.boUseSQL:=CompareText(Config.ReadString('SQL','UseSQL','FALSE'),'TRUE') = 0;

  if Config.ReadString('SQL','SQLHost','') = '' then
    Config.WriteString('SQL','SQLHost',g_Config.SQLHost);
  g_Config.SQLHost:=Config.ReadString('SQL','SQLHost',g_Config.SQLHost);

  nLoadInteger:=Config.ReadInteger('SQL','SQLPort',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('SQL','SQLPort',g_Config.SQLPort)
  else g_Config.SQLPort:=nLoadInteger;

  if Config.ReadString('SQL','SQLUsername','') = '' then
    Config.WriteString('SQL','SQLUsername',g_Config.SQLUsername);
  g_Config.SQLUsername:=Config.ReadString('SQL','SQLUsername',g_Config.SQLUsername);

  if Config.ReadString('SQL','SQLPassword','') = '' then
    Config.WriteString('SQL','SQLPassword',g_Config.SQLPassword);
  g_Config.SQLPassword:=Config.ReadString('SQL','SQLPassword',g_Config.SQLPassword);

  if Config.ReadString('SQL','SQLDatabase','') = '' then
    Config.WriteString('SQL','SQLDatabase',g_Config.SQLDatabase);
  g_Config.SQLDatabase:=Config.ReadString('SQL','SQLDatabase',g_Config.SQLDatabase);

  if Config.ReadString('SQL','SQLType','') = '' then
    Config.WriteString('SQL','SQLType',g_Config.SQLType);
  g_Config.SQLType:=Config.ReadString('SQL','SQLType',g_Config.SQLType);

  //============================================================================
  if StringConf.ReadString('Guild','GuildNotice','') = '' then
    StringConf.WriteString('Guild','GuildNotice',g_Config.sGuildNotice);
  g_Config.sGuildNotice:=StringConf.ReadString('Guild','GuildNotice',g_Config.sGuildNotice);

  if StringConf.ReadString('Guild','GuildWar','') = '' then
    StringConf.WriteString('Guild','GuildWar',g_Config.sGuildWar);
  g_Config.sGuildWar:=StringConf.ReadString('Guild','GuildWar',g_Config.sGuildWar);

  if StringConf.ReadString('Guild','GuildAll','') = '' then
    StringConf.WriteString('Guild','GuildAll',g_Config.sGuildAll);
  g_Config.sGuildAll:=StringConf.ReadString('Guild','GuildAll',g_Config.sGuildAll);

  if StringConf.ReadString('Guild','GuildMember','') = '' then
    StringConf.WriteString('Guild','GuildMember',g_Config.sGuildMember);
  g_Config.sGuildMember:=StringConf.ReadString('Guild','GuildMember',g_Config.sGuildMember);

  if StringConf.ReadString('Guild','GuildMemberRank','') = '' then
    StringConf.WriteString('Guild','GuildMemberRank',g_Config.sGuildMemberRank);
  g_Config.sGuildMemberRank:=StringConf.ReadString('Guild','GuildMemberRank',g_Config.sGuildMemberRank);

  if StringConf.ReadString('Guild','GuildChief','') = '' then
    StringConf.WriteString('Guild','GuildChief',g_Config.sGuildChief);
  g_Config.sGuildChief:=StringConf.ReadString('Guild','GuildChief',g_Config.sGuildChief);

  //服务器设置
  if Config.ReadInteger('Server','ServerIndex',-1) < 0 then
    Config.WriteInteger('Server','ServerIndex',nServerIndex);
  nServerIndex:=Config.ReadInteger('Server','ServerIndex',nServerIndex);

  if Config.ReadString('Server','ServerName','') = '' then
    Config.WriteString('Server','ServerName',g_Config.sServerName);
  g_Config.sServerName:=Config.ReadString('Server','ServerName',g_Config.sServerName);

  if StringConf.ReadString('Server','ServerIP','') = '' then
    StringConf.WriteString('Server','ServerIP',g_Config.sServerIPaddr);
  g_Config.sServerIPaddr:=StringConf.ReadString('Server','ServerIP',g_Config.sServerIPaddr);

  if StringConf.ReadString('Server','WebSite','') = '' then
    StringConf.WriteString('Server','WebSite',g_Config.sWebSite);
  g_Config.sWebSite:=StringConf.ReadString('Server','WebSite',g_Config.sWebSite);

  if StringConf.ReadString('Server','BbsSite','') = '' then
    StringConf.WriteString('Server','BbsSite',g_Config.sBbsSite);
  g_Config.sBbsSite:=StringConf.ReadString('Server','BbsSite',g_Config.sBbsSite);

  if StringConf.ReadString('Server','ClientDownload','') = '' then
    StringConf.WriteString('Server','ClientDownload',g_Config.sClientDownload);
  g_Config.sClientDownload:=StringConf.ReadString('Server','ClientDownload',g_Config.sClientDownload);

  if StringConf.ReadString('Server','QQ','') = '' then
    StringConf.WriteString('Server','QQ',g_Config.sQQ);
  g_Config.sQQ:=StringConf.ReadString('Server','QQ',g_Config.sQQ);

  if StringConf.ReadString('Server','Phone','') = '' then
    StringConf.WriteString('Server','Phone',g_Config.sPhone);
  g_Config.sPhone:=StringConf.ReadString('Server','Phone',g_Config.sPhone);

  if StringConf.ReadString('Server','BankAccount0','') = '' then
    StringConf.WriteString('Server','BankAccount0',g_Config.sBankAccount0);
  g_Config.sBankAccount0 :=StringConf.ReadString('Server','BankAccount0',g_Config.sBankAccount0);

  if StringConf.ReadString('Server','BankAccount1','') = '' then
    StringConf.WriteString('Server','BankAccount1',g_Config.sBankAccount1);
  g_Config.sBankAccount1:=StringConf.ReadString('Server','BankAccount1',g_Config.sBankAccount1);

  if StringConf.ReadString('Server','BankAccount2','') = '' then
    StringConf.WriteString('Server','BankAccount2',g_Config.sBankAccount2);
  g_Config.sBankAccount2 :=StringConf.ReadString('Server','BankAccount2',g_Config.sBankAccount2);

  if StringConf.ReadString('Server','BankAccount3','') = '' then
    StringConf.WriteString('Server','BankAccount3',g_Config.sBankAccount3);
  g_Config.sBankAccount3 :=StringConf.ReadString('Server','BankAccount3',g_Config.sBankAccount3);

  if StringConf.ReadString('Server','BankAccount4','') = '' then
    StringConf.WriteString('Server','BankAccount4',g_Config.sBankAccount4);
  g_Config.sBankAccount4 :=StringConf.ReadString('Server','BankAccount4',g_Config.sBankAccount4);

  if StringConf.ReadString('Server','BankAccount5','') = '' then
    StringConf.WriteString('Server','BankAccount5',g_Config.sBankAccount5);
  g_Config.sBankAccount5 :=StringConf.ReadString('Server','BankAccount5',g_Config.sBankAccount5);

  if StringConf.ReadString('Server','BankAccount6','') = '' then
    StringConf.WriteString('Server','BankAccount6',g_Config.sBankAccount6);
  g_Config.sBankAccount6 :=StringConf.ReadString('Server','BankAccount6',g_Config.sBankAccount6);

  if StringConf.ReadString('Server','BankAccount7','') = '' then
    StringConf.WriteString('Server','BankAccount7',g_Config.sBankAccount7);
  g_Config.sBankAccount7 :=StringConf.ReadString('Server','BankAccount7',g_Config.sBankAccount7);

  if StringConf.ReadString('Server','BankAccount8','') = '' then
    StringConf.WriteString('Server','BankAccount8',g_Config.sBankAccount8);
  g_Config.sBankAccount8 :=StringConf.ReadString('Server','BankAccount8',g_Config.sBankAccount8);

  if StringConf.ReadString('Server','BankAccount9','') = '' then
    StringConf.WriteString('Server','BankAccount9',g_Config.sBankAccount9);
  g_Config.sBankAccount9 :=StringConf.ReadString('Server','BankAccount9',g_Config.sBankAccount9);

  if Config.ReadInteger('Server','ServerNumber',-1) < 0 then
    Config.WriteInteger('Server','ServerNumber',g_Config.nServerNumber);
  g_Config.nServerNumber:=Config.ReadInteger('Server','ServerNumber',g_Config.nServerNumber);

  if Config.ReadString('Server','VentureServer','') = '' then
    Config.WriteString('Server','VentureServer',BoolToStr2(g_Config.boVentureServer));
  g_Config.boVentureServer:=CompareText(Config.ReadString('Server','VentureServer','FALSE'),'TRUE') = 0;

  if Config.ReadString('Server','TestServer','') = '' then
    Config.WriteString('Server','TestServer',BoolToStr2(g_Config.boTestServer));
  g_Config.boTestServer:=CompareText(Config.ReadString('Server','TestServer','FALSE'),'TRUE') = 0;

  if Config.ReadInteger('Server','TestLevel',-1) < 0 then
    Config.WriteInteger('Server','TestLevel',g_Config.nTestLevel);
  g_Config.nTestLevel:=Config.ReadInteger('Server','TestLevel',g_Config.nTestLevel);

  if Config.ReadInteger('Server','TestGold',-1) < 0 then
    Config.WriteInteger('Server','TestGold',g_Config.nTestGold);
  g_Config.nTestGold:=Config.ReadInteger('Server','TestGold',g_Config.nTestGold);

  if Config.ReadInteger('Server','TestServerUserLimit',-1) < 0 then
    Config.WriteInteger('Server','TestServerUserLimit',g_Config.nTestUserLimit);
  g_Config.nTestUserLimit:=Config.ReadInteger('Server','TestServerUserLimit',g_Config.nTestUserLimit);

  if Config.ReadString('Server','ServiceMode','') = '' then
    Config.WriteString('Server','ServiceMode',BoolToStr2(g_Config.boServiceMode));
  g_Config.boServiceMode:=CompareText(Config.ReadString('Server','ServiceMode','FALSE'),'TRUE') = 0;

  if Config.ReadString('Server','NonPKServer','') = '' then
    Config.WriteString('Server','NonPKServer',BoolToStr2(g_Config.boNonPKServer));
  g_Config.boNonPKServer:=CompareText(Config.ReadString('Server','NonPKServer','FALSE'),'TRUE') = 0;

  if Config.ReadString('Server','ViewHackMessage','') = '' then
    Config.WriteString('Server','ViewHackMessage',BoolToStr2(g_Config.boViewHackMessage));
  g_Config.boViewHackMessage:=CompareText(Config.ReadString('Server','ViewHackMessage','FALSE'),'TRUE') = 0;

  if Config.ReadString('Server','ViewAdmissionFailure','') = '' then
    Config.WriteString('Server','ViewAdmissionFailure',BoolToStr2(g_Config.boViewAdmissionFailure));
  g_Config.boViewAdmissionFailure:=CompareText(Config.ReadString('Server','ViewAdmissionFailure','FALSE'),'TRUE') = 0;

  if Config.ReadString('Server','GateAddr','') = '' then
    Config.WriteString('Server','GateAddr',g_Config.sGateAddr);
  g_Config.sGateAddr:=Config.ReadString('Server','GateAddr',g_Config.sGateAddr);

  if Config.ReadInteger('Server','GatePort',-1) < 0 then
    Config.WriteInteger('Server','GatePort',g_Config.nGatePort);
  g_Config.nGatePort:=Config.ReadInteger('Server','GatePort',g_Config.nGatePort);

  if Config.ReadString('Server','DBAddr','') = '' then
    Config.WriteString('Server','DBAddr',g_Config.sDBAddr);
  g_Config.sDBAddr:=Config.ReadString('Server','DBAddr',g_Config.sDBAddr);

  if Config.ReadInteger('Server','DBPort',-1) < 0 then
    Config.WriteInteger('Server','DBPort',g_Config.nDBPort);
  g_Config.nDBPort:=Config.ReadInteger('Server','DBPort',g_Config.nDBPort);

  if Config.ReadString('Server','IDSAddr','') = '' then
    Config.WriteString('Server','IDSAddr',g_Config.sIDSAddr);
  g_Config.sIDSAddr:=Config.ReadString('Server','IDSAddr',g_Config.sIDSAddr);

  if Config.ReadInteger('Server','IDSPort',-1) < 0 then
    Config.WriteInteger('Server','IDSPort',g_Config.nIDSPort);
  g_Config.nIDSPort:=Config.ReadInteger('Server','IDSPort',g_Config.nIDSPort);

  if Config.ReadString('Server','MsgSrvAddr','') = '' then
    Config.WriteString('Server','MsgSrvAddr',g_Config.sMsgSrvAddr);
  g_Config.sMsgSrvAddr:=Config.ReadString('Server','MsgSrvAddr',g_Config.sMsgSrvAddr);

  if Config.ReadInteger('Server','MsgSrvPort',-1) < 0 then
    Config.WriteInteger('Server','MsgSrvPort',g_Config.nMsgSrvPort);
  g_Config.nMsgSrvPort:=Config.ReadInteger('Server','MsgSrvPort',g_Config.nMsgSrvPort);

  if Config.ReadString('Server','LogServerAddr','') = '' then
    Config.WriteString('Server','LogServerAddr',g_Config.sLogServerAddr);
  g_Config.sLogServerAddr:=Config.ReadString('Server','LogServerAddr',g_Config.sLogServerAddr);

  if Config.ReadInteger('Server','LogServerPort',-1) < 0 then
    Config.WriteInteger('Server','LogServerPort',g_Config.nLogServerPort);
  g_Config.nLogServerPort:=Config.ReadInteger('Server','LogServerPort',g_Config.nLogServerPort);

  if Config.ReadString('Server','DiscountForNightTime','') = '' then
    Config.WriteString('Server','DiscountForNightTime',BoolToStr2(g_Config.boDiscountForNightTime));
  g_Config.boDiscountForNightTime:=CompareText(Config.ReadString('Server','DiscountForNightTime','FALSE'),'TRUE') = 0;

  if Config.ReadInteger('Server','HalfFeeStart',-1) < 0 then
    Config.WriteInteger('Server','HalfFeeStart',g_Config.nHalfFeeStart);
  g_Config.nHalfFeeStart:=Config.ReadInteger('Server','HalfFeeStart',g_Config.nHalfFeeStart);

  if Config.ReadInteger('Server','HalfFeeEnd',-1) < 0 then
    Config.WriteInteger('Server','HalfFeeEnd',g_Config.nHalfFeeEnd);
  g_Config.nHalfFeeEnd:=Config.ReadInteger('Server','HalfFeeEnd',g_Config.nHalfFeeEnd);


  if Config.ReadString('Server','TimeEventUse','') = '' then
    Config.WriteString('Server','TimeEventUse',BoolToStr2(g_Config.boTimeEventUse));
  g_Config.boTimeEventUse:=CompareText(Config.ReadString('Server','TimeEventUse','FALSE'),'TRUE') = 0;

  if Config.ReadInteger('Server','MinEvent',-1) < 0 then
    Config.WriteInteger('Server','MinEvent',g_Config.nMinEvent);
  g_Config.nMinEvent:=Config.ReadInteger('Server','MinEvent',g_Config.nMinEvent);

  if Config.ReadInteger('Server','HourEvent',-1) < 0 then
    Config.WriteInteger('Server','HourEvent',g_Config.nHourEvent);
  g_Config.nHourEvent:=Config.ReadInteger('Server','HourEvent',g_Config.nHourEvent);

  if Config.ReadInteger('Server','WakeUpRate',-1) < 0 then
    Config.WriteInteger('Server','WakeUpRate',g_Config.nWakeUpRate);
  g_Config.nWakeUpRate:=Config.ReadInteger('Server','WakeUpRate',g_Config.nWakeUpRate);

  if Config.ReadInteger('Server','HumLimit',-1) < 0 then
    Config.WriteInteger('Server','HumLimit',g_dwHumLimit);
  g_dwHumLimit:=Config.ReadInteger('Server','HumLimit',g_dwHumLimit);

  if Config.ReadInteger('Server','MonLimit',-1) < 0 then
    Config.WriteInteger('Server','MonLimit',g_dwMonLimit);
  g_dwMonLimit:=Config.ReadInteger('Server','MonLimit',g_dwMonLimit);

  if Config.ReadInteger('Server','ZenLimit',-1) < 0 then
    Config.WriteInteger('Server','ZenLimit',g_dwZenLimit);
  g_dwZenLimit:=Config.ReadInteger('Server','ZenLimit',g_dwZenLimit);

  if Config.ReadInteger('Server','NpcLimit',-1) < 0 then
    Config.WriteInteger('Server','NpcLimit',g_dwNpcLimit);
  g_dwNpcLimit:=Config.ReadInteger('Server','NpcLimit',g_dwNpcLimit);

  if Config.ReadInteger('Server','SocLimit',-1) < 0 then
    Config.WriteInteger('Server','SocLimit',g_dwSocLimit);
  g_dwSocLimit:=Config.ReadInteger('Server','SocLimit',g_dwSocLimit);

  if Config.ReadInteger('Server','DecLimit',-1) < 0 then
    Config.WriteInteger('Server','DecLimit',nDecLimit);
  nDecLimit:=Config.ReadInteger('Server','DecLimit',nDecLimit);

  if Config.ReadInteger('Server','SendBlock',-1) < 0 then
    Config.WriteInteger('Server','SendBlock',g_Config.nSendBlock);
  g_Config.nSendBlock:=Config.ReadInteger('Server','SendBlock',g_Config.nSendBlock);

  if Config.ReadInteger('Server','CheckBlock',-1) < 0 then
    Config.WriteInteger('Server','CheckBlock',g_Config.nCheckBlock);
  g_Config.nCheckBlock:=Config.ReadInteger('Server','CheckBlock',g_Config.nCheckBlock);

  if Config.ReadInteger('Server','SocCheckTimeOut',-1) < 0 then
    Config.WriteInteger('Server','SocCheckTimeOut',g_dwSocCheckTimeOut);
  g_dwSocCheckTimeOut:=Config.ReadInteger('Server','SocCheckTimeOut',g_dwSocCheckTimeOut);

  if Config.ReadInteger('Server','AvailableBlock',-1) < 0 then
    Config.WriteInteger('Server','AvailableBlock',g_Config.nAvailableBlock);
  g_Config.nAvailableBlock:=Config.ReadInteger('Server','AvailableBlock',g_Config.nAvailableBlock);

  if Config.ReadInteger('Server','GateLoad',-1) < 0 then
    Config.WriteInteger('Server','GateLoad',g_Config.nGateLoad);
  g_Config.nGateLoad:=Config.ReadInteger('Server','GateLoad',g_Config.nGateLoad);

  if Config.ReadInteger('Server','UserFull',-1) < 0 then
    Config.WriteInteger('Server','UserFull',g_Config.nUserFull);
  g_Config.nUserFull:=Config.ReadInteger('Server','UserFull',g_Config.nUserFull);

  if Config.ReadInteger('Server','ZenFastStep',-1) < 0 then
    Config.WriteInteger('Server','ZenFastStep',g_Config.nZenFastStep);
  g_Config.nZenFastStep:=Config.ReadInteger('Server','ZenFastStep',g_Config.nZenFastStep);

  if Config.ReadInteger('Server','ProcessMonstersTime',-1) < 0 then
    Config.WriteInteger('Server','ProcessMonstersTime',g_Config.dwProcessMonstersTime);
  g_Config.dwProcessMonstersTime:=Config.ReadInteger('Server','ProcessMonstersTime',g_Config.dwProcessMonstersTime);

  if Config.ReadInteger('Server','RegenMonstersTime',-1) < 0 then
    Config.WriteInteger('Server','RegenMonstersTime',g_Config.dwRegenMonstersTime);
  g_Config.dwRegenMonstersTime:=Config.ReadInteger('Server','RegenMonstersTime',g_Config.dwRegenMonstersTime);


  if Config.ReadInteger('Server','HumanGetMsgTimeLimit',-1) < 0 then
    Config.WriteInteger('Server','HumanGetMsgTimeLimit',g_Config.dwHumanGetMsgTime);
  g_Config.dwHumanGetMsgTime:=Config.ReadInteger('Server','HumanGetMsgTimeLimit',g_Config.dwHumanGetMsgTime);


  if Config.ReadString('Server','TestGAPassword','') = '' then
    Config.WriteString('Server','TestGAPassword',g_Config.sTestGAPassword);
  g_Config.sTestGAPassword:=Config.ReadString('Server','TestGAPassword',g_Config.sTestGAPassword);
  

  //============================================================================
  //目录设置
  if Config.ReadString('Share','BaseDir','') = '' then
    Config.WriteString('Share','BaseDir',g_Config.sBaseDir);
  g_Config.sBaseDir:=Config.ReadString('Share','BaseDir',g_Config.sBaseDir);

  if Config.ReadString('Share','GuildDir','') = '' then
    Config.WriteString('Share','GuildDir',g_Config.sGuildDir);
  g_Config.sGuildDir:=Config.ReadString('Share','GuildDir',g_Config.sGuildDir);

  if Config.ReadString('Share','GuildFile','') = '' then
    Config.WriteString('Share','GuildFile',g_Config.sGuildFile);
  g_Config.sGuildFile:=Config.ReadString('Share','GuildFile',g_Config.sGuildFile);

  if Config.ReadString('Share','VentureDir','') = '' then
    Config.WriteString('Share','VentureDir',g_Config.sVentureDir);
  g_Config.sVentureDir:=Config.ReadString('Share','VentureDir',g_Config.sVentureDir);

  if Config.ReadString('Share','ConLogDir','') = '' then
    Config.WriteString('Share','ConLogDir',g_Config.sConLogDir);
  g_Config.sConLogDir:=Config.ReadString('Share','ConLogDir',g_Config.sConLogDir);

  if Config.ReadString('Share','CastleDir','') = '' then
    Config.WriteString('Share','CastleDir',g_Config.sCastleDir);
  g_Config.sCastleDir:=Config.ReadString('Share','CastleDir',g_Config.sCastleDir);

  if Config.ReadString('Share','CastleFile','') = '' then
//    Config.WriteString('Share','CastleFile',g_Config.sCastleFile);
    Config.WriteString('Share','CastleFile',g_Config.sCastleDir + 'List.txt');
  g_Config.sCastleFile:=Config.ReadString('Share','CastleFile',g_Config.sCastleFile);

  if Config.ReadString('Share','EnvirDir','') = '' then
    Config.WriteString('Share','EnvirDir',g_Config.sEnvirDir);
  g_Config.sEnvirDir:=Config.ReadString('Share','EnvirDir',g_Config.sEnvirDir);

  if Config.ReadString('Share','MapDir','') = '' then
    Config.WriteString('Share','MapDir',g_Config.sMapDir);
  g_Config.sMapDir:=Config.ReadString('Share','MapDir',g_Config.sMapDir);

  if Config.ReadString('Share', 'Mir3MapDir', '') = '' then
    Config.WriteString('Share', 'Mir3MapDir', g_Config.sMapEIDir);
  g_Config.sMapEIDir := Config.ReadString('Share', 'Mir3MapDir', g_Config.sMapEIDir);

  if Config.ReadString('Share', 'ShandaMapDir', '') = '' then
    Config.WriteString('Share', 'ShandaMapDir', g_Config.sShandaMapDir);
  g_Config.sShandaMapDir := Config.ReadString('Share', 'ShandaMapDir', g_Config.sShandaMapDir);

  if Config.ReadString('Share','NoticeDir','') = '' then
    Config.WriteString('Share','NoticeDir',g_Config.sNoticeDir);
  g_Config.sNoticeDir:=Config.ReadString('Share','NoticeDir',g_Config.sNoticeDir);

  sLoadString:=Config.ReadString('Share','LogDir','');
  if sLoadString = '' then
    Config.WriteString('Share','LogDir',g_Config.sLogDir)
  else g_Config.sLogDir:=sLoadString;

  if Config.ReadString('Share','PlugDir','') = '' then
    Config.WriteString('Share','PlugDir',g_Config.sPlugDir);
  g_Config.sPlugDir:=Config.ReadString('Share','PlugDir',g_Config.sPlugDir);


  //============================================================================
  //名称设置
  if Config.ReadString('Names','HealSkill','') = '' then
    Config.WriteString('Names','HealSkill',g_Config.sHealSkill);
  g_Config.sHealSkill:=Config.ReadString('Names','HealSkill',g_Config.sHealSkill);

  if Config.ReadString('Names','FireBallSkill','') = '' then
    Config.WriteString('Names','FireBallSkill',g_Config.sFireBallSkill);
  g_Config.sFireBallSkill:=Config.ReadString('Names','FireBallSkill',g_Config.sFireBallSkill);


  if Config.ReadInteger('Names','Level50Effect',-1) < 0 then        //饭骇 50饭骇 捞蒲飘
    Config.WriteInteger('Names','Level50Effect',g_Config.sLevel50Effect);
  g_Config.sLevel50Effect:=Config.ReadInteger('Names','Level50Effect',g_Config.sLevel50Effect);

  if Config.ReadInteger('Names','Level60Effect',-1) < 0 then        //饭骇 60饭骇 捞蒲飘
    Config.WriteInteger('Names','Level60Effect',g_Config.sLevel60Effect);
  g_Config.sLevel60Effect:=Config.ReadInteger('Names','Level60Effect',g_Config.sLevel60Effect);

  if Config.ReadInteger('Names','Level70Effect',-1) < 0 then        //饭骇 70 殿急捞蒲飘 汲沥
    Config.WriteInteger('Names','Level70Effect',g_Config.sLevel70Effect);
  g_Config.sLevel70Effect:=Config.ReadInteger('Names','Level70Effect',g_Config.sLevel70Effect);

  if Config.ReadInteger('Names','LevelComEffect',-1) < 0 then        //饭骇 80饭骇 捞蒲飘
    Config.WriteInteger('Names','LevelComEffect',g_Config.sLevelComEffect);
  g_Config.sLevelComEffect:=Config.ReadInteger('Names','LevelComEffect',g_Config.sLevelComEffect);

  if Config.ReadString('Names','ClothsMan','') = '' then
    Config.WriteString('Names','ClothsMan',g_Config.sClothsMan);
  g_Config.sClothsMan:=Config.ReadString('Names','ClothsMan',g_Config.sClothsMan);

  if Config.ReadString('Names','ClothsWoman','') = '' then
    Config.WriteString('Names','ClothsWoman',g_Config.sClothsWoman);
  g_Config.sClothsWoman:=Config.ReadString('Names','ClothsWoman',g_Config.sClothsWoman);

  if Config.ReadString('Names','WoodenSword','') = '' then
    Config.WriteString('Names','WoodenSword',g_Config.sWoodenSword);
  g_Config.sWoodenSword:=Config.ReadString('Names','WoodenSword',g_Config.sWoodenSword);

  if Config.ReadString('Names','AssassinWeapon','') = '' then
    Config.WriteString('Names','AssassinWeapon',g_Config.sAssassinWeapon);
  g_Config.sAssassinWeapon:=Config.ReadString('Names','AssassinWeapon',g_Config.sAssassinWeapon);

  if Config.ReadString('Names','BonzeWeapon','') = '' then
    Config.WriteString('Names','BonzeWeapon',g_Config.sBonzeWeapon);
  g_Config.sBonzeWeapon:=Config.ReadString('Names','BonzeWeapon',g_Config.sBonzeWeapon);

  if Config.ReadString('Names','Candle','') = '' then
    Config.WriteString('Names','Candle',g_Config.sCandle);
  g_Config.sCandle:=Config.ReadString('Names','Candle',g_Config.sCandle);

  if Config.ReadString('Names','BasicDrug','') = '' then
    Config.WriteString('Names','BasicDrug',g_Config.sBasicDrug);
  g_Config.sBasicDrug:=Config.ReadString('Names','BasicDrug',g_Config.sBasicDrug);

  if Config.ReadString('Names','GoldStone','') = '' then
    Config.WriteString('Names','GoldStone',g_Config.sGoldStone);
  g_Config.sGoldStone:=Config.ReadString('Names','GoldStone',g_Config.sGoldStone);

  if Config.ReadString('Names','SilverStone','') = '' then
    Config.WriteString('Names','SilverStone',g_Config.sSilverStone);
  g_Config.sSilverStone:=Config.ReadString('Names','SilverStone',g_Config.sSilverStone);

  if Config.ReadString('Names','SteelStone','') = '' then
    Config.WriteString('Names','SteelStone',g_Config.sSteelStone);
  g_Config.sSteelStone:=Config.ReadString('Names','SteelStone',g_Config.sSteelStone);

  if Config.ReadString('Names','CopperStone','') = '' then
    Config.WriteString('Names','CopperStone',g_Config.sCopperStone);
  g_Config.sCopperStone:=Config.ReadString('Names','CopperStone',g_Config.sCopperStone);

  if Config.ReadString('Names','BlackStone','') = '' then
    Config.WriteString('Names','BlackStone',g_Config.sBlackStone);
  g_Config.sBlackStone:=Config.ReadString('Names','BlackStone',g_Config.sBlackStone);

  if Config.ReadString('Names','GreenStone','') = '' then
    Config.WriteString('Names','GreenStone',g_Config.sGreenStone);
  g_Config.sGreenStone:=Config.ReadString('Names','GreenStone',g_Config.sGreenStone);

  if Config.ReadString('Names','Gem1Stone','') = '' then
    Config.WriteString('Names','Gem1Stone',g_Config.sGemStone1);
  g_Config.sGemStone1:=Config.ReadString('Names','Gem1Stone',g_Config.sGemStone1);

  if Config.ReadString('Names','Gem2Stone','') = '' then
    Config.WriteString('Names','Gem2Stone',g_Config.sGemStone2);
  g_Config.sGemStone2:=Config.ReadString('Names','Gem2Stone',g_Config.sGemStone2);

  if Config.ReadString('Names','Gem3Stone','') = '' then
    Config.WriteString('Names','Gem3Stone',g_Config.sGemStone3);
  g_Config.sGemStone3:=Config.ReadString('Names','Gem3Stone',g_Config.sGemStone3);

  if Config.ReadString('Names','Gem4Stone','') = '' then
    Config.WriteString('Names','Gem4Stone',g_Config.sGemStone4);
  g_Config.sGemStone4:=Config.ReadString('Names','Gem4Stone',g_Config.sGemStone4);


  if Config.ReadString('Names','LegendZuma1','') = '' then
    Config.WriteString('Names','LegendZuma1',g_Config.sLegendZuma[0]);
  g_Config.sLegendZuma[0]:=Config.ReadString('Names','LegendZuma1',g_Config.sLegendZuma[0]);

  if Config.ReadString('Names','LegendZuma2','') = '' then
    Config.WriteString('Names','LegendZuma2',g_Config.sLegendZuma[1]);
  g_Config.sLegendZuma[1]:=Config.ReadString('Names','LegendZuma2',g_Config.sLegendZuma[1]);

  if Config.ReadString('Names','LegendZuma3','') = '' then
    Config.WriteString('Names','LegendZuma3',g_Config.sLegendZuma[2]);
  g_Config.sLegendZuma[2]:=Config.ReadString('Names','LegendZuma3',g_Config.sLegendZuma[2]);

  if Config.ReadString('Names','LegendZuma4','') = '' then
    Config.WriteString('Names','LegendZuma4',g_Config.sLegendZuma[3]);
  g_Config.sLegendZuma[3]:=Config.ReadString('Names','LegendZuma4',g_Config.sLegendZuma[3]);



  if Config.ReadString('Names','Zuma1','') = '' then
    Config.WriteString('Names','Zuma1',g_Config.sZuma[0]);
  g_Config.sZuma[0]:=Config.ReadString('Names','Zuma1',g_Config.sZuma[0]);

  if Config.ReadString('Names','Zuma2','') = '' then
    Config.WriteString('Names','Zuma2',g_Config.sZuma[1]);
  g_Config.sZuma[1]:=Config.ReadString('Names','Zuma2',g_Config.sZuma[1]);

  if Config.ReadString('Names','Zuma3','') = '' then
    Config.WriteString('Names','Zuma3',g_Config.sZuma[2]);
  g_Config.sZuma[2]:=Config.ReadString('Names','Zuma3',g_Config.sZuma[2]);

  if Config.ReadString('Names','Zuma4','') = '' then
    Config.WriteString('Names','Zuma4',g_Config.sZuma[3]);
  g_Config.sZuma[3]:=Config.ReadString('Names','Zuma4',g_Config.sZuma[3]);




  if Config.ReadString('Names','PotMon1','') = '' then
    Config.WriteString('Names','PotMon1',g_Config.sPotMon[0]);
  g_Config.sPotMon[0]:=Config.ReadString('Names','PotMon1',g_Config.sPotMon[0]);

  if Config.ReadString('Names','PotMon2','') = '' then
    Config.WriteString('Names','PotMon2',g_Config.sPotMon[1]);
  g_Config.sPotMon[1]:=Config.ReadString('Names','PotMon2',g_Config.sPotMon[1]);

  if Config.ReadString('Names','PotMon3','') = '' then
    Config.WriteString('Names','PotMon3',g_Config.sPotMon[2]);
  g_Config.sPotMon[2]:=Config.ReadString('Names','PotMon3',g_Config.sPotMon[2]);

  if Config.ReadString('Names','PotMon4','') = '' then
    Config.WriteString('Names','PotMon4',g_Config.sPotMon[3]);
  g_Config.sPotMon[3]:=Config.ReadString('Names','PotMon4',g_Config.sPotMon[3]);

  if Config.ReadString('Names','PotMon5','') = '' then
    Config.WriteString('Names','PotMon5',g_Config.sPotMon[4]);
  g_Config.sPotMon[4]:=Config.ReadString('Names','PotMon5',g_Config.sPotMon[4]);

  if Config.ReadString('Names','PotMon6','') = '' then
    Config.WriteString('Names','PotMon6',g_Config.sPotMon[5]);
  g_Config.sPotMon[5]:=Config.ReadString('Names','PotMon6',g_Config.sPotMon[5]);

  if Config.ReadString('Names','PotMon7','') = '' then
    Config.WriteString('Names','PotMon7',g_Config.sPotMon[6]);
  g_Config.sPotMon[6]:=Config.ReadString('Names','PotMon7',g_Config.sPotMon[6]);

  if Config.ReadString('Names','PotMon8','') = '' then
    Config.WriteString('Names','PotMon8',g_Config.sPotMon[7]);
  g_Config.sPotMon[7]:=Config.ReadString('Names','PotMon8',g_Config.sPotMon[7]);

  if Config.ReadString('Names','PotMon9','') = '' then
    Config.WriteString('Names','PotMon9',g_Config.sPotMon[8]);
  g_Config.sPotMon[8]:=Config.ReadString('Names','PotMon9',g_Config.sPotMon[8]);

  if Config.ReadString('Names','PotMon10','') = '' then
    Config.WriteString('Names','PotMon10',g_Config.sPotMon[9]);
  g_Config.sPotMon[9]:=Config.ReadString('Names','PotMon10',g_Config.sPotMon[9]);

  if Config.ReadString('Names','PotMon11','') = '' then
    Config.WriteString('Names','PotMon11',g_Config.sPotMon[10]);
  g_Config.sPotMon[10]:=Config.ReadString('Names','PotMon11',g_Config.sPotMon[10]);

  if Config.ReadString('Names','PotMon12','') = '' then
    Config.WriteString('Names','PotMon12',g_Config.sPotMon[11]);
  g_Config.sPotMon[11]:=Config.ReadString('Names','PotMon12',g_Config.sPotMon[11]);

  if Config.ReadString('Names','PotMon13','') = '' then
    Config.WriteString('Names','PotMon13',g_Config.sPotMon[12]);
  g_Config.sPotMon[12]:=Config.ReadString('Names','PotMon13',g_Config.sPotMon[12]);

  if Config.ReadString('Names','PotMon14','') = '' then
    Config.WriteString('Names','PotMon14',g_Config.sPotMon[13]);
  g_Config.sPotMon[13]:=Config.ReadString('Names','PotMon14',g_Config.sPotMon[13]);

  if Config.ReadString('Names','PotMon15','') = '' then
    Config.WriteString('Names','PotMon15',g_Config.sPotMon[14]);
  g_Config.sPotMon[14]:=Config.ReadString('Names','PotMon15',g_Config.sPotMon[14]);

  if Config.ReadString('Names','PotMon16','') = '' then
    Config.WriteString('Names','PotMon16',g_Config.sPotMon[15]);
  g_Config.sPotMon[15]:=Config.ReadString('Names','PotMon16',g_Config.sPotMon[15]);

  if Config.ReadString('Names','PotMon17','') = '' then
    Config.WriteString('Names','PotMon17',g_Config.sPotMon[16]);
  g_Config.sPotMon[16]:=Config.ReadString('Names','PotMon17',g_Config.sPotMon[16]);

  if Config.ReadString('Names','PotMon18','') = '' then
    Config.WriteString('Names','PotMon18',g_Config.sPotMon[17]);
  g_Config.sPotMon[17]:=Config.ReadString('Names','PotMon18',g_Config.sPotMon[17]);

  if Config.ReadString('Names','PotMon19','') = '' then
    Config.WriteString('Names','PotMon19',g_Config.sPotMon[18]);
  g_Config.sPotMon[18]:=Config.ReadString('Names','PotMon19',g_Config.sPotMon[18]);

  if Config.ReadString('Names','PotMon20','') = '' then
    Config.WriteString('Names','PotMon20',g_Config.sPotMon[19]);
  g_Config.sPotMon[19]:=Config.ReadString('Names','PotMon20',g_Config.sPotMon[19]);





  if Config.ReadString('Names','Pot1Mon1','') = '' then
    Config.WriteString('Names','Pot1Mon1',g_Config.sPotMon1[0]);
  g_Config.sPotMon1[0]:=Config.ReadString('Names','Pot1Mon1',g_Config.sPotMon1[0]);

  if Config.ReadString('Names','Pot1Mon2','') = '' then
    Config.WriteString('Names','Pot1Mon2',g_Config.sPotMon1[1]);
  g_Config.sPotMon[1]:=Config.ReadString('Names','Pot1Mon2',g_Config.sPotMon1[1]);

  if Config.ReadString('Names','Pot1Mon3','') = '' then
    Config.WriteString('Names','Pot1Mon3',g_Config.sPotMon1[2]);
  g_Config.sPotMon1[2]:=Config.ReadString('Names','Pot1Mon3',g_Config.sPotMon1[2]);

  if Config.ReadString('Names','Pot1Mon4','') = '' then
    Config.WriteString('Names','Pot1Mon4',g_Config.sPotMon1[3]);
  g_Config.sPotMon1[3]:=Config.ReadString('Names','Pot1Mon4',g_Config.sPotMon1[3]);

  if Config.ReadString('Names','Pot1Mon5','') = '' then
    Config.WriteString('Names','Pot1Mon5',g_Config.sPotMon1[4]);
  g_Config.sPotMon1[4]:=Config.ReadString('Names','Pot1Mon5',g_Config.sPotMon1[4]);

  if Config.ReadString('Names','Pot1Mon6','') = '' then
    Config.WriteString('Names','Pot1Mon6',g_Config.sPotMon1[5]);
  g_Config.sPotMon1[5]:=Config.ReadString('Names','Pot1Mon6',g_Config.sPotMon1[5]);

  if Config.ReadString('Names','Pot1Mon7','') = '' then
    Config.WriteString('Names','Pot1Mon7',g_Config.sPotMon1[6]);
  g_Config.sPotMon1[6]:=Config.ReadString('Names','Pot1Mon7',g_Config.sPotMon1[6]);

  if Config.ReadString('Names','Pot1Mon8','') = '' then
    Config.WriteString('Names','Pot1Mon8',g_Config.sPotMon1[7]);
  g_Config.sPotMon1[7]:=Config.ReadString('Names','Pot1Mon8',g_Config.sPotMon1[7]);

  if Config.ReadString('Names','Pot1Mon9','') = '' then
    Config.WriteString('Names','Pot1Mon9',g_Config.sPotMon1[8]);
  g_Config.sPotMon1[8]:=Config.ReadString('Names','Pot1Mon9',g_Config.sPotMon1[8]);

  if Config.ReadString('Names','Pot1Mon10','') = '' then
    Config.WriteString('Names','Pot1Mon10',g_Config.sPotMon1[9]);
  g_Config.sPotMon1[9]:=Config.ReadString('Names','Pot1Mon10',g_Config.sPotMon1[9]);

  if Config.ReadString('Names','Pot1Mon11','') = '' then
    Config.WriteString('Names','Pot1Mon11',g_Config.sPotMon1[10]);
  g_Config.sPotMon1[10]:=Config.ReadString('Names','Pot1Mon11',g_Config.sPotMon1[10]);

  if Config.ReadString('Names','Pot1Mon12','') = '' then
    Config.WriteString('Names','Pot1Mon12',g_Config.sPotMon1[11]);
  g_Config.sPotMon1[11]:=Config.ReadString('Names','Pot1Mon12',g_Config.sPotMon1[11]);

  if Config.ReadString('Names','Pot1Mon13','') = '' then
    Config.WriteString('Names','Pot1Mon13',g_Config.sPotMon1[12]);
  g_Config.sPotMon1[12]:=Config.ReadString('Names','Pot1Mon13',g_Config.sPotMon1[12]);

  if Config.ReadString('Names','Pot1Mon14','') = '' then
    Config.WriteString('Names','Pot1Mon14',g_Config.sPotMon1[12]);
  g_Config.sPotMon1[13]:=Config.ReadString('Names','Pot1Mon14',g_Config.sPotMon1[13]);

  if Config.ReadString('Names','Pot1Mon15','') = '' then
    Config.WriteString('Names','Pot1Mon15',g_Config.sPotMon1[14]);
  g_Config.sPotMon1[14]:=Config.ReadString('Names','Pot1Mon15',g_Config.sPotMon1[14]);

  if Config.ReadString('Names','Pot1Mon16','') = '' then
    Config.WriteString('Names','Pot1Mon16',g_Config.sPotMon1[15]);
  g_Config.sPotMon1[15]:=Config.ReadString('Names','Pot1Mon16',g_Config.sPotMon1[15]);

  if Config.ReadString('Names','Pot1Mon17','') = '' then
    Config.WriteString('Names','Pot1Mon17',g_Config.sPotMon1[16]);
  g_Config.sPotMon1[16]:=Config.ReadString('Names','Pot1Mon17',g_Config.sPotMon1[16]);

  if Config.ReadString('Names','Pot1Mon18','') = '' then
    Config.WriteString('Names','Pot1Mon18',g_Config.sPotMon1[17]);
  g_Config.sPotMon1[17]:=Config.ReadString('Names','Pot1Mon18',g_Config.sPotMon1[17]);

  if Config.ReadString('Names','Pot1Mon19','') = '' then
    Config.WriteString('Names','Pot1Mon19',g_Config.sPotMon1[18]);
  g_Config.sPotMon1[18]:=Config.ReadString('Names','Pot1Mon19',g_Config.sPotMon1[18]);

  if Config.ReadString('Names','Pot1Mon20','') = '' then
    Config.WriteString('Names','Pot1Mon20',g_Config.sPotMon1[11]);
  g_Config.sPotMon1[19]:=Config.ReadString('Names','Pot1Mon20',g_Config.sPotMon1[19]);




  if Config.ReadString('Names','Bee','') = '' then
    Config.WriteString('Names','Bee',g_Config.sBee);
  g_Config.sBee:=Config.ReadString('Names','Bee',g_Config.sBee);

  if Config.ReadString('Names','Spider','') = '' then
    Config.WriteString('Names','Spider',g_Config.sSpider);
  g_Config.sSpider:=Config.ReadString('Names','Spider',g_Config.sSpider);

    if Config.ReadString('Names','Spider2','') = '' then
    Config.WriteString('Names','Spider2',g_Config.sSpider2);
  g_Config.sSpider2:=Config.ReadString('Names','Spider2',g_Config.sSpider2);

  if Config.ReadString('Names','WoomaHorn','') = '' then
    Config.WriteString('Names','WoomaHorn',g_Config.sWoomaHorn);
  g_Config.sWoomaHorn:=Config.ReadString('Names','WoomaHorn',g_Config.sWoomaHorn);

  if Config.ReadString('Names','ZumaPiece','') = '' then
    Config.WriteString('Names','ZumaPiece',g_Config.sZumaPiece);
  g_Config.sZumaPiece:=Config.ReadString('Names','ZumaPiece',g_Config.sZumaPiece);

  if Config.ReadString('Names','Skeleton','') = '' then
    Config.WriteString('Names','Skeleton',g_Config.sSkeleton);
  g_Config.sSkeleton:=Config.ReadString('Names','Skeleton',g_Config.sSkeleton);

  if Config.ReadString('Names','JinSkeleton','') = '' then
    Config.WriteString('Names','JinSkeleton',g_Config.sJinSkeleton);
  g_Config.sJinSkeleton:=Config.ReadString('Names','JinSkeleton',g_Config.sJinSkeleton);

  if Config.ReadString('Names','Dragon','') = '' then
    Config.WriteString('Names','Dragon',g_Config.sDragon);
  g_Config.sDragon:=Config.ReadString('Names','Dragon',g_Config.sDragon);

  if Config.ReadString('Names','Dragon1','') = '' then
    Config.WriteString('Names','Dragon1',g_Config.sDragon1);
  g_Config.sDragon1:=Config.ReadString('Names','Dragon1',g_Config.sDragon1);

  if Config.ReadString('Names','Angel','') = '' then
    Config.WriteString('Names','Angel',g_Config.sAngel);
  g_Config.sAngel:=Config.ReadString('Names','Angel',g_Config.sAngel);

  if Config.ReadString('Names','DarkAngel','') = '' then
    Config.WriteString('Names','DarkAngel',g_Config.sDarkAngel);
  g_Config.sDarkAngel:=Config.ReadString('Names','DarkAngel',g_Config.sDarkAngel);

  if Config.ReadString('Names','Guard45','') = '' then       //龋困捍
    Config.WriteString('Names','Guard45',g_Config.sGuard45);
  g_Config.sGuard45:=Config.ReadString('Names','Guard45',g_Config.sGuard45);

  if Config.ReadString('Names','Guard50','') = '' then
    Config.WriteString('Names','Guard50',g_Config.sGuard50);
  g_Config.sGuard50:=Config.ReadString('Names','Guard50',g_Config.sGuard50);

  if Config.ReadString('Names','Guard55','') = '' then
    Config.WriteString('Names','Guard55',g_Config.sGuard55);
  g_Config.sGuard55:=Config.ReadString('Names','Guard55',g_Config.sGuard55);

  if Config.ReadString('Names','Guard60','') = '' then
    Config.WriteString('Names','Guard60',g_Config.sGuard60);
  g_Config.sGuard60:=Config.ReadString('Names','Guard60',g_Config.sGuard60);

  if Config.ReadString('Names','Archer45','') = '' then       //龋困谅荤
    Config.WriteString('Names','Archer45',g_Config.sArcher45);
  g_Config.sArcher45:=Config.ReadString('Names','Archer45',g_Config.sArcher45);

  if Config.ReadString('Names','Archer50','') = '' then
    Config.WriteString('Names','Archer50',g_Config.sArcher50);
  g_Config.sArcher50:=Config.ReadString('Names','Archer50',g_Config.sArcher50);

  if Config.ReadString('Names','Archer55','') = '' then
    Config.WriteString('Names','Archer55',g_Config.sArcher55);
  g_Config.sArcher55:=Config.ReadString('Names','Archer55',g_Config.sArcher55);

  if Config.ReadString('Names','Archer60','') = '' then
    Config.WriteString('Names','Archer60',g_Config.sArcher60);
  g_Config.sArcher60:=Config.ReadString('Names','Archer60',g_Config.sArcher60);


  sLoadString:=Config.ReadString('Names','GameGold','');
  if sLoadString = '' then
    Config.WriteString('Names','GameGold',g_Config.sGameGoldName)
  else g_Config.sGameGoldName:=sLoadString;

  sLoadString:=Config.ReadString('Names','GamePoint','');
  if sLoadString = '' then
    Config.WriteString('Names','GamePoint',g_Config.sGamePointName)
  else g_Config.sGamePointName:=sLoadString;

  sLoadString:=Config.ReadString('Names','PCPointName','');
  if sLoadString = '' then
    Config.WriteString('Names','PCPointName',g_Config.sPCPointName)
  else g_Config.sPCPointName:=sLoadString;

  //============================================================================
  //游戏设置
  if Config.ReadInteger('Setup','ItemNumber',-1) < 0 then
    Config.WriteInteger('Setup','ItemNumber',g_Config.nItemNumber);
  g_Config.nItemNumber:=Config.ReadInteger('Setup','ItemNumber',g_Config.nItemNumber);

  if Config.ReadInteger('Setup','ItemNumberEx',-1) < 0 then
    Config.WriteInteger('Setup','ItemNumberEx',g_Config.nItemNumberEx);
  g_Config.nItemNumberEx:=Config.ReadInteger('Setup','ItemNumberEx',g_Config.nItemNumberEx);

  if Config.ReadString('Setup','ClientFile1','') = '' then
    Config.WriteString('Setup','ClientFile1',g_Config.sClientFile1);
  g_Config.sClientFile1:=Config.ReadString('Setup','ClientFile1',g_Config.sClientFile1);

  if Config.ReadString('Setup','ClientFile2','') = '' then
    Config.WriteString('Setup','ClientFile2',g_Config.sClientFile2);
  g_Config.sClientFile2:=Config.ReadString('Setup','ClientFile2',g_Config.sClientFile2);

  if Config.ReadString('Setup','ClientFile3','') = '' then
    Config.WriteString('Setup','ClientFile3',g_Config.sClientFile3);
  g_Config.sClientFile3:=Config.ReadString('Setup','ClientFile3',g_Config.sClientFile3);

  if Config.ReadInteger('Setup','MonUpLvNeedKillBase',-1) < 0 then
    Config.WriteInteger('Setup','MonUpLvNeedKillBase',g_Config.nMonUpLvNeedKillBase);
  g_Config.nMonUpLvNeedKillBase:=Config.ReadInteger('Setup','MonUpLvNeedKillBase',g_Config.nMonUpLvNeedKillBase);

  if Config.ReadInteger('Setup','MonUpLvRate',-1) < 0 then
    Config.WriteInteger('Setup','MonUpLvRate',g_Config.nMonUpLvRate);
  g_Config.nMonUpLvRate:=Config.ReadInteger('Setup','MonUpLvRate',g_Config.nMonUpLvRate);

  for I := Low(g_Config.MonUpLvNeedKillCount) to High(g_Config.MonUpLvNeedKillCount) do begin
    if Config.ReadInteger('Setup','MonUpLvNeedKillCount' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','MonUpLvNeedKillCount' + IntToStr(I),g_Config.MonUpLvNeedKillCount[I]);
    g_Config.MonUpLvNeedKillCount[I]:=Config.ReadInteger('Setup','MonUpLvNeedKillCount' + IntToStr(I),g_Config.MonUpLvNeedKillCount[I]);
  end;

  for I := Low(g_Config.SlaveColor) to High(g_Config.SlaveColor) do begin
    if Config.ReadInteger('Setup','SlaveColor' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','SlaveColor' + IntToStr(I),g_Config.SlaveColor[I]);
    g_Config.SlaveColor[I]:=Config.ReadInteger('Setup','SlaveColor' + IntToStr(I),g_Config.SlaveColor[I]);
  end;


  if Config.ReadString('Setup','HomeMap','') = '' then
    Config.WriteString('Setup','HomeMap',g_Config.sHomeMap);
  g_Config.sHomeMap:=Config.ReadString('Setup','HomeMap',g_Config.sHomeMap);

  if Config.ReadInteger('Setup','HomeX',-1) < 0 then
    Config.WriteInteger('Setup','HomeX',g_Config.nHomeX);
  g_Config.nHomeX:=Config.ReadInteger('Setup','HomeX',g_Config.nHomeX);

  if Config.ReadInteger('Setup','HomeY',-1) < 0 then
    Config.WriteInteger('Setup','HomeY',g_Config.nHomeY);
  g_Config.nHomeY:=Config.ReadInteger('Setup','HomeY',g_Config.nHomeY);

  if Config.ReadString('Setup','RedHomeMap','') = '' then
    Config.WriteString('Setup','RedHomeMap',g_Config.sRedHomeMap);
  g_Config.sRedHomeMap:=Config.ReadString('Setup','RedHomeMap',g_Config.sRedHomeMap);

  if Config.ReadInteger('Setup','RedHomeX',-1) < 0 then
    Config.WriteInteger('Setup','RedHomeX',g_Config.nRedHomeX);
  g_Config.nRedHomeX:=Config.ReadInteger('Setup','RedHomeX',g_Config.nRedHomeX);

  if Config.ReadInteger('Setup','RedHomeY',-1) < 0 then
    Config.WriteInteger('Setup','RedHomeY',g_Config.nRedHomeY);
  g_Config.nRedHomeY:=Config.ReadInteger('Setup','RedHomeY',g_Config.nRedHomeY);

  if Config.ReadString('Setup','RedDieHomeMap','') = '' then
    Config.WriteString('Setup','RedDieHomeMap',g_Config.sRedDieHomeMap);
  g_Config.sRedDieHomeMap:=Config.ReadString('Setup','RedDieHomeMap',g_Config.sRedDieHomeMap);

  if Config.ReadInteger('Setup','RedDieHomeX',-1) < 0 then
    Config.WriteInteger('Setup','RedDieHomeX',g_Config.nRedDieHomeX);
  g_Config.nRedDieHomeX:=Config.ReadInteger('Setup','RedDieHomeX',g_Config.nRedDieHomeX);

  if Config.ReadInteger('Setup','RedDieHomeY',-1) < 0 then
    Config.WriteInteger('Setup','RedDieHomeY',g_Config.nRedDieHomeY);
  g_Config.nRedDieHomeY:=Config.ReadInteger('Setup','RedDieHomeY',g_Config.nRedDieHomeY);

  if Config.ReadInteger('Setup','JobHomePointSystem',-1) < 0 then
    Config.WriteBool('Setup','JobHomePointSystem',g_Config.boJobHomePoint);
  g_Config.boJobHomePoint:=Config.ReadBool('Setup','JobHomePointSystem',g_Config.boJobHomePoint);

  if Config.ReadString('Setup','WarriorHomeMap','') = '' then
    Config.WriteString('Setup','WarriorHomeMap',g_Config.sWarriorHomeMap);
  g_Config.sWarriorHomeMap:=Config.ReadString('Setup','WarriorHomeMap',g_Config.sWarriorHomeMap);

  if Config.ReadInteger('Setup','WarriorHomeX',-1) < 0 then
    Config.WriteInteger('Setup','WarriorHomeX',g_Config.nWarriorHomeX);
  g_Config.nWarriorHomeX:=Config.ReadInteger('Setup','WarriorHomeX',g_Config.nWarriorHomeX);

  if Config.ReadInteger('Setup','WarriorHomeY',-1) < 0 then
    Config.WriteInteger('Setup','WarriorHomeY',g_Config.nWarriorHomeY);
  g_Config.nWarriorHomeY:=Config.ReadInteger('Setup','WarriorHomeY',g_Config.nWarriorHomeY);

  if Config.ReadString('Setup','WizardHomeMap','') = '' then
    Config.WriteString('Setup','WizardHomeMap',g_Config.sWizardHomeMap);
  g_Config.sWizardHomeMap:=Config.ReadString('Setup','WizardHomeMap',g_Config.sWizardHomeMap);

  if Config.ReadInteger('Setup','WizardHomeX',-1) < 0 then
    Config.WriteInteger('Setup','WizardHomeX',g_Config.nWizardHomeX);
  g_Config.nWizardHomeX:=Config.ReadInteger('Setup','WizardHomeX',g_Config.nWizardHomeX);

  if Config.ReadInteger('Setup','WizardHomeY',-1) < 0 then
    Config.WriteInteger('Setup','WizardHomeY',g_Config.nWizardHomeY);
  g_Config.nWizardHomeY:=Config.ReadInteger('Setup','WizardHomeY',g_Config.nWizardHomeY);

  if Config.ReadString('Setup','TaoistHomeMap','') = '' then
    Config.WriteString('Setup','TaoistHomeMap',g_Config.sTaoistHomeMap);
  g_Config.sTaoistHomeMap:=Config.ReadString('Setup','TaoistHomeMap',g_Config.sTaoistHomeMap);

  if Config.ReadInteger('Setup','TaoistHomeX',-1) < 0 then
    Config.WriteInteger('Setup','TaoistHomeX',g_Config.nTaoistHomeX);
  g_Config.nTaoistHomeX:=Config.ReadInteger('Setup','TaoistHomeX',g_Config.nTaoistHomeX);

  if Config.ReadInteger('Setup','TaoistHomeY',-1) < 0 then
    Config.WriteInteger('Setup','TaoistHomeY',g_Config.nTaoistHomeY);
  g_Config.nTaoistHomeY:=Config.ReadInteger('Setup','TaoistHomeY',g_Config.nTaoistHomeY);

  if Config.ReadString('Setup','AssassinHomeMap','') = '' then                      //磊按
    Config.WriteString('Setup','AssassinHomeMap',g_Config.sAssassinHomeMap);
  g_Config.sAssassinHomeMap:=Config.ReadString('Setup','AssassinHomeMap',g_Config.sAssassinHomeMap);

  if Config.ReadInteger('Setup','AssassinHomeX',-1) < 0 then
    Config.WriteInteger('Setup','AssassinHomeX',g_Config.nAssassinHomeX);
  g_Config.nAssassinHomeX:=Config.ReadInteger('Setup','AssassinHomeX',g_Config.nAssassinHomeX);

  if Config.ReadInteger('Setup','AssassinHomeY',-1) < 0 then
    Config.WriteInteger('Setup','AssassinHomeY',g_Config.nAssassinHomeY);
  g_Config.nAssassinHomeY:=Config.ReadInteger('Setup','AssassinHomeY',g_Config.nAssassinHomeY);


  if Config.ReadString('Setup','BonzeHomeMap','') = '' then                      //磊按
    Config.WriteString('Setup','BonzeHomeMap',g_Config.sBonzeHomeMap);
  g_Config.sBonzeHomeMap:=Config.ReadString('Setup','BonzeHomeMap',g_Config.sBonzeHomeMap);

  if Config.ReadInteger('Setup','BonzeHomeX',-1) < 0 then
    Config.WriteInteger('Setup','BonzeHomeX',g_Config.nBonzeHomeX);
  g_Config.nBonzeHomeX:=Config.ReadInteger('Setup','BonzeHomeX',g_Config.nBonzeHomeX);

  if Config.ReadInteger('Setup','BonzeHomeY',-1) < 0 then
    Config.WriteInteger('Setup','BonzeHomeY',g_Config.nBonzeHomeY);
  g_Config.nBonzeHomeY:=Config.ReadInteger('Setup','BonzeHomeY',g_Config.nBonzeHomeY);


  nLoadInteger:=Config.ReadInteger('Setup','HealthFillTime',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','HealthFillTime',g_Config.nHealthFillTime)
  else g_Config.nHealthFillTime:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','SpellFillTime',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','SpellFillTime',g_Config.nSpellFillTime)
  else g_Config.nSpellFillTime:=nLoadInteger;

  if Config.ReadInteger('Setup','DecPkPointTime',-1) < 0 then
    Config.WriteInteger('Setup','DecPkPointTime',g_Config.dwDecPkPointTime);
  g_Config.dwDecPkPointTime:=Config.ReadInteger('Setup','DecPkPointTime',g_Config.dwDecPkPointTime);

  if Config.ReadInteger('Setup','DecPkPointCount',-1) < 0 then
    Config.WriteInteger('Setup','DecPkPointCount',g_Config.nDecPkPointCount);
  g_Config.nDecPkPointCount:=Config.ReadInteger('Setup','DecPkPointCount',g_Config.nDecPkPointCount);

  if Config.ReadInteger('Setup','PKFlagTime',-1) < 0 then
    Config.WriteInteger('Setup','PKFlagTime',g_Config.dwPKFlagTime);
  g_Config.dwPKFlagTime:=Config.ReadInteger('Setup','PKFlagTime',g_Config.dwPKFlagTime);

  if Config.ReadInteger('Setup','KillHumanAddPKPoint',-1) < 0 then
    Config.WriteInteger('Setup','KillHumanAddPKPoint',g_Config.nKillHumanAddPKPoint);
  g_Config.nKillHumanAddPKPoint:=Config.ReadInteger('Setup','KillHumanAddPKPoint',g_Config.nKillHumanAddPKPoint);

  if Config.ReadInteger('Setup','KillHumanDecLuckPoint',-1) < 0 then
    Config.WriteInteger('Setup','KillHumanDecLuckPoint',g_Config.nKillHumanDecLuckPoint);
  g_Config.nKillHumanDecLuckPoint:=Config.ReadInteger('Setup','KillHumanDecLuckPoint',g_Config.nKillHumanDecLuckPoint);

  if Config.ReadInteger('Setup','DecLightItemDrugTime',-1) < 0 then
    Config.WriteInteger('Setup','DecLightItemDrugTime',g_Config.dwDecLightItemDrugTime);
  g_Config.dwDecLightItemDrugTime:=Config.ReadInteger('Setup','DecLightItemDrugTime',g_Config.dwDecLightItemDrugTime);


  if Config.ReadInteger('Setup','SafeZoneSize',-1) < 0 then
    Config.WriteInteger('Setup','SafeZoneSize',g_Config.nSafeZoneSize);
  g_Config.nSafeZoneSize:=Config.ReadInteger('Setup','SafeZoneSize',g_Config.nSafeZoneSize);

  if Config.ReadInteger('Setup','StartPointSize',-1) < 0 then
    Config.WriteInteger('Setup','StartPointSize',g_Config.nStartPointSize);
  g_Config.nStartPointSize:=Config.ReadInteger('Setup','StartPointSize',g_Config.nStartPointSize);

  for I := Low(g_Config.ReNewNameColor) to High(g_Config.ReNewNameColor) do begin
    if Config.ReadInteger('Setup','ReNewNameColor' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','ReNewNameColor' + IntToStr(I),g_Config.ReNewNameColor[I]);
    g_Config.ReNewNameColor[I]:=Config.ReadInteger('Setup','ReNewNameColor' + IntToStr(I),g_Config.ReNewNameColor[I]);
  end;
  if Config.ReadInteger('Setup','ReNewNameColorTime',-1) < 0 then
    Config.WriteInteger('Setup','ReNewNameColorTime',g_Config.dwReNewNameColorTime);
  g_Config.dwReNewNameColorTime:=Config.ReadInteger('Setup','ReNewNameColorTime',g_Config.dwReNewNameColorTime);

  if Config.ReadInteger('Setup','ReNewChangeColor',-1) < 0 then
    Config.WriteBool('Setup','ReNewChangeColor',g_Config.boReNewChangeColor);
  g_Config.boReNewChangeColor:=Config.ReadBool('Setup','ReNewChangeColor',g_Config.boReNewChangeColor);

  if Config.ReadInteger('Setup','ReNewLevelClearExp',-1) < 0 then
    Config.WriteBool('Setup','ReNewLevelClearExp',g_Config.boReNewLevelClearExp);
  g_Config.boReNewLevelClearExp:=Config.ReadBool('Setup','ReNewLevelClearExp',g_Config.boReNewLevelClearExp);

  if Config.ReadInteger('Setup','NeutralityAttack',-1) < 0 then
    Config.WriteBool('Setup','NeutralityAttack',g_Config.boNeutralityAttack);
  g_Config.boNeutralityAttack:=Config.ReadBool('Setup','NeutralityAttack',g_Config.boNeutralityAttack);

  if Config.ReadInteger('Setup','BonusAbilofWarrDC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrDC',g_Config.BonusAbilofWarr.DC);
  g_Config.BonusAbilofWarr.DC:=Config.ReadInteger('Setup','BonusAbilofWarrDC',g_Config.BonusAbilofWarr.DC);

  if Config.ReadInteger('Setup','BonusAbilofWarrMC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrMC',g_Config.BonusAbilofWarr.MC);
  g_Config.BonusAbilofWarr.MC:=Config.ReadInteger('Setup','BonusAbilofWarrMC',g_Config.BonusAbilofWarr.MC);

  if Config.ReadInteger('Setup','BonusAbilofWarrSC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrSC',g_Config.BonusAbilofWarr.SC);
  g_Config.BonusAbilofWarr.SC:=Config.ReadInteger('Setup','BonusAbilofWarrSC',g_Config.BonusAbilofWarr.SC);

  if Config.ReadInteger('Setup','BonusAbilofWarrAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrAC',g_Config.BonusAbilofWarr.AC);
  g_Config.BonusAbilofWarr.AC:=Config.ReadInteger('Setup','BonusAbilofWarrAC',g_Config.BonusAbilofWarr.AC);

  if Config.ReadInteger('Setup','BonusAbilofWarrMAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrMAC',g_Config.BonusAbilofWarr.MAC);
  g_Config.BonusAbilofWarr.MAC:=Config.ReadInteger('Setup','BonusAbilofWarrMAC',g_Config.BonusAbilofWarr.MAC);

  if Config.ReadInteger('Setup','BonusAbilofWarrHP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrHP',g_Config.BonusAbilofWarr.HP);
  g_Config.BonusAbilofWarr.HP:=Config.ReadInteger('Setup','BonusAbilofWarrHP',g_Config.BonusAbilofWarr.HP);

  if Config.ReadInteger('Setup','BonusAbilofWarrMP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrMP',g_Config.BonusAbilofWarr.MP);
  g_Config.BonusAbilofWarr.MP:=Config.ReadInteger('Setup','BonusAbilofWarrMP',g_Config.BonusAbilofWarr.MP);

  if Config.ReadInteger('Setup','BonusAbilofWarrHit',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrHit',g_Config.BonusAbilofWarr.Hit);
  g_Config.BonusAbilofWarr.Hit:=Config.ReadInteger('Setup','BonusAbilofWarrHit',g_Config.BonusAbilofWarr.Hit);

  if Config.ReadInteger('Setup','BonusAbilofWarrSpeed',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrSpeed',g_Config.BonusAbilofWarr.Speed);
  g_Config.BonusAbilofWarr.Speed:=Config.ReadInteger('Setup','BonusAbilofWarrSpeed',g_Config.BonusAbilofWarr.Speed);

  if Config.ReadInteger('Setup','BonusAbilofWarrX2',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWarrX2',g_Config.BonusAbilofWarr.X2);
  g_Config.BonusAbilofWarr.X2:=Config.ReadInteger('Setup','BonusAbilofWarrX2',g_Config.BonusAbilofWarr.X2);

  if Config.ReadInteger('Setup','BonusAbilofWizardDC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardDC',g_Config.BonusAbilofWizard.DC);
  g_Config.BonusAbilofWizard.DC:=Config.ReadInteger('Setup','BonusAbilofWizardDC',g_Config.BonusAbilofWizard.DC);

  if Config.ReadInteger('Setup','BonusAbilofWizardMC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardMC',g_Config.BonusAbilofWizard.MC);
  g_Config.BonusAbilofWizard.MC:=Config.ReadInteger('Setup','BonusAbilofWizardMC',g_Config.BonusAbilofWizard.MC);

  if Config.ReadInteger('Setup','BonusAbilofWizardSC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardSC',g_Config.BonusAbilofWizard.SC);
  g_Config.BonusAbilofWizard.SC:=Config.ReadInteger('Setup','BonusAbilofWizardSC',g_Config.BonusAbilofWizard.SC);

  if Config.ReadInteger('Setup','BonusAbilofWizardAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardAC',g_Config.BonusAbilofWizard.AC);
  g_Config.BonusAbilofWizard.AC:=Config.ReadInteger('Setup','BonusAbilofWizardAC',g_Config.BonusAbilofWizard.AC);

  if Config.ReadInteger('Setup','BonusAbilofWizardMAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardMAC',g_Config.BonusAbilofWizard.MAC);
  g_Config.BonusAbilofWizard.MAC:=Config.ReadInteger('Setup','BonusAbilofWizardMAC',g_Config.BonusAbilofWizard.MAC);

  if Config.ReadInteger('Setup','BonusAbilofWizardHP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardHP',g_Config.BonusAbilofWizard.HP);
  g_Config.BonusAbilofWizard.HP:=Config.ReadInteger('Setup','BonusAbilofWizardHP',g_Config.BonusAbilofWizard.HP);

  if Config.ReadInteger('Setup','BonusAbilofWizardMP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardMP',g_Config.BonusAbilofWizard.MP);
  g_Config.BonusAbilofWizard.MP:=Config.ReadInteger('Setup','BonusAbilofWizardMP',g_Config.BonusAbilofWizard.MP);

  if Config.ReadInteger('Setup','BonusAbilofWizardHit',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardHit',g_Config.BonusAbilofWizard.Hit);
  g_Config.BonusAbilofWizard.Hit:=Config.ReadInteger('Setup','BonusAbilofWizardHit',g_Config.BonusAbilofWizard.Hit);

  if Config.ReadInteger('Setup','BonusAbilofWizardSpeed',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardSpeed',g_Config.BonusAbilofWizard.Speed);
  g_Config.BonusAbilofWizard.Speed:=Config.ReadInteger('Setup','BonusAbilofWizardSpeed',g_Config.BonusAbilofWizard.Speed);

  if Config.ReadInteger('Setup','BonusAbilofWizardX2',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofWizardX2',g_Config.BonusAbilofWizard.X2);
  g_Config.BonusAbilofWizard.X2:=Config.ReadInteger('Setup','BonusAbilofWizardX2',g_Config.BonusAbilofWizard.X2);

  if Config.ReadInteger('Setup','BonusAbilofTaosDC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosDC',g_Config.BonusAbilofTaos.DC);
  g_Config.BonusAbilofTaos.DC:=Config.ReadInteger('Setup','BonusAbilofTaosDC',g_Config.BonusAbilofTaos.DC);

  if Config.ReadInteger('Setup','BonusAbilofTaosMC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosMC',g_Config.BonusAbilofTaos.MC);
  g_Config.BonusAbilofTaos.MC:=Config.ReadInteger('Setup','BonusAbilofTaosMC',g_Config.BonusAbilofTaos.MC);

  if Config.ReadInteger('Setup','BonusAbilofTaosSC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosSC',g_Config.BonusAbilofTaos.SC);
  g_Config.BonusAbilofTaos.SC:=Config.ReadInteger('Setup','BonusAbilofTaosSC',g_Config.BonusAbilofTaos.SC);

  if Config.ReadInteger('Setup','BonusAbilofTaosAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosAC',g_Config.BonusAbilofTaos.AC);
  g_Config.BonusAbilofTaos.AC:=Config.ReadInteger('Setup','BonusAbilofTaosAC',g_Config.BonusAbilofTaos.AC);

  if Config.ReadInteger('Setup','BonusAbilofTaosMAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosMAC',g_Config.BonusAbilofTaos.MAC);
  g_Config.BonusAbilofTaos.MAC:=Config.ReadInteger('Setup','BonusAbilofTaosMAC',g_Config.BonusAbilofTaos.MAC);

  if Config.ReadInteger('Setup','BonusAbilofTaosHP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosHP',g_Config.BonusAbilofTaos.HP);
  g_Config.BonusAbilofTaos.HP:=Config.ReadInteger('Setup','BonusAbilofTaosHP',g_Config.BonusAbilofTaos.HP);

  if Config.ReadInteger('Setup','BonusAbilofTaosMP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosMP',g_Config.BonusAbilofTaos.MP);
  g_Config.BonusAbilofTaos.MP:=Config.ReadInteger('Setup','BonusAbilofTaosMP',g_Config.BonusAbilofTaos.MP);

  if Config.ReadInteger('Setup','BonusAbilofTaosHit',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosHit',g_Config.BonusAbilofTaos.Hit);
  g_Config.BonusAbilofTaos.Hit:=Config.ReadInteger('Setup','BonusAbilofTaosHit',g_Config.BonusAbilofTaos.Hit);

  if Config.ReadInteger('Setup','BonusAbilofTaosSpeed',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosSpeed',g_Config.BonusAbilofTaos.Speed);
  g_Config.BonusAbilofTaos.Speed:=Config.ReadInteger('Setup','BonusAbilofTaosSpeed',g_Config.BonusAbilofTaos.Speed);

  if Config.ReadInteger('Setup','BonusAbilofTaosX2',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofTaosX2',g_Config.BonusAbilofTaos.X2);
  g_Config.BonusAbilofTaos.X2:=Config.ReadInteger('Setup','BonusAbilofTaosX2',g_Config.BonusAbilofTaos.X2);

  if Config.ReadInteger('Setup','BonusAbilofAssassinDC',-1) < 0 then    //磊按
    Config.WriteInteger('Setup','BonusAbilofAssassinDC',g_Config.BonusAbilofAssassin.DC);
  g_Config.BonusAbilofAssassin.DC:=Config.ReadInteger('Setup','BonusAbilofAssassinDC',g_Config.BonusAbilofAssassin.DC);

  if Config.ReadInteger('Setup','BonusAbilofAssassinMC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinMC',g_Config.BonusAbilofAssassin.MC);
  g_Config.BonusAbilofAssassin.MC:=Config.ReadInteger('Setup','BonusAbilofAssassinMC',g_Config.BonusAbilofAssassin.MC);

  if Config.ReadInteger('Setup','BonusAbilofAssassinSC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinSC',g_Config.BonusAbilofAssassin.SC);
  g_Config.BonusAbilofAssassin.SC:=Config.ReadInteger('Setup','BonusAbilofAssassinSC',g_Config.BonusAbilofAssassin.SC);

  if Config.ReadInteger('Setup','BonusAbilofAssassinAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinAC',g_Config.BonusAbilofAssassin.AC);
  g_Config.BonusAbilofAssassin.AC:=Config.ReadInteger('Setup','BonusAbilofAssassinAC',g_Config.BonusAbilofAssassin.AC);

  if Config.ReadInteger('Setup','BonusAbilofAssassinMAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinMAC',g_Config.BonusAbilofAssassin.MAC);
  g_Config.BonusAbilofAssassin.MAC:=Config.ReadInteger('Setup','BonusAbilofAssassinMAC',g_Config.BonusAbilofAssassin.MAC);

  if Config.ReadInteger('Setup','BonusAbilofAssassinHP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinHP',g_Config.BonusAbilofAssassin.HP);
  g_Config.BonusAbilofAssassin.HP:=Config.ReadInteger('Setup','BonusAbilofAssassinHP',g_Config.BonusAbilofAssassin.HP);

  if Config.ReadInteger('Setup','BonusAbilofAssassinMP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinMP',g_Config.BonusAbilofAssassin.MP);
  g_Config.BonusAbilofAssassin.MP:=Config.ReadInteger('Setup','BonusAbilofAssassinMP',g_Config.BonusAbilofAssassin.MP);

  if Config.ReadInteger('Setup','BonusAbilofAssassinHit',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinHit',g_Config.BonusAbilofAssassin.Hit);
  g_Config.BonusAbilofAssassin.Hit:=Config.ReadInteger('Setup','BonusAbilofAssassinHit',g_Config.BonusAbilofAssassin.Hit);

  if Config.ReadInteger('Setup','BonusAbilofAssassinSpeed',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinSpeed',g_Config.BonusAbilofAssassin.Speed);
  g_Config.BonusAbilofAssassin.Speed:=Config.ReadInteger('Setup','BonusAbilofAssassinSpeed',g_Config.BonusAbilofAssassin.Speed);

  if Config.ReadInteger('Setup','BonusAbilofAssassinX2',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofAssassinX2',g_Config.BonusAbilofAssassin.X2);
  g_Config.BonusAbilofAssassin.X2:=Config.ReadInteger('Setup','BonusAbilofAssassinX2',g_Config.BonusAbilofAssassin.X2);


  if Config.ReadInteger('Setup','BonusAbilofBonzeDC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeDC',g_Config.BonusAbilofBonze.DC);
  g_Config.BonusAbilofBonze.DC:=Config.ReadInteger('Setup','BonusAbilofBonzeDC',g_Config.BonusAbilofBonze.DC);

  if Config.ReadInteger('Setup','BonusAbilofBonzeMC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeMC',g_Config.BonusAbilofBonze.MC);
  g_Config.BonusAbilofBonze.MC:=Config.ReadInteger('Setup','BonusAbilofBonzeMC',g_Config.BonusAbilofBonze.MC);

  if Config.ReadInteger('Setup','BonusAbilofBonzeSC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeSC',g_Config.BonusAbilofBonze.SC);
  g_Config.BonusAbilofBonze.SC:=Config.ReadInteger('Setup','BonusAbilofBonzeSC',g_Config.BonusAbilofBonze.SC);

  if Config.ReadInteger('Setup','BonusAbilofBonzeAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeAC',g_Config.BonusAbilofBonze.AC);
  g_Config.BonusAbilofBonze.AC:=Config.ReadInteger('Setup','BonusAbilofBonzeAC',g_Config.BonusAbilofBonze.AC);

  if Config.ReadInteger('Setup','BonusAbilofBonzeMAC',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeMAC',g_Config.BonusAbilofBonze.MAC);
  g_Config.BonusAbilofBonze.MAC:=Config.ReadInteger('Setup','BonusAbilofBonzeMAC',g_Config.BonusAbilofBonze.MAC);

  if Config.ReadInteger('Setup','BonusAbilofBonzeHP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeHP',g_Config.BonusAbilofBonze.HP);
  g_Config.BonusAbilofBonze.HP:=Config.ReadInteger('Setup','BonusAbilofBonzeHP',g_Config.BonusAbilofBonze.HP);

  if Config.ReadInteger('Setup','BonusAbilofBonzeMP',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeMP',g_Config.BonusAbilofBonze.MP);
  g_Config.BonusAbilofBonze.MP:=Config.ReadInteger('Setup','BonusAbilofBonzeMP',g_Config.BonusAbilofBonze.MP);

  if Config.ReadInteger('Setup','BonusAbilofBonzeHit',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeHit',g_Config.BonusAbilofBonze.Hit);
  g_Config.BonusAbilofBonze.Hit:=Config.ReadInteger('Setup','BonusAbilofBonzeHit',g_Config.BonusAbilofBonze.Hit);

  if Config.ReadInteger('Setup','BonusAbilofBonzeSpeed',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeSpeed',g_Config.BonusAbilofBonze.Speed);
  g_Config.BonusAbilofBonze.Speed:=Config.ReadInteger('Setup','BonusAbilofBonzeSpeed',g_Config.BonusAbilofBonze.Speed);

  if Config.ReadInteger('Setup','BonusAbilofBonzeX2',-1) < 0 then
    Config.WriteInteger('Setup','BonusAbilofBonzeX2',g_Config.BonusAbilofBonze.X2);
  g_Config.BonusAbilofBonze.X2:=Config.ReadInteger('Setup','BonusAbilofBonzeX2',g_Config.BonusAbilofBonze.X2);


  if Config.ReadInteger('Setup','NakedAbilofWarrDC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrDC',g_Config.NakedAbilofWarr.DC);
  g_Config.NakedAbilofWarr.DC:=Config.ReadInteger('Setup','NakedAbilofWarrDC',g_Config.NakedAbilofWarr.DC);

  if Config.ReadInteger('Setup','NakedAbilofWarrMC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrMC',g_Config.NakedAbilofWarr.MC);
  g_Config.NakedAbilofWarr.MC:=Config.ReadInteger('Setup','NakedAbilofWarrMC',g_Config.NakedAbilofWarr.MC);

  if Config.ReadInteger('Setup','NakedAbilofWarrSC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrSC',g_Config.NakedAbilofWarr.SC);
  g_Config.NakedAbilofWarr.SC:=Config.ReadInteger('Setup','NakedAbilofWarrSC',g_Config.NakedAbilofWarr.SC);

  if Config.ReadInteger('Setup','NakedAbilofWarrAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrAC',g_Config.NakedAbilofWarr.AC);
  g_Config.NakedAbilofWarr.AC:=Config.ReadInteger('Setup','NakedAbilofWarrAC',g_Config.NakedAbilofWarr.AC);

  if Config.ReadInteger('Setup','NakedAbilofWarrMAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrMAC',g_Config.NakedAbilofWarr.MAC);
  g_Config.NakedAbilofWarr.MAC:=Config.ReadInteger('Setup','NakedAbilofWarrMAC',g_Config.NakedAbilofWarr.MAC);

  if Config.ReadInteger('Setup','NakedAbilofWarrHP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrHP',g_Config.NakedAbilofWarr.HP);
  g_Config.NakedAbilofWarr.HP:=Config.ReadInteger('Setup','NakedAbilofWarrHP',g_Config.NakedAbilofWarr.HP);

  if Config.ReadInteger('Setup','NakedAbilofWarrMP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrMP',g_Config.NakedAbilofWarr.MP);
  g_Config.NakedAbilofWarr.MP:=Config.ReadInteger('Setup','NakedAbilofWarrMP',g_Config.NakedAbilofWarr.MP);

  if Config.ReadInteger('Setup','NakedAbilofWarrHit',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrHit',g_Config.NakedAbilofWarr.Hit);
  g_Config.NakedAbilofWarr.Hit:=Config.ReadInteger('Setup','NakedAbilofWarrHit',g_Config.NakedAbilofWarr.Hit);

  if Config.ReadInteger('Setup','NakedAbilofWarrSpeed',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrSpeed',g_Config.NakedAbilofWarr.Speed);
  g_Config.NakedAbilofWarr.Speed:=Config.ReadInteger('Setup','NakedAbilofWarrSpeed',g_Config.NakedAbilofWarr.Speed);

  if Config.ReadInteger('Setup','NakedAbilofWarrX2',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWarrX2',g_Config.NakedAbilofWarr.X2);
  g_Config.NakedAbilofWarr.X2:=Config.ReadInteger('Setup','NakedAbilofWarrX2',g_Config.NakedAbilofWarr.X2);

  if Config.ReadInteger('Setup','NakedAbilofWizardDC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardDC',g_Config.NakedAbilofWizard.DC);
  g_Config.NakedAbilofWizard.DC:=Config.ReadInteger('Setup','NakedAbilofWizardDC',g_Config.NakedAbilofWizard.DC);

  if Config.ReadInteger('Setup','NakedAbilofWizardMC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardMC',g_Config.NakedAbilofWizard.MC);
  g_Config.NakedAbilofWizard.MC:=Config.ReadInteger('Setup','NakedAbilofWizardMC',g_Config.NakedAbilofWizard.MC);

  if Config.ReadInteger('Setup','NakedAbilofWizardSC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardSC',g_Config.NakedAbilofWizard.SC);
  g_Config.NakedAbilofWizard.SC:=Config.ReadInteger('Setup','NakedAbilofWizardSC',g_Config.NakedAbilofWizard.SC);

  if Config.ReadInteger('Setup','NakedAbilofWizardAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardAC',g_Config.NakedAbilofWizard.AC);
  g_Config.NakedAbilofWizard.AC:=Config.ReadInteger('Setup','NakedAbilofWizardAC',g_Config.NakedAbilofWizard.AC);

  if Config.ReadInteger('Setup','NakedAbilofWizardMAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardMAC',g_Config.NakedAbilofWizard.MAC);
  g_Config.NakedAbilofWizard.MAC:=Config.ReadInteger('Setup','NakedAbilofWizardMAC',g_Config.NakedAbilofWizard.MAC);

  if Config.ReadInteger('Setup','NakedAbilofWizardHP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardHP',g_Config.NakedAbilofWizard.HP);
  g_Config.NakedAbilofWizard.HP:=Config.ReadInteger('Setup','NakedAbilofWizardHP',g_Config.NakedAbilofWizard.HP);

  if Config.ReadInteger('Setup','NakedAbilofWizardMP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardMP',g_Config.NakedAbilofWizard.MP);
  g_Config.NakedAbilofWizard.MP:=Config.ReadInteger('Setup','NakedAbilofWizardMP',g_Config.NakedAbilofWizard.MP);

  if Config.ReadInteger('Setup','NakedAbilofWizardHit',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardHit',g_Config.NakedAbilofWizard.Hit);
  g_Config.NakedAbilofWizard.Hit:=Config.ReadInteger('Setup','NakedAbilofWizardHit',g_Config.NakedAbilofWizard.Hit);

  if Config.ReadInteger('Setup','NakedAbilofWizardSpeed',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardSpeed',g_Config.NakedAbilofWizard.Speed);
  g_Config.NakedAbilofWizard.Speed:=Config.ReadInteger('Setup','NakedAbilofWizardSpeed',g_Config.NakedAbilofWizard.Speed);

  if Config.ReadInteger('Setup','NakedAbilofWizardX2',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofWizardX2',g_Config.NakedAbilofWizard.X2);
  g_Config.NakedAbilofWizard.X2:=Config.ReadInteger('Setup','NakedAbilofWizardX2',g_Config.NakedAbilofWizard.X2);

  if Config.ReadInteger('Setup','NakedAbilofTaosDC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosDC',g_Config.NakedAbilofTaos.DC);
  g_Config.NakedAbilofTaos.DC:=Config.ReadInteger('Setup','NakedAbilofTaosDC',g_Config.NakedAbilofTaos.DC);

  if Config.ReadInteger('Setup','NakedAbilofTaosMC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosMC',g_Config.NakedAbilofTaos.MC);
  g_Config.NakedAbilofTaos.MC:=Config.ReadInteger('Setup','NakedAbilofTaosMC',g_Config.NakedAbilofTaos.MC);

  if Config.ReadInteger('Setup','NakedAbilofTaosSC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosSC',g_Config.NakedAbilofTaos.SC);
  g_Config.NakedAbilofTaos.SC:=Config.ReadInteger('Setup','NakedAbilofTaosSC',g_Config.NakedAbilofTaos.SC);

  if Config.ReadInteger('Setup','NakedAbilofTaosAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosAC',g_Config.NakedAbilofTaos.AC);
  g_Config.NakedAbilofTaos.AC:=Config.ReadInteger('Setup','NakedAbilofTaosAC',g_Config.NakedAbilofTaos.AC);

  if Config.ReadInteger('Setup','NakedAbilofTaosMAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosMAC',g_Config.NakedAbilofTaos.MAC);
  g_Config.NakedAbilofTaos.MAC:=Config.ReadInteger('Setup','NakedAbilofTaosMAC',g_Config.NakedAbilofTaos.MAC);

  if Config.ReadInteger('Setup','NakedAbilofTaosHP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosHP',g_Config.NakedAbilofTaos.HP);
  g_Config.NakedAbilofTaos.HP:=Config.ReadInteger('Setup','NakedAbilofTaosHP',g_Config.NakedAbilofTaos.HP);

  if Config.ReadInteger('Setup','NakedAbilofTaosMP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosMP',g_Config.NakedAbilofTaos.MP);
  g_Config.NakedAbilofTaos.MP:=Config.ReadInteger('Setup','NakedAbilofTaosMP',g_Config.NakedAbilofTaos.MP);

  if Config.ReadInteger('Setup','NakedAbilofTaosHit',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosHit',g_Config.NakedAbilofTaos.Hit);
  g_Config.NakedAbilofTaos.Hit:=Config.ReadInteger('Setup','NakedAbilofTaosHit',g_Config.NakedAbilofTaos.Hit);

  if Config.ReadInteger('Setup','NakedAbilofTaosSpeed',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosSpeed',g_Config.NakedAbilofTaos.Speed);
  g_Config.NakedAbilofTaos.Speed:=Config.ReadInteger('Setup','NakedAbilofTaosSpeed',g_Config.NakedAbilofTaos.Speed);

  if Config.ReadInteger('Setup','NakedAbilofTaosX2',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofTaosX2',g_Config.NakedAbilofTaos.X2);
  g_Config.NakedAbilofTaos.X2:=Config.ReadInteger('Setup','NakedAbilofTaosX2',g_Config.NakedAbilofTaos.X2);

  if Config.ReadInteger('Setup','NakedAbilofAssassinDC',-1) < 0 then        //磊按
    Config.WriteInteger('Setup','NakedAbilofAssassinDC',g_Config.NakedAbilofAssassin.DC);
  g_Config.NakedAbilofAssassin.DC:=Config.ReadInteger('Setup','NakedAbilofAssassinDC',g_Config.NakedAbilofAssassin.DC);

  if Config.ReadInteger('Setup','NakedAbilofAssassinMC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinMC',g_Config.NakedAbilofAssassin.MC);
  g_Config.NakedAbilofAssassin.MC:=Config.ReadInteger('Setup','NakedAbilofAssassinMC',g_Config.NakedAbilofAssassin.MC);

  if Config.ReadInteger('Setup','NakedAbilofAssassinSC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinSC',g_Config.NakedAbilofAssassin.SC);
  g_Config.NakedAbilofAssassin.SC:=Config.ReadInteger('Setup','NakedAbilofAssassinSC',g_Config.NakedAbilofAssassin.SC);

  if Config.ReadInteger('Setup','NakedAbilofAssassinAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinAC',g_Config.NakedAbilofAssassin.AC);
  g_Config.NakedAbilofAssassin.AC:=Config.ReadInteger('Setup','NakedAbilofAssassinAC',g_Config.NakedAbilofAssassin.AC);

  if Config.ReadInteger('Setup','NakedAbilofAssassinMAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinMAC',g_Config.NakedAbilofAssassin.MAC);
  g_Config.NakedAbilofAssassin.MAC:=Config.ReadInteger('Setup','NakedAbilofAssassinMAC',g_Config.NakedAbilofAssassin.MAC);

  if Config.ReadInteger('Setup','NakedAbilofAssassinHP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinHP',g_Config.NakedAbilofAssassin.HP);
  g_Config.NakedAbilofAssassin.HP:=Config.ReadInteger('Setup','NakedAbilofAssassinHP',g_Config.NakedAbilofAssassin.HP);

  if Config.ReadInteger('Setup','NakedAbilofAssassinMP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinMP',g_Config.NakedAbilofAssassin.MP);
  g_Config.NakedAbilofAssassin.MP:=Config.ReadInteger('Setup','NakedAbilofAssassinMP',g_Config.NakedAbilofAssassin.MP);

  if Config.ReadInteger('Setup','NakedAbilofAssassinHit',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinHit',g_Config.NakedAbilofAssassin.Hit);
  g_Config.NakedAbilofAssassin.Hit:=Config.ReadInteger('Setup','NakedAbilofAssassinHit',g_Config.NakedAbilofAssassin.Hit);

  if Config.ReadInteger('Setup','NakedAbilofAssassinSpeed',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinSpeed',g_Config.NakedAbilofAssassin.Speed);
  g_Config.NakedAbilofAssassin.Speed:=Config.ReadInteger('Setup','NakedAbilofAssassinSpeed',g_Config.NakedAbilofAssassin.Speed);

  if Config.ReadInteger('Setup','NakedAbilofAssassinX2',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofAssassinX2',g_Config.NakedAbilofAssassin.X2);
  g_Config.NakedAbilofAssassin.X2:=Config.ReadInteger('Setup','NakedAbilofAssassinX2',g_Config.NakedAbilofAssassin.X2);


  if Config.ReadInteger('Setup','NakedAbilofBonzeDC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeDC',g_Config.NakedAbilofBonze.DC);
  g_Config.NakedAbilofBonze.DC:=Config.ReadInteger('Setup','NakedAbilofBonzeDC',g_Config.NakedAbilofBonze.DC);

  if Config.ReadInteger('Setup','NakedAbilofBonzeMC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeMC',g_Config.NakedAbilofBonze.MC);
  g_Config.NakedAbilofBonze.MC:=Config.ReadInteger('Setup','NakedAbilofBonzeMC',g_Config.NakedAbilofBonze.MC);

  if Config.ReadInteger('Setup','NakedAbilofBonzeSC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeSC',g_Config.NakedAbilofBonze.SC);
  g_Config.NakedAbilofBonze.SC:=Config.ReadInteger('Setup','NakedAbilofBonzeSC',g_Config.NakedAbilofBonze.SC);

  if Config.ReadInteger('Setup','NakedAbilofBonzeAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeAC',g_Config.NakedAbilofBonze.AC);
  g_Config.NakedAbilofBonze.AC:=Config.ReadInteger('Setup','NakedAbilofBonzeAC',g_Config.NakedAbilofBonze.AC);

  if Config.ReadInteger('Setup','NakedAbilofBonzeMAC',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeMAC',g_Config.NakedAbilofBonze.MAC);
  g_Config.NakedAbilofBonze.MAC:=Config.ReadInteger('Setup','NakedAbilofBonzeMAC',g_Config.NakedAbilofBonze.MAC);

  if Config.ReadInteger('Setup','NakedAbilofBonzeHP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeHP',g_Config.NakedAbilofBonze.HP);
  g_Config.NakedAbilofBonze.HP:=Config.ReadInteger('Setup','NakedAbilofBonzeHP',g_Config.NakedAbilofBonze.HP);

  if Config.ReadInteger('Setup','NakedAbilofBonzeMP',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeMP',g_Config.NakedAbilofBonze.MP);
  g_Config.NakedAbilofBonze.MP:=Config.ReadInteger('Setup','NakedAbilofBonzeMP',g_Config.NakedAbilofBonze.MP);

  if Config.ReadInteger('Setup','NakedAbilofBonzeHit',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeHit',g_Config.NakedAbilofBonze.Hit);
  g_Config.NakedAbilofBonze.Hit:=Config.ReadInteger('Setup','NakedAbilofBonzeHit',g_Config.NakedAbilofBonze.Hit);

  if Config.ReadInteger('Setup','NakedAbilofBonzeSpeed',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeSpeed',g_Config.NakedAbilofBonze.Speed);
  g_Config.NakedAbilofBonze.Speed:=Config.ReadInteger('Setup','NakedAbilofBonzeSpeed',g_Config.NakedAbilofBonze.Speed);

  if Config.ReadInteger('Setup','NakedAbilofBonzeX2',-1) < 0 then
    Config.WriteInteger('Setup','NakedAbilofBonzeX2',g_Config.NakedAbilofBonze.X2);
  g_Config.NakedAbilofBonze.X2:=Config.ReadInteger('Setup','NakedAbilofBonzeX2',g_Config.NakedAbilofBonze.X2);


  if Config.ReadInteger('Setup','GroupMembersMax',-1) < 0 then
    Config.WriteInteger('Setup','GroupMembersMax',g_Config.nGroupMembersMax);
  g_Config.nGroupMembersMax:=Config.ReadInteger('Setup','GroupMembersMax',g_Config.nGroupMembersMax);


  if Config.ReadInteger('Setup','UPgradeWeaponGetBackTime',-1) < 0 then
    Config.WriteInteger('Setup','UPgradeWeaponGetBackTime',g_Config.dwUPgradeWeaponGetBackTime);
  g_Config.dwUPgradeWeaponGetBackTime:=Config.ReadInteger('Setup','UPgradeWeaponGetBackTime',g_Config.dwUPgradeWeaponGetBackTime);

  if Config.ReadInteger('Setup','ClearExpireUpgradeWeaponDays',-1) < 0 then
    Config.WriteInteger('Setup','ClearExpireUpgradeWeaponDays',g_Config.nClearExpireUpgradeWeaponDays);
  g_Config.nClearExpireUpgradeWeaponDays:=Config.ReadInteger('Setup','ClearExpireUpgradeWeaponDays',g_Config.nClearExpireUpgradeWeaponDays);

  if Config.ReadInteger('Setup','UpgradeWeaponPrice',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponPrice',g_Config.nUpgradeWeaponPrice);
  g_Config.nUpgradeWeaponPrice:=Config.ReadInteger('Setup','UpgradeWeaponPrice',g_Config.nUpgradeWeaponPrice);

  if Config.ReadInteger('Setup','UpgradeWeaponMaxPoint',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponMaxPoint',g_Config.nUpgradeWeaponMaxPoint);
  g_Config.nUpgradeWeaponMaxPoint:=Config.ReadInteger('Setup','UpgradeWeaponMaxPoint',g_Config.nUpgradeWeaponMaxPoint);

  if Config.ReadInteger('Setup','UpgradeWeaponDCRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponDCRate',g_Config.nUpgradeWeaponDCRate);
  g_Config.nUpgradeWeaponDCRate:=Config.ReadInteger('Setup','UpgradeWeaponDCRate',g_Config.nUpgradeWeaponDCRate);

  if Config.ReadInteger('Setup','UpgradeWeaponDCTwoPointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponDCTwoPointRate',g_Config.nUpgradeWeaponDCTwoPointRate);
  g_Config.nUpgradeWeaponDCTwoPointRate:=Config.ReadInteger('Setup','UpgradeWeaponDCTwoPointRate',g_Config.nUpgradeWeaponDCTwoPointRate);

  if Config.ReadInteger('Setup','UpgradeWeaponDCThreePointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponDCThreePointRate',g_Config.nUpgradeWeaponDCThreePointRate);
  g_Config.nUpgradeWeaponDCThreePointRate:=Config.ReadInteger('Setup','UpgradeWeaponDCThreePointRate',g_Config.nUpgradeWeaponDCThreePointRate);

  if Config.ReadInteger('Setup','UpgradeWeaponMCRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponMCRate',g_Config.nUpgradeWeaponMCRate);
  g_Config.nUpgradeWeaponMCRate:=Config.ReadInteger('Setup','UpgradeWeaponMCRate',g_Config.nUpgradeWeaponMCRate);

  if Config.ReadInteger('Setup','UpgradeWeaponMCTwoPointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponMCTwoPointRate',g_Config.nUpgradeWeaponMCTwoPointRate);
  g_Config.nUpgradeWeaponMCTwoPointRate:=Config.ReadInteger('Setup','UpgradeWeaponMCTwoPointRate',g_Config.nUpgradeWeaponMCTwoPointRate);

  if Config.ReadInteger('Setup','UpgradeWeaponMCThreePointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponMCThreePointRate',g_Config.nUpgradeWeaponMCThreePointRate);
  g_Config.nUpgradeWeaponMCThreePointRate:=Config.ReadInteger('Setup','UpgradeWeaponMCThreePointRate',g_Config.nUpgradeWeaponMCThreePointRate);

  if Config.ReadInteger('Setup','UpgradeWeaponSCRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponSCRate',g_Config.nUpgradeWeaponSCRate);
  g_Config.nUpgradeWeaponSCRate:=Config.ReadInteger('Setup','UpgradeWeaponSCRate',g_Config.nUpgradeWeaponSCRate);

  if Config.ReadInteger('Setup','UpgradeWeaponSCTwoPointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponSCTwoPointRate',g_Config.nUpgradeWeaponSCTwoPointRate);
  g_Config.nUpgradeWeaponSCTwoPointRate:=Config.ReadInteger('Setup','UpgradeWeaponSCTwoPointRate',g_Config.nUpgradeWeaponSCTwoPointRate);

  if Config.ReadInteger('Setup','UpgradeWeaponSCThreePointRate',-1) < 0 then
    Config.WriteInteger('Setup','UpgradeWeaponSCThreePointRate',g_Config.nUpgradeWeaponSCThreePointRate);
  g_Config.nUpgradeWeaponSCThreePointRate:=Config.ReadInteger('Setup','UpgradeWeaponSCThreePointRate',g_Config.nUpgradeWeaponSCThreePointRate);

  if Config.ReadInteger('Setup','BuildGuild',-1) < 0 then
    Config.WriteInteger('Setup','BuildGuild',g_Config.nBuildGuildPrice);
  g_Config.nBuildGuildPrice:=Config.ReadInteger('Setup','BuildGuild',g_Config.nBuildGuildPrice);


  if Config.ReadInteger('Setup','GuildMarkPrice',-1) < 0 then     //巩颇 付农 啊拜
    Config.WriteInteger('Setup','GuildMarkPrice',g_Config.nGuildMarkPrice);
  g_Config.nGuildMarkPrice:=Config.ReadInteger('Setup','GuildMarkPrice',g_Config.nGuildMarkPrice);


  if Config.ReadInteger('Setup','MakeDurg',-1) < 0 then
    Config.WriteInteger('Setup','MakeDurg',g_Config.nMakeDurgPrice);
  g_Config.nMakeDurgPrice:=Config.ReadInteger('Setup','MakeDurg',g_Config.nMakeDurgPrice);

  if Config.ReadInteger('Setup','GuildWarFee',-1) < 0 then
    Config.WriteInteger('Setup','GuildWarFee',g_Config.nGuildWarPrice);
  g_Config.nGuildWarPrice:=Config.ReadInteger('Setup','GuildWarFee',g_Config.nGuildWarPrice);

  if Config.ReadInteger('Setup','HireGuard',-1) < 0 then
    Config.WriteInteger('Setup','HireGuard',g_Config.nHireGuardPrice);
  g_Config.nHireGuardPrice:=Config.ReadInteger('Setup','HireGuard',g_Config.nHireGuardPrice);

  if Config.ReadInteger('Setup','HireArcher',-1) < 0 then
    Config.WriteInteger('Setup','HireArcher',g_Config.nHireArcherPrice);
  g_Config.nHireArcherPrice:=Config.ReadInteger('Setup','HireArcher',g_Config.nHireArcherPrice);

  if Config.ReadInteger('Setup','RepairDoor',-1) < 0 then
    Config.WriteInteger('Setup','RepairDoor',g_Config.nRepairDoorPrice);
  g_Config.nRepairDoorPrice:=Config.ReadInteger('Setup','RepairDoor',g_Config.nRepairDoorPrice);

  if Config.ReadInteger('Setup','RepairWall',-1) < 0 then
    Config.WriteInteger('Setup','RepairWall',g_Config.nRepairWallPrice);
  g_Config.nRepairWallPrice:=Config.ReadInteger('Setup','RepairWall',g_Config.nRepairWallPrice);

  if Config.ReadInteger('Setup','CastleMemberPriceRate',-1) < 0 then
    Config.WriteInteger('Setup','CastleMemberPriceRate',g_Config.nCastleMemberPriceRate);
  g_Config.nCastleMemberPriceRate:=Config.ReadInteger('Setup','CastleMemberPriceRate',g_Config.nCastleMemberPriceRate);

  if Config.ReadInteger('Setup','CastleGoldMax',-1) < 0 then
    Config.WriteInteger('Setup','CastleGoldMax',g_Config.nCastleGoldMax);
  g_Config.nCastleGoldMax:=Config.ReadInteger('Setup','CastleGoldMax',g_Config.nCastleGoldMax);

  if Config.ReadInteger('Setup','CastleOneDayGold',-1) < 0 then
    Config.WriteInteger('Setup','CastleOneDayGold',g_Config.nCastleOneDayGold);
  g_Config.nCastleOneDayGold:=Config.ReadInteger('Setup','CastleOneDayGold',g_Config.nCastleOneDayGold);


  if Config.ReadString('Setup','SabukCastleName','') = '' then
    Config.WriteString('Setup','SabukCastleName',g_Config.sSabukCastleName);
  g_Config.sSabukCastleName:=Config.ReadString('Setup','SabukCastleName',g_Config.sSabukCastleName);

  if Config.ReadString('Setup','SabukCastleHomeMap','') = '' then
    Config.WriteString('Setup','SabukCastleHomeMap',g_Config.sSabukCastleHomeMap);
  g_Config.sSabukCastleHomeMap:=Config.ReadString('Setup','SabukCastleHomeMap',g_Config.sSabukCastleHomeMap);

  if Config.ReadInteger('Setup','SabukCastleHomeX',-1) < 0 then
    Config.WriteInteger('Setup','SabukCastleHomeX',g_Config.nSabukCastleHomeX);
  g_Config.nSabukCastleHomeX:=Config.ReadInteger('Setup','SabukCastleHomeX',g_Config.nSabukCastleHomeX);

  if Config.ReadInteger('Setup','SabukCastleHomeY',-1) < 0 then
    Config.WriteInteger('Setup','SabukCastleHomeY',g_Config.nSabukCastleHomeY);
  g_Config.nSabukCastleHomeY:=Config.ReadInteger('Setup','SabukCastleHomeY',g_Config.nSabukCastleHomeY);


  
  if Config.ReadString('Setup','NammanCastleName','') = '' then
    Config.WriteString('Setup','NammanCastleName',g_Config.sNammanCastleName);
  g_Config.sNammanCastleName:=Config.ReadString('Setup','NammanCastleName',g_Config.sNammanCastleName);

  if Config.ReadString('Setup','NammanCastleHomeMap','') = '' then
    Config.WriteString('Setup','NammanCastleHomeMap',g_Config.sNammanCastleHomeMap);
  g_Config.sNammanCastleHomeMap:=Config.ReadString('Setup','NammanCastleHomeMap',g_Config.sNammanCastleHomeMap);

  if Config.ReadInteger('Setup','NammanCastleHomeX',-1) < 0 then
    Config.WriteInteger('Setup','NammanCastleHomeX',g_Config.nNammanCastleHomeX);
  g_Config.nNammanCastleHomeX:=Config.ReadInteger('Setup','NammanCastleHomeX',g_Config.nNammanCastleHomeX);

  if Config.ReadInteger('Setup','NammanCastleHomeY',-1) < 0 then
    Config.WriteInteger('Setup','NammanCastleHomeY',g_Config.nNammanCastleHomeY);
  g_Config.nNammanCastleHomeY:=Config.ReadInteger('Setup','NammanCastleHomeY',g_Config.nNammanCastleHomeY);


  if Config.ReadInteger('Setup','CastleTaxRate',-1) < 0 then
    Config.WriteInteger('Setup','CastleTaxRate',g_Config.nCastleTaxRate);
  g_Config.nCastleTaxRate:=Config.ReadInteger('Setup','CastleTaxRate',g_Config.nCastleTaxRate);

  if Config.ReadInteger('Setup','CastleGetAllNpcTax',-1) < 0 then
    Config.WriteBool('Setup','CastleGetAllNpcTax',g_Config.boGetAllNpcTax);
  g_Config.boGetAllNpcTax:=Config.ReadBool('Setup','CastleGetAllNpcTax',g_Config.boGetAllNpcTax);


  if Config.ReadInteger('Setup','GTNumberOfPeople',-1) < 0 then
    Config.WriteInteger('Setup','GTNumberOfPeople',g_Config.nGTNumberOfPeople);
  g_Config.nGTNumberOfPeople:=Config.ReadInteger('Setup','GTNumberOfPeople',g_Config.nGTNumberOfPeople);



  nLoadInteger:=Config.ReadInteger('Setup','GenMonRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GenMonRate',g_Config.nMonGenRate)
  else g_Config.nMonGenRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','ProcessMonRandRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','ProcessMonRandRate',g_Config.nProcessMonRandRate)
  else g_Config.nProcessMonRandRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','ProcessMonLimitCount',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','ProcessMonLimitCount',g_Config.nProcessMonLimitCount)
  else g_Config.nProcessMonLimitCount:=nLoadInteger;

  if Config.ReadInteger('Setup','HumanMaxGold',-1) < 0 then
    Config.WriteInteger('Setup','HumanMaxGold',g_Config.nHumanMaxGold);
  g_Config.nHumanMaxGold:=Config.ReadInteger('Setup','HumanMaxGold',g_Config.nHumanMaxGold);

  if Config.ReadInteger('Setup','HumanTryModeMaxGold',-1) < 0 then
    Config.WriteInteger('Setup','HumanTryModeMaxGold',g_Config.nHumanTryModeMaxGold);
  g_Config.nHumanTryModeMaxGold:=Config.ReadInteger('Setup','HumanTryModeMaxGold',g_Config.nHumanTryModeMaxGold);

  if Config.ReadInteger('Setup','TryModeLevel',-1) < 0 then
    Config.WriteInteger('Setup','TryModeLevel',g_Config.nTryModeLevel);
  g_Config.nTryModeLevel:=Config.ReadInteger('Setup','TryModeLevel',g_Config.nTryModeLevel);

  if Config.ReadInteger('Setup','TryModeUseStorage',-1) < 0 then
    Config.WriteBool('Setup','TryModeUseStorage',g_Config.boTryModeUseStorage);
  g_Config.boTryModeUseStorage:=Config.ReadBool('Setup','TryModeUseStorage',g_Config.boTryModeUseStorage);

  if Config.ReadInteger('Setup','ShutRedMsgShowGMName',-1) < 0 then
    Config.WriteBool('Setup','ShutRedMsgShowGMName',g_Config.boShutRedMsgShowGMName);
  g_Config.boShutRedMsgShowGMName:=Config.ReadBool('Setup','ShutRedMsgShowGMName',g_Config.boShutRedMsgShowGMName);

  if Config.ReadInteger('Setup','ShowMakeItemMsg',-1) < 0 then
    Config.WriteBool('Setup','ShowMakeItemMsg',g_Config.boShowMakeItemMsg);
  g_Config.boShowMakeItemMsg:=Config.ReadBool('Setup','ShowMakeItemMsg',g_Config.boShowMakeItemMsg);

  if Config.ReadInteger('Setup','ShowGuildName',-1) < 0 then
    Config.WriteBool('Setup','ShowGuildName',g_Config.boShowGuildName);
  g_Config.boShowGuildName:=Config.ReadBool('Setup','ShowGuildName',g_Config.boShowGuildName);

  if Config.ReadInteger('Setup','ShowRankLevelName',-1) < 0 then
    Config.WriteBool('Setup','ShowRankLevelName',g_Config.boShowRankLevelName);
  g_Config.boShowRankLevelName:=Config.ReadBool('Setup','ShowRankLevelName',g_Config.boShowRankLevelName);

  if Config.ReadInteger('Setup','ShowColumnName',-1) < 0 then
    Config.WriteBool('Setup','ShowColumnName',g_Config.boShowColumnName);
  g_Config.boShowColumnName:=Config.ReadBool('Setup','ShowColumnName',g_Config.boShowColumnName);

  if Config.ReadInteger('Setup','MonSayMsg',-1) < 0 then
    Config.WriteBool('Setup','MonSayMsg',g_Config.boMonSayMsg);
  g_Config.boMonSayMsg:=Config.ReadBool('Setup','MonSayMsg',g_Config.boMonSayMsg);

  if Config.ReadInteger('Setup','SayMsgMaxLen',-1) < 0 then
    Config.WriteInteger('Setup','SayMsgMaxLen',g_Config.nSayMsgMaxLen);
  g_Config.nSayMsgMaxLen:=Config.ReadInteger('Setup','SayMsgMaxLen',g_Config.nSayMsgMaxLen);

  if Config.ReadInteger('Setup','SayMsgTime',-1) < 0 then
    Config.WriteInteger('Setup','SayMsgTime',g_Config.dwSayMsgTime);
  g_Config.dwSayMsgTime:=Config.ReadInteger('Setup','SayMsgTime',g_Config.dwSayMsgTime);

  if Config.ReadInteger('Setup','SayMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','SayMsgCount',g_Config.nSayMsgCount);
  g_Config.nSayMsgCount:=Config.ReadInteger('Setup','SayMsgCount',g_Config.nSayMsgCount);

  if Config.ReadInteger('Setup','DisableSayMsgTime',-1) < 0 then
    Config.WriteInteger('Setup','DisableSayMsgTime',g_Config.dwDisableSayMsgTime);
  g_Config.dwDisableSayMsgTime:=Config.ReadInteger('Setup','DisableSayMsgTime',g_Config.dwDisableSayMsgTime);

  if Config.ReadInteger('Setup','SayRedMsgMaxLen',-1) < 0 then
    Config.WriteInteger('Setup','SayRedMsgMaxLen',g_Config.nSayRedMsgMaxLen);
  g_Config.nSayRedMsgMaxLen:=Config.ReadInteger('Setup','SayRedMsgMaxLen',g_Config.nSayRedMsgMaxLen);

  if Config.ReadInteger('Setup','CanShoutMsgLevel',-1) < 0 then
    Config.WriteInteger('Setup','CanShoutMsgLevel',g_Config.nCanShoutMsgLevel);
  g_Config.nCanShoutMsgLevel:=Config.ReadInteger('Setup','CanShoutMsgLevel',g_Config.nCanShoutMsgLevel);

  if Config.ReadInteger('Setup','StartPermission',-1) < 0 then
    Config.WriteInteger('Setup','StartPermission',g_Config.nStartPermission);
  g_Config.nStartPermission:=Config.ReadInteger('Setup','StartPermission',g_Config.nStartPermission);

  if Config.ReadInteger('Setup','SendRefMsgRange',-1) < 0 then
    Config.WriteInteger('Setup','SendRefMsgRange',g_Config.nSendRefMsgRange);
  g_Config.nSendRefMsgRange:=Config.ReadInteger('Setup','SendRefMsgRange',g_Config.nSendRefMsgRange);

  if Config.ReadInteger('Setup','DecLampDura',-1) < 0 then
    Config.WriteBool('Setup','DecLampDura',g_Config.boDecLampDura);
  g_Config.boDecLampDura:=Config.ReadBool('Setup','DecLampDura',g_Config.boDecLampDura);



  if Config.ReadInteger('Setup','DiableHumanRun',-1) < 0 then
    Config.WriteBool('Setup','DiableHumanRun',g_Config.boDiableHumanRun);
  g_Config.boDiableHumanRun:=Config.ReadBool('Setup','DiableHumanRun',g_Config.boDiableHumanRun);

  if Config.ReadInteger('Setup','RunHuman',-1) < 0 then
    Config.WriteBool('Setup','RunHuman',g_Config.boRunHuman);
  g_Config.boRunHuman:=Config.ReadBool('Setup','RunHuman',g_Config.boRunHuman);

  if Config.ReadInteger('Setup','RunMon',-1) < 0 then
    Config.WriteBool('Setup','RunMon',g_Config.boRunMon);
  g_Config.boRunMon:=Config.ReadBool('Setup','RunMon',g_Config.boRunMon);

  if Config.ReadInteger('Setup','RunNpc',-1) < 0 then
    Config.WriteBool('Setup','RunNpc',g_Config.boRunNpc);
  g_Config.boRunNpc:=Config.ReadBool('Setup','RunNpc',g_Config.boRunNpc);

  nLoadInteger:=Config.ReadInteger('Setup','RunGuard',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','RunGuard', g_Config.boRunGuard)
  else g_Config.boRunGuard:=nLoadInteger = 1;

  if Config.ReadInteger('Setup','WarDisableHumanRun',-1) < 0 then
    Config.WriteBool('Setup','WarDisableHumanRun',g_Config.boWarDisHumRun);
  g_Config.boWarDisHumRun:=Config.ReadBool('Setup','WarDisableHumanRun',g_Config.boWarDisHumRun);

  if Config.ReadInteger('Setup','GMRunAll',-1) < 0 then
    Config.WriteBool('Setup','GMRunAll',g_Config.boGMRunAll);
  g_Config.boGMRunAll:=Config.ReadBool('Setup','GMRunAll',g_Config.boGMRunAll);

  if Config.ReadInteger('Setup','SkeletonCount',-1) < 0 then
    Config.WriteInteger('Setup','SkeletonCount',g_Config.nSkeletonCount);
  g_Config.nSkeletonCount:=Config.ReadInteger('Setup','SkeletonCount',g_Config.nSkeletonCount);

  for I := Low(g_Config.SkeletonArray) to High(g_Config.SkeletonArray) do begin
    if Config.ReadInteger('Setup','SkeletonHumLevel' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','SkeletonHumLevel' + IntToStr(I),g_Config.SkeletonArray[I].nHumLevel);
    g_Config.SkeletonArray[I].nHumLevel:=Config.ReadInteger('Setup','SkeletonHumLevel' + IntToStr(I),g_Config.SkeletonArray[I].nHumLevel);

    if Config.ReadString('Names','Skeleton' + IntToStr(I),'') = '' then
      Config.WriteString('Names','Skeleton' + IntToStr(I),g_Config.SkeletonArray[I].sMonName);
    g_Config.SkeletonArray[I].sMonName:=Config.ReadString('Names','Skeleton' + IntToStr(I),g_Config.SkeletonArray[I].sMonName);

    if Config.ReadInteger('Setup','SkeletonCount' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','SkeletonCount' + IntToStr(I),g_Config.SkeletonArray[I].nCount);
    g_Config.SkeletonArray[I].nCount:=Config.ReadInteger('Setup','SkeletonCount' + IntToStr(I),g_Config.SkeletonArray[I].nCount);

    if Config.ReadInteger('Setup','SkeletonLevel' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','SkeletonLevel' + IntToStr(I),g_Config.SkeletonArray[I].nLevel);
    g_Config.SkeletonArray[I].nLevel:=Config.ReadInteger('Setup','SkeletonLevel' + IntToStr(I),g_Config.SkeletonArray[I].nLevel);
  end;

  if Config.ReadInteger('Setup','DragonCount',-1) < 0 then
    Config.WriteInteger('Setup','DragonCount',g_Config.nDragonCount);
  g_Config.nDragonCount:=Config.ReadInteger('Setup','DragonCount',g_Config.nDragonCount);

  for I := Low(g_Config.DragonArray) to High(g_Config.DragonArray) do begin
    if Config.ReadInteger('Setup','DragonHumLevel' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','DragonHumLevel' + IntToStr(I),g_Config.DragonArray[I].nHumLevel);
    g_Config.DragonArray[I].nHumLevel:=Config.ReadInteger('Setup','DragonHumLevel' + IntToStr(I),g_Config.DragonArray[I].nHumLevel);

    if Config.ReadString('Names','Dragon' + IntToStr(I),'') = '' then
      Config.WriteString('Names','Dragon' + IntToStr(I),g_Config.DragonArray[I].sMonName);
    g_Config.DragonArray[I].sMonName:=Config.ReadString('Names','Dragon' + IntToStr(I),g_Config.DragonArray[I].sMonName);

    if Config.ReadInteger('Setup','DragonCount' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','DragonCount' + IntToStr(I),g_Config.DragonArray[I].nCount);
    g_Config.DragonArray[I].nCount:=Config.ReadInteger('Setup','DragonCount' + IntToStr(I),g_Config.DragonArray[I].nCount);

    if Config.ReadInteger('Setup','DragonLevel' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','DragonLevel' + IntToStr(I),g_Config.DragonArray[I].nLevel);
    g_Config.DragonArray[I].nLevel:=Config.ReadInteger('Setup','DragonLevel' + IntToStr(I),g_Config.DragonArray[I].nLevel);
  end;

  if Config.ReadInteger('Setup','TryDealTime',-1) < 0 then
    Config.WriteInteger('Setup','TryDealTime',g_Config.dwTryDealTime);
  g_Config.dwTryDealTime:=Config.ReadInteger('Setup','TryDealTime',g_Config.dwTryDealTime);

  if Config.ReadInteger('Setup','DealOKTime',-1) < 0 then
    Config.WriteInteger('Setup','DealOKTime',g_Config.dwDealOKTime);
  g_Config.dwDealOKTime:=Config.ReadInteger('Setup','DealOKTime',g_Config.dwDealOKTime);

  if Config.ReadInteger('Setup','CanNotGetBackDeal',-1) < 0 then
    Config.WriteBool('Setup','CanNotGetBackDeal',g_Config.boCanNotGetBackDeal);
  g_Config.boCanNotGetBackDeal:=Config.ReadBool('Setup','CanNotGetBackDeal',g_Config.boCanNotGetBackDeal);

  if Config.ReadInteger('Setup','DisableDeal',-1) < 0 then
    Config.WriteBool('Setup','DisableDeal',g_Config.boDisableDeal);
  g_Config.boDisableDeal:=Config.ReadBool('Setup','DisableDeal',g_Config.boDisableDeal);

  if Config.ReadInteger('Setup','MasterOKLevel',-1) < 0 then
    Config.WriteInteger('Setup','MasterOKLevel',g_Config.nMasterOKLevel);
  g_Config.nMasterOKLevel:=Config.ReadInteger('Setup','MasterOKLevel',g_Config.nMasterOKLevel);

  if Config.ReadInteger('Setup','MasterOKCreditPoint',-1) < 0 then
    Config.WriteInteger('Setup','MasterOKCreditPoint',g_Config.nMasterOKCreditPoint);
  g_Config.nMasterOKCreditPoint:=Config.ReadInteger('Setup','MasterOKCreditPoint',g_Config.nMasterOKCreditPoint);

  if Config.ReadInteger('Setup','MasterOKBonusPoint',-1) < 0 then
    Config.WriteInteger('Setup','MasterOKBonusPoint',g_Config.nMasterOKBonusPoint);
  g_Config.nMasterOKBonusPoint:=Config.ReadInteger('Setup','MasterOKBonusPoint',g_Config.nMasterOKBonusPoint);

  if Config.ReadInteger('Setup','PKProtect',-1) < 0 then
    Config.WriteBool('Setup','PKProtect',g_Config.boPKLevelProtect);
  g_Config.boPKLevelProtect:=Config.ReadBool('Setup','PKProtect',g_Config.boPKLevelProtect);

  if Config.ReadInteger('Setup','PKProtectLevel',-1) < 0 then
    Config.WriteInteger('Setup','PKProtectLevel',g_Config.nPKProtectLevel);
  g_Config.nPKProtectLevel:=Config.ReadInteger('Setup','PKProtectLevel',g_Config.nPKProtectLevel);

  if Config.ReadInteger('Setup','LoverRecallTime',-1) < 0 then        //楷牢 家券  掉饭捞
    Config.WriteInteger('Setup','LoverRecallTime',g_Config.nLoverRecallTime);
  g_Config.nLoverRecallTime:=Config.ReadInteger('Setup','LoverRecallTime',g_Config.nLoverRecallTime);  

  if Config.ReadInteger('Setup','nMasterLevel',-1) < 0 then        //荤力 饭骇
    Config.WriteInteger('Setup','nMasterLevel',g_Config.nMasterLevel);
  g_Config.nMasterLevel:=Config.ReadInteger('Setup','nMasterLevel',g_Config.nMasterLevel);

  if Config.ReadInteger('Setup','RedPKProtectLevel',-1) < 0 then
    Config.WriteInteger('Setup','RedPKProtectLevel',g_Config.nRedPKProtectLevel);
  g_Config.nRedPKProtectLevel:=Config.ReadInteger('Setup','RedPKProtectLevel',g_Config.nRedPKProtectLevel);

  if Config.ReadInteger('Setup','ItemPowerRate',-1) < 0 then
    Config.WriteInteger('Setup','ItemPowerRate',g_Config.nItemPowerRate);
  g_Config.nItemPowerRate:=Config.ReadInteger('Setup','ItemPowerRate',g_Config.nItemPowerRate);

  if Config.ReadInteger('Setup','ItemExpRate',-1) < 0 then
    Config.WriteInteger('Setup','ItemExpRate',g_Config.nItemExpRate);
  g_Config.nItemExpRate:=Config.ReadInteger('Setup','ItemExpRate',g_Config.nItemExpRate);

  if Config.ReadInteger('Setup','ScriptGotoCountLimit',-1) < 0 then
    Config.WriteInteger('Setup','ScriptGotoCountLimit',g_Config.nScriptGotoCountLimit);
  g_Config.nScriptGotoCountLimit:=Config.ReadInteger('Setup','ScriptGotoCountLimit',g_Config.nScriptGotoCountLimit);

  if Config.ReadInteger('Setup','HearMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','HearMsgFColor',g_Config.btHearMsgFColor);
  g_Config.btHearMsgFColor:=Config.ReadInteger('Setup','HearMsgFColor',g_Config.btHearMsgFColor);

  if Config.ReadInteger('Setup','HearMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','HearMsgBColor', g_Config.btHearMsgBColor);
   g_Config.btHearMsgBColor:=Config.ReadInteger('Setup','HearMsgBColor', g_Config.btHearMsgBColor);

  if Config.ReadInteger('Setup','WhisperMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','WhisperMsgFColor', g_Config.btWhisperMsgFColor);
   g_Config.btWhisperMsgFColor:=Config.ReadInteger('Setup','WhisperMsgFColor', g_Config.btWhisperMsgFColor);

  if Config.ReadInteger('Setup','WhisperMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','WhisperMsgBColor', g_Config.btWhisperMsgBColor);
   g_Config.btWhisperMsgBColor:=Config.ReadInteger('Setup','WhisperMsgBColor', g_Config.btWhisperMsgBColor);

  if Config.ReadInteger('Setup','GMWhisperMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','GMWhisperMsgFColor', g_Config.btGMWhisperMsgFColor);
   g_Config.btGMWhisperMsgFColor:=Config.ReadInteger('Setup','GMWhisperMsgFColor', g_Config.btGMWhisperMsgFColor);

  if Config.ReadInteger('Setup','GMWhisperMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','GMWhisperMsgBColor', g_Config.btGMWhisperMsgBColor);
   g_Config.btGMWhisperMsgBColor:=Config.ReadInteger('Setup','GMWhisperMsgBColor', g_Config.btGMWhisperMsgBColor);

  if Config.ReadInteger('Setup','CryMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','CryMsgFColor', g_Config.btCryMsgFColor);
   g_Config.btCryMsgFColor:=Config.ReadInteger('Setup','CryMsgFColor', g_Config.btCryMsgFColor);

  if Config.ReadInteger('Setup','CryMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','CryMsgBColor', g_Config.btCryMsgBColor);
   g_Config.btCryMsgBColor:=Config.ReadInteger('Setup','CryMsgBColor', g_Config.btCryMsgBColor);

  if Config.ReadInteger('Setup','GreenMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','GreenMsgFColor', g_Config.btGreenMsgFColor);
   g_Config.btGreenMsgFColor:=Config.ReadInteger('Setup','GreenMsgFColor', g_Config.btGreenMsgFColor);

  if Config.ReadInteger('Setup','GreenMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','GreenMsgBColor', g_Config.btGreenMsgBColor);
   g_Config.btGreenMsgBColor:=Config.ReadInteger('Setup','GreenMsgBColor', g_Config.btGreenMsgBColor);

  if Config.ReadInteger('Setup','BlueMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','BlueMsgFColor', g_Config.btBlueMsgFColor);
   g_Config.btBlueMsgFColor:=Config.ReadInteger('Setup','BlueMsgFColor', g_Config.btBlueMsgFColor);

  if Config.ReadInteger('Setup','BlueMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','BlueMsgBColor', g_Config.btBlueMsgBColor);
   g_Config.btBlueMsgBColor:=Config.ReadInteger('Setup','BlueMsgBColor', g_Config.btBlueMsgBColor);

  if Config.ReadInteger('Setup','RedMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','RedMsgFColor', g_Config.btRedMsgFColor);
   g_Config.btRedMsgFColor:=Config.ReadInteger('Setup','RedMsgFColor', g_Config.btRedMsgFColor);

  if Config.ReadInteger('Setup','RedMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','RedMsgBColor', g_Config.btRedMsgBColor);
   g_Config.btRedMsgBColor:=Config.ReadInteger('Setup','RedMsgBColor', g_Config.btRedMsgBColor);

  if Config.ReadInteger('Setup','GuildMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','GuildMsgFColor', g_Config.btGuildMsgFColor);
   g_Config.btGuildMsgFColor:=Config.ReadInteger('Setup','GuildMsgFColor', g_Config.btGuildMsgFColor);

  if Config.ReadInteger('Setup','GuildMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','GuildMsgBColor', g_Config.btGuildMsgBColor);
   g_Config.btGuildMsgBColor:=Config.ReadInteger('Setup','GuildMsgBColor', g_Config.btGuildMsgBColor);

  if Config.ReadInteger('Setup','GroupMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','GroupMsgFColor', g_Config.btGroupMsgFColor);
   g_Config.btGroupMsgFColor:=Config.ReadInteger('Setup','GroupMsgFColor', g_Config.btGroupMsgFColor);

  if Config.ReadInteger('Setup','GroupMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','GroupMsgBColor', g_Config.btGroupMsgBColor);
   g_Config.btGroupMsgBColor:=Config.ReadInteger('Setup','GroupMsgBColor', g_Config.btGroupMsgBColor);

  if Config.ReadInteger('Setup','CustMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','CustMsgFColor', g_Config.btCustMsgFColor);
   g_Config.btCustMsgFColor:=Config.ReadInteger('Setup','CustMsgFColor', g_Config.btCustMsgFColor);

  if Config.ReadInteger('Setup','CustMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','CustMsgBColor', g_Config.btCustMsgBColor);
   g_Config.btCustMsgBColor:=Config.ReadInteger('Setup','CustMsgBColor', g_Config.btCustMsgBColor);

  if Config.ReadInteger('Setup','CustMsg1FColor',-1) < 0 then
    Config.WriteInteger('Setup','CustMsg1FColor', g_Config.btCustMsg1FColor);
   g_Config.btCustMsg1FColor:=Config.ReadInteger('Setup','CustMsg1FColor', g_Config.btCustMsg1FColor);

  if Config.ReadInteger('Setup','CustMsg1BColor',-1) < 0 then
    Config.WriteInteger('Setup','CustMsg1BColor', g_Config.btCustMsg1BColor);
   g_Config.btCustMsg1BColor:=Config.ReadInteger('Setup','CustMsg1BColor', g_Config.btCustMsg1BColor);

  if Config.ReadInteger('Setup','AllGuildMsgFColor',-1) < 0 then
    Config.WriteInteger('Setup','AllGuildMsgFColor', g_Config.btAllGuildMsgFColor);
   g_Config.btAllGuildMsgFColor:=Config.ReadInteger('Setup','AllGuildMsgFColor', g_Config.btAllGuildMsgFColor);

  if Config.ReadInteger('Setup','AllGuildMsgBColor',-1) < 0 then
    Config.WriteInteger('Setup','AllGuildMsgBColor', g_Config.btAllGuildMsgBColor);
   g_Config.btAllGuildMsgBColor:=Config.ReadInteger('Setup','AllGuildMsgBColor', g_Config.btAllGuildMsgBColor);

  if Config.ReadInteger('Setup','MonRandomAddValue',-1) < 0 then
    Config.WriteInteger('Setup','MonRandomAddValue', g_Config.nMonRandomAddValue);
  g_Config.nMonRandomAddValue:=Config.ReadInteger('Setup','MonRandomAddValue', g_Config.nMonRandomAddValue);

  if Config.ReadInteger('Setup','MakeRandomAddValue',-1) < 0 then
    Config.WriteInteger('Setup','MakeRandomAddValue', g_Config.nMakeRandomAddValue);
  g_Config.nMakeRandomAddValue:=Config.ReadInteger('Setup','MakeRandomAddValue', g_Config.nMakeRandomAddValue);

  if Config.ReadInteger('Setup','WeaponDCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','WeaponDCAddValueMaxLimit', g_Config.nWeaponDCAddValueMaxLimit);
  g_Config.nWeaponDCAddValueMaxLimit:=Config.ReadInteger('Setup','WeaponDCAddValueMaxLimit', g_Config.nWeaponDCAddValueMaxLimit);

  if Config.ReadInteger('Setup','WeaponDCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','WeaponDCAddValueRate', g_Config.nWeaponDCAddValueRate);
  g_Config.nWeaponDCAddValueRate:=Config.ReadInteger('Setup','WeaponDCAddValueRate', g_Config.nWeaponDCAddValueRate);

  if Config.ReadInteger('Setup','WeaponMCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','WeaponMCAddValueMaxLimit', g_Config.nWeaponMCAddValueMaxLimit);
  g_Config.nWeaponMCAddValueMaxLimit:=Config.ReadInteger('Setup','WeaponMCAddValueMaxLimit', g_Config.nWeaponMCAddValueMaxLimit);

  if Config.ReadInteger('Setup','WeaponMCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','WeaponMCAddValueRate', g_Config.nWeaponMCAddValueRate);
  g_Config.nWeaponMCAddValueRate:=Config.ReadInteger('Setup','WeaponMCAddValueRate', g_Config.nWeaponMCAddValueRate);

  if Config.ReadInteger('Setup','WeaponSCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','WeaponSCAddValueMaxLimit', g_Config.nWeaponSCAddValueMaxLimit);
  g_Config.nWeaponSCAddValueMaxLimit:=Config.ReadInteger('Setup','WeaponSCAddValueMaxLimit', g_Config.nWeaponSCAddValueMaxLimit);

  if Config.ReadInteger('Setup','WeaponSCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','WeaponSCAddValueRate', g_Config.nWeaponSCAddValueRate);
  g_Config.nWeaponSCAddValueRate:=Config.ReadInteger('Setup','WeaponSCAddValueRate', g_Config.nWeaponSCAddValueRate);

  if Config.ReadInteger('Setup','DressDCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','DressDCAddValueMaxLimit', g_Config.nDressDCAddValueMaxLimit);
  g_Config.nDressDCAddValueMaxLimit:=Config.ReadInteger('Setup','DressDCAddValueMaxLimit', g_Config.nDressDCAddValueMaxLimit);

  if Config.ReadInteger('Setup','DressDCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','DressDCAddValueRate', g_Config.nDressDCAddValueRate);
  g_Config.nDressDCAddValueRate:=Config.ReadInteger('Setup','DressDCAddValueRate', g_Config.nDressDCAddValueRate);

  if Config.ReadInteger('Setup','DressDCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','DressDCAddRate', g_Config.nDressDCAddRate);
  g_Config.nDressDCAddRate:=Config.ReadInteger('Setup','DressDCAddRate', g_Config.nDressDCAddRate);

  if Config.ReadInteger('Setup','DressMCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','DressMCAddValueMaxLimit', g_Config.nDressMCAddValueMaxLimit);
  g_Config.nDressMCAddValueMaxLimit:=Config.ReadInteger('Setup','DressMCAddValueMaxLimit', g_Config.nDressMCAddValueMaxLimit);

  if Config.ReadInteger('Setup','DressMCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','DressMCAddValueRate', g_Config.nDressMCAddValueRate);
  g_Config.nDressMCAddValueRate:=Config.ReadInteger('Setup','DressMCAddValueRate', g_Config.nDressMCAddValueRate);

  if Config.ReadInteger('Setup','DressMCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','DressMCAddRate', g_Config.nDressMCAddRate);
  g_Config.nDressMCAddRate:=Config.ReadInteger('Setup','DressMCAddRate', g_Config.nDressMCAddRate);

  if Config.ReadInteger('Setup','DressSCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','DressSCAddValueMaxLimit', g_Config.nDressSCAddValueMaxLimit);
  g_Config.nDressSCAddValueMaxLimit:=Config.ReadInteger('Setup','DressSCAddValueMaxLimit', g_Config.nDressSCAddValueMaxLimit);

  if Config.ReadInteger('Setup','DressSCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','DressSCAddValueRate', g_Config.nDressSCAddValueRate);
  g_Config.nDressSCAddValueRate:=Config.ReadInteger('Setup','DressSCAddValueRate', g_Config.nDressSCAddValueRate);

  if Config.ReadInteger('Setup','DressSCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','DressSCAddRate', g_Config.nDressSCAddRate);
  g_Config.nDressSCAddRate:=Config.ReadInteger('Setup','DressSCAddRate', g_Config.nDressSCAddRate);

  if Config.ReadInteger('Setup','NeckLace19DCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19DCAddValueMaxLimit', g_Config.nNeckLace19DCAddValueMaxLimit);
  g_Config.nNeckLace19DCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace19DCAddValueMaxLimit', g_Config.nNeckLace19DCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace19DCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19DCAddValueRate', g_Config.nNeckLace19DCAddValueRate);
  g_Config.nNeckLace19DCAddValueRate:=Config.ReadInteger('Setup','NeckLace19DCAddValueRate', g_Config.nNeckLace19DCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace19DCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19DCAddRate', g_Config.nNeckLace19DCAddRate);
  g_Config.nNeckLace19DCAddRate:=Config.ReadInteger('Setup','NeckLace19DCAddRate', g_Config.nNeckLace19DCAddRate);

  if Config.ReadInteger('Setup','NeckLace19MCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19MCAddValueMaxLimit', g_Config.nNeckLace19MCAddValueMaxLimit);
  g_Config.nNeckLace19MCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace19MCAddValueMaxLimit', g_Config.nNeckLace19MCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace19MCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19MCAddValueRate', g_Config.nNeckLace19MCAddValueRate);
  g_Config.nNeckLace19MCAddValueRate:=Config.ReadInteger('Setup','NeckLace19MCAddValueRate', g_Config.nNeckLace19MCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace19MCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19MCAddRate', g_Config.nNeckLace19MCAddRate);
  g_Config.nNeckLace19MCAddRate:=Config.ReadInteger('Setup','NeckLace19MCAddRate', g_Config.nNeckLace19MCAddRate);

  if Config.ReadInteger('Setup','NeckLace19SCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19SCAddValueMaxLimit', g_Config.nNeckLace19SCAddValueMaxLimit);
  g_Config.nNeckLace19SCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace19SCAddValueMaxLimit', g_Config.nNeckLace19SCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace19SCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19SCAddValueRate', g_Config.nNeckLace19SCAddValueRate);
  g_Config.nNeckLace19SCAddValueRate:=Config.ReadInteger('Setup','NeckLace19SCAddValueRate', g_Config.nNeckLace19SCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace19SCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace19SCAddRate', g_Config.nNeckLace19SCAddRate);
  g_Config.nNeckLace19SCAddRate:=Config.ReadInteger('Setup','NeckLace19SCAddRate', g_Config.nNeckLace19SCAddRate);

  if Config.ReadInteger('Setup','NeckLace202124DCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124DCAddValueMaxLimit', g_Config.nNeckLace202124DCAddValueMaxLimit);
  g_Config.nNeckLace202124DCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace202124DCAddValueMaxLimit', g_Config.nNeckLace202124DCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace202124DCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124DCAddValueRate', g_Config.nNeckLace202124DCAddValueRate);
  g_Config.nNeckLace202124DCAddValueRate:=Config.ReadInteger('Setup','NeckLace202124DCAddValueRate', g_Config.nNeckLace202124DCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace202124DCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124DCAddRate', g_Config.nNeckLace202124DCAddRate);
  g_Config.nNeckLace202124DCAddRate:=Config.ReadInteger('Setup','NeckLace202124DCAddRate', g_Config.nNeckLace202124DCAddRate);

  if Config.ReadInteger('Setup','NeckLace202124MCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124MCAddValueMaxLimit', g_Config.nNeckLace202124MCAddValueMaxLimit);
  g_Config.nNeckLace202124MCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace202124MCAddValueMaxLimit', g_Config.nNeckLace202124MCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace202124MCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124MCAddValueRate', g_Config.nNeckLace202124MCAddValueRate);
  g_Config.nNeckLace202124MCAddValueRate:=Config.ReadInteger('Setup','NeckLace202124MCAddValueRate', g_Config.nNeckLace202124MCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace202124MCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124MCAddRate', g_Config.nNeckLace202124MCAddRate);
  g_Config.nNeckLace202124MCAddRate:=Config.ReadInteger('Setup','NeckLace202124MCAddRate', g_Config.nNeckLace202124MCAddRate);

  if Config.ReadInteger('Setup','NeckLace202124SCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124SCAddValueMaxLimit', g_Config.nNeckLace202124SCAddValueMaxLimit);
  g_Config.nNeckLace202124SCAddValueMaxLimit:=Config.ReadInteger('Setup','NeckLace202124SCAddValueMaxLimit', g_Config.nNeckLace202124SCAddValueMaxLimit);

  if Config.ReadInteger('Setup','NeckLace202124SCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124SCAddValueRate', g_Config.nNeckLace202124SCAddValueRate);
  g_Config.nNeckLace202124SCAddValueRate:=Config.ReadInteger('Setup','NeckLace202124SCAddValueRate', g_Config.nNeckLace202124SCAddValueRate);

  if Config.ReadInteger('Setup','NeckLace202124SCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','NeckLace202124SCAddRate', g_Config.nNeckLace202124SCAddRate);
  g_Config.nNeckLace202124SCAddRate:=Config.ReadInteger('Setup','NeckLace202124SCAddRate', g_Config.nNeckLace202124SCAddRate);  


  if Config.ReadInteger('Setup','ArmRing26DCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26DCAddValueMaxLimit', g_Config.nArmRing26DCAddValueMaxLimit);
  g_Config.nArmRing26DCAddValueMaxLimit:=Config.ReadInteger('Setup','ArmRing26DCAddValueMaxLimit', g_Config.nArmRing26DCAddValueMaxLimit);

  if Config.ReadInteger('Setup','ArmRing26DCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26DCAddValueRate', g_Config.nArmRing26DCAddValueRate);
  g_Config.nArmRing26DCAddValueRate:=Config.ReadInteger('Setup','ArmRing26DCAddValueRate', g_Config.nArmRing26DCAddValueRate);

  if Config.ReadInteger('Setup','ArmRing26DCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26DCAddRate', g_Config.nArmRing26DCAddRate);
  g_Config.nArmRing26DCAddRate:=Config.ReadInteger('Setup','ArmRing26DCAddRate', g_Config.nArmRing26DCAddRate);

  if Config.ReadInteger('Setup','ArmRing26MCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26MCAddValueMaxLimit', g_Config.nArmRing26MCAddValueMaxLimit);
  g_Config.nArmRing26MCAddValueMaxLimit:=Config.ReadInteger('Setup','ArmRing26MCAddValueMaxLimit', g_Config.nArmRing26MCAddValueMaxLimit);

  if Config.ReadInteger('Setup','ArmRing26MCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26MCAddValueRate', g_Config.nArmRing26MCAddValueRate);
  g_Config.nArmRing26MCAddValueRate:=Config.ReadInteger('Setup','ArmRing26MCAddValueRate', g_Config.nArmRing26MCAddValueRate);

  if Config.ReadInteger('Setup','ArmRing26MCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26MCAddRate', g_Config.nArmRing26MCAddRate);
  g_Config.nArmRing26MCAddRate:=Config.ReadInteger('Setup','ArmRing26MCAddRate', g_Config.nArmRing26MCAddRate);

  if Config.ReadInteger('Setup','ArmRing26SCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26SCAddValueMaxLimit', g_Config.nArmRing26SCAddValueMaxLimit);
  g_Config.nArmRing26SCAddValueMaxLimit:=Config.ReadInteger('Setup','ArmRing26SCAddValueMaxLimit', g_Config.nArmRing26SCAddValueMaxLimit);

  if Config.ReadInteger('Setup','ArmRing26SCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26SCAddValueRate', g_Config.nArmRing26SCAddValueRate);
  g_Config.nArmRing26SCAddValueRate:=Config.ReadInteger('Setup','ArmRing26SCAddValueRate', g_Config.nArmRing26SCAddValueRate);

  if Config.ReadInteger('Setup','ArmRing26SCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','ArmRing26SCAddRate', g_Config.nArmRing26SCAddRate);
  g_Config.nArmRing26SCAddRate:=Config.ReadInteger('Setup','ArmRing26SCAddRate', g_Config.nArmRing26SCAddRate);

  if Config.ReadInteger('Setup','Ring22DCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring22DCAddValueMaxLimit', g_Config.nRing22DCAddValueMaxLimit);
  g_Config.nRing22DCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring22DCAddValueMaxLimit', g_Config.nRing22DCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring22DCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22DCAddValueRate', g_Config.nRing22DCAddValueRate);
  g_Config.nRing22DCAddValueRate:=Config.ReadInteger('Setup','Ring22DCAddValueRate', g_Config.nRing22DCAddValueRate);

  if Config.ReadInteger('Setup','Ring22DCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22DCAddRate', g_Config.nRing22DCAddRate);
  g_Config.nRing22DCAddRate:=Config.ReadInteger('Setup','Ring22DCAddRate', g_Config.nRing22DCAddRate);

  if Config.ReadInteger('Setup','Ring22MCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring22MCAddValueMaxLimit', g_Config.nRing22MCAddValueMaxLimit);
  g_Config.nRing22MCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring22MCAddValueMaxLimit', g_Config.nRing22MCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring22MCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22MCAddValueRate', g_Config.nRing22MCAddValueRate);
  g_Config.nRing22MCAddValueRate:=Config.ReadInteger('Setup','Ring22MCAddValueRate', g_Config.nRing22MCAddValueRate);

  if Config.ReadInteger('Setup','Ring22MCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22MCAddRate', g_Config.nRing22MCAddRate);
  g_Config.nRing22MCAddRate:=Config.ReadInteger('Setup','Ring22MCAddRate', g_Config.nRing22MCAddRate);

  if Config.ReadInteger('Setup','Ring22SCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring22SCAddValueMaxLimit', g_Config.nRing22SCAddValueMaxLimit);
  g_Config.nRing22SCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring22SCAddValueMaxLimit', g_Config.nRing22SCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring22SCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22SCAddValueRate', g_Config.nRing22SCAddValueRate);
  g_Config.nRing22SCAddValueRate:=Config.ReadInteger('Setup','Ring22SCAddValueRate', g_Config.nRing22SCAddValueRate);

  if Config.ReadInteger('Setup','Ring22SCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring22SCAddRate', g_Config.nRing22SCAddRate);
  g_Config.nRing22SCAddRate:=Config.ReadInteger('Setup','Ring22SCAddRate', g_Config.nRing22SCAddRate);


  if Config.ReadInteger('Setup','Ring23DCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring23DCAddValueMaxLimit', g_Config.nRing23DCAddValueMaxLimit);
  g_Config.nRing23DCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring23DCAddValueMaxLimit', g_Config.nRing23DCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring23DCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23DCAddValueRate', g_Config.nRing23DCAddValueRate);
  g_Config.nRing23DCAddValueRate:=Config.ReadInteger('Setup','Ring23DCAddValueRate', g_Config.nRing23DCAddValueRate);

  if Config.ReadInteger('Setup','Ring23DCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23DCAddRate', g_Config.nRing23DCAddRate);
  g_Config.nRing23DCAddRate:=Config.ReadInteger('Setup','Ring23DCAddRate', g_Config.nRing23DCAddRate);

  if Config.ReadInteger('Setup','Ring23MCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring23MCAddValueMaxLimit', g_Config.nRing23MCAddValueMaxLimit);
  g_Config.nRing23MCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring23MCAddValueMaxLimit', g_Config.nRing23MCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring23MCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23MCAddValueRate', g_Config.nRing23MCAddValueRate);
  g_Config.nRing23MCAddValueRate:=Config.ReadInteger('Setup','Ring23MCAddValueRate', g_Config.nRing23MCAddValueRate);

  if Config.ReadInteger('Setup','Ring23MCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23MCAddRate', g_Config.nRing23MCAddRate);
  g_Config.nRing23MCAddRate:=Config.ReadInteger('Setup','Ring23MCAddRate', g_Config.nRing23MCAddRate);

  if Config.ReadInteger('Setup','Ring23SCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','Ring23SCAddValueMaxLimit', g_Config.nRing23SCAddValueMaxLimit);
  g_Config.nRing23SCAddValueMaxLimit:=Config.ReadInteger('Setup','Ring23SCAddValueMaxLimit', g_Config.nRing23SCAddValueMaxLimit);

  if Config.ReadInteger('Setup','Ring23SCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23SCAddValueRate', g_Config.nRing23SCAddValueRate);
  g_Config.nRing23SCAddValueRate:=Config.ReadInteger('Setup','Ring23SCAddValueRate', g_Config.nRing23SCAddValueRate);

  if Config.ReadInteger('Setup','Ring23SCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','Ring23SCAddRate', g_Config.nRing23SCAddRate);
  g_Config.nRing23SCAddRate:=Config.ReadInteger('Setup','Ring23SCAddRate', g_Config.nRing23SCAddRate);

  if Config.ReadInteger('Setup','HelMetDCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','HelMetDCAddValueMaxLimit', g_Config.nHelMetDCAddValueMaxLimit);
  g_Config.nHelMetDCAddValueMaxLimit:=Config.ReadInteger('Setup','HelMetDCAddValueMaxLimit', g_Config.nHelMetDCAddValueMaxLimit);

  if Config.ReadInteger('Setup','HelMetDCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetDCAddValueRate', g_Config.nHelMetDCAddValueRate);
  g_Config.nHelMetDCAddValueRate:=Config.ReadInteger('Setup','HelMetDCAddValueRate', g_Config.nHelMetDCAddValueRate);

  if Config.ReadInteger('Setup','HelMetDCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetDCAddRate', g_Config.nHelMetDCAddRate);
  g_Config.nHelMetDCAddRate:=Config.ReadInteger('Setup','HelMetDCAddRate', g_Config.nHelMetDCAddRate);

  if Config.ReadInteger('Setup','HelMetMCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','HelMetMCAddValueMaxLimit', g_Config.nHelMetMCAddValueMaxLimit);
  g_Config.nHelMetMCAddValueMaxLimit:=Config.ReadInteger('Setup','HelMetMCAddValueMaxLimit', g_Config.nHelMetMCAddValueMaxLimit);

  if Config.ReadInteger('Setup','HelMetMCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetMCAddValueRate', g_Config.nHelMetMCAddValueRate);
  g_Config.nHelMetMCAddValueRate:=Config.ReadInteger('Setup','HelMetMCAddValueRate', g_Config.nHelMetMCAddValueRate);

  if Config.ReadInteger('Setup','HelMetMCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetMCAddRate', g_Config.nHelMetMCAddRate);
  g_Config.nHelMetMCAddRate:=Config.ReadInteger('Setup','HelMetMCAddRate', g_Config.nHelMetMCAddRate);

  if Config.ReadInteger('Setup','HelMetSCAddValueMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','HelMetSCAddValueMaxLimit', g_Config.nHelMetSCAddValueMaxLimit);
  g_Config.nHelMetSCAddValueMaxLimit:=Config.ReadInteger('Setup','HelMetSCAddValueMaxLimit', g_Config.nHelMetSCAddValueMaxLimit);

  if Config.ReadInteger('Setup','HelMetSCAddValueRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetSCAddValueRate', g_Config.nHelMetSCAddValueRate);
  g_Config.nHelMetSCAddValueRate:=Config.ReadInteger('Setup','HelMetSCAddValueRate', g_Config.nHelMetSCAddValueRate);

  if Config.ReadInteger('Setup','HelMetSCAddRate',-1) < 0 then
    Config.WriteInteger('Setup','HelMetSCAddRate', g_Config.nHelMetSCAddRate);
  g_Config.nHelMetSCAddRate:=Config.ReadInteger('Setup','HelMetSCAddRate', g_Config.nHelMetSCAddRate);

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetACAddValueMin1Limit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetACAddValueMin1Limit', g_Config.nUnknowHelMetACAddValueMin1Limit)
  else g_Config.nUnknowHelMetACAddValueMin1Limit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetACAddValueMax1Limit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetACAddValueMax1Limit', g_Config.nUnknowHelMetACAddValueMax1Limit)
  else g_Config.nUnknowHelMetACAddValueMax1Limit:=nLoadInteger;


  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetACAddValueMin2Limit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetACAddValueMin2Limit', g_Config.nUnknowHelMetACAddValueMin2Limit)
  else g_Config.nUnknowHelMetACAddValueMin2Limit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetACAddValueMax2Limit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetACAddValueMax2Limit', g_Config.nUnknowHelMetACAddValueMax2Limit)
  else g_Config.nUnknowHelMetACAddValueMax2Limit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetMACAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetMACAddValueMinLimit', g_Config.nUnknowHelMetMACAddValueMinLimit)
  else g_Config.nUnknowHelMetMACAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetMACAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetMACAddValueMaxLimit', g_Config.nUnknowHelMetMACAddValueMaxLimit)
  else g_Config.nUnknowHelMetMACAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetDCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetDCAddValueMinLimit', g_Config.nUnknowHelMetDCAddValueMinLimit)
  else g_Config.nUnknowHelMetDCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetDCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetDCAddValueMaxLimit', g_Config.nUnknowHelMetDCAddValueMaxLimit)
  else g_Config.nUnknowHelMetDCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetMCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetMCAddValueMinLimit', g_Config.nUnknowHelMetMCAddValueMinLimit)
  else g_Config.nUnknowHelMetMCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetMCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetMCAddValueMaxLimit', g_Config.nUnknowHelMetMCAddValueMaxLimit)
  else g_Config.nUnknowHelMetMCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetSCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetSCAddValueMinLimit', g_Config.nUnknowHelMetSCAddValueMinLimit)
  else g_Config.nUnknowHelMetSCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowHelMetSCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowHelMetSCAddValueMaxLimit', g_Config.nUnknowHelMetSCAddValueMaxLimit)
  else g_Config.nUnknowHelMetSCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceACAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceACAddValueMinLimit', g_Config.nUnknowNecklaceACAddValueMinLimit)
  else g_Config.nUnknowNecklaceACAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceACAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceACAddValueMaxLimit', g_Config.nUnknowNecklaceACAddValueMaxLimit)
  else g_Config.nUnknowNecklaceACAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceMACAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceMACAddValueMinLimit', g_Config.nUnknowNecklaceMACAddValueMinLimit)
  else g_Config.nUnknowNecklaceMACAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceMACAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceMACAddValueMaxLimit', g_Config.nUnknowNecklaceMACAddValueMaxLimit)
  else g_Config.nUnknowNecklaceMACAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceDCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceDCAddValueMinLimit', g_Config.nUnknowNecklaceDCAddValueMinLimit)
  else g_Config.nUnknowNecklaceDCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceDCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceDCAddValueMaxLimit', g_Config.nUnknowNecklaceDCAddValueMaxLimit)
  else g_Config.nUnknowNecklaceDCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceMCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceMCAddValueMinLimit', g_Config.nUnknowNecklaceMCAddValueMinLimit)
  else g_Config.nUnknowNecklaceMCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceMCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceMCAddValueMaxLimit', g_Config.nUnknowNecklaceMCAddValueMaxLimit)
  else g_Config.nUnknowNecklaceMCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceSCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceSCAddValueMinLimit', g_Config.nUnknowNecklaceSCAddValueMinLimit)
  else g_Config.nUnknowNecklaceSCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowNecklaceSCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowNecklaceSCAddValueMaxLimit', g_Config.nUnknowNecklaceSCAddValueMaxLimit)
  else g_Config.nUnknowNecklaceSCAddValueMaxLimit:=nLoadInteger;


  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingDCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingDCAddValueMinLimit', g_Config.nUnknowRingDCAddValueMinLimit)
  else g_Config.nUnknowRingDCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingDCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingDCAddValueMaxLimit', g_Config.nUnknowRingDCAddValueMaxLimit)
  else g_Config.nUnknowRingDCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingMCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingMCAddValueMinLimit', g_Config.nUnknowRingMCAddValueMinLimit)
  else g_Config.nUnknowRingMCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingMCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingMCAddValueMaxLimit', g_Config.nUnknowRingMCAddValueMaxLimit)
  else g_Config.nUnknowRingMCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingSCAddValueMinLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingSCAddValueMinLimit', g_Config.nUnknowRingSCAddValueMinLimit)
  else g_Config.nUnknowRingSCAddValueMinLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','UnknowRingSCAddValueMaxLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UnknowRingSCAddValueMaxLimit', g_Config.nUnknowRingSCAddValueMaxLimit)
  else g_Config.nUnknowRingSCAddValueMaxLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MonOneDropGoldCount',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MonOneDropGoldCount', g_Config.nMonOneDropGoldCount)
  else g_Config.nMonOneDropGoldCount:=nLoadInteger;

  if Config.ReadInteger('Setup','MakeMineHitRate',-1) < 0 then
    Config.WriteInteger('Setup','MakeMineHitRate', g_Config.nMakeMineHitRate);
  g_Config.nMakeMineHitRate:=Config.ReadInteger('Setup','MakeMineHitRate', g_Config.nMakeMineHitRate);

  if Config.ReadInteger('Setup','MakeMineRate',-1) < 0 then
    Config.WriteInteger('Setup','MakeMineRate', g_Config.nMakeMineRate);
  g_Config.nMakeMineRate:=Config.ReadInteger('Setup','MakeMineRate', g_Config.nMakeMineRate);

  if Config.ReadInteger('Setup','StoneTypeRate',-1) < 0 then
    Config.WriteInteger('Setup','StoneTypeRate', g_Config.nStoneTypeRate);
  g_Config.nStoneTypeRate:=Config.ReadInteger('Setup','StoneTypeRate', g_Config.nStoneTypeRate);

  if Config.ReadInteger('Setup','StoneTypeRateMin',-1) < 0 then
    Config.WriteInteger('Setup','StoneTypeRateMin', g_Config.nStoneTypeRateMin);
  g_Config.nStoneTypeRateMin:=Config.ReadInteger('Setup','StoneTypeRateMin', g_Config.nStoneTypeRateMin);

  if Config.ReadInteger('Setup','GoldStoneMin',-1) < 0 then
    Config.WriteInteger('Setup','GoldStoneMin', g_Config.nGoldStoneMin);
  g_Config.nGoldStoneMin:=Config.ReadInteger('Setup','GoldStoneMin', g_Config.nGoldStoneMin);

  if Config.ReadInteger('Setup','GoldStoneMax',-1) < 0 then
    Config.WriteInteger('Setup','GoldStoneMax', g_Config.nGoldStoneMax);
  g_Config.nGoldStoneMax:=Config.ReadInteger('Setup','GoldStoneMax', g_Config.nGoldStoneMax);

  if Config.ReadInteger('Setup','SilverStoneMin',-1) < 0 then
    Config.WriteInteger('Setup','SilverStoneMin', g_Config.nSilverStoneMin);
  g_Config.nSilverStoneMin:=Config.ReadInteger('Setup','SilverStoneMin', g_Config.nSilverStoneMin);

  if Config.ReadInteger('Setup','SilverStoneMax',-1) < 0 then
    Config.WriteInteger('Setup','SilverStoneMax', g_Config.nSilverStoneMax);
  g_Config.nSilverStoneMax:=Config.ReadInteger('Setup','SilverStoneMax', g_Config.nSilverStoneMax);

  if Config.ReadInteger('Setup','SteelStoneMin',-1) < 0 then
    Config.WriteInteger('Setup','SteelStoneMin', g_Config.nSteelStoneMin);
  g_Config.nSteelStoneMin:=Config.ReadInteger('Setup','SteelStoneMin', g_Config.nSteelStoneMin);

  if Config.ReadInteger('Setup','SteelStoneMax',-1) < 0 then
    Config.WriteInteger('Setup','SteelStoneMax', g_Config.nSteelStoneMax);
  g_Config.nSteelStoneMax:=Config.ReadInteger('Setup','SteelStoneMax', g_Config.nSteelStoneMax);

  if Config.ReadInteger('Setup','BlackStoneMin',-1) < 0 then
    Config.WriteInteger('Setup','BlackStoneMin', g_Config.nBlackStoneMin);
  g_Config.nBlackStoneMin:=Config.ReadInteger('Setup','BlackStoneMin', g_Config.nBlackStoneMin);

  if Config.ReadInteger('Setup','BlackStoneMax',-1) < 0 then
    Config.WriteInteger('Setup','BlackStoneMax', g_Config.nBlackStoneMax);
  g_Config.nBlackStoneMax:=Config.ReadInteger('Setup','BlackStoneMax', g_Config.nBlackStoneMax);

  if Config.ReadInteger('Setup','StoneMinDura',-1) < 0 then
    Config.WriteInteger('Setup','StoneMinDura', g_Config.nStoneMinDura);
  g_Config.nStoneMinDura:=Config.ReadInteger('Setup','StoneMinDura', g_Config.nStoneMinDura);

  if Config.ReadInteger('Setup','StoneGeneralDuraRate',-1) < 0 then
    Config.WriteInteger('Setup','StoneGeneralDuraRate', g_Config.nStoneGeneralDuraRate);
  g_Config.nStoneGeneralDuraRate:=Config.ReadInteger('Setup','StoneGeneralDuraRate', g_Config.nStoneGeneralDuraRate);

  if Config.ReadInteger('Setup','StoneAddDuraRate',-1) < 0 then
    Config.WriteInteger('Setup','StoneAddDuraRate', g_Config.nStoneAddDuraRate);
  g_Config.nStoneAddDuraRate:=Config.ReadInteger('Setup','StoneAddDuraRate', g_Config.nStoneAddDuraRate);

  if Config.ReadInteger('Setup','StoneAddDuraMax',-1) < 0 then
    Config.WriteInteger('Setup','StoneAddDuraMax', g_Config.nStoneAddDuraMax);
  g_Config.nStoneAddDuraMax:=Config.ReadInteger('Setup','StoneAddDuraMax', g_Config.nStoneAddDuraMax);

  if Config.ReadInteger('Setup','WinLottery1Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery1Min', g_Config.nWinLottery1Min);
  g_Config.nWinLottery1Min:=Config.ReadInteger('Setup','WinLottery1Min', g_Config.nWinLottery1Min);

  if Config.ReadInteger('Setup','WinLottery1Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery1Max', g_Config.nWinLottery1Max);
  g_Config.nWinLottery1Max:=Config.ReadInteger('Setup','WinLottery1Max', g_Config.nWinLottery1Max);

  if Config.ReadInteger('Setup','WinLottery2Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery2Min', g_Config.nWinLottery2Min);
  g_Config.nWinLottery2Min:=Config.ReadInteger('Setup','WinLottery2Min', g_Config.nWinLottery2Min);

  if Config.ReadInteger('Setup','WinLottery2Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery2Max', g_Config.nWinLottery2Max);
  g_Config.nWinLottery2Max:=Config.ReadInteger('Setup','WinLottery2Max', g_Config.nWinLottery2Max);

  if Config.ReadInteger('Setup','WinLottery3Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery3Min', g_Config.nWinLottery3Min);
  g_Config.nWinLottery3Min:=Config.ReadInteger('Setup','WinLottery3Min', g_Config.nWinLottery3Min);

  if Config.ReadInteger('Setup','WinLottery3Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery3Max', g_Config.nWinLottery3Max);
  g_Config.nWinLottery3Max:=Config.ReadInteger('Setup','WinLottery3Max', g_Config.nWinLottery3Max);

  if Config.ReadInteger('Setup','WinLottery4Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery4Min', g_Config.nWinLottery4Min);
  g_Config.nWinLottery4Min:=Config.ReadInteger('Setup','WinLottery4Min', g_Config.nWinLottery4Min);

  if Config.ReadInteger('Setup','WinLottery4Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery4Max', g_Config.nWinLottery4Max);
  g_Config.nWinLottery4Max:=Config.ReadInteger('Setup','WinLottery4Max', g_Config.nWinLottery4Max);

  if Config.ReadInteger('Setup','WinLottery5Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery5Min', g_Config.nWinLottery5Min);
  g_Config.nWinLottery5Min:=Config.ReadInteger('Setup','WinLottery5Min', g_Config.nWinLottery5Min);

  if Config.ReadInteger('Setup','WinLottery5Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery5Max', g_Config.nWinLottery5Max);
  g_Config.nWinLottery5Max:=Config.ReadInteger('Setup','WinLottery5Max', g_Config.nWinLottery5Max);

  if Config.ReadInteger('Setup','WinLottery6Min',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery6Min', g_Config.nWinLottery6Min);
  g_Config.nWinLottery6Min:=Config.ReadInteger('Setup','WinLottery6Min', g_Config.nWinLottery6Min);

  if Config.ReadInteger('Setup','WinLottery6Max',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery6Max', g_Config.nWinLottery6Max);
  g_Config.nWinLottery6Max:=Config.ReadInteger('Setup','WinLottery6Max', g_Config.nWinLottery6Max);

  if Config.ReadInteger('Setup','WinLotteryRate',-1) < 0 then
    Config.WriteInteger('Setup','WinLotteryRate', g_Config.nWinLotteryRate);
  g_Config.nWinLotteryRate:=Config.ReadInteger('Setup','WinLotteryRate', g_Config.nWinLotteryRate);

  if Config.ReadInteger('Setup','WinLottery1Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery1Gold', g_Config.nWinLottery1Gold);
  g_Config.nWinLottery1Gold:=Config.ReadInteger('Setup','WinLottery1Gold', g_Config.nWinLottery1Gold);

  if Config.ReadInteger('Setup','WinLottery2Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery2Gold', g_Config.nWinLottery2Gold);
  g_Config.nWinLottery2Gold:=Config.ReadInteger('Setup','WinLottery2Gold', g_Config.nWinLottery2Gold);

  if Config.ReadInteger('Setup','WinLottery3Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery3Gold', g_Config.nWinLottery3Gold);
  g_Config.nWinLottery3Gold:=Config.ReadInteger('Setup','WinLottery3Gold', g_Config.nWinLottery3Gold);

  if Config.ReadInteger('Setup','WinLottery4Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery4Gold', g_Config.nWinLottery4Gold);
  g_Config.nWinLottery4Gold:=Config.ReadInteger('Setup','WinLottery4Gold', g_Config.nWinLottery4Gold);

  if Config.ReadInteger('Setup','WinLottery5Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery5Gold', g_Config.nWinLottery5Gold);
  g_Config.nWinLottery5Gold:=Config.ReadInteger('Setup','WinLottery5Gold', g_Config.nWinLottery5Gold);

  if Config.ReadInteger('Setup','WinLottery6Gold',-1) < 0 then
    Config.WriteInteger('Setup','WinLottery6Gold', g_Config.nWinLottery6Gold);
  g_Config.nWinLottery6Gold:=Config.ReadInteger('Setup','WinLottery6Gold', g_Config.nWinLottery6Gold);        

  if Config.ReadInteger('Setup','GuildRecallTime',-1) < 0 then
    Config.WriteInteger('Setup','GuildRecallTime', g_Config.nGuildRecallTime);
  g_Config.nGuildRecallTime:=Config.ReadInteger('Setup','GuildRecallTime', g_Config.nGuildRecallTime);

  if Config.ReadInteger('Setup','GroupRecallTime',-1) < 0 then
    Config.WriteInteger('Setup','GroupRecallTime', g_Config.nGroupRecallTime);
  g_Config.nGroupRecallTime:=Config.ReadInteger('Setup','GroupRecallTime', g_Config.nGroupRecallTime);

  if Config.ReadInteger('Setup','ControlDropItem',-1) < 0 then
    Config.WriteBool('Setup','ControlDropItem', g_Config.boControlDropItem);
  g_Config.boControlDropItem:=Config.ReadBool('Setup','ControlDropItem', g_Config.boControlDropItem);

  if Config.ReadInteger('Setup','InSafeDisableDrop',-1) < 0 then
    Config.WriteBool('Setup','InSafeDisableDrop', g_Config.boInSafeDisableDrop);
  g_Config.boInSafeDisableDrop:=Config.ReadBool('Setup','InSafeDisableDrop', g_Config.boInSafeDisableDrop);

  if Config.ReadInteger('Setup','CanDropGold',-1) < 0 then
    Config.WriteInteger('Setup','CanDropGold', g_Config.nCanDropGold);
  g_Config.nCanDropGold:=Config.ReadInteger('Setup','CanDropGold', g_Config.nCanDropGold);

  if Config.ReadInteger('Setup','CanDropPrice',-1) < 0 then
    Config.WriteInteger('Setup','CanDropPrice', g_Config.nCanDropPrice);
  g_Config.nCanDropPrice:=Config.ReadInteger('Setup','CanDropPrice', g_Config.nCanDropPrice);

  nLoadInteger:=Config.ReadInteger('Setup','SendCustemMsg',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','SendCustemMsg', g_Config.boSendCustemMsg)
  else g_Config.boSendCustemMsg:=nLoadInteger = 1;

  nLoadInteger:=Config.ReadInteger('Setup','SubkMasterSendMsg',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','SubkMasterSendMsg', g_Config.boSubkMasterSendMsg)
  else g_Config.boSubkMasterSendMsg:=nLoadInteger = 1;

  if Config.ReadInteger('Setup','SuperRepairPriceRate',-1) < 0 then
    Config.WriteInteger('Setup','SuperRepairPriceRate',g_Config.nSuperRepairPriceRate);
  g_Config.nSuperRepairPriceRate:=Config.ReadInteger('Setup','SuperRepairPriceRate',g_Config.nSuperRepairPriceRate);

  if Config.ReadInteger('Setup','RepairItemDecDura',-1) < 0 then
    Config.WriteInteger('Setup','RepairItemDecDura',g_Config.nRepairItemDecDura);
  g_Config.nRepairItemDecDura:=Config.ReadInteger('Setup','RepairItemDecDura',g_Config.nRepairItemDecDura);

  if Config.ReadInteger('Setup','DieScatterBag',-1) < 0 then
    Config.WriteBool('Setup','DieScatterBag', g_Config.boDieScatterBag);
  g_Config.boDieScatterBag:=Config.ReadBool('Setup','DieScatterBag', g_Config.boDieScatterBag);

  if Config.ReadInteger('Setup','DieScatterBagRate',-1) < 0 then
    Config.WriteInteger('Setup','DieScatterBagRate',g_Config.nDieScatterBagRate);
  g_Config.nDieScatterBagRate:=Config.ReadInteger('Setup','DieScatterBagRate',g_Config.nDieScatterBagRate);

  if Config.ReadInteger('Setup','DieRedScatterBagAll',-1) < 0 then
    Config.WriteBool('Setup','DieRedScatterBagAll',g_Config.boDieRedScatterBagAll);
  g_Config.boDieRedScatterBagAll:=Config.ReadBool('Setup','DieRedScatterBagAll',g_Config.boDieRedScatterBagAll);

  if Config.ReadInteger('Setup','Reserved64dell',-1) < 0 then
    Config.WriteBool('Setup','Reserved64dell',g_Config.Reserved64dell);
  g_Config.Reserved64dell:=Config.ReadBool('Setup','Reserved64dell',g_Config.Reserved64dell);

  if Config.ReadInteger('Setup','DieDropUseItemRate',-1) < 0 then
    Config.WriteInteger('Setup','DieDropUseItemRate',g_Config.nDieDropUseItemRate);
  g_Config.nDieDropUseItemRate:=Config.ReadInteger('Setup','DieDropUseItemRate',g_Config.nDieDropUseItemRate);

  if Config.ReadInteger('Setup','DieRedDropUseItemRate',-1) < 0 then
    Config.WriteInteger('Setup','DieRedDropUseItemRate',g_Config.nDieRedDropUseItemRate);
  g_Config.nDieRedDropUseItemRate:=Config.ReadInteger('Setup','DieRedDropUseItemRate',g_Config.nDieRedDropUseItemRate);

  if Config.ReadInteger('Setup','DieDropGold',-1) < 0 then
    Config.WriteBool('Setup','DieDropGold',g_Config.boDieDropGold);
  g_Config.boDieDropGold:=Config.ReadBool('Setup','DieDropGold',g_Config.boDieDropGold);

  if Config.ReadInteger('Setup','KillByHumanDropUseItem',-1) < 0 then
    Config.WriteBool('Setup','KillByHumanDropUseItem',g_Config.boKillByHumanDropUseItem);
  g_Config.boKillByHumanDropUseItem:=Config.ReadBool('Setup','KillByHumanDropUseItem',g_Config.boKillByHumanDropUseItem);

  if Config.ReadInteger('Setup','KillByMonstDropUseItem',-1) < 0 then
    Config.WriteBool('Setup','KillByMonstDropUseItem',g_Config.boKillByMonstDropUseItem);
  g_Config.boKillByMonstDropUseItem:=Config.ReadBool('Setup','KillByMonstDropUseItem',g_Config.boKillByMonstDropUseItem);

  if Config.ReadInteger('Setup','KickExpireHuman',-1) < 0 then
    Config.WriteBool('Setup','KickExpireHuman',g_Config.boKickExpireHuman);
  g_Config.boKickExpireHuman:=Config.ReadBool('Setup','KickExpireHuman',g_Config.boKickExpireHuman);

  if Config.ReadInteger('Setup','GuildRankNameLen',-1) < 0 then
    Config.WriteInteger('Setup','GuildRankNameLen',g_Config.nGuildRankNameLen);
  g_Config.nGuildRankNameLen:=Config.ReadInteger('Setup','GuildRankNameLen',g_Config.nGuildRankNameLen);

  if Config.ReadInteger('Setup','GuildNameLen',-1) < 0 then
    Config.WriteInteger('Setup','GuildNameLen',g_Config.nGuildNameLen);
  g_Config.nGuildNameLen:=Config.ReadInteger('Setup','GuildNameLen',g_Config.nGuildNameLen);

  if Config.ReadInteger('Setup','GuildMemberMaxLimit',-1) < 0 then
    Config.WriteInteger('Setup','GuildMemberMaxLimit',g_Config.nGuildMemberMaxLimit);
  g_Config.nGuildMemberMaxLimit:=Config.ReadInteger('Setup','GuildMemberMaxLimit',g_Config.nGuildMemberMaxLimit);
    

  if Config.ReadInteger('Setup','AttackPosionRate',-1) < 0 then
    Config.WriteInteger('Setup','AttackPosionRate',g_Config.nAttackPosionRate);
  g_Config.nAttackPosionRate:=Config.ReadInteger('Setup','AttackPosionRate',g_Config.nAttackPosionRate);

  if Config.ReadInteger('Setup','AttackPosionTime',-1) < 0 then
    Config.WriteInteger('Setup','AttackPosionTime',g_Config.nAttackPosionTime);
  g_Config.nAttackPosionTime:=Config.ReadInteger('Setup','AttackPosionTime',g_Config.nAttackPosionTime);

  if Config.ReadInteger('Setup','AttackSuperPosionRate',-1) < 0 then
    Config.WriteInteger('Setup','AttackSuperPosionRate',g_Config.nAttackSuperPosionRate);
  g_Config.nAttackSuperPosionRate:=Config.ReadInteger('Setup','AttackSuperPosionRate',g_Config.nAttackSuperPosionRate);

  if Config.ReadInteger('Setup','RevivalTime',-1) < 0 then
    Config.WriteInteger('Setup','RevivalTime',g_Config.dwRevivalTime);
  g_Config.dwRevivalTime:=Config.ReadInteger('Setup','RevivalTime',g_Config.dwRevivalTime);

  nLoadInteger:=Config.ReadInteger('Setup','UserMoveCanDupObj',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','UserMoveCanDupObj',g_Config.boUserMoveCanDupObj)
  else g_Config.boUserMoveCanDupObj:=nLoadInteger = 1;

  nLoadInteger:=Config.ReadInteger('Setup','UserMoveCanOnItem',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','UserMoveCanOnItem',g_Config.boUserMoveCanOnItem)
  else g_Config.boUserMoveCanOnItem:=nLoadInteger = 1;

  nLoadInteger:=Config.ReadInteger('Setup','UserMoveTime',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','UserMoveTime',g_Config.dwUserMoveTime)
  else g_Config.dwUserMoveTime:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','PKDieLostExpRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','PKDieLostExpRate',g_Config.dwPKDieLostExpRate)
  else g_Config.dwPKDieLostExpRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','PKDieLostLevelRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','PKDieLostLevelRate',g_Config.nPKDieLostLevelRate)
  else g_Config.nPKDieLostLevelRate:=nLoadInteger;

  if Config.ReadInteger('Setup','PKFlagNameColor',-1) < 0 then
    Config.WriteInteger('Setup','PKFlagNameColor',g_Config.btPKFlagNameColor);
  g_Config.btPKFlagNameColor:=Config.ReadInteger('Setup','PKFlagNameColor',g_Config.btPKFlagNameColor);

  if Config.ReadInteger('Setup','AllyAndGuildNameColor',-1) < 0 then
    Config.WriteInteger('Setup','AllyAndGuildNameColor',g_Config.btAllyAndGuildNameColor);
  g_Config.btAllyAndGuildNameColor:=Config.ReadInteger('Setup','AllyAndGuildNameColor',g_Config.btAllyAndGuildNameColor);

  if Config.ReadInteger('Setup','WarGuildNameColor',-1) < 0 then
    Config.WriteInteger('Setup','WarGuildNameColor',g_Config.btWarGuildNameColor);
  g_Config.btWarGuildNameColor:=Config.ReadInteger('Setup','WarGuildNameColor',g_Config.btWarGuildNameColor);

  if Config.ReadInteger('Setup','CatleGuildNameColor',-1) < 0 then           //荤合巩 捞抚祸
    Config.WriteInteger('Setup','CatleGuildNameColor',g_Config.btCatleGuildNameColor);
  g_Config.btCatleGuildNameColor:=Config.ReadInteger('Setup','CatleGuildNameColor',g_Config.btCatleGuildNameColor);

  if Config.ReadInteger('Setup','NamCatleGuildNameColor',-1) < 0 then           //荤合巩 捞抚祸
    Config.WriteInteger('Setup','NamCatleGuildNameColor',g_Config.btNamCatleGuildNameColor);
  g_Config.btNamCatleGuildNameColor:=Config.ReadInteger('Setup','NamCatleGuildNameColor',g_Config.btNamCatleGuildNameColor);

  if Config.ReadInteger('Setup','KingCatleGuildNameColor',-1) < 0 then           //巢父己 捞抚祸
    Config.WriteInteger('Setup','KingCatleGuildNameColor',g_Config.btKingCatleGuildNameColor);
  g_Config.btKingCatleGuildNameColor:=Config.ReadInteger('Setup','KingCatleGuildNameColor',g_Config.btKingCatleGuildNameColor);

  if Config.ReadInteger('Setup','CatleWarGuildNameColor',-1) < 0 then         //傍己 傍拜 捞抚祸
    Config.WriteInteger('Setup','CatleWarGuildNameColor',g_Config.btCatleWarGuildNameColor);
  g_Config.btCatleWarGuildNameColor:=Config.ReadInteger('Setup','CatleWarGuildNameColor',g_Config.btCatleWarGuildNameColor);

  if Config.ReadInteger('Setup','InFreePKAreaNameColor',-1) < 0 then
    Config.WriteInteger('Setup','InFreePKAreaNameColor',g_Config.btInFreePKAreaNameColor);
  g_Config.btInFreePKAreaNameColor:=Config.ReadInteger('Setup','InFreePKAreaNameColor',g_Config.btInFreePKAreaNameColor);

  if Config.ReadInteger('Setup','PKLevel1NameColor',-1) < 0 then
    Config.WriteInteger('Setup','PKLevel1NameColor',g_Config.btPKLevel1NameColor);
  g_Config.btPKLevel1NameColor:=Config.ReadInteger('Setup','PKLevel1NameColor',g_Config.btPKLevel1NameColor);

  if Config.ReadInteger('Setup','PKLevel2NameColor',-1) < 0 then
    Config.WriteInteger('Setup','PKLevel2NameColor',g_Config.btPKLevel2NameColor);
  g_Config.btPKLevel2NameColor:=Config.ReadInteger('Setup','PKLevel2NameColor',g_Config.btPKLevel2NameColor);

  if Config.ReadInteger('Setup','SpiritMutiny',-1) < 0 then
    Config.WriteBool('Setup','SpiritMutiny',g_Config.boSpiritMutiny);
  g_Config.boSpiritMutiny:=Config.ReadBool('Setup','SpiritMutiny',g_Config.boSpiritMutiny);

  if Config.ReadInteger('Setup','SpiritMutinyTime',-1) < 0 then
    Config.WriteInteger('Setup','SpiritMutinyTime',g_Config.dwSpiritMutinyTime);
  g_Config.dwSpiritMutinyTime:=Config.ReadInteger('Setup','SpiritMutinyTime',g_Config.dwSpiritMutinyTime);

  if Config.ReadInteger('Setup','SpiritPowerRate',-1) < 0 then
    Config.WriteInteger('Setup','SpiritPowerRate',g_Config.nSpiritPowerRate);
  g_Config.nSpiritPowerRate:=Config.ReadInteger('Setup','SpiritPowerRate',g_Config.nSpiritPowerRate);

  if Config.ReadInteger('Setup','MasterDieMutiny',-1) < 0 then
    Config.WriteBool('Setup','MasterDieMutiny',g_Config.boMasterDieMutiny);
  g_Config.boMasterDieMutiny:=Config.ReadBool('Setup','MasterDieMutiny',g_Config.boMasterDieMutiny);

  if Config.ReadInteger('Setup','MasterDieMutinyRate',-1) < 0 then
    Config.WriteInteger('Setup','MasterDieMutinyRate',g_Config.nMasterDieMutinyRate);
  g_Config.nMasterDieMutinyRate:=Config.ReadInteger('Setup','MasterDieMutinyRate',g_Config.nMasterDieMutinyRate);

  if Config.ReadInteger('Setup','MasterDieMutinyPower',-1) < 0 then
    Config.WriteInteger('Setup','MasterDieMutinyPower',g_Config.nMasterDieMutinyPower);
  g_Config.nMasterDieMutinyPower:=Config.ReadInteger('Setup','MasterDieMutinyPower',g_Config.nMasterDieMutinyPower);

  if Config.ReadInteger('Setup','MasterDieMutinyPower',-1) < 0 then
    Config.WriteInteger('Setup','MasterDieMutinyPower',g_Config.nMasterDieMutinySpeed);
  g_Config.nMasterDieMutinySpeed:=Config.ReadInteger('Setup','MasterDieMutinyPower',g_Config.nMasterDieMutinySpeed);

  if Config.ReadInteger('Setup','OldClientShowHiLevel',-1) < 0 then
    Config.WriteBool('Setup','OldClientShowHiLevel',g_Config.boOldClientShowHiLevel);
  g_Config.boOldClientShowHiLevel:=Config.ReadBool('Setup','OldClientShowHiLevel',g_Config.boOldClientShowHiLevel);

  if Config.ReadInteger('Setup','ShowScriptActionMsg',-1) < 0 then
    Config.WriteBool('Setup','ShowScriptActionMsg',g_Config.boShowScriptActionMsg);
  g_Config.boShowScriptActionMsg:=Config.ReadBool('Setup','ShowScriptActionMsg',g_Config.boShowScriptActionMsg);

  if Config.ReadInteger('Setup','RunSocketDieLoopLimit',-1) < 0 then
    Config.WriteInteger('Setup','RunSocketDieLoopLimit',g_Config.nRunSocketDieLoopLimit);
  g_Config.nRunSocketDieLoopLimit:=Config.ReadInteger('Setup','RunSocketDieLoopLimit',g_Config.nRunSocketDieLoopLimit);

  if Config.ReadInteger('Setup','ThreadRun',-1) < 0 then
    Config.WriteBool('Setup','ThreadRun',g_Config.boThreadRun);
  g_Config.boThreadRun:=Config.ReadBool('Setup','ThreadRun',g_Config.boThreadRun);

  if Config.ReadInteger('Setup','DeathColorEffect',-1) < 0 then
    Config.WriteInteger('Setup','DeathColorEffect',g_Config.ClientConf.btDieColor);
  g_Config.ClientConf.btDieColor:=Config.ReadInteger('Setup','DeathColorEffect',g_Config.ClientConf.btDieColor);

  if Config.ReadInteger('Setup','ParalyCanRun',-1) < 0 then
    Config.WriteBool('Setup','ParalyCanRun',g_Config.ClientConf.boParalyCanRun);
  g_Config.ClientConf.boParalyCanRun:=Config.ReadBool('Setup','ParalyCanRun',g_Config.ClientConf.boParalyCanRun);

  if Config.ReadInteger('Setup','ParalyCanWalk',-1) < 0 then
    Config.WriteBool('Setup','ParalyCanWalk',g_Config.ClientConf.boParalyCanWalk);
  g_Config.ClientConf.boParalyCanWalk:=Config.ReadBool('Setup','ParalyCanWalk',g_Config.ClientConf.boParalyCanWalk);

  if Config.ReadInteger('Setup','ParalyCanHit',-1) < 0 then
    Config.WriteBool('Setup','ParalyCanHit',g_Config.ClientConf.boParalyCanHit);
  g_Config.ClientConf.boParalyCanHit:=Config.ReadBool('Setup','ParalyCanHit',g_Config.ClientConf.boParalyCanHit);

  if Config.ReadInteger('Setup','ParalyCanSpell',-1) < 0 then
    Config.WriteBool('Setup','ParalyCanSpell',g_Config.ClientConf.boParalyCanSpell);
  g_Config.ClientConf.boParalyCanSpell:=Config.ReadBool('Setup','ParalyCanSpell',g_Config.ClientConf.boParalyCanSpell);

  if Config.ReadInteger('Setup','ShowExceptionMsg',-1) < 0 then
    Config.WriteBool('Setup','ShowExceptionMsg',g_Config.boShowExceptionMsg);
  g_Config.boShowExceptionMsg:=Config.ReadBool('Setup','ShowExceptionMsg',g_Config.boShowExceptionMsg);

  if Config.ReadInteger('Setup','ShowPreFixMsg',-1) < 0 then
    Config.WriteBool('Setup','ShowPreFixMsg',g_Config.boShowPreFixMsg);
  g_Config.boShowPreFixMsg:=Config.ReadBool('Setup','ShowPreFixMsg',g_Config.boShowPreFixMsg);

  if Config.ReadInteger('Setup','LightFlowerStruckLevel',-1) < 0 then              //汾汲拳 饭骇
    Config.WriteInteger('Setup','LightFlowerStruckLevel',g_Config.nLightFlowerStruckLevel);
  g_Config.nLightFlowerStruckLevel:=Config.ReadInteger('Setup','LightFlowerStruckLevel',g_Config.nLightFlowerStruckLevel);

  if Config.ReadInteger('Setup','MagTurnUndeadLevel',-1) < 0 then
    Config.WriteInteger('Setup','MagTurnUndeadLevel',g_Config.nMagTurnUndeadLevel);
  g_Config.nMagTurnUndeadLevel:=Config.ReadInteger('Setup','MagTurnUndeadLevel',g_Config.nMagTurnUndeadLevel);

  nLoadInteger:=Config.ReadInteger('Setup','MagTammingLevel',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagTammingLevel',g_Config.nMagTammingLevel)
  else g_Config.nMagTammingLevel:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MagTammingTargetLevel',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagTammingTargetLevel',g_Config.nMagTammingTargetLevel)
  else g_Config.nMagTammingTargetLevel:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MagTammingTargetHPRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagTammingTargetHPRate',g_Config.nMagTammingHPRate)
  else g_Config.nMagTammingHPRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MagTammingCount',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagTammingCount',g_Config.nMagTammingCount)
  else g_Config.nMagTammingCount:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MabMabeHitRandRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MabMabeHitRandRate',g_Config.nMabMabeHitRandRate)
  else g_Config.nMabMabeHitRandRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MabMabeHitMinLvLimit',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MabMabeHitMinLvLimit',g_Config.nMabMabeHitMinLvLimit)
  else g_Config.nMabMabeHitMinLvLimit:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MabMabeHitSucessRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MabMabeHitSucessRate',g_Config.nMabMabeHitSucessRate)
  else g_Config.nMabMabeHitSucessRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MabMabeHitMabeTimeRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MabMabeHitMabeTimeRate',g_Config.nMabMabeHitMabeTimeRate)
  else g_Config.nMabMabeHitMabeTimeRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','MagicAttackRage',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagicAttackRage',g_Config.nMagicAttackRage)
  else g_Config.nMagicAttackRage:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','AmyOunsulPoint',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','AmyOunsulPoint',g_Config.nAmyOunsulPoint)
  else g_Config.nAmyOunsulPoint:=nLoadInteger;


  nLoadInteger:=Config.ReadInteger('Setup','DisableInSafeZoneFireCross',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','DisableInSafeZoneFireCross',g_Config.boDisableInSafeZoneFireCross)
  else g_Config.boDisableInSafeZoneFireCross:=nLoadInteger = 1;

  nLoadInteger:=Config.ReadInteger('Setup','GroupMbAttackPlayObject',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','GroupMbAttackPlayObject',g_Config.boGroupMbAttackPlayObject)
  else g_Config.boGroupMbAttackPlayObject:=nLoadInteger = 1;

  nLoadInteger:=Config.ReadInteger('Setup','PosionDecHealthTime',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','PosionDecHealthTime',g_Config.dwPosionDecHealthTime)
  else g_Config.dwPosionDecHealthTime:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','PosionDamagarmor',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','PosionDamagarmor',g_Config.nPosionDamagarmor)
  else g_Config.nPosionDamagarmor:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','LimitSwordLong',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','LimitSwordLong',g_Config.boLimitSwordLong)
  else g_Config.boLimitSwordLong:=not (nLoadInteger = 0);

  nLoadInteger:=Config.ReadInteger('Setup','SwordLongPowerRate',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','SwordLongPowerRate',g_Config.nSwordLongPowerRate)
  else g_Config.nSwordLongPowerRate:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','FireBoomRage',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','FireBoomRage',g_Config.nFireBoomRage)
  else g_Config.nFireBoomRage:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','SnowWindRange',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','SnowWindRange',g_Config.nSnowWindRange)
  else g_Config.nSnowWindRange:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','ConsigitemIdx',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','ConsigitemIdx',g_Config.ConsigitemIdx)
  else g_Config.ConsigitemIdx:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','GiftitemIdx',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GiftitemIdx',g_Config.GiftitemIdx)
  else g_Config.GiftitemIdx:=nLoadInteger;


  if Config.ReadInteger('Setup','ElecBlizzardRange',-1) < 0 then
    Config.WriteInteger('Setup','ElecBlizzardRange',g_Config.nElecBlizzardRange);
  g_Config.nElecBlizzardRange:=Config.ReadInteger('Setup','ElecBlizzardRange',g_Config.nElecBlizzardRange);

  if Config.ReadInteger('Setup','HumanLevelDiffer',-1) < 0 then
    Config.WriteInteger('Setup','HumanLevelDiffer',g_Config.nHumanLevelDiffer);
  g_Config.nHumanLevelDiffer:=Config.ReadInteger('Setup','HumanLevelDiffer',g_Config.nHumanLevelDiffer);

  if Config.ReadInteger('Setup','KillHumanWinLevel',-1) < 0 then
    Config.WriteBool('Setup','KillHumanWinLevel',g_Config.boKillHumanWinLevel);
  g_Config.boKillHumanWinLevel:=Config.ReadBool('Setup','KillHumanWinLevel',g_Config.boKillHumanWinLevel);

  if Config.ReadInteger('Setup','KilledLostLevel',-1) < 0 then
    Config.WriteBool('Setup','KilledLostLevel',g_Config.boKilledLostLevel);
  g_Config.boKilledLostLevel:=Config.ReadBool('Setup','KilledLostLevel',g_Config.boKilledLostLevel);

  if Config.ReadInteger('Setup','PKServer',-1) < 0 then       //懦单胶 葛靛
    Config.WriteBool('Setup','PKServer',g_Config.boPKServer);
  g_Config.boPKServer:=Config.ReadBool('Setup','PKServer',g_Config.boPKServer);



  if Config.ReadInteger('Setup','nFishSuccess',-1) < 0 then         //超矫 犬伏
    Config.WriteInteger('Setup','nFishSuccess',g_Config.nFishSuccess);
  g_Config.nFishSuccess:=Config.ReadInteger('Setup','nFishSuccess',g_Config.nFishSuccess);


  if Config.ReadInteger('Setup','KillHumanWinLevelPoint',-1) < 0 then
    Config.WriteInteger('Setup','KillHumanWinLevelPoint',g_Config.nKillHumanWinLevel);
  g_Config.nKillHumanWinLevel:=Config.ReadInteger('Setup','KillHumanWinLevelPoint',g_Config.nKillHumanWinLevel);



  if Config.ReadInteger('Setup','KilledLostLevelPoint',-1) < 0 then
    Config.WriteInteger('Setup','KilledLostLevelPoint',g_Config.nKilledLostLevel);
  g_Config.nKilledLostLevel:=Config.ReadInteger('Setup','KilledLostLevelPoint',g_Config.nKilledLostLevel);

  if Config.ReadInteger('Setup','KillHumanWinExp',-1) < 0 then
    Config.WriteBool('Setup','KillHumanWinExp',g_Config.boKillHumanWinExp);
  g_Config.boKillHumanWinExp:=Config.ReadBool('Setup','KillHumanWinExp',g_Config.boKillHumanWinExp);

  if Config.ReadInteger('Setup','KilledLostExp',-1) < 0 then
    Config.WriteBool('Setup','KilledLostExp',g_Config.boKilledLostExp);
  g_Config.boKilledLostExp:=Config.ReadBool('Setup','KilledLostExp',g_Config.boKilledLostExp);

  if Config.ReadInteger('Setup','KillHumanWinExpPoint',-1) < 0 then
    Config.WriteInteger('Setup','KillHumanWinExpPoint',g_Config.nKillHumanWinExp);
  g_Config.nKillHumanWinExp:=Config.ReadInteger('Setup','KillHumanWinExpPoint',g_Config.nKillHumanWinExp);

  if Config.ReadInteger('Setup','KillHumanLostExpPoint',-1) < 0 then
    Config.WriteInteger('Setup','KillHumanLostExpPoint',g_Config.nKillHumanLostExp);
  g_Config.nKillHumanLostExp:=Config.ReadInteger('Setup','KillHumanLostExpPoint',g_Config.nKillHumanLostExp);

  if Config.ReadInteger('Setup','MonsterPowerRate',-1) < 0 then
    Config.WriteInteger('Setup','MonsterPowerRate',g_Config.nMonsterPowerRate);
  g_Config.nMonsterPowerRate:=Config.ReadInteger('Setup','MonsterPowerRate',g_Config.nMonsterPowerRate);

  if Config.ReadInteger('Setup','ItemsPowerRate',-1) < 0 then
    Config.WriteInteger('Setup','ItemsPowerRate',g_Config.nItemsPowerRate);
  g_Config.nItemsPowerRate:=Config.ReadInteger('Setup','ItemsPowerRate',g_Config.nItemsPowerRate);

  if Config.ReadInteger('Setup','ItemsACPowerRate',-1) < 0 then
    Config.WriteInteger('Setup','ItemsACPowerRate',g_Config.nItemsACPowerRate);
  g_Config.nItemsACPowerRate:=Config.ReadInteger('Setup','ItemsACPowerRate',g_Config.nItemsACPowerRate);

  if Config.ReadInteger('Setup','SendOnlineCount',-1) < 0 then
    Config.WriteBool('Setup','SendOnlineCount',g_Config.boSendOnlineCount);
  g_Config.boSendOnlineCount:=Config.ReadBool('Setup','SendOnlineCount',g_Config.boSendOnlineCount);

  if Config.ReadInteger('Setup','SendOnlineCountRate',-1) < 0 then
    Config.WriteInteger('Setup','SendOnlineCountRate',g_Config.nSendOnlineCountRate);
  g_Config.nSendOnlineCountRate:=Config.ReadInteger('Setup','SendOnlineCountRate',g_Config.nSendOnlineCountRate);

  if Config.ReadInteger('Setup','SendOnlineTime',-1) < 0 then
    Config.WriteInteger('Setup','SendOnlineTime',g_Config.dwSendOnlineTime);
  g_Config.dwSendOnlineTime:=Config.ReadInteger('Setup','SendOnlineTime',g_Config.dwSendOnlineTime);


  if Config.ReadInteger('Setup','SaveHumanRcdTime',-1) < 0 then
    Config.WriteInteger('Setup','SaveHumanRcdTime',g_Config.dwSaveHumanRcdTime);
  g_Config.dwSaveHumanRcdTime:=Config.ReadInteger('Setup','SaveHumanRcdTime',g_Config.dwSaveHumanRcdTime);

  if Config.ReadInteger('Setup','HumanFreeDelayTime',-1) < 0 then
    Config.WriteInteger('Setup','HumanFreeDelayTime',g_Config.dwHumanFreeDelayTime);
  //g_Config.dwHumanFreeDelayTime:=Config.ReadInteger('Setup','HumanFreeDelayTime',g_Config.dwHumanFreeDelayTime);

  if Config.ReadInteger('Setup','MakeGhostTime',-1) < 0 then
    Config.WriteInteger('Setup','MakeGhostTime',g_Config.dwMakeGhostTime);
  g_Config.dwMakeGhostTime:=Config.ReadInteger('Setup','MakeGhostTime',g_Config.dwMakeGhostTime);

  if Config.ReadInteger('Setup','ClearDropOnFloorItemTime',-1) < 0 then
    Config.WriteInteger('Setup','ClearDropOnFloorItemTime',g_Config.dwClearDropOnFloorItemTime);
  g_Config.dwClearDropOnFloorItemTime:=Config.ReadInteger('Setup','ClearDropOnFloorItemTime',g_Config.dwClearDropOnFloorItemTime);

  if Config.ReadInteger('Setup','FloorItemCanPickUpTime',-1) < 0 then
    Config.WriteInteger('Setup','FloorItemCanPickUpTime',g_Config.dwFloorItemCanPickUpTime);
  g_Config.dwFloorItemCanPickUpTime:=Config.ReadInteger('Setup','FloorItemCanPickUpTime',g_Config.dwFloorItemCanPickUpTime);

  if Config.ReadInteger('Setup', 'EatTick', -1) < 0 then
    Config.WriteInteger('Setup', 'EatTick', g_Config.dwEatTick);
  g_Config.dwEatTick := Config.ReadInteger('Setup', 'EatTick', g_Config.dwEatTick);
  
  if Config.ReadInteger('Setup','PasswordLockSystem',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockSystem',g_Config.boPasswordLockSystem);
  g_Config.boPasswordLockSystem:=Config.ReadBool('Setup','PasswordLockSystem',g_Config.boPasswordLockSystem);

  if Config.ReadInteger('Setup','PasswordLockDealAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockDealAction',g_Config.boLockDealAction);
  g_Config.boLockDealAction:=Config.ReadBool('Setup','PasswordLockDealAction',g_Config.boLockDealAction);

  if Config.ReadInteger('Setup','PasswordLockDropAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockDropAction',g_Config.boLockDropAction);
  g_Config.boLockDropAction:=Config.ReadBool('Setup','PasswordLockDropAction',g_Config.boLockDropAction);

  if Config.ReadInteger('Setup','PasswordLockGetBackItemAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockGetBackItemAction',g_Config.boLockGetBackItemAction);
  g_Config.boLockGetBackItemAction:=Config.ReadBool('Setup','PasswordLockGetBackItemAction',g_Config.boLockGetBackItemAction);

  if Config.ReadInteger('Setup','PasswordLockHumanLogin',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockHumanLogin',g_Config.boLockHumanLogin);
  g_Config.boLockHumanLogin:=Config.ReadBool('Setup','PasswordLockHumanLogin',g_Config.boLockHumanLogin);

  if Config.ReadInteger('Setup','PasswordLockWalkAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockWalkAction',g_Config.boLockWalkAction);
  g_Config.boLockWalkAction:=Config.ReadBool('Setup','PasswordLockWalkAction',g_Config.boLockWalkAction);

  if Config.ReadInteger('Setup','PasswordLockRunAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockRunAction',g_Config.boLockRunAction);
  g_Config.boLockRunAction:=Config.ReadBool('Setup','PasswordLockRunAction',g_Config.boLockRunAction);

  if Config.ReadInteger('Setup','PasswordLockHitAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockHitAction',g_Config.boLockHitAction);
  g_Config.boLockHitAction:=Config.ReadBool('Setup','PasswordLockHitAction',g_Config.boLockHitAction);

  if Config.ReadInteger('Setup','PasswordLockSpellAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockSpellAction',g_Config.boLockSpellAction);
  g_Config.boLockSpellAction:=Config.ReadBool('Setup','PasswordLockSpellAction',g_Config.boLockSpellAction);

  if Config.ReadInteger('Setup','PasswordLockSendMsgAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockSendMsgAction',g_Config.boLockSendMsgAction);
  g_Config.boLockSendMsgAction:=Config.ReadBool('Setup','PasswordLockSendMsgAction',g_Config.boLockSendMsgAction);

  if Config.ReadInteger('Setup','PasswordLockUserItemAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockUserItemAction',g_Config.boLockUserItemAction);
  g_Config.boLockUserItemAction:=Config.ReadBool('Setup','PasswordLockUserItemAction',g_Config.boLockUserItemAction);

  if Config.ReadInteger('Setup','PasswordLockInObModeAction',-1) < 0 then
    Config.WriteBool('Setup','PasswordLockInObModeAction',g_Config.boLockInObModeAction);
  g_Config.boLockInObModeAction:=Config.ReadBool('Setup','PasswordLockInObModeAction',g_Config.boLockInObModeAction);

  if Config.ReadInteger('Setup','PasswordErrorKick',-1) < 0 then
    Config.WriteBool('Setup','PasswordErrorKick',g_Config.boPasswordErrorKick);
  g_Config.boPasswordErrorKick:=Config.ReadBool('Setup','PasswordErrorKick',g_Config.boPasswordErrorKick);

  if Config.ReadInteger('Setup','PasswordErrorCountLock',-1) < 0 then
    Config.WriteInteger('Setup','PasswordErrorCountLock',g_Config.nPasswordErrorCountLock);
  g_Config.nPasswordErrorCountLock:=Config.ReadInteger('Setup','PasswordErrorCountLock',g_Config.nPasswordErrorCountLock);

  if Config.ReadInteger('Setup','BonusPointHack',-1) < 0 then
    Config.WriteInteger('Setup','BonusPointHack',g_Config.nBonusPointHack);
  g_Config.nBonusPointHack:=Config.ReadInteger('Setup','BonusPointHack',g_Config.nBonusPointHack);

  if Config.ReadInteger('Setup','MobGenCount',-1) < 0 then                                   //包府磊矫胶袍 函版
    Config.WriteInteger('Setup','MobGenCount',g_Config.nMobGenCount);
  g_Config.nMobGenCount:=Config.ReadInteger('Setup','MobGenCount',g_Config.nMobGenCount);


  if Config.ReadInteger('Setup','SoftVersionDate',-1) < 0 then
    Config.WriteInteger('Setup','SoftVersionDate',g_Config.nSoftVersionDate);
  g_Config.nSoftVersionDate:=Config.ReadInteger('Setup','SoftVersionDate',g_Config.nSoftVersionDate);

  nLoadInteger:=Config.ReadInteger('Setup','CanOldClientLogon',-1);
  if nLoadInteger < 0 then
    Config.WriteBool('Setup','CanOldClientLogon',g_Config.boCanOldClientLogon)
  else g_Config.boCanOldClientLogon:=nLoadInteger = 1;

  if Config.ReadInteger('Setup','ConsoleShowUserCountTime',-1) < 0 then
    Config.WriteInteger('Setup','ConsoleShowUserCountTime',g_Config.dwConsoleShowUserCountTime);
  g_Config.dwConsoleShowUserCountTime:=Config.ReadInteger('Setup','ConsoleShowUserCountTime',g_Config.dwConsoleShowUserCountTime);

  if Config.ReadInteger('Setup','ShowLineNoticeTime',-1) < 0 then
    Config.WriteInteger('Setup','ShowLineNoticeTime',g_Config.dwShowLineNoticeTime);
  g_Config.dwShowLineNoticeTime:=Config.ReadInteger('Setup','ShowLineNoticeTime',g_Config.dwShowLineNoticeTime);

  if Config.ReadInteger('Setup','LineNoticeColor',-1) < 0 then
    Config.WriteInteger('Setup','LineNoticeColor',g_Config.nLineNoticeColor);
  g_Config.nLineNoticeColor:=Config.ReadInteger('Setup','LineNoticeColor',g_Config.nLineNoticeColor);

  if Config.ReadInteger('Setup','ItemSpeedTime',-1) < 0 then
    Config.WriteInteger('Setup','ItemSpeedTime',g_Config.ClientConf.btItemSpeed);
  g_Config.ClientConf.btItemSpeed:=Config.ReadInteger('Setup','ItemSpeedTime',g_Config.ClientConf.btItemSpeed);

  if Config.ReadInteger('Setup','MaxHitMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxHitMsgCount',g_Config.nMaxHitMsgCount);
  g_Config.nMaxHitMsgCount:=Config.ReadInteger('Setup','MaxHitMsgCount',g_Config.nMaxHitMsgCount);

  if Config.ReadInteger('Setup','MaxSpellMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxSpellMsgCount',g_Config.nMaxSpellMsgCount);
  g_Config.nMaxSpellMsgCount:=Config.ReadInteger('Setup','MaxSpellMsgCount',g_Config.nMaxSpellMsgCount);

  if Config.ReadInteger('Setup','MaxRunMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxRunMsgCount',g_Config.nMaxRunMsgCount);
  g_Config.nMaxRunMsgCount:=Config.ReadInteger('Setup','MaxRunMsgCount',g_Config.nMaxRunMsgCount);

  if Config.ReadInteger('Setup','MaxWalkMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxWalkMsgCount',g_Config.nMaxWalkMsgCount);
  g_Config.nMaxWalkMsgCount:=Config.ReadInteger('Setup','MaxWalkMsgCount',g_Config.nMaxWalkMsgCount);

  if Config.ReadInteger('Setup','MaxTurnMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxTurnMsgCount',g_Config.nMaxTurnMsgCount);
  g_Config.nMaxTurnMsgCount:=Config.ReadInteger('Setup','MaxTurnMsgCount',g_Config.nMaxTurnMsgCount);

  if Config.ReadInteger('Setup','MaxDigUpMsgCount',-1) < 0 then
    Config.WriteInteger('Setup','MaxDigUpMsgCount',  g_Config.nMaxDigUpMsgCount);
  g_Config.nMaxDigUpMsgCount:=Config.ReadInteger('Setup','MaxDigUpMsgCount',  g_Config.nMaxDigUpMsgCount);


  if Config.ReadInteger('Setup','SpellSendUpdateMsg',-1) < 0 then
    Config.WriteBool('Setup','SpellSendUpdateMsg',  g_Config.boSpellSendUpdateMsg);
  g_Config.boSpellSendUpdateMsg:=Config.ReadBool('Setup','SpellSendUpdateMsg',  g_Config.boSpellSendUpdateMsg);

  if Config.ReadInteger('Setup','ActionSendActionMsg',-1) < 0 then
    Config.WriteBool('Setup','ActionSendActionMsg',  g_Config.boActionSendActionMsg);
  g_Config.boActionSendActionMsg:=Config.ReadBool('Setup','ActionSendActionMsg',  g_Config.boActionSendActionMsg);
  

  if Config.ReadInteger('Setup','OverSpeedKickCount',-1) < 0 then
    Config.WriteInteger('Setup','OverSpeedKickCount',  g_Config.nOverSpeedKickCount);
  g_Config.nOverSpeedKickCount:=Config.ReadInteger('Setup','OverSpeedKickCount',  g_Config.nOverSpeedKickCount);

  if Config.ReadInteger('Setup','DropOverSpeed',-1) < 0 then
    Config.WriteInteger('Setup','DropOverSpeed',  g_Config.dwDropOverSpeed);
  g_Config.dwDropOverSpeed:=Config.ReadInteger('Setup','DropOverSpeed',  g_Config.dwDropOverSpeed);

  if Config.ReadInteger('Setup','KickOverSpeed',-1) < 0 then
    Config.WriteBool('Setup','KickOverSpeed',  g_Config.boKickOverSpeed);
  g_Config.boKickOverSpeed:=Config.ReadBool('Setup','KickOverSpeed',  g_Config.boKickOverSpeed);

  nLoadInteger:=Config.ReadInteger('Setup','SpeedControlMode',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','SpeedControlMode',g_Config.btSpeedControlMode)
  else g_Config.btSpeedControlMode:=nLoadInteger;


  if Config.ReadInteger('Setup','RunIntervalTime',-1) < 0 then
    Config.WriteInteger('Setup','RunIntervalTime',  g_Config.dwRunIntervalTime);
  g_Config.dwRunIntervalTime:=Config.ReadInteger('Setup','RunIntervalTime',  g_Config.dwRunIntervalTime);

  if Config.ReadInteger('Setup','WalkIntervalTime',-1) < 0 then
    Config.WriteInteger('Setup','WalkIntervalTime',  g_Config.dwWalkIntervalTime);
  g_Config.dwWalkIntervalTime:=Config.ReadInteger('Setup','WalkIntervalTime',  g_Config.dwWalkIntervalTime);

  if Config.ReadInteger('Setup','TurnIntervalTime',-1) < 0 then
    Config.WriteInteger('Setup','TurnIntervalTime',  g_Config.dwTurnIntervalTime);
  g_Config.dwTurnIntervalTime:=Config.ReadInteger('Setup','TurnIntervalTime',  g_Config.dwTurnIntervalTime);

  
  if Config.ReadInteger('Setup','DisableStruck',-1) < 0 then
    Config.WriteBool('Setup','DisableStruck',  g_Config.boDisableStruck);
  g_Config.boDisableStruck:=Config.ReadBool('Setup','DisableStruck',  g_Config.boDisableStruck);

  if Config.ReadInteger('Setup','DisableSelfStruck',-1) < 0 then
    Config.WriteBool('Setup','DisableSelfStruck',  g_Config.boDisableSelfStruck);
  g_Config.boDisableSelfStruck:=Config.ReadBool('Setup','DisableSelfStruck',  g_Config.boDisableSelfStruck);

  if Config.ReadInteger('Setup','StruckTime',-1) < 0 then
    Config.WriteInteger('Setup','StruckTime',  g_Config.dwStruckTime);
  g_Config.dwStruckTime:=Config.ReadInteger('Setup','StruckTime',  g_Config.dwStruckTime);

  nLoadInteger:=Config.ReadInteger('Setup','AddUserItemNewValue',-1);
  if nLoadInteger < 0 then begin
    Config.WriteBool('Setup','AddUserItemNewValue',g_Config.boAddUserItemNewValue);
  end else begin
    g_Config.boAddUserItemNewValue:=nLoadInteger = 1;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','TestSpeedMode',-1);
  if nLoadInteger < 0 then begin
    Config.WriteBool('Setup','TestSpeedMode',g_Config.boTestSpeedMode);
  end else begin
    g_Config.boTestSpeedMode:=nLoadInteger = 1;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeUnLuckRate',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeUnLuckRate',g_Config.nWeaponMakeUnLuckRate);
  end else begin
    g_Config.nWeaponMakeUnLuckRate:=nLoadInteger;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeLuckPoint1',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeLuckPoint1',g_Config.nWeaponMakeLuckPoint1);
  end else begin
    g_Config.nWeaponMakeLuckPoint1:=nLoadInteger;
  end;
  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeLuckPoint2',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeLuckPoint2',g_Config.nWeaponMakeLuckPoint2);
  end else begin
    g_Config.nWeaponMakeLuckPoint2:=nLoadInteger;
  end;
  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeLuckPoint3',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeLuckPoint3',g_Config.nWeaponMakeLuckPoint3);
  end else begin
    g_Config.nWeaponMakeLuckPoint3:=nLoadInteger;
  end;
  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeLuckPoint2Rate',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeLuckPoint2Rate',g_Config.nWeaponMakeLuckPoint2Rate);
  end else begin
    g_Config.nWeaponMakeLuckPoint2Rate:=nLoadInteger;
  end;
  nLoadInteger:=Config.ReadInteger('Setup','WeaponMakeLuckPoint3Rate',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','WeaponMakeLuckPoint3Rate',g_Config.nWeaponMakeLuckPoint3Rate);
  end else begin
    g_Config.nWeaponMakeLuckPoint3Rate:=nLoadInteger;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','CheckUserItemPlace',-1);
  if nLoadInteger < 0 then begin
    Config.WriteBool('Setup','CheckUserItemPlace',g_Config.boCheckUserItemPlace);
  end else begin
    g_Config.boCheckUserItemPlace:=nLoadInteger = 1;
  end;

  if Config.ReadInteger('Setup','SafeAreaHint',-1) < 0 then
    Config.WriteInteger('Setup','SafeAreaHint',  g_Config.SafeAreaHint);
  g_Config.SafeAreaHint:=Config.ReadInteger('Setup','SafeAreaHint',  g_Config.SafeAreaHint);

  nLoadInteger:=Config.ReadInteger('Setup','LevelValueOfTaosHP',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','LevelValueOfTaosHP',g_Config.nLevelValueOfTaosHP);
  end else begin
    g_Config.nLevelValueOfTaosHP:=nLoadInteger;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','LevelValueOfTaosHPRate',0);
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','LevelValueOfTaosHPRate',g_Config.nLevelValueOfTaosHPRate);
  end else begin
    g_Config.nLevelValueOfTaosHPRate:=nLoadFloat;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','LevelValueOfTaosMP',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','LevelValueOfTaosMP',g_Config.nLevelValueOfTaosMP);
  end else begin
    g_Config.nLevelValueOfTaosMP:=nLoadInteger;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','LevelValueOfWizardHP',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','LevelValueOfWizardHP',g_Config.nLevelValueOfWizardHP);
  end else begin
    g_Config.nLevelValueOfWizardHP:=nLoadInteger;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','LevelValueOfWizardHPRate',0);
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','LevelValueOfWizardHPRate',g_Config.nLevelValueOfWizardHPRate);
  end else begin
    g_Config.nLevelValueOfWizardHPRate:=nLoadFloat;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','LevelValueOfWarrHP',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','LevelValueOfWarrHP',g_Config.nLevelValueOfWarrHP);
  end else begin
    g_Config.nLevelValueOfWarrHP:=nLoadInteger;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','LevelValueOfWarrHPRate',0);
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','LevelValueOfWarrHPRate',g_Config.nLevelValueOfWarrHPRate);
  end else begin
    g_Config.nLevelValueOfWarrHPRate:=nLoadFloat;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','LevelValueOfAssassinHP',-1);     //磊按
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','LevelValueOfAssassinHP',g_Config.nLevelValueOfAssassinHP);
  end else begin
    g_Config.nLevelValueOfAssassinHP:=nLoadInteger;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','LevelValueOfAssassinHPRate',0);
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','LevelValueOfAssassinHPRate',g_Config.nLevelValueOfAssassinHPRate);
  end else begin
    g_Config.nLevelValueOfWarrHPRate:=nLoadFloat;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','ExpRate',0);    //版氰摹
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','ExpRate',g_Config.nExpRate);
  end else begin
    g_Config.nExpRate:=nLoadFloat;
  end;

  nLoadFloat:=Config.ReadFloat('Setup','ExChangeGameGoldRate',0);    //券傈 厚啦
  if nLoadFloat = 0 then begin
    Config.WriteFloat('Setup','ExChangeGameGoldRate',g_Config.nExChangeGameGoldRate);
  end else begin
    g_Config.nExChangeGameGoldRate:=nLoadFloat;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','ExChangeGoldRate',0);    //券傈 厚啦
  if nLoadFloat = 0 then begin
    Config.WriteInteger('Setup','ExChangeGoldRate',g_Config.nExChangeGoldRate);
  end else begin
    g_Config.nExChangeGoldRate:=nLoadInteger;
  end;

  

  if Config.ReadInteger('Setup', 'SafeCanStore', -1) < 0 then                   //救傈 俺牢惑痢
    Config.WriteBool('Setup', 'SafeCanStore', g_Config.boSafeCanStore);
  g_Config.boSafeCanStore := Config.ReadBool('Setup', 'SafeCanStore', g_Config.boSafeCanStore);

  if Config.ReadInteger('Setup', 'OpenStoreGMMode', -1) < 0 then
    Config.WriteBool('Setup', 'OpenStoreGMMode', g_Config.boOpenStoreGMMode);       //俺牢惑痢吝 傍拜 寸窍唱 汲沥
  g_Config.boOpenStoreGMMode := Config.ReadBool('Setup', 'OpenStoreGMMode', g_Config.boOpenStoreGMMode);

  if Config.ReadInteger('Setup', 'OpenStoreCheckLevel', -1) < 0 then
    Config.WriteBool('Setup', 'OpenStoreCheckLevel', g_Config.boOpenStoreCheckLevel);        //俺牢惑痢 饭骇 力茄 荤侩
  g_Config.boOpenStoreCheckLevel := Config.ReadBool('Setup', 'OpenStoreCheckLevel',
    g_Config.boOpenStoreCheckLevel);

  nLoadInteger := Config.ReadInteger('Setup', 'OpenStoreNeedCheckLevel', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup', 'OpenStoreNeedCheckLevel', g_Config.nOpenStoreCheckLevel)     //俺牢惑痢 饭骇 力茄
  else g_Config.nOpenStoreCheckLevel := nLoadInteger;


  nLoadInteger := Config.ReadInteger('Setup', 'AllowGameGoldLevel', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup', 'AllowGameGoldLevel', g_Config.nAllowGameGoldLevel)     //券面傈 力茄 饭骇
  else g_Config.nAllowGameGoldLevel := nLoadInteger;

  nLoadInteger := Config.ReadInteger('Setup', 'AllowPCPointLevel', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup', 'AllowPCPointLevel', g_Config.nAllowPCPointLevel)     //PC器牢飘 力茄 饭骇
  else g_Config.nAllowPCPointLevel := nLoadInteger;



  nLoadInteger:=Config.ReadInteger('Setup','ProcessMonsterInterval',-1);
  if nLoadInteger < 0 then begin
    Config.WriteInteger('Setup','ProcessMonsterInterval',g_Config.nProcessMonsterInterval);
  end else begin
    g_Config.nProcessMonsterInterval:=nLoadInteger;
  end;

  //酒捞袍钦己===============================================
  FillChar(g_Config.vCompoundSet, SizeOf(TCompoundSet), #0);

  g_Config.vCompoundSet.Color[1] := 168;
  g_Config.vCompoundSet.Color[2] := 70;
  g_Config.vCompoundSet.Color[3] := 223;
  g_Config.vCompoundSet.Color[4] := 253;
  g_Config.vCompoundSet.ValueLimit := 10;

  nLoadInteger := Config.ReadInteger('CompoundSet', 'ValueLimit', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('CompoundSet', 'ValueLimit', g_Config.vCompoundSet.ValueLimit)
  else
    g_Config.vCompoundSet.ValueLimit := nLoadInteger;

  for i := Low(g_Config.vCompoundSet.Color) to High(g_Config.vCompoundSet.Color) do
  begin
    nLoadInteger := Config.ReadInteger('CompoundSet', 'Color' + IntToStr(i), -1);
    if nLoadInteger < 0 then
      Config.WriteInteger('CompoundSet', 'Color' + IntToStr(i), g_Config.vCompoundSet.Color[i])
    else
      g_Config.vCompoundSet.Color[i] := nLoadInteger;
  end;  

  for i := Low(g_Config.vCompoundSet.Gold) to High(g_Config.vCompoundSet.Gold) do
  begin
    nLoadInteger := Config.ReadInteger('CompoundSet', 'Gold' + IntToStr(i), -1);
    if nLoadInteger < 0 then
      Config.WriteInteger('CompoundSet', 'Gold' + IntToStr(i), g_Config.vCompoundSet.Gold[i])
    else
      g_Config.vCompoundSet.Gold[i] := nLoadInteger;
  end;  

  for i := Low(g_Config.vCompoundSet.GameGold) to High(g_Config.vCompoundSet.GameGold) do
  begin
    nLoadInteger := Config.ReadInteger('CompoundSet', 'GameGold' + IntToStr(i), -1);
    if nLoadInteger < 0 then
      Config.WriteInteger('CompoundSet', 'GameGold' + IntToStr(i), g_Config.vCompoundSet.GameGold[i])
    else
      g_Config.vCompoundSet.GameGold[i] := nLoadInteger;
  end;  

  for i := Low(g_Config.vCompoundSet.DropRate) to High(g_Config.vCompoundSet.DropRate) do
  begin
    nLoadInteger := Config.ReadInteger('CompoundSet', 'DropRate' + IntToStr(i), -1);
    if nLoadInteger < 0 then
      Config.WriteInteger('CompoundSet', 'DropRate' + IntToStr(i), g_Config.vCompoundSet.DropRate[i])
    else
      g_Config.vCompoundSet.DropRate[i] := nLoadInteger;
  end;
  //酒捞袍钦己===============================================

  
  for I := Low(g_Config.nStartCastlewarDay) to High(g_Config.nStartCastlewarDay) do begin
    if Config.ReadInteger('Setup','StartCastlewarDay' + IntToStr(I),-1) < 0 then
      Config.WriteInteger('Setup','StartCastlewarDay' + IntToStr(I),g_Config.nStartCastlewarDay[I]);
    g_Config.nStartCastlewarDay[I]:=Config.ReadInteger('Setup','StartCastlewarDay' + IntToStr(I),g_Config.nStartCastlewarDay[I]);
  end;

  if Config.ReadInteger('Setup','StartCastlewarTime',-1) < 0 then
    Config.WriteInteger('Setup','StartCastlewarTime',  g_Config.nStartCastlewarTime);
  g_Config.nStartCastlewarTime:=Config.ReadInteger('Setup','StartCastlewarTime',  g_Config.nStartCastlewarTime);

  if Config.ReadInteger('Setup','StartCastlewarMin',-1) < 0 then
    Config.WriteInteger('Setup','StartCastlewarMin',  g_Config.nStartCastlewarMin);
  g_Config.nStartCastlewarMin:=Config.ReadInteger('Setup','StartCastlewarMin',  g_Config.nStartCastlewarMin);

  if Config.ReadInteger('Setup','ShowCastleWarEndMsgTime',-1) < 0 then
    Config.WriteInteger('Setup','ShowCastleWarEndMsgTime',  g_Config.dwShowCastleWarEndMsgTime);
  g_Config.dwShowCastleWarEndMsgTime:=Config.ReadInteger('Setup','ShowCastleWarEndMsgTime',  g_Config.dwShowCastleWarEndMsgTime);

  if Config.ReadInteger('Setup','CastleFlagRegenTime',-1) < 0 then
    Config.WriteInteger('Setup','CastleFlagRegenTime',  g_Config.dwCastleFlagRegenTime);
  g_Config.dwCastleFlagRegenTime:=Config.ReadInteger('Setup','CastleFlagRegenTime',  g_Config.dwCastleFlagRegenTime);

  if Config.ReadInteger('Setup','CastleWarTime',-1) < 0 then
    Config.WriteInteger('Setup','CastleWarTime',  g_Config.dwCastleWarTime);
  g_Config.dwCastleWarTime:=Config.ReadInteger('Setup','CastleWarTime',  g_Config.dwCastleWarTime);

  if Config.ReadInteger('Setup', 'DropGoldToPlayBag', -1) < 0 then
    Config.WriteBool('Setup', 'DropGoldToPlayBag', g_Config.boDropGoldToPlayBag);
  g_Config.boDropGoldToPlayBag := Config.ReadBool('Setup', 'DropGoldToPlayBag', g_Config.boDropGoldToPlayBag);


  nLoadInteger:=Config.ReadInteger('Setup','GuildWarTime',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GuildWarTime',g_Config.dwGuildWarTime)
  else g_Config.dwGuildWarTime:=nLoadInteger;

  for I := Low(g_Config.GlobalVal) to High(g_Config.GlobalVal) do begin
    nLoadInteger:=Config.ReadInteger('Setup','GlobalVal' + IntToStr(I),-1);
    if nLoadInteger < 0 then
      Config.WriteInteger('Setup','GlobalVal' + IntToStr(I),g_Config.GlobalVal[I])
    else g_Config.GlobalVal[I]:=nLoadInteger;
  end;


  for I := Low(g_Config.nGroupExpRate) to High(g_Config.nGroupExpRate) do begin       //弊缝 版氰摹
    nLoadFloat:=Config.ReadFloat('Setup','GroupExpRate' + IntToStr(I),-1);
    if nLoadFloat < 0 then
      Config.WriteFloat('Setup','GroupExpRate' + IntToStr(I),g_Config.nGroupExpRate[I])
    else g_Config.nGroupExpRate[I]:=nLoadFloat;
  end;

  nLoadInteger:=Config.ReadInteger('Setup','GroupBuffHp',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GroupBuffHp',g_Config.nGroupBuffHp)
  else g_Config.nGroupBuffHp:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','GroupBuffRecHp',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GroupBuffRecHp',g_Config.nGroupBuffRecHp)
  else g_Config.nGroupBuffRecHp:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','GroupBuffExp',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GroupBuffExp',g_Config.nGroupBuffExp)
  else g_Config.nGroupBuffExp:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','GroupBuffPo',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','GroupBuffPo',g_Config.nGroupBuffPo)
  else g_Config.nGroupBuffPo:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryCount',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryCount',g_Config.nWinLotteryCount)
  else g_Config.nWinLotteryCount:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','NoWinLotteryCount',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','NoWinLotteryCount',g_Config.nNoWinLotteryCount)
  else g_Config.nNoWinLotteryCount:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel1',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel1',g_Config.nWinLotteryLevel1)
  else g_Config.nWinLotteryLevel1:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel2',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel2',g_Config.nWinLotteryLevel2)
  else g_Config.nWinLotteryLevel2:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel3',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel3',g_Config.nWinLotteryLevel3)
  else g_Config.nWinLotteryLevel3:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel4',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel4',g_Config.nWinLotteryLevel4)
  else g_Config.nWinLotteryLevel4:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel5',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel5',g_Config.nWinLotteryLevel5)
  else g_Config.nWinLotteryLevel5:=nLoadInteger;

  nLoadInteger:=Config.ReadInteger('Setup','WinLotteryLevel6',-1);
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','WinLotteryLevel6',g_Config.nWinLotteryLevel6)
  else g_Config.nWinLotteryLevel6:=nLoadInteger;


  nLoadInteger:=Config.ReadInteger('Setup','MagMassPoisonDelay',-1);  //刀公 掉饭捞
  if nLoadInteger < 0 then
    Config.WriteInteger('Setup','MagMassPoisonDelay',g_Config.nMagMassPoisonDelay)
  else g_Config.nMagMassPoisonDelay:=nLoadInteger;



 //==============================HeroSetup=============================================
  //咯扁辑何磐 康旷
  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroNameColor', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroNameColor', g_Config.btHeroNameColor)
  else g_Config.btHeroNameColor := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'RecallHeroTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'RecallHeroTime', g_Config.nRecallHeroTime)
  else g_Config.nRecallHeroTime := nLoadInteger;

  if Config.ReadString('HeroSetup', 'RecallHeroHint', '') = '' then
    Config.WriteString('HeroSetup', 'RecallHeroHint', g_Config.sRecallHeroHint);
  g_Config.sRecallHeroHint := Config.ReadString('HeroSetup', 'RecallHeroHint',  g_Config.sRecallHeroHint);

  for I := Low(g_Config.HeroBagItemCounts) to High(g_Config.HeroBagItemCounts) do begin
    nLoadInteger := Config.ReadInteger('HeroSetup', 'BagItemCount' + IntToStr(I), -1);
    if nLoadInteger < 0 then
      Config.WriteInteger('HeroSetup', 'BagItemCount' + IntToStr(I), g_Config.HeroBagItemCounts[I])
    else g_Config.HeroBagItemCounts[I] := nLoadInteger;
  end;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroStartLevel', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroStartLevel', g_Config.nHeroStartLevel)
  else g_Config.nHeroStartLevel := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroWarrorAttackTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroWarrorAttackTime', g_Config.dwHeroWarrorAttackTime)
  else g_Config.dwHeroWarrorAttackTime := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroWizardAttackTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroWizardAttackTime', g_Config.dwHeroWizardAttackTime)
  else g_Config.dwHeroWizardAttackTime := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroTaoistAttackTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroTaoistAttackTime', g_Config.dwHeroTaoistAttackTime)
  else g_Config.dwHeroTaoistAttackTime := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroAssassinAttackTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroAssassinAttackTime', g_Config.dwHeroAssassinAttackTime)
  else g_Config.dwHeroAssassinAttackTime := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroItemAttackTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroItemAttackTime', g_Config.dwHeroItemAttackTime)
  else g_Config.dwHeroItemAttackTime := nLoadInteger;


  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroWalkTime', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroWalkTime', g_Config.dwHeroWalkTime)
  else g_Config.dwHeroWalkTime := nLoadInteger;

  if Config.ReadInteger('HeroSetup', 'HeroKillByMonstDropUseItem', -1) < 0 then
    Config.WriteBool('HeroSetup', 'HeroKillByMonstDropUseItem', g_Config.boHeroKillByMonstDropUseItem);
  g_Config.boHeroKillByMonstDropUseItem := Config.ReadBool('HeroSetup', 'HeroKillByMonstDropUseItem', g_Config.boHeroKillByMonstDropUseItem);

  if Config.ReadInteger('HeroSetup', 'HeroKillByHumanDropUseItem', -1) < 0 then
    Config.WriteBool('HeroSetup', 'HeroKillByHumanDropUseItem', g_Config.boHeroKillByHumanDropUseItem);
  g_Config.boHeroKillByHumanDropUseItem := Config.ReadBool('HeroSetup', 'HeroKillByHumanDropUseItem', g_Config.boHeroKillByHumanDropUseItem);

  if Config.ReadInteger('HeroSetup', 'HeroDieScatterBag', -1) < 0 then
    Config.WriteBool('HeroSetup', 'HeroDieScatterBag', g_Config.boHeroDieScatterBag);
  g_Config.boHeroDieScatterBag := Config.ReadBool('HeroSetup', 'HeroDieScatterBag', g_Config.boHeroDieScatterBag);


  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroDieDropUseItemRate', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroDieDropUseItemRate', g_Config.nHeroDieDropUseItemRate)
  else g_Config.nHeroDieDropUseItemRate := nLoadInteger;

  nLoadInteger := Config.ReadInteger('HeroSetup', 'HeroDieScatterBagRate', -1);
  if nLoadInteger < 0 then
    Config.WriteInteger('HeroSetup', 'HeroDieScatterBagRate', g_Config.nHeroDieScatterBagRate)
  else g_Config.nHeroDieScatterBagRate := nLoadInteger;
end;
{$IFEND}

function GetRGB(c256:Byte):TColor;
begin
  Result:=RGB(ColorTable[c256].rgbRed,ColorTable[c256].rgbGreen,ColorTable[c256].rgbBlue);
end;
procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
var
  SendData:TCopyDataStruct;
  nParam:Integer;
begin
  nParam:=MakeLong(Word(tM2Server),wIdent);
  SendData.cbData:=Length (sSendMsg) + 1;
  GetMem(SendData.lpData,SendData.cbData);
  StrCopy (SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle,WM_COPYDATA,nParam,Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;
function  GetIPLocal(sIPaddr:String):String;
//var
//  sLocal:array[0..254] of Char;
begin
 { if (nIPLocal >= 0) and Assigned(PlugProcArray[nIPLocal].nProcAddr) then begin
    TIPLocal(PlugProcArray[nIPLocal].nProcAddr)(PChar(sIPaddr),sLocal,SizeOf(sLocal));
    Result:=sLocal;
    exit;
  end;  }
  Result:='无法找到。';
end;
procedure LoadKernelFunction();
var
  DllModule: THandle;
begin
  DllModule := LoadLibrary('kernel32.dll');
  IsDebuggerPresent := GetProcAddress(DllModule, PChar(DecodeString('NSI@UREqUrYaXa=nUSIaWcL')));    //'IsDebuggerPresent'
end;

//是否记录物品日志
//返回 FALSE 为记录
//返回 TRUE  为不记录
function IsCheapStuff(StdMode:Byte):Boolean; //004B2FA8
begin
  if (StdMode < 3) or (StdMode = 8) then Result:=True
  else Result:=False;
end;
//sIPaddr 为当前IP
//dIPaddr 为要比较的IP
//* 号为通配符
function CompareIPaddr(sIPaddr,dIPaddr:String):Boolean;
var
  nPos:Integer;
begin
  Result:=False;
  if (sIPaddr = '') or (dIPaddr = '') then exit;

  if (dIPaddr[1] = '*') then begin
    Result:=True;
    exit;
  end;

  nPos:=Pos('*',dIPaddr);
  if nPos > 0 then begin
    Result:=CompareLStr(sIPaddr,dIPaddr,nPos -1);
  end else begin
    Result:=CompareText(sIPaddr,dIPaddr) = 0;
  end;
end;



function GetCompoundInfo(const sItemName: string; nLevel: Integer): pTCompoundInfo;        //酒捞袍钦己
var
  nIndex: Integer;
begin
  Result := nil;
  if (nLevel < Low(TCompoundInfos)) or (nLevel > High(TCompoundInfos)) then
    exit;
  nIndex := g_CompoundInfoList.IndexOf(sItemName);
  if nIndex < 0 then
    exit;
  Result := @pTCompoundInfos(g_CompoundInfoList.Objects[nIndex])[nLevel];
end;

function GetCompoundInfos(const sItemName: string): pTCompoundInfos;          //酒捞袍钦己
var
  nIndex: Integer;
begin
  Result := nil;
  nIndex := g_CompoundInfoList.IndexOf(sItemName);
  if nIndex < 0 then
    exit;
  Result := pTCompoundInfos(g_CompoundInfoList.Objects[nIndex]);
end;

procedure SaveCompoundInfos;               //酒捞袍钦己
var
  i, j, k: Integer;
  sItemName, sText: string;
  pCompoundInfos: pTCompoundInfos;
  SaveInfo: TStringList;
begin
  SaveInfo := TStringList.Create;
  try
    SaveInfo.Clear;
    for i := 0 to g_CompoundInfoList.Count - 1 do begin
      pCompoundInfos := pTCompoundInfos(g_CompoundInfoList.Objects[i]);
      sItemName := g_CompoundInfoList.Strings[i];
      if (pCompoundInfos = nil) then
        Continue;
      for j := Low(TCompoundInfos) to High(TCompoundInfos) do
      begin
        if pCompoundInfos[j].Value = 0 then
          Continue;
        sText := sItemName;
        sText := sText + #9 + IntToStr(j);
        sText := sText + #9 + IntToStr(pCompoundInfos[j].Value);
        for k := Low(pCompoundInfos[j].Value1) to High(pCompoundInfos[j].Value1) do
          sText := sText + #9 + IntToStr(LoWord(pCompoundInfos[j].Value1[k])) + '-' + IntToStr(HiWord(pCompoundInfos[j].Value1[k]));
        for k := Low(pCompoundInfos[j].Value2) to High(pCompoundInfos[j].Value2) do
          sText := sText + #9 + IntToStr(LoByte(pCompoundInfos[j].Value2[k])) + '-' + IntToStr(HiByte(pCompoundInfos[j].Value2[k]));
        for k := Low(pCompoundInfos[j].Rate) to High(pCompoundInfos[j].Rate) do
          sText := sText + #9 + IntToStr(pCompoundInfos[j].Rate[k]);
        SaveInfo.Add(sText);
      end;
    end;
  finally
    SaveInfo.SaveToFile(g_Config.sEnvirDir + 'CompoundInfo.txt');
    SaveInfo.Free;
  end;
end;

procedure UpgradeCompoundItem(AUserItem: pTUserItem; AUpgradeCom: pTCompoundInfo);     //酒捞袍钦己
  procedure SetRandomValue(var AResult: Byte; AValue: LongWord); overload;
  begin
    AResult := _MIN(AResult + Random(_MAX(HiWord(AValue) - LoWord(AValue) + 1, 0)) + LoWord(AValue), High(Byte));
  end;

  procedure SetRandomValue(var AResult: Byte; AValue: Word); overload;
  begin
    AResult := _MIN(AResult + Random(_MAX(HiByte(AValue) - LoByte(AValue) + 1, 0)) + LoByte(AValue), High(Byte));
  end;
var
  i: Integer;
  StdItem: TItem;
begin
  AUserItem.Amount := AUserItem.Amount + 1;
  StdItem := UserEngine.GetStdItem(AUserItem.wIndex);
  for i := Low(AUpgradeCom.Rate) to High(AUpgradeCom.Rate) - 1 do
  begin
    if (Random(100) >= AUpgradeCom.Rate[i]) then
      Continue;
    case i of
      0:
        SetRandomValue(AUserItem.btValue[3], AUpgradeCom.Value1[0]);
      1:
        SetRandomValue(AUserItem.btValue[4], AUpgradeCom.Value1[1]);
      2:
        SetRandomValue(AUserItem.btValue[0], AUpgradeCom.Value1[2]);
      3:
        SetRandomValue(AUserItem.btValue[1], AUpgradeCom.Value1[3]);
      4:
        SetRandomValue(AUserItem.btValue[2], AUpgradeCom.Value1[4]);
     { 5:
        SetRandomValue(AUserItem.btValue[tb_HP], AUpgradeCom.Value1[5]);
      6:
        SetRandomValue(AUserItem.btValue[tb_MP], AUpgradeCom.Value1[6]);
      7:
        SetRandomValue(AUserItem.btValue[tb_Hit], AUpgradeCom.Value2[0]);
      8:
        SetRandomValue(AUserItem.btValue[tb_Speed], AUpgradeCom.Value2[1]);
      9:
        SetRandomValue(AUserItem.btValue[tb_Deadliness], AUpgradeCom.Value2[2]);
      10:
        SetRandomValue(AUserItem.btValue[tb_AddAttack], AUpgradeCom.Value2[3]);
      11:
        SetRandomValue(AUserItem.btValue[tb_DelDamage], AUpgradeCom.Value2[4]);
      12:
        SetRandomValue(AUserItem.btValue[tb_AntiMagic], AUpgradeCom.Value2[5]);      }
    end;
  end;
end;

{ TMsgStringList }

procedure TMsgStringList.LoadFromFile(const FileName: string);
  function CheckFileIsEN(): Boolean;
  var
    FileStream: TFileStream;
    nCheck: LongWord;
  begin
    Result := False;
    FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      if FileStream.Read(nCheck, SizeOf(LongWord)) = SizeOf(LongWord) then begin
        nCheck := nCheck xor $12345678;
        if nCheck = RUNGATECODE then
          Result := True;
      end;
    finally
      FileStream.Free;
    end;
  end;
var
  MapBuffer: PChar;
  MemoryStream: TMemoryStream;
  FileStream: TFileStream;
  FileHandle: THandle;
  nBufferSize: Integer;
  nFileID: Integer;
  nCheck, nCheck2, nCheck3: LongWord;
  OutLen, nENLen: Integer;
  ENBuffer, OutBuffer: PChar;
begin
 { if (not CheckFileIsEN()) then begin
    inherited;
    MemoryStream := TMemoryStream.Create;
    ENBuffer := Self.GetText;
    try
      if Length(string(ENBuffer)) > 10 then begin
        OutLen := ZIPCompress(ENBuffer, Length(string(ENBuffer)) + 1, 9, OutBuffer);
        if OutLen > (SizeOf(LongWord) * 2) then begin
          nCheck := RUNGATECODE xor $12345678;
          nCheck2 := PLongWord(OutBuffer)^ xor LongWord(OutLen);
          nCheck3 := PLongWord(@OutBuffer[SizeOf(LongWord)])^ xor LongWord(OutLen);
          MemoryStream.Write(nCheck, SizeOf(LongWord));
          MemoryStream.Write(nCheck2, SizeOf(LongWord));
          MemoryStream.Write(nCheck3, SizeOf(LongWord));
          MemoryStream.Write(OutBuffer[SizeOf(LongWord) * 2], OutLen - (SizeOf(LongWord) * 2));
          FreeMem(OutBuffer);
          MemoryStream.SaveToFile(FileName);
        end;
      end;
    finally
      StrDispose(ENBuffer);
      MemoryStream.Free;
    end;
  end
  else begin   }
    FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
    try
      if FileStream.Read(nCheck, SizeOf(LongWord)) = SizeOf(LongWord) then begin
        nCheck := nCheck xor $12345678;
        nENLen := FileStream.Size - SizeOf(LongWord);
        if nCheck = RUNGATECODE then begin
          GetMem(ENBuffer, nENLen);
          try
            if FileStream.Read(ENBuffer^, nENLen) = nENLen then begin
              PLongWord(ENBuffer)^ := PLongWord(ENBuffer)^ xor LongWord(nENLen);
              PLongWord(@ENBuffer[SizeOf(LongWord)])^ := PLongWord(@ENBuffer[SizeOf(LongWord)])^ xor LongWord(nENLen);
              OutLen := ZIPDecompress(ENBuffer, nENLen, 0, OutBuffer);
              if OutLen > 0 then begin
                SetText(OutBuffer);
                FreeMem(OutBuffer);
              end;
            end;
          finally
            FreeMem(ENBuffer, nENLen);
          end;
          Exit;
        end;
      end;
    finally
      FileStream.Free;
    end;
    inherited;
 // end;
end;


function MyFileExists(const FileName: string): Boolean;
begin
    Result := FileExists(FileName);
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
    raise EDecompressionError.Create('ZIP Error'); //!!
end;

function ZIPCompress(const InBuf: Pointer; InBytes: Integer; Level: TZIPLevel; out OutBuf: PChar): Integer;
var
  strm: TZStreamRec;
  P: Pointer;
begin
  SafeFillChar(strm, sizeof(strm), 0);
  strm.zalloc := zlibAllocMem;
  strm.zfree := zlibFreeMem;
  Result := ((InBytes + (InBytes div 10) + 12) + 255) and not 255;
  GetMem(OutBuf, Result);
  try
    strm.next_in := InBuf;
    strm.avail_in := InBytes;
    strm.next_out := OutBuf;
    strm.avail_out := Result;
    CCheck(deflateInit_(strm, Level, zlib_version, sizeof(strm)));
    try
      while CCheck(deflate(strm, Z_FINISH)) <> Z_STREAM_END do begin
        P := OutBuf;
        Inc(Result, 256);
        ReallocMem(OutBuf, Result);
        strm.next_out := PChar(Integer(OutBuf) + (Integer(strm.next_out) - Integer(P)));
        strm.avail_out := 256;
      end;
    finally
      CCheck(deflateEnd(strm));
    end;
    ReallocMem(OutBuf, strm.total_out);
    Result := strm.total_out;
  except
    FreeMem(OutBuf);
    OutBuf := nil;
    //raise
  end;
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
      while DCheck(inflate(strm, Z_FINISH)) <> Z_STREAM_END do begin
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

initialization
begin

  {---- Adjust global SVN revision ----}
  //SVNRevision('$Id: M2Share.pas 562 2007-01-19 16:33:33Z sean $');

  ExpConf     := TIniFile.Create(sExpConfigFileName);
  SqlConf     := TIniFile.Create(sSqlConfigFileName);
  Config      := TIniFile.Create(sConfigFileName);
  CommandConf := TIniFile.Create(sCommandFileName);
  StringConf  := TIniFile.Create(sStringFileName);
{$IF OEMVER = OEM775}
  Level775    := TIniFile.Create(sConfig775FileName);
{$IFEND}
  //CertCheck:=TList.Create;
  //EventCheck:=TList.Create;
  Move(ColorArray,ColorTable,SizeOf(ColorArray));
  LoadKernelFunction();
end;

finalization
begin
  ExpConf.Free;
  Config.Free;
  CommandConf.Free;
  StringConf.Free;
{$IF OEMVER = OEM775}
  Level775.Free;
{$IFEND}

  //CertCheck.Free;
  //EventCheck.Free;
end;

end.
