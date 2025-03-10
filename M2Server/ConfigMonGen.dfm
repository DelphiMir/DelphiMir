object frmConfigMonGen: TfrmConfigMonGen
  Left = 302
  Top = 105
  Width = 918
  Height = 627
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21047#24618#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '???'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 5
    Width = 366
    Height = 580
    Caption = #24618#29289#21047#26032#21015#34920
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ListBoxMonGen: TListBox
      Left = 10
      Top = 22
      Width = 343
      Height = 515
      Hint = 'List of Spawned mobs and locations'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = '???'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 19
      ParentFont = False
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 381
    Top = 5
    Width = 516
    Height = 579
    Caption = #29190#29575#25991#20214#31649#29702
    TabOrder = 1
    object ListBox1: TListBox
      Left = 10
      Top = 18
      Width = 119
      Height = 519
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = '???'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 17
      ParentFont = False
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object Edit1: TEdit
      Left = 10
      Top = 543
      Width = 183
      Height = 26
      Hint = '??? ?? ?? ???? ????.'
      ImeName = 'Microsoft Office IME 2007'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object Button3: TButton
      Left = 432
      Top = 542
      Width = 73
      Height = 27
      Caption = #20445#23384'(&S)'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Memo1: TMemo
      Left = 135
      Top = 17
      Width = 370
      Height = 520
      Hint = #20462#25913#24618#29289#29190#29575'.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = '???'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object Button4: TButton
      Left = 201
      Top = 543
      Width = 88
      Height = 26
      Caption = #26597#25214'(&S)'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 326
      Top = 543
      Width = 75
      Height = 26
      Caption = #21047#26032#24618#29289
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object Button2: TButton
    Left = 287
    Top = 553
    Width = 75
    Height = 24
    Caption = #21047#26032
    TabOrder = 2
    OnClick = Button2Click
  end
end
