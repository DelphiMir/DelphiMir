unit FState2;

interface

uses
  {svn,} Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DWinCtl, StdCtrls, DXDraws, Grids, Grobal2, EdCode, clFunc, hUtil32, cliUtil,
  MapUnit, SoundUtil, Actor, nixtime, DateUtils, StrUtils, Wil, MShare, IniFiles, Relationship;

const
  FRIENDCOUNT = 10;

type
  TFrmDlg2 = class(TForm)
    DBuffDlg: TDWindow;
    DCoolBuffDlg: TDWindow;
    DGuildMarkDlg: TDWindow;
    DInputKey: TDWindow;
    DInputKey0: TDButton;
    DInputKey1: TDButton;
    DInputKey2: TDButton;
    DInputKey3: TDButton;
    DInputKey4: TDButton;
    DInputKey5: TDButton;
    DInputKey6: TDButton;
    DInputKey7: TDButton;
    DInputKey8: TDButton;
    DInputKey9: TDButton;
    DInputKeya: TDButton;
    DInputKeyb: TDButton;
    DInputKeyc: TDButton;
    DInputKeyd: TDButton;
    DInputKeyDel: TDButton;
    DInputKeye: TDButton;
    DInputKeyEnter: TDButton;
    DInputKeyEsc: TDButton;
    DInputKeyf: TDButton;
    DInputKeyg: TDButton;
    DInputKeyh: TDButton;
    DInputKeyi: TDButton;
    DInputKeyj: TDButton;
    DInputKeyk: TDButton;
    DInputKeyl: TDButton;
    DInputKeym: TDButton;
    DInputKeyn: TDButton;
    DInputKeyo: TDButton;
    DInputKeyp: TDButton;
    DInputKeyq: TDButton;
    DInputKeyr: TDButton;
    DInputkeyRand: TDButton;
    DInputKeys: TDButton;
    DInputKeyt: TDButton;
    DInputKeyu: TDButton;
    DInputKeyv: TDButton;
    DInputKeyw: TDButton;
    DInputKeyx: TDButton;
    DInputKeyy: TDButton;
    DInputKeyz: TDButton;
    DWindowTop: TDWindow;
    DTopList1: TDWindow;
    DTopList2: TDWindow;
    DTopClose: TDButton;
    DTopButton0: TDButton;
    DTopFirst: TDButton;
    DTopLastly: TDButton;
    DTopUp: TDButton;
    DTopDown: TDButton;
    DTopMy: TDButton;
    DTopButton1: TDButton;
    DTopButton2: TDButton;
    DTopButton3: TDButton;
    DTopButton4: TDButton;
    DTopButton6: TDButton;
    DTopButton7: TDButton;
    DTopButton8: TDButton;
    DTopButton9: TDButton;
    DTopButton10: TDButton;
    DTopButton11: TDButton;
    DTopButton12: TDButton;
    DTopButton14: TDButton;
    DTopButton15: TDButton;
    DWndFace: TDWindow;
    DWinFriend: TDWindow;
    DFriFriend: TDButton;
    DFriBlack: TDButton;
    DFriClose: TDButton;
    DFriAddMem: TDButton;
    DFriDelMem: TDButton;
    DFriWin1: TDWindow;
    DFriWin2: TDWindow;
    DFriMail: TDButton;
    DFriWhisper: TDButton;
    DFriMemo: TDButton;
    DTopButton5: TDButton;
    DWndDeath: TDWindow;
    dbtnAcceptCure: TDButton;
    dbtnAtOnceCure: TDButton;
    dbtnBackCure: TDButton;
    dbtnAcceptAlive: TDButton;
    DCreateHero: TDWindow;
    HeroWarrior: TDButton;
    HeroWizzard: TDButton;
    HeroMonk: TDButton;
    HeroAssassin: TDButton;
    HeroBonze: TDButton;
    HeroFemale: TDButton;
    HeroMale: TDButton;
    HeroOk: TDButton;
    HeroClose: TDButton;
    DTopButton13: TDButton;
    DHeroBuffDlg: TDWindow;
    DRPSDlg: TDWindow;
    DCRock: TDButton;
    DCSizer: TDButton;
    DCPaper: TDButton;
    DGoReStart: TDButton;
    DGoResult: TDButton;
    DRPSClose: TDButton;
    DPaper: TDButton;
    DSizer: TDButton;
    DRock: TDButton;
    DWndCompound: TDWindow;
    DCompoundItem1: TDButton;
    DCompoundItem2: TDButton;
    DCompoundItem3: TDButton;
    DCompoundItem4: TDButton;
    DCompoundItem0: TDButton;
    DStartCompound: TDButton;
    DCloseCompound: TDButton;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBuffDlgDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DBuffDlgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DCoolBuffDlgDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DCoolBuffDlgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DGuildMarkDlgDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DGuildMarkDlgMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DGuildMarkDlgDblClick(Sender: TObject);
    procedure DGuildMarkDlgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DInputKey0Click(Sender: TObject; X, Y: Integer);
    procedure DLoginNewClickSound(Sender: TObject;
      Clicksound: TClickSound);
    procedure DInputKeyEscDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DInputKeyEscClick(Sender: TObject; X, Y: Integer);
    procedure DInputKeyDelClick(Sender: TObject; X, Y: Integer);
    procedure DInputkeyRandClick(Sender: TObject; X, Y: Integer);
    procedure DInputKeyEnterClick(Sender: TObject; X, Y: Integer);
    procedure DWindowTopDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DTopList1DirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DTopCloseDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DTopCloseClick(Sender: TObject; X, Y: Integer);
    procedure DWindowTopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DTopList1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DTopButton0DirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DTopButton0Click(Sender: TObject; X, Y: Integer);
    procedure DTopList1Click(Sender: TObject; X, Y: Integer);
    procedure DTopFirstClick(Sender: TObject; X, Y: Integer);
    procedure DWndFaceDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DWndFaceMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DWndFaceClick(Sender: TObject; X, Y: Integer);
    procedure DWndFaceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DWinFriendDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DFriFriendDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DFriFriendClick(Sender: TObject; X, Y: Integer);
    procedure DFriAddMemClick(Sender: TObject; X, Y: Integer);
    procedure DFriDelMemClick(Sender: TObject; X, Y: Integer);
    procedure DFriWin1DirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DFriWin1DblClick(Sender: TObject);
    procedure DFriWin1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DFriWin1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DFriWhisperClick(Sender: TObject; X, Y: Integer);
    procedure DFriMailClick(Sender: TObject; X, Y: Integer);
    procedure DFriMemoClick(Sender: TObject; X, Y: Integer);
    procedure DFriAddMemMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DWinFriendMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DWndDeathDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure dbtnAcceptCureDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure dbtnAcceptCureClick(Sender: TObject; X, Y: Integer);
    procedure DCreateHeroDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure HeroCloseClick(Sender: TObject; X, Y: Integer);
    procedure HeroCloseDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure HeroOkDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DHeroBuffDlgDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DHeroBuffDlgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

    procedure DRPSDlgDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DRockDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DRockClick(Sender: TObject; X, Y: Integer);
    procedure DCRockDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DGoResultDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DGoResultClick(Sender: TObject; X, Y: Integer);
    procedure DRPSCloseClick(Sender: TObject; X, Y: Integer);
    procedure DGoReStartClick(Sender: TObject; X, Y: Integer);
    procedure DWndCompoundDirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DCloseCompoundClick(Sender: TObject; X, Y: Integer);
    procedure DStartCompoundClick(Sender: TObject; X, Y: Integer);
    procedure DCompoundItem0DirectPaint(Sender: TObject;
      dsurface: TDirectDrawSurface);
    procedure DCompoundItem0Click(Sender: TObject; X, Y: Integer);
    procedure DCompoundItem0MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DWndCompoundMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    userSelect, CompSelect, SelResult: integer;
    SelBoolean: Boolean;

    FCompoundLock: Boolean;
    FCompoundItems: array [0 .. 4] of TMovingItem;
    FCompoundShowTick: LongWord;
    FCompoundShowSchedule, FCompoundShowEffect: Boolean;
    FCompoundShowSchedulePos: Integer;
    FCompoundResult: Byte;
  public
    FCompoundUserItem: TClientItem;
    FriendIndex: Integer;
    FriendSelect: Integer;
    FriendMove: Integer;
    FTopIndex: Byte;
    FboTopSend: Boolean;
    FTopInfo: TClientTopInfo;
    FnMaxTopPage: Integer;
    FnMinTopPage: Integer;
    FTopMoveIndex: Integer;
    GuldSelectindex: Integer;
    FaceSelectindex: Integer;
    EMailIndex: Integer;
    EMailSelect: Integer;
    EMailMove: Integer;
    EMailSelectTick: LongWord;

    RockRate:Integer;
    RockGold:Integer;

    Initialized: Boolean;
    { Public declarations }
    procedure Initialize;
    procedure DWindowTopVisible;
    procedure ResultGame;
    procedure ComputerRandom;
    procedure ReStart;


    function CanCompoundItemAdd(Item: pTClientItem): Boolean;
    function CanCompoundItemAddEx(Item: pTClientItem; boFirst: Boolean): Boolean;
    procedure CompoundItemAdd(nItemIndex: Integer);
    procedure ClearCompoundItemInfo(boClick: Boolean);
    procedure ClientCompoundItem(nResult: Integer; sMsg: string);
  end;

var
  FrmDlg2: TFrmDlg2;

implementation

uses FState, ClMain, {MShare,} Share, SDK, IntroScn, Bass;

{$R *.dfm}

