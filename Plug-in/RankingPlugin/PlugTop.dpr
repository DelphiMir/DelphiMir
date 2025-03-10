program PlugTop;

uses
  FastMM4,
  Forms,
  FrmMain in 'FrmMain.pas' {FormMain},
  Grobal2 in '..\..\Common\Grobal2.pas',
  MudUtil in '..\..\Common\MudUtil.pas',
  MyCommon in '..\..\MyCommon\MyCommon.pas',
  HUtil32 in '..\..\Common\HUtil32.pas';

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.Title := '∑©≈∑Ω√Ω∫≈€';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
