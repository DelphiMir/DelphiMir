unit ClFunc;

interface

uses
  {svn,} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DirectX, DXClass, Grobal2, ExtCtrls, HUtil32, EdCode, IniFiles;


const
   DR_0      = 0;
   DR_1      = 1;
   DR_2      = 2;
   DR_3      = 3;
   DR_4      = 4;
   DR_5      = 5;
   DR_6      = 6;
   DR_7      = 7;
   DR_8      = 8;
   DR_9      = 9;
   DR_10      = 10;
   DR_11      = 11;
   DR_12      = 12;
   DR_13      = 13;
   DR_14      = 14;
   DR_15      = 15;

type
   TDynamicObject = record
      X: integer;
      Y: integer;
      px: integer;  //shiftx ,y
      py: integer;
      DSurface: TDirectDrawSurface;
   end;
   PTDynamicObject = ^TDynamicObject;
var
   DropItems: TList;  //lsit of TClientItem
   g_boSaveIDInfo: Boolean = False;
   g_boSaveUserInfo: Boolean = False;

function  fmStr (str: string; len: integer): string;
function  GetGoldStr (gold: integer): string;
function  GetValueStr (value: Longword): string;
function FilterShowName(cu: TStdItem; sName: string): string;

procedure LoadIDInfo(Charname:String);
procedure SaveIDInfo(Charname:String);

procedure SaveBags (flname: string; pbuf: Pbyte);
procedure Loadbags (flname: string; pbuf: Pbyte);
procedure SaveStores (flname: string; pbuf: Pbyte);
procedure LoadStores (flname: string; pbuf: Pbyte);
procedure ClearBag;
procedure ClearStore;
procedure ClearHeroStore;
function  AddItemBag (cu: TClientItem): Boolean;
function  AddItemBag2 (cu: TClientItem): Boolean;    //물약

function  AddBuyItemBag (cu: SBuyItem): Boolean;  //상인
function  GetSameItemFromBag (cu: TClientItem): Integer;
function AddItemStore (cu: TClientItem): Boolean;
function AddItemStore2 (cu: TClientItem): Boolean;

function AddItemHeroStore (cu: TClientItem): Boolean;
function AddItemHeroStore2 (cu: TClientItem): Boolean;

function  AddItemBagst (cu: TClientItem): Boolean;
procedure Fillquickslots(sname: String;smode,position: integer); //물약
function  UpdateItemBag (cu: TClientItem): Boolean;
function  DelItemBag (iname: string; iindex: integer): Boolean;
function  DelUpwaItemBag (iname: string; iindex: integer): Boolean;  //재련
procedure DelStoreItem(ci: TClientItem);         //개인상점
procedure DelStoreRemoteItem(ci: TClientItem);    //개인상점
procedure ArrangeItemBag;
procedure ArrangeItemStore;
procedure ArrangeItemHeroStore;
procedure AddWakeUpItem (ci: TClientItem);
function StrWakeUpItem (): string;   //각성
procedure MoveWakeUpItemToBag;
procedure DelWakeUpItem;

procedure AddDropItem (ci: TClientItem);    //아이템 버림
function  GetDropItem (iname: string; MakeIndex: integer): PTClientItem;
procedure DelDropItem (iname: string; MakeIndex: integer);

function GetBagItemCount(): Integer;
procedure AddAutItem (ci: TClientItem);        //경매

procedure AddRentalItem (ci: TClientItem);        //대여
procedure DelRentalItem (ci: TClientItem);      //대여
procedure MoveRentalItemToBag;                  //대여
procedure AddRentalRemoteItem (ci: TClientItem);   //대여
procedure DelRentalRemoteItem (ci: TClientItem);   //대여
function  ChangeItemCount ( mindex :integer; Count, MsgNum :word; iname :string ): Boolean;

procedure AddMakeItem (ci: TClientItem);          //제조스쳐
function SearchOverlapItem (ci: TClientItem): Boolean;    //제조스쳐
function MakeStrMakeItem (): string;   //제조스쳐
procedure MoveMakeItemToBag;                   //제조스쳐
procedure DelMakingItem (ci: TClientItem);

procedure AddDealItem (ci: TClientItem);        //거래
procedure DelDealItem (ci: TClientItem);        //거래
procedure MoveDealItemToBag;                      //거래
procedure AddDealRemoteItem (ci: TClientItem);     //거래
procedure DelDealRemoteItem (ci: TClientItem);     //거래
function  GetDistance (sx, sy, dx, dy: integer): integer;
function CheckBeeline(nX, nY, sX, sY: Integer): Boolean;
procedure GetNextPosXY (dir: byte; var x, y:Integer);
procedure GetNextRunXY (dir: byte; var x, y:Integer);
procedure GetNextHorseRunXY (dir: byte; var x, y:Integer);
procedure GetNextSpeedRunXY (dir: byte; var x, y:Integer);    //경신보
function  GetNextDirection (sx, sy, dx, dy: Integer): byte;
function  GetBack (dir: integer): integer;
procedure GetBackPosition (sx, sy, dir: integer; var newx, newy: integer);
procedure GetFrontPosition (sx, sy, dir: integer; var newx, newy: integer);
procedure GetFrontPosition2 (sx, sy, dir: integer; var newx, newy: integer); //낚시
function  GetFlyDirection (sx, sy, ttx, tty: integer): Integer;
function  GetFlyDirection16 (sx, sy, ttx, tty: integer): Integer;
function  PrivDir (ndir: integer): integer;
function  NextDir (ndir: integer): integer;
procedure BoldTextOut (surface: TDirectDrawSurface; x, y, fcolor, bcolor: integer; str: string);
procedure TextOutA (surface: TDirectDrawSurface; x, y, fcolor: integer; str: string);
procedure TextOutEx (surface: TDirectDrawSurface; x, y : integer; str: string; fcolor, bcolor: integer);
function  GetTakeOnPosition (smode: integer): integer;
function  GetTakeOnPositionTiger (smode: integer): integer;
function  IsKeyPressed (key: byte): Boolean;


procedure AddChangeFace (recogid: integer);
procedure DelChangeFace (recogid: integer);
function  IsChangingFace (recogid: integer): Boolean;

procedure LoadDecoList();
function  FindDecoration(Number:integer):pTDecoItem;

procedure ClearHeroBag;
function AddHeroItemBag(cu: TClientItem): Boolean;
function AddHeroItemBag2(cu: TClientItem): Boolean;
function UpdateHeroItemBag(cu: TClientItem): Boolean;
function DelHeroItemBag(iname: string; iindex: Integer): Boolean;
procedure ArrangeHeroItemBag;
function GetHeroBagItemCount(): Integer;
procedure FillquickslotsHero(sname: String;smode,position: integer); //물약

function AddHeroAutoItemBag(cu: TClientItem): Boolean;
function DelHeroAutoItemBag(iname: string; iindex: Integer): Boolean;

procedure AddAutoItem(ci: TClientItem);
procedure ArrangeHeroAutoItemBag;

function DelItemBagByIdx(nIdx: Integer): Boolean;

implementation

uses
   clMain, MShare, Share;


function fmStr (str: string; len: integer): string;
var i: integer;
begin
try
   Result := str + ' ';
   for i:=1 to len - Length(str)-1 do
      Result := Result + ' ';
except
	Result := str + ' ';
end;
end;

function  GetGoldStr (gold: integer): string;   //금전
var
   i, n: integer;
   str: string;
begin
   str := IntToStr (gold);
   n := 0;
   Result := '';
   for i:=Length(str) downto 1 do begin
      if n = 3 then begin
         Result := str[i] + ',' + Result;
         n := 1;
      end else begin
         Result := str[i] + Result;
         Inc(n);
      end;
   end;
end;

function  GetValueStr (value: Longword): string;
var
   i, n: integer;
   str: string;
begin
   str := IntToStr (value);
   n := 0;
   Result := '';
   for i:=Length(str) downto 1 do begin
      if n = 3 then begin
         Result := str[i] + ',' + Result;
         n := 1;
      end else begin
         Result := str[i] + Result;
         Inc(n);
      end;
   end;
