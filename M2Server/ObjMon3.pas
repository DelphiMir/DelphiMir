unit ObjMon3;

interface

uses
  {svn, }Windows,Classes,Grobal2, StrUtils,ObjBase,ObjMon, ObjMon2;

type

  TRonObject=class(TMonster)
  public
    constructor Create();
    destructor Destroy; override;
	  procedure AroundAttack;
	  procedure Run; override;
  end;

  TMinorNumaObject=class(TATMonster)
  public
    constructor Create();
    destructor Destroy; override;
	  procedure Run; override;
  end;

  TSandMobObject=class(TStickMonster)
  private
	  m_dwAppearStart:LongWord;

  public
	  constructor Create();
    destructor Destroy; override;
	  procedure Run; override;
  end;

  TRockManObject=class(TATMonster)
  public
	  constructor Create();
    destructor Destroy; override;
	  procedure Run; override;
  end;

  TGhostAdmiral = class (TATMonster)     //¾ÏÈæ»ç·É
   private
      fHide             : Boolean;
   public
      constructor   Create;
      procedure     Attack(TargeTBaseObject: TBaseObject; nDir: Integer); override;
      function      AttackTarget: Boolean; override;
      procedure     Run; override;
   end;


  TMagicMonObject = class(TMonster)
  private
    m_boUseMagic:Boolean;

    procedure LightingAttack(nDir:Integer);

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  TPercentMonster = class(TAnimalObject)
    n54C           :Integer;
    m_dwThinkTick  :LongWord;
    bo554          :Boolean;
    m_boDupMode    :Boolean;
  private
    function Think: Boolean;
//    function MakeClone(sMonName:String;OldMon:TBaseObject):TBaseObject;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;
    function AttackTarget():Boolean; virtual;
    procedure Run; override;
  end;

  TMagicMonster = class(TAnimalObject)
    n54C           :Integer;
    m_dwThinkTick  :LongWord;
    m_dwSpellTick  :LongWord;
    bo554          :Boolean;
    m_boDupMode    :Boolean;
  private
    function Think: Boolean;
//    function MakeClone(sMonName:String;OldMon:TBaseObject):TBaseObject;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;
    function AttackTarget():Boolean; virtual;
    procedure Run; override;
  end;

  TFireballMonster = class(TMagicMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TFireMonster = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

 TFrostTiger = class(TMonster)
    m_dwSpellTick:LongWord;
    m_dwLastWalkTick:LongWord;
  private
    procedure FrostAttack();
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TIceKingBoss  = class (TATMonster)  //¼³ÅÂ¶û
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
    m_SlaveObjectList  :TList;//0x55C
   private
    procedure CallDragon();
   public
    sectick: longword;
    sectick2: longword;
    constructor Create;
    destructor Destroy; override;
    procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
    procedure RangeAttack (TargeTBaseObject: TBaseObject);
    procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
    procedure RangeAttack3 (TargeTBaseObject: TBaseObject);
    procedure Run; override;
    function  AttackTarget: Boolean; override;
  end;

  TBear = class (TATMonster)      //°õ
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
  private
  public
     constructor Create;
     destructor Destroy; override;
     procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
     procedure RangeAttack (targ: TBaseObject);
     procedure Run; override;
     function  AttackTarget: Boolean; override;
  end;

  TWarriorM = class(TATMonster)       //Çö¿ù´ÜÀü»ç
    bo558:Boolean;
  private
  public
     constructor Create;
     destructor Destroy; override;
     procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
     procedure RangeAttack (TargeTBaseObject: TBaseObject);
     procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
     procedure Run; override;
     function  AttackTarget: Boolean; override;
  end;

  TWizardM  = class (TATMonster)      //Çö¿ù´Ü¼ú»ç
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
  private
    NextTarget:TBaseObject;
  public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (Targ: TBaseObject);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
  end;

  TTaoistM  = class (TATMonster)  //Çö¿ù´Üµµ»ç
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
    BoRecallComplete: Boolean;
    childlist: TList;
  private
    NextTarget:TBaseObject;
    procedure CallDragon();
  public
      constructor Create;
      destructor Destroy; override;
      procedure RangeAttack (Targ: TBaseObject);
      procedure RangeAttack2 (Targ: TBaseObject);
      procedure Run; override;
      procedure Die; override;
      function  AttackTarget: Boolean; override;
  end;

  TAssassinM = class(TATMonster)
     bo558:Boolean;
  private
  public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
  end;

  TWarriorM2 = class(TATMonster)   //Àü½ÂÀü»ç
     bo558:Boolean;
  private
  public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack3 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack4 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
  end;

  TWizardM2  = class (TATMonster)      //¼º¼ú»ç
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
   private
    NextTarget:TBaseObject;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (Targ: TBaseObject);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack3 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack4 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

  
  TTaoistM2  = class (TATMonster)  //Á¤¿¬µµ»ç
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
    BoRecallComplete: Boolean;
    childlist: TList;
  private
    NextTarget:TBaseObject;
    procedure CallDragon();
  public
      constructor Create;
      destructor Destroy; override;
      procedure RangeAttack (Targ: TBaseObject);
      procedure RangeAttack2 (Targ: TBaseObject);
      procedure RangeAttack3 (Targ: TBaseObject);
      procedure Run; override;
      procedure Die; override;
      function  AttackTarget: Boolean; override;
  end;

  TAssassinM2 = class(TATMonster)    //Çõ¹®°´
   bo558:Boolean;
   private
   public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack3 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TAchorMonster = class(TATMonster)     //À¯»ó±ÃÀå
   bo558:Boolean;
   private
   public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TJobking = class(TATMonster)
   bo558:Boolean;
   m_dwSpellTick  :LongWord;
   private
      procedure CallDragon();
   public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer);override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack3 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack4 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack5 (TargeTBaseObject: TBaseObject);
      procedure RangeAttack6 (TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;


 TGreenMonster = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TRedMonster = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TKhazard = class(TMonster)
    m_dwDragTick  :LongWord;
  private
    procedure Drag();
  public
  function AttackTarget():boolean;override;
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;


   //È£È¥±â¼®
   TFoxPillar = class (TATMonster)
   private
   protected
      RunDone: Boolean;
      function  AttackTarget: Boolean; override;
      function  FindTarget: Boolean;
   public
      constructor Create;
      procedure RangeAttack (targ: TBaseObject);
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
   end;

  TRunAway = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TTeleMonster = class(TMonster)
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;

  TDefendMonster = class(TMonster)
  private
   // m_GuardObjects  :TList;

    //procedure CallGuard(mapmap:string; xx,yy:integer);
  public
    callguardrun:boolean;
    constructor Create();
    destructor Destroy; override;
    procedure Run; override;
  end;


  TCloneMon = class (TATMonster)
   private
      bofirst: Boolean;
      NextMPSpendTime : LONGWORD;
      MPSpendTickTime : LONGWORD;
   protected
      procedure   ResetLevel;
      procedure   RangeAttackTo (targ: TBaseObject);
      function    AttackTarget: Boolean; override;
      procedure   BeforeRecalcAbility;
      procedure   AfterRecalcAbility;
   public
      constructor Create;
      destructor  Destroy; override;
      procedure   RecalcAbilitys; override;
      procedure   Run; override;
  end;

  TDarkClone = class(TMonster)
    bofirst: Boolean;
    ThinkTick : LongWord;
    private
      procedure   FindTarget();
      function    AttackTarget: Boolean; override;
      Procedure   RangeAttack (targ: TBaseObject);
      procedure   AfterRecalcAbility;
    public
      constructor Create();
      destructor  Destroy; override;
      procedure   RecalcAbilitys; override;
      procedure   Run; override;
  end;

  TBonzeClone = class(TMonster)
    bofirst: Boolean;
    ThinkTick : LongWord;
    private
      procedure   FindTarget();
      function    AttackTarget: Boolean; override;
      procedure   RangeAttackTo (targ: TBaseObject);
      Procedure   RangeAttack (targ: TBaseObject);
      procedure   AfterRecalcAbility;
    public
      constructor Create();
      destructor  Destroy; override;
      procedure   RecalcAbilitys; override;
      procedure   Run; override;
  end;

  THellMonster4 = class(TMonster)
  private
    MassAttackMode:Boolean;
    MassAttackCount:Byte;
    NextTarget:TBaseObject;
    nextx,nexty:Integer;
    boMoving:Boolean;
    procedure RedCircle(nDir:Integer);
  public
    constructor Create();
    function  Operate(ProcessMsg:pTProcessMessage):boolean; override;
    destructor Destroy; override;
    procedure Run;override;
  end;

  TGumiBoss = class (TATMonster)    //¿ùÁö°â½ÅÀå
   protected
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack(TargeTActorObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure RangeAttack3 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;



  TDragon = class (TATMonster)        //¸¶·æ
   private
      bofirst       : Boolean;
      ChildList     : TList;
   protected
      procedure RangeAttack (targ: TBaseObject);
      procedure ResetLevel;
      procedure AttackAll(targ: TBaseObject);
   public
      constructor   Create;
      destructor    Destroy; override;
      procedure     RecalcAbilitys; override;
      function      AttackTarget: Boolean; override;
      procedure     Struck (hiter: TBaseObject); override;
      procedure     Run; override;
   end;

   // ¿ë¸ö ---------------------------------------------------------------------
   TDragonBody = class (TATMonster)       //¸¶·æ
   private
      bofirst       : Boolean;
   protected
      procedure RangeAttack (targ: TBaseObject);
      procedure ResetLevel;

   public
      constructor   Create;
      procedure     RecalcAbilitys; override;
      function      AttackTarget: Boolean; override;
      procedure     Struck (hiter: TBaseObject); override;
      procedure     Run; override;
   end;

  TDragonStatue = class (TATMonster)     //¿ë¼®»ó
   private
      bofirst       : Boolean;
   protected
      procedure RangeAttack (targ: TBaseObject);
      procedure ResetLevel;
   public
      constructor   Create;
      destructor    Destroy; override;
      procedure     RecalcAbilitys; override;
      function      AttackTarget: Boolean; override;
      procedure     Run; override;
   end;


   TDragonPart = class(TAnimalObject)
    boisactive: Boolean;
    m_nHealth      :Integer;  //0x79C
  private
    procedure DropItems();
  public
    constructor Create();
    destructor Destroy; override;
    function  GetMagStruckDamage(BaseObject:TBaseObject;nDamage:Integer):Integer;override;
    procedure StruckDamage(var nDamage:integer);override;
    procedure Run;override; //0x00504B60
  end;


  // ¿ù·É ---------------------------------------------------------------------
   TAngelMon = class (TATMonster)
   private
      bofirst       : Boolean;
   protected
      procedure     ResetLevel;
      procedure     RangeAttackTo (targ: TBaseObject);
      function      AttackTarget: Boolean; override;
      procedure     BeforeRecalcAbility;
      procedure     AfterRecalcAbility;
   public
      constructor   Create;
      destructor    Destroy; override;
      procedure     RecalcAbilitys; override;
      procedure     Run; override;
   end;

   TAngelMon2= class (TATMonster)
   private
      bofirst       : Boolean;
   protected
      procedure     ResetLevel;
      procedure     RangeAttackTo (targ: TBaseObject);
      function      AttackTarget: Boolean; override;
      procedure     BeforeRecalcAbility;
      procedure     AfterRecalcAbility;
   public
      constructor   Create;
      destructor    Destroy; override;
      procedure     RecalcAbilitys; override;
      procedure     Run; override;
   end;

   TDarkAngelMon = class (TATMonster)   //È¥·É
   private
      bofirst       : Boolean;
   protected
      procedure     ResetLevel;
      procedure     RangeAttackTo (targ: TBaseObject);
      function      AttackTarget: Boolean; override;
      procedure     BeforeRecalcAbility;
      procedure     AfterRecalcAbility;
      function      FindTarget: Boolean; 
   public
      constructor   Create;
      destructor    Destroy; override;
      procedure     RecalcAbilitys; override;
      procedure     Run; override;
   end;


  TGoldenImugi = class (TATMonster)
   public
      DontAttack: Boolean;
      DontAttackCheck: Boolean;
      AttackState: Boolean;
      InitialState: Boolean;
      ChildMobRecalled: Boolean;
      FinalWarp: Boolean;
      FirstCheck: Boolean;
      TwinGenDelay: integer;
      sectick: longword;
      RevivalTime: longword;
      WarpTime: longword;
      TargetTime: longword;
      RangeAttackTime: longword;
      OldTargetCret: TBaseObject;
      constructor Create;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
      procedure Struck (hiter: TBaseObject); override;
      function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      procedure Run; override;
      procedure Die; override;
   end;

   //È¯»ç±ÍÀå
   TGoldGuard = class (TATMonster)
   private
      BoRecallComplete: Boolean;
      BoRecallComplete1: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TIceGuard = class (TATMonster)//ºù¿°±ÍÀå
   private
      BoRecallComplete: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

  //ºñ¿ù¿©¿ì(µµ»ç) ºñ¿ù¼ÒÈ£
   TFoxTaoist = class (TATMonster)
   private
      BoRecallComplete: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TBigSnakeWarm = class (TATMonster)  //´ë¸Á
   private
      BoRecallComplete: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;


   //°í´ëºñ¿ù¼ÒÈ£
   TLegendFoxTaoist = class (TATMonster)
   private
      BoRecallComplete: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TFaceMob = class (TATMonster) //ÀÎ¸é¼ö
   private
      BoRecallComplete: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TDarkWolf = class (TATMonster)        //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TGegunOmaMon = class (TATMonster)        //°Å±Ç¿À¸¶
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TDamukOmaMon = class (TATMonster)        //´Ù¸ñ¿À¸¶
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TJumaWarrior = class (TATMonster)        //ÁÖ¸¶°Ë»ç
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TWaterSlave = class (TATMonster)   //ÀÍ»çÇÑ³ë¿¹
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TGhostShipMon = class (TATMonster)      //¼±¹ÚÀÇ¾Ç·É
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack3 (TargeTBaseObject: TBaseObject; nDir: Integer); 
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TFramNoMon = class (TATMonster)      //³ó³ë±º
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TGhostFire = class (TATMonster)      //È¥ºÒ
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TTransMon = class (TATMonster)   //º¯ÀÌµÈ°¨½Ãº´
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   //ºñ¿ù¿©¿ì(Àü»ç) //ºñ¿ùÈæÈ£
   TFoxWarrior = class (TATMonster)
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   //ºñ¿ù¿©¿ì(Àü»ç) //°í´ëºñ¿ùÈæÈ£
   TLegendFoxWarrior = class (TATMonster)
   private
      CrazyKingMode: Boolean;
      CriticalMode: Boolean;
      CrazyTime: longword;
      oldhittime: integer;
      oldwalktime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   TFireCat = class (TATMonster)  //ºÒ±ªÀÌ
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   THammerCat = class (TATMonster)  //¾ó·è¸ÁÄ¡±ªÀÌ
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      function  AttackTarget: Boolean; override;
   end;

   TBlackHammerCat = class (TATMonster)  //°ËÀº¸ÁÄ¡±ªÀÌ
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   TArmorCat = class (TATMonster)  //°©±ªÀÌ
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;


   //°ßºù¼öÈ£Àå ¸¶¿°¼öÈ£Àå ¾ÏÈ¥¼öÈ£Àå ¿­Áø¼öÈ£Àå
   TDarkGuard = class (TATMonster)
   private
      oldHittime: integer;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack(TargeTBaseObject: TBaseObject);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;

   //¿°È­Àû±Í
   TConvene = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      function  AttackTarget: Boolean; override;
   end;

   //¹é»ó
   TAutumn = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;


   //°ÅµµÀû±Í
   TRobberMon = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   //µ¶ÀÎÀû±Í
   TDaggerMon = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   //Å«»Ô¼­¿ìÀÎ
   TBigRhino = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   //µ¹°ÅÀÎ
   TStonegolem = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   TEarthGolem = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;


   //ÆÐ°ËÀû±Í
   TSideArms = class (TATMonster)
   private
      CriticalMode: Boolean;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;


   //¾ß°ø¼öÈ£±Í
   TNightattack = class (TATMonster)
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   //¾ß¼ö¿Õ
   TWildKing = class (TATMonster)
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      function  AttackTarget: Boolean; override;
   end;

   //¸ê±Í
   TLeafhopper = class (TATMonster)  //¸ê±Í
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      function  AttackTarget: Boolean; override;
   end;

   //¼­¿ì
   TRhinoceros = class (TATMonster)  //¼­¿ì
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
      procedure Run; override;
      function  AttackTarget: Boolean; override;
   end;


   TNoseMonkey = class (TATMonster)  //±äÄÚ¿ø¼þÀÌ
   private
      WarpTime: longword;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
      function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      function  AttackTarget: Boolean; override;
   end;



   //ºñ¿ù¿©¿ì(¼ú»ç) ºñ¿ùÀûÈ£
   TFoxWizard = class (TATMonster)  //ºñ¿ùÀûÈ£
   private
      WarpTime: longword;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      function  AttackTarget: Boolean; override;
   end;

   //ºñ¿ù¿©¿ì(¼ú»ç) °í´ëºñ¿ùÀûÈ£
   TLegendFoxWizard = class (TATMonster)  //°í´ëºñ¿ùÀûÈ£
   private
      WarpTime: longword;
   public
      constructor Create;
      procedure Initialize; override;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure RangeAttack (targ: TBaseObject);
      procedure Run; override;
      function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      function  AttackTarget: Boolean; override;
   end;

   //È£±â¿¬, È£±â¿Á
   TPushedMon = class (TMonster)
   private
      DeathCount: integer;
   public
      AttackWide: integer;
      constructor Create;
      procedure Initialize; override;
      procedure Attack (target: TBaseObject; dir: byte); reintroduce;
      procedure Run; override;
      function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      procedure Struck (hiter: TBaseObject); override;
      function  AttackTarget: Boolean; override;
   end;

  //°ÅºÏ¿Õ
   TBossTurtle = class (TATMonster)     //Çö¹«Çö½Å
   protected
   public
      RecallStep: integer;
      constructor Create;
      function  AttackTarget: Boolean; override;
      function  FindTarget: Boolean;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
   end;

implementation

uses
  UsrEngn, M2Share, Envir, Event, HUtil32, Castle, Guild, SysUtils;




constructor TRonObject.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TRonObject.Destroy;
begin
  inherited;
end;

procedure TRonObject.AroundAttack;
var
  xTargetList:TList;
  BaseObject:TBaseObject;
  wHitMode:Word;
  i:Integer;
begin
  wHitMode:=1;
  GetAttackDir(m_TargetCret,m_btDirection);

  xTargetList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,1,xTargetList);

	if (xTargetList.Count>0) then begin
    for i:=xTargetList.Count-1 downto 0 do begin
      BaseObject := TBaseObject(xTargetList.Items[i]);

      if (BaseObject<>nil) then begin
        _Attack(wHitMode,BaseObject); //CM_HIT

        xTargetList.Delete(i);
		  end;
    end;
	end;
  FreeAndNil(xTargetList);
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TRonObject.Run;
begin
  if CanMove then begin
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;

    if (m_TargetCret <> nil) and
       (abs(m_nCurrX - m_TargetCret.m_nCurrX) < 6) and
       (abs(m_nCurrY - m_TargetCret.m_nCurrY) < 6) and
       (GetCurrentTime - m_dwHitTick > GetHitSpeed) then begin

      m_dwHitTick:=GetCurrentTime;
      AroundAttack;
    end;
	end;

	inherited;
end;

constructor TMinorNumaObject.Create;
begin
  inherited;
end;

destructor TMinorNumaObject.Destroy;
begin
  inherited;
end;

procedure TMinorNumaObject.Run;
begin
  if CanMove then begin
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;

	inherited;
end;

constructor TSandMobObject.Create;
begin
  inherited;
  nComeOutValue := 8;
end;

destructor TSandMobObject.Destroy;
begin
  inherited;
end;

procedure TSandMobObject.Run;
begin
  if CanMove then begin
		if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
			m_dwWalkTick := GetCurrentTime;

			if (m_boFixedHideMode) then begin
				if (((m_WAbil.HP > (m_WAbil.MaxHP / 20)) and CheckComeOut())) then
					m_dwAppearStart := GetTickCount;
			end else begin
				if ((m_WAbil.HP > 0) and (m_WAbil.HP < (m_WAbil.MaxHP / 20)) and (GetTickCount - m_dwAppearStart > 3000)) then
					ComeDown
				else if (m_TargetCret<>nil) then begin
					if (abs(m_nCurrX - m_TargetCret.m_nCurrX) > 15) and (abs(m_nCurrY - m_TargetCret.m_nCurrY) > 15) then begin
						ComeDown;
						exit;
					end;
				end;

				if GetCurrentTime - m_dwHitTick > GetHitSpeed then
				  SearchTarget();
				
				if (not m_boFixedHideMode) then begin
					if (AttackTarget) then
						inherited;
				end;
			end;
		end;
	end;

	inherited;
end;

constructor TRockManObject.Create;
begin
  inherited;
  //m_dwSearchTick := 2500 + Random(1500);
  //m_dwSearchTime := GetTickCount();

  m_boHideMode := TRUE;
end;

destructor TRockManObject.Destroy;
begin
  inherited;
end;

procedure TRockManObject.Run;
begin
  {if CanMove then begin
		if (m_fHideMode) then begin
			if (CheckComeOut(8)) then
				ComeOut;

			m_dwWalkTime := GetTickCount + 1000;
		end else begin
			if ((GetTickCount - m_dwSearchEnemyTime > 8000) or ((GetTickCount - m_dwSearchEnemyTime > 1000) and (m_pTargetObject=nil))) then begin
				m_dwSearchEnemyTime := GetTickCount;
				MonsterNormalAttack;

				if (m_pTargetObject=nil) then
					ComeDown;
			end;
		end;
	end;}

	inherited;
end;


//==============================================================================      //¾ÏÈæ»ç·É
constructor TGhostAdmiral.Create;
begin
   inherited Create;
   m_dwSearchTime := 1500 + longword(Random(1500));
   fHide            := True;
   m_nViewRange     := 11;
end;

procedure TGhostAdmiral.Attack(TargeTBaseObject: TBaseObject; nDir: Integer);  //°­Á¶±Í
var
   cret: TBaseObject;
   pwr: integer;
   ActorObject:TBaseObject;
   slowtime : integer;
begin
   self.m_btDirection := nDir;
   cret :=  TargeTBaseObject;
   with m_WAbil do
       pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   if pwr <= 0 then exit;
   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(cret), '');

   if pwr > 0 then begin
     cret.StruckDamage (pwr);


     slowtime := pwr div 5;
     if (slowtime > 0) then begin

       if m_btRaceServer = 157 then begin
         if ( random(18) > (cret.m_btAntiPoison + 9) ) then
           cret.MakePosion( POISON_DECHEALTH , slowtime , Random(10) + 5 );
       end;
       if m_btRaceServer = 158 then begin
         if ( random(18) > (cret.m_nAntiMagic + 9) ) then
           cret.MakePosion( POISON_SLOWDOWN , slowtime ,1 );
       end;
       if m_btRaceServer = 159 then begin
         if ( random(18) > (cret.m_btAntiPoison + 9) ) then
           cret.MakePosion( POISON_STONE , 5 ,1 );
       end;
     end;
     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                                cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '', 600);
   end;
end;

function TGhostAdmiral.AttackTarget: Boolean;              //¾ÏÈæ»ç·É
var
   targdir: byte;
begin
   Result := FALSE;
    // ±ÙÁ¢ÇØ ÀÏÀ»¶§¿¡´Â ±ÙÁ¢ Èû °ø°ÝÀ»
    // ¿ø°Å¸® ÀÏ¶§´Â ¿ø°Å¸® ¸¶¹ý°ø°ÝÀ» ÇÑ´Ù.

   if m_TargetCret <> nil then begin
     if GetAttackDir (m_TargetCret, targdir) then begin
       if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         m_dwTargetFocusTick := GetTickCount;
         Attack (m_TargetCret, targdir);
         if fHide then fHide := FALSE;
       end;
       Result := TRUE;
     end else begin
       if m_TargetCret.m_sMapName = self.m_sMapName then begin
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
           SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end;
       end else begin
         DelTargetCreat;  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
       end;
     end;
   end;
end;

procedure TGhostAdmiral.Run;             //¾ÏÈæ»ç·É
begin

    if fHide then begin
      m_wStatusTimeArr[STATE_ASSTRANSPARENT] := 60000;
    end else begin
      m_wStatusTimeArr[STATE_ASSTRANSPARENT] := 0;
    end;
    m_nCharStatus := GetCharStatus;
    StatusChanged;

    if m_TargetCret = nil then fHide := true;
    if ( m_BoGhost ) or ( m_bodeath   ) then fHide := false;

    inherited run;
end;


{ TMagicMonObject }

constructor TMagicMonObject.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
end;

destructor TMagicMonObject.Destroy;
begin

  inherited;
end;

procedure TMagicMonObject.LightingAttack(nDir: Integer);
begin

end;

procedure TMagicMonObject.Run;
var
  nAttackDir:Integer;
  nX,nY:Integer;
begin
  if (not bo554) and CanMove then begin

     //ÑªÁ¿µÍÓÚÒ»°ëÊ±¿ªÊ¼ÓÃÄ§·¨¹¥»÷
    if m_WAbil.HP < m_WAbil.MaxHP div 2 then m_boUseMagic:=True
    else m_boUseMagic:=False;

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
    if m_Master = nil then exit;

    nX:=abs(m_nCurrX - m_Master.m_nCurrX);
    nY:=abs(m_nCurrY - m_Master.m_nCurrY);

    if (nX <= 5) and (nY <= 5) then begin
      if m_boUseMagic or ((nX = 5) or (nY = 5)) then begin
        if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          m_dwHitTick:=GetCurrentTime;
          nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_Master.m_nCurrX,m_Master.m_nCurrY);
          LightingAttack(nAttackDir);
        end;
      end;
    end;
  end;
  inherited Run;
end;

constructor TPercentMonster.Create;
begin
  inherited;
  m_boDupMode:=False;
  bo554:=False;
  m_dwThinkTick:=GetTickCount();
  m_nViewRange:=5;
  m_nRunTime:=250;
  m_dwSearchTime:=3000 + Random(2000);
  m_dwSearchTick:=GetTickCount();
  m_btRaceServer:=80;
end;

destructor TPercentMonster.Destroy;
begin
  inherited;
end;

function TPercentMonster.Operate(ProcessMsg: pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);

end;
function TPercentMonster.Think():Boolean; //004A8E54
var
  nOldX,nOldY:integer;
begin
  Result:=False;
  if (GetTickCount - m_dwThinkTick) > 3 * 1000 then begin
    m_dwThinkTick:=GetTickCount();
    if m_PEnvir.GetXYObjCount(m_nCurrX,m_nCurrY) >= 2 then m_boDupMode:=True;
    if not IsProperTarget{FFFF4}(m_TargetCret) then m_TargetCret:=nil;
  end; //004A8ED2
  if m_boDupMode then begin
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    WalkTo(Random(8),False);
    if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
      m_boDupMode:=False;
      Result:=True;
    end;
  end;
