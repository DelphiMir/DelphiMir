object frmHumanInfo: TfrmHumanInfo
  Left = 711
  Top = 341
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20154#29289#20449#24687
  ClientHeight = 419
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 791
    Height = 301
    ActivePage = TabSheet6
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #35282#33394#20449#24687
      object Label20: TLabel
        Left = 280
        Top = 48
        Width = 84
        Height = 12
        Caption = #35745#31639#26426#20195#30721' :  '
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 16
        Width = 251
        Height = 242
        Caption = #20449#24687
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 24
          Width = 54
          Height = 12
          Caption = #35282#33394#21517#23383':'
        end
        object Label2: TLabel
          Left = 10
          Top = 54
          Width = 54
          Height = 12
          Caption = #25152#22312#22320#22270':'
        end
        object Label3: TLabel
          Left = 10
          Top = 84
          Width = 54
          Height = 12
          Caption = #25152#22312#22352#26631':'
        end
        object Label4: TLabel
          Left = 10
          Top = 114
          Width = 54
          Height = 12
          Caption = #30331#24405#36134#21495':'
        end
        object Label5: TLabel
          Left = 10
          Top = 144
          Width = 48
          Height = 12
          Caption = #30331#24405' IP:'
        end
        object Label6: TLabel
          Left = 10
          Top = 174
          Width = 54
          Height = 12
          Caption = #30331#38470#26102#38388':'
        end
        object Label7: TLabel
          Left = 10
          Top = 204
          Width = 54
          Height = 12
          Caption = #22312#32447#26102#38388':'
        end
        object EditName: TEdit
          Left = 80
          Top = 20
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
          Text = 'EditName'
        end
        object EditMap: TEdit
          Left = 80
          Top = 50
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
          Text = 'Edit1'
        end
        object EditXY: TEdit
          Left = 80
          Top = 80
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
          Text = 'Edit1'
        end
        object EditAccount: TEdit
          Left = 80
          Top = 110
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
          Text = 'Edit1'
        end
        object EditIPaddr: TEdit
          Left = 80
          Top = 140
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 4
          Text = 'Edit1'
        end
        object EditLogonTime: TEdit
          Left = 80
          Top = 170
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 5
          Text = 'Edit1'
        end
        object EditLogonLong: TEdit
          Left = 80
          Top = 200
          Width = 161
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 6
          Text = 'Edit1'
        end
      end
      object EditCodeName: TEdit
        Left = 360
        Top = 48
        Width = 121
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ReadOnly = True
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20854#23427#20449#24687
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 151
        Caption = #22522#26412#20449#24687
        TabOrder = 0
        object Label12: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #35282#33394#31561#32423':'
        end
        object Label8: TLabel
          Left = 10
          Top = 53
          Width = 54
          Height = 12
          Caption = #37329#24065#25968#37327':'
        end
        object Label9: TLabel
          Left = 10
          Top = 83
          Width = 54
          Height = 12
          Caption = 'PK'#20540#28857#25968':'
        end
        object Label10: TLabel
          Left = 10
          Top = 113
          Width = 54
          Height = 12
          Caption = #24403#21069#32463#39564':'
        end
        object EditLevel: TSpinEdit
          Left = 85
          Top = 19
          Width = 86
          Height = 21
          MaxValue = 20000
          MinValue = 0
          TabOrder = 0
          Value = 10
        end
        object EditGold: TSpinEdit
          Left = 85
          Top = 49
          Width = 86
          Height = 21
          Increment = 1000
          MaxValue = 200000000
          MinValue = 0
          TabOrder = 1
          Value = 10
        end
        object EditPKPoint: TSpinEdit
          Left = 85
          Top = 79
          Width = 86
          Height = 21
          Increment = 50
          MaxValue = 20000
          MinValue = 0
          TabOrder = 2
          Value = 10
        end
        object EditExp: TSpinEdit
          Left = 85
          Top = 109
          Width = 86
          Height = 21
          EditorEnabled = False
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 10
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 170
        Width = 191
        Height = 91
        Caption = #26435#38480
        TabOrder = 1
        object CheckBoxGameMaster: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = #31649#29702#27169#24335
          TabOrder = 0
        end
        object CheckBoxSuperMan: TCheckBox
          Left = 10
          Top = 40
          Width = 141
          Height = 21
          Caption = #26080#25932#27169#24335
          TabOrder = 1
        end
        object CheckBoxObserver: TCheckBox
          Left = 10
          Top = 60
          Width = 141
          Height = 21
          Caption = #38544#36523#27169#24335
          TabOrder = 2
        end
      end
      object GroupBox9: TGroupBox
        Left = 210
        Top = 10
        Width = 231
        Height = 251
        Caption = #20854#23427#20449#24687
        TabOrder = 2
        object Label26: TLabel
          Left = 10
          Top = 53
          Width = 54
          Height = 12
          Caption = #28857#21048#25968#37327':'
        end
        object Label27: TLabel
          Left = 10
          Top = 83
          Width = 54
          Height = 12
          Caption = #28216#25103#31215#20998':'
        end
        object Label29: TLabel
          Left = 10
          Top = 111
          Width = 54
          Height = 12
          Caption = #22870#21169#31215#20998':'
        end
        object Label19: TLabel
          Left = 10
          Top = 141
          Width = 66
          Height = 12
          Hint = #24050#20998#37197'?'#24615#28857'?'#12290
          Caption = #24635#22870#21169#31215#20998':'
        end
        object EditGameGold: TSpinEdit
          Left = 109
          Top = 49
          Width = 86
          Height = 21
          MaxValue = 20000000
          MinValue = 0
          TabOrder = 0
          Value = 10
        end
        object EditGamePoint: TSpinEdit
          Left = 109
          Top = 79
          Width = 86
          Height = 21
          MaxValue = 200000000
          MinValue = 0
          TabOrder = 1
          Value = 10
        end
        object EditBonusPoint: TSpinEdit
          Left = 109
          Top = 107
          Width = 86
          Height = 21
          Hint = #26410#20998#37197'?'#24615#28857
          MaxValue = 2000000
          MinValue = 0
          TabOrder = 2
          Value = 10
        end
        object EditEditBonusPointUsed: TSpinEdit
          Left = 109
          Top = 137
          Width = 86
          Height = 21
          Hint = #26410#20998#37197'?'#24615#28857
          EditorEnabled = False
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 10
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #23646#24615
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 241
        Caption = #23646#24615
        TabOrder = 0
        object Label11: TLabel
          Left = 10
          Top = 24
          Width = 42
          Height = 12
          Caption = #38450#24481#20540':'
        end
        object Label13: TLabel
          Left = 10
          Top = 54
          Width = 42
          Height = 12
          Caption = #39764#24481#20540':'
        end
        object Label14: TLabel
          Left = 10
          Top = 84
          Width = 42
          Height = 12
          Caption = #25915#20987#21147':'
        end
        object Label15: TLabel
          Left = 10
          Top = 114
          Width = 42
          Height = 12
          Caption = #39764#27861#21147':'
        end
        object Label16: TLabel
          Left = 10
          Top = 144
          Width = 42
          Height = 12
          Caption = #31934#31070#21147':'
        end
        object Label17: TLabel
          Left = 10
          Top = 174
          Width = 42
          Height = 12
          Caption = #29983#21629#20540':'
        end
        object Label18: TLabel
          Left = 10
          Top = 204
          Width = 42
          Height = 12
          Caption = #39764#27861#20540':'
        end
        object EditAC: TEdit
          Left = 70
          Top = 20
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
          Text = 'EditName'
        end
        object EditMAC: TEdit
          Left = 70
          Top = 50
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
          Text = 'EditName'
        end
        object EditDC: TEdit
          Left = 70
          Top = 80
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
          Text = 'EditName'
        end
        object EditMC: TEdit
          Left = 70
          Top = 110
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
          Text = 'EditName'
        end
        object EditSC: TEdit
          Left = 70
          Top = 140
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 4
          Text = 'EditName'
        end
        object EditHP: TEdit
          Left = 70
          Top = 170
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 5
          Text = 'EditName'
        end
        object EditMP: TEdit
          Left = 70
          Top = 200
          Width = 101
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 6
          Text = 'EditName'
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #36523#19978#29289#21697
      ImageIndex = 3
      object GroupBox7: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = #36523#19978#29289#21697
        TabOrder = 0
        object GridUserItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 70
          DefaultRowHeight = 18
          RowCount = 15
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            70
            70
            90
            90
            53
            51
            52
            53
            54
            270)
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #32972#21253#29289#21697
      ImageIndex = 4
      object GroupBox8: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = #32972#21253#29289#21697
        TabOrder = 0
        object GridBagItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 70
          DefaultRowHeight = 18
          RowCount = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            70
            70
            98
            95
            58
            54
            53
            53
            53
            235)
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #20179#24211#29289#21697
      ImageIndex = 5
      object GroupBox10: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = #20179#24211#29289#21697
        TabOrder = 0
        object GridStorageItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 70
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            60
            70
            87
            89
            60
            58
            57
            57
            56
            258)
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 10
    Top = 320
    Width = 181
    Height = 91
    Caption = #35774#32622
    TabOrder = 1
    object CheckBoxMonitor: TCheckBox
      Left = 10
      Top = 20
      Width = 143
      Height = 21
      Caption = #31105#27490#20351#29992#23384#20648#21151#33021
      TabOrder = 0
      OnClick = CheckBoxMonitorClick
    end
    object ButtonKick: TButton
      Left = 10
      Top = 50
      Width = 81
      Height = 31
      Caption = #36386#19979#32447'(Kick)'
      TabOrder = 1
      OnClick = ButtonKickClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 200
    Top = 320
    Width = 151
    Height = 91
    Caption = #29366#24577' '
    TabOrder = 2
    object EditHumanStatus: TEdit
      Left = 10
      Top = 30
      Width = 131
      Height = 20
      ImeName = 'Microsoft Office IME 2007'
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ButtonSave: TButton
    Left = 420
    Top = 370
    Width = 81
    Height = 31
    Caption = #20445#23384
    TabOrder = 3
    OnClick = ButtonSaveClick
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 144
    Top = 264
  end
end
