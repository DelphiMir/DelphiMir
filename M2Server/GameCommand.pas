unit GameCommand;

interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Spin,SDK,grobal2;

type
  TfrmGameCmd = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    StringGridGameCmd: TStringGrid;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditUserCmdName: TEdit;
    EditUserCmdPerMission: TSpinEdit;
    Label6: TLabel;
    EditUserCmdOK: TButton;
    LabelUserCmdFunc: TLabel;
    LabelUserCmdParam: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditUserCmdSave: TButton;
    StringGridGameMasterCmd: TStringGrid;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LabelGameMasterCmdFunc: TLabel;
    LabelGameMasterCmdParam: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditGameMasterCmdName: TEdit;
    EditGameMasterCmdPerMission: TSpinEdit;
    EditGameMasterCmdOK: TButton;
    EditGameMasterCmdSave: TButton;
    StringGridGameDebugCmd: TStringGrid;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    LabelGameDebugCmdFunc: TLabel;
    LabelGameDebugCmdParam: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditGameDebugCmdName: TEdit;
    EditGameDebugCmdPerMission: TSpinEdit;
    EditGameDebugCmdOK: TButton;
    EditGameDebugCmdSave: TButton;
    procedure FormCreate(Sender: TObject);
    procedure StringGridGameCmdClick(Sender: TObject);
    procedure EditUserCmdNameChange(Sender: TObject);
    procedure EditUserCmdPerMissionChange(Sender: TObject);
    procedure EditUserCmdOKClick(Sender: TObject);
    procedure EditUserCmdSaveClick(Sender: TObject);
    procedure StringGridGameMasterCmdClick(Sender: TObject);
    procedure EditGameMasterCmdNameChange(Sender: TObject);
    procedure EditGameMasterCmdPerMissionChange(Sender: TObject);
    procedure EditGameMasterCmdOKClick(Sender: TObject);
    procedure StringGridGameDebugCmdClick(Sender: TObject);
    procedure EditGameDebugCmdNameChange(Sender: TObject);
    procedure EditGameDebugCmdPerMissionChange(Sender: TObject);
    procedure EditGameDebugCmdOKClick(Sender: TObject);
    procedure EditGameMasterCmdSaveClick(Sender: TObject);
    procedure EditGameDebugCmdSaveClick(Sender: TObject);
  private
    nRefGameUserIndex   :Integer;
    nRefGameMasterIndex :Integer;
    nRefGameDebugIndex  :Integer;
    procedure RefUserCommand();
    procedure RefGameMasterCommand();
    procedure RefGameMasterCmd(GameCmd:pTGameCmd;sCmdParam,sDesc:String);
    procedure RefDebugCommand();
    procedure RefGameDebugCmd(GameCmd: pTGameCmd; sCmdParam,
      sDesc: String);
    procedure RefGameUserCmd(GameCmd: pTGameCmd; sCmdParam, sDesc: String);
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmGameCmd: TfrmGameCmd;

implementation

uses M2Share;

{$R *.dfm}

procedure TfrmGameCmd.FormCreate(Sender: TObject);
begin
  PageControl.ActivePageIndex:=0;
  StringGridGameCmd.RowCount:=50;
  StringGridGameCmd.Cells[0, 0] := '游戏命令';
  StringGridGameCmd.Cells[1, 0] := '权限';
  StringGridGameCmd.Cells[2, 0] := '使用方法';
  StringGridGameCmd.Cells[3, 0] := '说明';

  StringGridGameMasterCmd.RowCount := 105;
  StringGridGameMasterCmd.Cells[0, 0] := '游戏命令';
  StringGridGameMasterCmd.Cells[1, 0] := '权限';
  StringGridGameMasterCmd.Cells[2, 0] := '使用方法';
  StringGridGameMasterCmd.Cells[3, 0] := '说明';

  StringGridGameDebugCmd.RowCount := 41;
  StringGridGameDebugCmd.Cells[0, 0] := '游戏命令';
  StringGridGameDebugCmd.Cells[1, 0] := '权限';
  StringGridGameDebugCmd.Cells[2, 0] := '使用方法';
  StringGridGameDebugCmd.Cells[3, 0] := '说明';


end;

procedure TfrmGameCmd.Open;
begin
  RefUserCommand();
  RefGameMasterCommand();
  RefDebugCommand();
  ShowModal;
end;
procedure TfrmGameCmd.RefGameUserCmd(GameCmd:pTGameCmd;sCmdParam,sDesc:String);
begin
  Inc(nRefGameUserIndex);
  if StringGridGameCmd.RowCount - 1 < nRefGameUserIndex then begin
    StringGridGameCmd.RowCount:=nRefGameUserIndex + 1;
  end;

  StringGridGameCmd.Cells[0,nRefGameUserIndex]:=GameCmd.sCmd;
  StringGridGameCmd.Cells[1,nRefGameUserIndex]:=IntToStr(GameCmd.nPermissionMin) + '/' + IntToStr(GameCmd.nPermissionMax);
  StringGridGameCmd.Cells[2,nRefGameUserIndex]:=sCmdParam;
  StringGridGameCmd.Cells[3,nRefGameUserIndex]:=sDesc;
  StringGridGameCmd.Objects[0,nRefGameUserIndex]:=TObject(GameCmd);
end;




