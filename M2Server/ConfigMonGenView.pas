unit ConfigMonGenView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Envir, Menus;

type
  TfrmConfigMonGenView = class(TForm)
    PanelStatus: TPanel;
    ListView: TListView;
    PopupMenu: TPopupMenu;
    PopupMenu_Ref: TMenuItem;
    PopupMenu_AutoRef: TMenuItem;
    PopupMenu_: TMenuItem;
    PopupMenu_Clear: TMenuItem;
    PopupMenu_ClearAll: TMenuItem;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure PopupMenu_AutoRefClick(Sender: TObject);
    procedure PopupMenu_ClearClick(Sender: TObject);
    procedure PopupMenu_ClearAllClick(Sender: TObject);
    procedure PopupMenu_RefClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefListViewSession;
  public
    procedure Open(Envir: TEnvirnoment);
    { Public declarations }
  end;

var
  frmConfigMonGenView: TfrmConfigMonGenView;
  SelEnvirnoment: TEnvirnoment;
implementation

uses HUtil32, UsrEngn, ObjBase, M2Share, Grobal2;

{$R *.dfm}

{ TfrmConfigMonGenView }

procedure TfrmConfigMonGenView.RefListViewSession;
var
  I: Integer;
  Monster: TBaseObject;
  ListItem: TListItem;
  MonList: TList;
begin
  PanelStatus.Caption := '正在加载数据中...';
  ListView.Visible := False;
  ListView.Items.Clear;
  if SelEnvirnoment <> nil then begin
    MonList := TList.Create;
    UserEngine.GetMapMonster2(SelEnvirnoment, MonList);                //包府磊矫胶袍 荐沥
    for I := 0 to MonList.Count - 1 do begin
      Monster := TBaseObject(MonList.Items[I]);
      ListItem := ListView.Items.Add;
      ListItem.Caption := IntToStr(I + 1);
      ListItem.SubItems.AddObject(Monster.m_sCharName, Monster);
      ListItem.SubItems.Add(IntToStr(Monster.m_nCurrX) + ':' + IntToStr(Monster.m_nCurrY));
      ListItem.SubItems.Add(IntToStr(Monster.m_Abil.Level));
      ListItem.SubItems.Add(IntToStr(Monster.m_Abil.HP) + '/' + IntToStr(Monster.m_Abil.MaxHP));
      ListItem.SubItems.Add(IntToStr(Monster.m_Abil.MP) + '/' + IntToStr(Monster.m_Abil.MaxMP));
      ListItem.SubItems.Add(BooleanToStr(Monster.m_boDeath));
    end;
    MonList.Free;
    Caption := SelEnvirnoment.sMapDesc + ' ' + '怪物数量:' + IntToStr(ListView.Items.Count);
  end;
  ListView.Visible := True;
end;

procedure TfrmConfigMonGenView.Open(Envir: TEnvirnoment);
var
  I: Integer;
  MonGen: pTMonGenInfo;
begin
  SelEnvirnoment := Envir;
  RefListViewSession;
  PopupMenu_AutoRef.Checked := False;
  Timer.Enabled := PopupMenu_AutoRef.Checked;
  PopupMenu_AutoRef.Enabled := False;
  ShowModal;
end;

procedure TfrmConfigMonGenView.TimerTimer(Sender: TObject);
  function FindListView(Monster: TObject): Boolean;
  var
    I: Integer;
    ListItem: TListItem;
  begin
    Result := False;
    for I := 0 to ListView.Items.Count - 1 do begin
      ListItem := ListView.Items.Item[I];
      if ListItem.SubItems.Objects[0] = Monster then begin
        Result := True;
        Break;
      end;
    end;
  end;

var
  I, II, n01: Integer;
  MonGen: pTMonGenInfo;
  Monster: TBaseObject;
  ListItem: TListItem;
  MonList: TList;
  boFind: Boolean;
  sMsg: string;
