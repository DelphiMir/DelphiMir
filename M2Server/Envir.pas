unit Envir;

interface

uses
  {svn, }Windows, Forms, SysUtils, Classes,dialogs, Grobal2, mudutil, SDK;

const
  sCheckTitle:String = 'Legend of mir';

type
  TEnvirnoment = class;

  
  pTOSObject=^TOSObject;
  TOSObject=record
     btType:byte;
     CellObj:TObject;
     dwAddTime:dword;
  end;

  { TMapHeaderEI }
  PMapHeaderEI = ^TMapHeaderEI;
  TMapHeaderEI = packed record
     szDesc        : array[1..20] of char;
     wAttr         : Word;
     width         : Word;
     height        : Word;
     cEventFileIdx : Char;
     cFogColor     : Char;
  end;

  { TMapInfoEi2Tite }
  PMapInfoEi2Tite = ^TMapInfoEi2Tite;
  TMapInfoEi2Tite = packed record
     bFileIdx    : Byte;
     wTileIdx    : Word;
  end;
  
  { TMapInfoEi2OB }
  PMapInfoEi2OB = ^TMapInfoEi2OB;
  TMapInfoEi2OB = packed record
     bFlag         : Byte;
     bObj1Ani      : Byte;
     bObj2Ani      : Byte;
     bFileIdx      : Byte;
     bFileIdx1     : Byte;
     wObj1         : Word;
     wObj2         : Word;
     btDoorIndex   : Byte;
     btDoorOffset  : Byte;
     wLigntNEvent  : Word;
     wLigntNEvent1 : Byte;
  end;

  TMapHeader = packed record
    wWidth      :Word;
    wHeight     :Word;
    sTitle      :String[15];
    UpdateDate  :TDateTime;
    Reserved    :array[0..23] of Char;
  end;

  TENMapHeader = packed record
    Title: string[16];
    Reserved: LongWord;
    Width: Word;
    Not1: Word;
    Height: Word;
    Not2: Word;
    Reserved2: array[0..24] of char;
  end;
  TENMapInfo = packed record
    BkImg: dWord;
   // BkImgNot: word;
    MidImg: word;
    FrImg: word;
    DoorIndex: byte;
    DoorOffset: byte;
    AniFrame: byte;
    AniTick: byte;
    Area: byte;
    light: byte;
    btNot: byte;
  end;
  PTENMapInfo = ^TENMapInfo;

  TSdoMapInfo2012 = packed record
    BkImg: Word;
    MidImg: Word;
    FrImg: Word;
    DoorIndex: byte;  //not sure on this yet
    DoorOffset: byte; //not sure on this yet
    AniFrame: byte; //appears $80 is xored to check if it's enabled? (80 = enabled, 00 = disabled)
    AniTick: byte;  //this might be in seconds rather then ms not sure
    Area: byte;
    light: byte;     //this appears to be 5 in n0 while it used to be 4 max (maybe cause of blue candles there now)
    BkIndex: byte;

    MidIndex: Byte;
    AniTileImg: Word;
    Reserved: array[0..4] of byte;
    AniTileFrame: byte;            //amount of frames an animation tile has
    AniTileTiles: word;            //total amount of tiles used in a single animation (basicaly an offset value so frame 1 = tile 1, frame 2 = tile 2 + this value etc
    Reserved2: array[0..11] of byte;
  end;
  pTSdoMapInfo2012 = ^TSdoMapInfo2012;

  TMapUnitInfo = packed record        //½Å±Ô¸Ê
    wBkImg        :dWord;    //BackImage
    btBkIndex     :Byte;     //BackIndex
    wMidImg       :Word;     //MiddleImage
    MidIndex      :Byte;     //MiddleIndex
    wFrImg        :Word;     //FrontImage
    btArea        :Byte;     //FrontIndex Áö¿ª Á¤º¸
    btDoorIndex   :Byte;     //$80 (¹®Â¦), ¹®ÀÇ ½Äº° ÀÎµ¦½º
    btDoorOffset  :Byte;     //´ÝÈù ¹®ÀÇ ±×¸²ÀÇ »ó´ë À§Ä¡, $80 (¿­¸²/´ÝÈû(±âº»))
    btAniFrame    :Byte;     //FrontAnimationFrame
    btAniTick     :Byte;     //FrontAnimationTick
    MiAniFrame    :Byte;     //MiddleAnimationFrame
    MiAniTick     :Byte;     //MiddleAnimationTick
    AniTileImg    :Word;     //TileAnimationImage
    AniTileFrame  :byte;     //TileAnimationFrames
    AniTileTiles  :word;     //TileAnimationOffset
    btLight       :Byte;     //0..1..4  ±¤¿ø È¿°ú
  end;
  pTMapUnitInfo =^TMapUnitInfo;

   TOldMapUnitInfo = packed record
    wBkImg: Word; //32768 $8000 Îª½ûÖ¹ÒÆ¶¯ÇøÓò
    wMidImg: Word;
    wFrImg: Word;
    btDoorIndex: Byte; //$80 (¹®Â¦), ¹®ÀÇ ½Äº° ÀÎµ¦½º
    btDoorOffset: Byte;  //´ÝÈù ¹®ÀÇ ±×¸²ÀÇ »ó´ë À§Ä¡, $80 (¿­¸²/´ÝÈû(±âº»))
    btAniFrame: Byte; //$80(Draw Alpha) +  ÇÁ·¡ÀÓ ¼ö
    btAniTick: Byte;
    btArea: Byte; //Áö¿ª Á¤º¸
    btLight: Byte; //0..1..4 ±¤¿ø È¿°ú
  end;
  pTOldMapUnitInfo = ^TOldMapUnitInfo;

  TMap = array[0..1000 * 1000 -1] of TMapUnitInfo;
  pTMap = ^TMap;

  TOldMap = array[0..1000 * 1000 - 1] of TOldMapUnitInfo;
  pTOldMap = ^TOldMap;


  TMapEI = array[0..1000 * 1000 - 1] of TMapInfoEi2OB;
  PMapEI = ^TMapEI;

  TMapCellinfo = record
    chFlag   :Byte;      //0: can move  1: can't move  2: can't move and cant't fly
    ObjList  :TList;
  end;
  pTMapCellinfo =^TMapCellinfo;

  TEnvirnoment = class
    m_nWidth           :Integer;
    m_nHeight          :Integer;
    sMapName           :String; //0x4
    sMapDesc           :String;
    MapCellArray       :array of TMapCellinfo; //0x0C
    nMinMap            :Integer; //0x10
    nBigMap            :Integer;
    nServerIndex       :Integer; //0x14
    nRequestLevel      :Integer; //0x18 ½øÈë±¾µØÍ¼ËùÐèµÈ¼¶

    m_boMonGen         :Boolean;         //°ü¸®ÀÚ½Ã½ºÅÛ
    m_boHumGen         :Boolean;         //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nMobZenDelay     :integer;         //°ü¸®ÀÚ½Ã½ºÅÛ º¯°æ
    m_nMobZenRate      :integer;         //°ü¸®ÀÚ½Ã½ºÅÛ
    m_boOpenStore      :Boolean;       //°³ÀÎ»óÁ¡
    m_boNoRecallHero   :Boolean;
    m_boSNOW           :Boolean;         //´«¿À´ÂÀÌÆå
    m_nSNOWLEVEL       :Integer;     //´«¿À´ÂÀÌÆå
    m_boFLOWER         :Boolean;
    m_nFLOWERLEVEL     :Integer;
    AutoAttack         :integer;        //¸¶·æ¹ø°³
    m_boGROUPCOUNT     :Boolean;
    m_nGROUPCOUNT      :Integer;   //¸Ê ±×·ìÀÎ¿ø
    Flag               :TMapFlag;
    m_GuildTerritory   :TObject;
    BoCanGetItem       :Boolean;
    m_DoorList         :TList;
    QuestNPC           :TObject;
    m_QuestList        :TList;

    m_boUnAllowStdItems: Boolean; //»ç¿ë±ÝÁö1
    m_UnAllowStdItemsList: TGStringList; //»ç¿ë±ÝÁö1
    m_UnAllowMagicList: TGStringList; //»ç¿ë±ÝÁö2
    m_boNOTALLOWMAGIC: Boolean;  //»ç¿ë±ÝÁö2

  private

    procedure Initialize(nWidth, nHeight: Integer);
    procedure InitializeEI(nWidth, nHeight: Integer);
  public
    m_nMonCount        :Integer;             //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nHumCount        :Integer;             //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nItemCount       :Integer;             //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nHeroCount       :Integer;            //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nNpcCount        :Integer;             //°ü¸®ÀÚ½Ã½ºÅÛ
    constructor Create();
    destructor Destroy; override;
    function AddToMap(nX,nY:Integer;btType:Byte;pRemoveObject:TObject):Pointer;
    function CanWalk (nX,nY:Integer;boFlag:Boolean = False):Boolean;
    function CanWalkOfItem (nX,nY:Integer;boFlag,boItem:Boolean):Boolean;
    function CanWalkEx (nX,nY:Integer;boFlag:Boolean):Boolean;
    function CanFly (nsX,nsY,ndX,ndY:integer):Boolean;    
    function MoveToMovingObject(nCX, nCY: integer; Cert: TObject; nX,nY: Integer; boFlag: Boolean): Integer;
    function PetMoveToMovingObject(nCX, nCY: integer; Cert: TObject; nX,nY: Integer; boFlag: Boolean): Integer;
    function GetItem(nX, nY: Integer): PTMapItem;
    function DeleteFromMap(nX,nY:Integer;btType:Byte;pRemoveObject:TObject):Integer;
    function IsCheapStuff():Boolean;
    procedure AddDoorToMap;
    function  AddToMapMineEvent(nX,nY:Integer;nType:Integer;Event:TObject):TObject;
    function  LoadFormatType(sMapFile: String; var bMapType: byte): Integer;
    function  LoadMapData(sMapFile:String; bMapType: byte):Boolean;
    function  LoadMapDataEI(sMapFile: string): Boolean;
    function  CreateQuest(nFlag,nValue:Integer;sMonName,sItem,sQuest:String;boGrouped:Boolean):Boolean;
    function  GetMapCellInfo(nX,nY:Integer;var MapCellInfo:pTMapCellinfo):Boolean;
    function  GetXYObjCount(nX,nY:Integer):Integer;
    function  GetNextPosition(sx, sy, ndir, ndist:Integer;var snx:Integer;var sny:Integer):Boolean;
    function  IsValidCell(nX,nY:Integer):Boolean;
    procedure VerifyMapTime(nX,nY:Integer;BaseObject:TObject);
    function  CanSafeWalk(nX,nY:Integer):Boolean;
    function  ArroundDoorOpened(nX,nY:Integer):Boolean;
    function  GetMovingObject(nX,nY:Integer;boFlag:Boolean):Pointer;
    function  GetQuestNPC(BaseObject:TObject;sCharName,sItem:String;boFlag:Boolean):TObject;
    function  GetItemEx(nX,nY:Integer;var nCount:Integer):Pointer;
    function  GetDoor(nX,nY:Integer):pTDoorInfo;
    function  IsValidObject(nX,nY:Integer;nRage:Integer;BaseObject:TObject):Boolean;
    function  GetRangeBaseObject(nX,nY:Integer;nRage:Integer;boFlag:Boolean;BaseObjectList:TList):Integer;
    function  GetBaseObjects(nX,nY:Integer;boFlag:Boolean;BaseObjectList:TList):Integer;
    function  GetEvent(nX,nY:Integer):TObject;
    procedure SetMapXYFlag(nX,nY:Integer;boFlag:Boolean);
    function  GetXYHuman(nMapX, nMapY: Integer):Boolean;
    function  GetEnvirInfo():String;
    function AllowMagic(MagicName: string): Boolean; overload;       //»ç¿ë±ÝÁö2
    function AllowStdItems(sItemName: string): Boolean; overload;     //»ç¿ë±ÝÁö1
    function AllowStdItems(nItemIdx: Integer): Boolean; overload;     //»ç¿ë±ÝÁö1
    procedure AddObjectCount(BaseObject:TObject);    //°ü¸®ÀÚ½Ã½ºÅÛ
    procedure DelObjectCount(BaseObject:TObject);    //°ü¸®ÀÚ½Ã½ºÅÛ
    property  MonCount:Integer read m_nMonCount;        //°ü¸®ÀÚ½Ã½ºÅÛ
    property  HumCount:Integer read m_nHumCount;        //°ü¸®ÀÚ½Ã½ºÅÛ
    property  HeroCount:Integer read m_nHeroCount;       //°ü¸®ÀÚ½Ã½ºÅÛ
    property  NpcCount:Integer read m_nNpcCount;         //°ü¸®ÀÚ½Ã½ºÅÛ
  end;

  TMapManager = class(TGList)  //004B52B0
    m_nMonCount: Integer;          //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nNpcCount: Integer;          //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nHumCount: Integer;          //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nItemCount: Integer;         //°ü¸®ÀÚ½Ã½ºÅÛ
    m_nHeroCount: Integer;         //°ü¸®ÀÚ½Ã½ºÅÛ
    m_DuelMaps: TList;
  private
  public
    constructor Create();
    destructor Destroy; override;  
    procedure LoadMapDoor();
    function AddMapInfo(sMapName, sMapDesc: String; nServerNumber: Integer;MapFlag:pTMapFlag;QuestNPC: TObject):TEnvirnoment;
    function GetMapInfo(nServerIdx: Integer;sMapName: String): TEnvirnoment;
    function GetMapInfoEx(nServerIdx,GTNumber: Integer;sMapName: String): TEnvirnoment;
    function AddMapRoute(sSMapNO:String;nSMapX,nSMapY:Integer;sDMapNO:String;nDMapX,nDMapY:Integer):Boolean;
    function GetMapOfServerIndex(sMapName:String):Integer;

    function FindMapName(sMapName:String):String;
    function MapFindName(sMapName:String):TEnvirnoment;

    function FindMap(sMapName:String):TEnvirnoment;
    function FindMapEx(sMapName:String;GTNumber: integer):TEnvirnoment;
    procedure ReSetMinMap();
    procedure ReSetBigMap();
    procedure Run();
    procedure ProcessMapDoor();
  end;
