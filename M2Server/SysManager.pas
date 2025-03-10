unit SysManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Menus;

type
  TfrmSysManager = class(TForm)
    PanelStatus: TPanel;
    ListView: TListView;
    PopupMenu: TPopupMenu;
    PopupMenu_Ref: TMenuItem;
    PopupMenu_ShowHum: TMenuItem;
    PopupMenu_ShowMon: TMenuItem;
    PopupMenu_ShowNpc: TMenuItem;
    PopupMenu_: TMenuItem;
    PopupMenu_AutoRef: TMenuItem;
    PopupMenu__: TMenuItem;
    PopupMenu_MonGen: TMenuItem;
    PopupMenu_RunHum: TMenuItem;

    Timer: TTimer;
    StatusBar: TStatusBar;
    PopupMenu_1: TMenuItem;
    PopupMenu_ClearMon: TMenuItem;
    PopupMenu_2: TMenuItem;
    PopupMenu_IncMob: TMenuItem;
    PopupMenu_DecMob: TMenuItem;
    PopupMenu_AllIncMob: TMenuItem;
    PopupMenu_AllDecMob: TMenuItem;
    PopupMenu_3: TMenuItem;
    PopupMenu_IncMobZen: TMenuItem;
    PopupMenu_DecMobZen: TMenuItem;
    PopupMenu_IncAllMobZen: TMenuItem;
    PopupMenu_DecAllMobZen: TMenuItem;
    PopupMenu_4: TMenuItem;
    PopupMenu_IMobZen: TMenuItem;
    PopupMenu_DMobZen: TMenuItem;
    procedure PopupMenu_RefClick(Sender: TObject);
    procedure PopupMenu_ShowHumClick(Sender: TObject);
    procedure PopupMenu_AutoRefClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure PopupMenu_ShowMonClick(Sender: TObject);
    procedure PopupMenu_ShowNpcClick(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure PopupMenu_MonGenClick(Sender: TObject);
    procedure PopupMenu_ClearMonClick(Sender: TObject);
    procedure PopupMenu_IncMobClick(Sender: TObject);
    procedure PopupMenu_AllIncMobClick(Sender: TObject);
    procedure PopupMenu_IncMobZenClick(Sender: TObject);
    procedure PopupMenu_IncAllMobZenClick(Sender: TObject);
    procedure PopupMenu_IMobZenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefListViewSession;
    procedure RefStatus;
    procedure Open();
  end;

var
  frmSysManager: TfrmSysManager;

implementation
uses HUtil32, M2Share, ObjBase, Envir, UsrEngn, ViewOnlineHuman, ViewOnlineHumanView,
  ConfigMonGen, ConfigMonGenView, ConfigMerchant, ConfigMerchantView;
{$R *.dfm}

procedure TfrmSysManager.RefListViewSession;
var
  I: Integer;
  Envirnoment: TEnvirnoment;
  ListItem: TListItem;
begin
  PanelStatus.Caption := '导入完成...';
  ListView.Visible := False;
  ListView.Items.Clear;
  for I := 0 to g_MapManager.Count - 1 do begin
    Envirnoment := TEnvirnoment(g_MapManager.Items[I]);
    ListItem := ListView.Items.Add;
    ListItem.Caption := Envirnoment.sMapName;
    ListItem.SubItems.AddObject(Envirnoment.sMapDesc, Envirnoment);
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nHumCount));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nHeroCount));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nMonCount));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nNpcCount));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nItemCount));

    ListItem.SubItems.Add(BooleanToStr(Envirnoment.m_boMonGen));
    ListItem.SubItems.Add(BooleanToStr(Envirnoment.m_boHumGen));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nMobZenDelay));
    ListItem.SubItems.Add(IntToStr(Envirnoment.m_nMobZenRate));

  end;
  ListView.Visible := True;
  RefStatus;
end;

procedure TfrmSysManager.RefStatus;
begin
  StatusBar.Panels[0].Text := '数量：' + IntToStr(g_MapManager.Count);
  StatusBar.Panels[1].Text := '人数：' + IntToStr(g_MapManager.m_nHumCount);
  StatusBar.Panels[2].Text := '英雄：' + IntToStr(g_MapManager.m_nHeroCount);
  StatusBar.Panels[3].Text := '怪物：' + IntToStr(g_MapManager.m_nMonCount);
  StatusBar.Panels[4].Text := 'NPC：' + IntToStr(g_MapManager.m_nNpcCount);
  StatusBar.Panels[5].Text := '物品：' + IntToStr(g_MapManager.m_nItemCount);
  StatusBar.Panels[6].Text := '刷怪数量：' + IntToStr(g_Config.nMobGenCount);
