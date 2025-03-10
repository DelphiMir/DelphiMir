unit FrmGameGuard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, TlHelp32, CnClasses, CnTrayIcon;

type
  TGameGuardfrm = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    MemoLog: TMemo;
    TimerCheckRun: TTimer;
    TimerStartGame: TTimer;
    TimerStopGame: TTimer;
    Timer2: TTimer;
    CnTrayIcon1: TCnTrayIcon;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CnTrayIcon1DblClick(Sender: TObject);
  private
    n334:Integer;
    procedure MainOutMessage(sMsg: string);
    procedure getHackprocess();
    procedure getprocess();
  public
    procedure MyMessage(var MsgData:TWmCopyData);message WM_COPYDATA;
  end;

  TProgram = record
    boGetStart: Boolean;
    boReStart: Boolean; //Program exception stop, whether to restart
    btStartStatus: Byte; //0,1,2,3 Does not start, is starting, has started, shutting down
    sProgramFile: string[50];
    sDirectory: string[100];
    ProcessInfo: TProcessInformation;
    ProcessHandle: THandle;
    MainFormHandle: THandle;
    nMainFormX: Integer;
    nMainFormY: Integer;
  end;

  procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
var
  GameGuardfrm: TGameGuardfrm;

  g_dwGameCenterHandle :THandle;

implementation

uses HUtil32, Grobal2;

{$R *.dfm}

procedure TGameGuardfrm.Timer1Timer(Sender: TObject);
begin
  if n334 > 7 then
    n334:=0
  else
   Inc(n334);

  case n334 of
    0: Label1.Caption:='쵠';
    1: Label1.Caption:='쵠랑';
    2: Label1.Caption:='쵠랑력';
    3: Label1.Caption:='쵠랑력벴';
    4: Label1.Caption:='쵠랑력벴눈';
    5: Label1.Caption:='쵠랑력벴눈펜';
    6: Label1.Caption:='쵠랑력벴눈펜.';
    7: Label1.Caption:='쵠랑력벴눈펜...';
  end;
end;

procedure TGameGuardfrm.MainOutMessage(sMsg: string);
begin
  sMsg := '[' + DateTimeToStr(Now) + '] ' + sMsg;
  MemoLog.Lines.Add(sMsg);
end;

procedure TGameGuardfrm.FormCreate(Sender: TObject);
begin
  g_dwGameCenterHandle:=Str_ToInt(ParamStr(1),0);

  MainOutMessage('게임가드 시작');

  SendGameCenterMsg(SG_FORMHANDLE,IntToStr(Self.Handle));
  SendGameCenterMsg(SG_STARTNOW, '게임가드 시작 중');

  SendGameCenterMsg(SG_STARTOK, '게임가드 시작완료');
end;


procedure SendGameCenterMsg(wIdent:Word;sSendMsg:String);
var
  SendData:TCopyDataStruct;
  nParam:Integer;
begin
  nParam:=MakeLong(Word(tMir2),wIdent);
  SendData.cbData:=Length (sSendMsg) + 1;
  GetMem(SendData.lpData,SendData.cbData);
  StrCopy (SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle,WM_COPYDATA,nParam,Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;


procedure TGameGuardfrm.MyMessage(var MsgData: TWmCopyData);
var
  sData:String;
  wIdent: Word;
begin
  wIdent := HiWord(MsgData.From);
  sData:=StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of    //
    GS_QUIT: begin
      Close();
    end;
    GS_CHECKRUNCODE: begin
      MainOutMessage(sData);
    end;
    2: ;
    3: ;
  end;    // case
end;

procedure KillProcess(Const ProcName: String);
var
   Process32: TProcessEntry32;
   SHandle:   THandle;  // the handle of the Windows object
   Next:      BOOL;
   ProcId   : DWORD;
begin
    Process32.dwSize := SizeOf(TProcessEntry32);                           //자료를 받을 변수 크기 설정
    SHandle          := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);   //헨들을 구함

    if Process32First(SHandle, Process32) then     //가장 처음의 프로세스정보를 얻는다.
    begin

      repeat
        Next := Process32Next(SHandle, Process32);                //다음 프로세스 정보를 얻는다.
        if Next then                                              //이하 위와 동일
        begin
          GetWindowThreadProcessID( SHandle, @ProcId);
          if Process32.szExeFile = ProcName then begin
            ProcId := DWORD(Process32.th32ProcessID);
            SHandle := OpenProcess(PROCESS_ALL_ACCESS, True, ProcId);
            TerminateProcess(SHandle , 0);
          end;
        end;
      until not Next;
    end;

    CloseHandle(SHandle);
