object frmEditRcd: TfrmEditRcd
  Left = 244
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Record Edit'
  ClientHeight = 390
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl: TPageControl
    Left = 10
    Top = 10
    Width = 607
    Height = 331
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #20462#25913#24080#25143
      object GroupBox1: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 55
          Width = 30
          Height = 12
          Caption = #35282#33394':'
        end
        object Label2: TLabel
          Left = 10
          Top = 85
          Width = 36
          Height = 12
          Caption = #29992#25143#21517
        end
        object Label3: TLabel
          Left = 10
          Top = 115
          Width = 48
          Height = 12
          Caption = #20179#24211#23494#30721
        end
        object Label11: TLabel
          Left = 10
          Top = 25
          Width = 24
          Height = 12
          Caption = #24207#21495
        end
        object Label12: TLabel
          Left = 210
          Top = 25
          Width = 48
          Height = 12
          Caption = #24403#21069#22320#22270
        end
        object Label13: TLabel
          Left = 210
          Top = 55
          Width = 54
          Height = 12
          Caption = #24403#21069#20301#32622' '
        end
        object Label14: TLabel
          Left = 210
          Top = 85
          Width = 12
          Height = 12
          Caption = '??'
        end
        object Label15: TLabel
          Left = 210
          Top = 115
          Width = 18
          Height = 12
          Caption = '???'
        end
        object EditChrName: TEdit
          Left = 80
          Top = 50
          Width = 121
          Height = 20
          Color = cl3DLight
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditAccount: TEdit
          Left = 80
          Top = 80
          Width = 121
          Height = 20
          Color = cl3DLight
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
        object EditPassword: TEdit
          Left = 80
          Top = 110
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
          OnChange = EditPasswordChange
        end
        object EditIdx: TEdit
          Left = 80
          Top = 20
          Width = 121
          Height = 20
          Color = cl3DLight
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object EditCurMap: TEdit
          Left = 312
          Top = 20
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 4
          OnChange = EditPasswordChange
        end
        object EditCurX: TSpinEdit
          Left = 312
          Top = 50
          Width = 61
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditCurY: TSpinEdit
          Left = 372
          Top = 50
          Width = 61
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditHomeMap: TEdit
          Left = 312
          Top = 80
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          OnClick = EditPasswordChange
        end
        object EditHomeX: TSpinEdit
          Left = 312
          Top = 110
          Width = 61
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 8
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditHomeY: TSpinEdit
          Left = 372
          Top = 110
          Width = 61
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 9
          Value = 0
          OnChange = EditPasswordChange
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #37197#32622#36134#25143
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object Label6: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #31561#32423' '
        end
        object Label7: TLabel
          Left = 10
          Top = 55
          Width = 30
          Height = 12
          Caption = #37329#38065' '
        end
        object Label8: TLabel
          Left = 10
          Top = 85
          Width = 54
          Height = 12
          Caption = 'GameGold:'
        end
        object Label9: TLabel
          Left = 10
          Top = 115
          Width = 66
          Height = 12
          Caption = 'Game-Point:'
        end
        object Label10: TLabel
          Left = 10
          Top = 145
          Width = 60
          Height = 12
          Caption = 'Pay-Point:'
        end
        object Label17: TLabel
          Left = 10
          Top = 173
          Width = 54
          Height = 12
          Caption = 'PK-Point:'
        end
        object EditLevel: TSpinEdit
          Left = 96
          Top = 20
          Width = 81
          Height = 21
          MaxValue = 65535
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGold: TSpinEdit
          Left = 96
          Top = 50
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGameGold: TSpinEdit
          Left = 96
          Top = 80
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGamePoint: TSpinEdit
          Left = 96
          Top = 110
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditPayPoint: TSpinEdit
          Left = 96
          Top = 140
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditPKPoint: TSpinEdit
          Left = 96
          Top = 168
          Width = 81
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnChange = EditPasswordChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25216#33021
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 10
        Top = 10
        Width = 455
        Height = 271
        TabOrder = 0
        object ListViewMagic: TListView
          Left = 11
          Top = 12
          Width = 431
          Height = 231
          Columns = <
            item
              Caption = 'ID'
            end
            item
              Caption = 'index'
              Width = 63
            end
            item
              Caption = #25216#33021#21517
              Width = 100
            end
            item
              Caption = #25216#33021#31561#32423
            end
            item
              Caption = #25216#33021#29087#32451#24230
              Width = 75
            end
            item
              Caption = #26368#22823#20540
              Width = 63
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #32972#21253#29289#21697
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 10
        Top = 10
        Width = 583
        Height = 271
        TabOrder = 0
        object ListViewUserItem: TListView
          Left = 9
          Top = 20
          Width = 559
          Height = 231
          Columns = <
            item
              Caption = #24207#21495
            end
            item
              Caption = #29289#21697#20215#20540
              Width = 100
            end
            item
              Caption = #29289#21697#22270#29255
              Width = 63
            end
            item
              Caption = #29289#21697
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = #25345#20037
              Width = 113
            end
            item
              Caption = #21319#32423
              Width = 275
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #20179#24211#29289#21697
      ImageIndex = 4
      object GroupBox5: TGroupBox
        Left = 10
        Top = 10
        Width = 583
        Height = 271
        TabOrder = 0
        object ListViewStorage: TListView
          Left = 10
          Top = 20
          Width = 559
          Height = 231
          Columns = <
            item
              Caption = #24207#21495
            end
            item
              Caption = #29289#21697#20215#20540
              Width = 100
            end
            item
              Caption = #29289#21697#22270#29255
              Width = 63
            end
            item
              Caption = #29289#21697
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = #25345#20037
              Width = 113
            end
            item
              Caption = #21319#32423
              Width = 275
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
  object ButtonSaveData: TButton
    Left = 10
    Top = 350
    Width = 101
    Height = 31
    Caption = #20445#23384
    TabOrder = 1
    OnClick = ButtonExportDataClick
  end
  object ButtonExportData: TButton
    Left = 128
    Top = 350
    Width = 101
    Height = 31
    Caption = 'DB'#20445#23384
    TabOrder = 2
    OnClick = ButtonExportDataClick
  end
  object ButtonImportData: TButton
    Left = 230
    Top = 350
    Width = 101
    Height = 31
    Caption = #37325#26032#21152#36733
    TabOrder = 3
    OnClick = ButtonExportDataClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'hum'
    Filter = 'Character Data (*.hum)|*.hum'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 296
    Top = 280
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'hum'
    Filter = 'Character Data (*.hum)|*.hum'
    Left = 336
    Top = 280
  end
end
