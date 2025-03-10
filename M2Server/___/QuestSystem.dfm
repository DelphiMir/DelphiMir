object QuestInfoForm: TQuestInfoForm
  Left = 587
  Top = 314
  Width = 926
  Height = 468
  Caption = #53272#49828#53944#49884#49828#53596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 265
    Height = 377
    Caption = #53272#49828#53944' '#47785#47197
    TabOrder = 0
    object ListViewQuest: TListView
      Left = 8
      Top = 16
      Width = 249
      Height = 353
      Columns = <
        item
          Caption = #48264#54840
        end
        item
          Caption = #53272#49828#53944' '#51060#47492
          Width = 195
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
      OnClick = ListViewQuestClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 280
    Top = 40
    Width = 625
    Height = 377
    Caption = #53272#49828#53944' '#49444#51221
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 8
      Top = 16
      Width = 609
      Height = 353
      TabOrder = 0
      object Label2: TLabel
        Left = 10
        Top = 25
        Width = 69
        Height = 13
        Caption = #53272#49828#53944' '#48264#54840' :'
      end
      object Label1: TLabel
        Left = 10
        Top = 57
        Width = 69
        Height = 13
        Caption = #53272#49828#53944' '#51060#47492' :'
      end
      object Label3: TLabel
        Left = 10
        Top = 89
        Width = 69
        Height = 13
        Caption = #53272#49828#53944' '#44536#47353' :'
      end
      object Label4: TLabel
        Left = 10
        Top = 121
        Width = 69
        Height = 13
        Caption = #53272#49828#53944' '#51333#47448' :'
      end
      object Label5: TLabel
        Left = 10
        Top = 153
        Width = 69
        Height = 13
        Caption = #53272#49828#53944' '#54028#51068' :'
      end
      object Label6: TLabel
        Left = 10
        Top = 185
        Width = 69
        Height = 13
        Caption = #51060#46041' '#47700#49884#51648' :'
      end
      object Label7: TLabel
        Left = 10
        Top = 217
        Width = 69
        Height = 13
        Caption = #51228#44144' '#47700#49884#51648' :'
      end
      object Label8: TLabel
        Left = 10
        Top = 249
        Width = 69
        Height = 13
        Caption = #54925#46301' '#47700#49884#51648' :'
      end
      object Label9: TLabel
        Left = 10
        Top = 281
        Width = 65
        Height = 13
        Caption = 'Flag '#47700#49884#51648' :'
      end
      object Label10: TLabel
        Left = 330
        Top = 25
        Width = 54
        Height = 13
        Caption = #52572#49548#47112#48296' :'
      end
      object Label11: TLabel
        Left = 330
        Top = 57
        Width = 54
        Height = 13
        Caption = #52572#45824#47112#48296' :'
      end
      object Label12: TLabel
        Left = 330
        Top = 89
        Width = 66
        Height = 13
        Caption = #50672#46041#53272#49828#53944' :'
      end
      object Label13: TLabel
        Left = 330
        Top = 121
        Width = 54
        Height = 13
        Caption = #51649#50629#51312#44148' :'
      end
      object EditIndex: TEdit
        Left = 88
        Top = 22
        Width = 65
        Height = 21
        Enabled = False
        ImeName = 'Microsoft Office IME 2007'
        ReadOnly = True
        TabOrder = 0
      end
      object EditName: TEdit
        Left = 88
        Top = 54
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 1
        OnChange = EditNameChange
      end
      object EditGroup: TEdit
        Left = 88
        Top = 86
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 2
        OnChange = EditNameChange
      end
      object EditFile: TEdit
        Left = 88
        Top = 150
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 3
        OnChange = EditNameChange
      end
      object BotScriptOpen: TButton
        Left = 320
        Top = 148
        Width = 75
        Height = 25
        Caption = #49828#53356#47549#53944
        TabOrder = 4
        OnClick = BotScriptOpenClick
      end
      object EditGoto: TEdit
        Left = 88
        Top = 182
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 5
        OnChange = EditNameChange
      end
      object EditKill: TEdit
        Left = 88
        Top = 214
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 6
        OnChange = EditNameChange
      end
      object EditItem: TEdit
        Left = 88
        Top = 246
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 7
        OnChange = EditNameChange
      end
      object EditFlag: TEdit
        Left = 88
        Top = 278
        Width = 225
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        ParentFont = False
        TabOrder = 8
        OnChange = EditNameChange
      end
      object ComQuestType: TComboBox
        Left = 88
        Top = 120
        Width = 225
        Height = 21
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 9
        OnChange = EditNameChange
        Items.Strings = (
          '0: '#51068#48152#53272#49828#53944
          '1: '#51068#51068#53272#49828#53944
          '2: '#48152#48373#53272#49828#53944
          '3: '#49440#54665#53272#49828#53944)
      end
      object EditMin: TSpinEdit
        Left = 400
        Top = 20
        Width = 101
        Height = 22
        MaxValue = 4999
        MinValue = 1
        TabOrder = 10
        Value = 0
        OnChange = EditNameChange
      end
      object EditMax: TSpinEdit
        Left = 400
        Top = 54
        Width = 101
        Height = 22
        MaxValue = 5000
        MinValue = 1
        TabOrder = 11
        Value = 0
        OnChange = EditNameChange
      end
    end
  end
  object BotQuestAdd: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = #52628#44032
    TabOrder = 2
    OnClick = BotQuestAddClick
  end
  object BotQuestSave: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = #51200#51109
    Enabled = False
    TabOrder = 3
    OnClick = BotQuestSaveClick
  end
end
