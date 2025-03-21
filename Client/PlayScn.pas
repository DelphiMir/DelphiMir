unit PlayScn;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DXClass, DirectX, IntroScn, Grobal2, CliUtil, HUtil32,
  Actor, HerbActor, AxeMon, SoundUtil, ClEvent, Wil,
  StdCtrls, clFunc, magiceff, extctrls, MShare, Share;

const
   LONGHEIGHT_IMAGE = 35;
   FLASHBASE = 410;
   AAX = 16;
   SOFFX = 0;
   SOFFY = 0;

type
   PShoftInt = ^ShortInt;

   TPlayScene = class (TScene)
   private
     m_MapSurface    :TDirectDrawSurface;
     m_ObjSurface    :TDirectDrawSurface; //0x0C
     m_OperateHintSurface: TDirectDrawSurface;
   //  m_SnowSurface   :TDirectDrawSurface;  //눈오는이펙
     m_CurrX         :Integer;
     m_CurrY         :Integer;

     m_dwMoveTime    :LongWord;
     m_nMoveStepCount:Integer;
     m_dwAniTime     :LongWord;
     m_nAniCount     :Integer;
     m_nDefXX        :Integer;
     m_nDefYY        :Integer;
     m_MainSoundTimer:TTimer;
     procedure DrawTileMap;
     procedure DrawTileMapEI;


     procedure SoundOnTimer (Sender: TObject);
     procedure ClearDropItem();
   public

      EdChat: TEdit;
      MemoLog: TMemo;
      EdAccountt: TEdit;//2004/05/17
      EdChrNamet: TEdit;//2004/05/17
     m_ActorList        :TList;
     m_EffectList       :TList;
     m_FlyList          :TList;

      constructor Create;
      destructor Destroy; override;
      procedure Initialize; override;
      procedure Finalize; override;
      procedure OpenScene; override;
      procedure CloseScene; override;
      procedure OpeningScene; override;

      procedure PlayScene (MSurface: TDirectDrawSurface); override;
      function  ButchAnimal (x, y: integer): TActor;
       procedure EdChatKeyPress (Sender: TObject; var Key: Char);
      function  FindActor (id: integer): TActor;overload;
      function  FindActor (sName:String): TActor;overload;
      function  FindActorXY (x, y: integer): TActor;
      function  IsValidActor (actor: TActor): Boolean;
      function  NewActor (chrid: integer; cx, cy, cdir: word; cfeature, cstate: integer): TActor;
      procedure SetMissionList(Actor: TNPCActor);
      procedure SetMissionInfo(Actor: TNPCActor);
      procedure ClearMissionList(Actor: TActor);

      procedure SetOperateHint(sHint: string);  //라인공지

      procedure ActorDied (actor: TObject);
      procedure SetActorDrawLevel (actor: TObject; level: integer);
      procedure ClearActors;
      procedure ClearActorMsg(Actor: TActor);
      function  DeleteActor (id: integer): TActor;
      procedure DelActor (actor: TObject);
      procedure SetEditChar(sMsg: string);
      procedure ClearGroup();
      procedure SetActorGroup(Actor: TActor);
      procedure SetMembersGroup(GroupMember: pTGroupMember; boGroup: Boolean); overload;
      procedure SetMembersGroup(GroupMembers: TList); overload;
      procedure SendMsg (ident, chrid, x, y, cdir, feature, state: integer; str: string);

      procedure NewMagic (aowner: TActor;
                          magid, magnumb, cx, cy, tx, ty, targetcode: integer;
                          mtype: TMagicType;
                          Recusion: Boolean;
                          anitime: integer;
                          var bofly: Boolean);
      procedure DelMagic (magid: integer);
      function  NewFlyObject (aowner: TActor; cx, cy, tx, ty, targetcode: integer;  mtype: TMagicType): TMagicEff;
      //function  NewStaticMagic (aowner: TActor; tx, ty, targetcode, effnum: integer);

      procedure ScreenXYfromMCXY (cx, cy: integer; var sx, sy: integer);
      procedure CXYfromMouseXY (mx, my: integer; var ccx, ccy: integer);
      procedure CXYfromMouseXYMid (mx, my: integer; var ccx, ccy: integer);
      function  GetCharacter (x, y, wantsel: integer; var nowsel: integer; liveonly: Boolean): TActor;
      function  GetAttackFocusCharacter (x, y, wantsel: integer; var nowsel: integer; liveonly: Boolean): TActor;
      function  IsSelectMyself (x, y: integer): Boolean;
      function  GetDropItems (x, y: integer; var inames: string): PTDropItem;
      function  GetPetDropItems (x, y: integer; var inames: string): PTDropItem;
      function  GetXYDropItems (nX,nY:Integer):pTDropItem;
      procedure GetXYDropItemsList (nX,nY:Integer;var ItemList:TList);
      procedure DropItemsShow; //떨어진 아이템 이름
      function  CanRun (sx, sy, ex, ey: integer): Boolean;
      function  CanRunEx (sx, sy, ex, ey: integer): Boolean;
      function  CanRunEx2 (sx, sy, ex, ey: integer): Boolean;

      function CanHorseRunEx(sx, sy, ex, ey: Integer): Boolean;

      function  CanWalk (mx, my: integer): Boolean;
      function  CanWalkEx (mx, my: integer): Boolean;
      function  CrashMan (mx, my: integer): Boolean;

      function  CanWalkEx2 (mx, my: integer): Boolean;
      function CrashManEx2(mx, my: Integer): Boolean;
      function  CrashManEx(mx, my: integer): Boolean;   //사람끼리 겹치는지 화인

      function  CanFly (mx, my: integer): Boolean;
      procedure CleanObjects;

   end;

implementation
uses
   ClMain, FState, FState2, Relationship;

constructor TPlayScene.Create;
var
  nx,ny:Integer;
begin
   m_MapSurface := nil;
   m_ObjSurface := nil;
   m_OperateHintSurface := nil;
   //m_SnowSurface := nil;        //눈오는이펙
   m_ActorList := TList.Create;
   m_EffectList := TList.Create;
   m_FlyList := TList.Create;


   EdChat := TEdit.Create (FrmMain.Owner);    //채팅 글쓰는 부분
   with EdChat do begin
      Parent := FrmMain;
      BorderStyle := bsNone;
      OnKeyPress := EdChatKeyPress;
      Visible := FALSE;
      MaxLength := 90;
      Ctl3D := False;
      Left   := 231;
      Top    := g_FScreenHeight - 43;
      Height := 12;
      Width  := (g_FScreenWidth div 2 - 199) * 2 + 1;
      Color := clSilver;
   end;

   MemoLog:=TMemo.Create(FrmMain.Owner);
   with MemoLog do begin
      Parent := FrmMain;
      BorderStyle := bsNone;
      Visible := False;
     // Visible := True;
      Ctl3D := True;
    Left := 0;
    Top := 250;
    Width := 300;
    Height := 150;
   end;

   EdAccountt := TEdit.Create (FrmMain.Owner);
   with EdAccountt do begin
      Parent := FrmMain;
      BorderStyle := bsSingle;
      Visible := False;
      MaxLength := 70;
      Ctl3D := True;
      Left   := (g_FScreenWidth - 194) div 2;
      Top    := g_FScreenHeight - 200;
      Height := 12;
      Width  := 194;
   end;

   EdChrNamet := TEdit.Create (FrmMain.Owner);
   with EdChrNamet do begin
      Parent := FrmMain;
      BorderStyle := bsSingle;
      Visible := False;
      MaxLength := 70;
      Ctl3D := True;
      Left   := (g_FScreenWidth - 194) div 2;
      Top    := g_FScreenHeight - 176;
      Height := 12;
      Width  := 194;
   end;

   m_dwMoveTime := GetTickCount;
   m_dwAniTime := GetTickCount;
   m_nAniCount := 0;
   m_nMoveStepCount := 0;
   m_MainSoundTimer := TTimer.Create (FrmMain.Owner);
   with m_MainSoundTimer do begin
      OnTimer := SoundOnTimer;
      Interval := 1;
      Enabled := FALSE;
   end;  

   nx := g_FScreenWidth div 2 - 210;
   ny := g_FScreenHeight div 2 - 150;

end;

destructor TPlayScene.Destroy;
var
  i: Integer;
begin
  if m_ActorList.Count > 0 then begin
    for I := 0 to m_ActorList.Count - 1 do
      if TActor(m_ActorList[I]) <> nil then TActor(m_ActorList[I]).Free;
  end;
  FreeAndNil(m_ActorList);

  if m_EffectList.Count > 0 then begin
    for I := 0 to m_EffectList.Count - 1 do
      if TMagicEff(m_EffectList[I]) <> nil then TMagicEff(m_EffectList[I]).Free;
  end;
  FreeAndNil(m_EffectList);

  if m_FlyList.Count > 0 then begin
    for I := 0 to m_FlyList.Count - 1 do
      if TMagicEff(m_FlyList.Items[I]) <> nil then TMagicEff(m_FlyList.Items[I]).Free;
  end;
  FreeAndNil(m_FlyList);
  inherited Destroy;
end;

procedure TPlayScene.SoundOnTimer (Sender: TObject);
begin

  // PlaySound (s_main_theme);
   //m_MainSoundTimer.Interval := 46 * 1000;
end;

procedure TPlayScene.EdChatKeyPress (Sender: TObject; var Key: Char);
var
  SayMode: TUserSayMode;
begin
   SayMode := g_SayMode;
   try
   if Key = #13 then begin
      FrmMain.SendSay (EdChat.Text);
      EdChat.Text := '';
      EdChat.Visible := FALSE;
      Key := #0;
      SetImeMode (EdChat.Handle, imSAlpha);
      if FrmDlg2.DWndFace.Visible then FrmDlg2.DWndFace.Visible := False;
   end;
   if Key = #27 then begin
      EdChat.Text := '';
      EdChat.Visible := FALSE;
      Key := #0;
      SetImeMode (EdChat.Handle, imSAlpha);
   end;
   finally
     EdChat.OnKeyPress := EdChatKeyPress;
     g_SayMode := SayMode;
   end;
end;

procedure TPlayScene.Initialize;
var
   i: integer;
begin
   m_MapSurface := TDirectDrawSurface.Create (frmMain.DxDraw.DDraw);
   m_MapSurface.SystemMemory := TRUE;
   m_MapSurface.SetSize (g_FScreenWidth+UNITX*4+30, g_FScreenHeight+UNITY*4);
   m_ObjSurface := TDirectDrawSurface.Create (frmMain.DxDraw.DDraw);
   m_ObjSurface.SystemMemory := TRUE;
   m_ObjSurface.SetSize (g_FScreenWidth-SOFFX*2, g_FScreenHeight);

   m_OperateHintSurface := TDirectDrawSurface.Create (frmMain.DxDraw.DDraw);
   m_OperateHintSurface.SystemMemory := TRUE;
   m_OperateHintSurface.SetSize (g_FScreenWidth, g_FScreenHeight);

   m_CurrX := -1;
   m_CurrY := -1;
   {m_SnowSurface := TDirectDrawSurface.Create (frmMain.DxDraw.DDraw);
   m_SnowSurface.SystemMemory := TRUE;
   m_SnowSurface.SetSize(g_FScreenWidth + UNITX * 4 + 30, g_FScreenHeight + UNITY * 4);   //눈오는이펙

                            }
   g_boViewFog := FALSE;

end;

procedure TPlayScene.Finalize;
begin
   if m_MapSurface <> nil then
      m_MapSurface.Free;
   if m_ObjSurface <> nil then
      m_ObjSurface.Free;
   if m_OperateHintSurface <> nil then
      m_OperateHintSurface.Free;
  // if m_SnowSurface <> nil then    //눈오는이펙트
  //    m_SnowSurface.Free;
   m_MapSurface := nil;
   m_ObjSurface := nil;
   m_OperateHintSurface := nil;
   //m_SnowSurface := nil;      //눈오는이펙트
end;

procedure TPlayScene.OpenScene;
begin
   g_WMainImages.ClearCache;
   g_WMain2Images.ClearCache;
   g_WMain3Images.ClearCache;
   g_WAresImages.ClearCache;
   g_WChrSelImages.ClearCache;
   g_WNewChrSelImages.ClearCache;
   g_WNewLoginImages.ClearCache;
   g_WTitleImages.ClearCache;
   FrmDlg.ViewBottomBox (TRUE);
   FrmDlg.DBeltWindow.Visible := True;
   FrmDlg.DViewMiniMap.Visible := True;
   g_boShowFormImage := True;

   FrmDlg.DNeWSay.Visible := True;
   SetImeMode (FrmMain.Handle, LocalLanguage);
end;

procedure TPlayScene.CloseScene;
begin
   SilenceSound;
   EdChat.Visible := FALSE;
   FrmDlg.DNeWSay.Visible := False;
   FrmDlg.ViewBottomBox (FALSE);
   FrmDlg.DBeltWindow.Visible := False;
   if g_MyHero <> nil then
    FrmDlg.DBeltHero.Visible := False;
   FrmDlg.DMenuWindows.Visible := False;
   g_boShowFormImage := False;
   DScreen.ClearSysMsg;
   ClearBGM;
end;

procedure TPlayScene.OpeningScene;
begin
end;

procedure TPlayScene.CleanObjects;
var
   i: integer;
begin
   for i := m_ActorList.Count-1 downto 0 do begin
      if (TActor(m_ActorList[i]) <> g_MySelf) then begin
         if TActor(m_ActorList[i]).m_Group <> nil then begin
           TActor(m_ActorList[i]).m_Group.isScreen := nil;     //CleanObjects
           TActor(m_ActorList[i]).m_Group := nil;
         end;
         ClearMissionList(TActor(m_ActorList[i]));
         if (TActor(m_ActorList[I]) <> g_MyHero) then
           TActor(m_ActorList[i]).Free;
         m_ActorList.Delete (i);
      end;
   end;

   g_TargetCret := nil;
   g_FocusCret := nil;

   g_MagicTarget := nil;

  if m_EffectList.Count > 0 then begin
    for i := 0 to m_EffectList.Count - 1 do
      TMagicEff(m_EffectList[i]).Free;
    m_EffectList.Clear;
  end;
  if m_FlyList.Count > 0 then begin
    for i := 0 to m_FlyList.Count - 1 do begin
      TMagicEff(m_FlyList[i]).Free
    end;
    m_FlyList.Clear;
  end;
end;

{---------------------- Draw Map -----------------------}

procedure TPlayScene.DrawTileMap;
var
  i,j, nY,nX,nImgNumber, nImgNumber2, nFileIdx, nImgIdx, a, b:integer;
  DSurface: TDirectDrawSurface;
  rc: TRect;
begin
  with Map do
    if (m_ClientRect.Left = m_OldClientRect.Left) and (m_ClientRect.Top = m_OldClientRect.Top) then exit;

  Map.m_OldClientRect := Map.m_ClientRect;
  m_MapSurface.Fill(0);

  with Map.m_ClientRect do begin
    nY := - UNITY * 2;
    for j := (Top - Map.m_nBlockTop - 1) to (Bottom - Map.m_nBlockTop + 1) do begin
      if g_FScreenWidth = 1024 then nX := AAX + 28 - UNITX * 3
      else
      nX := AAX + 14 - UNITX;
      for i:= (Left - Map.m_nBlockLeft - 2) to (Right - Map.m_nBlockLeft + 1) do begin
        if (i >= 0) and (i < LOGICALMAPUNIT * 3) and (j >= 0) and (j < LOGICALMAPUNIT * 3) then begin
          nImgNumber := (Map.m_MArr[i, j].wBkImg and $1FFFFFFF);
          if nImgNumber > 0 then begin
            if (i mod 2 = 0) and (j mod 2 = 0) then begin
              nImgNumber := nImgNumber - 1;
              if map.m_MArr[I, j].btBkIndex > 99 then
                DSurface := g_WSTiles[map.m_MArr[I, j].btBkIndex - 100].Images[nImgNumber]
              else
              DSurface := g_WTilesImages.Images[nImgNumber];
              if Dsurface <> nil then begin
                m_MapSurface.Draw (nX, nY, DSurface.ClientRect, DSurface, FALSE);
              end;
            end;
          end;
        end;
        Inc (nX, UNITX);
      end;
      Inc (nY, UNITY);
    end;
  end;

   with Map.m_ClientRect do begin
      nY := -UNITY;
      for j:=(Top - Map.m_nBlockTop-1) to (Bottom - Map.m_nBlockTop+1) do begin
         if g_FScreenWidth = 1024 then nX := AAX + 28 - UNITX * 3
         else
         nX := AAX + 14 -UNITX;
         for i:=(Left - Map.m_nBlockLeft- 2) to (Right - Map.m_nBlockLeft+1) do begin
            if (i >= 0) and (i < LOGICALMAPUNIT * 3) and (j >= 0) and (j < LOGICALMAPUNIT * 3) then begin
               nImgNumber := Map.m_MArr[i, j].wMidImg;
               if nImgNumber > 0 then begin
                  nImgNumber := nImgNumber - 1;
                  if map.m_MArr[I, j].MidIndex > 109 then
                    DSurface := g_WSSmTiles[map.m_MArr[I, j].MidIndex - 110].Images[nImgNumber]
                  else
                  DSurface := g_WSmTilesImages.Images[nImgNumber];
                  if Dsurface <> nil then begin
                    m_MapSurface.Draw (nX, nY, DSurface.ClientRect, DSurface, TRUE);
                  end;
               end;
            end;
            Inc (nX, UNITX);
         end;
         Inc (nY, UNITY);
      end;
   end;

end;


procedure TPlayScene.DrawTileMapEI;
var
  I, j, nY, nX, nImgNumber: Integer;
  dsurface          : TDirectDrawSurface;
  nFileIdx, nImgIdx : integer;
begin
  with Map do
   if (m_ClientRect.Left = m_OldClientRect.Left) and (m_ClientRect.Top = m_OldClientRect.Top) then exit;

  Map.m_OldClientRect := Map.m_ClientRect;
  m_MapSurface.Fill(0);

  With Map.m_ClientRect Do begin
    nY := UNITY - 94;
    for j := (Top - Map.m_nBlockTop - 1) To (Bottom - Map.m_nBlockTop + 1) Do begin
      if g_FScreenWidth = 1024 then nX := UNITX - 66 - 84
      else
      nX := UNITX - 66;
      for i := (Left - Map.m_nBlockLeft - 2) To (Right - Map.m_nBlockLeft + 1) Do begin
        nFileIdx := map.m_MArrEi2[i div 2, j div 2].bFileIdx;
        nImgIdx := map.m_MArrEi2[i div 2,j div 2].wTileIdx;  //타일
        if (i >= 0) and (i < map.m_nWidth) and (j >= 0) and (j < map.m_nHeight) then begin
          if (I Mod 2 = 0) and (j Mod 2 = 0) then begin
            if (nImgIdx >= 0) and (nImgIdx <> 65535) and (nFileIdx < 73) and (nFileIdx >= 0) then begin
              dsurface := g_EiTiteArr[nFileIdx].Images[nimgidx];
              if dsurface <> nil then
                m_MapSurface.Draw (nX, nY, DSurface.ClientRect, DSurface, true);
            end;
          end;
        end;
        Inc(nX, UNITX);
      end;
      Inc(nY, UNITY);
    end;
  end;
end;

{----------------------- 뒈暠붚갠 -----------------------}


procedure TPlayScene.ClearDropItem;
var
  I:Integer;
  DropItem:pTDropItem;
begin
  for I := g_DropedItemList.Count - 1 downto 0 do begin
    DropItem:=g_DropedItemList.Items[I];
    if DropItem = nil then begin
      g_DropedItemList.Delete(I);
      Continue;
    end;
    if (abs(DropItem.x - g_MySelf.m_nCurrX) > 30) and (abs(DropItem.y - g_MySelf.m_nCurrY) > 30) then begin
      Dispose(DropItem);
      g_DropedItemList.Delete(I);
    end;
  end;
