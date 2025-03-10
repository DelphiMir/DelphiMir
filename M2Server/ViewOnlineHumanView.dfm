object frmViewOnlineHumanView: TfrmViewOnlineHumanView
  Left = 340
  Top = 343
  Width = 1257
  Height = 477
  Caption = #36830#25509#29992#25143
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 1241
    Height = 383
    Align = alClient
    Caption = '??????...'
    TabOrder = 0
    object GridHuman: TStringGrid
      Left = 1
      Top = 1
      Width = 1239
      Height = 381
      Align = alClient
      ColCount = 18
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 25
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDblClick = GridHumanDblClick
      ColWidths = (
        33
        78
        31
        44
        39
        86
        47
        101
        122
        36
        104
        75
        55
        57
        64
        70
        64
        96)
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 1241
    Height = 56
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 168
      Top = 23
      Width = 60
      Height = 17
      Caption = #25490#24207#26041#27861' :'
    end
    object Label2: TLabel
      Left = 656
      Top = 23
      Width = 57
      Height = 18
      Caption = #31561#32423'  <'
    end
    object Label3: TLabel
      Left = 472
      Top = 23
      Width = 30
      Height = 12
      Caption = #31579#36873':'
    end
    object ButtonRefGrid: TButton
      Left = 16
      Top = 18
      Width = 57
      Height = 25
      Caption = #21047#26032'(&R)'
      TabOrder = 0
      OnClick = ButtonRefGridClick
    end
    object ComboBoxSort: TComboBox
      Left = 240
      Top = 20
      Width = 113
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      TabOrder = 1
      OnClick = ComboBoxSortClick
      Items.Strings = (
        '???'
        '??'
        '??'
        '??'
        '?'
        '???'
        '??'
        '?????')
    end
    object EditSearchName: TEdit
      Left = 512
      Top = 20
      Width = 113
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
    end
    object ButtonSearch: TButton
      Left = 808
      Top = 18
      Width = 73
      Height = 25
      Caption = #26597#25214'(&S)'
      TabOrder = 3
      OnClick = ButtonSearchClick
    end
    object ButtonView: TButton
      Left = 896
      Top = 18
      Width = 81
      Height = 25
      Caption = #29992#25143#20449#24687' (&H)'
      TabOrder = 4
      OnClick = ButtonViewClick
    end
    object ButtonKick: TButton
      Left = 991
      Top = 18
      Width = 74
      Height = 25
      Caption = #24378#21046#19979#32447'(&K)'
      ModalResult = 1
      TabOrder = 5
      OnClick = ButtonSearchClick
    end
    object EditLevel: TSpinEdit
      Left = 720
      Top = 20
      Width = 57
      Height = 21
      MaxValue = 65535
      MinValue = 0
      TabOrder = 6
      Value = 100
    end
    object MenuButtonOffLine: TRzMenuButton
      Left = 1080
      Top = 18
      Width = 145
      Caption = #20840#37096#24378#21046#19979#32447'(&K)'
      TabOrder = 7
      DropDownMenu = PopupMenu
    end
    object CheckBoxHero: TCheckBox
      Left = 80
      Top = 23
      Width = 73
      Height = 17
      Caption = #26597#30475#33521#38596
      TabOrder = 8
      OnClick = CheckBoxHeroClick
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 368
    Top = 344
  end
  object PopupMenu: TPopupMenu
    Left = 784
    Top = 344
    object T1: TMenuItem
      Caption = '????'
      OnClick = T1Click
    end
    object T4: TMenuItem
      Caption = '?????'
      OnClick = T4Click
    end
    object T2: TMenuItem
      Caption = '????'
      OnClick = T2Click
    end
    object T5: TMenuItem
      Caption = '?????'
      OnClick = T5Click
    end
    object T3: TMenuItem
      Caption = '?????'
      Enabled = False
      Visible = False
      OnClick = T3Click
    end
  end
end
