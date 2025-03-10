unit GuildManage;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Guild, Spin, ExtCtrls;

type
  TfrmGuildManage = class(TForm)
    GroupBox1: TGroupBox;
    ListViewGuild: TListView;
    GroupBox2: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditGuildName: TEdit;
    EditGuildMode: TSpinEdit;
    EditGuildLevel: TSpinEdit;
    EditGuildExp: TSpinEdit;
    EditGuildPoint: TSpinEdit;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    EditGuildMemberCount: TSpinEdit;
    Button2: TButton;
    Label9: TLabel;
    SpinEditGuildMemberCount: TSpinEdit;
    Label10: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ListViewGuildClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditGuildModeClick(Sender: TObject);
    procedure EditGuildMemberCountChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EditGuildMemberCountClick(Sender: TObject);
    procedure EditGuildModeChange(Sender: TObject);
  private
    procedure RefGuildList;
    procedure RefGuildInfo;
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmGuildManage: TfrmGuildManage;
  CurGuild: TGUild;

implementation

uses M2Share;
var
  boRefing: Boolean;
{$R *.dfm}
procedure TfrmGuildManage.RefGuildList;
var
  I: Integer;
  Guild: TGUild;
  ListItem: TListItem;
begin
  if g_GuildManager.GuildList.Count > 0 then begin
    for I := 0 to g_GuildManager.GuildList.Count - 1 do begin
      Guild := TGUild(g_GuildManager.GuildList.Items[I]);
      ListItem := ListViewGuild.Items.Add;
      ListItem.Caption := IntToStr(I);
      ListItem.SubItems.AddObject(Guild.sGuildName, Guild);
      ListItem.SubItems.Add(Guild.sGuildName);
    end;
  end;
end;

procedure TfrmGuildManage.Open;
begin
  EditGuildMemberCount.Value := g_Config.nGuildMemberMaxLimit;
  RefGuildList();
  ShowModal;
end;

procedure TfrmGuildManage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGuildManage.FormDestroy(Sender: TObject);
begin
  frmGuildManage:= nil;
end;

procedure TfrmGuildManage.RefGuildInfo;
begin
  if CurGuild = nil then Exit;
  boRefing := True;
  EditGuildName.Text := CurGuild.sGuildName;
  EditGuildMode.Value := CurGuild.nGuildMode;    //�߸� �﹮
  EditGuildLevel.Value := CurGuild.nGuildLevel;  //���ķ���
  EditGuildExp.Value := CurGuild.nGuildExp; //������
  EditGuildPoint.Value := CurGuild.nGuildPoint;//���ٶ�
  SpinEditGuildMemberCount.Value := CurGuild.Count;//�л��Ա����
  boRefing := False;
end;

procedure TfrmGuildManage.ListViewGuildClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := ListViewGuild.Selected;
  if ListItem = nil then Exit;
  CurGuild := TGUild(ListItem.SubItems.Objects[0]);
  RefGuildInfo();
end;

procedure TfrmGuildManage.Button1Click(Sender: TObject);
begin
  Try
    if CurGuild = nil then Exit;
    if EditGuildName.Text <> '' then begin
      if CompareText(CurGuild.sGuildName, EditGuildName.Text) = 0 then begin
        CurGuild.nGuildMode := EditGuildMode.Value;         //�߸� �﹮
        CurGuild.nGuildLevel := EditGuildLevel.Value;       //���ķ���
        CurGuild.nGuildExp := EditGuildExp.Value; //������
        CurGuild.nGuildPoint := EditGuildPoint.Value;//���ٶ�
       // CurGuild.m_nGuildMemberCount := SpinEditGuildMemberCount.Value;//�л��Ա����
        CurGuild.SaveGuildInfoFile;
      end;
    end;
    Button1.Enabled:= False;
  Except
    MainOutMessage('TfrmGuildManage.Button1Click');
  end;
end;

procedure TfrmGuildManage.EditGuildModeClick(Sender: TObject);
begin
  Button1.Enabled:= True;
end;

procedure TfrmGuildManage.EditGuildMemberCountChange(Sender: TObject);
begin
  g_Config.nGuildMemberMaxLimit := EditGuildMemberCount.Value;
end;

procedure TfrmGuildManage.Button2Click(Sender: TObject);
begin
  Config.WriteInteger('Setup', 'GuildMemberMaxLimit', g_Config.nGuildMemberMaxLimit);//�½��л��Ա����
  Button2.Enabled:= False;
end;

procedure TfrmGuildManage.EditGuildMemberCountClick(Sender: TObject);
begin
  Button2.Enabled:= True;
end;

procedure TfrmGuildManage.EditGuildModeChange(Sender: TObject);
begin
  Button1.Enabled:= True;
end;

end.
