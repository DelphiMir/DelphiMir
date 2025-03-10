unit VailantFight;

interface
uses
  {svn, }Windows, Classes, SysUtils, IniFiles, Grobal2,SDK, ObjBase, ObjMon2, Guild, Envir;
const
  MAXCASTLEARCHER = 22;
  MAXCALSTEGUARD  = 4;
type
  TDefenseUnit = record
    nMainDoorX    :Integer;     //0x00
    nMainDoorY    :Integer;     //0x04
    sMainDoorName :String;      //0x08
    boXXX         :Boolean;     //0x0C
    wMainDoorHP   :Word;        //0x10
    MainDoor      :TBaseObject;
    LeftWall      :TBaseObject;
    CenterWall    :TBaseObject;
    RightWall     :TBaseObject;
    Archer        :TBaseObject;
  end;
  pTDefenseUnit = ^TDefenseUnit;
  TObjUnit = record
    nX            :Integer;   //0x0
    nY            :Integer;   //0x4
    sName         :String;    //0x8
    nStatus       :Boolean;   //0x0C
    nHP           :Integer;   //0x10
    BaseObject    :TBaseObject; //0x14
  end;
  pTObjUnit = ^TObjUnit;
  TAttackerInfo = record
    AttackDate    :TDateTime;
    sGuildName    :String;
    Guild         :TGuild;
  end;
  pTAttackerInfo = ^TAttackerInfo;
  TVailantSystem = class
    m_nPlayerLevelMin    :Integer;        //ÀüÀåÀÌ¿ë ÃÖ¼Ò·¹º§
    m_nPlayerCountMin    :Integer;        //ÀüÀåÀÌ¿ë ÃÖ¼ÒÀÎ¿ø
    m_nPlayerCountMax    :Integer;        //ÀüÀåÀÌ¿ë ÃÖ´ëÀÎ¿ø

    m_WaitingRoomMap     :TEnvirnoment;   //ÀüÀå ´ë±â½Ç
    m_sWaitingMapName    :String;
    m_WaitingX           :Integer;        //´ë±â½Ç Ã³À½ ÀÔÀå À§Ä¡
    m_WaitingY           :Integer;
    m_EndX               :Integer;        //ÀüÀå Á¾·á½Ã º¹±Í À§Ä¡
    m_EndY               :Integer;

    m_nAdmissionTime     :Byte;           //ÀüÀå ´ë±â½Ç Àç ÀÔÀå ´ë±â½Ã°£
    m_dwAdmissionTick    :LongWord;

    m_VailantMap         :TEnvirnoment;   //ÀüÀå ¸Ê
    m_sVailantMapName    :String;
    m_nVailantTime       :Byte;           //ÀüÀå½Ã°£ 30ºÐ
    m_dwStartVailantTick :LongWord;       //ÀüÀåÀÌ¿ë½Ã°£ Ã¼Å©

    m_RedSafeX           :Integer;        //ÀüÀå ·¹µåÆÀ ¾ÈÀüÁö¿ª(ÀÔÀå, Á×¾úÀ»¶§)
    m_RedSafeY           :Integer;
    m_RedAttackX         :Integer;        //ÀüÀå ·¹µåÆÀ °ø°ÝÀÌµ¿ÁöÁ¡
    m_RedAttackY         :Integer;

    m_BlueSafeX          :Integer;        //ÀüÀå ºí·çÆÀ ¾ÈÀüÁö¿ª(ÀÔÀå, Á×¾úÀ»¶§)
    m_BlueSafeY          :Integer;
    m_BlueAttackX        :Integer;        //ÀüÀå ºí·çÆÀ °ø°ÝÀÌµ¿ÁöÁ¡
    m_BlueAttackY        :Integer;

    m_nWinnerPoint       :Integer;       //½Â¸®Á¶°Ç 5000Á¡
    m_nSunPoint          :Integer;       //ÅÂ¾çÀÇºñ¼® Á¡·É½Ã
    m_nMoonPoint         :Integer;       //´ÞÀÇºñ¼® Á¡·É½Ã
    m_nThunderPoint      :Integer;       //¹ø°³ÀÇ ºñ¼® Á¡·É½Ã
    m_nTwoOccupyPoint    :Integer;       //2°÷ Á¡·É½Ã Ãß°¡È¹µæ
    m_nThreeOccupyPoint  :Integer;       //3°÷ Á¡·É½Ã Ãß°¡È¹µæ
    m_nEnemyKillPoint    :Integer;       //ÀûÀ» Á×¿´À» ½Ã È¹µæÁ¡¼ö

    m_MapCastle          :TEnvirnoment;   //0x4    »çºÏ¼º
    m_MapPalace          :TEnvirnoment;   //³»¼º, ÀÌ ¸ÊÀ» Á¡·ÉÇÏ¸é ¼ºÀ» Á¡·ÉÇÑ °ÍÀ¸·Î ÇÑ´Ù.
    m_MapSecret          :TEnvirnoment;   //0xC    ºñ¹Ð
    m_DoorStatus         :pTDoorStatus;  //0x10    ³»¼º¹®
    m_sMapName           :String;      //0x14     //°ø¼ºÁö¿ª
    m_sMapPalace         :String;
    m_sCastlePalace         :String;
    m_nCastleHomeX             :Integer;     //0x28     ÐÐ»á»Ø³ÇµãX
    m_nCastleHomeY             :Integer;     //0x2C     ÐÐ»á»Ø³ÇµãY
    m_sName              :String;      //0x18     ³Ç±¤Ãû³Æ
    m_sMName             :string;      //µÎ°³ÀÇ ¼ºÀ» ¸ðµÎ Á¡·ÉÇßÀ»¶§
    m_sOwnGuild          :String[GuildNameLen];   //¼º¹®ÆÄ¸í
    m_MasterGuild        :TGuild;      //0x20     //¼º¹®
    m_sHomeMap           :String;      //0x24     ÐÐ»á»Ø³ÇµãµØÍ¼
    m_nHomeX             :Integer;     //0x28     ÐÐ»á»Ø³ÇµãX
    m_nHomeY             :Integer;     //0x2C     ÐÐ»á»Ø³ÇµãY

    m_sATHomeMap         :String;      //0x24     °ø°ÝÁø¿µ
    m_nATHomeX           :Integer;     //0x28     °ø°ÝÁø¿µX
    m_nATHomeY           :Integer;     //0x2C     °ø°ÝÁø¿µY

    m_sOutHomeMap        :String;      //0x24     °ø°ÝÁø¿µ
    m_nOutHomeX          :Integer;     //0x28     °ø°ÝÁø¿µX
    m_nOutHomeY          :Integer;     //0x2C     °ø°ÝÁø¿µY

    m_ChangeDate         :TDateTime;   //0x30     //¸¶Áö¸·À¸·Î ¼ºÀÇ ÁÖÀÎÀÌ ¹Ù²ï ½Ã°£
    m_WarDate            :TDateTime;   //0x38     //¸¶Áö¸·À¸·Î °ø¼ºÀüÀÌ ½ÃÀÛµÈ ½Ã°£
    m_boStartWar         :Boolean;     //0x40     ÊÇ·ñ¿ªÊ¼¹¥³Ç
    m_boUnderWar         :Boolean;     //0x41     //°ø¼ºÀü ÁßÀÎÁö
    m_boShowOverMsg      :Boolean;     //0x42     ÊÇ·ñÒÑÏÔÊ¾¹¥³Ç½áÊøÐÅÏ¢

    m_dwStartCastleWarTick  :LongWord;  //0x44
    m_boShowWatStartMsg      :Boolean;
    CastleWarStartTimeMinute, OCastleWarStartTimeMinute :Integer;

    m_dwSaveTick         :LongWord;     //0x48
     //°ø¼ºÀüÀÇ °ø°ÝÀÚ¿¡ °ü·Ã
    m_MainDoor           :TObjUnit;    //0x54        //¼º¹®
    m_FirstDoor          :TObjUnit;
    m_SecondDoor         :TObjUnit;
    m_LeftCastleWall      :TObjUnit;
    m_RightCastleWall     :TObjUnit;

    m_LeftWall           :TObjUnit;    //0x6C
    m_CenterWall         :TObjUnit;    //0x84
    m_RightWall          :TObjUnit;    //0x9C
    m_WallFlag           :TObjUnit;    //Á¡·É±ê¹ß
    m_Guard              :array [0..MAXCALSTEGUARD -1] of TObjUnit;  //0xB4
    m_Archer             :array [0..MAXCASTLEARCHER -1] of TObjUnit;   //0x114 0x264
    m_IncomeToday        :TDateTime;   //0x238       //¿À´Ã ¼¼±ÝÀ» °È±â ½ÃÀÛÇÑ ÀÏ
    m_nTotalGold         :Integer;     //0x240       //ÀüÃ¼ ¼¼±ÝÀ¸·Î °ÈÈù µ·(¼ºÀÇ ÀÚ±Ý), 1000¸¸¿øÀÌ»ó µÑ ¼ö ¾ø´Ù.
    m_nTodayIncome       :Integer;     //0x244       //±ÝÀÏ ¼¼±ÝÀ¸·Î °ÈÈù µ·, 10¸¸¿øÀ» ³ÑÀ» ¼ö ¾ø´Ù.

    m_boStatus           :Boolean;
    m_nTechLevel         :Integer; //¿Æ¼¼µÈ¼¶
    m_nPower             :Integer; //µçÁ¦Á¿
  private
    procedure LoadConfig();
    procedure SetTechLevel(nLevel:Integer);
    procedure SetPower(nPower:Integer);
  public
    constructor Create(sCastleDir:String);
    destructor Destroy; override;
    procedure Initialize();
    procedure Run();               //10ÃÊ¿¡ ÇÑ¹ø
    function InCastleWarArea(Envir:TEnvirnoment):Boolean;
    function InCastleArea(Envir:TEnvirnoment;nX,nY:Integer):Boolean;

    function IsMember(Cert:TBaseObject):Boolean;
    function IsMasterGuild(Guild:TGuild):Boolean;

    function IsDefenseGuild(Guild:TGuild):Boolean;
    function IsDefenseAllyGuild(Guild:TGuild):Boolean;
    function IsDefenseWarGuild(Guild:TGuild):Boolean;

    procedure GetCastle(Guild:TGuild);
    procedure StartWallUnitOn;
    procedure StartWallconquestWar;
    procedure StopWallconquestWar();
    function GetHomeX():Integer;
    function GetHomeY():Integer;
    function GetMapName():String;
    function GetATHomeX():Integer;
    function GetATHomeY():Integer;
    function GetATMapName():String;
    function GetHMapName():String;
    function GetHHomeX():Integer;
    function GetHHomeY():Integer;

    function GetOutMapName():String;
    function GetOutHomeX():Integer;
    function GetOutHomeY():Integer;

    function CheckInPalace(nX,nY:Integer;Cert:TBaseObject):Boolean;
    function  GetWarDate():String;
    procedure IncRateGold(nGold:Integer);
    function  WithDrawalGolds(PlayObject:TPlayObject;nGold:Integer):Integer;
    function  ReceiptGolds(PlayObject:TPlayObject;nGold:Integer):Integer;
    procedure MainDoorControl(boClose:Boolean);   //»çºÏ Á¤¹®
    procedure FirstDoorControl(boClose:Boolean);
    procedure SecondDoorControl(boClose:Boolean);
    function  RepairDoor():Boolean;
    function  RepairFirstDoor():Boolean;
    function  RepairSecondDoor():Boolean;
    function  RepairSabukWall(nWallIndex:Integer):Boolean;
    function  RepairNammanWall(nWallIndex:Integer):Boolean;

    procedure  RepairAll(castlename:string);
    property  nTechLevel:Integer read m_nTechLevel write SetTechLevel;
    property  nPower:Integer read m_nPower write SetPower;
  end;

  TVailantManager = class
  private

    CriticalSection :TRTLCriticalSection;
  protected
 
  public
    m_CastleList    :TList;
    constructor Create();
    destructor Destroy; override;
    procedure LoadCastleList();
    procedure SaveCastleList();
    procedure Initialize();
    procedure Lock;
    procedure UnLock;
    procedure Run();
    function  Find(sCastleName:String):TVailantSystem;
    function  GetCastle(nIndex:Integer):TVailantSystem;
    function  InCastleWarArea(BaseObject:TBaseObject):TVailantSystem;overload;
    function  InCastleWarArea(Envir:TEnvirnoment):TVailantSystem;overload;
    function  InCastleArea(BaseObject:TBaseObject):TVailantSystem;overload;
    function  InCastleArea(Envir:TEnvirnoment;nX,nY:Integer):TVailantSystem;overload;
    function  IsCastleMember(BaseObject:TBaseObject):TVailantSystem;

    function  IsMasterCastleMember(BaseObject:TBaseObject):TVailantSystem;   //Á¤º¹ÀÚ È®ÀÎ

    function  IsCastleEnvir(Envir:TEnvirnoment):TVailantSystem;
    procedure GetCastleGoldInfo(List:TStringList);
    procedure GetCastleNameList(List:TStringList);
    procedure IncRateGold(nGold:Integer);
  end;
