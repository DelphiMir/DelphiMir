unit IntroScn;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, StdCtrls, Controls, Forms, Dialogs,
  extctrls, DXDraws, DXClass, FState, Grobal2, cliUtil, clFunc, SoundUtil, FState2,
  DXSounds, HUtil32 ,EDCode;


const
   //SELECTEDFRAME = 16;
   //FREEZEFRAME = 16;
   EFFECTFRAME = 14;

type
   TLoginState = (lsLogin, lsNewid, lsNewidRetry, lsChgpw, lsCloseAll);
   TSelectChrState = (scSelectChr, scCreateChr, scRenewChr);
   TSceneType = (stIntro, stLogin, stSelectCountry, stSelectChr, stNewChr, stPlayGame);
   TSelChar = record
      Valid: Boolean;
      UserChr: TUserCharacterInfo;
      Selected: Boolean;
      FreezeState: Boolean;
      Unfreezing: Boolean;
      Freezing: Boolean;
      AniIndex: integer;
      DarkLevel: integer;
      EffIndex: integer;
      StartTime: longword;
      moretime: longword;
   end;

   TScene = class
   private
   public
      SceneType: TSceneType;
      constructor Create (scenetype: TSceneType);
      procedure Initialize; dynamic;
      procedure Finalize; dynamic;
      procedure OpenScene; dynamic;
      procedure CloseScene; dynamic;
      procedure OpeningScene; dynamic;
      procedure KeyPress (var Key: Char); dynamic;
      procedure KeyDown (var Key: Word; Shift: TShiftState); dynamic;
      procedure MouseMove (Shift: TShiftState; X, Y: Integer); dynamic;
      procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); dynamic;
      procedure PlayScene (MSurface: TDirectDrawSurface); dynamic;
   end;

   TLoginScene = class (TScene)
   private
     m_EdId           :TEdit;
     m_EdPasswd       :TEdit;
     m_EdNewId        :TEdit;
     m_EdNewPasswd    :TEdit;
     m_EdConfirm      :TEdit;
     m_EdYourName     :TEdit;
     m_EdBirthDay     :TEdit;
     m_EdQuiz1        :TEdit;
     m_EdAnswer1      :TEdit;
     m_EdQuiz2        :TEdit;
     m_EdAnswer2      :TEdit;
     m_EdPhone        :TEdit;
     m_EdMobPhone     :TEdit;
     m_EdEMail        :TEdit;
     m_EdChgId        :TEdit;
     m_EdChgCurrentpw :TEdit;
     m_EdChgNewPw     :TEdit;
     m_EdChgRepeat    :TEdit;
     m_nCurFrame      :Integer;
     m_nMaxFrame      :Integer;
     m_dwStartTime    :LongWord;
     m_boNowOpening   :Boolean;
     m_boOpenFirst    :Boolean;
     m_NewIdRetryUE   :TUserEntry;
     m_NewIdRetryAdd  :TUserEntryAdd;

     m_nCurFrame1: Integer;
     m_nCurFrame2: Integer;
     m_nCurFrame3: Integer;
     m_nCurFrame4: Integer;
     m_nCurFrame5: Integer;
     m_dwStartTime1: LongWord;
     m_dwStartTime2: LongWord;
     m_dwStartTime3: LongWord;
     m_dwStartTime4: LongWord;
     m_dwStartTime5: LongWord;
     procedure EdLoginIdKeyPress (Sender: TObject; var Key: Char);
     procedure EdLoginPasswdKeyPress (Sender: TObject; var Key: Char);
     procedure EdNewIdKeyPress (Sender: TObject; var Key: Char);
     procedure EdNewOnEnter (Sender: TObject);
     function  CheckUserEntrys: Boolean;
     function  NewIdCheckNewId: Boolean;
     function  NewIdCheckBirthDay: Boolean;
   public
     m_sLoginId            :String;
     m_sLoginPasswd        :String;
     m_boUpdateAccountMode :Boolean;
     constructor Create;
      destructor Destroy; override;
      procedure OpenScene; override;
      procedure CloseScene; override;
      procedure PlayScene (MSurface: TDirectDrawSurface); override;
      procedure ChangeLoginState (state: TLoginState);
      procedure NewClick;
      procedure NewIdRetry (boupdate: Boolean);
      procedure UpdateAccountInfos (ue: TUserEntry);
      procedure OkClick;
      procedure ChgPwClick;
      procedure NewAccountOk;
      procedure NewAccountClose;
      procedure ChgpwOk;
      procedure ChgpwCancel;
      procedure HideLoginBox;
      procedure OpenLoginDoor;
      procedure PassWdFail;
   end;

   TSelectChrScene = class (TScene)
   private
      SoundTimer: TTimer;
      CreateChrMode: Boolean;
      EdChrName: TEdit;
      m_dwStartTime :LongWord;
      Numbert :integer;
      Help1   :integer;
      Help2   :integer;
      logodxdindex :integer;
      m_LoadingTime :LongWord;
      m_LoadingWaitTime :LongWord;
      m_boNowLoading :Boolean;
      m_nCurFrame :Integer;
      m_nMaxFrame :Integer;

      m_nCurFrame1: Integer;
      m_nCurFrame2: Integer;
      m_nCurFrame3: Integer;
      m_nCurFrame4: Integer;
      m_nCurFrame5: Integer;
      m_nCurFrame6: Integer;
      m_dwStartTime1: LongWord;
      m_dwStartTime2: LongWord;
      m_dwStartTime3: LongWord;
      m_dwStartTime4: LongWord;
      m_dwStartTime5: LongWord;
      m_dwStartTime6: LongWord;
      procedure SoundOnTimer (Sender: TObject);
      procedure MakeNewChar (index: integer);
      procedure EdChrnameKeyPress (Sender: TObject; var Key: Char);
   public
      NewIndex: integer;
      ChrArr: array[0..3] of TSelChar;
      RenewChr: array[0..11-1] of TRenewChrInfo;
      constructor Create;
      destructor Destroy; override;
      procedure OpenScene; override;
      procedure CloseScene; override;
      procedure PlayScene (MSurface: TDirectDrawSurface); override;
      procedure SelChrSound(job, sex: Byte);
      procedure SelChrSelect1Click;
      procedure SelChrSelect2Click;
      procedure SelChrSelect3Click;
      procedure SelChrSelect4Click;
      procedure SelChrStartClick;
      procedure SelChrNewChrClick;
      procedure SelChrEraseChrClick;
      procedure SelChrCreditsClick;
      procedure SelChrExitClick;
      procedure SelChrNewClose;
      procedure SelChrNewJob (job: integer);
      procedure SelChrNewm_btSex (sex: integer);
      procedure SelChrHair(Hair: Integer);
      procedure SelChrNewOk;
      procedure SelRenewChr;
      procedure ClearChrs;
      procedure AddChr (uname: string; job, hair, level, sex: integer; login:String);
      procedure ChangeSelectChrState(State: TSelectChrState);
      procedure SelectChr (index: integer);
      procedure OpenLoading;
      procedure HideSelectChrBox;
      procedure LoadHelp1;
      procedure LoadHelp2;
   end;


implementation

uses
   ClMain, MShare, Share;


constructor TScene.Create (scenetype: TSceneType);
begin
   SceneType := scenetype;
end;

procedure TScene.Initialize;
begin
end;

procedure TScene.Finalize;
begin
end;

procedure TScene.OpenScene;
begin
   ;
end;

procedure TScene.CloseScene;
begin
   ;
end;

procedure TScene.OpeningScene;
begin
end;

procedure TScene.KeyPress (var Key: Char);
begin
end;

procedure TScene.KeyDown (var Key: Word; Shift: TShiftState);
begin
end;