end;

function TPercentMonster.AttackTarget():Boolean; //004A8F34
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

procedure TPercentMonster.Run; //004A9020
var
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin
    if Think then begin
      inherited;
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
              inherited;
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
        if m_Master <> nil then begin
          if m_TargetCret = nil then begin
            m_Master.GetBackPosition(nX,nY);
            if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY{nX}) > 1) then begin //004A922D
              m_nTargetX:=nX;
              m_nTargetY:=nY;
              if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
                if m_PEnvir.GetMovingObject(nX,nY,True) <> nil then begin
                  m_nTargetX:=m_nCurrX;
                  m_nTargetY:=m_nCurrY;
                end //004A92A5
              end;
            end; //004A92A5
          end; //004A92A5 if m_TargetCret = nil then begin
          if (not m_Master.m_boSlaveRelax) and
             ((m_PEnvir <> m_Master.m_PEnvir) or
             (abs(m_nCurrX-m_Master.m_nCurrX) > 20) or
             (abs(m_nCurrY-m_Master.m_nCurrY) > 20)) then begin
           //  sysmsg('recalling to my master',c_red,t_hint);
          SpaceMove(m_Master.m_PEnvir.sMapName, m_nTargetX, m_nTargetY, 1);
          end; // 004A937E
        end;// 004A937E if m_Master <> nil then begin
      end else begin //004A9344
        if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin
          m_boRunAwayMode:=False;
          m_dwRunAwayTime:=0;
        end;
      end; //004A937E
      if (m_Master <> nil) and m_Master.m_boSlaveRelax then begin
        inherited ;
        exit;
      end;  //004A93A6
      if m_nTargetX <> -1 then begin
         GotoTargetXY(); //004A93B5 0FFEF
      end else begin
        if m_TargetCret = nil then Wondering();// FFEE   //Jacky
      end; //004A93D8
    end;
  end; //004A93D8

  inherited;
end;




constructor TMagicMonster.Create; //004A8B74
begin
  inherited;
  m_boDupMode:=False;
  bo554:=False;
  m_dwThinkTick:=GetTickCount();
  m_nViewRange:=8;
  m_nRunTime:=250;
  m_dwSearchTime:=3000 + Random(2000);
  m_dwSearchTick:=GetTickCount();
  m_btRaceServer:=215;
end;

destructor TMagicMonster.Destroy; //004A8C24
begin
  inherited;
end;

function TMagicMonster.Operate(ProcessMsg: pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);

end;
function TMagicMonster.Think():Boolean; //004A8E54
var
  nOldX,nOldY:integer;
begin
  Result:=False;
  if (GetTickCount - m_dwThinkTick) > 3 * 1000 then begin
    m_dwThinkTick:=GetTickCount();
    if m_PEnvir.GetXYObjCount(m_nCurrX,m_nCurrY) >= 2 then m_boDupMode:=True;
    if not IsProperTarget{FFFF4}(m_TargetCret) then m_TargetCret:=nil;
  end; //004A8ED2
  if m_boDupMode then begin
    nOldX:=m_nCurrX;
    nOldY:=m_nCurrY;
    WalkTo(Random(8),False);
    if (nOldX <> m_nCurrX) or (nOldY <> m_nCurrY) then begin
      m_boDupMode:=False;
      Result:=True;
    end;
  end;
end;

function TMagicMonster.AttackTarget():Boolean; //004A8F34
var
  bt06:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
 if m_TargetCret = m_Master then begin //nicky
    m_TargetCret := nil;
 end else begin
    if GetAttackDir(m_TargetCret,bt06) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
  // Attack(m_TargetCret,bt06);  //FFED
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
end;
procedure TMagicMonster.Run; //004A9020
var
  nX,nY:Integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin
    if Think then begin
      inherited;
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
              inherited;
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
        if m_Master <> nil then begin
          if m_TargetCret = nil then begin
            m_Master.GetBackPosition(nX,nY);
            if (abs(m_nTargetX - nX) > 1) or (abs(m_nTargetY - nY{nX}) > 1) then begin //004A922D
              m_nTargetX:=nX;
              m_nTargetY:=nY;
              if (abs(m_nCurrX - nX) <= 2) and (abs(m_nCurrY - nY) <= 2) then begin
                if m_PEnvir.GetMovingObject(nX,nY,True) <> nil then begin
                  m_nTargetX:=m_nCurrX;
                  m_nTargetY:=m_nCurrY;
                end //004A92A5
              end;
            end; //004A92A5
          end; //004A92A5 if m_TargetCret = nil then begin
          if (not m_Master.m_boSlaveRelax) and
             ((m_PEnvir <> m_Master.m_PEnvir) or
             (abs(m_nCurrX-m_Master.m_nCurrX) > 20) or
             (abs(m_nCurrY-m_Master.m_nCurrY) > 20)) then begin
           //  sysmsg('recalling to my master',c_red,t_hint);
          SpaceMove(m_Master.m_PEnvir.sMapName, m_nTargetX, m_nTargetY, 1);
          end; // 004A937E
        end;// 004A937E if m_Master <> nil then begin
      end else begin //004A9344
        if (m_dwRunAwayTime > 0) and ((GetTickCount - m_dwRunAwayStart) > m_dwRunAwayTime) then begin
          m_boRunAwayMode:=False;
          m_dwRunAwayTime:=0;
        end;
      end; //004A937E
      if (m_Master <> nil) and m_Master.m_boSlaveRelax then begin
        inherited ;
        exit;
      end;  //004A93A6
      if m_nTargetX <> -1 then begin
         GotoTargetXY(); //004A93B5 0FFEF
      end else begin
        if m_TargetCret = nil then Wondering();// FFEE   //Jacky
      end; //004A93D8
    end;
  end; //004A93D8

  inherited;

end;
{ end }


{TFireballMonster}

constructor TFireballMonster.Create; //004A9690
begin
  inherited;
  m_dwSpellTick:=GetTickCount();
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TFireballMonster.Destroy;
begin
  inherited;
end;

procedure TFireballMonster.Run;//004A9720
var
baseobject:TBaseObject;
nPower:integer;
  //UserMagic: pTUserMagic;
begin
  if not bo554 and CanMove then begin
if m_targetcret <> nil then begin
if self.MagCanHitTarget(m_targetcret.m_nCurrX, m_targetcret.m_nCurrY, m_targetcret) then begin
if self.IsProperTarget (m_targetcret) then begin
  if (abs(m_nTargetX-m_nCurrX) <= 8) and (abs(m_nTargety-m_nCurry) <= 8) then begin
       nPower:=Random(SmallInt(HiWord(m_wabil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC);
if nPower > 0 then begin
    BaseObject:=GetPoseCreate();
if (BaseObject <> nil) and
       IsProperTarget(BaseObject) and
       (m_nAntiMagic >= 0) then begin
      nPower:=BaseObject.GetMagStruckDamage(Self,nPower);
if nPower > 0 then begin
        BaseObject.StruckDamage(nPower);
if Integer((GetTickCount - m_dwSpellTick)) > self.m_nNextHitTime  then begin
        m_dwSpellTick:=GetTickCount();
          self.SendRefMsg(RM_SPELL,48,m_targetcret.m_nCurrX,m_targetcret.m_nCurry,48,'');
          self.SendRefMsg(RM_MAGICFIRE,0,
                        MakeWord(2,48),
                        MakeLong(m_targetcret.m_nCurrX,m_targetcret.m_nCurry),
                        Integer(m_TargetCret),
                        '');

   self.SendDelayMsg (TBaseObject(RM_STRUCK), RM_DELAYMAGIC, nPower, MakeLong(m_targetcret.m_nCurrX, m_targetcret.m_nCurrY), 2, integer(m_targetcret), '', 600);
end;//if npower
end;//if wait
end;
end;
end;
end;
end;
                    BreakHolySeizeMode();
      end else
      m_targetcret := nil;
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;





constructor TFireMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TFireMonster.Destroy;
begin

  inherited;
end;

procedure TFireMonster.Run;//004A9720
var
FireBurnEvent:TFireBurnEvent;
nx,ny,ndamage,ntime:integer;
begin
  if not bo554 and CanMove then begin
// do sqaure around boss
 ntime:=20;
 ndamage:=10;
    nx:=m_ncurrx;
    ny:=m_ncurry;
 //bx:=bx+1;
// by:=by+1;

  if m_PEnvir.GetEvent(nX,nY-1) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX,nY-1,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //0492CFC   x //
    if m_PEnvir.GetEvent(nX,nY-2) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX,nY-2,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //0492CFC   x

  if m_PEnvir.GetEvent(nX-1,nY) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX-1,nY,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //0492D4D //
  if m_PEnvir.GetEvent(nX-2,nY) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX-2,nY,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //0492D4D

  if m_PEnvir.GetEvent(nX,nY) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX,nY,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //00492D9C


  if m_PEnvir.GetEvent(nX+1,nY) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX+1,nY,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //00492DED
    if m_PEnvir.GetEvent(nX+2,nY) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX+2,nY,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //00492DED

  if m_PEnvir.GetEvent(nX,nY+1) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX,nY+1,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //00492E3E
    if m_PEnvir.GetEvent(nX,nY+2) = nil then begin
    FireBurnEvent:=TFireBurnEvent.Create(self,nX,nY+2,ET_FIRE,nTime * 1000 ,nDamage);
    g_EventManager.AddEvent(FireBurnEvent);
  end; //00492E3E


 {do flames behind}
{if m_PEnvir.GetEvent(bx,by) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx,by,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(bx+1,by+1) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx+1,by+1,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx,fy) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx,fy,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx+1,fy+1) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx+1,fy+1,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;    }

{if m_PEnvir.GetEvent(bx-1,by) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx-1,by,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(bx-2,by) = nil then begin  //behind
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx-2,by,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(bx-2,by+1) = nil then begin  //down left
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx-2,by+1,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(bx-2,by+2) = nil then begin  //down left
    FireBurnEvent:=TFireBurnEvent.Create(Self,bx-2,by+2,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx,fy) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx,fy,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx-1,fy) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx-1,fy,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx+1,fy) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx+1,fy,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx+2,fy) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx+2,fy,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx+2,fy-1) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx+2,fy-1,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;
if m_PEnvir.GetEvent(fx+2,fy-2) = nil then begin  //front
    FireBurnEvent:=TFireBurnEvent.Create(Self,fx+2,fy-2,ET_FIRE,ntime * 1000 ,ndamage);
    g_EventManager.AddEvent(FireBurnEvent);
end;  }


    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;



{ TFrostTigerMonster }

constructor TFrostTiger.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_dwSpellTick:=GetTickCount();
  m_dwLastWalkTick:=GetTickCount();
  m_boApproach:=FALSE;
end;

destructor TFrostTiger.Destroy;
begin
  inherited;
end;

procedure TFrostTiger.Run;//004A9720
begin
  if (not bo554) and CanMove then begin

    if m_TargetCret = nil then begin  //if theres no target stay transparent

      if not m_boHideMode then begin
        if (gettickcount - m_dwLastWalkTick > 2000) then begin
          m_dwLastWalkTick := GetTickCount();
          MagicManager.MagMakePrivateTransparent(Self,180);
          SendRefMsg(RM_DIGDOWN, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
        end;
      end else
        m_dwLastWalkTick := GetTickCount();
    end else begin
    //there is a target so take of transparency
      if not m_TargetCret.m_boDeath then begin
        if m_boHideMode then begin
          m_wStatusTimeArr[STATE_TRANSPARENT{0x70}]:=1;
          SendRefMsg(RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
        end;
      end else
        m_TargetCret := nil;

      if (Integer(GetTickCount - m_dwLastWalkTick) > m_nWalkSpeed) then begin //check if we should walk closer or not and do it :p
        m_dwLastWalkTick:=GetTickCount();
        m_nTargetX:=m_TargetCret.m_nCurrX;
        m_nTargetY:=m_TargetCret.m_nCurry;
        GotoTargetXY();
      end;
    end;

    if ((GetTickCount - m_dwSpellTick) > 3000) and (m_TargetCret <> nil) then begin
      if (abs(m_TargetCret.m_nCurrX-m_nCurrX) >= 2) or (abs(m_TargetCret.m_nCurrY-m_nCurry) >= 2) then begin
        m_dwSpellTick:=GetTickCount();
        FrostAttack();
      end;
    end;

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      //SearchTarget();
    end;
  end;
  inherited;
end;

procedure TFrostTiger.FrostAttack();
var
Target:TBaseObject;
magpwr:Integer;
WAbil:pTAbility;
begin
  if m_TargetCret = nil then exit;
  Target:=m_TargetCret;
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(Target),'');

 if IsProperTarget (Target) then begin
  if Random(50) >= Target.m_nAntiMagic then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
      Target.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);
      if (Random(15) <= 3) and (Random(Target.m_btAntiPoison) = 0) then begin
        Target.MakePosion(POISON_FREEZE,10,0);
      end;

      if (Random(40) <= 3) and (Random(Target.m_btAntiPoison) = 0) then begin
        Target.MakePosion(POISON_SLOWDOWN,10,0);
      end;
    end;
  end;
end;


//¼³ÅÂ¶û
constructor TIceKingBoss.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
  BodyState := 0;
  sectick := GetTickCount;
  sectick2 := GetTickCount;
  m_SlaveObjectList:=TList.Create;
end;

destructor TIceKingBoss.Destroy;
begin
  FreeAndNil(m_SlaveObjectList);
  inherited;
end;

procedure TIceKingBoss.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //ÀÏ¹Ý°ø°Ý  DC
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

procedure TIceKingBoss.RangeAttack (TargeTBaseObject: TBaseObject);    //Æ÷È¿ÇÏ´Â °ø°Ý  MC
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
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,4,BaseObjectList);
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

procedure TIceKingBoss.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
begin
   if TargeTBaseObject = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   WAbil:=@m_WAbil;
   pwr := random ( HiWord(Wabil.DC) ) + LoWord(Wabil.DC) + random( HiWord(WAbil.MC)) ;
   pwr := pwr * (random(1) + 1);
   if pwr <= 0 then exit;

   BaseObjectList := TList.Create;
   GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,4,BaseObjectList);
   for I := 0 to BaseObjectList.Count - 1 do begin
     BaseObject:=TBaseObject(BaseObjectList.Items[i]);
     if IsProperTarget(BaseObject) then begin
       if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
         SetTargetCreat(BaseObject);
         BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,(pwr * 2),0,0,'',800);
        // if (Random(BaseObject.m_btAntiPoison) = 0) then
          //  BaseObject.MakePosion (POISON_STARSTUN, 10, random(50)+49);
       end;
     end;
   end;
   FreeAndNil(BaseObjectList);
end;

procedure TIceKingBoss.RangeAttack3 (TargeTBaseObject: TBaseObject); //¼ø°£ÀÌµ¿ ÈÄ ³»·ÁÄ¡´Â
var
  magpwr:Integer;
  WAbil:pTAbility;
  nx,ny: integer;
begin
  if TargeTBaseObject =  nil then exit;

  TargeTBaseObject.GetFrontPosition(nx, ny);
  SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_ICEKING1, '0');    //¼³ÅÂ¶û ÀÌµ¿ ÀÌÆÑÆ®
  SpaceMagMove(nx, ny, 2);
  SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_ICEKING2, '0');   //¼³ÅÂ¶û µµÂø ÀÌÆÑÆ®

  Self.m_btDirection:= GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg(RM_LIGHTING_3,Self.m_btDirection,m_nCurrX,m_nCurrY,Integer(TargeTBaseObject),'');
  if IsProperTarget (TargeTBaseObject) then begin
      WAbil:=@m_WAbil;
      magpwr := random ( HiWord(Wabil.DC) ) + LoWord(Wabil.DC) + random( LoWord(WAbil.MC)) ;
      magpwr := magpwr * (random(3)+1);
      TargeTBaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.4), 1, 0, '', 800);
    end;
  end;

function TIceKingBoss.AttackTarget: Boolean;
var
nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
       if Random(5) = 0 then begin
         RangeAttack2(m_TargetCret);
       end else if Random(10) = 0 then begin
         RangeAttack(m_TargetCret);
       end else begin
         Attack(m_TargetCret,ndir);
       end;
      end else if (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 3) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 3) then begin
        if Random(10) = 0 then
        RangeAttack3(m_TargetCret); //¼ø°£ÀÌµ¿ ÈÄ °ø°Ý
      end;
    end;
    Result:=True;
    exit;
  end;
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
      SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
    end;
  end else begin
      DelTargetCreat();
  end;
end;

procedure TIceKingBoss.CallDragon;
var
  I: Integer;
  nCount:Integer;
  nX,nY:Integer;
  BaseObject:TBaseObject;
begin
  nCount:= 10 + (Random(3) * BodyState);
  GetFrontPosition(nX,nY);

  for I := 1 to nCount do begin
    if m_SlaveObjectList.Count >= 30 then break;
    BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,nX,nY,'¼³¶û');
    if BaseObject <> nil then begin
      m_SlaveObjectList.Add(BaseObject);
    end;
  end;
end;

procedure TIceKingBoss.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    
    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
{walking part}
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if GetTickCount - sectick > 3000 then begin
        sectick := GetTickCount;
        if (not m_boDeath) and (not m_BoGhost) then begin
          if (m_WAbil.HP >= m_WAbil.MaxHP * 4 div 5) then begin
            if BodyState <> 1 then begin
               BodyState := 1;
               CallDragon();
            end;
          end else if (m_WAbil.HP >= m_WAbil.MaxHP * 3 div 5) then begin
            if BodyState <> 2 then begin
               BodyState := 2;
               CallDragon();
            end;
          end else begin
            if BodyState <> 3 then begin
               BodyState := 3;
               CallDragon();
            end;
          end;
        end;
      end;

      AttackTarget;
    end;

    for I := m_SlaveObjectList.Count - 1 downto 0 do begin
      BaseObject:=TBaseObject(m_SlaveObjectList.Items[I]);
      if BaseObject.m_boDeath or BaseObject.m_boGhost then
        m_SlaveObjectList.Delete(I);
    end;
  end;
  // ±âÁ¸ ½ÇÇàÀ» ÇÑ´Ù.
  inherited Run;
end;

{°õ}
constructor TBear.Create;
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
end;

destructor TBear.Destroy;
begin
  inherited;
end;

procedure TBear.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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

procedure TBear.RangeAttack (targ: TBaseObject);
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir: integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
    if Random(2 + m_TargetCret.m_btAntiPoison) = 0 then begin
      m_TargetCret.MakePosion( POISON_HEMORRHAGE, 5 + Random(10), Round(magpwr * 0.6));
      m_TargetCret.SendDelayRefMsg(RM_10205,0,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,NE_BEAR_LIGHITING,'0',600);    //°õ, Ç¥¹ü Ç÷Ç³°Ý
    end;
  end;
end;

function TBear.AttackTarget: Boolean;
var
  nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
      if Random(5) = 0 then begin
        RangeAttack(m_TargetCret);
      end else begin
        Attack(m_TargetCret,ndir);
      end;
      Result:=True;
      exit;
    end;
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end;
    end else begin
      DelTargetCreat();
    end;
  end;
end;

procedure TBear.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);         //±ÙÁ¢ÀÏ°æ¿ì
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
    end;
  end;
  inherited;
end;

//Çö¿ù´ÜÀü»ç
constructor TWarriorM.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2500 + longword(Random(1500));
  m_nViewRange := 5;
end;

destructor TWarriorM.Destroy;
begin
  inherited;
end;

procedure TWarriorM.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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

procedure TWarriorM.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir:integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_2,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 500);
    if Random(2 + m_TargetCret.m_btAntiPoison) = 0 then
    m_TargetCret.MakePosion(POISON_STUN, 6, 1);
  end;
end;

procedure TWarriorM.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
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
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
  end;
end;

procedure TWarriorM.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(3) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else begin
          if Random(5) = 0 then begin
            SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 8, '0');
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

function TWarriorM.AttackTarget: Boolean;
var
  targdir: byte;
  ndir   : integer;
begin
  Result := FALSE;
  if m_TargetCret <> nil then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
        if Random(3) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else begin
          if Random(5) = 0 then begin
            SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 8, '0');
            RangeAttack(m_TargetCret);
          end else begin
            Attack(m_TargetCret,ndir);
          end;
        end;
      end;
    end else begin
      if m_TargetCret.m_sMapName = self.m_sMapName then begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
          SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
        end;
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

{Çö¿ù´Ü¼ú»ç}
constructor TWizardM.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
end;

destructor TWizardM.Destroy;
begin
  inherited;
end;

procedure TWizardM.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  Target:TBaseObject;
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret <> nil then Target:=m_TargetCret;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, Target.m_nCurrX, Target.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_FLYAXE,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');

  if IsProperTarget (Target) then begin
    if ( random(18) > (Target.m_nAntiMagic) ) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
      Target.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 800);
    end;
  end;
end;

procedure TWizardM.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
  i, pwr, dam: integer;
  sx, sy, tx, ty : integer;
  BaseObject: TBaseObject;
  WAbil:pTAbility;
  nDir: byte;
begin
  if targ = nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');
  for i:=0 to targ.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);
    if (abs(targ.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(targ.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
      if BaseObject <> nil then begin
        if IsProperTarget (BaseObject) then begin
          if ( random(18) > (BaseObject.m_nAntiMagic) ) then begin
            WAbil:=@m_WAbil;
            pwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
            BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 800);
          end;
        end;
      end;
    end;
  end;
end;

procedure TWizardM.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  i, k,  mx, my, dam, armor: integer;
  BaseObjectList   :TList;
  BaseObject: TBaseObject;
  pwr: integer;
  WAbil:pTAbility;
  push:integer;
  nDir:integer;
begin
  if TargeTBaseObject = nil then exit;
  m_dwHitTick:=GetCurrentTime;
  nDir := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING_2, nDir, m_nCurrX, m_nCurrY, Integer(self), '');
  WAbil:=@m_WAbil;
  pwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,1,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(2) = 0 then begin
        SetTargetCreat(BaseObject);
        push := 3 + Random(2);
        nDir:= GetNextDirection (m_nCurrX, m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
        BaseObject.CharPushed (nDir, push);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TWizardM.AttackTarget: Boolean;
var
  nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
        if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end else if (abs(m_nCurrX - m_TargetCret.m_nCurrX) > 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) > 1) then begin
        if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
      Result:=True;
      exit;
    end;
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end;
    end else begin
      DelTargetCreat();
    end;
  end;
end;

procedure TWizardM.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin
    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    
    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist > 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
    end;
  end;
  inherited;
end;

{Çö¿ù´Üµµ»ç}
constructor TTaoistM.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
  BoRecallComplete := FALSE;
  childlist := TList.Create;
end;

destructor TTaoistM.Destroy;
begin
  FreeAndNil(childlist);
  inherited;
end;

procedure TTaoistM.RangeAttack (targ: TBaseObject);  //ÀúÁÖ¼ú
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   sec := 60;
   pwr := 70;
   skilllevel := 3;
   MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
end;

procedure TTaoistM.RangeAttack2 (targ: TBaseObject); //Æø»ì°è
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

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

procedure TTaoistM.CallDragon;
const
   MAX_FOLLOWERS = 2;
var
   i, nx, ny, dx, dy: integer;
   monname: string;
   mon: TBaseObject;
   followers: array[0..MAX_FOLLOWERS-1] of string;
begin
   if m_TargetCret <> nil then begin
      m_btDirection:=GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      m_dwHitTick:=GetCurrentTime;
      SendRefMsg (RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');

      nx := m_TargetCret.m_nCurrX;
      ny := m_TargetCret.m_nCurrY;

      //Á¨½ÃÅ³ ¸ó½ºÅÍÀÌ¸§
      followers[0] := 'ÉñÄ§ÊÞ';
      followers[1] := 'ÏÒÔÂÁé';

      for i:= 0 to 1 do begin
            //´ë°¢¼±
        dx := Random(1);
        dy := Random(1);
        monname := followers[i];
        if m_PEnvir.CanWalk( nx + dx, ny + dy, True ) then begin
          mon := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, nx + dx, ny + dy, monname);
          if mon <> nil then begin
            mon.SetTargetCreat(m_TargetCret);
            childlist.Add (mon);
          end;
        end;
      end;
   end;
end;

function TTaoistM.AttackTarget: Boolean;
var
  nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end else if (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 1) then begin
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end;
      Result:=True;
      exit;
    end;
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end;
    end else begin
      DelTargetCreat();
    end;
  end;
end;

procedure TTaoistM.Die;
var
   i: integer;
begin
   inherited Die;
   if BoRecallComplete then begin
      for i:=childlist.Count-1 downto 0 do begin
         if not TBaseObject(childlist[i]).m_boDeath then begin
            TBaseObject(childlist[i]).m_LastHiter := nil;
            TBaseObject(childlist[i]).m_ExpHitter := nil;
            TBaseObject(childlist[i]).m_boNoItem := TRUE;
            TBaseObject(childlist[i]).Die;
         end;
      end;
   end;
end;

procedure TTaoistM.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    
    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if not BoRecallComplete then begin
        if m_WAbil.HP < (m_WAbil.MaxHP - m_WAbil.MaxHP div 3) then begin
          if Random(10) = 0 then begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
              if (Integer(GetTickCount - m_dwSpellTick) > 2200) then begin
                m_dwSpellTick:=GetTickCount();
                CallDragon();
                BoRecallComplete := TRUE;
              end;
            end;
          end;
        end;
      end;

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end;
    end;
  end;
  inherited;
end;


//Çö¿ù´ÜÀÚ°´
constructor TAssassinM.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2000 + longword(Random(1500));
  m_nViewRange := 5;
end;

destructor TAssassinM.Destroy;
begin
  inherited;
end;

procedure TAssassinM.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 500);
  end;
end;

procedure TAssassinM.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  nDir:integer;
  WAbil:pTAbility;
  Target:TBaseObject;
  nSX,nSY,nTX,nTY,nPwr:Integer;