end;

function FilterShowName(cu: TStdItem; sName: string): string;
var
  I: Integer;
  SC: string;
  bo11: Boolean;
begin
  Result := '';
  SC := '';
  bo11 := False;
  for I := 1 to Length(sName) do begin
    if cu.StdMode in [5,6,7,90,99,10,11,12,15,19,20,21,22,23,24,26,46,55,56,62,63,64] then begin
      if ((sName[I] >= '0') and (sName[I] <= '9')) or (sName[I] = '-') then begin
        Result := Copy(sName, 1, I - 1);
        SC := Copy(sName, I, Length(sName));
        bo11 := True;
        Break;
      end;
    end;
  end;
  if not bo11 then Result := sName;
end;


procedure SaveIDInfo(Charname:String);
  procedure SaveInfo(sFileName: string);
  var
    i: Integer;
    Ini: TINIfile;
  begin
    Ini := TIniFile.Create(sFileName);
    if ini <> nil then begin
      ini.WriteBool ('Option', 'Sound', g_boSound);
      ini.WriteInteger ('Option', 'SoundVolume', g_btSoundVolume);
      ini.WriteBool ('Option', 'BMGSound', g_boBGSound);
      ini.WriteInteger ('Option', 'BGMVolume', g_btMP3Volume);
      ini.WriteBool ('Option', 'ChatModeTrens', g_boChatModeTrens);
      ini.WriteBool ('Option', 'ItemDetailHint', g_bobuttHint);
      ini.WriteBool ('Option', 'ViewAllName', g_boNameAllView);
      ini.WriteBool ('Option', 'ViewEffect', g_boEffect);
      ini.WriteBool ('Option', 'DropItemView', g_boShowAllItem);
      ini.WriteBool ('Option', 'ViewHPType', g_boHPView);
      ini.WriteBool ('Option', 'ViewChNpName', g_boNameChNpView);
      ini.WriteBool ('Option', 'ViewMonName', g_boNameMonView);
      ini.WriteBool ('Option', 'ShowHintScreen', g_boShowGreenHint);
      ini.WriteInteger ('Option', 'GuildMarkMode', g_boMarkMode);
      ini.WriteBool ('Option', 'ShowHealth', g_boShowHealth);
      ini.WriteBool ('Option', 'ExpMsgMode', g_MoExpMsg);
      ini.WriteBool ('Option', 'AuctionView', AuctionView);

      ini.WriteInteger ('Hero', 'Hero1Index', nHero1Index);
      ini.WriteInteger ('Hero', 'Hero2Index', nHero2Index);
      ini.WriteInteger ('Hero', 'Hero1Percent', nHero1Percent);
      ini.WriteInteger ('Hero', 'Hero2Percent', nHero2Percent);

      ini.WriteString ('Pet', 'PetOption', sPetOption);
      ini.Free;
    end;
  end;
var
  sDirname, sFileName: string;
begin
  if not g_boSaveIDInfo then
    Exit;
  g_boSaveIDInfo := False;
  if not DirectoryExists(DG_SAVEDIR) then
    CreateDir(DG_SAVEDIR);
  sDirname := DG_SAVEDIR + g_sServerName + '\';
  if not DirectoryExists(sDirname) then
    CreateDir(sDirname);
  sDirname := sDirname + LoginScene.m_sLoginId + '\';
  if not DirectoryExists(sDirname) then
    CreateDir(sDirname);

  SaveInfo(sDirname + Charname +'.opt');

  sFileName := sDirname + Charname + FriendListFile;
  g_FriendList.SaveToFile(sFileName);
  
  sFileName := sDirname + Charname + BlackListFile;
  g_MyBlacklist.SaveToFile(sFileName);

  g_FriendList.Clear;
  g_MyBlacklist.Clear;
end;

//속潼토零斤口

procedure LoadIDInfo(Charname:String);
  procedure LoadInfo(sFileName: string);
  var
    i: Integer;
    Ini: TINIfile;
  begin
    if FileExists(sFileName) then begin
      Ini := TIniFile.Create(sFileName);
      if ini <> nil then begin
        g_boSound := ini.ReadBool ('Option', 'Sound', g_boSound);
        g_btSoundVolume := ini.ReadInteger ('Option', 'SoundVolume', g_btSoundVolume);
        g_boBGSound := ini.ReadBool ('Option', 'BMGSound', g_boBGSound);
        g_btMP3Volume := ini.ReadInteger ('Option', 'BGMVolume', g_btMP3Volume);
        g_boChatModeTrens := ini.ReadBool ('Option', 'ChatModeTrens', g_boChatModeTrens);
        g_bobuttHint := ini.ReadBool ('Option', 'ItemDetailHint', g_bobuttHint);
        g_boShowAllItem := ini.ReadBool ('Option', 'DropItemView', g_boShowAllItem);
        g_boEffect := ini.ReadBool ('Option', 'ViewEffect', g_boEffect);
        g_boHPView := ini.ReadBool ('Option', 'ViewHPType', g_boHPView);
        g_boNameAllView := ini.ReadBool ('Option', 'ViewAllName', g_boNameAllView);
        g_boNameChNpView := ini.ReadBool ('Option', 'ViewChNpName', g_boNameChNpView);
        g_boNameMonView := ini.ReadBool ('Option', 'ViewMonName', g_boNameMonView);
        g_boShowGreenHint := ini.ReadBool ('Option', 'ShowHintScreen', g_boShowGreenHint);
        g_boMarkMode := ini.ReadInteger ('Option', 'GuildMarkMode', g_boMarkMode);
        g_boShowHealth := ini.ReadBool ('Option', 'ShowHealth', g_boShowHealth);
        g_MoExpMsg := ini.ReadBool ('Option', 'ExpMsgMode', g_MoExpMsg);
        AuctionView := ini.ReadBool ('Option', 'AuctionView', AuctionView);

        nHero1Index  := ini.ReadInteger ('Hero', 'Hero1Index', nHero1Index);
        nHero2Index  := ini.ReadInteger ('Hero', 'Hero2Index', nHero2Index);
        nHero1Percent := ini.ReadInteger ('Hero', 'Hero1Percent', nHero1Percent);
        nHero2Percent := ini.ReadInteger ('Hero', 'Hero2Percent', nHero2Percent);

        sPetOption := ini.ReadString('Pet', 'PetOption', sPetOption);
        PetOption(sPetOption);
      end;
      Ini.Free;
    end;
  end;
var
  sDirname, sFileName: string;
begin
  if g_boSaveIDInfo then
    exit;
  g_boSaveIDInfo := True;
  sDirname := Format(DG_FORMATSTR, [DG_SAVEDIR, g_sServerName, LoginScene.m_sLoginId]);

  sFileName := sDirname + Charname +'.opt';
  LoadInfo(sFileName);

  sFileName := sDirname + Charname + FriendListFile;
  if FileExists(sFileName) then
    g_FriendList.LoadFromFile(sFileName);

  sFileName := sDirname + Charname + blackListFile;
  if FileExists(sFileName) then
    g_MyBlacklist.LoadFromFile(sFileName);
end;


procedure SaveBags (flname: string; pbuf: Pbyte);
var
   fhandle: integer;
   sDirname, sFileName: string;
begin
  if not DirectoryExists(DG_SAVEDIR) then
    CreateDir(DG_SAVEDIR);
  sDirname := DG_SAVEDIR + g_sServerName + '\';
  if not DirectoryExists(sDirname) then
    CreateDir(sDirname);
  sDirname := sDirname + LoginScene.m_sLoginId + '\';
  if not DirectoryExists(sDirname) then
    CreateDir(sDirname);

  sFileName := sDirname + flname;
  if FileExists (sFileName) then
    fhandle := FileOpen (sFileName, fmOpenWrite or fmShareDenyNone)
  else fhandle := FileCreate (sFileName);
  if fhandle > 0 then begin
    FileWrite (fhandle, pbuf^, sizeof(TClientItem) * MAXBAGITEMCL);
    FileClose (fhandle);
  end;