procedure TFrmDlg2.FormCreate(Sender: TObject);
begin
  GuldSelectindex := -1;
  FaceSelectindex := -1;
  FboTopSend := False;
  FTopIndex := 0;
  FillChar(FTopInfo, SizeOf(FTopInfo), #0);
end;

procedure TFrmDlg2.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TFrmDlg2.Initialize;          //霸烙阑 府胶配绢且锭付促 龋免凳
var
  i: integer;
  d: TDirectDrawSurface;
  dcon: TDControl;
begin
  if csDesigning in ComponentState then Exit;
  if Initialized then Exit;

  for i := 0 to ComponentCount - 1 do begin
    if (Components[i] is TDWindow) {or (Components[i] is TDPopUpMemu)} then begin
      dcon := TDControl(Components[i]);
      if dcon.DParent = nil then begin
        dcon.DParent := FrmDlg.DBackground;
        FrmDlg.DBackground.AddChild(dcon);
      end;
    end;
  end;

  FriendIndex := 0;
  FriendSelect := -1;
  FriendMove := -1;

  SelResult := 0;
  compSelect := -1;
  userSelect := -1;
  RockRate := 0;
  RockGold := 0;
  SelBoolean := False;

  EMailSelectTick := GetTickCount;
  EMailIndex := 0;
  EMailSelect := -1;
  EMailMove := -1;

  for I := Low(g_MarkIndexInfo) to High(g_MarkIndexInfo) do begin
    g_MarkIndexInfo[i].ImageIndex := g_MarkIndexList[i];
  end;

  for I := Low(g_FaceIndexInfo) to High(g_FaceIndexInfo) do begin
    g_FaceIndexInfo[i].ImageIndex := g_FaceIndexList[i];
    g_FaceIndexInfo[i].dwShowTime := GetTickCount;
  end;

  d := g_WMain2Images.Images[33];
  if d <> nil then begin
    DBuffDlg.SetImgIndex (g_WMain2Images, 33);
    DBuffDlg.Left := (g_FScreenWidth - 149);
    DBuffDlg.Top  := 2;
  end;

  d := g_WMain2Images.Images[71];
  if d <> nil then begin
    DHeroBuffDlg.SetImgIndex (g_WMain2Images, 71);
    DHeroBuffDlg.Left := (g_FScreenWidth - 23);
    DHeroBuffDlg.Top  := 183;
  end;

  d := g_WMain2Images.Images[53];
  if d <> nil then begin
    DCoolBuffDlg.SetImgIndex (g_WMain2Images, 53);
    DCoolBuffDlg.Left := (g_FScreenWidth - 149);
    DCoolBuffDlg.Top  := 84;
  end;

  //巩颇 付农
  d := g_WMain2Images.Images[127];
  if d <> nil then begin
    DGuildMarkDlg.SetImgIndex (g_WAresImages, 127);
    DGuildMarkDlg.Width := FACESHOWCOUNT * 32 - 4;
    DGuildMarkDlg.Height := 14 + ((High(g_MarkIndexList) + 1) div FACESHOWCOUNT + 1) * 27;
    DGuildMarkDlg.Left := FrmDlg.DGuildDlg.Width - DGuildMarkDlg.Width - 44;
    DGuildMarkDlg.Top := FrmDlg.DGuildDlg.Height - DGuildMarkDlg.Height - 82;
  end;

  d := g_WMain2Images.Images[127];
  if d <> nil then begin
    DWndFace.SetImgIndex (g_WAresImages, 127);
    DWndFace.Width := FACESHOWCOUNT * 24 + 8;
    DWndFace.Height := 8 + ((High(g_FaceIndexList) + 1) div FACESHOWCOUNT + 1) * 24;
    DWndFace.Left := g_FScreenWidth - DWndFace.Width - 185;
    DWndFace.Top := FrmDlg.DNewSay.Top - 78;
  end;

  if not g_InterfaceMode then begin
    d := g_WMainImages.Images[1080];
    if d <> nil then begin
      DInputKey.SetImgIndex (g_WMainImages, 1080);
      DInputKey.Left := (g_FScreenWidth div 2) + 180;
      DInputKey.Top := (g_FScreenHeight div 2) + 15;
    end;
  end else begin
    d := g_WMainImages.Images[1080];
    if d <> nil then begin
      DInputKey.SetImgIndex (g_WMainImages, 1080);
      DInputKey.Left := g_FScreenWidth - 220;
      DInputKey.Top := g_FScreenHeight - 285;
    end;
  end;
   DInputKeyEsc.SetImgIndex (g_WTitleImages, 300);
   DInputKeyEsc.Left := 12;
   DInputKeyEsc.Top  := 12;
   DInputKey0.SetImgIndex (g_WMainImages, 1081);
   DInputKey0.Left := 12;
   DInputKey0.Top  := 44;
   DInputKey1.SetImgIndex (g_WMainImages, 1081);
   DInputKey1.Left := 44;
   DInputKey1.Top  := 44;
   DInputKey2.SetImgIndex (g_WMainImages, 1081);
   DInputKey2.Left := 76;
   DInputKey2.Top  := 44;
   DInputKey3.SetImgIndex (g_WMainImages, 1081);
   DInputKey3.Left := 108;
   DInputKey3.Top  := 44;
   DInputKey4.SetImgIndex (g_WMainImages, 1081);
   DInputKey4.Left := 140;
   DInputKey4.Top  := 44;
   DInputKey5.SetImgIndex (g_WMainImages, 1081);
   DInputKey5.Left := 172;
   DInputKey5.Top  := 44;

   DInputKey6.SetImgIndex (g_WMainImages, 1081);
   DInputKey6.Left := 12;
   DInputKey6.Top  := 76;
   DInputKey7.SetImgIndex (g_WMainImages, 1081);
   DInputKey7.Left := 44;
   DInputKey7.Top  := 76;
   DInputKey8.SetImgIndex (g_WMainImages, 1081);
   DInputKey8.Left := 76;
   DInputKey8.Top  := 76;
   DInputKey9.SetImgIndex (g_WMainImages, 1081);
   DInputKey9.Left := 108;
   DInputKey9.Top  := 76;
   DInputKeyDel.SetImgIndex (g_WTitleImages, 303);
   DInputKeyDel.Left := 140;
   DInputKeyDel.Top  := 76;

   DInputKeya.SetImgIndex (g_WMainImages, 1081);
   DInputKeya.Left := 12;
   DInputKeya.Top  := 108;
   DInputKeyb.SetImgIndex (g_WMainImages, 1081);
   DInputKeyb.Left := 44;
   DInputKeyb.Top  := 108;
   DInputKeyc.SetImgIndex (g_WMainImages, 1081);
   DInputKeyc.Left := 76;
   DInputKeyc.Top  := 108;
   DInputKeyd.SetImgIndex (g_WMainImages, 1081);
   DInputKeyd.Left := 108;
   DInputKeyd.Top  := 108;
   DInputKeye.SetImgIndex (g_WMainImages, 1081);
   DInputKeye.Left := 140;
   DInputKeye.Top  := 108;
   DInputKeyf.SetImgIndex (g_WMainImages, 1081);
   DInputKeyf.Left := 172;
   DInputKeyf.Top  := 108;

   DInputKeyg.SetImgIndex (g_WMainImages, 1081);
   DInputKeyg.Left := 12;
   DInputKeyg.Top  := 140;
   DInputKeyh.SetImgIndex (g_WMainImages, 1081);
   DInputKeyh.Left := 44;
   DInputKeyh.Top  := 140;
   DInputKeyi.SetImgIndex (g_WMainImages, 1081);
   DInputKeyi.Left := 76;
   DInputKeyi.Top  := 140;
   DInputKeyj.SetImgIndex (g_WMainImages, 1081);
   DInputKeyj.Left := 108;
   DInputKeyj.Top  := 140;
   DInputKeyk.SetImgIndex (g_WMainImages, 1081);
   DInputKeyk.Left := 140;
   DInputKeyk.Top  := 140;
   DInputKeyl.SetImgIndex (g_WMainImages, 1081);
   DInputKeyl.Left := 172;
   DInputKeyl.Top  := 140;

   DInputKeym.SetImgIndex (g_WMainImages, 1081);
   DInputKeym.Left := 12;
   DInputKeym.Top  := 172;
   DInputKeyn.SetImgIndex (g_WMainImages, 1081);
   DInputKeyn.Left := 44;
   DInputKeyn.Top  := 172;
   DInputKeyo.SetImgIndex (g_WMainImages, 1081);
   DInputKeyo.Left := 76;
   DInputKeyo.Top  := 172;
   DInputKeyp.SetImgIndex (g_WMainImages, 1081);
   DInputKeyp.Left := 108;
   DInputKeyp.Top  := 172;
   DInputKeyq.SetImgIndex (g_WMainImages, 1081);
   DInputKeyq.Left := 140;
   DInputKeyq.Top  := 172;
   DInputKeyr.SetImgIndex (g_WMainImages, 1081);
   DInputKeyr.Left := 172;
   DInputKeyr.Top  := 172;

   DInputKeys.SetImgIndex (g_WMainImages, 1081);
   DInputKeys.Left := 12;
   DInputKeys.Top  := 204;
   DInputKeyt.SetImgIndex (g_WMainImages, 1081);
   DInputKeyt.Left := 44;
   DInputKeyt.Top  := 204;
   DInputKeyu.SetImgIndex (g_WMainImages, 1081);
   DInputKeyu.Left := 76;
   DInputKeyu.Top  := 204;
   DInputKeyv.SetImgIndex (g_WMainImages, 1081);
   DInputKeyv.Left := 108;
   DInputKeyv.Top  := 204;
   DInputKeyw.SetImgIndex (g_WMainImages, 1081);
   DInputKeyw.Left := 140;
   DInputKeyw.Top  := 204;
   DInputKeyx.SetImgIndex (g_WMainImages, 1081);
   DInputKeyx.Left := 172;
   DInputKeyx.Top  := 204;

   DInputKeyy.SetImgIndex (g_WMainImages, 1081);
   DInputKeyy.Left := 12;
   DInputKeyy.Top  := 236;
   DInputKeyz.SetImgIndex (g_WMainImages, 1081);
   DInputKeyz.Left := 44;
   DInputKeyz.Top  := 236;
   DInputKeyRand.SetImgIndex (g_WTitleImages, 309);
   DInputKeyRand.Left := 76;
   DInputKeyRand.Top  := 236;
   DInputKeyEnter.SetImgIndex (g_WTitleImages, 306);
   DInputKeyEnter.Left := 140;
   DInputKeyEnter.Top  := 236;

   d := g_WAresImages.Images[313];
   if d <> nil then begin
     DWindowTop.SetImgIndex(g_WAresImages, 313);
     DWindowTop.Left := (g_FScreenWidth - d.Width) div 2;
     DWindowTop.Top := (g_FScreenHeight - d.Height) div 2 - 80;
   end;
   DTopClose.SetImgIndex(g_WMain2Images, 360);
   DTopClose.Left := 673;
   DTopClose.Top := 33;

   DTopButton0.SetImgIndex(g_WAresImages, 314);
   DTopButton0.Left := 30;
   DTopButton0.Top := 61;
   DTopButton1.SetImgIndex(g_WAresImages, 314);
   DTopButton1.Left := 102;
   DTopButton1.Top := 61;
   DTopButton2.SetImgIndex(g_WAresImages, 314);
   DTopButton2.Left := 174;
   DTopButton2.Top := 61;
   DTopButton3.SetImgIndex(g_WAresImages, 314);
   DTopButton3.Left := 246;
   DTopButton3.Top := 61;
   DTopButton4.SetImgIndex(g_WAresImages, 314);
   DTopButton4.Left := 318;
   DTopButton4.Top := 61;
   DTopButton5.SetImgIndex(g_WAresImages, 314);
   DTopButton5.Left := 390;
   DTopButton5.Top := 61;
   DTopButton13.SetImgIndex(g_WAresImages, 314);
   DTopButton13.Left := 462;
   DTopButton13.Top := 61;


   DTopButton6.SetImgIndex(g_WAresImages, 316);
   DTopButton6.Left := 30;
   DTopButton6.Top := 277;
   DTopButton7.SetImgIndex(g_WAresImages, 316);
   DTopButton7.Left := 102;
   DTopButton7.Top := 277;
   DTopButton8.SetImgIndex(g_WAresImages, 316);
   DTopButton8.Left := 174;
   DTopButton8.Top := 277;
   DTopButton10.SetImgIndex(g_WAresImages, 316);
   DTopButton10.Left := 246;
   DTopButton10.Top := 277;
   DTopButton11.SetImgIndex(g_WAresImages, 316);
   DTopButton11.Left := 318;
   DTopButton11.Top := 277;
   DTopButton12.SetImgIndex(g_WAresImages, 316);
   DTopButton12.Left := 390;
   DTopButton12.Top := 277;

   DTopButton9.SetImgIndex(g_WAresImages, 316);
   DTopButton9.Left := 246;
   DTopButton9.Top := 277;
   DTopButton14.SetImgIndex(g_WAresImages, 316);
   DTopButton14.Left := 318;
   DTopButton14.Top := 277;
   DTopButton15.SetImgIndex(g_WAresImages, 316);
   DTopButton15.Left := 390;
   DTopButton15.Top := 277;

   DTopFirst.SetImgIndex(g_WAresImages, 267);
   DTopFirst.Left := 226;
   DTopFirst.Top := 316;

   DTopUp.SetImgIndex(g_WMain2Images, 240);
   DTopUp.Left := 270;
   DTopUp.Top := 316;

   DTopDown.SetImgIndex(g_WMain2Images, 243);
   DTopDown.Left := 420;
   DTopDown.Top := 316;

   DTopLastly.SetImgIndex(g_WAresImages, 264);
   DTopLastly.Left := 475;
   DTopLastly.Top := 316;

   DTopMy.SetImgIndex(g_WAresImages, 259);
   DTopMy.Left := 546;
   DTopMy.Top := 312;


   DTopList1.Left := 35;
   DTopList1.Top := 106;
   DTopList1.Width := 308;
   DTopList1.Height := 168;

   DTopList2.Left := 354;
   DTopList2.Top := 106;
   DTopList2.Width := 308;
   DTopList2.Height := 168;

   d := g_WTitleImages.Images[199];
   if d <> nil then begin
     DWinFriend.SetImgIndex(g_WTitleImages, 199);
     DWinFriend.Left := (g_FScreenWidth - d.Width) div 2;
     DWinFriend.Top := (g_FScreenHeight - d.Height) div 2;
   end;
   DFriClose.SetImgIndex(g_WMain2Images, 360);
   DFriClose.Left := 237;
   DFriClose.Top := 3;

   DFriFriend.SetImgIndex(g_WTitleImages, 163);
   DFriFriend.Left := 9;
   DFriFriend.Top := 33;
   DFriBlack.SetImgIndex(g_WTitleImages, 166);
   DFriBlack.Left := 129;
   DFriBlack.Top := 33;

   DFriWin1.Top := 55;
   DFriWin1.left := 14;
   DFriWin1.Width := 107;
   DFriWin1.Height := 180;

   DFriWin2.Top := 55;
   DFriWin2.left := 121;
   DFriWin2.Width := 107;
   DFriWin2.Height := 180;

   DFriAddMem.SetImgIndex(g_WMainImages, 554);
   DFriAddMem.Left := 55;
   DFriAddMem.Top := 241;
   DFriDelMem.SetImgIndex(g_WMainImages, 557);
   DFriDelMem.Left := 87;
   DFriDelMem.Top := 241;
   DFriMemo.SetImgIndex(g_WMainImages, 663);
   DFriMemo.Left:=119;
   DFriMemo.Top:=241;
   DFriMail.SetImgIndex(g_WMainImages, 563);
   DFriMail.Left := 151;
   DFriMail.Top := 241;
   DFriWhisper.SetImgIndex(g_WMainImages, 566);
   DFriWhisper.Left := 183;
   DFriWhisper.Top := 241;

   d := g_WAresImages.Images[419];
   if d <> nil then begin
     DWndDeath.SetImgIndex(g_WAresImages, 419);
     DWndDeath.Left := (g_FScreenWidth - d.Width) div 2;
     DWndDeath.Top := (g_FScreenHeight - d.Height) div 2;
   end;
   dbtnAcceptCure.SetImgIndex(g_WAresImages, 426);        //付阑何劝
   dbtnAcceptCure.Left := 10;
   dbtnAcceptCure.Top := 22;

   dbtnAcceptAlive.SetImgIndex(g_WAresImages, 423);     //酒捞袍何劝
   dbtnAcceptAlive.Left := 10;
   dbtnAcceptAlive.Top := 52;

   dbtnAtOnceCure.SetImgIndex(g_WAresImages, 416);       //肺弊酒眶
   dbtnAtOnceCure.Left := 10;
   dbtnAtOnceCure.Top := 82;

   dbtnBackCure.SetImgIndex(g_WAresImages, 420);        //霸烙辆丰
   dbtnBackCure.Left := 10;
   dbtnBackCure.Top := 112;

   //康旷 积己芒
  d := g_WNewLoginImages.Images[595];
  if d <> nil then begin
    DCreateHero.SetImgIndex(g_WNewLoginImages, 595);
    DCreateHero.Left := (g_FScreenWidth - d.Width) div 2;
    DCreateHero.Top := 20;
  end;
  HeroWarrior.SetImgIndex(g_WNewLoginImages, 596);
  HeroWizzard.SetImgIndex(g_WNewLoginImages, 599);
  HeroMonk.SetImgIndex(g_WNewLoginImages, 602);
  HeroAssassin.SetImgIndex(g_WNewLoginImages, 605);
  HeroBonze.SetImgIndex(g_WNewLoginImages, 611);

  HeroMale.SetImgIndex(g_WNewLoginImages, 617);
  HeroFemale.SetImgIndex(g_WNewLoginImages, 620);

  HeroOk.SetImgIndex(g_WNewLoginImages, 682);
  HeroClose.SetImgIndex(g_WNewLoginImages, 683);

  HeroWarrior.Left := 376;
  HeroWarrior.Top := 299;

  HeroWizzard.Left := 426;
  HeroWizzard.Top := 299;

  HeroMonk.Left := 476;
  HeroMonk.Top := 299;

  HeroAssassin.Left := 526;
  HeroAssassin.Top := 299;

  HeroBonze.Left := 576;
  HeroBonze.Top := 299;

  HeroMale.Left := 376;
  HeroMale.Top := 347;

  HeroFemale.Left := 426;
  HeroFemale.Top := 347;

  HeroOk.Left := 392;
  HeroOk.Top := 402;

  HeroClose.Left := 499;
  HeroClose.Top := 402;

  d := g_WAresImages.Images[464];
   if d <> nil then begin
     DRPSDlg.SetImgIndex(g_WAresImages, 464);
     DRPSDlg.Left := 0;
     DRPSDlg.Top := (g_FScreenHeight - d.Height) div 2;
   end;
   DRPSClose.SetImgIndex(g_WMain2Images, 360);
   DRPSClose.Left := 257;
   DRPSClose.Top := 1;

   DRock.SetImgIndex(g_WMain2Images, 1121);
   DRock.Left := 22;
   DRock.Top := 198;

   DSizer.SetImgIndex(g_WMain2Images, 1131);
   DSizer.Left := 106;
   DSizer.Top := 198;

   DPaper.SetImgIndex(g_WMain2Images, 1126);
   DPaper.Left := 190;
   DPaper.Top := 198;

   DCRock.SetImgIndex(g_WMain2Images, 1121);
   DCRock.Left := 22;
   DCRock.Top := 65;

   DCSizer.SetImgIndex(g_WMain2Images, 1131);
   DCSizer.Left := 106;
   DCSizer.Top := 65;

   DCPaper.SetImgIndex(g_WMain2Images, 1126);
   DCPaper.Left := 190;
   DCPaper.Top := 65;

   DGoResult.SetImgIndex(g_WTitleImages, 730);
   DGoResult.Left := 107;
   DGoResult.Top := 161;

   DGoReStart.SetImgIndex(g_WTitleImages, 120);
   DGoReStart.Left := 113;
   DGoReStart.Top := 161;


   d := g_WAresImages.Images[518];
  if d <> nil then begin
    DWndCompound.SetImgIndex(g_WAresImages, 518);
    DWndCompound.Left := (g_FScreenWidth - d.Width) div 2;
    DWndCompound.Top := (g_FScreenHeight - d.Height) div 2 - 30;
  end;

  DCompoundItem0.Left := 127;
  DCompoundItem0.Top := 224;
  DCompoundItem0.Width := 33;
  DCompoundItem0.Height := 31;

  DCompoundItem1.Left := 55;
  DCompoundItem1.Top := 194;
  DCompoundItem1.Width := 33;
  DCompoundItem1.Height := 31;

  DCompoundItem2.Left := 199;
  DCompoundItem2.Top := 194;
  DCompoundItem2.Width := 33;
  DCompoundItem2.Height := 31;

  DCompoundItem3.Left := 55;
  DCompoundItem3.Top := 252;
  DCompoundItem3.Width := 33;
  DCompoundItem3.Height := 31;

  DCompoundItem4.Left := 199;
  DCompoundItem4.Top := 252;
  DCompoundItem4.Width := 33;
  DCompoundItem4.Height := 31;

  DCloseCompound.SetImgIndex(g_WMain2Images, 360);
  DCloseCompound.Left := 263;
  DCloseCompound.Top := 3;

  DStartCompound.SetImgIndex(g_WTitleImages, 116);
  DStartCompound.Left := 118;
  DStartCompound.Top := 276;

  Initialized := True;
end;

procedure TFrmDlg2.DBuffDlgDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay, I: integer;
  buff  : pTBuff;
begin
  with DBuffDlg do begin
    d := WLib.Images[19];
    if g_BuffList.Count <= 10 then
     d := WLib.Images[19 + g_BuffList.Count];
    if g_BuffList.Count > 10 then
     d := WLib.Images[30];
    if g_BuffList.Count > 20 then
     d := WLib.Images[31];
    if g_BuffList.Count > 30 then
     d := WLib.Images[32];
    if g_BuffList.Count > 40 then
     d := WLib.Images[33];
    Width := d.Width;
    Height := d.Height;
    if d <> nil then
    if MouseMoveing then begin
      dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end else begin
      DrawBlendEx (dsurface, SurfaceX(Left), SurfaceY(Top), d, 0, 0, d.Width, d.Height, 0);
    end;

    ax := SurfaceX(Left) + d.Width - 35;
    ay := SurfaceY(Top) + 5;
    for I := g_BuffList.Count - 1 downto 0 do begin   //滚橇
      buff := g_BuffList.items[I];
      if buff <> nil then begin

        if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin    //滚橇 救荤扼瘤绰巴
          if (buff.nTime - GetTickCount < 1000) then begin   //1檬 固父 昏力 贸府秦林磊..
            g_BuffList.Delete(I);
            if g_BuffList.Count < 10 then
              Left := Left + 23;
          end;
        end;
        if GetTickCount - g_dwTenSecTick[i] > 500 then begin
          g_TenSecTick[i] := Not g_TenSecTick[i];
          g_dwTenSecTick[i]:=GetTickCount();
        end;

        if buff.btIdx in [92,94,95,118,119] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.btIdx in [99,100] then d := g_WMainImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [26,27] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [120] then d := g_WMain2Images.Images[buff.nImgIndex]
        else d := g_WBuffIconImages.Images[buff.nImgIndex];
        if d <> nil then begin

          if i > 29 then begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 690, ay + 75, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 690, ay + 75, d.ClientRect , d , TRUE);
            end;
          end else begin
          if i > 19 then begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 460, ay + 50, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 460, ay + 50, d.ClientRect , d , TRUE);
            end;
          end else begin
          if i > 9 then begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end;
          end else begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end;
          end;
          end;
          end;

        end;

      end;
    end;
    if g_BuffList.Count <= 0 then Visible := False;

  end;
