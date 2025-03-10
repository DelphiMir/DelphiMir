unit sSkinProps;

interface

const

// Images
  BordersMask                           = 'BORDERSMASK';
  BordersMaskPlus                       = 'BORDERSMASK+'; // For additional painting (in TsPageControl for sample)
  StatusBarGrip                         = 'GRIPIMAGE';
  GripImage                             = 'GRIPIMAGE';
  StatusPanelBordersMask                = 'STATUSPANELMASK';
  SliderChannelMask                     = 'SLIDERCHANNEL';

  ActiveTab                             = 'ACTIVETABBORDERSMASK';
  ActiveTabPlus                         = 'ACTIVETABBORDERSMASK+';
  InActiveTab                           = 'INACTIVETABBORDERSMASK';

  PatternFile                           = 'IMAGEFILE';
  HotPatternFile                        = 'HOTIMAGEFILE';

  TitleBorder                           = 'TITLEBORDER';
  NormalTitleBar                        = 'TITLEBAR';
  MenuLineBg                            = 'LINEPATTERN';

  BorderIconClose                       = 'BICONCLOSE';
  BorderIconMaximize                    = 'BICONMAX';
  BorderIconNormalize                   = 'BICONNORM';
  BorderIconMinimize                    = 'BICONMIN';
  BorderIconHelp                        = 'BICONHELP';
  TitleButtonMask                       = 'TITLEBUTTON';

  SmallIconNormalize                    = 'BICONNORM';   //'SICONMIN';
  SmallIconMinimize                     = 'BICONMIN';    //'SICONMIN';
  SmallIconMaximize                     = 'BICONMAX';    //'SICONMAX';
  SmallIconClose                        = 'BICONCLOSE';  //'SICONCLOSE';

  ComboBoxGlyph                         = 'GLYPHMASK';
  ItemGlyph                             = 'GLYPHMASK';
  GaugeHorProgress                      = 'GAUGEPROGRESSMASK';
  GaugeVertProgress                     = 'GAUGEPROGRESSMASK';
  GlyphChecked                          = 'GLYPHCHECKED';
  GlyphUnChecked                        = 'GLYPHUNCHECKED';
  SliderHorzMask                        = 'SLIDERMASK';
  SliderVertMask                        = 'SLIDERVMASK';


// General properties
  // Text and text contours colors
  FColor                                = 'FONTCOLOR';
  TCLeft                                = 'TCLEFT';
  TCTop                                 = 'TCTOP';
  TCRight                               = 'TCRIGHT';
  TCBottom                              = 'TCBOTTOM';
  // Hot text and text contours colors
  HotFColor                             = 'HOTFONTCOLOR';
  HotTCLeft                             = 'HOTTCLEFT';
  HotTCTop                              = 'HOTTCTOP';
  HotTCRight                            = 'HOTTCRIGHT';
  HotTCBottom                           = 'HOTTCBOTTOM';

  ReservedBoolean                       = 'RESERVEDBOOLEAN';

  SectionName                           = 'SectionName';
  ParentClassName                       = 'ParentClassName';
  PaintingColor                         = 'PaintingColor';
  PaintingBevel                         = 'PaintingBevel';
  PaintingBevelWidth                    = 'PaintingBevelWidth';
  ShadowBlur                            = 'ShadowBlur';
  ShadowColor                           = 'ShadowColor';
  ShadowDontUse                         = 'ShadowDontUse';
  ShadowEnabled                         = 'ShadowEnabled';
  ShadowOffset                          = 'ShadowOffset';
  ShadowTransparency                    = 'ShadowTransparency';
  FontColor                             = 'FontColor';
  HotFontColor                          = 'HotFontColor';
  PaintingTransparency                  = 'PaintingTransparency';
  GradientPercent                       = 'GradientPercent';
  GradientData                          = 'GradientData';
  ImagePercent                          = 'ImagePercent';
  ShowFocus                             = 'ShowFocus';
  FadingEnabled                         = 'FadingEnabled';
  FadingIntervalIn                      = 'FadingIntervalIn';
  FadingIntervalOut                     = 'FadingIntervalOut';
  FadingIterations                      = 'FadingIterations';
  HotPaintingColor                      = 'HotPaintingColor';
  HotPaintingTransparency               = 'HotPaintingTransparency';
  HotPaintingBevel                      = 'HotPaintingBevel';
  HotPaintingBevelWidth                 = 'HotPaintingBevelWidth';
  HotGradientPercent                    = 'HotGradientPercent';
  HotGradientData                       = 'HotGradientData';
  HotImagePercent                       = 'HotImagePercent';
  PaintingColorBorderTop                = 'PaintingColorBorderTop';
  PaintingColorBorderBottom             = 'PaintingColorBorderBottom';
  SelectionBorderBevel                  = 'SelectionBorderBevel';
  SelectionBorderWidth                  = 'SelectionBorderWidth';
  SelectionColor                        = 'SelectionColor';


// Default sections
  FormTitle                             = 'FORMTITLE';
  NormalForm                            = 'FORM';
  s_Dialog                              = 'DIALOG';
  MDIArea                               = 'MDIAREA';
  MainMenu                              = 'MAINMENU';
  MenuLine                              = 'MENULINE';
  MenuItem                              = 'MENUITEM';
  ScrollBar1H                           = 'SCROLLBAR1H';
  ScrollBar1V                           = 'SCROLLBAR1V';
  ScrollBar2H                           = 'SCROLLBAR2H';
  ScrollBar2V                           = 'SCROLLBAR2V';
  ScrollSliderV                         = 'SCROLLSLIDERV';
  ScrollSliderH                         = 'SCROLLSLIDERH';
  ScrollBtnLeft                         = 'SCROLLBTNLEFT';
  ScrollBtnTop                          = 'SCROLLBTNTOP';
  ScrollBtnRight                        = 'SCROLLBTNRIGHT';
  ScrollBtnBottom                       = 'SCROLLBTNBOTTOM';
  Divider                               = 'DIVIDER';
  ColHeader                             = 'COLHEADER';
//  SNFrame                               = 'FRAME';
  ProgressH                             = 'PROGRESSH';
  ProgressV                             = 'PROGRESSV';
  s_GlobalInfo                          = 'GLOBALINFO';
  s_Grid                                = 'GRID';
  s_CheckBoxChecked                     = 'BOXCHECKED';
  s_CheckBoxUnChecked                   = 'BOXUNCHECKED';
  s_CheckBoxGrayed                      = 'BOXGRAYED';
  s_RadioButtonChecked                  = 'RADIOCHECKED';
  s_RadioButtonUnChecked                = 'RADIOUNCHECKED';
  s_RadioButtonGrayed                   = 'RADIOGRAYED';
  s_SmallBoxChecked                     = 'BOXCHECKED';
  s_SmallBoxUnChecked                   = 'BOXUNCHECKED';
  s_SmallBoxGrayed                      = 'BOXGRAYED';

implementation

end.