end;

{-----------------------------------------------------------------------}

procedure TPlayScene.PlayScene (MSurface: TDirectDrawSurface);
   function  CheckOverlappedObject (myrc, obrc: TRect): Boolean;
   begin
      if (obrc.Right > myrc.Left) and (obrc.Left < myrc.Right) and
         (obrc.Bottom > myrc.Top) and (obrc.Top < myrc.Bottom) then
         Result := TRUE
      else Result := FALSE;
   end;
const
  MissionIconPlace: array[0..9] of Integer = (0, 1, 2, 3, 4, 5, 4, 3, 2, 1);
var
   mx, my,{떨어진 아이템} i, j, k, n, m, mmm, ix, iy, line, defx, defy, wunit, fridx, ani, animationoffset, ImgPosX, ImgPosY, px, py,
    anitick, ax, ay, idx, drawingbottomline, fridx2, a, b: integer;
   DSurface, d ,Surface: TDirectDrawSurface;
   blend, movetick: Boolean;
   //myrc, obrc: TRect;
   DropItem: PTDropItem;
   evn: TClEvent;
   actor: TActor;
   meff: TMagicEff;
   msgstr: string;
   attack: string;
  UserState: TUserStateInfo;
  itemnames: string;
  Result:string;
  nWC, nHC: Integer;
  nSnowX, nSnowY: Integer;
  rc: TRect;
  nOIndex: Integer;
  nFileIdx: Integer;
  nImgIdx: Integer;
  nError: Integer;
