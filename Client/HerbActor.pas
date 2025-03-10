unit HerbActor;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grobal2, DxDraws, CliUtil, magiceff, Actor, WIl;


const
   BEEQUEENBASE = 600;
   DOORDEATHEFFENCTBASE = 1103;         //성문 파괴이펙
   DOORDEATHEFFEN2CTBASE = 1173;         //성문 파괴이펙
   DOORDEATHEFFECTBASE = 120;         //성문 파괴이펙
   WALLLEFTBROKENEFFECTBASE = 224;    //내성벽 파괴이펙
   WALLRIGHTBROKENEFFECTBASE = 240;   //내성벽 파괴이펙
   WALLBROKENEFFECTBASE = 2970;      //사북성벽 파괴이펙
   WALLBROKENEFFENCTBASE = 3090;      //남만성벽 파괴이펙
type
   TDoorState = (dsOpen, dsClose, dsBroken);

   TKillingHerb = class (TActor)//Size 0x250
   private
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
   end;

   TKillingFishEgg = class (TActor)//Size 0x250
   private
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
   end;

   TKillingIceMan = class (TActor)//Size 0x250
   private
   public
      constructor Create; override;
      destructor Destroy; override;
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
   end;

   TBeeQueen = class (TActor)
   private
   public
      procedure CalcActorFrame; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
   end;

   TCentipedeKingMon = class (TKillingHerb)//Size 0x260
   private
      AttackEffectSurface :TDirectDrawSurface; //0x250
      BoUseDieEffect      :Boolean;            //0x254
      ax                  :integer;            //0x258
      ay                  :integer;            //0x25C
      procedure LoadEffect();
   public
      procedure CalcActorFrame; override;
      procedure LoadSurface; override;
      procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);override;
      procedure Run;override;
   end;



   TBigHeartMon = class (TKillingHerb)//Size 0x260
   private
   public
     procedure CalcActorFrame; override;
   end;

   TFishEgg = class (TKillingFishEgg)
   private
   public
     procedure CalcActorFrame; override;
   end;

   TIceMan = class (TKillingIceMan)
   private
   public
     procedure CalcActorFrame; override;
   end;


   TSpiderHouseMon = class (TKillingHerb)
   private
   public
     procedure CalcActorFrame; override;
   end;
   TSpiderHouseMon2 = class (TKillingHerb)
   private
      AttackEffectSurface :TDirectDrawSurface; //0x250
      BoUseDieEffect      :Boolean;            //0x254
      ax                  :integer;            //0x258
      ay                  :integer;            //0x25C
      ax2                 :integer;            //0x258
      ay2                 :integer;            //0x25C
   public
     procedure CalcActorFrame; override;
     procedure LoadSurface; override;
   end;
   TCastleDoor = class (TActor)   //성벽, 성문
   private
      EffectSurface: TDirectDrawSurface;
      ax, ay: integer;
      oldunitx, oldunity: integer;
      procedure ApplyDoorState (dstate: TDoorState);
   public
      BoDoorOpen: Boolean;
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  ActionEnded; override;
      procedure  Run; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;

   TNammanCastleDoor = class (TActor)   //성벽, 성문
   private
      EffectSurface: TDirectDrawSurface;
      ax, ay: integer;
      oldunitx, oldunity: integer;
      procedure ApplyDoorState (dstate: TDoorState);
   public
      BoDoorOpen: Boolean;
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  ActionEnded; override;
      procedure  Run; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;


   TNammanCastleDoor2 = class (TActor)   //성벽, 성문
   private
      EffectSurface: TDirectDrawSurface;
      ax, ay: integer;
      oldunitx, oldunity: integer;
      procedure ApplyDoorState (dstate: TDoorState);
   public
      BoDoorOpen: Boolean;
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  ActionEnded; override;
      procedure  Run; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
   end;


   TWallStructure = class (TActor)//0x62
   private
      EffectSurface: TDirectDrawSurface;
      BrokenSurface: TDirectDrawSurface;
      ax, ay, bx, by: integer;
      deathframe: integer;
      bomarkpos: Boolean;
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure  Run; override;
   end;

   TSabukStructure = class (TActor)//0x62 //사북성벽
   private
      EffectSurface: TDirectDrawSurface;
      ax, ay, bx, by: integer;
      bomarkpos: Boolean;
      procedure ApplyWallState (dstate: Integer);
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure  Run; override;
   end;

   TNammanStructure = class (TActor)//0x62 //남만성벽
   private
      EffectSurface: TDirectDrawSurface;
      ax, ay, bx, by: integer;
      bomarkpos: Boolean;
      procedure ApplyWallState (dstate: Integer);
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure  Run; override;
   end;

   TWallFlag = class (TActor)//0x62      //점령깃발
   private
      ax, ay, bx, by: integer;
      deathframe: integer;
      bomarkpos: Boolean;
   public
      constructor Create; override;
      procedure CalcActorFrame; override;
      procedure  LoadSurface; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure  Run; override;
   end;

   TSoccerBall = class (TActor)//0x9
   private
   public
   end;
   TDragonBody = class (TKillingHerb)//마룡 몸
   private
   public
     procedure DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); override;
     procedure CalcActorFrame(); override;
     procedure LoadSurface(); override;
   end;


implementation

uses
   ClMain, SoundUtil, MShare;


{============================== TKillingHerb =============================}

