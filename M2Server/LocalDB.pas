unit LocalDB;
// If you get an error on the next line, you need to reextract SourceFiles.rar
{$I defines.inc}
interface

uses
  {svn, }nixtime, Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls, Forms, ActiveX, ExtCtrls,
  Dialogs, GuildTerritory, M2Share, ADODB, DB, HUtil32, Grobal2, SDK, ObjNpc, ItmUnit, DateUtils, EDcode,ObjBase, math,
  Guild;


type
  TDefineInfo = record
    sName:String;
    sText:String;
  end;
  pTDefineInfo = ^TDefineInfo;
  TQDDinfo = record
    n00     :Integer;
    s04     :String;
    sList   :TStringList;
  end;
  pTQDDinfo = ^TQDDinfo;
  TGoodFileHeader = record
    nItemCount    :Integer;
    Resv          :array[0..251] of Integer;
  end;
  TFrmDB = class
  private
    LastSQLTime: LongInt;
    procedure QMangeNPC;
    procedure QFunctionNPC;
    procedure RobotNPC();
    function LoadSetItems(): Integer;
    function LoadCompoundInfoList: Integer;        //¾ÆÀÌÅÛÇÕ¼º
    function GetSetItem(sItemName: string): TList;
    procedure DeCodeStringList(StringList:TStringList);
    procedure LoadListCall(sLoadName: string; var LoadList: TStringList);
    { Private declarations }
  public
    SQLTimer: TTimer;
    Query: TADOQuery;
    QueryCommand: TADOCommand;    
//    SQLDBM: TADOQuery;

    constructor Create();
    destructor Destroy; override;
    procedure InitDBM();
    procedure DoSQLTimer(Sender: TObject);
    procedure UseSQL();
    function GetBoolean(MyQuery: TADOQuery; Field: String): boolean;
    function LoadMonitems(MonName:String;var ItemList:TList):Integer;
    function LoadItemsDB():Integer;
    {$IFDEF UseTXT}
      function LoadMinMap():Integer;
      function LoadBigMap():Integer;
    {$ELSE}
      function LoadMapRoute():Integer;
    {$ENDIF}
    function LoadMapInfo():Integer;
    function LoadMonsterDB():Integer;
    function LoadMagicDB():Integer;
    function LoadMonGen():Integer;
    function LoadUnbindList():Integer;
    function LoadMapQuest():Integer;
    function LoadMissionData(): Integer;
    function LoadMapDesc(): Integer;
    function LoadDefiniensConst: Boolean;
    function LoadQuestDiary():Integer;
    function LoadAdminList():Boolean;
    function LoadColumnList():Boolean;    //È«º¸´Ü
    function LoadMerchant():Integer;
    function LoadGuardList():Integer;
    function LoadNpcs():Integer;
    //function LoadQuestList():Integer;        //Äù½ºÆ® Å×½ºÆ®

    function LoadDismantleList():Integer;     //ÀÏ¹ÝºÐÇØ
    function LoadWakeList():Integer;
    function LoadDisassembleList():Integer;   //°¢¼ººÐÇØ
    function LoadMakeItemList():Integer;   //Á¦Á¶½ºÃÄ
    function LoadChangeItemList():Integer;   //º¯È¯½ºÃÄ
    function LoadStartPoint():Integer;
    function LoadNpcScript(NPC:TNormNpc;sPatch,sScritpName:String):Integer;
    function LoadScriptFile(NPC:TNormNpc;sPatch,sScritpName:String;boFlag, boQuest:Boolean):Integer;
    function LoadGoodRecord(NPC:TMerchant;sFile:String):Integer;
    function LoadGoodPriceRecord(NPC:TMerchant;sFile:String):Integer;

    function SaveGoodRecord(NPC:TMerchant;sFile:String):Integer;
    function SaveGoodPriceRecord(NPC:TMerchant;sFile:String):Integer;

    function  LoadUpgradeWeaponRecord(sNPCName:String;DataList:TList):Integer;
    function  SaveUpgradeWeaponRecord(sNPCName:String;DataList:TList):Integer;
    procedure ReLoadMerchants();
    procedure ReLoadNpc();

    function RentalItem(Useritem: pTUserItem; RentalName , Name : string; Day:integer): boolean;    //´ë¿©DB
    procedure GetRentalItems(PlayObject: TPlayObject);    //´ë¿©DB
    procedure GetOwnerItems(PlayObject: TPlayObject);    //´ë¿©DB
    procedure RRentalItem(PlayObject: TPlayObject; RentalID: Integer);        //´ë¿©DB
    procedure EndOfRental(PlayObject: TPlayObject; RentalID: Integer);        //´ë¿©DB
    function LoadRentalidx(Name:String): Integer;   //´ë¿©DB
    function LoadOwneridx(Name:String): Integer;   //´ë¿©DB

    function AddAucItem(Useritem: pTUserItem; Cost: String; Name, UserID: string): boolean;    //°æ¸Å
    procedure OfAucEnd( Solder: String; MakeIndex: Integer);                  //°æ¸Å
    procedure OfAucCost(PlayObject: TPlayObject; MakeIndex: Integer; Cost: string);      //°æ¸Å

    function ConsignItem(Useritem: pTUserItem; Cost: String; Name, UserID: string): boolean;    //À§Å¹
    procedure GetAuctionItems(sData: String; PlayObject: TPlayObject);   //À§Å¹
    procedure BuyAuctionItem(PlayObject: TPlayObject; AuctionID: Integer);       //À§Å¹
    procedure EndOfAuction(PlayObject: TPlayObject; AuctionID: Integer);         //À§Å¹

    function ComStorageItem(Useritem: pTUserItem; UserID: string): boolean;    //°ø¿ëÃ¢°í
    procedure GetComStorageItems(PlayObject: TPlayObject);   //°ø¿ëÃ¢°í
    procedure EndOfComStorage(PlayObject: TPlayObject; StorageID: Integer);      //°ø¿ëÃ¢°í
    function  LoadComStorageidx(Name:String): Integer;  //°ø¿ëÃ¢°í

    function PetInfoSaveDB(UserID, Name, PetMobName, PetName : string; Number, Day, DayUse, SatietyLimit, EatRage:integer; sStr : string): boolean;    //¿µ¹°DB ÀúÀå
    procedure GetPetInfo(PlayObject: TPlayObject);   //¿µ¹°DB ºÒ·¯¿À±â
    procedure DeletePet(PlayObject: TPlayObject; PetID: Integer);        //¿µ¹°DB ³õ¾ÆÁÖ±â
    procedure ChangPetName(PlayObject: TPlayObject; PetID: Integer; ChangName:String);        //¿µ¹°DB ÀÌ¸§¹Ù²Ù±â

    function LoadPetidx(Name:String): Integer;  //¿µ¹°DB °¹¼ö
    function LoadPetNumberidx(Name:String;PetNumber:integer): Integer;  //¿µ¹°DB ³Ñ¹ö


    function GuildStorageItem(Useritem: pTUserItem; GuildName: string): boolean;    //¹®ÆÄÃ¢°í
    procedure GetGuildStorageItems(PlayObject: TPlayObject);   //¹®ÆÄÃ¢°í
    procedure EndOfGuildStorage(PlayObject: TPlayObject; StorageID: Integer);    //¹®ÆÄÃ¢°í
    function  LoadGuildStorageidx(Name:String): Integer;   //¹®ÆÄÃ¢°í

    function  LoadRejectList(Name:String): TList;   //°ÅºÎÀÚ ¸®½ºÆ®
    procedure GetDiceGameItems(PlayObject:TPlayObject);  //Ç÷·æ»óÀÚ
    procedure ClientDiceItem(PlayObject: TPlayObject; ID:integer; ItemName:String);     //È¯»óÁ¡ ¼±¹°
    //È¯»óÁ¡
    procedure GetShopItems(PlayObject:TPlayObject; sData:string);   //È¯»óÁ¡
    function savelipiitemn(mename: String; ItemName: String; ToName: string; Amoin,idx:Integer): boolean;     //È¯»óÁ¡
    function SaveMyShopCart(mename: String; ItemName: String; amoin:string): boolean;   //È¯»óÁ¡ °ü½É
    procedure GiftsAuction(PlayObject: TPlayObject; AuctionID: Integer);     //È¯»óÁ¡ ¼±¹°
    function LoadGiftsidx(Name:String): Integer;   //È¯»óÁ¡ ¼±¹° °¹¼ö
    procedure DellMyShopCart(mename: String);          //È¯»óÁ¡ °ü½É
    procedure DellMyShopCartItem(AuctionID: Integer);   //È¯»óÁ¡ °ü½É
    function  LoadGiftsItemList(Name:String): TList;      //È¯»óÁ¡ ¼±¹°
    function  LoadShopcartItemList(Name:String): TList;   //È¯»óÁ¡ °ü½É
    function LoadShopItemList(): Integer;     //È¯»óÁ¡
    function LoadFishItemList(): Integer;     //³¬½Ã
    function LoadFishEventItemList(): Integer;     //³¬½Ã ÀÌº¥Æ®

    function  SaveAdminList():Boolean;
    function  SaveColumnList():Boolean; //È«º¸´Ü
    procedure LoadGT(Number,ListNumber:Integer);
    procedure LoadGTDecorations(GT:TTerritory);
    procedure SaveGT(GT:TTerritory);
    procedure SetupGT(GT:TTerritory);
    procedure SaveDeco(looks,GTNumber:Byte;x,y:integer;mapname:String; starttime:dword);
    procedure DeleteDeco(GTNumber:Byte; x,y: integer; mapname:String);
    function  LoadDecorationList():Integer;
    function  LoadAucNotSold: Integer;   //°æ¸ÅÁßÀÎ °¹¼ö
    function  LoadConsignidx(Name:String): Integer;   //À§Å¹
    function  LoadBBSMsgList(GuildName:String;PageCount:integer):TList;  //Àå¿ø°Ô½ÃÆÇ
    function  LoadBBSMsg(Index:integer):pTBBSMSGL;          //Àå¿ø°Ô½ÃÆÇ
    procedure SaveBBSMsg(BBSMSGL:pTBBSMSGL;GuildName:String);    //Àå¿ø°Ô½ÃÆÇ
    procedure DeleteBBSMsg(index:integer);                 //Àå¿ø°Ô½ÃÆÇ

    function LoadMapEvent(): Integer;

  end;
  
var
  FrmDB: TFrmDB;
  nDeCryptString:Integer= -1;
implementation

uses
  Envir, svMain, ObjGuard, MD5Unit;


function TFrmDB.LoadFishItemList(): Integer;   //³¬½Ã
var
  i: Integer;
  LoadList:TStringList;
  sFileName: string;
  str:string;
  FishItem:PTfishing;
  fname,ideswa:string;