end;

procedure TFrmDlg2.DBuffDlgMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i:integer;
  Time:String;
  buff  : pTBuff;  //滚橇
  d: TDirectDrawSurface;
begin
  DScreen.ClearHint;
  with DBuffDlg do begin
    X := LocalX (X) - Left;
    Y := LocalY (Y) - Top;
    for I := g_buffList.Count - 1 downto 0 do begin    //滚橇
      buff := pTBuff(g_BuffList.Items[I]);
      if buff <> nil then begin
        if (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin  //滚橇 救荤扼瘤绰巴
          Time := '';
        end else
        if (buff.nTime - GetTickCount) >= 60 * 60 * 1000 then begin
          Time := format('%d小时 %d分 %d秒', [(buff.nTime - GetTickCount) Div 3600000 , ((buff.nTime - GetTickCount) Div 60000) mod 60, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
        if (buff.nTime - GetTickCount) >= 60 * 1000 then begin
          Time := format('%d分 %d秒', [(buff.nTime - GetTickCount) Div 60000, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
          Time := format('%d秒', [((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        if g_buffList.Count < 11 then begin
          if (Left + X >= Left - 13 + (g_buffList.Count * 23) - (i*23)) and (Left + X <= Left + 8 + (g_buffList.Count * 23) - (i*23)) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
            dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
          end else
        end else begin
          if (Left + X >= Left + 10) and (Left + X <= Left + 238) and (Top + Y >= Top + 5) and (Top + Y <= Top + 102) then begin
            if (Left + X >= Left + 240 - (i*23) - 23) and (Left + X <= Left + 261 - (i*23) - 23) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 207) and (Left + X <= Left + 261 - (i*23) + 207) and (Top + Y >= Top + 30) and (Top + Y <= Top + 52) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 437) and (Left + X <= Left + 261 - (i*23) + 437) and (Top + Y >= Top + 55) and (Top + Y <= Top + 77) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 667) and (Left + X <= Left + 261 - (i*23) + 667) and (Top + Y >= Top + 80) and (Top + Y <= Top + 102) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DCoolBuffDlgDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay, I: integer;
  buff  : pTBuff;
begin
  with DCoolBuffDlg do begin
    d := WLib.Images[39];
    if g_CoolBuffList.Count <= 10 then
     d := WLib.Images[39 + g_CoolBuffList.Count];
    if g_CoolBuffList.Count > 10 then
     d := WLib.Images[50];
    if g_CoolBuffList.Count > 20 then
     d := WLib.Images[51];
    if g_CoolBuffList.Count > 30 then
     d := WLib.Images[52];
    if g_CoolBuffList.Count > 40 then
     d := WLib.Images[53];
    Width := d.Width;
    Height := d.Height;
    if d <> nil then
    if MouseMoveing then begin
      dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end else begin
      DrawBlendEx (dsurface, SurfaceX(Left), SurfaceY(Top), d, 0, 0, d.Width, d.Height, 0);
    end;

    ax := SurfaceX(Left) + d.Width - 35;
    ay := SurfaceY(Top) + 5;
    for I := g_CoolBuffList.Count - 1 downto 0 do begin   //滚橇
      buff := g_CoolBuffList.items[I];
      if buff <> nil then begin

        if not (buff.btIdx in [30,42,65,66,92]) then begin    //滚橇 救荤扼瘤绰巴
          if (buff.nTime - GetTickCount < 1000) then begin    //1檬 固父 昏力 贸府秦林磊..
            g_CoolBuffList.Delete(I);
            if g_CoolbuffList.Count < 10 then
              Left := Left + 23;
          end;
        end;

        if GetTickCount - g_dwTenSecTick[i] > 500 then begin
          g_TenSecTick[i] := Not g_TenSecTick[i];
          g_dwTenSecTick[i]:=GetTickCount();
        end;

        if buff.btIdx in [92,94,95,118,119] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.btIdx in [99,100] then d := g_WMainImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [26,27] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [120] then d := g_WMain2Images.Images[buff.nImgIndex]
        else d := g_WBuffIconImages.Images[buff.nImgIndex];
        if d <> nil then begin

          if i > 29 then begin
            if not (buff.btIdx in [30,42,65,66,92]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 690, ay + 75, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 690, ay + 75, d.ClientRect , d , TRUE);
            end;
          end else begin
          if i > 19 then begin
            if not (buff.btIdx in [30,42,65,66,92]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 460, ay + 50, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 460, ay + 50, d.ClientRect , d , TRUE);
            end;
          end else begin
          if i > 9 then begin
            if not (buff.btIdx in [30,42,65,66,92]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end;
          end else begin
            if not (buff.btIdx in [30,42,65,66,92]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end;
          end;
          end;
          end;

        end;

      end;
    end;
    if g_CoolBuffList.Count <= 0 then Visible := False;

  end;
end;

procedure TFrmDlg2.DCoolBuffDlgMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;
  Time:String;
  buff  : pTBuff;  //滚橇
  d: TDirectDrawSurface;
begin
  DScreen.ClearHint;
  with DCoolBuffDlg do begin
    X := LocalX (X) - Left;
    Y := LocalY (Y) - Top;
    for I := g_CoolBuffList.Count - 1 downto 0 do begin    //滚橇
      buff := pTBuff(g_CoolBuffList.Items[I]);
      if buff <> nil then begin
        if (buff.btIdx in [30,42,65,66,92]) then begin  //滚橇 救荤扼瘤绰巴
          Time := '';
        end else
        if (buff.nTime - GetTickCount) >= 60 * 60 * 1000 then begin
          Time := format('%d小时 %d分 %d秒', [(buff.nTime - GetTickCount) Div 3600000 , ((buff.nTime - GetTickCount) Div 60000) mod 60, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
        if (buff.nTime - GetTickCount) >= 60 * 1000 then begin
          Time := format('%d分 %d秒', [(buff.nTime - GetTickCount) Div 60000, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
          Time := format('%d秒', [((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        if g_CoolBuffList.Count < 11 then begin
          if (Left + X >= Left - 13 + (g_CoolBuffList.Count * 23) - (i*23)) and (Left + X <= Left + 8 + (g_CoolBuffList.Count * 23) - (i*23)) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
            dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
          end else
        end else begin
          if (Left + X >= Left + 10) and (Left + X <= Left + 238) and (Top + Y >= Top + 5) and (Top + Y <= Top + 102) then begin
            if (Left + X >= Left + 240 - (i*23) - 23) and (Left + X <= Left + 261 - (i*23) - 23) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 207) and (Left + X <= Left + 261 - (i*23) + 207) and (Top + Y >= Top + 30) and (Top + Y <= Top + 52) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 437) and (Left + X <= Left + 261 - (i*23) + 437) and (Top + Y >= Top + 55) and (Top + Y <= Top + 77) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 667) and (Left + X <= Left + 261 - (i*23) + 667) and (Top + Y >= Top + 80) and (Top + Y <= Top + 102) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DGuildMarkDlgDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  i, ax, ay: Integer;
  rc: TRect;
begin
  with Sender as TDWindow do begin
    d := WLib.Images[FaceIndex];
    if d <> nil then
     DrawBlendEx (dsurface, SurfaceX(Left), SurfaceY(Top), d, 0, 0, Width, Height, 0);
    with dsurface do begin
      SetBkMode (Canvas.Handle, TRANSPARENT);
      rc := Bounds(Left, Top, DGuildMarkDlg.Width, DGuildMarkDlg.Height);
      Canvas.Brush.Color := clLime;
      Canvas.FrameRect(rc);
      Canvas.Release;
    end;

    for i := Low(g_MarkIndexInfo) to High(g_MarkIndexInfo) do begin
      ax := left + (i) mod FACESHOWCOUNT * 32 + 6;
      ay := Top + +(i) div FACESHOWCOUNT * 32 + 6;
      d := g_WGuildImages.GetCachedSurface(g_MarkIndexInfo[i].ImageIndex);
      if d <> nil then
        dsurface.Draw(ax, ay, d.ClientRect, d, True);;
      if GuldSelectindex = i then begin
        with dsurface do begin
          SetBkMode (Canvas.Handle, TRANSPARENT);
          rc := Bounds(ax - 4, ay - 4, d.Width + 8, d.Height + 8);
          Canvas.Brush.Color := clYellow;
          Canvas.FrameRect(rc);
          Canvas.Release;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DGuildMarkDlgMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  ShowMsg: string;
begin
  GuldSelectindex := (X - DGuildMarkDlg.Left) div 32 + (y - DGuildMarkDlg.Top) div 32 * FACESHOWCOUNT;
  with Sender as TDWindow do begin
    ShowMsg := '选择的图像被指定为装饰物品\价格: <CO$FF00>10,000,000金币<CE>\选择方法: 鼠标左键点击 \退出: 鼠标右键点击';
    DScreen.ShowHintA(x + 10, y + 30, ShowMsg, clWhite, False);
  end;
end;

procedure TFrmDlg2.DGuildMarkDlgDblClick(Sender: TObject);
begin
  if (GuldSelectindex > -1) and (GuldSelectindex <= High(g_MarkIndexList)) then begin
    FrmMain.SendGuildSet(GuldSelectindex + 1);
    DGuildMarkDlg.Visible := FALSE;
  end;
end;

procedure TFrmDlg2.DGuildMarkDlgMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then begin
    DGuildMarkDlg.Visible := FALSE;
  end;
end;

procedure TFrmDlg2.DInputKey0Click(Sender: TObject; X, Y: Integer);
var
  EdDlgEdit:hwnd;
  keyname:integer;
begin
  keyname := 0;
  EdDlgEdit := GetFocus;
  if Sender = DInputKey0 then begin
  keyname := $30;
  end;
  if Sender = DInputKey1 then begin
  keyname := $31;
  end;
  if Sender = DInputKey2 then begin
  keyname := $32;
  end;
  if Sender = DInputKey3 then begin
  keyname := $33;
  end;
  if Sender = DInputKey4 then begin
  keyname := $34;
  end;
  if Sender = DInputKey5 then begin
  keyname := $35;
  end;
  if Sender = DInputKey6 then begin
  keyname := $36;
  end;
  if Sender = DInputKey7 then begin
  keyname := $37;
  end;
  if Sender = DInputKey8 then begin
  keyname := $38;
  end;
  if Sender = DInputKey9 then begin
  keyname := $39;
  end;
  if Sender = DInputKeya then begin
  keyname := 65;
  end;
  if Sender = DInputKeyb then begin
  keyname := 66;
  end;
  if Sender = DInputKeyc then begin
  keyname := 67;
  end;
  if Sender = DInputKeyd then begin
  keyname := 68;
  end;
  if Sender = DInputKeye then begin
  keyname := 69;
  end;
  if Sender = DInputKeyf then begin
  keyname := 70;
  end;
  if Sender = DInputKeyg then begin
  keyname := 71;
  end;
  if Sender = DInputKeyh then begin
  keyname := 72;
  end;
  if Sender = DInputKeyi then begin
  keyname := 73;
  end;
  if Sender = DInputKeyj then begin
  keyname := 74;
  end;
  if Sender = DInputKeyk then begin
  keyname := 75;
  end;
  if Sender = DInputKeyl then begin
  keyname := 76;
  end;
  if Sender = DInputKeym then begin
  keyname := 77;
  end;
  if Sender = DInputKeyn then begin
  keyname := 78;
  end;
  if Sender = DInputKeyo then begin
  keyname := 79;
  end;
  if Sender = DInputKeyp then begin
  keyname := 80;
  end;
  if Sender = DInputKeyq then begin
  keyname := 81;
  end;
  if Sender = DInputKeyr then begin
  keyname := 82;
  end;
  if Sender = DInputKeys then begin
  keyname := 83;
  end;
  if Sender = DInputKeyt then begin
  keyname := 84;
  end;
  if Sender = DInputKeyu then begin
  keyname := 85;
  end;
  if Sender = DInputKeyv then begin
  keyname := 86;
  end;
  if Sender = DInputKeyw then begin
  keyname := 87;
  end;
  if Sender = DInputKeyx then begin
  keyname := 88;
  end;
  if Sender = DInputKeyy then begin
  keyname := 89;
  end;
  if Sender = DInputKeyz then begin
  keyname := 90;
  end;
  PostMessage(EdDlgEdit,WM_KEYDOWN,keyname,0);
end;

procedure TFrmDlg2.DLoginNewClickSound(Sender: TObject;
  Clicksound: TClickSound);
begin
   case Clicksound of
      csNorm:  PlaySound (s_norm_button_click);
      csStone: PlaySound (s_rock_button_click);
      csGlass: PlaySound (s_glass_button_click);
   end;
end;

procedure TFrmDlg2.DInputKeyEscDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   keyview:string;               //肺弊牢 焊炼(付快胶努腐)
begin
  if Sender = DInputKey0 then begin
  keyview := '0';
  end;
  if Sender = DInputKey1 then begin
  keyview := '1';
  end;
  if Sender = DInputKey2 then begin
  keyview := '2';
  end;
  if Sender = DInputKey3 then begin
  keyview := '3';
  end;
  if Sender = DInputKey4 then begin
  keyview := '4';
  end;
  if Sender = DInputKey5 then begin
  keyview := '5';
  end;
  if Sender = DInputKey6 then begin
  keyview := '6';
  end;
  if Sender = DInputKey7 then begin
  keyview := '7';
  end;
  if Sender = DInputKey8 then begin
  keyview := '8';
  end;
  if Sender = DInputKey9 then begin
  keyview := '9';
  end;
  if Sender = DInputKeya then begin
  keyview := 'A';
  end;
  if Sender = DInputKeyb then begin
  keyview := 'B';
  end;
  if Sender = DInputKeyc then begin
  keyview := 'C';
  end;
  if Sender = DInputKeyd then begin
  keyview := 'D';
  end;
  if Sender = DInputKeye then begin
  keyview := 'E';
  end;
  if Sender = DInputKeyf then begin
  keyview := 'F';
  end;
  if Sender = DInputKeyg then begin
  keyview := 'G';
  end;
  if Sender = DInputKeyh then begin
  keyview := 'H';
  end;
  if Sender = DInputKeyi then begin
  keyview := 'I';
  end;
  if Sender = DInputKeyj then begin
  keyview := 'J';
  end;
  if Sender = DInputKeyk then begin
  keyview := 'K';
  end;
  if Sender = DInputKeyl then begin
  keyview := 'L';
  end;
  if Sender = DInputKeym then begin
  keyview := 'M';
  end;
  if Sender = DInputKeyn then begin
  keyview := 'N';
  end;
  if Sender = DInputKeyo then begin
  keyview := 'O';
  end;
  if Sender = DInputKeyp then begin
  keyview := 'P';
  end;
  if Sender = DInputKeyq then begin
  keyview := 'Q';
  end;
  if Sender = DInputKeyr then begin
  keyview := 'R';
  end;
  if Sender = DInputKeys then begin
  keyview := 'S';
  end;
  if Sender = DInputKeyt then begin
  keyview := 'T';
  end;
  if Sender = DInputKeyu then begin
  keyview := 'U';
  end;
  if Sender = DInputKeyv then begin
  keyview := 'V';
  end;
  if Sender = DInputKeyw then begin
  keyview := 'W';
  end;
  if Sender = DInputKeyx then begin
  keyview := 'X';
  end;
  if Sender = DInputKeyy then begin
  keyview := 'Y';
  end;
  if Sender = DInputKeyz then begin
  keyview := 'Z';
  end;
   with Sender as TDButton do begin
      if Downed then begin
         d := WLib.Images[FaceIndex+2]
      end else
      if MouseMoveing then begin
        d := WLib.Images[FaceIndex+1];
      end else begin
        d := WLib.Images[FaceIndex];
      end;

      if d <> nil then
         dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
          SetBkMode (dsurface.Canvas.Handle, TRANSPARENT);
          dsurface.Canvas.Font.Size :=9;
          if TDButton(Sender).Downed then begin
            BoldTextOut (dsurface, SurfaceX(Left + (d.Width - dsurface.Canvas.TextWidth(keyview)) div 2 -5), SurfaceY(Top + (d.Height -dsurface.Canvas.TextHeight(keyview)) div 2) + 4, clWhite , clBlack, keyview);
          end else begin
            BoldTextOut (dsurface, SurfaceX(Left + (d.Width - dsurface.Canvas.TextWidth(keyview)) div 2 -5), SurfaceY(Top + (d.Height -dsurface.Canvas.TextHeight(keyview)) div 2) + 4, clWhite , clBlack, keyview);
          end;
      dsurface.Canvas.Font.Size :=9;
      dsurface.Canvas.Release;
   end;
end;

procedure TFrmDlg2.DInputKeyEscClick(Sender: TObject; X, Y: Integer);
begin
   DInputKey.Visible := FALSE;
end;

procedure TFrmDlg2.DInputKeyDelClick(Sender: TObject; X, Y: Integer);
var
  EdDlgEdit:hwnd;
  keyname:integer;
begin
  EdDlgEdit := GetFocus;
  PostMessage(EdDlgEdit,WM_KEYDOWN,8,0);
end;

procedure TFrmDlg2.DInputkeyRandClick(Sender: TObject; X, Y: Integer);
var
  i: integer;
  aDButton: Array[0..35] of TDButton;
  aold: TPoint;
  iSwap: Integer;
begin
  aDButton[0] := DInputKey0;
  aDButton[1] := DInputKey1;
  aDButton[2] := DInputKey2;
  aDButton[3] := DInputKey3;
  aDButton[4] := DInputKey4;
  aDButton[5] := DInputKey5;
  aDButton[6] := DInputKey6;
  aDButton[7] := DInputKey7;
  aDButton[8] := DInputKey8;
  aDButton[9] := DInputKey9;
  aDButton[10] := DInputKeya;
  aDButton[11] := DInputKeyb;
  aDButton[12] := DInputKeyc;
  aDButton[13] := DInputKeyd;
  aDButton[14] := DInputKeye;
  aDButton[15] := DInputKeyf;
  aDButton[16] := DInputKeyg;
  aDButton[17] := DInputKeyh;
  aDButton[18] := DInputKeyi;
  aDButton[19] := DInputKeyj;
  aDButton[20] := DInputKeyk;
  aDButton[21] := DInputKeyl;
  aDButton[22] := DInputKeym;
  aDButton[23] := DInputKeyn;
  aDButton[24] := DInputKeyo;
  aDButton[25] := DInputKeyp;
  aDButton[26] := DInputKeyq;
  aDButton[27] := DInputKeyr;
  aDButton[28] := DInputKeys;
  aDButton[29] := DInputKeyt;
  aDButton[30] := DInputKeyu;
  aDButton[31] := DInputKeyv;
  aDButton[32] := DInputKeyw;
  aDButton[33] := DInputKeyx;
  aDButton[34] := DInputKeyy;
  aDButton[35] := DInputKeyz;

  for i := 0 to 35 do
  begin
    aold.X := aDButton[i].Left;
    aold.Y := aDButton[i].Top;
    iSwap := Random(36);
    while iSwap = i do
    begin
      iSwap := Random(36);
    end;
    aDButton[i].Left := aDButton[iSwap].Left;
    aDButton[i].Top := aDButton[iSwap].Top;
    aDButton[iSwap].Left := aold.X;
    aDButton[iSwap].Top := aold.Y;
  end;
end;

procedure TFrmDlg2.DInputKeyEnterClick(Sender: TObject; X, Y: Integer);
var
  EdDlgEdit:hwnd;
  keyname:integer;
begin
  EdDlgEdit := GetFocus;
  PostMessage(EdDlgEdit,WM_KEYDOWN,13,0);
end;

procedure TFrmDlg2.DWindowTopDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay: integer;
  sTitle: string;
begin
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    d := WLib.Images[FaceIndex];
    if d <> nil then
     dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);

    DTopFirst.Enabled := FnMinTopPage > 0;
    DTopUp.Enabled := FnMinTopPage > 0;
    DTopDown.Enabled := FnMinTopPage < (FnMaxTopPage - 1);
    DTopLastly.Enabled := FnMinTopPage < (FnMaxTopPage - 1);
    if FTopIndex = 13 then begin
      d := g_WAresImages.Images[319];
    end else
      d := g_WAresImages.Images[318];
    if d <> nil then
     dsurface.Draw (SurfaceX(Left + 33), SurfaceY(Top + 84), d.ClientRect, d, TRUE);

    with dsurface.Canvas do begin
      SetBkMode (Handle, TRANSPARENT);
      sTitle := IntToStr(FnMinTopPage + 1) + '/' + IntToStr(FnMaxTopPage);
      TextOutA(dsurface, ax + 350 - (TextWidth(sTitle) div 2), ay + 319, clWhite, sTitle);

      sTitle := '';
      case FTopIndex of
        0..5, 13:sTitle := '等级';
        6: sTitle := '攻击';
        7: sTitle := '魔法';
        8: sTitle := '道术';
        9: sTitle := '金币';
        10: sTitle := '经验值';
        11: sTitle := '杀敌(Kill)';
        12: sTitle := '死亡(Death)';
        14: sTitle := '点券';
      end;
      TextOutA(dsurface, ax + 41, ay + 90, $33FFCC, '排行');
      TextOutA(dsurface, ax + 93, ay + 90, $33FFCC, '角色名称');

      TextOutA(dsurface, ax + 41 + 319, ay + 90, $33FFCC, '排行');
      TextOutA(dsurface, ax + 93 + 319, ay + 90, $33FFCC, '角色名称');
      if FTopIndex = 13 then begin
        TextOutA(dsurface, ax + 174, ay + 90, $33FFCC, '职业 ');
        TextOutA(dsurface, ax + 232 - TextWidth(sTitle) div 2, ay + 90, $33FFCC, sTitle);
        TextOutA(dsurface, ax + 287, ay + 90, $33FFCC, '林牢');

        TextOutA(dsurface, ax + 173 + 319, ay + 90, $33FFCC, '职业 ');
        TextOutA(dsurface, ax + 231 + 319 - TextWidth(sTitle) div 2, ay + 90, $33FFCC, sTitle);
        TextOutA(dsurface, ax + 285 + 319, ay + 90, $33FFCC, '林牢');
      end else begin
        TextOutA(dsurface, ax + 182, ay + 90, $33FFCC, '职业 ');
        TextOutA(dsurface, ax + 286 - TextWidth(sTitle) div 2, ay + 90, $33FFCC, sTitle);
        TextOutA(dsurface, ax + 182 + 319, ay + 90, $33FFCC, '职业 ');
        TextOutA(dsurface, ax + 286 + 319 - TextWidth(sTitle) div 2, ay + 90, $33FFCC, sTitle);
      end;
      if FTopIndex = 13 then begin

      end;
      Release;
    end;
  end;
end;

procedure TFrmDlg2.DTopList1DirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
const
  SexName: array[0..1] of string[2] = ('男', '女');
var
  ax, ay, Image: integer;
  sTitle: string;
  I, n: Integer;
  d: TDirectDrawSurface;
  fColor: TColor;
  rc: TRect;
begin
  if g_MySelf = nil then Exit;
  Image := 0;
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    with dsurface.Canvas do begin
      n := FTopMoveIndex;
      if Tag = 0 then begin
        if n >= 0 then begin
          if n < 10 then begin
            SetBkMode (Handle, TRANSPARENT);
            rc := Bounds(ax + 1, ay + 4 + 16 * n, Width, 16);
            Brush.Color := clGray;
            FrameRect(rc);
            Release;
          end;
        end;
      end else begin
        Dec(n, 10);
        if (n >= 0) and (n < 10) then begin
          SetBkMode (Handle, TRANSPARENT);
          rc := Bounds(ax + 1, ay + 4 + 16 * n, Width, 16);
          Brush.Color := clGray;
          FrameRect(rc);
          Release;
        end;
      end;
      for I := 0 to 9 do begin
        n := I + Tag * 10;
        if FTopInfo[n].sChrName = '' then break;
        fColor := clWhite;
        if FTopInfo[n].sChrName = g_MySelf.m_sUserName then fColor := clYellow;

        if (FnMinTopPage = 0) and (n in [0..2]) then begin
          d := g_WAresImages.Images[310 + n];
          if d <> nil then dsurface.Draw(ax + 9, ay + 5 + 16 * i, d, True);
        end else begin
          SetBkMode (Handle, TRANSPARENT);
          TextOutA(dsurface, ax + 15 - TextWidth(IntToStr(n + FnMinTopPage * 20 + 1)) div 2, ay + 6 + 16 * i, fColor, IntToStr(n + FnMinTopPage * 20 + 1));
          Release;
        end;
        SetBkMode (Handle, TRANSPARENT);
        TextOutA(dsurface, ax + 82 - TextWidth(FTopInfo[n].sChrName) div 2, ay + 6 + 16 * i, fColor, FTopInfo[n].sChrName);
        if FTopIndex = 13 then begin
          TextOutA(dsurface, ax + 151 - TextWidth(GetJobName(FTopInfo[n].btJob)) div 2, ay + 6 + 16 * i, fColor, GetJobName(FTopInfo[n].btJob));
          sTitle := IntToStr(FTopInfo[n].dwCount);
          TextOutA(dsurface, ax + 196 - TextWidth(sTitle) div 2, ay + 6 + 16 * i, fColor, sTitle);
          TextOutA(dsurface, ax + 264 - TextWidth(FTopInfo[n].sMasName) div 2, ay + 6 + 16 * i, fColor, FTopInfo[n].sMasName);
        end else begin
          TextOutA(dsurface, ax + 159 - TextWidth(GetJobName(FTopInfo[n].btJob)) div 2, ay + 6 + 16 * i, fColor, GetJobName(FTopInfo[n].btJob));
          if FTopIndex in [8,9,10,11,12] then sTitle := GetGoldStr(FTopInfo[n].dwCount)
           else sTitle := IntToStr(FTopInfo[n].dwCount);
          TextOutA(dsurface, ax + 250 - TextWidth(sTitle) div 2, ay + 6 + 16 * i, fColor, sTitle);
        end;
       Release;
      end;

    end;
  end;
end;

procedure TFrmDlg2.DTopCloseDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   with Sender as TDButton do begin
      if Downed then begin
         d := WLib.Images[FaceIndex + 2];
      end else
      if MouseMoveing then begin
         d := WLib.Images[FaceIndex + 1];
      end else begin
         d := WLib.Images[FaceIndex];
      end;
      if d <> nil then
          dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
   end;
end;

procedure TFrmDlg2.DTopCloseClick(Sender: TObject; X, Y: Integer);
var
  d: TDButton;
begin
  if Sender is TDButton then begin
    d := TDButton(Sender);
    if d.DParent <> nil then
      d.DParent.Visible := False;
  end;
end;

procedure TFrmDlg2.DWindowTopVisible;
begin
  if DWindowTop.Visible then begin
    FTopMoveIndex := -1;
    if not FboTopSend then begin
      FnMaxTopPage := 0;
      FnMinTopPage := 0;
      SendClientMessage(CM_GETTOPINFO, FTopIndex, 0, 0, 0, '');
      FboTopSend := True;
    end;
  end;
end;

procedure TFrmDlg2.DWindowTopMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FTopMoveIndex := -1;
  DScreen.ClearHint;
end;

procedure TFrmDlg2.DTopList1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FTopMoveIndex := -1;
  with Sender as TDWindow do begin
    Dec(y, Top);
    FTopMoveIndex := (Y - 4) div 16;
    if Tag = 0 then begin
      if FTopMoveIndex > 9 then FTopMoveIndex := -1;
    end else begin
      Inc(FTopMoveIndex, 10);
    end;
  end;
end;

procedure TFrmDlg2.DTopButton0DirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
begin
  with Sender as TDButton do begin
    if WLib <> nil then begin
      if FTopIndex <> tag then begin
        d := WLib.Images[FaceIndex + 1];
        if d <> nil then
          dsurface.Draw(SurfaceX(Left), SurfaceY(Top) + 2, d.ClientRect, d, True);
        with dsurface.Canvas do begin
          SetBkMode (Handle, TRANSPARENT);
          TextOutA(dsurface, SurfaceX(Left) + (Width - TextWidth(Caption)) div 2, SurfaceY(Top) + (Height - TextHeight(Caption)) div 2 + 1, clDkGray, Caption);
          Release;
        end;
      end else begin
        d := WLib.Images[FaceIndex];
        if d <> nil then
          dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
        with dsurface.Canvas do begin
          SetBkMode (Handle, TRANSPARENT);
          BoldTextOut(dsurface, SurfaceX(Left) + (Width - TextWidth(Caption)) div 2, SurfaceY(Top) + (Height - TextHeight(Caption)) div 2, clYellow, clBlack, Caption);
          Release;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DTopButton0Click(Sender: TObject; X, Y: Integer);
begin
  with Sender as TDButton do begin
    if (not FboTopSend) and (FTopIndex <> Tag) then begin
      FTopIndex := Tag;
      PlaySound(s_norm_button_click);
      FnMaxTopPage := 0;
      FnMinTopPage := 0;
      SendClientMessage(CM_GETTOPINFO, FTopIndex, 0, 0, 0, '');
      FboTopSend := True;
    end;
  end;
end;

procedure TFrmDlg2.DTopList1Click(Sender: TObject; X, Y: Integer);
begin
  if FTopMoveIndex in [Low(FTopInfo)..High(FTopInfo)] then begin
    if FTopInfo[FTopMoveIndex].sChrName <> '' then begin
      PlaySound(s_glass_button_click);
      PlayScene.SetEditChar(FTopInfo[FTopMoveIndex].sChrName);
    end;
  end;
end;

procedure TFrmDlg2.DTopFirstClick(Sender: TObject; X, Y: Integer);
begin
  if FboTopSend then Exit;

  if Sender = DTopFirst then begin
    if FnMinTopPage > 0 then begin
      SendClientMessage(CM_GETTOPINFO, FTopIndex, 0, 0, 0, '');
      FboTopSend := True;
    end;
  end else
  if Sender = DTopUp then begin
    if FnMinTopPage > 0 then begin
      SendClientMessage(CM_GETTOPINFO, FTopIndex, FnMinTopPage - 1, 0, 0, '');
      FboTopSend := True;
    end;
  end else
  if Sender = DTopDown then begin
    if FnMinTopPage < (FnMaxTopPage - 1) then begin
      SendClientMessage(CM_GETTOPINFO, FTopIndex, FnMinTopPage + 1, 0, 0, '');
      FboTopSend := True;
    end;
  end else
  if Sender = DTopLastly then begin
    if FnMinTopPage < (FnMaxTopPage - 1) then begin
      SendClientMessage(CM_GETTOPINFO, FTopIndex, FnMaxTopPage - 1, 0, 0, '');
      FboTopSend := True;
    end;
  end else
  if Sender = DTopMy then begin
    SendClientMessage(CM_GETTOPINFO, FTopIndex, 0, 0, 1, '');
    FboTopSend := True;
  end;
end;




procedure TFrmDlg2.DWndFaceDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  i, nx, ny, ax, ay: Integer;
  py: smallint;
  rc: TRect;
begin
  with Sender as TDWindow do begin
    d := WLib.Images[FaceIndex];
    if d <> nil then
     DrawBlendEx (dsurface, SurfaceX(Left), SurfaceY(Top), d, 0, 0, Width, Height, 0);
    with dsurface do begin
      SetBkMode (Canvas.Handle, TRANSPARENT);
      rc := Bounds(Left, Top, DWndFace.Width, DWndFace.Height);
      Canvas.Brush.Color := clLime;
      Canvas.FrameRect(rc);
      Canvas.Release;
    end;

    for i := Low(g_FaceIndexInfo) to High(g_FaceIndexInfo) do begin
      ax := left + (i) mod FACESHOWCOUNT * 24 + 4;
      ay := Top + +(i) div FACESHOWCOUNT * 24 + 4;
      d := g_WFaceImages.GetCachedImage(g_FaceIndexInfo[i].ImageIndex, nx, ny);
      if d <> nil then begin
        dsurface.Draw(ax, ay, d.ClientRect, d, True);
        py := ny;
        if (GetTickCount - g_FaceIndexInfo[i].dwShowTime) > LongWord(nx) then begin
          g_FaceIndexInfo[i].ImageIndex := g_FaceIndexInfo[i].ImageIndex + py;
          g_FaceIndexInfo[i].dwShowTime := GetTickCount;
        end;
      end;
      if FaceSelectindex = i then begin
        with dsurface do begin
          SetBkMode (Canvas.Handle, TRANSPARENT);
          rc := Bounds(ax - 2, ay - 4, d.Width + 4, d.Height + 4);
          Canvas.Brush.Color := clYellow;
          Canvas.FrameRect(rc);
          Canvas.Release;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DWndFaceMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  ShowMsg: string;
begin
  FaceSelectindex := (X - DWndFace.Left) div 24 + (y - DWndFace.Top) div 24 * FACESHOWCOUNT;
  with Sender as TDWindow do begin
    if FaceSelectindex in [Low(g_FaceIndexInfo)..High(g_FaceIndexInfo)] then begin
      ShowMsg := g_FaceTextList1[FaceSelectindex];
      DScreen.ShowHintA(x + 10, y + 30, ShowMsg, clWhite, True);
    end;
  end;
end;

procedure TFrmDlg2.DWndFaceClick(Sender: TObject; X, Y: Integer);
var
  sData,sData1,sData2:String;
begin
  if (FaceSelectindex > -1) and (FaceSelectindex <= High(g_FaceIndexList)) then begin
    if not PlayScene.EdChat.Visible then begin
      PlayScene.EdChat.Visible := True;
      PlayScene.EdChat.SetFocus;
    end;
    if PlayScene.EdChat.SelStart = Length(PlayScene.EdChat.Text) then begin
      PlayScene.EdChat.Text := PlayScene.EdChat.Text +  '|' + IntToStr(FaceSelectindex) + '|';
      PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text);
    end else begin
      sData := Copy(PlayScene.EdChat.Text, 1, PlayScene.EdChat.SelStart);
      sData1 := Copy(PlayScene.EdChat.Text, PlayScene.EdChat.SelStart + 1, Length(PlayScene.EdChat.Text) - PlayScene.EdChat.SelStart);
      sData2 := '|' + IntToStr(FaceSelectindex) + '|';
      PlayScene.EdChat.Text := sData + sData2 + sData1;
      PlayScene.EdChat.SelStart := Length(PlayScene.EdChat.Text) - Length(WideString(sData1));
    end;
    PlayScene.EdChat.SelLength := 0;
    SetImeMode (PlayScene.EdChat.Handle, imSHanguel);
  //  DWndFace.Visible := False;
  end;
end;

procedure TFrmDlg2.DWndFaceMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then begin
    DWndFace.Visible := FALSE;
  end;
end;

procedure TFrmDlg2.DWinFriendDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay: integer;
  str: string;
begin
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    d := WLib.Images[FaceIndex];
    if d <> nil then
      dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);

    d := g_WTitleImages.Images[6];
    if d <> nil then
      dsurface.Draw(SurfaceX(Left + 32), SurfaceY(Top + 5), d.ClientRect, d, TRUE);
    with dsurface.Canvas do begin
      case FriendIndex of
      0: begin
          DFriAddMem.Visible := True;
          DFriDelMem.Visible := True;
          DFriDelMem.Enabled := (FriendSelect <> -1);
        end;
      1: begin
          DFriAddMem.Visible := True;
          DFriDelMem.Visible := True;
          DFriDelMem.Enabled := (FriendSelect <> -1);
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DFriFriendDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  idx: integer;
begin
  with Sender as TDButton do begin
    if WLib <> nil then begin
      idx := FaceIndex;
      if FriendIndex <> tag then begin
        Inc(idx, 1);
      end;
      d := WLib.Images[idx];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
    end;
  end;
end;

procedure TFrmDlg2.DFriFriendClick(Sender: TObject; X, Y: Integer);
begin
  with Sender as TDButton do begin
    if FriendIndex <> Tag then begin
      FriendIndex := Tag;
      FriendSelect := -1;
      FriendMove := -1;
    end;
  end;
end;

procedure TFrmDlg2.DFriAddMemClick(Sender: TObject; X, Y: Integer);
begin
  case FriendIndex of
    0: begin
        FrmDlg.DMessageDlg('请输入要加为好友的角色的名字。', [mbOk, mbAbort]);
        if Trim(FrmDlg.DlgEditText) <> '' then begin
          if CompareText(Trim(FrmDlg.DlgEditText), g_MySelf.m_sUserName) = 0then begin
            FrmDlg.DMessageDlg ('你不能添加自己为好友。', [mbOk]);
            Exit;
          end;
          if g_MyBlacklist.IndexOf(Trim(FrmDlg.DlgEditText)) = 0 then begin
            FrmDlg.DMessageDlg (Trim(FrmDlg.DlgEditText)+'拒绝被加为好友。', [mbOk]);
            exit;
          end;
          if g_FriendList.IndexOf(Trim(FrmDlg.DlgEditText)) = 0 then begin
            FrmDlg.DMessageDlg (Trim(FrmDlg.DlgEditText)+'已经是你的好友了。', [mbOk]);
            exit;
          end;
          if g_FriendList.Count >= (MAXFRIENDS) then begin
            FrmDlg.DMessageDlg ('你的好友已经达到允许的最大数值了。', [mbOk]);
            exit;
          end;
          SendClientMessage(CM_FRIEND_CHENGE, 0, 0, 0, 0, Trim(FrmDlg.DlgEditText));
        end;
      end;
    1: begin
        FrmDlg.DMessageDlg('请输入你要加为好友的玩家的名字。', [mbOk, mbAbort]);
        if Trim(FrmDlg.DlgEditText) <> '' then begin
          if g_MyBlacklist.Count >= (MAXFRIENDS) then begin
            FrmDlg.DMessageDlg ('你的好友已经达到允许的最大数值了。', [mbOk]);
            exit;
          end;
          if g_FriendList.IndexOf(Trim(FrmDlg.DlgEditText)) = 0 then begin
            FrmDlg.DMessageDlg (Trim(FrmDlg.DlgEditText)+'已经成为了你的好友。', [mbOk]);
            exit;
          end;
          if g_MyBlacklist.IndexOf(Trim(FrmDlg.DlgEditText)) = -1 then begin
            g_MyBlacklist.Add(Trim(FrmDlg.DlgEditText))
          end;
        end;
      end;
  end;
end;

procedure TFrmDlg2.DFriDelMemClick(Sender: TObject; X, Y: Integer);
var
  idx: integer;
begin
  case FriendIndex of
    0: begin
        if (FriendSelect > -1) and (FriendSelect < g_FriendList.Count) then begin
          if not fLover.Find( g_FriendList[FriendSelect] ) then begin
            // Copy(fLover.GetDisplay(0), length(STR_LOVER)+1, 20) <> g_FriendList[FriendSelect] then begin
            if mrYes = FrmDlg.DMessageDlg('你确定要将' + g_FriendList[FriendSelect] + '从好友列表中删除吗？', [mbYes, mbNo]) then begin
              SendClientMessage(CM_FRIEND_CHENGE, 0, 0, 0, 1, g_FriendList[FriendSelect]);
              g_FriendList.Delete(FriendSelect);
            end;
          end else begin
            FrmDlg.DMessageDlg('你们之间是夫妻关系，无法删除。', [mbOk]);
            exit;
          end;
        end else begin
          FrmDlg.DMessageDlg('请输入您要从朋友列表中删除的人的名称。 ', [mbOk, mbAbort]);
          if Trim(FrmDlg.DlgEditText) <> '' then begin
            idx := g_FriendList.IndexOf(Trim(FrmDlg.DlgEditText));
            if Idx <> -1 then begin
              if not fLover.Find( Trim(FrmDlg.DlgEditText) ) then begin
                SendClientMessage(CM_FRIEND_CHENGE, 0, 0, 0, 1, Trim(FrmDlg.DlgEditText));
                g_FriendList.Delete(idx);
              end else begin
                FrmDlg.DMessageDlg('你们之间是夫妻关系，无法删除。', [mbOk]);
                exit;
              end;
            end;
          end;
        end;
      end;
    1: begin
        if (FriendSelect > -1) and (FriendSelect < g_MyBlacklist.Count) then begin
          g_MyBlacklist.Delete(FriendSelect);
        end
        else begin
          FrmDlg.DMessageDlg('请输入你要加为黑名单的玩家的名字。', [mbOk, mbAbort]);
          if Trim(FrmDlg.DlgEditText) <> '' then begin
            idx := g_MyBlacklist.IndexOf(Trim(FrmDlg.DlgEditText));
            if idx <> -1 then begin
              g_MyBlacklist.Delete(idx);
            end;
          end;
        end;
      end;
  end;
end;

procedure TFrmDlg2.DFriWin1DirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  ax, ay, I, n: integer;
  ShowList: TStringList;
  FontColor: TColor;
begin
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    with dsurface.Canvas do begin
      ShowList := nil;
      FontColor := $00C5D2BD;
      case FriendIndex of
        0: begin
            ShowList := g_FriendList;
          end;
        1: begin
            ShowList := g_MyBlacklist;
          end;
      end;
      if ShowList <> nil then begin
        for I := 0 to 10 do begin
          n := I + Tag * 11;
          if n >= ShowList.Count then break;
          if n = FriendMove then begin
            if Tag = 0 then begin
              if n >= 0 then begin
                if n < 11 then begin
                  dsurface.FillRectAlpha(Rect(ax, ay + 16 * n,  ax + Width, (ay + 16 * n) + 16), clLtGray, 125);
                end;
              end;
            end else begin
              if ((n - 10) >= 0) and ((n - 10) < 11) then begin
                dsurface.FillRectAlpha(Rect(ax, ay + 16 * (n - 11),  ax + Width, (ay + 16 * (n - 11)) + 16), clLtGray, 125);
              end;
            end;
          end;
          if n = FriendSelect then begin
            if Tag = 0 then begin
              if n >= 0 then begin
                if n < 11 then begin
                  dsurface.FillRectAlpha(Rect(ax, ay + 16 * n,  ax + Width, (ay + 16 * n) + 16), clLtGray, 165);
                end;
              end;
            end else begin
              if ((n - 10) >= 0) and ((n - 10) < 11) then begin
                dsurface.FillRectAlpha(Rect(ax, ay + 16 * (n - 11),  ax + Width, (ay + 16 * (n - 11)) + 16), clLtGray, 165);
              end;
            end;
          end;
          if FriendIndex = 0 then begin
            if Integer(ShowList.Objects[n]) = 1 then
              FontColor := clLime
            else
              FontColor := $607275;
          end;
          SetBkMode (Handle, TRANSPARENT);
           if fLover.Find( ShowList[n] ) then begin
              TextOutA(dsurface, ax + 4, ay + I * 16 + 2, FontColor, '⒔'+ShowList[n]);
           end else begin
             TextOutA(dsurface, ax + 4, ay + I * 16 + 2, FontColor, ShowList[n]);
           end;
          Release;
        end;
      end;
    end;
  end;
end;

procedure TFrmDlg2.DFriWin1DblClick(Sender: TObject);
begin
  case FriendIndex of
    0: begin
        if (FriendSelect > -1) and (FriendSelect < g_FriendList.Count) then begin
          PlayScene.SetEditChar(g_FriendList[FriendSelect]);
        end;
      end;
  end;
end;

procedure TFrmDlg2.DFriWin1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FriendSelect := -1;
  with Sender as TDWindow do begin
    FriendSelect := (Y - Top) div 16;
    if Tag = 0 then begin
      if FriendSelect > 10 then FriendSelect := -1;
    end else begin
      Inc(FriendSelect, 11);
    end;
  end;
end;

procedure TFrmDlg2.DFriWin1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  FriendMove := -1;
  with Sender as TDWindow do begin
    FriendMove := (Y - Top) div 16;
    if Tag = 0 then begin
      if FriendMove > 10 then FriendMove := -1;
    end else begin
      Inc(FriendMove, 11);
    end;
  end;
end;

procedure TFrmDlg2.DFriWhisperClick(Sender: TObject; X, Y: Integer);
begin
  case FriendIndex of
    0: begin
        if (FriendSelect > -1) and (FriendSelect < g_FriendList.Count) then begin
          PlayScene.SetEditChar(g_FriendList[FriendSelect]);
        end;
      end;
  end;
end;

procedure TFrmDlg2.DFriMailClick(Sender: TObject; X, Y: Integer);
begin
  if (not FrmDlg.DMemo.Visible)then begin
    if (FriendSelect > -1) and (FriendSelect < g_FriendList.Count) then begin
      FrmDlg.ViewWindowData := 0;
      FrmDlg.MemoCharID := g_FriendList[FriendSelect];
      FrmDlg.ViewWindowNo   := VIEW_MAILSEND;
      FrmDlg.DMemoB1.SetImgIndex(g_WTitleImages, 190);
      FrmDlg.DMemoB2.SetImgIndex(g_WTitleImages, 193);
      FrmDlg.DMemoB1.Left:=30;
      FrmDlg.DMemoB1.Top:=265;
      FrmDlg.DMemoB2.Left:=134;
      FrmDlg.DMemoB2.Top:=265;
      FrmDlg.DMemoB3.Visible := False;
      FrmDlg.memoMail.Clear;
      FrmDlg.ShowEditMail;
    end;
  end;
end;

procedure TFrmDlg2.DFriMemoClick(Sender: TObject; X, Y: Integer);
begin
  SendClientMessage(CM_REQUESTFRIENDLIST, 0, 0, 0, 0,'');
end;

procedure TFrmDlg2.DFriAddMemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  nLocalX,nLocalY:Integer;
  nHintX,nHintY:Integer;
  Butt:TDButton;
  sStatus,sMsg: String;
  F: PTClientFriends;
begin
  DScreen.ClearHint;
  Butt:=TDButton(Sender);

  if Sender = DFriAddMem then sMsg := '增加'
  else if Sender = DFriDelMem then sMsg := '删除'
  else if Sender = DFriMemo then sMsg := '备注'
  else if Sender = DFriMail then sMsg := '邮件'
  else if Sender = DFriWhisper then sMsg := '私聊';


  nLocalX:=Butt.LocalX(X - Butt.Left);
  nLocalY:=Butt.LocalY(Y - Butt.Top);
  nHintX:=Butt.SurfaceX(Butt.Left) + DWinFriend.SurfaceX(DWinFriend.Left) + nLocalX;
  nHintY:=Butt.SurfaceY(Butt.Top) + DWinFriend.SurfaceY(DWinFriend.Top) + nLocalY;
  DScreen.ShowHintA(nHintX, nHintY, sMsg, clYellow, TRUE);
end;

procedure TFrmDlg2.DWinFriendMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  DScreen.ClearHint;
end;

procedure TFrmDlg2.DWndDeathDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
begin
  with Sender as TDWindow do begin
    d := WLib.Images[FaceIndex];
    if d <> nil then
     dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
  end;
end;

procedure TFrmDlg2.dbtnAcceptCureDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   ax, ay, n1C: Integer;
begin
   with Sender as TDButton do begin
      ax := SurfaceX(Left);
      ay := SurfaceY(Top);
      n1C := 0;
      if Downed then begin
         d := WLib.Images[FaceIndex + 2];
         Inc(n1C);
      end else
      if MouseMoveing then begin
         d := WLib.Images[FaceIndex + 1];
      end else begin
         d := WLib.Images[FaceIndex];
      end;
      if d <> nil then
          dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
   end;
end;

procedure TFrmDlg2.dbtnAcceptCureClick(Sender: TObject; X, Y: Integer);
var
  i: Integer;
begin
  if Sender = dbtnAcceptCure then begin   //付阑俊辑 何劝
    SendClientMessage(CM_ALIVE, 1, 0, 0, 0, '');
    DWndDeath.Visible := False;
  end;

  if Sender = dbtnAcceptAlive then begin  //何劝林巩辑
    for i := Low(g_ItemArr) to High(g_ItemArr) do begin
      if (g_ItemArr[i].s.Shape = 14) and (g_ItemArr[i].s.StdMode = 2) then begin
        SendClientMessage(CM_ALIVE, 2, 0, 0, 0, '');
        exit;
      end;
    end;
    FrmDlg.DMessageDlg('物品不存在。', [mbOK]);
  end;

  if Sender = dbtnAtOnceCure then
    FrmDlg.DBotLogoutClick(nil, 0, 0);
  if Sender = dbtnBackCure then
    FrmDlg.DBotExitClick(nil, 0, 0);
end;

procedure TFrmDlg2.DCreateHeroDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  I,img, ax, ay, fx, fy, tx, ty: integer;
  d, dd: TDirectDrawSurface;
begin

  with DCreateHero do begin
    DCreateHero.Left := (g_FScreenWidth - DCreateHero.Width) div 2;
    DCreateHero.Top := 20;
    if WLib <> nil then begin
      d := WLib.Images[FaceIndex];
      if d <> nil then begin
        dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);

         with dsurface do begin
           SetBkMode(Canvas.Handle, TRANSPARENT);
          i:=15;
          case HeroArr[HeroIndex].UserChr.Job of
           0: begin
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 1) , clWhite, clBlack, '以强壮的体力为基础，拥有在战场不易死亡的优势，擅长');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 2) , clWhite, clBlack, '使用多种重量的武器和超重的铠甲，与其他职业相比，具');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 3) , clWhite, clBlack, '有出色的生命和力量，所以擅长狩猎和肉搏战。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 5) , clWhite, clBlack, '能够使用多种多样的剑术，近距离使用破坏力强大的技能，');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 6) , clWhite, clBlack, '是最强的近身职业。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 8) , clWhite, clBlack, '但是没有远距离作战的能力，对远程攻击或者魔法攻击的');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 9) , clWhite, clBlack, '防御非常脆弱。因此，熟练的战士能用各种防御装备来弥');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 10) , clWhite, clBlack, '补自己的不足之处。');

           end;
           1: begin
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 1) , clWhite, clBlack, '不受位置和距离的限制，以长时间锻炼的内功为基础，可');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 2) , clWhite, clBlack, '以使用强大的魔法进行攻击。最华丽的主人公理所当然的');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 3) , clWhite, clBlack, '就是法师。法师在战场上对敌人而言是恐怖的存在，而对');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 4) , clWhite, clBlack, '我军来说可能是坚实的火力。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 6) , clWhite, clBlack, '但是，因为薄弱的体力和需要时间等待的魔法释放过程，');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 7) , clWhite, clBlack, '所以除了体力之外，还需要时刻将注意力集中在魔力的管');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 8) , clWhite, clBlack, '理上。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 10) , clWhite, clBlack, '在这些困难的过程中，高水平的法师将会对自己的控制力');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 11) , clWhite, clBlack, '和判断力感到自豪。');
           end;
           2: begin
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 1) , clWhite, clBlack, '道教的修炼者们对医术的造诣很深，擅长使用恢复术和');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 2) , clWhite, clBlack, '毒术,在剑术的使用上也有很高的造诣,是多才多艺的角');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 3) , clWhite, clBlack, '色。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 5) , clWhite, clBlack, '道士拥有这样的能力，在与其他人组队时能发挥其真正');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 6) , clWhite, clBlack, '的价值，享有很高的人气。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 8) , clWhite, clBlack, '为了活用多才多艺的能力，需要额外使用辅助工具才能');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 9) , clWhite, clBlack, '使用各种武功，所以当你开始体验道士角色时，要知道');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 10) , clWhite, clBlack, '道士是很难提高经验的角色，但是在参加多人组队时可');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 11) , clWhite, clBlack, '以帮助到大家,是受欢迎和受尊重的角色。');
           end;
           3: begin
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 1) , clWhite, clBlack, '经过对自我严酷地锻炼，以暗杀为目的刺客，以敏捷的');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 2) , clWhite, clBlack, '身体能力和多种多样的武功突袭冥想的敌人和敌方主要人');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 3) , clWhite, clBlack, '物，并对其造成致命打击，从而带领和引导自己的队伍取');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 4) , clWhite, clBlack, '得胜利。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 6) , clWhite, clBlack, '具有强大的魔法防御能力，同时可以用隐身术和焚身术的');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 7) , clWhite, clBlack, '状态给敌人带来混乱。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 9) , clWhite, clBlack, '但由于拥有魔法防御力和多样的攻击武器，所以物理防御');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 10) , clWhite, clBlack, '相对脆弱，一不小心就会面临危险的情况。');
           end;

           4: begin
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 1) , clWhite, clBlack, '一个能够针对敌人创造弱点并能够把战斗力向自己有');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 2) , clWhite, clBlack, '利的方向发展的，卓越的僧侣可以利用各种情况进行');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 3) , clWhite, clBlack, '强力的攻击。');

           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 5) , clWhite, clBlack, '通过使用和敌人的距离杀敌，拥有更强的破坏力。');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 6) , clWhite, clBlack, '但是，比其他职业更脆弱的体力，更容易遇到危险');
           BoldTextOut(dsurface, SurfaceX(Left+ 330), SurfaceY(Top + 53 + i * 7) , clWhite, clBlack, '缓慢的攻击速度很容易输给敌人。');
           end;

          end;
          Canvas.Release;
         end;

      end;
      fx := 0;
      fy := 0;
      tx := 0;
      ty := 0;
      with dsurface do begin
        if HeroArr[HeroIndex].Selected then begin   //某腐 急琶
          case HeroArr[HeroIndex].UserChr.Job of
            0: begin
               if HeroArr[HeroIndex].UserChr.Sex = 0 then begin
                 fx := DCreateHero.Left + 180;
                 fy := DCreateHero.Top + 218;
                 tx := - 10;
                 ty := 0;
               end else begin
                 fx := DCreateHero.Left + 180;
                 fy := DCreateHero.Top + 136;
                 tx := - 3;
                 ty := 70;
               end;
             end;
            1: begin
               if HeroArr[HeroIndex].UserChr.Sex = 0 then begin
                 fx := DCreateHero.Left + 175;
                 fy := DCreateHero.Top + 210;
                 tx := - 28;
                 ty := - 64;
               end else begin
                 fx := DCreateHero.Left + 175;
                 fy := DCreateHero.Top + 218;
                 tx := 0;
                 ty := 0;
               end;
             end;
            2: begin
               if HeroArr[HeroIndex].UserChr.Sex = 0 then begin
                 fx := DCreateHero.Left + 180;
                 fy := DCreateHero.Top + 210;
                 tx := 10;
                 ty := -75;
               end else begin
                 fx := DCreateHero.Left + 167;
                 fy := DCreateHero.Top + 205;
                 tx := -15;
                 ty := -65;
               end;
             end;
            3: begin
                 fx := DCreateHero.Left + 170;
                 fy := DCreateHero.Top + 145;
                 tx := 0;
                 ty := 0;
             end;
          end;
          if HeroArr[HeroIndex].UserChr.Job = 3 then begin
            img := 320 + HeroArr[HeroIndex].UserChr.Job * 40 + HeroArr[HeroIndex].aniIndex + HeroArr[HeroIndex].UserChr.Sex * 20;
            d := g_WHeroChrSelImg.GetCachedImage(img, ax, ay);
            if (d <> nil) then begin
              if HeroArr[HeroIndex].DarkLevel > 0 then begin
                dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
                dd.SystemMemory := TRUE;
                dd.SetSize (d.Width, d.Height);
                dd.Draw (0, 0, d.ClientRect, d, FALSE);
                MakeDark (dd, 30-HeroArr[HeroIndex].DarkLevel);
                DrawBlend (dsurface, fx + tx + ax, fy + ty + ay, dd, 1);
                dd.Free;
              end else
                DrawBlend (dsurface, fx + tx + ax, fy + ty + ay, d, 1)
            end;
          end;

          img := HeroArr[HeroIndex].UserChr.Job * 80 + HeroArr[HeroIndex].aniIndex + HeroArr[HeroIndex].UserChr.Sex * 40;
          d := g_WHeroChrSelImg.GetCachedImage(img, ax, ay);
          if (d <> nil) then begin
            if HeroArr[HeroIndex].DarkLevel > 0 then begin
              dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
              dd.SystemMemory := TRUE;
              dd.SetSize (d.Width, d.Height);
              dd.Draw (0, 0, d.ClientRect, d, FALSE);
              MakeDark (dd, 30-HeroArr[HeroIndex].DarkLevel);
              dsurface.Draw (fx + ax, fy + ay, dd.ClientRect, dd, TRUE);
              dd.Free;
            end else
              dsurface.Draw (fx + ax, fy + ay, d.ClientRect, d, TRUE)
          end;
          if HeroArr[HeroIndex].UserChr.Job <> 3 then begin
            img := 320 + HeroArr[HeroIndex].UserChr.Job * 40 + HeroArr[HeroIndex].aniIndex + HeroArr[HeroIndex].UserChr.Sex * 20;
            d := g_WHeroChrSelImg.GetCachedImage(img, ax, ay);
            if (d <> nil) then begin
              if HeroArr[HeroIndex].DarkLevel > 0 then begin
                dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
                dd.SystemMemory := TRUE;
                dd.SetSize (d.Width, d.Height);
                dd.Draw (0, 0, d.ClientRect, d, FALSE);
                MakeDark (dd, 30-HeroArr[HeroIndex].DarkLevel);
                DrawBlend (dsurface, fx + tx + ax, fy + ty + ay, dd, 1);
                dd.Free;
              end else
                DrawBlend (dsurface, fx + tx + ax, fy + ty + ay, d, 1)
            end;
          end;
          if GetTickCount - HeroArr[HeroIndex].StartTime > 200 then begin
            HeroArr[HeroIndex].StartTime := GetTickCount;
            HeroArr[HeroIndex].aniIndex := HeroArr[HeroIndex].aniIndex + 1;
            if HeroArr[HeroIndex].aniIndex > 12-1 then HeroArr[HeroIndex].aniIndex := 0;
          end;
          if GetTickCount - HeroArr[HeroIndex].moretime > 75 then begin
            HeroArr[HeroIndex].moretime := GetTickCount;
            if HeroArr[HeroIndex].DarkLevel > 0 then HeroArr[HeroIndex].DarkLevel := HeroArr[HeroIndex].DarkLevel - 2;
          end;
        end;
      end;
      d := g_WTitleImages.Images[21];
      if d <> nil then
         dsurface.Draw (SurfaceX(Left+342), SurfaceY(Top+274), d.ClientRect, d, TRUE);
      d := g_WTitleImages.Images[22];
      if d <> nil then
         dsurface.Draw (SurfaceX(Left+342), SurfaceY(Top+315), d.ClientRect, d, TRUE);
      d := g_WTitleImages.Images[23];
      if d <> nil then
         dsurface.Draw (SurfaceX(Left+342), SurfaceY(Top+362), d.ClientRect, d, TRUE);
    end;
  end;

  if DCreateHero.Visible then begin
    FrmDlg.DItemBag.Visible := False;
    FrmDlg.DStateWin.Visible := False;
    FrmDlg.CancelItemMoving;
  end;
