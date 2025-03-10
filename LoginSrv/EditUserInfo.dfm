object FrmUserInfoEdit: TFrmUserInfoEdit
  Left = 378
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#20449#24687
  ClientHeight = 518
  ClientWidth = 385
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
    Left = 46
    Top = 20
    Width = 42
    Height = 12
    Alignment = taRightJustify
    Caption = #29992#25143#21517':'
  end
  object Label2: TLabel
    Left = 58
    Top = 50
    Width = 30
    Height = 12
    Alignment = taRightJustify
    Caption = #23494#30721':'
  end
  object Label3: TLabel
    Left = 58
    Top = 80
    Width = 30
    Height = 12
    Alignment = taRightJustify
    Caption = #21517#23383':'
  end
  object Label4: TLabel
    Left = 34
    Top = 140
    Width = 54
    Height = 12
    Alignment = taRightJustify
    Caption = #20986#29983#26085#26399':'
  end
  object Label5: TLabel
    Left = 58
    Top = 290
    Width = 30
    Height = 12
    Alignment = taRightJustify
    Caption = #30005#35805':'
  end
  object Label9: TLabel
    Left = 34
    Top = 110
    Width = 54
    Height = 12
    Alignment = taRightJustify
    Caption = #35777#20214#21495#30721':'
  end
  object Label6: TLabel
    Left = 46
    Top = 170
    Width = 42
    Height = 12
    Alignment = taRightJustify
    Caption = #38382#39064'.1:'
  end
  object Label7: TLabel
    Left = 46
    Top = 200
    Width = 42
    Height = 12
    Alignment = taRightJustify
    Caption = #31572#26696'.1:'
  end
  object Label10: TLabel
    Left = 46
    Top = 230
    Width = 42
    Height = 12
    Alignment = taRightJustify
    Caption = #38382#39064'.2:'
  end
  object Label11: TLabel
    Left = 46
    Top = 260
    Width = 42
    Height = 12
    Alignment = taRightJustify
    Caption = #31572#26696'.2:'
  end
  object Label12: TLabel
    Left = 34
    Top = 320
    Width = 54
    Height = 12
    Alignment = taRightJustify
    Caption = #31227#21160#30005#35805':'
  end
  object Label13: TLabel
    Left = 34
    Top = 350
    Width = 54
    Height = 12
    Alignment = taRightJustify
    Caption = #22791#24536#24405'.1:'
  end
  object Label14: TLabel
    Left = 34
    Top = 380
    Width = 54
    Height = 12
    Alignment = taRightJustify
    Caption = #22791#24536#24405'.2:'
  end
  object Label8: TLabel
    Left = 28
    Top = 410
    Width = 60
    Height = 12
    Alignment = taRightJustify
    Caption = #30005#23376#37038#20214'l:'
  end
  object EdId: TEdit
    Left = 100
    Top = 20
    Width = 151
    Height = 20
    Enabled = False
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 10
    TabOrder = 0
  end
  object EdPasswd: TEdit
    Left = 100
    Top = 50
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 10
    TabOrder = 1
  end
  object EdUserName: TEdit
    Left = 100
    Top = 80
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 20
    TabOrder = 2
  end
  object EdBirthDay: TEdit
    Left = 100
    Top = 140
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 10
    TabOrder = 4
  end
  object EdPhone: TEdit
    Left = 100
    Top = 290
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 14
    TabOrder = 9
  end
  object Button1: TButton
    Left = 74
    Top = 470
    Width = 94
    Height = 31
    Caption = #20445#23384'(&O)'
    ModalResult = 1
    TabOrder = 14
  end
  object Button2: TButton
    Left = 236
    Top = 470
    Width = 94
    Height = 31
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 15
  end
  object CkFullEdit: TCheckBox
    Left = 270
    Top = 20
    Width = 91
    Height = 21
    Caption = #26356#25913' '
    TabOrder = 16
    OnClick = CkFullEditClick
  end
  object EdSSNo: TEdit
    Left = 100
    Top = 110
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 14
    TabOrder = 3
  end
  object EdQuiz: TEdit
    Left = 100
    Top = 170
    Width = 261
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 20
    TabOrder = 5
  end
  object EdAnswer: TEdit
    Left = 100
    Top = 200
    Width = 261
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 12
    TabOrder = 6
  end
  object EdQuiz2: TEdit
    Left = 100
    Top = 230
    Width = 261
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 20
    TabOrder = 7
  end
  object EdAnswer2: TEdit
    Left = 100
    Top = 260
    Width = 261
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 12
    TabOrder = 8
  end
  object EdMobilePhone: TEdit
    Left = 100
    Top = 320
    Width = 151
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 13
    TabOrder = 10
  end
  object EdMemo1: TEdit
    Left = 100
    Top = 350
    Width = 231
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 20
    TabOrder = 11
  end
  object EdMemo2: TEdit
    Left = 100
    Top = 380
    Width = 231
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 20
    TabOrder = 12
  end
  object EdEMail: TEdit
    Left = 100
    Top = 410
    Width = 261
    Height = 20
    ImeName = 'Microsoft Office IME 2007'
    MaxLength = 40
    TabOrder = 13
  end
end
