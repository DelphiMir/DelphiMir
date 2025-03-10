unit ViewOnlineHuman;

interface

uses
  {svn,} Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, MudUtil, Envir;

type
  TfrmViewOnlineHuman = class(TForm)
    PanelStatus: TPanel;
    GridHuman: TStringGrid;
    ButtonRefGrid: TButton;
    ComboBoxSort: TComboBox;
    Label1: TLabel;
    Timer: TTimer;
    EditSearchName: TEdit;
    ButtonSearch: TButton;
    ButtonView: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonRefGridClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComboBoxSortClick(Sender: TObject);
    procedure GridHumanDblClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ButtonSearchClick(Sender: TObject);
    procedure ButtonViewClick(Sender: TObject);
  private
    ViewList:TStringList;
    dwTimeOutTick:LongWord;
    procedure RefGridSession();
    procedure GetOnlineList();
    procedure SortOnlineList(nSort:Integer);
    procedure ShowHumanInfo();
    { Private declarations }
  public
    procedure Open(Envirnoment: TEnvirnoment);
    { Public declarations }
  end;

var
  frmViewOnlineHuman: TfrmViewOnlineHuman;

implementation

uses UsrEngn, M2Share, ObjBase, HUtil32, HumanInfo;

{$R *.dfm}

{ TfrmViewOnlineHuman }



procedure TfrmViewOnlineHuman.Open(Envirnoment: TEnvirnoment);
begin
  frmHumanInfo:=TfrmHumanInfo.Create(Owner);
  dwTimeOutTick:=GetTickCount();
  GetOnlineList();
  RefGridSession();
  Timer.Enabled:=True;
  ShowModal;
  Timer.Enabled:=False;
  frmHumanInfo.Free;
end;
procedure TfrmViewOnlineHuman.GetOnlineList;
var
  I: Integer;
begin
  ViewList.Clear;
  try
    EnterCriticalSection(ProcessHumanCriticalSection);
    for I := 0 to UserEngine.m_PlayObjectList.Count - 1 do begin
      ViewList.AddObject(UserEngine.m_PlayObjectList.Strings[I],UserEngine.m_PlayObjectList.Objects[I]);
    end;
  finally
    LeaveCriticalSection(ProcessHumanCriticalSection);
  end;
end;
procedure TfrmViewOnlineHuman.RefGridSession;
var
  I: Integer;
  PlayObject:TPlayObject;
begin
  PanelStatus.Caption:='正在刷新表格...';
  GridHuman.Visible:=False;
  GridHuman.Cells[0,1]:='';
  GridHuman.Cells[1,1]:='';
  GridHuman.Cells[2,1]:='';
  GridHuman.Cells[3,1]:='';
  GridHuman.Cells[4,1]:='';
  GridHuman.Cells[5,1]:='';
  GridHuman.Cells[6,1]:='';
  GridHuman.Cells[7,1]:='';
  GridHuman.Cells[8,1]:='';
  GridHuman.Cells[9,1]:='';
  GridHuman.Cells[10,1]:='';
  GridHuman.Cells[11,1]:='';
  GridHuman.Cells[12,1]:='';
  GridHuman.Cells[13,1]:='';

  if ViewList.Count <= 0 then begin
    GridHuman.RowCount:=2;
    GridHuman.FixedRows:=1;
  end else begin
    GridHuman.RowCount:=ViewList.Count + 1;
  end;
  for I := 0 to ViewList.Count - 1 do begin
    PlayObject:=TPlayObject(ViewList.Objects[I]);
    GridHuman.Cells[0,I + 1]:=IntToStr(I);
    GridHuman.Cells[1,I + 1]:=PlayObject.m_sCharName;
    GridHuman.Cells[2,I + 1]:=Inttostr(PlayObject.m_btGender);
    GridHuman.Cells[3,I + 1]:=Inttostr(PlayObject.m_btJob);
    GridHuman.Cells[4,I + 1]:=IntToStr(PlayObject.m_Abil.Level);
    GridHuman.Cells[5,I + 1]:=PlayObject.m_sMapName;
    GridHuman.Cells[6,I + 1]:=IntToStr(PlayObject.m_nCurrX) + ':' + IntToStr(PlayObject.m_nCurrY);
    GridHuman.Cells[7,I + 1]:=PlayObject.m_sUserID;
    GridHuman.Cells[8,I + 1]:=PlayObject.m_sIPaddr;
    GridHuman.Cells[9,I + 1]:=IntToStr(PlayObject.m_btPermission);
   // GridHuman.Cells[10,I + 1]:=PlayObject.m_sIPLocal;// GetIPLocal(PlayObject.m_sIPaddr);
    GridHuman.Cells[10,I + 1]:=IntToStr(PlayObject.m_nGold);
    GridHuman.Cells[11,I + 1]:=IntToStr(PlayObject.m_nGameGold);
    GridHuman.Cells[12,I + 1]:=IntToStr(PlayObject.m_nGamePoint);
    GridHuman.Cells[13,I + 1]:=IntToStr(PlayObject.m_nPCPoint);
    GridHuman.Cells[14,I + 1]:=PlayObject.m_sHDDCode;       //荐沥登菌嚼聪促.
  end;
  GridHuman.Visible:=True;
end;

