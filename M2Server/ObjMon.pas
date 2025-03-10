unit ObjMon;

interface
uses
  {svn,} Windows,Classes,HUtil32,Grobal2,ObjBase, SysUtils;
type
  TMonster = class(TAnimalObject)
    n54C           :Integer;     //0x54C
    m_dwThinkTick  :LongWord;    //0x550
    bo554          :Boolean;     //0x554
    m_boDupMode    :Boolean; //0x555
    m_boApproach   :Boolean; //wether or not a mob should go near his target or not
  private
    function Think: Boolean;
    function MakeClone(sMonName:String;OldMon:TBaseObject):TBaseObject;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    function AttackTarget():Boolean; virtual; //FFEB
    procedure Run; override;
  end;

  TChickenDeer = class(TMonster)
  private

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;
  TATMonster = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;
  TSlowATMonster = class(TATMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
  end;
  TScorpion = class(TATMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
  end;
  TSpitSpider = class(TATMonster)
    m_boUsePoison    :Boolean;
  private
    procedure SpitAttack(btDir:Byte);
  public
    constructor Create();
    destructor Destroy; override;
    function AttackTarget():Boolean; override;
  end;
  THighRiskSpider = class(TSpitSpider)
  private

  public
    constructor Create();
    destructor Destroy; override;
  end;
  TBigPoisionSpider = class(TSpitSpider)
  private

  public
    constructor Create();
    destructor Destroy; override;
  end;
  TGasAttackMonster = class(TATMonster)
  private

  public
    constructor Create();
    destructor Destroy; override;
    function  AttackTarget:Boolean;override;
    function  sub_4A9C78(bt05:Byte):TBaseObject;virtual;//FFEA
  end;
  TCowMonster = class(TATMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
  end;
  TMagCowMonster = class(TATMonster)
  private
    procedure sub_4A9F6C(btDir:Byte);
  public
    constructor Create();
    destructor Destroy; override;
    function  AttackTarget:Boolean;override;
  end;
  TCowKingMonster = class(TATMonster) //¿ì¸é±Í¿Õ
    dw558    :LongWord;
    bo55C    :Boolean;
    bo55D    :Boolean;
    n560     :integer;
    dw564    :LongWord;
    dw568    :LongWord;
    dw56C    :LongWord;
    dw570    :LongWord;
  private

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure Initialize();override;
  end;

  TElectronicScolpionMon = class(TMonster)    //Èæ»ç¿Õ
  private
    m_boUseMagic:Boolean;
    procedure LightingAttack(nDir:Integer);
  public
    constructor Create();
    destructor Destroy; override;

    function MagCanHitTarget(nX, nY:Integer;TargeTBaseObject: TBaseObject): Boolean;override;
    procedure Run;override;
  end;

  TMermaidMon = class(TMonster)  //¾î¹ýÀÎ
  private
    m_boUseMagic:Boolean;
    procedure LightingAttack(nDir:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    function MagCanHitTarget(nX, nY:Integer;TargeTBaseObject: TBaseObject): Boolean;override;
    procedure Run;override;
  end;

  TMermaidMon2 = class(TMonster)  //°¢¼¶
  private
    m_boUseMagic:Boolean;
    procedure LightingAttack(nDir:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    function MagCanHitTarget(nX, nY:Integer;TargeTBaseObject: TBaseObject): Boolean;override;
    procedure Run;override;
  end;

  TMermaidMon3 = class(TMonster)  //ÀÎ¿ë
  private
    m_boUseMagic:Boolean;
    procedure LightingAttack(nDir:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    function MagCanHitTarget(nX, nY:Integer;TargeTBaseObject: TBaseObject): Boolean;override;
    procedure Run;override;
  end;


  TCrystalSpider = class (TElectronicScolpionMon)
  private
  public
    function AttackTarget():Boolean; override;//FFEB
    constructor Create();
    destructor Destroy; override;
  end;

  TCrystalSpider2 = class (TElectronicScolpionMon)
  private
  public
    function AttackTarget():Boolean; override;//FFEB
    constructor Create();
    destructor Destroy; override;
  end;
  TGumimasin = class(TAnimalObject)
  private
    ldistx:Integer;
    ldisty:Integer;
    m_dwSpellTick  :LongWord;
    function AttackTarget():boolean;
    procedure RepulseCircle();
    procedure RedCircle();
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TDigOutGusle = class(TMonster) //±¸½½
  private
    procedure sub_4AA8DC;
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  TGuJangHwa = class(TMonster)   //°ÅÀåÈ­
  private
    HideMode :Boolean;
    procedure sub_4AA8DC(mode:Byte);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
    procedure RangeAttack (targ: TBaseObject);
    function  AttackTarget: Boolean; override;
  end;


  TLightingZombi = class(TMonster)
  private
    procedure LightingAttack(nDir:Integer);

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;
  TDigOutZombi = class(TMonster)
  private
    procedure sub_4AA8DC;

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;
  TZilKinZombi = class(TATMonster)
    dw558   :LongWord;
    nZilKillCount    :Integer;
    dw560    :LongWord;
  private

  public
    constructor Create();
    destructor Destroy; override;
    procedure Die;override;
    procedure Run;override;
  end;
  TWhiteSkeleton = class(TATMonster)   //¹é°ñ
  private
    m_boIsFirst    :Boolean; //0x7A0
    procedure Reset; //0x00509C88
  public
    constructor Create(); //0x00509C08
    procedure RecalcAbilitys();override; //0x00509C74
    procedure Run;override; //0x00509CE8
  end;
  TJinWhiteSkeleton = class(TATMonster)   //Áø°ñ
  private
    m_boIsFirst    :Boolean; //0x7A0
    procedure Reset; //0x00509C88
  public
    constructor Create(); //0x00509C08
    procedure RecalcAbilitys();override; //0x00509C74
    procedure Run;override; //0x00509CE8
  end;
  TScultureMonster = class(TMonster)
  private
    procedure MeltStone;//
    procedure MeltStoneAll;

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;
  TScultureMonster2 = class(TMonster)
  private
    procedure MeltStone;//
    procedure MeltStoneAll;

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  TScultureKingMonster = class(TMonster)     //ÁÖ¸¶¿Õ
  private
    m_nDangerLevel       :Integer;
    m_SlaveObjectList  :TList;//0x55C
  public
    BoCallFollower: Boolean;
    procedure MeltStone;
    procedure CallSlave; dynamic;
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
    procedure Run;override;
  end;

  TLegendScultureKingMonster = class(TMonster)     //°í´ëÁÖ¸¶¿Õ
  private
    m_nDangerLevel       :Integer;
    m_SlaveObjectList  :TList;//0x55C
  public
    BoCallFollower: Boolean;
    procedure MeltStone;
    procedure CallSlave; dynamic;
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
    procedure Run;override;
  end;

  TBigPotKing = class(TMonster)     //È£ÁßÃµ
  public
    ChainShot: integer;
    ChainShotCount: integer;
    constructor Create();
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack (targ: TBaseObject);
    function  AttackTarget: Boolean; override;
  end;


  TBossTreeman = class(TMonster)     //¿©ÇÏ¼ö
  public
    ChainShot: integer;
    ChainShotCount: integer;
    constructor Create();
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;   //ÁÖº¯ °ø°Ý  3380
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);  //ÁÖº¯ °ø°Ý 3440
    procedure Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¹Ð±â  3410
    procedure RangeAttack (targ: TBaseObject);   //ÀüÃ¼ Æø¹ß  3360
    procedure RangeAttack2 (targ: TBaseObject);  //ÀüÃ¼ À§¿¡¼­ ¼Ú¾Æ³²  3480
    function  AttackTarget: Boolean; override;
  end;

  TElectBossMon = class(TMonster)     //¾ÏÈæ¼±Àå
  public
    ChainShot: integer;
    ChainShotCount: integer;
    constructor Create();
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;   //ÁÖº¯ °ø°Ý  3380
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);  //ÁÖº¯ °ø°Ý 3440
    procedure Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¹Ð±â  3410
    procedure RangeAttack (targ: TBaseObject);   //ÀüÃ¼ Æø¹ß  3360
    function  AttackTarget: Boolean; override;
    function      FindTarget: Boolean;
  end;

  TTreeTuttle = class(TMonster)    //½£°ÅºÏÀÌ
  private
    procedure MeltStone;
    procedure MeltStoneAll;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure RangeAttack (TargeTBaseObject: TBaseObject);
    procedure Run;override;
  end;

  TTreeJungBack = class(TMonster)     //»ï³ª¹«Á¤¹é
  private
    procedure MeltStone;
    procedure MeltStoneAll;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure RangeAttack (TargeTBaseObject: TBaseObject);
    procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
    procedure Run;override;
  end;


  TWindLead = class(TMonster)     //¸¶Ç³¼®±«
  private
    m_nDangerLevel       :Integer;
  public
    ChainShot: integer;
    ChainShotCount: integer;
    BoCallFollower: Boolean;
    procedure CallSlave2(targ: TBaseObject); //¼ÒÈ¯ ¸ð¼Ç ¹Ø ÀÌÆÑÆ®
    constructor Create();
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;   //ÁÖº¯ °ø°Ý  3380
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);  //ÁÖº¯ °ø°Ý 3440
    procedure Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¹Ð±â  3410
    procedure RangeAttack (targ: TBaseObject);   //ÀüÃ¼ Æø¹ß  3360
    procedure RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼ Æø¹ß  3360
    procedure RangeAttack3 (targ: TBaseObject);
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TNammanKingMonster = class(TMonster)     //´Ü¹¬
  private
    m_nDangerLevel       :Integer;
    m_SlaveObjectList  :TList;
    m_SlaveObjectList1  :TList;
    m_SlaveObjectList2  :TList;
    m_SlaveObjectList3  :TList;
  public
    BoCallFollower: Boolean;
    procedure CallSlave2(targ: TBaseObject);
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //ÀÏ¹Ý°ø°Ý
    procedure RangeAttack (targ: TBaseObject);  //´Ü¹¬ À½ÆÄ ÀüÃ¼°ø°Ý
    procedure RangeAttack2 (targ: TBaseObject);   //´Ü¹¬ ¿ø°Å¸® 1ÀÎ °ø°Ý
    procedure RangeAttack3 (targ: TBaseObject);   //´Ü¹¬ ÀÏ¹Ý°ø°Ý
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TMerMaidKingMon = class(TMonster)     //¼ö¾î±Í
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //ÀÏ¹Ý°ø°Ý
    procedure RangeAttack (targ: TBaseObject);  //¼ö¾î±Í ÀüÃ¼°ø°Ý
    procedure RangeAttack2 (targ: TBaseObject);   //¼ö¾î±Í ¿ø°Å¸® 1ÀÎ ¹°°ø°Ý1
    procedure RangeAttack3 (targ: TBaseObject);   //¼ö¾î±Í µ¹µ¢ÀÌ
    procedure RangeAttack4 (targ: TBaseObject);   //¼ö¾î±Í ¿ø°Å¸® 1ÀÎ ¹°°ø°Ý2
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TGoblinKing = class(TMonster)     //¿ø¿À
  private
    m_nDangerLevel       :Integer;
  public
    BoCallFollower: Boolean;
    procedure CallSlave2(targ: TBaseObject); //¼ÒÈ¯ ¸ð¼Ç ¹Ø ÀÌÆÑÆ®
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //ÀÏ¹Ý°ø°Ý  ÀÌÆÑÆ®
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÀÏ¹Ý°ø°Ý Çìºñ ÀÌÆÑÆ®
    procedure RangeAttack (targ: TBaseObject);  //ÀüÃ¼°ø°Ý ¹Ù´Ú¿¡¼­ ¼Õ
    procedure RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼°ø°Ý Æø¹ßÀÌÆÑÆ®
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TGukguljang = class(TMonster)     //°Ý±«Àå
  private
    m_nDangerLevel       :Integer;
  public
    BoCallFollower: Boolean;
    procedure CallSlave2(targ: TBaseObject); //¼ÒÈ¯ ¸ð¼Ç ¹Ø ÀÌÆÑÆ®
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //ÀÏ¹Ý°ø°Ý  ÀÌÆÑÆ®
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÀÏ¹Ý°ø°Ý Çìºñ ÀÌÆÑÆ®
    procedure Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack (targ: TBaseObject);  //ÀüÃ¼°ø°Ý ¹Ù´Ú¿¡¼­ ¼Õ
    procedure RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼°ø°Ý Æø¹ßÀÌÆÑÆ®
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;


  TGanesha = class(TMonster)     //°¡³×¼ö
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //ÀÏ¹Ý°ø°Ý  ÀÌÆÑÆ®
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÀÏ¹Ý°ø°Ý Çìºñ ÀÌÆÑÆ®
    procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼°ø°Ý Æø¹ßÀÌÆÑÆ®
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TGreatKing = class(TMonster)     //¿°¸¶ÅÂÀÚ
  public
    BoCallFollower: Boolean;
    BoCallFollower1: Boolean;
    BoCallFollower2: Boolean;
    BoCallFollower3: Boolean;
    BoCallFollower4: Boolean;
    sectick: longword;
    constructor Create();
    destructor Destroy; override;
    procedure RangeAttack (targ: TBaseObject);  //ÀüÃ¼°ø°Ý ¹Ù´Ú¿¡¼­ ¼Õ
    procedure RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼°ø°Ý Æø¹ßÀÌÆÑÆ®
    function  FindTarget: Boolean;
    procedure Die; override;
    procedure Run; override; //reintroduce;
    function  AttackTarget: Boolean; override;
  end;

  TMillstoneKing  = class(TMonster)   //¼®¸¶¼ö
  private
    ChainShotCount: integer;
    ChainShot: integer;
    dw558    :LongWord;
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure RangeAttack (targ: TBaseObject);
    procedure RangeAttack2 (targ: TBaseObject);
    procedure RangeAttack3 (targ: TBaseObject);
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TPeacockspider = class(TMonster)   //°øÀÛÁÖ
  private
    ChainShotCount: integer;
    ChainShot: integer;
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;  //°øÀÛÁÖ ÀÏ¹Ý   hit
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);  //°øÀÛÁÖ ÁÖº¯ 5X5  l
    procedure RangeAttack (targ: TBaseObject);     //°øÀÛÁÖ °Å¹ÌÁÙ     l_2
    procedure RangeAttack2 (targ: TBaseObject);    //°øÀÛÁÖ µ¶¶³¾îÁö±â  l_3
    procedure RangeAttack3 (targ: TBaseObject);    //°øÀÛÁÖ ½ºÅÏ
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TOmaDarkKing = class(TMonster)   //¿À¸¶Èæ·É
  private
    ChainShotCount: integer;
    ChainShot: integer;
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack (targ: TBaseObject);
    procedure RangeAttack2 (targ: TBaseObject);
    procedure RangeAttack3 (targ: TBaseObject);
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TIceHellKing = class(TMonster)   //ÇÑºù¼öÈ£±Í
  private
    ChainShotCount: integer;
    ChainShot: integer;
  public
    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack (targ: TBaseObject);
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;

  TGeneralCat  = class(TMonster)   //Áø¹¦Àå±º
  private
    ChainShotCount: integer;
    ChainShot: integer;
    m_nDangerLevel:Integer;
  public
    BoCallFollower: Boolean;
    procedure CallSlave2(targ: TBaseObject); //¼ÒÈ¯ ÀÌÆÑÆ®

    constructor Create();
    destructor Destroy; override;
    procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);
    procedure RangeAttack (targ: TBaseObject);
    procedure Run;override;
    function  AttackTarget: Boolean; override;
  end;


  TPotMon = class(TMonster)    //È£Áß±Í
  private
    m_SlaveObjectList  :TList;//0x55C
  public
    BoCallFollower2: Boolean;
    procedure CallSlave; dynamic;
    constructor Create();
    destructor Destroy; override;
  //  procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
    procedure RangeAttack (targ: TBaseObject); //dynamic;
    procedure Run;override;
  end;

    // 2003/02/11 ÇØ°ñ¹Ý¿Õ, ÇØ°ñº´Á¹ (¿ø°Å¸® Á÷Á¢°ø°Ý)
   TSkeletonKingMonster = class (TScultureKingMonster)   //ÇØ°ñ¹Ý¿Õ
   public
      RunDone: Boolean;
      ChainShot: integer;
      ChainShotCount: integer;
      constructor Create();
      procedure CallSlave; override;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
      procedure Run; override;
      procedure RangeAttack (targ: TBaseObject); dynamic;
      function  AttackTarget: Boolean; override;
   end;

   // 2003/02/11 ÇØ°ñº´Á¹ (¿ø°Å¸® Á÷Á¢°ø°Ý)
   TSkeletonSoldier = class (TATMonster)
   private
   public
      constructor Create;
      procedure RangeAttack (dir: byte);
      function  AttackTarget: Boolean; override;
   end;

   // ¹æ¿ø±Íº´
   TIceSoldier = class (TATMonster)
   private
   public
      constructor Create;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; dir: byte);
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer); //0FFED
      function  AttackTarget: Boolean; override;
   end;


   TPotMon1 = class (TScultureKingMonster)   //È£Áß±Í1
   public
      RunDone: Boolean;
      BoCallFollower2 : Boolean;
      constructor Create();
      procedure CallSlave; override;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
      procedure Run; override;
      procedure RangeAttack (targ: TBaseObject); dynamic;
      function  AttackTarget: Boolean; override;
   end;

   //»ç¿ìÃµ¿Õ (±Ù°Å¸® Á÷Á¢°ø°Ý, ¿ø°Å¸® ¸¶¹ý°ø°Ý, ½ºÇÃ·¹½¬ µ¥¹ÌÁö)
   TDeadCowKingMonster = class (TSkeletonKingMonster)          //»ç¿ìÃµ¿Õ
   public
      constructor Create;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

    //Á¶ÀÎ»ó (±Ù°Å¸® Á÷Á¢°ø°Ý, ¿ø°Å¸® ¸¶¹ý°ø°Ý, ½ºÇÃ·¹½¬ µ¥¹ÌÁö)
   TImpressionKingMon  = class (TSkeletonKingMonster)
   private
    WarpTime: longword;
   public
      constructor Create;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
      procedure Attack2(TargeTBaseObject: TBaseObject);
      procedure Attack3(TargeTBaseObject: TBaseObject);
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject); //override;
      function Operate(ProcessMsg:pTProcessMessage):Boolean;  override;
      function  AttackTarget: Boolean; override;
   end;

   //¿­ÀåÀû±Í
   TFireConvene = class (TSkeletonKingMonster)         //¿­ÀåÀû±Í
   public
      constructor Create;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override; //0FFED
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;


   //¿ªÃµ±Í
   TAgainst = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   //ÈæÃµ±Í
   TDarkShine = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   //ÇÑÃµ±Í
   THanShine = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   //±¤ÇÑ½Ã
   TCrazyShine = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   //¹Ý¾ßÁÂ»ç ¿ì»ç (±Ù°Å¸® ¸¶¹ý°ø°Ý, ¿ø°Å¸® ¸¶¹ý°ø°Ý)
   TBanyaGuardMonster = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;
   //ÅÂ±¸¿À¸¶
   TTeguOmaMonster = class (TATMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;
   //¿À¸¶Á¦»çÀå
   TOmaJeSaMonster = class (TATMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   //ÀÎ°£¼ö
   THumMon = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   TShamanCat = class (TSkeletonKingMonster)   //¹«´ç±ªÀÌ
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   TJumaWizard = class (TSkeletonKingMonster)   //ÁÖ¸¶¼ú»ç
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   TJumaFireArc = class (TSkeletonKingMonster)   //ÁÖ¸¶È­±Ã»ç
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   TIceArc = class (TSkeletonKingMonster)   //ºù¿ø±Í±Ã»ç
   public
      constructor Create;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   IIceZone = class(TATMonster)     //ºù¿ø±ÍÁ¸
   public
     constructor Create;
     destructor Destroy; override;
     procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
     procedure RangeAttack (TargeTBaseObject: TBaseObject);
     procedure Run;override;
   end;

   IIceDevil = class(TATMonster)     //¾Ç±Í
   public
     constructor Create;
     destructor Destroy; override;
     procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
     procedure RangeAttack (TargeTBaseObject: TBaseObject);
     procedure RangeAttack2 ();
     procedure Die;override;
     procedure Run;override;
   end;

   TJumaWindArc = class (TSkeletonKingMonster)   //ÁÖ¸¶È­±Ã»ç
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;


   TOldKingMonster = class (TSkeletonKingMonster)   //°í´ë¼öÈ£Àå
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   //¼öÈ£±Í»ç
   TSaveGuardMonster = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

   //ºñÈ£±Í¸¶
   TAglyGuard = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;
   //¶¥µÎ²¨ºñ
   TEarthToad = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;
   //¹®Á¶ÀÎ
   TBirdMan = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject); override;
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   TPBKingMonster = class (TDeadCowKingMonster)      //ÆÄÈ²¸¶½Å ¿Õ
   public
      constructor Create;
      procedure Attack(TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
      procedure Run; override;
   end;

   TPhisicalFarAttackMonster = class (TSkeletonKingMonster)
   public
      constructor Create;
      procedure RangeAttack (targ: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

  TGasMothMonster = class(TGasAttackMonster) //½û±â³ª¹æ
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
    function  sub_4A9C78(bt05:Byte):TBaseObject;override;//FFEA
  end;

  TGasDungMonster = class(TGasAttackMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
  end;

  TElfMonster = class(TMonster)
  private
    boIsFirst    :Boolean;  //0x7A0
  
    procedure AppearNow;
    procedure ResetElfMon;
  public
    constructor Create();
    procedure RecalcAbilitys(); override;
    procedure Run; override;
  end;

  TElfWarriorMonster = class(TSpitSpider)
  private
    boIsFirst    :Boolean;    //0x560
    dwDigDownTick:LongWord;   //0x564
  
    procedure AppearNow;
    procedure ResetElfMon;
  public
    constructor Create();
    procedure RecalcAbilitys(); override;
    procedure Run; override;
  end;

  TDoubleCriticalMonster = class (TATMonster)   ///°­·ÂÇÑ µÎÄ­ Å©¸®Æ¼ÄÃÀ» °¡ÇÏ´Â ¸ó½ºÅÍ
   public
      criticalpoint: integer;
      constructor Create;
      procedure DoubleCriticalAttack (TargeTBaseObject: TBaseObject; dir: byte);
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      function  AttackTarget: Boolean; override;
   end;


  THeal = class(TAnimalObject)
  private
    m_dwSpellTick:LongWord;
    procedure RM_10414();
  public
    constructor Create();
    destructor Destroy; override;

    function AttackTarget():Boolean;virtual;
    procedure Run;override;
  end;

  TJumaThunder = class(TScultureMonster)
    m_dwSpellTick : LongWord;
  private
    procedure     RangeAttack (targ: TBaseObject);
  public
    constructor Create();
    function      AttackTarget: Boolean; override;
  end;

  TStoneMonster = class(TMonster)
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;



implementation

uses
  UsrEngn, M2Share, Event;

  
{ TMonster }
constructor TMonster.Create; //004A8B74
begin
  inherited Create;
  m_boDupMode:=False;
  bo554:=False;
  m_dwThinkTick:=GetTickCount();
  m_nViewRange:=5;
  m_nRunTime:=250;
  m_dwSearchTime:=3000 + Random(2000);
  m_dwSearchTick:=GetTickCount();
  m_boApproach:=TRUE;
end;

destructor TMonster.Destroy; //004A8C24
begin
  inherited Destroy;
end;
function TMonster.MakeClone(sMonName: String;OldMon:TBaseObject): TBaseObject; //004A8C58
var
  ElfMon:TBaseObject;
begin
  Result:=nil;
  ElfMon:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,m_nCurrX,m_nCurrY,sMonName);
  if ElfMon <> nil then begin
    ElfMon.m_Master:=OldMon.m_Master;
    ElfMon.m_dwMasterRoyaltyTick:=OldMon.m_dwMasterRoyaltyTick;
    ElfMon.m_btSlaveMakeLevel:=OldMon.m_btSlaveMakeLevel;
    ElfMon.m_btSlaveExpLevel:=OldMon.m_btSlaveExpLevel;
    ElfMon.RecalcAbilitys;
    ElfMon.RefNameColor;
    if OldMon.m_Master <> nil then
      OldMon.m_Master.m_SlaveList.Add(ElfMon);
    ElfMon.m_WAbil:=OldMon.m_WAbil;
    ElfMon.m_wStatusTimeArr:=OldMon.m_wStatusTimeArr;
    ElfMon.m_TargetCret:=OldMon.m_TargetCret;
    ElfMon.m_dwTargetFocusTick:=OldMon.m_dwTargetFocusTick;
    ElfMon.m_LastHiter:=OldMon.m_LastHiter;
    ElfMon.m_LastHiterTick:=OldMon.m_LastHiterTick;
    ElfMon.m_btDirection:=OldMon.m_btDirection;
    Result:=ElfMon;
  end;
end;


function TMonster.Operate(ProcessMsg: pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);
end;
function TMonster.Think():Boolean; //004A8E54
var
  nOldX,nOldY:integer;
begin
  Result:=False;
  if (GetTickCount - m_dwThinkTick) > 3 * 1000 then begin
    m_dwThinkTick:=GetTickCount();
    if m_PEnvir.GetXYObjCount(m_nCurrX,m_nCurrY) >= 2 then m_boDupMode:=True;
    if not IsProperTarget{FFFF4}(m_TargetCret) then m_TargetCret:=nil;
  end; //004A8ED2
  if m_boDupMode and (not BoDontMove)  then begin
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    WalkTo(Random(8),False);
    if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
      m_boDupMode:=False;
      Result:=True;
    end;
  end;
end;

function TMonster.AttackTarget():Boolean; //004A8F34
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed  then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        if m_btRaceServer = JIN_WHITESKELETON then begin
          if (Random(m_TargetCret.m_btAntiPoison + 8) <= 2) then begin
            m_TargetCret.MakePosion(POISON_DAMAGEARMOR, 10, 0)
          end;
        end;
        Attack(m_TargetCret,btDir);  //FFED
        BreakHolySeizeMode();
      end;
      Result:=True;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY); {0FFF0h}
        //004A8FE3
      end else begin
        DelTargetCreat();{0FFF1h}
        //004A9009
      end;
    end;
  end;
end;

procedure TMonster.Run; //004A9020
var
   nX, nY, bx, by: integer;
begin
  if not m_boFixedHideMode and not m_boStoneMode and CanMove then begin
    if Think then begin  //°ãÄ¡Áö ¾Ê°Ô ÇÔ
      inherited Run;
      exit;
    end;
    if m_boWalkWaitLocked then begin
      if (GetTickCount - m_dwWalkWaitTick) > m_dwWalkWait then begin
        m_boWalkWaitLocked:=False;
      end;
    end;
    if not m_boWalkWaitLocked and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      Inc(m_nWalkCount);
      if m_nWalkCount > m_nWalkStep then begin
        m_nWalkCount:=0;
        m_boWalkWaitLocked:=True;
        m_dwWalkWaitTick:=GetTickCount();
      end; //004A9151
      if not m_boRunAwayMode then begin
        if not m_boNoAttackMode then begin
          if m_TargetCret <> nil then begin
            if AttackTarget{FFEB} then begin
              if (m_Master <> nil) then begin
                //°ø°ÝÁß¿¡ ÁÖÀÎÀÌ °­Á¦·Î ºÎ¸£¸é
                if ForceMoveToMaster then begin
                  ForceMoveToMaster := false;
                  m_Master.GetBackPosition (bx, by);  //ÁÖÀÎÀÇ µÚ·Î °¨
                  m_nTargetX := bx;
                  m_nTargetY := by;
                  SpaceGTMoveEX(m_Master.m_PEnvir.sMapName, bx, by, 1,m_Master.m_PEnvir.Flag.nGuildTerritory);
                end;
              end;
              inherited Run;
              exit;
            end;
          end else begin
            m_nTargetX:=-1;
            if m_boMission then begin
              m_nTargetX:=m_nMissionX;
              m_nTargetY:=m_nMissionY;
            end; //004A91D3
          end;
        end; //004A91D3  if not bo2C0 then begin
        if m_Master <> nil then begin                //¼ÒÈ¯¼ö°¡ °ø°Ý ÁßÀÏ ¶§´Â ¿Ö Master¸¦ ÀÎ½ÄÇÒ ¼ö ¾øÀ»±î? AttackTarget´ÙÀ½¿¡ Â÷´ÜµÇ±â ¶§¹®...
          if (m_TargetCret = nil) or (BoLoseTargetMoment) then begin     //ÁÖÀÎÀÌ ÀÖÀ¸¸é ÁÖÀÎÀ» µû¶ó°£´Ù.
            BoLoseTargetMoment := FALSE;
            m_Master.GetBackPosition(nX,nY);    //ÁÖÀÎÀÇ µÚ·Î °¨
            if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY{nX}) > 1) then begin //004A922D
              m_nTargetX:=nX;
              m_nTargetY:=nY;
              if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
                if m_PEnvir.GetMovingObject(nX,nY,True) <> nil then begin
                  m_nTargetX:=m_nCurrX;        //´õ ÀÌ»ó ¿òÁ÷ÀÌÁö ¾Ê´Â´Ù.
                  m_nTargetY:=m_nCurrY;
                end //004A92A5
              end;
            end; //004A92A5
          end; //004A92A5 if m_TargetCret = nil then begin
          if ForceMoveToMaster or ((not m_Master.m_boSlaveRelax) and                    //ÁÖÀÎ°ú ³Ê¹« ¶³¾îÁ® ÀÖÀ¸¸é...
             ((m_PEnvir <> m_Master.m_PEnvir) or
             (abs(m_nCurrX-m_Master.m_nCurrX) > 20) or
             (abs(m_nCurrY-m_Master.m_nCurrY) > 20))) then begin
              ForceMoveToMaster := false;
              m_Master.GetBackPosition (bx, by);  //ÁÖÀÎÀÇ µÚ·Î °¨
              m_nTargetX := bx;
              m_nTargetY := by;
              SpaceGTMoveEX(m_Master.m_PEnvir.sMapName, bx, by, 1,m_Master.m_PEnvir.Flag.nGuildTerritory);
          end; // 004A937E
        end;// 004A937E if m_Master <> nil then begin
      end else begin //004A9344
        if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin  //½Ã°£ Á¦ÇÑÀÌ ÀÖÀ½
          m_boRunAwayMode:=False;
          m_dwRunAwayTime:=0;
        end;
      end; //004A937E
      if (m_Master <> nil) and m_Master.m_boSlaveRelax then begin   //ÁÖÀÎÀÌ ÈÞ½ÄÇÏ¶ó°í ÇÔ...
        inherited Run;
        exit;
      end;  //004A93A6
      if (m_nTargetX <> -1) {and ((m_boApproach) or (m_Master <> nil))} then begin    //°¡¾ßÇÒ °÷ÀÌ ÀÖÀ½
        if m_btRaceServer = RC_DARKCLONE then begin
          GotoTargetAssXY;
        end else
         GotoTargetXY(); //004A93B5 0FFEF
      end else begin
        if (m_TargetCret = nil) then Wondering();// FFEE   //Jacky
      end; //004A93D8
    end;
  end; //004A93D8

  inherited Run;

