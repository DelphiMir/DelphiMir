unit ObjGuard;

interface
uses
  {svn, }Windows,Classes,Grobal2,ObjNpc;
type
  TSuperGuard = class(TNormNpc)
  public
    n564:Integer;
    m_boAttackPet       :Boolean;
  public
    constructor Create();
    destructor Destroy; override;
    function  AttackTarget():Boolean;
    function  Operate(ProcessMsg:pTProcessMessage):Boolean;override; //FFFC
    procedure Run;override;  //FFFB
  end;

  TPetSuperGuard = class(TSuperGuard)
  public
    constructor Create();
    destructor Destroy; override;
  end;

  { TMoveSuperGuard }

  TMoveSuperGuard = class(TNormNpc)
    MovePoint: array of TPoint;
    nIdx: Integer;
    nKeepCount: Integer;
    nKeepMaxCount: Integer;
  public
    m_boAttackPet       :Boolean;
    constructor Create();
    destructor Destroy; override;
    procedure Initialize(); override;
    function AttackTarget(): Boolean;
    function Operate(ProcessMsg: pTProcessMessage): Boolean; override;
    procedure Run; override;
  end;

implementation

uses ObjBase, M2Share, Hutil32;


{ TSuperGuard }

function TSuperGuard.AttackTarget():Boolean; //004977B4
var
  nOldX,nOldY:Integer;
  btOldDir:Byte;
  wHitMode:Word;
begin
  Result:=False;
  if not (m_TargetCret.m_boPenetrateMode) then begin
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
      m_dwHitTick:=GetCurrentTime;
      m_dwTargetFocusTick:=GetTickCount();
      nOldX:=m_nCurrX;
      nOldY:=m_nCurrY;
      btOldDir:=m_btDirection;
      m_TargetCret.GetBackPosition(m_nCurrX,m_nCurrY);
      m_btDirection:=GetNextDirection(m_nCurrX,m_nCurrY,m_TargetCret.m_nCurrX,m_TargetCret.m_nCurrY);
      SendRefMsg(RM_HIT,m_btDirection,m_nCurrX,m_nCurrY,0,'');
      wHitMode:=1;
      _Attack(wHitMode,m_TargetCret);
      m_TargetCret.SetLastHiter(Self);
      m_TargetCret.m_ExpHitter:=nil;
      m_nCurrX:=nOldX;
      m_nCurrY:=nOldY;
      m_btDirection:=btOldDir;
      TurnTo(m_btDirection);
      BreakHolySeizeMode();     //°á°èÆÄ±«
      BreakPobakSeizeMode();
    end;
    Result:=True;
  end else begin
    DelTargetCreat();
  end;
  end else begin
    DelTargetCreat();
  end;
end;

constructor TSuperGuard.Create;//004976B0
begin
  inherited Create;
  m_nViewRange:=7;
  m_nLight:=4;
  m_boAttackPet:=True;
end;

destructor TSuperGuard.Destroy; //00497718
begin

  inherited Destroy;
end;

function TSuperGuard.Operate(ProcessMsg: pTProcessMessage):Boolean;//0049774C
begin
  Result:=inherited Operate(ProcessMsg);
end;

procedure TSuperGuard.Run;//00497924
var
  I:Integer;
  BaseObject:TBaseObject;
begin
  if m_Master <> nil then m_Master:=nil; //²»ÔÊÐíÕÙ»½Îª±¦±¦

  if GetCurrentTime - m_dwHitTick > GetHitSpeed then begin
    for I := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject:=TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[I]).BaseObject);
      if not BaseObject.m_boPenetrateMode then begin
        if BaseObject.m_boDeath then Continue;
        if BaseObject.m_btRaceServer = RC_PET then Continue;
        if (BaseObject.PKLevel >= 2) or ((BaseObject.m_btRaceServer >= RC_MONSTER) and (not BaseObject.m_boMission)) then begin
          if m_boAttackPet then begin
            SetTargetCreat(BaseObject);
            break;
          end else begin
            if BaseObject.m_Master = nil then begin
              SetTargetCreat(BaseObject);
              break;
            end else begin
              if BaseObject.m_TargetCret = self then begin
                SetTargetCreat(BaseObject);
                break;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if m_TargetCret <> nil then AttackTarget();
  inherited Run;
end;



constructor TPetSuperGuard.Create;
begin
  inherited;
  m_nViewRange:=7;
  m_nLight:=4;
  m_boAttackPet := False;
end;

destructor TPetSuperGuard.Destroy;
begin
  inherited;
end;


{ TMoveSuperGuard }

function TMoveSuperGuard.AttackTarget: Boolean;
var
  nOldX, nOldY: Integer;
  btOldDir: Byte;
  wHitMode: Word;