//  StringGridGameCmd.Cells[3,12]:='未使用';
//  StringGridGameCmd.Cells[3,13]:='移动地图指定座标(需要戴传送装备)';
//  StringGridGameCmd.Cells[3,14]:='探测人物所在位置(需要戴传送装备)';
//  StringGridGameCmd.Cells[3,15]:='允许记忆传送';
//  StringGridGameCmd.Cells[3,16]:='将组队人员传送到身边(需要戴记忆全套装备)';
//  StringGridGameCmd.Cells[3,17]:='允许行会传送';
//  StringGridGameCmd.Cells[3,18]:='将行会成员传送身边(需要戴行会传送装备)';
//  StringGridGameCmd.Cells[3,19]:='开启仓库密码锁';
//  StringGridGameCmd.Cells[3,20]:='开启登录密码锁';
//  StringGridGameCmd.Cells[3,21]:='将仓库密码锁上';
//  StringGridGameCmd.Cells[3,22]:='设置仓库密码';
//  StringGridGameCmd.Cells[3,23]:='修改仓库密码';
//  StringGridGameCmd.Cells[3,24]:='清除密码(先开锁再清除密码)';
//  StringGridGameCmd.Cells[3,25]:='未使用';
//  StringGridGameCmd.Cells[3,26]:='查询夫妻位置';
//  StringGridGameCmd.Cells[3,27]:='允许夫妻传送';
//  StringGridGameCmd.Cells[3,28]:='夫妻将对方传送到身边';
//  StringGridGameCmd.Cells[3,29]:='查询师徒位置';
//  StringGridGameCmd.Cells[3,30]:='允许师徒传送';
//  StringGridGameCmd.Cells[3,31]:='师父将徒弟召唤到身边';
//  StringGridGameCmd.Cells[3,32]:='更换攻击模式(此命令不要修改)';
//  StringGridGameCmd.Cells[3,33]:='宝宝攻击状态(此命令不要修改)';
//  StringGridGameCmd.Cells[3,34]:='带马牌后骑上马';
//  StringGridGameCmd.Cells[3,35]:='从马上下来';
//  StringGridGameCmd.Cells[3,36]:='';
//  StringGridGameCmd.Cells[3,37]:='开启/关闭登录锁';
procedure TfrmGameCmd.RefUserCommand;
begin
  EditUserCmdOK.Enabled:=False;
  nRefGameUserIndex:=0;

  RefGameUserCmd(@g_GameCommand.DATA,
                   '@' + g_GameCommand.DATA.sCmd,
                   '查看当前时间。');
  RefGameUserCmd(@g_GameCommand.PRVMSG,
                   '@' + g_GameCommand.PRVMSG.sCmd,
                   '拒绝和某一人私聊。');
  RefGameUserCmd(@g_GameCommand.ALLOWMSG,
                   '@' + g_GameCommand.ALLOWMSG.sCmd,
                   '拒绝所有人私聊。');
  RefGameUserCmd(@g_GameCommand.LETSHOUT,
                   '@' + g_GameCommand.LETSHOUT.sCmd,
                   '拒绝显示呐喊信息。');
  RefGameUserCmd(@g_GameCommand.LETTRADE,
                   '@' + g_GameCommand.LETTRADE.sCmd,
                   '允许/拒绝交易。');
  RefGameUserCmd(@g_GameCommand.LETGUILD,
                   '@' + g_GameCommand.LETGUILD.sCmd,
                   '加入行会。');
  RefGameUserCmd(@g_GameCommand.ENERGY,
                   '@' + g_GameCommand.ENERGY.sCmd,
                   '允许自动跑。');
  RefGameUserCmd(@g_GameCommand.ENDGUILD,
                   '@' + g_GameCommand.ENDGUILD.sCmd,
                   '退出行会。');
  RefGameUserCmd(@g_GameCommand.BANGUILDCHAT,
                   '@' + g_GameCommand.BANGUILDCHAT.sCmd,
                   '拒绝行会聊天。');
  RefGameUserCmd(@g_GameCommand.BANGROUPCHAT,
                   '@' + g_GameCommand.BANGROUPCHAT.sCmd,
                   '拒绝组队聊天。');
  RefGameUserCmd(@g_GameCommand.AUTHALLY,
                   '@' + g_GameCommand.AUTHALLY.sCmd,
                   '允许行会联盟。');
  RefGameUserCmd(@g_GameCommand.ALLIANCE,
                   '@' + g_GameCommand.ALLIANCE.sCmd,
                   '开始行会联盟。');
  RefGameUserCmd(@g_GameCommand.CANCELALLIANCE,
                   '@' + g_GameCommand.CANCELALLIANCE.sCmd,
                   '解除行会联盟。');
  exit;

  StringGridGameCmd.Cells[0,12]:=g_GameCommand.DIARY.sCmd;
  StringGridGameCmd.Cells[1,12]:=IntToStr(g_GameCommand.DIARY.nPermissionMin);
  StringGridGameCmd.Cells[2,12]:='@' + g_GameCommand.DIARY.sCmd;
  StringGridGameCmd.Objects[0,12]:=TObject(@g_GameCommand.DIARY);

  StringGridGameCmd.Cells[0,13]:=g_GameCommand.USERMOVE.sCmd;
  StringGridGameCmd.Cells[1,13]:=IntToStr(g_GameCommand.USERMOVE.nPermissionMin);
  StringGridGameCmd.Cells[2,13]:='@' + g_GameCommand.USERMOVE.sCmd;
  StringGridGameCmd.Objects[0,13]:=TObject(@g_GameCommand.USERMOVE);

  StringGridGameCmd.Cells[0,14]:=g_GameCommand.SEARCHING.sCmd;
  StringGridGameCmd.Cells[1,14]:=IntToStr(g_GameCommand.SEARCHING.nPermissionMin);
  StringGridGameCmd.Cells[2,14]:='@' + g_GameCommand.SEARCHING.sCmd;
  StringGridGameCmd.Objects[0,14]:=TObject(@g_GameCommand.SEARCHING);

  StringGridGameCmd.Cells[0,15]:=g_GameCommand.ALLOWGROUPCALL.sCmd;
  StringGridGameCmd.Cells[1,15]:=IntToStr(g_GameCommand.ALLOWGROUPCALL.nPermissionMin);
  StringGridGameCmd.Cells[2,15]:='@' + g_GameCommand.ALLOWGROUPCALL.sCmd;
  StringGridGameCmd.Objects[0,15]:=TObject(@g_GameCommand.ALLOWGROUPCALL);

  StringGridGameCmd.Cells[0,16]:=g_GameCommand.GROUPRECALLL.sCmd;
  StringGridGameCmd.Cells[1,16]:=IntToStr(g_GameCommand.GROUPRECALLL.nPermissionMin);
  StringGridGameCmd.Cells[2,16]:='@' + g_GameCommand.GROUPRECALLL.sCmd;
  StringGridGameCmd.Objects[0,16]:=TObject(@g_GameCommand.GROUPRECALLL);

  StringGridGameCmd.Cells[0,17]:=g_GameCommand.ALLOWGUILDRECALL.sCmd;
  StringGridGameCmd.Cells[1,17]:=IntToStr(g_GameCommand.ALLOWGUILDRECALL.nPermissionMin);
  StringGridGameCmd.Cells[2,17]:='@' + g_GameCommand.ALLOWGUILDRECALL.sCmd;
  StringGridGameCmd.Objects[0,17]:=TObject(@g_GameCommand.ALLOWGUILDRECALL);

  StringGridGameCmd.Cells[0,18]:=g_GameCommand.GUILDRECALLL.sCmd;
  StringGridGameCmd.Cells[1,18]:=IntToStr(g_GameCommand.GUILDRECALLL.nPermissionMin);
  StringGridGameCmd.Cells[2,18]:='@' + g_GameCommand.GUILDRECALLL.sCmd;
  StringGridGameCmd.Objects[0,18]:=TObject(@g_GameCommand.GUILDRECALLL);

  StringGridGameCmd.Cells[0,19]:=g_GameCommand.UNLOCKSTORAGE.sCmd;
  StringGridGameCmd.Cells[1,19]:=IntToStr(g_GameCommand.UNLOCKSTORAGE.nPermissionMin);
  StringGridGameCmd.Cells[2,19]:='@' + g_GameCommand.UNLOCKSTORAGE.sCmd;
  StringGridGameCmd.Objects[0,19]:=TObject(@g_GameCommand.UNLOCKSTORAGE);

  StringGridGameCmd.Cells[0,20]:=g_GameCommand.UNLOCK.sCmd;
  StringGridGameCmd.Cells[1,20]:=IntToStr(g_GameCommand.UNLOCK.nPermissionMin);
  StringGridGameCmd.Cells[2,20]:='@' + g_GameCommand.UNLOCK.sCmd;
  StringGridGameCmd.Objects[0,20]:=TObject(@g_GameCommand.UNLOCK);

  StringGridGameCmd.Cells[0,21]:=g_GameCommand.LOCK.sCmd;
  StringGridGameCmd.Cells[1,21]:=IntToStr(g_GameCommand.LOCK.nPermissionMin);
  StringGridGameCmd.Cells[2,21]:='@' + g_GameCommand.LOCK.sCmd;
  StringGridGameCmd.Objects[0,21]:=TObject(@g_GameCommand.LOCK);

  StringGridGameCmd.Cells[0,22]:=g_GameCommand.SETPASSWORD.sCmd;
  StringGridGameCmd.Cells[1,22]:=IntToStr(g_GameCommand.SETPASSWORD.nPermissionMin);
  StringGridGameCmd.Cells[2,22]:='@' + g_GameCommand.SETPASSWORD.sCmd;
  StringGridGameCmd.Objects[0,22]:=TObject(@g_GameCommand.SETPASSWORD);

  StringGridGameCmd.Cells[0,23]:=g_GameCommand.CHGPASSWORD.sCmd;
  StringGridGameCmd.Cells[1,23]:=IntToStr(g_GameCommand.CHGPASSWORD.nPermissionMin);
  StringGridGameCmd.Cells[2,23]:='@' + g_GameCommand.CHGPASSWORD.sCmd;
  StringGridGameCmd.Objects[0,23]:=TObject(@g_GameCommand.CHGPASSWORD);

  StringGridGameCmd.Cells[0,24]:=g_GameCommand.UNPASSWORD.sCmd;
  StringGridGameCmd.Cells[1,24]:=IntToStr(g_GameCommand.UNPASSWORD.nPermissionMin);
  StringGridGameCmd.Cells[2,24]:='@' + g_GameCommand.UNPASSWORD.sCmd;
  StringGridGameCmd.Objects[0,24]:=TObject(@g_GameCommand.UNPASSWORD);

  StringGridGameCmd.Cells[0,25]:=g_GameCommand.MEMBERFUNCTION.sCmd;
  StringGridGameCmd.Cells[1,25]:=IntToStr(g_GameCommand.MEMBERFUNCTION.nPermissionMin);
  StringGridGameCmd.Cells[2,25]:='@' + g_GameCommand.MEMBERFUNCTION.sCmd;
  StringGridGameCmd.Objects[0,25]:=TObject(@g_GameCommand.MEMBERFUNCTION);



  StringGridGameCmd.Cells[0,28]:=g_GameCommand.DEARRECALL.sCmd;
  StringGridGameCmd.Cells[1,28]:=IntToStr(g_GameCommand.DEARRECALL.nPermissionMin);
  StringGridGameCmd.Cells[2,28]:='@' + g_GameCommand.DEARRECALL.sCmd;
  StringGridGameCmd.Objects[0,28]:=TObject(@g_GameCommand.DEARRECALL);



  StringGridGameCmd.Cells[0,32]:=g_GameCommand.ATTACKMODE.sCmd;
  StringGridGameCmd.Cells[1,32]:=IntToStr(g_GameCommand.ATTACKMODE.nPermissionMin);
  StringGridGameCmd.Cells[2,32]:='@' + g_GameCommand.ATTACKMODE.sCmd;
  StringGridGameCmd.Objects[0,32]:=TObject(@g_GameCommand.ATTACKMODE);

  StringGridGameCmd.Cells[0,33]:=g_GameCommand.REST.sCmd;
  StringGridGameCmd.Cells[1,33]:=IntToStr(g_GameCommand.REST.nPermissionMin);
  StringGridGameCmd.Cells[2,33]:='@' + g_GameCommand.REST.sCmd;
  StringGridGameCmd.Objects[0,33]:=TObject(@g_GameCommand.REST);

  StringGridGameCmd.Cells[0,34]:=g_GameCommand.TAKEONHORSE.sCmd;
  StringGridGameCmd.Cells[1,34]:=IntToStr(g_GameCommand.TAKEONHORSE.nPermissionMin);
  StringGridGameCmd.Cells[2,34]:='@' + g_GameCommand.TAKEONHORSE.sCmd;
  StringGridGameCmd.Objects[0,34]:=TObject(@g_GameCommand.TAKEONHORSE);

  StringGridGameCmd.Cells[0,35]:=g_GameCommand.TAKEOFHORSE.sCmd;
  StringGridGameCmd.Cells[1,35]:=IntToStr(g_GameCommand.TAKEOFHORSE.nPermissionMin);
  StringGridGameCmd.Cells[2,35]:='@' + g_GameCommand.TAKEOFHORSE.sCmd;
  StringGridGameCmd.Objects[0,35]:=TObject(@g_GameCommand.TAKEOFHORSE);

  StringGridGameCmd.Cells[0,36]:=g_GameCommand.MEMBERFUNCTIONEX.sCmd;
  StringGridGameCmd.Cells[1,36]:=IntToStr(g_GameCommand.MEMBERFUNCTIONEX.nPermissionMin);
  StringGridGameCmd.Cells[2,36]:='@' + g_GameCommand.MEMBERFUNCTIONEX.sCmd;
  StringGridGameCmd.Objects[0,36]:=TObject(@g_GameCommand.MEMBERFUNCTIONEX);

  StringGridGameCmd.Cells[0,37]:=g_GameCommand.LOCKLOGON.sCmd;
  StringGridGameCmd.Cells[1,37]:=IntToStr(g_GameCommand.LOCKLOGON.nPermissionMin);
  StringGridGameCmd.Cells[2,37]:='@' + g_GameCommand.LOCKLOGON.sCmd;
  StringGridGameCmd.Objects[0,37]:=TObject(@g_GameCommand.LOCKLOGON);

  StringGridGameCmd.Cells[0,38]:=g_GameCommand.HOMEMOVE.sCmd;  //付阑捞悼
  StringGridGameCmd.Cells[1,38]:=IntToStr(g_GameCommand.HOMEMOVE.nPermissionMin);
  StringGridGameCmd.Cells[2,38]:='@' + g_GameCommand.HOMEMOVE.sCmd;
  StringGridGameCmd.Objects[0,38]:=TObject(@g_GameCommand.HOMEMOVE);

  StringGridGameCmd.Cells[0,39]:=g_GameCommand.REALIVEHOME.sCmd;  //付阑何劝
  StringGridGameCmd.Cells[1,39]:=IntToStr(g_GameCommand.REALIVEHOME.nPermissionMin);
  StringGridGameCmd.Cells[2,39]:='@' + g_GameCommand.REALIVEHOME.sCmd;
  StringGridGameCmd.Objects[0,39]:=TObject(@g_GameCommand.REALIVEHOME);
