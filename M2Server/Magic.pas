unit Magic;

interface

uses
  {svn, }Windows,Classes,Grobal2,ObjBase, ObjHero,SDK,math;
type
  TMagicManager = class
  private
   // function  MagBigHealing(PlayObject:TBaseObject;nPower,nX,nY:integer): Boolean;
    function  MagPushArround(PlayObject:TBaseObject; nPushLevel: integer): integer;

    function  MagPushArrounddamage(PlayObject:TBaseObject; nPushLevel: integer): integer; //¿­Ç³°Ý

    function  MagMakeHolyCurtain(BaseObject:TBaseObject;nPower:Integer;nX,nY:Integer):Integer;
    function  MagMakepobak(BaseObject:TBaseObject;nPower:Integer;nX,nY:Integer):Integer;   //Æ÷¹Ú¼ú
    function  MagMakeGroupTransparent(BaseObject:TBaseObject;nX,nY:Integer;nHTime:Integer):Boolean;
    function  MagTamming(BaseObject,TargeTBaseObject:TBaseObject;nTargetX,nTargetY:Integer;nMagicLevel:Integer):Boolean;
    function  MagSaceMove(BaseObject:TBaseObject;nLevel:integer):Boolean;
    function  MagRoSeonSaceMove(BaseObject:TBaseObject;nLevel, nTargetX, nTargetY, nPower, nSec, nDSec: Integer):Boolean; //·Ú¼±Ç³
    function  MagShadowSaceMove(BaseObject:TBaseObject; nLevel, nTargetX, nTargetY, nDSec: Integer):Boolean; //¿µÀûÃß
    function  MagChangeback(PlayObject: TBaseObject): Boolean;

    function  MagMakeAllFire(BaseObject: TBaseObject; nDamage,nHTime,nX,nY:Integer):Boolean;    //¸¸Ãµ¿°¿Á
    function  MagMakeThunder(BaseObject: TBaseObject; nDamage,nHTime,nDel,nX,nY:Integer):Boolean;   //¿îÁß·Ú°Ý
    function MagMakeFireCharmEx(PlayObject: TBaseObject; UserMagic: pTUserMagic; nTargetX, nTargetY, nPower: Integer;
      var TargeTBaseObject: TBaseObject): Boolean;
    function  CheckTargetChange (BaseObject: TBaseObject): Boolean;
    function  MagTargetChangePosition(PlayObject, BaseObject: TBaseObject; nTargetX, nTargetY , nTargetX2, nTargetY2: Integer): Boolean;   //ÁøÀ§º¸

    function  MagMakeArrestObject(PlayObject: TBaseObject; UserMagic: pTUserMagic; TargeTActorObject: TBaseObject): Boolean;  //°Ý°ø¼·¹°
    function  MagThenderExplosion(BaseObject:TBaseObject;nPower,nX,nY:Integer;nRage:Integer):Boolean;

    function  MagThunderClap(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nX, nY: Integer; nRage, nDel: Integer; var boMove: Boolean): Boolean;

    function  MagSunchun(BaseObject:TBaseObject;UserMagic: pTUserMagic; nPower,nPower2,nsec,nX,nY:Integer;nRage:Integer):Boolean;    //¼±Ãµ

    function  MagBigExplosion2(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage:Integer):Boolean; //Ãµ»óºùÈ¯
    function  MagBlizzard(PlayObject:TPlayObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;    //Ãµ»óºùÈ¯

    procedure  MagYeongMu(PlayObject:TPlayObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer); //¿ù¿µ¹«


    function  MagMakeSlave(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagMakeJinSlave(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagMakeClone(PlayObject:TBaseObject;UserMagic:pTUserMagic):Boolean;

    function MagMakeDarkBody(PlayObject:TBaseObject; Targ:TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;     //¿­È­½Å
    function MagMakeBonzeBody(PlayObject:TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;   //ÀºÇü¼ú - ÀÚ°´
    function MagMakeBonzeMob(PlayObject:TBaseObject; Targ:TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;     //°­È£¼ú
    function  MagShadowAttack(BaseObject,TargeTBaseObject:TBaseObject;nTargetX,nTargetY:Integer;nLevel:Integer):Boolean;
    function  MagMakeSinSuSlave(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagMakeAngelSlave(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagMakeDarkAngelSlave(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagWindTebo(PlayObject:TPlayObject;UserMagic:pTUserMagic):Boolean;
    function  MagGroupMb(PlayObject:TPlayObject;UserMagic:pTUserMagic;TargeTBaseObject:TBaseObject):Boolean;
    function  MagFireField(BaseObject: TBaseObject; nPower: integer): Boolean;     //È­·æ±â¿°
    function  MagThenderField(BaseObject: TBaseObject; nPower: integer): Boolean;   //³ú½ÅÇ÷
    function  MagKyoField(PlayObject:TPlayObject; nTime: integer; UserMagic:pTUserMagic;BaseObject: TBaseObject; nPower: integer): Boolean;   //±³¾Ç
    function  MagSingiField(PlayObject:TPlayObject; nTime: integer; UserMagic:pTUserMagic;BaseObject: TBaseObject; nPower: integer): Boolean;   //±³¾Ç
    function  MagIceField(BaseObject: TBaseObject; UserMagic:pTUserMagic; nPower: integer): Boolean;     //ºù¿ù°Ý
    function  MagPullMon (user, target: TBaseObject; skilllevel: integer): Boolean; //Æ÷½Â°Ë
    function  KnockBack(PlayObject:TBaseObject; nPushLevel: integer): integer;
    function  FlameField(BaseObject:TBaseObject;nPower,nX,nY:Integer;nRage:Integer):Boolean;
    function  MagJuckSal(BaseObject: TBaseObject; UserMagic:pTUserMagic; nPower: integer): Boolean;

    function  MagMakeTigerHitSkill(PlayObject: TPlayObject; nTime: Integer; UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; TargeTBaseObject: TBaseObject): Boolean;
    function  IceShot(PlayObject: TPlayObject; UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; TargeTBaseObject: TBaseObject): Boolean;      //ºù³úÃµ
  public         //Á¤È­¼ú
    constructor Create();
    destructor Destroy; override;
    function MagBigHealing(PlayObject:TBaseObject;nPower,nX,nY:integer): Boolean;
    function MagMakePrivateTransparent(BaseObject:TBaseObject;nHTime:Integer):Boolean;
    function MagMakePrivateAssTransparent(BaseObject:TBaseObject; nHTime:Integer):Boolean; //¿ù¿µ¼ú
    function MagMakePrivateAssYeongMu(BaseObject:TBaseObject; nHTime, nDelay:Integer):Boolean; //¿ù¿µ¹«
    function IsWarrSkill(wMagIdx:Integer):Boolean;
    function DoSpell(PlayObject:TPlayObject;UserMagic:pTUserMagic;nTargetX,nTargetY:Integer;TargeTBaseObject:TBaseObject):Boolean;
    procedure WindCutHit (PlayObject: TBaseObject; TargeTBaseObject: TBaseObject ; hitPwr ,magpwr: integer ); //°øÆÄ¼¶
    function MagWindCut (PlayObject: TPlayObject; skilllevel: integer): Boolean;                            //°øÆÄ¼¶
    function MagCKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;     //Âü°Ý
    function MagBKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;     //°í·Á¹«ÁøºÀ
    function MagBCKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;     //°í·Á¹«ÁøºÀ
    function MagMoonBlade (PlayObject: TBaseObject; skilllevel: integer;UserMagic:pTUserMagic): Boolean;    //¿ùÇÏ³­¹«
    function MagIceWindStaied(PlayObject: TPlayObject; skilllevel: integer;UserMagic:pTUserMagic):Boolean;   //ºù¿°¼ú
    function MagMakeUnTreatment(PlayObject: TBaseObject; UserMagic: pTUserMagic; var TargeTBaseObject: TBaseObject): Boolean;
    function  MagElecBlizzard(BaseObject:TBaseObject;nPower:integer):Boolean;
    function  MagTurnUndead(BaseObject,TargeTBaseObject:TBaseObject;nTargetX,nTargetY:Integer;nLevel:Integer):Boolean;
    function  MagBigExplosion(BaseObject:TBaseObject;nPower,nX,nY:Integer;nRage:Integer):Boolean;
    function  MagMakeFireCross(PlayObject:TBaseObject;nDamage,nHTime,nX,nY:Integer):Integer;    //Áö¿°¼ú
    function  MagChangePosition(PlayObject: TBaseObject; nTargetX, nTargetY: Integer): Boolean;   //ÀÏ¼¶
    function  MagMaChangePosition(PlayObject: TBaseObject; nTargetX, nTargetY, nTargetX1, nTargetY1: Integer): Boolean;   //¸¶Ç÷±¤¼¶
    function  MagBigExplosion4(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage:Integer):Boolean; //Ãµ»ó³«¿°
    function  MagMeteor(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean; //Ãµ»ó³«¿°
    function  MagPoisonCloud(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;    //µ¶¹«
    function  MagChunGong(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;    //Ãµ°ø
    function  MagDragon(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean; //¿ë¼ÚÀ½
    function  MagMahul(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean; //¸¶Ç÷³­¹«
    function  MagBigHweChun(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage:Integer):Boolean; //È¸Ãµ°Ý
    function  MagThenderDownExplosion(BaseObject:TBaseObject;nPower,nX,nY:Integer;nRage:Integer):Boolean;
    function  MagDragonPushArround(PlayObject:TBaseObject; nPwr, nPushLevel: integer): integer;
    function  MagBigExplosion6(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage,nMode:Integer):Boolean; //µ¶Ä§¼ú
    function  MagBigExplosion7(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage,nMode:Integer):Boolean; //¾Ïµ¶¸¸°è

    function  MagOhaeng(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;    //À½¾ç¿ÀÇàÁø
    function  MagSuraField(BaseObject: TBaseObject; nPower: integer): Boolean;     //¼ö¶óÃµ¸êÁø
  end;
  function MPow(UserMagic:pTUserMagic):Integer;
  function GetPower(nPower:Integer;UserMagic:pTUserMagic):Integer;
  function GetPower13(nInt:Integer;UserMagic:pTUserMagic):Integer;
  function GetRPow(wInt:Integer):Word;
  function CheckAmulet(PlayObject:TBaseObject;nCount:Integer;nType:Integer;var Idx:Integer):Boolean;
  function CheckAmulet2(PlayObject:TBaseObject;nCount:Integer;nType,num:Integer;var Idx:Integer):Boolean;
  function CheckAmulet3(PlayObject:TPlayObject;nCount:Integer;nType:Integer;var Idx:Integer):Boolean;
  function CheckWeapon(PlayObject:TBaseObject):Boolean; //Ã¼Å©
  procedure UseAmulet(PlayObject:TBaseObject;nCount:Integer;nType:Integer;var Idx:Integer);

implementation

uses HUtil32, M2Share, Event, Envir, ItmUnit, sysutils;

function MPow(UserMagic:pTUserMagic):Integer;
begin
  Result:=UserMagic.MagicInfo.wPower + Random(UserMagic.MagicInfo.wMaxPower - UserMagic.MagicInfo.wPower);
end;
function GetPower(nPower:Integer;UserMagic:pTUserMagic):Integer;
begin
  Result:=ROUND(nPower / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) + (UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower));
end;

function GetPower13(nInt:Integer;UserMagic:pTUserMagic):Integer;
var
  d10:Double;
  d18:Double;
begin
  d10:=nInt / 3.0;
  d18:=nInt - d10;
  Result:=ROUND(d18 / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1) + d10 +(UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower)));
end;
function GetRPow(wInt:Integer):Word;
begin
  if HiWord(wInt) > LoWord(wInt) then begin
    Result:=Random(HiWord(wInt) - LoWord(wInt) + 1) + LoWord(wInt);
  end else Result:=LoWord(wInt);
end;
//nType Á¾·ù  1 ºÎÀû 2 µ¶°¡·ç 3 ¼ÒºÎ 4µ¶°¡·ç(È¸)
function CheckAmulet(PlayObject:TBaseObject;nCount:Integer;nType:Integer;var Idx:Integer):Boolean;
var
  AmuletStdItem:TItem;
begin
  Result:=False;
  Idx:=0;
  if PlayObject.m_UseItems[U_ARMRINGL].wIndex > 0 then begin       //ÆÈÂîÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_ARMRINGL].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of
        1: begin       //ºÎÀû
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        2: begin    //µ¶°¡·ç
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        3: begin    //¼Ò»ýÀÇºÎÀû
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        4: begin    //µ¶°¡·ç (È¸»ö
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        5: begin    //ºÎÀûµ¶°¡·ç
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        6: begin    //º¸ºÎ - ½Â·Á
          if (AmuletStdItem.Shape = 10) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;


  if PlayObject.m_UseItems[U_BUJUK].wIndex > 0 then begin    //ºÎÀû ÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_BUJUK].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of    //
        1: begin
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        2: begin
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        3: begin
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        4: begin
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        5: begin
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        6: begin     //º¸ºÎ - ½Â·Á
          if (AmuletStdItem.Shape = 10) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;
  if not Result then begin
     case nType of
      1:  PlayObject.SysMsg('Äã±ØÐë×°±¸»¤Éí·û¡£',c_Green,t_Hint);
      2:  PlayObject.SysMsg('Äã±ØÐë×°±¸¶¾·Û¡£',c_Green,t_Hint);
      3:  PlayObject.SysMsg('Äã±ØÐë×°±¸¸´»î·û¡£',c_Green,t_Hint);
      4:  PlayObject.SysMsg('Äã±ØÐë×°±¸»ÒÉ«¶¾·Û¡£',c_Green,t_Hint);
      5:  PlayObject.SysMsg('Äã±ØÐë×°±¸¶¾·û°ü¡£',c_Green,t_Hint);
      6:  PlayObject.SysMsg('Äã±ØÐë×°±¸½ðÉíÉáÀû¡£',c_Green,t_Hint);
     end;
  end;

end;

//nType Á¾·ù  1 ºÎÀû 2 µ¶°¡·ç 3 ¼ÒºÎ 4µ¶°¡·ç(È¸)
function CheckAmulet2(PlayObject:TBaseObject;nCount:Integer;nType,num:Integer;var Idx:Integer):Boolean;
var
  AmuletStdItem:TItem;
begin
  Result:=False;
  Idx:=0;
  if PlayObject.m_UseItems[U_ARMRINGL].wIndex > 0 then begin       //ÆÈÂîÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_ARMRINGL].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of
        1: begin       //ºÎÀû
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        2: begin    //µ¶°¡·ç
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        3: begin    //¼Ò»ýÀÇºÎÀû
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        4: begin    //µ¶°¡·ç (È¸»ö
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        5: begin    //µ¶°¡·ç (È¸»ö
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        6: begin    //Áø½Å»ç¸® - ½Â·Á
          if (AmuletStdItem.Shape = 10) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;


  if PlayObject.m_UseItems[U_BUJUK].wIndex > 0 then begin    //ºÎÀû ÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_BUJUK].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of    //
        1: begin
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        2: begin
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        3: begin
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        4: begin
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        5: begin
          if (AmuletStdItem.Shape in [7,8]) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        6: begin
          if (AmuletStdItem.Shape = 10) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;
  if (not Result) and not (num = 75) then begin
     case nType of
      1:  PlayObject.SysMsg('Äã±ØÐë×°±¸»¤Éí·û¡£',c_Green,t_Hint);
      2:  PlayObject.SysMsg('Äã±ØÐë×°±¸¶¾·Û¡£',c_Green,t_Hint);
      3:  PlayObject.SysMsg('±ØÐë×°±¸¸´»î·û¡£',c_Green,t_Hint);
      4:  PlayObject.SysMsg('Äã±ØÐë×°±¸»ÒÉ«¶¾·Û¡£',c_Green,t_Hint);
      5:  PlayObject.SysMsg('Äã±ØÐë×°±¸¶¾·û°ü¡£',c_Green,t_Hint);
      6:  PlayObject.SysMsg('Äã±ØÐë×°±¸½ðÉíÉáÀû¡£',c_Green,t_Hint);
     end;
  end;

end;


//nType Á¾·ù  1 ºÎÀû 2 µ¶°¡·ç 3 ¼ÒºÎ 4µ¶°¡·ç(È¸)
function CheckAmulet3(PlayObject:TPlayObject;nCount:Integer;nType:Integer;var Idx:Integer):Boolean;
var
  AmuletStdItem:TItem;
begin
  Result:=False;
  Idx:=0;
  if PlayObject.m_UseItems[U_ARMRINGL].wIndex > 0 then begin       //ÆÈÂîÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_ARMRINGL].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of
        1: begin       //ºÎÀû
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        2: begin    //µ¶°¡·ç
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        3: begin    //¼Ò»ýÀÇºÎÀû
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
        4: begin    //µ¶°¡·ç (È¸»ö
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_ARMRINGL].Dura / 10) >= nCount) then begin
              Idx:=U_ARMRINGL;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;


  if PlayObject.m_UseItems[U_BUJUK].wIndex > 0 then begin    //ºÎÀû ÀÚ¸®
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_BUJUK].wIndex);
    if (AmuletStdItem <> nil) and (AmuletStdItem.StdMode = 25) then begin
      case nType of    //
        1: begin
          if (AmuletStdItem.Shape = 5) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        2: begin
          if (AmuletStdItem.Shape <= 2) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        3: begin
          if (AmuletStdItem.Shape = 6) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
        4: begin
          if (AmuletStdItem.Shape <= 1) and (ROUND(PlayObject.m_UseItems[U_BUJUK].Dura / 10) >= nCount) then begin
              Idx:=U_BUJUK;
              Result:=True;
              exit;
          end;
        end;
      end;
    end;
  end;


end;


function CheckWeapon(PlayObject:TBaseObject):Boolean;      //Ã¼Å©
var
  AmuletStdItem:TItem;
begin
  Result:=False;
  if PlayObject.m_UseItems[U_WEAPON].wIndex > 0 then begin
    AmuletStdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[U_WEAPON].wIndex);
    if (AmuletStdItem <> nil) and ((AmuletStdItem.StdMode = 99)) then Result:=True;
  end;
end;

procedure UseAmulet(PlayObject:TBaseObject;nCount:Integer;nType:Integer;var Idx:Integer);
begin
  if PlayObject.m_UseItems[Idx].Dura > nCount * 10 then begin
    Dec(PlayObject.m_UseItems[Idx].Dura,nCount * 10);
    PlayObject.SendMsg(PlayObject,RM_DURACHANGE,Idx,PlayObject.m_UseItems[Idx].Dura,PlayObject.m_UseItems[Idx].DuraMax,0,'');
  end else begin
    PlayObject.m_UseItems[Idx].Dura:=0;

    if PlayObject.m_btRaceServer = RC_HEROOBJECT then
      THeroObject(PlayObject).SendDelItems(@PlayObject.m_UseItems[Idx]);
    if PlayObject.m_btRaceServer = RC_PLAYOBJECT then
      TPlayObject(PlayObject).SendDelItems(@PlayObject.m_UseItems[Idx]);

    PlayObject.m_UseItems[Idx].wIndex:=0;
  end;
end;


function  TMagicManager.MagPushArround (PlayObject:TBaseObject;nPushLevel: integer): integer; //00492204
var
   i, nDir, levelgap, push: integer;
   BaseObject: TBaseObject;
begin
   Result := 0;
   for i:=0 to PlayObject.m_VisibleActors.Count-1 do begin
      BaseObject:= TBaseObject (pTVisibleBaseObject(PlayObject.m_VisibleActors[i]).BaseObject);
      if (abs(PlayObject.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(PlayObject.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
         if (not BaseObject.m_boDeath) and (BaseObject <> PlayObject) then begin
            if (PlayObject.m_Abil.Level > BaseObject.m_Abil.Level) and (not BaseObject.m_boStickMode) then begin
               levelgap := PlayObject.m_Abil.Level - BaseObject.m_Abil.Level;
               if (Random(20) < 6 + nPushLevel * 3 + levelgap) then begin
                  if PlayObject.IsProperTarget(BaseObject) then begin
                     push := 1 + _MAX(0,nPushLevel - 1) + Random(2);
                     nDir:= GetNextDirection (PlayObject.m_nCurrX, PlayObject.m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
                     BaseObject.CharPushed (nDir, push);
                     Inc(BaseObject.PushedCount);
                     Inc (Result);
                  end;
               end;
            end;
         end;
      end;
   end;

end;


function  TMagicManager.MagDragonPushArround (PlayObject:TBaseObject; nPwr, nPushLevel: integer): integer; //00492204
var
   i, nDir, levelgap, push: integer;
   BaseObject: TBaseObject;
   boPush: Boolean;
begin
   Result := 0;
   boPush := False;
   for i:=0 to PlayObject.m_VisibleActors.Count-1 do begin
      BaseObject:= TBaseObject (pTVisibleBaseObject(PlayObject.m_VisibleActors[i]).BaseObject);
      if (abs(PlayObject.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(PlayObject.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
         if (not BaseObject.m_boDeath) and (BaseObject <> PlayObject) and (not BaseObject.m_boStickMode) then begin
            if PlayObject.IsProperTarget(BaseObject) then begin
              if (PlayObject.m_Abil.Level > BaseObject.m_Abil.Level) then begin
                boPush := True;
              end else begin
                if (Random(2) < 1) then begin
                  boPush := True;
                end;
              end;
              if boPush then begin
                push := 1 + _MAX(0,nPushLevel - 1) + Random(2);
                nDir:= GetNextDirection (PlayObject.m_nCurrX, PlayObject.m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
                BaseObject.CharPushed (nDir, push);
                Inc(BaseObject.PushedCount);
                Result := 1;
              end;
              PlayObject.SetTargetCreat(BaseObject);
              BaseObject.SendDelayMsg(PlayObject, RM_MAGSTRUCK_MINE,0,nPwr,0,0,'',300);
              BaseObject.SendDelayMsg(PlayObject, RM_MAGSTRUCK_MINE,0,nPwr,0,0,'',900);
              BaseObject.SendDelayMsg(PlayObject, RM_MAGSTRUCK_MINE,0,nPwr,0,0,'',1500);
            end;
         end;
      end;
   end;

end;


function  TMagicManager.MagPushArrounddamage (PlayObject:TBaseObject;nPushLevel: integer): integer; //00492204 //¿­Ç³°Ý
var
   i, nDir, levelgap, push: integer;
   BaseObject: TBaseObject;
begin
   if PlayObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT] > 0 then   //¿­È­½Å , ¿ù¿µ¼ú ½ÃÀü Ãë¼Ò
    PlayObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT]:=1;
   if PlayObject.m_wStatusTimeArr[STATE_YEONGMU] > 0 then  //¿ù¿µ¹« °ø°Ý½Ã.. Ç®¸²
    PlayObject.m_wStatusTimeArr[STATE_YEONGMU]:=1;
   Result := 0;
   for i:=0 to PlayObject.m_VisibleActors.Count-1 do begin
      BaseObject:= TBaseObject (pTVisibleBaseObject(PlayObject.m_VisibleActors[i]).BaseObject);
      if (abs(PlayObject.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(PlayObject.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
         if (not BaseObject.m_boDeath) and (BaseObject <> PlayObject) then begin
            if (PlayObject.m_Abil.Level > BaseObject.m_Abil.Level) and (not BaseObject.m_boStickMode) then begin
               levelgap := PlayObject.m_Abil.Level - BaseObject.m_Abil.Level;
               if (Random(20) < 6 + nPushLevel * 3 + levelgap) then begin
                  if PlayObject.IsProperTarget(BaseObject) then begin
                     //BaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,50,0,0,'');
                     push := 1 + _MAX(0,nPushLevel - 1) + Random(2);
                     nDir:= GetNextDirection (PlayObject.m_nCurrX, PlayObject.m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
                     BaseObject.CharPushed (nDir, push);
                     Inc(BaseObject.PushedCount);
                     Inc (Result);
                  end;
               end;
            end;
         end;
      end;
   end;

end;

function  TMagicManager.MagBigHealing (PlayObject:TBaseObject;nPower,nX,nY:integer): Boolean; //00492E50
var
   i: integer;
   BaseObjectList:TList;
   BaseObject:TBaseObject;
begin
   Result:=False;
   BaseObjectList:= TList.Create;
   PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir,nX,nY,1, BaseObjectList);
   for i:=0 to BaseObjectList.Count-1 do begin
      BaseObject:= TBaseObject (BaseObjectList[i]);
      if PlayObject.IsProperFriend (BaseObject) then begin
         if BaseObject.m_WAbil.HP < BaseObject.m_WAbil.MaxHP then begin
            BaseObject.SendDelayMsg (PlayObject,RM_MAGHEALING, 0, nPower, 0, 0, '', 800);
            Result:=True;
         end;
         if PlayObject.m_boAbilSeeHealGauge then begin
           PlayObject.SendDefMsg(PlayObject, SM_INSTANCEHEALGUAGE, Integer(BaseObject), BaseObject.m_WAbil.HP, BaseObject.m_WAbil.MaxHP, 0, '');
         end;
      end;
   end;
   FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagFireField(BaseObject: TBaseObject; nPower: integer): Boolean;    //È­·æ±â¿°
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      if (BaseObject.m_wStatusTimeArr[STATE_WINDMOON] > 0) then     //È­·æ±â¿° °­È­
         TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,Round(nPower*1.3),0,0,'')
      else TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'');
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;



function TMagicManager.MagSuraField(BaseObject: TBaseObject; nPower: integer): Boolean;    //¼ö¶óÃµ¸êÁø
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,3,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'');
      if (Random(10) <= 3) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
         TargeTBaseObject.MakePosion(POISON_SLOWDOWN,10,0);
      end;
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagThenderField(BaseObject: TBaseObject; nPower: integer): Boolean;    //³ú½ÅÇ÷
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,3,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);

    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
       TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'',500);
       TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'',1100);
      Result:=True;
    end;

  end;
  FreeAndNil(BaseObjectList);
end;


function TMagicManager.MagKyoField(PlayObject:TPlayObject;nTime: integer;UserMagic:pTUserMagic;BaseObject: TBaseObject; nPower: integer): Boolean;    //±³¾Ç
var
  I ,nAmuletIdx    :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  StdItem          :TItem;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);

    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'',600);
      Result:=True;

      PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 79, 0, 27, nTime, '[ Ñ×¶ñ ]\ÀäÈ´Ê±¼ä: '); //±³¾Ç ÄðÅ¸ÀÓ ¹öÇÁ
      PlayObject.m_wStatusArrValue[69]:=1;
      PlayObject.m_dwStatusArrTimeOutTick[69]:=GetTickCount + nTime * 1000;

      if CheckAmulet3(PlayObject,1,2,nAmuletIdx) then begin  //µ¶°¡·ç È®ÀÎ
        StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
        if StdItem <> nil then begin
          UseAmulet(PlayObject,1,2,nAmuletIdx);

          if 6 >= Random(7 + TargeTBaseObject.m_btAntiPoison) then begin
            case StdItem.Shape of
              1: begin  //È¸»öµ¶°¡·ç :Áßµ¶
                TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DECHEALTH,nPower div 10,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
              2: begin  //È²»öµ¶°¡·ç : ¹æ¾î·Â°¨¼Ò
                TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DAMAGEARMOR,nPower div 10,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
            end;
          end;
        end;
      end;

    end;




  end;
  FreeAndNil(BaseObjectList);
end;


function TMagicManager.MagSingiField(PlayObject:TPlayObject;nTime: integer;UserMagic:pTUserMagic;BaseObject: TBaseObject; nPower: integer): Boolean;    //½Å±â¹¦»ê
var
  I ,nAmuletIdx    :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  StdItem          :TItem;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);

    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'',600);
      Result:=True;

      PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 80, 0, 50, nTime, '[ ÖÁÇ¿Ò»»÷ ]\ÀäÈ´Ê±¼ä: '); //½Å±â¹¦»ê ÄðÅ¸ÀÓ ¹öÇÁ
      PlayObject.m_wStatusArrValue[70]:=1;
      PlayObject.m_dwStatusArrTimeOutTick[70]:=GetTickCount + nTime * 1000;

      if CheckAmulet2(PlayObject,1,5,107,nAmuletIdx) then begin  //µ¶°¡·ç È®ÀÎ
        StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
        if StdItem <> nil then begin
          UseAmulet(PlayObject,1,5,nAmuletIdx);

          if 6 >= Random(7 + TargeTBaseObject.m_btAntiPoison) then begin
            case StdItem.Shape of
              7: begin  //È¸»öµ¶°¡·ç :Áßµ¶
                TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DECHEALTH,nPower div 10,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
              8: begin  //È²»öµ¶°¡·ç : ¹æ¾î·Â°¨¼Ò
                TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DAMAGEARMOR,nPower div 10,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
            end;
          end;
        end;
      end;

    end;




  end;
  FreeAndNil(BaseObjectList);
end;



function TMagicManager.MagMakeTigerHitSkill(PlayObject: TPlayObject; nTime: Integer; //¹éÈ£°­Å¸
  UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; TargeTBaseObject: TBaseObject): Boolean;
var
  I, nPower, MoC, Dur: Integer;
  function MPow(UserMagic: pTUserMagic): Integer;
  begin
    Result := UserMagic.MagicInfo.wPower + Random(UserMagic.MagicInfo.wMaxPower - UserMagic.MagicInfo.wPower);
  end;
  function GetPower(nPower: Integer): Integer;
  begin
    Result := Round(nPower / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) + (UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower));
  end;
begin
  Result := False;
  if PlayObject.MagCanHitTarget(PlayObject.m_nCurrX, PlayObject.m_nCurrY, TargeTBaseObject) then begin
    if PlayObject.IsProperTarget(TargeTBaseObject) then begin
      with PlayObject do
        nPower := GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC), Integer(HiWord(m_WAbil.SC) - LoWord(m_WAbil.SC)) + 1);

          // »óÅÂÀÌ»ó...½ºÅÏÆÇÁ¤
      if (TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] = 0) and
         (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin   // 100->50
        MoC := 1;
        if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
           if ((MoC = 1) and (Random(90) < 5*(UserMagic.btLevel+1))) or
              ((MoC = 2) and (Random(90) < 2*(UserMagic.btLevel+1))) then begin
              Dur := Round(1.5 + 0.8 * UserMagic.btLevel);
              TargeTBaseObject.MakePosion(POISON_STUN, Dur, 1);
           end;
      end;
      PlayObject.SendDelayMsg(PlayObject, RM_DELAYMAGIC, nPower, MakeLong(TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY), 2, Integer(TargeTBaseObject), '', 600);

      PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 78, 0, 26, nTime, '[ °×»¢Ç¿Âä ]\ÀäÈ´Ê±¼ä: '); //¹éÈ£°­Å¸ ÄðÅ¸ÀÓ ¹öÇÁ
      PlayObject.m_wStatusArrValue[68]:=1;
      PlayObject.m_dwStatusArrTimeOutTick[68]:=GetTickCount + nTime * 1000;

      Result := True;
    end;
  end;
