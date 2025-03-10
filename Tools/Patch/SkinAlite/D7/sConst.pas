// Unit sConst contains the basic types, constants and variables, used in AlphaControls
unit sConst;
{$I sDefs.inc}

interface

uses Graphics, Messages, Windows, comctrls, ExtCtrls, controls, classes, Buttons, StdCtrls, Consts, Dialogs;

type
  TAOR = array of Windows.TRect;
  TsDisabledGlyphKind = set of (dgBlended, dgGrayed);
  TsDisabledKind = set of (dkBlended, dkGrayed);
  TsCollectionNotification = (cnAdded, cnExtracting, cnDeleting);

// Scrollbars HitTest results
const

  HTSB_LEFT_BUTTON = 100;
  HTSB_RIGHT_BUTTON = 101;
  HTSB_TOP_BUTTON = 102;
  HTSB_BOTTOM_BUTTON = 103;
  HTSB_H_SCROLL = 104;
  HTSB_HB_SCROLL = 105;
  HTSB_V_SCROLL = 106;
  HTSB_VB_SCROLL = 107;

  { WM_NCHITTEST and MOUSEHOOKSTRUCT Mouse Position Codes for MDI form}
  HTCHILDCLOSE       = 101;
  HTCHILDMAX         = 102;
  HTCHILDMIN         = 103; 

  NoColorSelected = TColor($FF000000);

var
  ThemeLoading : boolean = False;
  AppShowHint : boolean;

type

  TsSkinName = string;
  TsDirectory = string;
  TsSkinSection = string;

  TsPredefinedBorders = (pdBorder1, pdBorder2, pdBorder3, pdBorder4, pdBorder5, pdBorder6, pdCustom);

  TFadeDirection = (fdNone, fdUp, fdDown);

  TCacheInfo = record
    Bmp : Graphics.TBitmap;
    X : integer;
    Y : integer;
    Ready : boolean;
  end;

  TsHackedControl = class(TControl)
  public
//    procedure WndProc(var Message: TMessage); override;
//    procedure Invalidate; override;
    property ParentColor;
    property Color;
    property PopupMenu;
  end;

  // Definition for IDE property editor
  TsGradientData = string[255];
  // Border styles for SStyle editors
  TsEditorBevel = (ebNone, ebRaised, ebLowered, ebAsTopBorder, ebAsBottomBorder);
  // Border styles for SStyle controls
  TsControlBevel = (cbNone, cbRaisedSoft, cbLoweredSoft, cbRaisedHard, cbLoweredHard);

  TsButtonStyle = (sbNone, sbFlat, sbNormal);
  { Styles of hints - (hsSimply, hsExtended, hsEllipse, hsStandard, hsNone)}
  TsHintStyle = (hsSimply, hsComics, hsEllipse, hsBalloon, hsStandard, hsNone);
  TsHintsPredefinitions = (shSimply, shGradient, shTransparent, shEllipse, shBalloon, shComicsGradient, shComicsTransparent, shStandard, shNone, shCustom);
  { Layouts for controls captions - (sclLeft, sclTopLeft, sclTopCenter, sclTopRight). Used in TsStyle pack}
  TsCaptionLayout = (sclLeft, sclTopLeft, sclTopCenter, sclTopRight);
  { Layouts for TsRadioButtons and TsCheckButtons - (calLeft, calRight). Used in TsStyle pack}
  TCheckAreaLayout = (calLeft, calRight);
  { Background styles - (bgsNone, bgsImage, bgsGradient, bgsTransparent)}
  TBgStyle = (bgsNone, bgsImage, bgsGradient, bgsTransparent);
  { Shapes of the shadows (ssRectangle, ssEllipse). Used in TsStyle pack}
  TsShadowingShape = (ssRectangle, ssEllipse);
  { Types of the gradients painting - (gtTopBottom, gtLeftRight, gtAsBorder)}
  TGradientTypes = (gtTopBottom, gtLeftRight, gtAsBorder);
  { Set selection modes for controls - (msBorder, msColor);//, msShadow)}
  TModeSelection = set of (msBorder, msColor);//, msShadow);
  { Style of borders painting - (bsRaised, bsLowered, bsFlat1, bsFlat2)}
  TsBorderStyle = (bsRaised, bsLowered, bsFlat1, bsFlat2);
  { Mode of the gradient width calculations. When gmFixed - width of gradient fixed. If gmPersent - width of gradient as percent from width of control}
  TsGradientMode = (//gmAuto,  // width of both gradient established for control complete having filled
                    gmFixed,   // width established in pixels
                    gmPercent);// width established in percents of control size
  { Set of days of week. Used in TsStyle pack}
  TDaysOfWeek = set of TCalDayOfWeek;
  { Order of date representation - (doMDY, doDMY, doYMD). Used in TsStyle pack}
  TDateOrder = (doMDY, doDMY, doYMD);
  { Set of control sides - (sdLeft, sdTop, sdRight, sdBottom, sdTL, sdTR, sdBL, sdBR). Used in TsStyle pack}
  TsSide = (sdLeft, sdTop, sdRight, sdBottom, sdTL, sdTR, sdBL, sdBR);
  { Set of window_show types. Used in TsStyle pack}
  TsWindowShowMode = (soHide, soNormal, soShowMinimized, soMaximize, soShowNoActivate,
                  soShow, soMinimize, soShowMinNoActive, soShowNA, soRestore, soDefault);
  { Set of popup window alignes - (pwaRight, pwaLeft). Used in TsStyle pack}
  TPopupWindowAlign = (pwaRight, pwaLeft);
  { Set of button glyph kindes - (gkCustom, gkDefault, gkDropDown, gkEllipsis). Used in TsStyle pack}
  TGlyphKind = (gkCustom, gkDefault, gkDropDown, gkEllipsis);
  TsWhatOperate = (swoForm, swoApplication);

  { Local definition of TRect}
  TsRect = TRect;
  { Record, that have some ways for color representation : TColor, four bytes or integer)}
  TsColor = record
    case integer of
      0  : (C : TColor);
      1  : (R, G, B, A : Byte);
      2  : (I : integer);
    end;

  { Pointer to @link(TPoints)}
  PPoints = ^TPoints;
  { Array of TPoint}
  TPoints = array[0..0] of TPoint;

  TsRGB = packed record
    B: Byte;
    G: Byte;
    R: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBArray = array[0..100000] of TsRGB;

  TsRGBA = packed record
    B: Byte;
    G: Byte;
    R: Byte;
    A: Byte;
  end;
  PRGBAArray = ^TRGBAArray;
  TRGBAArray = array[0..100000] of TsRGBA;

  { Set of 1..100}
  TPercent = 0..100;
  { Set of SStyle controls codes (1..255)}
  TsCodes = set of 1..255;//[COC_TsEdit..COC_Unknown]

