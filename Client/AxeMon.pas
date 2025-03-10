unit AxeMon;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, ExtCtrls, Graphics, Controls, Forms, Dialogs,
  Grobal2, DxDraws, CliUtil, ClFunc, magiceff, Actor, ClEvent;


const
   DEATHEFFECTBASE = 340;
   DEATHFIREEFFECTBASE = 2860;
   AXEMONATTACKFRAME = 6;
   KUDEGIGASBASE = 1445;
   COWMONFIREBASE = 1800;
   COWMONLIGHTBASE = 1900;
   ZOMBILIGHTINGBASE = 350;
   ZOMBIDIEBASE = 340;
   ZOMBILIGHTINGEXPBASE = 520;
   SCULPTUREFIREBASE = 1680;
   MOTHPOISONGASBASE = 3590;
   DUNGPOISONGASBASE = 3590;
   WARRIORELFFIREBASE = 820;
   SUPERIORGUARDBASE = 760;

type
   TSkeletonOma = class (TActor) //Size:25C
   private
   protected
      EffectSurface: TDirectDrawSurface;    //0x240
      AttackEffectSurface: TDirectDrawSurface;    //0x240
      firedir :integer;    //0x25C
      ax: Integer;                           //0x244
      ay: integer;
      ex, ey: integer;                       //0x248
      bx, cx, by, cy: integer;
      SitDown : Boolean;
   public
      constructor Create; override;
      //destructor Destroy; override;
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer);  override;
   end;

   TDualAxeOma = class (TSkeletonOma)
   private
   public
      procedure Run; override;
   end;

   TCatMon = class (TSkeletonOma)
   private
   public
      procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer);  override;
   end;

   TArcherMon = class (TCatMon)//궁수
   public
      procedure Run; override;
   end;

   TScorpionMon = class (TCatMon)
   public
   end;

   THuSuABi = class (TSkeletonOma)
   public
      procedure LoadSurface; override;
   end;

   TZombiDigOut = class (TSkeletonOma)
   public
      procedure RunFrameAction (frame: integer); override;
   end;

   TZombiZilkin = class (TSkeletonOma)
   public
   end;

   TWhiteSkeleton = class (TSkeletonOma)
   public
   end;


   TGasKuDeGi = class (TActor)//Size 0x274
   protected
      AttackEffectSurface :TDirectDrawSurface;    //0x250
      DieEffectSurface    :TDirectDrawSurface;    //0x254
      BoUseDieEffect      :Boolean;    //0x258
      firedir             :integer;    //0x25C
      fire16dir           :integer;    //0c260
      ax                  :integer;    //0x264
      ay                  :integer;    //0x268
      bx                  :integer;
      by                  :integer;
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TFireCowFaceMon = class (TGasKuDeGi)
   public
      function   Light: integer; override;
   end;

   TCowFaceKing = class (TGasKuDeGi)
   public
      function   Light: integer; override;
   end;

   TZombiLighting = class (TGasKuDeGi)
   protected
   public
   end;
   TSuperiorGuard = class (TGasKuDeGi)
   protected
   public
   end;

   TExplosionDark = class (TGasKuDeGi)    //칠흑수
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;


   TExplosionSpider = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   TFlyingSpider = class (TSkeletonOma)//Size: 0x25C Address: 0x00461F38
   protected
   public
     procedure CalcActorFrame; override;
   end;
   TSculptureMon = class (TSkeletonOma)
   private
      AttackEffectSurface: TDirectDrawSurface;
      ax, ay, firedir: integer;
      ex, ey: Integer;
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
      procedure DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer); override;
      procedure Run; override;
   end;

   TSculptureKingMon = class (TSculptureMon)
   public
   end;

   TSmallElfMonster = class (TSkeletonOma)
   public
   end;

   TWarriorElfMonster = class (TSkeletonOma)
   private
      oldframe: integer;
   public
      procedure  RunFrameAction (frame: integer); override;
   end;
   //흑사왕
   TElectronicScolpionMon = class (TGasKuDeGi)//Size 0x274 0x3c
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   TBossPigMon = class (TGasKuDeGi)//0x3d
   protected
   public
      procedure LoadSurface; override;   
   end;
   TKingOfSculpureKingMon = class (TGasKuDeGi)//0x3e
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   TSkeletonKingMon = class (TGasKuDeGi)//0x3f   //해골반왕
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;   
   end;
   TSamuraiMon = class (TGasKuDeGi)//0x41
   protected
   public
   end;
   TSkeletonSoldierMon = class (TGasKuDeGi)//0x42 0x43 0x44
   protected
   public
   end;
   TSkeletonArcherMon = class (TArcherMon)//Size: 0x26C Address: 0x004623B4 //0x45
      AttackEffectSurface :TDirectDrawSurface;//0x25C
      bo260:Boolean;
      n264:integer;
      n268:integer;
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;
   TBanyaGuardMon = class (TSkeletonArcherMon)
     LightningTimer: TTimer;
   protected
     n26C:TDirectDrawSurface;
     EffectBSurface:TDirectDrawSurface;
     SitDown : Boolean;
   public
      procedure LightningTimerTimer(Sender: TObject); //석마수
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
      procedure DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer); override;
   end;

   TShineCaveMon = class (TSkeletonArcherMon)
   protected
     n26C:TDirectDrawSurface;
     n27C:TDirectDrawSurface;
     EffectBSurface:TDirectDrawSurface;
     EffectPront:TDirectDrawSurface;
   public
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
      procedure DrawProntEff (dsurface: TDirectDrawSurface; dx, dy: integer);  override;
      procedure DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer); override;
   end;


   TYehaGuardMon = class (TSkeletonArcherMon)     //여하신전
     LightningTimer: TTimer;
   protected
     n26C:TDirectDrawSurface;
     SitDown : Boolean;
   public
      procedure LightningTimerTimer(Sender: TObject);  //공작주
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TPet = class (TSkeletonArcherMon)     //영물
   protected
     n26C:TDirectDrawSurface;
   public
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TNamManMon = class (TSkeletonArcherMon)//
   protected
     n26C:TDirectDrawSurface;
     SitDown : Boolean;
   public
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;


   TMerMaidKingMon = class (TSkeletonArcherMon)//수어귀
   protected
     n26C:TDirectDrawSurface;
     SitDown : Boolean;
   public
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;



   TGumiBoss = class (TSkeletonArcherMon)
      n26C: TDirectDrawSurface;
      n270: TDirectDrawSurface;
      SpiderTimer: TTimer;
   protected
   public
      procedure SpiderTimerTimer(Sender: TObject);
      constructor Create; override;
      destructor  Destroy; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TStoneMonster = class (TSkeletonArcherMon)//Size: 0x270 0x4d 0x4b
     n26C:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TPotMon = class (TSkeletonArcherMon)//호중귀2
     n26C:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TIceHellMonster5 = class (TSkeletonArcherMon)//Size: 0x270 0x4d 0x4b
     n26C:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;
   TIceHellMonster6 = class (TSkeletonArcherMon)//Size: 0x270 0x4d 0x4b
     n26C:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;
   TExplosionMon = class (TCatMon)//폭마야차
   protected
   public
      procedure Run; override;
   end;
   TArcherMon2 = class (TCatMon)//석마야차
   protected
   public
      procedure Run; override;
   end;
   TPBOMA1Mon = class (TCatMon)//0x49
   protected
   public
      procedure Run; override;   
   end;
   TPBOMA6Mon = class (TCatMon)//0x4f      //오마석궁병
   protected
   public
      procedure Run; override;
   end;
   TAngel = class (TBanyaGuardMon)//Size: 0x27C 0x51
     m_npx2, m_npy2 :integer;
     m_BodySurface2: TDirectDrawSurface;
   protected
   public
      procedure  LoadSurface; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TDarkAngel = class (TBanyaGuardMon)//Size: 0x27C 0x51
   protected
   public
      procedure  LoadSurface; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;
   Tyounhon = class (TBanyaGuardMon)//Size: 0x27C 0x51
     n270:Integer;
     n274:Integer;
     n278:TDirectDrawSurface;
   protected
   public
      procedure  LoadSurface; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   Twino = class (TBanyaGuardMon)//Size: 0x27C 0x51
     n270:Integer;
     n274:Integer;
     n278:TDirectDrawSurface;
   protected
   public
      procedure  LoadSurface; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TGreatKing = class (TSkeletonArcherMon)//0x53   //염마태자
     n270:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TBossTreeMan = class (TSkeletonArcherMon)  //여하수
     n270:TDirectDrawSurface;
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TElectBossMon = class (TSkeletonArcherMon)//오마제사장
     LightningTimer: TTimer;
   protected
     n26C:TDirectDrawSurface;
     SitDown : Boolean;
   public
      destructor Destroy; override;
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TFireDragon = class (TSkeletonArcherMon)  //마룡
      LightningTimer: TTimer;
   protected
      AttackEffectSurface: TDirectDrawSurface;
   public
      procedure LightningTimerTimer(Sender: TObject);
      constructor Create; override;
      destructor  Destroy; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TDragonStatue = class (TSkeletonArcherMon) // 용석상
   protected
      AttackEffectSurface: TDirectDrawSurface;
   public
      constructor Create; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;
   TKhazardMon = class (TSkeletonOma)
   protected
   public
     procedure CalcActorFrame; override;
     constructor Create; override;
   end;
   TFrostTiger = class (TSkeletonOma)   //환영한호
    boActive:Boolean;
    boCasted:Boolean;
   protected
   public
     procedure Run; override;
     procedure CalcActorFrame; override;
     constructor Create; override;
     function   GetDefaultFrame (wmode: Boolean): integer; override;
   end;

   TJumaThunderMon = class (TSculptureMon)
   protected
     EffBackSurface: TDirectDrawSurface;
   public
     constructor Create; override;
     procedure LoadSurface; override;
     procedure DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure CalcActorFrame; override;
   end;

   TYimoogi = class (TGasKuDeGi)    //부룡금사
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
   end;

   TBlackFox = class (TGasKuDeGi)//Size 0x274 0x3c
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   TGuardianRock = class (TGasKuDeGi)//Size 0x274 0x3c
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   TRedEffect = class (TSculptureMon)    //월지
     EffectSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     constructor Create; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure LoadSurface; override;
   end;


   TExplosionSpider2 = class (TGasKuDeGi)
   protected
   public
     procedure CalcActorFrame; override;
//     constructor Create; override;
//     function   GetDefaultFrame (wmode: Boolean): integer; override;
     procedure LoadSurface; override;
   end;

   TGumimasin = class (TGasKuDeGi)
   protected
   public
//      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
   //   procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;


  { Tsudugui = class (TGasKuDeGi)
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
   end; }

  { Twallgi = class (TGasKuDeGi)
   protected
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure Run; override;
   end;     }



   TGreatFoxSpirit = class (TSkeletonArcherMon)
     LightningTimer: TTimer;

   protected
      AttackEffectSurface: TDirectDrawSurface;
   public
      procedure LightningTimerTimer(Sender: TObject);
      constructor Create; override;
      destructor  Destroy; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TFireLead = class (TSkeletonArcherMon)  //염화적귀
   protected
      AttackEffectSurface: TDirectDrawSurface;
   public
      constructor Create; override;
      destructor  Destroy; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TWindLead = class (TSkeletonArcherMon)  //마풍석괴
   protected
      AttackEffectSurface: TDirectDrawSurface;
      AttackEffectSurface2: TDirectDrawSurface;
   public
      constructor Create; override;
      destructor  Destroy; override;
      procedure Run; override;
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   TElement = class (TGasKuDeGi)
     n270:Integer;
     n274:Integer;
     n278:TDirectDrawSurface;
   protected
   public
      procedure LoadSurface; override;
      procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;


   THellGuard = class (TGasKuDeGi)//Size 0x260
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   THellMonster1 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   THellMonster2 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   THellMonster3 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   THellMonster4 = class (TGasKuDeGi)
    boCasted:Boolean;
   protected
   public
     procedure Run; override;
     procedure CalcActorFrame; override;
     constructor Create; override;
     function   GetDefaultFrame (wmode: Boolean): integer; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
   end;

   THellMonster5 = class (TGasKuDeGi)
    boCasted:Boolean;
   protected
   public
  //   procedure Run; override;
     procedure CalcActorFrame; override;
     constructor Create; override;
     function   GetDefaultFrame (wmode: Boolean): integer; override;
     procedure LoadSurface; override;
   end;

   TIceHellMonster1 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   TIceHellMonster = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
   end;

   TIceHellMonster2 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;
   TIceHellMonster3 = class (TGasKuDeGi)
   protected
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
   end;

   TWarriorH = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TWizardH = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
     procedure Run; override;
   end;

   TToaistH = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
     procedure Run; override;
   end;

   TAssassinH = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TWarriorM2 = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TWizardM2 = class (TBanyaGuardMon)
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
     procedure Run; override;
   end;

   TToaistF2 = class (TBanyaGuardMon)   //정연도사
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
     procedure Run; override;
   end;

   TAssassinM2 = class (TBanyaGuardMon)   //혁문객
     n270:Integer;
     n274:Integer;
     n26C:TDirectDrawSurface;
     m_npx2, m_npy2 :integer;
     m_WeaponSurface: TDirectDrawSurface;
     m_WeaponSurface2: TDirectDrawSurface;
     m_HairSurface: TDirectDrawSurface;
   protected
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TAchorMonster = class (TGasKuDeGi)//Size 0x274 0x3c
   private
   protected
   public
      procedure CalcActorFrame; override;
      procedure Run; override;
   end;

   TJobking = class (TGasKuDeGi)//양용왕
   private
   protected
   public
     procedure CalcActorFrame; override;
   end;


implementation

uses
   ClMain, SoundUtil, WIL, MShare;


{============================== TSkeletonOma =============================}
{--------------------------}


constructor TSkeletonOma.Create;
begin
   inherited Create;
   EffectSurface := nil;
   AttackEffectSurface:=nil;
   m_boUseEffect := FALSE;
end;

procedure TSkeletonOma.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_nCurrentFrame := -1;
   m_boReverseFrame := FALSE;
   m_boUseEffect := FALSE;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN:
         begin
            if m_btRace in [106] then SitDown := False; // 이무기
            if m_btRace in [107,108,216,217,218,28,92] then m_nStartFrame := pm.ActStand.start  //호기연 호기옥
            else
            m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            if m_btRace in [105,152] then m_dwFrameTime := 200; //환영한호,거미(신석독마주) 프레임속도
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
            if m_btRace in [107,108,216,217,218] then begin  //호기연 호기옥
               m_boUseEffect := TRUE;
               m_dwEffectStartTime := GetTickCount;
            end;
         end;
      SM_WALK, SM_BACKSTEP:
         begin

            if m_btRace in [106] then SitDown := False; // 환영한호, 이무기

            if m_btRace in [107,108,216,217,218,28,92] then m_nStartFrame := pm.ActWalk.start    //호기연 호기옥
            else
            m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            if m_btRace in [105,152] then m_dwFrameTime := 150; //환영한호,거미(신석독마주) 프레임속도
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_btRace in [107,108,216,217,218] then begin          //호기연 호기옥
               if (Random(3000) mod 3) = 1 then begin
                  if m_btRace = 107 then PlaySound(2551);
                  if m_btRace = 108 then PlaySound(2561);
               end;
               m_boUseEffect := TRUE;
               m_dwEffectStartTime := GetTickCount;
            end;

            if m_nCurrentAction = SM_WALK then
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_DIGUP:
         begin
            if m_btRace in [106] then SitDown := False;    //호기연 호기옥

            if (m_btRace = 23) or (m_btRace = 81) or (m_btRace = 82) or  (m_btRace in [216,217,218,234])  then begin //월령  혼령  //백골 //진골
               m_nStartFrame := pm.ActDeath.start;
            end else begin
               m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
            end;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := FALSE;
            if m_btRace in [216,217,218] then begin
               m_boUseEffect := False;
            end;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGDOWN:
         begin
            if m_btRace = 55 then begin     //신수
               m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
               m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
               m_dwFrameTime := pm.ActCritical.ftime;
               m_dwStartTime := GetTickCount;
               m_boReverseFrame := TRUE;
               //WarMode := FALSE;
               Shift (m_btDir, 0, 0, 1);
            end;

            if m_btRace in [106] then begin // 환영한호 //####
               SitDown := True;
               m_nStartFrame := 420 + m_btDir * 10;
               m_nEndFrame := m_nStartFrame + 3;
               m_dwFrameTime := 300;
               m_dwStartTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);
            end;

         end;
      SM_HIT,
      SM_FLYAXE,
      SM_LIGHTING:
         begin
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            if (m_btRace = 16) or (m_btRace = 54) then
               m_boUseEffect := TRUE;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            if m_btRace in [106] then SitDown := False; //환영한호, 이무기


            if m_btRace in [107,108,216,217,218,28,92] then m_nStartFrame := pm.ActStruck.start    //호기연 호기옥
            else

            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //pm.ActStruck.ftime;
            if m_btRace in [105,152] then m_dwFrameTime := 130; //거미(신석독마주) 프레임속도
            m_dwStartTime := GetTickCount;

            if m_btRace in [107,108,216,217,218] then begin
               m_boUseEffect := TRUE;
               m_dwEffectStartTime := GetTickCount;
            end;

            if m_btRace = 264 then PlaySound(4324); //곰
            if m_btRace = 265 then PlaySound(4334); //표범
         end;
      SM_DEATH:
         begin
            if m_btRace in [104,150,151,155] then m_boUseEffect := False; //주마격뢰장인경우
            if m_btRace in [107,108,216,217,218,28,92] then m_nStartFrame := pm.ActDie.start    //호기연 호기옥
            else
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            if m_btRace in [105,152] then m_dwFrameTime := 110; //거미(신석독마주) 프레임속도
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            if m_btRace in [107,108,216,217,218,28,92] then m_nStartFrame := pm.ActDie.start   //호기연 호기옥
            else
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            if m_btRace <> 22 then
               m_boUseEffect := TRUE;

            if m_btRace = 164 then begin  //격투괭이
              PlaySound2 (fightcat_die_cat);
            end;

            if m_btRace = 165 then begin   //불괭이
              PlaySound2 (firecat_die_cat);
            end;
            if m_btRace = 166 then begin   //창괭이
              PlaySound2 (spearcat_die_cat);
            end;
            if m_btRace = 167 then begin   //얼룩망치괭이
              PlaySound2 (hammercat_die_cat);
            end;

            if m_btRace = 169 then begin   //갑괭이
              PlaySound2 (armorcat_die_cat);
            end;
            if m_btRace = 264 then PlaySound(4325); //곰
            if m_btRace = 265 then PlaySound(4335); //표범
         end;
      SM_SKELETON:
         begin
            m_nStartFrame := pm.ActDeath.start;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_ALIVE:   //신수
         begin
            m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
         end;  
   end;
end;

function  TSkeletonOma.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      if m_wAppearance in [30..34, 151] then    //우면귀인 경우 시체가 사람을 덮는 것을 막기 위해
         m_nDownDrawLevel := 1;

      if m_boSkeleton then
         Result := pm.ActDeath.start
      else
      if m_btRace = 115 then begin  //비월천주
         Result := 417;
         m_boUseEffect := False;
      end else
      if m_btRace in [107,108,216,217,218,28,92] then begin      //호기연 호기옥
        Result := pm.ActDie.start + (pm.ActDie.frame - 1);
        m_boUseEffect := False;
      end else
      Result := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip) + (pm.ActDie.frame - 1);
   end else begin
     if SitDown and (m_btRace in [106]) then begin //이무기 ####
       m_nDefFrameCount := 4;
       if m_nCurrentDefFrame < 0 then cf := 0
       else if m_nCurrentDefFrame >= 4 then cf := 0
       else cf := m_nCurrentDefFrame;
       Result := 420 + m_btDir * 10 + cf;
     end else begin

      m_nDefFrameCount := pm.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;

         if m_btRace = 115 then begin      //비월천추
            case TempState of
               1: m_nStartFrame := 0;
               2: m_nStartFrame := 80;
               3: m_nStartFrame := 160;
               4: m_nStartFrame := 240;
               5: m_nStartFrame := 320;
            end;
            Result := m_nStartFrame + cf
         end
         else
      if m_btRace in [107,108,216,217,218,28,92] then     //호기연 호기옥
         Result := pm.ActStand.start + cf
      else
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;

     end;

    if m_btRace in [107,108,216,217,218] then begin   //호기연 호기옥
       m_boUseEffect := True;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := pm.ActStand.ftime;
    end;

      if m_btRace = 107 then           //호기연  호기옥
       m_nEffectFrame := 1500 + m_nCurrentFrame
      else
      if m_btRace = 108 then         //호기옥
       m_nEffectFrame := 1610 + m_nCurrentFrame;
      if m_btRace = 216 then         //구슬
       m_nEffectFrame := 3510 + m_nCurrentFrame;
      if m_btRace = 217 then         //구슬
       m_nEffectFrame := 3650 + m_nCurrentFrame;
      if m_btRace = 218 then         //구슬
       m_nEffectFrame := 3780 + m_nCurrentFrame;    

      if m_btRace = 115 then begin  //비월천추
         m_boUseEffect := True;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := pm.ActStand.ftime;
         m_nEffectFrame := 1710 + m_nCurrentFrame;
      end;

   end;


end;

procedure  TSkeletonOma.LoadSurface;
begin
   inherited LoadSurface;
   case m_btRace of
      14, 15, 17, 22, 53:
         begin
            if m_boUseEffect then
               EffectSurface := g_WMonImagesArr[2].GetCachedImage (DEATHEFFECTBASE + m_nCurrentFrame-m_nStartFrame, ax, ay);
         end;
      23:   //백골
         begin
            if m_nCurrentAction = SM_DIGUP then begin
               m_BodySurface := nil;
               EffectSurface := g_WMonImagesArr[3].GetCachedImage (m_nBodyOffset + m_nCurrentFrame, ax, ay);
               m_boUseEffect := TRUE;
            end else
               m_boUseEffect := FALSE;
         end;
      234:   //진골
         begin
            if m_nCurrentAction = SM_DIGUP then begin
               m_BodySurface := nil;
               EffectSurface := g_WKuLouImages.GetCachedImage (m_nBodyOffset + m_nCurrentFrame, ax, ay);
               m_boUseEffect := TRUE;
            end else
               m_boUseEffect := FALSE;
         end;
   end;

end;

procedure  TSkeletonOma.Run;
var
   prv: integer;
   m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)   then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            if m_btRace in [150,151] then m_boUseEffect := True
            else m_boUseEffect := FALSE;
         end;
      end;
      if m_btRace in [104, 155] then begin        //주마격뢰장
        if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
          if g_boEffect then begin
            PlayScene.NewMagic (self, MAGIC_DUN_THUNDER, MAGIC_DUN_THUNDER, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY, m_nTargetRecog, mtThunder, FALSE, 30, bofly);
            PlaySound (8301);
          end;
        end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


procedure TSkeletonOma.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
begin
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

   ceff := GetDrawEffectValue;

   if m_BodySurface <> nil then begin
     DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
   end;

   if g_BoEffect then begin
     if m_boUseEffect and (not (m_btRace in [104,150,151,155])) then       //주마격뢰장이 아니면..
     if EffectSurface <> nil then begin
      DrawBlend(dsurface,
        dx + ax + m_nShiftX,
        dy + ay + m_nShiftY,
        EffectSurface, 1);
      end;
   end;
end;


procedure TSkeletonOma.DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin
   if m_nState and $00000800 <> 0 then begin   //혈룡수
    idx := BLOODWATER + (m_nGenAniCount mod 2);
    d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
    if d <> nil then
      DrawBlend (dsurface, dx + ax + m_nShiftX, dy + 100 + ay + m_nShiftY, d, 1);
  end;
end;

{============================== TSkeletonOma =============================}
{--------------------------}


procedure  TDualAxeOma.Run;
var
   prv: integer;
   m_dwFrameTimetime: longword;
   meff: TFlyingAxe;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame-m_nStartFrame = AXEMONATTACKFRAME-4) then begin
            meff := TFlyingAxe (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mtFlyAxe));
            if meff <> nil then begin
               if m_btRace = 25 then
                 meff.ImgLib := g_WMonImagesArr[38]
               else  meff.ImgLib := g_WMonImagesArr[2];
               case m_btRace of
                  15: meff.FlyImageBase := FLYOMAAXEBASE;
                  22: meff.FlyImageBase := THORNBASE;
                  25: meff.FlyImageBase := 2410;    //서성이는궁병
               end;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


procedure  TWarriorElfMonster.RunFrameAction (frame: integer);
var
   meff: TMapEffect;
   event: TClEvent;
begin
   if m_nCurrentAction = SM_HIT then begin
      if (frame = 5) and (oldframe <> frame) then begin
         meff := TMapEffect.Create (WARRIORELFFIREBASE + 10 * m_btDir + 1, 5, m_nCurrX, m_nCurrY);
         meff.ImgLib := g_WMonImagesArr[17];
         meff.NextFrameTime := 100;
         PlayScene.m_EffectList.Add (meff);
      end;
      oldframe := frame;
   end;
end;


{--------------------------}


procedure TCatMon.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
begin
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

   ceff := GetDrawEffectValue;

   if m_BodySurface <> nil then
     if m_btRace in [91,232] then begin    //혼불 칼날바람
       DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff, 1);
     end else begin
      if (m_btRace = 81) {or (m_btRace = 82)} then //월령 혼령
        DrawEffSurface (dsurface, m_BodySurface, dx + m_npx + m_nShiftX, dy + m_npy + m_nShiftY, False, ceNone)
      else
        DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
     end;
end;

procedure TCatMon.DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin
   if m_nState and $00000800 <> 0 then begin   //혈룡수
    idx := BLOODWATER + (m_nGenAniCount mod 2);
    d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
    if d <> nil then
      DrawBlend (dsurface, dx + ax + m_nShiftX, dy + 100 + ay + m_nShiftY, d, 1);
  end;
end;

{============================= TArcherMon =============================}


procedure TArcherMon.Run;       //궁수
var
   prv: integer;
   m_dwFrameTimetime: longword;
   meff: TFlyingAxe;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

            meff := TFlyingArrow (PlayScene.NewFlyObject (self,    //궁수
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mtFlyArrow));
            if meff <> nil then begin
               meff.ImgLib := g_WEffectImg;
               meff.NextFrameTime := 30;
               meff.FlyImageBase := ARCHERBASE2;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


{============================= TZombiDigOut =============================}


procedure TZombiDigOut.RunFrameAction (frame: integer);
var
   clevent: TClEvent;
begin
   if m_nCurrentAction = SM_DIGUP then begin
      if frame = 6 then begin
         clevent := TClEvent.Create (m_nCurrentEvent, m_nCurrX, m_nCurrY, ET_DIGOUTZOMBI);
         clevent.m_nDir := m_btDir;
         EventMan.AddEvent (clevent);
         //pdo.DSurface := g_WMonImagesArr[5].GetCachedImage (ZOMBIDIGUPDUSTBASE+Dir, pdo.px, pdo.py);
      end;
   end;
end;


{============================== THuSuABi =============================}

{--------------------------}


procedure  THuSuABi.LoadSurface;
begin
   inherited LoadSurface;
   if m_boUseEffect then
      EffectSurface := g_WMonImagesArr[2].GetCachedImage (DEATHFIREEFFECTBASE + m_nCurrentFrame-m_nStartFrame, ax, ay);
end;


{============================== TGasKuDeGi =============================}
{--------------------------}


constructor TGasKuDeGi.Create;
begin
   inherited Create;
   AttackEffectSurface := nil;
   DieEffectSurface := nil;
   m_boUseEffect := FALSE;
   BoUseDieEffect := FALSE;
end;

procedure TGasKuDeGi.CalcActorFrame;
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN:
         begin
            m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := pm.ActStand.frame;

            Shift (m_btDir, 0, 0, 1);
         end;
      SM_WALK:
         begin
            m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_WALK then
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else  //sm_backstep
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_HIT,
      SM_LIGHTING:
         begin
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            firedir := m_btDir;
            m_nEffectFrame := m_nStartFrame;
            m_nEffectStart := m_nStartFrame;
            if m_btRace = 20 then
              m_nEffectEnd := m_nEndFrame + 1
            else
            m_nEffectEnd := m_nEndFrame;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;

            actor := PlayScene.FindActor (m_nTargetRecog);
            if actor <> nil then begin
               PlayScene.ScreenXYfromMCXY (m_nCurrX, m_nCurrY, scx, scy);
               PlayScene.ScreenXYfromMCXY (actor.m_nCurrX, actor.m_nCurrY, stx, sty);
               fire16dir := GetFlyDirection16 (scx, scy, stx, sty);
            end else
               fire16dir := firedir * 2;
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //pm.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            {
            if m_btRace = 40 then
               BoUseDieEffect := TRUE;
            }
            if (m_btRace = 40) or (m_btRace = 65) or (m_btRace = 66) or (m_btRace = 67) or (m_btRace = 68) or (m_btRace = 69) then
               BoUseDieEffect := TRUE;
         end;
      SM_SKELETON:
         begin
            m_nStartFrame := pm.ActDeath.start;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