constructor TKillingHerb.Create;
begin
   inherited Create;
end;

destructor TKillingHerb.Destroy;
begin
   inherited Destroy;
end;

procedure TKillingHerb.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseMagic := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN: //
         begin
            m_nStartFrame := pm.ActStand.start; // + Dir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            if m_btRace = 113 then begin
               m_ncurrentdefframe := m_nStartFrame+(Random(3000) mod 4);
               m_ncurrentframe := m_nStartFrame+(Random(3000) mod 4);
            end;
            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGUP: //, SM_DIGUP, .
         begin
            m_nStartFrame := pm.ActWalk.start; // + Dir * (pm.ActWalk.frame + pm.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := FALSE;
            m_nMoveStep := 1;
            Shift (m_btDir, 0, 0, 1); //m_nMoveStep, 0, m_nEndFrame-startframe+1);
         end;
      SM_HIT:
         begin
            m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
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
         end;
      SM_DIGDOWN:
         begin
          if m_btRace <> 113 then begin
            m_nStartFrame := pm.ActDeath.start;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
            m_boDelActionAfterFinished := TRUE;
          end;
         end;
   end;
end;


function  TKillingHerb.GetDefaultFrame (wmode: Boolean): integer;
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
      Result := pm.ActStand.start + cf;
   end;
end;

{----------------------------------------------------------------------}



{============================== TKillingFishEgg =============================}

constructor TKillingFishEgg.Create;
begin
   inherited Create;
end;

destructor TKillingFishEgg.Destroy;
begin
   inherited Destroy;
end;

procedure TKillingFishEgg.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseMagic := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN: //
         begin
            m_nStartFrame := pm.ActStand.start;
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;

            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGUP: //, SM_DIGUP, .
         begin
            m_nStartFrame := pm.ActWalk.start;
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;

            m_nMoveStep := 1;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HIT:
         begin
            m_nStartFrame := pm.ActAttack.start;
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start;
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime;
            m_dwStartTime := GetTickCount;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start + (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_DIGDOWN:
         begin
          if m_btRace <> 113 then begin
            m_nStartFrame := pm.ActDeath.start;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
            m_boDelActionAfterFinished := TRUE;
          end;
         end;
   end;
end;


function  TKillingFishEgg.GetDefaultFrame (wmode: Boolean): integer;
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
      Result := pm.ActStand.start + cf;
   end;
end;


{============================== TKillingIceMan =============================}

constructor TKillingIceMan.Create;
begin
   inherited Create;
end;

destructor TKillingIceMan.Destroy;
begin
   inherited Destroy;
end;

procedure TKillingIceMan.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseMagic := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;


   case m_nCurrentAction of
      SM_TURN: //
         begin
            m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;

            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGUP: //, SM_DIGUP, .
         begin
            m_nStartFrame := pm.ActWalk.start;
            m_nEndFrame := m_nStartFrame + pm.ActWalk.frame - 1;
            m_dwFrameTime := pm.ActWalk.ftime;
            m_dwStartTime := GetTickCount;

            m_nMoveStep := 1;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HIT:
         begin
            m_nStartFrame := pm.ActAttack.start;
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime;
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
         end;
      SM_DIGDOWN:
         begin
          if m_btRace <> 113 then begin
            m_nStartFrame := pm.ActDeath.start;
            m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
            m_dwFrameTime := pm.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
            m_boDelActionAfterFinished := TRUE;
          end;
         end;
   end;
end;


function  TKillingIceMan.GetDefaultFrame (wmode: Boolean): integer;
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

{----------------------------------------------------------------------}

procedure TBeeQueen.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN:
         begin
            m_nStartFrame := pm.ActStand.start; // + Dir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_HIT:
         begin
            m_nStartFrame := pm.ActAttack.start; // + Dir * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start; // + Dir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //pm.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start; // + Dir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start; // + Dir * (pm.ActDie.frame + pm.ActDie.skip);
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

function  TBeeQueen.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
   cf: integer;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      Result := pm.ActDie.start + (pm.ActDie.frame - 1);
   end else begin
      m_nDefFrameCount := pm.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;
      Result := pm.ActStand.start + cf;
   end;
end;




{----------------------------------------------------------------------}

constructor TCastleDoor.Create;   //성벽, 성문
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   m_nDownDrawLevel := 1;          //1셀 먼저 그림. (사람 머리가 성문 밑으로 들어가는 것을 막음)
end;

procedure TCastleDoor.ApplyDoorState (dstate: TDoorState);
var
   bowalk: Boolean;
begin
   Map.MarkCanWalk (m_nCurrX, m_nCurrY-2, TRUE);
   Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-1, TRUE);
   Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-2, TRUE);
   if dstate = dsClose then bowalk := FALSE
   else bowalk := TRUE;

   Map.MarkCanWalk (m_nCurrX, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY-1, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY-2, bowalk);
   Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-1, bowalk);
   Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-2, bowalk);
   Map.MarkCanWalk (m_nCurrX-1, m_nCurrY-1, bowalk);
   Map.MarkCanWalk (m_nCurrX-1, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX-1, m_nCurrY+1, bowalk);
   Map.MarkCanWalk (m_nCurrX-2, m_nCurrY, bowalk);

   if dstate = dsOpen then begin
      Map.MarkCanWalk (m_nCurrX, m_nCurrY-2, FALSE);
      Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-1, FALSE);
      Map.MarkCanWalk (m_nCurrX+1, m_nCurrY-2, FALSE);
   end;
