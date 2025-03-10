unit ObjRobot;

interface
uses
  {svn, }Windows,Classes,SysUtils,DateUtils,ObjBase,Grobal2;
const
  sROAUTORUN = '#AUTORUN';

  sRONPCLABLEJMP = 'NPC';
  nRONPCLABLEJMP = 100;


  sRODAY       = 'DAY';
  nRODAY       = 200;
  sROHOUR      = 'HOUR';
  nROHOUR      = 201;
  sROMIN       = 'MIN';
  nROMIN       = 202;
  sROSEC       = 'SEC';
  nROSEC       = 203;
  sRUNONWEEK   = 'RUNONWEEK'; //指定星期几运行
  nRUNONWEEK   = 300;
  sRUNONDAY    = 'RUNONDAY';  //指定几日运行
  nRUNONDAY    = 301;
  sRUNONHOUR   = 'RUNONHOUR'; //指定小时运行
  nRUNONHOUR   = 302;
  sRUNONMIN    = 'RUNONMIN';  //指定分钟运行
  nRUNONMIN    = 303;
  sRUNONSEC    = 'RUNONSEC';
  nRUNONSEC    = 304;
  sRUNDATETIME = 'RUNDATETIME'; //指定时间运行，只运行一次
  nRUNDATETIME = 305;

