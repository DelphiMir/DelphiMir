object Form1: TForm1
  Left = 443
  Top = 167
  Width = 356
  Height = 542
  Caption = 'Macros Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 40
    Top = 32
    Width = 265
    Height = 129
    Caption = 'Encode Macro'
    TabOrder = 0
    object Button1: TButton
      Left = 48
      Top = 24
      Width = 169
      Height = 25
      Caption = 'Execute Encode Macro #1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 48
      Top = 56
      Width = 169
      Height = 25
      Caption = 'Execute Encode Macro #2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 48
      Top = 88
      Width = 169
      Height = 25
      Caption = 'Execute Encode Macro #3'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 40
    Top = 176
    Width = 265
    Height = 105
    Caption = 'Clear Macro'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 64
      Width = 214
      Height = 13
      Caption = 'The code inside the macro has been deleted.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label2: TLabel
      Left = 8
      Top = 80
      Width = 248
      Height = 13
      Caption = 'If you run the macro again, an exception might occur'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Button4: TButton
      Left = 48
      Top = 24
      Width = 169
      Height = 25
      Caption = 'Execute Clear Macro #1'
      TabOrder = 0
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 40
    Top = 296
    Width = 265
    Height = 129
    Caption = 'Remove Block Macro'
    TabOrder = 2
    object Button5: TButton
      Left = 48
      Top = 24
      Width = 169
      Height = 25
      Caption = 'Execute CodeReplace Macro #1'
      TabOrder = 0
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 48
      Top = 56
      Width = 169
      Height = 25
      Caption = 'Execute CodeReplace Macro #2'
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 48
      Top = 88
      Width = 169
      Height = 25
      Caption = 'Execute CodeReplace Macro #3'
      TabOrder = 2
      OnClick = Button7Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 40
    Top = 440
    Width = 265
    Height = 64
    Caption = 'Registered Macro'
    TabOrder = 3
    object Button8: TButton
      Left = 56
      Top = 25
      Width = 161
      Height = 23
      Caption = 'Execute Registered Macro'
      TabOrder = 0
      OnClick = Button8Click
    end
  end
end