begin
   drawingbottomline:=0;
   if g_MySelf = nil then exit;

   g_boDoFastFadeOut := FALSE;

   movetick := FALSE;
   if GetTickCount - m_dwMoveTime >= 100 then begin
      m_dwMoveTime := GetTickCount;
      movetick := TRUE;
      Inc (m_nMoveStepCount);
      if m_nMoveStepCount > 1 then
      m_nMoveStepCount := 0;
   end;
   if GetTickCount - m_dwAniTime >= 50 then begin
      m_dwAniTime := GetTickCount;
      Inc (m_nAniCount);
      if m_nAniCount > 100000 then
      m_nAniCount := 0;
   end;

   try
     i := 0;
     while TRUE do begin
      if i >= m_ActorList.Count then break;
      actor := m_ActorList[i];
      if movetick then actor.m_boLockEndFrame := FALSE;
      if not actor.m_boLockEndFrame then begin
         actor.ProcMsg;        //메세지 처리하면서 actor가 지워질 수 있음.
         if movetick then
            if actor.Move(m_nMoveStepCount) then begin    //동기화해서 움직임
               Inc (i);
               continue;
            end;
         actor.Run;         //캐릭터들을 움직이게 함.
         if actor <> g_MySelf then actor.ProcHurryMsg;
      end;
      if actor = g_MySelf then actor.ProcHurryMsg;
        //변신인 경우
      if actor.m_nWaitForRecogId <> 0 then begin
         if actor.IsIdle then begin
            DelChangeFace (actor.m_nWaitForRecogId);
            NewActor (actor.m_nWaitForRecogId, actor.m_nCurrX, actor.m_nCurrY, actor.m_btDir, actor.m_nWaitForFeature, actor.m_nWaitForStatus);
            actor.m_nWaitForRecogId := 0;
            actor.m_boDelActor := TRUE;
         end;
      end;
      if actor.m_boDelActor then begin
        ClearMissionList(Actor);
        m_ActorList.Delete (i);
        if g_TargetCret = actor then g_TargetCret := nil;
        if g_FocusCret = actor then g_FocusCret := nil;
        if g_MagicTarget = actor then g_MagicTarget := nil;
        if g_MyHero = Actor then g_MyHero := nil;
      end else
         Inc (i);
     end;
   except
      DebugOutStr ('101');
   end;

   try
     i := 0;
     while TRUE do begin
      if i >= m_EffectList.Count then break;
      meff := m_EffectList[i];
      if meff.m_boActive then begin
         if not meff.Run then begin
            meff.Free;
            m_EffectList.Delete (i);
            continue;
         end;
      end;
      Inc (i);
     end;
     i := 0;
     while TRUE do begin
      if i >= m_FlyList.Count then break;
      meff := m_FlyList[i];
      if meff.m_boActive then begin
         if not meff.Run then begin
            meff.Free;
            m_FlyList.Delete (i);
            continue;
         end;
      end;
      Inc (i);
     end;
   
     EventMan.Execute;
   except
      DebugOutStr ('102');
   end;

   try
     ClearDropItem();

     for k:=0 to EventMan.EventList.Count-1 do begin
      evn := TClEvent (EventMan.EventList[k]);
      if (Abs(evn.m_nX-g_MySelf.m_nCurrX) > 30) and (Abs(evn.m_nY-g_MySelf.m_nCurrY) > 30) then begin
         evn.Free;
         EventMan.EventList.Delete (k);
         break;
      end;
     end;
   except
      DebugOutStr ('103');
   end;

   try
     with Map.m_ClientRect do begin
       if g_FScreenWidth = 800 then begin
        Left   := g_MySelf.m_nRx - 9;
        Top    := g_MySelf.m_nRy - 11;    //하단부
        Right  := g_MySelf.m_nRx + 9;
        Bottom := g_MySelf.m_nRy + 50;
       end else begin
        Left   := g_MySelf.m_nRx - 13;
        Top    := g_MySelf.m_nRy - 14;
        Right  := g_MySelf.m_nRx + 20;
        Bottom := g_MySelf.m_nRy + 50;
       end;
     end;
     Map.UpdateMapPos (g_MySelf.m_nRx, g_MySelf.m_nRy);

     g_boViewFog := FALSE;

     m_CurrX := UNITX * 3 + g_MySelf.m_nShiftX;
     m_CurrY := UNITY * 2 + g_MySelf.m_nShiftY;

     if m_CurrX < 0 then m_CurrX := 0;
     if m_CurrY < 0 then m_CurrY := 0;
     nSnowX := m_CurrX;
     nSnowY := m_CurrY;

     drawingbottomline := g_FScreenHeight;
     m_ObjSurface.Fill(0);

     if map.m_boIsEIMAP then   //미르3맵
       DrawTileMapEI
     else DrawTileMap;
     m_ObjSurface.Draw (0, 0,
                    Rect(UNITX * 3 + g_MySelf.m_nShiftX,
                         UNITY * 2 + g_MySelf.m_nShiftY,
                         UNITX * 3 + g_MySelf.m_nShiftX + g_FScreenWidth,
                         UNITY * 2 + g_MySelf.m_nShiftY + g_FScreenHeight),
                         m_MapSurface,
                         FALSE);
   except
      DebugOutStr ('104');
   end;

   if g_FScreenWidth = 800 then begin
     defx := -UNITX * 2 - g_MySelf.m_nShiftX + AAX + 14;
     defy := -UNITY * 2 - g_MySelf.m_nShiftY;
   end else begin
     defx := -UNITX * 4 - g_MySelf.m_nShiftX + AAX + 28;
     defy := -UNITY * 2 - g_MySelf.m_nShiftY;
   end;
   m_nDefXX := defx;
   m_nDefYY := defy;

   try
    for k := 0 to m_ActorList.Count - 1 do begin
      Actor := m_ActorList[k];
      if g_FScreenWidth = 800 then begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //과부하 테스트
      end else begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //과부하 테스트
      end;
      if (not Actor.m_boDeath) and g_boEffect then
      Actor.DrawBackEff(m_ObjSurface,
        (Actor.m_nRx - Map.m_ClientRect.Left) * UNITX + defx,
        (Actor.m_nRy - Map.m_ClientRect.Top - 1) * UNITY + defy);
    end;

   except
    DebugOutStr('105');
   end;

   nError := 0;
   try
     m := defy - UNITY;
     nError := 1;
     for j:=(Map.m_ClientRect.Top - Map.m_nBlockTop) to (Map.m_ClientRect.Bottom - Map.m_nBlockTop + LONGHEIGHT_IMAGE) do begin
       if j < 0 then begin
         Inc (m, UNITY);
         continue;
       end;
       nError := 2;
       n := defx-UNITX*2;
       //*** 배경오브젝트 그리기
       nError := 3;
       for i:=(Map.m_ClientRect.Left - Map.m_nBlockLeft-2) to (Map.m_ClientRect.Right - Map.m_nBlockLeft+2) do begin
         nError := 4;
         if (i >= 0) and (i < LOGICALMAPUNIT*3) and (j >= 0) and (j < LOGICALMAPUNIT*3) then begin
           nError := 5;
           IF map.m_boIsEIMAP then begin    //미르3맵
             nFileIdx := map.m_MArrEI2ob2[i, j].bFileIdx2;
             nImgIdx := map.m_MArrEI2ob2[i, j].wObj1;
             nError := 6;
             if (nImgIdx <> 65535) and (nFileIdx < 75) and (nFileIdx > 0) and ((nFileIdx <> 0) or (nimgidx <> 0)) then begin
               nError := 7;
               if ((nFileIdx = 11) or (nFileIdx = 26) or (nFileIdx = 41) or (nFileIdx = 56) or (nFileIdx = 71)) then begin
                 ani := map.m_MArrEI2ob2[i, j].bObj1Ani;
                 if (ani <> 255) and (ani > 0) then begin
                   if (ani and 7) <> 0 then
                     ani := ani and 7;
                   nImgIdx := nImgIdx + (m_nAniCount Mod (ani + (ani * 3))) Div 4;
                 end;
               end;
               nError := 8;
               dsurface := nil;
               dsurface := g_EiTiteArr[nFileIdx].Images[nimgidx];
               if Assigned(dsurface) then begin
                 mmm := m + UNITY - dsurface.Height;
                 if (n + dsurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + dsurface.Height > 0) and (mmm < drawingbottomline) then begin
                   if (nFileIdx = 26) and (map.m_MArrEI2ob2[i, j].bFlag = 3) then  //Lilcooldoode + Azura + Coly Edit
                     DrawBlend(m_ObjSurface,n, mmm, dsurface, 1)
                   else  m_ObjSurface.Draw(n, mmm, dsurface.ClientRect, dsurface, True);
                 end;
               end;
             end;
             nError := 9;
             {Front Object Trans}
             nFileIdx := map.m_MArrEI2ob2[i, j].bFileIdx1;
             nImgIdx  := map.m_MArrEI2ob2[i, j].wObj2;
             nError := 10;
             if (nImgIdx <> 65535) and (nFileIdx < 75) and (nFileIdx > 0) and ((nFileIdx <> 0) or (nimgidx <> 0)) then begin
               nError := 11;
               if ((nFileIdx = 11) or (nFileIdx = 26) or (nFileIdx = 41) or (nFileIdx = 56) or (nFileIdx = 71)) then begin
                 ani := map.m_MArrEI2ob2[i, j].bObj2Ani;
                 if ani <> 255 then begin
                   if (ani and 7) <> 0 then
                     ani := ani and 7;
                   nImgIdx := nImgIdx + (m_nAniCount Mod (ani + (ani * 3))) Div 4;
                 end;
               end;
               dsurface := nil;
               dsurface := g_EiTiteArr[nFileIdx].Images[nimgidx];
               if Assigned(dsurface) then begin
                mmm := m + UNITY - dsurface.Height;
                 if (n + dsurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + dsurface.Height > 0) and (mmm < drawingbottomline) then begin
                   if (nFileIdx = 26) and (map.m_MArrEI2ob2[i, j].bFlag = 3) then  //Lilcooldoode + Azura + Coly Edit
                    DrawBlend(m_ObjSurface,n, mmm, dsurface, 1)
                    else m_ObjSurface.Draw(n, mmm, dsurface.ClientRect, dsurface, True);
                 end;
               end;
             end;
             nError := 12;
           end else begin
             if map.m_boIsShanda then begin    //샨다맵
               fridx := (Map.m_MArr[i, j].AniTileImg);     //TileAnimationImage
               ani := Map.m_MArr[i, j].AniTileFrame;       //TileAnimationFrames
               nError := 13;
               if (fridx > 0) and (ani > 0) then begin
                 animationoffset := (Map.m_MArr[i, j].AniTileTiles) xor $2000;
                 fridx := fridx + animationoffset * (m_nAniCount mod ani);
                 DSurface := g_WAniImages.Images[fridx];
                 nError := 14;
                 if DSurface <> nil then begin
                    if (DSurface.Width = 48) and (DSurface.Height = 32) then begin
                      mmm := m + 64;
                      if (n+DSurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + DSurface.Height > 0) and (mmm < drawingbottomline) then begin
                         m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, Dsurface, TRUE)
                      end else begin
                         if mmm < drawingbottomline then begin
                            m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, DSurface, TRUE)
                         end;
                      end;
                    end;
                 end;
               end;
               nError := 15;
               fridx := (Map.m_MArr[i, j].wFrImg) and $7FFF;
               nError := 16;
               if fridx > 0 then begin
                 wunit := Map.m_MArr[i, j].btArea - 120;       //FrontIndex
                 ani := Map.m_MArr[i, j].btAniFrame;     //FrontAnimationFrame  //에니메이션
                 blend := FALSE;
                 nError := 17;
                 if (ani and $80) > 0 then begin
                   blend := TRUE;
                   ani := ani and $7F;
                 end;
                 if ani > 0 then begin
                   anitick := Map.m_MArr[i, j].btAniTick;
                   fridx := fridx + (m_nAniCount mod (ani + (ani*anitick))) div (1+anitick);
                 end;
                 nError := 18;
                 if (Map.m_MArr[i, j].btDoorOffset and $80) > 0 then begin    //열림
                   if (Map.m_MArr[i, j].btDoorIndex and $7F) > 0 then        //문으로 표시된 것만
                     fridx := fridx + (Map.m_MArr[i, j].btDoorOffset and $7F);  //열린 문
                 end;
                 fridx := fridx - 1;
                 nError := 19;
                 DSurface := GetSObjsEx (wunit, fridx, ax, ay);
                 nError := 20;
                 if DSurface <> nil then begin
                   nError := 21;
                   if blend then begin
                     mmm := m + ay - 36;
                     if (n > 0) and (mmm + DSurface.Height > 0) and (n + Dsurface.Width < g_FScreenWidth) and
                       (mmm < drawingbottomline) then begin
                       DrawBlend (m_ObjSurface, n + ax - 2, mmm, DSurface, 1);
                     end else begin
                       if mmm < drawingbottomline then begin      //불필요하게 그리는 것을 피함
                         DrawBlend (m_ObjSurface, n + ax - 2, mmm, DSurface, 1);
                       end;
                     end;
                   end
                   else if (DSurface.Width = 48) and (DSurface.Height = 32) then begin
                     nError := 22;
                     mmm := m + UNITY - DSurface.Height + 32;
                     if (n + DSurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + DSurface.Height > 0) and
                       (mmm < drawingbottomline) then begin
                       m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, Dsurface, TRUE)
                     end else begin
                       if mmm < drawingbottomline then begin     //불필요하게 그리는 것을 피함
                         m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, DSurface, TRUE)
                       end;
                     end;
                   end else begin
                     nError := 23;
                     mmm := m + UNITY - DSurface.Height + 32;
                     if (n + DSurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + DSurface.Height > 0) and
                       (mmm < drawingbottomline) then begin
                       m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, Dsurface, TRUE)
                     end else begin
                       if mmm < drawingbottomline then begin     //불필요하게 그리는 것을 피함
                         m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, DSurface, TRUE)
                       end;
                     end;
                   end;
                 end;
               end;   //if fridx > 0 then begin
             end else begin    //본섭맵
               nError := 26;
               fridx := (Map.m_MArr[i, j].wFrImg) and $7FFF;
               nError := 27;
               if fridx > 0 then begin
                 wunit := Map.m_MArr[i, j].btArea;       //FrontIndex
                 ani := Map.m_MArr[i, j].btAniFrame;     //FrontAnimationFrame  //에니메이션
                 blend := FALSE;
                 nError := 28;
                 if (ani and $80) > 0 then begin
                   blend := TRUE;
                   ani := ani and $7F;
                 end;
                 if ani > 0 then begin
                   anitick := Map.m_MArr[i, j].btAniTick;
                   fridx := fridx + (m_nAniCount mod (ani + (ani*anitick))) div (1+anitick);
                 end;
                 nError := 29;
                 if (Map.m_MArr[i, j].btDoorOffset and $80) > 0 then begin    //열림
                   if (Map.m_MArr[i, j].btDoorIndex and $7F) > 0 then        //문으로 표시된 것만
                     fridx := fridx + (Map.m_MArr[i, j].btDoorOffset and $7F);  //열린 문
                 end;
                 nError := 30;
                 fridx := fridx - 1;
                 nError := 31;
                 DSurface := GetObjsEx (wunit, fridx, ax, ay);
                 nError := 32;
                 if DSurface <> nil then begin
                   nError := 33;
                   if blend then begin
                     mmm := m + ay - 68; //UNITY - DSurface.Height;
                     if (n > 0) and (mmm + DSurface.Height > 0) and (n + Dsurface.Width < g_FScreenWidth) and
                       (mmm < drawingbottomline) then begin
                       DrawBlend (m_ObjSurface, n + ax - 2, mmm, DSurface, 1);
                     end else begin
                       if mmm < drawingbottomline then begin      //불필요하게 그리는 것을 피함
                         DrawBlend (m_ObjSurface, n + ax - 2, mmm, DSurface, 1);
                       end;
                     end;
                   end
                   else if (DSurface.Width = 48) and (DSurface.Height = 32) then begin
                     nError := 34;
                     mmm := m + UNITY - DSurface.Height;
                     if (n + DSurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + DSurface.Height > 0) and
                       (mmm < drawingbottomline) then begin
                       m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, Dsurface, TRUE)
                     end else begin
                       if mmm < drawingbottomline then begin     //불필요하게 그리는 것을 피함
                         m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, DSurface, TRUE)
                       end;
                     end;
                   end else begin
                     nError := 35;
                     mmm := m + UNITY - DSurface.Height;
                     if (n + DSurface.Width > 0) and (n <= g_FScreenWidth) and (mmm + DSurface.Height > 0) and
                       (mmm < drawingbottomline) then begin
                       m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, Dsurface, TRUE)
                     end else begin
                       if mmm < drawingbottomline then begin     //불필요하게 그리는 것을 피함
                         m_ObjSurface.Draw (n, mmm, DSurface.ClientRect, DSurface, TRUE)
                       end;
                     end;
                   end;
                 end;
               end;   //if fridx > 0 then begin
             end;
           end;
         end;
         nError := 36;
         Inc (n, UNITX);
       end;

       if (j <= (Map.m_ClientRect.Bottom - Map.m_nBlockTop)) and (not g_boServerChanging) then begin
          //*** 바닥에 변경된 흙의 흔적
         for k:=0 to EventMan.EventList.Count-1 do begin
            evn := TClEvent (EventMan.EventList[k]);
            if (abs(evn.m_nX - g_MySelf.m_nCurrX) > 15) and (abs(evn.m_nY - g_MySelf.m_nCurrY) > 15) then begin  //과부하 테스트
              evn.Free;
              EventMan.EventList.Delete(K);
              break;
            end else begin
              if j = (evn.m_nY - Map.m_nBlockTop) then begin
                if g_boEffect then
                 evn.DrawEvent (m_ObjSurface,
                              (evn.m_nX-Map.m_ClientRect.Left)*UNITX + defx,
                              m);
              end;
            end;
         end;

         if g_boDrawDropItem then begin                  //*** 바닥에 떨어진 아이템 그리기
           for k:=0 to g_DropedItemList.Count-1 do begin
            DropItem := PTDropItem (g_DropedItemList[k]);
            if DropItem <> nil then begin
              if g_FScreenWidth = 800 then begin
                if (abs(g_MySelf.m_nCurrX - DropItem.X) > 8) or
                (g_MySelf.m_nCurrY - DropItem.Y > 8) or
                (g_MySelf.m_nCurrY - DropItem.Y < -12) then Continue;    //과부하 테스트
              end else begin
                if (abs(g_MySelf.m_nCurrX - DropItem.X) > 11) or
                (g_MySelf.m_nCurrY - DropItem.Y > 11) or
                (g_MySelf.m_nCurrY - DropItem.Y < -14) then Continue;    //과부하 테스트
              end;



               if j = (DropItem.y - Map.m_nBlockTop) then begin
                  if DropItem.BoDeco then d := g_WDecoImages.Images[DropItem.Looks - 10000]
                  else d := g_WDnItemImages.Images[DropItem.Looks];
                  if d <> nil then begin
                     ix := (DropItem.x-Map.m_ClientRect.Left) * UNITX + defx + SOFFX; // + actor.ShiftX;
                     iy := m; // + actor.ShiftY;
                     if DropItem.BoDeco then begin
                        g_WDecoImages.GetCachedImage(DropItem.Looks - 10000, px, py);
                        ImgPosX := ix + px;
                        ImgPosY := iy + py;
                     end
                     else begin
                        ImgPosX := ix + HALFX-(d.Width div 2);
                        ImgPosY := iy + HALFY-(d.Height div 2);
                     end;

                     if (DropItem = g_FocusItem) then begin
                       if ( d.Width > g_ImgMixSurface.Width ) or ( d.Height > g_ImgMixSurface.Height ) then begin
                         ImgLargeMixSurface.Draw (0, 0, d.ClientRect, d, FALSE);
                         DrawEffect (0, 0, d.Width, d.Height, ImgLargeMixSurface, ceBright);
                         m_ObjSurface.Draw (ImgPosX, ImgPosY,
                                      d.ClientRect,
                                      ImgLargeMixSurface, TRUE);
                       end else begin
                         g_ImgMixSurface.Draw (0, 0, d.ClientRect, d, FALSE);
                         DrawEffect (0, 0, d.Width, d.Height, g_ImgMixSurface, ceBright);
                         m_ObjSurface.Draw (ImgPosX, ImgPosY,
                                      d.ClientRect,
                                      g_ImgMixSurface, TRUE);
                       end;
                     end else begin
                        m_ObjSurface.Draw (ImgPosX, ImgPosY,
                                      d.ClientRect,
                                      d, TRUE);
                     end;

                  end;
               end;
            end;
           end;
         end;

         //*** 캐릭터 그리기
         for k:=0 to m_ActorList.Count-1 do begin
            actor := m_ActorList[k];
            if g_FScreenWidth = 800 then begin
              if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
                (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
                (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //과부하 테스트
            end else begin
              if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
                (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
                (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //과부하 테스트
            end;
            if (j = actor.m_nRy-Map.m_nBlockTop-actor.m_nDownDrawLevel) then begin
               actor.m_nSayX := (actor.m_nRx-Map.m_ClientRect.Left)*UNITX + defx + actor.m_nShiftX + 24;
               if actor.m_boDeath then
                  actor.m_nSayY := m + UNITY + actor.m_nShiftY + 16 - 60  + (actor.m_nDownDrawLevel * UNITY)
               else actor.m_nSayY := m + UNITY + actor.m_nShiftY + 16 - 95  + (actor.m_nDownDrawLevel * UNITY);

               if (actor <> g_MySelf) and ((actor.m_nState and $00000200 <> 0) or (actor.m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin

               end else
               if (Actor <> g_MySelf) and (Actor.m_nState and $00004000 <> 0 ) and (Actor.m_btRace = 157) then begin  //사령몹 안보이게 피통
               end else
               if (actor <> g_MySelf) and (actor.m_nState and $00004000 <> 0) and        //월영술 안보이게 횃불
              ((abs(actor.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(actor.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(Actor.m_sUserName)) then begin

               end else
                actor.DrawChr (m_ObjSurface, (actor.m_nRx-Map.m_ClientRect.Left)*UNITX + defx,
                                           m + (actor.m_nDownDrawLevel * UNITY),
                                           FALSE, TRUE);
            end;
         end;
         for k:=0 to m_FlyList.Count-1 do begin
            meff := TMagicEff(m_FlyList[k]);
            if j = (meff.Ry - Map.m_nBlockTop) then
               meff.DrawEff (m_ObjSurface);
         end;

       end;
       Inc (m, UNITY);
     end;
   except
      DebugOutStr ('106 == > ' + IntToStr(nError));
   end;



   if not g_boServerChanging then begin
      try

      if (g_MagicTarget <> nil) then begin
         if IsValidActor (g_MagicTarget) and (g_MagicTarget <> g_MySelf) and (g_MagicTarget.m_btRace <> 81) and not (g_MagicTarget.m_btRace in [240..251]) then
            if (g_MagicTarget.m_nState and $00800000 = 0) and (g_MagicTarget.m_nState and $00000080 = 0) and (g_MagicTarget.m_nState and $00004000 = 0) and (g_MagicTarget.m_nState and $00000200 = 0) then     //월영술 안보이게 타겟
               g_MagicTarget.DrawChr (m_ObjSurface,
                           (g_MagicTarget.m_nRx-Map.m_ClientRect.Left)*UNITX+defx,
                           (g_MagicTarget.m_nRy - Map.m_ClientRect.Top-1)*UNITY+defy, TRUE,FALSE);
      end;

      //**** 주인공 캐릭터 그리기
      g_MySelf.DrawChrBody(m_ObjSurface, (g_MySelf.m_nRx - Map.m_ClientRect.Left) * UNITX + defx,
        (g_MySelf.m_nRy - Map.m_ClientRect.Top - 1) * UNITY + defy, TRUE, False);

      //**** 마우스를 갖다대고 있는 캐릭터
      if (g_FocusCret <> nil) then begin
         if IsValidActor (g_FocusCret) and (g_FocusCret <> g_MySelf) and (g_FocusCret.m_btRace <> 81) and not (g_FocusCret.m_btRace in [240..251]) then
            if (g_FocusCret.m_nState and $00800000 = 0) and (g_FocusCret.m_nState and $00000080 = 0) and (g_FocusCret.m_nState and $00004000 = 0) and (g_FocusCret.m_nState and $00000200 = 0) then     //월영술 안보이게 타겟
               g_FocusCret.DrawChr (m_ObjSurface,
                           (g_FocusCret.m_nRx - Map.m_ClientRect.Left)*UNITX+defx,
                           (g_FocusCret.m_nRy - Map.m_ClientRect.Top-1)*UNITY+defy, TRUE,FALSE);
      end;

      except
         DebugOutStr ('108');
      end;
   end;


   try

   for k:=0 to m_ActorList.Count-1 do begin    //혈룡수
      actor := m_ActorList[k];

      if (actor.m_btRace = 50) then begin
        with Actor as TNPCActor do begin
          if m_MissionStatus <> NPCMS_None then begin
            d := nil;
            if GetTickCount > m_dwMissionIconTick then begin
              m_dwMissionIconTick := GetTickCount + 300;
              Inc(m_dwMissionIconIdx);
            end;
            if m_dwMissionIconIdx > 1 then m_dwMissionIconIdx := 0;
            case m_MissionStatus of
              NPCMS_Accept: d := g_WMainImages.Images[987 + m_dwMissionIconIdx];
              NPCMS_Complete: d := g_WMainImages.Images[985 + m_dwMissionIconIdx];
              NPCMS_Atelic: d := g_WMainImages.Images[983 + m_dwMissionIconIdx];
            end;
            if d <> nil then begin
              m_ObjSurface.Draw(Actor.m_nSayX - d.Width div 2 + 2, actor.m_nSayY - 36, d.ClientRect, d, True);
            end;
          end;
        end;
      end;

      if g_FScreenWidth = 800 then begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //과부하 테스트
      end else begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //과부하 테스트
      end;
      actor.DrawEff (m_ObjSurface,
                     (actor.m_nRx-Map.m_ClientRect.Left)*UNITX + defx,
                     (actor.m_nRy-Map.m_ClientRect.Top-1)*UNITY + defy);
   end;

   for k := 0 to m_ActorList.Count - 1 do begin
      Actor := m_ActorList[k];
      if g_FScreenWidth = 800 then begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 8) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -12) then Continue;    //과부하 테스트
      end else begin
        if (abs(g_MySelf.m_nCurrX - actor.m_nCurrX) > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY > 11) or
         (g_MySelf.m_nCurrY - actor.m_nCurrY < -14) then Continue;    //과부하 테스트
      end;
      if g_boEffect then
      Actor.DrawProntEff(m_ObjSurface,
        (Actor.m_nRx - Map.m_ClientRect.Left) * UNITX + defx,
        (Actor.m_nRy - Map.m_ClientRect.Top - 1) * UNITY + defy);
   end;

   for k:=0 to m_EffectList.Count-1 do begin
      meff := TMagicEff(m_EffectList[k]);
     if g_boEffect then
      meff.DrawEff (m_ObjSurface);
   end;
   except
      DebugOutStr ('109');
   end;


  try
    for k:=0 to g_DropedItemList.Count-1 do begin        //땅에 떨어진 아이템 빤짝거리는 거
      DropItem := PTDropItem (g_DropedItemList[k]);
      if (DropItem <> nil) and (Not DropItem.BoDeco)  then begin

        if g_FScreenWidth = 800 then begin
          if (abs(g_MySelf.m_nCurrX - DropItem.X) > 8) or
            (g_MySelf.m_nCurrY - DropItem.Y > 8) or
            (g_MySelf.m_nCurrY - DropItem.Y < -12) then Continue;    //과부하 테스트
        end else begin
          if (abs(g_MySelf.m_nCurrX - DropItem.X) > 11) or
            (g_MySelf.m_nCurrY - DropItem.Y > 11) or
            (g_MySelf.m_nCurrY - DropItem.Y < -14) then Continue;    //과부하 테스트
        end;

        if GetTickCount - DropItem.FlashTime > g_dwDropItemFlashTime{5 * 1000} then begin
          DropItem.FlashTime := GetTickCount;
          DropItem.BoFlash := TRUE;
          DropItem.FlashStepTime := GetTickCount;
          DropItem.FlashStep := 0;
        end;
        ix:=(DropItem.x - Map.m_ClientRect.Left) * UNITX + defx + SOFFX;
        iy:=(DropItem.y - Map.m_ClientRect.Top - 1) * UNITY + defy + SOFFY;
        if DropItem.BoFlash then begin
          if GetTickCount - DropItem.FlashStepTime >= 20 then begin
            DropItem.FlashStepTime := GetTickCount;
            Inc (DropItem.FlashStep);
          end;
          if (DropItem.FlashStep >= 0) and (DropItem.FlashStep < 10) then begin
            DSurface := g_WMainImages.GetCachedImage (FLASHBASE + DropItem.FlashStep, ax, ay);
            DrawBlend (m_ObjSurface, ix + ax, iy + ay, DSurface, 1);
          end else DropItem.BoFlash := FALSE;
        end;
      end;
    end;
  except
    DebugOutStr('110');
  end;


  {if g_boSnow and (g_nSnowLev < 4) then begin //눈오는이펙트

    nOIndex := g_DrawSnowTick[0].nIndex;
    if GetTickCount - g_DrawSnowTick[0].dwDrawTick > 150 then begin
      Inc(g_DrawSnowTick[0].nIndex);
      g_DrawSnowTick[0].dwDrawTick := GetTickCount;
    end;
    if not ((g_DrawSnowTick[0].nIndex >= 3020) and (g_DrawSnowTick[0].nIndex <= 3031)) then g_DrawSnowTick[0].nIndex := 3020;

    if nOIndex <> g_DrawSnowTick[0].nIndex then begin
      m_SnowSurface.Fill(0);
      nWC := 0;
      nHC := 0;
      while True do begin
        dsurface := g_WNpcImgImages.Images[g_DrawSnowTick[0].nIndex];    //눈오는이펙트
        if dsurface <> nil then begin
          rc := dsurface.ClientRect;
          rc.Left := 30;
          rc.Top := 30;
          rc.Right := rc.Right - 30;
          rc.Bottom := rc.Bottom - 100;
          m_SnowSurface.Draw(nWC, nHC, rc, dsurface, False);
          Inc(nWC, rc.Right - rc.Left);
          if nWC >= m_SnowSurface.Width then begin
            nWC := 0;
            Inc(nHC, rc.Bottom - rc.Top);
          end;
          if nHC >= m_SnowSurface.Height then Break;
        end else Break;
      end;
    end;
    case g_nSnowLev of
      1: begin
        DrawBlend(m_ObjSurface, 0, 0, m_SnowSurface, 1);
      end;
      2: begin
        DrawBlend(m_ObjSurface, 0, 1, m_SnowSurface, 1);
        DrawBlend(m_ObjSurface, 1, 0, m_SnowSurface, 1);
      end;
      3: begin
        DrawBlend(m_ObjSurface, 0, 1, m_SnowSurface, 1);
        DrawBlend(m_ObjSurface, 1, 0, m_SnowSurface, 1);
        DrawBlend(m_ObjSurface, 1, 1, m_SnowSurface, 1);
        DrawBlend(m_ObjSurface, 0, 0, m_SnowSurface, 1);
      end;
      else begin
        DrawBlend(m_ObjSurface, 0, 0, m_SnowSurface, 1);
      end;
    end;
  end;

  if g_boFlower then begin //꽃내리는이펙트

    nOIndex := g_DrawFlowerTick[0].nIndex;
    if GetTickCount - g_DrawFlowerTick[0].dwDrawTick > 150 then begin
      Inc(g_DrawFlowerTick[0].nIndex);
      g_DrawFlowerTick[0].dwDrawTick := GetTickCount;
    end;
    if not ((g_DrawFlowerTick[0].nIndex >= 2290) and (g_DrawFlowerTick[0].nIndex <= 2369)) then g_DrawFlowerTick[0].nIndex := 2290;

    if nOIndex <> g_DrawFlowerTick[0].nIndex then begin
      m_SnowSurface.Fill(0);
      nWC := 0;
      nHC := 0;
      while True do begin
        dsurface := g_WMagicNewImages.Images[g_DrawFlowerTick[0].nIndex];     //눈오는이펙트
        if dsurface <> nil then begin
          rc := dsurface.ClientRect;
          rc.Left := 30;
          rc.Top := 30;
          rc.Right := rc.Right - 30;
          rc.Bottom := rc.Bottom - 100;
          m_SnowSurface.Draw(nWC, nHC, rc, dsurface, False);
          Inc(nWC, rc.Right - rc.Left);
          if nWC >= m_SnowSurface.Width then begin
            nWC := 0;
            Inc(nHC, rc.Bottom - rc.Top);
          end;
          if nHC >= m_SnowSurface.Height then Break;
        end else Break;
      end;
    end;
    DrawBlend(m_ObjSurface, 0, 0, m_SnowSurface, 1);

  end;
          }

  if g_boSnow {and (g_nSnowLev > 3)} then begin //Turn ON/OFF snow Stuff
    for I:= 0 to g_nSnowLev - 1 do begin
      if g_SnowStart[i] = False then begin
        g_SnowStart[i] := True;
        g_SnowFlakeStartTick[i]:=GetTickCount;
        g_snowflakeimage[i] := g_WMagicNewImages.Images[3790+Random(5)];
        g_NewSnowYSpeed[i]  := 4 + Random(6);
      end;
    end;
  end;

  if g_boSnow {and (g_nSnowLev > 3)} then begin //If map is snow
    for i:= 0 to g_nSnowLev - 1 do begin
      if (GetTickCount - g_SnowFlakeStartTick[i] > 750 * I) then begin //Begin Each flake at a set time above each other
        if (GetTickCount - g_SnowFlakeTick[i] > 50)  then begin
          g_SnowFlakeTick[i]:=GetTickCount();
          if g_SnowFlakeX[I] = 0 then begin
            if g_nSnowLev > 300 then g_SnowFlakeX[i]:=Random(g_FScreenWidth + 150) else g_SnowFlakeX[i]:=Random(g_FScreenWidth);
            g_SnowFlakeY[i]:=0;
          end;
          if g_nSnowLev > 300 then begin //if over 300 then blizard occurs
            g_NewSnowX[i]:= g_NewSnowX[i] - 7;
            g_NewSnowY[i]:= g_NewSnowY[i] + g_NewSnowYSpeed[i] + 6;
          end else begin
            g_NewSnowX[i]:= g_NewSnowX[i] - Random(2);
            g_NewSnowX[i]:= g_NewSnowX[i] + Random(1);
            g_NewSnowY[i]:= g_NewSnowY[i] + g_NewSnowYSpeed[i];
          end;
        end;
        if g_NewSnowY[i] > g_FScreenHeight then begin
          g_NewSnowY[i]:= 0;
          g_NewSnowX[i]:= 0;
          if g_nSnowLev > 300 then g_SnowFlakeX[i]:=Random(g_FScreenWidth + 150) else g_SnowFlakeX[i]:=Random(g_FScreenWidth);
          g_NewSnowYSpeed[i]:= 4 + Random(6);
          g_snowflakeimage[i] := g_WMagicNewImages.Images[3790+Random(5)];
        end;
        if g_snowflakeimage[i] <> nil then begin
          DrawBlend(m_ObjSurface,g_SnowFlakeX[i] + g_NewSnowX[i], g_snowFlakeY[i] + g_NewSnowY[i],g_snowflakeimage[i], 1);  //DrawBlend3
        end;
      end;
    end;
  end else begin
    for i:= 0 to 500 do begin //If no snow then wipe all flakes
      g_SnowFlakeX[i]:=0;
      g_SnowFlakeY[i]:=0;
      g_NewSnowX[i]:=0;
      g_NewSnowY[i]:=0;
      g_SnowStart[i] := False;
      g_SnowFlakeTick[i] := GetTickCount;
      g_SnowFlakeStartTick[i] := GetTickCount;
    end;
  end;
 // if g_nSnowLev > 3 then begin
  for i:= g_nSnowLev to 500 do begin //Snow Flakes not being used from old snow map
    g_SnowFlakeX[i]:=0;
    g_SnowFlakeY[i]:=0;
    g_NewSnowX[i]:=0;
    g_NewSnowY[i]:=0;
    g_SnowStart[i] := False;
    g_SnowFlakeTick[i] := GetTickCount;
    g_SnowFlakeStartTick[i] := GetTickCount;
  end;
  //end;


  if m_OperateHintSurface <> nil then
    m_ObjSurface.Draw(g_FScreenWidth - DEFSCREENWIDTH + OPERATEHINTX, g_FScreenHeight - DEFSCREENHEIGHT + OPERATEHINTY, m_OperateHintSurface.ClientRect, m_OperateHintSurface, True);


   try
 //  g_boViewFog:=TRUE;     //  밤낮설정 2009-03-25
  { if  g_boViewFog  then begin
      ApplyLightMap;
      DrawFog (m_ObjSurface, m_PFogScreen, m_nFogWidth);
      MSurface.Draw (SOFFX, SOFFY, m_ObjSurface.ClientRect, m_ObjSurface, FALSE);
   end else begin  }
      if g_MySelf.m_boDeath then
         DrawEffect (0, 0, m_ObjSurface.Width, m_ObjSurface.Height, m_ObjSurface,{ g_DeathColorEffect}ceGrayScale);
     //오브젝트 레이어와  배경과 합성
      MSurface.Draw (SOFFX, SOFFY, m_ObjSurface.ClientRect, m_ObjSurface, FALSE);
  // end;
   except
      DebugOutStr ('111');
   end;

  SetBkMode (MSurface.Canvas.Handle, TRANSPARENT);
  if not g_boSkillSetting then begin
    if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then
      BoldTextOut (MSurface, g_FScreenWidth - 126, {125}156, clGreen, clBlack, '[Ctrl숩 학뻣]')
    else
      BoldTextOut (MSurface, g_FScreenWidth - 126, {6}47, clGreen, clBlack, '[Ctrl숩 학뻣]') ;
  end else begin
    if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then
      BoldTextOut (MSurface, g_FScreenWidth - 126, {125}156, clGreen, clBlack, '[~숩 학뻣]')
    else
      BoldTextOut (MSurface, g_FScreenWidth - 126, {6}47, clGreen, clBlack, '[~숩 학뻣]');
  end;                                               //공격모드 표시


  if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin

      case g_nAttatckMode of
      0 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[홍竟묑샌]')
      end;
      1 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[뵨틱묑샌]')
      end;
      2 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[긍莉묑샌]')
      end;
      3 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[契삔묑샌]')
      end;
      4 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[젬촉묑샌]')
      end;
      5 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {139}170, clYellow, clBlack, '[�틋朱�샌]')
      end;
     end;
    end else begin
      case g_nAttatckMode of
      0 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[홍竟묑샌]')
      end;
      1 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[뵨틱묑샌]')
      end;
      2 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[긍莉묑샌]')
      end;
      3 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[契삔묑샌]')
      end;
      4 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[젬촉묑샌]')
      end;
      5 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {20}61, clYellow, clBlack, '[�틋朱�샌]')
      end;
     end;
  end;

  if g_boShowGreenHint then begin
  if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin
    case g_nGroupCall of
    0 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {153}184, clRed, clBlack, '[앳없莖뒈북寧]')
    end;
    1 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {153}184, clYellow, clBlack, '[豚冀莖뒈북寧]')
    end;
    end;
  end else begin
    case g_nGroupCall of
    0 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {34}75, clRed, clBlack, '[앳없莖뒈북寧]')
    end;
    1 :begin
      BoldTextOut (MSurface, g_FScreenWidth - 126, {34}75, clYellow, clBlack, '[豚冀莖뒈북寧]')
    end;
    end;
  end;
  end;


  if g_boShowGreenHint then begin
   if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin   //스쳐 사운드
      if not g_boSound then begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, {167}198, clCream, clBlack, '[ ' + '　　　     '+'    ]');
      end else begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, {167}198, clCream, clBlack, '[踏狗�汗�: ' + '  '+'    ]');
      end;
   end else begin
      if not g_boSound then begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, {48}89, clCream, clBlack, '[ ' + '　　　     '+'    ]');
      end else begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, {48}89, clCream, clBlack, '[踏狗�汗�: ' + '  '+'    ]');
      end;
   end;

   if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin   //스쳐 사운드
      if not g_boBGSound then begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, 212, clCream, clBlack, '[  ' + '　　　     ' + '  ]');
      end else begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, 212, clCream, clBlack, '[교쒼�汗�:' + '    ' + '  ]');
      end;
   end else begin
      if not g_boBGSound then begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, 103, clCream, clBlack, '[  ' + '　　　     ' + ' ]');
      end else begin
        BoldTextOut (MSurface, g_FScreenWidth - 126, 103, clCream, clBlack, '[교쒼�汗�:' + '    ' + '  ]');
      end;
   end;

   if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin
     if not g_boSound then begin
       BoldTextOut (MSurface, g_FScreenWidth - 102, 198, clTeal, clBlack, '쓰稜')
     end else begin
      if (g_btSoundVolume) <= 20 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clAqua, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 40 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clYellow, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 60 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clLime, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 80 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clSkyBlue, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clCream, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) > 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 198, clCream, clBlack, '100%')
     end;
   end else begin
     if not g_boSound then begin
       BoldTextOut (MSurface, g_FScreenWidth - 102, 89, clTeal, clBlack, '쓰稜')
     end else begin
      if (g_btSoundVolume) <= 20 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clAqua, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 40 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clYellow, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 60 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clLime, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 80 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clSkyBlue, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) <= 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clCream, clBlack, intToStr(g_btSoundVolume)+'%')
      else
      if (g_btSoundVolume) > 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 89, clCream, clBlack, '100%')
     end;
   end;

   if ((g_boViewMiniMap) or (FrmDlg.DMiniMap.Visible)) and (g_nMiniMapIndex <> -1) then begin
     if not g_boBGSound then begin
       BoldTextOut (MSurface, g_FScreenWidth - 102, 212, clTeal, clBlack, '쓰稜')
     end else begin
      if (g_btMP3Volume) <= 20 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clAqua, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 40 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clYellow, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 60 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clLime, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 80 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clSkyBlue, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clCream, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) > 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 212, clCream, clBlack, '100%')
     end;
   end else begin
     if not g_boBGSound then begin
       BoldTextOut (MSurface, g_FScreenWidth - 102, 103, clTeal, clBlack, '쓰稜')
     end else begin
      if (g_btMP3Volume) <= 20 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clAqua, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 40 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clYellow, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 60 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clLime, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 80 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clSkyBlue, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) <= 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clCream, clBlack, intToStr(g_btMP3Volume)+'%')
      else
      if (g_btMP3Volume) > 100 then
       BoldTextOut (MSurface, g_FScreenWidth - 72, 103, clCream, clBlack, '100%')
      end;
   end;
  end;

  MSurface.Canvas.Release;