procedure TScene.MouseMove (Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
end;

procedure TScene.PlayScene (MSurface: TDirectDrawSurface);
begin
   ;
end;

{--------------------- Login ----------------------}
constructor TLoginScene.Create;        //·Î±×ÀÎ Ã¢ ¾ÆÀÌµð ÆÐ½º¿öµå
var
   nx, ny: integer;
begin
   inherited Create (stLogin);
   m_EdId := TEdit.Create (FrmMain.Owner);
   with m_EdId do begin
      Parent := FrmMain;
      Color  := clBlack;
      Font.Name := g_sCurFontName;     //º»¼·±Û½ÃÃ¼
      Font.Color := clWhite;
      Font.Size := 10;
      MaxLength := 10;
      BorderStyle := bsNone;
      OnKeyPress := EdLoginIdKeyPress;
      Visible := FALSE;
      Tag := 10;
   end;
   m_EdPasswd := TEdit.Create (FrmMain.Owner);
   with m_EdPasswd do begin
      Parent := FrmMain;
      Color  := clBlack;
      Font.Name := g_sCurFontName;    //º»¼·±Û½ÃÃ¼
      Font.Size := 10;
      MaxLength := 10;
      Font.Color := clWhite;
      BorderStyle := bsNone; PasswordChar := '*';
      OnKeyPress := EdLoginPasswdKeyPress; Visible := FALSE;
      Tag := 10;
   end;
   nX := (g_FScreenWidth - 800) div 2 + 80;
   nY := (g_FScreenHeight - 600) div 2 + 62;
   m_EdNewId := TEdit.Create (FrmMain.Owner);
   with m_EdNewId do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 114;
      Left := nx + 273;
      Top  := ny + 114;
      BorderStyle := bsNone;
      Color := ClBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdNewPasswd := TEdit.Create (FrmMain.Owner);
   with m_EdNewPasswd do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 114;
      Left := nx + 273;
      Top  := ny + 135;
      BorderStyle := bsNone;
      Color := ClBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*'; Visible := FALSE;  OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdConfirm := TEdit.Create (FrmMain.Owner);
   with m_EdConfirm do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 114;
      Left := nx + 273;
      Top  := ny + 156;
      BorderStyle := bsNone; Color := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 10;
      PasswordChar := '*';  Visible := FALSE;  OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdYourName := TEdit.Create (FrmMain.Owner);
   with m_EdYourName do begin
      Parent := FrmMain; Height := 14; Width  := 114; Left := nx + 273; Top  := ny + 198;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 10;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;

   m_EdBirthDay := TEdit.Create (FrmMain.Owner);
   with m_EdBirthDay do begin
      Parent := FrmMain;
      Height := 14;
      Width := 114;
      Left := nx + 273;
      Top  := ny + 219;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 10;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;

   m_EdEMail := TEdit.Create (FrmMain.Owner);
   with m_EdEMail do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 114;
      Left := nx + 273;
      Top  := ny + 240;
      BorderStyle := bsNone;
      Color := ClBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 40;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;

   m_EdQuiz1 := TEdit.Create (FrmMain.Owner);
   with m_EdQuiz1 do begin
      Parent := FrmMain;  Height := 14; Width  := 160; Left := nx + 273; Top  := ny + 282;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 20;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdAnswer1 := TEdit.Create (FrmMain.Owner);
   with m_EdAnswer1 do begin
      Parent := FrmMain;  Height := 14; Width  := 160; Left := nx + 273; Top  := ny + 303;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 12;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdQuiz2 := TEdit.Create (FrmMain.Owner);
   with m_EdQuiz2 do begin
      Parent := FrmMain;  Height := 14; Width  := 160; Left := nx + 273; Top  := ny + 324;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 20;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdAnswer2 := TEdit.Create (FrmMain.Owner);
   with m_EdAnswer2 do begin
      Parent := FrmMain;  Height := 14; Width  := 160; Left := nx + 273; Top  := ny + 345;
      BorderStyle := bsNone; Color  := ClBlack; Font.Name := g_sCurFontName; Font.Color := clWhite; MaxLength := 12;
      Visible := FALSE; OnKeyPress := EdNewIdKeyPress; OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdPhone := TEdit.Create (FrmMain.Owner);
   with m_EdPhone do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 116;
      Left := nx + 60;
      Top  := ny + 347;
      BorderStyle := bsNone;
      Color  := ClBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 14;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;
   m_EdMobPhone := TEdit.Create (FrmMain.Owner);
   with m_EdMobPhone do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 116;
      Left := nx + 60;
      Top  := ny + 368;
      BorderStyle := bsNone;
      Color  := ClBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 13;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 11;
   end;

   nX := (g_FScreenWidth - 800) div 2 + 189;
   nY := (g_FScreenHeight - 600) div 2 + 149;
   m_EdChgId := TEdit.Create (FrmMain.Owner);
   with m_EdChgId do begin           //ÆÐ½º¿öµå
      Parent := FrmMain;
      Height := 14;
      Width  := 134;
      Left := nx+193;
      Top  := ny+108;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgCurrentpw := TEdit.Create (FrmMain.Owner);
   with m_EdChgCurrentpw do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 134;
      Left := nx+193;
      Top  := ny+129;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgNewPw := TEdit.Create (FrmMain.Owner);
   with m_EdChgNewPw do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 134;
      Left := nx+193;
      Top  := ny+150;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
   m_EdChgRepeat := TEdit.Create (FrmMain.Owner);
   with m_EdChgRepeat do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 134;
      Left := nx+193;
      Top  := ny+171;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      MaxLength := 10;
      PasswordChar := '*';
      Visible := FALSE;
      OnKeyPress := EdNewIdKeyPress;
      OnEnter := EdNewOnEnter;
      Tag := 12;
   end;
end;

destructor TLoginScene.Destroy;
begin
   inherited Destroy;
end;
//¾ÆÀÌµð ÆÐ½º¿öµå ÀÔ·ÂºÎºÐ     ·Î±×ÀÎ
procedure TLoginScene.OpenScene;
var
   i: integer;
   d: TDirectDrawSurface;
begin
  // if FileExists ('.\Music\' + IntToStr(1) + '.mp3') then begin
  //   ClearBGM;
  //   ClearBGMEx;
  //   PlayBGM2('.\Music\' + IntToStr(1) + '.mp3');
  if not g_InterfaceMode then begin
    PlayBGM (bmg_intro);
  end else begin
    PlayBGM (bmg_Newintro);
  end;
  // end else begin
  //   PlayBGM (bmg_intro);
  // end;
   m_nCurFrame := 0;
   m_nMaxFrame := 19;

   m_nCurFrame1 := 0;
   m_nCurFrame2 := 0;
   m_nCurFrame3 := 0;
   m_nCurFrame4 := 0;
   m_nCurFrame5 := 0;
   m_nMaxFrame := 19;

   m_sLoginId := '';
   m_sLoginPasswd := '';
   if not g_InterfaceMode then begin
   with m_EdId do begin
      Left   := (g_FScreenWidth - 800) div 2 + 323; //g_FScreenWidth div 2 - 77;
      Top    := (g_FScreenHeight - 600) div 2 + 276; //g_FScreenHeight div 2  - 24;
      Height := 14;
      Width  := 135;
      Visible := FALSE;
   end;
   with m_EdPasswd do begin
      Left   := (g_FScreenWidth - 800) div 2 + 323; //g_FScreenWidth div 2 - 77;
      Top    := (g_FScreenHeight - 600) div 2 + 299;//g_FScreenHeight div 2  - 1;
      Height := 14;
      Width  := 135;
      Visible := FALSE;
   end;
   FrmDlg2.DInputKey.Visible := True;
   end else begin
   with m_EdId do begin
      Left   := (g_FScreenWidth - 800) div 2 + 340; //g_FScreenWidth div 2 - 77;
      Top    := (g_FScreenHeight - 600) div 2 + 215; //g_FScreenHeight div 2  - 24;
      Height := 14;
      Width  := 135;
      Visible := FALSE;
   end;
   with m_EdPasswd do begin
      Left   := (g_FScreenWidth - 800) div 2 + 340; //g_FScreenWidth div 2 - 77;
      Top    := (g_FScreenHeight - 600) div 2 + 295;//g_FScreenHeight div 2  - 1;
      Height := 14;
      Width  := 135;
      Visible := FALSE;
   end;
   FrmDlg2.DInputKey.Visible := FALSE;
   end;
   m_boOpenFirst := TRUE;
   FrmDlg.DLogin.Visible := TRUE;
   FrmDlg.DNewAccount.Visible := FALSE;
   m_boNowOpening := FALSE;
end;


procedure TLoginScene.CloseScene;
begin
   m_EdId.Visible := FALSE;
   m_EdPasswd.Visible := FALSE;
   FrmDlg2.DInputKey.Visible := FALSE;
   FrmDlg.DLogin.Visible := FALSE;
   Append2Tick := 0;
   m_dwStartTime := 0;
   m_dwStartTime1 := 0;
   m_dwStartTime2 := 0;
   m_dwStartTime3 := 0;
   m_dwStartTime4 := 0;
   SilenceSound;
end;

procedure TLoginScene.EdLoginIdKeyPress (Sender: TObject; var Key: Char);
begin
   if Key = #13 then begin
      Key := #0;
      m_sLoginId := LowerCase(m_EdId.Text);
      if m_sLoginId <> '' then begin
         m_EdPasswd.SetFocus;
      end;
   end;
end;

procedure TLoginScene.EdLoginPasswdKeyPress (Sender: TObject; var Key: Char);
begin
   if (Key = '~') or (Key = '''') then Key := '_';
   if Key = #13 then begin
      Key := #0;
      m_sLoginId := LowerCase(m_EdId.Text);
      m_sLoginPasswd := m_EdPasswd.Text;
      if (m_sLoginId <> '') and (m_sLoginPasswd <> '') then begin
         //°èÁ¤À¸·Î ·Î±×ÀÎ ÇÑ´Ù.
         FrmMain.SendLogin (m_sLoginId, m_sLoginPasswd);
         m_EdId.Text := '';
         m_EdPasswd.Text := '';
         m_EdId.Visible := FALSE;
         m_EdPasswd.Visible := FALSE;
      end else
         if (m_EdId.Visible) and (m_EdId.Text = '') then m_EdId.SetFocus;
   end;
   frmMain.Timer5Process.Enabled := True;   //¼öÁ¤µÇ¾ú½À´Ï´Ù.
end;

procedure TLoginScene.PassWdFail;
begin
   m_EdId.Visible := TRUE;
   m_EdPasswd.Visible := TRUE;
   m_EdId.SetFocus;
end;


function  TLoginScene.NewIdCheckNewId: Boolean;
begin
   Result := TRUE;
   m_EdNewId.Text := Trim(m_EdNewId.Text);
   if Length(m_EdNewId.Text) < 3 then begin
      FrmDlg.DMessageDlg ('ÕËºÅµÄ³¤¶È×îÉÙÎª4¸ö×Ö·û¡£', [mbOk]);
      Beep;
      m_EdNewId.SetFocus;
      Result := FALSE;
   end;
end;

function  TLoginScene.NewIdCheckBirthDay: Boolean;
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   Result := TRUE;
   flag := TRUE;
   str := m_EdBirthDay.Text;
   str := GetValidStr3 (str, syear, ['/']);
   str := GetValidStr3 (str, smon, ['/']);
   str := GetValidStr3 (str, sday, ['/']);
   ayear := Str_ToInt(syear, 0);
   amon := Str_ToInt(smon, 0);
   aday := Str_ToInt(sday, 0);
   if (ayear <= 1890) or (ayear > 2101) then flag := FALSE;
   if (amon <= 0) or (amon > 12) then flag := FALSE;
   if (aday <= 0) or (aday > 31) then flag := FALSE;
   if not flag then begin
      Beep;
      m_EdBirthDay.SetFocus;
      Result := FALSE;
   end;
end;

procedure TLoginScene.EdNewIdKeyPress (Sender: TObject; var Key: Char);
var
   str, t1, t2, t3, syear, smon, sday: string;
   ayear, amon, aday, sex: integer;
   flag: Boolean;
begin
   if (Sender = m_EdNewPasswd) or (Sender = m_EdChgNewPw) or (Sender = m_EdChgRepeat) then
      if (Key = '~') or (Key = '''') or (Key = ' ') then Key := #0;
   if Key = #13 then begin
      Key := #0;
      if Sender = m_EdNewId then begin
         if not NewIdCheckNewId then
            exit;
      end;
      if Sender = m_EdNewPasswd then begin
         if Length(m_EdNewPasswd.Text) < 4 then begin
            FrmDlg.DMessageDlg ('ÃÜÂëµÄ³¤¶ÈÖÁÉÙÎª4¸ö×Ö·û¡£', [mbOk]);
            Beep;
            m_EdNewPasswd.SetFocus;
            exit;
         end;
      end;
      if Sender = m_EdConfirm then begin
         if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
            FrmDlg.DMessageDlg ('Á½´ÎÊäÈëµÄÃÜÂë²»Ò»ÖÂ£¬ÇëÖØÐÂÊäÈë¡£', [mbOk]);
            Beep;
            m_EdConfirm.SetFocus;
            exit;
         end;
      end;
      if (Sender = m_EdYourName) or (Sender = m_EdQuiz1) or (Sender = m_EdAnswer1) or
         (Sender = m_EdQuiz2) or (Sender = m_EdAnswer2) or (Sender = m_EdPhone) or
         (Sender = m_EdMobPhone) or (Sender = m_EdEMail)
      then begin
         TEdit(Sender).Text := Trim(TEdit(Sender).Text);
         if TEdit(Sender).Text = '' then begin
            Beep;
            TEdit(Sender).SetFocus;
            exit;
         end;
      end;

      if Sender = m_EdBirthDay then begin
         if not NewIdCheckBirthDay then
            exit;
      end;
      if TEdit(Sender).Text <> '' then begin
         if Sender = m_EdNewId then m_EdNewPasswd.SetFocus;
         if Sender = m_EdNewPasswd then m_EdConfirm.SetFocus;
         if Sender = m_EdConfirm then m_EdYourName.SetFocus;
         if Sender = m_EdYourName then m_EdBirthDay.SetFocus;
         if Sender = m_EdBirthDay then m_EdEMail.SetFocus;
         if Sender = m_EdEMail then m_EdQuiz1.SetFocus;
         if Sender = m_EdQuiz1 then m_EdAnswer1.SetFocus;
         if Sender = m_EdAnswer1 then m_EdQuiz2.SetFocus;
         if Sender = m_EdQuiz2 then m_EdAnswer2.SetFocus;
         if Sender = m_EdAnswer2 then m_EdNewId.SetFocus;
       //  if Sender = m_EdPhone then m_EdMobPhone.SetFocus;
       //  if Sender = m_EdMobPhone then m_EdEMail.SetFocus;

         if Sender = m_EdChgId then m_EdChgCurrentpw.SetFocus;
         if Sender = m_EdChgCurrentpw then m_EdChgNewPw.SetFocus;
         if Sender = m_EdChgNewPw then m_EdChgRepeat.SetFocus;
         if Sender = m_EdChgRepeat then m_EdChgId.SetFocus;
      end;
   end;
end;

procedure TLoginScene.EdNewOnEnter (Sender: TObject);
var
   hx, hy: integer;
begin
   hx := TEdit(Sender).Left + TEdit(Sender).Width + 10;
   hy := TEdit(Sender).Top + TEdit(Sender).Height - 18;
end;

procedure TLoginScene.HideLoginBox;
begin
   //EdId.Visible := FALSE;
   //EdPasswd.Visible := FALSE;
   //FrmDlg.DLogin.Visible := FALSE;
   ChangeLoginState (lsCloseAll);
end;

procedure TLoginScene.OpenLoginDoor;
begin
   m_boNowOpening := TRUE;
   m_dwStartTime := GetTickCount;
   HideLoginBox;
   PlaySound (s_rock_door_open);
end;

procedure TLoginScene.PlayScene (MSurface: TDirectDrawSurface);   //ÀÎÆ®·Î
var
   d: TDirectDrawSurface;
   ax, by, bx, cy, gx, gy : Integer;
   idx, len, idx2, len2: integer;
   str, str4: WideString;
   str1, str2, str3, str5, str6, str7: string;
begin
   if m_boOpenFirst then begin
      m_boOpenFirst := FALSE;
      m_EdId.Visible := TRUE;
      m_EdPasswd.Visible := TRUE;
      m_EdId.SetFocus;
   end;
   if not g_InterfaceMode then begin
     d := g_WChrSelImages.Images[0];
     if d <> nil then begin
        MSurface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, FALSE);
     end;
    { with MSurface.Canvas do begin    //¹öÀü
       Font.Name := g_sCurFontName;
       SetBkMode (Handle, TRANSPARENT);
       BoldTextOut (MSurface, 15, g_FScreenHeight - 15, clYellow, clBlack, VerInfoStr2);
       Release;
     end;}
     if m_boNowOpening then begin
     //ChrSel ½ÃÀÛ ºÎºÐ ½Ã°£ Á¶Á¤
       if GetTickCount - m_dwStartTime > 150 then begin
         m_dwStartTime := GetTickCount;
         Inc (m_nCurFrame);
       end;                             //ÆäÀÌµå
       if m_nCurFrame >= m_nMaxFrame-1 then begin
         m_nCurFrame := m_nMaxFrame-1;
         if not g_boDoFadeOut and not g_boDoFadeIn then begin
            g_boDoFadeOut := TRUE;
            g_boDoFadeIn := TRUE;
            g_nFadeIndex := 29;
         end;
       end;
       //¹®¿­¸²
       d := g_WChrSelImages.Images[m_nCurFrame];
       if (d <> nil) then
         MSurface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight- d.Height) div 2, d.ClientRect, d, TRUE);
       if g_boDoFadeOut then begin
         if g_nFadeIndex <= 1 then begin
            g_WMainImages.ClearCache;
            g_WMain2Images.ClearCache;
            g_WMain3Images.ClearCache;
            g_WAresImages.ClearCache;
            g_WChrSelImages.ClearCache;
            g_WTitleImages.ClearCache;
            DScreen.ChangeScene (stSelectChr);
         end;
       end;
     end;
   end else begin

   case g_FScreenMode of
     1: d := g_WNewLoginImages.Images[0];
    else
      d := g_WNewLoginImages.Images[700];
   end;
   if d <> nil then begin
      MSurface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, FALSE);

     str := DecodeString('MESRwevsD\');     //USER ID
     len := length(str);
     bx := (g_FScreenWidth - 800) div 2 + 264;
     cy := (g_FScreenHeight - 600) div 2 + 146;

     str4 := DecodeString('M`JQaOP@w^D');  //PASSWORD
     len2 := length(str4);
     gx := (g_FScreenWidth - 800) div 2 + 264;
     gy := (g_FScreenHeight - 600) div 2 + 226;
     with MSurface.Canvas do begin    //¹öÀü
      {  Font.Name := g_sCurFontName;
        SetBkMode (Handle, TRANSPARENT);
        BoldTextOut (MSurface, 125, 15, clWhite, clBlack, 'Ver '+ VerInfoStr2);
        Release;  }
        if FrmDlg.DLogin.Visible then begin
          SetBkMode (Handle, TRANSPARENT);
          Font.Name := DecodeString('LoelKC?uKSQl'); //'Aparajita';
          Font.Size := 20;
          Font.Style := [fsBold, fsItalic];

          idx := Integer((GetTickCount - Append2Tick) div 400 mod LongWord(len)) ;
          str1 := Copy(str, 1, idx);
          str2 := Copy(str, idx + 1, 1);
          str3 := Copy(str, idx + 2, len);
          cy := cy + 33;
          bx := bx + 136 - TextWidth(str) div 2;
          BoldTextOut (MSurface, bx, cy, clWhite, clBlack, str1);
          bx := bx + TextWidth(str1);
          BoldTextOut (MSurface, bx, cy, clYellow, clBlack, str2);
          bx := bx + TextWidth(str2);
          BoldTextOut (MSurface, bx, cy, clWhite, clBlack, str3);

          idx2 := Integer((GetTickCount - Append2Tick) div 400 mod LongWord(len2)) ;
          str5 := Copy(str4, 1, idx2);
          str6 := Copy(str4, idx2 + 1, 1);
          str7 := Copy(str4, idx2 + 2, len2);
          gy := gy + 33;
          gx := gx + 136 - TextWidth(str4) div 2;
          BoldTextOut (MSurface, gx, gy, clWhite, clBlack, str5);
          gx := gx + TextWidth(str5);
          BoldTextOut (MSurface, gx, gy, clYellow, clBlack, str6);
          gx := gx + TextWidth(str6);
          BoldTextOut (MSurface, gx, gy, clWhite, clBlack, str7);
          Release;
        end;
        Font.Name := g_sCurFontName;
        Font.Size := 9;
        Font.Style := [];
     end;

   end;
   if m_boNowOpening then begin
   //ChrSel ½ÃÀÛ ºÎºÐ ½Ã°£ Á¶Á¤
      if GetTickCount - m_dwStartTime > 100 then begin
         m_dwStartTime := GetTickCount;
         Inc (m_nCurFrame);
      end;                             //ÆäÀÌµå
      if m_nCurFrame >= m_nMaxFrame-1 then begin
         m_nCurFrame := m_nMaxFrame-1;
         if not g_boDoFadeOut and not g_boDoFadeIn then begin
            g_boDoFadeOut := TRUE;
            g_boDoFadeIn := TRUE;
            g_nFadeIndex := 29;
         end;
      end;
      case g_FScreenMode of
        1: d := g_WNewLoginImages.Images[540 + m_nCurFrame];
        else
          d := g_WNewLoginImages.Images[711 + m_nCurFrame];
      end;
      if (d <> nil) then
      case g_FScreenMode of
        1: MSurface.Draw ((g_FScreenWidth - d.Width) div 2 + 4, (g_FScreenHeight- d.Height) div 2 - 59, d.ClientRect, d, TRUE);
        else
         MSurface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight- d.Height) div 2, d.ClientRect, d, TRUE);
      end;

      if g_boDoFadeOut then begin
         if g_nFadeIndex <= 1 then begin
            g_WMainImages.ClearCache;
            g_WMain2Images.ClearCache;
            g_WMain3Images.ClearCache;
            g_WAresImages.ClearCache;
            g_WNewChrSelImages.ClearCache;
            g_WNewLoginImages.ClearCache;
            g_WTitleImages.ClearCache;
            DScreen.ChangeScene (stSelectChr);
         end;
      end;
   end;
   if g_FScreenMode = 1 then begin
     if GetTickCount - m_dwStartTime1 > 100 then begin
       m_dwStartTime1 := GetTickCount;
       Inc (m_nCurFrame1);
     end;
     if m_nCurFrame1 >= 20 - 1 then begin
       m_nCurFrame1 := 0;
     end;
     d := g_WNewLoginImages.Images[310 + m_nCurFrame1];
     if d <> nil then
       DrawBlend(MSurface, -2, -2, d, 1);

     if GetTickCount - m_dwStartTime2 > 100 then begin
       m_dwStartTime2 := GetTickCount;
       Inc (m_nCurFrame2);
     end;
     if m_nCurFrame2 >= 40 - 1 then begin
       m_nCurFrame2 := 0;
     end;
     d := g_WNewLoginImages.GetCachedImage(10 + m_nCurFrame2, ax, by);
     if d <> nil then
     case g_FScreenMode of
       1: DrawBlend(MSurface, ax + 540 + 80, by + 360 + 5, d, 1);
       else
        DrawBlend(MSurface, ax + 540, by + 360, d, 1);
     end;

     if GetTickCount - m_dwStartTime3 > 100 then begin
       m_dwStartTime3 := GetTickCount;
       Inc (m_nCurFrame3);
     end;
     if m_nCurFrame3 >= 40 - 1 then begin
       m_nCurFrame3 := 0;
     end;
     d := g_WNewLoginImages.GetCachedImage(210 + m_nCurFrame3, ax, by);
     if d <> nil then
     case g_FScreenMode of
       1: DrawBlend(MSurface, ax + 460 + 113, by + 390 + 5, d, 1);
       else
        DrawBlend(MSurface, ax + 460, by + 390, d, 1);
     end;

     if GetTickCount - m_dwStartTime4 > 100 then begin
       m_dwStartTime4 := GetTickCount;
       Inc (m_nCurFrame4);
     end;
     if m_nCurFrame4 >= 40 - 1 then begin
       m_nCurFrame4 := 0;
     end;
     d := g_WNewLoginImages.GetCachedImage(260 + m_nCurFrame4, ax, by);
     if d <> nil then
     case g_FScreenMode of
       1: DrawBlend(MSurface, ax + 345 + 113, by + 390 + 5, d, 1);
       else
        DrawBlend(MSurface, ax + 345, by + 390, d, 1);
     end;

     if GetTickCount - m_dwStartTime5 > 100 then begin
       m_dwStartTime5 := GetTickCount;
       Inc (m_nCurFrame5);
     end;
     if m_nCurFrame5 >= 40 - 1 then begin
       m_nCurFrame5 := 0;
     end;
     d := g_WNewLoginImages.GetCachedImage(60 + m_nCurFrame5, ax, by);
     if d <> nil then
     case g_FScreenMode of
       1: DrawBlend(MSurface, ax + 290 + 118, by + 360 + 5, d, 1);
       else
        DrawBlend(MSurface, ax + 290, by + 360, d, 1);
     end;
   end else begin
     if GetTickCount - m_dwStartTime1 > 100 then begin
       m_dwStartTime1 := GetTickCount;
       Inc (m_nCurFrame1);
     end;
     if m_nCurFrame1 >= 15 - 1 then begin
       m_nCurFrame1 := 0;
     end;
     d := g_WNewLoginImages.Images[730 + m_nCurFrame1];
     if d <> nil then
       DrawBlend(MSurface,(g_FScreenWidth - d.Width) div 2, (g_FScreenHeight- d.Height) div 2, d, 1);

   end;

   end;
