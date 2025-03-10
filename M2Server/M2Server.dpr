program M2Server;

uses
  FastMM4,
  Forms,
  Windows,
  Graphics,
  svMain in 'svMain.pas' {FrmMain},
  InterServerMsg in 'InterServerMsg.pas' {FrmSrvMsg},
  InterMsgClient in 'InterMsgClient.pas' {FrmMsgClient},
  IdSrvClient in 'IdSrvClient.pas' {FrmIDSoc},
  FSrvValue in 'FSrvValue.pas' {FrmServerValue},
  DBLogDlg in 'DBLogDlg.pas' {LoginDialog},
  LocalDB in 'LocalDB.pas',
  UsrEngn in 'UsrEngn.pas',
  ObjNpc in 'ObjNpc.pas',
  ObjMon3 in 'ObjMon3.pas',
  ObjMon2 in 'ObjMon2.pas',
  ObjMon in 'ObjMon.pas',
  ObjGuard in 'ObjGuard.pas',
  ObjBase in 'ObjBase.pas',
  ObjAxeMon in 'ObjAxeMon.pas',
  NoticeM in 'NoticeM.pas',
  Mission in 'Mission.pas',
  Magic in 'Magic.pas',
  M2Share in 'M2Share.pas',
  ItmUnit in 'ItmUnit.pas',
  Guild in 'Guild.pas',
  FrnEngn in 'FrnEngn.pas',
  Event in 'Event.pas',
  Envir in 'Envir.pas',
  Castle in 'Castle.pas',
  RunDB in 'RunDB.pas',
  RunSock in 'RunSock.pas',
  Grobal2 in '..\Common\Grobal2.pas',
  HUtil32 in '..\Common\HUtil32.pas',
  GeneralConfig in 'GeneralConfig.pas' {frmGeneralConfig},
  GameConfig in 'GameConfig.pas' {frmGameConfig},
  FunctionConfig in 'FunctionConfig.pas' {frmFunctionConfig},
  ObjRobot in 'ObjRobot.pas',
  BnkEngn in 'BnkEngn.pas',
  ViewSession in 'ViewSession.pas' {frmViewSession},
  ViewOnlineHuman in 'ViewOnlineHuman.pas' {frmViewOnlineHuman},
  ViewOnlineHumanView in 'ViewOnlineHumanView.pas' {frmViewOnlineHumanView},
  ViewLevel in 'ViewLevel.pas' {frmViewLevel},
  ViewList in 'ViewList.pas' {frmViewList},
  OnlineMsg in 'OnlineMsg.pas' {frmOnlineMsg},
  HumanInfo in 'HumanInfo.pas' {frmHumanInfo},
  ViewKernelInfo in 'ViewKernelInfo.pas' {frmViewKernelInfo},
  ConfigMerchant in 'ConfigMerchant.pas' {frmConfigMerchant},
  ConfigMerchantView in 'ConfigMerchantView.pas' {frmConfigMerchantView},
  ItemSet in 'ItemSet.pas' {frmItemSet},
  ConfigMonGen in 'ConfigMonGen.pas' {frmConfigMonGen},
  ConfigMonGenView in 'ConfigMonGenView.pas' {frmConfigMonGenView},
  SDK in '..\SDK\SDK.pas',
  EncryptUnit in '..\Common\EncryptUnit.pas',
  GameCommand in 'GameCommand.pas' {frmGameCmd},
  MonsterConfig in 'MonsterConfig.pas' {frmMonsterConfig},
  UnitManage in 'UnitManage.pas',
  JClasses in 'JClasses.pas',
  CastleManage in 'CastleManage.pas' {frmCastleManage},
  MD5Unit in 'MD5Unit.pas',
  MudUtil in '..\Common\MudUtil.pas',
  EDcode in '..\Common\EDcode.pas',
  DESTR in '..\Common\DESTR.pas',
  UEncrypt in '..\Common\UEncrypt.pas',
  WinlicenseSDK in '..\Common\WinlicenseSDK.pas',
  GuildTerritory in 'GuildTerritory.pas',
  nixtime in '..\Common\nixtime.pas',
  WSockBuf in '..\Common\WSockBuf.pas',
  WSocket in '..\Common\WSocket.pas',
  ConfigGameShop in 'ConfigGameShop.pas' {frmConfigGameShop},
  DragonSystem in 'DragonSystem.pas',
  HeroConfig in 'HeroConfig.pas' {frmHeroConfig},
  Relationship in 'Relationship.pas',
  ObjHero in 'ObjHero.pas',
  UnitRegisterSoft in 'UnitRegisterSoft.pas',
  SysManager in 'SysManager.pas' {frmSysManager},
  ViewCompoundInfo in 'ViewCompoundInfo.pas' {FrmViewCompoundInfo},
  EditCompoundInfo in 'EditCompoundInfo.pas' {EditCompoundInfoForm},
  GuildManage in 'GuildManage.pas' {frmGuildManage};

//MemCheck;
var
  Mutex : THandle;

{$R *.res}

begin
  //memchk;
  Mutex := CreateMutex(nil, True, 'MyAppName');
  if (Mutex <> 0) and (GetLastError = 0) then begin
    g_Config.nM2Crc:=CalcFileCRC(Application.ExeName);

    Application.Initialize;
    Application.HintPause:=100;
    Application.HintShortPause:=100;
    Application.HintHidePause:=5000;

    Application.Title := 'M2Server';
    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmSrvMsg, FrmSrvMsg);
  Application.CreateForm(TFrmViewCompoundInfo, FrmViewCompoundInfo);
  Application.CreateForm(TEditCompoundInfoForm, EditCompoundInfoForm);
  Application.CreateForm(TFrmMsgClient, FrmMsgClient);
  Application.CreateForm(TFrmIDSoc, FrmIDSoc);
  Application.CreateForm(TFrmServerValue, FrmServerValue);
  Application.CreateForm(TfrmGameCmd, frmGameCmd);
  Application.CreateForm(TfrmMonsterConfig, frmMonsterConfig);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.Run;

    if Mutex <> 0 then
      CloseHandle(Mutex);
  end else
    MessageBox(0, 'M2서버가 실행 중 입니다.', 'Info..', MB_ICONINFORMATION);
end.
