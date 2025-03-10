object frmCastleManage: TfrmCastleManage
  Left = 963
  Top = 351
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #22478#22561#31649#29702
  ClientHeight = 322
  ClientWidth = 776
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 305
    Caption = #22478#22561#21015#34920
    TabOrder = 0
    object ListViewCastle: TListView
      Left = 13
      Top = 17
      Width = 228
      Height = 272
      Hint = 'List of available castles'
      Columns = <
        item
          Caption = #24207#21495
          Width = 40
        end
        item
          Caption = ' '#32534#21495
        end
        item
          Caption = '     '#21517#23383
          Width = 134
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewCastleClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 272
    Top = 8
    Width = 497
    Height = 305
    Caption = #22478#22561#20449#24687
    TabOrder = 1
    object PageControlCastle: TPageControl
      Left = 13
      Top = 25
      Width = 468
      Height = 264
      ActivePage = TabSheet3
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22522#26412#29366#24577
        object GroupBox3: TGroupBox
          Left = 8
          Top = 18
          Width = 378
          Height = 143
          TabOrder = 0
          object Label2: TLabel
            Left = 13
            Top = 31
            Width = 48
            Height = 12
            Caption = #25152#23646#34892#20250
          end
          object Label1: TLabel
            Left = 13
            Top = 69
            Width = 48
            Height = 12
            Caption = #22870#37329#24635#25968
          end
          object Label3: TLabel
            Left = 13
            Top = 106
            Width = 48
            Height = 12
            Caption = #24403#22825#25910#20837
          end
          object Label7: TLabel
            Left = 218
            Top = 69
            Width = 48
            Height = 12
            Caption = #25216#26415#31561#32423
          end
          object Label8: TLabel
            Left = 218
            Top = 106
            Width = 48
            Height = 12
            Caption = #21147'    '#37327
          end
          object EditOwenGuildName: TEdit
            Left = 85
            Top = 25
            Width = 211
            Height = 20
            Hint = 'Guild that owns the selected castle'
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 0
          end
          object EditTotalGold: TSpinEdit
            Left = 85
            Top = 63
            Width = 126
            Height = 21
            Hint = 'Total amount of gold stored in castle'
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object EditTodayIncome: TSpinEdit
            Left = 85
            Top = 100
            Width = 126
            Height = 21
            Hint = 'Total of income made today'
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
          object EditTechLevel: TSpinEdit
            Left = 288
            Top = 63
            Width = 76
            Height = 21
            Hint = 'Tech level of castle'
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 3
            Value = 0
          end
          object EditPower: TSpinEdit
            Left = 288
            Top = 100
            Width = 76
            Height = 21
            Hint = 'Castle power level'
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 4
            Value = 0
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #23432#21355#29366#24577
        ImageIndex = 2
        object GroupBox5: TGroupBox
          Left = 8
          Top = 0
          Width = 441
          Height = 225
          TabOrder = 0
          object ListViewGuard: TListView
            Left = 13
            Top = 20
            Width = 420
            Height = 165
            Columns = <
              item
                Caption = #24207#21495
                Width = 40
              end
              item
                Caption = '   '#21517#31216
                Width = 80
              end
              item
                Caption = '    '#22352#26631
                Width = 100
              end
              item
                Caption = '    '#34880#37327
                Width = 94
              end
              item
                Caption = '    '#29366#24577
                Width = 102
              end>
            GridLines = True
            ReadOnly = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
          end
          object ButtonRefresh: TButton
            Left = 345
            Top = 191
            Width = 88
            Height = 26
            Caption = #21047#26032'(&R)'
            TabOrder = 1
            OnClick = ButtonRefreshClick
          end
        end
      end
    end
  end
end