begin
  Result := False;
  if m_TargetCret.m_PEnvir = m_PEnvir then begin
    if Integer(GetTickCount - m_dwHitTick) > m_nNextHitTime then begin
      m_dwHitTick := GetTickCount();
      m_dwTargetFocusTick := GetTickCount();
      nOldX := m_nCurrX;
      nOldY := m_nCurrY;
      btOldDir := m_btDirection;
      m_TargetCret.GetBackPosition(m_nCurrX, m_nCurrY);
      m_btDirection := GetNextDirection(m_nCurrX, m_nCurrY, m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
      //SendRefMsg(RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      //SendAttackMsg(RM_HIT, SM_HIT, m_btDirection, m_nCurrX, m_nCurrY);
      SendRefMsg(RM_HIT, m_btDirection, m_nCurrX, m_nCurrY, 0, '');
      wHitMode := 0;
      _Attack(wHitMode, m_TargetCret);
      m_TargetCret.SetLastHiter(Self);
      m_TargetCret.m_ExpHitter := nil;
      m_nCurrX := nOldX;
      m_nCurrY := nOldY;
      m_btDirection := btOldDir;
      TurnTo(m_btDirection);
      BreakHolySeizeMode();
      //MainOutMessage('_Attack(wHitMode, m_TargetCret)');
    end;
    Result := True;
  end
  else begin
    DelTargetCreat();
  end;
end;

constructor TMoveSuperGuard.Create;
begin
  inherited Create;
  m_btRaceServer := RC_MOVEGUARD;
  m_nViewRange := 7;
  m_boAttackPet := True;
  //m_boRunAll := False;
  MovePoint := nil;
  m_nTargetX := -1;
  nIdx := 0;
  nKeepCount := 0;
  nKeepMaxCount := 0;
end;

destructor TMoveSuperGuard.Destroy;
begin
  MovePoint := nil;
  inherited Destroy;
end;

procedure TMoveSuperGuard.Initialize;
begin
  inherited;
  m_btRaceServer := RC_MOVEGUARD;
end;

function TMoveSuperGuard.Operate(ProcessMsg: pTProcessMessage): Boolean;
begin
  Result := inherited Operate(ProcessMsg);
end;

procedure TMoveSuperGuard.Run;
var
  i: Integer;
  BaseObject: TBaseObject;
begin
  if m_Master <> nil then
    m_Master := nil; //²»ÔÊÐíÕÙ»½Îª±¦±¦
  if Integer(GetTickCount - m_dwHitTick) > GetHitSpeed then begin
    for i := 0 to m_VisibleActors.Count - 1 do begin
      BaseObject := TBaseObject(pTVisibleBaseObject(m_VisibleActors.Items[i]).BaseObject);
      if (BaseObject = nil) or (BaseObject.m_boDeath) or (BaseObject.m_boPenetrateMode) or (BaseObject.m_btRaceServer = RC_PET) then
        Continue;
      if (BaseObject.PKLevel >= 2) or ((BaseObject.m_btRaceServer >= RC_MONSTER) and (BaseObject.m_Master = nil) and
        (BaseObject.m_btRaceServer <> RC_ARCHERGUARD) and (not BaseObject.m_boMission)) then begin
        SetTargetCreat(BaseObject);
        SetTargetXY(m_TargetCret.m_nCurrX, m_TargetCret.m_nCurrY);
        break;
      end;
    end;
  end;
  if m_TargetCret <> nil then begin
    AttackTarget();
  end
  else begin
    if Length(MovePoint) > 1 then begin
      if m_boWalkWaitLocked then begin
        if (GetTickCount - m_dwWalkWaitTick) > m_dwWalkWait then begin
          m_boWalkWaitLocked := False;
        end;
      end;
      if not m_boWalkWaitLocked and (Integer(GetTickCount - m_dwWalkTick) > m_nWalkSpeed) then begin
        m_dwWalkTick := GetTickCount();
        Inc(m_nWalkCount);
        if m_nWalkCount > m_nWalkStep then begin
          m_nWalkCount := 0;
          m_boWalkWaitLocked := True;
          m_dwWalkWaitTick := GetTickCount();
        end;
        if (m_nTargetX <> -1) then begin
          if ((m_nCurrX = m_nTargetX) and (m_nCurrY = m_nTargetY)) or (nKeepCount > nKeepMaxCount) then begin
            m_nTargetX := -1;
          end;
        end;
        if m_nTargetX = -1 then begin
          Inc(nIdx);
          if nIdx > High(MovePoint) then nIdx := 0;
          if nIdx < 0 then nIdx := 0;
          SetTargetXY(MovePoint[nIdx].X, MovePoint[nIdx].Y);
          nKeepMaxCount := _MAX(abs(m_nCurrX - m_nTargetX), abs(m_nCurrY - m_nTargetY));
          nKeepMaxCount := nKeepMaxCount + Round(nKeepMaxCount * 0.5);
          nKeepCount := 0;
        end;
        if m_nTargetX <> -1 then begin
          GotoTargetXY;
          Inc(nKeepCount);
        end;
      end;
    end;

  end;
  inherited Run;
end;

{---- Adjust global SVN revision ----}
initialization
  ////SVNRevision('$Id: ObjGuard.pas 594 2007-03-09 15:00:12Z damian $');
end.