begin
 Result:= 0;
 sFileName := g_Config.sEnvirDir + 'FishItemList.txt';
  if not FileExists(sFileName) then
  begin
    LoadList:=Classes.TStringList.Create();
    LoadList.Add(';ÎïÆ·Ãû³Æ »úÂÊ%');
    LoadList.SaveToFile(sFileName);
    LoadList.Free;
    exit;
  end;
  if FileExists(sFileName) then begin
      for I := 0 to g_FishItmeList.Count - 1 do begin
        DisPose(PTfishing(g_FishItmeList.Items[I]));
       end;
       g_FishItmeList.Clear;
    try
      LoadList := TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        str := Trim(LoadList.Strings[I]);
        if (str <> '') and (str[1] <> ';') then begin
          str := GetValidStr3(str, fname, [' ', #9]);
          str := GetValidStr3(str, ideswa, [' ', #9]);
          if (fname <> '') and (ideswa <> '') then begin
            New(FishItem);
            FishItem.FishName := fname;
            FishItem.Probability := Str_ToInt(ideswa, 0);
            g_FishItmeList.Add(FishItem);
            inc(Result);
          end;
        end;
      end;
      LoadList.Free;
    finally
    end;
  end;
end;

function TFrmDB.LoadFishEventItemList(): Integer;   //³¬½Ã ÀÌº¥Æ®
var
  i: Integer;
  LoadList:TStringList;
  sFileName: string;
  str:string;
  FishItem:PTfishing;
  fname,ideswa:string;
begin
 Result:= 0;
 sFileName := g_Config.sEnvirDir + 'FishEventItemList.txt';
  if not FileExists(sFileName) then
  begin
    LoadList:=Classes.TStringList.Create();
    LoadList.Add(';ÎïÆ·Ãû³Æ »úÂÊ%');
    LoadList.SaveToFile(sFileName);
    LoadList.Free;
    exit;
  end;
  if FileExists(sFileName) then begin
      for I := 0 to g_FishEventItmeList.Count - 1 do begin
        DisPose(PTfishing(g_FishEventItmeList.Items[I]));
       end;
       g_FishEventItmeList.Clear;
    try
      LoadList := TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        str := Trim(LoadList.Strings[I]);
        if (str <> '') and (str[1] <> ';') then begin
          str := GetValidStr3(str, fname, [' ', #9]);
          str := GetValidStr3(str, ideswa, [' ', #9]);
          if (fname <> '') and (ideswa <> '') then begin
            New(FishItem);
            FishItem.FishName := fname;
            FishItem.Probability := Str_ToInt(ideswa, 0);
            g_FishEventItmeList.Add(FishItem);
            inc(Result);
          end;
        end;
      end;
      LoadList.Free;
    finally
    end;
  end;
end;



function TFrmDB.LoadShopItemList(): Integer;
var
  i: Integer;
  ShopItem: pTSeveShopItem;
  ShopCn:tItem;
  ClientItem:TClientItem;
resourcestring
  sSQLString = 'SELECT * FROM TBL_SHOPITEM';
begin
  Result := -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    try
      UseSQL();
      Query.SQL.Clear;
      Query.SQL.Add(sSQLString);
      try
        Query.Open;
      except
      end;
      g_ServerShopList.Lock;
      try
        g_ServerShopList.Clear;
        for i := 0 to Query.RecordCount - 1 do begin
          New(ShopItem);
          ShopItem.ShopItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
          ShopItem.ShopItemPrice := Query.FieldByName('FLD_PRICE').AsInteger;
          ShopItem.ShopItemjob := Query.FieldByName('FLD_JOB').AsInteger;
          ShopItem.shopItemnew := Query.FieldByName('FLD_MODE').AsInteger;
          ShopItem.shopItemmode := Query.FieldByName('FLD_CLASS').AsInteger;
          ShopItem.shopItemAmount := Query.FieldByName('FLD_AMOUNT').AsInteger;
          ShopItem.ShopSell := Query.FieldByName('FLD_SELL').AsBoolean;
          ShopCn := UserEngine.GetStdItem(ShopItem.ShopItemName);
          if (ShopCn <> nil) then begin
           ShopCn.GetStandardItem(ClientItem.S);
           ClientItem.Dura := ShopCn.DuraMax;
           ClientItem.DuraMax := ShopCn.DuraMax;
           if ShopCn.StdMode in [0,1,3,45,46] then begin      //¹°¾à
            if ShopCn.StdMode = 45 then
              ClientItem.Amount := _MIN(ShopItem.shopItemAmount,1000)
              else ClientItem.Amount := _MIN(ShopItem.shopItemAmount,400);
           end else begin
              ClientItem.Amount := 1;
           end;
           ShopItem.ShopItems := ClientItem;
           g_ServerShopList.Add(ShopItem);
          end;
          Query.Next;
        end;
      finally
        g_ServerShopList.UnLock;
      end;
    finally
      Query.Close;
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  Result := i;
end;


function TFrmDB.LoadDefiniensConst: Boolean;
var
  LoadList: TStringList;
  sFileName, sName, sValue: string;
  i: Integer;
  PStr: PString;
begin
  Result := True;
  sFileName := g_Config.sEnvirDir + 'DefiniensConst.txt';
  for I := 0 to UserEngine.m_DefiniensConst.Count - 1 do begin
    Dispose(PString(UserEngine.m_DefiniensConst.Objects[I]));
  end;
  UserEngine.m_DefiniensConst.Clear;
  if MyFileExists(sFileName) then begin
    LoadList := TMsgStringList.Create;
    LoadList.LoadFromFile(sFileName);
    LoadListCall(ExtractFileName(sFileName), LoadList);
    for i := 0 to LoadList.Count - 1 do begin
      sValue := Trim(LoadList[i]);
      if (sValue <> '') and (sValue[1] <> ';') then begin
        sValue := Trim(GetValidStr3(sValue, sName, ['=', ' ', #9]));
        if (sValue <> '') and (sName <> '') then begin
          if UserEngine.m_DefiniensConst.IndexOf(sName) = -1 then begin
            New(PStr);
            PStr^ := sValue;
            UserEngine.m_DefiniensConst.AddObject(sName, TObject(PStr));
          end
          else begin
            MainOutMessage('NPC³£Á¿ÉèÖÃ´íÎó ÖØ¸´[' + sName + ']...');
          end;
        end;
      end;
    end;
    LoadList.Free;
  end;
end;

function TFrmDB.LoadAdminList():Boolean;
var
  sFileName :String;
  sLineText :String;
  sIPaddr   :String;
  sCharName :String;
  sData     :String;
  LoadList  :TStringList;
  AdminInfo :pTAdminInfo;
  I         :Integer;
  nLv       :Integer;
begin
  Result:=False;;
  sFileName:=g_Config.sEnvirDir + 'AdminList.txt';
  if not FileExists(sFileName) then exit;
    UserEngine.m_AdminList.Lock;
    try
      UserEngine.m_AdminList.Clear;
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for I:=0 to LoadList.Count -1 do begin
        sLineText:=LoadList.Strings[i];
        nLv:=-1;
        if (sLineText <> '') and (sLineText[1] <> ';') then begin
          if sLineText[1] = '*' then nLv:=10
          else if sLineText[1] = '1' then nLv:=9
          else if sLineText[1] = '2' then nLv:=8
          else if sLineText[1] = '3' then nLv:=7
          else if sLineText[1] = '4' then nLv:=6
          else if sLineText[1] = '5' then nLv:=5
          else if sLineText[1] = '6' then nLv:=4
          else if sLineText[1] = '7' then nLv:=3
          else if sLineText[1] = '8' then nLv:=2
          else if sLineText[1] = '9' then nLv:=1;
          if nLv > 0 then begin
            sLineText:=GetValidStrCap(sLineText, sData, ['/','\',' ', #9]);
            sLineText:=GetValidStrCap(sLineText, sCharName, ['/','\',' ', #9]);
            sLineText:=GetValidStrCap(sLineText, sIPaddr, ['/','\',' ', #9]);

            New(AdminInfo);
            AdminInfo.nLv      := nLv;
            AdminInfo.sChrName := sCharName;
            AdminInfo.sIPaddr  := sIPaddr;
            UserEngine.m_AdminList.Add(AdminInfo);
          end;
        end;
      end;
      LoadList.Free;
    finally
      UserEngine.m_AdminList.UnLock;
    end;
    Result:=True;
end;

function TFrmDB.SaveAdminList():Boolean;
var
  I           :Integer;
  sFileName   :String;
  SaveList    :TStringList;
  sPerMission :String;
  nPerMission :Integer;
  AdminInfo   :pTAdminInfo;
begin
  sFileName := g_Config.sEnvirDir + 'AdminList.txt';
  SaveList  := TStringList.Create;
  UserEngine.m_AdminList.Lock;
  try
    for I := 0 to UserEngine.m_AdminList.Count - 1 do begin
      AdminInfo:=pTAdminInfo(UserEngine.m_AdminList.Items[I]);
      nPerMission:=AdminInfo.nLv;
      if nPerMission = 10 then sPerMission:='*';
      if nPerMission = 9 then sPerMission:='1';
      if nPerMission = 8 then sPerMission:='2';
      if nPerMission = 7 then sPerMission:='3';
      if nPerMission = 6 then sPerMission:='4';
      if nPerMission = 5 then sPerMission:='5';
      if nPerMission = 4 then sPerMission:='6';
      if nPerMission = 3 then sPerMission:='7';
      if nPerMission = 2 then sPerMission:='8';
      if nPerMission = 1 then sPerMission:='9';

      SaveList.Add(sPerMission + #9 + AdminInfo.sChrName);

    end;
    SaveList.SaveToFile(sFileName);
  finally
    UserEngine.m_AdminList.UnLock;
  end;
  Result:=True;
end;


function TFrmDB.LoadColumnList():Boolean;     //È«º¸´Ü
var
  sFileName :String;
  sLineText :String;
  sIPaddr   :String;
  sCharName :String;
  sData     :String;
  LoadList  :TStringList;
  ColumnInfo:pTColumnInfo;
  I         :Integer;
  nLv       :Integer;
begin
    Result:=False;;
    sFileName:=g_Config.sEnvirDir + 'ColumnList.txt';
  if not FileExists(sFileName) then exit;
    UserEngine.m_ColumnList.Lock;
    try
      UserEngine.m_ColumnList.Clear;
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for I:=0 to LoadList.Count -1 do begin
        sLineText:=LoadList.Strings[i];
        nLv:=-1;
        if (sLineText <> '') and (sLineText[1] <> ';') then begin
          if sLineText[1] = '1' then nLv:=1
          else if sLineText[1] = '2' then nLv:=2
          else if sLineText[1] = '3' then nLv:=3
          else if sLineText[1] = '4' then nLv:=4
          else if sLineText[1] = '5' then nLv:=5
          else if sLineText[1] = '6' then nLv:=6;
          if nLv > 0 then begin
            sLineText:=GetValidStrCap(sLineText, sData, ['/','\',' ', #9]);
            sLineText:=GetValidStrCap(sLineText, sCharName, ['/','\',' ', #9]);
            sLineText:=GetValidStrCap(sLineText, sIPaddr, ['/','\',' ', #9]);

            New(ColumnInfo);
            ColumnInfo.nLv      := nLv;
            ColumnInfo.sChrName := sCharName;
            ColumnInfo.sIPaddr  := sIPaddr;
            UserEngine.m_ColumnList.Add(ColumnInfo);
          end;
        end;
      end;
      LoadList.Free;
    finally
      UserEngine.m_ColumnList.UnLock;
    end;
    Result:=True;
end;

function TFrmDB.SaveColumnList():Boolean;    //È«º¸´Ü
var
  I           :Integer;
  sFileName   :String;
  SaveList    :TStringList;
  sColumn     :String;
  nColumn     :Integer;
  ColumnInfo  :pTColumnInfo;
begin
  sFileName := g_Config.sEnvirDir + 'ColumnList.txt';
  SaveList  := TStringList.Create;
  UserEngine.m_ColumnList.Lock;
  try
    for I := 0 to UserEngine.m_ColumnList.Count - 1 do begin
      ColumnInfo:=pTColumnInfo(UserEngine.m_ColumnList.Items[I]);
      nColumn:=ColumnInfo.nLv;
      if nColumn = 1 then sColumn:='1';
      if nColumn = 2 then sColumn:='2';
      if nColumn = 3 then sColumn:='3';
      if nColumn = 4 then sColumn:='4';
      if nColumn = 5 then sColumn:='5';
      if nColumn = 6 then sColumn:='6';
      SaveList.Add(sColumn + #9 + ColumnInfo.sChrName);
    end;
    SaveList.SaveToFile(sFileName);
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
  Result:=True;
end;


function TFrmDB.LoadGuardList(): Integer;
var
  sFileName, s14, s1C, s20, s24, s2C, sX, sY: string;
  tGuardList: TStringList;
  i: Integer;
  tGuard: TBaseObject;
  PointList: TStringList;
  nCount, k: Integer;
begin
  Result := -1;
  sFileName:=g_Config.sEnvirDir + 'GuardList.txt';
  if FileExists(sFileName) then begin
    tGuardList := TStringList.Create;
    PointList := TStringList.Create;
    tGuardList.LoadFromFile(sFileName);
    for i := 0 to tGuardList.Count - 1 do begin
      s14 := tGuardList.Strings[i];
      if (s14 <> '') and (s14[1] <> ';') then begin
        s14 := GetValidStrCap(s14, s1C, [' ', #9]);
        if (s1C <> '') and (s1C[1] = '"') then
          ArrestStringEx(s1C, '"', '"', s1C);
        s14 := GetValidStr3(s14, s20, [' ', #9]);
        s14 := GetValidStr3(s14, s24, [' ', #9]);
        if (s24 <> '') and (s24[1] = '[') and (s1C <> '') and (s20 <> '') then begin
          ArrestStringEx(s24, '[', ']', s24);
          PointList.Clear;
          nCount := ExtractStrings(['|'], [], PChar(s24), PointList);
          if nCount > 0 then begin
            sY := GetValidStr3(PointList[0], sX, [' ', ',', #9]);
            s14 := GetValidStr3(s14, s2C, [' ', #9, ':']);
            tGuard := UserEngine.RegenMonsterByName(s20, StrToIntDef(sX, 0), StrToIntDef(sY, 0), s1C);
            if tGuard <> nil then begin
              tGuard.m_btDirection := StrToIntDef(s2C, 0);
              if (nCount > 1) and (tGuard is TMoveSuperGuard) then begin
                with tGuard as TMoveSuperGuard do begin
                  SetLength(MovePoint, nCount);
                  MovePoint[0].X := StrToIntDef(sX, 0);
                  MovePoint[0].Y := StrToIntDef(sY, 0);
                  for k := 1 to nCount - 1 do begin
                    sY := GetValidStr3(PointList[k], sX, [' ', ',', #9]);
                    MovePoint[k].X := StrToIntDef(sX, 0);
                    MovePoint[k].Y := StrToIntDef(sY, 0);
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
    tGuardList.Free;
    PointList.Free;
    Result := 1;
  end;
end;

//00488A68
//function TFrmDB.LoadGuardList(): Integer;
//{$IFDEF UseTXT}
{var
  sFileName,s14,s1C,s20,s24,s28,s2C:String;
  tGuardList:TStringList;
  i:Integer;
  tGuard   :TBaseObject;
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    Result:= -1;
    sFileName:=g_Config.sEnvirDir + '°æºñº´¼³Á¤.txt';
    if FileExists(sFileName) then begin
      tGuardList:=TStringList.Create;
      tGuardList.LoadFromFile(sFileName);
      for i:=0 to tGuardList.Count -1 do begin
        s14:=tGuardList.Strings[i];
        if (s14 <> '') and (s14[1] <> ';') then begin
          s14:=GetValidStrCap(s14, s1C, [' ']);
          if (s1C <> '') and (s1C[1] = '"') then
            ArrestStringEx(s1C,'"','"',s1C);
          s14:=GetValidStr3(s14, s20, [' ']);
          s14:=GetValidStr3(s14, s24, [' ',',']);
          s14:=GetValidStr3(s14, s28, [' ',',',':']);
          s14:=GetValidStr3(s14, s2C, [' ',':']);
          if (s1C <> '') and (s20 <> '') and (s2C <> '') then begin
            tGuard:=UserEngine.RegenMonsterByName(s20,Str_ToInt(s24,0),Str_ToInt(s28,0),s1C);
              //sMapName,nX,nY,sName
            if tGuard <> nil then tGuard.m_btDirection:=Str_ToInt(s2C,0);
          end;
        end;
      end;
      tGuardList.Free;
      Result:=1;
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;   }
//{$ELSE}
{var
  i,nX,nY,nDir:Integer;
  sGuardName,sMap:String;
  tGuard:TBaseObject;
ResourceString
  sSQLString = 'SELECT * FROM TBL_GUARD';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    Result := -1;
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      sGuardName        := Query.FieldByName('FLD_GUARDNAME').AsString;
      sMap              := Query.FieldByName('FLD_MAPNAME').AsString;
      nX                := Query.FieldByName('FLD_X').AsInteger;
      nY                := Query.FieldByName('FLD_Y').AsInteger;
      nDir              := Query.FieldByName('FLD_DIRECTION').AsInteger;

      if (sGuardName <> '') and (sMap <> '') then begin
        tGuard:=UserEngine.RegenMonsterByName(sMap,nX,nY,sGuardName);
        //sMapName,nX,nY,sName
        if tGuard <> nil then tGuard.m_btDirection:=nDir;
      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;  }
//{$ENDIF}
//end;

//004855E0
function TFrmDB.LoadItemsDB: Integer;
var
  i,Idx:Integer;
  Item:TItem;
ResourceString
  sSQLString = 'SELECT * FROM TBL_STDITEMS ORDER BY FLD_ID';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    for I := 0 to UserEngine.StdItemList.Count - 1 do begin
      if TItem(UserEngine.StdItemList.Items[i]).SetItemList <> nil then
        TItem(UserEngine.StdItemList.Items[i]).SetItemList.Free;
    end;
    for I := 0 to UserEngine.StdItemList.Count - 1 do begin
      TItem(UserEngine.StdItemList.Items[I]).Free;

    end;
    UserEngine.StdItemList.Clear;
    Result := -1;
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    if Query.RecordCount = 0 then Result := -3;
    for i:=0 to Query.RecordCount -1 do begin
      Item := TItem.Create;
      Idx            := Query.FieldByName('FLD_ID').AsInteger;
      Item.Name      := Query.FieldByName('FLD_NAME').AsString;
      Item.StdMode   := Query.FieldByName('FLD_STDMode').AsInteger;
      Item.Grade     := Query.FieldByName('FLD_GRADE').AsInteger;
      Item.Shape     := Query.FieldByName('FLD_SHAPE').AsInteger;
      Item.Weight    := Query.FieldByName('FLD_WEIGHT').AsInteger;
      Item.AniCount  := Query.FieldByName('FLD_ANICOUNT').AsInteger;
      Item.Source    := Query.FieldByName('FLD_SOURCE').AsInteger;
      Item.Reserved  := Query.FieldByName('FLD_RESERVED').AsInteger;
      Item.Looks     := Query.FieldByName('FLD_IMGINDEX').AsInteger;
      Item.DuraMax   := Word(Query.FieldByName('FLD_DURAMAX').AsInteger);
      Item.AC        := ROUND(Query.FieldByName('FLD_AC').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.AC2       := ROUND(Query.FieldByName('FLD_ACMAX').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.MAC       := ROUND(Query.FieldByName('FLD_MAC').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.MAC2      := ROUND(Query.FieldByName('FLD_MACMAX').AsInteger * (g_Config.nItemsACPowerRate / 10));
      Item.DC        := ROUND(Query.FieldByName('FLD_DC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.DC2       := ROUND(Query.FieldByName('FLD_DCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.MC        := ROUND(Query.FieldByName('FLD_MC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.MC2       := ROUND(Query.FieldByName('FLD_MCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.SC        := ROUND(Query.FieldByName('FLD_SC').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.SC2       := ROUND(Query.FieldByName('FLD_SCMAX').AsInteger * (g_Config.nItemsPowerRate / 10));
      Item.Need      := Query.FieldByName('FLD_NEED').AsInteger;
      Item.NeedLevel := Query.FieldByName('FLD_NEEDLEVEL').AsInteger;
      Item.NeedOption := Query.FieldByName('FLD_NEEDOPTION').AsInteger;
      Item.Price     := Query.FieldByName('FLD_PRICE').AsInteger;
      Item.Light     := Query.FieldByName('FLD_LIGHT').AsInteger;
      Item.Tox       := Query.FieldByName('FLD_TOX').AsInteger;
      Item.ToxAvoid  := Query.FieldByName('FLD_TOXAVOID').AsInteger;
      Item.SlowDown  := Query.FieldByName('FLD_SLOWDOWN').AsInteger;
      Item.MagAvoid  := Query.FieldByName('FLD_MGAVOID').AsInteger;
      Item.HpAdd     := Query.FieldByName('FLD_HPADD').AsInteger;
      Item.MpAdd     := Query.FieldByName('FLD_MPADD').AsInteger;
      Item.RecHp     := Query.FieldByName('FLD_RECHP').AsInteger;
      Item.RecMp     := Query.FieldByName('FLD_RECMP').AsInteger;
      Item.AtkSpd    := Query.FieldByName('FLD_AtkSpd').AsInteger; //Áßµ¶ ÆÇÁ¤
      Item.Agility   := Query.FieldByName('FLD_Agility').AsInteger;  //Áßµ¶ ÆÇÁ¤
      Item.Accurate  := Query.FieldByName('FLD_Accurate').AsInteger;   //Áßµ¶ ÆÇÁ¤
      Item.WearWeight := Query.FieldByName('FLD_WearWeight').AsInteger; //Âø¿ë ¹«°Ô
      Item.HumUp      := Query.FieldByName('FLD_HumUp').AsInteger;     //µî¼±ÆÇ´Ü
      Item.CheckNoAss   := Query.FieldByName('FLD_CheckNoAss').AsBoolean;     //ÀÚ°´ ¿Ê Âø¿ë
      Item.CheckAss   := Query.FieldByName('FLD_CheckAss').AsBoolean;     //ÀÚ°´ ¿Ê Âø¿ë
      Item.CheckBonze   := Query.FieldByName('FLD_CHECKBONZE').AsBoolean;
      Item.HumRun     := Query.FieldByName('FLD_HumRun').AsBoolean;     //ÁúÁÖ±â´É
      Item.DDay       := Query.FieldByName('FLD_DDay').AsInteger;     //¹ÝÂ¦
      Item.MaxAmount  := Query.FieldByName('FLD_MaxAmount').AsInteger;     //¹°¾à °¹¼ö
      Item.ItemGlow     := Query.FieldByName('FLD_ItemGlow').AsInteger;

      Item.Unique    := Query.FieldByName('FLD_UNIQUEITEM').AsBoolean;                 //°­È­ ±ÝÁö
      Item.ChangeItem:= Query.FieldByName('FLD_CHANGEITEM').AsBoolean;                 //º¯È¯ °¡´É
      Item.DisassembleItem:= Query.FieldByName('FLD_DISASSEMBLE').AsBoolean;           //ºÐÇØ ±ÝÁö
      Item.NonStuff:= Query.FieldByName('FLD_NONSTUFF').AsBoolean;                     //Àç·á »ç¿ë ºÒ°¡
      Item.DropDell  := Query.FieldByName('FLD_DROPDELL').AsBoolean;                   //¾ÆÀÌÅÛ ¹ö¸² »èÁ¦
      Item.boCanTrade := Query.FieldByName('FLD_CanTrade').AsBoolean;                  //°Å·¡ ºÒ°¡
      Item.boCanDrop  := Query.FieldByName('FLD_CanDrop').AsBoolean;                   //¹ö¸² ºÒ°¡
      Item.boCanDeathDrop := Query.FieldByName('FLD_CanDeathDrop').AsBoolean;          //¶³±À ºÒ°¡
      Item.boCanRepair    := Query.FieldByName('FLD_CanRepair').AsBoolean;             //¼ö¸® ºÒ°¡
      Item.boCanSpecialRepair := Query.FieldByName('FLD_CanSpecialRepair').AsBoolean;  //¼ö¸®ºÒ°¡
      Item.boCanStore         := Query.FieldByName('FLD_CanStore').AsBoolean;          //¿©°ü ±ÝÁö
      Item.boCanSell          := Query.FieldByName('FLD_CanSell').AsBoolean;           //»óÁ¡ ÆÇ¸Å ±ÝÁö
      Item.boCanHeroBag     := Query.FieldByName('FLD_CanHeroBag').AsBoolean;          //¿µ¿õ °¡¹æ ÀÌµ¿±ÝÁö
      Item.boOnlyHero         := Query.FieldByName('FLD_ONLYHERO').AsBoolean;          //¿µ¿õ°¡¹æ¿¡¼­¸¸ »ç¿ë°¡´É
      Item.boCompound         := Query.FieldByName('FLD_COMPOUND').AsBoolean;          //¾ÆÀÌÅÛÇÕ¼º

      Item.WEffect           := Query.FieldByName('FLD_EFFECT').AsInteger;

      Item.NeedIdentify :=GetGameLogItemNameList(Item.Name);
      Item.SetItemList := nil;
      if Item.StdMode = 48 then  //»óÇö¾ÆÀÌÅÛ
        g_Config.sGTDeco:=Item.Name;//set the name of the gt decoration base item
      case Item.StdMode of
        5, 6, 7, 90, 99: Item.ItemType := ITEM_WEAPON;
        10,11,12: Item.ItemType := ITEM_ARMOR;
        19,20,21,22,23,24,26,62,63,64, 70,71,72,73,74,101,102: Item.ItemType := ITEM_ACCESSORY;
        15: Item.ItemType := ITEM_HELMET;
        else Item.ItemType := ITEM_ETC;
      end;
      if UserEngine.StdItemList.Count = Idx-1 then begin
        UserEngine.StdItemList.Add(Item);
        Result := 1;
      end else begin
        Memo.Lines.Add(format('´íÎó: ´íÎóË÷Òý(Idx:%d Name:%s)..',[Idx,Item.Name]));
        Result := -100;
        exit;
      end;
      Query.Next;
    end;
    g_boGameLogGold:=GetGameLogItemNameList(sSTRING_GOLDNAME) = 1;
    g_boGameLogHumanDie:=GetGameLogItemNameList(g_sHumanDieEvent) = 1;
    g_boGameLogGameGold:=GetGameLogItemNameList(g_Config.sGameGoldName) = 1;
    g_boGameLogGamePoint:=GetGameLogItemNameList(g_Config.sGamePointName) = 1;
  finally
    Query.Close;
  end;
  LoadSetItems();
  LoadCompoundInfoList();
  for i := 0 to UserEngine.StdItemList.Count - 1 do begin
    Item := TItem(UserEngine.StdItemList.Items[i]);
    Item.SetItemList := GetSetItem(FilterStdShowName(Item, Item.Name));
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadSetItems: Integer;
var
  sFileName, sStr, sItems, sValues, sValue, sIndex, sHint, sItem, sHideValue: string;
  LoadList: TStringList;
  i: Integer;
  SetItems: pTSetItems;
  StdItem: TItem;
  btWhere, nIndex: Integer;
  boItem, boValue: Boolean;
begin
  Result := 0;
  for I := 0 to g_SetItemsList.Count - 1 do begin
    Dispose(pTSetItems(g_SetItemsList[I]));
  end;
  g_SetItemsList.Clear;
  g_SetItemsArr := nil;
  sFileName := g_Config.sEnvirDir + 'SetItems.txt'; //'MiniMap.txt'
  if FileExists(sFileName) then begin
    LoadList := TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for i := 0 to LoadList.Count - 1 do begin
      sStr := LoadList[i];
      if (sStr <> '') and (sStr[1] <> ';') then begin
        sStr := GetValidStr3(sStr, sItems, [' ', #9]);
        sStr := GetValidStr3(sStr, sValues, [' ', #9]);
        sHideValue := GetValidStr3(sStr, sHint, [' ', #9]);
        if (sItems <> '') and (sValues <> '') then begin
          New(SetItems);
          FillChar(SetItems^, SizeOf(TSetItems), #0);
          ArrestStringEx(sHint, '"', '"', sHint);
          SetItems.sHint := sHint;
          boItem := False;
          boValue := False;
          while True do begin
            if sItems = '' then break;
            sItems := GetValidStr3(sItems, sItem, [',']);
            if sItem = '' then break;
            StdItem := UserEngine.GetStdItem(sItem);
            if (StdItem <> nil) and (StdItem.StdMode in [5,6,90,99,10,11,12,15,19,20,21,22,23,24,26,62,63,64]) then begin
              btWhere := GetTakeOnPosition(StdItem.StdMode);
              if btWhere in [Low(SetItems.Items)..High(SetItems.Items)] then begin
                if (btWhere = U_DRESS) and (StdItem.StdMode = 11) and (SetItems.Items[U_BUJUK] = '') then begin
                  SetItems.Items[U_BUJUK] := sItem;
                end else
                if (btWhere = U_RINGL) and ((SetItems.Items[U_RINGL] = '') or (SetItems.Items[U_RINGR] = '')) or
                    (btWhere = U_ARMRINGL) and ((SetItems.Items[U_ARMRINGL] = '') or (SetItems.Items[U_ARMRINGR] = '')) or
                    (SetItems.Items[btWhere] = '') then begin
                  boItem := True;
                  if (btWhere = U_RINGL) then
                    if (SetItems.Items[U_RINGL] = '') then SetItems.Items[U_RINGL] := sItem else SetItems.Items[U_RINGR] := sItem
                  else if (btWhere = U_ARMRINGL) then
                    if (SetItems.Items[U_ARMRINGL] = '') then SetItems.Items[U_ARMRINGL] := sItem else SetItems.Items[U_ARMRINGR] := sItem
                  else
                    SetItems.Items[btWhere] := sItem;
                end;
              end;
            end;
          end;
          while True do begin
            if sValues = '' then break;
            sValues := GetValidStr3(sValues, sValue, [',']);
            if sValue = '' then break;
            sValue := GetValidStr3(sValue, sIndex, ['.']);
            nIndex := StrToIntDef(sIndex, -1);
            if nIndex in [Low(SetItems.Value)..High(SetItems.Value)] then begin
              boValue := True;
              SetItems.Value[nIndex] := StrToIntDef(sValue, 0);
            end;
          end;
          SetItems.HideValue := StrToBoolDef(sHideValue, False);
          if (not boItem) or (not boValue) then Dispose(SetItems)
          else g_SetItemsList.Add(SetItems);
        end;
      end;
    end;
  end;
  if g_SetItemsList.Count > 0 then
    SetLength(g_SetItemsArr, g_SetItemsList.Count);

end;


function TFrmDB.LoadCompoundInfoList: Integer;           //¾ÆÀÌÅÛÇÕ¼º
var
  i, j, nLevel, nLowValue, nHighValue: Integer;
  LoadList: TStringList;
  sFileName, sText, sItemName, sLevel, sValue: string;
  pCompoundInfos: pTCompoundInfos;
begin
  Result := 0;
  for I := 0 to g_CompoundInfoList.Count - 1 do begin
    Dispose(pTCompoundInfos(g_CompoundInfoList.Objects[I]));
  end;
  g_CompoundInfoList.Clear;
  sFileName := g_Config.sEnvirDir + 'CompoundInfo.txt';
  LoadList := TStringList.Create;
  if FileExists(sFileName) then begin
    g_CompoundInfoList.Lock;
    try
      g_CompoundInfoList.Clear;
      LoadList.LoadFromFile(sFileName);
      for i := 0 to LoadList.Count - 1 do
      begin
        sText := LoadList.Strings[i];
        sText := GetValidStr3(sText, sItemName, [' ', ',', #9]);
        sText := GetValidStr3(sText, sLevel, [' ', ',', #9]);
        sText := GetValidStr3(sText, sValue, [' ', ',', #9]);
        nLevel := StrToIntDef(sLevel, 0);
        nLowValue := StrToIntDef(sValue, 0);
        if (sText = '') or (sItemName = '') or (nLevel < Low(TCompoundInfos)) or (nLevel > High(TCompoundInfos)) or (nLowValue <= 0) then
          Continue;
        if UserEngine.GetStdItem(sItemName) = nil then
          Continue;
        j := g_CompoundInfoList.IndexOf(sItemName);
        if j < 0 then
        begin
          New(pCompoundInfos);
          ZeroMemory(pCompoundInfos, SizeOf(TCompoundInfos));
          g_CompoundInfoList.AddObject(sItemName, TObject(pCompoundInfos));
        end
        else
          pCompoundInfos := pTCompoundInfos(g_CompoundInfoList.Objects[j]);
        pCompoundInfos[nLevel].Value := nLowValue;
        for j := Low(pCompoundInfos[nLevel].Value1) to High(pCompoundInfos[nLevel].Value1) do
        begin
          sText := GetValidStr3(sText, sValue, [' ', ',', '-', #9]);
          nLowValue := StrToIntDef(sValue, 0);
          sText := GetValidStr3(sText, sValue, [' ', ',', #9]);
          nHighValue := StrToIntDef(sValue, 0);
          pCompoundInfos[nLevel].Value1[j] := MakeLong(nLowValue, nHighValue);
        end;  
        for j := Low(pCompoundInfos[nLevel].Value2) to High(pCompoundInfos[nLevel].Value2) do
        begin
          sText := GetValidStr3(sText, sValue, [' ', ',', '-', #9]);
          nLowValue := StrToIntDef(sValue, 0);
          sText := GetValidStr3(sText, sValue, [' ', ',', #9]);
          nHighValue := StrToIntDef(sValue, 0);
          pCompoundInfos[nLevel].Value2[j] := MakeWord(nLowValue, nHighValue);
        end;  
        for j := Low(pCompoundInfos[nLevel].Rate) to High(pCompoundInfos[nLevel].Rate) do
        begin
          sText := GetValidStr3(sText, sValue, [' ', ',', #9]);
          pCompoundInfos[nLevel].Rate[j] := StrToIntDef(sValue, 0);
        end;  
      end;
    finally
      g_CompoundInfoList.UnLock;
    end;
    Result := g_CompoundInfoList.Count;
  end
  else begin
    LoadList.Clear;
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;


function TFrmDB.GetSetItem(sItemName: string): TList;
var
  I, k: Integer;
  SetItems: pTSetItems;
begin
  Result := nil;
  if sItemName = '' then Exit;
  for I := 0 to g_SetItemsList.Count - 1 do begin
    SetItems := pTSetItems(g_SetItemsList[I]);
    for k := Low(SetItems.Items) to High(SetItems.Items) do begin
      if CompareText(SetItems.Items[k], sItemName) = 0 then begin
        if Result = nil then
          Result := TList.Create;
        Result.Add(Pointer(I));
        break;
      end;
    end;
  end;
end;

//00486330
function TFrmDB.LoadMagicDB():Integer;
var
  i:Integer;
  Magic:pTMagic;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MAGIC ORDER BY FLD_ID';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    UserEngine.SwitchMagicList();

    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      New(Magic);
      Magic.wMagicId      := Query.FieldByName('FLD_ID').AsInteger;
      Magic.wMimicID      := Query.FieldByName('FLD_MIMICID').AsInteger;
      Magic.sMagicName    := Trim(Query.FieldByName('FLD_NAME').AsString);
      Magic.btEffectType  := Query.FieldByName('FLD_EFFECTTYPE').AsInteger;
      Magic.btEffect      := Query.FieldByName('FLD_EFFECT').AsInteger;
      Magic.btIcon        := Query.FieldByName('FLD_ICON').AsInteger;
      Magic.wSpell        := Query.FieldByName('FLD_SPELL').AsInteger;
      Magic.wPower        := Query.FieldByName('FLD_POWER').AsInteger;
      Magic.wMaxPower     := Query.FieldByName('FLD_MAXPOWER').AsInteger;
      Magic.btJob         := Query.FieldByName('FLD_JOB').AsInteger;
      Magic.TrainLevel[0] := Query.FieldByName('FLD_NEEDL1').AsInteger;       //¹«°ø·¹º§
      Magic.TrainLevel[1] := Query.FieldByName('FLD_NEEDL2').AsInteger;       //¹«°ø·¹º§
      Magic.TrainLevel[2] := Query.FieldByName('FLD_NEEDL3').AsInteger;       //¹«°ø·¹º§
      Magic.TrainLevel[3] := Magic.TrainLevel[2];                             //¹«°ø·¹º§
      Magic.MaxTrain[0]   := Query.FieldByName('FLD_L1TRAIN').AsInteger;      //¹«°ø·¹º§
      Magic.MaxTrain[1]   := Query.FieldByName('FLD_L2TRAIN').AsInteger;      //¹«°ø·¹º§
      Magic.MaxTrain[2]   := Query.FieldByName('FLD_L3TRAIN').AsInteger;      //¹«°ø·¹º§
      Magic.MaxTrain[3]   := Magic.MaxTrain[2];                               //¹«°ø·¹º§
      Magic.btTrainLv     := MaxSkillLevel;
      Magic.dwDelayTime   := Query.FieldByName('FLD_DELAY').AsInteger;
      Magic.dwUseDelayTime  := Query.FieldByName('FLD_USEDELAY').AsInteger;
      Magic.btDefSpell    := Query.FieldByName('FLD_DEFSPELL').AsInteger;
      Magic.btDefPower    := Query.FieldByName('FLD_DEFPOWER').AsInteger;
      Magic.btDefMaxPower := Query.FieldByName('FLD_DEFMAXPOWER').AsInteger;
      if Magic.wMagicId > 0 then begin
        UserEngine.m_MagicList.Add(Magic);
      end else begin
        Dispose(Magic);
      end;
      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function  TFrmDB.LoadDismantleList: integer;      //ÀÏ¹ÝºÐÇØ
var
   strlist: TStringList;
   i, count: integer;
   str, flname, itemname, Dismantlename: string;
   slist: TStringList;
begin
   Result := -1;
   flname := g_Config.sEnvirDir + 'DismantleList.txt';
   g_DismantleList.Clear;   // 2003/11/20 ¸®·Îµå¸¦ À§ÇÑ ÃÊ±âÈ­(sonmg)
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      slist := nil;
      Dismantlename := '';
      for i:=0 to strlist.Count-1 do begin
         str := Trim(strlist[i]);
         if str <> '' then begin
            if str[1] = ';' then continue;
            if str[1] = '[' then begin
               if slist <> nil then g_DismantleList.AddObject (Dismantlename, TObject(slist));
               slist := TStringList.Create;
               ArrestStringEx (str, '[', ']', Dismantlename);
            end else
               if slist <> nil then begin
                  str := GetValidStr3 (str, itemname, [' ', #9]);
                  if length( itemname ) > 22 then MainOutMessage('DISASSEMBLE NAME > 22'+itemname);
                  count := Str_ToInt (Trim(str), 1);
                  slist.AddObject (itemname, TObject(count));
               end;
         end;
      end;
      if slist <> nil then begin
         g_DismantleList.AddObject (Dismantlename, TObject(slist));
      end;
      strlist.Free;
      Result := 1;
   end;
end;

function  TFrmDB.LoadWakeList: integer;
var
   strlist: TStringList;
   i, count: integer;
   str, flname, itemname,Wakename: string;
   slist: TStringList;
begin
   Result := -1;
   flname := g_Config.sEnvirDir + 'ItemUpgrade.txt';
   g_WakeItemList.Clear;   // 2003/11/20 ¸®·Îµå¸¦ À§ÇÑ ÃÊ±âÈ­(sonmg)
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      slist := nil;
      Wakename := '';
      for i:=0 to strlist.Count-1 do begin
         str := Trim(strlist[i]);
         if str <> '' then begin
            if str[1] = ';' then continue;
            if str[1] = '[' then begin
               if slist <> nil then g_WakeItemList.AddObject (Wakename, TObject(slist));
               slist := TStringList.Create;
               ArrestStringEx (str, '[', ']', Wakename);
            end else
               if slist <> nil then begin
                  str := GetValidStr3 (str, itemname, [' ', #9]);
                  if length( itemname ) > 22 then MainOutMessage('WAKEUPITEM NAME > 22'+itemname);
                  count := Str_ToInt (Trim(str), 1);
                  slist.AddObject (itemname, TObject(count));
               end;
         end;
      end;
      if slist <> nil then begin
         g_WakeItemList.AddObject (Wakename, TObject(slist));
      end;
      strlist.Free;
      Result := 1;
   end;
end;


function  TFrmDB.LoadDisassembleList: integer;
var
   strlist: TStringList;
   i, count: integer;
   str, flname, itemname, Disassemblename: string;
   slist: TStringList;
begin
   Result := -1;
   flname := g_Config.sEnvirDir + 'DisassembleList.txt';
   g_DisassembleList.Clear;   // 2003/11/20 ¸®·Îµå¸¦ À§ÇÑ ÃÊ±âÈ­(sonmg)
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      slist := nil;
      Disassemblename := '';
      for i:=0 to strlist.Count-1 do begin
         str := Trim(strlist[i]);
         if str <> '' then begin
            if str[1] = ';' then continue;
            if str[1] = '[' then begin
               if slist <> nil then g_DisassembleList.AddObject (Disassemblename, TObject(slist));
               slist := TStringList.Create;
               ArrestStringEx (str, '[', ']', Disassemblename);
            end else
               if slist <> nil then begin
                  str := GetValidStr3 (str, itemname, [' ', #9]);
                  if length( itemname ) > 22 then MainOutMessage('DISASSEMBLE NAME > 22'+itemname);
                  count := Str_ToInt (Trim(str), 1);
                  slist.AddObject (itemname, TObject(count));
               end;
         end;
      end;
      if slist <> nil then begin
         g_DisassembleList.AddObject (Disassemblename, TObject(slist));
      end;
      strlist.Free;
      Result := 1;
   end;
end;

function  TFrmDB.LoadMakeItemList: integer;      //Á¦Á¶½ºÃÄ
var
   strlist: TStringList;
   i, count: integer;
   str, flname, itemname, makeitemname: string;
   slist: TStringList;
begin
   Result := -1;
   flname := g_Config.sEnvirDir + 'MakeItemList.txt';
   g_MakeItemList.Clear;   // 2003/11/20 ¸®·Îµå¸¦ À§ÇÑ ÃÊ±âÈ­(sonmg)
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      slist := nil;
      makeitemname := '';
      for i:=0 to strlist.Count-1 do begin
         str := Trim(strlist[i]);
         if str <> '' then begin
            if str[1] = ';' then continue;
            if str[1] = '[' then begin
               if slist <> nil then g_MakeItemList.AddObject (makeitemname, TObject(slist));
               slist := TStringList.Create;
               ArrestStringEx (str, '[', ']', makeitemname);
            end else
               if slist <> nil then begin
                  str := GetValidStr3 (str, itemname, [' ', #9]);
                  if length( itemname ) > 22 then MainOutMessage('MAKEITEMLIST NAME > 22'+itemname);
                  count := Str_ToInt (Trim(str), 1);
                  slist.AddObject (itemname, TObject(count));
               end;
         end;
      end;
      if slist <> nil then begin
         g_MakeItemList.AddObject (makeitemname, TObject(slist));
      end;
      strlist.Free;
      Result := 1;
   end;
end;

function  TFrmDB.LoadChangeItemList: integer;      //º¯È¯½ºÃÄ
var
   strlist: TStringList;
   i, count: integer;
   str, flname, itemname, changeitemname: string;
   slist: TStringList;
begin
   Result := -1;
   flname := g_Config.sEnvirDir + 'ChangeItemList.txt';
   g_ChangeItemList.Clear;   // 2003/11/20 ¸®·Îµå¸¦ À§ÇÑ ÃÊ±âÈ­(sonmg)
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      slist := nil;
      changeitemname := '';
      for i:=0 to strlist.Count-1 do begin
         str := Trim(strlist[i]);
         if str <> '' then begin
            if str[1] = ';' then continue;
            if str[1] = '[' then begin
               if slist <> nil then g_ChangeItemList.AddObject (changeitemname, TObject(slist));
               slist := TStringList.Create;
               ArrestStringEx (str, '[', ']', changeitemname);
            end else
               if slist <> nil then begin
                  str := GetValidStr3 (str, itemname, [' ', #9]);
                  if length( itemname ) > 22 then MainOutMessage('CHANGEITEMLIST NAME > 22'+itemname);
                  count := Str_ToInt (Trim(str), 1);
                  slist.AddObject (itemname, TObject(count));
               end;
         end;
      end;
      if slist <> nil then begin
         g_ChangeItemList.AddObject (changeitemname, TObject(slist));
      end;
      strlist.Free;
      Result := 1;
   end;
end;

function TFrmDB.LoadMapInfo: Integer;
  function LoadMapQuest(sName:String):TMerchant;
  var
    QuestNPC:TMerchant;
  begin
    QuestNPC:=TMerchant.Create;
    QuestNPC.m_NpcType := n_Norm;
    QuestNPC.m_sMapName:='0';
    QuestNPC.m_nCurrX:=0;
    QuestNPC.m_nCurrY:=0;
    QuestNPC.m_sCharName:=sName;
    QuestNPC.m_nFlag:=0;
    QuestNPC.m_wAppr:=0;
    QuestNPC.m_sFilePath:='MapQuest_def\';
    QuestNPC.m_boIsHide:=True;
    QuestNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(QuestNPC);

    Result:=QuestNPC;
  end;

{$IFDEF UseTXT}
  procedure LoadSubMapInfo(LoadList:TStringList;sFileName:String);
  var
    I: Integer;
    sFilePatchName,sFileDir:String;
    LoadMapList:TStringList;
  begin
    sFileDir:=g_Config.sEnvirDir + 'MapInfo\';
    if not DirectoryExists(sFileDir) then begin
      CreateDir(sFileDir);
    end;
      
    sFilePatchName:=sFileDir + sFileName;
    if FileExists(sFilePatchName) then begin
      LoadMapList:=TStringList.Create;
      LoadMapList.LoadFromFile(sFilePatchName);
      for I := 0 to LoadMapList.Count - 1 do begin
        LoadList.Add(LoadMapList.Strings[I]);
      end;
      LoadMapList.Free;
    end;
  end;
{$ENDIF}

var
{$IFDEF UseTXT}
  sFileName:String;

  LoadList:TStringList;
  sLineText:String;

  sData,sMapNameLine,sMapFileName,sDMapNO,sServerIndex:String;
  nSMapX,nSMapY,nDMapX,nDMapY:Integer;

  sMapInfoFile:String;
{$ELSE}
  nIdx: Integer;
{$ENDIF}
  sCaption: String;
  i:Integer;
  sFlag,s34,s38,sMapName,sMapDesc,sReConnectMap:String;
  nServerIndex:Integer;
  MapFlag:TMapFlag;
  QuestNPC:TMerchant;
  TempEnvir : TEnvirnoment;
{$IFNDEF UseTXT}
ResourceString
  sSQLString = 'SELECT * FROM TBL_MAPINFO';
{$ENDIF}
begin
  sCaption := FrmMain.Caption;
  Result:= -1;
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
  {$IFDEF UseTXT}
    sFileName:=g_Config.sEnvirDir + 'MapInfo.txt';
    if FileExists(sFileName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      if LoadList.Count < 0 then begin
        LoadList.Free;
        exit;
      end;
      I:=0;
      while (True) do begin
        if I >= LoadList.Count then break;
        if CompareLStr('loadmapinfo',LoadList.Strings[I],Length('loadmapinfo')) then begin
          sMapInfoFile:=GetValidStr3(LoadList.Strings[I], sLineText, [' ', #9]);
          LoadList.Delete(I);
          if sMapInfoFile <> '' then begin
            LoadSubMapInfo(LoadList,sMapInfoFile);
          end;
        end;
        Inc(I);
      end;
      Result:=1;

      for i:=0 to LoadList.Count -1 do begin
        sLineText:=LoadList.Strings[i];
        if (sLineText <> '') and (sLineText[1] = '[') then begin
          sMapName:='';
          MapFlag.boSAFE:=False;  //¾ÈÀü  ¼³Á¤
          sLineText:=ArrestStringEx(sLineText,'[',']',sMapNameLine);
          sMapDesc:=GetValidStrCap(sMapNameLine,sMapFileName,[' ', ',', #9]);
          sMapFileName:=GetValidStr3(sMapFileName,sMapName,['|']);
          if sMapFileName = '' then sMapFileName:=sMapName;

          if (sMapDesc <> '') and (sMapDesc[1] = '"') then
              ArrestStringEx(sMapDesc,'"','"',sMapDesc);


          sServerIndex:= Trim(GetValidStr3(sMapDesc,sMapDesc,[' ', ',', #9]));
          nServerIndex:=Str_ToInt(sServerIndex,0);
          if sMapName = '' then Continue;


          FillChar(MapFlag,SizeOf(TMapFlag),#0);
          MapFlag.nL:=1;
          QuestNPC:=nil;
          MapFlag.nNEEDSETONFlag:= -1;
          MapFlag.nNeedONOFF:= -1;
          MapFlag.nMUSICID:=-1;
          MapFlag.nGuildTerritory:=-1; // Sergiu
          MapFlag.sUnAllowStdItemsText := '';    //»ç¿ë±ÝÁö1
          MapFlag.sUnAllowMagicText := '';    //»ç¿ë±ÝÁö2
          MapFlag.autoattack := -1;          //¸¶·æ¹ø°³
          MapFlag.boSNOW := False;       //´«¿À´ÂÀÌÆå
          MapFlag.boFLOWER := False;
          MapFlag.boGROUPCOUNT := False;
          MapFlag.boNOMOVE := False;

          FrmMain.Caption:=sCaption + '[ÕýÔÚ¼ÓÔØµØÍ¼: '+sMapName+' ('+inttostr(I+1)+'/'+inttostr(LoadList.Count)+')';

          sFlag := sLineText;
    {$ELSE}
      try
      UseSQL();
      Query.SQL.Clear;
      Query.SQL.Add(sSQLString);
      MiniMapList.Clear;
      BigMapList.Clear;
      try
        Query.Open;
      except
        Result:= -2;
      end;
      for i:=0 to Query.RecordCount -1 do begin
        sMapName      := Trim(Query.FieldByName('FLD_MAPFILENAME').AsString);
        sMapDesc      := Trim(Query.FieldByName('FLD_MAPNAME').AsString);
        sFlag         := Trim(Query.FieldByName('FLD_FLAGS').AsString);
        nServerIndex  := Query.FieldByName('FLD_SERVERINDEX').AsInteger;
        
        if sMapName = '' then begin
          Query.Next;
          Continue;
        end;
        FrmMain.Caption:=sCaption + '[ÕýÔÚ¼ÓÔØµØÍ¼: '+sMapName+' ('+inttostr(I+1)+'/'+inttostr(Query.RecordCount)+')';
  //      FrmMain.MemoLog.Lines.Add(' -> Adding Map: '+sMapName+' ('+inttostr(I+1)+'/'+inttostr(Query.RecordCount)+')');
        nIdx          := Query.FieldByName('FLD_MINIMAP').AsInteger;
        if nIdx > 0 then
          MiniMapList.AddObject(sMapName,TObject(nIdx));

     nIdx          := Query.FieldByName('FLD_BIGMAP').AsInteger;
      if nIdx > 0 then
        BigMapList.AddObject(sMapName,TObject(nIdx));

  
    {$ENDIF}

      FillChar(MapFlag,SizeOf(TMapFlag),#0);
      MapFlag.nL:=1;
      QuestNPC:=nil;
      MapFlag.boSAFE:=False;    //¾ÈÀü ¼³Á¤
      MapFlag.nNEEDSETONFlag:= -1;
      MapFlag.nNeedONOFF:= -1;
      MapFlag.nMUSICID:=-1;
      MapFlag.nGuildTerritory:=-1;
      MapFlag.sUnAllowStdItemsText := '';    //»ç¿ë±ÝÁö1
      MapFlag.sUnAllowMagicText := '';    //»ç¿ë±ÝÁö2
      MapFlag.autoattack := -1;          //¸¶·æ¹ø°³
      MapFlag.boSNOW := False;       //´«¿À´ÂÀÌÆå
      MapFlag.boFLOWER := False;
      MapFlag.boGROUPCOUNT := False;
      MapFlag.boNOMOVE := False;

      while (True) do begin
        if sFlag = '' then break;
        sFlag:=GetValidStr3(sFlag,s34,[' ', ',', #9]);
        if s34 = '' then break;

        if CompareText(s34,'SAFE') = 0 then begin
          MapFlag.boSAFE:=True;
          Continue;
        end;
        if CompareText(s34,'DARK') = 0 then begin
          MapFlag.boDarkness:=True;
          Continue;
        end;
        if CompareText(s34,'FIGHT') = 0 then begin
          MapFlag.boFightZone:=True;
          Continue;
        end;
        if CompareText(s34,'FIGHT3') = 0 then begin
          MapFlag.boFight3Zone:=True;
          Continue;
        end;
        if CompareText(s34,'PKZONE') = 0 then begin
          MapFlag.boPKZONE:=True;
          Continue;
        end;
        if CompareText(s34,'VAILANT') = 0 then begin  //¿ë¸ÍÀÇÀüÀå
          MapFlag.VailantZone:=True;
          Continue;
        end;
        if CompareText(s34,'DAY') = 0 then begin
          MapFlag.boDayLight:=True;
          Continue;
        end;
        if CompareText(s34,'QUIZ') = 0 then begin
          MapFlag.boQUIZ:=True;
          Continue;
        end;
        if CompareLStr(s34,'NORECONNECT',length('NORECONNECT')) then begin
          MapFlag.boNORECONNECT:=True;
          ArrestStringEx(s34,'(',')',sReConnectMap);
          MapFlag.sNoReConnectMap:=sReConnectMap;
          if MapFlag.sNoReConnectMap = '' then Result:= -11;
          Continue;
        end;
        if CompareLStr(s34,'CHECKQUEST',length('CHECKQUEST')) then begin
          ArrestStringEx(s34,'(',')',s38);
          QuestNPC:=LoadMapQuest(s38);
          Continue;
        end;
        if CompareLStr(s34,'NEEDSET_ON',length('NEEDSET_ON')) then begin
          MapFlag.nNeedONOFF:=1;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nNEEDSETONFlag:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'NEEDSET_OFF',length('NEEDSET_OFF')) then begin
          MapFlag.nNeedONOFF:=0;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nNEEDSETONFlag:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'MUSIC',length('MUSIC')) then begin
          MapFlag.boMUSIC:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nMUSICID:=Str_ToInt(s38,-1);
          Continue;
        end;

        if CompareLStr(s34,'DEATHMATCH',length('DEATHMATCH')) then begin        //µ¥½º¸ÅÄ¡
          MapFlag.boDEATHMATCH:=True;
          Continue;
        end;
        if CompareLStr(s34,'NOTGROUP',length('NOTGROUP')) then begin       
          MapFlag.boNotGroup:=True;
          Continue;
        end;
        if CompareLStr(s34,'EXPRATE',length('EXPRATE')) then begin
          MapFlag.boEXPRATE:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nEXPRATE:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKWINLEVEL',length('PKWINLEVEL')) then begin
          MapFlag.boPKWINLEVEL:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKWINLEVEL:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKWINEXP',length('PKWINEXP')) then begin
          MapFlag.boPKWINEXP:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKWINEXP:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKLOSTLEVEL',length('PKLOSTLEVEL')) then begin
          MapFlag.boPKLOSTLEVEL:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKLOSTLEVEL:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'PKLOSTEXP',length('PKLOSTEXP')) then begin
          MapFlag.boPKLOSTEXP:=True;
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nPKLOSTEXP:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECHP',length('DECHP')) then begin
          MapFlag.boDECHP:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECHPPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECHPTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCHP',length('INCHP')) then begin
          MapFlag.boINCHP:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCHPPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCHPTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECGAMEGOLD',length('DECGAMEGOLD')) then begin
          MapFlag.boDECGAMEGOLD:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECGAMEGOLD:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECGAMEGOLDTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'DECGAMEPOINT',length('DECGAMEPOINT')) then begin
          MapFlag.boDECGAMEPOINT:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nDECGAMEPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nDECGAMEPOINTTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCGAMEGOLD',length('INCGAMEGOLD')) then begin
          MapFlag.boINCGAMEGOLD:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCGAMEGOLD:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCGAMEGOLDTIME:=Str_ToInt(s38,-1);
          Continue;
        end;
        if CompareLStr(s34,'INCGAMEPOINT',length('INCGAMEPOINT')) then begin
          MapFlag.boINCGAMEPOINT:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCGAMEPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCGAMEPOINTTIME:=Str_ToInt(s38,-1);
          Continue;
        end;


        if CompareLStr(s34,'INCPCPOINT',length('INCPCPOINT')) then begin
          MapFlag.boINCPCPOINT:=True;
          ArrestStringEx(s34,'(',')',s38);

          MapFlag.nINCPCPOINT:=Str_ToInt(GetValidStr3(s38,s38,['/']),-1);
          MapFlag.nINCPCPOINTTIME:=Str_ToInt(s38,-1);
          Continue;
        end;

        if CompareText(s34,'NOMOVE') = 0 then begin
          MapFlag.boNOMOVE:=True;
          Continue;
        end;

        if CompareLStr(s34, 'MAPGROUP', Length('MAPGROUP')) then begin  //¸Ê
          ArrestStringEx(s34, '(', ')', s38);
          MapFlag.nMAPGROUP := Str_ToInt(s38, -1);
          Continue;
        end;

        if CompareLStr(s34, 'SNOW', Length('SNOW')) then begin  //´«¿À´ÂÀÌÆå
          MapFlag.boSNOW := True;
          ArrestStringEx(s34, '(', ')', s38);
          MapFlag.nSNOWLEVEL := Str_ToInt(s38, -1);
          Continue;
        end;

        if CompareLStr(s34, 'FLOWER', Length('FLOWER')) then begin
          MapFlag.boFLOWER := True;
          ArrestStringEx(s34, '(', ')', s38);
          MapFlag.nFLOWERLEVEL := Str_ToInt(s38, -1);
          Continue;
        end;

        if CompareLStr(s34, 'GROUP', Length('GROUP')) then begin  //¸Ê ±×·ìÀÎ¿ø
          MapFlag.boGROUPCOUNT := True;
          ArrestStringEx(s34, '(', ')', s38);
          MapFlag.nGROUPCOUNT := Str_ToInt(s38, -1);
          Continue;
        end;

        if CompareLStr(s34, 'RUNHUMAN', Length('RUNHUMAN')) then begin
            MapFlag.boRUNHUMAN := True;
            Continue;
          end;
          if CompareLStr(s34, 'RUNMON', Length('RUNMON')) then begin
            MapFlag.boRUNMON := True;
            Continue;
          end;
          if CompareLStr(s34, 'NOTALLOWUSEITEMS', Length('NOTALLOWUSEITEMS')) then begin //»ç¿ë±ÝÁö1
            MapFlag.boUnAllowStdItems := True;
            ArrestStringEx(s34, '(', ')', s38);
            MapFlag.sUnAllowStdItemsText := Trim(s38);
            Continue;
          end;
          if CompareLStr(s34,'NOTALLOWUSEMAGIC',length('NOTALLOWUSEMAGIC')) then begin   //»ç¿ë±ÝÁö2
            MapFlag.boNOTALLOWMAGIC:=True;
            ArrestStringEx(s34,'(',')',s38);
            MapFlag.sUnAllowMagicText := Trim(s38);
            Continue;
          end;
          if CompareLStr(s34, 'NEEDHOLE', Length('NEEDHOLE')) then begin
            MapFlag.boNEEDHOLE := True;
            Continue;
          end;
          if CompareLStr(s34, 'NORECALL', Length('NORECALL')) then begin
            MapFlag.boNORECALL := True;
            Continue;
          end;
          if CompareLStr(s34, 'NOGUILDRECALL', Length('NOGUILDRECALL')) then begin
            MapFlag.boNOGUILDRECALL := True;
            Continue;
          end;
          if CompareLStr(s34, 'NODEARRECALL', Length('NODEARRECALL')) then begin
            MapFlag.boNODEARRECALL := True;
            Continue;
          end;
          if CompareLStr(s34, 'NORANDOMMOVE', Length('NORANDOMMOVE')) then begin
            MapFlag.boNORANDOMMOVE := True;
            Continue;
          end;
          if CompareLStr(s34, 'NOCASTLEMOVE', Length('NOCASTLEMOVE')) then begin
            MapFlag.boNOCASTLEMOVE := True;
            Continue;
          end;
          if CompareLStr(s34, 'NODRUG', Length('NODRUG')) then begin
            MapFlag.boNODRUG := True;
            Continue;
          end;
          if CompareLStr(s34, 'MINE', Length('MINE')) then begin      //±¤»ê ¸ÊÀÎÆ÷ ¸í·É¾î
            MapFlag.boMINE := True;
            Continue;
          end;
          if CompareLStr(s34, 'OPENSTORE', Length('OPENSTORE')) then begin //°³ÀÎ»óÁ¡ °¡´É¸Ê
            MapFlag.boOpenStore := True;
            Continue;
          end;
          if CompareLStr(s34, 'NORECALLHERO', Length('NORECALLHERO')) then begin //¿µ¿õ¼ÒÈ¯ ±ÝÁö
            MapFlag.boNoRecallHero := True;
            Continue;
          end;
          if CompareLStr(s34, 'WHITEMINE', Length('WHITEMINE')) then begin
            MapFlag.boMINE2 := True;
            Continue;
          end;
          if CompareLStr(s34, 'EVENTMINE', Length('EVENTMINE')) then begin
            MapFlag.boMINE3 := True;
            Continue;
          end;
          if CompareLStr(s34, 'GREENMINE', Length('GREENMINE')) then begin  //¼®ÃÊ±¤»ê
            MapFlag.boMINE4 := True;
            Continue;
          end;
        if CompareLStr(s34,'NOTHROWITEM', Length('NOTHROWITEM')) then begin
          MapFlag.boNOTHROWITEM := True;
          Continue;
        end;
        if CompareLStr(s34,'NODROPITEM', Length('NODROPITEM')) then begin
          MapFlag.boNODROPITEM := True;
          Continue;
        end;

        if CompareLStr(s34,'NOPOSITIONMOVE', Length('NOPOSITIONMOVE')) then begin
          MapFlag.boNOPOSITIONMOVE := True;
          Continue;
        end;

        if CompareLStr(s34, 'THUNDER', Length('THUNDER')) then begin
           MapFlag.autoattack := 1;    //¸¶·æ¹ø°³
           Continue;
        end;
        if CompareLStr(s34, 'FIRE', Length('FIRE')) then begin
           MapFlag.autoattack := 2;    //¸¶·æ¹ø°³
           Continue;
        end;
        if CompareLStr(s34, 'NOMAPXY', Length('NOMAPXY')) then begin
           MapFlag.autoattack := 3;    //¸¶·æ¹ø°³
           Continue;
        end;

        if CompareLStr(s34,'NOHORSE', Length('NOHORSE')) then begin ////²»ÔÊÐíÆïÂí
          MapFlag.boNOHORSE := True;
          Continue;
        end;
        if CompareLStr(s34,'NOCHAT', Length('NOCHAT')) then begin
          MapFlag.boNOCHAT := True;
          Continue;
        end;
        if CompareLStr(s34,'FISHEVENT', Length('FISHEVENT')) then begin    //³¬½Ã ÀÌº¥Æ®
          MapFlag.boFISHEVENT := True;
          Continue;
        end;
        if CompareLStr(s34,'NOTIGER', Length('NOTIGER')) then begin    //Å»°Í ºÒ°¡
          MapFlag.boNOTIGER := True;
          Continue;
        end;
        if CompareLStr(s34,'ALLATTMAP', Length('ALLATTMAP')) then begin    //Áß¸³¹®ÆÄ °ø°Ý°¡´É
          MapFlag.boALLATTMAP := True;
          Continue;
        end;
        if CompareLStr(s34,'NOPENETRATE', Length('NOPENETRATE')) then begin    //¸ÁÀÚÀÇ¿Ê ºÒ°¡
          MapFlag.boNOPENETRATE := True;
          Continue;
        end;
        if CompareLStr(s34,'NOREVIVAL', Length('NOREVIVAL')) then begin    //Å»°Í ºÒ°¡
          MapFlag.boNOREVIVAL := True;
          Continue;
        end;
        if CompareLStr(s34,'NOHUMNOMON', Length('NOHUMNOMON')) then begin  //ÓÐÈË²Å¿ªÊ¼Ë¢¹Ö
          MapFlag.boNOHUMNOMON := True;
          Continue;
        end;
        if (s34[1] = 'L') then begin
          MapFlag.nL:= Str_ToInt(Copy(s34,2,Length(s34) -1),1);
        end;
        if CompareLStr(s34,'GT',length('GT')) then begin
          ArrestStringEx(s34,'(',')',s38);
          MapFlag.nGuildTerritory := Str_ToInt(s38,-1);
          if g_GuildTerritory.FindGuildTerritory(MapFlag.nGuildTerritory) = nil then
            g_GuildTerritory.AddEmptyGT(MapFlag.nGuildTerritory);
          Continue;
        end;
      end;


      TempEnvir :=  g_MapManager.AddMapInfo(sMapName,sMapDesc,nServerIndex,@MapFlag,QuestNPC);
      if TempEnvir = nil then begin // Àß¸ø ¸¸µé¾î ºÀ½
        Result := -10
      end else begin // Àß ¸¸µé¾îÁ³À½
          // ¿ë½Ã½ºÅÛ¿¡ ÀÚµ¿°ø°Ý¼³Á¤À» ÇÔ.
        case TempEnvir.AutoAttack of
          1,2 : gFireDragon.SetAutoAttackMap( TempEnvir , TempEnvir.AutoAttack);    //¸¶·æ¹ø°³
         end;
       Result := 1;
      end;

{$IFDEF UseTXT}
        end;
      end;

      sData := s34;

      for i:=0 to LoadList.Count -1 do begin
        sLineText:=LoadList.Strings[i];
        if (sLineText <> '') and (sLineText[1] <> '[') and (sLineText[1] <> ';') then begin
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',', #9]);
            sMapName:=sData;
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',', #9]);
            nSMapX:=Str_ToInt(sData,0);
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',', #9]);
            nSMapY:=Str_ToInt(sData,0);
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',','-','>', #9]);
            sDMapNO:=sData;
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',', #9]);
            nDMapX:=Str_ToInt(sData,0);
            sLineText:=GetValidStr3(sLineText,sData,[' ', ',',';', #9]);
            nDMapY:=Str_ToInt(sData,0);
            g_MapManager.AddMapRoute(sMapName,nSMapX,nSMapY,sDMapNO,nDMapX,nDMapY);
        end;
      end;
      LoadList.Free;
   end;
{$ELSE}
      Query.Next;
    end;
  finally
    Query.Close;
  end;

{$ENDIF}
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
  FrmMain.Caption:=sCaption;
  {$IFNDEF UseTXT}
    LoadMapRoute();
  {$ENDIF}
end;

{$IFDEF UseTXT}
function TFrmDB.LoadMinMap():Integer;
var
  sFileName,tStr,sMapNO,sMapIdx:String;
  tMapList:TStringList;
  i,nIdx:Integer;
begin
  Result:=0;
  sFileName:=g_Config.sEnvirDir + 'MinMap.txt';
  if FileExists(sFileName) then begin
    MiniMapList.Clear;
    tMapList:=TStringList.Create;
    tMapList.LoadFromFile(sFileName);
    for i:=0 to tMapList.Count -1 do begin
      tStr:=tMapList.Strings[i];
      if (tStr <> '') and (tStr[1] <> ';') then begin
        tStr:=GetValidStr3(tStr, sMapNO, [' ', #9]);
        tStr:=GetValidStr3(tStr, sMapIdx, [' ', #9]);
        nIdx:=Str_ToInt(sMapIdx,0);
        if nIdx > 0 then
          MiniMapList.AddObject(sMapNO,TObject(nIdx));
      end;
    end;
    g_MapManager.ReSetMinMap(); //Sergiu
    tMapList.Free;
  end;
end;

function TFrmDB.LoadBigMap():Integer;
var
  sFileName,tStr,sMapNO,sMapIdx:String;
  tMapList:TStringList;
  i,nIdx:Integer;
begin
  Result:=0;
  sFileName:=g_Config.sEnvirDir + 'BigMap.txt';
  if FileExists(sFileName) then begin
    BigMapList.Clear;
    tMapList:=TStringList.Create;
    tMapList.LoadFromFile(sFileName);
    for i:=0 to tMapList.Count -1 do begin
      tStr:=tMapList.Strings[i];
      if (tStr <> '') and (tStr[1] <> ';') then begin
        tStr:=GetValidStr3(tStr, sMapNO, [' ', #9]);
        tStr:=GetValidStr3(tStr, sMapIdx, [' ', #9]);
        nIdx:=Str_ToInt(sMapIdx,0);
        if nIdx > 0 then
          BigMapList.AddObject(sMapNO,TObject(nIdx));
      end;
    end;
    g_MapManager.ReSetBigMap();
    tMapList.Free;
  end;
end;

{$ELSE}
function TFrmDB.LoadMapRoute():Integer;
var
  i,nSMapX,nSMapY,nDMapX,nDMapY:Integer;
  sSMapNO,sDMapNO:String;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MOVEMAPEVENT';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      sSMapNO       := Trim(Query.FieldByName('FLD_SMAPFILENAME').AsString);
      nSMapX        := Query.FieldByName('FLD_SX').AsInteger;
      nSMapY        := Query.FieldByName('FLD_SY').AsInteger;
      sDMapNO       := Trim(Query.FieldByName('FLD_DMAPFILENAME').AsString);
      nDMapX        := Query.FieldByName('FLD_DX').AsInteger;
      nDMapY        := Query.FieldByName('FLD_DY').AsInteger;

      g_MapManager.AddMapRoute(sSMapNO,nSMapX,nSMapY,sDMapNO,nDMapX,nDMapY);

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
{$ENDIF}

procedure TFrmDB.QFunctionNPC;
var
  sScriptFile :String;
  sScritpDir  :String;
  SaveList    :TStringList;
  sShowFile   :String;
begin
try
  sScriptFile:=g_Config.sEnvirDir + sMarket_Def + 'QFunction-0.txt';
  sShowFile:=ReplaceChar(sScriptFile,'\','/');
  sScritpDir:=g_Config.sEnvirDir + sMarket_Def;
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    SaveList:=TStringList.Create;
    SaveList.Add(';QFunctions');
    SaveList.SaveToFile(sScriptFile);
    SaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_FunctionNPC:=TMerchant.Create;
    g_FunctionNPC.m_sMapName  := '0';
    g_FunctionNPC.m_nCurrX    := 0;
    g_FunctionNPC.m_nCurrY    := 0;
    g_FunctionNPC.m_sCharName := 'QFunction';
    g_FunctionNPC.m_nFlag     := 0;
    g_FunctionNPC.m_wAppr     := 0;
    g_FunctionNPC.m_sFilePath := sMarket_Def;
    g_FunctionNPC.m_sScript   := 'QFunction';
    g_FunctionNPC.m_boIsHide  := True;
    g_FunctionNPC.m_boIsQuest := False;
    UserEngine.AddMerchant(g_FunctionNPC);
  end else begin
    g_FunctionNPC:=nil;
  end;
except
  g_FunctionNPC:=nil;
end;
end;

procedure TFrmDB.QMangeNPC();
var
  sScriptFile :String;
  sScritpDir  :String;
  SaveList    :TStringList;
  sShowFile   :String;
begin
try
  sScriptFile:=g_Config.sEnvirDir + 'MapQuest_def\' + 'QManage.txt';
  sShowFile:=ReplaceChar(sScriptFile,'\','/');
  sScritpDir:=g_Config.sEnvirDir + 'MapQuest_def\';
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    SaveList:=TStringList.Create;
    SaveList.Add(';QManage');
    SaveList.SaveToFile(sScriptFile);
    SaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_ManageNPC:=TMerchant.Create;
    g_ManageNPC.m_NpcType := n_Norm;
    g_ManageNPC.m_sMapName:='0';
    g_ManageNPC.m_nCurrX:=0;
    g_ManageNPC.m_nCurrY:=0;
    g_ManageNPC.m_sCharName:='QManage';
    g_ManageNPC.m_nFlag:=0;
    g_ManageNPC.m_wAppr:=0;
    g_ManageNPC.m_sFilePath:='MapQuest_def\';
    g_ManageNPC.m_boIsHide:=True;
    g_ManageNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(g_ManageNPC);
  end else begin
    g_ManageNPC:=nil;
  end;
except
  g_ManageNPC:=nil;
end;
end;
procedure TFrmDB.RobotNPC();
var
  sScriptFile:String;
  sScritpDir :String;
  tSaveList:TStringList;
begin
try
  sScriptFile:=g_Config.sEnvirDir + 'Robot_def\' + 'RobotManage.txt';
  sScritpDir:=g_Config.sEnvirDir + 'Robot_def\';
  if not DirectoryExists(sScritpDir) then
    mkdir(Pchar(sScritpDir));

  if not FileExists(sScriptFile) then begin
    tSaveList:=TStringList.Create;
    tSaveList.Add(';Robot');
    tSaveList.SaveToFile(sScriptFile);
    tSaveList.Free;
  end;
  if FileExists(sScriptFile) then begin
    g_RobotNPC:=TMerchant.Create;
    g_RobotNPC.m_NpcType := n_Norm;
    g_RobotNPC.m_sMapName:='0';
    g_RobotNPC.m_nCurrX:=0;
    g_RobotNPC.m_nCurrY:=0;
    g_RobotNPC.m_sCharName:='RobotManage';
    g_RobotNPC.m_nFlag:=0;
    g_RobotNPC.m_wAppr:=0;
    g_RobotNPC.m_sFilePath:='Robot_def\';
    g_RobotNPC.m_boIsHide:=True;
    g_RobotNPC.m_boIsQuest:=False;
    UserEngine.QuestNPCList.Add(g_RobotNPC);
  end else begin
    g_RobotNPC:=nil;
  end;
except
  g_RobotNPC:=nil;
end;
end;

function TFrmDB.LoadMapEvent(): Integer;
var
  sFileName, tStr: string;
  tMapEventList: TStringList;
  I: Integer;
  s18, s1C, s20, s24, s28, s2C, s30, s34, s36, s38, s40, s42, s44, s46, sRange: string;
  MapEvent: pTMapEvent;
  Map: TEnvirnoment;
begin
  Result := 1;
  sFileName := g_Config.sEnvirDir + 'MapEvent.txt';
  if FileExists(sFileName) then begin
    tMapEventList := TStringList.Create;
    tMapEventList.LoadFromFile(sFileName);
    for I := 0 to tMapEventList.Count - 1 do begin
      tStr := tMapEventList.Strings[I];
      if (tStr <> '') and (tStr[1] <> ';') then begin
        tStr := GetValidStr3(tStr, s18, [' ', #9]);
        tStr := GetValidStr3(tStr, s1C, [' ', #9]);
        tStr := GetValidStr3(tStr, s20, [' ', #9]);
        tStr := GetValidStr3(tStr, sRange, [' ', #9]);
        tStr := GetValidStr3(tStr, s24, [' ', #9]);
        tStr := GetValidStr3(tStr, s28, [' ', #9]);
        tStr := GetValidStr3(tStr, s2C, [' ', #9]);
        tStr := GetValidStr3(tStr, s30, [' ', #9]);
        if (s18 <> '') and (s1C <> '') and (s20 <> '') and (s30 <> '') then begin
          Map := g_MapManager.FindMap(s18);
          if Map <> nil then begin
            New(MapEvent);
            FillChar(MapEvent.m_MapFlag, SizeOf(TQuestUnitStatus), 0);
            FillChar(MapEvent.m_Condition, SizeOf(TMapCondition), #0);
            FillChar(MapEvent.m_StartScript, SizeOf(TStartScript), #0);
            MapEvent.m_sMapName := Trim(s18);
            MapEvent.m_nCurrX := Str_ToInt(s1C, 0);
            MapEvent.m_nCurrY := Str_ToInt(s20, 0);
            MapEvent.m_nRange := Str_ToInt(sRange, 0);
            s24 := GetValidStr3(s24, s34, [':', #9]);
            s24 := GetValidStr3(s24, s36, [':', #9]);
            MapEvent.m_MapFlag.nQuestUnit := Str_ToInt(s34, 0);
            if Str_ToInt(s36, 0) <> 0 then MapEvent.m_MapFlag.boOpen := True
            else MapEvent.m_MapFlag.boOpen := False;
            s28 := GetValidStr3(s28, s38, [':', #9]);
            s28 := GetValidStr3(s28, s40, [':', #9]);
            s28 := GetValidStr3(s28, s42, [':', #9]);
            MapEvent.m_Condition.nHumStatus := Str_ToInt(s38, 0);
            MapEvent.m_Condition.sItemName := Trim(s40);
            if Str_ToInt(s42, 0) <> 0 then MapEvent.m_Condition.boNeedGroup := True
            else MapEvent.m_Condition.boNeedGroup := False;
            MapEvent.m_nRandomCount := Str_ToInt(s2C, 999999);
            s30 := GetValidStr3(s30, s44, [':', #9]);
            s30 := GetValidStr3(s30, s46, [':', #9]);
            MapEvent.m_StartScript.nLable := Str_ToInt(s44, 0);
            MapEvent.m_StartScript.sLable := Trim(s46);
            case MapEvent.m_Condition.nHumStatus of
              1: g_MapEventListOfDropItem.Add(MapEvent);
              2: g_MapEventListOfPickUpItem.Add(MapEvent);
              3: g_MapEventListOfMine.Add(MapEvent);
              4: g_MapEventListOfWalk.Add(MapEvent);
              5: g_MapEventListOfRun.Add(MapEvent);
            else begin
                Dispose(MapEvent);
              end;
            end;
          end else Result := -I;
        end;
      end;
    end;
  end;
end;

//00489414
function TFrmDB.LoadMapQuest(): Integer;
var
  sFileName,tStr:String;
  tMapQuestList:TStringList;
  i:Integer;
  sMap,s1C,s20,sMonName,sItem,sQuest,s30,s34:String;
  n38,n3C:Integer;
  boGrouped:Boolean;
  Map:TEnvirnoment;
begin
    Result:=1;
    sFileName:=g_Config.sEnvirDir + 'MapQuest.txt';
    if FileExists(sFileName) then begin
      tMapQuestList:=TStringList.Create;
      tMapQuestList.LoadFromFile(sFileName);
      for i:=0 to tMapQuestList.Count -1 do begin
        tStr:=tMapQuestList.Strings[i];
        if (tStr <> '') and (tStr[1] <> ';') then begin
          tStr:=GetValidStr3(tStr, sMap, [' ', #9]);
          tStr:=GetValidStr3(tStr, s1C, [' ', #9]);
          tStr:=GetValidStr3(tStr, s20, [' ', #9]);
          tStr:=GetValidStr3(tStr, sMonName, [' ', #9]);
          if (sMonName <> '') and (sMonName[1] = '"') then
            ArrestStringEx(sMonName,'"','"',sMonName);
          tStr:=GetValidStr3(tStr, sItem, [' ', #9]);
          if (sItem <> '') and (sItem[1] = '"') then
            ArrestStringEx(sItem,'"','"',sItem);
          tStr:=GetValidStr3(tStr, sQuest, [' ', #9]);
          tStr:=GetValidStr3(tStr, s30, [' ', #9]);
          if (sMap <> '') and (sMonName <> '') and (sQuest <> '') then begin
            Map:=g_MapManager.FindMap(sMap);
            if Map <> nil then begin
              ArrestStringEx(s1C,'[',']',s34);
              n38:=Str_ToInt(s34,0);
              n3C:=Str_ToInt(s20,0);
              if CompareLStr(s30,'GROUP',length('GROUP')) then boGrouped:=True
              else boGrouped:=False;
              if not Map.CreateQuest(n38,n3C,sMonName,sItem,sQuest,boGrouped) then Result:= -i;
              //nFlag,boFlag,Monster,Item,Quest,boGrouped
            end else Result:= -i;
          end else Result:= -i;
        end;
      end;
      tMapQuestList.Free;
    end;
    QMangeNPC();
    QFunctionNPC();
    RobotNPC();
end;



function TFrmDB.LoadMissionData: Integer;
var
  sFileName: string;
  LoadList: TStringList;
  MemoryStream: TMemoryStream;
  OutLen: Integer;
  OutBuf: PChar;
  I: Integer;
begin
  Result := 0;
  g_sMissionData := '';
  g_sMissionDataMD5 := '';
  g_nMissionDataLen := 0;
  sFileName := g_Config.sEnvirDir + 'MissionDesc.txt'; 
  if MyFileExists(sFileName) then begin
    LoadList := TMsgStringList.Create;
    LoadList.LoadFromFile(sFileName);
    LoadListCall(ExtractFileName(sFileName), LoadList);
    for I := 0 to LoadList.Count - 1 do begin
      LoadList[I] := UserEngine.GetDefiniensConstText(LoadList[I]);
    end;

    MemoryStream := TMemoryStream.Create;
    LoadList.SaveToStream(MemoryStream);

    OutLen := ZIPCompress(MemoryStream.Memory, MemoryStream.Size, 9, OutBuf);
    if OutLen > 0 then begin
      g_nMissionDataLen := OutLen;
      g_sMissionDataMD5 := GetMD5TextByBuffer(OutBuf, OutLen);
      g_sMissionData := EncodeLongBuffer(OutBuf, OutLen);
      FreeMem(OutBuf);
    end;
    MemoryStream.Free;
    LoadList.Free;
  end;
end;

function TFrmDB.LoadMapDesc(): Integer;
var
  sFileName: string;
  LoadList: TStringList;
  MemoryStream: TMemoryStream;
  OutLen: Integer;
  OutBuf: PChar;
begin
  Result := 0;
  g_sMapDescData := '';
  g_sMapDescDataMD5 := '';
  g_nMapDescDataLen := 0;
  sFileName := g_Config.sEnvirDir + 'MapDesc.txt';
  if MyFileExists(sFileName) then begin
    LoadList := TMsgStringList.Create;
    LoadList.LoadFromFile(sFileName);
    LoadListCall(ExtractFileName(sFileName), LoadList);

    MemoryStream := TMemoryStream.Create;
    LoadList.SaveToStream(MemoryStream);
    OutLen := ZIPCompress(MemoryStream.Memory, MemoryStream.Size, 9, OutBuf);
    if OutLen > 0 then begin
      g_nMapDescDataLen := OutLen;
      g_sMapDescDataMD5 := GetMD5TextByBuffer(OutBuf, OutLen);
      g_sMapDescData := EncodeLongBuffer(OutBuf, OutLen);
      FreeMem(OutBuf);
    end;
    MemoryStream.Free;
    LoadList.Free;
  end;
end;


function TFrmDB.LoadMerchant(): Integer;
var
{$IFDEF UseTXT}
  sFileName,sLineText,sScript,sMapName,sX,sY,sName,sFlag,sAppr,sIsCalste,sCanMove,sMoveTime:String;
  tMerchantList:TStringList;
  tMerchantNPC:TMerchant;
  i:Integer;
{$ELSE}
  i:Integer;
  boUse:Boolean;
  tMerchantNPC:TMerchant;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MERCHANT';
{$ENDIF}
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
{$IFDEF UseTXT}
    sFileName:=g_Config.sEnvirDir + 'Merchant.txt';
    if FileExists(sFileName) then begin
      tMerchantList:=TStringList.Create;
      tMerchantList.LoadFromFile(sFileName);
      for i:=0 to tMerchantList.Count -1 do begin
        sLineText:=Trim(tMerchantList.Strings[i]);
        if (sLineText <> '') and (sLineText[1] <> ';') then begin
          sLineText:=GetValidStr3(sLineText, sScript, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sMapName, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sX, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sY, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sName, [' ', #9]);
          if (sName <> '') and (sName[1] = '"') then
            ArrestStringEx(sName,'"','"',sName);
          sLineText:=GetValidStr3(sLineText, sFlag, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sAppr, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sIsCalste, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sCanMove, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sMoveTime, [' ', #9]);

          if (sScript <> '') and (sMapName <> '') and (sAppr <> '') then begin
            tMerchantNPC:=TMerchant.Create;
            tMerchantNPC.m_sScript:=sScript;
            tMerchantNPC.m_sMapName:=sMapName;
            tMerchantNPC.m_nCurrX:=Str_ToInt(sX,0);
            tMerchantNPC.m_nCurrY:=Str_ToInt(sY,0);
            tMerchantNPC.m_sCharName:=sName;
            tMerchantNPC.m_nFlag:=Str_ToInt(sFlag,0);
            tMerchantNPC.m_wAppr:=Str_ToInt(sAppr,0);
            tMerchantNPC.m_dwMoveTime:=Str_ToInt(sMoveTime,0);
            if Str_ToInt(sIsCalste,0) <> 0 then
              tMerchantNPC.m_boCastle:=True;
            if (Str_ToInt(sCanMove,0) <> 0) and (tMerchantNPC.m_dwMoveTime > 0) then
              tMerchantNPC.m_boCanMove:=True;
            UserEngine.AddMerchant(tMerchantNPC); //00487B4D
          end;
        end;
      end;
      tMerchantList.Free;
    end;
    Result:= 1;
{$ELSE}
  try
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boUse                       := GetBoolean(Query,'FLD_ENABLED');
      if boUse then begin
        tMerchantNPC:=TMerchant.Create;

        tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
        tMerchantNPC.m_sMapName     := Query.FieldByName('FLD_MAPNAME').AsString;
        tMerchantNPC.m_nCurrX       := Query.FieldByName('FLD_X').AsInteger;
        tMerchantNPC.m_nCurrY       := Query.FieldByName('FLD_Y').AsInteger;
        tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
        tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
        tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
        tMerchantNPC.m_boCastle     := GetBoolean(Query,'FLD_ISCASTLE');
        tMerchantNPC.m_boCanMove    := GetBoolean(Query,'FLD_CANMOVE');
        tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;
        
        if (tMerchantNPC.m_sScript <> '') and (tMerchantNPC.m_sMapName <> '') then
          UserEngine.AddMerchant(tMerchantNPC)
        else
          tMerchantNPC.Free;
      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
{$ENDIF}
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

//004867F4
function TFrmDB.LoadMonGen(): Integer;
{$IFDEF UseTXT}
  procedure LoadMapGen(MonGenList:TStringList;sFileName:String);
  var
    I: Integer;
    sFilePatchName:String;
    sFileDir:String;
    LoadList:TStringList;
  begin
    sFileDir:=g_Config.sEnvirDir + 'MonGen\';
    if not DirectoryExists(sFileDir) then begin
      CreateDir(sFileDir);
    end;
      
    sFilePatchName:=sFileDir + sFileName;
    if FileExists(sFilePatchName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFilePatchName);
      for I := 0 to LoadList.Count - 1 do begin
        MonGenList.Add(LoadList.Strings[I]);
      end;
      LoadList.Free;
    end;
  end;
var
  sFileName,sLineText,sData:String;
  MonGenInfo:pTMonGenInfo;
  LoadList:TStringList;
  sMapGenFile:String;
  i:Integer;
{$ELSE}
var
  i:Integer;
  boLoads:Boolean;
  MonGenInfo:pTMonGenInfo;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MONGEN ORDER BY FLD_MAPNAME';
  {$ENDIF}
begin
  Result:=0;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    {$IFDEF UseTXT}
    sFileName:=g_Config.sEnvirDir + 'MonGen.txt';
    if FileExists(sFileName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      I:=0;
      while (True) do begin
        if I >= LoadList.Count then break;
        if CompareLStr('loadgen',LoadList.Strings[I],Length('loadgen')) then begin
          sMapGenFile:=GetValidStr3(LoadList.Strings[I], sLineText, [' ', #9]);
          LoadList.Delete(I);
          if sMapGenFile <> '' then begin
            LoadMapGen(LoadList,sMapGenFile);
          end;
        end;
        Inc(I);
      end;
      for i:=0 to LoadList.Count -1 do begin
        sLineText:=LoadList.Strings[i];
        if (sLineText <> '') and (sLineText[1] <> ';') then begin
          New(MonGenInfo);
          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.sMapName:=sData;

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.nX:=Str_ToInt(sData,0);

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.nY:=Str_ToInt(sData,0);

          sLineText:=GetValidStrCap(sLineText, sData, [' ', #9]);
          if (sData <> '') and (sData[1] = '"') then
            ArrestStringEx(sData,'"','"',sData);

          MonGenInfo.sMonName:=sData;

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.nRange:=Str_ToInt(sData,0);

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.nCount:=Str_ToInt(sData,0);

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.dwZenTime:=Str_ToInt(sData, -1) * 60 * 1000;

          sLineText:=GetValidStr3(sLineText, sData, [' ', #9]);
          MonGenInfo.nMissionGenRate:=Str_ToInt(sData,0); // 1-100
          if (MonGenInfo.sMapName <> '') and
             (MonGenInfo.sMonName <> '') and
             (MonGenInfo.dwZenTime <> 0) and
             (g_MapManager.GetMapInfo(nServerIndex,MonGenInfo.sMapName) <> nil) then begin


            MonGenInfo.Envir:=g_MapManager.FindMap(MonGenInfo.sMapName);
            MonGenInfo.nRace:=UserEngine.GetMonRace(MonGenInfo.sMonName);
            if (MonGenInfo.Envir <> nil) and (MonGenInfo.nRace > -1) then begin
              MonGenInfo.CertList:=TList.Create;
              UserEngine.m_MonGenList.Add(MonGenInfo);
            end else begin
              Dispose(MonGenInfo);
            end;
          end else
            DisPose(MonGenInfo);
        end;//00486B5B
      end;//00486B67
      //00486B67
      New(MonGenInfo);
      MonGenInfo.sMapName:='';
      MonGenInfo.sMonName:='';
      MonGenInfo.CertList:=TList.Create;
      MonGenInfo.Envir:=nil;
      UserEngine.m_MonGenList.Add(MonGenInfo);

      LoadList.Free;
      Result:=1;
    end;      
    {$ELSE}
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -1;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boLoads                 := GetBoolean(Query,'FLD_LOAD');
      if boLoads then begin
        New(MonGenInfo);
        MonGenInfo.sMapName   := Trim(Query.FieldByName('FLD_MAPNAME').AsString);
        MonGenInfo.nX         := Query.FieldByName('FLD_X').AsInteger;
        MonGenInfo.nY         := Query.FieldByName('FLD_Y').AsInteger;
        MonGenInfo.sMonName   := Trim(Query.FieldByName('FLD_MONNAME').AsString);
        MonGenInfo.nRange     := Query.FieldByName('FLD_RANGE').AsInteger;
        MonGenInfo.nCount     := Query.FieldByName('FLD_COUNT').AsInteger;
        MonGenInfo.dwZenTime  := Query.FieldByName('FLD_GENTIME').AsInteger * 60 * 1000;
        MonGenInfo.nMissionGenRate  := Query.FieldByName('FLD_SMALLGENRATE').AsInteger;

        if (MonGenInfo.sMapName <> '') and
           (MonGenInfo.sMonName <> '') and
           (MonGenInfo.dwZenTime <> 0) and
           (g_MapManager.GetMapInfo(nServerIndex,MonGenInfo.sMapName) <> nil) then begin

          MonGenInfo.CertList:=TList.Create;
          MonGenInfo.Envir:=g_MapManager.FindMap(MonGenInfo.sMapName);
          if MonGenInfo.Envir <> nil then begin
            UserEngine.m_MonGenList.Add(MonGenInfo);
          end else begin
            Dispose(MonGenInfo);
          end;
        end;
      end;

      Result := 1;
      Query.Next;
    end;
    Query.Close;
  {$ENDIF}
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;


//00485E04
function TFrmDB.LoadMonsterDB():Integer;
var
  i:Integer;
  Monster:pTMonInfo;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MONSTER';
begin
  Result:=0;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    for I := 0 to UserEngine.MonsterList.Count - 1 do begin
      Dispose(pTMonInfo(UserEngine.MonsterList.Items[I]));
    end;
    UserEngine.MonsterList.Clear;
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -1;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      New(Monster);
      Monster.ItemList     := TList.Create;
      Monster.sName        := Trim(Query.FieldByName('FLD_NAME').AsString);
      Monster.btRace       := Query.FieldByName('FLD_RACE').AsInteger;     //¸÷·¹ÀÌ½º
      Monster.btRaceImg    := Query.FieldByName('FLD_RACEIMG').AsInteger;
      Monster.wAppr        := Query.FieldByName('FLD_IMGINDEX').AsInteger;
      Monster.wLevel       := Query.FieldByName('FLD_LV').AsInteger;
      Monster.btLifeAttrib := Query.FieldByName('FLD_UNDEAD').AsInteger;
      Monster.wCoolEye     := Query.FieldByName('FLD_COOLEYE').AsInteger;
      Monster.dwExp        := Query.FieldByName('FLD_EXP').AsInteger;

      if Monster.btRace in [110,111] then begin
        Monster.wHP          := Query.FieldByName('FLD_HP').AsInteger;
      end else begin
        Monster.wHP          := ROUND(Query.FieldByName('FLD_HP').AsInteger * (g_Config.nMonsterPowerRate / 10));
      end;

      Monster.wMP          := ROUND(Query.FieldByName('FLD_MP').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wAC          := ROUND(Query.FieldByName('FLD_AC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMAC         := ROUND(Query.FieldByName('FLD_MAC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wDC          := ROUND(Query.FieldByName('FLD_DC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMaxDC       := ROUND(Query.FieldByName('FLD_DCMAX').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wMC          := ROUND(Query.FieldByName('FLD_MC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wSC          := ROUND(Query.FieldByName('FLD_SC').AsInteger * (g_Config.nMonsterPowerRate / 10));
      Monster.wSpeed       := Query.FieldByName('FLD_AGILITY').AsInteger;
      Monster.wHitPoint    := Query.FieldByName('FLD_ACCURATE').AsInteger;
      Monster.wWalkSpeed   := _MAX(200,Query.FieldByName('FLD_WALK_SPD').AsInteger);
      Monster.wWalkStep    := _MAX(1,Query.FieldByName('FLD_WALKSTEP').AsInteger);
      Monster.wWalkWait    := Query.FieldByName('FLD_WALKWAIT').AsInteger;
      Monster.wAttackSpeed := Query.FieldByName('FLD_ATTACK_SPD').AsInteger;
      Monster.wAntiPush    := Query.FieldByName('FLD_ATTACK_SPD').AsInteger;
      Monster.boAggro      := Query.FieldByName('FLD_AGGRO').AsBoolean;
      Monster.boTame       := Query.FieldByName('FLD_TAME').AsBoolean;
      Monster.NoPoison     := Query.FieldByName('FLD_NOPOISON').AsBoolean;
      if Monster.wWalkSpeed < 200 then Monster.wWalkSpeed:= 200;
      if Monster.wAttackSpeed < 200 then Monster.wAttackSpeed:= 200;
      Monster.ItemList:=nil;
      LoadMonitems(Monster.sName,Monster.ItemList);

      UserEngine.MonsterList.Add(Monster);
      Result := 1;
      Query.Next;
    end;
    Query.Close;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadMonitems(MonName:String;var ItemList:TList):Integer;//00485ABC
var                             
  I: Integer;
  s24:String;
  LoadList:TStringList;
  MonItem:pTMonItem;
  s28,s2C,s30:String;
  n18,n1C,n20:Integer;
// Ôö¼ÓÖ®ºóÐÞ¸ÄÖÐÎÄÏµÍ³²»ÄÜ¼ÓÔØº«ÎÄ
function MyFileExists(sFile: string):Boolean;
  var
    hFile: THandle;
  begin
    hFile := FileOpen(sFile,GENERIC_READ);
    Result := hFile <> INVALID_HANDLE_VALUE;
    if Result then FileClose(hFile);
  end;
// Ôö¼ÓÖ®Ç°ÐÞ¸ÄÖÐÎÄÏµÍ³²»ÄÜ¼ÓÔØº«ÎÄ
begin
  Result:=0;
  s24:=g_Config.sEnvirDir + 'MonItems\' + MonName + '.txt';
  if MyFileExists(s24) then begin//Ö®Ç°ÐÞ¸Ä²»ÄÜ¼ÓÔØº«ÎÄ£¬Ö®ºóÊÇÔ­ÎÄ //if FileExists(s24) then begin
    if ItemList <> nil then begin
      for I := 0 to Itemlist.Count - 1 do begin
        DisPose(pTMonItem(ItemList.Items[I]));
      end;
      ItemList.Clear;
    end; //00485B81
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(s24);
    for I := 0 to LoadList.Count - 1 do begin
      s28:=LoadList.Strings[I];
      if (s28 <> '') and (s28[1] <> ';') then begin
        s28:=GetValidStr3(s28,s30,[' ','/',#9]);
        n18:=Str_ToInt(s30,-1);
        s28:=GetValidStr3(s28,s30,[' ','/',#9]);
        n1C:=Str_ToInt(s30,-1);
        s28:=GetValidStr3(s28,s30,[' ',#9]);   // "  " À¸·Î ¹­ÀÎ ÀÌ¸§ Çã¿ë
        if s30 <> '' then begin
          if s30[1] = '"' then
            ArrestStringEx(s30,'"','"',s30);
        end;
        s2C:=s30;       //¾ÆÀÌÅÛ ÀÌ¸§
        s28:=GetValidStr3(s28,s30,[' ',#9]);
        n20:=Str_ToInt(s30,1);
        if (n18 > 0) and (n1C > 0) and (s2C <> '') then begin
          if ItemList = nil then ItemList:=TList.Create;
          New(MonItem);
          MonItem.SelPoint:=n18 -1;      //¾ÆÀÌÅÛµå·Ó
          MonItem.MaxPoint:=n1C;
          MonItem.ItemName:=s2C;
          MonItem.Count:=n20;
          ItemList.Add(MonItem);
          Inc(Result);
        end;
      end;
    end;
    LoadList.Free;
  end;
    
end;
//00488178
function TFrmDB.LoadNpcs(): Integer;
var
  NPC:TNormNpc;
  i:Integer;
{$IFDEF UseTXT}
  sFileName,s18,s20,s24,s28,s2C,s30,s34,s38:String;
  LoadList:TStringList;
{$ELSE}
  nType:Integer;
  boUse:Boolean;
ResourceString
  sSQLString = 'SELECT * FROM TBL_NPC';
{$ENDIF}
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
{$IFDEF UseTXT}
    sFileName:=g_Config.sEnvirDir + 'Npcs.txt';
    if FileExists(sFileName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for i:=0 to LoadList.Count -1 do begin
        s18:=Trim(LoadList.Strings[i]);
        if (s18 <> '') and (s18[1] <> ';') then begin
          s18:=GetValidStrCap(s18, s20, [' ', #9]);
          if (s20 <> '') and (s20[1] = '"') then
            ArrestStringEx(s20,'"','"',s20);

          s18:=GetValidStr3(s18, s24, [' ', #9]);
          s18:=GetValidStr3(s18, s28, [' ', #9]);
          s18:=GetValidStr3(s18, s2C, [' ', #9]);
          s18:=GetValidStr3(s18, s30, [' ', #9]);
          s18:=GetValidStr3(s18, s34, [' ', #9]);
          s18:=GetValidStr3(s18, s38, [' ', #9]);
          if (s20 <> '') and (s28 <> '') and (s38 <> '') then begin
            NPC:=nil;
            case Str_ToInt(s24,0) of
              0: NPC:=TMerchant.Create;
              1: NPC:=TGuildOfficial.Create;
              2: NPC:=TCastleOfficial.Create;
            end;
            if NPC <> nil then begin
              NPC.m_sMapName:=s28;
              NPC.m_nCurrX:=Str_ToInt(s2C,0);
              NPC.m_nCurrY:=Str_ToInt(s30,0);
              NPC.m_sCharName:=s20;
              NPC.m_nFlag:=Str_ToInt(s34,0);
              NPC.m_wAppr:=Str_ToInt(s38,0);
              NPC.m_NpcType := n_Norm;
              UserEngine.QuestNPCList.Add(NPC); //0048847D
            end;
          end;
        end;
      end;
      LoadList.Free;
    end;
    Result:= 1;
{$ELSE}
  try
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    for i:=0 to Query.RecordCount -1 do begin
      boUse                       := GetBoolean(Query,'FLD_ENABLED');
      if boUse then begin
        NPC:=nil;

        nType := Query.FieldByName('FLD_TYPE').AsInteger;
        case nType of
          0: NPC:=TMerchant.Create;
          1: NPC:=TGuildOfficial.Create;
          2: NPC:=TCastleOfficial.Create;
        end;
        if NPC <> nil then begin
          NPC.m_sMapName            := Query.FieldByName('FLD_MAPNAME').AsString;
          NPC.m_nCurrX              := Query.FieldByName('FLD_X').AsInteger;
          NPC.m_nCurrY              := Query.FieldByName('FLD_Y').AsInteger;
          NPC.m_sCharName           := Query.FieldByName('FLD_NAME').AsString;
          NPC.m_nFlag               := Query.FieldByName('FLD_FLAG').AsInteger;
          NPC.m_wAppr               := Query.FieldByName('FLD_APPEARANCE').AsInteger;
          UserEngine.QuestNPCList.Add(NPC);
        end;
      end;

      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  {$ENDIF}
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

{
function TFrmDB.LoadQuestList(): Integer;    //Äù½ºÆ® Å×½ºÆ®
var
  Quest:TQuestInfo;
  i:Integer;
ResourceString
  sSQLString = 'SELECT * FROM TBL_QUEST';
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;
    UserEngine.QuestInfoList.Clear;
    for i:=0 to Query.RecordCount -1 do begin
      Quest := nil;
      Quest := TQuestInfo.Create;
      if Quest <> nil then begin
        Quest.Index       := Query.FieldByName('FLD_ID').AsInteger;
        Quest.Name        := Trim(Query.FieldByName('FLD_NAME').AsString);
        Quest.Group       := Trim(Query.FieldByName('FLD_GROUP').AsString);
        Quest.QuestType   := Query.FieldByName('FLD_TYPE').AsInteger;
        Quest.FileName    := Trim(Query.FieldByName('FLD_FILENAME').AsString);
        Quest.GotoMessage := Trim(Query.FieldByName('FLD_GOTOSAY').AsString);
        Quest.KillMessage := Trim(Query.FieldByName('FLD_KILLSAY').AsString);
        Quest.ItemMessage := Trim(Query.FieldByName('FLD_ITEMSAY').AsString);
        Quest.FlagMessage := Trim(Query.FieldByName('FLD_FLAGSAY').AsString);
        Quest.RequiredMinLevel := Query.FieldByName('FLD_MINLEVEL').AsInteger;
        Quest.RequiredMaxLevel := Query.FieldByName('FLD_MAXLEVEL').AsInteger;
        Quest.RequiredQuest := Query.FieldByName('FLD_REQUEST').AsInteger;
        Quest.RequiredClass := Query.FieldByName('FLD_CLASS').AsInteger;
        UserEngine.QuestInfoList.Add(Quest);
      end;
      Result := 1;
      Query.Next;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;      }

//00489840
function TFrmDB.LoadQuestDiary(): Integer;
  function sub_48978C(nIndex:Integer):String;
  begin
    if nIndex >= 1000 then begin
      Result:=IntToStr(nIndex);
      exit;
    end;
    if nIndex >= 100 then begin
      Result:=IntToStr(nIndex) + '0';
      exit;
    end;
    Result:=IntToStr(nIndex) + '00';
  end;
var
  i,ii:Integer;
  QDDinfoList:TList;
  QDDinfo:pTQDDinfo;
  s14,s18,s1C,s20:String;
  bo2D:Boolean;
  nC:Integer;
  LoadList:TStringList;
begin
    Result:=1;
    for i:=0 to QuestDiaryList.Count -1 do begin
       QDDinfoList:=QuestDiaryList.Items[i];
       for ii:=0 to QDDinfoList.Count -1 do begin
         QDDinfo:=QDDinfoList.Items[ii];
         QDDinfo.sList.Free;
         Dispose(QDDinfo);
       end;
       QDDinfoList.Free;
    end;
    QuestDiaryList.Clear;
    bo2D:=False;
    nC:=1;
    while (True) do begin
      QDDinfoList:=nil;
      s14:='QuestDiary\' + sub_48978C(nC) + '.txt';
      if FileExists(s14) then begin
        s18:='';
        QDDinfo:=nil;
        LoadList:=TStringList.Create;
        LoadList.LoadFromFile(s14);
        for i:=0 to LoadList.Count -1 do begin
          s1C:=LoadList.Strings[i];
          if (s1C <> '') and (s1C[1] <> ';') then begin
            if (s1C[1] = '[') and (length(s1C) > 2) then begin
              if s18 = '' then begin
                ArrestStringEx(s1C,'[',']',s18);
                QDDinfoList:=TList.Create;
                New(QDDinfo);
                QDDinfo.n00:=nC;
                QDDinfo.s04:=s18;
                QDDinfo.sList:=TStringList.Create;
                QDDinfoList.Add(QDDinfo);
                bo2D:=True;
              end else begin
                if s1C[1] <> '@' then begin
                  s1C:=GetValidStr3(s1C,s20,[' ',#9]);
                  ArrestStringEx(s20,'[',']',s20);
                  New(QDDinfo);
                  QDDinfo.n00:=Str_ToInt(s20,0);
                  QDDinfo.s04:=s1C;
                  QDDinfo.sList:=TStringList.Create;
                  QDDinfoList.Add(QDDinfo);
                  bo2D:=True;
                end else bo2D:=False;
              end;
            end else begin //00489AFD
              if bo2D then QDDinfo.sList.Add(s1C);
            end;
          end;//00489B11
        end;
        LoadList.Free;
      end;//00489B25
      if QDDinfoList <> nil then QuestDiaryList.Add(QDDinfoList)
      else QuestDiaryList.Add(nil);
      Inc(nC);
      if nC >= 105 then break;
    end;

end;
//00488EF0
function TFrmDB.LoadStartPoint(): Integer;
var
  i:Integer;
  StartPoint:pTStartPoint;
{$IFDEF UseTXT}
  sFileName,sLineText,sMapName,sX,sY,sSize:String;
  LoadList:TStringList;
{$ELSE}
  sMap:String;
ResourceString
  sSQLString = 'SELECT * FROM TBL_STARTPOINT';
  {$ENDIF}
begin
  Result:= -1;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
{$IFDEF UseTXT}
  sFileName:=g_Config.sEnvirDir + 'StartPoint.txt';
  if FileExists(sFileName) then begin
    g_StartPoint.Lock;
    try
      for I := 0 to g_StartPoint.Count - 1 do begin
        Dispose(pTStartPoint(g_StartPoint.Items[I]));
      end;
      g_StartPoint.Clear;
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for i:=0 to LoadList.Count -1 do begin
        sLineText:=Trim(LoadList.Strings[i]);
        if (sLineText <> '') and (sLineText[1] <> ';') then begin
          sLineText:=GetValidStr3(sLineText, sMapName, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sX, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sY, [' ', #9]);
          sLineText:=GetValidStr3(sLineText, sSize, [' ', #9]);
          if (sMapName <> '')  and (sX <> '') and (sY <> '') and (sSize <> '')then begin
            New(StartPoint);
            StartPoint.sMapName := sMapName;
            StartPoint.nX       := Str_ToInt(sX,0);
            StartPoint.nY       := Str_ToInt(sY,0);
            StartPoint.Envir    := g_MapManager.FindMap(sMapName);
            StartPoint.nSize    := Str_ToInt(sSize,0);
            g_StartPoint.Add(StartPoint);
            Result:=1;
          end;
        end;
      end;
      LoadList.Free;
    finally
      g_StartPoint.UnLock;
    end;
  end;
{$ELSE}
    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    except
      Result:= -2;
    end;

    try
      g_StartPoint.Lock;
      for I := 0 to g_StartPoint.Count - 1 do begin
        Dispose(pTStartPoint(g_StartPoint.Items[I]));
      end;
      g_StartPoint.Clear;

      for i:=0 to Query.RecordCount -1 do begin
        sMap                          := Query.FieldByName('FLD_MAPNAME').AsString;
        if (sMap <> '') then begin
          New(StartPoint);
          StartPoint.sMapName         := sMap;
          StartPoint.nX               := Query.FieldByName('FLD_X').AsInteger;
          StartPoint.nY               := Query.FieldByName('FLD_Y').AsInteger;
          StartPoint.nSize            := Query.FieldByName('FLD_SIZE').AsInteger;
          StartPoint.Envir            := g_MapManager.FindMap(sMap);
          g_StartPoint.Add(StartPoint);
          Result:=1;
        end;
        Query.Next;
      end;
    finally
      g_StartPoint.UnLock;
    end;
    Query.Close;
  {$ENDIF}
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
//00489240
function TFrmDB.LoadUnbindList(): Integer;
var
  sFileName,tStr,sData,s20:String;
  LoadList:TStringList;
  i:Integer;
  n10:Integer;
begin
    Result:=0;
    sFileName:=g_Config.sEnvirDir + 'UnbindList.txt';
    if FileExists(sFileName) then begin
      LoadList:=TStringList.Create;
      LoadList.LoadFromFile(sFileName);
      for i:=0 to LoadList.Count -1 do begin
        tStr:=LoadList.Strings[i];
        if (tStr <> '') and (tStr[1] <> ';') then begin
          tStr:=GetValidStr3(tStr, sData, [' ', #9]);
          tStr:=GetValidStrCap(tStr, s20, [' ', #9]);
          if (s20 <> '') and (s20[1] = '"') then
            ArrestStringEx(s20,'"','"',s20);

          n10:=Str_ToInt(sData,0);
          if n10 > 0 then g_UnbindList.AddObject(s20,TObject(n10))
          else begin
            Result:=-i;
            break;
          end;
        end;
      end;
      LoadList.Free;
    end;
end;

function TFrmDB.LoadNpcScript(NPC: TNormNpc; sPatch,
  sScritpName: String): Integer; //0048C4D8
begin
  if sPatch = '' then sPatch:=sNpc_def;
  Result:=LoadScriptFile(NPC, sPatch, sScritpName, False, True);
end;

function TFrmDB.LoadScriptFile(NPC: TNormNpc; sPatch, sScritpName: String;
  boFlag, boQuest: Boolean): Integer; //0048B684
var
  nQuestIdx,I,n1C,n20,n24,nItemType,nPriceRate: Integer;
  n6C,n70:Integer;
  sScritpFileName,s30,s34,s38,s3C,s40,s44,s48,s4C,s50,s52:String;
  LoadList:TStringList;
  DefineList:TList;
  s54,s58,s5C,sLabel:String;
  DefineInfo:pTDefineInfo;
  bo8D:Boolean;
  Script:pTScript;
  SayingRecord:pTSayingRecord;
  SayingProcedure:pTSayingProcedure;
  QuestConditionInfo:pTQuestConditionInfo;
  QuestActionInfo:pTQuestActionInfo;
  Goods:pTGoods;
  function LoadCallScript(sFileName,sLabel:String;List:TStringList):Boolean; //00489BD4
  var
    I: Integer;
    LoadStrList:TStringList;
    bo1D:Boolean;
    s18:String;
  begin
    Result:=False;
    if FileExists(sFileName) then begin
      LoadStrList:=TStringList.Create;
      LoadStrList.LoadFromFile(sFileName);
      DeCodeStringList(LoadStrList);
      sLabel:='[' + sLabel + ']';
      bo1D:=False;
      for I := 0 to LoadStrList.Count - 1 do begin
        s18:=Trim(LoadStrList.Strings[i]);
        if s18 <> '' then begin
          if not bo1D then begin
            if (s18[1] = '[') and (CompareText(s18,sLabel) = 0) then begin
              bo1D:=True;
              List.Add(s18);
            end;              
          end else begin //00489CBF
            if s18[1] <> '{'  then begin
              if s18[1] = '}'  then begin
                bo1D:=False;
                Result:=True;
                break;
              end else begin  //00489CD9
                List.Add(s18);
              end;
            end;
          end;
        end; //00489CE4 if s18 <> '' then begin
      end; // for I := 0 to LoadStrList.Count - 1 do begin
      LoadStrList.Free;
    end;
      
  end;
  procedure LoadScriptcall(LoadList:TStringList); //0048B138
  var
    I: Integer;
    s14,s18,s1C,s20,s34:String;
  begin
    for I := 0 to LoadList.Count - 1 do begin
      s14:=Trim(LoadList.Strings[i]);
      if (s14 <> '') and (s14[1] = '#') and (CompareLStr(s14,'#CALL',length('#CALL'))) then begin
        s14:=ArrestStringEx(s14,'[',']',s1C);
        s20:=Trim(s1C);
        s18:=Trim(s14);
        s34:=g_Config.sEnvirDir + 'QuestDiary\' + s20;
        if LoadCallScript(s34,s18,LoadList) then begin
          LoadList.Strings[i]:='#ACT';
          LoadList.Insert(i + 1,'goto ' + s18);
        end else begin
          MainOutMessage('script error, load fail: ' + s20 + s18);
        end;
      end;
    end;
  end;

  function LoadDefineInfo(LoadList:TStringList;List:TList):String; //0048B35C
  var
    I: Integer;
    s14,s28,s1C,s20,s24:String;
    DefineInfo:pTDefineInfo;
    LoadStrList:TStringList;
  begin
    for I := 0 to LoadList.Count - 1 do begin
      s14:=Trim(LoadList.Strings[i]);
      if (s14 <> '') and (s14[1] = '#') then begin
        if CompareLStr(s14,'#SETHOME',length('#SETHOME')) then begin
          Result:=Trim(GetValidStr3(s14,s1C,[' ',#9]));
          LoadList.Strings[i]:='';
        end;
        if CompareLStr(s14,'#DEFINE',length('#DEFINE')) then begin
          s14:=(GetValidStr3(s14,s1C,[' ',#9]));
          s14:=(GetValidStr3(s14,s20,[' ',#9]));
          s14:=(GetValidStr3(s14,s24,[' ',#9]));
          New(DefineInfo);
          DefineInfo.sName:=UpperCase(s20);
          DefineInfo.sText:=s24;
          List.Add(DefineInfo);
          LoadList.Strings[i]:='';
        end; //0048B505
        if CompareLStr(s14,'#INCLUDE',length('#INCLUDE')) then begin
          s28:=Trim(GetValidStr3(s14,s1C,[' ',#9]));
          s28:=g_Config.sEnvirDir + 'Defines\' + s28;
          if FileExists(s28) then begin
            LoadStrList:=TStringList.Create;
            LoadStrList.LoadFromFile(s28);
            Result:=LoadDefineInfo(LoadStrList,List);
            LoadStrList.Free;
          end else begin
            MainOutMessage('script error, load fail: ' + s28);
          end;
          LoadList.Strings[i]:='';
        end;
      end;
    end;
  end;
  function MakeNewScript():pTScript; //00489D74     //Äù½ºÆ®¹®
  var
    ScriptInfo:pTScript;
  begin
    New(ScriptInfo);
    ScriptInfo.boQuest:=False;
    FillChar(ScriptInfo.QuestInfos,SizeOf(TQuestInfos),#0);
    nQuestIdx:=0;
    ScriptInfo.RecordList:=TList.Create;
    NPC.m_ScriptList.Add(ScriptInfo);
    Result:=ScriptInfo;
  end;
  function QuestCondition(sText:String;QuestConditionInfo:pTQuestConditionInfo):Boolean; //00489DDC
  var
    sCmd,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6:String;
    nCMDCode:Integer;
  Label L001;
  begin
    Result:=False;
    sText:=GetValidStrCap(sText,sCmd,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam1,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam2,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam3,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam4,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam5,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam6,[' ',#9]);
    sCmd:=UpperCase(sCmd);
    sCmd := QuestConditionInfo.Script.Cmd(sCmd);
    nCMDCode:=0;
    if sCmd = sCHECK then begin
      nCMDCode:=nCHECK;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;
    if sCmd = sCHECKOPEN then begin
      nCMDCode:=nCHECKOPEN;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;

    if sCmd = sCHECKUNIT then begin
      nCMDCode:=nCHECKUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
      Goto L001;
    end;
    if sCmd = sCHECKPKPOINT then begin
      nCMDCode:=nCHECKPKPOINT;
      Goto L001;
    end;
    if sCmd = sCHECKGOLD then begin
      nCMDCode:=nCHECKGOLD;
      Goto L001;
    end;
    if sCmd = sCHECKLEVEL then begin
      nCMDCode:=nCHECKLEVEL;
      Goto L001;
    end;
    if sCmd = sCHECKJOB then begin
      nCMDCode:=nCHECKJOB;
      Goto L001;
    end;
    if sCmd = sCHECKHEROJOB then begin
      nCMDCode := nCHECKHEROJOB;
      goto L001;
    end;
    if sCmd = sRANDOM then begin
      nCMDCode:=nRANDOM;
      Goto L001;
    end;
    if sCmd = sCHECKITEM then begin
      nCMDCode:=nCHECKITEM;
      Goto L001;
    end;
    if sCmd = sGENDER then begin
      nCMDCode:=nGENDER;
      Goto L001;
    end;
    if sCmd = sCHECKBAGGAGE then begin
      nCMDCode:=nCHECKBAGGAGE;
      Goto L001;
    end;

    if sCmd = sCHECKNAMELIST then begin      //Ã¼Å©
      nCMDCode:=nCHECKNAMELIST;
      Goto L001;
    end;

    if sCmd = sCHECKCOUNTLIST then begin      //°¹¼ö ¸ð¾Æ¿À±â
      nCMDCode := nCHECKCOUNTLIST;
      goto L001;
    end;

    if sCmd = sUNDERWAR then begin      //°ø¼ºÁßÀÎÁö
      nCMDCode := nUNDERWAR;
      goto L001;
    end;

    if sCmd = sSC_ATTACKWARGUILD then begin
      nCMDCode := nSC_ATTACKWARGUILD;
      goto L001;
    end;

    if sCmd = sSC_HASGUILD then begin
      nCMDCode:=nSC_HASGUILD;
      Goto L001;
    end;

    if sCmd = sSC_ISGUILDMASTER then begin
      nCMDCode:=nSC_ISGUILDMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEMASTER then begin
      nCMDCode:=nSC_CHECKCASTLEMASTER;
      Goto L001;
    end;
    if sCmd = sSC_CASTLEMASTERKING then begin
      nCMDCode:=nSC_CASTLEMASTERKING;
      Goto L001;
    end;

    if sCmd = sSC_ISNEWHUMAN then begin
      nCMDCode:=nSC_ISNEWHUMAN;
      Goto L001;
    end;
    if sCmd = sSC_ISNEWHERO then begin
      nCMDCode := nSC_ISNEWHERO;
      goto L001;
    end;
    if sCmd = sSC_CHECKGAMEGOLD then begin
      nCMDCode:=nSC_CHECKGAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGAMEPOINT then begin
      nCMDCode:=nSC_CHECKGAMEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKNAMELISTPOSITION then begin
      nCMDCode:=nSC_CHECKNAMELISTPOSITION;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGUILDLIST then begin
      nCMDCode:=nSC_CHECKGUILDLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKRENEWLEVEL then begin
      nCMDCode:=nSC_CHECKRENEWLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSLAVELEVEL then begin
      nCMDCode:=nSC_CHECKSLAVELEVEL;
      Goto L001;
    end;

    if sCmd = sSC_MASTERUSEEXP then begin  //»çÁ¦ °æÄ¡
      nCMDCode:=nSC_MASTERUSEEXP;
      Goto L001;
    end;


    if sCmd = sSC_CHECKSLAVENAME then begin
      nCMDCode:=nSC_CHECKSLAVENAME;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPCPOINT then begin
      nCMDCode:=nSC_CHECKPCPOINT;
      Goto L001;
    end;
    if sCmd = sSC_HAVEHERO then begin
      nCMDCode := nSC_HAVEHERO;
      goto L001;
    end;
    if sCmd = sSC_CHECKONLINE then begin
      nCMDCode := nSC_CHECKONLINE;
      goto L001;
    end;

    if sCmd = sSC_CHECKOFGUILD then begin
      nCMDCode:=nSC_CHECKOFGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKOFGUILDCOUNT then begin  //ÃÊº¸¹®ÆÄ
      nCMDCode:=nSC_CHECKOFGUILDCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKPAYMENT then begin
      nCMDCode:=nSC_CHECKPAYMENT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKUSEITEM then begin
      nCMDCode:=nSC_CHECKUSEITEM;
      Goto L001;
    end;
    if sCmd = sSC_CHECKBAGSIZE then begin
      nCMDCode:=nSC_CHECKBAGSIZE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKLISTCOUNT then begin
      nCMDCode:=nSC_CHECKLISTCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKDC then begin
      nCMDCode:=nSC_CHECKDC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMC then begin
      nCMDCode:=nSC_CHECKMC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSC then begin
      nCMDCode:=nSC_CHECKSC;
      Goto L001;
    end;
    if sCmd = sSC_CHECKHP then begin
      nCMDCode:=nSC_CHECKHP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMP then begin
      nCMDCode:=nSC_CHECKMP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKITEMTYPE then begin
      nCMDCode:=nSC_CHECKITEMTYPE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKEXP then begin
      nCMDCode:=nSC_CHECKEXP;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEGOLD then begin
      nCMDCode:=nSC_CHECKCASTLEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_PASSWORDERRORCOUNT then begin
      nCMDCode:=nSC_PASSWORDERRORCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_ISLOCKPASSWORD then begin
      nCMDCode:=nSC_ISLOCKPASSWORD;
      Goto L001;
    end;
    if sCmd = sSC_ISLOCKSTORAGE then begin      //Ã¢°í¾ÏÈ£
      nCMDCode:=nSC_ISLOCKSTORAGE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGUILDMODE then begin
      nCMDCode:=nSC_CHECKGUILDMODE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKBUILDPOINT then begin
      nCMDCode:=nSC_CHECKBUILDPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKAURAEPOINT then begin
      nCMDCode:=nSC_CHECKAURAEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSTABILITYPOINT then begin
      nCMDCode:=nSC_CHECKSTABILITYPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKFLOURISHPOINT then begin
      nCMDCode:=nSC_CHECKFLOURISHPOINT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKRANGEMONCOUNT then begin
      nCMDCode:=nSC_CHECKRANGEMONCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKITEMADDVALUE then begin
      nCMDCode:=nSC_CHECKITEMADDVALUE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKINMAPRANGE then begin
      nCMDCode:=nSC_CHECKINMAPRANGE;
      Goto L001;
    end;
    if sCmd = sSC_CASTLECHANGEDAY then begin
      nCMDCode:=nSC_CASTLECHANGEDAY;
      Goto L001;
    end;
    if sCmd = sSC_CASTLEWARDAY then begin
      nCMDCode:=nSC_CASTLEWARDAY;
      Goto L001;
    end;
    if sCmd = sSC_ONLINELONGMIN then begin
      nCMDCode:=nSC_ONLINELONGMIN;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGUILDCHIEFITEMCOUNT then begin
      nCMDCode:=nSC_CHECKGUILDCHIEFITEMCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKNAMEDATELIST then begin
      nCMDCode:=nSC_CHECKNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAPHUMANCOUNT then begin
      nCMDCode:=nSC_CHECKMAPHUMANCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAPMONCOUNT then begin
      nCMDCode:=nSC_CHECKMAPMONCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_CHECKVAR then begin
      nCMDCode:=nSC_CHECKVAR;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSERVERNAME then begin
      nCMDCode:=nSC_CHECKSERVERNAME;
      Goto L001;
    end;

    if sCmd = sSC_ISATTACKGUILD then begin
      nCMDCode:=nSC_ISATTACKGUILD;
      Goto L001;
    end;
    if sCmd = sSC_ISDEFENSEGUILD then begin
      nCMDCode:=nSC_ISDEFENSEGUILD;
      Goto L001;
    end;

    if sCmd = sSC_DEFENSEWARGUILD then begin
      nCMDCode:=nSC_DEFENSEWARGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEAREA then begin
      nCMDCode:=nSC_CHECKCASTLEAREA;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLERECALL then begin
      nCMDCode:=nSC_CHECKCASTLERECALL;
      Goto L001;
    end;

    if sCmd = sSC_ISDEFENSEALLYGUILD then begin
      nCMDCode:=nSC_ISDEFENSEALLYGUILD;
      Goto L001;
    end;

    if sCmd = sSC_ISCASTLEGUILD then begin
      nCMDCode:=nSC_ISCASTLEGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEGUILD then begin
      nCMDCode:=nSC_CHECKCASTLEGUILD;
      Goto L001;
    end;
    if sCmd = sSC_CHECKCASTLEKING then begin
      nCMDCode:=nSC_CHECKCASTLEKING;
      Goto L001;
    end;

    if sCmd = sSC_CHECKCASTLEDOOR then begin
      nCMDCode:=nSC_CHECKCASTLEDOOR;
      Goto L001;
    end;

    if sCmd = sSC_ISSYSOP then begin
      nCMDCode:=nSC_ISSYSOP;
      Goto L001;
    end;
    if sCmd = sSC_ISADMIN then begin
      nCMDCode:=nSC_ISADMIN;
      Goto L001;
    end;

    if sCmd = sSC_CHECKGROUPCOUNT then begin    //±×·ì¿ø ÀÎ¿ø¼ö Ã¼Å©
      nCMDCode:=nSC_CHECKGROUPCOUNT;
      Goto L001;
    end;



    if sCmd = sCHECKACCOUNTLIST then begin
      nCMDCode:=nCHECKACCOUNTLIST;
      Goto L001;
    end;
    if sCmd = sCHECKIPLIST then begin
      nCMDCode:=nCHECKIPLIST;
      Goto L001;
    end;
    if sCmd = sCHECKBBCOUNT then begin
      nCMDCode:=nCHECKBBCOUNT;
      Goto L001;
    end;
    
    if sCmd = sDAYTIME then begin
      nCMDCode:=nDAYTIME;
      Goto L001;
    end;
    if sCmd = sCHECKITEMW then begin
      nCMDCode:=nCHECKITEMW;
      Goto L001;
    end;

    if sCmd = sISTAKEITEM then begin
      nCMDCode:=nISTAKEITEM;
      Goto L001;
    end;
    if sCmd = sCHECKDURA then begin
      nCMDCode:=nCHECKDURA;
      Goto L001;
    end;
    if sCmd = sCHECKDURAEVA then begin
      nCMDCode:=nCHECKDURAEVA;
      Goto L001;
    end;
    if sCmd = sDAYOFWEEK then begin
      nCMDCode:=nDAYOFWEEK;
      Goto L001;
    end;
    if sCmd = sHOUR then begin
      nCMDCode:=nHOUR;
      Goto L001;
    end;
    if sCmd = sMIN then begin
      nCMDCode:=nMIN;
      Goto L001;
    end;
    if sCmd = sCHECKLUCKYPOINT then begin
      nCMDCode:=nCHECKLUCKYPOINT;
      Goto L001;
    end;
    if sCmd = sCHECKMONMAP then begin
      nCMDCode:=nCHECKMONMAP;
      Goto L001;
    end;
    if sCmd = sCHECKMONAREA then begin
      nCMDCode:=nCHECKMONAREA;
      Goto L001;
    end;
    if sCmd = sCHECKHUM then begin
      nCMDCode:=nCHECKHUM;
      Goto L001;
    end;
    if sCmd = sCHECKGROUPNEARBY then begin
      nCMDCode:=nCHECKGROUPNEARBY;
      Goto L001;
    end;
    //Å³µ¥½º ¸í·É¾î
    if sCmd = sCHECKFAMEGRADE then begin      //Å³µ¥½º µî±Þ È®ÀÎ
      nCMDCode:=nCHECKFAMEGRADE;
      Goto L001;
    end;
    if sCmd = sCHECKKILLPOINT then begin      //Å³Æ÷ÀÎÆ® È®ÀÎ
      nCMDCode:=nCHECKKILLPOINT;
      Goto L001;
    end;


    if sCmd = sCHECKLOVERDAY then begin    //¿¬ÀÎ ½ºÃÄ ±â°£  Ã¼Å©
      nCMDCode:=nCHECKLOVERDAY;
      Goto L001;
    end;


    if sCmd = sEQUAL then begin
      nCMDCode:=nEQUAL;
      Goto L001;
    end;

    if sCmd = sLARGE then begin
      nCMDCode:=nLARGE;
      Goto L001;
    end;

    if sCmd = sSMALL then begin
      nCMDCode:=nSMALL;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSEDIR then begin
      nCMDCode:=nSC_CHECKPOSEDIR;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSELEVEL then begin
      nCMDCode:=nSC_CHECKPOSELEVEL;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOSEGENDER then begin
      nCMDCode:=nSC_CHECKPOSEGENDER;
      Goto L001;
    end;

    if sCmd = sSC_CHECKLEVELEX then begin
      nCMDCode:=nSC_CHECKLEVELEX;
      Goto L001;
    end;

    if sCmd = sSC_CHECKCOLUMN then begin
      nCMDCode:=nSC_CHECKCOLUMN;
      Goto L001;
    end;

    if sCmd = sSC_CHECKBONUSPOINT then begin
      nCMDCode:=nSC_CHECKBONUSPOINT;
      Goto L001;
    end;


    if sCmd = sSC_CHECKNAMEIPLIST then begin
      nCMDCode:=nSC_CHECKNAMEIPLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKACCOUNTIPLIST then begin
      nCMDCode:=nSC_CHECKACCOUNTIPLIST;
      Goto L001;
    end;
    if sCmd = sSC_CHECKSLAVECOUNT then begin
      nCMDCode:=nSC_CHECKSLAVECOUNT;
      Goto L001;
    end;

    if sCmd = sSC_CHECKPOS then begin
      nCMDCode:=nSC_CHECKPOS;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAP then begin
      nCMDCode:=nSC_CHECKMAP;
      Goto L001;
    end;
    if sCmd = sSC_REVIVESLAVE then begin
      nCMDCode:=nSC_REVIVESLAVE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKMAGIC then begin
      nCMDCode:=nSC_CHECKMAGIC;
      Goto L001;
    end;
    if sCmd = sSC_CHKMAGICLEVEL then begin
      nCMDCode:=nSC_CHKMAGICLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHECKHORSE then begin
      nCMDCode:=nSC_CHECKHORSE;
      Goto L001;
    end;
    if sCmd = sSC_CHECKRIDING then begin
      nCMDCode:=nSC_CHECKRIDING;
      Goto L001;
    end;
    if sCmd = sSC_CHECKGROUPCLASS then begin
      nCMDCode:=nSC_CHECKGROUPCLASS;
      Goto L001;
    end;
    if sCmd = sSC_RANDOMEX then begin
      nCMDCode:=nSC_RANDOMEX;
      Goto L001;
    end;
    if sCmd = sSC_INSAFEZONE then begin
      nCMDCode := nSC_INSAFEZONE;
      Goto L001;
    end;
    if sCmd = sSC_ISGROUPMASTER then begin
      nCMDCode := nSC_ISGROUPMASTER;
      Goto L001;
    end;
    //------------------------------


    L001:
    if nCMDCode > 0 then begin
      QuestConditionInfo.nCmdCode:=nCMDCode;
      if (sParam1 <> '') and (sParam1[1] = '"') then begin
        ArrestStringEx(sParam1,'"','"',sParam1);
      end;
      if (sParam2 <> '') and (sParam2[1] = '"') then begin
        ArrestStringEx(sParam2,'"','"',sParam2);
      end;
      if (sParam3 <> '') and (sParam3[1] = '"') then begin
        ArrestStringEx(sParam3,'"','"',sParam3);
      end;
      if (sParam4 <> '') and (sParam4[1] = '"') then begin
        ArrestStringEx(sParam4,'"','"',sParam4);
      end;
      if (sParam5 <> '') and (sParam5[1] = '"') then begin
        ArrestStringEx(sParam5,'"','"',sParam5);
      end;
      if (sParam6 <> '') and (sParam6[1] = '"') then begin
        ArrestStringEx(sParam6,'"','"',sParam6);
      end;
      QuestConditionInfo.sParam1:=sParam1;
      QuestConditionInfo.sParam2:=sParam2;
      QuestConditionInfo.sParam3:=sParam3;
      QuestConditionInfo.sParam4:=sParam4;
      QuestConditionInfo.sParam5:=sParam5;
      QuestConditionInfo.sParam6:=sParam6;
      if IsStringNumber(sParam1) then
        QuestConditionInfo.nParam1:=Str_ToInt(sParam1,0);
      if IsStringNumber(sParam2) then
        QuestConditionInfo.nParam2:=Str_ToInt(sParam2,0);
      if IsStringNumber(sParam3) then
        QuestConditionInfo.nParam3:=Str_ToInt(sParam3,0);
      if IsStringNumber(sParam4) then
        QuestConditionInfo.nParam4:=Str_ToInt(sParam4,0);
      if IsStringNumber(sParam5) then
        QuestConditionInfo.nParam5:=Str_ToInt(sParam5,0);
      if IsStringNumber(sParam6) then
        QuestConditionInfo.nParam6:=Str_ToInt(sParam6,0);
      Result:=True;
    end;
      
  end;
  function QuestAction(sText:String;QuestActionInfo:pTQuestActionInfo):Boolean; //0048A640
  var
    sCmd,sParam1,sParam2,sParam3,sParam4,sParam5,sParam6:String;
    nCMDCode:Integer;
  Label L001;
  begin
    Result:=False;
    sText:=GetValidStrCap(sText,sCmd,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam1,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam2,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam3,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam4,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam5,[' ',#9]);
    sText:=GetValidStrCap(sText,sParam6,[' ',#9]);
    sCmd:=UpperCase(sCmd);
    sCmd := QuestActionInfo.Script.Cmd(sCmd);
    nCmdCode:=0;
    if sCmd = sSET then begin
      nCMDCode:=nSET;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;

    if sCmd = sRESET then begin
      nCMDCode:=nRESET;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sSETOPEN then begin
      nCMDCode:=nSETOPEN;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sSETUNIT then begin
      nCMDCode:=nSETUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sRESETUNIT then begin
      nCMDCode:=nRESETUNIT;
      ArrestStringEx(sParam1,'[',']',sParam1);
      if not IsStringNumber(sParam1) then nCMDCode:=0;
      if not IsStringNumber(sParam2) then nCMDCode:=0;
    end;
    if sCmd = sTAKE then begin
      nCMDCode:=nTAKE;
      Goto L001;
    end;
    if sCmd = sSC_GIVE then begin
      nCMDCode:=nSC_GIVE;
      Goto L001;
    end;
    if sCmd = sSC_GIVEOPTION then begin
      nCMDCode:=nSC_GIVEOPTION;
      Goto L001;
    end;
    if sCmd = sCLOSE then begin
      nCMDCode:=nCLOSE;
      Goto L001;
    end;
    if sCmd = sBREAK then begin
      nCMDCode:=nBREAK;
      Goto L001;
    end;
    if sCmd = sGOTO then begin
      nCMDCode:=nGOTO;
      Goto L001;
    end;
    if sCmd = sSOUND then begin
      nCMDCode:=nSOUND;
      Goto L001;
    end;
    if sCmd = sADDNAMELIST then begin
      nCMDCode:=nADDNAMELIST;
      Goto L001;
    end;
    if sCmd = sDELNAMELIST then begin
      nCMDCode:=nDELNAMELIST;
      Goto L001;
    end;
    if sCmd = sADDGUILDLIST then begin
      nCMDCode:=nADDGUILDLIST;
      Goto L001;
    end;         
    if sCmd = sDELGUILDLIST then begin
      nCMDCode:=nDELGUILDLIST;
      Goto L001;
    end;
    if sCmd = sSC_MAPTING then begin
      nCMDCode:=nSC_MAPTING;
      Goto L001;
    end;
    if sCmd = sSC_LINEMSG then begin
      nCMDCode:=nSC_LINEMSG;
      Goto L001;
    end;

    if sCmd = sADDACCOUNTLIST then begin
      nCMDCode:=nADDACCOUNTLIST;
      Goto L001;
    end;
    if sCmd = sDELACCOUNTLIST then begin
      nCMDCode:=nDELACCOUNTLIST;
      Goto L001;
    end;

    if sCmd = sADDCOUNTLIST then begin        //°¹¼ö ¸ð¾Æ¿À±â
      nCMDCode := nADDCOUNTLIST;
      goto L001;
    end;

    if sCmd = sADDIPLIST then begin
      nCMDCode:=nADDIPLIST;
      Goto L001;
    end;
    if sCmd = sDELIPLIST then begin
      nCMDCode:=nDELIPLIST;
      Goto L001;
    end;
    if sCmd = sSENDMSG then begin
      nCMDCode:=nSENDMSG;
      Goto L001;
    end;
    if sCmd = sCHANGEMODE then begin
      nCMDCode:=nCHANGEMODE;
      Goto L001;
    end;
    if sCmd = sPKPOINT then begin
      nCMDCode:=nPKPOINT;
      Goto L001;
    end;
    if sCmd = sCHANGEXP then begin
      nCMDCode:=nCHANGEXP;
      Goto L001;
    end;
    if sCmd = sSC_RECALLMOB then begin
      nCMDCode:=nSC_RECALLMOB;
      Goto L001;
    end;
    if sCmd = sKICK then begin
      nCMDCode:=nKICK;
      Goto L001;
    end;
    if sCmd = sTAKEW then begin
      nCMDCode:=nTAKEW;
      Goto L001;
    end;
    if sCmd = sTIMERECALL then begin
      nCMDCode:=nTIMERECALL;
      Goto L001;
    end;
    if sCmd = sSC_PARAM1 then begin
      nCMDCode:=nSC_PARAM1;
      Goto L001;
    end;
    if sCmd = sSC_PARAM2 then begin
      nCMDCode:=nSC_PARAM2;
      Goto L001;
    end;
    if sCmd = sSC_PARAM3 then begin
      nCMDCode:=nSC_PARAM3;
      Goto L001;
    end;
    if sCmd = sSC_PARAM4 then begin
      nCMDCode:=nSC_PARAM4;
      Goto L001;
    end;
    if sCmd = sSC_EXEACTION then begin
      nCMDCode:=nSC_EXEACTION;
      Goto L001;
    end;
    if sCmd = sSETNEWRANKNAME then begin
      nCMDCode:=nSETNEWRANKNAME;
      Goto L001;
    end;
    if sCmd = s_GETAUCTIONITEMS then begin //À§Å¹
      nCMDCode:= n_GETAUCTIONITEMS;
      Goto L001;
    end;

    if sCmd = s_CLOSEAUCTION then begin
      nCMDCode:= n_CLOSEAUCTION;
      Goto L001;
    end;

    if sCmd = s_GETCOMSTORAGEITEMS then begin //°ø¿ëÃ¢°í
      nCMDCode:= n_GETCOMSTORAGEITEMS;
      Goto L001;
    end;

    if sCmd = s_CLOSECOMSTORAGE then begin   //°ø¿ëÃ¢°í
      nCMDCode:= n_CLOSECOMSTORAGE;
      Goto L001;
    end;

    if sCmd = s_GETGUILDSTORAGEITEMS then begin //¹®ÆÄÃ¢°í
      nCMDCode:= n_GETGUILDSTORAGEITEMS;
      Goto L001;
    end;

    if sCmd = s_CLOSEGUILDSTORAGE then begin   //¹®ÆÄÃ¢°í
      nCMDCode:= n_CLOSEGUILDSTORAGE;
      Goto L001;
    end;

    if sCmd = sMAPMOVE then begin
      nCMDCode:=nMAPMOVE;
      Goto L001;
    end;
    if sCmd = sRANDOMMAPMOVE then begin
      nCMDCode:=nRANDOMMAPMOVE;
      Goto L001;
    end;
    if sCmd = sCASTLERECALL then begin
      nCMDCode:=nCASTLERECALL;
      Goto L001;
    end;
    if sCmd = sGTMAPMOVE then begin
      nCMDCode:=nGTMAPMOVE;
      Goto L001;
    end;
    if sCmd = sMAP then begin
      nCMDCode:=nMAP;
      Goto L001;
    end;
    if sCmd = sTAKECHECKITEM then begin
      nCMDCode:=nTAKECHECKITEM;
      Goto L001;
    end;
    if sCmd = sMONGEN then begin
      nCMDCode:=nMONGEN;
      Goto L001;
    end;
    if sCmd = sMONCLEAR then begin
      nCMDCode:=nMONCLEAR;
      Goto L001;
    end;
    if sCmd = sMOV then begin
      nCMDCode:=nMOV;
      Goto L001;
    end;
    if sCmd = sINC then begin
      nCMDCode:=nINC;
      Goto L001;
    end;
    if sCmd = sDEC then begin
      nCMDCode:=nDEC;
      Goto L001;
    end;
    if sCmd = sSUM then begin
      nCMDCode:=nSUM;
      Goto L001;
    end;
    if sCmd = sBREAKTIMERECALL then begin
      nCMDCode:=nBREAKTIMERECALL;
      Goto L001;
    end;

    if sCmd = sMOVR then begin
      nCMDCode:=nMOVR;
      Goto L001;
    end;
    if sCmd = sEXCHANGEMAP then begin
      nCMDCode:=nEXCHANGEMAP;
      Goto L001;
    end;
    if sCmd = sRECALLMAP then begin
      nCMDCode:=nRECALLMAP;
      Goto L001;
    end;
    if sCmd = sADDBATCH then begin
      nCMDCode:=nADDBATCH;
      Goto L001;
    end;
    if sCmd = sBATCHDELAY then begin
      nCMDCode:=nBATCHDELAY;
      Goto L001;
    end;
    if sCmd = sBATCHMOVE then begin
      nCMDCode:=nBATCHMOVE;
      Goto L001;
    end;
    if sCmd = sPLAYDICE then begin
      nCMDCode:=nPLAYDICE;
      Goto L001;
    end;
    if sCmd = sGOQUEST then begin
      nCMDCode:=nGOQUEST;
      Goto L001;
    end;
    if sCmd = sENDQUEST then begin
      nCMDCode:=nENDQUEST;
      Goto L001;
    end;
    if sCmd = sSC_HAIRCOLOR then begin
      nCMDCode:=nSC_HAIRCOLOR;
      Goto L001;
    end;
    if sCmd = sSC_WEARCOLOR then begin
      nCMDCode:=nSC_WEARCOLOR;
      Goto L001;
    end;
    if sCmd = sSC_HAIRSTYLE then begin
      nCMDCode:=nSC_HAIRSTYLE;
      Goto L001;
    end;
    if sCmd = sSC_MONRECALL then begin
      nCMDCode:=nSC_MONRECALL;
      Goto L001;
    end;
    if sCmd = sSC_HORSECALL then begin
      nCMDCode:=nSC_HORSECALL;
      Goto L001;
    end;
    if sCmd = sSC_HAIRRNDCOL then begin
      nCMDCode:=nSC_HAIRRNDCOL;
      Goto L001;
    end;
    if sCmd = sSC_KILLHORSE then begin
      nCMDCode:=nSC_KILLHORSE;
      Goto L001;
    end;
    if sCmd = sSC_RANDSETDAILYQUEST then begin
      nCMDCode:=nSC_RANDSETDAILYQUEST;
      Goto L001;
    end;


    if sCmd = sSC_CHANGELEVEL then begin
      nCMDCode:=nSC_CHANGELEVEL;
      Goto L001;
    end;

    if sCmd = sSC_CLEARSKILL then begin
      nCMDCode:=nSC_CLEARSKILL;
      Goto L001;
    end;
    if sCmd = sSC_DELNOJOBSKILL then begin
      nCMDCode:=nSC_DELNOJOBSKILL;
      Goto L001;
    end;
    if sCmd = sSC_DELSKILL then begin
      nCMDCode:=nSC_DELSKILL;
      Goto L001;
    end;
    if sCmd = sSC_ADDSKILL then begin
      nCMDCode:=nSC_ADDSKILL;
      Goto L001;
    end;
    if sCmd = sSC_ADDHEROSKILL then begin
      nCMDCode := nSC_ADDHEROSKILL;
      goto L001;
    end;
    if sCmd = sSC_SKILLLEVEL then begin
      nCMDCode:=nSC_SKILLLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEPKPOINT then begin
      nCMDCode:=nSC_CHANGEPKPOINT;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEEXP then begin
      nCMDCode:=nSC_CHANGEEXP;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEJOB then begin
      nCMDCode:=nSC_CHANGEJOB;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEJOBUP then begin    //µî¼±º¯È¯
      nCMDCode:=nSC_CHANGEJOBUP;
      Goto L001;
    end;
    if sCmd = sSC_MISSION then begin
      nCMDCode:=nSC_MISSION;
      Goto L001;
    end;
    if sCmd = sSC_MOBPLACE then begin
      nCMDCode:=nSC_MOBPLACE;
      Goto L001;
    end;
    if sCmd = sSC_GAMEGOLD then begin
      nCMDCode:=nSC_GAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_GAMEPOINT then begin
      nCMDCode:=nSC_GAMEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_PKZONE then begin
      nCMDCode:=nSC_PKZONE;
      Goto L001;
    end;
    if sCmd = sSC_RESTBONUSPOINT then begin
      nCMDCode:=nSC_RESTBONUSPOINT;
      Goto L001;
    end;
    if sCmd = sSC_TAKECASTLEGOLD then begin
      nCMDCode:=nSC_TAKECASTLEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_HUMANHP then begin
      nCMDCode:=nSC_HUMANHP;
      Goto L001;
    end;
    if sCmd = sSC_HUMANMP then begin
      nCMDCode:=nSC_HUMANMP;
      Goto L001;
    end;
    if sCmd = sSC_BUILDPOINT then begin
      nCMDCode:=nSC_BUILDPOINT;
      Goto L001;
    end;
    if sCmd = sSC_GUILDMODE then begin
      nCMDCode:=nSC_GUILDMODE;
      Goto L001;
    end;
    if sCmd = sSC_AURAEPOINT then begin
      nCMDCode:=nSC_AURAEPOINT;
      Goto L001;
    end;
    if sCmd = sSC_STABILITYPOINT then begin
      nCMDCode:=nSC_STABILITYPOINT;
      Goto L001;
    end;
    if sCmd = sSC_FLOURISHPOINT then begin
      nCMDCode:=nSC_FLOURISHPOINT;
      Goto L001;
    end;
    if sCmd = sSC_OPENMAGICBOX then begin
      nCMDCode:=nSC_OPENMAGICBOX;
      Goto L001;
    end;
    if sCmd = sSC_SETRANKLEVELNAME then begin
      nCMDCode:=nSC_SETRANKLEVELNAME;
      Goto L001;
    end;
    if sCmd = sSC_GMEXECUTE then begin
      nCMDCode:=nSC_GMEXECUTE;
      Goto L001;
    end;
    if sCmd = sSC_GUILDCHIEFITEMCOUNT then begin
      nCMDCode:=nSC_GUILDCHIEFITEMCOUNT;
      Goto L001;
    end;
    if sCmd = sSC_ADDNAMEDATELIST then begin
      nCMDCode:=nSC_ADDNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_DELNAMEDATELIST then begin
      nCMDCode:=nSC_DELNAMEDATELIST;
      Goto L001;
    end;
    if sCmd = sSC_MOBFIREBURN then begin
      nCMDCode:=nSC_MOBFIREBURN;
      Goto L001;
    end;
    if sCmd = sSC_MESSAGEBOX then begin
      nCMDCode:=nSC_MESSAGEBOX;
      Goto L001;
    end;
    if sCmd = sSC_SETSCRIPTFLAG then begin
      nCMDCode:=nSC_SETSCRIPTFLAG;
      Goto L001;
    end;
    if sCmd = sSC_SETAUTOGETEXP then begin
      nCMDCode:=nSC_SETAUTOGETEXP;
      Goto L001;
    end;
    if sCmd = sSC_VAR then begin
      nCMDCode:=nSC_VAR;
      Goto L001;
    end;
    if sCmd = sSC_LOADVAR then begin
      nCMDCode:=nSC_LOADVAR;
      Goto L001;
    end;
    if sCmd = sSC_SAVEVAR then begin
      nCMDCode:=nSC_SAVEVAR;
      Goto L001;
    end;
    if sCmd = sSC_CALCVAR then begin
      nCMDCode:=nSC_CALCVAR;
      Goto L001;
    end;
    if sCmd = sSC_AUTOADDGAMEGOLD then begin
      nCMDCode:=nSC_AUTOADDGAMEGOLD;
      Goto L001;
    end;
    if sCmd = sSC_AUTOSUBGAMEGOLD then begin
      nCMDCode:=nSC_AUTOSUBGAMEGOLD;
      Goto L001;
    end;

    if sCmd = sSC_RECALLGROUPMEMBERS then begin
      nCMDCode:=nSC_RECALLGROUPMEMBERS;
      Goto L001;
    end;
    if sCmd = sSC_CLEARNAMELIST then begin
      nCMDCode:=nSC_CLEARNAMELIST;
      Goto L001;
    end;
    if sCmd = sSC_CHANGENAMECOLOR then begin
      nCMDCode:=nSC_CHANGENAMECOLOR;
      Goto L001;
    end;
    if sCmd = sSC_CLEARPASSWORD then begin
      nCMDCode:=nSC_CLEARPASSWORD;
      Goto L001;
    end;
    if sCmd = sSC_RENEWLEVEL then begin
      nCMDCode:=nSC_RENEWLEVEL;
      Goto L001;
    end;
    if sCmd = sSC_KILLMONEXPRATE then begin
      nCMDCode:=nSC_KILLMONEXPRATE;
      Goto L001;
    end;
    if sCmd = sSC_BEGINNEREXPRATE then begin
      nCMDCode:=nSC_BEGINNEREXPRATE;
      Goto L001;
    end;

    if sCmd = sSC_MASTEREXPRATE then begin  //»çÁ¦ °æÄ¡
      nCMDCode:=nSC_MASTEREXPRATE;
      Goto L001;
    end;


    if sCmd = sSC_TEMPPOWERUP then begin  //Temppowerup
      nCMDCode:=nSC_TEMPPOWERUP;
      Goto L001;
    end;

    if sCmd = sSC_HEALING then begin  //NPC Èú¸µ
      nCMDCode:=nSC_HEALING;
      Goto L001;
    end;

    if sCmd = sSC_SNOW then begin   //´«¿À´ÂÀÌÆå
      nCMDCode := nSC_SNOW;
      goto L001;
    end;

    if sCmd = sSC_FLOWER then begin
      nCMDCode := nSC_FLOWER;
      goto L001;
    end;


    if sCmd = sSC_LOCK then begin
      nCMDCode := nSC_LOCK;
      goto L001;
    end;

    if sCmd = sSC_UNLOCK then begin
      nCMDCode := nSC_UNLOCK;
      goto L001;
    end;

    if sCmd = sSC_CLEARDUELMAP then begin
      nCMDCode := nSC_CLEARDUELMAP;
      goto L001;
    end;
    
    if sCmd = sSC_GETDUELITEMS then begin
      nCMDCode := nSC_GETDUELITEMS;
      goto L001;
    end;

    if sCmd = sSC_POWERRATE then begin
      nCMDCode:=nSC_POWERRATE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEMODE then begin
      nCMDCode:=nSC_CHANGEMODE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEPERMISSION then begin
      nCMDCode:=nSC_CHANGEPERMISSION;
      Goto L001;
    end;
    if sCmd = sSC_KILL then begin
      nCMDCode:=nSC_KILL;
      Goto L001;
    end;
    if sCmd = sSC_KICK then begin
      nCMDCode:=nSC_KICK;
      Goto L001;
    end;
    if sCmd = sSC_BONUSPOINT then begin
      nCMDCode:=nSC_BONUSPOINT;
      Goto L001;
    end;
    if sCmd = sSC_RESTRENEWLEVEL then begin
      nCMDCode:=nSC_RESTRENEWLEVEL;
      Goto L001;
    end;
    
    if sCmd = sSC_PCPOINT then begin
      nCMDCode:=nSC_PCPOINT;
      Goto L001;
    end;

    if sCmd = sSC_CLEARNEEDITEMS then begin
      nCMDCode:=nSC_CLEARNEEDITEMS;
      Goto L001;
    end;
    if sCmd = sSC_CLEARMAKEITEMS then begin
      nCMDCode:=nSC_CLEARMAEKITEMS;
      Goto L001;
    end;

    if sCmd = sSC_SETSENDMSGFLAG then begin
      nCMDCode:=nSC_SETSENDMSGFLAG;
      Goto L001;
    end;
    if sCmd = sSC_UPGRADEITEMS then begin
      nCMDCode:=nSC_UPGRADEITEMS;
      Goto L001;
    end;
    if sCmd = sSC_UPGRADEITEMSEX then begin
      nCMDCode:=nSC_UPGRADEITEMSEX;
      Goto L001;
    end;
    if sCmd = sSC_MONGENEX then begin
      nCMDCode:=nSC_MONGENEX;
      Goto L001;
    end;
    if sCmd = sSC_CLEARMAPMON then begin
      nCMDCode:=nSC_CLEARMAPMON;
      Goto L001;
    end;

    if sCmd = sSC_SETMAPMODE then begin
      nCMDCode:=nSC_SETMAPMODE;
      Goto L001;
    end;

    if sCmd = sSC_KILLSLAVE then begin
      nCMDCode:=nSC_KILLSLAVE;
      Goto L001;
    end;
    if sCmd = sSC_CHANGEGENDER then begin
      nCMDCode:=nSC_CHANGEGENDER;
      Goto L001;
    end;

    if sCmd = sSC_MAPTING then begin
      nCMDCode:=nSC_MAPTING;
      Goto L001;
    end;

    if sCmd = sSC_GUILDRECALL then begin
      nCMDCode:=nSC_GUILDRECALL;
      Goto L001;
    end;
    if sCmd = sSC_GROUPRECALL then begin
      nCMDCode:=nSC_GROUPRECALL;
      Goto L001;
    end;
    if sCmd = sSC_GROUPADDLIST then begin
      nCMDCode:=nSC_GROUPADDLIST;
      Goto L001;
    end;
    if sCmd = sSC_CLEARLIST then begin
      nCMDCode:=nSC_CLEARLIST;
      Goto L001;
    end;
    if sCmd = sSC_GROUPMOVEMAP then begin
      nCMDCode:=nSC_GROUPMOVEMAP;
      Goto L001;
    end;
    if sCmd = sSC_ADDBEGINNER then begin    //ÃÊº¸¹®ÆÄ
      nCMDCode:=nSC_ADDBEGINNER;
      Goto L001;
    end;
    if sCmd = sSC_SAVESLAVES then begin
      nCMDCode:=nSC_SAVESLAVES;
      Goto L001;
    end;
    if sCmd = sSC_SETSENDMSGFLAG1 then begin
      nCMDCode:=nSC_SETSENDMSGFLAG1;
      Goto L001;
    end;

    if sCmd = sSC_CHANGEITEM then begin   //º¯È¯
      nCMDCode:=nSC_CHANGEITEM;
      Goto L001;
    end;

    if sCmd = sSC_CHANGEITEMUP then begin
      nCMDCode:=nSC_CHANGEITEMUP;
      Goto L001;
    end;

    if sCmd = sSC_ACCCHANGEITEM then begin
      nCMDCode:=nSC_ACCCHANGEITEM;
      Goto L001;
    end;

    if sCmd = sSC_ROCKPAPERS then begin   //°¡À§¹ÙÀ§º¸
      nCMDCode:=nSC_ROCKPAPERS;
      Goto L001;
    end;

    if sCmd = sSC_DELETEHERO then begin
      nCMDCode := nSC_DELETEHERO;
      goto L001;
    end;

    if sCmd = sSC_RECALLHERO then begin
      nCMDCode := nSC_RECALLHERO;
      goto L001;
    end;

    if sCmd = sSC_HEROLOGOUT then begin
      nCMDCode := nSC_HEROLOGOUT;
      goto L001;
    end;

    //Å³µ¥½º ¸í·É¾î
    if sCmd = sUSEKILLPOINT then begin     //Å³ Æ÷ÀÎÆ® »ç¿ë
      nCMDCode:=nUSEKILLPOINT;
      Goto L001;
    end;

    if sCmd = s_MOVETOLOVER then begin     //¿¬ÀÎ ½ºÃÄ ÀÌµ¿  ¾ÕÀ¸·Î ÀÌµ¿
      nCMDCode:=n_MOVETOLOVER;
      Goto L001;
    end;

    if sCmd = s_BREAKLOVER then begin     //¿¬ÀÎ ½ºÃÄ ÇØÁ¦
      nCMDCode:=n_BREAKLOVER;
      Goto L001;
    end;

    L001:
    if nCMDCode > 0 then begin
      QuestActionInfo.nCmdCode:=nCMDCode;
      if (sParam1 <> '') and (sParam1[1] = '"') then begin
        ArrestStringEx(sParam1,'"','"',sParam1);
      end;
      if (sParam2 <> '') and (sParam2[1] = '"') then begin
        ArrestStringEx(sParam2,'"','"',sParam2);
      end;
      if (sParam3 <> '') and (sParam3[1] = '"') then begin
        ArrestStringEx(sParam3,'"','"',sParam3);
      end;
      if (sParam4 <> '') and (sParam4[1] = '"') then begin
        ArrestStringEx(sParam4,'"','"',sParam4);
      end;
      if (sParam5 <> '') and (sParam5[1] = '"') then begin
        ArrestStringEx(sParam5,'"','"',sParam5);
      end;
      if (sParam6 <> '') and (sParam6[1] = '"') then begin
        ArrestStringEx(sParam6,'"','"',sParam6);
      end;
      QuestActionInfo.sParam1:=sParam1;
      QuestActionInfo.sParam2:=sParam2;
      QuestActionInfo.sParam3:=sParam3;
      QuestActionInfo.sParam4:=sParam4;
      QuestActionInfo.sParam5:=sParam5;
      QuestActionInfo.sParam6:=sParam6;
      if IsStringNumber(sParam1) then
        QuestActionInfo.nParam1:=Str_ToInt(sParam1,0);
      if IsStringNumber(sParam2) then
        QuestActionInfo.nParam2:=Str_ToInt(sParam2,1);
      if IsStringNumber(sParam3) then
        QuestActionInfo.nParam3:=Str_ToInt(sParam3,1);
      if IsStringNumber(sParam4) then
        QuestActionInfo.nParam4:=Str_ToInt(sParam4,0);
      if IsStringNumber(sParam5) then
        QuestActionInfo.nParam5:=Str_ToInt(sParam5,0);
      if IsStringNumber(sParam6) then
        QuestActionInfo.nParam6:=Str_ToInt(sParam6,0);
      Result:=True;
    end;
  end;
begin   //0048B684
  Result:= -1;
  n6C:=0;
  n70:=0;
  sScritpFileName:=g_Config.sEnvirDir + sPatch + sScritpName + '.txt';
  if FileExists(sScritpFileName) then begin
    LoadList:=TStringList.Create;
    try
      LoadList.LoadFromFile(sScritpFileName);
      DeCodeStringList(LoadList);
    except
      LoadList.Free;
      exit;
    end;
    //1´Ü°è, ÁØºñ ´Ü°è , #CALLÀ» Ã£¾Æ¼­ Ç®¾î ³Ö´Â´Ù.
    i:=0;
    while (True) do begin
      LoadScriptcall(LoadList);
      Inc(i);
      if i >= 101 then break;
    end;

    //2´Ü°è, ÁØºñ ´Ü°è,  #DEFINE, #INCLUDE µî...
    DefineList:=TList.Create;

    s54:=LoadDefineInfo(LoadList,DefineList);

    New(DefineInfo);
    DefineInfo.sName:='@HOME';
    if s54 = '' then s54:='@main';
    DefineInfo.sText:=s54;
    DefineList.Add(DefineInfo);

    //Define Àû¿ë....
    for I := 0 to LoadList.Count - 1 do begin
      s34:=Trim(LoadList.Strings[i]);
      if (s34 <> '') then begin
        if (s34[1] = '[') then begin
          bo8D:=False;
        end else begin //0048B83F
          if (s34[1] = '#') and
             (CompareLStr(s34,'#IF',Length('#IF')) or
              CompareLStr(s34,'#ACT',Length('#ACT')) or
              CompareLStr(s34,'#ELSEACT',Length('#ELSEACT'))) then begin
            bo8D:=True;
          end else begin //0048B895
            if bo8D then begin
              for n20 := 0 to DefineList.Count - 1 do begin
                DefineInfo:=DefineList.Items[n20];
                n1C:=0;
                while (True) do  begin
                  n24:=Pos(DefineInfo.sName,UpperCase(s34));
                  if n24 <= 0 then break;
                  s58:=Copy(s34,1,n24 - 1);
                  s5C:=Copy(s34,length(DefineInfo.sName) + n24,256);
                  s34:=s58 + DefineInfo.sText + s5C;
                  LoadList.Strings[i]:=s34;
                  Inc(n1C);
                  if n1C >= 10 then break;
                end;
              end; // ½«Define ºÃµÄ³£Á¿»»³ÉÖ¸¶¨Öµ

            end; //0048B97D
          end;
        end; //0048B97D
      end; //0048B97D if (s34 <> '') then begin
    end; //for I := 0 to LoadList.Count - 1 do begin

    for I := 0 to DefineList.Count - 1 do begin
      Dispose(pTDefineInfo(DefineList.Items[i]));
    end;    // for I := 0 to List64.Count - 1 do begin
    DefineList.Free;

    //3´Ü°è ³»¿ëÀ» ÀÐ¾î³½´Ù.
    Script:=nil;
    SayingRecord:=nil;
    nQuestIdx:=0;

    for I := 0 to LoadList.Count - 1 do begin //0048B9FC
      s34:=Trim(LoadList.Strings[i]);
      if (s34 = '') or (s34[1] = ';') or (s34[1] = '/') then Continue;
      if (n6C = 0) and (boFlag) then begin
        //»óÁ¡ÀÇ ±âº» Á¤º¸,  ¹°°¡ Ãë±ÞÇ° µî
        if s34[1] = '%' then begin  //0048BA57
          s34:=Copy(s34,2,Length(s34) - 1);
          nPriceRate:=Str_ToInt(s34,-1);
          if nPriceRate >= 55 then begin    ///55% ÀÌ»óÀÌ¾î¾ß ÇÔ.
            TMerchant(NPC).m_nPriceRate:=nPriceRate;
          end;
          Continue;
        end;
        if s34[1] = '+' then begin       //ÆÇ¸Å Å¥Æã
          s34:=Copy(s34,2,Length(s34) - 1);
          nItemType:=Str_ToInt(s34,-1);
          if nItemType >= 0 then begin
            TMerchant(NPC).m_ItemTypeList.Add(Pointer(nItemType));
          end;
          Continue;
        end;
        //Ôö¼Ó´¦ÀíNPC¿ÉÖ´ÐÐÃüÁîÉèÖÃ
        if s34[1] = '(' then begin
          ArrestStringEx(s34,'(',')',s34);
          if s34 <> '' then begin
            while (s34 <> '') do  begin
              s34:=GetValidStr3(s34,s30,[' ',',',#9]);
              if CompareText(s30,sPBUY) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                Continue;
              end else
              if CompareText(s30,sBUY) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                Continue;
              end else if CompareText(s30,sSELL) = 0 then begin
                TMerchant(NPC).m_boSell:=True;
                Continue;
              end else if CompareText(s30, sWake) = 0 then begin    //°¢¼ºÃë¼Ò
                TMerchant(NPC).m_boWake := True;
                Continue;
              end else if CompareText(s30, sReStore) = 0 then begin    //°¢¼ºÃë¼Ò
                TMerchant(NPC).m_boReStore := True;
                Continue;
              end else if CompareText(s30, sLockUp) = 0 then begin   //ºÀÀÎ
                TMerchant(NPC).m_boLockUp := True;
                Continue;
              end else if CompareText(s30, sMakeNewHero) = 0 then begin
                TMerchant(NPC).m_boMakeNewHero := True;
                Continue;
              end else if CompareText(s30,sWAKEUPITEM) = 0 then begin
                TMerchant(NPC).m_boWakeUp:=True;
                Continue;
              end else if CompareText(s30,sDISASSEMBLE) = 0 then begin     //°¢¼ººÐÇØ
                TMerchant(NPC).m_boDisassemble:=True;
                Continue;
              end else if CompareText(s30,sDISMANTLE) = 0 then begin      //°¢¼ººÐÇØ
                TMerchant(NPC).m_boDismantle:=True;
                Continue;
              end else if CompareText(s30,sMAKEDURG) = 0 then begin
                TMerchant(NPC).m_boMakeDrug:=True;
                Continue;
              end else if CompareText(s30,sMAKEGEM) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
               ////////////////////////////////
              end else if CompareText(s30,sMAKEFOOD) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
              end else if CompareText(s30,sMAKEPOTION) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
              end else if CompareText(s30,sMAKEGEMS) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
              end else if CompareText(s30,sMAKEITEM) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
              end else if CompareText(s30,sMAKETUFF) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
              end else if CompareText(s30,sMAKEETC) = 0 then begin
                TMerchant(NPC).m_boBuy:=True;
                TMerchant(NPC).m_boMakeGem:=True;
                Continue;
               ///////////////////////////////

              end else if CompareText(s30,sPRICES) = 0 then begin
                TMerchant(NPC).m_boPrices:=True;
                Continue;
              end else if CompareText(s30,sSTORAGE) = 0 then begin       //Ã¢°í
                TMerchant(NPC).m_boStorage:=True;
                Continue;
              end else if CompareText(s30,sCOMSTORAGE) = 0 then begin      //°ø¿ëÃ¢°í ¹°°Ç ¿Ã¸®±â
                TMerchant(NPC).m_boComStoragement:=True;
                Continue;
              end else if CompareText(s30,sGUILDSTORAGE) = 0 then begin      //¹®ÆÄÃ¢°í ¹°°Ç ¿Ã¸®±â
                TMerchant(NPC).m_boGuildStoragement:=True;
                Continue;
              end else if CompareText(s30,sUPGRADENOW) = 0 then begin
                TMerchant(NPC).m_boUpgradenow:=True;
                Continue;
              end else if CompareText(s30,sCHECKWEAPON) = 0 then begin  //Á¦·Ã È®ÀÎ
                TMerchant(NPC).m_boCheckWeapon:=True;
                Continue;
              end else if CompareText(s30,sGETBACKUPGNOW) = 0 then begin
                TMerchant(NPC).m_boGetBackupgnow:=True;
                Continue;
              end else if CompareText(s30,sREPAIR) = 0 then begin
                TMerchant(NPC).m_boRepair:=True;
                Continue;
              end else if CompareText(s30,sSUPERREPAIR) = 0 then begin
                TMerchant(NPC).m_boS_repair:=True;
                Continue;
              end else if CompareText(s30,sSL_SENDMSG) = 0 then begin
                TMerchant(NPC).m_boSendmsg:=True;
                Continue;
              end else if CompareText(s30,sSL_SENDMSG2) = 0 then begin
                TMerchant(NPC).m_boSendmsg2:=True;
                Continue;
              end else if CompareText(s30,sUSEITEMNAME) = 0 then begin
                TMerchant(NPC).m_boUseItemName:=True;
                Continue;
              end;

            end;    // while
          end;
          Continue;
        end;
        //Ôö¼Ó´¦ÀíNPC¿ÉÖ´ÐÐÃüÁîÉèÖÃ
      end; //0048BAF0

      if s34[1] = '{' then begin
        if CompareLStr(s34,'{Quest',length('{Quest')) then begin    //Äù½ºÆ®¹® ½ÃÀÛ
          s38:=GetValidStr3(s34,s3C,[' ','}',#9]);
          GetValidStr3(s38,s3C,[' ','}',#9]);
          n70:=Str_ToInt(s3C,0);
          Script:=MakeNewScript();
          Script.nQuest:=n70;        //Äù½ºÆ®¹®
          Inc(n70);
       //   n6C := 1;  //Äù½ºÆ®ÀÇ Á¶°Ç
        end; //0048BBA4
        if CompareLStr(s34,'{~Quest',length('{~Quest')) then Continue;  //Äù½ºÆ®¹® Á¾·á
      end; //0048BBBE

      if (n6C = 1)and (Script <> nil) and (s34[1] = '#') then begin       //Äù½ºÆ®ÀÇ Á¶°Ç¹®
        s38:=GetValidStr3(s34,s3C,['=',' ',#9]);
        Script.boQuest:=True;
        if CompareLStr(s34,'#IF',length('#IF')) then begin      //#IF[0] = 1
          ArrestStringEx(s34,'[',']',s40);
          Script.QuestInfos[nQuestIdx].wFlag:=Str_ToInt(s40,0);
          GetValidStr3(s38,s44,['=',' ',#9]);             //#IF[0] = 1
          n24:=Str_ToInt(s44,0);
          if n24 <> 0 then n24:=1;
          Script.QuestInfos[nQuestIdx].btValue:=n24;
        end; //0048BCBD


        if CompareLStr(s34,'#RAND',length('#RAND')) then begin
          Script.QuestInfos[nQuestIdx].nRandRage:=Str_ToInt(s44,0);
        end;
        Continue;
      end; //0048BCF0

      if s34[1] = '[' then begin
        n6C:=10;                 //»õ·Î¿î ¹®ÀåÀÇ ½ÃÀÛ
        if Script = nil then  begin
          Script := MakeNewScript();
          Script.nQuest:=n70;
        end;
        if CompareText(s34,'[goods]') = 0 then begin
          n6C:=20;
          //---------------------------
          TMerchant(NPC).CreateIndex := CurrentMerchantIndex; // »óÇ°ÀÌ ÀÖ´Â Merchant¸¸ »ý¼º Index ºÎ¿©
          Inc(CurrentMerchantIndex);
          //---------------------------
          Continue;
        end;

        {if CompareText(s34,'[Quest]') = 0 then begin   //Äù½ºÆ®Å×½ºÆ®
          n6C:=30;
          Continue;
        end;   }

        s34:=ArrestStringEx(s34,'[',']',sLabel);
        New(SayingRecord);
        SayingRecord.ProcedureList:=TList.Create;
        SayingRecord.sLabel:=sLabel;
        s34:=GetValidStrCap(s34,sLabel,[' ',#9]);
        if CompareText(sLabel,'TRUE') = 0 then begin
          SayingRecord.boExtJmp:=True;
        end else begin
          SayingRecord.boExtJmp:=False;
        end;

        New(SayingProcedure);
        SayingRecord.ProcedureList.Add(SayingProcedure);
        SayingProcedure.ConditionList:=TList.Create;
        SayingProcedure.ActionList:=TList.Create;
        SayingProcedure.sSayMsg:='';
        SayingProcedure.ElseActionList:=TList.Create;
        SayingProcedure.sElseSayMsg:='';
        Script.RecordList.Add(SayingRecord);
        Continue;
      end; //0048BE05
      if (Script <> nil) and (SayingRecord <> nil) then begin
        if (n6C >= 10) and (n6C < 20) and (s34[1] = '#')then begin
          if CompareText(s34,'#IF') = 0 then begin
            if (SayingProcedure.ConditionList.Count > 0) or (SayingProcedure.sSayMsg <> '') then begin  //0048BE53
              New(SayingProcedure);     //Ãß°¡ÀûÀÎ if¹®
              SayingRecord.ProcedureList.Add(SayingProcedure);
              SayingProcedure.ConditionList:=TList.Create;
              SayingProcedure.ActionList:=TList.Create;
              SayingProcedure.sSayMsg:='';
              SayingProcedure.ElseActionList:=TList.Create;
              SayingProcedure.sElseSayMsg:='';
            end; //0048BECE
            n6C:=11;
          end; //0048BED5
          if CompareText(s34,'#ACT') = 0 then n6C:=12;
          if CompareText(s34,'#SAY') = 0 then n6C:=10;
          if CompareText(s34,'#ELSEACT') = 0 then n6C:=13;
          if CompareText(s34,'#ELSESAY') = 0 then n6C:=14;
          Continue;
        end; //0048BF3E
        //¹®ÀåÀÇ ´ëÈ­ ³»¿ë (±âº» ´ëÈ­)
        if (n6C = 10) and (SayingProcedure <> nil) then
          SayingProcedure.sSayMsg:=SayingProcedure.sSayMsg + s34;
        //¹®ÀåÀÇ Á¶°Ç
        if (n6C = 11) then begin
          New(QuestConditionInfo);
          FillChar(QuestConditionInfo^,SizeOf(TQuestConditionInfo),#0);
          QuestConditionInfo.Script := TScriptObject.Create;
          if QuestCondition(Trim(s34),QuestConditionInfo) then begin
            SayingProcedure.ConditionList.Add(QuestConditionInfo);
          end else begin
            QuestConditionInfo.Script.Free;
            Dispose(QuestConditionInfo);
            MainOutMessage('#IF ÎÊÌâ: ' + s34 + ' ' + IntToStr(i) + 'ÐÐ£¬ÎÄ¼þÃû: ' + sScritpFileName);
          end;
        end; //0048C004
        //¹®ÀåÀÇ (NPCÀÇ) Çàµ¿
        if (n6C = 12) then begin
          New(QuestActionInfo);
          FillChar(QuestActionInfo^,SizeOf(TQuestActionInfo),#0);
          QuestActionInfo.Script := TScriptObject.Create;
          if QuestAction(Trim(s34),QuestActionInfo) then begin
            SayingProcedure.ActionList.Add(QuestActionInfo);
          end else begin
            QuestActionInfo.Script.Free;
            Dispose(QuestActionInfo);
            MainOutMessage('#ACT ÎÊÌâ: ' + s34 + ' ' + IntToStr(i) + 'ÐÐ£¬ÎÄ¼þÃû: ' + sScritpFileName);
          end;
        end; //0048C0B1
        //¹®ÀåÀÇ ºÎÁ¤ Çàµ¿ (Á¶°Ç¿¡ ¸ÂÁö ¾ÊÀº °æ¿ì)
        if (n6C = 13) then begin
          New(QuestActionInfo);
          FillChar(QuestActionInfo^,SizeOf(TQuestActionInfo),#0);
          QuestActionInfo.Script := TScriptObject.Create;
          if QuestAction(Trim(s34),QuestActionInfo) then begin
            SayingProcedure.ElseActionList.Add(QuestActionInfo);
          end else begin
            QuestActionInfo.Script.Free;
            Dispose(QuestActionInfo);
            MainOutMessage('#ELSEACT ÎÊÌâ: ' + s34 + ' ' + IntToStr(i) + 'ÐÐ£¬ÎÄ¼þÃû: ' + sScritpFileName);
          end;
        end;
        //¹®ÀåÀÇ ºÎÁ¤ ´ëÈ­ (Àú°Ç¿¡ ¸ÂÁö ¾ÊÀº °æ¿ì ´ëÈ­)
        if (n6C = 14) then
          SayingProcedure.sElseSayMsg:=SayingProcedure.sElseSayMsg + s34;
      end;
      if (n6C = 20) and boFlag then begin       //»óÇ°¸ñ·Ï
        s34:=GetValidStrCap(s34,s48,[' ',#9]);    //itmname
        s34:=GetValidStrCap(s34,s4C,[' ',#9]);    //scount
        s34:=GetValidStrCap(s34,s50,[' ',#9]);    //shour
        s52:= '';
        s34:=GetValidStrCap(s34,s52,[' ',#9]);    //°¹¼ö
        if (s48 <> '') and (s50 <> '') then begin
          if (s48[1] = '"') then begin
            ArrestStringEx(s48,'"','"',s48);
          end;

          if CanSellItem(s48) then begin
            New(Goods);

            Goods.sItemName := s48;
            Goods.nCount    := _MIN(1000, Str_ToInt(s4C, 0));
            Goods.dwRefillTime := Str_ToInt(s50, 0);
            Goods.dwRefillTick := 0;
            Goods.xCount := _MIN(Str_ToInt(s52,1),500);      //¹°¾à
            if (Goods.nCount = 0) or (Goods.dwRefillTime = 0) then
              Dispose(Goods)
            else
              TMerchant(NPC).m_RefillGoodsList.Add(Goods);
          end;
        end; //0048C2D2
      end; //0048C2D2

     { if (n6C = 30) then begin   //Äù½ºÆ®Å×½ºÆ®
        s34:=GetValidStrCap(s34,s48,[' ',#9]);

        s34:=GetValidStrCap(s34,s4C,[' ',#9]);
        s34:=GetValidStrCap(s34,s50,[' ',#9]);
        s52:= '';
        s34:=GetValidStrCap(s34,s52,[' ',#9]);
        if (s48 <> '') and (s50 <> '') then begin
          if (s48[1] = '"') then begin
            ArrestStringEx(s48,'"','"',s48);
          end;

          if CanSellItem(s48) then begin
            New(Goods);

            Goods.sItemName := s48;
            Goods.nCount    := _MIN(1000, Str_ToInt(s4C, 0));
            Goods.dwRefillTime := Str_ToInt(s50, 0);
            Goods.dwRefillTick := 0;
            Goods.xCount := _MIN(Str_ToInt(s52,1),500);      //¹°¾à
            if (Goods.nCount = 0) or (Goods.dwRefillTime = 0) then
              Dispose(Goods)
            else
              TMerchant(NPC).m_QuestsList.Add(Goods);
          end;
        end; //0048C2D2
      end; //0048C2D2 }

    end;    // for
    LoadList.Free;
  end else begin //0048C2EB
    MainOutMessage('Çë¼ì²é½Å±¾:' + sScritpFileName);
  end;
  Result:=1;
end;

function TFrmDB.SaveGoodRecord(NPC: TMerchant; sFile: String):Integer;//0048C748
var
  I,II: Integer;
  sFileName:String;
  FileHandle:Integer;
  UserItem:pTUserItem;
  List:TList;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Saved\' + sFile + '.sav';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FillChar(Header420,SizeOf(TGoodFileHeader),#0);
    for I := 0 to NPC.m_GoodsList.Count - 1 do begin
      List:=TList(NPC.m_GoodsList.Items[i]);
      Inc(Header420.nItemCount,List.Count);
    end;
    FileWrite(FileHandle,Header420,SizeOf(TGoodFileHeader));
    for I := 0 to NPC.m_GoodsList.Count - 1 do begin
      List:=TList(NPC.m_GoodsList.Items[i]);
      for II := 0 to List.Count - 1 do begin
        UserItem:=List.Items[II];
        FileWrite(FileHandle,UserItem^,SizeOf(TUserItem));
      end;
    end;
    FileClose(FileHandle);
    Result:=1;    
  end;
end;

function TFrmDB.SaveGoodPriceRecord(NPC: TMerchant; sFile: String):Integer;//0048CA64
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  ItemPrice:pTItemPrice;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Prices\' + sFile + '.prc';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FillChar(Header420,SizeOf(TGoodFileHeader),#0);
    Header420.nItemCount:=NPC.m_ItemPriceList.Count;
    FileWrite(FileHandle,Header420,SizeOf(TGoodFileHeader));
    for I := 0 to NPC.m_ItemPriceList.Count - 1 do begin
      ItemPrice:=NPC.m_ItemPriceList.Items[I];
      FileWrite(FileHandle,ItemPrice^,SizeOf(TItemPrice));
    end;
    FileClose(FileHandle);
    Result:=1;    
  end;

end;
procedure TFrmDB.ReLoadNpc; //
begin

end;
procedure TFrmDB.ReLoadMerchants; //00487BD8
var
  i,ii,nX,nY:Integer;
  sMapName:String;
  boUse,boNewNpc:Boolean;
  tMerchantNPC:TMerchant;
ResourceString
  sSQLString = 'SELECT * FROM TBL_MERCHANT';
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
  try
    for i := 0 to UserEngine.m_MerchantList.Count - 1 do begin
      tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[i]);
      tMerchantNPC.m_nFlag:= -1;
    end;

    UseSQL();
    Query.SQL.Clear;
    Query.SQL.Add(sSQLString);
    try
      Query.Open;
    finally
    end;

    for i:=0 to Query.RecordCount -1 do begin
      boUse                         := GetBoolean(Query,'FLD_ENABLED');
      if boUse then begin
        sMapName                    := Query.FieldByName('FLD_MAPNAME').AsString;
        nX                          := Query.FieldByName('FLD_X').AsInteger;
        nY                          := Query.FieldByName('FLD_Y').AsInteger;

        //Update existing NPC's
        boNewNpc:=True;
        for II := 0 to UserEngine.m_MerchantList.Count - 1 do begin
          tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[II]);
          if (tMerchantNPC.m_sMapName = sMapName) and
             (tMerchantNPC.m_nCurrX = nX) and
             (tMerchantNPC.m_nCurrY = nY) then begin
            boNewNpc:=False;
            tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
            tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
            tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
            tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
            tMerchantNPC.m_boCastle     := GetBoolean(Query,'FLD_ISCASTLE');
            tMerchantNPC.m_boCanMove    := GetBoolean(Query,'FLD_CANMOVE');
            tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;
            
            break;
          end;
        end;


        if boNewNpc then begin
          tMerchantNPC:=TMerchant.Create;
          tMerchantNPC.m_sMapName     := sMapName;
          tMerchantNPC.m_PEnvir:=g_MapManager.FindMap(tMerchantNPC.m_sMapName);

          if tMerchantNPC.m_PEnvir <> nil then begin
            tMerchantNPC.m_sScript      := Query.FieldByName('FLD_SCRIPTFILE').AsString;
            tMerchantNPC.m_nCurrX       := nX;
            tMerchantNPC.m_nCurrY       := nY;
            tMerchantNPC.m_sCharName    := Query.FieldByName('FLD_NAME').AsString;
            tMerchantNPC.m_nFlag        := Query.FieldByName('FLD_FLAG').AsInteger;
            tMerchantNPC.m_wAppr        := Query.FieldByName('FLD_APPEARANCE').AsInteger;
            tMerchantNPC.m_boCastle     := GetBoolean(Query,'FLD_ISCASTLE');
            tMerchantNPC.m_boCanMove    := GetBoolean(Query,'FLD_CANMOVE');
            tMerchantNPC.m_dwMoveTime   := Query.FieldByName('FLD_MOVETIME').AsInteger;

            if (tMerchantNPC.m_sScript <> '') and (tMerchantNPC.m_sMapName <> '') then begin
              UserEngine.m_MerchantList.Add(tMerchantNPC);
              tMerchantNPC.Initialize;
            end;
          end else tMerchantNPC.Free;
        end;
      end;

      Query.Next;
    end;

    for i := UserEngine.m_MerchantList.Count - 1 downto 0 do begin
      tMerchantNPC:=TMerchant(UserEngine.m_MerchantList.Items[i]);
      if tMerchantNPC.m_nFlag = -1 then begin
        tMerchantNPC.m_boGhost:=True;
        tMerchantNPC.m_dwGhostTick:=GetTickCount();
//        UserEngine.MerchantList.Delete(I);
      end;
    end;
  finally
    Query.Close;
  end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;

function TFrmDB.LoadUpgradeWeaponRecord(sNPCName: String;
  DataList: TList): Integer;//0048CBD0
var
  I: Integer;
  FileHandle:Integer;
  sFileName:String;
  UpgradeInfo:pTUpgradeInfo;
  UpgradeRecord:TUpgradeInfo;
  nRecordCount:Integer;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Upg\' + sNPCName + '.upg';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    if FileHandle > 0 then begin
      FileRead(FileHandle,nRecordCount,SizeOf(Integer));
      for I := 0 to nRecordCount - 1 do begin
        if FileRead(FileHandle,UpgradeRecord,SizeOf(TUpgradeInfo)) = SizeOf(TUpgradeInfo) then begin
          New(UpgradeInfo);
          UpgradeInfo^:=UpgradeRecord;
          UpgradeInfo.dwGetBackTick:=0;
          DataList.Add(UpgradeInfo);
        end;
      end;
      FileClose(FileHandle);
      Result:=1;
    end;
  end;
end;

function TFrmDB.SaveUpgradeWeaponRecord(sNPCName: String; DataList: TList):Integer;
var
  I: Integer;
  FileHandle:Integer;
  sFileName:String;
  UpgradeInfo:pTUpgradeInfo;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Upg\' + sNPCName + '.upg';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenWrite or fmShareDenyNone);
  end else begin
    FileHandle:=FileCreate(sFileName);
  end;
  if FileHandle > 0 then begin
    FileWrite(FileHandle,DataList.Count,SizeOf(Integer));
    for I := 0 to DataList.Count - 1 do begin
      UpgradeInfo:=DataList.Items[I];
      FileWrite(FileHandle,UpgradeInfo^,SizeOf(TUpgradeInfo));
    end;
    FileClose(FileHandle);
    Result:=1;
  end;
end;

function TFrmDB.LoadGoodRecord(NPC: TMerchant; sFile: String): Integer;//0048C574
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  UserItem:pTUserItem;
  List:TList;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Saved\' + sFile + '.sav';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    List:=nil;
    if FileHandle > 0 then begin
      if FileRead(FileHandle,Header420,SizeOf(TGoodFileHeader)) = SizeOf(TGoodFileHeader) then begin
        for I := 0 to Header420.nItemCount - 1 do begin
          New(UserItem);
          if FileRead(FileHandle,UserItem^,SizeOf(TUserItem)) = SizeOf(TUserItem) then begin
            if List = nil then begin
              List:=TList.Create;
              List.Add(UserItem)
            end else begin
              if pTUserItem(List.Items[0]).wIndex = UserItem.wIndex then begin
                List.Add(UserItem);
              end else begin
                NPC.m_GoodsList.Add(List);
                List:=TList.Create;
                List.Add(UserItem);
              end;
            end;
          end;
        end;
        if List <> nil then
          NPC.m_GoodsList.Add(List);
        FileClose(FileHandle);
        Result:=1;
      end;
    end;
  end;
end;

function TFrmDB.LoadGoodPriceRecord(NPC: TMerchant; sFile: String): Integer;//0048C918
var
  I: Integer;
  sFileName:String;
  FileHandle:Integer;
  ItemPrice:pTItemPrice;
  Header420:TGoodFileHeader;
begin
  Result:= -1;
  sFileName:='.\Envir\Market_Prices\' + sFile + '.prc';
  if FileExists(sFileName) then begin
    FileHandle:= FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
    if FileHandle > 0 then begin
      if FileRead(FileHandle,Header420,SizeOf(TGoodFileHeader)) = SizeOf(TGoodFileHeader) then begin
        for I := 0 to Header420.nItemCount - 1 do begin
          New(ItemPrice);
          if FileRead(FileHandle,ItemPrice^,SizeOf(TItemPrice)) = SizeOf(TItemPrice) then begin
            NPC.m_ItemPriceList.Add(ItemPrice);
          end else begin
            Dispose(ItemPrice);
            break;
          end;
        end;
      end;
      FileClose(FileHandle);
      Result:=1;
    end;
  end;
end;
{
procedure DeCryptString(Src,Dest:PChar;nSrc:Integer;var nDest:Integer);stdcall;
begin

end;
}
function DeCodeString(sSrc:String):String;
{var
  Dest:array[0..1024] of Char;
  nDest:Integer;}
begin
  if sSrc = '' then exit;
  {if (nDeCryptString >= 0) and Assigned(PlugProcArray[nDeCryptString].nProcAddr) then begin
    FillChar(Dest,SizeOf(Dest),0);
    TDeCryptString(PlugProcArray[nDeCryptString].nProcAddr)(@sSrc[1],@Dest,length(sSrc),nDest);
    Result:=strpas(PChar(@Dest));
    exit;
  end;}
  Result:=sSrc;
//  DeCryptString(@sSrc[1],@Dest,length(sSrc),nDest);

end;
procedure TFrmDB.DeCodeStringList(StringList: TStringList);
var
  I: Integer;
  sLine:String;
begin
  if StringList.Count > 0 then begin
    sLine:=StringList.Strings[0];
    if not CompareLStr(sLine,sENCYPTSCRIPTFLAG,length(sENCYPTSCRIPTFLAG)) then begin
      exit;
    end;
  end;

  for I := 0 to StringList.Count - 1 do begin
    sLine:=StringList.Strings[I];
    sLine:=DeCodeString(sLine);
    StringList.Strings[I]:=sLine;
  end;
end;


procedure TFrmDB.LoadListCall(sLoadName: string; var LoadList: TStringList);
  function LoadCallList(sFileName, sLabel: string; nIdx: Integer; var List: TStringList): Boolean;
  var
    i: Integer;
    LoadStrList: TStringList;
    bo1D: Boolean;
    s18: string;
  begin
    Result := False;
    if MyFileExists(sFileName) then begin
      LoadStrList := TMsgStringList.Create;
      LoadStrList.LoadFromFile(sFileName);
      DeCodeStringList(LoadStrList);
      sLabel := '[' + sLabel + ']';
      bo1D := False;
      for i := 0 to LoadStrList.Count - 1 do begin
        s18 := Trim(LoadStrList.Strings[i]);
        if s18 <> '' then begin
          if not bo1D then begin
            if (s18[1] = '[') and (CompareText(s18, sLabel) = 0) then begin
              bo1D := True;
              //List.Add(s18);
            end;
          end
          else begin
            if s18 <> '{' then begin
              if s18 = '}' then begin
                //bo1D := False;
                Result := True;
                break;
              end
              else begin
                //List.Add(s18);
                List.Insert(nIdx, s18);
                Inc(nIdx);
              end;
            end;
          end;
        end; //00489CE4 if s18 <> '' then begin
      end; // for I := 0 to LoadStrList.Count - 1 do begin
      LoadStrList.Free;
    end;
  end;
var
  i: Integer;
  s14, s18, s1C, s20, s34: string;
  Ing, nIdx, nCount: Integer;
  CallNameList: TStringList;
begin
  i := 0;
  Ing := 0;
  CallNameList := TStringList.Create;
  while (I < LoadList.Count) do begin //Jason 071209ÐÞ¸Ä
    if Ing > 5000 then begin
      MainOutMessage('#CALLµ÷ÓÃËÀÑ­»· ' + sLoadName);
      break;
    end;
    s14 := Trim(LoadList.Strings[i]);
    if (s14 <> '') and (s14[1] = '#') and (CompareLStr(s14, '#CALL', Length('#CALL'))) then begin
      Inc(Ing);
      s14 := ArrestStringEx(s14, '[', ']', s1C);
      s20 := Trim(s1C);
      s18 := Trim(s14);
      if s20[1] = '\' then
        s20 := Copy(s20, 2, Length(s20) - 1);
      if s20[2] = '\' then
        s20 := Copy(s20, 3, Length(s20) - 2);
      s34 := g_Config.sEnvirDir + 'QuestDiary\' + s20;
      LoadList.Strings[i] := '';

      nIdx := CallNameList.IndexOf(s20 + '*' + s18);
      if nIdx > -1 then begin
        nCount := Integer(CallNameList.Objects[nIdx]);
        Inc(nCount);
        if nCount > 100 then begin
          MainOutMessage('#CALLµ÷ÓÃËÀÑ­»· ' + sLoadName + ' ' + s20 + ' ' + s18);
          break;
        end;
        CallNameList.Objects[nIdx] := TObject(nCount);
      end
      else
        CallNameList.AddObject(s20 + '*' + s18, nil);

      if not LoadCallList(s34, s18, I + 1, LoadList) then begin
        MainOutMessage('¼ÓÔØÎÄ¼þ´íÎó, load fail: ' + s20 + ' ' + s18);
      end;
    end;
    Inc(I);
  end;
  CallNameList.Free;
end;

function  TFrmDB.LoadRejectList(Name:String): TList;        //°ÅºÎÀÚ
var
  sSQLString: String;
  ReJectList: TList;
  ReJectItem: pTBlockItem;
  I: integer;
begin
  sSQLString := 'SELECT * FROM TBL_BLOCKLIST Where FLD_OWNER='''+Name+''' ORDER BY FLD_ID';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  ReJectList:=TList.create;
  try
    Query.Open;
    for i:=0 to Query.RecordCount -1 do begin
      new(ReJectItem);

      ReJectItem.Id := Query.FieldByName('FLD_ID').AsInteger;
      ReJectItem.Owner := Query.FieldByName('FLD_OWNER').AsString;
      ReJectItem.Name := Query.FieldByName('FLD_NAME').AsString;

      ReJectList.Add(ReJectItem);
      Query.next;
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:=ReJectList;
end;


procedure TFrmDB.GetDiceGameItems(PlayObject:TPlayObject); //Ç÷·æ»óÀÚ
var
  str_query,sSendMsg, DiceItemName: string;
  DiceGameItem: TDiceGameItem;
  i, Game, Game2: integer;
  Item :TItem;
  ClientItem:TClientItem;
begin

  Case Random(110) of
    0..1 : Game := 1;       //6°ÔÀÓ
    2..3 : Game := 7;
    4..5 : Game := 13;
    6..7 : Game := 19;
    8..9 : Game := 25;
    10..11 : Game := 31;
    12..13 : Game := 37;
    14..15 : Game := 73;
    16..17 : Game := 49;
    18..19 : Game := 55;
    20..21 : Game := 61;
    22..23 : Game := 67;
    24..25 : Game := 73;
    26..27 : Game := 79;
    28..29 : Game := 85;
    30..31 : Game := 91;
    32..33 : Game := 97;
    34..35 : Game := 103;
    36..37 : Game := 109;
    38..39 : Game := 115;
    40..41 : Game := 121;
    42..43 : Game := 127;
    44..45 : Game := 133;
    46..47 : Game := 139;
    48..49 : Game := 145;
    50..51 : Game := 151;
    52..53 : Game := 157;
    54..55 : Game := 163;
    56..57 : Game := 169;
    58..59 : Game := 175;
    60..61 : Game := 181;
    62..63 : Game := 187;
    64..65 : Game := 193;
    66..67 : Game := 199;
    68..69 : Game := 205;
    70..71 : Game := 211;
    72..73 : Game := 217;
    74..75 : Game := 223;
    76..77 : Game := 229;
    78..79 : Game := 235;
    80..81 : Game := 241;
    82..83 : Game := 247;
    84..85 : Game := 253;
    86..87 : Game := 259;
    88..89 : Game := 265;
    90..91 : Game := 271;
    92..93 : Game := 277;
    94..95 : Game := 283;
    96..97 : Game := 289;
    98..99 : Game := 295;
    100 : Game := 301;    //4°ÔÀÓ
    101 : Game := 305;
    102 : Game := 309;
    103 : Game := 313;
    104 : Game := 317;
    105 : Game := 321;
    106 : Game := 325;
    107 : Game := 329;
    108 : Game := 333;
    109 : Game := 337;
    else begin
     Game := 341;
    end;
  end;


  if Game >= 301 then begin
    Game2 := 3;
    str_query := 'SELECT * FROM TBL_DICEGAME'
                   +' WHERE (FLD_ID = ' + IntToStr(Game)
                   +' OR FLD_ID = ' + IntToStr(Game + 1)
                   +' OR FLD_ID = ' + IntToStr(Game + 2)
                   +' OR FLD_ID = ' + IntToStr(Game + 3) +')' ;
  end else begin
    Game2:= 5;
    str_query := 'SELECT * FROM TBL_DICEGAME'
                   +' WHERE (FLD_ID = ' + IntToStr(Game)
                   +' OR FLD_ID = ' + IntToStr(Game + 1)
                   +' OR FLD_ID = ' + IntToStr(Game + 2)
                   +' OR FLD_ID = ' + IntToStr(Game + 3)
                   +' OR FLD_ID = ' + IntToStr(Game + 4)
                   +' OR FLD_ID = ' + IntToStr(Game + 5) +')' ;
  end;

  UseSQL();

  if str_query <> '' then begin
    str_query := str_query + ' ORDER BY FLD_ID ASC';
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETDICE_FAIL,0,0,0,0,'');
    exit;
  end;


  for i:=0 to Game2 do begin

    if query.eof then
      break;

        DiceItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
        DiceGameItem.ID := Query.FieldByName('FLD_ID').AsInteger;
        DiceGameItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

        Item:=UserEngine.GetStdItem(DiceItemName);
        if Item <> nil then begin
          Item.GetStandardItem(ClientItem.S);

           ClientItem.Dura := Item.DuraMax;
           ClientItem.DuraMax := Item.DuraMax;
           if Item.StdMode in [0,1,3,45,46] then begin      //¹°¾à
            if Item.StdMode = 45 then
              ClientItem.Amount := _MIN(DiceGameItem.Amount,1000)
              else ClientItem.Amount := _MIN(DiceGameItem.Amount,20);
           end else begin
              ClientItem.Amount := 1;
           end;

          DiceGameItem.Items := ClientItem;
          sSendMsg:=sSendMsg + EncodeBuffer(@DiceGameItem,SizeOf(TDiceGameItem)) + '/';
        end;


    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
   // PlayObject.SysMsg(IntToStr(Game) + '    ' + IntToStr(Game2),c_Red,t_Hint );
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_GETDICE ,Integer(Self),0,Game2,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;


procedure TFrmDB.ClientDiceItem(PlayObject: TPlayObject; ID:integer; ItemName:String);    //Ç÷·æ»óÀÚ
var
  str_query: string;
  UserItem: pTUserItem;
  boot:Boolean;
  StdItem:TItem;
  nDateNow: DWord;
  nDateNow2: integer;
  amoin:integer;
  DItemName: String;
begin

  str_query := 'SELECT * FROM TBL_DICEGAME WHERE FLD_ID = ' +IntToStr(ID);

  UseSQL();
  if str_query <> '' then begin
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if Query.eof then
    exit;

  if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
    PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
    exit;
  end;

  New(UserItem);

  DItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
  amoin := Query.FieldByName('FLD_AMOUNT').AsInteger;

    if UserEngine.CopyToUserItemFromName(DItemName, UserItem, amoin) then begin
      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      UserItem.Amount := amoin;
      if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //¹ÝÂ¦
        UserItem.MaxDate := DateTimeToUnix(IncDay(now(),StdItem.DDay));
        UserItem.btValue[19]:=2;
      end;

      if (StdItem.StdMode = 2) and (StdItem.Shape in [18]) then begin  //º¯½ÅÅ»
        UserItem.btValue[19] := 2;
        UserItem.MaxDate := DateTimeToUnix(IncHour(now(),StdItem.DuraMax));
      end;

      if (StdItem.StdMode = 2) and (StdItem.Shape in [20,21,23,27]) then begin  //È£À§º´  È£À§ÁÂ»ç
        UserItem.btValue[19] := 2;
        UserItem.MaxDate := DateTimeToUnix(IncHour(now(),StdItem.DuraMax));
      end;

      PlayObject.AddItemToBag(UserItem,boot);
      if boot then
      PlayObject.SendAddItem(UserItem,1);
      PlayObject.SendDefMessage(SM_GETDICEITEM,0,0,0,0,'');
    end else begin
       DisPose(UserItem);
    end;

end;




procedure TFrmDB.GetShopItems(PlayObject:TPlayObject; sData:String);
var
  str_query,sSendMsg, SeveItemName: string;
  SeveShopItem: TSeveShopItem;
  i: integer;
  Item :TItem;
  ClientItem:TClientItem;
  Section, Job, CurrPage, Sort: integer;
  infostr, temp, SearchString: String;
begin

  sData := GetValidStr3(sData, infostr, ['/']);
  if infostr <> '' then begin
     infostr := GetValidStr3(InfoStr, temp, [':']);
     Section := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     Job := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     CurrPage := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     Sort := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     SearchString := StringReplace(temp,#039,'a',[rfReplaceAll]);
  end;

  case Section of
    0: begin//½Å±Ô

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_MODE = 3 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_MODE = 3 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    1: begin//ÀüÃ¼

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_SELL = FALSE ';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE ';
      end;
    end;
    2: begin//º¸Á¶¾ÆÀÌÅÛ

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 1'
                   +' OR FLD_CLASS = 2'
                   +' OR FLD_CLASS = 3'
                   +') AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 1'
                   +' OR FLD_CLASS = 2'
                   +' OR FLD_CLASS = 3'
                   +') AND FLD_JOB = ' +  IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;

    end;
    3: begin//ÆÐÅ°Áö

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 4 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 4 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;
    end;
    4: begin//Æ¯º°¾ÆÀÌÅÛ

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 5'
                   +' OR FLD_CLASS = 6'
                   +' OR FLD_CLASS = 7'
                   +' OR FLD_CLASS = 8'
                   +' OR FLD_CLASS = 9'
                   +') AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 5'
                   +' OR FLD_CLASS = 6'
                   +' OR FLD_CLASS = 7'
                   +' OR FLD_CLASS = 8'
                   +' OR FLD_CLASS = 9'
                   +') AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    5: begin//º¸Á¶ - ¹°¾à

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 1 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 1 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;
    end;
    6: begin//º¸Á¶ - ÁÖ¹®¼­

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 2 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 2 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;
    end;
    7: begin//º¸Á¶ - ±âÅ¸

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 3 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 3 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;
    end;
    8: begin//Æ¯º° - ¾Æ¹ÙÅ¸

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 5 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 5 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;
    end;
    9: begin //Æ¯º° - Ã¤ÆÃ

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 6 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 6 AND FLD_JOB = ' +  IntToStr(Job)  + ' AND FLD_SELL = FALSE';
      end;

    end;
    10: begin //Æ¯º° - Å»°Í

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 7 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 7 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    11: begin//Æ¯º° - Æê

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 8 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 8 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    12: begin//Æ¯º° - ±âÅ¸

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 9 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 9 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;

    16: begin//¿µ¹°

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 10'
                   +' OR FLD_CLASS = 11'
                   +' OR FLD_CLASS = 12'
                   +' OR FLD_CLASS = 13'
                   +') AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM'
                   +' WHERE (FLD_CLASS = 10'
                   +' OR FLD_CLASS = 11'
                   +' OR FLD_CLASS = 12'
                   +' OR FLD_CLASS = 13'
                   +') AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    17: begin//¿µ¹° - ¿µ¹°¾Ë

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 10 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 10 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    18: begin//¿µ¹° - ¿µ¹°¾Ë

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 11 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 11 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    19: begin//¿µ¹° - ¿µ¹°¾Ë

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 12 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 12 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;
    20: begin//¿µ¹° - ¿µ¹°¾Ë

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 13 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 13 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;

    21: begin//¿µ¿õ

      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 14 AND FLD_SELL = FALSE';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE FLD_CLASS = 14 AND FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE';
      end;
    end;

    100: begin//°Ë»ö
      if Job = 9 then begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE (FLD_SELL = FALSE'+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
      end else begin
        str_query := 'SELECT * FROM TBL_SHOPITEM WHERE (FLD_JOB = ' + IntToStr(Job) + ' AND FLD_SELL = FALSE'+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
      end;
    end;

  end;


  UseSQL();

  if str_query <> '' then begin
    case Sort of
       1: str_query := str_query + ' ORDER BY FLD_PRICE ASC'; //³·Àº°¡°Ý
       2: str_query := str_query + ' ORDER BY FLD_PRICE DESC'; //Å«°¡°Ý
       else begin
        str_query := str_query + ' ORDER BY FLD_ID';
       end;
    end;

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETSHOPITEMS_FAIL,0,Section,0,0,'');
    exit;
  end;

  Query.MoveBy((8*CurrPage)-8);

  for i:=0 to 7 do begin

    if query.eof then
      break;

        SeveItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
        SeveShopItem.ShopItemPrice := Query.FieldByName('FLD_PRICE').AsInteger;
        SeveShopItem.shopItemnew := Query.FieldByName('FLD_MODE').AsInteger;
        SeveShopItem.shopItemAmount := Query.FieldByName('FLD_AMOUNT').AsInteger;

        Item:=UserEngine.GetStdItem(SeveItemName);
        if Item <> nil then begin
          Item.GetStandardItem(ClientItem.S);

           ClientItem.Dura := Item.DuraMax;
           ClientItem.DuraMax := Item.DuraMax;
           if Item.StdMode in [0,1,3,45,46] then begin      //¹°¾à
            if Item.StdMode = 45 then
              ClientItem.Amount := _MIN(SeveShopItem.shopItemAmount,1000)
              else ClientItem.Amount := _MIN(SeveShopItem.shopItemAmount,400);
           end else begin
              ClientItem.Amount := 1;
           end;

          SeveShopItem.ShopItems := ClientItem;
          sSendMsg:=sSendMsg + EncodeBuffer(@SeveShopItem,SizeOf(TSeveShopItem)) + '/';
        end;


    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_SHOPITEMLIST ,Integer(Self),CurrPage,ceil(Query.RecordCount / 8),Section);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;



function TFrmDB.savelipiitemn(mename: String; ItemName: String; ToName: string; Amoin,idx:Integer): boolean; //È¯»óÁ¡
var
  str_query: string;
  Item: TItem;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(ItemName);
  if Item = nil then exit;
  str_query := 'INSERT INTO TBL_GIFT (FLD_SENDNAME, FLD_SENDITEM, TLD_RESUNAME, TLD_ITEMAMOIN, TLD_ITNOTE)'+' VALUES ('''+mename+''','''+ItemName+''','''+ToName+''','''+inttostr(Amoin)+''','''+inttostr(idx)+''')';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;

function TFrmDB.SaveMyShopCart(mename: String; ItemName: String; amoin:string): boolean;    //È¯»óÁ¡ °ü½É
var
  str_query: string;
  Item: TItem;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(ItemName);
  if Item = nil then exit;
  str_query := 'INSERT INTO TBL_MYSHOPCART (NAME, SHOPITEM, ITEMAMOIN)'+' VALUES ('''+mename+''','''+ItemName+''','''+amoin+''')';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;


procedure TFrmDB.GiftsAuction(PlayObject: TPlayObject; AuctionID: Integer);    //È¯»óÁ¡ ¼±¹°

var
  str_query: string;
  UserItem: pTUserItem;
  boot:Boolean;
  StdItem:TItem;
  nDateNow: DWord;
  nDateNow2: integer;
  amoin:integer;
  ItemName: String;
begin

  str_query := 'SELECT * FROM TBL_GIFT WHERE FLD_ID = ' +inttostr(AuctionID);

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  // Ã»ÓÐ½á¹û-ÍË³ö
  if Query.eof then
    exit;

  if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
    PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
    exit;
  end;

  New(UserItem);

  ItemName := Query.FieldByName('FLD_SENDITEM').AsString;
  amoin := Query.FieldByName('TLD_ITEMAMOIN').AsInteger;

  str_query := 'DELETE FROM TBL_GIFT WHERE FLD_ID = ' +inttostr(AuctionID);
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;


  if query.RowsAffected <> 0 then begin

    if UserEngine.CopyToUserItemFromName(ItemName, UserItem, amoin) then begin
      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      if (StdItem.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,62,64,101,102]) and (StdItem.DDay > 0) then begin  //¹ÝÂ¦
        UserItem.MaxDate:=DateTimeToUnix(IncDay(now(),(StdItem.DDay)));
        UserItem.btValue[19]:=2;
      end;

      if (StdItem.StdMode = 2) and (StdItem.Shape in [18]) then begin  //º¯½ÅÅ»
        UserItem.MaxDate:=DateTimeToUnix(IncHour(now(),(StdItem.DuraMax)));
        UserItem.btValue[19]:=2;
      end;

      if (StdItem.StdMode = 2) and (StdItem.Shape in [20,21,23,27]) then begin  //È£À§º´  È£À§ÁÂ»ç
        UserItem.MaxDate:=DateTimeToUnix(IncDay(now(),(StdItem.DuraMax)));
        UserItem.btValue[19]:=2;
      end;
      PlayObject.AddItemToBag(UserItem,boot);
      if boot then
      PlayObject.SendAddItem(UserItem,1);
      PlayObject.Giftstlisopen(PlayObject);
    end else begin
       DisPose(UserItem);
    end;

  end;
end;

function  TFrmDB.LoadGiftsidx(Name:String): Integer;       //È¯»óÁ¡ ¼±¹°
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_GIFT Where TLD_RESUNAME='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;


procedure TFrmDB.DellMyShopCart(mename: String);    //È¯»óÁ¡ °ü½É
var
  str_query: string;
begin
    str_query := 'DELETE FROM TBL_MYSHOPCART WHERE NAME ='''+mename+'''';
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;
end;

procedure TFrmDB.DellMyShopCartItem(AuctionID: Integer);    //È¯»óÁ¡ °ü½É
var
  str_query: string;
begin
    str_query := 'DELETE FROM TBL_MYSHOPCART WHERE ID = ' +inttostr(AuctionID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;
end;

function TFrmDB.LoadGiftsItemList(Name:String): TList;   //È¯»óÁ¡
var
  sSQLString:String;
  output:TList;
  Item:pTseveGiveItem;
  I:integer;
begin
  sSQLString := 'SELECT * FROM TBL_GIFT Where TLD_RESUNAME='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  output:=TList.create;
  try
    Query.Open;
    for i:=0 to Query.RecordCount -1 do begin
      new(Item);
      Item.annid  := Query.FieldByName('FLD_ID').AsInteger;
      Item.mename := Query.FieldByName('FLD_SENDNAME').AsString;
      Item.Itemname := Query.FieldByName('FLD_SENDITEM').AsString;
      Item.toname := Query.FieldByName('TLD_RESUNAME').AsString;
      Item.Itemamon := Query.FieldByName('TLD_ITEMAMOIN').AsInteger;
      Item.Itemop := Query.FieldByName('TLD_ITNOTE').AsInteger;      
      output.Add(Item);
      Query.next;
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:=output;
end;

function  TFrmDB.LoadShopcartItemList(Name:String): TList;        //È¯»óÁ¡ °ü½É
var
  sSQLString:String;
  output:TList;
  Item:PTShopCart;
  I:integer;
begin
  sSQLString := 'SELECT * FROM TBL_MYSHOPCART Where NAME='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  output:=TList.create;
  try
    Query.Open;
    for i:=0 to Query.RecordCount -1 do begin
      new(Item);
      Item.Itemidx := Query.FieldByName('ID').AsInteger;
      Item.mename := Query.FieldByName('NAME').AsString;
      Item.Itemname := Query.FieldByName('SHOPITEM').AsString;
      Item.amoins := Query.FieldByName('ITEMAMOIN').AsString;
      output.Add(Item);
      Query.next;
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:=output;
end;

//´ë¿© DB=============================================================================================

function TFrmDB.RentalItem(Useritem: pTUserItem;  RentalName, Name: string; Day:integer): boolean;       //´ë¿©
var
  str_query: string;
  Item: TItem;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;

                                                            //ºô¸°»ç¶÷ //ºô¸°»ç¶÷ ¾ÆÀÌµð //ºô·ÁÁØ»ç¶÷
  str_query := 'INSERT INTO TBL_RENTAL (FLD_START, FLD_END, FLD_RENTNER, FLD_OWNER, FLD_ITEMNAME, FLD_MAKEINDEX, FLD_WINDEX, FLD_STDMODE, FLD_AMOUNT, FLD_DURA, FLD_MAXDURA, FLD_ADDITIONAL_0, FLD_ADDITIONAL_1, FLD_ADDITIONAL_2,'
   +' FLD_ADDITIONAL_3, FLD_ADDITIONAL_4, FLD_ADDITIONAL_5, FLD_ADDITIONAL_6, FLD_ADDITIONAL_7, FLD_ADDITIONAL_8, FLD_ADDITIONAL_9, FLD_ADDITIONAL_10, FLD_ADDITIONAL_11,'
   +' FLD_ADDITIONAL_12, FLD_ADDITIONAL_13, FLD_ADDITIONAL_14, FLD_ADDITIONAL_15, FLD_ADDITIONAL_16, FLD_ADDITIONAL_17, FLD_ADDITIONAL_18, FLD_ADDITIONAL_19, FLD_RETURN)'
   +' VALUES ('''+IntToStr(UnixTime)+''',''' +IntToStr(DateTimeToUnix(IncDay(now, Day))) +''','''+RentalName+''','''+Name+''',''' +Item.Name +''',''' +inttostr(UserItem.MakeIndex) +''',''' +inttostr(UserItem.wIndex) +''',''' +inttostr(Item.StdMode) +''',''' +inttostr(UserItem.Amount) +''''
   +',''' +inttostr(UserItem.Dura) +''',''' +inttostr(UserItem.DuraMax) +''',''' +inttostr(UserItem.btValue[0]) +''',''' +inttostr(UserItem.btValue[1]) +''',''' +inttostr(UserItem.btValue[2]) +''''
   +',''' +inttostr(UserItem.btValue[3]) +''',''' +inttostr(UserItem.btValue[4]) +''',''' +inttostr(UserItem.btValue[5]) +''',''' +inttostr(UserItem.btValue[6]) +''',''' +inttostr(UserItem.btValue[7]) +''''
   +',''' +inttostr(UserItem.btValue[8]) +''',''' +inttostr(UserItem.btValue[9]) +''',''' +inttostr(UserItem.btValue[10]) +''',''' +inttostr(UserItem.btValue[11]) +''',''' +inttostr(UserItem.btValue[12]) +''''
   +',''' +inttostr(UserItem.btValue[13]) +''',''' +inttostr(UserItem.btValue[14]) +''',''' +inttostr(UserItem.btValue[15]) +''',''' +inttostr(UserItem.btValue[16]) +''''
   +',''' +inttostr(UserItem.btValue[17]) +''',''' +inttostr(UserItem.btValue[18]) +''',''' +inttostr(UserItem.btValue[19]) +''', FALSE)';

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;

procedure TFrmDB.GetRentalItems(PlayObject: TPlayObject);    //´ë¿©DB    ³»°¡ ºô¸°ÅÛ

var
  str_query,sSendMsg: string;

  RentalItem: TRentalItem;
  i: integer;

  UserItem: TUserItem;
  Item:TItem;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  opt: integer;
begin

  str_query := 'SELECT * FROM TBL_RENTAL'
               +' WHERE (FLD_RENTNER = '''+PlayObject.m_sCharName +''')' +' AND (FLD_RETURN = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')';


  UseSQL();

  if str_query <> '' then begin
    str_query := str_query +' ORDER BY FLD_END ASC';  //³·Àº¼ýÀÚ Á¤·Ä

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETRENTALITEMS_FAIL,0,0,0,0,'');
    exit;
  end;

  for i:=0 to 1 do begin

    if query.eof then
      break;

    RentalItem.RentalID  := Query.FieldByName('FLD_RENTALID').AsInteger;
    RentalItem.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    RentalItem.EndTime   := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));
    RentalItem.Owner    :=  Query.FieldByName('FLD_OWNER').AsString;
    RentalItem.Rentner  := Query.FieldByName('FLD_RENTNER').AsString;


    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      opt := Item.GetItemAddValue(@UserItem,StdItem);

      ClientItem.S := StdItem;
      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount := UserItem.Amount;
      ClientItem.UpgradeOpt := opt;
      RentalItem.Item := ClientItem;

      sSendMsg:=sSendMsg + EncodeBuffer(@RentalItem,SizeOf(TRentalItem)) + '/';
    end;

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_RENTALITEMS,Integer(Self),0,0,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;


procedure TFrmDB.GetOwnerItems(PlayObject: TPlayObject);    //´ë¿©DB   ³»°¡ ºô·ÁÁØÅÛ

var
  str_query,sSendMsg: string;

  OwnerItem: TOwnerItem;
  i: integer;

  UserItem: TUserItem;
  Item:TItem;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  opt: integer;
begin

  str_query := 'SELECT * FROM TBL_RENTAL' +' WHERE (FLD_OWNER = ''' +PlayObject.m_sCharName +''')';
  UseSQL();

  if str_query <> '' then begin
    str_query := str_query +' ORDER BY FLD_END ASC';   //³·Àº¼ýÀÚ Á¤·Ä

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETRENTALITEMS_FAIL2,0,0,0,0,'');
    exit;
  end;

  for i:=0 to 1 do begin

    if query.eof then
      break;

    OwnerItem.RentalID  := Query.FieldByName('FLD_RENTALID').AsInteger;
    OwnerItem.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    OwnerItem.EndTime   := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));
    OwnerItem.Owner    :=  Query.FieldByName('FLD_OWNER').AsString;
    OwnerItem.Rentner  := Query.FieldByName('FLD_RENTNER').AsString;

    if (OwnerItem.EndTime < Now) then begin
       OwnerItem.Withdraw := True;
    end else begin
     if GetBoolean(Query,'FLD_RETURN') then
       OwnerItem.Withdraw := True
     else
       OwnerItem.Withdraw := False;
    end;

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      opt := Item.GetItemAddValue(@UserItem,StdItem);

      ClientItem.S := StdItem;
      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount := UserItem.Amount;
      ClientItem.UpgradeOpt := opt;
      OwnerItem.Item := ClientItem;

      sSendMsg:=sSendMsg + EncodeBuffer(@OwnerItem,SizeOf(TOwnerItem)) + '/';
    end;

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_RENTALITEMS2,Integer(Self),0,0,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;



procedure TFrmDB.RRentalItem(PlayObject: TPlayObject; RentalID: Integer);    //´ë¿©
var
  str_query: string;
  boFind:Boolean;
  i,nMakeIndex:integer;
  StdItem      :TItem;
  UserItem     :pTUserItem;
begin
  boFind := False;
  str_query := 'SELECT * FROM TBL_RENTAL WHERE FLD_RENTALID = ' +inttostr(RentalID);

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then exit;

  if GetBoolean(Query,'FLD_RETURN') then begin
    PlayObject.SysMsg('ÎïÆ·±»°ó¶¨ÁË¡£',c_Red,t_Hint);
    exit;
  end;

  if UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString)) < now then begin
    PlayObject.SysMsg('ÎïÆ·ÒÑ¾­¹ýÆÚ£¬',c_Red,t_Hint);
    exit;
  end;

  nMakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;

  for i:=Low(THumanUseItems) to High(THumanUseItems) do begin
    if PlayObject.m_UseItems[i].wIndex > 0 then begin
      StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[i].wIndex);
      if StdItem <> nil then begin
        if PlayObject.m_UseItems[i].MakeIndex = nMakeIndex then begin
          if (PlayObject.m_UseItems[I].btValue[19] = 1) then begin    //´ë¿© ¾ÆÀÌÅÛ
            boFind := True;
            PlayObject.SendDelItems(@PlayObject.m_UseItems[I]);
            PlayObject.m_UseItems[I].wIndex := 0;
            PlayObject.RecalcAbilitys();
            PlayObject.SendMsg(PlayObject,RM_ABILITY,0,0,0,0,'');
            PlayObject.SendMsg(PlayObject,RM_SUBABILITY,0,0,0,0,'');
            PlayObject.FeatureChanged();
            PlayObject.SysMsg('ÄãÍË»ØÁË×âÁÞµÄÎïÆ·'+ StdItem.Name +' ¡£',c_Green,t_Hint);
            Break;
          end;
        end;
      end;
    end;
  end;

  if not boFind then begin
    for I := PlayObject.m_ItemList.Count - 1 downto 0 do begin
      UserItem := pTUserItem(PlayObject.m_ItemList.Items[I]);
      StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
      if UserItem.MakeIndex = nMakeIndex then begin
        if (UserItem.btValue[19] = 1) then begin  //´ë¿© ¾ÆÀÌÅÛ °¡¹æ
          boFind := True;
          PlayObject.m_ItemList.Delete(I);
          PlayObject.SendDelItems(UserItem);
          Dispose(UserItem);
          PlayObject.SysMsg('ÄãÍË»ØÁË×âÁÞµÄÎïÆ·'+ StdItem.Name +' ¡£',c_Green,t_Hint);
          Break;
        end;
      end;
    end;
  end;

  str_query := 'UPDATE TBL_RENTAL SET FLD_RETURN = TRUE WHERE (FLD_RENTALID = ' +Inttostr(RentalID) +' AND FLD_RETURN = FALSE)';
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;


  if query.RowsAffected <> 0 then begin
    PlayObject.SendMsg(PlayObject, RM_RENTALGIVE, 0, PlayObject.m_nGold, 0, 0, '');
  end;
end;


procedure TFrmDB.EndOfRental(PlayObject: TPlayObject; RentalID: Integer);    //´ë¿©

var
  str_query: string;
  UserItem: pTUserItem;
  StdItem: TItem;
  boot:Boolean;
begin

  str_query := 'SELECT * FROM TBL_RENTAL WHERE FLD_RENTALID = ' +inttostr(RentalID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

  if (GetBoolean(Query,'FLD_RETURN')) or (UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString)) < now) then begin

    if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
     PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
     exit;
    end;

    New(UserItem);

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    str_query := 'DELETE FROM TBL_RENTAL WHERE FLD_RENTALID = ' +inttostr(RentalID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

    PlayObject.AddItemToBag(UserItem,boot);
    if boot then
    PlayObject.SendAddItem(UserItem,1);
    PlayObject.SendMsg(PlayObject,RM_RENTALGIVE,0,0,1,0,'');

    StdItem := UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem <> nil then begin
      PlayObject.SysMsg('ÄãÊÕµ½ÁË×âÁÞµÄÎïÆ·'+ StdItem.Name +' ¡£',c_Green,t_Hint);
    end;
  end;

end;

function TFrmDB.LoadRentalidx(Name:String): Integer;       //´ë¿©DB
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_RENTAL'
               +' WHERE (FLD_RENTNER = '''+Name+''')' +' AND (FLD_RETURN = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')';

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;

function TFrmDB.LoadOwneridx(Name:String): Integer;       //´ë¿©DB
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_RENTAL Where FLD_OWNER='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;


function TFrmDB.AddAucItem(Useritem: pTUserItem; Cost: String; Name , UserID: string): boolean;       //°æ¸Å
var
  str_query: string;
  Item: TItem;
  PlayObject: TPlayObject;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;


  str_query := 'INSERT INTO TBL_USERAUC (FLD_DATE, FLD_SELLER, FLD_ITEMNAME, FLD_COST, FLD_MAKEINDEX, FLD_WINDEX, FLD_STDMODE, FLD_SHAPE, FLD_MAC, FLD_AMOUNT,'
   +' FLD_DURA, FLD_MAXDURA, FLD_ADDITIONAL_0, FLD_ADDITIONAL_1, FLD_ADDITIONAL_2,'
   +' FLD_ADDITIONAL_3, FLD_ADDITIONAL_4, FLD_ADDITIONAL_5, FLD_ADDITIONAL_6, FLD_ADDITIONAL_7, FLD_ADDITIONAL_8, FLD_ADDITIONAL_9, FLD_ADDITIONAL_10, FLD_ADDITIONAL_11,'
   +' FLD_ADDITIONAL_12, FLD_ADDITIONAL_13, FLD_ADDITIONAL_14, FLD_ADDITIONAL_15, FLD_ADDITIONAL_16, FLD_ADDITIONAL_17, FLD_ADDITIONAL_18, FLD_ADDITIONAL_19, FLD_PRICE, FLD_SOLDNAME, FLD_SELLERID, FLD_SOLD)'
   +' VALUES ('''+FormatDateTime('yyyyÄê mmÔÂ ddÈÕ hhÊ± nn·Ö' , now)+''',''' +Name +''',''' +Item.Name +''',''' +Cost +''',''' +inttostr(UserItem.MakeIndex) +''',''' +inttostr(UserItem.wIndex) +''',''' +inttostr(Item.StdMode) +''''
   +',''' +inttostr(Item.Shape) +''',''' +inttostr(Item.MAC) +''',''' +inttostr(UserItem.Amount) +''''
   +',''' +inttostr(UserItem.Dura) +''',''' +inttostr(UserItem.DuraMax) +''',''' +inttostr(UserItem.btValue[0]) +''',''' +inttostr(UserItem.btValue[1]) +''',''' +inttostr(UserItem.btValue[2]) +''''
   +',''' +inttostr(UserItem.btValue[3]) +''',''' +inttostr(UserItem.btValue[4]) +''',''' +inttostr(UserItem.btValue[5]) +''',''' +inttostr(UserItem.btValue[6]) +''',''' +inttostr(UserItem.btValue[7]) +''''
   +',''' +inttostr(UserItem.btValue[8]) +''',''' +inttostr(UserItem.btValue[9]) +''',''' +inttostr(UserItem.btValue[10]) +''',''' +inttostr(UserItem.btValue[11]) +''',''' +inttostr(UserItem.btValue[12]) +''''
   +',''' +inttostr(UserItem.btValue[13]) +''',''' +inttostr(UserItem.btValue[14]) +''',''' +inttostr(UserItem.btValue[15]) +''',''' +inttostr(UserItem.btValue[16]) +''''
   +',''' +inttostr(UserItem.btValue[17]) +''',''' +inttostr(UserItem.btValue[18]) +''',''' +inttostr(UserItem.btValue[19]) +''',''' +inttostr(0)+''','''+''+''','''+UserID+''',FALSE)';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;


  PlayObject := UserEngine.GetPlayObject(Name);
   if PlayObject <> nil then begin
     if Item.NeedIdentify = 1 then
        AddGameDataLog('43' +  #9 +
               PlayObject.m_sMapName + #9 +
               IntToStr(PlayObject.m_nCurrX) + #9 +
               IntToStr(PlayObject.m_nCurrY) + #9 +
               PlayObject.m_sCharName + #9 +
               Item.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
               IntToStr(UserItem.MakeIndex) + #9 +
               '1' + #9 +
               sSTRING_GOLDNAME + '(' + Cost + ')' + #9
               + '[ÅÄÂôµÇ¼Ç]');
  end;

  Result := True;
end;



procedure TFrmDB.OfAucCost( PlayObject: TPlayObject; MakeIndex: Integer; Cost: string );    //°æ¸Å
var
  str_query: string;
  UserItem: pTUserItem;
  boot:Boolean;
  commision, i :integer;
  ItemName: string;
  StdItem:TItem;
  Play, PlayObject2: TPlayObject;
begin

  str_query := 'SELECT * FROM TBL_USERAUC WHERE FLD_MAKEINDEX = '+ inttostr(MakeIndex);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

   if PlayObject = nil then exit;

     if PlayObject.m_nGold - StrToInt(Cost) < 0 then begin
       PlayObject.BoxMsg('ÄãµÄ½ð±Ò²»×ã¡£', 0);
       exit;
     end;
     PlayObject.DecGold(StrToInt(Cost));
     PlayObject.GoldChanged();

     ItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
     StdItem:=UserEngine.GetStdItem(ItemName);
     if StdItem.NeedIdentify = 1 then
      AddGameDataLog('44' + #9 +
                        PlayObject.m_sMapName + #9 +
                        IntToStr(PlayObject.m_nCurrX) + #9 +
                        IntToStr(PlayObject.m_nCurrY) + #9 +
                        PlayObject.m_sCharName + #9 +
                        StdItem.Name + #9 +
                        IntToStr(MakeIndex) + #9 +
                        '1' + #9 +
                        sSTRING_GOLDNAME + #9 +
                        Cost + #9 + '[ÅÄÂô³ö¼Û]');

     for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
       Play:=TPlayObject(UserEngine.m_PlayObjectList.Objects[i]);
       if Play.m_btRaceServer = RC_PLAYOBJECT then
         Play.SendMsg(Play, RM_AUCBUFF, 0, 0, LoWord(StrToInt(Cost)) , HiWord(StrToInt(Cost)), inttostr(MakeIndex)); //°æ¸Å Á¤º¸ ¾÷µ¥ÀÌÆ®
     end;

     UserEngine.SendBroadCastMsg(PlayObject.m_sCharName + '¶Ô¾ºÅÄÎïÆ·' + ItemName + '³ö¼Û' + GetGoldStr(StrToint(Cost)) + '½ð±Ò¡£', t_Cust2 );


     commision := Query.FieldByName('FLD_PRICE').AsInteger;       //ÀÔÂûÇÑ »ç¶÷
     if commision <> 0 then begin
       PlayObject2 := UserEngine.GetPlayObject(Query.FieldByName('FLD_SOLDNAME').AsString );
       if PlayObject2 <> nil then begin
         PlayObject2.IncGold(commision);
         PlayObject2.GoldChanged();
       end;
     end;

     str_query := 'UPDATE TBL_USERAUC SET FLD_SOLDNAME=''' + PlayObject.m_sCharName + ''', ' +
          'FLD_PRICE=''' + Cost + '''' + ' Where FLD_MAKEINDEX=' + inttostr(MakeIndex);

     Query.SQL.Clear;
     Query.SQL.Add(str_query);
     Query.ExecSQL;

end;


procedure TFrmDB.OfAucEnd( Solder: String; MakeIndex: Integer);    //°æ¸Å
var
  str_query: string;
  UserItem: pTUserItem;
  boot:Boolean;
  commision , nGold, price:integer;
  ItemName: string;
  StdItem:TItem;
  PlayObject, PlayObject2: TPlayObject;
  NoAdd: boolean;
  NoMoney : boolean;
begin
  NoAdd := True;
  NoMoney := True;
  PlayObject := UserEngine.GetPlayObject(Solder);

  str_query := 'SELECT * FROM TBL_USERAUC WHERE FLD_MAKEINDEX = '+ inttostr(MakeIndex);


  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

  nGold := Query.FieldByName('FLD_PRICE').AsInteger;
  commision :=  Query.FieldByName('FLD_COST').AsInteger;
  ItemName  := Query.FieldByName('FLD_ITEMNAME').AsString;

  if nGold <> 0 then begin
    if PlayObject <> nil then begin
      if PlayObject.m_nGold + (nGold + Round(commision * 0.1)) > PlayObject.m_nGoldMax then begin
        PlayObject.BoxMsg(GetGoldStr(PlayObject.m_nGoldMax)+'½ð±ÒµÄ¼Û¸ñÅÄÂôÁË¡£¾ßÌåÇé¿öÇëÁªÏµ¹ÜÀíÔ±½øÐÐÑ¯ÎÊ¡£', 0);
        NoMoney := False;
      end else begin
        PlayObject.IncGold(nGold + Round(commision * 0.1));
        PlayObject.GoldChanged();
        PlayObject.SysMsg('ÄãµÄÎïÆ·³É¹¦ÅÄÂô£¬ÄãÊÕµ½ÁËÅÄÂô×Ê½ðºÍ±£Ö¤½ð¡£',c_GreenWhite,t_Hint);

        StdItem:=UserEngine.GetStdItem(ItemName);
        if StdItem.NeedIdentify = 1 then
          AddGameDataLog('45' + #9 +
                        PlayObject.m_sMapName + #9 +
                        IntToStr(PlayObject.m_nCurrX) + #9 +
                        IntToStr(PlayObject.m_nCurrY) + #9 +
                        PlayObject.m_sCharName + #9 +
                        StdItem.Name + #9 +
                        IntToStr(MakeIndex) + #9 +
                        '1' + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nGold + Round(commision * 0.1)) + #9 + '[ÅÄÂô³É¹¦]');

      end;
    end;

    PlayObject2 := UserEngine.GetPlayObject(Query.FieldByName('FLD_SOLDNAME').AsString);
    if PlayObject2 <> nil then begin
      if PlayObject2.m_ItemList.Count >= MAXBAGITEM then begin
        PlayObject2.SysMsg('ÒòÎªÄãµÄ°ü¹üÂúÁË£¬ËùÒÔÄãÎÞ·¨ÁìÈ¡ÎïÆ·£¬ÇëÁªÏµÓÎÏ·¹ÜÀíÔ±¡£',c_Red,t_Hint);
        NoAdd := False;
      end else begin
        New(UserItem);
        UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
        UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
        UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
        UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
        UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
        UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
        UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
        UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
        UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
        UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
        UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
        UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
        UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
        UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
        UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
        UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
        UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
        UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
        UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
        UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
        UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
        UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
        UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
        UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
        UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

        PlayObject2.AddItemToBag(UserItem,boot);    //¹°¾à
        if boot then
        PlayObject2.SendAddItem(UserItem,1);

        PlayObject2.SysMsg('¾ºÅÄÎïÆ·³É¹¦¡£Äã»ñµÃÁËÎïÆ·' + ItemName + ' ¡£',c_GreenWhite,t_Hint);

        StdItem:=UserEngine.GetStdItem(ItemName);
        if StdItem.NeedIdentify = 1 then
          AddGameDataLog('45' + #9 +
                        PlayObject2.m_sMapName + #9 +
                        IntToStr(PlayObject2.m_nCurrX) + #9 +
                        IntToStr(PlayObject2.m_nCurrY) + #9 +
                        PlayObject2.m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nGold) + #9 +
                        StdItem.Name + '(' + IntToStr(UserItem.Amount) +')' + #9 +
                        IntToStr(0) + #9 + '[ÅÄÂô³É¹¦]');
      end;
    end;
    UserEngine.SendBroadCastMsg(PlayObject2.m_sCharName + 'ÒÔ' + GetGoldStr(nGold) + '½ð±ÒµÄ¼Û¸ñÅÄµ½ÁËÎïÆ·'+ ItemName + '¡£', t_Cust2 );

    if (PlayObject <> nil) and (PlayObject2 <> nil) and NoAdd and NoMoney then begin   //µÑÁß ÇÑ¸íÀÌ¶óµµ ¾øÀ¸¸é µ¥ÀÌÅÍ ³²±ä´Ù
      str_query := 'DELETE FROM TBL_USERAUC WHERE FLD_MAKEINDEX = ' +inttostr(MakeIndex);
    end else begin
     str_query := 'UPDATE TBL_USERAUC SET FLD_SOLD = TRUE WHERE (FLD_MAKEINDEX = ' +Inttostr(MakeIndex) +' AND FLD_SOLD = FALSE)';
    end;
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

  end else begin
    if PlayObject <> nil then begin
      if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
        PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË£¬ÄãÎÞ·¨ÊÕµ½¼ÄÊÛÎïÆ·£¬ÇëÁªÏµÓÎÏ·¹ÜÀíÔ±¡£',c_Red,t_Hint);
        NoAdd := False;
      end else begin
        PlayObject.SysMsg('¹ºÂò¼ÄÊÛÎïÆ·³É¹¦£¬ÄãÊÕµ½ÁË¼ÄÊÛµÄ±£Ö¤½ðºÍÎïÆ·'+ ItemName + '¡£',c_GreenWhite,t_Hint);
        PlayObject.IncGold(Round(commision * 0.1));
        PlayObject.GoldChanged();
        New(UserItem);
        UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
        UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
        UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
        UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
        UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
        UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
        UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
        UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
        UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
        UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
        UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
        UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
        UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
        UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
        UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
        UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
        UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
        UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
        UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
        UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
        UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
        UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
        UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
        UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
        UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;
        PlayObject.AddItemToBag(UserItem,boot);    //¹°¾à
        if boot then
        PlayObject.SendAddItem(UserItem,1);

        StdItem:=UserEngine.GetStdItem(ItemName);
        if StdItem.NeedIdentify = 1 then
         AddGameDataLog('46' + #9 +
                        PlayObject.m_sMapName + #9 +
                        IntToStr(PlayObject.m_nCurrX) + #9 +
                        IntToStr(PlayObject.m_nCurrY) + #9 +
                        PlayObject.m_sCharName + #9 +
                        StdItem.Name + '(' + IntToStr(UserItem.Amount) +')' + #9 +
                        IntToStr(UserItem.MakeIndex) + #9 +
                        '1' + #9 +
                        '0' + #9 + '[¼ÄÊÛÎïÆ·»ØÊÕ]');
      end;
      if NoAdd then begin
        str_query := 'DELETE FROM TBL_USERAUC WHERE FLD_MAKEINDEX = ' +inttostr(MakeIndex);
      end else begin
        str_query := 'UPDATE TBL_USERAUC SET FLD_SOLD = TRUE WHERE (FLD_MAKEINDEX = ' +Inttostr(MakeIndex) +' AND FLD_SOLD = FALSE)';
      end;
      Query.SQL.Clear;
      Query.SQL.Add(str_query);
      Query.ExecSQL;
    end else begin
      str_query := 'UPDATE TBL_USERAUC SET FLD_SOLD = TRUE WHERE (FLD_MAKEINDEX = ' +Inttostr(MakeIndex) +' AND FLD_SOLD = FALSE)';
      Query.SQL.Clear;
      Query.SQL.Add(str_query);
      Query.ExecSQL;
    end;


  end;

end;

//=============================================================================================


function TFrmDB.ConsignItem(Useritem: pTUserItem; Cost: String; Name , UserID: string): boolean;       //À§Å¹

var
  str_query: string;
  Item: TItem;
  PlayObject: TPlayObject;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;


  str_query := 'INSERT INTO TBL_AUCTION (FLD_START, FLD_END, FLD_SELLER, FLD_ITEMNAME, FLD_COST, FLD_MAKEINDEX, FLD_WINDEX, FLD_STDMODE, FLD_SHAPE, FLD_MAC, FLD_AMOUNT,'
   +' FLD_DURA, FLD_MAXDURA, FLD_ADDITIONAL_0, FLD_ADDITIONAL_1, FLD_ADDITIONAL_2,'
   +' FLD_ADDITIONAL_3, FLD_ADDITIONAL_4, FLD_ADDITIONAL_5, FLD_ADDITIONAL_6, FLD_ADDITIONAL_7, FLD_ADDITIONAL_8, FLD_ADDITIONAL_9, FLD_ADDITIONAL_10, FLD_ADDITIONAL_11,'
   +' FLD_ADDITIONAL_12, FLD_ADDITIONAL_13, FLD_ADDITIONAL_14, FLD_ADDITIONAL_15, FLD_ADDITIONAL_16, FLD_ADDITIONAL_17, FLD_ADDITIONAL_18, FLD_ADDITIONAL_19, FLD_SOLD, FLD_SELLERID)'
   +' VALUES ('''+IntToStr(UnixTime)+''',''' +IntToStr(DateTimeToUnix(IncDay(now, 7))) +''',''' +Name +''',''' +Item.Name +''',''' +Cost +''',''' +inttostr(UserItem.MakeIndex) +''',''' +inttostr(UserItem.wIndex) +''',''' +inttostr(Item.StdMode) +''''
   +',''' +inttostr(Item.Shape) +''',''' +inttostr(Item.MAC) +''',''' +inttostr(UserItem.Amount) +''''
   +',''' +inttostr(UserItem.Dura) +''',''' +inttostr(UserItem.DuraMax) +''',''' +inttostr(UserItem.btValue[0]) +''',''' +inttostr(UserItem.btValue[1]) +''',''' +inttostr(UserItem.btValue[2]) +''''
   +',''' +inttostr(UserItem.btValue[3]) +''',''' +inttostr(UserItem.btValue[4]) +''',''' +inttostr(UserItem.btValue[5]) +''',''' +inttostr(UserItem.btValue[6]) +''',''' +inttostr(UserItem.btValue[7]) +''''
   +',''' +inttostr(UserItem.btValue[8]) +''',''' +inttostr(UserItem.btValue[9]) +''',''' +inttostr(UserItem.btValue[10]) +''',''' +inttostr(UserItem.btValue[11]) +''',''' +inttostr(UserItem.btValue[12]) +''''
   +',''' +inttostr(UserItem.btValue[13]) +''',''' +inttostr(UserItem.btValue[14]) +''',''' +inttostr(UserItem.btValue[15]) +''',''' +inttostr(UserItem.btValue[16]) +''''
   +',''' +inttostr(UserItem.btValue[17]) +''',''' +inttostr(UserItem.btValue[18]) +''',''' +inttostr(UserItem.btValue[19]) +''', FALSE,'''+UserID+''')';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;

  PlayObject := UserEngine.GetPlayObject(Name);
   if PlayObject <> nil then begin
     if Item.NeedIdentify = 1 then
        AddGameDataLog('32' +  #9 +
               PlayObject.m_sMapName + #9 +
               IntToStr(PlayObject.m_nCurrX) + #9 +
               IntToStr(PlayObject.m_nCurrY) + #9 +
               PlayObject.m_sCharName + #9 +
               Item.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
               IntToStr(UserItem.MakeIndex) + #9 +
               '1' + #9 +
               sSTRING_GOLDNAME + '(' + Cost + ')'+ #9 +
               '[¼ÄÊÛµÇ¼Ç]');
  end;

  Result := True;
end;

procedure TFrmDB.GetAuctionItems(sData: String; PlayObject: TPlayObject);    //À§Å¹
var
  str_query, sSendMsg, infostr, temp, SearchString: string;

  AuctionItem: TAuctionItem;
  i, Section, CurrPage, Sort: integer;

  UserItem: TUserItem;
  Item:TItem;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  opt: integer;
  sUserItemName, stditemname: string;
begin

  sData := GetValidStr3(sData, infostr, ['/']);
  if infostr <> '' then begin
     infostr := GetValidStr3(InfoStr, temp, [':']);
     Section := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     CurrPage := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     Sort := StrToInt(temp);
     infostr := GetValidStr3(InfoStr, temp, [':']);
     SearchString := StringReplace(temp,#039,'a',[rfReplaceAll]);
  end;


  case Section of
  0: begin//ÀüÃ¼
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION WHERE (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
     str_query := 'SELECT * FROM TBL_AUCTION WHERE (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  1: begin//¹«±â
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION' +' WHERE (FLD_STDMODE = 5' +' OR FLD_STDMODE = 6' +' OR FLD_STDMODE = 99'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION' +' WHERE (FLD_STDMODE = 5' +' OR FLD_STDMODE = 6' +' OR FLD_STDMODE = 99'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  2: begin//¹æ¾î±¸
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 10'+' OR FLD_STDMODE = 11' +' OR FLD_STDMODE = 15'
                   +' OR FLD_STDMODE = 62' +' OR FLD_STDMODE = 64'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 10'+' OR FLD_STDMODE = 11' +' OR FLD_STDMODE = 15'
                   +' OR FLD_STDMODE = 62' +' OR FLD_STDMODE = 64'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  3: begin//Åõ±¸
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 15 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 15 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  4: begin//°©¿Ê
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 10'+' OR FLD_STDMODE = 11' +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 10'+' OR FLD_STDMODE = 11' +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  5: begin //Çã¸®¶ì
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 64 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 64 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  6: begin //½Å¹ß
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 62 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE FLD_STDMODE = 62 AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;


  7: begin//Àå½Å±¸
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 19'+' OR FLD_STDMODE = 20'+' OR FLD_STDMODE = 21'
                   +' OR FLD_STDMODE = 22'+' OR FLD_STDMODE = 23'+' OR FLD_STDMODE = 24'+' OR FLD_STDMODE = 26'
                   +' OR FLD_STDMODE = 63'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 19'+' OR FLD_STDMODE = 20'+' OR FLD_STDMODE = 21'
                   +' OR FLD_STDMODE = 22'+' OR FLD_STDMODE = 23'+' OR FLD_STDMODE = 24'+' OR FLD_STDMODE = 26'
                   +' OR FLD_STDMODE = 63'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  8: begin//¸ñ°ÉÀÌ
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 19'+' OR FLD_STDMODE = 20'
                   +' OR FLD_STDMODE = 21'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 19'+' OR FLD_STDMODE = 20'
                   +' OR FLD_STDMODE = 21'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  9: begin//¹ÝÁö
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 22'
                   +' OR FLD_STDMODE = 23'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 22'
                   +' OR FLD_STDMODE = 23'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  10: begin//ÆÈÂî
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 24'
                   +' OR FLD_STDMODE = 26'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 24'
                   +' OR FLD_STDMODE = 26'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  11: begin//¼öÈ£¼®
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 63'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 63'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  12: begin//¼Ò¸ðÇ° (È¸º¹,°­È­,¼ö¸®,ÀÌµ¿¼­,±âÅ¸)
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'
                   +' WHERE (FLD_STDMODE = 0'
                   +' OR FLD_STDMODE = 2'
                   +' OR (FLD_STDMODE = 3 AND FLD_SHAPE = 12)'
                   +' OR FLD_STDMODE = 59'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 0'
                   +' OR FLD_STDMODE = 2'+' OR FLD_STDMODE = 3'
                   +' OR FLD_STDMODE = 59'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  13: begin//È¸º¹
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 0'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 0'+' OR FLD_STDMODE = 59'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  14: begin//°­È­
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 3 AND FLD_SHAPE = 12)'
                   +' OR (FLD_STDMODE = 2 AND FLD_SHAPE IN (13,14,15,16,17,22,23,24,25,26,27,28,30,45))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 3 AND FLD_SHAPE = 12)'
                   +' OR (FLD_STDMODE = 2 AND FLD_SHAPE IN (13,14,15,16,17,22,23,24,25,26,27,28,30,45))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  15: begin//¼ö¸®
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 2 AND FLD_SHAPE IN (9,10))'
                   +' OR FLD_STDMODE = 59'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 2 AND FLD_SHAPE IN (9,10))'
                   +' OR FLD_STDMODE = 59'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  16: begin//ÀÌµ¿¼­
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 3 AND FLD_SHAPE IN (1,2,3,4,5))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 2 AND FLD_SHAPE IN (1,2,3,4,5))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  17: begin//±âÅ¸
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 3 AND FLD_SHAPE IN (6,7,8))'
                   +' OR (FLD_STDMODE = 2 AND FLD_SHAPE IN (7,11,18,31))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE ((FLD_STDMODE = 2 AND FLD_SHAPE IN (6,7,8))'
                   +' OR (FLD_STDMODE = 2 AND FLD_SHAPE IN (7,11,18,31))'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  18: begin//Àåºñ°­È­  (º¸¿Á,½ÅÁÖ,Ãà±â,±¤¼®)
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 37'+' OR FLD_STDMODE = 43'
                   +' OR FLD_STDMODE = 60'+' OR FLD_STDMODE = 61'+' OR (FLD_STDMODE = 2 AND FLD_SHAPE = 4)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'

    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 37'+' OR FLD_STDMODE = 43'
                   +' OR FLD_STDMODE = 60'+' OR FLD_STDMODE = 61'+' OR (FLD_STDMODE = 2 AND FLD_SHAPE = 4)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  19: begin //º¸¿Á
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 60'+' OR (FLD_STDMODE = 37 AND FLD_MAC = 0)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 60'+' OR (FLD_STDMODE = 37 AND FLD_MAC = 0)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  20: begin //½ÅÁÖ
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 61'+' OR (FLD_STDMODE = 37 AND FLD_MAC = 1)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 61'+' OR (FLD_STDMODE = 37 AND FLD_MAC = 1)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  21: begin //Ãà±â
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 2 AND FLD_SHAPE = 4'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 2 AND FLD_SHAPE = 4'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  22: begin //±¤¼®
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 43'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 43'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  23: begin //¹«°øÃ¥
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  24: begin //Àü»ç¹«°ø
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 0'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 0'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  25: begin //¼ú»ç¹«°ø
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 1'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 1'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  26: begin //µµ»ç¹«°ø
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 2'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 2'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;
  27: begin //ÀÚ°´¹«°ø
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 3'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 3'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  28: begin //Äù½ºÆ®
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE IN (36,40,41,44,45,47)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE IN (36,40,41,44,45,47)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  29: begin //±âÅ¸
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE IN (70,71,72,73,74,80,81,82,83,84,101,102)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE IN (70,71,72,73,74,80,81,82,83,84,101,102)'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;


  31: begin//º»ÀÎ               //À§Å¹
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_SELLER = ''' +PlayObject.m_sCharName +''''
                   +' AND FLD_SELLERID = ''' +PlayObject.m_sUserID +''')';
  end;

  32: begin //½Â·Á¹«°ø
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 4'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 4 AND FLD_SHAPE = 4'
                   +') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)+' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  33: begin //°¢¼º
    if searchstring = '' then
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 46'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime) +')'
    else
      str_query := 'SELECT * FROM TBL_AUCTION'+' WHERE (FLD_STDMODE = 46'+') AND (FLD_SOLD = FALSE AND FLD_END > ' +IntToStr(UnixTime)
                   +' AND FLD_ITEMNAME LIKE ''' +'%' +SearchString +'%' +''')';
  end;

  end;


  UseSQL();

  if str_query <> '' then begin

    case Sort of
       1: str_query := str_query + ' ORDER BY FLD_COST ASC'; //³·Àº°¡°Ý
       2: str_query := str_query + ' ORDER BY FLD_COST DESC'; //Å«°¡°Ý
       else begin
        str_query := str_query +' ORDER BY FLD_END DESC'; //ÃÖ±Ù¼øÀ¸·Î Á¤·Ä
       end;
    end;

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETAUCTIONITEMS_FAIL,0,Section,0,0,'');
    exit;
  end;

  Query.MoveBy((10*CurrPage)-10);

  for i:= 0 to 9 do begin

    if query.eof then
      break;

    AuctionItem.AuctionID := Query.FieldByName('FLD_AUCTIONID').AsInteger;
    AuctionItem.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    AuctionItem.EndTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));
    AuctionItem.Cost := Query.FieldByName('FLD_COST').AsInteger;

    if Section = 31 then begin

      // ¼ì²âÆÚÏÞ
      if (Auctionitem.EndTime < Now) then begin
        if GetBoolean(Query,'FLD_SOLD') then
          AuctionItem.Seller := '¼ÄÊÛ³É¹¦'
        else
          AuctionItem.Seller := '¼ÄÊÛµ½ÆÚ';
      end else begin
        if GetBoolean(Query,'FLD_SOLD') then
          AuctionItem.Seller := '¼ÄÊÛ³É¹¦'
        else
          AuctionItem.Seller := '¼ÄÊÛÖÐ';
      end;

    end else
      AuctionItem.Seller := Query.FieldByName('FLD_SELLER').AsString;

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if not (Item.StdMode in [2,46]) then begin

      if (Item.Reserved and 16 <> 0) then begin
        stditemname:= FilterStdShowName(Item,Item.Name);
        if (PlayObject.m_btJob in [g_Bonze,g_BonzeUp]) then begin         //½Â·Á
          if PlayObject.m_WAbil.Level >= 80 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '60');
          end else if PlayObject.m_WAbil.Level >= 70 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '50');
          end else if PlayObject.m_WAbil.Level >= 60 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '40');
          end else if PlayObject.m_WAbil.Level >= 50 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '30');
          end else if PlayObject.m_WAbil.Level >= 40 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '20');
          end else if PlayObject.m_WAbil.Level >= 30 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '10');
          end else begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '00');
          end;
        end else begin
          if PlayObject.m_WAbil.Level >= 80 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '6');
          end else if PlayObject.m_WAbil.Level >= 70 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '5');
          end else if PlayObject.m_WAbil.Level >= 60 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '4');
          end else if PlayObject.m_WAbil.Level >= 50 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '3');
          end else if PlayObject.m_WAbil.Level >= 40 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '2');
          end else if PlayObject.m_WAbil.Level >= 30 then begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName + '1');
          end else begin
            UserItem.wIndex:=UserEngine.GetStdItemIdx(StdItemName);
          end;
        end;
        Item:=UserEngine.GetStdItem(UserItem.wIndex);
      end;

      if (Item.Reserved and 32 <> 0) then begin
        stditemname := FilterStdShowName(Item,Item.Name);
        if (PlayObject.m_btJob in [g_Warrior,g_WarriorUp]) then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '1');
        if (PlayObject.m_btJob in [g_Wizard,g_WizardUp])then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '2');
        if (PlayObject.m_btJob in [g_Monk,g_MonkUp]) then
          UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '3');
        if (PlayObject.m_btJob in [g_Assassin,g_AssassinUp]) then                     //ÀÚ°´
          UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '4');
        if (PlayObject.m_btJob in [g_Bonze,g_BonzeUp]) then                         //½Â·Á
          UserItem.wIndex:=UserEngine.GetStdItemIdx(stditemname + '5');
        Item:=UserEngine.GetStdItem(UserItem.wIndex);
      end;
    end;

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      opt := Item.GetItemAddValue(@UserItem,StdItem);

      sUserItemName := '';
      sUserItemName := FilterStdShowName(Item,StdItem.Name);
      if UserItem.btValue[11] = 1 then
        sUserItemName := ItemUnit.GetCustomItemName(UserItem.MakeIndex, UserItem.wIndex);
      if sUserItemName <> '' then
        ClientItem.s.Name := FilterStdShowName(Item,sUserItemName);

      ClientItem.S := StdItem;
      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount := UserItem.Amount;      //¹°¾à
      ClientItem.UpgradeOpt := opt;
      AuctionItem.Item := ClientItem;

      sSendMsg:=sSendMsg + EncodeBuffer(@AuctionItem,SizeOf(TAuctionItem)) + '/';
    end;

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_AUCTIONITEMS,Integer(Self),CurrPage,ceil(Query.RecordCount / 10),Section);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;

procedure TFrmDB.BuyAuctionItem(PlayObject: TPlayObject; AuctionID: Integer);    //À§Å¹

var
  str_query: string;
  Cost: Integer;
  UserItem: pTUserItem;
  StdItem :TItem;
  boot:Boolean;
  Seller: string;
begin

  str_query := 'SELECT * FROM TBL_AUCTION WHERE FLD_AUCTIONID = ' +inttostr(AuctionID);

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  // Ã»ÓÐ½á¹û-ÍË³ö
  if Query.eof then
    exit;

  // ÓÐ½á¹û£¬ËüÒÑ¾­±»ÂôÁË£¿
  if GetBoolean(Query,'FLD_SOLD') then begin
    PlayObject.SysMsg('µ±Ç°ÎïÆ·ÒÑ¾­³öÊÛ¡£',c_Red,t_Hint);
    exit;
  end;

  // Èç¹ûËüÎ´±»Âô£¬Ëüµ½ÆÚÁË£¿
  if UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString)) < now then begin
    PlayObject.SysMsg('µ±Ç°ÎïÆ·ÒÑ¾­¹ýÆÚ¡£',c_Red,t_Hint);
    exit;
  end;

  Cost := UINT(Query.FieldByName('FLD_COST').AsInteger);

  // Èç¹ûÍæ¼ÒÃ»ÓÐ×ã¹»½ðÇ®-ÍË³ö
  if PlayObject.m_nGold < Cost then exit;

  if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
    PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
    exit;
  end;

  New(UserItem);

  Seller := Query.FieldByName('FLD_SELLER').AsString;
  UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
  UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
  UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
  UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
  UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
  UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
  UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
  UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
  UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
  UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
  UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
  UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
  UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
  UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
  UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
  UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
  UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
  UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
  UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
  UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
  UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
  UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
  UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
  UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
  UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

  str_query := 'UPDATE TBL_AUCTION SET FLD_SOLD = TRUE WHERE (FLD_AUCTIONID = ' +Inttostr(AuctionID) +' AND FLD_SOLD = FALSE)';
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;


  if query.RowsAffected <> 0 then begin
    if (PlayObject.DecGold(Cost)) then begin
      PlayObject.GoldChanged();
      PlayObject.AddItemToBag(UserItem,boot);
      if boot then
      PlayObject.SendAddItem(UserItem,1);
      PlayObject.SendMsg(PlayObject,RM_AUCTIONGIVE,0,PlayObject.m_nGold,0,0,'');

      StdItem := UserEngine.GetStdItem(UserItem.wIndex);
      //·Î±×³²±è
      if StdItem.NeedIdentify = 1 then
        AddGameDataLog('33' +  #9 +
               PlayObject.m_sMapName + #9 +
               IntToStr(PlayObject.m_nCurrX) + #9 +
               IntToStr(PlayObject.m_nCurrY) + #9 +
               '(±¸)'+PlayObject.m_sCharName + #9 +
               StdItem.Name+'('+ IntToStr(UserItem.Amount) +')' + #9 +
               IntToStr(UserItem.MakeIndex) + #9 +
               '(ÆÇ)'+ Seller + #9 +
               sSTRING_GOLDNAME + #9 +
               IntToStr(Cost) + #9 + '[¹ºÂò¼ÄÊÛÎïÆ·]');
    end;
  end;
end;

procedure TFrmDB.EndOfAuction(PlayObject: TPlayObject; AuctionID: Integer);    //À§Å¹
var
  str_query: string;
  UserItem: pTUserItem;
  nGold:UINT;
  boot:Boolean;
  commision, Index, Amount :integer;
  ItemName: string;
  StdItem,StdItem2:TItem;
begin

  str_query := 'SELECT * FROM TBL_AUCTION WHERE FLD_AUCTIONID = ' +inttostr(AuctionID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

  if GetBoolean(Query,'FLD_SOLD') then begin

    nGold := Query.FieldByName('FLD_COST').AsInteger;
    ItemName := Query.FieldByName('FLD_ITEMNAME').AsString;
    Index := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    if PlayObject.m_nGold + nGold > PlayObject.m_nGoldMax then begin
      PlayObject.BoxMsg(GetGoldStr(PlayObject.m_nGoldMax)+'µÄ½ð±Ò³¬¹ýÁËÔÊÐíµÄ×î´óÏÞ¶È¡£', 0);
      exit;
    end;

    commision := nGold * 10 div 1000;
    PlayObject.IncGold(nGold);
    PlayObject.DecGold(commision);
    PlayObject.GoldChanged();

    str_query := 'DELETE FROM TBL_AUCTION WHERE FLD_AUCTIONID = ' +inttostr(AuctionID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

    PlayObject.SendMsg(PlayObject,RM_AUCTIONGIVE,0,PlayObject.m_nGold,0,0,'');

    StdItem:=UserEngine.GetStdItem(ItemName);

    if StdItem.NeedIdentify = 1 then
    AddGameDataLog('33' + #9 +
                        PlayObject.m_sMapName + #9 +
                        IntToStr(PlayObject.m_nCurrX) + #9 +
                        IntToStr(PlayObject.m_nCurrY) + #9 +
                        PlayObject.m_sCharName + #9 +
                        sSTRING_GOLDNAME + #9 +
                        IntToStr(nGold - Commision) + #9 +
                        StdItem.Name + '(' + IntToStr(Amount) +')' + #9 +
                        IntToStr(Index) + #9 + '[¼ÄÊÛ½»Ò×³É¹¦]');


  end else begin

    if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
     PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
     exit;
    end;

    New(UserItem);

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_ADDITIONAL_0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_ADDITIONAL_1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_ADDITIONAL_2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_ADDITIONAL_3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_ADDITIONAL_4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_ADDITIONAL_5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_ADDITIONAL_6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_ADDITIONAL_7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_ADDITIONAL_8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_ADDITIONAL_9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_ADDITIONAL_10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_ADDITIONAL_11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_ADDITIONAL_12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_ADDITIONAL_13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_ADDITIONAL_14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_ADDITIONAL_15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_ADDITIONAL_16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_ADDITIONAL_17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_ADDITIONAL_18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_ADDITIONAL_19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    str_query := 'DELETE FROM TBL_AUCTION WHERE FLD_AUCTIONID = ' +inttostr(AuctionID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

    PlayObject.AddItemToBag(UserItem,boot);    //¹°¾à
    if boot then
    PlayObject.SendAddItem(UserItem,1);
    PlayObject.SendMsg(PlayObject,RM_AUCTIONGIVE,0,0,1,0,'');


    StdItem2:=UserEngine.GetStdItem(UserItem.wIndex);

    if StdItem2.NeedIdentify = 1 then
    AddGameDataLog('34' + #9 +
                        PlayObject.m_sMapName + #9 +
                        IntToStr(PlayObject.m_nCurrX) + #9 +
                        IntToStr(PlayObject.m_nCurrY) + #9 +
                        PlayObject.m_sCharName + #9 +
                        StdItem2.Name + '(' + IntToStr(UserItem.Amount) +')' + #9 +
                        IntToStr(UserItem.MakeIndex) + #9 +
                        '1' + #9 +
                        '0' + #9 + '[È¡Ïû¼ÄÊÛÎïÆ·]');

  end;

end;



function TFrmDB.ComStorageItem(Useritem: pTUserItem; UserID: string): boolean;       //°ø¿ëÃ¢°í

var
  str_query: string;
  Item: TItem;
  PlayObject: TPlayObject;
  opt: integer;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;

  str_query := 'INSERT INTO TBL_COMSTORAGE (FLD_START, FLD_END, FLD_USERID, FLD_ITEMNAME, FLD_MAKEINDEX, FLD_WINDEX, FLD_STDMODE, FLD_AMOUNT, FLD_DURA, FLD_MAXDURA, FLD_CS0, FLD_CS1, FLD_CS2,'
   +' FLD_CS3, FLD_CS4, FLD_CS5, FLD_CS6, FLD_CS7, FLD_CS8, FLD_CS9, FLD_CS10, FLD_CS11,'
   +' FLD_CS12, FLD_CS13, FLD_CS14, FLD_CS15, FLD_CS16, FLD_CS17, FLD_CS18, FLD_CS19)'
   +' VALUES ('''+IntToStr(UnixTime)+''',''' +IntToStr(DateTimeToUnix(IncDay(now, 7))) +''',''' +UserID +''',''' + Item.Name +''',''' +inttostr(UserItem.MakeIndex) +''',''' +inttostr(UserItem.wIndex) +''',''' +inttostr(Item.StdMode) +''',''' +inttostr(UserItem.Amount) +''''
   +',''' +inttostr(UserItem.Dura) +''',''' +inttostr(UserItem.DuraMax) +''',''' +inttostr(UserItem.btValue[0]) +''',''' +inttostr(UserItem.btValue[1]) +''',''' +inttostr(UserItem.btValue[2]) +''''
   +',''' +inttostr(UserItem.btValue[3]) +''',''' +inttostr(UserItem.btValue[4]) +''',''' +inttostr(UserItem.btValue[5]) +''',''' +inttostr(UserItem.btValue[6]) +''',''' +inttostr(UserItem.btValue[7]) +''''
   +',''' +inttostr(UserItem.btValue[8]) +''',''' +inttostr(UserItem.btValue[9]) +''',''' +inttostr(UserItem.btValue[10]) +''',''' +inttostr(UserItem.btValue[11]) +''',''' +inttostr(UserItem.btValue[12]) +''''
   +',''' +inttostr(UserItem.btValue[13]) +''',''' +inttostr(UserItem.btValue[14]) +''',''' +inttostr(UserItem.btValue[15]) +''',''' +inttostr(UserItem.btValue[16]) +''''
   +',''' +inttostr(UserItem.btValue[17]) +''',''' +inttostr(UserItem.btValue[18]) +''',''' +inttostr(UserItem.btValue[19]) +''')';

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;

procedure TFrmDB.GetComStorageItems(PlayObject: TPlayObject);    //°ø¿ëÃ¢°í

var
  str_query,sSendMsg: string;
 
  ComStorageItem: TComStorageItem;
  i: integer;

  UserItem: TUserItem;
  Item:TItem;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  opt: integer;
begin


  str_query := 'SELECT * FROM TBL_COMSTORAGE' +' WHERE (FLD_USERID = ''' +PlayObject.m_sUserID +''')';
  UseSQL();

  if str_query <> '' then begin
    str_query := str_query +' ORDER BY FLD_END ASC'; //³·Àº¼ýÀÚ Á¤·Ä

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETCOMSTORAGEITEMS_FAIL,0,0,0,0,'');
    exit;
  end;

  for i:=0 to g_Config.ComStorageIdx - 1 do begin

    if query.eof then
      break;

    ComStorageItem.StorageID := Query.FieldByName('FLD_STOREAGEID').AsInteger;
    ComStorageItem.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    ComStorageItem.EndTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));


    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_CS0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_CS1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_CS2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_CS3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_CS4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_CS5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_CS6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_CS7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_CS8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_CS9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_CS10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_CS11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_CS12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_CS13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_CS14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_CS15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_CS16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_CS17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_CS18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_CS19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      opt := Item.GetItemAddValue(@UserItem,StdItem);

      ClientItem.S := StdItem;
      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount := UserItem.Amount;
      ClientItem.UpgradeOpt := opt;
      ComStorageItem.Item := ClientItem;

      sSendMsg:=sSendMsg + EncodeBuffer(@ComStorageItem,SizeOf(TComStorageItem)) + '/';
    end;

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_COMSTORAGEITEMS,Integer(Self),0,0,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;


procedure TFrmDB.EndOfComStorage(PlayObject: TPlayObject; StorageID: Integer);    //°ø¿ëÃ¢°í

var
  str_query: string;
  UserItem: pTUserItem;
  nGold:UINT;
  boot:Boolean;
begin

  str_query := 'SELECT * FROM TBL_COMSTORAGE WHERE FLD_STOREAGEID = ' +inttostr(StorageID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

    if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
     PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
     exit;
    end;

    New(UserItem);

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_CS0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_CS1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_CS2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_CS3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_CS4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_CS5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_CS6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_CS7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_CS8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_CS9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_CS10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_CS11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_CS12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_CS13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_CS14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_CS15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_CS16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_CS17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_CS18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_CS19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    str_query := 'DELETE FROM TBL_COMSTORAGE WHERE FLD_STOREAGEID = ' +inttostr(StorageID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

    PlayObject.AddItemToBag(UserItem,boot);    //¹°¾à
    if boot then
    PlayObject.SendAddItem(UserItem,1);
    PlayObject.SendMsg(PlayObject,RM_COMSTORAGEGIVE,0,0,1,0,'');
end;

function  TFrmDB.LoadComStorageidx(Name:String): Integer;       //°ø¿ëÃ¢°í
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_COMSTORAGE Where FLD_USERID='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;


//¿µ¹°DB==================================================================================

function TFrmDB.PetInfoSaveDB(UserID, Name, PetMobName, PetName : string; Number, Day, DayUse, SatietyLimit, EatRage:integer; sStr : string): boolean;       //¿µ¹°DB ÀúÀå
var
  str_query: string;
begin
  Result := False;

  str_query := 'INSERT INTO TBL_PET (FLD_START, FLD_END, FLD_USERID, FLD_USERNAME, FLD_PETMOBNAME, FLD_PETNAME, FLD_PETNUMBER,'
   +' FLD_SATIETY, FLD_PERIOD, FLD_CHANGNAME, FLD_SATIETYLIMIT, FLD_EATRAGE, FLD_ABILITY)'
   +' VALUES ('''+IntToStr(UnixTime)+''',''' +IntToStr(DateTimeToUnix(IncDay(now, Day))) +''',''' + UserID +''',''' + Name +''',''' + PetMobName +''',''' + PetName +''',''' + inttostr(Number) +''''
   +',''' + inttostr(70) +''',''' + inttostr(DayUse) +''',''' + inttostr(0) +''',''' + inttostr(SatietyLimit) +''',''' + inttostr(EatRage) +''',''' + sStr +''')';

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;


procedure TFrmDB.GetPetInfo(PlayObject: TPlayObject);    //¿µ¹°DB ºÒ·¯¿À±â
var
  str_query,sSendMsg: string;

  PetInfo: TPetInfo;
  i: integer;
begin
  str_query := 'SELECT * FROM TBL_PET' +' WHERE (FLD_USERID = ''' +PlayObject.m_sUserID +''''
                   +' AND FLD_USERNAME = ''' +PlayObject.m_sCharName +''')';
  UseSQL();

  if str_query <> '' then begin
    str_query := str_query +' ORDER BY FLD_END DESC';    //Å«¼ýÀÚ Á¤·Ä

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETPETINFO_FAIL,0,0,0,0,'');
    exit;
  end;

  for i:=0 to g_Config.PetLimitIdx - 1 do begin

    if query.eof then
      break;

    PetInfo.PetID := Query.FieldByName('FLD_ID').AsInteger;
    PetInfo.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    PetInfo.EndTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));
    PetInfo.PetName := Query.FieldByName('FLD_PETNAME').AsString;
    PetInfo.PetNumber := StrToInt(Query.FieldByName('FLD_PETNUMBER').AsString);
    PetInfo.Satiety := Query.FieldByName('FLD_SATIETY').AsInteger;
    PetInfo.Period := Query.FieldByName('FLD_PERIOD').AsInteger;
    PetInfo.ChangName := Query.FieldByName('FLD_CHANGNAME').AsInteger;
    PetInfo.SatietyLimit := Query.FieldByName('FLD_SATIETYLIMIT').AsInteger;
    PetInfo.EatRage := Query.FieldByName('FLD_EATRAGE').AsInteger;

    sSendMsg:=sSendMsg + EncodeBuffer(@PetInfo,SizeOf(TPetInfo)) + '/';

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_GETPETINFO,Integer(Self),0,0,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;

procedure TFrmDB.DeletePet(PlayObject: TPlayObject; PetID: Integer);    //¿µ¹°DB ³õ¾ÆÁÖ±â
var
  str_query: string;
  UserItem: pTUserItem;
begin

  str_query := 'SELECT * FROM TBL_PET WHERE FLD_ID = ' +inttostr(PetID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

  PlayObject.NotPetSummon2(Query.FieldByName('FLD_PETNAME').AsString);
  PlayObject.PetAbility('','',False);
  str_query := 'DELETE FROM TBL_PET WHERE FLD_ID = ' +inttostr(PetID);
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;

  GetPetInfo(PlayObject);

end;


procedure TFrmDB.ChangPetName(PlayObject: TPlayObject; PetID: Integer; ChangName:String);    //¿µ¹°DB ÀÌ¸§¹Ù²Ù±â
var
  str_query: string;
  i: integer;
begin

  str_query := 'SELECT * FROM TBL_PET WHERE FLD_ID = ' +inttostr(PetID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;

  if Query.eof then
    exit;

  PlayObject.m_sPetName := ChangName;

  str_query := 'UPDATE TBL_PET Set FLD_PETNAME=''' + ChangName + ''', ' +
    'FLD_CHANGNAME=''' + inttostr(1) + '''' +
    ' Where FLD_ID=' + inttostr(PetID);

  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;

  GetPetInfo(PlayObject);

  for i:= PlayObject.m_PetList.Count -1 downto 0 do begin
     TBaseObject(PlayObject.m_PetList.Items[i]).RefShowName;
  end;

end;


function  TFrmDB.LoadPetidx(Name:String): Integer;       //¿µ¹°DB °¹¼ö
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_PET Where FLD_USERNAME='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;

function  TFrmDB.LoadPetNumberidx(Name:String;PetNumber:integer): Integer;       //¿µ¹°DB °¹¼ö
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_PET' +' WHERE (FLD_USERNAME = ''' + Name + ''''
                    +' AND FLD_PETNUMBER = ''' + IntToStr(PetNumber) +''')';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;



//==========================================================================================





function TFrmDB.GuildStorageItem(Useritem: pTUserItem; GuildName: string): boolean;       //¹®ÆÄÃ¢°í

var
  str_query: string;
  Item: TItem;
  PlayObject: TPlayObject;
  opt: integer;
begin
  Result := False;
  Item:=UserEngine.GetStdItem(UserItem.wIndex);
  if Item = nil then exit;


  str_query := 'INSERT INTO TBL_GUILDSTORAGE (FLD_START, FLD_END, FLD_GUILDNAME, FLD_ITEMNAME, FLD_MAKEINDEX, FLD_WINDEX, FLD_STDMODE, FLD_AMOUNT, FLD_DURA, FLD_MAXDURA, FLD_CS0, FLD_CS1, FLD_CS2,'
   +' FLD_CS3, FLD_CS4, FLD_CS5, FLD_CS6, FLD_CS7, FLD_CS8, FLD_CS9, FLD_CS10, FLD_CS11,'
   +' FLD_CS12, FLD_CS13, FLD_CS14, FLD_CS15, FLD_CS16, FLD_CS17, FLD_CS18, FLD_CS19)'
   +' VALUES ('''+IntToStr(UnixTime)+''',''' +IntToStr(DateTimeToUnix(IncDay(now, 7))) +''',''' +GuildName +''',''' +Item.Name +''',''' +inttostr(UserItem.MakeIndex) +''',''' +inttostr(UserItem.wIndex) +''',''' +inttostr(Item.StdMode) +''',''' +inttostr(UserItem.Amount) +''''
   +',''' +inttostr(UserItem.Dura) +''',''' +inttostr(UserItem.DuraMax) +''',''' +inttostr(UserItem.btValue[0]) +''',''' +inttostr(UserItem.btValue[1]) +''',''' +inttostr(UserItem.btValue[2]) +''''
   +',''' +inttostr(UserItem.btValue[3]) +''',''' +inttostr(UserItem.btValue[4]) +''',''' +inttostr(UserItem.btValue[5]) +''',''' +inttostr(UserItem.btValue[6]) +''',''' +inttostr(UserItem.btValue[7]) +''''
   +',''' +inttostr(UserItem.btValue[8]) +''',''' +inttostr(UserItem.btValue[9]) +''',''' +inttostr(UserItem.btValue[10]) +''',''' +inttostr(UserItem.btValue[11]) +''',''' +inttostr(UserItem.btValue[12]) +''''
   +',''' +inttostr(UserItem.btValue[13]) +''',''' +inttostr(UserItem.btValue[14]) +''',''' +inttostr(UserItem.btValue[15]) +''',''' +inttostr(UserItem.btValue[16]) +''''
   +',''' +inttostr(UserItem.btValue[17]) +''',''' +inttostr(UserItem.btValue[18]) +''',''' +inttostr(UserItem.btValue[19]) +''')';

  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.ExecSQL;
  Result := True;
end;

procedure TFrmDB.GetGuildStorageItems(PlayObject: TPlayObject);    //¹®ÆÄÃ¢°í

var
  str_query,sSendMsg: string;
 
  GuildStorageItem: TGuildStorageItem;
  i: integer;

  UserItem: TUserItem;
  Item:TItem;
  ClientItem:TClientItem;
  StdItem:TStdItem;
  opt: integer;
begin


  str_query := 'SELECT * FROM TBL_GUILDSTORAGE' +' WHERE (FLD_GUILDNAME = ''' + TGuild(PlayObject.m_MyGuild).sGuildName +''')';
  UseSQL();

  if str_query <> '' then begin
    str_query := str_query +' ORDER BY FLD_END ASC';   //³·Àº¼ýÀÚ Á¤·Ä

    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.Open;
  end;

  if query.eof then begin
    PlayObject.SendDefMessage(SM_GETGUILDSTORAGEITEMS_FAIL,0,0,0,0,'');
    exit;
  end;

  for i:=0 to g_Config.GuildStorageIdx - 1 do begin

    if query.eof then
      break;

    GuildStorageItem.GStorageID := Query.FieldByName('FLD_STOREAGEID').AsInteger;
    GuildStorageItem.StartTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_START').AsString));
    GuildStorageItem.EndTime := UnixToDateTime(strtoint(Query.FieldByName('FLD_END').AsString));


    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_CS0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_CS1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_CS2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_CS3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_CS4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_CS5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_CS6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_CS7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_CS8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_CS9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_CS10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_CS11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_CS12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_CS13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_CS14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_CS15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_CS16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_CS17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_CS18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_CS19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    Item:=UserEngine.GetStdItem(UserItem.wIndex);

    if Item <> nil then begin
      Item.GetStandardItem(StdItem);
      opt := Item.GetItemAddValue(@UserItem,StdItem);

      ClientItem.S := StdItem;
      ClientItem.Dura := UserItem.Dura;
      ClientItem.DuraMax := UserItem.DuraMax;
      ClientItem.MakeIndex := UserItem.MakeIndex;
      ClientItem.Amount := UserItem.Amount;
      ClientItem.UpgradeOpt := opt;
      GuildStorageItem.Item := ClientItem;

      sSendMsg:=sSendMsg + EncodeBuffer(@GuildStorageItem,SizeOf(TGuildStorageItem)) + '/';
    end;

    Query.Next;
  end;

  if Query.RecordCount <> 0 then begin
    PlayObject.m_DefMsg:=MakeDefaultMsg(SM_GUILDSTORAGEITEMS,Integer(Self),0,0,0);
    PlayObject.SendSocket(@PlayObject.m_DefMsg,sSendMsg);
  end;
end;


procedure TFrmDB.EndOfGuildStorage(PlayObject: TPlayObject; StorageID: Integer);    //¹®ÆÄÃ¢°í
var
  str_query: string;
  UserItem: pTUserItem;
  boot:Boolean;
begin

  str_query := 'SELECT * FROM TBL_GUILDSTORAGE WHERE FLD_STOREAGEID = ' +inttostr(StorageID);
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(str_query);
  Query.Open;


  if Query.eof then
    exit;

    if (TGuild(PlayObject.m_MyGuild).sGuildName) <> (Query.FieldByName('FLD_GUILDNAME').AsString) then begin   //¹®ÆÄÃ¢°í ¹ö±× ¸·±â
     PlayObject.SysMsg('ÄãÖ»ÄÜÊ¹ÓÃÄãËùÔÚµÄÐÐ»á²Ö¿â£¬¾ßÌåÇé¿öÇëÁªÏµ¹ÜÀíÔ±¡£',c_Red,t_Hint);
     exit;
    end;

    if PlayObject.m_ItemList.Count >= MAXBAGITEM then begin
     PlayObject.SysMsg('ÄãµÄ±³°üÂúÁË¡£',c_Red,t_Hint);
     exit;
    end;

    New(UserItem);

    UserItem.MakeIndex := Query.FieldByName('FLD_MAKEINDEX').AsInteger;
    UserItem.wIndex := Query.FieldByName('FLD_WINDEX').AsInteger;
    UserItem.Dura := Query.FieldByName('FLD_DURA').AsInteger;
    UserItem.DuraMax := Query.FieldByName('FLD_MAXDURA').AsInteger;
    UserItem.btValue[0] := Query.FieldByName('FLD_CS0').AsInteger;
    UserItem.btValue[1] := Query.FieldByName('FLD_CS1').AsInteger;
    UserItem.btValue[2] := Query.FieldByName('FLD_CS2').AsInteger;
    UserItem.btValue[3] := Query.FieldByName('FLD_CS3').AsInteger;
    UserItem.btValue[4] := Query.FieldByName('FLD_CS4').AsInteger;
    UserItem.btValue[5] := Query.FieldByName('FLD_CS5').AsInteger;
    UserItem.btValue[6] := Query.FieldByName('FLD_CS6').AsInteger;
    UserItem.btValue[7] := Query.FieldByName('FLD_CS7').AsInteger;
    UserItem.btValue[8] := Query.FieldByName('FLD_CS8').AsInteger;
    UserItem.btValue[9] := Query.FieldByName('FLD_CS9').AsInteger;
    UserItem.btValue[10] := Query.FieldByName('FLD_CS10').AsInteger;
    UserItem.btValue[11] := Query.FieldByName('FLD_CS11').AsInteger;
    UserItem.btValue[12] := Query.FieldByName('FLD_CS12').AsInteger;
    UserItem.btValue[13] := Query.FieldByName('FLD_CS13').AsInteger;
    UserItem.btValue[14] := Query.FieldByName('FLD_CS14').AsInteger;
    UserItem.btValue[15] := Query.FieldByName('FLD_CS15').AsInteger;
    UserItem.btValue[16] := Query.FieldByName('FLD_CS16').AsInteger;
    UserItem.btValue[17] := Query.FieldByName('FLD_CS17').AsInteger;
    UserItem.btValue[18] := Query.FieldByName('FLD_CS18').AsInteger;
    UserItem.btValue[19] := Query.FieldByName('FLD_CS19').AsInteger;
    UserItem.Amount := Query.FieldByName('FLD_AMOUNT').AsInteger;

    str_query := 'DELETE FROM TBL_GUILDSTORAGE WHERE FLD_STOREAGEID = ' +inttostr(StorageID);
    Query.SQL.Clear;
    Query.SQL.Add(str_query);
    Query.ExecSQL;

    PlayObject.AddItemToBag(UserItem,boot);    //¹°¾à
    if boot then
    PlayObject.SendAddItem(UserItem,1);
    PlayObject.SendMsg(PlayObject,RM_GUILDTORAGEGIVE,0,0,1,0,'');
end;

function  TFrmDB.LoadGuildStorageidx(Name:String): Integer;       //¹®ÆÄÃ¢°í
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_GUILDSTORAGE Where FLD_GUILDNAME='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;



constructor TFrmDB.Create();
begin
  inherited;
  CoInitialize(nil);
  Query:=TADOQuery.Create(nil);
  QueryCommand:=TADOCommand.Create(nil);
  SQLTimer := TTimer.Create(nil);
  SQLTimer.Enabled := False;    
end;

function TFrmDB.GetBoolean(MyQuery: TADOQuery; Field: String): boolean;
begin
  UseSQL();
  if Not g_config.boUseSQL then Result := MyQuery.FieldByName(Field).AsBoolean
  else Result := {(}MyQuery.FieldByName(Field).AsBoolean{ = 1)};
end;

procedure TFrmDB.InitDBM();
begin
  if not g_config.boUseSQL then Query.ConnectionString := g_sADODBString
  else begin
    if lowercase(g_Config.SQLType) = 'mysql' then begin
      Query.ConnectionString := 'DRIVER={MySQL ODBC 3.51 Driver};SERVER='+g_config.SQLHost+';PORT='+inttostr(g_config.SQLPort)+';DATABASE='+g_config.SQLDatabase+';USER='+g_config.SQLUsername+';PASSWORD='+g_config.SQLPassword+';OPTION=3';
    end
    else if lowercase(g_Config.SQLType) = 'mssql' then begin
      Query.ConnectionString := 'Provider=SQLOLEDB.1;Password='+g_config.SQLPassword+';Persist Security Info=True;User ID='+g_config.SQLUsername+';Initial Catalog='+g_config.SQLDatabase+';Data Source='+g_config.SQLHost;
    end
    else begin
      Application.MessageBox('Invalid SQL Type seclected. Valid Types: mysql','Error!');
      Application.Terminate;
    end;

    // ²âÊÔÁ¬½Ó
    try
      UseSQL();
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('SELECT * FROM TBL_STDITEMS');
      Query.Open;
    except
      Application.MessageBox('Êý¾Ý¿âÁ¬½ÓÊ§°Ü.','´íÎó!');
      Application.Terminate;
    end;
  end;

  QueryCommand.ConnectionString := Query.ConnectionString;
  SQLTimer.Interval := 60000; // Fire after 1 Minute to start with.
  SQLTimer.OnTimer := DoSQLTimer;
  SQLTimer.Enabled := True;
end;

procedure TFrmDB.UseSQL();
begin
  if g_Config.boUseSQL then LastSQLTime := UnixTime;
end;

procedure TFrmDB.DoSQLTimer(Sender: TObject);
var
  boError: Boolean;
begin
  boError := False;
   if not g_Config.boUseSQL then begin
     SQLTimer.Enabled := False;
     exit;
   end;
  // Í£Ö¹SQLÁ¬½ÓÊ±¼ä¡£
  if (LastSQLTime < (UnixTime-(60*10))) or (SQLTimer.Interval = 60000) then begin
    // Ç°ÃæÓÃ·¨ÊÇ³¬¹ý10·ÖÖÓÇ°
    MainOutMessage('-- SQL KeepAlive');
    try
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('SELECT * FROM TBL_KEEPALIVE');
      Query.Open;
      Query.Close;
    except
      MainOutMessage('-- --> Error Keeping Query Alive!');
      boError := True;
    end;

    Try
      QueryCommand.CommandText := 'UPDATE TBL_KEEPALIVE Set FLD_TIME='+inttostr(UnixTime)+' Where FLD_ID=1';
      QueryCommand.Execute;
    Except
      MainOutMessage('-- --> Error Keeping QueryCommand Alive!');
      boError := True;
    end;
    if Not boError then UseSQL();
  end
  else begin
    MainOutMessage('-- SQL Keep Alive not needed.');
  end;
  SQLTimer.Interval := (60*60)*1000;  
end;

procedure TFrmDB.LoadGT(Number,ListNumber:Integer);
var
  GT:TTerritory;
  sSQLString:String;
  nerror:integer;
begin
  nerror:=0;
  sSQLString := 'SELECT * FROM TBL_GTList WHERE(TerritoryNumber=' + IntToStr(Number) + ')';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
  except
    //nerror:=1;
  //Ôö¼Ó×½×¡Ä³Ò»´¦µÄ´íÎóÔÚÕâÀï
  end;
  //new(GT);
  GT:=g_GuildTerritory.GTList[ListNumber];
  try
    if Query.RecordCount = 1 then begin //Èç¹ûÄÇÀï¼ÍÂ¼
      GT.TerritoryNumber := Number;
      GT.Guildname:= Query.FieldByName('FLD_GuildName').AsString;
      GT.RegDate := UnixToDateTime(strtoint(Query.FieldByName('FLD_RegDate').AsString));
      GT.RegEnd := UnixToDateTime(strtoint(Query.FieldByName('FLD_RegEnd').AsString));
      if GetBoolean(Query,'FLD_ForSale') then
        GT.ForSale := True
      else
        GT.ForSale := False;
      GT.ForSaleEnd := UnixToDateTime(strtoint(Query.FieldByName('FLD_ForSaleEnd').AsString));
      GT.ForSaleGold := strtoint(Query.FieldByName('FLD_ForSaleGold').AsString);
      GT.BuyerGName := Query.FieldByName('FLD_Buyer').AsString;
      Query.Close;
    end else begin
      Query.Close;
      GT.TerritoryNumber := number;
      GT.GuildName :='';
      GT.RegDate := now();
      GT.RegEnd := now();
      GT.ForSale:=True;
      GT.ForSaleEnd := now();
      GT.ForSaleGold := 10000000;
      GT.BuyerGName := '';
      SetupGT(GT);
    end;
  except
    if nerror = 0 then nerror:=2;
  end;

  if nerror <> 0 then exit; //technicalyÓ¦¸ÃÔö¼Ó´íÎó±¨¸æÔÚÕâÀï
  LoadGTDecorations(GT);
end;

procedure TFrmDB.LoadGTDecorations(GT:TTerritory);     //»óÇö¾ÆÀÌÅÛ
var
  sSQLString:String;
  nerror,i,ii:integer;
  Decoration:pTGTDecoration;
  MapItem: pTMapItem;
  UserItem:pTUserItem;
  LastMapName:string;
  Envir:TEnvirnoment;
begin
  nerror:=0;
  sSQLString := 'SELECT * FROM TBL_GTObjects WHERE(TerritoryNumber=' + IntToStr(GT.TerritoryNumber) + ') ORDER BY FLD_MapName';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
  except
    MainOutMessage('[Exception] TFrmDB.LoadGTDecorations => Failed to select territory.');
  end;
  lastmapname:='';
  try
    for i:=0 to Query.RecordCount -1 do begin
      new(Decoration);
      Decoration.appr := Query.FieldByName('FLD_Appr').AsInteger;
      Decoration.x := strtoint(Query.FieldByName('FLD_X').AsString);
      Decoration.y := strtoint(Query.FieldByName('FLD_Y').AsString);
      Decoration.starttime := strtoint(Query.FieldByName('FLD_StartTime').AsString);
      if LastMapName <> Query.FieldByName('FLD_MapName').AsString then begin
        for ii:= 0 to g_MapManager.Count -1 do begin
          Envir := g_MapManager.Items[ii];
          if (Envir.sMapName = Query.FieldByName('FLD_MapName').AsString) and (TTerritory(Envir.m_GuildTerritory).TerritoryNumber = GT.TerritoryNumber) then
            break;
        end;
      end;

      if (Envir <> nil) then begin
        Decoration.Map := Envir;
        //Ê×ÏÈÎÒÃÇ×öÎÒÃÇÐÂµÄÓÃ»§ÎïÆ·
        New(UserItem);
        if UserEngine.CopyToUserItemFromName(g_Config.sGTDeco,UserItem) = False then begin
          if nerror = 0 then nerror:=1;
          Dispose(UserItem);
          continue;
        end;
        UserItem.MakeIndex:=GetItemNumberEx();
        UserItem.btValue[0] := GT.TerritoryNumber;
        UserItem.btValue[5] := LoByte(Decoration.Appr);
        UserItem.btValue[6] := HiByte(Decoration.Appr);
        UserItem.btValue[1] := LoByte(LoWord(Decoration.starttime));          //»óÇö¾ÆÀÌÅÛ
        UserItem.btValue[2] := HiByte(LoWord(Decoration.starttime));
        UserItem.btValue[3] := LoByte(HiWord(Decoration.starttime));
        UserItem.btValue[4] := HiByte(HiWord(Decoration.starttime));

        //ÏÖÔÚ×öÊµ¼ÊµØÍ¼ÎïÆ· (È¥ÔÚµØ°åÉÏ)µÄÄÇ¸ö
        new(MapItem);
        MapItem.UserItem := UserItem^;
        MapItem.Looks := Decoration.Appr + 10000;
        MapItem.Name := GetDecoName(Decoration.Appr) + '[' + IntToStr(Round(MapItem.UserItem.DuraMax/1000)) + ']' + '/' + '0' + '/' + '1';
        MapItem.AniCount := 0;
        MapItem.Grade := 0;
        MapItem.Reserved := 0;
        MapItem.Count := 1;
        MapItem.OfBaseObject:=nil;
        MapItem.dwCanPickUpTick:=GetTickCount();
        MapItem.DropBaseObject:=nil;
        if Envir.AddToMap (Decoration.X, Decoration.Y, OS_ITEMOBJECT, TObject (MapItem)) = nil then begin
          dispose(MapItem);
          if nerror = 0 then nerror:=3;
        end;
        GT.NewDecoration(@MapItem.UserItem,Decoration.x,Decoration.Y,Envir,False);
        Dispose(UserItem);
      end else begin
        Dispose (Decoration);
      end;

      Query.next;
    end;
  except
    if nerror = 0 then nerror:=2;
  end;
  Query.Close;
end;

procedure TFrmDB.SaveGT(GT:TTerritory);
var
  sSQLString:String;
  sForSale:String;
begin
  UseSQL();
  sForSale:='FALSE';
  Try
    if GT.ForSale then
      sForSale:='TRUE';
    sSQLString := 'UPDATE TBL_GTList Set FLD_GuildName=''' + GT.GuildName + ''', ' +
    'FLD_RegDate=' + IntToStr(DateTimeToUnix(GT.RegDate)) + ', FLD_RegEnd=' + IntToStr(DateTimeToUnix(GT.RegEnd)) + ', '+
    'FLD_ForSaleEnd=' + IntToStr(DateTimeToUnix(GT.ForSaleEnd)) + ', FLD_ForSaleGold=' + inttostr(GT.ForSaleGold) + ', ' +
    'FLD_ForSale=' + sForSale + ', FLD_Buyer=''' + GT.BuyerGName + '''' +
    ' Where TerritoryNumber=' + inttostr(GT.TerritoryNumber);
    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  Except
    MainOutMessage('[Exception] TFrmDB.SaveGT');
  end;
end;

procedure TFrmDB.SetupGT(GT:TTerritory);
var
  sSQLString:String;
begin
  UseSQL();
  Try
    sSQLString := 'INSERT INTO TBL_GTList (FLD_GuildName, FLD_RegDate, FLD_RegEnd, FLD_ForSaleEnd, FLD_ForSaleGold' +
    ',  FLD_ForSale, FLD_Buyer, TerritoryNumber) values (' +
    '''' + GT.GuildName + ''', ' + IntToStr(DateTimeToUnix(GT.RegDate)) + ',' + IntToStr(DateTimeToUnix(GT.RegEnd)) + ',' +
    IntToStr(DateTimeToUnix(GT.ForSaleEnd)) + ',' + inttostr(GT.ForSaleGold) + ',TRUE, ''' + GT.BuyerGName + ''',' +
    inttostr(GT.TerritoryNumber) + ')';

    {sSQLString := format('INSERT INTO TBL_GTList (FLD_GuildName, FLD_RegDate, FLD_RegEnd, FLD_ForSaleEnd, FLD_ForSaleGold' +
    ',  FLD_ForSale, FLD_Buyer, TerritoryNumber) values' +
    '("%s", %d, %d, %d, %d, ' +
    '1, "%s", %d)',

    [GT.GuildName, DateTimeToUnix(GT.RegDate), DateTimeToUnix(GT.RegEnd),
    DateTimeToUnix(GT.ForSaleEnd), GT.ForSaleGold, GT.BuyerGName, GT.TerritoryNumber]);}

    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  Except
    MainOutMessage('[Exception] TFrmDB.SetupGT');
  end;
end;

procedure TFrmDB.SaveDeco(looks,GTNumber:Byte;x,y:integer;mapname:String; starttime:dword);       //»óÇö¾ÆÀÌÅÛ
var
  sSQLString:String;
begin
  UseSQL();
  Try
    sSQLString := 'INSERT INTO TBL_GTObjects (TerritoryNumber, FLD_Appr, FLD_x, FLD_Y, FLD_MapName, FLD_StartTime) values (' +
    inttostr(GTNumber) + ',' + IntToStr(looks) + ',' + IntToStr(x) + ',' + IntToStr(y)
    + ',''' + mapname + ''',' + IntToStr(starttime) + ')';
    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  Except
    MainOutMessage('[Exception] TFrmDB.SaveDeco');
  end;
end;

procedure TFrmDB.DeleteDeco(GTNumber:Byte; x,y: integer; mapname:String);   //»óÇö¾ÆÀÌÅÛ
var
  sSQLString:String;
begin

  Try
    sSQLString := 'Delete * FROM TBL_GTObjects WHERE('
    + '(TerritoryNumber=' + IntToStr(GTNumber) + ') AND (FLD_X=' + IntToStr(x) + ') AND (FLD_Y=' + IntToStr(y) + ') AND (FLD_MapName=''' + mapname + '''))';
    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  Except
    MainOutMessage('[Exception] TFrmDB.DeleteDeco');
  end;
end;

function TFrmDB.LoadDecorationList(): Integer; //00488CDC   //»óÇö¾ÆÀÌÅÛ
var
  I,n14:Integer;
  s18,s20,s24:String;
  LoadList:TStringList;
  sFileName:String;
  Decoration:pTDecoItem;
begin
  Result:= -1;
  sFileName:=g_Config.sEnvirDir + 'DecorationList.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    s24:='';
    for I := 0 to LoadList.Count - 1 do begin
      s18:=Trim(LoadList.Strings[I]);
      if (s18 <> '') and (s18[1] <> ';') then begin
        new(Decoration);
        s18:=GetValidStr3(s18,s20,[' ',#9]);
        n14:=Str_ToInt(Trim(s20),0);
        Decoration.Appr := n14;
        s18:=GetValidStr3(s18,s20,[' ',#9]);
        Decoration.Name := s20;
        s18:=GetValidStr3(s18,s20,[' ',#9]);
        n14:=Str_ToInt(Trim(s20),0);
        Decoration.Location := n14;
        n14:=Str_ToInt(Trim(s18),0);
        Decoration.Price := n14;
        g_DecorationList.Add(Decoration);
      end;
    end;    // for
    LoadList.Free;
    Result:=1;
  end;
end;

function  TFrmDB.LoadAucNotSold: Integer;       //°æ¸ÅÁßÀÎ °¹¼ö
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_USERAUC Where FLD_SOLD = FALSE';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;


function  TFrmDB.LoadConsignidx(Name:String): Integer;       //À§Å¹
var
  sSQLString:String;
  I,nc:integer;
begin
  result:= 0;
  sSQLString := 'SELECT * FROM TBL_AUCTION Where FLD_SELLER='''+Name+'''';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  try
    Query.Open;
    nc:=0;
    for i:=0 to Query.RecordCount -1 do begin
    inc(nc);
    end;
  finally
   Query.Close;
  end;
  Query.Close;
  result:= nc;
end;

function TFrmDB.LoadBBSMsgList(GuildName:String;PageCount:integer):TList;   //Àå¿ø°Ô½ÃÆÇ
var
  sSQLString:String;
  output:TList;
  BBSMsg:pTBBSMSG;
  I:integer;
begin
  sSQLString := 'SELECT TOP 100 * FROM TBL_GTForum WHERE(FLD_Guild=''' + GuildName + ''' AND FLD_Deleted = False) ORDER BY FLD_Sticky, FLD_MasterPost DESC, FLD_Index';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  output:=TList.create;
  try
    Query.Open;
    for i:=0 to Query.RecordCount -1 do begin
      new(BBSMsg);
      BBSMsg.index := Query.FieldByName('FLD_INDEX').AsInteger;
      BBSMsg.Poster := Query.FieldByName('FLD_Poster').AsString;
      BBSMsg.Msg := LeftStr(Query.FieldByName('FLD_Msg').AsString,40);
      BBSMsg.Sticky := Query.FieldByName('FLD_Sticky').AsBoolean;
      BBSMsg.MasterIndex := Query.FieldByName('FLD_MasterPost').AsInteger;
      output.Add(BBSMsg);
      Query.next;
    end;
  finally
    Query.Close;
  end;
  Query.Close;
  result:=output;
end;

function TFrmDB.LoadBBSMsg(Index:integer):pTBBSMSGL;      //Àå¿ø°Ô½ÃÆÇ
var
  sSQLString:String;
  BBSMsg:pTBBSMSGL;
begin
  sSQLString := 'SELECT * FROM TBL_GTForum WHERE(FLD_INDEX=' + IntToStr(Index) + ' AND FLD_Deleted = False)';
  UseSQL();
  Query.SQL.Clear;
  Query.SQL.Add(sSQLString);
  result:=nil;
  try
    Query.Open;
    if Query.RecordCount = 1 then begin
      new(BBSMsg);
      BBSMsg.index := Query.FieldByName('FLD_INDEX').AsInteger;
      BBSMsg.Poster := Query.FieldByName('FLD_Poster').AsString;
      BBSMsg.Msg := Query.FieldByName('FLD_Msg').AsString;
      BBSMsg.Sticky := Query.FieldByName('FLD_Sticky').AsBoolean;
      BBSMsg.MasterIndex := Query.FieldByName('FLD_MasterPost').AsInteger;
      result:=BBSMsg;
    end;
  finally
    Query.Close;
  end;
end;

procedure TFrmDB.SaveBBSMSG(BBSMsgL:pTBBSMSGL;GuildName:String);      //Àå¿ø°Ô½ÃÆÇ
var
  sSQLString:String;
  nstick : integer;
  postdate:integer;
begin
  UseSQL();
  postdate:= DateTimeToUnix(now());
  Try
    nstick:=0;
    if BBSMsgL.Sticky then
      nstick:=1;
    sSQLString := format('INSERT INTO TBL_GTForum (FLD_Guild, FLD_Msg, FLD_Poster, FLD_PostDate, FLD_Sticky,FLD_MasterPost) values (''%S'',''%S'',''%S'',%D,%D, %D)',
    [GuildName,BBSMsgL.Msg,BBSMsgL.Poster,postdate,nstick,BBSMsgL.MasterIndex]);
    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  Except
  end;
  try
    if BBSMsgL.MasterIndex = 0 then begin
      sSQLString := format('UPDATE TBL_GTForum SET FLD_MasterPost = FLD_INDEX WHERE(FLD_Poster = ''%s'' AND FLD_PostDate = %D)',[BBSMsgL.Poster,postdate]);
      QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
    end;
  except
  end;
end;

procedure TFrmDB.DeleteBBSMsg(index:integer);        //Àå¿ø°Ô½ÃÆÇ
var
  sSQLString:String;
begin
  UseSQL();
  try
    sSQLString := format('UPDATE TBL_GTForum SET FLD_Deleted = True WHERE(FLD_Index = %d)',[index]);
    QueryCommand.CommandText:=sSQLString;
    QueryCommand.Execute;
  except
  end;
end;


destructor TFrmDB.Destroy;
begin
  Query.Free;
  CoUnInitialize;
  inherited;
end;

initialization
begin
  {---- Adjust global SVN revision ----}
  //SVNRevision('$Id: LocalDB.pas 594 2007-03-09 15:00:12Z damian $');
end;
finalization

end.