end;



procedure Loadbags (flname: string; pbuf: Pbyte);
var
  fhandle: integer;
  sDirname, sFileName: string;
begin
  sDirname := Format(DG_FORMATSTR, [DG_SAVEDIR, g_sServerName, LoginScene.m_sLoginId]);
  sFileName := sDirname + flname;

  if FileExists (sFileName) then begin
     fhandle := FileOpen (sFileName, fmOpenRead or fmShareDenyNone);
     if fhandle > 0 then begin
       FileRead (fhandle, pbuf^, sizeof(TClientItem) * MAXBAGITEMCL);
       FileClose (fhandle);
     end;
  end;
end;



procedure SaveStores (flname: string; pbuf: Pbyte);
var
   fhandle: integer;
begin
   if FileExists (flname) then
      fhandle := FileOpen (flname, fmOpenWrite or fmShareDenyNone)
   else fhandle := FileCreate (flname);
   if fhandle > 0 then begin
      FileWrite (fhandle, pbuf^, sizeof(TClientItem) * MAXSTORAGEITEMCL);
      FileClose (fhandle);
   end;
end;

procedure LoadStores (flname: string; pbuf: Pbyte);
var
   fhandle: integer;
begin
   if FileExists (flname) then begin
      fhandle := FileOpen (flname, fmOpenRead or fmShareDenyNone);
      if fhandle > 0 then begin
         FileRead (fhandle, pbuf^, sizeof(TClientItem) * MAXSTORAGEITEMCL);
         FileClose (fhandle);
      end;
   end;
end;

procedure ClearBag;
var
   i: integer;
begin
   for i:=0 to MAXBAGITEMCL-1 do
      g_ItemArr[i].S.Name := '';
end;

procedure ClearStore;
var
   i: integer;
begin
   for i:=0 to MAXSTORAGEITEMCL-1 do
      g_StoreItem[i].S.Name := '';
end;

procedure ClearHeroStore;
var
   i: integer;
begin
   for i:=0 to MAXSTORAGEITEMCL-1 do
      g_HeroStoreItem[i].S.Name := '';
end;

function  AddItemBag (cu: TClientItem): Boolean;
var
   i: integer;
   InputCheck : Boolean;
begin
   Result := FALSE;
   InputCheck := False;
   for i:=0 to MAXBAGITEMCL-1 do begin
      if (g_ItemArr[i].MakeIndex = cu.MakeIndex) and (g_ItemArr[i].S.Name = cu.S.Name) then begin
       //  g_ItemArr[i] := cu;
       //  Result := TRUE;
         exit;     //잔상
      end;
   end;

   if cu.S.Name = '' then exit;
   if (cu.S.StdMode = 25) then begin //독가루, 부적
      for i:=4 to 5 do
         if g_ItemArr[i].S.Name = '' then begin
            g_ItemArr[i] := cu;
            Result := TRUE;
            exit;
         end;
   end;

  { if cu.S.StdMode in [0,1] then begin
      for i:=0 to 5 do               //바닥 물약 먹으면 벨트로 들어간다.
         if g_ItemArr[i].S.Name = '' then begin
            g_ItemArr[i] := cu;
            Result := TRUE;
            exit;
         end;
   end;    }

   for i:=6 to MAXBAGITEMCL-1 do begin
      if (g_ItemArr[i].S.StdMode in [0,1,3,45,46]) and (g_ItemArr[i].S.Name = cu.S.Name) and
          (g_ItemArr[i].MakeIndex = cu.MakeIndex) then begin
          g_ItemArr[i].Amount := g_ItemArr[i].Amount + cu.Amount;
          cu.Amount := 0;
          InputCheck := True;
      end;
   end;

   if not InputCheck then begin
     for i:=6 to MAXBAGITEMCL-1 do begin
        if g_ItemArr[i].S.Name = '' then begin
           g_ItemArr[i] := cu;
           Result := TRUE;
           break;
        end;
     end;
   end;
   ArrangeItembag;
end;

function  AddItemBag2 (cu: TClientItem): Boolean;    //물약
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to MAXBAGITEMCL-1 do begin
      if (g_ItemArr[i].MakeIndex = cu.MakeIndex) and (g_ItemArr[i].S.Name = cu.S.Name) then begin
            g_ItemArr[i] := cu;
            Result := TRUE;
            exit;
      end;
   end;
end;


function  AddBuyItemBag (cu: SBuyItem): Boolean;    //상인
var
   i: integer;
