object frmGameCmd: TfrmGameCmd
  Left = 604
  Top = 352
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28216#25103#21629#20196
  ClientHeight = 386
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl: TPageControl
    Left = 10
    Top = 10
    Width = 551
    Height = 371
    ActivePage = TabSheet1
    Align = alCustom
    HotTrack = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412#21629#20196
      object StringGridGameCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 534
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameCmdClick
        ColWidths = (
          88
          59
          129
          248)
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 220
        Width = 534
        Height = 111
        Caption = #21629#20196#35774#32622
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #21629#20196#21517#31216':'
        end
        object Label6: TLabel
          Left = 228
          Top = 23
          Width = 54
          Height = 12
          Caption = #25152#38656#26435#38480':'
        end
        object LabelUserCmdFunc: TLabel
          Left = 80
          Top = 53
          Width = 353
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object LabelUserCmdParam: TLabel
          Left = 80
          Top = 83
          Width = 353
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 10
          Top = 56
          Width = 54
          Height = 12
          Caption = #21629#20196#21151#33021':'
        end
        object Label3: TLabel
          Left = 10
          Top = 85
          Width = 54
          Height = 12
          Caption = #21629#20196#26684#24335':'
        end
        object EditUserCmdName: TEdit
          Left = 72
          Top = 20
          Width = 145
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          OnChange = EditUserCmdNameChange
        end
        object EditUserCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditUserCmdPerMissionChange
        end
        object EditUserCmdOK: TButton
          Left = 438
          Top = 20
          Width = 81
          Height = 31
          Caption = #30830#23450'(&O)'
          TabOrder = 2
          OnClick = EditUserCmdOKClick
        end
        object EditUserCmdSave: TButton
          Left = 438
          Top = 70
          Width = 81
          Height = 31
          Caption = #20445#23384'(&S)'
          TabOrder = 3
          OnClick = EditUserCmdSaveClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #31649#29702#21629#20196
      ImageIndex = 1
      object StringGridGameMasterCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 688
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameMasterCmdClick
        ColWidths = (
          88
          59
          129
          248)
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 220
        Width = 688
        Height = 111
        Caption = #21629#20196#35774#32622
        TabOrder = 1
        object Label4: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #21629#20196#21517#31216':'
        end
        object Label5: TLabel
          Left = 228
          Top = 23
          Width = 54
          Height = 12
          Caption = #25152#38656#26435#38480':'
        end
        object LabelGameMasterCmdFunc: TLabel
          Left = 80
          Top = 53
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object LabelGameMasterCmdParam: TLabel
          Left = 80
          Top = 83
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #21629#20196#21151#33021':'
        end
        object Label8: TLabel
          Left = 10
          Top = 85
          Width = 54
          Height = 12
          Caption = #21629#20196#26684#24335':'
        end
        object EditGameMasterCmdName: TEdit
          Left = 72
          Top = 20
          Width = 145
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          OnChange = EditGameMasterCmdNameChange
        end
        object EditGameMasterCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditGameMasterCmdPerMissionChange
        end
        object EditGameMasterCmdOK: TButton
          Left = 590
          Top = 20
          Width = 81
          Height = 31
          Caption = #30830#23450'(&O)'
          TabOrder = 2
          OnClick = EditGameMasterCmdOKClick
        end
        object EditGameMasterCmdSave: TButton
          Left = 590
          Top = 70
          Width = 81
          Height = 31
          Caption = #20445#23384'(&S)'
          TabOrder = 3
          OnClick = EditGameMasterCmdSaveClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #35843#35797#21629#20196
      ImageIndex = 2
      object StringGridGameDebugCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 688
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameDebugCmdClick
        ColWidths = (
          88
          59
          129
          248)
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 220
        Width = 688
        Height = 111
        Caption = #21629#20196#35774#32622
        TabOrder = 1
        object Label9: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #21629#20196#21517#31216':'
        end
        object Label10: TLabel
          Left = 228
          Top = 23
          Width = 54
          Height = 12
          Caption = #25152#38656#26435#38480':'
        end
        object LabelGameDebugCmdFunc: TLabel
          Left = 80
          Top = 55
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object LabelGameDebugCmdParam: TLabel
          Left = 80
          Top = 85
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #23435'?'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #21629#20196#21151#33021':'
        end
        object Label12: TLabel
          Left = 10
          Top = 85
          Width = 54
          Height = 12
          Caption = #21629#20196#26684#24335':'
        end
        object EditGameDebugCmdName: TEdit
          Left = 72
          Top = 20
          Width = 137
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          OnChange = EditGameDebugCmdNameChange
        end
        object EditGameDebugCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditGameDebugCmdPerMissionChange
        end
        object EditGameDebugCmdOK: TButton
          Left = 590
          Top = 20
          Width = 81
          Height = 31
          Caption = #30830#23450'(&O)'
          TabOrder = 2
          OnClick = EditGameDebugCmdOKClick
        end
        object EditGameDebugCmdSave: TButton
          Left = 590
          Top = 70
          Width = 81
          Height = 31
          Caption = #20445#23384'(&S)'
          TabOrder = 3
          OnClick = EditGameDebugCmdSaveClick
        end
      end
    end
  end
end
