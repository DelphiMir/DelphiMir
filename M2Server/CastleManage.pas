unit CastleManage;

interface

uses
  {svn,} Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin, Guild, Castle;

type
  TfrmCastleManage = class(TForm)
    GroupBox1: TGroupBox;
    ListViewCastle: TListView;
    GroupBox2: TGroupBox;
    PageControlCastle: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EditOwenGuildName: TEdit;
    EditTotalGold: TSpinEdit;
    EditTodayIncome: TSpinEdit;
    EditTechLevel: TSpinEdit;
    EditPower: TSpinEdit;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    ListViewGuard: TListView;
    ButtonRefresh: TButton;
    procedure ListViewCastleClick(Sender: TObject);
    procedure ButtonRefreshClick(Sender: TObject);
  private
    procedure RefCastleList;
    procedure RefCastleInfo;
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmCastleManage: TfrmCastleManage;
  nCount: Integer;
  CurCastle:TUserCastle;

implementation

uses M2Share, ObjMon2;

{$R *.dfm}
var
  boRefing:Boolean;
  SelAttackGuildInfo: pTAttackerInfo;
{ TfrmCastleManage }

procedure TfrmCastleManage.Open;
begin
  RefCastleList();
  ShowModal;
end;

procedure TfrmCastleManage.RefCastleInfo;
var
  I,II: Integer;
  ListItem:TListItem;
  ObjUnit:pTObjUnit;