begin
  Target := m_TargetCret;
  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPassThroughMagic2(nSX,nSY,nTX,nTY,nDir,nPwr,True);
  end;
  SendRefMsg(RM_LIGHTING_2,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');
end;

procedure TAssassinM.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin
    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
          SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(3) = 0 then begin
          RangeAttack2(m_TargetCret);
        end;
      end;
    end;
  end;
  inherited;
end;

function TAssassinM.AttackTarget: Boolean;
var
   targdir: byte;
   ndir   : integer;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack2(m_TargetCret);
            Result := TRUE;
          end else begin
            Attack(m_TargetCret,ndir);
            SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
            Result := TRUE;
          end;
        end else if (abs(m_nCurrX-m_TargetCret.m_nCurrX) >= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) >= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack2(m_TargetCret);
            Result := TRUE;
          end;
        end;
      end else begin
        if m_TargetCret.m_sMapName = self.m_sMapName then begin
          if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
          end;
        end else begin
          DelTargetCreat();
        end;
      end;
   end;
end;

//Àü½ÂÀü»ç
constructor TWarriorM2.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2000 + longword(Random(1500));
  m_nViewRange := 7;
end;

destructor TWarriorM2.Destroy;
begin
  inherited;
end;

procedure TWarriorM2.Attack (TargeTBaseObject: TBaseObject; nDir: Integer); //±âº»°ø°Ý
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

procedure TWarriorM2.RangeAttack (TargeTBaseObject: TBaseObject); //½Ö·æÂü
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir:integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_2,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    WAbil:=@m_WAbil;
    magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 500);
    if Random(2 + m_TargetCret.m_btAntiPoison) = 0 then
      m_TargetCret.MakePosion(POISON_STUN, 6, 1);
  end;
end;

procedure TWarriorM2.RangeAttack2 (TargeTBaseObject: TBaseObject); //±¤Ç³Âü
var
  i: integer;
  BaseObjectList   :TList;
  BaseObject: TBaseObject;
  pwr: integer;
  WAbil:pTAbility;
  nDir: integer;
begin
  if TargeTBaseObject = nil then exit;

  nDir := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING_3, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
  WAbil:=@m_WAbil;
  pwr:=GetAttackPower(LoWord(WAbil.DC),SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,1,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr * 2,0,0,'',800);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

procedure TWarriorM2.RangeAttack3 (TargeTBaseObject: TBaseObject); //±¤Ç³Âü
var
  I:Integer;
  magpwr:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
  nDir:integer;
begin
  Target := m_TargetCret;
  nDir := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  SendRefMsg (RM_LIGHTING_4, nDir, m_nCurrX, m_nCurrY, Integer(Target), '');

  for i:=0 to Target.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(Target.m_VisibleActors[i]).BaseObject);
    if BaseObject.m_sMapName = self.m_sMapName then begin
      if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
        if BaseObject <> nil then begin
          if IsProperTarget (BaseObject) then begin
            if (Random(18) > (BaseObject.m_nAntiMagic * 2)) then begin
              WAbil:=@m_WAbil;
              magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
              BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.5), 0, 0, '', 800);
            end;
          end;
        end;
      end;
    end;
  end
end;

procedure TWarriorM2.RangeAttack4 (TargeTBaseObject: TBaseObject); //¿¹µµ
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
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
  end;
end;

procedure TWarriorM2.Run;
var
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin
    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(3) = 0 then begin
          RangeAttack4(m_TargetCret);
        end else if Random(7) = 0 then begin
          RangeAttack3(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(3) = 0 then begin
          SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 8, '0');
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
    end;
  end;
  inherited;
end;

function TWarriorM2.AttackTarget: Boolean;
var
  ndir   : integer;
begin
  Result := FALSE;
  if m_TargetCret <> nil then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
        if Random(3) = 0 then begin
          RangeAttack4(m_TargetCret);
        end else if Random(7) = 0 then begin
          RangeAttack3(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(3) = 0 then begin
          SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 8, '0');
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
          Result := TRUE;
        end;
      end;
    end else begin
      if m_TargetCret.m_sMapName = self.m_sMapName then begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
          SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
        end;
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;


{¼º¼ú»ç}
constructor TWizardM2.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
end;

destructor TWizardM2.Destroy;
begin
  inherited;
end;


procedure TWizardM2.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  Target:TBaseObject;
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret <> nil then Target:=m_TargetCret;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, Target.m_nCurrX, Target.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_FLYAXE,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');

  if IsProperTarget (Target) then begin
    if ( random(18) > (Target.m_nAntiMagic) ) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
      Target.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 800);
    end;
  end;
end;

procedure TWizardM2.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   BaseObject: TBaseObject;
   WAbil:pTAbility;
   nDir: byte;
begin
   if targ = nil then exit;

   nDir:= GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   m_btDirection:=nDir;
   SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');
   for i:=0 to targ.m_VisibleActors.Count-1 do begin
     BaseObject:= TBaseObject (pTVisibleBaseObject(targ.m_VisibleActors[i]).BaseObject);
     if (abs(targ.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(targ.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
       if BaseObject <> nil then begin
         if IsProperTarget (BaseObject) then begin
           if ( random(18) > (BaseObject.m_nAntiMagic) ) then begin
             WAbil:=@m_WAbil;
             pwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
             BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 800);
           end;
         end;
       end;
     end;
   end;
end;

procedure TWizardM2.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
   push:integer;
   nDir:integer;
begin

  if TargeTBaseObject = nil then exit;
  m_dwHitTick:=GetCurrentTime;
  nDir := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_LIGHTING_2, nDir, m_nCurrX, m_nCurrY, Integer(self), '');
  WAbil:=@m_WAbil;
  pwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
  if pwr <= 0 then exit;

  BaseObjectList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,1,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(2) = 0 then begin
        SetTargetCreat(BaseObject);
        push := 3 + Random(2);
        nDir:= GetNextDirection (m_nCurrX, m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
        BaseObject.CharPushed (nDir, push);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

procedure TWizardM2.RangeAttack3 (TargeTBaseObject: TBaseObject);
var
  Target:TBaseObject;
  magpwr:Integer;
  WAbil:pTAbility;
  nDir: integer;
begin
  if m_TargetCret <> nil then Target:=m_TargetCret;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, Target.m_nCurrX, Target.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_3,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');

  if IsProperTarget (Target) then begin
    if ( random(18) > (Target.m_nAntiMagic) ) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
      Target.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 800);
      if WAbil.HP + magpwr > WAbil.MaxHP then begin
        WAbil.HP := WAbil.MaxHP;
      end else
        WAbil.HP := WAbil.HP + magpwr;
      SendDelayRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,13{type},'',1000);
    end;
  end;
end;

procedure TWizardM2.RangeAttack4 (TargeTBaseObject: TBaseObject);
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
  SendRefMsg (RM_LIGHTING_4, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,Round(pwr * 1.5),0,0,'',800);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TWizardM2.AttackTarget: Boolean;
var
  nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
        if Random(7) = 0 then begin
          RangeAttack4(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else if Random(4) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(3) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end else if (abs(m_nCurrX - m_TargetCret.m_nCurrX) > 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) > 1) then begin
        if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else if Random(3) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
      Result:=True;
      exit;
    end;
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end;
    end else begin
      DelTargetCreat();
    end;
  end;
end;

procedure TWizardM2.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    
    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
         m_dwHitTick:=GetCurrentTime;
        if Random(7) = 0 then begin
        RangeAttack4(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else if Random(4) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(3) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist > 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else if Random(3) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
    end;
  end;
  inherited;
end;



{Á¤¿¬µµ»ç}
constructor TTaoistM2.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 600;
  m_nViewRange := 7;
  BoRecallComplete := FALSE;
  childlist := TList.Create;
end;

destructor TTaoistM2.Destroy;
begin
  FreeAndNil(childlist);
  inherited;
end;

procedure TTaoistM2.RangeAttack (targ: TBaseObject);  //ÀúÁÖ¼ú
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   sec := 60;
   pwr := 70;
   skilllevel := 3;
   MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
end;

procedure TTaoistM2.RangeAttack2 (targ: TBaseObject); //Æø»ì°è
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

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

procedure TTaoistM2.RangeAttack3 (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
  Target:TBaseObject;
  pwr:integer;
begin
  if m_TargetCret <> nil then Target:=m_TargetCret;
  m_btDirection:=GetNextDirection (m_nCurrX, m_nCurrY, Target.m_nCurrX, Target.m_nCurrY);
  SendRefMsg(RM_LIGHTING_4,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');
  with m_WAbil do
    pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
  IncHealthSpell ( pwr, 0);
end;

procedure TTaoistM2.CallDragon;
const
   MAX_FOLLOWERS = 2;
var
   i, nx, ny, dx, dy: integer;
   monname: string;
   mon: TBaseObject;
   followers: array[0..MAX_FOLLOWERS-1] of string;
begin
   if m_TargetCret <> nil then begin
      m_btDirection:=GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      m_dwHitTick:=GetCurrentTime;
      SendRefMsg (RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');

      nx := m_TargetCret.m_nCurrX;
      ny := m_TargetCret.m_nCurrY;

      //Á¨½ÃÅ³ ¸ó½ºÅÍÀÌ¸§
      followers[0] := 'ÉñÄ§ÊÞ';
      followers[1] := 'ÏÒÔÂÁé';

      for i:= 0 to 1 do begin
            //´ë°¢¼±
        dx := Random(1);
        dy := Random(1);
        monname := followers[i];
        if m_PEnvir.CanWalk( nx + dx, ny + dy, True ) then begin
          mon := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, nx + dx, ny + dy, monname);
          if mon <> nil then begin
            mon.SetTargetCreat(m_TargetCret);
            childlist.Add (mon);
          end;
        end;
      end;
   end;
end;

function TTaoistM2.AttackTarget: Boolean;
var
  nDir:integer;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 7) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 1) then begin
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end else if (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 1) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) >= 1) then begin
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end;
      Result:=True;
      exit;
    end;
    if m_TargetCret.m_PEnvir = m_PEnvir then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 11) then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end;
    end else begin
      DelTargetCreat();
    end;
  end;
end;

procedure TTaoistM2.Die;
var
   i: integer;
begin
   inherited Die;
   if BoRecallComplete then begin
      for i:=childlist.Count-1 downto 0 do begin
         if not TBaseObject(childlist[i]).m_boDeath then begin
            TBaseObject(childlist[i]).m_LastHiter := nil;
            TBaseObject(childlist[i]).m_ExpHitter := nil;
            TBaseObject(childlist[i]).m_boNoItem := TRUE;
            TBaseObject(childlist[i]).Die;
         end;
      end;
   end;
end;

procedure TTaoistM2.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if (not bo558) and CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    
    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if not BoRecallComplete then begin
        if m_WAbil.HP < (m_WAbil.MaxHP - m_WAbil.MaxHP div 3) then begin
          if Random(10) = 0 then begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
              if (Integer(GetTickCount - m_dwSpellTick) > 2200) then begin
                m_dwSpellTick:=GetTickCount();
                CallDragon();
                BoRecallComplete := TRUE;
              end;
            end;
          end;
        end;
      end;

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(7) = 0 then begin
          RangeAttack(m_TargetCret);
        end else if (Random(5) = 0) and (m_WAbil.HP < (m_WAbil.MaxHP - (m_WAbil.MaxHP div 3))) then begin
          RangeAttack3(m_TargetCret);
        end else begin
          RangeAttack2(m_TargetCret);
        end;
      end;
    end;
  end;
  inherited;
end;

//Çõ¹®°´
constructor TAssassinM2.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2000 + longword(Random(1500));
  m_nViewRange := 5;
end;

destructor TAssassinM2.Destroy;
begin
  inherited;
end;

procedure TAssassinM2.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 200);
    m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 500);
  end;
end;


procedure TAssassinM2.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  nDir:integer;
  WAbil:pTAbility;
  Target:TBaseObject;
  nSX,nSY,nTX,nTY,nPwr:Integer;
begin
  Target := m_TargetCret;
  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    MagPassThroughMagic2(nSX,nSY,nTX,nTY,nDir,nPwr,True);
  end;
  SendRefMsg(RM_LIGHTING_2,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');
end;

procedure TAssassinM2.RangeAttack3 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  I:Integer;
  magpwr:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
  nDir:integer;
begin
  Target := m_TargetCret;
  nDir := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  SendRefMsg (RM_LIGHTING_3, nDir, m_nCurrX, m_nCurrY, Integer(Target), '');

  for i:=0 to Target.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(Target.m_VisibleActors[i]).BaseObject);
    if BaseObject.m_sMapName = self.m_sMapName then begin
      if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 2) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 2) then begin
        if BaseObject <> nil then begin
          if IsProperTarget (BaseObject) then begin
            if ( random(18) > (BaseObject.m_nAntiMagic*2)) then begin
              WAbil:=@m_WAbil;
              magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
              BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.5), 0, 0, '', 800);
            end;
          end;
        end;
      end;
    end;
  end
end;

procedure TAssassinM2.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin
    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack3(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
          SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(3) = 0 then begin
          RangeAttack2(m_TargetCret);
        end;
      end;
    end;
  end;
  inherited;
end;

function TAssassinM2.AttackTarget: Boolean;
var
   targdir: byte;
   ndir   : integer;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
     if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack3(m_TargetCret);
            Result := TRUE;
          end else if Random(5) = 0 then begin
            RangeAttack2(m_TargetCret);
            Result := TRUE;
          end else begin
            Attack(m_TargetCret,ndir);
            SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
            Result := TRUE;
          end;
        end else if (abs(m_nCurrX-m_TargetCret.m_nCurrX) >= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) >= 1) then begin
          if Random(5) = 0 then begin
            RangeAttack2(m_TargetCret);
            Result := TRUE;
          end;
        end;
     end else begin
       if m_TargetCret.m_sMapName = self.m_sMapName then begin
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
           SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end;
       end else begin
         DelTargetCreat();
       end;
     end;
   end;
end;


{À¯»ó±ÃÀå}

constructor TAchorMonster.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2500 + longword(Random(1500));
  m_nViewRange := 5;
end;


destructor TAchorMonster.Destroy;
begin
  inherited;
end;

procedure TAchorMonster.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_FLYAXE,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
  if ( random(25) > (m_TargetCret.m_nAntiMagic)) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
    end;
  end;
end;

procedure TAchorMonster.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
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
  if ( random(25) > (m_TargetCret.m_nAntiMagic)) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.5), 1, 0, '', 800);
      if Random(2 + m_TargetCret.m_btAntiPoison) = 0 then
      m_TargetCret.MakePosion( POISON_DECHEALTH,30,random(30)+10);
    end;
  end;
end;

procedure TAchorMonster.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  push:integer;
  nDir:integer;
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_2,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    if ( random(25) > (m_TargetCret.m_nAntiMagic)) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.2), 1, 0, '', 800);
      end;
    if Random(5) = 0 then begin
      push := 1 + Random(3);
      m_TargetCret.CharPushed (nDir, push);
    end;
  end;
end;


procedure TAchorMonster.Run;
var
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  n8,nC,n10:Integer;
  ndir   : integer;
  dist: integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) and (m_TargetCret <> nil) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 4) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 4) then begin
        if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 2) then begin
          if Random(5) = 0 then begin
            GetBackPosition(m_nTargetX,m_nTargetY);
          end;
        end else begin
          GetBackPosition(m_nTargetX,m_nTargetY);
        end;
      end;
    end;
    if m_TargetCret <> nil then begin
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          CharPushed(GetBackDir(m_btDirection),3);
        end;
      end;
    end;
  end;
  inherited;
end;

function TAchorMonster.AttackTarget: Boolean;
var
  targdir: byte;
  ndir   : integer;
begin
  Result := FALSE;
  if m_TargetCret <> nil then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
       m_dwHitTick:=GetCurrentTime;
       if (abs(m_nCurrX-m_TargetCret.m_nCurrX) >= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) >= 1) then begin
         if Random(5) = 0 then begin
           RangeAttack2(m_TargetCret);
         end else if Random(5) = 0 then begin
           RangeAttack(m_TargetCret);
         end else begin
           Attack(m_TargetCret,ndir);
           Result := TRUE;
         end;
       end;
    end else if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
       if Random(5) = 0 then begin
         CharPushed(GetBackDir(m_btDirection),3);
         Result := TRUE;
       end;
    end else begin
      if m_TargetCret.m_sMapName = self.m_sMapName then begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
          SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
        end;
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

//¾ç¿ë¿Õ
constructor TJobking.Create;//004AA4B4
begin
  inherited Create;
  m_dwSearchTime := 2500 + longword(Random(1500));
  m_nViewRange := 5;
end;

destructor TJobking.Destroy;
begin

  inherited;
end;

procedure TJobking.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
begin
  if TargeTBaseObject = nil then exit;
  nDir := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
  SendRefMsg (RM_HIT, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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


procedure TJobking.RangeAttack (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
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
  SendRefMsg (RM_LIGHTING, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,Round(pwr * 1.5),0,0,'',800);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


procedure TJobking.RangeAttack2 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
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
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,7,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if IsProperTarget(BaseObject) then begin
      if Random(BaseObject.m_btSpeedPoint) < m_btHitPoint then begin
        SetTargetCreat(BaseObject);
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,pwr,0,0,'',1200);
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

procedure TJobking.RangeAttack3 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
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
  SendRefMsg (RM_LIGHTING_3, nDir, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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
        BaseObject.SendDelayMsg(self,RM_MAGSTRUCK,0,Round(pwr * 1.2),0,0,'',1000);
        if Random(5) = 0 then begin
          UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'Èí ÀÎ ´ë ¹ý!!!');
          if WAbil.HP + (pwr * 2) > WAbil.MaxHP then begin
            WAbil.HP := WAbil.MaxHP;
          end else
            WAbil.HP := WAbil.HP + (pwr * 2);
          m_TargetCret.SendDelayRefMsg(RM_10205,0,self.m_nCurrX,self.m_nCurrY,149,'0',1200);
        end;
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


procedure TJobking.RangeAttack4 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  WAbil:pTAbility;
  Target:TBaseObject;
  nDir:integer;
  nSX,nSY,nTX,nTY,nPwr:Integer;
begin
  Target := m_TargetCret;
  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_4,1,m_nCurrX,m_nCurrY,Integer(Target),'');
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
    MagPassIlsum(nSX,nSY,nTX,nTY,nDir,nPwr,True);
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,2,nTX,nTY);
    if m_PEnvir.CanWalk(nTX, nTY, True) and (m_PEnvir.GetXYObjCount(nTX, nTY) = 0) then begin
     // SendRefMsg(RM_SPACEMOVE_FIRE3, 0, 0, 0, 0, '');
      SpaceMagMove(nTX, nTY, 0);
    end;
  end;
end;

procedure TJobking.RangeAttack5 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  push:integer;
  nDir:integer;
  magpwr:Integer;
  WAbil:pTAbility;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_6,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    if ( random(25) > (m_TargetCret.m_nAntiMagic)) then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 800);
      end;
    if Random(5) = 0 then begin
      push := 2 + Random(3);
      m_TargetCret.CharPushed (nDir, push);
    end;
  end;
end;


procedure TJobking.RangeAttack6 (TargeTBaseObject: TBaseObject); //¹Ýµå½Ã target <> nil
var
  magpwr:Integer;
  WAbil:pTAbility;
  nDir:Integer;
begin
  if m_TargetCret =  nil then exit;

  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  SendRefMsg(RM_LIGHTING_1,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');

  if IsProperTarget (m_TargetCret) then begin
    if Random(m_TargetCret.m_btSpeedPoint) < m_btHitPoint then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, Round(magpwr * 1.8), 1, 0, '', 800);
      if Random(2 + m_TargetCret.m_btAntiPoison) = 0 then
      m_TargetCret.MakePosion(POISON_STONE, 5,1);
    end;
  end;
end;


procedure TJobking.CallDragon;
var
  nX,nY:Integer;
  MonObj:TBaseObject;
  n8,nC,n10,n14:Integer;
  n08,n0C:Integer;
  BaseObject:TBaseObject;
  nDir:integer;
  PlayObject: TPlayObject;
  Target:TBaseObject;
begin
  Target := m_TargetCret;
  nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
  m_btDirection:=nDir;
  m_dwHitTick:=GetCurrentTime;
  SendRefMsg(RM_LIGHTING_5,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');

  BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX+2,m_nCurrY,'½ðÊ¤Õ½Ê¿');
  BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX,m_nCurrY-2,'Ê¥ÊõÊ¿');
  BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX,m_nCurrY+2,'¶¨ÔµµÀÊ¿');
  BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX,m_nCurrY,'ìÍÃÅ¿Í');
  BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_nCurrX-2,m_nCurrY,'Á÷õü¹­½«');
  if BaseObject <> nil then begin
    BaseObject.SetTargetCreat(m_TargetCret);
  end;
end;