end;


{ TChickenDeer }

constructor TChickenDeer.Create;//004A93E8
begin
  inherited;
  m_nViewRange:=5;
end;

destructor TChickenDeer.Destroy;
begin 
  inherited;
end;

procedure TChickenDeer.Run;//004A9438
var
  I:Integer;
  n10,nC,nDir:Integer;
  BaseObject1C,BaseObject:TBaseObject;
begin
  n10:=9999;
  BaseObject:=nil;
  BaseObject1C:=nil;
  if not bo554 and CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nC:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nC < n10 then begin
              n10:=nC;
              BaseObject1C:=BaseObject;
            end;
          end;
        end;
      end;    // for
      if BaseObject1C <> nil then begin
        m_boRunAwayMode:=True;
        m_TargetCret:=BaseObject1C;
      end else begin
        m_boRunAwayMode:=False;
        m_TargetCret:=nil;
      end;
    end;//
    if m_boRunAwayMode and
      (m_TargetCret <> nil) and
      (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 6) and (abs(m_nCurrX - BaseObject.m_nCurrX) <= 6) then begin
        nDir:=GetNextDirection(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,m_nCurrX,m_nCurrY); //25/07 Damian
        m_PEnvir.GetNextPosition(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,nDir,5,m_nTargetX,m_nTargetY);
      end;
    end;
  end;
  inherited;

end;

{ TATMonster }

constructor TATMonster.Create; //004A9690
begin
  inherited Create;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TATMonster.Destroy;
begin

  inherited Destroy;
end;

procedure TATMonster.Run;//004A9720
begin
  if not bo554 and CanMove then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited Run;
end;

{ TSlowATMonster }

constructor TSlowATMonster.Create;//004A97AC
begin
  inherited;
end;

destructor TSlowATMonster.Destroy;
begin

  inherited;
end;

{ TScorpion }

constructor TScorpion.Create;//004A97F0
begin
  inherited;
  m_boAnimal:=True;
end;

destructor TScorpion.Destroy;
begin

  inherited;
end;

{ TSpitSpider }
constructor TSpitSpider.Create;//004A983C
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boAnimal:=True;
  m_boUsePoison:=True;
end;

destructor TSpitSpider.Destroy;
begin

  inherited;
end;

procedure TSpitSpider.SpitAttack(btDir:Byte); //004A98AC
var
  i,k,nX,nY,nDamage:Integer;
  BaseObject:TBaseObject;
begin
  m_btDirection:=btDir;
  with m_WAbil do
  nDamage:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) +1) + LoWord(m_WAbil.DC));

  if nDamage <= 0 then exit;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');

  for i:=0 to 4 do begin
		for k:=0 to 4 do begin
			if (g_Config.SpitMap[btDir,i,k] = 1) then begin
				nX := m_nCurrX - 2 + k;
				nY := m_nCurrY - 2 + i;

        BaseObject:=m_PEnvir.GetMovingObject(nX,nY,True);
        if (BaseObject <> nil) and
           (BaseObject <> Self) and
           (IsProperTarget(BaseObject)) and
           (Random(BaseObject.m_btSpeedPoint) < m_btHitPoint) then begin
          nDamage:=BaseObject.GetMagStruckDamage(Self,nDamage);
          if nDamage > 0 then begin
            BaseObject.StruckDamage(nDamage);
            BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,nDamage,m_WAbil.HP,m_WAbil.MaxHP,Integer(Self),'',300);
            if m_boUsePoison then begin
              if (Random(m_TargetCret.m_btAntiPoison + 20) = 0) then
               if m_btRaceServer = 180 then
                BaseObject.MakePosion(POISON_STONE,10,1)
               else
                BaseObject.MakePosion(POISON_DECHEALTH,30,10);
            end;
          end;
        end;
      end;
    end;
  end;
end;
function TSpitSpider.AttackTarget: Boolean;
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if TargetInSpitRange(m_TargetCret,btDir) then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      m_dwTargetFocusTick:=GetTickCount();
      SpitAttack(btDir);
      BreakHolySeizeMode();
    end;
    Result:=True;
    exit;
  end;
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
  end else begin
    DelTargetCreat();
  end;
end;

{ THighRiskSpider }

constructor THighRiskSpider.Create;//004A9B64
begin
  inherited;
  m_boAnimal:=False;
  m_boUsePoison:=False;
end;

destructor THighRiskSpider.Destroy;
begin

  inherited;
end;


{---------------------------------------------------------------------------}
// °­·ÂÇÑ µÎÄ­ Å©¸®Æ¼ÄÃ °ø°ÝÀ» ÇÏ´Â ¸ó½ºÅÍ


constructor TDoubleCriticalMonster.Create;
begin
   inherited Create;
   criticalpoint := 0;
end;

procedure  TDoubleCriticalMonster.DoubleCriticalAttack (TargeTBaseObject: TBaseObject; dir: byte);
var
   i, k,  mx, my, armor: integer;
   cret: TBaseObject;
   dam: integer;
begin
   Self.m_btDirection := dir;
   if dam <= 0 then exit;

   SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, integer(TargeTBaseObject), '');

   with m_WAbil do
     dam := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
     dam := Round (dam * 2);

   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[dir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin //cret.RaceServer = RC_USERHUMAN then begin
                  //¸Â´ÂÁö °áÁ¤
                  if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     dam := cret.GetMagStruckDamage (self, dam);
                     if dam > 0 then begin
                        cret.StruckDamage (dam);
                        cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                 cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                 300);
                     end;
                  end;
               end;
            end;
         end;
      end;
end;


procedure TDoubleCriticalMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;


function TDoubleCriticalMonster.AttackTarget: Boolean;             //ÈæÃµ¸¶¿Õ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) and (Random(2) = 0) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin

      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            DoubleCriticalAttack(m_TargetCret ,targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin

         if m_TargetCret.m_sMapName = self.m_sMapName then
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         else
            DelTargetCreat();   //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
      end;
      end;
   end;
end;



{ TBigPoisionSpider }

constructor TBigPoisionSpider.Create;//004A9BBC
begin
  inherited;
  m_boAnimal:=False;
  m_boUsePoison:=True;
end;

destructor TBigPoisionSpider.Destroy;
begin

  inherited;
end;

{ TGasAttackMonster }

constructor TGasAttackMonster.Create; //004A9C14
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boAnimal:=True;
end;

destructor TGasAttackMonster.Destroy;
begin

  inherited;
end;

function TGasAttackMonster.sub_4A9C78(bt05: Byte):TBaseObject;
var
  WAbil:pTAbility;
  n10:integer;
  BaseObject:TBaseObject;
begin
  Result:=nil;
  m_btDirection:=bt05;
  WAbil:=@m_WAbil;
  n10:=Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC);
  if n10 > 0 then begin
    SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    BaseObject:=GetPoseCreate();
    if (BaseObject <> nil) and
       IsProperTarget(BaseObject) and
       (Random(BaseObject.m_btSpeedPoint) < m_btHitPoint) then begin
      n10:=BaseObject.GetMagStruckDamage(Self,n10);
      if n10 > 0 then begin
        BaseObject.StruckDamage(n10);
        BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',300);
        if Random(BaseObject.m_btAntiPoison + 20) = 0 then begin
          BaseObject.MakePosion(POISON_STONE,5,0)
        end;
        Result:=BaseObject;
      end;
    end;
  end;

end;

function TGasAttackMonster.AttackTarget():Boolean;//004A9DD4
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetAttackDir(m_TargetCret,btDir) then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      m_dwTargetFocusTick:=GetTickCount();
      sub_4A9C78(btDir);
      BreakHolySeizeMode();
    end;
    Result:=True;
  end else begin
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
    end else begin
      DelTargetCreat();
    end;
  end;
end;

{ TCowMonster }

constructor TCowMonster.Create;//004A9EB4
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TCowMonster.Destroy;
begin

  inherited;
end;

{ TMagCowMonster }

constructor TMagCowMonster.Create;//004A9F10
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TMagCowMonster.Destroy;
begin

  inherited;
end;
procedure TMagCowMonster.sub_4A9F6C(btDir: Byte);
var
  WAbil:pTAbility;
  n10:integer;
  BaseObject:TBaseObject;
begin
  m_btDirection:=btDir;
  WAbil:=@m_WAbil;
  n10:=Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC);
  if n10 > 0 then begin
    SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    BaseObject:=GetPoseCreate();
    if (BaseObject <> nil) and
       IsProperTarget(BaseObject) and
       (m_nAntiMagic >= 0) then begin
      n10:=BaseObject.GetMagStruckDamage(Self,n10);
      if n10 > 0 then begin
        BaseObject.StruckDamage(n10);
        BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',300);
      end;
    end;
  end;   

end;

function TMagCowMonster.AttackTarget: Boolean;//004AA084
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetAttackDir(m_TargetCret,btDir) then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      m_dwTargetFocusTick:=GetTickCount();
      sub_4A9F6C(btDir);
      BreakHolySeizeMode();
    end;
    Result:=True;
  end else begin
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
    end else begin
      DelTargetCreat();
    end;
  end;
end;

{ TCowKingMonster }



constructor TCowKingMonster.Create;//004AA160
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 500;
  dw558:=GetTickCount();
  bo2BF:=True;
  n560:=0;
  bo55C:=False;
  bo55D:=False;
end;

destructor TCowKingMonster.Destroy;
begin

  inherited;
end;
procedure TCowKingMonster.Attack(TargeTBaseObject: TBaseObject; nDir: Integer); //004AA1F0
var
  WAbil:pTAbility;
  nPower:integer;
begin
  WAbil:=@m_WAbil;
  nPower:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTBaseObject,nPower div 2,nPower div 2,True);
//  inherited;

end;
procedure TCowKingMonster.Initialize;
begin
  dw56C:=m_nNextHitTime;
  dw570:=m_nWalkSpeed;
  inherited;

end;
procedure TCowKingMonster.Run;//004AA294
var
  n8,nC,n10:Integer;