end;

procedure  TCastleDoor.LoadSurface;
var
   mimg: TWMImages;
begin
   inherited LoadSurface;
   mimg := GetMonImg (m_wAppearance);
   if m_boUseEffect then
      EffectSurface := mimg.GetCachedImage (DOORDEATHEFFECTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay);
end;

procedure TCastleDoor.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_sUserName := ' ';

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            ApplyDoorState (dsBroken);          //움직일 수 있게
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGUP:          //문 열림
         begin
            m_nStartFrame := pm.ActAttack.start;
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            ApplyDoorState (dsOpen);           //움직일 수 있게
         end;
      SM_DIGDOWN:       //문 닫힘
         begin
            m_nStartFrame := pm.ActCritical.start;
            m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
            m_dwFrameTime := pm.ActCritical.ftime;
            m_dwStartTime := GetTickCount;
            BoDoorOpen := FALSE;
            m_boHoldPlace := TRUE;
            ApplyDoorState (dsClose);  //못움직임
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + pm.ActDie.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
            ApplyDoorState (dsBroken);      //움직일 수 있게
         end;
      else     //방향이 없음...
         begin
            if m_btDir < 3 then begin
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame; // + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := 0; //pm.ActStand.frame;
               Shift (m_btDir, 0, 0, 1);
               BoDoorOpen := FALSE;
               m_boHoldPlace := TRUE;
               ApplyDoorState (dsClose);     //못움직이게
            end else begin
               m_nStartFrame := pm.ActCritical.start;         //열려있는 상태
               m_nEndFrame := m_nStartFrame;
               m_nDefFrameCount := 0;

               BoDoorOpen := TRUE;
               m_boHoldPlace := FALSE;
               ApplyDoorState (dsOpen);
            end;
         end;
   end;
end;

function  TCastleDoor.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDie.start + pm.ActDie.frame - 1;
      m_nDownDrawLevel := 2;
   end else begin
      if BoDoorOpen then begin
         m_nDownDrawLevel := 2;
         Result := pm.ActCritical.start; // + Dir * (pm.ActStand.frame + pm.ActStand.skip);
      end else begin
         m_nDownDrawLevel := 1;
         Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      end;
   end;
end;

procedure  TCastleDoor.ActionEnded;
begin
   if m_nCurrentAction = SM_DIGUP then begin        //문열림
      BoDoorOpen := TRUE;
      m_boHoldPlace := FALSE;
   end;
//   if CurrentAction = SM_DIGDOWN then
//      DefaultMotion;
end;

procedure  TCastleDoor.Run;
begin
   if (Map.m_nCurUnitX <> oldunitx) or (Map.m_nCurUnitY <> oldunity) then begin
      if m_boDeath then ApplyDoorState (dsBroken)
      else if BoDoorOpen then ApplyDoorState (dsOpen)
      else ApplyDoorState (dsClose);
   end;
   oldunitx := Map.m_nCurUnitX;
   oldunity := Map.m_nCurUnitY;
   inherited Run;
end;

procedure  TCastleDoor.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,False);
   if m_boUseEffect and not blend then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
end;



{----------------------------------------------------------------------}

constructor TNammanCastleDoor.Create;   //성벽, 성문
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   m_nDownDrawLevel := 1;          //1셀 먼저 그림. (사람 머리가 성문 밑으로 들어가는 것을 막음)
end;

procedure TNammanCastleDoor.ApplyDoorState (dstate: TDoorState);
var
   bowalk: Boolean;
begin
   if dstate = dsClose then bowalk := FALSE
   else bowalk := TRUE;
   Map.MarkCanWalk (m_nCurrX, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY - 1, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY - 2, bowalk);
   Map.MarkCanWalk (m_nCurrX + 1, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX + 1, m_nCurrY - 1, bowalk);
   Map.MarkCanWalk (m_nCurrX - 1, m_nCurrY - 1, bowalk);
   Map.MarkCanWalk (m_nCurrX - 1, m_nCurrY - 2, bowalk);
end;

procedure  TNammanCastleDoor.LoadSurface;
var
   mimg: TWMImages;
begin
   inherited LoadSurface;
   mimg := GetMonImg (m_wAppearance);
   if m_boUseEffect then
    EffectSurface := mimg.GetCachedImage (DOORDEATHEFFENCTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay);
end;

