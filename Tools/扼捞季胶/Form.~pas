unit Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, UEncrypt;


type
  TTForm = class(TForm)
    lbl2: TLabel;
    edt2: TEdit;
    btnGetButton: TBitBtn;
    btn1: TBitBtn;
    btnCloseButton: TBitBtn;
    edt1: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    btn2: TBitBtn;
    edt4: TEdit;
    procedure btnGetButtonClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnCloseButtonClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TForm: TTForm;

implementation
uses EDcode;
{$R *.dfm}


function GetMacAddress(const ServerName: string): string;
type
    TNetTransportEnum = function(ServerName: PWideChar; Level: DWORD;
        var Buffer: Pointer; PrefMaxLen: LongInt; var EntriesRead: DWORD;
        var TotalEntries: DWORD; var ResumeHandle: DWORD): DWORD; stdcall;

    TNetApiBufferFree = function(Buffer: Pointer): DWORD; stdcall;

    PTransportInfo = ^TTransportInfo;
    TTransportInfo = record
        QualityOfService: DWORD;
        NumberOfVCS: DWORD;
        TransportName: PWChar;
        TransportAddress: PWChar;
        WANISH: boolean;
    end;
var
    ErrorCode, ResumeHandle, EntriesRead, TotalEntries: DWORD;
    LibHandle: THandle;
    MachineName, MacAddr, Retvar: string;
    Buffer: Pointer;
    Info: PTransportInfo;
    NetTransportEnum: TNetTransportEnum;
    NetApiBufferFree: TNetApiBufferFree;
    ServerNameW: array[0..128] of WideChar;
    EntryIndex, MacAddrIndex, RetVarIndex: Integer;
begin
    MachineName := Trim(ServerName);
    Retvar := '00500900300700300';

    // Add leading \\ if missing
    if (MachineName <> '') and (Length(MachineName) >= 2) then
    begin
        if Copy(MachineName, 1, 2) <> '\\' then
            MachineName := '\\' + MachineName
    end;

    // Setup and load from DLL
    Buffer := nil;
    ResumeHandle := 0;
    LibHandle := LoadLibrary('NETAPI32.DLL');

    // Execute the external function
    if LibHandle <> 0 then
    begin
        @NetTransportEnum := GetProcAddress(LibHandle, 'NetWkstaTransportEnum');
        @NetApiBufferFree := GetProcAddress(LibHandle, 'NetApiBufferFree');

        StringToWideChar(MachineName, ServerNameW, 129);
        ErrorCode := NetTransportEnum(ServerNameW, 0, Buffer, -1, EntriesRead,
            TotalEntries, ResumeHandle);

      if ErrorCode = 0 then
      begin
          Info := Buffer;

          // Enumerate all protocols - look for TCPIP
          for EntryIndex := 1 to EntriesRead do
          begin
              if Pos('TCPIP', UpperCase(Info^.TransportName)) <> 0 then
              begin
                  // Got It - now format result 'xx-xx-xx-xx-xx-xx'
                  RetVarIndex := 1;
                  MacAddr := Info^.TransportAddress;

                  for MacAddrIndex := 1 to 12 do
                  begin
                      RetVar[RetVarIndex] := MacAddr[MacAddrIndex];
                      Inc(RetVarIndex);
                      if RetVarIndex in [3,6,9,12,15] then
                          Inc(RetVarIndex);
                  end;
              end;
              Inc(Info);
          end;

          if Buffer <> nil then
              NetApiBufferFree(Buffer);
      end;

      try
          FreeLibrary(LibHandle);
      except
          // Silent Error
      end;
    end;

    Result := RetVar;
end;



const
 ID_BIT = $200000; // EFLAGS ID bit
type
 TCPUID = array[1..4] of Longint;
 TVendor = array [0..11] of char;

function IsCPUID_Available: Boolean; register;
asm
 PUSHFD {direct access to flags no possible, only via stack}
 POP EAX {flags to EAX}
 MOV EDX,EAX {save current flags}
 XOR EAX,ID_BIT {not ID bit}
 PUSH EAX {onto stack}
 POPFD {from stack to flags, with not ID bit}
 PUSHFD {back to stack}
 POP EAX {get back to EAX}
 XOR EAX,EDX {check if ID bit affected}
 JZ @exit {no, CPUID not availavle}
 MOV AL,True {Result=True}
 @exit:
end;

function GetCPUID: TCPUID; assembler; register;
asm
 PUSH EBX {Save affected register}
 PUSH EDI
 MOV EDI,EAX {@Resukt}
 MOV EAX,1
 DW $A20F {CPUID Command}
 STOSD {CPUID[1]}
 MOV EAX,EBX
 STOSD {CPUID[2]}
 MOV EAX,ECX
 STOSD {CPUID[3]}
 MOV EAX,EDX
 STOSD {CPUID[4]}
 POP EDI {Restore registers}
 POP EBX
end;

function GetCPUVendor: TVendor; assembler; register;
asm
 PUSH EBX {Save affected register}
 PUSH EDI
 MOV EDI,EAX {@Result (TVendor)}
 MOV EAX,0
 DW $A20F {CPUID Command}
 MOV EAX,EBX
 XCHG EBX,ECX {save ECX result}
 MOV ECX,4
 @1:
 STOSB
 SHR EAX,8
 LOOP @1
 MOV EAX,EDX
 MOV ECX,4
 @2:
 STOSB
 SHR EAX,8
 LOOP @2
 MOV EAX,EBX
 MOV ECX,4
 @3:
 STOSB
 SHR EAX,8
 LOOP @3
 POP EDI {Restore registers}
 POP EBX
end;


procedure TTForm.btnGetButtonClick(Sender: TObject);
begin
  edt2.Text := EncodeString_3des(GetMacAddress(''), '56m2VipGate');
end;

procedure TTForm.btn1Click(Sender: TObject);
begin
    edt4.Text := DecodeString_3des(edt1.Text, '56m2VipGate');
end;

procedure TTForm.btnCloseButtonClick(Sender: TObject);
begin
  TForm.Close;
end;

procedure TTForm.btn2Click(Sender: TObject);
begin
   edt1.Text := EncodeString_3des(edt3.Text, '56m2VipGate');
end;

end.