end;

procedure TfrmSysManager.Open();
begin
  RefListViewSession;
  PopupMenu_AutoRef.Checked := True;
  Timer.Enabled := PopupMenu_AutoRef.Checked;
  ShowModal;
end;

procedure TfrmSysManager.PopupMenu_RefClick(Sender: TObject);
begin
  RefListViewSession;
end;

procedure TfrmSysManager.PopupMenu_ShowHumClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    frmViewOnlineHumanView := TfrmViewOnlineHumanView.Create(Owner);
    frmViewOnlineHumanView.Top := Self.Top + 20;
    frmViewOnlineHumanView.Left := Self.Left;
    frmViewOnlineHumanView.Open(Envirnoment);
    frmViewOnlineHumanView.Free;
  end;
end;

procedure TfrmSysManager.PopupMenu_AutoRefClick(Sender: TObject);
begin
  PopupMenu_AutoRef.Checked := not PopupMenu_AutoRef.Checked;
  Timer.Enabled := PopupMenu_AutoRef.Checked;
end;

procedure TfrmSysManager.TimerTimer(Sender: TObject);
var
  I: Integer;
  Envirnoment: TEnvirnoment;
  ListItem: TListItem;
begin
  for I := 0 to ListView.Items.Count - 1 do begin
    ListItem := ListView.Items.Item[I];
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Str_ToInt(ListItem.SubItems.Strings[1], 0) <> Envirnoment.m_nHumCount then
      ListItem.SubItems.Strings[1] := IntToStr(Envirnoment.m_nHumCount);

    if Str_ToInt(ListItem.SubItems.Strings[2], 0) <> Envirnoment.m_nHeroCount then
      ListItem.SubItems.Strings[2] := IntToStr(Envirnoment.m_nHeroCount);

    if Str_ToInt(ListItem.SubItems.Strings[3], 0) <> Envirnoment.m_nMonCount then
      ListItem.SubItems.Strings[3] := IntToStr(Envirnoment.m_nMonCount);

    if Str_ToInt(ListItem.SubItems.Strings[4], 0) <> Envirnoment.m_nNpcCount then
      ListItem.SubItems.Strings[4] := IntToStr(Envirnoment.m_nNpcCount);

    if Str_ToInt(ListItem.SubItems.Strings[5], 0) <> Envirnoment.m_nItemCount then
      ListItem.SubItems.Strings[5] := IntToStr(Envirnoment.m_nItemCount);

    if ListItem.SubItems.Strings[6] <> BooleanToStr(Envirnoment.m_boMonGen) then
      ListItem.SubItems.Strings[6] := BooleanToStr(Envirnoment.m_boMonGen);

    if ListItem.SubItems.Strings[7] <> BooleanToStr(Envirnoment.m_boHumGen) then
      ListItem.SubItems.Strings[7] := BooleanToStr(Envirnoment.m_boHumGen);

    if Str_ToInt(ListItem.SubItems.Strings[8], 0) <> Envirnoment.m_nMobZenDelay then
      ListItem.SubItems.Strings[8] := IntToStr(Envirnoment.m_nMobZenDelay);
    if Str_ToInt(ListItem.SubItems.Strings[9], 0) <> Envirnoment.m_nMobZenRate then
      ListItem.SubItems.Strings[9] := IntToStr(Envirnoment.m_nMobZenRate);

  end;
  RefStatus;
end;

procedure TfrmSysManager.PopupMenu_ShowMonClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    frmConfigMonGenView := TfrmConfigMonGenView.Create(Owner);
    frmConfigMonGenView.Top := Self.Top + 20;
    frmConfigMonGenView.Left := Self.Left;
    frmConfigMonGenView.Open(Envirnoment);
    frmConfigMonGenView.Free;
  end;
end;

procedure TfrmSysManager.PopupMenu_ShowNpcClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    frmConfigMerchantView := TfrmConfigMerchantView.Create(Owner);
    frmConfigMerchantView.Top := Self.Top + 20;
    frmConfigMerchantView.Left := Self.Left;
    frmConfigMerchantView.Open(Envirnoment);
    frmConfigMerchantView.Free;
  end;