end;


function TMagicManager.MagIceField(BaseObject: TBaseObject; UserMagic:pTUserMagic; nPower: integer): Boolean;    //ºù¿ù°Ý
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin

      //nPower:=TargeTBaseObject.GetHitStruckDamage(BaseObject,nPower);
      //TargeTBaseObject.StruckDamage(nPower);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',600);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',1200);
     { TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, nPower, TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(BaseObject), '', 600);
      TargeTBaseObject.StruckDamage (nPower);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, nPower, TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(BaseObject), '', 1200);   }
      if (Random(10) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
         TargeTBaseObject.MakePosion(POISON_SLOWDOWN,(UserMagic.btLevel + 2),0);
      end;
      {if (Random(55) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
         TargeTBaseObject.MakePosion(POISON_FREEZE,(UserMagic.btLevel + 10),0);
      end;}
      Result:=True;

    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagJuckSal(BaseObject: TBaseObject; UserMagic:pTUserMagic; nPower: integer): Boolean;    //ÃµÀÎÀû»ìÇ³
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      nPower:=TargeTBaseObject.GetHitStruckDamage(BaseObject,nPower);
      TargeTBaseObject.StruckDamage(nPower);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',600 + (abs(TargeTBaseObject.m_nCurrX - BaseObject.m_nCurrX) + abs(TargeTBaseObject.m_nCurrY - BaseObject.m_nCurrY)) div 2 * 20);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',1400 + (abs(TargeTBaseObject.m_nCurrX - BaseObject.m_nCurrX) + abs(TargeTBaseObject.m_nCurrY - BaseObject.m_nCurrY)) div 2 * 20);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',2200 + (abs(TargeTBaseObject.m_nCurrX - BaseObject.m_nCurrX) + abs(TargeTBaseObject.m_nCurrY - BaseObject.m_nCurrY)) div 2 * 20);
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function  TMagicManager.MagPullMon (user, target: TBaseObject; skilllevel: integer): Boolean;     //Æ÷½Â°Ë
var
   levelgap, rush, rushdir, rushDist, Dur: integer;
   SuccessFlag : Boolean;
begin
   Result := FALSE;
   SuccessFlag := FALSE;
   if user = nil then exit;

   if target <> nil then begin
      //»ç¶÷ÇÑÅ× ¾µ ¼ö ¾øÀ½.
      if target.m_btRaceServer = RC_PLAYOBJECT then exit;

      //¿òÁ÷ÀÌÁö ¾Ê´Â ¸ó½ºÅÍ´Â ²ø¾î¿Ã ¼ö ¾øÀ½(2004/12/01)
    //  if target.m_boStickMode then exit;

      // ³Ê¹« °¡±îÀÌ ÀÖÀ¸¸é ±â¼úÀ» ¾µ ¼ö ¾øÀ½.
      if (abs(user.m_nCurrX - target.m_nCurrX) < 3) and (abs(user.m_nCurrY - target.m_nCurrY) < 3) then begin
         user.SysMsg('Äã¾àÀë¶Ô·½Ì«½ü¡£',c_Red,t_Hint);
         exit;
      end else if (abs(user.m_nCurrX - target.m_nCurrX) > 7) and (abs(user.m_nCurrY - target.m_nCurrY) > 7) then begin
         exit;
      end;

      // ¸Ö¸®ÀÖ´Â ÀûÀ» ²ø¾î´ç±ä´Ù.
      user.m_btDirection := GetNextDirectionNew (user.m_nCurrX, user.m_nCurrY, target.m_nCurrX, target.m_nCurrY);

      rushDir:=GetNextDirection(target.m_nCurrX,target.m_nCurrY,user.m_nCurrX,user.m_nCurrY);
      rushDist:=Max(ABS(target.m_nCurrX-user.m_nCurrX) - 3,ABS(target.m_nCurrY-user.m_nCurrY) - 3);

      if user.IsProperTarget (target) then begin
         // ½ÃÃ¼°¡ ¾Æ´Ï°í ²¿ºÀ¸÷ÀÌ ¾Æ´Ï¾î¾ß ÇÔ.
//         if (not target.Death) and (target.Master = nil) then begin
         // ½ÃÃ¼°¡ ¾Æ´Ï¾î¾ß ÇÔ. ²¿ºÀ¸÷Àº °¡´ÉÇÏ°Ô ¼öÁ¤(sonmg 2005/11/2)
         if (not target.m_boDeath) then begin
            if (target.m_Abil.Level <= user.m_Abil.Level) and (target.m_Abil.Level < 80) then begin
               levelgap := user.m_Abil.Level - target.m_Abil.Level;
               if target.m_btRaceServer = RC_PLAYOBJECT then begin
                  if (Random(30) < ((skilllevel+1) * 2) + levelgap + 9) then
                     SuccessFlag := TRUE;
               end else if target.m_btRaceServer >= RC_ANIMAL then begin
                  if (Random(30) < ((skilllevel+1) * 3) + levelgap + 14) then
                     SuccessFlag := TRUE;
               end;

               if SuccessFlag then begin
                  // Á÷¼±¿¡ ÀÖ´Â³Ñ¸¸ ¶¯±ä´Ù.(1Ä­¾¿ ÁÂ¿ì·Î ÀÖ´Â ³Ñµµ ¶¯±ä´Ù)
                  if ( user.m_nCurrX = target.m_nCurrX ) or ( user.m_nCurrY = target.m_nCurrY ) or ( abs (user.m_nCurrX-target.m_nCurrX ) = abs (user.m_nCurrY-target.m_nCurrY ))
                        or (user.m_nCurrX+1 = target.m_nCurrX) or ( user.m_nCurrY+1 = target.m_nCurrY ) or ( abs( abs (user.m_nCurrX-target.m_nCurrX ) - abs (user.m_nCurrY-target.m_nCurrY ) ) = 1 )
                        or (user.m_nCurrX-1 = target.m_nCurrX) or ( user.m_nCurrY-1 = target.m_nCurrY ) then begin
                     rush := RushDist;
                     target.CharDrawingRush ( RushDir, rush, false );
                     if target.m_btRaceServer <> RC_PLAYOBJECT then begin
                        Dur := Round((skilllevel+1) * 1.2) + _MAX(0, 10 - target.m_btSpeedPoint);
                     end else begin
                        Dur := Round((skilllevel+1) * 1.2) + _MAX(0, 10 - target.m_btSpeedPoint);
                        if user.m_btRaceServer = RC_PLAYOBJECT then begin
                           //Á¤´ç¹æ¾î¸¦ À§ÇÑ ±â·Ï..
                           target.SetPKFlag (user);
                        end;
                     end;
                     target.MakePosion( POISON_STONE, Dur , 1 );
                     target.SendRefMsg (RM_LOOPNORMALEFFECT, integer(target), 1500, 0, NE_MONCAPTURE, '');
                     Result := TRUE;
                  end else begin
//                     user.SysMsg('²ø¾î ´ç±æ ¼ö ¾ø´Â À§Ä¡¿¡ ÀÖ½À´Ï´Ù.', 0);
                  end;
               end;
            end;
         end;
      end;
   end;
end;



constructor TMagicManager.Create;//0049214C
begin

end;

destructor TMagicManager.Destroy;
begin

  inherited;
end;

function TMagicManager.IsWarrSkill(wMagIdx: Integer): Boolean; //492190
begin
  Result:=False;
  if wMagIdx in [SKILL_ONESWORD{3},SKILL_ILKWANG{4},SKILL_YEDO{7},SKILL_ERGUM{12},SKILL_BANWOL{25},
  SKILL_FIRESWORD{26},SKILL_MOOTEBO{27}, SKILL_CROSSMOON, SKILL_TWINBLADE{38}, SKILL_JEOLMYEONG{59},
  SKILL_WINDBLADE{60}, SKILL_BALDO{62}, SKILL_VAMPMANA{67}, SKILL_CHENMU {73}, SKILL_BLOODWIND{76}, SKILL_BLASTHIT{85},
  SKILL_FINALBUN{88}, SKILL_DEATHHIT{110}, SKILL_GUKCHE{112}, SKILL_TAGUBONG{114}, SKILL_THUNDERSHAILIN{117},
  SKILL_FIRESHAOLIN{119}, SKILL_CROSSBONG{124},SKILL_NANHWA{131}] then
    Result:=True;
end;

function TMagicManager.DoSpell(PlayObject: TPlayObject;
  UserMagic: pTUserMagic; nTargetX, nTargetY: Integer;
  TargeTBaseObject: TBaseObject):Boolean; //0049350C
  function directionDir(dir: integer): integer;
  begin
    if dir in [0..3] then begin
      Result := dir + 4;
    end else begin
      Result := dir - 4;
    end;
  end;
var
  boTrain     :Boolean;
  boSpellFail :Boolean;   //Å¸°Ù¿¡°Ô ¹«¾ð°¡ ³¯¸±¶§
  boSpellFire :Boolean;
  n14         :Integer;
  n18         :Integer;
  n1C, i      :Integer;
  nPower, MoC, Dur, Gap :Integer;
  StdItem     :TItem;
  nAmuletIdx  :Integer;
  nFlamePower :Integer;
  VampPower   :Integer;
  VampMana    :Integer; //Èí±â
  sCharName   :string;
  SendRefMsg     :TBaseObject;
  EntrapDir,EntrapDist :Integer;
  nSec,nHtime  :integer;
  TempCret    :TBaseObject;
  boMove: Boolean;
  nx,ny:Integer;

  function MPow(UserMagic:pTUserMagic):Integer; //004921C8
  begin
    Result:=UserMagic.MagicInfo.wPower + Random(UserMagic.MagicInfo.wMaxPower - UserMagic.MagicInfo.wPower);
  end;
  function GetPower(nPower:Integer):Integer; //00493314
  begin
    Result:=ROUND(nPower / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1)) + (UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower));
  end;
  function GetPower13(nInt:Integer):Integer; //0049338C
  var
    d10:Double;
    d18:Double;
  begin
    d10:=nInt / 3.0;
    d18:=nInt - d10;
    Result:=ROUND(d18 / (UserMagic.MagicInfo.btTrainLv + 1) * (UserMagic.btLevel + 1) + d10 +(UserMagic.MagicInfo.btDefPower + Random(UserMagic.MagicInfo.btDefMaxPower - UserMagic.MagicInfo.btDefPower)));
  end;
  function GetRPow(wInt:Integer):Word;
  begin
    if HiWord(wInt) > LoWord(wInt) then begin
      Result:=Random(HiWord(wInt) - LoWord(wInt) + 1) + LoWord(wInt);
    end else Result:=LoWord(wInt);
  end;
  procedure sub_4934B4(PlayObject:TPlayObject);
  begin
    if PlayObject.m_UseItems[U_ARMRINGL].Dura < 100 then begin
      PlayObject.m_UseItems[U_ARMRINGL].Dura:=0;
      PlayObject.SendMsg(PlayObject,RM_DURACHANGE,U_ARMRINGL,PlayObject.m_UseItems[U_ARMRINGL].Dura,PlayObject.m_UseItems[U_ARMRINGL].DuraMax,0,'');
      {  //Nicky no Breaking
      PlayObject.SendDelItems(@PlayObject.m_UseItems[U_ARMRINGL]);
      PlayObject.m_UseItems[U_ARMRINGL].wIndex:=0;
      }
    end;
  end;