implementation

uses ObjBase, ObjNpc, M2Share, Event, ObjMon, HUtil32, Castle, GuildTerritory, LocalDB, ItmUnit;

{ TEnvirList }

//004B7038
function TMapManager.AddMapInfo(sMapName, sMapDesc: String; nServerNumber:Integer;MapFlag:pTMapFlag;QuestNPC: TObject):TEnvirnoment;
var
  Envir:TEnvirnoment;
  i:Integer;
  TempList: TStringList;
  btMapType: Byte;
begin

  Result:=nil;
  Envir:=TEnvirnoment.Create;
  Envir.sMapName           :=sMapName;
  Envir.sMapDesc           :=sMapDesc;
  Envir.nServerIndex       :=nServerNumber;

  Envir.Flag               :=MapFlag^;
  Envir.QuestNPC           :=QuestNPC;

  Envir.AutoAttack         := MapFlag.autoAttack;       //¸¶·æ¹ø°³
  Envir.m_boOpenStore := MapFlag.boOpenStore;   //°³ÀÎ»óÁ¡
  Envir.m_boNoRecallHero := MapFlag.boNoRecallHero;
  Envir.m_boNOTALLOWMAGIC := MapFlag.boNOTALLOWMAGIC;     //»ç¿ë±ÝÁö2
  Envir.m_boSNOW := MapFlag.boSNOW;            //´«¿À´ÂÀÌÆå
  Envir.m_nSNOWLEVEL := MapFlag.nSNOWLEVEL;      //´«¿À´ÂÀÌÆå

  Envir.m_boFLOWER := MapFlag.boFLOWER;
  Envir.m_nFLOWERLEVEL := MapFlag.nFLOWERLEVEL;
  Envir.m_boGROUPCOUNT := MapFlag.boGROUPCOUNT;
  Envir.m_nGROUPCOUNT := MapFlag.nGROUPCOUNT;  //¸Ê ±×·ìÀÎ¿ø

  if (MapFlag.boUnAllowStdItems) and (MapFlag.sUnAllowStdItemsText <> '') then begin      //»ç¿ë±ÝÁö1
    Envir.m_boUnAllowStdItems := True;
    Envir.m_UnAllowStdItemsList := TGStringList.Create;
    TempList := TStringList.Create;
    ExtractStrings(['|', '\', '/'], [], PChar(Trim(MapFlag.sUnAllowStdItemsText)), TempList);
    for I := 0 to TempList.Count - 1 do begin
        Envir.m_UnAllowStdItemsList.Add(Trim(TempList.Strings[I]));
    end;
    TempList.Free;
  end;

  if (MapFlag.boNOTALLOWMAGIC) and (MapFlag.sUnAllowMagicText <> '') then begin         //»ç¿ë±ÝÁö2
    Envir.m_boNOTALLOWMAGIC := True;
    Envir.m_UnAllowMagicList := TGStringList.Create;
    TempList := TStringList.Create;
    ExtractStrings(['|', '\', '/'], [], PChar(Trim(MapFlag.sUnAllowMagicText)), TempList);
    for I := 0 to TempList.Count - 1 do begin
        Envir.m_UnAllowMagicList.Add(Trim(TempList.Strings[I]));
    end;
    TempList.Free;
  end;


  for i:=0 to MiniMapList.Count -1 do begin
    if CompareText(MiniMapList.Strings[i],Envir.sMapName) = 0 then begin
      Envir.nMinMap:=Integer(MiniMapList.Objects[i]);
      break;
    end;
  end;

  for i:=0 to BigMapList.Count -1 do begin
    if CompareText(BigMapList.Strings[i],Envir.sMapName) = 0 then begin
      Envir.nBigMap:=Integer(BigMapList.Objects[i]);
      break;
    end;
  end;
  if (Envir.LoadFormatType(sMapName + '.map', btMapType) in [0..2]) then begin
    if Envir.LoadMapData(sMapName + '.map', btMapType) then begin
      Envir.m_GuildTerritory := g_GuildTerritory.FindGuildTerritory(MapFlag.nGuildTerritory);
      Result:=Envir;
      Self.Add(Envir);
    end else begin
      MainOutMessage('´íÎó: ' + sMapName + '.map' + ' ÎÞ·¨¼ÓÔØ¡£');
    end;
  end else begin
    if Envir.LoadMapDataEI(g_Config.sMapEIDir + sMapName + '.map') then begin
      Envir.m_GuildTerritory := g_GuildTerritory.FindGuildTerritory(MapFlag.nGuildTerritory);
      Result := Envir;
      Self.Add(Envir);
    end else begin
      MainOutMessage('´íÎó: ' + g_Config.sMapEIDir + sMapName + '.map' + ' ÎÞ·¨¼ÓÔØ¡£');
    end;
  end;

end;
//004B7280
function TMapManager.AddMapRoute(sSMapNO:String;nSMapX,nSMapY:Integer;sDMapNO:String;nDMapX,nDMapY:Integer):Boolean;
var
  GateObj:pTGateObj;
  SEnvir:TEnvirnoment;
  DEnvir:TEnvirnoment;
  I,II:integer;
  GTNumber:integer;
begin
  Result:=False;
  SEnvir:=FindMap(sSMapNO);
  DEnvir:=FindMap(sDMapNO);
  if (SEnvir <> nil) and (DEnvir <> nil) then begin
    if DEnvir.Flag.nGuildTerritory = -1 then begin//regular map
      New(GateObj);
      GateObj.boFlag:=False;
      GateObj.DEnvir:=DEnvir;
      GateObj.nDMapX:=nDMapX;
      GateObj.nDMapY:=nDMapY;
      SEnvir.AddToMap(nSMapX,nSMapY,OS_GATEOBJECT,TObject(GateObj));
      Result:=True;
    end else begin
      Lock;
      try
        for II := 0 to g_GuildTerritory.GTlist.Count -1 do begin
          GTNumber:=TTerritory(g_GuildTerritory.GTlist.items[II]).TerritoryNumber;
          DEnvir:=nil;
          SEnvir:=nil;
          for I:=0 to Count -1 do begin;
            if TEnvirnoment(Items[I]).Flag.nGuildTerritory <> GTNumber then continue;
            if (CompareText(TEnvirnoment(Items[I]).sMapName,sDMapNO) = 0) then begin
              DEnvir:=TEnvirnoment(Items[I]);
            end;
            if (CompareText(TEnvirnoment(Items[I]).sMapName,sSMapNO) = 0) then begin
              SEnvir:=TEnvirnoment(Items[I]);
            end;
            if (SEnvir <> nil) and (DEnvir <> nil) then begin
              New(GateObj);
              GateObj.boFlag:=False;
              GateObj.DEnvir:=DEnvir;
              GateObj.nDMapX:=nDMapX;
              GateObj.nDMapY:=nDMapY;
              SEnvir.AddToMap(nSMapX,nSMapY,OS_GATEOBJECT,TObject(GateObj));
              Result:=True;
              break;
            end;
          end;
        end;
      finally
        UnLock;
      end;
    end;
  end;

end;
//004B63E4
function TEnvirnoment.AddToMap(nX, nY: Integer; btType: Byte;
  pRemoveObject: TObject):Pointer;
var
  MapCellInfo:pTMapCellinfo;
  OSObject, OSObject2:pTOSObject;
  MapItem:PTMapItem;
  i:integer;
  nGoldCount:Integer;
  boNeedAdd:Boolean;
  StdItem: TItem;
  ItemObjCount: integer;
  nError: integer;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::AddToMap :: %d';
begin
  Result:=nil;
  nError := 0;
  try
    boNeedAdd:=False;
    nError := 1;
    if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
      if MapCellInfo.ObjList = nil then begin
        MapCellInfo.ObjList:=TList.Create;
      end else begin
        nError := 2;
        if btType = OS_ITEMOBJECT then begin
          if PTMapItem(pRemoveObject).Name = sSTRING_GOLDNAME then begin
            for i:=0 to MapCellInfo.ObjList.Count -1 do begin
              OSObject:=MapCellInfo.ObjList.Items[i];
              if OSObject.btType = OS_ITEMOBJECT then begin
                MapItem:=PTMapItem(pTOSObject(MapCellInfo.ObjList.Items[i]).CellObj);
                if MapItem.Name = sSTRING_GOLDNAME then begin
                  nGoldCount:=MapItem.Count + PTMapItem(pRemoveObject).Count;
                  if nGoldCount <= 2000 then begin
                    MapItem.Count:= nGoldCount;
                    MapItem.Looks:= GetGoldShape(nGoldCount);
                    MapItem.AniCount:=0;
                    MapItem.Grade := 0;
                    MapItem.Reserved:=0;
                    OSObject.dwAddTime:=GetTickCount();    //½Ã°£ Àç¼³Á¤
                    Result:=MapItem;        //ÀÌ¹Ì ÀÖ´Â °ÍÀÌ¸é ±× Æ÷ÀÎÅÍ¸¦ °á°ú°ªÀ¸·Î º¸³¿
                    boNeedAdd:=True;
                  end;
                end;
              end;
            end;//004B653D
          end;//004B653D
          nError := 3;
          if not boNeedAdd then begin
            StdItem := UserEngine.GetStdItem(PTMapItem(pRemoveObject).UserItem.wIndex);
            if (StdItem <> nil) and (StdItem.StdMode = 48) and (StdItem.Shape = 0) then begin    //»óÇöÁÖ¸Ó´Ï
              ItemObjCount := 0;
              for i:=0 to MapCellInfo.ObjList.Count-1 do begin
                OSObject2 := MapCellInfo.ObjList.Items[i];
                if OSObject2.btType = OS_ITEMOBJECT then Inc(ItemObjCount);
              end;
              //»óÇöÁÖ¸Ó´Ï´Â 1°³ ÀÌ»ó ¸ø ½×´Â´Ù.
              if ItemObjCount >= 1 then begin //1°³ ÀÌ»ó ¸ø ½×´Â´Ù.
                Result := nil; //PTMapItem(PTAThing(pm.ObjList[i]).AObject); //¿¡·¯ÀÓ..
                boNeedAdd := TRUE;
              end;
            end else begin
              ItemObjCount := 0;
              for i:=0 to MapCellInfo.ObjList.Count-1 do begin
                OSObject2 := MapCellInfo.ObjList.Items[i];
                if OSObject2.btType = OS_ITEMOBJECT then Inc(ItemObjCount);
              end;
              if ItemObjCount >= 5 then begin //´õ ÀÌ»ó ¸ø ½×´Â´Ù.(5°³ Á¦ÇÑ)
                Result := nil; //PTMapItem(PTAThing(pm.ObjList[i]).AObject); //¿¡·¯ÀÓ..
                boNeedAdd := TRUE;
              end;
            end;
          end;
          nError := 4;
        end;//004B6558
        if btType = OS_EVENTOBJECT then begin
          nError := 5;
        end;
      end;//004B655C
      nError := 6;
      if not boNeedAdd then begin
        New(OSObject);
        OSObject.btType:=btType;
        OSObject.CellObj:=pRemoveObject;
        OSObject.dwAddTime:=GetTickCount();
        MapCellInfo.ObjList.Add(OSObject);
        Result:=Pointer(pRemoveObject);
        nError := 7;

        if btType = OS_ITEMOBJECT then begin     //°ü¸®ÀÚ½Ã½ºÅÛ
          Inc(m_nItemCount);
          Inc(g_MapManager.m_nItemCount);
        end;


      end;//004B659F
      nError := 8;
    end;//004B659F
  except
    MainOutMessage(Format(sExceptionMsg,[nError]));
  end;
end;

procedure TEnvirnoment.AddDoorToMap(); //004B6A74
var
  i:integer;
  Door:pTDoorInfo;
begin
  for i:=0 to m_DoorList.Count -1 do begin
    Door:=m_DoorList.Items[i];
    AddToMap(Door.nX,Door.nY,OS_DOOR,TObject(Door));
  end;
end;
function TEnvirnoment.GetMapCellInfo(nX,nY:Integer;var MapCellInfo:pTMapCellinfo):Boolean;//004B57D8
begin
  if (nX >= 0) and (nX < m_nWidth) and (nY >= 0) and (nY < m_nHeight) then begin
    MapCellInfo:=@MapCellArray[nX * m_nHeight + nY];
    Result:=True;
  end else begin//004B5829
    Result:=False;
  end;
end;
function TEnvirnoment.MoveToMovingObject (nCX, nCY:integer;Cert:TObject;nX,nY:Integer;boFlag:Boolean):Integer;//004B612C
var
  MapCellInfo:pTMapCellinfo;
  BaseObject:TBaseObject;
  OSObject:pTOSObject;
  i:Integer;
  bo1A:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::MoveToMovingObject';
label
  Loop,Over;
begin
  Result:=0;
  try
    bo1A:=True;
    if not boFlag and GetMapCellInfo(nX,nY,MapCellInfo) then begin
      if MapCellInfo.chFlag = 0 then begin
        if MapCellInfo.ObjList <> nil then begin
          for i:=0 to MapCellInfo.ObjList.Count -1 do begin//004B61AD
            if pTOSObject(MapCellInfo.ObjList.Items[i]).btType = OS_MOVINGOBJECT then begin
              BaseObject:=TBaseObject(pTOSObject(MapCellInfo.ObjList.Items[i]).CellObj);
              if BaseObject <> nil then begin//004B61DB
                if not BaseObject.m_boGhost
                and BaseObject.HoldPlace
                and not BaseObject.m_boDeath
                and not BaseObject.m_boFixedHideMode
                and not BaseObject.m_boObMode
                and not BaseObject.m_boPenetrateMode
                and not (BaseObject.m_btRaceServer = RC_PET)
                then begin
                  bo1A:=False;
                  Break;
                end;
              end;//004B6223
            end;//004B6223
          end;//004B622D
        end;//004B6238
      end else begin//004B622D   if MapCellInfo.chFlag = 0 then begin
        Result:= -1;
        bo1A:=False;
      end;//004B6238
    end;//004B6238
    if bo1A then begin  //004B6238
      if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag <> 0) then begin
        Result:= -1;
      end else begin//004B6265
        if GetMapCellInfo(nCX,nCY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          i:=0;
          while (True) do begin
            if MapCellInfo.ObjList.Count <= i then break;
            OSObject:=MapCellInfo.ObjList.Items[i];
            if OSObject.btType = OS_MOVINGOBJECT then begin
              if TBaseObject(OSObject.CellObj) = TBaseObject(Cert) then begin
                MapCellInfo.ObjList.Delete(i);
                Dispose(OSObject);
                if MapCellInfo.ObjList.Count <= 0 then begin
                  FreeAndNil(MapCellInfo.ObjList);
                  break;
                end;
                Continue;
              end;
             end;
            Inc(i);
          end;
        end;//4B6311
        if GetMapCellInfo(nX,nY,MapCellInfo) then begin
          if (MapCellInfo.ObjList = nil) then begin
            MapCellInfo.ObjList:=TList.Create;
          end;
          New(OSObject);
          OSObject.btType:=OS_MOVINGOBJECT;
          OSObject.CellObj:=Cert;
          OSObject.dwAddTime:=GetTickCount;
          MapCellInfo.ObjList.Add(OSObject);
          Result:=1;
        end;//004B6383
      end;//004B6383
    end;//004B6383
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg);
      MainOutMessage(E.Message);
    end;
  end;
//  pMapCellInfo = GetMapCellInfo(nX, nY);
end;

function TEnvirnoment.PetMoveToMovingObject (nCX, nCY:integer;Cert:TObject;nX,nY:Integer;boFlag:Boolean):Integer;//004B612C
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  i:Integer;
  bo1A:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::PetMoveToMovingObject';
label
  Loop,Over;
begin
  Result:=0;
  try
    bo1A:=True;
    if bo1A then begin  //004B6238
    {  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag <> 0) then begin
        Result:= -1;
      end else begin    }
        if GetMapCellInfo(nCX,nCY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
          i:=0;
          while (True) do begin
            if MapCellInfo.ObjList.Count <= i then break;
            OSObject:=MapCellInfo.ObjList.Items[i];
            if OSObject.btType = OS_MOVINGOBJECT then begin
              if TBaseObject(OSObject.CellObj) = TBaseObject(Cert) then begin
                MapCellInfo.ObjList.Delete(i);
                Dispose(OSObject);
                if MapCellInfo.ObjList.Count <= 0 then begin
                  FreeAndNil(MapCellInfo.ObjList);
                  break;
                end;
                Continue;
              end;
             end;
            Inc(i);
          end;
        end;
        if GetMapCellInfo(nX,nY,MapCellInfo) then begin
          if (MapCellInfo.ObjList = nil) then begin
            MapCellInfo.ObjList:=TList.Create;
          end;
          New(OSObject);
          OSObject.btType:=OS_MOVINGOBJECT;
          OSObject.CellObj:=Cert;
          OSObject.dwAddTime:=GetTickCount;
          MapCellInfo.ObjList.Add(OSObject);
          Result:=1;
        end;
    //  end;
    end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg);
      MainOutMessage(E.Message);
    end;
  end;
end;

//======================================================================
//¼ì²éµØÍ¼Ö¸¶¨×ù±êÊÇ·ñ¿ÉÒÔÒÆ¶¯
//boFlag  Èç¹ûÎªTRUE ÔòºöÂÔ×ù±êÉÏÊÇ·ñÓÐ½ÇÉ«
//·µ»ØÖµ True Îª¿ÉÒÔÒÆ¶¯£¬False Îª²»¿ÉÒÔÒÆ¶¯
//======================================================================
function TEnvirnoment.CanWalk(nX, nY: Integer; boFlag: Boolean = False): Boolean;//004B5ED0
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject       :TBaseObject;
  i:Integer;
begin
  Result:=False;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
    Result:=True;
    if not boFlag and (MapCellInfo.ObjList <> nil) then begin
      for i:=0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if OSObject.btType = OS_MOVINGOBJECT then begin
          BaseObject:=TBaseObject(OSObject.CellObj);
          if BaseObject <> nil then begin
            if not BaseObject.m_boGhost
            and BaseObject.HoldPlace
            and not BaseObject.m_boDeath
            and not BaseObject.m_boFixedHideMode
            and not BaseObject.m_boObMode
            and not BaseObject.m_boPenetrateMode
            and not (BaseObject.m_btRaceServer = RC_PET) then begin
              Result:=False;
              Break;
            end;
          end;//004B5FB5
        end;//004B5FB5
      end;
    end;
  end;//004B5FBD
end;

//======================================================================
//¼ì²éµØÍ¼Ö¸¶¨×ù±êÊÇ·ñ¿ÉÒÔÒÆ¶¯
//boFlag  Èç¹ûÎªTRUE ÔòºöÂÔ×ù±êÉÏÊÇ·ñÓÐ½ÇÉ«
//·µ»ØÖµ True Îª¿ÉÒÔÒÆ¶¯£¬False Îª²»¿ÉÒÔÒÆ¶¯
//======================================================================
function TEnvirnoment.CanWalkOfItem(nX, nY: Integer; boFlag,boItem: Boolean): Boolean;//004B5ED0
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject       :TBaseObject;
  i:Integer;
begin
  Result:=True;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
//    Result:=True;
    if  (MapCellInfo.ObjList <> nil) then begin
      for i:=0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if not boFlag and (OSObject.btType = OS_MOVINGOBJECT) then begin
          BaseObject:=TBaseObject(OSObject.CellObj);
          if BaseObject <> nil then begin
            if not BaseObject.m_boGhost
            and BaseObject.HoldPlace
            and not BaseObject.m_boDeath
            and not BaseObject.m_boFixedHideMode
            and not BaseObject.m_boObMode
            and not BaseObject.m_boPenetrateMode
            and not (BaseObject.m_btRaceServer = RC_PET) then begin
              Result:=False;
              Break;
            end;
          end;//004B5FB5
        end;//004B5FB5
        if not boItem and (OSObject.btType = OS_ITEMOBJECT) then begin
          Result:=False;
          break;
        end;
      end;
    end;
  end;//004B5FBD
end;

function TEnvirnoment.CanWalkEx(nX, nY: Integer; boFlag: Boolean): Boolean;//004B5ED0
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject       :TBaseObject;
  i:Integer;
  Castle:TUserCastle;
begin
  Result:=False;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
    Result:=True;
    if not boFlag and (MapCellInfo.ObjList <> nil) then begin
      for i:=0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if OSObject.btType = OS_MOVINGOBJECT then begin
          BaseObject:=TBaseObject(OSObject.CellObj);
          if BaseObject <> nil then begin
            Castle:=g_CastleManager.InCastleWarArea(BaseObject);
            if g_Config.boWarDisHumRun and (Castle <> nil) and (Castle.m_boUnderWar) then begin
            end else begin
              if BaseObject.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT] then begin
                if g_Config.boRunHuman or Flag.boRUNHUMAN then Continue;
              end else begin
                if BaseObject.m_btRaceServer = RC_NPC then begin
                  if g_Config.boRunNpc then Continue;
                end else begin
                  if BaseObject.m_btRaceServer in [RC_GUARD,RC_MOVEGUARD,RC_ARCHERGUARD] then begin
                    if g_Config.boRunGuard then Continue;
                  end else begin
                    if g_Config.boRunMon or Flag.boRUNMON then Continue;
                  end;
                end;
              end;
            end;

            if not BaseObject.m_boGhost
            and BaseObject.HoldPlace
            and not BaseObject.m_boDeath
            and not BaseObject.m_boFixedHideMode
            and not BaseObject.m_boObMode
            and not BaseObject.m_boPenetrateMode
            and not (BaseObject.m_btRaceServer = RC_PET) then begin
              Result:=False;
              Break;
            end;
          end;//004B5FB5
        end;//004B5FB5
      end;
    end;
  end;//004B5FBD
end;

constructor TMapManager.Create;
begin
  inherited Create;
  m_nMonCount := 0;            //°ü¸®ÀÚ½Ã½ºÅÛ
  m_nHumCount := 0;            //°ü¸®ÀÚ½Ã½ºÅÛ
  m_nItemCount := 0;           //°ü¸®ÀÚ½Ã½ºÅÛ
  m_nNpcCount := 0;            //°ü¸®ÀÚ½Ã½ºÅÛ
  m_DuelMaps := TList.Create;
end;

destructor TMapManager.Destroy;
var
  I: Integer;
begin
  m_DuelMaps.Free;
  for I := 0 to Count - 1 do begin
    TEnvirnoment(Items[I]).Free;
  end;
  inherited;
end;
     //Envir:TEnvirnoment
function TMapManager.FindMapName(sMapName: String): String;//4B7350
var
  Map:TEnvirnoment;
  i:Integer;
begin
  Result:='';
  Lock;
  try
    for i:=0 to Count -1 do begin
      Map:=TEnvirnoment(Items[i]);
      if CompareText(Map.sMapName,sMapName) = 0 then begin
        Result:=Map.sMapDesc;
        Break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TMapManager.MapFindName(sMapName: String): TEnvirnoment;//4B7350
var
  Map:TEnvirnoment;
  i:Integer;
begin
  Result:=nil;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Map:=TEnvirnoment(Items[i]);
      if CompareText(Map.sMapDesc,sMapName) = 0 then begin
        Result:=Map;
        Break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TMapManager.FindMap(sMapName: String): TEnvirnoment;//4B7350
var
  Map:TEnvirnoment;
  i:Integer;
begin
  Result:=nil;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Map:=TEnvirnoment(Items[i]);
      if CompareText(Map.sMapName,sMapName) = 0 then begin
        Result:=Map;
        Break;
      end;
    end;
  finally
    UnLock;
  end;
end;
function TMapManager.FindMapEx(sMapName: String;GTNumber: integer): TEnvirnoment;//4B7350
var
  Map:TEnvirnoment;
  i:Integer;
begin
  Result:=nil;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Map:=TEnvirnoment(Items[i]);
      if (CompareText(Map.sMapName,sMapName) = 0) and (Map.Flag.nGuildTerritory = GTNumber) then begin
        Result:=Map;
        Break;
      end;
    end;
  finally
    UnLock;
  end;
end;

function TMapManager.GetMapInfo(nServerIdx: Integer;sMapName: String): TEnvirnoment; //004B7424
var
  i:Integer;
  Envir:TEnvirnoment;
begin
  Result:=nil;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Envir:=Items[i];
      if (Envir.nServerIndex = nServerIdx) and (CompareText(Envir.sMapName,sMapName) = 0) then begin
        Result:=Envir;
        break;
      end;
    end;//004B74C8
  finally
    Unlock;
  end;
end;

function TMapManager.GetMapInfoEX(nServerIdx,GTNumber: Integer;sMapName: String): TEnvirnoment; //004B7424
var
  i:Integer;
  Envir:TEnvirnoment;
begin
  Result:=nil;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Envir:=Items[i];
      if (Envir.nServerIndex = nServerIdx) and (CompareText(Envir.sMapName,sMapName) = 0) and (Envir.Flag.nGuildTerritory = GTNumber) then begin
        Result:=Envir;
        break;
      end;
    end;//004B74C8
  finally
    Unlock;
  end;
end;

function TEnvirnoment.DeleteFromMap(nX, nY: Integer; btType: Byte;
  pRemoveObject: TObject): Integer; //004B6710
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  n18:integer;
  nDeleteCount: Integer;
ResourceString
  sExceptionMsg1 = '[Exception] TEnvirnoment::DeleteFromMap -> Except 1 ** %d';
  sExceptionMsg2 = '[Exception] TEnvirnoment::DeleteFromMap -> Except 2 ** %d';
begin
  Result:= -1;
  try
    if GetMapCellInfo(nX,nY,MapCellInfo) then begin
      if MapCellInfo <> nil then begin
        try
          if MapCellInfo.ObjList <> nil then begin
            n18:=0;
            nDeleteCount := 0;
            while (True) do begin
              if MapCellInfo.ObjList.Count <= n18 then break;
              OSObject:=MapCellInfo.ObjList.Items[n18];
              if OSObject <> nil then begin
                if (OSObject.btType = btType) and (OSObject.CellObj = pRemoveObject) then begin
                  MapCellInfo.ObjList.Delete(n18);
                  DisPose(OSObject);
                  Result:=1;

                  if (btType = OS_ITEMOBJECT) then begin      //°ü¸®ÀÚ½Ã½ºÅÛ
                    if (nDeleteCount = 0) then begin
                      Dec(m_nItemCount);
                      Dec(g_MapManager.m_nItemCount);
                    end;
                  end;
                  if (btType = OS_MOVINGOBJECT) then begin
                    TBaseObject(pRemoveObject).DelMapCount;
                  end;
                  nDeleteCount := nDeleteCount + 1;

                  if MapCellInfo.ObjList.Count <= 0 then begin
                    FreeAndNil(MapCellInfo.ObjList);
                    break;
                  end;
                  Continue;

                end
              end else begin
                MapCellInfo.ObjList.Delete(n18);
                if MapCellInfo.ObjList.Count > 0 then Continue;
                if MapCellInfo.ObjList.Count <= 0 then begin
                  FreeAndNil(MapCellInfo.ObjList);
                  break;
                end;
              end;
              Inc(n18);
            end;
          end else begin
            Result:= -2;
          end;
        except
          OSObject:=nil;
          MainOutMessage(format(sExceptionMsg1,[btType]));
        end;
      end else Result:= -3;
    end else Result:=0;
  except
    MainOutMessage(format(sExceptionMsg2,[btType]));
  end;
end;

function TEnvirnoment.GetItem(nX, nY: Integer): PTMapItem; //004B5B0C
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=nil;
  BoCanGetItem:=False;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
    BoCanGetItem:=True;
    if MapCellInfo.ObjList <> nil then begin
      for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if OSObject.btType = OS_ITEMOBJECT then begin
          Result:=PTMapItem(OSObject.CellObj);
          exit;
        end;
        if OSObject.btType = OS_GATEOBJECT then
          BoCanGetItem:=False;
        if OSObject.btType = OS_MOVINGOBJECT then begin
          BaseObject:=TBaseObject(OSObject.CellObj);
          if not BaseObject.m_boDeath and
            not (BaseObject.m_btRaceServer = RC_PET) and
            not BaseObject.m_boPenetrateMode then
            BoCanGetItem:=False;
        end;
      end;
    end;      
  end;
end;

function TMapManager.GetMapOfServerIndex(sMapName: String): Integer; //004B7510
var
  i:Integer;
  Envir:TEnvirnoment;
begin
  Result:=0;
  Lock;
  try
    for i:=0 to Count -1 do begin
      Envir:=Items[i];
      if (CompareText(Envir.sMapName,sMapName) = 0) then begin
        Result:=Envir.nServerIndex;
        break;
      end;
    end;
  finally
    UnLock;
  end;
end;

procedure TMapManager.LoadMapDoor; //004B6FFC
var
  i:Integer;
begin
  for i:=0 to Count -1 do begin
     TEnvirnoment(Items[i]).AddDoorToMap;
  end;
end;
procedure TMapManager.ProcessMapDoor;
begin

end;

procedure TMapManager.ReSetMinMap;
var
  I,II: Integer;
  Envirnoment:TEnvirnoment;
begin
  for I := 0 to Count - 1 do begin
    Envirnoment:=TEnvirnoment(Items[I]);
    for II := 0 to MiniMapList.Count - 1 do begin
      if CompareText(MiniMapList.Strings[II],Envirnoment.sMapName) = 0 then begin
        Envirnoment.nMinMap:=Integer(MiniMapList.Objects[II]);
        break;
      end;
    end;
  end;
end;

procedure TMapManager.ReSetBigMap;
var
  I,II: Integer;
  Envirnoment:TEnvirnoment;
begin
  for I := 0 to Count - 1 do begin
    Envirnoment:=TEnvirnoment(Items[I]);
    for II := 0 to BigMapList.Count - 1 do begin
      if CompareText(BigMapList.Strings[II],Envirnoment.sMapName) = 0 then begin
        Envirnoment.nBigMap:=Integer(BigMapList.Objects[II]);
        break;
      end;
    end;
  end;
end;

function TEnvirnoment.IsCheapStuff: Boolean; //004B6E24
begin
  if m_QuestList.Count > 0 then Result:=True
  else Result:=False;    
end;

function TEnvirnoment.AddToMapMineEvent(nX,nY:Integer;nType:Integer;Event:TObject):TObject; //004B6600
var
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  bo19,bo1A:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::AddToMapMineEvent ';
begin
  Result:=nil;
  try
    bo19:=GetMapCellInfo(nX,nY,MapCellInfo);
    bo1A:=False;
    if bo19 and (MapCellInfo.chFlag <> 0) then begin
      if MapCellInfo.ObjList = nil then MapCellInfo.ObjList:=TList.Create;
      if not bo1A then begin
        New(OSObject);
        OSObject.btType    := nType;
        OSObject.CellObj   := Event;
        OSObject.dwAddTime := GetTickCount();
        MapCellInfo.ObjList.Add(OSObject);
        Result:=Event;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

procedure TEnvirnoment.VerifyMapTime(nX,nY:Integer;BaseObject:TObject); //004B6980
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  boVerify:Boolean;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::VerifyMapTime';
begin
  try
    boVerify:=False;
    if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo <> nil) and (MapCellInfo.ObjList <> nil) then begin
      for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if (OSObject.btType = OS_MOVINGOBJECT) and (OSObject.CellObj = BaseObject) then begin
          OSObject.dwAddTime:=GetTickCount();
          boVerify:=True;
          break;
        end;
      end;
    end;
    if not boVerify then
      AddToMap(nX,nY,OS_MOVINGOBJECT,BaseObject);
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

