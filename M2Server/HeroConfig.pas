unit HeroConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin, Grids, Grobal2;

type
  TLevelExpScheme = (s_None, s_OldLevelExp, s_StdLevelExp, s_2Mult, s_5Mult, s_8Mult, s_10Mult, s_20Mult, s_30Mult, s_40Mult, s_50Mult, s_60Mult, s_70Mult, s_80Mult, s_90Mult, s_100Mult, s_150Mult, s_200Mult, s_250Mult, s_300Mult);
  TfrmHeroConfig = class(TForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    Label15: TLabel;
    GroupBoxLevelExp: TGroupBox;
    Label37: TLabel;
    ComboBoxLevelExp: TComboBox;
    GridLevelExp: TStringGrid;
    GroupBox29: TGroupBox;
    Label61: TLabel;
    Label7: TLabel;
    LabelHeroNameColor: TLabel;
    EditStartLevel: TSpinEdit;
    EditHeroNameColor: TSpinEdit;
    GroupBox59: TGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label17: TLabel;
    SpinEditWarrorAttackTime: TSpinEdit;
    SpinEditWizardAttackTime: TSpinEdit;
    SpinEditTaoistAttackTime: TSpinEdit;
    SpinEditAssaAttackTime: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEditNeedLevel: TSpinEdit;
    ComboBoxBagItemCount: TComboBox;
    EditRecallHeroTime: TSpinEdit;
    EditRecallHeroHint: TEdit;
    Label16: TLabel;
    EditHeroWalkTime: TSpinEdit;
    ButtonHeroExpSave: TButton;
    TabSheet2: TTabSheet;
    GroupBox67: TGroupBox;
    CheckBoxKillByMonstDropUseItem: TCheckBox;
    CheckBoxKillByHumanDropUseItem: TCheckBox;
    CheckBoxDieScatterBag: TCheckBox;
    GroupBox69: TGroupBox;
    Label130: TLabel;
    Label134: TLabel;
    ScrollBarDieDropUseItemRate: TScrollBar;
    EditDieDropUseItemRate: TEdit;
    ScrollBarDieScatterBagRate: TScrollBar;
    EditDieScatterBagRate: TEdit;
    ButtonHeroDieSave: TButton;
    Label2: TLabel;
    SpinEditItemAttackTime: TSpinEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    EditRunIntervalTime: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditWalkIntervalTime: TSpinEdit;
    EditTurnIntervalTime: TSpinEdit;
    procedure ComboBoxLevelExpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonHeroExpSaveClick(Sender: TObject);
    procedure EditStartLevelChange(Sender: TObject);

    procedure ComboBoxBagItemCountChange(Sender: TObject);
    procedure SpinEditNeedLevelChange(Sender: TObject);
    procedure SpinEditWarrorAttackTimeChange(Sender: TObject);
    procedure SpinEditWizardAttackTimeChange(Sender: TObject);
    procedure SpinEditTaoistAttackTimeChange(Sender: TObject);
    procedure ButtonHeroDieSaveClick(Sender: TObject);
    procedure CheckBoxKillByMonstDropUseItemClick(Sender: TObject);
    procedure CheckBoxKillByHumanDropUseItemClick(Sender: TObject);
    procedure CheckBoxDieScatterBagClick(Sender: TObject);
    procedure ScrollBarDieDropUseItemRateChange(Sender: TObject);
    procedure ScrollBarDieScatterBagRateChange(Sender: TObject);
    procedure EditHeroNameColorChange(Sender: TObject);
    procedure EditRecallHeroTimeChange(Sender: TObject);
    procedure EditRecallHeroHintChange(Sender: TObject);
    procedure EditHeroWalkTimeChange(Sender: TObject);
    procedure SpinEditAssaAttackTimeChange(Sender: TObject);
    procedure SpinEditItemAttackTimeChange(Sender: TObject);
    procedure EditRunIntervalTimeChange(Sender: TObject);
    procedure EditWalkIntervalTimeChange(Sender: TObject);
    procedure EditTurnIntervalTimeChange(Sender: TObject);

  private
    { Private declarations }
    boOpened: Boolean;
    boModValued: Boolean;
    OldLevelExpScheme: TLevelExpScheme;
    procedure ModValue();
    procedure uModValue();
  public
    { Public declarations }
    procedure Open();
  end;

var
  frmHeroConfig: TfrmHeroConfig;

implementation
uses M2Share, HUtil32, SDK;
{$R *.dfm}
var
  dwOldNeedExps: TLevelNeedExp;

procedure TfrmHeroConfig.ModValue();
begin
  boModValued := True;
  ButtonHeroExpSave.Enabled := True;
  ButtonHeroDieSave.Enabled := True;
end;

procedure TfrmHeroConfig.uModValue();
begin
  boModValued := False;
  ButtonHeroExpSave.Enabled := False;
  ButtonHeroDieSave.Enabled := False;
end;

procedure TfrmHeroConfig.ComboBoxLevelExpClick(Sender: TObject);
var
  I: Integer;
  LevelExpScheme: TLevelExpScheme;
  dwOneLevelExp: LongWord;
  dwExp: LongWord;
begin
  if not boOpened then Exit;
  if Application.MessageBox('升级经验设置后立即生效，你确定修改吗？','提示信息', MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    Exit;
  end;

  LevelExpScheme := TLevelExpScheme(ComboBoxLevelExp.Items.Objects[ComboBoxLevelExp.ItemIndex]);
  case LevelExpScheme of
    s_OldLevelExp: g_Config.dwHeroNeedExps := g_dwOldNeedExps;
    s_StdLevelExp: begin
        g_Config.dwHeroNeedExps := g_dwOldNeedExps;
        dwOneLevelExp := 4000000000 div High(g_Config.dwHeroNeedExps);
        for I := 1 to MAXCHANGELEVEL do begin
          if (26 + I) > MAXCHANGELEVEL then Break;
          dwExp := dwOneLevelExp * LongWord(I);
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[26 + I] := dwExp;
        end;
      end;
    s_2Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 2;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_5Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 5;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_8Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 8;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_10Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 10;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_20Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 20;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_30Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 30;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_40Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 40;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_50Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 50;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_60Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 60;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_70Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 70;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_80Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 80;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_90Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 90;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_100Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 100;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_150Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 150;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_200Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 200;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_250Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 250;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
    s_300Mult: begin
        for I := 1 to MAXCHANGELEVEL do begin
          dwExp := g_Config.dwHeroNeedExps[I] div 300;
          if dwExp = 0 then dwExp := 1;
          g_Config.dwHeroNeedExps[I] := dwExp;
        end;
      end;
  end;
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[1, I] := IntToStr(g_Config.dwHeroNeedExps[I]);
  end;
  ModValue();
end;

procedure TfrmHeroConfig.Open();
var
  I: Integer;
  s01: string;
begin
  boOpened := False;
  PageControl.ActivePageIndex := 0;
  uModValue();
  dwOldNeedExps := g_Config.dwHeroNeedExps;
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[1, I] := IntToStr(g_Config.dwHeroNeedExps[I]);
  end;

  GroupBoxLevelExp.Caption := format('经验值(最大等级: %d)',[MAXLEVEL]);

  EditStartLevel.Value := g_Config.nHeroStartLevel;

  ComboBoxBagItemCount.Items.Clear;

  for I := Low(g_Config.HeroBagItemCounts) to High(g_Config.HeroBagItemCounts) do begin
    case I of
      0: s01 := '10格';
      1: s01 := '10格';
      2: s01 := '18格';
      3: s01 := '26格';
      4: s01 := '34格';
      5: s01 := '42格';
    end;
    ComboBoxBagItemCount.Items.AddObject(s01, TObject(g_Config.HeroBagItemCounts[I]));
  end;


  SpinEditWarrorAttackTime.Value := g_Config.dwHeroWarrorAttackTime;
  SpinEditWizardAttackTime.Value := g_Config.dwHeroWizardAttackTime;
  SpinEditTaoistAttackTime.Value := g_Config.dwHeroTaoistAttackTime;
  SpinEditAssaAttackTime.Value := g_Config.dwHeroAssassinAttackTime;

  SpinEditItemAttackTime.value := g_Config.dwHeroItemAttackTime;

  EditHeroWalkTime.Value := g_Config.dwHeroWalkTime;

  EditRunIntervalTime.Value:=g_Config.dwRunIntervalTime;
  EditWalkIntervalTime.Value:=g_Config.dwWalkIntervalTime;
  EditTurnIntervalTime.Value:=g_Config.dwTurnIntervalTime;

  CheckBoxKillByMonstDropUseItem.Checked := g_Config.boHeroKillByMonstDropUseItem;
  CheckBoxKillByHumanDropUseItem.Checked := g_Config.boHeroKillByHumanDropUseItem;
  CheckBoxDieScatterBag.Checked := g_Config.boHeroDieScatterBag;

  ScrollBarDieDropUseItemRate.Min := 1;
  ScrollBarDieDropUseItemRate.Max := 200;
  ScrollBarDieDropUseItemRate.Position := g_Config.nHeroDieDropUseItemRate;

  ScrollBarDieScatterBagRate.Min := 1;
  ScrollBarDieScatterBagRate.Max := 200;
  ScrollBarDieScatterBagRate.Position := g_Config.nHeroDieScatterBagRate;

  ComboBoxBagItemCount.ItemIndex := -1;
  ComboBoxBagItemCount.Text := '配置文件 ';
  SpinEditNeedLevel.Value := 10;
  SpinEditNeedLevel.Enabled := False;


  EditHeroNameColor.Value := g_Config.btHeroNameColor;
  LabelHeroNameColor.Color := GetRGB(g_Config.btHeroNameColor);


  EditRecallHeroTime.Value := g_Config.nRecallHeroTime;
  EditRecallHeroHint.Text := g_Config.sRecallHeroHint;


  boOpened := True;
  ShowModal;
end;

procedure TfrmHeroConfig.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  GridLevelExp.ColWidths[0] := 30;
  GridLevelExp.ColWidths[1] := 100;
  GridLevelExp.Cells[0, 0] := 'Lvl';
  GridLevelExp.Cells[1, 0] := 'Exp';
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[0, I] := IntToStr(I);
  end;

  ComboBoxLevelExp.AddItem('Old exp', TObject(s_OldLevelExp));
  ComboBoxLevelExp.AddItem('Standard exp', TObject(s_StdLevelExp));
  ComboBoxLevelExp.AddItem('1/2 Current exp', TObject(s_2Mult));
  ComboBoxLevelExp.AddItem('1/5 Current exp', TObject(s_5Mult));
  ComboBoxLevelExp.AddItem('1/8 Current exp', TObject(s_8Mult));
  ComboBoxLevelExp.AddItem('1/10 Current exp', TObject(s_10Mult));
  ComboBoxLevelExp.AddItem('1/20 Current exp', TObject(s_20Mult));
  ComboBoxLevelExp.AddItem('1/30 Current exp', TObject(s_30Mult));
  ComboBoxLevelExp.AddItem('1/40 Current exp', TObject(s_40Mult));
  ComboBoxLevelExp.AddItem('1/50 Current exp', TObject(s_50Mult));
  ComboBoxLevelExp.AddItem('1/60 Current exp', TObject(s_60Mult));
  ComboBoxLevelExp.AddItem('1/70 Current exp', TObject(s_70Mult));
  ComboBoxLevelExp.AddItem('1/80 Current exp', TObject(s_80Mult));
  ComboBoxLevelExp.AddItem('1/90 Current exp', TObject(s_90Mult));
  ComboBoxLevelExp.AddItem('1/100 Current exp', TObject(s_100Mult));
  ComboBoxLevelExp.AddItem('1/150 Current exp', TObject(s_150Mult));
  ComboBoxLevelExp.AddItem('1/200 Current exp', TObject(s_200Mult));
  ComboBoxLevelExp.AddItem('1/250 Current exp', TObject(s_250Mult));
  ComboBoxLevelExp.AddItem('1/300 current exp', TObject(s_300Mult));
  OldLevelExpScheme := s_None;
end;

procedure TfrmHeroConfig.ButtonHeroExpSaveClick(Sender: TObject);
var
  I: Integer;
  dwExp: LongWord;
  NeedExps: TLevelNeedExp;
  LevelExpScheme: TLevelExpScheme;
begin
  if ComboBoxLevelExp.ItemIndex >= 0 then
    LevelExpScheme := TLevelExpScheme(ComboBoxLevelExp.Items.Objects[ComboBoxLevelExp.ItemIndex])
  else LevelExpScheme := s_None;

  if OldLevelExpScheme <> LevelExpScheme then begin
    for I := 1 to GridLevelExp.RowCount - 1 do begin
      dwExp := Str_ToInt(GridLevelExp.Cells[1, I], 0);
      if (dwExp <= 0) or (dwExp > High(LongWord)) then begin
        Application.MessageBox(PChar('Level ' + IntToStr(I) + ' Upgrade experience is set incorrectly!!!'),'提示信息', MB_OK + MB_ICONERROR);
        GridLevelExp.Row := I;
        GridLevelExp.SetFocus;
        Exit;
      end;
      NeedExps[I] := dwExp;
    end;
    g_Config.dwHeroNeedExps := NeedExps;
  end;

  if OldLevelExpScheme <> LevelExpScheme then begin
    for I := 1 to 1000 do begin
      if dwOldNeedExps[I] <> g_Config.dwHeroNeedExps[I] then
        Config.WriteString('HeroExp', 'Level' + IntToStr(I), IntToStr(g_Config.dwHeroNeedExps[I]));
    end;
  end;
  Config.WriteInteger('HeroSetup', 'HeroStartLevel', g_Config.nHeroStartLevel);

  for I := Low(g_Config.HeroBagItemCounts) to High(g_Config.HeroBagItemCounts) do begin
    Config.WriteInteger('HeroSetup', 'BagItemCount' + IntToStr(I), g_Config.HeroBagItemCounts[I]);
  end;

  Config.WriteInteger('HeroSetup', 'HeroWarrorAttackTime', g_Config.dwHeroWarrorAttackTime);
  Config.WriteInteger('HeroSetup', 'HeroWizardAttackTime', g_Config.dwHeroWizardAttackTime);
  Config.WriteInteger('HeroSetup', 'HeroTaoistAttackTime', g_Config.dwHeroTaoistAttackTime);
  Config.WriteInteger('HeroSetup', 'HeroAssassinAttackTime', g_Config.dwHeroAssassinAttackTime);
  Config.WriteInteger('HeroSetup', 'HeroItemAttackTime', g_Config.dwHeroItemAttackTime);

  Config.WriteInteger('HeroSetup', 'HeroWalkTime', g_Config.dwHeroWalkTime);

  Config.WriteInteger('Setup','RunIntervalTime',  g_Config.dwRunIntervalTime);
  Config.WriteInteger('Setup','WalkIntervalTime',  g_Config.dwWalkIntervalTime);
  Config.WriteInteger('Setup','TurnIntervalTime',  g_Config.dwTurnIntervalTime);

  Config.WriteInteger('HeroSetup', 'HeroNameColor', g_Config.btHeroNameColor);

  Config.WriteInteger('HeroSetup', 'RecallHeroTime', g_Config.nRecallHeroTime);
  Config.WriteString('HeroSetup', 'RecallHeroHint', g_Config.sRecallHeroHint);
  uModValue();
end;

procedure TfrmHeroConfig.EditStartLevelChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.nHeroStartLevel := EditStartLevel.Value;
  ModValue();
end;

procedure TfrmHeroConfig.ComboBoxBagItemCountChange(Sender: TObject);
begin
  SpinEditNeedLevel.Value := Integer(ComboBoxBagItemCount.Items.Objects[ComboBoxBagItemCount.ItemIndex]);
  SpinEditNeedLevel.Enabled := True;
end;

procedure TfrmHeroConfig.SpinEditNeedLevelChange(Sender: TObject);
  procedure RefBagcount;
  var
    I: Integer;
  begin
    for I := 0 to ComboBoxBagItemCount.Items.Count - 1 do begin
      g_Config.HeroBagItemCounts[I] := Integer(ComboBoxBagItemCount.Items.Objects[I]);
    end;
  end;
begin
  if not boOpened then Exit;
  ComboBoxBagItemCount.Items.Objects[ComboBoxBagItemCount.ItemIndex] := TObject(SpinEditNeedLevel.Value);
  RefBagcount;
  ModValue();
end;

procedure TfrmHeroConfig.SpinEditWarrorAttackTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroWarrorAttackTime := SpinEditWarrorAttackTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.SpinEditWizardAttackTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroWizardAttackTime := SpinEditWizardAttackTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.SpinEditTaoistAttackTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroTaoistAttackTime := SpinEditTaoistAttackTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.ButtonHeroDieSaveClick(Sender: TObject);
begin
  Config.WriteBool('HeroSetup', 'HeroKillByMonstDropUseItem', g_Config.boHeroKillByMonstDropUseItem);
  Config.WriteBool('HeroSetup', 'HeroKillByHumanDropUseItem', g_Config.boHeroKillByHumanDropUseItem);
  Config.WriteBool('HeroSetup', 'HeroDieScatterBag', g_Config.boHeroDieScatterBag);

  Config.WriteInteger('HeroSetup', 'HeroDieDropUseItemRate', g_Config.nHeroDieDropUseItemRate);
  Config.WriteInteger('HeroSetup', 'HeroDieScatterBagRate', g_Config.nHeroDieScatterBagRate);
  uModValue();
end;

procedure TfrmHeroConfig.CheckBoxKillByMonstDropUseItemClick(
  Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.boHeroKillByMonstDropUseItem := CheckBoxKillByMonstDropUseItem.Checked;
  ModValue();
end;

procedure TfrmHeroConfig.CheckBoxKillByHumanDropUseItemClick(
  Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.boHeroKillByHumanDropUseItem := CheckBoxKillByHumanDropUseItem.Checked;
  ModValue();
end;

procedure TfrmHeroConfig.CheckBoxDieScatterBagClick(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.boHeroDieScatterBag := CheckBoxDieScatterBag.Checked;
  ModValue();
end;



procedure TfrmHeroConfig.ScrollBarDieDropUseItemRateChange(
  Sender: TObject);
var
  nPostion: Integer;
begin
  nPostion := ScrollBarDieDropUseItemRate.Position;
  EditDieDropUseItemRate.Text := IntToStr(nPostion);
  if not boOpened then Exit;
  g_Config.nHeroDieDropUseItemRate := nPostion;
  ModValue();
end;

procedure TfrmHeroConfig.ScrollBarDieScatterBagRateChange(Sender: TObject);
var
  nPostion: Integer;
begin
  nPostion := ScrollBarDieScatterBagRate.Position;
  EditDieScatterBagRate.Text := IntToStr(nPostion);
  if not boOpened then Exit;
  g_Config.nHeroDieScatterBagRate := nPostion;
  ModValue();
end;

procedure TfrmHeroConfig.EditHeroNameColorChange(Sender: TObject);
var
  btColor: Byte;
begin
  btColor := EditHeroNameColor.Value;
  LabelHeroNameColor.Color := GetRGB(btColor);
  if not boOpened then Exit;
  g_Config.btHeroNameColor := btColor;
  ModValue();
end;

procedure TfrmHeroConfig.EditRecallHeroTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.nRecallHeroTime := EditRecallHeroTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.EditRecallHeroHintChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.sRecallHeroHint := EditRecallHeroHint.Text;
  ModValue();
end;

procedure TfrmHeroConfig.EditHeroWalkTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroWalkTime := EditHeroWalkTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.SpinEditAssaAttackTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroAssassinAttackTime := SpinEditAssaAttackTime.Value;
  ModValue();
end;


procedure TfrmHeroConfig.SpinEditItemAttackTimeChange(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.dwHeroItemAttackTime := SpinEditItemAttackTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.EditRunIntervalTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwRunIntervalTime:=EditRunIntervalTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.EditWalkIntervalTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwWalkIntervalTime:=EditWalkIntervalTime.Value;
  ModValue();
end;

procedure TfrmHeroConfig.EditTurnIntervalTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwTurnIntervalTime:=EditTurnIntervalTime.Value;
  ModValue();
end;

end.