procedure TJobking.Run;
var
  nAttackDir:integer;
  n8,nC,n10:Integer;
  nDir:integer;
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
  dist: integer;
  distx,disty,distx2,disty2:Integer;
  nX,nY:Integer;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin
    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      if m_WAbil.HP < m_WAbil.MaxHP div 2 then begin
        if m_TargetCret.m_sMapName = self.m_sMapName then begin
          if (Integer(GetTickCount - m_dwSpellTick) > 100000) then begin
            m_dwSpellTick:=GetTickCount();      //100ÃÊ¸¶´Ù ¼ÒÈ¯
            UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'Ìì! µØ! ºÏ! Ò»!');
            CallDragon();
          end;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if m_wStatusTimeArr[STATE_YEONGMU] <> 0 then begin
          m_boHideMode:=FALSE;
          m_boObMode:=FALSE;
          m_wStatusTimeArr[STATE_YEONGMU] := 0;
          m_nCharStatus := GetCharStatus;
          StatusChanged;
          SendDelayRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,148,IntToStr(m_btDirection),200);
          SendRefMsg (RM_TURN, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
          RangeAttack6(m_TargetCret);         //Åõ¸íÀÏ°æ¿ì ÇØÁ¦½ÃÅ²´Ù
        end else if Random(20) = 0 then begin
          if m_wStatusArrValue[83] = 0 then begin
            UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'ÈÕ! ÉÁ!');
            SendRefMsg (RM_LIGHTING_7, nDir, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
            m_wStatusTimeArr[STATE_YEONGMU] := 60000;
            m_nCharStatus := GetCharStatus;
            StatusChanged;
            m_boHideMode:=True;
            m_boObMode:=True;
            MagProtectionField5 (1, 3);
          end;
        end else if Random(10) = 0 then begin
          UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'ÂþÌìÑ×Óü~!');
          RangeAttack2(m_TargetCret);
        end else if Random(10) = 0 then begin
          RangeAttack4(m_TargetCret);
        end else if Random(10) = 0 then begin
          UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'¿´ÎÒµÄÎüÑª´ó·¨£¡£¡');
          RangeAttack3(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack5(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
        end;
      end;
    end;
  end;
  inherited;
end;

function TJobking.AttackTarget: Boolean;
var
  targdir: byte;
  ndir   : integer;
begin
  Result := FALSE;
  if m_TargetCret <> nil then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 1) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 1) then begin
        if m_wStatusTimeArr[STATE_YEONGMU] <> 0 then begin
          m_boHideMode:=FALSE;
          m_boObMode:=FALSE;
          m_wStatusTimeArr[STATE_YEONGMU] := 0;
          m_nCharStatus := GetCharStatus;
          StatusChanged;
          SendDelayRefMsg(RM_10205,0,m_nCurrX,m_nCurrY,148,IntToStr(m_btDirection),200);
          SendRefMsg (RM_TURN, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
          RangeAttack6(m_TargetCret);         //Åõ¸íÀÏ°æ¿ì ÇØÁ¦½ÃÅ²´Ù
        end else if Random(20) = 0 then begin
          if m_wStatusArrValue[83] = 0 then begin
            UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'ÈÕ! ÉÁ!');
            SendRefMsg (RM_LIGHTING_7, nDir, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
            m_wStatusTimeArr[STATE_YEONGMU] := 60000;
            m_nCharStatus := GetCharStatus;
            StatusChanged;
            m_boHideMode:=True;
            m_boObMode:=True;
            MagProtectionField5 (1, 3);
          end;
        end else if Random(10) = 0 then begin
          UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'ÂþÌìÑ×Óü~!');
          RangeAttack2(m_TargetCret);
        end else if Random(10) = 0 then begin
          RangeAttack4(m_TargetCret);
        end else if Random(10) = 0 then begin
          UserEngine.CryCry(RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'¿´ÎÒµÄÎüÑª´ó·¨£¡£¡');
          RangeAttack3(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack5(m_TargetCret);
        end else if Random(5) = 0 then begin
          RangeAttack(m_TargetCret);
        end else begin
          Attack(m_TargetCret,ndir);
          Result := TRUE;
        end;
      end;
    end else begin
      if m_TargetCret.m_sMapName = self.m_sMapName then begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
          SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
        end;
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

{ TGreenMonster }

constructor TGreenMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TGreenMonster.Destroy;
begin

  inherited;
end;

procedure TGreenMonster.Run;//004A9720
begin
  if not bo554 and CanMove then begin
       if m_TargetCret <> nil then begin
      m_nTargetX:=m_TargetCret.m_nCurrX;
     m_nTargetY:=m_TargetCret.m_nCurrY;
  if (abs(m_nTargetX-m_nCurrX) = 1) and (abs(m_nTargety-m_nCurry)=1) then begin
  if (Random(m_TargetCret.m_btAntiPoison + 7) <= 6) and (m_TargetCret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
     m_TargetCret.MakePosion(POISON_DECHEALTH,30,10);
  end;
  end;
  end;
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;

{ TRedMonster }

constructor TRedMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TRedMonster.Destroy;
begin

  inherited;
end;

procedure TRedMonster.Run;//004A9720
begin
  if not bo554 and CanMove then begin
  if m_TargetCret <> nil then begin
      m_nTargetX:=m_TargetCret.m_nCurrX;
     m_nTargetY:=m_TargetCret.m_nCurrY;
  if (abs(m_nTargetX-m_nCurrX) = 1) and (abs(m_nTargety-m_nCurry)=1) then begin
  if (Random(m_TargetCret.m_btAntiPoison + 7) <= 6) and (m_TargetCret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
   m_TargetCret.MakePosion(POISON_DAMAGEARMOR,30,10);
 end;
  end;
  end;
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;

{ khazard }
constructor TKhazard.Create; //004A9690
begin
  inherited;
  m_dwThinkTick:=GetTickCount();
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TKhazard.Destroy;
begin

  inherited;
end;

procedure TKhazard.Run;//004A9720
var
  time1 : integer;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin
    time1:=random(2);
    if m_TargetCret <> nil then begin

    //attack code
      if IsProperTarget(m_TargetCret) then begin
        m_nTargetX:=m_TargetCret.m_nCurrX;
        m_nTargetY:=m_TargetCret.m_nCurrY;
        if (abs(m_nTargetX-m_nCurrX) = 2) or (abs(m_nTargety-m_nCurry)=2) then begin
          if (GetTickCount - m_dwThinkTick) > 1000 then begin //do drag back on random
            m_dwThinkTick:=GetTickCount();
            if time1 < 2 then
              drag();
          end else
            AttackTarget();
        end;
      end;
    end;
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;

procedure TKhazard.Drag();
var
  nx,ny: Integer;
  nAttackDir: Integer;
begin
  nAttackDir:=GetNextDirection(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,m_nCurrX,m_nCurrY); //technicaly this is the dir the target would be facing if he was hitting us
  GetFrontPosition(nx,ny);
  SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');

  m_TargetCret.CharPushed(nAttackDir,1);
  if (Random(1) = 0) and (Random(m_TargetCret.m_btAntiPoison + 7) <= 6) then begin
    m_TargetCret.MakePosion(POISON_DECHEALTH,30,10);
    exit;
  end;
end;

function TKhazard.AttackTarget():Boolean; //004A8F34
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
        if (Random(1) = 0) and (Random(m_TargetCret.m_btAntiPoison + 7) <= 6) then begin
            m_TargetCret.MakePosion(POISON_DECHEALTH,30,10);
            exit;
        end;
      end;
      Result:=True;
    end;
  end;
end;

{---------------------------------------------------------------------------}
// TFoxPillar    È£È¥±â¼®

constructor TFoxPillar.Create;
begin
   inherited Create;
   RunDone := FALSE;
   m_nViewRange := 6;
   m_nRunTime := 250;
   m_dwSearchTime := 2500 + longword(Random(1500));
   m_dwSearchTick := GetTickCount;
   m_boFixedHideMode := FALSE;
   m_boStickMode := TRUE;
   BoDontMove  := TRUE;
   m_boSuperMan := TRUE;
end;

function TFoxPillar.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;

   if FindTarget then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
            if Random(5) = 0 then begin
               RangeAttack (m_TargetCret);
               Attack (m_TargetCret, m_btDirection);
               Result := TRUE;
            end else if Random(4) < 2 then begin
               RangeAttack (m_TargetCret);
               Result := TRUE;
            end else begin
               Attack (m_TargetCret, m_btDirection);
               Result := TRUE;
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

function  TFoxPillar.FindTarget: Boolean;
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
                  if Random(2) = 0 then continue;

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

procedure TFoxPillar.RangeAttack (targ: TBaseObject);
var
   levelgap, rushdir, rushDist: integer;
begin
   if targ = nil then exit;

    // ¸Ö¸®ÀÖ´Â ÀûÀ» ²ø¾î´ç±ä´Ù.
   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   rushDir := ( (m_btDirection + 4) mod 8 );
   rushDist := _MAX(0, _MAX( abs( m_nCurrX - targ.m_nCurrX ), abs( m_nCurrY - targ.m_nCurrY ) ) -3);

   if IsProperTarget (targ) then begin
      if not ( (abs(m_nCurrX - targ.m_nCurrX) <= 2) and (abs(m_nCurrY - targ.m_nCurrY) <= 2) ) then begin
         if (not targ.m_boDeath) and ((targ.m_btRaceServer = RC_PLAYOBJECT) or (targ.m_Master <> nil)) then begin
            levelgap := (targ.m_nAntiMagic*5)+HIBYTE(targ.m_Wabil.AC) div 2;
            if (Random(50) > levelgap) then begin
               // Á÷¼±¿¡ ÀÖ´Â³Ñ¸¸ ¶¯±ä´Ù.(1Ä­¾¿ ÁÂ¿ì·Î ÀÖ´Â ³Ñµµ ¶¯±ä´Ù)
//               if ( CX = targ.CX ) or ( CY = targ.CY ) or (abs (CX-targ.CX) <= 2) or (abs (CY-targ.CY) <= 2)
//                      or ( abs( abs (CX-targ.CX) - abs (CY-targ.CY) ) <= 2 ) then begin
               // ¹üÀ§ ¾È¿¡ ÀÖ´Â³ÑÀ» ¸ðµÎ ¶¯±ä´Ù.
               if (abs(m_nCurrX - targ.m_nCurrX) <= 12) and (abs(m_nCurrY - targ.m_nCurrY) <= 12) then begin
                  //Ä³¸¯ÅÍ ´ç±â±â ÀÌÆåÆ®
                  targ.SendRefMsg(RM_10205,0,targ.m_nCurrX,targ.m_nCurrY,24,'0');       //±¸½½ È£±â¿Á ÀÌÆÑÆ®

                  targ.CharPushed(rushDir,rushDist);
               end;
            end;
         end;
      end;
   end;

end;

//Áß½É ¹üÀ§ °ø°Ý
procedure TFoxPillar.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 2;
   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, m_nCurrX, m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 600);
      end;
   end;
   FreeAndNil(rlist);
end;

{ runaway }
constructor TRunAway.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TRunAway.Destroy;
begin

  inherited;
end;

procedure TRunAway.Run;//004A9720
var
time1,nx,ny:integer;
borunaway:boolean;
begin
  if (not bo554) and CanMove then begin
if m_TargetCret <> nil then begin
      m_nTargetX:=m_TargetCret.m_nCurrX;
     m_nTargetY:=m_TargetCret.m_nCurrY;
 if (m_wabil.HP <= round(m_wabil.MaxHP div 2)) and (borunaway=false) then begin //if health less then 1/2
    GetFrontPosition(nx,ny);
       SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
       SpaceMove(M_sMapName, nx - 2, ny - 2, 0);  //move backwards 3 spaces
    borunaway:=true;
    end else begin
 if m_wabil.HP >= round(m_wabil.MaxHP div 2) then begin
    borunaway:=false;
 end;
 end;
  if borunaway then begin
     if Integer(GetTickCount - time1) > 5000 then begin
  if (abs(m_nTargetX-m_ncurrx)=1) and (abs(m_nTargety-m_ncurry)=1) then begin
     walkto(random(4),true);
  end else begin
     walkto(random(7),true);
  end;
     end else begin
       time1:=GetTickCount();
     end;
     end;
     end;
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;
{ end }

{ Tele mob }
constructor TTeleMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TTeleMonster.Destroy;
begin

  inherited;
end;

procedure TTeleMonster.Run;//004A9720
begin
  if (not bo554) and CanMove then begin
  //if it finds a target tele to him!
  if m_TargetCret <> nil then begin
    if  (abs(m_nCurrX-m_nTargetX) > 5) or
             (abs(m_nCurrY-m_nTargetY) > 5) then begin
           // if 5 spaces away teleport to the enemy!
            SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
          SpaceMove(m_TargetCret.M_sMapName, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 0);
          end;
  end;
  //end
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;
  inherited;
end;
{ end }

{ Defend Monster }
constructor TDefendMonster.Create; //004A9690
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor TDefendMonster.Destroy;
begin

  inherited;
end;

procedure TDefendMonster.Run;//004A9720
begin
  {if (not bo554) and CanMove then begin
  //if it finds a target 15 spaces away start sequence
  if (m_TargetCret <> nil) and (callguardrun=false) then begin

           // call guards!
           mainoutmessage('CALL GUARD' + inttostr(m_nCurrX) + ' ' + inttostr(m_nCurrY));
           callguard(m_sMapName,m_nCurrX,m_nCurrY);
          end;

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;
  end;   }
  inherited;
end;


{---------------------------------------------------------------------------}
//ºÐ½Å:  ¼ÒÈ¯¼ö


constructor TCloneMon.Create;
begin
   inherited Create;
   bofirst               := TRUE;
   m_boFixedHideMode     := FALSE;
   m_btRaceServer        := RC_CLONE;
   m_nViewRange          := 10;
end;

destructor TCloneMon.Destroy;
begin
   inherited Destroy;
end;

procedure TCloneMon.RecalcAbilitys;
begin
   BeforeRecalcAbility;
   inherited RecalcAbilitys;
//   AfterRecalcAbility;   //Áö¿ø ¸¶¹ý½Ã µô·¹ÀÌ ¹ö±× ¼öÁ¤
end;

procedure TCloneMon.BeforeRecalcAbility;
begin
   case m_btSlaveMakeLevel of
   1 :
      begin
         m_Abil.MC := MakeLong(10, 22);
      end;
   2 :
      begin
         m_Abil.MC := MakeLong(13, 25);
      end;
   3 :
      begin
         m_Abil.MC := MakeLong(15, 30);
      end;
   else
      begin
         m_Abil.MC := MakeLong(9, 20);
      end;
   end;

   m_AddAbil.WHP := 0;
end;

procedure TCloneMon.AfterRecalcAbility;
begin
   m_nNextHitTime  := 3300 - (m_btSlaveMakeLevel * 300);
   m_nWalkSpeed := 650;
   m_dwWalkTick     := GetCurrentTime + 2000;
   NextMPSpendTime := GetTickCount;
   MPSpendTickTime := 600 * 30;

   if m_Master <> nil then begin
      m_WAbil.MaxHP  := m_Master.m_WAbil.MaxHP;
      m_WAbil.HP     := m_Master.m_WAbil.HP;
      m_WAbil.AC     := MakeLong( LOWORD(m_Master.m_Abil.AC)*2 div  3, HIWORD(m_Master.m_Abil.AC) *2 div  3);
      m_WAbil.MAC    := MakeLong( LOWORD(m_Master.m_Abil.MAC)*2 div 3, HIWORD(m_Master.m_Abil.MAC) *2 div 3);
   end;
end;

procedure TCloneMon.ResetLevel;
begin
   //Ã³À½¸¸ÃÊ±âÈ­µÇ´ÂºÎºÐ...
end;

procedure TCloneMon.RangeAttackTo (targ: TBaseObject); //¹Ýµå½Ã target <> nil

   function GetPower1 (power, trainrate: integer): integer;
   begin
      Result := Round ((10 + trainrate * 0.9) * (power / 100));
   end;

   function  CalcMagicPow: integer;
   begin
      Result := 8 + random(20);
   end;

var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   if IsProperTarget (targ) then begin
      if targ.m_nAntiMagic <= Random(50) then begin
          pwr := m_Master.GetAttackPower (
                      GetPower1 (CalcMagicPow,0) + LoWord(m_Master.m_WAbil.MC),
                      SmallInt(HiWord(m_Master.m_WAbil.MC)-LoWord(m_Master.m_WAbil.MC)) + 1
                   );

         if targ.m_btLifeAttrib = LA_UNDEAD then pwr := Round (pwr * 1.5);

         SendDelayMsg (self, RM_DELAYMAGIC, pwr, MakeLong(Targ.m_nCurrX, Targ.m_nCurrY), MakeLong(2, 0), integer(targ), '', 600);
         SendRefMsg (RM_MAGICFIRE, 0, MakeWord(7, 9), MakeLong(Targ.m_nCurrX, Targ.m_nCurrY), integer(targ), '');

      end;

   end;

end;

function TCloneMon.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;

   if (m_TargetCret <> nil) and (m_Master <> nil) and (m_TargetCret <> m_Master) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and (not m_TargetCret.m_boDeath)then begin
            if IsProperTarget (m_TargetCret) then begin
               //¸¶¹ý ÁØºñµ¿ÀÛÀ» ¸ÕÀú º¸³¿
               SendRefMsg (RM_SPELL, 9, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 11, ''); // °­°ÝÀÌ¹ÌÁö
               RangeAttackTo (m_TargetCret);
               Result := TRUE;
            end;
         end;

      end;
   end;

//   LoseTarget;
   BoLoseTargetMoment := TRUE;  //sonmg

end;

procedure TCloneMon.Run;
var
   i: integer;
   plus, finalplus : integer;
begin
   plus := 0;
   try
      if bofirst then begin
         bofirst := FALSE;
         m_btDirection := 5;
         m_boFixedHideMode := FALSE;
         SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
         RecalcAbilitys;
         AfterRecalcAbility;   //Áö¿ø ¸¶¹ý½Ã µô·¹ÀÌ ¹ö±× ¼öÁ¤
         ResetLevel;
      end;

      if m_boDeath then begin  //ºÐ½ÅÀº ½ÃÃ¼°¡ ¾ø´Ù.
         if GetTickCount - m_dwDeathTick > 1500 then begin
            MakeGhost();
         end;
      end else begin

         if ( not BoDisapear )     and
            ( not m_boGhost    )     and
            ( self.m_WAbil.HP > 0  ) and
            ( m_Master <> nil      ) and
            ( not m_Master.m_boGhost ) and
            ( not m_Master.m_boDeath   ) then begin

            // ¸¶·ÂÀÌ È¸º¹µÇÁö ¾Ê°Ô ÇÑ´Ù.(sonmg 2005/02/15)
            m_Master.m_nSpellTick := 0;
            // ºÐ½Å¿¡°Ô ÁÖÀÎÀÇ Ã¼·ÂÀ» º¸°­ÇØÁØ´Ù.(sonmg 2005/03/09)
            Self.m_WAbil.HP := m_Master.m_WAbil.HP;

            if m_Master.m_WAbil.MP < 200 then begin
               // MP °¡ 200 º¸´Ù ÀÛÀ¸¸é ÀÚµ¿»ç¶óÁü
               m_Master.SysMsg('ÄãµÄ·ÖÉíÒòÄ§·¨²»×ã¶øÏûÊ§¡£.',c_Red, t_Hint);
               Self.BoDisapear := true;
               self.m_WAbil.HP := 0;
            end;

            if (GetTickCount >= NextMPSpendTime + MPSpendTickTime) then begin
               NextMPSpendTime := GetTickCount;

               if m_Master.m_WAbil.MP >= 200{170} then begin
//                  Self.WAbil.HP := Master.WAbil.HP;
//                  Master.WAbil.MP := Master.WAbil.MP - ( 1 + SlaveMakeLevel div 2 );
                  //----------------------------------------------------------
                  // ºÐ½ÅÀÌ ¼ÒÈ¯µÇ¾úÀ» °æ¿ì ¸¶·Â Â÷´Â °ø½Ä º°µµ Àû¿ë
                  // Ä³¸¯ÀÇ ¸¶·Â °ø½ÄÀÌ º¯°æµÇ¸é ÀÌ ºÎºÐµµ º¯°æµÇ¾î¾ß ÇÔ.
                  plus := m_Master.m_WAbil.MaxMP div 18 + 1;
                  finalplus := - ((1 + m_btSlaveMakeLevel div 2 ) * 64) + plus + ((plus * m_Master.m_nSpellRecover) div 10);
                  // ´õÇØÁö´Â °ªÀÌ ¾ç¼öÀÎÁö À½¼öÀÎÁö¿¡ µû¶ó ±¸ºÐ
                  if finalplus >= 0 then begin
                     if m_Master.m_WAbil.MP + finalplus > m_Master.m_WAbil.MaxMP then
                        m_Master.m_WAbil.MP := m_Master.m_WAbil.MaxMP
                     else
                        m_Master.m_WAbil.MP := m_Master.m_WAbil.MP + finalplus;
                  end else begin
                     if m_Master.m_WAbil.MP < - finalplus then
                        m_Master.m_WAbil.MP := 0
                     else
                        m_Master.m_WAbil.MP := m_Master.m_WAbil.MP + finalplus;
                  end;
                  //----------------------------------------------------------

               end;

               // ºÐ½Å¿¡¼­ ¼öµ¿À¸·Î ¸¶·ÂÀ» Refresh ½ÃÄÑÁØ´Ù.(sonmg 2005/02/15)
               m_Master.HealthSpellChanged;

            end;

         end else begin
            SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_CLONEHIDE, '0');
            Self.m_WAbil.HP := 0;
         end;

      end;

      inherited Run;
   except
     // MainOutMessage('EXCEPT TCLONE');
   end;

end;

{---------------------------------------------------------------------------}


{---------------------------------------------------------------------------}
//ºÐ½Å:  ¼ÒÈ¯¼ö

//¿­È­½Å ºÐ½Å ===================================================================
constructor TDarkClone.Create;//004AA4B4     //¿­È­½Å
begin
  inherited Create;
  bofirst               := TRUE;
  m_boFixedHideMode     := FALSE;
  m_btRaceServer        := RC_DARKCLONE;
  m_nViewRange          := 15;
  ThinkTick             := GetTickCount();
end;

destructor TDarkClone.Destroy;       //¿­È­½Å
begin
  inherited Destroy;
end;

procedure TDarkClone.RecalcAbilitys;
begin
   inherited RecalcAbilitys;
end;

procedure TDarkClone.AfterRecalcAbility;
begin
   m_nNextHitTime  := 3000 - (m_Master.m_nHitSpeed * 60 * 2);
   m_nWalkSpeed    := 700;
   m_dwWalkTick    := GetCurrentTime {+ 1200};

   if m_Master <> nil then begin
      m_WAbil.MaxHP  := m_Master.m_WAbil.MaxHP;
      case m_btSlaveMakeLevel of
        0: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 5;
        1: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 4;
        2: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 3;
        3: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 2;
      end;
      m_WAbil.AC     :=  m_Master.m_Abil.AC;
      m_WAbil.MAC    :=  m_Master.m_Abil.MAC;
      m_WAbil.DC     := LoWord(m_Master.m_WAbil.DC) + HiWord(m_Master.m_WAbil.DC);
      Self.m_btHitPoint := m_Master.m_btHitPoint;
      Self.m_btAntiPoison   := m_Master.m_btAntiPoison;
      Self.m_nAntiMagic     := m_Master.m_nAntiMagic;
      Self.m_nPoisonRecover := m_Master.m_nPoisonRecover;
      Self.m_btSpeedPoint   := m_Master.m_btSpeedPoint;
   end;
end;

procedure TDarkClone.RangeAttack (targ: TBaseObject);

   function  MPow (pum: PTUserMagic): integer;
   begin
      Result := pum.MagicInfo.wPower + Random(pum.MagicInfo.wMaxPower - pum.MagicInfo.wPower);
   end;

var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;

begin
   with m_WAbil do begin
      pwr := random ( HiWord(m_WAbil.DC) ) + LoWord(m_WAbil.DC) + random( LoWord(m_WAbil.DC) * m_btSlaveMakeLevel) ;
   end;
   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_pEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if cret = self then Continue;
            if m_Master.IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '',
                                     600 + _MAX(Abs(m_nCurrX-cret.m_nCurrX),Abs(m_nCurrY-cret.m_nCurrY)) * 50);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_DARKCLONEHIDE, '0');

end;

procedure TDarkClone.Run;    //¿­È­½Å
var
  I ,sx,sy: Integer;

  nx,ny: Integer;
  j, k :integer;
begin
      if bofirst then begin
         bofirst := FALSE;
         m_boFixedHideMode := FALSE;
         RecalcAbilitys;
         AfterRecalcAbility;
      end;

      if m_boDeath then begin  //ºÐ½ÅÀº ½ÃÃ¼°¡ ¾ø´Ù.
         if GetTickCount - m_dwDeathTick > 1500 then begin
            MakeGhost();
         end;
      end else begin

         if (GetTickCount - ThinkTick) > (30 + (10 * m_btSlaveMakeLevel)) * 1000 then begin
            self.m_WAbil.HP := 0;
         end;

         if (m_TargetCret = nil) then begin   //Å¸°ÙÀÌ ¾øÀ¸¸é //10-08-22
           FindTarget();
         end;

         if ( not BoDisapear )         and
            ( m_TargetCret <> nil )    and
            ( not m_boGhost    )       and
            ( self.m_WAbil.HP > 0  )   and
            ( m_Master <> nil      )   and
            ( not m_Master.m_boGhost ) and
            ( not m_TargetCret.m_boHideMode ) and
            ( Not m_boHolySeize ) and
            ( not m_Master.m_boDeath  ) and
            ( not m_TargetCret.m_boDeath) then begin

            if not AttackTarget then begin
              for j := -1 to 1 do begin
                for k := -1 to 1 do begin
                  if m_PEnvir.GetMovingObject(m_TargetCret.m_nCurrX + j, m_TargetCret.m_nCurrY + k, True) <> nil then begin
                    m_nTargetX := m_TargetCret.m_nCurrX + j;
                    m_nTargetY := m_TargetCret.m_nCurrY + k;
                  end;
                end;
              end;
            end else begin
              m_nTargetX := -1;
            end;
            if m_nTargetX <> -1 then begin
              if (abs(m_TargetCret.m_nCurrX - m_nCurrX) <= 2) and (abs(m_TargetCret.m_nCurrY - m_nCurrY) <= 2) then begin
                if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
                  m_dwWalkTick:=GetCurrentTime;
                  GotoTargetXY();
                end;
              end else begin
                if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
                  m_dwWalkTick:=GetCurrentTime;
                  GotoTargetAssXY()
                end;
              end;
            end;
         end else begin

            RangeAttack(m_TargetCret);
            Self.m_WAbil.HP := 0;
         end;

      end;

    inherited Run; //¸¶ºñ³ª ¿òÁ÷ÀÏ¼ö ¾øÀ»¶§ ´Ù½Ã µÇµ¹¸°´Ù.. ¹ö±×¼öÁ¤ 2010-6-26
end;

function TDarkClone.AttackTarget():Boolean;   //¿­È­½Å
var
  btDir:Byte;
  WAbil:pTAbility;
  nPwr:integer;
  Target:TBaseObject;
begin
  Result:=False;
  if IsProperTarget (m_TargetCret) then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:= GetCurrentTime;
        Attack(m_TargetCret,btDir);
        Result:=True;
      end;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

procedure TDarkClone.FindTarget();        //¿­È­½Å
begin
  if m_TargetCret <> nil then begin
    if (m_TargetCret.m_PEnvir <> m_PEnvir) or (m_TargetCret.m_boDeath) or (m_TargetCret.m_boGhost) or (m_TargetCret.m_boHideMode) then
      m_TargetCret := nil;
  end;

  if (m_Master.m_TargetCret <> nil) and (m_TargetCret = nil) then begin
    if (m_Master.m_TargetCret.m_PEnvir = m_PEnvir) and (ispropertarget(m_Master.m_TargetCret)) then
      m_TargetCret := m_Master.m_TargetCret;
  end;
end;


constructor TBonzeClone.Create;//004AA4B4     //ÀºÇü¼ú
begin
  inherited Create;
  bofirst               := TRUE;
  m_boFixedHideMode     := FALSE;
  m_btRaceServer        := RC_BONZECLONE;
  m_nViewRange          := 15;
  ThinkTick             := GetTickCount();
end;

destructor TBonzeClone.Destroy;         //ÀºÇü¼ú
begin
  inherited Destroy;
end;

procedure TBonzeClone.RecalcAbilitys;
begin
   inherited RecalcAbilitys;
end;

procedure TBonzeClone.AfterRecalcAbility;
begin
   m_nNextHitTime  := 3000 - (m_Master.m_nHitSpeed * 60 * 2);
   m_nWalkSpeed    := 700;
   m_dwWalkTick    := GetCurrentTime {+ 1200};

   if m_Master <> nil then begin
      m_WAbil.MaxHP  := m_Master.m_WAbil.MaxHP;
      case m_btSlaveMakeLevel of
        0: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 5;
        1: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 4;
        2: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 3;
        3: m_WAbil.HP := m_Master.m_WAbil.MaxHP div 2;
      end;
      m_WAbil.AC     :=  m_Master.m_Abil.AC;
      m_WAbil.MAC    :=  m_Master.m_Abil.MAC;
      m_WAbil.DC     := LoWord(m_Master.m_WAbil.DC) + HiWord(m_Master.m_WAbil.DC);
      Self.m_btHitPoint := m_Master.m_btHitPoint;
      Self.m_btAntiPoison   := m_Master.m_btAntiPoison;
      Self.m_nAntiMagic     := m_Master.m_nAntiMagic;
      Self.m_nPoisonRecover := m_Master.m_nPoisonRecover;
      Self.m_btSpeedPoint   := m_Master.m_btSpeedPoint;
   end;
end;

procedure TBonzeClone.RangeAttack (targ: TBaseObject);

   function  MPow (pum: PTUserMagic): integer;
   begin
      Result := pum.MagicInfo.wPower + Random(pum.MagicInfo.wMaxPower - pum.MagicInfo.wPower);
   end;

var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;

begin
   with m_WAbil do begin
      pwr := random ( HiWord(m_WAbil.DC) ) + LoWord(m_WAbil.DC) + random( LoWord(m_WAbil.DC) * m_btSlaveMakeLevel) ;
   end;
   ixf := _MAX(0, m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  m_nCurrX + 2);
   iyf := _MAX(0, m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_pEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if cret = self then Continue;
            if m_Master.IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);
               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '',
                                     600 + _MAX(Abs(m_nCurrX-cret.m_nCurrX),Abs(m_nCurrY-cret.m_nCurrY)) * 50);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_BONZECLONE, '0');

end;

procedure TBonzeClone.Run;      //ÀºÇü¼ú
var
  I ,sx,sy: Integer;

  nx,ny: Integer;
  j, k :integer;
begin
      if bofirst then begin
         bofirst := FALSE;
         m_boFixedHideMode := FALSE;
         RecalcAbilitys;
         AfterRecalcAbility;
      end;

      if m_boDeath then begin  //ºÐ½ÅÀº ½ÃÃ¼°¡ ¾ø´Ù.
         if GetTickCount - m_dwDeathTick > 1500 then begin
            MakeGhost();
         end;
      end else begin

         if (GetTickCount - ThinkTick) > (30 + (10 * m_btSlaveMakeLevel)) * 1000 then begin
            self.m_WAbil.HP := 0;
         end;

         if (m_TargetCret = nil) then begin   //Å¸°ÙÀÌ ¾øÀ¸¸é //10-08-22
           FindTarget();
         end;

         if ( not BoDisapear )         and
            ( m_TargetCret <> nil )    and
            ( not m_boGhost    )       and
            ( self.m_WAbil.HP > 0  )   and
            ( m_Master <> nil      )   and
            ( not m_Master.m_boGhost ) and
            ( not m_TargetCret.m_boHideMode ) and
            ( Not m_boHolySeize ) and
            ( not m_Master.m_boDeath  ) and
            ( not m_TargetCret.m_boDeath) then begin

            if not AttackTarget then begin
              for j := -1 to 1 do begin
                for k := -1 to 1 do begin
                  if m_PEnvir.GetMovingObject(m_TargetCret.m_nCurrX + j, m_TargetCret.m_nCurrY + k, True) <> nil then begin
                    m_nTargetX := m_TargetCret.m_nCurrX + j;
                    m_nTargetY := m_TargetCret.m_nCurrY + k;
                  end;
                end;
              end;
            end else begin
              m_nTargetX := -1;
            end;
            if m_nTargetX <> -1 then begin
              {if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
                  m_dwWalkTick:=GetCurrentTime;
                  GotoTargetXY()
              end;  }

              if (abs(m_TargetCret.m_nCurrX - m_nCurrX) <= 2) and (abs(m_TargetCret.m_nCurrY - m_nCurrY) <= 2) then begin
                if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
                  m_dwWalkTick:=GetCurrentTime;
                  GotoTargetXY();
                end;
              end else begin
                if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
                  m_dwWalkTick:=GetCurrentTime;
                  GotoTargetAssXY()
                end;
              end;

            end;
         end else begin
            RangeAttack(m_TargetCret);
            Self.m_WAbil.HP := 0;
         end;

      end;

    inherited Run; //¸¶ºñ³ª ¿òÁ÷ÀÏ¼ö ¾øÀ»¶§ ´Ù½Ã µÇµ¹¸°´Ù.. ¹ö±×¼öÁ¤ 2010-6-26
end;


procedure TBonzeClone.RangeAttackTo (targ: TBaseObject); //¹Ýµå½Ã target <> nil

   function GetPower1 (power, trainrate: integer): integer;
   begin
      Result := Round ((10 + trainrate * 0.9) * (power / 100));
   end;

   function  CalcMagicPow: integer;
   begin
      Result := 8 + random(20);
   end;