end;

{-------------------------------------------------------}

//cx, cy, tx, ty
procedure TPlayScene.NewMagic (aowner: TActor;
                               magid, magnumb{Effect}, cx, cy, tx, ty, targetcode: integer;
                               mtype: TMagicType; //EffectType
                               Recusion: Boolean;
                               anitime: integer;
                               var bofly: Boolean);
var
   i, scx, scy, sctx, scty, effnum: integer;
   meff, meff2, meff3, meff4: TMagicEff;
   target: TActor;
   wimg: TWMImages;


   m_boHitEffect,m_nMagLight :TActor;
begin
   {if Not g_boEffect then begin
      meff := nil;
      meff2 := nil;
      meff3 := nil;
      meff4 := nil;
      Exit;
   end; }

   bofly := FALSE;
   if Not(magid in [MAGIC_ICEKING_ATT1_1..MAGIC_ICEKING_ATT1_3,SM_DRAGON_LIGHTING, 70..74,111,
   MAGIC_SOULBALL_ATT3_1..MAGIC_SOULBALL_ATT3_5,MAGIC_KINGTURTLE_ATT2_1,MAGIC_KINGTURTLE_ATT2_2, MAGIC_SPIDER_ATT1,
    MAGIC_MilSTONE_ATT3_1..MAGIC_MilSTONE_ATT3_5,MAGIC_SPIDER_ATT_1])  then //발사 마법은 중복됨. // FireDragon
      for i:=0 to m_EffectList.Count-1 do
         if TMagicEff(m_EffectList[i]).ServerMagicId = magid then
            exit; //
   ScreenXYfromMCXY (cx, cy, scx, scy);
   ScreenXYfromMCXY (tx, ty, sctx, scty);
   if magnumb > 0 then  GetEffectBase (magnumb-1, 0, wimg, effnum)  //magnumb{Effect}
   else effnum := -magnumb;
   target := FindActor (targetcode);

   meff := nil;
   meff2 := nil;
   meff3 := nil;
   meff4 := nil;
   case mtype of  //EffectType
      mtReady, mtFly, mtFlyAxe: begin
        meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
        meff.TargetActor := target;
        case magnumb of

          39: begin   //결빙장
            meff.frame := 4;
            if wimg <> nil then
            meff.ImgLib:=wimg;
          end;


          75: begin   //묘설란
            meff.frame := 6;
            if wimg <> nil then
            meff.ImgLib:=wimg;
          end;

          38: begin    //쌍룡참
              meff.TargetActor := self;
              meff.MagExplosionBase := TDBBASE;
              meff.ExplosionFrame := 215;
              meff.Light := 2;
              meff.ImgLib:=wimg;
          end;
          57: meff := nil; //빙염술
          44: meff := nil;  //공파섬
          98{103}: meff := nil;  //참격
          114{120}: meff := nil; //고려무진봉
          119{125}: meff := nil; //직도황룡봉
          62{65}: begin             //포박술
              meff := nil;
             PlaySound (10655);
             end;
          68{72}: begin             //월하난무
              meff := nil;
             PlaySound (10727);
             end;
          77{87}: begin //태극진
             meff := TMagicEff.Create(magid, 360 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.magnumber := 77;
             meff.ImgLib := g_WMagicNewImages;
             meff.TargetActor := target;
             meff.MagExplosionBase := 521;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 4;
             meff.frame := 3;
             PlaySound(3057);
          end;


          121{127}: begin     //비격장
            for I := 0 to 2 do begin
              meff := TDelayMagicEff.Create(magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
              meff.TargetActor := target;
              TDelayMagicEff(meff).nDelayTime := GetTickCount + LongWord(I * 100);
              meff.frame := 5;
              meff.EffectBase := 1600;
              meff.ImgLib := g_WMagic_BonzeImages;
              meff.MagExplosionBase := 1770;
              if i = 0 then
                meff.ExplosionFrame := 14
              else
                meff.ExplosionFrame := 1;

              meff.TargetRx := tx;
              meff.TargetRy := ty;
              if meff.TargetActor <> nil then begin
                meff.TargetRx := TActor(meff.TargetActor).m_nCurrX;
                meff.TargetRy := TActor(meff.TargetActor).m_nCurrY;
              end;
              meff.MagOwner := aowner;
              m_EffectList.Add(meff);
            end;
            exit;
          end;

          MAGIC_TEGU_ATT: begin //태구오마
             meff := TMagicEff.Create(magid, 6210 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[36];
             meff.TargetActor := target;
             meff.MagExplosionBase := 6370;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 6;
          end;
          MAGIC_JUCK_ATT: begin //오마적병
             meff := TMagicEff.Create(magid, 2040 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[37];
             meff.TargetActor := target;
             meff.MagExplosionBase := 2200;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 8;
          end;
          MAGIC_GHOST_ATT: begin //선박의악령
             meff := TMagicEff.Create(magid, 4870 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[38];
             meff.TargetActor := target;
             meff.MagExplosionBase := 5030;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 4;
          end;
          MAGIC_FRAM_NO_ATT: begin //농노군
             meff := TMagicEff.Create(magid, 570 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[39];
             meff.TargetActor := target;
             meff.MagExplosionBase := 730;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 5;
          end;
          MAGIC_BIG_SNAKE: begin //대망
             meff := TMagicEff.Create(magid, 6710 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[39];
             meff.TargetActor := target;
             meff.MagExplosionBase := 6870;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 4;
          end;
          MAGIC_JUMAFIREARC1: begin //주마화궁사
             meff := TMagicEff.Create(magid, 1730 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[40];
             meff.TargetActor := target;
             meff.MagExplosionBase := 1890;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 3;
          end;
          MAGIC_JUMAFIREARC2: begin  //주마화궁사
             meff := TMagicEff.Create(magid, 1910 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[40];
             meff.TargetActor := target;
             meff.MagExplosionBase := 2100;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 3;
          end;
          MAGIC_ICEARC: begin  //빙원귀궁사
             meff := TMagicEff.Create(magid, 2840 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[42];
             meff.TargetActor := target;
             meff.MagExplosionBase := 3000;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 6;
          end;
          MAGIC_JUMAWIND: begin  //주마풍궁사
             meff := TMagicEff.Create(magid, 2780 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[40];
             meff.TargetActor := target;
             meff.MagExplosionBase := 2940;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 3;
          end;
          MAGIC_ARCHER_ATT1: begin  //유상궁장
             meff := TMagicEff.Create(magid, 3840 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[41];
             meff.TargetActor := target;
             meff.MagExplosionBase := 4000;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 3;
          end;
          MAGIC_ARCHER_ATT2: begin  //유상궁장
             meff := TMagicEff.Create(magid, 4020 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[41];
             meff.TargetActor := target;
             meff.MagExplosionBase := 4180;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 3;
          end;
          MAGIC_ARCHER_ATT3: begin  //유상궁장
             meff := TMagicEff.Create(magid, 4200 - 10, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.ImgLib := g_WMonImagesArr[41];
             meff.TargetActor := target;
             meff.MagExplosionBase := 4190;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 0;
             meff.frame := 3;
          end;
        end;
        bofly := TRUE;
      end;
      mtExplosion:
        case magnumb of
          18: begin
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1570;
            meff.TargetActor := target;
            meff.NextFrameTime := 80;
          end;
          21: begin
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1660;
            meff.TargetActor := nil; //target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 20;
            meff.Light := 3;
          end;
          26: begin    //탐기파연
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 3990;
            meff.TargetActor := target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 10;
            meff.Light := 2;
          end;
          27: begin
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1800;
            meff.TargetActor := nil; //target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 10;
            meff.Light := 3;
          end;
          30: begin
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 3930;
            meff.TargetActor := target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 16;
            meff.Light := 3;
          end;
          31: begin  //빙설풍
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 3850;
            meff.TargetActor := nil; //target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 20;
            meff.Light := 3;
          end;
          34: begin
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 140;
            meff.TargetActor := target; //target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 20;
            meff.Light := 3;
            if wimg <> nil then
              meff.ImgLib:=wimg;
          end;
          40: begin           //정화술
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 620;
            meff.TargetActor := nil; //target;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 10;
            meff.Light := 3;
            meff.ImgLib:=wimg;
          end;
          47: begin              //포승검
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1010;
            meff.TargetActor := Target; //target;
            Meff.FixedEffect := TRUE;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 10;
            meff.Light := 2;
            if wimg <> nil then
              meff.ImgLib:=wimg;
          end;
          48: begin       //흡혈술
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1060;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 20;
            meff.Light := 3;
            if wimg <> nil then
              meff.ImgLib:=wimg;
            PlaySound (10482);
          end;
          49: begin    //미혼술
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, TRUE, anitime);
            meff.MagExplosionBase := 1110;
            meff.TargetActor := nil; //target;
            meff.NextFrameTime := 100;
            meff.ExplosionFrame := 10;
            meff.Light := 3;
            if wimg <> nil then
              meff.ImgLib:=wimg;
              PlaySound (10492);
          end;

          52: begin //천상빙환
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty - (g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), mtype, Recusion, anitime);
            meff.MagExplosionBase := 1550;
            meff.NextFrameTime := 100;
            meff.ExplosionFrame := 30;
            meff.ImgLib := g_WMagic2Images;
            PlaySound (10523);
          end;

          53: begin //천상낙염
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1600;
            meff.NextFrameTime := 300;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WMagic2Images;
            PlaySound (10532);

            meff2 := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty - (g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), mtype, Recusion, anitime);
            meff2.MagExplosionBase := 1610;
            meff2.NextFrameTime := 100;
            meff2.ExplosionFrame := 30;
            meff2.ImgLib := g_WMagic2Images;
            PlaySound (10533);
          end;

          107: begin //낙뢰
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 410;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WDragonImg;
            PlaySound (8301);
          end;

          56 :begin  //일섬
           PlaySound (10566);
          end;

          70{74}: begin    //심연술
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 80;
            meff.TargetActor := nil;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WMagic3Images;
            PlaySound (10740);
          end;
          72,73,74{77}{78}{79}: begin    //혈룡검법  천상비술 혈룡수
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 130;
            meff.TargetActor := nil;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WMagic3Images;
          end;
          76{86}: begin//빙뇌천
            meff := TMagicEff.Create(magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 110;
            meff.TargetActor := nil;
            meff.NextFrameTime := 80;
            meff.ExplosionFrame := 8;
            meff.light := 3;
            meff.ImgLib := g_WMagicNewImages;
            meff.magnumber := 76;
            PlaySound(10572);
          end;
          78{89}: begin       //진위보
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1830;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 10;
            meff.Light := 3;
            if wimg <> nil then
              meff.ImgLib:=wimg;
            PlaySound(8103);
          end;

          80{91}: begin //독침술
             meff := TMagicEff.Create(magid, effnum{1150 - 10}, scx, scy, sctx, scty, mtype, Recusion, anitime);
             meff.magnumber := 80;
             meff.ImgLib := g_WMagicNewImages;
             meff.TargetActor := nil;
             meff.MagExplosionBase := 1320;
             meff.NextFrameTime := 100;
             meff.ExplosionFrame := 10;
             meff.frame := 5;
             PlaySound(3057);
          end;

          87{92}: begin       //격공섭물
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1660;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 10;
            meff.Light := 3;
            if wimg <> nil then
              meff.ImgLib:=wimg;
            PlaySound(2541);
          end;
          94{83}: begin //음양오행진
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 620;
            meff.NextFrameTime := 120;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WMagic3Images;
            PlaySound (10830);
          end;

          104: begin    //운중뢰격
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 3670;
            meff.TargetActor := target;
            meff.NextFrameTime := 100;
            meff.ExplosionFrame := 13;
            meff.ImgLib := g_WMagicNewImages;
            meff.Light := 4;
            Playsound2 (m_108_2);
          end;
          105: begin    //암독만계
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 3720;
            meff.TargetActor := target;
            meff.NextFrameTime := 100;
            meff.ExplosionFrame := 23;
            meff.ImgLib := g_WMagicNewImages;
            meff.Light := 2;
            PlaySound2 (m_109_2);
          end;
          128: begin //천상폭염
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 210;
            meff.NextFrameTime := 300;
            meff.ExplosionFrame := 10;
            meff.ImgLib := g_WMagic0Images;
            PlaySound (10532);
            PlaySound2 (as_134_2);

            meff2 := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty - (g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), mtype, Recusion, anitime);
            meff2.MagExplosionBase := 220;
            meff2.NextFrameTime := 100;
            meff2.ExplosionFrame := 30;
            meff2.ImgLib := g_WMagic0Images;
            PlaySound2 (as_134_3);
            PlaySound (10533);
          end;

          129{135}: begin //낙천뢰
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 1120;
            meff.NextFrameTime := 50;
            meff.ExplosionFrame := 39;
            meff.ImgLib := g_WMagic0Images;
            PlaySound (1923);
            PlaySound (8301);
          end;

          131{137}: begin //선천
            meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
            meff.MagExplosionBase := 880;
            meff.NextFrameTime := 100;
            meff.ExplosionFrame := 20;
            meff.ImgLib := g_WMagic0Images;
            PlaySound2 (as_137_2);
            PlaySound2 (as_137_3);
          end;
      end;
      mtFireWind: begin
        case magnumb of
          124{130} :begin  //마혈광섬
           PlaySound2 (as_130_1);
          end;
          127{133} :begin  //화룡진풍
           PlaySound2 (as_133);
          end;
        end;
         meff := nil;
      end;
      mtFireGun:
         meff := TFireGunEffect.Create (930, scx, scy, sctx, scty);
      mtThunder: begin
            if  magnumb = MAGIC_SOULBALL_ATT2 then begin
               meff := TThuderEffectEx.Create (2120, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
            end
            else if  magnumb = MAGIC_SOULBALL_ATT3_1 then begin
               meff := TThuderEffectEx.Create (2160, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_SOULBALL_ATT3_2 then begin
               meff := TThuderEffectEx.Create (2180, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_SOULBALL_ATT3_3 then begin
               meff := TThuderEffectEx.Create (2200, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_SOULBALL_ATT3_4 then begin
               meff := TThuderEffectEx.Create (2220, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_SOULBALL_ATT3_5 then begin
               meff := TThuderEffectEx.Create (2240, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = SM_DRAGON_LIGHTING then begin
               meff := TThuderEffectEx.Create (230, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 5;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 80;
            end

            else if  magnumb = MAGIC_DUN_THUNDER then begin              //마룡번개
               meff := TThuderEffectEx.Create (400, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 5;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 100;
            end

            else if  magnumb = MAGIC_DUN_THUNDER2 then begin              //마룡번개
               meff := TThuderEffectEx.Create (410, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 5;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 100;
            end

            else if  magnumb = MAGIC_DUN_FIRE1 then begin       //마룡번개
               meff := TThuderEffectEx.Create (440, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 90;
            end
            else if  magnumb = MAGIC_DUN_FIRE2 then begin      //마룡번개
               meff := TThuderEffectEx.Create (470, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 90;
            end
            else if  magnumb = MAGIC_DRAGONFIRE then begin    //마룡번개
               meff := TThuderEffectEx.Create (200, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 120;
            end
            else if  magnumb = MAGIC_FIREBURN then begin      //용석상
               meff := TThuderEffectEx.Create (350, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 35;
               meff.ImgLib := g_WDragonImg;
               meff.NextFrameTime := 100;
            end

            else if  magnumb = MAGIC_SPIDER_ATT_1 then begin  //공작주 거미줄
               meff := TThuderEffectEx.Create (4490, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 11;
               meff.ImgLib := g_WMonImagesArr[36];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_MilSTONE_ATT3_1 then begin
               meff := TThuderEffectEx.Create (3770, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_MilSTONE_ATT3_2 then begin
               meff := TThuderEffectEx.Create (3770, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_MilSTONE_ATT3_3 then begin
               meff := TThuderEffectEx.Create (3770, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_MilSTONE_ATT3_4 then begin
               meff := TThuderEffectEx.Create (3770, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_MilSTONE_ATT3_5 then begin
               meff := TThuderEffectEx.Create (3770, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end


            else if  magnumb = MAGIC_WILDATTACK_ATT3_1 then begin  //야수왕
               meff := TThuderEffectEx.Create (5560, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 30;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_WILDATTACK_ATT3_2 then begin  //야수왕
               meff := TThuderEffectEx.Create (5470, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_WILDATTACK_ATT3_3 then begin  //야수왕
               meff := TThuderEffectEx.Create (5560, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 30;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_WILDATTACK_ATT3_4 then begin  //야수왕
               meff := TThuderEffectEx.Create (5560, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 30;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_WILDATTACK_ATT3_5 then begin  //야수왕
               meff := TThuderEffectEx.Create (5560, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 30;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_WILDATTACK_ATT3_6 then begin  //야수왕
               meff := TThuderEffectEx.Create (5560, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 30;
               meff.ImgLib := g_WMonImagesArr[22];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_DARK_THUNDER then begin //흑천귀
               meff := TThuderEffectEx.Create (5940, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 11;
               meff.ImgLib := g_WMonImagesArr[31];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_EXPLOSIN then begin //폭마야차
               meff := TThuderEffectEx.Create (1050, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 6;
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_EXPLOSIN_Tree then begin //삼나무정백
               meff := TThuderEffectEx.Create (1820, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[41];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_EXPLOSIN_ICE then begin //빙원귀존
               meff := TThuderEffectEx.Create (3650, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[42];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_EXPLOSIN_DEVIL then begin //악귀
               meff := TThuderEffectEx.Create (5630, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[42];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_EXPLOSIN_WIZARD then begin //현월단술사
               meff := TThuderEffectEx.Create (1660, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMagicImages;
               meff.NextFrameTime := 70;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_FIREEXPLOSIN then begin //열장적귀
               meff := TThuderEffectEx.Create (3820, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_FIREEXPLOSIN2 then begin //인간수
               meff := TThuderEffectEx.Create (4680, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[35];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end


            else if  magnumb = MAGIC_OLDKING_ATT1_1 then begin //고대수호장
               meff := TThuderEffectEx.Create (7070, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 7;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_OLDKING_ATT1_2 then begin //고대수호장
               meff := TThuderEffectEx.Create (7100, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_WIND_LEAD_1 then begin //마풍석괴
               meff := TThuderEffectEx.Create (8550, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 12;
               meff.ImgLib := g_WMonImagesArr[40];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_ICEKING_ATT1_1 then begin //한빙수호귀
               meff := TThuderEffectEx.Create (3755, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 7;
               meff.ImgLib := g_WMonImagesArr[28];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end
            else if  magnumb = MAGIC_ICEKING_ATT1_2 then begin //한빙수호귀
               meff := TThuderEffectEx.Create (3755, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 7;
               meff.ImgLib := g_WMonImagesArr[28];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end
            else if  magnumb = MAGIC_ICEKING_ATT1_3 then begin //한빙수호귀
               meff := TThuderEffectEx.Create (3755, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 7;
               meff.ImgLib := g_WMonImagesArr[28];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end
            else if  magnumb = MAGIC_ICEKING_ATT1_4 then begin //한빙수호귀
               meff := TThuderEffectEx.Create (3896, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 6;
               meff.ImgLib := g_WMonImagesArr[28];
               meff.NextFrameTime := 150;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_SIDEARMS then begin //패검적귀
               meff := TThuderEffectEx.Create (5850, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 6;
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_NAMMAN_ATT1_1 then begin //단묵
               meff := TThuderEffectEx.Create (5440, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 8;
               meff.ImgLib := g_WMonImagesArr[32];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_NAMMAN_ATT1_2 then begin //단묵
               meff := TThuderEffectEx.Create (5700, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[32];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_MERMAID_ATT1_1 then begin //수어귀
               meff := TThuderEffectEx.Create (3020, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[35];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_MERMAID_ATT1_2 then begin //수어귀
               meff := TThuderEffectEx.Create (3030, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 20;
               meff.ImgLib := g_WMonImagesArr[35];
               meff.NextFrameTime := 100;
               meff.Light := 2;
            end

            else if  magnumb = MAGIC_MED_ATT1_2 then begin
               meff := TThuderEffectEx.Create (6010, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 13;
               meff.ImgLib := g_WMonImagesArr[37];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end

            else if  magnumb = MAGIC_DAGGER then begin //독인적귀
               meff := TThuderEffectEx.Create (6870, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[29];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end

            else if  magnumb = MAGIC_ICEGUARD then begin //견빙수호귀
               meff := TThuderEffectEx.Create (840, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end

            else if  magnumb = MAGIC_MAGICGUARD then begin //마염수호장
               meff := TThuderEffectEx.Create (1720, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end

            else if  magnumb = MAGIC_DARKGUARD then begin //암혼수호장
               meff := TThuderEffectEx.Create (2580, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end

            else if  magnumb = MAGIC_POWERGUARD then begin //열진수호장
               meff := TThuderEffectEx.Create (3440, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[30];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end
            else if  magnumb = MAGIC_POT_ATT then begin //호중귀1
               meff := TThuderEffectEx.Create (6830, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 8;
               meff.ImgLib := g_WMonImagesArr[33];
               meff.NextFrameTime := 100;
              // meff.Light := 0;
            end
            else if  magnumb = MAGIC_HAMMERCAT then begin //얼룩망치괭이
               meff := TThuderEffectEx.Create (1930, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 6;
               meff.ImgLib := g_WMonImagesArr[33];
               meff.NextFrameTime := 100;
               meff.Light := 3;
            end
            else if  magnumb = MAGIC_FOX_THUNDER then begin     //비월적호
               meff := TThuderEffectEx.Create (780, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 9;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
            end
            else if  magnumb = MAGIC_FOX_FIRE1 then begin
               meff := TThuderEffectEx.Create (790, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[23];
               meff.NextFrameTime := 100;
            end
            else if  magnumb = MAGIC_SERPENT_1 then begin
               meff := TThuderEffectEx.Create (1250, sctx, scty, nil, magnumb); //target);
               meff.ExplosionFrame := 15;
               meff.ImgLib := g_WMagic2Images;
               meff.NextFrameTime := 90;
            end
            else if  magnumb = MAGIC_KINGTURTLE_ATT2_1 then begin
               meff := TThuderEffectEx.Create (3010, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 12;
               meff.ImgLib := g_WMonImagesArr[24];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end
            else if  magnumb = MAGIC_KINGTURTLE_ATT2_2 then begin
               meff := TThuderEffectEx.Create (3030, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 12;
               meff.ImgLib := g_WMonImagesArr[24];
               meff.NextFrameTime := 100;
               meff.Light := 1;
            end

            else if  magnumb = MAGIC_SPIDER_ATT1 then begin
               meff := TThuderEffectEx.Create (2970, sctx, scty, nil, magnumb);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMonImagesArr[25];
               meff.NextFrameTime := 100;
               meff.Light := 4;
            end

            else if  magnumb = 4 then begin   //혼령 독
               meff := TThuderEffect.Create (760, sctx, scty, nil);
               meff.ExplosionFrame := 10;
               meff.ImgLib := g_WMagicImages;
               meff.Light := 2;
            end
        else begin
        meff := TThuderEffect.Create (10, sctx, scty, nil); //target);
        meff.ExplosionFrame := 6;
        meff.ImgLib := g_WMagic2Images;
        end;
      end;
      mtGumizul2: begin
        meff := TGumizul2Effect.Create (2980, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
       // meff.ImgLib := g_WDragonImg;
      end;
      mtRedThunder: begin
        meff := TRedThunderEffect.Create (230, sctx, scty, nil); //target);
        meff.ExplosionFrame := 6;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtHellThunder: begin
        meff := THellThunderEffect.Create (2690, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtHell2Thunder: begin
        meff := THell2ThunderEffect.Create (3160, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtRedThunder2: begin
        meff := TRedThunder2Effect.Create (230, sctx, scty, nil); //target);
        meff.ExplosionFrame := 6;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtIceShower: begin
        meff := TIceShowerEffect.Create (1550, sctx, scty- (g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), nil); //target);
        meff.ExplosionFrame := 30;
      end;
      mtFireShower: begin
        meff := TFireShowerEffect.Create (1610, sctx, scty-(g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), nil); //target);
        meff.ExplosionFrame := 30;
      end;

      mtUpIceShower: begin
        meff := TIceShowerUpEffect.Create (690, sctx, scty-(g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), nil); //target);
        meff.ExplosionFrame := 30;
      end;
      mtUpFireShower: begin
        meff := TFireShowerUpEffect.Create (750, sctx, scty{-(g_FScreenHeight - 600) div 2}, nil); //target);
        meff.ExplosionFrame := 30;
      end;
      mtUpFirerave: begin         //천상폭염
        meff := TFireShowerUpRaveEffect.Create (220, sctx, scty-(g_FScreenHeight - ((g_FScreenHeight - 600) div 3) * 2), nil); //target);
        meff.ExplosionFrame := 30;
      end;
      mtGumizul: begin
        meff := TGumizulEffect.Create (2970, sctx, scty, nil); //target);
        meff.ExplosionFrame := 9;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtFireBoom: begin
        meff := TFireBoomEffect.Create (3770, sctx, scty, nil); //target);
        meff.ExplosionFrame := 15;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mtFoxAnnoy: begin
      case magnumb of
               MAGIC_SOULBALL_ATT1: begin
                      meff.ImgLib := g_WMonImagesArr[23];
                      meff.MagExplosionBase := 2140;
                      meff.TargetActor := target;
                      meff.Light := 5;
                      meff.ExplosionFrame := 20;
                   end;
      end;
      end;
      mtFoxThunder: begin
        meff := TFoxThunderEffect.Create (2120, sctx, scty, nil); //target);
        meff.ExplosionFrame := 20;
      end;

      mtLava: begin
        meff := TLavaEffect.Create (440, sctx, scty, nil); //target);
//        meff.ExplosionFrame := 6;
        //meff.ImgLib := g_WMagic2Images;
      end;
      mt17: begin
        meff := TsuduguiThunderEffect.Create (2690, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
      end;
      mt18: begin
        meff := TsuduguiredEffect.Create (2700, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
      end;
      mtRedFoxThunder: begin
        meff := TRedFoxThunderEffect.Create (780, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
      end;
      mtRedFoxFire: begin
        meff := TRedFoxFireEffect.Create (790, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
      end;

      mtLightingThunder: begin
           meff := TLightingThunder.Create (970, scx, scy, sctx, scty, target);
      end;
      mtExploBujauk: begin
        case magnumb of
          10: begin  //폭살계
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 1360;
          end;
          17: begin  //대은신술
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 1540;
          end;
          54: begin  //소생술
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.ImgLib := g_WMagic2Images;
            meff.MagExplosionBase := 1220;
            PlaySound (10544);
          end;
          49: begin    //미혼술
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.ImgLib := g_WMagic2Images;
            meff.MagExplosionBase := 1110;
            meff.ExplosionFrame := 10;
            PlaySound (10492);
          end;
          71{75}: begin  //번뇌의
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 110;
            meff.ImgLib := g_WMagic3Images;
            PlaySound (10753);
          end;
          100{105}: begin //백호강타
              meff := TExploHuXiaoJueZhouEffect.Create(3030, scx, scy, sctx, scty, target);
              meff.MagExplosionBase := 3191;
              meff.ExplosionFrame := 5;
              meff.ImgLib := g_WMagicNewImages;
              PlaySound2(s_cboDs1_target);
          end;
          MAGIC_FOX_FIRE2: begin //도사비월여우 폭살계
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 1320;
            meff.ImgLib := g_WMonImagesArr[23];
            meff.ExplosionFrame := 10;
          end;
          MAGIC_FOX_CURSE: begin //도사비월여우 저주술
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 1330;
            meff.ImgLib := g_WMonImagesArr[23];
            meff.ExplosionFrame := 20;
          end;
          MAGIC_FOX_CURSE2: begin  //현월단도사:저주술
            meff := TExploBujaukEffect.Create (1160, scx, scy, sctx, scty, target);
            meff.MagExplosionBase := 950;
            meff.ImgLib := g_WMagic2Images;
            meff.ExplosionFrame := 24;
          end;
        end;
        bofly := TRUE;
      end;
      mtBujaukGroundEffect: begin
        meff := TBujaukGroundEffect.Create (1160, magnumb, scx, scy, sctx, scty);
        case magnumb of
          11: meff.ExplosionFrame := 16; //항마진법
          12: meff.ExplosionFrame := 16; //대지원호
          46: meff.ExplosionFrame := 24; //저주술
          55: begin
              meff.ExplosionFrame := 20; //독무
              meff.TargetActor := nil;
              PlaySound(10553);
              end;
          71{75}: meff.ExplosionFrame := 10;
          90: begin
            meff.ExplosionFrame := 20; //흡성대법
            PlaySound(10142);
          end;
          91: begin
            meff.ExplosionFrame := 20; //강마진법
            PlaySound(10142);
          end;
          132{138}: begin  //천공
            meff.ExplosionFrame := 9;
            meff.TargetActor := nil;
            PlaySound2 (as_138_3);
            PlaySound2 (as_138_4);
          end;
        end;
        bofly := TRUE;
      end;
      mtKyulKai: begin
        meff := nil; //TKyulKai.Create (1380, scx, scy, sctx, scty);
      end;
      mt12: begin

      end;
      mt20: begin

      end;
      mt13: begin
        meff := TMagicEff.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
        if meff <> nil then begin
          case magnumb of
            32: begin
              meff.ImgLib := g_WMonImagesArr[20];
              meff.MagExplosionBase:=3580;
              meff.TargetActor := target;
              meff.Light := 5;
              meff.NextFrameTime := 20;
            end;
              MAGIC_KINGTURTLE_ATT1: begin
                      meff.ImgLib := g_WMonImagesArr[24];
                      meff.MagExplosionBase := 2990;
                      meff.TargetActor := target;
                      meff.Light := 5;
                      meff.ExplosionFrame := 10;
                   end;
               MAGIC_KINGTURTLE_ATT3: begin
                      meff.ImgLib := g_WMonImagesArr[24];
                      meff.MagExplosionBase := 3060;
                      meff.TargetActor := target;
                      meff.Light := 5;
                      meff.ExplosionFrame := 10;
                   end;
             92: begin //환사귀장 독무
                 meff.MagExplosionBase := 1650;
                 meff.ImgLib := g_WMagic2Images;
                 meff.ExplosionFrame := 20;
                 meff.Light := 5;
                 meff.TargetActor := nil;
             end;
          end;
        end;
      end;
      mt14: begin
        meff := TThuderEffect.Create (140, sctx, scty, nil); //target);
        meff.ExplosionFrame := 10;
        meff.ImgLib := g_WMagic2Images;
      end;
      mt15: begin
        meff := TFlyingBug.Create (magid, effnum, scx, scy, sctx, scty, mtype, Recusion, anitime);
        meff.TargetActor := target;
        bofly:=True;
      end;
      mt16: begin

      end;
   end;
   
   if (meff = nil) then exit;
   meff.TargetRx := tx;
   meff.TargetRy := ty;
   if meff.TargetActor <> nil then begin
      meff.TargetRx := TActor(meff.TargetActor).m_nCurrX;
      meff.TargetRy := TActor(meff.TargetActor).m_nCurrY;
   end;
   meff.MagOwner := aowner;
   m_EffectList.Add (meff);

   if (meff2 = nil) then exit;
   meff2.TargetRx := tx;
   meff2.TargetRy := ty;
   if meff2.TargetActor <> nil then begin
      meff2.TargetRx := TActor(meff2.TargetActor).m_nCurrX;
      meff2.TargetRy := TActor(meff2.TargetActor).m_nCurrY;
   end;
   meff2.MagOwner := aowner;
   m_EffectList.Add (meff2);

   if (meff3 = nil) then exit;
   meff3.TargetRx := tx;
   meff3.TargetRy := ty;
   if meff3.TargetActor <> nil then begin
      meff3.TargetRx := TActor(meff3.TargetActor).m_nCurrX;
      meff3.TargetRy := TActor(meff3.TargetActor).m_nCurrY;
   end;
   meff3.MagOwner := aowner;
   m_EffectList.Add (meff3);

   if (meff4 = nil) then exit;
   meff4.TargetRx := tx;
   meff4.TargetRy := ty;
   if meff4.TargetActor <> nil then begin
      meff4.TargetRx := TActor(meff4.TargetActor).m_nCurrX;
      meff4.TargetRy := TActor(meff4.TargetActor).m_nCurrY;
   end;
   meff4.MagOwner := aowner;
   m_EffectList.Add (meff4);

end;

procedure TPlayScene.DelMagic (magid: integer);
var
   i: integer;
begin
   for i:=0 to m_EffectList.Count-1 do begin
      if TMagicEff(m_EffectList[i]).ServerMagicId = magid then begin
         TMagicEff(m_EffectList[i]).Free;
         m_EffectList.Delete (i);
         break;
      end;
   end;
end;

function  TPlayScene.NewFlyObject (aowner: TActor; cx, cy, tx, ty, targetcode: integer;  mtype: TMagicType): TMagicEff;
var
   i, scx, scy, sctx, scty: integer;
   meff: TMagicEff;
begin
   ScreenXYfromMCXY (cx, cy, scx, scy);
   ScreenXYfromMCXY (tx, ty, sctx, scty);
   case mtype of
      mtFlyArrow: meff := TFlyingArrow.Create (1, 1, scx, scy, sctx, scty, mtype, TRUE, 0);
      mt12: meff := TFlyingFireBall.Create (1, 1, scx, scy, sctx, scty, mtype, TRUE, 0);
      mt15: meff := TFlyingBug.Create (1, 1, scx, scy, sctx, scty, mtype, TRUE, 0);
      mtFlyStone: meff := TFlyingStone.Create (1, 1, scx, scy, sctx, scty, mtype, FALSE, 0);   //폭마야차 석마야차
      else meff := TFlyingAxe.Create (1, 1, scx, scy, sctx, scty, mtype, TRUE, 0);
   end;
   meff.TargetRx := tx;
   meff.TargetRy := ty;
   meff.TargetActor := FindActor (targetcode);
   meff.MagOwner := aowner;
   m_FlyList.Add (meff);
   Result := meff;
end;

{function  NewStaticMagic (aowner: TActor; tx, ty, targetcode, effnum: integer);
var
   i, scx, scy, sctx, scty, effbase: integer;
   meff: TMagicEff;
begin
   ScreenXYfromMCXY (cx, cy, scx, scy);
   ScreenXYfromMCXY (tx, ty, sctx, scty);
   case effnum of
      1: effbase := 340;
      else exit;
   end;

   meff := TLightingEffect.Create (effbase, 1, 1, scx, scy, sctx, scty, mtype, TRUE, 0);
   meff.TargetRx := tx;
   meff.TargetRy := ty;
   meff.TargetActor := FindActor (targetcode);
   meff.MagOwner := aowner;
   FlyList.Add (meff);
   Result := meff;
end;  }

{-------------------------------------------------------}

{procedure TPlayScene.ScreenXYfromMCXY (cx, cy: integer; var sx, sy: integer);
begin
   if Myself = nil then exit;
   sx := -UNITX*2 - Myself.ShiftX + AAX + 14 + (cx - Map.ClientRect.Left) * UNITX + UNITX div 2;
   sy := -UNITY*3 - Myself.ShiftY + (cy - Map.ClientRect.Top) * UNITY + UNITY div 2;
end; }

//스크린의 mx, my로 맵의 ccx, ccy좌표를 얻어냄

procedure TPlayScene.ScreenXYfromMCXY (cx, cy: integer; var sx, sy: integer);
begin
   if g_MySelf = nil then exit;
  if g_FScreenWidth = 800 then begin
    sx := (cx-g_MySelf.m_nRx)*UNITX + 364 + UNITX div 2 - g_MySelf.m_nShiftX;
    sy := (cy-g_MySelf.m_nRy)*UNITY + 254 + UNITY div 2 - g_MySelf.m_nShiftY; //하단부
    exit;
  end else begin
    sx := (cx-g_MySelf.m_nRx)*UNITX + 473 + UNITX div 2 - g_MySelf.m_nShiftX;
    sy := (cy-g_MySelf.m_nRy)*UNITY + 350{344} + UNITY div 2 - g_MySelf.m_nShiftY;
    exit;
  end;
end;

//스크린의 mx, my로 맵의 ccx, ccy좌표를 얻어냄
procedure TPlayScene.CXYfromMouseXY (mx, my: integer; var ccx, ccy: integer);
begin
   if g_MySelf = nil then exit;
  if g_FScreenWidth = 800 then begin
    ccx := UpInt((mx - 364 + g_MySelf.m_nShiftX - UNITX) / UNITX) + g_MySelf.m_nRx;
    ccy := UpInt((my - 254 + g_MySelf.m_nShiftY - UNITY) / UNITY) + g_MySelf.m_nRy ;  //하단부
    exit;
  end else begin
    ccx := UpInt((mx - 473 + g_MySelf.m_nShiftX - UNITX) / UNITX) + g_MySelf.m_nRx;
    ccy := UpInt((my - 350{344} + g_MySelf.m_nShiftY - UNITY) / UNITY) + g_MySelf.m_nRy;
    exit;
  end;
end;

procedure TPlayScene.CXYfromMouseXYMid (mx, my: integer; var ccx, ccy: integer); // 마법을 좀더 정확한 위치에 뿌리기 위해..
begin
   if g_MySelf = nil then exit;
  if g_FScreenWidth = 800 then begin
    ccx := UpInt((mx - 364 + g_MySelf.m_nShiftX - UNITX) / UNITX) + g_MySelf.m_nRx;
    ccy := UpInt((my - (254 - 40)+ g_MySelf.m_nShiftY - UNITY) / UNITY) + g_MySelf.m_nRy-1;        //하단부
    exit;
  end else begin
    ccx := UpInt((mx - 476 + g_MySelf.m_nShiftX - UNITX) / UNITX) + g_MySelf.m_nRx;
    ccy := UpInt((my - (344 - 20)+ g_MySelf.m_nShiftY - UNITY) / UNITY) + g_MySelf.m_nRy-1;
    exit;
  end;
end;



function  TPlayScene.GetCharacter (x, y, wantsel: integer; var nowsel: integer; liveonly: Boolean): TActor;
var
   k, i, ccx, ccy, dx, dy: integer;
   a: TActor;
begin
   Result := nil;
   nowsel := -1;
   CXYfromMouseXY (x, y, ccx, ccy);
   for k:=ccy+8 downto ccy-1 do begin
      for i:=m_ActorList.Count-1 downto 0 do
         if TActor(m_ActorList[i]) <> g_MySelf then begin
            a := TActor(m_ActorList[i]);
            if (not liveonly or not a.m_boDeath) and (a.m_boHoldPlace) and (a.m_boVisible) then begin
               if a.m_btRace in [240..251] then continue;
               if a.m_nCurrY = k then begin
                  dx := (a.m_nRx-Map.m_ClientRect.Left)*UNITX + m_nDefXX + a.m_nPx + a.m_nShiftX;
                  dy := (a.m_nRy-Map.m_ClientRect.Top-1)*UNITY + m_nDefYY + a.m_nPy + a.m_nShiftY;
                  if a.CheckSelect (x-dx, y-dy) then begin
                     Result := a;
                     Inc (nowsel);
                     if nowsel >= wantsel then
                        exit;
                  end;
               end;
            end;
         end;
   end;
end;

//마우스가 캐릭터의 근처에만 있어도 선택되도록....
function  TPlayScene.GetAttackFocusCharacter (x, y, wantsel: integer; var nowsel: integer; liveonly: Boolean): TActor;
var
   k, i, ccx, ccy, dx, dy, centx, centy: integer;
   a: TActor;
begin
   Result := GetCharacter (x, y, wantsel, nowsel, liveonly);
   if Result = nil then begin
      nowsel := -1;
      CXYfromMouseXY (x, y, ccx, ccy);
      for k:=ccy+8 downto ccy-1 do begin
         for i:=m_ActorList.Count-1 downto 0 do

            if TActor(m_ActorList[i]) <> g_MySelf then begin
               a := TActor(m_ActorList[i]);
               if (not liveonly or not a.m_boDeath) and (a.m_boHoldPlace) and (a.m_boVisible) then begin
                  if a.m_btRace in [240..251] then continue;
                  if a.m_nCurrY = k then begin
                     dx := (a.m_nRx-Map.m_ClientRect.Left)*UNITX + m_nDefXX + a.m_nPx + a.m_nShiftX;
                     dy := (a.m_nRy-Map.m_ClientRect.Top-1)*UNITY+ m_nDefYY + a.m_nPy + a.m_nShiftY;
                     if a.CharWidth > 40 then centx := (a.CharWidth - 40) div 2
                     else centx := 0;
                     if a.CharHeight > 70 then centy := (a.CharHeight - 70) div 2
                     else centy := 0;
                     if (x-dx >= centx) and (x-dx <= a.CharWidth-centx) and (y-dy >= centy) and (y-dy <= a.CharHeight-centy) then begin
                        Result := a;
                        Inc (nowsel);
                        if nowsel >= wantsel then
                           exit;
                     end;
                  end;
               end;
           end;
      end;
   end;
end;

function  TPlayScene.IsSelectMyself (x, y: integer): Boolean;
var
  k, i, ccx, ccy, dx, dy: integer;
begin
  Result := FALSE;
  CXYfromMouseXY (x, y, ccx, ccy);
  for k:=ccy+2 downto ccy-1 do begin
    if g_MySelf.m_nCurrY = k then begin
      dx:=(g_MySelf.m_nRx - Map.m_ClientRect.Left) * UNITX + m_nDefXX + g_MySelf.m_nPx + g_MySelf.m_nShiftX;
      dy:=(g_MySelf.m_nRy - Map.m_ClientRect.Top - 1) * UNITY + m_nDefYY + g_MySelf.m_nPy + g_MySelf.m_nShiftY;
      if g_MySelf.CheckSelect (x-dx, y-dy) then begin
        Result := TRUE;
        exit;
      end;
    end;
  end;
end;

function  TPlayScene.GetDropItems (x, y: integer; var inames: string): PTDropItem;
var
  k, i, ccx, ccy, ssx, ssy, dx, dy: integer;
  DropItem:PTDropItem;
  s: TDirectDrawSurface;
  c: byte;
begin
  Result := nil;
  CXYfromMouseXY (x, y, ccx, ccy);
  ScreenXYfromMCXY (ccx, ccy, ssx, ssy);
  dx := x - ssx;
  dy := y - ssy;
  inames := '';
  for i:=0 to g_DropedItemList.Count-1 do begin
    DropItem := PTDropItem(g_DropedItemList[i]);
    if (DropItem.X = ccx) and (DropItem.Y = ccy) then begin
      if DropItem.BoDeco then s := g_WDecoImages.Images[DropItem.Looks - 10000]
      else s := g_WDnItemImages.Images[DropItem.Looks];
      if s = nil then continue;
      dx := (x - ssx) + (s.Width div 2) - 3;
      dy := (y - ssy) + (s.Height div 2);
      c := s.Pixels[dx, dy];
      if (c <> 0) or DropItem.BoDeco  then begin
        //장원꾸미기 Deco아이템인 경우 이름 뜨는 범위 확장
        if Result = nil then Result := DropItem;
        inames := inames + DropItem.Name + '\';
        //break;
      end;
    end;
  end;
end;

function  TPlayScene.GetPetDropItems (x, y: integer; var inames: string): PTDropItem;
var
  k, i, ccx, ccy, ssx, ssy, dx, dy: integer;
  DropItem:PTDropItem;
  s: TDirectDrawSurface;
  c: byte;
begin
  Result := nil;
  CXYfromMouseXY (x, y, ccx, ccy);
  ScreenXYfromMCXY (ccx, ccy, ssx, ssy);
  dx := x - ssx;
  dy := y - ssy;
  inames := '';
  for i:=0 to g_DropedItemList.Count-1 do begin
    DropItem := PTDropItem(g_DropedItemList[i]);
    if (DropItem.X = ccx) and (DropItem.Y = ccy) then begin
      if DropItem.BoDeco then g_WDecoImages.Images[DropItem.Looks - 10000]
      else s := g_WBagItemImages.Images[DropItem.Looks];
      if s = nil then continue;
      dx := (x - ssx) + (s.Width div 2) - 3;
      dy := (y - ssy) + (s.Height div 2);
      c := s.Pixels[dx, dy];
      if (c <> 0) or (DropItem.BoDeco) then begin
        //장원꾸미기 Deco아이템인 경우 이름 뜨는 범위 확장
        if Result = nil then Result := DropItem;
        inames := inames + DropItem.Name + '\';
        //break;
      end;
    end;
  end;
end;

procedure TPlayScene.GetXYDropItemsList(nX,nY:Integer;var ItemList:TList);
var
  I:Integer;
  DropItem:pTDropItem;
begin
  for I:= 0 to g_DropedItemList.Count - 1 do begin
    DropItem:=g_DropedItemList[i];
    if (DropItem.X = nX) and (DropItem.Y = nY) then begin
      ItemList.Add(DropItem);
    end;
  end;
end;

function TPlayScene.GetXYDropItems(nX, nY: Integer): pTDropItem;
var
  I:Integer;
  DropItem:pTDropItem;
begin
  Result:=nil;
  for I:= 0 to g_DropedItemList.Count - 1 do begin
    DropItem:=g_DropedItemList[i];
    if (DropItem.X = nX) and (DropItem.Y = nY) then begin
      Result:=DropItem;
      break;
    end;
  end;
end;


procedure  TPlayScene.DropItemsShow; //떨어진 아이템 보기.
var
   i, k, mx, my, HintX, HintY, HintWidth, HintHeight: integer;
   d: PTDropItem;
   dds: TDirectDrawSurface;
   FColor: TColor;
begin
   dds := g_WMainImages.Images[394];
   for i:=0 to g_DropedItemList.Count-1 do begin
      d := PTDropItem(g_DropedItemList[i]);
      if d <> nil then begin
         ScreenXYfromMCXY (d.X, d.Y, mx, my);
         if my > (g_FScreenHeight - 50) then Continue;  //Y좌표
         if dds <> nil then begin
            HintWidth :=  FrmMain.Canvas.TextWidth (d.Name) + 4 * 2;
            if HintWidth > dds.Width then
            HintWidth := dds.Width;
            HintHeight := (FrmMain.Canvas.TextHeight('A') + 1) + 3 * 2 - 1;
            DrawBlendEx (FrmMain.DxDraw.Surface , mx-(FrmMain.Canvas.TextWidth(d.Name) div 2) - 2 , my- 27, dds, 0, 0, HintWidth , HintHeight, 0);
         end;
      end;
   end;



   for k:=0 to g_DropedItemList.Count-1 do begin
      d := PTDropItem(g_DropedItemList[k]);
      if d <> nil then begin
         ScreenXYfromMCXY (d.X, d.Y, mx, my);
         if my > (g_FScreenHeight - 50) then Continue;       //Y좌표
         FColor := clWhite;
         case d.Grade of
            0,1: FColor := clWhite;
            2: FColor := $00FFDF42;    //보물
            3: FColor := $000075FF;    //성물
            4: FColor := $00FFAADE;    //신물
         end;
         SetBkMode (FrmMain.DxDraw.Surface.Canvas.Handle , TRANSPARENT);
         TextOutA (FrmMain.DXDraw.Surface, mx - (FrmMain.Canvas.TextWidth(d.Name) div 2) + 2, my - 24, FColor, d.Name);
         FrmMain.DxDraw.Surface.Canvas.Release;
      end;
   end;
end;

function  TPlayScene.CanRun (sx, sy, ex, ey: integer): Boolean;
var
   ndir, rx, ry: integer;
begin
   ndir := GetNextDirection (sx, sy, ex, ey);
   rx := sx;
   ry := sy;
   GetNextPosXY (ndir, rx, ry);

   if Map.CanMove (rx, ry) and Map.CanMove (ex, ey) then
     Result:=True
   else Result:=False;

   if CanWalkEx (rx, ry) and CanWalkEx (ex, ey) then
      Result := TRUE
   else Result := FALSE;
end;

function  TPlayScene.CanRunEX (sx, sy, ex, ey: integer): Boolean;
var
   ndir, rx, ry: integer;
begin
   ndir := GetNextDirection (sx, sy, ex, ey);
   rx := sx;
   ry := sy;
   GetNextRunXY (ndir, rx, ry);

   if Map.CanMove (rx, ry) and Map.CanMove (ex, ey) then
     Result:=True
   else Result:=False;

   if CanWalkEx (rx, ry) and CanWalkEx (ex, ey) then
      Result := TRUE
   else Result := FALSE;
end;

function  TPlayScene.CanRunEX2 (sx, sy, ex, ey: integer): Boolean;
var
   ndir, rx, ry: integer;
begin
   ndir := GetNextDirection (sx, sy, ex, ey);
   rx := sx;
   ry := sy;

   GetNextPosXY(ndir, rx, ry);
   
   if CanWalkEx2 (rx, ry) and CanWalkEx2 (ex, ey) then
      Result := TRUE
   else Result := FALSE;
end;



function TPlayScene.CanHorseRunEx(sx, sy, ex, ey: Integer): Boolean;
var
  ndir, rx, ry: Integer;
begin
  Result := False;

  ndir := GetNextDirection(sx, sy, ex, ey);
  rx := sx;
  ry := sy;
  GetNextPosXY(ndir, rx, ry);
  if not CanWalkEx2(rx, ry) then
    exit;
  GetNextPosXY(ndir, rx, ry);
  if CanWalkEx2(rx, ry) and CanWalkEx2(ex, ey) then
    Result := True
  else
    Result := FALSE;
end;

function  TPlayScene.CanWalkEx (mx, my: integer): Boolean;
begin
   Result := FALSE;
   if Map.CanMove(mx,my) then
      Result := not CrashManEx (mx, my);
end;

function  TPlayScene.CrashManEx (mx, my: integer): Boolean;
var
  I:Integer;
  Actor:TActor;
begin    
  Result := False;
  for i:=0 to m_ActorList.Count-1 do begin
    Actor:= TActor(m_ActorList[i]);
    if (Actor.m_boVisible) and (Actor.m_boHoldPlace) and (not Actor.m_boDeath) and (Actor.m_nCurrX = mx) and (Actor.m_nCurrY = my) then begin
      if (Actor.m_nState and $00000200 <> 0) then Continue; //망자의옷
      if (Actor.m_btRace in [240..251]) then Continue;
      if (Actor.m_btRace = RCC_USERHUMAN) and g_boCanRunHuman then Continue;
      if (Actor.m_btRace = RCC_MERCHANT) and g_boCanRunNpc then Continue;
      if ((Actor.m_btRace > RCC_USERHUMAN) and (Actor.m_btRace <> RCC_MERCHANT)) and g_boCanRunMon then Continue;
      Result:=True;
      break;
    end;
  end;
end;

function  TPlayScene.CanWalk (mx, my: integer): Boolean;
begin
   Result := FALSE;
   if Map.CanMove(mx,my) then
      Result := not CrashMan (mx, my);
end;

function  TPlayScene.CrashMan (mx, my: integer): Boolean;
var
   i: integer;
   a: TActor;
begin
   Result := FALSE;
   for i:=0 to m_ActorList.Count-1 do begin
      a := TActor(m_ActorList[i]);
      if (a.m_boVisible) and (a.m_boHoldPlace) and (not a.m_boDeath) and (a.m_nCurrX = mx) and (a.m_nCurrY = my) then begin
         if (a.m_btRace in [240..251]) then  Continue;
         if (a.m_nState and $00000200 <> 0) then Continue; //망자의옷
         Result := TRUE;
         break;
      end;
   end;
end;

function TPlayScene.CanWalkEx2(mx, my: Integer): Boolean;
begin
  Result := FALSE;
  if Map.CanMove(mx, my) then
    Result := not CrashManEx2(mx, my);
end;

function TPlayScene.CrashManEx2(mx, my: Integer): Boolean;
var
  i: Integer;
  Actor: TActor;
begin
  Result := FALSE;
  for i := 0 to m_ActorList.count - 1 do begin
    Actor := TActor(m_ActorList[i]);
    if (Actor.m_boVisible) and (Actor.m_boHoldPlace) and (not Actor.m_boDeath)
      and (Actor.m_nCurrX = mx) and (Actor.m_nCurrY = my) then begin
      Result := True;
      break;
    end;
  end;
end;

function  TPlayScene.CanFly (mx, my: integer): Boolean;
begin
   Result := Map.CanFly (mx, my);
end;


{------------------------ Actor ------------------------}

function  TPlayScene.FindActor (id: integer): TActor;
var
   i: integer;
begin
   Result := nil;
   for i:=0 to m_ActorList.Count-1 do begin
      if TActor(m_ActorList[i]).m_nRecogId = id then begin
         Result := TActor(m_ActorList[i]);
         break;
      end;
   end;
end;

function TPlayScene.FindActor(sName: String): TActor;
var
  I:Integer;
  Actor:TActor;
begin
  Result := nil;
  for I:=0 to m_ActorList.Count-1 do begin
    Actor:=TActor(m_ActorList[i]);
    if CompareText(Actor.m_sUserName,sName) = 0 then begin
      Result:=Actor;
      break;
    end;
  end;
end;

function  TPlayScene.FindActorXY (x, y: integer): TActor;
var
   i: integer;
begin
   Result := nil;
   for i:=0 to m_ActorList.Count-1 do begin
      if (TActor(m_ActorList[i]).m_nCurrX = x) and (TActor(m_ActorList[i]).m_nCurrY = y) then begin
         Result := TActor(m_ActorList[i]);
         if not Result.m_boDeath and Result.m_boVisible and Result.m_boHoldPlace then
            break;
      end;
   end;
end;

function  TPlayScene.IsValidActor (actor: TActor): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to m_ActorList.Count - 1 do begin
      if TActor(m_ActorList[i]) = actor then begin
         Result := TRUE;
         break;
      end;
   end;
end;

function  TPlayScene.NewActor (chrid:     integer;
                               cx:        word; //x
                               cy:        word; //y
                               cdir:      word;
                               cfeature:  integer; //race, hair, dress, weapon
                               cstate:    integer): TActor;
var
   i: integer;
   actor: TActor;
begin
   Result:=nil;
   for i:=0 to m_ActorList.Count-1 do
      if TActor(m_ActorList[i]).m_nRecogId = chrid then begin
         Result := TActor(m_ActorList[i]);
         exit;
      end;

   if (g_MyHero <> nil) and (g_MyHero.m_nRecogId = chrid) then begin //Mars
     ClearActorMsg(g_MyHero);
     with g_MyHero do begin
       m_nRecogId     := chrid;
       m_nCurrX       := cx;
       m_nCurrY       := cy;
       m_nRx          := m_nCurrX;
       m_nRy          := m_nCurrY;
       m_btDir        := cdir;
       m_nFeature     := cfeature;
       m_btRace       := RACEfeature(cfeature);
       m_btHair       := HAIRfeature(cfeature);
       m_btDress      := DRESSfeature(cfeature);
       m_btWeapon     := WEAPONfeature(cfeature);
       m_wAppearance  := APPRfeature(cfeature);
       m_Action := nil;
       if m_btRace = 0 then begin
         m_btSex := m_btDress mod 2;
       end else begin
         m_btSex := 0;
       end;
       m_nState := cstate;
     end;
     m_ActorList.Add(g_MyHero);
     Result := g_MyHero;
     Exit;
   end;

   if IsChangingFace (chrid) then exit;

   case RACEfeature(cfeature) of //m_btRaceImg
      0:  actor := THumActor.Create;              //사람

      1:  actor := TBanyaGuardMon.create;         //검은흑성성
      2:  actor := TBanyaGuardMon.create;         //이두흑호
      3:  actor := TShineCaveMon.Create;          //여귀
      4:  actor := TShineCaveMon.Create;          //태골서
      5:  actor := TShineCaveMon.Create;          //작은대망
      6:  actor := TShineCaveMon.Create;          //대망
      7:  actor := TShineCaveMon.Create;          //주마술사
      8:  actor := TShineCaveMon.Create;          //주마화궁사
      9:  actor := TSoccerBall.Create;            //축구공
      13: actor := TKillingHerb.Create;           //식인초
      14: actor := TSkeletonOma.Create;           //太胎
      15: actor := TDualAxeOma.Create;            //聆릊太胎
      16: actor := TGasKuDeGi.Create;             //떪협
      17: actor := TCatMon.Create;                //갈고리괭이
      18: actor := THuSuABi.Create;               //돗꿇훙
      19: actor := TCatMon.Create;                //怪쯔濫却
      20: actor := TFireCowFaceMon.Create;        //삽落怪쯔
      21: actor := TCowFaceKing.Create;           //怪쯔싱寮
      22: actor := TDualAxeOma.Create;            //붚갠濫却
      23: actor := TWhiteSkeleton.Create;         //백골
      24: actor := TSuperiorGuard.Create;         //던독括却
      25: actor := TDualAxeOma.Create;            //서성이는궁병
      26: actor := TShineCaveMon.Create;          //주마풍궁사
      27: actor := TShineCaveMon.Create;          //주마검사
      28: actor := TShineCaveMon.Create;          //여귀석
      29: actor := TShineCaveMon.Create;          //마석거인
      30: actor := TCatMon.Create;
      31: actor := TCatMon.Create;                //비막충
      32: actor := TScorpionMon.Create;           //전갈
      33: actor := TCentipedeKingMon.Create;      //촉룡신
      34: actor := TBigHeartMon.Create;           //나무류
      35: actor := TSpiderHouseMon.Create;        //폭안거미
      36: actor := TExplosionSpider.Create;       //폭주
      37: actor := TFlyingSpider.Create;          //비독주
      38: actor := TExplosionDark.Create;         //칠흑수
      39: actor := TCatMon.Create;                //토끼 타락토끼
      40: actor := TZombiLighting.Create;         //좀비
      41: actor := TZombiDigOut.Create;           //좀비
      42: actor := TZombiZilkin.Create;           //좀비
      43: actor := TBeeQueen.Create;              //비막원충
      44: actor := TIceMan.Create;                //눈사람
      45: actor := TArcherMon.Create;             //궁수
      46: actor := TBanyaGuardMon.create;         //고대비월적호
      47: actor := TSculptureMon.Create;          //주마신장 호법
      48: actor := TSculptureMon.Create;
      49: actor := TSculptureKingMon.Create;      //주마왕
      50: actor := TNpcActor.Create;              //엔피씨
      51: actor := TShineCaveMon.Create;           //격괴장
      52: actor := TGasKuDeGi.Create;             //쐐기나방
      53: actor := TGasKuDeGi.Create;             //둥
      54: actor := TSmallElfMonster.Create;       //신수
      55: actor := TWarriorElfMonster.Create;     //신수1
      56: actor := TBanyaGuardMon.Create;  //수호귀사
      57: actor := TBanyaGuardMon.create;  //빙염귀장
      58: actor := TBanyaGuardMon.create;  //환사귀장
      59: actor := TBanyaGuardMon.create;  //비호귀마
      60: actor := TElectronicScolpionMon.Create;  //흑사왕
      61: actor := TBossPigMon.Create;             //귀돈왕
      62: actor := TKingOfSculpureKingMon.Create; //흑천마왕
      63: actor := TSkeletonKingMon.Create;       //해골반왕
      64: actor := TGasKuDeGi.Create;             //부식귀
      65: actor := TSamuraiMon.Create;            //낭인귀
      66: actor := TSkeletonSoldierMon.Create;    //해골병졸
      67: actor := TSkeletonSoldierMon.Create;    //해골무장
      68: actor := TSkeletonSoldierMon.Create;
      69: actor := TSkeletonArcherMon.Create;     //해골궁수
      70: actor := TBanyaGuardMon.Create;         //반야우사
      71: actor := TBanyaGuardMon.Create;         //반야좌사
      72: actor := TBanyaGuardMon.Create;    //사우천왕
      73: actor := TPBOMA1Mon.Create;        //비익오마
      74: actor := TCatMon.Create;           //초코과자
      75: actor := TStoneMonster.Create;     //양마지석
      76: actor := TSuperiorGuard.Create;
      77: actor := TStoneMonster.Create;     //음마지석
      78: actor := TBanyaGuardMon.Create;    //파황마신
      79: actor := TPBOMA6Mon.Create;        //오마석궁병

      81: actor := TAngel.Create;            //월령
      82: actor := TDarkAngel.Create;        //혼령
      83: actor := TFireDragon.Create;       //파천마룡
      84..89: actor := TDragonStatue.Create;   //용석상
      90: actor := TDragonBody.Create;            //파천마룡 몸
      91: actor:= TShineCaveMon.Create;          //칼날바람
      92: actor:= TShineCaveMon.Create;          //바위폭탄
      93: actor := TNammanStructure.Create;        //남만성벽
      94: actor := TSabukStructure.Create;        //사북성벽
      95: actor := TNammanCastleDoor2.Create;      //남만내성문
      96: actor := TNammanCastleDoor.Create;      //남만외성문
      97: actor := TWallFlag.Create;              //점령깃발
      98: actor := TWallStructure.Create;         //성벽
      99: actor := TCastleDoor.Create;            //성문
      100: actor:= TBanyaGuardMon.Create;         //야수왕
      101: actor:= TFireLead.Create;            //염화적귀
      102: actor:= TKhazardMon.create;          //설인대충
      103: actor:= TFrostTiger.create;          //환영한호
      104: actor:= TJumaThunderMon.create;      //주마격뢰장
      105: actor:= TBanyaGuardMon.create;        //혈독마주  //거미(신석독마주)
      106: actor:= TBanyaGuardMon.create;       //부룡금사   황금이무기
      107: actor:= TBanyaGuardMon.Create;       //호기연
      108: actor:= TBanyaGuardMon.Create;        //호기옥
      109: actor:= TBlackFox.create;            //비월흑호
      110: actor:= TElement.create;
      111: actor:= TBanyaGuardMon.create;       //비월적호
      112: actor:= TBanyaGuardMon.create;       //비월소호
      113: actor:= TCentipedeKingMon.Create;    //호혼석
      114: actor:= TFireLead.Create;            //열장적귀
      115: actor:= TGreatFoxSpirit.create;      //천주
      116: actor:= TGuardianRock.create;        //호혼기석
      117: actor:= TNamManMon.create;           //단묵
      118: actor:= TFireLead.Create;            //원오
      119: actor:= TBanyaGuardMon.Create;       //서괴
      120: actor:= TBanyaGuardMon.Create;       //광서괴
      121: actor:= TFireLead.Create;            //청신시
      122: actor:= TGasKuDeGi.Create;           //연혼괴수
      123: actor:= TFireLead.Create;            //연혼흑괴수
      124: actor:= TFireLead.Create;            //거도적귀
      125: actor:= TCatMon.Create;                 //갑석귀수
      126: actor:= TBanyaGuardMon.Create;          //갑철귀수
      127: actor:= TGreatFoxSpirit.create;            //현무현신
      128: actor:= TFireLead.Create;            //패검적귀
      129: actor:= TFireLead.Create;          //독인적귀
      130: actor:= THellGuard.create;          //지옥문지기
      131: actor:= THellMonster1.create;        //참원귀
      132: actor:= THellMonster2.create;        //강조귀
      133: actor:= THellMonster3.create;        //식신귀
      134: actor:= TBanyaGuardMon.Create;      //역천귀
      135: actor:= TBanyaGuardMon.Create;      //흑천귀
      136: actor:= TBlackFox.create;         //멸귀
      137: actor:= TBanyaGuardMon.Create;    //한천귀
      138: actor:= TCatMon.Create;          //한시
      139: actor:= TBanyaGuardMon.Create;   //광한시
      140: actor:= TBanyaGuardMon.Create;   //백상
      141: actor:= TBanyaGuardMon.Create;   //남만흑호
      142: actor:= TBanyaGuardMon.Create;   //남만백호
      143: actor:= TBanyaGuardMon.Create;   //흑성성
      144: actor:= TBanyaGuardMon.Create;   //서우
      145: actor:= TExplosionMon.Create;   //폭마야차
      146: actor:= TArcherMon2.Create;   //석마야차
      147: actor:= TBanyaGuardMon.Create;   //야공수호귀
      148: actor:= TFireLead.Create;    //견빙수호장
      149: actor:= TFireLead.Create;    //마염수호장
      150: actor:= TRedEffect.create;            //월지(레드)
      151: actor:= TRedEffect.create;            //월지(블루)
      152: actor:= TBanyaGuardMon.Create;       //월지마주(레드)
      153: actor:= TSpiderHouseMon2.create; //폭안마주
      154: actor:= TExplosionSpider2.create; //폭마주
      155: actor:= TJumaThunderMon.create; //월지격장
      156: actor:= TGumiBoss.create;       //월지겸신장
      157: actor:= TCatMon.Create;  //무명사령, 암흑사령, 혼마사령
      158: actor:= TBanyaGuardMon.Create;  //조인상
      159: actor:= TBanyaGuardMon.create;  //석마수
      160: actor:= TFireLead.Create;       //암혼수호장
      161: actor:= THellMonster4.create;   //수두귀
      162: actor:= THellMonster5.create;   //인면귀
      163: actor:= TFireLead.Create;       //열진수호장
      164: actor:= TBanyaGuardMon.Create;  //격투괭이
      165: actor:= TBanyaGuardMon.Create;  //불괭이
      166: actor:= TBanyaGuardMon.Create;  //창괭이
      167: actor:= TBanyaGuardMon.Create;  //얼룩망치괭이
      168: actor:= TFireLead.Create;       //검은망치괭이
      169: actor:= TBanyaGuardMon.Create;  //갑괭이
      170: actor:= TFireLead.Create;       //무당괭이
      171: actor:= TPotMon.Create;         //호중귀2
      172: actor:= TFireLead.Create;       //호중귀1
      173: actor:= TFireLead.Create;       //고대수호장
      174: actor:= TBanyaGuardMon.Create;  //인면수
      175: actor:= TFireLead.Create;       //묘장군
      176: actor:= TBanyaGuardMon.Create;  //호중천
      177: actor:= TBanyaGuardMon.Create;  //진묘장군
      178: actor:= TGreatKing.Create;      //염마태자
      179: actor:= TCatMon.Create;         //어린어인
      180: actor:= TBanyaGuardMon.Create;  //어창인
      181: actor:= TBanyaGuardMon.Create;  //어법인
      182: actor:= TBanyaGuardMon.Create;  //어월인
      183: actor:= TBanyaGuardMon.Create;  //토견
      184: actor:= TBanyaGuardMon.Create;  //호토견
      185: actor:= TFishEgg.Create;   //어인의알
      186: actor:= TCatMon.Create;         //어인
      187: actor:= TBanyaGuardMon.Create;  //각섬
      188: actor:= TBanyaGuardMon.Create;  //인용
      189: actor:= TMerMaidKingMon.create; //수어귀
      190: actor:= TBanyaGuardMon.Create;  //땅두꺼비
      191: actor:= TBanyaGuardMon.Create;  //의인충
      192: actor:= TBanyaGuardMon.Create;  //인간수
      193: actor:= TBanyaGuardMon.Create;  //문조인
      194: actor:= TBanyaGuardMon.Create;  //작은뿔서우인
      195: actor:= TYehaGuardMon.Create; //큰뿔서우인
      196: actor:= TYehaGuardMon.Create; //백상인
      197: actor:= TYehaGuardMon.Create; //돌거인
      198: actor:= TYehaGuardMon.Create; //흙거인
      199: actor:= TYehaGuardMon.Create; //가네수
      200: actor:= TBossTreeMan.Create; //여하수
      201: actor:= TYehaGuardMon.Create; //공작주
      202: actor:= TCatMon.Create;        //눈꽃도둑
      203: actor:= TShineCaveMon.Create;       //태구오마
      204: actor:= TShineCaveMon.Create;       //거권오마
      205: actor:= TShineCaveMon.Create;       //오마흑병
      206: actor:= TShineCaveMon.Create;       //오마적병
      207: actor:= TShineCaveMon.Create;       //오마제사장
      208: actor:= TShineCaveMon.Create;       //다목오마
      209: actor:= TIceHellMonster.create;   //설인량
      210: actor:= TIceHellMonster1.create;    //격빙야차
      211: actor:= TIceHellMonster2.create;        //창한야차
      212: actor:= TIceHellMonster3.create;      //야차수호장
      213: actor:= TFireLead.Create;           //한빙수호귀
      214: actor:= TIceHellMonster5.Create;            //빙한지옥문
      215: actor:= TIceHellMonster6.Create;            //귀연석
      216,217,218: actor:= TBanyaGuardMon.Create;      //구슬
      219: actor:= TFireLead.Create;          //오마흑령
      220: actor:= TShineCaveMon.Create;      //긴코원숭이
      221: actor:= TShineCaveMon.Create;     //변이갑충
      222: actor:= TShineCaveMon.Create;      //거장화
      223: actor:= TWindLead.Create;   //마풍석괴

      225: actor:= TShineCaveMon.Create;   //그을린요리사
      226: actor:= TShineCaveMon.Create;   //떠도는선원
      227: actor:= TShineCaveMon.Create;    //익사한노예
      228: actor:= TShineCaveMon.Create;    //선박의악령
      229: actor:= TShineCaveMon.Create;    //농노군
      230: actor:= TShineCaveMon.Create;   //거친선목
      231: actor:= TShineCaveMon.Create;    //변이된감시병
      232: actor:= TShineCaveMon.Create;    //혼불
      233: actor:= TShineCaveMon.Create;   //암흑선장

      234: actor := TWhiteSkeleton.Create;  //진골

      240..251: actor := TPet.Create;   //영물
      //=====현월림====
      261: actor := TShineCaveMon.Create;        //숲거북이
      262: actor := TShineCaveMon.Create;        //삼나무정백
      263: actor := TShineCaveMon.Create;        //현월환호
      264: actor := TShineCaveMon.Create;        //곰
      265: actor := TShineCaveMon.Create;        //표범
      266: actor := TWarriorH.Create;            //현월단전사(남)
      267: actor := TWarriorH.Create;            //현월단전사(여)
      268: actor := TWizardH.Create;             //현월단술사(남)
      269: actor := TWizardH.Create;             //현월단술사(여)
      270: actor := TToaistH.Create;             //현월단도사(남)
      271: actor := TToaistH.Create;             //현월단도사(여)
      272: actor := TAssassinH.Create;           //현월단자객(남)
      273: actor := TAssassinH.Create;           //현월단자객(여)
      274: actor := TWarriorM2.Create;           //전승전사
      275: actor := TWizardM2.Create;            //성술사
      276: actor := TToaistF2.Create;            //정연도사
      277: actor := TAssassinM2.Create;          //혁문객
      278: actor := TAchorMonster.Create;        //유상궁장
      279: actor := TJobking.Create;             //양용왕

      //설백현 필드
      280: actor := TShineCaveMon.Create;        //빙원귀
      281: actor := TShineCaveMon.Create;        //빙원귀병
      282: actor := TShineCaveMon.Create;        //빙원귀궁사
      283: actor := TShineCaveMon.Create;        //빙원귀존
      284: actor := TShineCaveMon.Create;        //설악귀
      285: actor := TShineCaveMon.Create;        //악귀
      286: actor := TShineCaveMon.Create;        //설랑
      287: actor := TShineCaveMon.Create;        //설태랑
      else actor := TActor.Create;
   end;

   with actor do begin
      m_nRecogId := chrid;
      m_nCurrX     := cx;
      m_nCurrY     := cy;
      m_nRx        := m_nCurrX;
      m_nRy        := m_nCurrY;
      m_btDir      := cdir;
      m_nFeature   := cfeature;
      m_btRace     := RACEfeature(cfeature);         //changefeature
      m_btHair     := HAIRfeature(cfeature);
      m_btDress    := DRESSfeature(cfeature);
      m_btWeapon   := WEAPONfeature(cfeature);
      m_wAppearance:= APPRfeature(cfeature);
     { m_btRaceServer := 0;
      if m_btRace <> 0 then begin
        m_btRaceServer := m_btWeapon;
        m_btWeapon := 0;
      end;   }

      //m_Action     := GetMonAction(m_wAppearance);
      if m_btRace = 0 then begin
        m_btSex := m_btDress mod 2;   //0:남 1:여
      end else
      if m_btRace = 50 then begin
        SetMissionList(TNPCActor(Actor));
        SetMissionInfo(TNPCActor(Actor));
        m_btSex := 0;
      end
      else begin
        m_btSex := 0;
      end;
      m_nState  := cstate;
      if m_btRace = 0 then begin
        SetActorGroup(Actor);
      end;
   end;
   m_ActorList.Add(actor);
   Result := actor;
end;


procedure TPlayScene.SetMissionList(Actor: TNPCActor);
var
  ClientMission: pTClientMission;
  i: integer;
begin
  with Actor do begin
    if m_MissionList <> nil then begin
      m_MissionList.Clear;
    end;
    for i := 0 to g_MissionList.Count - 1 do begin
      ClientMission := pTClientMission(g_MissionList[i]);
      if (CompareText(ClientMission.sNPCMapName, g_sMapTitle) = 0) and
        (ClientMission.wNPCCurrX = m_nCurrX) and (ClientMission.wNPCCurrY = m_nCurrY) then begin
        if m_MissionList = nil then
          m_MissionList := TList.Create;
        ClientMission.NPC := Actor;
        m_MissionList.Add(ClientMission);
      end;
    end;
  end;
end;


procedure TPlayScene.SetMissionInfo(Actor: TNPCActor);
var
  MissionList: TList;
  ClientMission: pTClientMission;
  MissionInfo: pTClientMissionInfo;
  MissionStatus, OldMissionStatus: TNPCMissionStatus;
  i: integer;
begin
  if g_MySelf = nil then exit;
  MissionList := Actor.m_MissionList;
  Actor.m_MissionStatus := NPCMS_None;
  if (MissionList <> nil) and (MissionList.Count > 0) then begin
    for i := 0 to MissionList.Count - 1 do begin
      ClientMission := pTClientMission(MissionList[i]);
      if ClientMission.boHide then Continue;
      if Actor.m_MissionStatus = NPCMS_Complete then break;
      MissionInfo := pTClientMissionInfo(ClientMission.MissionInfo);
      OldMissionStatus := Actor.m_MissionStatus;
      MissionStatus := OldMissionStatus;
      //角뤠唐綠供냥훨蛟
      if (MissionInfo <> nil) and (not ClientMission.boAccept) then begin
        if OldMissionStatus = NPCMS_None then
          OldMissionStatus := NPCMS_Atelic;
        MissionStatus := NPCMS_Complete;
        if (ClientMission.CompleteFlag[0].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.CompleteFlag[0].nFlag) <> ClientMission.CompleteFlag[0].btValue) then
          MissionStatus := OldMissionStatus;
        if (MissionStatus = NPCMS_Complete) and (ClientMission.CompleteFlag[1].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.CompleteFlag[1].nFlag) <> ClientMission.CompleteFlag[1].btValue) then
          MissionStatus := OldMissionStatus;
        if (MissionStatus = NPCMS_Complete) and (ClientMission.CompleteFlag[2].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.CompleteFlag[2].nFlag) <> ClientMission.CompleteFlag[2].btValue) then
          MissionStatus := OldMissionStatus;

        if ((MissionStatus = NPCMS_Complete) and (MissionInfo <> nil) and
          (MissionInfo.nItemCount1 < ClientMission.CompleteItem[0].wItemCount)) then
          MissionStatus := OldMissionStatus;
        if ((MissionStatus = NPCMS_Complete) and (MissionInfo <> nil) and
          (MissionInfo.nItemCount2 < ClientMission.CompleteItem[1].wItemCount)) then
          MissionStatus := OldMissionStatus;
        if ((MissionStatus = NPCMS_Complete) and (MissionInfo <> nil) and
          (MissionInfo.nItemCount3 < ClientMission.CompleteItem[2].wItemCount)) then
          MissionStatus := OldMissionStatus;

        if ((MissionStatus = NPCMS_Complete) and (MissionInfo <> nil) and
          (MissionInfo.MissionInfo.btKillCount1 < ClientMission.btKillCount1)) then
          MissionStatus := OldMissionStatus;
        if ((MissionStatus = NPCMS_Complete) and (MissionInfo <> nil) and
          (MissionInfo.MissionInfo.btKillCount2 < ClientMission.btKillCount2)) then
          MissionStatus := OldMissionStatus;
      end else
      if ClientMission.boAccept and (OldMissionStatus <> NPCMS_Complete) and (OldMissionStatus <> NPCMS_Accept) then begin
        MissionStatus := NPCMS_Accept;
        if (ClientMission.AcceptFlag[0].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.AcceptFlag[0].nFlag) <> ClientMission.AcceptFlag[0].btValue) then
          MissionStatus := OldMissionStatus;
        if (MissionStatus = NPCMS_Accept) and (ClientMission.AcceptFlag[1].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.AcceptFlag[1].nFlag) <> ClientMission.AcceptFlag[1].btValue) then
          MissionStatus := OldMissionStatus;
        if (MissionStatus = NPCMS_Accept) and (ClientMission.AcceptFlag[2].nFlag <> 0) and
          (GetMissionFlagStatus(ClientMission.AcceptFlag[2].nFlag) <> ClientMission.AcceptFlag[2].btValue) then
          MissionStatus := OldMissionStatus;

        if (MissionStatus = NPCMS_Accept) and (ClientMission.btJob <> 99) and (g_MySelf.m_btJob <> ClientMission.btJob) then
          MissionStatus := OldMissionStatus;

        if (MissionStatus = NPCMS_Accept) and (ClientMission.btSex <> 99) and (g_MySelf.m_btSex <> ClientMission.btSex) then
          MissionStatus := OldMissionStatus;

        if (MissionStatus = NPCMS_Accept) and
          ((g_MySelf.m_Abil.Level < ClientMission.nMinLevel) or (g_MySelf.m_Abil.Level > ClientMission.nMaxLevel)) then
          MissionStatus := OldMissionStatus;

        if (MissionStatus = NPCMS_Accept) and (ClientMission.btCycCount > 0) and
          (ClientMission.btCycVar in [Low(g_MissionArithmometer)..High(g_MissionArithmometer)]) and
          (g_MissionArithmometer[ClientMission.btCycVar] >= ClientMission.btCycCount) then
          MissionStatus := OldMissionStatus;                                   
      end;
      Actor.m_MissionStatus := MissionStatus;
    end;
  end;
end;
           
procedure TPlayScene.ClearMissionList(Actor: TActor);
var
  ClientMission: pTClientMission;
  i: integer;
begin
  if Actor.m_btRace = 50 then begin
    with Actor as TNPCActor do begin
      if m_MissionList <> nil then begin
        for i := 0 to m_MissionList.Count - 1 do begin
          ClientMission := pTClientMission(m_MissionList[i]);
          ClientMission.NPC := nil;
        end;
        m_MissionList.Clear;
      end;
    end;
  end;
end;



procedure TPlayScene.SetOperateHint(sHint: string);        //라인공지
var
  sTextWidth: Integer;
  sStr: string;
begin
  if m_OperateHintSurface <> nil then begin
    m_OperateHintSurface.Fill(0);
    sTextWidth := m_OperateHintSurface.Canvas.TextWidth(sHint);
    sStr := GetValidStr3(sHint, sHint, ['\']);
    if sStr <> '' then begin
      SetBkMode (m_OperateHintSurface.Canvas.Handle , TRANSPARENT);
      BoldTextOut(m_OperateHintSurface, OPERATEHINTWIDTH div 2 - (m_OperateHintSurface.Canvas.TextWidth(sHint) div 2), 2, clWhite, clBlack, sHint);
      BoldTextOut(m_OperateHintSurface, OPERATEHINTWIDTH div 2 - (m_OperateHintSurface.Canvas.TextWidth(sStr) div 2), 18, clWhite, clBlack, sStr);
      m_OperateHintSurface.Canvas.Release;
    end else begin
      SetBkMode (m_OperateHintSurface.Canvas.Handle , TRANSPARENT);
      BoldTextOut(m_OperateHintSurface, OPERATEHINTWIDTH div 2 - sTextWidth div 2, OPERATEHINTHEIGHT div 2 - 7, clWhite, clBlack, sHint);
      m_OperateHintSurface.Canvas.Release;
    end;
  end;
end;


procedure TPlayScene.ActorDied (actor: TObject);
var
   i: integer;
   flag: Boolean;
begin
   for i:=0 to m_ActorList.Count-1 do
      if m_ActorList[i] = actor then begin
         m_ActorList.Delete (i);
         break;
      end;
   flag := FALSE;
   for i:=0 to m_ActorList.Count-1 do
      if not TActor(m_ActorList[i]).m_boDeath then begin
         m_ActorList.Insert (i, actor);
         flag := TRUE;
         break;
      end;
   if not flag then m_ActorList.Add (actor);
end;

procedure TPlayScene.SetActorDrawLevel (actor: TObject; level: integer);
var
   i: integer;
begin
   if level = 0 then begin
      for i:=0 to m_ActorList.Count-1 do
         if m_ActorList[i] = actor then begin
            m_ActorList.Delete (i);
            m_ActorList.Insert (0, actor);
            break;
         end;
   end;
end;

procedure TPlayScene.ClearActors;      //로그아웃만 사용
var
   i: integer;
begin
   for i:=0 to m_ActorList.Count-1 do begin
      if TActor(m_ActorList[i]).m_Group <> nil then begin
        TActor(m_ActorList[i]).m_Group.isScreen := nil;      //ClearActors
        TActor(m_ActorList[i]).m_Group := nil;
      end;
      if TActor(m_ActorList[I]) = g_MyHero then g_MyHero := nil;
      ClearMissionList(TActor(m_ActorList[i]));
      TActor(m_ActorList[i]).Free;
   end;
   m_ActorList.Clear;

   if g_MyHero <> nil then begin
     FreeAndNil(g_MyHero);
   end;

   g_MySelf := nil;
   g_MyHero := nil;
   g_TargetCret := nil;
   g_FocusCret := nil;

   g_MagicTarget := nil;

   if m_EffectList.Count > 0 then begin
      for i := 0 to m_EffectList.Count - 1 do
        TMagicEff(m_EffectList[i]).Free;
      m_EffectList.Clear;
   end;
end;

procedure TPlayScene.ClearActorMsg(Actor: TActor);
var
  I: Integer;
begin
  Actor.m_MsgList.Lock;
  try
    for I := 0 to Actor.m_MsgList.Count - 1 do begin
      Dispose(pTChrMsg(Actor.m_MsgList.Items[I]));
    end;
    Actor.m_MsgList.Clear;
  finally
    Actor.m_MsgList.UnLock;
  end;
end;

function  TPlayScene.DeleteActor (id: integer): TActor;
var
   i: integer;
begin
   Result := nil;
   i := 0;
   while TRUE do begin
      if i >= m_ActorList.Count then break;
      if TActor(m_ActorList[i]).m_nRecogId = id then begin
         if g_TargetCret = TActor(m_ActorList[i]) then g_TargetCret := nil;
         if g_FocusCret = TActor(m_ActorList[i]) then g_FocusCret := nil;
         if g_MagicTarget = TActor(m_ActorList[i]) then g_MagicTarget := nil;
         if TActor(m_ActorList[i]).m_Group <> nil then begin
           TActor(m_ActorList[i]).m_Group.isScreen := nil;     //DeleteActor
           TActor(m_ActorList[i]).m_Group := nil;
         end;
         if (g_MyHero <> nil) and (g_MyHero = TActor(m_ActorList[i])) then begin
           m_ActorList.Delete(I);
           ClearActorMsg(g_MyHero);
         end else begin
           ClearMissionList(TActor(m_ActorList[i]));
           m_ActorList.Delete (i);
         end;
      end else
         Inc (i);
   end;
end;

procedure TPlayScene.DelActor (actor: TObject);
var
   i: integer;
begin
   for i:=0 to m_ActorList.Count-1 do
      if m_ActorList[i] = actor then begin
         if TActor(m_ActorList[i]).m_Group <> nil then begin
           TActor(m_ActorList[i]).m_Group.isScreen := nil;     //DelActor
           TActor(m_ActorList[i]).m_Group := nil;
         end;
         ClearMissionList(TActor(m_ActorList[i]));
         m_ActorList.Delete (i);
         break;
      end;
end;


procedure TPlayScene.SetEditChar(sMsg: string);
begin
  if sMsg <> '' then begin
    if not EdChat.Visible then begin
      EdChat.Visible := TRUE;
      EdChat.SetFocus;
    end;
    EdChat.Text := '/' + sMsg + ' ';
    EdChat.SelStart := Length(EdChat.Text);
    EdChat.SelLength := 0;
    LocalLanguage := imSHanguel;    //한글
    SetImeMode (EdChat.Handle, LocalLanguage);
  end;
end;

procedure TPlayScene.SetActorGroup(Actor: TActor);   //연관없음
var
  ii: Integer;
  GroupMember: pTGroupMember;
begin
  if g_MemberGroup.Count <= 0 then exit;
  for ii := 0 to g_MemberGroup.Count - 1 do begin
    GroupMember := g_MemberGroup.Items[ii];
    if GroupMember.ClientGroup.UserID = Actor.m_nRecogId then begin
      GroupMember.isScreen := Actor;   //SetActorGroup //연관없음
      Actor.m_Group := GroupMember;
      Actor.m_Abil.MaxHP := GroupMember.ClientGroup.MaxHP;
      Actor.m_Abil.HP := GroupMember.ClientGroup.HP;
      Break;
    end;
  end;
end;

procedure TPlayScene.ClearGroup();
var
  i: Integer;
begin
  for i := 0 to m_ActorList.count - 1 do begin
    TActor(m_ActorList[i]).m_Group := nil;
  end;
end;

procedure TPlayScene.SetMembersGroup(GroupMember: pTGroupMember; boGroup:
  Boolean);
var
  i: Integer;
  Actor: TActor;
begin
  for i := 0 to m_ActorList.count - 1 do begin
    Actor := m_ActorList.Items[i];
    if GroupMember.ClientGroup.UserID = Actor.m_nRecogId then begin
      if boGroup then begin
        Actor.m_Group := GroupMember;
        GroupMember.isScreen := Actor;     //SetMembersGroup
        Actor.m_Abil.MaxHP := GroupMember.ClientGroup.MaxHP;
        Actor.m_Abil.HP := GroupMember.ClientGroup.HP;
      end
      else begin
        Actor.m_Group := nil;
        GroupMember.isScreen := nil;      //SetMembersGroup
      end;
      Break;
    end;
  end;
end;

procedure TPlayScene.SetMembersGroup(GroupMembers: TList);
var
  i, ii: Integer;
  Actor: TActor;
  GroupMember: pTGroupMember;
begin
  for i := 0 to m_ActorList.count - 1 do begin
    Actor := m_ActorList.Items[i];
    Actor.m_Group := nil;
    for ii := 0 to GroupMembers.Count - 1 do begin
      GroupMember := GroupMembers.Items[ii];
      if GroupMember.ClientGroup.UserID = Actor.m_nRecogId then begin
        Actor.m_Group := GroupMember;
        GroupMember.isScreen := Actor;     //SetMembersGroup
        Actor.m_Abil.MaxHP := GroupMember.ClientGroup.MaxHP;
        Actor.m_Abil.HP := GroupMember.ClientGroup.HP;
        Break;
      end;
    end;
  end;
end;

function  TPlayScene.ButchAnimal (x, y: integer): TActor;
var
   i: integer;
   a: TActor;
begin
   Result := nil;
   for i:=0 to m_ActorList.Count-1 do begin
      a := TActor(m_ActorList[i]);
      if a.m_boDeath and (a.m_btRace <> 0) then begin //동물 시체
         if (abs(a.m_nCurrX - x) <= 1) and (abs(a.m_nCurrY - y) <= 1) then begin
            Result := a;
            break;
         end;
      end;
   end;
end;

{------------------------- Msg -------------------------}

procedure TPlayScene.SendMsg (ident, chrid, x, y, cdir, feature, state: integer; str: string);
var
   actor: TActor;
begin
   case ident of
      SM_TEST:
         begin
            actor := NewActor (111, 254{x}, 214{y}, 0, 0, 0);
            g_MySelf := THumActor (actor);
            Map.LoadMap ('0', g_MySelf.m_nCurrX, g_MySelf.m_nCurrY);
         end;
      SM_CHANGEMAP,
      SM_NEWMAP: begin
        g_boAutoMoveing := False;
        g_boNpcMoveing := False;
        g_nMiniMapMoseX := -1;
        g_nMiniMapMoseY := -1;
        g_nMiniMapPath := nil;
        g_nMiniMapOldX := -1;
        
        Map.LoadMap (str, x, y);
        DarkLevel := cdir;
        g_boViewFog := FALSE;
       // if DarkLevel = 0 then g_boViewFog := FALSE
       // else g_boViewFog := TRUE;

        if (ident = SM_NEWMAP) and (g_MySelf <> nil) then begin
          g_MySelf.m_nCurrX := x;
          g_MySelf.m_nCurrY := y;
          g_MySelf.m_nRx := x;
          g_MySelf.m_nRy := y;
          DelActor (g_MySelf);
        end;

      end;
      SM_LOGON:
         begin
            actor := FindActor (chrid);
            if actor = nil then begin
               actor := NewActor (chrid, x, y, Lobyte(cdir), feature, state);
               actor.m_nChrLight := Hibyte(cdir);
               cdir := Lobyte(cdir);
               actor.SendMsg (SM_TURN, x, y, cdir, feature, state, '', 0);
            end;
            if g_MySelf <> nil then begin
               g_MySelf := nil;
            end;
            g_MySelf := THumActor (actor);
         end;
      SM_HIDE:
         begin
            actor := FindActor (chrid);
            if actor <> nil then begin
               if actor.m_boDelActionAfterFinished then begin     //땅으로 사라지는 애니메이션이 끝나면 자동으로 사라짐.
                  exit;
               end;
               if actor.m_nWaitForRecogId <> 0 then begin   //변신중.. 변신이 끝나면 자동으로 사라짐
                  exit;
               end;
            end;
            DeleteActor (chrid);
         end;
      SM_HEROLOGON:
         begin
             Actor := FindActor(chrid);
             if Actor = nil then begin
               Actor := NewActor(chrid, X, Y, Lobyte(cdir), Feature, State);
               Actor.m_boisHero := True;
               Actor.m_btJob := HiByte(cdir);
               cdir := LoByte(cdir);

               Actor.SendMsg(SM_HEROLOGON, chrid, X, Y, Lobyte(cdir), 0, '', 0);
               Actor.SendMsg(SM_TURN, X, Y, cdir, Feature, State, '', 0);
             end;
         end;
      else begin
            actor := FindActor (chrid);
            if (ident=SM_TURN) or (ident=SM_RUN)  or (ident=SM_HORSERUN) or (ident = SM_SPEEDRUN)  or (ident = SM_DOWNRUN) or (ident=SM_WALK) or (ident=SM_DOWN)or
               (ident=SM_BACKSTEP) or (ident = SM_MAGICMOVE) or                  //경신보
               (ident = SM_DEATH) or (ident = SM_SKELETON) or
               (ident = SM_DIGUP) or (ident = SM_ALIVE) then
            begin
               if actor = nil then
                  actor := NewActor (chrid, x, y, Lobyte(cdir), feature, state);
               if actor <> nil then begin
                  actor.m_nChrLight := Hibyte(cdir);
                  cdir := Lobyte(cdir);

                  if ident = SM_SKELETON then begin
                     actor.m_boDeath := TRUE;
                     actor.m_boSkeleton := TRUE;
                  end
                  else if (ident = SM_ALIVE) then begin //부활
                     if (actor.m_btRace = RCC_USERHUMAN) then
                       FrmMain.DrawEffectHumEx(16,actor);      //소생 이팩
                     actor.m_nFeature := feature;
                     actor.FeatureChanged;

                     g_boViewFog := FALSE;
                     actor.m_boDeath := False;
                     actor.m_boSkeleton := False;
                  end;
               end;
            end;
            if actor = nil then exit;
            case ident of
               SM_FEATURECHANGED: begin
                 actor.m_nFeature := feature;
                 actor.m_nFeatureEx:=state;
                 actor.FeatureChanged;
               end;

               SM_CHARSTATUSCHANGED: begin
                 actor.m_nState:= Feature;
                 if (feature and $10000000 <> 0)then begin   //쌍룡참
                  frmmain.DrawEffectHum(9,actor.m_nCurrX,actor.m_nCurrY,0);
                 end;
                 actor.m_nHitSpeed:= state;
               end;
               else begin
                  if ident = SM_TURN then begin
                     if str <> '' then
                        actor.m_sUserName := str;   
                  end;
                  actor.SendMsg (ident, x, y, cdir, feature, state, '', 0);
               end;
            end;
         end;
   end;
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: PlayScn.pas 597 2007-04-11 19:46:11Z sean $');
end.