end;

procedure TfrmSysManager.ListViewClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    PopupMenu_MonGen.Checked := Envirnoment.m_boMonGen;
    PopupMenu_RunHum.Checked := Envirnoment.m_boHumGen;
  end;
end;

procedure TfrmSysManager.PopupMenu_MonGenClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Sender = PopupMenu_MonGen then begin
      PopupMenu_MonGen.Checked := not PopupMenu_MonGen.Checked;
      Envirnoment.m_boMonGen := PopupMenu_MonGen.Checked;
    end else
      if Sender = PopupMenu_RunHum then begin
      PopupMenu_RunHum.Checked := not PopupMenu_RunHum.Checked;
      Envirnoment.m_boHumGen := PopupMenu_RunHum.Checked;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_ClearMonClick(Sender: TObject);
var
  I: Integer;
  BaseObject: TBaseObject;
  ListItem: TListItem;
  Envir: TEnvirnoment;
  MonList: TList;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envir := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Envir <> nil then begin
      MonList := TList.Create;
      UserEngine.GetMapMonster(Envir, MonList);
      for I := 0 to MonList.Count - 1 do begin
        BaseObject := TBaseObject(MonList.Items[I]);
        if BaseObject.m_Master <> nil then Continue;
        if GetNoClearMonList(BaseObject.m_sCharName) then Continue;
        BaseObject.m_boNoItem := True;
        BaseObject.MakeGhost;
      end;
      MonList.Free;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_IncMobClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Sender = PopupMenu_IncMob then begin
      Envirnoment.m_nMobZenDelay := Envirnoment.m_nMobZenDelay + 10;
    end else
    if Sender = PopupMenu_DecMob then begin
      if Envirnoment.m_nMobZenDelay >= 10 then begin
        Envirnoment.m_nMobZenDelay := Envirnoment.m_nMobZenDelay - 10;
      end;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_AllIncMobClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  for I := 0 to ListView.Items.Count - 1 do begin
    ListItem := ListView.Items.Item[I];
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Sender = PopupMenu_AllIncMob then begin
      Envirnoment.m_nMobZenDelay := Envirnoment.m_nMobZenDelay + 10;
    end else
    if Sender = PopupMenu_AllDecMob then begin
      if Envirnoment.m_nMobZenDelay >= 10 then begin
        Envirnoment.m_nMobZenDelay := Envirnoment.m_nMobZenDelay - 10;
      end;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_IncMobZenClick(Sender: TObject);
var
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  ListItem := ListView.Selected;
  if ListItem <> nil then begin
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Sender = PopupMenu_IncMobZen then begin
      Envirnoment.m_nMobZenRate := Envirnoment.m_nMobZenRate + 10;
    end else
    if Sender = PopupMenu_DecMobZen then begin
      if Envirnoment.m_nMobZenRate >= 10 then begin
        Envirnoment.m_nMobZenRate := Envirnoment.m_nMobZenRate - 10;
      end;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_IncAllMobZenClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
  Envirnoment: TEnvirnoment;
begin
  for I := 0 to ListView.Items.Count - 1 do begin
    ListItem := ListView.Items.Item[I];
    Envirnoment := TEnvirnoment(ListItem.SubItems.Objects[0]);
    if Sender = PopupMenu_IncAllMobZen then begin
      Envirnoment.m_nMobZenRate := Envirnoment.m_nMobZenRate + 10;
    end else
    if Sender = PopupMenu_DecAllMobZen then begin
      if Envirnoment.m_nMobZenRate >= 10 then begin
        Envirnoment.m_nMobZenRate := Envirnoment.m_nMobZenRate - 10;
      end;
    end;
  end;
end;

procedure TfrmSysManager.PopupMenu_IMobZenClick(Sender: TObject);
begin
  if Sender = PopupMenu_IMobZen then begin
    g_Config.nMobGenCount := g_Config.nMobGenCount + 1;
  end else
  if Sender = PopupMenu_DMobZen then begin
    if g_Config.nMobGenCount >= 1 then begin
      g_Config.nMobGenCount := g_Config.nMobGenCount - 1;
    end;
  end;
  Config.WriteInteger('Setup','MobGenCount',g_Config.nMobGenCount);
  RefStatus
end;

end.
