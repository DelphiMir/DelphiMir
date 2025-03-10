unit sRegisterIt;
{$I sDefs.inc}

interface

uses
  Classes, sScrollBar, 
  {$IFNDEF ALITE}
    sCustomComboBox, sCurrencyEdit, sSpinEdit, sMemo, sRadioButton, sComboEdit,
    sPageControl, sCustomMenuManager, sCurrEdit, sToolEdit, sMonthCalendar,
    sHintManager, sBevel, sGroupBox, sStatusBar, sGauge, sTrackBar, sCalculator,
    sCustomMaskEdit, sCustomListBox, sEditorsManager, sComboBoxes, sSplitter, 
    sControlsManager, sEdit, sCustomLabel, sSkinManager, sSkinProvider, sTabControl,
    sCheckBox, sStyleUtil, sPanel, sCustomButton, sScrollBox, sImageList, sCheckListBox,
    sAlphaListBox, sTreeView, sListView, sFrameAdapter, sGridAdapter, sUpDown;
  {$ELSE}
    sEdit, sCustomLabel, sSkinManager, sSkinProvider,
    sCheckBox, sStyleUtil, sPanel, sCustomButton;
  {$ENDIF}

procedure Register;

implementation

uses Registry, Windows, sUtils, SysUtils;

procedure Register;
{$IFNDEF ALITE}
var
  r : TRegistry;
{$ENDIF}
begin

{$IFNDEF ALITE}
  r := TRegistry.Create;
  try
    r.RootKey := HKEY_CURRENT_USER;
  {$IFDEF DELPHI7}
    if r.OpenKey('SOFTWARE\Borland\Delphi\7.0\Palette', False) then begin
  {$ELSE}
    {$IFDEF DELPHI6}
      if r.OpenKey('SOFTWARE\Borland\Delphi\6.0\Palette', False) then begin
    {$ELSE}
      if r.OpenKey('SOFTWARE\Borland\Delphi\5.0\Palette', False) then begin
    {$ENDIF}
  {$ENDIF}
      r.DeleteValue('AlphaLite');
      r.DeleteValue('sStyle');
      r.DeleteValue('sTools');
    end;
  finally
    FreeAndNil(r);
  end;

  RegisterComponents('AlphaControls', [
    TsPanel, TsButton, TsBitBtn, TsCheckBox, TsRadioButton, TsEdit,
    TsMemo, TsComboEdit, TsCurrencyEdit, TsMaskEdit, TsListBox, TsDateEdit, TsComboBox,
    TsGauge, TsTrackBar, TsPageControl, TsStatusBar, TsDirectoryEdit,
    TsContainer, TsSpeedButton, TsColorSelect, TsCalcEdit, TsFileNameEdit, TsSplitter,
    TsToolBar, TsSpinEdit, TsDecimalSpinEdit, TsBevel, TsGroupBox, TsRadioGroup, TsLabel, TsColorBox,
    TsDragBar, TsWebLabel, TsMonthCalendar, TsScrollBar, TsScrollBox, TsComboBoxEx, //TsNewButton,
    TsTabControl, TsCheckListBox, TsTreeView, TsListView, TsUpDown{, TsAlphaListBox}]);

  RegisterComponents('AlphaTools', [
    TsSkinManager, TsSkinProvider, TsFrameAdapter, TsGridAdapter, TsHintManager,
    TsCalculator{, TsImageList in progress}]);

  RegisterComponents('SStyleTools', [
    TsMenuManager, TsEditorsManager, TsControlsManager]);

  RegisterNoIcon([TsTabSheet]);
  RegisterClasses([TsTabSheet]);

{$ELSE}

  RegisterComponents('AlphaLite', [
    TsSkinManager, TsSkinProvider, TsEdit, TsCheckBox, TsPanel, TsButton, 
    TsScrollBar, TsLabel, TsWebLabel, TsBitBtn]);

{$ENDIF}

end;

end.