constructor TEnvirnoment.Create; //004B5318
begin
  Pointer(MapCellArray):=nil;
  sMapName     := '';
  nServerIndex := 0;
  nMinMap      := 0;
  nBigMap      := 0;
  FillChar(Flag, SizeOf(TMapFlag), #0);
  m_nWidth     := 0;
  m_nHeight    := 0;
 { m_boDARK     := False;
  m_boDAY      := False;}
  m_boMonGen   := True;             //°ü¸®ÀÚ½Ã½ºÅÛ
  m_boHumGen   := False;
  m_nMobZenDelay := 100;            //°ü¸®ÀÚ½Ã½ºÅÛ º¯°æ
  m_nMobZenRate := 100;              //°ü¸®ÀÚ½Ã½ºÅÛ º¯°æ
  m_nMonCount  := 0;
  m_nHumCount  := 0;
  m_nHeroCount := 0;
  m_nNpcCount  := 0;
  m_nItemCount := 0;
  m_DoorList   := TList.Create;
  m_QuestList  := TList.Create;
  m_boOpenStore := False;       //°³ÀÎ»óÁ¡
  m_boNoRecallHero  := False;    
end;

destructor TEnvirnoment.Destroy;
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  nX,nY:Integer;
  DoorInfo:pTDoorInfo;
begin
  for nX:= 0 to m_nWidth - 1 do begin
    for nY:= 0 to m_nHeight - 1 do begin
      if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil)  then begin
        for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
          OSObject:=MapCellInfo.ObjList.Items[I];
          case OSObject.btType of
            OS_ITEMOBJECT  :Dispose(PTMapItem(OSObject.CellObj));
            OS_GATEOBJECT  :Dispose(pTGateObj(OSObject.CellObj));
            OS_EVENTOBJECT :TEvent(OSObject.CellObj).Free;
          end;
          Dispose(OSObject);
        end;
        MapCellInfo.ObjList.Free;
        MapCellInfo.ObjList:=nil;
      end;
    end;
  end;

  for I := 0 to m_DoorList.Count - 1 do begin
    DoorInfo:=m_DoorList.Items[I];
    Dec(DoorInfo.Status.nRefCount);
    if DoorInfo.Status.nRefCount <= 0 then
      Dispose(DoorInfo.Status);
      
    Dispose(DoorInfo);
  end;
  FreeAndNil(m_DoorList);
  for I := 0 to m_QuestList.Count - 1 do begin
    Dispose(pTMapQuestInfo(m_QuestList.Items[I]));
  end;
  FreeAndNil(m_QuestList);
  FreeMem(Pointer(MapCellArray));
  Pointer(MapCellArray):=nil;
  inherited;
