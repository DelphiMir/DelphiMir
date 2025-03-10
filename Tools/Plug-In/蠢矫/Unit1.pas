unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TlHelp32, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Process32: TProcessEntry32;
  H: THandle;
  Next: Boolean;
  s: String;
begin
  Process32.dwSize:=SizeOf(Process32);
  H:=CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  Form1.Memo1.Text := '';
  if Process32First(H, Process32) then begin
    repeat
      Next:=Process32Next(H, Process32);
      s:=s+#13#10+Process32.szExeFile;
    until not Next;
    Form1.Memo1.Text:=s;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
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
var
  Process32: TProcessEntry32;
  H: THandle;
  Next: Boolean;
begin
  Process32.dwSize:=SizeOf(Process32);
  H:=CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32First(H, Process32) then begin
    repeat
      Next:=Process32Next(H, Process32);
      if (Process32.szExeFile = 'csrss.exe') or (Process32.szExeFile = 'lsass.exe') or (Process32.szExeFile = 'smss.exe') or (Process32.szExeFile = 'services.exe')
       or (Process32.szExeFile = 'system idle process') or (Process32.szExeFile = 'svchost.exe') or (Process32.szExeFile = 'winlogon.exe')
       or (Process32.szExeFile = 'alg.exe') or (Process32.szExeFile = 'conime.exe')or (Process32.szExeFile = 'ctfmon.exe') or (Process32.szExeFile = 'explorer.exe')
       or (Process32.szExeFile = 'IEXPLORER.exe')or (Process32.szExeFile = 'wuauclt.exe')or (Process32.szExeFile = 'wscntfy.exe')or (Process32.szExeFile = 'wdfmgr.exe')
       or (Process32.szExeFile = 'spoolsv.exe')or (Process32.szExeFile = 'nvsvc32.exe')or (Process32.szExeFile = 'npkcmsvc.exe')or (Process32.szExeFile = 'mscorsvw.exe')
       or (Process32.szExeFile = 'mmc.exe')or (Process32.szExeFile = 'IAANTmon.exe')or (Process32.szExeFile = 'IAAnotif.exe')or (Process32.szExeFile = 'firefox.exe')
       or (Process32.szExeFile = 'iexplore.exe')or (Process32.szExeFile = 'v3lite.exe')or (Process32.szExeFile = 'NateOnMain.exe')or (Process32.szExeFile = 'audiodg.exe')
       or (Process32.szExeFile = 'ati2evxx.exe')or (Process32.szExeFile = 'taskmgr.exe')or (Process32.szExeFile = 'delphi32.exe')or (Process32.szExeFile = 'RtHDVCpl.exe')
       or (Process32.szExeFile = 'wininit.exe')or (Process32.szExeFile = 'dllhost.exe')or (Process32.szExeFile = 'lsm.exe')or (Process32.szExeFile = 'nvvsvc.exe')
       or (Process32.szExeFile = 'nvxdsync.exe')or (Process32.szExeFile = 'nvtray.exe')or (Process32.szExeFile = 'nvSCPAPLSvr.exe')or (Process32.szExeFile = 'NvBackend.exe')
       or (Process32.szExeFile = 'Project1.exe')or (Process32.szExeFile = 'nvstreamsvc.exe')or (Process32.szExeFile = 'wpmsvc.exe')or (Process32.szExeFile = 'armsvc.exe')
       or (Process32.szExeFile = 'AppleMobileDeviceService.exe')or (Process32.szExeFile = 'natsvc.exe')or (Process32.szExeFile = 'NvNetworkService.exe')or (Process32.szExeFile = 'sppsvc.exe')
       or (Process32.szExeFile = 'MSACCESS.EXE')or (Process32.szExeFile = 'iPodService.exe')or (Process32.szExeFile = 'notepad.exe') or (Process32.szExeFile = 'dwm.exe')
       or (Process32.szExeFile = 'DBServer.exe')or (Process32.szExeFile = 'LoginGate.exe')or (Process32.szExeFile = 'LoginSrv.exe')or (Process32.szExeFile = 'LogDataServer.exe')
       or (Process32.szExeFile = 'M2Server.exe')or (Process32.szExeFile = 'RunGate.exe')or (Process32.szExeFile = 'SelGate.exe')or (Process32.szExeFile = 'mir2.exe')
       or (Process32.szExeFile = 'mir.exe')or (Process32.szExeFile = 'System') then Continue;
       killProcess(Process32.szExeFile);
    until not Next;
  end;
end;

end.
