unit Relationship;

interface

uses
  Classes, SysUtils, grobal2, Windows, HUtil32;

const
  MAX_LOVERCOUNT = 1;
  MAX_MENTORCOUNT = 1;
  STR_LOVER      = '갖    훙: ';
  STR_LOVER_STARTDAY = '써삯珂쇌: ';
  STR_LOVER_DAYCOUNT = '써삯莖鑒: ';

  STR_MENTOR    = ' ';
  STR_PUPIL     = ' ';
  STR_MINFO     = ' ';
  STR_PINFO     = ' ';
type

  TRelationShipInfo = class
  private
    FOwnner:  string;      // 소유자 이름
    FName:    string;      // 등록자 이름
    FState:   byte;        // 등록상태
    FLevel:   byte;        // 레벨
    FSex:     byte;        // 성별
    FDate:    string;      // 등록날짜
    FServerDate: string;   // 서버날짜
    FMapInfo: string;      // 맵정보

  public
    constructor Create;
    destructor Destroy; override;

    // 내부 멤버접근용 프로퍼티
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
    // 찾기
    function GetInfo(Name_: string; var Info_: TRelationShipInfo): boolean;
    function Find(Name_: string): boolean;


    // 추가
    function Add(Ownner_: string; Other_: string; State_: byte;
      Level_: byte; Sex_: byte; Date_: string; ServerDate_: string;
      MapInfo_: string): boolean;
    // 삭제
    function Delete(Name_: string): boolean;
    // 레벨변경
    function ChangeLevel(Name_: string; Level_: byte): boolean;

    function GetEnableJoin(ReqType: integer): boolean;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetDisplay(Line: integer): string;
    function GetName(ReqType: integer): string;
    // 디스플레이 겡신
    procedure MakeDisplay;

    // Request sequence 처리
    property ReqSequence: integer Read GetReqSequence Write SetReqSequence;

  end;





  TMentorShipInfo = class
  private
    FOwnner:  string;      // 소유자 이름
    FName:    string;      // 등록자 이름
    FState:   byte;        // 등록상태

    FLevel:   byte;       // 레벨
    FJob:     byte;       // 직업

    FDate:    string;      // 등록날짜
    FServerDate: string;   // 서버날짜

    FMode:    byte;      // 스승? 제자

    FOnline:  byte;        // 상대 접속


  public
    constructor Create;
    destructor Destroy; override;

    // 내부 멤버접근용 프로퍼티
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
    // 찾기
    function GetInfo(Name_: string; var Info_: TMentorShipInfo): boolean;
    function Find(Name_: string): boolean;


    // 추가
    function Add(Ownner_: string; Other_: string; State_: byte; Level_: byte; Job_: byte;
     Date_: string; ServerDate_: string;  Mode_: byte; Online_: byte): boolean;

    function Change(Other_: string; Level_: byte; Job_: byte; Online_: byte): boolean;

    // 삭제
    function Delete(Name_: string): boolean;

    function GetEnableJoin(ReqType: integer): boolean;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetDisplay(Line: integer): string;
    function GetName(ReqType: integer): string;

    function GetMode: integer;

    // 디스플레이 겡신
    procedure MakeDisplay;

    // Request sequence 처리
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
    // 지정한 시간 내에 잘 응답 했음
    ;
  end else begin
    // 시간이 너무 오래 지났으므로 무효
    FReqSequence := RsReq_None;
  end;

  Result := FReqSequence;
end;

procedure TrelationShipMgr.SetReqSequence(Sequence: integer);
begin
  if (FCancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    FReqSequence := Sequence;
  end else begin
    // 시간이 너무 오래 지났으므로 무효
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

// 참가 여부 결정
function TrelationShipMgr.GetEnableJoin(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Lover: if fEnableJoinLover and (fLoverCount < MAX_LOVERCOUNT) then
        Result := True;
  end;

end;

// 참가 여부 결정
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

  // 데이터 체크
  if (Ownner_ = '') or (Other_ = '') or (Level_ = 0) then
    Exit;

  // 시간이 없다면 현재시간으로 넣어준다.
  if (Date_ = '') then begin
    Date_ := FormatDateTime('yymmddhhnn', Now);
  end;

  // 등록되어있지 않은 사람이라면 등록한다.
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
  // 레벨이 0 보다 크고
  if Level_ > 0 then begin
    // 정보를 얻어서
    if GetInfo(Name_, Info) then begin
      // 레벨변경
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
    // 지정한 시간 내에 잘 응답 했음
    ;
  end else begin
    // 시간이 너무 오래 지났으므로 무효
    FReqSequence := RsReq_None;
  end;

  Result := FReqSequence;
end;

procedure TMentorShipMgr.SetReqSequence(Sequence: integer);
begin
  if (FCancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    FReqSequence := Sequence;
  end else begin
    // 시간이 너무 오래 지났으므로 무효
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
        0: Result := '濫却';
        1: Result := '랬可';
        2: Result := '돛却';
        3: Result := '늬와';
        4: Result := '뵨��';
        5: Result := '궷沂濫却';
        6: Result := '븍旣랬可';
        7: Result := '奏鉤돛却';
        8: Result := '령邏늬와';
        9: Result := '팎썰��';
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

        if Info.Mode = 1 then begin   //내가 스승이다.
          fDisplayStr[0] := STR_MENTOR + Info.Ownner;

          fDisplayStr[1] := STR_PUPIL + Info.Name;
          fDisplayStr[2] := STR_MINFO + 'Lv '+ intTostr(g_MySelf.m_Abil.Level) + '    ' + GetJobName(g_MySelf.m_btJob);

          if (Info.Online = 0) then begin
           fDisplayStr[3] := STR_PINFO + '(잼窟)';
          end else begin
           fDisplayStr[3] := STR_PINFO + 'Lv '+ intTostr(Info.Level) + '    ' + GetJobName(Info.Job);
          end;

        end else begin   //내가 제지이다.
          fDisplayStr[0] := STR_MENTOR + Info.Name;

          fDisplayStr[1] := STR_PUPIL + Info.Ownner;

          if (Info.Online = 0) then begin
            fDisplayStr[2] := STR_MINFO + '(잼窟)';
          end else begin
            fDisplayStr[2] := STR_MINFO + 'Lv '+ intTostr(Info.Level) + '    ' + GetJobName(Info.Job);
          end;

          fDisplayStr[3] := STR_PINFO + 'Lv '+ intTostr(g_MySelf.m_Abil.Level) + '    ' + GetJobName(g_MySelf.m_btJob);

        end;


      end;
    end;
  end;

end;

// 참가 여부 결정
function TMentorShipMgr.GetEnableJoin(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Master: if FEnableJoinMentor and (FMentorCount < MAX_MENTORCOUNT) then
        Result := True;
  end;

end;

// 참가 여부 결정
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

  // 데이터 체크
  if (Ownner_ = '') or (Other_ = '') then
    Exit;

  // 시간이 없다면 현재시간으로 넣어준다.
  if (Date_ = '') then begin
    Date_ := FormatDateTime('yymmddhhnn', Now);
  end;

  // 등록되어있지 않은 사람이라면 등록한다.
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
    // 정보를 얻어서
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
