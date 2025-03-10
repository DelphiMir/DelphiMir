program LogDataServer;

uses
  Forms,
  LogDataMain in 'LogDataMain.pas' {FrmLogData},
  LogManage in 'LogManage.pas',
  LDShare in 'LDShare.pas',
  LDServer in 'LDServer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmLogData, FrmLogData);
  Application.CreateForm(TFrmLogManage, FrmLogManage);
  Application.Run;
end.
