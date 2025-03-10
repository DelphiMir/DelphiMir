program GameGuard;

uses
  Forms,
  FrmGameGuard in 'FrmGameGuard.pas' {GameGuardfrm},
  HUtil32  in '..\Common\HUtil32.pas',
  Grobal2 in '..\Common\Grobal2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGameGuardfrm, GameGuardfrm);
  Application.Run;
end.
