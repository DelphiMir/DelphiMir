unit Optiom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, HUtil32, IniFiles, RzButton,
  RzPanel, RzRadGrp, RzTabs, Mask, RzEdit, RzLabel, RzRadChk;

type
  TOption = class(TForm)
    GameStart: TRzBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    ScreenModeGroup: TRzRadioGroup;
    FullScreenGroup: TRzRadioGroup;
    AutoLoginUse: TRzCheckBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    AutoId: TRzEdit;
    AutoPw: TRzEdit;
    InterfaceSetup: TRzRadioGroup;
    GraphicBitCount: TRzRadioGroup;
    procedure GameStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ScreenModeGroupClick(Sender: TObject);
    procedure FullScreenGroupClick(Sender: TObject);
    procedure AutoLoginUseClick(Sender: TObject);
    procedure AutoIdChange(Sender: TObject);
    procedure AutoPwChange(Sender: TObject);
    procedure InterfaceSetupClick(Sender: TObject);
    procedure GraphicBitCountClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Option: TOption;

implementation
uses clmain, FState, FState2, MShare, Share;

{$R *.dfm}

procedure TOption.GameStartClick(Sender: TObject);
begin
  Option.Hide;
  Application.CreateForm(TfrmMain, FrmMain);
  Application.CreateForm(TFrmDlg, FrmDlg);
  Application.CreateForm(TFrmDlg2, FrmDlg2);
  FrmMain.Show;
end;

procedure TOption.FormCreate(Sender: TObject);
var
  ini: TIniFile;
  PositionsX, PositionsY: Integer;
begin
  PositionsX := 0;
  PositionsY := 0;
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ScreenModeGroup.ItemIndex := ini.ReadInteger ('Setup', 'ScreenMode', g_FScreenMode);
    FullScreenGroup.ItemIndex := BoolToInt(ini.ReadBool ('Setup', 'FullScreen', g_boFullScreen));
    InterfaceSetup.ItemIndex := BoolToInt(ini.ReadBool ('Option', 'InterfaceMode', g_InterfaceMode));
    GraphicBitCount.ItemIndex := ini.ReadInteger ('Option', 'BitCountMode', g_BitCountMode);
    PositionsX := ini.ReadInteger ('S-Positions', 'Left', PositionsX);
    PositionsY := ini.ReadInteger ('S-Positions', 'Top', PositionsY);
    if PositionsX >= 1024 then PositionsX := 500;
    if PositionsY >= 768 then PositionsY := 300;
  end;
  ini.Free;

  ini := TIniFile.Create ('.\Auto.ini');
  if ini <> nil then begin
    AutoLoginUse.Checked := ini.ReadBool ('Auto', 'AutoLogin', g_boAutoLogin);
    AutoID.Text := ini.ReadString ('Auto', 'AutoID', g_sAutoID);
    AutoPw.Text := ini.ReadString ('Auto', 'AutoPass', g_sAutoPass);
  end;
  ini.Free;
  
  Option.Left := PositionsX;
  Option.Top := PositionsY;
end;

procedure TOption.FormDestroy(Sender: TObject);
begin
  Option:= nil;
  application.Terminate;
end;

procedure TOption.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ini.WriteInteger ('S-Positions', 'Left', Option.Left);
    ini.WriteInteger ('S-Positions', 'Top', Option.Top);
  end;
  ini.Free;
  Action:=caFree;
end;

procedure TOption.ScreenModeGroupClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ini.WriteInteger ('Setup', 'ScreenMode', ScreenModeGroup.ItemIndex);
  end;
  ini.Free;
end;

procedure TOption.FullScreenGroupClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ini.WriteBool ('Setup', 'FullScreen', IntToBool(FullScreenGroup.ItemIndex));
  end;
  ini.Free;
end;

procedure TOption.AutoLoginUseClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create ('.\Auto.ini');
  if ini <> nil then begin
    ini.WriteBool ('Auto', 'AutoLogin', AutoLoginUse.Checked);
  end;
  ini.Free;
end;

procedure TOption.AutoIdChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create ('.\Auto.ini');
  if ini <> nil then begin
    ini.WriteString ('Auto', 'AutoID', AutoId.Text);
  end;
  ini.Free;
end;

procedure TOption.AutoPwChange(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create ('.\Auto.ini');
  if ini <> nil then begin
    ini.WriteString ('Auto', 'AutoPass', AutoPw.Text);
  end;
  ini.Free;
end;

procedure TOption.InterfaceSetupClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ini.WriteInteger ('Option', 'InterfaceMode', InterfaceSetup.ItemIndex);
  end;
  ini.Free;
end;

procedure TOption.GraphicBitCountClick(Sender: TObject);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create('.\Mir2.ini');
  if ini <> nil then begin
    ini.WriteInteger ('Option', 'BitCountMode', GraphicBitCount.ItemIndex);
  end;
  ini.Free;
end;

end.