begin
  if (not m_boDeath) and
     (not bo554) and
     (not m_boGhost) and
     ((GetTickCount - dw558) > 30 * 1000) then begin

    dw558:=GetTickCount();
    if (m_TargetCret <> nil) and (sub_4C3538 >= 5) then begin
      m_TargetCret.GetBackPosition(n8,nC);
      if m_PEnvir.CanWalk(n8,nC,False) then begin
        SpaceMove(m_PEnvir.sMapName,n8,nC,0);
        exit;
      end;
      MapRandomMove(m_PEnvir.sMapName,0);
      exit;
    end;
    n10:=n560;

    n560:=7 - m_WAbil.HP div (m_WAbil.MaxHP div 7);
    if (n560 >= 2) and (n560 <> n10) then begin
      bo55C:=True;
      dw564:=GetTickCount();
    end;
    if bo55C then begin
      if (GetTickCount - dw564) < 8000 then begin
        m_nNextHitTime:=10000;
      end else begin
        bo55C:=False;
        bo55D:=True;
        dw568:=GetTickCount();
      end;
    end;//004AA43D
    if bo55D then begin
      if (GetTickCount - dw568) < 8000 then begin
        m_nNextHitTime:=500;
        m_nWalkSpeed:=400;
      end else begin
        bo55D:=False;
        m_nNextHitTime:=dw56C;
        m_nWalkSpeed:=dw570;
      end;
    end;
  end;
  inherited;
end;




{ TDigOutGusle }

constructor TDigOutGusle.Create;//004AA848
begin
  inherited;
  bo554:=False;
  m_nViewRange:=7;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  m_boFixedHideMode:=True;
end;

destructor TDigOutGusle.Destroy;
begin
  inherited;
end;

procedure TDigOutGusle.sub_4AA8DC;
begin
  m_boFixedHideMode:=False;
  if m_btRaceServer = 222 then begin
    SendRefMsg(RM_10205,0, m_nCurrX, m_nCurrY, NE_GUSLE1,'0');
  end;
  if m_btRaceServer = 223 then begin
    SendRefMsg(RM_10205,0, m_nCurrX, m_nCurrY, NE_GSLE2S,'0');
  end;
  if m_btRaceServer = 224 then begin
    SendRefMsg(RM_10205,0, m_nCurrX, m_nCurrY, NE_GUUSLE3T,'0');
  end;
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;
procedure TDigOutGusle.Run;//004AA95C
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boFixedHideMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 3) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 3) then begin
              sub_4AA8DC();
              m_dwWalkTick:=GetCurrentTime + 1000;
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    end;       
  end;
  inherited;
end;





{ TDigOutZombi }

constructor TGuJangHwa.Create;//004AA848
begin
  inherited;
  bo554:=False;
  m_nViewRange:=7;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  m_boFixedHideMode:=True;
  BoDontMove := True;
end;

destructor TGuJangHwa.Destroy;
begin

  inherited;
end;

procedure TGuJangHwa.sub_4AA8DC(mode:Byte);
begin
  m_boFixedHideMode := False;
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;
procedure TGuJangHwa.Run;//004AA95C
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boFixedHideMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 3) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 3) then begin
              sub_4AA8DC(0);
              m_dwWalkTick:=GetCurrentTime + 1000;
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    end;
  end;
  inherited;
end;

procedure TGuJangHwa.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //È£ÁßÃµ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   ixf := _MAX(0, self.m_nCurrX - 4); ixt := _MIN(m_pEnvir.m_nWidth-1,  self.m_nCurrX + 4);
   iyf := _MAX(0, self.m_nCurrY - 4); iyt := _MIN(m_pEnvir.m_nHeight-1, self.m_nCurrY + 4);

   for ix := ixf to ixt do begin
     for iy := iyf to iyt do begin
       list := TList.Create;
       m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
       for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);
              cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_GUJANGWHA, '0');
              if Random(10 + cret.m_btAntiPoison) = 0 then
                cret.MakePosion (POISON_STONE, 5, 0);
            end;
         end;
       end;
       FreeAndNil(list);
     end;
   end;
end;

function  TGuJangHwa.AttackTarget: Boolean;       //È£ÁßÃµ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


{ TLightingZombi }

constructor TLightingZombi.Create;//004AA4B4
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TLightingZombi.Destroy;
begin

  inherited;
end;
procedure TLightingZombi.LightingAttack(nDir:Integer);
var
  nSX,nSY,nTX,nTY,nPwr:Integer;
  WAbil:pTAbility;
begin
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,9,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPassThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True);
    BreakHolySeizeMode();
  end;
end;
procedure TLightingZombi.Run;//004AA604
var
  nAttackDir:Integer;
begin
  if (not bo554) and CanMove and ((GetTickCount - m_dwSearchEnemyTick) > 8000) then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) and
       (m_TargetCret <> nil) and
       (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 4) and
       (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 4) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 2) and
         (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 2) and
         (Random(3) <> 0)then begin
        inherited;
        exit;
      end;
      GetBackPosition(m_nTargetX,m_nTargetY);
    end;
    if (m_TargetCret <> nil) and
       (abs(m_nCurrX - m_TargetCret.m_nCurrX) < 6) and
       (abs(m_nCurrY - m_TargetCret.m_nCurrY) < 6) and
       (GetCurrentTime - m_dwHitTick > GetHitSpeed) then begin

      m_dwHitTick:=GetCurrentTime;
      nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      LightingAttack(nAttackDir);
    end;
  end;
  inherited;
end;

{ TDigOutZombi }

constructor TDigOutZombi.Create;//004AA848
begin
  inherited;
  bo554:=False;
  m_nViewRange:=7;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  m_boFixedHideMode:=True;
end;

destructor TDigOutZombi.Destroy;
begin

  inherited;
end;

procedure TDigOutZombi.sub_4AA8DC;
var
  Event:TEvent;
begin
  Event:=TEvent.Create(m_PEnvir,m_nCurrX,m_nCurrY,ET_DIGOUTZOMBI,5 * 60 * 1000,True);
  g_EventManager.AddEvent(Event);
  m_boFixedHideMode:=False;
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,Integer(Event),'');
end;
procedure TDigOutZombi.Run;//004AA95C
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boFixedHideMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 3) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 3) then begin
              sub_4AA8DC();
              m_dwWalkTick:=GetCurrentTime + 1000;
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    end;       
  end;
  inherited;
end;


{ TZilKinZombi }

constructor TZilKinZombi.Create;
begin
  inherited;
  m_nViewRange:=6;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  nZilKillCount:=0;
  if Random(3) = 0 then begin
    nZilKillCount:=Random(3) + 1;
  end;
end;

destructor TZilKinZombi.Destroy;
begin
  inherited;


end;

procedure TZilKinZombi.Die;
begin
  inherited;
  if nZilKillCount > 0 then begin
    dw558:=GetTickCount();
    dw560:=(Random(20) + 4) * 1000;
  end;
  Dec(nZilKillCount);
end;

procedure TZilKinZombi.Run;//004AABE4
begin
  if m_boDeath and (not m_boGhost) and (nZilKillCount >= 0) and
    (m_wStatusTimeArr[POISON_STONE] = 0) and
    (m_wStatusTimeArr[POISON_FREEZE] = 0) and
    (m_wStatusTimeArr[POISON_STUN] = 0) and
    (m_VisibleActors.Count > 0) and
    ((GetTickCount - dw558) >= dw560) then begin
    m_Abil.MaxHP:=m_Abil.MaxHP shr 1;
    m_dwFightExp:=m_dwFightExp div 2;
    m_Abil.HP:=m_Abil.MaxHP;
    m_WAbil.HP:=m_Abil.MaxHP;
    ReAlive();
    m_dwWalkTick:=GetCurrentTime + 1000
  end;
  inherited;
end;

{ TWhiteSkeleton }

constructor TWhiteSkeleton.Create;
begin
  inherited Create;
  m_boIsFirst:=True;
  m_boFixedHideMode:=True;
  m_btRaceServer:=MONSTER_WHITESKELETON;
  m_nViewRange:=6;
end;

procedure TWhiteSkeleton.RecalcAbilitys;
begin
  inherited RecalcAbilitys;
end;
procedure TWhiteSkeleton.Run;
begin
  if m_boIsFirst then begin
    m_boIsFirst:=False;
    m_btDirection:=5;
    m_boFixedHideMode:=False;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    Reset;
  end;
  inherited Run;
end;

procedure TWhiteSkeleton.Reset;
begin
  m_nNextHitTime:=3000 - m_btSlaveMakeLevel * 600;
  m_nWalkSpeed:=1200 - m_btSlaveMakeLevel * 250;
  m_dwWalkTick:=GetCurrentTime + 2000;
end;


{ TJinWhiteSkeleton }

constructor TJinWhiteSkeleton.Create;
begin
  inherited Create;
  m_boIsFirst:=True;
  m_boFixedHideMode:=True;
  m_btRaceServer:=JIN_WHITESKELETON;
  m_nViewRange:=6;
end;

procedure TJinWhiteSkeleton.RecalcAbilitys;
begin
  inherited RecalcAbilitys;
end;
procedure TJinWhiteSkeleton.Run;
begin
  if m_boIsFirst then begin
    m_boIsFirst:=False;
    m_btDirection:=5;
    m_boFixedHideMode:=False;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    Reset;
  end;
  inherited Run;
end;

procedure TJinWhiteSkeleton.Reset;
begin
  m_nNextHitTime:=3000 - m_btSlaveMakeLevel * 600;
  m_nWalkSpeed:=1200 - m_btSlaveMakeLevel * 250;
  m_dwWalkTick:=GetCurrentTime + 2000;
end;

{ TScultureMonster }

constructor TScultureMonster.Create;//004AAE20
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;

  BoDontMove := True;
  MeltArea   := 2;
end;

destructor TScultureMonster.Destroy;
begin

  inherited;
end;
procedure TScultureMonster.MeltStone;
begin
  m_nCharStatusEx:=0;
  m_nCharStatus:=GetCharStatus();
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boStoneMode:=False;
  BoDontMove := False;
end;
procedure TScultureMonster.MeltStoneAll;
var
  I: Integer;
  List10:TList;
  BaseObject:TBaseObject;
begin
  MeltStone();
  List10:=TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,7,List10);
  for I := 0 to List10.Count - 1 do begin
    BaseObject:=TBaseObject(List10.Items[I]);
    if BaseObject.m_boStoneMode then begin
      if BaseObject is TScultureMonster then begin
        TScultureMonster(BaseObject).MeltStone
      end;
    end;
  end;    // for
  FreeAndNil(List10);
end;

procedure TScultureMonster.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boStoneMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= MeltArea) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= MeltArea) then begin
              MeltStoneAll();
              m_dwWalkTick := GetCurrentTime + 1000;
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    end;
  end;
  inherited;
end;

{ TScultureMonster2  ¿ùÁö¸¶Àå,¿ùÁöÈ£±³}

constructor TScultureMonster2.Create;//004AAE20
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
end;

destructor TScultureMonster2.Destroy;
begin

  inherited;
end;
procedure TScultureMonster2.MeltStone;
begin
  m_nCharStatusEx:=0;
  m_nCharStatus:=GetCharStatus();
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boStoneMode:=False;
end;
procedure TScultureMonster2.MeltStoneAll;
var
  I: Integer;
  List10:TList;
  BaseObject:TBaseObject;
begin
  MeltStone();
  List10:=TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,7,List10);
  for I := 0 to List10.Count - 1 do begin
    BaseObject:=TBaseObject(List10.Items[I]);
    if BaseObject.m_boStoneMode then begin
      if BaseObject is TScultureMonster then begin
        TScultureMonster(BaseObject).MeltStone
      end;
    end;
  end;    // for
  FreeAndNil(List10);
end;

procedure TScultureMonster2.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boStoneMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 2) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 2) then begin
              MeltStoneAll();
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    end;
  end;
  inherited;
end;


{ TScultureKingMonster }

constructor TScultureKingMonster.Create;//004AB120
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=8;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
  m_btDirection:=5;
  m_nDangerLevel:=5;
  m_SlaveObjectList:=TList.Create;
  BoCallFollower := TRUE;
end;

destructor TScultureKingMonster.Destroy;//004AB1C8
begin
  FreeAndNil(m_SlaveObjectList);
  inherited;
end;
procedure TScultureKingMonster.MeltStone; //004AB208
var
  Event:TEvent;
begin
  Event:=TEvent.Create(m_PEnvir,m_nCurrX,m_nCurrY,ET_SCULPEICE,5 * 60 * 1000,True);
  if ( Event <> nil ) then begin
    m_nCharStatusEx:=0;
    m_nCharStatus:=GetCharStatus();
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    m_boStoneMode:=False;
    g_EventManager.AddEvent(Event);
    exit;
  end;

  if Event <> nil then Event.Free;
end;
procedure TScultureKingMonster.CallSlave; //004AB29C
var
  I: Integer;
  nCount:Integer;
  nX,nY:Integer;
  BaseObject:TBaseObject;
begin
  nCount:=Random(6) + 6;
  GetFrontPosition(nX,nY);

  for I := 1 to nCount do begin
    if m_SlaveObjectList.Count >= 30 then break;
    BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,nX,nY,g_Config.sZuma[Random(4)]);
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;
end;
procedure TScultureKingMonster.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);//004AB3E8
var
  WAbil:pTAbility;
  nPower:Integer;
begin
  WAbil:=@m_WAbil;
  nPower:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTBaseObject,0,nPower,True);
end;
procedure TScultureKingMonster.Run;//004AB444
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boStoneMode then begin
      //MeltStone();//
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 2) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 2) then begin
              MeltStone();
              break;
            end;
          end;
        end;
      end;    // for
    end else begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        //CallSlave(); //
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave();
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=5;
      end;
    end;
    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      BaseObject:=TBaseObject(m_SlaveObjectList.Items[I]);
      if BaseObject.m_boDeath or BaseObject.m_boGhost then
        m_SlaveObjectList.Delete(I);
    end;    // for
  end;
  inherited;
end;





{ TLegendScultureKingMonster }

constructor TLegendScultureKingMonster.Create;//004AB120         //°í´ëÁÖ¸¶¿Õ
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=8;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
  m_btDirection:=5;
  m_nDangerLevel:=5;
  m_SlaveObjectList:=TList.Create;
  BoCallFollower := TRUE;
end;

destructor TLegendScultureKingMonster.Destroy;//004AB1C8        //°í´ëÁÖ¸¶¿Õ
begin
  FreeAndNil(m_SlaveObjectList);
  inherited;
end;
procedure TLegendScultureKingMonster.MeltStone; //004AB208       //°í´ëÁÖ¸¶¿Õ
var
  Event:TEvent;
begin
  Event:=TEvent.Create(m_PEnvir,m_nCurrX,m_nCurrY,ET_SCULPEICE,5 * 60 * 1000,True);
  if ( Event <> nil ) then begin
    m_nCharStatusEx:=0;
    m_nCharStatus:=GetCharStatus();
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    m_boStoneMode:=False;
    g_EventManager.AddEvent(Event);
    exit;
  end;

  if Event <> nil then Event.Free;
end;
procedure TLegendScultureKingMonster.CallSlave; //004AB29C        //°í´ëÁÖ¸¶¿Õ
var
  I: Integer;
  nCount:Integer;
  nX,nY:Integer;
  BaseObject:TBaseObject;
begin
  nCount:=Random(8) + 8;
  GetFrontPosition(nX,nY);

  for I := 1 to nCount do begin
    if m_SlaveObjectList.Count >= 30 then break;
    BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,nX,nY,g_Config.sLegendZuma[Random(4)]);
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;
end;
procedure TLegendScultureKingMonster.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);//004AB3E8     //°í´ëÁÖ¸¶¿Õ
var
  WAbil:pTAbility;
  nPower:Integer;
begin
  WAbil:=@m_WAbil;
  nPower:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTBaseObject,0,nPower,True);
end;
procedure TLegendScultureKingMonster.Run;//004AB444   //°í´ëÁÖ¸¶¿Õ
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if m_boStoneMode then begin
      //MeltStone();//
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 2) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 2) then begin
              MeltStone();
              break;
            end;
          end;
        end;
      end;    // for
    end else begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        //CallSlave(); //
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave();
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=5;
      end;
    end;
    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      BaseObject:=TBaseObject(m_SlaveObjectList.Items[I]);
      if BaseObject.m_boDeath or BaseObject.m_boGhost then
        m_SlaveObjectList.Delete(I);
    end;    // for
  end;
  inherited;
end;

{ TNammanKingMonster }

constructor TNammanKingMonster.Create;//004AB120       //´Ü¹¬
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  m_nDangerLevel:=4;
  m_SlaveObjectList:=TList.Create;
  m_SlaveObjectList1:=TList.Create;
  m_SlaveObjectList2:=TList.Create;
  m_SlaveObjectList3:=TList.Create;
  BoCallFollower := TRUE;
end;

destructor TNammanKingMonster.Destroy;//004AB1C8     //´Ü¹¬
begin
  FreeAndNil(m_SlaveObjectList);
  FreeAndNil(m_SlaveObjectList1);
  FreeAndNil(m_SlaveObjectList2);
  FreeAndNil(m_SlaveObjectList3);
  inherited;
end;
procedure TNammanKingMonster.CallSlave2(targ: TBaseObject); //004AB29C           //´Ü¹¬ ¼ÒÈ¯
var
  I,k,g,q,z,x: Integer;
  sMonName: String;
  BaseObject:TBaseObject;
begin
  sMonName := 'ÄÏÂùòùòð';

  for k := -4 to 4 do begin
    if m_SlaveObjectList.Count >= 4 then break;
       BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX+k,m_nCurrY+k,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;
  for i := -4 to 4 do begin
    if m_SlaveObjectList1.Count >= 4 then break;
       BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX+i,m_nCurrY-i,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList1.Add(BaseObject);
    end;
  end;

  for g := -4 to 4 do begin
    if m_SlaveObjectList2.Count >= 4 then break;
     BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX-g,m_nCurrY+g,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList2.Add(BaseObject);
    end;
  end;

  for q := -4 to 4 do begin
    if m_SlaveObjectList3.Count >= 4 then break;
     BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX-q,m_nCurrY-q,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList3.Add(BaseObject);
    end;
  end;

  for z := -4 to 4 do begin
    if m_SlaveObjectList3.Count >= 4 then break;
     BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX+z,m_nCurrY,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList3.Add(BaseObject);
    end;
  end;


  for x := -4 to 4 do begin
    if m_SlaveObjectList3.Count >= 4 then break;
     BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX,m_nCurrY+x,sMonName);
    if BaseObject <> nil then begin
      m_SlaveObjectList3.Add(BaseObject);
    end;
  end;

  SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

end;
procedure TNammanKingMonster.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);//004AB3E8  //´Ü¹¬ ÀÏ¹Ý°ø°Ý
var
  WAbil:pTAbility;
  nPower:Integer;
begin
  WAbil:=@m_WAbil;
  nPower:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTBaseObject,0,nPower,True);
end;
procedure TNammanKingMonster.RangeAttack (targ: TBaseObject); //´Ü¹¬ À½ÆÄ ÀüÃ¼°ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 300);
             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 1500);
             end;

          end;
        end;
      end;

   end;

end;
procedure TNammanKingMonster.RangeAttack2 (targ: TBaseObject);  //´Ü¹¬ ¿ø°Å¸® 1ÀÎ °ø°Ý
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));
      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
end;
procedure TNammanKingMonster.RangeAttack3 (targ: TBaseObject); //´Ü¹¬ ÀüÃ¼°ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 300);
             end;
          end;
        end;
      end;

   end;

end;
procedure TNammanKingMonster.Run;//004AB444        //´Ü¹¬
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave2(m_TargetCret);
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=4;
      end;
    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      BaseObject:=TBaseObject(m_SlaveObjectList.Items[I]);
      if BaseObject.m_boDeath or BaseObject.m_boGhost then
        m_SlaveObjectList.Delete(I);
    end;    // for
  end;
  inherited;
end;

function TNammanKingMonster.AttackTarget: Boolean;        //´Ü¹¬
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) and (Random(4) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) < 10 then
               RangeAttack3 (m_TargetCret)
               else
               if Random(70) < 25 then
               RangeAttack (m_TargetCret)
               else
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;





{ TMerMaidKingMon }

constructor TMerMaidKingMon.Create;//004AB120       //¼ö¾î±Í
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
end;

destructor TMerMaidKingMon.Destroy;//004AB1C8     //¼ö¾î±Í
begin
  inherited;
end;

procedure TMerMaidKingMon.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);//004AB3E8  //¼ö¾î±Í ÀÏ¹Ý°ø°Ý
var
  WAbil:pTAbility;
  nPower:Integer;
begin
  WAbil:=@m_WAbil;
  nPower:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  HitMagAttackTarget(TargeTBaseObject,0,nPower,True);
end;
procedure TMerMaidKingMon.RangeAttack (targ: TBaseObject); //¼ö¾î±Í ÀüÃ¼°ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 300);
             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 1500);
             end;

          end;
        end;
      end;

   end;

end;
procedure TMerMaidKingMon.RangeAttack2 (targ: TBaseObject);  //¼ö¾î±Í ¿ø°Å¸® 1ÀÎ °ø°Ý
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));
      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;

            if Random(cret.m_btAntiPoison + 25) <= 2 then begin
               cret.MakePosion (POISON_DECHEALTH, 30, 10);
            end;

         end;
      end;
      FreeAndNil(list);
end;


