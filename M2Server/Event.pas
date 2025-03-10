unit Event;

interface

uses
  {svn, }Windows,Classes,SysUtils,SyncObjs,ObjBase,Envir,mudutil,Grobal2,SDK;
type
  TEvent = class;

  pTMagicEvent=^TMagicEvent;
  TMagicEvent=record
    BaseObjectList:TList;
    dwStartTick:DWord;
    dwTime:DWord;
    Events:Array[0..7] of TEvent; //°É°è 8°³
  end;

  TEvent = class   //0x40
    nVisibleFlag      :Integer; //0x04
    m_Envir           :TEnvirnoment;
    m_nX              :Integer;//0x0C
    m_nY              :Integer; //0x10
    m_nX1              :Integer;//0x0C
    m_nY1              :Integer; //0x10
    m_nX2              :Integer;//0x0C
    m_nY2              :Integer; //0x10
    m_nEventType      :Integer; //0x14
    m_nEventParam     :Integer; //0x18
    m_dwOpenStartTick :LongWord; //0x1C
    m_dwContinueTime  :LongWord;   //0x20  ÏÔÊ¾Ê±¼ä³¤¶È
    m_dwCloseTick     :LongWord;  //0x24
    m_boClosed        :Boolean;   //0x28
    m_nDamage         :Integer;  ///0x2C
    m_nEventMove      :Boolean;
    m_OwnBaseObject   :TBaseObject;      //0x30
    m_dwRunStart      :LongWord;  //0x34
    m_dwRunTick       :LongWord;   //0x38
    m_boVisible       :Boolean; //0x3C
    m_boActive        :Boolean; //0x3D
  public
    constructor Create(tEnvir: TEnvirnoment; ntX, ntY, nType, dwETime: Integer;boVisible:Boolean);
    destructor Destroy; override;
    procedure Run();virtual;
    procedure Close();
  end;
  TStoneMineEvent = class(TEvent) //0x4C
    m_nMineCount           :Integer; //0x40
    m_nAddStoneCount       :Integer; //0x44
    m_dwAddStoneMineTick   :LongWord;//0x48
  public
    constructor Create(Envir:TEnvirnoment;nX,nY:Integer;nType:Integer);
    destructor Destroy; override;
    procedure AddStoneMine();
  end;
  TPileStones = class(TEvent) //0x40
  public
    constructor Create(Envir:TEnvirnoment;nX,nY:Integer;nType,nTime:Integer);
    destructor Destroy; override;
    procedure  AddEventParam();
  end;
  THolyCurtainEvent = class(TEvent) //°á°è
  public
    constructor Create(Envir:TEnvirnoment;nX,nY:Integer;nType,nTime:Integer);
    destructor Destroy; override;
  end;
  TFireBurnEvent = class(TEvent) //Áö¿°¼ú
    m_dwRunTick1    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;

  TThunderBurnEvent = class(TEvent) //º¹È£Àå
    m_dwRunTick1    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;

  TAllFireEvent = class(TEvent) //¸¸Ãµ¿°¿Á
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;

  TAllThunderEvent = class(TEvent) //¿îÁß·Ú°Ý
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;
  TBlizzardEvent = class(TEvent)  //Ãµ»óºùÈ¯
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TMeteorEvent = class(TEvent)  //Ãµ»ó³«¿°
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TDragonEvent = class(TEvent)  //¿ë¼ÚÀ½
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TMahulEvent = class(TEvent)  //¸¶Ç÷³­¹«
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TOhaengEvent = class(TEvent)  //À½¾ç¿ÀÇàÁø
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TYeongMuEvent = class(TEvent)  //¿ù¿µ¹«
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nDamage:Integer);
    destructor Destroy; override;
    procedure Run(); override;
  end;

  TPoisonCloud = class(TEvent)    //µ¶¹«
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nPower:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;

  TChunGong = class(TEvent)    //Ãµ°ø
    m_dwRunTick    :LongWord;
  public
    constructor Create(Creat:TBaseObject;nX,nY:Integer;nType:Integer;nTime,nPower:Integer);
    destructor Destroy; override;
    procedure Run();override;
  end;
  TEventManager = class  //0x0C
    m_EventList       :TGList;
    m_ClosedEventList :TGList;
  public
    constructor Create();
    destructor Destroy; override;
    function   GetEvent(Envir:TEnvirnoment;nX,nY:Integer;nType:Integer):TEvent;
    function GetRangeEvent(Envir: TEnvirnoment; OwnBaseObject: TBaseObject; nX, nY, nRange: Integer; nType: Integer): Integer;
    procedure  AddEvent(Event:TEvent);
    function GetLockEvent(Envir: TEnvirnoment; List: TList): Integer;
    procedure  Run();
  end;