end;

procedure TfrmGameCmd.StringGridGameCmdClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
begin
  nIndex:=StringGridGameCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    EditUserCmdName.Text:=GameCmd.sCmd;
    EditUserCmdPerMission.Value:=GameCmd.nPermissionMin;
    LabelUserCmdParam.Caption:=StringGridGameCmd.Cells[2,nIndex];
    LabelUserCmdFunc.Caption:=StringGridGameCmd.Cells[3,nIndex];
  end;
  EditUserCmdOK.Enabled:=False;
end;

procedure TfrmGameCmd.EditUserCmdNameChange(Sender: TObject);
begin
  EditUserCmdOK.Enabled:=True;
  EditUserCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditUserCmdPerMissionChange(Sender: TObject);
begin
  EditUserCmdOK.Enabled:=True;
  EditUserCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditUserCmdOKClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
  sCmd:String;
  nPerMission:Integer;
begin
  sCmd:=Trim(EditUserCmdName.Text);
  nPermission:=EditUserCmdPerMission.Value;
  if sCmd = '' then begin
    Application.MessageBox('命令名称不能为空！！！','提示信息',MB_OK + MB_ICONERROR);
    EditUserCmdName.SetFocus;
    exit;
  end;

  nIndex:=StringGridGameCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    GameCmd.sCmd:=sCmd;
    GameCmd.nPermissionMin:=nPermission;
  end;
  RefUserCommand();
end;

procedure TfrmGameCmd.EditUserCmdSaveClick(Sender: TObject);
begin
  EditUserCmdSave.Enabled:=False;

  CommandConf.WriteString('Command','Date',g_GameCommand.DATA.sCmd);
  CommandConf.WriteString('Command','PrvMsg',g_GameCommand.PRVMSG.sCmd);
  CommandConf.WriteString('Command','AllowMsg',g_GameCommand.ALLOWMSG.sCmd);
  CommandConf.WriteString('Command','LetShout',g_GameCommand.LETSHOUT.sCmd);
  CommandConf.WriteString('Command','LetTrade',g_GameCommand.LETTRADE.sCmd);
  CommandConf.WriteString('Command','LetGuild',g_GameCommand.LETGUILD.sCmd);
  CommandConf.WriteString('Command','Energy',g_GameCommand.ENERGY.sCmd);
  CommandConf.WriteString('Command','EndGuild',g_GameCommand.ENDGUILD.sCmd);
  CommandConf.WriteString('Command','BanGuildChat',g_GameCommand.BANGUILDCHAT.sCmd);
  CommandConf.WriteString('Command','BanGroupChat',g_GameCommand.BANGROUPCHAT.sCmd);
  CommandConf.WriteString('Command','AuthAlly',g_GameCommand.AUTHALLY.sCmd);
  CommandConf.WriteString('Command','Alliance',g_GameCommand.ALLIANCE.sCmd);
  CommandConf.WriteString('Command','CancelAlliance',g_GameCommand.CANCELALLIANCE.sCmd);
  CommandConf.WriteString('Command','ViewDiary',g_GameCommand.DIARY.sCmd);
  CommandConf.WriteString('Command','UserMove',g_GameCommand.USERMOVE.sCmd);
  CommandConf.WriteString('Command','Searching',g_GameCommand.SEARCHING.sCmd);
  CommandConf.WriteString('Command','AllowGroupCall',g_GameCommand.ALLOWGROUPCALL.sCmd);
  CommandConf.WriteString('Command','HomeMove',g_GameCommand.HOMEMOVE.sCmd);  //付阑捞悼
  CommandConf.WriteString('Command','ReAliveHome',g_GameCommand.ReAliveHome.sCmd);  //付阑何劝
  CommandConf.WriteString('Command','GroupCall',g_GameCommand.GROUPRECALLL.sCmd);
  CommandConf.WriteString('Command','AllowGuildReCall',g_GameCommand.ALLOWGUILDRECALL.sCmd);
  CommandConf.WriteString('Command','GuildReCall',g_GameCommand.GUILDRECALLL.sCmd);
  CommandConf.WriteString('Command','StorageUnLock',g_GameCommand.UNLOCKSTORAGE.sCmd);
  CommandConf.WriteString('Command','PasswordUnLock',g_GameCommand.UNLOCK.sCmd);
  CommandConf.WriteString('Command','StorageLock',g_GameCommand.LOCK.sCmd);
  CommandConf.WriteString('Command','StorageSetPassword',g_GameCommand.SETPASSWORD.sCmd);
  CommandConf.WriteString('Command','StorageChgPassword',g_GameCommand.CHGPASSWORD.sCmd);
//  CommandConf.WriteString('Command','StorageClearPassword',g_GameCommand.CLRPASSWORD.sCmd)
//  CommandConf.WriteInteger('Permission','StorageClearPassword', g_GameCommand.CLRPASSWORD.nPermissionMin)
  CommandConf.WriteString('Command','StorageUserClearPassword',g_GameCommand.UNPASSWORD.sCmd);
  CommandConf.WriteString('Command','MemberFunc',g_GameCommand.MEMBERFUNCTION.sCmd);
  CommandConf.WriteString('Command','DearRecall',g_GameCommand.DEARRECALL.sCmd);

  CommandConf.WriteString('Command','AttackMode',g_GameCommand.ATTACKMODE.sCmd);
  CommandConf.WriteString('Command','Rest',g_GameCommand.REST.sCmd);
  CommandConf.WriteString('Command','TakeOnHorse',g_GameCommand.TAKEONHORSE.sCmd);
  CommandConf.WriteString('Command','TakeOffHorse',g_GameCommand.TAKEOFHORSE.sCmd);
  CommandConf.WriteInteger('Permission','Date', g_GameCommand.DATA.nPermissionMin);
  CommandConf.WriteInteger('Permission','PrvMsg', g_GameCommand.PRVMSG.nPermissionMin);
  CommandConf.WriteInteger('Permission','AllowMsg', g_GameCommand.ALLOWMSG.nPermissionMin);