procedure TMerMaidKingMon.RangeAttack3 (targ: TBaseObject); //¼ö¾î±Í ÀüÃ¼°ø°Ý µ¹µ¢ÀÌ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin

              SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,96,'0');  //¼ö¾î±Í µ¹µ¢ÀÌ

             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

               if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 5, 0);
               end;

             end;

          end;
        end;
      end;

   end;

end;


procedure TMerMaidKingMon.RangeAttack4 (targ: TBaseObject);  //¼ö¾î±Í ¿ø°Å¸® 1ÀÎ °ø°Ý
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));
      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;

            if Random(cret.m_btAntiPoison + 30) <= 2 then begin
               cret.MakePosion (POISON_SLOWDOWN, 15, 0);
            end;

         end;
      end;
      FreeAndNil(list);
end;




procedure TMerMaidKingMon.Run;//004AB444        //¼ö¾î±Í
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
  end;
  inherited;
end;

function TMerMaidKingMon.AttackTarget: Boolean;        //¼ö¾î±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) and (Random(4) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) < 10 then
               RangeAttack3 (m_TargetCret)
               else
               if Random(70) < 25 then
               RangeAttack (m_TargetCret)
               else
               if Random(70) < 35 then
               RangeAttack4 (m_TargetCret)
               else
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{ TGoblinKing }

constructor TGoblinKing.Create;//004AB120       //¿ø¿À
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  m_nDangerLevel:=4;
  BoCallFollower := TRUE;
end;

destructor TGoblinKing.Destroy;//004AB1C8    //¿ø¿À
begin
  inherited;
end;
procedure TGoblinKing.CallSlave2(targ: TBaseObject); //004AB29C          //¿ø¿À
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1: string;
begin
  cret := nil;

      recallmob1 := 'ÈËÃæÊÞ';

   if BoCallFollower then begin
         SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 5 , m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 3, m_nCurrY + 5, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 3, m_nCurrY + 5, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 5, m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;

         BoCallFollower := FALSE;
   end;

end;
procedure TGoblinKing.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);  //¿ø¿À ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );

      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, 85, '0');
   end;
end;

procedure TGoblinKing.Attack2(TargeTBaseObject: TBaseObject;nDir: Integer);  //¿ø¿À Çìºñ °ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
   //   pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));


   if pwr <= 0 then exit;

   pwr := pwr + 20;


   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );

      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, 86, '0');
   end;
end;

procedure TGoblinKing.RangeAttack (targ: TBaseObject); //¿ø¿À ¹Ù´Ú¿¡¼Õ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin

              SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,88,'0');  //¿ø¿À ¼Õ

             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

               if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 1, 0);
               end;

             end;

          end;
        end;
      end;

   end;

end;
procedure TGoblinKing.RangeAttack2 (targ: TBaseObject); //¿ø¿À ÀüÃ¼ Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin

              cret.SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 89,'0');

              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);


               if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 1, 0);
               end;

          end;
        end;
      end;

   end;

end;

procedure TGoblinKing.Run;//004AB444        //¿ø¿À
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave2(m_TargetCret);
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=4;
      end;

  end;
  inherited;
end;

function TGoblinKing.AttackTarget: Boolean;        //¿ø¿À
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) and (Random(4) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) < 25 then
               Attack2 (m_TargetCret, targdir)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) < 25 then
               RangeAttack (m_TargetCret)
               else
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;







constructor TGukguljang.Create;//004AB120       //°Ý±«Àå
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  m_nDangerLevel:=4;
  BoCallFollower := TRUE;
end;

destructor TGukguljang.Destroy;//004AB1C8    //°Ý±«Àå
begin
  inherited;
end;
procedure TGukguljang.CallSlave2(targ: TBaseObject); //004AB29C        //°Ý±«Àå
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1, recallmob2: string;
begin
  cret := nil;

   recallmob1 := 'µ¶ÈÐ·ç';
   recallmob2 := 'ÑÒÊ¯Õ¨µ¯';
   if BoCallFollower then begin
         SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 5 , m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 3, m_nCurrY + 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY + 3, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 3, m_nCurrY + 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 5, m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;

         BoCallFollower := FALSE;
   end;

end;
procedure TGukguljang.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);  //°Ý±«Àå ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );

      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, 85, '0');
   end;
end;

procedure TGukguljang.Attack2(TargeTBaseObject: TBaseObject;nDir: Integer); //°Ý±«Àå ¾Õ µÎÄ­°ø°Ý
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[nDir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin
                  //¸Â´ÂÁö °áÁ¤
                  if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     cret.StruckDamage (pwr);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                        500 );
                  end;
               end;
            end;
         end;
      end;
end;

procedure TGukguljang.Attack3(TargeTBaseObject: TBaseObject;nDir: Integer); //°Ý±«Àå ÀÏ¼¶°ø°Ý
var
   pwr, nx, ny: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );

      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, 85, '0');
   end;
   TargeTBaseObject.GetBackPosition (nx, ny);
   if m_PEnvir.CanWalk(nx, ny, True) and (m_PEnvir.GetXYObjCount(nx, ny) = 0) then begin
      SpaceMagMove(nx, ny, 0);
   end;
end;

procedure TGukguljang.RangeAttack (targ: TBaseObject); ///°Ý±«Àå ÀüÃ¼°ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin

             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

               if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STUN, 5, 0);
               end;
             end;

          end;
        end;
      end;

   end;

end;
procedure TGukguljang.RangeAttack2 (targ: TBaseObject); //°Ý±«ÀåÀüÃ¼ ¸ð·¡ÆøÇ³
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin

              cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX,  cret.m_nCurrY, NE_SANDWIND,'0');

              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

              if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                cret.MakePosion (POISON_STONE, 5, 0);
              end;

          end;
        end;
      end;

   end;

end;


procedure TGukguljang.Run;//004AB444       //°Ý±«Àå
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave2(m_TargetCret);
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=4;
      end;

  end;
  inherited;
end;

function TGukguljang.AttackTarget: Boolean;        //°Ý±«Àå
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) and (Random(4) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(40) < 10 then
                 Attack2 (m_TargetCret, targdir)
               else
               if Random(30) < 10 then
                 Attack3 (m_TargetCret, targdir)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) < 25 then
               RangeAttack (m_TargetCret)
               else
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;





{ TGanesha }

constructor TGanesha.Create;//004AB120       //°¡³×¼ö
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
end;

destructor TGanesha.Destroy;//004AB1C8     //°¡³×¼ö
begin
  inherited;
end;
procedure TGanesha.Attack(TargeTBaseObject: TBaseObject;nDir: Integer);  //ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;
end;

procedure TGanesha.Attack2(TargeTBaseObject: TBaseObject;nDir: Integer);  //Çìºñ °ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));


   if pwr <= 0 then exit;

   pwr := pwr + 20;


   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
      if Random(TargeTBaseObject.m_btAntiPoison + 15) <= 2 then begin
          TargeTBaseObject.MakePosion (POISON_SLOWDOWN, 20, 0);
      end;

   end;
end;

procedure TGanesha.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

      ixf := _MAX(0, TargeTBaseObject.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  TargeTBaseObject.m_nCurrX + 2);
      iyf := _MAX(0, TargeTBaseObject.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, TargeTBaseObject.m_nCurrY + 2);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);

                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;

end;

procedure TGanesha.RangeAttack2 (targ: TBaseObject); //ÀüÃ¼ Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);


               if Random(cret.m_btAntiPoison + 30) <= 2 then begin
                       cret.MakePosion (POISON_FREEZE, 8, 0);
               end;

          end;
        end;
      end;

   end;

end;


procedure TGanesha.Run;//004AB444
var
  I,distx,disty,nDir: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;

      if m_TargetCret <> nil then begin
        distx := abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY();
        end;
      end;

  end;
  inherited;
end;



function TGanesha.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) then begin
               m_dwTargetFocusTick := GetTickCount;
               Case Random(70) of
                0..19 : begin
                  Attack (m_TargetCret, targdir);
                end;
                20..39 : begin
                 Attack2 (m_TargetCret, targdir);
                end;
                40..59 : begin
                 RangeAttack (m_TargetCret, targdir);
                end;
                else begin
                 RangeAttack2 (m_TargetCret)
                end;
               end;
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


{ TGreatKing }

constructor TGreatKing.Create;//004AB120       //¿°¸¶ÅÂÀÚ
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=12;
  BoCallFollower := TRUE;
  BoCallFollower1 := TRUE;
  BoCallFollower2 := TRUE;
  BoCallFollower3 := TRUE;
  BoCallFollower4 := TRUE;
  BoDontMove := TRUE;   //ÀÌµ¿ ¸øÇÔ
end;

destructor TGreatKing.Destroy;//004AB1C8    ///¿°¸¶ÅÂÀÚ
begin
  inherited;
end;


procedure TGreatKing.RangeAttack (targ: TBaseObject); //¿°¸¶ÅÂÀÚ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
              if Random(2) = 0 then
               SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,94,'0')       //ÅÂÀÚ
              else
               SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,95,'0');      //ÅÂÀÚ

             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

               if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 1, 0);
               end;

             end;

          end;
        end;
      end;

   end;

end;
procedure TGreatKing.RangeAttack2 (targ: TBaseObject); ///¿°¸¶ÅÂÀÚ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

 if Random(80) <= 25 then begin  //µÐÈ­
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg(RM_84,self.m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');
      with m_WAbil do
        pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      ixf := _MAX(0, targ.m_nCurrX - 5); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 5);
      iyf := _MAX(0, targ.m_nCurrY - 5); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 5);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);

                     if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_SLOWDOWN, 10, 5);
                     end;
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;

 end else
 if Random(80) <= 25 then begin   //½ºÅÏ

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg(RM_85,self.m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');

      with m_WAbil do
        pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      ixf := _MAX(0, targ.m_nCurrX - 5); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 5);
      iyf := _MAX(0, targ.m_nCurrY - 5); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 5);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);

                     if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STUN, 5, 5);
                     end;
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;


 end else begin        //ÀÏ¹Ý
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg(RM_86,self.m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');
      with m_WAbil do
        pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      ixf := _MAX(0, targ.m_nCurrX - 5); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 5);
      iyf := _MAX(0, targ.m_nCurrY - 5); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 5);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;

 end;
end;

procedure TGreatKing.Run;//004AB444      //¿°¸¶ÅÂÀÚ
var
  BaseObject:TBaseObject;
begin
   if GetTickCount - sectick > 3000 then begin
      sectick := GetTickCount;
      if (not m_boDeath) and (not m_BoGhost) then begin
         if (BoCallFollower = TRUE) and (m_WAbil.HP <= m_WAbil.MaxHP * 4 div 5) then begin
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY - 3, 'ÌúÄ§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY - 4, '±©Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 4 , m_nCurrY, 'Ê¯Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 3 , m_nCurrY, 'Òµ»ð³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 4 , m_nCurrY + 7, 'ÁÒÕÈ³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 2 , m_nCurrY + 5, '´óµ¶³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY + 3, 'Åå½£³à¹í');
              BoCallFollower := FALSE;
         end else if (BoCallFollower1 = TRUE) and (m_WAbil.HP <= m_WAbil.MaxHP * 3 div 5) then begin
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 2 , m_nCurrY + 7, 'ÌúÄ§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 5 , m_nCurrY + 8, '±©Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 5 , m_nCurrY + 3, 'Ê¯Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 5 , m_nCurrY + 5, 'Òµ»ð³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 8 , m_nCurrY + 4, 'ÁÒÕÈ³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 5 , m_nCurrY - 3, '´óµ¶³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 5 , m_nCurrY - 5, 'Åå½£³à¹í');
              BoCallFollower1 := FALSE;
         end else if (BoCallFollower2 = TRUE) and (m_WAbil.HP <= m_WAbil.MaxHP * 2 div 5) then begin
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 1 , m_nCurrY, '¼á±ùÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 3 , m_nCurrY + 1, 'Ä§ÑæÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX + 4 , m_nCurrY + 2, '°µ»êÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 1 , m_nCurrY + 3, 'ÁÒÕðÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX  , m_nCurrY + 4, 'Ì«×ÓÇáÎ¾³à¹í');
              BoCallFollower2 := FALSE;
         end else if (BoCallFollower3 = TRUE) and (m_WAbil.HP <= m_WAbil.MaxHP * 1 div 5) then begin
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 7 , m_nCurrY - 3, '¼á±ùÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 8 , m_nCurrY - 2, 'Ä§ÑæÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 2 , m_nCurrY , '°µ»êÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY + 3, 'ÁÒÕðÊØ»¤½«');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 6 , m_nCurrY + 5, 'Ì«×ÓÇáÎ¾³à¹í');
              BoCallFollower3 := FALSE;
         end else begin
           if (BoCallFollower4 = TRUE) then begin
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY + 3, 'ÌúÄ§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 4 , m_nCurrY + 2, '±©Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 7 , m_nCurrY, 'Ê¯Ä§Ò¹²æ');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 8 , m_nCurrY, 'Òµ»ð³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY + 5, 'ÁÒÕÈ³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 6 , m_nCurrY + 7, '´óµ¶³à¹í');
              BaseObject := UserEngine.RegenMonsterByName (m_sMapName, m_nCurrX - 5 , m_nCurrY + 9, 'Åå½£³à¹í');
              BoCallFollower4 := FALSE;
           end;
         end;
      end;
  end;
  inherited Run;
end;

procedure TGreatKing.Die;                             //¿°¸¶ÅÂÀÚ
var
   k: integer;
   cret: TBaseObject;
   list: TList;
begin
   list := TList.Create;
   UserEngine.GetMapMonster (m_PEnvir, list);
   for k:=0 to list.Count-1 do begin
     if TBaseObject(list[k]).m_btRaceServer = 124 then begin
      TBaseObject(list[k]).m_WAbil.HP := 0; //¸ðµÎ Á×ÀÎ´Ù.
     end;
   end;
   FreeAndNil(list);
  inherited Die;
end;

function TGreatKing.AttackTarget: Boolean;       //¿°¸¶ÅÂÀÚ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 9) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 9) then begin
            m_dwTargetFocusTick := GetTickCount;
            if Random(70) < 25 then
             RangeAttack (m_TargetCret)
            else
             RangeAttack2 (m_TargetCret);
             Result := TRUE;
            //´Ù¸¥ Å¸°Ù ¹°»ö
            if Random(10) < 4 then begin
               FindTarget;
            end;

         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;

function  TGreatKing.FindTarget: Boolean;      //ºñ¿ùÃµÁÖ
var
   i: integer;
   cret: TBaseObject;
begin
   Result := FALSE;
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget(cret) then begin
         if (abs(m_nCurrX-cret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-cret.m_nCurrY) <= m_nViewRange) then begin
            if cret.m_btRaceServer = RC_PLAYOBJECT then begin
               if m_TargetCret = nil then begin
                  //Å¸°Ù ÁöÁ¤
                  m_TargetCret := cret;
               end else begin
                  //°íÁ¤ Å¸°Ù ¹æÁö.
                  if Random(100) < 50 then continue;

                  //Å¸°Ù ÁöÁ¤
                  m_TargetCret := cret;
               end;

               Result := TRUE;
               break;
            end;
         end;
      end;
   end;
end;



{ TPotMon }

constructor TPotMon.Create;//004AB120       //È£Áß±Í2
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=7;
  BoDontMove  := TRUE;

  m_SlaveObjectList:=TList.Create;
  BoCallFollower2 := TRUE;
end;

destructor TPotMon.Destroy;//004AB1C8      //È£Áß±Í2
begin
  FreeAndNil(m_SlaveObjectList);
  inherited;
end;

procedure TPotMon.CallSlave; //004AB29C         //È£Áß±Í2
var
  I: Integer;
  nCount:Integer;
  nX,nY:Integer;
  BaseObject:TBaseObject;
  Monster:pTMonInfo;
begin
  nCount:=1;
  GetFrontPosition(nX,nY);

  for I := 1 to nCount do begin
    if m_SlaveObjectList.Count >= 2 then break;
    BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,nX,nY, g_Config.sPotMon[Random(20)]);
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;    // for

  BoCallFollower2 := False;
end;
procedure TPotMon.RangeAttack(targ: TBaseObject);//004AB3E8      //È£Áß±Í2
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 300);
            end;
         end;
      end;
      FreeAndNil(list);
end;
procedure TPotMon.Run;//004AB444   //È£Áß±Í2
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      BaseObject:=TBaseObject(m_SlaveObjectList.Items[I]);
      if BaseObject.m_boDeath or BaseObject.m_boGhost then
        m_SlaveObjectList.Delete(I);
    end;    // for
  end;

  if BoCallFollower2 then begin
   if (m_boDeath) then begin
      CallSlave();
   end;
  end;

  inherited;
end;



//ÇØ°ñ¹Ý¿Õ
constructor TSkeletonKingMonster.Create;       //ÇØ°ñ¹Ý¿Õ
begin
   inherited Create;
   ChainShotCount := 6;
   m_BoStoneMode := FALSE;
   m_nCharStatusEx := 0;
   m_nCharStatus := GetCharStatus;
end;

procedure TSkeletonKingMonster.CallSlave;     //ÇØ°ñ¹Ý¿Õ
const
   MAX_SKELFOLLOWERS = 3;
var
   i, count, nx, ny: integer;
   monname: string;
   mon: TBaseObject;
   followers: array[0..MAX_SKELFOLLOWERS-1] of string; // = (ÇØ°ñ¹«Àå, ÇØ°ñ±Ã¼ö, ÇØ°ñº´Á¹);
begin
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, 0, '');
   count := 4 + Random (4);
   GetFrontPosition (nx, ny);

   //Á¨½ÃÅ³ ¸ó½ºÅÍÀÌ¸§
   followers[0] := '÷¼÷ÃÎä½«';
   followers[1] := '÷¼÷Ã¹­ÊÖ';
   followers[2] := '÷¼÷Ã±ø×ä';

   for i:=1 to count do begin
      if m_SlaveObjectList.Count < 20 then begin
         monname := followers[Random(MAX_SKELFOLLOWERS)];
         mon:=UserEngine.RegenMonsterByName(m_sMapName,nx,ny,monname);
         if mon <> nil then
            m_SlaveObjectList.Add (mon);
      end;
   end;
end;

procedure TSkeletonKingMonster.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);  //ÇØ°ñ¹Ý¿Õ
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure TSkeletonKingMonster.Run;                 //ÇØ°ñ¹Ý¿Õ
var
   i, dis, d, targdir: integer;
   cret : TBaseObject;
begin
   inherited Run;
end;

procedure TSkeletonKingMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //ÇØ°ñ¹Ý¿Õ
var
   dam, armor: integer;
begin
   if targ = nil then exit;

   if m_PEnvir.CanFly (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY) then begin //µµ³¢°¡ ³¯¾Æ°¥¼ö ÀÖ´ÂÁö.
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
      with m_WAbil do
         dam:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));
       //  dam := _MAX( 0, Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) );
      if dam > 0 then begin
         dam := targ.GetHitStruckDamage (self, dam);
      end;
      if dam > 0 then begin
         targ.StruckDamage (dam);
         targ.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                  targ.m_WAbil.HP{lparam1}, targ.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600 + _MAX(Abs(m_nCurrX-targ.m_nCurrX),Abs(m_nCurrY-targ.m_nCurrY)) * 50);
      end;
      SendRefMsg (RM_FLYAXE, m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   end;
end;

function  TSkeletonKingMonster.AttackTarget: Boolean;        //ÇØ°ñ¹Ý¿Õ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


// 2003/02/11 ÇØ°ñº´»ç
constructor TSkeletonSoldier.Create;
begin
   inherited Create;
end;

procedure  TSkeletonSoldier.RangeAttack (dir: byte);
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := dir;
   with m_WAbil do
      dam := LoWord(DC) + Random(SmallInt(HiWord(DC)-LoWord(DC)) + 1);
   if dam <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, 0, '');

   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[dir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin //cret.RaceServer = RC_USERHUMAN then begin
                  //¸Â´ÂÁö °áÁ¤
                  if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     {inherited} HitHit2 (cret, 0, pwr, TRUE);
                  end;
               end;
            end;
         end;
      end;
end;

function  TSkeletonSoldier.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack (targdir);
            BreakHolySeizeMode;
         end;
         Result := TRUE;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         else
            DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
      end;
   end;
end;

//ºù¿ø±Íº´
constructor TIceSoldier.Create;
begin
   inherited Create;
end;

procedure TIceSoldier.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);
var
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure  TIceSoldier.RangeAttack (TargeTBaseObject: TBaseObject; dir: byte);
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := dir;
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[dir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin
                  //¸Â´ÂÁö °áÁ¤
                  if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     cret.StruckDamage (pwr);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                        500 );
                  end;
               end;
            end;
         end;
      end;
end;

function  TIceSoldier.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
     if GetAttackDir (m_TargetCret, targdir) and (Random(3) < 2) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
     end else begin
       if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack (m_TargetCret, targdir);
            BreakHolySeizeMode;
         end;
         Result := TRUE;
       end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         else
            DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
       end;
     end;
   end;
