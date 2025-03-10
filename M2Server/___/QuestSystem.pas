unit QuestSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, M2Share, QuestInfo, LocalDB, Spin;

type
  TQuestInfoForm = class(TForm)
    GroupBox1: TGroupBox;
    ListViewQuest: TListView;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditIndex: TEdit;
    EditName: TEdit;
    EditGroup: TEdit;
    EditFile: TEdit;
    BotScriptOpen: TButton;
    EditGoto: TEdit;
    EditKill: TEdit;
    EditItem: TEdit;
    Label9: TLabel;
    EditFlag: TEdit;
    BotQuestAdd: TButton;
    BotQuestSave: TButton;
    ComQuestType: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EditMin: TSpinEdit;
    EditMax: TSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ListViewQuestClick(Sender: TObject);
    procedure BotScriptOpenClick(Sender: TObject);
    procedure BotQuestAddClick(Sender: TObject);
    procedure EditNameChange(Sender: TObject);
    procedure BotQuestSaveClick(Sender: TObject);
  private
    procedure RefQuestList;
    procedure RefQuestInfo;
    procedure RefQuestCheck;
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  QuestInfoForm: TQuestInfoForm;
  CurQuest: TQuestInfo;

implementation
var
  boRefing: Boolean;

{$R *.dfm}

procedure TQuestInfoForm.RefQuestList;
var
  I: Integer;
  Quest: TQuestInfo;
  ListItem: TListItem;
begin
  ListViewQuest.Clear;
  if UserEngine.QuestInfoList.Count > 0 then begin
    for I := 0 to UserEngine.QuestInfoList.Count - 1 do begin
      Quest := TQuestInfo(UserEngine.QuestInfoList.Items[I]);
      ListItem := ListViewQuest.Items.Add;
      ListItem.Caption := IntToStr(Quest.Index);
      ListItem.SubItems.AddObject(Quest.Name, Quest);
      ListItem.SubItems.Add(Quest.Name);
    end;
  end;
end;

procedure TQuestInfoForm.RefQuestCheck;
var
  ListItem: TListItem;
begin
  ListItem := ListViewQuest.Selected;
  if ListItem <> nil then begin
    EditIndex.Enabled := False;
    EditName.Enabled := True;
    EditGroup.Enabled := True;
    ComQuestType.Enabled := True;
    EditFile.Enabled := True;
    BotScriptOpen.Enabled := True;
    EditGoto.Enabled := True;
    EditKill.Enabled := True;
    EditItem.Enabled := True;
    EditFlag.Enabled := True;
    EditMin.Enabled := True;
    EditMax.Enabled := True;
    BotQuestAdd.Enabled := True;
  end else begin
    EditIndex.Enabled := False;
    EditName.Enabled := False;
    EditGroup.Enabled := False;
    EditFile.Enabled := False;
    ComQuestType.Enabled := False;
    BotScriptOpen.Enabled := False;
    EditGoto.Enabled := False;
    EditKill.Enabled := False;
    EditItem.Enabled := False;
    EditFlag.Enabled := False;
    EditMin.Enabled := False;
    EditMax.Enabled := False;
    BotQuestAdd.Enabled := False;
  end;
end;

procedure TQuestInfoForm.Open;
begin
  boRefing := False;
  RefQuestList();
  RefQuestCheck();
  ShowModal;
end;

procedure TQuestInfoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TQuestInfoForm.FormDestroy(Sender: TObject);
begin
  QuestInfoForm:= nil;
end;

procedure TQuestInfoForm.ListViewQuestClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  ListItem := ListViewQuest.Selected;
  if ListItem = nil then Exit;
  CurQuest := TQuestInfo(ListItem.SubItems.Objects[0]);
  RefQuestInfo();
  RefQuestCheck();
  BotQuestSave.Enabled := True;
end;

procedure TQuestInfoForm.RefQuestInfo;
begin
  if CurQuest = nil then Exit;
  EditIndex.Text := IntToStr(CurQuest.Index);
  EditName.Text := CurQuest.Name;    //퀘스트 이름
  EditGroup.Text := CurQuest.Group;  //퀘스트 그룹
  ComQuestType.ItemIndex := CurQuest.QuestType; //퀘스트 종류
  EditFile.Text := CurQuest.FileName; //퀘스트 파일이름
  EditGoto.Text := CurQuest.GotoMessage;
  EditKill.Text := CurQuest.KillMessage;
  EditItem.Text := CurQuest.ItemMessage;
  EditFlag.Text := CurQuest.FlagMessage;
  EditMin.Value := CurQuest.RequiredMinLevel;
  EditMax.Value := CurQuest.RequiredMaxLevel;
end;

procedure TQuestInfoForm.BotScriptOpenClick(Sender: TObject);
var
  sScriptFile: string;
  SaveList    :TStringList;
begin
  if CurQuest <> nil then begin
    sScriptFile := g_Config.sEnvirDir + sQuest_Def + CurQuest.FileName + '.txt';
    if not FileExists(sScriptFile) then begin
      SaveList := TStringList.Create;
      SaveList.Add('[@Description]');
      SaveList.Add(' ');
      SaveList.Add('[@TaskDescription]');
      SaveList.Add(' ');
      SaveList.Add('[@Completion]');
      SaveList.Add(' ');
      SaveList.Add('[@KillTasks]');
      SaveList.Add(' ');
      SaveList.Add('[@ItemTasks]');
      SaveList.Add(' ');
      SaveList.Add('[@FlagTasks]');
      SaveList.Add(' ');
      SaveList.Add('[@CarryItems]');
      SaveList.Add(' ');
      SaveList.Add('[@FixedRewards]');
      SaveList.Add(' ');
      SaveList.Add('[@SelectRewards]');
      SaveList.Add(' ');
      SaveList.Add('[@ExpReward]');
      SaveList.Add(' ');
      SaveList.Add('[@GoldReward]');
      SaveList.Add(' ');
      SaveList.SaveToFile(sScriptFile);
      SaveList.Free;
      WinExec(PChar('Notepad.exe ' + sScriptFile), SW_SHOW);
    end else begin
      WinExec(PChar('Notepad.exe ' + sScriptFile), SW_SHOW);
    end;
  end;
end;

procedure TQuestInfoForm.BotQuestAddClick(Sender: TObject);
begin
  if (EditName.Text = '') or (EditGroup.Text = '') or (EditFile.Text = '') then Exit;
  
end;

procedure TQuestInfoForm.EditNameChange(Sender: TObject);
begin
  boRefing := True;
end;

procedure TQuestInfoForm.BotQuestSaveClick(Sender: TObject);
begin
  Try
    if (not boRefing) and (CurQuest = nil) then Exit;
    CurQuest.Name := EditName.Text;
    CurQuest.Group := EditGroup.Text;
    CurQuest.QuestType  := ComQuestType.ItemIndex;
    CurQuest.FileName   := EditFile.Text;
    CurQuest.GotoMessage  := EditGoto.Text;
    CurQuest.KillMessage  := EditKill.Text;
    CurQuest.ItemMessage  := EditItem.Text;
    CurQuest.FlagMessage  := EditFlag.Text;
    CurQuest.RequiredMinLevel   := EditMin.Value;
    CurQuest.RequiredMaxLevel   := EditMax.Value;
    FrmDB.UpdateQuestList(CurQuest);
    RefQuestList();
    BotQuestSave.Enabled:= False;
    ListViewQuest.Selected := nil;
    RefQuestCheck;
  Except
    MainOutMessage('TQuestInfoForm.BotQuestSaveClick');
  end;
end;

end.
