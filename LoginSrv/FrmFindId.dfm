object FrmFindUserId: TFrmFindUserId
  Left = 542
  Top = 367
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ID-Tool'
  ClientHeight = 319
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object IdGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 945
    Height = 271
    Align = alClient
    ColCount = 16
    DefaultRowHeight = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    TabOrder = 0
    OnDblClick = BtnEditClick
    ColWidths = (
      64
      64
      71
      105
      91
      150
      141
      169
      170
      83
      90
      72
      76
      182
      159
      218)
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 945
    Height = 48
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 15
      Width = 42
      Height = 12
      Caption = #29992#25143#21517':'
    end
    object EdFindId: TEdit
      Left = 70
      Top = 10
      Width = 151
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
      OnKeyPress = EdFindIdKeyPress
    end
    object BtnFindAll: TButton
      Left = 240
      Top = 10
      Width = 71
      Height = 26
      Caption = #26597#25214'(&S)'
      TabOrder = 1
      OnClick = BtnFindAllClick
    end
    object Button1: TButton
      Left = 720
      Top = 13
      Width = 176
      Height = 26
      Caption = #21047#26032
      TabOrder = 2
      OnClick = Button1Click
    end
    object BtnEdit: TButton
      Left = 360
      Top = 10
      Width = 94
      Height = 26
      Caption = #26597#30475#20449#24687'(&E)'
      TabOrder = 3
      OnClick = BtnEditClick
    end
    object Button2: TButton
      Left = 486
      Top = 10
      Width = 94
      Height = 26
      Caption = #21019#24314'(&N)'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
end
