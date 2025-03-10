program mir2patch;

uses
  Forms,
  BasicForm in 'BasicForm.pas' {BasicFrm};
  
{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Korea Mir2(KM2)';
  Application.CreateForm(TBasicFrm, BasicFrm);
  Application.Run;
end.
