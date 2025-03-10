object frmConfigMerchant: TfrmConfigMerchant
  Left = 868
  Top = 351
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21830#20154#31649#29702
  ClientHeight = 484
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 13
    Top = 5
    Width = 48
    Height = 12
    Caption = ' NPC'#21015#34920
  end
  object ListBoxMerChant: TListBox
    Left = 5
    Top = 22
    Width = 420
    Height = 263
    Hint = 'List of NPC files'
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 12
    TabOrder = 0
    OnClick = ListBoxMerChantClick
  end
  object GroupBoxNPC: TGroupBox
    Left = 5
    Top = 289
    Width = 420
    Height = 144
    Caption = 'NPC'#35774#32622
    Enabled = False
    TabOrder = 1
    object Label2: TLabel
      Left = 10
      Top = 28
      Width = 48
      Height = 12
      Caption = #33050#26412#21517#31216
    end
    object Label3: TLabel
      Left = 213
      Top = 28
      Width = 48
      Height = 12
      Caption = #22320#22270#21517#31216
    end
    object Label4: TLabel
      Left = 10
      Top = 58
      Width = 48
      Height = 12
      Caption = #22352' '#26631' X:'
    end
    object Label5: TLabel
      Left = 124
      Top = 58
      Width = 12
      Height = 12
      Caption = 'Y:'
    end
    object Label6: TLabel
      Left = 10
      Top = 88
      Width = 48
      Height = 12
      Caption = #26174#31034#21517#31216
    end
    object Label7: TLabel
      Left = 216
      Top = 88
      Width = 24
      Height = 12
      Caption = #26041#21521
      WordWrap = True
    end
    object Label8: TLabel
      Left = 318
      Top = 88
      Width = 24
      Height = 12
      Caption = #22806#35266
    end
    object Label10: TLabel
      Left = 214
      Top = 59
      Width = 48
      Height = 12
      Caption = #22320#22270#25551#36848
    end
    object Label11: TLabel
      Left = 254
      Top = 118
      Width = 78
      Height = 12
      Caption = #31227#21160#38388#38548'('#20998'):'
      WordWrap = True
    end
    object EditScriptName: TEdit
      Left = 64
      Top = 25
      Width = 137
      Height = 20
      Hint = 'Filename that contains the NPC script'
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
      OnChange = EditScriptNameChange
    end
    object EditMapName: TEdit
      Left = 267
      Top = 25
      Width = 138
      Height = 20
      Hint = 'Map NPC can be found on'
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
      OnChange = EditMapNameChange
    end
    object EditShowName: TEdit
      Left = 64
      Top = 84
      Width = 137
      Height = 20
      Hint = 'Name of NPC ingame'
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 2
      OnChange = EditShowNameChange
    end
    object CheckBoxOfCastle: TCheckBox
      Left = 10
      Top = 114
      Width = 79
      Height = 26
      Hint = 'A % of sales price goes to castle'
      Caption = #23646#20110#22478#22561
      TabOrder = 3
      OnClick = CheckBoxOfCastleClick
    end
    object ComboBoxDir: TComboBox
      Left = 245
      Top = 84
      Width = 56
      Height = 20
      Hint = 
        'Direction the NPC faces (1 being up and counting in a clockwise ' +
        'direction)'
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      TabOrder = 4
      OnChange = ComboBoxDirChange
    end
    object EditImageIdx: TSpinEdit
      Left = 349
      Top = 83
      Width = 56
      Height = 21
      Hint = 'Skin no in NPC.wil'
      EditorEnabled = False
      MaxValue = 65535
      MinValue = 0
      TabOrder = 5
      Value = 0
      OnChange = EditImageIdxChange
    end
    object EditX: TSpinEdit
      Left = 64
      Top = 53
      Width = 56
      Height = 21
      Hint = 'X Co-Ordinate of NPC'
      EditorEnabled = False
      MaxValue = 1000
      MinValue = 1
      TabOrder = 6
      Value = 1
      OnChange = EditXChange
    end
    object EditY: TSpinEdit
      Left = 138
      Top = 53
      Width = 63
      Height = 21
      Hint = 'Y Co-Ordinate of NPC'
      EditorEnabled = False
      MaxValue = 1000
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = EditYChange
    end
    object EditMapDesc: TEdit
      Left = 267
      Top = 55
      Width = 138
      Height = 20
      Enabled = False
      ImeName = 'Microsoft Office IME 2007'
      ReadOnly = True
      TabOrder = 8
    end
    object CheckBoxAutoMove: TCheckBox
      Left = 123
      Top = 114
      Width = 78
      Height = 26
      Hint = 'NPC can randomly teleport'
      Caption = #33258#30001#31227#21160
      TabOrder = 9
      OnClick = CheckBoxAutoMoveClick
    end
    object EditMoveTime: TSpinEdit
      Left = 340
      Top = 112
      Width = 63
      Height = 21
      Hint = 'Time between the random teleports'
      EditorEnabled = False
      MaxValue = 65535
      MinValue = 0
      TabOrder = 10
      Value = 0
      OnChange = EditMoveTimeChange
    end
  end
  object GroupBoxScript: TGroupBox
    Left = 438
    Top = 21
    Width = 355
    Height = 460
    Caption = #33050#26412#25991#20214#32534#36753
    Enabled = False
    TabOrder = 2
    object MemoScript: TMemo
      Left = 13
      Top = 208
      Width = 340
      Height = 233
      Hint = 'Selected NPC script'
      ImeName = 'Microsoft Office IME 2007'
      ScrollBars = ssBoth
      TabOrder = 0
      OnChange = MemoScriptChange
    end
    object ButtonScriptSave: TButton
      Left = 259
      Top = 48
      Width = 89
      Height = 38
      Hint = 'Save NPC script file'
      Caption = #20445#23384'(&S)'
      TabOrder = 1
      OnClick = ButtonScriptSaveClick
    end
    object GroupBox3: TGroupBox
      Left = 13
      Top = 25
      Width = 236
      Height = 166
      Caption = #33050#26412#21442#25968
      TabOrder = 2
      object Label9: TLabel
        Left = 13
        Top = 140
        Width = 48
        Height = 12
        Caption = #20215#26684#27604#29575
      end
      object CheckBoxBuy: TCheckBox
        Left = 13
        Top = 25
        Width = 51
        Height = 26
        Caption = #20080
        TabOrder = 0
        OnClick = CheckBoxBuyClick
      end
      object CheckBoxSell: TCheckBox
        Left = 13
        Top = 50
        Width = 51
        Height = 26
        Caption = #21334
        TabOrder = 1
        OnClick = CheckBoxSellClick
      end
      object CheckBoxStorage: TCheckBox
        Left = 83
        Top = 25
        Width = 62
        Height = 26
        Caption = #20179#24211
        TabOrder = 2
        OnClick = CheckBoxStorageClick
      end
      object CheckBoxMakedrug: TCheckBox
        Left = 159
        Top = 78
        Width = 74
        Height = 26
        Caption = #21512#25104#29289#21697
        TabOrder = 3
        OnClick = CheckBoxMakedrugClick
      end
      object CheckBoxUpgradenow: TCheckBox
        Left = 160
        Top = 26
        Width = 73
        Height = 26
        Caption = #21319#32423#29289#21697
        TabOrder = 4
        OnClick = CheckBoxUpgradenowClick
      end
      object CheckBoxGetbackupgnow: TCheckBox
        Left = 159
        Top = 51
        Width = 66
        Height = 26
        Caption = #21462#22238#21319#32423
        TabOrder = 5
        OnClick = CheckBoxGetbackupgnowClick
      end
      object CheckBoxRepair: TCheckBox
        Left = 160
        Top = 105
        Width = 73
        Height = 26
        Caption = #20462#29702#29289#21697
        TabOrder = 6
        OnClick = CheckBoxRepairClick
      end
      object CheckBoxS_repair: TCheckBox
        Left = 160
        Top = 130
        Width = 73
        Height = 26
        Caption = #29305#27530#20462#29702
        TabOrder = 7
        OnClick = CheckBoxS_repairClick
      end
      object EditPriceRate: TSpinEdit
        Left = 68
        Top = 137
        Width = 53
        Height = 21
        Hint = 'NPC price rate, 80=80%'
        EditorEnabled = False
        MaxValue = 500
        MinValue = 60
        TabOrder = 8
        Value = 60
        OnChange = EditPriceRateChange
      end
      object CheckBoxSendMsg: TCheckBox
        Left = 83
        Top = 50
        Width = 62
        Height = 26
        Caption = #31069#31119#35821
        TabOrder = 9
        OnClick = CheckBoxSendMsgClick
      end
    end
    object ButtonReLoadNpc: TButton
      Left = 259
      Top = 114
      Width = 89
      Height = 38
      Hint = 'Reload NPC Script'
      HelpType = htKeyword
      Caption = #21152#36733'(&R)'
      Enabled = False
      TabOrder = 3
      OnClick = ButtonReLoadNpcClick
    end
  end
  object ButtonSave: TButton
    Left = 5
    Top = 439
    Width = 88
    Height = 38
    Hint = 'Save NPC changes'
    Caption = #20445#23384'(&S)'
    TabOrder = 3
    OnClick = ButtonSaveClick
  end
  object CheckBoxDenyRefStatus: TCheckBox
    Left = 343
    Top = 446
    Width = 74
    Height = 26
    Hint = 'THIS IS AN UNKNOWN COMMAND(SO FAR)'
    Caption = #21047#26032#29366#24577
    TabOrder = 4
    OnClick = CheckBoxDenyRefStatusClick
  end
  object ButtonClearTempData: TButton
    Left = 209
    Top = 439
    Width = 128
    Height = 38
    Hint = 'Clear any changes made'
    Caption = #28165#38500#20020#26102#25968#25454'(&C)'
    TabOrder = 5
    OnClick = ButtonClearTempDataClick
  end
  object ButtonViewData: TButton
    Left = 97
    Top = 439
    Width = 108
    Height = 38
    Hint = 'View the NPC'#39's data'
    Caption = #26174#31034'(&V)'
    TabOrder = 6
    Visible = False
    OnClick = ButtonClearTempDataClick
  end
end
