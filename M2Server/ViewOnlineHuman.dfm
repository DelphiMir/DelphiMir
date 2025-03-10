object frmViewOnlineHuman: TfrmViewOnlineHuman
  Left = 734
  Top = 364
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#32447#29609#23478
  ClientHeight = 275
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 121
    Top = 250
    Width = 30
    Height = 13
    Caption = #20998#31867' :'
  end
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 822
    Height = 235
    Align = alTop
    Caption = '??????...'
    TabOrder = 0
    object GridHuman: TStringGrid
      Left = 1
      Top = 1
      Width = 820
      Height = 233
      Align = alClient
      ColCount = 15
      DefaultRowHeight = 18
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDblClick = GridHumanDblClick
      ColWidths = (
        33
        78
        31
        44
        39
        37
        47
        74
        116
        40
        46
        46
        44
        43
        79)
    end
  end
  object ButtonRefGrid: TButton
    Left = 9
    Top = 244
    Width = 79
    Height = 27
    Hint = 'Refresh the list'
    Caption = #21047#26032'(&R)'
    TabOrder = 1
    OnClick = ButtonRefGridClick
  end
  object ComboBoxSort: TComboBox
    Left = 161
    Top = 248
    Width = 122
    Height = 21
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 13
    TabOrder = 2
    OnClick = ComboBoxSortClick
    Items.Strings = (
      'Name'
      'Gender'
      'Job'
      'Level'
      'Map'
      'IP Address'
      'Permission Level'
      'Gold'
      'GameGold')
  end
  object EditSearchName: TEdit
    Left = 347
    Top = 249
    Width = 139
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 3
  end
  object ButtonSearch: TButton
    Left = 494
    Top = 244
    Width = 79
    Height = 27
    Caption = #26597#25214'(&S)'
    TabOrder = 4
    OnClick = ButtonSearchClick
  end
  object ButtonView: TButton
    Left = 724
    Top = 244
    Width = 87
    Height = 27
    Hint = 'View the selected characters full data card'
    Caption = #26174#31034'(&V)'
    TabOrder = 5
    OnClick = ButtonViewClick
  end
  object Timer: TTimer
    Enabled = False
    Left = 288
    Top = 232
  end
end