implementation

uses UsrEngn, M2Share, HUtil32, svMain, DateUtils;

{ TVailantSystem }
constructor TVailantSystem.Create(sCastleDir:String);//0048E438
begin
  m_MasterGuild :=nil;
  if sCastleDir = '0' then begin
    m_sHomeMap    := g_Config.sSabukCastleHomeMap;
    m_nHomeX      := g_Config.nSabukCastleHomeX;
    m_nHomeY      := g_Config.nSabukCastleHomeY;
    m_sName       := g_Config.sSabukCastleName;

    m_sATHomeMap  := g_Config.sSabukCastleHomeMap;
    m_nATHomeX    := 316;
    m_nATHomeY    := 264;
    m_sMapPalace  := '0150';
    m_sCastlePalace  := '3';
    m_nCastleHomeX := 644;
    m_nCastleHomeY := 290;

    m_sOutHomeMap  := '3';
    m_nOutHomeX := 677;
    m_nOutHomeY := 340;

    m_sATHomeMap  := g_Config.sSabukCastleHomeMap;
    m_nATHomeX    := 316;
    m_nATHomeY    := 264;
  end else begin
    m_sHomeMap    := g_Config.sNammanCastleHomeMap;
    m_nHomeX      := g_Config.nNammanCastleHomeX;
    m_nHomeY      := g_Config.nNammanCastleHomeY;
    m_sName       := g_Config.sNammanCastleName;

    m_sATHomeMap  := g_Config.sNammanCastleHomeMap;
    m_nATHomeX    := 95;
    m_nATHomeY    := 243;

    m_sOutHomeMap  := 'NAMMAN2';
    m_nOutHomeX := 93;
    m_nOutHomeY := 240;

    m_sMapPalace  := 'NAMMAN2';
    m_sCastlePalace  := 'NAMMAN2';
    m_nCastleHomeX := 207;
    m_nCastleHomeY := 153;
  end;
  m_sMName      := '³ÇÖ÷';
  CastleWarStartTimeMinute := -1;
  OCastleWarStartTimeMinute := -1;

  m_MapCastle   := nil;
  m_MapPalace   := nil;
  m_DoorStatus  := nil;
  m_boStartWar  := False;
  m_boUnderWar  := False;                  //¸ÅÀÏ 20½Ã¿¡ Ã¼Å© ¿©ºÎ
  m_boShowOverMsg   := False;
  m_boShowWatStartMsg := False;
  m_dwSaveTick      := 0;
end;
destructor TVailantSystem.Destroy;//0048E51C
begin
  inherited;
end;
procedure TVailantSystem.Initialize; //0048E564
var
  i:Integer;
  ObjUnit:pTObjUnit;
  Door:pTDoorInfo;