end;

//È£Áß±Í1
constructor TPotMon1.Create;       //È£Áß±Í1
begin
   inherited Create;
   m_BoStoneMode := FALSE;
   m_nCharStatusEx := 0;
   m_nCharStatus := GetCharStatus;

   BoCallFollower := FALSE;

   BoDontMove := True;
   BoCallFollower2 := True;
end;

procedure TPotMon1.CallSlave;   //È£Áß±Í1
var
  I: Integer;
  nCount:Integer;
  nX,nY:Integer;
  BaseObject:TBaseObject;
  Monster:pTMonInfo;
begin
  nCount:=1;
  GetFrontPosition(nX,nY);

  for I := 1 to nCount do begin
    if m_SlaveObjectList.Count >= 2 then break;
    BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,nX,nY, g_Config.sPotMon1[Random(20)]);
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;    // for

  BoCallFollower2 := False;
end;

procedure TPotMon1.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);  //È£Áß±Í1
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure TPotMon1.Run;                //È£Áß±Í1
var
   i, dis, d, targdir: integer;
   cret : TBaseObject;
begin
   if BoCallFollower2 then begin
    if (m_boDeath) then begin
      CallSlave();
    end;
   end;

   inherited Run;
end;

procedure TPotMon1.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //È£Áß±Í1
var
   dam, armor: integer;
begin
   if targ = nil then exit;

 //  if m_PEnvir.CanFly (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY) then begin //µµ³¢°¡ ³¯¾Æ°¥¼ö ÀÖ´ÂÁö.
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
      with m_WAbil do
         dam:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));
       //  dam := _MAX( 0, Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) );
      if dam > 0 then begin
         dam := targ.GetHitStruckDamage (self, dam);
      end;
      if dam > 0 then begin
         targ.StruckDamage (dam);
         targ.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                  targ.m_WAbil.HP{lparam1}, targ.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600 + _MAX(Abs(m_nCurrX-targ.m_nCurrX),Abs(m_nCurrY-targ.m_nCurrY)) * 50);
      end;
      SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
  // end;
end;

function  TPotMon1.AttackTarget: Boolean;      //È£Áß±Í1
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if GetAttackDir (m_TargetCret, targdir) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;




//¹°¸® ¿ø°Å¸® °ø°Ý ¸ó½ºÅÍ(sonmg 2005/12/23)
constructor TPhisicalFarAttackMonster.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TPhisicalFarAttackMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      //Å¸°Ù ·¹º§¿¡ µû¸¥ µ¥¹ÌÁö Á¶Á¤
      if (MultiplyTargetLevelMin > 0) and (MultiplyTargetLevelMax > 0) then begin
         with m_WAbil do
            pwr := _MAX( 0, Trunc(targ.m_WAbil.Level * MultiplyTargetLevelMin div 100) + Lobyte(DC) + Random((Trunc(targ.m_WAbil.Level * MultiplyTargetLevelMax div 100) + Hibyte(DC)-Lobyte(DC)) + 1) );
      end else begin
         with m_WAbil do
            pwr := _MAX( 0, Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) );
      end;

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetHitStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  TPhisicalFarAttackMonster.AttackTarget: Boolean;
var
   targdir: byte;
   nx, ny: integer;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  if Random(3) = 0 then begin
                     //³Ê¹« °¡±î¿ì¸é µµ¸Á°¨.
                     GetBackPosition (m_nTargetX, m_nTargetY);
                     if m_nTargetX <> -1 then begin //°¡¾ßÇÒ °÷ÀÌ ÀÖÀ½
                        GotoTargetXY;
                     end;
                  end;
               end;

               if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
                  Result := TRUE;
               end else begin
                  if ChainShot < ChainShotCount-1 then begin
                     Inc (ChainShot);
                     m_dwTargetFocusTick := GetTickCount;
                     RangeAttack (m_TargetCret);
                  end else begin
                     if Random(5) = 0 then
                        ChainShot := 0;
                  end;
                  Result := TRUE;
               end;
            end else begin
               if Random(2) = 0 then begin
                  m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                  //³Ê¹« ¸Ö¸é °¡±îÀÌ °¨.
                  if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, nx, ny) then begin
                     SetTargetXY (nx, ny)
                  end;
               end;
            end;
         end else begin
            DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
   end;
end;

// 2003/03/04 ¼öÈ£±Í»ç
constructor TSaveGuardMonster.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TSaveGuardMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TSaveGuardMonster.RangeAttack(targ: TBaseObject) ;
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
     // m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
   end;

   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 ;
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1;
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;


function  TSaveGuardMonster.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if (GetAttackDir (m_TargetCret, targdir)) then begin
         if (Random(3)<>0) then begin
             if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
               m_dwHitTick := GetCurrentTime;
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
             end;
               Result := TRUE;
         end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
         end;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end else begin
            DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
 end;
end;



// 2003/03/04 ºñÈ£±Í¸¶
constructor TAglyGuard.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TAglyGuard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TAglyGuard.RangeAttack(targ: TBaseObject) ;
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
     // m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;


function  TAglyGuard.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if (GetAttackDir (m_TargetCret, targdir))  then begin
         if (Random(3)<>0) then begin
             if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
               m_dwHitTick := GetCurrentTime;
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
             end;
               Result := TRUE;
         end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
         end;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end else begin
            DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
 end;
end;



//¶¥µÎ²¨ºñ
constructor TEarthToad.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TEarthToad.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TEarthToad.RangeAttack(targ: TBaseObject) ;
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600);

               if (Random(cret.m_btAntiPoison + 9) <= 5) then begin
                  cret.MakePosion(POISON_DECHEALTH,30,10);
               end;
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;


function  TEarthToad.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if (GetAttackDir (m_TargetCret, targdir))  then begin
         if (Random(3) <> 0) then begin
             if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
               m_dwHitTick := GetCurrentTime;
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
             end;
               Result := TRUE;
         end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
         end;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end else begin
            DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
 end;
end;


 //¹®Á¶ÀÎ
constructor TBirdMan.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TBirdMan.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TBirdMan.RangeAttack(targ: TBaseObject) ;
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin

      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TBirdMan.RangeAttack2(targ: TBaseObject) ;
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin

      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 600);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;


function  TBirdMan.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if (GetAttackDir (m_TargetCret, targdir))  then begin
         if (Random(3) <> 0) then begin
             if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
               m_dwHitTick := GetCurrentTime;
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
             end;
               Result := TRUE;
         end else begin
            if (Random(2) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack2 (m_TargetCret);
            end;
               Result := TRUE;
         end;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end else begin
            DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
 end;
end;

//¿ªÃµ±Í
constructor TAgainst.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TAgainst.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TAgainst.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
     // m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 300);

               if (Random(cret.m_btAntiPoison + 15) <= 3) and (cret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
                 cret.MakePosion(POISON_DECHEALTH,30,10);
               end;

            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  TAgainst.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);

               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//ÈæÃµ±Í
constructor TDarkShine.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TDarkShine.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TDarkShine.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
    //  m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  TDarkShine.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 4) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 4) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//±¤ÇÑ½Ã
constructor TCrazyShine.Create;
begin
   inherited Create;
   BoCallFollower := FALSE;
end;

procedure TCrazyShine.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TCrazyShine.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
    //  m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);

            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TCrazyShine.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   //if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
     // m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);

            end;
         end;
      end;
      FreeAndNil(list);
  // end;
end;

function  TCrazyShine.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
                  RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;




//ÇÑÃµ±Í
constructor THanShine.Create;            //ÇÑÃµ±Í
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure THanShine.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //ÇÑÃµ±Í
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure THanShine.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ÇÑÃµ±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

      ixf := _MAX(0, self.m_nCurrX - 4); ixt := _MIN(m_pEnvir.m_nWidth-1,  self.m_nCurrX + 4);
      iyf := _MAX(0, self.m_nCurrY - 4); iyt := _MIN(m_pEnvir.m_nHeight-1, self.m_nCurrY + 4);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);

                     if (Random(cret.m_btAntiPoison + 15) <= 1)  then begin
                       cret.MakePosion(POISON_SLOWDOWN,10,0);
                     end;
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;
end;

function  THanShine.AttackTarget: Boolean;                        //ÇÑÃµ±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 4) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 4) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//¹Ý¾ßÁÂ»ç, ¹Ý¾ß¿ì»ç
constructor TBanyaGuardMonster.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TBanyaGuardMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure TBanyaGuardMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  TBanyaGuardMonster.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//ÅÂ±¸¿À¸¶
constructor TTeguOmaMonster.Create;
begin
   inherited Create;
end;

procedure TTeguOmaMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure TTeguOmaMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               if (Random(cret.m_btAntiPoison + 15) <= 2) then begin
                 if m_btRaceServer = 217 then begin
                   cret.MakePosion(POISON_DECHEALTH,25,15)
                 end else
                   cret.MakePosion(POISON_SLOWDOWN, 5, 0);
               end;
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  TTeguOmaMonster.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 9) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 9) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//¿À¸¶Á¦»çÀå
constructor TOmaJeSaMonster.Create;
begin
   inherited Create;
end;

procedure TOmaJeSaMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure TOmaJeSaMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty , ndir: integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               cret.SendDelayRefMsg(RM_10205,0, cret.m_nCurrX, cret.m_nCurrY, NE_OMAJESA,'0', 500);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TOmaJeSaMonster.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_2, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(targ), '');

   ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
   iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);


   for ix := ixf to ixt do begin
     for iy := iyf to iyt do begin
        list := TList.Create;
        m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
        for i:=0 to list.Count-1 do begin
           cret := TBaseObject(list[i]);
           if IsProperTarget (cret) then begin
              dam := cret.GetMagStruckDamage (self, pwr);
              if dam > 0 then begin
                 cret.StruckDamage (dam);
                 cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
                 if (Random(cret.m_btAntiPoison + 15) <= 2) then begin
                   cret.MakePosion(POISON_STONE, 2, 0);
                 end;
              end;
           end;
        end;
        FreeAndNil(list);
     end;
   end;
end;

function  TOmaJeSaMonster.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(5) < 1 then RangeAttack2(m_TargetCret)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(10) < 1 then RangeAttack2(m_TargetCret)
               else
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 9) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 9) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


constructor THumMon.Create;
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure THumMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   {inherited} HitHit2 (TargeTBaseObject, 0, pwr, TRUE);
end;

procedure THumMon.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

function  THumMon.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//¹«´ç±ªÀÌ
constructor TShamanCat.Create;         //¹«´ç±ªÀÌ
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TShamanCat.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);         //¹«´ç±ªÀÌ
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;
end;

procedure TShamanCat.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil          //¹«´ç±ªÀÌ
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
  // if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
    //  m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);

              cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,90,'0',300);      //¹«´ç±ªÀÌ
            end;
         end;
      end;
      FreeAndNil(list);
  // end;
end;

procedure TShamanCat.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil         //¹«´ç±ªÀÌ
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   //if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
    //  m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,91,'0',300);    //¹«´ç±ªÀÌ
               if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
                 cret.MakePosion(POISON_STONE,1,0)
               end;
            end;
         end;
      end;
      FreeAndNil(list);
  // end;
end;

function  TShamanCat.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(35) <= 10 then
                RangeAttack2 (m_TargetCret)
               else
                RangeAttack (m_TargetCret);
                Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



constructor TJumaWizard.Create;    //ÁÖ¸¶¼ú»ç
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TJumaWizard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);         //ÁÖ¸¶¼ú»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         cret.SendDelayRefMsg(RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_JUMAWIZARD, '0', 300);
         if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
           cret.MakePosion(POISON_STONE, 3, 0)
         end;
       end;
     end;
   end;
   FreeAndNil(list);
end;

procedure TJumaWizard.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil           //ÁÖ¸¶¼ú»ç
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   ixf := _MAX(0, self.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  self.m_nCurrX + 2);
   iyf := _MAX(0, self.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, self.m_nCurrY + 2);

   for ix := ixf to ixt do begin
     for iy := iyf to iyt do begin
       list := TList.Create;
       m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
       for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
           dam := cret.GetMagStruckDamage (self, pwr);
           if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);
           end;
         end;
       end;
       FreeAndNil(list);
     end;
   end;
end;

procedure TJumaWizard.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil           //ÁÖ¸¶¼ú»ç
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   ixf := _MAX(0, self.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  self.m_nCurrX + 2);
   iyf := _MAX(0, self.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, self.m_nCurrY + 2);

   for ix := ixf to ixt do begin
     for iy := iyf to iyt do begin
       list := TList.Create;
       m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
       for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
           dam := cret.GetMagStruckDamage (self, pwr);
           if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);
             if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
                cret.MakePosion(POISON_STUN, 3, 0)
             end;
           end;
         end;
       end;
       FreeAndNil(list);
     end;
   end;
end;


function  TJumaWizard.AttackTarget: Boolean;        //ÁÖ¸¶¼ú»ç
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(30) < 5 then
                 RangeAttack (m_TargetCret)
               else
               if Random(50) < 10 then
                 RangeAttack2 (m_TargetCret)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(30) < 5 then
                 RangeAttack (m_TargetCret)
               else
               if Random(50) < 10 then
                 RangeAttack2 (m_TargetCret)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;




constructor TJumaFireArc.Create;    //ÁÖ¸¶È­±Ã»ç
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TJumaFireArc.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);        //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
       end;
     end;
   end;
   FreeAndNil(list);
end;

procedure TJumaFireArc.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
           cret.MakePosion(POISON_SLOWDOWN, 5, 0)
         end;
       end;
     end;
   end;
   FreeAndNil(list);
end;

procedure TJumaFireArc.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
       end;
     end;
   end;
   FreeAndNil(list);
end;

function  TJumaFireArc.AttackTarget: Boolean;        //ÁÖ¸¶È­±Ã»ç
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            m_dwTargetFocusTick := GetTickCount;
            if Random(15) < 5 then
              RangeAttack (m_TargetCret)
            else
            RangeAttack2 (m_TargetCret);//  Attack (m_TargetCret, targdir);
            Result := TRUE;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


constructor TIceArc.Create;   //ºù¿ø±Í±Ã»ç
begin
   inherited Create;
   BoCallFollower := FALSE;
end;

procedure TIceArc.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //ºù¿ø±Í±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
           cret.MakePosion(POISON_SLOWDOWN, 5, 0)
         end;
       end;
     end;
   end;
   FreeAndNil(list);
end;
function  TIceArc.AttackTarget: Boolean;        //ºù¿ø±Í±Ã»ç
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack (m_TargetCret);
            Result := TRUE;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



constructor IIceZone.Create;//004AAE20
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=10;
end;

destructor IIceZone.Destroy;
begin
  inherited;
end;

procedure IIceZone.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
  end;
end;


procedure IIceZone.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
begin
  if TargeTBaseObject = nil then exit;

  Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
  WAbil:=@m_WAbil;
  pwr:=GetAttackPower(LoWord(WAbil.MC),SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr,0,0,'',800);
        if Random(2 + BaseObject.m_btAntiPoison) = 0 then
         BaseObject.MakePosion(POISON_SlowDown,6,0);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

procedure IIceZone.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
  ndir   : integer;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack(m_TargetCret);
          end else begin
            Attack(m_TargetCret,ndir);
          end;
        end;
      end;
    end;
  end;
  inherited;
end;

constructor IIceDevil.Create;//004AAE20  //¾Ç±Í
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=10;
end;

destructor IIceDevil.Destroy;
begin
  inherited;
end;

procedure IIceDevil.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
  end;
end;


procedure IIceDevil.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
begin
  if TargeTBaseObject = nil then exit;

  Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
  WAbil:=@m_WAbil;
  pwr:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr,0,0,'',800);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


procedure IIceDevil.RangeAttack2 (); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
begin
  WAbil:=@m_WAbil;
    pwr:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr,0,0,'',800);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);

  SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_ICEDEVIL, '0');
end;

procedure IIceDevil.Die;//004A74F8
begin
  inherited Die;
  RangeAttack2();
end;

procedure IIceDevil.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
  ndir   : integer;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack(m_TargetCret);
          end else begin
            Attack(m_TargetCret,ndir);
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;

constructor TJumaWindArc.Create;    //ÁÖ¸¶È­±Ã»ç
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;

procedure TJumaWindArc.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);        //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
       end;
     end;
   end;
   FreeAndNil(list);
end;

procedure TJumaWindArc.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
           cret.MakePosion(POISON_STUN, 5, 0)
         end;
       end;
     end;
   end;
  FreeAndNil(list);
end;

procedure TJumaWindArc.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ÁÖ¸¶È­±Ã»ç
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   list := TList.Create;
   m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
   for i:=0 to list.Count-1 do begin
     cret := TBaseObject(list[i]);
     if IsProperTarget (cret) then begin
       dam := cret.GetMagStruckDamage (self, pwr);
       if dam > 0 then begin
         cret.StruckDamage (dam);
         cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         cret.SendDelayRefMsg(RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_JUMAWIND, '0', 600);
       end;
     end;
   end;
   FreeAndNil(list);
end;

function  TJumaWindArc.AttackTarget: Boolean;        //ÁÖ¸¶È­±Ã»ç
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            m_dwTargetFocusTick := GetTickCount;
            if Random(15) < 5 then
              RangeAttack (m_TargetCret)
            else
            RangeAttack2 (m_TargetCret);//  Attack (m_TargetCret, targdir);
            Result := TRUE;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//°í´ë¼öÈ£Àå
constructor TOldKingMonster.Create;       //°í´ë¼öÈ£Àå
begin
   inherited Create;
   BoCallFollower := FALSE;
end;

procedure TOldKingMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //°í´ë¼öÈ£Àå
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;
end;


procedure TOldKingMonster.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);     //°í´ë¼öÈ£Àå
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;
end;

procedure TOldKingMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //°í´ë¼öÈ£Àå
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 83, '0');    //°í´ë¼öÈ£Àå
               if (Random(cret.m_btAntiPoison + 15) <= 2) then begin
                 cret.MakePosion(POISON_DAMAGEARMOR,30,0)
               end;

            end;
         end;
      end;
      FreeAndNil(list);
end;

procedure TOldKingMonster.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil        //°í´ë¼öÈ£Àå
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 73, '0');     //°í´ë¼öÈ£Àå
               if (Random(cret.m_btAntiPoison + 10) <= 2) then begin
                 cret.MakePosion(POISON_STONE,1,0)
               end;
               
            end;
         end;
      end;
      FreeAndNil(list);
end;

function  TOldKingMonster.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) <= 20 then
                Attack2 (m_TargetCret, targdir)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(70) <= 20 then
                RangeAttack2 (m_TargetCret)
               else
                RangeAttack (m_TargetCret);
                Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//»ç¿ìÃµ¿Õ
constructor TDeadCowKingMonster.Create;     //»ç¿ìÃµ¿Õ
begin
   inherited Create;
   ChainShotCount := 6;
   BoCallFollower := FALSE;
end;
procedure TDeadCowKingMonster.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);   //»ç¿ìÃµ¿Õ
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
      iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TDeadCowKingMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil //»ç¿ìÃµ¿Õ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        // pwr := _MAX( 0, Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) );
        pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      ixf := _MAX(0, targ.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 2);
      iyf := _MAX(0, targ.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 2);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;
   end;
end;

function  TDeadCowKingMonster.AttackTarget: Boolean;                   //»ç¿ìÃµ¿Õ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;

//Á¶ÀÎ»ó
constructor TImpressionKingMon.Create;    //Á¶ÀÎ»ó
begin
   inherited Create;
   ChainShotCount := 8;
   WarpTime := GetTickCount;
   BoCallFollower := FALSE;
end;
procedure TImpressionKingMon.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);       //Á¶ÀÎ»ó ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     // pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TImpressionKingMon.Attack2(TargeTBaseObject: TBaseObject);   //Áßµ¶ °ø°Ý
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   with m_WAbil do begin
      pwr := (Random(SmallInt(HiWord(DC) - LoWord(DC)) + 1) + LoWord(DC));
   end;
   if pwr <= 0 then exit;

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
      SendRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,52,'0'); //Á¶ÀÎ»ó Áßµ¶
      if Random(25 + TargeTBaseObject.m_btAntiPoison) <=  2 then
              TargeTBaseObject.MakePosion(POISON_DECHEALTH,30,10);
   end;

end;

procedure TImpressionKingMon.Attack3(TargeTBaseObject: TBaseObject);            //µÐÈ­°ø°Ý
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   with m_WAbil do begin
      pwr := (Random(SmallInt(HiWord(DC) - LoWord(DC)) + 1) + LoWord(DC));
   end;
   if pwr <= 0 then exit;


   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
      SendRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,72,'0'); //Á¶ÀÎ»ó µÐÈ­
      if Random(25 + TargeTBaseObject.m_btAntiPoison) <= 2 then
              TargeTBaseObject.MakePosion(POISON_SLOWDOWN,10,0);
   end;