procedure TNammanCastleDoor.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_sUserName := ' ';

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            ApplyDoorState (dsBroken);          //움직일 수 있게
            PlaySound (9605);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + {m_btDir * }(pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            PlaySound (9604);
         end;
      SM_DIGUP:          //문 열림
         begin
            m_nStartFrame := pm.ActAttack.start;
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            ApplyDoorState (dsOpen);           //움직일 수 있게
            PlaySound (9600);
         end;
      SM_DIGDOWN:       //문 닫힘
         begin
            m_nStartFrame := pm.ActCritical.start;
            m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
            m_dwFrameTime := pm.ActCritical.ftime;
            m_dwStartTime := GetTickCount;
            BoDoorOpen := FALSE;
            m_boHoldPlace := TRUE;
            ApplyDoorState (dsClose);  //못움직임
            PlaySound (9602);
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + pm.ActDie.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
            ApplyDoorState (dsBroken);      //움직일 수 있게
         end;
      else     //방향이 없음...
         begin
            if m_btDir < 3 then begin
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame; // + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := 0; //pm.ActStand.frame;
               Shift (m_btDir, 0, 0, 1);
               BoDoorOpen := FALSE;
               m_boHoldPlace := TRUE;
               ApplyDoorState (dsClose);     //못움직이게
            end else begin
               m_nStartFrame := pm.ActCritical.start;         //열려있는 상태
               m_nEndFrame := m_nStartFrame;
               m_nDefFrameCount := 0;

               BoDoorOpen := TRUE;
               m_boHoldPlace := FALSE;
               ApplyDoorState (dsOpen);
            end;
         end;
   end;
end;

function  TNammanCastleDoor.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDie.start + pm.ActDie.frame - 1;
      m_nDownDrawLevel := 2;
   end else begin
      if BoDoorOpen then begin
         m_nDownDrawLevel := 2;
         Result := pm.ActCritical.start; // + Dir * (pm.ActStand.frame + pm.ActStand.skip);
      end else begin
         m_nDownDrawLevel := 1;
         Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      end;
   end;
end;

procedure  TNammanCastleDoor.ActionEnded;
begin
   if m_nCurrentAction = SM_DIGUP then begin        //문열림
      BoDoorOpen := TRUE;
      m_boHoldPlace := FALSE;
   end;
//   if CurrentAction = SM_DIGDOWN then
//      DefaultMotion;
end;

procedure  TNammanCastleDoor.Run;
begin
   if (Map.m_nCurUnitX <> oldunitx) or (Map.m_nCurUnitY <> oldunity) then begin
      if m_boDeath then ApplyDoorState (dsBroken)
      else if BoDoorOpen then ApplyDoorState (dsOpen)
      else ApplyDoorState (dsClose);
   end;
   oldunitx := Map.m_nCurUnitX;
   oldunity := Map.m_nCurUnitY;
   inherited Run;
end;

procedure  TNammanCastleDoor.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,False);
   if m_boUseEffect and not blend then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
end;


{----------------------------------------------------------------------}

constructor TNammanCastleDoor2.Create;   //성벽, 성문
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   m_nDownDrawLevel := 1;          //1셀 먼저 그림. (사람 머리가 성문 밑으로 들어가는 것을 막음)
end;

procedure TNammanCastleDoor2.ApplyDoorState (dstate: TDoorState);
var
   bowalk: Boolean;
begin
   if dstate = dsClose then bowalk := FALSE
   else bowalk := TRUE;
   Map.MarkCanWalk (m_nCurrX, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY - 1, bowalk);
   Map.MarkCanWalk (m_nCurrX, m_nCurrY - 2, bowalk);
   Map.MarkCanWalk (m_nCurrX + 1, m_nCurrY, bowalk);
   Map.MarkCanWalk (m_nCurrX + 1, m_nCurrY + 1, bowalk);
   Map.MarkCanWalk (m_nCurrX + 1, m_nCurrY - 1, bowalk);
   Map.MarkCanWalk (m_nCurrX + 2, m_nCurrY, bowalk);
end;

procedure  TNammanCastleDoor2.LoadSurface;
var
   mimg: TWMImages;
begin
   inherited LoadSurface;
   mimg := GetMonImg (m_wAppearance);
   if m_boUseEffect then
    EffectSurface := mimg.GetCachedImage (DOORDEATHEFFEN2CTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay);
end;

procedure TNammanCastleDoor2.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_sUserName := ' ';

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
            ApplyDoorState (dsBroken);          //움직일 수 있게
            PlaySound (9705);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + {m_btDir * }(pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            PlaySound (9704);
         end;
      SM_DIGUP:          //문 열림
         begin
            m_nStartFrame := pm.ActAttack.start;
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            ApplyDoorState (dsOpen);           //움직일 수 있게
            PlaySound (9700);
         end;
      SM_DIGDOWN:       //문 닫힘
         begin
            m_nStartFrame := pm.ActCritical.start;
            m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
            m_dwFrameTime := pm.ActCritical.ftime;
            m_dwStartTime := GetTickCount;
            BoDoorOpen := FALSE;
            m_boHoldPlace := TRUE;
            ApplyDoorState (dsClose);  //못움직임
            PlaySound (9702);
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + pm.ActDie.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
            ApplyDoorState (dsBroken);      //움직일 수 있게
         end;
      else     //방향이 없음...
         begin
            if m_btDir < 3 then begin
               m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
               m_nEndFrame := m_nStartFrame; // + pm.ActStand.frame - 1;
               m_dwFrameTime := pm.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := 0; //pm.ActStand.frame;
               Shift (m_btDir, 0, 0, 1);
               BoDoorOpen := FALSE;
               m_boHoldPlace := TRUE;
               ApplyDoorState (dsClose);     //못움직이게
            end else begin
               m_nStartFrame := pm.ActCritical.start;         //열려있는 상태
               m_nEndFrame := m_nStartFrame;
               m_nDefFrameCount := 0;

               BoDoorOpen := TRUE;
               m_boHoldPlace := FALSE;
               ApplyDoorState (dsOpen);
            end;
         end;
   end;
end;

function  TNammanCastleDoor2.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDie.start + pm.ActDie.frame - 1;
      m_nDownDrawLevel := 2;
   end else begin
      if BoDoorOpen then begin
         m_nDownDrawLevel := 2;
         Result := pm.ActCritical.start; // + Dir * (pm.ActStand.frame + pm.ActStand.skip);
      end else begin
         m_nDownDrawLevel := 1;
         Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      end;
   end;
end;

procedure  TNammanCastleDoor2.ActionEnded;
begin
   if m_nCurrentAction = SM_DIGUP then begin        //문열림
      BoDoorOpen := TRUE;
      m_boHoldPlace := FALSE;
   end;
//   if CurrentAction = SM_DIGDOWN then
//      DefaultMotion;
end;

procedure  TNammanCastleDoor2.Run;
begin
   if (Map.m_nCurUnitX <> oldunitx) or (Map.m_nCurUnitY <> oldunity) then begin
      if m_boDeath then ApplyDoorState (dsBroken)
      else if BoDoorOpen then ApplyDoorState (dsOpen)
      else ApplyDoorState (dsClose);
   end;
   oldunitx := Map.m_nCurUnitX;
   oldunity := Map.m_nCurUnitY;
   inherited Run;
end;

procedure  TNammanCastleDoor2.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,False);
   if m_boUseEffect and not blend then
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
end;