var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   if IsProperTarget (targ) then begin
      pwr := m_Master.GetAttackPower (
                      GetPower1 (CalcMagicPow,0) + LoWord(m_Master.m_WAbil.DC),
                      SmallInt(HiWord(m_Master.m_WAbil.DC)-LoWord(m_Master.m_WAbil.DC)) + 1);
      MagBKWindCut (Targ.m_nCurrX, Targ.m_nCurrY, 3, pwr );
      SendRefMsg (RM_MAGICFIRE, 0, MakeWord(1, 68), MakeLong(Targ.m_nCurrX, Targ.m_nCurrY), integer(targ), '');
   end;
   RangeAttack(m_TargetCret);
   Self.m_WAbil.HP := 0;
end;

function TBonzeClone.AttackTarget():Boolean;      //ÀºÇü¼ú
var
  btDir:Byte;
  WAbil:pTAbility;
  nPwr:integer;
  Target:TBaseObject;
begin
  Result:=False;
  if IsProperTarget (m_TargetCret) then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:= GetCurrentTime;
        SendRefMsg (RM_SPELL, 68, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY, 72, ''); //°í·Á¹«ÁøºÀ
        RangeAttackTo (m_TargetCret);
        Result:=True;
      end;
    end else begin
      if m_TargetCret.m_PEnvir = m_PEnvir then begin
        SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      end else begin
        DelTargetCreat();
      end;
    end;
  end;
end;

procedure TBonzeClone.FindTarget();            //ÀºÇü¼ú
begin
  if m_TargetCret <> nil then begin
    if (m_TargetCret.m_PEnvir <> m_PEnvir) or (m_TargetCret.m_boDeath) or (m_TargetCret.m_boGhost) or (m_TargetCret.m_boHideMode) then
      m_TargetCret := nil;
  end;

  if (m_Master.m_TargetCret <> nil) and (m_TargetCret = nil) then begin
    if (m_Master.m_TargetCret.m_PEnvir = m_PEnvir) and (ispropertarget(m_Master.m_TargetCret)) then
      m_TargetCret := m_Master.m_TargetCret;
  end;
end;
{---------------------------------------------------------------------------}

{½Ä½Å±Í}
constructor THellMonster4.Create;//004AA4B4
begin
  inherited;
  nextx:=0;
  nexty:=0;
  boMoving:=FALSE;
  MassAttackMode:=FALSE;
  MassAttackCount:=0;
  NextTarget:=nil;
  m_boApproach:=FALSE;//stops mtk from going towards players
  m_dwSearchTime:=Random(1500) + 1500;
end;

destructor THellMonster4.Destroy;
begin
  inherited;
end;

function THellMonster4.Operate(ProcessMsg:pTProcessMessage):boolean;
begin
  if (ProcessMsg.wIdent = RM_MAGSTRUCK) and (not MassAttackMode) then begin
    //they used magic now pwn them with redcircle!!!!!!
    MassAttackMode:=True;
    MassAttackCount:=0;
  end;
  Result := inherited Operate(ProcessMsg);
end;

procedure THellMonster4.RedCircle(nDir:Integer);
var
  I:Integer;
  magpwr:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
begin
//target selected
 m_btDirection:=nDir;
 { get first target }
 if NextTarget <> nil then begin
  Target:=NextTarget;
  NextTarget:=nil;
 end else begin
  Target := m_TargetCret;
 end;
 {do spell effect}
 SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(Target),'');

 {do hit radius around target}
  for i:=0 to Target.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(Target.m_VisibleActors[i]).BaseObject);
    if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 5) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 5) then begin
     //if in 3 radious range get hit
      if BaseObject <> nil then begin
        if IsProperTarget (BaseObject) then begin
          if random(3) = 0 then NextTarget:=BaseObject;
          if Random(50) >= BaseObject.m_nAntiMagic then begin
            WAbil:=@m_WAbil;
            magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
            BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 2000);
            if Random(50) >= BaseObject.m_nAntiMagic then
            BaseObject.MakePosion(POISON_DAMAGEARMOR,30,1);
          end;
        end;
      end;
     end;
  end;
end;


procedure THellMonster4.Run;//004AA604
var
  nAttackDir:Integer;
  distx,disty,distx2,disty2:Integer;
begin

  if (not bo554) and CanMove then begin

    if ((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;

    //walk code (only make him to towards a target if it's just at the edge of our view range
    if (m_TargetCret <> nil) then begin
      distx := abs(m_nCurrX - m_TargetCret.m_nCurrX);
      disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if (nextx = 0) and (nexty = 0) then begin
        nextx:=m_TargetCret.m_nCurrX ;
        nexty:=m_TargetCret.m_nCurrY;
      end;
    end;
    if boMoving then begin //if moving is true check if we havent reached our destination
      if ((m_nCurrx = nextx) and (m_nCurry = nexty)) then begin
        boMoving:=False;
        nextx:=0;
        nexty:=0;
      end;
      distx2 := abs(m_nCurrX - nextx);
      disty2 := abs(m_nCurrY - nexty);
      if (distx2 < 2) and (disty2 < 2) and (m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nextx,nexty,FALSE) <= 0) then begin //if we reached our destination, should add a code to check if there's nobody else there later
        boMoving:=False;
        nextx:=0;
        nexty:=0;
      end;
    end;
    if ((m_TargetCret = nil) or ((distx > 7) or (disty > 7))) and (nextx <> 0) and (nexty <> 0) then
      boMoving:=True;

    if boMoving then begin
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it :p
        m_dwWalkTick:=GetCurrentTime;
        m_nTargetX:=nextx;
        m_nTargetY:=nexty;
        GotoTargetXY();
      end;
    end;

    {attack them at distance}
    if (m_TargetCret <> nil) and
        (_max(distx,disty) > 1) and
        (Integer(GetTickCount - m_dwHitTick) > 2000) and
        (not MassAttackMode) then begin
      nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      m_dwHitTick:=GetCurrentTime;
      RedCircle(nAttackDir);
    end;

    {Actual magic attack if hes hit by magic}
    if (Integer(GetTickCount - m_dwHitTick) > 2000) and (m_TargetCret <> nil) then begin
      if (MassAttackMode) then begin
        if (MassAttackCount <= 5) then begin
          m_dwHitTick:=GetCurrentTime;
          inc(MassAttackCount);
          nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
          RedCircle(nAttackDir);
        end else begin
          MassAttackCount := 0;
          MassAttackMode := False;
        end;
      end;
    end;
  end;
  inherited;
end;

{---------------------------------------------------------------------------}
// TGumiBoss    //¿ùÁö°â½ÅÀå

constructor TGumiBoss.Create;   //¿ùÁö°â½ÅÀå
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TGumiBoss.Initialize;       //¿ùÁö°â½ÅÀå
begin
   m_nViewRange := 12;

   inherited Initialize;
end;

procedure TGumiBoss.Attack (TargeTActorObject: TBaseObject; nDir: Integer); //¿ùÁö°â½ÅÀå Á÷Á¢°ø°Ý
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTActorObject), '');

   if IsProperTarget(TargeTActorObject) then begin
      TargeTActorObject.StruckDamage (pwr);
      TargeTActorObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTActorObject.m_WAbil.HP{lparam1}, TargeTActorObject.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '',
                         500 );
   end;
end;

procedure TGumiBoss.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //¿ùÁö°â½ÅÀå È­¿°°ø°Ý
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;

begin
   if targ = nil then exit;

   SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   with m_WAbil do begin
      pwr := random ( HiWord(m_WAbil.DC) ) + LoWord(m_WAbil.DC) + random( LoWord(m_WAbil.MC)) ;
   end;


   ixf := _MAX(0, Targ.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  Targ.m_nCurrX + 2);
   iyf := _MAX(0, Targ.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, Targ.m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);

               if cret.m_btLifeAttrib = LA_UNDEAD then
                  pwr := Round (pwr * 1.5);

               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Integer(self){hiter}, '',
                                     600 + _MAX(Abs(m_nCurrX-cret.m_nCurrX),Abs(m_nCurrY-cret.m_nCurrY)) * 50);
               end;
            end;
         end;
         list.Free;
      end;
   end;

end;

procedure TGumiBoss.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //¿ùÁö°â½ÅÀå  ÀüÃ¼°ø°Ý(°Å¹ÌÁÙ)
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do begin
         pwr := _MAX( 0, LoWord(DC) + _MIN( MAXHUMPOWER, Random(smallint(HiWord(DC)-LoWord(DC)) + 1) ) );
         pwr := pwr + Random(LoWord(MC));
      end;

      list := TList.Create;
      //12*12 ¹üÀ§ °ø°Ý
      m_PEnvir.GetRangeBaseObject (targ.m_nCurrX, targ.m_nCurrY, 6, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetHitStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, integer(self){hiter}, '', 800);

               if (cret.m_nAntiMagic + 3) < Random(15) then begin
                 cret.SendRefMsg(RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_SPIDERBOSS, '0');
               end;
            end;
         end;
      end;
      list.Free;
   end;
end;


procedure TGumiBoss.RangeAttack3 (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //¿ùÁö°â½ÅÀå  ÁÖº¯ °ø°Ý
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do begin
         pwr := _MAX( 0, LoWord(DC) + _MIN( MAXHUMPOWER, Random(smallint(HiWord(DC)-LoWord(DC)) + 1) ) );
      end;

      list := TList.Create;
      //3*3 ¹üÀ§ °ø°Ý
      m_PEnvir.GetRangeBaseObject (Self.m_nCurrX, Self.m_nCurrY, 3, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetHitStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, integer(self){hiter}, '', 800);
            end;
         end;
      end;
      list.Free;
   end;
end;


procedure TGumiBoss.Run;                //¿ùÁö°â½ÅÀå
var
   nn, nx, ny, old: integer;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 5 div 6;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;

   inherited Run;
end;

function TGumiBoss.AttackTarget: Boolean;        //¿ùÁö°â½ÅÀå
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               if Random(10) < 4 then begin
                 Attack (m_TargetCret, targdir);   //1´ë1 °ø°Ý
               end else
                 RangeAttack3( m_TargetCret );     //ÁÖº¯°ø°Ý

               if Random(80) < 20 then
                 CriticalMode := TRUE
               else
                 CriticalMode := FALSE;
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
                  if Random(10) < 7 then begin    //¿ùÁö°â½ÅÀå °Å¹ÌÁÙ
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin       //¿ùÁö°â½ÅÀå( È­¿°°ø°Ý )
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 12) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 12) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


//==============================================================================
constructor TDragon.Create;         //¸¶·æ
begin
   inherited Create;
   bofirst := TRUE;
   m_boFixedHideMode := TRUE;
   m_btRaceServer := 138;
   m_nViewRange := 12;
   m_boWalkWaitLocked := TRUE;
   BoDontMove  := TRUE;

   ChildList := TList.Create;
end;

destructor TDragon.Destroy;         //¸¶·æ
var
   mon : TBaseObject;
   i   : integer;
begin
   if ChildList <> nil then begin
      for i := ChildList.Count -1 downto 0 do begin
         mon := TBaseObject ( ChildList[0]);
         mon.m_Wabil.HP := 0;
         ChildList.Delete(0);
      end;
      FreeAndNil(ChildList);
   end;

   inherited Destroy;
end;


procedure TDragon.RecalcAbilitys;     //¸¶·æ
begin
   inherited RecalcAbilitys;
   ResetLevel;
end;

procedure TDragon.ResetLevel;            //¸¶·æ
const
    bodypos : array[0..41,0..1] of integer = (
                              ( 0,-5),( 1,-5),
                     ( -1,-4),( 0,-4),( 1,-4),( 2,-4),
            ( -2,-3),( -1,-3),( 0,-3),( 1,-3),( 2,-3),
    (-3,-2),( -2,-2),( -1,-3),( 0,-2),( 1,-2),( 2,-2),
    (-3,-1),( -2,-1),( -1,-1),( 0,-1),( 1,-1),( 2,-1),
    (-3, 0),( -2, 0),( -1, 0),( 0, 0),( 1, 0),( 2, 0),( 3,0),
            ( -2, 1),( -1, 1),( 0, 1),( 1, 1),( 2, 1),( 3,1),
                     ( -1, 2),( 0, 2),( 1, 2),( 2, 2),
                              ( 0, 3),( 1, 3) );

var
   mon : TBaseObject;
   i,j : integer;
begin

   if m_pEnvir <> nil then begin

      for  i := 0 to 41 do begin
         if ( bodypos[i][0] <> 0 ) or( bodypos[i][1] <> 0 ) then begin
            // ÆÄÃµ¸¶·æ¸öÀÌ 00
            mon := UserEngine.RegenMonsterByName (m_pEnvir.sMapName, m_nCurrX+bodypos[i][0], m_nCurrY+bodypos[i][1], '00');
            if mon <> nil then begin
               childlist.Add (mon);
            end;
         end; //if  i <> cx
      end; // for i

   end;

end;

procedure TDragon.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil        //¸¶·æ
var
   i, pwr, dam: integer;
   sx, sy, tx, ty ,TempDir: integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;
begin
   if targ = nil then exit;

   TempDir := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);

   case TempDir of
   0,1,6,7: SendRefMsg (RM_83, TempDir, m_nCurrX, m_nCurrY, Integer(targ), '');
   5  : SendRefMsg (RM_82, TempDir, m_nCurrX, m_nCurrY, Integer(targ), '');
   2,3,4: SendRefMsg (RM_81, TempDir, m_nCurrX, m_nCurrY, Integer(targ), '');
   end;

   with m_WAbil do begin
      pwr := random ( Hibyte(m_WAbil.DC) ) + LoByte(m_WAbil.DC) + random( Lobyte(m_WAbil.MC)) ;
      pwr := pwr * (random(2)+1);
   end;

   if targ.m_btLifeAttrib = LA_UNDEAD then
      pwr := Round (pwr * 1.5);



   ixf := _MAX(0, Targ.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  Targ.m_nCurrX + 2);
   iyf := _MAX(0, Targ.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, Targ.m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);

               if cret.m_btLifeAttrib = LA_UNDEAD then
                  pwr := Round (pwr * 1.5);

               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                     600 + _MAX(Abs(m_nCurrX-cret.m_nCurrX),Abs(m_nCurrY-cret.m_nCurrY)) * 70);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;


end;

procedure TDragon.AttackAll(Targ:TBaseObject); //¹Ýµå½Ã target <> nil      //¸¶·æ
var
   ix, iy, ixf, ixt, iyf, iyt, dam , pwr,i: integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
   with m_WAbil do begin
      pwr := random ( Hibyte(m_WAbil.DC) ) + LoByte(m_WAbil.DC) + random( Lobyte(m_WAbil.MC)) ;
      pwr := pwr * (random(5)+1);
   end;

   ixf := _MAX(0, targ.m_nCurrX - 10); ixt := _MIN(m_pEnvir.m_nWidth-1,  targ.m_nCurrX + 10);
   iyf := _MAX(0, targ.m_nCurrY - 10); iyt := _MIN(m_pEnvir.m_nHeight-1, targ.m_nCurrY + 10);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);

               if cret.m_btLifeAttrib = LA_UNDEAD then
                  pwr := Round (pwr * 1.5);

               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                     600 );
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;

end;

function  TDragon.AttackTarget: Boolean;                 //¸¶·æ
var
   targdir: byte;
begin
   Result := FALSE;
   if (m_TargetCret <> nil) and ( m_TargetCret <> m_Master ) then begin

      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and
               (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and
               ( not m_TargetCret.m_boDeath ) and
               ( not m_TargetCret.m_boghost )then begin
            if Random(5) = 0 then
               AttackAll(m_TargetCret)   //¸ðµÎ°ø°Ý
            else
               RangeAttack (m_TargetCret);
            Result := TRUE;
         end;

         DelTargetCreat();//<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
      end;

   end;
end;

procedure TDragon.Struck (hiter: TBaseObject);        //¸¶·æ
begin
    inherited;
    if hiter <> nil then
    begin
        // ÆÄÃµ¸¶·æÀº ¹üÀ§°¡ 8 ÀÌÇÏÀÏ°æ¿ì¿¡¸¸ °æÇèÄ¡¸¦ Áõ°¡½ÃÅ²´Ù.
        // ¸Ö¸®¼­ ¾å»ðÇÏ°Ô °ø°ÝÇÏ´Â ¼ú»ç ¹æÁö
        if ( ABS( hiter.m_nCurrX - m_nCurrX ) <= 8) and ( ABS ( hiter.m_nCurrY - m_nCurrY ) <= 8) then
        begin
           SendMsg( self , RM_DRAGON_EXP , 0, Random(3)+1 , 0,0,'');     //¸¶·æ
        end;
    end;
end;

procedure TDragon.Run;                 //¸¶·æ
var
   i: integer;
begin
   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boFixedHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      ResetLevel;
   end;
   inherited Run;
end;

//==============================================================================
constructor TDragonBody.Create;         //¸¶·æ
begin
   inherited Create;
   bofirst := TRUE;
   m_boFixedHideMode := TRUE;
   m_btRaceServer := 140;
   m_nViewRange := 0;
   m_boWalkWaitLocked := TRUE;
   BoDontMove  := TRUE;

end;



procedure TDragonBody.RecalcAbilitys;      //¸¶·æ
begin
   inherited RecalcAbilitys;
   ResetLevel;
end;

procedure TDragonBody.ResetLevel;
begin
end;

function  TDragonBody.AttackTarget: Boolean;       //¸¶·æ
begin
    Result := FALSE;
end;

procedure TDragonBody.RangeAttack (targ: TBaseObject);     //¸¶·æ
begin
end;

procedure TDragonBody.Struck (hiter: TBaseObject);               //¸¶·æ
begin
   if hiter <> nil then begin
      // ÆÄÃµ¸¶·æÀÇ ¸öÀº ¹üÀ§°¡ 8 ÀÌÇÏÀÏ°æ¿ì¿¡¸¸ °æÇèÄ¡¸¦ Áõ°¡½ÃÅ²´Ù.
      // ¸Ö¸®¼­ ¾å»ðÇÏ°Ô °ø°ÝÇÏ´Â ¼ú»ç ¹æÁö
      if ( ABS( hiter.m_nCurrX - m_nCurrX ) <= 8) and ( ABS ( hiter.m_nCurrY - m_nCurrY ) <= 8) then begin
         SendMsg( self , RM_DRAGON_EXP , 0, Random(3)+1 , 0,0,'');   //¸¶·æ
      end;
   end;
   inherited;
end;

procedure TDragonBody.Run;       //¸¶·æ
var
   i: integer;
begin
   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boFixedHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      ResetLevel;
   end;
   inherited Run;
end;

//==============================================================================
constructor TDragonStatue.Create;      //¿ë¼®»ó
begin
   inherited Create;
   bofirst := TRUE;
   m_boHideMode := TRUE;
   m_btRaceServer := 139;
   m_nViewRange := 12;
   m_boWalkWaitLocked := TRUE;
   BoDontMove  := TRUE;
end;

destructor TDragonStatue.Destroy;      //¿ë¼®»ó
begin
    inherited Destroy;
end;


procedure TDragonStatue.RecalcAbilitys;      //¿ë¼®»ó
begin
   inherited RecalcAbilitys;
   ResetLevel;
end;

procedure TDragonStatue.ResetLevel;    //¿ë¼®»ó
begin

end;

procedure TDragonStatue.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //¿ë¼®»ó
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;

begin
   if targ = nil then exit;

   SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   with m_WAbil do begin
      pwr := random ( Hibyte(m_WAbil.DC) ) + LoByte(m_WAbil.DC) + random( Lobyte(m_WAbil.MC)) ;
   end;


   ixf := _MAX(0, Targ.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  Targ.m_nCurrX + 2);
   iyf := _MAX(0, Targ.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, Targ.m_nCurrY + 2);

   for ix := ixf to ixt do begin
      for iy := iyf to iyt do begin
         list := TList.Create;
         m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
         for i:=0 to list.Count-1 do begin
            cret := TBaseObject(list[i]);
            if IsProperTarget (cret) then begin
               dam := cret.GetMagStruckDamage (self, pwr);

               if cret.m_btLifeAttrib = LA_UNDEAD then
                  pwr := Round (pwr * 1.5);

               if dam > 0 then begin
                  cret.StruckDamage (dam);
                  cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                                     600 + _MAX(Abs(m_nCurrX-cret.m_nCurrX),Abs(m_nCurrY-cret.m_nCurrY)) * 50);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;

end;

function  TDragonStatue.AttackTarget: Boolean;         //¿ë¼®»ó
var
   targdir: byte;
begin
   Result := FALSE;
   if (m_TargetCret <> nil) and ( m_TargetCret <> m_Master )then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and
               (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and
               ( not m_TargetCret.m_boDeath ) and
               ( not m_TargetCret.m_boGhost ) then begin
            RangeAttack (m_TargetCret);

            Result := TRUE;
         end;

         DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
      end;
   end;
end;

procedure TDragonStatue.Run;        //¿ë¼®»ó
var
   i: integer;
begin
   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      ResetLevel;
   end;
   inherited Run;
end;


constructor TDragonPart.Create;
begin
  inherited;
  m_boAnimal:=FALSE;
  m_nHealth := 0;
  m_dwHitTick:=0;
  m_boNOITEM:=TRUE;
  dwEMSpellTick:=GetTickCount();
  boIsActive:=FALSE;
  m_nViewRange:=15;
end;

destructor TDragonPart.Destroy;
begin

  inherited;
end;

procedure TDragonPart.StruckDamage(var nDamage:integer);
begin
  if boIsActive then begin
    Inc(nEMHitCount);
    if (nEMHitCount >= m_WAbil.MaxHP) and (nEMdrops >= 19)  then //if this is the 10th drop then stop bothering
      m_WAbil.HP:=0;
    if nEMdrops >= 20 then //already had 10 drops total so kill them all :p
      m_WAbil.HP:=0;
  end;
end;

procedure TDragonPart.Run;
begin
  if not m_boDeath then begin

    if boIsActive = True then m_WAbil.HP:=m_WAbil.MaxHP; //»ç¿ëÇÔÀÏ¶§ Ã¼·Â ¹Ýº¹

    if (boIsActive = FALSE) and (dwEMDied = 0) then boIsActive:=true; //»ç¿ë¾ÈÇÔ ¸¶·æ¾ÈÁ×¾úÀ»°æ¿ì »ç¿ëÀ¸·Î

    if (boIsActive = TRUE) and (dwEMDied <> 0) then begin //»ç¿ëÇÔÀÏ¶§ ¸¶·æÁ×¾úÀ¸¸é »ç¿ë¾ÈÇÔ HP0
      boIsActive:=FALSE;
      m_WAbil.HP := 0;
    end;


    if boIsActive then begin                      //((GetTickCount - dwEMDied) > 600000) or
      if nEMdrops >= 20 then begin //¸¶·æÁ×ÀºÁö 10ºÐÁö³µ°Å³ª 20¹ø ÀÌ»ó ÅÍÁ³À»°æ¿ì ÀüºÎÁ×ÀÓ
        m_dwHitTick:=GetCurrentTime;
        m_WAbil.HP := 0;
      end else begin                  //±×°Ô¾Æ´Ò°æ¿ì¶ó¸é    }
      m_WAbil.HP:=m_WAbil.MaxHP;
      if (nEMHitCount >= m_WAbil.MaxHP) and (nEMdrops < 20) then begin  //20¹ø ¹Ì¸¸À¸·Î ÅÍÁú°æ¿ì °è¼ÓÅÍÁü
          nEMHitCount:= 0;
          inc(nEMDrops);
          DropItems();
        end;
      end;
     end;
   {     if (m_TargetCret <> nil) and (Integer(GetTickCount - dwEMSpellTick) > 3500) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 10) and (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 10) then begin
          dwEMSpellTick:=GetTickCount();
          MassThunder;
        end;  }
        //search for targets nearbye
        if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
         m_dwSearchEnemyTick:=GetTickCount();
         SearchTarget();
        end;
    end;
  inherited;
end;

function  TDragonPart.GetMagStruckDamage(BaseObject:TBaseObject;nDamage:Integer):Integer;
begin
  if boIsActive then begin
    result:=1;
  end else
    result:=0;
end;

procedure TDragonPart.DropItems();
var
  AttackBaseObject:TBaseObject;
begin
  AttackBaseObject:=m_ExpHitter;
  ReLoadMonItem();
  ScatterBagItems(AttackBaseObject);
end;

{---------------------------------------------------------------------------}
//Ãµ³à(¿ù·É):  ¼ÒÈ¯¼ö

constructor TAngelMon.Create;
begin
   inherited Create;

   bofirst := TRUE;
   m_boFixedHideMode := TRUE;
   m_btRaceServer := MONSTER_ANGEL;
   m_nViewRange := 10;

end;

destructor TAngelMon.Destroy;
begin
    inherited Destroy;

end;


procedure TAngelMon.RecalcAbilitys;
begin
   inherited RecalcAbilitys;
   BeforeRecalcAbility;
end;

procedure TAngelMon.BeforeRecalcAbility;
begin
   case m_btSlaveMakeLevel of
   1 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 200;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 4, HiWord(m_WAbil.AC) + 5);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 11, HiWord(m_WAbil.MC) + 20);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 5, HiWord(m_WAbil.MAC) + 5);
   end;
   2 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 300;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 5, HiWord(m_WAbil.AC) + 6);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 13, HiWord(m_WAbil.MC) + 23);
     m_WAbil.MAC := MakeLong(LoWord(m_Abil.MAC) + 6, HiWord(m_WAbil.MAC) + 6);
   end;
   3 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 450;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 6, HiWord(m_WAbil.AC) + 7);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 15, HiWord(m_WAbil.MC) + 28);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 7, HiWord(m_WAbil.MAC) + 7);
   end;
   else
    begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 150;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 3, HiWord(m_WAbil.AC) + 4);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 10, HiWord(m_WAbil.MC) + 18);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC)+ 4, HiWord(m_WAbil.MAC) + 4);

    end;
   end;

   m_AddAbil.wHP := 0;
end;

procedure TAngelMon.AfterRecalcAbility;
begin

   m_nNextHitTime  := 3100 - (m_btSlaveMakeLevel * 300);
   m_nWalkSpeed := 600 - (m_btSlaveMakeLevel * 50);
   m_dwWalkTick     := GetCurrentTime + 2000;

end;

procedure TAngelMon.ResetLevel;
begin
    //Ã³À½ ÃÊ±âÈ­ µÇ´ÂºÎºÐ...
    m_WAbil.HP    := m_WAbil.MaxHP;

end;

procedure TAngelMon.RangeAttackTo (targ: TBaseObject); //¹Ýµå½Ã target <> nil

    function GetPower1 (power, trainrate: integer): integer;
    begin
       Result := Round ((10 + trainrate * 0.9) * (power / 100));
    end;

    function  CalcMagicPower: integer;
    begin
        Result := 8  + Random( 20);
    end;