implementation

uses M2Share;

{ TEvent }

constructor TEvent.Create(tEnvir: TEnvirnoment; ntX, ntY, nType, dwETime: Integer;boVisible:Boolean); //004A7B68
begin
  m_dwOpenStartTick:=GetTickCount();
  m_nEventType:=nType;
  m_nEventParam:=0;
  m_dwContinueTime:=dwETime;
  m_boVisible:=boVisible;
  m_boClosed:=False;
  m_Envir:=tEnvir;
  m_nX:=ntX;
  m_nY:=ntY;
  m_boActive:=True;
  m_nDamage:=0;
  m_nEventMove:=True;
  m_OwnBaseObject:=nil;
  m_dwRunStart:=GetTickCount();
  m_dwRunTick:=500;

  if (m_Envir <> nil) and (m_boVisible) then begin
    m_Envir.AddToMap(m_nX,m_nY,OS_EVENTOBJECT,Self);
  end else m_boVisible:=False;
  //EventCheck.Add(Self);
end;

destructor TEvent.Destroy;
begin
  inherited Destroy;
end;

procedure TEvent.Close; //004A7C8C
begin
  m_dwCloseTick:=GetTickCount();
  if m_boVisible then begin
    m_boVisible:=False;
    if m_Envir <> nil then begin
      m_Envir.DeleteFromMap(m_nX,m_nY,OS_EVENTOBJECT,Self);
    end;
    m_Envir:=nil;
  end;
end;

procedure TEvent.Run; //004A7CE0
begin
  if (GetTickCount - m_dwOpenStartTick) > m_dwContinueTime then begin
    m_boClosed:=True;
    Close();
  end;
  if (m_OwnBaseObject <> nil) and (m_OwnBaseObject.m_boGhost or (m_OwnBaseObject.m_boDeath)) then
    m_OwnBaseObject:=nil;
end;


{ TStoneMineEvent }

constructor TStoneMineEvent.Create(Envir: TEnvirnoment; nX, nY,
  nType: Integer); //004A7D0C
begin
  inherited Create(Envir,nX,nY,nType,0,False);
  m_Envir.AddToMapMineEvent(nX,nY,OS_EVENTOBJECT,Self);
  m_boVisible:=False;
  m_nMineCount:=Random(200);
  m_dwAddStoneMineTick:=GetTickCount();
  m_boActive:=False;
  m_nAddStoneCount:=Random(80);
end;

destructor TStoneMineEvent.Destroy;
begin

  inherited;
end;

procedure TStoneMineEvent.AddStoneMine; //004A7DB8
begin
  m_nMineCount:=m_nAddStoneCount;
  m_dwAddStoneMineTick:=GetTickCount();
end;

{ THolyCurtainEvent }

constructor THolyCurtainEvent.Create(Envir: TEnvirnoment; nX, nY, nType,  nTime: Integer); //004A7E60
begin
  inherited Create(Envir,nX,nY,nType,nTime,True);
end;

destructor THolyCurtainEvent.Destroy;
begin

  inherited;
end;

{ TFireBurnEvent }

constructor TFireBurnEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer); //004A7EBC  //Áö¿°¼ú
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_nEventMove := False;
  m_OwnBaseObject:=Creat;
end;

destructor TFireBurnEvent.Destroy;   //Áö¿°¼ú
begin

  inherited;
end;

procedure TFireBurnEvent.Run; //004A7F30     //Áö¿°¼ú
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
begin
  if (GetTickCount - m_dwRunTick1) > 3000 then begin
    m_dwRunTick1:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;



{ TThunderBurnEvent }

constructor TThunderBurnEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer); //004A7EBC  ///º¹È£Àå
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_nEventMove := False;
  m_OwnBaseObject:=Creat;
end;

destructor TThunderBurnEvent.Destroy;   //º¹È£Àå
begin

  inherited;
end;

procedure TThunderBurnEvent.Run; //004A7F30     //º¹È£Àå
var
  I, MoC, Dur: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