end;

procedure TFrmDlg2.HeroCloseClick(Sender: TObject; X, Y: Integer);
begin
  if Sender = HeroClose then FrmDlg.CloseCreateHero;
  if Sender = HeroWarrior then SelHeroNewJob(0);
  if Sender = HeroWizzard then SelHeroNewJob(1);
  if Sender = HeroMonk then SelHeroNewJob(2);
  if Sender = HeroAssassin then SelHeroNewJob(3);
  if Sender = HeroBonze then SelHeroNewJob(4);
  if Sender = HeroMale then SelHeroNewm_btSex(0);
  if Sender = HeroFemale then SelHeroNewm_btSex(1);
  if Sender = HeroOk then FrmDlg.CreateHeroOk;
end;

procedure TFrmDlg2.HeroCloseDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d, e: TDirectDrawSurface;
  img, ax, ay: integer;
begin
  with Sender as TDButton do begin
    if Downed then begin
      d := WLib.Images[FaceIndex + 2];
    end else
    if MouseMoveing then begin
      d := WLib.Images[FaceIndex + 1];
    end else begin
      d := WLib.Images[FaceIndex];
    end;
    if d <> nil then begin
        dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end;

      if Sender = HeroWarrior then begin
          if (HeroArr[HeroIndex].UserChr.job = 0) and (WLib <> nil) then d := WLib.Images[597];
      end;
      if Sender = HeroWizzard then begin
          if (HeroArr[HeroIndex].UserChr.job = 1) and (WLib <> nil) then d := WLib.Images[600];
      end;
      if Sender = HeroMonk then begin
          if (HeroArr[HeroIndex].UserChr.job = 2) and (WLib <> nil) then d := WLib.Images[603];
      end;
      if Sender = HeroAssassin then begin
          if (HeroArr[HeroIndex].UserChr.job = 3) and (WLib <> nil) then d := WLib.Images[606];
      end;
      if Sender = HeroBonze then begin
          if (HeroArr[HeroIndex].UserChr.job = 4) and (WLib <> nil) then d := WLib.Images[612];
      end;
      if Sender = HeroMale then begin
          if (HeroArr[HeroIndex].UserChr.sex = 0) and (WLib <> nil) then d := WLib.Images[618];
      end;
      if Sender = HeroFemale then begin
          if (HeroArr[HeroIndex].UserChr.sex = 1) and (WLib <> nil) then d := WLib.Images[621];
      end;
     if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);

  end;