end;
procedure TfrmGameCmd.RefGameMasterCmd(GameCmd:pTGameCmd;sCmdParam,sDesc:String);
begin
  Inc(nRefGameMasterIndex);
  if StringGridGameMasterCmd.RowCount - 1 < nRefGameMasterIndex then begin
    StringGridGameMasterCmd.RowCount:=nRefGameMasterIndex + 1;
  end;
    
  StringGridGameMasterCmd.Cells[0,nRefGameMasterIndex]:=GameCmd.sCmd;
  StringGridGameMasterCmd.Cells[1,nRefGameMasterIndex]:=IntToStr(GameCmd.nPermissionMin) + '/' + IntToStr(GameCmd.nPermissionMax);
  StringGridGameMasterCmd.Cells[2,nRefGameMasterIndex]:=sCmdParam;
  StringGridGameMasterCmd.Cells[3,nRefGameMasterIndex]:=sDesc;
  StringGridGameMasterCmd.Objects[0,nRefGameMasterIndex]:=TObject(GameCmd);
end;
procedure TfrmGameCmd.RefGameMasterCommand;
begin
  EditGameMasterCmdOK.Enabled:=False;
  nRefGameMasterIndex:=0;

  RefGameMasterCmd(@g_GameCommand.CLRPASSWORD,
                   '@' + g_GameCommand.CLRPASSWORD.sCmd + ' <用户名>',
                   '清除用户密码。');

  RefGameMasterCmd(@g_GameCommand.WHO,
                   '@' + g_GameCommand.WHO.sCmd,
                   '显示连接到当前服务器的用户总数。');

  RefGameMasterCmd(@g_GameCommand.TOTAL,
                   '@' + g_GameCommand.TOTAL.sCmd,
                   '显示所有服务器连接的用户总数。');


  RefGameMasterCmd(@g_GameCommand.GAMEMASTER,
                   '@' + g_GameCommand.GAMEMASTER.sCmd,
                   '进入或者退出管理模式。 (对怪物隐身)');

  RefGameMasterCmd(@g_GameCommand.OBSERVER,
                   '@' + g_GameCommand.OBSERVER.sCmd,
                   '进入或者退出隐身模式。 (对所有隐身)');

  RefGameMasterCmd(@g_GameCommand.SUEPRMAN,
                   '@' + g_GameCommand.SUEPRMAN.sCmd,
                   '进入或者退出无敌模式。');

  RefGameMasterCmd(@g_GameCommand.MAKE,
                   '@' + g_GameCommand.MAKE.sCmd + ' <物品名字> <数量>',
                   '手动制造物品。');

  RefGameMasterCmd(@g_GameCommand.SMAKE,
                   '@' + g_GameCommand.SMAKE.sCmd + ' <物品名字> <攻击> <魔法> <道术>',
                   '增加物品属性。');

  RefGameMasterCmd(@g_GameCommand.MOVE,
                   '@' + g_GameCommand.MOVE.sCmd + ' <地图编号>',
                   '将玩家移动到指定地图上的随机位置。');

  RefGameMasterCmd(@g_GameCommand.POSITIONMOVE,
                   '@' + g_GameCommand.POSITIONMOVE.sCmd + ' <地图编号> <X坐标> <Y坐标>',
                   '将玩家移动到指定地图上的设定位置。');

  RefGameMasterCmd(@g_GameCommand.RECALL,
                   '@' + g_GameCommand.RECALL.sCmd + ' <用户名>',
                   '将指定的玩家传送到你的位置。');

  RefGameMasterCmd(@g_GameCommand.REGOTO,
                   '@' + g_GameCommand.REGOTO.sCmd + ' <用户名>',
                   '将命令用户传送到指定的用户位置。');

  RefGameMasterCmd(@g_GameCommand.TING,
                   '@' + g_GameCommand.TING.sCmd + ' <用户名>',
                   '随机传送玩家。');

  RefGameMasterCmd(@g_GameCommand.SUPERTING,
                   '@' + g_GameCommand.SUPERTING.sCmd + ' <用户名> <数量(0 - 10)>',
                   '随机传送一名玩家和周围的玩家。');

  RefGameMasterCmd(@g_GameCommand.MAPMOVE,
                   '@' + g_GameCommand.MAPMOVE.sCmd + ' <老地图编号> <新地图编号>',
                   '从老地图传唤到新地图。');

  RefGameMasterCmd(@g_GameCommand.INFO,
                   '@' + g_GameCommand.INFO.sCmd + ' <用户名>',
                   '显示指定用户的详细信息。');

  RefGameMasterCmd(@g_GameCommand.HUMANLOCAL,
                   '@' + g_GameCommand.HUMANLOCAL.sCmd + ' <地图编号>',
                   '显示指定地图上的玩家数量。');

  RefGameMasterCmd(@g_GameCommand.VIEWWHISPER,
                   '@' + g_GameCommand.VIEWWHISPER.sCmd + ' <用户名>',
                   '连接发送到用户的私聊信息。');

  RefGameMasterCmd(@g_GameCommand.MOBLEVEL,
                   '@' + g_GameCommand.MOBLEVEL.sCmd,
                   '显示周围的怪物等级信息。');

  RefGameMasterCmd(@g_GameCommand.MOBCOUNT,
                   '@' + g_GameCommand.MOBCOUNT.sCmd + ' <地图编号>',
                   '显示指定地图上的怪物数量。');

  RefGameMasterCmd(@g_GameCommand.HUMANCOUNT,
                   '@' + g_GameCommand.HUMANCOUNT.sCmd,
                   '当前地图上的玩家数量。');

  RefGameMasterCmd(@g_GameCommand.MAP,
                   '@' + g_GameCommand.MAP.sCmd,
                   '显示当前地图文件名。');

  RefGameMasterCmd(@g_GameCommand.LEVEL,
                   '@' + g_GameCommand.LEVEL.sCmd,
                   '改变自己的等级。');

  RefGameMasterCmd(@g_GameCommand.KICK,
                   '@' + g_GameCommand.KICK.sCmd + ' <用户名>',
                   '将指定的用户踢下线。');

  RefGameMasterCmd(@g_GameCommand.REALIVE,
                   '@' + g_GameCommand.REALIVE.sCmd + ' <用户名>',
                   '复活指定的玩家。');

  RefGameMasterCmd(@g_GameCommand.KILL,
                   '@' + g_GameCommand.KILL.sCmd + '<用户名>',
                   'Kills a player instantly');

  RefGameMasterCmd(@g_GameCommand.CHANGEJOB,
                   '@' + g_GameCommand.CHANGEJOB.sCmd + ' <用户名> <职业(战士, 法师, 道士)>',
                   '改变玩家的职业。');

  RefGameMasterCmd(@g_GameCommand.CHANGEJOBUP,
                   '@' + g_GameCommand.CHANGEJOBUP.sCmd + ' <用户名> <职业(碧血战士, 洪玄法师, 翼善道士)>',
                   '改变玩家的羽化登仙职业。');

  RefGameMasterCmd(@g_GameCommand.FREEPENALTY,
                   '@' + g_GameCommand.FREEPENALTY.sCmd + ' <用户名>',
                   '清除玩家的PK值。');

  RefGameMasterCmd(@g_GameCommand.KILLDEATHZERO,
                   '@' + g_GameCommand.KILLDEATHZERO.sCmd + ' <用户名>',
                   '清除玩家的杀敌/死亡值。');

  RefGameMasterCmd(@g_GameCommand.PKPOINT,
                   '@' + g_GameCommand.PKPOINT.sCmd + ' <用户名>',
                   '显示指定的用户PK点。');

  RefGameMasterCmd(@g_GameCommand.INCPKPOINT,
                   '@' + g_GameCommand.INCPKPOINT.sCmd + ' <用户名> <数量>',
                   '将指定的用户PK点按指定数量增加。');

  RefGameMasterCmd(@g_GameCommand.CHANGEGENDER,
                   '@' + g_GameCommand.CHANGEGENDER.sCmd + ' <用户名> <性别(男, 女)>',
                   '改变玩家的性别。');

  RefGameMasterCmd(@g_GameCommand.HAIR,
                   '@' + g_GameCommand.HAIR.sCmd + ' <头发编号(0 or 1)>',
                   '设置玩家的头发类型。');

  RefGameMasterCmd(@g_GameCommand.BONUSPOINT,
                   '@' + g_GameCommand.BONUSPOINT.sCmd + ' <用户名> <积分>',
                   '显示指定用户奖励积分。');

  RefGameMasterCmd(@g_GameCommand.DELBONUSPOINT,
                   '@' + g_GameCommand.DELBONUSPOINT.sCmd + ' <用户名>',
                   '删除指定的用户奖励积分。');

  RefGameMasterCmd(@g_GameCommand.RESTBONUSPOINT,
                   '@' + g_GameCommand.RESTBONUSPOINT.sCmd + ' <用户名>',
                   '重置指定用户奖励积分。');

  RefGameMasterCmd(@g_GameCommand.SETPERMISSION,
                   '@' + g_GameCommand.SETPERMISSION.sCmd + ' <用户名> <权限级别(0 - 10)>',
                   '设置指定的用户使用任务权限。');

  RefGameMasterCmd(@g_GameCommand.RENEWLEVEL,
                   '@' + g_GameCommand.RENEWLEVEL.sCmd + ' <用户名> <等级>',
                   '设置指定用户重生级别。');

  RefGameMasterCmd(@g_GameCommand.DELGOLD,
                   '@' + g_GameCommand.DELGOLD.sCmd + ' <用户名> <数量 >',
                   '删除指定的角色背包中的金币数量。');

  RefGameMasterCmd(@g_GameCommand.ADDGOLD,
                   '@' + g_GameCommand.ADDGOLD.sCmd + ' <用户名> <数量 >',
                   '增加指定的角色背包中的金币数量。');

  RefGameMasterCmd(@g_GameCommand.GAMEGOLD,
                   '@' + g_GameCommand.GAMEGOLD.sCmd + ' <用户名> <设置(+ - =)> <数量>',
                   '显示（如果仅使用<username>）/添加/删除/设置指定的玩家游戏币。');

  RefGameMasterCmd(@g_GameCommand.GAMEPOINT,
                   '@' + g_GameCommand.GAMEPOINT.sCmd + ' <用户名> <设置(+ - =)> <数量>',
                   '显示（如果仅使用<username>）/添加/删除/设置指定的玩家游戏点。');

  RefGameMasterCmd(@g_GameCommand.REFINEWEAPON,
                   '@' + g_GameCommand.REFINEWEAPON.sCmd + ' <攻击> <魔法> <道术> <准确>',
                   '升级指定武器的属性。');


  RefGameMasterCmd(@g_GameCommand.ADJUESTLEVEL,
                   '@' + g_GameCommand.ADJUESTLEVEL.sCmd + ' <用户名> <级别>',
                   '调整指定玩家的等级。');

  RefGameMasterCmd(@g_GameCommand.ADJUESTEXP,
                   '@' + g_GameCommand.ADJUESTEXP.sCmd + ' <用户名> <经验值>',
                   '调整指定玩家的经验值。');



  RefGameMasterCmd(@g_GameCommand.RECALLMOB,
                   '@' + g_GameCommand.RECALLMOB.sCmd + ' <怪物名> <数量> <怪物级别(0-9)>',
                   '召唤指定数量、指定级别的怪物作为自己的宠物。');

  RefGameMasterCmd(@g_GameCommand.TRAINING,
                   '@' + g_GameCommand.TRAINING.sCmd + ' <用户名> <技能名> <仅能等级(0-3)>',
                   '为指定玩家增加指定级别的技能。');


  RefGameMasterCmd(@g_GameCommand.TRAININGSKILL,
                   '@' + g_GameCommand.TRAININGSKILL.sCmd  + ' <用户名> <技能名> <仅能等级(0-3)>',
                   '将指定玩家的指定技能设置为指定级别。');

  RefGameMasterCmd(@g_GameCommand.DELETESKILL,
                   '@' + g_GameCommand.DELETESKILL.sCmd + ' <用户名> <技能名称(全部)>',
                   '删除指定玩家的全部技能。');

  RefGameMasterCmd(@g_GameCommand.DELETEITEM,
                   '@' + g_GameCommand.DELETEITEM.sCmd + ' <用户名> <物品名称> <数量>',
                   '从指定用户中删除的指定数量的物品。');

  RefGameMasterCmd(@g_GameCommand.CLEARMISSION,
                   '@' + g_GameCommand.CLEARMISSION.sCmd + ' <用户名>',
                   '停止已经设定的任务，怪物将恢复正常。');

  RefGameMasterCmd(@g_GameCommand.ADDGUILD,
                   '@' + g_GameCommand.ADDGUILD.sCmd + ' <行会名> <行会掌门>',
                   '创建一个行会掌门。');

  RefGameMasterCmd(@g_GameCommand.DELGUILD,
                   '@' + g_GameCommand.DELGUILD.sCmd + ' <行会名>',
                   '删除一个行会。');

  RefGameMasterCmd(@g_GameCommand.CHANGESABUKLORD,
                   '@' + g_GameCommand.CHANGESABUKLORD.sCmd + ' <城堡名称> <行会名称>',
                   '更改指定城堡的管理行会。');

  RefGameMasterCmd(@g_GameCommand.FORCEDWALLCONQUESTWAR,
                   '@' + g_GameCommand.FORCEDWALLCONQUESTWAR.sCmd,
                   '手动开始攻城战。');

  RefGameMasterCmd(@g_GameCommand.CONTESTPOINT,
                   '@' + g_GameCommand.CONTESTPOINT.sCmd + ' <Guildname>',
                   '查看行会争霸赛得分情况(支持权限分配)。');

  RefGameMasterCmd(@g_GameCommand.STARTCONTEST,
                   '@' + g_GameCommand.STARTCONTEST.sCmd,
                   '开始行会争霸赛(支持权限分配)。');

  RefGameMasterCmd(@g_GameCommand.ENDCONTEST,
                   '@' + g_GameCommand.ENDCONTEST.sCmd,
                   '结束行会争霸赛(支持权限分配)。');

  RefGameMasterCmd(@g_GameCommand.ANNOUNCEMENT,
                   '@' + g_GameCommand.ANNOUNCEMENT.sCmd,
                   '(支持权限分配)');


  RefGameMasterCmd(@g_GameCommand.MOB,
                   '@' + g_GameCommand.MOB.sCmd + ' <怪物名> <数量>',
                   '使用命令刷出怪物。');

  RefGameMasterCmd(@g_GameCommand.MISSION,
                   '@' + g_GameCommand.MISSION.sCmd + ' <X> <Y>',
                   '设置人物怪物的集合地点。');

  RefGameMasterCmd(@g_GameCommand.MOBPLACE,
                   '@' + g_GameCommand.MOBPLACE.sCmd + ' <X> <Y> <怪物名> <怪物数量>',
                   '在当前地图指定XY放置怪物(支持权限分配(先必须设置怪物的集中点)，放置的怪物大刀守卫不会攻击这些怪物');

  RefGameMasterCmd(@g_GameCommand.CLEARMON,
                   '@' + g_GameCommand.CLEARMON.sCmd + ' 地图号(* 为所有) 怪物名称(* 为所有) 掉物品(0,1)',
                   '清除指定地图的怪物 - 包括任何宠物 ');

  RefGameMasterCmd(@g_GameCommand.DISABLESENDMSG,
                   '@' + g_GameCommand.DISABLESENDMSG.sCmd + ' <用户名>',
                   '将指定人物加入发言过滤列表，加入列表后自己发的文字自己可以看到，其他人看不到(支持权限分配)');

  RefGameMasterCmd(@g_GameCommand.ENABLESENDMSG,
                   '@' + g_GameCommand.ENABLESENDMSG.sCmd,
                   '将指定人物从发言过滤列表中删除(支持权限分配)');

  RefGameMasterCmd(@g_GameCommand.DISABLESENDMSGLIST,
                   '@' + g_GameCommand.DISABLESENDMSGLIST.sCmd,
                   '查看发言过滤列表中的内容(支持权限分配)');

  RefGameMasterCmd(@g_GameCommand.SHUTUP,
                   '@' + g_GameCommand.SHUTUP.sCmd + ' <用户名>',
                   '禁止和玩家私聊。');

  RefGameMasterCmd(@g_GameCommand.RELEASESHUTUP,
                   '@' + g_GameCommand.RELEASESHUTUP.sCmd  + ' <用户名>',
                   '使玩家解除禁言可以再次聊天。');

  RefGameMasterCmd(@g_GameCommand.SHUTUPLIST,
                   '@' + g_GameCommand.SHUTUPLIST.sCmd,
                   '显示禁止聊天的用户列表。');

  RefGameMasterCmd(@g_GameCommand.SVNINFO,
                   '@' + g_GameCommand.SVNINFO.sCmd,
                   '获取Svn信息 ');

  RefGameMasterCmd(@g_GameCommand.SABUKWALLGOLD,
                   '@' + g_GameCommand.SABUKWALLGOLD.sCmd,
                   '查看城堡金币数(支持权限分配)');

  RefGameMasterCmd(@g_GameCommand.STARTQUEST,
                   '@' + g_GameCommand.STARTQUEST.sCmd,
                   '开始提问功能，游戏中所有人同时跳出问题窗口(支持权限分配)');

  RefGameMasterCmd(@g_GameCommand.DENYIPLOGON,
                   '@' + g_GameCommand.DENYIPLOGON.sCmd + ' <IP 地址> <禁用/启用 (0,1)>',
                   '阻止特定的IP地址登录。');

  RefGameMasterCmd(@g_GameCommand.DENYACCOUNTLOGON,
                   '@' + g_GameCommand.DENYACCOUNTLOGON.sCmd + ' <用户ID> <禁用/启用 (0,1)>',
                   '阻止特定帐户登录。');

  RefGameMasterCmd(@g_GameCommand.DENYCHARNAMELOGON,
                   '@' + g_GameCommand.DENYCHARNAMELOGON.sCmd + ' <用户名> <禁用/启用 (0,1)>',
                   '阻止特定的角色名登录 ');

  RefGameMasterCmd(@g_GameCommand.DELDENYIPLOGON,
                   '@' + g_GameCommand.DELDENYIPLOGON.sCmd,
                   '将组织阻止登录的IP地址从列表中删除。');

  RefGameMasterCmd(@g_GameCommand.DELDENYACCOUNTLOGON,
                   '@' + g_GameCommand.DELDENYACCOUNTLOGON.sCmd,
                   '将组织阻止登录的账号从列表中删除。');

  RefGameMasterCmd(@g_GameCommand.DELDENYCHARNAMELOGON,
                   '@' + g_GameCommand.DELDENYCHARNAMELOGON.sCmd,
                   '将组织阻止登录的角色名从列表中删除。');

  RefGameMasterCmd(@g_GameCommand.SHOWDENYIPLOGON,
                   '@' + g_GameCommand.SHOWDENYIPLOGON.sCmd,
                   '显示禁止的IP地址列表。');

  RefGameMasterCmd(@g_GameCommand.SHOWDENYACCOUNTLOGON,
                   '@' + g_GameCommand.SHOWDENYACCOUNTLOGON.sCmd,
                   '显示禁止账户列表。');


  RefGameMasterCmd(@g_GameCommand.SHOWDENYCHARNAMELOGON,
                   '@' + g_GameCommand.SHOWDENYCHARNAMELOGON.sCmd,
                   '显示禁止角色列表。');

  RefGameMasterCmd(@g_GameCommand.SETMAPMODE,
                   '@' + g_GameCommand.SETMAPMODE.sCmd,
                   '设置地图模式');

  RefGameMasterCmd(@g_GameCommand.SHOWMAPMODE,
                   '@' + g_GameCommand.SHOWMAPMODE.sCmd,
                   '显示地图模式');

  RefGameMasterCmd(@g_GameCommand.ATTACK,
                   '@' + g_GameCommand.ATTACK.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.LUCKYPOINT,
                   '@' + g_GameCommand.LUCKYPOINT.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.CHANGELUCK,
                   '@' + g_GameCommand.CHANGELUCK.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.NAMECOLOR,
                   '@' + g_GameCommand.NAMECOLOR.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.TRANSPARECY,
                   '@' + g_GameCommand.TRANSPARECY.sCmd,
                   '');


  RefGameMasterCmd(@g_GameCommand.LEVEL0,
                   '@' + g_GameCommand.LEVEL0.sCmd,
                   '');


  RefGameMasterCmd(@g_GameCommand.CHANGEITEMNAME,
                   '@' + g_GameCommand.CHANGEITEMNAME.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.ADDTOITEMEVENT,
                   '@' + g_GameCommand.ADDTOITEMEVENT.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.ADDTOITEMEVENTASPIECES,
                   '@' + g_GameCommand.ADDTOITEMEVENTASPIECES.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.ITEMEVENTLIST,
                   '@' + g_GameCommand.ITEMEVENTLIST.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.STARTINGGIFTNO,
                   '@' + g_GameCommand.STARTINGGIFTNO.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.DELETEALLITEMEVENT,
                   '@' + g_GameCommand.DELETEALLITEMEVENT.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.STARTITEMEVENT,
                   '@' + g_GameCommand.STARTITEMEVENT.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.ITEMEVENTTERM,
                   '@' + g_GameCommand.ITEMEVENTTERM.sCmd,
                   '');


  RefGameMasterCmd(@g_GameCommand.OPDELETESKILL,
                   '@' + g_GameCommand.OPDELETESKILL.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.CHANGEWEAPONDURA,
                   '@' + g_GameCommand.CHANGEWEAPONDURA.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.SBKDOOR,
                   '@' + g_GameCommand.SBKDOOR.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.SPIRIT,
                   '@' + g_GameCommand.SPIRIT.sCmd,
                   '');

  RefGameMasterCmd(@g_GameCommand.SPIRITSTOP,
                   '@' + g_GameCommand.SPIRITSTOP.sCmd,
                   '');