end;

procedure TImpressionKingMon.RangeAttack (targ: TBaseObject); //Á¶ÀÎ»ó ´«²É°ø°Ý ¸¶ºñ
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
      with m_WAbil do
         pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,37,'0'); //Á¶ÀÎ»ó ´«º¸¶ó
               if Random(15 + cret.m_btAntiPoison) =  0 then
                cret.MakePosion(POISON_STONE,5,0);
            end;
         end;
      end;
      FreeAndNil(list);
end;

procedure TImpressionKingMon.RangeAttack2 (targ: TBaseObject); //Á¶ÀÎ»ó ºùÈ¯°ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 800);
             SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,38{type},'0'); //Á¶ÀÎ»ó ºùÈ¯
              if Random(15 + cret.m_btAntiPoison) =  0 then
                cret.MakePosion(POISON_SLOWDOWN,10,0);

          end;
        end;
      end;

   end;
end;


function TImpressionKingMon.Operate(ProcessMsg:pTProcessMessage):Boolean;     //Á¶ÀÎ»ó
var
   nx, ny: integer;
   monname: string;
   mon: TBaseObject;
begin
   case ProcessMsg.wIdent of
      RM_10101:
         begin
            if Integer(ProcessMsg.BaseObject) = RM_STRUCK then begin
               if Random(100) < 30 then begin
                  //2ÃÊ µô·¹ÀÌ
                  if (GetTickCount - WarpTime > 3000) and (not m_boDeath) then begin
                     WarpTime := GetTickCount;
                     if Random(20) <= 5 then
                      Attack3(m_TargetCret)
                     else
                      Attack2(m_TargetCret);
                  end;
               end;
            end;
         end;
   end;
   inherited Operate (ProcessMsg);
end;

function  TImpressionKingMon.AttackTarget: Boolean;               //Á¶ÀÎ»ó
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(4) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
              if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  if Random(60) <= 25 then
                    RangeAttack (m_TargetCret)
                  else
                    RangeAttack2 (m_TargetCret);
               end else begin
                  if Random(2) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//¿­ÀåÀû±Í
constructor TFireConvene.Create;       //¿­ÀåÀû±Í
begin
   inherited Create;
   BoCallFollower := FALSE;
end;
procedure TFireConvene.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);      //¿­ÀåÀû±Í
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
      iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TFireConvene.RangeAttack (targ: TBaseObject);   //¿­ÀåÀû±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        // pwr := _MAX( 0, Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) );
        pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

      ixf := _MAX(0, targ.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 2);
      iyf := _MAX(0, targ.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 2);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;
   end;
end;

function  TFireConvene.AttackTarget: Boolean;                   //¿­ÀåÀû±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               m_dwTargetFocusTick := GetTickCount;
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//ÆÄÈ²¸¶½Å =====================================================================
constructor TPBKingMonster.Create;      //ÆÄÈ²¸¶½Å ¿Õ
begin
   inherited Create;
   ChainShotCount := 3;
   m_nViewRange := 12;
end;


procedure TPBKingMonster.Run ;            //ÆÄÈ²¸¶½Å ¿Õ
begin
   // ÆÄÈ²¸¶½ÅÀ» ¸Ê°¡ÀåÀÚ¸®·Î µ¥¸®±¸ °¡¼­Á×ÀÌ´Â°Å ¹æÁö
 {  if m_PEnvir <> nil then begin
      // ¸ÊÀÇ ¿Ü°û¾Ö À§Ä¡ÇØ ÀÖ´Ù¸é. °£´ÜÇÑ °è»êÀÌ¹Ç·Î °è¼Ó »ý°¢ÇÏ°Ô ÇØµµµÈ´Ù.
      // ÆÄÈ²¸¶½ÅÀÌ ÀÖ´Â 66 ¸ÊÀº 300 x 300 ¸ÊÀÌ´Ù.
      if ( m_nCurrX < 50 ) or ( m_nCurrX > m_PEnvir.m_nWidth - 70 ) or
            ( m_nCurrY < 40 ) or ( m_nCurrY > m_PEnvir.m_nHeight - 70 ) then begin
         // Å¸°ÙÀÌ ÀÖÀ¸¸é ¾ø¿£ÈÄ¿¡
         DelTargetCreat;
         // ³»ºÎ ¾ÈÂÊÀ¸·Î ÀÌµ¿... 10Å¸ÀÏ ¾ÈÂÊ¿¡¼­ ³ªÅ¸³ª°Ô ÇÏÀÚ. °æ°èºÎºÐÀº ¾ÈÁÁÀ½
         SpaceMove ( m_PEnvir.sMapName,
                     random( m_PEnvir.m_nWidth  - 140 ) + 60 ,
                     random( m_PEnvir.m_nHeight - 130 ) + 50 ,
                     1);
      end;
   end;     }

   // ±âÁ¸ ½ÇÇàÀ» ÇÑ´Ù.
   inherited Run;
end;

procedure TPBKingMonster.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
                  if Random(10) = 0 then
                     cret.MakePosion (POISON_STONE, 5, 0);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 3 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 3 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;

procedure TPBKingMonster.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil    //ÆÄÈ²¸¶½Å ¿Õ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   inherited RangeAttack(targ);
   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         end;
      end;
   end;
end;

function  TPBKingMonster.AttackTarget: Boolean;         //ÆÄÈ²¸¶½Å ¿Õ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 12) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 12) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);

               try
                  if( ( random(3)= 0) and ( m_VisibleActors.Count > 0  ) )then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                     end;
                  end;
               except
                    MainOutMessage ('[Exception] TPBKingMonster.AttackTarget fail target change 1');
               end;

               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
                  // 3ÃÊ
                  try

                  if ( GetCurrentTime > LongInt( 3000 + m_dwTargetFocusTick )) and ( m_VisibleActors.Count > 0 ) then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                        m_dwTargetFocusTick := GetTickCount;
                     end;
                  end;

                  except
                    MainOutMessage ('[Exception] TPBKingMonster.AttackTarget fail target change 2');
                  end;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;

//È£ÁßÃµ =====================================================================
constructor TBigPotKing.Create;     //È£ÁßÃµ
begin
   inherited Create;
   BoDontMove := True;
   ChainShotCount := 3;
   m_nViewRange := 12;
end;

procedure TBigPotKing.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);  //È£ÁßÃµ
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;


procedure TBigPotKing.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);  //È£ÁßÃµ
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;

procedure TBigPotKing.Attack3 (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TBigPotKing.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //È£ÁßÃµ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         end;
      end;
   end;
end;

function  TBigPotKing.AttackTarget: Boolean;       //È£ÁßÃµ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 12) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 12) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3)<>0) then begin
               m_dwTargetFocusTick := GetTickCount;
              if Random(40) < 10 then
               Attack2 (m_TargetCret, targdir)
              else
              if Random(40) < 15 then
               Attack3 (m_TargetCret, targdir)
              else
               Attack (m_TargetCret, targdir);

               try
                  if( ( random(3)= 0) and ( m_VisibleActors.Count > 0  ) )then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                     end;
                  end;
               except
                    MainOutMessage ('[Exception] TBigPotKing.AttackTarget fail target change 1');
               end;

               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(5) = 0 then
                     ChainShot := 0;
                  // 3ÃÊ
                  try

                  if ( GetCurrentTime > LongInt( 3000 + m_dwTargetFocusTick )) and ( m_VisibleActors.Count > 0 ) then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                        m_dwTargetFocusTick := GetTickCount;
                     end;
                  end;

                  except
                    MainOutMessage ('[Exception] TPBKingMonster.AttackTarget fail target change 2');
                  end;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;





//¿©ÇÏ¼ö =====================================================================
constructor TBossTreeman.Create;   //¿©ÇÏ¼ö
begin
   inherited Create;
   BoDontMove := True;
   ChainShotCount := 3;
   m_nViewRange := 12;
end;


procedure TBossTreeman.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);  //¿©ÇÏ¼ö  ÁÖº¯°ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);

   TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,68,'0',500);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_10205,0,m_nCurrX,m_nCurrY,67,'0') ;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TBossTreeman.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer); //¿©ÇÏ¼ö ÁÖº¯ 5x5 °ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   ixf := _MAX(0, m_nCurrX - 5); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 5);
   iyf := _MAX(0, m_nCurrY - 5); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 5);

   TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,69,'0',500);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;


procedure TBossTreeman.Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¿©ÇÏ¼ö ¹Ð±â
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;



procedure TBossTreeman.RangeAttack (targ: TBaseObject);   //¿©ÇÏ¼ö  ÀüÃ¼Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
          //  cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,67,'0',500);  //¿©ÇÏ¼ö ÀüÁ¦Æø¹ß
            SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,67,'0');//¿©ÇÏ¼ö ÀüÁ¦Æø¹ß
         end;
      end;
   end;
end;

procedure TBossTreeman.RangeAttack2 (targ: TBaseObject);  //¿©ÇÏ¼ö   À§¿¡¼­ ¼Ú¾Æ³²
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
           dam := (cret.m_WAbil.HP div 4);
           cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
           cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
        //   Cret.SendDelayRefMsg(RM_10205,0,Cret.m_nCurrX,Cret.m_nCurrY,70,'0',500);  //¿©ÇÏ¼ö À§¿¡¼­ ¼Ú¾Æ³²
           SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,70,'0');  //¿©ÇÏ¼ö À§¿¡¼­ ¼Ú¾Æ³²
         end;
      end;
   end;
end;

function  TBossTreeman.AttackTarget: Boolean;       //¿©ÇÏ¼ö
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 12) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 12) then begin
            if (GetAttackDir (m_TargetCret, targdir)) then begin
               m_dwTargetFocusTick := GetTickCount;
              Case Random(90) of
               0..19 : begin
                 Attack (m_TargetCret, targdir);
               end;
               20..39 : begin
                 Attack2 (m_TargetCret, targdir);
               end;
               40..59 : begin
                 Attack3 (m_TargetCret, targdir);
               end;
               60..79 : begin
                 RangeAttack (m_TargetCret);
               end;
               else begin
                 RangeAttack2 (m_TargetCret);
               end;
              end;

               try
                  if( ( random(3)= 0) and ( m_VisibleActors.Count > 0  ) )then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                     end;
                  end;
               except
                    MainOutMessage ('[Exception] TBigPotKing.AttackTarget fail target change 1');
               end;

               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  Case Random(40) of
                    0..19 : begin
                       RangeAttack (m_TargetCret);
                    end;
                    else begin
                       RangeAttack2 (m_TargetCret);
                    end;
                  end;
               end else begin
                  if Random(3) = 0 then
                     ChainShot := 0;
                  // 3ÃÊ
                  try

                  if ( GetCurrentTime > LongInt( 3000 + m_dwTargetFocusTick )) and ( m_VisibleActors.Count > 0 ) then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                        m_dwTargetFocusTick := GetTickCount;
                     end;
                  end;

                  except
                    MainOutMessage ('[Exception] TPBKingMonster.AttackTarget fail target change 2');
                  end;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//Å×½ºÆ®¸ó¿Õ =====================================================================
constructor TElectBossMon.Create;       //¾ÏÈæ¼±Àå
begin
   inherited Create;
   ChainShotCount := 3;
   m_nViewRange := 10;
end;


procedure TElectBossMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);  //¾ÏÈæ¼±Àå  ÁÖº¯°ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   ixf := _MAX(0, m_nCurrX - 7); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 7);
   iyf := _MAX(0, m_nCurrY - 7); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 7);


   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TElectBossMon.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer); //¾ÏÈæ¼±Àå ÁÖº¯ 5x5 °ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   ixf := _MAX(0, m_nCurrX - 7); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 7);
   iyf := _MAX(0, m_nCurrY - 7); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 7);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
                  if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                    cret.MakePosion (POISON_SLOWDOWN, 10{½Ã°£,ÃÊ}, 0);
                  end;
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;


procedure TElectBossMon.Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¾ÏÈæ¼±Àå ¹Ð±â
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
                  if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 5{½Ã°£,ÃÊ}, 0);
                  end;
               end;
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
                  if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 5{½Ã°£,ÃÊ}, 0);
                  end;
               end;
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;



procedure TElectBossMon.RangeAttack (targ: TBaseObject);   //¾ÏÈæ¼±Àå  ÀüÃ¼Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         end;
      end;
   end;
end;

function  TElectBossMon.FindTarget: Boolean;      //ºñ¿ùÃµÁÖ
var
   i: integer;
   cret: TBaseObject;
begin
   Result := FALSE;
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget(cret) then begin
         if (abs(m_nCurrX-cret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-cret.m_nCurrY) <= m_nViewRange) then begin
            if cret.m_btRaceServer = RC_PLAYOBJECT then begin
               if m_TargetCret = nil then begin
                  //Å¸°Ù ÁöÁ¤
                  m_TargetCret := cret;
               end else begin
                  //°íÁ¤ Å¸°Ù ¹æÁö.
                  if Random(100) < 50 then continue;

                  //Å¸°Ù ÁöÁ¤
                  m_TargetCret := cret;
               end;

               Result := TRUE;
               break;
            end;
         end;
      end;
   end;
end;


function  TElectBossMon.AttackTarget: Boolean;   //¾ÏÈæ¼±Àå
var
   targdir: byte;
   i, nx, ny: integer;
   cret: TBaseObject;
   rlist: TList;
begin
   Result := FALSE;

   rlist := nil;
   cret := nil;
   if m_TargetCret <> nil then begin
      if GetCurrentTime -  m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
            //¼ÒÈ¯(10%)
            if Random(10) = 0 then begin
               rlist := TList.Create;
               GetMapBaseObjects (m_PEnvir, m_nCurrY, m_nCurrY, 30, rlist);

               for i:=0 to rlist.Count-1 do begin
                  cret := TBaseObject (rlist[i]);
                  if (not cret.m_boDeath) and IsProperTarget (cret) then begin
                     //ÀÏÁ¤ ¹üÀ§ ¹Û¿¡ ÀÖ´Â »ç¶÷¸¸
                     if (cret.m_btRaceServer = RC_PLAYOBJECT) and ( (abs(m_nCurrX - cret.m_nCurrX) > 3) or (abs(m_nCurrY - cret.m_nCurrY) > 3) ) then begin
                        //¼ÒÈ¯ÇÑ´Ù.
                        if Random(3) < 2 then begin
                           if Random(2) = 0 then begin
                              nx := m_nCurrX + Random(3) + 1;
                              ny := m_nCurrY + Random(3) + 1;
                           end else begin
                              nx := m_nCurrX - Random(3) - 1;
                              ny := m_nCurrY - Random(3) - 1;
                           end;
                           cret.SpaceMove( m_PEnvir.sMapName, nx, ny, 2 );

                           //¼ÒÈ¯ Ä³¸¯ Effect
                           cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_DARK_RECALL, '0');
                        end;
                     end;
                  end;
               end;
               FreeAndNil(rlist);

               Result := TRUE;
            end else if Random(80) < 40 then begin
               //ÃÊÇÊ»ì °ø°Ý(35%)
               Attack3 (m_TargetCret, m_btDirection);
               Result := TRUE;
            end else if Random(80) < 40 then begin
               //ÃÊÇÊ»ì °ø°Ý(35%)
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end else if Random(10) < 4 then begin
               //Áß½É°ø°Ý(%)

               Attack (m_TargetCret, m_btDirection);
               Result := TRUE;
            end else begin
               //¿ø°Å¸®°ø°Ý(%)

               Attack2 (m_TargetCret, m_btDirection);
               Result := TRUE;
            end;
            //´Ù¸¥ Å¸°Ù ¹°»ö
            if Random(10) < 4 then begin
               FindTarget;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
              DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;

      end;
   end;

end;


{ ½£°ÅºÏÀÌ }

constructor TTreeTuttle.Create;//004AAE20
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=10;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
end;

destructor TTreeTuttle.Destroy;
begin
  inherited;
end;

procedure TTreeTuttle.MeltStone;
begin
  m_nCharStatusEx:=0;
  m_nCharStatus:=GetCharStatus();
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boStoneMode:=False;
end;

procedure TTreeTuttle.MeltStoneAll;
var
  I: Integer;
  List10:TList;
  BaseObject:TBaseObject;
begin
  MeltStone();
  List10:=TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,7,List10);
  for I := 0 to List10.Count - 1 do begin
    BaseObject:=TBaseObject(List10.Items[I]);
    if BaseObject.m_boStoneMode then begin
      if BaseObject is TTreeTuttle then begin
        TTreeTuttle(BaseObject).MeltStone
      end;
    end;
  end;    // for
  List10.Free;
end;

procedure TTreeTuttle.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;
  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
  end;
end;

procedure TTreeTuttle.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir:integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.2), 1, 0, '', 800);
  end;
end;

procedure TTreeTuttle.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
  ndir: integer;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
    if m_boStoneMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 7) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 7) then begin
              MeltStoneAll();
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
      if m_TargetCret <> nil then begin
        if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick:=GetCurrentTime;
          if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
            if Random(5) = 0 then begin
              RangeAttack(m_TargetCret);
            end else begin
              Attack(m_TargetCret,ndir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited;
end;


{ »ï³ª¹«Á¤¹é }
constructor TTreeJungBack.Create;//004AAE20
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_nViewRange:=10;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
end;

destructor TTreeJungBack.Destroy;
begin
  inherited;
end;

procedure TTreeJungBack.MeltStone;
begin
  m_nCharStatusEx:=0;
  m_nCharStatus:=GetCharStatus();
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boStoneMode:=False;
end;

procedure TTreeJungBack.MeltStoneAll;
var
  I: Integer;
  List10:TList;
  BaseObject:TBaseObject;
begin
  MeltStone();
  List10:=TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,7,List10);
  for I := 0 to List10.Count - 1 do begin
    BaseObject:=TBaseObject(List10.Items[I]);
    if BaseObject.m_boStoneMode then begin
      if BaseObject is TTreeTuttle then begin
        TTreeTuttle(BaseObject).MeltStone
      end;
    end;
  end;    // for
  List10.Free;
end;

procedure TTreeJungBack.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
  end;
end;

procedure TTreeJungBack.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir:integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.2), 1, 0, '', 800);
  end;
end;

procedure TTreeJungBack.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
   nDir: integer;
begin
  if TargeTBaseObject = nil then exit;

  nDir := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING_2, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
  WAbil:=@m_WAbil;
  pwr:=GetAttackPower(LoWord(WAbil.MC),SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr,0,0,'',800);
        if Random(2 + BaseObject.m_btAntiPoison) = 0 then
         BaseObject.MakePosion(POISON_SlowDown,6,0);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

procedure TTreeJungBack.Run;//004AAF98
var
  I: Integer;
  BaseObject:TBaseObject;
  ndir   : integer;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
    if m_boStoneMode then begin
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 7) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 7) then begin
              MeltStoneAll();
              break;
            end;
          end;
        end;
      end;    // for
    end else begin //004AB0C7
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
      if m_TargetCret <> nil then begin
        if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick:=GetCurrentTime;
          if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
            if Random(5) = 0 then begin
              RangeAttack2(m_TargetCret);
            end else if Random(2) = 0 then begin
              RangeAttack(m_TargetCret);
            end else begin
              Attack(m_TargetCret,ndir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited;
end;


//¸¶Ç³¼®±« =====================================================================
constructor TWindLead.Create;
begin
   inherited Create;
   ChainShotCount := 3;
   m_nViewRange := 10;
   m_nDangerLevel:=4;
   BoCallFollower := True;
end;

procedure TWindLead.CallSlave2(targ: TBaseObject); //004AB29C        //°Ý±«Àå
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1, recallmob2: string;
begin
  cret := nil;

   recallmob1 := 'ÕÙ»½»÷¹Ö½«';
   recallmob2 := 'ÑÒÊ¯Õ¨µ¯';
   if BoCallFollower then begin
         SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 5 , m_nCurrY + 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 3, m_nCurrY + 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY + 3, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 3, m_nCurrY + 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 5, m_nCurrY + 3, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;

         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 5 , m_nCurrY - 3, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 3, m_nCurrY - 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY - 3, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 3, m_nCurrY - 5, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 5, m_nCurrY - 3, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, 87, '0');
         end;


         BoCallFollower := FALSE;
   end;

end;


procedure TWindLead.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);  //±âº»°ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);


   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TWindLead.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer); //ÁÖº¯ 5x5 °ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   ixf := _MAX(0, m_nCurrX - 5); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 5);
   iyf := _MAX(0, m_nCurrY - 5); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 5);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;