begin //0049350C
  Result:=False;
  boMove := False;
  if IsWarrSkill(UserMagic.wMagIdx) then exit;


  if (abs(PlayObject.m_nCurrX - nTargetX) > g_Config.nMagicAttackRage) or (abs(PlayObject.m_nCurrY - nTargetY) > g_Config.nMagicAttackRage) then begin
    exit;
  end;


  PlayObject.SendRefMsg(RM_SPELL,UserMagic.MagicInfo.btEffect,nTargetX,nTargetY,UserMagic.MagicInfo.wMagicId,'');
  boTrain:=False;
  boSpellFail:=False;   //exit ¾ÈÇØÁÜ
  boSpellFire:=True;
  nPower:=0;

  if (PlayObject.m_nSoftVersionDateEx = 0) and (PlayObject.m_dwClientTick = 0) and (UserMagic.MagicInfo.wMagicId > 40) then exit;

  if UserMagic.MagicInfo.wMimicID = SKILL_RESURRECTION then begin   //¼Ò»ý¼ú
    if (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) and TargeTBaseObject.m_boDeath then begin
      if CheckAmulet(PlayObject,1,3,nAmuletIdx) then begin    //¼ÒºÎ È®ÀÎ
        UseAmulet(PlayObject,1,3,nAmuletIdx); //amulets are 5/5

        if (Random(10 + UserMagic.btLevel) + UserMagic.btLevel) >= 8 then begin
         PlayObject.SendDelayMsg(PlayObject, RM_LOOPNORMALEFFECT, integer(self),0, 0, NE_REVIVALCHARGE, '', 900);
         PlayObject.SendDelayMsg(PlayObject, RM_LOOPNORMALEFFECT, integer(self),0, 0, NE_REVIVALCHARGE, '', 2000);
         PlayObject.SendDelayMsg(PlayObject, RM_LOOPNORMALEFFECT, integer(self),0, 0, NE_REVIVALCHARGE, '', 3000);
         case UserMagic.btLevel of
            0: begin
                TargeTBaseObject.m_WAbil.HP := Round(TargeTBaseObject.m_WAbil.MaxHP * 0.25);
                TargeTBaseObject.m_Abil.HP := Round(TargeTBaseObject.m_Abil.MaxHP * 0.25);
                TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ALIVEREQ,0,Integer(Self),0,0,'ÄãÈ·¶¨Òª¸´»îÂð£¿');;
               end;
            1: begin
                TargeTBaseObject.m_WAbil.HP := Round(TargeTBaseObject.m_WAbil.MaxHP * 0.5);
                TargeTBaseObject.m_Abil.HP := Round(TargeTBaseObject.m_Abil.MaxHP * 0.5);
                TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ALIVEREQ,0,Integer(Self),0,0,'ÄãÈ·¶¨Òª¸´»îÂð£¿');;
               end;
            2: begin
                TargeTBaseObject.m_WAbil.HP := Round(TargeTBaseObject.m_WAbil.MaxHP * 0.75);
                TargeTBaseObject.m_Abil.HP := Round(TargeTBaseObject.m_Abil.MaxHP * 0.75);
                TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ALIVEREQ,0,Integer(Self),0,0,'ÄãÈ·¶¨Òª¸´»îÂð£¿');;
               end;
            3: begin
                TargeTBaseObject.m_WAbil.HP := TargeTBaseObject.m_WAbil.MaxHP;
                TargeTBaseObject.m_Abil.HP := TargeTBaseObject.m_Abil.MaxHP;
                TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ALIVEREQ,0,Integer(Self),0,0,'ÄãÈ·¶¨Òª¸´»îÂð£¿');;
               end;
           end;
           PlayObject.SysMsg({'ÄãÕýÔÚ³¢ÊÔ¸´»î' + }TargeTBaseObject.m_sCharName + 'ÕýÔÚÇëÇóÄã¸´»îËû£¨Ëý£©¡£',c_Green,t_Hint);
           TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ABILITY,0,0,0,0,'');
           boTrain:=True
        end else
           UserEngine.CryCry (RM_CRY, PlayObject.m_PEnvir, PlayObject.m_nCurrX, PlayObject.m_nCurrY, 1000,g_Config.btCryMsgFColor,g_Config.btCryMsgBColor,'~ '+PlayObject.m_sCharName +'´ÔÀÌ ' +TargeTBaseObject.m_sCharName + '´ÔÀ» ¼Ò»ý½ÃÅ°°í ÀÖ½À´Ï´Ù.');
      end;
    end;
  end;

  if (TargeTBaseObject <> nil) and (TargeTBaseObject.m_boDeath) then TargeTBaseObject:=nil;

  case UserMagic.MagicInfo.wMimicID of
    SKILL_FIREBALL{1},
    SKILL_FIREBALL2{5}: begin
      if PlayObject.MagCanHitTarget(PlayObject.m_nCurrX, PlayObject.m_nCurrY, TargeTBaseObject) then begin
        if PlayObject.IsProperTarget (TargeTBaseObject) then begin
          if (TargeTBaseObject.m_nAntiMagic <= Random(50)) and (abs(TargeTBaseObject.m_nCurrX-nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY-nTargetY) <= 1) then begin
            with PlayObject do begin
                nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1);
            end;
            PlayObject.SendDelayMsg (PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2, integer(TargeTBaseObject), '', 600);
            if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then boTrain:=True;
          end else
            TargeTBaseObject := nil;
        end else
         TargeTBaseObject := nil;
      end else
        TargeTBaseObject := nil;
    end;

    SKILL_HEALLING{2}: begin
      if TargeTBaseObject = nil then begin
        TargeTBaseObject:=PlayObject;
        nTargetX:=PlayObject.m_nCurrX;
        nTargetY:=PlayObject.m_nCurrY;
      end;
      if PlayObject.IsProperFriend(TargeTBaseObject) then begin
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC) * 2,
                                      SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) * 2 + 1);
        if TargeTBaseObject.m_WAbil.HP < TargeTBaseObject.m_WAbil.MaxHP then begin
          TargeTBaseObject.SendDelayMsg(PlayObject,RM_MAGHEALING,0,nPower,0,0,'',800);
          boTrain:=True;
        end;
        if PlayObject.m_boAbilSeeHealGauge then
          PlayObject.SendDefMsg(PlayObject, SM_INSTANCEHEALGUAGE, Integer(TargeTBaseObject),
             TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, 0, '');
      end;
    end;
    SKILL_AMYOUNSUL{6}: begin {¾Ï¿¬¼ú}
      boSpellFail:=True;

      if PlayObject.IsProperTarget(TargeTBaseObject) then begin

        if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin  //µ¶°¡·ç È®ÀÎ
          StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
          if StdItem <> nil then begin
          UseAmulet(PlayObject,1,5,nAmuletIdx);


          if 6 >= Random(7 + TargeTBaseObject.m_btAntiPoison) then begin
            case StdItem.Shape of
              7: begin  //È¸»öµ¶°¡·ç :Áßµ¶
                nPower:=GetPower13(30) + GetRPow(PlayObject.m_WAbil.SC);
                TargeTBaseObject.SendDelayMsg(PlayObject,RM_POISON,POISON_DECHEALTH,nPower,Integer(PlayObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
              8: begin  //È²»öµ¶°¡·ç : ¹æ¾î·Â°¨¼Ò
                if (TargeTBaseObject.m_LastHiter = nil) and (TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] > 0) then begin  //»¡µ¶°É¸é ³ìµ¶Àº »ç¶óÁø´Ù.
                                    TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] := 0;
                end;
                nPower:=GetPower13(30) + GetRPow(PlayObject.m_WAbil.SC);
                TargeTBaseObject.SendDelayMsg(PlayObject,RM_POISON,POISON_DAMAGEARMOR,nPower,Integer(PlayObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
              end;
            end;
            // °¥ÇÇ Ã¼Å©(sonmg 2005/11/28)
            if (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) and (PlayObject.m_btRaceServer = RC_PLAYOBJECT) then begin    //20110714
                //Á¤´ç¹æ¾î¸¦ À§ÇÑ ±â·Ï..
               TargeTBaseObject.SetPKFlag (PlayObject);
               TargeTBaseObject.SetLastHiter (PlayObject);
            end else if (TargeTBaseObject.m_Master <> nil) then begin
            //Áßµ¶µÈ ¼ÒÈ¯¸÷ÀÇ ÁÖÀÎÀÌ ¶§¸°»ç¶÷ÀÌ ¾Æ´Ï¸é
               if TargeTBaseObject.m_Master <> PlayObject then begin
                 //Á¤´ç¹æ¾î¸¦ À§ÇÑ ±â·Ï..
                 TargeTBaseObject.SetPKFlag (PlayObject);
                 TargeTBaseObject.SetLastHiter (PlayObject);
               end;
            end;
           //-----------------------------------------
            if (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) or (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then
              boTrain:=True;
          end;
          PlayObject.SetTargetCreat(TargeTBaseObject);
          boSpellFail:=False;
          end;
        end;
      end;
    end;
    SKILL_FIREWIND{8}: begin
      if MagPushArround(PlayObject,UserMagic.btLevel) > 0 then boTrain:=True;
    end;
    SKILL_FIRE{9}: begin  //¿°»çÀå
      n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
      if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
        PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,5,nTargetX,nTargetY);
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
        if PlayObject.MagPassThroughMagic(n14,n18,nTargetX,nTargetY,n1C,nPower,False) > 0 then
          boTrain:=True;
      end;
    end;
    SKILL_SHOOTLIGHTEN{10}: begin
      n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
      if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
        PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,8,nTargetX,nTargetY);
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
        if PlayObject.MagPassThroughMagic(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
          boTrain:=True;
      end;
    end;
    SKILL_LIGHTENING{11}: begin
      if PlayObject.IsProperTarget (TargeTBaseObject) then begin
        if (Random(50) >= TargeTBaseObject.m_nAntiMagic) then begin
          nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
          if TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD then
            nPower:=ROUND(nPower * 1.5);
          PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',600);
          if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
            boTrain:=True;
        end else TargeTBaseObject:=nil
      end else TargeTBaseObject:=nil;
    end;
    SKILL_FIRECHARM{13},
    SKILL_HANGMAJINBUB{14},
    SKILL_DEJIWONHO{15},
    SKILL_HOLYSHIELD{16},
    SKILL_SKELLETON{17},
    SKILL_CLOAK{18},
    SKILL_BIGCLOAK{19},
    SKILL_ENHANCER{36}, //¹«±ØÁø±â
    SKILL_CURSE{46},   //ÀúÁÖ¼ú
    SKILL_HALLUC{49}, //¹ÌÈ¥¼ú
    SKILL_MASSPOISON{55},//µ¶¹«
    SKILL_ANGUISH{75},
    SKILL_OHAENG{83}, //À½¾ç¿ÀÇàÁø
    SKILL_HEATHRECOVERY{95}, //Èí¼º´ë¹ý
    SKILL_SPELLRECOVERY{96}, //°­¸¶Áø¹ý
    SKILL_WINDMOON{99}, //Ã»Ç³¸í¿ù
    SKILL_BLOODMOON{100}, //ÀûÇ÷¹«¿µ
    SKILL_JINGOL{136},
    SKILL_CHUNGONG{138}, //Ãµ°ø
    SKILL_TAEGEUK{87} //ÅÂ±ØÁø
    : begin
      boSpellFail:=True;
      if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin   //ºÎÀû È®ÀÎ
        UseAmulet(PlayObject,1,5,nAmuletIdx);
        case UserMagic.MagicInfo.wMagicId of
          SKILL_FIRECHARM{13}: begin
            if PlayObject.MagCanHitTarget(PlayObject.m_nCurrX,PlayObject.m_nCurrY,TargeTBaseObject) then begin
              if PlayObject.IsProperTarget(TargeTBaseObject) then begin
                if Random(50) >= TargeTBaseObject.m_nAntiMagic then begin
                  if (abs(TargeTBaseObject.m_nCurrX - nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY - nTargetY) <= 1) then begin
                    nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
                                                   SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) * 1 + 50);
                    PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',1200);
                    if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
                      boTrain:=True;
                  end;
                end;
              end;
            end else TargeTBaseObject:=nil;
          end;

          SKILL_HEATHRECOVERY{95}: begin     //Èí¼º´ë¹ý
              Case UserMagic.btLevel of
                0: n14 := 4;
                1: n14 := 6;
                2: n14 := 8;
                3: n14 := 10;
              end;
              nPower:= PlayObject.GetAttackPower(GetPower13(60) + 4 * LoWord(PlayObject.m_WAbil.SC) ,4 * SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1);
              if PlayObject.MagMakeAddDefenceArea(nTargetX,nTargetY,3,nPower,n14,0) > 0 then
               boTrain:=True;
          end;
          SKILL_SPELLRECOVERY{96}: begin   //°­¸¶Áø¹ý
              Case UserMagic.btLevel of
               0: n14 := 4;
               1: n14 := 6;
               2: n14 := 8;
               3: n14 := 10;
              end;
              nPower:= PlayObject.GetAttackPower(GetPower13(60) + 4 * LoWord(PlayObject.m_WAbil.SC),4 * SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1);
              if PlayObject.MagMakeAddDefenceArea(nTargetX,nTargetY,3,nPower,n14,1) > 0 then
               boTrain:=True;
          end;

          SKILL_HANGMAJINBUB{14}: begin    //Ç×¸¶Áø¹ý
            nPower:= PlayObject.GetAttackPower(GetPower13(60) + 4 * LoWord(PlayObject.m_WAbil.SC) ,4 * SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1);
            if PlayObject.MagMakeDefenceArea(nTargetX,nTargetY,3,nPower,1) > 0 then
              boTrain:=True;
          end;
          SKILL_DEJIWONHO{15}: begin   //´ëÁö¿øÈ£
            nPower:= PlayObject.GetAttackPower(GetPower13(60) + 4 * LoWord(PlayObject.m_WAbil.SC),4 * SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1);
            if PlayObject.MagMakeDefenceArea(nTargetX,nTargetY,3,nPower,0) > 0 then
              boTrain:=True;
          end;
          SKILL_HOLYSHIELD{16}: begin //°á°è
            if MagMakeHolyCurtain(PlayObject,GetPower13(40) + GetRPow(PlayObject.m_WAbil.SC) * 3,nTargetX,nTargetY) > 0 then
              boTrain:=True;
          end;
          SKILL_SKELLETON{17}: begin    //¹é°ñ
            if PlayObject.SlaveCount(g_Config.sSkeleton) > 0 then begin
               PlayObject.RecallSlave(g_Config.sSkeleton);
            end else begin
              if MagMakeSlave(PlayObject,UserMagic) then begin
                boTrain:=True;
              end;
            end;
          end;

          SKILL_JINGOL{136}: begin    //Áø°ñ
            if PlayObject.SlaveCount(g_Config.sJinSkeleton) > 0 then begin
               PlayObject.RecallSlave(g_Config.sJinSkeleton);
            end else begin
              if MagMakeJinSlave(PlayObject,UserMagic) then begin
                boTrain:=True;
              end;
            end;
          end;

          SKILL_CLOAK{18}: begin   //Àº½Å¼ú
            if MagMakePrivateTransparent(PlayObject,GetPower13(30) + GetRPow(PlayObject.m_WAbil.SC) * 3) then
              boTrain:=True;
          end;
          SKILL_BIGCLOAK{19}: begin  //´ëÀº½Å¼ú
            if MagMakeGroupTransparent(PlayObject,nTargetX,nTargetY,GetPower13(30) + GetRPow(PlayObject.m_WAbil.SC) * 3) then
              boTrain:=True;
          end;

          SKILL_ENHANCER{36}: begin //¹«±ØÁø±â
             n14 := PlayObject.GetAttackPower(GetPower13(60) + LoWord(PlayObject.m_WAbil.SC) * 5,
                  5 * ( SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1) );

             nPower := ((HiWord(PlayObject.m_WAbil.SC)-1) div 5) + 1;
                        if (nPower > 10) then nPower := 10;

             if PlayObject.AttPowerUp(nPower, n14) then
               boTrain:=True;

             if (TargeTBaseObject <> nil) and (TargeTBaseObject.m_btRaceServer in [RC_PLAYOBJECT, RC_HEROOBJECT]) and PlayObject.IsProperFriend(TargeTBaseObject) then begin
                if TargeTBaseObject.AttPowerUp(nPower, n14) then begin
                  TargeTBaseObject.SendRefMsg(RM_10205,0,0,0,15,'0');   //¹«±ØÁø±â ÀÌÆÑÆ®
                  boTrain:=True;
                end;
             end;
          end;

          SKILL_WINDMOON{99}: begin   //Ã»Ç³¸í¿ù
             case UserMagic.btLevel of
               0   : n14 := 5 * 60;
               1   : n14 := 10 * 60;
               2   : n14 := 15 * 60;
               3   : n14 := 20 * 60;
             end;
             if PlayObject.MagicPowerUpWindMoon(n14) then
               boTrain:=True;

             if (TargeTBaseObject <> nil) and (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                if TargeTBaseObject.MagicPowerUpWindMoon(n14) then begin
                  TargeTBaseObject.SendRefMsg(RM_10205,0,0,0,11,'0');   //Ã»Ç³¸í¿ù ÀÌÆÑÆ®
                  boTrain:=True;
                end;
             end;
          end;

          SKILL_BLOODMOON{100}: begin //ÀûÇ÷¹«¿µ
             case UserMagic.btLevel of
               0   : n14 := 5 * 60;
               1   : n14 := 10 * 60;
               2   : n14 := 15 * 60;
               3   : n14 := 20 * 60;
             end;
             if PlayObject.MagicPowerUpBloodMoon(n14) then
               boTrain:=True;

             if (TargeTBaseObject <> nil) and (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
                if TargeTBaseObject.MagicPowerUpBloodMoon(n14) then begin
                  TargeTBaseObject.SendRefMsg(RM_10205,0,0,0,14,'0');   //ÀûÇ÷¹«¿µ ÀÌÆÑÆ®
                  boTrain:=True;
                end;
             end;
          end;

          SKILL_CURSE{46}: begin   //ÀúÁÖ¼ú
           // n14 := ( (( UserMagic.btLevel + 1) * 24 ) + Hiword(PlayObject.m_WAbil.SC) + PlayObject.m_Abil.Level ) div 4;
            case UserMagic.btLevel of
              0   : n14 := 10;
              1   : n14 := 30;
              2   : n14 := 50;
              3   : n14 := 70;
            end;

            case UserMagic.btLevel of
              0   : nPower := 93;
              1   : nPower := 88;
              2   : nPower := 82;
              3   : nPower := 75;
            end;
              if PlayObject.MagMakeCurseArea(nTargetX,nTargetY,2, n14 ,nPower,UserMagic.btLevel,True ) > 0 then begin
                boTrain:=True;
              end;
          end;
          SKILL_HALLUC: begin //¹ÌÈ¥¼ú
          if PlayObject.IsProperTarget(TargeTBaseObject) Then begin
           if (TargeTBaseObject.m_btRaceServer <> RC_ANIMAL) then begin
            n14 := PlayObject.m_Abil.Level - TargeTBaseObject.m_Abil.Level;
            if (20 - (UserMagic.btLevel + 1) * 2) <= Random(GetRPow(PlayObject.m_WAbil.SC) +
             (PlayObject.m_Abil.Level div 5) + (n14 * 2)) then begin
              if (TargeTBaseObject.m_Abil.Level < PlayObject.m_Abil.Level + 1 + Random(3)) and
                (TargeTBaseObject.m_Abil.Level < 65) then begin
                if (TargeTBaseObject.m_boHallucMode = False) then begin
                  nPower := GetPower13(10) + Round(GetRPow(PlayObject.m_WAbil.SC) / 3);
                  nPower := nPower + Random(20);
                  TargeTBaseObject.m_TargetCret := nil;
                  TargeTBaseObject.OpenHallucMode(nPower);
                end;
              end;
              boTrain:=True;
            end;
             PlayObject.SetTargetCreat(TargeTBaseObject);
           end;
          end;
          end;

          SKILL_MASSPOISON{55}: begin {PoisonCloud - Taoist}  //µ¶¹«
           if GetTickCount - PlayObject.m_dwMassPoison > g_Config.nMagMassPoisonDelay * 1000 then begin
             if CheckAmulet2(PlayObject,2,5,55,nAmuletIdx) then begin  //È¸»ö µ¶°¡·ç È®ÀÎ
               StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
               if StdItem <> nil then begin
                 UseAmulet(PlayObject,2,5,nAmuletIdx);     //È¸»ö µ¶°¡·ç È®ÀÎ
                 case StdItem.Shape of
                   7: begin

                       if MagPoisonCloud(PlayObject, UserMagic, PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
                             SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) + 20),9,nTargetX,nTargetY) then begin
                         boTrain:=True;
                         PlayObject.m_dwMassPoison := GetTickCount();
                       end;

                   end;
                 end;
               end;
             end;
           end else
             PlayObject.SysMsg(IntToStr(g_Config.nMagMassPoisonDelay - (GetTickCount - PlayObject.m_dwMassPoison) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
          end;

          SKILL_CHUNGONG{138}: begin //Ãµ°ø
            if GetTickCount - PlayObject.m_138Time > UserMagic.MagicInfo.dwUseDelayTime * 1000 then begin
             if CheckAmulet2(PlayObject,2,5,138,nAmuletIdx) then begin  //È¸»ö µ¶°¡·ç È®ÀÎ
               StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
               if StdItem <> nil then begin
                 UseAmulet(PlayObject,2,5,nAmuletIdx);     //È¸»ö µ¶°¡·ç È®ÀÎ
                 case StdItem.Shape of
                   7, 8: begin

                       if MagChunGong(PlayObject, UserMagic, PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
                             SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) + 20),9,nTargetX,nTargetY) then begin
                         boTrain:=True;
                         PlayObject.m_138Time := GetTickCount();
                         PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,79,'0',2000);
                         PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,79,'0',3500);
                         case UserMagic.btLevel of
                          0   : n14 := 10;
                          1   : n14 := 30;
                          2   : n14 := 50;
                          3   : n14 := 70;
                         end;
                         case UserMagic.btLevel of
                          0   : nPower := 93;
                          1   : nPower := 88;
                          2   : nPower := 82;
                          3   : nPower := 75;
                         end;
                         if PlayObject.MagMakeCurseArea(nTargetX,nTargetY, 2, n14 ,nPower,UserMagic.btLevel,True ) > 0 then

                       end;

                   end;
                 end;
               end;
             end;
           end else
             PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_138Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
          end;

          SKILL_OHAENG{83}: begin //À½¾ç¿ÀÇàÁø
          if GetTickCount - PlayObject.m_Ohaeng > UserMagic.MagicInfo.dwUseDelayTime then begin
            if CheckAmulet2(PlayObject,5,5,55,nAmuletIdx) then begin  //ºÎÀû È®ÀÎ
              StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
              if StdItem <> nil then begin
                UseAmulet(PlayObject,5,5,nAmuletIdx);     //ºÎÀû »ç¿ë
                nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
                                    SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) + 20);
                if MagOhaeng(PlayObject, UserMagic, nPower, 20, nTargetX, nTargetY) then begin
                  PlayObject.m_Ohaeng := GetTickCount();
                  boTrain:=True;
                  if PlayObject.DelayOhaeng( UserMagic.MagicInfo.dwUseDelayTime ) then
                end;
              end;
            end;
          end else
            PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Ohaeng) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
          end;

          SKILL_TAEGEUK{87}: begin //ÅÂ±ØÁø
            if PlayObject.MagCanHitTarget(PlayObject.m_nCurrX,PlayObject.m_nCurrY,TargeTBaseObject) then begin
              if PlayObject.IsProperTarget(TargeTBaseObject) then begin
                  with PlayObject do begin
                     nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),
                                       SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC))+ 1);
                  end;

                  PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',800);
                  if (Random(25) < UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
                       TargeTBaseObject.MakePosion(POISON_STUN,(UserMagic.btLevel + 1) * 2,0);
                  end;
                  if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then boTrain:=True;
              end else TargeTBaseObject:=nil;
            end else TargeTBaseObject:=nil;
          end;

          SKILL_ANGUISH{75}:begin      //¹ø³ú
            if PlayObject.IsProperTarget (TargeTBaseObject) then begin
               with PlayObject do begin
                  nPower := ( GetPower(MPow(UserMagic)) + HiWord(m_WAbil.SC) * 2 );
               end;

              if CheckAmulet2(PlayObject,2,5,75,nAmuletIdx) then begin   //µ¶°¡·ç È®ÀÎ
                StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
                if StdItem <> nil then begin
                  UseAmulet(PlayObject,2,5,nAmuletIdx);    //µ¶°¡·ç È®ÀÎ
                  case StdItem.Shape of
                   7: begin        //È¸»ö µ¶°¡·ç
                    if (Random(10) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
                       TargeTBaseObject.MakePosion(POISON_DECHEALTH,(UserMagic.btLevel + 2) * 8, 20 + Random(10));
                    end;
                    if (Random(20) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
                       TargeTBaseObject.MakePosion(POISON_SLOWDOWN,(UserMagic.btLevel + 2) * 2,0);
                    end;
                    if (Random(40) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) and (Not TargeTBaseObject.m_NoPoison) then begin
                       TargeTBaseObject.MakePosion(POISON_STONE,(UserMagic.btLevel + 2) * 2,0);
                    end;
                   end;
                   8: begin
                    if (Random(10) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
                       TargeTBaseObject.MakePosion(POISON_DAMAGEARMOR,(UserMagic.btLevel + 2) * 8,0);
                    end;
                    if (Random(20) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
                       TargeTBaseObject.MakePosion(POISON_SLOWDOWN,(UserMagic.btLevel + 2) * 2,0);
                    end;
                    if (Random(40) <= UserMagic.btLevel) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) and (Not TargeTBaseObject.m_NoPoison) then begin
                       TargeTBaseObject.MakePosion(POISON_STONE,(UserMagic.btLevel + 2) * 2,0);
                    end;
                  end;
                end;
                if (TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT) or (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then
                 boTrain:=True;
                 PlayObject.SetTargetCreat(TargeTBaseObject);
                end;
              end;

              VampPower := round(npower * 1);
              TargeTBaseObject.DamageSpell(VampPower);  //´ë»ó ¸¶·Â ¼Ò¸ð ½ÃÅ°´Â°Å.
              PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',0);

              if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
                boTrain:=True;
            end else TargeTBaseObject:=nil;
          end;



        end;
        boSpellFail:=False;
      end;
    end;

    SKILL_TAMMING{20}: begin
      if PlayObject.IsProperTarget (TargeTBaseObject) then begin
        if MagTamming(PlayObject,TargeTBaseObject,nTargetX,nTargetY,UserMagic.btLevel) then
          boTrain:=True;
      end;
    end;
    SKILL_SPACEMOVE{21}: begin
      PlayObject.SendRefMsg(RM_MAGICFIRE,0,MakeWord(UserMagic.MagicInfo.btEffectType,UserMagic.MagicInfo.btEffect),MakeLong(nTargetX,nTargetY),Integer(TargeTBaseObject),'');
      boSpellFire:=False;
      if MagSaceMove(PlayObject,UserMagic.btLevel) then
        boTrain:=True;
    end;
    SKILL_EARTHFIRE{22}: begin   //Áö¿°¼ú
      if MagMakeFireCross(PlayObject,
                          PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                          SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1),
                          GetPower(10) + (Word(GetRPow(PlayObject.m_WAbil.MC)) shr 1),
                          nTargetX,
                          nTargetY) > 0 then
        boTrain:=True;
    end;
    SKILL_THUNDER{111}: begin   //³«·Ú
       if MagThenderExplosion(PlayObject,
                         PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         2) then
        boTrain:=True;
    end;

    SKILL_FIREBOOM{23}: begin
      if MagBigExplosion(PlayObject,
                         PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         g_Config.nFireBoomRage{1}) then
        boTrain:=True;
    end;
    SKILL_LIGHTFLOWER{24}: begin  //·Ú¼³È­
      if MagElecBlizzard(PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1)) then
        boTrain:=True;
    end;
    SKILL_SHOWHP{28}: begin
      if (TargeTBaseObject <> nil) and not TargeTBaseObject.m_boShowHP then begin
        if Random(6) <= (UserMagic.btLevel + 3) then begin
          TargeTBaseObject.m_dwShowHPTick:=GetTickCount();
          TargeTBaseObject.m_dwShowHPInterval:=GetPower13(GetRPow(PlayObject.m_WAbil.SC) * 2 + 30) * 1000;
          TargeTBaseObject.SendDelayMsg(TargeTBaseObject,RM_DOOPENHEALTH,0,0,0,0,'',1500);
          boTrain:=True;
        end;
      end;        
    end;
    SKILL_BIGHEALLING{29}: begin   //´ëÈ¸º¹¼ú
      nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC) * 2,
                                    SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) * 3 + 1);
      if MagBigHealing(PlayObject,nPower,nTargetX,nTargetY) then boTrain:=True;
    end;
    SKILL_SINSU{30}: begin     //½Å¼ö
        boSpellFail:=True;
        if CheckAmulet(PlayObject,3,5,nAmuletIdx) then begin     //ºÎÀûÈ®ÀÎ
          UseAmulet(PlayObject,3,5,nAmuletIdx);
          if MagMakeSinSuSlave(PlayObject,UserMagic) then begin
            boTrain:=True;
          end;
          boSpellFail:=False;
        end;
    end;


    SKILL_SHIELD{31}: begin   //ÁÖ¼úÀÇ¸·
      if PlayObject.MagBubbleDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.MC) + 30)) then
            boTrain:=True;
    end;


    SKILL_KILLUNDEAD{32}:begin
      if PlayObject.IsProperTarget (TargeTBaseObject) then begin
        if MagTurnUndead(PlayObject,TargeTBaseObject,nTargetX,nTargetY,UserMagic.btLevel) then
          boTrain:=True;
      end;
    end;
    SKILL_SNOWWIND{33}: begin
      if MagBigExplosion(PlayObject,
                         PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         g_Config.nSnowWindRange{1}) then
        boTrain:=True;
    end;

  {###########NEW SPELLS START HERE #############}

    { {34} {Crosshalfmoon}

    SKILL_FLAMEDIS{35}: {FlameDisruptor - Wizard}
     if PlayObject.IsProperTarget (TargeTBaseObject) then begin
        if (Random(50) >= TargeTBaseObject.m_nAntiMagic) then begin
          nFlamePower:=0;
          nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
          if TargeTBaseObject.m_btLifeAttrib <> LA_UNDEAD then
           nFlamePower:=ROUND(nPower * 0.15);
           nPower:=nPower + nFlamePower;
          PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',600);
          if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
            boTrain:=True;
        end else TargeTBaseObject:=nil
      end else TargeTBaseObject:=nil;



    SKILL_ENERGYREPULSOR{37}: begin {EnergyRepulsor - Taoist}
     if MagPushArround(PlayObject,UserMagic.btLevel) > 0 then boTrain:=True;
    end;

    { {38} {TwinDragonBlade - Warrior}

    SKILL_FROST{39}: begin //°áºùÀå

        if PlayObject.MagCanHitTarget (PlayObject.m_nCurrX, PlayObject.m_nCurrY, TargeTBaseObject) then begin
            if PlayObject.IsProperTarget (TargeTBaseObject) then begin
               if (TargeTBaseObject.m_nAntiMagic <= Random(50)) and (abs(TargeTBaseObject.m_nCurrX-nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY-nTargetY) <= 1) then begin
                  with PlayObject do begin
                     //°áºùÀå °ø½Ä ¼öÁ¤(sonmg 2004/10/20)
                     Dur := (Round (0.4+UserMagic.btLevel*0.2) * (Lobyte(m_WAbil.MC) + Random(Hibyte(m_WAbil.MC)) + (Hibyte(m_WAbil.MC) div 2)));
                     nPower := UserMagic.MagicInfo.wPower +  Dur;
                  end;
                  PlayObject.SendDelayMsg (PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2, integer(TargeTBaseObject), '', 600);
                  // »óÅÂÀÌ»ó...µÐÈ­ÆÇÁ¤
                  if {(TargeTBaseObject.m_Abil.Level < 100) and }
                     (TargeTBaseObject.m_wStatusTimeArr[POISON_SLOWDOWN] = 0) and
                     (TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] = 0) and
                     (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin    // 100->50
                     MoC := 1;
                     Gap := TargeTBaseObject.m_Abil.Level - PlayObject.m_Abil.Level;
                     if Gap > 10 then Gap := 10;
                     if Gap <-10 then Gap :=-10;
                     if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
                     if Random(100) < (20 + (UserMagic.btLevel - Gap) div Moc) then begin
                        Dur := (1200 * UserMagic.btLevel + 6400) div 1000;
                        if (MoC = 1) and (Random(10) = 0) then TargeTBaseObject.MakePosion(POISON_FREEZE, Dur, 1)
                        else if (MoC = 2) and (Random(100) = 0) then TargeTBaseObject.MakePosion(POISON_FREEZE, Dur, 1)
                        else TargeTBaseObject.MakePosion(POISON_SLOWDOWN, Dur + 1, 1);
                     end;
                  end;
                  if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then boTrain := TRUE;
               end else
                  TargeTBaseObject := nil;
            end else
               TargeTBaseObject := nil;
         end else
            TargeTBaseObject := nil;
    end;

    
    SKILL_PURI{40}: begin  //Á¤È­¼ú
       if TargeTBaseObject = nil then begin
         TargeTBaseObject:=PlayObject;
       end;
       if MagMakeUnTreatment(PlayObject,UserMagic, TargeTBaseObject) then
         boTrain := True;
      end;



    SKILL_ANGEL{41}: begin {Á¤È¥¼ÒÈ¯¼ú ¿ù·É}
       if CheckAmulet(PlayObject,3,5,nAmuletIdx) then begin        //ºÎÀûÈ®ÀÎ
         UseAmulet(PlayObject,3,5,nAmuletIdx);
         if MagMakeAngelSlave(PlayObject,UserMagic) then
           boTrain:=True;
       end;
    end;

    SKILL_DARKANGEL{101}: begin {È¥·É¼ÒÈ¯¼ú}
       if CheckAmulet(PlayObject,3,5,nAmuletIdx) then begin        //ºÎÀûÈ®ÀÎ
         UseAmulet(PlayObject,3,5,nAmuletIdx);

         if MagMakeDarkAngelSlave(PlayObject,UserMagic) then
           boTrain:=True;
       end;
    end;

    SKILL_MIRROR{42}: begin //ºÐ½Å¼ú
       if MagMakeClone(PlayObject,UserMagic) then
         boTrain:=True;
    end;

    SKILL_LION{43}: begin {»çÀÚÈÄ}
      if MagGroupMb(PlayObject,UserMagic,TargeTBaseObject) then boTrain:=True;
    end;

    SKILL_BLADEAV{44}: begin //°øÆÄ¼¶
      if MagWindCut ( Playobject , UserMagic.btLevel ) then boTrain:=True;
    end;

    SKILL_FLAMEFIELD{45}: begin //È­·æ±â¿°
      if MagFireField(PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1)) then
        boTrain:=True;
    end;

    SKILL_ENTRAP{47}: begin //Æ÷½Â°Ë
      if MagPullMon (PlayObject, TargeTBaseObject, UserMagic.btLevel ) then begin
         boTrain := true;
      end;
    end;

    SKILL_VAMP{48}: begin //ÈíÇ÷¼ú
      if PlayObject.IsProperTarget (TargeTBaseObject) then begin
        if (Random(50) >= TargeTBaseObject.m_nAntiMagic) then begin
          with PlayObject do begin
          nPower:= GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.MC),
                                      SmallInt(HiWord(m_WAbil.MC)-LoWord(m_WAbil.MC)) + 1);
          end;
          VampPower := round(npower div 5);
          if VampPower < 0 then begin

            PlayObject.SysMsg('Attack Failed',c_Red,t_Hint);
            exit;
          end;
          PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(nTargetX,nTargetY),2,Integer(TargeTBaseObject),'',1000);
          if PlayObject.m_WAbil.HP + VampPower > PlayObject.m_WAbil.MaxHP then begin
            PlayObject.m_WAbil.HP := PlayObject.m_WAbil.MaxHP;
          end else
            PlayObject.m_WAbil.HP := PlayObject.m_WAbil.HP + VampPower;
          PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,13,'0',1000);   //ÈíÇ÷ ÀÌÆÑÆ®
          playobject.RecalcAbilitys();
          playobject.SendMsg(playobject,RM_ABILITY,0,0,0,0,'');
          if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
            boTrain:=True;
        end else TargeTBaseObject:=nil
      end else TargeTBaseObject:=nil;
    end;


    SKILL_RAGE{50}: begin //Ã·±âÆø
      nPower := Round(HiWord(PlayObject.m_WAbil.DC) * (0.12 + (0.03 * UserMagic.btLevel))) - 2;

      if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then //Ã·±âÆø °­È­
       nPower := Round(nPower * 1.3);

      n14 := 90+(30*UserMagic.btLevel);

      if PlayObject.MagRage(nPower, n14) then begin
        boTrain:=True;
      end;
    end;

    SKILL_PROTECTIONFIELD{51}: begin //È£½Å±â¸·
      nPower := (UserMagic.btLevel + 1) + Round(HiWord(PlayObject.m_WAbil.AC) div 9) - 2;

      if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then //È£½Å±â¸· °­È­
       nPower := Round(nPower * 1.3);

      n18 := 90+(30*UserMagic.btLevel);
      if PlayObject.MagProtectionField(nPower, n18) then begin
        boTrain:=True;
      end;
    end;

    SKILL_ICESHOWER{52}: begin //Ãµ»óºùÈ¯
      nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                         SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC)) div 2 + 1);
      if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then   //Ãµ»óºùÈ¯ °­È­
        nPower := Round(nPower * 1.3);

      if MagBigExplosion2(PlayObject, UserMagic, nPower,nTargetX,nTargetY, 2) then begin
        if MagBlizzard(PlayObject, UserMagic, nPower,18,nTargetX,nTargetY) then begin
          boTrain := True;
          if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then begin   //Ãµ»óºùÈ¯ °­È­
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,134,'0',1500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,134,'0',2700);
          end else begin
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,38,'0',1500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,38,'0',2700);
          end;
        end;
      end;
    end;

    SKILL_FIRESHOWER{53}: begin //Ãµ»ó³«¿°
      nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                             SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC)) div 2 + 5);
      if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then  //Ãµ»ó³«¿° °­È­
        nPower := Round(nPower * 1.3);

      if MagBigExplosion4(PlayObject, UserMagic, nPower, nTargetX,nTargetY, 2) then begin
        if MagMeteor(PlayObject, UserMagic, nPower,18,nTargetX,nTargetY) then begin
          boTrain:=True;
          PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,49,'0',2500);
          if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then begin  //Ãµ»ó³«¿° °­È­
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,135,'0',1500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,135,'0',2700);
          end else begin
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,40,'0',1500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,40,'0',2700);
          end;
        end;
      end;
    end;


    SKILL_REDBANWOL: begin    //ÀÏ¼¶
         n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
         if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
           PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,nTargetX,nTargetY);
           nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1);
           if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then  //ÀÏ¼¶ °­È­
             nPower := Round(nPower * 1.3);
             
           if PlayObject.MagPassIlsum(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
             boTrain:=True;
             if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then begin   //ÀÏ¼¶ °­È­
               PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_UPILSUM,IntToStr(PlayObject.m_btDirection));
             end else begin
               PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_ILSUM,IntToStr(PlayObject.m_btDirection));
             end;
             PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,2,nTargetX,nTargetY);
             if MagChangePosition(PlayObject, nTargetX, nTargetY) then  //ÀÏ¼¶
         end;
    end;


    SKILL_WINDSTAINED{57}: begin         //ºù¿°¼ú
    if MagIceWindStaied(Playobject,UserMagic.btLevel,UserMagic) then boTrain:=True;
    end;


    SKILL_SUNCHEN{58}: begin //¼±Ãµ±â°ø
     { if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin     //ºÎÀûÈ®ÀÎ     ±×·ìÀüÃ¼
        UseAmulet(PlayObject,1,5,nAmuletIdx);
        if PlayObject.m_GroupOwner <> nil then begin    //±×·ì È¹µæ ¸Þ½ÃÁö
          for i:=0 to PlayObject.m_GroupOwner.m_GroupMembers.Count-1 do begin
             TargeTBaseObject:=TBaseObject(PlayObject.m_GroupOwner.m_GroupMembers.Objects[i]);
             if TargeTBaseObject = nil then Continue;
             if PlayObject.m_PEnvir = TargeTBaseObject.m_PEnvir then begin
               TargeTBaseObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 25));
               boTrain:=True;
             end;
          end;
        end else begin
          PlayObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 15));
          boTrain:=True;
        end;
      end;  }
      if TargeTBaseObject = nil then begin   //Å¸°ÙÆÃ
        TargeTBaseObject:=PlayObject;
        nTargetX:=PlayObject.m_nCurrX;
        nTargetY:=PlayObject.m_nCurrY;
      end;
      if not PlayObject.IsGroupMember(TargeTBaseObject) then begin
        if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin      //ºÎÀûÈ®ÀÎ
          UseAmulet(PlayObject,1,5,nAmuletIdx);
          PlayObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 15));
          boTrain:=True;
        end;
      end;
      if PlayObject.IsGroupMember(TargeTBaseObject) then begin
        if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin     //ºÎÀûÈ®ÀÎ
          UseAmulet(PlayObject,1,5,nAmuletIdx);
          PlayObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 25));
          TargeTBaseObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 25));
          boTrain:=True;
        end;
      end;
      if (TargeTBaseObject.m_btRaceServer in [RC_HEROOBJECT]) and  (PlayObject.m_MyHero = TargeTBaseObject) then begin
        if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin     //ºÎÀûÈ®ÀÎ
          UseAmulet(PlayObject,1,5,nAmuletIdx);
          TargeTBaseObject.CelestialDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 25));
          boTrain:=True;
        end;
      end;
   end;


    SKILL_BODDYWIND{61}: begin    //Ã¼½ÅÇ³
      nPower := UserMagic.btLevel;
      case UserMagic.btLevel of
      0 : nPower := 2;
      1 : nPower := 4;
      2 : nPower := 6;
      3 : nPower := 8;
      end;
      case UserMagic.btLevel of
      0 : n14 := 20;
      1 : n14 := 30;
      2 : n14 := 55;
      3 : n14 := 70;
      end;
      if PlayObject.AttSpeedUp(nPower, n14) then boTrain:=True;
    end;

    SKILL_CHUNSWORD{63}: begin //ÃµÀÌ°Ë
      if CheckWeapon(PlayObject) then begin
       n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
       if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
         PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,2,nTargetX,nTargetY);
         nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)));
         if PlayObject.MagPassThroughMagic2(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
           boTrain:=True;
       end;
      end else begin
       Result:=FALSE;
      end;
    end;



    SKILL_FIREWINDSWORD{64}: begin   //¿­Ç³°Ý
      if MagPushArrounddamage(PlayObject,UserMagic.btLevel) > 0 then boTrain:=True;
    end;

    SKILL_POBAKCUSTAIN{65}: begin    //Æ÷¹Ú¼ú
      if MagMakepobak(PlayObject,GetPower13(40) + GetRPow(PlayObject.m_WAbil.DC) * 3,nTargetX,nTargetY) > 0 then
         boTrain:=True;
    end;

    SKILL_MOONSHADOW{66}: begin    //¿ù¿µ¼ú
      if ((GetTickCount() - PlayObject.m_dwTargetFocusTick > 15 * 1000)) then begin
      if MagMakePrivateAssTransparent(PlayObject,UserMagic.btLevel*5+15) then
         boTrain:=True;
      end else
      PlayObject.SysMsg(IntToStr(15 - (GetTickCount - PlayObject.m_dwTargetFocusTick) div 1000) + 'ÃëÒÔºó²ÅÄÜ¹¥»÷µÐÈË£¬ÔÂÓ°Êõ×´Ì¬ÏÂ²»ÄÜ¹¥»÷µÐÈË¡£',c_Green,t_Hint);
    end;

    SKILL_KYEONGSIN{68}: begin  //°æ½Åº¸
    if GetTickCount - PlayObject.m_WalkSpeedUpTick > 120 * 1000 Then begin
      n14 := (UserMagic.btLevel*20 + 30);
      if PlayObject.WalkSpeedUp(n14) then begin
        boTrain:=True;
        PlayObject.m_WalkSpeedUpTick := GetTickCount();
        PlayObject.SysMsg('ÇáÉí²½µÄÀäÈ´Ê±¼äÎª120Ãë¡£',c_Green,t_Hint);
      end;
    end else
    PlayObject.SysMsg(IntToStr(120 - (GetTickCount - PlayObject.m_WalkSpeedUpTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;
    SKILL_PUNGSIN{69}: begin   //Ç³½Å¼ú
      if PlayObject.m_wStatusTimeArr[STATE_WINDMOON] > 0 then begin  //Ç³½Å¼ú °­È­
        case UserMagic.btLevel of
          0 : nPower := 5;
          1 : nPower := 6;
          2 : nPower := 7;
          3 : nPower := 8;
        end;
      end else begin
        case UserMagic.btLevel of
          0 : nPower := 1;
          1 : nPower := 2;
          2 : nPower := 3;
          3 : nPower := 4;
        end;
      end;
      n14 := PlayObject.GetAttackPower(GetPower13(30) + LoWord(PlayObject.m_WAbil.DC) * 10 div 3,
             SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))div 4);

      if PlayObject.SpeedUp(nPower, n14) then boTrain:=True;
    end;



    SKILL_POISONBLADE{70}: begin     //¸Íµ¶°Ë±â
     if CheckWeapon(PlayObject) then begin
      if CheckAmulet(PlayObject,1,4,nAmuletIdx) then begin     //È¸»ö µ¶°¡·ç È®ÀÎ
       UseAmulet(PlayObject,1,1,nAmuletIdx);
       n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
       if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
         PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,nTargetX,nTargetY);
         nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                                       SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1);
        if PlayObject.MagPassThroughMagic3(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
          boTrain:=True;
       end;
      end;
     end;
    end;

   SKILL_SHADOW{71}: begin     //¿­È­½Å
    if (GetTickCount - PlayObject.m_MagMakeShadowTick > (120 - (UserMagic.btLevel * 20)) * 1000)  then begin
     if CheckWeapon(PlayObject) then begin
      if PlayObject.IsProperTarget(TargeTBaseObject) then begin
       if MagShadowAttack(PlayObject,TargeTBaseObject,nTargetX,nTargetY,UserMagic.btLevel) then begin
          if MagMakeDarkBody(PlayObject, TargeTBaseObject, UserMagic, (120 - (UserMagic.btLevel * 20))) then begin
            boTrain:=True;
            PlayObject.m_MagMakeShadowTick := GetTickCount();
            PlayObject.SysMsg('ÁÒ»ðÉíµÄÀäÈ´Ê±¼äÎª'+ IntToStr(120 - (UserMagic.btLevel * 20)) + 'Ãë¡£',c_Green,t_Hint);
          end;
       end else begin
          PlayObject.SysMsg('Äã±ØÐëÖ¸¶¨¹¥»÷Ä¿±ê¡£',C_Red,t_Hint);
       end;
      end else begin
        PlayObject.SysMsg('Äã±ØÐëÖ¸¶¨¹¥»÷Ä¿±ê¡£',C_Red,t_Hint);
      end;
     end else begin
      Result:=FALSE;
     end;
    end else
     PlayObject.SysMsg(IntToStr((120 - (UserMagic.btLevel * 20)) - (GetTickCount - PlayObject.m_MagMakeShadowTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_MOONBLADE{72}: begin
     if CheckWeapon(PlayObject) then begin    //¿ùÇÏ³­¹«
       if MagMoonBlade(Playobject,UserMagic.btLevel,UserMagic) then boTrain:=True;
     end else begin
      Result:=FALSE;
     end;
    end;


    SKILL_ABYSS{74}: begin  //½É¿¬¼ú
      if (GetTickCount - PlayObject.m_AbyssTick > 80 * 1000)  then begin
       n14 := (UserMagic.btLevel*15 + 20);
       Case UserMagic.btLevel of
        0: nPower := 6;
        1: nPower := 12;
        2: nPower := 18;
        3: nPower := 24;
       end;
       if PlayObject.MagicUp(nPower, n14 ) then
        boTrain:=True;
        PlayObject.m_AbyssTick:=GetTickCount();
        PlayObject.SysMsg('ÉîÑÓÊõµÄÀäÈ´Ê±¼äÎª80Ãë¡£',c_Green,t_Hint);
      end else
       PlayObject.SysMsg(IntToStr(80 - (GetTickCount - PlayObject.m_AbyssTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_BLOODSWORD{77} : begin //Ç÷·æ°Ë¹ý
      if (GetTickCount - PlayObject.m_BloodSword > 150 * 1000)  then begin
       n14 := (UserMagic.btLevel*20 + 60);
       nPower := 4;
       if PlayObject.BloodUp(nPower, n14 ) then
        boTrain:=True;
        PlayObject.m_BloodSword:=GetTickCount();
        PlayObject.SysMsg('ÑªÁú½£·¨µÄÀäÈ´Ê±¼äÎª150Ãë¡£',c_Green,t_Hint);
      end else
       PlayObject.SysMsg(IntToStr(150 - (GetTickCount - PlayObject.m_BloodSword) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_SKYSWORD{78} : begin //Ãµ»óºñ¼ú
      if (GetTickCount - PlayObject.m_SkyTick > 65 * 1000)  then begin
       case UserMagic.btLevel of
         0 : n14 := 10;
         1 : n14 := 20;
         2 : n14 := 30;
         3 : n14 := 40;
       end;
       nPower := 4;
       if PlayObject.SkySword(nPower, n14 ) then
        boTrain:=True;
        PlayObject.m_SkyTick:=GetTickCount();
        PlayObject.SysMsg('ÌìÉÏÃØÊõµÄÀäÈ´Ê±¼äÎª65Ãë¡£',c_Green,t_Hint);
      end else
       PlayObject.SysMsg(IntToStr(65 - (GetTickCount - PlayObject.m_SkyTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_BLOODWATER{79}: begin //Ç÷·æ¼ö
      if PlayObject.IsSlave (TargeTBaseObject) then begin
        if CheckAmulet(PlayObject,3,5,nAmuletIdx) then begin     //ºÎÀû È®ÀÎ
          UseAmulet(PlayObject,3,5,nAmuletIdx);

          nPower := (UserMagic.btLevel + 1);
          n14 := (UserMagic.btLevel*60 + 60);

          if TargeTBaseObject.BloodWaterUp(TargeTBaseObject ,nPower, n14) then boTrain:=True;
        end;
      end;
    end;

    SKILL_CATSWORD{80}: begin //¹¦¼³¶õ
     if (GetTickCount - PlayObject.m_CatSword > UserMagic.MagicInfo.dwUseDelayTime * 1000)  then begin
        if PlayObject.MagCanHitTarget (PlayObject.m_nCurrX, PlayObject.m_nCurrY, TargeTBaseObject) then begin
            if PlayObject.IsProperTarget (TargeTBaseObject) then begin
               if (TargeTBaseObject.m_nAntiMagic <= Random(50)) and (abs(TargeTBaseObject.m_nCurrX-nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY-nTargetY) <= 1) then begin
                  with PlayObject do begin
                     nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.DC),
                                       SmallInt(HiWord(m_WAbil.DC)-LoWord(m_WAbil.DC))+ 1);
                  end;
                  PlayObject.SendDelayMsg (PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2, integer(TargeTBaseObject), '', 600);

                  if PlayObject.CatSword(1,1,UserMagic.MagicInfo.dwUseDelayTime) then
                  PlayObject.m_CatSword:=GetTickCount();
                  PlayObject.SysMsg('Ã¨ÉàÀ¼µÄÀäÈ´Ê±¼äÎª' + IntToStr(UserMagic.MagicInfo.dwUseDelayTime) + 'Ãë¡£',c_Green,t_Hint);
                  // »óÅÂÀÌ»ó...µÐÈ­ÆÇÁ¤
                  if {(TargeTBaseObject.m_Abil.Level < 100) and }
                     (TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] = 0) and
                     (TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] = 0) and
                     (Random(50) > TargeTBaseObject.m_nAntiMagic) then begin    // 100->50
                     MoC := 1;
                     Gap := TargeTBaseObject.m_Abil.Level - PlayObject.m_Abil.Level;
                     if Gap > 10 then Gap := 10;
                     if Gap <-10 then Gap :=-10;
                     if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
                     if Random(15) < (18 + (UserMagic.btLevel - Gap) div Moc) then begin
                        Dur := (900 * UserMagic.btLevel + 3300) div 1000;
                        if (MoC = 1) and (Random(1) = 0) then
                        TargeTBaseObject.MakePosion(POISON_STUN, Dur, 1)
                        else
                        if (MoC = 2) and (Random(1) = 0) then
                        TargeTBaseObject.MakePosion(POISON_STONE, Dur, 1)
                     end;
                  end;
                  if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then boTrain := TRUE;
               end else
                  TargeTBaseObject := nil;
            end else
               TargeTBaseObject := nil;
         end else
            TargeTBaseObject := nil;
     end else begin
       PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_CatSword) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
     end;
    end;

    SKILL_KUMGANG{81}: begin   //±Ý°­ºÒ±«
      if (GetTickCount - PlayObject.m_KumGang > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        case UserMagic.btLevel of
          0 : nPower := 5;
          1 : nPower := 8;
          2 : nPower := 12;
          3 : nPower := 18;
        end;
        if PlayObject.MagKumGangDefenceUp(UserMagic.btLevel,nPower,UserMagic.MagicInfo.dwUseDelayTime) then begin
            PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,120,'0');
            PlayObject.m_KumGang := GetTickCount();
            boTrain:=True;
        end;
      end else begin
        PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_KumGang) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_ROESEON{82}: begin   //·Ú¼±Ç³
      if (GetTickCount - PlayObject.m_Roeseon > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        nPower := 50;
        case UserMagic.btLevel of
          0 : n14 := 40;
          1 : n14 := 60;
          2 : n14 := 80;
          3 : n14 := 100;
        end;
        PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,121,'0');
        if MagRoSeonSaceMove(PlayObject,UserMagic.btLevel,nTargetX,nTargetY,nPower,n14,UserMagic.MagicInfo.dwUseDelayTime) then begin
          PlayObject.m_Roeseon := GetTickCount();
          boTrain:=True;
        end;
      end else begin
        PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Roeseon) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_YEONGMU{84}: begin  //¿ù¿µ¹«
      if ((GetTickCount() - PlayObject.m_dwTargetFocusTick > 15 * 1000)) then begin
       if ((GetTickCount() - PlayObject.m_YeongMuTick > UserMagic.MagicInfo.dwUseDelayTime * 1000)) then begin
         PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,124,'0');
         if MagMakePrivateAssYeongMu(PlayObject,5,UserMagic.MagicInfo.dwUseDelayTime) then begin
           MagYeongMu(PlayObject, UserMagic, PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                             SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) div 2 + 5),3,PlayObject.m_nCurrX,PlayObject.m_nCurrY);
           PlayObject.m_YeongMuTick := GetTickCount();
           boTrain:=True;
         end;
        end else begin
         PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_YeongMuTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
        end;
      end else begin
        PlayObject.SysMsg(IntToStr(15 - (GetTickCount - PlayObject.m_dwTargetFocusTick) div 1000) + 'ÃëÒÔºó²Å¿ÉÒÔ¹¥»÷µÐÈË£¬ÔÂÓ°Îí×´Ì¬ÏÂ²»ÄÜ¹¥»÷µÐÈË¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_ICESHOT{86}: begin       //ºù³úÃµ
      if GetTickCount - PlayObject.m_IceShok > UserMagic.MagicInfo.dwUseDelayTime * 1000 then begin
        if IceShot(PlayObject, UserMagic, nTargetX, nTargetY, TargeTBaseObject) then
          PlayObject.m_IceShok := GetTickCount();
          boTrain := True;
      end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_IceShok) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_AUTHENTICITY{89}: begin //ÁøÀ§º¸
      if (GetTickCount - PlayObject.m_Authenitcity > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        if PlayObject.IsProperTarget (TargeTBaseObject) then begin
          if CheckTargetChange(TargeTBaseObject) then begin
          if TargeTBaseObject.m_Abil.Level < PlayObject.m_Abil.Level then begin
            MoC := 1;
            Gap := TargeTBaseObject.m_Abil.Level - PlayObject.m_Abil.Level;
            if Gap > 10 then Gap := 10;
            if Gap <-10 then Gap :=-10;
            if TargeTBaseObject.m_btRaceServer = RC_PLAYOBJECT then MoC := 2;
             if Random(25) < (15 + (UserMagic.btLevel - Gap) div Moc) then begin
               if MagTargetChangePosition(PlayObject,TargeTBaseObject,
                 TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY, PlayObject.m_nCurrX,PlayObject.m_nCurrY) then
                TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,20,'0',500);   //ÁøÀ§º¸ ÀÌÆÑÆ®
                PlayObject.m_Authenitcity := GetTickCount();
               if TargeTBaseObject.m_btRaceServer >= RC_ANIMAL then
                 boTrain:=True;
             end else TargeTBaseObject:=nil
          end else TargeTBaseObject:=nil;
          end else TargeTBaseObject:=nil;
        end else TargeTBaseObject:=nil;
      end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Authenitcity) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_MAGSPACEMOVE {90}: begin    //ÀÌÇü
     if (GetTickCount - PlayObject.m_SpaceMove > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
       if Random(11) < UserMagic.btLevel * 2 + 4 then begin
        if MagChangePosition(PlayObject,nTargetX,nTargetY) then  //ÀÌÇü
         PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,10,'0',500); //ÀÌÇü ÀÌÆÑÆ®
         PlayObject.m_SpaceMove := GetTickCount();
         boTrain:=True;
       end;
     end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_SpaceMove) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
     end;
    end;

    SKILL_STING{91}: begin //µ¶Ä§¼ú
      boSpellFail:=True;
      if CheckAmulet(PlayObject,2,5,nAmuletIdx) then begin   //µ¶°¡·ç È®ÀÎ
        StdItem:=UserEngine.GetStdItem(PlayObject.m_UseItems[nAmuletIdx].wIndex);
        if StdItem <> nil then begin
          UseAmulet(PlayObject,2,5,nAmuletIdx);
          case StdItem.Shape of
            7: begin
              if MagBigExplosion6(PlayObject,
                    UserMagic,
                    PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1),
                    nTargetX,nTargetY,1,0) then
                    boTrain:=True;
            end;
            8: begin
              if MagBigExplosion6(PlayObject,
                    UserMagic,
                    PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1),
                    nTargetX,nTargetY,1,1) then
                    boTrain:=True;
            end;
          end;
          boSpellFail:=False;
        end;
      end;
    end;

    SKILL_SUMMON{92} : begin  //°Ý°ø¼·¹°
      if (GetTickCount - PlayObject.m_Summon > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        if PlayObject.IsProperTarget (TargeTBaseObject) then begin
          if CheckTargetChange(TargeTBaseObject) then begin
            if MagMakeArrestObject(PlayObject, UserMagic, TargeTBaseObject) then begin boTrain := True;
              PlayObject.m_Summon := GetTickCount();
              TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,21,'0',300);   //ÁøÀ§º¸ ÀÌÆÑÆ®
            end else TargeTBaseObject := nil;
          end else TargeTBaseObject := nil;
        end;
      end else begin
       PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Summon) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_SUPERSWORD{93}: begin //ºù¿ù°Ý
      if (GetTickCount - PlayObject.m_SuperIce > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        if MagIceField(PlayObject,UserMagic,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1)) then
          PlayObject.m_SuperIce := GetTickCount();
        //  PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_ICECIRCLE,'0',600);   //ºù¿ù°Ý ÀÌÆÑÆ®
          boTrain:=True;
      end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_SuperIce) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_HELL{94}: begin  //¸¸Ãµ¿°¿Á
      if (GetTickCount - PlayObject.m_Allfire > 30 * 1000) then begin
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
        if MagMakeAllFire(PlayObject, nPower , GetPower(10) + (Word(GetRPow(PlayObject.m_WAbil.MC)) shr 1) , PlayObject.m_nCurrX , PlayObject.m_nCurrY) then
           PlayObject.m_Allfire := GetTickCount();
           boTrain:=True;
      end else begin
        PlayObject.SysMsg(IntToStr(30 - (GetTickCount - PlayObject.m_Allfire) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_SURAKANGRIM{97}: begin   //¼ö¶ó°­¸²
      case UserMagic.btLevel of
      0 : nPower := 4;
      1 : nPower := 6;
      2 : nPower := 8;
      3 : nPower := 10;
      end;
      n14 := PlayObject.GetAttackPower(GetPower13(30) + LoWord(PlayObject.m_WAbil.DC) * 10 div 3,
             SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))div 4);

      if PlayObject.MagSuraDefenceUp(nPower, n14) then boTrain:=True;
    end;

    SKILL_PENETRATE{98}: begin //¸ÁÀÚÀÇ´«
      if (GetTickCount - PlayObject.m_Penetrate > (25 - (UserMagic.btLevel * 5)) * 1000) then begin
        case UserMagic.btLevel of
          0 : nPower := 4;
          1 : nPower := 6;
          2 : nPower := 8;
          3 : nPower := 12;
        end;
        case UserMagic.btLevel of
          0 : n14 := 25;
          1 : n14 := 20;
          2 : n14 := 15;
          3 : n14 := 10;
        end;
        if PlayObject.MagPenetrate(nPower, n14) then begin
          PlayObject.m_Penetrate := GetTickCount();
          boTrain:=True;
        end;
      end else begin
        PlayObject.SysMsg(IntToStr( (25 - (UserMagic.btLevel * 5)) - (GetTickCount - PlayObject.m_Penetrate) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_SHADOWTICK{102}: begin   //¿µÀûÃß
      if CheckWeapon(PlayObject) then begin
       if (GetTickCount - PlayObject.m_Shadow > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
         case UserMagic.btLevel of
           0 : n14 := 100;
           1 : n14 := 80;
           2 : n14 := 60;
           3 : n14 := 40;
         end;
         if MagShadowSaceMove(PlayObject,UserMagic.btLevel,nTargetX,nTargetY,UserMagic.MagicInfo.dwUseDelayTime) then begin
           PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,137,'0',600);    //¿µÀûÃß ÀÌÆåÆ®
           PlayObject.m_Shadow := GetTickCount();
           boTrain:=True;
        end;
       end else begin
         PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Shadow) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
       end;
      end;
    end;

    SKILL_CKWIND{103}: begin  //Âü°Ý
      if MagCKWindCut ( Playobject , UserMagic.btLevel , PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1) ) then boTrain:=True;
    end;

    SKILL_EYEFIELD{104}: begin //³ú½ÅÇ÷
      if MagThenderField(PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1)) then
        boTrain:=True;
    end;

    SKILL_TIGERHIT{105}:begin //¹éÈ£°­Å¸
      if (GetTickCount - PlayObject.m_TigerHit > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
         if CheckAmulet(PlayObject,3,5,nAmuletIdx) then begin        //ºÎÀûÈ®ÀÎ
           UseAmulet(PlayObject,3,5,nAmuletIdx);

           if MagMakeTigerHitSkill(PlayObject, UserMagic.MagicInfo.dwUseDelayTime, UserMagic, nTargetX, nTargetY, TargeTBaseObject) then
             PlayObject.m_TigerHit := GetTickCount();
             boTrain := True;
         end;
      end else begin
        PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_TigerHit) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_KYO{106}:begin //±³¾Ç
      if CheckWeapon(PlayObject) then begin
       if (GetTickCount - PlayObject.m_Kyo > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
         if MagKyoField(PlayObject,UserMagic.MagicInfo.dwUseDelayTime,UserMagic,PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1)) then
           PlayObject.m_Kyo := GetTickCount();
           boTrain:=True;

       end else begin
         PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Kyo) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
       end;
      end;
    end;


    SKILL_SINGI{107}:begin //½Å±â¹¦»ê
      if (GetTickCount - PlayObject.m_Singi > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        if MagSingiField(PlayObject,UserMagic.MagicInfo.dwUseDelayTime,UserMagic,PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1)) then
          PlayObject.m_Singi := GetTickCount();
          boTrain:=True;

      end else begin
        PlayObject.SysMsg(IntToStr( UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_Singi) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_STOM{108}:begin //¿îÁß·Ú°Ý
      if (GetTickCount - PlayObject.m_AllThunder > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
        if MagMakeThunder(PlayObject, nPower , 2, UserMagic.MagicInfo.dwUseDelayTime , nTargetX, nTargetY) then
           PlayObject.m_AllThunder := GetTickCount();
           boTrain:=True;
      end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_AllThunder) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_CLOUD{109}:begin //¾Ïµ¶¸¸°è
      if (GetTickCount - PlayObject.m_CLOUD > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
        nPower:=GetPower13(30) + GetRPow(PlayObject.m_WAbil.SC);
        PlayObject.m_CLOUD := GetTickCount();
        PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 82, 0, 60, UserMagic.MagicInfo.dwUseDelayTime, '[ °µ¶¾¸¿½ç ]\ÀäÈ´Ê±¼ä: '); //¾Ïµ¶¸¸°è ÄðÅ¸ÀÓ ¹öÇÁ
        PlayObject.m_wStatusArrValue[72]:=1;
        PlayObject.m_dwStatusArrTimeOutTick[72]:=GetTickCount + UserMagic.MagicInfo.dwUseDelayTime * 1000;

        if MagBigExplosion7(PlayObject, UserMagic, nPower, nTargetX, nTargetY, 2, 0) then
          boTrain:=True;
      end else begin
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_CLOUD) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_SUNCHUNJIN{113}: begin    //¼±ÃµÁø±â
       if CheckAmulet(PlayObject, 3, 6, nAmuletIdx) then begin        //Áø½Å»ç¸® È®ÀÎ
          UseAmulet(PlayObject, 3, 6, nAmuletIdx);
          case UserMagic.btLevel of     //Áö¼Ó½Ã°£
           0 : n14 := 30;
           1 : n14 := 40;
           2 : n14 := 50;
           3 : n14 := 60;
          end;
          n18 := 105;

          nPower := PlayObject.GetAttackPower(GetPower13(30) + LoWord(PlayObject.m_WAbil.SC) * 10 div 3,     //Ã¼·Â»ó½Â
             SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))div 4);
          if PlayObject.m_wStatusTimeArr[STATE_WINDMOON] > 0 then
            nPower := Round(nPower * 1.3);
          if PlayObject.SunChunJingiHPUP(nPower, n14, n18) then boTrain:=True;
       end;
    end;

    SKILL_SONICWAVE{115}: begin //¹ý·û¿¬°ø - ½Â·Á
       if CheckAmulet(PlayObject, 2, 6, nAmuletIdx) then begin        //Áø½Å»ç¸® È®ÀÎ
         UseAmulet(PlayObject, 2, 6, nAmuletIdx);
         n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
         nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
                                                   SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC)) * 1);
         if PlayObject.DoSonicWave(n1C, UserMagic.btLevel, nPower) then boTrain:=True;
       end;
    end;
    SKILL_PROTECTSHIELD{118}: begin   //È£½Å°­±â
      if CheckAmulet(PlayObject, 2, 6, nAmuletIdx) then begin        //Áø½Å»ç¸® È®ÀÎ
         UseAmulet(PlayObject, 2, 6, nAmuletIdx);
         if PlayObject.MagProtectDefenceUp(UserMagic.btLevel,GetPower(GetRPow(PlayObject.m_WAbil.SC) + 30)) then
           boTrain:=True;
      end;
    end;

    SKILL_SUPERSHAOLIN{120}: begin //°í·Á¹«ÁøºÀ
      if MagBKWindCut ( Playobject , UserMagic.btLevel ,
          PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
          SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1) ) then
      boTrain:=True;
    end;

    SKILL_GREATWALL{121}: begin     //ÀºÇü¼ú
        if (GetTickCount - PlayObject.m_MagGreatWallTick > UserMagic.MagicInfo.dwUseDelayTime * 1000)  then begin
          if MagMakeBonzeBody(PlayObject, UserMagic, UserMagic.MagicInfo.dwUseDelayTime) then begin
            boTrain:=True;
            PlayObject.m_MagGreatWallTick := GetTickCount();
            PlayObject.SysMsg('ò×Ó°ÊõµÄÀäÈ´Ê±¼äÎª' + IntToStr(UserMagic.MagicInfo.dwUseDelayTime) + 'Ãë¡£',c_Green,t_Hint);
          end;
        end else
          PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_MagGreatWallTick) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;
    SKILL_THUNDERWAVE{122}: begin    //º¹È£Àå- Àü»ç
        case UserMagic.btLevel of     //Áö¼Ó½Ã°£
           0 : n14 := 35;
           1 : n14 := 30;
           2 : n14 := 25;
           3 : n14 := 20;
        end;
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
              SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) * 1);
        if PlayObject.ThunderWave(nPower, n14 ) then begin
          boTrain:=True;
        end;
    end;

    SKILL_THUNDERCLAP {123}: begin    //°Ý°øÀå - ¼ú»ç
         if (GetTickCount - PlayObject.m_ThunderClap > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
           if MagThunderClap(PlayObject, UserMagic,
               PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
               SmallInt(HiWord(PlayObject.m_WAbil.MC) - LoWord(PlayObject.m_WAbil.MC)) + 1), nTargetX, nTargetY, 3, UserMagic.MagicInfo.dwUseDelayTime, boMove) then begin
             PlayObject.m_ThunderClap:=GetTickCount();
             PlayObject.SysMsg('»÷¿Õ¹÷·¨µÄÀäÈ´Ê±¼äÎª' + IntToStr(UserMagic.MagicInfo.dwUseDelayTime) + 'Ãë¡£',c_Green,t_Hint);
             boTrain:=True;
           end;
         end else
           PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_ThunderClap) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_THUSHAOLIN{125}: begin //Á÷µµÈ²·æºÀ
      if MagBCKWindCut ( Playobject , UserMagic.btLevel ,
          PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
          SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1) ) then
      boTrain:=True;
    end;

    SKILL_JUCKSAL{126}: begin //ÃµÀÎÀû»ìÇ³ - µµ»ç
        if (GetTickCount - PlayObject.m_JuckSalDel > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
          if MagJuckSal(PlayObject,UserMagic,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),SmallInt(HiWord(PlayObject.m_WAbil.SC)-LoWord(PlayObject.m_WAbil.SC))+ 1)) then
            PlayObject.m_JuckSalDel := GetTickCount();
            PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_JUCJSAL,'0',600);   //ºù¿ù°Ý ÀÌÆÑÆ®
            boTrain:=True;
        end else begin
          PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_JuckSalDel) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
        end;
    end;
    SKILL_BEGUEKJANG{127}: begin //ºñ°ÝÀå
      if CheckAmulet(PlayObject, 3, 6, nAmuletIdx) then begin        //Áø½Å»ç¸® È®ÀÎ
        nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.SC),
          SmallInt(HiWord(PlayObject.m_WAbil.SC) - LoWord(PlayObject.m_WAbil.SC)) + 1);
        if MagMakeFireCharmEx(PlayObject, UserMagic, nTargetX, nTargetY, nPower, TargeTBaseObject) then begin
          UseAmulet(PlayObject, 3, 6, nAmuletIdx);
          boTrain:=True;
        end;
      end;
    end;
    SKILL_FAHWANGBO {128}: begin    //ÆÄÈ²º¸
      if (GetTickCount - PlayObject.m_Fahangbo > 10 * 1000) then begin
        if MagChangeback(PlayObject) then begin  //ÀÌÇü
          case UserMagic.btLevel of     //Áö¼Ó½Ã°£
           0 : n14 := 1;
           1 : n14 := 2;
           2 : n14 := 3;
           3 : n14 := 4;
          end;
          Inc(PlayObject.nFahangboCount);
          PlayObject.SendDelayRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_FAHANGBO,'0',600);   //ºù¿ù°Ý ÀÌÆÑÆ®
          if PlayObject.nFahangboCount >= n14 then begin
            PlayObject.nFahangboCount := 0;
            PlayObject.m_Fahangbo := GetTickCount();
          end;
          boTrain:=True;
        end;
      end else begin
         PlayObject.SysMsg(IntToStr(10 - (GetTickCount - PlayObject.m_Fahangbo) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_KANGHO{129}: begin     //°­È£¼ú
      if CheckAmulet(PlayObject, 3, 6, nAmuletIdx) then begin        //Áø½Å»ç¸® È®ÀÎ
        if (GetTickCount - PlayObject.m_MagKangHo > 30 * 1000) then begin
          if PlayObject.IsProperTarget(TargeTBaseObject) then begin
            if MagShadowAttack(PlayObject,TargeTBaseObject,nTargetX,nTargetY,UserMagic.btLevel) then begin
               if MagMakeBonzeMob(PlayObject, TargeTBaseObject, UserMagic, 30) then begin
                 boTrain:=True;
                 PlayObject.m_MagKangHo := GetTickCount();
                 UseAmulet(PlayObject, 3, 6, nAmuletIdx);
                 PlayObject.SysMsg('Ç¿»¤ÊõµÄÀäÈ´Ê±¼äÎª30Ãë¡£',c_Green,t_Hint);
               end;
            end else begin
             PlayObject.SysMsg('Äã±ØÐëÖ¸¶¨Ä¿±ê¡£',C_Red,t_Hint);
            end;
          end else begin
            PlayObject.SysMsg('Äã±ØÐëÖ¸¶¨Ä¿±ê¡£',C_Red,t_Hint);
          end;
        end else
          PlayObject.SysMsg(IntToStr(30 - (GetTickCount - PlayObject.m_MagKangHo) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
      end;
    end;

    SKILL_UPREDBANWOL{130}: begin    //¸¶Ç÷±¤¼¶
      if (GetTickCount - PlayObject.m_130Time > UserMagic.MagicInfo.dwUseDelayTime * 1000) then begin
         n1C:=GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,nTargetX,nTargetY);
         if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,n14,n18) then begin
           PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,1,nTargetX,nTargetY);
           nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1);

           if PlayObject.MagMaPassIlSum(n14,n18,nTargetX,nTargetY,n1C,nPower,True) > 0 then
             boTrain:=True;
           PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_MAILSUM,IntToStr(PlayObject.m_btDirection));
           PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,n1C,2,nTargetX,nTargetY);
           if MagMaChangePosition(PlayObject, nTargetX, nTargetY, PlayObject.m_nCurrX, PlayObject.m_nCurrY) then  //¸¶Ç÷±¤¼¶
           PlayObject.SendDelayRefMsg(RM_10205, 0, nTargetX, nTargetY, NE_MAILSUM, IntToStr(directionDir(PlayObject.m_btDirection)), 600);   //¸¶Ç÷±¤¼¶ ÀÌÆÑÆ®
           PlayObject.m_130Time := GetTickCount();
         end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime - (GetTickCount - PlayObject.m_130Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_HWECHUN{132}: begin  //È¸Ãµ°Ý - Àü»ç
      if (GetTickCount - PlayObject.m_132Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                         SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) div 2 + 1);
        if MagBigHweChun(PlayObject, UserMagic, nPower, PlayObject.m_nCurrX, PlayObject.m_nCurrY, 2) then begin
          boTrain := True;
          PlayObject.m_132Time := GetTickCount();
          PlayObject.SendDelayRefMsg(RM_10205,0, PlayObject.m_nCurrX, PlayObject.m_nCurrY, NE_HWECHUN_2, '0', 200);
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_132Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_FIREDRAGON{133}: begin //È­·æÁøÇ³
      if (GetTickCount - PlayObject.m_133Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        nPower:= PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                                      SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1);
        if MagDragonPushArround(PlayObject,nPower,UserMagic.btLevel) > 0 then begin
          boTrain:=True;
          PlayObject.m_133Time := GetTickCount();
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_133Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_CHUNSANG{134}: begin //Ãµ»óÆø¿°
      if (GetTickCount - PlayObject.m_134Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),
                             SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC)) div 2 + 1);
        if MagBigExplosion4(PlayObject, UserMagic, nPower, nTargetX,nTargetY, 2) then begin
          if MagMeteor(PlayObject, UserMagic, nPower,18,nTargetX,nTargetY) then begin
            boTrain:=True;
            PlayObject.m_134Time := GetTickCount();
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,49,'0',2500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,77,'0',1500);
            PlayObject.SendDelayRefMsg(RM_10205,0,nTargetX,nTargetY,77,'0',2700);
          end;
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_134Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_THUNDERDOWN{135}: begin   //³«Ãµ·Ú
      if (GetTickCount - PlayObject.m_135Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        if MagThenderDownExplosion(PlayObject,
                         PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.MC),SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC))+ 1),
                         nTargetX,
                         nTargetY,
                         2) then begin
          boTrain:=True;
          PlayObject.m_135Time := GetTickCount();
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_135Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_SUNCHUN{137}: begin //¼±Ãµ
      if (GetTickCount - PlayObject.m_137Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        nPower := Round(HiWord(PlayObject.m_WAbil.SC) * (0.04 + (0.01 * UserMagic.btLevel))) - 2;
        with PlayObject do begin
          n14 := GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(m_WAbil.SC),
                                                   SmallInt(HiWord(m_WAbil.SC)-LoWord(m_WAbil.SC)));
        end;
        if CheckAmulet(PlayObject,1,5,nAmuletIdx) then begin      //ºÎÀûÈ®ÀÎ
          if MagSunchun(PlayObject, UserMagic, nPower, GetPower(GetRPow(PlayObject.m_WAbil.SC) + 15), n14, nTargetX, nTargetY, 3) then begin
            PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 114, 0, 104, UserMagic.MagicInfo.dwUseDelayTime, '[ Óð»¯µÇÏÉ ]\ÀäÈ´Ê±¼ä: ' );  //¼±Ãµ ÄðÅ¸ÀÓ ¹öÇÁ
            UseAmulet(PlayObject,1,5,nAmuletIdx);
            boTrain:=True;
            PlayObject.m_137Time := GetTickCount();
          end;
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_137Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_DARKDRAGON{139}: begin //¿ë¼ÚÀ½
      if (GetTickCount - PlayObject.m_139Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        PlayObject.SendRefMsg(RM_10205,0,PlayObject.m_nCurrX,PlayObject.m_nCurrY,NE_DRAGON_1,'0');
        nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                             SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) div 2 + 5);

        if MagDragon(PlayObject, UserMagic, nPower, 35, PlayObject.m_nCurrX, PlayObject.m_nCurrY) then begin
          boTrain:=True;
          PlayObject.m_139Time := GetTickCount();
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_139Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_SURA {140}: begin //¼ö¶óÃµ¸êÁø
      if (GetTickCount - PlayObject.m_140Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        if MagSuraField(PlayObject,PlayObject.GetAttackPower (GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
           SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC))+ 1)) then begin
          boTrain:=True;
          PlayObject.m_140Time := GetTickCount();
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_140Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

    SKILL_NANMU{141}: begin //¸¶Ç÷³­¹«
      if (GetTickCount - PlayObject.m_141Time > UserMagic.MagicInfo.dwUseDelayTime  * 1000) then begin
        nPower := PlayObject.GetAttackPower(GetPower(MPow(UserMagic)) + LoWord(PlayObject.m_WAbil.DC),
                             SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) div 2 + 5);
        case UserMagic.btLevel of
          0 : n14 := 40;
          1 : n14 := 60;
          2 : n14 := 80;
          3 : n14 := 100;
        end;
        if MagMahul(PlayObject, UserMagic, nPower, n14, nTargetX, nTargetY) then begin
          boTrain:=True;
          PlayObject.m_141Time := GetTickCount();
        end;
      end else
        PlayObject.SysMsg(IntToStr(UserMagic.MagicInfo.dwUseDelayTime  - (GetTickCount - PlayObject.m_141Time) div 1000) + 'ÃëÒÔºó¿ÉÒÔÔÙ´ÎÊ¹ÓÃ¡£',c_Green,t_Hint);
    end;

  end;
  if boSpellFail then exit;
  if boSpellFire then begin
    PlayObject.SendRefMsg(RM_MAGICFIRE,0,
                        MakeWord(UserMagic.MagicInfo.btEffectType,UserMagic.MagicInfo.btEffect),
                        MakeLong(nTargetX,nTargetY),
                        Integer(TargeTBaseObject),
                        '');
  end;
  if (UserMagic.btLevel < 3) and (boTrain) then begin
    if UserMagic.MagicInfo.TrainLevel[UserMagic.btLevel] <= PlayObject.m_Abil.Level then begin
      PlayObject.TrainSkill(UserMagic,Random(3) + 1);
      if not PlayObject.CheckMagicLevelup(UserMagic) then begin
        PlayObject.SendDelayMsg(PlayObject,RM_MAGIC_LVEXP,0,UserMagic.MagicInfo.wMagicId,UserMagic.btLevel,UserMagic.nTranPoint,'',1000);
      end;
    end;
  end;
  if (UserMagic.MagicInfo.wMagicId = SKILL_THUNDERCLAP) and boMove then begin
    PlayObject.SendRefMsg(RM_MAGICMOVE, PlayObject.m_btDirection, PlayObject.m_nCurrX, PlayObject.m_nCurrY, 0, '');
  end;
  Result:=True;