begin
  LoadConfig();
  if g_MapManager.GetMapOfServerIndex(m_sMapName) = nServerIndex then begin

    m_MapPalace := g_MapManager.FindMap(m_sMapPalace);
    if m_MapPalace = nil then begin
      MainOutMessage(format('°ø¼ºÁö¿ª ¸Ê¿À·ù : %s', [m_sMapPalace]));
    end;

    m_MapCastle := g_MapManager.FindMap(m_sMapName);
    if m_MapCastle <> nil then begin
      if m_sMapName = 'SABUK_CASTLE1' then begin
        m_MainDoor.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_MainDoor.nX,m_MainDoor.nY,m_MainDoor.sName);
        if m_MainDoor.BaseObject <> nil then begin
           m_MainDoor.BaseObject.m_WAbil.HP:= m_MainDoor.nHP;
           m_MainDoor.BaseObject.m_Castle:=Self;
           if m_MainDoor.nStatus then begin
              TCastleDoor(m_MainDoor.BaseObject).Open;
           end;
        end else begin
          MainOutMessage('[Error] UserCastle.Initialize MainDoor.UnitObj: ' + m_MainDoor.sName);
        end;
      end;
      if m_sMapName = 'NAMMAN_CASTLE' then begin
        m_FirstDoor.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_FirstDoor.nX,m_FirstDoor.nY,m_FirstDoor.sName);
        if m_FirstDoor.BaseObject <> nil then begin
           m_FirstDoor.BaseObject.m_WAbil.HP:= m_FirstDoor.nHP;
           m_FirstDoor.BaseObject.m_Castle:=Self;
           if m_FirstDoor.nStatus then begin
              TNammanCastleDoor(m_FirstDoor.BaseObject).Open;
           end;
        end else begin
          MainOutMessage('[Error] UserCastle.Initialize FirstDoor.UnitObj: ' + m_FirstDoor.sName);
        end;

        m_SecondDoor.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_SecondDoor.nX,m_SecondDoor.nY,m_SecondDoor.sName);
        if m_SecondDoor.BaseObject <> nil then begin
           m_SecondDoor.BaseObject.m_WAbil.HP:= m_SecondDoor.nHP;
           m_SecondDoor.BaseObject.m_Castle:=Self;
           if m_SecondDoor.nStatus then begin
              TNammanCastleDoor2(m_SecondDoor.BaseObject).Open;
           end;
        end else begin
          MainOutMessage('[Error] UserCastle.Initialize SecondDoor.UnitObj: ' + m_SecondDoor.sName);
        end;
      end;

      m_LeftCastleWall.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_LeftCastleWall.nX,m_LeftCastleWall.nY,m_LeftCastleWall.sName);
      if m_LeftCastleWall.BaseObject <> nil then begin
         m_LeftCastleWall.BaseObject.m_WAbil.HP:= m_LeftCastleWall.nHP;
         m_LeftCastleWall.BaseObject.m_Castle:=Self;
      end else begin
        MainOutMessage('[Error] UserCastle.Initialize LeftCastleWall.UnitObj: ' + m_LeftCastleWall.sName);
      end;

      m_RightCastleWall.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_RightCastleWall.nX,m_RightCastleWall.nY,m_RightCastleWall.sName);
      if m_RightCastleWall.BaseObject <> nil then begin
         m_RightCastleWall.BaseObject.m_WAbil.HP:= m_RightCastleWall.nHP;
         m_RightCastleWall.BaseObject.m_Castle:=Self;
      end else begin
        MainOutMessage('[Error] UserCastle.Initialize RightCastleWall.UnitObj: ' + m_RightCastleWall.sName);
      end;

      for i:=Low(m_Archer) to High(m_Archer) do begin
        ObjUnit:=@m_Archer[i];
        if ObjUnit.nHP <= 0 then Continue;
        ObjUnit.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,ObjUnit.nX,ObjUnit.nY,ObjUnit.sName);
        if ObjUnit.BaseObject <> nil then begin
          ObjUnit.BaseObject.m_WAbil.HP:=m_Archer[i].nHP;
          ObjUnit.BaseObject.m_Castle:=Self;
          TGuardUnit(ObjUnit.BaseObject).m_nX550:=ObjUnit.nX;
          TGuardUnit(ObjUnit.BaseObject).m_nY554:=ObjUnit.nY;
          TGuardUnit(ObjUnit.BaseObject).m_nDirection:=3;
        end else begin
          MainOutMessage('[Error] UserCastle.Initialize Archer -> UnitObj: ' + ObjUnit.sName);
        end;
      end;
      for i:=Low(m_Guard) to High(m_Guard) do begin
        ObjUnit:=@m_Guard[i];
        if ObjUnit.nHP <= 0 then Continue;
        ObjUnit.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,ObjUnit.nX,ObjUnit.nY,ObjUnit.sName);
        if ObjUnit.BaseObject <> nil then begin
          ObjUnit.BaseObject.m_WAbil.HP:=m_Guard[i].nHP;
        end else begin
          MainOutMessage('[Error] UserCastle.Initialize Guard -> UnitObj = nil');
        end;
      end;

    end else begin
      MainOutMessage(Format('<Critical Error> UserCastle : [Defense]->CastleMap is invalid value (%s)', [m_sMapName]));
    end;
    //CODE:0048E935
  end;
end;
procedure TVailantSystem.LoadConfig();//0048F5BC
var
  sFileName:String;
  CastleConf:TIniFile;
begin
  sFileName:=g_Config.sEnvirDir + '¿ë¸ÍÀÇÀüÀå.txt';
  CastleConf:=TIniFile.Create(sFileName);
  if CastleConf <> nil then begin
    m_nPlayerLevelMin    :=  CastleConf.ReadInteger('Setup','PlayerLevelMin',m_nPlayerLevelMin);
    m_nPlayerCountMin    :=  CastleConf.ReadInteger('Setup','PlayerCountMin',m_nPlayerCountMin);
    m_nPlayerCountMax    :=  CastleConf.ReadInteger('Setup','PlayerCountMax',m_nPlayerCountMax);

    m_sWaitingMapName    :=  CastleConf.ReadString('Setup','WaitingRoomMap',m_sWaitingMapName);
    m_WaitingX           :=  CastleConf.ReadInteger('Setup','WaitingX',m_WaitingX);
    m_WaitingY           :=  CastleConf.ReadInteger('Setup','WaitingY',m_WaitingY);
    m_EndX               :=  CastleConf.ReadInteger('Setup','EndX',m_EndX);
    m_EndY               :=  CastleConf.ReadInteger('Setup','EndY',m_EndY);

    m_nAdmissionTime     :=  CastleConf.ReadInteger('Setup','AdmissionTime',m_nAdmissionTime);

    m_sVailantMapName    :=  CastleConf.ReadString('Setup','VailantMapName',m_sVailantMapName);
    m_nVailantTime       :=  CastleConf.ReadInteger('Setup','VailantTime',m_nVailantTime);

    m_RedSafeX           :=  CastleConf.ReadInteger('Setup','RedSafeX',m_RedSafeX);
    m_RedSafeY           :=  CastleConf.ReadInteger('Setup','RedSafeY',m_RedSafeY);
    m_RedAttackX         :=  CastleConf.ReadInteger('Setup','RedAttackX',m_RedAttackX);
    m_RedAttackY         :=  CastleConf.ReadInteger('Setup','RedAttackY',m_RedAttackY);

    m_BlueSafeX          :=  CastleConf.ReadInteger('Setup','BlueSafeX',m_BlueSafeX);
    m_BlueSafeY          :=  CastleConf.ReadInteger('Setup','BlueSafeY',m_BlueSafeY);
    m_BlueAttackX        :=  CastleConf.ReadInteger('Setup','BlueAttackX',m_BlueAttackX);
    m_BlueAttackY        :=  CastleConf.ReadInteger('Setup','BlueAttackY',m_BlueAttackY);

    m_nWinnerPoint       :=  CastleConf.ReadInteger('Point','WinnerPoint',m_nWinnerPoint);
    m_nSunPoint          :=  CastleConf.ReadInteger('Point','SunPoint',m_nSunPoint);
    m_nMoonPoint         :=  CastleConf.ReadInteger('Point','MoonPoint',m_nMoonPoint);
    m_nThunderPoint      :=  CastleConf.ReadInteger('Point','ThunderPoint',m_nThunderPoint);
    m_nTwoOccupyPoint    :=  CastleConf.ReadInteger('Point','TwoOccupyPoint',m_nTwoOccupyPoint);
    m_nThreeOccupyPoint  :=  CastleConf.ReadInteger('Point','ThreeOccupyPoint',m_nThreeOccupyPoint);
    m_nEnemyKillPoint    :=  CastleConf.ReadInteger('Point','EnemyKillPoint',m_nEnemyKillPoint);

    CastleConf.Free;
  end;
end;

procedure TVailantSystem.Run;//0048FE4C         //10ÃÊ¿¡ ÇÑ¹ø¾¿ µ·´Ù
var
  I: Integer;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  wWeek, wYear, wMonth, wDay: Word;
  AttackerInfo:pTAttackerInfo;
  s20:String;
