object FormVersion: TFormVersion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #51217#49549#51228#54620
  ClientHeight = 74
  ClientWidth = 406
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 29
    Height = 13
    Caption = 'Major:'
  end
  object lbl2: TLabel
    Left = 104
    Top = 16
    Width = 29
    Height = 13
    Caption = 'Minor:'
  end
  object lbl3: TLabel
    Left = 200
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Release:'
  end
  object lbl4: TLabel
    Left = 309
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Build:'
  end
  object seMajor: TSpinEdit
    Left = 44
    Top = 13
    Width = 53
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 0
    Value = 65535
    OnChange = seMajorChange
  end
  object seMinor: TSpinEdit
    Left = 140
    Top = 13
    Width = 53
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 1
    Value = 65535
    OnChange = seMinorChange
  end
  object seRelease: TSpinEdit
    Left = 249
    Top = 13
    Width = 53
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 2
    Value = 65535
    OnChange = seReleaseChange
  end
  object seBuild: TSpinEdit
    Left = 345
    Top = 13
    Width = 53
    Height = 22
    MaxValue = 65535
    MinValue = 0
    TabOrder = 3
    Value = 65535
    OnChange = seBuildChange
  end
  object btn1: TButton
    Left = 323
    Top = 40
    Width = 75
    Height = 25
    Caption = #51200#51109
    TabOrder = 4
    OnClick = btn1Click
  end
end
