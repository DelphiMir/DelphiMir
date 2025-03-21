unit grobal2;

interface
uses
  {svn,} Windows, SysUtils, Classes, strUtils, JSocket;

const
  {$IFDEF Timeinc}{$I TimeStamp.inc}{$ELSE}BUILDTIME = 0;{$ENDIF}
  VERSION_NUMBER = 1009261;
  CLIENT_VERSION_NUMBER = 120100728;
  CM_POWERBLOCK = 0;

  SM_SETITEMS = 5356;
  SM_HINTDATA = 5357;

  SM_USERMARK = 5100;   //문파 마크
  RM_USERMARK = 30021; //문파 마크

  SM_USERMASK = 5101;   //변신탈 기퍼짐
  RM_USERMASK = 30022;  //변신탈 기퍼짐

  RM_KMSendMsg = 9888;
  SM_KMSendMsg = 9889;

  //=======영물 옵션=======
  CM_PETOPTION = 5163;
  CM_PETAUTO = 5164;
  CM_PETBANAUTO = 5165;
  CM_PETMOUSE = 5166;

  //=============변환=========
  SM_SHOWCHANGEITEM = 5062;

  SM_SHOWRANKNAME = 4162;

  CM_CHANGESYSTEM = 5063;
  SM_CHANGESYSTEMOK = 5064;
  SM_CHANGESYSTEM_FAIL = 5065;

   //낚시 서버에 템요청(낚는)
  CM_UPONFISH = 9040;
  CM_UPONFISH2 = 9039;
 // ========================
  //물약 관련
  SM_ADDITEM2 = 9912;
  CM_BUNDLEITEM   = 9913;
  CM_SEPARITEM = 9915;
  CM_BUNDLESTORAGEITEM = 9918;
  SM_ADDSTORAGEITEM = 9931;
  SM_TAKEOFF_OK2 = 9032;

  CM_SENDWAKEUP = 5069;
  SM_SENDWAKEUPITEM_FAIL = 5070;
  SM_SENDWAKEUPITEM_OK = 5071;
  CM_SENDWAKEUPITEM = 5072;
  RM_SENDWAKEUPITEM = 5079;
  SM_SENDWAKEUPITEM = 5080;

  CM_STORAGEPASSWORD = 1221;         //창고암호
  CM_CHECKSTORAGEPW = 1222;           //창고암호

  //상인
  RM_SENDGOODAPPR = 9909;
  SM_SENDGOODAPPR = 9910;

  //재련
  RM_OPWWAPONMG = 9916;
  SM_OPWWAPONMG = 9917;
  CM_GOTOITEMID = 9919;
  RM_CORWAPONMG = 9920;
  SM_CORWAPONMG = 9921;
  RM_CHECKWEAPON = 9922;
  SM_CHECKWEAPON = 9923;
  CM_USERCHWEAPONITEM = 9924;
  RM_USERCHECKWEAPON_FAIL = 9925;
  SM_USERCHECKWEAPON_FAIL = 9926;
  RM_USERCHECKWEAPON_OK = 9927;
  SM_USERCHECKWEAPON_OK = 9928;
  RM_USERCHECKWEAPON_UPFAIL = 9929;
  SM_USERCHECKWEAPON_UPFAIL = 9930;

  SM_SENDSNOW = 5113;     //눈오는이펙

  //====================개인상점===================
  SM_SENDSTORE = 5114;
  CM_STARTSTORE = 5115;
  CM_STOPSTORE = 5116;
  CM_QUERYSTORE = 5117;
  SM_DELSTOREITEM = 5118;
  SM_USERSENDSTOREMSG = 5119;
  SM_USERSTOREITEMS = 5120;
  CM_BUYSTOREITEM = 5121;
  SM_SENDBUYSTOREITEM_OK = 5122;
  SM_SENDBUYSTOREITEM_FAIL = 5123;
  SM_SENDSTARTSTORE_OK = 5124;
  SM_SENDSTOPSTORE_OK = 5125;
  SM_SENDSTARTSTORE_FAIL = 5126;
  RM_SENDSTORE = 5126;
  //===============================================

  //대여============================================
  CM_RENTALTRY            = 6000;     //대여
  CM_RENTALADDITEM        = 6001;     //대여
  CM_RENTALDELITEM        = 6002;     //대여
  CM_RENTALCANCEL         = 6003;     //대여
  CM_RENTALCHGGOLD        = 6004;     //대여
  CM_RENTALEND            = 6005;     //대여

  SM_RENTALMENU           = 6006;     //대여
  SM_RENTALTRY_FAIL       = 6007;     //대여
  SM_RENTALADDITEM_OK     = 6008;     //대여
  SM_RENTALADDITEM_FAIL   = 6009;     //대여
  SM_RENTALDELITEM_OK     = 6010;     //대여
  SM_RENTALDELITEM_FAIL   = 6011;     //대여
  SM_RENTALCANCEL         = 6012;     //대여
  SM_RENTALREMOTEADDITEM  = 6013;     //대여
  SM_RENTALREMOTEDELITEM  = 6014;     //대여
  SM_RENTALCHGGOLD_OK     = 6015;     //대여
  SM_RENTALCHGGOLD_FAIL   = 6016;     //대여
  SM_RENTALREMOTECHGGOLD  = 6017;     //대여
  SM_RENTALSUCCESS        = 6018;     //대여
  SM_RENTALCHGDAY_OK      = 6019;     //대여
  SM_RENTALREMOTECHGDAY   = 6020;     //대여
  SM_RENTALCHGDAY_FAIL    = 6021;     //대여

  CM_ENDRENTALITEM        = 8022;     //대여
  CM_GETRENTAL            = 8023;     //대여
  CM_GETRENTAL2           = 8024;     //대여
  CM_RRENTALITEM          = 8025;     //대여
  CM_RENTALITEM           = 10317;    //대여
  SM_RENTALITEMS          = 2014;     //대여
  SM_RENTALITEMS2         = 2015;     //대여
  SM_RENTALGIVE           = 6504;     //대여
  SM_GETRENTALITEMS_FAIL  = 7025;     //대여
  SM_GETRENTALITEMS_FAIL2 = 7026;     //대여
  RM_RENTALGIVE           = 11136;    //대여
  //================================================
  //영물============================================
  CM_GETPETINFO           = 8026;     //영물 정보 불러오기 클라 > 서버
  SM_GETPETINFO           = 2016;     //영물 정보 넘기기 서버 > 클라
  SM_GETPETINFO_FAIL      = 7023;     //영물 정보 넘기기 실패
  CM_DELETEPET            = 8027;     //영물 놓아주기
  CM_SUMMONPET            = 8028;     //영물 소환하기
  CM_NOTSUMMONPET         = 8029;     //영물 소환해제
  SM_SUMMONPET            = 2017;     //영물
  SM_NOTSUMMONPET         = 2018;     //영물
  CM_CHANGPETNAME         = 8031;     //영물 이름바꾸기

  //================================================
  //공용창고========================================
  CM_ENDCOMSTORAGEITEM  = 8014;   //공용창고
  CM_GETCOMSTORAGE      = 8015;   //공용창고
  CM_COMSTORAGEITEM     = 10315;       //공용창고
  SM_COMSTORAGEITEMS    = 2012;    //공용창고
  SM_COMSTORAGEGIVE     = 6502;    //공용창고
  SM_SENDUCOMSTORAGEITEM= 7002;      //공용창고
  SM_COMSTORAGE_OK         = 7015;     //공용창고
  SM_COMSTORAGE_FAIL       = 7016;     //공용창고
  SM_GETCOMSTORAGEITEMS_FAIL = 7017;   //공용창고
  SM_CLOSECOMSTORAGE       = 7018;     //공용창고
  RM_COMSTORAGEGIVE    = 11134;   //공용창고
  RM_USERCOMSTORAGE    = 10154;      //공용창고
  //================================================

  //문파창고========================================
  CM_ENDGUILDSTORAGEITEM  = 8016;   //문파창고
  CM_GETGUILDSTORAGE      = 8017;   //문파창고
  CM_GUILDSTORAGEITEM     = 10316;  //문파창고
  SM_GUILDSTORAGEITEMS    = 2013;   //문파창고
  SM_GUILDSTORAGEGIVE     = 6503;   //문파창고
  SM_SENDUGUILDSTORAGEITEM= 7003;   //문파창고
  SM_GUILDSTORAGE_OK      = 7019;   //문파창고
  SM_GUILDSTORAGE_FAIL    = 7020;   //문파창고
  SM_GETGUILDSTORAGEITEMS_FAIL = 7021;  //문파창고
  SM_CLOSEGUILDSTORAGE    = 7022;   //문파창고
  RM_GUILDTORAGEGIVE      = 11135;  //문파창고
  RM_USERGUILDSTORAGE     = 10157;  //문파창고
  //================================================

  //참진격===============
  SM_BLASTHIT = 5215;
  RM_BLASTHIT = 30037;
  //=======================
  //버프
  SM_BUFF   = 9812;   //버프
  RM_BUFF   = 9813;  //버프

  SM_COOLBUFF = 9025;
  RM_COOLBUFF = 9026;

  SM_COOLTIME    = 9814;  //리콜
  RM_COOLTIME    = 9815;  //리콜

  RM_ROCKPAPERS  = 9816; //가위바위보
  SM_ROCKPAPERS  = 9817; //가위바위보
  CM_ROCKPAPERS  = 9818;

  CM_COMPOUNDITEM  = 5338;     //아이템합성
  SM_COMPOUNDINFOS = 5363;     //아이템합성
  SM_COMPOUNDITEM  = 5364;     //아이템합성
  SM_COMUPDATEITEM = 5365;     //아이템합성


  //환상점 선물
  CM_GIFTSITEMS  = 9017;
  CM_LIPEITEMSTR = 9018;
  SM_GIFTSITEMS  = 9019;
  SM_LIPEITEMCOR = 9020;
  CM_GIFTITEMTYPE= 9021;
  SM_GIFTITEMTYPE= 9022;
  //환상점
  CM_LOADSHOPITEM = 9701;
  SM_SHOPITEMLIST = 9702;
  CM_SHOPBUYOK = 9703;
  SM_GETSHOPITEMS_FAIL = 9704;
  SM_SHOPITEMLIST2 = 9705;
  CM_MYSHOPCART = 9706;
  SM_MYSHOPCART = 9707;
  CM_OPSHOPCART = 9708;
  CM_DELSHOPCART = 9709;
 {---}  //혈룡상자
  SM_GETDICE      = 8703;
  SM_GETDICE_FAIL = 8704;
  CM_DICEITEM     = 8705;
  SM_GETDICEITEM  = 8706;

  {-------------경매-------------}
  SM_ONAUCTION    = 8707;
  CM_AUCADDITEM   = 8708;
  SM_AUCUSERINFO  = 8709;
  SM_AUC_OK       = 8710;
  SM_AUC_FAIL     = 8711;
  CM_AUCGET       = 8712;
  CM_BUYAUCITEM   = 8713;
  RM_AUCBUFF      = 8714;
  SM_AUCBUFF      = 8715;

  SM_WAKELIST     = 9700;

  MapNameLen    = 16;
  ActorNameLen  = 14;
  GuildNameLen  = 20;


  GSP_NOTGROUP   = 0;     //그룹허용
  GSP_GROUPCHECK = 1;     //그룹동의 여부
  GSP_GROUPHERO  = 2;     //그룹영웅

  DR_UP         =0;
  DR_UPRIGHT    =1;
  DR_RIGHT      =2;
  DR_DOWNRIGHT  =3;
  DR_DOWN       =4;
  DR_DOWNLEFT   =5;
  DR_LEFT       =6;
  DR_UPLEFT     =7;

  U_DRESS       = 0;
  U_WEAPON      = 1;
  U_RIGHTHAND   = 2;    //양초 , 횃불
  U_NECKLACE    = 3;
  U_HELMET      = 4;
  U_ARMRINGL    = 5;
  U_ARMRINGR    = 6;
  U_RINGL       = 7;
  U_RINGR       = 8;
  U_BUJUK       = 9;
  U_BELT        = 10;
  U_BOOTS       = 11;
  U_CHARM       = 12;
  U_TIGER       = 13;

  U_PETS1       = 14;        //호랑이
  U_PETS2       = 15;
  U_PETS3       = 16;
  U_PETS4       = 17;
  U_PETS5       = 18;

  U_FISH1       = 19;      //낚시
  U_FISH2       = 20;
  U_FISH3       = 21;
  U_FISH4       = 22;
  U_FISH5       = 23;


  DEFBLOCKSIZE  = 16;
  BUFFERSIZE    = 30000;//12000;   //사이즈오브휴먼
  DATABUFFERSIZE = 20000;

  LOGICALMAPUNIT= 40;

  UNITX         = 48;
 // UNITY         = 32;

  HALFX         = 24;
  HALFY         = 16;

  MAXUSEITEM    = 24; //수정
  MAXHEROUSEITEM = 13;
  MAXBAGITEM    = 46;
  MAXHEROBAGITEM = 42; //영웅가방
  STORAGELIMIT  = 80;         //창고
  HOWMANYMAGICS = 35;    //마법 배우는 갯수
  MaxSkillLevel = 3;
  MAX_STATUS_ATTRIBUTE = 30;  //스테이트 증가
  EXTRAABIL_SIZE = 8;

  SAYLISTHEIGHT = 12; //좔莖움멕똑
  FACESHOWCOUNT = 10; //깊헙죗깊첼契鞫刻鑒좆
  SAYFACEWIDTH = 20; //좔莖움깊헙욱똑

  HUMANUSEITEMS = 15;
  HUMITEMS 	= 15;

  ITEM_WEAPON           = 0;
  ITEM_ARMOR				    = 1;
  ITEM_ACCESSORY		    = 2;
  ITEM_HELMET   		    = 3;
  ITEM_ETC					    = 4;
  ITEM_GOLD				      = 10;
  ITEM_UPGRADE          = 5;

  POISON_DECHEALTH       = 0;             //80000000 데미지 독   (녹색)  //64h
  POISON_DAMAGEARMOR     = 1;             //40000000 방어하락 독 (빨강)    //66h
  POISON_FREEZE          = 2;             //20000000 둔화
  POISON_STUN            = 3;             //10000000 스턴
  POISON_SLOWDOWN        = 4;             //08000000 느리게 둔화
  POISON_STONE           = 5;             //04000000 마비
                                          //02000000 미사용
  STATE_SUNCHENDEFENCEUP = 7;             //01000000 선천기공
  STATE_TRANSPARENT      = 8;             //00800000 은신
  STATE_DEFENCEUP        = 9;             //00400000 항마
  STATE_MAGDEFENCEUP     = 10;            //00200000 대지
  STATE_BUBBLEDEFENCEUP  = 11;            //00100000 주술의막
  STATE_FISHING          = 12;            //00080000 낚시
  STATE_SKYSWORD         = 13;            //00040000 천상비술
  POISON_HEMORRHAGE      = 14;            //00020000 혈풍격 독
  STATE_MAGICUP          = 15;            //00010000 심연술
  STATE_SPEEDRUN         = 16;            //00008000 경신보
  STATE_ASSTRANSPARENT   = 17;            //00004000 월영술
  STATE_BLOODSWORD       = 18;            //00002000 혈룡검법
  STATE_PROTECTSHIELD    = 19;            //00001000 호신강기
  STATE_BLOODWATER       = 20;            //00000800 혈룡수
  STATE_THUNDERWAVE      = 21;            //00000400 복호장
  STATE_PENETRATE        = 22;            //00000200 망자의옷
  STATE_KUMGANG          = 23;            //00000100 금강불괴
  STATE_YEONGMU          = 24;            //00000080 월영무
  STATE_WINDMOON         = 25;            //00000040 청풍명월
  STATE_BLOODMOON        = 26;            //00000020 적혈무영
  POISON_THUNDER         = 27;            //00000010 복호장 강화

  STATE_NORMAL           = $00000000;
  STATE_STONE_MODE       = $00000001;
  STATE_OPENHEATH        = $00000002;

  EABIL_DCUP       = 0;   //순간적으로 파괴력을 올림 (일정 시간)
  EABIL_MCUP       = 1;
  EABIL_SCUP       = 2;
  EABIL_HITSPEEDUP = 3;
  EABIL_HPUP       = 4;
  EABIL_MPUP       = 5;
  EABIL_PWRRATE    = 6;   // 공격력 레이트 조정
  EABIL_DCRATE     = 7;  //금강불괴

  ET_DIGOUTZOMBI    = 1;  //좀비
  ET_MINE           = 2;  //광산
  ET_PILESTONES     = 3;  //돌무더기
  ET_HOLYCURTAIN    = 4;  //결계
  ET_FIRE           = 5;  //지염술
  ET_SCULPEICE      = 6;  //주마왕
  ET_POISONCLOUD    = 7;  //독무
  ET_POBAK          = 8;  //포박
  ET_ALLFIRE        = 9;  //만천염옥
  ET_OHAENG         = 10; //음양오행진
  ET_NONE           = 11; //기본
  ET_FIREUP         = 12; //지염술 강화
  ET_UPPOISONCLOUD  = 13; //독무 강화
  ET_ALLTHUNDER     = 14; //운중뢰격
  ET_MAGICLOCK      = 15;
  ET_THUNDERWAVE    = 16; //복호장
  ET_CHUNGONG       = 17; //천공
  ET_DRAGON         = 18; //용솟음
  ET_MAHUL          = 19; //마혈난무

  NE_CLONESHOW      = 2;
  NE_CLONEHIDE      = 3; //분신
  NE_RELIVE         = 14; //소생 이팩트

  NE_MANAEATERS     = 29;  //흡기본인
  NE_HEMORRHAGE     = 31;  //혈풍격
  NE_TICKHEMORRHAGE = 32; //혈풍격
  NE_DARKCLONEHIDE  = 33; //열화신
  NE_MANAEATERT     = 47;  //흡기타겟
  NE_REVIVALCHARGE  = 47; //소생술
  NE_ILSUM          = 54; //일섬
  NE_UPILSUM        = 55; //일섬강화
  NE_MAILSUM        = 56; //마혈광섬
  NE_HWECHUN_1      = 57; //회천격1
  NE_HWECHUN_2      = 58; //회천격2
  NE_DRAGON_1       = 80; //용솟음
  NE_DRAGON_2       = 81; //용솟음
  NE_DRAGON_3       = 128; //용솟음
  NE_LEVELUP        = 13; //레벨업 이펙트

  NE_THUNDERHAGE    = 76; //복호장

  NE_THUNDERDOWN    = 78; //낙천뢰
  NE_KINGSTONE_RECALL_1  = 100; //비월천주 소환 비월천주에게 뿌려줌
  NE_KINGSTONE_RECALL_2  = 101; //비월천주 소환 캐릭에게 뿌려줌
  NE_POISONFOG      = 102; //이무기 독안개 임펙트
  NE_SN_MOVEHIDE    = 103; //이무기 워프 사라지는임펙트
  NE_SN_MOVESHOW    = 104; //이무기 워프 나타나는임펙트
  NE_SN_RELIVE      = 105; //이무기 부활 임펙트
  NE_KINGTURTLE_MOBSHOW  = 106; //현무현신 소환몹 나타나는임펙트
  NE_OMAKING        = 107; //파황마신
  NE_FOX_MOVESHOW   = 109; //비월여우 소환
  NE_GOLD_MOVESHOW  = 110; //환사몹 소환
  NE_SOULSTONE_HIT  = 111; //호혼석

  NE_THUNDER        = 114;  //용던젼 번개        //마룡번개
  NE_FIRE           = 115;  //용던젼 용암       //마룡번개
  NE_USERHEALING    = 116;  //NPC 힐링

  NE_SURA           = 82;  //수라천멸진
  NE_FIRECIRCLE     = 112;  //화룡기염

  NE_CLOUD          = 129; //암독만계
  NE_FIRECIRCLEUP   = 133;  //화룡기염 강화
  NE_MONCAPTURE     = 9;  //포승검-포획 이펙트
  NE_ICECIRCLE      = 136; //빙월격
  NE_THUNDERCIRCLE  = 138; //뇌신혈
  NE_THUNDERCIRCLE2 = 139; //뇌신혈
  NE_KYO            = 140; //교악
  NE_SINGI          = 141; //신기묘산

  NE_THUNDER2       = 142;  //용던젼 번개

  NE_Enchant_Good   = 176; //각성 성공
  NE_Enchant_Fail   = 177; //각성 실패
  NE_Hammer_Good    = 178; //망치
  NE_Hammer_Miss    = 179; //망치

  NE_Enchant_Good1  = 180; //각성 성공
  NE_Enchant_Fail1  = 181; //각성 실패
  NE_Hammer_Good1   = 182; //망치
  NE_Hammer_Miss1   = 183; //망치

  NE_CHUNMU         = 184; //천무
  NE_STRUCKCHUNMU   = 185; //천무반격

  NE_GUKDEA         = 187; //국대응원복 

  NE_GoStop1        = 188; //비광의탈
  NE_GoStop2        = 189;
  NE_GoStop3        = 190;
  NE_GoStop4        = 191;
  NE_GoStop5        = 192;
  NE_GoStop         = 193;
  NE_GoStop6        = 194;

  NE_OMAJESA        = 195;
  NE_GUSLE1         = 196;
  NE_GSLE2S         = 197;
  NE_GUUSLE3T       = 198;

  NE_OMADRAKKINH    = 199;
  NE_NOSEMONKEY1    = 200; //긴코원숭이
  NE_NOSEMONKEY2    = 201; //긴코원숭이
  NE_GUJANGWHA      = 202; //거장화

  NE_ICEKING1       = 210; //설태랑
  NE_ICEKING2       = 211; //설태랑

  NE_GHOSTFIRE      = 226; //혼불
  NE_DARK_RECALL    = 233; //암흑선장

  NE_BIG_SNAKE      = 234; //대망
  NE_JUMAWIZARD     = 235; //주마술사
  NE_JUMAWIND       = 236; //주마풍궁사
  NE_SANDWIND       = 237; //모래폭풍

  NE_SPIDERBOSS     = 30; //월지거미줄

  NE_ICEDEVIL      = 250; //악귀 자폭

  NE_BONZECLONE    = 251; //은형술
  NE_JUCJSAL       = 252; //천인적살풍
  NE_FAHANGBO      = 253; //파황보

  NE_BEAR_LIGHITING = 254; //곰 라이트닝 공격

  RCC_MERCHANT     = 50;
  RCC_GUARD        = 12;
  RCC_USERHUMAN    = 0;

  F_GOOD = 0;
  F_BAD  = 1;

  Q_QUEST = 0;
  Q_STORY  = 1;


  HAM_ALL      = 0;
  HAM_PEACE    = 1;
  HAM_GROUP    = 2;
  HAM_GUILD    = 3;
  HAM_ENEMY    = 4;
  HAM_PKATTACK = 5;

  CM_QUERYUSERSTATE     = 82;

  CM_QUERYUSERNAME      = 80;
  CM_QUERYBAGITEMS      = 81;
  CM_QUERYSTORAGEITEMS  = 83;

  CM_QUERYGUILDGROW     = 84; //문파성장

  CM_GETAUCTION         = 8011;
  CM_BUYAUCTIONITEM     = 8012;
  CM_GETGOLDITEM        = 8013;

  CM_GETSTORAGE         = 8019;  //이동여관

  CM_QUERYCHR           = 100;
  CM_NEWCHR             = 101;
  CM_DELCHR             = 102;
  CM_SELCHR             = 103;
  CM_SELECTSERVER       = 104;

  CM_ALIVE = 117;
  CM_VIEWDELHUM = 114;
  CM_RENEWHUM = 115;

  CM_GETTOPINFO         = 130;
  
  CM_OPENDOOR           = 1002;
  CM_SOFTCLOSE          = 1009;

  CM_DROPITEM           = 1000;     //아이템 버림
  CM_PICKUP             = 1001;
  CM_TAKEONITEM		      = 1003;
  CM_TAKEOFFITEM        = 1004;
  CM_1005               = 1005;
  CM_EAT                = 1006;
  CM_BUTCH              = 1007;
  CM_MAGICKEYCHANGE	    = 1008;
  CM_CHECKMSG           = 1092;

  CM_CLICKNPC           = 1010;
  CM_MERCHANTDLGSELECT  = 1011;
  CM_MERCHANTQUERYSELLPRICE = 1012;
  CM_USERSELLITEM       = 1013;
  CM_USERBUYITEM        = 1014;
  CM_USERPBUYITEM       = 1015;
  CM_DROPGOLD           = 1016;
  CM_1017               = 1017;
  CM_LOGINNOTICEOK      = 1018;
  CM_GROUPMODE          = 1019;    //그룹 모드
  CM_CREATEGROUP        = 1020;    //그룹 결성
  CM_ADDGROUPMEMBER     = 1021;     //그룹원 추가
  CM_DELGROUPMEMBER     = 1022;     //그룹원 삭제
  CM_USERREPAIRITEM     = 1023;
  CM_MERCHANTQUERYREPAIRCOST = 1024;
  CM_DEALTRY            = 1025;        //거래
  CM_DEALADDITEM        = 1026;         //거래
  CM_DEALDELITEM        = 1027;          //거래
  CM_DEALCANCEL         = 1028;          //거래
  CM_DEALCHGGOLD        = 1029;          //거래
  CM_DEALEND            = 1030;          //거래
  CM_USERSTORAGEITEM    = 1031;
  CM_CONSIGNITEM        = 10311;       //위탁
  CM_USERTAKEBACKSTORAGEITEM = 1032;
  CM_TIGERSET           = 1033; //호랑이
  CM_LOGINNOTICEOK_EX   = 1034;
  CM_OPENGUILDDLG       = 1035;
  CM_GUILDHOME          = 1036;
  CM_GUILDMEMBERLIST    = 1037;
  CM_GUILDADDMEMBER     = 1038;
  CM_GUILDDELMEMBER     = 1039;
  CM_GUILDUPDATENOTICE  = 1040;
  CM_GUILDUPDATERANKINFO= 1041;

  CM_ADJUST_BONUS       = 1043;
  CM_GUILDALLY          = 1044;
  CM_GUILDBREAKALLY     = 1045;

  CM_EXCHGGOLD          = 1052;   //환전
  CM_EXCHGAMEGGOLD      = 1053;   //환전
  CM_EXCANCEL           = 1054;   //환전 취소
  CM_EXCHANGEEND        = 1055;   //환전 완료
  CM_EXCHGAMERATE       = 1056;   //환전 시세

  CM_USERITEMLOCK = 1060;

  CM_USERITEMWAKE = 1061;
  CM_USERITEMRESTORE = 1162;

  CM_GETSAYITEM = 94;
  CM_FRIEND_CHENGE = 96;
  CM_SPEEDHACKUSER      = 10430;

  CM_DEALDELITEM2       = 1050;         //거래

  CM_MERCHANTQUERYWAKECOST = 1157;
  CM_MERCHANTQUERYRESTORECOST = 1158;

  CM_GUILDSET           = 1051;    //문파 마크
  CM_GUILDGROWUP        = 1057;    //문파성장

  CM_UPGRADEITEM        = 1063;  // 아이템 업그레이드 요청      //스쳐
  CM_USERMAKEITEMSEL    = 1065;      //제조스쳐
  CM_USERMAKEITEM       = 1066;      //제조스쳐
  CM_ALIVE_OK           = 1998;  //소생확인

  CM_PRICEDISASSEMBLE   = 1067;  //각성분해가격
  CM_DISASSEMBLE        = 1068;  //각성분해

  CM_ITEMWAKEUP         = 1070;  //각성

  CM_PRICEDISMANTLEBLE  = 1071;  //일반분해가격
  CM_DISMANTLE          = 1072;  //일반분해


  CM_PROTOCOL           = 2000;
  CM_IDPASSWORD         = 2001;
  CM_ADDNEWUSER         = 2002;
  CM_CHANGEPASSWORD     = 2003;
  CM_UPDATEUSER         = 2004;

  CM_TURN               = 3010;
  CM_WALK               = 3011;
  CM_SITDOWN            = 3012;
  CM_RUN                = 3013;
  CM_HITLEFT            = 3014;  //왼쪽
  CM_HIT                = 3015;
  CM_HEAVYHIT           = 3016;
  CM_BIGHIT             = 3017;
  CM_SPELL              = 3064;
  CM_POWERHIT           = 3018;
  CM_LONGHIT            = 3019;
  CM_TAGUHIT            = 3065;   //타구봉법
  CM_DEATHHIT           = 3037;  //살생도
  CM_WBHIT              = 3087;   //풍검술
  CM_WBHIT2             = 3090;    //풍검술
  CM_SPEEDRUN           = 3092;  //경신보

  CM_WIDEHIT            = 3024;
  CM_FIREHIT            = 3025;

  CM_SAY                = 3030;

  CM_GEMITEM            = 3031; //보옥(구 시스템)

  //친구
  CM_REQUESTFRIENDLIST  = 3046;
  //쪽지
  CM_MAIL_LIST          = 3050;
  CM_MAIL_ADD           = 3051;
  CM_MAIL_SETINFO       = 3052;
  CM_MAIL_DELETE        = 3053;

  CM_REJECT_LIST        = 3055;
  CM_REJECT_ADD         = 3056;
  CM_REJECT_DELETE      = 3057;

  //연인 스쳐
  CM_LM_OPTION = 1058;  // 관계 활성 / 비활성
  CM_LM_REQUEST = 1059;  // 관계 등록 요청
  CM_LM_DELETE = 1062;  // 관계 파기

  CM_LM_DELETE_REQ_OK   = 1088;  // 관계 파기 OK
  CM_LM_DELETE_REQ_FAIL = 1089;  // 관계 파기 FAIL

  CM_CANCLOSE           = 1101;

  CM_REQUESTRELAYOK     = 3070;
  CM_REQUESTRELAYFAIL   = 3071;

  CM_REQUESTGTLIST      =3072;
  CM_BUYGT              =3073;
  CM_REQUESTDECOLIST    =3074;
  CM_BUYDECOITEM        =3075;
  CM_TRADEGT            =3076;
  CM_BBSLIST            =3077;       //장원게시판
  CM_BBSMSG             =3078;      //장원게시판
  CM_BBSPOST            =3079;       //장원게시판
  CM_BBSDELETE          =3080;      //장원게시판


  //사제 스쳐
  CM_ME_REQUEST         = 3083;
  CM_ME_DELETE          = 3084;

  CM_FISHING1           =3098;    //낚시
  CM_FISHING2           =3099;    //낚시

  SM_RUSH               = 6;
  SM_RUSHKUNG           = 7;
  SM_FIREHIT            = 8;
  SM_BACKSTEP           = 9;
  SM_TURN               = 10;
  SM_WALK               = 11;
  SM_SITDOWN            = 12;
  SM_RUN                = 13;
  SM_HITLEFT            = 14; //왼쪽
  SM_HIT                = 15;      //오른쪽
  SM_HEAVYHIT           = 16;
  SM_BIGHIT             = 17;
  SM_SPELL              = 64;
  SM_POWERHIT           = 18;
  SM_LONGHIT            = 19;
  SM_DIGUP              = 20;
  SM_DIGDOWN            = 21;
  SM_FLYAXE             = 22;
  SM_LIGHTING           = 23;
  SM_WIDEHIT            = 24;
  SM_CRSHIT             = 25;   //광풍참
  SM_TWINHIT            = 26;
  SM_BOW                = 39;
  SM_DEATHHIT           = 37;     //살생도
  SM_WBHIT              = 87;    //풍검술
  SM_WBHIT2             = 90;    //풍검술
  SM_BALDO              = 93; //발도술
  SM_DOWN               = 91; //월영술
  SM_SPEEDRUN           = 92; //경신보
  SM_DOWNRUN            = 89; //월영술
  SM_BALDO2             = 94; //발도술
  SM_LIGHTING_1         = 95; //마법_1:이무기 멸천화
  SM_LIGHTING_2         = 96;
  SM_LIGHTING_3         = 97;
  SM_FISHING1           = 98; //낚시 시작
  SM_FISHING2           = 99;  //낚시 끝
  SM_LIGHTING_4         = 300;
  SM_LIGHTING_5         = 301;
  SM_LIGHTING_6         = 302;
  SM_LIGHTING_7         = 303;
  SM_CPOWERHIT          = 304;
  SM_CFIREHIT           = 305;
  SM_TAGUHIT            = 306;
  SM_THUNDERHIT         = 307;//뇌룡봉법
  SM_FIRESHAOLIN        = 308;//천화봉법

  SM_MAGICMOVE          = 309;
  SM_CRBHIT             = 310;  //회풍천봉법 - 도사
  SM_NANCRSHIT          = 311;  //난화혈풍참

   MAGIC_OLDKING_ATT1_1  = 60;     //고대수호장
   MAGIC_OLDKING_ATT1_2  = 61;     //고대수호장
   MAGIC_ICEKING_ATT1_1  = 62;     //한빙수호귀
   MAGIC_ICEKING_ATT1_2  = 63;     //한빙수호귀
   MAGIC_ICEKING_ATT1_3  = 64;     //한빙수호귀
   MAGIC_ICEKING_ATT1_4  = 65;     //한빙수호귀

   MAGIC_TEGU_ATT        = 202;     //태구오마
   MAGIC_JUCK_ATT        = 203;     //오마적병
   MAGIC_GHOST_ATT       = 228;     //선박의악령
   MAGIC_FRAM_NO_ATT     = 229;     //농노군
   MAGIC_BIG_SNAKE       = 230;     //대망
   MAGIC_JUMAFIREARC1    = 231;     //주마화궁사
   MAGIC_JUMAFIREARC2    = 232;     //주마화궁사
   MAGIC_JUMAWIND        = 233;     //주마풍궁사

   MAGIC_ARCHER_ATT1     = 234;     //유상궁장1
   MAGIC_ARCHER_ATT2     = 235;     //유상궁장1
   MAGIC_ARCHER_ATT3     = 236;     //유상궁장1

   MAGIC_ICEARC          = 237; //빙원귀궁사
   // FireDragon ------------------------ by Leekg...2003/11/27

   MAGIC_DUN_THUNDER       = 70; //용던젼 번개//마룡번개
   MAGIC_DUN_FIRE1         = 71; //용던젼 용암 덩어리     //마룡번개
   MAGIC_DUN_FIRE2         = 72; //용던젼 용암 임펙트     //마룡번개
   MAGIC_DRAGONFIRE        = 73; //용불공격 터짐    //마룡번개
   MAGIC_FIREBURN          = 74; //용석상공격 터짐 타오름
   MAGIC_DUN_THUNDER2      = 75;

   MAGIC_FOX_THUNDER       = 78; //술사비월여우 강격 //비월적호
   MAGIC_FOX_FIRE1         = 79; //술사비월여우 화염
   MAGIC_DARK_THUNDER      = 80; //흑천귀 공격
   MAGIC_EXPLOSIN          = 81; //폭마야차
   MAGIC_FIREEXPLOSIN      = 82; //열장적귀
   MAGIC_SIDEARMS          = 83; //패검적귀
   MAGIC_DAGGER            = 84; //독인적귀

   MAGIC_ICEGUARD          = 85; //견빙수호장
   MAGIC_MAGICGUARD        = 86; //마염수호장
   MAGIC_DARKGUARD         = 87; //암혼수호장
   MAGIC_POWERGUARD        = 88; //열진수호장

   MAGIC_HAMMERCAT         = 89; //얼룩망치괭이

   MAGIC_FOX_FIRE2         = 90; //도사비월여우 폭살계
   MAGIC_FOX_CURSE         = 91; //도사비월여우 저주술
   MAGIC_SOULBALL_ATT1     = 93; //비월천주 전기 공격(근접범위)
   MAGIC_SOULBALL_ATT2     = 94; //비월천주 전기 공격(원거리)
   MAGIC_SOULBALL_ATT3_1   = 95; //비월천주 전기 공격(필사기) 5가지 임펙트
   MAGIC_SOULBALL_ATT3_2   = 96;
   MAGIC_SOULBALL_ATT3_3   = 97;
   MAGIC_SOULBALL_ATT3_4   = 98;
   MAGIC_SOULBALL_ATT3_5   = 99;
   MAGIC_SERPENT_1         = 100; //이무기 멸천화

   MAGIC_TURTLE_WARTERATT  = 101; //갑철귀수 물공격
   MAGIC_KINGTURTLE_ATT1   = 102; //현무현신-힐링
   MAGIC_KINGTURTLE_ATT2_1 = 103; //현무현신-전체물공격1
   MAGIC_KINGTURTLE_ATT2_2 = 104; //현무현신-전체물공격2
   MAGIC_KINGTURTLE_ATT3   = 105; //현무현신-몬스터소환
   MAGIC_KINGTURTLE_ATT2_3 = 105; //현무현신-전체물공격1
   MAGIC_KINGTURTLE_ATT2_4 = 107; //현무현신-전체물공격2

   MAGIC_SPIDER_ATT1       = 108; //월지겸신장

   MAGIC_POT_ATT           = 110; //호중귀1

   MAGIC_MilSTONE_ATT3_1   = 111; //석마수 공격 이팩트 회오리
   MAGIC_MilSTONE_ATT3_2   = 112;
   MAGIC_MilSTONE_ATT3_3   = 113;
   MAGIC_MilSTONE_ATT3_4   = 114;
   MAGIC_MilSTONE_ATT3_5   = 115;

   MAGIC_WILDATTACK_ATT3_1   = 116;     //야수왕
   MAGIC_WILDATTACK_ATT3_2   = 117;     //야수왕
   MAGIC_WILDATTACK_ATT3_3   = 118;     //야수왕
   MAGIC_WILDATTACK_ATT3_4   = 119;     //야수왕
   MAGIC_WILDATTACK_ATT3_5   = 120;     //야수왕
   MAGIC_WILDATTACK_ATT3_6   = 121;     //야수왕

   MAGIC_NAMMAN_ATT1_1   = 122;     //단묵
   MAGIC_NAMMAN_ATT1_2   = 123;     //단묵

   MAGIC_MERMAID_ATT1_1  = 124;     //수어귀
   MAGIC_MERMAID_ATT1_2  = 125;     //수어귀

   MAGIC_FIREEXPLOSIN2   = 126;    //인간수
   MAGIC_SPIDER_ATT_1    = 127;    //공작주 거미줄

   MAGIC_MED_ATT1_2  = 128;

   MAGIC_WIND_LEAD_1 = 129;
   MAGIC_EXPLOSIN_Tree   = 130; //삼나무정백
   MAGIC_EXPLOSIN_WIZARD  = 131; //현월단술사
  MAGIC_FOX_CURSE2        = 132; //현월단도사
  MAGIC_EXPLOSIN_ICE      = 133; //빙원귀존
  MAGIC_EXPLOSIN_DEVIL    = 134; //악귀

  SM_ALIVE              = 27;
  SM_MOVEFAIL           = 28;
  SM_HIDE               = 29;
  SM_DISAPPEAR          = 30;
  SM_STRUCK             = 31;   
  SM_DEATH              = 32;
  SM_SKELETON           = 33;
  SM_NOWDEATH           = 34;
  SM_ToSendMsg          = 36; //발도술

  SM_HEAR               = 40;
  SM_FEATURECHANGED     = 41;
  SM_USERNAME           = 42;
  SM_43                 = 43;
  SM_WINEXP             = 44;
  SM_LEVELUP            = 45;
  SM_DAYCHANGING        = 46;
  SM_LEVELUP2           = 47;   //등선변환
  SM_LEVELUP3           = 48;   //보너스포인트

  SM_LOGON              = 50;
  SM_NEWMAP             = 51;
  SM_ABILITY            = 52;
  SM_HEALTHSPELLCHANGED = 53;
  SM_MAPDESCRIPTION     = 54;

  SM_DRAGON_LIGHTING    = 80;
  SM_81                 = 81;
  SM_82                 = 82;
  SM_83                 = 83;
  SM_84                 = 84;   //염마태자
  SM_85                 = 85;   //염마태자
  SM_86                 = 86;   //염마태자

  SM_SPELL2             = 117;

  SM_CHANGEFAMEPOINT    = 118; //킬/데스 변화(2010/12/05)
  SM_CHANGEFAMEPOINT2   = 124; //킬/데스 변화(2010/12/05)

  SM_SYSMESSAGE         = 100;
  SM_GROUPMESSAGE       = 101;       //그룹 메시지
  SM_CRY                = 102;
  SM_WHISPER            = 103;
  SM_GUILDMESSAGE       = 104;
  SM_MOVEMESSAGE        = 105;      //화면공지

  SM_GUILDAILLY         = 219;

  LM_WHISPER            = 106;
  ME_WHISPER            = 107;

  SM_ADDITEM            = 200;
  SM_BAGITEMS           = 201;
  SM_BAGITEMS2          = 213;
  SM_AUCTIONITEMS       = 2011;
  SM_DELITEM            = 202;
  SM_UPDATEITEM         = 203;
  SM_ADDMAGIC           = 210;
  SM_SENDMYMAGIC        = 211;
  SM_DELMAGIC           = 212;
  SM_STORAGEITEMS       = 214;    //여관
  SM_STORAGEITEMS2      = 215;   //여관
  SM_ADDSTORAGE         = 216;
  SM_ADDGROUPITEM       = 217; //그룹아이템

  SM_CERTIFICATION_SUCCESS = 500;
  SM_CERTIFICATION_FAIL = 501;
  SM_ID_NOTFOUND        = 502;
  SM_PASSWD_FAIL        = 503;
  SM_NEWID_SUCCESS      = 504;
  SM_NEWID_FAIL         = 505;
  SM_CHGPASSWD_SUCCESS  = 506;
  SM_CHGPASSWD_FAIL     = 507;
  SM_QUERYCHR           = 520;

  SM_DELHUM     = 5068;
  SM_RENEWHUM   = 5067;
  SM_NEWCHR_SUCCESS     = 521;
  SM_NEWCHR_FAIL        = 522;
  SM_DELCHR_SUCCESS     = 523;
  SM_DELCHR_FAIL        = 524;
  SM_STARTPLAY          = 525;
  SM_STARTFAIL          = 526;//SM_USERFULL
  SM_QUERYCHR_FAIL      = 527;
  SM_OUTOFCONNECTION    = 528;
  SM_PASSOK_SELECTSERVER= 529;
  SM_SELECTSERVER_OK    = 530;
  SM_NEEDUPDATE_ACCOUNT = 531;
  SM_UPDATEID_SUCCESS   = 532;
  SM_UPDATEID_FAIL      = 533;
  SM_FOXSTATE           = 537;  //천주


  SM_DROPITEM_SUCCESS   = 600;
  SM_DROPITEM_FAIL      = 601;

  SM_ITEMSHOW           = 610;
  SM_ITEMHIDE           = 611;

  SM_OPENDOOR_OK        = 612;
  SM_OPENDOOR_LOCK      = 613;
  SM_CLOSEDOOR          = 614;

  SM_TAKEON_OK          = 615;
  SM_TAKEON_FAIL        = 616;
  SM_TAKEOFF_OK         = 619;
  SM_TAKEOFF_FAIL       = 620;
  SM_SENDUSEITEMS       = 621;
  SM_WEIGHTCHANGED      = 622;
  SM_CLEAROBJECTS       = 633;
  SM_CHANGEMAP          = 634;
  SM_GETTOPINFO         = 5341;
  SM_TOPMSG             = 5343;
  SM_EAT_OK             = 635;
  SM_EAT_FAIL           = 636;
  SM_BUTCH              = 637;
  SM_MAGICFIRE          = 638;
  SM_MAGICFIRE_FAIL     = 639;
  SM_MAGIC_LVEXP        = 640;
  SM_SOUND              = 641;
  SM_DURACHANGE         = 642;
  SM_MERCHANTSAY        = 643;
  SM_MERCHANTDLGCLOSE   = 644;
  SM_SENDGOODSLIST      = 645;
  SM_SENDUSERSELL       = 646;
  SM_SENDBUYPRICE       = 647;
  SM_USERSELLITEM_OK    = 648;
  SM_USERSELLITEM_FAIL  = 649;
  SM_BUYITEM_SUCCESS2   = 6513;
  SM_BUYITEM_SUCCESS    = 650;
  SM_AUCTIONGIVE        = 6501;
  SM_BUYITEM_FAIL       = 651;
  SM_POINTCHANGED       = 652;
  SM_GOLDCHANGED        = 653;
  SM_CHANGELIGHT        = 654;
  SM_LAMPCHANGEDURA     = 655;
  SM_CHANGENAMECOLOR    = 656;
  SM_CHARSTATUSCHANGED  = 657;
  SM_SENDNOTICE         = 658;
  SM_GROUPMODECHANGED   = 659;      //그룹 모드
  SM_CREATEGROUP_OK     = 660;      //그룹 결성 확인
  SM_CREATEGROUP_FAIL   = 661;       //그룹 결성 실패
  SM_GROUPADDMEM_OK     = 662;      //그룹원 추가
  SM_GROUPDELMEM_OK     = 663;       //그룹원 삭제
  SM_GROUPADDMEM_FAIL   = 664;        //그룹원 추가 실패
  SM_GROUPDELMEM_FAIL   = 665;        //그룹원 삭제 실패
  SM_GROUPCANCEL        = 666;          //그룹 취소
  SM_GROUPMEMBERS       = 667;          //그룹
  SM_SENDUSERREPAIR     = 668;
  SM_USERREPAIRITEM_OK  = 669;
  SM_USERREPAIRITEM_FAIL= 670;
  SM_SENDREPAIRCOST     = 671;
  SM_DEALMENU           = 673;          //거래
  SM_DEALTRY_FAIL       = 674;           //거래
  SM_DEALADDITEM_OK     = 675;           //거래
  SM_DEALADDITEM_FAIL   = 676;            //거래
  SM_DEALDELITEM_OK     = 677;            //거래
  SM_DEALDELITEM_FAIL   = 678;            //거래
  SM_DEALCANCEL         = 681;            //거래
  SM_DEALREMOTEADDITEM  = 682;           //거래
  SM_DEALREMOTEDELITEM  = 683;           //거래
  SM_DEALCHGGOLD_OK     = 684;           //거래
  SM_DEALCHGGOLD_FAIL   = 685;           //거래
  SM_DEALREMOTECHGGOLD  = 686;           //거래
  SM_DEALSUCCESS        = 687;           //거래
  SM_TIGERSETCHANGED    = 688;   //호랑이
  SM_FISHCANCEL         = 689;   //낚시 취소
  SM_FISHINC            = 690;   //낚시 실패
  SM_SENDUSERSTORAGEITEM= 700;

  SM_STORAGE_OK         = 701;
  SM_STORAGE_FULL       = 702;
  SM_STORAGE_FAIL       = 703;
  SM_CONSIGN_OK         = 7011;      //위탁
  SM_CONSIGN_FAIL       = 7014;       //위탁
  SM_GETAUCTIONITEMS_FAIL = 7012;
  SM_CLOSEAUCTION = 7013;
  SM_TAKEBACKSTORAGEITEM_OK = 705;
  SM_TAKEBACKSTORAGEITEM_FAIL = 706;
  SM_TAKEBACKSTORAGEITEM_FULLBAG = 707;

  SM_SETPASSWORD        = 785;            //창고암호
  SM_INPUTPASSWORD      = 679;            //창고암호
  SM_STORAGEPW_FAIL     = 799;                 //창고암호
  SM_STORAGEPW_SUC      = 718;               //창고암호
  SM_STORAGEPW_CHK      = 788;          //창고암호


  SM_ALIVEREQ           = 715; //소생

  SM_HOMEMOVE           = 312;

  SM_AREASTATE          = 766;

  SM_DELITEMS           = 709;

  SM_MAKEDRUG_SUCCESS   = 713;
  SM_MAKEDRUG_FAIL      = 714;


  SM_716                = 716;
  SM_GETMAKEGEMLIST     = 717;
  SM_CHECKMSG           = 5262;

  SM_EXCHGGOLD_OK       = 719;   //환전
  SM_EXCHGGOLD_FAIL     = 720;   //환전
  SM_EXCHGGAMEGOLD_OK   = 721;   //환전
  SM_EXCHGGAMEGOLD_FAIL = 722;   //환전
  SM_EXCANCEL           = 723;   //환전 취소
  SM_EXSUCCESS          = 724;   //환전 성공
  SM_EXCHGRATE          = 725;   //환전 시세

  SM_SENDUSERMAKEITEMLIST = 726;    //제조스쳐

  SM_PRICEDISASSEMBLE   = 727;
  SM_SENDUSERDISASSEMBLE = 728;
  SM_DISASSEMBLE_OK     = 729;
  SM_DISASSEMBLE_FAIL   = 730;

  SM_PRICEDISMANTLE     = 731;
  SM_SENDUSERDISMANTLE  = 732;
  SM_DISMANTLE_OK       = 733;
  SM_DISMANTLE_FAIL     = 734;

  SM_CHANGEGUILDNAME    = 750;
  SM_SENDUSERSTATE      = 751;
  SM_SUBABILITY         = 752;
  SM_OPENGUILDDLG       = 753;
  SM_OPENGUILDDLG_FAIL  = 754;
  SM_SENDGUILDMEMBERLIST= 756;
  SM_SENDGUILDGROW      = 755; //문파성장
  SM_GUILDADDMEMBER_OK  = 757;
  SM_GUILDADDMEMBER_FAIL= 758;
  SM_GUILDDELMEMBER_OK  = 759;
  SM_GUILDDELMEMBER_FAIL= 760;
  SM_GUILDRANKUPDATE_FAIL= 761;
  SM_BUILDGUILD_OK      = 762;
  SM_BUILDGUILD_FAIL    = 763;
  SM_DONATE_OK          = 764;
  SM_DONATE_FAIL        = 765;

  SM_MENU_OK            = 767;
  SM_GUILDMAKEALLY_OK   = 768;
  SM_GUILDMAKEALLY_FAIL = 769;
  SM_GUILDBREAKALLY_OK  = 770;
  SM_GUILDBREAKALLY_FAIL= 771;
  SM_DLGMSG             = 772;

  SM_SENDGUILDGROW2     = 773; //문파성장

  SM_SPACEMOVE_HIDE     = 800;
  SM_SPACEMOVE_SHOW     = 801;
  SM_RECONNECT          = 802;
  SM_GHOST              = 803;
  SM_SHOWEVENT          = 804;
  SM_HIDEEVENT          = 805;
  SM_SPACEMOVE_HIDE2    = 806;
  SM_SPACEMOVE_SHOW2    = 807;
  SM_TIMECHECK_MSG      = 810;
  SM_ADJUST_BONUS       = 811;
  SM_SPACEMOVE_HIDE3    = 812;//일섬이동
  SM_SPACEMOVE_SHOW3    = 813;//일섬이동
  SM_SPACEMOVE_SHOW4    = 814;
  SM_SIMPLE_OK          = 815;

  SM_MAIL_ALARM         = 816;   //쪽지왔음 알림
  SM_MAIL_INFO          = 817;   //쪽지정보 변경
  SM_CLIENTDATAFILE     = 818;
  //연인 스쳐 --------------
  SM_LM_LIST     = 823;   //관계 리스트
  SM_LM_OPTION   = 824;   //관계 옵션
  SM_LM_REQUEST  = 825;   //관계 설정 요구
  SM_LM_DELETE   = 826;   //관계 삭제
  SM_LM_RESULT   = 827;   //관계 결과값 전송
  // RelationShip (cont.)--------------
  SM_LM_DELETE_REQ     = 840;   //관계 삭제 확인

 //사제 스쳐 --------------
  SM_ME_LIST     = 828;    //관계 리스트
  SM_ME_INFO     = 829;    //관계 정보 보내기

  SM_SENDITEMLOCK = 844;
  SM_USERITEMLOCK_OK = 845;
  SM_USERITEMLOCK_FAIL = 846;

  SM_USERITEMWAKE_OK = 847;
  SM_USERITEMWAKE_FAIL = 848;

  SM_USERITEMRESTORE_OK = 849;
  SM_USERITEMRESTORE_FAIL = 850;


  SM_OPENHEALTH         = 1100;
  SM_CLOSEHEALTH        = 1101;
  SM_CHANGEFACE         = 1104;
  SM_BREAKWEAPON        = 1102;
  SM_INSTANCEHEALGUAGE  = 1103;
  SM_VERSION_FAIL       = 1106;
  SM_LOOPNORMALEFFECT   = 1107;  //소생 임펙트 효과
  // 2003/02/11 그룹원 위치 정보
  SM_GROUPPOS             = 1312;
  // UpgradeItem_Result ---------------- by...2011/05/09
  SM_UPGRADEITEM_RESULT     = 1300;    //보옥
  // 겹치기
  SM_COUNTERITEMCHANGE      = 1301;

  SM_SENDUSERWAKE = 1668;
  SM_USERWAKE_OK = 1669;
  SM_USERWAKE_FAIL = 1670;
  SM_SENDWAKECOST = 1671;

  SM_SENDUSERRESTORE = 1700;
  SM_USERRESTORE_OK = 1701;
  SM_USERRESTORE_FAIL = 1702;
  SM_SENDRESTORECOST = 1703;

  SM_CANCLOSE_OK            = 1304;
  SM_CANCLOSE_FAIL          = 1305;

  SM_ITEMUPDATE         = 1500;
  SM_MONSTERSAY         = 1501;

  SM_REPAIRITEMOK       = 1502;


  SM_FRIEND_RESULT      = 1510;

  // Mail2
  SM_MAILLIST           = 1520;
  SM_MAIL_LIST          = 1521;

  SM_MAIL_RESULT        = 1523;
  SM_MAILSTATUS         = 1524;
  SM_REJECT_LIST        = 1526;
  SM_REJECT_RESULT      = 1527;
  SM_REJECT_ADD         = 1528;
  SM_REJECT_DELETE      = 1529;

  //GT SM
  SM_GTLIST       = 1545;
  SM_GTDECOLIST   = 1546;
  SM_GTTRADE      = 1547;
  SM_BBSMSGLIST   = 1548;       //장원게시판
  SM_BBSMSG       = 1549;       //장원게시판

  SM_EXCHGTAKEON_OK=65023;
  SM_EXCHGTAKEON_FAIL=65024;

  SM_EXPRATE                 = 7998;
  SM_GROUPCALL               = 7999;
  SM_ATTATCKMODE             = 8000;



  SM_TEST=65037;
  SM_ACTION_MIN   = 0;
  SM_ACTION_MAX   = 26;
  SM_ACTION2_MIN  = 39;
  SM_ACTION2_MAX  = 100;

  SM_ACTION3_MIN  = 300;
  SM_ACTION3_MAX  = 311;

  CM_SERVERREGINFO = 65074;

  //-------------------------------------

  CM_GETGAMELIST = 5001;
  SM_SENDGAMELIST = 5002;
  CM_GETBACKPASSWORD = 5003;
  SM_GETBACKPASSWD_SUCCESS = 5005;
  SM_GETBACKPASSWD_FAIL    = 5006;
  SM_SERVERCONFIG = 5007;
  SM_GAMEGOLDNAME = 5008;
  SM_PASSWORD     = 5009;
  SM_HORSERUN     = 5010;
  //승려 생산불가
  CM_QUERYROGUE = 50062;
  SM_ROGUEENABLED = 50063;
  SM_ROGUEDISABLED = 50064;

  SM_GETSAYITEM = 5267;
  SM_FRIEND_LOGIN = 5269;

  UNKNOWMSG           = 199;
  SS_OPENSESSION      = 100;
  SS_CLOSESESSION     = 101;
  SS_KEEPALIVE        = 104;
  SS_KICKUSER         = 111;
  SS_SERVERLOAD       = 113;

  SS_200              = 200;
  SS_201              = 201;
  SS_202              = 202;
  SS_203              = 203;
  SS_204              = 204;
  SS_205              = 205;
  SS_206              = 206;
  SS_207              = 207;
  SS_208              = 208;
  SS_209              = 209;
  SS_210              = 210;
  SS_211              = 211;
  SS_212              = 212;
  SS_213              = 213;
  SS_214              = 214;
  SS_WHISPER          = 299;

  SS_SERVERINFO       = 103;
  SS_SOFTOUTSESSION   = 102;
  SS_LOGINCOST        = 30002;

  DBR_FAIL            = 2000;
  DB_LOADHUMANRCD     = 100;
  DB_SAVEHUMANRCD     = 101;
  DB_SAVEHUMANRCDEX   = 102;//?
  DBR_LOADHUMANRCD    = 1100;
  DBR_SAVEHUMANRCD    = 1102; //?

  DB_LOADHERORCD      = 103;
  DB_SAVEHERORCD      = 104;
  DBR_LOADHERORCD      = 1103;
  DBR_SAVEHERORCD     = 1104; 

  DB_NEWHERORCD       = 105;
  DB_DELHERORCD       = 106;
  DBR_NEWHERORCD      = 1105;
  DBR_DELHERORCD      = 1106;
  DBR_NOTCREATEHERO   = 1107;

  RUNGATECODE = $AB36AB68;

  GM_OPEN             = 1;
  GM_CLOSE            = 2;
  GM_CHECKSERVER      = 3;// Send check signal to Server
  GM_CHECKCLIENT      = 4;// Send check signal to Client
  GM_DATA             = 5;
  GM_SERVERUSERINDEX  = 6;
  GM_RECEIVE_OK       = 7;
  GM_TEST             = 20;


  SG_FORMHANDLE       = 32001;
  SG_STARTNOW         = 32002;
  SG_STARTOK          = 32003;
  SG_CHECKCODEADDR    = 32004;
  SG_USERACCOUNT      = 32005;
  SG_USERACCOUNTCHANGESTATUS = 32006;
  SG_USERACCOUNTNOTFOUND     = 32007;

  SG_DBSAVEOUT        = 32008;
  SG_CHECKRUNCODE     = 32009;      //수정되었습니다.

  GS_QUIT             = 32101;
  GS_USERACCOUNT      = 32102;
  GS_CHANGEACCOUNTINFO = 32103;
  GS_CHECKRUNCODE      = 32104;     //수정되었습니다.

