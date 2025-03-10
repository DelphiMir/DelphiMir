unit HumanInfo;

interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ObjBase, ObjHero, StdCtrls, Spin, ComCtrls, ExtCtrls, Grids;

type
  TfrmHumanInfo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EditName: TEdit;
    EditMap: TEdit;
    EditXY: TEdit;
    EditAccount: TEdit;
    EditIPaddr: TEdit;
    EditLogonTime: TEdit;
    EditLogonLong: TEdit;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    EditLevel: TSpinEdit;
    EditGold: TSpinEdit;
    EditPKPoint: TSpinEdit;
    EditExp: TSpinEdit;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    EditAC: TEdit;
    Label13: TLabel;
    EditMAC: TEdit;
    Label14: TLabel;
    EditDC: TEdit;
    EditMC: TEdit;
    Label15: TLabel;
    EditSC: TEdit;
    Label16: TLabel;
    EditHP: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    EditMP: TEdit;
    Timer: TTimer;
    GroupBox4: TGroupBox;
    CheckBoxMonitor: TCheckBox;
    GroupBox5: TGroupBox;
    EditHumanStatus: TEdit;
    GroupBox6: TGroupBox;
    CheckBoxGameMaster: TCheckBox;
    CheckBoxSuperMan: TCheckBox;
    CheckBoxObserver: TCheckBox;
    ButtonKick: TButton;
    GroupBox7: TGroupBox;
    GroupBox9: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    EditGameGold: TSpinEdit;
    EditGamePoint: TSpinEdit;
    EditBonusPoint: TSpinEdit;
    Label19: TLabel;
    EditEditBonusPointUsed: TSpinEdit;
    ButtonSave: TButton;
    GridUserItem: TStringGrid;
    GroupBox8: TGroupBox;
    GridBagItem: TStringGrid;
    GroupBox10: TGroupBox;
    GridStorageItem: TStringGrid;
    Label20: TLabel;
    EditCodeName: TEdit;
    procedure TimerTimer(Sender: TObject);
    procedure CheckBoxMonitorClick(Sender: TObject);
    procedure ButtonKickClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RefHumanInfo();
    { Private declarations }
  public
    BaseObject: TBaseObject;
    procedure Open();
    { Public declarations }
  end;

var
  frmHumanInfo: TfrmHumanInfo;

implementation

uses UsrEngn, ItmUnit, M2Share, Grobal2;

{$R *.dfm}
var
  boRefHuman:Boolean = False;
{ TfrmHumanInfo }

procedure TfrmHumanInfo.FormCreate(Sender: TObject);
begin
  GridUserItem.Cells[0,0]:='物品窗口';
  GridUserItem.Cells[1,0]:='物品名称';
  GridUserItem.Cells[2,0]:='物品编号';
  GridUserItem.Cells[3,0]:='持久';
  GridUserItem.Cells[4,0]:='攻击';
  GridUserItem.Cells[5,0]:='魔法';
  GridUserItem.Cells[6,0]:='道术';
  GridUserItem.Cells[7,0]:='防御';
  GridUserItem.Cells[8,0]:='魔御';
  GridUserItem.Cells[9,0]:='选项';

  GridUserItem.Cells[0,1]:='衣服';
  GridUserItem.Cells[0,2]:='武器';
  GridUserItem.Cells[0,3]:='照明';
  GridUserItem.Cells[0,4]:='项链捞';
  GridUserItem.Cells[0,5]:='头盔';
  GridUserItem.Cells[0,6]:='(右)手镯';
  GridUserItem.Cells[0,7]:='(左)手镯';
  GridUserItem.Cells[0,8]:='(右)戒指';
  GridUserItem.Cells[0,9]:='(左)戒指';
  GridUserItem.Cells[0,10]:='符咒';
  GridUserItem.Cells[0,11]:='腰带';
  GridUserItem.Cells[0,12]:='靴子';
  GridUserItem.Cells[0,13]:='守护石';
  GridUserItem.Cells[0,14]:='坐骑';

  GridBagItem.Cells[0,0]:='物品窗口';
  GridBagItem.Cells[1,0]:='物品名字';
  GridBagItem.Cells[2,0]:='物品编号';
  GridBagItem.Cells[3,0]:='持久';
  GridBagItem.Cells[4,0]:='攻击';
  GridBagItem.Cells[5,0]:='魔法';
  GridBagItem.Cells[6,0]:='道术';
  GridBagItem.Cells[7,0]:='防御';
  GridBagItem.Cells[8,0]:='魔御';
  GridBagItem.Cells[9,0]:='选项';


  GridStorageItem.Cells[0,0]:='物品窗口';
  GridStorageItem.Cells[1,0]:='物品名字';
  GridStorageItem.Cells[2,0]:='物品编号';
  GridStorageItem.Cells[3,0]:='持久';
  GridStorageItem.Cells[4,0]:='攻击';
  GridStorageItem.Cells[5,0]:='魔法';
  GridStorageItem.Cells[6,0]:='道术';
  GridStorageItem.Cells[7,0]:='防御';
  GridStorageItem.Cells[8,0]:='魔御';
  GridStorageItem.Cells[9,0]:='选项';

