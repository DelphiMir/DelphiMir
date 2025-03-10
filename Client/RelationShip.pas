unit Relationship;

interface

uses
  Classes, SysUtils, grobal2, Windows, HUtil32;

const
  MAX_LOVERCOUNT = 1;
  MAX_MENTORCOUNT = 1;
  STR_LOVER      = '°®    ÈË: ';
  STR_LOVER_STARTDAY = '½á»éÊ±¼ä: ';
  STR_LOVER_DAYCOUNT = '½á»éÌìÊý: ';

  STR_MENTOR    = ' ';
  STR_PUPIL     = ' ';
  STR_MINFO     = ' ';
  STR_PINFO     = ' ';
type

  TRelationShipInfo = class
  private
    FOwnner:  string;      // ¼ÒÀ¯ÀÚ ÀÌ¸§
    FName:    string;      // µî·ÏÀÚ ÀÌ¸§
    FState:   byte;        // µî·Ï»óÅÂ
    FLevel:   byte;        // ·¹º§
    FSex:     byte;        // ¼ºº°
    FDate:    string;      // µî·Ï³¯Â¥
    FServerDate: string;   // ¼­¹ö³¯Â¥
    FMapInfo: string;      // ¸ÊÁ¤º¸

  public
    constructor Create;
    destructor Destroy; override;

    // ³»ºÎ ¸â¹öÁ¢±Ù¿ë ÇÁ·ÎÆÛÆ¼
    property Ownner: string Read FOwnner Write FOwnner;
    property Name: string Read FName Write FName;
    property State: byte Read FState Write FState;
    property Level: byte Read FLevel Write FLevel;
    property Sex: byte Read FSex Write FSex;
    property Date: string Read FDate Write FDate;
    property ServerDate: string Read FServerDate Write FServerDate;
    property MapInfo: string Read FMapInfo Write FMapInfo;

  end;

  PTRelationShipInfo = ^TRelationShipInfo;


  TRelationShipMgr = class
  private
    FItems:      TList;
    FEnableJoinLover: boolean;
    FReqSequence: integer;
    FCancelTime: longword;
    FLoverCount: integer;
    fDisplayStr: TStringList;

    procedure RemoveAll;

    function GetReqSequence: integer;
    procedure SetReqSequence(Sequence: integer);
    function GetDayStr(datestr: string; delimeter: string): string;
    function GetDayNow(datestr: string; serverdatestr: string): string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    // Ã£±â
    function GetInfo(Name_: string; var Info_: TRelationShipInfo): boolean;
    function Find(Name_: string): boolean;


    // Ãß°¡
    function Add(Ownner_: string; Other_: string; State_: byte;
      Level_: byte; Sex_: byte; Date_: string; ServerDate_: string;
      MapInfo_: string): boolean;
    // »èÁ¦
    function Delete(Name_: string): boolean;
    // ·¹º§º¯°æ
    function ChangeLevel(Name_: string; Level_: byte): boolean;

    function GetEnableJoin(ReqType: integer): boolean;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetDisplay(Line: integer): string;
    function GetName(ReqType: integer): string;
    // µð½ºÇÃ·¹ÀÌ °Û½Å
    procedure MakeDisplay;

    // Request sequence Ã³¸®
    property ReqSequence: integer Read GetReqSequence Write SetReqSequence;

  end;





  TMentorShipInfo = class
  private
    FOwnner:  string;      // ¼ÒÀ¯ÀÚ ÀÌ¸§
    FName:    string;      // µî·ÏÀÚ ÀÌ¸§
    FState:   byte;        // µî·Ï»óÅÂ

    FLevel:   byte;       // ·¹º§
    FJob:     byte;       // Á÷¾÷

    FDate:    string;      // µî·Ï³¯Â¥
    FServerDate: string;   // ¼­¹ö³¯Â¥

    FMode:    byte;      // ½º½Â? Á¦ÀÚ

    FOnline:  byte;        // »ó´ë Á¢¼Ó


  public
    constructor Create;
    destructor Destroy; override;

    // ³»ºÎ ¸â¹öÁ¢±Ù¿ë ÇÁ·ÎÆÛÆ¼
    property Ownner: string Read FOwnner Write FOwnner;
    property Name: string Read FName Write FName;
    property State: byte Read FState Write FState;

    property Level: byte Read FLevel Write FLevel;
    property Job: byte Read FJob Write FJob;

    property Date: string Read FDate Write FDate;
    property ServerDate: string Read FServerDate Write FServerDate;

    property Mode: byte Read FMode Write FMode;
    property Online: byte Read FOnline Write FOnline;

  end;

  PTMentorShipInfo = ^TRelationShipInfo;


  TMentorShipMgr = class
  private
    FItems:      TList;
    FEnableJoinMentor: boolean;
    FReqSequence: integer;
    FCancelTime: longword;
    FMentorCount: integer;
    fDisplayStr: TStringList;

    procedure RemoveAll;

    function GetReqSequence: integer;
    procedure SetReqSequence(Sequence: integer);
    function GetDayStr(datestr: string; delimeter: string): string;
    function GetDayNow(datestr: string; serverdatestr: string): string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    // Ã£±â
    function GetInfo(Name_: string; var Info_: TMentorShipInfo): boolean;
    function Find(Name_: string): boolean;


    // Ãß°¡
    function Add(Ownner_: string; Other_: string; State_: byte; Level_: byte; Job_: byte;
     Date_: string; ServerDate_: string;  Mode_: byte; Online_: byte): boolean;

    function Change(Other_: string; Level_: byte; Job_: byte; Online_: byte): boolean;

    // »èÁ¦
    function Delete(Name_: string): boolean;

    function GetEnableJoin(ReqType: integer): boolean;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetDisplay(Line: integer): string;
    function GetName(ReqType: integer): string;

    function GetMode: integer;

    // µð½ºÇÃ·¹ÀÌ °Û½Å
    procedure MakeDisplay;

    // Request sequence Ã³¸®
    property ReqSequence: integer Read GetReqSequence Write SetReqSequence;

  end;



