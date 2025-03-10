object frmMonsterConfig: TfrmMonsterConfig
  Left = 630
  Top = 245
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24618#29289#35774#32622
  ClientHeight = 261
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 5
    Top = 5
    Width = 396
    Height = 251
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412#21442#25968
      object GroupBox1: TGroupBox
        Left = 10
        Top = 10
        Width = 366
        Height = 196
        TabOrder = 0
        object GroupBox8: TGroupBox
          Left = 10
          Top = 20
          Width = 335
          Height = 96
          Caption = #37329#24065#29190#29575#35774#32622
          TabOrder = 0
          object Label23: TLabel
            Left = 14
            Top = 30
            Width = 42
            Height = 12
            Caption = #26368#22823#20540':'
          end
          object EditMonOneDropGoldCount: TSpinEdit
            Left = 70
            Top = 25
            Width = 96
            Height = 21
            Hint = 
              'The maximum gold that will drop from a mob in one pile before cr' +
              'eating a new one'
            MaxValue = 99999999
            MinValue = 1
            TabOrder = 0
            Value = 5000
            OnChange = EditMonOneDropGoldCountChange
          end
          object CheckBoxDropGoldToPlayBag: TCheckBox
            Left = 15
            Top = 60
            Width = 218
            Height = 21
            Caption = #37329#24065#30452#25509#36827#20837#32972#21253
            TabOrder = 1
            OnClick = CheckBoxDropGoldToPlayBagClick
          end
        end
        object ButtonGeneralSave: TButton
          Left = 240
          Top = 146
          Width = 81
          Height = 32
          Hint = 'Save settings'
          Caption = #20445#23384'(&S)'
          TabOrder = 1
          OnClick = ButtonGeneralSaveClick
        end
      end
    end
  end
end