begin
  Result := False;
   for i:=0 to MAXBUYITEM-1 do begin
      if G_BuyItem[i].entItem.S.Name = '' then begin
         G_BuyItem[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
end;


function  GetSameItemFromBag (cu: TClientItem): Integer;
var
   i : integer;
   InputCheck : Boolean;
begin
   Result := -100;
//   for i:=6 to MAXBAGITEMCL-1 do begin
   for i:=MAXBAGITEMCL-1 Downto 6 do begin
      if (g_ItemArr[i].S.StdMode = cu.S.StdMode) and (g_ItemArr[i].S.Shape = cu.S.Shape) and
         (g_ItemArr[i].S.Name <> '') and (g_ItemArr[i].S.Looks = cu.S.Looks) and
         (g_ItemArr[i].S.Price = cu.S.Price) then begin
         Result := i;
         Exit;
      end;
   end;
end;

function AddItemStore (cu: TClientItem): Boolean;
var
   i: integer;
begin
   Result := FALSE;

   if cu.S.Name = '' then exit;
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if g_StoreItem[i].S.Name = '' then begin
         g_StoreItem[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
   ArrangeItemStore;
end;

function AddItemStore2 (cu: TClientItem): Boolean;
var
   i: integer;
begin
   Result := FALSE;

   if cu.S.Name = '' then exit;
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if (g_StoreItem[i].MakeIndex = cu.MakeIndex) and (g_StoreItem[i].S.Name = cu.S.Name) then begin
         g_StoreItem[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
end;



function AddItemHeroStore (cu: TClientItem): Boolean;
var
   i: integer;
begin
   Result := FALSE;

   if cu.S.Name = '' then exit;
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if g_HeroStoreItem[i].S.Name = '' then begin
         g_HeroStoreItem[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
   ArrangeItemStore;
end;

function AddItemHeroStore2 (cu: TClientItem): Boolean;
var
   i: integer;
begin
   Result := FALSE;

   if cu.S.Name = '' then exit;
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if (g_HeroStoreItem[i].MakeIndex = cu.MakeIndex) and (g_HeroStoreItem[i].S.Name = cu.S.Name) then begin
         g_HeroStoreItem[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
end;


function  AddItemBagst (cu: TClientItem): Boolean;
var
  i:integer;
begin
  Result := FALSE;

  if cu.Amount > 1 then begin
    for i:=0 to MAXBAGITEMCL-1 do begin
      if (g_ItemArr[i].MakeIndex = cu.MakeIndex) and (g_ItemArr[i].S.Name = cu.S.Name) then begin
        inc(g_ItemArr[i].Amount,cu.Amount);
        Result := TRUE;
        exit;
      end;
    end;
    Result := AddItemBag(cu);
  end else
    Result := AddItemBag(cu);
end;

procedure Fillquickslots(sname: String; smode,position: integer);  //물약
var
  i: integer;
begin

  if position = -1 then begin
    for i := 0 to 6 do begin
      if g_ItemArr[i].S.Name = sName then begin
        position := 1;
        break
      end;
    end;
  end;
  if g_ItemArr[position].S.Name <> '' then exit;
  for i:=6 to MAXBAGITEMCL-1 do begin
    if (g_ItemArr[i].S.Name = sName) and (g_ItemArr[i].S.StdMode in [0,1,3]) then begin
      g_ItemArr[position] := g_ItemArr[i];
      FillChar (g_ItemArr[i], sizeof(TClientItem), #0);
      exit;
    end;
  end;

end;


function  UpdateItemBag (cu: TClientItem): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=MAXBAGITEMCL-1 downto 0 do begin
      if (g_ItemArr[i].S.Name = cu.S.Name) and (g_ItemArr[i].MakeIndex = cu.MakeIndex) then begin
         g_ItemArr[i] := cu;
         Result := TRUE;
         break;
      end;
   end;
end;

function  DelItemBag (iname: string; iindex: integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=MAXBAGITEMCL-1 downto 0 do begin
      if (g_ItemArr[i].S.Name = iname) and (g_ItemArr[i].MakeIndex = iindex) then begin
         FillChar (g_ItemArr[i], sizeof(TClientItem), #0);
         Result := TRUE;
         break;
      end;
   end;
   ArrangeItembag;
end;

function  DelUpwaItemBag (iname: string; iindex: integer): Boolean;   //재련
var
   i: integer;
begin
   Result := FALSE;
   for i:= 15 downto 0 do begin
      if (G_UpWaponItem[i].S.Name = iname) and (G_UpWaponItem[i].MakeIndex = iindex) then begin
         FillChar (G_UpWaponItem[i], sizeof(TClientItem), #0);
         Result := TRUE;
         break;
      end;
   end;
end;

procedure DelStoreItem(ci: TClientItem);      //개인상점
var
  I: Integer;
begin
  for I := 0 to 14 do begin
    if (g_StoreItems[I].Item.S.Name = ci.S.Name) and (g_StoreItems[I].Item.MakeIndex = ci.MakeIndex) then begin
      FillChar(g_StoreItems[I].Item, SizeOf(TClientItem), #0);
      Break;
    end;
  end;
end;

procedure DelStoreRemoteItem(ci: TClientItem);     //개인상점
var
  I: Integer;
begin
  for I := 0 to 14 do begin
    if (g_StoreRemoteItems[I].Item.S.Name = ci.S.Name) and (g_StoreRemoteItems[I].Item.MakeIndex = ci.MakeIndex) then begin
      FillChar(g_StoreRemoteItems[I].Item, SizeOf(TClientItem), #0);
      Break;
    end;
  end;
end;

procedure ArrangeItemBag;
var
   i, k: integer;
begin
   //중복된 아이템이 있으면 없앤다.
   for i:=0 to MAXBAGITEMCL-1 do begin
      if g_ItemArr[i].S.Name <> '' then begin
         for k:=i+1 to MAXBAGITEMCL-1 do begin
            if (g_ItemArr[i].S.Name = g_ItemArr[k].S.Name) and (g_ItemArr[i].MakeIndex = g_ItemArr[k].MakeIndex) then begin
              if (g_ItemArr[i].S.StdMode in [0,1,3,45,46]) then begin
                g_ItemArr[i].Amount := g_ItemArr[i].Amount + g_ItemArr[k].Amount;
                FillChar (g_ItemArr[k], sizeof(TClientItem), #0);
              end else begin
                FillChar (g_ItemArr[k], sizeof(TClientItem), #0);
              end;
            end;
         end;
         if (g_ItemArr[i].S.Name = g_MovingItem.Item.S.Name) and (g_ItemArr[i].MakeIndex = g_MovingItem.Item.MakeIndex) then begin
            g_MovingItem.Index := 0;
            g_MovingItem.Item.S.Name := '';
         end;
      end;
   end;
   //가방의 안보이는 부분에 있으면 끌어 올린다.
   for i:=46 to MAXBAGITEMCL-1 do begin
      if g_ItemArr[i].S.Name <> '' then begin
         for k:=0 to 45 do begin  //for k:=6 to 45 do begin
            if g_ItemArr[k].S.Name = '' then begin
               g_ItemArr[k] := g_ItemArr[i];
               g_ItemArr[i].S.Name := '';
               break;
            end;
         end;
      end;
   end;
end;

procedure ArrangeItemStore;
var
   i, k: integer;
begin
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if g_StoreItem[i].S.Name <> '' then begin
         for k:=i+1 to MAXSTORAGEITEMCL-1 do begin
            if (g_StoreItem[i].S.Name = g_StoreItem[k].S.Name) and (g_StoreItem[i].MakeIndex = g_StoreItem[k].MakeIndex) then begin
              if (g_StoreItem[k].S.StdMode =45)then
              FillChar (g_StoreItem[k], sizeof(TClientItem), #0);
            end;
         end;

         if (g_StoreItem[i].S.Name = g_MovingItem.Item.S.Name) and (g_StoreItem[i].MakeIndex = g_MovingItem.Item.MakeIndex) then begin
            g_MovingItem.Index := 0;
            g_MovingItem.Item.S.Name := '';
         end;
      end;
   end;

end;


procedure ArrangeItemHeroStore;
var
   i, k: integer;
begin
   for i:=0 to MAXSTORAGEITEMCL-1 do begin
      if g_HeroStoreItem[i].S.Name <> '' then begin
         for k:=i+1 to MAXSTORAGEITEMCL-1 do begin
            if (g_HeroStoreItem[i].S.Name = g_HeroStoreItem[k].S.Name) and (g_HeroStoreItem[i].MakeIndex = g_HeroStoreItem[k].MakeIndex) then begin
              if (g_HeroStoreItem[k].S.StdMode =45)then
              FillChar (g_HeroStoreItem[k], sizeof(TClientItem), #0);
            end;
         end;

         if (g_HeroStoreItem[i].S.Name = g_MovingItem.Item.S.Name) and (g_HeroStoreItem[i].MakeIndex = g_MovingItem.Item.MakeIndex) then begin
            g_MovingItem.Index := 0;
            g_MovingItem.Item.S.Name := '';
         end;
      end;
   end;

end;
{----------------------------------------------------------}

procedure AddWakeUpItem (ci: TClientItem);   //각성
var
   i: integer;
begin
   for i:=0 to 1 do begin
      if WakeUpItemArr[i].S.Name = '' then begin
         WakeUpItemArr[i] := ci;
         break;
      end;
   end;
end;
function StrWakeUpItem (): string;       //각성
var
   i: integer;
   data : string;
begin
   data := '';
   for i:=0 to 1 do begin
      if WakeUpItemArr[i].S.Name <> ''  then begin
         data := data + IntToStr( WakeUpItemArr[i].MakeIndex ) + ':';
         data := data + WakeUpItemArr[i].S.Name + IntToStr(WakeUpItemArr[i].S.Grade) + ':';
         if (WakeUpItemArr[i].Amount > 0) and (WakeUpItemArr[i].S.StdMode in [46]) then
          data := data + IntToStr( WakeUpItemArr[i].Amount ) + '/'
         else
          data := data + '1/';
      end;
   end;
   Result := data;
end;
procedure MoveWakeUpItemToBag;     //각성
var
   i: integer;
begin
   for i:=0 to 1 do begin
      if WakeUpItemArr[i].S.Name <> '' then
         AddItemBag (WakeUpItemArr[i]);
         WakeUpItemArr[i].S.Name := '';
   end;
end;

procedure DelWakeUpItem;     //각성
var
   i: integer;
begin
   for i:=0 to 1 do begin
     if WakeUpItemArr[i].S.Name <> '' then
        WakeUpItemArr[i].S.Name := '';
   end;
end;

{----------------------------------------------------------}


{----------------------------------------------------------}

procedure AddDropItem (ci: TClientItem);     //아이템 버림
var
   pc: PTClientItem;
begin
   new (pc);
   pc^ := ci;
   DropItems.Add (pc);
end;

function  GetDropItem (iname: string; MakeIndex: integer): PTClientItem;
var
   i: integer;
begin
   Result := nil;
   for i:=0 to DropItems.Count-1 do begin
      if (PTClientItem(DropItems[i]).S.Name = iname) and (PTClientItem(DropItems[i]).MakeIndex = MakeIndex) then begin
         Result := PTClientItem(DropItems[i]);
         break;
      end;
   end;
end;

procedure DelDropItem (iname: string; MakeIndex: integer);
var
   i: integer;
begin
   for i:=0 to DropItems.Count-1 do begin
      if (PTClientItem(DropItems[i]).S.Name = iname) and (PTClientItem(DropItems[i]).MakeIndex = MakeIndex) then begin
         Dispose (PTClientItem(DropItems[i]));
         DropItems.Delete (i);
         break;
      end;
   end;
end;

function GetBagItemCount(): Integer;
var
  i, k: integer;
begin
   Result := 0;
   k := 0;
   for i:= 0 to 45 do begin
      if (g_ItemArr[i].S.Name = '') then
       inc(k);
      if i = 45 then break;
   end;
   Result :=  k;
end;

 {----------------------------------------------------------}


function  ChangeItemCount ( mindex :integer; Count, MsgNum :word; iname :string ): Boolean;
var
   i : integer;
begin
   Result := False;
   for i:=0 to MAXBAGITEMCL-1 do begin
      if (g_ItemArr[i].MakeIndex = mindex) and (g_ItemArr[i].S.Name = iname) and
         (g_ItemArr[i].S.StdMode in [0,1,3,45,46])  then begin
         if Count < 1 then begin
            g_ItemArr[i].S.Name := '';
            Count := 0;
         end;
         g_ItemArr[i].Amount := Count;
         Result := True;
         Break;
      end;
   end;
   ArrangeItembag;

   if MsgNum = 1 then DScreen.AddSysMsg ('<CO$FFFF>' + FilterShowName(g_ItemArr[i].S, iname) + '<CE>을 얻었습니다.', 40, 60, clWhite);

end;
{----------------------------------------------------------}

procedure AddDealItem (ci: TClientItem);         //거래
var
   i: integer;
begin
   for i:=0 to 10-1 do begin
      if g_DealItems[i].S.Name = '' then begin
         g_DealItems[i] := ci;
         break;
      end;
   end;
end;

procedure DelDealItem (ci: TClientItem);         //거래
var
   i: integer;
begin
   for i:=0 to 10-1 do begin
      if (g_DealItems[i].S.Name = ci.S.Name) and (g_DealItems[i].MakeIndex = ci.MakeIndex) then begin
         FillChar (g_DealItems[i], sizeof(TClientItem), #0);
         break;
      end;
   end;
end;

procedure MoveDealItemToBag;                  //거래
var
   I,II: integer;
   boAdded:Boolean;
begin
  for i:=0 to 10-1 do begin
    if g_DealItems[i].S.Name <> '' then begin
      boAdded:=FALSE;
     { if (g_DealItems[i].S.StdMode =45) then begin //only stdmode 45 stacks
            for II:=0 to MAXBAGITEMCL-1 do begin
              if (g_ItemArr[II].MakeIndex = g_DealItems[I].MakeIndex) and (g_ItemArr[II].S.Name = g_DealItems[I].S.Name) then begin
                inc(g_ItemArr[II].Amount,g_DealItems[I].Amount);
                boAdded:=TRUE;
                continue;
              end;
            end;
      end; }
      if boAdded = FALSE then
        AddItemBag (g_DealItems[i]);
    end;
  end;
  FillChar (g_DealItems, sizeof(TClientItem)*10, #0);
end;

procedure AddDealRemoteItem (ci: TClientItem);     //거래
var
   i: integer;
begin
   for i:=0 to 20-1 do begin
      if g_DealRemoteItems[i].S.Name = '' then begin
         g_DealRemoteItems[i] := ci;
         break;
      end;
   end;
end;

procedure DelDealRemoteItem (ci: TClientItem);      //거래
var
   i: integer;
begin
   for i:=0 to 20-1 do begin
      if (g_DealRemoteItems[i].S.Name = ci.S.Name) and (g_DealRemoteItems[i].MakeIndex = ci.MakeIndex) then begin
         FillChar (g_DealRemoteItems[i], sizeof(TClientItem), #0);
         break;
      end;
   end;
end;

{----------------------------------------------------------}



procedure AddAutItem (ci: TClientItem);  //경매
begin
  if g_ActionItems.S.Name = '' then begin
     g_ActionItems := ci;
   end;
end;



{----------------------------------------------------------}

procedure AddRentalItem (ci: TClientItem);         //대여
begin
  if g_RentalItems.S.Name = '' then begin
     g_RentalItems := ci;
   end;
end;

procedure DelRentalItem (ci: TClientItem);        //대여
begin
  if (g_RentalItems.S.Name = ci.S.Name) and (g_RentalItems.MakeIndex = ci.MakeIndex) then begin
         FillChar (g_RentalItems, sizeof(TClientItem), #0);
  end;
end;

procedure MoveRentalItemToBag;                 //대여
var
   boAdded:Boolean;
begin
    if g_RentalItems.S.Name <> '' then begin
      boAdded:=FALSE;

      if boAdded = FALSE then
        AddItemBag (g_RentalItems);
    end;
  FillChar (g_RentalItems, sizeof(TClientItem), #0);
end;

procedure AddRentalRemoteItem (ci: TClientItem);     //대여
begin
  if g_RentalRemoteItems.S.Name = '' then begin
    g_RentalRemoteItems := ci;
   end;
end;

procedure DelRentalRemoteItem (ci: TClientItem);      //대여
begin
  if (g_RentalRemoteItems.S.Name = ci.S.Name) and (g_RentalRemoteItems.MakeIndex = ci.MakeIndex) then begin
     FillChar (g_RentalRemoteItems, sizeof(TClientItem), #0);
  end;
end;

{----------------------------------------------------------}

procedure AddMakeItem (ci: TClientItem);       //제조스쳐
var
   i: integer;
begin
   for i:=0 to 5 do begin
      if MakeItemArr[i].S.Name = '' then begin
         MakeItemArr[i] := ci;
         break;
      end;
   end;
end;

function SearchOverlapItem (ci: TClientItem): Boolean;       //제조스쳐
var
   i: integer;
begin
   Result := False;
   for i:=0 to 5 do begin
      if (MakeItemArr[i].S.Name = ci.S.Name) and (MakeItemArr[i].Amount > 0) and (MakeItemArr[i].S.StdMode in [0,1,3,45,46]) then begin
         Result := True;
         Break;
      end
   end;
end;

function MakeStrMakeItem (): string;       //제조스쳐
var
   i: integer;
   data : string;
begin
   data := '';
   for i:=0 to 5 do begin
      if MakeItemArr[i].S.Name <> ''  then begin
         data := data + IntToStr( MakeItemArr[i].MakeIndex ) + ':';
         data := data + MakeItemArr[i].S.Name + ':';
         if (MakeItemArr[i].Amount > 0) and (MakeItemArr[i].S.StdMode in [0,1,3,45,46]) then
          data := data + IntToStr( MakeItemArr[i].Amount ) + '/'
         else
          data := data + '1/';
      end;
   end;
   Result := data;
end;

procedure MoveMakeItemToBag;       //제조스쳐
var
   i: integer;
begin
   for i:=0 to 5 do begin
      if MakeItemArr[i].S.Name <> '' then
         AddItemBag (MakeItemArr[i]);
         MakeItemArr[i].S.Name := '';
   end;
end;
procedure DelMakingItem (ci: TClientItem);
var
   i: integer;
begin
   for i:=0 to 5 do begin
      if (MakeItemArr[i].S.Name = ci.S.Name) and (MakeItemArr[i].MakeIndex = ci.MakeIndex) then begin
         FillChar (MakeItemArr[i], sizeof(TClientItem), #0);
         break;
      end;
   end;
end;

{----------------------------------------------------------}

function  GetDistance (sx, sy, dx, dy: integer): integer;
begin
   Result := _MAX(abs(sx-dx), abs(sy-dy));
end;

function CheckBeeline(nX, nY, sX, sY: Integer): Boolean;
begin
  Result := False;
  if nX = sX then
    Result := True;
  if nY = sY then
    Result := True;
  if abs(nX - sX) = abs(nY - sY) then
    Result := True;
end;

procedure GetNextPosXY (dir: byte; var x, y:Integer);
begin
   case dir of
      DR_UP:     begin x := x;   y := y-1; end;
      DR_UPRIGHT:   begin x := x+1; y := y-1; end;
      DR_RIGHT:  begin x := x+1; y := y; end;
      DR_DOWNRIGHT:  begin x := x+1; y := y+1; end;
      DR_DOWN:   begin x := x;   y := y+1; end;
      DR_DOWNLEFT:   begin x := x-1; y := y+1; end;
      DR_LEFT:   begin x := x-1; y := y; end;
      DR_UPLEFT:  begin x := x-1; y := y-1; end;
   end;
end;

procedure GetNextRunXY (dir: byte; var x, y:Integer);
begin
   case dir of
      DR_UP:     begin x := x;   y := y-2; end;
      DR_UPRIGHT:   begin x := x+2; y := y-2; end;
      DR_RIGHT:  begin x := x+2; y := y; end;
      DR_DOWNRIGHT:  begin x := x+2; y := y+2; end;
      DR_DOWN:   begin x := x;   y := y+2; end;
      DR_DOWNLEFT:   begin x := x-2; y := y+2; end;
      DR_LEFT:   begin x := x-2; y := y; end;
      DR_UPLEFT:  begin x := x-2; y := y-2; end;
   end;
end;
procedure GetNextHorseRunXY (dir: byte; var x, y:Integer);
begin
   case dir of
      DR_UP:     begin x := x;   y := y-3; end;
      DR_UPRIGHT:   begin x := x+3; y := y-3; end;
      DR_RIGHT:  begin x := x+3; y := y; end;
      DR_DOWNRIGHT:  begin x := x+3; y := y+3; end;
      DR_DOWN:   begin x := x;   y := y+3; end;
      DR_DOWNLEFT:   begin x := x-3; y := y+3; end;
      DR_LEFT:   begin x := x-3; y := y; end;
      DR_UPLEFT:  begin x := x-3; y := y-3; end;
   end;
end;
procedure GetNextSpeedRunXY (dir: byte; var x, y:Integer);   //경신보
begin
   case dir of
      DR_UP:     begin x := x;   y := y-3; end;
      DR_UPRIGHT:   begin x := x+3; y := y-3; end;
      DR_RIGHT:  begin x := x+3; y := y; end;
      DR_DOWNRIGHT:  begin x := x+3; y := y+3; end;
      DR_DOWN:   begin x := x;   y := y+3; end;
      DR_DOWNLEFT:   begin x := x-3; y := y+3; end;
      DR_LEFT:   begin x := x-3; y := y; end;
      DR_UPLEFT:  begin x := x-3; y := y-3; end;
   end;
end;

function GetNextDirection (sx, sy, dx, dy: Integer): byte;
var
   flagx, flagy: integer;
begin
   Result := DR_DOWN;
   if sx < dx then flagx := 1
   else if sx = dx then flagx := 0
   else flagx := -1;
   if abs(sy-dy) > 2
    then if (sx >= dx-1) and (sx <= dx+1) then flagx := 0;

   if sy < dy then flagy := 1
   else if sy = dy then flagy := 0
   else flagy := -1;
   if abs(sx-dx) > 2 then if (sy > dy-1) and (sy <= dy+1) then flagy := 0;

   if (flagx = 0)  and (flagy = -1) then Result := DR_UP;
   if (flagx = 1)  and (flagy = -1) then Result := DR_UPRIGHT;
   if (flagx = 1)  and (flagy = 0)  then Result := DR_RIGHT;
   if (flagx = 1)  and (flagy = 1)  then Result := DR_DOWNRIGHT;
   if (flagx = 0)  and (flagy = 1)  then Result := DR_DOWN;
   if (flagx = -1) and (flagy = 1)  then Result := DR_DOWNLEFT;
   if (flagx = -1) and (flagy = 0)  then Result := DR_LEFT;
   if (flagx = -1) and (flagy = -1) then Result := DR_UPLEFT;
end;

function  GetBack (dir: integer): integer;
begin
   Result := DR_UP;
   case dir of
      DR_UP:     Result := DR_DOWN;
      DR_DOWN:   Result := DR_UP;
      DR_LEFT:   Result := DR_RIGHT;
      DR_RIGHT:  Result := DR_LEFT;
      DR_UPLEFT:     Result := DR_DOWNRIGHT;
      DR_UPRIGHT:    Result := DR_DOWNLEFT;
      DR_DOWNLEFT:   Result := DR_UPRIGHT;
      DR_DOWNRIGHT:  Result := DR_UPLEFT;
   end;
end;

procedure GetBackPosition (sx, sy, dir: integer; var newx, newy: integer);
begin
   newx := sx;
   newy := sy;
   case dir of
      DR_UP:      newy := newy+1;
      DR_DOWN:    newy := newy-1;
      DR_LEFT:    newx := newx+1;
      DR_RIGHT:   newx := newx-1;
      DR_UPLEFT:
         begin
            newx := newx + 1;
            newy := newy + 1;
         end;
      DR_UPRIGHT:
         begin
            newx := newx - 1;
            newy := newy + 1;
         end;
      DR_DOWNLEFT:
         begin
            newx := newx + 1;
            newy := newy - 1;
         end;
      DR_DOWNRIGHT:
         begin
            newx := newx - 1;
            newy := newy - 1;
         end;
   end;
end;

procedure GetFrontPosition (sx, sy, dir: integer; var newx, newy: integer);
begin
   newx := sx;
   newy := sy;
   case dir of
      DR_UP:      newy := newy-1;
      DR_DOWN:    newy := newy+1;
      DR_LEFT:    newx := newx-1;
      DR_RIGHT:   newx := newx+1;
      DR_UPLEFT:
         begin
            newx := newx - 1;
            newy := newy - 1;
         end;
      DR_UPRIGHT:
         begin
            newx := newx + 1;
            newy := newy - 1;
         end;
      DR_DOWNLEFT:
         begin
            newx := newx - 1;
            newy := newy + 1;
         end;
      DR_DOWNRIGHT:
         begin
            newx := newx + 1;
            newy := newy + 1;
         end;
   end;
end;


procedure GetFrontPosition2 (sx, sy, dir: integer; var newx, newy: integer);   //낚시
begin
   newx := sx;
   newy := sy;
   case dir of
      DR_UP:      newy := newy-3*UNITY;
      DR_DOWN:    newy := newy+3*UNITY;
      DR_LEFT:    newx := newx-3*UNITX;
      DR_RIGHT:   newx := newx+3*UNITX;
      DR_UPLEFT:
         begin
            newx := newx - 3*UNITX;;
            newy := newy - 3*UNITY;
         end;
      DR_UPRIGHT:
         begin
            newx := newx + 3*UNITX;;
            newy := newy - 3*UNITY;
         end;
      DR_DOWNLEFT:
         begin
            newx := newx - 3*UNITX;;
            newy := newy + 3*UNITY;
         end;
      DR_DOWNRIGHT:
         begin
            newx := newx + 3*UNITX;;
            newy := newy + 3*UNITY;
         end;
   end;
end;

function  GetFlyDirection (sx, sy, ttx, tty: integer): Integer;
var
   fx, fy: Real;
begin
   fx := ttx - sx;
   fy := tty - sy;
   sx := 0;
   sy := 0;
   Result := DR_DOWN;
   if fx=0 then begin
      if fy < 0 then Result := DR_UP
      else Result := DR_DOWN;
      exit;
   end;
   if fy=0 then begin
      if fx < 0 then Result := DR_LEFT
      else Result := DR_RIGHT;
      exit;
   end;
   if (fx > 0) and (fy < 0) then begin
      if -fy > fx*2.5 then Result := DR_UP
      else if -fy < fx/3 then Result := DR_RIGHT
      else Result := DR_UPRIGHT;
   end;
   if (fx > 0) and (fy > 0) then begin
      if fy < fx/3 then Result := DR_RIGHT
      else if fy > fx*2.5 then Result := DR_DOWN
      else Result := DR_DOWNRIGHT;
   end;
   if (fx < 0) and (fy > 0) then begin
      if fy  < -fx/3 then Result := DR_LEFT
      else if fy > -fx*2.5 then Result := DR_DOWN
      else Result := DR_DOWNLEFT;
   end;
   if (fx < 0) and (fy < 0) then begin
      if -fy > -fx*2.5 then Result := DR_UP
      else if -fy < -fx/3 then Result := DR_LEFT
      else Result := DR_UPLEFT;
   end;
end;

function  GetFlyDirection16 (sx, sy, ttx, tty: integer): Integer;
var
   fx, fy: Real;
begin
   fx := ttx - sx;
   fy := tty - sy;
   sx := 0;
   sy := 0;
   Result := 0;
   if fx=0 then begin
      if fy < 0 then Result := 0
      else Result := 8;
      exit;
   end;
   if fy=0 then begin
      if fx < 0 then Result := 12
      else Result := 4;
      exit;
   end;
   if (fx > 0) and (fy < 0) then begin
      Result := 4;
      if -fy > fx/4 then Result := 3;
      if -fy > fx/1.9 then Result := 2;
      if -fy > fx*1.4 then Result := 1;
      if -fy > fx*4 then Result := 0;
   end;
   if (fx > 0) and (fy > 0) then begin
      Result := 4;
      if fy > fx/4 then Result := 5;
      if fy > fx/1.9 then Result := 6;
      if fy > fx*1.4 then Result := 7;
      if fy > fx*4 then Result := 8;
   end;
   if (fx < 0) and (fy > 0) then begin
      Result := 12;
      if fy > -fx/4 then Result := 11;
      if fy > -fx/1.9 then Result := 10;
      if fy > -fx*1.4 then Result := 9;
      if fy > -fx*4 then Result := 8;
   end;
   if (fx < 0) and (fy < 0) then begin
      Result := 12;
      if -fy > -fx/4 then Result := 13;
      if -fy > -fx/1.9 then Result := 14;
      if -fy > -fx*1.4 then Result := 15;
      if -fy > -fx*4 then Result := 0;
   end;
end;

function  PrivDir (ndir: integer): integer;
begin
   if ndir - 1 < 0 then Result := 7
   else Result := ndir-1;
end;

function  NextDir (ndir: integer): integer;
begin
   if ndir + 1 > 7 then Result := 0
   else Result := ndir+1;
end;

procedure BoldTextOut (surface: TDirectDrawSurface; x, y, fcolor, bcolor: integer; str: string);
begin
   with surface do begin
      Canvas.Font.Color := bcolor;
      Canvas.TextOut (x-1, y, str);
      Canvas.TextOut (x+1, y, str);
      Canvas.TextOut (x, y-1, str);
      Canvas.TextOut (x, y+1, str);
      Canvas.Font.Color := fcolor;
      Canvas.TextOut (x, y, str);
   end;
end;

procedure TextOutA (surface: TDirectDrawSurface; x, y, fcolor: integer; str: string);
begin
   with surface do begin
      Canvas.Font.Color := fcolor;
      Canvas.TextOut (x, y, str);
   end;
end;

procedure TextOutEx (surface: TDirectDrawSurface; x, y : integer; str: string; fcolor, bcolor: integer);
begin
   with surface do begin
      Canvas.Font.Color := fcolor;
      Canvas.Brush.Color := bcolor;
      Canvas.TextOut (x, y, str);
   end;
end;

function  GetTakeOnPosition (smode: integer): integer;
begin
   Result := -1;
   case smode of //StdMode
      5, 6, 7, 90, 99    :Result := U_WEAPON;   //무기 ,등선 무기 (벽혈 익선 홍현 비연)
      10, 11, 12   :Result := U_DRESS;//옷  ,등선 옷 (벽혈 익선 홍현 비연)
      15       :Result := U_HELMET;   //투구
      19,20,21 :Result := U_NECKLACE; //목걸이
      22,23    :Result := U_RINGL;    //반지
      24,26    :Result := U_ARMRINGR;  //팔찌
      30,28,29 :Result := U_RIGHTHAND;  //횃불
      25,51    :Result := U_BUJUK; //부적
      52,62    :Result := U_BOOTS; //신발
      53,63    :Result := U_CHARM; //수호석
      54,64    :Result := U_BELT;  //벨트
      101,102  :Result := U_TIGER;   //호랑이
    {  70       :Result := U_PETS1;    //호랑이
      71       :Result := U_PETS2;
      72       :Result := U_PETS3;
      73       :Result := U_PETS4;
      74       :Result := U_PETS5;

      80       :Result := U_FISH1;  //낚시
      81       :Result := U_FISH2;
      82       :Result := U_FISH3;
      83       :Result := U_FISH4;
      84       :Result := U_FISH5;  }
   end;
end;


function  GetTakeOnPositionTiger (smode: integer): integer;
begin
   Result := -1;
   case smode of //StdMode
      70       :Result := U_PETS1;    //호랑이
      71       :Result := U_PETS2;
      72       :Result := U_PETS3;
      73       :Result := U_PETS4;
      74       :Result := U_PETS5;

      80       :Result := U_FISH1;  //낚시
      81       :Result := U_FISH2;
      82       :Result := U_FISH3;
      83       :Result := U_FISH4;
      84       :Result := U_FISH5;
   end;
end;


function  IsKeyPressed (key: byte): Boolean;
var
   keyvalue: TKeyBoardState;
begin
   Result := FALSE;
   FillChar(keyvalue, sizeof(TKeyboardState), #0);
   if GetKeyboardState (keyvalue) then
      if (keyvalue[key] and $80) <> 0 then
         Result := TRUE;
end;

{----------------------------------------------------------}

procedure AddChangeFace (recogid: integer);
begin
   g_ChangeFaceReadyList.Add (pointer(recogid));
end;

procedure DelChangeFace (recogid: integer);
var
   i: integer;
begin
   for i:=0 to g_ChangeFaceReadyList.Count-1 do begin
      if integer(g_ChangeFaceReadyList[i]) = recogid then begin
         g_ChangeFaceReadyList.Delete (i);
         break;
      end;
   end;
end;

function  IsChangingFace (recogid: integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to g_ChangeFaceReadyList.Count-1 do begin
      if integer(g_ChangeFaceReadyList[i]) = recogid then begin
         Result := TRUE;
         break;
      end;
   end;
end;

procedure LoadDecoList(); //00488CDC
var
  I,n14:Integer;
  s18,s20,s24:String;
  LoadList:TStringList;
  sFileName:String;
  Decoration:pTDecoItem;
begin
  g_DecoList:= TList.create;
  sFileName:= 'Data\DecoItem.txt';
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
        g_DecoList.Add(Decoration);
        Dispose(Decoration);
      end;
    end;    // for
    FreeAndNil(LoadList);
  end;
end;

function FindDecoration(Number:integer):pTDecoItem;
var
  i:integer;
begin
  result := nil;
  for i:= 0 to g_DecoList.count -1 do begin
    if pTDecoItem(g_DecoList[i]).Appr = Number then begin
      result := g_DecoList[i];
      exit;
    end;
  end;
end;

 //========================여기서부터 영웅======================
function AddHeroItemBag(cu: TClientItem): Boolean;
var
  I, k: Integer;
  boFind: Boolean;
begin
  Result := False;
  boFind := False;
  for I := 0 to g_MyHero.m_nBagCount - 1 do begin
    if (g_HeroItemArr[I].MakeIndex = cu.MakeIndex) and (g_HeroItemArr[I].S.Name = cu.S.Name) then begin
      exit;     //잔상
    end;
  end;

  if cu.S.Name = '' then exit;
  if cu.S.StdMode in [0, 1] then begin //포션, 음식, 스크롤
    for i:=0 to 1 do
    if g_HeroItemArr[i].S.Name = '' then begin
      g_HeroItemArr[i] := cu;
      Result := TRUE;
      exit;
    end;
  end;


  for i:= 2 to g_MyHero.m_nBagCount - 1 do begin
     if (g_HeroItemArr[i].S.StdMode in [0,1,3,45,46]) and (g_HeroItemArr[i].S.Name = cu.S.Name) and
         (g_HeroItemArr[i].MakeIndex = cu.MakeIndex) then begin
         g_HeroItemArr[i].Amount := g_HeroItemArr[i].Amount + cu.Amount;
         cu.Amount := 0;
         boFind := True;
     end;
  end;

  if not boFind then begin
    for i:= 2 to g_MyHero.m_nBagCount - 1 do begin
       if g_HeroItemArr[i].S.Name = '' then begin
          g_HeroItemArr[i] := cu;
          Result := TRUE;
          break;
       end;
    end;
  end;

  if not Result then begin
    for k:= 0 to 1 do begin
      if g_HeroItemArr[k].S.Name = '' then begin
        g_HeroItemArr[k] := cu;
        Result := TRUE;
        break;
      end;
    end;
  end;
  ArrangeHeroItemBag;
end;

function  AddHeroItemBag2 (cu: TClientItem): Boolean;    //물약
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to g_MyHero.m_nBagCount - 1 do begin
      if (g_HeroItemArr[i].MakeIndex = cu.MakeIndex) and (g_HeroItemArr[i].S.Name = cu.S.Name) then begin
        g_HeroItemArr[i] := cu;
        Result := TRUE;
        exit;
      end;
   end;
end;

function UpdateHeroItemBag(cu: TClientItem): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := g_MyHero.m_nBagCount - 1 downto 0 do begin
    if (g_HeroItemArr[I].S.Name = cu.S.Name) and (g_HeroItemArr[I].MakeIndex = cu.MakeIndex) then begin
      g_HeroItemArr[I] := cu;
      Result := True;
      Break;
    end;
  end;
end;

function DelHeroItemBag(iname: string; iindex: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := g_MyHero.m_nBagCount - 1 downto 0 do begin
    if (g_HeroItemArr[I].S.Name = iname) and (g_HeroItemArr[I].MakeIndex = iindex) then begin
      FillChar(g_HeroItemArr[I], SizeOf(TClientItem), #0);
      Result := True;
      Break;
    end;
  end;
  ArrangeHeroItemBag;
end;

procedure ClearHeroBag;
var
  I: Integer;
begin
  for I := 0 to g_MyHero.m_nBagCount - 1 do
    g_HeroItemArr[I].S.Name := '';
end;

procedure ArrangeHeroItemBag;
var
  I, k: Integer;
begin
  for I := 0 to g_MyHero.m_nBagCount - 1 do begin
    if g_HeroItemArr[I].S.Name <> '' then begin
      for k := I + 1 to g_MyHero.m_nBagCount - 1 do begin
        if (g_HeroItemArr[I].S.Name = g_HeroItemArr[k].S.Name) and (g_HeroItemArr[I].MakeIndex = g_HeroItemArr[k].MakeIndex) then begin
          if (g_HeroItemArr[I].S.StdMode in [0,1,3,45,46]) then begin
            g_HeroItemArr[i].Amount := g_HeroItemArr[i].Amount + g_HeroItemArr[k].Amount;
            FillChar (g_HeroItemArr[k], sizeof(TClientItem), #0);
          end else begin
            FillChar (g_HeroItemArr[k], sizeof(TClientItem), #0);
          end;
        end;
      end;
      if (g_HeroItemArr[I].S.Name = g_MovingItem.Item.S.Name) and (g_HeroItemArr[I].MakeIndex = g_MovingItem.Item.MakeIndex) then begin
        g_MovingItem.Index := 0;
        g_MovingItem.Item.S.Name := '';
      end;
    end;
  end;

  //가방의 안보이는 부분에 있으면 끌어 올린다.
  { for i:= 0 to 1 do begin
      if g_HeroItemArr[i].S.Name <> '' then begin
         for k:= 0 to g_MyHero.m_nBagCount - 1 do begin  
            if g_HeroItemArr[k].S.Name = '' then begin
               g_HeroItemArr[k] := g_HeroItemArr[i];
               g_HeroItemArr[i].S.Name := '';
               break;
            end;
         end;
      end;
   end;     }

end;

function GetHeroBagItemCount(): Integer;
var
  i, k: integer;
begin
   Result := 0;
   k := 0;
   for i:= 0 to g_MyHero.m_nBagCount - 1 do begin
      if (g_HeroItemArr[i].S.Name = '') then
       inc(k);
      if i = (g_MyHero.m_nBagCount - 1) then break;
   end;
   Result :=  k;
end;


procedure FillquickslotsHero(sname: String; smode,position: integer);  //물약
var
  i: integer;
begin

  if position = -1 then begin
    for i := 0 to 1 do begin
      if g_HeroItemArr[i].S.Name = sName then begin
        position := 1;
        break
      end;
    end;
  end;
  if g_HeroItemArr[position].S.Name <> '' then exit;
  for i:=2 to g_MyHero.m_nBagCount-1 do begin
    if (g_HeroItemArr[i].S.Name = sName) and (g_HeroItemArr[i].S.StdMode in [0,1,3]) then begin
      g_HeroItemArr[position] := g_HeroItemArr[i];
      FillChar (g_HeroItemArr[i], sizeof(TClientItem), #0);
      exit;
    end;
  end;

end;


procedure AddAutoItem(ci: TClientItem);
var
  I: Integer;
begin
  for I := 0 to 2 - 1 do begin
    if g_AutoPotItems[I].S.Name = '' then begin
      if (ci.S.StdMode = 0) and (ci.S.Shape in [0,3]) then begin
        g_AutoPotItems[I] := ci;
        Break;
      end;
    end;
  end;
end;

function  AddHeroAutoItemBag (cu: TClientItem): Boolean;    //물약
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to 2 - 1 do begin
      if (g_AutoPotItems[i].MakeIndex = cu.MakeIndex) and (g_AutoPotItems[i].S.Name = cu.S.Name) then begin
        if (cu.S.StdMode = 0) and (cu.S.Shape in [0,3]) then begin
          g_AutoPotItems[i] := cu;
          Result := TRUE;
          exit;
        end;
      end;
   end;
end;

function DelHeroAutoItemBag(iname: string; iindex: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to 1 do begin
    if (g_AutoPotItems[I].S.Name = iname) and (g_AutoPotItems[I].MakeIndex = iindex) then begin
      FillChar(g_HeroItemArr[I], SizeOf(TClientItem), #0);
      Result := True;
      Break;
    end;
  end;
  ArrangeHeroAutoItemBag;
end;

procedure ArrangeHeroAutoItemBag;
var
  I, k: Integer;
begin
  for I := 0 to 2 - 1 do begin
    if g_AutoPotItems[I].S.Name <> '' then begin
      for k := I + 1 to 2 - 1 do begin
        if (g_AutoPotItems[I].S.Name = g_AutoPotItems[k].S.Name) and (g_AutoPotItems[I].MakeIndex = g_AutoPotItems[k].MakeIndex) then begin
          if (g_AutoPotItems[I].S.StdMode in [0,1,3,45,46]) then begin
            g_AutoPotItems[i].Amount := g_AutoPotItems[i].Amount + g_HeroItemArr[k].Amount;
            FillChar (g_AutoPotItems[k], sizeof(TClientItem), #0);
          end else begin
            FillChar (g_AutoPotItems[k], sizeof(TClientItem), #0);
          end;
        end;
      end;
      if (g_AutoPotItems[I].S.Name = g_MovingItem.Item.S.Name) and (g_AutoPotItems[I].MakeIndex = g_MovingItem.Item.MakeIndex) then begin
        g_MovingItem.Index := 0;
        g_MovingItem.Item.S.Name := '';
      end;
    end;
  end;

end;


function DelItemBagByIdx(nIdx: Integer): Boolean;
begin
  Result := False;
  if nIdx in [Low(g_ItemArr)..High(g_ItemArr)] then begin
    g_ItemArr[nIdx].s.Name := '';
   // RefUserKeyItemInfo(@g_ItemArr[nIdx]);
    Result := True;
  end;
end;

{----------------------------------------------------------}


Initialization
begin
  {---- Adjust global SVN revision ----}
  //SVNRevision('$Id: ClFunc.pas 562 2007-01-19 16:33:33Z sean $');
  DropItems := TList.Create;
end
Finalization
  FreeAndNil(DropItems);
end.