implementation

uses
  MShare;

// TRealtionShipInfo ===========================================================
constructor TRelationShipInfo.Create;
begin
  inherited;
  //TO DO Initialize
  FOwnner  := '';
  FName    := '';
  FState   := 0;
  FLevel   := 0;
  FSex     := 0;
  FDate    := '';
  FServerDate := '';
  FMapInfo := '';
end;

destructor TRelationShipInfo.Destroy;
begin
  // TO DO Free Mem

  inherited;
end;

// TRealtionShipMgr ============================================================
constructor TRelationShipMgr.Create;
begin
  inherited;
  //TO DO Initialize
  FItems      := TList.Create;
  fDisplayStr := TStringList.Create;
end;

destructor TRelationShipMgr.Destroy;
begin
  // TO DO Free Mem
  RemoveAll;
  FItems.Free;

  fDisplayStr.Free;
  inherited;
end;

procedure TRelationShipMgr.Clear;
begin
  RemoveAll;
  FEnableJoinLover := False;
  FReqSequence     := rsReq_None;
  FCancelTime      := 0;
  FLoverCount      := 0;
  fDisplayStr.Clear;

  MakeDisplay;
end;

procedure TRelationShipMgr.RemoveAll;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Info.Free;
      Info := nil;
    end;
  end;

  FItems.Clear;
end;

