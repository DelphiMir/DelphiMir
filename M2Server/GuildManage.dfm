object frmGuildManage: TfrmGuildManage
  Left = 384
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #34892#20250#31649#29702
  ClientHeight = 392
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 377
    Caption = #34892#20250#21015#34920
    TabOrder = 0
    object ListViewGuild: TListView
      Left = 8
      Top = 16
      Width = 209
      Height = 353
      Columns = <
        item
          Caption = #24207#21495
        end
        item
          Caption = #34892#20250#21517#23383
          Width = 150
        end>
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewGuildClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 240
    Top = 8
    Width = 369
    Height = 326
    Caption = #34892#20250#35774#32622
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 10
      Top = 18
      Width = 343
      Height = 301
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #34892#20250#20449#24687
        object GroupBox3: TGroupBox
          Left = 5
          Top = 0
          Width = 324
          Height = 263
          TabOrder = 0
          object Label2: TLabel
            Left = 10
            Top = 25
            Width = 54
            Height = 12
            Caption = #34892#20250#21517#23383':'
          end
          object Label1: TLabel
            Left = 10
            Top = 55
            Width = 54
            Height = 12
            Caption = #34892#20250#27169#24335':'
          end
          object Label3: TLabel
            Left = 10
            Top = 85
            Width = 60
            Height = 12
            Caption = #34892#20250#31561#32423': '
          end
          object Label7: TLabel
            Left = 10
            Top = 115
            Width = 54
            Height = 12
            Caption = #34892#20250#32463#39564':'
          end
          object Label8: TLabel
            Left = 10
            Top = 145
            Width = 54
            Height = 12
            Caption = #34892#20250#28857#25968':'
          end
          object Label9: TLabel
            Left = 10
            Top = 175
            Width = 60
            Height = 12
            Caption = #34892#20250#20154#25968': '
          end
          object Label10: TLabel
            Left = 194
            Top = 55
            Width = 96
            Height = 12
            Caption = '0 :'#20013#31435#65292'1 :'#25112#20105
          end
          object Label4: TLabel
            Left = 194
            Top = 115
            Width = 96
            Height = 12
            Caption = #24403#21069#31561#32423#30340#32463#39564#20540
          end
          object EditGuildName: TEdit
            Left = 80
            Top = 20
            Width = 211
            Height = 20
            Enabled = False
            ImeName = 'Microsoft Office IME 2007'
            ReadOnly = True
            TabOrder = 0
          end
          object EditGuildMode: TSpinEdit
            Left = 80
            Top = 50
            Width = 101
            Height = 21
            MaxValue = 1
            MinValue = 0
            TabOrder = 1
            Value = 0
            OnChange = EditGuildModeChange
            OnClick = EditGuildModeClick
          end
          object EditGuildLevel: TSpinEdit
            Left = 80
            Top = 80
            Width = 101
            Height = 21
            MaxValue = 100
            MinValue = 0
            TabOrder = 2
            Value = 0
            OnChange = EditGuildModeChange
            OnClick = EditGuildModeClick
          end
          object EditGuildExp: TSpinEdit
            Left = 80
            Top = 110
            Width = 101
            Height = 21
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 3
            Value = 0
            OnChange = EditGuildModeChange
            OnClick = EditGuildModeClick
          end
          object EditGuildPoint: TSpinEdit
            Left = 80
            Top = 140
            Width = 101
            Height = 21
            MaxValue = 2000000000
            MinValue = 0
            TabOrder = 4
            Value = 0
            OnChange = EditGuildModeChange
            OnClick = EditGuildModeClick
          end
          object Button1: TButton
            Left = 210
            Top = 216
            Width = 94
            Height = 31
            Caption = #20445#23384'(&S)'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnClick = Button1Click
          end
          object SpinEditGuildMemberCount: TSpinEdit
            Left = 80
            Top = 170
            Width = 101
            Height = 21
            MaxValue = 65535
            MinValue = 1
            TabOrder = 6
            Value = 1
          end
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 240
    Top = 334
    Width = 369
    Height = 51
    Caption = #34892#20250#25104#21592#30003#35831#38480#21046
    TabOrder = 2
    object Label6: TLabel
      Left = 23
      Top = 23
      Width = 54
      Height = 12
      Caption = #25104#21592#25968#37327':'
    end
    object EditGuildMemberCount: TSpinEdit
      Left = 92
      Top = 19
      Width = 75
      Height = 21
      Hint = #26032#24314#34892'?'#65292#26368#22823#30340#25104'??'#37327#65292#24314'?'#22312'200-300'#20043'?'
      MaxValue = 65535
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 1
      OnChange = EditGuildMemberCountChange
      OnClick = EditGuildMemberCountClick
    end
    object Button2: TButton
      Left = 242
      Top = 13
      Width = 94
      Height = 31
      Caption = #24212#29992
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
