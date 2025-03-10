object LoginDialog: TLoginDialog
  Left = 375
  Top = 289
  Width = 251
  Height = 180
  Caption = #25968#25454#24211#30331#24405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OKButton: TButton
    Left = 29
    Top = 114
    Width = 75
    Height = 25
    Cancel = True
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 134
    Top = 114
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object Panel: TPanel
    Left = 8
    Top = 7
    Width = 220
    Height = 98
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label3: TLabel
      Left = 10
      Top = 6
      Width = 39
      Height = 13
      Caption = #25968#25454#24211':'
    end
    object DatabaseName: TLabel
      Left = 91
      Top = 6
      Width = 3
      Height = 13
    end
    object Bevel: TBevel
      Left = 1
      Top = 24
      Width = 254
      Height = 9
      Shape = bsTopLine
    end
    object Panel1: TPanel
      Left = 2
      Top = 31
      Width = 215
      Height = 65
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 39
        Height = 13
        Caption = '&'#36134'    '#21495':'
        FocusControl = UserName
      end
      object Label2: TLabel
        Left = 8
        Top = 36
        Width = 39
        Height = 13
        Caption = '&'#23494'    '#30721':'
        FocusControl = Password
      end
      object UserName: TEdit
        Left = 54
        Top = 5
        Width = 153
        Height = 21
        Hint = 'Enter your database username'
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 31
        TabOrder = 0
      end
      object Password: TEdit
        Left = 54
        Top = 33
        Width = 153
        Height = 21
        Hint = 'Enter the password to access the database'
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 31
        PasswordChar = '*'
        TabOrder = 1
      end
    end
  end
end
