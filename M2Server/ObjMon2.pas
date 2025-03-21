unit ObjMon2;

interface
uses
  {svn, }Windows,Classes,Grobal2,ObjBase, ObjMon , sysutils ;
type
  TStickMonster = class(TAnimalObject)
    n54C    :Integer;
    bo550   :Boolean;
    nComeOutValue   :Integer;
    nAttackRange    :Integer;
  private

  public
    constructor Create();
    destructor Destroy; override;
    function  AttackTarget():Boolean;virtual;
    function  CheckComeOut:Boolean;virtual;
    procedure ComeOut;virtual;
    procedure ComeDown;virtual;//FFE8
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run;override;
  end;
  TBeeQueen = class(TAnimalObject)
    BBList   :TList;
  private
    procedure MakeChildBee;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run;override;
  end;
  TCentipedeKingMonster = class(TStickMonster)
    m_dwAttickTick    :LongWord; //0x560
  private
    function FindTarget: Boolean;
    function  AttackTarget():Boolean;override;
  public
    constructor Create();
    procedure ComeOut;override;
    procedure Run;override;
  end;
  TBigHeartMonster = class(TAnimalObject)
  private

  public
    constructor Create();
    destructor Destroy; override;

    function AttackTarget():Boolean;virtual;
    procedure Run;override;
  end;

  TBamTreeMonster = class(TAnimalObject)
  public
    m_nStruckCount :Integer;  //0x798
    m_nHealth      :Integer;  //0x79C
    constructor Create();//0x00504AD8
    procedure Struck(hiter: TBaseObject);override; //0x00504B3C
    procedure Run;override; //0x00504B60
  end;

  TSpiderHouseMonster = class(TAnimalObject)
    BBList  :TList;
  private
    procedure GenBB;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run;override;
  end;
  TExplosionSpider = class(TMonster)
  public
    dw558    :LongWord;
    constructor Create();
    procedure sub_4A65C4;
    function AttackTarget():Boolean; override;
    procedure Run; override;
  end;

  TExplosionDark = class(TATMonster)  //칠흑수
  public
    dw558    :LongWord;
    constructor Create();
    procedure sub_4A65C4;
    function AttackTarget():Boolean; override; //FFEB
    procedure Run; override;
  end;

  TExplosion2Dark = class(TATMonster)  //강호
  public
    dw558    :LongWord;
    constructor Create();
    procedure sub_4A65C4;
    function AttackTarget():Boolean; override; //FFEB
    procedure Run; override;
  end;

  TSpiderHouseMonster2 = class(TAnimalObject)
    BBList  :TList;
  private
    procedure GenBB;
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;//FFFC
    procedure Run;override;
  end;
  TExplosionSpider2 = class(TMonster)
  public
    dw558    :LongWord;
    constructor Create();
    procedure sub_4A65C4;
    function AttackTarget():Boolean; override;
    procedure Run; override;
  end;

  TGuardUnit = class(TAnimalObject)
    dw54C              :LongWord;       //0x54C
    m_nX550            :Integer;      //0x550
    m_nY554            :Integer;      //0x554
    m_nDirection       :Integer;      //0x558
  public
    function  IsProperTarget(BaseObject:TBaseObject):boolean; override; //FFF4
    procedure Struck(hiter: TBaseObject);override; //FFEC
  end;
  TArcherGuard = class(TGuardUnit)     //궁수경비
  private
    procedure sub_4A6B30(TargeTBaseObject:TBaseObject);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;
  TArcherPolice = class(TArcherGuard)       //궁수경찰
  private
  public
    constructor Create();
    destructor Destroy; override;
  end;

  TCastleDoor = class(TGuardUnit)
    BrokenTime         :LongWord;     //0x560
    Broken             :Boolean;
    m_boOpened         :Boolean;      //문인경우 열려졌있는지
  private
    procedure SetMapXYFlag(nFlag:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Die;override;
    procedure Run;override;
    procedure Initialize();override;
    procedure Close;
    procedure Open;
    procedure RefStatus;
  end;

  TNammanCastleDoor = class(TGuardUnit)
    BrokenTime         :LongWord;     //0x560
    Broken             :Boolean;
    m_boOpened         :Boolean;      //문인경우 열려졌있는지
  private
    procedure SetMapXYFlag(nFlag:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Die;override;
    procedure Run;override;
    procedure Initialize();override;
    procedure Close;
    procedure Open;
    procedure RefStatus;
  end;

  TNammanCastleDoor2 = class(TGuardUnit)
    BrokenTime         :LongWord;     //0x560
    Broken             :Boolean;
    m_boOpened         :Boolean;      //문인경우 열려졌있는지
  private
    procedure SetMapXYFlag(nFlag:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Die;override;
    procedure Run;override;
    procedure Initialize();override;
    procedure Close;
    procedure Open;
    procedure RefStatus;
  end;

  TWallStructure = class(TGuardUnit)
    BrokenTime:LongWord;
    Broken             :Boolean;
    boSetMapFlaged:Boolean;
  private
  public
    constructor Create();
    destructor Destroy; override;
    procedure Initialize;override;
    procedure Die;override;
    procedure Run;override;
    procedure RefStatus;
  end;

  TSabukStructure = class(TGuardUnit)
    BrokenTime:LongWord;
    Broken             :Boolean;
    boSetMapFlaged:Boolean;
  private
    procedure SetMapXYFlag(nFlag:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Initialize;override;
    procedure Die;override;
    procedure Run;override;
    procedure RefStatus;
  end;

  TNammanStructure = class(TGuardUnit)   //남만성벽
    BrokenTime:LongWord;
    Broken             :Boolean;
    boSetMapFlaged:Boolean;
  private
    procedure SetMapXYFlag(nFlag:Integer);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Initialize;override;
    procedure Die;override;
    procedure Run;override;
    procedure RefStatus;
  end;

  TWallFlag = class(TGuardUnit)    //점령깃발
    BrokenTime:LongWord;
    Broken             :Boolean;
    boWarChack:Boolean;
    boSetMapFlaged:Boolean;
  private
  public
    sLastHiterGuild: String;
    constructor Create();
    destructor Destroy; override;
    procedure Initialize;override;
    procedure Die;override;
    procedure Run;override;
    function Operate(ProcessMsg:pTProcessMessage):Boolean; override;
    procedure RefStatus;
  end;

  TSoccerBall = class(TAnimalObject)
    nMoveCount:Integer;
  private

  public
    constructor Create();
    destructor Destroy; override;
    procedure Struck(hiter: TBaseObject);override;
    procedure Run;override;
  end;

  TEvilMir = class(TAnimalObject)
    m_dwSpellTick  :LongWord;
    boSlaves:Boolean;
  private
      procedure FlameCircle(nDir: Integer);
      procedure MassThunder();
      procedure CallSlaves();
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;
    procedure Run;override;
    procedure Die; override;
  end;

  TFoxBead = class (TATMonster)    //비월천주
   protected
      bo554: Boolean;
      CheckRocks: boolean;
      rocklist: TList;
   public
      TargetTime: longword;
      RangeAttackTime: longword;
      OldTargetCret: TBaseObject;
      sectick: longword;
      constructor Create;
      procedure Run; override;
      function  AttackTarget: Boolean; override;
      function  FindTarget: Boolean;
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Die; override;
   end;

   TCatKing = class (TATMonster)    //묘장군
   public
      constructor Create;
      function  AttackTarget: Boolean; override;
      function  FindTarget: Boolean;
      procedure Attack (TargeTBaseObject: TBaseObject; nDir: Integer); override;
      procedure Attack2 (targ: TBaseObject; nDir: Integer);
      procedure RangeAttack (targ: TBaseObject);
      procedure RangeAttack2 (targ: TBaseObject);
   end;


  THellMonster  = class(TMonster)
  private
    m_boUseMagic:Boolean;
    procedure sub_4A65C4;
    procedure ThrustAttack(nDir:Integer);

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  TIceHellMonster  = class(TMonster)
  private
    m_boUseMagic:Boolean;
    procedure ThrustAttack(nDir:Integer);

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  TIceHellMonster2  = class(TMonster)
    m_dwSpellTick : LongWord;
  private
    MassAttackMode:Boolean;
    MassAttackCount:Byte;
    NextTarget:TBaseObject;
    nextx,nexty:Integer;
    boMoving:Boolean;
    m_boUseMagic:Boolean;
    procedure ThrustAttack(nDir:Integer);
    function  Operate(ProcessMsg:pTProcessMessage):boolean; reintroduce;

  public
    constructor Create();
    destructor Destroy; override;
    procedure Run;override;
  end;

  THellMonster2 = class(TMonster)
  m_dwSpellTick : LongWord;
  private
    MassAttackMode:Boolean;
    MassAttackCount:Byte;
    NextTarget:TBaseObject;
    nextx,nexty:Integer;
    boMoving:Boolean;
    procedure RedCircle(nDir:Integer);
  public
    constructor Create();
    function AttackTarget():boolean; override;
    destructor Destroy; override;
    procedure Run;override;
  end;

  THellMonster3 = class(TMonster)
    dw558   :LongWord;
    m_dwSpellTick : LongWord;
    m_counterpart  : TBaseObject;
    bo55C    :Boolean;
    bo55D    :Boolean;
    n560     :integer;
    dw564    :LongWord;
    dw568    :LongWord;
    dw56C    :LongWord;
    dw570    :LongWord;
  private
    MassAttackMode:Boolean;
    MassAttackCount:Byte;
    NextTarget:TBaseObject;
    nextx,nexty:Integer;
    boMoving:Boolean;
    procedure MagicAttack();
  public
    constructor Create();
    destructor Destroy; override;
    function  Operate(ProcessMsg:pTProcessMessage):boolean; override;
    function AttackTarget(nDir:Integer):Boolean;reintroduce;
    procedure Run;override;
  end;

  THellGuard = class(TAnimalObject)
    m_dwThinkTick  :LongWord;
    bo558:Boolean;
    m_dwSpellTick  :LongWord;
    m_dwPoisonTick : LongWord;
  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure RangeAttack (Target: TBaseObject);
    procedure RangeAttack2 (Target: TBaseObject);
    procedure Run;override;
  end;


  //호혼석
   TStickBlockMonster = class (TStickMonster)
   private
      DontAttack: Boolean;
      BoCallFollower: Boolean;
      BoTransparent: Boolean;
      FirstComeOut: Boolean;
      SecondMovement: Boolean;
      FirstStruck: Boolean;
      Caller: TBaseObject;
      ComeoutTime: Longword;
      TargetDisappearTime: Longword;
      childlist: TList;  //만들어 낸 부하의 리스트
      OldTargetCret: TBaseObject;
   protected
      function  FindTarget: Boolean;
      function  AttackTarget: Boolean; override;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Attack (target: TBaseObject; dir: byte); reintroduce;
      procedure ComeOut; override;
      procedure ComeDown; override;
      procedure CallFollower; dynamic;
      procedure Die; override;
      function  Operate(ProcessMsg:pTProcessMessage):Boolean; override;
      procedure Struck (hiter: TBaseObject); override;
      procedure Run; override;
   end;

var
  g_DragonSearchPath:Array[0..41,0..1] of Integer = (
  (0, -5), (1, -5), (-1, -4), (0, -4),
  (1, -4), (2, -4), (-2, -3), (-1, -3),
  (0, -3), (1, -3), (2, -3),  (-3, -2),
  (-2, -2),(-1, -3),(0, -2),  (1, -2),
  (2, -2), (-3, -1),(-2, -1), (-1, -1),
  (0, -1), (1, -1), (2, -1),  (-3, 0),
  (-2, 0), (-1, 0), (0, 0),   (1, 0),
  (2, 0),  (3, 0),  (-2, 1),  (-1, 1),
  (0, 1),  (1, 1),  (2, 1),   (3, 1),
  (-1, 2), (0, 2),  (1, 2),   (2, 2),
  (0, 3),  (1, 3)
  );


implementation

uses
  M2Share, HUtil32, Castle, Guild;



{ TStickMonster }
constructor TStickMonster.Create;//004A51C0
begin
  inherited Create;
  bo550:=False;
  m_nViewRange:=7;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  m_btRaceServer := 85;
  nComeOutValue:=4;
  nAttackRange:=4;
  m_boFixedHideMode:=True;
  m_boStickMode:=True;
  m_boAnimal:=True;
end;

destructor TStickMonster.Destroy;//004A5290
begin
  inherited Destroy;
end;
function TStickMonster.AttackTarget: Boolean;
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret = nil then exit;
  if GetAttackDir(m_TargetCret,btDir) then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      m_dwTargetFocusTick:=GetTickCount();
      Attack(m_TargetCret,btDir);
    end;
    Result:=True;
    exit;
  end;
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    SetTargetXY(m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY); {0FFF0h}
  end else begin
    DelTargetCreat();{0FFF1h}
  end;
end;

procedure TStickMonster.ComeOut();
begin
  m_boFixedHideMode:=False;
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;
procedure TStickMonster.ComeDown();//004A53E4
var
  I:Integer;
ResourceString
  sExceptionMsg = '[Exception] TStickMonster::VisbleActors Dispose';
begin
  SendRefMsg(RM_DIGDOWN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  try
    for I := 0 to m_VisibleActors.Count - 1 do begin
      Dispose(pTVisibleBaseObject(m_VisibleActors.Items[I]));
    end;
    m_VisibleActors.Clear;
  except
    MainOutMessage(sExceptionMsg);
  end;
  m_boFixedHideMode:=True;
end;
function TStickMonster.CheckComeOut():Boolean;//004A53E4
var
  I:Integer;
  BaseObject:TBaseObject;
begin
  Result := FALSE;
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
    if BaseObject.m_boDeath then Continue;
    if IsProperTarget(BaseObject) then begin
      if not BaseObject.m_boHideMode or m_boCoolEye then begin
        if (abs(m_nCurrX - BaseObject.m_nCurrX) < nComeOutValue) and (abs(m_nCurrY - BaseObject.m_nCurrY) < nComeOutValue) then begin
          Result := TRUE;
          break;
        end;
      end;
    end;
  end;    // for
end;

function TStickMonster.Operate(ProcessMsg: pTProcessMessage):Boolean;
begin
  Result:=inherited Operate(ProcessMsg);
end;

procedure TStickMonster.Run;//004A5614
var
  bo05:Boolean;
begin
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      if m_boFixedHideMode then begin
        if CheckComeOut() then
          ComeOut();
      end else begin
        if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
          SearchTarget();
        end;
        bo05:=False;
        if m_TargetCret <> nil then begin
          if (abs(m_TargetCret.m_nCurrX - m_nCurrX) > nAttackRange) or
             (abs(m_TargetCret.m_nCurrY - m_nCurrY) > nAttackRange) then begin
            bo05:=True;
          end;
        end else bo05:=True;
        if bo05 then begin
          ComeDown();
        end else begin
          if AttackTarget then begin
            inherited Run;
            exit;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;



{ TSoccerBall }

constructor TSoccerBall.Create;//004A764C
begin
  inherited;
  m_boAnimal:=False;
  m_boSuperMan:=True;
  nMoveCount:=0;
  m_nTargetX:= -1;
end;

destructor TSoccerBall.Destroy;
begin

  inherited;
end;



procedure TSoccerBall.Run;
var
  nX,nY:Integer;
begin
  if nMoveCount > 0 then begin
    if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,m_btDirection,1,nX,nY) then begin
      if m_PEnvir.CanWalk(nX,nY,True) then begin
        case m_btDirection of    //
          0: m_btDirection:=4;
          1: m_btDirection:=7;
          2: m_btDirection:=6;
          3: m_btDirection:=5;
          4: m_btDirection:=0;
          5: m_btDirection:=3;
          6: m_btDirection:=2;
          7: m_btDirection:=1;
        end;    // case
        m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,m_btDirection,nMoveCount,nX,nY);
      end;
    end;
  end else begin//004A78A1
    m_nTargetX:= -1;
  end;
  if m_nTargetX <> -1 then begin
    GotoTargetXY();
    if (m_nTargetX = m_nCurrX) and (m_nTargetY = m_nCurrY) then
      nMoveCount:=0;
  end;
  inherited;
end;

procedure TSoccerBall.Struck(hiter: TBaseObject);
begin
  if hiter = nil then exit;
  m_btDirection:=hiter.m_btDirection;
  nMoveCount:=Random(4) + (nMoveCount + 4);
  nMoveCount:=_MIN(20,nMoveCount);
  m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,m_btDirection,nMoveCount,m_nTargetX,m_nTargetY);
end;




{팎莖침질}
constructor TEvilMir.Create;
begin
  inherited;
  m_dwSpellTick:=GetTickCount();
  m_boAnimal:=False;
  boSlaves:=False;
  dwEMDied:=0;   //this tells former pets that they should go :p
  m_nViewRange:=20;
end;

destructor TEvilMir.Destroy;
begin
  inherited;
end;

procedure TEvilMir.Run;//004A617C
var
  nDir:Byte;
begin
  if not m_boFixedHideMode and
     not m_boStoneMode and
     CanMove then begin

     if boSlaves = FALSE then begin //if we dont have slaves already make them
      boSlaves:= TRUE;
      callslaves();
      end;

      if (m_boDeath) and (boslaves = true) then begin
      boslaves:= false;
      nEMDrops:=0;//reset all the drops/hitcount on parts
      nEMHitCount:=0;
      dwEMDied:=GetTickCount();//tell our slaves that their master has passed away
      inc(nEMKills)
      end;

     //basicaly casting his normal fireball/firebang spell every 3.5seconds
     if (m_TargetCret <> nil) and (Integer(GetTickCount - m_dwHitTick) > 3500) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 10) and (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 10) then begin
      m_dwHitTick:=GetCurrentTime;
      nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
    if Random(5) = 0 then
      MassThunder
    else
      FlameCircle(nDir);
     end;

     if (m_TargetCret <> nil) and (Integer(GetTickCount - m_dwSpellTick) > 30000) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 10) and (abs(m_nCurrY - m_TargetCret.m_nCurrY) <= 10) then begin
    if Random(5) = 0 then
      MassThunder
    else
      FlameCircle(nDir);
     end;

    //search for targets nearby
    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
   end;
  end;
  inherited;
