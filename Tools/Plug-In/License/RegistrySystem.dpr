program RegistrySystem;

uses
  Forms,
  RegistryFrm in 'RegistryFrm.pas' {FrmRegistryDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmRegistryDlg, FrmRegistryDlg);
  Application.Run;
end.
