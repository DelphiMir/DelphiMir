unit Relationship;

interface

uses
  Classes, SysUtils, grobal2, Windows, HUtil32, Dialogs;

const
  MAX_LOVERCOUNT = 1;
  MAX_MENTORCOUNT = 1;

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

    //현재날짜를 포멧에 맞게 변화시킨다.
    function GetNowDate: string;

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
    procedure RemoveAll;

    function GetReqSequence: integer;
    procedure SetReqSequence(Sequence: integer);
    function GetDayStr(datestr, delimeter: string): string;
    function GetDayNow(datestr, serverdatestr: string): string;
  public
    constructor Create;
    destructor Destroy; override;


    // 찾기
    function GetInfo(Name_: string; var Info_: TRelationShipInfo): boolean;
    function Find(Name_: string): boolean;

    // 추가
    function Add(Ownner_: string; Other_: string; State_: byte;
      Level_: byte; Sex_: byte; var Date_: string; MapInfo_: string): boolean;
    // 삭제
    function Delete(Name_: string): boolean;
    // 레벨변경
    function ChangeLevel(Name_: string; Level_: byte): boolean;

    function GetEnableJoin(ReqType: integer): integer;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetListMsg(ReqType: integer; var ListCount: integer): string;

    // Request sequence 처리
    property ReqSequence: integer Read GetReqSequence Write SetReqSequence;
    property EnableJoinLover: boolean Read FEnableJoinLover;
    function GetLoverCount: integer;
    function GetLoverName: string;
    function GetLoverDays: string;
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

    //현재날짜를 포멧에 맞게 변화시킨다.
    function GetNowDate: string;

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

  PTMentorShipInfo = ^TMentorShipInfo;


  TMentorShipMgr = class
  private
    FItems:      TList;
    FEnableJoinMentor: boolean;
    FReqSequence: integer;
    FCancelTime: longword;
    FMentorCount: integer;
    procedure RemoveAll;

    function GetReqSequence: integer;
    procedure SetReqSequence(Sequence: integer);
    function GetDayStr(datestr, delimeter: string): string;
    function GetDayNow(datestr, serverdatestr: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    // 찾기
    function GetInfo(Name_: string; var Info_: TMentorShipInfo): boolean;
    function Find(Name_: string): boolean;

    // 추가
    function Add(Ownner_: string; Other_: string; State_: byte; Level_: byte;
      Job_: byte;  Mode_: byte; Online_: byte; var Date_: string): boolean;

    //변경
    function Change(Other_: string; Level_: byte; Job_: byte; Online_: byte): boolean;

    // 삭제
    function Delete(Name_: string): boolean;

    function GetEnableJoin(ReqType: integer): integer;
    function GetEnableJoinReq(ReqType: integer): boolean;
    procedure SetEnable(ReqType: integer; Enable: integer);
    function GetEnable(ReqType: integer): integer;
    function GetListMsg(ReqType: integer; var ListCount: integer): string;

    // Request sequence 처리
    property ReqSequence: integer Read GetReqSequence Write SetReqSequence;
    property EnableJoinMentor: boolean Read FEnableJoinMentor;
    function GetMentorCount: integer;
    function GetMentorName: string;
    function GetMentorDays: string;

    function GetLevel: integer;
    function GetJob: integer;

    function GetMode: Byte;

  end;

implementation

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
  FDate    := GetNowDate;
  FMapInfo := '';
  FServerDate := GetNowDate;
end;

destructor TRelationShipInfo.Destroy;
begin
  // TO DO Free Mem

  inherited;
end;

// 현재날짜를 포멧에 맞게 변환시킨다.
function TRelationShipInfo.GetNowDate: string;
begin
  Result := FormatDateTime('yymmddhhnn', Now);
end;

// TRealtionShipMgr ============================================================
constructor TRelationShipMgr.Create;
begin
  inherited;
  //TO DO Initialize
  FItems      := TList.Create;
  FEnableJoinLover := False;
  FReqSequence := rsReq_None;
  FCancelTime := 0;
  FLoverCount := 0;

end;

destructor TRelationShipMgr.Destroy;
begin
  // TO DO Free Mem
  RemoveAll;
  FItems.Free;

  inherited;
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

function TRelationShipMgr.GetReqSequence: integer;
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

procedure TRelationShipMgr.SetReqSequence(Sequence: integer);
begin
  if (FCancelTime = 0) or ((GetTickCount - FCancelTime) <= MAX_WAITTIME) then begin
    FReqSequence := Sequence;
  end else begin
    // 시간이 너무 오래 지났으므로 무효
    FReqSequence := RsReq_None;
  end;
  FCancelTime := GetTickCount;
end;


function TRelationShipMgr.GetDayStr(datestr: string; delimeter: string): string;
begin
  Result := '';
  if length(datestr) >= 6 then begin
    Result := '20' + datestr[1] + datestr[2] + delimeter + datestr[3] +
      datestr[4] + delimeter + datestr[5] + datestr[6];
  end;

end;

function TRelationShipMgr.GetDayNow(datestr: string; serverdatestr: string): string;
var
  //    date        : TDateTime;
  //    serverdate  : TDateTime;
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

// 참가 여부 결정
function TRelationShipMgr.GetEnableJoin(ReqType: integer): integer;
begin
  Result := 3;   //실패(기타)

  case ReqType of
    RsState_Lover: begin
      //실패(교제가능 상태가 아님)
      if not fEnableJoinLover then begin
        Result := 1;
        exit;
      end;
      if fLoverCount < MAX_LOVERCOUNT then begin
        //성공
        Result := 0;
        exit;
      end else begin
        //실패(이미 연인이 있음)
        Result := 2;
        exit;
      end;
    end;
  end;

end;

// 참가 여부 결정
function TRelationShipMgr.GetEnableJoinReq(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Lover: if fEnableJoinLover and (fLoverCount < MAX_LOVERCOUNT) then
        Result := True;
  end;

end;

procedure TRelationShipMgr.SetEnable(ReqType: integer; enable: integer);
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


function TRelationShipMgr.GetEnable(ReqType: integer): integer;
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

function TRelationShipMgr.GetListMsg(ReqType: integer; var ListCount: integer): string;
var
  i:    integer;
  Info: TRelationShipInfo;
  msg:  string;
begin
  ListCount := 0;
  msg := '';
  for i := 0 to FItems.Count - 1 do begin
    Info := Fitems[i];

    if Info.FState = ReqType then begin
      // 등록상태:케릭터이름:레벨:성별:등록일자:서버일자:맵정보/
      msg := msg + IntToStr(Info.FState) + ':' + Info.Name + ':' +
        IntToStr(Info.Level) + ':' + IntToStr(Info.Sex) + ':' +
        Info.Date + ':' + Info.ServerDate + ':' + Info.MapInfo + '/';
      Inc(ListCount);
    end;

  end;
  Result := msg;
end;

// Get Infomation...
function TRelationShipMgr.GetInfo(Name_: string; var Info_: TRelationShipInfo): boolean;
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
  State_: byte; Level_: byte; Sex_: byte; var Date_: string; MapInfo_: string): boolean;
var
  Info: TRelationShipInfo;
begin
  Result := False;

  // 데이터 체크
  if (Ownner_ = '') or (Other_ = '') or (Level_ = 0) then
    Exit;

  // 등록되어있지 않은 사람이라면 등록한다.
  Info := nil;
  if not Find(Other_) then begin
    Info := TRelationShipInfo.Create;
    Info.Ownner := Ownner_;
    Info.Name   := Other_;
    Info.State  := State_;
    Info.Level  := Level_;
    Info.Sex    := Sex_;
    if Date_ <> '' then
      Info.Date := Date_
    else
      Date_     := Info.Date;
//    ShowMessage(Date_);
    Info.MapInfo := MapInfo_;

    FItems.Add(Info);

    case State_ of
      RsState_Lover: Inc(fLoverCount);
    end;

    Result := True;
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
      // 스테이트에 맞는 사람을 삭제한다.
      case Info.State of
        RsState_Lover: Dec(fLoverCount);
      end;

      Info.Free;
      Info := nil;
      FItems.Delete(i);
      Result := True;
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
      end;
    end;
  end;
end;

function TRelationShipMgr.GetLoverCount: integer;
begin
  Result := fLoverCount;
end;

function TRelationShipMgr.GetLoverName: string;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  Result := '';

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Result := Info.Name;
      exit;
    end;
  end;
end;

function TRelationShipMgr.GetLoverDays: string;
var
  Info: TRelationShipInfo;
  i:    integer;
begin
  Result := '';

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Result := GetDayNow(Info.Date, Info.ServerDate);
      exit;
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

  FDate    := GetNowDate;
  FServerDate := GetNowDate;

  FMode    := 0;

  FOnline  := 0;
end;

destructor TMentorShipInfo.Destroy;
begin
  // TO DO Free Mem

  inherited;
end;

// 현재날짜를 포멧에 맞게 변환시킨다.
function TMentorShipInfo.GetNowDate: string;
begin
  Result := FormatDateTime('yymmddhhnn', Now);
end;

// TMentorShipMgr ============================================================
constructor TMentorShipMgr.Create;
begin
  inherited;
  //TO DO Initialize
  FItems      := TList.Create;
  FEnableJoinMentor := False;
  FReqSequence := rsReq_None;
  FCancelTime := 0;
  FMentorCount := 0;

end;

destructor TMentorShipMgr.Destroy;
begin
  // TO DO Free Mem
  RemoveAll;
  FItems.Free;

  inherited;
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

// 참가 여부 결정
function TMentorShipMgr.GetEnableJoin(ReqType: integer): integer;
begin
  Result := 3;   //실패(기타)

  case ReqType of
    RsState_Master: begin
      if fMentorCount < MAX_MENTORCOUNT then begin
        //성공
        Result := 0;
        exit;
      end else begin
        //실패(이미 사제가 있음)
        Result := 2;
        exit;
      end;
    end;
  end;

end;


// 참가 여부 결정
function TMentorShipMgr.GetEnableJoinReq(ReqType: integer): boolean;
begin
  Result := False;

  case ReqType of
    RsState_Master: if (fMentorCount < MAX_MENTORCOUNT) then
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

function TMentorShipMgr.GetListMsg(ReqType: integer; var ListCount: integer): string;
var
  i:    integer;
  Info: TMentorShipInfo;
  msg:  string;
begin
  ListCount := 0;
  msg := '';
  for i := 0 to FItems.Count - 1 do begin
    Info := Fitems[i];

    if Info.FState = ReqType then begin
      // 등록상태:케릭터이름:레벨:성별:등록일자:서버일자:맵정보/
      msg := msg + IntToStr(Info.FState) + ':' + Info.Ownner + ':' + ':' + Info.Name + ':' +
        IntToStr(Info.Level) + ':' + IntToStr(Info.Job) + ':' + Info.Date + ':' + Info.ServerDate
           + ':' + IntToStr(Info.Mode) + ':' + IntToStr(Info.Online) + '/';
      Inc(ListCount);
    end;

  end;
  Result := msg;
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

function TMentorShipMgr.Add(Ownner_: string; Other_: string; State_: byte; Level_: byte;
      Job_: byte;  Mode_: byte; Online_: byte; var Date_: string): boolean;
var
  Info: TMentorShipInfo;
begin
  Result := False;

  // 데이터 체크
  if (Ownner_ = '') or (Other_ = '') then
    Exit;

  // 등록되어있지 않은 사람이라면 등록한다.
  Info := nil;
  if not Find(Other_) then begin
    Info := TMentorShipInfo.Create;
    Info.Ownner := Ownner_;
    Info.Name  := Other_;
    Info.State  := State_;
    Info.Level := Level_;
    Info.Job   := Job_;
    if Date_ <> '' then
      Info.Date := Date_
    else
      Date_     := Info.Date;

    Info.Mode := Mode_;
    Info.Online := Online_;

    FItems.Add(Info);

    case State_ of
      RsState_Master: Inc(fMentorCount);
    end;

    Result := True;
  end;
end;



function TMentorShipMgr.Change(Other_: string; Level_: byte; Job_: byte; Online_: byte): boolean;
var
  Info: TMentorShipInfo;
begin
  Result := False;
    // 정보를 얻어서
  if GetInfo(Other_, Info) then begin
      // 레벨변경
   if Info <> nil then begin
    Info.Level := Level_;
    Info.Job   := Job_;
    Info.Online := Online_;
    Result := True;
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
      // 스테이트에 맞는 사람을 삭제한다.
      case Info.State of
        RsState_Master: Dec(fMentorCount);
      end;

      Info.Free;
      Info := nil;
      FItems.Delete(i);
      Result := True;
      Exit;
    end;
  end;

end;


function TMentorShipMgr.GetMentorCount: integer;
begin
  Result := fMentorCount;
end;

function TMentorShipMgr.GetMentorName: string;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := '';

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Result := Info.Name;  //제지 일경우
      exit;
    end;
  end;
end;

function TMentorShipMgr.GetMentorDays: string;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := '';

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
      Result := GetDayNow(Info.Date, Info.ServerDate);
      exit;
    end;
  end;
end;


function TMentorShipMgr.GetLevel: integer;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := 0;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
        Result := Info.Level;
      exit;
    end;
  end;
end;


function TMentorShipMgr.GetJob: integer;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := 0;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
        Result := Info.Job;
      exit;
    end;
  end;
end;


function TMentorShipMgr.GetMode: Byte;
var
  Info: TMentorShipInfo;
  i:    integer;
begin
  Result := 0;

  for i := 0 to FItems.Count - 1 do begin
    Info := FItems[i];

    if (Info <> nil) then begin
        Result := Info.Mode;
      exit;
    end;
  end;

end;





end.