end;

procedure TEvilMir.CallSlaves();
const
  sMonName:array[0..2] of String = ('4', '5', '6');//basicaly by adding to this you can make new 'slaves' that drop better
var
  I: Integer;
  BaseObject:TBaseObject;
begin
  for i := 0 to High(g_DragonSearchPath) do begin
    if (g_DragonSearchPath[i,0] = 0) and (g_DragonSearchPath[i,1] = 0) then Continue;
    BaseObject := UserEngine.RegenMonsterByName(m_PEnvir.sMapName, m_nCurrX+g_DragonSearchPath[i,0], m_nCurrY+g_DragonSearchPath[i,1], sMonName[_Min(nEMKills,Length(sMonName))]);
  end;
end;

procedure TEvilMir.FlameCircle(nDir:Integer);
var
  nSX,nSY,nTX,nTY,nPwr:Integer;
  I:Integer;
  magpwr:Integer;
  TargetNum:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
begin
//target selected
 Target := m_TargetCret;
 {do spell effect}
 case nDir of
   0,1,6,7: SendRefMsg (RM_83, nDir, m_nCurrX, m_nCurrY, Integer(Target), '');
   5  : SendRefMsg (RM_82, nDir, m_nCurrX, m_nCurrY, Integer(Target), '');
   2,3,4: SendRefMsg (RM_81, nDir, m_nCurrX, m_nCurrY, Integer(Target), '');
   end;

  for i:=0 to Target.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(Target.m_VisibleActors[i]).BaseObject);
    if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 2) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 2) then begin
      if BaseObject <> nil then begin
        if IsProperTarget (BaseObject) then begin
          WAbil:=@m_WAbil;
          magpwr:=Random(nEMKills * 5) + (Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
          BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 600);
        end;
      end;
    end;
  end;
end;

procedure TEvilMir.MassThunder();
var
  xTargetList:TList;
  BaseObject:TBaseObject;
  WAbil:pTAbility;
  magpwr:Integer;
  magpwr2:Integer;
  i:Integer;
begin
  m_dwSpellTick:=GetTickCount();
  SendRefMsg (RM_LIGHTING, Self.m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
  xTargetList := TList.Create;
  GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,12,xTargetList);

	if (xTargetList.Count>0) then begin
    for i:=xTargetList.Count-1 downto 0 do begin
      BaseObject := TBaseObject(xTargetList.Items[i]);
      if (BaseObject<>nil) then begin
        if IsProperTarget(BaseObject) then begin
          WAbil:=@m_WAbil;
          magpwr:=Random(nEMKills * 12) + (Random(SmallInt(HiWord(WAbil.SC) - LoWord(WAbil.SC)) + 1) + LoWord(WAbil.SC));
          BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 1, 0, '', 600);
        end;
        xTargetList.Delete(i);
		  end;
    end;
	end;
  xTargetList.Free;
end;


function TEvilMir.Operate(ProcessMsg:pTProcessMessage):boolean;
begin
  if (ProcessMsg.wIdent = RM_POISON) then begin
    massthunder();
  end;
  Result:=inherited Operate(ProcessMsg);
end;

procedure TEvilMir.Die;
begin
  inherited;
  m_dwDeathTick := GetTickCount + 5*60*1000;
end;


{ TBeeQueen }

constructor TBeeQueen.Create;//004A5750
begin
  inherited Create;
  m_nViewRange:=9;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=GetTickCount();
  m_boStickMode:=True;
  BBList:=TList.Create;
end;

destructor TBeeQueen.Destroy;//004A57F0
begin
  FreeAndNil(BBList);
  inherited Destroy;
end;

procedure TBeeQueen.MakeChildBee;
begin
  if BBList.Count < 15 then begin
    SendRefMsg(RM_HIT,self.m_btDirection,m_nCurrX,m_nCurrY,0,'');
    SendDelayMsg(Self,RM_ZEN_BEE,0,0,0,0,'',500);
  end;
end;

function TBeeQueen.Operate(ProcessMsg:pTProcessMessage):Boolean;
var
  BB:TBaseObject;
begin
  if ProcessMsg.wIdent = RM_ZEN_BEE then begin
    BB:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,m_nCurrX,m_nCurrY,g_Config.sBee);
    if BB <> nil then begin
      BB.SetTargetCreat(m_TargetCret);
      BBList.Add(BB);
    end;
  end;
  Result:=inherited Operate(ProcessMsg);
end;

procedure TBeeQueen.Run;
var
  I: Integer;
  BB:TBaseObject;
begin
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        SearchTarget();
        if m_TargetCret <> nil then MakeChildBee();
      end;
      for I := BBList.Count -1 downto 0 do begin
        BB:=TBaseObject(BBList.Items[I]);
        if BB.m_boDeath or (BB.m_boGhost) then BBList.Delete(I);
      end;
    end;
  end;
  inherited Run;
end;

{ TCentipedeKingMonster }



constructor TCentipedeKingMonster.Create;//004A5A8C
begin
  inherited Create;
  m_nViewRange:=6;
  nComeOutValue:=4;
  nAttackRange:=6;
  m_boAnimal:=False;
  m_dwAttickTick:=GetTickCount();
end;

function TCentipedeKingMonster.FindTarget: Boolean;
var
  I:Integer;
  BaseObject:TBaseObject;
begin
  Result:=False;
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
    if (not BaseObject.m_boDeath) and IsProperTarget(BaseObject) then begin
      if (abs(m_nCurrX - BaseObject.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= m_nViewRange) then begin
        Result:=True;
        break;
      end;
    end;
  end;
end;

function TCentipedeKingMonster.AttackTarget: Boolean; //004A5BC0
var
  WAbil:pTAbility;
  nPower,I:Integer;
  BaseObject:TBaseObject;
begin
  Result:=False;
  if FindTarget then begin

  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    m_dwHitTick:=GetCurrentTime;
    SendAttackMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY);
    WAbil:=@m_WAbil;
    nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if (not BaseObject.m_boDeath) and IsProperTarget(BaseObject) then begin
        if (abs(m_nCurrX - BaseObject.m_nCurrX) <= nAttackRange) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= nAttackRange) then begin
          m_dwTargetFocusTick:=GetTickCount();
          SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(BaseObject.m_nCurrX,BaseObject.m_nCurrY),2,Integer(BaseObject),'',600);
          if Random(4 +  m_TargetCret.m_btAntiPoison) = 0 then begin
            if Random(3) <> 0 then begin
              BaseObject.MakePosion(POISON_DECHEALTH, 60, 10);      //체력이 감소
            end else begin
              BaseObject.MakePosion(POISON_STONE, 5,1);
            end;
            m_TargetCret:=BaseObject;
          end;
        end;
      end;
    end;    // for
  end;
  Result:=True;
  end;
end;

procedure TCentipedeKingMonster.ComeOut;
begin
  inherited ComeOut;
  m_WAbil.HP:=m_WAbil.MaxHP;
end;

procedure TCentipedeKingMonster.Run;
var
  I:Integer;
  BaseObject:TBaseObject;
begin
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      if m_boFixedHideMode then begin
        if (GetTickCount - m_dwAttickTick) > 10000 then begin
          for I := 0 to m_VisibleActors.Count - 1 do begin
            BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
            if (not BaseObject.m_boDeath) and IsProperTarget(BaseObject) then begin
              if not BaseObject.m_boHideMode or m_boCoolEye then begin
                if (abs(m_nCurrX - BaseObject.m_nCurrX) < nComeOutValue) and (abs(m_nCurrY - BaseObject.m_nCurrY) < nComeOutValue) then begin
                  ComeOut();
                  m_dwAttickTick:=GetTickCount();
                  break;
                end;
              end;
            end;
          end;
        end;//004A5F86
      end else begin
        if (GetTickCount - m_dwAttickTick) > 3000 then begin
          if AttackTarget() then begin
            inherited Run;
            exit;
          end;
          if (GetTickCount - m_dwAttickTick) > 10000 then begin
            ComeDown();
            m_dwAttickTick:=GetTickCount();
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;


{ TBigHeartMonster }


constructor TBigHeartMonster.Create;//004A5F94
begin
  inherited;
  m_nViewRange:=16;
  m_boAnimal:=False;
end;

destructor TBigHeartMonster.Destroy;
begin

  inherited;
end;

function TBigHeartMonster.AttackTarget():Boolean; //004A5FEC
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
          SendRefMsg(RM_10205,0,BaseObject.m_nCurrX,BaseObject.m_nCurrY,1{type},'0');         //적월마 이팩트
        end;
      end;
    end;    // for
    Result:=True;
  end;
//  inherited;

end;

procedure TBigHeartMonster.Run;//004A617C
begin
  if CanMove then begin
    if m_VisibleActors.Count > 0 then
      AttackTarget();
  end;
  inherited;
end;

{ TBamTreeMonster }


constructor TBamTreeMonster.Create;
begin
  inherited Create;
  m_boAnimal:=False;
  m_nStruckCount := 0;
  m_nHealth := 0;
end;

procedure TBamTreeMonster.Struck(hiter: TBaseObject);
begin
  inherited Struck (hiter);
  Inc(m_nStruckCount);
end;