var
   i, pwr, dam: integer;
begin
   if targ = nil then exit;

   if IsProperTarget (Targ) then begin

      Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
      SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

      pwr := GetAttackPower (
                GetPower1 (CalcMagicPower,0) + LoWord(m_WAbil.MC),
                SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1 );

      if targ.m_btLifeAttrib = LA_UNDEAD then  pwr := Round (pwr * 1.5);


      dam := targ.GetMagStruckDamage (self, pwr);

      if dam > 0 then begin
         Targ.StruckDamage (dam);
         Targ.SendDelayMsg (TBaseObject(RM_STRUCK),  RM_10101   , dam,
                            targ.m_WAbil.HP, targ.m_WAbil.MaxHP, Longint(self), '', 800);
      end;

   end;
end;

function TAngelMon.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;

   if (m_TargetCret <> nil) and (m_Master <> nil) and (m_TargetCret <> m_Master) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and (not m_TargetCret.m_boDeath)then begin
            RangeAttackTo (m_TargetCret);
            Result := TRUE;
         end;
      end;
   end;

//   LoseTarget;
   BoLoseTargetMoment := TRUE;  //sonmg

end;

procedure TAngelMon.Run;
var
   i: integer;
begin
try

   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boFixedHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      RecalcAbilitys;
      AfterRecalcAbility;  // Áö¿ø ¸¶¹ý½Ã µô·¹ÀÌ ¹ö±× ¼öÁ¤
      ResetLevel;
   end;

   inherited Run;

except
    MainOutMessage('EXCEPTION TANGEL');
end;

end;



constructor TAngelMon2.Create;
begin
   inherited Create;

   bofirst := TRUE;
   m_boFixedHideMode := TRUE;
   m_nViewRange := 7;

end;

destructor TAngelMon2.Destroy;
begin
    inherited Destroy;

end;


procedure TAngelMon2.RecalcAbilitys;
begin
   inherited RecalcAbilitys;
   BeforeRecalcAbility;
end;

procedure TAngelMon2.BeforeRecalcAbility;
begin
   case m_btSlaveMakeLevel of
   1 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 200;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 4, HiWord(m_WAbil.AC) + 5);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 11, HiWord(m_WAbil.MC) + 20);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 5, HiWord(m_WAbil.MAC) + 5);
   end;
   2 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 300;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 5, HiWord(m_WAbil.AC) + 6);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 13, HiWord(m_WAbil.MC) + 23);
     m_WAbil.MAC := MakeLong(LoWord(m_Abil.MAC) + 6, HiWord(m_WAbil.MAC) + 6);
   end;
   3 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 450;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 6, HiWord(m_WAbil.AC) + 7);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 15, HiWord(m_WAbil.MC) + 28);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 7, HiWord(m_WAbil.MAC) + 7);
   end;
   else
    begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 150;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 3, HiWord(m_WAbil.AC) + 4);
     m_WAbil.MC := MakeLong(LoWord(m_WAbil.MC) + 10, HiWord(m_WAbil.MC) + 18);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC)+ 4, HiWord(m_WAbil.MAC) + 4);

    end;
   end;

   m_AddAbil.wHP := 0;
end;

procedure TAngelMon2.AfterRecalcAbility;
begin

   m_nNextHitTime  := 3100 - (m_btSlaveMakeLevel * 300);
   m_nWalkSpeed := 600 - (m_btSlaveMakeLevel * 50);
   m_dwWalkTick     := GetCurrentTime + 2000;
end;

procedure TAngelMon2.ResetLevel;
begin
    //Ã³À½ ÃÊ±âÈ­ µÇ´ÂºÎºÐ...
    m_WAbil.HP    := m_WAbil.MaxHP;

end;

procedure TAngelMon2.RangeAttackTo (targ: TBaseObject); //¹Ýµå½Ã target <> nil

    function GetPower1 (power, trainrate: integer): integer;
    begin
       Result := Round ((10 + trainrate * 0.9) * (power / 100));
    end;

    function  CalcMagicPower: integer;
    begin
        Result := 8  + Random( 20);
    end;

var
   i, pwr, dam: integer;
begin
   if targ = nil then exit;

   if IsProperTarget (Targ) then begin

      Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
      SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

      pwr := GetAttackPower (
                GetPower1 (CalcMagicPower,0) + LoWord(m_WAbil.MC),
                SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1 );

      if targ.m_btLifeAttrib = LA_UNDEAD then  pwr := Round (pwr * 1.5);


      dam := targ.GetMagStruckDamage (self, pwr);

      if dam > 0 then begin
         Targ.StruckDamage (dam);
         Targ.SendDelayMsg (TBaseObject(RM_STRUCK),  RM_10101   , dam,
                            targ.m_WAbil.HP, targ.m_WAbil.MaxHP, Longint(self), '', 800);
      end;

   end;
end;

function TAngelMon2.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;

   if (m_TargetCret <> nil) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and (not m_TargetCret.m_boDeath)then begin
            RangeAttackTo (m_TargetCret);
            Result := TRUE;
         end;
      end;
   end;
   BoLoseTargetMoment := TRUE;  //sonmg
end;

procedure TAngelMon2.Run;
var
  i, dist: integer;
  TargetBaseObject :TBaseObject;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
begin
try
   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boFixedHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      RecalcAbilitys;
      AfterRecalcAbility;  // Áö¿ø ¸¶¹ý½Ã µô·¹ÀÌ ¹ö±× ¼öÁ¤
      ResetLevel;
   end;

   TargetBaseObject := nil;
   if CanMove then begin

    if (GetTickCount - m_dwSearchEnemyTick) >= 5000 then begin
      m_dwSearchEnemyTick:=GetTickCount();
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          if not BaseObject.m_boHideMode or m_boCoolEye then begin
            nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
            if nAbs < nRage then begin
              nRage:=nAbs;
              TargetBaseObject:=BaseObject;
            end;
          end;
        end;
      end;
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end;
    end;

    if m_TargetCret <> nil then begin //if we have a target we walk, we kill it
      dist := 0;
      dist:=_Max(Abs(m_nCurrx - m_TargetCret.m_nCurrX),Abs(m_nCurrY - m_TargetCret.m_nCurrY));
      if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin //check if we should walk closer or not and do it
        m_dwWalkTick:=GetCurrentTime;
        if dist > 1 then begin
          m_nTargetX:=m_TargetCret.m_nCurrX;
          m_nTargetY:=m_TargetCret.m_nCurrY;
          GotoTargetXY;
        end;
      end;
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        RangeAttackTo(m_TargetCret);
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist >= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        RangeAttackTo(m_TargetCret);
      end;
    end;
   end;

   inherited Run;

except
    MainOutMessage('EXCEPTION TANGEL2');
end;

end;




{---------------------------------------------------------------------------}
//È¥·É:  ¼ÒÈ¯¼ö

constructor TDarkAngelMon.Create;
begin
   inherited Create;

   bofirst := TRUE;
   m_boFixedHideMode := TRUE;
   m_btRaceServer := MONSTER_DARKANGEL;
   m_nViewRange := 10;

end;

destructor TDarkAngelMon.Destroy;
begin
    inherited Destroy;

end;


procedure TDarkAngelMon.RecalcAbilitys;
begin
   inherited RecalcAbilitys;
   BeforeRecalcAbility;
end;

procedure TDarkAngelMon.BeforeRecalcAbility;
begin
   case m_btSlaveMakeLevel of
   1 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 200;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 4, HiWord(m_WAbil.AC) + 5);
     m_WAbil.SC := MakeLong(LoWord(m_WAbil.SC) + 11, HiWord(m_WAbil.SC) + 20);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 5, HiWord(m_WAbil.MAC) + 5);
   end;
   2 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 300;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 5, HiWord(m_WAbil.AC) + 6);
     m_WAbil.SC := MakeLong(LoWord(m_WAbil.SC) + 13, HiWord(m_WAbil.SC) + 23);
     m_WAbil.MAC := MakeLong(LoWord(m_Abil.MAC) + 6, HiWord(m_WAbil.MAC) + 6);
   end;
   3 :
   begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 450;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 6, HiWord(m_WAbil.AC) + 7);
     m_WAbil.SC := MakeLong(LoWord(m_WAbil.SC) + 15, HiWord(m_WAbil.SC) + 28);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC) + 7, HiWord(m_WAbil.MAC) + 7);
   end;
   else
    begin
     m_WAbil.MaxHP := m_WAbil.MaxHP + 150;
     m_WAbil.AC := MakeLong(LoWord(m_WAbil.AC) + 3, HiWord(m_WAbil.AC) + 4);
     m_WAbil.SC := MakeLong(LoWord(m_WAbil.SC) + 10, HiWord(m_WAbil.SC) + 18);
     m_WAbil.MAC := MakeLong(LoWord(m_WAbil.MAC)+ 4, HiWord(m_WAbil.MAC) + 4);

    end;
   end;


   m_AddAbil.wHP := 0;
end;

procedure TDarkAngelMon.AfterRecalcAbility;
begin

   m_nNextHitTime  := 3100 - (m_btSlaveMakeLevel * 300);
   m_nWalkSpeed := 600 - (m_btSlaveMakeLevel * 50);
   m_dwWalkTick     := GetCurrentTime + 2000;

end;

procedure TDarkAngelMon.ResetLevel;
begin
    //Ã³À½ ÃÊ±âÈ­ µÇ´ÂºÎºÐ...
    m_WAbil.HP    := m_WAbil.MaxHP;

end;

procedure TDarkAngelMon.RangeAttackTo (targ: TBaseObject); //¹Ýµå½Ã target <> nil

    function GetPower1 (power, trainrate: integer): integer;
    begin
       Result := Round ((10 + trainrate * 0.9) * (power / 100));
    end;

    function  CalcMagicPower: integer;
    begin
        Result := 8  + Random( 20);
    end;

var
   i, pwr: integer;
begin
   if targ = nil then exit;

   if IsProperTarget (Targ) then begin

      Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
      SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

      pwr := GetAttackPower (
                GetPower1 (CalcMagicPower,0) + LoWord(m_WAbil.SC),
                SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)) + 1 );

      if Random(10 + Targ.m_btAntiPoison) <=  6 then
       Targ.MakePosion(POISON_DAMAGEARMOR,pwr,0);

   end;
end;

function TDarkAngelMon.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;

   if (m_TargetCret <> nil) and (m_Master <> nil) and (m_TargetCret <> m_Master) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) and (not m_TargetCret.m_boDeath)then begin
            if (m_TargetCret.m_wStatusTimeArr[POISON_DAMAGEARMOR] <> 0) or (Random(10) < 4) then begin
               FindTarget;
            end;
            RangeAttackTo (m_TargetCret);
            Result := TRUE;
         end;
      end;
   end;

   BoLoseTargetMoment := TRUE;  //sonmg

end;

function  TDarkAngelMon.FindTarget: Boolean;
var
   i: integer;
   cret: TBaseObject;
begin
   Result := FALSE;
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget(cret) and (cret.m_wStatusTimeArr[POISON_DAMAGEARMOR] = 0) then begin
         if (abs(m_nCurrX-cret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-cret.m_nCurrY) <= m_nViewRange) then begin
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

procedure TDarkAngelMon.Run;
var
   i: integer;
begin
try

   if bofirst then begin
      bofirst := FALSE;
      m_btDirection := 5;
      m_boFixedHideMode := FALSE;
      SendRefMsg (RM_DIGUP, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      RecalcAbilitys;
      AfterRecalcAbility;  // Áö¿ø ¸¶¹ý½Ã µô·¹ÀÌ ¹ö±× ¼öÁ¤
      ResetLevel;
   end;

   inherited Run;

except
    MainOutMessage('EXCEPTION TDARKANGEL');
end;

end;

{---------------------------------------------------------------------------}



//È²±ÝÀÌ¹«±â(ºÎ·æ±Ý»ç) =====================================================================
constructor TGoldenImugi.Create;
begin
   inherited Create;
   m_nViewRange := 10;
   TwinGenDelay := 100;  //3ÃÊ´ÜÀ§
   sectick := GetTickCount;
//   DontBagItemDrop := TRUE;
//   DontBagGoldDrop := TRUE;
   m_BoNoItem := TRUE;
   FirstCheck := TRUE;

   DontAttack := TRUE;
   DontAttackCheck := FALSE;
   AttackState := FALSE;
   InitialState := FALSE;
   ChildMobRecalled := FALSE;
   FinalWarp := FALSE;

   RevivalTime := GetTickCount;
   WarpTime := GetTickCount;

   TargetTime := GetTickCount;
   RangeAttackTime := GetTickCount;
   OldTargetCret := nil;
end;

function TGoldenImugi.Operate(ProcessMsg: pTProcessMessage):Boolean;
begin
   if (ProcessMsg.wIdent = RM_POISON) then begin
    DontAttack := FALSE;
  end;
  Result := inherited Operate(ProcessMsg);
end;

procedure TGoldenImugi.Run ;
var
   ix, iy, ndir: integer;
   nx, ny: integer;
   cret: TBaseObject;
   imugicount, snakecount: integer;
begin
   cret := nil;
   snakecount := 0;
   // Â¦ÀÌ¹«±â »ý¼º Á¶°Ç
   // 3ÃÊ¿¡ ÇÑ¹ø¾¿ °Ë»ç
   if GetTickCount - sectick > 3000 then begin
      BreakHolySeizeMode();
      imugicount := 0;
      sectick := GetTickCount;
      if m_PEnvir <> nil then begin
         for ix := 0 to m_PEnvir.m_nWidth -1 do begin
            for iy := 0 to m_PEnvir.m_nHeight -1 do begin
               cret := TBaseObject (m_PEnvir.GetMovingObject (ix, iy, TRUE));
               if cret <> nil then begin
                  if (not cret.m_boDeath) and (cret.m_BtRaceServer = 146) then begin
                     if not self.m_boDeath then begin
                        if DontAttackCheck then
                           TGoldenImugi(cret).DontAttack := FALSE
                        else if DontAttack = FALSE then
                           DontAttackCheck := TRUE;
                     end;
                     Inc(imugicount);
                     if imugicount > 2 then begin
                        cret.MakeGhost();
                     end;
                     // ÀÌ ºÎºÐÀº µÎ¹øÂ° ÀÌ¹«±â¸¸ »ý°¢ÇÏ´Â ºÎºÐ.
                     if (imugicount = 2) and (cret <> self) then begin
                        // ÀÏÁ¤ ¹üÀ§ ÀÌ»ó ¶³¾îÁ® ÀÖÀ¸¸é Â¦ÀÌ¹«±â ÀÚ¸®·Î ÀÌµ¿ÇÑ´Ù.
                        if (abs(cret.m_nCurrX - self.m_nCurrX) >= 10) or (abs(cret.m_nCurrY - self.m_nCurrY) >= 10) then begin
                           // ³»°¡ WarpTimeÀÌ ¿À·¡µÆÀ¸¸é ³»°¡ ¿öÇÁÇÑ´Ù.
                           if self.WarpTime < TGoldenImugi(cret).WarpTime then begin
                              // ¿öÇÁ NormalEffect
                              SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_SN_MOVEHIDE, '0');
                              SpaceMove (cret.m_PEnvir.sMapName, cret.m_nCurrX, cret.m_nCurrY, 0);
                              WarpTime := GetTickCount;
                              SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_SN_MOVESHOW, '0');
                           end else begin
                              // ³»°¡ WarpTimeÀÌ ÃÖ±ÙÀÌ¸é WarpTimeÀÌ ¿À·¡µÈ ÀÌ¹«±â°¡ ¿öÇÁÇÑ´Ù.
                              // ¿öÇÁ NormalEffect
                              cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_SN_MOVEHIDE, '0');
                              cret.SpaceMove (self.m_PEnvir.sMapName, self.m_nCurrX, self.m_nCurrY, 0);
                              TGoldenImugi(cret).WarpTime := GetTickCount;
                              cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_SN_MOVESHOW, '0');
                           end;
                        end;
                        // ³Ê¹« °¡±îÀÌ ÀÖÀ¸¸é ¶³¾î¶ß¸°´Ù.
                        if (abs(cret.m_nCurrX - self.m_nCurrX) <= 2) and (abs(cret.m_nCurrY - self.m_nCurrY) <= 2) then begin
                           //µµ¸Á°¨.
                           if Random(3) = 0 then begin
                              ndir := GetNextDirection (cret.m_nCurrX, cret.m_nCurrY, self.m_nCurrX, self.m_nCurrY);
                              m_PEnvir.GetNextPosition (cret.m_nCurrX, cret.m_nCurrY, ndir, 5, self.m_nTargetX , self.m_nTargetY);
                           end;
                        end;
                     end;
                  end;
                  if (not cret.m_boDeath) and (cret.m_sCharName = 'Ã»¿µ»ç') then begin
                     Inc(snakecount);
                  end;
               end;
            end;
         end;
      end;

      //Ã³À½ Ã¼Å©ÀÎ °æ¿ì
      if FirstCheck then begin
         FirstCheck := FALSE;
         TwinGenDelay := 1;
      end;

      // ÀÌ¹«±â°¡ È¥ÀÚ ÀÖÀ¸¸é Â¦ÀÌ¹«±â¸¦ »ý¼ºÇÑ´Ù.(ºÎÈ°)
      if imugicount = 1 then begin
         if TwinGenDelay <= 0 then begin
            cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, _MIN(m_nCurrX+2, m_PEnvir.m_nWidth-1), m_nCurrY, '¸¡Áú½ðÉß');
            if cret <> nil then begin
               if not DontAttack then begin
                  UserEngine.CryCry (RM_CRY, m_PEnvir, m_nCurrX, m_nCurrY, 10000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor, ' -' + '¸¡Áú½ðÉß' + ' ÔÚÉñÃØµÄÖäÓïÖÐ¸´»îÁË£¡');
               end;
               // ºÎÈ° ½ÃÅ² ½Ã°£
               RevivalTime := GetTickCount;

               // ºÎÈ° ½ÃÀü NormalEffect
               SendRefMsg (RM_LIGHTING, m_btDirection, self.m_nCurrX, self.m_nCurrY, Integer(self), '');
               // ºÎÈ° NormalEffect
               cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_SN_RELIVE, '0');
               // Ã¼·Â Á¶Á¤
               if not DontAttack then begin
                  cret.m_WAbil.HP := (cret.m_WAbil.MaxHP div 3) * 2;
               end;

               if DontAttack then begin
                  //°ø°Ý »óÅÂ°¡ ¾Æ´Ï¸é ºÎÈ° ½ÃÅ² ÈÄ¿¡ ´Ù½Ã Àáµç´Ù.
                  InitialState := FALSE;
               end;
            end;
            TwinGenDelay := 100;
         end;
         Dec(TwinGenDelay);

         //ÀÌ¹«±â°¡ ÇÑ¸¶¸® ³²¾Æ ÀÖÀ¸¸é ½ÃÃ¼¸¦ ¸¸µéÁö ¾Ê´Â´Ù.
         if m_boDeath then begin
            MakeGhost();
         end;
      end else if imugicount >= 2 then begin
         FirstCheck := FALSE;
         TwinGenDelay := 100;
      end;
   end;

   if DontAttack = FALSE then begin
      if AttackState = FALSE then begin
         SendRefMsg (RM_TURN, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
         AttackState := TRUE;
         BoDontMove := FALSE;
      end;
   end else begin
      if InitialState = FALSE then begin
         SendRefMsg (RM_DIGDOWN, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
         InitialState := TRUE;
         BoDontMove := TRUE;
      end;
   end;

   //¹é»ç ¸¶¸®¼ö * Ã¼·Â È¸º¹·®
   if snakecount > 0 then begin
      m_AddAbil.wHealthRecover := snakecount * 2;
      m_nHealthRecover := m_AddAbil.wHealthRecover;
   end else begin
      m_AddAbil.wHealthRecover := 0;
      m_nHealthRecover := m_AddAbil.wHealthRecover;
   end;

   //Ã¼·ÂÀÌ 50% ³²¾ÒÀ»¶§ ¹é»ç ¼ÒÈ¯
   if m_WAbil.HP <= m_WAbil.MaxHP div 2 then begin
      if not ChildMobRecalled then begin
         GetFrontPosition(nx, ny);
         UserEngine.RegenMonsterByName (m_PEnvir.sMapName, nx, ny, 'ÇàçøÉß');
         UserEngine.RegenMonsterByName (m_PEnvir.sMapName, nx, ny, 'ÇàçøÉß');
         ChildMobRecalled := TRUE;
      end;
   end;

   //Ã¼·ÂÀÌ 10% ³²¾ÒÀ»¶§ ·£´ý ¿öÇÁ
   if m_WAbil.HP <= m_WAbil.MaxHP div 10 then begin
      if not FinalWarp then begin
         //60ÃÊ µ¿¾È ¹æ¾î·Â/¸¶¹æ·Â Áõ°¡
         MagDefenceUp(60);
         DefenceUp(60);
         DelTargetCreat();

         // ¿öÇÁ NormalEffect
         SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_SN_MOVEHIDE, '0');
//         SpaceMove (PEnvir.MapName, Random(PEnvir.MapWidth), Random(PEnvir.MapHeight), 0);
         RandomSpaceMoveInRange(0, 30, 80);
         WarpTime := GetTickCount;
         SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_SN_MOVESHOW, '0');
         FinalWarp := TRUE;
      end;
   end;

   // ±âÁ¸ ½ÇÇàÀ» ÇÑ´Ù.
   inherited Run;
end;

procedure  TGoldenImugi.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   //targ´Â ¾²ÀÌÁö ¾ÊÀ½

   m_btDirection := nDir;
   with m_WAbil do
    //  dam := Lobyte(DC) + Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1);
      dam := LoWord(m_WAbil.DC) + Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1);
   if dam <= 0 then exit;

   SendRefMsg (RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');

   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
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
                     {inherited} HitHit2 (cret, 0, pwr, TRUE);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TGoldenImugi.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := _MAX( 0,Random(SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC)) + (LoWord(m_WAbil.DC) div 2) ));

      list := TList.Create;
      m_PEnvir.GetRangeBaseObject (targ.m_nCurrX, targ.m_nCurrY, 1, TRUE, list);
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

procedure TGoldenImugi.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   // µ¶¾È°³ NormalEffect
   SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
   SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_POISONFOG, '0');

   // ½Ã¾ß³» ¸ðµç Ä³¸¯/¼ÒÈ¯¸÷ Áßµ¶
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            //¹æ¾î·ÂÀÌ °¨¼ÒÇÏ´Â µ¶¿¡ Áßµ¶ µÈ´Ù.
            if Random(2 + cret.m_btAntiPoison) = 0 then
               cret.MakePosion (POISON_DAMAGEARMOR, 60, 5);
         end;
      end;
   end;
end;

function  TGoldenImugi.AttackTarget: Boolean;
var
   targdir: byte;
   cret: TBaseObject;
begin
   Result := FALSE;
   cret := nil;
   if DontAttack then begin
      DelTargetCreat();
      exit;
   end;

   if ( GetCurrentTime < LongInt( LongWord(Random(3000) + 4000) + TargetTime ) ) then begin
      if OldTargetCret <> nil then
         m_TargetCret := OldTargetCret;
   end;

   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 9) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 9) then begin
            if ((TargetInSpitRange (m_TargetCret, targdir)) and (Random(3) < 2)) or (GetTickCount - RevivalTime < 3000) then begin
               m_dwTargetFocusTick := GetTickCount;
               m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
               Attack (m_TargetCret, targdir);

//UserEngine.CryCry (RM_CRY, PEnvir, CX, CY, 10000, ' Attack : ' + TargetCret.UserName);//test

               Result := TRUE;
            end else begin
               if ( GetCurrentTime < LongInt( 8000 + TargetTime ) ) then begin
                  m_dwTargetFocusTick := GetTickCount;
                  if (GetCurrentTime < LongInt(30000 + RangeAttackTime)) and (Random(10)<8) then begin
                     RangeAttack (m_TargetCret);
//UserEngine.CryCry (RM_CRY, PEnvir, CX, CY, 10000, ' RangeAttack : ' + TargetCret.UserName);//test
                  end else begin
                     RangeAttack2 (m_TargetCret);
                     RangeAttackTime := GetTickCount;
//UserEngine.CryCry (RM_CRY, PEnvir, CX, CY, 10000, ' RangeAttack (2)');//test
                  end;
               end else begin
                  try
                     if ( m_VisibleActors.Count > 0 ) then begin

                        cret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[ Random(m_VisibleActors.Count) ]).BaseObject);
                        if cret <> nil then begin
                           if not cret.m_boDeath then begin
                              m_TargetCret := cret;
                              OldTargetCret := m_TargetCret;
//UserEngine.CryCry (RM_CRY, PEnvir, CX, CY, 10000, ' Targeting : ' + TargetCret.UserName);//test
                              SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
                              m_dwTargetFocusTick := GetTickCount;
                              TargetTime := GetTickCount;
                           end;
                        end;
                     end;
                  except
                    MainOutMessage ('[Exception] TGoldenImugi.AttackTarget fail target change 3');
                  end;
               end;
               Result := TRUE;
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

procedure TGoldenImugi.Struck (hiter: TBaseObject);
begin
   // ¸ÂÀ¸¸é °ø°Ý¸ðµå·Î º¯°æ
   DontAttack := FALSE;
end;

procedure TGoldenImugi.Die;
var
   ix, iy: integer;
   cret: TBaseObject;
   imugicount: integer;
begin
   imugicount := 0;
   //³»°¡ ¸¶Áö¸· ÀÌ¹«±âÀÌ¸é ¾ÆÀÌÅÛÀ» ¶³±º´Ù.
   if m_PEnvir <> nil then begin
      for ix := 0 to m_PEnvir.m_nWidth -1 do begin
         for iy := 0 to m_PEnvir.m_nHeight -1 do begin
            cret := TBaseObject (m_PEnvir.GetMovingObject (ix, iy, TRUE));
            if cret <> nil then begin
               if (not cret.m_boDeath) and (cret.m_btRaceServer = 146) then begin
                  Inc(imugicount);
               end;
            end;
         end;
      end;
   end;
   if imugicount = 1 then begin
      m_BoNoItem := FALSE;
   end;

   inherited Die;
end;


{---------------------------------------------------------------------------}
// TPushedMon    È£±â¿¬

constructor TPushedMon.Create;
begin
   inherited Create;
   m_nLight := 3;
   m_dwSearchTime := 1500 + longword(Random(1500));

   AttackWide := 1;
end;

procedure TPushedMon.Initialize;
begin
   PushedCount := 0;
   if AttackWide = 1 then begin
      DeathCount := 1;
   end else begin
      DeathCount := 2;
   end;

   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TPushedMon.Attack (target: TBaseObject; dir: byte);
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if target = nil then exit;

   wide := AttackWide;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, target.m_nCurrX, target.m_nCurrY);
   SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(target), '');
   with m_WAbil do
     pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir,m_nCurrX, m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject(rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 600);
      end;
   end;
   FreeAndNil(rlist);