end;

function TMagicManager.MagMakePrivateTransparent(BaseObject: TBaseObject; nHTime: Integer):Boolean; //004930E8
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result:=False;
  if BaseObject.m_wStatusTimeArr[STATE_TRANSPARENT] > 0 then exit;   //4930FE
  BaseObjectList:=TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,9,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) and (TargeTBaseObject.m_TargetCret = BaseObject) then begin
      if (abs(TargeTBaseObject.m_nCurrX - BaseObject.m_nCurrX) > 1) or
         (abs(TargeTBaseObject.m_nCurrY - BaseObject.m_nCurrY) > 1) or
         (Random(2) = 0) then begin
        TargeTBaseObject.m_TargetCret:=nil;
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
  BaseObject.m_wStatusTimeArr[STATE_TRANSPARENT]:=nHTime;
  BaseObject.m_dwStatusArrTick[STATE_TRANSPARENT]:=GetTickCount();
  BaseObject.m_nCharStatus:=BaseObject.GetCharStatus();
  BaseObject.StatusChanged();
  BaseObject.m_boHideMode:=True;
  BaseObject.m_boTransparent:=True;
  Result:=True;
end;

function TMagicManager.MagMakePrivateAssTransparent(BaseObject: TBaseObject; nHTime: Integer):Boolean; //004930E8   //¿ù¿µ¼ú
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  UserMagic        :pTUserMagic;
begin
  Result:=False;

  if BaseObject.m_wStatusTimeArr[STATE_YEONGMU] > 0 then  //¿ù¿µ¹« °ø°Ý½Ã.. Ç®¸²
    BaseObject.m_wStatusTimeArr[STATE_YEONGMU]:=1;

  if BaseObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT] > 0 then exit;   //4930FE
  BaseObjectList:=TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,9,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) and (TargeTBaseObject.m_TargetCret = BaseObject) then begin
      if (abs(TargeTBaseObject.m_nCurrX - BaseObject.m_nCurrX) > 1) or
         (abs(TargeTBaseObject.m_nCurrY - BaseObject.m_nCurrY) > 1) or
         (Random(1) = 0) then begin
        TargeTBaseObject.m_TargetCret:=nil;
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
  BaseObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT]:=nHTime;
  BaseObject.m_dwStatusArrTick[STATE_ASSTRANSPARENT]:=GetTickCount();
  BaseObject.m_nCharStatus:=BaseObject.GetCharStatus();
  BaseObject.StatusChanged();
  BaseObject.m_boHideMode:=True;
  Result:=True;
  BaseObject.SysMsg(format(g_sMoonTime,[nHTime]),c_Green,t_Hint);
  BaseObject.SendMsg (BaseObject, RM_BUFF, 26, 0, 24, nHTime, '[ ÔÂÓ°Êõ ]\³ÖÐøÊ±¼ä: '); //¿ù¿µ¼ú ¹öÇÁ
