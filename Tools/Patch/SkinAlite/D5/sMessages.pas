unit sMessages;
{In this file defined messages for grouped operations }

{$I sDefs.inc}

interface

uses Messages, Graphics, sStyleUtil, sSkinManager,
  {$IFNDEF ALITE}
    sEditorsManager, sControlsManager,
  {$ENDIF}
  Controls, ExtCtrls, sConst;

const

  //UNIVERSAL MESSAGES -----------------------------------
  SM_OFFSET                     = $A000;
  SM_GETSTYLEINFO               = SM_OFFSET;
  SM_SETBGCHANGED               = WM_USER + SM_OFFSET + 1;

  SM_SETNEWSKIN                 = WM_USER + SM_OFFSET + 2;
  SM_REMOVESKIN                 = WM_USER + SM_OFFSET + 3;
  SM_CLEARINDEXES               = WM_USER + SM_OFFSET + 4;

  SM_GETSSTYLE                  = WM_USER + SM_OFFSET + 5;
  SM_GETPROVIDER                = WM_USER + SM_OFFSET + 6;
  SM_REFRESH                    = WM_USER + SM_OFFSET + 7;
  SM_GETCACHE                   = WM_USER + SM_OFFSET + 8;

  SM_UPDATESECTION              = WM_USER + SM_OFFSET + 9;
  SM_REPAINTSMOOTH              = WM_USER + SM_OFFSET + 10;
  SM_BGCHANGED                  = WM_USER + SM_OFFSET + 11;
  SM_CTRLHANDLED                = WM_USER + SM_OFFSET + 12;
  SM_DROPPEDDOWN                = WM_USER + SM_OFFSET + 13;
  SM_UPDATING                   = WM_USER + SM_OFFSET + 14;
  SM_CACHEREADY                 = WM_USER + SM_OFFSET + 15;
  SM_STOPFADING                 = WM_USER + SM_OFFSET + 16;
  SM_PREPARING                  = WM_USER + SM_OFFSET + 17;

  SM_SHARED                     = WM_USER + SM_OFFSET + 20;
  // EDITORS ---------------------------------------------
  EM_SETSOFT                    = WM_USER + SM_OFFSET + 21;
  // Painting
  EM_SETCOLOR                   = WM_USER + SM_OFFSET + 31;
  EM_SETBORDERTOP               = WM_USER + SM_OFFSET + 33;
  EM_SETBORDERBOTTOM            = WM_USER + SM_OFFSET + 34;
  EM_SETBEVEL                   = WM_USER + SM_OFFSET + 35;
  // Selection
  EM_SETCOLORHOT                = WM_USER + SM_OFFSET + 36;
  EM_SETBEVELWIDTHHOT           = WM_USER + SM_OFFSET + 37;
  EM_SETBEVELHOT                = WM_USER + SM_OFFSET + 38;
  // Shadow
  EM_SETSHADOWENABLED           = WM_USER + SM_OFFSET + 41;
  EM_SETCOLORSHADOW             = WM_USER + SM_OFFSET + 42;
  EM_SHADOWTRANSPARENCY         = WM_USER + SM_OFFSET + 43;
  EM_SHADOWOFFSET               = WM_USER + SM_OFFSET + 44;
  EM_SHADOWBLUR                 = WM_USER + SM_OFFSET + 45;
  EM_UPDATESHADOWS              = WM_USER + SM_OFFSET + 46;
  // -----------------------------------------------------
  EM_CHANGEALL                  = WM_USER + SM_OFFSET + 50;
  // CONTROLS --------------------------------------------
  CM_SETSOFT                    = WM_USER + SM_OFFSET + 51;
  // Painting
  CM_SETCOLOR                   = WM_USER + SM_OFFSET + 61;
  CM_SETBEVEL                   = WM_USER + SM_OFFSET + 62;
  CM_SETTRANSPARENCY            = WM_USER + SM_OFFSET + 63;

  // Background
  CM_SETPATTERN                 = WM_USER + SM_OFFSET + 71;
  // Shadow
  CM_SETSHADOWENABLED           = WM_USER + SM_OFFSET + 81;
  CM_SETCOLORSHADOW             = WM_USER + SM_OFFSET + 82;
  CM_SHADOWTRANSPARENCY         = WM_USER + SM_OFFSET + 83;
  CM_SHADOWOFFSET               = WM_USER + SM_OFFSET + 84;
  CM_SHADOWBLUR                 = WM_USER + SM_OFFSET + 85;
  CM_UPDATESHADOWS              = WM_USER + SM_OFFSET + 86;
  // -----------------------------------------------------
  CM_CHANGEALL                  = WM_USER + SM_OFFSET + 100;
  SM_LAST                       = WM_USER + SM_OFFSET + 100;
  /////////////////////////////////////////////////////////

  // Reserved groupindexes
  GI_START                      = 20;
  GI_FORPANELPATTERN            = 21; 

type                                  

  TSMessage = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Result: Longint;
  end;

  TSMGetSStyle = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    SStyle: Pointer;
    Result: Longint;
  end;

  TSMSetFont = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: Longint;
    Result: Longint;
  end;

  TSMSetColor = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: TColor;
    Result: Longint;
  end;

  TSMSetString = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: string;
    Result: Longint;
  end;

  TSMSetInteger = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: Longint;
    Result: Longint;
  end;

  TSMSetBoolean = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: LongBool;
    Result: Longint;
  end;

  TSMGetStyleInfo = packed record
    Msg: Cardinal;
    WParam: Longint;
    LParam: Longint;
    Result: Longint; // sPaintStyle - 1,
                     // sPassiveBGStyle - 2,
                     // ... reserved
                     // sCustomStyle - 4,
                     // sStyle - 5,
                     // sStyleDB - 6
  end;

  TSMSkin = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    SkinManager: TsSkinManager;
    Result: Longint;
  end;

  {$IFNDEF ALITE}
  TEMChangeAll = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    sStyleControl: TsEditorsManager;
    Result: Longint;
  end;

  TCMChangeAll = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    sStyleControl: TsControlsManager;
    Result: Longint;
  end;
  TSMChangeEditors = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    sStyleControl: TsEditorsManager;
    Result: Longint;
  end;

  TSMSetBground = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    sBackground: TsControlBackground;
    Result: Longint;
  end;
  {$ENDIF}

  TSMSetBevel = packed record
    Msg: Cardinal;
    GroupIndex: Longint;
    Value: Longint;
    Result: Longint;
  end;

function sMsgToString(i : integer) : string;

implementation

function sMsgToString(i : integer) : string;
begin
  case i of

    SM_OFFSET              : Result := 'SM_OFFSET / SM_GETSTYLEINFO';
    SM_LAST                : Result := 'SM_LAST'
    else                     Result := 'UNKNOWN';
  end;
end;

end.