end;

procedure TfrmGameCmd.RefGameDebugCmd(GameCmd:pTGameCmd;sCmdParam,sDesc:String);
begin
  Inc(nRefGameDebugIndex);
  if StringGridGameMasterCmd.RowCount - 1 < nRefGameDebugIndex then begin
    StringGridGameDebugCmd.RowCount:=nRefGameDebugIndex + 1;
  end;
    
  StringGridGameDebugCmd.Cells[0,nRefGameDebugIndex]:=GameCmd.sCmd;
  StringGridGameDebugCmd.Cells[1,nRefGameDebugIndex]:=IntToStr(GameCmd.nPermissionMin) + '/' + IntToStr(GameCmd.nPermissionMax);
  StringGridGameDebugCmd.Cells[2,nRefGameDebugIndex]:=sCmdParam;
  StringGridGameDebugCmd.Cells[3,nRefGameDebugIndex]:=sDesc;
  StringGridGameDebugCmd.Objects[0,nRefGameDebugIndex]:=TObject(GameCmd);
end;

procedure TfrmGameCmd.RefDebugCommand;
var
  GameCmd:pTGameCmd;
begin
  EditGameDebugCmdOK.Enabled:=False;
//  StringGridGameDebugCmd.RowCount:=41;

  GameCmd:=@g_GameCommand.SHOWFLAG;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '显示指定标志的状态。');

  GameCmd:=@g_GameCommand.SETFLAG;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '设置用户的指定标志。');

  GameCmd:=@g_GameCommand.SHOWOPEN;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.SETOPEN;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.SHOWUNIT;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.SETUNIT;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');
                   
  GameCmd:=@g_GameCommand.MOBNPC;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.DELNPC;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.LOTTERYTICKET;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.RELOADADMIN;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载GM列表。');

  GameCmd:=@g_GameCommand.RELOADCOLUMN;   //全焊窜
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载列列表。');

  GameCmd:=@g_GameCommand.RELOADNPC;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载 NPC 列表。');

  GameCmd:=@g_GameCommand.RELOADMANAGE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载任务管理器。');

  GameCmd:=@g_GameCommand.RELOADROBOTMANAGE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载机器人管理器。');

  GameCmd:=@g_GameCommand.RELOADROBOT;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载机器人。');

  GameCmd:=@g_GameCommand.RELOADMONITEMS;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载爆率信息。');

  GameCmd:=@g_GameCommand.RELOADDIARY;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载任务日记。');

  GameCmd:=@g_GameCommand.RELOADITEMDB;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载物品数据库。');

  GameCmd:=@g_GameCommand.RELOADMAGICDB;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载魔法数据库。');

  GameCmd:=@g_GameCommand.RELOADMONSTERDB;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载怪物数据库。');

  GameCmd:=@g_GameCommand.RELOADMINMAP;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载小地图信息。');

  GameCmd:=@g_GameCommand.RELOADBIGMAP;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载大地图信息。');

  GameCmd:=@g_GameCommand.RELOADGUILD;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd + ' <行会名>',
                   '重新加载行会信息。');

  GameCmd:=@g_GameCommand.RELOADGUILDALL;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载所有行会信息。');

  GameCmd:=@g_GameCommand.RELOADLINENOTICE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载在线提示信息。');

  GameCmd:=@g_GameCommand.RELOADABUSE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '重新加载过滤信息列表。');

  GameCmd:=@g_GameCommand.BACKSTEP;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '还原用户信息。');

  GameCmd:=@g_GameCommand.RECONNECTION;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd + ' <IP 地址> <端口>',
                   '将指定人物重新切换网络连接');

  GameCmd:=@g_GameCommand.DISABLEFILTER;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '关闭过滤系统。');

  GameCmd:=@g_GameCommand.CHGUSERFULL;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd + ' <数量>',
                   '更改可同时连接的用户数量。');

  GameCmd:=@g_GameCommand.CHGZENFASTSTEP;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.OXQUIZROOM;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.BALL;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.FIREBURN;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.TESTFIRE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.TESTSTATUS;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.TESTGOLDCHANGE;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.GSA;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.TESTGA;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd,
                   '');

  GameCmd:=@g_GameCommand.MAPINFO;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd + ' <地图名> <X> <Y>',
                   '显示地图信息');

  GameCmd:=@g_GameCommand.CLEARBAG;
  RefGameDebugCmd(GameCmd,
                   '@' + GameCmd.sCmd + ' <用户名>',
                   '清空包裹所有物品。');