begin
  if CurCastle = nil then exit;
  boRefing:=True;
  if CurCastle.m_MasterGuild = nil then EditOwenGuildName.Text:=''
  else EditOwenGuildName.Text:=CurCastle.m_MasterGuild.sGuildName;
  EditTotalGold.Value    :=CurCastle.m_nTotalGold;
  EditTodayIncome.Value  :=CurCastle.m_nTodayIncome;
  EditTechLevel.Value    :=CurCastle.m_nTechLevel;
  EditPower.Value        :=CurCastle.m_nPower;
  ListViewGuard.Clear;
  if CurCastle.m_sMapName = 'SABUK_CASTLE1' then begin
    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='0';
    if CurCastle.m_MainDoor.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_MainDoor.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.BaseObject.m_nCurrX,CurCastle.m_MainDoor.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_MainDoor.BaseObject.m_WAbil.HP,CurCastle.m_MainDoor.BaseObject.m_WAbil.MaxHP]));
      if CurCastle.m_MainDoor.BaseObject.m_boDeath then begin
        ListItem.SubItems.Add('攻击');
      end else
     // if (CurCastle.m_MainDoor.BaseObject <> nil) and CurCastle.m_MainDoor.nStatus then begin
      if TCastleDoor(CurCastle.m_MainDoor.BaseObject).m_boOpened then begin
        ListItem.SubItems.Add('打开');
      end else begin
        ListItem.SubItems.Add('关闭');
      end;
    end else begin
      ListItem.SubItems.Add(CurCastle.m_MainDoor.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.nX,CurCastle.m_MainDoor.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='1';
    if CurCastle.m_LeftCastleWall.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_LeftCastleWall.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftCastleWall.BaseObject.m_nCurrX,CurCastle.m_LeftCastleWall.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_LeftCastleWall.BaseObject.m_WAbil.HP,CurCastle.m_LeftCastleWall.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(CurCastle.m_LeftCastleWall.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftCastleWall.nX,CurCastle.m_LeftCastleWall.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='2';
    if CurCastle.m_RightCastleWall.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_RightCastleWall.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightCastleWall.BaseObject.m_nCurrX,CurCastle.m_RightCastleWall.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_RightCastleWall.BaseObject.m_WAbil.HP,CurCastle.m_RightCastleWall.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(CurCastle.m_RightCastleWall.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightCastleWall.nX,CurCastle.m_RightCastleWall.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

    for I := Low(CurCastle.m_Archer) to High(CurCastle.m_Archer) do begin
      ObjUnit:=@CurCastle.m_Archer[I];
      ListItem:=ListViewGuard.Items.Add;
      ListItem.Caption:=IntToStr(I + 3);
      if ObjUnit.BaseObject <> nil then begin
        ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
        ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
      end else begin
        ListItem.SubItems.Add(ObjUnit.sName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
        ListItem.SubItems.Add(format('%d/%d',[0,0]));
      end;
    end;
    for II := Low(CurCastle.m_Guard) to High(CurCastle.m_Guard) do begin
      ObjUnit:=@CurCastle.m_Guard[II];
      ListItem:=ListViewGuard.Items.Add;
      ListItem.Caption:=IntToStr(I + 3);
      if ObjUnit.BaseObject <> nil then begin
        ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
        ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
      end else begin
        ListItem.SubItems.Add(ObjUnit.sName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
        ListItem.SubItems.Add(format('%d/%d',[0,0]));
      end;
    end;
  end else begin
    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='0';
    if CurCastle.m_FirstDoor.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_FirstDoor.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_FirstDoor.BaseObject.m_nCurrX,CurCastle.m_FirstDoor.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_FirstDoor.BaseObject.m_WAbil.HP,CurCastle.m_FirstDoor.BaseObject.m_WAbil.MaxHP]));
      if CurCastle.m_FirstDoor.BaseObject.m_boDeath then begin
        ListItem.SubItems.Add('攻击');
      end else
     // if (CurCastle.m_DoorStatus <> nil) and CurCastle.m_DoorStatus.boOpened then begin
      if TNammanCastleDoor(CurCastle.m_FirstDoor.BaseObject).m_boOpened then begin
        ListItem.SubItems.Add('打开');
      end else begin
        ListItem.SubItems.Add('关闭');
      end;
    end else begin
      ListItem.SubItems.Add(CurCastle.m_MainDoor.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.nX,CurCastle.m_MainDoor.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='1';
    if CurCastle.m_SecondDoor.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_SecondDoor.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_SecondDoor.BaseObject.m_nCurrX,CurCastle.m_SecondDoor.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_SecondDoor.BaseObject.m_WAbil.HP,CurCastle.m_SecondDoor.BaseObject.m_WAbil.MaxHP]));
      if CurCastle.m_SecondDoor.BaseObject.m_boDeath then begin
        ListItem.SubItems.Add('攻击');
      end else
     // if (CurCastle.m_DoorStatus <> nil) and CurCastle.m_DoorStatus.boOpened then begin
      if TNammanCastleDoor2(CurCastle.m_SecondDoor.BaseObject).m_boOpened then begin
        ListItem.SubItems.Add('打开');
      end else begin
        ListItem.SubItems.Add('关闭');
      end;
    end else begin
      ListItem.SubItems.Add(CurCastle.m_MainDoor.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_MainDoor.nX,CurCastle.m_MainDoor.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

      ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='2';
    if CurCastle.m_LeftCastleWall.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_LeftCastleWall.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftCastleWall.BaseObject.m_nCurrX,CurCastle.m_LeftCastleWall.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_LeftCastleWall.BaseObject.m_WAbil.HP,CurCastle.m_LeftCastleWall.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(CurCastle.m_LeftCastleWall.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_LeftCastleWall.nX,CurCastle.m_LeftCastleWall.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;

    ListItem:=ListViewGuard.Items.Add;
    ListItem.Caption:='3';
    if CurCastle.m_RightCastleWall.BaseObject <> nil then begin
      ListItem.SubItems.Add(CurCastle.m_RightCastleWall.BaseObject.m_sCharName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightCastleWall.BaseObject.m_nCurrX,CurCastle.m_RightCastleWall.BaseObject.m_nCurrY]));
      ListItem.SubItems.Add(format('%d/%d',[CurCastle.m_RightCastleWall.BaseObject.m_WAbil.HP,CurCastle.m_RightCastleWall.BaseObject.m_WAbil.MaxHP]));
    end else begin
      ListItem.SubItems.Add(CurCastle.m_RightCastleWall.sName);
      ListItem.SubItems.Add(format('%d:%d',[CurCastle.m_RightCastleWall.nX,CurCastle.m_RightCastleWall.nY]));
      ListItem.SubItems.Add(format('%d/%d',[0,0]));
    end;


    for I := Low(CurCastle.m_Archer) to High(CurCastle.m_Archer) do begin
      ObjUnit:=@CurCastle.m_Archer[I];
      ListItem:=ListViewGuard.Items.Add;
      ListItem.Caption:=IntToStr(I + 4);
      if ObjUnit.BaseObject <> nil then begin
        ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
        ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
      end else begin
        ListItem.SubItems.Add(ObjUnit.sName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
        ListItem.SubItems.Add(format('%d/%d',[0,0]));
      end;
    end;
    for II := Low(CurCastle.m_Guard) to High(CurCastle.m_Guard) do begin
      ObjUnit:=@CurCastle.m_Guard[II];
      ListItem:=ListViewGuard.Items.Add;
      ListItem.Caption:=IntToStr(I + 4);
      if ObjUnit.BaseObject <> nil then begin
        ListItem.SubItems.Add(ObjUnit.BaseObject.m_sCharName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.BaseObject.m_nCurrX,ObjUnit.BaseObject.m_nCurrY]));
        ListItem.SubItems.Add(format('%d/%d',[ObjUnit.BaseObject.m_WAbil.HP,ObjUnit.BaseObject.m_WAbil.MaxHP]));
      end else begin
        ListItem.SubItems.Add(ObjUnit.sName);
        ListItem.SubItems.Add(format('%d:%d',[ObjUnit.nX,ObjUnit.nY]));
        ListItem.SubItems.Add(format('%d/%d',[0,0]));
      end;
    end;


  end;
  boRefing:=False;
end;

procedure TfrmCastleManage.RefCastleList;
var
  I: Integer;
  UserCastle:TUserCastle;
  ListItem:TListItem;
begin
  g_CastleManager.Lock;
  try
    for I := 0 to g_CastleManager.m_CastleList.Count - 1 do begin
      UserCastle:=TUserCastle(g_CastleManager.m_CastleList.Items[I]);
      ListItem:=ListViewCastle.Items.Add;
      ListItem.Caption:=IntToStr(I);
      ListItem.SubItems.AddObject(UserCastle.m_sConfigDir,UserCastle);
      ListItem.SubItems.Add(UserCastle.m_sName)
    end;
  finally
    g_CastleManager.UnLock;
  end;
end;

procedure TfrmCastleManage.ListViewCastleClick(Sender: TObject);
var
  ListItem:TListItem;
begin
  ListItem:=ListViewCastle.Selected;
  if ListItem = nil then exit;
  CurCastle:=TUserCastle(ListItem.SubItems.Objects[0]);
  RefCastleInfo();
end;

procedure TfrmCastleManage.ButtonRefreshClick(Sender: TObject);
begin
  RefCastleInfo();
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: CastleManage.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.