end;

function TEnvirnoment.LoadFormatType(sMapFile: String; var bMapType: byte): Integer;
var
  fHandle, nMapSize: Integer;
  Header: TMapHeader;
  ENMapHeader: TENMapHeader;
  sFileDir:String;
  boENMap: Boolean;
begin
  Result := 0;
  bMapType := 0;
  if FileExists(g_config.sMapDir + sMapFile) then begin
    sFileDir:=g_config.sMapDir + sMapFile;
  end else begin
    if FileExists(g_config.sMapEIDir + sMapFile) then begin
      sFileDir:=g_config.sMapEIDir + sMapFile;
    end else begin
      if FileExists(g_config.sShandaMapDir + sMapFile) then begin
        sFileDir:=g_config.sShandaMapDir + sMapFile;
      end;
    end;
  end;
  fHandle := FileOpen(sFileDir, fmOpenRead or fmShareExclusive);
  if fHandle > 0 then begin
    FileRead(fHandle, ENMapHeader, SizeOf(TENMapHeader));
    if (ENMapHeader.Title = '') then begin
      Result := 3;
      bMapType := 3;
    end else begin
      boENMap := (ENMapHeader.Title = 'Map 2010 Ver 1.0');
      if boENMap then begin
        Result:=1;
        bMapType := 1;
      end else begin
        Move(ENMapHeader, header, SizeOf(header));
        if (header.sTitle[14] = #$D) and (header.sTitle[15] = #$A) then begin
          Result:=2;
          bMapType := 2;
        end else begin
          Result := 0;
          bMapType := 0;
        end;
      end;
    end;
  end;
  fileclose(fhandle);
end;

function TEnvirnoment.LoadMapData(sMapFile: string; bMapType: byte): Boolean;
var
  MapFile: string;
  fHandle: Integer;
  Header: TMapHeader;
  nMapSize, nOldMapSize: Integer;
  n24, nW, nH: Integer;
  MapBuffer: pTMap;
  OldMapBuffer: pTOldMap;
  Point: Integer;
  Door: pTDoorInfo;
  I: Integer;
  MapCellInfo: pTMapCellinfo;
  ENMapHeader: TENMapHeader;
  supernewmapdata: array of TSdomapinfo2012;
  boENMap: Boolean;
  ENMapData: array of TENMapInfo;
  boShanda: Boolean;
  boNewMap: Boolean;
begin
  Result := False;
  case bMapType of
    0, 1 : MapFile := g_config.sMapDir + sMapFile;
    2: MapFile := g_config.sShandaMapDir + sMapFile;
  end;
  if FileExists(MapFile) then begin
    fHandle := FileOpen(MapFile, fmOpenRead or fmShareExclusive);
    if fHandle > 0 then begin
        boShanda := False;
        boNewMap := False;
        FileRead(fHandle, ENMapHeader, Sizeof(TENMapHeader));
        boENMap := (ENMapHeader.Title = 'Map 2010 Ver 1.0');
        if boENMap then begin
          Header.wWidth := ENMapHeader.Width xor $AA38;
          Header.wHeight := ENMapHeader.Height xor $AA38;
        end else begin
          Move(ENMapHeader, Header, SizeOf(Header));
          if (Header.sTitle[14] = #$D) and (Header.sTitle[15] = #$A) then
            if bMapType = 2 then begin
              boShanda := True;
            //end else begin
            //  boNewMap := True;
            end;
          FileSeek(fHandle, SizeOf(Header), 0);
        end;
        if (Header.wWidth <= 1000) and (Header.wHeight <= 1000) then begin
          m_nWidth := Header.wWidth;
          m_nHeight := Header.wHeight;
          Initialize(m_nWidth, m_nHeight);
          nMapSize := m_nWidth * SizeOf(TMapUnitInfo) * m_nHeight;
          MapBuffer := AllocMem(nMapSize);
          if boENMap then begin
            SetLength(ENMapData, m_nWidth * m_nHeight);
            FileRead(fHandle, ENMapData[0], Length(ENMapData) * SizeOf(TENMapInfo));
            for I := Low(ENMapData) to High(ENMapData) do begin
              MapBuffer[i].wBkImg := ENMapData[i].BkImg xor $AA38AA38;
              MapBuffer[i].wMidImg := ENMapData[i].MidImg xor $AA38;
              MapBuffer[i].wFrImg := ENMapData[i].FrImg xor $AA38;
              MapBuffer[i].btDoorIndex := ENMapData[i].DoorIndex;
              MapBuffer[i].btDoorOffset := ENMapData[i].DoorOffset;
              MapBuffer[i].btAniFrame := ENMapData[i].AniFrame;
              MapBuffer[i].btAniTick := ENMapData[i].AniTick;
              MapBuffer[i].btArea := ENMapData[i].Area;
              MapBuffer[i].btlight := ENMapData[i].light;
              MapBuffer[i].AniTileImg := 0;
              MapBuffer[i].AniTileFrame := 0;
              MapBuffer[i].AniTileTiles := 0;
              MapBuffer[i].btBkIndex := 0;
              MapBuffer[i].MidIndex := 0;
            end;
            ENMapData := nil;
          end else
          if boNewMap then begin
            FileRead(fHandle, MapBuffer^, nMapSize);
          end else
          if boShanda then begin
            SetLength(supernewMapData, m_nWidth * m_nHeight);
            FileRead(fHandle, supernewMapData[0], Length(supernewMapData) * SizeOf(TsdoMapInfo2012));
            for I := Low(supernewMapData) to High(supernewMapData) do begin
              MapBuffer[i].wBkImg := supernewMapData[i].BkImg;
              MapBuffer[i].wMidImg := supernewMapData[i].MidImg;
              MapBuffer[i].wFrImg := supernewMapData[i].FrImg;
              MapBuffer[i].btDoorIndex := supernewMapData[i].DoorIndex;
              MapBuffer[i].btDoorOffset := supernewMapData[i].DoorOffset;
              MapBuffer[i].btAniFrame := supernewMapData[i].AniFrame;
              MapBuffer[i].btAniTick := supernewMapData[i].AniTick;
              MapBuffer[i].btArea := 120 + supernewMapData[i].Area;
              MapBuffer[i].btlight := supernewMapData[i].light;
              MapBuffer[i].btBkIndex := 100 + supernewMapData[i].BkIndex;
              MapBuffer[i].MidIndex := 110 + supernewMapData[i].MidIndex;
              MapBuffer[i].AniTileImg := supernewMapData[i].AniTileImg;
              MapBuffer[i].AniTileFrame := supernewMapData[i].AniTileFrame;
              MapBuffer[i].AniTileTiles := supernewMapData[i].AniTileTiles;
              if ((MapBuffer[i].wBkImg and $8000) <> 0) then
                MapBuffer[i].wBkImg := (MapBuffer[i].wBkImg and $7FFF) or $20000000;
            end;
            supernewMapData := nil;
          end else begin
            nOldMapSize := m_nWidth * SizeOf(TOldMapUnitInfo) * m_nHeight;
            OldMapBuffer := AllocMem(nOldMapSize);
            Try
              FileRead(fHandle, OldMapBuffer^, nOldMapSize);
              for I := 0 to (m_nWidth * m_nHeight) - 1 do begin
                Move(OldMapBuffer[I], MapBuffer[i], SizeOf(TOldMapUnitInfo));
                MapBuffer[i].wBkImg := OldMapBuffer[i].wBkImg;
                MapBuffer[i].wMidImg := OldMapBuffer[i].wMidImg;
                MapBuffer[i].wFrImg := OldMapBuffer[i].wFrImg;
                MapBuffer[i].btDoorIndex := OldMapBuffer[i].btDoorIndex;
                MapBuffer[i].btDoorOffset := OldMapBuffer[i].btDoorOffset;
                MapBuffer[i].btAniFrame := OldMapBuffer[i].btAniFrame;
                MapBuffer[i].btAniTick := OldMapBuffer[i].btAniTick;
                MapBuffer[i].btArea := OldMapBuffer[i].btArea;
                MapBuffer[i].btlight := OldMapBuffer[i].btlight;
                MapBuffer[i].AniTileImg := 0;
                MapBuffer[i].AniTileFrame := 0;
                MapBuffer[i].AniTileTiles := 0;
                MapBuffer[i].btBkIndex := 1;
                MapBuffer[i].MidIndex := 0;
                if ((MapBuffer[i].wBkImg and $8000) <> 0) then
                  MapBuffer[i].wBkImg := (MapBuffer[i].wBkImg and $7FFF) or $20000000;
              end;
            Finally
              FreeMem(OldMapBuffer);
            End;
          end;

          for nW := 0 to m_nWidth - 1 do begin
            n24 := nW * m_nHeight;
            for nH := 0 to m_nHeight - 1 do begin
              if (MapBuffer[n24 + nH].wBkImg) and $20000000 <> 0 then begin
                MapCellInfo := @MapCellArray[n24 + nH];
                MapCellInfo.chFlag := 1;
              end;
              if MapBuffer[n24 + nH].wFrImg and $8000 <> 0 then begin
                MapCellInfo := @MapCellArray[n24 + nH];
                MapCellInfo.chFlag := 2;
              end;
              if MapBuffer[n24 + nH].btDoorIndex and $80 <> 0 then begin
                Point := (MapBuffer[n24 + nH].btDoorIndex and $7F);
                if Point > 0 then begin
                  New(Door);
                  Door.nX := nW;
                  Door.nY := nH;
                  Door.nPoint := Point;
                  Door.Status := nil;
                  for I := 0 to m_DoorList.Count - 1 do begin
                    if abs(pTDoorInfo(m_DoorList.Items[I]).nX - Door.nX) <= 10 then begin
                      if abs(pTDoorInfo(m_DoorList.Items[I]).nY - Door.nY) <= 10 then begin
                        if pTDoorInfo(m_DoorList.Items[I]).nPoint = Point then begin
                          Door.Status := pTDoorInfo(m_DoorList.Items[I]).Status;
                          Inc(Door.Status.nRefCount);
                          break;
                        end;
                      end;
                    end;
                  end;
                  if Door.Status = nil then begin
                    New(Door.Status);
                    Door.Status.boOpened := False;
                    Door.Status.bo01 := False;
                    Door.Status.n04 := 0;
                    Door.Status.dwOpenTick := 0;
                    Door.Status.nRefCount := 1;
                  end;
                  m_DoorList.Add(Door);
                end;
              end;
            end;
          end;
          FreeMem(MapBuffer);
          FileClose(fHandle);
          Result := True;
        end;
    end;
  end;
end;

function TEnvirnoment.LoadMapDataEI(sMapFile: string): Boolean;
var
  fHandle: Integer;
  HeaderEI : TMapHeaderEI;
  nMapSize: Integer;
  n24, nW, nH: Integer;
  MapBufferEI : PMapEI;
  Point: Integer;
  Door: pTDoorInfo;
  I,II: Integer;
  MapCellInfo: pTMapCellinfo;
  sFileName: string;
  sLineText, sX, sY: string;
  LoadList: TStringList;
  nX, nY: Integer;
  nCode:Integer;
begin
  Result := False;
  if FileExists(sMapFile) then begin
    fHandle := FileOpen(sMapFile, fmOpenRead or fmShareExclusive);
    if fHandle > 0 then begin
      FileRead(fHandle, HeaderEI, SizeOf(TMapHeaderEI));
      m_nWidth := HeaderEI.Width;
      m_nHeight := HeaderEI.Height;
      InitializeEI(m_nWidth, m_nHeight);
      nMapSize := m_nWidth * SizeOf(TMapInfoEi2OB) * m_nHeight;
      MapBufferEI := AllocMem(nMapSize);
      FileSeek(fHandle,(m_nWidth * m_nHeight div 4)*Sizeof(TMapInfoEi2Tite),1);
      FileRead(fHandle, MapBufferEI^, nMapSize);
      for nW := 0 to m_nWidth - 1 do begin
        n24 := nW * m_nHeight;
        for nH := 0 to m_nHeight - 1 do begin
          if (MapBufferEI[n24 + nH].bflag) and $1  = 0 then begin
            MapCellInfo := @MapCellArray[n24 + nH];
            MapCellInfo.chFlag := 1;
          end else begin
            MapCellInfo := @MapCellArray[n24 + nH];
            MapCellInfo.chFlag := 0;
          end;                                                        //004B5601
                                                            //004B562C
          if MapBufferEI[n24 + nH].btDoorIndex and $80 <> 0 then begin
            Point := (MapBufferEI[n24 + nH].btDoorIndex and $7F);
            if Point > 0 then begin
              New(Door);
              Door.nX := nW;
              Door.nY := nH;
              Door.nPoint := Point;
              Door.Status := nil;
              for I := 0 to m_DoorList.Count - 1 do begin
                if abs(pTDoorInfo(m_DoorList.Items[I]).nX - Door.nX) <= 10 then begin
                  if abs(pTDoorInfo(m_DoorList.Items[I]).nY - Door.nY) <= 10 then begin
                    if pTDoorInfo(m_DoorList.Items[I]).nPoint = Point then begin
                      Door.Status := pTDoorInfo(m_DoorList.Items[I]).Status;
                      Inc(Door.Status.nRefCount);
                      break;
                    end;
                  end;
                end;
              end;
              if Door.Status = nil then begin
                New(Door.Status);
                Door.Status.boOpened := False;
                Door.Status.bo01 := False;
                Door.Status.n04 := 0;
                Door.Status.dwOpenTick := 0;
                Door.Status.nRefCount := 1;
              end;
              m_DoorList.Add(Door);
            end;
          end;
        end;
      end;
      FreeMem(MapBufferEI);
      FileClose(fHandle);
      Result := True;
    end;
  end;
end;


procedure TEnvirnoment.Initialize(nWidth, nHeight: Integer);//004B53FC
var
  nW,nH:Integer;
  MapCellInfo:pTMapCellinfo;
begin
  if (nWidth > 1) and (nHeight > 1) then begin
    if MapCellArray <> nil then begin
      for nW:= 0 to m_nWidth -1 do begin
        for nH:= 0 to m_nHeight -1 do begin
          MapCellInfo:=@MapCellArray[nW * m_nHeight + nH];
          if MapCellInfo.ObjList <> nil then begin
            MapCellInfo.ObjList.Free;
            MapCellInfo.ObjList:=nil;
          end;
        end;
      end;
      FreeMem(Pointer(MapCellArray));
      Pointer(MapCellArray):=nil;
    end;//004B54AF
    Pointer(MapCellArray):=AllocMem((m_nWidth * m_nHeight) * SizeOf(TMapCellinfo));
  end;//004B54DB
end;

procedure TEnvirnoment.InitializeEI(nWidth, nHeight: Integer);
var
  nW, nH: Integer;
  MapCellInfo: PTMapCellinfo;
begin
  if (nWidth > 1) and (nHeight > 1) then begin
    if MapCellArray <> nil then begin
      for nW := 0 to m_nWidth - 1 do begin
        for nH := 0 to m_nHeight - 1 do begin
          MapCellInfo := @MapCellArray[nW * m_nHeight + nH];
          if MapCellInfo.ObjList <> nil then begin
            FreeAndNil(MapCellInfo.ObjList);
          end;
        end;
      end;
     Setlength(MapCellArray,0);
    end;
    m_nWidth := nWidth;
    m_nHeight := nHeight;
    SetLength(MapCellArray,m_nWidth * m_nHeight);
  end;
end;

//nFlag,boFlag,Monster,Item,Quest,boGrouped
function TEnvirnoment.CreateQuest(nFlag, nValue: Integer; sMonName, sItem, sQuest: String;
  boGrouped: Boolean): Boolean; //004B6C3C
var
  MapQuest:pTMapQuestInfo;
  MapMerchant:TMerchant;
begin
  Result:=False;
  if nFlag < 0 then exit;
  New(MapQuest);
  MapQuest.nFlag:=nFlag;
  if nValue > 1 then nValue:=1;
  MapQuest.nValue:=nValue;
  if sMonName = '*' then sMonName:='';
  MapQuest.sMonName:=sMonName;
  if sItem = '*' then sItem:='';
  MapQuest.sItemName:=sItem;
  if sQuest = '*' then sQuest:='';
  MapQuest.boGrouped      := boGrouped;


  MapMerchant             := TMerchant.Create;
  MapMerchant.m_NpcType   := n_Norm;
  MapMerchant.m_sMapName  := '0';
  MapMerchant.m_nCurrX    := 0;
  MapMerchant.m_nCurrY    := 0;
  MapMerchant.m_sCharName := sQuest;
  MapMerchant.m_nFlag     := 0;
  MapMerchant.m_wAppr     := 0;
  MapMerchant.m_sFilePath := 'MapQuest_def\';
  MapMerchant.m_boIsHide  := True;
  MapMerchant.m_boIsQuest := False;

  UserEngine.QuestNPCList.Add(MapMerchant);
  MapQuest.NPC:=MapMerchant;
  m_QuestList.Add(MapQuest);
  Result:=True;
end;

function TEnvirnoment.GetXYObjCount(nX, nY: Integer): Integer; //004B5DB0
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=0;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
    for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_MOVINGOBJECT then begin
        BaseObject:=TBaseObject(OSObject.CellObj);
        if BaseObject <> nil then begin
          if not BaseObject.m_boGhost and
             BaseObject.HoldPlace and
             not BaseObject.m_boDeath and
             not BaseObject.m_boFixedHideMode and
             not BaseObject.m_boObMode and
             not BaseObject.m_boPenetrateMode and
             not (BaseObject.m_btRaceServer = RC_PET) then begin
            Inc(Result);
          end;
        end;
      end;
    end;
  end;
end;
//004B2A6C
function TEnvirnoment.GetNextPosition(sx, sy, ndir, ndist:Integer;var snx:Integer;var sny:Integer):Boolean;
begin
   snx := sx;
   sny := sy;
   case nDir of
     DR_UP: if sny > ndist - 1 then Dec(sny,ndist);
     DR_DOWN: if sny < (m_nWidth - ndist) then Inc(sny,ndist);
     DR_LEFT: if snx > ndist - 1 then Dec(snx,ndist);
     DR_RIGHT: if snx < (m_nWidth - ndist) then Inc(snx,ndist);
     DR_UPLEFT: begin
       if (snx > ndist - 1) and (sny > ndist - 1) then begin
         Dec(snx,ndist);
         Dec(sny,ndist);
       end;
     end;
     DR_UPRIGHT: begin //004B2B77
       if (snx > ndist - 1) and (sny < (m_nHeight - ndist)) then begin
         Inc(snx,ndist);
         Dec(sny,ndist);
       end;
     end;
     DR_DOWNLEFT: begin //004B2BAC
       if (snx < (m_nWidth - ndist)) and (sny > ndist - 1) then begin
         Dec(snx,ndist);
         Inc(sny,ndist);
       end;
     end;
     DR_DOWNRIGHT: begin
       if (snx < (m_nWidth - ndist)) and (sny < (m_nHeight - ndist)) then begin
         Inc(snx,ndist);
         Inc(sny,ndist);
       end;
     end;
   end;
   if (snx = sx) and (sny = sy) then Result:=False
   else Result:=True;
     
end;

function TEnvirnoment.CanSafeWalk(nX, nY: Integer): Boolean; //004B609C
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
begin
  Result:=True;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil)then begin
    for I := MapCellInfo.ObjList.Count -1 downto 0 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_EVENTOBJECT then begin
        if (TEvent(OSObject.CellObj).m_nDamage > 0) and not (TEvent(OSObject.CellObj).m_nEventMove) then Result:=False;
      end;
    end;
  end;
end;

function TEnvirnoment.ArroundDoorOpened(nX, nY: Integer): Boolean; //004B6B48
var
  I: Integer;
  Door:pTDoorInfo;
ResourceString
  sExceptionMsg = '[Exception] TEnvirnoment::ArroundDoorOpened ';
begin
  Result:=True;
  try
    for I := 0 to m_DoorList.Count - 1 do begin
      Door:=m_DoorList.Items[i];
      if (abs(Door.nX - nX) <= 1) and ((abs(Door.nY - nY) <= 1)) then begin
        if not Door.Status.boOpened then begin
          Result:=False;
          break;
        end;
      end;
    end;
  except
    MainOutMessage(sExceptionMsg);
  end;
end;

function TEnvirnoment.GetMovingObject(nX,nY:Integer;boFlag:Boolean): Pointer; //004B5838
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=nil;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil)  then begin
    for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_MOVINGOBJECT then begin
        BaseObject:=TBaseObject(OSObject.CellObj);
        if ((BaseObject <> nil) and
           (not BaseObject.m_boGhost) and
           not (BaseObject.m_btRaceServer = RC_PET) and
           (BaseObject.HoldPlace)) and
           ((not boFlag) or (not BaseObject.m_boDeath)) then begin

          Result:=BaseObject;
          break;
        end;
      end;
    end;
  end;