end;


function TMagicManager.MagMakePrivateAssYeongMu(BaseObject: TBaseObject; nHTime, nDelay: Integer):Boolean;  //¿ù¿µ¹«
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  UserMagic        :pTUserMagic;
begin
  Result:=False;
  if BaseObject.m_wStatusTimeArr[STATE_YEONGMU] > 0 then exit;
  BaseObjectList:=TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,9,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) and (TargeTBaseObject.m_TargetCret = BaseObject) then begin
       TargeTBaseObject.m_TargetCret:=nil;
    end;
  end;
  FreeAndNil(BaseObjectList);
  BaseObject.m_wStatusTimeArr[STATE_YEONGMU]:=nHTime;
  BaseObject.m_dwStatusArrTick[STATE_YEONGMU]:=GetTickCount();
  BaseObject.m_nCharStatus:=BaseObject.GetCharStatus();
  BaseObject.StatusChanged();
  BaseObject.m_boYeongMu:=True;
  BaseObject.m_wStatusArrValue[66] := nDelay;
  BaseObject.m_dwStatusArrTimeOutTick[66]:=GetTickCount + nDelay * 1000;
  Result:=True;
  BaseObject.SysMsg(format(g_sYeongMuTime,[nHTime]),c_Green,t_Hint);
  BaseObject.SendMsg (BaseObject, RM_BUFF, 75, 0, 57, nHTime, '[ ÔÂÓ°Îí ]\³ÖÐøÊ±¼ä : '); //¿ù¿µ¹« ¹öÇÁ
  BaseObject.SendMsg (BaseObject, RM_COOLBUFF, 76, 0, 58, nDelay, '[ ÔÂÓ°Îí ]\ÀäÈ´Ê±¼ä: '); //¿ù¿µ¹« ÄðÅ¸ÀÓ ¹öÇÁ
end;


function TMagicManager.MagTamming(BaseObject, TargeTBaseObject: TBaseObject;
  nTargetX, nTargetY, nMagicLevel: Integer): Boolean; //00492368
var
  n14:Integer;
