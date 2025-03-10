object frmViewKernelInfo: TfrmViewKernelInfo
  Left = 462
  Top = 277
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20869#26680#25968#25454#26597#30475
  ClientHeight = 280
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 359
    Height = 261
    ActivePage = TabSheet5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = #31995#32479#25968#25454
      ImageIndex = 3
      object GroupBox6: TGroupBox
        Left = 10
        Top = 10
        Width = 199
        Height = 95
        Caption = #20869#23384#20998#37197
        TabOrder = 0
        object Label25: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #20869#23384#22823#23567':'
        end
        object Label26: TLabel
          Left = 10
          Top = 47
          Width = 66
          Height = 12
          Caption = #20869#23384#22359#25968#37327':'
        end
        object EditAllocMemCount: TEdit
          Left = 78
          Top = 42
          Width = 91
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditAllocMemSize: TEdit
          Left = 78
          Top = 20
          Width = 91
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #28216#25103#25968#25454
      object GroupBox1: TGroupBox
        Left = 2
        Top = 5
        Width = 159
        Height = 116
        Caption = #28216#25103#25968#25454#24211
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 25
          Width = 78
          Height = 12
          Caption = #35835#21462#35831#27714#27425#25968':'
        end
        object Label2: TLabel
          Left = 10
          Top = 47
          Width = 78
          Height = 12
          Caption = #35835#21462#22833#36133#27425#25968':'
        end
        object Label3: TLabel
          Left = 10
          Top = 69
          Width = 78
          Height = 12
          Caption = #20445#23384#35831#27714#27425#25968':'
        end
        object Label4: TLabel
          Left = 10
          Top = 91
          Width = 78
          Height = 12
          Caption = #35831#27714#26631#35782#25968#23383':'
        end
        object EditLoadHumanDBCount: TEdit
          Left = 94
          Top = 20
          Width = 51
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditLoadHumanDBErrorCoun: TEdit
          Left = 94
          Top = 42
          Width = 51
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
        object EditSaveHumanDBCount: TEdit
          Left = 94
          Top = 64
          Width = 51
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
        end
        object EditHumanDBQueryID: TEdit
          Left = 94
          Top = 86
          Width = 51
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 170
        Top = 5
        Width = 175
        Height = 76
        Caption = #29289#21697#31995#21015#24207#21495
        TabOrder = 1
        object Label7: TLabel
          Left = 10
          Top = 25
          Width = 78
          Height = 12
          Caption = #24618#29289#25481#33853#29289#21697':'
        end
        object Label8: TLabel
          Left = 10
          Top = 47
          Width = 78
          Height = 12
          Caption = #21629#20196#21046#36896#29289#21697':'
        end
        object EditItemNumber: TEdit
          Left = 94
          Top = 20
          Width = 67
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditItemNumberEx: TEdit
          Left = 94
          Top = 42
          Width = 67
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24425#31080#25968#25454
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object GroupBox2: TGroupBox
        Left = 10
        Top = 5
        Width = 151
        Height = 84
        Caption = #20013#22870#25968#37327
        TabOrder = 0
        object Label5: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #20013#22870#24635#25968':'
        end
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #26410#20013#22870#25968':'
        end
        object EditWinLotteryCount: TEdit
          Left = 70
          Top = 20
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditNoWinLotteryCount: TEdit
          Left = 70
          Top = 50
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 170
        Top = 5
        Width = 143
        Height = 172
        Caption = #20013#22870#27604#20363
        TabOrder = 1
        object Label9: TLabel
          Left = 10
          Top = 25
          Width = 42
          Height = 12
          Caption = #19968#31561#22870':'
        end
        object Label10: TLabel
          Left = 10
          Top = 47
          Width = 42
          Height = 12
          Caption = #20108#31561#22870':'
        end
        object Label11: TLabel
          Left = 10
          Top = 69
          Width = 42
          Height = 12
          Caption = #19977#31561#22870':'
        end
        object Label12: TLabel
          Left = 10
          Top = 91
          Width = 42
          Height = 12
          Caption = #22235#31561#22870':'
        end
        object Label13: TLabel
          Left = 10
          Top = 113
          Width = 42
          Height = 12
          Caption = #20116#31561#22870':'
        end
        object Label14: TLabel
          Left = 10
          Top = 135
          Width = 42
          Height = 12
          Caption = #20845#31561#22870':'
        end
        object EditWinLotteryLevel1: TEdit
          Left = 54
          Top = 20
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditWinLotteryLevel2: TEdit
          Left = 54
          Top = 42
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
        object EditWinLotteryLevel3: TEdit
          Left = 54
          Top = 64
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
        end
        object EditWinLotteryLevel4: TEdit
          Left = 54
          Top = 86
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object EditWinLotteryLevel5: TEdit
          Left = 54
          Top = 108
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 4
        end
        object EditWinLotteryLevel6: TEdit
          Left = 54
          Top = 130
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #20840#23616#21464#37327
      ImageIndex = 2
      object GroupBox5: TGroupBox
        Left = 10
        Top = 5
        Width = 263
        Height = 164
        Caption = #20840#23616#21464#37327#29366#24577
        TabOrder = 0
        object Label15: TLabel
          Left = 10
          Top = 25
          Width = 42
          Height = 12
          Caption = #21464#37327#19968':'
        end
        object Label16: TLabel
          Left = 10
          Top = 47
          Width = 42
          Height = 12
          Caption = #21464#37327#20108':'
        end
        object Label17: TLabel
          Left = 10
          Top = 69
          Width = 42
          Height = 12
          Caption = #21464#37327#19977':'
        end
        object Label18: TLabel
          Left = 10
          Top = 91
          Width = 42
          Height = 12
          Caption = #21464#37327#22235':'
        end
        object Label19: TLabel
          Left = 10
          Top = 113
          Width = 42
          Height = 12
          Caption = #21464#37327#20116':'
        end
        object Label20: TLabel
          Left = 10
          Top = 135
          Width = 42
          Height = 12
          Caption = #21464#37327#20845':'
        end
        object Label21: TLabel
          Left = 134
          Top = 91
          Width = 42
          Height = 12
          Caption = #21464#37327#21313':'
        end
        object Label22: TLabel
          Left = 134
          Top = 25
          Width = 42
          Height = 12
          Caption = #21464#37327#19971':'
        end
        object Label23: TLabel
          Left = 134
          Top = 47
          Width = 42
          Height = 12
          Caption = #21464#37327#20843':'
        end
        object Label24: TLabel
          Left = 134
          Top = 69
          Width = 42
          Height = 12
          Caption = #21464#37327#20061':'
        end
        object EditGlobalVal1: TEdit
          Left = 54
          Top = 20
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 0
        end
        object EditGlobalVal2: TEdit
          Left = 54
          Top = 42
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 1
        end
        object EditGlobalVal3: TEdit
          Left = 54
          Top = 64
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 2
        end
        object EditGlobalVal4: TEdit
          Left = 54
          Top = 86
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object EditGlobalVal5: TEdit
          Left = 54
          Top = 108
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 4
        end
        object EditGlobalVal6: TEdit
          Left = 54
          Top = 130
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 5
        end
        object EditGlobalVal7: TEdit
          Left = 178
          Top = 20
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 6
        end
        object EditGlobalVal8: TEdit
          Left = 178
          Top = 42
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 7
        end
        object EditGlobalVal9: TEdit
          Left = 178
          Top = 64
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 8
        end
        object EditGlobalVal10: TEdit
          Left = 178
          Top = 86
          Width = 71
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #24037#20316#32447#31243
      ImageIndex = 4
      object GroupBox7: TGroupBox
        Left = 10
        Top = 5
        Width = 327
        Height = 206
        Caption = #32447#31243#29366#24577
        TabOrder = 0
        object GridThread: TStringGrid
          Left = 10
          Top = 20
          Width = 303
          Height = 173
          DefaultRowHeight = 18
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          ColWidths = (
            35
            50
            51
            90
            64)
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 208
    Top = 160
  end
end