procedure TBamTreeMonster.Run;
begin
  if m_nHealth = 0 then
    m_nHealth := m_WAbil.MaxHP;

   m_WAbil.HP:=m_WAbil.MaxHP;
  if m_nStruckCount >= m_nHealth then
    m_WAbil.HP := 0;

  inherited Run;
end;

{ TSpiderHouseMonster2 }

constructor TSpiderHouseMonster2.Create;//004A61D0
begin
  inherited Create;
  m_nViewRange:=9;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:= GetTickCount;
  m_boStickMode:=True;
  BBList:=TList.Create;
end;

destructor TSpiderHouseMonster2.Destroy;
begin
  FreeAndNil(BBList);
  inherited;
end;
procedure TSpiderHouseMonster2.GenBB;//004A62B0
begin
  if BBList.Count < 15 then begin
    SendRefMsg(RM_HIT,self.m_btDirection,m_nCurrX,m_nCurrY,0,'');
    SendDelayMsg(Self,RM_ZEN_BEE,0,0,0,0,'',500);
  end;

end;
function TSpiderHouseMonster2.Operate(ProcessMsg:pTProcessMessage):Boolean;
var
  BB:TBaseObject;
  n08,n0C:Integer;
begin
  if ProcessMsg.wIdent = RM_ZEN_BEE then begin
    n08:=m_nCurrX;
    n0C:=m_nCurrY + 1;
    if m_PEnvir.CanWalk(n08,n0C,True) then begin
      BB:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,n08,n0C,g_Config.sSpider2);
      if BB <> nil then begin
        BB.SetTargetCreat(m_TargetCret);
        BBList.Add(BB);
      end;
    end;
  end;
  Result:= inherited Operate(ProcessMsg);
end;

procedure TSpiderHouseMonster2.Run;
var
  I: Integer;
  BB:TBaseObject;
begin
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        SearchTarget();
        if m_TargetCret <> nil then GenBB();
      end;
      for I := BBList.Count -1 downto 0 do begin
        BB:=TBaseObject(BBList.Items[I]);
        if BB.m_boDeath or (BB.m_boGhost) then BBList.Delete(I);

      end;    // for
    end;


  end;
  inherited Run;
end;

{ TExplosionSpider2 }

constructor TExplosionSpider2.Create;
begin
  inherited Create;
  m_nViewRange:=5;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=0;
  dw558:=GetTickcount();
end;

procedure TExplosionSpider2.sub_4A65C4;
var
  WAbil:pTAbility;
  I,nPower,n10:Integer;
  BaseObject:TBaseObject;
begin
  m_WAbil.HP:=0;
  WAbil:=@m_WAbil;
  nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
    if (abs(BaseObject.m_nCurrX - m_nCurrX) <= 1) and (abs(BaseObject.m_nCurrY - m_nCurrY) <= 1) then begin
      if (not BaseObject.m_boDeath) and (IsProperTarget(BaseObject)) then begin
        n10:=0;
        Inc(n10,BaseObject.GetHitStruckDamage(Self,nPower div 2));
        Inc(n10,BaseObject.GetMagStruckDamage(Self,nPower div 2));
        if n10 > 0 then begin
          BaseObject.StruckDamage(n10);
          BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',700);
        end;
      end;
    end;
  end;    // for
end;
function TExplosionSpider2.AttackTarget: Boolean;
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        sub_4A65C4();
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
end;

procedure TExplosionSpider2.Run;
begin
  if (not m_boDeath) and (not m_boGhost) then begin
    if (GetTickCount - dw558) > 1 * 60 * 1000 then begin
      dw558:=GetTickcount();
      sub_4A65C4();
    end;
  end;
  inherited Run;
end;

{ TSpiderHouseMonster }

constructor TSpiderHouseMonster.Create;//004A61D0
begin
  inherited Create;
  m_nViewRange:=9;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:= GetTickCount;
  m_boStickMode:=True;
  BBList:=TList.Create;
end;

destructor TSpiderHouseMonster.Destroy;
begin
  FreeAndNil(BBList);
  inherited Destroy;
end;
procedure TSpiderHouseMonster.GenBB;//004A62B0
begin
  if BBList.Count < 15 then begin
    SendRefMsg(RM_HIT,self.m_btDirection,m_nCurrX,m_nCurrY,0,'');
    SendDelayMsg(Self,RM_ZEN_BEE,0,0,0,0,'',500);
  end;
    
end;
function TSpiderHouseMonster.Operate(ProcessMsg:pTProcessMessage):Boolean;
var
  BB:TBaseObject;
  n08,n0C:Integer;
begin
  if ProcessMsg.wIdent = RM_ZEN_BEE then begin
    n08:=m_nCurrX;
    n0C:=m_nCurrY + 1;
    if m_PEnvir.CanWalk(n08,n0C,True) then begin
      BB:=UserEngine.RegenMonsterByName(m_PEnvir.sMapName,n08,n0C,g_Config.sSpider);
      if BB <> nil then begin
        BB.SetTargetCreat(m_TargetCret);
        BBList.Add(BB);
      end;
    end;
  end;    
  Result:= inherited Operate(ProcessMsg);
end;

procedure TSpiderHouseMonster.Run;
var
  I: Integer;
  BB:TBaseObject;
begin
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        SearchTarget();
        if m_TargetCret <> nil then GenBB();
      end;
      for I := BBList.Count -1 downto 0 do begin
        BB:=TBaseObject(BBList.Items[I]);
        if BB.m_boDeath or (BB.m_boGhost) then BBList.Delete(I);
      end;    // for
    end;
  end;
  inherited Run;
end;


{ TExplosionDark }

constructor TExplosionDark.Create;    //칠흑수
begin
  inherited Create;
  m_nViewRange:=7;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=0;
  dw558:=GetTickcount();
end;

procedure TExplosionDark.sub_4A65C4;     //칠흑수
var
  WAbil:pTAbility;
  I,nPower,n10:Integer;
  BaseObject:TBaseObject;
begin
  m_WAbil.HP:=0;
  WAbil:=@m_WAbil;
  nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
    if (abs(BaseObject.m_nCurrX - m_nCurrX) <= 1) and (abs(BaseObject.m_nCurrY - m_nCurrY) <= 1) then begin
      if (not BaseObject.m_boDeath) and (IsProperTarget(BaseObject)) then begin
        n10:=0;
        Inc(n10,BaseObject.GetHitStruckDamage(Self,nPower div 2));
        Inc(n10,BaseObject.GetMagStruckDamage(Self,nPower div 2));
        if n10 > 0 then begin
          BaseObject.StruckDamage(n10);
          BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',700);
        end;
      end;
    end;
  end;    // for
end;
function TExplosionDark.AttackTarget: Boolean;      //칠흑수
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        sub_4A65C4();
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
end;

procedure TExplosionDark.Run;               //칠흑수
begin
   { if CanMove and
     (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      if ((GetTickCount - m_dwSearchEnemyTick) > 2000) or
         (((GetTickCount - m_dwSearchEnemyTick) > 500) and (m_TargetCret = nil)) then begin
        m_dwSearchEnemyTick:=GetTickCount();
        SearchTarget();
      end;
     end;   }
  if (not m_boDeath) and (not m_boGhost) then begin
    if (GetTickCount - dw558) > 1 * 60 * 1000 then begin
      dw558:=GetTickcount();
      sub_4A65C4();
    end;
  end;
  inherited Run;
end;




{ TExplosion2Dark }

constructor TExplosion2Dark.Create;    //강호
begin
  inherited Create;
  m_nViewRange:=7;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=0;
  dw558:=GetTickcount();
end;

procedure TExplosion2Dark.sub_4A65C4;     //강호
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   ix,iy,ixf , iyf ,ixt , iyt: integer;
   cret : TBaseObject;
   list : TList;
begin
  m_WAbil.HP:=0;
  with m_Master.m_WAbil do begin
    pwr:= GetAttackPower(LoWord(m_Master.m_WAbil.DC),SmallInt((HiWord(m_Master.m_WAbil.DC) - LoWord(m_Master.m_WAbil.DC))))
         + Random(HiWord(m_Master.m_WAbil.SC)) * m_btSlaveMakeLevel ;
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
end;
function TExplosion2Dark.AttackTarget: Boolean;      //강호
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        sub_4A65C4();
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
end;

procedure TExplosion2Dark.Run;              //강호
begin
  if (not m_boDeath) and (not m_boGhost) then begin
    if (GetTickCount - dw558) > 1 * 60 * 1000 then begin
      dw558:=GetTickcount();
      sub_4A65C4();
    end;
  end;
  inherited Run;
end;



{ TExplosionSpider }

constructor TExplosionSpider.Create;
//004A6538
begin
  inherited Create;
  m_nViewRange:=5;
  m_nRunTime:=250;
  m_dwSearchTime:=Random(1500) + 2500;
  m_dwSearchTick:=0;
  dw558:=GetTickcount();
end;

procedure TExplosionSpider.sub_4A65C4;
var
  WAbil:pTAbility;
  I,nPower,n10:Integer;
  BaseObject:TBaseObject;
begin
  m_WAbil.HP:=0;
  WAbil:=@m_WAbil;
  nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
    if (abs(BaseObject.m_nCurrX - m_nCurrX) <= 1) and (abs(BaseObject.m_nCurrY - m_nCurrY) <= 1) then begin
       if (not BaseObject.m_boDeath) and (IsProperTarget(BaseObject)) then begin
        n10:=0;
        Inc(n10,BaseObject.GetHitStruckDamage(Self,nPower div 2));
        Inc(n10,BaseObject.GetMagStruckDamage(Self,nPower div 2));
        if n10 > 0 then begin
          BaseObject.StruckDamage(n10);
          BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',700);
        end;
      end;
    end;
  end;    // for
end;
function TExplosionSpider.AttackTarget: Boolean;
var
  btDir:Byte;
begin
  Result:=False;
  if m_TargetCret <> nil then begin
    if GetAttackDir(m_TargetCret,btDir) then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        m_dwTargetFocusTick:=GetTickCount();
        sub_4A65C4();
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
end;

procedure TExplosionSpider.Run;
begin
  if (not m_boDeath) and (not m_boGhost) then begin
    if (GetTickCount - dw558) > 1 * 60 * 1000 then begin
      dw558:=GetTickcount();
      sub_4A65C4();
    end;
  end;
  inherited Run;
end;

{ TGuardUnit }
procedure TGuardUnit.Struck(hiter: TBaseObject);
begin
  inherited Struck (hiter);
  if m_Castle <> nil then begin
    BoCrimeforCastle:=True;     //BoCrimeforCastle
    CrimeforCastleTime:=GetTickCount();    //CrimeforCastleTime
  end;

end;

function TGuardUnit.IsProperTarget(BaseObject: TBaseObject): boolean; //004A6890
begin
  Result:=False;
  if not (BaseObject.m_btRaceServer = RC_PET) then begin
  if not (BaseObject.m_boPenetrateMode) then begin
  if m_Castle <> nil then begin
    if m_LastHiter = BaseObject then Result:=True;
    if BaseObject.BoCrimeforCastle then begin       //BoCrimeforCastle
      if (GetTickCount - BaseObject.CrimeforCastleTime) < 2 * 60 * 1000 then begin
        Result:=True;
      end else BaseObject.BoCrimeforCastle:=False;
      if BaseObject.m_Castle <> nil then begin
        BaseObject.BoCrimeforCastle:=False;
        Result:=False;
      end;
    end; //004A690D
    if TUserCastle(m_Castle).m_boUnderWar then Result:=True;  //기본 공격 모드 (공성전에만 적을 공격하는 모드)
    if TUserCastle(m_Castle).m_MasterGuild <> nil then begin
      if BaseObject.m_Master = nil then begin
        if (TUserCastle(m_Castle).m_MasterGuild = BaseObject.m_MyGuild) or
           (TUserCastle(m_Castle).m_MasterGuild.IsAllyGuild(TGuild(BaseObject.m_MyGuild))) then begin
           if m_LastHiter <> BaseObject then Result:=False;
         end;
      end else begin//004A6988
        if (TUserCastle(m_Castle).m_MasterGuild = BaseObject.m_Master.m_MyGuild) or
           (TUserCastle(m_Castle).m_MasterGuild.IsAllyGuild(TGuild(BaseObject.m_Master.m_MyGuild))) then begin
           if (m_LastHiter <> BaseObject.m_Master) and (m_LastHiter <> BaseObject) then Result:=False;
         end;
      end;        
    end; //004A69EF
    if BaseObject.m_boAdminMode or
       BaseObject.m_boPenetrateMode or
       BaseObject.m_boStoneMode or
       ((BaseObject.m_btRaceServer >= RC_NPC{10}) and
       (BaseObject.m_btRaceServer < RC_ANIMAL{50})) or
       (BaseObject = Self) or (BaseObject.m_Castle = Self.m_Castle) then begin
      Result:=False;
    end;     //운영자, 석상,..
    exit;
  end; //004A6A41
  if m_LastHiter = BaseObject then Result:=True;   //자신을 때린놈
  if (BaseObject.m_TargetCret <> nil) and (BaseObject.m_TargetCret.m_btRaceServer = 112) then   //같은 궁병을 공격하는 놈을 공격
    Result:=True;
  if BaseObject.PKLevel >= 2 then Result:=True;  //궁수는 빨갱이를 공격한다.
  if BaseObject.m_boAdminMode or
     BaseObject.m_boPenetrateMode or
     BaseObject.m_boStoneMode or
     (BaseObject = Self) then Result:=False;   //운영자, 석상,...
  end;
  end;
end;



{ TArcherGuard }

constructor TArcherGuard.Create;//004A6AB4
begin
  inherited Create;
  m_nViewRange   := 12;
  m_boWantRefMsg := True;
  m_Castle       := nil;
  m_nDirection   := -1;
  BoDontMove     := True;
end;

destructor TArcherGuard.Destroy;
begin

  inherited;
end;

procedure TArcherGuard.sub_4A6B30(TargeTBaseObject:TBaseObject);//004A6B30
var
  nPower:Integer;
  WAbil:pTAbility;
begin
  m_btDirection:=GetNextDirection(m_nCurrX,m_nCurrY,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY);
  WAbil:=@m_WAbil;
  nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
  if nPower > 0 then
    nPower:=TargeTBaseObject.GetHitStruckDamage(Self,nPower);
  if nPower > 0 then begin
    TargeTBaseObject.SetLastHiter(Self);
    TargeTBaseObject.m_ExpHitter:=nil;        //경험치를
    TargeTBaseObject.StruckDamage(nPower);
    TargeTBaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,nPower,TargeTBaseObject.m_WAbil.HP,TargeTBaseObject.m_WAbil.MaxHP,Integer(Self),'',
                                _MAX(abs(m_nCurrX - TargeTBaseObject.m_nCurrX),abs(m_nCurrY - TargeTBaseObject.m_nCurrY)) * 50 + 600);
  end;
  SendRefMsg(RM_FLYAXE,m_btDirection,m_nCurrX,m_nCurrY,Integer(TargeTBaseObject),'');