begin
  Result:=False;
  if (TargeTBaseObject.m_btRaceServer = RC_CLONE) then exit;

  if (TargeTBaseObject.m_btRaceServer <> RC_PLAYOBJECT) and ((Random(4 - nMagicLevel) = 0)) then begin
    TargeTBaseObject.m_TargetCret:=nil;
    if TargeTBaseObject.m_Master = BaseObject then begin
      TargeTBaseObject.OpenHolySeizeMode((nMagicLevel * 5 + 10) * 1000);
      Result:=True;
    end else begin
      if Random(2) = 0 then begin
        if TargeTBaseObject.m_Abil.Level <= BaseObject.m_Abil.Level + 2 then begin
          if Random(3) = 0 then begin
            if Random((BaseObject.m_Abil.Level + 20) + (nMagicLevel * 5)) > (TargeTBaseObject.m_Abil.Level + g_Config.nMagTammingTargetLevel{10}) then begin
              if not(TargeTBaseObject.m_boNoTame) and
                 (TargeTBaseObject.m_btLifeAttrib <> LA_UNDEAD) and
                 (TargeTBaseObject.m_Abil.Level < g_Config.nMagTammingLevel{70}) and
                 (BaseObject.m_SlaveList.Count < g_Config.nMagTammingCount{(nMagicLevel + 2)}) then begin
                n14:=TargeTBaseObject.m_WAbil.MaxHP div g_Config.nMagTammingHPRate{100};
                if n14 <= 2 then n14:=2
                else Inc(n14,n14);
                if (TargeTBaseObject.m_Master <> BaseObject) and (Random(n14) = 0) then begin
                  TargeTBaseObject.BreakCrazyMode();
                  if TargeTBaseObject.m_Master <> nil then begin
                    TargeTBaseObject.m_WAbil.HP:=TargeTBaseObject.m_WAbil.HP div 10;
                  end;
                  TargeTBaseObject.m_Master:=BaseObject;
                  TargeTBaseObject.m_dwMasterRoyaltyTick:=LongWord((Random(BaseObject.m_Abil.Level * 2) + (nMagicLevel shl 2) * 5 + 20) * 60 * 1000) + GetTickCount;
                  TargeTBaseObject.m_btSlaveMakeLevel:=nMagicLevel;
                  if TargeTBaseObject.m_dwMasterTick = 0 then TargeTBaseObject.m_dwMasterTick:=GetTickCount();
                  TargeTBaseObject.BreakHolySeizeMode();
                  if LongWord(1500 - nMagicLevel * 200) < LongWord(TargeTBaseObject.m_nWalkSpeed) then begin
                    TargeTBaseObject.m_nWalkSpeed:=1500 - nMagicLevel * 200;
                  end;
                  if LongWord(2000 - nMagicLevel * 200) < LongWord(TargeTBaseObject.m_nNextHitTime) then begin
                    TargeTBaseObject.m_nNextHitTime:=2000 - nMagicLevel * 200;
                  end;
                  TargeTBaseObject.RefShowName();
                  BaseObject.m_SlaveList.Add(TargeTBaseObject);
                end else begin //004925F2
                  if Random(14) = 0 then TargeTBaseObject.m_WAbil.HP:=0;
                end;                  
              end else begin //00492615
                if (TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD) and (Random(20) = 0) then
                  TargeTBaseObject.m_WAbil.HP:=0;
              end;
            end else begin //00492641
              if not (TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD) and (Random(20) = 0) then
                TargeTBaseObject.OpenCrazyMode(Random(20) + 10);
            end;
          end else begin //00492674
            if not (TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD) then
              TargeTBaseObject.OpenCrazyMode(Random(20) + 10); //±äºì
          end;
        end; //004926B0          
      end else begin //00492699
        TargeTBaseObject.OpenHolySeizeMode((nMagicLevel * 5 + 10) * 1000);
      end;
      Result:=True;
    end;
  end else begin
    if Random(2) = 0 then Result:=True;
  end;
end;

function TMagicManager.MagTurnUndead(BaseObject, TargeTBaseObject: TBaseObject;
  nTargetX, nTargetY, nLevel: Integer): Boolean; //004926D4
var
  n14:Integer;
begin
  Result:=False;
  if TargeTBaseObject.m_boSuperMan or not (TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD) then exit;
  TAnimalObject(TargeTBaseObject).Struck(BaseObject);
  if TargeTBaseObject.m_TargetCret = nil then begin
    TAnimalObject(TargeTBaseObject).m_boRunAwayMode:=True;
    TAnimalObject(TargeTBaseObject).m_dwRunAwayStart:=GetTickCount();
    TAnimalObject(TargeTBaseObject).m_dwRunAwayTime:=10 * 1000;
  end;
  BaseObject.SetTargetCreat(TargeTBaseObject);
  if (Random(2) + (BaseObject.m_Abil.Level - 1)) > TargeTBaseObject.m_Abil.Level then begin    //·¹º§ ³ôÀ¸¸é ·£´ý2
    if TargeTBaseObject.m_Abil.Level < g_Config.nMagTurnUndeadLevel then begin
      n14:=BaseObject.m_Abil.Level - TargeTBaseObject.m_Abil.Level;
      if Random(100) < ((nLevel shl 3) - nLevel + 15 + n14) then begin
        TargeTBaseObject.SetLastHiter(BaseObject);                           //»çÀÚÀ±È¸   ·£´ý 100
        TargeTBaseObject.m_WAbil.HP:=0;
        Result:=True;
      end
    end;
  end; //004927CB
end;

function TMagicManager.MagWindTebo(PlayObject: TPlayObject;
  UserMagic: pTUserMagic): Boolean;
var
  PoseBaseObject:TBaseObject;
begin
  Result:=False;
  PoseBaseObject:=PlayObject.GetPoseCreate;
  if (PoseBaseObject <> nil) and
     (PoseBaseObject <> PlayObject) and
     (not PoseBaseObject.m_boDeath) and
     (not PoseBaseObject.m_boGhost) and
     (PlayObject.IsProperTarget(PoseBaseObject)) and
     (not PoseBaseObject.m_boStickMode) then begin
    if (abs(PlayObject.m_nCurrX - PoseBaseObject.m_nCurrX) <= 1) and
       (abs(PlayObject.m_nCurrY - PoseBaseObject.m_nCurrY) <= 1) and
       (PlayObject.m_Abil.Level > PoseBaseObject.m_Abil.Level) then begin
      if Random(20) < UserMagic.btLevel * 6 + 6 + (PlayObject.m_Abil.Level - PoseBaseObject.m_Abil.Level) then begin
        PoseBaseObject.CharPushed(GetNextDirection(PlayObject.m_nCurrX,PlayObject.m_nCurrY,PoseBaseObject.m_nCurrX,PoseBaseObject.m_nCurrY),_MAX(0,UserMagic.btLevel -1) + 1);
        Result:=True;
      end;
    end;
  end;
end;

function  TMagicManager.MagWindCut (PlayObject: TPlayObject; skilllevel: integer): Boolean;    //°øÆÄ¼¶
var
   i    : integer;
   rlist: TList;
   cret : TBaseObject;
   pwr  : integer;
   isnear : boolean;
   xx,yy : integer;
   f1x,f1y,f2x,f2y : integer;
   CriticalDamage: Boolean;
   DcRandom: integer;
begin
   Result := FALSE;
   pwr := 0;
   isnear := FALSE;
   rlist := TList.Create;

   // ¹üÀ§ÀÇ ÁÜ½ÉÀÌ µÇ´Â ÁÂÇ¥ º¯°æ
   xx := PlayObject.m_nCurrX;
   yy := PlayObject.m_nCurrY;
   f1x := xx;
   f1y := yy;
   f2x := xx;
   f2y := yy;

   case PlayObject.m_btDirection of
   0 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx;
            f1y := yy - 1;
            f2x := xx;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy - 2;
            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   1 :  begin

            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy - 1;
            f2x := xx + 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   2 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy ;
            f2x := xx + 2;
            f2y := yy;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx  := xx + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   3 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy + 1;
            f2x := xx + 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   4 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx ;
            f1y := yy + 1;
            f2x := xx ;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   5 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy + 1;
            f2x := xx - 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   6 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy ;
            f2x := xx - 2;
            f2y := yy ;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   7 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy - 1;
            f2x := xx - 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   end;

   //Àåºñ Çà¿îÄ¡·Î Å©¸®Æ¼ÄÃ È®·ü °áÁ¤
   CriticalDamage := FALSE;
   if Random(100) <= (1 + PlayObject.m_UseItems[U_WEAPON].btValue[3] - PlayObject.m_UseItems[U_WEAPON].btValue[4]) then
      CriticalDamage := TRUE;

   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then
      begin

         // Å¸°ÝÀÌ °­ÇÏ°Ô µé¾î°¡¾ßµÉ ³Ñ°ú ¾àÇÏ°Ô µé¾î°¡¾ßµÉ ³Ñ ÆÇ´Ü.
         if ( (cret.m_nCurrX = f1x) and (cret.m_nCurrY = f1y) ) or ( (cret.m_nCurrX = f2x) and (cret.m_nCurrY = f2y) ) then begin
            isnear := true;
         end else begin
            isnear := false;
         end;

         //Å©¸®Æ¼ÄÃ µ¥¹ÌÁö
         if CriticalDamage then begin
            DcRandom := HiWord(PlayObject.m_WAbil.DC);
         end else begin
            DcRandom := LoWord(PlayObject.m_WAbil.DC) + Random( HiWord(PlayObject.m_WAbil.DC) );
         end;

         //Àü¹æ 1*2ÀÇ ¹üÀ§:
         //((1.2+0.3*(Lv_S+(LV/20)) * Random(Dcmax)/3+DC
         //±× ¿Ü ¹üÀ§: ((0.8+0.2*(Lv_S+LV/20)) * Random(Dcmax)/3+DC
         //Å¸°ÝÄ¡°¡ ´Ù¸¥°Ô Àû¿ëµÊ
         if isnear then begin
            pwr := ( (12 + 3 * ( SkillLevel + PlayObject.m_Abil.Level div 20 )) ) * DcRandom div 30 + LoWord(PlayObject.m_WAbil.DC);
         end else begin
            pwr := ( (8 + 2 * ( SkillLevel + PlayObject.m_Abil.Level div 20 )) ) * DcRandom div 30 + LoWord(PlayObject.m_WAbil.DC);
         end;

         //Å©¸®Æ¼ÄÃ µ¥¹ÌÁö
         if CriticalDamage then begin
            pwr := pwr * 2;
         end;

         if pwr > 0 then begin
            windcuthit( PlayObject, cret, pwr, 0 );
            Result := TRUE;
         end;
      end;
   end;
   FreeAndNil(rlist);
end;


function  TMagicManager.MagCKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;    //Âü°Ý
var
   i    : integer;
   rlist: TList;
   cret : TBaseObject;
   pwr  : integer;
   isnear : boolean;
   xx,yy : integer;
   f1x,f1y,f2x,f2y : integer;
   CriticalDamage: Boolean;
   DcRandom: integer;
begin
   Result := FALSE;
   pwr := 0;
   isnear := FALSE;
   rlist := TList.Create;

   // ¹üÀ§ÀÇ ÁÜ½ÉÀÌ µÇ´Â ÁÂÇ¥ º¯°æ
   xx := PlayObject.m_nCurrX;
   yy := PlayObject.m_nCurrY;
   f1x := xx;
   f1y := yy;
   f2x := xx;
   f2y := yy;

   case PlayObject.m_btDirection of
   0 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx;
            f1y := yy - 1;
            f2x := xx;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy - 2;
            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   1 :  begin

            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy - 1;
            f2x := xx + 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   2 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy ;
            f2x := xx + 2;
            f2y := yy;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx  := xx + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   3 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy + 1;
            f2x := xx + 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   4 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx ;
            f1y := yy + 1;
            f2x := xx ;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   5 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy + 1;
            f2x := xx - 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   6 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy ;
            f2x := xx - 2;
            f2y := yy ;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   7 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy - 1;
            f2x := xx - 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   end;

   //Àåºñ Çà¿îÄ¡·Î Å©¸®Æ¼ÄÃ È®·ü °áÁ¤
   CriticalDamage := FALSE;
   if Random(100) <= (1 + PlayObject.m_UseItems[U_WEAPON].btValue[3] - PlayObject.m_UseItems[U_WEAPON].btValue[4]) then
      CriticalDamage := TRUE;

   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then
      begin

      pwr := nPower;
         //Å©¸®Æ¼ÄÃ µ¥¹ÌÁö
         if CriticalDamage then begin
            pwr := nPower * 2;
         end;

         if pwr > 0 then begin
            windcuthit( PlayObject, cret, pwr, 0 );
            Result := TRUE;
         end;
      end;
   end;
   FreeAndNil(rlist);

end;


function  TMagicManager.MagBKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;    //°í·Á¹«ÁøºÀ
var
   i    : integer;
   rlist: TList;
   cret : TBaseObject;
   pwr  : integer;
   isnear : boolean;
   xx,yy : integer;
   f1x,f1y,f2x,f2y : integer;
   CriticalDamage: Boolean;
   DcRandom: integer;
begin
   Result := FALSE;
   pwr := 0;
   isnear := FALSE;
   rlist := TList.Create;

   // ¹üÀ§ÀÇ ÁÜ½ÉÀÌ µÇ´Â ÁÂÇ¥ º¯°æ
   xx := PlayObject.m_nCurrX;
   yy := PlayObject.m_nCurrY;
   f1x := xx;
   f1y := yy;
   f2x := xx;
   f2y := yy;

   case PlayObject.m_btDirection of
   0 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx;
            f1y := yy - 1;
            f2x := xx;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy - 3;
            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   1 :  begin

            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy - 1;
            f2x := xx + 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 3;
            yy := yy - 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   2 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy ;
            f2x := xx + 2;
            f2y := yy;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx  := xx + 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   3 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy + 1;
            f2x := xx + 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 3;
            yy := yy + 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   4 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx ;
            f1y := yy + 1;
            f2x := xx ;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy + 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   5 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy + 1;
            f2x := xx - 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;
            yy := yy + 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   6 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy ;
            f2x := xx - 2;
            f2y := yy ;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   7 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy - 1;
            f2x := xx - 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;
            yy := yy - 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   end;

   //Àåºñ Çà¿îÄ¡·Î Å©¸®Æ¼ÄÃ È®·ü °áÁ¤
   CriticalDamage := FALSE;
   if Random(100) <= (1 + PlayObject.m_UseItems[U_WEAPON].btValue[3] - PlayObject.m_UseItems[U_WEAPON].btValue[4]) then
      CriticalDamage := TRUE;

   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then
      begin

      pwr := nPower;
         //Å©¸®Æ¼ÄÃ µ¥¹ÌÁö
         if CriticalDamage then begin
            pwr := nPower * 2;
         end;
         if PlayObject.m_wStatusTimeArr[STATE_WINDMOON] > 0 then
           pwr := Round(pwr * 1.3);

         if pwr > 0 then begin
            windcuthit( PlayObject, cret, pwr, 0 );
            Result := TRUE;
         end;
      end;
   end;
   FreeAndNil(rlist);

end;




function  TMagicManager.MagBCKWindCut (PlayObject: TPlayObject; skilllevel, nPower: integer): Boolean;    //Á÷µµÈ²·æºÀ
var
   i    : integer;
   rlist: TList;
   cret : TBaseObject;
   pwr  : integer;
   isnear : boolean;
   xx,yy : integer;
   f1x,f1y,f2x,f2y : integer;
   DcRandom: integer;
begin
   Result := FALSE;
   pwr := 0;
   isnear := FALSE;
   rlist := TList.Create;

   // ¹üÀ§ÀÇ ÁÜ½ÉÀÌ µÇ´Â ÁÂÇ¥ º¯°æ
   xx := PlayObject.m_nCurrX;
   yy := PlayObject.m_nCurrY;
   f1x := xx;
   f1y := yy;
   f2x := xx;
   f2y := yy;

   case PlayObject.m_btDirection of
   0 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx;
            f1y := yy - 1;
            f2x := xx;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy - 3;
            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   1 :  begin

            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy - 1;
            f2x := xx + 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 3;
            yy := yy - 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   2 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy ;
            f2x := xx + 2;
            f2y := yy;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx  := xx + 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   3 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy + 1;
            f2x := xx + 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 3;
            yy := yy + 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   4 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx ;
            f1y := yy + 1;
            f2x := xx ;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy + 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   5 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy + 1;
            f2x := xx - 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;
            yy := yy + 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   6 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy ;
            f2x := xx - 2;
            f2y := yy ;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, rlist);
        end;
   7 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy - 1;
            f2x := xx - 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 3;
            yy := yy - 3;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 2, PlayObject.m_btDirection, rlist);
        end;
   end;

   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then
      begin
        if (Random(20) <= 3) and (Random(cret.m_btAntiPoison) = 0) then begin
          cret.MakePosion(POISON_SLOWDOWN, 10, 0);
        end;
        pwr := nPower;
        if pwr > 0 then begin
          windcuthit( PlayObject, cret, pwr, 0 );
          Result := TRUE;
        end;
      end;
   end;
   FreeAndNil(rlist);

end;


function  TMagicManager.MagIceWindStaied (PlayObject: TPlayObject; skilllevel: integer;UserMagic:pTUserMagic): Boolean;    //ºù¿°¼ú
var
   i    : integer;
   rlist: TList;
   cret : TBaseObject;
   pwr  : integer;
   isnear : boolean;
   xx,yy : integer;
   f1x,f1y,f2x,f2y : integer;
begin
   Result := FALSE;
   pwr := 0;
   isnear := FALSE;
   rlist := TList.Create;

   // ¹üÀ§ÀÇ ÁÜ½ÉÀÌ µÇ´Â ÁÂÇ¥ º¯°æ
   xx := PlayObject.m_nCurrX;
   yy := PlayObject.m_nCurrY;
   f1x := xx;
   f1y := yy;
   f2x := xx;
   f2y := yy;

   case PlayObject.m_btDirection of
   0 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx;
            f1y := yy - 1;
            f2x := xx;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy - 2;
            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   1 :  begin

            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy - 1;
            f2x := xx + 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   2 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy ;
            f2x := xx + 2;
            f2y := yy;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx  := xx + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   3 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx + 1;
            f1y := yy + 1;
            f2x := xx + 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx + 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   4 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx ;
            f1y := yy + 1;
            f2x := xx ;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            yy := yy + 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   5 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy + 1;
            f2x := xx - 2;
            f2y := yy + 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy + 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   6 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy ;
            f2x := xx - 2;
            f2y := yy ;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;

            PlayObject.GetMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, rlist);
        end;
   7 :  begin
            // °­ÇÏ°Ô Å¸°ÝÀÌ µé¾î°¡´Â ÁÂÇ¥ ¼³Á¤
            f1x := xx - 1;
            f1y := yy - 1;
            f2x := xx - 2;
            f2y := yy - 2;

            //Áß¾ÓÁÂÇ¥ ¼³Á¤
            xx := xx - 2;
            yy := yy - 2;

            PlayObject.GetObliqueMapBaseObjects (PlayObject.m_PEnvir, xx, yy, 1, PlayObject.m_btDirection, rlist);
        end;
   end;

   for i:=0 to rlist.Count-1 do begin
      cret := TBaseObject (rlist[i]);
      if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then
      begin

         // Å¸°ÝÀÌ °­ÇÏ°Ô µé¾î°¡¾ßµÉ ³Ñ°ú ¾àÇÏ°Ô µé¾î°¡¾ßµÉ ³Ñ ÆÇ´Ü.
         if ( (cret.m_nCurrX = f1x) and (cret.m_nCurrY = f1y) ) or ( (cret.m_nCurrX = f2x) and (cret.m_nCurrY = f2y) ) then begin
            isnear := true;
         end else begin
            isnear := false;
         end;


         //Àü¹æ 1*2ÀÇ ¹üÀ§:
         //((1.2+0.3*(Lv_S+(LV/20)) * Random(Dcmax)/3+DC
         //±× ¿Ü ¹üÀ§: ((0.8+0.2*(Lv_S+LV/20)) * Random(Dcmax)/3+DC
         //Å¸°ÝÄ¡°¡ ´Ù¸¥°Ô Àû¿ëµÊ
         if isnear then begin
            pwr:=PlayObject.GetAttackPower(GetPower(MPow(UserMagic),UserMagic) + LoWord(PlayObject.m_WAbil.MC),
                            SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC)) * 2 + UserMagic.btLevel * 15);
         end else begin
            pwr:=PlayObject.GetAttackPower(GetPower(MPow(UserMagic),UserMagic) + LoWord(PlayObject.m_WAbil.MC),
                            SmallInt(HiWord(PlayObject.m_WAbil.MC)-LoWord(PlayObject.m_WAbil.MC)) * 2 );
         end;

         if pwr > 0 then begin
           if PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0 then       //ºù¿°¼ú °­È­
              pwr := Round(pwr * 1.3);

            windcuthit( PlayObject, cret, 0, pwr );

            if (Random(25) < SkillLevel + 4) and (Random(cret.m_btAntiPoison) = 0) then begin
               cret.MakePosion(POISON_SLOWDOWN,(SkillLevel + 1) * 3,0);
            end;
            if (Random(50) < SkillLevel + 4) and (Random(cret.m_btAntiPoison) = 0)  then begin
               cret.MakePosion(POISON_FREEZE,(SkillLevel + 1) * 3,0);
            end;

            Result := TRUE;
         end;
      end;
   end;
   FreeAndNil(rlist);

end;

function  TMagicManager.MagMoonBlade (PlayObject: TBaseObject; skilllevel: integer;UserMagic:pTUserMagic): Boolean;    //¿ùÇÏ³­¹«
const
   valarr: array[0..4] of integer = (6, 7, 0, 1, 2);
var
   i    : integer;
   cret : TBaseObject;
   pwr  : integer;
   ndir : integer;
   nX,nY: integer;
begin
   Result := FALSE;
   pwr := 0;

   for i:=0 to 4 do begin
     ndir := (PlayObject.m_btDirection + valarr[i]) mod 8;
     if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,ndir,1,nX,nY) then begin
       cret:=PlayObject.m_PEnvir.GetMovingObject(nX,nY,True);
       if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then begin
         pwr:=PlayObject.GetAttackPower(GetPower(MPow(UserMagic),UserMagic) + LoWord(PlayObject.m_WAbil.DC),
                            SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) * 2);
         if pwr > 0 then begin

           if (PlayObject.m_btRaceServer = RC_PLAYOBJECT) and (PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0) then  //¿ùÇÏ³­¹« °­È­
             pwr := Round( pwr * 1.3);

           windcuthit( PlayObject, cret, pwr, 0 );
           Result := TRUE;
         end;
       end;
     end;
   end;
   for i:=0 to 4 do begin
     ndir := (PlayObject.m_btDirection + valarr[i]) mod 8;
     if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,ndir,2,nX,nY) then begin
       cret:=PlayObject.m_PEnvir.GetMovingObject(nX,nY,True);
       if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then begin
         pwr:=PlayObject.GetAttackPower(GetPower(MPow(UserMagic),UserMagic) + LoWord(PlayObject.m_WAbil.DC),
                            Round(SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) * 1.7));
         if pwr > 0 then begin
           windcuthit( PlayObject, cret, pwr, 0 );
           Result := TRUE;
         end;
       end;
     end;
   end;
   if (PlayObject.m_btRaceServer = RC_PLAYOBJECT) and (PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0) then begin //¿ùÇÏ³­¹« °­È­
     for i:=0 to 4 do begin
       ndir := (PlayObject.m_btDirection + valarr[i]) mod 8;
       if PlayObject.m_PEnvir.GetNextPosition(PlayObject.m_nCurrX,PlayObject.m_nCurrY,ndir,3,nX,nY) then begin
         cret:=PlayObject.m_PEnvir.GetMovingObject(nX,nY,True);
         if PlayObject.IsProperTarget (cret) and ( not cret.m_boDeath) and ( not cret.m_BoGhost ) then begin
           pwr:=PlayObject.GetAttackPower(GetPower(MPow(UserMagic),UserMagic) + LoWord(PlayObject.m_WAbil.DC),
                            Round(SmallInt(HiWord(PlayObject.m_WAbil.DC)-LoWord(PlayObject.m_WAbil.DC)) * 1.4));
           if pwr > 0 then begin
             windcuthit( PlayObject, cret, pwr, 0 );
             Result := TRUE;
           end;
         end;
       end;
     end;
   end;
end;

procedure TMagicManager.WindCutHit (PlayObject: TBaseObject; TargeTBaseObject: TBaseObject ; hitPwr ,magpwr: integer );  //°øÆÄ¼¶
var
   i, dam: integer;
begin
   if PlayObject.IsProperTarget (TargeTBaseObject) then begin
     dam := 0;
     dam := dam + TargeTBaseObject.GetHitStruckDamage (PlayObject, hitpwr);
     dam := dam + TargeTBaseObject.GetMagStruckDamage (PlayObject, magpwr);
     if dam > 0 then begin
       TargeTBaseObject.StruckDamage (dam);
       TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, dam,
             TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(PlayObject){hiter}, '', 200);
     end;
   end;
end;

function TMagicManager.MagSaceMove(BaseObject: TBaseObject;
  nLevel: integer): Boolean; //04927D8
var
  Envir      :TEnvirnoment;
  PlayObject :TPlayObject;