begin
  if (GetTickCount - m_dwRunTick1) > 3000 then begin
    m_dwRunTick1:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
          if m_OwnBaseObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then begin
             if (TargeTBaseObject.m_wStatusTimeArr[POISON_THUNDER] = 0) and (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin
               MoC := 1;
               if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
               if ((MoC = 1) and (Random(55) < 20)) or ((MoC = 2) and (Random(50) < 15)) then begin
                 Dur := Round( m_OwnBaseObject.m_nLuck + 3 + 5 * 3);
                 TargeTBaseObject.MakePosion(POISON_THUNDER, Dur, m_nDamage);
               end;
             end;
          end;
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{ TAllFireEvent }

constructor TAllFireEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //¸¸Ãµ¿°¿Á
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_nEventMove := False;
  m_OwnBaseObject:=Creat;
end;

destructor TAllFireEvent.Destroy;   //¸¸Ãµ¿°¿Á
begin

  inherited;
end;

procedure TAllFireEvent.Run;    //¸¸Ãµ¿°¿Á
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
begin
  if (GetTickCount - m_dwRunTick) > 2000 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;


{ TAllThunderEvent }

constructor TAllThunderEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //¿îÁß·Ú°Ý
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_nEventMove := False;
  m_OwnBaseObject:=Creat;
end;

destructor TAllThunderEvent.Destroy;  //¿îÁß·Ú°Ý
begin

  inherited;
end;

procedure TAllThunderEvent.Run;    //¿îÁß·Ú°Ý
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
begin
  if (GetTickCount - m_dwRunTick) > 2000 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{TBlizzardEvent}

constructor TBlizzardEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //Ãµ»óºùÈ¯
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,False);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
end;

destructor TBlizzardEvent.Destroy;
begin

  inherited;
end;

procedure TBlizzardEvent.Run;     //Ãµ»óºùÈ¯
var
  I, MoC, Gap, Dur:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 1200 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
           TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
            if (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin
              MoC := 1;
              Gap := TargeTBaseObject.m_WAbil.Level - m_OwnBaseObject.m_WAbil.Level;
              if Gap > 10 then
                Gap := 10;
              if Gap < -10 then
                Gap := -10;
              if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then
                MoC := 2;
              if Random(100) < (20 + (1 - Gap) div Moc) then begin
                Dur := (10000) div 1000;
               if (MoC = 1) and (Random(10) = 0) then
                TargeTBaseObject.MakePosion(POISON_SLOWDOWN, Dur, 1)
                else
               if (MoC = 2) and (Random(100) = 0) then
                TargeTBaseObject.MakePosion(POISON_SLOWDOWN, Dur, 1)
                else
                  TargeTBaseObject.MakePosion(POISON_SLOWDOWN, Dur + 1, 1);
              end;
            end;
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;


{TMeteorEvent}

constructor TMeteorEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //Ãµ»ó³«¿°
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,False);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
end;

destructor TMeteorEvent.Destroy;
begin

  inherited;
end;

procedure TMeteorEvent.Run;    //Ãµ»ó³«¿°
var
  I, MoC, Gap, Dur:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 1200 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
           TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;



{TDragonEvent}
constructor TDragonEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //¿ë¼ÚÀ½
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
end;

destructor TDragonEvent.Destroy;
begin
  inherited;
end;
procedure TDragonEvent.Run;
var
  I, push, nDir:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 2000 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          if (Random(20) < 4) then begin
            TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
            TargeTBaseObject.SendRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,NE_DRAGON_3,'0');
          end;
          if (not TargeTBaseObject.m_boDeath) then begin
            if (m_OwnBaseObject.m_Abil.Level > TargeTBaseObject.m_Abil.Level) and (not TargeTBaseObject.m_boStickMode) then begin
              if Random(6) < 2 then begin
                push := 2 + Random(1);
                nDir:= GetNextDirection (m_OwnBaseObject.m_nCurrX, m_OwnBaseObject.m_nCurrY, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY);
                TargeTBaseObject.CharPushed (nDir, push);
              end;
            end;
          end;
        end;
      end;
      if (Random(20) < 3) then begin
        m_OwnBaseObject.SendRefMsg(RM_10205,0,m_nX,m_nY,NE_DRAGON_2,'0');
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;


{TMahulEvent}

constructor TMahulEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);  //¸¶Ç÷³­¹«
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
end;

destructor TMahulEvent.Destroy;
begin
  inherited;
end;