{----------------------------------------------------------------------}
 //성벽
constructor TWallStructure.Create;
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   BrokenSurface := nil;
   bomarkpos := FALSE;
   //DownDrawLevel := 1;
end;

procedure TWallStructure.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_sUserName := ' ';
   deathframe := 0;
   m_boUseEffect := FALSE;

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            deathframe := pm.ActStand.start + m_btDir;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + pm.ActDie.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
         end;
      SM_DIGUP:    //모습이 변경될때 마다
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            deathframe := pm.ActStand.start + m_btDir;
            m_boUseEffect := TRUE;
         end;
      else            //방향이 없음...
         begin
            m_nStartFrame := pm.ActStand.start + m_btDir; // * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame; // + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := 0; //pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
            m_boHoldPlace := TRUE;
         end;
   end;
end;

procedure  TWallStructure.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   if deathframe > 0 then begin //(CurrentAction = SM_NOWDEATH) or (CurrentAction = SM_DEATH) then begin
      m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + deathframe, m_nPx, m_nPy);
   end else begin
      inherited LoadSurface;
   end;
   BrokenSurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + 8 + m_btDir, bx, by);

   if m_boUseEffect then begin
      if m_wAppearance = 901 then
         EffectSurface := mimg.GetCachedImage (WALLLEFTBROKENEFFECTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay)
      else
         EffectSurface := mimg.GetCachedImage (WALLRIGHTBROKENEFFECTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay);
   end;
end;

function  TWallStructure.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
    Result := pm.ActStand.start + m_btDir; // * (pm.ActStand.frame + pm.ActStand.skip);
end;

procedure TWallStructure.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,boFlag);
   if (BrokenSurface <> nil) and (not blend) then begin
      dsurface.Draw (dx + bx + m_nShiftX,
                     dy + by + m_nShiftY,
                     BrokenSurface.ClientRect,
                     BrokenSurface, TRUE);
   end;
   if m_boUseEffect and (not blend) then begin
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;

procedure  TWallStructure.Run;
begin
   if m_boDeath then begin
      if bomarkpos then begin
         Map.MarkCanWalk (m_nCurrX, m_nCurrY, TRUE);
         bomarkpos := FALSE;
      end;
   end else begin
      if not bomarkpos then begin
         Map.MarkCanWalk (m_nCurrX, m_nCurrY, FALSE);
         bomarkpos := TRUE;
      end;
   end;
   PlayScene.SetActorDrawLevel (self, 0);
   inherited Run;
end;



{----------------------------------------------------------------------}
constructor TSabukStructure.Create;  //사북성벽
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   bomarkpos := FALSE;
   m_nDownDrawLevel := 1;          //1셀 먼저 그림. (사람 머리가 성문 밑으로 들어가는 것을 막음)
end;

procedure TSabukStructure.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_boUseEffect := FALSE;

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDeath.start + pm.ActDeath.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            PlaySound(2084);
         end;
      SM_DIGUP:    //모습이 변경될때 마다
         begin
            m_nStartFrame := pm.ActAttack.start + (m_btDir - 1) * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            m_boUseEffect := TRUE;
            PlaySound(2085);
         end;
      else            //방향이 없음...
         begin
            if m_btDir < 3 then begin
              m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
              m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
              m_dwFrameTime := pm.ActStand.ftime;
              m_dwStartTime := GetTickCount;
              m_nDefFrameCount := pm.ActStand.frame;
              Shift (m_btDir, 0, 0, 1);
              m_boHoldPlace := TRUE;
            end else begin
              m_nStartFrame := pm.ActDeath.start + pm.ActDeath.frame - 1;         //열려있는 상태
              m_nEndFrame := m_nStartFrame;
              m_nDefFrameCount := 0;
              m_boHoldPlace := FALSE;
            end;
         end;
   end;
end;

procedure  TSabukStructure.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   inherited LoadSurface;

   if m_boUseEffect then begin
     EffectSurface := mimg.GetCachedImage (WALLBROKENEFFECTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay)
   end;
end;

