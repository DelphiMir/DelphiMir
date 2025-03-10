unit RegistryFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellApi, HddInfo;

type
  TFrmRegistryDlg = class(TForm)
    GroupBox1: TGroupBox;
    ButtonCancel: TButton;
    gim: TComboBox;
    cb: TComboBox;
    DName: TComboBox;
    Port: TEdit;
    Button2: TButton;
    Button1: TButton;
    Inf: TMemo;
    hdd: THDDInfo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure ButtonCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistryDlg: TFrmRegistryDlg;

implementation
uses  EDcode;
{$R *.dfm}
function GetMacAddress(const ServerName: string): string;
//Client: Requires Windows XP, Windows 2000 Professional, or Windows NT Workstation.
//Server: Requires Windows Server 2003, Windows 2000 Server, or Windows NT Server.
// Result Format: 'XX-XX-XX-XX-XX-XX'
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
    Retvar := '00300700100900200';

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

procedure TFrmRegistryDlg.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRegistryDlg.Button1Click(Sender: TObject);
begin
 inf.Clear;
 try
   hdd.Method := TGetInfoMethod(gim.itemindex);
   if hdd.Method = gimByName then begin
     if dname.Text = '' then begin
       ShowMessage('Device name not specified!');
       exit;
     end;
     hdd.DeviceName := DName.Text;
   end else begin
     hdd.Drive := TDrive(cb.itemindex);
   end;

   if hdd.isIDE then inf.Lines.Add(cb.Text)
   else inf.Lines.Add('Device '+hdd.DeviceName+':');

   inf.Lines.add('MAC: '+EncodeString(GetMacAddress('')));
   if hdd.Serial[1] <> #0 then
   inf.Lines.add('HDD: '+EncodeString(hdd.Serial));

   inf.Lines.Add('Method: '+IntToStr(gim.itemindex));
   inf.Lines.Add('DName: '+DName.Text);
   inf.Lines.Add('cb: '+IntToStr(cb.itemindex));

 except
   inf.Lines.add('No device');
   inf.Lines.add('MAC: '+EncodeString(GetMacAddress('')));
 end;
end;

procedure TFrmRegistryDlg.Button2Click(Sender: TObject);
var i,j:integer;
begin
 inf.Clear;
 try
  hdd.ScsiPort := strtointdef(port.Text,0);
  inf.Lines.Add('Scsi Port: '+inttostr(hdd.ScsiPort));
  inf.Lines.Add(' Bus count: '+inttostr(hdd.ScsiBusCount));
  for i := 0 to hdd.ScsiBusCount - 1 do
  begin
   hdd.ScsiBus := i;
   inf.Lines.Add('  Scsi Bus: '+inttostr(i));
   inf.Lines.Add('   Device count: '+inttostr(hdd.ScsiDevCount));
   for j := 0 to hdd.ScsiDevCount - 1 do
   begin
    hdd.ScsiDevice := j;
    inf.Lines.Add('    Device name:      '+hdd.ScsiInfo.Data);
    inf.Lines.Add('     PathId:          '+inttostr(hdd.ScsiInfo.PathId));
    inf.Lines.Add('     TargetId:        '+inttostr(hdd.ScsiInfo.TargetId));
    inf.Lines.Add('     Lun:             '+inttostr(hdd.ScsiInfo.Lun));
    if hdd.ScsiInfo.DeviceClaimed then
     inf.Lines.Add('     Device claimed:  yes')
    else
     inf.Lines.Add('     Device claimed:  no');
    case hdd.ScsiInfo.HDDType of
     dtFixed:     inf.Lines.Add('     Type:            Fixed');
     dtCDROM:     inf.Lines.Add('     Type:            CDROM Device');
     dtRemovable: inf.Lines.Add('     Type:            Removable');
     dtTape:      inf.Lines.Add('     Type:            Tape Device');
     dtOptical:   inf.Lines.Add('     Type:            Optical Device');
     dtArray:     inf.Lines.Add('     Type:            Array Device');
     dtUnknown:   inf.Lines.Add('     Type:            Unknown');
    end;
   end;
  end;
 except
  inf.Lines.Add('Wrong Scsi Port!');
 end;


end;

procedure TFrmRegistryDlg.Button3Click(Sender: TObject);
begin
   Edit2.Text := EncodeString(Edit1.Text);
end;

procedure TFrmRegistryDlg.Button4Click(Sender: TObject);
begin
  Edit3.Text := DecodeString(Edit2.Text);
end;

end.