procedure TfrmViewOnlineHuman.FormCreate(Sender: TObject);
begin
  ViewList:=TStringList.Create;
  GridHuman.Cells[0,0]:='序号';
  GridHuman.Cells[1,0]:='名字';
  GridHuman.Cells[2,0]:='性别';
  GridHuman.Cells[3,0]:='职业';
  GridHuman.Cells[4,0]:='等级';
  GridHuman.Cells[5,0]:='地图';
  GridHuman.Cells[6,0]:='坐标';
  GridHuman.Cells[7,0]:='登录账号';
  GridHuman.Cells[8,0]:='IP地址';
  GridHuman.Cells[9,0]:='权限 ';
 // GridHuman.Cells[10,0]:='Local IP';
  GridHuman.Cells[10,0]:='金币';
  GridHuman.Cells[11,0]:=g_Config.sGameGoldName;
  GridHuman.Cells[12,0]:=g_Config.sGamePointName;
  GridHuman.Cells[13,0]:=g_Config.sPCPointName;
  GridHuman.Cells[14,0]:='硬件码';               //荐沥登菌嚼聪促.
end;

procedure TfrmViewOnlineHuman.ButtonRefGridClick(Sender: TObject);
begin
  dwTimeOutTick:=GetTickCount();
  GetOnlineList();
  RefGridSession();
end;

procedure TfrmViewOnlineHuman.FormDestroy(Sender: TObject);
begin
  ViewList.Free;
end;



procedure TfrmViewOnlineHuman.ComboBoxSortClick(Sender: TObject);
begin
  if ComboBoxSort.ItemIndex < 0 then exit;
  dwTimeOutTick:=GetTickCount();
  GetOnlineList();
  SortOnLineList(ComboBoxSort.ItemIndex);
  RefGridSession();
end;

procedure TfrmViewOnlineHuman.SortOnlineList(nSort:Integer);
var
  I: Integer;
  SortList:TStringList;
begin
  SortList:=TStringList.Create;
  case nSort of
    0: begin
      ViewList.Sort;
      exit;
    end;
    1: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_btGender),ViewList.Objects[I]);
      end;
    end;
    2: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_btJob),ViewList.Objects[I]);
      end;
    end;
    3: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_Abil.Level),ViewList.Objects[I]);
      end;
    end;
    4: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(TPlayObject(ViewList.Objects[I]).m_sMapName,ViewList.Objects[I]);
      end;
    end;
    5: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(TPlayObject(ViewList.Objects[I]).m_sIPaddr,ViewList.Objects[I]);
      end;
    end;
    6: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_btPermission),ViewList.Objects[I]);
      end;
    end;
    7: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_nGold),ViewList.Objects[I]);
      end;
    end;
    8: begin
      for I := 0 to ViewList.Count - 1 do begin
        SortList.AddObject(IntToStr(TPlayObject(ViewList.Objects[I]).m_nGameGold),ViewList.Objects[I]);
      end;
    end;
  end;
  ViewList.Free;
  ViewList:=SortList;
  ViewList.Sort;
end;

procedure TfrmViewOnlineHuman.GridHumanDblClick(Sender: TObject);
begin
  ShowHumanInfo();
end;

procedure TfrmViewOnlineHuman.TimerTimer(Sender: TObject);
begin
  if (GetTickCount - dwTimeOutTick > 30000) and (ViewList.Count > 0) then begin
    ViewList.Clear;
    RefGridSession();
  end;
end;

procedure TfrmViewOnlineHuman.ButtonSearchClick(Sender: TObject);
var
  I: Integer;
  sHumanName:String;
  PlayObject:TPlayObject;
begin
  sHumanName:=Trim(EditSearchName.Text);
  if sHumanName = '' then begin
    Application.MessageBox('请输入有效的名字！','确认信息!',MB_OK + MB_ICONEXCLAMATION);
    exit;
  end;
  for I := 0 to ViewList.Count - 1 do begin
    PlayObject:=TPlayObject(ViewList.Objects[I]);
    if CompareText(PlayObject.m_sCharName,sHumanName) = 0 then begin
      GridHuman.Row:=I + 1;
      exit;
    end;
  end;
  Application.MessageBox('此玩家不存在..','提示信息',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmViewOnlineHuman.ButtonViewClick(Sender: TObject);
begin
  ShowHumanInfo();
end;

procedure TfrmViewOnlineHuman.ShowHumanInfo;
var
  nSelIndex:Integer;
  sPlayObjectName:String;
  PlayObject:TPlayObject;
begin
  nSelIndex:=GridHuman.Row;
  Dec(nSelIndex);
  if (nSelIndex < 0) or (ViewList.Count <= nSelIndex) then begin
    Application.MessageBox('请先从列表中选择用户!','确认信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  sPlayObjectName:=GridHuman.Cells[1,nSelIndex + 1];
  PlayObject:=UserEngine.GetPlayObject(sPlayObjectName);
  if PlayObject = nil then begin
    Application.MessageBox('户不在线。','确认信息',MB_OK + MB_ICONINFORMATION);
    exit;
  end;
    
  frmHumanInfo.BaseObject:=TPlayObject(ViewList.Objects[nSelIndex]);
  frmHumanInfo.Top:=Self.Top + 20;
  frmHumanInfo.Left:=Self.Left;
  frmHumanInfo.Open();
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ViewOnlineHuman.pas 335 2006-08-26 00:53:23Z Fugly $');
end.