function  TSabukStructure.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDeath.start + pm.ActDeath.frame - 1;
      m_nDownDrawLevel := 2;
   end else begin
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      m_nDownDrawLevel := 1;
   end;
end;

procedure TSabukStructure.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,boFlag);
   if m_boUseEffect and (not blend) then begin
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;

procedure  TSabukStructure.Run;
begin
   if m_boDeath then begin
      if bomarkpos then begin
         ApplyWallState(0);
         bomarkpos := FALSE;
      end;
   end else begin
      if not bomarkpos then begin
         ApplyWallState(1);
         bomarkpos := TRUE;
      end;
   end;
   PlayScene.SetActorDrawLevel (self, 0);
   inherited Run;
end;

procedure TSabukStructure.ApplyWallState (dstate: integer);
var
   bowalk: Boolean;
   x, y, z, k, g, h:Integer;
begin
   if dstate = 1 then bowalk := FALSE
   else bowalk := TRUE;
   for x := -4 to 2 do begin
    for y := -7 to -2 do begin
      Map.MarkCanWalk (m_nCurrX + x, m_nCurrY + y, bowalk);
    end;
  end;
  for z := -4 to -1 do begin    //x
    for k := -1 to 1 do begin   //y
      Map.MarkCanWalk (m_nCurrX + z,m_nCurrY + k,bowalk);
    end;
  end;
  for g := -1 to 2 do begin    //x
    for h := -10 to -8 do begin   //y
      Map.MarkCanWalk (m_nCurrX + g,m_nCurrY + h,bowalk);
    end;
  end;

  Map.MarkCanWalk(m_nCurrX - 6,m_nCurrY - 5,bowalk);
  Map.MarkCanWalk(m_nCurrX - 6,m_nCurrY - 4,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 6,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 5,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 4,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 3,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 2,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX - 3,m_nCurrY - 8,bowalk);
  Map.MarkCanWalk(m_nCurrX - 2,m_nCurrY - 8,bowalk);
  Map.MarkCanWalk(m_nCurrX - 2,m_nCurrY - 9,bowalk);
  Map.MarkCanWalk(m_nCurrX - 4,m_nCurrY + 2,bowalk);
  Map.MarkCanWalk(m_nCurrX - 4,m_nCurrY + 3,bowalk);
  Map.MarkCanWalk(m_nCurrX - 4,m_nCurrY + 4,bowalk);
  Map.MarkCanWalk(m_nCurrX - 3,m_nCurrY + 2,bowalk);
  Map.MarkCanWalk(m_nCurrX - 3,m_nCurrY + 3,bowalk);
  Map.MarkCanWalk(m_nCurrX - 2,m_nCurrY + 2,bowalk);

  Map.MarkCanWalk(m_nCurrX,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 1,bowalk);

  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 11,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 11,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 12,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 11,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 12,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 13,bowalk);

  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 6,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 5,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 4,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 3,bowalk);
  Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY - 5,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 4,bowalk);
  if dstate = 0 then begin
    Map.MarkCanWalk(m_nCurrX - 5,m_nCurrY,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 7,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 8,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 9,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 10,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 11,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 12,False);
    Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 13,False);
    Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 6,False);
    Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY - 5,False);
  end;
end;


{----------------------------------------------------------------------}
constructor TNammanStructure.Create;  //사북성벽
begin
   inherited Create;
   m_btDir := 0;
   EffectSurface := nil;
   bomarkpos := FALSE;
   m_nDownDrawLevel := 1;          //1셀 먼저 그림. (사람 머리가 성문 밑으로 들어가는 것을 막음)
end;

procedure TNammanStructure.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   m_boUseEffect := FALSE;

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            m_boUseEffect := TRUE;
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDeath.start + pm.ActDeath.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
            PlaySound(2084);
         end;
      SM_DIGUP:    //모습이 변경될때 마다
         begin
            m_nStartFrame := pm.ActAttack.start + (m_btDir - 1) * (pm.ActAttack.frame + pm.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
            m_dwFrameTime := pm.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            m_boUseEffect := TRUE;
            PlaySound(2085);
         end;
      else            //방향이 없음...
         begin
            if m_btDir < 3 then begin
              m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
              m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
              m_dwFrameTime := pm.ActStand.ftime;
              m_dwStartTime := GetTickCount;
              m_nDefFrameCount := pm.ActStand.frame;
              Shift (m_btDir, 0, 0, 1);
              m_boHoldPlace := TRUE;
            end else begin
              m_nStartFrame := pm.ActDeath.start + pm.ActDeath.frame - 1;         //열려있는 상태
              m_nEndFrame := m_nStartFrame;
              m_nDefFrameCount := 0;
              m_boHoldPlace := FALSE;
            end;
         end;
   end;
end;

procedure  TNammanStructure.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   inherited LoadSurface;

   if m_boUseEffect then begin
     EffectSurface := mimg.GetCachedImage (WALLBROKENEFFENCTBASE + (m_nCurrentFrame - m_nStartFrame), ax, ay)
   end;
end;

function  TNammanStructure.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDeath.start + pm.ActDeath.frame - 1;
      m_nDownDrawLevel := 2;
   end else begin
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
      m_nDownDrawLevel := 1;
   end;
end;

procedure TNammanStructure.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,boFlag);
   if m_boUseEffect and (not blend) then begin
      if EffectSurface <> nil then begin
         DrawBlend (dsurface,
                    dx + ax + m_nShiftX,
                    dy + ay + m_nShiftY,
                    EffectSurface, 1);
      end;
   end;