procedure TWindLead.Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¹Ð±â
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := nDir;
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   // ¹Ð¾î³¾ ¹æÇâ È®ÀÎ
   ix := 0; iy := 0; ix2 := 0; iy2 := 0;
   case self.m_btDirection of
   0: begin
         ix := m_nCurrX;                                    iy := _MAX(0, m_nCurrY - 1);
         ix2:= m_nCurrX;                                    iy2:= _MAX(0, m_nCurrY - 2);
      end;
   1: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MAX(0, m_nCurrY - 2);
      end;
   2: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := m_nCurrY;
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= m_nCurrY;
      end;
   3: begin
         ix := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);      iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);      iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   4: begin
         ix := m_nCurrX;                                    iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= m_nCurrX;                                    iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   5: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
      end;
   6: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := m_nCurrY;
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= m_nCurrY;
      end;
   7: begin
         ix := _MAX(0, m_nCurrX - 1);                       iy := _MAX(0, m_nCurrY - 1);
         ix2:= _MAX(0, m_nCurrX - 2);                       iy2:= _MAX(0, m_nCurrY - 2);
      end;
   end;

   list := TList.Create;
   list.Clear;
   m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);

   list := TList.Create;
   m_PEnvir.GetBaseObjects (ix2, iy2, TRUE, list);
   for i:=0 to list.Count-1 do begin
      cret := TBaseObject(list[i]);
      if IsProperTarget (cret) then begin
         if (not cret.m_boDeath) and ((cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil)) then begin
            levelgap := 70 - cret.m_Abil.Level;
            if (Random(20) < 4+levelgap) then begin
               push := 1 + Random(3);
               cret.CharPushed (Self.m_btDirection, push);
            end;
         end;
      end;
   end;
   FreeAndNil(list);
end;

procedure TWindLead.RangeAttack (targ: TBaseObject);   //ÀüÃ¼Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         end;
      end;
   end;
end;

procedure TWindLead.RangeAttack2 (targ: TBaseObject);   //ÀüÃ¼Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
            SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,146,'0');//ÀüÁ¦Æø¹ß
         end;
      end;
   end;
end;

procedure TWindLead.RangeAttack3 (targ: TBaseObject);   //ÀüÃ¼Æø¹ß
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_4, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   // ½Ã¾ß³» ¸ðµç ÄÉ¸¯/¼ÒÈ¯¸÷ ÇÇ±ïÀ½
   for i := 0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
      if IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            dam := (cret.m_WAbil.HP div 4);
            cret.DamageHealth( dam ); //º¸È£ÀÇ¹ÝÁöÀû¿ë 2004-01-17
            cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                               cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
         end;
      end;
   end;
end;


procedure TWindLead.Run;//004AB444       //°Ý±«Àå
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave2(m_TargetCret);
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=4;
      end;

  end;
  inherited;
end;

function  TWindLead.AttackTarget: Boolean;       //¿©ÇÏ¼ö
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 8) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 8) then begin
            if (GetAttackDir (m_TargetCret, targdir)) then begin
               m_dwTargetFocusTick := GetTickCount;
              Case Random(100) of
               0..19 : begin
                 Attack (m_TargetCret, targdir);
               end;
               20..39 : begin
                 Attack2 (m_TargetCret, targdir);
               end;
               40..59 : begin
                 Attack3 (m_TargetCret, targdir);
               end;
               60..79 : begin
                 RangeAttack (m_TargetCret);
               end;
               80..89 : begin
                 RangeAttack3 (m_TargetCret);
               end;
               else begin
                 RangeAttack2 (m_TargetCret);
               end;
              end;

               try
                  if( ( random(3)= 0) and ( m_VisibleActors.Count > 0  ) )then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                     end;
                  end;
               except
                    MainOutMessage ('[Exception] TBigPotKing.AttackTarget fail target change 1');
               end;

               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  Case Random(50) of
                    0..19 : begin
                       RangeAttack (m_TargetCret);
                    end;
                    20..30 : begin
                       RangeAttack3 (m_TargetCret);
                    end;
                    else begin
                       RangeAttack2 (m_TargetCret);
                    end;
                  end;
               end else begin
                  if Random(3) = 0 then
                     ChainShot := 0;
                  // 3ÃÊ
                  try

                  if ( GetCurrentTime > LongInt( 3000 + m_dwTargetFocusTick )) and ( m_VisibleActors.Count > 0 ) then
                  begin
                     m_TargetCret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                     if ( m_TargetCret <> nil )then
                     begin
                        SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                        m_dwTargetFocusTick := GetTickCount;
                     end;
                  end;

                  except
                    MainOutMessage ('[Exception] TPBKingMonster.AttackTarget fail target change 2');
                  end;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{ TGasMothMonster }

constructor TGasMothMonster.Create;//004AB6B8
begin
  inherited;
  m_nViewRange:=7;
end;

destructor TGasMothMonster.Destroy;
begin

  inherited;
end;

function TGasMothMonster.sub_4A9C78(bt05: Byte): TBaseObject;//004AB708
var
  BaseObject:TBaseObject;
begin
  BaseObject:=inherited sub_4A9C78(bt05);
  if (BaseObject <> nil) and (Random(3) = 0) and (BaseObject.m_boHideMode) then begin
    BaseObject.m_wStatusTimeArr[STATE_TRANSPARENT{8 0x70}]:=1;
  end;
  Result:=BaseObject;
end;
procedure TGasMothMonster.Run;//004AB758
begin
  if (not bo554) and CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      sub_4C959C();
    end;
  end;
  inherited;
end;
{ TGasDungMonster }

constructor TGasDungMonster.Create;//004AB7F4
begin
  inherited;
  m_nViewRange:=7;
end;

destructor TGasDungMonster.Destroy;
begin

  inherited;
end;




{ TElfMonster }

procedure TElfMonster.AppearNow;//004AB908
begin
   boIsFirst := FALSE;
   m_boFixedHideMode := FALSE;
   RecalcAbilitys;
   m_dwWalkTick := m_dwWalkTick + 800;
end;

constructor TElfMonster.Create;
begin
  inherited Create;
  m_nViewRange:=6;
  m_boFixedHideMode:=True;
  m_boNoAttackMode:=True;
  boIsFirst:=True;
end;

procedure TElfMonster.RecalcAbilitys;
begin
  inherited RecalcAbilitys;
  ResetElfMon();
end;

procedure TElfMonster.ResetElfMon();
begin
  m_nWalkSpeed:=500 - m_btSlaveMakeLevel * 50;
  m_dwWalkTick:=GetCurrentTime + 2000;
end;

procedure TElfMonster.Run;
var
  boChangeFace:Boolean;
  ElfMon:TBaseObject;
begin
  if boIsFirst then begin
    boIsFirst:=False;
    m_boFixedHideMode:=False;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    ResetElfMon();
  end;
  if m_boDeath then begin
    if (GetTickCount - m_dwDeathTick > 2 * 1000) then begin
       MakeGhost();
    end;
  end else begin
    boChangeFace:=False;
    if m_TargetCret <> nil then boChangeFace:=True;
    if (m_Master <> nil) and ((m_Master.m_TargetCret <> nil) or (m_Master.m_LastHiter <> nil)) then
      boChangeFace:=True;
    if boChangeFace then begin
      ElfMon:=MakeClone(g_Config.sDragon1,Self);
      if ElfMon <> nil then begin
        if ElfMon is TElfWarriorMonster then TElfWarriorMonster(ElfMon).AppearNow;
        m_Master:=nil;
        KickException();
      end;
    end;
  end;
  inherited Run;
end;
{ TElfWarriorMonster }
procedure TElfWarriorMonster.AppearNow; //004ABB60
begin
   boIsFirst := FALSE;
   m_boFixedHideMode := FALSE;
   SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
   RecalcAbilitys;
   m_dwWalkTick := m_dwWalkTick + 800; //º¯½ÅÈÄ ¾à°£ µô·¹ÀÌ ÀÖÀ½
   dwDigDownTick:=GetTickCount();
end;

constructor TElfWarriorMonster.Create;
begin
  inherited Create;
  m_nViewRange:=6;
  m_boFixedHideMode:=True;

  boIsFirst:=True;
  m_boUsePoison:=False;
end;

//004ABB08
procedure TElfWarriorMonster.RecalcAbilitys; //004ABAEC
begin
  inherited RecalcAbilitys;
  ResetElfMon();
end;

procedure TElfWarriorMonster.ResetElfMon();
begin
  m_nNextHitTime:=1500 - m_btSlaveMakeLevel * 100;
  m_nWalkSpeed:=500 - m_btSlaveMakeLevel * 50;
  m_dwWalkTick:=GetCurrentTime + 2000;
end;

procedure TElfWarriorMonster.Run; //004ABBD0
var
  boChangeFace:Boolean;
  ElfMon:TBaseObject;
  ElfName:String;
begin
  ElfMon:=nil;
  if boIsFirst then begin
    boIsFirst:=False;
    m_boFixedHideMode:=False;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    ResetElfMon();
  end;//004ABC27
  if m_boDeath then begin
    if (GetTickCount - m_dwDeathTick > 2 * 1000) then begin
       MakeGhost();
    end;
  end else begin

    boChangeFace:=True;
    if m_TargetCret <> nil then boChangeFace:=False;
    if (m_Master <> nil) and ((m_Master.m_TargetCret <> nil) or (m_Master.m_LastHiter <> nil)) then
      boChangeFace:=False;
    if boChangeFace then begin
      if (GetTickCount - dwDigDownTick) > 6 * 10 * 1000 then begin
      //if (GetTickCount - dwDigDownTick) > 10 * 1000 then begin
        //ElfMon:=MakeClone(sDogz,Self);

        ElfName:=m_sCharName;
        if ElfName[length(ElfName)] = '1' then begin
          ElfName:=Copy(ElfName,1,length(ElfName) -1);
          ElfMon:=MakeClone(ElfName,Self);
        end;
        if ElfMon <> nil then begin
          SendRefMsg(RM_DIGDOWN, m_btDirection,m_nCurrX,m_nCurrY,0,'');
          SendRefMsg(RM_CHANGEFACE,0,Integer(Self),Integer(ElfMon),0,'');
          if ElfMon is TElfMonster then
            TElfMonster(ElfMon).AppearNow;
          m_Master:=nil;
          KickException();
        end;
      end;
    end else begin
      dwDigDownTick:=GetTickCount();
    end;
  end;
  inherited Run;
end;


{ TElectronicScolpionMon }

constructor TElectronicScolpionMon.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TElectronicScolpionMon.Destroy;
begin

  inherited;
end;

function TElectronicScolpionMon.MagCanHitTarget(nX, nY:Integer;
  TargeTBaseObject: TBaseObject): Boolean; //004C6B1C
var
  n14,n18,n19,n1C,n20:Integer;
begin
  Result:=False;
  if TargeTBaseObject = nil then exit;
  n20:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
  n14:=0;
  n18:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  while (n14 < 13) do begin
    n19:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
    if n18 <> n19 then
      break;
    if m_PEnvir.GetNextPosition(nX,nY,n18,1,nX,nY) and m_PEnvir.IsValidCell(nX,nY) then begin
      if (nX = TargeTBaseObject.m_nCurrX) and (nY = TargeTBaseObject.m_nCurrY) then begin
        Result:=True;
        break;
      end else begin
        n1C:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
        if n1C > n20 then begin
          Result:=True;
          break;
        end;
        n1C:=n20;
      end;
    end else begin
      break;
    end;
    Inc(n14);
  end;
end;

procedure TElectronicScolpionMon.LightingAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPassThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True);
  end;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
end;

procedure TElectronicScolpionMon.Run;
var
  nAttackDir,nDir,distx,disty:Integer;
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin

    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic:=True
    else m_boUseMagic:=False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
    //walking
     if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
        distx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY
        end;
      end;
      nX:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
      nY:=abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) then begin //make sure the 'line' in wich magic will go isnt blocked
        if (nX <= 3) and (nY <= 3) then begin
          if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
              m_dwHitTick:=GetCurrentTime;
              nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
              LightingAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;



{ TMermaidMon }

constructor TMermaidMon.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TMermaidMon.Destroy;
begin

  inherited;
end;

function TMermaidMon.MagCanHitTarget(nX, nY:Integer;
  TargeTBaseObject: TBaseObject): Boolean; //004C6B1C
var
  n14,n18,n19,n1C,n20:Integer;
begin
  Result:=False;
  if TargeTBaseObject = nil then exit;
  n20:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
  n14:=0;
  n18:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  while (n14 < 13) do begin
    n19:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
    if n18 <> n19 then
      break;
    if m_PEnvir.GetNextPosition(nX,nY,n18,1,nX,nY) and m_PEnvir.IsValidCell(nX,nY) then begin
      if (nX = TargeTBaseObject.m_nCurrX) and (nY = TargeTBaseObject.m_nCurrY) then begin
        Result:=True;
        break;
      end else begin
        n1C:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
        if n1C > n20 then begin
          Result:=True;
          break;
        end;
        n1C:=n20;
      end;
    end else begin
      break;
    end;
    Inc(n14);
  end;
end;

procedure TMermaidMon.LightingAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPosionThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True,1);   //µÐÈ­
  end;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
end;

procedure TMermaidMon.Run;
var
  nAttackDir,nDir,distx,disty:Integer;
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin

    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic:=True
    else m_boUseMagic:=False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
    //walking
     if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
        distx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY
        end;
      end;
      nX:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
      nY:=abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) then begin //make sure the 'line' in wich magic will go isnt blocked
        if (nX <= 3) and (nY <= 3) then begin
          if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
              m_dwHitTick:=GetCurrentTime;
              nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
              LightingAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;



{ TMermaidMon2 }

constructor TMermaidMon2.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TMermaidMon2.Destroy;
begin

  inherited;
end;

function TMermaidMon2.MagCanHitTarget(nX, nY:Integer;
  TargeTBaseObject: TBaseObject): Boolean; //004C6B1C
var
  n14,n18,n19,n1C,n20:Integer;
begin
  Result:=False;
  if TargeTBaseObject = nil then exit;
  n20:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
  n14:=0;
  n18:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  while (n14 < 13) do begin
    n19:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
    if n18 <> n19 then
      break;
    if m_PEnvir.GetNextPosition(nX,nY,n18,1,nX,nY) and m_PEnvir.IsValidCell(nX,nY) then begin
      if (nX = TargeTBaseObject.m_nCurrX) and (nY = TargeTBaseObject.m_nCurrY) then begin
        Result:=True;
        break;
      end else begin
        n1C:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
        if n1C > n20 then begin
          Result:=True;
          break;
        end;
        n1C:=n20;
      end;
    end else begin
      break;
    end;
    Inc(n14);
  end;
end;

procedure TMermaidMon2.LightingAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPosionThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True,0);    //³ìµ¶
  end;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
end;

procedure TMermaidMon2.Run;
var
  nAttackDir,nDir,distx,disty:Integer;
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin

    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic:=True
    else m_boUseMagic:=False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
    //walking
     if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
        distx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY
        end;
      end;
      nX:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
      nY:=abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) then begin //make sure the 'line' in wich magic will go isnt blocked
        if (nX <= 3) and (nY <= 3) then begin
          if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
              m_dwHitTick:=GetCurrentTime;
              nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
              LightingAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;





{ TMermaidMon3 }

constructor TMermaidMon3.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TMermaidMon3.Destroy;
begin

  inherited;
end;

function TMermaidMon3.MagCanHitTarget(nX, nY:Integer;
  TargeTBaseObject: TBaseObject): Boolean; //004C6B1C
var
  n14,n18,n19,n1C,n20:Integer;
begin
  Result:=False;
  if TargeTBaseObject = nil then exit;
  n20:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
  n14:=0;
  n18:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  while (n14 < 13) do begin
    n19:=GetNextDirection(nX,nY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
    if n18 <> n19 then
      break;
    if m_PEnvir.GetNextPosition(nX,nY,n18,1,nX,nY) and m_PEnvir.IsValidCell(nX,nY) then begin
      if (nX = TargeTBaseObject.m_nCurrX) and (nY = TargeTBaseObject.m_nCurrY) then begin
        Result:=True;
        break;
      end else begin
        n1C:=abs(nX - TargeTBaseObject.m_nCurrX) + abs(nY - TargeTBaseObject.m_nCurrY);
        if n1C > n20 then begin
          Result:=True;
          break;
        end;
        n1C:=n20;
      end;
    end else begin
      break;
    end;
    Inc(n14);
  end;
end;

procedure TMermaidMon3.LightingAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPosionThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True,3);    //»¡µ¶
  end;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
end;

procedure TMermaidMon3.Run;
var
  nAttackDir,nDir,distx,disty:Integer;
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin

    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic:=True
    else m_boUseMagic:=False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_TargetCret <> nil then begin
    //walking
     if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
        distx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY
        end;
      end;
      nX:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
      nY:=abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) then begin //make sure the 'line' in wich magic will go isnt blocked
        if (nX <= 3) and (nY <= 3) then begin
          if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
              m_dwHitTick:=GetCurrentTime;
              nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
              LightingAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;




constructor TCrystalSpider.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
end;

destructor TCrystalSpider.Destroy;
begin
  inherited;
end;

function TCrystalSpider.AttackTarget():Boolean; //004A8F34
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        Attack(m_TargetCret,btDir);  //FFED
        if (Random(m_TargetCret.m_btAntiPoison + 20) = 0) then
          m_TargetCret.MakePosion(POISON_DECHEALTH,30,10);
        BreakHolySeizeMode();  //°á°è ÆÄ±«
      end;
      Result:=True;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY); {0FFF0h}
        //004A8FE3
      end else begin
        DelTargetCreat();{0FFF1h}
        //004A9009
      end;
    end;
  end;
end;



constructor TGumimasin.Create;
begin
  ldistx:=0;
  ldisty:=0;
  m_dwSearchTime:=Random(1500) + 1500;
  m_dwSpellTick:=GetTickCount();
  m_boAnimal:=False;
  inherited;
end;

destructor TGumimasin.Destroy;
begin
  inherited;
end;

procedure TGumimasin.Run;//004AA604
var
  distx,disty:integer;
  nDir:integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin
//walk codes next (since ok doesnt go near players like other mobs do this is hopefully a correct code)
  if (m_TargetCret <> nil) then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
      m_dwWalkTick:=GetCurrentTime;
      distx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
      disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
      nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      if (distx > ldistx) or (disty > ldisty) or (distx > 5) or (disty > 5) then begin //if the last distance from us is further then the current (aka if they running)
        if ((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12)) then begin //restrict the maximum pursuit distance to 12 coords away
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY;
          ldistx:=abs(m_nCurrX - m_TargetCret.m_nCurrX);
          ldisty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
          exit;
        end;
      end;

      ldistx :=distx;
      ldisty :=disty;
    end;
  end;
//regular attack code
  if (m_TargetCret <> nil) and (GetCurrentTime - m_dwHitTick > GetHitSpeed) and
   (Integer(GetTickCount - m_dwSpellTick) > m_nNextHitTime) and
   (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 2)
     and ((abs(m_nCurrY - m_TargetCret.m_nCurrY) + abs(m_nCurrX - m_TargetCret.m_nCurrX)) <= 3) then begin
    m_dwHitTick:=GetCurrentTime;
    if( Random(8) = 0) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1)and (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 1) then begin //10% chance he just attacks)
      attacktarget(); //no point trying to hit something that isnt close enough :p
      if (Random(10) = 0) then begin
        m_TargetCret.MakePosion(POISON_STONE,5,0);
      end;
    end else //does repulse
      RepulseCircle();
  end;
//magic attack code
  if (m_TargetCret <> nil) and
       (Integer(GetTickCount - m_dwSpellTick) > m_nNextHitTime * 4) then begin
        m_dwSpellTick:=GetTickCount();
        RedCircle();
     end;
//search for targets nearbye
  if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
  end;
  end;
  inherited;
end;

procedure TGumimasin.RedCircle();
var
Target:TBaseObject;
magpwr:Integer;
WAbil:pTAbility;
begin
if m_TargetCret <> nil then Target:=m_TargetCret;

SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');

 {Hit first Target}
 if IsProperTarget (Target) then begin
  if Random(50) >= Target.m_nAntiMagic then begin
       WAbil:=@m_WAbil;
       magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
       Target.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);
  end;
 end;
end;

procedure TGumimasin.RepulseCircle();
var
  I:Integer;
  BaseObject:TBaseObject;
  nDir:Byte;
  push:integer;