end;

function TEnvirnoment.GetQuestNPC(BaseObject: TObject;sCharName,sItem: String;boFlag:Boolean): TObject; //004B6E4C
var
  I: Integer;
  MapQuestFlag:pTMapQuestInfo;
  nFlagValue:Integer;
  bo1D:Boolean;
begin
  Result:=nil;
  for I := 0 to m_QuestList.Count - 1 do begin
    MapQuestFlag:=m_QuestList.Items[i];
    nFlagValue:=TBaseObject(BaseObject).GetQuestFalgStatus(MapQuestFlag.nFlag);

    if nFlagValue = MapQuestFlag.nValue then begin
      if (boFlag = MapQuestFlag.boGrouped) or (not boFlag) then begin
        bo1D:=False;
        if (MapQuestFlag.sMonName <> '') and (MapQuestFlag.sItemName <> '') then begin
          if (MapQuestFlag.sMonName = sCharName) and (MapQuestFlag.sItemName = sItem) then
            bo1D:=True;
        end;
        if (MapQuestFlag.sMonName <> '') and (MapQuestFlag.sItemName = '') then begin
          if (MapQuestFlag.sMonName = sCharName) and (sItem = '') then
            bo1D:=True;
        end;
        if (MapQuestFlag.sMonName = '') and (MapQuestFlag.sItemName <> '') then begin
          if (MapQuestFlag.sItemName = sItem) then
            bo1D:=True;
        end;
        if bo1D then begin
          Result:=MapQuestFlag.NPC;
          break;
        end;
      end;
    end;
  end;