end;

procedure TLoginScene.ChangeLoginState (state: TLoginState);
var
   i, focus: integer;
   c: TControl;
begin
   focus := -1;
   case state of
      lsLogin: focus := 10;
      lsNewIdRetry, lsNewId: focus := 11;
      lsChgpw: focus := 12;
      lsCloseAll: focus := -1;
   end;
   with FrmMain do begin
      for i:=0 to ControlCount-1 do begin
         c := Controls[i];
         if c is TEdit then begin
            if c.Tag in [10..12] then begin
               if c.Tag = focus then begin
                  c.Visible := TRUE;
                  TEdit(c).Text := '';
               end else begin
                  c.Visible := FALSE;
                  TEdit(c).Text := '';
               end;
            end;
         end;
      end;
      m_EdMobPhone.Visible := False;
      m_EdPhone.Visible := False;

      case state of
         lsLogin:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := TRUE;
               if not g_InterfaceMode then begin
                 FrmDlg2.DInputKey.Visible := TRUE;
               end else begin
                 FrmDlg2.DInputKey.Visible := FALSE;
               end;
               LoginImages := True;
               if m_EdId.Visible then m_EdId.SetFocus;
            end;
         lsNewIdRetry,
         lsNewId:
            begin
               if m_boUpdateAccountMode then
                  m_EdNewId.Enabled := FALSE
               else
                  m_EdNewId.Enabled := TRUE;
               FrmDlg.DNewAccount.Visible := TRUE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := FALSE;
               FrmDlg2.DInputKey.Visible := FALSE;
               LoginImages := False;
               if m_EdNewId.Visible and m_EdNewId.Enabled then begin
                  m_EdNewId.SetFocus;
               end else begin
                  if m_EdConfirm.Visible and m_EdConfirm.Enabled then
                     m_EdConfirm.SetFocus;
               end;
            end;
         lsChgpw:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := TRUE;
               FrmDlg.DLogin.Visible := FALSE;
               FrmDlg2.DInputKey.Visible := FALSE;
               LoginImages := False;
               if m_EdChgId.Visible then m_EdChgId.SetFocus;
            end;
         lsCloseAll:
            begin
               FrmDlg.DNewAccount.Visible := FALSE;
               FrmDlg.DChgPw.Visible := FALSE;
               FrmDlg.DLogin.Visible := FALSE;
               FrmDlg2.DInputKey.Visible := FALSE;
               LoginImages:= False;
            end;
      end;
   end;