ResourceString
  sWarStartMsg    = '%s°ø¼ºÀüÀÌ ½ÃÀÛµÇ¾ú½À´Ï´Ù.';
  sWarStopTimeMsg = '%s°ø¼ºÀüÀÌ %dºÐ ÈÄ, Á¾·áµË´Ï´Ù.';
  sWarStartTimeMsg = '%s°ø¼ºÀüÀÌ %dºÐ ÈÄ, ½ÃÀÛµË´Ï´Ù.';
  sExceptionMsg   = '[Exception] TVailantSystem::Run';
begin
try
  if nServerIndex <> g_MapManager.GetMapOfServerIndex(m_sMapName) then exit;

  DecodeDate(Now,Year,Month,Day);
  DecodeDate(m_IncomeToday,wYear,wMonth,wDay);

  //´ÙÀ½³¯·Î ³Ñ¾î°¡¸é ¿À´ÃÀÇ ¼öÀÍÀº ÃÊ±âÈ­ ½ÃÅ´
  if (Year <> wYear) or (Month <> wMonth) or (Day <> wDay) then begin
    m_nTodayIncome:=0;
    m_IncomeToday:=Now();
    m_boStartWar:=False;
  end;
  //¸ÅÀÏ ¿ÀÈÄ 8½Ã¸¶´Ù °ø¼ºÀü ½ÃÀÛÀ» È®ÀÎÇÑ´Ù.
  if not m_boStartWar and (not m_boUnderWar) then begin
    wWeek := DayOfTheWeek(Now) - 1;    //1:¿ù¿äÀÏ, 2:È­¿äÀÏ, 3:¼ö¿äÀÏ, 4:¸ñ¿äÀÏ ,5:±Ý¿äÀÏ , 6:Åä¿äÀÏ ,7:ÀÏ¿äÀÏ
    DecodeTime(Time, Hour, Min, Sec, MSec);
    if (wWeek = g_Config.nStartCastlewarDay) and (Hour = g_Config.nStartCastlewarTime) and (Min = g_Config.nStartCastlewarMin) then begin      //¿ÀÈÄ8½Ã
      m_boStartWar := True;;       //ÇÑ¹ø¸¸ °Ë»çÇÔ
      m_boUnderWar:=True;  //°ø¼ºÀü ½ÃÀÛ
      m_boShowOverMsg:=False;
      m_WarDate:=Now();
      m_dwStartCastleWarTick:=GetTickCount();;
       //°ø¼ºÀüÀÇ ½ÃÀÛÀ» ¾Ë¸°´Ù.
      if m_boUnderWar then begin
        StartWallconquestWar();
        StartWallUnitOn;
        UserEngine.SendServerGroupMsg(SS_212,nServerIndex,'');
        s20:=format(sWarStartMsg,[m_sName]);
        UserEngine.SendBroadCastMsgExt(s20,t_System);            //Àü¼­¹öÀÇ ÀüÀ½À¸·Î °øÁö°¡ ³ª°£´Ù.
        UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s20);
        MainOutMessage(s20);
        FirstDoorControl(True);
        SecondDoorControl(True);
        MainDoorControl(True);    //»çºÏ Á¤¹® //ÀÚµ¿À¸·Î ¼º¹®ÀÌ ´ÝÈû
      end;
    end;
    
  end;
  //Á×Àº °æºñ´Â »«´Ù.
  for i:=Low(m_Guard) to High(m_Guard) do begin
    if (m_Guard[i].BaseObject <> nil) and (m_Guard[i].BaseObject.m_boGhost) then begin
       m_Guard[i].BaseObject:=nil;
    end;
  end;
  for i:=Low(m_Archer) to High(m_Archer) do begin
    if (m_Archer[i].BaseObject <> nil) and (m_Archer[i].BaseObject.m_boGhost) then begin
       m_Archer[i].BaseObject:=nil;
    end;
  end;
  //°ø¼ºÀü ÁßÀÎ °æ¿ì, °ø¼ºÀü ½ÃÀÛÈÄ 3½Ã°£ÀÌ Áö³ª¸é °ø¼ºÀüÀÌ Á¾·áµÈ´Ù.
  if m_boUnderWar then begin
    if m_LeftCastleWall.BaseObject <> nil then m_LeftCastleWall.BaseObject.m_boStoneMode:=False;
    if m_RightCastleWall.BaseObject <> nil then m_RightCastleWall.BaseObject.m_boStoneMode:=False;

    if m_WallFlag.BaseObject <> nil then m_WallFlag.BaseObject.m_boStoneMode:=False;
    if (GetTickCount - TWallFlag(m_WallFlag.BaseObject).BrokenTime) > 5 * 60 * 1000 then begin     //5ºÐ ÈÄ Á¡·É±ê¹ß »ý»ê
      TWallFlag(m_WallFlag.BaseObject).m_WAbil.HP:=TWallFlag(m_WallFlag.BaseObject).m_WAbil.MaxHP;
      TWallFlag(m_WallFlag.BaseObject).m_boDeath:=False;
      TWallFlag(m_WallFlag.BaseObject).RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
    end;

    if not m_boShowOverMsg then begin //00490181
      if (GetTickCount - m_dwStartCastleWarTick) > (g_Config.dwCastleWarTime - g_Config.dwShowCastleWarEndMsgTime) {3 * 60 * 60 * 1000 - 10 * 60 * 1000} then begin
        m_boShowOverMsg:=True;                //10ºÐÀü
        s20:=format(sWarStopTimeMsg,[m_sName,g_Config.dwShowCastleWarEndMsgTime div (60 * 1000)]);

        UserEngine.SendBroadCastMsgExt(s20,t_System);
        UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s20);
        MainOutMessage(s20);
      end;
    end;
    if (GetTickCount - m_dwStartCastleWarTick) > g_Config.dwCastleWarTime {3 * 60 * 60 * 1000} then begin
      StopWallconquestWar();      //Å¸ÀÓ¾Æ¿ôµÈ °æ¿ì, °ø¼ºÀüÀº ³¡³².
    end;

  end else begin
    if m_LeftCastleWall.BaseObject <> nil then m_LeftCastleWall.BaseObject.m_boStoneMode:=True;
    if m_RightCastleWall.BaseObject <> nil then m_RightCastleWall.BaseObject.m_boStoneMode:=True;

    if m_WallFlag.BaseObject <> nil then begin
      m_WallFlag.BaseObject.m_boStoneMode:=True;
      m_WallFlag.BaseObject.m_boDeath := True;
      m_WallFlag.BaseObject.m_boGhost := True;
      m_WallFlag.BaseObject := nil;
    end;

    if not m_boShowWatStartMsg then begin //00490181
      DecodeTime(Time, Hour, Min, Sec, MSec);
      CastleWarStartTimeMinute := (g_Config.nStartCastlewarTime * 60 + g_Config.nStartCastlewarMin) - (Hour * 60 + Min);
      if (CastleWarStartTimeMinute in [1..10]) and ((CastleWarStartTimeMinute = OCastleWarStartTimeMinute) or (OCastleWarStartTimeMinute = - 1)) then begin
        s20:=format(sWarStartTimeMsg,[m_sName, CastleWarStartTimeMinute]);
        UserEngine.SendBroadCastMsgExt(s20,t_System);
        UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s20);
        MainOutMessage(s20);
        OCastleWarStartTimeMinute := CastleWarStartTimeMinute - 1;
      end;
    end;
  end;
except
  MainOutMessage(sExceptionMsg);
end;
end;


function TVailantSystem.InCastleWarArea(Envir: TEnvirnoment): Boolean;//004910F4           //°ø¼ºÀü Áß¿¡ ÀÖÀ½..
var
  I:Integer;
begin
  Result:=False;
  if (Envir = m_MapCastle) then begin
    Result:=True;
    exit;
  end;
end;

function TVailantSystem.InCastleArea(Envir: TEnvirnoment; nX,  nY: Integer): Boolean;//004910F4           //°ø¼ºÀü Áß¿¡ ÀÖÀ½..
var
  I:Integer;
begin
  Result:=False;
  if (Envir = m_MapCastle) or (Envir = m_MapPalace) then begin
    Result:=True;
    exit;
  end;
end;

function TVailantSystem.IsMember(Cert: TBaseObject): Boolean;//00490438
begin
  Result:=IsMasterGuild(TGuild(Cert.m_MyGuild));
end;

procedure TVailantSystem.GetCastle(Guild: TGuild);//00491290
var
  I: integer;
  OldGuild:TGuild;
  s10,s14,s20:String;
  ListC      :TList;
  PlayObject :TPlayObject;