begin
  Result:=False;
  if Random(11) < nLevel * 2 + 4 then begin
    BaseObject.SendRefMsg(RM_SPACEMOVE_FIRE2,0,0,0,0,'');
    if BaseObject is TPlayObject then begin
      Envir:=BaseObject.m_PEnvir;
      BaseObject.MapRandomMove(BaseObject.m_sHomeMap,1);
      if (Envir <> BaseObject.m_PEnvir) and (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
        PlayObject:=TPlayObject(BaseObject);
        PlayObject.m_boTimeRecall:=False;
        PlayObject.m_boTimeRecallGroup:=False;
      end;
    end;
    Result:=True;
  end; //00492899
end;

function TMagicManager.MagRoSeonSaceMove(BaseObject: TBaseObject;       //·Ú¼±Ç³
  nLevel, nTargetX, nTargetY, nPower, nSec, nDSec: Integer): Boolean; //04927D8
var
  I, nx, ny        :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result:=False;
  if Random(5) < nLevel * 2 + 4 then begin
    nx := BaseObject.m_nCurrX;
    ny := BaseObject.m_nCurrY;
    if BaseObject.m_PEnvir.CanWalk(nTargetX, nTargetY, True) and (BaseObject.m_PEnvir.GetXYObjCount(nTargetX, nTargetY) = 0) then begin
      BaseObject.SpaceMagMove(nTargetX, nTargetY, 0);
      BaseObject.m_wStatusArrValue[64]:=nPower;
      BaseObject.m_dwStatusArrTimeOutTick[64]:=GetTickCount + nSec * 1000;
      BaseObject.SysMsg('À×ÏÉ·çÊ¹ÄãµÄ×î´óÉúÃüÖµÔö¼Ó' + IntToStr(nPower) + '£¬³ÖÐø' + IntToStr(nSec) + 'Ãë¡£',c_Green,t_Hint);
      BaseObject.RecalcAbilitys;
      BaseObject.m_wStatusArrValue[63]:=nDSec;
      BaseObject.m_dwStatusArrTimeOutTick[63]:=GetTickCount + nDSec * 1000;
      BaseObject.SendMsg (BaseObject, RM_COOLBUFF, 73, 0, 55, nDSec, '[ À×ÏÉ·ç ]\ÀäÈ´Ê±¼ä: ' );  //·Ú¼±Ç³ ÄðÅ¸ÀÓ ¹öÇÁ
    end;
    BaseObjectList := TList.Create;
    BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nx,ny,2,BaseObjectList);
    for I := 0 to BaseObjectList.Count - 1 do begin
      TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
      if BaseObject.IsProperTarget(TargeTBaseObject) then begin
        if TargeTBaseObject.m_btRaceServer <> RC_PLAYOBJECT then begin
          if TargeTBaseObject.m_Abil.Level < 150 then    //¿Õ±ÞÀº ¾ÈµÊ
            TargeTBaseObject.MakePosion(POISON_STONE,5,1);
        end else begin
           TargeTBaseObject.MakePosion(POISON_STONE,5,1);
        end;
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
  Result := True;
end;

function TMagicManager.MagShadowSaceMove(BaseObject: TBaseObject;        //¿µÀûÃß
  nLevel, nTargetX, nTargetY, nDSec: Integer): Boolean; //04927D8
begin
  Result:=False;
  if Random(11) < nLevel * 2 + 4 then begin
    if BaseObject.m_PEnvir.CanWalk(nTargetX + 1, nTargetY - 1, True) and (BaseObject.m_PEnvir.GetXYObjCount(nTargetX, nTargetY) <> 0) and
       (BaseObject.m_PEnvir.GetXYObjCount(nTargetX + 1, nTargetY - 1) = 0) then begin
      BaseObject.SpaceMagMove(nTargetX + 1, nTargetY - 1, 0);
      BaseObject.m_wStatusArrValue[67]:=nDSec;
      BaseObject.m_dwStatusArrTimeOutTick[67]:=GetTickCount + nDSec * 1000;
      BaseObject.SendMsg (BaseObject, RM_COOLBUFF, 77, 0, 49, nDSec, '[ Ó°Ñª×¹ ]\ÀäÈ´Ê±¼ä: ' );  //¿µÀûÃß ÄðÅ¸ÀÓ ¹öÇÁ
      Result := True;
    end;
  end;
end;

function TMagicManager.MagChangePosition(PlayObject: TBaseObject; nTargetX, nTargetY: Integer): Boolean;  //ÀÏ¼¶
begin
  Result := False;
  if PlayObject.m_PEnvir.CanWalk(nTargetX, nTargetY, True) and (PlayObject.m_PEnvir.GetXYObjCount(nTargetX, nTargetY) = 0) then begin
    PlayObject.SpaceMagMove(nTargetX, nTargetY, 0);
    Result := True;
  end;
end;

function TMagicManager.MagMaChangePosition(PlayObject: TBaseObject; nTargetX, nTargetY, nTargetX1, nTargetY1: Integer): Boolean;  //¸¶Ç÷±¤¼¶
begin
  Result := False;
  if PlayObject.m_PEnvir.CanWalk(nTargetX, nTargetY, True) and (PlayObject.m_PEnvir.GetXYObjCount(nTargetX, nTargetY) = 0) then begin
    PlayObject.SpaceMagMove(nTargetX, nTargetY, 0);
    Result := True;
  end;
  if PlayObject.m_PEnvir.CanWalk(nTargetX1, nTargetY1, True) and (PlayObject.m_PEnvir.GetXYObjCount(nTargetX1, nTargetY1) = 0) then begin
    PlayObject.SpaceMaMagMove(nTargetX1, nTargetY1, 0);
    Result := True;
  end;
end;

function TMagicManager.MagChangeback(PlayObject: TBaseObject): Boolean;
var
  nX, nY: Integer;
begin
  Result := False;
  PlayObject.GetBackPosition2(nX, nY);
  if PlayObject.m_PEnvir.CanWalk(nX, nY, True) and (PlayObject.m_PEnvir.GetXYObjCount(nX, nY) = 0) then begin
    PlayObject.SpaceMagMove(nX, nY, 0);
    Result := True;
  end;
end;


function TMagicManager.MagMakeFireCharmEx(PlayObject: TBaseObject; UserMagic: pTUserMagic; nTargetX, nTargetY, nPower: Integer;
  var TargeTBaseObject: TBaseObject): Boolean;
begin
  Result := False;
  if TargeTBaseObject = nil then
    exit;
  if PlayObject.MagCanHitTarget(PlayObject.m_nCurrX, PlayObject.m_nCurrY, TargeTBaseObject) then begin
    if PlayObject.IsProperTarget(TargeTBaseObject) then begin
      if Random(10) >= TargeTBaseObject.m_nAntiMagic then begin
        if (abs(TargeTBaseObject.m_nCurrX - nTargetX) <= 1) and (abs(TargeTBaseObject.m_nCurrY - nTargetY) <= 1) then begin
          PlayObject.SendDelayMsg(PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2,
            Integer(TargeTBaseObject), '',
            200 + (abs(PlayObject.m_nCurrX - nTargetX) + abs(PlayObject.m_nCurrY - nTargetY)) div 2 * 20);
          PlayObject.SendDelayMsg(PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2,
            Integer(TargeTBaseObject), '',
            800 + (abs(PlayObject.m_nCurrX - nTargetX) + abs(PlayObject.m_nCurrY - nTargetY)) div 2 * 20);
          PlayObject.SendDelayMsg(PlayObject, RM_DELAYMAGIC, nPower, MakeLong(nTargetX, nTargetY), 2,
            Integer(TargeTBaseObject), '',
            1400 + (abs(PlayObject.m_nCurrX - nTargetX) + abs(PlayObject.m_nCurrY - nTargetY)) div 2 * 20);
          if (PlayObject.m_btRaceServer = RC_PLAYOBJECT) and (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) then
            Result := True;
        end;
      end;
    end;
  end
  else
    TargeTBaseObject := nil;
end;


function TMagicManager.MagMakeArrestObject(PlayObject: TBaseObject; UserMagic: pTUserMagic; TargeTActorObject: TBaseObject): Boolean;  //°Ý°ø¼·¹°
var
  nX, nY: Integer;
begin
  Result := False;

  if PlayObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT] > 0 then  //¿ù¿µ¼ú ¹× ¿­È­½Å °ø°Ý½Ã.. Ç®¸²
    PlayObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT]:=1;
  if PlayObject.m_wStatusTimeArr[STATE_YEONGMU] > 0 then  //¿ù¿µ¹« °ø°Ý½Ã.. Ç®¸²
    PlayObject.m_wStatusTimeArr[STATE_YEONGMU]:=1;

  if TargeTActorObject.m_Abil.Level < PlayObject.m_Abil.Level then begin
    if (Random(10 + UserMagic.btLevel) + UserMagic.btLevel) >= 5 then begin
         PlayObject.GetFrontPosition(nX, nY);
      if PlayObject.m_PEnvir.CanWalk(nX, nY, True) and (PlayObject.m_PEnvir.GetXYObjCount(nX, nY) = 0) then begin
         TargeTActorObject.SpaceMagMove(nX, nY, 0);
         Result := True;
      end;
    end;
  end;
end;


function TMagicManager.CheckTargetChange(BaseObject: TBaseObject): Boolean;  //ÁøÀ§º¸
begin
  Result := False;
  if (not BaseObject.m_boDeath)
   and (not BaseObject.m_boStickMode)
   and (not BaseObject.m_boGhost)
   and (not BaseObject.BoDontMove) then begin
    Result := True;
  end;
end;



function TMagicManager.MagTargetChangePosition(PlayObject, BaseObject: TBaseObject; nTargetX, nTargetY , nTargetX2, nTargetY2: Integer): Boolean;  //ÁøÀ§º¸
begin
  Result := False;
  if PlayObject.m_PEnvir.CanWalk(nTargetX, nTargetY, True) and BaseObject.m_PEnvir.CanWalk(nTargetX2, nTargetY2, True) then begin
    BaseObject.SpaceMagMove(nTargetX2, nTargetY2, 0);
    PlayObject.SpaceMagMove(nTargetX, nTargetY, 0);
    Result := True;
  end;
end;

function TMagicManager.MagMakeFireCross(PlayObject: TBaseObject; nDamage,     //Áö¿°¼ú
  nHTime, nX,nY: Integer): Integer; //00492C9C
var
  FireBurnEvent:TFireBurnEvent;
begin
  Result:=0;
  if (PlayObject.m_wStatusTimeArr[STATE_WINDMOON] > 0) then begin //Áö¿°¼ú °­È­
    if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY-1,ET_FIREUP,nHTime * 1000 ,Round(nDamage*1.3) );
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX-1,nY,ET_FIREUP,nHTime * 1000 ,Round(nDamage*1.3) );
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY,ET_FIREUP,nHTime * 1000 ,Round(nDamage*1.3) );
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX+1,nY,ET_FIREUP,nHTime * 1000 ,Round(nDamage*1.3) );
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY+1,ET_FIREUP,nHTime * 1000 ,Round(nDamage*1.3) );
      g_EventManager.AddEvent(FireBurnEvent);
    end;
  end else begin
    if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY-1,ET_FIRE,nHTime * 1000 ,nDamage);
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX-1,nY,ET_FIRE,nHTime * 1000 ,nDamage);
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY,ET_FIRE,nHTime * 1000 ,nDamage);
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX+1,nY,ET_FIRE,nHTime * 1000 ,nDamage);
      g_EventManager.AddEvent(FireBurnEvent);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
      FireBurnEvent:=TFireBurnEvent.Create(PlayObject,nX,nY+1,ET_FIRE,nHTime * 1000 ,nDamage);
      g_EventManager.AddEvent(FireBurnEvent);
    end;
  end;
  Result:=1;
end;



function TMagicManager.MagMakeAllFire(BaseObject: TBaseObject; nDamage,     //¸¸Ãµ¿°¿Á
  nHTime, nX,nY: Integer): Boolean; //00492C9C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  AllFireEvent     :TAllFireEvent;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,8,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);

    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      if BaseObject.m_PEnvir.GetEvent(TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY) = nil then begin
        AllFireEvent:=TAllFireEvent.Create(BaseObject, TargeTBaseObject.m_nCurrX , TargeTBaseObject.m_nCurrY,ET_ALLFIRE, nHTime * 500 ,nDamage);
        g_EventManager.AddEvent(AllFireEvent);
        Result:=True;
      end;
    end;

  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagMakeThunder(BaseObject: TBaseObject; nDamage,     //¿îÁß·Ú°Ý
  nHTime, nDel, nX,nY: Integer): Boolean; //00492C9C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  AllThunderEvent  :TAllThunderEvent;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,5,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);

    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      if BaseObject.m_PEnvir.GetEvent(TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY) = nil then begin
        AllThunderEvent:=TAllThunderEvent.Create(BaseObject, TargeTBaseObject.m_nCurrX , TargeTBaseObject.m_nCurrY,ET_ALLTHUNDER, nHTime * 500 ,nDamage);
        g_EventManager.AddEvent(AllThunderEvent);
        Result:=True;

        BaseObject.SendMsg (BaseObject, RM_COOLBUFF, 81, 0, 59, 30, '[ ÔÆÖÐÂäÀ× ]\ÀäÈ´Ê±¼ä: '); //¿îÁß·Ú°Ý ÄðÅ¸ÀÓ ¹öÇÁ
        BaseObject.m_wStatusArrValue[71]:=1;
        BaseObject.m_dwStatusArrTimeOutTick[71]:=GetTickCount + 30 * 1000;

      end;
    end;

  end;
  FreeAndNil(BaseObjectList);
end;



function TMagicManager.MagBlizzard(PlayObject:TPlayObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;    //Ãµ»óºùÈ¯
var
  BlizzardEvent: TBlizzardEvent;
begin
  Result:=FALSE;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX, nY - 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX, nY - 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 1, nY - 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;

  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 1, nY + 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;

  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 2, nY - 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 1, nY - 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 2, nY - 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX, nY, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 1, nY, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 2, nY, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 1, nY, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 2, nY, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX, nY + 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX, nY + 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 1, nY + 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 2, nY + 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 1, nY + 1, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 2, nY + 2, ET_NONE, nHTime * 200 ,nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX - 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 1, nY + 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-1) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-2) = nil then begin
    BlizzardEvent := TBlizzardEvent.Create(PlayObject, nX + 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(BlizzardEvent);
  end;
  Result:=True;
end;


function TMagicManager.MagMeteor(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;  //Ãµ»ó³«¿°
var
  MeteorEvent: TMeteorEvent;
begin
  Result:=FALSE;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 1,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 2,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+2,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 2,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+2,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX - 2,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+2) = nil then begin
    MeteorEvent:=TMeteorEvent.Create(PlayObject,nX+2,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+1) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX - 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-1) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX - 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-2) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX - 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+2) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX + 1, nY + 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+1) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX + 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-1) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX + 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-2) = nil then begin
    MeteorEvent := TMeteorEvent.Create(PlayObject, nX + 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(MeteorEvent);
  end;
  Result:=True;
end;



function TMagicManager.MagDragon(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;  //¿ë¼ÚÀ½
var
  DragonEvent: TDragonEvent;
begin
  Result:=FALSE;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 1,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 2,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+2,nY-2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX,nY,ET_DRAGON,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 2,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+2,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX - 2,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+2) = nil then begin
    DragonEvent:=TDragonEvent.Create(PlayObject,nX+2,nY+2,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY+1) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX - 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-2,nY-1) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX - 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-2) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX - 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+2) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX + 1, nY + 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY+1) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX + 2, nY + 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+2,nY-1) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX + 2, nY - 1, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-2) = nil then begin
    DragonEvent := TDragonEvent.Create(PlayObject, nX + 1, nY - 2, ET_NONE, nHTime * 200, nPower);
    g_EventManager.AddEvent(DragonEvent);
  end;
  Result:=True;
end;



function TMagicManager.MagMahul(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;  //¸¶Ç÷³­¹«
var
  MahulEvent: TMahulEvent;
begin
  Result:=FALSE;
  if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX - 1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX,nY,ET_MAHUL,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX - 1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX - 1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;
  if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
    MahulEvent:=TMahulEvent.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 200 ,nPower);
    g_EventManager.AddEvent(MahulEvent);
  end;

  Result:=True;
end;

procedure TMagicManager.MagYeongMu(PlayObject:TPlayObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer);  //¿ù¿µ¹«
var
  YeongMuEvent: TYeongMuEvent;
begin
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX,nY,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 1,nY,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 1,nY,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX,nY - 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX,nY + 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);

    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 1,nY + 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 1,nY - 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 1,nY + 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 1,nY - 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);

    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 2,nY + 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 1,nY + 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX ,nY + 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 1,nY + 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 2,nY + 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);

    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 2,nY + 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 2,nY + 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 2,nY,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 2,nY,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 2,nY - 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 2,nY - 1,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);

    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 2,nY - 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX - 1,nY - 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX ,nY - 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 1,nY - 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);
    YeongMuEvent:=TYeongMuEvent.Create(PlayObject,nX + 2,nY - 2,ET_NONE,nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(YeongMuEvent);

end;


function TMagicManager.MagOhaeng(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;  //À½¾ç¿ÀÇàÁø
var
  OhaengEvent: TOhaengEvent;
begin
  Result:=FALSE;

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX, nY - 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX, nY - 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY - 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY - 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY - 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY - 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX, nY, ET_OHAENG, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX, nY + 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX, nY + 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY + 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY + 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY + 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY + 1, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY + 2, ET_NONE, nHTime * 1000 ,nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY + 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY - 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY - 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY + 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY + 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY - 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY - 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX , nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY + 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 2, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 1, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX , nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 1, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 2, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY - 3, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY + 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY + 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY , ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY - 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX - 3, nY - 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY + 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY + 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY , ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY - 1, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);
    OhaengEvent:=TOhaengEvent.Create(PlayObject, nX + 3, nY - 2, ET_NONE, nHTime * 1000, nPower);
    g_EventManager.AddEvent(OhaengEvent);

  Result:=True;
end;


function TMagicManager.MagBigExplosion(BaseObject: TBaseObject; nPower, nX,
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK_MINE,0,nPower,0,0,'');
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


function TMagicManager.MagThunderClap(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nX, nY: Integer; nRage, nDel: Integer; var boMove: Boolean): Boolean;
var
  i: Integer;
  BaseObjectList: TList;
  TargeTBaseObject: TBaseObject;
  PlayObject: TPlayObject;
  nPowerPoint: Integer;
begin
  Result := False;
  boMove := False;
  if MagChangePosition(BaseObject, nX, nY) then begin
    boMove := True;
    nX := BaseObject.m_nCurrX;
    nY := BaseObject.m_nCurrY;
    nPowerPoint := nPower;
    PlayObject := TPlayObject(BaseObject);
    BaseObjectList := TList.Create;
    BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir, nX, nY, nRage, BaseObjectList);
    for i := 0 to BaseObjectList.Count - 1 do begin
      TargeTBaseObject := TBaseObject(BaseObjectList.Items[i]);
      if BaseObject.IsProperTarget(TargeTBaseObject) then begin
        PlayObject.SendDelayMsg(PlayObject, RM_DELAYMAGIC, nPowerPoint, MakeLong(nX, nY), 3, Integer(TargeTBaseObject), '', 600);
        Result := True;
        BaseObject.m_wStatusArrValue[75]:=nPower;
        BaseObject.m_dwStatusArrTimeOutTick[75]:=GetTickCount + nDel * 1000;
        BaseObject.SendMsg (BaseObject, RM_COOLBUFF, 111, 0, 76, nDel, '[ »÷¿Õ¹÷·¨ ]\ÀäÈ´Ê±¼ä: ');   //°Ý°øÀå ÄðÅ¸ÀÓ ¹öÇÁ
      end;
    end;
    FreeAndNil(BaseObjectList);
  end;
end;

function TMagicManager.MagThenderExplosion(BaseObject: TBaseObject; nPower, nX,
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK_MINE,0,nPower,0,0,'');
      if Random(2) = 0 then begin
      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, NE_THUNDER, '0');
      end else
       TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, NE_THUNDER2, '0');
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagThenderDownExplosion(BaseObject: TBaseObject; nPower, nX,
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK_MINE,0,nPower,0,0,'');
      TargeTBaseObject.SendDelayRefMsg(RM_10205,0,TargeTBaseObject.m_nCurrX,TargeTBaseObject.m_nCurrY,NE_THUNDERDOWN,'0',200);
      if (Random(TargeTBaseObject.m_btAntiPoison + 10) <= 2) then begin
        TargeTBaseObject.MakePosion(POISON_SLOWDOWN, 5, 0)
      end;
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagSunchun(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nPower2, nsec, nX, nY: Integer; nRage: Integer): Boolean;  //¼±Ãµ
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperFriend(TargeTBaseObject) then begin
      TargeTBaseObject.CelestialDefenceUp(UserMagic.btLevel, nPower2);
      TargeTBaseObject.m_wStatusArrValue[84]:=nPower;
      TargeTBaseObject.m_dwStatusArrTimeOutTick[84]:=GetTickCount + nsec * 1000;
      TargeTBaseObject.SysMsg(format(g_sSunChunTime,[nSec]),c_Green,t_Hint);
      TargeTBaseObject.RecalcAbilitys();
      TargeTBaseObject.SendMsg(TargeTBaseObject,RM_ABILITY,0,0,0,0,'');
      TargeTBaseObject.SendMsg(TargeTBaseObject,RM_SUBABILITY,0,0,0,0,'');
      TargeTBaseObject.SendMsg(TargeTBaseObject,RM_BUFF, 120, 0, 98, nSec, format('[ Óð»¯µÇÏÉ ]\¹¥»÷¡¢Ä§·¨¡¢µÀÊõÔö¼Ó %d - %d\ÉúÃüÖµ¡¢Ä§·¨Öµ + %d \×¼È·¡¢Ãô½ÝÔö¼Ó %d ',
           [TargeTBaseObject.m_wStatusArrValue[84],TargeTBaseObject.m_wStatusArrValue[84],TargeTBaseObject.m_wStatusArrValue[84] * 10,TargeTBaseObject.m_wStatusArrValue[84] div 4]));     //Ã·±âÆø ¹öÇÁ
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagBigExplosion2(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nX,
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var                                                  //Ãµ»óºùÈ¯
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',300);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',2800);
      Result:=True;
     if (Random(52) < UserMagic.btLevel * 8) and (Random(TargeTBaseObject.m_btAntiPoison) = 0) then begin
        TargeTBaseObject.MakePosion(POISON_SLOWDOWN,(Random(3)),0);
     end;
    end;
  end;
  FreeAndNil(BaseObjectList);
  Result:=True;
end;

function TMagicManager.MagBigHweChun(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nX,  //È¸Ãµ°Ý
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      //BaseObject.SetTargetCreat(TargeTBaseObject);
      //nPower:=TargeTBaseObject.GetHitStruckDamage(BaseObject,nPower);
      //TargeTBaseObject.StruckDamage (nPower);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',500);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',1200);
      TargeTBaseObject.SendDelayMsg(BaseObject, RM_MAGSTRUCK_MINE,0,nPower,0,0,'',4000);
    {  TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, nPower, TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(BaseObject), '', 500);
      TargeTBaseObject.StruckDamage (nPower);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, nPower, TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(BaseObject), '', 1200);
      TargeTBaseObject.StruckDamage (nPower);
      TargeTBaseObject.SendDelayMsg (TBaseObject(RM_STRUCK), RM_10101, nPower, TargeTBaseObject.m_WAbil.HP, TargeTBaseObject.m_WAbil.MaxHP, Longint(BaseObject), '', 4000);  }
      TargeTBaseObject.SendDelayRefMsg(RM_10205,0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, NE_HWECHUN_1, '0', 3200);
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
  Result:=True;
end;

function TMagicManager.MagPoisonCloud(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;        //µ¶¹«
var
  PoisonCloud:TPoisonCloud;
begin
  Result:=FALSE;
  if (PlayObject.m_wStatusTimeArr[STATE_BLOODMOON] > 0) and (PlayObject.m_btRaceServer = RC_PLAYOBJECT) then begin  //µ¶¹« °­È­
    if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 1300 , Round(nPower * 1.3) );
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY,ET_UPPOISONCLOUD,nHTime * 1300 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY-1,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY+1,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 1300 ,Round(nPower * 1.3));
      g_EventManager.AddEvent(PoisonCloud);
    end;
  end else begin

    if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 1000 , nPower );
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY,ET_POISONCLOUD,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY-1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX-1,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
      PoisonCloud:=TPoisonCloud.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(PoisonCloud);
    end;
  end;
  Result:=True;
end;


function TMagicManager.MagChunGong(PlayObject:TBaseObject; UserMagic: pTUserMagic; nPower,nHTime, nX,nY: Integer): Boolean;        //Ãµ°ø
var
  ChunGong:TChunGong;
begin
  Result:=FALSE;
    if PlayObject.m_PEnvir.GetEvent(nX,nY-1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX,nY-1,ET_NONE,nHTime * 1000 , nPower );
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX-1,nY,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX,nY,ET_CHUNGONG,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX+1,nY,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX,nY+1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY-1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX-1,nY-1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY-1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX+1,nY-1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX-1,nY+1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX-1,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
    if PlayObject.m_PEnvir.GetEvent(nX+1,nY+1) = nil then begin
      ChunGong:=TChunGong.Create(PlayObject,nX+1,nY+1,ET_NONE,nHTime * 1000 ,nPower);
      g_EventManager.AddEvent(ChunGong);
    end;
  Result:=True;
end;

function TMagicManager.MagBigExplosion4(BaseObject: TBaseObject; UserMagic: pTUserMagic; nPower, nX,  //Ãµ»ó³«¿°
  nY: Integer; nRage: Integer): Boolean; //00492F4C
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  PlayObject       :TPlayObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
      for I := 0 to BaseObjectList.Count - 1 do begin
        TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
         if BaseObject.IsProperTarget(TargeTBaseObject) then begin
          BaseObject.SetTargetCreat(TargeTBaseObject);
          TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK_MINE,0,nPower,0,0,'',300);
          TargeTBaseObject.SendDelayMsg(BaseObject,RM_MAGSTRUCK_MINE,0,nPower,0,0,'',2800);
          Result:=True;
         end;
      end;
      FreeAndNil(BaseObjectList);
  Result:=True;
end;

function TMagicManager.MagBigExplosion6(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage,nMode:Integer): Boolean; //µ¶Ä§¼ú
var
  I, nTime         :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  PlayObject : TplayObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendDelayMsg (BaseObject, RM_MAGSTRUCK_MINE, 0, nPower, 0, 0, '', 1000);
      Result:=True;
      if 12 >= Random(7 + TargeTBaseObject.m_btAntiPoison) then begin
        if Random(1) < UserMagic.btLevel + 4 then begin
          if nMode = 0 then begin
            TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DECHEALTH,nPower div 2 ,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
          end else
            TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DAMAGEARMOR,nPower div 2,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
        end;
      end;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