begin
  n01 := 0;
  if SelEnvirnoment <> nil then begin
    MonList := TList.Create;
    UserEngine.GetMapMonster2(SelEnvirnoment, MonList);              //包府磊矫胶袍 荐沥
    for I := 0 to MonList.Count - 1 do begin
      Monster := TBaseObject(MonList.Items[I]);
      if not FindListView(Monster) then begin
        ListItem := ListView.Items.Add;
        ListItem.Caption := IntToStr(I + 1);
        ListItem.SubItems.AddObject(Monster.m_sCharName, Monster);
        ListItem.SubItems.Add(IntToStr(Monster.m_nCurrX) + ':' + IntToStr(Monster.m_nCurrY));
        ListItem.SubItems.Add(IntToStr(Monster.m_Abil.Level));
        ListItem.SubItems.Add(IntToStr(Monster.m_Abil.HP) + '/' + IntToStr(Monster.m_Abil.MaxHP));
        ListItem.SubItems.Add(IntToStr(Monster.m_Abil.MP) + '/' + IntToStr(Monster.m_Abil.MaxMP));
        ListItem.SubItems.Add(BooleanToStr(Monster.m_boDeath));
      end;
    end;
    for I := ListView.Items.Count - 1 downto 0 do begin
      ListItem := ListView.Items.Item[I];
      boFind := False;
      for II := 0 to MonList.Count - 1 do begin
        if TBaseObject(ListItem.SubItems.Objects[0]) = TBaseObject(MonList.Items[II]) then begin
          boFind := True;
          Break;
        end;
      end;
      if not boFind then ListView.Items.Delete(I);
    end;
    MonList.Free;
  end;
  n01 := 0;
  for I := 0 to ListView.Items.Count - 1 do begin
    ListItem := ListView.Items.Item[I];
    Inc(n01);
    if IntToStr(n01) <> ListItem.Caption then
      ListItem.Caption := IntToStr(n01);

    sMsg := IntToStr(Monster.m_nCurrX) + ':' + IntToStr(Monster.m_nCurrY);
    if sMsg <> ListItem.SubItems.Strings[1] then
      ListItem.SubItems.Strings[1] := sMsg;

    sMsg := IntToStr(Monster.m_Abil.Level);
    if sMsg <> ListItem.SubItems.Strings[2] then
      ListItem.SubItems.Strings[2] := sMsg;

    sMsg := IntToStr(Monster.m_Abil.HP) + '/' + IntToStr(Monster.m_Abil.MaxHP);
    if sMsg <> ListItem.SubItems.Strings[3] then
      ListItem.SubItems.Strings[3] := sMsg;

    sMsg := IntToStr(Monster.m_Abil.MP) + '/' + IntToStr(Monster.m_Abil.MaxMP);
    if sMsg <> ListItem.SubItems.Strings[4] then
      ListItem.SubItems.Strings[4] := sMsg;

    sMsg := BooleanToStr(Monster.m_boDeath);
    if sMsg <> ListItem.SubItems.Strings[5] then
      ListItem.SubItems.Strings[5] := sMsg;
  end;
  Caption := SelEnvirnoment.sMapDesc + ' ' + '怪物数量:' + IntToStr(ListView.Items.Count);
end;

procedure TfrmConfigMonGenView.PopupMenu_AutoRefClick(Sender: TObject);
begin
  PopupMenu_AutoRef.Checked := not PopupMenu_AutoRef.Checked;
  Timer.Enabled := PopupMenu_AutoRef.Checked;
end;

procedure TfrmConfigMonGenView.PopupMenu_ClearClick(Sender: TObject);
  function GetActorObject(BaseObject: TBaseObject): Boolean;
  var
    I: Integer;
    ListItem: TListItem;
  begin
    Result := False;
    for I := 0 to ListView.Items.Count - 1 do begin
      ListItem := ListView.Items.Item[I];
      if ListItem.Selected and (ListItem.SubItems.Objects[0] = BaseObject) then begin
        Result := True;
        Break;
      end;
    end;
  end;
var
  I: Integer;
  BaseObject: TBaseObject;
  MonList: TList;
begin
  MonList := TList.Create;
  UserEngine.GetMapMonster(SelEnvirnoment, MonList);
  for I := 0 to MonList.Count - 1 do begin
    BaseObject := TBaseObject(MonList.Items[I]);
    if BaseObject.m_Master <> nil then Continue;
    if not GetActorObject(BaseObject) then Continue;
    if GetNoClearMonList(BaseObject.m_sCharName) then Continue;
    BaseObject.m_boNoItem := True;
    BaseObject.MakeGhost;
  end;
  MonList.Free;
  RefListViewSession;
end;

procedure TfrmConfigMonGenView.PopupMenu_ClearAllClick(Sender: TObject);
var
  I: Integer;
  BaseObject: TBaseObject;
  MonList: TList;
begin
  MonList := TList.Create;
  UserEngine.GetMapMonster(SelEnvirnoment, MonList);
  for I := 0 to MonList.Count - 1 do begin
    BaseObject := TBaseObject(MonList.Items[I]);
    if BaseObject.m_Master <> nil then Continue;
    if GetNoClearMonList(BaseObject.m_sCharName) then Continue;
    BaseObject.m_boNoItem := True;
    BaseObject.MakeGhost;
  end;
  MonList.Free;
  RefListViewSession;
end;

procedure TfrmConfigMonGenView.PopupMenu_RefClick(Sender: TObject);
begin
  RefListViewSession;
end;

end.