end;

procedure TPushedMon.Run;
begin
   if not m_boDeath then begin
      if CanMove and
       (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
       if ((GetTickCount - m_dwSearchEnemyTick) > 2000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 500) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
       end;
      end;

      if PushedCount >= DeathCount then begin
         //Á×À½
         if Random(1) = 0 then
         Die;
      end;
   end;

   inherited Run;
end;

function TPushedMon.Operate(ProcessMsg:pTProcessMessage):Boolean;
var
   nx, ny: integer;
   monname: string;
   mon: TBaseObject;
begin
   case ProcessMsg.wIdent of
      RM_STRUCK:
         begin
            m_WAbil.HP := m_WAbil.MaxHP;
            exit;
         end;
      RM_10101:
         begin
            if Integer(ProcessMsg.BaseObject) = RM_STRUCK then begin
               m_WAbil.HP := m_WAbil.MaxHP;
               exit;
            end;
         end;
   end;

   inherited Operate (ProcessMsg);
end;

procedure TPushedMon.Struck (hiter: TBaseObject);
begin
   m_WAbil.HP := m_WAbil.MaxHP;
end;

function TPushedMon.AttackTarget: Boolean;
var
   targdir: byte;
   TargX, TargY : integer;
   Flag: Boolean;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if AttackWide = 1 then begin
            Flag := (GetAttackDir (m_TargetCret, targdir));
         end else begin
            Flag := (TargetInSpitRange (m_TargetCret, targdir));
         end;

         if Flag then begin
            Attack( m_TargetCret, targdir );
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  TargX := Random( 2 * AttackWide + 1) - AttackWide;
                  TargY := Random( 2 * AttackWide + 1) - AttackWide;
                  if (TargX < AttackWide) and (TargY < AttackWide) then
                  TargX := -AttackWide;
                  TargX := TargX + m_TargetCret.m_nCurrX;
                  TargY := TargY + m_TargetCret.m_nCurrY;
                  SetTargetXY (TargX, TargY);
               end;
            end else begin
               DelTargetCreat();//<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;


{---------------------------------------------------------------------------}
//   //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£

constructor TDarkWolf.Create;        //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TDarkWolf.Initialize;         //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TDarkWolf.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   if CriticalMode then begin
      pwr := pwr * 2;
      SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
      SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;

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

procedure TDarkWolf.Run;                         //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TDarkWolf.AttackTarget: Boolean;           //°ËÀºÈæ¼º¼º ÀÌµÎÈæÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//°Å±Ç¿À¸¶

constructor TGegunOmaMon.Create;     //°Å±Ç¿À¸¶
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TGegunOmaMon.Initialize;       //°Å±Ç¿À¸¶
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TGegunOmaMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //°Å±Ç¿À¸¶
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;

end;

procedure TGegunOmaMon.RangeAttack (targ: TBaseObject);    //°Å±Ç¿À¸¶
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

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(targ), '');

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

                 if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                   cret.MakePosion (POISON_STONE, 5, 0);
                 end;
              end;
           end;
        end;
        FreeAndNil(list);
     end;
   end;

end;

procedure TGegunOmaMon.Run;                         //°Å±Ç¿À¸¶
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TGegunOmaMon.AttackTarget: Boolean;           //°Å±Ç¿À¸¶
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
              RangeAttack(m_TargetCret)
            else Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//´Ù¸ñ¿À¸¶

constructor TDamukOmaMon.Create;     //´Ù¸ñ¿À¸¶
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TDamukOmaMon.Initialize;       //´Ù¸ñ¿À¸¶
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TDamukOmaMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //´Ù¸ñ¿À¸¶
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;

end;

procedure TDamukOmaMon.RangeAttack (targ: TBaseObject);  //´Ù¸ñ¿À¸¶
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

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(targ), '');

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

end;

procedure TDamukOmaMon.Run;                        //´Ù¸ñ¿À¸¶
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TDamukOmaMon.AttackTarget: Boolean;        //´Ù¸ñ¿À¸¶
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
              RangeAttack(m_TargetCret)
            else Attack (m_TargetCret, targdir);
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

{---------------------------------------------------------------------------}
//ÁÖ¸¶°Ë»ç

constructor TJumaWarrior.Create;     //ÁÖ¸¶°Ë»ç
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TJumaWarrior.Initialize;       //ÁÖ¸¶°Ë»ç
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TJumaWarrior.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //ÁÖ¸¶°Ë»ç
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;

end;

procedure TJumaWarrior.RangeAttack (targ: TBaseObject);  //ÁÖ¸¶°Ë»ç
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

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(targ), '');

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

end;

procedure TJumaWarrior.RangeAttack2 (targ: TBaseObject);  //ÁÖ¸¶°Ë»ç
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

end;

procedure TJumaWarrior.Run;                         //ÁÖ¸¶°Ë»ç
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TJumaWarrior.AttackTarget: Boolean;         //ÁÖ¸¶°Ë»ç
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(40) < 20 then
              RangeAttack(m_TargetCret)
            else
            if Random(80) < 20 then
              RangeAttack2(m_TargetCret)
            else
            Attack (m_TargetCret, targdir);
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



constructor TWaterSlave.Create;      //ÀÍ»çÇÑ³ë¿¹
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TWaterSlave.Initialize;        //ÀÍ»çÇÑ³ë¿¹
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TWaterSlave.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //ÀÍ»çÇÑ³ë¿¹
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
                     if (Random(cret.m_btAntiPoison + 10) <= 2)  then begin
                       cret.MakePosion(POISON_DAMAGEARMOR,25,0);
                     end;
                  end;
               end;
            end;
         end;
      end;
end;


procedure TWaterSlave.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);     //ÀÍ»çÇÑ³ë¿¹
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

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

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;
end;

procedure TWaterSlave.Run;                           //ÀÍ»çÇÑ³ë¿¹
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TWaterSlave.AttackTarget: Boolean;           //ÀÍ»çÇÑ³ë¿¹
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               Attack (m_TargetCret, targdir)
            else
               Attack2 (m_TargetCret, targdir);
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


constructor TGhostShipMon.Create;       //¼±¹ÚÀÇ¾Ç·É
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TGhostShipMon.Initialize;       //¼±¹ÚÀÇ¾Ç·É
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TGhostShipMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¼±¹ÚÀÇ¾Ç·É ¸¶ºñ
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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
                     if Random(10 + cret.m_btAntiPoison) = 0 then
                      cret.MakePosion (POISON_STONE, 5, 0);
                  end;
               end;
            end;
         end;
      end;
end;



procedure TGhostShipMon.Attack3(TargeTBaseObject: TBaseObject; nDir: Integer);  //¼±¹ÚÀÇ¾Ç·É ¹Ð±â
var
   i, ix, iy, ix2, iy2, levelgap, push: integer;
   ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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

procedure TGhostShipMon.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil      //¼±¹ÚÀÇ¾Ç·É ³ìµ¶
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               if Random(10 + cret.m_btAntiPoison) = 0 then
                 cret.MakePosion (POISON_DECHEALTH, 25, 20);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TGhostShipMon.Run;                         //¼±¹ÚÀÇ¾Ç·É
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
    m_wStatusTimeArr[STATE_TRANSPARENT] := 60000;
    m_nCharStatus := GetCharStatus;
    StatusChanged;


   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TGhostShipMon.AttackTarget: Boolean;             //¼±¹ÚÀÇ¾Ç·É
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
              Attack3 (m_TargetCret, targdir)
            else
            if Random(80) < 20 then
              RangeAttack(m_TargetCret)
            else
              Attack (m_TargetCret, targdir);

            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
          if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack(m_TargetCret);
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


constructor TFramNoMon.Create;        //³ó³ë±º
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TFramNoMon.Initialize;       //³ó³ë±º
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TFramNoMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //³ó³ë±º
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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


procedure TFramNoMon.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil      //³ó³ë±º »¡µ¶
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               if Random(10 + cret.m_btAntiPoison) = 0 then
                 cret.MakePosion (POISON_DAMAGEARMOR, 25, 0);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TFramNoMon.Run;                          //³ó³ë±º
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TFramNoMon.AttackTarget: Boolean;            //³ó³ë±º
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
             RangeAttack(m_TargetCret)
            else
            Attack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
          if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack(m_TargetCret);
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


constructor TGhostFire.Create;        //È¥ºÒ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TGhostFire.Initialize;   //È¥ºÒ
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TGhostFire.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //È¥ºÒ
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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


procedure TGhostFire.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //È¥ºÒ
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
               cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_GHOSTFIRE, '0');
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TGhostFire.Run;                      //È¥ºÒ
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TGhostFire.AttackTarget: Boolean;            //È¥ºÒ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
             RangeAttack(m_TargetCret)
            else
            Attack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
        if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
          if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack(m_TargetCret);
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



constructor TTransMon.Create;      //º¯ÀÌµÈ°¨½Ãº´
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TTransMon.Initialize;    //º¯ÀÌµÈ°¨½Ãº´
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TTransMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //º¯ÀÌµÈ°¨½Ãº´
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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
                     if Random(10 + cret.m_btAntiPoison) = 0 then
                        cret.MakePosion (POISON_STONE, 5, 0);
                  end;
               end;
            end;
         end;
      end;
end;

procedure TTransMon.Run;                           //º¯ÀÌµÈ°¨½Ãº´
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TTransMon.AttackTarget: Boolean;          //º¯ÀÌµÈ°¨½Ãº´
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            Attack (m_TargetCret, targdir);
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







{---------------------------------------------------------------------------}
// TFoxWarrior    ºñ¿ù¿©¿ì(Àü»ç)

constructor TFoxWarrior.Create;       //ºñ¿ùÈæÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TFoxWarrior.Initialize;         //ºñ¿ùÈæÈ£
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TFoxWarrior.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //ºñ¿ùÈæÈ£
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   if CriticalMode then begin
      pwr := pwr * 2;
      SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
      SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;

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

procedure TFoxWarrior.Run;                           //ºñ¿ùÈæÈ£
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TFoxWarrior.AttackTarget: Boolean;             //ºñ¿ùÈæÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
// TLegendFoxWarrior    ºñ¿ù¿©¿ì(Àü»ç)

constructor TLegendFoxWarrior.Create;       //°í´ëºñ¿ùÈæÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CrazyKingMode := FALSE;
   CriticalMode := FALSE;
end;

procedure TLegendFoxWarrior.Initialize;        //°í´ëºñ¿ùÈæÈ£
begin
   CrazyTime := GetTickCount;
   oldhittime := m_nNextHitTime;
   oldwalktime := m_nWalkSpeed;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TLegendFoxWarrior.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //°í´ëºñ¿ùÈæÈ£
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   if CriticalMode then begin
      pwr := pwr * 2;
      SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
      SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;

   for i:=0 to 5 do
      for k:=0 to 5 do begin
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

procedure TLegendFoxWarrior.Run;                         //°í´ëºñ¿ùÈæÈ£
var
   nn, nx, ny, old: integer;
   ncret: TBaseObject;
begin
   if not m_boDeath and not m_BoGhost then begin
      if CrazyKingMode then begin  //ÆøÁÖ
         if GetTickCount - CrazyTime < 60 * 1000 then begin
            m_nNextHitTime := oldhittime * 2 div 5;
            m_nWalkSpeed := oldwalktime * 1 div 2;
         end else begin
            CrazyKingMode := FALSE;
            m_nNextHitTime := oldhittime;
            m_nWalkSpeed := oldwalktime;
         end;
      end else begin
         if m_WAbil.HP < m_WAbil.MaxHP div 4 then begin
            CrazyKingMode := TRUE;
            CrazyTime := GetTickCount;
         end;
      end;

   end;
   inherited Run;
end;

function TLegendFoxWarrior.AttackTarget: Boolean;             //°í´ëºñ¿ùÈæÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            Attack (m_TargetCret, targdir);
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

{---------------------------------------------------------------------------}
//ºÒ±ªÀÌ

constructor TFireCat.Create;     //ºÒ±ªÀÌ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TFireCat.Initialize;      //ºÒ±ªÀÌ
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TFireCat.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //ºÒ±ªÀÌ
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

procedure TFireCat.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);   //ºÒ±ªÀÌ
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
                         500 );
   end;
end;

function TFireCat.AttackTarget: Boolean;             //ºÒ±ªÀÌ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//°ËÀº¸ÁÄ¡±ªÀÌ

constructor TBlackHammerCat.Create;     //°ËÀº¸ÁÄ¡±ªÀÌ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TBlackHammerCat.Initialize;       //°ËÀº¸ÁÄ¡±ªÀÌ
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TBlackHammerCat.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //°ËÀº¸ÁÄ¡±ªÀÌ
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
                     if Random(cret.m_btAntiPoison + 15) <= 2 then begin
                       cret.MakePosion (POISON_STONE, 5{½Ã°£,ÃÊ}, 0);
                     end;
                  end;
               end;
            end;                     
         end;
      end;
end;

procedure TBlackHammerCat.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);   //°ËÀº¸ÁÄ¡±ªÀÌ
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
                         500 );
   end;
end;

function TBlackHammerCat.AttackTarget: Boolean;             //°ËÀº¸ÁÄ¡±ªÀÌ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            RangeAttack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//°©±ªÀÌ

constructor TArmorCat.Create;   //°©±ªÀÌ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TArmorCat.Initialize;       //°©±ªÀÌ
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TArmorCat.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //°©±ªÀÌ
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
                                        800 );
                  end;
               end;
            end;
         end;
      end;
end;

procedure TArmorCat.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);   //°©±ªÀÌ
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TArmorCat.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);   //°©±ªÀÌ
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

function TArmorCat.AttackTarget: Boolean;             //°©±ªÀÌ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(40) < 15 then
              Attack2 (m_TargetCret, targdir)
            else
            RangeAttack (m_TargetCret, targdir);
            BreakHolySeizemode();
         end;
         Result := TRUE;
      end else begin
      if TargetInSpitRange (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
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

{---------------------------------------------------------------------------}
//¾ó·è¸ÁÄ¡±ªÀÌ

constructor THammerCat.Create;    //¾ó·è¸ÁÄ¡±ªÀÌ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure THammerCat.Initialize;      //¾ó·è¸ÁÄ¡±ªÀÌ
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure THammerCat.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);  //¾ó·è¸ÁÄ¡±ªÀÌ
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;

   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;
end;


function THammerCat.AttackTarget: Boolean;      //¾ó·è¸ÁÄ¡±ªÀÌ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//°ßºù¼öÈ£Àå

constructor TDarkGuard.Create;     //°ßºù¼öÈ£Àå
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TDarkGuard.Initialize;        //°ßºù¼öÈ£Àå
begin
   m_nViewRange := 7;
   oldhittime := m_nNextHitTime;
   inherited Initialize;
end;

procedure TDarkGuard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //°ßºù¼öÈ£Àå
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TDarkGuard.RangeAttack (TargeTBaseObject: TBaseObject);    //°ßºù¼öÈ£Àå
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TDarkGuard.Run;                           //°ßºù¼öÈ£Àå
var
   Cret:TBaseObject;
begin
  if not m_boDeath and not m_BoGhost then begin
   if m_TargetCret <> nil then begin
     if GetCurrentTime - oldHittime > GetHitSpeed then begin
        if (m_TargetCret.MagCheckBuff) then begin
          oldHittime := GetCurrentTime;
          RangeAttack(m_TargetCret);
        end;
     end;
   end;
  end;

  inherited Run;
end;

function TDarkGuard.AttackTarget: Boolean;             //°ßºù¼öÈ£Àå
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            Attack (m_TargetCret, targdir);
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


{---------------------------------------------------------------------------}
//TConvene //¿°È­Àû±Í

constructor TConvene.Create;     //¿°È­Àû±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TConvene.Initialize;    //¿°È­Àû±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TConvene.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¿°È­Àû±Í
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

   if pwr <= 0 then exit;

   if CriticalMode then begin
      pwr := pwr + 10;
      SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
      SendRefMsg (RM_HIT, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;
   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         300 );
   end;

end;

function TConvene.AttackTarget: Boolean;             //¿°È­Àû±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(70) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            Attack (m_TargetCret, targdir);
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

{---------------------------------------------------------------------------}
//¹é»ó

constructor TAutumn.Create;      //¹é»ó
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TAutumn.Initialize;         //¹é»ó
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TAutumn.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¹é»ó
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;


   if CriticalMode then begin
     pwr := pwr * 2;
     SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
     SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;


   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;

procedure TAutumn.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer); //¹Ýµå½Ã target <> nil     //¹é»ó
var
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   if CriticalMode then begin
     pwr := pwr * 2;
     SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end else begin
     SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   end;

   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;
end;


function TAutumn.AttackTarget: Boolean;          //¹é»ó
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
               CriticalMode := TRUE
            else
               CriticalMode := FALSE;

            if Random(65) < 20 then
             RangeAttack (m_TargetCret, targdir)
            else
             Attack (m_TargetCret, targdir);

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


{---------------------------------------------------------------------------}
//°ÅµµÀû±Í

constructor TRobberMon.Create; //°ÅµµÀû±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TRobberMon.Initialize;       //°ÅµµÀû±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TRobberMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //°ÅµµÀû±Í
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

procedure TRobberMon.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer); //°ÅµµÀû±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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

                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 22,'0');      //°ÅµµÀû±Í ÀÌÆÑÆ®
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;

end;


function TRobberMon.AttackTarget: Boolean;          //°ÅµµÀû±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(70) < 20 then
             RangeAttack (m_TargetCret, targdir)
            else
             Attack (m_TargetCret, targdir);
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



{---------------------------------------------------------------------------}
//µ¶ÀÎÀû±Í

constructor TDaggerMon.Create; //µ¶ÀÎÀû±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TDaggerMon.Initialize;     //µ¶ÀÎÀû±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TDaggerMon.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);  //µ¶ÀÎÀû±Í
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
                         300 );
   end;
end;

procedure TDaggerMon.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);   //µ¶ÀÎÀû±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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

procedure TDaggerMon.RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer);   //µ¶ÀÎÀû±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

      ixf := _MAX(0, TargeTBaseObject.m_nCurrX - 4); ixt := _MIN(m_pEnvir.m_nWidth-1,  TargeTBaseObject.m_nCurrX + 4);
      iyf := _MAX(0, TargeTBaseObject.m_nCurrY - 4); iyt := _MIN(m_pEnvir.m_nHeight-1, TargeTBaseObject.m_nCurrY + 4);

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

                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 51,'0');   //µ¶ÀÎÀû±Í ÀÌÆÑÆ®
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;

end;


function TDaggerMon.AttackTarget: Boolean;         //µ¶ÀÎÀû±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 20 then
             RangeAttack2 (m_TargetCret, targdir)
            else
             RangeAttack (m_TargetCret, targdir);
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




{---------------------------------------------------------------------------}
//Å«»Ô¼­¿ìÀÎ

constructor TBigRhino.Create;
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TBigRhino.Initialize;
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TBigRhino.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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
                         300 );
   end;
end;

procedure TBigRhino.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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

procedure TBigRhino.RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer);
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

      ixf := _MAX(0, TargeTBaseObject.m_nCurrX - 4); ixt := _MIN(m_pEnvir.m_nWidth-1,  TargeTBaseObject.m_nCurrX + 4);
      iyf := _MAX(0, TargeTBaseObject.m_nCurrY - 4); iyt := _MIN(m_pEnvir.m_nHeight-1, TargeTBaseObject.m_nCurrY + 4);

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


function TBigRhino.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            case Random(50) of
               0..29: begin
                 Attack (m_TargetCret, targdir);
               end;
               30..39: begin
                 RangeAttack2 (m_TargetCret, targdir);
               end;
               else begin
                RangeAttack (m_TargetCret, targdir);
               end;
            end;
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




{---------------------------------------------------------------------------}
//µ¹°ÅÀÎ

constructor TStonegolem.Create;
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TStonegolem.Initialize;
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TStonegolem.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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
                         300 );
   end;
end;

procedure TStonegolem.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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

function TStonegolem.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            case Random(50) of
               0..29: begin
                 Attack (m_TargetCret, targdir);
               end;
               else begin
                RangeAttack (m_TargetCret, targdir);
               end;
            end;
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



{---------------------------------------------------------------------------}
//Èë°ÅÀÎ

constructor TEarthGolem.Create;
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TEarthGolem.Initialize;
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TEarthGolem.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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
                         300 );
   end;
end;

procedure TEarthGolem.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

      ixf := _MAX(0, TargeTBaseObject.m_nCurrX - 2); ixt := _MIN(m_pEnvir.m_nWidth-1,  TargeTBaseObject.m_nCurrX + 2);
      iyf := _MAX(0, TargeTBaseObject.m_nCurrY - 2); iyt := _MIN(m_pEnvir.m_nHeight-1, TargeTBaseObject.m_nCurrY + 2);

   //   TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,66,'0',300);

      SendRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,66,'0');//Èë°ÅÀÎ

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

function TEarthGolem.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            case Random(50) of
               0..29: begin
                 Attack (m_TargetCret, targdir);
               end;
               else begin
                RangeAttack (m_TargetCret, targdir);
               end;
            end;
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


{---------------------------------------------------------------------------}
//ÆÐ°ËÀû±Í

constructor TSideArms.Create; //ÆÐ°ËÀû±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
   CriticalMode := FALSE;
end;

procedure TSideArms.Initialize;     //ÆÐ°ËÀû±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TSideArms.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //ÆÐ°ËÀû±Í
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

procedure TSideArms.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer); //ÆÐ°ËÀû±Í
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

      if Random(TargeTBaseObject.m_btAntiPoison + 15) <= 3 then begin
            TargeTBaseObject.MakePosion(POISON_SLOWDOWN,10,0);
      end;
   end;
end;


function TSideArms.AttackTarget: Boolean;          //ÆÐ°ËÀû±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(60) < 20 then
             RangeAttack (m_TargetCret, targdir)
            else
             Attack (m_TargetCret, targdir);
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



{---------------------------------------------------------------------------}
//¾ß°ø¼öÈ£±Í

constructor TNightattack.Create;      //¾ß°ø¼öÈ£±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TNightattack.Initialize;  //¾ß°ø¼öÈ£±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TNightattack.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¾ß°ø¼öÈ£±Í
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
                         300 );

       if (Random(TargeTBaseObject.m_btAntiPoison + 30) <= 3)  then begin
        TargeTBaseObject.MakePosion(POISON_STONE,5,0);
      end;

   end;
end;

procedure TNightattack.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer); //¾ß°ø¼öÈ£±Í
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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


function TNightattack.AttackTarget: Boolean;          //¾ß°ø¼öÈ£±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(10) < 3 then
              RangeAttack (m_TargetCret, targdir)
            else
              Attack (m_TargetCret, targdir);
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




{---------------------------------------------------------------------------}
//¾ß¼ö¿Õ

constructor TWildKing.Create;     //¾ß¼ö¿Õ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TWildKing.Initialize; //¾ß¼ö¿Õ
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TWildKing.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    ///¾ß¼ö¿Õ  ÀÏ¹Ý°ø°Ý
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

      if (Random(TargeTBaseObject.m_btAntiPoison + 20) <= 3)  then begin
        TargeTBaseObject.MakePosion(POISON_DECHEALTH,30,10);
      end;
   end;
end;

procedure TWildKing.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);    ///¾ß¼ö¿Õ x °ø°Ý
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
                                     cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 500);
               end;
            end;
         end;
         FreeAndNil(list);
      end;
   end;
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
end;

procedure TWildKing.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer); //¾ß¼ö¿Õ 3x3
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

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


procedure TWildKing.RangeAttack2 (TargeTBaseObject: TBaseObject; nDir: Integer); //¾ß¼ö¿Õ È¸¿À¸®
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   list: TList;
   cret: TBaseObject;
begin
   self.m_btDirection := nDir;
   with m_WAbil do
     // pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
      pwr:= (Random(SmallInt(HiWord(m_WAbil.MC) - LoWord(m_WAbil.MC)) + 1) + LoWord(m_WAbil.MC));

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING_3, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

      ixf := _MAX(0, self.m_nCurrX - 3); ixt := _MIN(m_pEnvir.m_nWidth-1,  self.m_nCurrX + 3);
      iyf := _MAX(0, self.m_nCurrY - 3); iyt := _MIN(m_pEnvir.m_nHeight-1, self.m_nCurrY + 3);

      for ix := ixf to ixt do begin
         for iy := iyf to iyt do begin
            list := TList.Create;
            m_PEnvir.GetBaseObjects (ix, iy, TRUE, list);
            for i:=0 to list.Count-1 do begin
               cret := TBaseObject(list[i]);
               if IsProperTarget (cret) then begin
                  dam := cret.GetMagStruckDamage (self, pwr);
                  if dam > 0 then begin
                   if Random(cret.m_btSpeedPoint) < m_btHitPoint then begin
                     cret.StruckDamage (dam);
                     cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                        cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 800);
                   end;
                  end;
               end;
            end;
            FreeAndNil(list);
         end;
      end;


end;



function TWildKing.AttackTarget: Boolean;     //¾ß¼ö¿Õ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetAttackDir (m_TargetCret, targdir) then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
            m_dwHitTick := GetCurrentTime;
            m_dwTargetFocusTick := GetTickCount;
            if Random(80) < 10 then
              RangeAttack2 (m_TargetCret, targdir)
            else
            if Random(80) < 20 then
              RangeAttack (m_TargetCret, targdir)
            else
            if Random(80) < 30 then
              Attack2 (m_TargetCret, targdir)
            else
              Attack (m_TargetCret, targdir);
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




{---------------------------------------------------------------------------}
//¸ê±Í
constructor TLeafhopper.Create;     ///¸ê±Í
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TLeafhopper.Initialize;      //¸ê±Í
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TLeafhopper.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //¸ê±Í
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 0;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
    //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
     pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));


   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 300);
         cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,98,'0',300);   //¸ê±Í ÀÌÆÑÆ®
      end;
   end;
   FreeAndNil(rlist);

end;

procedure TLeafhopper.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil     //¸ê±Í
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
      //  pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
       pwr:=(Random(SmallInt(HiWord(m_WAbil.DC) - LoWord(m_WAbil.DC)) + 1) + LoWord(m_WAbil.DC));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam{wparam},
                                  cret.m_WAbil.HP{lparam1}, cret.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '', 400);

               cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,98,'0',400);  //¸ê±Í ÀÌÆÑÆ®
               if (Random(m_TargetCret.m_btAntiPoison + 30) <= 1) and (m_TargetCret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
                   cret.MakePosion(POISON_DECHEALTH,30,10);
               end;

            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;


function TLeafhopper.AttackTarget: Boolean;          //¸ê±Í
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 4) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 4) then begin
            if Random(10) < 7 then begin

               Attack( m_TargetCret, m_btDirection );
               Result := TRUE;
            end else if Random(10) < 6 then begin

               RangeAttack( m_TargetCret );
               Result := TRUE;
            end;

         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
                DelTargetCreat();   //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;