end;
procedure TArcherGuard.Run;//004A6C64
var
  I                :Integer;
  nAbs             :Integer;
  nRage            :Integer;
  BaseObject       :TBaseObject;
  TargetBaseObject :TBaseObject;
begin
  nRage            := 9999;
  TargetBaseObject := nil;
  if CanMove then begin
    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) then begin
      m_dwWalkTick:=GetCurrentTime;
      for I := 0 to m_VisibleActors.Count - 1 do begin
        BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
        if BaseObject.m_boDeath then Continue;
        if IsProperTarget(BaseObject) then begin
          nAbs:=abs(m_nCurrX - BaseObject.m_nCurrX) + abs(m_nCurrY - BaseObject.m_nCurrY);
          if nAbs < nRage then begin
            nRage:=nAbs;
            TargetBaseObject:=BaseObject;
          end;
        end;
      end;    
      if TargetBaseObject <> nil then begin
        SetTargetCreat(TargetBaseObject);
      end else begin
        DelTargetCreat();
      end;
    end;
    if m_TargetCret <> nil then begin
      if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
        m_dwHitTick:=GetCurrentTime;
        sub_4A6B30(m_TargetCret);
      end;
    end else begin
      if (m_nDirection >= 0) and (m_btDirection <> m_nDirection) then begin
        TurnTo(m_nDirection);
      end;        
    end;
      
  end;
  inherited Run;
end;

{ TArcherPolice }

constructor TArcherPolice.Create;//004A6E14
begin
  inherited;
  m_btRaceServer:=20;            //평화모드로 공격이 안되게
end;

destructor TArcherPolice.Destroy;
begin

  inherited;
end;


{ TCastleDoor }
constructor TCastleDoor.Create;//004A6E60
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  m_boOpened:=False;       //닫힌 상태
  m_btAntiPoison:=200;
end;

destructor TCastleDoor.Destroy;
begin

  inherited;
end;
procedure TCastleDoor.SetMapXYFlag(nFlag:Integer);//004A6FB4    //사북성문인 경우에만 사용
var
  bomove:Boolean;
begin
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,True);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,True);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 2,True);
  if nFlag = 1 then bomove:=False    //bomove
  else bomove:=True;
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 2,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY + 1,bomove);
  if nFlag = 0 then begin
    m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 2,False);
  end;
    
end;
procedure TCastleDoor.Open;//004A71B4   OpenDoor
begin
  if m_boDeath then exit;
  m_btDirection:=7;      //안보이는 상태
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=True;
  m_boStoneMode:=True;         //맞지 않음
  SetMapXYFlag(0);              //이동가능하게       dsOpen
  HoldPlace:=False;                //자리차지 안함
end;

procedure TCastleDoor.Close;//004A7220      CloseDoor
begin
  if m_boDeath then exit;
  m_btDirection:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
  if (m_btDirection - 3) >= 0 then m_btDirection:=0;
  SendRefMsg(RM_DIGDOWN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=False;
  m_boStoneMode:=False;             //맞음
  SetMapXYFlag(1);                  //이동 못하게   dsClose
  HoldPlace:=True;                       //자리차지 함
end;

procedure TCastleDoor.Die;
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';      //사북성문
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
  SetMapXYFlag(2);         //이동가능하게      dsBroken
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
    end;
  end;
end;

procedure TCastleDoor.Run;//004A7304
var
  newdir:Integer;
begin
  if m_boDeath and (m_Castle <> nil) then
    m_dwDeathTick:=GetTickCount()           //없어지지 않는다.
  else m_nHealthTick:=0;                //체력이 다시 차지 않는다.
  if not m_boOpened then begin
    newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
    if (m_btDirection <> newdir) and (newdir < 3) then begin            //방향 0,1,2
      m_btDirection:=newdir;
      SendRefMsg(RM_TURN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
    end;
  end;
  inherited Run;
end;

procedure TCastleDoor.RefStatus;//004A6F24 //새로 고쳐짐
var
  newdir:Integer;
begin
  if not m_boOpened then begin
    newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
    if (newdir - 3) >= 0 then newdir:=0;
    m_btDirection:=newdir;
    Broken:= False;
    SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  end;
end;

procedure TCastleDoor.Initialize; //0x004A6ECC
begin
  m_btDirection:=0;       //초기상태
  inherited Initialize;
  if m_WAbil.HP > 0 then begin
    if m_boOpened then SetMapXYFlag(0)
    else SetMapXYFlag(1);
  end else
    SetMapXYFlag(2);
end;


{ TNammanCastleDoor }
constructor TNammanCastleDoor.Create;//004A6E60
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  m_boOpened:=False;       //닫힌 상태
  m_btAntiPoison:=200;
end;

destructor TNammanCastleDoor.Destroy;
begin

  inherited;
end;
procedure TNammanCastleDoor.SetMapXYFlag(nFlag:Integer);//004A6FB4    //사북성문인 경우에만 사용
var
  bomove:Boolean;
begin
  if nFlag = 1 then bomove:=False    //이동못함
  else bomove:=True;
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 2,bomove);
end;
procedure TNammanCastleDoor.Open;//004A71B4   OpenDoor
begin
  if m_boDeath then exit;
  m_btDirection:=5;      //안보이는 상태
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=True;
  m_boStoneMode:=True;         //맞지 않음
  SetMapXYFlag(0);              //이동가능하게       dsOpen
  HoldPlace:=False;                //자리차지 안함
end;

procedure TNammanCastleDoor.Close;//004A7220      CloseDoor
begin
  if m_boDeath then exit;
  {m_btDirection:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
  if (m_btDirection - 3) >= 0 then} m_btDirection:=0;
  SendRefMsg(RM_DIGDOWN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=False;
  m_boStoneMode:=False;             //맞음
  SetMapXYFlag(1);                  //이동 못하게   dsClose
  HoldPlace:=True;                       //자리차지 함
end;

procedure TNammanCastleDoor.Die;
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';      //남만성문
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
  SetMapXYFlag(2);         //이동가능하게      dsBroken
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
    end;
  end;
end;

procedure TNammanCastleDoor.Run;//004A7304
var
  newdir:Integer;
begin
  if m_boDeath and (m_Castle <> nil) then
    m_dwDeathTick:=GetTickCount()           //없어지지 않는다.
  else m_nHealthTick:=0;                //체력이 다시 차지 않는다.
  if not m_boOpened then begin
    //newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
   // if (m_btDirection <> newdir) and (newdir < 3) then begin            //방향 0,1,2
      newdir := 0;
      m_btDirection:=newdir;
      SendRefMsg(RM_TURN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
   // end;
  end;
  inherited Run;
end;

procedure TNammanCastleDoor.RefStatus;//004A6F24 //새로 고쳐짐
var
  newdir:Integer;
begin
  if not m_boOpened then begin
   { newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
    if (newdir - 3) >= 0 then }newdir:=0;
    m_btDirection:=newdir;
    Broken:= False;
    SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  end;
end;

procedure TNammanCastleDoor.Initialize; //0x004A6ECC
begin
  m_btDirection:=0;       //초기상태
  inherited Initialize;
  if m_WAbil.HP > 0 then begin
    if m_boOpened then SetMapXYFlag(0)
    else SetMapXYFlag(1);
  end else
    SetMapXYFlag(2);
end;


{ TNammanCastleDoor2 }
constructor TNammanCastleDoor2.Create;//004A6E60
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  m_boOpened:=False;       //닫힌 상태
  m_btAntiPoison:=200;
end;

destructor TNammanCastleDoor2.Destroy;
begin

  inherited;
end;
procedure TNammanCastleDoor2.SetMapXYFlag(nFlag:Integer);//004A6FB4    //사북성문인 경우에만 사용
var
  bomove:Boolean;
begin
  if nFlag = 1 then bomove:=False    //이동못함
  else bomove:=True;
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY + 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY,bomove);
end;
procedure TNammanCastleDoor2.Open;//004A71B4   OpenDoor
begin
  if m_boDeath then exit;
  m_btDirection:=5;      //안보이는 상태
  SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=True;
  m_boStoneMode:=True;         //맞지 않음
  SetMapXYFlag(0);              //이동가능하게       dsOpen
  HoldPlace:=False;                //자리차지 안함
end;

procedure TNammanCastleDoor2.Close;//004A7220      CloseDoor
begin
  if m_boDeath then exit;
 { m_btDirection:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
  if (m_btDirection - 3) >= 0 then }m_btDirection:=0;
  SendRefMsg(RM_DIGDOWN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  m_boOpened:=False;
  m_boStoneMode:=False;             //맞음
  SetMapXYFlag(1);                  //이동 못하게   dsClose
  HoldPlace:=True;                       //자리차지 함
end;

procedure TNammanCastleDoor2.Die;
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';      //남만성문
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
  SetMapXYFlag(2);         //이동가능하게      dsBroken
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
    end;
  end;
end;

procedure TNammanCastleDoor2.Run;//004A7304
var
  newdir:Integer;
begin
  if m_boDeath and (m_Castle <> nil) then
    m_dwDeathTick:=GetTickCount()           //없어지지 않는다.
  else m_nHealthTick:=0;                   //체력이 다시 차지 않는다.
  if not m_boOpened then begin      //닫혀있을때
   // newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
   // if (m_btDirection <> newdir) and (newdir < 3) then begin            //방향 0,1,2
      newdir := 0;
      m_btDirection:=newdir;
      SendRefMsg(RM_TURN,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  //  end;
  end;
  inherited Run;
end;

procedure TNammanCastleDoor2.RefStatus;//004A6F24 //새로 고쳐짐
var
  newdir:Integer;
begin
  if not m_boOpened then begin
    {newdir:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
    if (newdir - 3) >= 0 then }newdir:=0;
    m_btDirection:=newdir;
    Broken:= False;
    SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
  end;
end;

procedure TNammanCastleDoor2.Initialize; //0x004A6ECC
begin
  m_btDirection:=0;       //초기상태
  inherited Initialize;
  if m_WAbil.HP > 0 then begin
    if m_boOpened then SetMapXYFlag(0)
    else SetMapXYFlag(1);
  end else
    SetMapXYFlag(2);
end;

{ TWallStructure }

constructor TWallStructure.Create;//004A73D4
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  boSetMapFlaged:=False;
  m_btAntiPoison:=200;
end;

destructor TWallStructure.Destroy;
begin

  inherited;
end;

procedure TWallStructure.Initialize;//004A7440
begin
  m_btDirection:=0;        //초기상태
  inherited Initialize;
end;

procedure TWallStructure.RefStatus;//004A745C      //새로 고쳐짐
var
  n08:Integer;
begin
  if m_WAbil.HP > 0 then begin
    n08:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
  end else begin
    n08:=4;
  end;
  if n08 >= 5 then n08:=0;
  m_btDirection:=n08;
  Broken:= False;
  SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;
procedure TWallStructure.Die;//004A74F8
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
end;

procedure TWallStructure.Run;//004A7518
var
  n08:Integer;
begin
  if m_boDeath then begin
    m_dwDeathTick:=GetTickCount();    //없어지지 않는다.
    if boSetMapFlaged then begin
      m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,True);        //이동 가능하게
      boSetMapFlaged:=False;
    end;      
  end else begin
    m_nHealthTick:=0;     //체력이 다시 차지 않는다.
    if not boSetMapFlaged then begin
      m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,False);     //이동 못하게
      boSetMapFlaged:=True;      
    end;
  end;
  if m_WAbil.HP > 0 then begin
    n08:=3 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 3.0);
  end else begin
    n08:=4;
  end;
  if (m_btDirection <> n08) and (n08 < 5) then begin     //방향 0,1,2,3,4
    m_btDirection:=n08;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');     //부서지는 애니메이션
  end;
  inherited Run;
end;

{ TSabukStructure }

constructor TSabukStructure.Create;//004A73D4
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  boSetMapFlaged:=False;
  m_btAntiPoison:=200;
end;

destructor TSabukStructure.Destroy;
begin
  inherited;
end;

procedure TSabukStructure.Initialize;//004A7440
begin
  m_btDirection:=0;        //초기상태
  inherited Initialize;
end;

procedure TSabukStructure.RefStatus;//004A745C      //새로 고쳐짐
var
  n08:Integer;
begin
  if m_WAbil.HP > 0 then begin
    n08:=2 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 2.0);
  end else begin
    n08:=3;
  end;
  if n08 >= 4 then n08:=0;
  m_btDirection:=n08;
  Broken:= False;
  SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TSabukStructure.Die;//004A74F8
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';      //성벽 
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
    end;
  end;