procedure TMahulEvent.Run;    //¸¶Ç÷³­¹«
var
  I, MoC, Gap, Dur:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 1200 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
           TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{TOhaengEvent}

constructor TOhaengEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);     //À½¾ç¿ÀÇàÁø
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
end;

destructor TOhaengEvent.Destroy;
begin
  inherited;
end;

procedure TOhaengEvent.Run;    //À½¾ç¿ÀÇàÁø
var
  I:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 3000 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if ( m_OwnBaseObject <> nil ) and ( TargeTBaseObject <> nil ) then begin
          if (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
              TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
              TargeTBaseObject.SendRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,123,'0');
          end else begin
            if m_OwnBaseObject.IsProperFriend (TargeTBaseObject) then begin
              TargeTBaseObject.HeathRecoveryOhaeng(3, m_nDamage);

              if TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_SLOWDOWN] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_SLOWDOWN] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_DAMAGEARMOR] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_DAMAGEARMOR] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_THUNDER] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_THUNDER] := 1;
              end;
              if TargeTBaseObject.m_wStatusTimeArr[POISON_HEMORRHAGE] <> 0 then begin
                TargeTBaseObject.m_wStatusTimeArr[POISON_HEMORRHAGE] := 1;
              end;
            end;
          end;
        end else begin
          m_boClosed:=True;
          Close;
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{TYeongMuEvent}

constructor TYeongMuEvent.Create(Creat: TBaseObject; nX, nY, nType, nTime,nDamage: Integer);   //¿ù¿µ¹«
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,False);
  m_nDamage:=nDamage;
  m_OwnBaseObject:=Creat;
  m_dwRunTick:=GetTickCount();
end;

destructor TYeongMuEvent.Destroy;
begin

  inherited;
end;

procedure TYeongMuEvent.Run;    //¿ù¿µ¹«
var
  I, MoC, Gap, Dur:    integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  BaseObject: TBaseObject;
  UserMagic: pTUserMagic;
begin
  if (GetTickCount - m_dwRunTick) > 3000 then begin
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to  BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
           TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{ TPoisonCloud }

constructor TPoisonCloud.Create(Creat: TBaseObject; nX, nY, nType, nTime,nPower: Integer);   //µ¶¹«
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nPower;
  m_OwnBaseObject:=Creat;
end;

destructor TPoisonCloud.Destroy;
begin
  inherited;
end;
procedure TPoisonCloud.Run; //004A7F30   //µ¶¹«
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  PlayObject: TBaseObject;
  WAbil:pTAbility;
  nPower: Integer;
  nTime2: Integer;
begin
  if (GetTickCount - m_dwRunTick) > 1800 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
          nTime2 := 10 + Random(10) - TargeTBaseObject.m_nPoisonRecover;
          TargeTBaseObject.MakePosion(POISON_DECHEALTH, nTime2, 20 + Random(10));
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{ TChunGong }

constructor TChunGong.Create(Creat: TBaseObject; nX, nY, nType, nTime,nPower: Integer);   //µ¶¹«
begin
  inherited Create(Creat.m_PEnvir,nX,nY,nType,nTime,True);
  m_nDamage:=nPower;
  m_OwnBaseObject:=Creat;
end;

destructor TChunGong.Destroy;
begin
  inherited;
end;
procedure TChunGong.Run;  //Ãµ°ø
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
  PlayObject: TBaseObject;
  WAbil:pTAbility;
  nPower: Integer;
  nTime2: Integer;
