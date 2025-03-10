program License;

uses
  Forms,
  Form in 'Form.pas' {TForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTForm, TForm);
  Application.Run;
end.