end;

procedure TSabukStructure.SetMapXYFlag(nFlag:Integer);//004A6FB4    //사북성문인 경우에만 사용
var
  bomove:Boolean;
  x, y, z, k, g, h:Integer;
begin
  if nFlag = 1 then bomove:=False    //이동못함
  else bomove:=True;
  for x := -4 to 2 do begin
    for y := -7 to -2 do begin
      m_PEnvir.SetMapXYFlag(m_nCurrX + x,m_nCurrY + y,bomove);
    end;
  end;
  for z := -4 to -1 do begin    //x
    for k := -1 to 1 do begin   //y
      m_PEnvir.SetMapXYFlag(m_nCurrX + z,m_nCurrY + k,bomove);
    end;
  end;
  for g := -1 to 2 do begin    //x
    for h := -10 to -8 do begin   //y
      m_PEnvir.SetMapXYFlag(m_nCurrX + g,m_nCurrY + h,bomove);
    end;
  end;
  m_PEnvir.SetMapXYFlag(m_nCurrX - 6,m_nCurrY - 5,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 6,m_nCurrY - 4,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 6,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 5,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 4,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 3,m_nCurrY - 8,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 2,m_nCurrY - 8,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 2,m_nCurrY - 9,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 4,m_nCurrY + 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 4,m_nCurrY + 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 4,m_nCurrY + 4,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 3,m_nCurrY + 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 3,m_nCurrY + 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 2,m_nCurrY + 2,bomove);

  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,bomove);

  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 11,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 11,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 12,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 11,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 12,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 13,bomove);

  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 6,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 5,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 4,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY - 5,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 4,bomove);
  if nFlag = 0 then begin
    m_PEnvir.SetMapXYFlag(m_nCurrX - 5,m_nCurrY,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 7,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 8,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 9,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 10,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 11,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 12,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 13,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 6,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY - 5,False);
  end;
end;

procedure TSabukStructure.Run;//004A7518
var
  n08:Integer;
begin
  if m_boDeath then begin
    m_dwDeathTick:=GetTickCount();    //없어지지 않는다.
    if boSetMapFlaged then begin
      SetMapXYFlag(0);                  //이동 가능하게
      boSetMapFlaged:=False;
    end;      
  end else begin
    m_nHealthTick:=0;     //체력이 다시 차지 않는다.
    if not boSetMapFlaged then begin
      SetMapXYFlag(1);      //이동 못하게
      boSetMapFlaged:=True;
    end;
  end;
  if m_WAbil.HP > 0 then begin
    n08:=2 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 2.0);
  end else begin
    n08:=3;
  end;
  if (m_btDirection <> n08) and (n08 < 4) then begin     //방향 0,1,2,3,4
    m_btDirection:=n08;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');     //부서지는 애니메이션
  end;
  inherited Run;
end;

{ TNammanStructure }

constructor TNammanStructure.Create;//004A73D4
begin
  inherited Create;
  m_boAnimal:=False;
  m_boStickMode:=True;
  boSetMapFlaged:=False;
  m_btAntiPoison:=200;
end;

destructor TNammanStructure.Destroy;
begin
  inherited;
end;

procedure TNammanStructure.Initialize;//004A7440
begin
  m_btDirection:=0;        //초기상태
  inherited Initialize;
end;

procedure TNammanStructure.RefStatus;//004A745C      //새로 고쳐짐
var
  n08:Integer;
begin
  if m_WAbil.HP > 0 then begin
    n08:=2 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 2.0);
  end else begin
    n08:=3;
  end;
  if n08 >= 4 then n08:=0;
  m_btDirection:=n08;
  Broken:= False;
  SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

procedure TNammanStructure.Die;//004A74F8
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';      //성벽 
begin
  inherited Die;
  BrokenTime:=GetTickCount();
  Broken:= True;
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
    end;
  end;
end;

procedure TNammanStructure.SetMapXYFlag(nFlag:Integer);//004A6FB4    //사북성문인 경우에만 사용
var
  bomove:Boolean;
begin
  if nFlag = 1 then bomove:=False    //이동못함
  else bomove:=True;
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 5,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX,m_nCurrY - 4,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY + 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 1,m_nCurrY - 3,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY + 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY + 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 2,m_nCurrY - 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY + 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY + 2,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 3,m_nCurrY - 1,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY,bomove);
  m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY + 1,bomove);
  if nFlag = 0 then begin
    m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 2,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX - 1,m_nCurrY - 5,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY,False);
    m_PEnvir.SetMapXYFlag(m_nCurrX + 4,m_nCurrY + 1,False);
  end;
end;

procedure TNammanStructure.Run;//004A7518
var
  n08:Integer;
begin
  if m_boDeath then begin
    m_dwDeathTick:=GetTickCount();    //없어지지 않는다.
    if boSetMapFlaged then begin
      SetMapXYFlag(0);                  //이동 가능하게
      boSetMapFlaged:=False;
    end;      
  end else begin
    m_nHealthTick:=0;     //체력이 다시 차지 않는다.
    if not boSetMapFlaged then begin
      SetMapXYFlag(1);      //이동 못하게
      boSetMapFlaged:=True;
    end;
  end;
  if m_WAbil.HP > 0 then begin
    n08:=2 - ROUND(m_WAbil.HP/m_WAbil.MaxHP * 2.0);
  end else begin
    n08:=3;
  end;
  if (m_btDirection <> n08) and (n08 < 4) then begin     //방향 0,1,2,3,4
    m_btDirection:=n08;
    SendRefMsg(RM_DIGUP,m_btDirection,m_nCurrX,m_nCurrY,0,'');     //부서지는 애니메이션
  end;
  inherited Run;
end;

{ TWallFlag }
constructor TWallFlag.Create;//004A73D4
begin
  inherited Create;
  m_boAnimal := False;
  m_boWarChack := False;
  Broken:= False;
  m_boStickMode := True;
  boSetMapFlaged := False;
  sLastHiterGuild := '';
end;

destructor TWallFlag.Destroy;
begin
  inherited;
end;

procedure TWallFlag.Initialize;//004A7440
begin
  m_btDirection := 0;        //초기상태
  sLastHiterGuild := '';
  inherited Initialize;
end;

procedure TWallFlag.Die;//004A74F8
var
  s14: String;
ResourceString
  sLastFlagHiter = '%s님께서 %s를(을) 파괴 하였습니다.';    //점령깃발
  sLastFlagGuild = '%s문파에서 %s를(을) 파괴 하였습니다.';    //점령깃발
begin
  inherited Die;
  BrokenTime := GetTickCount();
  Broken:= True;
  m_boWarChack := True;
  if TUserCastle(m_Castle).m_boUnderWar then begin
    if m_ExpHitter <> nil then begin
      s14:=format(sLastFlagHiter,[m_ExpHitter.m_sCharName, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
      TUserCastle(m_Castle).GetCastle(TGuild(m_ExpHitter.m_MyGuild));      //점령 성공
    end else begin
      s14:=format(sLastFlagGuild,[sLastHiterGuild, m_sCharName]);
      UserEngine.SendBroadCastMsgExt(s14,t_System);
      UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
      MainOutMessage(s14);
      TUserCastle(m_Castle).GetCastle(g_GuildManager.FindGuild(sLastHiterGuild));
    end;
  end;
end;

procedure TWallFlag.Run;//004A7518
var
  Dir :Integer;
begin
  if m_boDeath then begin
    m_dwDeathTick := GetTickCount();    //없어지지 않는다.
    if boSetMapFlaged then begin
      m_PEnvir.SetMapXYFlag(m_nCurrX, m_nCurrY, True);        //이동 가능하게
      boSetMapFlaged := False;
    end;      
  end else begin
    //m_nHealthTick := 0;     //체력이 다시 차지 않는다.
    if not boSetMapFlaged then begin
      m_PEnvir.SetMapXYFlag(m_nCurrX, m_nCurrY, False);     //이동 못하게
      boSetMapFlaged := True;
    end;
  end;
  inherited Run;
end;

procedure TWallFlag.RefStatus;//004A745C      //새로 고쳐짐
begin
  sLastHiterGuild := '';
  m_btDirection:=0;
  m_boWarChack := False;
  Broken:= False;
  SendRefMsg(RM_ALIVE,m_btDirection,m_nCurrX,m_nCurrY,0,'');
end;

function TWallFlag.Operate(ProcessMsg:pTProcessMessage):Boolean;
begin
   case ProcessMsg.wIdent of
      RM_STRUCK:
         begin
            if m_ExpHitter <> nil then
            sLastHiterGuild := TGuild(m_ExpHitter.m_MyGuild).sGuildName;
         end;
      RM_10101:
         begin
            if m_ExpHitter <> nil then
            sLastHiterGuild := TGuild(m_ExpHitter.m_MyGuild).sGuildName;
         end;
   end;

   inherited Operate (ProcessMsg);
end;

{ 지옥문지기 }

constructor THellGuard.Create;
begin
  inherited;
  m_nLight := 3;
  m_dwSearchTime := 600;
  m_boAnimal:=False;
  m_nViewRange := 7;
  m_dwThinkTick:=GetTickCount();
end;

destructor THellGuard.Destroy;
begin
  inherited;
end;

procedure THellGuard.RangeAttack(Target:TBaseObject);
var
  nSX,nSY,nTX,nTY,nPwr:Integer;
  I:Integer;
  magpwr:Integer;
  TargetNum:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
begin
  Target := m_TargetCret;
  SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(Target),'');

  for i:=0 to Target.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(Target.m_VisibleActors[i]).BaseObject);
    if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 7) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 7) then begin

      if BaseObject <> nil then begin
        if IsProperTarget (BaseObject) then begin
          WAbil:=@m_WAbil;
          magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
          BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 800);
          SendRefMsg(RM_10205,0,BaseObject.m_nCurrX,BaseObject.m_nCurrY,00,'0');
        end;
      end;
    end;
  end;
end;

procedure THellGuard.RangeAttack2(Target:TBaseObject);
var
   i, k,  mx, my, dam, armor: integer;
   BaseObjectList   :TList;
   BaseObject: TBaseObject;
   pwr: integer;
   WAbil:pTAbility;
   push:integer;
   levelgap:integer;
   nDir:integer;
begin

   if Target = nil then exit;
   m_dwHitTick:=GetCurrentTime;
   nDir := GetNextDirection (m_nCurrX, m_nCurrY, Target.m_nCurrX, Target.m_nCurrY);
   SendRefMsg (RM_LIGHTING, nDir, m_nCurrX, m_nCurrY, Integer(self), '');
   WAbil:=@m_WAbil;
   pwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
   if pwr <= 0 then exit;

   BaseObjectList := TList.Create;
   GetMapBaseObjects(m_PEnvir,m_nCurrX,m_nCurrY,1,BaseObjectList);
   for I := 0 to BaseObjectList.Count - 1 do begin
     BaseObject:=TBaseObject(BaseObjectList.Items[i]);
     if IsProperTarget(BaseObject) then begin
       levelgap := 500 - BaseObject.m_Abil.Level;
       if (Random(20) < 4+levelgap) then begin
         SetTargetCreat(BaseObject);
         push := 3 + Random(3);
         nDir:= GetNextDirection (m_nCurrX, m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
         BaseObject.CharPushed (nDir, push);
       end;
     end;
   end;
   FreeAndNil(BaseObjectList);
end;


procedure THellGuard.Run;
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
      m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);

      if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist <= 1) then begin
        m_dwHitTick:=GetCurrentTime;
        if Random(5) = 0 then begin
          RangeAttack2(m_TargetCret);
        end else begin
          RangeAttack(m_TargetCret);
        end;
      end else if (GetCurrentTime - m_dwHitTick > GetHitSpeed) and (dist > 1) then begin
        m_dwHitTick:=GetCurrentTime;
        RangeAttack(m_TargetCret);
      end;
    end;
  end;
  inherited;
end;


constructor THellMonster2.Create;//004AA4B4
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

destructor THellMonster2.Destroy;
begin
  inherited;
end;


procedure THellMonster2.RedCircle(nDir:Integer);
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
  SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
  if IsProperTarget (m_TargetCret) then begin
    if Random(50) >= m_TargetCret.m_nAntiMagic then begin
      WAbil:=@m_WAbil;
      magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
      m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);
    end;
  end;
end;

procedure THellMonster2.Run;//004AA604
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
        (Integer(GetTickCount - m_dwHitTick) > 1500) and
        (not MassAttackMode) then begin
      nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      m_dwHitTick:=GetCurrentTime;
      if (Random(4) = 0) then begin
      AttackTarget();
        end else begin
      RedCircle(nAttackDir);
        end;
      end;
    end;

    {Actual magic attack if hes hit by magic}
    if (Integer(GetTickCount - m_dwHitTick) > 1500) and (m_TargetCret <> nil) then begin
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
  inherited;
end;

function THellMonster2.AttackTarget():Boolean; //004A8F34
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
          SendDelayMsg(Self,RM_DELAYMAGIC,nPower,MakeLong(BaseObject.m_nCurrX,BaseObject.m_nCurrY),1,Integer(BaseObject),'',2000);
        end;
      end;
    end;
    Result:=True;
  end;
end;

constructor THellMonster3.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 500;
  dw558:=GetTickCount();
  bo2BF:=True;
  n560:=0;
  bo55C:=False;
  bo55D:=False;
  nextx:=0;
  nexty:=0;
  boMoving:=FALSE;
  MassAttackMode:=FALSE;
  MassAttackCount:=0;
  NextTarget:=nil;
  m_boApproach:=FALSE;//stops mtk from going towards players
  m_dwSearchTime:=Random(1500) + 1500;
