unit ViewList;

interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, Spin,Grobal2, ItmUnit, Menus, Mask,
  RzEdit;

type
  TfrmViewList = class(TForm)
    PageControlViewList: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    GroupBox2: TGroupBox;
    ListBoxItemList: TListBox;
    GroupBox1: TGroupBox;
    ListBoxEnableMakeList: TListBox;
    ButtonEnableMakeAdd: TButton;
    ButtonEnableMakeDelete: TButton;
    ButtonEnableMakeSave: TButton;
    GroupBox3: TGroupBox;
    ListBoxDisableMakeList: TListBox;
    GroupBox4: TGroupBox;
    ListBoxitemList1: TListBox;
    ButtonDisableMakeAdd: TButton;
    ButtonDisableMakeDelete: TButton;
    ButtonDisableMakeSave: TButton;
    ButtonEnableMakeAddAll: TButton;
    ButtonEnableMakeDeleteAll: TButton;
    ButtonDisableMakeAddAll: TButton;
    ButtonDisableMakeDeleteAll: TButton;
    GridItemBindAccount: TStringGrid;
    GridItemBindCharName: TStringGrid;
    GridItemBindIPaddr: TStringGrid;
    GroupBox5: TGroupBox;
    ListBoxDisableMoveMap: TListBox;
    ButtonDisableMoveMapAdd: TButton;
    ButtonDisableMoveMapDelete: TButton;
    ButtonDisableMoveMapAddAll: TButton;
    ButtonDisableMoveMapDeleteAll: TButton;
    ButtonDisableMoveMapSave: TButton;
    GroupBox6: TGroupBox;
    ListBoxMapList: TListBox;
    TabSheetMonDrop: TTabSheet;
    StringGridMonDropLimit: TStringGrid;
    GroupBox7: TGroupBox;
    ButtonMonDropLimitSave: TButton;
    Label29: TLabel;
    EditDropCount: TSpinEdit;
    Label1: TLabel;
    EditCountLimit: TSpinEdit;
    EditNoDropCount: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditItemName: TEdit;
    TabSheet8: TTabSheet;
    GroupBox8: TGroupBox;
    ListBoxGameLogList: TListBox;
    ButtonGameLogAdd: TButton;
    ButtonGameLogDel: TButton;
    ButtonGameLogAddAll: TButton;
    ButtonGameLogDelAll: TButton;
    ButtonGameLogSave: TButton;
    GroupBox9: TGroupBox;
    ListBoxitemList2: TListBox;
    TabSheet9: TTabSheet;
    GroupBox10: TGroupBox;
    ListBoxDisableTakeOffList: TListBox;
    ButtonDisableTakeOffAdd: TButton;
    ButtonDisableTakeOffDel: TButton;
    ButtonDisableTakeOffAddAll: TButton;
    ButtonDisableTakeOffDelAll: TButton;
    ButtonDisableTakeOffSave: TButton;
    GroupBox11: TGroupBox;
    ListBoxitemList3: TListBox;
    TabSheet10: TTabSheet;
    GroupBox12: TGroupBox;
    ListBoxAdminList: TListBox;
    TabSheet11: TTabSheet;
    GroupBox13: TGroupBox;
    ListBoxNoClearMonList: TListBox;
    ButtonNoClearMonAdd: TButton;
    ButtonNoClearMonDel: TButton;
    ButtonNoClearMonAddAll: TButton;
    ButtonNoClearMonDelAll: TButton;
    ButtonNoClearMonSave: TButton;
    GroupBox14: TGroupBox;
    ListBoxMonList: TListBox;
    GroupBox15: TGroupBox;
    Label4: TLabel;
    EditAdminName: TEdit;
    EditAdminPremission: TSpinEdit;
    Label5: TLabel;
    ButtonAdminListAdd: TButton;
    ButtonAdminListChange: TButton;
    ButtonAdminListDel: TButton;
    ButtonAdminLitsSave: TButton;
    ButtonMonDropLimitAdd: TButton;
    ButtonMonDropLimitRef: TButton;
    ButtonMonDropLimitDel: TButton;
    GroupBox16: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ButtonItemBindAcountMod: TButton;
    EditItemBindAccountItemIdx: TSpinEdit;
    EditItemBindAccountItemMakeIdx: TSpinEdit;
    EditItemBindAccountItemName: TEdit;
    ButtonItemBindAcountAdd: TButton;
    ButtonItemBindAcountRef: TButton;
    ButtonItemBindAcountDel: TButton;
    EditItemBindAccountName: TEdit;
    GroupBox17: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    ButtonItemBindCharNameMod: TButton;
    EditItemBindCharNameItemIdx: TSpinEdit;
    EditItemBindCharNameItemMakeIdx: TSpinEdit;
    EditItemBindCharNameItemName: TEdit;
    ButtonItemBindCharNameAdd: TButton;
    ButtonItemBindCharNameRef: TButton;
    ButtonItemBindCharNameDel: TButton;
    EditItemBindCharNameName: TEdit;
    GroupBox18: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ButtonItemBindIPaddrMod: TButton;
    EditItemBindIPaddrItemIdx: TSpinEdit;
    EditItemBindIPaddrItemMakeIdx: TSpinEdit;
    EditItemBindIPaddrItemName: TEdit;
    ButtonItemBindIPaddrAdd: TButton;
    ButtonItemBindIPaddrRef: TButton;
    ButtonItemBindIPaddrDel: TButton;
    EditItemBindIPaddrName: TEdit;
    TabSheet12: TTabSheet;
    GridItemNameList: TStringGrid;
    GroupBox19: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    ButtonItemNameMod: TButton;
    EditItemNameIdx: TSpinEdit;
    EditItemNameMakeIndex: TSpinEdit;
    EditItemNameOldName: TEdit;
    ButtonItemNameAdd: TButton;
    ButtonItemNameRef: TButton;
    ButtonItemNameDel: TButton;
    EditItemNameNewName: TEdit;
    LabelAdminIPaddr: TLabel;
    EditAdminIPaddr: TEdit;
    TabSheet13: TTabSheet;
    GroupBox20: TGroupBox;
    ListBoxColumnList: TListBox;
    GroupBox21: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    LabelColumnIPaddr: TLabel;
    EditColumnName: TEdit;
    EditColumnPremission: TSpinEdit;
    EditColumnIPaddr: TEdit;
    ButtonColumnListAdd: TButton;
    ButtonColumnListChange: TButton;
    ButtonColumnListDel: TButton;
    ButtonColumnLitsSave: TButton;
    TabSheet14: TTabSheet;
    GroupBox22: TGroupBox;
    ListBoxSetItems: TListBox;
    PopupMenu1: TPopupMenu;
    A1: TMenuItem;
    GroupBox23: TGroupBox;
    ListViewSuit: TListView;
    GroupBox24: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    EditHP: TSpinEdit;
    EditMP: TSpinEdit;
    EditACt: TSpinEdit;
    EditMAC3: TSpinEdit;
    EditDC: TSpinEdit;
    EditMC: TSpinEdit;
    EditSC: TSpinEdit;
    EditSC2: TSpinEdit;
    EditAC: TSpinEdit;
    EditAC2: TSpinEdit;
    EditMAC: TSpinEdit;
    EditMAC2: TSpinEdit;
    EditHitPoint: TSpinEdit;
    EditSpeedPoint: TSpinEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    GroupBox25: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    CheckBox2: TCheckBox;
    CheckDropData: TCheckBox;
    Label64: TLabel;
    Label65: TLabel;
    DropDateSpin: TSpinEdit;
    Label66: TLabel;
    Label67: TLabel;
    SpinEdit13: TSpinEdit;
    Label68: TLabel;
    SpinEdit14: TSpinEdit;
    Label69: TLabel;
    SpinEdit15: TSpinEdit;
    Label70: TLabel;
    SpinEdit16: TSpinEdit;
    Label71: TLabel;
    SpinEdit17: TSpinEdit;
    SpinEdit18: TSpinEdit;
    Label72: TLabel;
    SpinEdit19: TSpinEdit;
    Label73: TLabel;
    SpinEdit20: TSpinEdit;
    Label74: TLabel;
    SpinEdit21: TSpinEdit;
    Label75: TLabel;
    Label76: TLabel;
    Edit14: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListBoxItemListClick(Sender: TObject);
    procedure ListBoxEnableMakeListClick(Sender: TObject);
    procedure ButtonEnableMakeAddClick(Sender: TObject);
    procedure ButtonEnableMakeDeleteClick(Sender: TObject);
    procedure ButtonEnableMakeSaveClick(Sender: TObject);
    procedure ButtonDisableMakeAddAllClick(Sender: TObject);
    procedure ButtonDisableMakeDeleteAllClick(Sender: TObject);
    procedure ButtonEnableMakeAddAllClick(Sender: TObject);
    procedure ButtonEnableMakeDeleteAllClick(Sender: TObject);
    procedure ListBoxitemList1Click(Sender: TObject);
    procedure ListBoxDisableMakeListClick(Sender: TObject);
    procedure ButtonDisableMakeAddClick(Sender: TObject);
    procedure ButtonDisableMakeDeleteClick(Sender: TObject);
    procedure ButtonDisableMakeSaveClick(Sender: TObject);
    procedure ButtonDisableMoveMapAddClick(Sender: TObject);
    procedure ButtonDisableMoveMapDeleteClick(Sender: TObject);
    procedure ButtonDisableMoveMapAddAllClick(Sender: TObject);
    procedure ButtonDisableMoveMapSaveClick(Sender: TObject);
    procedure ButtonDisableMoveMapDeleteAllClick(Sender: TObject);
    procedure ListBoxMapListClick(Sender: TObject);
    procedure ListBoxDisableMoveMapClick(Sender: TObject);
    procedure ButtonMonDropLimitRefClick(Sender: TObject);
    procedure StringGridMonDropLimitClick(Sender: TObject);
    procedure EditDropCountChange(Sender: TObject);
    procedure EditCountLimitChange(Sender: TObject);
    procedure EditNoDropCountChange(Sender: TObject);
    procedure ButtonMonDropLimitSaveClick(Sender: TObject);
    procedure ListBoxGameLogListClick(Sender: TObject);
    procedure ListBoxitemList2Click(Sender: TObject);
    procedure ButtonGameLogAddClick(Sender: TObject);
    procedure ButtonGameLogDelClick(Sender: TObject);
    procedure ButtonGameLogAddAllClick(Sender: TObject);
    procedure ButtonGameLogDelAllClick(Sender: TObject);
    procedure ButtonGameLogSaveClick(Sender: TObject);
    procedure ButtonDisableTakeOffAddClick(Sender: TObject);
    procedure ButtonDisableTakeOffDelClick(Sender: TObject);
    procedure ListBoxDisableTakeOffListClick(Sender: TObject);
    procedure ListBoxitemList3Click(Sender: TObject);
    procedure ButtonDisableTakeOffAddAllClick(Sender: TObject);
    procedure ButtonDisableTakeOffDelAllClick(Sender: TObject);
    procedure ButtonDisableTakeOffSaveClick(Sender: TObject);
    procedure ButtonNoClearMonAddClick(Sender: TObject);
    procedure ButtonNoClearMonDelClick(Sender: TObject);
    procedure ButtonNoClearMonAddAllClick(Sender: TObject);
    procedure ButtonNoClearMonDelAllClick(Sender: TObject);
    procedure ButtonNoClearMonSaveClick(Sender: TObject);
    procedure ListBoxNoClearMonListClick(Sender: TObject);
    procedure ListBoxMonListClick(Sender: TObject);
    procedure ButtonAdminLitsSaveClick(Sender: TObject);
    procedure ListBoxAdminListClick(Sender: TObject);
    procedure ButtonAdminListChangeClick(Sender: TObject);
    procedure ButtonAdminListAddClick(Sender: TObject);
    procedure ButtonAdminListDelClick(Sender: TObject);
    procedure ButtonMonDropLimitAddClick(Sender: TObject);
    procedure ButtonMonDropLimitDelClick(Sender: TObject);
    procedure GridItemBindAccountClick(Sender: TObject);
    procedure EditItemBindAccountItemIdxChange(Sender: TObject);
    procedure EditItemBindAccountItemMakeIdxChange(Sender: TObject);
    procedure ButtonItemBindAcountModClick(Sender: TObject);
    procedure EditItemBindAccountNameChange(Sender: TObject);
    procedure ButtonItemBindAcountRefClick(Sender: TObject);
    procedure ButtonItemBindAcountAddClick(Sender: TObject);
    procedure ButtonItemBindAcountDelClick(Sender: TObject);
    procedure GridItemBindCharNameClick(Sender: TObject);
    procedure EditItemBindCharNameItemIdxChange(Sender: TObject);
    procedure EditItemBindCharNameItemMakeIdxChange(Sender: TObject);
    procedure EditItemBindCharNameNameChange(Sender: TObject);
    procedure ButtonItemBindCharNameAddClick(Sender: TObject);
    procedure ButtonItemBindCharNameModClick(Sender: TObject);
    procedure ButtonItemBindCharNameDelClick(Sender: TObject);
    procedure ButtonItemBindCharNameRefClick(Sender: TObject);
    procedure GridItemBindIPaddrClick(Sender: TObject);
    procedure EditItemBindIPaddrItemIdxChange(Sender: TObject);
    procedure EditItemBindIPaddrItemMakeIdxChange(Sender: TObject);
    procedure EditItemBindIPaddrNameChange(Sender: TObject);
    procedure ButtonItemBindIPaddrAddClick(Sender: TObject);
    procedure ButtonItemBindIPaddrModClick(Sender: TObject);
    procedure ButtonItemBindIPaddrDelClick(Sender: TObject);
    procedure ButtonItemBindIPaddrRefClick(Sender: TObject);
    procedure EditItemNameIdxChange(Sender: TObject);
    procedure EditItemNameMakeIndexChange(Sender: TObject);
    procedure EditItemNameNewNameChange(Sender: TObject);
    procedure ButtonItemNameAddClick(Sender: TObject);
    procedure ButtonItemNameModClick(Sender: TObject);
    procedure ButtonItemNameDelClick(Sender: TObject);
    procedure GridItemNameListClick(Sender: TObject);
    procedure ButtonItemNameRefClick(Sender: TObject);
    procedure ListBoxColumnListClick(Sender: TObject);
    procedure ButtonColumnListAddClick(Sender: TObject);
    procedure ButtonColumnListChangeClick(Sender: TObject);
    procedure ButtonColumnListDelClick(Sender: TObject);
    procedure ButtonColumnLitsSaveClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListBoxSetItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListViewSuitClick(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure EditHPChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListBoxSetItemsDblClick(Sender: TObject);
    procedure DropDateSpinChange(Sender: TObject);
  private
    boOpened:Boolean;
    boModValued:Boolean;

    procedure ModValue();
    procedure uModValue();
    procedure RefMonDropLimit();
    procedure RefAdminList;
    procedure RefColumnList;
    procedure RefNoClearMonList();
    procedure RefItemBindAccount();
    procedure RefItemBindCharName();
    procedure RefItemBindIPaddr();
    procedure RefItemCustomNameList();
    procedure RefSetItems();
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmViewList: TfrmViewList;

implementation

uses M2Share, UsrEngn, Envir, HUtil32, LocalDB, DateUtils;

{$R *.dfm}

{ TfrmViewList }

procedure TfrmViewList.ModValue;
begin
  boModValued:=True;
  ButtonEnableMakeSave.Enabled:=True;
  ButtonDisableMakeSave.Enabled:=True;
  ButtonDisableMoveMapSave.Enabled:=True;
  ButtonGameLogSave.Enabled:=True;
  ButtonDisableTakeOffSave.Enabled:=True;
  ButtonNoClearMonSave.Enabled:=True;
end;

procedure TfrmViewList.uModValue;
begin
  boModValued:=False;
  ButtonEnableMakeSave.Enabled:=False;
  ButtonDisableMakeSave.Enabled:=False;
  ButtonDisableMoveMapSave.Enabled:=False;
  ButtonGameLogSave.Enabled:=False;
  ButtonDisableTakeOffSave.Enabled:=False;
  ButtonNoClearMonSave.Enabled:=False;
end;

procedure TfrmViewList.Open;
var
  I: Integer;
  StdItem:TItem;
  Envir:TEnvirnoment;
begin
  boOpened:=False;
  uModValue();
  ListBoxDisableMakeList.Items.Clear;
  ListBoxEnableMakeList.Items.Clear;
  ListBoxSetItems.Items.Clear;
  ListBoxItemList.Items.Clear;
  ListBoxItemList1.Items.Clear;
  ListBoxitemList2.Items.Clear;
  ListBoxitemList3.Items.Clear;
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    ListBoxitemList2.Items.AddObject(sSTRING_GOLDNAME,TObject(nil));
    ListBoxitemList2.Items.AddObject(g_Config.sGameGoldName,TObject(nil));
    ListBoxitemList2.Items.AddObject(g_Config.sGamePointName,TObject(nil));
    for I := 0 to UserEngine.StdItemList.Count - 1 do begin
      StdItem:=UserEngine.StdItemList.Items[I];
      ListBoxItemList.Items.AddObject(StdItem.Name,TObject(StdItem));
      ListBoxitemList1.Items.AddObject(StdItem.Name,TObject(StdItem));
      ListBoxitemList2.Items.AddObject(StdItem.Name,TObject(StdItem));
      ListBoxitemList3.Items.AddObject(StdItem.Name,TObject(I));
      if Stditem.StdMode in [5,6,90,99,12,10,11,15,19,20,21,22,23,24,26,62,63,64] then
        ListBoxSetItems.Items.AddObject(StdItem.Name, TObject(StdItem));
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;

  for I := 0 to g_MapManager.Count - 1 do begin
    Envir:=TEnvirnoment(g_MapManager.Items[I]);
    ListBoxMapList.Items.Add(Envir.sMapName);
  end;

  g_DisableMakeItemList.Lock;
  try
    for I := 0 to g_DisableMakeItemList.Count - 1 do begin
      ListBoxDisableMakeList.Items.Add(g_DisableMakeItemList.Strings[I]);
    end;
  finally
    g_DisableMakeItemList.UnLock;
  end;

  g_GameLogItemNameList.Lock;
  try
    for I := 0 to g_GameLogItemNameList.Count - 1 do begin
      ListBoxGameLogList.Items.Add(g_GameLogItemNameList.Strings[I]);
    end;
  finally
    g_GameLogItemNameList.UnLock;
  end;

  g_DisableTakeOffList.Lock;
  try
    for I := 0 to g_DisableTakeOffList.Count - 1 do begin
      ListBoxDisableTakeOffList.Items.AddObject(IntToStr(Integer(g_DisableTakeOffList.Objects[I])) + '  ' + g_DisableTakeOffList.Strings[I],g_DisableTakeOffList.Objects[I]);
    end;
  finally
    g_DisableTakeOffList.UnLock;
  end;



  g_DisableMoveMapList.Lock;
  try
    for I := 0 to g_DisableMoveMapList.Count - 1 do begin
      ListBoxDisableMoveMap.Items.Add(g_DisableMoveMapList.Strings[I]);
    end;
  finally
    g_DisableMoveMapList.UnLock;
  end;

  RefSetItems();
  RefItemBindAccount();

  RefItemBindCharName();

  RefItemBindIPaddr();

  RefMonDropLimit();
  RefAdminList();
  RefColumnList();
  RefNoClearMonList();
  RefItemCustomNameList();
  
  boOpened:=True;
  PageControlViewList.ActivePageIndex:=0;
  
  ShowModal;
end;



procedure TfrmViewList.FormCreate(Sender: TObject);
begin
  GridItemBindAccount.Cells[0,0]:='Item Name';
  GridItemBindAccount.Cells[1,0]:='Item IDX';
  GridItemBindAccount.Cells[2,0]:='Item No.';
  GridItemBindAccount.Cells[3,0]:='Account';

  GridItemBindCharName.Cells[0,0]:='Item Name';
  GridItemBindCharName.Cells[1,0]:='Item IDX';
  GridItemBindCharName.Cells[2,0]:='Item No.';
  GridItemBindCharName.Cells[3,0]:='Character name';

  GridItemBindIPaddr.Cells[0,0]:='Item Name';
  GridItemBindIPaddr.Cells[1,0]:='Item IDX';
  GridItemBindIPaddr.Cells[2,0]:='Item No.';
  GridItemBindIPaddr.Cells[3,0]:='IP Addres';

  StringGridMonDropLimit.Cells[0,0]:='物品名字';
  StringGridMonDropLimit.Cells[1,0]:='物品IDX';
  StringGridMonDropLimit.Cells[2,0]:='爆出限制数量';
  StringGridMonDropLimit.Cells[3,0]:='断线 掉落 个数';
  StringGridMonDropLimit.Cells[4,0]:='限制使用 ';
  StringGridMonDropLimit.Cells[5,0]:='爆出限制日期';

  GridItemNameList.Cells[0,0]:='Item Name';
  GridItemNameList.Cells[1,0]:='New IDX';
  GridItemNameList.Cells[2,0]:='Character Name';

  TabSheetMonDrop.TabVisible:=True;

  
  ButtonEnableMakeAdd.Enabled:=False;
  ButtonEnableMakeDelete.Enabled:=False;
  ButtonDisableMakeAdd.Enabled:=False;
  ButtonDisableMakeDelete.Enabled:=False;
  ButtonDisableMoveMapAdd.Enabled:=False;
  ButtonDisableMoveMapDelete.Enabled:=False;
  ButtonGameLogAdd.Enabled:=False;
  ButtonGameLogDel.Enabled:=False;

  ButtonNoClearMonAdd.Enabled:=False;
  ButtonDisableTakeOffDel.Enabled:=False;

  ButtonDisableTakeOffAdd.Enabled:=False;
  ButtonNoClearMonDel.Enabled:=False;

  EditAdminIPaddr.Visible  := True;
  LabelAdminIPaddr.Visible := True;
end;

procedure TfrmViewList.ListBoxItemListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxItemList.ItemIndex >=0 then
    ButtonEnableMakeAdd.Enabled:=True;

end;

procedure TfrmViewList.ListBoxEnableMakeListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxEnableMakeList.ItemIndex >=0 then
    ButtonEnableMakeDelete.Enabled:=True;
end;

procedure TfrmViewList.ButtonEnableMakeAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxItemList.ItemIndex >=0 then begin
    for I := 0 to ListBoxEnableMakeList.Items.Count - 1 do begin
      if ListBoxEnableMakeList.Items.Strings[I] = ListBoxItemList.Items.Strings[ListBoxItemList.ItemIndex] then begin
        Application.MessageBox('此物品已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxEnableMakeList.Items.Add(ListBoxItemList.Items.Strings[ListBoxItemList.ItemIndex]);
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonEnableMakeAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxEnableMakeList.Items.Clear;
  for I := 0 to ListBoxItemList.Items.Count - 1 do begin
    ListBoxEnableMakeList.Items.Add(ListBoxItemList.Items.Strings[I]);
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonEnableMakeDeleteAllClick(Sender: TObject);
begin
  ListBoxEnableMakeList.Items.Clear;
  ButtonEnableMakeDelete.Enabled:=False;
  ModValue();
end;

procedure TfrmViewList.ButtonEnableMakeDeleteClick(Sender: TObject);
begin
  if ListBoxEnableMakeList.ItemIndex >=0 then begin
    ListBoxEnableMakeList.Items.Delete(ListBoxEnableMakeList.ItemIndex);
    ModValue();
  end;
  if ListBoxEnableMakeList.ItemIndex < 0 then
    ButtonEnableMakeDelete.Enabled:=False;
end;


procedure TfrmViewList.ButtonEnableMakeSaveClick(Sender: TObject);
var
  I: Integer;
begin
  g_EnableMakeItemList.Lock;
  try
    g_EnableMakeItemList.Clear;
    for I := 0 to ListBoxEnableMakeList.Items.Count - 1 do begin
      g_EnableMakeItemList.Add(ListBoxEnableMakeList.Items.Strings[I])
    end;
  finally
    g_EnableMakeItemList.UnLock;
  end;
  uModValue();
end;

procedure TfrmViewList.ListBoxitemList1Click(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxItemList1.ItemIndex >=0 then
    ButtonDisableMakeAdd.Enabled:=True;
end;

procedure TfrmViewList.ListBoxDisableMakeListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxDisableMakeList.ItemIndex >=0 then
    ButtonDisableMakeDelete.Enabled:=True;
end;

procedure TfrmViewList.ButtonDisableMakeAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxItemList1.ItemIndex >=0 then begin
    for I := 0 to ListBoxDisableMakeList.Items.Count - 1 do begin
      if ListBoxDisableMakeList.Items.Strings[I] = ListBoxItemList1.Items.Strings[ListBoxItemList1.ItemIndex] then begin
        Application.MessageBox('此物品已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxDisableMakeList.Items.Add(ListBoxItemList1.Items.Strings[ListBoxItemList1.ItemIndex]);
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonDisableMakeDeleteClick(Sender: TObject);
begin
  if ListBoxDisableMakeList.ItemIndex >=0 then begin
    ListBoxDisableMakeList.Items.Delete(ListBoxDisableMakeList.ItemIndex);
    ModValue();
  end;
  if ListBoxDisableMakeList.ItemIndex < 0 then
    ButtonDisableMakeDelete.Enabled:=False;
end;

procedure TfrmViewList.ButtonDisableMakeAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxDisableMakeList.Items.Clear;
  for I := 0 to ListBoxItemList1.Items.Count - 1 do begin
    ListBoxDisableMakeList.Items.Add(ListBoxItemList1.Items.Strings[I]);
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonDisableMakeDeleteAllClick(Sender: TObject);
begin
  ListBoxDisableMakeList.Items.Clear;
  ButtonDisableMakeDelete.Enabled:=False;
  ModValue();
end;



procedure TfrmViewList.ButtonDisableMakeSaveClick(Sender: TObject);
var
  I: Integer;
begin
  g_DisableMakeItemList.Lock;
  try
    g_DisableMakeItemList.Clear;
    for I := 0 to ListBoxDisableMakeList.Items.Count - 1 do begin
      g_DisableMakeItemList.Add(ListBoxDisableMakeList.Items.Strings[I])
    end;
  finally
    g_DisableMakeItemList.UnLock;
  end;
  SaveDisableMakeItem();
  uModValue();
end;

procedure TfrmViewList.ButtonDisableMoveMapAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxMapList.ItemIndex >=0 then begin
    for I := 0 to ListBoxDisableMoveMap.Items.Count - 1 do begin
      if ListBoxDisableMoveMap.Items.Strings[I] = ListBoxMapList.Items.Strings[ListBoxMapList.ItemIndex] then begin
        Application.MessageBox('此地图已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxDisableMoveMap.Items.Add(ListBoxMapList.Items.Strings[ListBoxMapList.ItemIndex]);
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonDisableMoveMapDeleteClick(Sender: TObject);
begin
  if ListBoxDisableMoveMap.ItemIndex >=0 then begin
    ListBoxDisableMoveMap.Items.Delete(ListBoxDisableMoveMap.ItemIndex);
    ModValue();
  end;
  if ListBoxDisableMoveMap.ItemIndex < 0 then
    ButtonDisableMoveMapDelete.Enabled:=False;
end;

procedure TfrmViewList.ButtonDisableMoveMapAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxDisableMoveMap.Items.Clear;
  for I := 0 to ListBoxMapList.Items.Count - 1 do begin
    ListBoxDisableMoveMap.Items.Add(ListBoxMapList.Items.Strings[I]);
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonDisableMoveMapSaveClick(Sender: TObject);
var
  I: Integer;
begin
  g_DisableMoveMapList.Lock;
  try
    g_DisableMoveMapList.Clear;
    for I := 0 to ListBoxDisableMoveMap.Items.Count - 1 do begin
      g_DisableMoveMapList.Add(ListBoxDisableMoveMap.Items.Strings[I])
    end;
  finally
    g_DisableMoveMapList.UnLock;
  end;
  SaveDisableMoveMap();
  uModValue();
end;

procedure TfrmViewList.ButtonDisableMoveMapDeleteAllClick(Sender: TObject);
begin
  ListBoxDisableMoveMap.Items.Clear;
  ButtonDisableMoveMapDelete.Enabled:=False;
  ModValue();
end;

procedure TfrmViewList.ListBoxMapListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxMapList.ItemIndex >=0 then
    ButtonDisableMoveMapAdd.Enabled:=True;
end;

procedure TfrmViewList.ListBoxDisableMoveMapClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxDisableMoveMap.ItemIndex >=0 then
    ButtonDisableMoveMapDelete.Enabled:=True;
end;

procedure TfrmViewList.RefMonDropLimit;
var
  I:Integer;
  MonDrop:pTMonDrop;
begin
  g_MonDropLimitLIst.Lock;
  try
    StringGridMonDropLimit.RowCount:=g_MonDropLimitLIst.Count + 1;
    if StringGridMonDropLimit.RowCount > 1 then StringGridMonDropLimit.FixedRows:=1;
      
    for I := 0 to g_MonDropLimitLIst.Count - 1 do begin
      MonDrop:=pTMonDrop(g_MonDropLimitLIst.Objects[I]);
      StringGridMonDropLimit.Cells[0,I+1]:=MonDrop.sItemName;
      StringGridMonDropLimit.Cells[1,I+1]:=IntToStr(MonDrop.nDropCount);
      StringGridMonDropLimit.Cells[2,I+1]:=IntToStr(MonDrop.nCountLimit);
      StringGridMonDropLimit.Cells[3,I+1]:=IntToStr(MonDrop.nNoDropCount);
      StringGridMonDropLimit.Cells[4,I+1]:=BoolToStr(MonDrop.DateBool);
      StringGridMonDropLimit.Cells[5,I+1]:=DateTimeToStr(UnixToDateTime(MonDrop.DateLimit));
    end;
  finally
    g_MonDropLimitLIst.UnLock;
  end;
end;

procedure TfrmViewList.ButtonMonDropLimitRefClick(Sender: TObject);
begin
  RefMonDropLimit();
end;

procedure TfrmViewList.StringGridMonDropLimitClick(Sender: TObject);
var
  nItemIndex:Integer;
  MonDrop:pTMonDrop;
begin
  nItemIndex:=StringGridMonDropLimit.Row - 1;
  if nItemIndex < 0 then exit;

  g_MonDropLimitList.Lock;
  try
    if nItemIndex >= g_MonDropLimitList.Count then exit;
    MonDrop:=pTMonDrop(g_MonDropLimitList.Objects[nItemIndex]);
    EditItemName.Text:=MonDrop.sItemName;
    EditDropCount.Value:=MonDrop.nDropCount;
    EditCountLimit.Value:=MonDrop.nCountLimit;
    EditNoDropCount.Value:=MonDrop.nNoDropCount;
    CheckDropData.Checked:=MonDrop.DateBool;
    DropDateSpin.Value:=GetDayCount(UnixToDateTime(MonDrop.DateLimit) + 1, now);
  finally
    g_MonDropLimitList.UnLock;
  end;
end;

procedure TfrmViewList.EditDropCountChange(Sender: TObject);
begin
  if EditDropCount.Text = '' then begin
    EditDropCount.Text:='0';
    exit;
  end;

end;

procedure TfrmViewList.EditCountLimitChange(Sender: TObject);
begin
  if EditCountLimit.Text = '' then begin
    EditCountLimit.Text:='0';
    exit;
  end;
end;

procedure TfrmViewList.EditNoDropCountChange(Sender: TObject);
begin
  if EditNoDropCount.Text = '' then begin
    EditNoDropCount.Text:='0';
    exit;
  end;
end;

procedure TfrmViewList.ButtonMonDropLimitSaveClick(Sender: TObject);
var
  sItemName:String;
  nNoDropCount:Integer;
  nDropCount:Integer;
  nDropLimit:Integer;
  nDropDate:Boolean;
  nSelIndex,nDate:Integer;
  MonDrop:pTMonDrop;
begin
  sItemName:=Trim(EditItemName.Text);
  nDropCount:=EditDropCount.Value;
  nDropLimit:=EditCountLimit.Value;
  nNoDropCount:=EditNoDropCount.Value;
  nDropDate:=CheckDropData.Checked;
  nDate:= DateTImeToUnix(IncDay(Now(), DropDateSpin.Value));
  nSelIndex:=StringGridMonDropLimit.Row -1;
  if nSelIndex < 0 then exit;
  g_MonDropLimitList.Lock;
  try
    if nSelIndex >= g_MonDropLimitList.Count then exit;
    MonDrop:=pTMonDrop(g_MonDropLimitList.Objects[nSelIndex]);
    MonDrop.sItemName:=sItemName;
    MonDrop.nDropCount:=nDropCount;
    MonDrop.nNoDropCount:=nNoDropCount;
    MonDrop.nCountLimit:=nDropLimit;
    MonDrop.DateBool:=nDropDate;
    MonDrop.DateLimit:=nDate;
  finally
    g_MonDropLimitList.UnLock;
  end;
  SaveMonDropLimitList();
  RefMonDropLimit();
end;

procedure TfrmViewList.ButtonMonDropLimitAddClick(Sender: TObject);
var
  I: Integer;
  sItemName:String;
  nNoDropCount:Integer;
  nDropCount:Integer;
  nDropLimit:Integer;
  nDropDate:Boolean;
  nDate:Integer;
  MonDrop:pTMonDrop;
begin
  sItemName:=Trim(EditItemName.Text);
  nDropCount:=EditDropCount.Value;
  nDropLimit:=EditCountLimit.Value;
  nNoDropCount:=EditNoDropCount.Value;
  nDropDate:=CheckDropData.Checked;
  nDate:=DateTImeToUnix(IncDay(Now(), DropDateSpin.Value));
  g_MonDropLimitList.Lock;
  try
    for I := 0 to g_MonDropLimitList.Count - 1 do begin
      MonDrop:=pTMonDrop(g_MonDropLimitList.Objects[I]);
      if CompareText(MonDrop.sItemName,sItemName) = 0 then begin
        Application.MessageBox('输入的物品名已经在列表中！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(MonDrop);
    MonDrop.sItemName:=sItemName;
    MonDrop.nDropCount:=nDropCount;
    MonDrop.nNoDropCount:=nNoDropCount;
    MonDrop.nCountLimit:=nDropLimit;
    MonDrop.DateBool:=nDropDate;
    MonDrop.DateLimit:=nDate;
    g_MonDropLimitList.AddObject(sItemName,TObject(MonDrop));
  finally
    g_MonDropLimitList.UnLock;
  end;
  SaveMonDropLimitList();
  RefMonDropLimit();
end;


procedure TfrmViewList.ButtonMonDropLimitDelClick(Sender: TObject);
var
  nSelIndex:Integer;
  MonDrop:pTMonDrop;
begin

  nSelIndex:=StringGridMonDropLimit.Row -1;
  if nSelIndex < 0 then exit;
  g_MonDropLimitList.Lock;
  try
    if nSelIndex >= g_MonDropLimitList.Count then exit;
    MonDrop:=pTMonDrop(g_MonDropLimitList.Objects[nSelIndex]);
    Dispose(MonDrop);
    g_MonDropLimitList.Delete(nSelIndex);
  finally
    g_MonDropLimitList.UnLock;
  end;
  SaveMonDropLimitList();
  RefMonDropLimit();
end;

procedure TfrmViewList.ListBoxGameLogListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxGameLogList.ItemIndex >=0 then
    ButtonGameLogDel.Enabled:=True;
end;

procedure TfrmViewList.ListBoxitemList2Click(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxitemList2.ItemIndex >=0 then
    ButtonGameLogAdd.Enabled:=True;
end;

procedure TfrmViewList.ButtonGameLogAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxItemList2.ItemIndex >=0 then begin
    for I := 0 to ListBoxGameLogList.Items.Count - 1 do begin
      if ListBoxGameLogList.Items.Strings[I] = ListBoxItemList2.Items.Strings[ListBoxItemList2.ItemIndex] then begin
        Application.MessageBox('此物品已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxGameLogList.Items.Add(ListBoxItemList2.Items.Strings[ListBoxItemList2.ItemIndex]);
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonGameLogDelClick(Sender: TObject);
begin
  if ListBoxGameLogList.ItemIndex >=0 then begin
    ListBoxGameLogList.Items.Delete(ListBoxGameLogList.ItemIndex);
    ModValue();
  end;
  if ListBoxGameLogList.ItemIndex < 0 then
    ButtonGameLogDel.Enabled:=False;
end;

procedure TfrmViewList.ButtonGameLogAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxGameLogList.Items.Clear;
  for I := 0 to ListBoxItemList2.Items.Count - 1 do begin
    ListBoxGameLogList.Items.Add(ListBoxItemList2.Items.Strings[I]);
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonGameLogDelAllClick(Sender: TObject);
begin
  ListBoxGameLogList.Items.Clear;
  ButtonGameLogDel.Enabled:=False;
  ModValue();
end;

procedure TfrmViewList.ButtonGameLogSaveClick(Sender: TObject);
var
  I: Integer;
begin

  g_GameLogItemNameList.Lock;
  try
    g_GameLogItemNameList.Clear;
    for I := 0 to ListBoxGameLogList.Items.Count - 1 do begin
      g_GameLogItemNameList.Add(ListBoxGameLogList.Items.Strings[I])
    end;
  finally
    g_GameLogItemNameList.UnLock;
  end;
  uModValue();  

  SaveGameLogItemNameList();

  if Application.MessageBox('此设置必须重新加载物品数据库才能生效，是否重新加载？','Reset?',MB_YESNO + MB_ICONQUESTION) = mrYes then begin
    FrmDB.LoadItemsDB();
  end;
end;

procedure TfrmViewList.ButtonDisableTakeOffAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxItemList3.ItemIndex >=0 then begin
    for I := 0 to ListBoxDisableTakeOffList.Items.Count - 1 do begin
      if ListBoxDisableTakeOffList.Items.Strings[I] = ListBoxItemList3.Items.Strings[ListBoxItemList3.ItemIndex] then begin
        Application.MessageBox('此物品已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxDisableTakeOffList.Items.AddObject(IntToStr(ListBoxItemList3.ItemIndex) + '  ' +  ListBoxItemList3.Items.Strings[ListBoxItemList3.ItemIndex],TObject(ListBoxItemList3.ItemIndex));
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonDisableTakeOffDelClick(Sender: TObject);
begin
  if ListBoxDisableTakeOffList.ItemIndex >=0 then begin
    ListBoxDisableTakeOffList.Items.Delete(ListBoxDisableTakeOffList.ItemIndex);
    ModValue();
  end;
  if ListBoxDisableTakeOffList.ItemIndex < 0 then
    ButtonDisableTakeOffDel.Enabled:=False;
end;

procedure TfrmViewList.ListBoxDisableTakeOffListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxDisableTakeOffList.ItemIndex >=0 then
    ButtonDisableTakeOffDel.Enabled:=True;
end;

procedure TfrmViewList.ListBoxitemList3Click(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxitemList3.ItemIndex >=0 then
    ButtonDisableTakeOffAdd.Enabled:=True;
end;

procedure TfrmViewList.ButtonDisableTakeOffAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxDisableTakeOffList.Items.Clear;
  for I := 0 to ListBoxItemList3.Items.Count - 1 do begin
    ListBoxDisableTakeOffList.Items.AddObject(IntToStr(I) + '  ' +  ListBoxItemList3.Items.Strings[I],TObject(I));
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonDisableTakeOffDelAllClick(Sender: TObject);
begin
  ListBoxDisableTakeOffList.Items.Clear;
  ButtonDisableTakeOffDel.Enabled:=False;
  ModValue();
end;

procedure TfrmViewList.ButtonDisableTakeOffSaveClick(Sender: TObject);
var
  I: Integer;
  sItemIdx:String;
begin
  g_DisableTakeOffList.Lock;
  try
    g_DisableTakeOffList.Clear;
    for I := 0 to ListBoxDisableTakeOffList.Items.Count - 1 do begin
      g_DisableTakeOffList.AddObject(Trim(GetValidStr3(ListBoxDisableTakeOffList.Items.Strings[I], sItemIdx, [' ','/',',',#9])),ListBoxDisableTakeOffList.Items.Objects[I]);
    end;
  finally
    g_DisableTakeOffList.UnLock;
  end;
  SaveDisableTakeOffList();
  uModValue();
end;
procedure TfrmViewList.RefAdminList();
var
  I         :Integer;
  AdminInfo :pTAdminInfo;
begin
  ListBoxAdminList.Clear;
  EditAdminName.Text            := '';
  EditAdminIPaddr.Text          := '';
  EditAdminPremission.Value     := 0;
  ButtonAdminListChange.Enabled := False;
  ButtonAdminListDel.Enabled    := False;
  UserEngine.m_AdminList.Lock;
  try
    for I := 0 to UserEngine.m_AdminList.Count - 1 do begin
      AdminInfo:=pTAdminInfo(UserEngine.m_AdminList.Items[I]);

      ListBoxAdminList.Items.Add(AdminInfo.sChrName + ' - ' + IntToStr(AdminInfo.nLv) + ' - ' + AdminInfo.sIPaddr)
    end;
  finally
    UserEngine.m_AdminList.UnLock;
  end;
end;

procedure TfrmViewList.RefColumnList();
var
  I         :Integer;
  ColumnInfo:pTColumnInfo;
begin
  ListBoxColumnList.Clear;
  EditColumnName.Text            := '';
  EditColumnIPaddr.Text          := '';
  EditColumnPremission.Value     := 0;
  ButtonColumnListChange.Enabled := False;
  ButtonColumnListDel.Enabled    := False;
  UserEngine.m_ColumnList.Lock;
  try
    for I := 0 to UserEngine.m_ColumnList.Count - 1 do begin
      ColumnInfo:=pTColumnInfo(UserEngine.m_ColumnList.Items[I]);

      ListBoxColumnList.Items.Add(ColumnInfo.sChrName + ' - ' + IntToStr(ColumnInfo.nLv) + ' - ' + ColumnInfo.sIPaddr)
    end;
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
end;

procedure TfrmViewList.RefNoClearMonList;
var
  MonInfo:pTMonInfo;
  I:Integer;
begin
  EnterCriticalSection(ProcessHumanCriticalSection);
  try
    for I := 0 to UserEngine.MonsterList.Count - 1 do begin
      MonInfo:=UserEngine.MonsterList.Items[I];
      ListBoxMonList.Items.AddObject(MonInfo.sName,TObject(MonInfo));
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;

  g_NoClearMonList.Lock;
  try
    for I := 0 to g_NoClearMonList.Count - 1 do begin
      ListBoxNoClearMonList.Items.Add(g_NoClearMonList.Strings[I]);
    end;
  finally
    g_NoClearMonList.UnLock;
  end;
end;

procedure TfrmViewList.ButtonNoClearMonAddClick(Sender: TObject);
var
  I: Integer;
begin
  if ListBoxMonList.ItemIndex >=0 then begin
    for I := 0 to ListBoxNoClearMonList.Items.Count - 1 do begin
      if ListBoxNoClearMonList.Items.Strings[I] = ListBoxMonList.Items.Strings[ListBoxMonList.ItemIndex] then begin
        Application.MessageBox('此物品已在列表中！！！','Error!',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    ListBoxNoClearMonList.Items.Add(ListBoxMonList.Items.Strings[ListBoxMonList.ItemIndex]);
    ModValue();
  end;
end;

procedure TfrmViewList.ButtonNoClearMonDelClick(Sender: TObject);
begin
  if ListBoxNoClearMonList.ItemIndex >=0 then begin
    ListBoxNoClearMonList.Items.Delete(ListBoxNoClearMonList.ItemIndex);
    ModValue();
  end;
  if ListBoxNoClearMonList.ItemIndex < 0 then
    ButtonNoClearMonDel.Enabled:=False;
end;

procedure TfrmViewList.ButtonNoClearMonAddAllClick(Sender: TObject);
var
  I: Integer;
begin
  ListBoxNoClearMonList.Items.Clear;
  for I := 0 to ListBoxMonList.Items.Count - 1 do begin
    ListBoxNoClearMonList.Items.Add(ListBoxMonList.Items.Strings[I]);
  end;
  ModValue();
end;

procedure TfrmViewList.ButtonNoClearMonDelAllClick(Sender: TObject);
begin
  ListBoxNoClearMonList.Items.Clear;
  ButtonNoClearMonDel.Enabled:=False;
  ModValue();
end;

procedure TfrmViewList.ButtonNoClearMonSaveClick(Sender: TObject);
var
  I: Integer;
begin
  g_NoClearMonLIst.Lock;
  try
    g_NoClearMonLIst.Clear;
    for I := 0 to ListBoxNoClearMonList.Items.Count - 1 do begin
      g_NoClearMonLIst.Add(ListBoxNoClearMonList.Items.Strings[I]);
    end;
  finally
    g_NoClearMonLIst.UnLock;
  end;
  SaveNoClearMonLIst();
  uModValue();
end;

procedure TfrmViewList.ListBoxNoClearMonListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxNoClearMonList.ItemIndex >=0 then
    ButtonNoClearMonDel.Enabled:=True;
end;

procedure TfrmViewList.ListBoxMonListClick(Sender: TObject);
begin
  if not boOpened then exit;
  if ListBoxMonList.ItemIndex >=0 then
    ButtonNoClearMonAdd.Enabled:=True;
end;

procedure TfrmViewList.ButtonAdminLitsSaveClick(Sender: TObject);
begin
  FrmDB.SaveAdminList();
  ButtonAdminLitsSave.Enabled:=False;
end;

procedure TfrmViewList.ListBoxAdminListClick(Sender: TObject);
var
  nIndex    :Integer;
  AdminInfo :pTAdminInfo;
begin
  nIndex:=ListBoxAdminList.ItemIndex;
  UserEngine.m_AdminList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_AdminList.Count) then exit;
    ButtonAdminListChange.Enabled := True;
    ButtonAdminListDel.Enabled    := True;
    AdminInfo                     := UserEngine.m_AdminList.Items[nIndex];
    EditAdminName.Text            := AdminInfo.sChrName;
    EditAdminIPaddr.Text          := AdminInfo.sIPaddr;
    EditAdminPremission.Value     := AdminInfo.nLv;
  finally
    UserEngine.m_AdminList.UnLock;
  end;
end;

procedure TfrmViewList.ButtonAdminListAddClick(Sender: TObject);
var
  I                : Integer;
  sAdminName       :String;
  sAdminIPaddr     :String;
  nAdminPerMission :Integer;
  AdminInfo        :pTAdminInfo;
begin
  sAdminName       := Trim(EditAdminName.Text);
  sAdminIPaddr     := Trim(EditAdminIPaddr.Text);
  nAdminPerMission := EditAdminPremission.Value;
  if (nAdminPerMission < 1) or (sAdminName = '') or  not (nAdminPerMission in [0..10]) then begin
    Application.MessageBox('涝仿蔼阑 犬牢窍技夸.','坷幅',MB_OK + MB_ICONERROR);
    EditAdminName.SetFocus;
    exit;
  end;

{  if (sAdminIPaddr = '') then begin
    Application.MessageBox('登录IP输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditAdminIPaddr.SetFocus;
    exit;
  end; }

  UserEngine.m_AdminList.Lock;
  try
    for I := 0 to UserEngine.m_AdminList.Count - 1 do begin
      if CompareText(pTAdminInfo(UserEngine.m_AdminList.Items[I]).sChrName,sAdminName) = 0 then begin
        Application.MessageBox('捞固 眠啊登绢 乐嚼聪促.','坷幅',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(AdminInfo);
    AdminInfo.nLv      := nAdminPerMission;
    AdminInfo.sChrName := sAdminName;
    AdminInfo.sIPaddr  := sAdminIPaddr;
    UserEngine.m_AdminList.Add(AdminInfo);
  finally
    UserEngine.m_AdminList.UnLock;
  end;
  RefAdminList();
  ButtonAdminLitsSave.Enabled:=True;
end;

procedure TfrmViewList.ButtonAdminListChangeClick(Sender: TObject);
var
  nIndex           :Integer;
  sAdminName       :String;
  sAdminIPaddr     :String;
  nAdminPerMission :Integer;
  AdminInfo        :pTAdminInfo;
begin
  nIndex:=ListBoxAdminList.ItemIndex;
  if nIndex < 0 then exit;

  sAdminName       := Trim(EditAdminName.Text);
  sAdminIPaddr     := Trim(EditAdminIPaddr.Text);
  nAdminPerMission := EditAdminPremission.Value;
  if (nAdminPerMission < 1) or (sAdminName = '') or not (nAdminPerMission in [0..10]) then begin
    Application.MessageBox('涝仿蔼阑 犬牢窍技夸.','坷幅',MB_OK + MB_ICONERROR);
    EditAdminName.SetFocus;
    exit;
  end;

 {if (sAdminIPaddr = '') then begin
    Application.MessageBox('登录IP输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditAdminIPaddr.SetFocus;
    exit;
  end;    }

  UserEngine.m_AdminList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_AdminList.Count) then exit;
    AdminInfo:=UserEngine.m_AdminList.Items[nIndex];
    AdminInfo.sChrName := sAdminName;
    AdminInfo.nLv      := nAdminPerMission;
    AdminInfo.sIPaddr  := sAdminIPaddr;
  finally
    UserEngine.m_AdminList.UnLock;
  end;
  RefAdminList();
  ButtonAdminLitsSave.Enabled:=True;
end;


procedure TfrmViewList.ButtonAdminListDelClick(Sender: TObject);
var
  nIndex    :Integer;
begin
  nIndex:=ListBoxAdminList.ItemIndex;
  if nIndex < 0 then exit;
  UserEngine.m_AdminList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_AdminList.Count) then exit;
    Dispose(pTAdminInfo(UserEngine.m_AdminList.Items[nIndex]));
    UserEngine.m_AdminList.Delete(nIndex);
  finally
    UserEngine.m_AdminList.UnLock;
  end;
  RefAdminList();
  ButtonAdminLitsSave.Enabled:=True;
end;


 //===================


procedure TfrmViewList.ButtonColumnLitsSaveClick(Sender: TObject);
begin
  FrmDB.SaveColumnList();
  ButtonColumnLitsSave.Enabled:=False;
end;

procedure TfrmViewList.ListBoxColumnListClick(Sender: TObject);
var
  nIndex    :Integer;
  ColumnInfo :pTColumnInfo;
begin
  nIndex:=ListBoxColumnList.ItemIndex;
  UserEngine.m_ColumnList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_ColumnList.Count) then exit;
    ButtonColumnListChange.Enabled := True;
    ButtonColumnListDel.Enabled    := True;
    ColumnInfo                     := UserEngine.m_ColumnList.Items[nIndex];
    EditColumnName.Text            := ColumnInfo.sChrName;
    EditColumnIPaddr.Text          := ColumnInfo.sIPaddr;
    EditColumnPremission.Value     := ColumnInfo.nLv;
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
end;

procedure TfrmViewList.ButtonColumnListAddClick(Sender: TObject);
var
  I                : Integer;
  sColumnName       :String;
//  sColumnIPaddr     :String;
  nColumnPerMission :Integer;
  ColumnInfo        :pTColumnInfo;
begin
  sColumnName       := Trim(EditColumnName.Text);
//  sColumnIPaddr     := Trim(EditColumnIPaddr.Text);
  nColumnPerMission := EditColumnPremission.Value;
  if (nColumnPerMission < 1) or (sColumnName = '') or  not (nColumnPerMission in [0..10]) then begin
    Application.MessageBox('输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditColumnName.SetFocus;
    exit;
  end;

{  if (sColumnIPaddr = '') then begin
    Application.MessageBox('登录IP输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditColumnIPaddr.SetFocus;
    exit;
  end; }

  UserEngine.m_ColumnList.Lock;
  try
    for I := 0 to UserEngine.m_ColumnList.Count - 1 do begin
      if CompareText(pTColumnInfo(UserEngine.m_ColumnList.Items[I]).sChrName,sColumnName) = 0 then begin
        Application.MessageBox('输入的角色名已经在GM列表中！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(ColumnInfo);
    ColumnInfo.nLv      := nColumnPerMission;
    ColumnInfo.sChrName := sColumnName;
//    ColumnInfo.sIPaddr  := sColumnIPaddr;
    UserEngine.m_ColumnList.Add(ColumnInfo);
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
  RefColumnList();
  ButtonColumnLitsSave.Enabled:=True;
end;

procedure TfrmViewList.ButtonColumnListChangeClick(Sender: TObject);
var
  nIndex           :Integer;
  sColumnName       :String;
  sColumnIPaddr     :String;
  nColumnPerMission :Integer;
  ColumnInfo        :pTColumnInfo;
begin
  nIndex:=ListBoxColumnList.ItemIndex;
  if nIndex < 0 then exit;

  sColumnName       := Trim(EditColumnName.Text);
 //ColumnIPaddr     := Trim(EditColumnIPaddr.Text);
  nColumnPerMission := EditColumnPremission.Value;
  if (nColumnPerMission < 1) or (sColumnName = '') or not (nColumnPerMission in [0..10]) then begin
    Application.MessageBox('输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditColumnName.SetFocus;
    exit;
  end;

  {f (sColumnIPaddr = '') then begin
    Application.MessageBox('登录IP输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditColumnIPaddr.SetFocus;
    exit;
  end;   }

  UserEngine.m_ColumnList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_ColumnList.Count) then exit;
    ColumnInfo:=UserEngine.m_ColumnList.Items[nIndex];
    ColumnInfo.sChrName := sColumnName;
    ColumnInfo.nLv      := nColumnPerMission;
   //olumnInfo.sIPaddr  := sColumnIPaddr;
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
  RefColumnList();
  ButtonColumnLitsSave.Enabled:=True;
end;


procedure TfrmViewList.ButtonColumnListDelClick(Sender: TObject);
var
  nIndex    :Integer;
begin
  nIndex:=ListBoxColumnList.ItemIndex;
  if nIndex < 0 then exit;
  UserEngine.m_ColumnList.Lock;
  try
    if (nIndex < 0) and (nIndex >= UserEngine.m_ColumnList.Count) then exit;
    Dispose(pTColumnInfo(UserEngine.m_ColumnList.Items[nIndex]));
    UserEngine.m_ColumnList.Delete(nIndex);
  finally
    UserEngine.m_ColumnList.UnLock;
  end;
  RefColumnList();
  ButtonColumnLitsSave.Enabled:=True;
end;

 //===================

procedure TfrmViewList.RefItemBindAccount;
var
  I:Integer;
  ItemBind:pTItemBind;
begin
  GridItemBindAccount.RowCount:=2;
  GridItemBindAccount.Cells[0,1]:='';
  GridItemBindAccount.Cells[1,1]:='';
  GridItemBindAccount.Cells[2,1]:='';
  GridItemBindAccount.Cells[3,1]:='';
  ButtonItemBindAcountMod.Enabled:=False;
  ButtonItemBindAcountDel.Enabled:=False;

  g_ItemBindAccount.Lock;
  try
    GridItemBindAccount.RowCount:=g_ItemBindAccount.Count + 1;
    for I := 0 to g_ItemBindAccount.Count - 1 do begin
      ItemBind:=g_ItemBindAccount.Items[I];
      if ItemBind <> nil then begin
        GridItemBindAccount.Cells[0,I + 1]:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
        GridItemBindAccount.Cells[1,I + 1]:=IntToStr(ItemBind.nItemIdx);
        GridItemBindAccount.Cells[2,I + 1]:=IntToStr(ItemBind.nMakeIdex);
        GridItemBindAccount.Cells[3,I + 1]:=ItemBind.sBindName;
      end;
    end;
  finally
    g_ItemBindAccount.UnLock;
  end;
end;

procedure TfrmViewList.GridItemBindAccountClick(Sender: TObject);
var
  nIndex:Integer;
  ItemBind:pTItemBind;
begin

  nIndex:=GridItemBindAccount.Row - 1;
  if nIndex < 0 then exit;

  g_ItemBindAccount.Lock;
  try
    if nIndex >= g_ItemBindAccount.Count then exit;
    ItemBind:=pTItemBind(g_ItemBindAccount.Items[nIndex]);
    EditItemBindAccountItemName.Text:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
    EditItemBindAccountItemIdx.Value:=ItemBind.nItemIdx;
    EditItemBindAccountItemMakeIdx.Value:=ItemBind.nMakeIdex;
    EditItemBindAccountName.Text:=ItemBind.sBindName;
  finally
    g_ItemBindAccount.UnLock;
  end;
  ButtonItemBindAcountDel.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindAccountItemIdxChange(Sender: TObject);
begin
  if EditItemBindAccountItemIdx.Text = '' then begin
    EditItemBindAccountItemIdx.Text:='0';
    exit;
  end;
  EditItemBindAccountItemName.Text:=UserEngine.GetStdItemName(EditItemBindAccountItemIdx.Value);
  ButtonItemBindAcountMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindAccountItemMakeIdxChange(
  Sender: TObject);
begin
  if EditItemBindAccountItemIdx.Text = '' then begin
    EditItemBindAccountItemIdx.Text:='0';
    exit;
  end;
  ButtonItemBindAcountMod.Enabled:=True;
end;


procedure TfrmViewList.EditItemBindAccountNameChange(Sender: TObject);
begin
  ButtonItemBindAcountMod.Enabled:=True;
end;

procedure TfrmViewList.ButtonItemBindAcountModClick(Sender: TObject);
var
  nSelIndex:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin
  nItemIdx:=EditItemBindAccountItemIdx.Value;
  nMakeIdex:=EditItemBindAccountItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindAccountName.Text);
  nSelIndex:=GridItemBindAccount.Row -1;
  if nSelIndex < 0 then exit;
  g_ItemBindAccount.Lock;
  try
    if nSelIndex >= g_ItemBindAccount.Count then exit;
    ItemBind:=g_ItemBindAccount.Items[nSelIndex];
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
  finally
    g_ItemBindAccount.UnLock;
  end;
  SaveItemBindAccount();
  RefItemBindAccount();

end;


procedure TfrmViewList.ButtonItemBindAcountRefClick(Sender: TObject);
begin
  RefItemBindAccount();
end;


procedure TfrmViewList.ButtonItemBindAcountAddClick(Sender: TObject);
var
  I:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin
  nItemIdx:=EditItemBindAccountItemIdx.Value;
  nMakeIdex:=EditItemBindAccountItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindAccountName.Text);

  if (nItemIdx <= 0) or (nMakeIdex < 0) or (sBindName = '') then begin
    Application.MessageBox('输入的信息不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    exit;
  end;

  g_ItemBindAccount.Lock;
  try
    for I := 0 to g_ItemBindAccount.Count - 1 do begin
      ItemBind:=g_ItemBindAccount.Items[I];
      if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
        Application.MessageBox('此物品已经绑定到其他的帐号了！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(ItemBind);
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
    g_ItemBindAccount.Insert(0,ItemBind);
  finally
    g_ItemBindAccount.UnLock;
  end;
  SaveItemBindAccount();
  RefItemBindAccount();
end;


procedure TfrmViewList.ButtonItemBindAcountDelClick(Sender: TObject);
var
  ItemBind:pTItemBind;
  nSelIndex:Integer;
begin

  nSelIndex:=GridItemBindAccount.Row -1;
  if nSelIndex < 0 then exit;
  g_ItemBindAccount.Lock;
  try
    if nSelIndex >= g_ItemBindAccount.Count then exit;
    ItemBind:=g_ItemBindAccount.Items[nSelIndex];
    Dispose(ItemBind);
    g_ItemBindAccount.Delete(nSelIndex);
  finally
    g_ItemBindAccount.UnLock;
  end;
  SaveItemBindAccount();
  RefItemBindAccount();
end;

procedure TfrmViewList.RefItemBindCharName;
var
  I:Integer;
  ItemBind:pTItemBind;
begin
  GridItemBindCharName.RowCount:=2;
  GridItemBindCharName.Cells[0,1]:='';
  GridItemBindCharName.Cells[1,1]:='';
  GridItemBindCharName.Cells[2,1]:='';
  GridItemBindCharName.Cells[3,1]:='';
  ButtonItemBindCharNameMod.Enabled:=False;
  ButtonItemBindCharNameDel.Enabled:=False;
  g_ItemBindCharName.Lock;
  try
    GridItemBindCharName.RowCount:=g_ItemBindCharName.Count + 1;
    for I := 0 to g_ItemBindCharName.Count - 1 do begin
      ItemBind:=g_ItemBindCharName.Items[I];
      if ItemBind <> nil then begin
        GridItemBindCharName.Cells[0,I + 1]:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
        GridItemBindCharName.Cells[1,I + 1]:=IntToStr(ItemBind.nItemIdx);
        GridItemBindCharName.Cells[2,I + 1]:=IntToStr(ItemBind.nMakeIdex);
        GridItemBindCharName.Cells[3,I + 1]:=ItemBind.sBindName;
      end;
    end;
  finally
    g_ItemBindCharName.UnLock;
  end;
end;

procedure TfrmViewList.GridItemBindCharNameClick(Sender: TObject);
var
  nIndex:Integer;
  ItemBind:pTItemBind;
begin

  nIndex:=GridItemBindCharName.Row - 1;
  if nIndex < 0 then exit;

  g_ItemBindCharName.Lock;
  try
    if nIndex >= g_ItemBindCharName.Count then exit;
    ItemBind:=pTItemBind(g_ItemBindCharName.Items[nIndex]);
    EditItemBindCharNameItemName.Text:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
    EditItemBindCharNameItemIdx.Value:=ItemBind.nItemIdx;
    EditItemBindCharNameItemMakeIdx.Value:=ItemBind.nMakeIdex;
    EditItemBindCharNameName.Text:=ItemBind.sBindName;
  finally
    g_ItemBindCharName.UnLock;
  end;
  ButtonItemBindCharNameDel.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindCharNameItemIdxChange(Sender: TObject);
begin
  if EditItemBindCharNameItemIdx.Text = '' then begin
    EditItemBindCharNameItemIdx.Text:='0';
    exit;
  end;
  EditItemBindCharNameItemName.Text:=UserEngine.GetStdItemName(EditItemBindCharNameItemIdx.Value);
  ButtonItemBindCharNameMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindCharNameItemMakeIdxChange(
  Sender: TObject);
begin
  if EditItemBindCharNameItemMakeIdx.Text = '' then begin
    EditItemBindCharNameItemMakeIdx.Text:='0';
    exit;
  end;
  ButtonItemBindCharNameMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindCharNameNameChange(Sender: TObject);
begin
  ButtonItemBindCharNameMod.Enabled:=True;
end;

procedure TfrmViewList.ButtonItemBindCharNameAddClick(Sender: TObject);
var
  I:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin
  nItemIdx:=EditItemBindCharNameItemIdx.Value;
  nMakeIdex:=EditItemBindCharNameItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindCharNameName.Text);

  if (nItemIdx <= 0) or (nMakeIdex < 0) or (sBindName = '') then begin
    Application.MessageBox('输入的信息不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    exit;
  end;

  g_ItemBindCharName.Lock;
  try
    for I := 0 to g_ItemBindCharName.Count - 1 do begin
      ItemBind:=g_ItemBindCharName.Items[I];
      if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
        Application.MessageBox('此物品已经绑定到其他的角色上了！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(ItemBind);
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
    g_ItemBindCharName.Insert(0,ItemBind);
  finally
    g_ItemBindCharName.UnLock;
  end;
  SaveItemBindCharName();
  RefItemBindCharName();
end;

procedure TfrmViewList.ButtonItemBindCharNameModClick(Sender: TObject);
var
  nSelIndex:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin

  nItemIdx:=EditItemBindCharNameItemIdx.Value;
  nMakeIdex:=EditItemBindCharNameItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindCharNameName.Text);
  nSelIndex:=GridItemBindCharName.Row -1;
  if nSelIndex < 0 then exit;

  g_ItemBindCharName.Lock;
  try
    if nSelIndex >= g_ItemBindCharName.Count then exit;
    ItemBind:=g_ItemBindCharName.Items[nSelIndex];
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
  finally
    g_ItemBindCharName.UnLock;
  end;

  SaveItemBindCharName();
  RefItemBindCharName();
  
end;

procedure TfrmViewList.ButtonItemBindCharNameDelClick(Sender: TObject);
var
  ItemBind:pTItemBind;
  nSelIndex:Integer;
begin

  nSelIndex:=GridItemBindCharName.Row -1;
  if nSelIndex < 0 then exit;
  g_ItemBindCharName.Lock;
  try
    if nSelIndex >= g_ItemBindCharName.Count then exit;
    ItemBind:=g_ItemBindCharName.Items[nSelIndex];
    Dispose(ItemBind);
    g_ItemBindCharName.Delete(nSelIndex);
  finally
    g_ItemBindCharName.UnLock;
  end;
  SaveItemBindCharName();
  RefItemBindCharName();
end;

procedure TfrmViewList.ButtonItemBindCharNameRefClick(Sender: TObject);
begin
  RefItemBindCharName();
end;


procedure TfrmViewList.RefItemBindIPaddr;
var
  I:Integer;
  ItemBind:pTItemBind;
begin
  GridItemBindIPaddr.RowCount:=2;
  GridItemBindIPaddr.Cells[0,1]:='';
  GridItemBindIPaddr.Cells[1,1]:='';
  GridItemBindIPaddr.Cells[2,1]:='';
  GridItemBindIPaddr.Cells[3,1]:='';
  ButtonItemBindIPaddrMod.Enabled:=False;
  ButtonItemBindIPaddrDel.Enabled:=False;
  g_ItemBindIPaddr.Lock;
  try
    GridItemBindIPaddr.RowCount:=g_ItemBindIPaddr.Count + 1;
    for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
      ItemBind:=g_ItemBindIPaddr.Items[I];
      if ItemBind <> nil then begin
        GridItemBindIPaddr.Cells[0,I + 1]:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
        GridItemBindIPaddr.Cells[1,I + 1]:=IntToStr(ItemBind.nItemIdx);
        GridItemBindIPaddr.Cells[2,I + 1]:=IntToStr(ItemBind.nMakeIdex);
        GridItemBindIPaddr.Cells[3,I + 1]:=ItemBind.sBindName;
      end;
    end;
  finally
    g_ItemBindIPaddr.UnLock;
  end;
end;
procedure TfrmViewList.GridItemBindIPaddrClick(Sender: TObject);
var
  nIndex:Integer;
  ItemBind:pTItemBind;
begin

  nIndex:=GridItemBindIPaddr.Row - 1;
  if nIndex < 0 then exit;

  g_ItemBindIPaddr.Lock;
  try
    if nIndex >= g_ItemBindIPaddr.Count then exit;
    ItemBind:=pTItemBind(g_ItemBindIPaddr.Items[nIndex]);
    EditItemBindIPaddrItemName.Text:=UserEngine.GetStdItemName(ItemBind.nItemIdx);
    EditItemBindIPaddrItemIdx.Value:=ItemBind.nItemIdx;
    EditItemBindIPaddrItemMakeIdx.Value:=ItemBind.nMakeIdex;
    EditItemBindIPaddrName.Text:=ItemBind.sBindName;
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  ButtonItemBindIPaddrDel.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindIPaddrItemIdxChange(Sender: TObject);
begin
  if EditItemBindIPaddrItemIdx.Text = '' then begin
    EditItemBindIPaddrItemIdx.Text:='0';
    exit;
  end;
  EditItemBindIPaddrItemName.Text:=UserEngine.GetStdItemName(EditItemBindIPaddrItemIdx.Value);
  ButtonItemBindIPaddrMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindIPaddrItemMakeIdxChange(
  Sender: TObject);
begin
  if EditItemBindIPaddrItemMakeIdx.Text = '' then begin
    EditItemBindIPaddrItemMakeIdx.Text:='0';
    exit;
  end;
  ButtonItemBindIPaddrMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemBindIPaddrNameChange(Sender: TObject);
begin
  ButtonItemBindIPaddrMod.Enabled:=True;
end;

procedure TfrmViewList.ButtonItemBindIPaddrAddClick(Sender: TObject);
var
  I:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin
  nItemIdx:=EditItemBindIPaddrItemIdx.Value;
  nMakeIdex:=EditItemBindIPaddrItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindIPaddrName.Text);

  if not IsIPaddr(sBindName) then begin
    Application.MessageBox('IP地址格式输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditItemBindIPaddrName.SetFocus;
    exit;
  end;


  if (nItemIdx <= 0) or (nMakeIdex < 0) then begin
    Application.MessageBox('输入的信息不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    exit;
  end;

  g_ItemBindIPaddr.Lock;
  try
    for I := 0 to g_ItemBindIPaddr.Count - 1 do begin
      ItemBind:=g_ItemBindIPaddr.Items[I];
      if (ItemBind.nItemIdx = nItemIdx) and (ItemBind.nMakeIdex = nMakeIdex) then begin
        Application.MessageBox('此物品已经绑定到其他的IP地址上了！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(ItemBind);
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
    g_ItemBindIPaddr.Insert(0,ItemBind);
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  SaveItemBindIPaddr();
  RefItemBindIPaddr();
end;

procedure TfrmViewList.ButtonItemBindIPaddrModClick(Sender: TObject);
var
  nSelIndex:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sBindName:String;
  ItemBind:pTItemBind;
begin

  nItemIdx:=EditItemBindIPaddrItemIdx.Value;
  nMakeIdex:=EditItemBindIPaddrItemMakeIdx.Value;
  sBindName:=Trim(EditItemBindIPaddrName.Text);
  if not IsIPaddr(sBindName) then begin
    Application.MessageBox('IP地址格式输入不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    EditItemBindIPaddrName.SetFocus;
    exit;
  end;
  nSelIndex:=GridItemBindIPaddr.Row -1;
  if nSelIndex < 0 then exit;

  g_ItemBindIPaddr.Lock;
  try
    if nSelIndex >= g_ItemBindIPaddr.Count then exit;
    ItemBind:=g_ItemBindIPaddr.Items[nSelIndex];
    ItemBind.nItemIdx:=nItemIdx;
    ItemBind.nMakeIdex:=nMakeIdex;
    ItemBind.sBindName:=sBindName;
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  SaveItemBindIPaddr();
  RefItemBindIPaddr();
end;

procedure TfrmViewList.ButtonItemBindIPaddrDelClick(Sender: TObject);
var
  ItemBind:pTItemBind;
  nSelIndex:Integer;
begin

  nSelIndex:=GridItemBindIPaddr.Row -1;
  if nSelIndex < 0 then exit;
  g_ItemBindIPaddr.Lock;
  try
    if nSelIndex >= g_ItemBindIPaddr.Count then exit;
    ItemBind:=g_ItemBindIPaddr.Items[nSelIndex];
    Dispose(ItemBind);
    g_ItemBindIPaddr.Delete(nSelIndex);
  finally
    g_ItemBindIPaddr.UnLock;
  end;
  SaveItemBindIPaddr();
  RefItemBindIPaddr();
end;

procedure TfrmViewList.ButtonItemBindIPaddrRefClick(Sender: TObject);
begin
  RefItemBindIPaddr();
end;

procedure TfrmViewList.RefItemCustomNameList;
var
  I:Integer;
  ItemName:pTItemName;
begin
//  GridItemNameList.RowCount:=2;
  GridItemNameList.Cells[0,1]:='';
  GridItemNameList.Cells[1,1]:='';
  GridItemNameList.Cells[2,1]:='';

  ButtonItemNameMod.Enabled:=False;
  ButtonItemNameDel.Enabled:=False;
  ItemUnit.m_ItemNameList.Lock;
  try
    GridItemNameList.RowCount:=ItemUnit.m_ItemNameList.Count + 1;
    for I := 0 to ItemUnit.m_ItemNameList.Count - 1 do begin
      ItemName:=ItemUnit.m_ItemNameList.Items[I];
      if ItemName <> nil then begin
        GridItemNameList.Cells[0,I + 1]:=UserEngine.GetStdItemName(ItemName.nItemIndex);
        GridItemNameList.Cells[1,I + 1]:=IntToStr(ItemName.nMakeIndex);
        GridItemNameList.Cells[2,I + 1]:=ItemName.sItemName;
      end;
    end;
  finally
    ItemUnit.m_ItemNameList.UnLock;
  end;
end;

procedure TfrmViewList.RefSetItems;
var
  I, k: Integer;
  Item: TListItem;
  SetItems: pTSetItems;
  sAddStr: string;
begin
  ListViewSuit.Items.Clear;
  for I := 0 to g_SetItemsList.Count - 1 do begin
    SetItems := pTSetItems(g_SetItemsList[I]);
    Item := ListViewSuit.Items.Add;
    Item.Caption := SetItems.sHint;
    sAddStr := '';
    for k := Low(SetItems.Items) to High(SetItems.Items) do
      if SetItems.Items[k] <> '' then sAddStr := sAddStr + SetItems.Items[k] + ',';
    Item.SubItems.Add(sAddStr);

    sAddStr := '';
    for k := Low(SetItems.Value) to High(SetItems.Value) do
      if SetItems.Value[k] > 0 then sAddStr := sAddStr + IntToStr(k) + '.' + IntToStr(SetItems.Value[k]) + ',';
    Item.SubItems.Add(sAddStr);

    Item.SubItems.Add(BoolToStr(SetItems.HideValue));
  end;
end;

procedure TfrmViewList.GridItemNameListClick(Sender: TObject);
var
  nIndex:Integer;
  ItemName:pTItemName;
begin
  nIndex:=GridItemNameList.Row - 1;
  if nIndex < 0 then exit;

  ItemUnit.m_ItemNameList.Lock;
  try
    if nIndex >= ItemUnit.m_ItemNameList.Count then exit;
    ItemName:=pTItemName(ItemUnit.m_ItemNameList.Items[nIndex]);
    EditItemNameOldName.Text:=UserEngine.GetStdItemName(ItemName.nItemIndex);
    EditItemNameIdx.Value:=ItemName.nItemIndex;
    EditItemNameMakeIndex.Value:=ItemName.nMakeIndex;
    EditItemNameNewName.Text:=ItemName.sItemName;
  finally
    ItemUnit.m_ItemNameList.UnLock;
  end;
  ButtonItemNameDel.Enabled:=True;
end;

procedure TfrmViewList.EditItemNameIdxChange(Sender: TObject);
begin
  EditItemNameOldName.Text:=UserEngine.GetStdItemName(EditItemNameIdx.Value);
  ButtonItemNameMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemNameMakeIndexChange(Sender: TObject);
begin
  ButtonItemNameMod.Enabled:=True;
end;

procedure TfrmViewList.EditItemNameNewNameChange(Sender: TObject);
begin
  ButtonItemNameMod.Enabled:=True;
end;

procedure TfrmViewList.ButtonItemNameAddClick(Sender: TObject);
var
  I:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sNewName:String;
  ItemName:pTItemName;
begin
  nItemIdx:=EditItemNameIdx.Value;
  nMakeIdex:=EditItemNameMakeIndex.Value;
  sNewName:=Trim(EditItemNameNewName.Text);

  if (nItemIdx <= 0) or (nMakeIdex < 0) or (sNewName = '') then begin
    Application.MessageBox('输入的信息不正确！！！','提示信息',MB_OK + MB_ICONERROR);
    exit;
  end;

  ItemUnit.m_ItemNameList.Lock;
  try
    for I := 0 to ItemUnit.m_ItemNameList.Count - 1 do begin
      ItemName:=ItemUnit.m_ItemNameList.Items[I];
      if (ItemName.nItemIndex = nItemIdx) and (ItemName.nMakeIndex = nMakeIdex) then begin
        Application.MessageBox('此物品已经自定义过名称了！！！','提示信息',MB_OK + MB_ICONERROR);
        exit;
      end;
    end;
    New(ItemName);
    ItemName.nItemIndex:=nItemIdx;
    ItemName.nMakeIndex:=nMakeIdex;
    ItemName.sItemName:=sNewName;
    ItemUnit.m_ItemNameList.Insert(0,ItemName);
  finally
    ItemUnit.m_ItemNameList.UnLock;
  end;
  ItemUnit.SaveCustomItemName();
  RefItemCustomNameList();
end;

procedure TfrmViewList.ButtonItemNameModClick(Sender: TObject);
var
  nSelIndex:Integer;
  nMakeIdex:Integer;
  nItemIdx :Integer;
  sNewName:String;
  ItemName:pTItemName;
begin
  nItemIdx:=EditItemNameIdx.Value;
  nMakeIdex:=EditItemNameMakeIndex.Value;
  sNewName:=Trim(EditItemNameNewName.Text);
  nSelIndex:=GridItemNameList.Row -1;
  if nSelIndex < 0 then exit;
  ItemUnit.m_ItemNameList.Lock;
  try
    if nSelIndex >= ItemUnit.m_ItemNameList.Count then exit;
    ItemName:=ItemUnit.m_ItemNameList.Items[nSelIndex];
    ItemName.nItemIndex:=nItemIdx;
    ItemName.nMakeIndex:=nMakeIdex;
    ItemName.sItemName:=sNewName;
  finally
    ItemUnit.m_ItemNameList.UnLock;
  end;
  ItemUnit.SaveCustomItemName();
  RefItemCustomNameList();
end;

procedure TfrmViewList.ButtonItemNameDelClick(Sender: TObject);
var
  ItemName:pTItemName;
  nSelIndex:Integer;
begin

  nSelIndex:=GridItemNameList.Row -1;
  if nSelIndex < 0 then exit;
  ItemUnit.m_ItemNameList.Lock;
  try
    if nSelIndex >= ItemUnit.m_ItemNameList.Count then exit;
    ItemName:=ItemUnit.m_ItemNameList.Items[nSelIndex];
    Dispose(ItemName);
    ItemUnit.m_ItemNameList.Delete(nSelIndex);
  finally
    ItemUnit.m_ItemNameList.UnLock;
  end;
  ItemUnit.SaveCustomItemName();
  RefItemCustomNameList();
end;


procedure TfrmViewList.ButtonItemNameRefClick(Sender: TObject);
begin
  RefItemCustomNameList();
end;

procedure TfrmViewList.PopupMenu1Popup(Sender: TObject);
begin
  A1.Enabled := ListBoxSetItems.SelCount > 0;
end;

procedure TfrmViewList.ListBoxSetItemsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  sIPaddr: string;
  I, nIdx: Integer;
begin
  if (ssCtrl in Shift) and (Key = word('F')) then begin
    sIPaddr := InputBox('八祸', '涝仿窍技夸.', '');
    nIdx := TListBox(Sender).ItemIndex + 1;
    if nIdx >= TListBox(Sender).Count then
      nIdx := 0;
    for I := nIdx to TListBox(Sender).Count - 1 do begin
      if CompareLStr(TListBox(Sender).Items.Strings[I], sIPaddr, Length(sIPAddr)) then begin
        TListBox(Sender).Selected[I] := True;
        break;
      end;
    end;
  end;
end;



{---- Adjust global SVN revision ----}
procedure TfrmViewList.ListViewSuitClick(Sender: TObject);
  function GetEdit(nTag: Integer): TEdit;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to GroupBox25.ControlCount - 1 do begin
      if GroupBox25.Controls[I] is TEdit then
        if TEdit(GroupBox25.Controls[I]).Tag = nTag then begin
          Result := TEdit(GroupBox25.Controls[I]);
          Break;
        end;
    end;
  end;
var
  sStr, sItemStr, sTagStr: string;
  TempList: TStringList;
  I, k: Integer;
  Control: TControl;
  boAdd: Boolean;
  Item: TListItem;
  StdItem: TItem;
  btWhere: Integer;
  Edit: TEdit;
begin
  Item := ListViewSuit.Selected;
  if Item <> nil then begin
    Button2.Enabled := True;
    Button3.Enabled := True;
    Edit1.Text := Item.Caption;
    sStr := Item.SubItems[0];
    for I := 0 to GroupBox25.ControlCount - 1 do begin
      if (GroupBox25.Controls[I] is TEdit) then begin
        TEdit(GroupBox25.Controls[I]).Text := '';
      end;
    end;
    while True do begin
      if sStr = '' then break;
      sStr := GetValidStr3(sStr, sItemStr, [',']);
      if sItemStr = '' then break;
      I := ListBoxSetItems.Items.IndexOf(sItemStr);
      if I > -1 then begin
        StdItem := TItem(ListBoxSetItems.Items.Objects[I]);
        if StdItem.StdMode in [5,6,90,99,12,10,11,15,19,20,21,22,23,24,26,62,63,64] then begin
          btWhere := GetTakeOnPosition(StdItem.StdMode);
          if btWhere in [Low(THumanUseItems)..High(THumanUseItems)] then begin
            if (btWhere = U_DRESS) and (StdItem.StdMode = 11) then
              btWhere := U_BUJUK;
            if (btWhere = U_RINGL) then begin
              Edit := GetEdit(U_RINGL);
              if (Edit <> nil) and (Edit.Text <> '') then
                btWhere := U_RINGR;
            end;

            if (btWhere = U_ARMRINGL) then begin
              Edit := GetEdit(U_ARMRINGL);
              if (Edit <> nil) and (Edit.Text <> '') then
                btWhere := U_ARMRINGR;
            end;

            Edit := GetEdit(btWhere);
            if (Edit <> nil) then
              Edit.Text := ListBoxSetItems.Items[I];
            Button1.Enabled := True;
          end;
        end;
      end;
      //ListBox3.Items.Add(sItemStr);
    end;
    TempList := TStringList.Create;
    sStr := Item.SubItems[1];
    while True do begin
      if sStr = '' then break;
      sStr := GetValidStr3(sStr, sItemStr, [',']);
      if sItemStr = '' then break;
      sItemStr := GetValidStr3(sItemStr, sTagStr, ['.']);
      if sItemStr = '' then break;
      TempList.AddObject(sItemStr, TObject(StrToIntDef(sTagStr, -1)));
    end;
    for I := 0 to GroupBox24.ControlCount - 1 do begin
      Control := GroupBox24.Controls[I];
      if Control is TSpinEdit then begin
        boAdd := False;
        for K := 0 to TempList.Count - 1 do begin
          if TSpinEdit(Control).Tag = Integer(TempList.Objects[k]) then begin
            TSpinEdit(Control).Value := StrToIntDef(TempList[k], 0);
            boAdd := True;
            Break;
          end;
        end;
        if not boAdd then TSpinEdit(Control).Value := 0;
      end;
    end;
    TempList.Free;
    CheckBox2.Checked := StrToBoolDef(Item.SubItems[2], False);
  end else begin
    for I := 0 to GroupBox25.ControlCount - 1 do begin
      if (GroupBox25.Controls[I] is TEdit) then begin
        TEdit(GroupBox25.Controls[I]).Text := '';
      end;
    end;
    Edit1.Text := '';
    for I := 0 to GroupBox24.ControlCount - 1 do begin
      Control := GroupBox24.Controls[I];
      if Control is TSpinEdit then begin
        TSpinEdit(Control).Value := 0;
      end;
    end;
  end;
end;

procedure TfrmViewList.A1Click(Sender: TObject);
  function GetEdit(nTag: Integer): TEdit;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to GroupBox25.ControlCount - 1 do begin
      if GroupBox25.Controls[I] is TEdit then
        if TEdit(GroupBox25.Controls[I]).Tag = nTag then begin
          Result := TEdit(GroupBox25.Controls[I]);
          Break;
        end;
    end;
  end;

var
  I: Integer;
  StdItem: TItem;
  btWhere: Integer;
  Edit: TEdit;
begin
  for I := 0 to ListBoxSetItems.Count - 1 do begin
    if ListBoxSetItems.Selected[I] then begin
      StdItem := TItem(ListBoxSetItems.Items.Objects[I]);
      if StdItem.StdMode in [5,6,90,99,12,10,11,15,19,20,21,22,23,24,26,62,63,64] then begin
        btWhere := GetTakeOnPosition(StdItem.StdMode);
        if btWhere in [Low(THumanUseItems)..High(THumanUseItems)] then begin
          if (btWhere = U_DRESS) and (StdItem.StdMode = 11) then
            btWhere := U_BUJUK;
          if (btWhere = U_RINGL) then begin
            Edit := GetEdit(U_RINGL);
            if (Edit <> nil) and (Edit.Text <> '') then
              btWhere := U_RINGR;
          end;

          if (btWhere = U_ARMRINGL) then begin
            Edit := GetEdit(U_ARMRINGL);
            if (Edit <> nil) and (Edit.Text <> '') then
              btWhere := U_ARMRINGR;
          end;

          Edit := GetEdit(btWhere);
          if (Edit <> nil) then
            Edit.Text := ListBoxSetItems.Items[I];
          Button1.Enabled := True;
        end;
      end;
    end;
  end;
end;

procedure TfrmViewList.EditHPChange(Sender: TObject);
begin
  with Sender as TSpinEdit do begin
    if Value > 0 then Color := clLime
    else Color := clWhite;
  end;
end;

procedure TfrmViewList.Button1Click(Sender: TObject);
var
  sTempStr, sTempStr2: string;
  I: Integer;
  Item: TListItem;
  Control: TControl;
  nCount: Integer;
begin
  sTempStr := '';
  nCount := 0;
  for I := 0 to GroupBox25.ControlCount - 1 do begin
    if (GroupBox25.Controls[I] is TEdit) and (Trim(TEdit(GroupBox25.Controls[I]).Text) <> '') then begin
      if ListBoxSetItems.Items.IndexOf(Trim(TEdit(GroupBox25.Controls[I]).Text)) = -1 then begin
        Application.MessageBox(PChar(Trim(TEdit(GroupBox25.Controls[I]).Text) + ' 物品名称设置错误！'), '提示信息', MB_OK + MB_ICONERROR);
        Exit;
      end;
      sTempStr := sTempStr + Trim(TEdit(GroupBox25.Controls[I]).Text) + ',';
      Inc(nCount);
    end;
  end;
  if nCount < 1 then begin
    Application.MessageBox('至少需要指定一件装备才能组成套装！', '提示信息', MB_OK + MB_ICONERROR);
    Exit;
  end;
  for I := 0 to ListViewSuit.Items.Count - 1 do begin
    Item := ListViewSuit.Items[I];
    if CompareText(Item.SubItems[0], sTempStr) = 0 then begin
      Application.MessageBox('已经存在相同的套装装备配置！', '提示信息', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  sTempStr2 := '';
  for I := 0 to GroupBox24.ControlCount - 1 do begin
    Control := GroupBox24.Controls[I];
    if Control is TSpinEdit then begin
      if TSpinEdit(Control).Value > 0 then
        sTempStr2 := sTempStr2 + IntToStr(TSpinEdit(Control).Tag) + '.' + TSpinEdit(Control).Text + ',';
    end;
  end;
  if sTempStr2 = '' then begin
    Application.MessageBox('至少需要设置一种套装属性！', '提示信息', MB_OK + MB_ICONERROR);
    Exit;
  end;
  Item := ListViewSuit.Items.Add;
  Item.Caption := Edit1.Text;
  Item.SubItems.Add(sTempStr);
  Item.SubItems.Add(sTempStr2);
  Item.SubItems.Add(BoolToStr(CheckBox2.Checked));
  Button1.Enabled := False;
  Button2.Enabled := False;
  Button3.Enabled := False;
  Button4.Enabled := True;
  for I := 0 to GroupBox25.ControlCount - 1 do begin
    if (GroupBox25.Controls[I] is TEdit) then begin
      TEdit(GroupBox25.Controls[I]).Text := '';
    end;
  end;
  Edit1.Text := '';
  for I := 0 to GroupBox24.ControlCount - 1 do begin
    Control := GroupBox24.Controls[I];
    if Control is TSpinEdit then begin
      TSpinEdit(Control).Value := 0;
    end;
  end;
end;

procedure TfrmViewList.Button2Click(Sender: TObject);
var
  sTempStr, sTempStr2: string;
  I: Integer;
  Item: TListItem;
  Control: TControl;
  nCount: Integer;
begin
  if ListViewSuit.ItemIndex = -1 then begin
    Application.MessageBox('技飘酒捞袍 格废阑 急琶秦林技夸.', '坷幅', MB_OK + MB_ICONERROR);
    Exit;
  end;

  sTempStr := '';
  nCount := 0;
  for I := 0 to GroupBox25.ControlCount - 1 do begin
    if (GroupBox25.Controls[I] is TEdit) and (Trim(TEdit(GroupBox25.Controls[I]).Text) <> '') then begin
      if ListBoxSetItems.Items.IndexOf(Trim(TEdit(GroupBox25.Controls[I]).Text)) = -1 then begin
        Application.MessageBox(PChar(Trim(TEdit(GroupBox25.Controls[I]).Text) + ' 物品名称设置错误！'), '提示信息', MB_OK + MB_ICONERROR);
        Exit;
      end;
      sTempStr := sTempStr + Trim(TEdit(GroupBox25.Controls[I]).Text) + ',';
      Inc(nCount);
    end;
  end;
  if nCount < 1 then begin
    Application.MessageBox('至少需要指定一件装备才能组成套装！', '提示信息', MB_OK + MB_ICONERROR);
    Exit;
  end;

  for I := 0 to ListViewSuit.Items.Count - 1 do begin
    if I = ListViewSuit.ItemIndex then Continue;
    Item := ListViewSuit.Items[I];
    if CompareText(Item.SubItems[0], sTempStr) = 0 then begin
      Application.MessageBox('已经存在相同的套装装备配置！', '提示信息', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end;
  sTempStr2 := '';
  for I := 0 to GroupBox24.ControlCount - 1 do begin
    Control := GroupBox24.Controls[I];
    if Control is TSpinEdit then begin
      if TSpinEdit(Control).Value > 0 then
        sTempStr2 := sTempStr2 + IntToStr(TSpinEdit(Control).Tag) + '.' + TSpinEdit(Control).Text + ',';
    end;
  end;
  if sTempStr2 = '' then begin
    Application.MessageBox('至少需要设置一种套装属性！', '提示信息', MB_OK + MB_ICONERROR);
    Exit;
  end;
  Item := ListViewSuit.Items[ListViewSuit.ItemIndex];
  Item.Caption := Edit1.Text;
  Item.SubItems[0] := sTempStr;
  Item.SubItems[1] := sTempStr2;
  Item.SubItems[2] := BoolToStr(CheckBox2.Checked);
  Button2.Enabled := False;
  Button4.Enabled := True;
end;

procedure TfrmViewList.Button3Click(Sender: TObject);
var
  I: Integer;
  Control: TControl;
begin
  if ListViewSuit.ItemIndex = -1 then begin
    Application.MessageBox('技飘酒捞袍 格废阑 急琶窍技夸.', '坷幅', MB_OK + MB_ICONERROR);
    Exit;
  end;
  ListViewSuit.Items.Delete(ListViewSuit.ItemIndex);
  Button3.Enabled := False;
  Button2.Enabled := False;
  Button4.Enabled := True;
  for I := 0 to GroupBox25.ControlCount - 1 do begin
    if (GroupBox25.Controls[I] is TEdit) then begin
      TEdit(GroupBox25.Controls[I]).Text := '';
    end;
  end;
  Edit1.Text := '';
  for I := 0 to GroupBox24.ControlCount - 1 do begin
    Control := GroupBox24.Controls[I];
    if Control is TSpinEdit then begin
      TSpinEdit(Control).Value := 0;
    end;
  end;
end;

procedure TfrmViewList.Button4Click(Sender: TObject);
var
  SaveList: TStringList;
  I: Integer;
  Item: TListItem;
begin
  SaveList := TStringList.Create;
  Try
    for I := 0 to ListViewSuit.Items.Count - 1 do begin
      Item := ListViewSuit.Items[I];
      SaveList.Add(Item.SubItems[0] + #9 + Item.SubItems[1] + #9 + '"' + Item.Caption + '"' + #9 + Item.SubItems[2]);
    end;
    SaveList.SaveToFile(g_Config.sEnvirDir + 'SetItems.txt');
  Finally
    SaveList.Free;
  End;
  FrmDB.LoadItemsDB();
  //RefLoadItems();
  uModValue();
end;

procedure TfrmViewList.ListBoxSetItemsDblClick(Sender: TObject);
begin
  A1Click(nil);
end;

procedure TfrmViewList.DropDateSpinChange(Sender: TObject);
begin
  if DropDateSpin.Text = '' then begin
    DropDateSpin.Text:='0';
    exit;
  end;
end;

initialization
  //SVNRevision('$Id: ViewList.pas 404 2006-09-09 17:59:18Z damian $');
end.