end;

procedure TfrmGameCmd.StringGridGameMasterCmdClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
begin
  nIndex:=StringGridGameMasterCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameMasterCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    EditGameMasterCmdName.Text:=GameCmd.sCmd;
    EditGameMasterCmdPerMission.Value:=GameCmd.nPermissionMin;
    LabelGameMasterCmdParam.Caption:=StringGridGameMasterCmd.Cells[2,nIndex];
    LabelGameMasterCmdFunc.Caption:=StringGridGameMasterCmd.Cells[3,nIndex];
  end;
  EditGameMasterCmdOK.Enabled:=False;
end;

procedure TfrmGameCmd.EditGameMasterCmdNameChange(Sender: TObject);
begin
  EditGameMasterCmdOK.Enabled:=True;
  EditGameMasterCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditGameMasterCmdPerMissionChange(Sender: TObject);
begin
  EditGameMasterCmdOK.Enabled:=True;
  EditGameMasterCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditGameMasterCmdOKClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
  sCmd:String;
  nPerMission:Integer;
begin

  sCmd:=Trim(EditGameMasterCmdName.Text);
  nPermission:=EditGameMasterCmdPerMission.Value;
  if sCmd = '' then begin
    Application.MessageBox('命令使用权限不足。','提示信息',MB_OK + MB_ICONERROR);
    EditGameMasterCmdName.SetFocus;
    exit;
  end;

  nIndex:=StringGridGameMasterCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameMasterCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    GameCmd.sCmd:=sCmd;
    GameCmd.nPermissionMin:=nPermission;
  end;
  RefGameMasterCommand();