begin
 {do spell effect}
 nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
 m_btDirection:=nDir;
 SendAttackMsg(RM_hit,nDir,m_nCurrX,m_nCurrY);

 {do repule radius around 'ourself'}
 for i:=0 to m_VisibleActors.Count-1 do begin
  BaseObject:= TBaseObject (pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
   if (abs(m_nCurrX-BaseObject.m_nCurrX) <= 2) and (abs(m_nCurrY-BaseObject.m_nCurrY) <= 2)
    and ((abs(m_nCurrY - m_TargetCret.m_nCurrY) + abs(m_nCurrX - m_TargetCret.m_nCurrX)) <= 3) then begin

    {if BaseObject <> nil then begin
      if IsProperTarget (BaseObject) then begin
        if Random(50) >= BaseObject.m_nAntiMagic then begin
          push := 1 + Random(3);
          nDir:= GetNextDirection (m_nCurrX, m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
          BaseObject.CharPushed (nDir, push);
        end;
      end;
    end;}
   end;
  end;
end;

function TGumimasin.AttackTarget():Boolean;
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        Attack(m_TargetCret,btDir);
      end;
      Result:=True;
    end;
  end;
end;



constructor TCrystalSpider2.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
end;

destructor TCrystalSpider2.Destroy;
begin
  inherited;
end;

function TCrystalSpider2.AttackTarget():Boolean; //004A8F34
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        Attack(m_TargetCret,btDir);  //FFED
        if (Random(m_TargetCret.m_btAntiPoison + 20) = 0) then
          m_TargetCret.MakePosion(POISON_DECHEALTH,30,10);
        BreakHolySeizeMode();
      end;
      Result:=True;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY); {0FFF0h}
        //004A8FE3
      end else begin
        DelTargetCreat();{0FFF1h}
        //004A9009
      end;
    end;
  end;
end;

constructor THeal.Create;
begin
  inherited;
  m_nViewRange:=16;
  m_boAnimal:=False;
end;

destructor THeal.Destroy;
begin

  inherited;
end;

function THeal.AttackTarget():Boolean;
var
  I: Integer;
  BaseObject:TBaseObject;
  nPower:Integer;
  WAbil:pTAbility;
begin
  Result:=False;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    WAbil:=@m_WAbil;
    nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if BaseObject.m_boDeath then Continue;
      if IsProperTarget(BaseObject) then begin
        if (abs(m_nCurrX - BaseObject.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= m_nViewRange) then begin
          SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(BaseObject.m_nCurrX,BaseObject.m_nCurrY),1,Integer(BaseObject),'',200);
        end;
      end;
    end;
    Result:=True;
  end;
end;

procedure THeal.Run;
begin
  if CanMove then begin
    if m_VisibleActors.Count > 0 then
      AttackTarget();
  end;
   if (Random(10) = 0) then begin
      RM_10414();
   end;
  inherited;
end;

procedure THeal.RM_10414();
var
  I:Integer;
  BaseObject:TBaseObject;
  nDir:Byte;
  push:integer;
begin
 nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
 m_btDirection:=nDir;
end;



constructor TJumaThunder.Create;//004AAE20
begin
  inherited Create;
  m_nViewRange := 11;
  m_boStoneMode:=True;
  m_nCharStatusEx:=STATE_STONE_MODE;
  BoDontMove := True;
  MeltArea  := 5;
end;

procedure TJumaThunder.RangeAttack (targ: TBaseObject);
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
    // ºÓÀº °­°ÝÀ» ³¯¸°´Ù.
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

    with m_WAbil do
       pwr := _MAX( 0, LoWord(DC) + Random(SmallInt(HiWord(DC)-LoWord(DC)) + 1) );

    list := TList.Create;
    GetMapBaseObjects ( m_PEnvir, targ.m_nCurrX, targ.m_nCurrY, 1, list);

    for i:=0 to list.Count-1 do
    begin
       cret := TBaseObject(list[i]);
       if IsProperTarget (cret) then
       begin

          if ( random(18) > (cret.m_nAntiMagic*3) ) then
          begin

              dam := cret.GetMagStruckDamage (self, pwr);

              if ( cret <> targ) then dam := dam div 2;

              if dam > 0 then
              begin
                 cret.StruckDamage (dam);
                 cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '', 800);
              end;
           end;
         end;
    end;
    FreeAndNil(list);
end;

function TJumaThunder.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
    // ±ÙÁ¢ÇØ ÀÏÀ»¶§¿¡´Â ±ÙÁ¢ Èû °ø°ÝÀ»
    // ¿ø°Å¸® ÀÏ¶§´Â ¿ø°Å¸® ¸¶¹ý°ø°ÝÀ» ÇÑ´Ù.

   if m_TargetCret <> nil then
   begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then
      begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange ) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange ) then
         begin
            if (GetAttackDir (m_TargetCret, targdir)) then
            begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else
            begin
               if Random(3)= 0 then
               begin
                   RangeAttack (m_TargetCret);
                   Result := TRUE;
               end
               else
               begin
                   result := Inherited AttackTarget;
               end;

            end;
         end
         else
         begin
            if m_TargetCret.m_sMapName = self.m_sMapName then
            begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then
               begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;

      end;
   end;
end;


{ TStoneMonster }

constructor TStoneMonster.Create;
begin
  inherited;
  m_nViewRange   := 6;

  m_boStickMode  := True;
  BoDontMove  := TRUE;
end;

destructor TStoneMonster.Destroy;
begin

  inherited;
end;

procedure TStoneMonster.Run;
var
  i, x, y:     integer;
  nStartX, nStartY, nEndX, nEndY: integer;
  boRecalc:Boolean;
  BaseObject: TBaseObject;
  xList:TList;
begin
  if (not m_boGhost) and (not m_boDeath) then begin
    if GetCurrentTime - m_dwWalkTick > 5000 then begin
      m_dwWalkTick := GetCurrentTime;

      nStartX := _MAX(0, m_nCurrX-3);
      nEndX := _MIN(m_PEnvir.m_nWidth, m_nCurrX+3);
      nStartY := _MAX(0, m_nCurrY-3);
      nEndY := _MIN(m_PEnvir.m_nHeight, m_nCurrY+3);

      xList:=TList.Create;
      for x := nStartX to nEndX do begin
        for y := nStartY to nEndY do begin

          m_PEnvir.GetBaseObjects(x, y, True, xList);
          for i := 0 to xList.Count - 1 do begin
            BaseObject := TBaseObject(xList.Items[i]);
            boRecalc := False;
            if BaseObject<>nil then begin
              if (BaseObject.m_btRaceServer <> RC_PLAYOBJECT) and
                (BaseObject.m_Master = nil) and
                (not BaseObject.m_boGhost) and
                (not BaseObject.m_boDeath) then begin

                if BaseObject.m_btRaceServer = MONSTER_STONE then begin   //¸¶°è¼®
                  if BaseObject.m_wStatusArrValue[0] = 0 then begin
                    boRecalc := True;
                    BaseObject.m_wStatusArrValue[0] := 15;
                    BaseObject.m_dwStatusArrTimeOutTick[0] := GetTickCount + 15100;
                  end;
                end else begin
                  if BaseObject.m_wStatusTimeArr[STATE_DEFENCEUP] = 0 then begin
                    boRecalc := True;
                    BaseObject.m_wStatusTimeArr[STATE_DEFENCEUP] := 8;
                    BaseObject.m_dwStatusArrTick[STATE_DEFENCEUP] := GetTickCount;
                  end;
                  if BaseObject.m_wStatusTimeArr[STATE_MAGDEFENCEUP] = 0 then begin
                    boRecalc := True;
                    BaseObject.m_wStatusTimeArr[STATE_MAGDEFENCEUP] := 8;
                    BaseObject.m_dwStatusArrTick[STATE_MAGDEFENCEUP] := GetTickCount;
                  end;
                end;

                if boRecalc then BaseObject.RecalcAbilitys();
              end;
            end;

            if (Random(6) = 0) and boRecalc then begin
              SendRefMsg(RM_HIT, 0, m_nCurrX, m_nCurrY, 0, '');
            end;
          end;
        end;
      end;
      FreeAndNil(xList);
      if Random(2) = 0 then begin
        SendRefMsg(RM_TURN, 0, m_nCurrX, m_nCurrY, 0, '');
      end;
    end;
  end;
  inherited;
end;



constructor TMillstoneKing.Create;    //¼®¸¶¼ö
begin
   inherited Create;
   m_nViewRange := 4;
   ChainShotCount := 8;
   dw558 := GetTickCount;

end;
destructor TMillstoneKing.Destroy;    //¼®¸¶¼ö
begin
  inherited;
end;

procedure TMillstoneKing.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);     //¼®¸¶¼ö ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;

end;



procedure TMillstoneKing.RangeAttack (targ: TBaseObject); //¼®¸¶¼ö È¸¿À¸®
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 300);
             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 1500);
             end;

          end;
        end;
      end;

   end;

end;

procedure TMillstoneKing.RangeAttack2 (targ: TBaseObject); //¼®¸¶¼ö ³«¿°
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 800);
             SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,40,'0');  //¼®¸¶ ³«¿°

          end;
        end;
      end;

   end;

end;

procedure TMillstoneKing.RangeAttack3 (targ: TBaseObject); //¼®¸¶¼ö ½ºÅÏ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;


   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
           SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,64,'0');  //¼®¸¶ ½ºÅÏ
          if Random(cret.m_btAntiPoison + 15) <= 3 then begin
            cret.MakePosion (POISON_STONE, 1, 0);
          end;

        end;
      end;

   end;

end;

procedure TMillstoneKing.Run;//004AA294    //¼®¸¶¼ö
var
  n8,nC,n10:Integer;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
     if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
     end;
     if (not m_boDeath) and
       (not bo554) and
       (not m_boGhost) and
       ((GetTickCount - dw558) > 25 * 1000) then begin

       dw558:=GetTickCount();
       if (m_TargetCret <> nil) and (sub_4C3538 >= 4) then begin
         m_TargetCret.GetBackPosition(n8,nC);
          if m_PEnvir.CanWalk(n8,nC,False) then begin
           if Random(10) <= 1 then
            MapRandomMove(m_PEnvir.sMapName,0)
           else
            SpaceMove(m_PEnvir.sMapName,n8,nC,0);
           exit;
          end;
       end;
     end;
  end;


  inherited;
end;

function  TMillstoneKing.AttackTarget: Boolean;           //¼®¸¶¼ö
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
              if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  if Random(80) <= 15 then
                    RangeAttack3 (m_TargetCret)
                  else
                  if Random(60) <= 15 then
                    RangeAttack (m_TargetCret)
                  else
                    RangeAttack2 (m_TargetCret);
               end else begin
                  if Random(2) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//°øÀÛÁÖ---------------------------
constructor TPeacockspider.Create;    //°øÀÛÁÖ
begin
   inherited Create;
   m_nViewRange := 7;
   ChainShotCount := 8;
end;
destructor TPeacockspider.Destroy;    //°øÀÛÁÖ
begin
  inherited;
end;

procedure TPeacockspider.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);     //°øÀÛÁÖ ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;

end;



procedure TPeacockspider.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer); //°øÀÛÁÖ ÁÖº¯ 5x5 °ø°Ý
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   ixf := _MAX(0, m_nCurrX - 4); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 4);
   iyf := _MAX(0, m_nCurrY - 4); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 4);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);

                  if Random(cret.m_btAntiPoison + 15) <= 3 then begin
                     cret.MakePosion (POISON_DAMAGEARMOR, 30, 0);
                  end;
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;



procedure TPeacockspider.RangeAttack (targ: TBaseObject); //°øÀÛÁÖ °Å¹ÌÁÙ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));


   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 300);
             if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
              cret.StruckDamage (dam);
              cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 1500);
             end;

             if Random(cret.m_btAntiPoison + 15) <= 3 then begin
                cret.MakePosion (POISON_SLOWDOWN, 10, 0);
             end;

          end;
        end;
      end;

   end;

end;

procedure TPeacockspider.RangeAttack2 (targ: TBaseObject); //°øÀÛÁÖ µ¶ ¶³¾îÁö´Â
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));


     SendRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,117,'0');  //°øÀÛÁÖ µ¶ ¾È°³

     SendDelayRefMsg(RM_10205,0,targ.m_nCurrX,targ.m_nCurrY,118,'0',500);  //°øÀÛÁÖ µ¶

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 800);

             if Random(cret.m_btAntiPoison + 15) <= 3 then begin
                cret.MakePosion (POISON_DECHEALTH, 30, 10);
             end;
          end;
        end;
      end;

   end;

end;

procedure TPeacockspider.RangeAttack3 (targ: TBaseObject); //°øÀÛÁÖ ½ºÅÏ
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;


   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
           SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,71,'0');  //°øÀÛÁÖ ½ºÅÏ
          if Random(cret.m_btAntiPoison + 15) <= 3 then begin
            cret.MakePosion (POISON_STONE, 5, 0);
          end;

        end;
      end;

   end;

end;

procedure TPeacockspider.Run;//004AA294    //°øÀÛÁÖ
var
  n8,nC,n10:Integer;
begin
  if CanMove and (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
     if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
     end;
  end;

  inherited;
end;

function  TPeacockspider.AttackTarget: Boolean;           //°øÀÛÁÖ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) then begin
               m_dwTargetFocusTick := GetTickCount;
               Case Random(90) of
                 0..19 : begin
                    Attack (m_TargetCret, targdir);
                 end;
                 20..39 : begin
                    Attack2 (m_TargetCret, targdir);
                 end;
                 40..59 : begin
                    RangeAttack (m_TargetCret);
                 end;
                 60..79 : begin
                    RangeAttack2 (m_TargetCret);
                 end;
                 else begin
                    RangeAttack3 (m_TargetCret);
                 end;
               end;
               Result := TRUE;
            end else begin
              if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  Case Random(50) of
                    0..19 : begin
                       RangeAttack (m_TargetCret);
                    end;
                    20..39 : begin
                       RangeAttack2 (m_TargetCret);
                    end;
                    else begin
                       RangeAttack3 (m_TargetCret);
                    end;
                  end;
               end else begin
                  if Random(2) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//------------------------------ÇÑºù
constructor TOmaDarkKing.Create;    //ÇÑºù¼öÈ£±Í
begin
   inherited Create;
   ChainShotCount := 5;
   m_nViewRange := 7;
end;

destructor TOmaDarkKing.Destroy;   //ÇÑºù¼öÈ£±Í
begin
  inherited;
end;

procedure TOmaDarkKing.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÇÑºù¼öÈ£±Í
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
      iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

end;

procedure TOmaDarkKing.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÇÑºù¼öÈ£±Í
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
      iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);

               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;

end;

procedure TOmaDarkKing.Run;//004AB444        //ÇÑºù¼öÈ£±Í
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
  end;
  inherited;
end;

procedure TOmaDarkKing.RangeAttack (targ: TBaseObject);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

             if (Random(15) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
                cret.MakePosion(POISON_SLOWDOWN,10,0);
             end;
          end;
        end;
      end;
   end;

end;


procedure TOmaDarkKing.RangeAttack2 (targ: TBaseObject);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

             if (Random(15) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
                cret.MakePosion(POISON_SLOWDOWN,10,0);
             end;
          end;
        end;
      end;
   end;

end;


procedure TOmaDarkKing.RangeAttack3 (targ: TBaseObject);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));
   targ.SendDelayRefMsg(RM_10205,0, targ.m_nCurrX, targ.m_nCurrY, NE_OMADRAKKINH, IntToStr(self.m_btDirection),2000);

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);
             if (Random(20) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
               cret.MakePosion(POISON_STONE,5,0);
             end;
          end;
        end;
      end;
   end;

end;


function  TOmaDarkKing.AttackTarget: Boolean;        //ÇÑºù¼öÈ£±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(40) < 15 then
                 RangeAttack2 (m_TargetCret)
               else
               if Random(40) < 15 then
                 Attack2 (m_TargetCret, targdir)
               else
               if Random(40) < 15 then
                 RangeAttack3 (m_TargetCret)
               else
                 Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret)
               end else begin
                  if Random(2) = 0 then ChainShot := 0;
                  m_dwTargetFocusTick := GetTickCount;
                  if Random(40) < 15 then
                    RangeAttack3 (m_TargetCret)
                  else
                  RangeAttack2 (m_TargetCret);
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



//------------------------------ÇÑºù
constructor TIceHellKing.Create;    //ÇÑºù¼öÈ£±Í
begin
   inherited Create;
   ChainShotCount := 5;
   m_nViewRange := 7;
end;

destructor TIceHellKing.Destroy;   //ÇÑºù¼öÈ£±Í
begin
  inherited;
end;

procedure TIceHellKing.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÇÑºù¼öÈ£±Í
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     // pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;

end;

procedure TIceHellKing.Attack2(TargeTBaseObject: TBaseObject; nDir: Integer);    //ÇÑºù¼öÈ£±Í
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
      iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);

                  if (Random(20) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
                     cret.MakePosion(POISON_SLOWDOWN,10,0);
                  end;
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TIceHellKing.Run;//004AB444        //ÇÑºù¼öÈ£±Í
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
  end;
  inherited;
end;

procedure TIceHellKing.RangeAttack (targ: TBaseObject); //ÇÑºù¼öÈ£±Í ¾óÀ½ È¸¿À¸®
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
      pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

             if (Random(15) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
                 cret.MakePosion(POISON_SLOWDOWN,10,0);
             end;
          end;
        end;
      end;
   end;

end;



function  TIceHellKing.AttackTarget: Boolean;        //ÇÑºù¼öÈ£±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(40) < 15 then
               Attack2 (m_TargetCret, targdir)
               else
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret)
               end else begin
                  if Random(2) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;

constructor TGeneralCat.Create;   //Áø¹¦Àå±º
begin
   inherited Create;
   m_nViewRange := 7;
   ChainShotCount := 8;
   BoCallFollower := True;
   m_nDangerLevel:=5;
end;
destructor TGeneralCat.Destroy;    //Áø¹¦Àå±º
begin
  inherited;
end;

procedure TGeneralCat.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);      //Áø¹¦Àå±º ÀÏ¹Ý°ø°Ý
var
   pwr: integer;
   i, ix, iy, ixf, ixt, iyf, iyt, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
   //   pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      ixf := _MAX(0, m_nCurrX - 1); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 1);
      iyf := _MAX(0, m_nCurrY - 1); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 1);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 200);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;


procedure TGeneralCat.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);   //Áø¹¦Àå±º
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[nDir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin
                  //¸Â´ÂÁö °áÁ¤
                  if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     cret.StruckDamage (pwr);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                        500 );
                  end;
               end;
            end;
         end;
      end;
end;

procedure TGeneralCat.RangeAttack (targ: TBaseObject);  //Áø¹¦Àå±º °­°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   cret: TBaseObject;
   CriticalMode : Boolean;
begin
   if targ = nil then exit;

   if Random(40) < 5 then begin
      CriticalMode := True;
   end else
      CriticalMode := False;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

    if CriticalMode = True then
      pwr := pwr * 2
    else
      pwr := pwr;

   for i:=0 to targ.m_VisibleActors.Count-1 do begin
    cret:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);

      if cret <> nil then begin
        if IsProperTarget (cret) then begin
          dam := cret.GetMagStruckDamage (self, pwr);
          if dam > 0 then begin
             cret.StruckDamage (dam);
             cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                         cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 500);

             if Random(cret.m_btAntiPoison + 15) <= 3 then begin
               cret.MakePosion (POISON_STONE, 5, 1);
             end;

            if CriticalMode = True then begin
              SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,92,'0');  //Áø¹¦ °­°Ý
            end else
              SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,93,'0');  //Áø¹¦ °­°Ý

          end;
        end;
      end;
   end;

end;

procedure TGeneralCat.CallSlave2(targ: TBaseObject); //004AB29C          //Áø¹¦Àå±º
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1,recallmob2: string;
begin
  cret := nil;
   recallmob1 := '¼×Ã¨';
   recallmob2 := 'Î×Ê¦Ã¨';
   if BoCallFollower then begin
     SendRefMsg (RM_LIGHTING_3, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 1 , m_nCurrY - 1, recallmob1);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 1, m_nCurrY + 2, recallmob1);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX - 1, m_nCurrY + 1, recallmob1);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 1, m_nCurrY, recallmob1);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 1, m_nCurrY + 1, recallmob2);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX + 1, m_nCurrY - 1, recallmob2);
     cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX , m_nCurrY + 1, recallmob2);
     BoCallFollower := FALSE;
   end;

end;

procedure TGeneralCat.Run;//004AB444        //Áø¹¦Àå±º
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
        if BoCallFollower then begin
         if (m_nDangerLevel > m_WAbil.HP / m_WAbil.MaxHP * 5) and (m_nDangerLevel > 0) then begin
           Dec(m_nDangerLevel);
           CallSlave2(m_TargetCret);
         end;
        end;
        if m_WAbil.HP = m_WAbil.MaxHP then
          m_nDangerLevel:=4;
      end;

  end;
  inherited;
end;


function  TGeneralCat.AttackTarget: Boolean;           //Áø¹¦Àå±º
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(3) <> 0) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
            if TargetInSpitRange (m_TargetCret, targdir) and (Random(3) <> 0)  then begin
                m_dwTargetFocusTick := GetTickCount;
                Attack2 (m_TargetCret, targdir);
                Result := TRUE;
            end else begin
              if ChainShot < ChainShotCount-1 then begin
                  Inc (ChainShot);
                  m_dwTargetFocusTick := GetTickCount;
                  RangeAttack (m_TargetCret);
               end else begin
                  if Random(2) = 0 then
                     ChainShot := 0;
               end;
               Result := TRUE;
            end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ObjMon.pas 594 2007-03-09 15:00:12Z damian $');
end.