end;

procedure TfrmHumanInfo.Open;
begin
  RefHumanInfo();
  ButtonKick.Enabled:=True;
  Timer.Enabled:=True;
  if (BaseObject <> nil) then begin
    if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
      Caption := '用户信息(角色)';
    end else begin
      Caption := '英雄信息(角色)';
    end;
  end;
  ShowModal;
  CheckBoxMonitor.Checked:=False;
  Timer.Enabled:=False;
end;

procedure TfrmHumanInfo.RefHumanInfo;
var
  I: Integer;
  nTotleUsePoint:Integer;
  StdItem:TItem;
  Item:TStdItem;
  UserItem:pTUserItem;
begin
  if (BaseObject = nil) then begin
    Exit;
  end;

  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin

  end else begin
    GroupBox6.Visible := False;
    GroupBox9.Visible := False;
  end;

  EditName.Text:=BaseObject.m_sCharName;
  EditCodeName.Text:=BaseObject.m_sHddCode;    //荐沥登菌嚼聪促.
  EditMap.Text:=BaseObject.m_sMapName + '(' + BaseObject.m_PEnvir.sMapDesc + ')';
  EditXY.Text:=IntToStr(BaseObject.m_nCurrX) + ':' + IntToStr(BaseObject.m_nCurrY);

  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    EditAccount.Text := TPlayObject(BaseObject).m_sUserID;
    EditIPaddr.Text := TPlayObject(BaseObject).m_sIPaddr;
    EditLogonTime.Text := DateTimeToStr(TPlayObject(BaseObject).m_dLogonTime);
    EditLogonLong.Text := IntToStr((GetTickCount - TPlayObject(BaseObject).m_dwLogonTick) div (60 * 1000)) + ' 分';
  end else begin
    EditAccount.Text := THeroObject(BaseObject).m_sUserID;
    EditIPaddr.Text := TPlayObject(BaseObject.m_Master).m_sIPaddr;
    EditLogonTime.Text := DateTimeToStr(THeroObject(BaseObject).m_dLogonTime);
    EditLogonLong.Text := IntToStr((GetTickCount - THeroObject(BaseObject).m_dwLogonTick) div (60 * 1000)) + ' 分';
  end;

  EditLevel.Value:=BaseObject.m_Abil.Level;
  EditGold.Value:=BaseObject.m_nGold;
  EditPKPoint.Value:=BaseObject.m_nPkPoint;
  EditExp.Value:=BaseObject.m_Abil.Exp;

  EditAC.Text:=IntToStr(LoWord(BaseObject.m_WAbil.AC)) + '/' + IntToStr(HiWord(BaseObject.m_WAbil.AC));
  EditMAC.Text:=IntToStr(LoWord(BaseObject.m_WAbil.MAC)) + '/' + IntToStr(HiWord(BaseObject.m_WAbil.MAC));
  EditDC.Text:=IntToStr(LoWord(BaseObject.m_WAbil.DC)) + '/' + IntToStr(HiWord(BaseObject.m_WAbil.DC));
  EditMC.Text:=IntToStr(LoWord(BaseObject.m_WAbil.MC)) + '/' + IntToStr(HiWord(BaseObject.m_WAbil.MC));
  EditSC.Text:=IntToStr(LoWord(BaseObject.m_WAbil.SC)) + '/' + IntToStr(HiWord(BaseObject.m_WAbil.SC));
  EditHP.Text:=IntToStr(BaseObject.m_WAbil.HP) + '/' + IntToStr(BaseObject.m_WAbil.MaxHP);
  EditMP.Text:=IntToStr(BaseObject.m_WAbil.MP) + '/' + IntToStr(BaseObject.m_WAbil.MaxMP);
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    EditGameGold.Value:=TPlayObject(BaseObject).m_nGameGold;
    EditGamePoint.Value:=TPlayObject(BaseObject).m_nGamePoint;
    EditBonusPoint.Value:=TPlayObject(BaseObject).m_nBonusPoint;

    nTotleUsePoint:=TPlayObject(BaseObject).m_BonusAbil.DC +
                    TPlayObject(BaseObject).m_BonusAbil.MC +
                    TPlayObject(BaseObject).m_BonusAbil.SC +
                    TPlayObject(BaseObject).m_BonusAbil.AC +
                    TPlayObject(BaseObject).m_BonusAbil.MAC +
                    TPlayObject(BaseObject).m_BonusAbil.HP +
                    TPlayObject(BaseObject).m_BonusAbil.MP +
                    TPlayObject(BaseObject).m_BonusAbil.Hit +
                    TPlayObject(BaseObject).m_BonusAbil.Speed +
                    TPlayObject(BaseObject).m_BonusAbil.X2;

    EditEditBonusPointUsed.Value:=nTotleUsePoint;
  
    CheckBoxGameMaster.Checked:=TPlayObject(BaseObject).m_boAdminMode;
    CheckBoxSuperMan.Checked:=TPlayObject(BaseObject).m_boSuperMan;
    CheckBoxObserver.Checked:=TPlayObject(BaseObject).m_boObMode;
  end;
  if BaseObject.m_boDeath then begin
    EditHumanStatus.Text:='死亡';
  end else
  if BaseObject.m_boGhost then begin
    EditHumanStatus.Text:='不在线';
    BaseObject:=nil;
  end else EditHumanStatus.Text:='在线';

  if BaseObject = nil then Exit;

  for I := Low(BaseObject.m_UseItems) to High(BaseObject.m_UseItems) do begin
    UserItem:=@BaseObject.m_UseItems[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem = nil then begin
      GridUserItem.Cells[1,I + 1]:='';
      GridUserItem.Cells[2,I + 1]:='';
      GridUserItem.Cells[3,I + 1]:='';
      GridUserItem.Cells[4,I + 1]:='';
      GridUserItem.Cells[5,I + 1]:='';
      GridUserItem.Cells[6,I + 1]:='';
      GridUserItem.Cells[7,I + 1]:='';
      GridUserItem.Cells[8,I + 1]:='';
      GridUserItem.Cells[9,I + 1]:='';
      Continue;
    end;

    StdItem.GetStandardItem(Item);
    StdItem.GetItemAddValue(UserItem,Item);
    Item.Name := GetItemName(UserItem);

    GridUserItem.Cells[1,I + 1]:=Item.Name;
    GridUserItem.Cells[2,I + 1]:=IntToStr(UserItem.MakeIndex);
    GridUserItem.Cells[3,I + 1]:=format('%d/%d',[UserItem.Dura,UserItem.DuraMax]);
    GridUserItem.Cells[4,I + 1]:=format('%d/%d',[LoWord(Item.DC),HiWord(Item.DC)]);
    GridUserItem.Cells[5,I + 1]:=format('%d/%d',[LoWord(Item.MC),HiWord(Item.MC)]);
    GridUserItem.Cells[6,I + 1]:=format('%d/%d',[LoWord(Item.SC),HiWord(Item.SC)]);
    GridUserItem.Cells[7,I + 1]:=format('%d/%d',[LoWord(Item.AC),HiWord(Item.AC)]);
    GridUserItem.Cells[8,I + 1]:=format('%d/%d',[LoWord(Item.MAC),HiWord(Item.MAC)]);
    GridUserItem.Cells[9,I + 1]:=format('%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d',
                                                               [UserItem.btValue[0],
                                                                UserItem.btValue[1],
                                                                UserItem.btValue[2],
                                                                UserItem.btValue[3],
                                                                UserItem.btValue[4],
                                                                UserItem.btValue[5],
                                                                UserItem.btValue[6],
                                                                UserItem.btValue[7],
                                                                UserItem.btValue[8],
                                                                UserItem.btValue[9],
                                                                UserItem.btValue[10],
                                                                UserItem.btValue[11],
                                                                UserItem.btValue[12],
                                                                UserItem.btValue[13],
                                                                UserItem.btValue[14],
                                                                UserItem.btValue[15],
                                                                UserItem.btValue[16],
                                                                UserItem.btValue[17]]);
  end;

  if BaseObject.m_ItemList.Count <= 0 then GridBagItem.RowCount:=2
  else GridBagItem.RowCount:=BaseObject.m_ItemList.Count + 1;

   
  for I := 0 to BaseObject.m_ItemList.Count - 1 do begin
    UserItem:=BaseObject.m_ItemList.Items[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem = nil then begin
      GridBagItem.Cells[1,I + 1]:='';
      GridBagItem.Cells[2,I + 1]:='';
      GridBagItem.Cells[3,I + 1]:='';
      GridBagItem.Cells[4,I + 1]:='';
      GridBagItem.Cells[5,I + 1]:='';
      GridBagItem.Cells[6,I + 1]:='';
      GridBagItem.Cells[7,I + 1]:='';
      GridBagItem.Cells[8,I + 1]:='';
      GridBagItem.Cells[9,I + 1]:='';
      Continue;
    end;
    StdItem.GetStandardItem(Item);
    StdItem.GetItemAddValue(UserItem,Item);
    Item.Name := GetItemName(UserItem);

    GridBagItem.Cells[0,I + 1]:=IntToStr(I);
    GridBagItem.Cells[1,I + 1]:=Item.Name;
    GridBagItem.Cells[2,I + 1]:=IntToStr(UserItem.MakeIndex);
    GridBagItem.Cells[3,I + 1]:=format('%d/%d',[UserItem.Dura,UserItem.DuraMax]);
    GridBagItem.Cells[4,I + 1]:=format('%d/%d',[LoWord(Item.DC),HiWord(Item.DC)]);
    GridBagItem.Cells[5,I + 1]:=format('%d/%d',[LoWord(Item.MC),HiWord(Item.MC)]);
    GridBagItem.Cells[6,I + 1]:=format('%d/%d',[LoWord(Item.SC),HiWord(Item.SC)]);
    GridBagItem.Cells[7,I + 1]:=format('%d/%d',[LoWord(Item.AC),HiWord(Item.AC)]);
    GridBagItem.Cells[8,I + 1]:=format('%d/%d',[LoWord(Item.MAC),HiWord(Item.MAC)]);
    GridBagItem.Cells[9,I + 1]:=format('%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d',
                                                               [UserItem.btValue[0],
                                                                UserItem.btValue[1],
                                                                UserItem.btValue[2],
                                                                UserItem.btValue[3],
                                                                UserItem.btValue[4],
                                                                UserItem.btValue[5],
                                                                UserItem.btValue[6],
                                                                UserItem.btValue[7],
                                                                UserItem.btValue[8],
                                                                UserItem.btValue[9],
                                                                UserItem.btValue[10],
                                                                UserItem.btValue[11],
                                                                UserItem.btValue[12],
                                                                UserItem.btValue[13],
                                                                UserItem.btValue[14],
                                                                UserItem.btValue[15],
                                                                UserItem.btValue[16],
                                                                UserItem.btValue[17]]);
  end;

  if BaseObject.m_StorageItemList.Count <= 0 then GridStorageItem.RowCount:=2
  else GridStorageItem.RowCount:=BaseObject.m_StorageItemList.Count + 1;

  for I := 0 to BaseObject.m_StorageItemList.Count - 1 do begin
    UserItem:=BaseObject.m_StorageItemList.Items[I];
    StdItem:=UserEngine.GetStdItem(UserItem.wIndex);
    if StdItem = nil then begin
      GridStorageItem.Cells[1,I + 1]:='';
      GridStorageItem.Cells[2,I + 1]:='';
      GridStorageItem.Cells[3,I + 1]:='';
      GridStorageItem.Cells[4,I + 1]:='';
      GridStorageItem.Cells[5,I + 1]:='';
      GridStorageItem.Cells[6,I + 1]:='';
      GridStorageItem.Cells[7,I + 1]:='';
      GridStorageItem.Cells[8,I + 1]:='';
      GridStorageItem.Cells[9,I + 1]:='';
      Continue;
    end;
    StdItem.GetStandardItem(Item);
    StdItem.GetItemAddValue(UserItem,Item);
    Item.Name := GetItemName(UserItem);

    GridStorageItem.Cells[0,I + 1]:=IntToStr(I);
    GridStorageItem.Cells[1,I + 1]:=Item.Name;
    GridStorageItem.Cells[2,I + 1]:=IntToStr(UserItem.MakeIndex);
    GridStorageItem.Cells[3,I + 1]:=format('%d/%d',[UserItem.Dura,UserItem.DuraMax]);
    GridStorageItem.Cells[4,I + 1]:=format('%d/%d',[LoWord(Item.DC),HiWord(Item.DC)]);
    GridStorageItem.Cells[5,I + 1]:=format('%d/%d',[LoWord(Item.MC),HiWord(Item.MC)]);
    GridStorageItem.Cells[6,I + 1]:=format('%d/%d',[LoWord(Item.SC),HiWord(Item.SC)]);
    GridStorageItem.Cells[7,I + 1]:=format('%d/%d',[LoWord(Item.AC),HiWord(Item.AC)]);
    GridStorageItem.Cells[8,I + 1]:=format('%d/%d',[LoWord(Item.MAC),HiWord(Item.MAC)]);
    GridStorageItem.Cells[9,I + 1]:=format('%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d/%d',
                                                               [UserItem.btValue[0],
                                                                UserItem.btValue[1],
                                                                UserItem.btValue[2],
                                                                UserItem.btValue[3],
                                                                UserItem.btValue[4],
                                                                UserItem.btValue[5],
                                                                UserItem.btValue[6],
                                                                UserItem.btValue[7],
                                                                UserItem.btValue[8],
                                                                UserItem.btValue[9],
                                                                UserItem.btValue[10],
                                                                UserItem.btValue[11],
                                                                UserItem.btValue[12],
                                                                UserItem.btValue[13],
                                                                UserItem.btValue[14],
                                                                UserItem.btValue[15],
                                                                UserItem.btValue[16],
                                                                UserItem.btValue[17]]);
  end;
end;

procedure TfrmHumanInfo.TimerTimer(Sender: TObject);
begin
  if BaseObject = nil then exit;
  if BaseObject.m_boGhost then begin
    EditHumanStatus.Text:='不在线';
    BaseObject:=nil;
    exit;
  end;
  if boRefHuman  then RefHumanInfo();
end;

procedure TfrmHumanInfo.CheckBoxMonitorClick(Sender: TObject);
begin
  boRefHuman:=CheckBoxMonitor.Checked;
  ButtonSave.Enabled:= not boRefHuman;
end;

procedure TfrmHumanInfo.ButtonKickClick(Sender: TObject);
var
  PlayObject: TPlayObject;
  HeroObject: THeroObject;
begin
  if BaseObject = nil then Exit;
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    PlayObject := TPlayObject(BaseObject);
    PlayObject.m_boEmergencyClose := True;
  end else begin
    HeroObject := THeroObject(BaseObject);
    HeroObject.LogOut;
  end;
  ButtonKick.Enabled:=False;
end;

procedure TfrmHumanInfo.ButtonSaveClick(Sender: TObject);
var
  nOLevel: Integer;
  nLevel:Integer;
  nGold:Integer;
  nPKPoint:Integer;
  nGameGold:Integer;
  nGamePoint:Integer;
  nBonusPoint:Integer;
  boGameMaster:Boolean;
  boObServer:Boolean;
  boSuperman:Boolean;

  PlayObject: TPlayObject;
  HeroObject: THeroObject;
begin
  if BaseObject = nil then Exit;
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    PlayObject := TPlayObject(BaseObject);
  end else begin
    HeroObject := THeroObject(BaseObject);
  end;

  nLevel:=EditLevel.Value;
  nGold:=EditGold.Value;
  nPKPoint:=EditPKPoint.Value;

  nGameGold:=EditGameGold.Value;
  nGamePoint:=EditGamePoint.Value;
  nBonusPoint:=EditBonusPoint.Value;
  boGameMaster:=CheckBoxGameMaster.Checked;
  boObServer:=CheckBoxObserver.Checked;
  boSuperman:=CheckBoxSuperMan.Checked;
  if (nLevel < 0) or (nLevel > High(Word)) or (nGold < 0) or (nGold > 200000000) or (nPKPoint < 0) or
     (nPKPoint > 2000000) or (nBonusPoint < 0) or (nBonusPoint > 20000000) then begin
    MessageBox(Handle,'你输入的数值错误！','警告',MB_OK);
    exit;
  end;
  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    PlayObject.m_Abil.Level:=nLevel;
    PlayObject.m_nGold:=nGold;
    PlayObject.m_nPkPoint:=nPKPoint;     //乔纳捞
    PlayObject.m_nGameGold:=nGameGold;
    PlayObject.m_nGamePoint:=nGamePoint;

    PlayObject.m_nBonusPoint:=nBonusPoint;
    PlayObject.m_boAdminMode:=boGameMaster;
    PlayObject.m_boObMode:=boObServer;
    PlayObject.m_boSuperMan:=boSuperman;
    PlayObject.RecalcAbilitys;
    PlayObject.GoldChanged;
  end;
  nOLevel := BaseObject.m_Abil.Level;
  BaseObject.m_Abil.Level := nLevel;
  if nOLevel <> BaseObject.m_Abil.Level then begin
    BaseObject.HasLevelUp(0);
  end else begin

  end;

  if (BaseObject.m_btRaceServer = RC_PLAYOBJECT) then begin
    MessageBox(Handle, '角色信息保存成功。','确认信息', MB_OK);
  end else begin
    MessageBox(Handle, '英雄信息保存成功。','确认信息', MB_OK);
  end;
  RefHumanInfo();
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: HumanInfo.pas 360 2006-08-30 12:04:20Z Fugly $');
end.