begin
  if (GetTickCount - m_dwRunTick) > 1800 then begin
    m_dwRunTick:=GetTickCount();
    BaseObjectList:=TList.Create;
    if m_Envir <> nil then begin
      m_Envir.GeTBaseObjects(m_nX,m_nY,True,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
        if (TargeTBaseObject <> nil) and (m_OwnBaseObject <> nil) and (m_OwnBaseObject.IsProperTarget(TargeTBaseObject)) then begin
          TargeTBaseObject.SendMsg(m_OwnBaseObject,RM_MAGSTRUCK_MINE,0,m_nDamage,0,0,'');
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  inherited;
end;

{ TPileStones }

constructor TPileStones.Create(Envir: TEnvirnoment; nX, nY, nType,
  nTime: Integer); //004A7DDC
begin
  inherited Create(Envir,nX,nY,nType,nTime,True);
  m_nEventParam:=1;
end;

destructor TPileStones.Destroy;
begin

  inherited;
end;

procedure TPileStones.AddEventParam;//sub_4A7E44;
begin
  if m_nEventParam < 5 then Inc(m_nEventParam);    
end;



{ TEventManager }
procedure TEventManager.Run; //004A8190
var
  i: Integer;
  Event:TEvent;
begin
  m_EventList.Lock;
  try
    for i := m_EventList.Count -1 downto 0 do begin
      Event:=TEvent(m_EventList.Items[i]);
      if Event.m_boActive and ((GetTickCount - Event.m_dwRunStart) > Event.m_dwRunTick) then begin
        Event.m_dwRunStart:=GetTickcount();
        Event.Run();

        if Event.m_boClosed then begin
          m_ClosedEventList.Lock;
          try
            m_ClosedEventList.Add(Event);
          finally
            m_ClosedEventList.UnLock;
          end;
          m_EventList.Delete(i);
        end;
      end;
    end;
  finally
    m_EventList.UnLock;
  end;


  m_ClosedEventList.Lock;
  try
    for i := m_ClosedEventList.Count -1 downto 0 do begin
      Event:=TEvent(m_ClosedEventList.Items[i]);
      if (GetTickCount - Event.m_dwCloseTick) > 5 * 60 * 1000 then begin
        m_ClosedEventList.Delete(i);
        Event.Free;
      end;
    end;
  finally
    m_ClosedEventList.UnLock;
  end;
end;

function TEventManager.GetEvent(Envir: TEnvirnoment; nX, nY,
  nType: Integer): TEvent; //004A810C
var
  I: Integer;
  Event:TEvent;
begin
  Result:=nil;
  m_EventList.Lock;
  try
    for I := 0 to m_EventList.Count - 1 do begin
      Event:=TEvent(m_EventList.Items[i]);
      if (Event.m_Envir = Envir) and
         (Event.m_nX = nX) and
         (Event.m_nY = nY) and
         (Event.m_nEventType = nType) then begin

        Result:=Event;
        break;
      end;
    end;
  finally
    m_EventList.UnLock;
  end;
end;

function TEventManager.GetRangeEvent(Envir: TEnvirnoment; OwnBaseObject: TBaseObject;
  nX, nY, nRange: Integer; nType: Integer): Integer;
var
  I: Integer;
  Event: TEvent;
begin
  Result := 0;
  m_EventList.Lock;
  try
    if m_EventList.Count > 0 then begin//20080630
      for I := 0 to m_EventList.Count - 1 do begin
        Event := TEvent(m_EventList.Items[I]);
        if (Event.m_OwnBaseObject = OwnBaseObject) and
          (abs(Event.m_nX - nX) <= nRange) and
          (abs(Event.m_nY - nY) <= nRange) and
          (Event.m_nEventType = nType) then begin
          Inc(Result);
        end;
      end;
    end;
  finally
    m_EventList.UnLock;
  end;
end;


procedure TEventManager.AddEvent(Event: TEvent); //004A80EC
begin
  m_EventList.Lock;
  try
    m_EventList.Add(Event);
  finally
    m_EventList.UnLock;
  end;
end;

function TEventManager.GetLockEvent(Envir: TEnvirnoment; List: TList): Integer;
var
  I: Integer;
  Event: TEvent;
begin
  Result := 0;
  if List = nil then Exit;
  m_EventList.Lock;
  try
    for I := 0 to m_EventList.Count - 1 do begin
      Event := TEvent(m_EventList.Items[I]);
      if Event.m_boVisible and (not Event.m_boClosed) and (Event.m_Envir = Envir) and
        (Event.m_nEventType = ET_MAGICLOCK) then begin
        List.Add(Event);
      end;
    end;
    Result := List.Count;
  finally
    m_EventList.UnLock;
  end;
end;

constructor TEventManager.Create(); //004A8014
begin
  m_EventList:=TGList.Create;
  m_ClosedEventList:=TGList.Create;
end;

destructor TEventManager.Destroy;
var
  I: Integer;
begin
  for I := 0 to m_EventList.Count - 1 do begin
    TEvent(m_EventList.Items[i]).Free;
  end;
  m_EventList.Free;
  for I := 0 to m_ClosedEventList.Count - 1 do begin
    TEvent(m_ClosedEventList.Items[i]).Free;
  end;
  m_ClosedEventList.Free;
  inherited;
end;



{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Event.pas 517 2006-12-15 14:54:40Z damian $');
end.