end;

function THellMonster3.Operate(ProcessMsg:pTProcessMessage):boolean;
begin
  if (ProcessMsg.wIdent = RM_MAGSTRUCK) and (not MassAttackMode) then begin
    //they used magic now pwn them with redcircle!!!!!!
    MassAttackMode:=True;
    MassAttackCount:=0;
  end;
  Result := inherited Operate(ProcessMsg);
end;

destructor THellMonster3.Destroy;
begin
  inherited;
end;

function THellMonster3.AttackTarget(nDir:Integer):Boolean;
var
  I:Integer;
  magpwr:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
begin
   nDir:= GetNextDirection (m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
   m_btDirection:=nDir;
   SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
   if IsProperTarget (m_TargetCret) then begin
     if Random(50) >= m_TargetCret.m_nAntiMagic then begin
        WAbil:=@m_WAbil;
        magpwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
        m_TargetCret.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 1000);
        m_TargetCret.SendDelayRefMsg(RM_10205,0,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY,42,'0',600);      //인면귀 멸천화 이팩트
     end;
   end;
end;

procedure THellMonster3.MagicAttack;
var
  I:Integer;
  magpwr:Integer;
  WAbil:pTAbility;
  BaseObject:TBaseObject;
  Target:TBaseObject;
begin
 { get first target }
 if NextTarget <> nil then begin
  Target:=NextTarget;
  NextTarget:=nil;
 end else begin
  Target := m_TargetCret;
 end;
 {do spell effect}
// SendRefMsg(RM_LIGHTING,m_btDirection,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
    SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(Target),'');
    m_Abil.HP:=m_Abil.MaxHP;
    m_WAbil.HP:=m_Abil.MaxHP;
    ReAlive();
    SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);

  end;


procedure THellMonster3.Run;
var
nAttackDir:integer;
n8,nC,n10:Integer;
begin
  if CanMove then begin

  if (m_TargetCret <> nil) and (sub_4C3538 >= 5) then begin
          m_TargetCret.GetBackPosition(n8,nC);
    if m_PEnvir.CanWalk(n8,nC,False) then begin
        SpaceMove(m_PEnvir.sMapName,n8,nC,0);
        SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
        exit;
      end;
      MapRandomMove(m_PEnvir.sMapName,0);
      SendRefMsg(RM_SPACEMOVE_FIRE,0,0,0,0,'');
      exit;
    end;

    if m_TargetCret <> nil then begin
      if (Integer(GetTickCount - m_dwSpellTick) > 2500) then begin
        m_dwSpellTick:=GetTickCount();
      if (Random(50) = 0) then begin     //인면귀 체력 체우는거.
        MagicAttack();
        m_Abil.HP:=m_Abil.MaxHP;
        m_WAbil.HP:=m_Abil.MaxHP;
        ReAlive();
        end else begin
        AttackTarget(nAttackDir);
        end;
      end;
    end;

    if ((GetTickCount - m_dwSearchEnemyTick) > 8000) or
       (((GetTickCount - m_dwSearchEnemyTick) > 1000) and (m_TargetCret = nil)) then begin
      m_dwSearchEnemyTick:=GetTickCount();
      SearchTarget();
    end;

    if (GetCurrentTime - m_dwWalkTick > GetWalkSpeed) and (m_TargetCret <> nil) then begin
      if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 8) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 8) then begin
        if (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 6) and (abs(m_nCurrX - m_TargetCret.m_nCurrX) <= 6) then begin
          if Random(5) = 0 then begin
            GetBackPosition(m_nTargetX,m_nTargetY);
          end;
        end else begin
          GetBackPosition(m_nTargetX,m_nTargetY);
        end;
      end;
    end;
  end;
  inherited;
end;

constructor THellMonster.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor THellMonster.Destroy;
begin

  inherited;
end;


procedure THellMonster.sub_4A65C4;
var
  WAbil:pTAbility;
  I,nPower,n10:Integer;
  BaseObject:TBaseObject;
begin
  m_WAbil.HP:=0;
  WAbil:=@m_WAbil;
  nPower:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) +1) + LoWord(WAbil.DC));
  for I := 0 to m_VisibleActors.Count - 1 do begin
    BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
  //  if BaseObject.m_boDeath then Continue;
    if IsProperTarget(BaseObject) then begin
      if (abs(m_nCurrX - BaseObject.m_nCurrX) <= 1) and (abs(m_nCurrY - BaseObject.m_nCurrY) <= 1) then begin
        n10:=0;
        Inc(n10,BaseObject.GetHitStruckDamage(Self,nPower div 2));
        Inc(n10,BaseObject.GetMagStruckDamage(Self,nPower div 2));
        if n10 > 0 then begin
          BaseObject.StruckDamage(n10);
          BaseObject.SendDelayMsg(TBaseObject(RM_STRUCK),RM_10101,n10,BaseObject.m_WAbil.HP,BaseObject.m_WAbil.MaxHP,Integer(Self),'',700);
        end;
      end;
    end;
  end;    // for
end;

procedure THellMonster.ThrustAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.DC) - LoWord(WAbil.DC)) + 1) + LoWord(WAbil.DC));
    SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
    MagPassThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True);
    if (Random(25 + m_TargetCret.m_btAntiPoison) = 0) then begin
        m_TargetCret.MakePosion(POISON_STONE,5,0);
    end;
 end;
end;


procedure THellMonster.Run;
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
              ThrustAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;

{격빙야차}
constructor TIceHellMonster.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TIceHellMonster.Destroy;
begin

  inherited;
end;

procedure TIceHellMonster.ThrustAttack(nDir: Integer);
var
  WAbil:pTAbility;
  nSX,nSY,nTX,nTY,nPwr:Integer;

begin
  m_btDirection:=nDir;
  if m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,1,nSX,nSY) then begin
    m_PEnvir.GetNextPosition(m_nCurrX,m_nCurrY,nDir,3,nTX,nTY);
    WAbil:=@m_WAbil;
    nPwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
    SendRefMsg(RM_LIGHTING,1,m_nCurrX,m_nCurrY,Integer(m_TargetCret),'');
    MagPassThroughMagic(nSX,nSY,nTX,nTY,nDir,nPwr,True);
    if (Random(15+ + m_TargetCret.m_btAntiPoison) = 0) then begin
        m_TargetCret.MakePosion(POISON_SLOWDOWN,10,0);
  end;
 end;
end;


procedure TIceHellMonster.Run;
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
        distx := abs(m_nCurrX - m_TargetCret.m_nCurrX);
        disty := abs(m_nCurrY - m_TargetCret.m_nCurrY);
        nDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
        if (((distx > 2) or (disty > 2)) and ((distx < 12) and (disty < 12))) or (MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) = false) then begin //restrict the maximum pursuit distance to 12 coords away
          m_dwWalkTick:=GetCurrentTime;
          m_nTargetX := m_TargetCret.m_nCurrX;
          m_nTargetY := m_TargetCret.m_nCurrY;
          GotoTargetXY
        end;
      end;
      nX:= abs(m_nCurrX - m_TargetCret.m_nCurrX);
      nY:= abs(m_nCurrY - m_TargetCret.m_nCurrY);
      if MagCanHitTarget(m_nCurrX,m_nCurrY,m_targetCret) then begin //make sure the 'line' in wich magic will go isnt blocked
        if (nX <= 3) and (nY <= 3) then begin
          if m_boUseMagic or ((nX = 2) or (nY = 2)) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
              m_dwHitTick:=GetCurrentTime;
              nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
              ThrustAttack(nAttackDir);
            end;
          end;
        end;
      end;
    end;
  end;
  inherited Run;
end;


{야차수호장}
constructor TIceHellMonster2.Create;
begin
  inherited;
  m_dwSearchTime:=Random(1500) + 1500;
  m_boUseMagic:=False;
  m_boApproach:=FALSE;
end;

destructor TIceHellMonster2.Destroy;
begin

  inherited;
end;

function TIceHellMonster2.Operate(ProcessMsg:pTProcessMessage):boolean;
begin
  if (ProcessMsg.wIdent = RM_MAGSTRUCK) and (not MassAttackMode) then begin
    //they used magic now pwn them with redcircle!!!!!!
    MassAttackMode:=True;
    MassAttackCount:=0;
  end;
  Result := inherited Operate(ProcessMsg);
end;


procedure TIceHellMonster2.ThrustAttack(nDir: Integer);
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
    if (abs(Target.m_nCurrX-BaseObject.m_nCurrX) <= 8) and (abs(Target.m_nCurrY-BaseObject.m_nCurrY) <= 8) then begin
     //if in 3 radious range get hit
      if BaseObject <> nil then begin
        if IsProperTarget (BaseObject) then begin
        //  if random(3) = 0 then NextTarget:=BaseObject;
          if Random(50) >= BaseObject.m_nAntiMagic then begin
            WAbil:=@m_WAbil;
            magpwr:=(Random(SmallInt(HiWord(WAbil.MC) - LoWord(WAbil.MC)) + 1) + LoWord(WAbil.MC));
            BaseObject.SendDelayMsg (self, RM_MAGSTRUCK, 0, magpwr, 0, 0, '', 600);
            if (Random(15 + Target.m_btAntiPoison) = 0) then begin
            m_TargetCret.MakePosion(POISON_SLOWDOWN,10,0);

          end;
         end;
        end;
      end;
     end;
    end;
   end; 



procedure TIceHellMonster2.Run;
var
  nAttackDir:Integer;
  distx,disty,distx2,disty2:Integer;
  n8,nC,n10:Integer;
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
      ThrustAttack(nAttackDir);
    end;

    {Actual magic attack if hes hit by magic}
    if (Integer(GetTickCount - m_dwHitTick) > 2000) and (m_TargetCret <> nil) then begin
      if (MassAttackMode) then begin
        if (MassAttackCount <= 5) then begin
          m_dwHitTick:=GetCurrentTime;
          inc(MassAttackCount);
          nAttackDir:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
          ThrustAttack(nAttackDir);
        end else begin
          MassAttackCount := 0;
          MassAttackMode := False;
        end;
      end;
    end;
  end;
  inherited;
end;


       {TFoxBead}
constructor TFoxBead.Create;        //비월천주
begin
   inherited Create;
   BoDontMove  := TRUE;
   m_boAnimal:=False;
  // m_boStickMode := TRUE;     //비월천주 버그
   bo554 := FALSE;
   m_nViewRange  := 11;
   m_nRunTime := 250;
   m_dwSearchTime := 1500 + longword(Random(1500));
   m_dwSearchTick:=GetTickCount();
   m_boFixedHideMode := FALSE;
   BodyState := 1;
   sectick := GetTickCount;
   CheckRocks   := False;
end;

procedure TFoxBead.Run ;             //비월천주
var
  monlist: TList;
  cret: TBaseObject;
  i, j: integer;
  mon, mon2, mon3: TBaseObject;