end;

procedure TLoginScene.NewClick;
begin
   m_boUpdateAccountMode := FALSE;
   FrmDlg.NewAccountTitle := '';
   ChangeLoginState (lsNewId);
end;

procedure TLoginScene.NewIdRetry (boupdate: Boolean);
begin
   m_boUpdateAccountMode := boupdate;
   ChangeLoginState (lsNewidRetry);
   m_EdNewId.Text     := m_NewIdRetryUE.sAccount;
   m_EdNewPasswd.Text := m_NewIdRetryUE.sPassword;
   m_EdYourName.Text  := m_NewIdRetryUE.sUserName;

   m_EdQuiz1.Text     := m_NewIdRetryUE.sQuiz;
   m_EdAnswer1.Text   := m_NewIdRetryUE.sAnswer;
   m_EdPhone.Text     := m_NewIdRetryUE.sPhone;
   m_EdEMail.Text     := m_NewIdRetryUE.sEMail;
   m_EdQuiz2.Text     := m_NewIdRetryAdd.sQuiz2;
   m_EdAnswer2.Text   := m_NewIdRetryAdd.sAnswer2;
   m_EdMobPhone.Text  := m_NewIdRetryAdd.sMobilePhone;
   m_EdBirthDay.Text  := m_NewIdRetryAdd.sBirthDay;
end;