end;

procedure  TNammanStructure.Run;
begin
   if m_boDeath then begin
      if bomarkpos then begin
         ApplyWallState(0);
         bomarkpos := FALSE;
      end;
   end else begin
      if not bomarkpos then begin
         ApplyWallState(1);
         bomarkpos := TRUE;
      end;
   end;
   PlayScene.SetActorDrawLevel (self, 0);
   inherited Run;
end;

procedure TNammanStructure.ApplyWallState (dstate: integer);
var
  bowalk: Boolean;
  x, y, z, k, g, h:Integer;
begin
  if dstate = 1 then bowalk := FALSE
  else bowalk := TRUE;
  Map.MarkCanWalk(m_nCurrX,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX - 1,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX - 1,m_nCurrY - 2,bowalk);
  Map.MarkCanWalk(m_nCurrX - 1,m_nCurrY - 5,bowalk);
  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 2,bowalk);
  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 3,bowalk);
  Map.MarkCanWalk(m_nCurrX,m_nCurrY - 4,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY + 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 2,bowalk);
  Map.MarkCanWalk(m_nCurrX + 1,m_nCurrY - 3,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY + 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY + 2,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 2,m_nCurrY - 2,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY + 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY + 2,bowalk);
  Map.MarkCanWalk(m_nCurrX + 3,m_nCurrY - 1,bowalk);
  Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY,bowalk);
  Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY + 1,bowalk);
  if dstate = 0 then begin
    Map.MarkCanWalk(m_nCurrX - 1,m_nCurrY - 2,False);
    Map.MarkCanWalk(m_nCurrX - 1,m_nCurrY - 5,False);
    Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY,False);
    Map.MarkCanWalk(m_nCurrX + 4,m_nCurrY + 1,False);
  end;
end;


{----------------------------------------------------------------------}
constructor TWallFlag.Create;       //점령깃발
begin
   inherited Create;
   m_btDir := 0;
   bomarkpos := FALSE;
end;

procedure TWallFlag.CalcActorFrame;
var
   pm: PTMonsterAction;
   haircount: integer;
begin
   m_boUseEffect := FALSE;
   m_nCurrentFrame := -1;

   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   deathframe := 0;
   m_boUseEffect := FALSE;

   case m_nCurrentAction of
      SM_NOWDEATH:
         begin
            m_nStartFrame := pm.ActDie.start;
            m_nEndFrame := m_nStartFrame + pm.ActDie.frame - 1;
            m_dwFrameTime := pm.ActDie.ftime;
            m_dwStartTime := GetTickCount;
            deathframe := pm.ActStand.start + m_btDir;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DEATH:
         begin
            m_nStartFrame := pm.ActDie.start + pm.ActDie.frame - 1;
            m_nEndFrame := m_nStartFrame;
            m_nDefFrameCount := 0;
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := pm.ActStruck.start + m_btDir * (pm.ActStruck.frame + pm.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStruck.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      else            //방향이 없음...
         begin
            m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
            m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
            m_dwFrameTime := pm.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := pm.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
            m_boHoldPlace := TRUE;
         end;
   end;
end;

procedure  TWallFlag.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   if deathframe > 0 then begin
      m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + deathframe, m_nPx, m_nPy);
   end else begin
      inherited LoadSurface;
   end;
end;

function  TWallFlag.GetDefaultFrame (wmode: Boolean): integer;
var
   pm: PTMonsterAction;
   cf: integer;