begin
   if GetTickCount - sectick > 3000 then begin
      sectick := GetTickCount;
      if (not m_boDeath) and (not m_BoGhost) then begin
         if (m_WAbil.HP >=m_WAbil.MaxHP * 4 div 5) then begin
            if BodyState <> 1 then begin
               BodyState := 1;

               m_WAbil.DC := MakeWord( _MIN(255, lobyte(m_Abil.DC)), _MIN(255, HIBYTE(m_Abil.DC)) );
               m_WAbil.AC := MakeWord( _MIN(255, lobyte(m_Abil.AC)), _MIN(255, HIBYTE(m_Abil.AC)) );
           //    m_WAbil.MAC := MakeWord(loword(m_Abil.MAC), HIword(m_Abil.MAC));
               SendRefMsg (RM_FOXSTATE, m_btDirection, m_nCurrX, m_nCurrY, BodyState, m_sCharName);
            end;
         end else if (m_WAbil.HP >= m_WAbil.MaxHP * 3 div 5) then begin
           if BodyState <> 2 then begin
               BodyState := 2;

               m_WAbil.DC := MakeWord( _MIN(255, lobyte(m_Abil.DC)), _MIN(255, HIBYTE(m_Abil.DC) + HIBYTE(m_Abil.DC) div 10) );
               m_WAbil.AC := MakeWord( _MIN(255, lobyte(m_Abil.AC)), _MIN(255, HIBYTE(m_Abil.AC) + HIBYTE(m_Abil.AC) * 2 div 10) );
            //   m_WAbil.MAC := MakeWord(loword(m_Abil.MAC),HIword(m_Abil.MAC) + HIword(m_Abil.MAC) * 2 div 10);
               SendRefMsg (RM_FOXSTATE, m_btDirection, m_nCurrX, m_nCurrY, BodyState, m_sCharName);
            end;
         end else if (m_WAbil.HP >= m_WAbil.MaxHP * 2 div 5) then begin
            if BodyState <> 3 then begin
               BodyState := 3;

               m_WAbil.DC := MakeWord( _MIN(255, lobyte(m_Abil.DC)), _MIN(255, HIBYTE(m_Abil.DC) + HIBYTE(m_Abil.DC) * 2 div 10) );
               m_WAbil.AC := MakeWord( _MIN(255, lobyte(m_Abil.AC)), _MIN(255, HIBYTE(m_Abil.AC) + HIBYTE(m_Abil.AC) * 4 div 10) );
            //   m_WAbil.MAC := MakeWord(loword(m_Abil.MAC), HIword(m_Abil.MAC) + HIword(m_Abil.MAC) * 4 div 10);
               SendRefMsg (RM_FOXSTATE, m_btDirection, m_nCurrX, m_nCurrY, BodyState, m_sCharName);
            end;
         end else if (m_WAbil.HP >= m_WAbil.MaxHP * 1 div 5) then begin
            if BodyState <> 4 then begin
               BodyState := 4;

               m_WAbil.DC := MakeWord( _MIN(255, lobyte(m_Abil.DC)), _MIN(255, HIBYTE(m_Abil.DC) + HIBYTE(m_Abil.DC) * 3 div 10) );
               m_WAbil.AC := MakeWord( _MIN(255, lobyte(m_Abil.AC)), _MIN(255, HIBYTE(m_Abil.AC) + HIBYTE(m_Abil.AC) * 6 div 10) );
            //   m_WAbil.MAC := MakeWord(loword(m_Abil.MAC), HIword(m_Abil.MAC) + HIword(m_Abil.MAC) * 4 div 10);
               SendRefMsg (RM_FOXSTATE, m_btDirection, m_nCurrX, m_nCurrY, BodyState, m_sCharName);
            end;
         end else begin
            if BodyState <> 5 then begin
               BodyState := 5;

               m_WAbil.DC := MakeWord( _MIN(255, lobyte(m_Abil.DC)), _MIN(255, HIBYTE(m_Abil.DC) + HIBYTE(m_Abil.DC) * 4 div 10) );
               m_WAbil.AC := MakeWord( _MIN(255, lobyte(m_Abil.AC)), _MIN(255, HIBYTE(m_Abil.AC) + HIBYTE(m_Abil.AC) * 8 div 10) );
             //  m_WAbil.MAC := MakeWord(loword(m_Abil.MAC), HIword(m_Abil.MAC) + HIword(m_Abil.MAC) * 4 div 10);
               SendRefMsg (RM_FOXSTATE, m_btDirection, m_nCurrX, m_nCurrY, BodyState, m_sCharName);
            end;
         end;
      end;
  end;


  if CheckRocks = False then begin
    monlist := TList.Create;
    rocklist := TList.Create;
    GetMapBaseObjects(m_PEnvir, m_nCurrX, m_nCurrY, 7, monlist);
    if monlist.Count > 0 then begin
      for i := 0 to monlist.Count - 1 do begin
       cret := TBaseObject(monlist[i]);
        if cret.m_btRaceServer = 156 then begin
          rocklist.add(cret);
        end;
      end;
    end;
     FreeAndNil(monlist);
     if rocklist.Count < 3 then begin
      mon := UserEngine.RegenMonsterByName(m_PEnvir.sMapName, self.m_nCurrX, self.m_nCurrY-7, '빠산편柯');
      mon2 := UserEngine.RegenMonsterByName(m_PEnvir.sMapName, self.m_nCurrX+7, self.m_nCurrY, '빠산편柯');
      mon3 := UserEngine.RegenMonsterByName(m_PEnvir.sMapName, self.m_nCurrX-7, self.m_nCurrY, '빠산편柯');
      mon.m_WAbil.MaxHP := 1000;
      mon2.m_WAbil.MaxHP := 1000;
      mon3.m_WAbil.MaxHP := 1000;
      rocklist.Add(mon);
      rocklist.Add(mon2);
      rocklist.Add(mon3);
      CheckRocks := True;
     end else begin
      for j := 0 to rocklist.Count - 1 do begin
        cret := TBaseObject(rocklist[j]);
        cret.m_WAbil.MaxHP := 1000;
        CheckRocks := True;
      end;
     end;
     FreeAndNil(rocklist);
  end;



   // 기존 실행을 한다.
   inherited Run;
end;

function TFoxBead.AttackTarget: Boolean;         //비월천주
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
            //소환(10%)
            if Random(10) = 0 then begin
               //소환 비월천주 Effect
               SendRefMsg (RM_10205, 0, m_nCurrY, m_nCurrY, NE_KINGSTONE_RECALL_1, '0');

               rlist := TList.Create;
               GetMapBaseObjects (m_PEnvir, m_nCurrY, m_nCurrY, 30, rlist);

               for i:=0 to rlist.Count-1 do begin
                  cret := TBaseObject (rlist[i]);
                  if (not cret.m_boDeath) and IsProperTarget (cret) then begin
                     //일정 범위 밖에 있는 사람만
                     if (cret.m_btRaceServer = RC_PLAYOBJECT) and ( (abs(m_nCurrX - cret.m_nCurrX) > 3) or (abs(m_nCurrY - cret.m_nCurrY) > 3) ) then begin
                        //소환한다.
                        if Random(3) < 2 then begin
                           //소환 캐릭 Effect
                           cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGSTONE_RECALL_2, '0');

                           if Random(2) = 0 then begin
                              nx := m_nCurrX + Random(3) + 1;
                              ny := m_nCurrY + Random(3) + 1;
                           end else begin
                              nx := m_nCurrX - Random(3) - 1;
                              ny := m_nCurrY - Random(3) - 1;
                           end;
                           cret.SpaceMove( m_PEnvir.sMapName, nx, ny, 2 );

                           //소환 캐릭 Effect
                           cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGSTONE_RECALL_2, '0');
                        end;
                     end;
                  end;
               end;
               FreeAndNil(rlist);
               Result := TRUE;
            end else if Random(100) < 40 then begin
               //초필살 공격(35%)
               RangeAttack2 (m_TargetCret);
               Result := TRUE;
            end else if Random(10) < 4 then begin
               //중심공격(%)

               Attack (m_TargetCret, m_btDirection);
               Result := TRUE;
            end else begin
               //원거리공격(%)

               RangeAttack (m_TargetCret);
               Result := TRUE;
            end;
            //다른 타겟 물색
            if Random(10) < 4 then begin
               FindTarget;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
              DelTargetCreat();  //<!!주의> TargetCret := nil로 바뀜
            end;
         end;

      end;
   end;

end;

function  TFoxBead.FindTarget: Boolean;      //비월천주
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
                  //타겟 지정
                  m_TargetCret := cret;
               end else begin
                  //고정 타겟 방지.
                  if Random(100) < 50 then continue;

                  //타겟 지정
                  m_TargetCret := cret;
               end;

               Result := TRUE;
               break;
            end;
         end;
      end;
   end;
end;

//5x5 원거리 범위 공격
procedure TFoxBead.RangeAttack (targ: TBaseObject); //반드시 target <> nil     //비월천주
var
   i, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
begin
   if targ = nil then exit;

   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, targ.m_nCurrX, targ.m_nCurrY);

   SendRefMsg(RM_LIGHTING_1,m_btDirection,m_nCurrX,m_nCurrY,Integer(targ),'');
   if m_PEnvir.GetNextPosition(m_nCurrX, m_nCurrY, m_btDirection, 1, sx, sy) then begin
      m_PEnvir.GetNextPosition (m_nCurrX, m_nCurrY, m_btDirection, 9, tx, ty);
      with m_WAbil do begin
         pwr := _MAX( 0, Lobyte(DC) + _MIN( 255, Random(ShortInt(HIBYTE(DC)-Lobyte(DC)) + 1) ) );
         pwr := pwr + Random(Lobyte(MC));
         pwr := pwr * 2;
      end;

      list := TList.Create;
      m_PEnvir.GetRangeBaseObject (targ.m_nCurrX, targ.m_nCurrY, 2, TRUE, list);
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

//초필살 공격
procedure TFoxBead.RangeAttack2 (targ: TBaseObject); //반드시 target <> nil   //비월천주
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   //초필살 Effect
   SendRefMsg (RM_LIGHTING_2, m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
   with m_WAbil do begin
      pwr := GetAttackPower (Lobyte(DC), _MIN( 255, ShortInt(HIBYTE(DC)-Lobyte(DC)) ) );
      pwr := pwr * 2;
   end;

   // 시야내 모든 캐릭/소환몹 중독
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            //저주술 또는 마비가 된다.
            if Random(10) < 2 then begin
               if Random(2 + cret.m_btAntiPoison) = 0 then
                  cret.MakePosion (POISON_STONE, 5, 5);
            end else begin
               if Random(2 + cret.m_btAntiPoison) = 0 then begin
                  sec := 40;
                  pwr := 70;
                  skilllevel := 3;
                  MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);
               end;
            end;
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then
               cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 1500);
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then
               cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 2000);
         end;
      end;
   end;
end;

//중심 범위 공격
procedure TFoxBead.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //비월천주
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 3;
   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_LIGHTING, m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
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
         //3번 연속 타격
         dam := cret.GetMagStruckDamage (self, pwr);
         if dam > 0 then
            cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 300);
         dam := cret.GetMagStruckDamage (self, pwr);
         if dam > 0 then
            cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 600);
         dam := cret.GetMagStruckDamage (self, pwr);
         if dam > 0 then
            cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 900);
      end;
   end;
   FreeAndNil(rlist);
end;

procedure TFoxBead.Die;                             //비월천주
var
   k: integer;
   cret: TBaseObject;
   list: TList;
begin
   list := TList.Create;
   UserEngine.GetMapMonster (m_PEnvir, list);
   for k:=0 to list.Count-1 do begin
    if not (TBaseObject(list[k]).m_btRaceServer = RC_PET) then begin      //영물 제외
      TBaseObject(list[k]).m_boSuperMan := FALSE;
      TBaseObject(list[k]).m_WAbil.HP := 0; //모두 죽인다.
    end;
   end;
   FreeAndNil(list);
  inherited Die;
end;






      {TCatKing}
constructor TCatKing.Create;        //묘장군
begin
   inherited Create;
   m_boAnimal:=False;
   m_nViewRange  := 7;
   m_dwSearchTime := 1500 + longword(Random(1500));
   m_dwSearchTick:=GetTickCount();
end;


function TCatKing.AttackTarget: Boolean;        //묘장군
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
            //소환(8%)
            if Random(5) = 0 then begin
               for i:=0 to m_VisibleActors.Count-1 do begin
                   cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);
                     if (not cret.m_boDeath) and IsProperTarget (cret) then begin
                         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
                           //소환 캐릭 Effect
                           SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGSTONE_RECALL_2, '0');

                           if Random(2) = 0 then begin
                              nx := m_nCurrX + Random(3) + 1;
                              ny := m_nCurrY + Random(3) + 1;
                           end else
                           if Random(2) = 0 then begin
                              nx := m_nCurrX - Random(3) - 1;
                              ny := m_nCurrY - Random(3) - 1;
                           end else
                           if Random(2) = 0 then begin
                              nx := m_nCurrX + Random(3) - 1;
                              ny := m_nCurrY - Random(3) - 1;
                           end else
                              nx := m_nCurrX - Random(3) - 1;
                              ny := m_nCurrY + Random(3) - 1;

                           if Random(2) < 1 then begin
                             cret.SpaceMove( m_PEnvir.sMapName, nx, ny, 2 );
                             SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_KINGSTONE_RECALL_2, '0');
                           end;
                     end;
                  end;
               end;
               FreeAndNil(rlist);

               Result := TRUE;
            end else begin
            if GetAttackDir(m_TargetCret,m_btDirection) and (Random(3) <> 0) then begin
                Attack (m_TargetCret, m_btDirection);    //일반공격
                Result := TRUE;
            end else
            if TargetInSpitRange (m_TargetCret, m_btDirection) and (Random(3) <> 0) then begin
               Attack2 (m_TargetCret, m_btDirection);   //어검공격
               Result := TRUE;
            end else
            if Random(100) < 10 then begin
               RangeAttack (m_TargetCret);  //원거리 공격
               Result := TRUE;
            end else
               RangeAttack2 (m_TargetCret);   //둔화 공격
               Result := TRUE;
            end;
            //다른 타겟 물색
            if Random(10) < 4 then begin
               FindTarget;
            end;
         end else begin
            if m_TargetCret.m_sMapName = self.m_sMapName then begin
               if (abs(m_nCurrX-m_TargetCret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-m_TargetCret.m_nCurrY) <= m_nViewRange) then begin
                  SetTargetXY (m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY)
               end;
            end else begin
              DelTargetCreat();  //<!!주의> TargetCret := nil로 바뀜
            end;
         end;

      end;
   end;

end;

function  TCatKing.FindTarget: Boolean;     //묘장군
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
                  //타겟 지정
                  m_TargetCret := cret;
               end else begin
                  //고정 타겟 방지.
                  if Random(100) < 50 then continue;

                  //타겟 지정
                  m_TargetCret := cret;
               end;

               Result := TRUE;
               break;
            end;
         end;
      end;
   end;
end;

//일반공격
procedure TCatKing.Attack (TargeTBaseObject: TBaseObject; nDir: Integer);    //묘장군
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if TargeTBaseObject = nil then exit;

   wide := 1;
   m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
   SendRefMsg (RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, Integer(TargeTBaseObject), '');
   with m_WAbil do begin
      pwr := GetAttackPower (Lobyte(DC), _MIN( 255, ShortInt(Hibyte(DC)-Lobyte(DC)) ) );
      pwr := pwr + Random(Lobyte(MC));
   end;
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, m_nCurrX, m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         dam := cret.GetMagStruckDamage (self, pwr);
         if dam > 0 then
            cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 300);

         dam := cret.GetMagStruckDamage (self, pwr);
         if dam > 0 then
            cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 800);
      end;
   end;
   FreeAndNil(rlist);
end;


procedure TCatKing.Attack2 (targ: TBaseObject; nDir: Integer);     //묘장군 어검공격
var
   i, k,  mx, my, dam, armor: integer;
   cret: TBaseObject;
   pwr: integer;
begin
   self.m_btDirection := nDir;
   with m_WAbil do begin
     pwr := _MAX( 0, Lobyte(DC) + _MIN( 255, Random(ShortInt(HIBYTE(DC)-Lobyte(DC)) + 1) ) );
     pwr := pwr + Random(Lobyte(MC));
   end;

   if pwr <= 0 then exit;

   SendRefMsg (RM_LIGHTING, self.m_btDirection,m_nCurrX, m_nCurrY, Integer(targ), '');

   for i:=0 to 4 do
      for k:=0 to 4 do begin
         if g_Config.SpitMap[nDir, i, k] = 1 then begin
            mx := m_nCurrX - 2 + k;
            my := m_nCurrY - 2 + i;
            cret := TBaseObject (m_PEnvir.GetMovingObject (mx, my, TRUE));
            if (cret <> nil) and (cret <> self) then begin
               if IsProperTarget(cret) then begin
                  //맞는지 결정
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