end;

function TEnvirnoment.GetItemEx(nX, nY: Integer;
  var nCount: Integer): Pointer; //004B5C10
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=nil;
  nCount:=0;
  BoCanGetItem:=False;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 0) then begin
    BoCanGetItem:=True;
    if MapCellInfo.ObjList <> nil then begin
      for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
        OSObject:=MapCellInfo.ObjList.Items[i];
        if OSObject.btType = OS_ITEMOBJECT then begin
          Result:=Pointer(OSObject.CellObj);
          Inc(nCount);
        end;
        if OSObject.btType = OS_GATEOBJECT then begin
          BoCanGetItem:=False;
        end;
        if OSObject.btType = OS_MOVINGOBJECT then begin
          BaseObject:=TBaseObject(OSObject.CellObj);
          if not BaseObject.m_boDeath and
            not (BaseObject.m_btRaceServer = RC_PET) and
            not BaseObject.m_boPenetrateMode then
            BoCanGetItem:=False;
        end;
      end;
    end;
  end;

end;

function TEnvirnoment.GetDoor(nX, nY: Integer): pTDoorInfo; //004B6ACC
var
  I: Integer;
  Door:pTDoorInfo;
begin
  Result:=nil;
  for I := 0 to m_DoorList.Count - 1 do begin
    Door:=m_DoorList.Items[i];
    if (Door.nX = nX) and (Door.nY =nY) then begin
      Result:=Door;
      exit;
    end;
  end;