begin
   Result:=0;
   m_nBodyOffset := GetOffset (m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;
   if m_boDeath then begin
      Result := pm.ActDie.start + pm.ActDie.frame - 1;
   end else begin
      m_nDefFrameCount := pm.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;
   end;
end;

procedure TWallFlag.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
begin
   inherited DrawChr (dsurface, dx, dy, blend,boFlag);
end;

procedure  TWallFlag.Run;
begin
   if m_boDeath then begin
      if bomarkpos then begin
         Map.MarkCanWalk (m_nCurrX, m_nCurrY, TRUE);
         bomarkpos := FALSE;
      end;
   end else begin
      if not bomarkpos then begin
         Map.MarkCanWalk (m_nCurrX, m_nCurrY, FALSE);
         bomarkpos := TRUE;
      end;
   end;
   PlayScene.SetActorDrawLevel (self, 0);
   inherited Run;
end;
{----------------------------------------------------------------------}

procedure TCentipedeKingMon.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
   m_boUseMagic := FALSE;
   m_BoUseEffect := FALSE;
   BoUseDieEffect := FALSE;

   m_nCurrentFrame := -1;
   m_nBodyOffset := GetOffset(m_wAppearance);
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   case m_nCurrentAction of
      SM_TURN:
         begin
            m_btDir := 0;
            inherited CalcActorFrame;
         end;
      SM_HIT:
         begin
            m_btDir:=0;
            m_nStartFrame:=pm.ActCritical.start + m_btDir * (pm.ActCritical.frame + pm.ActCritical.skip);
            m_nEndFrame := m_nStartFrame + pm.ActCritical.frame - 1;
            m_dwFrameTime:=pm.ActCritical.ftime;
            m_dwStartTime := GetTickCount;
            BoUseDieEffect:=True;
            if m_btRace = 113 then BoUseDieEffect := False;  //호혼석
            m_nEffectFrame:=0;
            m_nEffectStart:=0;
            m_nEffectEnd:=m_nEffectStart + 9;
            m_dwEffectFrameTime:= 50;
//            BoUseEffect:=True;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_DIGDOWN:
         begin
            if m_btRace <> 113 then begin
               m_nStartFrame := pm.ActDeath.start;
               m_nEndFrame := m_nStartFrame + pm.ActDeath.frame - 1;
               m_dwFrameTime := pm.ActDeath.ftime;
               m_dwStartTime := GetTickCount;
               m_boDelActionAfterFinished := TRUE;  //이 동작이 끝나면 액터 지음
            end;

           //inherited CalcActorFrame;
         end;
      else begin
         m_btDir := 0;
         inherited CalcActorFrame;
      end;
   end;
end;


procedure TCentipedeKingMon.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
var
   idx: integer;
   d: TDirectDrawSurface;
   ceff: TColorEffect;
begin
 if m_boUseEffect then
  if AttackEffectSurface <> nil then
    DrawBlend (dsurface,dx + ax + m_nShiftX,dy + ay + m_nShiftY,AttackEffectSurface, 1);

end;

procedure TCentipedeKingMon.LoadEffect;
begin
  if m_boUseEffect then begin
   if m_btRace = 113 then begin
        AttackEffectSurface := g_WMonImagesArr[23].GetCachedImage (
                  1410 + m_nEffectFrame-m_nEffectStart, ax, ay);
   end
   else
        AttackEffectSurface := g_WMonImagesArr[14].GetCachedImage (
                        100 + m_nEffectFrame-m_nEffectStart,
                        ax, ay);
  end;
end;


procedure TCentipedeKingMon.LoadSurface;
begin
   inherited LoadSurface;
   LoadEffect();
end;

procedure TCentipedeKingMon.Run;
begin
   if (m_nCurrentAction = SM_WALK) or
      (m_nCurrentAction = SM_BACKSTEP) or
      (m_nCurrentAction = SM_HORSERUN) or
      (m_nCurrentAction = SM_RUN)
   then exit;
   if BoUseDieEffect then begin
     if (m_nCurrentFrame - m_nStartFrame) >= 5 then begin
       BoUseDieEffect:=False;
       m_boUseEffect:=True;
       m_dwEffectStartTime:=GetTickCount();
       m_nEffectFrame:=0;
       LoadEffect();
     end;
   end;
   if m_boUseEffect then begin
     if (GetTickCount - m_dwEffectStartTime) > m_dwEffectFrameTime then begin
       m_dwEffectStartTime:=GetTickCount();
       if m_nEffectFrame < m_nEffectEnd then begin
         Inc(m_nEffectFrame);
         LoadEffect();
       end else m_boUseEffect:=False;
     end;
   end;
  inherited;
end;


{ TBigHeartMon }

procedure TBigHeartMon.CalcActorFrame;
begin
  m_btDir:=0;
  inherited CalcActorFrame;
end;

{ TFishEgg }

procedure TFishEgg.CalcActorFrame;
begin
  m_btDir:=0;
  inherited CalcActorFrame;
end;


{TIceMan}
procedure TIceMan.CalcActorFrame;
begin
 // m_btDir:=0;
  inherited CalcActorFrame;
end;



{ TSpiderHouseMon }

procedure TSpiderHouseMon.CalcActorFrame;
begin
  m_btDir:=0;
  inherited CalcActorFrame;
end;

{ TSpiderHouseMon2 }

procedure TSpiderHouseMon2.CalcActorFrame;
begin
  m_btDir:=0;
  inherited CalcActorFrame;
end;

procedure TSpiderHouseMon2.LoadSurface;
begin
  inherited;
  case m_nCurrentAction of
    SM_TURN: begin
      AttackEffectSurface := g_WEffectImg.GetCachedImage (
                        600,
                        ax, ay);
    end;
    else begin
      m_boUseEffect := TRUE;
      m_nEffectStart:=0;
      m_nEffectFrame:=0;
      m_nEffectEnd:=4;
      m_dwEffectStartTime:=GetTickCount;
      m_dwEffectFrameTime:=150;
      AttackEffectSurface := g_WEffectImg.GetCachedImage (
                        600,
                        ax, ay);
    end;
  end;
end;


{ TDragonBody }

procedure TDragonBody.CalcActorFrame;
var
   pm: PTMonsterAction;
begin
  m_btDir:=0;
  m_boUseMagic:=False;
  m_nCurrentFrame:= -1;
  m_nBodyOffset := GetOffset(m_wAppearance);
  pm := GetRaceByPM (m_btRace,m_wAppearance);
  if pm = nil then exit;
  case m_nCurrentAction of
    SM_DIGUP: begin
      m_nMoveStep:=1;
      Shift (m_btDir, 0, 0, 1);
    end;
  end;
  m_nStartFrame:=0;
  m_nEndFrame:=1;
  m_dwFrameTime:=400;
  m_dwStartTime:=GetTickCount();
end;

procedure TDragonBody.DrawEff(dsurface: TDirectDrawSurface; dx,
  dy: integer);
begin
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;
    if m_BodySurface <> nil then
end;

procedure TDragonBody.LoadSurface;
begin
  m_BodySurface := nil;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: HerbActor.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.
