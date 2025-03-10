unit GLoginServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls;

type
  TfrmLoginServerConfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GridGateRoute: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmLoginServerConfig: TfrmLoginServerConfig;

implementation

{$R *.dfm}

procedure TfrmLoginServerConfig.FormCreate(Sender: TObject);
begin
  GridGateRoute.Cells[0, 0] := 'Server Name';
  GridGateRoute.Cells[1, 0] := 'Routing identifier';
  GridGateRoute.Cells[2, 0] := 'Private gateway IP';
  GridGateRoute.Cells[3, 0] := 'Public gateway IP';
  GridGateRoute.Cells[4, 0] := 'Gateway role';
  GridGateRoute.Cells[5, 0] := 'Port';
end;

procedure TfrmLoginServerConfig.Open;
begin
  ShowModal;
end;

end.