procedure TLoginScene.UpdateAccountInfos (ue: TUserEntry);
begin
   m_NewIdRetryUE := ue;
   FillChar (m_NewIdRetryAdd, sizeof(TUserEntryAdd), #0);
   m_boUpdateAccountMode := TRUE;
   NewIdRetry (TRUE);
   FrmDlg.NewAccountTitle := '(ÇëÍê³ÉÕÊ»§µÄËùÓÐ±ØÐè×ÊÁÏµÄÌîÐ´)';
end;

procedure TLoginScene.OkClick;
var
   key: char;
begin
   key := #13;
   EdLoginPasswdKeyPress (self, key);
end;

procedure TLoginScene.ChgPwClick;
begin
   ChangeLoginState (lsChgPw);
end;

function  TLoginScene.CheckUserEntrys: Boolean;
begin
   Result := FALSE;
   m_EdNewId.Text := Trim(m_EdNewId.Text);
   m_EdQuiz1.Text := Trim(m_EdQuiz1.Text);
   m_EdYourName.Text := Trim(m_EdYourName.Text);
   if not NewIdCheckNewId then exit;
   if not NewIdCheckBirthday then exit;
   if Length(m_EdNewId.Text) < 3 then begin
      m_EdNewId.SetFocus;
      exit;
   end;
   if Length(m_EdNewPasswd.Text) < 3 then begin
      m_EdNewPasswd.SetFocus;
      exit;
   end;
   if m_EdNewPasswd.Text <> m_EdConfirm.Text then begin
      m_EdConfirm.SetFocus;
      exit;
   end;
   if Length(m_EdQuiz1.Text) < 1 then begin
      m_EdQuiz1.SetFocus;
      exit;
   end;
   if Length(m_EdAnswer1.Text) < 1 then begin
      m_EdAnswer1.SetFocus;
      exit;
   end;
   if Length(m_EdQuiz2.Text) < 1 then begin
      m_EdQuiz2.SetFocus;
      exit;
   end;
   if Length(m_EdAnswer2.Text) < 1 then begin
      m_EdAnswer2.SetFocus;
      exit;
   end;
   if Length(m_EdYourName.Text) < 1 then begin
      m_EdYourName.SetFocus;
      exit;
   end;
   Result := TRUE;
end;

procedure TLoginScene.NewAccountOk;
var
   ue: TUserEntry;
   ua: TUserEntryAdd;
begin
   if CheckUserEntrys then begin
      FillChar (ue, sizeof(TUserEntry), #0);
      FillChar (ua, sizeof(TUserEntryAdd), #0);
      ue.sAccount := LowerCase(m_EdNewId.Text);
      ue.sPassword := m_EdNewPasswd.Text;
      ue.sUserName := m_EdYourName.Text;

      ue.sSSNo := '650101-1455111';

      ue.sQuiz := m_EdQuiz1.Text;
      ue.sAnswer := Trim(m_EdAnswer1.Text);
      ue.sPhone := m_EdPhone.Text;
      ue.sEMail := Trim(m_EdEMail.Text);

      ua.sQuiz2 := m_EdQuiz2.Text;
      ua.sAnswer2 := Trim(m_EdAnswer2.Text);
      ua.sBirthday := m_EdBirthDay.Text;
      ua.sMobilePhone := m_EdMobPhone.Text;

      m_NewIdRetryUE := ue;
      m_NewIdRetryUE.sAccount := '';
      m_NewIdRetryUE.sPassword := '';
      m_NewIdRetryAdd := ua;

      if not m_boUpdateAccountMode then
         FrmMain.SendNewAccount (ue, ua)
      else
         FrmMain.SendUpdateAccount (ue, ua);
      m_boUpdateAccountMode := FALSE;
      NewAccountClose;
   end;
end;

procedure TLoginScene.NewAccountClose;
begin
   if not m_boUpdateAccountMode then
      ChangeLoginState (lsLogin);
end;

procedure TLoginScene.ChgpwOk;
var
   uid, passwd, newpasswd: string;
begin
   if m_EdChgNewPw.Text = m_EdChgRepeat.Text then begin
      uid := m_EdChgId.Text;
      passwd := m_EdChgCurrentpw.Text;
      newpasswd := m_EdChgNewPw.Text;
      FrmMain.SendChgPw (uid, passwd, newpasswd);
      ChgpwCancel;
   end else begin
      FrmDlg.DMessageDlg ('¸ü¸ÄµÄÃÜÂë²»ÄÜÓëÔ­À´ÏàÍ¬¡£', [mbOk]);
      m_EdChgNewPw.SetFocus;
   end;
end;

procedure TLoginScene.ChgpwCancel;
begin
   ChangeLoginState (lsLogin);
end;


{-------------------- TSelectChrScene ------------------------}

constructor TSelectChrScene.Create;
begin

   FillChar (ChrArr, sizeof(TSelChar)*4, #0);
   ChrArr[0].FreezeState := TRUE;             //»õ ÄÉ¸¯ÅÍ
   ChrArr[1].FreezeState := TRUE;
   ChrArr[2].FreezeState := TRUE;
   ChrArr[3].FreezeState := TRUE;
   NewIndex := 0;
   EdChrName := TEdit.Create (FrmMain.Owner);
   with EdChrName do begin
      Parent := FrmMain;
      Height := 14;
      Width  := 175;
      BorderStyle := bsNone;
      Color := clBlack;
      Font.Name := g_sCurFontName;
      Font.Color := clWhite;
      ImeMode := LocalLanguage;
      MaxLength := 14;
      Visible := FALSE;
      OnKeyPress := EdChrnameKeyPress;
   end;
   SoundTimer := TTimer.Create (FrmMain.Owner);
   with SoundTimer do begin
      OnTimer := SoundOnTimer;
      Interval := 1;
      Enabled := FALSE;
   end;
   inherited Create (stSelectChr);
end;

destructor TSelectChrScene.Destroy;
begin
   inherited Destroy;
end;

procedure TSelectChrScene.OpenScene;
begin
  g_WMainImages.ClearCache;
   g_WMain2Images.ClearCache;
   g_WMain3Images.ClearCache;
   g_WAresImages.ClearCache;
   g_WNewChrSelImages.ClearCache;
   g_WNewLoginImages.ClearCache;
   g_WTitleImages.ClearCache;
   m_dwStartTime1 := GetTickCount;
   m_dwStartTime2 := GetTickCount;
   m_dwStartTime3 := GetTickCount;
   m_dwStartTime4 := GetTickCount;
   m_dwStartTime5 := GetTickCount;
   m_dwStartTime6 := GetTickCount;
   m_nCurFrame1 := 0;
   m_nCurFrame2 := 0;
   m_nCurFrame3 := 0;
   m_nCurFrame4 := 0;
   m_nCurFrame5 := 0;
   m_nCurFrame6 := 0;
   FrmDlg.DSelectChr.Visible := TRUE;
   SoundTimer.Enabled := TRUE;
   SoundTimer.Interval := 1;
   m_boNowLoading := FALSE;
   ChangeSelectChrState(scSelectChr);
   frmMain.QueryRogueEnabled;
end;

procedure TSelectChrScene.CloseScene;
begin
   SilenceSound;
   m_dwStartTime1 := 0;
   m_dwStartTime2 := 0;
   m_dwStartTime3 := 0;
   m_dwStartTime4 := 0;
   m_dwStartTime5 := 0;
   m_dwStartTime6 := 0;
   m_LoadingTime := 0;
   m_nCurFrame1 := 0;
   m_nCurFrame2 := 0;
   m_nCurFrame3 := 0;
   m_nCurFrame4 := 0;
   m_nCurFrame5 := 0;
   m_nCurFrame6 := 0;
//   m_boNowLoading := FALSE;
   FrmDlg.DSelectChr.Visible := FALSE;
   FrmDlg.DRenewChr.Visible := FALSE;
   SoundTimer.Enabled := FALSE;
end;

procedure TSelectChrScene.SoundOnTimer (Sender: TObject);
begin
  //if FileExists ('.\Music\' + IntToStr(3) + '.mp3') then begin
  ClearBGM;
  ClearBGMEx;
 //PlayBGM2('.\Music\' + IntToStr(3) + '.mp3');
  if not g_InterfaceMode then begin
    PlayBGM (bmg_select);
  end else begin
    PlayBGM (bmg_Nesselect);
  end;
 // end else begin
 //   PlayBGM (bmg_select);
 // end;
  SoundTimer.Enabled := FALSE;
  SoundTimer.Interval := 38 * 1000;
end;

procedure TSelectChrScene.SelChrSound(job, sex: Byte);
begin
 if not g_InterfaceMode then begin
   PlaySound (s_meltstone);
 end else begin
   case job of
     0, 5 : begin
       if sex = 0 then PlaySound2(WarMSel)
       else PlaySound2(WarFSel);
     end;
     1, 6 : begin
       if sex = 0 then PlaySound2(WizMSel)
       else PlaySound2(WizFSel);
     end;
     2, 7 : begin
       if sex = 0 then PlaySound2(TaoMSel)
       else PlaySound2(TaoFSel);
     end;
     3, 8 : begin
       if sex = 0 then PlaySound2(AssMSel)
       else PlaySound2(AssFSel);
     end;
     4, 9 : begin
       PlaySound2 (BonFSel);
     end;
   end;
 end;
end;

procedure TSelectChrScene.SelChrSelect1Click;
begin
   if (not ChrArr[0].Selected) and (ChrArr[0].Valid) then begin
      FrmMain.SelectChr(ChrArr[0].UserChr.Name);
      ChrArr[0].Selected := TRUE;
      ChrArr[1].Selected := FALSE;
      ChrArr[2].Selected := FALSE;
      ChrArr[3].Selected := FALSE;
      ChrArr[0].Unfreezing := TRUE;
      ChrArr[0].AniIndex := 0;
      ChrArr[0].DarkLevel := 30;
      ChrArr[0].EffIndex := 0;
      ChrArr[0].StartTime := GetTickCount;
      ChrArr[0].MoreTime := GetTickCount;
      SelChrSound(ChrArr[0].UserChr.Job, ChrArr[0].UserChr.Sex);
   end;
end;

procedure TSelectChrScene.SelChrSelect2Click;
begin
   if (not ChrArr[1].Selected) and (ChrArr[1].Valid) then begin
      FrmMain.SelectChr(ChrArr[1].UserChr.Name);
      ChrArr[1].Selected := TRUE;
      ChrArr[0].Selected := FALSE;
      ChrArr[2].Selected := FALSE;
      ChrArr[3].Selected := FALSE;
      ChrArr[1].Unfreezing := TRUE;
      ChrArr[1].AniIndex := 0;
      ChrArr[1].DarkLevel := 30;
      ChrArr[1].EffIndex := 0;
      ChrArr[1].StartTime := GetTickCount;
      ChrArr[1].MoreTime := GetTickCount;
      SelChrSound(ChrArr[1].UserChr.Job, ChrArr[1].UserChr.Sex);
   end;
end;

procedure TSelectChrScene.SelChrSelect3Click;
begin
   if (not ChrArr[2].Selected) and (ChrArr[2].Valid) then begin
      FrmMain.SelectChr(ChrArr[2].UserChr.Name);
      ChrArr[2].Selected := TRUE;
      ChrArr[0].Selected := FALSE;
      ChrArr[1].Selected := FALSE;
      ChrArr[3].Selected := FALSE;
      ChrArr[2].Unfreezing := TRUE;
      ChrArr[2].AniIndex := 0;
      ChrArr[2].DarkLevel := 30;
      ChrArr[2].EffIndex := 0;
      ChrArr[2].StartTime := GetTickCount;
      ChrArr[2].MoreTime := GetTickCount;
      SelChrSound(ChrArr[2].UserChr.Job, ChrArr[2].UserChr.Sex);
   end;
end;

procedure TSelectChrScene.SelChrSelect4Click;
begin
   if (not ChrArr[3].Selected) and (ChrArr[3].Valid) then begin
      FrmMain.SelectChr(ChrArr[3].UserChr.Name);
      ChrArr[3].Selected := TRUE;
      ChrArr[0].Selected := FALSE;
      ChrArr[1].Selected := FALSE;
      ChrArr[2].Selected := FALSE;
      ChrArr[3].Unfreezing := TRUE;
      ChrArr[3].AniIndex := 0;
      ChrArr[3].DarkLevel := 30;
      ChrArr[3].EffIndex := 0;
      ChrArr[3].StartTime := GetTickCount;
      ChrArr[3].MoreTime := GetTickCount;
      SelChrSound(ChrArr[3].UserChr.Job, ChrArr[3].UserChr.Sex);
   end;
end;

procedure TSelectChrScene.SelChrStartClick;
var
  chrname,Msg: string;
begin
   chrname := '';
   if ChrArr[0].Valid and ChrArr[0].Selected then chrname := ChrArr[0].UserChr.Name;
   if ChrArr[1].Valid and ChrArr[1].Selected then chrname := ChrArr[1].UserChr.Name;
   if ChrArr[2].Valid and ChrArr[2].Selected then chrname := ChrArr[2].UserChr.Name;
   if ChrArr[3].Valid and ChrArr[3].Selected then chrname := ChrArr[3].UserChr.Name;
   if chrname <> '' then begin
     SelectChrScene.OpenLoading;
     FrmDlg.DSelectChr.Visible := FALSE;
     FrmMain.SendSelChr (chrname);
   end else
      FrmDlg.DMessageDlg ('Ê×ÏÈ£¬ÄãÒª´´½¨Ò»¸öÐÂ½ÇÉ«£¬\µã»÷ <ÐÂ½¨½ÇÉ«> °´Å¥´´½¨ÐÂ½ÇÉ«¡£', [mbOk]);
end;

procedure TSelectChrScene.SelChrNewChrClick;
begin
   if not ChrArr[0].Valid or not ChrArr[1].Valid or not ChrArr[2].Valid or not ChrArr[3].Valid then begin
      if not ChrArr[0].Valid then MakeNewChar(0)
      else if not ChrArr[1].Valid then MakeNewChar(1)
      else if not ChrArr[2].Valid then MakeNewChar(2)
   else MakeNewChar(3);
   end else
      FrmDlg.DMessageDlg ('Ã¿¸öÕËºÅ×î¶àÖ»ÄÜ´´½¨4¸ö½ÇÉ«¡£', [mbOk]);
end;

procedure TSelectChrScene.SelChrEraseChrClick;
var
   n: integer;
begin
   n := 0;
   if ChrArr[0].Valid and ChrArr[0].Selected then n := 0;                     
   if ChrArr[1].Valid and ChrArr[1].Selected then n := 1;
   if ChrArr[2].Valid and ChrArr[2].Selected then n := 2;
   if ChrArr[3].Valid and ChrArr[3].Selected then n := 3;
   if (ChrArr[n].Valid) and (ChrArr[n].UserChr.Name <> '') then begin       //½Å±Ô ÀÎÅÍÆäÀÌ½º
      if mrYes = FrmDlg.DMessageDlg ('ÄãÈ·¶¨ÒªÉ¾³ý "' + ChrArr[n].UserChr.Name + '" Õâ¸ö½ÇÉ«Âð£¿\'+
         'É¾³ýºó£¬Äã½«²»ÄÜÊ¹ÓÃÏàÍ¬µÄ½ÇÉ«Ãû×Ö´´½¨½ÇÉ«¡£\'+
         'Äã¿ÉÒÔÊ¹ÓÃ»Ö¸´É¾³ý°´Å¥»Ö¸´±»É¾³ýµÄ½ÇÉ«£¬µ«ÊÇ\'+
         '±»ÓÀ¾ÃÉ¾³ýµÄ³ýÍâ¡£\'+
         'ÄãÈ·¶¨ÒªÉ¾³ýËüÂð£¿',
         [mbYes, mbNo]) then
         FrmMain.SendDelChr (ChrArr[n].UserChr.Name);
   end;
end;

procedure TSelectChrScene.SelChrCreditsClick;
begin
  if FrmDlg.DRenewChr.Visible then Exit;
  if (not ChrArr[0].Valid) or (not ChrArr[1].Valid) or (not ChrArr[2].Valid) or (not ChrArr[3].Valid) then begin
    FrmMain.SendViewDelHum;
  end else
    FrmDlg.DMessageDlg('ÄãÒÑ¾­´æÔÚ4¸ö½ÇÉ«£¬Èç¹û»Ö¸´É¾³ýµÄ½ÇÉ«ÇëÉ¾³ýÒ»¸öÒÑÓÐµÄ½ÇÉ«¡£', [mbOk]);
end;
                      //Back ºÎºÐ (º»¼· ¼­¹ö¼±ÅÃ)   ¼­¹ö»ª
procedure TSelectChrScene.SelChrExitClick;
begin
   FrmMain.Close;
end;

procedure TSelectChrScene.ClearChrs;
begin
   FillChar (ChrArr, sizeof(TSelChar)*4, #0);
   ChrArr[0].FreezeState := FALSE;
   ChrArr[1].FreezeState := TRUE;
   ChrArr[2].FreezeState := TRUE;
   ChrArr[3].FreezeState := TRUE;
   ChrArr[0].Selected := TRUE;
   ChrArr[1].Selected := FALSE;
   ChrArr[2].Selected := FALSE;
   ChrArr[3].Selected := FALSE;
   ChrArr[0].UserChr.Name := '';
   ChrArr[1].UserChr.Name := '';
   ChrArr[2].UserChr.Name := '';
   ChrArr[3].UserChr.Name := '';
end;

procedure TSelectChrScene.AddChr (uname: string; job, hair, level, sex: integer; login:String);
var
   n: integer;
begin
   if not ChrArr[0].Valid then n := 0
   else if not ChrArr[1].Valid then n := 1
   else if not ChrArr[2].Valid then n := 2
   else if not ChrArr[3].Valid then n := 3
   else exit;
   ChrArr[n].UserChr.Name := uname;
   ChrArr[n].UserChr.Job := job;
   ChrArr[n].UserChr.Hair := hair;
   ChrArr[n].UserChr.Level := level;
   ChrArr[n].UserChr.Sex := sex;
   ChrArr[n].UserChr.Login := login;
   ChrArr[n].Valid := TRUE;

end;

procedure TSelectChrScene.MakeNewChar (index: integer);
begin                           //»õ Ä³¸¯ÅÍ »ý¼º ºÎºÐ
   ChangeSelectChrState(scCreateChr);
   NewIndex := index;
   if g_nRogueEnabled = 1 then
    FrmDlg.DccBonze.Visible := True;

   FrmDlg.DCreateChr.Visible := TRUE;
   ChrArr[NewIndex].Valid := TRUE;
   ChrArr[NewIndex].FreezeState := False;
   if not g_InterfaceMode then begin
     FrmDlg.DCreateChr.Left := GetScreenX((SCREENWIDTH - FrmDlg.DCreateChr.Width) div 2);
     FrmDlg.DCreateChr.Top := GetScreenY2((SCREENHEIGHT - FrmDlg.DCreateChr.Height) div 2);
     EdChrName.Left := FrmDlg.DCreateChr.Left + 360;
     EdChrName.Top  := FrmDlg.DCreateChr.Top + 270;
   end else begin
     if g_FScreenWidth = 1024 then begin
       FrmDlg.DCreateChr.Left := (g_FScreenWidth - FrmDlg.DCreateChr.Width) - 100;
     end else begin
       FrmDlg.DCreateChr.Left := (g_FScreenWidth - FrmDlg.DCreateChr.Width) - 20;
     end;
     FrmDlg.DCreateChr.Top := (g_FScreenHeight - FrmDlg.DCreateChr.Height) div 2;
     EdChrName.Left := FrmDlg.DCreateChr.Left + 55;
     EdChrName.Top  := FrmDlg.DCreateChr.Top + 358;
   end;
   EdChrName.Visible := TRUE;
   EdChrName.SetFocus;
   SelectChr (NewIndex);
   FillChar (ChrArr[NewIndex].UserChr, sizeof(TUserCharacterInfo), #0);
   if ChrArr[NewIndex].UserChr.Job = 4 then ChrArr[NewIndex].UserChr.Hair := 0 //½Â·Á Çì¾î°¡ ¾ø´Ù ´ë¸Ó¸®
   else ChrArr[NewIndex].UserChr.Hair := Random(9);
end;

procedure TSelectChrScene.EdChrnameKeyPress (Sender: TObject; var Key: Char);
begin

end;

procedure TSelectChrScene.ChangeSelectChrState(State: TSelectChrState);
begin

  CreateChrMode := False;

  case State of
    scSelectChr: begin
        CreateChrMode := False;
        FrmDlg.DSelectChr.Visible := True;
        FrmDlg.DCreateChr.Visible := False;
        FrmDlg.DRenewChr.Visible := False;
      end;
    scCreateChr: begin
        FrmDlg.DRenewChr.Visible := False;
        FrmDlg.DSelectChr.Visible := True;
        FrmDlg.DCreateChr.Visible := True;
      end;
    scRenewChr: begin
        FrmDlg.DSelectChr.Visible := False;
        FrmDlg.DCreateChr.Visible := False;
        FrmDlg.DRenewChr.Visible := True;
      end;
  end;
  if State =  scCreateChr then begin
    FrmDlg.DscSelect1.Visible := False;
    FrmDlg.DscSelect2.Visible := False;
    FrmDlg.DscSelect3.Visible := False;
    FrmDlg.DscSelect4.Visible := False;
    FrmDlg.DscStart.Visible := False;
    FrmDlg.DscNewChr.Visible := False;
    FrmDlg.DscEraseChr.Visible := False;
    FrmDlg.DscCredits.Visible := False;
    FrmDlg.DscExit.Visible := False;
  end else begin
  FrmDlg.DscSelect1.Visible := not CreateChrMode;
  FrmDlg.DscSelect2.Visible := not CreateChrMode;
  FrmDlg.DscSelect3.Visible := not CreateChrMode;
  FrmDlg.DscSelect4.Visible := not CreateChrMode;
  FrmDlg.DscStart.Visible := not CreateChrMode;
  FrmDlg.DscNewChr.Visible := not CreateChrMode;
  FrmDlg.DscEraseChr.Visible := not CreateChrMode;
  FrmDlg.DscCredits.Visible := not CreateChrMode;
  FrmDlg.DscExit.Visible := not CreateChrMode;
  end;
end;

procedure TSelectChrScene.SelectChr (index: integer);
begin
   ChrArr[index].Selected := TRUE;
   ChrArr[Index].Unfreezing := True;
   ChrArr[Index].AniIndex := 0;
   ChrArr[index].DarkLevel := 30;
   ChrArr[index].StartTime := GetTickCount;
   ChrArr[index].Moretime := GetTickCount;
   SelChrSound(ChrArr[index].UserChr.Job, ChrArr[index].UserChr.Sex);

   ChrArr[0].Selected := (index = 0);
   ChrArr[1].Selected := (index = 1);
   ChrArr[2].Selected := (index = 2);
   ChrArr[3].Selected := (index = 3);
end;

procedure TSelectChrScene.SelChrNewClose;
begin
   ChrArr[NewIndex].Valid := FALSE;
   FrmDlg.DCreateChr.Visible := FALSE;
   EdChrName.Visible := FALSE;

   ChrArr[0].Selected := TRUE;
   ChrArr[0].FreezeState := FALSE;
   ChangeSelectChrState(scSelectChr);
end;

procedure TSelectChrScene.SelChrNewOk;
var
   chrname, shair, sjob, ssex: string;
begin
   chrname := Trim(EdChrName.Text);
   if chrname <> '' then begin
      ChrArr[NewIndex].Valid := FALSE;
      FrmDlg.DCreateChr.Visible := FALSE;
      EdChrName.Visible := FALSE;

      ChrArr[0].Selected := TRUE;
      ChrArr[0].FreezeState := FALSE;

      shair := IntToStr(ChrArr[NewIndex].UserChr.Hair);
      sjob  := IntToStr(ChrArr[NewIndex].UserChr.Job);
      ssex  := IntToStr(ChrArr[NewIndex].UserChr.Sex);
      FrmMain.SendNewChr (FrmMain.LoginId, chrname, shair, sjob, ssex);

      ChangeSelectChrState(scSelectChr);
   end;
end;

procedure TSelectChrScene.SelRenewChr;
begin
  if (FrmDlg.RenewChrIdx - 1) in [Low(RenewChr)..high(RenewChr)] then begin
    FrmMain.SendRenewHum(RenewChr[FrmDlg.RenewChrIdx - 1].Name);
  end;
end;


procedure TSelectChrScene.SelChrNewJob (job: integer);
begin
   if (job in [0..4]) and (ChrArr[NewIndex].UserChr.Job <> job) then begin
      ChrArr[NewIndex].UserChr.Job := job;
      if ChrArr[NewIndex].UserChr.Job = 4 then begin
         ChrArr[NewIndex].UserChr.Hair := 0;  //½Â·Á Çì¾î°¡ ¾ø´Ù.
         ChrArr[NewIndex].UserChr.sex := 0;
      end;
      SelectChr (NewIndex);
   end;
end;

procedure TSelectChrScene.SelChrNewm_btSex (sex: integer);
begin
   if (sex <> ChrArr[NewIndex].UserChr.Sex) and (ChrArr[NewIndex].UserChr.job <> 4)  then begin
      ChrArr[NewIndex].UserChr.Sex := sex;
      SelectChr (NewIndex);
   end;
end;

procedure TSelectChrScene.SelChrHair(Hair: Integer);
begin
  if (Hair in [0..9]) and (ChrArr[NewIndex].UserChr.Hair <> Hair) then begin
    if ChrArr[NewIndex].UserChr.Job = 4 then //½Â·Á´Â Çì¾î°¡ ¾ø´Ù.     ´ë¸Ó¸®
      ChrArr[NewIndex].UserChr.Hair := 0
    else ChrArr[NewIndex].UserChr.Hair := Hair;
  end;
end;

procedure TSelectChrScene.OpenLoading;
begin
   m_boNowLoading := TRUE;
   m_LoadingWaitTime := GetTickCount;
   m_LoadingTime := GetTickCount;
   HideSelectChrBox;
   LoadHelp1;
   LoadHelp2;
   startTime := now; //°æ°ú½Ã°£
end;

procedure TSelectChrScene.LoadHelp1;
var
  indexHelp1: Integer;
begin
  Randomize;
  indexHelp1 := Random(25);
  if m_boNowLoading then begin
    case indexHelp1 of
      0: begin
          Help1 := 0;
          exit;
        end;
      1: begin
          Help1 := 1;
          exit;
        end;
      2: begin
          Help1 := 2;
          exit;
        end;
      3: begin
          Help1 := 3;
          exit;
        end;
      4: begin
          Help1 := 4;
          exit;
        end;
      5: begin
          Help1 := 5;
          exit;
        end;
      6: begin
          Help1 := 6;
          exit;
        end;
      7: begin
          Help1 := 7;
          exit;
        end;
      8: begin
          Help1 := 8;
          exit;
        end;
      9: begin
          Help1 := 9;
          exit;
        end;
      10: begin
          Help1 := 10;
          exit;
        end;
      11: begin
          Help1 := 11;
          exit;
        end;
      12: begin
          Help1 := 12;
          exit;
        end;
      13: begin
          Help1 := 13;
          exit;
        end;
      14: begin
          Help1 := 14;
          exit;
        end;
    end;
  end;
end;

procedure TSelectChrScene.LoadHelp2;
var
  indexHelp2: Integer;
begin
  Randomize;
  indexHelp2 := Random(29);
  if m_boNowLoading then begin
    case indexHelp2 of
      0: begin
          Help2 := 0;
          exit;
        end;
      1: begin
          Help2 := 1;
          exit;
        end;
      2: begin
          Help2 := 2;
          exit;
        end;
      3: begin
          Help2 := 3;
          exit;
        end;
      4: begin
          Help2 := 4;
          exit;
        end;
      5: begin
          Help2 := 5;
          exit;
        end;
      6: begin
          Help2 := 6;
          exit;
        end;
      7: begin
          Help2 := 7;
          exit;
        end;
      8: begin
          Help2 := 8;
          exit;
        end;
      9: begin
          Help2 := 9;
          exit;
        end;
      10: begin
          Help2 := 10;
          exit;
        end;
      11: begin
          Help2 := 11;
          exit;
        end;
      12: begin
          Help2 := 12;
          exit;
        end;
      13: begin
          Help2 := 13;
          exit;
        end;
      14: begin
          Help2 := 14;
          exit;
        end;
      15: begin
          Help2 := 15;
          exit;
        end;
      16: begin
          Help2 := 16;
          exit;
        end;
      17: begin
          Help2 := 17;
          exit;
        end;
      18: begin
          Help2 := 18;
          exit;
        end;
      19: begin
          Help2 := 19;
          exit;
        end;
      20: begin
          Help2 := 20;
          exit;
        end;
      21: begin
          Help2 := 21;
          exit;
        end;
      22: begin
          Help2 := 22;
          exit;
        end;
      23: begin
          Help2 := 23;
          exit;
        end;
      24: begin
          Help2 := 24;
          exit;
        end;
      25: begin
          Help2 := 25;
          exit;
        end;
      26: begin
          Help2 := 26;
          exit;
        end;
      27: begin
          Help2 := 27;
          exit;
        end;
      28: begin
          Help2 := 28;
          exit;
        end;
    end;
  end;
end;


procedure TSelectChrScene.HideSelectChrBox;
begin
  m_nCurFrame := 0;
  m_nMaxFrame := 10;
  Randomize;
  if m_boNowLoading then begin
    Numbert := 0 + Random(10);
    exit;
  end;
  if not g_boDoFadeOut and not g_boDoFadeIn then begin
     g_boDoFastFadeOut := TRUE;
     g_nFadeIndex := 29;
     m_boNowLoading := FALSE;
  end;
end;

procedure TSelectChrScene.PlayScene (MSurface: TDirectDrawSurface);
var
   n, bx, by, fx, fy, img: integer;
   d, e, f, g, dd , h , s: TDirectDrawSurface;
   ax, ay, cx, cy, ex, ey, sx, sy: integer;
   len, tx, ty, idx: integer;
   nJob: integer;
   svername, str1, str2, str3: string;
begin
   bx:=0;
   by:=0;
   fx:=0;
   fy:=0;
   nJob := 0;
 if not g_InterfaceMode then begin
   d := g_WMainImages.Images[64];
   h := g_WTitleImages.Images[40];
   //ÄÉ¸¯ÅÍ ¼±ÅÃÃ¢ ºÎºÐ
   if d <> nil then begin
     MSurface.Draw ((g_FScreenWidth - d.Width) div 2,(g_FScreenHeight - d.Height) div 2, d.ClientRect, d, FALSE);
     if h <> nil then
      MSurface.Draw ((g_FScreenWidth - h.Width) div 2,GetScreenY2(7), h.ClientRect, h, FALSE);
   end;
   if CreateChrMode then exit;
   svername := g_sServerName;
   with MSurface.Canvas do begin
     SetBkMode (Handle, TRANSPARENT);
    //BoldTextOut (MSurface, 15, g_FScreenHeight - 15, clYellow, clBlack, VerInfoStr2);
     BoldTextOut (MSurface, g_FScreenWidth div 2 - TextWidth(svername) div 2, GetScreenY2(48), clWhite, clBlack, svername);
     Release;
   end;

   for n:=0 to 3 do begin
    if (not ChrArr[n].Valid) and (not m_boNowLoading) then begin
      d := g_WMainImages.Images[44];
      cx := 447;
      case n of
        0: cy := 122;
        1: cy := 226;
        2: cy := 330;
        3: cy := 434;
      end;
      MSurface.Draw (GetScreenX(cx),GetScreenY2(cy), d.ClientRect, d, FALSE);
    end;
    if (not m_boNowLoading) then begin
      if (ChrArr[n].Valid) then begin
        case ChrArr[n].UserChr.Job of
          0,5: d := g_WTitleImages.Images[660];
          1,6: d := g_WTitleImages.Images[661];
          2,7: d := g_WTitleImages.Images[662];
          3,8: d := g_WTitleImages.Images[663];
          4,9: d := g_WAresImages.Images[490];
        end;
        cx := 447;
        case n of
          0: cy := 122;
          1: cy := 226;
          2: cy := 330;
          3: cy := 434;
        end;
      end;
      MSurface.Draw (GetScreenX(cx),GetScreenY2(cy), d.ClientRect, d, FALSE);
    end;
    if (ChrArr[n].Valid) and (ChrArr[n].selected) then begin
      case ChrArr[n].UserChr.Job of
        0,5: d := g_WTitleImages.Images[665];
        1,6: d := g_WTitleImages.Images[666];
        2,7: d := g_WTitleImages.Images[667];
        3,8: d := g_WTitleImages.Images[668];
        4,9: d := g_WAresImages.Images[491];
      end;
      if (not m_boNowLoading) then begin
        cx := 447;
        case n of
          0: cy := 122;
          1: cy := 226;
          2: cy := 330;
          3: cy := 434;
        end;
      end;
      MSurface.Draw (GetScreenX(cx),GetScreenY2(cy), d.ClientRect, d, FALSE);
    end;

    if (ChrArr[n].Valid) then begin
      with MSurface do begin
        if (not m_boNowLoading) then begin
          SetBkMode (Canvas.Handle, TRANSPARENT);
          case n of
            0: begin
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(135), clWhite, clBlack, ChrArr[0].UserChr.Name);
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(154), clWhite, clBlack, IntToStr(ChrArr[0].UserChr.Level));
              BoldTextOut (MSurface, GetScreenX(642), GetScreenY2(154), clWhite, clBlack, GetJobName(ChrArr[0].UserChr.Job));
            end;
            1: begin
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(239), clWhite, clBlack, ChrArr[1].UserChr.Name);
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(258), clWhite, clBlack, IntToStr(ChrArr[1].UserChr.Level));
              BoldTextOut (MSurface, GetScreenX(642), GetScreenY2(258), clWhite, clBlack, GetJobName(ChrArr[1].UserChr.Job));
            end;
            2: begin
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(343), clWhite, clBlack, ChrArr[2].UserChr.Name);
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(362), clWhite, clBlack, IntToStr(ChrArr[2].UserChr.Level));
              BoldTextOut (MSurface, GetScreenX(642), GetScreenY2(362), clWhite, clBlack, GetJobName(ChrArr[2].UserChr.Job));
            end;
            3: begin
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(447), clWhite, clBlack, ChrArr[3].UserChr.Name);
              BoldTextOut (MSurface, GetScreenX(566), GetScreenY2(466), clWhite, clBlack, IntToStr(ChrArr[3].UserChr.Level));
              BoldTextOut (MSurface, GetScreenX(642), GetScreenY2(466), clWhite, clBlack, GetJobName(ChrArr[3].UserChr.Job));
            end;
          end;
        end;
        Canvas.Release;
      end;
    end;

    if (ChrArr[n].Selected) and (chrArr[n].Valid) then begin
      ex := (SCREENWIDTH - 800) div 2 + 90;
      ey := (SCREENHEIGHT - 600) div 2 + 58;
      case ChrArr[n].UserChr.Job of
        0: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end;
        end;
        1: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 170;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end;
        end;
        2: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end;
        end;
        3: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 170;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end;
        end;
        4, 9: begin  //½Â·Á
            bx := (SCREENWIDTH - 800) div 2 + 208;
            by := (SCREENHEIGHT - 600) div 2 + 225;
            fx := bx;
            fy := by;
        end;

        5: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 305;
            fx := bx;
            fy := by;
          end;
        end;
        6: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 155;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 190;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end;
        end;
        7: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 188;
            by := (SCREENHEIGHT - 600) div 2 + 285;
            fx := bx;
            fy := by;
          end;
        end;
        8: begin
          if ChrArr[n].UserChr.Sex = 0 then begin
            bx := (SCREENWIDTH - 800) div 2 + 184;
            by := (SCREENHEIGHT - 600) div 2 + 325;
            fx := bx;
            fy := by;
          end else begin
            bx := (SCREENWIDTH - 800) div 2 + 195;
            by := (SCREENHEIGHT - 600) div 2 + 275;
            fx := bx;
            fy := by;
          end;
        end;
      end;


      if ChrArr[n].Selected then begin   //Ä³¸¯ ¼±ÅÃ
        if ChrArr[n].UserChr.Job > 4 then img := 120 + ChrArr[n].UserChr.Job * 20 + ChrArr[n].aniIndex + ChrArr[n].UserChr.Sex * 280  //µî¼±..ºÎÅÍ
        else
        img := 20 + ChrArr[n].UserChr.Job * 20 + ChrArr[n].aniIndex + ChrArr[n].UserChr.Sex * 280;
        if ChrArr[n].UserChr.Job = 4 then //½Â·Á
          d := g_WAresImages.GetCachedImage(470 + ChrArr[n].aniIndex, ax, ay)
        else
        d := g_WChrSelImages.GetCachedImage(img, ax, ay);
        if (d <> nil) and (not FrmDlg.DCreateChr.Visible) then begin
          if ChrArr[n].DarkLevel > 0 then begin
            dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
            dd.SystemMemory := TRUE;
            dd.SetSize (d.Width, d.Height);
            dd.Draw (0, 0, d.ClientRect, d, FALSE);
            MakeDark (dd, 30-ChrArr[n].DarkLevel);
            MSurface.Draw (GetScreenX(fx + ax), GetScreenY2(fy + ay), dd.ClientRect, dd, TRUE);
            dd.Free;
          end else
            MSurface.Draw (GetScreenX(fx + ax), GetScreenY2(fy + ay), d.ClientRect, d, TRUE)
        end;

        if Chrarr[n].UserChr.Job > 4 then begin    //µî¼± ÀÌÆÑÆ®
          img := 680 + ChrArr[n].UserChr.Job * 20 + ChrArr[n].aniIndex + ChrArr[n].UserChr.Sex * 280;
          d := g_WChrSelImages.GetCachedImage(img, ax, ay);
          if (d <> nil) and (not FrmDlg.DCreateChr.Visible) then begin
            if ChrArr[n].DarkLevel > 0 then begin
              dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
              dd.SystemMemory := TRUE;
              dd.SetSize (d.Width, d.Height);
              dd.Draw (0, 0, d.ClientRect, d, FALSE);
              MakeDark (dd, 30-ChrArr[n].DarkLevel);
              DrawBlend (MSurface, GetScreenX(fx + ax), GetScreenY2(fy + ay), dd, 0);
              dd.Free;
            end else
              DrawBlend (MSurface, GetScreenX(fx + ax), GetScreenY2(fy + ay), d, 0)
          end;
        end;
        if Chrarr[n].UserChr.Job = 1 then begin  //¼ú»ç ÀÌÆÑÆ®
          img := 600 + ChrArr[n].aniIndex + ChrArr[n].UserChr.Sex * 280;
          d := g_WChrSelImages.GetCachedImage(img, ax, ay);
          if (d <> nil) and (not FrmDlg.DCreateChr.Visible) then begin
            if ChrArr[n].DarkLevel > 0 then begin
              dd := TDirectDrawSurface.Create (frmMain.DXDraw.DDraw);
              dd.SystemMemory := TRUE;
              dd.SetSize (d.Width, d.Height);
              dd.Draw (0, 0, d.ClientRect, d, FALSE);
              MakeDark (dd, 30-ChrArr[n].DarkLevel);
              DrawBlend (MSurface, GetScreenX(fx + ax), GetScreenY2(fy + ay), dd, 0);
              dd.Free;
            end else
              DrawBlend (MSurface, GetScreenX(fx + ax), GetScreenY2(fy + ay), d, 0)
          end;
        end;
        if GetTickCount - ChrArr[n].StartTime > 250 then begin
          ChrArr[n].StartTime := GetTickCount;
          ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
          if ChrArr[n].aniIndex > SELECTEDFRAME-1 then ChrArr[n].aniIndex := 0;
        end;
        if GetTickCount - ChrArr[n].moretime > 75 then begin
          ChrArr[n].moretime := GetTickCount;
          if ChrArr[n].DarkLevel > 0 then ChrArr[n].DarkLevel := ChrArr[n].DarkLevel - 2;
        end;
      end;

      if (ChrArr[n].UserChr.Name <> '') and (ChrArr[n].Selected) then begin
        with MSurface do begin
          SetBkMode (Canvas.Handle, TRANSPARENT);
          BoldTextOut (MSurface, GetScreenX(SCREENWIDTH div 2 - Canvas.TextWidth(ChrArr[n].UserChr.Name) div 2 - 180), GetScreenY2(515), clWhite, clBlack, ChrArr[n].UserChr.Name);
          Canvas.Release;
        end;
      end;
    end;
   end;
 end else begin
  case g_FScreenMode of
    1: d := g_WNewLoginImages.Images[3];
    else
      d := g_WNewLoginImages.Images[5];
  end;
   //ÄÉ¸¯ÅÍ ¼±ÅÃÃ¢ ºÎºÐ
  if d <> nil then begin
    MSurface.Draw ((g_FScreenWidth - d.Width) div 2,(g_FScreenHeight - d.Height) div 2, d.ClientRect, d, FALSE);
  end;
  if GetTickCount - m_dwStartTime1 > 100 then begin
    m_dwStartTime1 := GetTickCount;
    Inc (m_nCurFrame1);
  end;
  if m_nCurFrame1 >= 40-1 then begin
    m_nCurFrame1 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(340 + m_nCurFrame1, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 390), GetScreenY2(ay + 200), d, 1);

  if GetTickCount - m_dwStartTime2 > 100 then begin
    m_dwStartTime2 := GetTickCount;
    Inc (m_nCurFrame2);
  end;
  if m_nCurFrame2 >= 40-1 then begin
    m_nCurFrame2 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(390 + m_nCurFrame2, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 442), GetScreenY2(ay + 200), d, 1);

  if GetTickCount - m_dwStartTime3 > 100 then begin
    m_dwStartTime3 := GetTickCount;
    Inc (m_nCurFrame3);
  end;
  if m_nCurFrame3 >= 40-1 then begin
    m_nCurFrame3 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(210 + m_nCurFrame3, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 566), GetScreenY2(ay + 235), d, 1);

  if GetTickCount - m_dwStartTime4 > 100 then begin
    m_dwStartTime4 := GetTickCount;
    Inc (m_nCurFrame4);
  end;
  if m_nCurFrame4 >= 40-1 then begin
    m_nCurFrame4 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(260 + m_nCurFrame4, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 232), GetScreenY2(ay + 235), d, 1);

  if GetTickCount - m_dwStartTime5 > 100 then begin
    m_dwStartTime5 := GetTickCount;
    Inc (m_nCurFrame5);
  end;
  if m_nCurFrame5 >= 40-1 then begin
    m_nCurFrame5 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(440 + m_nCurFrame5, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 402), GetScreenY2(ay + 298), d, 1);


  if GetTickCount - m_dwStartTime6 > 100 then begin
    m_dwStartTime6 := GetTickCount;
    Inc (m_nCurFrame6);
  end;
  if m_nCurFrame6 >= 37-1 then begin
    m_nCurFrame6 := 0;
  end;
  d := g_WNewLoginImages.GetCachedImage(490 + m_nCurFrame6, ax, ay);
  if d <> nil then
   DrawBlend(MSurface, GetScreenX(ax + 402), GetScreenY2(ay + 298), d, 1);

  if CreateChrMode then exit;

  svername := g_sServerName;
  len := length(svername);
  tx := g_FScreenWidth div 2;
  ty := 8;
  with MSurface.Canvas do begin
    SetBkMode (Handle, TRANSPARENT);
  ///  BoldTextOut (MSurface, 125, 15, clWhite, clBlack, 'Ver ' + VerInfoStr2);
    Font.Name := DecodeString('LoelKC?uKSQl'); //'Aparajita';
    Font.Size := 20;
    Font.Style := [fsBold];

    idx := Integer((GetTickCount - Append2Tick) div 400 mod LongWord(len)) ;
    str1 := Copy(svername, 1, idx);
    str2 := Copy(svername, idx + 1, 1);
    str3 := Copy(svername, idx + 2, len);
    tx := tx - TextWidth(svername) div 2;
    BoldTextOut (MSurface, tx, ty, clWhite, clBlack, str1);
    tx := tx + TextWidth(str1);
    BoldTextOut (MSurface, tx, ty, clYellow, clBlack, str2);
    tx := tx + TextWidth(str2);
    BoldTextOut (MSurface, tx, ty, clWhite, clBlack, str3);
   // BoldTextOut (MSurface, g_FScreenWidth div 2 - TextWidth(svername) div 2, 8, clWhite, clBlack, svername);
    Font.Name := g_sCurFontName;
    Font.Size := 9;
    Font.Style := [];
    Release;
  end;
  cx := 0;
  for n := 0 to 3 do begin
    if ChrArr[n].Valid and (not m_boNowLoading) then begin
      case ChrArr[n].UserChr.job of
        0, 5: begin      //Àü»ç
            if ChrArr[n].UserChr.sex = 0 then begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 142;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              FREEZEFRAME := 21;
            end else begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              FREEZEFRAME := 25;
            end;
            cx := 0;
            SELECTEDFRAME := 13;
          end;
        1, 6: begin        //¼ú»ç
            if ChrArr[n].UserChr.sex = 0 then begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              FREEZEFRAME := 24;
              SELECTEDFRAME := 14;
            end else begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 115;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              FREEZEFRAME := 25;
              SELECTEDFRAME := 15;
            end;
            cx := 10;
          end;
        2, 7: begin        //µµ»ç
            if ChrArr[n].UserChr.sex = 0 then begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              cx := 12;
            end else begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 115;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              cx := 10;
            end;
            FREEZEFRAME := 25;
            SELECTEDFRAME := 15;
          end;
        3, 8: begin        //ÀÚ°´
            if ChrArr[n].UserChr.sex = 0 then begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              cx := 5;
            end else begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
            end;
            FREEZEFRAME := 25;
            SELECTEDFRAME := 15;
          end;
        4, 9: begin         //½Â·Á
            if ChrArr[n].UserChr.sex = 0 then begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 125;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              cx := 10;
            end else begin
              fx := (DEFSCREENWIDTH - 800) div 2 + 115;
              fy := (DEFSCREENHEIGHT - 600) div 2 + 325;
              cx := 12;
            end;
            FREEZEFRAME := 25;
            SELECTEDFRAME := 15;
          end;
      end;

      if n = 1 then begin
        fx := fx + 178;
        fy := fy - 70;
      end else if n = 2 then begin
        fx := fx + 380;
        fy := fy - 70;
      end else if n = 3 then begin
        fx := fx + 548;
      end;

      sx := 67;
      sy := 180;
      if (not FrmDlg.DCreateChr.Visible) and (not FrmDlg.DRenewChr.Visible) then begin
        s := g_WNewLoginImages.Images[652];
        case n of
          0: begin
            sx := 67; sy := 180;
          end;
          1: begin
            sx := 245; sy := 110;
          end;
          2: begin
            sx := 446;  sy := 110;
          end;
          3: begin
            sx := 613; sy := 180;
          end;
        end;

        if (s <> nil) and (not ChrArr[n].Unfreezing) and (ChrArr[n].UserChr.Name <> '') then begin
          with FrmDlg.DSelectChr do
          MSurface.Draw(GetScreenX(sx), GetScreenY(sy), s, True);
          if n = 0 then begin
            with MSurface.Canvas do begin
              SetBkMode (Handle, TRANSPARENT);
              TextOutA(MSurface, GetScreenX(71), GetScreenY(190), clMoneyGreen, 'Ãû×Ö: ' + ChrArr[n].UserChr.Name);
              TextOutA(MSurface, GetScreenX(71), GetScreenY(212), clMoneyGreen, 'µÈ¼¶: ' + IntToStr(ChrArr[n].UserChr.Level));
              if ChrArr[n].UserChr.job > 4 then begin
                TextOutA(MSurface, GetScreenX(71), GetScreenY(234), clMoneyGreen, 'Ö°Òµ: ');
                TextOutA(MSurface, GetScreenX(107), GetScreenY(234), clYellow, GetJobName(ChrArr[n].UserChr.job));
              end else
              TextOutA(MSurface, GetScreenX(71), GetScreenY(234), clMoneyGreen, 'Ö°Òµ: ' + GetJobName(ChrArr[n].UserChr.job));
           {   TextOutA(MSurface, GetScreenX(71), GetScreenY(190), clMoneyGreen, 'ÀÌ¸§: ' + ChrArr[n].UserChr.Name);
              TextOutA(MSurface, GetScreenX(71), GetScreenY(206), clMoneyGreen, '·¹º§: ' + IntToStr(ChrArr[n].UserChr.Level));
              TextOutA(MSurface, GetScreenX(71), GetScreenY(222), clMoneyGreen, 'Á÷¾÷: ' + GetJobName(ChrArr[n].UserChr.job));
              TextOutA(MSurface, GetScreenX(71), GetScreenY(238), clMoneyGreen, ChrArr[n].UserChr.Login);    }
              Release;
            end;
          end else if n = 1 then begin
            with MSurface.Canvas do begin
              SetBkMode (Handle, TRANSPARENT);
              TextOutA(MSurface, GetScreenX(249), GetScreenY(120), clMoneyGreen, 'Ãû×Ö: ' + ChrArr[n].UserChr.Name);
              TextOutA(MSurface, GetScreenX(249), GetScreenY(142), clMoneyGreen, 'µÈ¼¶: ' + IntToStr(ChrArr[n].UserChr.Level));
              if ChrArr[n].UserChr.job > 4 then begin
                TextOutA(MSurface, GetScreenX(249), GetScreenY(164), clMoneyGreen, 'Ö°Òµ: ');
                TextOutA(MSurface, GetScreenX(249 + 36), GetScreenY(164), clYellow, GetJobName(ChrArr[n].UserChr.job));
              end else
              TextOutA(MSurface, GetScreenX(249), GetScreenY(164), clMoneyGreen, 'Ö°Òµ: ' + GetJobName(ChrArr[n].UserChr.job));
              Release;
            end;
          end else if n = 2 then begin
            with MSurface.Canvas do begin
              SetBkMode (Handle, TRANSPARENT);
              TextOutA(MSurface, GetScreenX(450), GetScreenY(120), clMoneyGreen, 'Ãû×Ö: ' + ChrArr[n].UserChr.Name);
              TextOutA(MSurface, GetScreenX(450), GetScreenY(142), clMoneyGreen, 'µÈ¼¶: ' + IntToStr(ChrArr[n].UserChr.Level));
              if ChrArr[n].UserChr.job > 4 then begin
                TextOutA(MSurface, GetScreenX(450), GetScreenY(164), clMoneyGreen, 'Ö°Òµ: ');
                TextOutA(MSurface, GetScreenX(450 + 36), GetScreenY(164), clYellow, GetJobName(ChrArr[n].UserChr.job));
              end else
              TextOutA(MSurface, GetScreenX(450), GetScreenY(164), clMoneyGreen, 'Ö°Òµ: ' + GetJobName(ChrArr[n].UserChr.job));
              Release;
            end;
          end else if n = 3 then begin
            with MSurface.Canvas do begin
              SetBkMode (Handle, TRANSPARENT);
              TextOutA(MSurface, GetScreenX(617), GetScreenY(190), clMoneyGreen, 'Ãû×Ö: ' + ChrArr[n].UserChr.Name);
              TextOutA(MSurface, GetScreenX(617), GetScreenY(212), clMoneyGreen, 'µÈ¼¶: ' + IntToStr(ChrArr[n].UserChr.Level));
              if ChrArr[n].UserChr.job > 4 then begin
                TextOutA(MSurface, GetScreenX(617), GetScreenY(234), clMoneyGreen, 'Ö°Òµ: ');
                TextOutA(MSurface, GetScreenX(617 + 36), GetScreenY(234), clYellow, GetJobName(ChrArr[n].UserChr.job));
              end else
              TextOutA(MSurface, GetScreenX(617), GetScreenY(234), clMoneyGreen, 'Ö°Òµ: ' + GetJobName(ChrArr[n].UserChr.job));
              Release;
            end;
          end;
        end;
        nJob := ChrArr[n].UserChr.job;
        if nJob > 4 then nJob := nJob - 5;
        if nJob = 4 then nJob := 5;
        if ChrArr[n].Unfreezing and (ChrArr[n].UserChr.Name <> '') then begin     //Ä³¸¯¼±ÅÃ, ´©¸§
          img := 740 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then MSurface.Draw(GetScreenX(bx + fx), GetScreenY(by + fy), d.ClientRect, d, True);
          img := 1480 + ChrArr[n].aniIndex + nJob * 160 + ChrArr[n].UserChr.sex * 80;;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then DrawBlend (MSurface, GetScreenX(bx + fx), GetScreenY(by + fy), d, 1);
          if GetTickCount - ChrArr[n].starttime > 80 then begin
             ChrArr[n].starttime := GetTickCount;
             ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
          end;
          if ChrArr[n].aniIndex > FREEZEFRAME-1 then begin
            ChrArr[n].Unfreezing := FALSE; //´Ù ³ì¾ÒÀ½
            ChrArr[n].FreezeState := FALSE; //
            ChrArr[n].aniIndex := 0;
          end;
        end else
        if (not ChrArr[n].Unfreezing) and (not ChrArr[n].Selected) and (ChrArr[n].UserChr.Name <> '') then begin   //Ä³¸¯¼±ÅÃ, ¸ð¼Ç ³¡
          img := 720 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
           d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then MSurface.Draw(GetScreenX(bx + fx), GetScreenY(by + fy), d.ClientRect, d, True);

          if GetTickCount - ChrArr[n].StartTime > 150 then begin
            ChrArr[n].StartTime := GetTickCount;
            ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
            if ChrArr[n].AniIndex > SELECTEDFRAME - 1 then ChrArr[n].AniIndex := 0;
          end;
        end else
        if ChrArr[n].Selected and (not ChrArr[n].Unfreezing)  and (ChrArr[n].UserChr.Name <> '') then begin
          img := 720 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then MSurface.Draw(GetScreenX(bx + fx), GetScreenY(by + fy), d.ClientRect, d, True);
          if GetTickCount - ChrArr[n].StartTime > 150 then begin
            ChrArr[n].StartTime := GetTickCount;
            ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
            if ChrArr[n].AniIndex > SELECTEDFRAME - 1 then ChrArr[n].AniIndex := 0;
            ChrArr[n].EffIndex := ChrArr[n].EffIndex + 1;
            if ChrArr[n].EffIndex > 14 - 1 then ChrArr[n].EffIndex := 0;
          end;
          img := 3840 + ChrArr[n].EffIndex;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then DrawBlend (MSurface, GetScreenX(fx + bx + cx), GetScreenY(fy + by), d, 1);
        end;
      end;


      if FrmDlg.DCreateChr.Visible and (ChrArr[n].UserChr.Name = '') then begin
        nJob := ChrArr[n].UserChr.job;
        if nJob = 4 then nJob := 5;
        if ChrArr[n].Unfreezing then begin     //Ä³¸¯¼±ÅÃ, ´©¸§
          img := 20 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then MSurface.Draw(GetScreenX(bx + 245), GetScreenY2(by + 220), d.ClientRect, d, True);

          img := 1440 + ChrArr[n].aniIndex + nJob * 160 + ChrArr[n].UserChr.sex * 80;;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then DrawBlend (MSurface, GetScreenX(bx + 245) , GetScreenY2(by + 220), d, 1);

          if GetTickCount - ChrArr[n].starttime > 80 then begin
             ChrArr[n].starttime := GetTickCount;
             ChrArr[n].aniIndex := ChrArr[n].aniIndex + 1;
          end;
          if ChrArr[n].aniIndex > FREEZEFRAME-1 then begin
            ChrArr[n].Unfreezing := FALSE;  //´Ù ³ì¾ÒÀ½
            ChrArr[n].FreezeState := FALSE;
            ChrArr[n].aniIndex := 0;
          end;
        end else
        if (not ChrArr[n].Unfreezing) and (not ChrArr[n].Selected) then begin   //Ä³¸¯¼±ÅÃ, ¸ð¼Ç ³¡
          img := 0 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
          d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
          if d <> nil then MSurface.Draw(GetScreenX(bx + 245) , GetScreenY2(by + 220), d.ClientRect, d, True);

          if GetTickCount - ChrArr[n].StartTime > 80 then begin
            ChrArr[n].StartTime := GetTickCount;
            ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
            if ChrArr[n].AniIndex > SELECTEDFRAME - 1 then ChrArr[n].AniIndex := 0;
          end;
        end else
          if ChrArr[n].Selected and (not ChrArr[n].Unfreezing) then begin
            img := 0 + nJob * 120 + ChrArr[n].AniIndex + ChrArr[n].UserChr.sex * 60;
            d := g_WNewChrSelImages.GetCachedImage(img, bx, by);
            if d <> nil then MSurface.Draw(GetScreenX(bx + 245), GetScreenY2(by + 220), d.ClientRect, d, True);
            if GetTickCount - ChrArr[n].StartTime > 80 then begin
              ChrArr[n].StartTime := GetTickCount;
              ChrArr[n].AniIndex := ChrArr[n].AniIndex + 1;
              if ChrArr[n].AniIndex > SELECTEDFRAME - 1 then ChrArr[n].AniIndex := 0;
            end;
          end;


      end;
    end;

  end;
 end;

  if m_boNowLoading then begin
 //   d := g_WMain3Images.Images[Numbert];
    d := g_WNewLoginImages.Images[697];
    if d <> nil then
      MSurface.Draw ((g_FScreenWidth - d.Width) div 2, (g_FScreenHeight - d.Height) div 2, d.ClientRect, d, TRUE);
    if GetTickCount - m_LoadingTime > 80 then begin
      m_LoadingTime := GetTickCount;
      Inc (m_nCurFrame);
    end;
    if m_nCurFrame >= m_nMaxFrame-1 then begin
      m_nCurFrame := m_nMaxFrame-1;
      m_nCurFrame := 0;
    end;
    e := g_WMainImages.Images[940 + m_nCurFrame];   //·Îµù ±Û¾¾~
    if e <> nil then
       MSurface.Draw((g_FScreenWidth - e.Width) div 2, (g_FScreenHeight - e.Height) div 2 + 250, e, TRUE);
  end;

end;



{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: IntroScn.pas 326 2006-08-24 19:52:54Z Dataforce $');
end.