type
  TNpcType = (n_Norm, n_Merchant);
  TSockData = (d_LoadHumData, d_SaveHumData, d_LoadHeroData, d_SaveHeroData, d_SaveData);   //랭킹 추가
  THeroDataType = (l_Create, l_Delete, l_Load, l_Save);
//-----------------------------------------
  pTDefaultMessage=^TDefaultMessage;
  TDefaultMessage = record
    Recog    :Integer;
    Ident    :Word;
    Param    :Word;
    Tag      :Word;
    Series   :Word;
  end;

  TVarType = (vNone, vInteger, vString);
  TVarAttr = (aNone, aFixStr, aDynamic, aConst);

  TVarInfo = record
    VarType: TVarType;
    VarAttr: TVarAttr;
  end;
  pTVarInfo = ^TVarInfo;

  TChrMsg =record
    Ident    :Integer;
    X        :Integer;
    Y        :Integer;
    Dir      :Integer;
    State    :Integer;
    feature  :Integer;
    saying   :String;
    Sound    :Integer;
  end;
  PTChrMsg = ^TChrMsg;

  TValue = array[0..19] of Byte;

  TRenewChrInfo = record
    ID: Integer;
    Name: string[16];
    Job: Byte;
    Level: Word;
    Sex: Byte;
  end;

  pTStdItem=^TStdItem;
  TStdItem=packed record
     Name: string[22];
     StdMode            :Byte;
     Grade              :Byte;
     Shape              :Byte;
     Weight             :Byte;
     AniCount           :Byte;
     Source             :shortint;    // +이면 생물공격+능력, -이면 언데드공격+
                                      //1~10 강도
                                      //-50~-1 언데드 능력치 향상
                                      //-100~-51 언데드 능력치 감소
     reserved           :byte;
     NeedIdentify       :byte;
     Looks              :Word;
     DuraMax            :DWord;
     AC                 :Dword;
     MAC                :Dword;
     DC                 :Dword;
     MC                 :Dword;
     SC                 :DWord;
     Need               :DWord;
     NeedLevel          :DWord;
     NeedOption         :DWord;
     Price              :UINT;
     Color              :Integer;
     Tox                :Word;
     ToxAvoid           :Word;
     SlowDown           :Word;
     MagAvoid           :Word;
     HpAdd              :Word;
     MpAdd              :Word;
     RecHp              :Word;
     RecMp              :Word;
     AtkSpd             :Word; //중독 판정 공속
     Agility            :Word; //중독 판정 민첩 성
     Accurate           :Word; //중독 판정 정확 성
     WearWeight         :Word; //착용무게
     HumUp              :Byte; //등선판단
     CheckNoAss         :Boolean;
     CheckAss           :Boolean;
     CheckBonze         :Boolean;
     HumRun             :Boolean; //질주기능
     DDay               :Byte; //반짝 아이템
     MaxAmount          :integer;
     btValue            :TValue; //+16
     MaxDate            :integer;
     Owner              :String[20];
     ItemGlow		        :Byte;

     DropDell           :Boolean;    //아이템 버림
     ChangeItem         :Boolean;
     DisassembleItem    :Boolean;
     NonStuff           :Boolean;
     boCompound         :Boolean;
     boOnlyHero         :Boolean;
     Unique             :Boolean;
     boCanTrade         :Boolean;
     boCanDrop          :Boolean;
     boCanDeathDrop     :Boolean;
     boCanRepair        :Boolean;
     boCanSpecialRepair :Boolean;
     boCanStore         :Boolean;
     boCanSell          :Boolean;      //판매금지
     boCanHeroBag       :Boolean;

     WEffect            :integer;
     SetItemList: TList;
  end;

  PTClientItem =^TClientItem;
  TClientItem = record
    S         :TStdItem;
    MakeIndex :Integer;
    Dura      :Word;
    DuraMax   :Word;
    Amount    :Integer;
    UpgradeOpt   : integer;    //업그레이드 된 개수
  end;

  PSBuyItem=^SBuyItem;       //상인
  SBuyItem = packed record
    Price:Integer;
    Stock:word;
    entItem:TClientItem;
  end;

  TGuildGrowUp =record       //문파성장
    GuildName     :String[20];
    GuildOwnerName:String[20]; //상대방 문주 이름

    GuildLevel    :Integer;
    GuildPoint    :Integer;
    GuildExp      :Integer;
    GuildMaxExp   :Integer;

    GrowHP        :Integer;
    GrowMP        :Integer;
    GrowExp       :Integer;
    GrowAC        :Integer;
    GrowMAC       :Integer;
    GrowPower     :Integer;
    GrowLuck      :Integer;
  end;


  TVailantInfo =record //용맹의전장
    BlueTotalPoint   :Integer;
    RedTotalPoint    :Integer;

    BlueMoonPoint    :Integer;
    RedMoonPoint     :Integer;

    BlueSunPoint     :Integer;
    RedSunPoint      :Integer;

    BlueThunderPoint :Integer;
    RedThunderPoint  :Integer;
  end;

  TVailantGroup = packed record
    UserName: string[ActorNameLen];
    RedOrBlue: Byte;
    Level: Word;
    Kill, Death: Integer;
    IndividualPoint, AdditionPoint, HonorPoint: Integer; //개인점수, 추가점수, 명예포인트
  end;
  pTVailantGroup = ^TVailantGroup;

  TVailantMember = packed record
    VailantGroup: TVailantGroup;
    isScreen: TObject;
  end;
  pTVailantMember = ^TVailantMember;

  TUserStateInfo =record
    Feature       :Integer;
    Job           :Byte;
    Level         :Word;
    Sex           :Byte;
    UserName      :String[20];
    GuildName     :String[20];
    GuildRankName :String[16];
    LoverName     :String[14];
    Column        :Byte;
    NameColor     :Integer;
    bExistLover   :Boolean;     //연인 상태(2004/10/27)
    UseItems      :array [0..MAXUSEITEM] of TClientItem;     //아이템 갯수
    FameName      :string[20]; //킬/데스
    ColumName     :string[20]; 
    DC            :DWord;
    MC            :DWord;
    SC            :DWord;
    AC            :DWord;
    MAC           :DWord;
    KillPoint     :Integer;    //킬/데스
    DeathPoint    :Integer;    //킬/데스
    GuildMark     :Integer;    //상대방 문파마크
    GuildOwnerName:String[20]; //상대방 문주 이름
    GuildList     :Integer;    //상대방 문원수
    GuildLevel    :Integer;    //상대방 문원 레벨
    Mask          :Integer;
    bHero         :Boolean;
  end;
  TUserCharacterInfo =record
    Name:String[19];
    Job:Byte;
    Hair:Byte;
    Level:Integer;
    Sex:Byte;
    Login:String[40];
  end;
  TUserEntry =record
    sAccount      :String[10];
    sPassword     :String[10];
    sUserName     :String[20];
    sSSNo         :String[14];
    sPhone        :String[14];
    sQuiz         :String[20];
    sAnswer       :String[12];
    sEMail        :String[40];
  end;
  TUserEntryAdd =record
    sQuiz2        :String[20];
    sAnswer2      :String[12];
    sBirthDay     :String[10];
    sMobilePhone  :String[15];
    sMemo         :String[40];
    sMemo2        :String[40];
  end;


  TDropItem =record
    X:Integer;
    Y:Integer;
    Id:integer;
    Looks:integer;
    Name:String;
    Grade:Byte;
    FlashTime:Dword;
    FlashStepTime:Dword;
    FlashStep:Integer;
    BoFlash:Boolean;
    BoDeco      : Boolean;
  end;
  PTDropItem = ^TDropItem;

  pTMagic=^TMagic;
  TMagic =record
    wMagicID:Word;
    wMimicID:Word;
    sMagicName:String[20];
    btEffectType:Byte;
    btEffect:Byte;
    btIcon:Byte; //무공 아이콘
    wSpell:Word;
    wPower:Word;
    TrainLevel:Array[0..3] of Byte;    //무공레벨
    MaxTrain:Array[0..3] of Integer;    //무공레벨
    btTrainLv:Byte;
    btJob:Byte;
    dwDelayTime:Integer;
    dwUseDelayTime:Integer;
    btDefSpell:Byte;
    btDefPower:Word;//Byte;
    wMaxPower:Word;
    btDefMaxPower:Word;//Byte;
  end;
  TClientMagic = record
    Key    :Char;
    Level  :Byte;
    CurTrain:Integer;
    Def    :TMagic;
  end;
  PTClientMagic = ^TClientMagic;

  pTClientGroup = ^TClientGroup;
  TClientGroup = packed record
    UserName: string[ActorNameLen];
    UserID: Integer;
    Level: Word;
    HP, MP, MaxHP, MaxMP: Word;
    btJob, btSex: Byte;
  end;
  pTGroupMember = ^TGroupMember;
  TGroupMember = packed record
    ClientGroup: TClientGroup;
    isScreen: TObject;
  end;

  //우편시스템
  pTClientEMailHeader = ^TClientEMailHeader;
  TClientEMailHeader = packed record
    nIdx: Integer;
    sTitle: string[20];
    sSendName: string[ActorNameLen];
    boRead: Boolean;
    boSystem: Boolean;
    btTime: Byte;
  end;

  // 2003/04/15 친구, 쪽지
 
  TNMailItem = record
      Id    : Integer;
      Sender: String;    //보낸사람
      Recipient :String; //받는사람
      Date  : String;   //날짜
      Mail  : String;    //내용
      Status: Integer;   //읽음 삭제금지 안읽음 등..
   end;
   PNMailItem = ^TNMailItem;

  pTNakedAbility=^TNakedAbility;
  TNakedAbility =record
    DC    :Word;
    MC    :Word;
    SC    :Word;
    AC    :Word;
    MAC   :Word;
    HP    :Word;
    MP    :Word;
    Hit   :Word;
    Speed :integer;
    X2    :byte;
  end;



  TShortMessage = record
    Ident    :Word;
    wMsg     :Word;
  end;

  TMessageBodyW = record
    Param1:Word;
    Param2:Word;
    Tag1:Word;
    Tag2:Word;
  end;

  TMessageBodyWL = record 
    lParam1    :Integer;
    lParam2    :Integer;
    lTag1      :Integer;
    lTag2      :Integer;
  end;

  TCharDesc =record
    Feature  :Integer;
    Status   :Integer;
    Level: Integer;
    HP: Integer;
    MaxHP: Integer;
    AddStatus:Integer;   //문파 마크
    AddStatus2:Integer;   //빼빼로
  end;

  pTTopInfo = ^TTopInfo;
  TTopInfo = packed record
    sChrName: string[ActorNameLen];
    sMasName: string[ActorNameLen];
    btJob: Byte;
    bySex: Byte;
    dwCount: LongWord;
  end;

  pTTopHeader = ^TTopHeader;
  TTopHeader = packed record
    btType: Byte;
    wCount: Word;
  end;

  TClientTopInfo = array[0..19] of TTopInfo;

  TClientGoods = record
    Name    :String;
    Price   :Integer;
    Stock   :Integer;
    Grade   :Integer;
    looks   :Integer;
    Amount  :Integer;  //물약
    modes   :Integer;  //물약
    Item: TClientItem;
  end;
  pTClientGoods=^TClientGoods;

  TShopInfo = record
    StdItem: pTSTDITEM;
    sIntroduce:array [0..50] of Char;
  end;
  pTShopInfo = ^TShopInfo;

  pTClientFriends=^TClientFriends;
  TClientFriends = record
    Id        :Word;
    Name      :String;
    Status    :Byte;
    Memo      :String;
    Blacklist :Boolean;
  end;

  pTAbility=^TAbility;
  TAbility= packed record
     Level              :Word;
     AC                 :DWord;
     MAC                :DWord;
     DC                 :DWord;
     MC                 :DWord;
     SC                 :DWord;
     HP                 :Word;
     MP                 :Word;
     MaxHP              :Word;
     MaxMP              :Word;
     Exp                :DWord;
     MaxExp             :DWord;
     Weight             :Word;
     MaxWeight          :Word;
     WearWeight         :Word;
     MaxWearWeight      :Word;
     HandWeight         :Word;
     MaxHandWeight      :Word;
     KillPointCurr      :Integer;
     DeathPointCurr     :Integer;
     KillPoint          :Integer;
     DeathPoint         :Integer;
  end;

  //---------------------------------------------