{---------------------------------------------------------------------------}
//¼­¿ì

constructor TRhinoceros.Create;    //¼­¿ì
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TRhinoceros.Initialize;       //¼­¿ì
begin
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TRhinoceros.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¼­¿ì
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

procedure TRhinoceros.RangeAttack (TargeTBaseObject: TBaseObject; nDir: Integer);    //¼­¿ì
var
   pwr, n1C: integer;

begin
   self.m_btDirection := nDir;
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   if pwr <= 0 then exit;


   if IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.StruckDamage (pwr);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                         TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                         500 );
   end;

end;


procedure TRhinoceros.Run;                             //¼­¿ì
var
  nx,ny,i :integer;
  targdir: byte;
  PoseCreate:TBaseObject;
begin
   if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) = 3) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) = 3) then begin
              SendRefMsg(RM_LIGHTING_2,Self.m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
               for i:=0 to _MAX(0,0) do begin
                 GetFrontPosition(nX,nY);
                 if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nX,nY,FALSE) > 0 then begin   //¾ÕÀ¸·Î ÀÌµ¿
                   m_nCurrX:=nX;
                   m_nCurrY:=nY;
                   SendRefMsg(RM_LIGHTING,Self.m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
                 end;
                end;
            end;

            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) >= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) >= 2) then begin
                  for i:=0 to _MAX(0,0) do begin
                   GetFrontPosition(nX,nY);
                    if m_PEnvir.MoveToMovingObject(m_nCurrX,m_nCurrY,Self,nX,nY,FALSE) > 0 then begin   //¾ÕÀ¸·Î ÀÌµ¿
                     m_nCurrX:=nX;
                     m_nCurrY:=nY;
                     SendRefMsg(RM_LIGHTING,Self.m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
                     PoseCreate:=GetPoseCreate();     //¾Õ¿¡ ´ë»ó È®ÀÎ
                      if PoseCreate <> nil then begin           //¾Õ¿¡ ´ë»óÀÌ ÀÖ´Ù.
                       m_TargetCret:=PoseCreate;        // m_TargetCret À» ÁöÁ¤ÇØÁØ´Ù.
                       RangeAttack (m_TargetCret,targdir);
                      end;
                    end;
                  end;

               end;
            end;
         end;
      end;
   end;
   inherited Run;
end;

function TRhinoceros.AttackTarget: Boolean;        //¼­¿ì
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if (GetAttackDir (m_TargetCret, targdir))  then begin
         if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
             m_dwHitTick := GetCurrentTime;
             m_dwTargetFocusTick := GetTickCount;
             Attack (m_TargetCret, targdir);
         end;
              Result := TRUE;
      end else begin
         if m_TargetCret.m_sMapName = self.m_sMapName then begin
            SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end else begin
            DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
         end;
      end;
 end;
end;



constructor TNoseMonkey.Create;     //±äÄÚ¿ø¼þÀÌ
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TNoseMonkey.Initialize;      //±äÄÚ¿ø¼þÀÌ
begin
   WarpTime := GetTickCount;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TNoseMonkey.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //±äÄÚ¿ø¼þÀÌ
var
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   if pwr <= 0 then exit;

   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;
end;

procedure TNoseMonkey.Attack2 (TargeTBaseObject: TBaseObject; nDir: Integer);    //±äÄÚ¿ø¼þÀÌ
var
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   with m_WAbil do
      pwr := GetAttackPower (LoWord(DC), SmallInt(HiWord(DC)-LoWord(DC)));
   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');

   if (TargeTBaseObject <> nil) and (TargeTBaseObject <> self) then begin
     if IsProperTarget(TargeTBaseObject) then begin
                  //¸Â´ÂÁö °áÁ¤
       if Random(TargeTBaseObject.m_btSpeedPoint) < m_btHitPoint then begin
          TargeTBaseObject.StruckDamage (pwr);
          TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, pwr{wparam},
                             TargeTBaseObject.m_WAbil.HP{lparam1}, TargeTBaseObject.m_WAbil.MaxHP{lparam2}, Longint(self){hiter}, '',
                             500 );
       end;
     end;
   end;
end;


function TNoseMonkey.Operate(ProcessMsg:pTProcessMessage):Boolean;     //±äÄÚ¿ø¼þÀÌ
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
                  if (GetTickCount - WarpTime > 2000) and (not m_boDeath) then begin
                     //¿öÇÁ
                     m_TargetCret.GetBackPosition (nx, ny);
                    if m_PEnvir.CanWalk(nx, ny, True) and (m_PEnvir.GetXYObjCount(nx, ny) = 0) then begin
                      WarpTime := GetTickCount;
                      SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_NOSEMONKEY1, '0');     //±äÄÚ¿ø¼þÀÌ ÀÌÆÑÆ®
                      SpaceMagMove(nx, ny, 0);
                      SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_NOSEMONKEY2, '0');
                    end;
                  end;
               end;
            end;
         end;
   end;
   inherited Operate (ProcessMsg);
end;

function TNoseMonkey.AttackTarget: Boolean;          //±äÄÚ¿ø¼þÀÌ
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
     if GetAttackDir (m_TargetCret, targdir) then begin
       if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         m_dwTargetFocusTick := GetTickCount;
         if Random(10) < 7 then begin
           Attack( m_TargetCret, m_btDirection );
           Result := TRUE;
         end else begin
           Attack2( m_TargetCret, m_btDirection );
           Result := TRUE;
         end;
       end;
     end else begin
       if m_TargetCret.m_sMapName = self.m_sMapName then begin
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
           SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
         end;
       end else begin
         DelTargetCreat();   //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
       end;
     end;
   end;
end;



{---------------------------------------------------------------------------}
// TFoxWizard    ºñ¿ù¿©¿ì(¼ú»ç)

constructor TFoxWizard.Create;     //ºñ¿ùÀûÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TFoxWizard.Initialize;       //ºñ¿ùÀûÈ£
begin
   WarpTime := GetTickCount;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TFoxWizard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);     //ºñ¿ùÀûÈ£
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 0;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 600);
      end;
   end;
   FreeAndNil(rlist);

end;

procedure TFoxWizard.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil       //ºñ¿ùÀûÈ£
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
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

procedure TFoxWizard.Run;                                 //ºñ¿ùÀûÈ£
begin
     if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TFoxWizard.Operate(ProcessMsg:pTProcessMessage):Boolean;     //ºñ¿ùÀûÈ£
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
                  if (GetTickCount - WarpTime > 2000) and (not m_boDeath) then begin
                     WarpTime := GetTickCount;
                     //¿öÇÁ
                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 97, '0');    //ºñ¿ùÀûÈ£ ÀÌÆÑÆ®
                     RandomSpaceMoveInRange(2, 4, 4);
                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_FOX_MOVESHOW, '0');
                  end;
               end;
            end;
         end;
   end;
   inherited Operate (ProcessMsg);
end;

function TFoxWizard.AttackTarget: Boolean;          //ºñ¿ùÀûÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if Random(10) < 7 then begin
               //°­°Ý
               Attack( m_TargetCret, m_btDirection );
               Result := TRUE;
            end else if Random(10) < 6 then begin
               //Æø¿­ÆÄ
               RangeAttack( m_TargetCret );
               Result := TRUE;
            end;

         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
                DelTargetCreat();   //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
// TLegendFoxWizard    ºñ¿ù¿©¿ì(¼ú»ç)

constructor TLegendFoxWizard.Create;     //°í´ëºñ¿ùÀûÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TLegendFoxWizard.Initialize;    //°í´ëºñ¿ùÀûÈ£
begin
   WarpTime := GetTickCount;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TLegendFoxWizard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //°í´ëºñ¿ùÀûÈ£  ³«¿°
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 2;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 800);
      end;
   end;
   FreeAndNil(rlist);

end;

procedure TLegendFoxWizard.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil     //°í´ëºñ¿ùÀûÈ£  Æø¿­ÆÄ
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
        pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget(cret) then begin
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

procedure TLegendFoxWizard.Run;                            //°í´ëºñ¿ùÀûÈ£
begin
     if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TLegendFoxWizard.Operate(ProcessMsg:pTProcessMessage):Boolean;     //°í´ëºñ¿ùÀûÈ£
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
                  if (GetTickCount - WarpTime > 2000) and (not m_boDeath) then begin
                     WarpTime := GetTickCount;
                     //¿öÇÁ
                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, 97, '0');    //°í´ëºñ¿ùÀûÈ£ ÀÌÆÑÆ®
                     RandomSpaceMoveInRange(2, 4, 4);
                     SendRefMsg (RM_10205, 0, m_nCurrX, m_nCurrY, NE_FOX_MOVESHOW, '0');
                  end;
               end;
            end;
         end;
   end;
   inherited Operate (ProcessMsg);
end;

function TLegendFoxWizard.AttackTarget: Boolean;      //°í´ëºñ¿ùÀûÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if Random(10) < 7 then begin
               //°­°Ý
               Attack( m_TargetCret, m_btDirection );
               Result := TRUE;
            end else if Random(10) < 6 then begin
               //Æø¿­ÆÄ
               RangeAttack( m_TargetCret );
               Result := TRUE;
            end;

         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
                DelTargetCreat();   //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
//È¯»ç±ÍÀå

constructor TGoldGuard.Create;
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TGoldGuard.Initialize;
begin
   BoRecallComplete := FALSE;
   BoRecallComplete1 := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TGoldGuard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
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

procedure TGoldGuard.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   with m_WAbil do
      pwr := GetAttackPower (Lobyte(MC), ShortInt(Hibyte(MC)-Lobyte(MC)));

   sec := 60;
   skilllevel := 3;
   MagBigPosion (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
end;


procedure TGoldGuard.Run;
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1: string;
begin
   cret := nil;

   recallmob1 := '±äÒì÷¼÷Ã';

   if not BoRecallComplete then begin
      if m_WAbil.HP <=  m_WAbil.MaxHP div 2 then begin
         SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY+1, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_GOLD_MOVESHOW, '0');
         end;

         BoRecallComplete := TRUE;
      end;
   end;

   if not BoRecallComplete1 then begin
      if m_WAbil.HP <  m_WAbil.MaxHP then begin
         SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY+1, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_GOLD_MOVESHOW, '0');
         end;

         BoRecallComplete1 := TRUE;
      end;
   end;


   if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TGoldGuard.AttackTarget: Boolean;
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 6) then begin
                  if Random(10) < 6 then begin
                     //È¯»ç µ¶¹«
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin
                     //È¯»ç µ¶¹«
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
//ºù¿°±ÍÀå

constructor TIceGuard.Create;
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TIceGuard.Initialize;        ///ºù¿°±ÍÀå
begin
   BoRecallComplete := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TIceGuard.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //ºù¿°±ÍÀå
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

procedure TIceGuard.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //ºù¿°±ÍÀå
var
   i, pwr, magpwr: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   WAbil:pTAbility;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
          if IsProperTarget (cret) then begin
            if Random(50) >= cret.m_nAntiMagic then begin
             WAbil:=@m_WAbil;
             magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
             cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 700);
             cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,50,'0',750);    //ºù¿°±ÍÀå ÀÌÆÑÆ®
             if (Random(15) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
                cret.MakePosion(POISON_FREEZE,10,0);
             end;

             if (Random(50) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
               cret.MakePosion(POISON_SLOWDOWN,10,0);
             end;
          end;
      end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TIceGuard.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //ºù¿°±ÍÀå
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

      list := TList.Create;
      m_PEnvir.GetBaseObjects (targ.m_nCurrX, targ.m_nCurrY, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then begin
               cret.StruckDamage (dam);
               cret.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
                                  cret.m_WAbil.HP, cret.m_WAbil.MaxHP, Longint(self), '', 600);
               cret.SendDelayRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,65,'0',500);     //ºù¿°±ÍÀå ÀÌÆÑÆ®

               cret.MakePosion(POISON_STONE,1,0);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TIceGuard.Run;              //ºù¿°±ÍÀå
begin
   if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TIceGuard.AttackTarget: Boolean;        //ºù¿°±ÍÀå
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 6) then begin
                  if Random(12) < 6 then begin
                     //¿©¿ì_Æø»ì°è
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end else if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
// TFoxTaoist    ºñ¿ù¿©¿ì(µµ»ç)

constructor TFoxTaoist.Create;    //ºñ¿ù¼ÒÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TFoxTaoist.Initialize;        //ºñ¿ù¼ÒÈ£
begin
   BoRecallComplete := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TFoxTaoist.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //ºñ¿ù¼ÒÈ£
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

procedure TFoxTaoist.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //ºñ¿ù¼ÒÈ£
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   sec := 60;
   pwr := 70;
   skilllevel := 3;
   MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
end;

procedure TFoxTaoist.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //ºñ¿ù¼ÒÈ£
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

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

procedure TFoxTaoist.Run;                //ºñ¿ù¼ÒÈ£
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1, recallmob2: string;
begin
   cret := nil;

      recallmob1 := '±¯ÔÂºÚºü';
      recallmob2 := '±¯ÔÂºìºü';

   if not BoRecallComplete then begin
      if m_WAbil.HP <= m_WAbil.MaxHP div 2 then begin
         SendRefMsg (RM_LIGHTING_2, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX-1, m_nCurrY, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY+1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY-1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;

         BoRecallComplete := TRUE;
      end;
   end;

   if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TFoxTaoist.AttackTarget: Boolean;        //ºñ¿ù¼ÒÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 6) then begin
                  if Random(10) < 7 then begin
                     //¿©¿ì_Æø»ì°è
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end else if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
// TBigSnakeWarm   ´ë¸Á

constructor TBigSnakeWarm.Create;    //´ë¸Á
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TBigSnakeWarm.Initialize;      //´ë¸Á
begin
   BoRecallComplete := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TBigSnakeWarm.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);   //´ë¸Á
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

procedure TBigSnakeWarm.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //´ë¸Á
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   sec := 60;
   pwr := 70;
   skilllevel := 3;
   MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');

   targ.SendDelayRefMsg(RM_10205, 0, targ.m_nCurrX, targ.m_nCurrY, NE_BIG_SNAKE, '0', 600);  //´ë¸Á
end;

procedure TBigSnakeWarm.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil  //´ë¸Á
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

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
               if Random(10 + cret.m_btAntiPoison) = 0 then
                 cret.MakePosion (POISON_DECHEALTH, 25, 15);
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TBigSnakeWarm.Run;               //´ë¸Á
begin
   inherited Run;
end;

function TBigSnakeWarm.AttackTarget: Boolean;    //´ë¸Á
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 6) then begin
                  if Random(10) < 7 then begin
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end else if Random(10) < 6 then begin
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;




{---------------------------------------------------------------------------}
// TLegendFoxTaoist    °í´ëºñ¿ù¼ÒÈ£

constructor TLegendFoxTaoist.Create;    //°í´ëºñ¿ù¼ÒÈ£
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TLegendFoxTaoist.Initialize;        //°í´ëºñ¿ù¼ÒÈ£
begin
   BoRecallComplete := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;

procedure TLegendFoxTaoist.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //°í´ëºñ¿ù¼ÒÈ£
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

procedure TLegendFoxTaoist.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //°í´ëºñ¿ù¼ÒÈ£
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   sec := 60;
   pwr := 70;
   skilllevel := 3;
   MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_1, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
end;

procedure TLegendFoxTaoist.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil   //°í´ëºñ¿ù¼ÒÈ£
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

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
               if (Random(cret.m_btAntiPoison + 5) <= 6) and (cret.m_wStatusTimeArr[POISON_DECHEALTH] = 0) then begin
                 cret.MakePosion(POISON_DECHEALTH, 40, 15);
               end;
            end;
         end;
      end;
      FreeAndNil(list);
   end;
end;

procedure TLegendFoxTaoist.Run;                //°í´ëºñ¿ù¼ÒÈ£
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1, recallmob2: string;
begin
   cret := nil;

      recallmob1 := '¹Å´ú±¯ÔÂºÚºü';
      recallmob2 := '¹Å´ú±¯ÔÂºìºü';

   if not BoRecallComplete then begin
      if m_WAbil.HP <= m_WAbil.MaxHP div 2 then begin
         SendRefMsg (RM_LIGHTING_2, m_btDirection, m_nCurrX, m_nCurrY, Integer(m_TargetCret), '');
         //¼ÒÈ¯

         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY+1, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX-1, m_nCurrY-1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY-1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX-1, m_nCurrY+1, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;


         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX-1, m_nCurrY, recallmob1);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY+1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX, m_nCurrY-1, recallmob2);
         if cret <> nil then begin
            cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_FOX_MOVESHOW, '0');
         end;

         BoRecallComplete := TRUE;
      end;
   end;

   if (not bo554) and CanMove then begin
      if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
         //»ó¼Ó¹ÞÀº run¿¡¼­ WalkTime Àç¼³Á¤ÇÔ
         if m_TargetCret <> nil then begin
            if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 5) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 5) then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 2) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 2) then begin
                  //³Ê¹« °¡±î¿ì¸é, Àß µµ¸Á ¾È°¨.
                  if Random(3) = 0 then begin
                     //µµ¸Á°¨.
                     Self.GetBackPosition (m_nTargetX, m_nTargetY);
                  end;
               end else begin
                  //µµ¸Á°¨.
                  Self.GetBackPosition (m_nTargetX, m_nTargetY);
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;

function TLegendFoxTaoist.AttackTarget: Boolean;        //°í´ëºñ¿ù¼ÒÈ£
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
            if (GetAttackDir (m_TargetCret, targdir)) and (Random(10) < 8) then begin
               m_dwTargetFocusTick := GetTickCount;
               Attack (m_TargetCret, targdir);
               Result := TRUE;
            end else begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 6) then begin
                  if Random(10) < 7 then begin
                     //¿©¿ì_Æø»ì°è
                     RangeAttack2( m_TargetCret );
                     Result := TRUE;
                  end else if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end else begin
                  if Random(10) < 6 then begin
                     //¿©¿ì_ÀúÁÖ¼ú
                     RangeAttack( m_TargetCret );
                     Result := TRUE;
                  end;
               end;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;



{---------------------------------------------------------------------------}
// TFaceMob    ÀÎ¸é¼ö

constructor TFaceMob.Create;    //ÀÎ¸é¼ö
begin
   inherited Create;
   m_dwSearchTime := 2500 + longword(Random(1500));
end;

procedure TFaceMob.Initialize;      //ÀÎ¸é¼ö
begin
   BoRecallComplete := FALSE;
   m_nViewRange := 7;

   inherited Initialize;
end;


procedure TFaceMob.RangeAttack (targ: TBaseObject);  //ÀÎ¸é¼ö
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
         pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));

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
                   cret.SendRefMsg(RM_10205,0,cret.m_nCurrX,cret.m_nCurrY,84,'0');      //ÀÎ¸é¼ö ÀÌÆÑÆ®
                if (Random(cret.m_btAntiPoison + 15) <= 2) then begin
                   cret.MakePosion(POISON_DECHEALTH,30,10);
                end;

            end;
         end;
      end;
      FreeAndNil(list);
end;

procedure TFaceMob.Run;              //ÀÎ¸é¼ö
var
   nx, ny: integer;
   cret: TBaseObject;
   recallmob1, recallmob2: string;
begin
   cret := nil;

      recallmob1 := 'ÆáºÚÊÞ';
      recallmob2 := 'ÆáºÚÊÞ';

   if not BoRecallComplete then begin
      if m_boDeath then begin
         //¼ÒÈ¯
         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+1, m_nCurrY, recallmob1);

         cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX-1, m_nCurrY, recallmob1);

         BoRecallComplete := TRUE;
      end;
   end;

   inherited Run;
end;

function TFaceMob.AttackTarget: Boolean;         //ÀÎ¸é¼ö
var
   targdir: byte;
begin
   Result := FALSE;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 7) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 7) then begin
           m_dwTargetFocusTick := GetTickCount;
           RangeAttack( m_TargetCret );
           Result := TRUE;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 11) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 11) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
               DelTargetCreat();  //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;
      end;
   end;
end;




{---------------------------------------------------------------------------}
// TBossTurtle    °ÅºÏ¿Õ(Çö¹«)

constructor TBossTurtle.Create;           //Çö¹«Çö½Å
begin
   inherited Create;
   m_nViewRange := 17;
   m_dwRunTick := 250;
   m_dwSearchTime := 1500 + longword(Random(2000));
   m_dwSearchTick := GetTickCount;
   m_boHideMode := FALSE;
   RecallStep := 4;
end;

function TBossTurtle.AttackTarget: Boolean;
var
   targdir: byte;
   i, nx, ny: integer;
   cret: TBaseObject;
   rlist: TList;
   rand, selectattack: integer;
   recallflag: Boolean;
   mobname1, mobname2: string;
begin
   Result := FALSE;

   mobname1 := '¼×Ê¯¹êÊÞ';
   mobname2 := '¼×Ìú¹êÊÞ';

   selectattack := 0;
   rlist := nil;
   cret := nil;
   if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
         m_dwHitTick := GetCurrentTime;

         //°ø°Ý°Å¸® : 12
         if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 12) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 12) then begin
            rand := Random(10000) + 1;

            //°ø°Ý Á¾·ù ¼±ÅÃ
            //Ã¼·ÂÀÌ 50%ÀÌ»óÀÏ ¶§
            if m_WAbil.HP >= m_WAbil.MaxHP div 2 then begin
               case rand of
                  1..2800: //ÀüÃ¼°ø°Ý
                     begin
                        selectattack := 1;
                     end;
                  2801..6800: //¹°¸®A
                     begin
                        selectattack := 2;
                     end;
                  6801..9800: //¹°¸®B
                     begin
                        selectattack := 3;
                     end;
                  else  //Èú¸µ
                     begin
                        selectattack := 4;
                     end;
               end;
            //Ã¼·ÂÀÌ 50%¹Ì¸¸ÀÏ ¶§
            end else begin
               case rand of
                  1..4300: //ÀüÃ¼°ø°Ý
                     begin
                        selectattack := 1;
                     end;
                  4301..7300: //¹°¸®A
                     begin
                        selectattack := 2;
                     end;
                  7301..9300: //¹°¸®B
                     begin
                        selectattack := 3;
                     end;
                  else  //Èú¸µ
                     begin
                        selectattack := 4;
                     end;
               end;
            end;

            //°ø°Ý ¼öÇà
            case selectattack of
               1: //ÀüÃ¼°ø°Ý
                  begin
                     RangeAttack2 (m_TargetCret);

                     Result := TRUE;
                  end;
               2: //¹°¸®A
                  begin
                     Attack (m_TargetCret, m_btDirection);

                     Result := TRUE;
                  end;
               3: //¹°¸®B
                  begin
                     //°ø°Ý°Å¸® : 4
                     if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= 4) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= 4) then begin
                        RangeAttack (m_TargetCret);

                        Result := TRUE;
                     end;
                  end;
               4:  //Èú¸µ
                  begin
                     SendRefMsg (RM_LIGHTING_1, m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
                     IncHealthSpell (1000{+hp}, 0{+mp});

                     Result := TRUE;
                  end;
               else
                  begin
                  end;
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
               DelTargetCreat; //<!!ÁÖÀÇ> TargetCret := nil·Î ¹Ù²ñ
            end;
         end;

         //------------------------------------
         //¼ÒÈ¯ Á¶°Ç
         recallflag := FALSE;

         if (m_WAbil.HP <= m_WAbil.MaxHP div 10 * RecallStep) and (RecallStep > 0) then begin
            Dec(RecallStep);
            recallflag := TRUE;
         end;

         if recallflag then begin
            //¼ÒÈ¯ Effect
            SendRefMsg (RM_LIGHTING_3, m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');

            //¼ÒÈ¯
            for i := -1 to 1 do begin
               cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+i, m_nCurrY-1, mobname1);
               if cret <> nil then begin
                  cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGTURTLE_MOBSHOW, '0');
               end;
               cret := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, m_nCurrX+i, m_nCurrY+1, mobname2);
               if cret <> nil then begin
                  cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGTURTLE_MOBSHOW, '0');
               end;
            end;
            Result := TRUE;
         end;
      end;
   end;

end;

function  TBossTurtle.FindTarget: Boolean;
var
   i: integer;
   cret: TBaseObject;
begin
   Result := FALSE;
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject (pTVisibleBaseObject(m_VisibleActors[i]).BaseObject);
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

//°ø°Ý4(¹°¸®B) : Å¸°ÙÁß½É ¿ø°Å¸® ¹üÀ§ ¹°¸®°ø°Ý
procedure TBossTurtle.RangeAttack (targ: TBaseObject); //¹Ýµå½Ã target <> nil
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
      m_PEnvir.GetNextPosition ( m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do begin
         pwr := _MAX( 0, Lobyte(DC) + _MIN( 255, Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) ) );
         pwr := pwr + Random(Lobyte(MC));
         pwr := pwr * 2;
      end;

      list := TList.Create;
      //3*3 ¹üÀ§ °ø°Ý
      m_PEnvir.GetRangeBaseObject (targ.m_nCurrX, targ.m_nCurrY, 1, TRUE, list);
      for i:=0 to list.Count-1 do begin
         cret := TBaseObject(list[i]);
         if IsProperTarget (cret) then begin
            dam := cret.GetHitStruckDamage (self, pwr);
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

//°ø°Ý1(ÀüÃ¼°ø°Ý) : Å¸°ÙÀ» Áß½ÉÀ¸·Î 15*15 ¹üÀ§ ¿ø°Å¸® ¸¶¹ý°ø°Ý
procedure TBossTurtle.RangeAttack2 (targ: TBaseObject); //¹Ýµå½Ã target <> nil
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);
   SendRefMsg (RM_LIGHTING_2, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(targ), '');
   if m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do begin
         pwr := _MAX( 0, Lobyte(DC) + _MIN( 255, Random(ShortInt(Hibyte(DC)-Lobyte(DC)) + 1) ) );
         pwr := pwr + Random(Lobyte(MC));
         pwr := pwr * 2;
      end;

      list := TList.Create;
      //15*15 ¹üÀ§ °ø°Ý
      m_PEnvir.GetRangeBaseObject (targ.m_nCurrX, targ.m_nCurrY, 7, TRUE, list);
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

//°ø°Ý3(¹°¸®A) : ½ÃÀüÀÚ Áß½É ¹üÀ§ ¹°¸®°ø°Ý
procedure TBossTurtle.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   //½ÃÀüÀÚ Áß½É 5*5
   wide := 2;
   with m_WAbil do begin
      pwr := GetAttackPower (Lobyte(DC), _MIN( 255, ShortInt(Hibyte(DC)-Lobyte(DC)) ) );
      pwr := pwr + Random(Lobyte(MC));
      pwr := pwr * 2;
   end;
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, m_nCurrX, m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         dam := cret.GetHitStruckDamage (self, pwr);
         if dam > 0 then
            HitHit2 (cret, dam, 0, TRUE);
      end;
   end;
   FreeAndNil(rlist);
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ObjMon3.pas 594 2007-03-09 15:00:12Z damian $');
end.