var
  EmptyCI : TCacheInfo;

const

  aScrollCodes : array [0..8] of TScrollCode = (scLineUp, scLineDown, scPageUp, scPageDown, scPosition, scTrack, scTop, scBottom, scEndScroll);
  // Borders
  aPredefinedBorders : array [0..6] of TsPredefinedBorders = (pdBorder1, pdBorder2, pdBorder3, pdBorder4, pdBorder5, pdBorder6, pdCustom);
  // Internal constant for border paitning
  BevSoftness = 0.5;
  // Array of @link(TsBorderStyle)
  BevelsArray : array [0..3] of TsBorderStyle = (bsRaised, bsLowered, bsFlat1, bsFlat2);
  // Array of @link(TPanelBevel)
  PanelBevels : array [0..3] of TPanelBevel = (bvNone, bvLowered, bvRaised, bvSpace);
  // Array of border styles for SStyle editors
  aEditorBevels : array [0..4] of TsEditorBevel = (ebNone, ebRaised, ebLowered, ebAsTopBorder, ebAsBottomBorder);
  // Array of border styles for SStyle controls
  aControlBevels : array [0..4] of TsControlBevel = (cbNone, cbRaisedSoft, cbLoweredSoft, cbRaisedHard, cbLoweredHard);
  // Array of @link(TsHintStyle)
  aHintStyles : array [0..5] of TsHintStyle = (hsSimply, hsComics, hsEllipse, hsBalloon, hsStandard, hsNone);
  // Array of @link(TBgStyle)
  aBGStyles   : array [0..3] of TBgStyle = (bgsNone, bgsImage, bgsGradient, bgsTransparent);
  // Array of @link(TGradientTypes)
  aGradLayouts : array [0..2] of TGradientTypes = (gtTopBottom, gtLeftRight, gtAsBorder);
  aGlyphLayouts : array [0..3] of TButtonLayout = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);
  // Array of boolean strings - ('False', 'True')
  Bool : array [0..1] of string = ('False', 'True');
  // Array of TAlignment
  TextAligns : array [0..2] of TAlignment = (taLeftJustify, taCenter, taRightJustify);
  asHintsPredefinitions : array [0..9] of TsHintsPredefinitions = (shSimply, shGradient, shTransparent, shEllipse, shBalloon, shComicsGradient, shComicsTransparent, shStandard, shNone, shCustom);
  // Null date
  NullDate: TDateTime = 0;

  COC_TsCustom              = 1;
  COC_TsSpinEdit            = 2;

  COC_TsEdit                = 3;
  COC_TsCustomMaskEdit      = 4;
  COC_TsMemo                = 7;
  COC_TsCustomListBox       = 8;
  COC_TsListBox             = 8;

  COC_TsColorBox            = 9;
  COC_TsListView            = 10;

  COC_TsCustomComboBox      = 11;
  COC_TsIBComboBox          = 12;
  COC_TsComboBox            = 13;
  COC_TsADOComboBox         = 14;
  COC_TsBDEComboBox         = 15;
  COC_TsComboBoxEx          = 18;

  COC_TsCheckedControl      = 31;
  COC_TsCheckBox            = 32;
  COC_TsDBCheckBox          = 32;
  COC_TsRadioButton         = 33;

  COC_TsCurrencyEdit        = 41;

  COC_TsPanel               = 51;
  COC_TsContainer           = 52;
  COC_TsGlassPanel          = 53;
  COC_TsToolBar             = 54;
  COC_TsTransparentPanel    = 55;
  COC_TsDragBar             = 56;
  COC_TsTabSheet            = 57;
  COC_TsScrollBox           = 58;
  COC_TsCustomPanel         = 68;
  COC_TsGrip                = 73;
  COC_TsGroupBox            = 74;
  COC_TsSplitter            = 75;

  // DB-aware controls
  COC_TsDBEdit              = 76;
  COC_TsDBMemo              = 78;
  COC_TsDBComboBox          = 81;
  COC_TsDBLookupComboBox    = 82;
  COC_TsDBListBox           = 83;
  COC_TsDBLookupListBox     = 84;
  // -------------- >>

  COC_TsButtonControl       = 91;
  COC_TsSpeedButton         = 92;
  COC_TsButton              = 93;
  COC_TsBitButton           = 94;
  COC_TsColorSelect         = 95;
  COC_TsTreeView            = 96;
  COC_TsAlphaListBox        = 97;

  { @EXCLUDE}
  COC_TsBevel               = 110;

