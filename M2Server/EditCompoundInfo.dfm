object EditCompoundInfoForm: TEditCompoundInfoForm
  Left = 816
  Top = 333
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21512#25104#35774#32622
  ClientHeight = 116
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 13
    Width = 59
    Height = 13
    Caption = #24378#21270#36873#39033' '
  end
  object Label2: TLabel
    Left = 183
    Top = 45
    Width = 3
    Height = 13
    Caption = '-'
  end
  object Label3: TLabel
    Left = 6
    Top = 48
    Width = 59
    Height = 13
    Caption = #21512#25104#27010#29575
  end
  object eLowValue: TEdit
    Left = 72
    Top = 10
    Width = 58
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
    Text = #26368#23567#20540' '
  end
  object eHighValue: TEdit
    Left = 152
    Top = 10
    Width = 57
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
    Text = #26368#22823#20540' '
  end
  object eRate: TEdit
    Left = 72
    Top = 45
    Width = 137
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
    Text = #26426#29575' '
  end
  object BtnOK: TButton
    Left = 8
    Top = 81
    Width = 75
    Height = 25
    Caption = #20445#23384'(&O)'
    ModalResult = 1
    TabOrder = 3
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 128
    Top = 81
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 4
  end
end