ResourceString
  sGetCastleMsg = '%s¹®ÆÄ°¡ %sÀ» ÀÓ½ÃÁ¡·ÉÇÏ¿´½À´Ï´Ù.';         //»çºÏ¼º Á¡·É ¸Þ½ÃÁö
  sMoveOther = '%s¹®ÆÄ¸¦ Á¦¿ÜÇÑ ¸ðµç ÀÎ¿øÀº ÀÌÀü Àå¼Ò·Î ÀÌµ¿ÇÕ´Ï´Ù.';
begin
  RepairAll(m_sName);
  
  OldGuild:=m_MasterGuild;
  m_MasterGuild:=Guild;
  m_sOwnGuild:=Guild.sGuildName;
  m_ChangeDate:=Now();
  if OldGuild <> nil then OldGuild.RefMemberName;
  if m_MasterGuild <> nil then m_MasterGuild.RefMemberName;
  s10:=format(sGetCastleMsg,[m_sOwnGuild,m_sName]);
  UserEngine.SendBroadCastMsgExt(s10,t_System);
  UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s10);
  MainOutMessage(s10);
  m_WallFlag.BaseObject.m_boWarChack := False;    //Á¡·É‰ç´Ù

  s20:=format(sMoveOther,[m_sOwnGuild]);
  UserEngine.SendBroadCastMsgExt(s20,t_System);
  UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s20);
  MainOutMessage(s20);

  ListC:=TList.Create;
  //Á¡·ÉÇÑ ¹®ÆÄ ¹× µ¿¸Í¹®ÆÄ ÀÌ¿Ü¿¡ ¸ðµç »ç¶÷Àº °ø°Ý Áø¿µÀ¸·Î ³¯¾Æ°¨
  UserEngine.GetMapRageHuman(m_MapCastle, m_nHomeX, m_nHomeY, 100, ListC);
  for I := 0 to ListC.Count - 1 do begin
    PlayObject:=TPlayObject(ListC.Items[I]);
    PlayObject.ChangePKStatus(True);
    if not IsDefenseWarGuild(TGuild(PlayObject.m_MyGuild)) then
      PlayObject.BaseObjectMove(GetOutMapName,IntToStr(GetOutHomeX),IntToStr(GetOutHomeY));
  end;
  ListC.Free;

  AddGameDataLog('27' + #9 +
           m_sMapName + #9 +    //OldGuild.sGuildName
           '1' + #9 +
           '1' + #9 +
           m_sOwnGuild + #9 +
           m_MasterGuild.GetChiefName + #9 +
           '0' + #9 +
           '1' + #9 +
           '1' + #9 + '[' + m_sName + ' Á¡·É(ÀÓ½Ã)]');
end;

procedure TVailantSystem.StartWallUnitOn;//00491074
begin
  m_MapCastle:=g_MapManager.FindMap(m_sMapName);
  if m_MapCastle <> nil then begin
    m_WallFlag.BaseObject:=UserEngine.RegenMonsterByName(m_sMapName,m_WallFlag.nX,m_WallFlag.nY,m_WallFlag.sName);
    if m_WallFlag.BaseObject <> nil then begin
      m_WallFlag.BaseObject.m_WAbil.HP:= m_WallFlag.BaseObject.m_WAbil.MaxHP;
      m_WallFlag.BaseObject.m_Castle:=Self;
    end else begin
      MainOutMessage('[Error] UserCastle.StartWallUnitOn WallFlag.UnitOb: ' + m_WallFlag.sName);
    end;
  end;
end;

procedure TVailantSystem.StartWallconquestWar;//00491074
var
  ListC:TList;
  I:Integer;
  PlayObject:TPlayObject;
begin
  m_boShowWatStartMsg := True;
  ListC:=TList.Create;
  UserEngine.GetMapRageHuman(m_MapCastle, m_nHomeX, m_nHomeY, 100, ListC);
  for I := 0 to ListC.Count - 1 do begin
    PlayObject:=TPlayObject(ListC.Items[I]);
    PlayObject.RefShowName();
  end;
  ListC.Free;
end;

procedure TVailantSystem.StopWallconquestWar;//00491408
var
  I          :Integer;
  ListC      :TList;
  PlayObject :TPlayObject;
  s14, s10   :String;
ResourceString
  sWallWarStop = '[%s °ø¼ºÀüÀÌ Á¾·á µÇ¾ú½À´Ï´Ù.]';
  sGetCastleMsg = '%s¹®ÆÄ°¡ %sÀ» Á¡·ÉÇÏ¿´½À´Ï´Ù.';         //»çºÏ¼º Á¡·É ¸Þ½ÃÁö
begin
  m_boUnderWar:=False;         //°ø¼ºÀüÀÌ ³¡³µÀ½.
  m_boShowWatStartMsg:=False;
  s10:=format(sGetCastleMsg,[m_sOwnGuild,m_sName]);
  UserEngine.SendBroadCastMsgExt(s10,t_System);
  UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s10);
  MainOutMessage(s10);

  s14:=format(sWallWarStop,[m_sName]);
  UserEngine.SendBroadCastMsgExt(s14,t_System);    //Àü¼­¹öÀÇ ÀüÀ½À¸·Î °øÁö°¡ ³ª°£´Ù.
  UserEngine.SendServerGroupMsg(SS_204,nServerIndex,s14);
  MainOutMessage(s14);

  ListC:=TList.Create;
  //°ø¼ºÀü¿¡¼­ ½Â¸®ÇÑ ¹® ÀÌ¿Ü¿¡ ¸ðµç »ç¶÷Àº ´Ù¸¥ ¸ÊÀ¸·Î ³¯¾Æ°¨
  UserEngine.GetMapRageHuman(m_MapCastle, m_nHomeX, m_nHomeY, 100, ListC);
  for I := 0 to ListC.Count - 1 do begin
    PlayObject:=TPlayObject(ListC.Items[I]);
    PlayObject.ChangePKStatus(False);      //°ø¼ºÀü ³¡
    if PlayObject.m_MyGuild <> m_MasterGuild then
      PlayObject.MapRandomMove(PlayObject.m_sHomeMap,0);
  end;
  ListC.Free;

  RepairDoor();

  AddGameDataLog('27' + #9 +
           m_sMapName + #9 +
           '1' + #9 +
           '1' + #9 +
           m_MasterGuild.sGuildName + #9 +
           m_MasterGuild.GetChiefName + #9 +
           '0' + #9 +
           '1' + #9 +
           '1' + #9 + '[' + m_sName + ' Á¡·É]');
end;

function TVailantSystem.IsDefenseAllyGuild(Guild: TGuild): Boolean;
begin
  Result:=False;
  if not m_boUnderWar then exit;//
  if m_MasterGuild <> nil then
    Result:=m_MasterGuild.IsAllyGuild(Guild);
end;

//¼ì²éÊÇ·ñÎªÊØ³Ç·½ÐÐ»á
function TVailantSystem.IsDefenseGuild(Guild: TGuild): Boolean;
begin
  Result:= False;
  if not m_boUnderWar then exit;//Èç¹ûÎ´¿ªÊ¼¹¥³Ç£¬ÔòÎÞÐ§    
  if Guild = m_MasterGuild then Result:=True;
end;

function TVailantSystem.IsDefenseWarGuild(Guild: TGuild): Boolean;
begin
  Result:= False;
  if ((Guild = m_MasterGuild) or m_MasterGuild.IsAllyGuild(Guild)) then
    Result := True;
end;

function TVailantSystem.IsMasterGuild(Guild: TGuild): Boolean;//00490400
begin
  Result:=False;
  if (m_MasterGuild <> nil) and (m_MasterGuild = Guild) then
    Result:=True;
end;

function TVailantSystem.GetHomeX: Integer;//004902B0
begin
  Result:=(m_nHomeX - 4) + Random(9);
end;

function TVailantSystem.GetHomeY: Integer;//004902D8
begin
  Result:=(m_nHomeY - 4) + Random(9);
end;

function TVailantSystem.GetATHomeX: Integer;//004902B0
begin
  Result:=(m_nATHomeX - 4) + Random(9);
end;

function TVailantSystem.GetATHomeY: Integer;//004902D8
begin
  Result:=(m_nATHomeY - 4) + Random(9);
end;

function TVailantSystem.GetMapName: String;//00490290
begin
  Result:=m_sMapName;
end;

function TVailantSystem.GetATMapName: String;//00490290
begin
  Result:=m_sATHomeMap;
end;

function TVailantSystem.GetHMapName: String;//00490290
begin
  Result:=m_sCastlePalace;
end;

function TVailantSystem.GetHHomeX: Integer;//004902B0
begin
  Result:=(m_nCastleHomeX - 4) + Random(9);
end;

function TVailantSystem.GetHHomeY: Integer;//004902D8
begin
  Result:=(m_nCastleHomeY - 4) + Random(9);
end;

function TVailantSystem.GetOutMapName: String;//00490290
begin
  Result:=m_sOutHomeMap;
end;

function TVailantSystem.GetOutHomeX: Integer;//004902B0
begin
  Result:=(m_nOutHomeX - 4) + Random(9);
end;

function TVailantSystem.GetOutHomeY: Integer;//004902D8
begin
  Result:=(m_nOutHomeY - 4) + Random(9);
end;


function TVailantSystem.CheckInPalace(nX, nY: Integer; Cert: TBaseObject): Boolean;  //490300
var
  ObjUnit:pTObjUnit;
begin
  Result:=IsMasterGuild(TGuild(cert.m_MyGuild));
  if Result then exit;
  ObjUnit:=@m_LeftWall;
  if (ObjUnit.BaseObject <> nil) and
     (ObjUnit.BaseObject.m_boDeath) and
     (ObjUnit.BaseObject.m_nCurrX = nX) and
     (ObjUnit.BaseObject.m_nCurrY = nY) then begin
    Result:=True;
  end;
  ObjUnit:=@m_CenterWall;
  if (ObjUnit.BaseObject <> nil) and
     (ObjUnit.BaseObject.m_boDeath) and
     (ObjUnit.BaseObject.m_nCurrX = nX) and
     (ObjUnit.BaseObject.m_nCurrY = nY) then begin
    Result:=True;
  end;
  ObjUnit:=@m_RightWall;
  if (ObjUnit.BaseObject <> nil) and
     (ObjUnit.BaseObject.m_boDeath) and
     (ObjUnit.BaseObject.m_nCurrX = nX) and
     (ObjUnit.BaseObject.m_nCurrY = nY) then begin
    Result:=True;
  end;
end;

function TVailantSystem.GetWarDate: String; //00490D7C
ResourceString
  sMsg = '%s %d½Ã %dºÐ';    //°ø¼º ³¯½Î Ç¥½Ã
begin
  Result:=format(sMsg,[GetDay(g_Config.nStartCastlewarDay), g_Config.nStartCastlewarTime, g_Config.nStartCastlewarMin]);
end;

procedure TVailantSystem.IncRateGold(nGold: Integer); //004904C4
var
  nInGold:Integer;
begin
  nInGold:=ROUND(nGold * (g_Config.nCastleTaxRate / 100){0.05});
  if (m_nTodayIncome + nInGold) <= g_Config.nCastleOneDayGold then begin
    Inc(m_nTodayIncome,nInGold);
  end else begin
    if m_nTodayIncome >= g_Config.nCastleOneDayGold then begin
      nInGold:=0;
    end else begin
      nInGold:=g_Config.nCastleOneDayGold - m_nTodayIncome;
      m_nTodayIncome:=g_Config.nCastleOneDayGold;
    end;
  end;
  if nInGold > 0 then begin
    if (m_nTotalGold + nInGold) < g_Config.nCastleGoldMax then begin
      Inc(m_nTotalGold,nInGold);
    end else begin
      m_nTotalGold:= g_Config.nCastleGoldMax;
    end;
  end;
  if (GetTickCount - m_dwSaveTick) > 10 * 60 * 1000 then begin
    m_dwSaveTick:=GetTickCount();
    if g_boGameLogGold then
      AddGameDataLog('23' + #9 +
                   '0' + #9 +
                   '0' + #9 +
                   '0' + #9 +
                   '»çºÏ¼º ¼¼±Ý' + #9 +
                   sSTRING_GOLDNAME + #9 +
                   IntToStr(m_nTotalGold) + #9 +
                   '1' + #9 +
                   '0' + #9 + '[' + m_sName + '¼ºÀÚ±ÝÀÔ±Ý]');
  end;


end;

function TVailantSystem.WithDrawalGolds(PlayObject:TPlayObject;nGold: Integer): Integer; //0049066C
begin
  Result:= -1;
  if nGold <= 0 then begin
    Result:= -4;
    exit;
  end;   
  if (m_MasterGuild = PlayObject.m_MyGuild) and (PlayObject.m_nGuildRankNo = 1) and (nGold > 0) then begin
    if (nGold > 0) and (nGold <= m_nTotalGold) then begin
      if (PlayObject.m_nGold + nGold) <= PlayObject.m_nGoldMax then begin
        Dec(m_nTotalGold,nGold);
        PlayObject.IncGold(nGold);
               //004907C8
             if g_boGameLogGold then
               AddGameDataLog('22' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(nGold) + #9 +
                     '1' + #9 +
                     '0' + #9 + '['+m_sName+'¼ºÀÚ±ÝÀÎÃâ]');
        PlayObject.GoldChanged;
        Result:=1;
      end else Result:= -3;
    end else Result:= -2;
  end;    
end;

function TVailantSystem.ReceiptGolds(PlayObject:TPlayObject;nGold: Integer): Integer;//00490864
begin
  Result:= -1;
  if nGold <= 0 then begin
    Result:= -4;
    exit;
  end;  
  if (m_MasterGuild = PlayObject.m_MyGuild) and (PlayObject.m_nGuildRankNo = 1) and (nGold > 0) then begin
    if (nGold <= PlayObject.m_nGold) then begin
      if (m_nTotalGold + nGold) <= g_Config.nCastleGoldMax then begin
      //  Dec(PlayObject.m_nGold,nGold);
        PlayObject.DecGold(nGold);
        Inc(m_nTotalGold,nGold);
             if g_boGameLogGold then
               AddGameDataLog('23' +  #9 +
                     PlayObject.m_sMapName + #9 +
                     IntToStr(PlayObject.m_nCurrX) + #9 +
                     IntToStr(PlayObject.m_nCurrY) + #9 +
                     PlayObject.m_sCharName + #9 +
                     sSTRING_GOLDNAME + #9 +
                     IntToStr(nGold) + #9 +
                     '1' + #9 +
                     '0' + #9 + '['+m_sName+'¼ºÀÚ±ÝÀÎÃâ]');
        PlayObject.GoldChanged;
        Result:=1;
      end else Result:= -3;
    end else Result:= -2;
  end;
end;

procedure TVailantSystem.MainDoorControl(boClose:Boolean);//00490460     //»çºÏ Á¤¹®
begin
  if (m_MainDoor.BaseObject <> nil) and not m_MainDoor.BaseObject.m_boGhost then begin
    if boClose then begin
      if TCastleDoor(m_MainDoor.BaseObject).m_boOpened then TCastleDoor(m_MainDoor.BaseObject).Close;
    end else begin
      if not TCastleDoor(m_MainDoor.BaseObject).m_boOpened then TCastleDoor(m_MainDoor.BaseObject).Open;
    end;
  end;
end;

procedure TVailantSystem.FirstDoorControl(boClose:Boolean);//00490460     //»çºÏ Á¤¹®
begin
  if (m_FirstDoor.BaseObject <> nil) and not m_FirstDoor.BaseObject.m_boGhost then begin
    if boClose then begin
      if TNammanCastleDoor(m_FirstDoor.BaseObject).m_boOpened then TNammanCastleDoor(m_FirstDoor.BaseObject).Close;
    end else begin
      if not TNammanCastleDoor(m_FirstDoor.BaseObject).m_boOpened then TNammanCastleDoor(m_FirstDoor.BaseObject).Open;
    end;
  end;
end;

procedure TVailantSystem.SecondDoorControl(boClose:Boolean);//00490460     //»çºÏ Á¤¹®
begin
  if (m_SecondDoor.BaseObject <> nil) and not m_SecondDoor.BaseObject.m_boGhost then begin
    if boClose then begin
      if TNammanCastleDoor2(m_SecondDoor.BaseObject).m_boOpened then TNammanCastleDoor2(m_SecondDoor.BaseObject).Close;
    end else begin
      if not TNammanCastleDoor2(m_SecondDoor.BaseObject).m_boOpened then TNammanCastleDoor2(m_SecondDoor.BaseObject).Open;
    end;
  end;
end;


procedure TVailantSystem.RepairAll(castlename:string);//00490A70        //¼º¹®À» °íÄ£´Ù.
var
  CastleDoor:pTObjUnit;
  Wall:pTObjUnit;
begin
  if castlename = '»çºÏ¼º' then begin
    CastleDoor:=@m_MainDoor;
    if (CastleDoor.BaseObject = nil) or (not m_boUnderWar) or (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TCastleDoor(CastleDoor.BaseObject).m_boOpened:=False;
      TCastleDoor(CastleDoor.BaseObject).RefStatus();
    end;
    Wall:=@m_LeftCastleWall;
    if (Wall.BaseObject = nil) or (not m_boUnderWar) or (Wall.BaseObject.m_WAbil.HP >= Wall.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      Wall.BaseObject.m_WAbil.HP:=Wall.BaseObject.m_WAbil.MaxHP;
      Wall.BaseObject.m_boDeath:=False;
      TSabukStructure(Wall.BaseObject).RefStatus()
    end;
    Wall:=@m_RightCastleWall;
    if (Wall.BaseObject = nil) or (not m_boUnderWar) or (Wall.BaseObject.m_WAbil.HP >= Wall.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      Wall.BaseObject.m_WAbil.HP:=Wall.BaseObject.m_WAbil.MaxHP;
      Wall.BaseObject.m_boDeath:=False;
      TSabukStructure(Wall.BaseObject).RefStatus()
    end;

  end else begin
    CastleDoor:=@m_FirstDoor;
    if (CastleDoor.BaseObject = nil) or (not m_boUnderWar) or (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TNammanCastleDoor(CastleDoor.BaseObject).m_boOpened:=False;
      TNammanCastleDoor(CastleDoor.BaseObject).RefStatus();              //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
    end;

    CastleDoor:=@m_SecondDoor;
    if (CastleDoor.BaseObject = nil) or (not m_boUnderWar) or (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TNammanCastleDoor2(CastleDoor.BaseObject).m_boOpened:=False;
      TNammanCastleDoor2(CastleDoor.BaseObject).RefStatus();              //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
    end;
    Wall:=@m_LeftCastleWall;
    if (Wall.BaseObject = nil) or (not m_boUnderWar) or (Wall.BaseObject.m_WAbil.HP >= Wall.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      Wall.BaseObject.m_WAbil.HP:=Wall.BaseObject.m_WAbil.MaxHP;
      Wall.BaseObject.m_boDeath:=False;
      TNammanStructure(Wall.BaseObject).RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
    end;

    Wall:=@m_RightCastleWall;
    if (Wall.BaseObject = nil) or (not m_boUnderWar) or (Wall.BaseObject.m_WAbil.HP >= Wall.BaseObject.m_WAbil.MaxHP) then begin
      exit;
    end else begin
      Wall.BaseObject.m_WAbil.HP:=Wall.BaseObject.m_WAbil.MaxHP;
      Wall.BaseObject.m_boDeath:=False;
      TNammanStructure(Wall.BaseObject).RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
    end;
  end;

end;


function TVailantSystem.RepairDoor():Boolean;//00490A70        //¼º¹®À» °íÄ£´Ù.
var
  CastleDoor:pTObjUnit;
begin
  Result:=False;
  CastleDoor:=@m_MainDoor;
  if (CastleDoor.BaseObject = nil) or
     (m_boUnderWar) or
     (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
    exit;
  end;
  if not CastleDoor.BaseObject.m_boDeath then begin
    if (GetTickCount - TCastleDoor(CastleDoor.BaseObject).m_dwStruckTick) > 60 * 1000 then begin         //¸¶Áö¸·À» ¸ÂÀº 10ºÐÀÌ Áö³ª¸é °íÄ¥ ¼ö ÀÖ´Ù.
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;         //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      TCastleDoor(CastleDoor.BaseObject).RefStatus();
      Result:=True;
    end;
  end else begin
    if (GetTickCount - TCastleDoor(CastleDoor.BaseObject).BrokenTime) > 60 * 1000 then begin      //¿ÏÆÄµÈ °æ¿ì¿¡´Â 1½Ã°£ ÈÄ¿¡ °íÄ¥ ¼ö ÀÖÀ½
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TCastleDoor(CastleDoor.BaseObject).m_boOpened:=False;
      TCastleDoor(CastleDoor.BaseObject).RefStatus();              //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end;

end;


function TVailantSystem.RepairFirstDoor():Boolean;//00490A70        //¼º¹®À» °íÄ£´Ù.
var
  CastleDoor:pTObjUnit;
begin
  Result:=False;
  CastleDoor:=@m_FirstDoor;
  if (CastleDoor.BaseObject = nil) or
     (m_boUnderWar) or
     (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
    exit;
  end;
  if not CastleDoor.BaseObject.m_boDeath then begin
    if (GetTickCount - TNammanCastleDoor(CastleDoor.BaseObject).m_dwStruckTick) > 60 * 1000 then begin         //¸¶Áö¸·À» ¸ÂÀº 10ºÐÀÌ Áö³ª¸é °íÄ¥ ¼ö ÀÖ´Ù.
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;         //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      TNammanCastleDoor(CastleDoor.BaseObject).RefStatus();
      Result:=True;
    end;
  end else begin
    if (GetTickCount - TNammanCastleDoor(CastleDoor.BaseObject).BrokenTime) > 60 * 1000 then begin      //¿ÏÆÄµÈ °æ¿ì¿¡´Â 1½Ã°£ ÈÄ¿¡ °íÄ¥ ¼ö ÀÖÀ½
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TNammanCastleDoor(CastleDoor.BaseObject).m_boOpened:=False;
      TNammanCastleDoor(CastleDoor.BaseObject).RefStatus();              //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end;

end;

function TVailantSystem.RepairSecondDoor():Boolean;//00490A70        //¼º¹®À» °íÄ£´Ù.
var
  CastleDoor:pTObjUnit;
begin
  Result:=False;
  CastleDoor:=@m_SecondDoor;
  if (CastleDoor.BaseObject = nil) or
     (m_boUnderWar) or
     (CastleDoor.BaseObject.m_WAbil.HP >= CastleDoor.BaseObject.m_WAbil.MaxHP) then begin
    exit;
  end;
  if not CastleDoor.BaseObject.m_boDeath then begin
    if (GetTickCount - TNammanCastleDoor2(CastleDoor.BaseObject).m_dwStruckTick) > 60 * 1000 then begin         //¸¶Áö¸·À» ¸ÂÀº 10ºÐÀÌ Áö³ª¸é °íÄ¥ ¼ö ÀÖ´Ù.
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;         //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      TNammanCastleDoor2(CastleDoor.BaseObject).RefStatus();
      Result:=True;
    end;
  end else begin
    if (GetTickCount - TNammanCastleDoor2(CastleDoor.BaseObject).BrokenTime) > 60 * 1000 then begin      //¿ÏÆÄµÈ °æ¿ì¿¡´Â 1½Ã°£ ÈÄ¿¡ °íÄ¥ ¼ö ÀÖÀ½
      CastleDoor.BaseObject.m_WAbil.HP:=CastleDoor.BaseObject.m_WAbil.MaxHP;
      CastleDoor.BaseObject.m_boDeath:=False;
      TNammanCastleDoor2(CastleDoor.BaseObject).m_boOpened:=False;
      TNammanCastleDoor2(CastleDoor.BaseObject).RefStatus();              //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end;

end;

function TVailantSystem.RepairSabukWall(nWallIndex: Integer):Boolean; //¼ºº®À» °íÄ£´Ù.
var
  Wall:TSabukStructure;
begin
  Result:=False;
  Wall:=nil;
  case nWallIndex of
    1: Wall:=TSabukStructure(m_LeftCastleWall.BaseObject);
    2: Wall:=TSabukStructure(m_RightCastleWall.BaseObject);
  end;
  if (Wall = nil) or
     (m_boUnderWar) or
     (Wall.m_WAbil.HP >= Wall.m_WAbil.MaxHP) then begin
    exit;
  end;
  if not Wall.m_boDeath then begin
    if (GetTickCount - Wall.m_dwStruckTick) > 60 * 1000 then begin   //¸¶Áö¸·À» ¸ÂÀº 10ºÐÀÌ Áö³ª¸é °íÄ¥ ¼ö ÀÖ´Ù.
      Wall.m_WAbil.HP:=Wall.m_WAbil.MaxHP;
      Wall.RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end else begin
    if (GetTickCount - Wall.BrokenTime) > 60 * 1000 then begin     //¿ÏÆÄµÈ °æ¿ì¿¡´Â 1½Ã°£ ÈÄ¿¡ °íÄ¥ ¼ö ÀÖÀ½
      Wall.m_WAbil.HP:=Wall.m_WAbil.MaxHP;
      Wall.m_boDeath:=False;
      Wall.RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end;
end;

function TVailantSystem.RepairNammanWall(nWallIndex: Integer):Boolean; //¼ºº®À» °íÄ£´Ù.
var
  Wall:TNammanStructure;
begin
  Result:=False;
  Wall:=nil;
  case nWallIndex of
    3: Wall:=TNammanStructure(m_LeftCastleWall.BaseObject);
    4: Wall:=TNammanStructure(m_RightCastleWall.BaseObject);
  end;
  if (Wall = nil) or
     (m_boUnderWar) or
     (Wall.m_WAbil.HP >= Wall.m_WAbil.MaxHP) then begin
    exit;
  end;
  if not Wall.m_boDeath then begin
    if (GetTickCount - Wall.m_dwStruckTick) > 60 * 1000 then begin   //¸¶Áö¸·À» ¸ÂÀº 10ºÐÀÌ Áö³ª¸é °íÄ¥ ¼ö ÀÖ´Ù.
      Wall.m_WAbil.HP:=Wall.m_WAbil.MaxHP;
      Wall.RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end else begin
    if (GetTickCount - Wall.BrokenTime) > 60 * 1000 then begin     //¿ÏÆÄµÈ °æ¿ì¿¡´Â 1½Ã°£ ÈÄ¿¡ °íÄ¥ ¼ö ÀÖÀ½
      Wall.m_WAbil.HP:=Wall.m_WAbil.MaxHP;
      Wall.m_boDeath:=False;
      Wall.RefStatus();          //»õ·Î¿î ¸ð½ÀÀ» º¸³½´Ù.
      Result:=True;
    end;
  end;
end;

procedure TVailantSystem.SetPower(nPower: Integer);
begin
  m_nPower:=nPower;
end;

procedure TVailantSystem.SetTechLevel(nLevel: Integer);
begin
  m_nTechLevel:=nLevel;
end;

{ TVailantManager }



constructor TVailantManager.Create;
begin
  m_CastleList:=TList.Create;
  InitializeCriticalSection(CriticalSection);
end;


destructor TVailantManager.Destroy;
var
  I: Integer;
  UserCastle:TVailantSystem;
begin
  for I := 0 to m_CastleList.Count - 1 do begin
    UserCastle:=TVailantSystem(m_CastleList.Items[I]);
    UserCastle.Free;
  end;
  m_CastleList.Free;
  DeleteCriticalSection(CriticalSection);
  inherited;
end;


function TVailantManager.Find(sCastleName: String): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if CompareText(Castle.m_sName,sCastleName) = 0 then begin
      Result:=Castle;
      break;
    end;
  end;
end;

//È¡µÃ½ÇÉ«ËùÔÚ×ù±êµÄ³Ç±¤
function TVailantManager.InCastleWarArea(BaseObject: TBaseObject): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.InCastleWarArea(BaseObject.m_PEnvir) then begin
      Result:=Castle;
      break;
    end;
  end;
end;
function TVailantManager.InCastleWarArea(Envir: TEnvirnoment): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.InCastleWarArea(Envir) then begin
      Result:=Castle;
      break;
    end;
  end;
end;

function TVailantManager.InCastleArea(BaseObject: TBaseObject): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.InCastleArea(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY) then begin
      Result:=Castle;
      break;
    end;
  end;
end;
function TVailantManager.InCastleArea(Envir: TEnvirnoment; nX, nY: Integer): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.InCastleArea(Envir,nX,nY) then begin
      Result:=Castle;
      break;
    end;
  end;
end;

procedure TVailantManager.Initialize;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  if m_CastleList.Count <= 0 then begin
    Castle:=TVailantSystem.Create(g_Config.sCastleDir);
    m_CastleList.Add(Castle);
    Castle.Initialize;
    exit;
  end;
    
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    Castle.Initialize;
  end;
end;

//³Ç±¤ËùÔÚµØÍ¼
function TVailantManager.IsCastleEnvir(Envir: TEnvirnoment): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.m_MapCastle = Envir then begin
      Result:=Castle;
      break;
    end;
  end;
end;

function TVailantManager.IsCastleMember(BaseObject: TBaseObject): TVailantSystem;
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Result:=nil;
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    if Castle.IsMember(BaseObject) then begin
      Result:=Castle;
      break;
    end;
  end;
end;

function TVailantManager.IsMasterCastleMember(BaseObject: TBaseObject): TVailantSystem;    //Á¤º¹ÀÚ È®ÀÎ
var
  I: Integer;
  Castle1, Castle2:TVailantSystem;
begin
  Result:=nil;

  Castle1:=TVailantSystem(m_CastleList.Items[0]);
  Castle2:=TVailantSystem(m_CastleList.Items[1]);
  if (Castle1 <> nil) and (Castle2 <> nil) then begin
    if Castle1.IsMember(BaseObject) and Castle2.IsMember(BaseObject) then begin
      Result:=Castle2;
    end;
  end;
end;


procedure TVailantManager.Run;
var
  I: Integer;
  UserCastle:TVailantSystem;
begin
  Lock;
  try
    for I := 0 to m_CastleList.Count - 1 do begin
      UserCastle:=TVailantSystem(m_CastleList.Items[I]);
      UserCastle.Run;
    end;
  finally
    UnLock;
  end;
end;

procedure TVailantManager.GetCastleGoldInfo(List:TStringList);
var
  I: Integer;
  Castle:TVailantSystem;
begin
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    List.Add(format(g_sGameCommandSbkGoldShowMsg,[Castle.m_sName,Castle.m_nTotalGold,Castle.m_nTodayIncome]));
  end;
end;

procedure TVailantManager.LoadCastleList;
var
  LoadList:TStringList;
  Castle:TVailantSystem;
  sCastleDir:String;
  i:integer;
begin
  if FileExists(g_Config.sCastleFile) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(g_Config.sCastleFile);
    for i:=0 to LoadList.Count -1 do begin
      sCastleDir:=Trim(LoadList.Strings[i]);
      if sCastleDir <> '' then begin
        Castle:=TVailantSystem.Create(sCastleDir);
        m_CastleList.Add(Castle);
      end;
    end;
    LoadList.Free;
    MainOutMessage('°ø¼ºÀü:' + IntToStr(m_CastleList.Count));
  end else begin
    MainOutMessage('°ø¼ºÀü Á¤º¸ ·Îµù ½ÇÆÐ!!');
  end;
end;

procedure TVailantManager.SaveCastleList;
var
  I: Integer;
  LoadList:TStringList;
begin
  if not DirectoryExists(g_Config.sCastleDir) then begin
    CreateDir(g_Config.sCastleDir);
  end;
  LoadList:=TStringList.Create;
  for I := 0 to m_CastleList.Count - 1 do begin
    LoadList.Add(IntToStr(I));
  end;
  LoadList.SaveToFile(g_Config.sCastleFile);
  LoadList.Free;
end;

function TVailantManager.GetCastle(nIndex: Integer): TVailantSystem;
begin
  Result:=nil;
  if (nIndex >= 0) and (nIndex < m_CastleList.Count) then
    Result:=TVailantSystem(m_CastleList.Items[nIndex]);
end;

procedure TVailantManager.GetCastleNameList(List: TStringList);
var
  I: Integer;
  Castle:TVailantSystem;
begin
  for I := 0 to m_CastleList.Count - 1 do begin
    Castle:=TVailantSystem(m_CastleList.Items[I]);
    List.Add(Castle.m_sName);
  end;
end;

procedure TVailantManager.IncRateGold(nGold: Integer);
var
  I: Integer;
  Castle:TVailantSystem;
begin
  Lock;
  try
    for I := 0 to m_CastleList.Count - 1 do begin
      Castle:=TVailantSystem(m_CastleList.Items[I]);
      Castle.IncRateGold(nGold);
    end;
  finally
    UnLock;
  end;
end;




procedure TVailantManager.Lock;
begin
  EnterCriticalSection(CriticalSection);
end;

procedure TVailantManager.UnLock;
begin
  LeaveCriticalSection(CriticalSection);
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Castle.pas 404 2006-09-09 17:59:18Z damian $');
end.