function TrelationShipMgr.GetReqSequence: integer;
begin
  if (FcancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    // ÁöÁ¤ÇÑ ½Ã°£ ³»¿¡ Àß ÀÀ´ä ÇßÀ½
    ;
  end else begin
    // ½Ã°£ÀÌ ³Ê¹« ¿À·¡ Áö³µÀ¸¹Ç·Î ¹«È¿
    FReqSequence := RsReq_None;
  end;

  Result := FReqSequence;
end;

procedure TrelationShipMgr.SetReqSequence(Sequence: integer);
begin
  if (FCancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    FReqSequence := Sequence;
  end else begin
    // ½Ã°£ÀÌ ³Ê¹« ¿À·¡ Áö³µÀ¸¹Ç·Î ¹«È¿
    FReqSequence := RsReq_None;
  end;
  FCancelTime := GetTickCount;
end;


function TrelationShipMgr.GetDayStr(datestr: string; delimeter: string): string;
begin
  Result := '';
  if length(datestr) >= 6 then begin
    Result := '20' + datestr[1] + datestr[2] + delimeter + datestr[3] +
      datestr[4] + delimeter + datestr[5] + datestr[6];
  end;

end;

function TRelationShipMgr.GetDayNow(datestr: string; serverdatestr: string): string;
var
  str, strtemp: string;
  exdate, extime, exdatetime, exdatetime2: TDateTime;
  cYear, cMon, cDay, cHour, cMin, cSec, cMSec: word;
begin
  Result := '0';
  //      exit;
  try
    str := GetDayStr(datestr, '-');

    str   := GetValidStr3(str, strtemp, ['-']);
    cYear := word(StrToInt(strtemp));
    str   := GetValidStr3(str, strtemp, ['-']);
    cMon  := word(StrToInt(strtemp));
    cDay  := word(StrToInt(str));

    cHour := 0;
    cMin  := 0;
    cSec  := 0;
    cMSec := 0;

    exdate     := Trunc(EncodeDate(cYear, cMon, cDay));
    extime     := EncodeTime(cHour, cMin, cSec, cMSec);
    exdatetime := exdate + extime + 1;


    str := GetDayStr(serverdatestr, '-');

    str   := GetValidStr3(str, strtemp, ['-']);
    cYear := word(StrToInt(strtemp));
    str   := GetValidStr3(str, strtemp, ['-']);
    cMon  := word(StrToInt(strtemp));
    cDay  := word(StrToInt(str));

    cHour := 0;
    cMin  := 0;
    cSec  := 0;
    cMSec := 0;

    exdate      := Trunc(EncodeDate(cYear, cMon, cDay));
    extime      := EncodeTime(cHour, cMin, cSec, cMSec);
    exdatetime2 := exdate + extime + 1;

    Result := IntToStr(Trunc(exdatetime2 - exdatetime) + 1);
  except
    Result := '0';
  end;

end;

procedure TrelationShipMgr.MakeDisplay;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  fDisplayStr.Clear;
  fDisplayStr.Add(STR_LOVER);
  fDisplayStr.Add(STR_LOVER_STARTDAY);
  fDisplayStr.Add(STR_LOVER_DAYCOUNT);

  for i := 0 to FItems.Count - 1 do begin
    Info := Fitems[i];
    if Info <> nil then begin
      if Info.State = RsState_Lover then begin
        fDisplayStr[0] := STR_LOVER + Info.Name;
        fDisplayStr[1] := STR_LOVER_STARTDAY + GetDayStr(Info.Date, '/');
        fDisplayStr[2] :=
          STR_LOVER_DAYCOUNT + GetDayNow(Info.Date, Info.ServerDate);
      end;
    end;
  end;

end;

// Âü°¡ ¿©ºÎ °áÁ¤
function TrelationShipMgr.GetEnableJoin(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Lover: if fEnableJoinLover and (fLoverCount < MAX_LOVERCOUNT) then
        Result := True;
  end;

end;

// Âü°¡ ¿©ºÎ °áÁ¤
function TrelationShipMgr.GetEnableJoinReq(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Lover: if fEnableJoinLover and (fLoverCount < MAX_LOVERCOUNT) then
        Result := True;
  end;

end;

procedure TrelationShipMgr.SetEnable(ReqType: integer; enable: integer);
begin
  case ReqType of
    RsState_Lover: begin
      if enable = 1 then
        FEnableJoinLover := True
      else
        FEnableJoinLover := False;
    end;
  end;
end;


function TrelationShipMgr.GetEnable(ReqType: integer): integer;
begin
  Result := 0;

  case ReqType of
    RsState_Lover: begin
      if FEnableJoinLover then
        Result := 1
      else
        Result := 0;
    end;
  end;
end;

function TrelationShipMgr.GetDisplay(Line: integer): string;
begin
  Result := '';
  if fDisplayStr.Count > Line then
    Result := fDisplayStr[Line];
end;

function TrelationShipMgr.GetName(ReqType: integer): string;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  Result := '';
  for i := 0 to fItems.Count - 1 do begin
    Info := FITems[i];
    if (Info <> nil) and (Info.State = ReqType) then begin
      Result := Info.Name;
      Exit;
    end;
  end;
end;

// Get Infomation...
function TrelationShipMgr.GetInfo(Name_: string; var Info_: TRelationShipInfo): boolean;
var
  i:    integer;
  Info: TrelationShipInfo;
begin
  Result := False;
  Info_  := nil;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];
    if (Info <> nil) and (Info.Name = Name_) then begin
      Info_  := Info;
      Result := True;
      Exit;
    end;
  end;
end;

function TRelationShipMgr.Find(Name_: string): boolean;
var
  Info: TRelationShipInfo;
begin
  Result := GetInfo(Name_, Info);
end;

function TRelationShipMgr.Add(Ownner_: string; Other_: string;
  State_: byte; Level_: byte; Sex_: byte; Date_: string; ServerDate_: string;
  MapInfo_: string): boolean;
var
  Info: TRelationShipInfo;
begin
  Result := False;

  // µ¥ÀÌÅÍ Ã¼Å©
  if (Ownner_ = '') or (Other_ = '') or (Level_ = 0) then
    Exit;

  // ½Ã°£ÀÌ ¾ø´Ù¸é ÇöÀç½Ã°£À¸·Î ³Ö¾îÁØ´Ù.
  if (Date_ = '') then begin
    Date_ := FormatDateTime('yymmddhhnn', Now);
  end;

  // µî·ÏµÇ¾îÀÖÁö ¾ÊÀº »ç¶÷ÀÌ¶ó¸é µî·ÏÇÑ´Ù.
  Info := nil;
  if not Find(Other_) then begin
    Info := TRelationShipInfo.Create;

    Info.Ownner  := Ownner_;
    Info.Name    := Other_;
    Info.State   := State_;
    Info.Level   := Level_;
    Info.Sex     := Sex_;
    Info.Date    := Date_;
    Info.ServerDate := ServerDate_;
    Info.Mapinfo := MapInfo_;

    FItems.Add(Info);

    case State_ of
      RsState_Lover: Inc(fLoverCount);
    end;

    Result := True;
    MakeDisplay;

  end;
end;

function TRelationShipMgr.Delete(Name_: string): boolean;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  Result := False;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];
    if (Info <> nil) and (Info.Name = Name_) then begin
      Info.Free;
      Info := nil;
      FItems.Delete(i);
      Result := True;
      MakeDisplay;
      Exit;
    end;
  end;

end;

function TRelationShipMgr.ChangeLevel(Name_: string; Level_: byte): boolean;
var
  Info: TRelationShipInfo;
begin
  Result := False;
  // ·¹º§ÀÌ 0 º¸´Ù Å©°í
  if Level_ > 0 then begin
    // Á¤º¸¸¦ ¾ò¾î¼­
    if GetInfo(Name_, Info) then begin
      // ·¹º§º¯°æ
      if Info <> nil then begin
        Info.Level := Level_;
        Result     := True;
        MakeDisplay;
      end;
    end;

  end;

end;










// TMentorShipInfo ===========================================================
constructor TMentorShipInfo.Create;
begin
  inherited;
  //TO DO Initialize
  FOwnner  := '';
  FName    := '';
  FState   := 0;

  FLevel  := 0;
  FJob    := 0;

  FDate    := '';
  FServerDate := '';

  FMode    := 0;

  FOnline  := 0;
end;

destructor TMentorShipInfo.Destroy;
begin
  // TO DO Free Mem

  inherited;
end;

// TMentorShipMgr ============================================================
constructor TMentorShipMgr.Create;
begin
  inherited;
  //TO DO Initialize
  FItems      := TList.Create;
  fDisplayStr := TStringList.Create;
end;

destructor TMentorShipMgr.Destroy;
begin
  // TO DO Free Mem
  RemoveAll;
  FItems.Free;

  fDisplayStr.Free;
  inherited;
end;

procedure TMentorShipMgr.Clear;
begin
  RemoveAll;
  FEnableJoinMentor := False;
  FReqSequence     := rsReq_None;
  FCancelTime      := 0;
  FMentorCount      := 0;
  fDisplayStr.Clear;

  MakeDisplay;
end;

procedure TMentorShipMgr.RemoveAll;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Info.Free;
      Info := nil;
    end;
  end;

  FItems.Clear;
end;

function TMentorShipMgr.GetReqSequence: integer;
begin
  if (FcancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    // ÁöÁ¤ÇÑ ½Ã°£ ³»¿¡ Àß ÀÀ´ä ÇßÀ½
    ;
  end else begin
    // ½Ã°£ÀÌ ³Ê¹« ¿À·¡ Áö³µÀ¸¹Ç·Î ¹«È¿
    FReqSequence := RsReq_None;
  end;

  Result := FReqSequence;
end;

procedure TMentorShipMgr.SetReqSequence(Sequence: integer);
begin
  if (FCancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    FReqSequence := Sequence;
  end else begin
    // ½Ã°£ÀÌ ³Ê¹« ¿À·¡ Áö³µÀ¸¹Ç·Î ¹«È¿
    FReqSequence := RsReq_None;
  end;
  FCancelTime := GetTickCount;
end;


function TMentorShipMgr.GetDayStr(datestr: string; delimeter: string): string;
begin
  Result := '';
  if length(datestr) >= 6 then begin
    Result := '20' + datestr[1] + datestr[2] + delimeter + datestr[3] +
      datestr[4] + delimeter + datestr[5] + datestr[6];
  end;

end;

function TMentorShipMgr.GetDayNow(datestr: string; serverdatestr: string): string;
var
  str, strtemp: string;
  exdate, extime, exdatetime, exdatetime2: TDateTime;
  cYear, cMon, cDay, cHour, cMin, cSec, cMSec: word;
begin
  Result := '0';

  try
    str := GetDayStr(datestr, '-');

    str   := GetValidStr3(str, strtemp, ['-']);
    cYear := word(StrToInt(strtemp));
    str   := GetValidStr3(str, strtemp, ['-']);
    cMon  := word(StrToInt(strtemp));
    cDay  := word(StrToInt(str));

    cHour := 0;
    cMin  := 0;
    cSec  := 0;
    cMSec := 0;

    exdate     := Trunc(EncodeDate(cYear, cMon, cDay));
    extime     := EncodeTime(cHour, cMin, cSec, cMSec);
    exdatetime := exdate + extime + 1;


    str := GetDayStr(serverdatestr, '-');

    str   := GetValidStr3(str, strtemp, ['-']);
    cYear := word(StrToInt(strtemp));
    str   := GetValidStr3(str, strtemp, ['-']);
    cMon  := word(StrToInt(strtemp));
    cDay  := word(StrToInt(str));

    cHour := 0;
    cMin  := 0;
    cSec  := 0;
    cMSec := 0;

    exdate      := Trunc(EncodeDate(cYear, cMon, cDay));
    extime      := EncodeTime(cHour, cMin, cSec, cMSec);
    exdatetime2 := exdate + extime + 1;

    Result := IntToStr(Trunc(exdatetime2 - exdatetime) + 1);
  except
    Result := '0';
  end;

end;

procedure TMentorShipMgr.MakeDisplay;
  function GetJobName(Job:integer): string;
  begin
      Result:='';
      case Job of
        0: Result := 'Õ½Ê¿';
        1: Result := '·¨Ê¦';
        2: Result := 'µÀÊ¿';
        3: Result := '´Ì¿Í';
        4: Result := 'ºÍÉÐ';
        5: Result := '±ÌÑªÕ½Ê¿';
        6: Result := 'ºëÐþ·¨Ê¦';
        7: Result := 'ñ´ÏÉµÀÊ¿';
        8: Result := '·ÉÑà´Ì¿Í';
        9: Result := 'ÆÆ½äÉ®';
      end;
  end;
var
  Info: TMentorShipInfo;
  i:    integer;
  JobName,JobName1: string;
begin
  fDisplayStr.Clear;
  fDisplayStr.Add(STR_MENTOR);
  fDisplayStr.Add(STR_PUPIL);
  fDisplayStr.Add(STR_MINFO);
  fDisplayStr.Add(STR_PINFO);


  for i := 0 to FItems.Count - 1 do begin
    Info := Fitems[i];
    if Info <> nil then begin
      if Info.State = RsState_Master then begin

        if Info.Mode = 1 then begin   //³»°¡ ½º½ÂÀÌ´Ù.
          fDisplayStr[0] := STR_MENTOR + Info.Ownner;

          fDisplayStr[1] := STR_PUPIL + Info.Name;
          fDisplayStr[2] := STR_MINFO + 'Lv '+ intTostr(g_MySelf.m_Abil.Level) + '    ' + GetJobName(g_MySelf.m_btJob);

          if (Info.Online = 0) then begin
           fDisplayStr[3] := STR_PINFO + '(ÀëÏß)';
          end else begin
           fDisplayStr[3] := STR_PINFO + 'Lv '+ intTostr(Info.Level) + '    ' + GetJobName(Info.Job);
          end;

        end else begin   //³»°¡ Á¦ÁöÀÌ´Ù.
          fDisplayStr[0] := STR_MENTOR + Info.Name;

          fDisplayStr[1] := STR_PUPIL + Info.Ownner;

          if (Info.Online = 0) then begin
            fDisplayStr[2] := STR_MINFO + '(ÀëÏß)';
          end else begin
            fDisplayStr[2] := STR_MINFO + 'Lv '+ intTostr(Info.Level) + '    ' + GetJobName(Info.Job);
          end;

          fDisplayStr[3] := STR_PINFO + 'Lv '+ intTostr(g_MySelf.m_Abil.Level) + '    ' + GetJobName(g_MySelf.m_btJob);

        end;


      end;
    end;
  end;

end;

// Âü°¡ ¿©ºÎ °áÁ¤
function TMentorShipMgr.GetEnableJoin(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Master: if FEnableJoinMentor and (FMentorCount < MAX_MENTORCOUNT) then
        Result := True;
  end;

end;

// Âü°¡ ¿©ºÎ °áÁ¤
function TMentorShipMgr.GetEnableJoinReq(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Master: if FEnableJoinMentor and (FMentorCount < MAX_MENTORCOUNT) then
        Result := True;
  end;

end;

procedure TMentorShipMgr.SetEnable(ReqType: integer; enable: integer);
begin
  case ReqType of
    RsState_Master: begin
      if enable = 1 then
        FEnableJoinMentor := True
      else
        FEnableJoinMentor := False;
    end;
  end;
end;


function TMentorShipMgr.GetEnable(ReqType: integer): integer;
begin
  Result := 0;

  case ReqType of
    RsState_Master: begin
      if FEnableJoinMentor then
        Result := 1
      else
        Result := 0;
    end;
  end;
end;

function TMentorShipMgr.GetDisplay(Line: integer): string;
begin
  Result := '';
  if fDisplayStr.Count > Line then
    Result := fDisplayStr[Line];
end;

function TMentorShipMgr.GetName(ReqType: integer): string;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := '';
  for i := 0 to fItems.Count - 1 do begin
    Info := FITems[i];
    if (Info <> nil) and (Info.State = ReqType) then begin
      Result := Info.Name;
      Exit;
    end;
  end;
end;

function TMentorShipMgr.GetMode: integer;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := 0;
  for i := 0 to fItems.Count - 1 do begin
    Info := FITems[i];
    if (Info <> nil)then begin
      Result := Info.Mode;
      Exit;
    end;
  end;
end;


// Get Infomation...
function TMentorShipMgr.GetInfo(Name_: string; var Info_: TMentorShipInfo): boolean;
var
  i:    integer;
  Info: TMentorShipInfo;
begin
  Result := False;
  Info_  := nil;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];
    if (Info <> nil) and (Info.Name = Name_) then begin
      Info_  := Info;
      Result := True;
      Exit;
    end;
  end;
end;



function TMentorShipMgr.Find(Name_: string): boolean;
var
  Info: TMentorShipInfo;
begin
  Result := GetInfo(Name_, Info);
end;


function TMentorShipMgr.Add(Ownner_: string; Other_: string; State_: byte; Level_: byte; Job_: byte;
     Date_: string; ServerDate_: string;  Mode_: byte; Online_: byte): boolean;
var
  Info: TMentorShipInfo;
begin
  Result := False;

  // µ¥ÀÌÅÍ Ã¼Å©
  if (Ownner_ = '') or (Other_ = '') then
    Exit;

  // ½Ã°£ÀÌ ¾ø´Ù¸é ÇöÀç½Ã°£À¸·Î ³Ö¾îÁØ´Ù.
  if (Date_ = '') then begin
    Date_ := FormatDateTime('yymmddhhnn', Now);
  end;

  // µî·ÏµÇ¾îÀÖÁö ¾ÊÀº »ç¶÷ÀÌ¶ó¸é µî·ÏÇÑ´Ù.
  Info := nil;
  if not Find(Other_) then begin
    Info := TMentorShipInfo.Create;

    Info.Ownner  := Ownner_;
    Info.Name    := Other_;
    Info.State   := State_;

    Info.Level  := Level_;
    Info.Job    := Job_;

    Info.Date    := Date_;
    Info.ServerDate := ServerDate_;
    Info.Mode := Mode_;
    Info.Online  := Online_;

    FItems.Add(Info);

    case State_ of
      RsState_Master: Inc(FMentorCount);
    end;

    Result := True;
    MakeDisplay;

  end;
end;




function TMentorShipMgr.Change(Other_: string; Level_: byte; Job_: byte; Online_: byte): boolean;
var
  Info: TMentorShipInfo;
begin
  Result := False;
    // Á¤º¸¸¦ ¾ò¾î¼­
  if GetInfo(Other_, Info) then begin
   if Info <> nil then begin
    Info.Level  := Level_;
    Info.Job    := Job_;
    Info.Online  := Online_;
    Result := True;
    MakeDisplay;
   end;
  end;

end;



function TMentorShipMgr.Delete(Name_: string): boolean;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := False;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];
    if (Info <> nil) and (Info.Name = Name_) then begin
      Info.Free;
      Info := nil;
      FItems.Delete(i);
      Result := True;
      MakeDisplay;
      Exit;
    end;
  end;

end;






end.