procedure TCatKing.RangeAttack (targ: TBaseObject);  //묘장군 원거리
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

               if Random(13 + cret.m_btAntiPoison) = 0 then
                  cret.MakePosion (POISON_SLOWDOWN, 10, 5);
            end;
         end;
      end;
      FreeAndNil(list);
end;

procedure TCatKing.RangeAttack2 (targ: TBaseObject);   //묘장군 시야내 둔화 시키기
var
   i, ix, iy, ixf, ixt, iyf, iyt, pwr, dam: integer;
   sx, sy, tx, ty : integer;
   list: TList;
   cret: TBaseObject;
   sec, skilllevel: integer;
begin
   if targ = nil then exit;

   SendRefMsg (RM_LIGHTING_3, m_btDirection, m_nCurrX, m_nCurrY, Integer(self), '');
   with m_WAbil do begin
      pwr := GetAttackPower (Lobyte(DC), _MIN( 255, ShortInt(HIBYTE(DC)-Lobyte(DC)) ) );
   end;

   // 시야내 모든 캐릭/소환몹 중독
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors[I]).BaseObject);

      if (not cret.m_boDeath) and IsProperTarget (cret) then begin
         if (cret.m_btRaceServer = RC_PLAYOBJECT) or (cret.m_Master <> nil) then begin
            //둔화 또는 저주술
            if Random(10) < 7 then begin
               if Random(2 + cret.m_btAntiPoison) = 0 then
                  cret.MakePosion (POISON_SLOWDOWN, 10, 5);
            end else begin
               if Random(2 + cret.m_btAntiPoison) = 0 then begin
                  sec := 40;
                  pwr := 70;
                  skilllevel := 3;
                  MagMakeCurseArea (targ.m_nCurrX, targ.m_nCurrY, 2, sec, pwr, skilllevel, FALSE);
               end;
            end;
            dam := cret.GetMagStruckDamage (self, pwr);
            if dam > 0 then
               cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, dam, 0, 0, '', 300);
         end;
      end;
   end;
end;






{--------------------------------------------------------------}
//호혼석

constructor TStickBlockMonster.Create;
begin
   inherited Create;
   m_nViewRange := 7;
   nComeOutValue := 4;
   nAttackRange := 4;
   BoCallFollower := TRUE;
   BoTransparent := FALSE;
   FirstComeOut := TRUE;
   SecondMovement := FALSE;
   DontAttack := TRUE;
   childlist := TList.Create;
   m_btRaceServer := 150;
   FirstStruck := FALSE;
   ComeoutTime := 0;
   TargetDisappearTime := 0;
   Caller := nil;
   OldTargetCret := nil;
   m_BoAnimal := FALSE;  //썰리지 않도록...
end;

destructor TStickBlockMonster.Destroy;
begin
   FreeAndNil(childlist);
   inherited Destroy;
end;

function  TStickBlockMonster.FindTarget: Boolean;
var
   i: integer;
   cret: TBaseObject;
begin
   Result := FALSE;
   for i:=0 to m_VisibleActors.Count-1 do begin
      cret := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if (not cret.m_boDeath) and IsProperTarget(cret) then begin
         if (abs(m_nCurrX-cret.m_nCurrX) <= m_nViewRange) and (abs(m_nCurrY-cret.m_nCurrY) <= m_nViewRange) then begin
            if cret.m_btRaceServer = RC_PLAYOBJECT then begin
               //타겟 지정
               m_TargetCret := cret;
               OldTargetCret := m_TargetCret;

               Result := TRUE;
               break;
            end;
         end;
      end;
   end;
end;

procedure TStickBlockMonster.Attack (target: TBaseObject; dir: byte);
var
   i, k,  mx, my, dam, armor: integer;
   wide: integer;
   rlist: TList;
   cret: TBaseObject;
   pwr: integer;
begin
   if target = nil then exit;

   wide := 0;
   Self.m_btDirection := GetNextDirection (m_nCurrX, m_nCurrY, target.m_nCurrX, target.m_nCurrY);
   SendRefMsg (RM_HIT, self.m_btDirection, m_nCurrX, m_nCurrY, Integer(target), '');
   with m_WAbil do
      pwr := GetAttackPower (Lobyte(DC), ShortInt(Hibyte(DC)-Lobyte(DC)));
   if pwr <= 0 then exit;

   rlist := TList.Create;
   GetMapBaseObjects (m_PEnvir, target.m_nCurrX, target.m_nCurrY, wide, rlist);
   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if IsProperTarget(cret) then begin
         SetTargetCreat (cret);
         cret.SendRefMsg (RM_10205, 0, cret.m_nCurrX, cret.m_nCurrY, NE_SOULSTONE_HIT, '0');
         cret.SendDelayMsg (self, RM_MAGSTRUCK, 0, pwr, 0, 0, '', 600);
      end;
   end;
   FreeAndNil(rlist);

end;

function  TStickBlockMonster.AttackTarget: Boolean;
var
   i, pwr: integer;
   cret: TBaseObject;
   targdir: byte;
begin
   Result := FALSE;
   if DontAttack then exit;

   if FindTarget then begin
      //처음 타겟을 바꾸지 않음.
      if OldTargetCret <> m_TargetCret then m_TargetCret := OldTargetCret;

      if m_TargetCret <> nil then begin
         if GetAttackDir (m_TargetCret, targdir) then begin
            if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
               m_dwHitTick := GetCurrentTime;

               if Random(12 + m_TargetCret.m_btAntiPoison) = 0 then begin
                  m_TargetCret.MakePosion (POISON_STONE, 5{시간,초}, 0);
               end else begin
                  Attack(m_TargetCret, targdir);
               end;
               Result := TRUE;
            end;
         end;
      end;
   end;
end;

procedure TStickBlockMonster.ComeOut;
begin
   inherited ComeOut;
   if BoCallFollower then begin
      if FindTarget then begin
         if m_TargetCret <> nil then begin
            if FirstComeOut then begin
               FirstComeOut := FALSE;
               SecondMovement := TRUE;
               m_TargetCret.MakePosion (POISON_STONE, 5{시간,초}, 0);
            end;
         end;
      end;
   end;
end;

procedure TStickBlockMonster.ComeDown;
begin
   //처리 안함.
end;

procedure TStickBlockMonster.CallFollower;
const
   MAX_FOLLOWERS = 2;
var
   i, nx, ny, dx, dy: integer;
   monname: string;
   mon: TBaseObject;
   followers: array[0..MAX_FOLLOWERS-1] of string;
begin
   if m_TargetCret <> nil then begin
      nx := m_TargetCret.m_nCurrX;
      ny := m_TargetCret.m_nCurrY;

      //젠시킬 몬스터이름
      followers[0] := m_sCharName;
      followers[1] := '11';//'호혼석00';   //이미지 안보임

      for dx:=-1 to 1 do begin
         for dy:=-1 to 1 do begin
            if ((nx + dx = m_nCurrX) and (ny + dy = m_nCurrY)) or ((nx + dx = m_TargetCret.m_nCurrX) and (ny + dy = m_TargetCret.m_nCurrY)) then continue;

            //대각선
            if abs(dx) = abs(dy) then begin
               monname := followers[1];
            end else begin
               monname := followers[0];
            end;
            if m_PEnvir.CanWalk( nx + dx, ny + dy, FALSE ) then begin
             //  mon := UserEngine.RegenMonsterByName (m_PEnvir.sMapName, nx + dx, ny + dy, monname);
               if mon <> nil then begin
                  // 같은 종류의 몬스터이면
                  if mon.m_btDirection = 150 then begin
                     TStickBlockMonster(mon).BoCallFollower := FALSE;
                     //투명몬스터 설정
                     if mon.m_sCharName = followers[1] then begin
                        TStickBlockMonster(mon).BoTransparent := TRUE;
                     end;
                     TStickBlockMonster(mon).ComeOut;
                     TStickBlockMonster(mon).Caller := self;
                     childlist.Add (mon);
                  end;
               end;
            end;
         end;
      end;
      self.ComeOut;
   end;
end;

procedure TStickBlockMonster.Die;
var
   i: integer;
begin
   inherited Die;
   if BoCallFollower then begin
      for i:=childlist.Count-1 downto 0 do begin
         if not TBaseObject(childlist[i]).m_boDeath then begin
            TBaseObject(childlist[i]).m_LastHiter := nil;
            TBaseObject(childlist[i]).m_ExpHitter := nil;
            TBaseObject(childlist[i]).m_boNoItem := TRUE; //꼬봉 호혼석은 아이템을 안떨구게(sonmg 2005/10/21)
            TBaseObject(childlist[i]).Die;
         end;
      end;
   end;
end;


function  TStickBlockMonster.Operate(ProcessMsg:pTProcessMessage):Boolean;
var
   nx, ny: integer;
   monname: string;
   mon: TBaseObject;
   i: integer;
   check: Boolean;
   hiter : TBaseObject;
begin
   hiter := nil;
   case ProcessMsg.wIdent of
      RM_10101:
         begin
            if Integer(ProcessMsg.BaseObject) = RM_STRUCK then begin
               check := FALSE;

               hiter := TBaseObject(ProcessMsg.nParam3);

               if (hiter <> nil) and (hiter.m_btRaceServer = RC_PLAYOBJECT) then begin
                  //메인 몹이 맞았을 때 follower들 중에 먼저 맞은 넘이 없으면 바로 죽음
                  if BoCallFollower then begin
                     for i:=0 to childlist.count-1 do begin
                        if TStickBlockMonster(childlist[i]).FirstStruck then begin
                           check := TRUE;
                        end;
                     end;
                     if (not check) and (DontAttack) then begin
                        if not m_boDeath then begin
                           FirstStruck := TRUE;
                           Die;
                        end;
                     end;
                     DontAttack := FALSE;
                  end else begin
                     m_WAbil.HP := m_WAbil.MaxHP;
                     if not BoTransparent then begin
                        //follower가 맞았을 때 메인 몹이 먼저 맞지 않았으면 FirstStruck TRUE로 셋팅
                        //(뢰혼격으로 꼬셔지는가?)
                        if (Caller <> nil) and (Caller.m_btRaceServer = 150) and not TStickBlockMonster(Caller).FirstStruck then begin
                           FirstStruck := TRUE;
                           //메인 몹 공격 모드로
                           TStickBlockMonster(Caller).DontAttack := FALSE;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      RM_MAGSTRUCK:
         begin
            if BoCallFollower then begin
               DontAttack := FALSE;
            end else begin
               m_WAbil.HP := m_WAbil.MaxHP;
               exit;
            end;
         end;
   end;
   inherited Operate (ProcessMsg);
end;

procedure TStickBlockMonster.Struck (hiter: TBaseObject);
begin

   inherited Struck(hiter);
end;

procedure TStickBlockMonster.Run;
var
   i, dis, d, nx, ny: integer;
   cret, nearcret: TBaseObject;
   targdir: byte;
begin
   //처음 타겟을 바꾸지 않음.
   if OldTargetCret <> m_TargetCret then m_TargetCret := OldTargetCret;

   if GetCurrentTime - m_dwWalkTick > GetWalkSpeed then begin
      if BoCallFollower and (not m_boDeath) then begin
         if (Caller <> nil) and (Caller.m_btRaceServer = 150) and not TStickBlockMonster(Caller).DontAttack then begin
            DontAttack := FALSE;
         end;
         if m_TargetCret <> nil then begin
            if (not FirstComeOut) and SecondMovement then begin
               SecondMovement := FALSE;
               case Random(4) of
               0: begin
                     nx := 0;
                     ny := -1;
                  end;
               1: begin
                     nx := 0;
                     ny := 1;
                  end;
               2: begin
                     nx := -1;
                     ny := 0;
                  end;
               else
                  begin
                     nx := 1;
                     ny := 0;
                  end;
               end;
               SpaceMove ( m_TargetCret.m_sMapName, m_TargetCret.m_nCurrX + nx, m_TargetCret.m_nCurrY + ny, 2);
               CallFollower;  //부하들을 불러냄
               ComeoutTime := GetTickCount;
            end;

            //시간이 흐르면
            if (ComeoutTime <> 0) and (GetTickCount - ComeoutTime > 10000) then begin
               //메인 몹 공격 모드로
               if DontAttack then
                  DontAttack := FALSE;
            end;
         end;

         if DontAttack = FALSE then begin
            if m_TargetCret <> nil then begin
               if not GetAttackDir (m_TargetCret, targdir) then begin
                  if (TargetDisappearTime = 0) then begin
                     if (ComeoutTime <> 0) and (GetTickCount - ComeoutTime > 15000) then begin
                        TargetDisappearTime := GetTickCount;
                     end;
                  end;
               end;
            end else begin
               if (TargetDisappearTime = 0) then begin
                  if (ComeoutTime <> 0) and (GetTickCount - ComeoutTime > 15000) then begin
                     TargetDisappearTime := GetTickCount;
                  end;
               end;
            end;

            if (TargetDisappearTime <> 0) and (GetTickCount - TargetDisappearTime > 10000) then begin
               if not m_boDeath then begin
                  FirstStruck := TRUE;
                  Die;
               end;
            end;
         end;
      end;
   end;

   inherited Run;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ObjMon2.pas 594 2007-03-09 15:00:12Z damian $');
end.