end;

procedure TFrmDlg2.HeroOkDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
begin
  with Sender as TDButton do begin
    if WLib <> nil then begin
      if Downed then begin
        d := WLib.Images[FaceIndex];
      end else
        d := nil;
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
    end;
  end;
end;

procedure TFrmDlg2.DHeroBuffDlgDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay, I: integer;
  buff  : pTBuff;
begin
  with DHeroBuffDlg do begin
    d := WLib.Images[59];
    if g_HeroBuffList.Count <= 10 then
     d := WLib.Images[59 + g_HeroBuffList.Count];
    if g_HeroBuffList.Count > 10 then
     d := WLib.Images[70];

    Width := d.Width;
    Height := d.Height;
    if d <> nil then
    if MouseMoveing then begin
      dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end else begin
      DrawBlendEx (dsurface, SurfaceX(Left), SurfaceY(Top), d, 0, 0, d.Width, d.Height, 0);
    end;

    ax := SurfaceX(Left) + d.Width - 35;
    ay := SurfaceY(Top) + 5;
    for I := g_HeroBuffList.Count - 1 downto 0 do begin   //滚橇
      buff := g_HeroBuffList.items[I];
      if buff <> nil then begin

        if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin    //滚橇 救荤扼瘤绰巴
          if (buff.nTime - GetTickCount < 1000) then begin   //1檬 固父 昏力 贸府秦林磊..
            g_HeroBuffList.Delete(I);
            if g_HeroBuffList.Count < 10 then
              Left := Left + 23;
          end;
        end;

        if GetTickCount - g_dwTenSecTick[i] > 500 then begin
          g_TenSecTick[i] := Not g_TenSecTick[i];
          g_dwTenSecTick[i]:=GetTickCount();
        end;

        if buff.btIdx in [92,94,95,118,119] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.btIdx in [99,100] then d := g_WMainImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [26,27] then d := g_WAresImages.Images[buff.nImgIndex]
        else
        if buff.nImgIndex in [120] then d := g_WMain2Images.Images[buff.nImgIndex]
        else d := g_WBuffIconImages.Images[buff.nImgIndex];
        if d <> nil then begin
          if i > 9 then begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23 + 230, ay + 25, d.ClientRect , d , TRUE);
            end;
          end else begin
            if not (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin   //滚橇 救荤扼瘤绰巴
              if (buff.nTime - GetTickCount < 10 * 1000) and g_TenSecTick[i] then   //10檬何磐
              else dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end else begin
              dsurface.Draw(ax - i*23, ay, d.ClientRect , d , TRUE);
            end;
          end;

        end;

      end;
    end;
    if g_HeroBuffList.Count <= 0 then Visible := False;

  end;
end;

procedure TFrmDlg2.DHeroBuffDlgMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i:integer;
  Time:String;
  buff  : pTBuff;  //滚橇
  d: TDirectDrawSurface;
begin
  DScreen.ClearHint;
  with DHeroBuffDlg do begin
    X := LocalX (X) - Left;
    Y := LocalY (Y) - Top;
    for I := g_HerobuffList.Count - 1 downto 0 do begin    //滚橇
      buff := pTBuff(g_HerobuffList.Items[I]);
      if buff <> nil then begin
        if (buff.btIdx in [30,42,65,66,92,115,116,117]) then begin  //滚橇 救荤扼瘤绰巴
          Time := '';
        end else
        if (buff.nTime - GetTickCount) >= 60 * 60 * 1000 then begin
          Time := format('%d小时 %d分 %d秒', [(buff.nTime - GetTickCount) Div 3600000 , ((buff.nTime - GetTickCount) Div 60000) mod 60, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
        if (buff.nTime - GetTickCount) >= 60 * 1000 then begin
          Time := format('%d分 %d秒', [(buff.nTime - GetTickCount) Div 60000, ((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        end else
          Time := format('%d秒', [((buff.nTime - GetTickCount) Div 1000) Mod 60]);
        if g_HerobuffList.Count < 11 then begin
          if (Left + X >= Left - 13 + (g_HerobuffList.Count * 23) - (i*23)) and (Left + X <= Left + 8 + (g_HerobuffList.Count * 23) - (i*23)) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
            dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
          end else
        end else begin
          if (Left + X >= Left + 10) and (Left + X <= Left + 238) and (Top + Y >= Top + 5) and (Top + Y <= Top + 102) then begin
            if (Left + X >= Left + 240 - (i*23) - 23) and (Left + X <= Left + 261 - (i*23) - 23) and (Top + Y >= Top + 5) and (Top + Y <= Top + 27) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 207) and (Left + X <= Left + 261 - (i*23) + 207) and (Top + Y >= Top + 30) and (Top + Y <= Top + 52) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 437) and (Left + X <= Left + 261 - (i*23) + 437) and (Top + Y >= Top + 55) and (Top + Y <= Top + 77) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
            if (Left + X >= Left + 240 - (i*23) + 667) and (Left + X <= Left + 261 - (i*23) + 667) and (Top + Y >= Top + 80) and (Top + Y <= Top + 102) then begin
              dscreen.ShowHintA(Left + X + 4, Top + Y + 4, buff.str + Time, ClYellow, False);
            end else
          end;
        end;
      end;
    end;
  end;
end;


procedure TFrmDlg2.DRPSDlgDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay: integer;
  sTitle: string;
begin
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    d := WLib.Images[FaceIndex];
    if d <> nil then
     dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);

    with dsurface.Canvas do begin
      SetBkMode (Handle, TRANSPARENT);
      if (userSelect < 0) then begin
        sTitle := '请选择剪刀、石头、布';
      end else begin
        if frmMain.Timer3.Enabled then begin
          case frmMain.Timer3.Tag of
            0: sTitle := '剪刀！';
            1: sTitle := '石头！';
            2: sTitle := '布！';
          end;
        end else begin
          case SelResult of
            0: sTitle := '作出决定后点击就绪按钮(3秒钟后自动开始).';
            1: sTitle := '不好意思，你输了。';
            2: sTitle := '恭喜你，你赢了。';
            3: sTitle := '真可惜，你们平了。';
          end;
        end;
      end;
      TextOutA(dsurface, ax + 146 - (TextWidth(sTitle) div 2), ay + 148, clYellow, sTitle);
      Release;
    end;
  end;
end;


procedure TFrmDlg2.ComputerRandom;
begin
  Randomize;
  compSelect := 1 + Random(3);
end;

procedure TFrmDlg2.ResultGame;
begin
  SelResult := 0;
  // computer啊 捞辨版快
  if ((compSelect = 1) and (userSelect = 3))
  or ((compSelect = 2) and (userSelect = 1))
  or ((compSelect = 3) and (userSelect = 2)) then
  begin
	  SelResult := 1;
  end;
  // user啊 捞辨版快
  if ((compSelect = 1) and (userSelect = 2))
  or ((compSelect = 2) and (userSelect = 3))
  or ((compSelect = 3) and (userSelect = 1)) then
  begin
	  SelResult := 2;
  end;
  // 厚辨版快
  if ((compSelect = 1) and (userSelect = 1))
  or ((compSelect = 2) and (userSelect = 2))
  or ((compSelect = 3) and (userSelect = 3)) then
  begin
	  SelResult := 3;
  end;
  SendClientMessage(CM_ROCKPAPERS, RockRate, SelResult, 0, 0, IntToStr(RockGold));
  DRPSClose.Visible := True;
  DGoReStart.Visible := True;
end;

procedure TFrmDlg2.ReStart;
begin
  SelResult := 0;
  compSelect := -1;
  userSelect := -1;
  SelBoolean := False;
  DRPSClose.Visible := True;
  DGoResult.Visible := True;
end;

procedure TFrmDlg2.DRockDirectPaint(Sender: TObject;   //蜡历 扁霖
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   with Sender as TDButton do begin
      if (userSelect > 0) and (userSelect = Tag) and (SelResult = 1) then begin  //哪腔磐啊 捞板促搁
         d := WLib.Images[FaceIndex + 3];
      end else
      if (userSelect > 0) and (userSelect = Tag) and (SelResult = 2) then begin  //蜡历啊 捞板促搁
         d := WLib.Images[FaceIndex + 4];
      end else
      if (userSelect > 0) and (userSelect = Tag) and (SelResult = 3) then begin  //厚板促搁
         d := WLib.Images[FaceIndex + 2];
      end else
      if (userSelect = Tag) then begin  //急琶茄惑怕
         d := WLib.Images[FaceIndex + 1];
      end else begin
         d := WLib.Images[FaceIndex];
      end;
      if d <> nil then
          dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
   end;
end;

procedure TFrmDlg2.DRockClick(Sender: TObject; X, Y: Integer);
begin
  with Sender as TDButton do begin
    if not SelBoolean then
      userSelect := Tag;
  end;
end;

procedure TFrmDlg2.DCRockDirectPaint(Sender: TObject;   //哪腔磐 涝厘
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   with Sender as TDButton do begin
      if (compSelect > 0) and (compSelect = Tag) and (SelResult = 1) then begin  //哪腔磐啊 捞板促搁
        d := WLib.Images[FaceIndex + 4];
      end else
      if (compSelect > 0) and (compSelect = Tag) and (SelResult = 2) then begin  //哪腔磐啊 脸促搁
        d := WLib.Images[FaceIndex + 3];
      end else
      if (compSelect > 0) and (compSelect = Tag) and (SelResult = 3) then begin  //厚板促搁
        d := WLib.Images[FaceIndex + 2];
      end else
      if (compSelect > 0) and (compSelect <> Tag) then begin //哪腔磐啊 急琶沁阑锭 促弗 巴甸
        d := WLib.Images[FaceIndex];
      end else begin
        d := WLib.Images[1120];    //拱澜钎惑怕
      end;
      if d <> nil then
        dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
   end;
end;

procedure TFrmDlg2.DGoResultDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   with Sender as TDButton do begin
      if Downed then begin
         d := WLib.Images[FaceIndex + 2];
      end else
      if MouseMoveing then begin
         d := WLib.Images[FaceIndex + 1];
      end else begin
         d := WLib.Images[FaceIndex];
      end;
      if d <> nil then
          dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
   end;
end;

procedure TFrmDlg2.DGoResultClick(Sender: TObject; X, Y: Integer);
begin
  if userSelect > 0 then begin
    SelBoolean := True;
    FrmMain.Timer3.Enabled := True;
    DRPSClose.Visible := False;
    DGoResult.Visible := False;
  end;
end;

procedure TFrmDlg2.DRPSCloseClick(Sender: TObject; X, Y: Integer);
begin
  DRPSDlg.Visible := False;
  DGoReStart.Visible := False;
  ReStart;
end;

procedure TFrmDlg2.DGoReStartClick(Sender: TObject; X, Y: Integer);
begin
  ReStart;
  SendClientMessage(CM_ROCKPAPERS, RockRate, 4, 0, 0, IntToStr(RockGold));
  DGoReStart.Visible := False;
  DGoResult.Visible := True;
end;

procedure TFrmDlg2.DWndCompoundDirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  ax, ay, nLV: integer;
  sTitle: string;
  pCompoundInfos: pTCompoundInfos;
begin
  with Sender as TDWindow do begin
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    d := WLib.Images[FaceIndex];
    if d <> nil then
     dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
  end;
  if FCompoundItems[0].Item.s.Name <> '' then begin
    pCompoundInfos := GetCompoundInfos(FCompoundItems[0].Item.s.Name);
    nLV := (FCompoundItems[0].Item.Amount);
  end;
  with dsurface.Canvas do begin
    SetBkMode(Handle, TRANSPARENT);
    TextOutA(dsurface, ax + 34, ay + 60, clWhite, '强化失败时没有提示。');
    TextOutA(dsurface, ax + 34, ay + 77, clWhite, '请选择等级相同的4件物品。');
    TextOutA(dsurface, ax + 34, ay + 94, clWhite, '物品数量的概率与强化的概率无关。');
    TextOutA(dsurface, ax + 34, ay + 108, clWhite, '------------------------------------');
    if FCompoundItems[0].Item.s.Name <> '' then begin
      TextOutA(dsurface, ax + 34, ay + 122, clWhite, '强化成功概率: ');
      TextOutA(dsurface, ax + 137, ay + 122, $5A5AFF, IntToStr(pCompoundInfos[nLV].Rate[13]) + '%');
      TextOutA(dsurface, ax + 34, ay + 139, clWhite, '消耗金币: ');
      TextOutA(dsurface, ax + 105, ay + 139, $5A5AFF, GetGoldStr(g_CompoundSet.Gold[nLV]) + '金币。');
    end;
    Release;
  end;

  DStartCompound.Enabled := (not FCompoundLock);
  DCloseCompound.Enabled := (not FCompoundLock);

  if FCompoundShowEffect then
  begin
    if GetTickCount() > FCompoundShowTick then begin
      FCompoundShowTick := GetTickCount() + 150;
      Inc(FCompoundShowSchedulePos);
    end;
    case FCompoundResult of
      1:
        begin
          d := g_WAresImages.Images[570 + FCompoundShowSchedulePos];
          if d <> nil then
            DrawBlend(dsurface, ax + 28 - 6, ay - 9 + 25, d, 1);
          if FCompoundShowSchedulePos >= 9 then begin
            FCompoundShowEffect := False;
          end;
        end;
      2:
        begin
          d := g_WAresImages.Images[630 + FCompoundShowSchedulePos];
          if d <> nil then
            DrawBlend(dsurface, ax + 28 - 6, ay - 9 + 25, d, 1);
          if FCompoundShowSchedulePos >= 9 then begin
            FCompoundShowEffect := False;
          end;
        end;
    else
      FCompoundShowEffect := False;
    end;
  end
  else if FCompoundShowSchedule then
  begin
    if GetTickCount() > FCompoundShowTick then
    begin
      if FCompoundShowSchedulePos = 0 then PlaySound2(bmg_Repair);
      FCompoundShowTick := GetTickCount() + 100;
      Inc(FCompoundShowSchedulePos);
    end;
    if FCompoundShowSchedulePos < 6 then
    begin
      d := g_WAresImages.Images[520 + FCompoundShowSchedulePos];
      if d <> nil then
        DrawBlend(dsurface, ax + 28 - 6, ay - 12 + 25, d, 1);
      d := g_WAresImages.Images[530 + FCompoundShowSchedulePos];
      if d <> nil then
        DrawBlend(dsurface, ax + 28 - 6, ay - 12 + 25, d, 1);
      d := g_WAresImages.Images[540 + FCompoundShowSchedulePos];
      if d <> nil then
        DrawBlend(dsurface, ax + 28 - 6, ay - 12 + 25, d, 1);
      d := g_WAresImages.Images[550 + FCompoundShowSchedulePos];
      if d <> nil then
        DrawBlend(dsurface, ax + 28 - 6, ay - 12 + 25, d, 1);
      d := g_WAresImages.Images[560 + FCompoundShowSchedulePos];
      if d <> nil then
        DrawBlend(dsurface, ax + 28 - 6, ay - 12 + 25, d, 1);
    end
    else
    if FCompoundShowSchedulePos = 6 then
      FCompoundShowSchedulePos := 92;

    {if FCompoundShowSchedulePos in [92..100] then
    begin
      d := g_WAresImages.Images[570 + FCompoundShowSchedulePos - 92];
      if d <> nil then
        DrawBlend(dsurface, ax + 25 - 6, ay - 3 + 22, d, 1);
    end;  }

    if FCompoundShowSchedulePos >= 100 then
    begin
      FCompoundShowSchedule := False;
      FCompoundLock := False;
      case FCompoundResult of
        1:
          begin
            FCompoundItems[0].Item := FCompoundUserItem;
            PlaySound2(bmg_ItemLevel_OK);
          end;
        2:
          begin
            PlaySound2(bmg_ItemLevel_Fail);
          end;
      end;
      FCompoundShowSchedulePos := 0;
      FCompoundShowTick := GetTickCount();
      FCompoundShowEffect := True;
    end;
  end;
end;

procedure TFrmDlg2.DCloseCompoundClick(Sender: TObject; X, Y: Integer);
begin
  if FCompoundLock then
    exit;
  DWndCompound.Visible := False;
end;

procedure TFrmDlg2.DStartCompoundClick(Sender: TObject; X, Y: Integer);
var
  i: Integer;
  CompoundItems: array of Integer;
begin
  if FCompoundLock then
    exit;
  SetLength(CompoundItems, 0);
  for i := Low(FCompoundItems) to High(FCompoundItems) do
  begin
    if (FCompoundItems[i].Item.s.Name = '') then
    begin
      SetLength(CompoundItems, 0);
      FrmDlg.DMessageDlg('物品无法合成。', []);
      exit;
    end;
    SetLength(CompoundItems, Length(CompoundItems) + 1);
    CompoundItems[Length(CompoundItems) - 1] := FCompoundItems[i].Item.MakeIndex;
  end;
  FCompoundLock := True;
  SendClientSocket(CM_COMPOUNDITEM, g_nCurMerchant, 0, 0, Length(CompoundItems),
    EncodeBuffer(@CompoundItems[0], Length(CompoundItems) * SizeOf(Integer)));
end;

procedure TFrmDlg2.DCompoundItem0DirectPaint(Sender: TObject;
  dsurface: TDirectDrawSurface);
var
  i: Integer;
  d: TDirectDrawSurface;
  ax, ay: integer;
  pRect: TRect;
begin
  with Sender as TDButton do begin
    i := Tag;
    if not (i in [Low(FCompoundItems) .. High(FCompoundItems)]) then
      exit;
    ax := SurfaceX(Left);
    ay := SurfaceY(Top);
    if (FCompoundItems[i].Item.s.Name <> '') then begin
      d := g_WBagItemImages.Images[FCompoundItems[i].Item.S.looks];
      if d <> nil then
        dsurface.Draw (ax + (Width - d.Width) div 2, ay + (Height - d.Height) div 2, d.ClientRect, d, TRUE);
    end;
    if g_boItemMoving and (g_MovingItem.Owner = FrmDlg.DItemBag) and (g_MovingItem.Item.S.name <> '') then begin
      if (FCompoundItems[i].Item.s.Name = '') and CanCompoundItemAddEx(@g_MovingItem.Item, Sender = DCompoundItem0) then begin
        d := g_WAresImages.Images[500 + (gettickcount - AppendTick) div 200 mod 2];
        if d <> nil then
          DrawBlend(dsurface, SurfaceX(Left) - 13, SurfaceY(Top) - 14, d, 1);
      end;
    end;
  end;
end;


procedure TFrmDlg2.ClearCompoundItemInfo(boClick: Boolean);
var
  i: integer;
begin
  FCompoundLock := False;

  for I := Low(FCompoundItems) to High(FCompoundItems) do begin
    if FCompoundItems[I].Item.s.Name <> '' then
      AddItemBag(FCompoundItems[I].Item);
  end;
  SafeFillChar(FCompoundItems[0], SizeOf(TMovingItem) * Length(FCompoundItems), #0);
end;

procedure TFrmDlg2.CompoundItemAdd(nItemIndex: Integer);
var
  I: Integer;
begin
  if FCompoundLock or g_boItemMoving then exit;
    for I := Low(FCompoundItems) to High(FCompoundItems) do begin
      if FCompoundItems[i].Item.s.Name = '' then begin
        g_boItemMoving := True;
        g_MovingItem.Index2 := nItemIndex;
        g_MovingItem.Item := g_ItemArr[nItemIndex];
        g_MovingItem.Owner := FrmDlg.DItemBag;
        DelItemBagByIdx(nItemIndex);
        ItemClickSound(g_ItemArr[nItemIndex].S);
        case i of
          0: DCompoundItem0Click(DCompoundItem0, 0, 0);
          1: DCompoundItem0Click(DCompoundItem1, 0, 0);
          2: DCompoundItem0Click(DCompoundItem2, 0, 0);
          3: DCompoundItem0Click(DCompoundItem3, 0, 0);
          4: DCompoundItem0Click(DCompoundItem4, 0, 0);
        end;   
        break;
      end;
    end;
end;

function TFrmDlg2.CanCompoundItemAdd(Item: pTClientItem): Boolean;
begin
  Result := CanCompoundItemAddEx(Item, FCompoundItems[Low(FCompoundItems)].Item.s.Name = '');
end;

function TFrmDlg2.CanCompoundItemAddEx(Item: pTClientItem; boFirst: Boolean): Boolean;
var
  nLV, nValue: Integer;
  pCompoundInfos: pTCompoundInfos;
  pCompoundInfos2: pTCompoundInfos;
begin
  Result := False;
  if FCompoundLock then
    exit;
  if boFirst then
  begin
    pCompoundInfos := GetCompoundInfos(Item.s.Name);
    if Assigned(pCompoundInfos) then
    begin
      nLV := (Item.Amount - 1);
      nLV := _MAX(nLV, Low(TCompoundInfos));
      Result := nLV in [Low(TCompoundInfos) .. High(TCompoundInfos)];
      Result := Result and (pCompoundInfos[nLV].Value > 0);
      nLV := ((Item.Amount - 1) + 1);
      Result := Result and (nLV in [Low(TCompoundInfos) .. High(TCompoundInfos)]);
      Result := Result and (pCompoundInfos[nLV].Value > 0);
    end;
  end
  else
  begin
    if FCompoundItems[Low(FCompoundItems)].Item.s.Name <> '' then
    begin
      if ((Item.Amount - 1) <> (FCompoundItems[Low(FCompoundItems)].Item.Amount - 1)) then
        exit;
      pCompoundInfos := GetCompoundInfos(Item.s.Name);
      pCompoundInfos2 := GetCompoundInfos(FCompoundItems[Low(FCompoundItems)].Item.s.Name);
      if Assigned(pCompoundInfos) and Assigned(pCompoundInfos2) then
      begin
        nLV := (FCompoundItems[Low(FCompoundItems)].Item.Amount - 1);
        nLV := _MAX(nLV, Low(TCompoundInfos));
        if not (nLV in [Low(TCompoundInfos) .. High(TCompoundInfos)]) then
          exit;
        nValue := pCompoundInfos2[nLV].Value;
        nLV := (Item.Amount - 1);
        nLV := _MAX(nLV, Low(TCompoundInfos));
        if not (nLV in [Low(TCompoundInfos) .. High(TCompoundInfos)]) then
          exit;
        Result := (pCompoundInfos[nLV].Value > nValue - g_CompoundSet.ValueLimit);
      end;
    end;
  end;
end;


procedure TFrmDlg2.ClientCompoundItem(nResult: Integer; sMsg: string);
begin
  case nResult of
    2: FrmDlg.DMessageDlg('金币不足。', []);
    3: FrmDlg.DMessageDlg('请放置好需要合成的装备及材料.', []);
    4: FrmDlg.DMessageDlg('粗物品无法合成。.', []);
    5: FrmDlg.DMessageDlg('需要合成的主装备未开光.', []);
    6: FrmDlg.DMessageDlg('你不能继续强化他了。', []);
    7: FrmDlg.DMessageDlg('需要合成的材料装备未开光.', []);
    9: begin  //碍拳角菩
        FCompoundShowSchedule := True;
        FCompoundShowSchedulePos := 0;
        FCompoundShowTick := GetTickCount();
        FCompoundResult := 2;
      end;
    10: begin  //碍拳己傍
        FCompoundShowSchedule := True;
        FCompoundShowSchedulePos := 0;
        FCompoundShowTick := GetTickCount();
        FCompoundResult := 1;
      end;
  end;
  if nResult >= 8 then
    SafeFillChar(FCompoundItems[1], SizeOf(TMovingItem) * (Length(FCompoundItems) - 1), #0);
  FCompoundLock := False;
end;

procedure TFrmDlg2.DCompoundItem0Click(Sender: TObject; X, Y: Integer);
var
  i: Integer;
  tmp: TMovingItem;
begin
  i := TCustomControl(Sender).Tag;
  if FCompoundLock or not (i in [Low(FCompoundItems) .. High(FCompoundItems)]) then
    exit;
  if not g_boItemMoving then begin
    if Sender <> DCompoundItem0 then
    begin
      if FCompoundItems[i].Item.s.Name <> '' then
        AddItemBag(FCompoundItems[i].Item);
      SafeFillChar(FCompoundItems[i], SizeOf(TMovingItem), #0);
    end
    else
      ClearCompoundItemInfo(True);
  end
  else if g_boItemMoving and (g_MovingItem.Owner = FrmDlg.DItemBag) and (g_MovingItem.Item.s.Name <> '') then begin
    if CanCompoundItemAddEx(@g_MovingItem.Item, Sender = DCompoundItem0) then
    begin
      tmp := FCompoundItems[i];
      FCompoundItems[i] := g_MovingItem;
      g_MovingItem := tmp;
      g_boItemMoving := (g_MovingItem.Item.s.Name <> '');
    end;
  end;
end;

procedure TFrmDlg2.DCompoundItem0MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  nLocalX, nLocalY: Integer;
  nHintX, nHintY: Integer;
begin
  DScreen.ClearHint;
  with Sender as TDButton do begin
    i := Tag;
    if not (i in [Low(FCompoundItems) .. High(FCompoundItems)]) then
      exit;
    g_MouseItem := FCompoundItems[i].Item;
    if g_MouseItem.s.Name <> '' then begin
      FrmDlg.GetMouseItemHint(g_MySelf, @g_MouseItem);
      if FrmDlg.HintList.Count > 0 then begin
        nLocalX := LocalX(X - Left);
        nLocalY := LocalY(Y - Top);
        nHintX := SurfaceX(Left) + DParent.SurfaceX(DParent.Left) + nLocalX;
        nHintY := SurfaceY(Top) + DParent.SurfaceY(DParent.Top) + nLocalY;
      end;
      DScreen.ShowHintB(nHintX, nHintY, FrmDlg.HintList, False);
    end;
  end;
end;

procedure TFrmDlg2.DWndCompoundMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  DScreen.ClearHint;
end;

end.