type
  TOpType = (o_NPC);
  TAutoRunInfo = record
    dwRunTick    :LongWord;//上一次运行时间记录
    dwRunTimeLen :LongWord;//运行间隔时间长
    nRunCmd      :Integer; //自动运行类型
    nMoethod     :Integer;
    sParam1      :String;  //运行脚本标签
    sParam2      :String;  //传送到脚本参数内容
    sParam3      :String;
    sParam4      :String;
    nParam1      :Integer;
    nParam2      :Integer;
    nParam3      :Integer;
    nParam4      :Integer;
    boStatus     :Boolean;
    m_nWeek: Integer;
    m_nYear: Integer;
    m_nMonth: Integer;
    m_nDay: Integer;
    m_nHour: Integer;
    m_nMin: Integer;
    m_nSec: Integer;
  end;
  pTAutoRunInfo = ^TAutoRunInfo;

  TRobotObject = class(TPlayObject)
    m_sScriptFileName:String;
    m_AutoRunList:TList;
  private
    procedure LoadScript();
    procedure ClearScript();
    procedure ProcessAutoRun();
    procedure AutoRun(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnWeek(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnDay(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnHour(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnMin(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfOnSec(AutoRunInfo:pTAutoRunInfo);
    procedure AutoRunOfDateTime(AutoRunInfo: pTAutoRunInfo);
  public
    constructor Create();
    destructor Destroy; override;
    procedure SendSocket(DefMsg: pTDefaultMessage; sMsg: String);override;
    procedure ReloadScript();
    procedure Run();override;
  end;
  TRobotManage = class
    RobotHumanList:TStringList;
  private
    procedure LoadRobot();
    procedure UnLoadRobot();
  public
    constructor Create();
    destructor Destroy; override;
    procedure ReLoadRobot();
    procedure Run;
  end;
implementation

uses M2Share, HUtil32;

{ TRobotObject }

procedure TRobotObject.AutoRun(AutoRunInfo: pTAutoRunInfo);
begin
  if g_RobotNPC = nil then begin
    exit;
  end;
  if GetTickCount - AutoRunInfo.dwRunTick > AutoRunInfo.dwRunTimeLen then begin
    case AutoRunInfo.nRunCmd of    //
      nRONPCLABLEJMP: begin
        case AutoRunInfo.nMoethod of    //
          nRODAY: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 24 * 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROHOUR: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROMIN: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 60 * 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nROSEC: begin
            if GetTickCount - AutoRunInfo.dwRunTick > 1000 * LongWord(AutoRunInfo.nParam1) then begin
              AutoRunInfo.dwRunTick:=GetTickCount();
              g_RobotNPC.GotoLable(Self,AutoRunInfo.sParam2,False);
            end;
          end;
          nRUNONWEEK:   AutoRunOfOnWeek(AutoRunInfo);
          nRUNONDAY:    AutoRunOfOnDay(AutoRunInfo);
          nRUNONHOUR:   AutoRunOfOnHour(AutoRunInfo);
          nRUNONMIN:    AutoRunOfOnMin(AutoRunInfo);
          nRUNONSEC:    AutoRunOfOnSec(AutoRunInfo);
          nRUNDATETIME: AutoRunOfDateTime(AutoRunInfo);
        end;    // case
      end;
      1: ;
      2: ;
      3: ;
    end;    // case

  end;

end;

procedure TRobotObject.AutoRunOfDateTime(AutoRunInfo: pTAutoRunInfo);
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  if not AutoRunInfo.boStatus then begin
    if GetTickCount > AutoRunInfo.dwRunTick then begin
      AutoRunInfo.dwRunTick := GetTickCount + 2000;
      DecodeDate(Now, Year, Month, Day);
      if (AutoRunInfo.m_nYear = Year) and (AutoRunInfo.m_nMonth = Month) and (AutoRunInfo.m_nDay = Day) then begin
        DecodeTime(Time, Hour, Min, Sec, MSec);
        if (AutoRunInfo.m_nHour = Hour) and (AutoRunInfo.m_nMin = Min) then begin
          AutoRunInfo.boStatus := True;
          g_RobotNPC.GotoLable(Self, AutoRunInfo.sParam2, False);
        end;
      end;
    end;
  end;
end;

procedure TRobotObject.AutoRunOfOnDay(AutoRunInfo: pTAutoRunInfo);
var
  wHour, wMin, wSec, wMSec: Word;
begin
  if GetTickCount > AutoRunInfo.dwRunTick then begin
    AutoRunInfo.dwRunTick := GetTickCount + 2000;
    DecodeTime(Time, wHour, wMin, wSec, wMSec);
    if (AutoRunInfo.m_nHour in [0..24]) and (AutoRunInfo.m_nMin in [0..60]) then begin
      if (wHour = AutoRunInfo.m_nHour) then begin
        if (wMin = AutoRunInfo.m_nMin) then begin
          if not AutoRunInfo.boStatus then begin
            g_RobotNPC.GotoLable(Self, AutoRunInfo.sParam2, False);
            AutoRunInfo.boStatus := True;
          end;
        end
        else begin
          AutoRunInfo.boStatus := False;
        end;
      end;
    end;
  end;
end;

procedure TRobotObject.AutoRunOfOnHour(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnMin(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnSec(AutoRunInfo: pTAutoRunInfo);
begin

end;

procedure TRobotObject.AutoRunOfOnWeek(AutoRunInfo: pTAutoRunInfo);
var
  wWeek, wHour, wMin, wSec, wMSec: Word;
begin
  if GetTickCount > AutoRunInfo.dwRunTick then begin
    AutoRunInfo.dwRunTick := GetTickCount + 2000;
    DecodeTime(Time, wHour, wMin, wSec, wMSec);
    wWeek := DayOfTheWeek(Now);        //1:岿夸老, 2:拳夸老, 3:荐夸老, 4:格夸老 ,5:陛夸老 , 6:配夸老 ,7:老夸老
    if (AutoRunInfo.m_nWeek in [1..7]) and (AutoRunInfo.m_nHour in [0..23]) and (AutoRunInfo.m_nMin in [0..59]) then begin
      if (wWeek = AutoRunInfo.m_nWeek) and (wHour = AutoRunInfo.m_nHour) then begin
        if (wMin = AutoRunInfo.m_nMin) then begin
          if not AutoRunInfo.boStatus then begin
            g_RobotNPC.GotoLable(Self, AutoRunInfo.sParam2, False);
            AutoRunInfo.boStatus := True;
          end;
        end
        else begin
          AutoRunInfo.boStatus := False;
        end;
      end;
    end;
  end;
end;

procedure TRobotObject.ClearScript;
var
  I: Integer;
begin
  for I := 0 to m_AutoRunList.Count - 1 do begin
    if pTAutoRunInfo(m_AutoRunList.Items[i]) <> nil then
      Dispose(pTAutoRunInfo(m_AutoRunList.Items[I]));
  end;
  m_AutoRunList.Clear;
end;

constructor TRobotObject.Create;
begin
  inherited;
  m_AutoRunList:=TList.Create;
  m_boSuperMan:=True;
end;

destructor TRobotObject.Destroy;
begin
  ClearScript();
  m_AutoRunList.Free;
  inherited;
end;

procedure TRobotObject.LoadScript;
var
  I: Integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  sActionType:String;
  sRunCmd:String;
  sMoethod:String;
  sParam1:String;
  sParam2:String;
  sParam3:String;
  sParam4:String;
  AutoRunInfo:pTAutoRunInfo;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  sFileName:=g_Config.sEnvirDir + 'Robot_def\' + m_sScriptFileName + '.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=LoadList.Strings[i];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText:=GetValidStr3(sLineText,sActionType,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sRunCmd,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sMoethod,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam1,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam2,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam3,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sParam4,[' ','/',#9]);
        if CompareText(sActionType,sROAUTORUN) = 0 then begin
          if CompareText(sRunCmd,sRONPCLABLEJMP) = 0 then begin
            New(AutoRunInfo);
            AutoRunInfo.dwRunTick := GetTickCount;
            AutoRunInfo.dwRunTimeLen := 0;
            AutoRunInfo.boStatus := False;
            AutoRunInfo.nRunCmd := nRONPCLABLEJMP;
            AutoRunInfo.sParam1 := sParam1;
            AutoRunInfo.sParam2 := sParam2;
            AutoRunInfo.sParam3 := sParam3;
            AutoRunInfo.sParam4 := sParam4;
            AutoRunInfo.nParam1 := StrToIntDef(sParam1, 1);
           // AutoRunInfo.nParam2 := GetNPCLabelIdx(sParam2);

            if CompareText(sMoethod, sRODAY) = 0 then begin
              AutoRunInfo.nMoethod := nRODAY;
              AutoRunInfo.dwRunTick := GetTickCount + 24 * 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1);
            end;
            if CompareText(sMoethod, sROHOUR) = 0 then begin
              AutoRunInfo.nMoethod := nROHOUR;
              AutoRunInfo.dwRunTick := GetTickCount + 60 * 60 * 1000 * LongWord(AutoRunInfo.nParam1);
            end;
            if CompareText(sMoethod, sROMIN) = 0 then begin
              AutoRunInfo.nMoethod := nROMIN;
              AutoRunInfo.dwRunTick := GetTickCount + 60 * 1000 * LongWord(AutoRunInfo.nParam1);
            end;
            if CompareText(sMoethod, sROSEC) = 0 then begin
              AutoRunInfo.nMoethod := nROSEC;
              AutoRunInfo.dwRunTick := GetTickCount + 1000 * LongWord(AutoRunInfo.nParam1);
            end;
            if CompareText(sMoethod, sRUNONWEEK) = 0 then begin
              AutoRunInfo.nMoethod := nRUNONWEEK;
              sLineText := AutoRunInfo.sParam1;
              sLineText := GetValidStr3(sLineText, sParam1, [':']);
              sLineText := GetValidStr3(sLineText, sParam2, [':']);
              sLineText := GetValidStr3(sLineText, sParam3, [':']);
              AutoRunInfo.m_nWeek := StrToIntDef(sParam1, -1);
              AutoRunInfo.m_nHour := StrToIntDef(sParam2, -1);
              AutoRunInfo.m_nMin := StrToIntDef(sParam3, -1);
            end;
            if CompareText(sMoethod, sRUNONDAY) = 0 then begin
              AutoRunInfo.nMoethod := nRUNONDAY;
              sLineText := AutoRunInfo.sParam1;
              sLineText := GetValidStr3(sLineText, sParam1, [':']);
              sLineText := GetValidStr3(sLineText, sParam2, [':']);
              AutoRunInfo.m_nHour := StrToIntDef(sParam1, -1);
              AutoRunInfo.m_nMin := StrToIntDef(sParam2, -1);
            end;
            if CompareText(sMoethod, sRUNONHOUR) = 0 then begin
              AutoRunInfo.nMoethod := nRUNONHOUR;
            end;
            if CompareText(sMoethod, sRUNONMIN) = 0 then begin
              AutoRunInfo.nMoethod := nRUNONMIN;
            end;
            if CompareText(sMoethod, sRUNONSEC) = 0 then begin
              AutoRunInfo.nMoethod := nRUNONSEC;
            end;
            if CompareText(sMoethod, sRUNDATETIME) = 0 then begin
              DecodeDate(Now, Year, Month, Day);
              DecodeTime(Time, Hour, Min, Sec, MSec);
              AutoRunInfo.nMoethod := nRUNDATETIME;
              sLineText := AutoRunInfo.sParam1;
              sLineText := GetValidStr3(sLineText, sParam1, [':']);
              sLineText := GetValidStr3(sLineText, sParam2, [':']);
              sLineText := GetValidStr3(sLineText, sParam3, [':']);
              AutoRunInfo.m_nYear := StrToIntDef(sParam1, -1);
              AutoRunInfo.m_nMonth := StrToIntDef(sParam2, -1);
              AutoRunInfo.m_nDay := StrToIntDef(sParam3, -1);
              sLineText := GetValidStr3(sLineText, sParam1, [':']);
              sLineText := GetValidStr3(sLineText, sParam2, [':']);
              AutoRunInfo.m_nHour := StrToIntDef(sParam1, -1);
              AutoRunInfo.m_nMin := StrToIntDef(sParam2, -1);
              if (Year <= AutoRunInfo.m_nYear) and (Month <= AutoRunInfo.m_nMonth) and (Day <= AutoRunInfo.m_nDay) then begin

              end else begin
                Dispose(AutoRunInfo);
                Continue;
              end;
            end;
            m_AutoRunList.Add(AutoRunInfo);
          end;
        end;

      end;
    end;
    LoadList.Free;
  end;
end;

procedure TRobotObject.ProcessAutoRun;
var
  I: Integer;
  AutoRunInfo:pTAutoRunInfo;
begin
  for I := 0 to m_AutoRunList.Count - 1 do begin
    AutoRunInfo := pTAutoRunInfo(m_AutoRunList.Items[i]);
    if AutoRunInfo <> nil then
      AutoRun(AutoRunInfo);
  end;
end;

procedure TRobotObject.ReloadScript;
begin
  ClearScript();
  LoadScript();
end;

procedure TRobotObject.Run;
begin
  ProcessAutoRun();
//  inherited;

end;

procedure TRobotObject.SendSocket(DefMsg: pTDefaultMessage; sMsg: String);
begin
  
end;

{ TRobotManage }

constructor TRobotManage.Create;
begin
  RobotHumanList:=TStringList.Create;
  LoadRobot();
end;

destructor TRobotManage.Destroy;
begin
  UnLoadRobot();
  RobotHumanList.Free;
  inherited;
end;

procedure TRobotManage.LoadRobot;
var
  I: Integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  sRobotName:String;
  sScriptFileName:String;
  RobotHuman:TRobotObject;
begin
  sFileName:=g_Config.sEnvirDir + 'Robot.txt';
  if FileExists(sFileName) then begin
    LoadList:=TStringList.Create;
    LoadList.LoadFromFile(sFileName);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText:=LoadList.Strings[i];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText:=GetValidStr3(sLineText,sRobotName,[' ','/',#9]);
        sLineText:=GetValidStr3(sLineText,sScriptFileName,[' ','/',#9]);
        if (sRobotName <> '') and (sScriptFileName <> '') then begin
          RobotHuman:=TRobotObject.Create;
          RobotHuman.m_sCharName:=sRobotName;
          RobotHuman.m_sScriptFileName:=sScriptFileName;
          RobotHuman.LoadScript;
          RobotHumanList.AddObject(RobotHuman.m_sCharName,RobotHuman);
        end;

      end;
    end;
    LoadList.Free;
  end;
end;

procedure TRobotManage.ReLoadRobot;
begin
  UnLoadRobot();
  LoadRobot();
end;

procedure TRobotManage.Run;
var
  I:Integer;
  RobotObject: TRobotObject;
ResourceString
  sExceptionMsg = '[Exception] TRobotManage::Run';
begin
  try
    for i := 0 to RobotHumanList.Count - 1 do begin
      RobotObject := TRobotObject(RobotHumanList.Objects[i]);
      if RobotObject <> nil then
        RobotObject.Run;
    end;
  except
    on e: Exception do begin
      MainOutMessage(sExceptionMsg);
      MainOutMessage(E.Message);
    end;
  end;
end;

procedure TRobotManage.UnLoadRobot;
var
  I:Integer;
begin
  for I := 0 to RobotHumanList.Count - 1 do begin
    TRobotObject(RobotHumanList.Objects[I]).Free;
  end;
  RobotHumanList.Clear;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ObjRobot.pas 517 2006-12-15 14:54:40Z damian $');
end.
