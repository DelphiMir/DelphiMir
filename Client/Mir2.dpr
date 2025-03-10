program mir2;

uses
  FastMM4,
  Forms,
  Dialogs,
  IniFiles,
  Windows,
  SysUtils,
  ClMain in 'ClMain.pas' {frmMain},
  impimepatch in 'impimepatch.pas',
  FState in 'FState.pas' {FrmDlg},
  FState2 in 'FState2.pas' {FrmDlg2},
  DrawScrn in 'DrawScrn.pas',
  IntroScn in 'IntroScn.pas',
  PlayScn in 'PlayScn.pas',
  MapUnit in 'MapUnit.pas',
  ClFunc in 'ClFunc.pas',
  cliUtil in 'cliUtil.pas',
  DWinCtl in 'DWinCtl.pas',
  FindMapPath in 'FindMapPath.pas',
  WIL in 'WIL.pas',
  magiceff in 'magiceff.pas',
  SoundUtil in 'SoundUtil.pas',
  Actor in 'Actor.pas',
  HerbActor in 'HerbActor.pas',
  Bass in 'Bass.pas',
  MyCommon in '..\MyCommon\MyCommon.pas',
  AxeMon in 'AxeMon.pas',
  clEvent in 'clEvent.pas',
  HUtil32 in 'HUtil32.pas',
  Grobal2 in '..\Common\Grobal2.pas',
  MD5Unit in '..\M2Server\MD5Unit.pas',
  MShare in 'MShare.pas',
  SDK in '..\SDK\SDK.pas',
  Mpeg in 'Mpeg.pas',
  wmutil in 'wmutil.pas',
  Share in 'Share.pas',
  EDcode in '..\Common\EDcode.pas',
  RelationShip in 'RelationShip.pas',
  nixtime in '..\Common\nixtime.pas',
  Optiom in 'Optiom.pas' {Option};

 //MemCheck;

{$R *.RES}

var
  AppPath: String;
begin
 // memchk;
  Application.Initialize;

  AppPath := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName));
  if not DirectoryExists(AppPath+'Data') then begin
    Application.MessageBox('���ӱ�� Ǯ������ ���� �μ���.','���!');
    exit;
  end;

  Application.Title := '�׶�����';
  Application.CreateForm(TOption, Option);
  Application.Run;
end.
