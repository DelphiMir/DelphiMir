object FrmRegistryDlg: TFrmRegistryDlg
  Left = 433
  Top = 425
  Width = 383
  Height = 441
  BiDiMode = bdLeftToRight
  Caption = #27880#20876#31995#32479' '
  Color = clBtnHighlight
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 353
    Height = 249
    Caption = #35768#21487#35777
    Color = clHighlightText
    ParentColor = False
    TabOrder = 0
    object ButtonCancel: TButton
      Left = 246
      Top = 64
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = ButtonCancelClick
    end
    object gim: TComboBox
      Left = 8
      Top = 20
      Width = 217
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 1
      Text = 'gimAuto'
      Items.Strings = (
        'gimAuto'
        'gimNT'
        'gimScsi'
        'gim9x'
        'gimByName')
    end
    object cb: TComboBox
      Left = 8
      Top = 44
      Width = 217
      Height = 20
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      ItemIndex = 0
      TabOrder = 2
      Text = 'IDE Primary Master'
      Items.Strings = (
        'IDE Primary Master'
        'IDE Primary Slave'
        'IDE Secondary Master'
        'IDE Secondary Slave'
        'IDE Tertiary Master'
        'IDE Tertiary Slave'
        'IDE Quaternary Master'
        'IDE Quaternary Slave')
    end
    object DName: TComboBox
      Left = 8
      Top = 68
      Width = 217
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      TabOrder = 3
      Text = 'PhysicalDrive0'
      Items.Strings = (
        'PhysicalDrive0'
        'PhysicalDrive1'
        'PhysicalDrive2'
        'PhysicalDrive3'
        'CDROM0'
        'CDROM1'
        'Tape0'
        'Tape1'
        'C:'
        'D:'
        'E:'
        'F:')
    end
    object Port: TEdit
      Left = 8
      Top = 92
      Width = 49
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
      Text = '0'
    end
    object Button2: TButton
      Left = 80
      Top = 90
      Width = 75
      Height = 25
      Caption = 'Scan Scsi'
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 246
      Top = 26
      Width = 75
      Height = 25
      Caption = #25552#21462
      TabOrder = 6
      OnClick = Button1Click
    end
    object Inf: TMemo
      Left = 0
      Top = 120
      Width = 353
      Height = 129
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 7
    end
  end
  object Edit1: TEdit
    Left = 16
    Top = 272
    Width = 321
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 16
    Top = 304
    Width = 321
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 16
    Top = 336
    Width = 321
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 80
    Top = 368
    Width = 75
    Height = 25
    Caption = #36716#25442' '
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 368
    Width = 75
    Height = 25
    Caption = #24674#22797' '
    TabOrder = 5
    OnClick = Button4Click
  end
  object hdd: THDDInfo
    Left = 200
    Top = 96
  end
end