end;

procedure TGameGuardfrm.Timer2Timer(Sender: TObject);
var
  hProcess: THandle;
begin
  if FindWindow('ConsoleWindowClass', Nil) <> 0 Then begin //커멘트창 검색
    hProcess := FindWindow('ConsoleWindowClass',nil);
    postmessage(hProcess,WM_CLOSE,0,0);
  end;

  if FindWindow('AutoHotkey', Nil) <> 0 Then begin //물약 검색
    hProcess := FindWindow('AutoHotkey',nil);
    postmessage(hProcess,WM_CLOSE,0,0);
  end;

  if FindWindow(Nil, 'Speed Gear v7.1') <> 0 Then begin //물약 검색
    hProcess := FindWindow(nil, 'Speed Gear v7.1');
    postmessage(hProcess,WM_CLOSE,0,0);
  end;
  killProcess('cheatengine-i386.exe');
  killProcess('cheatengine-x86_64.exe');

  getHackprocess;
  getprocess;
end;


procedure TGameGuardfrm.getHackprocess();
var
  Snapshot: THandle;
  ModuleEntry: TModuleEntry32;
  Next:      BOOL;
  Name : string;
begin
  ModuleEntry.dwSize := SizeOf( TModuleEntry32 );
  Snapshot := CreateToolhelp32Snapshot( TH32CS_SNAPALL, GetCurrentProcessID );

  if Module32First(Snapshot, ModuleEntry) then begin     //최초 모듈의 정보를 얻는다.
    Name := ModuleEntry.szExePath;      //모듈명, 경로 포함
    while Pos('\',Name) > 0 do Delete(Name, 1, Pos('\',Name));       //경로를 뺀 모듈명만 취함

    repeat
      Next := Module32Next(Snapshot, ModuleEntry);                  //다음 모듈의 정보를 구한다.
      if Next then begin                        //이하 위와 동일
        Name := ModuleEntry.szModule;
        while Pos('\',Name) > 0 do Delete(Name, 1, Pos('\',Name));
        if (CompareText(Name, 'WINIO.dll') = 0) or (CompareText(Name, 'HOOK.dll') = 0) or (CompareText(Name, 'BYFZCQSJ.dll') = 0) or (CompareText(Name, 'PORT.dll') = 0)
         or (CompareText(Name, 'JSHJ.dll') = 0) or (CompareText(Name, 'WINIO.SYS') = 0) or (CompareText(Name, 'WINIO.VXD') = 0) or (CompareText(Name, 'KEYBHO  OK.dll') = 0)
         or (CompareText(Name, 'CMDOK.dll') = 0) or (CompareText(Name, 'YMWJ.dll') = 0) or (CompareText(Name, 'GEARNTKE.dll') = 0) or (CompareText(Name, 'NTPERF.dll') = 0)
         or (CompareText(Name, 'FIENDLIB.dll') = 0) or (CompareText(Name, 'VIPSTART.dll') = 0) or (CompareText(Name, 'CSBFW.dll') = 0) or (CompareText(Name, 'GAMEDLL.dll') = 0)
         or (CompareText(Name, 'WOOOL.dll') =0) or (CompareText(Name, 'HERO.dll') = 0) or (CompareText(Name, 'SPEEDUP.EXE') = 0) or (CompareText(Name, 'SPEEDERDLL.dll') = 0)
         or (CompareText(Name, 'PORTTALK.SYS') = 0) or (CompareText(Name, 'PORTTALK.dll') = 0) or (CompareText(Name, 'PORTTALK.VXD') = 0) or (CompareText(Name, 'HOOKWOOOL.dll') = 0)
         or (CompareText(Name, 'HOOKSTART.DLL') = 0) or (CompareText(Name, 'SOUL.dll') = 0) or (CompareText(Name, 'PK.dll') = 0) or (CompareText(Name, 'MYDLL.dll') = 0)
         or (CompareText(Name, '51JX.dll') = 0) or (CompareText(Name, 'FIENDLIB1014.dll') = 0) or (CompareText(Name, 'SPEEDEXT.dll') = 0) or (CompareText(Name, 'BEXCEPTION.dll') = 0)
         or (CompareText(Name, 'QMDISPATCH.dll') = 0) or (CompareText(Name, 'HKNM.SYS') = 0) or (CompareText(Name, 'STDLIB.VBS')= 0) or (CompareText(Name, 'INPROC.dll') = 0)
         or (CompareText(Name, 'SPEED.dll') = 0) or (CompareText(Name, 'BABOUT.dll') = 0) or (CompareText(Name, 'ZNTPORT.SYS') =0) or (CompareText(Name, 'COOPER.dll') = 0)
         or (CompareText(Name, 'HOOK.FNE') = 0) or (CompareText(Name, 'DTR.DLL') = 0) or (CompareText(Name, 'GEAR9X.DLL') = 0) or (CompareText(Name, 'OEM_SP.DAT') = 0)
         or (CompareText(Name, 'ACTIVATE.DAT') = 0) or (CompareText(Name, 'HONORJJGZ.DAT') = 0) or (CompareText(Name, 'KSKNIGHT.DLL') = 0) or (CompareText(Name, 'ZZCSW8.DAT') = 0)
         or (CompareText(Name, 'WGSHELL.DLL') = 0) or (CompareText(Name, 'TJSH.dll') = 0) or (CompareText(Name, 'D3DX81AB.dll') = 0) or (CompareText(Name, 'HOOK1.dll') = 0)
         or (CompareText(Name, 'JSZX.DLL') = 0) or (CompareText(Name, 'SSCL.dll') = 0) or (CompareText(Name, 'JSHJ.dll') =0) or (CompareText(Name, 'JS.UCU') = 0)
         or (CompareText(Name, 'ISWRAB.dll') =0) or (CompareText(Name, 'HOOK32.dll') = 0) or (CompareText(Name, 'KBHOOK.dll') = 0) or (CompareText(Name, 'QIQKU32.SYS')= 0)
         or (CompareText(Name, 'QIQKU32.DLL') = 0) or (CompareText(Name, 'WINMT.dll') = 0) or (CompareText(Name, 'DELPHIMM.dll')= 0) or (CompareText(Name, 'SPEEDER.EXE')= 0)
         or (CompareText(Name, 'WPESPY.dll') = 0) or (CompareText(Name, 'allochook-i386.dll') = 0) or (CompareText(Name, 'allochook-x86_64.dll') = 0) or (CompareText(Name, 'd3dhook.dll') = 0)
         or (CompareText(Name, 'ced3d9hook.dll') = 0) or (CompareText(Name, 'ced3d9hook64.dll') = 0) or (CompareText(Name, 'ced3d10hook.dll') = 0)  or (CompareText(Name, 'ced3d10hook64.dll') = 0)
         or (CompareText(Name, 'd3dhook64.dll') = 0)or (CompareText(Name, 'libmikmod32.dll') = 0)or (CompareText(Name, 'libmikmod64.dll') = 0)or (CompareText(Name, 'luaclient-i386.dll') = 0)
         or (CompareText(Name, 'luaclient-x86_64.dll') = 0)or (CompareText(Name, 'speedhack-i386.dll') = 0)or (CompareText(Name, 'speedhack-x86_64.dll') = 0) or (CompareText(Name, 'vehdebug-i386.dll') = 0)
         or (CompareText(Name, 'vehdebug-x86_64.dll') = 0)or (CompareText(Name, 'inproc.dll') = 0) or (CompareText(Name, 'NTPerf.dll') = 0)
         or (CompareText(Name, 'cehook.dll') = 0) or (CompareText(Name, 'lua5.1-32.dll') = 0)
         or (CompareText(Name, 'allochook-x86_64.dll') = 0)or (CompareText(Name, 'allochook.dll') = 0) or (CompareText(Name, 'allochook-i386.dll') = 0)
                                                        
        then begin
          MainOutMessage('불법프로그램 감지');
          SendGameCenterMsg(SG_CHECKRUNCODE, Name);
          close;
        end;

      end;
    until not Next;
  end;
  CloseHandle(Snapshot);
end;



procedure TGameGuardfrm.getprocess();
var
   sName : string;
   Process32: TProcessEntry32;
   H: THandle;
   Next: BOOL;
begin
  sName := '';
  Process32.dwSize:=SizeOf(Process32);
  H:=CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32First(H, Process32) then begin
    repeat
      Next:=Process32Next(H, Process32);            //다음 프로세스 정보를 얻는다.
      if Next then begin                          //이하 위와 동일
        sName := Process32.szExeFile;
        if (CompareText('cheatengine-i386.exe', sName) = 0) or (CompareText('cheatengine-x86_64.exe', sName) = 0) then begin
          MainOutMessage('불법프로그램 감지');
          SendGameCenterMsg(SG_CHECKRUNCODE, sName);
          close;
        end;
      end;
    until not Next;
  end;
end;


procedure TGameGuardfrm.CnTrayIcon1DblClick(Sender: TObject);
begin
  Show;
end;

end.

