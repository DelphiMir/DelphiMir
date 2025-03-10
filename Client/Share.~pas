unit Share;

interface

//uses svn;

const
  RUNLOGINCODE       = 0; //½øÈëÓÎÏ·×´Ì¬Âë,Ä¬ÈÏÎª0 ²âÊÔÎª 9

  STDCLIENT          = 0;
  RMCLIENT           = 99;
  CLIENTTYPE         = RMCLIENT; //ÆÕÍ¨µÄÎª0 ,99 Îª¹ÜÀí¿Í»§¶Ë

  RMCLIENTTITLE      = 'rXyNKR^xVArFWr\x^`PS>xSRCsX'; //'rXyNKR^xVArFWr\x^`PS>xSRCsX';

  DEBUG         = 0;
  SWH800        = 0;
  SWH1024       = 1;
  SWH           = SWH800;

{$IF SWH = SWH800}
   SCREENWIDTH = 800;
   SCREENHEIGHT = 600;
{$ELSEIF SWH = SWH1024}
   SCREENWIDTH = 1024;
   SCREENHEIGHT = 768;
{$IFEND}

   MAPSURFACEWIDTH = SCREENWIDTH;
   MAPSURFACEHEIGHT = SCREENHEIGHT;

   ADDSAYHEIGHT = 16;
   ADDSAYCOUNT = 5;

   WINLEFT = 42;
   WINTOP  = 42;
   WINRIGHT = SCREENWIDTH-42;
   BOTTOMEDGE = SCREENHEIGHT-5;  // Bottom WINBOTTOM

   OPERATEHINTWIDTH = 425;
   OPERATEHINTHEIGHT = 32;
   OPERATEHINTX = 385;
   OPERATEHINTY = 434;//474;

   DEFSCREENWIDTH = 800;
   DEFSCREENHEIGHT = 600;
   DEFMAXSCREENWIDTH = 1024;
   DEFMAXSCREENHEIGHT = 768;


   GETMAPDESCFILE     = 'Config\MapDesc.dat';
   GETMISSIONDESCFILE = 'Config\MissionDesc.dat';

   MAPDIR             = 'Map\'; //µØÍ¼ÎÄ¼þËùÔÚÄ¿Â¼
   CONFIGFILE         = 'Config\%s.ini';
   DG_SAVEDIR         = '.\DB\';
   DG_FORMATSTR       = '%s\%s\%s\';
   FriendListFile     = '.FriendList.txt';
   BlackListFile      = '.BlackList.txt';
   BagItemsFile       = '%s_itm.dat';
   MAINIMAGEFILE      = 'Data\Prguse.wil';
   MAINIMAGEFILE2     = 'Data\Prguse2.wil';
   MAINIMAGEFILE3     = 'Data\Prguse3.wil';
   TITLEIMAGEFILE     = 'Data\Title.wil';
   SNOOPYIMAGEFILE    = 'CustomData\NewPrguse.wil';
   FACEFILE           = 'CustomData\Face.wil';
   BUFFICONFILE       = 'Data\BuffIcon.wil';
   GSKILLIMAGEFILE    = 'Data\GuildSkill.wil';
   EFFECTIMAGEDIR     = 'Data\';
   ITEMDESCFILE       = 'Config\ItemDescription.Dat';
   MAGICDESCFILE      = 'Config\MagicDescription.Dat';

   GUILDMARK          = 'Data\GuildMark.wil';
   CHRSELIMAGEFILE    = 'Data\ChrSel.wil';
   MINMAPIMAGEFILE    = 'Data\mmap.wil';
   FMMAPIMAGEFILE     = 'CustomData\Mir3\fmmap.wil';
   MINIMAP3IMAGEFILE  = 'CustomData\Mir3\mmap.wil';
   SMMAPIMAGEFILE     = 'CustomData\Shanda-Mir2\Smmap.wil';

   NEWCHRSELIMAGEFILE = 'CustomData\NewChrSel.wil';
   HEROCHRSELIMAGEFILE = 'CustomData\HeroChrSel.wil';
   NEWCHRSELUPIMAGEFILE = 'CustomData\NewChrSelUp.wil';
   NEWLOGINIMAGEFILE  = 'CustomData\NewLogin.wil';

   TITLESIMAGEFILE    = 'Data\Tiles.wil';
   SMLTITLESIMAGEFILE = 'Data\SmTiles.wil';
   HUMWINGIMAGESFILE  = 'Data\HumEffect.wil';
   HUMEFFECTGIMAGESFILE  = 'Data\Hum_Effect2.wil';
   HUMWINGIMAGESFILEKILLER = 'Data\HumEffect_Killer.wil';    //ÀÚ°´ ÀÌÆÑÆ®
   HUMWINGIMAGEBonze  = 'Data\Hum_Effect_Bonze.wil';

   WEAPONEFFECTFILE              = 'Data\Weapon_Effect.wil';
   WEAPONEFFECT_Assassin_LFILE   = 'Data\Weapon_Effect_Assassin_Left.wil';
   WEAPONEFFECT_Assassin_RFILE   = 'Data\Weapon_Effect_Assassin_Right.wil';
   WEAPONEFFECT_CommonFILE       = 'Data\Weapon_Effect_Common.wil';
   WEAPONEFFECT_Killer_LFILE     = 'Data\Weapon_Effect_Killer_Left.wil';
   WEAPONEFFECT_Killer_RFILE     = 'Data\Weapon_Effect_Killer_Right.wil';
   WEAPONEFFECT_MonkFILE         = 'Data\Weapon_Effect_Monk.wil';
   WEAPONEFFECT_WarriorFILE      = 'Data\Weapon_Effect_Warrior.wil';
   WEAPONEFFECT_WizardFILE       = 'Data\Weapon_Effect_Wizard.wil';

   WEAPONEFFECTBONZEFILE  = 'Data\Weapon_Effect_Bonze.wil';

   HUMUPCOMEFFECT         = 'Data\HumUp_Common_Effect.wil';
   HUMUPWARREFFECT        = 'Data\HumUp_Warrior_Effect.wil';
   HUMUPWIZEFFECT         = 'Data\HumUp_Wizard_Effect.wil';
   HUMUPMONKEFFECT        = 'Data\HumUp_Monk_Effect.wil';
   HUMUPASSAEFFECT        = 'Data\HumUp_Assassin_Effect.wil';

   MAGICONIMAGESFILE  = 'Data\MagIcon.wil';
   MAGICON2IMAGESFILE  = 'Data\MagIcon2.wil';
   MAGNEWICONIMAGESFILE    = 'Data\MagNIcon.wil';
   MAGNEWICON2IMAGESFILE   = 'Data\MagNIcon2.wil';
   TIGERIMGIMAGESFILE = 'Data\Ride.wil';   //È£¶ûÀÌ
   TIGERUPIMGIMAGESFILE = 'Data\Ride2.wil';   //µî¼± È£¶ûÀÌ
   HUMIMGIMAGESFILE   = 'Data\Hum.wil';
   HUM2IMGIMAGESFILE  = 'Data\Hum2.wil';
   HUM3IMGIMAGESFILE  = 'Data\Hum3.wil';
   HUM4IMGIMAGESFILE  = 'CustomData\Hum4.wil';
   HUMBONZEIMGIMAGESFILE  = 'Data\Hum_Bonze.wil';
   HUM_KillerIMGIMAGESFILE  = 'Data\Hum_Killer.wil';         //ÀÚ°´ ÀÌµ¿ ¸ð¼Ç 1
   HUM_Killer2IMGIMAGESFILE = 'Data\Hum_Killer2.wil';        //ÀÚ°´ ÀÌµ¿ ¸ð¼Ç 2
   HUM_Killer4IMGIMAGESFILE = 'CustomData\Hum_Killer4.wil'; 

   HUMUP_COMMONIMGIMAGESFILE = 'Data\HumUp_Common.wil';      //µî¼± ÀÌµ¿ ¸ð¼Ç
   HUMUP_WARRIMGIMAGESFILE = 'Data\HumUp_Warrior.wil';      //º®Ç÷Àü»ç ÀÌµ¿ ¸ð¼Ç
   HUMUP_WIZIMGIMAGESFILE = 'Data\HumUp_Wizard.wil';      //È«Çö¼ú»ç ÀÌµ¿ ¸ð¼Ç
   HUMUP_MONKIMGIMAGESFILE = 'Data\HumUp_Monk.wil';      //ÀÍ¼±µµ»ç ÀÌµ¿ ¸ð¼Ç
   HUMUP_AssassinIMGIMAGESFILE = 'Data\HumUp_Assassin.wil';      //ºñ¿¬ÀÚ°´ ÀÌµ¿ ¸ð¼Ç
   HAIRIMGIMAGESFILE  = 'Data\Hair.wil';
   HAIRCOMIMGIMAGESFILE  = 'Data\Hair_Common.wil';

   HAIR_KillerIMGIMAGESFILE = 'Data\Hair_Killer.wil';         //ÀÚ°´ Çì¾î
   HAIR_WARRIMGIMAGESFILE = 'Data\Hair_Warrior.wil';         //º®Ç÷Àü»ç Çì¾î
   HAIR_WIZIMGIMAGESFILE = 'Data\Hair_Wizard.wil';         //È«Çö¼ú»ç Çì¾î
   HAIR_MONKIMGIMAGESFILE = 'Data\Hair_Monk.wil';         //ÀÍ¼±µµ»ç Çì¾î
   HAIR_AssassinIMGIMAGESFILE = 'Data\Hair_Assassin.wil';         //ºñ¿¬ÀÚ°´ Çì¾î
   HORSEIMAGEFILE     = 'Data\Horse.wil';
   HELMETIMAGEFILE    = 'Data\Helmet.wil';
   WEAPONIMAGESFILE   = 'Data\Weapon.wil';

   Fishing            = 'Data\Fishing.wil';    //³¬½Ã ¹«±â ÀÏ¹Ý ÀÌ¹ÌÁö
   Fishing2           = 'Data\Fishing2.wil';   //³¬½Ã ¹«±â µî¼± ÀÌ¹ÌÁö
   WEAPON_COMMIMAGESFILE   = 'Data\Weapon_Common.wil';    //µî¼±¹«±â
   WEAPONBONZEIMAGESFILE   = 'Data\Weapon_Bonze.wil';
   WEAPONIMAGESFILE2   = 'Data\Weapon_Killer_Left.wil';       //ÀÚ°´ ¿ÞÂÊ ¹«±â
   WEAPONIMAGESFILE3   = 'Data\Weapon_Killer_Right.wil';      //ÀÚ°´ ¿À¸¥ÂÊ ¹«±â

   WEAPON_WARRIMAGESFILE   = 'Data\Weapon_Warrior.wil';      //º®Ç÷Àü»ç ¹«±â
   WEAPON_WIZIMAGESFILE   = 'Data\Weapon_Wizard.wil';      //È«Çö¼ú»ç ¹«±â
   WEAPON_MONKIMAGESFILE   = 'Data\Weapon_Monk.wil';      //ÀÍ¼±µµ»ç ¹«±â

   WEAPON_ASS_RIGHTIMAGESFILE   = 'Data\Weapon_Assassin_Right.wil';      //ºñ¿¬ÀÚ°´ ¿À¸¥ÂÊ ¹«±â
   WEAPON_ASS_LEFTIMAGESFILE   = 'Data\Weapon_Assassin_Left.wil';       //ºñ¿¬ÀÚ°´ ¿ÞÂÊ ¹«±â
   NPCIMAGESFILE      = 'Data\Npc.wil';
   NEWNPCIMAGESFILE   = 'CustomData\NewNpc.wil';
   MAGICIMAGESFILE    = 'Data\Magic.wil';
   MAGIC0IMAGESFILE   = 'Data\Magic0.wil';
   MAGIC2IMAGESFILE   = 'Data\Magic2.wil';
   MAGIC3IMAGESFILE   = 'Data\magic3.wil';
   MAGIC4IMAGESFILE   = 'Data\magic4.wil';
   MAGIC5IMAGESFILE   = 'Data\magic5.wil';
   MAGIC6IMAGESFILE   = 'Data\magic6.wil';
   MAGICNEWIMAGESFILE = 'Data\magicNew.wil';
   MAGICUPIMAGESFILE  = 'Data\magicUp.wil';
   MAGICBONZEIMAGESFILE = 'Data\magic_Bonze.wil';
   EVENTEFFECTIMAGESFILE = EFFECTIMAGEDIR + 'Event.wil';
   BAGITEMIMAGESFILE   = 'Data\Items.wil';
   STATEITEMIMAGESFILE = 'Data\StateItem.wil';      //»óÅÂÃ¢ ±âº»

   STATEITEMHUMUPMANIMAGESFILE = 'Data\StateItem_Common_Man.wil'; //»óÅÂÃ¢ µî¼± °ø¿ë ³²ÀÚ
   STATEITEMHUMUPWOMANIMAGESFILE = 'Data\StateItem_Common_Woman.wil';  //»óÅÂÃ¢ µî¼± °ø¿ë ¿©ÀÚ

   STATEITEMWARRMANIMAGESFILE = 'Data\StateItem_Warrior_Man.wil';      //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
   STATEITEMWARRWOIMAGESFILE = 'Data\StateItem_Warrior_WoMan.wil';       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)

   STATEITEMWIZMANIMAGESFILE = 'Data\StateItem_Wizard_Man.wil';      //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
   STATEITEMWIZWOIMAGESFILE = 'Data\StateItem_Wizard_WoMan.wil';       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)

   STATEITEMMONKMANIMAGESFILE = 'Data\StateItem_Monk_Man.wil';      //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
   STATEITEMMONKWOIMAGESFILE = 'Data\StateItem_Monk_WoMan.wil';       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)

   STATEITEMASSMANIMAGESFILE = 'Data\StateItem_Assassin_Man.wil';      //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(³²)
   STATEITEMASSWOIMAGESFILE = 'Data\StateItem_Assassin_WoMan.wil';       //»óÅÂÃ¢ ºñ¿¬ÀÚ°´(¿©)

   STATEEFFECT                 = 'Data\Stateitem_Effect.wil';
   STATEEFFECT_Assassin_Man    = 'Data\Stateitem_Effect_Assassin_Man.wil';
   STATEEFFECT_Assassin_Woman  = 'Data\Stateitem_Effect_Assassin_Woman.wil';
   STATEEFFECT_Common_Man      = 'Data\Stateitem_Effect_Common_Man.wil';
   STATEEFFECT_Common_Woman    = 'Data\Stateitem_Effect_Common_Woman.wil';
   STATEEFFECT_Monk_Man        = 'Data\Stateitem_Effect_Monk_Man.wil';
   STATEEFFECT_Monk_Woman      = 'Data\Stateitem_Effect_Monk_Woman.wil';
   STATEEFFECT_Warrior_Man     = 'Data\Stateitem_Effect_Warrior_Man.wil';
   STATEEFFECT_Warrior_Woman   = 'Data\Stateitem_Effect_Warrior_Woman.wil';
   STATEEFFECT_Wizard_Man      = 'Data\Stateitem_Effect_Wizard_Man.wil';
   STATEEFFECT_Wizard_Woman    = 'Data\Stateitem_Effect_Wizard_Woman.wil';

   STATEEFFECTBONZE    = 'Data\Stateitem_Effect_Bonze.wil';      //½Â·Á »óÅÂÃ¢ ÀÌÆÑÆ®

   DNITEMIMAGESFILE    = 'Data\DnItems.wil';
   OBJECTIMAGEFILE     = 'Data\Objects.wil';
   OBJECTIMAGEFILE1    = 'Data\Objects%d.wil';

   SOBJECTIMAGEFILE     = 'CustomData\Shanda-Mir2\Objects.wil';
   SOBJECTIMAGEFILE1    = 'CustomData\Shanda-Mir2\Objects%d.wil';

   MONIMAGEFILE        = 'Data\Mon%d.wil';
   DRAGONIMAGEFILE     = 'Data\Dragon.wil';
   PETIMAGEFILE        = 'Data\Pet.wil';
   DECOIMAGEFILE       = 'Data\Deco.wil';
   EFFECTIMAGEFILE     = 'Data\Effect.wil';
   MONNEWKULOUFILE     = 'Data\Mon-kulou.wil';
   TRANSFORMIMAGEFILE  = 'Data\TransForm.wil'; //º¯½ÅÅ»
   TRANSFORMEFFECTIMAGEFILE = 'Data\TransFormEffect.wil';
   TRANSFORMWEAPONEFFECTIMAGEFILE = 'Data\TransFormWeaponEffect.wil';

   MONIMAGEFILEEX      = 'Graphics\Monster\%d.wil';
   MONPMFILE           = 'Graphics\Monster\%d.pm';
   
  MAXX = 52;//SCREENWIDTH div 20;
  MAXY = 40;// SCREENWIDTH div 20;

  DEFAULTCURSOR = 0; //ÏµÍ³Ä¬ÈÏ¹â±ê
  IMAGECURSOR   = 1; //Í¼ÐÎ¹â±ê

  USECURSOR     = DEFAULTCURSOR; //Ê¹ÓÃÊ²Ã´ÀàÐÍµÄ¹â±ê

  MAXBAGITEMCL = 52;

  MAXSTORAGEITEMCL = 80;
  MAXFONT = 8;
  ENEMYCOLOR = 69;

  // 2003/02/11 ±×·ì¿ø Ç¥½Ã
  MAXVIEWOBJECT = 20;

  TIGER1  = 'OrangeTiger';     //È£¶ûÀÌ
  TIGER2  = 'BlueTiger';
  TIGER3  = 'GreyTiger';
  TIGER4  = 'SilverTiger';
  TIGER5  = 'BlackTiger';
  TIGER6  = 'RedTiger';
  TIGER7  = 'WhiteTiger';
var
  g_FScreenMode: Byte = 0;
  g_FScreenMode2: Byte = 0;
  g_FScreenWidth: Integer = DEFSCREENWIDTH;
  g_FScreenHeight: Integer = DEFSCREENHEIGHT;

implementation

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Share.pas 502 2006-11-02 08:10:23Z sean $');
end.