type
  TProgamType=(tDBServer,tLoginSrv,tLogServer,tM2Server,tLoginGate,
    tLoginGate1,tSelGate,tSelGate1,tRunGate,tRunGate1,tRunGate2,
    tRunGate3,tRunGate4,tRunGate5,tRunGate6,tRunGate7, tRanking, tMir2);    //수정되었습니다.

  TRecordHeader = packed record
     sAccount:String[16];
     sChrName:String[20];
     boIsHero: Boolean;
     nSelectID:integer;
     dCreateDate:TDateTime;
     boDeleted:boolean;
     UpdateDate:TDateTime;
     CreateDate:TDateTime;
  end;

  THumInfo = record
     boDeleted:Boolean;
     boSelected:Boolean;
     sAccount:String[10];
     dModDate:TDateTime;
     sChrName:String[20];
     btCount:Byte;
     Header:TRecordHeader;
     boIsHero: Boolean;
  end;

  pTUserItem=^TUserItem;
  TUserItem=record                         //=24
    MakeIndex       :Integer;              //+4
    wIndex          :Word;                 //+2
    Dura            :word;                 //+2
    DuraMax         :Word;                 //+2
    btValue         :TValue; //+16
    MaxDate         :Integer;
    Amount          :Integer;
  end;

  TItemCount = Integer;

  TDuelItem = packed record //鯨濫
    boFinish: Boolean; //鯨濫供냥
    boDelete: Boolean;
    btDuel: Byte;
    sOwnerName: string[ACTORNAMELEN];
    sDuelName: string[ACTORNAMELEN];
    UserItem: TUserItem;
    n01: Integer;
    n02: Integer;
    nIndex: Integer;
  end;
  pTDuelItem = ^TDuelItem;

  TDuel = packed record //鯨濫
    boDelete: Boolean;
    boVictory: Boolean; //價적
    sCharName: string[ACTORNAMELEN];
    nDuelGold: Integer;
    nItemCount: Integer;
    n01: Integer;
    n02: Integer;
  end;
  pTDuel = ^TDuel;

  TDuelInfo = packed record //鯨濫
    boDelete: Boolean;
    btDuel: Byte;
    SaveDateTime: TDateTime;
    Owner: TDuel; //寮땡鯨濫훙
    Duel: TDuel; //굳땡鯨濫훙
    boFinish: Boolean; //鯨濫供냥
    n03: Integer;
    n04: Integer;
    nIndex: Integer;
  end;
  pTDuelInfo = ^TDuelInfo;
  
  pTUserMagic=^TUserMagic;
  TUserMagic=record
    MagicInfo:pTMagic;
    btLevel:byte;
    wMagIdx:word;
    nTranPoint:integer;
    btKey:byte;
  end;

  TAucItem = record               //경매
    Str: String;
    nTime: Integer;
    Price: Integer;
    APrice: Integer;
    Seller: String[ActorNameLen];
    Solder: String[ActorNameLen];
    Item: TClientItem;
  end;
  pTAucItem = ^TAucItem;

  TAucbuffItem = record         //경매
    Str: String;
    nTime: Integer;
    Price: Integer;
    APrice: Integer;
    Seller: String[ActorNameLen];
    Solder: String[ActorNameLen];
    Item: TClientItem;
  end;
  pTAucbuffItem = ^TAucbuffItem;


  TItemIndex = record     //개인상점
    btSellType: Byte;
    ItemName: string[30];
    MakeIndex: Integer;
    Price: Integer;
  end;
  pTItemIndex = ^TItemIndex;

  TStoreServerItem = record         //개인상점
    btSellType: Byte;
    Price: Integer;
    UserItem: TUserItem;
  end;
  pTStoreServerItem = ^TStoreServerItem;

  TStoreItem = record                //개인상점
    btSellType: Byte;
    Item: TClientItem;
  end;
  pTStoreItem = ^TStoreItem;

  TUserStoreStateInfo = record       //개인상점
    RecogId: Integer;
    UserName: string[30];
    NAMECOLOR: Integer;
    SellMsg: string[30];
    UseItems: array[0..15] of TStoreItem;
  end;
  pTUserStoreStateInfo = ^TUserStoreStateInfo;

  pTLover=^TLover;
  TLover = record
    Lover           :String[ActorNameLen];
    StartDate       :TDateTime;
    TotalDays       :Integer;
    boHasLover      :Boolean;
  end;
       
  pTMaster=^TMaster;      //사제
  TMaster = record
    Master         :String[ActorNameLen];
    StartDate      :TDateTime;
    TotalDays      :Integer;
    MasterLevel    :Byte; //사제
    boHasMaster    :Boolean;
  end;


  pTClientGT=^TClientGT;
  TClientGT = record
    Number          :byte;
    GuildName       :String[GuildNameLen];
    GuildMasters    :Array[0..1] of String[ActorNameLen];
    SalePrice       :Integer;
    Status          :byte;//0=normal, 1= onsale, 2= sold, pending activation
  end;

  pTDecoItem=^TDecoItem;
  TDecoItem = record
    Appr            :Word;
    Name            :String[20];
    Price           :integer;
    Location        :byte;
  end;

  THumanUseItems=array[0..MAXUSEITEM] of TUserItem;
  THumItems=array[0..MAXUSEITEM] of TUserItem;
  pTHumItems=^THumItems;

  THeroItems = array[0..MAXHEROUSEITEM] of TUserItem;
  pTHeroItems = ^THeroItems;


  pTBagItems=^TBagItems;
  TBagItems=array[0..MAXBAGITEM] of  TUserItem;

  pTStorageItems=^TStorageItems;         //창고
  TStorageItems=array[0..STORAGELIMIT] of TUserItem;

  pTHumMagic=^THumMagic;
  THumMagic=Array[0..HOWMANYMAGICS-1] of TUserMagic;

  pTAutoItems = ^TAutoItems;
  TAutoItems = array[0..1] of TUserItem;

  pTHumMagicInfo=^THumMagicInfo;
  THumMagicInfo=TUserMagic;

  TStatusTime=array [0..MAX_STATUS_ATTRIBUTE - 1] of Word;     //스테이트

  TUseItemNames = array[0..12] of string[16];
  pTUseItemNames = ^TUseItemNames;

  TQuestUnit=array[0..13] of Byte;
  TQuestFlag=array[0..104] of Byte;

  pTMissionInfo = ^TMissionInfo;
  TMissionInfo = packed record
    sMissionName: String[MapNameLen];
    btKillCount1: Byte;
    btKillCount2: Byte;
    boTrack: Boolean;
    wTime: Word;
  end;

  TMissionFlag = array[0..99] of Byte;
  TMissionInfos = array[1..20] of TMissionInfo;
  TMissionArithmometer = array[0..19] of Byte;
  TMissionIndex = array[0..99] of Byte;

  pTHumData=^THumData;
  THumData = packed record       //3164
    sChrName        :String[ActorNameLen];
    sCurMap         :String[MapNameLen];
    wCurX           :Word;
    wCurY           :Word;
    btDir           :Byte;
    btHair          :Byte;
    btSex           :Byte;
    btJob           :Byte;
    nGold           :Integer;

    Abil            :TAbility;         //+40
    wStatusTimeArr  :TStatusTime;  //스테이트
    sHomeMap        :String[MapNameLen];
    wHomeX          :Word;
    wHomeY          :Word;
    BonusAbil       :TNakedAbility;     //+20
    nBonusPoint     :Integer;
    btAiMode        :Byte;
    btReLevel       :Byte;

    //boStoragePwd    :Boolean;       //창고비번
    sStoragePwd     :String[6];    //창고비번

    xLoveInfo       :TLover;       //연인
    xMasterInfo     :TMaster;      //멘토

    nGameGold       :Integer;
    nBankGold       :Integer;
    nGamePoint      :Integer;
    nPCPoint        :Integer;
    nPKPoint        :Integer;   //피케이

    nKillPoint      :Integer;  //킬/데스
    nDeathPoint     :Integer;  //킬/데스

    btAllowGroup    :Byte;
    btAttatckMode   :Byte;     //공격 모드
    btIncHealth     :Byte;
    btIncSpell      :Byte;
    btIncHealing    :Byte;
    btFightZoneDieCount:Byte;
    sAccount        :String[16];
    boLockLogon     :Boolean;       //접속비번
    sLogonPwd       :String[10];    //접속비번

    nMasterUpExp    :Integer;
    boAllowGuildReCall:Boolean;
    wGroupRcallTime :Word;
    dBodyLuck       :TDateTime;
    boAllowGroupReCall:Boolean;  //그룹 요청
    QuestUnitOpen   :TQuestUnit;
    QuestUnit       :TQuestUnit;
    QuestFlag       :TQuestFlag;

    MissionFlag        :TMissionFlag;                   //퀘스트
    MissionInfo        :TMissionInfos;                  //퀘스트
    MissionArithmometer:TMissionArithmometer;    //퀘스트
    MissionIndex       :TMissionIndex;                 //퀘스트

    HumItems        :THumItems;
    BagItems        :TBagItems;
    Magic           :THumMagic;
    StorageItems    :TStorageItems;    //창고

    boIsHero: Boolean; //Is a hero         //영웅인지
    btStatus: Byte;                        //영웅공격모드
    btHeroAutoDurg: Byte;                   //자동물약 사용하는지
    sHeroChrName: string[ACTORNAMELEN];    //영웅이름
    sMasterName: string[ACTORNAMELEN];
    nHeroGrade: Byte;           //영웅등급
    btLimitLevel: Byte;        //영웅레벨제한
    AutoItems: TAutoItems;     //영웅 자동물약칸
  end;

  THumDataInfo= packed record
    Header:TRecordHeader;
    Data:THumData;
  end;

  pTGlobaSessionInfo=^TGlobaSessionInfo;
  TGlobaSessionInfo=record
     sAccount:String[16];
     nSessionID:integer;
     boLoadRcd:Boolean;
     boStartPlay:Boolean;
     sIPaddr:String[15];
     n24:integer;
     dwAddTick:DWord;
     dAddDate:TDateTime;
  end;

  TCheckCode = packed record
     dwThread0:DWord;
     sThread0:String;
  end;

  TAccountDBRecord = record
     Header:TRecordHeader;
     nErrorCount:integer;
     dwActionTick:DWord;
     UserEntry:TUserEntry;
     UserEntryAdd:TUserEntryAdd;
  end;


  pTConnInfo=^TConnInfo;
  TConnInfo=record

  end;

  pTQueryChr=^TQueryChr;
  TQueryChr=packed record
    btClass:Byte;
    btHair:Byte;
    btGender:Byte;
    btLevel:Byte;
    sName:String[ActorNameLen];
  end;


  pTMsgHeader=^TMsgHeader;
  TMsgHeader = record
    dwCode:DWord;
    nSocket:integer;
    wGSocketIdx:word;
    wIdent:word;
    wUserListIndex:word;
    nLength:integer;
  end;

  pTBBSMSGL = ^TBBSMSGL;       //장원게시판
  TBBSMSGL = record
    index:integer;
    Sticky:Boolean;
    Poster:String[ActorNameLen];
    Msg:String;
    MasterIndex: integer;
  end;

  pTBBSMSG  = ^TBBSMSG;           //장원게시판
  TBBSMSG = record
    index:integer;
    Sticky:Boolean;
    Poster:String[ActorNameLen];
    Msg:String[40];
    MasterIndex: integer;
  end;

