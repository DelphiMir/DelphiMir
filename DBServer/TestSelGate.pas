unit TestSelGate;

interface

uses
  svn, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmTestSelGate = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditSelGate: TEdit;
    Label2: TLabel;
    EditGameGate: TEdit;
    ButtonTest: TButton;
    Button1: TButton;
    procedure ButtonTestClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestSelGate: TfrmTestSelGate;

implementation

uses UsrSoc, RouteManage;

{$R *.dfm}

procedure TfrmTestSelGate.ButtonTestClick(Sender: TObject);
var
  sSelGateIPaddr  :String;
  sGameGateIPaddr :String;
  nGameGatePort   :Integer;
begin
  sSelGateIPaddr:=Trim(EditSelGate.Text);
  sGameGateIPaddr:=FrmUserSoc.GateRouteIP(sSelGateIPaddr,nGameGatePort);
  if sGameGateIPaddr = '' then begin
    EditGameGate.Text:='Not Found';
    exit;
  end;
  EditGameGate.Text:=format('%s:%d',[sGameGateIPaddr,nGameGatePort]);
end;

procedure TfrmTestSelGate.Button1Click(Sender: TObject);
begin
  frmRouteManage.Open;
end;


{---- Adjust global SVN revision ----}
initialization
  SVNRevision('$Id: TestSelGate.pas 314 2006-08-24 01:50:32Z Fugly $');
end.
