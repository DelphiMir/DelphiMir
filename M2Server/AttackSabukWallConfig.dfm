object FrmAttackSabukWall: TFrmAttackSabukWall
  Left = 513
  Top = 235
  BorderStyle = bsDialog
  Caption = 'FrmAttackSabukWall'
  ClientHeight = 450
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 10
    Top = 385
    Width = 54
    Height = 12
    Caption = #34892#20250#21517#23383':'
  end
  object Label2: TLabel
    Left = 10
    Top = 415
    Width = 54
    Height = 12
    Caption = #25915#22478#26085#26399':'
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 348
    Height = 361
    Caption = #34892#20250#21015#34920
    TabOrder = 0
    object ListBoxGuild: TListBox
      Left = 10
      Top = 20
      Width = 327
      Height = 331
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      TabOrder = 0
      OnClick = ListBoxGuildClick
    end
  end
  object EditGuildName: TEdit
    Left = 72
    Top = 380
    Width = 171
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
    Text = 'EditGuildName'
  end
  object RzDateTimeEditAttackDate: TRzDateTimeEdit
    Left = 72
    Top = 410
    Width = 171
    Height = 20
    CaptionTodayBtn = #20170#22825#26085#26399
    CaptionClearBtn = '?'#38500#26085#26399
    EditType = etDate
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object ButtonOK: TButton
    Left = 260
    Top = 410
    Width = 94
    Height = 31
    Caption = #30830#23450'(&O)'
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object CheckBoxAll: TCheckBox
    Left = 262
    Top = 380
    Width = 91
    Height = 21
    Caption = #20840#37096#28155#21152
    TabOrder = 4
    OnClick = CheckBoxAllClick
  end
end
