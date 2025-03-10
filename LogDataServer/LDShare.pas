unit LDShare;

interface
uses
  Windows, Messages, SysUtils, LogDataMain;
type
  TCmd = record
    Cmd: Integer;
    Check: Boolean;
    Text: string;
  end;

  TLogData = record
    nIndx: Integer;
    nServerNumber: Integer;
    nServerIndex: Integer;
    nAct: Integer;
    sMapName: string;
    nX: Integer;
    nY: Integer;
    sObjectName: string;
    sItemName: string;
    nCount: Integer;
    boPalyObject: Boolean;
    sActObjectName: string;
    sActSting: string;
    sDate: string;
  end;
  pTLogData = ^TLogData;

var
  sBaseDir: string = '.\BaseDir';
  sServerName: string = '';
  sCaption: string = 'LogDataServer';

  nServerPort: Integer = 10000;
  g_dwGameCenterHandle: THandle;
const
  tLogServer = 2;
procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
function IntToString(nInt: Integer): string;
procedure gethandle;

implementation

uses Grobal2, HUtil32;

procedure gethandle;
var
  nX, nY: Integer;
begin
  g_dwGameCenterHandle := Str_ToInt(ParamStr(1), 0);
  nX := Str_ToInt(ParamStr(2), -1);
  nY := Str_ToInt(ParamStr(3), -1);
  if (nX >= 0) or (nY >= 0) then begin
    FrmLogData.Left := nX;
    FrmLogData.Top := nY;
  end;
end;

function IntToString(nInt: Integer): string;
begin
  if nInt < 10 then Result := '0' + IntToStr(nInt)
  else Result := IntToStr(nInt);
end;

procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  SendData: TCopyDataStruct;
  nParam: Integer;
begin
  nParam := MakeLong(Word(tLogServer), wIdent);
  SendData.cbData := Length(sSendMsg) + 1;
  GetMem(SendData.lpData, SendData.cbData);
  StrCopy(SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle, WM_COPYDATA, nParam, Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;

end.