//M2Server

Const

  GROUPMAX        = 13;      //그룹원 최대 13

  CM_PASSWORD     = 2001;
  CM_CHGPASSWORD  = 2002;
  CM_SETPASSWORD  = 2004;

  CM_HORSERUN     = 3035;
  CM_CRSHIT       = 3036;   //광풍참
  CM_BOW          = 3039; //궁수
  CM_TWINHIT      = 3038;
  CM_BALDO        = 3093;     //발도술
  CM_DOWN         = 3091; //월영술
  CM_DOWNRUN      = 3089; //월영술
  CM_QUERYUSERSET = 3040;
  CM_BALDO2       = 3094;     //발도술

  CM_NANCRSHIT    = 3100;  //난화혈풍참

  CM_CPOWERHIT = 3095;
  CM_CFIREHIT  = 3096;
  CM_THUNDERHIT = 3062;
  CM_FIRESHAOLIN = 3063;
  CM_CRBHIT      = 3067;      //회풍천봉법

  SM_PLAYDICE    = 8001;
  SM_SHOWEFFECT  = 8002;
  SM_GROUPINFO1  = 5259;
  SM_GROUPINFO2  = 5260;

  DATA_BUFSIZE        = {8192;//}1024;    //사이즈오브휴먼

  DEFSAYLISTWIDTH     = 386;

  RUNGATEMAX          = 8;

  MAXMAGIC             = 54;
  MAXFRIENDS           = 22;

  PN_GETRGB            = 'GetRGB';
  PN_GAMEDATALOG       = 'GameDataLog';
  PN_SENDBROADCASTMSG  = 'SendBroadcastMsg';

  sSTRING_GOLDNAME     = '쏜귑';
  sSTRING_GAMEGOLDNAME = '듐환';
  MAXGUILDLEVEL        = 35; //문파성장
  MAXLEVEL             = 500;
  SLAVEMAXLEVEL        = 50;

  MAXSAYITEMCOUNT = 1000;

  LOG_GAMEGOLD         = 30;
  LOG_GAMEPOINT        = 31;


  RC_PLAYOBJECT  = 0;
  RC_GUARD       = 11;
  RC_MOVEGUARD   = 13;
  RC_PEACENPC    = 15;
  RC_ANIMAL      = 50;
  RC_MONSTER     = 80;
  RC_NPC         = 10;
  RC_ARCHERGUARD = 112;
  RC_PET         = 240; //영물
  RC_HEROOBJECT  = 255; //영웅


  RM_TURN              = 10001;
  RM_WALK              = 10002;   //걷기
  RM_HORSERUN          = 50003;
  RM_RUN               = 10003;
  RM_HITLEFT           = 10004; //왼쪽
  RM_HIT               = 10006;
  RM_BIGHIT            = 10007;
  RM_HEAVYHIT          = 10008;
  RM_SPELL             = 10048;
  RM_POWERHIT          = 10009;    //예도검법
  RM_MOVEFAIL          = 10010;
  RM_LONGHIT           = 10011;
  RM_WIDEHIT           = 10012;
  RM_FIREHIT           = 10014;
  RM_CRSHIT            = 10015;     //광풍참
  RM_SITDOWN           = 10016;

  RM_CPOWERHIT         = 10017;
  RM_CFIREHIT          = 10018;
  RM_TAGUHIT           = 10020;
  RM_DEATH             = 10021;
  RM_DOWN              = 10023; //월영술
  RM_SKELETON          = 10024;

  RM_FISHING1           =10030;      //낚시
  RM_FISHING2           =10031;      //낚시
  RM_DEATHHIT          = 10037;     //살생도
  RM_WBHIT             = 10044;    //풍검술
  RM_WBHIT2            = 10047;     //풍검술
  RM_SPEEDRUN          = 10049;    //경신보
  RM_DOWNRUN           = 10057; //월영술
  RM_NANCRSHIT         = 10177; //난화혈풍참

  RM_CURSE             = 10042; // 저주술


  RM_LOGON             = 10050;
  RM_ABILITY           = 10051;
  RM_HEALTHSPELLCHANGED= 10052;
  RM_DAYCHANGING       = 10053;
  RM_81                = 10054;
  RM_82                = 10055;
  RM_83                = 10056;
  RM_84                = 10058;
  RM_85                = 10059;
  RM_86                = 10061;
  RM_CHANGEFAMEPOINT   = 10188;    //킬/데스 변화(2010/12/05)
  RM_CHANGEFAMEPOINT2  = 10189;    //킬/데스 변화(2010/12/05)
  RM_MAGICMOVE         = 20101;
  RM_10101             = 10101;
  RM_WEIGHTCHANGED     = 10115;
  RM_FEATURECHANGED    = 10116;
  RM_BUTCH             = 10119;
  RM_MAGICFIRE         = 10120;
  RM_MAGICFIREFAIL     = 10121;
  RM_SENDMYMAGIC       = 10122;
  RM_MAGIC_LVEXP       = 10123;
  RM_SOUND             = 10124;
  RM_DURACHANGE        = 10125;
  RM_MERCHANTDLGCLOSE  = 10127;
  RM_SENDGOODSLIST     = 10128;
  RM_SENDUSERSELL      = 10129;
  RM_SENDBUYPRICE      = 10130;
  RM_USERSELLITEM_OK   = 10131;
  RM_USERSELLITEM_FAIL = 10132;
  RM_BUYITEM_SUCCESS   = 10133;
  RM_BUYITEM_SUCCESS2  = 50133;
  RM_AUCTIONGIVE       = 11133;
  RM_BUYITEM_FAIL      = 10134;

  RM_POINTCHANGED      = 10135;

  RM_GOLDCHANGED       = 10136;
  RM_CHANGELIGHT       = 10137;
  RM_LAMPCHANGEDURA    = 10138;
  RM_CHARSTATUSCHANGED = 10139;
  RM_GROUPCANCEL       = 10140;   //그룹 캔슬
  RM_SENDUSERREPAIR    = 10141;

  RM_SETPASSWORD       = 10152;      //창고암호
  RM_INPUTPASSWORD     = 10558;      //창고암호

  RM_SENDITEMLOCK      = 10445;
  RM_USERITEMLOCK_OK   = 10446;
  RM_USERITEMLOCK_FAIL = 10447;

  RM_SENDUSERSREPAIR   = 50142;
  RM_SENDREPAIRCOST    = 10142;
  RM_USERREPAIRITEM_OK = 10143;
  RM_USERREPAIRITEM_FAIL=10144;
  RM_USERSTORAGEITEM   = 10146;
  RM_USERGETBACKITEM   = 10147;
  RM_SENDDELITEMLIST   = 10148;

  RM_MAKEDRUG_SUCCESS  = 10150;
  RM_MAKEDRUG_FAIL     = 10151;
  RM_ALIVE             = 10153;

  RM_SENDUSERMAKEITEMLIST = 10156;        //제조스쳐

  RM_10155             = 10155;

  RM_SENDUSERWAKEUP    = 10551;
  SM_SENDUSERWAKEUP    = 10552;

  RM_SENDWAKECOST = 10145;
  RM_SENDUSERWAKE = 11110;
  RM_USERITEMWAKE_OK = 10448;
  RM_USERITEMWAKE_FAIL = 10449;

  RM_SENDRESTORECOST = 11111;
  RM_SENDUSERRESTORE = 11112;
  RM_USERITEMRESTORE_FAIL = 11114;

  //각성분해
  RM_PRICEDISASSEMBLE  = 10158;
  RM_SENDUSERDISASSEMBLE = 10159;
  RM_DISASSEMBLE_OK    = 10160;
  RM_DISASSEMBLE_FAIL  = 10161;

  //일반분해
  RM_PRICEDISMANTLE    = 10162;
  RM_SENDUSERDISMANTLE = 10163;
  RM_DISMANTLE_OK      = 10164;

  RM_SHOWRANKNAME      = 15232;
  RM_DIGUP             = 10200;
  RM_DIGDOWN           = 10201;
  RM_FLYAXE            = 10202;
  RM_LIGHTING          = 10204;
  RM_10205             = 10205;
  RM_LIGHTING_1        = 10209;   //비월소호
  RM_LIGHTING_2        = 10210;
  RM_LIGHTING_3        = 10211;
  RM_HEMORRHAGE_STRUCK = 10217;
  RM_FOXSTATE          = 10212;

  RM_THUNDER_STRUCK    = 10218;

  RM_LIGHTING_4        = 10213;
  RM_LIGHTING_5        = 10214;
  RM_LIGHTING_6        = 10215;
  RM_LIGHTING_7        = 10216;

  RM_CHANGEGUILDNAME   = 10301;
  RM_SUBABILITY        = 10302;
  RM_BUILDGUILD_OK     = 10303;
  RM_BUILDGUILD_FAIL   = 10304;
  RM_DONATE_OK         = 10305;
  RM_DONATE_FAIL       = 10306;


  RM_ALIVEREQ          = 10307;
  RM_MENU_OK           = 10309;
  RM_SIMPLE_OK         = 10310;

  RM_HOMEMOVE          = 10312;

  RM_GUILDMARK_OK      = 10313;    //문파 마크
  RM_GUILDMARK_FAIL    = 10314;

  RM_RECONNECTION      = 10332;
  RM_HIDEEVENT         = 10333;
  RM_SHOWEVENT         = 10334;

  RM_10401             = 10401;
  RM_OPENHEALTH        = 10410;
  RM_CLOSEHEALTH       = 10411;
  RM_BREAKWEAPON       = 10413;
  RM_CHANGEFACE        = 10415;
  RM_PASSWORD          = 10416;

  RM_ME_DBGETLIST         = 10420;  // 사제 리스트원함
  RM_ME_DBDELETE          = 10421;  // 사제 리스트원함
  RM_ME_LOGOUT            = 10422;  // 사제 리스트원함

  RM_LM_DBDELETE          = 10423;  // 연인 리스트원함
  RM_LM_DBGETLIST         = 10424;  // 연인 리스트얻음
  RM_LM_LOGOUT            = 10425;  // 연인 종료를 알려줌


  RM_DRAGON_EXP        = 10430;  // 용시스템에 경험치 준다.    //마룡
  RM_LOOPNORMALEFFECT  = 10431;  //소생 임펙트 효과

  RM_PLAYDICE          = 10500;

  RM_SHOWEFFECT        = 10501;
  //2003/02/11 그룹원 위치 정보
  RM_GROUPPOS             = 11010;
  // 카운트 아이템
  RM_COUNTERITEMCHANGE    = 11011;
  RM_CANCLOSE_OK          = 11024;
  RM_CANCLOSE_FAIL        = 11025;

  RM_HEAR              = 11001;
  RM_WHISPER           = 11002;
  RM_CRY               = 11003;
  RM_SYSMESSAGE        = 11004;
  RM_GROUPMESSAGE      = 11005;      //그룹 메시지
  RM_SYSMESSAGE2       = 11006;
  RM_GUILDMESSAGE      = 11007;
  RM_SYSMESSAGE3       = 11008;
  RM_MERCHANTSAY       = 11009;
  RM_MOVEMESSAGE       = 10240;     //화면공지
  RM_GUILDAILLY        = 11241;
  RM_EXPRATE           = 7998;
  RM_GROUPCALL         = 7999;
  RM_ATTATCKMODE       = 8000;




  RM_ZEN_BEE           = 8020;
  RM_DELAYMAGIC        = 8021;
  RM_STRUCK            = 8018;
  RM_MAGSTRUCK_MINE    = 8030;
  RM_MAGHEALING        = 8034;
  RM_BOW               = 10029;
  RM_DEFSOCKET         = 8035;
  RM_DEFMESSAGE        = 8036;
  RM_POISON            = 8037;
  
  RM_DOOPENHEALTH      = 8040;
  RM_SPACEMOVE_FIRE2   = 8042;
  RM_DELAYPUSHED       = 8043;
  RM_MAGSTRUCK         = 8044;
  RM_TRANSPARENT       = 8045;

  RM_DOOROPEN          = 8046;
  RM_DOORCLOSE         = 8047;
  RM_DISAPPEAR         = 8061;
  RM_SPACEMOVE_FIRE    = 8062;
  RM_SENDUSEITEMS      = 8074;
  RM_WINEXP            = 8075;
  RM_ADJUST_BONUS      = 8078;
  RM_ITEMSHOW          = 8082;
  RM_GAMEGOLDCHANGED   = 8084;
  RM_ITEMHIDE          = 8085;
  RM_LEVELUP           = 8086;
  RM_LEVELUP2          = 8088;   //등선변환
  RM_LEVELUP3          = 8089;   //보너스포인트

  RM_CHANGENAMECOLOR   = 8090;
  RM_PUSH              = 8092;


  RM_CHANGEMAP2        = 8096;

  RM_CLEAROBJECTS      = 8097;
  RM_CHANGEMAP         = 8098;
  RM_SPACEMOVE_SHOW2   = 8099;
  RM_SPACEMOVE_SHOW    = 8100;
  RM_USERNAME          = 8101;

  RM_STRUCK_MAG        = 8103;
  RM_RUSH              = 8104;
  RM_RUSHKUNG          = 8105;

  RM_TWINHIT           = 9042;
  RM_BALDO             = 9045; //발도술
  RM_BALDO2            = 9050; //발도술
  RM_ToSendMsg         = 9051;//발도술

  RM_THUNDERHIT        = 9052;//뇌룡봉법
  RM_FIRESHAOLIN       = 9053;//천화봉법
  RM_CRBHIT            = 9054;//회풍천봉법

  RM_LM_WHISPER        = 10060;    //연인 귓속말
  RM_ME_WHISPER        = 10062;    //사제 귓속말

  RM_GETMAKEGEMLIST    = 9044;
  RM_SPACEMOVE_SHOW3   = 9045;//일섬이동
  RM_SPACEMOVE_FIRE3   = 9046;//일섬이동
  RM_SPACEMOVE_SHOW4   = 9047;
  RM_SPACEMOVE_HIDE3   = 9048;
  OS_EVENTOBJECT       = 1;
  OS_MOVINGOBJECT      = 2;
  OS_ITEMOBJECT        = 3;
  OS_GATEOBJECT        = 4;
  OS_MAPEVENT          = 5;
  OS_DOOR              = 6;
  OS_ROON              = 7;

   //영웅시스템
  RM_QUERYBAGITEMS     = 30001;
  RM_MAKEGHOST         = 30004;
  RM_HEROLOGOUT        = 30005;

  RM_HEROLOGON         = 30024;
  RM_HEROLOGON_OK      = 30025;

  RM_HEROCREATE        = 30041;
  RM_QUERYAUTOITEMS    = 30096;

  SM_HEROAUTOITEMS   = 5095;
  SM_HERODELMAGIC    = 6500;
  SM_HEROWINEXP      = 6512;
  SM_HEROLEVELUP     = 6514;
  SM_HEROLOGON       = 6515;
  SM_HEROADDMAGIC    = 6516;

  SM_HEROUPDATEITEM  = 6517;
  SM_SENDHEROUSEITEMS= 6518;
  SM_HERODELITEMS    = 6519;
  SM_HERODELITEM     = 6520;
  SM_HEROADDITEM     = 6521;
  SM_HEROADDITEM2    = 6165; //영웅 물약
  SM_SENDMYHEROMAGIC = 6522;

  SM_HEROBAGITEMS    = 6523;
  SM_HEROBAGITEMS2   = 6524;

  SM_HEROLOGOUT_OK   = 6525;
  SM_HEROLOGON_OK    = 6526;
  SM_HEROLOGOUT      = 6527;
  SM_HERODURACHANGE  = 5185;

  SM_HEROABILITY     = 6528;
  SM_HEROSUBABILITY  = 6529;
  SM_HEROWEIGHTCHANGED = 6190;
  SM_HEROEAT_OK      = 7000;          //넜땜鮫냥묘
  SM_HEROEAT_FAIL    = 7001;          //넜땜鮫呵겨
  SM_HEROCREATE      = 5222; //영웅 고용창
  SM_HEROINFO        = 5224;

  SM_HEROTAKEON_OK   = 5174;
  SM_HEROTAKEON_FAIL = 5175;
  SM_HEROTAKEOFF_OK  = 5176;
  SM_HEROTAKEOFF_FAIL = 5177;

  SM_MASTERBAGTOHEROBAG_OK = 5150; //주인 > 영웅 가방으로
  SM_MASTERBAGTOHEROBAG_FAIL = 5151; //주인 > 영웅 가방 이동 실패

  SM_HEROBAGTOMASTERBAG_OK = 5152; //영웅 > 주인 가방으로
  SM_HEROBAGTOMASTERBAG_FAIL = 5153; //영웅 > 주인 가방 이동 실패
  SM_HEROMAGIC_LVEXP = 5191;
  SM_HEROAIMODE      = 5192;
  SM_HEROBAGCOUNT    = 5162;
  SM_HEROBUFF        = 5814;
  SM_AUTODELITEM_OK    = 4072;
  SM_AUTODELITEM_FAIL  = 4073;

  SM_AUTOADDITEM_OK    = 4074;
  SM_AUTOADDITEM_FAIL  = 4075;
  SM_ADDHEROAUTO       = 4078;
  SM_HEROAUTODELITEM   = 5093;
  SM_HEROAUTOADDITEM   = 5094;

  SM_DELHEROITEM      = 5097;

  SM_HEROSTORAGEITEMS    = 5098;
  SM_HEROSTORAGEITEMS2   = 5099;

  SM_HERO_STORAGE_OK     = 5193;
  SM_HERO_STORAGE_FULL   = 5194;
  SM_HERO_STORAGE_FAIL   = 5195;
  SM_ADDHEROSTORAGE      = 5196;
  SM_ADDHEROSTORAGEITEM  = 5197;

  SM_HERO_TAKEBACKSTORAGEITEM_OK      = 5705;
  SM_HERO_TAKEBACKSTORAGEITEM_FAIL    = 5706;
  SM_HERO_TAKEBACKSTORAGEITEM_FULLBAG = 5707;

  CM_NEWHERO         = 5223;
  CM_HEROLOGON_OK    = 5203;
  CM_HEROLOGON       = 5135;   //영웅 소환
  CM_HEROLOGOUT      = 5136;  //영웅 소환해제
  CM_QUERYHEROBAGITEMS = 5216;
  CM_HEROPROTECT     = 5204;
  CM_HEROTARGET      = 5146;
  CM_HEROTURN        = 5326;
  CM_HEROSPELL       = 6065;

  CM_HEROSEPARITEM   = 5221;     //영웅 가방 물약 분리
  CM_HEROBUNDLEITEM  = 5226; //영웅 물약 합치기
  CM_HEROBUNDLESTORAGEITEM = 5227;
  CM_HEROEAT         = 5145;
  CM_HEROAUTOEAT     = 5092;
  CM_HEROTAKEONITEM  = 5139; //亶衿누陋구
  CM_HEROTAKEOFFITEM = 5140; //亶衿錮陋구
  CM_MASTERBAGTOHEROBAG = 5137; //주인 > 영웅 가방으로
  CM_HEROBAGTOMASTERBAG = 5138; //영웅 > 주인 가방으로
  CM_HEROMAGICKEYCHANGE = 5149;
  CM_HEROAI = 5330;
  CM_HEROCALL = 5209;
  CM_HEROBACKCALL = 5210;
  CM_MASTERDEFEN = 5225;   //영웅 수호

  CM_AUTOADDITEM        = 4077;
  CM_AUTODELITEM        = 4076;
  CM_HEROUPGRADEIT      = 7078;
  CM_GEMHEROITEM        = 7079;
  CM_HEROSTORAGEITEM    = 7080;
  CM_HEROTAKEBACKSTORAGEITEM = 7081;
  //무공
    //무공
  SKILL_FIREBALL       = 1;  //화염장
  SKILL_HEALLING       = 2;  //회복술
  SKILL_ONESWORD       = 3;  //외수검법
  SKILL_ILKWANG        = 4;  //일광검법
  SKILL_FIREBALL2      = 5;  //금강화염장
  SKILL_AMYOUNSUL      = 6;  //암연술
  SKILL_YEDO           = 7;  //예도검법
  SKILL_FIREWIND       = 8;  //화염풍
  SKILL_FIRE           = 9;  //염사장
  SKILL_SHOOTLIGHTEN   = 10; //뢰인장
  SKILL_LIGHTENING     = 11; //강격
  SKILL_ERGUM          = 12; //어검술
  SKILL_FIRECHARM      = 13; //폭살계
  SKILL_HANGMAJINBUB   = 14; //항마진법
  SKILL_DEJIWONHO      = 15; //대지원호
  SKILL_HOLYSHIELD     = 16; //결계
  SKILL_SKELLETON      = 17; //백골소환술
  SKILL_CLOAK          = 18; //은신술
  SKILL_BIGCLOAK       = 19; //대은신술
  SKILL_TAMMING        = 20; //뢰혼격
  SKILL_SPACEMOVE      = 21; //아공행법
  SKILL_EARTHFIRE      = 22; //지염술
  SKILL_FIREBOOM       = 23; //폭열파
  SKILL_LIGHTFLOWER    = 24; //뢰설화
  SKILL_BANWOL         = 25; //반월검법
  SKILL_FIRESWORD      = 26; //염화결
  SKILL_MOOTEBO        = 27; //무태보
  SKILL_SHOWHP         = 28; //탐기파연
  SKILL_BIGHEALLING    = 29; //대회복술
  SKILL_SINSU          = 30; //신수소환
  SKILL_SHIELD         = 31; //주술의막
  SKILL_KILLUNDEAD     = 32; //사자윤회
  SKILL_SNOWWIND       = 33; //빙설풍
  SKILL_CROSSMOON      = 34; //광풍참
  SKILL_FLAMEDIS       = 35; //멸천화
  SKILL_ENHANCER       = 36; //무극진기
  SKILL_ENERGYREPULSOR = 37; //기공파
  SKILL_TWINBLADE      = 38; //쌍룡참
  SKILL_FROST          = 39; //결빙장
  SKILL_PURI           = 40; //정화술
  SKILL_ANGEL          = 41; //정혼소환술
  SKILL_MIRROR         = 42; //분신술
  SKILL_LION           = 43; //사자후
  SKILL_BLADEAV        = 44; //공파섬
  SKILL_FLAMEFIELD     = 45; //화룡기염
  SKILL_CURSE          = 46; //저주술
  SKILL_ENTRAP         = 47; //포승검
  SKILL_VAMP           = 48; //흡혈술
  SKILL_HALLUC         = 49; //미혼술
  SKILL_RAGE           = 50; //첨기폭
  SKILL_PROTECTIONFIELD= 51; //호신기막
  SKILL_ICESHOWER      = 52; //천상빙환
  SKILL_FIRESHOWER     = 53; //천상낙염
  SKILL_RESURRECTION   = 54; //소생술
  SKILL_MASSPOISON     = 55; //독무
  SKILL_REDBANWOL      = 56; //일섬
  SKILL_WINDSTAINED    = 57; //빙염술
  SKILL_SUNCHEN        = 58; //선천기공
  SKILL_JEOLMYEONG     = 59; //절명검법
  SKILL_WINDBLADE      = 60; //풍검술
  SKILL_BODDYWIND      = 61; //체신풍
  SKILL_BALDO          = 62; //발도술
  SKILL_CHUNSWORD      = 63; //천이검
  SKILL_FIREWINDSWORD  = 64; //열풍격
  SKILL_POBAKCUSTAIN   = 65; //포박술
  SKILL_MOONSHADOW     = 66; //월영술
  SKILL_VAMPMANA       = 67; //흡기
  SKILL_KYEONGSIN      = 68; //경신보
  SKILL_PUNGSIN        = 69; //풍신술
  SKILL_POISONBLADE    = 70; //맹독검기
  SKILL_SHADOW         = 71; //열화신
  SKILL_MOONBLADE      = 72; //월하난무
  SKILL_CHENMU         = 73; //천무
  SKILL_ABYSS          = 74; //심연술
  SKILL_ANGUISH        = 75; //번뇌의
  SKILL_BLOODWIND      = 76; //혈풍격
  SKILL_BLOODSWORD     = 77; //혈룡검법
  SKILL_SKYSWORD       = 78; //천상비술
  SKILL_BLOODWATER     = 79; //혈룡수
  SKILL_CATSWORD       = 80; //묘설란
  SKILL_KUMGANG        = 81; //금강불괴
  SKILL_ROESEON        = 82; //뢰선풍
  SKILL_OHAENG         = 83; //음양오행진
  SKILL_YEONGMU        = 84; //월영무
  SKILL_BLASTHIT       = 85; //참진격
  SKILL_ICESHOT        = 86; //빙뇌천
  SKILL_TAEGEUK        = 87; //태극진
  SKILL_FINALBUN       = 88; //일격비
  SKILL_AUTHENTICITY   = 89; //진위보
  SKILL_MAGSPACEMOVE   = 90; //이형환위
  SKILL_STING          = 91; //독침술
  SKILL_SUMMON         = 92; //격공섭물
  SKILL_SUPERSWORD     = 93; //빙월격    - 전사
  SKILL_HELL           = 94; //만천염옥  - 술사
  SKILL_HEATHRECOVERY  = 95; //흡성대법  - 도사
  SKILL_SPELLRECOVERY  = 96; //강마진법  - 도사
  SKILL_SURAKANGRIM    = 97; //수라강림  - 자객
  SKILL_PENETRATE      = 98; //망자의눈  - 공통
  SKILL_WINDMOON       = 99; //청풍명월  - 도사
  SKILL_BLOODMOON      = 100;//적혈무영  - 도사
  SKILL_DARKANGEL      = 101;//혼령소환술 - 도사
  SKILL_SHADOWTICK     = 102;//영적추 - 자객
  SKILL_CKWIND         = 103;//참격      - 전사
  SKILL_EYEFIELD       = 104;//뇌신혈    - 술사
  SKILL_TIGERHIT       = 105;//백호강타  - 도사
  SKILL_KYO            = 106;//교악      - 자객
  SKILL_SINGI          = 107;//신기묘산  - 전사
  SKILL_STOM           = 108;//운중뢰격  - 술사
  SKILL_CLOUD          = 109;//암독만계  - 도사
  SKILL_DEATHHIT       = 110;//살생도    - 자객
  SKILL_THUNDER        = 111;//낙뢰

  SKILL_GUKCHE         = 112;//격체전공  - 승려
  SKILL_SUNCHUNJIN     = 113;//선천진기  - 승려
  SKILL_TAGUBONG       = 114;//타구봉법  - 승려
  SKILL_SONICWAVE      = 115;//법륜연공  - 승려
  SKILL_EMBRACE        = 116;//나한기공  - 승려
  SKILL_THUNDERSHAILIN = 117;//뇌룡봉법  - 승려
  SKILL_PROTECTSHIELD  = 118;//호신강기  - 승려
  SKILL_FIRESHAOLIN    = 119;//천화봉법  - 승려
  SKILL_SUPERSHAOLIN   = 120;//고려무진봉- 승려
  SKILL_GREATWALL      = 121;//은형술    - 자객
  SKILL_THUNDERWAVE    = 122;//복호장    - 전사
  SKILL_THUNDERCLAP    = 123;//격공장    - 술사

  SKILL_CROSSBONG      = 124;//회풍천봉법- 도사
  SKILL_THUSHAOLIN     = 125;//직도황룡봉- 승려
  SKILL_JUCKSAL        = 126;//천인적살풍- 도사
  SKILL_BEGUEKJANG     = 127;//비격장 - 승려
  SKILL_FAHWANGBO      = 128;//파황보 - 승려
  SKILL_KANGHO         = 129;//강호술 - 승려
//============신규무공====================
  SKILL_UPREDBANWOL    = 130;//마혈광섬 - 전사
  SKILL_NANHWA         = 131;//난화혈풍참 - 전사
  SKILL_HWECHUN        = 132;//회천격 - 전사

  SKILL_FIREDRAGON     = 133;//화룡진풍 - 술사
  SKILL_CHUNSANG       = 134;//천상폭염 - 술사
  SKILL_THUNDERDOWN    = 135;//낙뢰천 - 술사

  SKILL_JINGOL         = 136;//진골소환술 - 도사
  SKILL_SUNCHUN        = 137;//선천 - 도사
  SKILL_CHUNGONG       = 138;//천공 - 도사

  SKILL_DARKDRAGON     = 139;//용솟음 - 자객
  SKILL_SURA           = 140;//수라천멸진 - 자객
  SKILL_NANMU          = 141;//마혈난무 - 자객

{       Embrace
  SKILL_BOWUP          = 112;//필중섬    - 궁수
  SKILL_CHUNBOW        = 113;//천일섬    - 궁수
  SKILL_MUABOW         = 114;//무아섬    - 궁수   }

  LA_UNDEAD            = 1;

  sENCYPTSCRIPTFLAG= '꼇列돛角痂척俚륜눔';
  sSTATUS_FAIL     = '+FAIL/';
  sSTATUS_GOOD     = '+GOOD/';
  nMAIL_LOCKED     = 1;
  nMAIL_SPECIAL    = 2;


  // Relationship Request Sequences...
  RsReq_None      = 0;        // 기본상태
  RsReq_WantToJoinOther = 1;        // 누구에게 참가신청을 함
  RsReq_WaitAnser = 2;        // 응답을 기다림
  RsReq_WhoWantJoin = 3;        // 누군가 참가를 원함
  RsReq_AloowJoin = 4;        // 참가를 허락함
  RsReq_DenyJoin  = 5;        // 참가를 거절함
  RsReq_Cancel    = 6;        // 취소

  RaReq_CancelTime  = 30 * 1000; // 자동 취소 시간 30초 msec
  MAX_WAITTIME      = 60 * 1000; // 최대 기다리는 시간
  // Relationship State Define...
  RsState_None      = 0;         // 기본상태
  RsState_Lover     = 10;        // 연인
  RsState_LoverEnd  = 11;        // 연인탈퇴
  RsState_Married   = 20;        // 결혼
  RsState_MarriedEnd = 21;        // 결혼탈퇴
  RsState_Master    = 30;        // 사부
  RsState_MasterEnd = 31;        // 사부탈퇴
  RsState_Pupil     = 40;        // 제자
  RsState_PupilEnd  = 41;        // 제자탈퇴
  RsState_TempPupil = 50;        // 임시제자
  RsState_TempPupilEnd = 51;        // 임시제자탈퇴

  // RelationShip Error Code...
  RsError_SuccessJoin   = 1;         // 참가에 성공하였다 ( 참가한사람쪽)
  RsError_SuccessJoined = 2;         // 참가에 성공되어졌다 ( 참가된 사람쪽)
  RsError_DontJoin      = 3;         // 참가할수 없다
  RsError_DontLeave     = 4;         // 떠날수 없다.
  RsError_RejectMe      = 5;         // 거부상태이다
  RsError_RejectOther   = 6;         // 거부상태이다
  RsError_LessLevelMe   = 7;         // 나의레벨이 낮다   또는 나의 레벨이 높다
  RsError_LessLevelOther = 8;         // 상대방의레벨이 낮다
  RsError_EqualSex      = 9;         // 성별이 같다
  RsError_FullUser      = 10;        // 참여인원이 가득찼다
  RsError_CancelJoin    = 11;        // 참가취소
  RsError_DenyJoin      = 12;        // 참가를 거절함
  RsError_DontDelete    = 13;        // 탈퇴시킬수 없다.
  RsError_SuccessDelete = 14;        // 탈퇴시켰음
  RsError_NotRelationShip = 15;        // 교제상태가 아니다.


  Error_SuccessJoin   = 1;         // 참가에 성공하였다 ( 참가한사람쪽)
  Error_SuccessJoined = 2;         // 참가에 성공되어졌다 ( 참가된 사람쪽)
  Error_DontJoin      = 3;         // 참가할수 없다
  Error_FullUserOther = 4;         // 이미 상대 사제 관계다
  Error_RejectOther   = 5;         // 거부상태이다
  Error_HighLevelMe   = 6;         // 나의 레벨이 높다
  Error_LessLevelOther = 7;        // 상대방의레벨이 낮다
  Error_FullUser      = 8;        // 이미 사제 관계다

  Error_CancelJoin    = 9;        // 참가취소
  Error_DenyJoin      = 10;        // 참가를 거절함
  Error_DontDelete    = 11;        // 탈퇴시킬수 없다.
  Error_SuccessDelete = 12;        // 탈퇴시켰음
  Error_NotRelationShip = 13;        // 교제상태가 아니다.
  Error_RejectBroken   = 14;         // 결별해서 1일 동안 안됨
  Error_RejectMeBroken = 15;        // 나결별
  Error_SuccessDelete2 = 16;        // 탈퇴시켰음


  EFFECT_DEADLINESS = 10; //괵샌
  EFFECT_VAMPIRE = 11; //俱沂
  EFFECT_MISSION_ACCEPT = 12; //쌈肝훨蛟
  EFFECT_MISSION_NEXT = 13; //꼍朧供냥
  EFFECT_MISSION_COMPLETE = 14; //훨蛟供냥
  EFFECT_DARE_WIN = 15; //鯨濫端죄
  EFFECT_DARE_LOSS = 16; //鯨濫渴죄
  EFFECT_BEACON_1 = 17;   //董즛
  EFFECT_BEACON_2 = 18;   //괜괜�薨�
  EFFECT_BEACON_3 = 19;   //崗굡쒔駱
  EFFECT_BEACON_4 = 20;   //寧懃寧雷
  EFFECT_BEACON_5 = 21;   //懃懃宮丹
  EFFECT_BEACON_6 = 22;   //령삽직槿
  EFFECT_BEACON_7 = 23;   //읫찻槿黛
  EFFECT_BEACON_8 = 24;   //暎촘뼙拳
  EFFECT_BEACON_9 = 25;   //낀왕삽校
  EFFECT_BEACON_10 = 26;   //흔絞慨촘
  EFFECT_LEVELUP = 27; //훙膠�薨�
  EFFECT_SHIELD = 28;   //나한기공
  EFFECT_MEDITATION = 29; //선천진기
  EFFECT_THUNDERWAVE = 30; //복호장

type
  pTAuctionItem=^TAuctionItem;
  TAuctionItem = record
    AuctionID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    Cost: Integer;
    Seller: String[ActorNameLen];
    Item: TClientItem;
  end;

  pTRentalItem=^TRentalItem;
  TRentalItem = record
    RentalID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    Owner: String[ActorNameLen];
    Rentner: String[ActorNameLen];
    Item: TClientItem;
  end;

  pTOwnerItem=^TOwnerItem;
  TOwnerItem = record
    RentalID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    Owner: String[ActorNameLen];
    Rentner: String[ActorNameLen];
    Withdraw: Boolean;
    Item: TClientItem;
  end;


  pTPetInfo=^TPetInfo;     //영물
  TPetInfo = record
    PetID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    PetName: String[ActorNameLen];
    PetNumber: Integer;
    Satiety: Integer;
    Period: Integer;
    ChangName: Integer;
    SatietyLimit: integer;
    EatRage: integer;
  end;

  pTComStorageItem=^TComStorageItem;     //공용창고
  TComStorageItem = record
    StorageID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    Item: TClientItem;
  end;

  pTGuildStorageItem=^TGuildStorageItem;   //문파창고
  TGuildStorageItem = record
    GStorageID: Integer;
    StartTime: TDateTime;
    EndTime: TDateTime;
    Item: TClientItem;
  end;

  PTWakeItem = ^TWakeItem;    //환상점
  TWakeItem =packed record
    WakeItemName      :string[22];
    WakeItemAmount    :word;
    WakeItems         :TClientItem;
  end;

  PTDiceGameItem = ^TSeveShopItem;    //혈룡상자
  TDiceGameItem =packed record
    ID            :Integer;
    ItemName      :string[22];
    Amount        :word;
    Items         :TClientItem;
  end;

  TNewClientItem = packed record
    s: TStdItem;
    UserItem: TUserItem;
  end;
  pTNewClientItem = ^TNewClientItem;

  PTSeveShopItem = ^TSeveShopItem;    //환상점
  TSeveShopItem =packed record
    ShopItemName      :string[20];
    ShopItemPrice     :Integer;
    shopItemjob       :byte;
    shopItemnew       :byte;
    shopItemmode      :byte;
    shopItemAmount    :word;
    ShopSell          :Boolean;
    ShopItems         :TClientItem;
  end;

  PTShopItem = ^TShopItem;        //환상점
  TShopItem =packed record
    ShopItemPrice     :Integer;
    shopItemjob       :byte;
    shopItemnew       :byte;
    shopItemmode      :byte;
    ShopItem          :TClientItem;
  end;
  {
  TDrawEffect = record       //눈오는이펙
    nIndex: Integer;
    dwDrawTick: LongWord;
  end;
  pTDrawEffect = ^TDrawEffect;        }

  PTFishing = ^TFishing;   //낚시
  TFishing=packed record
    FishName:string;
    Probability:integer;
  end;

  pTMapItem=^TMapItem;
  TMapItem=record
    Name            :String[40];
    Looks           :word;
    AniCount        :byte;
    Reserved        :integer;
    Grade           :Byte;
    Count           :integer;
    DropBaseObject  :TObject;
    OfBaseObject    :TObject;
    dwCanPickUpTick :Dword;
    UserItem        :TUserItem;
  end;

  pTBlockItem=^TBlockItem;
  TBlockItem = record
    Id        :Integer;
    Owner     :String;  //나
    Name      :String;  //거부자
  end;

  pTGemSystem=^TGemSystem;
  TGemSystem = record
    Gem      :String;
    Item1    :Integer;
    Item2    :Integer;
    Item3    :Integer;
    Item4    :Integer;
    Item5    :Integer;
    Item6    :Integer;
  end;

  //변환연구
  pTChangeSystem=^TChangeSystem;
  TChangeSystem = record
    Item1    :Integer;
    Item2    :Integer;
    Item3    :Integer;
    Item4    :Integer;
    Item5    :Integer;
    Item6    :Integer;
  end;

  pTUpwaiItem=^TUpwaiItem;    //재련
  TUpwaiItem = record
    Names    :String[20];
    ItemID   :Integer;
  end;


  pTseveGiveItem=^TseveGiveItem;       //환상점
  TseveGiveItem = packed record
    annid     :Integer;
    mename    :String[ActorNameLen];
    Itemname  :String[22];
    toname    :String[ActorNameLen];
    Itemamon  :Byte;
    Itemop    :Integer;
  end;

  pTGiveItem=^TGiveItem;          //환상점
  TGiveItem = packed record
    annid     :Integer;
    mename    :String[ActorNameLen];
    Itemname  :String[22];
    toname    :String[ActorNameLen];
    Itemop    :Integer;
    Item      :TClientItem;
  end;

  PTShopCart=^TShopCart;       //환상점
  TShopCart = record
   Itemidx  :Integer;
   mename   :string;
   Itemname :string;
   amoins   :string;
  end;


  pTDoorStatus=^TDoorStatus;
  TDoorStatus=record
    bo01:boolean;
    n04:integer;
    boOpened:Boolean;
    dwOpenTick:dword;
    nRefCount:integer;
  end;

  pTDoorInfo=^TDoorInfo;
  TDoorInfo=record
    nX,nY:Integer;
    Status:pTDoorStatus;
    nPoint:integer;
  end;

  pTMapFlag=^TMapFlag;
  TMapFlag=record
     boSAFE:Boolean;

     boUnAllowStdItems: Boolean;    //사용금지1
     sUnAllowStdItemsText: string;     //사용금지1
     boNOTALLOWMAGIC: Boolean;          //사용금지2
     sUnAllowMagicText: string;         //사용금지2

     nL:integer;
     nNEEDSETONFlag:integer;
     nNeedONOFF:integer;
     nMUSICID:integer;
     nMAPGROUP: Integer;  //그룹 맵
     boSNOW: Boolean;        //눈오는이펙
     nSNOWLEVEL: Integer;   //눈오는이펙
     boFLOWER: Boolean;
     nFLOWERLEVEL: Integer;
     boGROUPCOUNT: Boolean;
     nGROUPCOUNT: Integer;  //맵 그룹인원
     boDarkness:boolean;
     boDayLight:boolean;
     AutoAttack  : integer;        //마룡번개
     boFightZone:boolean;
     boFight3Zone:boolean;
     boPKZONE:boolean;
     VailantZone:Boolean; //용맹의전장
     boQUIZ:boolean;
     boNORECONNECT:boolean;
     sNoReConnectMap:string;
     boMUSIC:boolean;
     boDEATHMATCH:Boolean; //데스매치
     boNotGroup:Boolean;
     boEXPRATE:boolean;
     nEXPRATE:integer;
     boPKWINLEVEL:boolean;
     nPKWINLEVEL:integer;
     boPKWINEXP:boolean;
     nPKWINEXP:integer;
     boPKLOSTLEVEL:boolean;
     nPKLOSTLEVEL:integer;
     boPKLOSTEXP:boolean;
     nPKLOSTEXP:integer;
     boDECHP:boolean;
     nDECHPPOINT:integer;
     nDECHPTIME:integer;
     boINCHP:boolean;
     nINCHPPOINT:integer;
     nINCHPTIME:integer;
     boDECGAMEGOLD:boolean;
     nDECGAMEGOLD:integer;
     nDECGAMEGOLDTIME:integer;
     boDECGAMEPOINT:boolean;
     nDECGAMEPOINT:integer;
     nDECGAMEPOINTTIME:integer;
     boINCGAMEGOLD:boolean;
     nINCGAMEGOLD:integer;
     nINCGAMEGOLDTIME:integer;
     boINCGAMEPOINT:boolean;
     nINCGAMEPOINT:integer;
     nINCGAMEPOINTTIME:integer;
     boINCPCPOINT:boolean;
     nINCPCPOINT:integer;
     nINCPCPOINTTIME:integer;
     boRUNHUMAN:boolean;
     boRUNMON:boolean;
     boNEEDHOLE:boolean;
     boNORECALL:boolean;
     boNOGUILDRECALL:boolean;
     boNODEARRECALL:boolean;
     boNOMOVE:boolean;
     boNORANDOMMOVE:boolean;
     boNOCASTLEMOVE:boolean;
     boNODRUG:boolean;
     boMINE:boolean;
     boMINE2:boolean;
     boMINE3:boolean;
     boMINE4:boolean;  //석초광산
     boNOPOSITIONMOVE:boolean;
     boNODROPITEM:boolean;
     boNOTHROWITEM:boolean;
     boNOHORSE:Boolean;
     boNOCHAT:Boolean;
     boFISHEVENT:Boolean;   //낚시 이벤트
     boNOTIGER:Boolean;      //탈것 불가
     boNOPENETRATE:Boolean; //망자의옷 불가
     boALLATTMAP:Boolean;
     boNOREVIVAL:Boolean;   //부활 불가
     boNOHUMNOMON:Boolean; //唐훙꼽역迦岬밍
     nGuildTerritory:Integer;
     boOpenStore: Boolean; //개인상점
     boNoRecallHero: Boolean;
  end;

  TAddAbility=record
     wHP,wMP:Word;
     wHitPoint,wSpeedPoint:Word;
     wAC,wMAC,wDC,wMC,wSC:DWord;
     wAntiPoison,wPoisonRecover,
     wPoisonIncrease,wFreezingIncrease,
     wTox,wSlowDown,
     wHealthRecover,wSpellRecover:Word;
     wAntiMagic:Word;
     btLuck,btUnLuck:Byte;
     btWeaponStrong:BYTE;
     nHitSpeed:Word;
     UndeadPower:Byte;
     Weight,WearWeight,HandWeight:Word;
  end;

  TCharName = string[ACTORNAMELEN + 1];
  pTCharName = ^TCharName;

  TCharName1 = record
   sChrName: string[20];
  end;
  pTCharName1 = ^TCharName1;

  TMsgColor=(c_Red,c_Green,c_Blue,c_White,c_RedWhite,c_BlueWhite,c_Pink,c_BlueGreen,c_GreenWhite,c_Green2);
  TMsgType=(t_System,t_Notice,t_Hint,t_Say,t_Castle,t_Cust,t_Cust1,t_Cust2,t_GM,t_Mon,t_SVN1,t_SVN2,t_SVN3,t_TN);

  pTProcessMessage=^TProcessMessage;
  TProcessMessage=record
     wIdent:word;
     wParam:word;
     nParam1:integer;
     nParam2:integer;
     nParam3:integer;
     dwDeliveryTime:dword;
     BaseObject:TObject;
     boLateDelivery:Boolean;
     sMsg:String;
  end;

  pTSessInfo=^TSessInfo;
  TSessInfo=record
     nSessionID       :Integer;
     sAccount         :String[10];
     sIPaddr          :String;
     nPayMent         :integer;
     nPayMode         :integer;
     nSessionStatus   :integer;
     dwStartTick      :dword;
     dwActiveTick     :dword;
     nRefCount        :integer;
     nSocket          :integer;
     nGateIdx         :integer;
     nGSocketIdx      :integer;
     dwNewUserTick    :dword;
     nSoftVersionDate :integer;
  end;

  TScriptQuestInfo=record
     wFlag:word;
     btValue:byte;
     nRandRage:integer;
  end;
  TQuestInfos=array of TScriptQuestInfo;

  pTScript=^TScript;
  TScript=record
     boQuest:boolean;
     QuestInfos:TQuestInfos;
     RecordList:TList;
     nQuest:Integer;
  end;

  pTGameCmd=^TGameCmd;
  TGameCmd=record
     sCmd           :String;
     nPerMissionMin :integer;
     nPerMissionMax :integer;
  end;

  TQuestUnitStatus = record
    nQuestUnit: Integer;
    boOpen: Boolean;
  end;
  pTQuestUnitStatus = ^TQuestUnitStatus;

  TMapCondition = record
    nHumStatus: Integer;
    sItemName: string[14];
    boNeedGroup: Boolean;
  end;
  pTMapCondition = ^TMapCondition;

  TStartScript = record
    nLable: Integer;
    sLable: string[100];
  end;

  TMapEvent = record
    m_sMapName: string[MAPNAMELEN];
    m_nCurrX: Integer;
    m_nCurrY: Integer;
    m_nRange: Integer;
    m_MapFlag: TQuestUnitStatus;
    m_nRandomCount: Integer; //; 렀鍋:(0 - 999999) 0 돨샙쪽槨100% ; 鑒俚督댕，샙쪽督됴
    m_Condition: TMapCondition; //뇰랙係숭
    m_StartScript: TStartScript;
  end;
  pTMapEvent = ^TMapEvent;

  pTLoadDBInfo=^TLoadDBInfo;
  TLoadDBInfo=record
    nGateIdx:integer;
    nSocket:integer;
    sAccount:String[10];
    sCharName:String[20];
    sMsg: string;
    nSessionID:integer;
    sIPaddr:String[15];
    nSoftVersionDate:integer;
    nPayMent:integer;
    nPayMode:integer;
    nGSocketIdx:integer;
    dwNewUserTick:dword;
    PlayObject:TObject;
    nReLoadCount:Integer;
    HeroData: THeroDataType;
    NPC: TObject;
  end;

  pTGoldChangeInfo=^TGoldChangeInfo;
  TGoldChangeInfo=record
     sGameMasterName:string;
     sGetGoldUser:String;
     nGold:integer;
  end;

  pTSetItems = ^TSetItems;
  TSetItems = packed record
    sHint: string[50];
    Items: array[0..12] of string[22];     //옷부터 ~ 신발까지
    Value: array[0..35] of Word;
    HideValue: Boolean;
  end;

  pTSaveRcd=^TSaveRcd;
  TSaveRcd=record
    sAccount:String[16];
    sChrName:String[20];
    nSessionID:integer;
    PlayObject:TObject;    //공격 모드
    HumanRcd:THumData;
    nReTryCount:integer;
  end;

  pTMonGenInfo=^TMonGenInfo;
  TMonGenInfo=record
     sMapName:String;
     nX,nY:Integer;
     sMonName:String;
     nRange:Integer;
     nCount:Integer;
     dwZenTime:dword;
     nMissionGenRate:integer;
     CertList:TList;
     Envir:TObject;
     nRace:integer;    //몹레이스
     dwStartTick:dword;
  end;

  pTMonInfo=^TMonInfo;
  TMonInfo=record
    ItemList:TList;
    sName:String;
    btRace:Word;  //몹레이스
    btRaceImg:Word;
    wAppr:word;
    wLevel:word;
    btLifeAttrib:byte;
    wCoolEye:word;
    dwExp:dword;
    wHP,wMP:Word;
    wAC,wMAC,wDC,wMaxDC,wMC,wSC:Word;
    wSpeed,wHitPoint,wWalkSpeed,wWalkStep,wWalkWait,wAttackSpeed:Word;
    wAntiPush:Word;
    boAggro,boTame,NoPoison:Boolean;
  end;

  pTMonItem=^TMonItem;
  TMonItem=record
    MaxPoint:integer;
    SelPoint:integer;
    ItemName:String;
    Count:integer;
  end;


  //아이템합성
  TCompoundInfo = record
    Value1: array [0 .. 6] of LongWord;
    Value2: array [0 .. 5] of Word;
    Rate: array [0 .. 13] of Byte;
    Value: Word;
  end;
  pTCompoundInfo = ^TCompoundInfo;

  TCompoundInfos = array [1 .. 4] of TCompoundInfo;
  pTCompoundInfos = ^TCompoundInfos;

  TCompoundSet = record
    Color: array [1 .. 4] of Byte;
    Gold, GameGold: array [1 .. 4] of Integer;
    DropRate: array [1 .. 4] of Byte;
    ValueLimit: Integer;
  end;

  pTUnbindInfo=^TUnbindInfo;
  TUnbindInfo=record
    nUnbindCode  :Integer;
    sItemName    :String;
  end;

  TUpgradeProb = record      //스쳐
    iValue: array [0..5] of integer;
    iBase: integer;
  end;

  TSlaveInfo=record
    sSlaveName:String;
    btSlaveLevel:byte;
    dwRoyaltySec:dword;
    nKillCount:integer;
    btSlaveExpLevel:byte;
    nHP,nMP:integer;
  end;
  pTSlaveInfo=^TSlaveInfo;

  pTSwitchDataInfo=^TSwitchDataInfo;
  TSwitchDataInfo=record
     sMap:String;
     wX,wY:word;
     Abil:TAbility;
     sChrName:String;
     nCode:integer;
     boC70:boolean;
     boBanStoreShout:boolean;
     boBanShout:boolean;
     boHearWhisper:boolean;
     boBanGuildChat:boolean;
     boBanGroupChat:boolean;
     boBanSysMsg:boolean;
     boHearMsg:boolean;
     boAdminMode:boolean;
     boObMode:boolean;
     BlockWhisperArr:array of string;
     SlaveArr:array of TSlaveInfo;
     StatusValue:Array [0..5] of word;
     StatusTimeOut:array [0..5] of LongWord;
     ExtraAbil: array[0..EXTRAABIL_SIZE-1] of byte;  //상승 능력치 값
     ExtraAbilFlag: array[0..EXTRAABIL_SIZE-1] of byte; //플래그(Byte)
     ExtraAbilTimes: array[0..EXTRAABIL_SIZE-1] of Longword; //일정시간동안, 파괴,마력,도력,공속,체력,마력 상승
  end;

  TCheckMsgClass = (tmc_Group, tmc_Friend, tmc_Guild, tmc_Time, tmc_Deal);

  pTCheckMsg = ^TCheckMsg;
  TCheckMsg = packed record
    tClass: TCheckMsgClass;
    AllPurpose: Pointer;
    AddTime: LongWord;
  end;

  TIPaddr=record
    sIpaddr:String;
    dIPaddr:String;
  end;

  pTGateInfo=^TGateInfo;
  TGateInfo=record
    boUsed:Boolean;
    Socket:TCustomWinSocket;
    sAddr :String;
    nPort :integer;
    n520  :integer;
    UserList :TList;
    nUserCount :Integer;
    Buffer:pchar;
    nBuffLen:integer;
    BufferList:TList;
    boSendKeepAlive:Boolean;
    nSendChecked:integer;
    nSendBlockCount:integer;
    dwStartTime:dword;
    nSendMsgCount:integer;
    nSendRemainCount:integer;
    dwSendTick:Dword;
    nSendMsgBytes:integer;
    nSendBytesCount:integer;
    nSendedMsgCount:integer;
    nSendCount:integer;
    dwSendCheckTick:dword;
  end;

  pTGateUserInfo=^TGateUserInfo;
  TGateUserInfo=record
     PlayObject:TObject;
     nSessionID:integer;
     sAccount:String[10];
     nGSocketIdx:integer;
     sIPaddr:string[15];
     boCertification:boolean;
     sCharName:String[20];
     nClientVersion:integer;
     SessInfo:pTSessInfo;
     nSocket:integer;
     FrontEngine:TObject;
     UserEngine:TObject;
     dwNewUserTick:Dword;
  end;

  TClassProc=procedure(Sender:TObject);


  TCheckVersion=class

  end;

  TGameDataLog=function (p:Pchar;len:integer):Boolean;
  TMainMessageProc=procedure (Msg:PChar;nMsgLen:Integer;nMode:Integer);stdcall;
  TFindProcTableProc=function (ProcName:PChar;nNameLen:Integer):Pointer;stdcall;
  TSetProcTableProc=function(ProcAddr:Pointer;ProcName:PChar;nNameLen:Integer):Boolean;stdcall;
  TFindObj=function(ObjName:PChar;nNameLen:Integer):TObject;stdcall;
  TPlugInit=function (hnd:THandle;p:TMainMessageProc;p2:TFindProcTableProc;p3:TSetProcTableProc;p4:TFindOBj):Pchar;
  TDeCryptString=Procedure (src:Pointer;dest:pointer;srcLen:integer;var destLen:Integer);
  TMsgProc=procedure (Msg:PChar;nMsgLen:Integer;nMode:Integer);stdcall;
  TFindProc=function(sProcName:Pchar;len:Integer):Pointer;
  TSetProc=function (ProcAddr:Pointer;ProcName:PChar;len:integer):Boolean;




  TSpitMap=array [0..7] of array[0..4,0..4] of integer;

  TLevelNeedExp=Array[1..500] of Longword;//dword;

  TLevelNeedGuildExp=Array[1..35] of integer;//문파성장

  TClientConf=record
     boClientCanSet    :boolean;
     boRunHuman        :boolean;
     boRunMon          :boolean;
     boRunNpc          :boolean;
     boWarRunAll       :boolean;
     btDieColor        :byte;
     wSpellTime        :word;
     wHitIime          :word;
     wItemFlashTime    :word;
     btItemSpeed       :byte;
     boCanStartRun     :boolean;   //질주?
     boParalyCanRun    :boolean;
     boParalyCanWalk   :boolean;
     boParalyCanHit    :boolean;
     boParalyCanSpell  :boolean;
     boShowJobLevel    :boolean;
     boDuraAlert       :boolean;
     boMagicLock       :boolean;
     boAutoPuckUpItem  :boolean;
  end;

  TRecallMigic=record
    nHumLevel:integer;
    sMonName:String;
    nCount:integer;
    nLevel:integer;
  end;

  pTM2Config=^TM2Config;
  pTThreadInfo=^TThreadInfo;
  TThreadInfo=Record
    dwRunTick       :dword;
    boTerminaled    :boolean;
    nRunTime        :integer;
    nMaxRunTime     :integer;
    boActived       :boolean;
    nRunFlag        :integer;
    Config          :pTM2Config;
    hThreadHandle   :THandle;
    dwThreadID      :dword;
  end;

  TGlobaDyMval=Array of word;

  TM2Config=record
    nConfigSize             :integer;
    sServerName             :String;
    sServerIPaddr           :String;
    sWebSite                :String;
    sBbsSite                :String;
    sClientDownload         :String;
    sQQ                     :String;
    sPhone                  :String;
    sBankAccount0           :String;
    sBankAccount1           :String;
    sBankAccount2           :String;
    sBankAccount3           :String;
    sBankAccount4           :String;
    sBankAccount5           :String;
    sBankAccount6           :String;
    sBankAccount7           :String;
    sBankAccount8           :String;
    sBankAccount9           :String;
    nServerNumber           :integer;
    boVentureServer         :boolean;
    boTestServer            :boolean;
    boServiceMode           :boolean;
    boNonPKServer           :boolean;
    nTestLevel              :integer;
    nTestGold               :integer;
    nTestUserLimit          :integer;
    nUserLimit              :integer;   //유저제한
    slim                    :String;
    nSendBlock              :integer;
    nCheckBlock             :integer;
    boDropLargeBlock        :Boolean;
    nAvailableBlock         :integer;
    nGateLoad               :integer;
    nUserFull               :integer;
    nZenFastStep            :integer;
    sGateAddr               :String[15];
    nGatePort               :integer;
    sDBAddr                 :String[15];
    nDBPort                 :integer;
    sIDSAddr                :String[15];
    nIDSPort                :integer;
    sMsgSrvAddr             :String[15];
    nMsgSrvPort             :integer;
    sLogServerAddr          :String[15];
    nLogServerPort          :integer;
    boDiscountForNightTime  :boolean;
    nHalfFeeStart           :integer;
    nHalfFeeEnd             :integer;
    boTimeEventUse          :Boolean;   //접속시간 이벤트사용
    nMinEvent               :integer;   //몇분마다?
    nHourEvent              :integer;   //몇시간마다?
    nWakeUpRate             :integer;    //각성 확률
    boViewHackMessage       :Boolean;
    boViewAdmissionFailure  :Boolean;
    sBaseDir                :String;
    sGuildDir               :String;
    sGuildFile              :String;
    sVentureDir             :String;
    sConLogDir              :String;
    sCastleDir              :String;
    sCastleFile             :String;
    sEnvirDir               :String;
    sMapDir                 :String;
    sMapEIDir               :string;
    sShandaMapDir           :string;
    sNoticeDir              :String;
    sLogDir                 :String;
    sPlugDir                :String;
    sClientFile1            :String;
    sClientFile2            :String;
    sClientFile3            :String;
    sLevel50Effect          :integer; //레벨 50 이팩트 설정
    sLevel60Effect          :integer; //레벨 60 이팩트 설정
    sLevel70Effect          :integer; //레벨 70 등선이팩트 설정
    sLevelComEffect         :integer;
    sClothsMan              :String;
    sClothsWoman            :String;
    sWoodenSword            :String;
    sAssassinWeapon         :String;
    sBonzeWeapon            :String;
    sCandle                 :String;
    sBasicDrug              :String;
    sGoldStone              :String;
    sSilverStone            :String;
    sSteelStone             :String;
    sCopperStone            :String;
    sBlackStone             :String;
    sGreenStone             :String;
    sGemStone1              :String;
    sGemStone2              :String;
    sGemStone3              :String;
    sGemStone4              :String;

    sLegendZuma             :Array[0..3] of String[ActorNameLen];
    sZuma                   :Array[0..3] of String[ActorNameLen];
    sPotMon                 :Array[0..19] of String[ActorNameLen];
    sPotMon1                :Array[0..19] of String[ActorNameLen];
    sBee                    :String[ActorNameLen];
    sSpider                 :String[ActorNameLen];
    sSpider2                :String[ActorNameLen];
    sWoomaHorn              :String;
    sZumaPiece              :String;
    sGameGoldName           :String;
    sGamePointName          :String;
    sPCPointName            :String;
    DBSocket                :integer;
    nHealthFillTime         :integer;
    nSpellFillTime          :integer;
    nMonUpLvNeedKillBase    :integer;
    nMonUpLvRate            :integer;
    MonUpLvNeedKillCount    :Array[0..7] of integer;
    SlaveColor              :Array[0..8] of Byte;
    dwNeedExps              :TLevelNeedExp;
    dwHeroNeedExps          :TLevelNeedExp;
    dwNeedGuldExps          :TLevelNeedGuildExp;     //문파성장
    WideAttack              :Array[0..2] of integer;
    CrsAttack               :Array [0..6] of integer;
    SpitMap                 :TSpitMap;
    sHomeMap                :String;
    nHomeX                  :integer;
    nHomeY                  :integer;
    sRedHomeMap             :String;
    nRedHomeX               :integer;
    nRedHomeY               :integer;
    sRedDieHomeMap          :String;
    nRedDieHomeX            :integer;
    nRedDieHomeY            :integer;
    boJobHomePoint          :Boolean;
    sWarriorHomeMap         :String;
    nWarriorHomeX           :integer;
    nWarriorHomeY           :integer;
    sWizardHomeMap          :String;
    nWizardHomeX            :integer;
    nWizardHomeY            :integer;
    sTaoistHomeMap          :String;
    nTaoistHomeX            :integer;
    nTaoistHomeY            :integer;
    sAssassinHomeMap        :String;       //자객
    nAssassinHomeX          :integer;
    nAssassinHomeY          :integer;
    sBonzeHomeMap          :String;       //궁수
    nBonzeHomeX            :integer;
    nBonzeHomeY            :integer;

    dwDecPkPointTime        :dword;
    nDecPkPointCount        :integer;
    dwPKFlagTime            :dword;
    nKillHumanAddPKPoint    :integer;
    nKillHumanDecLuckPoint  :integer;
    dwDecLightItemDrugTime  :dword;
    nSafeZoneSize           :integer;
    nStartPointSize         :integer;
    dwHumanGetMsgTime       :dword;
    nGroupMembersMax        :integer;
    sFireBallSkill          :String[12];
    sHealSkill              :String[12];
    sRingSkill              :Array[0..10] of String[12];
    ReNewNameColor          :Array[0..9] of byte;
    dwReNewNameColorTime    :dword;
    boReNewChangeColor      :boolean;
    boReNewLevelClearExp    :boolean;
    boNeutralityAttack      :boolean;
    BonusAbilofWarr,
    BonusAbilofWizard,
    BonusAbilofTaos,
    BonusAbilofAssassin,
    BonusAbilofBonze,
    NakedAbilofWarr,
    NakedAbilofWizard,
    NakedAbilofTaos,
    NakedAbilofAssassin,
    NakedAbilofBonze       :TNakedAbility;
    nUpgradeWeaponMaxPoint  :integer;
    nUpgradeWeaponPrice     :integer;
    dwUPgradeWeaponGetBackTime     :dword;
    nClearExpireUpgradeWeaponDays  :integer;
    nUpgradeWeaponDCRate           :integer;
    nUpgradeWeaponDCTwoPointRate   :integer;
    nUpgradeWeaponDCThreePointRate :integer;
    nUpgradeWeaponSCRate           :integer;
    nUpgradeWeaponSCTwoPointRate   :integer;
    nUpgradeWeaponSCThreePointRate :integer;
    nUpgradeWeaponMCRate           :integer;
    nUpgradeWeaponMCTwoPointRate   :integer;
    nUpgradeWeaponMCThreePointRate :integer;
    dwProcessMonstersTime          :dword;
    dwRegenMonstersTime            :dword;
    nMonGenRate                    :integer;
    nProcessMonRandRate            :integer;
    nProcessMonLimitCount          :integer;
    nSoftVersionDate               :integer;
    boCanOldClientLogon            :boolean;
    dwConsoleShowUserCountTime     :dword;
    dwShowLineNoticeTime           :dword;
    nLineNoticeColor               :integer;
    nStartCastlewarDay             :Array[0..2] of byte;
    nStartCastlewarTime            :integer;
    nStartCastlewarMin             :integer;
    dwCastleFlagRegenTime          :dword;
    dwShowCastleWarEndMsgTime      :dword;
    dwCastleWarTime                :dword;
    dwGuildWarTime                 :dword;
    nBuildGuildPrice               :integer;
    nGuildMarkPrice                :integer;   //문파 마크 가격
    nGuildWarPrice                 :integer;
    nMakeDurgPrice                 :integer;
    nHumanMaxGold                  :integer;
    nHumanTryModeMaxGold           :integer;
    nTryModeLevel                  :integer;
    boTryModeUseStorage            :boolean;
    nCanShoutMsgLevel              :integer;
    boShowMakeItemMsg              :boolean;
    boShutRedMsgShowGMName         :boolean;
    nSayMsgMaxLen                  :integer;
    dwSayMsgTime                   :dword;
    nSayMsgCount                   :integer;
    dwDisableSayMsgTime            :dword;
    nSayRedMsgMaxLen               :integer;
    boShowGuildName                :boolean;
    boShowRankLevelName            :boolean;
    boShowColumnName               :boolean;   //칼럼이름
    boMonSayMsg                    :boolean;
    nStartPermission               :integer;
    boKillHumanWinLevel            :boolean;
    boKilledLostLevel              :boolean;
    boPKServer                     :boolean;   //킬데스 모드
    nFishSuccess                   :integer;   //낚시 확률 이벤트(운영자 건트롤)
    boKillHumanWinExp              :boolean;
    boKilledLostExp                :boolean;
    nKillHumanWinLevel             :integer;
    nKilledLostLevel               :integer;
    nKillHumanWinExp               :integer;
    nKillHumanLostExp              :integer;
    nHumanLevelDiffer              :integer;
    nMonsterPowerRate              :integer;
    nItemsPowerRate                :integer;
    nItemsACPowerRate              :integer;
    boSendOnlineCount              :boolean;
    nSendOnlineCountRate           :integer;
    dwSendOnlineTime               :dword;
    dwSaveHumanRcdTime             :dword;
    dwHumanFreeDelayTime           :dword;
    dwMakeGhostTime                :dword;
    dwClearDropOnFloorItemTime     :dword;
    dwFloorItemCanPickUpTime       :dword;
    dwEatTick: LongWord;
    boPasswordLockSystem           :boolean;  //창고암호
    boLockDealAction               :boolean;  //角뤠傑땍슥弄꾸鱗
    boLockDropAction               :boolean;  //角뤠傑땍휀膠틔꾸鱗
    boLockGetBackItemAction        :boolean;  //角뤠傑땍혤꾑욋꾸鱗
    boLockHumanLogin               :boolean;  //角뤠傑땍浬꾸鱗
    boLockWalkAction               :boolean;  //角뤠傑땍浬꾸鱗
    boLockRunAction                :boolean;  //角뤠傑땍텝꾸鱗
    boLockHitAction                :boolean;  //角뤠傑땍묑샌꾸鱗
    boLockSpellAction              :boolean;  //角뤠傑땍침랬꾸鱗
    boLockSendMsgAction            :boolean;  //角뤠傑땍랙斤口꾸鱗
    boLockUserItemAction           :boolean;  //角뤠傑땍賈痰膠틔꾸鱗
    boLockInObModeAction           :boolean;  //傑땍珂쏵흙茶�箴늬�
    nPasswordErrorCountLock        :integer;  //渴흙쵱쯤댄轎낚법 寧땍늴鑒橙傑땍쵱쯤
    nBonusPointHack                :integer;
    nMobGenCount                   :integer;     //관리자시스템 변경
    boPasswordErrorKick            :boolean;  //渴흙쵱쯤댄轎낚법掘齡橙璟苟窟
    nSendRefMsgRange               :integer;
    boDecLampDura                  :boolean;

    boDiableHumanRun               :boolean;
    boRunHuman                     :boolean;
    boRunMon                       :boolean;
    boRunNpc                       :boolean;
    boRunGuard                     :boolean;
    boWarDisHumRun                 :boolean;
    boGMRunAll                     :boolean;
    boSafeZoneRunAll               :Boolean;
    dwTryRentalTime                :dword;   //대여
    dwRentalOKTime                 :dword;   //대여
    dwTryDealTime                  :dword;
    dwDealOKTime                   :dword;
    boCanNotGetBackDeal            :boolean;
    boDisableDeal                  :boolean;
    nMasterOKLevel                 :integer;
    nMasterOKCreditPoint           :integer;
    nMasterOKBonusPoint            :integer;
    boPKLevelProtect               :boolean;
    nPKProtectLevel                :integer;
    nLoverRecallTime                :integer;    //연인 소환 딜레이
    nMasterLevel                   :integer;  //사제 레벨
    nRedPKProtectLevel             :integer;
    nItemPowerRate                 :integer;
    nItemExpRate                   :integer;
    nScriptGotoCountLimit          :integer;
    btHearMsgFColor                :byte; //품쒼
    btHearMsgBColor                :byte; //교쒼
    btWhisperMsgFColor             :byte; //품쒼
    btWhisperMsgBColor             :byte; //교쒼
    btGMWhisperMsgFColor           :byte; //품쒼
    btGMWhisperMsgBColor           :byte; //교쒼
    btCryMsgFColor                 :byte; //품쒼
    btCryMsgBColor                 :byte; //교쒼
    btGreenMsgFColor               :byte; //품쒼
    btGreenMsgBColor               :byte; //교쒼
    btBlueMsgFColor                :byte; //품쒼
    btBlueMsgBColor                :byte; //교쒼
    btRedMsgFColor                 :byte; //품쒼
    btRedMsgBColor                 :byte; //교쒼
    btGuildMsgFColor               :byte; //품쒼
    btGuildMsgBColor               :byte; //교쒼
    btGroupMsgFColor               :byte; //품쒼
    btGroupMsgBColor               :byte; //교쒼
    btCustMsgFColor                :byte; //품쒼
    btCustMsgBColor                :byte; //교쒼
    btCustMsg1FColor               :byte; //품쒼
    btCustMsg1BColor               :byte; //교쒼
    btAllGuildMsgFColor            :byte; //품쒼
    btAllGuildMsgBColor            :byte;
    nMonRandomAddValue             :integer;
    nMakeRandomAddValue            :integer;
    nWeaponDCAddValueMaxLimit      :integer;
    nWeaponDCAddValueRate          :integer;
    nWeaponMCAddValueMaxLimit      :integer;
    nWeaponMCAddValueRate          :integer;
    nWeaponSCAddValueMaxLimit      :integer;
    nWeaponSCAddValueRate          :integer;
    nDressDCAddRate                :integer;
    nDressDCAddValueMaxLimit       :integer;
    nDressDCAddValueRate           :integer;
    nDressMCAddRate                :integer;
    nDressMCAddValueMaxLimit       :integer;
    nDressMCAddValueRate           :integer;
    nDressSCAddRate                :integer;
    nDressSCAddValueMaxLimit       :integer;
    nDressSCAddValueRate           :integer;
    nNeckLace202124DCAddRate                    :integer;
    nNeckLace202124DCAddValueMaxLimit           :integer;
    nNeckLace202124DCAddValueRate               :integer;
    nNeckLace202124MCAddRate                    :integer;
    nNeckLace202124MCAddValueMaxLimit           :integer;
    nNeckLace202124MCAddValueRate               :integer;
    nNeckLace202124SCAddRate                    :integer;
    nNeckLace202124SCAddValueMaxLimit           :integer;
    nNeckLace202124SCAddValueRate               :integer;
    nNeckLace19DCAddRate                    :integer;
    nNeckLace19DCAddValueMaxLimit           :integer;
    nNeckLace19DCAddValueRate               :integer;
    nNeckLace19MCAddRate                    :integer;
    nNeckLace19MCAddValueMaxLimit           :integer;
    nNeckLace19MCAddValueRate               :integer;
    nNeckLace19SCAddRate                    :integer;
    nNeckLace19SCAddValueMaxLimit           :integer;
    nNeckLace19SCAddValueRate               :integer;
    nArmRing26DCAddRate                    :integer;
    nArmRing26DCAddValueMaxLimit           :integer;
    nArmRing26DCAddValueRate               :integer;
    nArmRing26MCAddRate                    :integer;
    nArmRing26MCAddValueMaxLimit           :integer;
    nArmRing26MCAddValueRate               :integer;
    nArmRing26SCAddRate                    :integer;
    nArmRing26SCAddValueMaxLimit           :integer;
    nArmRing26SCAddValueRate               :integer;
    nRing22DCAddRate                    :integer;
    nRing22DCAddValueMaxLimit           :integer;
    nRing22DCAddValueRate               :integer;
    nRing22MCAddRate                    :integer;
    nRing22MCAddValueMaxLimit           :integer;
    nRing22MCAddValueRate               :integer;
    nRing22SCAddRate                    :integer;
    nRing22SCAddValueMaxLimit           :integer;
    nRing22SCAddValueRate               :integer;
    nRing23DCAddRate                    :integer;
    nRing23DCAddValueMaxLimit           :integer;
    nRing23DCAddValueRate               :integer;
    nRing23MCAddRate                    :integer;
    nRing23MCAddValueMaxLimit           :integer;
    nRing23MCAddValueRate               :integer;
    nRing23SCAddRate                    :integer;
    nRing23SCAddValueMaxLimit           :integer;
    nRing23SCAddValueRate               :integer;
    nHelMetDCAddRate                    :integer;
    nHelMetDCAddValueMaxLimit           :integer;
    nHelMetDCAddValueRate               :integer;
    nHelMetMCAddRate                    :integer;
    nHelMetMCAddValueMaxLimit           :integer;
    nHelMetMCAddValueRate               :integer;
    nHelMetSCAddRate                    :integer;
    nHelMetSCAddValueMaxLimit           :integer;
    nHelMetSCAddValueRate               :integer;


    nUnknowHelMetACAddValueMin1Limit    :integer;
    nUnknowHelMetACAddValueMax1Limit    :integer;
    nUnknowHelMetACAddValueMin2Limit    :integer;
    nUnknowHelMetACAddValueMax2Limit    :integer;

    nUnknowHelMetMACAddValueMinLimit    :integer;
    nUnknowHelMetMACAddValueMaxLimit    :integer;
    nUnknowHelMetDCAddValueMinLimit     :integer;
    nUnknowHelMetDCAddValueMaxLimit     :integer;
    nUnknowHelMetMCAddValueMinLimit     :integer;
    nUnknowHelMetMCAddValueMaxLimit     :integer;
    nUnknowHelMetSCAddValueMinLimit     :integer;
    nUnknowHelMetSCAddValueMaxLimit     :integer;

    nUnknowRingDCAddValueMinLimit       :integer;
    nUnknowRingDCAddValueMaxLimit       :integer;
    nUnknowRingMCAddValueMinLimit       :integer;
    nUnknowRingMCAddValueMaxLimit       :integer;
    nUnknowRingSCAddValueMinLimit       :integer;
    nUnknowRingSCAddValueMaxLimit       :integer;

    nUnknowNecklaceACAddValueMinLimit   :integer;
    nUnknowNecklaceACAddValueMaxLimit   :integer;
    nUnknowNecklaceMACAddValueMinLimit  :integer;
    nUnknowNecklaceMACAddValueMaxLimit  :integer;
    nUnknowNecklaceDCAddValueMinLimit   :integer;
    nUnknowNecklaceDCAddValueMaxLimit   :integer;
    nUnknowNecklaceMCAddValueMinLimit   :integer;
    nUnknowNecklaceMCAddValueMaxLimit   :integer;
    nUnknowNecklaceSCAddValueMinLimit   :integer;
    nUnknowNecklaceSCAddValueMaxLimit   :integer;


    nMonOneDropGoldCount                :integer;
    nMakeMineHitRate                    :integer; //穀웁츱櫓쪽
    nMakeMineRate                       :integer; //穀웁쪽
    nStoneTypeRate                      :integer;
    nStoneTypeRateMin                   :integer;
    nGoldStoneMin                       :integer;
    nGoldStoneMax                       :integer;
    nSilverStoneMin                     :integer;
    nSilverStoneMax                     :integer;
    nSteelStoneMin                      :integer;
    nSteelStoneMax                      :integer;
    nBlackStoneMin                      :integer;
    nBlackStoneMax                      :integer;
    nStoneMinDura                       :integer;
    nStoneGeneralDuraRate               :integer;
    nStoneAddDuraRate                   :integer;
    nStoneAddDuraMax                    :integer;
    nWinLottery6Min                     :integer;
    nWinLottery6Max                     :integer;
    nWinLottery5Min                     :integer;
    nWinLottery5Max                     :integer;
    nWinLottery4Min                     :integer;
    nWinLottery4Max                     :integer;
    nWinLottery3Min                     :integer;
    nWinLottery3Max                     :integer;
    nWinLottery2Min                     :integer;
    nWinLottery2Max                     :integer;
    nWinLottery1Min                     :integer;
    nWinLottery1Max                     :integer;//16180 + 1820;
    nWinLottery1Gold                    :integer;
    nWinLottery2Gold                    :integer;
    nWinLottery3Gold                    :integer;
    nWinLottery4Gold                    :integer;
    nWinLottery5Gold                    :integer;
    nWinLottery6Gold                    :integer;
    nWinLotteryRate                     :integer;
    nWinLotteryCount                    :integer;
    nNoWinLotteryCount                  :integer;
    nWinLotteryLevel1                   :integer;
    nWinLotteryLevel2                   :integer;
    nWinLotteryLevel3                   :integer;
    nWinLotteryLevel4                   :integer;
    nWinLotteryLevel5                   :integer;
    nWinLotteryLevel6                   :integer;


    nMagMassPoisonDelay                 :integer;   //독무 딜레이

    GlobalVal                           :Array[0..19] of integer;
    GlobalAVal                          :array[0..99] of string; //처리
    nItemNumber                         :integer;
    nItemNumberEx                       :integer;
    nGuildRecallTime                    :integer;
    nGroupRecallTime                    :integer;
    boControlDropItem                   :boolean;
    boInSafeDisableDrop                 :boolean;
    nCanDropGold                        :integer;
    nCanDropPrice                       :integer;
    boSendCustemMsg                     :boolean;
    boSubkMasterSendMsg                 :boolean;
    nSuperRepairPriceRate               :integer; //景錦송목굡鑒
    nRepairItemDecDura                  :integer; //팹繫錦잿딜넣씹鑒(景넣씹�龜氷推쫏師冒譎都疥烋ぜ促켁匈�)
    boDieScatterBag                     :boolean;
    nDieScatterBagRate                  :integer;
    boDieRedScatterBagAll               :boolean;
    Reserved64dell                      :boolean;
    nDieDropUseItemRate                 :integer;
    nDieRedDropUseItemRate              :integer;
    boDieDropGold                       :boolean;
    boKillByHumanDropUseItem            :boolean;
    boKillByMonstDropUseItem            :boolean;
    boKickExpireHuman                   :boolean;
    nGuildRankNameLen                   :integer;
    nGuildMemberMaxLimit                :integer;
    nGuildNameLen                       :integer;
    nCastleNameLen                      :Integer;
    nAttackPosionRate                   :integer;
    nAttackPosionTime                   :integer;
    nAttackSuperPosionRate              :integer;
    dwRevivalTime                       :dword; //릿삶쇌몰珂쇌
    boUserMoveCanDupObj                 :boolean;
    boUserMoveCanOnItem                 :boolean;
    dwUserMoveTime                      :integer;
    dwPKDieLostExpRate                  :integer;
    nPKDieLostLevelRate                 :integer;
    btPKFlagNameColor                   :Byte;
    btPKLevel1NameColor                 :Byte;
    btPKLevel2NameColor                 :Byte;
    btAllyAndGuildNameColor             :Byte;
    btWarGuildNameColor                 :Byte;
    btCatleGuildNameColor               :Byte;  //사북문 이름색
    btNamCatleGuildNameColor            :Byte;  //남만문 이름색
    btKingCatleGuildNameColor           :Byte;  //정복자 이름색
    btCatleWarGuildNameColor            :Byte;
    btInFreePKAreaNameColor             :Byte;
    boSpiritMutiny                      :boolean;
    dwSpiritMutinyTime                  :dword;
    nSpiritPowerRate                    :integer;
    boMasterDieMutiny                   :boolean;
    nMasterDieMutinyRate                :integer;
    nMasterDieMutinyPower               :integer;
    nMasterDieMutinySpeed               :integer;
    boOldClientShowHiLevel              :boolean;
    boShowScriptActionMsg               :boolean;
    nRunSocketDieLoopLimit              :integer;
    boThreadRun                         :boolean;
    boShowExceptionMsg                  :boolean;
    boShowPreFixMsg                     :boolean;
    nMagicAttackRage                    :integer; //침랬傑땍렀鍋
    sSkeleton                           :String[ActorNameLen];
    sJinSkeleton                        :String[ActorNameLen];
    nSkeletonCount                      :integer;
    SkeletonArray                       :array[0..9] of TRecallMigic;
    sDragon                             :String[ActorNameLen];
    sDragon1                            :String[ActorNameLen];
    nDragonCount                        :integer;
    DragonArray                         :array[0..9] of TRecallMigic;
    sAngel                              :String[ActorNameLen];
    sDarkAngel                          :String[ActorNameLen];
    sGuard45                            :String[ActorNameLen];
    sGuard50                            :String[ActorNameLen];
    sGuard55                            :String[ActorNameLen];
    sGuard60                            :String[ActorNameLen];
    sArcher45                           :String[ActorNameLen];
    sArcher50                           :String[ActorNameLen];
    sArcher55                           :String[ActorNameLen];
    sArcher60                           :String[ActorNameLen];
    SClone                              :String[ActorNameLen];
    SCloneAssassin                      :String[ActorNameLen];
    sBonzeClone                         :String[ActorNameLen];
    sBonzeMob                           :String[ActorNameLen];
    nAmyOunsulPoint                     :integer;
    boDisableInSafeZoneFireCross        :boolean;
    boGroupMbAttackPlayObject           :boolean;

    dwPosionDecHealthTime               :dword;
    nPosionDamagarmor                   :integer;//櫓븐뗀淪넣씹섟숑렝좆（茄셥댕鬼槨 12 / 10）
    boLimitSwordLong                    :boolean;
    nSwordLongPowerRate                 :integer;
    nFireBoomRage                       :integer;
    nSnowWindRange                      :integer;
    ConsigitemIdx                       :integer;
    ComStorageIdx                       :integer;
    PetLimitIdx                         :integer;         //영물 5개 제한
    GuildStorageIdx                     :integer;
    GiftitemIdx                         :integer;
    nElecBlizzardRange                  :integer;
    nLightFlowerStruckLevel             :integer;
    nMagTurnUndeadLevel                 :integer; //加喇밍膠된섬掘齡
    nMagTammingLevel                    :integer; //撞상裂밟밍膠된섬掘齡
    nMagTammingTargetLevel              :integer; //撞상밍膠宮뀌된섬샙쪽，늪鑒俚督鬼샙쪽督댕；
    nMagTammingHPRate                   :integer; //냥묘샙쪽=밍膠離멕HP 뇜鹿 늪굡쪽，늪굡쪽督댕撞상샙쪽督멕
    nMagTammingCount                    :integer;
    nMabMabeHitRandRate                 :integer;
    nMabMabeHitMinLvLimit               :integer;
    nMabMabeHitSucessRate               :integer;
    nMabMabeHitMabeTimeRate             :integer;
    sSabukCastleName                    :String;
    sSabukCastleHomeMap                 :String;
    nSabukCastleHomeX                   :integer;
    nSabukCastleHomeY                   :integer;
    sNammanCastleName                   :String;
    sNammanCastleHomeMap                :String;
    nNammanCastleHomeX                  :integer;
    nNammanCastleHomeY                  :integer;
    nCastleTaxRate                      :integer;
    boGetAllNpcTax                      :boolean;
    nHireGuardPrice                     :integer;
    nHireArcherPrice                    :integer;
    nCastleGoldMax                      :integer;
    nCastleOneDayGold                   :integer;
    nRepairDoorPrice                    :integer;
    nRepairWallPrice                    :integer;
    nCastleMemberPriceRate              :integer;
    sGTHomeMap                          :String[20];
    nGTHomeX                            :integer;
    nGTHomeY                            :integer;
    sGTCallMap                          :String[20];
    sGTCallMap2                         :String[20];
    sGTCallMap3                         :String[20];
    nGTCallX                            :integer;
    nGTCallY                            :integer;
    nGTExtendFee                        :integer;
    nGTBuyFee                           :integer;
    nGTNumberOfPeople                   :integer;
    sGTDeco                             :String;
    nMaxHitMsgCount                     :integer;
    nMaxSpellMsgCount                   :integer;
    nMaxRunMsgCount                     :integer;
    nMaxWalkMsgCount                    :integer;
    nMaxTurnMsgCount                    :integer;
    nMaxDigUpMsgCount                   :integer;
    boSpellSendUpdateMsg                :boolean;
    boActionSendActionMsg               :boolean;
    boKickOverSpeed                     :boolean;
    btSpeedControlMode                  :integer;
    nOverSpeedKickCount                 :integer;
    dwDropOverSpeed                     :dword;

    dwRunIntervalTime                   :dword; //텝꼍쇌몰
    dwWalkIntervalTime                  :dword; //浬쨌쇌몰
    dwTurnIntervalTime                  :dword; //뻣렘蕨쇌몰

    boDisableStruck                     :boolean; //꼇鞫刻훙膠琨藍땡鱗
    boDisableSelfStruck                 :boolean; //菱성꼇鞫刻훙膠琨藍땡鱗
    dwStruckTime                        :dword; //훙膠琨藍界즛珂쇌
    dwKillMonExpMultiple                :dword; //�국羚�駱굡鑒
    dwRequestVersion                    :dword;
    boHighLevelKillMonFixExp            :boolean;
    boAddUserItemNewValue               :boolean;
    sLineNoticePreFix                   :String;
    sSysMsgPreFix                       :String;
    sGuildMsgPreFix                     :String;
    sGroupMsgPreFix                     :String;
    sHintMsgPreFix                      :String;
    sGMRedMsgpreFix                     :String;
    sMonSayMsgpreFix                    :String;
    sCustMsgpreFix                      :String;
    sCastleMsgpreFix                    :String;
    sGuildNotice                        :String;
    sGuildWar                           :String;
    sGuildAll                           :String;
    sGuildMember                        :String;
    sGuildMemberRank                    :String;
    sGuildChief                         :String;
    boKickAllUser                       :boolean;
    boTestSpeedMode                     :boolean;
    ClientConf                          :TClientConf;
    nWeaponMakeUnLuckRate               :integer;
    nWeaponMakeLuckPoint1               :integer;
    nWeaponMakeLuckPoint2               :integer;
    nWeaponMakeLuckPoint3               :integer;
    nWeaponMakeLuckPoint2Rate           :integer;
    nWeaponMakeLuckPoint3Rate           :integer;
    boCheckUserItemPlace                :boolean;
    SafeAreaHint                        :integer;
    nClientKey                          :integer;
    nLevelValueOfTaosHP                 :integer;
    nLevelValueOfTaosHPRate             :double;
    nLevelValueOfTaosMP                 :integer;
    nLevelValueOfWizardHP               :integer;
    nLevelValueOfWizardHPRate           :double;
    nLevelValueOfWarrHP                 :integer;
    nLevelValueOfWarrHPRate             :double;
    nLevelValueOfAssassinHP             :integer;        //자객 피
    nLevelValueOfAssassinHPRate         :double;
    nLevelValueOfAssassinMP             :integer;
    nProcessMonsterInterval             :integer;
    nExpRate                            :double;       //경험치

    nExChangeGameGoldRate               :double;   //환전 비율 (금전 - 밀환)
    nExChangeGoldRate                   :Integer;   //환전 비율 (밀환 - 금전)

    boSafeCanStore: Boolean;            //안전 개인상점
    boOpenStoreGMMode: Boolean;         //개인상점중 공격 당하나 설정
    boOpenStoreCheckLevel: Boolean;    //개인상점 레벨 제한 사용
    nOpenStoreCheckLevel: Integer;     //개인상점 레벨 제한

    nAllowGameGoldLevel: Integer;     //환충전 레벨 제한
    nAllowPCPointLevel: Integer;  

    //그룹 경험치 설정법
    nGroupExpRate                       :Array[0..GROUPMAX] of double;

    nGroupBuffHp                        :integer;
    nGroupBuffRecHp                     :integer;
    nGroupBuffExp                       :integer;
    nGroupBuffPo                        :integer;


    boIDSocketConnected                 :Boolean;
    UserIDSection                       :TRTLCriticalSection;
    sIDSocketRecvText                   :String;
    IDSocket                            :integer;
    nIDSocketRecvIncLen                 :integer;
    nIDSocketRecvMaxLen                 :integer;
    nIDSocketRecvCount                  :integer;
    nIDReceiveMaxTime                   :integer;
    nIDSocketWSAErrCode                 :integer;
    nIDSocketErrorCount                 :integer;
    nLoadDBCount                        :integer;
    nLoadDBErrorCount                   :integer;
    nSaveDBCount                        :integer;
    nDBQueryID                          :integer;
    UserEngineThread                    :TThreadInfo;
    IDSocketThread                      :TThreadInfo;
    DBSocketThread                      :TThreadInfo;
    boDBSocketConnected                 :boolean;
    nDBSocketRecvIncLen                 :integer;
    nDBSocketRecvMaxLen                 :integer;
    sDBSocketRecvText                   :String;
    boDBSocketWorking                   :boolean;
    nDBSocketRecvCount                  :integer;
    nDBReceiveMaxTime                   :integer;
    nDBSocketWSAErrCode                 :integer;
    nDBSocketErrorCount                 :integer;
    nM2Crc                              :integer;
    nClientFile1_CRC                    :integer;
    nClientFile2_CRC                    :integer;
    nClientFile3_CRC                    :integer;
    GlobaDyMval                         :TGlobaDyMval;
    nCheckLicenseFail                   :integer;
    dwCheckTick                         :LongWord;
    nCheckFail                          :Integer;
    boSendCurTickCount                  :Boolean;
    dwSendWhisperTime                   :LongWord;
    nSendWhisperPlayCount               :Integer;
    boMoveCanDupObj                     :Boolean;
    nProcessTick                        :integer;
    nProcessTime                        :integer;
    nDBSocketSendLen                    :Integer;
    sTestGAPassword                     :String;
    boUseSQL                            :boolean;
    SQLHost                             :string;
    SQLPort                             :integer;
    SQLUsername                         :string;
    SQLPassword                         :string;
    SQLDatabase                         :string;
    SQLType                             :string;
    PosFile                             :string;
    boDropGoldToPlayBag                 :Boolean;
    //여기서부터 영웅
    btHeroNameColor                     :Byte;
    nRecallHeroTime                     :Integer;
    sRecallHeroHint                     :string;
    HeroBagItemCounts                   :array[0..5] of Integer;
    nHeroStartLevel                     :Integer;

    dwHeroWarrorAttackTime: LongWord;
    dwHeroWizardAttackTime: LongWord;
    dwHeroTaoistAttackTime: LongWord;
    dwHeroAssassinAttackTime: LongWord;

    dwHeroItemAttackTime : LongWord;

    dwHeroWalkTime : LongWord;

    boHeroKillByMonstDropUseItem: Boolean;
    boHeroKillByHumanDropUseItem: Boolean;
    boHeroDieScatterBag: Boolean;

    nHeroDieDropUseItemRate: Integer;
    nHeroDieScatterBagRate: Integer;

    vCompoundSet: TCompoundSet;
  end;


  TGameCommand=record
    DATA,
    PRVMSG,
    ALLOWMSG,
    BANSTORE,
    LETSHOUT,
    LETTRADE,
    LETGUILD,
    ENERGY,
    ENDGUILD,
    BANGUILDCHAT,
    BANGROUPCHAT,
    BANSYSMSG,
    BANHEARMSG,
    AUTHALLY,
    ALLIANCE,
    CANCELALLIANCE,
    DIARY,
    USERMOVE,
    SEARCHING,
    ALLOWGROUPCALL,
    GROUPRECALLL,        //그룹 리콜..
    ALLOWGUILDRECALL,
    GUILDRECALLL,
    UNLOCKSTORAGE,
    UNLOCK,
    LOCK,
    PASSWORDLOCK,
    SETPASSWORD,
    CHGPASSWORD,
    CLRPASSWORD,
    UNPASSWORD,
    MEMBERFUNCTION,
    MEMBERFUNCTIONEX,

    DEARRECALL,
    DEARBREAK, //연인 스쳐 해제


    ATTACKMODE,
    REST,
    TAKEONHORSE,
    TAKEOFHORSE,
    HUMANLOCAL,
    MOVE,
    POSITIONMOVE,
    POSITIONGTMOVE,      //장원 이동 명령어
    HOMEMOVE, //마을이동
    REALIVEHOME, //마을부활
    MASKCLEAR,
    GMEVENT,
    INFO,
    MOBLEVEL,
    MOBCOUNT,
    HUMANCOUNT,
    MAP,
    KICK,
    TING,
    SUPERTING,
    MAPMOVE,
    SHUTUP,
    RELEASESHUTUP,
    SHUTUPLIST,
    SVNINFO,
    GAMEMASTER,
    OBSERVER ,
    SUEPRMAN,
    LEVEL,
    SABUKWALLGOLD,
    RECALL,
    REGOTO,
    SHOWFLAG,
    SHOWOPEN,
    SHOWUNIT,
    ATTACK,
    MOB,
    MOBNPC,
    DELNPC,
    ALLLOCK,
    SFC,
    TRACK,
    FIVEGO,
    MAPCLICKMOVE,
    SHOUTGREEN,
    SHOUTPURPLE,
    NPCSCRIPT,
    RECALLMOB,
    LUCKYPOINT,
    LOTTERYTICKET,
    RELOADGUILD,
    LOADGUILD,
    RELOADLINENOTICE,
    RELOADABUSE,
    BACKSTEP,
    BALL,
    FREEPENALTY,
    KILLDEATHZERO,     //킬/데스 초기화
    PKPOINT,
    INCPKPOINT,
    CHANGELUCK,
    HAIR,
    TRAINING,
    DELETESKILL,
    CHANGEJOB,
    CHANGEJOBUP,//등선변환
    CHANGEGENDER,
    NAMECOLOR,
    MISSION,
    MOBPLACE,
    TRANSPARECY,
    DELETEITEM,
    LEVEL0,
    CLEARMISSION,
    SETFLAG,
    SETOPEN,
    SETUNIT,
    RECONNECTION,
    DISABLEFILTER,
    CHGUSERFULL,
    CHGZENFASTSTEP,
    CONTESTPOINT,
    STARTCONTEST,
    ENDCONTEST,
    ANNOUNCEMENT,
    OXQUIZROOM,
    GSA,
    CHANGEITEMNAME,
    DISABLESENDMSG,
    ENABLESENDMSG,
    DISABLESENDMSGLIST,
    KILL,
    MAKE,

    SMAKE,
    YOURMAKE,
    BONUSPOINT,
    DELBONUSPOINT,
    RESTBONUSPOINT,
    FIREBURN,
    TESTFIRE,
    TESTSTATUS,
    DELGOLD,
    ADDGOLD,
    DELGAMEGOLD,
    ADDGAMEGOLD,
    GAMEGOLD,
    GAMEPOINT,
    PCPOINT,
    TESTGOLDCHANGE,
    REFINEWEAPON,
    RELOADADMIN,
    RELOADCOLUMN, //홍보단
    RELOADNPC,
    ADDKILLPOINT, //킬 포인트 주기 명령어
    ADDDEATHPOINT, //데스 포인트 주기 명령어
    RELOADMANAGE,
    RELOADROBOTMANAGE,
    RELOADROBOT,
    RELOADMONITEMS,
    RELOADDIARY,
    RELOADITEMDB,
    RELOADSHOPITEMDB,  //환상점 리로드
    RELOADMAKEITEM,  //제조 리로드
    RELOADFISHITEMDB, //낚시 리로드
    RELOADMAGICDB,
    RELOADMONSTERDB,
    RELOADMINMAP,
    RELOADBIGMAP,
    REALIVE,
    ADJUESTLEVEL,
    ADJUESTEXP,
    ADDGUILD,
    DELGUILD,
    CHANGESABUKLORD,
    FORCEDWALLCONQUESTWAR,
    ADDTOITEMEVENT,
    ADDTOITEMEVENTASPIECES,
    ITEMEVENTLIST,
    STARTINGGIFTNO,
    DELETEALLITEMEVENT,
    STARTITEMEVENT,
    ITEMEVENTTERM,
    ADJUESTTESTLEVEL,
    TRAININGSKILL,
    OPDELETESKILL,
    CHANGEWEAPONDURA,
    RELOADGUILDALL,
    WHO,
    TOTAL,
    TESTGA,
    MAPINFO,
    SBKDOOR,

    STARTQUEST,
    SETPERMISSION,
    SETCOLUMN,
    CLEARMON,
    RENEWLEVEL,
    DENYIPLOGON,
    DENYACCOUNTLOGON,
    DENYCHARNAMELOGON,
    DELDENYIPLOGON,
    DELDENYACCOUNTLOGON,
    DELDENYCHARNAMELOGON,
    SHOWDENYIPLOGON,
    SHOWDENYACCOUNTLOGON,
    SHOWDENYCHARNAMELOGON,
    VIEWWHISPER,
    SPIRIT,
    SPIRITSTOP,
    SETMAPMODE,
    SHOWMAPMODE,
    TESTSERVERCONFIG,
    SERVERSTATUS ,
    TESTGETBAGITEM,
    CLEARBAG,
    SHOWUSEITEMINFO,
    BINDUSEITEM,
    MOBFIREBURN,
    TESTSPEEDMODE,
    GetUserItem,      //회수
    AddUserItem,      //주기
    LOCKLOGON,
    TRADEGT  :TGameCmd;    
  end;

  TIPLocal=procedure (sIPaddr:Pchar;sLocal:Pchar;len:integer);

  pTAdminInfo=^TAdminInfo;
  TAdminInfo=record
    nLv:integer;
    sChrName:String[20];
    sIPaddr:String[15];
  end;

  pTColumnInfo=^TColumnInfo;   //홍보단
  TColumnInfo=record
    nLv:integer;
    sChrName:String[20];
    sIPaddr:String[15];
  end;

  pTMonDrop=^TMonDrop;
  TMonDrop=record
    sItemName:String;
    nDropCount:integer;
    nNoDropCount:integer;
    nCountLimit:integer;
    DateBool:Boolean;
    DateLimit:integer;
  end;

  TMonStatus=(s_KillHuman,s_UnderFire,s_Die,s_MonGen);

  pTMonSayMsg=^TMonSayMsg;
  TMonSayMsg=record
    State:TMonStatus;
    Color:TMsgColor;
    nRate:integer;
    sSayMsg:String;
  end;


  pTDynamicVar=^TDynamicVar;
  TDynamicVar=record
     sName:String;
     VarType:TVarType;
     nInternet:Integer;
     sString:String;
  end;

  pTItemName=^TItemName;
  TItemName=record
    nMakeIndex:integer;
    nItemIndex:integer;
    sItemName:String;
  end;

  TLoadHuman=record
    sAccount:String[16];
    sChrName:String[20];
    sUserAddr:String[15];
    nSessionID:integer;
  end;

  pTSrvNetInfo=^TSrvNetInfo;
  TSrvNetInfo=record
    sIPaddr  :String;
    nPort    :Integer;
  end;

  pTUserOpenInfo=^TUserOpenInfo;
  TUserOpenInfo=record
     sAccount:String[20];
     sChrName:String[20];
     LoadUser:TLoadDBInfo;
     HumanRcd:THumData;
     nResult: Integer;
     NPC: TObject;
  end;

  pTGateObj=^TGateObj;
  TGateObj=record
     DEnvir:TObject;
     nDMapX,
     nDMapY:integer;
     boFlag:Boolean;
  end;

  pTMapQuestInfo=^TMapQuestInfo;
  TMapQuestInfo=record
     nFlag:integer;
     nValue:integer;
     sMonName:string;
     sItemName:String;
     boGrouped:boolean;
     NPC:TObject;
  end;
  pTPowerBlock = ^TPowerBlock;
  TPowerBlock = array[0..100-1] of Word;



  function MakeDefaultMsg (msg:smallint; Recog:integer; param, tag, series:word):TDefaultMessage;
  function APPRfeature(cfeature:integer):Word;
  function RACEfeature(cfeature:integer):Word;
  function HAIRfeature(cfeature:integer):Byte;
  function DRESSfeature(cfeature:integer):Byte;
  function WEAPONfeature(cfeature:integer):Byte;
  function Horsefeature(cfeature:integer):Byte;
  function Effectfeature(cfeature:integer):Byte;
  function MakeHumanFeature(btRaceImg,btDress,btWeapon,btHair:Byte):Integer;
  function MakeMonsterFeature(btRaceImg:Word;wAppr:Word):Integer;
  function StringToMailItem(Msg: String): PNMailItem;
  function MailItemToString(Item: PNMailItem): String;
  function Split(Deliminator: Char; Target: String): TStringList;
  function Join(Glue: String; Target: TStringList): String; overload;
  function Join(Glue: String; Target: TStringList; Start,Finish: Integer): String; overload;
  function BoolToByte(boBool: Boolean): Byte;
  function ByteToBool(boBool: Integer): Boolean;

  function GetSpellPointG(UserMagic: pTUserMagic): Integer;

implementation
uses
  Hutil32;

function ByteToBool(boBool: Integer): Boolean;
begin
  if boBool = 1 then Result := True
  else Result := False;
end;

function BoolToByte(boBool: Boolean): Byte;
begin
  if boBool then Result := 1
  else Result := 0;
end;

function Split(Deliminator: Char; Target: String): TStringList;
var
  i: Integer;
  t: String;
begin
  Result := TStringList.Create;
  t := '';
  for i := 1 to Length(Target) do begin
    if Copy(Target,i,1) = Deliminator then begin
      Result.Add(t);
      t := '';
    end
    else t := t + Copy(Target,i,1);
  end;
  if t <> '' then Result.Add(t);
end;

function Join(Glue: String; Target: TStringList): String;
var
  i: Integer;
begin
  Result := '';

  if Target.Count = 0 then Exit;

  for i := 0 to Target.Count-1 do begin
    if Result <> '' then Result := Result + Glue;
    Result := Result + Target[i];
  end;

end;

function Join(Glue: String; Target: TStringList; Start,Finish: Integer): String;
var
  i: Integer;
begin
  Result := '';

  if Target.Count = 0 then Exit;

  if Start > Target.Count - 1 then Start := Target.Count - 1;
  if Finish > Target.Count - 1 then Finish := Target.Count - 1;
  if Finish = -1 then Finish := Target.Count - 1;
  if Start > Finish then begin
    i := Finish;
    Finish := Start;
    Start := i;
  end;

  for i := Start to Finish do begin
    if Result <> '' then Result := Result + Glue;
    Result := Result + Target[i];
  end;
end;

function MailItemToString(Item: PNMailItem): String;
begin
  Result := '';
  Result := Result+#1+inttostr(Item.Id);
  Result := Result+#1+Item.Sender;
  Result := Result+#1+Item.Recipient;
  Result := Result+#1+Item.Mail;
  Result := Result+#1+inttostr(Item.Status);
  Result := Result+#1+Item.Date;
  Result := Result+#1;
end;

function StringToMailItem(Msg: String): PNMailItem;
var
  sTemp: String;
  P,I: Integer;
begin
  new(Result);
  // This will almost certainly be recoded in the future
  sTemp := '';
  P := 0;
  for I := 1 to Length(Msg) do begin
    if Msg[I] <> #1 then sTemp := sTemp+Msg[I]
    else begin
      Case P of
        1: begin
          Result.Id := strtoint(sTemp);
        end;
        2: begin
          Result.Sender := sTemp;
        end;
        3:  begin
          Result.Recipient := sTemp;
        end;
        4:  begin
          Result.Mail := sTemp;
        end;
        5:  begin
          Result.Status := strtoint(sTemp);
        end;
        6:  begin
          Result.Date := sTemp;
        end;
      end; // Case
      inc(P);
      sTemp := '';
    end;
  end;
end;

function  MakeDefaultMsg (msg:smallint; Recog:integer; param, tag, series:word):TDefaultMessage;
begin
    result.Ident:=Msg;
    result.Param:=Param;
    result.Tag:=Tag;
    result.Series:=Series;
    result.Recog:=Recog;
end;

function WEAPONfeature(cfeature:integer):Byte;
begin
  Result:=HiByte(cfeature);
end;
function DRESSfeature(cfeature:integer):Byte;
begin
  Result:= HiByte(HiWord(cfeature));
end;
function APPRfeature(cfeature:integer):Word;
begin
  Result:=HiWord(cfeature);
end;
function HAIRfeature(cfeature:integer):Byte;
begin
  Result:=HiWord(cfeature);
end;

function RACEfeature(cfeature:integer):Word;
begin
  if LoByte(LoWord(cfeature)) = 0 then
    Result := 0
  else
  Result:=cfeature;
end;

function Horsefeature(cfeature:integer):Byte;
begin
  Result:=LoByte(LoWord(cfeature));
end;

function Effectfeature(cfeature:integer):Byte;
begin
  Result:=HiByte(LoWord(cfeature));
end;

function MakeHumanFeature(btRaceImg,btDress,btWeapon,btHair:Byte):Integer;
begin
  Result:=MakeLong(MakeWord(btRaceImg,btWeapon),MakeWord(btHair,btDress));
end;

function MakeMonsterFeature(btRaceImg:Word;wAppr:Word):Integer;
begin
  Result:=MakeLong(btRaceImg,wAppr);
end;

function GetSpellPointG(UserMagic: pTUserMagic): Integer;
begin
  Result := ROUND(UserMagic.MagicInfo.wSpell / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) +
    UserMagic.MagicInfo.btDefSpell;
end;

{---- Adjust global SVN revision ----}
initialization
  ////SVNRevision('$Id: Grobal2.pas 596 2007-04-11 00:14:13Z sean $');
end.