end;

function TEnvirnoment.IsValidObject(nX, nY, nRage: Integer; BaseObject: TObject): Boolean; //004B5A3C
var
  nXX,nYY,I:Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
begin
  Result:=False;
  for nXX:= nX - nRage to nX + nRage do begin
    for nYY:= nY - nRage to nY + nRage do begin
      if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
        for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
          OSObject:=MapCellInfo.ObjList.Items[i];
          if OSObject.CellObj = BaseObject then begin
            Result:=True;
            exit;
          end;
        end;
      end;
    end;
  end;
end;

function TEnvirnoment.GetRangeBaseObject(nX, nY, nRage: Integer; boFlag: Boolean;
  BaseObjectList: TList): Integer; //004B59C0
var
  nXX,nYY:Integer;
begin
  for nXX:= nX - nRage to nX + nRage do begin
    for nYY:= nY - nRage to nY + nRage do begin
      GetBaseObjects(nXX,nYY,boFlag,BaseObjectList);
    end;
  end;
  Result:=BaseObjectList.Count;
end;

function TEnvirnoment.GetBaseObjects(nX, nY: Integer; boFlag: Boolean;
  BaseObjectList: TList): Integer; //004B58F8
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
    for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_MOVINGOBJECT then begin
        BaseObject:=TBaseObject(OSObject.CellObj);
        if BaseObject <> nil then begin
          if not BaseObject.m_boGhost and BaseObject.HoldPlace and (BaseObject.m_btRaceServer <> RC_PET) then begin
            if not boFlag or not BaseObject.m_boDeath then
              BaseObjectList.Add(BaseObject);
          end;
        end;
      end;
    end;
  end;
  Result:=BaseObjectList.Count;
end;

