object BasicFrm: TBasicFrm
  Left = 278
  Top = 147
  ActiveControl = StartGame
  BorderStyle = bsSingle
  Caption = 'Korea Mir2 (KM2)'
  ClientHeight = 115
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008777
    7777777777777777777777777777F7770077700077000007000700000077F877
    7777777777777700777777777007F8F8F888888777F8887778877777F777F8F8
    8778888777878877707777778777F8F87078F87007888000000000007777F8F8
    7078000007887007777770078777F8F87078FF8700787078888778707777F8F8
    7008FF87007F707777877770F777F8F8707FFFF800788077000000778777F8F8
    7007777700F8707FF88877888707F8F77007777700877078877777888777F8F7
    7078888F00877007000000888777F7888078878F70877007888878887777F7F8
    7000000000778077777887877777F7F77078888800777077000000888777F8F7
    7078F8880087707F888777888777F8F77078887700787077777700888777F7F8
    70007000007870077777007FF777F8F8778FFF8877888877788800788777F787
    7777777777777887778800788777F7877700770077000077777800788770F8F7
    7700787078777007777700078777F8F88700887008887077777700777777F8F8
    7707F87007787078888877888700F8F77707777000777077777777888777FF77
    7777007700077077777700088777F8F88777707777787078888777777777F8FF
    F88870077787700787FF87778707FFFF788877777787777888F878877700F8FF
    FFFFFFFFFFFFFFFFFFFFFFFFF707FFFFF8887788778FF87778FF887787770000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object WorkLB: TLabel
    Left = 27
    Top = 5
    Width = 70
    Height = 15
    AutoSize = False
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = 13626879
    Font.Height = 16
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object TotalSize: TLabel
    Left = 336
    Top = 29
    Width = 137
    Height = 16
    Alignment = taRightJustify
    AutoSize = False
    BiDiMode = bdRightToLeft
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = 3824520
    Font.Height = -13
    Font.Name = #44404#47548
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object NowWork: TLabel
    Left = 26
    Top = 29
    Width = 303
    Height = 15
    AutoSize = False
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = 8487297
    Font.Height = -13
    Font.Name = #44404#47548
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object XiProgressBar1: TXiProgressBar
    Left = 26
    Top = 56
    Width = 447
    Height = 16
    ColorBorder = clWindow
    BackColorFace = clHighlight
    BackColorGrad = clWindow
    ForeColorFace = 6595072
    ForeColorGrad = 5535488
    ColorScheme = csCustom
    Max = 100
    Min = 0
    Position = 0
    Step = 10
    Orientation = pbHorizontal
  end
  object XiProgressBar2: TXiProgressBar
    Left = 26
    Top = 80
    Width = 447
    Height = 16
    ColorBorder = clWindow
    BackColorFace = clScrollBar
    BackColorGrad = clWindow
    ForeColorFace = 26307
    ForeColorGrad = 22437
    ColorScheme = csCustom
    Max = 100
    Min = 0
    Position = 0
    Step = 10
    Orientation = pbHorizontal
  end
  object ExitClick: TXiButton
    Left = 488
    Top = 72
    Width = 177
    Height = 25
    Hint = #51333#47308#54633#45768#45796'.'
    ColorFace = 3753299
    ColorGrad = clBlack
    ColorDark = 1842980
    ColorLight = clBlack
    ColorBorder = clBlack
    ColorText = 6526150
    OverColorFace = 3951194
    OverColorGrad = 1909546
    OverColorDark = 3621456
    OverColorLight = 2897215
    OverColorBorder = 2963009
    OverColorText = 6262719
    DownColorFace = clWindowFrame
    DownColorGrad = 3621456
    DownColorDark = 3753299
    DownColorLight = 3753299
    DownColorBorder = clBlack
    DownColorText = 6526150
    DisabledColorFace = 3753299
    DisabledColorGrad = 3621456
    DisabledColorDark = 3753299
    DisabledColorLight = clBlack
    DisabledColorBorder = clBlack
    DisabledColorText = 6526150
    ColorFocusRect = clBlack
    ColorScheme = csCustom
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = #51333' '#47308
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ExitClickClick
  end
  object StartGame: TXiButton
    Left = 581
    Top = 25
    Width = 84
    Height = 43
    Hint = #54056#52824#49884#51089#54616#44592
    ColorFace = 3753299
    ColorGrad = clBlack
    ColorDark = 1842980
    ColorLight = clBlack
    ColorBorder = clBlack
    ColorText = 13757951
    OverColorFace = 3753299
    OverColorGrad = 1842980
    OverColorDark = 3753299
    OverColorLight = 3753299
    OverColorBorder = clBlack
    OverColorText = 13757951
    DownColorFace = clMenuText
    DownColorGrad = 1842980
    DownColorDark = 3753299
    DownColorLight = 3753299
    DownColorBorder = 1842980
    DownColorText = 13757951
    DisabledColorFace = 3753299
    DisabledColorGrad = clMenuText
    DisabledColorDark = 3753299
    DisabledColorLight = clMenuText
    DisabledColorBorder = clBlack
    DisabledColorText = clCream
    ColorFocusRect = clBlack
    ColorScheme = csCustom
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = #44172#51076#49884#51089
    Font.Charset = ANSI_CHARSET
    Font.Color = 13757951
    Font.Height = -19
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = StartGameClick
  end
  object StopPatch: TXiButton
    Left = 488
    Top = 25
    Width = 89
    Height = 43
    Hint = #54056#52824' '#52712#49548#54616#44592
    ColorFace = 3753299
    ColorGrad = clBlack
    ColorDark = 1842980
    ColorLight = clBlack
    ColorBorder = clBlack
    ColorText = 13757951
    OverColorFace = 3753299
    OverColorGrad = 1842980
    OverColorDark = 3753299
    OverColorLight = 3753299
    OverColorBorder = clBlack
    OverColorText = 13757951
    DownColorFace = clMenuText
    DownColorGrad = 1842980
    DownColorDark = 3753299
    DownColorLight = 3753299
    DownColorBorder = 1842980
    DownColorText = 13757951
    DisabledColorFace = 3753299
    DisabledColorGrad = clMenuText
    DisabledColorDark = 3753299
    DisabledColorLight = clMenuText
    DisabledColorBorder = clBlack
    DisabledColorText = clCream
    ColorFocusRect = clBlack
    ColorScheme = csCustom
    Ctl3D = True
    Layout = blGlyphLeft
    Spacing = 4
    TransparentGlyph = True
    Gradient = True
    HotTrack = True
    Caption = #52712' '#49548
    Font.Charset = ANSI_CHARSET
    Font.Color = 13757951
    Font.Height = -19
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = StopPatchClick
  end
  object FTP: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    RecvBufferSize = 8192
    SendBufferSize = 4096
    OnWork = FTPWork
    OnWorkEnd = FTPWorkEnd
    OnConnected = FTPConnected
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 140
  end
  object IdAntiFreeze1: TIdAntiFreeze
    IdleTimeOut = 50
    OnlyWhenIdle = False
    Left = 188
  end
end