function  TGasKuDeGi.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      if m_boSkeleton then
         Result := pm.ActDeath.start
      else Result := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip) + (pm.ActDie.frame - 1);
   end else begin
      m_nDefFrameCount := pm.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;
   end;
end;

procedure  TGasKuDeGi.LoadSurface;
begin
   inherited LoadSurface;
   case m_btRace of
      //묑샌槻벎
      16://떪협
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[2].GetCachedImage (
                        KUDEGIGASBASE-1 + (firedir * 10) + m_nEffectFrame-m_nEffectStart,
                        ax, ay);
         end;
      20://삽落怪쯔
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[3].GetCachedImage (
                        COWMONFIREBASE + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;
      21://怪쯔싱寮
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[3].GetCachedImage (
                        COWMONLIGHTBASE + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;
      24:
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[0].GetCachedImage (
                        SUPERIORGUARDBASE + (m_btDir * 8) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;

      40://쉘暇1
         begin
            if m_boUseEffect then begin
               AttackEffectSurface := g_WMonImagesArr[4].GetCachedImage (
                        ZOMBILIGHTINGBASE + (fire16dir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
            end;
            if BoUseDieEffect then begin
               DieEffectSurface := g_WMonImagesArr[4].GetCachedImage (
                        ZOMBIDIEBASE + m_nCurrentFrame-m_nStartFrame, //
                        bx, by);
            end;
         end;
      52://珪띔
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[3].GetCachedImage (
                        MOTHPOISONGASBASE + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;
      53://룅녔
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[2].GetCachedImage (
                        DUNGPOISONGASBASE + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;
      64: begin
        if m_boUseEffect then begin
          AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                        720 + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
        end;
      end;
      65: begin
        if BoUseDieEffect then begin
          DieEffectSurface:= g_WMonImagesArr[19].GetCachedImage (
                        350 + m_nCurrentFrame-m_nStartFrame, bx, by);
        end;
      end;
      66: begin
        if BoUseDieEffect then begin
          DieEffectSurface:= g_WMonImagesArr[19].GetCachedImage (
                        1600 + m_nCurrentFrame-m_nStartFrame, bx, by);
        end;
      end;
      67: begin
        if BoUseDieEffect then begin
          DieEffectSurface:= g_WMonImagesArr[19].GetCachedImage (
                        1160 + (m_btDir * 10) + m_nCurrentFrame-m_nStartFrame, bx, by);
        end;
      end;
      68: begin
        if BoUseDieEffect then begin
          DieEffectSurface:= g_WMonImagesArr[19].GetCachedImage (
                        1600 + m_nCurrentFrame-m_nStartFrame, bx, by);
        end;
      end;
      122://연혼괴수
         begin
              if m_boUseEffect then begin
               AttackEffectSurface := g_WMonImagesArr[13].GetCachedImage (
                        3500 + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
            end;
         end;
   end;
end;

procedure  TGasKuDeGi.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   //
   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            BoUseDieEffect := FALSE;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


procedure TGasKuDeGi.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
begin
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

   ceff := GetDrawEffectValue;

   if m_BodySurface <> nil then
      DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);

end;

procedure TGasKuDeGi.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
begin
   if m_boUseEffect then
     if AttackEffectSurface <> nil then begin
        DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    AttackEffectSurface, 1);
     end;


   if BoUseDieEffect then
      if DieEffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + bx + m_nShiftX,
                    dy + by + m_nShiftY,
                    DieEffectSurface, 1);
      end;
end;



{-----------------------------------------------------------}

function  TFireCowFaceMon.Light: integer;
var
   l: integer;
begin
   l := m_nChrLight;
   if l < 2 then begin
      if m_boUseEffect then
         l := 2;
   end;
   Result := l;
end;

function  TCowFaceKing.Light: integer;
var
   l: integer;
begin
   l := m_nChrLight;
   if l < 2 then begin
      if m_boUseEffect then
         l := 2;
   end;
   Result := l;
end;


{-----------------------------------------------------------}

//procedure TZombiLighting.Run;


{-----------------------------------------------------------}


procedure TSculptureMon.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_boUseEffect := FALSE;

   case m_nCurrentAction of
      SM_TURN:
         begin
            if (m_nState and STATE_STONE_MODE) <> 0 then begin
               if (m_btRace = 48) or (m_btRace = 49) then
                  m_nStartFrame := pm.ActDeath.start // + Dir * (pm.ActDeath.frame + pm.ActDeath.skip)
               else
                  m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
               m_nEndFrame := m_nStartFrame;
               m_dwFrameTime := pm.ActDeath.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := pm.ActDeath.frame;
            end else begin
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := pm.ActStand.frame;
            end;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_WALK, SM_BACKSTEP:
         begin
            if m_btRace in [150,151] then m_boUseEffect := True;
            m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := FALSE;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_WALK then
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else  //sm_backstep
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_DIGUP:
         begin
            if (m_btRace = 48) or (m_btRace = 49) then begin
               m_nStartFrame := pm.ActDeath.start;
            end else begin
               m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
            end;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := FALSE;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HIT:
         begin
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            if m_btRace in [150,151] then m_boUseEffect := True;
            if m_btRace = 49 then begin
               m_boUseEffect := TRUE;
               firedir := m_btDir;
               m_nEffectFrame := 0; //startframe;
               m_nEffectStart := 0; //startframe;
               m_nEffectEnd := m_nEffectStart + 8;
               m_dwEffectStartTime := GetTickCount;
               m_dwEffectFrameTime := m_dwFrameTime;
            end;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            if m_btRace in [150,151] then m_boUseEffect := True;
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //pm.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_DEATH:
         begin
            if m_btRace in [150,151] then m_boUseEffect := False;
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
           if m_btRace in [150,151] then m_boUseEffect := False;
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

procedure  TSculptureMon.LoadSurface;
begin
   inherited LoadSurface;
   case m_btRace of
      48, 49:
         begin
            if m_boUseEffect then
               AttackEffectSurface := g_WMonImagesArr[6].GetCachedImage (
                        SCULPTUREFIREBASE + (firedir * 10) + m_nEffectFrame-m_nEffectStart, //
                        ax, ay);
         end;
   end;
end;

function  TSculptureMon.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
   effectframetimetime, frametimetime: longword;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      Result := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip) + (pm.ActDie.frame - 1);
   end else begin
      if (m_nState and STATE_STONE_MODE) <> 0 then begin
         case m_btRace of
            47, 150: Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
            48, 49, 151: Result := pm.ActDeath.start;
            104, 155: begin           //주마격뢰장
              m_boUseEffect := False;
              Result := 420 + m_btDir * 10;
            end;
         end;
      end else begin
         m_nDefFrameCount := pm.ActStand.frame;
         if m_nCurrentDefFrame < 0 then cf := 0
         else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
         else cf := m_nCurrentDefFrame;
         Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;

         if m_btRace in [104,155] then begin         //주마격뢰장
           if Not m_boUseEffect then begin
             if m_btRace = 155 then begin
               m_neffectframe := 3650 + m_btDir * 10;
               m_neffectstart := 3650 + m_btDir * 10;
             end else begin
               m_neffectframe := 940 + m_btDir * 10;
               m_neffectstart := 940 + m_btDir * 10;
             end;
             m_neffectend := m_neffectstart + pm.ActStand.frame-1;//endframe;
             m_dweffectstarttime := GetTickCount;
             m_dweffectframetime := pm.ActStand.ftime+50;
           end;
           m_boUseEffect := True;
           effectframetimetime := m_dweffectframetime;
           if GetTickCount - m_dweffectstarttime > effectframetimetime-50 then begin
             // 50빼는 이유는 run에서도 effectstarttime 값이 변하기 때문에 먼저 루틴을 타기위해..
             m_dweffectstarttime := GetTickCount;
             if m_neffectframe < m_neffectend then begin
                Inc (m_neffectframe);
             end else begin
                m_boUseEffect := FALSE;
             end;
           end;
         end;

      end;
   end;
end;

procedure TSculptureMon.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
begin
  if g_boEffect then begin
   if m_boUseEffect then
      if AttackEffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    AttackEffectSurface, 1);
      end;
  end;
end;

procedure TSculptureMon.DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
var
  idx: Integer;
  d: TDirectDrawSurface;
begin
  if m_boUseEffect then
    if AttackEffectSurface <> nil then begin
      DrawBlend(dsurface,
        dx + ax + m_nShiftX,
        dy + ay + m_nShiftY,
        AttackEffectSurface, 1);
    end;
end;


procedure TSculptureMon.Run;
var
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   if m_boUseEffect then begin
      m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
           if not m_btRace in [150,151] then
            m_boUseEffect := FALSE;
         end;
      end;
   end;
   inherited Run;
end;


{ TBanyaGuardMon }

constructor TBanyaGuardMon.Create;
begin
  inherited Create;
  n26C:=nil;
  EffectBSurface  := nil;
  if m_btRace in [100,159] then begin
    LightningTimer := TTimer.Create (nil);   //석마수  야수왕
    LightningTimer.Interval := 10;
    LightningTimer.Tag := 0;
    LightningTimer.OnTimer := LightningTimerTimer;
    LightningTimer.Enabled := False;
  end;
end;

destructor TBanyaGuardMon.Destroy;
begin
  if m_btRace in [100,159] then begin //석마수  야수왕
    if LightningTimer <> nil then LightningTimer.Free;   //석마수
  end;
  inherited Destroy;
end;

procedure TBanyaGuardMon.LoadSurface;
begin
  inherited;
  if bo260 then begin   //죽었을때 이팩트 표시하는것들,
    case m_btRace of
      70: begin //반야우사
        AttackEffectSurface := g_WMonImagesArr[20].GetCachedImage (
                        2320 + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);
      end;
      71: begin //반야좌사
        AttackEffectSurface := g_WMonImagesArr[20].GetCachedImage (
                        2870 + (m_btDir * 10) + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);

      end;

      78: begin //파황마신
        AttackEffectSurface := g_WMonImagesArr[21].GetCachedImage (
                        3120 + (m_btDir * 20) +  m_nCurrentFrame - m_nStartFrame,
                        n264, n268);
      end;

      106:begin //황금이무기 //#### 환미룡사, 청영사
        AttackEffectSurface := g_WMonImagesArr[22].GetCachedImage (
                        2900 + m_nCurrentFrame-m_nStartFrame,
                        n264, n268);
      end;
      107:   begin //호기연(소)
        AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                        1540 + m_nCurrentFrame-m_nStartFrame, n264, n268);
      end;
      108:   begin //호기연(대)
        AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                        1650 + m_nCurrentFrame-m_nStartFrame, n264, n268);
      end;

      216:   begin //구슬
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                        3540 + m_nCurrentFrame-m_nStartFrame, n264, n268);
      end;
      217:   begin //구슬
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                        3680 + m_nCurrentFrame-m_nStartFrame, n264, n268);
      end;
      218:   begin //구슬
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                        3810 + m_nCurrentFrame-m_nStartFrame, n264, n268);
      end;

      46,111,112:  begin //비월여우죽는 임펙트  비월적호, 비월소호
        AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                        340 + m_nCurrentFrame-m_nStartFrame, n264, n268);
         if (m_nCurrentFrame - m_nStartFrame ) = 0 then PlaySound (10420);
      end;


      134: begin //역천귀
        AttackEffectSurface := g_WMonImagesArr[31].GetCachedImage (
                        5240  + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);

      end;
      137: begin //한천귀
        AttackEffectSurface := g_WMonImagesArr[32].GetCachedImage (
                        980 + (m_btDir * 10) + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);

      end;

      159: begin //석마수
        AttackEffectSurface := g_WMonImagesArr[25].GetCachedImage (
                        3580 + (m_btDir * 20) + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);

      end;

      187: begin //각섬
        AttackEffectSurface := g_WMonImagesArr[35].GetCachedImage (
                        1010 + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);
      end;

      190: begin  //땅두꺼비
        AttackEffectSurface := g_WMonImagesArr[35].GetCachedImage (
                        3620 + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);
      end;

      1,2,100,119,126,135,139..144,147,158,164..167,   //어창인  ,어법인 ,어월인  ,토견 ,호토견  ,인용 , 의인충 , 인간수, 문조인 ,작은뿔서우인
      169,174,176,177,180..184,188,191..194: begin    //흑천귀 ,광한시, 백상, 흑호, 백호, 흑성성 , 서우 ,야공수호귀
       bo260 := False;    //죽음 이팩 x
       m_boUseEffect := False;
      end;

      152: EffectBSurface := nil;
    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of
        1:  begin //검은흑성성
          case m_nCurrentAction of
            SM_LIGHTING: begin //close range attack
              n26C := g_WMonImagesArr[36].GetCachedImage (
                            5060 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        2:  begin //이두흑호
          case m_nCurrentAction of
            SM_LIGHTING: begin
              n26C := g_WMonImagesArr[36].GetCachedImage (
                            5630 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;

        56: begin //수호귀사
          case m_nCurrentAction of
            SM_LIGHTING: begin //close range attack
              n26C := g_WMonImagesArr[30].GetCachedImage (
                            4091 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        58: begin  //환사 소환
             case m_nCurrentAction of
               SM_HIT: begin   
                  m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin   //환사 독무
                n26C := g_WMonImagesArr[30].GetCachedImage (
                            5221 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_1: begin
                n26C := g_WMonImagesArr[30].GetCachedImage (
                            5141 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
         end;

        59: begin //비호귀마
          case m_nCurrentAction of
            SM_LIGHTING: begin //close range attack
              n26C := g_WMonImagesArr[30].GetCachedImage (
                            5812 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;


        70: begin //반야우사
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[20].GetCachedImage (
                            2230 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        71: begin
          case m_nCurrentAction of    //반야좌사
            SM_HIT: begin //close range attack
              n26C := g_WMonImagesArr[20].GetCachedImage (
                            2780 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_LIGHTING:begin
            n26C := g_WMonImagesArr[20].GetCachedImage (
                            2960 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;
        72: begin       //사우천왕
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[20].GetCachedImage (
                            3490 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        78: begin
          if m_nCurrentAction = SM_HIT then begin         //파황마신
            n26C := g_WMonImagesArr[21].GetCachedImage (
                            3440 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        100: begin //야수왕
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[22].GetCachedImage (
                            5372 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;

          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[22].GetCachedImage (
                            5292 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;

          if m_nCurrentAction = SM_LIGHTING_2 then begin
            n26C := g_WMonImagesArr[22].GetCachedImage (
                            5450 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;

        end;

        105: // 거미
            begin
                if m_nCurrentAction = SM_LIGHTING then begin
                   m_boUseEffect := TRUE;
                   n26C := g_WMonImagesArr[22].GetCachedImage (
                      2230 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart, ax, ay);
                end
                else m_boUseEffect := False;
            end;

        106: //이무기
             if m_nCurrentAction in [SM_LIGHTING, SM_LIGHTING_1] then begin
                   m_boUseEffect := TRUE;
                   n26C := g_WMonImagesArr[22].GetCachedImage (
                      2820 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart, ax, ay);
             end else m_boUseEffect:= False;
        107: //호기연 임펙트
             begin
                if not bo260 then begin
                   m_dwEffectFrameTime := m_dwFrameTime;
                   n26C := g_WMonImagesArr[23].GetCachedImage (
                      1500 + m_nCurrentFrame, ax, ay);
                end;
             end;

        108: //호기옥 임펙트
             begin
                if not bo260 then begin

                   m_dwEffectFrameTime := m_dwFrameTime;
                   n26C := g_WMonImagesArr[23].GetCachedImage (
                      1610 + m_nCurrentFrame, ax, ay);
                end;
             end;

        216: //구슬
             begin
                if (not bo260) then begin
                   m_dwEffectFrameTime := m_dwFrameTime;
                   n26C := g_WMonImagesArr[37].GetCachedImage (
                      3510 + m_nCurrentFrame, ax, ay);
                end;
             end;
        217: //구슬
             begin
                if (not bo260) then begin
                   m_dwEffectFrameTime := m_dwFrameTime;
                   n26C := g_WMonImagesArr[37].GetCachedImage (
                      3650 + m_nCurrentFrame, ax, ay);
                end;
             end;
        218: //구슬
             begin
                if (not bo260) then begin
                   m_dwEffectFrameTime := m_dwFrameTime;
                   n26C := g_WMonImagesArr[37].GetCachedImage (
                      3780 + m_nCurrentFrame, ax, ay);
                end;
             end;

        109: begin  //전사비월여우 크리티컬 임펙트
             if  m_nCurrentAction = SM_LIGHTING then begin
                AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                   350 + (m_btDir * 10) + m_nCurrentFrame-m_nEffectStart, ax, ay);
             end;
        end;
        112: begin  //도사비월여우 소환 임펙트
             if  m_nCurrentAction = SM_LIGHTING_2 then begin
                AttackEffectSurface := g_WMagic2Images.GetCachedImage (m_nCurrentFrame, ax, ay);
             end;
        end;

        119: begin //서괴
          case m_nCurrentAction of
            SM_HIT: begin //close range attack
              n26C := g_WMonImagesArr[13].GetCachedImage (
                            2320 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        120: begin //광서괴
          case m_nCurrentAction of
            SM_HIT: begin //close range attack
              n26C := g_WMonImagesArr[13].GetCachedImage (
                            2910 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        134: begin //역천귀
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[31].GetCachedImage (
                            5082 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[31].GetCachedImage (
                            5160 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        135: begin //흑천귀
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[31].GetCachedImage (
                            5851 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[31].GetCachedImage (
                            5930 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        137: begin //한천귀
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            890 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            970 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        139: begin //광한시
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            1851 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_2 then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            1930 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        140: begin //백상
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            2530 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        141: begin //남만흑호
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            2981 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        142: begin //남만백호
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            3501 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        143: begin //흑성성
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            4019 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        144: begin //서우
          if m_nCurrentAction = SM_HIT then begin
                  m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            4630 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_2 then begin
            n26C := g_WMonImagesArr[32].GetCachedImage (
                            4620 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        147: begin //야공수호귀
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[29].GetCachedImage (
                            1850 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[29].GetCachedImage (
                            1870 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;
        152: // 월지 거미
            begin
                if m_nCurrentAction = SM_LIGHTING then begin
                   m_boUseEffect := TRUE;
                   n26C := g_WMonImagesArr[26].GetCachedImage (
                      2200 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart, ax, ay);
                end
                else m_boUseEffect := False;

                EffectBSurface := g_WEffectImg.GetCachedImage (600, ex, ey);
            end;

        164: begin //격투괭이
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            338 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        165: begin //불괭이
          if m_nCurrentAction = SM_HIT then begin
             m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            850 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        166: begin //창괭이
          if m_nCurrentAction = SM_HIT then begin
             m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            1358 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        167: begin //얼룩망치괭이
          if m_nCurrentAction = SM_HIT then begin
             m_boUseEffect:= False;
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            1850 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        169: begin //갑괭이
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            4190 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            4350 + (m_btDir * 20) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_2 then begin
            n26C := g_WMonImagesArr[33].GetCachedImage (
                            4110 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;


        174: begin //인면수
          if m_nCurrentAction = SM_HIT then begin
             n26C := g_WMonImagesArr[5].GetCachedImage (
                            3082 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        176: begin //호중천
          if m_nCurrentAction = SM_HIT then begin        //주변공격
             n26C := g_WMonImagesArr[34].GetCachedImage (
                            560 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin   //1인공격
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            570 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_2 then begin     //원거리
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            650 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_3 then begin    //밀어내기
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            840 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        177: begin //진묘장군
          if m_nCurrentAction = SM_HIT then begin        //일반공격
             n26C := g_WMonImagesArr[34].GetCachedImage (
                            1420 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING then begin   //1인공격
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            1500 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_2 then begin     //원거리 번개
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            840 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
          if m_nCurrentAction = SM_LIGHTING_3 then begin     //꼬봉소환
            n26C := g_WMonImagesArr[34].GetCachedImage (
                            1600 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;

        181: begin  //어법인   - 물공격
          case m_nCurrentAction of
            SM_HIT: begin
               m_boUseEffect:= False;
            end;
            SM_LIGHTING: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            3820 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        182: begin  //어월인
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            4390 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_LIGHTING: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            4470 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        183: begin //토견
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            5208 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_LIGHTING: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            5290 + (m_btDir * 20) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;
        184: begin //호토견
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[34].GetCachedImage (
                            6268 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_LIGHTING: begin
              m_boUseEffect:= False;
            end;
          end;
        end;

        188: begin //인용
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[35].GetCachedImage (
                            1740 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_LIGHTING: begin
              n26C := g_WMonImagesArr[35].GetCachedImage (
                            1820 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        193: begin //문조인
          if m_nCurrentAction = SM_HIT then begin
            m_boUseEffect:= False;
          end;

          if m_nCurrentAction = SM_LIGHTING then begin
            m_boUseEffect:= False;
          end;

          if m_nCurrentAction = SM_LIGHTING_2 then begin
            n26C := g_WMonImagesArr[35].GetCachedImage (
                            5270 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;

        end;


        194: begin //작은뿔서우인
          if m_nCurrentAction = SM_HIT then begin
            n26C := g_WMonImagesArr[35].GetCachedImage (
                            5770 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;

          if m_nCurrentAction = SM_LIGHTING then begin
            n26C := g_WMonImagesArr[35].GetCachedImage (
                            5850 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
          end;
        end;




      end;
    end;
  end;
end;

procedure TBanyaGuardMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       if m_btRace = 106 then SitDown := False;
       Shift (m_btDir, 0, 0, 1);
       if m_btRace in [107,108,216,217,218] then m_nStartFrame := pm.ActAttack.start
       else
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       if m_btRace = 105 then m_dwFrameTime := 130; //거미(신석독마주) 프레임속도
       if m_btRace = 106 then m_dwFrameTime := 100;
       if m_btRace = 152 then m_dwFrameTime := 120; //거미(신석독마주) 프레임속도
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;

       if m_btRace in [46,111,112] then  m_boUseEffect := False     //비월적호
       else m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;

       if m_btRace in [216] then begin
         m_boUseEffect := TRUE;
         m_BoUseMagic := False;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
         m_nEffectFrame := 3520;
         m_nEffectStart := 3520;
         m_nEffectEnd := 3526;
       end;
       if m_btRace in [217] then begin
         m_boUseEffect := TRUE;
         m_BoUseMagic := False;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
         m_nEffectFrame := 3660;
         m_nEffectStart := 3660;
         m_nEffectEnd := 3666;
       end;
       if m_btRace in [218] then begin
         m_boUseEffect := TRUE;
         m_BoUseMagic := False;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
         m_nEffectFrame := 3790;
         m_nEffectStart := 3790;
         m_nEffectEnd := 3796;
       end;    

       if m_btRace = 147 then begin    //야공수호귀
         PlaySound (3146);
       end;

       if m_btRace = 158 then begin    //조인상
         PlaySound (2798);
       end;

       if m_btRace = 164 then begin    //격투괭이
         PlaySound2 (fightcat_att);
       end;

       if m_btRace = 165 then begin    //불괭이
         PlaySound2 (firecat_att);
       end;

       if m_btRace = 166 then begin    //창괭이
         PlaySound2 (spearcat_att);
       end;

       if m_btRace = 169 then begin    //갑괭이
         PlaySound2 (armorcat_att2);
       end;

       if m_btRace = 159 then begin  //석마수
         PlaySound (2786);
       end;

       if m_btRace = 100 then begin  //야수왕
         PlaySound (2497);
       end;

       if m_btRace = 176 then begin  //호중천
         PlaySound (3602);
       end;

       if m_btRace = 190 then begin  //땅두꺼비
         PlaySound (3756);
       end;

     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin

       if m_btRace =106 then SitDown := False; //이무기
       if m_btRace in [107,108,216,217,218] then  m_nStartFrame:= pm.ActCritical.start
       else
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_nCurEffFrame:=0;
       m_boUseEffect := TRUE;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);


      if (m_btRace in [46,111]) then begin //전사비월여우,술사비월여우 크리티컬 동작 공격동작으로      //비월적호
        m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
        m_nEndFrame   := m_nStartFrame + pm.ActAttack.frame - 1;
        m_dwFrameTime  := pm.ActAttack.ftime;
        m_dwStartTime  := GetTickCount;
      end;

      if (m_btRace <> 70) then begin //this hopefully fixes deva , 78 = omaking he's the only mob that uses this that CANT do effect while casting magic
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else
       if m_btRace in [105,152] then begin //New거미 마법 임펙트
         m_boUseEffect := TRUE;
         m_nEffectFrame := 420 + m_btDir * 10;
         m_nEffectStart := m_nEffectFrame;
         m_nEffectEnd   := m_nEffectFrame+9;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end
       else if m_btRace = 106 then begin // 이무기
         m_boUseEffect := TRUE;
         m_nEffectFrame := 500 + m_btDir * 10;
         m_nEffectStart := m_nEffectFrame;
         m_nEffectEnd   := m_nEffectFrame+5;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else
       if (m_btRace in [71,57]) then begin //반야 좌사만 이펙트가 있음
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd   := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else
       if m_btRace in [107,108] then begin
         m_boUseEffect := TRUE;
         m_BoUseMagic := False;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
         if m_btRace = 107 then
          PlaySound (2552);
          m_nEffectFrame := 1520;
          m_nEffectStart := 1520;
          m_nEffectEnd := 1529;
          if m_btRace = 108 then begin
            PlaySound (2562);
            m_nEffectFrame := 1630;
            m_nEffectStart := 1630;
            m_nEffectEnd := 1639;
          end;
       end;

       if m_btRace = 1 then PlaySound (3876);  //검은흑성성
       if m_btRace = 2 then PlaySound (3886);  //이두흑호

       if m_btRace = 140 then begin //백상
        PlaySound (3446);
       end;
       if m_btRace = 141 then begin //남만흑호
        PlaySound (3456);
       end;
       if m_btRace = 142 then begin //남만백호
        PlaySound (3466);
       end;
       if m_btRace = 143 then begin //흑성성
        PlaySound (3476);
       end;
       if m_btRace = 144 then begin //서우
        PlaySound (3486);
       end;
       if m_btRace = 147 then begin  //야공수호귀
        PlaySound (3148);
       end;
       if m_btRace = 158 then begin  //조인상
        PlaySound (2796);
       end;
       if m_btRace = 165 then begin  //불괭이
        PlaySound2 (firecat_att2);
       end;
       if m_btRace = 166 then begin  //창괭이
        PlaySound2 (spearcat_att2);
       end;
       if m_btRace = 167 then begin  //얼룩망치괭이
        PlaySound2 (hammercat_att);
       end;
       if m_btRace = 169 then begin    //갑괭이
        PlaySound2 (armorcat_att3);
       end;


       if m_btRace = 100 then begin    //야수왕
        PlaySound (2497);
       end;
       if m_btRace = 176 then begin  //호중천
         PlaySound (3607);
       end;

       if m_btRace = 190 then begin  //땅두꺼비
         PlaySound (3757);
       end;

       if m_btRace = 191 then begin  //의인충
         PlaySound (3766);
       end;
       if m_btRace = 193 then begin  //문조인
         PlaySound (3786);
       end;

       if m_btRace = 194 then begin  //작은뿔서우인
         PlaySound (3796);
       end;

       if m_btRace = 78 then
        m_boUseEffect:=FALSE;
     end;
     SM_LIGHTING_2:
         begin
             if m_btRace in [100,176,177,193] then begin
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              if m_btRace = 100 then begin
               PlaySound (2498);
              end;
              if m_btRace = 176 then begin  //호중천
               PlaySound (3608);
              end;
              if m_btRace = 177 then begin  //진묘장군
               PlaySound (3617);
              end;
              if m_btRace = 193 then begin  //문조인
                 PlaySound (3787);
              end;
            end;

            if m_btRace = 112 then begin  //비월소호

               m_nStartFrame := 420 + m_btDir * 10;
               m_nEndFrame   := m_nStartFrame + 9;
               m_dwFrameTime  := pm.ActCritical.ftime;
               m_dwStartTime  := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);

               m_boUseEffect := TRUE;
               m_nEffectFrame := 0;
               m_nEffectStart := 0;
               m_nEffectEnd   := 10;
               m_dwEffectStartTime := GetTickCount;
               m_dwEffectFrameTime := m_dwFrameTime;
               PlaySound (2528);
            end;
            if (m_btRace = 139) then begin //광한시
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound (3436);
            end;

            if m_btRace = 140 then begin //백상
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound (3448);
            end;

            if m_btRace = 144 then begin //서우
              m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
              m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
              m_dwFrameTime := pm.ActAttack.ftime;
              m_dwStartTime := GetTickCount;
              m_dwWarModeTime := GetTickCount;

              m_nCurEffFrame:=0;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound (3482);
            end;

            if m_btRace = 159 then begin //석마수
              m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
              m_dwFrameTime := pm.ActCritical.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound (2788);
            end;

            if m_btRace = 169 then begin //갑괭이
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound2 (armorcat_att);
            end;

         end;
    SM_LIGHTING_3:
         begin
           if m_btRace = 100 then begin //야수왕
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              PlaySound (2497);
            end;

            if m_btRace in [176,177] then begin //호중천
              m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
              m_dwFrameTime := pm.ActCritical3.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;
              if m_btRace = 176 then begin  //호중천
               PlaySound (3609);
              end;
              if m_btRace = 177 then begin  //진묘장군
               PlaySound (3619);
              end;
            end;

         end;

     else begin
       inherited CalcActorFrame;
     end;
   end;

end;


procedure TBanyaGuardMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff : TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin      //야수왕
           if m_btRace in [100,159] then begin //석마수  야수왕
             if Not LightningTimer.Enabled then begin
                  LightningTimer.Enabled := True;
             end;
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 1)then begin      //석마수
           if m_btRace in [100,159] then begin //석마수  야수왕
             if Not LightningTimer.Enabled then begin
                  LightningTimer.Enabled := True;
             end;
           end;
           if m_btRace = 176 then begin //호중천
             meff := TFlyingFireBall (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mt12));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[34];
               meff.NextFrameTime := 120;
               meff.FlyImageBase:=670;
            end;
           end;

         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin
            if m_btRace = 58 then begin
                PlaySound(3277);
            end;

            if (m_btRace = 57) then begin //빙염귀장
              PlayScene.NewMagic (Self,1,39,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,False,30,bo11);
              PlaySound(10391);
            end;

            if(m_btRace = 106) then begin    //이무기 멸천화
                PlayScene.NewMagic (self,
                                      MAGIC_SERPENT_1,
                                      MAGIC_SERPENT_1,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,       //TargetX,
                                      m_nTargetY,       //TargetY,
                                      m_nTargetRecog,  //TargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (159);
                PlaySound (2449);//8101
            end;

            if (m_btRace in [46,111]) then begin    //술사비월여우:화염     //비월적호
                PlayScene.NewMagic (self,
                                      MAGIC_FOX_FIRE1,
                                      MAGIC_FOX_FIRE1,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (2517);
            end;

            if(m_btRace = 112) then begin    //도사비월여우:저주술
                PlayScene.NewMagic (self,
                                      MAGIC_FOX_CURSE,
                                      MAGIC_FOX_CURSE,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtExploBujauk,
                                      FALSE,
                                      30,
                                      bo11);
               m_nmagicfiresound  := 10131;
               m_nmagicexplosionsound := 2527;
            end;
         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

             if (m_btRace = 70) then begin //반야우사
               PlayScene.NewMagic (Self,7,9,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,False,30,bo11);
               PlaySound(10112);
             end;
             if (m_btRace = 71) then begin  //반야좌사
               PlayScene.NewMagic (Self,1,1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
               PlaySound(10012);
             end;
             if (m_btRace = 72) then begin    //사우천왕
               PlayScene.NewMagic (Self,11,32,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mt13,False,30,bo11);
               PlaySound(2276);
             end;
             if (m_btRace = 78) then begin   //파황마신
               FrmMain.UseNormalEffect (NE_OMAKING, self.m_nCurrX, self.m_nCurrY);
               PlaySound(2396);
             end;
             if (m_btRace = 81) then begin    //월령 강격
               PlayScene.NewMagic (Self,7,9,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,False,30,bo11);
               PlaySound(10112);
             end;
             if (m_btRace = 82) then begin    //혼령 암연술
               PlayScene.NewMagic (Self,1,4,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,False,30,bo11);
               PlaySound(10062);
             end;

             if (m_btRace in [105,152]) then begin
               PlaySound (2437);  //거미
             end;
             if m_btRace = 192 then begin       //인간수
                 PlayScene.NewMagic (self, MAGIC_FIREEXPLOSIN2, MAGIC_FIREEXPLOSIN2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
                 PlaySound (3776);
             end;

             if m_btRace = 167 then begin       //얼룩망치괭이
                 PlayScene.NewMagic (self, MAGIC_HAMMERCAT,MAGIC_HAMMERCAT,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
                 PlaySound (2526);
             end;

             if(m_btRace = 58) then begin    //환사귀장 독무
                PlayScene.NewMagic (self,
                                      92,
                                      92,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mt13,
                                      FALSE,
                                      120,
                                      bo11);
               PlaySound(10553);
               PlaySound(3278);
            end;

            if(m_btRace = 111) then begin    //술사비월여우 : 강격     //비월적호
                PlayScene.NewMagic (self,
                                      MAGIC_FOX_THUNDER, //11,
                                      MAGIC_FOX_THUNDER,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (2516);
            end;


            if (m_btRace = 46) then begin    //술사비월여우 : 낙염   //고대비월적호
               PlayScene.NewMagic (self,80,80,
               m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,
               m_nTargetRecog,mtFireShower,False,400,bo11);
               PlaySound (10533);
            end;


            if(m_btRace = 135) then begin    //흑천귀
                PlayScene.NewMagic (self,
                                      MAGIC_DARK_THUNDER, //11,
                                      MAGIC_DARK_THUNDER,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (3396);
            end;
            if(m_btRace = 112) then begin    //도사비월여우:폭살계
                PlayScene.NewMagic (self,
                                      MAGIC_FOX_FIRE2,
                                      MAGIC_FOX_FIRE2,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtExploBujauk,
                                      FALSE,
                                      30,
                                      bo11);
               m_nmagicstartsound := 10130;
               m_nmagicfiresound  := 10131;
               m_nmagicexplosionsound := 2526;
            end;

             if(m_btRace = 126) then begin    //갑철귀수: 물공격
                PlayScene.NewMagic (self,
                                      MAGIC_TURTLE_WARTERATT,
                                      MAGIC_TURTLE_WARTERATT,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtFly,
                                      TRUE,
                                      30,
                                      bo11);
                PlaySound (2374);
            end;
           end;

         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if m_btRace in [107,108,216,217,218] then begin //호기연 호기옥
         if GetTickCount - m_dwDefFrameTime > 150 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end
      else
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;



procedure TBanyaGuardMon.LightningTimerTimer(Sender: TObject);
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin
   if m_btRace = 159 then begin  //석마수

       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 10;
          Exit;
       end;
       tx := g_Myself.m_nCurrX;
       ty := g_Myself.m_nCurrY;

       n := random(4);
       kx := random(7);
       ky := random(5);

       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_1, MAGIC_MILSTONE_ATT3_1, m_nCurrX, m_nCurrY, tx+kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_2, MAGIC_MILSTONE_ATT3_2, m_nCurrX, m_nCurrY, tx+kx-2, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_3, MAGIC_MILSTONE_ATT3_3, m_nCurrX, m_nCurrY, tx+kx, ty+ky-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_4, MAGIC_MILSTONE_ATT3_4, m_nCurrX, m_nCurrY, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_5, MAGIC_MILSTONE_ATT3_5, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);

          LightningTimer.Interval := 500;
       end
       else if LightningTimer.Tag = 2 then begin
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_1, MAGIC_MILSTONE_ATT3_1, m_nCurrX, m_nCurrY, tx+kx-2, ty-ky-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_2, MAGIC_MILSTONE_ATT3_2, m_nCurrX, m_nCurrY, tx+kx+2, ty+ky-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_3, MAGIC_MILSTONE_ATT3_3, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_4, MAGIC_MILSTONE_ATT3_4, m_nCurrX, m_nCurrY, tx-kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_5, MAGIC_MILSTONE_ATT3_5, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);

       end;

       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_5, MAGIC_MILSTONE_ATT3_5, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_1, MAGIC_MILSTONE_ATT3_1, m_nCurrX, m_nCurrY, tx-kx-2, ty+ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_2, MAGIC_MILSTONE_ATT3_2, m_nCurrX, m_nCurrY, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_3, MAGIC_MILSTONE_ATT3_3, m_nCurrX, m_nCurrY, tx+kx+2, ty+ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_4, MAGIC_MILSTONE_ATT3_4, m_nCurrX, m_nCurrY, tx+kx, ty, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_MILSTONE_ATT3_5, MAGIC_MILSTONE_ATT3_5, m_nCurrX, m_nCurrY, tx-kx, ty, 0, mtThunder, FALSE, 30, bofly);


       if LightningTimer.Tag = 4 then PlaySound (2789); //초필사기
       LightningTimer.Interval := LightningTimer.Interval + 100;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 10;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
   end;


   if m_btRace = 100 then begin  //야수왕

       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 10;
          Exit;
       end;
       tx := g_Myself.m_nCurrX;
       ty := g_Myself.m_nCurrY;

       n := random(4);
       kx := random(7);
       ky := random(5);

       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_1, MAGIC_WILDATTACK_ATT3_1, m_nCurrX, m_nCurrY, tx+2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_3, MAGIC_WILDATTACK_ATT3_3, m_nCurrX, m_nCurrY, tx-2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_4, MAGIC_WILDATTACK_ATT3_4, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_5, MAGIC_WILDATTACK_ATT3_5, m_nCurrX, m_nCurrY, tx-2, ty-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_6, MAGIC_WILDATTACK_ATT3_6, m_nCurrX, m_nCurrY, tx+2, ty-2, 0, mtThunder, FALSE, 30, bofly);

          LightningTimer.Interval := 500;
       end
       else if LightningTimer.Tag = 2 then begin
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_1, MAGIC_WILDATTACK_ATT3_1, m_nCurrX, m_nCurrY, tx+2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_3, MAGIC_WILDATTACK_ATT3_3, m_nCurrX, m_nCurrY, tx-2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_4, MAGIC_WILDATTACK_ATT3_4, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_5, MAGIC_WILDATTACK_ATT3_5, m_nCurrX, m_nCurrY, tx-2, ty-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_6, MAGIC_WILDATTACK_ATT3_6, m_nCurrX, m_nCurrY, tx+2, ty-2, 0, mtThunder, FALSE, 30, bofly);

       end;

       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_1, MAGIC_WILDATTACK_ATT3_1, m_nCurrX, m_nCurrY, tx+2, ty+2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_3, MAGIC_WILDATTACK_ATT3_3, m_nCurrX, m_nCurrY, tx-2, ty+2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_4, MAGIC_WILDATTACK_ATT3_4, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_5, MAGIC_WILDATTACK_ATT3_5, m_nCurrX, m_nCurrY, tx-2, ty-2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_6, MAGIC_WILDATTACK_ATT3_6, m_nCurrX, m_nCurrY, tx+2, ty-2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_WILDATTACK_ATT3_2, MAGIC_WILDATTACK_ATT3_2, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);


       if LightningTimer.Tag = 4 then PlaySound (2499); //초필사기
       LightningTimer.Interval := LightningTimer.Interval + 100;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 10;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
   end;

end;

procedure TBanyaGuardMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
  end;
end;

procedure TBanyaGuardMon.DrawBackEff(dsurface: TDirectDrawSurface; dx,
  dy: Integer);
var
  idx: integer;
  d: TDirectDrawSurface;
begin
  inherited;
  if g_BoEffect then begin
    if (EffectBSurface <> nil) then begin
      DrawBlend(dsurface, dx + ex + m_nShiftX, dy + ey + m_nShiftY, EffectBSurface, 1);
    end;
  end;
  if m_nState and $00000800 <> 0 then begin   //혈룡수
    idx := BLOODWATER {+ (m_nGenAniCount mod 2)};
    d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
    if d <> nil then
      DrawBlend (dsurface, dx + ax + m_nShiftX, dy + ay + 100 + m_nShiftY, d, 1);
  end;
end;












{ TShineCaveMon }

constructor TShineCaveMon.Create;
begin
  inherited Create;
  n26C:=nil;
  n27C:=nil;
  EffectBSurface  := nil;
  EffectPront := nil;
end;

destructor TShineCaveMon.Destroy;
begin
   inherited Destroy;
   n26C:=nil;
   n27C:=nil;
   EffectBSurface  := nil;
   EffectPront := nil;
end;

procedure TShineCaveMon.LoadSurface;
begin
  inherited;

  if m_btRace = 7 then begin   //주마술사
    EffectPront := g_WMonImagesArr[40].GetCachedImage (560 +  m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 27 then begin   //주마검사
    EffectPront := g_WMonImagesArr[40].GetCachedImage (3520 +  m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 221 then begin   //변이갑충
    EffectPront := g_WMonImagesArr[38].GetCachedImage (1060 +  m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 231 then begin   //변이된감시병
    EffectPront := g_WMonImagesArr[39].GetCachedImage (1900 +  m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 233 then begin   //암흑선장
    EffectPront := g_WMonImagesArr[39].GetCachedImage (3620 +  m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 263 then begin   //현월환호
    EffectPront := WMon42Img.GetCachedImage (1840 + m_nCurrentFrame, bx, by);
  end;
  if m_btRace = 284 then begin   //설악귀
    EffectPront := g_WMonImagesArr[42].GetCachedImage (4150 + m_nCurrentFrame, bx, by);
    if (m_nCurrentAction = SM_DEATH) or (m_nCurrentAction = SM_NOWDEATH) then EffectPront := nil;
  end;
  if m_btRace = 285 then begin   //악귀
    EffectPront := g_WMonImagesArr[42].GetCachedImage (5060 + m_nCurrentFrame, bx, by);
  end;
  if bo260 then begin   //죽었을때 이팩트 표시하는것들,
    case m_btRace of
      3: begin      //여귀
        AttackEffectSurface := g_WMonImagesArr[39].GetCachedImage ( 5330 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      5: begin      //작은대망
        AttackEffectSurface := g_WMonImagesArr[39].GetCachedImage ( 7380 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      6: begin      //대망
        AttackEffectSurface := g_WMonImagesArr[39].GetCachedImage ( 6877 + (m_btDir * 10) + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      28: begin      //여귀석
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage ( 4530 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      92: begin      //바위폭탄
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage ( 6978 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      263: begin    //현월환호
        AttackEffectSurface := g_WMonImagesArr[22].GetCachedImage ( 1790 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      264: begin    //곰
        AttackEffectSurface := g_WMonImagesArr[41].GetCachedImage ( 2920 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      280: begin  //빙원귀
        AttackEffectSurface := g_WMonImagesArr[42].GetCachedImage ( 1770 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      284: begin  //설악귀
        AttackEffectSurface := g_WMonImagesArr[42].GetCachedImage ( 4547 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      285: begin  //악귀
        AttackEffectSurface := g_WMonImagesArr[42].GetCachedImage ( 5640 + (m_btDir * 10) + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      287: begin  //설태랑
        AttackEffectSurface := g_WMonImagesArr[43].GetCachedImage ( 1410 + m_nCurrentFrame -m_nStartFrame, n264, n268);
      end;
      4,7,8,26,27,29,51,91, 203,204,205,206,207,208,220,221,222,225,
       226,227,228,229,230,231,232, 261,262,265,281,282,283, 286: begin    //태구오마 거권오마 오마흑병 다목오마  오마적병  오마제사장
        bo260 := False;    //죽음 이팩 x
        m_boUseEffect := False;
        EffectBSurface := nil;
      end;
    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of
        5, 28,92, 203, 206, 222, 232, 263, 265, 280, 282, 284:  begin //작은대망, 태구오마 오마적병 현월환호 빙원귀 설악귀
           m_boUseEffect:= False;
        end;
        3 : begin      //여귀
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            5150 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            5230 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        4 : begin      //태골서
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            5880 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        6 : begin      //대망
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            6530 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            6620 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        7 : begin      //주마술사
          case m_nCurrentAction of
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            1130 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            1140 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;

        8 : begin      //주마화궁사
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            1640 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        26 : begin      //주마풍궁사
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            2600 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        27 : begin      //주마검사
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            4080 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            4160 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            4240 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;

        29 : begin      //마석거인
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            5130 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
               if m_btDir = 7 then begin
                 n27C := g_WMonImagesArr[40].GetCachedImage (
                            5207 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end else begin
                 n27C := g_WMonImagesArr[40].GetCachedImage (
                            5207 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            5280 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        51 : begin      //격괴장
          case m_nCurrentAction of
             SM_HIT: begin      //기본
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6020 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin     //두칸
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6100 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_1: begin   //일섬
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6200 + (m_btDir * 10)+ m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin      //전체공격
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6180 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_3: begin    //모래폭풍
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6190 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        91 : begin      //칼날바람
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[40].GetCachedImage (
                            6690 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;


        204: begin   //거권오마
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[37].GetCachedImage (
                            480 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        205: begin   //오마흑병
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[37].GetCachedImage (
                            1460 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        207: begin      //오마제사장
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[37].GetCachedImage (
                            3340 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[37].GetCachedImage (
                            3440 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        208: begin   //다목오마
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[37].GetCachedImage (
                            970 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        220: begin   //긴코원숭이
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            550 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        221: begin   //변이갑충
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            1460 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        225: begin   //그을린요리사
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            2980 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        226: begin   //떠도는선원
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            3470 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        227: begin      //익사한노예
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            4050 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            4130 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        228: begin      //선박의노예
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            4700 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            4700 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            4780 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        229: begin   //농노군
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            480 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            else m_boUseEffect:= False;
          end;
        end;
        230: begin      //거친선목
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            1150 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            1150 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        231: begin      //변이된감시병
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            2300 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        233: begin      //암흑선장
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            4420 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            4520 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            4500 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_3: begin
              n26C := g_WMonImagesArr[39].GetCachedImage (
                            4560 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        261 : begin      //숲거북이
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[41].GetCachedImage (
                            770 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        262 : begin      //숲거북이
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[41].GetCachedImage (
                            1580 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[41].GetCachedImage (
                            1660 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[41].GetCachedImage (
                            1740 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        264 : begin      //곰
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[41].GetCachedImage (
                            2840 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        281 : begin      //빙원귀병
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            2270 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            2350 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        283 : begin      //빙원귀존
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            3490 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            3570 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        285 : begin      //악귀
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            5150 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[42].GetCachedImage (
                            5230 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        286 : begin      //설랑
          case m_nCurrentAction of
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[43].GetCachedImage (
                            480 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;
        287: begin      //설태랑
          case m_nCurrentAction of
             SM_HIT: begin
              n26C := g_WMonImagesArr[43].GetCachedImage (
                            1140 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING: begin
              n26C := g_WMonImagesArr[43].GetCachedImage (
                            1220 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_2: begin
              n26C := g_WMonImagesArr[43].GetCachedImage (
                            1230 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
             SM_LIGHTING_3: begin
              n26C := g_WMonImagesArr[43].GetCachedImage (
                            1330 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
             end;
            else m_boUseEffect:= False;
          end;
        end;

      end;
    end;
  end;
end;

procedure TShineCaveMon.CalcActorFrame;
var
   pm: PTMonsterAction;
   Eff8:TNormalDrawEffect;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_TURN:
         begin
           if ((m_btRace = 261) or (m_btRace = 262)) and (m_nState and STATE_STONE_MODE <> 0) then begin
             m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
             m_nEndFrame := m_nStartFrame;
             m_dwFrameTime := pm.ActDeath.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := pm.ActDeath.frame;
           end else begin
             m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
             m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
             m_dwFrameTime := pm.ActStand.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := pm.ActStand.frame;
           end;
           Shift (m_btDir, 0, 0, 1);
         end;

     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);

       if (m_btRace in [4,5,6,7,28,92,203,204,205,206,208,220,221,226,232]) or (m_btRace = 261)
         or (m_btRace = 263) or (m_btRace = 264) or (m_btRace = 280)  or (m_btRace = 282) or (m_btRace = 284)
         or (m_btRace = 286)
       then  m_boUseEffect := False

       else m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;

       if m_btRace = 190 then begin  //땅두꺼비
         PlaySound (3756);
       end;
       if m_btRace = 264 then PlaySound(4322); //곰
       if m_btRace = 265 then PlaySound(4332); //표범
     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_nCurEffFrame:=0;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);

       if (not (m_btRace in [8,26,203,222,232])) and (not( m_btRace = 282)) and (not( m_btRace = 285))

       then begin
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end;
       if (m_btRace = 285) then begin  //악귀
         Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[42],5620,10,80,True);
         if Eff8 <> nil then begin
           Eff8.MagOwner:=g_MySelf;
           PlayScene.m_EffectList.Add(Eff8);
         end;
       end;
       if m_btRace = 3 then PlaySound (4166);    //여귀
       if m_btRace = 4 then PlaySound (4176);    //태골서
       if m_btRace = 6 then PlaySound (4186);    //대망
       if m_btRace = 7 then PlaySound (4206);    //주마술사
       if m_btRace = 8 then PlaySound (4216);    //주마화궁사
       if m_btRace = 26 then PlaySound (4226);   //주마풍궁사
       if m_btRace = 27 then PlaySound (4236);   //주마검사
       if m_btRace = 29 then PlaySound (4256);   //마석거인

       if m_btRace = 51 then PlaySound (4266);   //격괴장

       if m_btRace = 203 then PlaySound (3896);  //태구오마
       if m_btRace = 204 then PlaySound (3906);  //거권오마
       if m_btRace = 205 then PlaySound (3922);  //오마흑병
       if m_btRace = 206 then PlaySound (3836);  //오마적병
       if m_btRace = 207 then PlaySound (3846);  //오마제사장
       if m_btRace = 208 then PlaySound (3912);  //다목오마
       if m_btRace = 220 then PlaySound (4022);  //긴코원숭이
       if m_btRace = 221 then PlaySound (4032);  //변이갑충
       if m_btRace = 222 then PlaySound (4046);  //거장화
       if m_btRace = 226 then PlaySound (4072);  //떠도는선원
       if m_btRace = 227 then PlaySound (4086);  //익사한노예
       if m_btRace = 228 then PlaySound (4096);  //선박의악령
       if m_btRace = 229 then PlaySound (4106);  //농노군
       if m_btRace = 230 then PlaySound (4112);  //거친선목
       if m_btRace = 232 then PlaySound (4146);  //혼불
       if m_btRace = 233 then PlaySound (4157);  //암흑선장
       if m_btRace = 261 then PlaySound (4306);  //숲거북이
       if m_btRace = 262 then PlaySound (4316);  //삼나무정백
       if m_btRace = 264 then  PlaySound(4326);  //곰
       if m_btRace = 283 then PlaySound(4476);   //빙원귀존
       if m_btRace = 285 then PlaySound(4496);   //악귀
       if m_btRace = 286 then PlaySound(4506);   //설랑
       if m_btRace = 287 then PlaySound(4516);   //설태랑
       if (m_nCurrentAction = SM_LIGHTING_1) and (m_btRace = 51) then begin  //격괴장 일섬
         m_nStartFrame := pm.ActCritical4.start + m_btDir * (pm.ActCritical4.frame + pm.ActCritical4.skip);
         m_nEndFrame := m_nStartFrame + pm.ActCritical4.frame - 1;
         m_dwFrameTime := pm.ActCritical4.ftime;
         m_dwStartTime := GetTickCount;
         m_nCurEffFrame:=0;
         m_dwWarModeTime := GetTickCount;
         Shift (m_btDir, 0, 0, 1);
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
         if m_btRace = 51 then PlaySound (4269);   //격괴장 일섬
       end;
     end;
     SM_LIGHTING_2:
         begin
           m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
           m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
           m_dwFrameTime := pm.ActCritical2.ftime;
           m_dwStartTime := GetTickCount;
           m_nCurEffFrame:=0;
           m_dwWarModeTime := GetTickCount;
           Shift (m_btDir, 0, 0, 1);
           m_boUseEffect := TRUE;
           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;

           if m_btRace = 6 then PlaySound (4187);    //대망
           if m_btRace = 7 then PlaySound (4207);    //주마술사
           if m_btRace = 27 then PlaySound (4237);   //주마검사
           if m_btRace = 29 then PlaySound (4256);   //마석거인

           if m_btRace = 51 then PlaySound (4267);  //격괴장 전체
           if m_btRace = 51 then PlaySound (4268);  //격괴장 전체

           if m_btRace = 207 then PlaySound (3847);  //오마제사장
           if m_btRace = 228 then PlaySound (4092);  //선박의악령
           if m_btRace = 233 then PlaySound (4156);  //암흑선장
           if m_btRace = 233 then PlaySound (4156);  //암흑선장
           if m_btRace = 262 then PlaySound (4317);  //삼나무정백
           if m_btRace = 287 then PlaySound(4517);   //설태랑
         end;
    SM_LIGHTING_3:
         begin
            m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
            m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
            m_dwFrameTime := pm.ActCritical3.ftime;
            m_dwStartTime := GetTickCount;
            m_nCurEffFrame:=0;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            m_nEffectFrame := m_nStartFrame;
            m_nEffectStart := m_nStartFrame;
            m_nEffectEnd := m_nEndFrame;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;
            if m_btRace = 233 then PlaySound (4146);  //암흑선장

            if m_btRace = 51 then PlaySound (4257);  //격괴장 모래폭풍
            if m_btRace = 51 then PlaySound (4258);  //격괴장 모래폭풍
            if m_btRace = 287 then PlaySound(4518);   //설태랑
         end;
    SM_DEATH:
         begin
            if m_btRace in [28,92] then begin  //여귀석 바위폭탄
              m_nStartFrame := pm.ActDeath.start;
              m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
              m_dwFrameTime := pm.ActDeath.ftime;
              m_dwStartTime := GetTickCount;
              m_boUseEffect := False;
            end;
         end;

    SM_DIGUP:
         begin
            if m_btRace = 222 then begin  //거장화
              m_nStartFrame := pm.ActDeath.start;
              m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
              m_dwFrameTime := pm.ActDeath.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := False;
            end;
            if m_btRace = 261 then begin  //숲거북이
              m_nStartFrame := pm.ActDeath.start+80 + m_btDir * (pm.ActDeath.frame+3 + pm.ActDeath.skip-3);
              m_nEndFrame := m_nStartFrame + pm.ActDeath.frame+3 - 1;
              m_dwFrameTime := pm.ActDeath.ftime;
              m_dwStartTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound(4300);
            end;
            if m_btRace = 262 then begin   //삼나무정백
              m_nStartFrame := pm.ActDeath.start+80 + m_btDir * (pm.ActDeath.frame+3 + pm.ActDeath.skip-3);
              m_nEndFrame := m_nStartFrame + pm.ActDeath.frame+3 - 1;
              m_dwFrameTime := pm.ActDeath.ftime;
              m_dwStartTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound(4310);
            end;
         end;
     SM_DIGDOWN:
         begin
            if m_btRace = 222 then begin  //거장화
              m_nStartFrame := pm.ActCritical3.start;
              m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
              m_dwFrameTime := pm.ActCritical3.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := False;
            end;
         end;
     else begin
       inherited CalcActorFrame;
     end;
   end;

end;


function  TShineCaveMon.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      if m_btRace in [92,28] then
         Result := pm.ActDeath.start + pm.ActDie.frame - 1
      else Result := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip) + (pm.ActDie.frame - 1);
      EffectPront := nil;
      EffectBSurface  := nil;
   end else begin
     if ((m_btRace = 261) or (m_btRace = 262)) and (m_nState and STATE_STONE_MODE <> 0) then begin      //숲거북이, 삼나무정백
       Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
     end else begin
       m_nDefFrameCount := pm.ActStand.frame;
       if m_nCurrentDefFrame < 0 then cf := 0
       else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
       else cf := m_nCurrentDefFrame;
       if m_btRace in [92,28] then
        Result := pm.ActStand.start + cf
       else
       Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;
     end;
   end;
end;

procedure TShineCaveMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff : TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if (m_nCurrentAction = SM_HIT) and (m_nCurrentFrame-m_nStartFrame = 4) then begin
           if (m_btRace = 8) then begin  //주마화궁사
             PlayScene.NewMagic (Self,MAGIC_JUMAFIREARC1,MAGIC_JUMAFIREARC1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 4)then begin
           if (m_btRace = 6) then begin  //대망
             PlayScene.NewMagic (Self,MAGIC_BIG_SNAKE,MAGIC_BIG_SNAKE,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if m_btRace = 262 then begin //삼나무정백
             PlayScene.NewMagic (self, MAGIC_EXPLOSIN_TREE, MAGIC_EXPLOSIN_TREE, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY,
                                      m_nTargetRecog, mtThunder, FALSE,30, bo11);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
           if (m_btRace = 8) then begin  //주마화궁사
             PlayScene.NewMagic (Self,MAGIC_JUMAFIREARC2,MAGIC_JUMAFIREARC2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 26) then begin  //주마풍궁사
             PlayScene.NewMagic (Self,MAGIC_JUMAWIND,MAGIC_JUMAWIND,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 203) then begin  //태구오마
             PlayScene.NewMagic (Self,MAGIC_TEGU_ATT,MAGIC_TEGU_ATT,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 206) then begin  //오마적병
             PlayScene.NewMagic (Self,MAGIC_JUCK_ATT,MAGIC_JUCK_ATT,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 228) then begin  //선박의악령
             PlayScene.NewMagic (Self,MAGIC_GHOST_ATT,MAGIC_GHOST_ATT,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 229) then begin  //농노군
             PlayScene.NewMagic (Self,MAGIC_FRAM_NO_ATT,MAGIC_FRAM_NO_ATT,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 282) then begin  //빙원귀궁사
             PlayScene.NewMagic (Self,MAGIC_ICEARC,MAGIC_ICEARC,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
           end;
           if (m_btRace = 285) then begin //악귀
             PlayScene.NewMagic (self, MAGIC_EXPLOSIN_DEVIL, MAGIC_EXPLOSIN_DEVIL, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY,
                                      m_nTargetRecog, mtThunder, FALSE, 30, bo11);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame - m_nStartFrame = 8) then begin
           if (m_btRace = 283) then begin //빙원귀존
             PlayScene.NewMagic (self, MAGIC_EXPLOSIN_ICE, MAGIC_EXPLOSIN_ICE, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY,
                                      m_nTargetRecog, mtThunder, FALSE,30, bo11);
           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TShineCaveMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
  if m_boUseEffect and (n27C <> nil) then begin
 //   DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n27C, 0);
    dsurface.Draw(dx + ax + m_nShiftX,dy + ay + m_nShiftY,n27C, True);
  end;
  end;
end;

procedure TShineCaveMon.DrawBackEff(dsurface: TDirectDrawSurface; dx,
  dy: Integer);
begin
  inherited;
  if g_BoEffect then begin
    if (EffectBSurface <> nil) then begin
      DrawBlend(dsurface, dx + ex + m_nShiftX, dy + ey + m_nShiftY, EffectBSurface, 1);   //DrawBlend3 2
    end;
  end;
end;

procedure TShineCaveMon.DrawProntEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
begin
  inherited;
  if g_BoEffect then begin
    if (EffectPront <> nil) then begin
      DrawBlend(dsurface, dx + bx + m_nShiftX, dy + by + m_nShiftY, EffectPront, 1);       //DrawBlend3
    end;
  end;
end;




constructor TYehaGuardMon.Create;
begin
  inherited Create;
  n26C:=nil;
  if m_btRace in [201] then begin
   LightningTimer := TTimer.Create (nil);   //공작주
   LightningTimer.Interval := 10;
   LightningTimer.Tag := 0;
   LightningTimer.OnTimer := LightningTimerTimer;
   LightningTimer.Enabled := False;
  end;
end;

destructor TYehaGuardMon.Destroy;
begin
  if m_btRace in [201] then begin //공작주
    if LightningTimer <> nil then LightningTimer.Free;
  end;
  inherited Destroy;

end;

procedure TYehaGuardMon.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of

      195..199,201: begin  //큰뿔서우인 백상인  돌거인  흙거인 가네수 공작주
        bo260 := False;
        m_boUseEffect := False;
      end;

    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of
        195: begin   //큰뿔서우인
             case m_nCurrentAction of
               SM_HIT: begin
                  m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            560 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_2: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            640 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
         end;

         196: begin   //백상인
             case m_nCurrentAction of
               SM_HIT: begin
                  m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            1210 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
         end;

         197: begin   //돌거인
             case m_nCurrentAction of
               SM_HIT: begin
                  m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            1720 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
         end;


         199: begin   //가네수
             case m_nCurrentAction of
               SM_HIT: begin
                m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            3050 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING_2: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            3130 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING_3: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            3210 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
             end;
         end;

         201: begin   //공작주
             case m_nCurrentAction of
               SM_HIT: begin
                 m_boUseEffect:= False;
               end;
               SM_LIGHTING: begin
                n26C := g_WMonImagesArr[36].GetCachedImage (
                            4240 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING_2: begin
                 m_boUseEffect:= False;
               end;
               SM_LIGHTING_3: begin
                 m_boUseEffect:= False;
               end;
             end;
         end;


      end;
    end;
  end;
end;

procedure TYehaGuardMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
         m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
         m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
         m_dwFrameTime := pm.ActAttack.ftime;
         m_dwStartTime := GetTickCount;
         m_dwWarModeTime := GetTickCount;
         Shift (m_btDir, 0, 0, 1);
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       if m_btRace = 195 then   //큰뿔서우인
         PlaySound(3806);
       if m_btRace = 196 then   //백상인
         PlaySound(3816);
       if m_btRace = 197 then   //돌거인
         PlaySound(3826);
       if m_btRace = 198 then   //흙거인
         PlaySound(3836);
       if m_btRace = 199 then   //가네수
         PlaySound(3846);
       if m_btRace = 201 then   //공작주 5x5
         PlaySound(3866);
     end;
     SM_LIGHTING_2: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
       m_dwFrameTime := pm.ActCritical2.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       if m_btRace = 195 then   //큰뿔서우인
         PlaySound(3807);
       if m_btRace = 199 then   //가네수
         PlaySound(3847);
       if m_btRace = 201 then   //공작주 거미줄
         PlaySound (3867);
    end;
    SM_LIGHTING_3: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
       m_dwFrameTime := pm.ActCritical3.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       if m_btRace = 199 then   //가네수
         PlaySound(3848);
       if m_btRace = 201 then   //공작주 독 안개
         PlaySound(3868);
    end;
    else begin
       inherited CalcActorFrame;
    end;
  end;

end;


procedure TYehaGuardMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff : TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 1)then begin
           if m_btRace in [201] then begin //공작주
            if Not LightningTimer.Enabled then begin
                  LightningTimer.Enabled := True;
            end;
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin



           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;



procedure TYehaGuardMon.LightningTimerTimer(Sender: TObject);
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin
   if m_btRace = 201 then begin  //공작주

       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 10;
          Exit;
       end;
       tx := g_Myself.m_nCurrX;
       ty := g_Myself.m_nCurrY;

       n := random(4);
       kx := random(6);
       ky := random(5);

       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx+3, ty+ky+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx-2, ty-ky+5, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx-kx-1, ty-ky-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx-kx+4, ty+ky+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx-3, ty-ky-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx-kx+4, ty+ky+1, 0, mtThunder, FALSE, 30, bofly);

          LightningTimer.Interval := 500;
       end
       else if LightningTimer.Tag = 2 then begin
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx-5, ty-ky-5, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx+5, ty+ky-3, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx+2, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx-kx-5, ty+ky+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx+2, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx-kx, ty+ky, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT_1, MAGIC_SPIDER_ATT_1, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
       end;


       if LightningTimer.Tag = 4 then PlaySound (3867); //초필사기
       LightningTimer.Interval := LightningTimer.Interval + 100;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 10;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
   end;
end;

procedure TYehaGuardMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
     if m_btRace in [197] then begin   //돌거인
       DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 0);
     end else begin
       DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
     end;
  end;
  end;
end;




//========================================================영물

constructor TPet.Create;
begin
  inherited Create;
  n26C:=nil;
end;

destructor TPet.Destroy;
begin
   inherited Destroy;
end;

procedure TPet.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of

      240..251: begin
        bo260 := False;
        m_boUseEffect := False;
      end;

    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of


         240..251: begin
             case m_nCurrentAction of
               SM_HIT: begin
                 m_boUseEffect:= True;
                 n26C := g_WMagic3Images.GetCachedImage (
                            460 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING: begin
                 if m_btRace = 249 then begin
                   m_boUseEffect:= True;
                   n26C := g_WPetImg.GetCachedImage (
                            5060 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
                 end else begin
                   m_boUseEffect:= False;
                 end;
               end;
               SM_LIGHTING_2: begin
                 if m_btRace = 249 then begin
                   m_boUseEffect:= True;
                   n26C := g_WPetImg.GetCachedImage (
                            5060 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
                 end else begin
                   m_boUseEffect:= False;
                 end;
               end;
               SM_LIGHTING_3: begin
                 if m_btRace = 249 then begin
                   m_boUseEffect:= True;
                   n26C := g_WPetImg.GetCachedImage (
                            5060 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
                 end else begin
                   m_boUseEffect:= False;
                 end;
               end;
             end;
         end;


      end;
    end;
  end;
end;

procedure TPet.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
         m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
         m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
         m_dwFrameTime := pm.ActAttack.ftime;
         m_dwStartTime := GetTickCount;
         m_dwWarModeTime := GetTickCount;
         Shift (m_btDir, 0, 0, 1);
         m_boUseEffect := TRUE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;

         PlaySound2 (pet_pickup);
     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       if m_btRace = 249 then begin
         m_boUseEffect := TRUE;
         m_nEffectFrame := 0;
         m_nEffectStart := 11;
         m_nEffectEnd := 11;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else  m_boUseEffect := False;
     end;
     SM_LIGHTING_2: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
       m_dwFrameTime := pm.ActCritical2.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if m_btRace = 249 then begin
         m_boUseEffect := TRUE;
         m_nEffectFrame := 0;
         m_nEffectStart := 11;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else  m_boUseEffect := False;
    end;
    SM_LIGHTING_3: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
       m_dwFrameTime := pm.ActCritical3.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if m_btRace = 249 then begin
         m_boUseEffect := TRUE;
         m_nEffectFrame := 0;
         m_nEffectStart := 11;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end else  m_boUseEffect := False;
    end;
    else begin
       inherited CalcActorFrame;
    end;
  end;

end;


procedure TPet.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff : TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;


procedure TPet.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
end;




{ TNamManMon }

constructor TNamManMon.Create;
begin
  inherited Create;
  n26C:=nil;
end;

destructor TNamManMon.Destroy;
begin
   inherited Destroy;
end;

procedure TNamManMon.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of

     { 117: begin //단묵
        AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage (
                        3580 + (m_btDir * 20) + m_nCurrentFrame - m_nStartFrame,
                        n264, n268);

      end;   }

      117: begin    //단묵
       bo260 := False;    //죽음 이팩 x
       m_boUseEffect := False;
      end;

    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of



        117: begin  //단묵
             case m_nCurrentAction of
               SM_HIT: begin     //일반공격
                n26C := g_WMonImagesArr[32].GetCachedImage (
                            5363 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING: begin   //음파공격  전체공격
                n26C := g_WMonImagesArr[32].GetCachedImage (
                            5460 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;


               SM_LIGHTING_1: begin   //전체공격
                n26C := g_WMonImagesArr[32].GetCachedImage (
                            5730 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_2: begin  //원거리 1인 공격
                n26C := g_WMonImagesArr[32].GetCachedImage (
                            5540 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_3: begin  //박쥐 소환
                n26C := g_WMonImagesArr[32].GetCachedImage (
                            5720 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

             end;
         end;

      end;
    end;
  end;
end;

procedure TNamManMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;

       if m_btRace = 100 then begin  //야수왕
         PlaySound (2497);
       end;

     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin

       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_nCurEffFrame:=0;
       m_boUseEffect := TRUE;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;

       if m_btRace = 117 then begin    //단묵
        PlaySound (3496);
       end;

     end;
     SM_LIGHTING_2:
         begin
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;

              if m_btRace = 117 then begin  //단묵
                PlaySound2 (namman_att2);
              end;
         end;
     SM_LIGHTING_3:
         begin
              m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical3.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;

              if m_btRace = 117 then begin  //단묵
                PlaySound2 (namman_att3);
              end;
          end;

     else begin
       inherited CalcActorFrame;
     end;
   end;

end;


procedure TNamManMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff: TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if (m_nCurrentAction = SM_HIT) and (m_nCurrentFrame-m_nStartFrame = 4) then begin
             if m_btRace = 117 then begin       //단묵
                 PlayScene.NewMagic (self, MAGIC_NAMMAN_ATT1_1,MAGIC_NAMMAN_ATT1_1,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
             end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 4)then begin
            meff := TFlyingFireBall (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mt12));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[32];
               meff.NextFrameTime := 100;
               meff.FlyImageBase := 5620;
            end;

             if m_btRace = 117 then begin       //단묵
                 PlayScene.NewMagic (self, MAGIC_NAMMAN_ATT1_2,MAGIC_NAMMAN_ATT1_2,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
                 PlaySound (2526);
             end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

            if(m_btRace = 111) then begin    //술사비월여우:화염
                PlayScene.NewMagic (self,
                                      MAGIC_FOX_FIRE1,
                                      MAGIC_FOX_FIRE1,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (2517);
            end;

         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

             if (m_btRace = 71) then begin  //반야좌사
               PlayScene.NewMagic (Self,1,1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,30,bo11);
               PlaySound(10012);
             end;
           end;

         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TNamManMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
  end;
end;






{ TMerMaidKingMon }

constructor TMerMaidKingMon.Create;
begin
  inherited Create;
  n26C:=nil;
end;

destructor TMerMaidKingMon.Destroy;
begin
   inherited Destroy;

end;

procedure TMerMaidKingMon.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of


      189: begin    //수어귀
       bo260 := False;    //죽음 이팩 x
       m_boUseEffect := False;
      end;

    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of



        189: begin  //수어귀
             case m_nCurrentAction of
               SM_HIT: begin     //일반공격
                n26C := g_WMonImagesArr[35].GetCachedImage (
                            2628 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING: begin   //전체공격
                n26C := g_WMonImagesArr[35].GetCachedImage (
                            2710 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;


               SM_LIGHTING_1: begin   //전체공격
                  m_boUseEffect:= False;
               end;

               SM_LIGHTING_2: begin  //원거리 1인 공격
                n26C := g_WMonImagesArr[35].GetCachedImage (
                            2820 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_3: begin
                 m_boUseEffect:= False;
               end;

             end;
         end;

      end;
    end;
  end;
end;

procedure TMerMaidKingMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;


     end;
     SM_LIGHTING_1,
     SM_LIGHTING: begin

       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_nCurEffFrame:=0;
       m_boUseEffect := TRUE;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;


     end;
     SM_LIGHTING_2:
         begin
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;

              if m_btRace = 189 then begin  //수어귀
                PlaySound (3747);
              end;
         end;
     SM_LIGHTING_3:
         begin
              m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical3.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;

              if m_btRace = 189 then begin  //수어귀
                PlaySound (3746);
              end;

          end;

     else begin
       inherited CalcActorFrame;
     end;
   end;

end;


procedure TMerMaidKingMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff: TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if (m_nCurrentAction = SM_HIT) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 4)then begin
            meff := TFlyingFireBall (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mt12));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[35];
               meff.NextFrameTime := 100;
               meff.FlyImageBase := 2860;
            end;

             if m_btRace = 189 then begin       //수어귀
                 PlayScene.NewMagic (self, MAGIC_MERMAID_ATT1_1,MAGIC_MERMAID_ATT1_1,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
                 PlaySound (3748);
             end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin
             if m_btRace = 189 then begin       //수어귀
                 PlayScene.NewMagic (self, MAGIC_MERMAID_ATT1_2,MAGIC_MERMAID_ATT1_2,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
                 PlaySound (3748);
             end;
         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin


           end;

         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TMerMaidKingMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
end;


{월지겸신장}

constructor TGumiBoss.Create;
begin
   inherited Create;
   n26C:=nil;

   SpiderTimer := TTimer.Create (nil);
   SpiderTimer.Interval := 70;
   SpiderTimer.Tag := 0;
   SpiderTimer.OnTimer := SpiderTimerTimer;
   SpiderTimer.Enabled := False;
end;

destructor TGumiBoss.Destroy;       //월지겸신장
begin

   if SpiderTimer <> nil then SpiderTimer.Free;

   inherited Destroy;

end;

procedure TGumiBoss.SpiderTimerTimer(Sender: TObject);   //월지겸신장
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin
       if SpiderTimer.Tag = 0 then begin
          SpiderTimer.Tag := SpiderTimer.Tag + 1;
          SpiderTimer.Interval := 800;
          Exit;
       end
       else SpiderTimer.Interval := 70;
       tx := m_nCurrX - 5;
       ty := m_nCurrY - 3;

       Randomize;
       if SpiderTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx-6, ty+6, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx-6, ty-6, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+4, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+6, ty-4, 0, mtThunder, FALSE, 30, bofly);
       end;

       n := random(4);
       kx := random(7);
       ky := random(5);
       case n of
          0: begin PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+kx-4, ty-ky+6, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx-kx+6, ty-ky+2, 0, mtThunder, FALSE, 30, bofly); end;
          1: begin PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx-kx,   ty+ky, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+kx+4, ty+ky, 0, mtThunder, FALSE, 30, bofly);   end;
          2: begin PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx-kx,   ty-ky+6, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+kx+6, ty+ky-2, 0, mtThunder, FALSE, 30, bofly); end;
          3: begin PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+kx-4, ty+ky, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, MAGIC_SPIDER_ATT1, MAGIC_SPIDER_ATT1, m_nCurrX, m_nCurrY, tx+kx+6, ty+ky+4, 0, mtThunder, FALSE, 30, bofly); end;
       end;

       if (SpiderTimer.Tag mod 3) = 0 then PlaySound (2279);
       SpiderTimer.Interval := SpiderTimer.Interval + 15;
       SpiderTimer.Tag := SpiderTimer.Tag+1;

       if SpiderTimer.Tag > 7 then begin
          SpiderTimer.Interval := 70;
          SpiderTimer.Tag := 0;
          SpiderTimer.Enabled := False;
       end;
end;

procedure TGumiBoss.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
     SM_HIT: begin
        m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
        m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
        m_dwFrameTime := pm.ActAttack.ftime;
        m_dwStartTime := GetTickCount;
        m_dwWarModeTime := GetTickCount;
        Shift (m_btDir, 0, 0, 1);
        m_boUseEffect := False;
        PlaySound(2777);
     end;
     SM_LIGHTING: begin       //화염공격
        m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
        m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
        m_dwFrameTime := pm.ActAttack.ftime;
        m_dwStartTime := GetTickCount;
        m_dwWarModeTime := GetTickCount;
        Shift (m_btDir, 0, 0, 1);
        m_boUseEffect := False;
        PlaySound(2779);
     end;

     SM_LIGHTING_3: begin       //주변공격
        m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
        m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
        m_dwFrameTime := pm.ActAttack.ftime;
        m_dwStartTime := GetTickCount;
        m_dwWarModeTime := GetTickCount;
        Shift (m_btDir, 0, 0, 1);

        m_boUseEffect := TRUE;
        m_nEffectStart := 0;
        m_nEffectFrame := 0;
        m_nEffectEnd :=10;
        m_dwEffectStartTime := GetTickCount;
        m_dwEffectFrameTime := 160;
        PlaySound(2776);
     end;

     SM_LIGHTING_2: begin      //거미줄
        m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
        m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
        m_dwFrameTime := pm.ActCritical.ftime;
        m_dwStartTime := GetTickCount;
        m_nCurEffFrame:=0;
        m_boUseEffect := FALSE;
        m_dwWarModeTime := GetTickCount;
        Shift (m_btDir, 0, 0, 1);

        PlaySound(2778);
     end;
     SM_NOWDEATH: begin         //죽을때
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;

       m_boUseEffect := TRUE;
       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 6;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
     end;
     else begin
       inherited;
     end;
   end;

end;

procedure TGumiBoss.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY, n26C, 1);
  end;
end;

procedure TGumiBoss.LoadSurface;
begin
  inherited;

  if bo260 then begin
    AttackEffectSurface := g_WMonImagesArr[25].GetCachedImage(
                     2960 + m_nEffectFrame - m_nEffectStart,
                     n264, n268);
  end else begin
    if m_boUseEffect then begin
      case m_nCurrentAction of
        SM_LIGHTING_3: begin
           n26C := g_WMonImagesArr[25].GetCachedImage (
                            2950 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
              end;
        SM_NOWDEATH: begin
           n26C := g_WMonImagesArr[25].GetCachedImage (
                            2960 + m_nEffectFrame-m_nEffectStart,
                            ax, ay);
              end;
      end;
    end;
  end;
end;

procedure TGumiBoss.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260 := FALSE;
         end;
         if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame - m_nStartFrame = 4) then begin    //화염공격
           PlayScene.NewMagic (self, MAGIC_FIREBURN, MAGIC_FIREBURN, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY, 0, mtThunder, FALSE, 30, bofly);
           PlaySound(8222);
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame - m_nStartFrame = 1) then begin      //거미줄 공격
           if Not SpiderTimer.Enabled then begin
               SpiderTimer.Enabled := True;
           end;
         end;


         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;


{ TElectronicScolpionMon }

procedure TElectronicScolpionMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
     end;
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     else begin
       inherited;
     end;
   end;
end;

procedure TElectronicScolpionMon.LoadSurface;
begin
  inherited;

  if (m_btRace = 60) and m_boUseEffect and (m_nCurrentAction = SM_LIGHTING) then begin
    AttackEffectSurface := g_WMonImagesArr[18].GetCachedImage (
                        430 + (firedir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
  end;


end;



{ TBossPigMon }

procedure TBossPigMon.LoadSurface;
begin
  inherited;
  if (m_btRace = 61) and m_boUseEffect then begin
    AttackEffectSurface := g_WMonImagesArr[18].GetCachedImage (
                        860 + (firedir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
  end;
end;

{ TKingOfSculpureKingMon }

procedure TKingOfSculpureKingMon.CalcActorFrame;     //흑천마왕
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_nEffectFrame := pm.ActDie.start;
       m_nEffectStart := pm.ActDie.start;
       m_nEffectEnd := pm.ActDie.start + pm.ActDie.frame - 1;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       m_boUseEffect := TRUE;
     end;
     else begin
      inherited CalcActorFrame;
     end;
   end;
end;

procedure TKingOfSculpureKingMon.LoadSurface;      //흑천마왕
begin
  inherited LoadSurface;
  if (m_btRace = 62) and m_boUseEffect then begin
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[18].GetCachedImage (
                        1490 + (firedir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
      end;
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[18].GetCachedImage (
                        1380 + (firedir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
      end;
      SM_NOWDEATH: begin
        AttackEffectSurface := g_WMonImagesArr[18].GetCachedImage (
                        1470 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
      end;
    end;

  end;
end;

{ TSkeletonArcherMon }

procedure TSkeletonArcherMon.CalcActorFrame;
begin
   inherited CalcActorFrame;
   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            if(m_btRace <> 72)then
               bo260 := TRUE;
            if m_btRace in [105,152] then bo260 := False; // 설인대충이면 죽는 임펙트 안나옴   //서괴
         end;
   end;

end;

procedure TSkeletonArcherMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if bo260 and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + n264 + m_nShiftX,dy + n268 + m_nShiftY,AttackEffectSurface, 1);
  end;
end;

procedure TSkeletonArcherMon.LoadSurface;
begin
  inherited;
  if bo260 and (m_btRace = 69) then begin
     AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                  1600 + m_nEffectFrame - m_nEffectStart,
                   n264, n268);
  end;
end;

procedure TSkeletonArcherMon.Run;
var
  m_dwFrameTimetime: longword;
begin

  if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
  else m_dwFrameTimetime := m_dwFrameTime;
  if m_nCurrentAction <> 0 then begin
    if (GetTickCount - m_dwStartTime) > m_dwFrameTimetime then begin
      if m_nCurrentFrame < m_nEndFrame then begin
      end else begin
        m_nCurrentAction:=0;
        bo260:=False;
      end;
    end;
  end;

  inherited;
end;

{ TFlyingSpider }

procedure TFlyingSpider.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
begin
  inherited;
  if m_nCurrentAction = SM_NOWDEATH then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[11],1420,20,m_dwFrameTime,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
end;

{ TExplosionSpider }

procedure TExplosionSpider.CalcActorFrame;
begin
  inherited ;
  case m_nCurrentAction of
    SM_HIT: begin
      m_boUseEffect:=False;
    end;
    SM_NOWDEATH: begin
      m_nEffectStart:=m_nStartFrame;
      m_nEffectFrame:=m_nStartFrame;
      m_dwEffectStartTime:=GetTickCount();
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectEnd:=m_nEndFrame;
      m_boUseEffect:=True;
    end;
  end;
end;

procedure TExplosionSpider.LoadSurface;
begin
  inherited;
  if m_boUseEffect then
    AttackEffectSurface := g_WMonImagesArr[13].GetCachedImage (
                        730 + m_nEffectFrame-m_nEffectStart,
                        ax, ay);
end;



{ TExplosionDark }

procedure TExplosionDark.CalcActorFrame;
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
      m_boUseEffect:=False;
    end;
    SM_NOWDEATH: begin
      m_nEffectStart:=m_nStartFrame;
      m_nEffectFrame:=m_nStartFrame;
      m_dwEffectStartTime:=GetTickCount();
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectEnd:=m_nEndFrame;
      m_boUseEffect:=True;
    end;
  end;
end;

procedure TExplosionDark.LoadSurface;
begin
  inherited;
  if m_boUseEffect then
    AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage (
                        3600 + m_nEffectFrame-m_nEffectStart,
                        ax, ay);
end;



{ TSkeletonKingMon }

procedure TSkeletonKingMon.CalcActorFrame;   //해골반왕
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
     SM_BACKSTEP,SM_WALK: begin
       m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
       m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
       m_dwFrameTime := pm.ActWalk.ftime;
       m_dwStartTime := GetTickCount;
       m_nEffectFrame:=pm.ActWalk.start;
       m_nEffectStart:=pm.ActWalk.start;
       m_nEffectEnd:=pm.ActWalk.start + pm.ActWalk.frame -1;
       m_dwEffectStartTime:=GetTickCount();
       m_dwEffectFrameTime:=m_dwFrameTime;
       m_boUseEffect:=True;
            //WarMode := FALSE;
       m_nMoveStep := 1;
       if m_nCurrentAction = SM_WALK then
         Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
       else
         Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
     end;
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime:= GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame:=m_nStartFrame;
       m_nEffectStart:=m_nStartFrame;
       m_nEffectEnd:=m_nEndFrame;
       m_dwEffectStartTime:=GetTickCount();
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_FLYAXE: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime:= GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame:=m_nStartFrame;
       m_nEffectStart:=m_nStartFrame;
       m_nEffectEnd:=m_nEndFrame;
       m_dwEffectStartTime:=GetTickCount();
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_LIGHTING: begin
       m_nStartFrame := 80 + pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime:= GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       firedir := m_btDir;
       m_nEffectFrame:=m_nStartFrame;
       m_nEffectStart:=m_nStartFrame;
       m_nEffectEnd:=m_nEndFrame;
       m_dwEffectStartTime:=GetTickCount();
       m_dwEffectFrameTime := m_dwFrameTime;
     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
       m_nEffectFrame:=pm.ActStruck.start;
       m_nEffectStart:=pm.ActStruck.start;
       m_nEffectEnd:=pm.ActStruck.start + pm.ActStruck.frame -1;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=m_dwFrameTime;
       m_boUseEffect := TRUE;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_nEffectFrame := pm.ActDie.start;
       m_nEffectStart := pm.ActDie.start;
       m_nEffectEnd := pm.ActDie.start + pm.ActDie.frame - 1;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       m_boUseEffect := TRUE;
     end;
     else begin
       inherited;
     end;
   end;
end;

procedure TSkeletonKingMon.LoadSurface;         //해골반왕
begin
  inherited;
   if (m_btRace = 63) and m_boUseEffect then begin
     case m_nCurrentAction of
       SM_WALK: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3060 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
       end;
       SM_HIT: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3140 + (firedir * 10) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
       end;
       SM_FLYAXE: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3300 + (firedir * 10) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
       end;
       SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3220 + (firedir * 10) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
       end;
       SM_STRUCK: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3380 + (m_btDir * 2) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);       
       end;
       SM_NOWDEATH: begin
         AttackEffectSurface := g_WMonImagesArr[19].GetCachedImage (
                                3400 + (m_btDir * 20) + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
       end;
     end;
   end;
end;

procedure TSkeletonKingMon.Run;              //해골반왕
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   meff: TFlyingFireBall;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN)  then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect:=False;
            BoUseDieEffect := FALSE;
         end;

         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame-m_nStartFrame = 4) then begin
            meff := TFlyingFireBall (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mt12));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[19];
               meff.NextFrameTime := 40;
               meff.FlyImageBase := 3570;
            end;
         end;
        m_nCurrentDefFrame := 0;
        m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

{ TStoneMonster }

procedure TStoneMonster.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic:=False;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_btDir:=0;
   case m_nCurrentAction of
     SM_TURN: begin
       m_nStartFrame := pm.ActStand.start;
       m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
       m_dwFrameTime := pm.ActStand.ftime;
       m_dwStartTime := GetTickCount;
       m_nDefFrameCount:=pm.ActStand.frame;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 300;
       end;
     end;
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start;
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nStartFrame + 25;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 150;
       end;
     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start;
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_DEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       if (m_btRace in [75,77]) then bo260:=True;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nStartFrame + 19;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 80;
     end;
   end;
end;

constructor TStoneMonster.Create;
begin
  inherited;
  n26C:=nil;
  m_boUseEffect:=False;
  bo260:=False;
end;

procedure TStoneMonster.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,
               dx + ax + m_nShiftX,
               dy + ay + m_nShiftY,
               n26C, 1);
  end;
end;

procedure TStoneMonster.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of
      75: begin
        AttackEffectSurface := g_WMonImagesArr[21].GetCachedImage (
                        2530 + m_nEffectFrame - m_nEffectStart,
                        n264, n268);
      end;
      77: begin
        AttackEffectSurface := g_WMonImagesArr[21].GetCachedImage (
                        2660 + m_nEffectFrame - m_nEffectStart,
                        n264, n268);
      end;
    end;
  end else begin
    if m_boUseEffect then
      case m_btRace of
        75: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2500 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2490 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;
        77: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2630 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2620 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

        206, 207: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            20 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
              n26C := g_WMonImagesArr[38].GetCachedImage (
                            20 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;

      end;
  end;
end;

procedure TStoneMonster.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime: longword;
   m_dwFrameTimetime: longword;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect or bo260 then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if (prv <> m_nCurrentFrame) or (prv <> m_nEffectFrame) then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

{ TPotMon }

constructor TPotMon.Create;
begin
  inherited;
  n26C:=nil;
  m_boUseEffect:=False;
  bo260:=True;
end;

procedure TPotMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic:=False;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  // m_btDir:=0;
   case m_nCurrentAction of
     SM_TURN: begin
       m_nStartFrame := pm.ActStand.start + (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
       m_dwFrameTime := pm.ActStand.ftime;
       m_dwStartTime := GetTickCount;
       m_nDefFrameCount:=pm.ActStand.frame;
      // if not m_boUseEffect then begin
       if m_btRace = 172 then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end;
     //  end;
     end;
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nStartFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := m_dwFrameTime;
       end;

       if m_btRace = 171 then begin      //호중귀2
           PlaySound2 (pot1_atk);
       end;
     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_DEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       if m_btRace = 172 then begin
        bo260:=True;
        m_boUseEffect := TRUE;
        m_nEffectFrame := m_nStartFrame;
        m_nEffectStart := m_nStartFrame;
        m_nEffectEnd := m_nEndFrame;
        m_dwEffectStartTime := GetTickCount;
        m_dwEffectFrameTime := m_dwFrameTime;
       end;
       if m_btRace = 171 then begin    //호중귀2
           PlaySound2 (pot1_die);
       end;
     end;
   end;
end;

procedure TPotMon.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of
      171: begin
        bo260 := False;
      end;
      77: begin
        AttackEffectSurface := g_WMonImagesArr[21].GetCachedImage (
                        2660 + m_nEffectFrame - m_nEffectStart,
                        n264, n268);
      end;
    end;
  end else begin
    if m_boUseEffect then
      case m_btRace of
        171: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[33].GetCachedImage (
                            5940 + (m_btDir * 10 ) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
               m_boUseEffect := False;
            end;
          end;
        end;
        77: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2630 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
              n26C := g_WMonImagesArr[21].GetCachedImage (
                            2620 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;
      end;
  end;
end;

procedure TPotMon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime: longword;
   m_dwFrameTimetime: longword;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect or bo260 then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if (prv <> m_nCurrentFrame) or (prv <> m_nEffectFrame) then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TPotMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,
               dx + ax + m_nShiftX,
               dy + ay + m_nShiftY,
               n26C, 1);
  end;
end;

  { TIceHellMonster5 }

procedure TIceHellMonster5.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic:=False;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_btDir:=0;
   case m_nCurrentAction of
     SM_TURN: begin
       m_nStartFrame := pm.ActStand.start;
       m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
       m_dwFrameTime := pm.ActStand.ftime;
       m_dwStartTime := GetTickCount;
       m_nDefFrameCount:=pm.ActStand.frame;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 300;
       end;
     end;
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start;
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nStartFrame + 25;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 150;
       end;
     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start;
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_DEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       bo260:=True;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nStartFrame + 19;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 80;
     end;
   end;
end;

constructor TIceHellMonster5.Create;
begin
  inherited;
  n26C:=nil;
  m_boUseEffect:=False;
  bo260:=False;
end;

procedure TIceHellMonster5.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,
               dx + ax + m_nShiftX,
               dy + ay + m_nShiftY,
               n26C, 1);
  end;
  end;
end;

procedure TIceHellMonster5.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of
      214: begin
        AttackEffectSurface := g_WMonImagesArr[6].GetCachedImage (
                        204 + m_nEffectFrame - m_nEffectStart,
                        n264, n268);
      end;
    end;
  end else begin
    if m_boUseEffect then
      case m_btRace of
        214: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[6].GetCachedImage (
                            204 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_TURN: begin
              n26C := g_WMonImagesArr[6].GetCachedImage (
                            204 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
          end;
        end;
      end;
  end;
end;

procedure TIceHellMonster5.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime: longword;
   m_dwFrameTimetime: longword;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect or bo260 then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if (prv <> m_nCurrentFrame) or (prv <> m_nEffectFrame) then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

 { TIceHellMonster6 }

procedure TIceHellMonster6.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic:=False;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_btDir:=0;
   case m_nCurrentAction of
     SM_TURN: begin
       m_nStartFrame := pm.ActStand.start;
       m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
       m_dwFrameTime := pm.ActStand.ftime;
       m_dwStartTime := GetTickCount;
       m_nDefFrameCount:=pm.ActStand.frame;
       if not m_boUseEffect then begin
         m_boUseEffect:=FALSE;
         m_nEffectFrame := m_nStartFrame;
         m_nEffectStart := m_nStartFrame;
         m_nEffectEnd := m_nEndFrame;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 300;
       end;
     end;
     SM_HIT: begin
       m_nStartFrame := pm.ActAttack.start;
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       if not m_boUseEffect then begin
         m_boUseEffect:=True;
         m_nEffectFrame := 0;
         m_nEffectStart := 0;
         m_nEffectEnd := 10;
         m_dwEffectStartTime := GetTickCount;
         m_dwEffectFrameTime := 150;
       end;
     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start;
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
     end;
     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
         m_boUseEffect:=True;
       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 10;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 150;
     end;
   end;
end;

constructor TIceHellMonster6.Create;
begin
  inherited;
  n26C:=nil;
  m_boUseEffect:=False;
  bo260:=False;
end;

procedure TIceHellMonster6.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,
               dx + ax + m_nShiftX,
               dy + ay + m_nShiftY,
               n26C, 1);
  end;
  end;
end;

procedure TIceHellMonster6.LoadSurface;
begin
  inherited;
  if bo260 then begin
    case m_btRace of
      215: begin
        AttackEffectSurface := g_WMonImagesArr[6].GetCachedImage (
                        204 + m_nEffectFrame - m_nEffectStart,
                        n264, n268);
      end;
    end;
  end else begin
    if m_boUseEffect then
      case m_btRace of
        215: begin
          case m_nCurrentAction of
            SM_HIT: begin
              n26C := g_WMonImagesArr[28].GetCachedImage (
                            3850 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
            end;
            SM_NOWDEATH: begin
             n26C := g_WMonImagesArr[28].GetCachedImage (
                                3870 + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
            end;
          end;
        end;
      end;
  end;
end;

procedure TIceHellMonster6.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime: longword;
   m_dwFrameTimetime: longword;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect or bo260 then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if (prv <> m_nCurrentFrame) or (prv <> m_nEffectFrame) then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;


{ TAngel }

procedure  TAngel.LoadSurface;
var
   mimg: TWMImages;
begin

   mimg := GetMonImg (m_wAppearance);
   if mimg <> nil then begin

      if (not m_boReverseFrame) then begin
         m_BodySurface := mimg.GetCachedImage (920{GetOffset (m_wAppearance)}+ m_nCurrentFrame, m_npx, m_npy);
         m_BodySurface2 := mimg.GetCachedImage (1280 + m_nCurrentFrame, m_npx2, m_npy2); // 투명아닌 이미지
      end
      else begin
         m_BodySurface := mimg.GetCachedImage ( 920 {GetOffset (m_wAppearance)} + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame), m_npx, m_npy);
         m_BodySurface2 := mimg.GetCachedImage (1280 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame), m_npx2, m_npy2);
      end;
   end;
end;


procedure TAngel.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
  nx, ny : integer;
begin
  if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;


  ceff := GetDrawEffectValue;
  if (m_BodySurface <> nil) and (m_BodySurface2 <> nil) then begin
    Drawblend (dsurface, dx + m_npx + m_nShiftX, dy + m_npy + m_nShiftY, m_BodySurface, 1);
    if AngelFastDraw then blend := False;//월령
    DrawEffSurface (dsurface, m_BodySurface2, dx + m_npx2 + m_nShiftX, dy + m_npy2 + m_nShiftY, blend, ceff);
  end;


end;

{ TDarkAngel }        //혼령

procedure  TDarkAngel.LoadSurface;
var
   mimg: TWMImages;
begin

   mimg := GetMonImg (m_wAppearance);
   if mimg <> nil then begin

      if (not m_boReverseFrame) then begin
         m_BodySurface := mimg.GetCachedImage (920 + m_nCurrentFrame, m_npx, m_npy);
      end else begin
         m_BodySurface := mimg.GetCachedImage (920 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame), m_npx, m_npy);
      end;
   end;
end;


procedure TDarkAngel.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
  nx, ny : integer;
begin
  if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;


  ceff := GetDrawEffectValue;
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_npx + m_nShiftX, dy + m_npy + m_nShiftY, blend, ceff);
end;

{ Tyounhon }

procedure Tyounhon.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
  bo11: Boolean;
begin
  if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

  if n278 <> nil then begin
    DrawBlend (dsurface, dx + n270 + m_nShiftX, dy + n274 + m_nShiftY, n278, 1);
  end;
  //inherited;

  ceff := GetDrawEffectValue;

  if m_BodySurface <> nil then begin
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  end;

  
end;

procedure Tyounhon.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);


   if mimg <> nil then begin
    if m_boUseEffect then begin
       m_BodySurface := mimg.GetCachedImage (
                            1720 + m_nEffectFrame,
                            m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (
                            2140 + m_nEffectFrame,
                            n270, n274);
    end else begin
     if (not m_boReverseFrame) then begin
       m_BodySurface := mimg.GetCachedImage (1720 + m_nCurrentFrame, m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (2140 + m_nCurrentFrame, n270, n274);
     end else begin
       m_BodySurface := mimg.GetCachedImage (
                            1720 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame),
                            m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (
                            2140 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame),
                            n270, n274);
     end;
    end;
   end;
end;


{ Twino }

procedure Twino.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
  bo11: Boolean;
begin
  if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

  if n278 <> nil then begin
    DrawBlend (dsurface, dx + n270 + m_nShiftX, dy + n274 + m_nShiftY, n278, 1);
  end;
  //inherited;

  ceff := GetDrawEffectValue;


  if m_BodySurface <> nil then begin
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  end;

  
end;

procedure Twino.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);


   if mimg <> nil then begin
    if m_boUseEffect then begin
       m_BodySurface := mimg.GetCachedImage (
                            3620 + m_nEffectFrame,
                            m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (
                            4280 + m_nEffectFrame,
                            n270, n274);
    end else begin
     if (not m_boReverseFrame) then begin
       m_BodySurface := mimg.GetCachedImage (3620 + m_nCurrentFrame, m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (4280 + m_nCurrentFrame, n270, n274);
     end else begin
       m_BodySurface := mimg.GetCachedImage (
                            3620 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame),
                            m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (
                            4280 + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame),
                            n270, n274);
     end;
    end;
   end;
end;

{ TPBOMA6Mon }

procedure TPBOMA6Mon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   meff: TFlyingAxe;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
            meff := TFlyingAxe (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             g_nTargetX,
                             g_nTargetY,
                             m_nTargetRecog,
                             mt16));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[21];
               meff.NextFrameTime := 50;
               meff.FlyImageBase:=1989;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

// 용조신상(용석상) -----------------------------------------------------------------------------

constructor TDragonStatue.Create;
begin
   inherited Create;
   AttackEffectSurface := nil;
end;

procedure  TDragonStatue.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := g_WDragonImg;

   if mimg <> nil then
      m_BodySurface := mimg.GetCachedImage (GetOffset(m_wAppearance), m_nPx, m_nPy);

   if m_boUseEffect then begin
      case m_btRace of
         84,85,86: begin // 용석상우
             EffectSurface := g_WDragonImg.GetCachedImage (
                310 + m_nEffectFrame, ax, ay);
         end;
         87,88,89: begin // 용석상좌
             EffectSurface := g_WDragonImg.GetCachedImage (
                330 + m_nEffectFrame, ax, ay);
          end;
      end;
   end;

end;

procedure TDragonStatue.CalcActorFrame;
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   m_btDir := 0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset(m_wAppearance);
   pm := GetRaceByPM (m_btRace, m_wAppearance);

   case m_nCurrentAction of
      SM_LIGHTING:
         begin
            m_nStartFrame := 0;
            m_nEndFrame    := 9;
            m_dwFrameTime  := 100;
            m_dwStartTime  := GetTickCount;

            m_boUseEffect := TRUE;
            m_nEffectStart := 0;
            m_nEffectFrame := 0;
            m_nEffectEnd   := 9;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := 100;
         end;
      SM_DIGUP: //걷기 없음, SM_DIGUP, 방향 없음.
         begin
            Shift (0, 0, 0, 1);
            m_nStartFrame := 0;
            m_nEndFrame := 9;
            m_dwFrameTime := 100;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

procedure TDragonStatue.Run;
var
   prv: integer;
   effectframetimetime, frametimetime: longword;
   meff: TFlyingAxe;
   bofly: Boolean;
   tx, ty, i : integer;
begin
   m_btDir := 0;
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTime:= Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            //동작이 끝남.
            m_nCurrentAction := 0; //동작 완료
            m_boUseEffect := FALSE;
            bo260 := FALSE;
         end;

         if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame = 4) then begin
            PlayScene.NewMagic (self, MAGIC_FIREBURN, MAGIC_FIREBURN, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY, 0, mtThunder, FALSE, 30, bofly);
            PlaySound(8222);
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end
    else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TDragonStatue.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
begin
   inherited DrawEff(dsurface, dx, dy);
   if g_boEffect then begin
   if m_boUseEffect then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;


{TExplosionMon }

procedure TExplosionMon.Run;    //폭마야차
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   meff: TFlyingStone;
   bo11:Boolean;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
            meff := TFlyingStone (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mtFlyStone));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 50;
               meff.FlyImageBase:= 1040;
            end;

                PlayScene.NewMagic (self,
                                      MAGIC_EXPLOSIN, //11,
                                      MAGIC_EXPLOSIN,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bo11);
                PlaySound (2526);

         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


{TArcherMon2 }

procedure TArcherMon2.Run;    //폭마야차
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   meff: TFlyingStone;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
            meff := TFlyingStone (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mtFlyStone));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 50;
               meff.FlyImageBase:= 1410;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

{ TPBOMA1Mon }

procedure TPBOMA1Mon.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   meff: TFlyingBug;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) and (m_nCurrentFrame - m_nStartFrame = 4) then begin
            meff := TFlyingBug (PlayScene.NewFlyObject (self,
                             m_nCurrX,
                             m_nCurrY,
                             m_nTargetX,
                             m_nTargetY,
                             m_nTargetRecog,
                             mt15));
            if meff <> nil then begin
               meff.ImgLib := g_WMonImagesArr[21];
               meff.NextFrameTime := 50;
               meff.FlyImageBase:=350;
               meff.MagExplosionBase := 430;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

{TGreatKing}   //염마태자

procedure TGreatKing.CalcActorFrame;        //염마태자
var
   pm: PTMonsterAction;
begin
   m_btDir:=0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace, m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_DIGUP: begin
       Shift (0, 0, 0, 1);
       m_nStartFrame:=0;
       m_nEndFrame:=9;
       m_dwFrameTime:=300;
       m_dwStartTime:=GetTickCount;
     end;
     SM_HIT: begin
       m_nStartFrame:=0;
       m_nEndFrame:=5;
       m_dwFrameTime:=120;
       m_dwStartTime:=GetTickCount;
       m_boUseEffect:=True;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;
       m_nEffectEnd:=5;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=120;
       m_nCurEffFrame:=0;
       m_boUseMagic:=True;
       m_dwWarModeTime:=GetTickcount;
       Shift (m_btDir, 0, 0, 1);

     end;
     SM_STRUCK: begin
       m_nStartFrame:=0;
       m_nEndFrame:=2;
       m_dwFrameTime:=160;
       m_dwStartTime:=GetTickCount;
     end;
     SM_84..SM_86: begin
       m_nStartFrame:=0;
       m_nEndFrame:=5;
       m_dwFrameTime:=120;
       m_dwStartTime:=GetTickCount;
       m_boUseEffect:=True;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;
       m_nEffectEnd:=5;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=120;
       m_nCurEffFrame:=0;
       m_boUseMagic:=True;
       m_dwWarModeTime:=GetTickcount;
       Shift (m_btDir, 0, 0, 1);
     end;
     SM_DEATH:
      begin
        m_nCurrentFrame := 0;
        m_nStartFrame:=80;
        m_nEndFrame:=81;
        m_boUseEffect:=FALSE;
        m_boDelActionAfterFinished := TRUE;
      end;
     SM_NOWDEATH:
      begin
        m_nCurrentFrame := 0;
        m_nStartFrame:=80;
        m_nEndFrame:=81;
        m_nCurrentFrame := 0;
        m_boUseEffect:=FALSE;
        m_boDelActionAfterFinished := TRUE;
      end;
   end;
end;

constructor TGreatKing.Create;                 //염마태자
begin
  inherited;
  n270:=nil;
end;

procedure TGreatKing.DrawEff(dsurface: TDirectDrawSurface; dx,   //염마태자
  dy: integer);
begin
  if m_boDeath then exit;
  inherited;
  if m_boUseEffect and (n270 <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n270, 1);
  end;
end;

procedure TGreatKing.LoadSurface;           //파천마룡
begin
   inherited;

   if (not m_boReverseFrame) then begin
       case m_nCurrentAction of
         SM_HIT: begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (3470 + m_nCurrentFrame, m_nPx, m_nPy);
         end;

         SM_84..SM_86: begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (3470 + m_nCurrentFrame, m_nPx, m_nPy);
         end;

         else begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy);
         end;
       end;
     end else begin
       case m_nCurrentAction of
         SM_HIT: begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (3470 + m_nEndFrame - m_nCurrentFrame, ax, ay);
         end;
         SM_84..SM_86: begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (3470 + m_nEndFrame - m_nCurrentFrame, ax, ay);
         end;
         else begin
           m_BodySurface := g_WMonImagesArr[30].GetCachedImage (GetOffset (m_wAppearance) + m_nEndFrame - m_nCurrentFrame, m_nPx, m_nPy);
         end;
       end;
   end;

   if m_boUseEffect then begin
     case m_nCurrentAction of
       SM_HIT: begin
         n270 := g_WMonImagesArr[30].GetCachedImage (3510 + m_nEffectFrame, ax, ay);
       end;
       SM_84: begin
         n270 := g_WMonImagesArr[30].GetCachedImage (3510 + m_nEffectFrame, ax, ay);
       end;
       SM_85: begin
         n270 := g_WMonImagesArr[30].GetCachedImage (3510 + m_nEffectFrame, ax, ay);
       end;
       SM_86: begin
         n270 := g_WMonImagesArr[30].GetCachedImage (3510 + m_nEffectFrame, ax, ay);
       end;
       else begin
         n270 := g_WMonImagesArr[30].GetCachedImage (3510 + m_nEffectFrame, ax, ay);
       end;

     end;
   end;


end;

procedure TGreatKing.Run;         //염마태자
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   if m_boRunSound then begin
     m_boRunSound:=False;
   end;

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if (m_nCurrentAction = SM_84) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
              PlayScene.NewMagic (Self,84,84,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,100,bo11);
              PlaySound(3247);
           end;
         end;
         if (m_nCurrentAction = SM_85) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
              PlayScene.NewMagic (Self,85,85,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,100,bo11);
              PlaySound(3248);
           end;
         end;
         if (m_nCurrentAction = SM_86) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
              PlayScene.NewMagic (Self,86,86,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,True,100,bo11);
              PlaySound(3249);
           end;
         end;

      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;




{TBossTreeMan}

procedure TBossTreeMan.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_btDir:=0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of

     SM_DIGUP: begin
       Shift (0, 0, 0, 1);
       m_nStartFrame:=0;
       m_nEndFrame:=9;
       m_dwFrameTime:=300;
       m_dwStartTime:=GetTickCount;
     end;
     SM_HIT: begin
       m_nStartFrame:=0;
       m_nEndFrame:=10;
       m_dwFrameTime:=100;
       m_dwStartTime:=GetTickCount;
       m_boUseEffect:=True;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;
       m_nEffectEnd:=10;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=100;
       m_nCurEffFrame:=0;
       m_boUseMagic:=True;
       m_dwWarModeTime:=GetTickcount;
       Shift (m_btDir, 0, 0, 1);

     end;
     SM_STRUCK: begin
       m_nStartFrame:=0;
       m_nEndFrame:=3;
       m_dwFrameTime:=120;
       m_dwStartTime:=GetTickCount;
     end;
     SM_LIGHTING: begin
       m_nStartFrame:=0;
       m_nEndFrame:=10;
       m_dwFrameTime:=100;
       m_dwStartTime:=GetTickCount;
       m_boUseEffect:=True;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;
       m_nEffectEnd:=15;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=100;
       m_nCurEffFrame:=0;
       m_boUseMagic:=True;
       m_dwWarModeTime:=GetTickcount;
       Shift (m_btDir, 0, 0, 1);
       PlaySound(3858);
     end;
     SM_DEATH:
      begin
        m_nCurrentFrame := 0;
        m_nStartFrame:=40;
        m_nEndFrame:=50;
        m_boUseEffect:=FALSE;
        m_boDelActionAfterFinished := TRUE;
      end;
     SM_NOWDEATH:
      begin
        m_nCurrentFrame := 0;
        m_nStartFrame:=40;
        m_nEndFrame:=50;
        m_nCurrentFrame := 0;
        m_boUseEffect:=FALSE;
        m_boDelActionAfterFinished := TRUE;
      end;

   end;
end;

constructor TBossTreeMan.Create;
begin
  inherited;
  n270:=nil;
end;

procedure TBossTreeMan.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  if m_boDeath then exit;
  inherited;
  if g_boEffect then begin
  if m_boUseEffect and (n270 <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n270, 1);
  end;
  end;
end;

procedure TBossTreeMan.LoadSurface;
var
  mimg:TWMImages;
begin

   mimg := g_WMonImagesArr[36];

   if mimg = nil then exit;
     if (not m_boReverseFrame) then begin
       case m_nCurrentAction of
         SM_HIT,SM_LIGHTING: begin
           m_BodySurface := mimg.GetCachedImage (3320 + m_nCurrentFrame, m_nPx, m_nPy);
         end;

         else begin
           m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy);
         end;
       end;
     end else begin
       case m_nCurrentAction of
         SM_HIT,SM_LIGHTING: begin
           m_BodySurface := mimg.GetCachedImage (3320 + m_nEndFrame - m_nCurrentFrame, ax, ay);
         end;

         else begin
           m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nEndFrame - m_nCurrentFrame, m_nPx, m_nPy);
         end;
       end;
     end;


   if m_boUseEffect then begin
     case m_nCurrentAction of
       SM_HIT: begin
         m_boUseEffect := FALSE;
       end;
       SM_LIGHTING: begin
         n270 := g_WMonImagesArr[36].GetCachedImage (3410 + m_nEffectFrame, ax, ay);
       end;
     end;
   end;


end;

procedure TBossTreeMan.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
begin

   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   if m_boRunSound then begin
     m_boRunSound:=False;
   end;

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;



{ TElectBossMon }

constructor TElectBossMon.Create;        //오마제사장
begin
  inherited Create;
  n26C:=nil;
end;

destructor TElectBossMon.Destroy;       //오마제사장
begin
   inherited Destroy;
end;

procedure TElectBossMon.LoadSurface;        //오마제사장
begin
  inherited;
  if bo260 then begin
    case m_btRace of


      205: begin    //오마흑령
       bo260 := False;    //죽음 이팩 x
       m_boUseEffect := False;
      end;

    end;
  end else begin
    if m_boUseEffect then begin
      case m_btRace of



        205: begin  //오마흑령
             case m_nCurrentAction of
               SM_HIT: begin     //일반공격
                n26C := g_WMonImagesArr[37].GetCachedImage (
                            5770 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;
               SM_LIGHTING: begin   //전체공격
                n26C := g_WMonImagesArr[37].GetCachedImage (
                            5850 + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;


               SM_LIGHTING_1: begin   //대상 5x5
                  n26C := g_WMonImagesArr[37].GetCachedImage (
                            5890 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                            ax, ay);
               end;

               SM_LIGHTING_2: begin  //원거리 1인 공격
                  m_boUseEffect:= False;
               end;

               SM_LIGHTING_3: begin
                 m_boUseEffect:= False;
               end;

             end;
         end;

      end;
    end;
  end;
end;

procedure TElectBossMon.CalcActorFrame;           //오마제사장
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_HIT: begin
       Shift (m_btDir, 0, 0, 1);
       m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;


     end;
     SM_STRUCK: begin
       m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
       m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
       m_dwFrameTime := pm.ActStruck.ftime;
       m_dwStartTime := GetTickCount;
       PlaySound(3944);
     end;

     SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       PlaySound(3945);
     end;


     SM_LIGHTING_1,
     SM_LIGHTING: begin

       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_nCurEffFrame:=0;
       m_boUseEffect := TRUE;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;


     end;
     SM_LIGHTING_2:
         begin
              m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical2.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;


         end;
     SM_LIGHTING_3:
         begin
              m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
              m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
              m_dwFrameTime := pm.ActCritical3.ftime;
              m_dwStartTime := GetTickCount;
              m_nCurEffFrame:=0;
              m_boUseEffect := TRUE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              m_boUseEffect := TRUE;
              m_nEffectFrame := m_nStartFrame;
              m_nEffectStart := m_nStartFrame;
              m_nEffectEnd := m_nEndFrame;
              m_dwEffectStartTime := GetTickCount;
              m_dwEffectFrameTime := m_dwFrameTime;


          end;

     else begin
       inherited CalcActorFrame;
     end;
   end;

end;


procedure TElectBossMon.Run;             //오마제사장
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   meff: TFlyingFireBall;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN)or (m_nCurrentAction = SM_HORSERUN)  then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if (m_nCurrentAction = SM_HIT) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_3) and (m_nCurrentFrame-m_nStartFrame = 1)then begin
             PlayScene.NewMagic (self, MAGIC_MED_ATT1_2,MAGIC_MED_ATT1_2,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bo11);
             PlaySound (3748);
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 4)then begin

         end;
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 4) then begin

         end;
         if m_nCurrentAction = SM_LIGHTING then begin

         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;



procedure TElectBossMon.DrawEff(dsurface: TDirectDrawSurface; dx,   //오마제사장
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);
  if g_boEffect then begin
  if m_boUseEffect and (n26C <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,n26C, 1);
  end;
  end;
end;


//파천마룡(화룡) -------------------------------------------------------------------------------
constructor TFireDragon.Create;     //마룡
begin
   inherited Create;

   AttackEffectSurface := nil;
   LightningTimer := TTimer.Create (nil);  //파천마룡
   LightningTimer.Interval := 70;
   LightningTimer.Tag := 0;
   LightningTimer.OnTimer := LightningTimerTimer;
   LightningTimer.Enabled := False; //FireDragon
   m_nDownDrawLevel := 1;
end;

destructor TFireDragon.Destroy;       //마룡
begin

   if LightningTimer <> nil then LightningTimer.Free;

   inherited Destroy;

end;

procedure  TFireDragon.LoadSurface;    //마룡
var
   mimg: TWMImages;
begin
   mimg := g_WDragonImg;


   if mimg <> nil then begin
      if (not m_boReverseFrame) then begin
             case m_nCurrentAction of
                SM_LIGHTING:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 40+ m_ncurrentframe, m_npx, m_npy);
                SM_81: // FireDragon
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 10+ m_ncurrentframe, m_npx, m_npy);
                SM_82:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 20+ m_ncurrentframe, m_npx, m_npy);
                SM_83:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 30+ m_ncurrentframe, m_npx, m_npy);
                else
                   m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_ncurrentframe, m_npx, m_npy);
             end;
      end
      else begin
             case m_nCurrentAction of
                SM_LIGHTING:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 40+ m_nendframe - m_ncurrentframe, ax, ay);
                SM_81: // FireDragon
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 10+ m_nendframe - m_ncurrentframe, ax, ay);
                SM_82:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 20+ m_nendframe - m_ncurrentframe, ax, ay);
                SM_83:
                   m_BodySurface := g_WDragonImg.GetCachedImage ( 30+ m_nendframe - m_ncurrentframe, ax, ay);
                else
                   m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nendframe - m_ncurrentframe, m_npx, m_npy);
             end;
      end;
   end;

   if m_BoUseEffect then begin
          case m_nCurrentAction of
             SM_LIGHTING:
                AttackEffectSurface := g_WDragonImg.GetCachedImage ( 60+ m_neffectframe, ax, ay);
             SM_81: // FireDragon
                AttackEffectSurface := g_WDragonImg.GetCachedImage ( 90+ m_neffectframe, ax, ay);
             SM_82:
                AttackEffectSurface := g_WDragonImg.GetCachedImage (100+ m_neffectframe, ax, ay);
             SM_83:
                AttackEffectSurface := g_WDragonImg.GetCachedImage (110+ m_neffectframe, ax, ay);
          end;
   end;
   if m_btRace = 83 then begin
      m_npx := m_npx - 14;
      m_npy := m_npy - 15;
      ax := ax - 14;
      ay := ay - 15;
   end;

end;

procedure TFireDragon.CalcActorFrame;       //마룡
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
//   startframe2: integer;
begin
   m_btDir := 0;
   m_ncurrentframe := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPm (m_btRace, m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of

      SM_TURN:
         begin
            starttime := GetTickCount;
            m_ndefframecount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);

         end;
      SM_WALK, SM_BACKSTEP:
         begin

         end;
      SM_HIT:    // 근거리 공격
         begin

         end;

      SM_LIGHTING,SM_LIGHTING_1..SM_LIGHTING_3:
         begin
            m_nstartframe := 0;
            m_nendframe   := 19;
            m_dwframetime  := 150;

            starttime  := GetTickCount;

            m_BoUseEffect := TRUE;
            m_neffectframe := 0;
            m_neffectstart := 0;

            m_neffectend   := 19;
            m_dweffectstarttime := GetTickCount;
            m_dweffectframetime := 150;

            m_nCurEffFrame := 0;
            m_BoUseMagic := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_81, SM_82, SM_83:
         begin
            if m_btRace = 83 then begin
               m_nstartframe := 0;
               m_nendframe   := 5;
               m_dwframetime  := 150;
               starttime  := GetTickCount;

               m_BoUseEffect := TRUE;
               m_neffectframe := 0;
               m_neffectstart := 0;

               m_neffectend   := 10;
               m_dweffectstarttime := GetTickCount;
               m_dweffectframetime := 150;

               m_nCurEffFrame := 0;
               m_BoUseMagic := TRUE;
               m_dwWarModeTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);
            end;
         end;
      SM_STRUCK:
         begin
            if m_btRace = 83 then begin
               m_nstartframe := 0;
               m_nendframe := 9;
               m_dwframetime := 300; //pm.ActStruck.ftime;
               starttime := GetTickCount;
            end;
         end;
      SM_NOWDEATH:
         begin

         end;
      SM_DEATH:
         begin

         end;
      SM_DIGUP: //걷기 없음, SM_DIGUP, 방향 없음.
         begin
            if m_btRace = 83 then begin
               //WarMode := FALSE;
               Shift (0, 0, 0, 1);
               m_nstartframe := 0;
               m_nendframe := 9;
               m_dwframetime := 300;
               starttime := GetTickCount;
            end;
         end;
   end;

end;


procedure TFireDragon.Run;                 //마룡
var
   prv: integer;
   effectframetimetime, frametimetime: longword;
   meff: TFlyingAxe;
   bofly: Boolean;
   tx, ty, i : integer;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   //사운드 효과
   if m_borunsound then begin
      PlaySound(8201);
      m_borunsound := False;
    end;

   if m_BoUseEffect then begin
      if m_boMsgMuch then effectframetimetime := Round(m_dweffectframetime * 2 / 3)
      else effectframetimetime := m_dweffectframetime;
      if GetTickCount - m_dweffectstarttime > effectframetimetime then begin
         m_dweffectstarttime := GetTickCount;
         if m_neffectframe < m_neffectend then begin
            Inc (m_neffectframe);
         end else begin
             m_BoUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_ncurrentframe;
   if m_nCurrentAction <> 0 then begin
      if (m_ncurrentframe < m_nstartframe) or (m_ncurrentframe > m_nendframe) then
         m_ncurrentframe := m_nstartframe;

      if m_boMsgMuch then frametimetime := Round(m_dwframetime * 2 / 3)
      else frametimetime := m_dwframetime;

      if GetTickCount - starttime > frametimetime then begin
         if m_ncurrentframe < m_nendframe then begin
            Inc (m_ncurrentframe);
            starttime := GetTickCount;
         end else begin
            //동작이 끝남.
            m_nCurrentAction := 0; //동작 완료
            m_BoUseEffect := FALSE;
        //    BoUseDieEffect := FALSE;
         end;


         if (m_nCurrentAction = SM_LIGHTING) and (m_ncurrentframe-m_nstartframe = 4) then begin
            PlaySound (8202);
            LightningTimer.Enabled := True;
         end else
         if ((m_nCurrentAction = SM_81) or (m_nCurrentAction = SM_82) or (m_nCurrentAction = SM_83))
             and (m_ncurrentframe-m_nstartframe = 4) then begin

                PlayScene.NewMagic (self,
                                      m_nCurrentAction, //11,
                                      m_nCurrentAction,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtFly,
                                      TRUE,
                                      30,
                                      bofly);
                PlaySound (8203);
         end;
      end;
      m_ncurrentdefframe := 0;
      m_dwdefframetime := GetTickCount;
   end else begin
      if GetTickCount - m_dwsmoothmovetime > 200 then begin
         if GetTickCount - m_dwdefframetime > 500 then begin
            m_dwdefframetime := GetTickCount;
            Inc (m_ncurrentdefframe);
            if m_ncurrentdefframe >= m_ndefframecount then
               m_ncurrentdefframe := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_ncurrentframe then begin
      m_dwloadsurfacetime := GetTickCount;
      LoadSurface;
   end;
end;


procedure TFireDragon.LightningTimerTimer(Sender: TObject);  //마룡
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin

    if m_btRace = 83 then begin
       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 800;
          Exit;
       end
       else LightningTimer.Interval := 70;
       tx := m_nCurrX - 5;
       ty := m_nCurrY + 3;



       Randomize;
       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx-3, ty+3, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx-3, ty-3, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+2, ty+1, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+3, ty-2, 0, mtThunder, FALSE, 30, bofly);
       end;

       n := random(4);
       kx := random(7);
       ky := random(5);
       case n of
          0: begin PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+kx-2, ty-ky+1, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx-kx+3, ty-ky+1, 0, mtThunder, FALSE, 30, bofly); end;
          1: begin PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx-kx,   ty+ky, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+kx+2, ty+ky, 0, mtThunder, FALSE, 30, bofly);   end;
          2: begin PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx-kx,   ty-ky+1, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+kx+3, ty+ky-1, 0, mtThunder, FALSE, 30, bofly); end;
          3: begin PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+kx-2, ty+ky, 0, mtThunder, FALSE, 30, bofly);
                   PlayScene.NewMagic (self, SM_DRAGON_LIGHTING, SM_DRAGON_LIGHTING, m_nCurrX, m_nCurrY, tx+kx+3, ty+ky+2, 0, mtThunder, FALSE, 30, bofly); end;
       end;

       if (LightningTimer.Tag mod 3) = 0 then PlaySound (8206);
       LightningTimer.Interval := LightningTimer.Interval + 15;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 70;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
    end;


end;

procedure TFireDragon.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);   //마룡
begin
   inherited DrawEff(dsurface, dx, dy);
   if (m_btRace = 83) or bo260 then begin
   if m_BoUseEffect then
      if AttackEffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    AttackEffectSurface, 1);
      end;
   end;
end;


constructor TKhazardMon.Create;
begin
  inherited;
end;

procedure TKhazardMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
     end;
     else begin
      inherited;
     end;
   end;
end;

constructor TFrostTiger.Create;        //환영한호
begin
  inherited;
  boActive:=FALSE;
  boCasted:=FALSE;
end;

procedure TFrostTiger.CalcActorFrame;     //환영한호
var
   pm: PTMonsterAction;
begin
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      boCasted:=TRUE;
      Shift (m_btDir, 0, 0, 1);
    end;
    SM_DIGDOWN: begin
      m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
      m_dwFrameTime := pm.ActDeath.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      boActive:=FALSE;
    end;
    SM_DIGUP: boActive:=TRUE;
    SM_WALK: begin
      boActive:=TRUE;
      inherited;
    end;
    SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwFrameTime := 160; //환영한호 프레임속도
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
    else begin
      inherited;
    end;
  end;
end;

procedure TFrostTiger.Run;             //환영한호
var
  bo11:boolean;
begin
  if (m_nCurrentAction = SM_LIGHTING) and (boCasted=TRUE) then begin
    boCasted:=FALSE;
    PlayScene.NewMagic (Self,1,39,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,False,30,bo11);
    PlaySound(m_nMagicFireSound);
  end;
  inherited;
end;

function  TFrostTiger.GetDefaultFrame (wmode: Boolean): integer;     //환영한호
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
  Result:=0;
  if boActive = FALSE then begin
    pm := GetRaceByPM (m_btRace,m_wAppearance);
    if pm = nil then exit;
    if m_boDeath then begin
      m_boUseEffect := False;
      inherited GetDefaultFrame(wmode);
      exit;
    end;
    m_nDefFrameCount := pm.ActDeath.frame;
    if m_nCurrentDefFrame < 0 then cf := 0
    else if m_nCurrentDefFrame >= pm.ActDeath.frame then cf := 0
    else cf := m_nCurrentDefFrame;
    Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip) + cf;
  end else
    Result:= inherited GetDefaultFrame(wmode);
end;

constructor TJumaThunderMon.Create;
begin
   inherited Create;
   m_boUseEffect := True;
   AttackEffectSurface := nil;
   EffBackSurface := nil;
   EffectSurface := nil;
end;


procedure TJumaThunderMon.LoadSurface;
begin
  inherited LoadSurface;
  case m_btRace of
      //몬스터
      104:
         begin
            if m_boUseEffect then begin
               EffectSurface := g_WMonImagesArr[22].GetCachedImage (m_nEffectFrame, ax, ay);
            end;
         end;
      155:
         begin
            if m_boUseEffect then begin
               EffectSurface := g_WMonImagesArr[26].GetCachedImage (m_nEffectFrame, ax, ay);
            end;
            if m_nCurrentAction <> SM_DEATH then begin
              EffBackSurface := g_WEffectImg.GetCachedImage(601, ex, ey);
            end else  EffBackSurface := nil;
         end;
   end;

end;


procedure TJumaThunderMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

    case m_nCurrentAction of
      SM_HIT, // 근거리 공격
      SM_FLYAXE:
         begin
            m_boUseEffect := TRUE;
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame  := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := 110;
            m_dwStartTime := GetTickCount;

            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            if m_btRace = 104 then begin
              m_nEffectFrame := 1100 + m_btDir * 10;
              m_nEffectStart := 1100 + m_btDir * 10;
            end else begin
              m_nEffectFrame := 3810 + m_btDir * 10;
              m_nEffectStart := 3810 + m_btDir * 10;
            end;
            m_nEffectEnd := m_nEffectStart + pm.ActAttack.frame-1;//endframe;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;
         end;

      SM_TURN:
         begin
            if (m_nState and STATE_STONE_MODE) <> 0 then begin
               m_boUseEffect := False;
               m_nStartFrame := 420 + m_btDir * 10;
               m_nEndFrame := m_nStartFrame;
               m_dwFrameTime := 100;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := 6;
            end else begin
               m_boUseEffect := True;
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
               m_dwFrameTime := 250;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := pm.ActStand.frame;
               if m_btRace = 104 then begin
                 m_nEffectFrame := 940 + m_btDir * 10;
                 m_nEffectStart := 940 + m_btDir * 10;
               end else begin
                 m_nEffectFrame := 3650 + m_btDir * 10;
                 m_nEffectStart := 3650 + m_btDir * 10;
               end;
               m_nEffectEnd := m_nEffectStart + pm.ActStand.frame-1;//endframe;
               m_dwEffectStartTime := GetTickCount;
               m_dwEffectFrameTime := m_dwFrameTime;
            end;

            Shift (m_btDir, 0, 0, 1);
         end;
      SM_WALK, SM_BACKSTEP:
         begin
            m_boUseEffect := TRUE;
            m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := 160; //pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            if m_btRace = 104 then begin
              m_nEffectFrame := 1020 + m_btDir * 10;;
              m_nEffectStart := 1020 + m_btDir * 10;;
            end else begin
              m_nEffectFrame := 3730 + m_btDir * 10;;
              m_nEffectStart := 3720 + m_btDir * 10;;
            end;
            m_nEffectEnd := m_nEffectStart + pm.ActWalk.frame-1;//endframe;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;

            //WarMode := FALSE;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_WALK then begin
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            end
            else begin  //sm_backstep
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
            end;
         end;

      SM_DIGUP: //걷기 없음, SM_DIGUP, 방향 없음.
         begin
            m_nStartFrame := 420 + m_btDir * 10;
            m_nEndFrame := m_nStartFrame + 5;
            m_dwFrameTime := 150;
            m_dwStartTime := GetTickCount;
            //WarMode := FALSE;
            Shift (m_btDir, 0, 0, 1);
         end;

      SM_STRUCK:
         begin
            m_boUseEffect := TRUE;
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := 90; //pm.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
            if m_btRace = 104 then begin
              m_nEffectFrame := 1180 + m_btDir * 10;
              m_nEffectStart := 1180 + m_btDir * 10;
            end else begin
              m_nEffectFrame := 3890 + m_btDir * 10;
              m_nEffectStart := 3890 + m_btDir * 10;
            end;
            m_nEffectEnd := m_nEffectStart + pm.ActStruck.frame-1;//endframe;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;
         end;

      SM_DEATH:
         begin
            m_boUseEffect := False;
            m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := 100;
            m_dwStartTime := GetTickCount;
         end;

      SM_LIGHTING:
         begin
            m_boUseEffect := TRUE;
            m_nStartFrame := 340 + m_btDir * 10;
            m_nEndFrame   := m_nStartFrame + 5;
            m_dwFrameTime  := 180;
            m_dwStartTime  := GetTickCount;
            m_nCurEffFrame := 0;
            m_boUseMagic := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            if m_btRace = 104 then begin
              m_nEffectFrame := 1200 + m_btDir * 10;
              m_nEffectStart := 1200 + m_btDir * 10;
            end else begin
              m_nEffectFrame := 3910 + m_btDir * 10;
              m_nEffectStart := 3910 + m_btDir * 10;
            end;
            m_nEffectEnd := m_nEffectStart + 5;//endframe;
            m_dwEffectStartTime := GetTickCount;
            m_dwEffectFrameTime := m_dwFrameTime;
         end;
      else
         inherited CalcActorFrame;
   end;
end;


procedure TJumaThunderMon.DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
begin
   if g_BoEffect then begin
      if EffBackSurface <> nil then begin
         DrawBlend (dsurface,     //DrawBlend3  2
                    dx + ex + m_nShiftX,
                    dy + ey + m_nShiftY,
                    EffBackSurface, 1);
      end;
   end;
end;


procedure TJumaThunderMon.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
begin
   if g_BoEffect then begin
   if m_boUseEffect then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;



procedure TYimoogi.CalcActorFrame;   //부룡금사
var
   pm: PTMonsterAction;
begin
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_FLYAXE: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=6;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActCritical.ftime;
      m_nCurEffFrame:=0;
    end;
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=2;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActAttack.ftime;
      m_nCurEffFrame:=0;
    end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
    end;
    SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 10;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
     end;
    else begin
      inherited;
    end;
  end;
end;

procedure TYimoogi.LoadSurface;
var
  bo11:boolean;
  Meff:TMagicEff;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      AttackEffectSurface := nil;
      if (m_nEffectFrame = 1) then begin
        meff := TObjectEffects.Create(self,g_WMagic2Images,1330,10,100,TRUE);
        meff.ImgLib := g_WMagic2Images;
        PlayScene.m_EffectList.Add (meff);
      end;
    end;
    SM_FLYAXE: begin
      AttackEffectSurface := g_WMonImagesArr[22].GetCachedImage (
                        2820 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
      if (m_nEffectFrame = 3) then begin
        PlayScene.NewMagic (Self,93,93,m_nCurrX,m_nCurrY,m_nCurrX,m_nCurrY,0,mtExplosion,False,30,bo11);
           //PlaySound(8222);
      end;
    end;
    SM_NOWDEATH: begin
         AttackEffectSurface := g_WMonImagesArr[22].GetCachedImage (
                                2900 + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
    end;
  end;
end;


procedure TGuardianRock.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_btDir:=0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_HIT: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=3;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActAttack.ftime;
     // m_nCurEffFrame:=50;
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TBlackFox.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);

      if m_btRace = 109 then begin
       m_boUseEffect := TRUE;
       m_nEffectFrame := 350 + m_btDir * 10;
       m_nEffectStart := m_nEffectFrame;
       m_nEffectEnd   := m_nEffectFrame+5;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwframetime;
       PlaySound (2506);
      end;

      if m_btRace = 136 then begin
       PlaySound (3406);
      end;
    end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
    end;
    SM_NOWDEATH: begin
      if m_btRace = 109 then begin
       m_nStartFrame := pm.ActDie.start;
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 10;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
      end;
      if m_btRace = 136 then begin //멸귀
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 10;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
      end;
     end;
    else begin
      inherited;
    end;
  end;
end;

procedure TBlackFox.LoadSurface;
begin
  inherited;
  if m_btRace = 109 then begin
   case m_nCurrentAction of
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                        350 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);

    end;
    SM_NOWDEATH: begin
         AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                                340 + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
    end;
   end;
  end;

  if m_btRace = 136 then begin   //멸귀
   case m_nCurrentAction of
    SM_NOWDEATH: begin
         AttackEffectSurface := g_WMonImagesArr[32].GetCachedImage (
                                440 + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
    end;
   end;
  end;
end;

procedure TGuardianRock.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
         AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                        1435 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

constructor TRedeffect.Create;
begin
  inherited Create;
   m_boUseEffect := True;
   EffectSurface := nil;
end;

procedure TRedeffect.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN: begin
           if (m_nState and STATE_STONE_MODE) <> 0 then begin
             m_boUseEffect := False;
             m_nStartFrame := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
             m_nEndFrame := m_nStartFrame;
             m_dwFrameTime := pm.ActDeath.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := pm.ActDeath.frame;
           end else begin
             m_boUseEffect := TRUE;
             m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
             m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
             m_dwFrameTime := pm.ActStand.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := pm.ActStand.frame;
           end;
           Shift(m_btDir, 0, 0, 1);
        end;
     SM_HIT, SM_LIGHTING: // 근거리 공격
         begin
            m_boUseEffect := TRUE;
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
             m_boUseEffect := True;
           Shift(m_btDir, 0, 0, 1);
         end;
      else
      inherited;
  end;
end;



procedure TRedEffect.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
begin
 //
end;

procedure TRedEffect.DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
begin
   if g_BoEffect then begin
   if m_boUseEffect then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,                 //DrawBlend3
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;


procedure TRedeffect.LoadSurface;
begin
   inherited LoadSurface;
   case m_btRace of
      //몬스터
      150:
         begin
           EffectSurface := g_WEffectImg.GetCachedImage (600, ax, ay);
         end;
      151:
         begin
           EffectSurface := g_WEffectImg.GetCachedImage (601, ax, ay);
         end;
   end;
end;


{ TExplosionSpider2 }

procedure TExplosionSpider2.CalcActorFrame;
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
      m_boUseEffect:=False;
    end;
    SM_NOWDEATH: begin
      m_nEffectStart:=m_nStartFrame;
      m_nEffectFrame:=m_nStartFrame;
      m_dwEffectStartTime:=GetTickCount();
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectEnd:=m_nEndFrame;
      m_boUseEffect:=True;
    end;
  end;
end;

procedure TExplosionSpider2.LoadSurface;
begin
  inherited;
  if m_boUseEffect then
    AttackEffectSurface := g_WMonImagesArr[13].GetCachedImage (
                        730 + m_nEffectFrame-m_nEffectStart,
                        ax, ay);
end;

procedure TGumimasin.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_HIT: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=pm.ActAttack.start;
      m_nEffectFrame:=pm.ActAttack.start;
      m_nEffectEnd:=pm.ActAttack.start + pm.ActAttack.frame -1;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;;
      m_nCurEffFrame:=150;
  //    PlaySound(2788);
    end;
    SM_LIGHTING: begin
     m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
   //   PlaySound(2786);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TGumimasin.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
begin
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
          //  bo260:=False;
         end;
         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             if (m_btRace = 157) then begin //leftguard
               PlayScene.NewMagic (Self,7,9,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtGumizul2,False,30,bo11);
               PlaySound(10112);
             end;
            end;
           end;
          end;
         end;
end;


procedure TGumimasin.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
         m_boUseEffect := TRUE;
         AttackEffectSurface := g_WMonImagesArr[25].GetCachedImage (
                                2950  + m_nEffectFrame - m_nEffectStart,
                                ax, ay);
    end;
    SM_LIGHTING: begin
         m_boUseEffect := TRUE;
         AttackEffectSurface := g_WMonImagesArr[10].GetCachedImage (
                                2904  + m_nEffectFrame - m_nEffectStart,
                                ax, ay);
    end;
  end;
end;



procedure TElement.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
  bo11: Boolean;
begin
//  m_btDir:=0;
  if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

  if n278 <> nil then begin
    DrawBlend (dsurface, dx + n270 + m_nShiftX, dy + n274 + m_nShiftY, n278, 1);
  end;
  ceff := GetDrawEffectValue;

  if m_BodySurface <> nil then begin
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  end;
end;

procedure TElement.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   if mimg <> nil then begin
       m_BodySurface := mimg.GetCachedImage (
                            1450 + m_nCurrentFrame,
                            m_nPx, m_nPy);
       n278 := mimg.GetCachedImage (
                            1500 + m_nCurrentFrame,
                            n270, n274);
  end;
end;


{ TFireLead }

constructor TFireLead.Create;     //염화적귀
begin
  inherited Create;
   AttackEffectSurface:=nil;
end;

destructor TFireLead.Destroy;
begin
   inherited Destroy;
end;

procedure TFireLead.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   m_boUseEffect :=True;
   if mimg <> nil then
   m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy);

  if m_boUseEffect then begin
    if m_btRace = 101 then begin    //염화적귀
     AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage ( 1890+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 114 then begin    //열장적귀
     AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage ( 2820+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 121 then begin    //청신시
     AttackEffectSurface := g_WMonImagesArr[13].GetCachedImage ( 1170+340 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 123 then begin    //연혼흑괴수
     AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage ( 1720+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 124 then begin    //거도적귀
     AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage ( 3840+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 128 then begin    //패검적귀
     AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage ( 4770+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 129 then begin    //독인적귀
     AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage ( 5870+500 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 148 then begin    //견빙수호장
     AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage ( 0+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 149 then begin    //마염수호장
     AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage ( 880+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 160 then begin    //암혼수호장
     AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage ( 1740+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 163 then begin    //열진수호장
     AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage ( 2600+420 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 168 then begin    //검은망치괭이
     AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage ( 2020+560 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 170 then begin    //무당괭이
     AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage ( 4600+500 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 172 then begin    //호중귀1
     AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage ( 6030+400 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 173 then begin    //고대수호귀
     AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage ( 5900+580 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 175 then begin    //묘장군
     AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage ( 6920+800 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 213 then begin    //한빙수호귀
     AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage ( 2740+500 + m_nCurrentFrame, ax, ay);
    end;
    if m_btRace = 219 then begin    //오마흑령
     AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage ( 3850+980 + m_nCurrentFrame, ax, ay);
    end;

   if m_btRace = 101 then begin         //염화적귀
    case m_nCurrentAction of
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage (
                         2730 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 118 then begin         //원오
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage (
                         4539 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage (
                         4731 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_NOWDEATH: begin
        AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage (
                         4530 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 123 then begin         //연혼흑괴수
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[5].GetCachedImage (
                         2650 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 128 then begin         //패검적귀
    case m_nCurrentAction of
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[29].GetCachedImage (
                         5610 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace in [148,149,160,163] then begin         //견빙수호장
    case m_nCurrentAction of
      SM_NOWDEATH: begin
        AttackEffectSurface := g_WMonImagesArr[30].GetCachedImage (
                         860 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 168 then begin         //검은망치괭이
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage (
                         1850 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage (
                         3140 + (m_btDir * 20) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;


   if m_btRace = 175 then begin         //묘장군
    case m_nCurrentAction of
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage (
                         8680 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_3: begin
        AttackEffectSurface := g_WMonImagesArr[33].GetCachedImage (
                         8760 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 213 then begin         //한빙수호귀
    case m_nCurrentAction of
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                         3670 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_2: begin
        AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                         3750 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;

   if m_btRace = 219 then begin         //오마흑령
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                         5772 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                         5850 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_2: begin
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                         5980 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_3: begin
        AttackEffectSurface := g_WMonImagesArr[37].GetCachedImage (
                         6010 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
    end;
   end;



  end;
end;


procedure TFireLead.CalcActorFrame;
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_TURN:
         begin
            m_dwStartTime := GetTickCount;
            m_nDefframecount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := pm.ActStand.frame;
               Shift (m_btDir, 0, 0, 1);
     end;

      SM_WALK, SM_BACKSTEP:
         begin
               m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
               m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
               m_dwFrameTime := pm.ActWalk.ftime;
               m_dwStartTime := GetTickCount;

               m_nMoveStep := 1;
               if m_nCurrentAction = SM_WALK then
                  Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
               else
                  Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_HIT:    // 근거리 공격
         begin
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip); // pm.ActAttack.start + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + pm.ActAttack.frame - 1;
               m_dwFrameTime := pm.ActAttack.ftime;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;

               if m_btRace in [123,168,173,219] then begin  //고대수호장 검은망치괭이 연혼흑괴수
                 m_boUseEffect := TRUE;

                 m_nEffectFrame := m_nStartFrame;
                 m_nEffectStart := m_nStartFrame;
                 m_nEffectEnd := m_nEndFrame;
                 m_dwEffectStartTime := GetTickCount;
                 m_dwEffectFrameTime := m_dwFrameTime;
               end;

               if m_btRace = 168 then begin  //검은망치괭이
                 PlaySound2 (hammercat_att);
               end;

               if m_btRace = 170 then begin  //무당괭이
                 PlaySound2 (shamancat_att);
               end;
               if m_btRace = 172 then begin  //호중귀1
                 PlaySound2 (pot1_atk);
               end;
               if m_btRace = 173 then begin  //고대수호장
                 PlaySound (3292);
               end;
               if m_btRace = 173 then begin  //묘장군
                 PlaySound (3597);
               end;

         end;

     SM_LIGHTING,SM_LIGHTING_1,SM_LIGHTING_2,SM_LIGHTING_3: begin
       if (m_nCurrentAction = SM_LIGHTING) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical.frame - 1;
           m_dwFrameTime := pm.ActCritical.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           if (m_btRace = 101) then begin    //염화적귀
             PlaySound(3156);
           end;
           if (m_btRace = 114) then begin    //열장적귀
             PlaySound(3166);
           end;
           if (m_btRace = 124) then begin    //거도적귀
             PlaySound(3176);
           end;
           if (m_btRace = 128) then begin    //패검적귀
             PlaySound(3186);
           end;
           if (m_btRace = 129) then begin    //독인적귀
             PlaySound(3196);
           end;
           if (m_btRace = 168) then begin    //검은망치괭이
             PlaySound2 (blackhammercat_att);
           end;
           if (m_btRace = 170) then begin    //무당괭이
             PlaySound2 (shamancat_att2);
           end;
           if m_btRace = 172 then begin  //호중귀1
             PlaySound2 (pot3_atk);
           end;
           if m_btRace = 213 then begin  //한빙수호귀
             PlaySound (3066);
           end;
           if m_btRace = 219 then PlaySound(3986);//오마흑령
       end
       else if (m_nCurrentAction = SM_LIGHTING_1) then begin
         if m_btRace = 129 then begin     //독인적귀
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical2.frame - 1;
           m_dwFrameTime := pm.ActCritical2.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
         end;

         if m_btRace = 118 then begin     //원호 소환
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical2.frame - 1;
           m_dwFrameTime := pm.ActCritical2.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
         end;

       end
       else if (m_nCurrentAction = SM_LIGHTING_2) then begin
         if m_btRace in [170,173,175,213,219] then begin  //무당괭이
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical2.frame - 1;
           m_dwFrameTime := pm.ActCritical2.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;

           if m_btRace = 173 then begin  //고대수호장
             PlaySound(3298);
           end;
           if m_btRace = 175 then begin  //묘장군
             PlaySound(3598);
           end;
           if m_btRace = 213 then begin  //한빙수호귀
             PlaySound (3067);
           end;
           if m_btRace = 219 then PlaySound(3988);//오마흑령

         end;
         if m_btRace in [118] then begin  //원오 바닥손
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical3.frame - 1;
           m_dwFrameTime := pm.ActCritical3.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
         end;


       end
       else if (m_nCurrentAction = SM_LIGHTING_3) then begin
          if m_btRace in [173,175,219] then begin  //무당괭이
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical3.frame - 1;
           m_dwFrameTime := pm.ActCritical3.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;

            if m_btRace = 173 then begin  //고대수호장
             PlaySound(3292);
            end;
            if m_btRace = 175 then begin  //묘장군
             PlaySound(3599);
            end;
            if m_btRace = 219 then PlaySound(3989);//오마흑령
          end;

          if m_btRace in [118] then begin  //원오 헤비
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActAttack2.start + m_btDir * (pm.ActAttack2.frame + pm.ActAttack2.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActAttack2.frame - 1;
           m_dwFrameTime := pm.ActAttack2.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
          end;

       end;
     end;


     SM_STRUCK: begin
           m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
           m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
           m_dwFrameTime := pm.ActStruck.ftime;
           m_dwStartTime := GetTickCount;
     end;

    SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       if m_btRace in [148,149,160,163] then begin  //견빙수호장
         PlaySound (2547);
       end;

       if m_btRace = 168 then begin  //검은망치괭이
         PlaySound2 (hammercat_die_cat);
       end;
       if m_btRace = 170 then begin  //무당괭이
         PlaySound2 (shamancat_die_cat);
       end;
       if m_btRace = 172 then begin  //호중귀1
         PlaySound2 (pot3_die);
       end;
       if m_btRace = 173 then begin  //고대수호장
         PlaySound (3295);
       end;
    end;
   end;

   m_boUseEffect := TRUE;
end;

procedure TFireLead.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bofly: Boolean;
   meff: TFlyingAxe;
   tx, ty, i : integer;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);


   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := TRUE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


         if (m_nCurrentAction = SM_HIT) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

           end;
         end;

         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             if m_btRace = 114 then begin       //열장적귀
                 PlayScene.NewMagic (self, MAGIC_FIREEXPLOSIN, MAGIC_FIREEXPLOSIN,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 128 then begin       //패검적귀
                 PlayScene.NewMagic (self, MAGIC_SIDEARMS,MAGIC_SIDEARMS,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 129 then begin       //독인적귀
                 PlayScene.NewMagic (self, MAGIC_DAGGER,MAGIC_DAGGER,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 148 then begin       //견빙수호장
                 PlayScene.NewMagic (self, MAGIC_ICEGUARD,MAGIC_ICEGUARD,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 149 then begin       //마염수호장
                 PlayScene.NewMagic (self, MAGIC_MAGICGUARD,MAGIC_MAGICGUARD,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 160 then begin       //암혼수호장
                 PlayScene.NewMagic (self, MAGIC_DARKGUARD,MAGIC_DARKGUARD,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;

             if m_btRace = 163 then begin       //열진수호장
                 PlayScene.NewMagic (self, MAGIC_POWERGUARD,MAGIC_POWERGUARD,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
                 PlaySound (2526);
             end;
             if m_btRace = 172 then begin       //호중귀1
                 PlayScene.NewMagic (self, MAGIC_POT_ATT,MAGIC_POT_ATT,m_nCurrX, m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
             end;

           end;
         end else
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentAction-m_nStartFrame = 4) then begin

         end else
         if (m_nCurrentAction = SM_LIGHTING_2) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             if m_btRace = 173 then begin       //고대수호장
                 PlayScene.NewMagic (self, MAGIC_OLDKING_ATT1_2, MAGIC_OLDKING_ATT1_2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
             end;
             if m_btRace = 175 then begin       //묘장군
                PlayScene.NewMagic (Self,1,39,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtFly,False,30,bofly);
                PlaySound(m_nMagicFireSound);
             end;
             if m_btRace = 213 then begin       //한빙수호귀
               if Random(2) = 0 then begin
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_1,MAGIC_ICEKING_ATT1_1,m_nCurrX,m_nCurrY,m_nCurrX + Random(2),m_nCurrY - 4 - Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_2,MAGIC_ICEKING_ATT1_2,m_nCurrX,m_nCurrY,m_nCurrX - 4 - Random(2),m_nCurrY + 2 + Random(2) ,m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_3,MAGIC_ICEKING_ATT1_3,m_nCurrX,m_nCurrY,m_nCurrX + 4 + Random(2),m_nCurrY + 2 + Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_4,MAGIC_ICEKING_ATT1_4,m_nCurrX,m_nCurrY,m_nCurrX - Random(2),m_nCurrY + Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
               end else begin
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_1,MAGIC_ICEKING_ATT1_1,m_nCurrX,m_nCurrY,m_nCurrX + Random(2),m_nCurrY + 4 - Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_2,MAGIC_ICEKING_ATT1_2,m_nCurrX,m_nCurrY,m_nCurrX - 4 - Random(2),m_nCurrY - 2 - Random(2) ,m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_3,MAGIC_ICEKING_ATT1_3,m_nCurrX,m_nCurrY,m_nCurrX + 4 + Random(2),m_nCurrY - 2 - Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
                PlayScene.NewMagic (Self,MAGIC_ICEKING_ATT1_4,MAGIC_ICEKING_ATT1_4,m_nCurrX,m_nCurrY,m_nCurrX + Random(2),m_nCurrY - Random(2),m_nTargetRecog,mtThunder,False,30,bofly);
               end;
             end;
           end;
         end else
         if (m_nCurrentAction = SM_LIGHTING_3) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             if m_btRace = 173 then begin       //고대수호장
                 PlayScene.NewMagic (self, MAGIC_OLDKING_ATT1_1, MAGIC_OLDKING_ATT1_1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
             end;
           end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;

   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TFireLead.DrawEff(dsurface: TDirectDrawSurface; dx,  //염화적귀
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);;
  if g_boEffect then begin
  if m_boUseEffect and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
  end;
end;



{ TWindLead }

constructor TWindLead.Create;     //마풍석괴
begin
  inherited Create;
   AttackEffectSurface:=nil;
    AttackEffectSurface2:=nil;
end;

destructor TWindLead.Destroy;              //마풍석괴
begin
   inherited Destroy;
   AttackEffectSurface:=nil;
   AttackEffectSurface2:=nil;
end;

procedure TWindLead.LoadSurface;             //마풍석괴
var
  mimg:TWMImages;
begin

   mimg := GetMonImg (m_wAppearance);
   if mimg = nil then exit;
    m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy);

  if m_boUseEffect then begin
    case m_nCurrentAction of
      SM_HIT: begin
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage (
                         8040 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING: begin
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage (
                         8200 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_1: begin
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage (
                         8640 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_2: begin
        AttackEffectSurface := g_WMonImagesArr[40].GetCachedImage (
                         8730 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
      end;
      SM_LIGHTING_3: begin
       //
      end;
      SM_LIGHTING_4: begin
        AttackEffectSurface2 := g_WMonImagesArr[40].GetCachedImage (
                         8760 + m_nEffectFrame-m_nEffectStart,
                         ex,
                         ey);
      end;

    end;




  end;
end;


procedure TWindLead.CalcActorFrame;          //마풍석괴
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_TURN:
         begin
            m_boUseEffect := False;
            m_dwStartTime := GetTickCount;
            m_nDefframecount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
            m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
     end;

      SM_WALK, SM_BACKSTEP:
         begin
            m_boUseEffect :=False;
               m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
               m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
               m_dwFrameTime := pm.ActWalk.ftime;
               m_dwStartTime := GetTickCount;

               m_nMoveStep := 1;
               if m_nCurrentAction = SM_WALK then
                  Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
               else
                  Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_HIT:    // 근거리 공격
         begin
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip); // pm.ActAttack.start + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + pm.ActAttack.frame - 1;
               m_dwFrameTime := pm.ActAttack.ftime;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               m_boUseEffect := TRUE;
               m_nEffectFrame := m_nStartFrame;
               m_nEffectStart := m_nStartFrame;
               m_nEffectEnd := m_nEndFrame;
               m_dwEffectStartTime := GetTickCount;
               m_dwEffectFrameTime := m_dwFrameTime;
               PlaySound(4276);
         end;

     SM_LIGHTING,SM_LIGHTING_1,SM_LIGHTING_2,SM_LIGHTING_3,SM_LIGHTING_4: begin
       if (m_nCurrentAction = SM_LIGHTING) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical.frame - 1;
           m_dwFrameTime := pm.ActCritical.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           PlaySound(4278);
       end
       else if (m_nCurrentAction = SM_LIGHTING_1) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical2.frame - 1;
           m_dwFrameTime := pm.ActCritical2.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           PlaySound(4279);
       end
       else if (m_nCurrentAction = SM_LIGHTING_2) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical3.frame - 1;
           m_dwFrameTime := pm.ActCritical3.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;

           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           PlaySound(4276);
           PlaySound(4289);
       end
       else if (m_nCurrentAction = SM_LIGHTING_3) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical5.start + m_btDir * (pm.ActCritical5.frame + pm.ActCritical5.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical5.frame - 1;
           m_dwFrameTime := pm.ActCritical5.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := FALSE;
           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           PlaySound(4298);
           PlaySound(4299);
       end
       else if (m_nCurrentAction = SM_LIGHTING_4) then begin
           Shift (m_btDir, 0, 0, 1);
           m_nStartFrame := pm.ActCritical4.start + m_btDir * (pm.ActCritical4.frame + pm.ActCritical4.skip); // pm.ActAttack.start + m_btDir * 10;
           m_nEndFrame  := m_nStartFrame + pm.ActCritical4.frame - 1;
           m_dwFrameTime := pm.ActCritical4.ftime;
           m_dwStartTime := GetTickCount;
           m_dwWarModeTime := GetTickCount;
           m_boUseEffect := TRUE;
           m_nEffectFrame := m_nStartFrame;
           m_nEffectStart := m_nStartFrame;
           m_nEffectEnd := m_nEndFrame;
           m_dwEffectStartTime := GetTickCount;
           m_dwEffectFrameTime := m_dwFrameTime;
           PlaySound(4287);
       end;
     end;


     SM_STRUCK: begin
           m_boUseEffect :=False;
           m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
           m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
           m_dwFrameTime := pm.ActStruck.ftime;
           m_dwStartTime := GetTickCount;
           PlaySound(4294);
     end;

    SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
       PlaySound(4295);
    end;
   end;

  // m_boUseEffect := TRUE;
end;

procedure TWindLead.Run;        //마풍석괴
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bofly: Boolean;
   meff: TFlyingAxe;
   tx, ty, i : integer;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);


   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := TRUE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;


         if (m_nCurrentAction = SM_HIT) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

           end;
         end;

         if m_nCurrentAction = SM_LIGHTING then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

           end;
         end else
         if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentAction-m_nStartFrame = 4) then begin

         end else
         if (m_nCurrentAction = SM_LIGHTING_2) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (self, MAGIC_WIND_LEAD_1, MAGIC_WIND_LEAD_1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtThunder,FALSE,30,bofly);
             PlaySound(3748);
           end;
         end else
         if (m_nCurrentAction = SM_LIGHTING_3) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin

           end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;

   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TWindLead.DrawEff(dsurface: TDirectDrawSurface; dx,  //마풍석괴
  dy: integer);
begin
  inherited DrawEff(dsurface, dx, dy);;
  if m_boUseEffect and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
  if m_boUseEffect and (AttackEffectSurface2 <> nil) then begin
    dsurface.Draw(dx + ex + m_nShiftX,dy + ey + m_nShiftY,AttackEffectSurface2, True );
  end;
end;

{ TGreatFoxSpirit }

constructor TGreatFoxSpirit.Create;
begin
  inherited Create;
   AttackEffectSurface:=nil;
   if m_btRace in [115, 127] then begin //천주
    LightningTimer := TTimer.Create (nil);  //비월천주 현무현신
    LightningTimer.Interval := 10;
    LightningTimer.Tag := 0;
    LightningTimer.OnTimer := LightningTimerTimer;
    LightningTimer.Enabled := False; //FireDragon
   end;
end;

destructor TGreatFoxSpirit.Destroy;
begin
  if m_btRace in [115, 127] then begin  //천주 현무현신
   if LightningTimer <> nil then LightningTimer.Free;   //천주
  end;
   inherited Destroy;

end;

procedure TGreatFoxSpirit.LoadSurface;
var
   mimg: TWMImages;
begin
  mimg := GetMonImg (m_wAppearance);
  m_boUseEffect :=True;
  if m_boDeath then begin
    m_boUseEffect:=False;
  end;

  m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy);

  if m_boUseEffect then begin
   case m_nCurrentAction of
    SM_NOWDEATH: begin
     if m_btRace = 115 then begin
       AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                         2090 + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
     end;
     if m_btRace = 127 then begin             //현무현신
       AttackEffectSurface := g_WMonImagesArr[24].GetCachedImage (
                         2580 + (m_btDir * 10) + m_nEffectFrame-m_nEffectStart,
                         ax,
                         ay);
     end;

    end;
   end;
   if m_btRace = 115 then begin
     if ((1670 + m_nCurrentFrame+20) > 2089) and ((1670 + m_nCurrentFrame+20) < 2108)  then begin
              AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage ( 1670 + m_nCurrentFrame+20, ax, ay);
     end else
     AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage ( 1670 + m_nCurrentFrame+40, ax, ay);
   end else
    if m_btRace = 127 then begin    //현무현신
     AttackEffectSurface := g_WMonImagesArr[24].GetCachedImage ( 1650+670 + m_nCurrentFrame, ax, ay);
    end;
  end;
end;


procedure TGreatFoxSpirit.CalcActorFrame;
var
   pm: PTMonsterAction;
   actor: TActor;
   haircount, scx, scy, stx, sty: integer;
   meff: TCharEffect;
begin
   if m_btRace <> 127 then       //현무현신
   m_btDir:=0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   case m_nCurrentAction of
     SM_TURN:
         begin
            m_dwStartTime := GetTickCount;
            m_nDefframecount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
            if m_btRace = 115 then begin
            case TempState of
                  1: m_nStartFrame := 0;
                  2: m_nStartFrame := 80;
                  3: m_nStartFrame := 160;
                  4: m_nStartFrame := 240;
                  5: m_nStartFrame := 320;
            end;
               m_boWarMode := True;
               m_dwFrameTime := 150;
               m_nEndFrame := m_nStartFrame + 19;
               m_dwStartTime := GetTickCount;
               m_nDefframecount := 20;
               m_boUseEffect := TRUE;
               m_dwEffectStartTime := GetTickCount;
               m_dwEffectFrameTime := 150;
            end else
            if m_btRace = 127 then begin    //현무현신
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := pm.ActStand.frame;
               Shift (m_btDir, 0, 0, 1);
            end;

     end;

      SM_WALK, SM_BACKSTEP:
         begin
            if m_btRace = 127 then begin      //현무현신
               m_nStartFrame := pm.ActWalk.start + m_btDir * (pm.ActWalk.frame + pm.ActWalk.skip);
               m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
               m_dwFrameTime := pm.ActWalk.ftime;
               m_dwStartTime := GetTickCount;

               m_nMoveStep := 1;
               if m_nCurrentAction = SM_WALK then
                  Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
               else
                  Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
            end;
         end;
      SM_HIT:    // 근거리 공격
         begin
            if m_btRace = 127 then begin    //현무현신
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := pm.ActAttack.start + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + 9;
               m_dwFrameTime := pm.ActAttack.ftime;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
            end;
         end;

     SM_LIGHTING,SM_LIGHTING_1,SM_LIGHTING_2,SM_LIGHTING_3: begin
       m_nStartFrame:=0;
       m_nEndFrame:=19;
       m_dwFrameTime:=150;

       m_dwStartTime:=GetTickCount;

       m_boUseEffect:=True;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;

       m_nEffectEnd:=19;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=150;

       m_nCurEffFrame:=0;
       m_boUseMagic:=True;
       m_dwWarModeTime:=GetTickcount;
       Shift (m_btDir, 0, 0, 1);

       if m_btRace = 115 then begin
        case TempState of
                  1: m_nStartFrame := 20;
                  2: m_nStartFrame := 100;
                  3: m_nStartFrame := 180;
                  4: m_nStartFrame := 260;
                  5: m_nStartFrame := 340;
        end;
        m_nEndFrame   := m_nStartFrame + 9;
        m_dwFrameTime  := 150;
        m_boUseEffect := TRUE;
        m_dwEffectStartTime := GetTickCount;
        m_dwEffectFrameTime := 150;
       end;

            if (m_nCurrentAction = SM_LIGHTING) and (m_btRace = 127) then begin           //현무현신
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := 340 + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + 5;
               m_dwFrameTime := pm.ActAttack.ftime;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               m_boUseEffect := TRUE;
               PlaySound(2642);
            end
            else if (m_nCurrentAction = SM_LIGHTING_1) and (m_btRace = 127) then begin         //현무현신
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := 420 + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + 5;
               m_dwFrameTime := pm.ActCritical.ftime;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               m_boUseEffect := TRUE;
            end
            else if (m_nCurrentAction = SM_LIGHTING_2) and (m_btRace = 127) then begin      //현무현신
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := 500 + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + 5;
               m_dwFrameTime := 120;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               m_boUseEffect := TRUE;
            end
            else if (m_nCurrentAction = SM_LIGHTING_3) and (m_btRace = 127) then begin        //현무현신
               Shift (m_btDir, 0, 0, 1);
               m_nStartFrame := 580 + m_btDir * 10;
               m_nEndFrame  := m_nStartFrame + 7;
               m_dwFrameTime := 120;
               m_dwStartTime := GetTickCount;
               m_dwWarModeTime := GetTickCount;
               m_boUseEffect := TRUE;
            end;
     end;


     SM_STRUCK: begin
       if m_btRace = 127 then begin      //현무현신
           m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
           m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
           m_dwFrameTime := pm.ActStruck.ftime;
           m_dwStartTime := GetTickCount;
       end;
     end;

    SM_NOWDEATH: begin
     if m_btRace = 115 then begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_nEffectFrame:=pm.ActDie.start;
       m_nEffectStart:=pm.ActDie.start;
       m_nEffectEnd:=pm.ActDie.start + pm.ActDie.frame -1;
       m_dwEffectStartTime:=GetTickCount;
       m_dwEffectFrameTime:=pm.ActDie.frame;
       m_boUseEffect := TRUE;
     end else
     if m_btRace = 127 then begin       //현무현신
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;

       m_nEffectFrame := 0;
       m_nEffectStart := 0;
       m_nEffectEnd := 10;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
     end;
    end;
   end;

   m_boUseEffect := TRUE;
end;

procedure TGreatFoxSpirit.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bofly: Boolean;
   meff: TFlyingAxe;
   tx, ty, i : integer;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   if m_boRunSound then begin
    if m_btRace = 115 then
     PlaySound(2571)
    else
     PlaySound(2641);
     m_boRunSound:=False;
   end;


   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
          if m_btRace in [115,127] then begin
            if m_boDeath then
            m_boUseEffect := FALSE
            else m_boUseEffect := TRUE;
          end else
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;

         if m_btRace = 127 then begin       //현무현신
            if (m_nCurrentAction = SM_LIGHTING_1) {and (m_nCurrentAction-m_nStartFrame = 4)} then begin
                PlayScene.NewMagic (self,
                                      MAGIC_KINGTURTLE_ATT1,
                                      MAGIC_KINGTURTLE_ATT1,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,       //TargetX,
                                      m_nTargetY,       //TargetY,
                                      m_nTargetRecog,  //TargetRecog,
                                      mt13,
                                      FALSE,
                                      30,
                                      bofly);
                PlaySound (10022);
            end
            else if (m_nCurrentAction = SM_LIGHTING_2) {and (m_nCurrentAction-m_nStartFrame = 4)} then begin
              if m_btRace in [115, 127] then begin  //천주
                if Not LightningTimer.Enabled then begin
                  LightningTimer.Enabled := True;
                  PlaySound (10450); //초필사기
                end;
              end;
            end
            else if (m_nCurrentAction = SM_LIGHTING_3) {and (m_nCurrentAction-m_nStartFrame = 1)} then begin
                PlayScene.NewMagic (self,
                                      MAGIC_KINGTURTLE_ATT3,
                                      MAGIC_KINGTURTLE_ATT3,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,       //TargetX,
                                      m_nTargetY,       //TargetY,
                                      m_nTargetRecog,  //TargetRecog,
                                      mt13,
                                      FALSE,
                                      30,
                                      bofly);
                PlaySound (10160);
            end

         end else

         if m_btRace = 115 then begin //근접범위 전기 공격
         if (m_nCurrentAction = SM_LIGHTING) and (m_nCurrentFrame-m_nStartFrame = 1) then begin
                PlayScene.NewMagic (self,
                                      MAGIC_SOULBALL_ATT1,
                                      MAGIC_SOULBALL_ATT1,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,       //TargetX,
                                      m_nTargetY,       //TargetY,
                                      m_nTargetRecog,  //TargetRecog,
                                      mtFoxAnnoy,
                                      FALSE,
                                      30,
                                      bofly);
                PlaySound (2576);
            end else
            if (m_nCurrentAction = SM_LIGHTING_1) and (m_nCurrentFrame-m_nStartFrame = 1) then begin
              PlayScene.NewMagic (self,
                                      MAGIC_SOULBALL_ATT2, //원거리범위 공격
                                      MAGIC_SOULBALL_ATT2,
                                      m_nCurrX,
                                      m_nCurrY,
                                      m_nTargetX,
                                      m_nTargetY,
                                      m_nTargetRecog,
                                      mtThunder,
                                      FALSE,
                                      30,
                                      bofly);
                PlaySound (2577);
            end else
            if (m_nCurrentAction = SM_LIGHTING_2) and (m_nCurrentFrame-m_nStartFrame = 1)then begin      //천주
              if m_btRace in [115, 127] then begin  //천주
                if Not LightningTimer.Enabled then begin
                  LightningTimer.Enabled := True;
                  PlaySound (2578); //초필사기
                end;
              end;
            end;
         end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;

   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TGreatFoxSpirit.LightningTimerTimer(Sender: TObject);
var
   tx, ty, n, kx, ky : integer;
   bofly: Boolean;
begin
   if m_btRace = 115 then begin  //천주

       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 10;
          Exit;
       end;
       tx := g_Myself.m_nCurrX;
       ty := g_Myself.m_nCurrY;

       n := random(4);
       kx := random(7);
       ky := random(5);

       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_1, MAGIC_SOULBALL_ATT3_1, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_2, MAGIC_SOULBALL_ATT3_2, m_nCurrX, m_nCurrY, tx-2, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_3, MAGIC_SOULBALL_ATT3_3, m_nCurrX, m_nCurrY, tx, ty-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_4, MAGIC_SOULBALL_ATT3_4, m_nCurrX, m_nCurrY, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
          LightningTimer.Interval := 500;
       end
       else if LightningTimer.Tag = 2 then begin
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_1, MAGIC_SOULBALL_ATT3_1, m_nCurrX, m_nCurrY, tx-2, ty-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_2, MAGIC_SOULBALL_ATT3_2, m_nCurrX, m_nCurrY, tx+2, ty-2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_3, MAGIC_SOULBALL_ATT3_3, m_nCurrX, m_nCurrY, tx+kx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_4, MAGIC_SOULBALL_ATT3_4, m_nCurrX, m_nCurrY, tx-kx, ty, 0, mtThunder, FALSE, 30, bofly);
       end;

       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_5, MAGIC_SOULBALL_ATT3_5, m_nCurrX, m_nCurrY, tx+kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_1, MAGIC_SOULBALL_ATT3_1, m_nCurrX, m_nCurrY, tx-kx-2, ty+ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_2, MAGIC_SOULBALL_ATT3_2, m_nCurrX, m_nCurrY, tx-kx, ty-ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_3, MAGIC_SOULBALL_ATT3_3, m_nCurrX, m_nCurrY, tx+kx+2, ty+ky, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_4, MAGIC_SOULBALL_ATT3_4, m_nCurrX, m_nCurrY, tx+kx, ty, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_SOULBALL_ATT3_5, MAGIC_SOULBALL_ATT3_5, m_nCurrX, m_nCurrY, tx-kx, ty, 0, mtThunder, FALSE, 30, bofly);

       LightningTimer.Interval := LightningTimer.Interval + 100;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 10;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
   end else


   if m_btRace = 127 then begin //현무현신
       if LightningTimer.Tag = 0 then begin
          LightningTimer.Tag := LightningTimer.Tag + 1;
          LightningTimer.Interval := 10;
          Exit;
       end;

       tx := g_Myself.m_nCurrX;
       ty := g_Myself.m_nCurrY;

       n := random(4);
       kx := random(7);
       ky := random(5);

       if LightningTimer.Tag = 0 then begin
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx-2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx, ty+3, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx-kx, ty-ky+1, 0, mtThunder, FALSE, 30, bofly);
          LightningTimer.Interval := 500;
       end
       else if LightningTimer.Tag = 2 then begin
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx-2, ty+3, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx+2, ty+2, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx+kx, ty, 0, mtThunder, FALSE, 30, bofly);
          PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx-kx, ty+1, 0, mtThunder, FALSE, 30, bofly);
       end;

       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx+kx, ty-ky+1, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx-kx-2, ty+ky+2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx-kx, ty-ky+3, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx+kx+2, ty+ky+1, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_2, MAGIC_KINGTURTLE_ATT2_2, m_nCurrX, m_nCurrY, tx+kx, ty+2, 0, mtThunder, FALSE, 30, bofly);
       PlayScene.NewMagic (self, MAGIC_KINGTURTLE_ATT2_1, MAGIC_KINGTURTLE_ATT2_1, m_nCurrX, m_nCurrY, tx-kx, ty, 0, mtThunder, FALSE, 30, bofly);

       if LightningTimer.Tag = 4 then PlaySound (10450);
       LightningTimer.Interval := LightningTimer.Interval + 200;
       LightningTimer.Tag := LightningTimer.Tag+1;

       if LightningTimer.Tag > 7 then begin
          LightningTimer.Interval := 10;
          LightningTimer.Tag := 0;
          LightningTimer.Enabled := False;
       end;
    end;


end;

procedure TGreatFoxSpirit.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  if m_boDeath then exit;
  inherited DrawEff(dsurface, dx, dy);;
  if m_boUseEffect and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;

{ THellGuard }

procedure THellGuard.CalcActorFrame;    //지옥문지기
var
   pm: PTMonsterAction;
begin
   m_btDir:=0;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_HIT: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActAttack.ftime;
      m_nCurEffFrame:=50;
    end;
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActCritical.ftime;
      m_nCurEffFrame:=50;
    end;
    else begin
      inherited;
    end;
  end;
 end;

procedure THellGuard.LoadSurface;       //지옥문지기
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                                2220 +  + m_nEffectFrame - m_nEffectStart,
                                ax,
                                ay);
    end;
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                                2230 + m_nEffectFrame-m_nEffectStart,
                                ax,
                                ay);
    end;
  end;
end;

{ THellMonster1 }

procedure THellMonster1.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActAttack.ftime;
      m_nCurEffFrame:=50;
    end;
    SM_NOWDEATH: begin
       m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := 100;
       playsound(10731);
     end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure THellMonster1.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        1120 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

{ THellMonster2 }

procedure THellMonster2.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect:=FALSE;
      playsound(2936);
    end;
    SM_HIT: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActCritical.ftime;
      m_nCurEffFrame:=50;
      playsound(2936);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure THellMonster2.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_HIT: begin
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        1630 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

{ THellMonster3 }

procedure THellMonster3.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect:=TRUE;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=20;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=50;
      m_nCurEffFrame:=0;
      playsound(2946);
    end;
    SM_HIT: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwWarModeTime := GetTickCount;
      m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=130;
      m_nCurEffFrame:=0;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect:=TRUE;
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure THellMonster3.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
    m_boUseEffect:=TRUE;
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        3220 + (m_btDir * 20) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
    SM_HIT: begin
    m_boUseEffect:=TRUE;
         AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        2140 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

{ TIceHellMonster1 }

procedure TIceHellMonster1.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect:=TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=100;
      m_nCurEffFrame:=0;
      PlaySound(3006);
    end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
      PlaySound(3005);
    end;
    else begin
      inherited;
    end;
  end;
end;

constructor THellMonster4.Create;
begin
  inherited;
  boCasted:=FALSE;
end;

procedure THellMonster4.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectFrame := m_nStartFrame;
      m_nEffectStart := m_nStartFrame;
      m_nEffectEnd := m_nEndFrame;
      m_dwEffectStartTime := GetTickCount;
      m_dwEffectFrameTime := m_dwFrameTime;
      boCasted:=TRUE;
      PlaySound(2966);
    end;
    SM_HIT: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      firedir := m_btDir;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=6;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=150;
      m_nCurEffFrame:=0;
      boCasted:=TRUE;
      PlaySound(2969);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure THellMonster4.Run;
var
  bo11:boolean;
begin
  if (m_nCurrentFrame - m_nStartFrame) = 2 then begin
    if (m_nCurrentAction = SM_LIGHTING) then begin
      if boCasted = true then begin
        boCasted:=FALSE;
        PlayScene.NewMagic (Self,80,80,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtHellThunder,False,30,bo11);
        PlaySound(2967);
      end;
    end;
  end;
  inherited;
end;

function  THellMonster4.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
  Result:=0;
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  {
  if boActive = FALSE then begin

    if pm = nil then exit;
    if m_boDeath then begin
      inherited GetDefaultFrame(wmode);
      exit;
    end;
    m_nDefFrameCount := 1;
    if m_nCurrentDefFrame < 0 then cf := 0
    else if m_nCurrentDefFrame >= 0 then cf := 0
    else cf := m_nCurrentDefFrame;
    Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip) + cf;
    }


  if (m_nState and STATE_STONE_MODE) <> 0 then begin
    Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
  end else begin
    Result:= inherited GetDefaultFrame(wmode);
  end;
end;

procedure THellMonster4.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if g_boEffect then begin
  if m_boUseEffect and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
  end;
end;

procedure THellMonster4.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
    m_boUseEffect := TRUE;
      AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        2670 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
    SM_Hit: begin
    m_boUseEffect := TRUE;
      AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        2700 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;


constructor THellMonster5.Create;
begin
  inherited;
  boCasted:=FALSE;
end;

procedure THellMonster5.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_LIGHTING: begin
       m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
       m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
       m_dwFrameTime := pm.ActCritical.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectStart:=0;
       m_nEffectFrame:=0;
       m_nEffectEnd:=20;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime:=50;
       PlaySound(2976);
    end;
    SM_HIT: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
       m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
       m_dwFrameTime := pm.ActAttack.ftime;
       m_dwStartTime := GetTickCount;
       m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
       m_boUseEffect := TRUE;
       m_nEffectFrame := m_nStartFrame;
       m_nEffectStart := m_nStartFrame;
       m_nEffectEnd := m_nEndFrame;
       m_dwEffectStartTime := GetTickCount;
       m_dwEffectFrameTime := m_dwFrameTime;
      PlaySound(2977);
    end;
    else begin
      inherited;
    end;
  end;
end;

{procedure THellMonster5.Run;
var
  bo11:boolean;
begin
  if (m_nCurrentFrame - m_nStartFrame) = 2 then begin
    if (m_nCurrentAction = SM_HIT) then begin
      if boCasted = true then begin
        boCasted:=FALSE;
        PlayScene.NewMagic (Self,80,80,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtHell2Thunder,False,30,bo11);
        PlaySound(2979);
      end;
    end;
  end;
  inherited;
end;      }

function  THellMonster5.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
  Result:=0;
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  {
  if boActive = FALSE then begin

    if pm = nil then exit;
    if m_boDeath then begin
      inherited GetDefaultFrame(wmode);
      exit;
    end;
    m_nDefFrameCount := 1;
    if m_nCurrentDefFrame < 0 then cf := 0
    else if m_nCurrentDefFrame >= 0 then cf := 0
    else cf := m_nCurrentDefFrame;
    Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip) + cf;
    }


  if (m_nState and STATE_STONE_MODE) <> 0 then begin
    Result := pm.ActDeath.start + m_btDir * (pm.ActDeath.frame + pm.ActDeath.skip);
  end else begin
    Result:= inherited GetDefaultFrame(wmode);
  end;
end;

procedure THellMonster5.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        3170 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;   
    SM_HIT: begin
    m_boUseEffect := TRUE;
      AttackEffectSurface := g_WMonImagesArr[27].GetCachedImage (
                        3140 + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;


procedure TIceHellMonster1.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                        420 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

{ TIceHellMonster }

procedure TIceHellMonster.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      {m_nEffectStart:=pm.ActCritical.start;
      m_nEffectFrame:=pm.ActCritical.start;
      m_nEffectEnd:=m_nStartFrame + pm.ActCritical.frame ;- 1;}
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;
      //m_nCurEffFrame:=100;
    end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
    end;
    else begin
      inherited;
    end;
  end;
end;


{ TIceHellMonster2 }

procedure TIceHellMonster2.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
       Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_dwStartTime := GetTickCount;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=10;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=50;
      m_nCurEffFrame:=0;
      PlaySound(3016);
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
       m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
       m_dwFrameTime := pm.ActDie.ftime;
       m_dwStartTime := GetTickCount;
       m_boUseEffect := TRUE;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=m_dwFrameTime;
       PlaySound(3015);
     end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=FALSE;
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TIceHellMonster2.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                        930 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;

procedure TIceHellMonster3.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=5;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=pm.ActCritical.ftime;
      m_nCurEffFrame:=50;
      PlaySound(3057);
    end;
    SM_HIT: begin
      inherited;
      m_boUseEffect:=TRUE;
      PlaySound(3056);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TIceHellMonster3.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_LIGHTING: begin
         AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                        2650 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
    SM_HIT: begin
         AttackEffectSurface := g_WMonImagesArr[28].GetCachedImage (
                        2570 + (m_btDir * 10) + m_nEffectFrame - m_nEffectStart,
                        ax, ay);
    end;
  end;
end;



//현월단전사
procedure TWarriorH.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_LIGHTING then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,800 + (m_btDir * 10),6,85,TRUE);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;

  if m_nCurrentAction = SM_LIGHTING_2 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,220 + (m_btDir * 20),6,85,TRUE);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(s_hit_do);
    end;
    SM_LIGHTING: Begin //예도공격
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      if m_btRace = 266 then PlaySound(s_yedo_man);
      if m_btRace = 267 then PlaySound(s_yedo_woman);
    end;

    SM_LIGHTING_2: Begin //예도공격
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(141);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 266 then PlaySound(s_man_struck);
      if m_btRace = 267 then PlaySound(s_wom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 266 then PlaySound(s_man_die);
      if m_btRace = 267 then PlaySound(s_wom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TWarriorH.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    if m_btRace = 266 then begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(52,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(2224 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(12,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end else begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(52,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(16680 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(13,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end;
  end;
end;

procedure TWarriorH.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
  ceff := GetDrawEffectValue;
  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TWarriorH.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


//현월단술사
procedure TWizardH.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_FLYAXE then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,400,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,1650,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_2 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,900,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_FLYAXE: Begin       //금강화염장
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime+40;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10050);
    end;
    SM_LIGHTING: Begin  //폭열파
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10230);
    end;
    SM_LIGHTING_2: Begin //화염풍
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10080);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 268 then PlaySound(s_man_struck);
      if m_btRace = 269 then PlaySound(s_wom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 268 then PlaySound(s_man_die);
      if m_btRace = 269 then PlaySound(s_wom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TWizardH.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
   end;
  if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
         if m_nCurrentAction = SM_FLYAXE then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
               PlayScene.NewMagic (Self,1,3,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtfly,False,30,bofly);
               PlaySound (10052);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (self, MAGIC_EXPLOSIN_WIZARD, MAGIC_EXPLOSIN_WIZARD, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY,
                                      m_nTargetRecog, mtThunder, FALSE,30, bo11);
             PlaySound(10232);
           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure  TWizardH.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    if m_btRace = 268 then begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(56,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(2224 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(14,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end else begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(56,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(16680 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(15,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end;
  end;
end;

procedure TWizardH.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;
  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TWizardH.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;



//현월단남도사
procedure TToaistH.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_HIT then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,0,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin       //신수, 원령소환
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10060);
    end;
    SM_LIGHTING: Begin  //폭살계
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10130);
    end;
    SM_LIGHTING_2: Begin //저주술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10300);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 270 then PlaySound(s_man_struck);
      if m_btRace = 271 then PlaySound(s_wom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 270 then PlaySound(s_man_die);
      if m_btRace = 271 then PlaySound(s_wom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TToaistH.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
   end;
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
         if (m_nCurrentAction = SM_LIGHTING) then begin                             //폭살계
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (Self,10,10,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtExploBujauk,False,30,bofly);
             m_nmagicfiresound  := 10131;
             m_nmagicexplosionsound := 10132;
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) then begin                             //저주술
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (Self,MAGIC_FOX_CURSE2,MAGIC_FOX_CURSE2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtExploBujauk,False,30,bofly);
             m_nmagicfiresound  := 10131;
             m_nmagicexplosionsound := 10461;
           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure  TToaistH.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    if m_btRace = 270 then begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(50,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(2224 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(16,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end else begin
      m_WeaponSurface:=FrmMain.GetWWeaponImg(50,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=nil;
      m_HairSurface := g_WHairImgImages.GetCachedImage(16680 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHumImg(17,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end;
  end;
end;

procedure TToaistH.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;

  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TToaistH.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


//현월단자객
procedure TAssassinH.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_HIT then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,1960 + (m_btDir * 10),10,65,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,2050 + (m_btDir * 10),10,65,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_2 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,2230 + (m_btDir * 10),10,85,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin       //풍검술
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10605);
    end;
    SM_LIGHTING: Begin  //풍검술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10606);
    end;
    SM_LIGHTING_2: Begin //천이검공격
      m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
      m_dwFrameTime := pm.ActCritical3.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10635);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 272 then PlaySound(s_killerman_struck);
      if m_btRace = 273 then PlaySound(s_killerwom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      if m_btRace = 272 then PlaySound(s_killerman_die);
      if m_btRace = 273 then PlaySound(s_killerwom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure  TAssassinH.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    if m_btRace = 272 then begin
      m_WeaponSurface:=FrmMain.GetWWeapon_Killer_LeftImg(8,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
      m_WeaponSurface2:=FrmMain.GetWWeapon_Killer_RightImg(8,0,0,m_nCurrentFrame, m_nWp2x, m_nWp2y);
      m_HairSurface := g_WHair_KillerImgImages.GetCachedImage(1456 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHum_Killer2Img(12,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end else begin
      m_WeaponSurface:=FrmMain.GetWWeapon_Killer_LeftImg(8,0,0,m_nCurrentFrame+728, m_nWpx, m_nWpy);
      m_WeaponSurface2:=FrmMain.GetWWeapon_Killer_RightImg(8,0,0,m_nCurrentFrame+728, m_nWp2x, m_nWp2y);
      m_HairSurface := g_WHair_KillerImgImages.GetCachedImage(10920 + m_nCurrentFrame, m_nHpx, m_nHpy);
      m_BodySurface := FrmMain.GetWHum_Killer2Img(13,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
    end;
  end;
end;

procedure TAssassinH.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;

  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER4[m_btSex, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_WeaponSurface2 <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TAssassinH.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


//전승전사
procedure TWarriorM2.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_LIGHTING then begin //예도
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,800 + (m_btDir * 10),6,85,TRUE);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;
  if m_nCurrentAction = SM_LIGHTING_2 then begin  //쌍룡참
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,220 + (m_btDir * 20),6,85,TRUE);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;
  if m_nCurrentAction = SM_LIGHTING_3 then begin //광풍참
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,40 + (m_btDir * 10),10,85,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;
  if m_nCurrentAction = SM_LIGHTING_4 then begin   //공파섬
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,740 + (m_btDir * 20),20,80,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
    PlaySound(s_hit_do);
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(s_hit_do);
    end;
    SM_LIGHTING: Begin  //예도
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(s_yedo_man);
    end;
    SM_LIGHTING_2: Begin //쌍룡참공격
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(141);
    end;
    SM_LIGHTING_3: Begin //광풍참공격
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(140);
    end;
    SM_LIGHTING_4: Begin //공파섬공격
      m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
      m_dwFrameTime := 80;
      m_nMagLight    := 2;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound (10440);
      PlaySound (s_twinhit);
      PlaySound (s_hit_do);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_man_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_man_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure  TWarriorM2.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    m_WeaponSurface:=FrmMain.GetWWeaponImg(104,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
    m_WeaponSurface2:=nil;
    m_HairSurface := g_WHairImgImages.GetCachedImage(2224 + m_nCurrentFrame, m_nHpx, m_nHpy);
    m_BodySurface := FrmMain.GetWHum2Img(30,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
  end;
end;

procedure TWarriorM2.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TWarriorM2.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;

//성남술사
procedure TWizardM2.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_FLYAXE then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,400,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,1650,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_2 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,900,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_3 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,1040,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_FLYAXE: Begin       //금강화염장
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime+40;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10050);
    end;
    SM_LIGHTING: Begin  //폭열파
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10230);
    end;
    SM_LIGHTING_2: Begin //화염풍
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10080);
    end;
    SM_LIGHTING_3: Begin //흡혈술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10480);
    end;
    SM_LIGHTING_4: Begin //화룡기염
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := 100;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_nMagLight := 2;
      FrmMain.UseNormalEffect (NE_FIRECIRCLE, m_nCurrX, m_nCurrY);
      PlaySound(10450);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_wom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_wom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TWizardM2.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
   end;
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
         if m_nCurrentAction = SM_FLYAXE then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (Self,1,3,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtfly,False,30,bofly);
             PlaySound (10052);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (self, MAGIC_EXPLOSIN_WIZARD, MAGIC_EXPLOSIN_WIZARD, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY,
                                      m_nTargetRecog, mtThunder, FALSE,30, bo11);
             PlaySound(10232);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_3) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (Self,48,48,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtExplosion,False,30,bo11);
           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure  TWizardM2.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    m_WeaponSurface:=FrmMain.GetWWeaponImg(108,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
    m_WeaponSurface2:=nil;
    m_HairSurface := g_WHairImgImages.GetCachedImage(3336 + m_nCurrentFrame, m_nHpx, m_nHpy);
    m_BodySurface := FrmMain.GetWHum2Img(33,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
  end;
end;

procedure TWizardM2.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TWizardM2.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


//정연도사
procedure TToaistF2.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_HIT then begin //신수 원령 소환
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,0,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_4 then begin //대회복술
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagicImages,1790,10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin        //신수, 원령소환
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10060);
    end;
    SM_LIGHTING: Begin  //폭살계
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10130);
    end;
    SM_LIGHTING_2: Begin //저주술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10300);
    end;
    SM_LIGHTING_4: Begin //대회복술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10290);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_wom_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_wom_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TToaistF2.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bo11:Boolean;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
   end;
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;
   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   if m_boUseEffect then begin
      if m_boMsgMuch then m_dwEffectFrameTimetime := Round(m_dwEffectFrameTime * 2 / 3)
      else m_dwEffectFrameTimetime := m_dwEffectFrameTime;
      if GetTickCount - m_dwEffectStartTime > m_dwEffectFrameTimetime then begin
         m_dwEffectStartTime := GetTickCount;
         if m_nEffectFrame < m_nEffectEnd then begin
            Inc (m_nEffectFrame);
         end else begin
            m_boUseEffect := FALSE;
         end;
      end;
   end;

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
            bo260:=False;
         end;
         if (m_nCurrentAction = SM_LIGHTING) then begin                             //폭살계
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (Self,10,10,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtExploBujauk,False,30,bofly);
             m_nmagicfiresound  := 10131;
             m_nmagicexplosionsound := 10132;
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) then begin                             //저주술
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (Self,MAGIC_FOX_CURSE2,MAGIC_FOX_CURSE2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtExploBujauk,False,30,bofly);
             m_nmagicfiresound  := 10131;
             m_nmagicexplosionsound := 10461;
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_4) then begin                             //대회복술
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin   //4
             PlayScene.NewMagic (Self,27,27,m_nCurrX,m_nCurrY,m_nCurrX,m_nCurrY,0,mtExplosion,False,30,bo11);
             PlaySound (10292);
           end;
         end;
         m_nCurrentDefFrame := 0;
         m_dwDefFrameTime := GetTickCount;
      end;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure  TToaistF2.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    m_WeaponSurface:=FrmMain.GetWWeaponImg(106,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
    m_WeaponSurface2:=nil;
    m_HairSurface := g_WHairImgImages.GetCachedImage(3336 + m_nCurrentFrame, m_nHpx, m_nHpy);
    m_BodySurface := FrmMain.GetWHum2Img(35,0 ,0,m_nCurrentFrame, m_nPx, m_nPy);
  end;
end;

procedure TToaistF2.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER[0, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);
end;

procedure TToaistF2.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


//혁문객
procedure TAssassinM2.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_HIT then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,1960 + (m_btDir * 10),10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,2050 + (m_btDir * 10),10,60,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_2 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,2230 + (m_btDir * 10),10,85,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_3 then begin
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMagic2Images,2620 + (m_btDir * 20),20,100,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin       //풍검술
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10605);
    end;
    SM_LIGHTING: Begin  //풍검술
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10606);
    end;
    SM_LIGHTING_2: Begin //천이검공격
      m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
      m_dwFrameTime := pm.ActCritical3.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(10635);
    end;
    SM_LIGHTING_3: Begin //월하난무공격
      m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
      m_dwFrameTime := 100;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      m_nMagLight := 2;
      PlaySound (10725);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_killerman_struck);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      PlaySound(s_killerman_die);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure  TAssassinM2.LoadSurface;
begin
  if (not m_boReverseFrame) then begin
    m_WeaponSurface:=FrmMain.GetWWeapon_Killer_LeftImg(26,0,0,m_nCurrentFrame, m_nWpx, m_nWpy);
    m_WeaponSurface2:=FrmMain.GetWWeapon_Killer_RightImg(26,0,0,m_nCurrentFrame, m_nWp2x, m_nWp2y);
    m_HairSurface := g_WHair_KillerImgImages.GetCachedImage(1456 + m_nCurrentFrame, m_nHpx, m_nHpy);
    m_BodySurface := FrmMain.GetWHum_Killer2Img(36,0,0,m_nCurrentFrame, m_nPx, m_nPy);
  end;
end;

procedure TAssassinM2.DrawChr(dsurface: TDirectDrawSurface; dx, dy: integer;
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  if not (m_btDir in [0..7]) then exit;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;
  ceff := GetDrawEffectValue;

  if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then
    m_nWpord := WORDER4[m_btSex, m_nCurrentFrame];

  if m_WeaponSurface <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceff);
  if m_WeaponSurface2 <> nil then
    DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceff);
  if m_BodySurface <> nil then
    DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
  if m_HairSurface <> nil then
    DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);

end;

procedure TAssassinM2.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
  inherited;
  if m_boDeath then exit;
  if (m_boUseEffect) and (AttackEffectSurface <> nil) then begin
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);
  end;
end;


{유상궁장}

procedure TAchorMonster.CalcActorFrame;
var
  pm: PTMonsterAction;
begin
  inherited;
   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
  case m_nCurrentAction of
    SM_FLYAXE: Begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
    end;
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
    end;
    SM_LIGHTING_2: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
    end;
    SM_BACKSTEP: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_nMoveStep := 3;
      Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
      PlaySound(10966);
    end;
    else begin
      inherited;
    end;
  end;
end;

procedure TAchorMonster.Run;
var
   prv: integer;
   m_dwEffectFrameTimetime, m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
   if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_BACKSTEP) or (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) then exit;

   m_boMsgMuch := FALSE;
   if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
      else m_dwFrameTimetime := m_dwFrameTime;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            Inc (m_nCurrentFrame);
            m_dwStartTime := GetTickCount;
         end else begin
            m_nCurrentAction := 0;
            m_boUseEffect := FALSE;
         end;
         if (m_nCurrentAction = SM_FLYAXE) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (Self,MAGIC_ARCHER_ATT1,MAGIC_ARCHER_ATT1,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtfly,False,30,bofly);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (Self,MAGIC_ARCHER_ATT2,MAGIC_ARCHER_ATT2,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtfly,False,30,bofly);
             PlaySound(4372);
           end;
         end;
         if (m_nCurrentAction = SM_LIGHTING_2) then begin
           if (m_nCurrentFrame - m_nStartFrame) = 4 then begin
             PlayScene.NewMagic (Self,MAGIC_ARCHER_ATT3,MAGIC_ARCHER_ATT3,m_nCurrX,m_nCurrY,m_nTargetX,m_nTargetY,m_nTargetRecog,mtfly,False,30,bofly);
             PlaySound (4376);
            end;
          end;
      end;
      m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;


{양용왕}
procedure TJobking.CalcActorFrame;
var
  Eff8:TNormalDrawEffect;
  Eff9:TNormalDrawEffect;
  Eff10:TNormalDrawEffect;
  Eff11:TNormalDrawEffect;
  Eff12:TNormalDrawEffect;
  pm: PTMonsterAction;
begin
  inherited;
  if m_nCurrentAction = SM_HIT then begin   //광풍참공격
    Eff8:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5330 + (m_btDir * 10),10,80,True);
    if Eff8 <> nil then begin
      Eff8.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff8);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING then begin   //광범위광풍참공격
    Eff9:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5410 + (m_btDir * 10),10,80,True);
    if Eff9 <> nil then begin
      Eff9.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff9);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_2 then begin  //불지염
    Eff9:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5490 + (m_btDir * 10),10,120,True);
    if Eff9 <> nil then begin
      Eff9.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff9);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_2 then begin  //불지염
    Eff10:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5570 + (m_btDir * 10),10,120,True);
    if Eff10 <> nil then begin
      Eff10.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff10);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_3 then begin    //빨간칼질
    Eff10:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5660 + (m_btDir * 10),10,100,True);
    if Eff10 <> nil then begin
      Eff10.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff10);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_3 then begin   //빨간공격주변
    Eff11:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],6185,16,100,True);
    if Eff11 <> nil then begin
      Eff11.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff11);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_4 then begin     //일섬
    Eff12:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5760 + (m_btDir * 10),10,100,True);
    if Eff12 <> nil then begin
      Eff12.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff12);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_5 then begin      //천지합일
    Eff12:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5920,20,100,True);
    if Eff12 <> nil then begin
      Eff12.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff12);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_6 then begin
    Eff12:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5836 + (m_btDir * 10),10,100,True);
    if Eff12 <> nil then begin
      Eff12.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff12);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_7 then begin     //일신양풍성
    Eff11:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5940,10,200,True);
    if Eff11 <> nil then begin
      Eff11.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff11);
    end;
  end;
  if m_nCurrentAction = SM_LIGHTING_7 then begin     //일신양풍성
    Eff12:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],5950 + (m_btDir * 10),10,200,TRUE);
    if Eff12 <> nil then begin
      Eff12.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff12);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_1 then begin     //일신양풍성 공격
    Eff11:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],6033 + (m_btDir * 10),7,80,FALSE);
    if Eff11 <> nil then begin
      Eff11.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff11);
    end;
  end;
    if m_nCurrentAction = SM_LIGHTING_1 then begin     //일신양풍성 공격
    Eff12:=TNormalDrawEffect.Create(m_nCurrX,m_nCurrY,g_WMonImagesArr[41],6110 + (m_btDir * 10),10,80,True);
    if Eff12 <> nil then begin
      Eff12.MagOwner:=g_MySelf;
      PlayScene.m_EffectList.Add(Eff12);
    end;
  end;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetOffset (m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;

  case m_nCurrentAction of
    SM_HIT: Begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4342);
    end;
    SM_LIGHTING: begin
      m_nStartFrame := pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
      m_dwFrameTime := pm.ActCritical.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4346);
    end;
    SM_LIGHTING_2: begin
      m_nStartFrame := pm.ActCritical2.start + m_btDir * (pm.ActCritical2.frame + pm.ActCritical2.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical2.frame - 1;
      m_dwFrameTime := pm.ActCritical2.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      frmMain.DrawEffectHum(144,m_nTargetX-6, m_nTargetY, 0);
      frmMain.DrawEffectHum(144,m_nTargetX+7, m_nTargetY, 0);
      frmMain.DrawEffectHum(144,m_nTargetX, m_nTargetY+7, 0);
      frmMain.DrawEffectHum(144,m_nTargetX, m_nTargetY-7, 0);
      frmMain.DrawEffectHum(144,m_nTargetX+7, m_nTargetY+7, 0);
      frmMain.DrawEffectHum(144,m_nTargetX-6, m_nTargetY-7, 0);
      frmMain.DrawEffectHum(144,m_nTargetX+7, m_nTargetY-7, 0);
      frmMain.DrawEffectHum(144,m_nTargetX-6, m_nTargetY+7, 0);
      PlaySound(4347);
    end;
    SM_LIGHTING_3: begin
      m_nStartFrame := pm.ActCritical3.start + m_btDir * (pm.ActCritical3.frame + pm.ActCritical3.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical3.frame - 1;
      m_dwFrameTime := pm.ActCritical3.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4348);
    end;
    SM_LIGHTING_4: begin
      m_nStartFrame := pm.ActCritical4.start + m_btDir * (pm.ActCritical4.frame + pm.ActCritical4.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical4.frame - 1;
      m_dwFrameTime := pm.ActCritical4.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4356);
    end;
    SM_LIGHTING_5: begin      //밀어내기
      m_nStartFrame := pm.ActCritical5.start + m_btDir * (pm.ActCritical5.frame + pm.ActCritical5.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical5.frame - 1;
      m_dwFrameTime := pm.ActCritical5.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4357);
    end;
    SM_LIGHTING_6: begin      //천지합일
      m_nStartFrame := pm.ActCritical6.start + m_btDir * (pm.ActCritical6.frame + pm.ActCritical6.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical6.frame - 1;
      m_dwFrameTime := pm.ActCritical6.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4358);
    end;
    SM_LIGHTING_7: begin
      m_nStartFrame := pm.ActCritical7.start + m_btDir * (pm.ActCritical7.frame + pm.ActCritical7.skip);
      m_nEndFrame := m_nStartFrame + pm.ActCritical7.frame - 1;
      m_dwFrameTime := pm.ActCritical7.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4359);
    end;
    SM_LIGHTING_1: begin
      m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
      m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
      m_dwFrameTime := pm.ActAttack.ftime;
      m_dwStartTime := GetTickCount;
      m_dwWarModeTime := GetTickCount;
      Shift (m_btDir, 0, 0, 1);
      PlaySound(4366);
    end;
    SM_STRUCK: begin
      m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
      m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
      m_dwFrameTime := m_dwStruckFrameTime;
      m_dwStartTime := GetTickCount;
      PlaySound(4344);
    end;
    SM_DEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_nStartFrame := m_nEndFrame;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
    end;
    SM_NOWDEATH: begin
      m_nStartFrame := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip);
      m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
      m_dwFrameTime := pm.ActDie.ftime;
      m_dwStartTime := GetTickCount;
      PlaySound(4345);
    end;
    else begin
      inherited;
    end;
  end;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: AxeMon.pas 516 2006-12-01 17:55:14Z Xander $');
end.