end;

procedure TfrmGameCmd.EditGameMasterCmdSaveClick(Sender: TObject);
begin
  EditGameMasterCmdSave.Enabled:=False;

  CommandConf.WriteString('Command','ObServer',g_GameCommand.OBSERVER.sCmd);
  CommandConf.WriteString('Command','GameMaster',g_GameCommand.GAMEMASTER.sCmd);
  CommandConf.WriteString('Command','SuperMan',g_GameCommand.SUEPRMAN.sCmd);
  CommandConf.WriteString('Command','StorageClearPassword',g_GameCommand.CLRPASSWORD.sCmd);
  CommandConf.WriteString('Command','Who',g_GameCommand.WHO.sCmd);
  CommandConf.WriteString('Command','Total',g_GameCommand.TOTAL.sCmd);
  CommandConf.WriteString('Command','Make',g_GameCommand.MAKE.sCmd);
  CommandConf.WriteString('Command','PositionMove',g_GameCommand.POSITIONMOVE.sCmd);
  CommandConf.WriteString('Command','Move',g_GameCommand.MOVE.sCmd);
  CommandConf.WriteString('Command','Recall',g_GameCommand.RECALL.sCmd);
  CommandConf.WriteString('Command','ReGoto',g_GameCommand.REGOTO.sCmd);
  CommandConf.WriteString('Command','Ting',g_GameCommand.TING.sCmd);
  CommandConf.WriteString('Command','SuperTing',g_GameCommand.SUPERTING.sCmd);
  CommandConf.WriteString('Command','MapMove',g_GameCommand.MAPMOVE.sCmd);
  CommandConf.WriteString('Command','Info',g_GameCommand.INFO.sCmd);
  CommandConf.WriteString('Command','HumanLocal',g_GameCommand.HUMANLOCAL.sCmd);
  CommandConf.WriteString('Command','ViewWhisper',g_GameCommand.VIEWWHISPER.sCmd);
  CommandConf.WriteString('Command','MobLevel',g_GameCommand.MOBLEVEL.sCmd);
  CommandConf.WriteString('Command','MobCount',g_GameCommand.MOBCOUNT.sCmd);
  CommandConf.WriteString('Command','HumanCount',g_GameCommand.HUMANCOUNT.sCmd);
  CommandConf.WriteString('Command','Map',g_GameCommand.MAP.sCmd);
  CommandConf.WriteString('Command','Level',g_GameCommand.LEVEL.sCmd);
  CommandConf.WriteString('Command','Kick',g_GameCommand.KICK.sCmd);
  CommandConf.WriteString('Command','ReAlive',g_GameCommand.REALIVE.sCmd);
  CommandConf.WriteString('Command','Kill',g_GameCommand.KILL.sCmd);
  CommandConf.WriteString('Command','ChangeJob',g_GameCommand.CHANGEJOB.sCmd);
  CommandConf.WriteString('Command','ChangeJobUp',g_GameCommand.CHANGEJOBUP.sCmd); //殿急函券
  CommandConf.WriteString('Command','FreePenalty',g_GameCommand.FREEPENALTY.sCmd);
  CommandConf.WriteString('Command','KillDeathZero',g_GameCommand.KILLDEATHZERO.sCmd);
  CommandConf.WriteString('Command','PkPoint',g_GameCommand.PKPOINT.sCmd);
  CommandConf.WriteString('Command','IncPkPoint',g_GameCommand.INCPKPOINT.sCmd);
  CommandConf.WriteString('Command','ChangeGender',g_GameCommand.CHANGEGENDER.sCmd);
  CommandConf.WriteString('Command','Hair',g_GameCommand.HAIR.sCmd);
  CommandConf.WriteString('Command','BonusPoint',g_GameCommand.BONUSPOINT.sCmd);
  CommandConf.WriteString('Command','DelBonuPoint',g_GameCommand.DELBONUSPOINT.sCmd);
  CommandConf.WriteString('Command','RestBonuPoint',g_GameCommand.RESTBONUSPOINT.sCmd);
  CommandConf.WriteString('Command','SetPermission',g_GameCommand.SETPERMISSION.sCmd);
  CommandConf.WriteString('Command','ReNewLevel',g_GameCommand.RENEWLEVEL.sCmd);
  CommandConf.WriteString('Command','DelGold',g_GameCommand.DELGOLD.sCmd);
  CommandConf.WriteString('Command','AddGold',g_GameCommand.ADDGOLD.sCmd);
  CommandConf.WriteString('Command','GameGold',g_GameCommand.GAMEGOLD.sCmd);
  CommandConf.WriteString('Command','GamePoint',g_GameCommand.GAMEPOINT.sCmd);
  CommandConf.WriteString('Command','RefineWeapon',g_GameCommand.REFINEWEAPON.sCmd);
  CommandConf.WriteString('Command','AdjuestTLevel',g_GameCommand.ADJUESTLEVEL.sCmd);
  CommandConf.WriteString('Command','AdjuestExp',g_GameCommand.ADJUESTEXP.sCmd);

  CommandConf.WriteString('Command','RecallMob',g_GameCommand.RECALLMOB.sCmd);
  CommandConf.WriteString('Command','Training',g_GameCommand.TRAINING.sCmd);
  CommandConf.WriteString('Command','OpTraining',g_GameCommand.TRAININGSKILL.sCmd);
  CommandConf.WriteString('Command','DeleteSkill',g_GameCommand.DELETESKILL.sCmd);
  CommandConf.WriteString('Command','DeleteItem',g_GameCommand.DELETEITEM.sCmd);
  CommandConf.WriteString('Command','ClearMission',g_GameCommand.CLEARMISSION.sCmd);
  CommandConf.WriteString('Command','AddGuild',g_GameCommand.ADDGUILD.sCmd);
  CommandConf.WriteString('Command','DelGuild',g_GameCommand.DELGUILD.sCmd);
  CommandConf.WriteString('Command','ChangeSabukLord',g_GameCommand.CHANGESABUKLORD.sCmd);
  CommandConf.WriteString('Command','ForcedWallConQuestWar',g_GameCommand.FORCEDWALLCONQUESTWAR.sCmd);
  CommandConf.WriteString('Command','ContestPoint',g_GameCommand.CONTESTPOINT.sCmd);
  CommandConf.WriteString('Command','StartContest',g_GameCommand.STARTCONTEST.sCmd);
  CommandConf.WriteString('Command','EndContest',g_GameCommand.ENDCONTEST.sCmd);
  CommandConf.WriteString('Command','Announcement',g_GameCommand.ANNOUNCEMENT.sCmd);
  CommandConf.WriteString('Command','MobLevel',g_GameCommand.MOBLEVEL.sCmd);
  CommandConf.WriteString('Command','Mission',g_GameCommand.MISSION.sCmd);
  CommandConf.WriteString('Command','MobPlace',g_GameCommand.MOBPLACE.sCmd);

  CommandConf.WriteInteger('Permission','GameMaster', g_GameCommand.GAMEMASTER.nPermissionMin);
  CommandConf.WriteInteger('Permission','ObServer', g_GameCommand.OBSERVER.nPermissionMin);
  CommandConf.WriteInteger('Permission','SuperMan', g_GameCommand.SUEPRMAN.nPermissionMin);
  CommandConf.WriteInteger('Permission','StorageClearPassword', g_GameCommand.CLRPASSWORD.nPermissionMin);
  CommandConf.WriteInteger('Permission','Who', g_GameCommand.WHO.nPermissionMin);
  CommandConf.WriteInteger('Permission','Total', g_GameCommand.TOTAL.nPermissionMin);
  CommandConf.WriteInteger('Permission','MakeMin', g_GameCommand.MAKE.nPermissionMin);
  CommandConf.WriteInteger('Permission','MakeMax', g_GameCommand.MAKE.nPermissionMax);
  CommandConf.WriteInteger('Permission','PositionMoveMin', g_GameCommand.POSITIONMOVE.nPermissionMin);
  CommandConf.WriteInteger('Permission','PositionMoveMax', g_GameCommand.POSITIONMOVE.nPermissionMax);
  CommandConf.WriteInteger('Permission','MoveMin', g_GameCommand.MOVE.nPermissionMin);
  CommandConf.WriteInteger('Permission','MoveMax', g_GameCommand.MOVE.nPermissionMax);
  CommandConf.WriteInteger('Permission','Recall', g_GameCommand.RECALL.nPermissionMin);
  CommandConf.WriteInteger('Permission','ReGoto', g_GameCommand.REGOTO.nPermissionMin);
  CommandConf.WriteInteger('Permission','Ting', g_GameCommand.TING.nPermissionMin);
  CommandConf.WriteInteger('Permission','SuperTing', g_GameCommand.SUPERTING.nPermissionMin);
  CommandConf.WriteInteger('Permission','MapMove', g_GameCommand.MAPMOVE.nPermissionMin);
  CommandConf.WriteInteger('Permission','Info', g_GameCommand.INFO.nPermissionMin);
  CommandConf.WriteInteger('Permission','HumanLocal', g_GameCommand.HUMANLOCAL.nPermissionMin);
  CommandConf.WriteInteger('Permission','ViewWhisper', g_GameCommand.VIEWWHISPER.nPermissionMin);
  CommandConf.WriteInteger('Permission','MobLevel', g_GameCommand.MOBLEVEL.nPermissionMin);
  CommandConf.WriteInteger('Permission','MobCount', g_GameCommand.MOBCOUNT.nPermissionMin);
  CommandConf.WriteInteger('Permission','HumanCount', g_GameCommand.HUMANCOUNT.nPermissionMin);
  CommandConf.WriteInteger('Permission','Map', g_GameCommand.MAP.nPermissionMin);
  CommandConf.WriteInteger('Permission','Level', g_GameCommand.LEVEL.nPermissionMin);
  CommandConf.WriteInteger('Permission','Kick', g_GameCommand.KICK.nPermissionMin);
  CommandConf.WriteInteger('Permission','ReAlive', g_GameCommand.REALIVE.nPermissionMin);
  CommandConf.WriteInteger('Permission','Kill', g_GameCommand.KILL.nPermissionMin);
  CommandConf.WriteInteger('Permission','ChangeJob', g_GameCommand.CHANGEJOB.nPermissionMin);
  CommandConf.WriteInteger('Permission','ChangeJobUp', g_GameCommand.CHANGEJOBUP.nPermissionMin);
  CommandConf.WriteInteger('Permission','FreePenalty', g_GameCommand.FREEPENALTY.nPermissionMin);
  CommandConf.WriteInteger('Permission','KillDeathZero', g_GameCommand.KILLDEATHZERO.nPermissionMin);
  CommandConf.WriteInteger('Permission','PkPoint', g_GameCommand.PKPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','IncPkPoint', g_GameCommand.INCPKPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','ChangeGender', g_GameCommand.CHANGEGENDER.nPermissionMin);
  CommandConf.WriteInteger('Permission','Hair', g_GameCommand.HAIR.nPermissionMin);
  CommandConf.WriteInteger('Permission','BonusPoint', g_GameCommand.BONUSPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','DelBonuPoint', g_GameCommand.DELBONUSPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','RestBonuPoint', g_GameCommand.RESTBONUSPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','SetPermission', g_GameCommand.SETPERMISSION.nPermissionMin);
  CommandConf.WriteInteger('Permission','ReNewLevel', g_GameCommand.RENEWLEVEL.nPermissionMin);
  CommandConf.WriteInteger('Permission','DelGold', g_GameCommand.DELGOLD.nPermissionMin);
  CommandConf.WriteInteger('Permission','AddGold', g_GameCommand.ADDGOLD.nPermissionMin);
  CommandConf.WriteInteger('Permission','GameGold', g_GameCommand.GAMEGOLD.nPermissionMin);
  CommandConf.WriteInteger('Permission','GamePoint', g_GameCommand.GAMEPOINT.nPermissionMin);

  CommandConf.WriteInteger('Permission','RefineWeapon', g_GameCommand.REFINEWEAPON.nPermissionMin);
  CommandConf.WriteInteger('Permission','AdjuestTLevel', g_GameCommand.ADJUESTLEVEL.nPermissionMin);
  CommandConf.WriteInteger('Permission','AdjuestExp', g_GameCommand.ADJUESTEXP.nPermissionMin);

  CommandConf.WriteInteger('Permission','RecallMob', g_GameCommand.RECALLMOB.nPermissionMin);
  CommandConf.WriteInteger('Permission','Training', g_GameCommand.TRAINING.nPermissionMin);
  CommandConf.WriteInteger('Permission','OpTraining', g_GameCommand.TRAININGSKILL.nPermissionMin);
  CommandConf.WriteInteger('Permission','DeleteSkill', g_GameCommand.DELETESKILL.nPermissionMin);
  CommandConf.WriteInteger('Permission','DeleteItem', g_GameCommand.DELETEITEM.nPermissionMin);
  CommandConf.WriteInteger('Permission','ClearMission', g_GameCommand.CLEARMISSION.nPermissionMin);
  CommandConf.WriteInteger('Permission','AddGuild', g_GameCommand.ADDGUILD.nPermissionMin);
  CommandConf.WriteInteger('Permission','DelGuild', g_GameCommand.DELGUILD.nPermissionMin);
  CommandConf.WriteInteger('Permission','ChangeSabukLord', g_GameCommand.CHANGESABUKLORD.nPermissionMin);
  CommandConf.WriteInteger('Permission','ForcedWallConQuestWar', g_GameCommand.FORCEDWALLCONQUESTWAR.nPermissionMin);
  CommandConf.WriteInteger('Permission','ContestPoint', g_GameCommand.CONTESTPOINT.nPermissionMin);
  CommandConf.WriteInteger('Permission','StartContest', g_GameCommand.STARTCONTEST.nPermissionMin);
  CommandConf.WriteInteger('Permission','EndContest', g_GameCommand.ENDCONTEST.nPermissionMin);
  CommandConf.WriteInteger('Permission','Announcement', g_GameCommand.ANNOUNCEMENT.nPermissionMin);
  CommandConf.WriteInteger('Permission','MobLevel', g_GameCommand.MOBLEVEL.nPermissionMin);
  CommandConf.WriteInteger('Permission','Mission', g_GameCommand.MISSION.nPermissionMin);
  CommandConf.WriteInteger('Permission','MobPlace', g_GameCommand.MOBPLACE.nPermissionMin);
end;

procedure TfrmGameCmd.StringGridGameDebugCmdClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
begin
  nIndex:=StringGridGameDebugCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameDebugCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    EditGameDebugCmdName.Text:=GameCmd.sCmd;
    EditGameDebugCmdPerMission.Value:=GameCmd.nPermissionMin;
    LabelGameDebugCmdParam.Caption:=StringGridGameDebugCmd.Cells[2,nIndex];
    LabelGameDebugCmdFunc.Caption:=StringGridGameDebugCmd.Cells[3,nIndex];
  end;
  EditGameDebugCmdOK.Enabled:=False;
end;

procedure TfrmGameCmd.EditGameDebugCmdNameChange(Sender: TObject);
begin
  EditGameDebugCmdOK.Enabled:=True;
  EditGameDebugCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditGameDebugCmdPerMissionChange(Sender: TObject);
begin
  EditGameDebugCmdOK.Enabled:=True;
  EditGameDebugCmdSave.Enabled:=True;
end;

procedure TfrmGameCmd.EditGameDebugCmdOKClick(Sender: TObject);
var
  nIndex:Integer;
  GameCmd:pTGameCmd;
  sCmd:String;
  nPerMission:Integer;
begin
  sCmd:=Trim(EditGameDebugCmdName.Text);
  nPermission:=EditGameDebugCmdPerMission.Value;
  if sCmd = '' then begin
    Application.MessageBox('权限不足。','提示信息',MB_OK + MB_ICONERROR);
    EditGameDebugCmdName.SetFocus;
    exit;
  end;

  nIndex:=StringGridGameDebugCmd.Row;
  GameCmd:=pTGameCmd(StringGridGameDebugCmd.Objects[0,nIndex]);
  if GameCmd <> nil then begin
    GameCmd.sCmd:=sCmd;
    GameCmd.nPermissionMin:=nPermission;
  end;
  RefDebugCommand();
end;


procedure TfrmGameCmd.EditGameDebugCmdSaveClick(Sender: TObject);
begin
  EditGameDebugCmdSave.Enabled:=False;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: GameCommand.pas 517 2006-12-15 14:54:40Z damian $');
end.