{!  COC_TsImage               = 701;}

  { @EXCLUDE}
  COC_TsCustomComboEdit     = 131;
  { @EXCLUDE}
  COC_TsFileDirEdit         = 132;
  { @EXCLUDE}
  COC_TsFilenameEdit        = 133;
  { @EXCLUDE}
  COC_TsDirectoryEdit       = 134;
  { @EXCLUDE}
  COC_TsCustomDateEdit      = 137;
  { @EXCLUDE}
  COC_TsComboEdit           = 138;
  { @EXCLUDE}
  COC_TsDateEdit            = 140;

  { @EXCLUDE}
  COC_TsPageControl         = 141;
  COC_TsScrollBar           = 142;
  COC_TsTabControl          = 141;

  { @EXCLUDE}
  COC_TsStatusBar           = 151;

  { @EXCLUDE}
  COC_TsGauge               = 161;
  { @EXCLUDE}
  COC_TsTrackBar            = 165;

  { @EXCLUDE}
  COC_TsHintManager         = 211;


  COC_TsCustomMenuManager   = 221;
  COC_TsMenuManager         = 222;
  COC_TsSkinProvider        = 224;
  COC_TsMDIForm             = 225;
  COC_TsFrameAdapter        = 226;
  COC_TsGridAdapter         = 227;

  COC_Unknown               = 250;

  // Codes of SStyle components, who don't have shadow
  sNoShadow : TsCodes = [COC_TsStatusBar, COC_TsGroupBox, COC_TsBevel,
                         COC_TsTabSheet, COC_TsPageControl
                        ];

  // Codes of SStyle components, who have sBackgrounds
  sHaveBG :   TsCodes = [COC_TsPanel..COC_TsCustomPanel,
                         COC_TsStatusBar,
                         COC_TsGauge,
                         COC_TsTrackBar,
                         COC_TsPageControl,
                         COC_TsButtonControl..COC_TsColorSelect
                        ];

  // Codes of SStyle components, who can be parent
  sCanBeParent : TsCodes = [COC_TsPanel..COC_TsCustomPanel,
                             COC_TsStatusBar
                           ];
  // Codes of SStyle components, who have complex(non-rectangular) region
  sComplexRegion : TsCodes = [COC_TsButton, COC_TsBitButton, COC_TsSpeedButton];
  // Codes of SStyle components, who have simple(rectangular) region
{
  sSimplyRegion : TsCodes = [COC_TsRadioButton, COC_TsCheckBox, COC_TsTrackBar,
                             COC_TsComboBox, COC_TsListView, COC_TsStatusBar,
                             COC_TsTreeView, COC_TsGauge, COC_TsScrollBox,
                             COC_TsAlphaListBox
                            ];
}
  // Codes of SStyle components, who can be parent
  sCanBeRounded : TsCodes = [1 .. 140, 150 .. 200
                            ];

  // Codes of SStyle components, who don't catch mouse events
  sForbidMouse : TsCodes = [COC_TsPanel..COC_TsGroupBox, COC_TsBevel, COC_TsPageControl..COC_TsGauge];

  { @EXCLUDE Colors}
  clInfoBk16         = TColor($02E1FFFF);
  { @EXCLUDE}
  clNone16           = TColor($02FFFFFF);

  { @EXCLUDE Red}
  scDarkRed          = TColor(Longint($00292163));
  { @EXCLUDE}
  scRed              = TColor(Longint($009C9ADA));
  { @EXCLUDE}
  scLightRed         = TColor(Longint($00DAD9F2));
  { @EXCLUDE Orange}
  scDarkOrange       = TColor(Longint($00094D71));
  { @EXCLUDE}
  scOrange           = TColor(Longint($009AC1E2));
  { @EXCLUDE}
  scLightOrange      = TColor(Longint($00ECE8F7));
  { @EXCLUDE Yellow}
  scDarkYellow       = TColor(Longint($002C848D));
  { @EXCLUDE}
  scYellow           = TColor(Longint($00B6DBDC));
  { @EXCLUDE}
  scLightYellow      = TColor(Longint($00ECFFFF));
  { @EXCLUDE Green}
  scDarkGreen        = TColor(Longint($00385937));
  { @EXCLUDE}
  scGreen            = TColor(Longint($00ACC4AE));
  { @EXCLUDE}
  scLightGreen       = TColor(Longint($00DEF5E1));
  { @EXCLUDE Sky}
  scDarkSky          = TColor(Longint($007D6B42));
  { @EXCLUDE}
  scSky              = TColor(Longint($00C0B798));
  { @EXCLUDE}
  scLightSky         = TColor(Longint($00E2E0D3));
  { @EXCLUDE Blue}
  scDarkBlue         = TColor(Longint($007D5415));
  { @EXCLUDE}
  scBlue             = TColor(Longint($00CFB78F));
  { @EXCLUDE}
  scLightBlue        = TColor(Longint($00EFEDE4));
  { @EXCLUDE Violet}
  scDarkViolet       = TColor(Longint($006C4124));
  { @EXCLUDE}
  scViolet           = TColor(Longint($00D8BDBA));
  { @EXCLUDE}
  scLightViolet      = TColor(Longint($00E9DAD8));
  { @EXCLUDE Brown}
  scDarkBrown        = TColor(Longint($00375C82));
  { @EXCLUDE}
  scBrown            = TColor(Longint($00AEBDC6));
  { @EXCLUDE}
  scLightBrown       = TColor(Longint($00DDE3E6));
  { @EXCLUDE Kaki}
  scDarkKaki         = TColor(Longint($00395E55));
  { @EXCLUDE}
  scKaki             = TColor(Longint($00B0CECB));
  { @EXCLUDE}
  scLightKaki        = TColor(Longint($00D9ECEC));

  { @EXCLUDE Types of sStyle}
  tos_SPASSIVEPAINTSTYLE    = -2;
  tos_SIMPLYSTYLE           =  1;
  tos_SEDITSTYLE            =  1;
  tos_SPAINTSTYLE           =  1;
  tos_SPASSIVEBGSTYLE       = 12;
  tos_SACTIVEBGSTYLE        = 13;
  tos_SCUSTOMSTYLE          = 14;
  tos_SSTYLE                = 15;
  tos_SSTYLEDB              = 16;

  tos_COMMONDATA            = -2;

//  sEditors : integer = [COC_TsStatusBar, COC_TsGroupBox, COC_TsBevel,


var
  FooterColor : TsColor;
{$IFDEF RUNIDEONLY}
  { @EXCLUDE}
  sTerminated         : boolean = False;
const
{$IFDEF SINGLE}
  {$IFDEF TSHINTS}
  { @EXCLUDE}
    sIsRUNIDEONLYMessage = 'This version of sHintManager is trial. For purchase of the fully functional version please come to the http://www.alphaskins.com. Thanks!';
  {$ELSE}
  { @EXCLUDE}
    sIsRUNIDEONLYMessage = 'This version of sMenuManager is trial. For purchase of the fully functional version please come to the http://www.alphaskins.com. Thanks!';
  {$ENDIF}
{$ELSE}
  { @EXCLUDE}
  sIsRUNIDEONLYMessage = 'This version of AlphaControls is trial. For purchase of the fully functional version please come to the http://www.alphaskins.com. Thanks!';
{$ENDIF}
{$ENDIF}

implementation

initialization
  FooterColor.C := $00DAC8A9;
  
  EmptyCI.Ready := False;
  EmptyCI.Bmp := nil;

finalization


end.