function TMagicManager.MagBigExplosion7(BaseObject:TBaseObject; UserMagic: pTUserMagic; nPower,nX,nY:Integer;nRage,nMode:Integer): Boolean; //¾Ïµ¶¸¸°è
var
  I, nTime         :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  PlayObject : TplayObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendDelayMsg (BaseObject, RM_MAGSTRUCK_MINE, 0, nPower, 0, 0, '', 1000);
      TargeTBaseObject.SendRefMsg (RM_10205, 0, TargeTBaseObject.m_nCurrX, TargeTBaseObject.m_nCurrY, NE_CLOUD, '0');
      Result:=True;
      case Random(55) of
        0..9: begin
            TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DECHEALTH,nPower,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
          end;
        10..19: begin
            TargeTBaseObject.SendDelayMsg(BaseObject,RM_POISON,POISON_DAMAGEARMOR,nPower,Integer(BaseObject),ROUND(UserMagic.btLevel / 3 * (nPower / g_Config.nAmyOunsulPoint)),'',1000);
          end;
        20..29: begin
            if (TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] = 0) then
              TargeTBaseObject.MakePosion(POISON_FREEZE,13,5);
          end;
        30..39: begin
            TargeTBaseObject.MakePosion(POISON_SLOWDOWN,nPower div 10,5);
          end;
        40..49: begin
            TargeTBaseObject.MakePosion(POISON_STUN,13,5);
          end;
        else begin
          TargeTBaseObject.MakePosion(POISON_STONE,8,5);
        end;
      end;

    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagElecBlizzard(BaseObject: TBaseObject;
  nPower: integer): Boolean; //00493010
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  nPowerPoint      :Integer;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,BaseObject.m_nCurrX,BaseObject.m_nCurrY,g_Config.nElecBlizzardRange{2},BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[I]);
    if not (TargeTBaseObject.m_btLifeAttrib = LA_UNDEAD) then begin
      nPowerPoint:=nPower div 10;
    end else nPowerPoint:=nPower;
      
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,nPowerPoint,0,0,'');
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagMakeHolyCurtain(BaseObject:TBaseObject;nPower:Integer;nX,nY:Integer): Integer; //004928C0    //°á°è
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  MagicEvent       :pTMagicEvent;
  HolyCurtainEvent :THolyCurtainEvent;
begin
  Result:=0;
  if BaseObject.m_PEnvir.CanWalk(nX,nY,True) then begin
    BaseObjectList:=TList.Create;
    MagicEvent:=nil;
    BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,1,BaseObjectList);
    for I := 0 to BaseObjectList.Count - 1 do begin
      TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
      if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) and
         ((Random(4) + (BaseObject.m_Abil.Level - 1)) > TargeTBaseObject.m_Abil.Level) and
         (TargeTBaseObject.m_Master = nil) then begin
        TargeTBaseObject.OpenHolySeizeMode(nPower * 1000);
        if MagicEvent = nil then begin
          New(MagicEvent);
          FillChar(MagicEvent^,SizeOf(TMagicEvent),#0);
          MagicEvent.BaseObjectList:=TList.Create;
          MagicEvent.dwStartTick:=GetTickCount();
          MagicEvent.dwTime:=nPower * 1000;
        end;
        MagicEvent.BaseObjectList.Add(TargeTBaseObject);
        Inc(Result);
      end else begin
        Result:=0;
      end;
    end;
    FreeAndNil(BaseObjectList);
    if (Result > 0) and (MagicEvent <> nil) then begin
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX - 1,nY - 2,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[0]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX + 1,nY - 2,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[1]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX - 2,nY - 1,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[2]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX + 2,nY - 1,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[3]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX - 2,nY + 1,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[4]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX + 2,nY + 1,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[5]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX - 1,nY + 2,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[6]:=HolyCurtainEvent;
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX + 1,nY + 2,ET_HOLYCURTAIN,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[7]:=HolyCurtainEvent;
      UserEngine.m_MagicEventList.Add(MagicEvent);
    end else begin
      if MagicEvent <> nil then begin
        FreeAndNil(MagicEvent.BaseObjectList);
        Dispose(MagicEvent);
      end;
    end;
  end;    
end;

function TMagicManager.MagMakepobak(BaseObject:TBaseObject;nPower:Integer;nX,nY:Integer): Integer; //004928C0     //Æ÷¹Ú¼ú
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
  MagicEvent       :pTMagicEvent;
  HolyCurtainEvent :THolyCurtainEvent;
begin
  if BaseObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT] > 0 then   //¿ù¿µ¼ú ½ÃÀü Ãë¼Ò
    BaseObject.m_wStatusTimeArr[STATE_ASSTRANSPARENT]:=1;

  if BaseObject.m_wStatusTimeArr[STATE_YEONGMU] > 0 then  //¿ù¿µ¹« °ø°Ý½Ã.. Ç®¸²
    BaseObject.m_wStatusTimeArr[STATE_YEONGMU]:=1;
  Result:=0;
  if BaseObject.m_PEnvir.CanWalk(nX,nY,True) then begin
    BaseObjectList:=TList.Create;
    MagicEvent:=nil;
    TargeTBaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,0,BaseObjectList);
    for I := 0 to BaseObjectList.Count - 1 do begin
      TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
      if (TargeTBaseObject.m_btRaceServer >= RC_ANIMAL) and
         ((Random(4) + (BaseObject.m_Abil.Level - 1)) > TargeTBaseObject.m_Abil.Level) and
         (TargeTBaseObject.m_Master = nil) then begin
         TargeTBaseObject.OpenPobakSeizeMode(nPower * 1000);   //Æ÷¹Ú¼ú
        if MagicEvent = nil then begin
          New(MagicEvent);
          FillChar(MagicEvent^,SizeOf(TMagicEvent),#0);
          MagicEvent.BaseObjectList:=TList.Create;
          MagicEvent.dwStartTick:=GetTickCount();
          MagicEvent.dwTime:=nPower * 1000;   //Æ÷¹Ú¼ú Áö¼Ó½Ã°£
        end;
        MagicEvent.BaseObjectList.Add(TargeTBaseObject);    //Æ÷¹Ú¼ú¿¡ °É¸° ¸÷ ±â·Ï.
        Inc(Result);
      end else begin
        Result:=0;
      end;
    end;
    FreeAndNil(BaseObjectList);
    if (Result > 0) and (MagicEvent <> nil) then begin
      HolyCurtainEvent:=THolyCurtainEvent.Create(BaseObject.m_PEnvir,nX,nY,ET_POBAK,nPower * 1000);
      g_EventManager.AddEvent(HolyCurtainEvent);
      MagicEvent.Events[0]:=HolyCurtainEvent;
      UserEngine.m_MagicEventList.Add(MagicEvent);
    end else begin
      if MagicEvent <> nil then begin
        FreeAndNil(MagicEvent.BaseObjectList);
        Dispose(MagicEvent);
      end;
    end;
  end;
end;

function TMagicManager.MagMakeGroupTransparent(BaseObject: TBaseObject; nX, nY,
  nHTime: Integer): Boolean; //0049320C
var
  I: Integer;
  BaseObjectList:TList;
  TargeTBaseObject:TBaseObject;
begin
  Result:=False;
  BaseObjectList:=TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,1,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperFriend(TargeTBaseObject) then begin
      if TargeTBaseObject.m_wStatusTimeArr[STATE_TRANSPARENT{0x70}] = 0 then begin //00493287
        TargeTBaseObject.SendDelayMsg(TargeTBaseObject,RM_TRANSPARENT,0,nHTime,0,0,'',800);
        Result:=True;
      end;
    end
  end;
  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagMakeSinSuSlave(PlayObject: TPlayObject;
  UserMagic: pTUserMagic): Boolean;
var
  I: Integer;
  sMonName:String;
  nMakelevel,nExpLevel:Integer;
  dwRoyaltySec:LongWord;
  TempCret : TBaseObject;
begin
  Result:=False;
 { if PlayObject.SlaveCount(g_Config.sDragon) > 0 then begin
    PlayObject.RecallSlave(g_Config.sDragon);
    exit;
  end;
  if PlayObject.SlaveCount(g_Config.sDragon1) > 0 then begin
    PlayObject.RecallSlave(g_Config.sDragon1);
    exit;
  end; }

  TempCret := PlayObject.GetExistSlave( g_Config.sDragon );
  if TempCret = nil then
    TempCret := PlayObject.GetExistSlave( g_Config.sDragon1 );
  if TempCret <> nil then begin
    TempCret.forcemovetomaster := true;
    exit;
  end else begin
    if not PlayObject.sub_4DD704 then begin
      sMonName:=g_Config.sDragon;
      nMakelevel:=UserMagic.btLevel;
      nExpLevel:=UserMagic.btLevel;
      dwRoyaltySec:=10 * 24 * 60 * 60;

      for I := Low(g_Config.DragonArray) to High(g_Config.DragonArray) do begin
        if g_Config.DragonArray[I].nHumLevel = 0 then break;
        if PlayObject.m_Abil.Level >= g_Config.DragonArray[I].nHumLevel then begin
          sMonName:=g_Config.DragonArray[I].sMonName;
          nExpLevel:=g_Config.DragonArray[I].nLevel;
        end;
      end;

      if PlayObject.MakeSlave(sMonName,nMakelevel,nExpLevel,3,dwRoyaltySec) <> nil then
        Result:=True;
    end;
  end;
end;

function TMagicManager.MagMakeSlave(PlayObject: TPlayObject;UserMagic:pTUserMagic):Boolean;
var
  I: Integer;
  sMonName:String;
  nMakeLevel,nExpLevel:Integer;
  dwRoyaltySec:LongWord;
  TempCret: TBaseObject;
begin
  Result:=False;
  TempCret := PlayObject.GetExistSlave( g_Config.sSkeleton );
  if TempCret <> nil then begin
    TempCret.ForceMoveToMaster := true;
  end else begin

    if not PlayObject.sub_4DD704 then begin
     sMonName:=g_Config.sSkeleton;
     nMakeLevel:=UserMagic.btLevel;
     nExpLevel:=UserMagic.btLevel;

     dwRoyaltySec:=10 * 24 * 60 * 60;
     for I := Low(g_Config.SkeletonArray) to High(g_Config.SkeletonArray) do begin
       if g_Config.SkeletonArray[I].nHumLevel = 0 then break;
       if PlayObject.m_Abil.Level >= g_Config.SkeletonArray[I].nHumLevel then begin
         sMonName:=g_Config.SkeletonArray[I].sMonName;
         nExpLevel:=g_Config.SkeletonArray[I].nLevel;
       end;
     end;

     if PlayObject.MakeSlave(sMonName,nMakeLevel,nExpLevel,3,dwRoyaltySec) <> nil then
       Result:=True;
    end;
  end;
end;


function TMagicManager.MagMakeJinSlave(PlayObject: TPlayObject;UserMagic:pTUserMagic):Boolean;
var
  I: Integer;
  sMonName:String;
  nMakeLevel,nExpLevel:Integer;
  dwRoyaltySec:LongWord;
  TempCret: TBaseObject;
begin
  Result:=False;
  TempCret := PlayObject.GetExistSlave( g_Config.sJinSkeleton );
  if TempCret <> nil then begin
    TempCret.ForceMoveToMaster := true;
  end else begin

    if not PlayObject.sub_4DD704 then begin
     sMonName:=g_Config.sJinSkeleton;
     nMakeLevel:=UserMagic.btLevel;
     nExpLevel:=UserMagic.btLevel;

     dwRoyaltySec:=10 * 24 * 60 * 60;
     for I := Low(g_Config.SkeletonArray) to High(g_Config.SkeletonArray) do begin
       if g_Config.SkeletonArray[I].nHumLevel = 0 then break;
       if PlayObject.m_Abil.Level >= g_Config.SkeletonArray[I].nHumLevel then begin
         sMonName:=g_Config.SkeletonArray[I].sMonName;
         nExpLevel:=g_Config.SkeletonArray[I].nLevel;
       end;
     end;

     if PlayObject.MakeSlave(sMonName,nMakeLevel,nExpLevel,3,dwRoyaltySec) <> nil then
       Result:=True;
    end;
  end;
end;

function TMagicManager.MagMakeClone(PlayObject: TBaseObject;UserMagic:pTUserMagic):Boolean;
var                                          //ºÐ½Å¼ú
  TempCret: TBaseObject;
begin
  Result:=False;

  TempCret := PlayObject.GetExistSlave( g_Config.sClone );
  if TempCret <> nil then begin
      // ºÐ½ÅÇÑ³ÑÀÌ ÀÖ´Ù.
    TempCret.BoDisapear := true;
      // MP ´Ù½Ã ´õÇØÁÖÀÚ
    PlayObject.m_Wabil.MP := PlayObject.m_Wabil.MP + TPlayObject(PlayObject).GetSpellPoint(UserMagic);
  end else begin  // ºÐ½ÅÇÑ³ÑÀÌ ¾ø´Ù.
    TempCret := PlayObject.NewMakeSlave ( g_Config.sClone , UserMagic.btLevel, 5, 10 * 24 * 60 * 60);
     if TempCret <> nil then begin
        PlayObject.SendRefMsg (RM_10205, 0, TempCret.m_nCurrX, TempCret.m_nCurrY, NE_CLONESHOW, '0');
        Result := TRUE;
     end;
  end;
end;


function TMagicManager.MagMakeDarkBody(PlayObject:TBaseObject; Targ: TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;
var                                          //¿­È­½Å
  TempCret: TBaseObject;
begin
  Result:=False;
  try
    TempCret := PlayObject.GetExistSlave( g_Config.sCloneAssassin );
    if TempCret = nil then begin
      TempCret := PlayObject.DarkBodyMakeSlave ( g_Config.sCloneAssassin , UserMagic.btLevel, 10 * 24 * 60 * 60, targ);
      Result := TRUE;
      PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 27, 0, 25, nDelay, '[ ÁÒ»ðÉí ]\ÀäÈ´Ê±¼ä: '); //¿­È­½Å ÄðÅ¸ÀÓ ¹öÇÁ
      PlayObject.m_wStatusArrValue[31] := 1;
      PlayObject.m_dwStatusArrTimeOutTick[31] := GetTickCount + nDelay * 1000;

      if MagMakePrivateAssTransparent(PlayObject, UserMagic.btLevel * 5 + 15) then
    end;
  except
      MainOutMessage('EXCEPT ÁÒ»ðÉí');
  end;
end;

function TMagicManager.MagMakeBonzeMob(PlayObject:TBaseObject; Targ: TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;
var                                          //°­È£¼ú
  TempCret, TempCret2: TBaseObject;
begin
  Result:=False;
  try
    TempCret := PlayObject.GetExistSlave( g_Config.sBonzeMob );
    if TempCret = nil then begin
      TempCret := PlayObject.MakeSlaveBonze ( g_Config.sBonzeMob , UserMagic.btLevel, 10 * 24 * 60 * 60, targ);
      Result := TRUE;
      TempCret2 := PlayObject.MakeSlaveBonze ( g_Config.sBonzeMob , UserMagic.btLevel, 10 * 24 * 60 * 60, targ);
      PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 113, 0, 71, nDelay, '[ Ç¿»¤Êõ ]\ÀäÈ´Ê±¼ä: '); //¿­È­½Å ÄðÅ¸ÀÓ ¹öÇÁ
      PlayObject.m_wStatusArrValue[82] := 1;
      PlayObject.m_dwStatusArrTimeOutTick[82] := GetTickCount + nDelay * 1000;
    end;
  except
      MainOutMessage('EXCEPT Ç¿»¤Êõ');
  end;
end;

function TMagicManager.MagMakeBonzeBody(PlayObject:TBaseObject; UserMagic:pTUserMagic; nDelay: Integer):Boolean;    //ÀºÇü¼ú - ÀÚ°´
var
  TempCret: TBaseObject;
  i: integer;
begin
  Result:=False;
  try
    for i := 0 to 4 do begin
      PlayObject.BonzeBodyMakeSlave ( g_Config.sBonzeClone , UserMagic.btLevel, 10 * 24 * 60 * 60, i);
      Result := TRUE;
    end;
    PlayObject.SendMsg (PlayObject, RM_COOLBUFF, 108, 0, 67, nDelay, '[ ò×Ó°Êõ ]\ÀäÈ´Ê±¼ä: '); //ÀºÇü¼ú ÄðÅ¸ÀÓ ¹öÇÁ
    PlayObject.m_wStatusArrValue[73] := 1;
    PlayObject.m_dwStatusArrTimeOutTick[73] := GetTickCount + nDelay * 1000;
  except
    MainOutMessage('EXCEPT ò×Ó°Êõ');
  end;
end;

function TMagicManager.MagShadowAttack(BaseObject, TargeTBaseObject: TBaseObject;
  nTargetX, nTargetY, nLevel: Integer): Boolean; //004926D4
var
  n14:Integer;
begin
  Result:=False;
  BaseObject.SetTargetCreat(TargeTBaseObject);
  TargeTBaseObject.m_TargetCret := nil;
  if (BaseObject.m_TargetCret = nil) and (not BaseObject.m_TargetCret.m_btRaceServer in [RC_PLAYOBJECT,RC_ANIMAL,RC_MONSTER,RC_ARCHERGUARD]) then begin
    Result:=False;
  end else
   Result:=True;
end;

function TMagicManager.MagMakeAngelSlave(PlayObject: TPlayObject;UserMagic:pTUserMagic):Boolean;
var
  sMonName:String;
  nMakeLevel,nExpLevel:Integer;
  dwRoyaltySec:LongWord;
  TempCret : TBaseObject;
begin
  Result:=False;
  TempCret := PlayObject.GetExistSlave( g_Config.sAngel );
  if TempCret <> nil then begin
    TempCret.forcemovetomaster := true;
    exit;
  end else begin
    if not PlayObject.sub_4DD704 then begin
     sMonName:=g_Config.sAngel;
     nMakeLevel:=UserMagic.btLevel;
     nExpLevel:=UserMagic.btLevel;
     dwRoyaltySec:=10 * 24 * 60 * 60;

     if PlayObject.MakeSlave(sMonName,nMakeLevel,nExpLevel,3,dwRoyaltySec) <> nil then
       Result:=True;
    end;
  end;
end;

function TMagicManager.MagMakeDarkAngelSlave(PlayObject: TPlayObject;UserMagic:pTUserMagic):Boolean;
var
  sMonName:String;
  nMakeLevel,nExpLevel:Integer;
  dwRoyaltySec:LongWord;
  TempCret : TBaseObject;
begin
  Result:=False;
  TempCret := PlayObject.GetExistSlave( g_Config.sDarkAngel );
  if TempCret <> nil then begin
    TempCret.forcemovetomaster := true;
    exit;
  end else begin
    if not PlayObject.sub_4DD704 then begin
     sMonName:=g_Config.sDarkAngel;
     nMakeLevel:=UserMagic.btLevel;
     nExpLevel:=UserMagic.btLevel;
     dwRoyaltySec:=10 * 24 * 60 * 60;

     if PlayObject.MakeSlave(sMonName,nMakeLevel,nExpLevel,3,dwRoyaltySec) <> nil then
       Result:=True;
    end;
  end;
end;

function TMagicManager.MagGroupMb(PlayObject:TPlayObject;UserMagic:pTUserMagic;TargeTBaseObject:TBaseObject): Boolean;
var
  I              :Integer;
  BaseObjectList :TList;
  BaseObject     :TBaseObject;
  nTime          :Integer;
begin
  Result:=False;
  BaseObjectList:=TList.Create;
  nTime:= 5 * UserMagic.btLevel + 1;
  PlayObject.GetMapBaseObjects(PlayObject.m_PEnvir,PlayObject.m_nCurrX,PlayObject.m_nCurrY,{UserMagic.btLevel + 2}2,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject:=TBaseObject(BaseObjectList.Items[I]);
    if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) and (not g_Config.boGroupMbAttackPlayObject) then Continue;
    if BaseObject.m_boDeath or (BaseObject.m_boGhost) or (PlayObject = BaseObject) then Continue;
    if PlayObject.IsProperTarget (BaseObject) then begin
      if not BaseObject.m_boUnParalysis and (Random(BaseObject.m_btAntiPoison) = 0) then begin
        if (BaseObject.m_Abil.Level < PlayObject.m_Abil.Level) or (Random(PlayObject.m_Abil.Level - BaseObject.m_Abil.Level) = 0) then begin
          BaseObject.MakePosion(POISON_STONE,nTime,0);
          BaseObject.m_boFastParalysis:=True;
        end;
      end;
    end;
    if (BaseObject.m_btRaceServer >= RC_ANIMAL) then
      Result:=True;
  end;
  FreeAndNil(BaseObjectList);
end;

function  TMagicManager.KnockBack (PlayObject:TBaseObject;nPushLevel: integer): integer; //00492204
var
   i, nDir, {levelgap,} push: integer;
   BaseObject: TBaseObject;
begin
  Result := 0;
  for i:=0 to PlayObject.m_VisibleActors.Count-1 do begin
    BaseObject:= TBaseObject (pTVisibleBaseObject(PlayObject.m_VisibleActors[i]).BaseObject);
    if (abs(PlayObject.m_nCurrX-BaseObject.m_nCurrX) <= 1) and (abs(PlayObject.m_nCurrY-BaseObject.m_nCurrY) <= 1) then begin
      if (not BaseObject.m_boDeath) and (BaseObject <> PlayObject) then begin
        if (PlayObject.m_Abil.Level > BaseObject.m_Abil.Level) and (not BaseObject.m_boStickMode) then begin
          // levelgap := PlayObject.m_Abil.Level - BaseObject.m_Abil.Level;
          // if (Random(20) < 6 + nPushLevel * 3 + levelgap) then begin
          if Random(20) < ((nPushLevel * 4) + 6) then begin
            if PlayObject.IsProperTarget(BaseObject) then begin
              push := nPushLevel + 2;
              nDir:= GetNextDirection (PlayObject.m_nCurrX, PlayObject.m_nCurrY, BaseObject.m_nCurrX, BaseObject.m_nCurrY);
              BaseObject.CharPushed(nDir, push);
              Inc (Result);
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TMagicManager.FlameField(BaseObject:TBaseObject;nPower,nX,nY:Integer;nRage:Integer): Boolean;
var
  I                :Integer;
  BaseObjectList   :TList;
  TargeTBaseObject :TBaseObject;
begin
  Result         := False;
  BaseObjectList := TList.Create;
  BaseObject.GetMapBaseObjects(BaseObject.m_PEnvir,nX,nY,nRage,BaseObjectList);
  for I := 0 to BaseObjectList.Count - 1 do begin
    TargeTBaseObject:=TBaseObject(BaseObjectList.Items[i]);
    if BaseObject.IsProperTarget(TargeTBaseObject) then begin
      BaseObject.SetTargetCreat(TargeTBaseObject);
      TargeTBaseObject.SendMsg(BaseObject,RM_MAGSTRUCK,0,nPower,0,0,'');
      Result:=True;
    end;
  end;
  FreeAndNil(BaseObjectList);
end;


function TMagicManager.IceShot(PlayObject: TPlayObject;     //ºù³úÃµ
  UserMagic: pTUserMagic; nTargetX, nTargetY: Integer; TargeTBaseObject: TBaseObject): Boolean;
var
  I: Integer;
  BaseObjectList: TList;
  BaseObject: TBaseObject;
  nPower: Integer;
begin
  Result := False;
  nPower := 0;

  BaseObjectList := TList.Create;
  PlayObject.GetMapBaseObjects(PlayObject.m_PEnvir, nTargetX, nTargetY, 2 , BaseObjectList);


  for I := 0 to BaseObjectList.Count - 1 do begin
    BaseObject := TBaseObject(BaseObjectList.Items[I]);
    if BaseObject.m_boDeath or (BaseObject.m_boGhost) or (PlayObject = BaseObject) then Continue;
    if PlayObject.IsProperTarget(BaseObject) then begin
        nPower:= PlayObject.GetAttackPower(GetPower(MPow(UserMagic), UserMagic) + LoWord(PlayObject.m_WAbil.MC),
                            Integer(HiWord(PlayObject.m_WAbil.MC) - LoWord(PlayObject.m_WAbil.MC)) + 1);

        if BaseObject.m_btLifeAttrib = LA_UNDEAD then
          nPower := Round(nPower * 1.5);

        PlayObject.SendDelayMsg(PlayObject,RM_DELAYMAGIC,nPower,MakeLong(BaseObject.m_nCurrX,BaseObject.m_nCurrY),1,Integer(BaseObject),'',0);

        if (Random(20) < UserMagic.btLevel + 4) and (Random(BaseObject.m_btAntiPoison) = 0) then begin
          BaseObject.MakePosion(POISON_SLOWDOWN,(UserMagic.btLevel + 1) * 3,0);
        end;
        if (Random(45) < UserMagic.btLevel + 4) and (Random(BaseObject.m_btAntiPoison) = 0)  then begin
          BaseObject.MakePosion(POISON_FREEZE,(UserMagic.btLevel + 1) * 3,0);
        end;
        PlayObject.SetTargetCreat(BaseObject);
        if BaseObject.m_btRaceServer >= RC_ANIMAL then Result:=True;
    end;
  end;


  FreeAndNil(BaseObjectList);
end;

function TMagicManager.MagMakeUnTreatment(PlayObject: TBaseObject; //Á¤È­¼ú
  UserMagic: pTUserMagic; var TargeTBaseObject: TBaseObject): Boolean;
begin
  Result := False;

  if PlayObject.IsProperFriend (TargeTBaseObject) then begin
       if Random(5) - (UserMagic.btLevel + 1) < 0 then begin
          if TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_DECHEALTH] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_SLOWDOWN] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_SLOWDOWN] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_DAMAGEARMOR] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_DAMAGEARMOR] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_STONE] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_STUN] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_FREEZE] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_THUNDER] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_THUNDER] := 1;
             Result := True;
          end;
          if TargeTBaseObject.m_wStatusTimeArr[POISON_HEMORRHAGE] <> 0 then begin
             TargeTBaseObject.m_wStatusTimeArr[POISON_HEMORRHAGE] := 1;
             Result := True;
          end;
      end;
  end;
end;



{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Magic.pas 594 2007-03-09 15:00:12Z damian $');
end.