function TEnvirnoment.GetEvent(nX,nY:Integer): TObject; //004B5D24
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
begin
  Result:=nil;
  BoCanGetItem:=False;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
    for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_EVENTOBJECT then begin
        Result:=OSObject.CellObj;
      end;
    end;
  end;
end;

procedure TEnvirnoment.SetMapXYFlag(nX, nY: Integer; boFlag: Boolean);//004B5E8C
var
  MapCellInfo:pTMapCellinfo;
begin
  if GetMapCellInfo(nX,nY,MapCellInfo) then begin
    if boFlag then MapCellInfo.chFlag:=0       //¿òÁ÷ÀÏ ¼ö ÀÖ°Ô
    else MapCellInfo.chFlag:=2;      //¸ø ¿òÁ÷ÀÌ°Ô
  end;
end;

function TEnvirnoment.CanFly(nsX, nsY, ndX, ndY: integer): Boolean; //004B600C
var
  r28,r30:Real;
  n14,n18,n1C:Integer;
begin
  Result:=True;
  r28:=(ndX - nsX) / 10{1.0e1};
  r30:=(ndY - nsY) / 10{1.0e1};
  n14:=0;
  while (True) do begin
    n18:=ROUND(nsX + r28);
    n1C:=ROUND(nsY + r30);
    if not CanWalk(n18,n1C,True) then begin
      Result:=False;
      break;
    end;
    Inc(n14);
    if n14 >= 10 then break;      
  end;
end;



function TEnvirnoment.GetXYHuman(nMapX, nMapY: Integer): Boolean;
var
  I: Integer;
  MapCellInfo:pTMapCellinfo;
  OSObject:pTOSObject;
  BaseObject:TBaseObject;
begin
  Result:=False;
  if GetMapCellInfo(nMapX,nMapY,MapCellInfo) and (MapCellInfo.ObjList <> nil) then begin
    for I := 0 to MapCellInfo.ObjList.Count - 1 do begin
      OSObject:=MapCellInfo.ObjList.Items[i];
      if OSObject.btType = OS_MOVINGOBJECT then begin
        BaseObject:=TBaseObject(OSObject.CellObj);
        if BaseObject.m_btRaceServer = RC_PLAYOBJECT then begin
          Result:=True;
          break;
        end;          
      end;
    end;
  end;
end;

function TEnvirnoment.IsValidCell(nX, nY: Integer): Boolean;//0x004B5FC8
var
  MapCellInfo:pTMapCellinfo;
begin
  Result:=True;
  if GetMapCellInfo(nX,nY,MapCellInfo) and (MapCellInfo.chFlag = 2) then
    Result:=False;
end;

function TEnvirnoment.GetEnvirInfo: String;
var
  sMsg:string;
begin
  sMsg:='Map:%s(%s) DAY:%s DARK:%s SAFE:%s FIGHT:%s FIGHT3:%s QUIZ:%s NORECONNECT:%s(%s) MUSIC:%s(%d) EXPRATE:%s(%f) PKWINLEVEL:%s(%d) PKLOSTLEVEL:%s(%d) PKWINEXP:%s(%d) PKLOSTEXP:%s(%d) DECHP:%s(%d/%d) INCHP:%s(%d/%d)';
  sMsg:=sMsg +' DECGAMEGOLD:%s(%d/%d) INCGAMEGOLD:%s(%d/%d) INCGAMEPOINT:%s(%d/%d) RUNHUMAN:%s RUNMON:%s NEEDHOLE:%s NORECALL:%s NOGUILDRECALL:%s NODEARRECALL:%s NOMASTERRECALL:%s NODRUG:%s MINE:%s WHITEMINE:%s EVENTMINE:%s GREENMINE:%s';
  sMsg:=sMsg +' NODROPITEM:%s NOTHROWITEM:%s NOPOSITIONMOVE:%s NOHORSE:%s NOCHAT:%s';
  Result:=format(sMsg,[sMapName,
                       sMapDesc,
                       BoolToStr(Flag.boDayLight),
                       BoolToStr(Flag.boDarkness),
                       BoolToStr(Flag.boSAFE),
                       BoolToStr(Flag.boFightZone),
                       BoolToStr(Flag.boFight3Zone),
                       BoolToStr(Flag.boQUIZ),
                       BoolToStr(Flag.boNORECONNECT),Flag.sNoReconnectMap,
                       BoolToStr(Flag.boMUSIC),Flag.nMUSICID,
                       BoolToStr(Flag.boEXPRATE),Flag.nEXPRATE / 100,
                       BoolToStr(Flag.boPKWINLEVEL),Flag.nPKWINLEVEL,
                       BoolToStr(Flag.boPKLOSTLEVEL),Flag.nPKLOSTLEVEL,
                       BoolToStr(Flag.boPKWINEXP),Flag.nPKWINEXP,
                       BoolToStr(Flag.boPKLOSTEXP),Flag.nPKLOSTEXP,
                       BoolToStr(Flag.boDECHP),Flag.nDECHPTIME,Flag.nDECHPPOINT,
                       BoolToStr(Flag.boINCHP),Flag.nINCHPTIME,Flag.nINCHPPOINT,
                       BoolToStr(Flag.boDECGAMEGOLD),Flag.nDECGAMEGOLDTIME,Flag.nDECGAMEGOLD,
                       BoolToStr(Flag.boINCGAMEGOLD),Flag.nINCGAMEGOLDTIME,Flag.nINCGAMEGOLD,
                       BoolToStr(Flag.boINCGAMEPOINT),Flag.nINCGAMEPOINTTIME,Flag.nINCGAMEPOINT,
                       BoolToStr(Flag.boRUNHUMAN),
                       BoolToStr(Flag.boRUNMON),
                       BoolToStr(Flag.boNEEDHOLE),
                       BoolToStr(Flag.boNORECALL),
                       BoolToStr(Flag.boNOGUILDRECALL),
                       BoolToStr(Flag.boNODEARRECALL),

                       BoolToStr(Flag.boNODRUG),
                       BoolToStr(Flag.boMINE),
                       BoolToStr(Flag.boMINE2),
                       BoolToStr(Flag.boMINE3),
                       BoolToStr(Flag.boMINE4),   //¼®ÃÊ±¤»ê
                       BoolToStr(Flag.boNODROPITEM),
                       BoolToStr(Flag.boNOTHROWITEM),
                       BoolToStr(Flag.boNOPOSITIONMOVE),
                       BoolToStr(Flag.boNOHORSE),
                       BoolToStr(Flag.boNOCHAT),
                       BoolToStr(Flag.boFISHEVENT),     //³¬½Ã ÀÌº¥Æ®
                       BoolToStr(Flag.boNOTIGER),     //Å»°Í ºÒ°¡
                       BoolToStr(Flag.boNOPENETRATE), //¸ÁÀÚÀÇ¿Ê ºÒ°¡
                       BoolToStr(Flag.boNOREVIVAL),     //ºÎÈ° ºÒ°¡
                       BoolToStr(Flag.boNOHUMNOMON)
                       ]);
end;

function TEnvirnoment.AllowMagic(MagicName: string): Boolean; //»ç¿ë±ÝÁö2
var
  I: Integer;
  str :string;
begin
  Result := True;
  if (not m_boNOTALLOWMAGIC) or (m_UnAllowMagicList = nil) then Exit;
  m_UnAllowMagicList.Lock;
  try
    for I := 0 to m_UnAllowMagicList.Count - 1 do begin
      str := m_UnAllowMagicList.Strings[I];
      if CompareText(str, trim(MagicName)) = 0 then begin
        Result := False;
        break;
      end;
    end;
  finally
    m_UnAllowMagicList.UnLock;
  end;
end;

function TEnvirnoment.AllowStdItems(sItemName: string): Boolean; //»ç¿ë±ÝÁö1
var
  I: Integer;
  str :string;
begin
  Result := True;
  if (not m_boUnAllowStdItems) or (m_UnAllowStdItemsList = nil) then Exit;
  m_UnAllowStdItemsList.Lock;
  try
    for I := 0 to m_UnAllowStdItemsList.Count - 1 do begin
      str := m_UnAllowStdItemsList.Strings[I];
      if CompareText(str, sItemName) = 0 then begin
        Result := False;
        break;
      end;
    end;
  finally
    m_UnAllowStdItemsList.UnLock;
  end;
end;

function TEnvirnoment.AllowStdItems(nItemIdx: Integer): Boolean; //»ç¿ë±ÝÁö1
var
  I: Integer;
begin
  Result := True;
  if (not m_boUnAllowStdItems) or (m_UnAllowStdItemsList = nil) then Exit;
  m_UnAllowStdItemsList.Lock;
  try
    for I := 0 to m_UnAllowStdItemsList.Count - 1 do begin
      if Integer(m_UnAllowStdItemsList.Objects[I]) = nItemIdx then begin
        Result := False;
        break;
      end;
    end;
  finally
    m_UnAllowStdItemsList.UnLock;
  end;
end;


procedure TEnvirnoment.AddObjectCount(BaseObject:TObject);          //°ü¸®ÀÚ½Ã½ºÅÛ
var
  btRaceServer:Byte;
begin
  btRaceServer:=TBaseObject(BaseObject).m_btRaceServer;
  if btRaceServer = RC_PLAYOBJECT then begin
    Inc(m_nHumCount);
    Inc(g_MapManager.m_nHumCount);
  end else
  if btRaceServer = RC_HEROOBJECT then begin
    Inc(m_nHeroCount);
    Inc(g_MapManager.m_nHeroCount);
  end else
  if (btRaceServer in [RC_NPC, RC_PEACENPC]) then begin
    Inc(m_nNpcCount);
    Inc(g_MapManager.m_nNpcCount);
  end else begin
    Inc(m_nMonCount);
    Inc(g_MapManager.m_nMonCount);
  end;

end;

procedure TEnvirnoment.DelObjectCount(BaseObject:TObject);         //°ü¸®ÀÚ½Ã½ºÅÛ
var
  btRaceServer:Byte;
begin
  btRaceServer:=TBaseObject(BaseObject).m_btRaceServer;
  if btRaceServer = RC_PLAYOBJECT then begin
    Dec(m_nHumCount);
    Dec(g_MapManager.m_nHumCount);
  end else
  if btRaceServer = RC_HEROOBJECT then begin
    Dec(m_nHeroCount);
    Dec(g_MapManager.m_nHeroCount);
  end else
  if (btRaceServer in [RC_NPC, RC_PEACENPC]) then begin
    Dec(m_nNpcCount);
    Dec(g_MapManager.m_nNpcCount);
  end else begin
    Dec(m_nMonCount);
    Dec(g_MapManager.m_nMonCount);
  end;
end;


procedure TMapManager.Run;
begin

end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Envir.pas 594 2007-03-09 15:00:12Z damian $');
end.
