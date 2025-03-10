object frmFunctionConfig: TfrmFunctionConfig
  Left = 390
  Top = 238
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21151#33021#35774#32622
  ClientHeight = 533
  ClientWidth = 638
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
  object Label14: TLabel
    Left = 45
    Top = 489
    Width = 5
    Height = 15
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = '???'
    Font.Style = []
    ParentFont = False
  end
  object FunctionConfigControl: TPageControl
    Left = 10
    Top = 10
    Width = 619
    Height = 466
    ActivePage = TabSheet5
    MultiLine = True
    TabOrder = 0
    OnChanging = FunctionConfigControlChanging
    object TabSheetGeneral: TTabSheet
      Caption = #22522#26412#21151#33021
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object ButtonGeneralSave: TButton
        Left = 499
        Top = 354
        Width = 87
        Height = 34
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonGeneralSaveClick
      end
      object GroupBox34: TGroupBox
        Left = 10
        Top = 9
        Width = 181
        Height = 384
        Caption = #21517#23383#26174#31034#39068#33394
        TabOrder = 1
        object Label85: TLabel
          Left = 14
          Top = 28
          Width = 54
          Height = 12
          Caption = #25915#20987#29366#24577':'
          WordWrap = True
        end
        object LabelPKFlagNameColor: TLabel
          Left = 151
          Top = 20
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label87: TLabel
          Left = 15
          Top = 63
          Width = 54
          Height = 12
          Caption = #40644#21517#29366#24577':'
        end
        object LabelPKLevel1NameColor: TLabel
          Left = 151
          Top = 50
          Width = 13
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label89: TLabel
          Left = 15
          Top = 94
          Width = 54
          Height = 12
          Caption = #32418#21517#29366#24577':'
        end
        object LabelPKLevel2NameColor: TLabel
          Left = 151
          Top = 81
          Width = 13
          Height = 24
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label91: TLabel
          Left = 15
          Top = 156
          Width = 54
          Height = 12
          Caption = #32852#30431#25112#20105':'
        end
        object LabelAllyAndGuildNameColor: TLabel
          Left = 151
          Top = 152
          Width = 13
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label93: TLabel
          Left = 15
          Top = 125
          Width = 54
          Height = 12
          Caption = #25932#23545#29366#24577':'
        end
        object LabelWarGuildNameColor: TLabel
          Left = 151
          Top = 119
          Width = 13
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label95: TLabel
          Left = 15
          Top = 188
          Width = 48
          Height = 12
          Caption = #25112#20105#21306#22495
        end
        object LabelInFreePKAreaNameColor: TLabel
          Left = 151
          Top = 183
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label118: TLabel
          Left = 15
          Top = 220
          Width = 60
          Height = 12
          Caption = #27801#24052#20811#25112#20105
        end
        object LabelCatleGuildNameColor: TLabel
          Left = 151
          Top = 215
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label112: TLabel
          Left = 15
          Top = 316
          Width = 48
          Height = 12
          Caption = #25915#22478#34892#20250
        end
        object LabelCatleWarGuildNameColor: TLabel
          Left = 151
          Top = 311
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label119: TLabel
          Left = 15
          Top = 252
          Width = 48
          Height = 12
          Caption = #21335#28385#25112#20105
        end
        object Label122: TLabel
          Left = 15
          Top = 284
          Width = 36
          Height = 12
          Caption = #24449#26381#32773
        end
        object LabelKingCatleGuildNameColor: TLabel
          Left = 151
          Top = 277
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelNamCatleGuildNameColor: TLabel
          Left = 151
          Top = 247
          Width = 13
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditPKFlagNameColor: TSpinEdit
          Left = 86
          Top = 25
          Width = 57
          Height = 21
          Hint = 'Namecolour when you hit another player'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 47
          OnChange = EditPKFlagNameColorChange
        end
        object EditPKLevel1NameColor: TSpinEdit
          Left = 86
          Top = 56
          Width = 57
          Height = 21
          Hint = 'Namecolour when PK level from 100 to 199'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 251
          OnChange = EditPKLevel1NameColorChange
        end
        object EditPKLevel2NameColor: TSpinEdit
          Left = 86
          Top = 88
          Width = 57
          Height = 21
          Hint = 'Namecolour when PK level 200+'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 249
          OnChange = EditPKLevel2NameColorChange
        end
        object EditAllyAndGuildNameColor: TSpinEdit
          Left = 86
          Top = 150
          Width = 57
          Height = 21
          Hint = 'Namecolour of an allied guild, Default=180'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 180
          OnChange = EditAllyAndGuildNameColorChange
        end
        object EditWarGuildNameColor: TSpinEdit
          Left = 86
          Top = 119
          Width = 57
          Height = 21
          Hint = 'Namecolour of a guild you are warring with, Default=69'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 69
          OnChange = EditWarGuildNameColorChange
        end
        object EditInFreePKAreaNameColor: TSpinEdit
          Left = 86
          Top = 181
          Width = 57
          Height = 21
          Hint = 'Namecolour when in an area where PK'#39'ing is allowed, Default=221'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 221
          OnChange = EditInFreePKAreaNameColorChange
        end
        object EditCatleGuildNameColor: TSpinEdit
          Left = 86
          Top = 213
          Width = 57
          Height = 21
          Hint = 'Namecolour when in an area where PK'#39'ing is allowed, Default=221'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 221
          OnChange = EditCatleGuildNameColorChange
        end
        object EditCatleWarGuildNameColor: TSpinEdit
          Left = 86
          Top = 309
          Width = 57
          Height = 21
          Hint = 'Namecolour when in an area where PK'#39'ing is allowed, Default=221'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 221
          OnChange = EditCatleWarGuildNameColorChange
        end
        object EditNamCatleGuildNameColor: TSpinEdit
          Left = 86
          Top = 248
          Width = 57
          Height = 21
          Hint = '??? ???'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 8
          Value = 221
          OnChange = EditNamCatleGuildNameColorChange
        end
        object EditKingCatleGuildNameColor: TSpinEdit
          Left = 86
          Top = 277
          Width = 57
          Height = 21
          Hint = '??? ???'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 9
          Value = 221
          OnChange = EditKingCatleGuildNameColorChange
        end
      end
    end
    object PasswordSheet: TTabSheet
      Caption = #23494#30721#20445#25252
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object GroupBox1: TGroupBox
        Left = 11
        Top = 14
        Width = 580
        Height = 232
        TabOrder = 0
        object CheckBoxEnablePasswordLock: TCheckBox
          Left = 11
          Top = -1
          Width = 158
          Height = 22
          Hint = 'Turn on password system'
          Caption = #21551#29992#23494#30721#20445#25252#31995#32479
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxEnablePasswordLockClick
        end
        object GroupBox2: TGroupBox
          Left = 11
          Top = 21
          Width = 320
          Height = 200
          Caption = #38145#23450#25511#21046
          TabOrder = 1
          object CheckBoxLockGetBackItem: TCheckBox
            Left = 11
            Top = 16
            Width = 190
            Height = 24
            Hint = 'Storage must be unlocked before items can be retrieved'
            Caption = #38145#23450#31105#27490#21462#20179#24211
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBoxLockGetBackItemClick
          end
          object GroupBox4: TGroupBox
            Left = 11
            Top = 44
            Width = 295
            Height = 142
            Caption = #30331#24405#38145#23450
            TabOrder = 1
            object CheckBoxLockWalk: TCheckBox
              Left = 11
              Top = 44
              Width = 142
              Height = 22
              Caption = #31105#27490#36208#36335
              TabOrder = 0
              OnClick = CheckBoxLockWalkClick
            end
            object CheckBoxLockRun: TCheckBox
              Left = 11
              Top = 65
              Width = 142
              Height = 23
              Caption = #31105#27490#36305#27493
              TabOrder = 1
              OnClick = CheckBoxLockRunClick
            end
            object CheckBoxLockHit: TCheckBox
              Left = 11
              Top = 86
              Width = 142
              Height = 24
              Caption = #31105#27490#25915#20987
              TabOrder = 2
              OnClick = CheckBoxLockHitClick
            end
            object CheckBoxLockSpell: TCheckBox
              Left = 11
              Top = 109
              Width = 142
              Height = 22
              Caption = #31105#27490#39764#27861
              TabOrder = 3
              OnClick = CheckBoxLockSpellClick
            end
            object CheckBoxLockSendMsg: TCheckBox
              Left = 138
              Top = 44
              Width = 142
              Height = 22
              Caption = #31105#27490#32842#22825
              TabOrder = 4
              OnClick = CheckBoxLockSendMsgClick
            end
            object CheckBoxLockInObMode: TCheckBox
              Left = 138
              Top = 21
              Width = 138
              Height = 24
              Hint = 'Lock Observer mode so a password is required to become visable'
              Caption = #38145#23450#26102#20026#38544#36523#27169#24335
              TabOrder = 5
              OnClick = CheckBoxLockInObModeClick
            end
            object CheckBoxLockLogin: TCheckBox
              Left = 11
              Top = 21
              Width = 120
              Height = 24
              Caption = #38145#23450#30331#24405
              TabOrder = 6
              OnClick = CheckBoxLockLoginClick
            end
            object CheckBoxLockUseItem: TCheckBox
              Left = 138
              Top = 109
              Width = 142
              Height = 22
              Caption = #31105#27490#20351#29992
              TabOrder = 7
              OnClick = CheckBoxLockUseItemClick
            end
            object CheckBoxLockDropItem: TCheckBox
              Left = 138
              Top = 86
              Width = 142
              Height = 24
              Caption = #31105#27490#20002#24323
              TabOrder = 8
              OnClick = CheckBoxLockDropItemClick
            end
            object CheckBoxLockDealItem: TCheckBox
              Left = 138
              Top = 65
              Width = 125
              Height = 23
              Caption = #31105#27490#20132#26131
              TabOrder = 9
              OnClick = CheckBoxLockDealItemClick
            end
          end
        end
        object GroupBox3: TGroupBox
          Left = 344
          Top = 21
          Width = 192
          Height = 89
          Caption = #23494#30721#36755#20837#38169#35823#25511#21046
          TabOrder = 2
          object Label1: TLabel
            Left = 21
            Top = 30
            Width = 48
            Height = 12
            Caption = #38169#35823#27425#25968
          end
          object EditErrorPasswordCount: TSpinEdit
            Left = 103
            Top = 25
            Width = 71
            Height = 21
            Hint = 'Max no of password attempts'
            EditorEnabled = False
            MaxValue = 10
            MinValue = 1
            TabOrder = 0
            Value = 3
            OnChange = EditErrorPasswordCountChange
          end
          object CheckBoxErrorCountKick: TCheckBox
            Left = 11
            Top = 54
            Width = 165
            Height = 24
            Hint = 'Kick user if incorrect X times in a row'
            Caption = #36229#36807#25351#23450#27425#25968#36386#19979#32447
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = CheckBoxErrorCountKickClick
          end
        end
        object ButtonPasswordLockSave: TButton
          Left = 473
          Top = 178
          Width = 87
          Height = 35
          Hint = 'Save settings'
          Caption = #20445#23384'(&S)'
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = ButtonPasswordLockSaveClick
        end
        object GroupBox47: TGroupBox
          Left = 344
          Top = 112
          Width = 193
          Height = 57
          Caption = #22870#21169#28857#31995#32479
          TabOrder = 4
          object Label137: TLabel
            Left = 37
            Top = 30
            Width = 54
            Height = 12
            Caption = #23553#38145#28857' : '
          end
          object SpinBonusPointEdit: TSpinEdit
            Left = 103
            Top = 25
            Width = 71
            Height = 21
            Hint = '?? ?? ?? ?? ? ?????.'
            MaxValue = 50000
            MinValue = 0
            TabOrder = 0
            Value = 3
            OnChange = SpinBonusPointEditChange
          end
        end
      end
    end
    object TabSheet33: TTabSheet
      Caption = #24072#24466#31995#32479
      ImageIndex = 5
      object GroupBox21: TGroupBox
        Left = 180
        Top = 63
        Width = 222
        Height = 208
        Caption = #24466#24351#20986#24072
        TabOrder = 0
        object GroupBox22: TGroupBox
          Left = 11
          Top = 21
          Width = 197
          Height = 67
          Caption = #20986#24072#31561#32423
          TabOrder = 0
          object Label29: TLabel
            Left = 11
            Top = 25
            Width = 48
            Height = 12
            Caption = #20986#24072#31561#32423
          end
          object EditMasterOKLevel: TSpinEdit
            Left = 93
            Top = 20
            Width = 71
            Height = 21
            Hint = 'Minimum level you must be before being a master'
            MaxValue = 65535
            MinValue = 1
            TabOrder = 0
            Value = 10
            OnChange = EditMasterOKLevelChange
          end
        end
        object GroupBox23: TGroupBox
          Left = 11
          Top = 98
          Width = 197
          Height = 98
          Caption = #24072#29238#25152#24471
          TabOrder = 1
          object Label30: TLabel
            Left = 11
            Top = 25
            Width = 48
            Height = 12
            Caption = #22768#26395#28857#25968
          end
          object Label31: TLabel
            Left = 11
            Top = 58
            Width = 48
            Height = 12
            Caption = #20998#37197#28857#25968
          end
          object EditMasterOKCreditPoint: TSpinEdit
            Left = 93
            Top = 20
            Width = 71
            Height = 21
            Hint = 'Level before earning master credits'
            MaxValue = 100
            MinValue = 0
            TabOrder = 0
            Value = 10
            OnChange = EditMasterOKCreditPointChange
          end
          object EditMasterOKBonusPoint: TSpinEdit
            Left = 93
            Top = 53
            Width = 71
            Height = 21
            Hint = 'Level before earning master bonus points'
            MaxValue = 1000
            MinValue = 0
            TabOrder = 1
            Value = 10
            OnChange = EditMasterOKBonusPointChange
          end
        end
      end
      object ButtonMasterSave: TButton
        Left = 496
        Top = 343
        Width = 89
        Height = 35
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonMasterSaveClick
      end
    end
    object TabSheet38: TTabSheet
      Caption = #36716#29983#31995#32479
      ImageIndex = 9
      object GroupBox29: TGroupBox
        Left = 10
        Top = 11
        Width = 153
        Height = 350
        Caption = #33258#21160#21464#33394
        TabOrder = 0
        object Label56: TLabel
          Left = 15
          Top = 26
          Width = 12
          Height = 12
          Caption = '1:'
        end
        object LabelReNewNameColor1: TLabel
          Left = 119
          Top = 24
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label58: TLabel
          Left = 15
          Top = 59
          Width = 12
          Height = 12
          Caption = '2:'
        end
        object LabelReNewNameColor2: TLabel
          Left = 119
          Top = 56
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label60: TLabel
          Left = 15
          Top = 91
          Width = 12
          Height = 12
          Caption = '3:'
        end
        object LabelReNewNameColor3: TLabel
          Left = 119
          Top = 89
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label62: TLabel
          Left = 15
          Top = 124
          Width = 12
          Height = 12
          Caption = '4:'
        end
        object LabelReNewNameColor4: TLabel
          Left = 119
          Top = 121
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label64: TLabel
          Left = 15
          Top = 156
          Width = 12
          Height = 12
          Caption = '5:'
        end
        object LabelReNewNameColor5: TLabel
          Left = 119
          Top = 154
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label66: TLabel
          Left = 15
          Top = 189
          Width = 12
          Height = 12
          Caption = '6:'
        end
        object LabelReNewNameColor6: TLabel
          Left = 119
          Top = 186
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label68: TLabel
          Left = 15
          Top = 221
          Width = 12
          Height = 12
          Caption = '7:'
        end
        object LabelReNewNameColor7: TLabel
          Left = 119
          Top = 219
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label70: TLabel
          Left = 15
          Top = 254
          Width = 12
          Height = 12
          Caption = '8:'
        end
        object LabelReNewNameColor8: TLabel
          Left = 119
          Top = 251
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label72: TLabel
          Left = 15
          Top = 286
          Width = 12
          Height = 12
          Caption = '9:'
        end
        object LabelReNewNameColor9: TLabel
          Left = 119
          Top = 284
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label74: TLabel
          Left = 15
          Top = 319
          Width = 18
          Height = 12
          Caption = '10:'
        end
        object LabelReNewNameColor10: TLabel
          Left = 119
          Top = 316
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditReNewNameColor1: TSpinEdit
          Left = 54
          Top = 21
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 255
          OnChange = EditReNewNameColor1Change
        end
        object EditReNewNameColor2: TSpinEdit
          Left = 54
          Top = 54
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 255
          OnChange = EditReNewNameColor2Change
        end
        object EditReNewNameColor3: TSpinEdit
          Left = 54
          Top = 86
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 255
          OnChange = EditReNewNameColor3Change
        end
        object EditReNewNameColor4: TSpinEdit
          Left = 54
          Top = 119
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 255
          OnChange = EditReNewNameColor4Change
        end
        object EditReNewNameColor5: TSpinEdit
          Left = 54
          Top = 151
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 255
          OnChange = EditReNewNameColor5Change
        end
        object EditReNewNameColor6: TSpinEdit
          Left = 54
          Top = 184
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 255
          OnChange = EditReNewNameColor6Change
        end
        object EditReNewNameColor7: TSpinEdit
          Left = 54
          Top = 216
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 255
          OnChange = EditReNewNameColor7Change
        end
        object EditReNewNameColor8: TSpinEdit
          Left = 54
          Top = 249
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 255
          OnChange = EditReNewNameColor8Change
        end
        object EditReNewNameColor9: TSpinEdit
          Left = 54
          Top = 281
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 8
          Value = 255
          OnChange = EditReNewNameColor9Change
        end
        object EditReNewNameColor10: TSpinEdit
          Left = 54
          Top = 314
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 9
          Value = 255
          OnChange = EditReNewNameColor10Change
        end
      end
      object ButtonReNewLevelSave: TButton
        Left = 494
        Top = 351
        Width = 89
        Height = 34
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonReNewLevelSaveClick
      end
      object GroupBox30: TGroupBox
        Left = 173
        Top = 11
        Width = 148
        Height = 80
        Caption = #21517#23383#21464#33394
        TabOrder = 2
        object Label57: TLabel
          Left = 11
          Top = 48
          Width = 30
          Height = 12
          Caption = #38388#38548':'
        end
        object Label59: TLabel
          Left = 113
          Top = 49
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditReNewNameColorTime: TSpinEdit
          Left = 55
          Top = 43
          Width = 50
          Height = 21
          Hint = 'Time colour will last before reverting to normal'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditReNewNameColorTimeChange
        end
        object CheckBoxReNewChangeColor: TCheckBox
          Left = 11
          Top = 16
          Width = 85
          Height = 24
          Hint = 'Name will change colour when reborn'
          Caption = #33258#21160#21464#33394
          TabOrder = 1
          OnClick = CheckBoxReNewChangeColorClick
        end
      end
      object GroupBox33: TGroupBox
        Left = 173
        Top = 104
        Width = 148
        Height = 55
        Caption = #36716#29983#25511#21046
        TabOrder = 3
        object CheckBoxReNewLevelClearExp: TCheckBox
          Left = 11
          Top = 21
          Width = 125
          Height = 24
          Hint = 'reset exp to 0 when reborn'
          Caption = #28165#38500#24050#26377#32463#39564
          TabOrder = 0
          OnClick = CheckBoxReNewLevelClearExpClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 176
        Top = 168
        Width = 241
        Height = 49
        Caption = #37197#32622#20013#31435#38376#27966#25915#20987' '
        TabOrder = 4
        object CheckNeutralityAttack: TCheckBox
          Left = 8
          Top = 24
          Width = 225
          Height = 17
          Hint = '????? ??? ? ????, ??? ?? ??? ? ????.'
          Caption = #20351#29992#20013#31435#38376#27966#19981#21487#24037#25915#20987#35774#32622'('#36873#20013#26102')'
          TabOrder = 0
          OnClick = CheckNeutralityAttackClick
        end
      end
    end
    object TabSheet39: TTabSheet
      Caption = #23453#23453#21319#32423
      ImageIndex = 10
      object ButtonMonUpgradeSave: TButton
        Left = 488
        Top = 354
        Width = 87
        Height = 34
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonMonUpgradeSaveClick
      end
      object GroupBox32: TGroupBox
        Left = 6
        Top = 6
        Width = 153
        Height = 320
        Caption = #31561#32423#39068#33394
        TabOrder = 1
        object Label65: TLabel
          Left = 15
          Top = 26
          Width = 12
          Height = 12
          Caption = '1:'
        end
        object LabelMonUpgradeColor1: TLabel
          Left = 109
          Top = 24
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label67: TLabel
          Left = 15
          Top = 59
          Width = 12
          Height = 12
          Caption = '2:'
        end
        object LabelMonUpgradeColor2: TLabel
          Left = 109
          Top = 56
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label69: TLabel
          Left = 15
          Top = 91
          Width = 12
          Height = 12
          Caption = '3:'
        end
        object LabelMonUpgradeColor3: TLabel
          Left = 109
          Top = 89
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label71: TLabel
          Left = 15
          Top = 124
          Width = 12
          Height = 12
          Caption = '4:'
        end
        object LabelMonUpgradeColor4: TLabel
          Left = 109
          Top = 121
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label73: TLabel
          Left = 15
          Top = 156
          Width = 12
          Height = 12
          Caption = '5:'
        end
        object LabelMonUpgradeColor5: TLabel
          Left = 109
          Top = 154
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label75: TLabel
          Left = 15
          Top = 189
          Width = 12
          Height = 12
          Caption = '6:'
        end
        object LabelMonUpgradeColor6: TLabel
          Left = 109
          Top = 186
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label76: TLabel
          Left = 15
          Top = 221
          Width = 12
          Height = 12
          Caption = '7:'
        end
        object LabelMonUpgradeColor7: TLabel
          Left = 109
          Top = 219
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label77: TLabel
          Left = 15
          Top = 254
          Width = 12
          Height = 12
          Caption = '8:'
        end
        object LabelMonUpgradeColor8: TLabel
          Left = 109
          Top = 251
          Width = 12
          Height = 23
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label86: TLabel
          Left = 15
          Top = 286
          Width = 12
          Height = 12
          Caption = '9:'
        end
        object LabelMonUpgradeColor9: TLabel
          Left = 109
          Top = 284
          Width = 12
          Height = 22
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditMonUpgradeColor1: TSpinEdit
          Left = 44
          Top = 21
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 255
          OnChange = EditMonUpgradeColor1Change
        end
        object EditMonUpgradeColor2: TSpinEdit
          Left = 44
          Top = 54
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 254
          OnChange = EditMonUpgradeColor2Change
        end
        object EditMonUpgradeColor3: TSpinEdit
          Left = 44
          Top = 86
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 147
          OnChange = EditMonUpgradeColor3Change
        end
        object EditMonUpgradeColor4: TSpinEdit
          Left = 44
          Top = 119
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 154
          OnChange = EditMonUpgradeColor4Change
        end
        object EditMonUpgradeColor5: TSpinEdit
          Left = 44
          Top = 151
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 229
          OnChange = EditMonUpgradeColor5Change
        end
        object EditMonUpgradeColor6: TSpinEdit
          Left = 44
          Top = 184
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 168
          OnChange = EditMonUpgradeColor6Change
        end
        object EditMonUpgradeColor7: TSpinEdit
          Left = 44
          Top = 216
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 180
          OnChange = EditMonUpgradeColor7Change
        end
        object EditMonUpgradeColor8: TSpinEdit
          Left = 44
          Top = 249
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 252
          OnChange = EditMonUpgradeColor8Change
        end
        object EditMonUpgradeColor9: TSpinEdit
          Left = 44
          Top = 281
          Width = 56
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 8
          Value = 249
          OnChange = EditMonUpgradeColor9Change
        end
      end
      object GroupBox31: TGroupBox
        Left = 169
        Top = 6
        Width = 137
        Height = 320
        Caption = #21319#32423#26432#24618#25968
        TabOrder = 2
        object Label61: TLabel
          Left = 15
          Top = 26
          Width = 12
          Height = 12
          Caption = '1:'
        end
        object Label63: TLabel
          Left = 15
          Top = 59
          Width = 12
          Height = 12
          Caption = '2:'
        end
        object Label78: TLabel
          Left = 15
          Top = 91
          Width = 12
          Height = 12
          Caption = '3:'
        end
        object Label79: TLabel
          Left = 15
          Top = 124
          Width = 12
          Height = 12
          Caption = '4:'
        end
        object Label80: TLabel
          Left = 15
          Top = 156
          Width = 12
          Height = 12
          Caption = '5:'
        end
        object Label81: TLabel
          Left = 15
          Top = 189
          Width = 12
          Height = 12
          Caption = '6:'
        end
        object Label82: TLabel
          Left = 15
          Top = 221
          Width = 12
          Height = 12
          Caption = '7:'
        end
        object Label83: TLabel
          Left = 15
          Top = 254
          Width = 18
          Height = 12
          Caption = '??:'
        end
        object Label84: TLabel
          Left = 15
          Top = 286
          Width = 18
          Height = 12
          Caption = '??:'
        end
        object EditMonUpgradeKillCount1: TSpinEdit
          Left = 59
          Top = 21
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = EditMonUpgradeKillCount1Change
        end
        object EditMonUpgradeKillCount2: TSpinEdit
          Left = 59
          Top = 54
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = EditMonUpgradeKillCount2Change
        end
        object EditMonUpgradeKillCount3: TSpinEdit
          Left = 59
          Top = 86
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 50
          OnChange = EditMonUpgradeKillCount3Change
        end
        object EditMonUpgradeKillCount4: TSpinEdit
          Left = 59
          Top = 119
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditMonUpgradeKillCount4Change
        end
        object EditMonUpgradeKillCount5: TSpinEdit
          Left = 59
          Top = 151
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 4
          Value = 200
          OnChange = EditMonUpgradeKillCount5Change
        end
        object EditMonUpgradeKillCount6: TSpinEdit
          Left = 59
          Top = 184
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 5
          Value = 300
          OnChange = EditMonUpgradeKillCount6Change
        end
        object EditMonUpgradeKillCount7: TSpinEdit
          Left = 59
          Top = 216
          Width = 66
          Height = 21
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 6
          Value = 600
          OnChange = EditMonUpgradeKillCount7Change
        end
        object EditMonUpLvNeedKillBase: TSpinEdit
          Left = 59
          Top = 249
          Width = 66
          Height = 21
          Hint = '????=?? * ?? + ?? + ?? + ????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 7
          Value = 100
          OnChange = EditMonUpLvNeedKillBaseChange
        end
        object EditMonUpLvRate: TSpinEdit
          Left = 59
          Top = 281
          Width = 66
          Height = 21
          Hint = '????=???? * ?? + ?? + ?? + ????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 8
          Value = 16
          OnChange = EditMonUpLvRateChange
        end
      end
      object GroupBox35: TGroupBox
        Left = 319
        Top = 6
        Width = 167
        Height = 153
        Caption = #20027#20154#27515#20129#25511#21046
        TabOrder = 3
        object Label88: TLabel
          Left = 15
          Top = 54
          Width = 54
          Height = 12
          Caption = #21464#24322#26426#29575':'
        end
        object Label90: TLabel
          Left = 15
          Top = 86
          Width = 54
          Height = 12
          Caption = #22686#21152#25915#20987':'
        end
        object Label92: TLabel
          Left = 15
          Top = 119
          Width = 54
          Height = 12
          Caption = #22686#21152#36895#24230':'
        end
        object CheckBoxMasterDieMutiny: TCheckBox
          Left = 11
          Top = 21
          Width = 153
          Height = 24
          Caption = #20027#20154#27515#20129#21518#21464#24322
          TabOrder = 0
          OnClick = CheckBoxMasterDieMutinyClick
        end
        object EditMasterDieMutinyRate: TSpinEdit
          Left = 68
          Top = 49
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditMasterDieMutinyRateChange
        end
        object EditMasterDieMutinyPower: TSpinEdit
          Left = 68
          Top = 81
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditMasterDieMutinyPowerChange
        end
        object EditMasterDieMutinySpeed: TSpinEdit
          Left = 68
          Top = 114
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditMasterDieMutinySpeedChange
        end
      end
    end
    object MonSaySheet: TTabSheet
      Caption = #24618#29289#35828#27963
      object GroupBox40: TGroupBox
        Left = 11
        Top = 11
        Width = 185
        Height = 55
        Caption = #24618#29289#35828#35805#24320#20851
        TabOrder = 0
        object CheckBoxMonSayMsg: TCheckBox
          Left = 16
          Top = 21
          Width = 153
          Height = 24
          Hint = 'Allow mobs to talk'
          Caption = #24320#21551#24618#29289#35828#35805#25511#21046
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxMonSayMsgClick
        end
      end
      object ButtonMonSayMsgSave: TButton
        Left = 494
        Top = 360
        Width = 89
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonMonSayMsgSaveClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = #39764#27861#25216#33021
      ImageIndex = 1
      object MagicPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 608
        Height = 351
        ActivePage = TabSheet2
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        object TabSheet36: TTabSheet
          Caption = #39764#27861#33539#22260#38480#21046
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          ImageIndex = 31
          ParentFont = False
          object GroupBox17: TGroupBox
            Left = 11
            Top = 11
            Width = 155
            Height = 67
            Caption = #39764#27861#25915#20987#33539#22260
            TabOrder = 0
            object Label12: TLabel
              Left = 10
              Top = 28
              Width = 54
              Height = 12
              Caption = #33539#22260#22823#23567':'
            end
            object EditMagicAttackRage: TSpinEdit
              Left = 63
              Top = 25
              Width = 71
              Height = 21
              Hint = 
                'Range an object must be withing before it can be attacked by a m' +
                'agic(distance) attack'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMagicAttackRageChange
            end
          end
        end
        object TabSheet11: TTabSheet
          Caption = #21050#26432#21073#26415
          ImageIndex = 10
          object GroupBox10: TGroupBox
            Left = 10
            Top = 70
            Width = 161
            Height = 61
            Caption = #25915#20987#21147#20493#25968
            TabOrder = 0
            object Label4: TLabel
              Left = 10
              Top = 28
              Width = 30
              Height = 12
              Caption = #20493#25968':'
            end
            object Label10: TLabel
              Left = 120
              Top = 30
              Width = 24
              Height = 12
              Caption = '/100'
            end
            object EditSwordLongPowerRate: TSpinEdit
              Left = 55
              Top = 24
              Width = 56
              Height = 21
              Hint = #25915'?'#21147#20493'?'#65292'?'#23383#22823#23567' '#38500#20197' 100???'#20493'?'#12290
              EditorEnabled = False
              MaxValue = 1000
              MinValue = 1
              TabOrder = 0
              Value = 100
              OnChange = EditSwordLongPowerRateChange
            end
          end
          object GroupBox9: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = #26080#38480#21050#26432
            TabOrder = 1
            object CheckBoxLimitSwordLong: TCheckBox
              Left = 10
              Top = 20
              Width = 121
              Height = 21
              Hint = #25171'?'#27492#21151#33021#21518#65292'?????'#38548#20301#26159#21542#26377#35282#33394#23384#22312#65292#20197#31105#27490#20992#20992#21050'?'#12290
              Caption = #31105#27490#26080#38480#21050#26432
              TabOrder = 0
              OnClick = CheckBoxLimitSwordLongClick
            end
          end
        end
        object FiresWordTab: TTabSheet
          Caption = #28872#28779#21073#27861
        end
        object TabSheet18: TTabSheet
          Caption = #35825#24785#20043#20809
          ImageIndex = 17
          object GroupBox39: TGroupBox
            Left = 10
            Top = 80
            Width = 141
            Height = 91
            TabOrder = 0
            object Label99: TLabel
              Left = 10
              Top = 25
              Width = 54
              Height = 12
              Caption = #24618#29289#31561#32423':'
            end
            object Label100: TLabel
              Left = 10
              Top = 55
              Width = 54
              Height = 12
              Caption = #24618#29289#34880#37327':'
            end
            object EditMagTammingTargetLevel: TSpinEdit
              Left = 80
              Top = 19
              Width = 51
              Height = 21
              Hint = '? ?? ??'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTammingTargetLevelChange
            end
            object EditMagTammingHPRate: TSpinEdit
              Left = 80
              Top = 49
              Width = 51
              Height = 21
              Hint = '??? ?? ? ? ??'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 1
              Value = 1
              OnChange = EditMagTammingHPRateChange
            end
          end
          object GroupBox38: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 61
            Caption = #24618#29289#31561#32423#38480#21046
            TabOrder = 1
            object Label98: TLabel
              Left = 10
              Top = 30
              Width = 30
              Height = 12
              Caption = #31561#32423':'
            end
            object EditMagTammingLevel: TSpinEdit
              Left = 55
              Top = 24
              Width = 76
              Height = 21
              Hint = '? ??? ?? ??'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTammingLevelChange
            end
          end
          object GroupBox45: TGroupBox
            Left = 160
            Top = 10
            Width = 141
            Height = 61
            Caption = #35825#24785#25968#37327
            TabOrder = 2
            object Label111: TLabel
              Left = 10
              Top = 30
              Width = 30
              Height = 12
              Caption = #25968#37327':'
            end
            object EditTammingCount: TSpinEdit
              Left = 55
              Top = 24
              Width = 76
              Height = 21
              Hint = '? ??? ??? ??'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditTammingCountChange
            end
          end
        end
        object TabSheet20: TTabSheet
          Caption = #28779#22681
          ImageIndex = 19
          object GroupBox46: TGroupBox
            Left = 11
            Top = 11
            Width = 153
            Height = 55
            Caption = #23433#20840#21306#38480#21046
            TabOrder = 0
            object CheckBoxFireCrossInSafeZone: TCheckBox
              Left = 11
              Top = 21
              Width = 132
              Height = 24
              Hint = 'Allow firewall to be casted in a safezone'
              Caption = #23433#20840#21306#31105#27490#28779#22681
              TabOrder = 0
              OnClick = CheckBoxFireCrossInSafeZoneClick
            end
          end
        end
        object TabSheet28: TTabSheet
          Caption = #22307#35328#26415
          ImageIndex = 27
          object GroupBox37: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 61
            Caption = #24618#29289#31561#32423#38480#21046
            TabOrder = 0
            object Label97: TLabel
              Left = 10
              Top = 28
              Width = 30
              Height = 12
              Caption = #31561#32423':'
            end
            object EditMagTurnUndeadLevel: TSpinEdit
              Left = 55
              Top = 24
              Width = 76
              Height = 21
              Hint = #25351#23450#31561'?'#20197#19979#30340#24618#29289#25165'?'#34987'?'#35328#65292#25351#23450#31561'?'#20197#19978#30340#24618#29289'?'#35328#26080#25928#12290
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTurnUndeadLevelChange
            end
          end
        end
        object TabSheet22: TTabSheet
          Caption = #22320#29425#38647#20809
          ImageIndex = 21
          object GroupBox15: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 61
            Caption = #25915#20987#33539#22260#35774#32622
            TabOrder = 0
            object Label9: TLabel
              Left = 10
              Top = 28
              Width = 30
              Height = 12
              Caption = #33539#22260':'
            end
            object EditElecBlizzardRange: TSpinEdit
              Left = 55
              Top = 24
              Width = 76
              Height = 21
              Hint = '??? ?? ??'
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditElecBlizzardRangeChange
            end
          end
          object GroupBox52: TGroupBox
            Left = 8
            Top = 88
            Width = 145
            Height = 65
            Caption = #25915#20987#24618#29289#31561#32423#35774#32622
            TabOrder = 1
            object Label124: TLabel
              Left = 10
              Top = 28
              Width = 30
              Height = 12
              Caption = #31561#32423':'
            end
            object EditElecBlizzardLevel: TSpinEdit
              Left = 55
              Top = 24
              Width = 76
              Height = 21
              Hint = '??? ?? ? ?? ??'
              EditorEnabled = False
              MaxValue = 100
              MinValue = 50
              TabOrder = 0
              Value = 70
              OnChange = EditElecBlizzardLevelChange
            end
          end
        end
        object TabSheet21: TTabSheet
          Caption = #29190#35010#28779#28976
          ImageIndex = 20
          object GroupBox13: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = #25915#20987#33539#22260
            TabOrder = 0
            object Label7: TLabel
              Left = 10
              Top = 23
              Width = 30
              Height = 12
              Caption = #33539#22260':'
            end
            object EditFireBoomRage: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 21
              Hint = #39764#27861#25915'?'#33539'?'#21322'?'#12290
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditFireBoomRageChange
            end
          end
        end
        object TabSheet29: TTabSheet
          Caption = #20912#21638#21742
          ImageIndex = 28
          object GroupBox14: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = #25915#20987#33539#22260
            TabOrder = 0
            object Label8: TLabel
              Left = 10
              Top = 23
              Width = 30
              Height = 12
              Caption = #33539#22260':'
            end
            object EditSnowWindRange: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 21
              Hint = #39764#27861#25915'?'#33539'?'#21322'?'#12290
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditSnowWindRangeChange
            end
          end
        end
        object TabSheet6: TTabSheet
          Caption = #26045#27602#26415
          ImageIndex = 4
          object GroupBox16: TGroupBox
            Left = 10
            Top = 10
            Width = 171
            Height = 61
            Caption = #27602#33647#38477#28857
            TabOrder = 0
            object Label11: TLabel
              Left = 10
              Top = 28
              Width = 54
              Height = 12
              Caption = #28857#25968#25511#21046':'
            end
            object EditAmyOunsulPoint: TSpinEdit
              Left = 85
              Top = 23
              Width = 66
              Height = 21
              Hint = #20013#27602#21518#25351#23450'???'#38477#28857'?'#65292'??'#28857'??'#25216#33021#31561'?'#21450#26412#36523#36947'?'#39640#20302#26377'?'#65292#27492'??'#21482#26159'?'#20854#20013#31639#27861'??'#65292#27492'?'#23383#36234#23567#65292#28857'?'#36234#22823#12290
              EditorEnabled = False
              MaxValue = 100
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditAmyOunsulPointChange
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #21484#21796#39607#39621
          ImageIndex = 1
          object GroupBox5: TGroupBox
            Left = 6
            Top = 8
            Width = 165
            Height = 178
            TabOrder = 0
            object Label2: TLabel
              Left = 15
              Top = 23
              Width = 48
              Height = 12
              Caption = #24618#29289#21517#31216
            end
            object Label3: TLabel
              Left = 15
              Top = 78
              Width = 54
              Height = 12
              Caption = #21484#21796#25968#37327':'
            end
            object EditBoneFammName: TEdit
              Left = 15
              Top = 40
              Width = 131
              Height = 20
              Hint = '?'#32622#40664'?'#21484'?'#30340#24618#29289#21517'?'#12290
              ImeName = 'Microsoft Office IME 2007'
              TabOrder = 0
              OnChange = EditBoneFammNameChange
            end
            object EditBoneFammCount: TSpinEdit
              Left = 80
              Top = 74
              Width = 66
              Height = 21
              Hint = '?'#32622#21487#21484'?'#26368#22823'?'#37327#12290
              EditorEnabled = False
              MaxValue = 255
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditBoneFammCountChange
            end
          end
          object GroupBox6: TGroupBox
            Left = 180
            Top = 8
            Width = 361
            Height = 178
            TabOrder = 1
            object GridBoneFamm: TStringGrid
              Left = 15
              Top = 20
              Width = 331
              Height = 141
              ColCount = 4
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 11
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
              OnSetEditText = GridBoneFammSetEditText
              ColWidths = (
                55
                76
                57
                52)
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = #21484#21796#31070#20861
          ImageIndex = 2
          object GroupBox11: TGroupBox
            Left = 6
            Top = 3
            Width = 165
            Height = 178
            TabOrder = 0
            object Label5: TLabel
              Left = 15
              Top = 23
              Width = 48
              Height = 12
              Caption = #24618#29289#21517#31216
            end
            object Label6: TLabel
              Left = 15
              Top = 77
              Width = 54
              Height = 12
              Caption = #24618#29289#25968#37327':'
            end
            object EditDogzName: TEdit
              Left = 15
              Top = 40
              Width = 131
              Height = 20
              Hint = '?'#32622#40664'?'#21484'?'#30340#24618#29289#21517'?'#12290
              ImeName = 'Microsoft Office IME 2007'
              TabOrder = 0
              OnChange = EditDogzNameChange
            end
            object EditDogzCount: TSpinEdit
              Left = 85
              Top = 74
              Width = 61
              Height = 21
              Hint = '?'#32622#21487#21484'?'#26368#22823'?'#37327#12290
              EditorEnabled = False
              MaxValue = 255
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditDogzCountChange
            end
          end
          object GroupBox12: TGroupBox
            Left = 180
            Top = 3
            Width = 361
            Height = 178
            TabOrder = 1
            object GridDogz: TStringGrid
              Left = 15
              Top = 20
              Width = 331
              Height = 141
              ColCount = 4
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 11
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
              OnSetEditText = GridBoneFammSetEditText
              ColWidths = (
                55
                76
                57
                52)
            end
          end
        end
        object TabSheet41: TTabSheet
          Caption = #23506#20912#25484
          ImageIndex = 32
          object GroupBox41: TGroupBox
            Left = 10
            Top = 10
            Width = 181
            Height = 91
            TabOrder = 0
            object Label101: TLabel
              Left = 10
              Top = 23
              Width = 54
              Height = 12
              Caption = #30456#24046#26426#29575':'
            end
            object Label102: TLabel
              Left = 10
              Top = 53
              Width = 54
              Height = 12
              Caption = #30456#24046#38480#21046':'
            end
            object EditMabMabeHitRandRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 21
              Hint = #25915'?'#34987#25915'??'#26041#30456#24046#31561'?'#21629#20013#26426#29575#65292'?'#23383#36234#22823#26426#29575#36234#23567#12290
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitRandRateChange
            end
            object EditMabMabeHitMinLvLimit: TSpinEdit
              Left = 85
              Top = 49
              Width = 66
              Height = 21
              Hint = #25915'?'#34987#25915'??'#26041#30456#24046#31561'?'#21629#20013#26426#29575#65292#26368#23567#38480#21046#65292'?'#23383#36234#23567#26426#29575#36234#20302#12290
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditMabMabeHitMinLvLimitChange
            end
          end
          object GroupBox42: TGroupBox
            Left = 10
            Top = 110
            Width = 181
            Height = 61
            Caption = #40635#30201#25104#21151#26426#29575
            TabOrder = 1
            object Label103: TLabel
              Left = 10
              Top = 23
              Width = 54
              Height = 12
              Caption = #25104#21151#26426#29575':'
            end
            object EditMabMabeHitSucessRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 21
              Hint = #25915'?'#40635'?'#26426#29575#65292#26368#23567#38480#21046#65292'?'#23383#36234#23567#26426#29575#36234#20302#12290
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitSucessRateChange
            end
          end
          object GroupBox43: TGroupBox
            Left = 200
            Top = 10
            Width = 181
            Height = 61
            Caption = #40635#30201#26102#38388#21442#25968
            TabOrder = 2
            object Label104: TLabel
              Left = 10
              Top = 23
              Width = 54
              Height = 12
              Caption = #21629#20013#26426#29575':'
            end
            object EditMabMabeHitMabeTimeRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 21
              Hint = #40635'????'#24230#20493#29575#65292#22522'??'#35282#33394#30340#39764#27861#26377'?'#12290
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitMabeTimeRateChange
            end
          end
        end
        object TabSheet43: TTabSheet
          Caption = #29422#23376#21564
          ImageIndex = 33
          object GroupBox48: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = #40635#30201#25915#20987
            TabOrder = 0
            object CheckBoxGroupMbAttackPlayObject: TCheckBox
              Left = 10
              Top = 20
              Width = 121
              Height = 21
              Hint = #25171'?'#27492#21151#33021#21518#65292#23601#21487#20197#40635'?'#20154#29289
              Caption = #24320#21551#40635#30201#25915#20987
              TabOrder = 0
              OnClick = CheckBoxGroupMbAttackPlayObjectClick
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #27969#26143#28779#38632
          ImageIndex = 14
          object GroupBox49: TGroupBox
            Left = 24
            Top = 24
            Width = 209
            Height = 105
            Caption = #22825#19978#33853#28976#35774#23450
            TabOrder = 0
            object Label114: TLabel
              Left = 16
              Top = 32
              Width = 54
              Height = 12
              Caption = #25915#20987#20493#25968':'
            end
            object Label115: TLabel
              Left = 16
              Top = 64
              Width = 54
              Height = 12
              Caption = #25915#20987#27425#25968':'
            end
            object Label116: TLabel
              Left = 176
              Top = 32
              Width = 12
              Height = 12
              Caption = #20493
            end
            object Label117: TLabel
              Left = 176
              Top = 64
              Width = 12
              Height = 12
              Caption = #27425
            end
            object Mag53Spin1: TSpinEdit
              Left = 109
              Top = 27
              Width = 66
              Height = 21
              Hint = '?? ????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
            end
            object Mag53Spin2: TSpinEdit
              Left = 109
              Top = 59
              Width = 66
              Height = 21
              Hint = '?? ????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 1
              Value = 10
            end
          end
        end
      end
      object ButtonSkillSave: TButton
        Left = 499
        Top = 365
        Width = 89
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonSkillSaveClick
      end
    end
    object TabSheet34: TTabSheet
      Caption = #21319#32423#27494#22120
      ImageIndex = 6
      object GroupBox8: TGroupBox
        Left = 11
        Top = 11
        Width = 195
        Height = 160
        Caption = #21319#32423#35774#32622
        TabOrder = 0
        object Label13: TLabel
          Left = 11
          Top = 25
          Width = 54
          Height = 12
          Caption = #26368#39640#28857#25968':'
        end
        object Label15: TLabel
          Left = 11
          Top = 58
          Width = 54
          Height = 12
          Caption = #21319#32423#20215#26684':'
        end
        object Label16: TLabel
          Left = 11
          Top = 90
          Width = 54
          Height = 12
          Caption = #21319#32423#26102#38388':'
        end
        object Label17: TLabel
          Left = 11
          Top = 123
          Width = 54
          Height = 12
          Caption = #36807#26399#22825#25968':'
        end
        object Label18: TLabel
          Left = 169
          Top = 90
          Width = 12
          Height = 12
          Caption = #31186
        end
        object Label19: TLabel
          Left = 169
          Top = 123
          Width = 12
          Height = 12
          Caption = #22825
        end
        object EditUpgradeWeaponMaxPoint: TSpinEdit
          Left = 81
          Top = 20
          Width = 82
          Height = 21
          Hint = 'Maximum no of refines that can be made on 1 weapon'
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 20
          OnChange = EditUpgradeWeaponMaxPointChange
        end
        object EditUpgradeWeaponPrice: TSpinEdit
          Left = 81
          Top = 53
          Width = 82
          Height = 21
          Hint = 'Cost per refine'
          EditorEnabled = False
          MaxValue = 1000000
          MinValue = 1
          TabOrder = 1
          Value = 10000
          OnChange = EditUpgradeWeaponPriceChange
        end
        object EditUPgradeWeaponGetBackTime: TSpinEdit
          Left = 81
          Top = 85
          Width = 82
          Height = 21
          Hint = 'Time in minutes before you can get weapon back'
          EditorEnabled = False
          MaxValue = 36000000
          MinValue = 1
          TabOrder = 2
          Value = 3600
          OnChange = EditUPgradeWeaponGetBackTimeChange
        end
        object EditClearExpireUpgradeWeaponDays: TSpinEdit
          Left = 81
          Top = 118
          Width = 82
          Height = 21
          Hint = 'No of days weapon will be kept before being deleted'
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 3
          Value = 8
          OnChange = EditClearExpireUpgradeWeaponDaysChange
        end
      end
      object GroupBox18: TGroupBox
        Left = 239
        Top = 11
        Width = 359
        Height = 120
        Caption = #22686#21152#25915#20987#26426#29575#25511#21046
        TabOrder = 1
        object Label20: TLabel
          Left = 11
          Top = 25
          Width = 66
          Height = 12
          Caption = #21152#19968#28857#26426#29575':'
        end
        object Label21: TLabel
          Left = 11
          Top = 58
          Width = 66
          Height = 12
          Caption = #21152#20108#28857#26426#29575':'
        end
        object Label22: TLabel
          Left = 11
          Top = 90
          Width = 66
          Height = 12
          Caption = #21152#19977#28857#26426#29575':'
        end
        object ScrollBarUpgradeWeaponDCRate: TScrollBar
          Left = 86
          Top = 21
          Width = 197
          Height = 23
          Hint = '???????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponDCRateChange
        end
        object EditUpgradeWeaponDCRate: TEdit
          Left = 293
          Top = 21
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          Text = '100'
        end
        object ScrollBarUpgradeWeaponDCTwoPointRate: TScrollBar
          Left = 86
          Top = 54
          Width = 197
          Height = 22
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponDCTwoPointRateChange
        end
        object EditUpgradeWeaponDCTwoPointRate: TEdit
          Left = 293
          Top = 54
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          Text = '30'
        end
        object ScrollBarUpgradeWeaponDCThreePointRate: TScrollBar
          Left = 86
          Top = 86
          Width = 197
          Height = 23
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponDCThreePointRateChange
        end
        object EditUpgradeWeaponDCThreePointRate: TEdit
          Left = 293
          Top = 86
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
          Text = '200'
        end
      end
      object GroupBox19: TGroupBox
        Left = 239
        Top = 141
        Width = 359
        Height = 125
        Caption = #22686#21152#36947#26415#26426#29575#25511#21046
        TabOrder = 2
        object Label23: TLabel
          Left = 11
          Top = 25
          Width = 66
          Height = 12
          Caption = #21152#19968#28857#26426#29575':'
        end
        object Label24: TLabel
          Left = 11
          Top = 58
          Width = 66
          Height = 12
          Caption = #21152#20108#28857#26426#29575':'
        end
        object Label25: TLabel
          Left = 11
          Top = 90
          Width = 66
          Height = 12
          Caption = #21152#19977#28857#26426#29575':'
        end
        object ScrollBarUpgradeWeaponSCRate: TScrollBar
          Left = 86
          Top = 21
          Width = 197
          Height = 23
          Hint = '??????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponSCRateChange
        end
        object EditUpgradeWeaponSCRate: TEdit
          Left = 293
          Top = 21
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          Text = '100'
        end
        object ScrollBarUpgradeWeaponSCTwoPointRate: TScrollBar
          Left = 86
          Top = 54
          Width = 197
          Height = 22
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponSCTwoPointRateChange
        end
        object EditUpgradeWeaponSCTwoPointRate: TEdit
          Left = 293
          Top = 54
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          Text = '30'
        end
        object ScrollBarUpgradeWeaponSCThreePointRate: TScrollBar
          Left = 86
          Top = 86
          Width = 197
          Height = 23
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponSCThreePointRateChange
        end
        object EditUpgradeWeaponSCThreePointRate: TEdit
          Left = 293
          Top = 86
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
          Text = '200'
        end
      end
      object GroupBox20: TGroupBox
        Left = 239
        Top = 276
        Width = 359
        Height = 122
        Caption = #22686#21152#39764#27861#26426#29575#25511#21046
        TabOrder = 3
        object Label26: TLabel
          Left = 11
          Top = 25
          Width = 66
          Height = 12
          Caption = #21152#19968#28857#26426#29575':'
        end
        object Label27: TLabel
          Left = 11
          Top = 58
          Width = 66
          Height = 12
          Caption = #21152#20108#28857#26426#29575':'
        end
        object Label28: TLabel
          Left = 11
          Top = 90
          Width = 66
          Height = 12
          Caption = #21152#19977#28857#26426#29575':'
        end
        object ScrollBarUpgradeWeaponMCRate: TScrollBar
          Left = 86
          Top = 21
          Width = 197
          Height = 23
          Hint = '??????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponMCRateChange
        end
        object EditUpgradeWeaponMCRate: TEdit
          Left = 293
          Top = 21
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
          Text = '100'
        end
        object ScrollBarUpgradeWeaponMCTwoPointRate: TScrollBar
          Left = 86
          Top = 54
          Width = 197
          Height = 22
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponMCTwoPointRateChange
        end
        object EditUpgradeWeaponMCTwoPointRate: TEdit
          Left = 293
          Top = 54
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
          Text = '30'
        end
        object ScrollBarUpgradeWeaponMCThreePointRate: TScrollBar
          Left = 86
          Top = 86
          Width = 197
          Height = 23
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponMCThreePointRateChange
        end
        object EditUpgradeWeaponMCThreePointRate: TEdit
          Left = 293
          Top = 86
          Width = 55
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
          Text = '200'
        end
      end
      object ButtonUpgradeWeaponSave: TButton
        Left = 11
        Top = 370
        Width = 88
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 4
        OnClick = ButtonUpgradeWeaponSaveClick
      end
      object ButtonUpgradeWeaponDefaulf: TButton
        Left = 119
        Top = 370
        Width = 87
        Height = 33
        Hint = 'Reload default values'
        Caption = #40664#35748'(&D)'
        TabOrder = 5
        OnClick = ButtonUpgradeWeaponDefaulfClick
      end
    end
    object TabSheet35: TTabSheet
      Caption = #25366#30719#25511#21046
      ImageIndex = 7
      object ButtonMakeMineSave: TButton
        Left = 509
        Top = 365
        Width = 89
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonMakeMineSaveClick
      end
      object ButtonMakeMineDefault: TButton
        Left = 401
        Top = 365
        Width = 88
        Height = 31
        Hint = 'Reload default values'
        Caption = #40664#35748'(&D)'
        TabOrder = 1
        OnClick = ButtonMakeMineDefaultClick
      end
      object GroupBox24: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 75
        Caption = #25366#21040#30719#30707#26426#29575
        TabOrder = 2
        object Label32: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #21629#20013#26426#29575':'
        end
        object Label33: TLabel
          Left = 10
          Top = 45
          Width = 54
          Height = 12
          Caption = #25366#30719#26426#29575':'
        end
        object ScrollBarMakeMineHitRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Hint = '?'#32622#30340'?'#23383#36234#23567#26426#29575#36234#22823#12290
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarMakeMineHitRateChange
        end
        object EditMakeMineHitRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarMakeMineRate: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Hint = '?'#32622#30340'?'#23383#36234#23567#26426#29575#36234#22823#12290
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarMakeMineRateChange
        end
        object EditMakeMineRate: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox25: TGroupBox
        Left = 10
        Top = 90
        Width = 341
        Height = 271
        Caption = #30719#30707#31867#22411#26426#29575
        TabOrder = 3
        object Label34: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #30719#30707#22240#23376':'
        end
        object Label35: TLabel
          Left = 10
          Top = 48
          Width = 54
          Height = 12
          Caption = #37329#30719#26426#29575':'
        end
        object Label36: TLabel
          Left = 10
          Top = 70
          Width = 54
          Height = 12
          Caption = #38134#30719#26426#29575':'
        end
        object Label37: TLabel
          Left = 10
          Top = 95
          Width = 54
          Height = 12
          Caption = #38081#30719#26426#29575':'
        end
        object Label38: TLabel
          Left = 10
          Top = 120
          Width = 54
          Height = 12
          Caption = #40657#38081#26426#29575':'
        end
        object ScrollBarStoneTypeRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarStoneTypeRateChange
        end
        object EditStoneTypeRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarGoldStoneMax: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarGoldStoneMaxChange
        end
        object EditGoldStoneMax: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarSilverStoneMax: TScrollBar
          Left = 90
          Top = 70
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarSilverStoneMaxChange
        end
        object EditSilverStoneMax: TEdit
          Left = 260
          Top = 70
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarSteelStoneMax: TScrollBar
          Left = 90
          Top = 95
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarSteelStoneMaxChange
        end
        object EditSteelStoneMax: TEdit
          Left = 260
          Top = 95
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditBlackStoneMax: TEdit
          Left = 260
          Top = 120
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarBlackStoneMax: TScrollBar
          Left = 90
          Top = 120
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarBlackStoneMaxChange
        end
      end
      object GroupBox26: TGroupBox
        Left = 360
        Top = 10
        Width = 191
        Height = 151
        Caption = #30719#30707#32431#24230#25511#21046
        TabOrder = 4
        object Label39: TLabel
          Left = 10
          Top = 23
          Width = 66
          Height = 12
          Caption = #20302#32431#24230#21697#36136':'
        end
        object Label40: TLabel
          Left = 10
          Top = 53
          Width = 90
          Height = 12
          Caption = #20302#32431#24230#21697#36136#33539#22260':'
        end
        object Label41: TLabel
          Left = 10
          Top = 83
          Width = 66
          Height = 12
          Caption = #39640#32431#24230#21697#36136':'
        end
        object Label42: TLabel
          Left = 10
          Top = 113
          Width = 90
          Height = 12
          Caption = #39640#32431#24230#21697#36136#33539#22260':'
        end
        object EditStoneMinDura: TSpinEdit
          Left = 115
          Top = 19
          Width = 56
          Height = 21
          Hint = '?'#30707#20986'?'#26368#20302#21697'?'#28857'?'#12290
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditStoneMinDuraChange
        end
        object EditStoneGeneralDuraRate: TSpinEdit
          Left = 115
          Top = 49
          Width = 56
          Height = 21
          Hint = '?'#30707'?'#26426#20986'?'#21697'?'#28857'?'#33539'?'#12290
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditStoneGeneralDuraRateChange
        end
        object EditStoneAddDuraRate: TSpinEdit
          Left = 115
          Top = 79
          Width = 56
          Height = 21
          Hint = '?'#30707#20986'?'#39640#21697'?'#28857'?'#26426#29575#65292#39640#21697'?'#37327#25351#21487'?'#21040'20'#25110#20197#19978#30340#28857'?'#12290
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditStoneAddDuraRateChange
        end
        object EditStoneAddDuraMax: TSpinEdit
          Left = 115
          Top = 109
          Width = 56
          Height = 21
          Hint = #39640#21697'??'#30707'?'#26426#20986'?'#21697'?'#28857'?'#33539'?'#12290
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 3
          Value = 10
          OnChange = EditStoneAddDuraMaxChange
        end
      end
    end
    object TabSheet42: TTabSheet
      Caption = #31069#31119#27833#25511#21046
      ImageIndex = 12
      object ButtonWeaponMakeLuckDefault: TButton
        Left = 391
        Top = 365
        Width = 88
        Height = 31
        Hint = 'Reload default values'
        Caption = #40664#35748'(&D)'
        TabOrder = 0
        OnClick = ButtonWeaponMakeLuckDefaultClick
      end
      object ButtonWeaponMakeLuckSave: TButton
        Left = 499
        Top = 365
        Width = 89
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonWeaponMakeLuckSaveClick
      end
      object GroupBox44: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 271
        Caption = #26426#29575#35774#32622
        TabOrder = 2
        object Label105: TLabel
          Left = 10
          Top = 23
          Width = 6
          Height = 12
        end
        object Label106: TLabel
          Left = 10
          Top = 48
          Width = 54
          Height = 12
          Caption = #19968#28857#28857#25968':'
        end
        object Label107: TLabel
          Left = 10
          Top = 70
          Width = 54
          Height = 12
          Caption = #20108#28857#28857#25968':'
        end
        object Label108: TLabel
          Left = 10
          Top = 95
          Width = 54
          Height = 12
          Caption = #20108#28857#26426#29575':'
        end
        object Label109: TLabel
          Left = 10
          Top = 120
          Width = 54
          Height = 12
          Caption = #19977#28857#28857#25968':'
        end
        object Label110: TLabel
          Left = 10
          Top = 145
          Width = 54
          Height = 12
          Caption = #19977#28857#26426#29575':'
        end
        object Label113: TLabel
          Left = 10
          Top = 24
          Width = 54
          Height = 12
          Caption = #35781#21650#26426#29575':'
        end
        object ScrollBarWeaponMakeUnLuckRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Hint = #20351#29992#31069#31119#27833'??'#26426#29575#65292'?'#23383#36234#22823#26426#29575#36234#23567#12290
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarWeaponMakeUnLuckRateChange
        end
        object EditWeaponMakeUnLuckRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarWeaponMakeLuckPoint1: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Hint = '?'#27494#22120#30340#24184'?'#28857#23567#20110#27492#28857'??'#20351#29992#31069#31119#27833'?100% '#25104#21151#12290
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarWeaponMakeLuckPoint1Change
        end
        object EditWeaponMakeLuckPoint1: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarWeaponMakeLuckPoint2: TScrollBar
          Left = 90
          Top = 70
          Width = 161
          Height = 19
          Hint = '?'#27494#22120#30340#24184'?'#28857#23567#20110#27492#28857'??'#20351#29992#31069#31119#27833'?'#25353#25351#23450#26426#29575'?'#23450#26159#21542#21152#24184'?'#12290
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarWeaponMakeLuckPoint2Change
        end
        object EditWeaponMakeLuckPoint2: TEdit
          Left = 260
          Top = 70
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarWeaponMakeLuckPoint2Rate: TScrollBar
          Left = 90
          Top = 95
          Width = 161
          Height = 19
          Hint = #26426#29575#28857'?'#65292'?'#23383#36234#22823#26426#29575#36234#23567#12290
          Max = 500
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarWeaponMakeLuckPoint2RateChange
        end
        object EditWeaponMakeLuckPoint2Rate: TEdit
          Left = 260
          Top = 95
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditWeaponMakeLuckPoint3: TEdit
          Left = 260
          Top = 120
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarWeaponMakeLuckPoint3: TScrollBar
          Left = 90
          Top = 120
          Width = 161
          Height = 19
          Hint = '?'#27494#22120#30340#24184'?'#28857#23567#20110#27492#28857'??'#20351#29992#31069#31119#27833'?'#25353#25351#23450#26426#29575'?'#23450#26159#21542#21152#24184'?'#12290
          Max = 500
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarWeaponMakeLuckPoint3Change
        end
        object ScrollBarWeaponMakeLuckPoint3Rate: TScrollBar
          Left = 90
          Top = 145
          Width = 161
          Height = 19
          Hint = #26426#29575#28857'?'#65292'?'#23383#36234#22823#26426#29575#36234#23567#12290
          Max = 500
          PageSize = 0
          TabOrder = 10
          OnChange = ScrollBarWeaponMakeLuckPoint3RateChange
        end
        object EditWeaponMakeLuckPoint3Rate: TEdit
          Left = 260
          Top = 145
          Width = 71
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
        end
      end
    end
    object TabSheet37: TTabSheet
      Caption = #24425#31080#25511#21046
      ImageIndex = 8
      object ButtonWinLotterySave: TButton
        Left = 499
        Top = 365
        Width = 89
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        ModalResult = 1
        TabOrder = 0
        OnClick = ButtonWinLotterySaveClick
      end
      object ButtonWinLotteryDefault: TButton
        Left = 391
        Top = 365
        Width = 88
        Height = 31
        Hint = 'Reload default values'
        Caption = #40664#35748'(&D)'
        TabOrder = 1
        OnClick = ButtonWinLotteryDefaultClick
      end
      object GroupBox27: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 211
        Caption = #20013#22870#26426#29575
        TabOrder = 2
        object Label43: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 12
          Caption = '1'#31561#22870':'
        end
        object Label44: TLabel
          Left = 10
          Top = 78
          Width = 36
          Height = 12
          Caption = '2'#31561#22870':'
        end
        object Label45: TLabel
          Left = 10
          Top = 100
          Width = 36
          Height = 12
          Caption = '3'#31561#22870':'
        end
        object Label46: TLabel
          Left = 10
          Top = 125
          Width = 36
          Height = 12
          Caption = '4'#31561#22870':'
        end
        object Label47: TLabel
          Left = 10
          Top = 150
          Width = 36
          Height = 12
          Caption = '5'#31561#22870':'
        end
        object Label48: TLabel
          Left = 10
          Top = 175
          Width = 36
          Height = 12
          Caption = '6'#31561#22870':'
        end
        object Label49: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #24425#31080#22240#23376':'
        end
        object ScrollBarWinLottery1Max: TScrollBar
          Left = 70
          Top = 50
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarWinLottery1MaxChange
        end
        object EditWinLottery1Max: TEdit
          Left = 240
          Top = 50
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarWinLottery2Max: TScrollBar
          Left = 70
          Top = 75
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarWinLottery2MaxChange
        end
        object EditWinLottery2Max: TEdit
          Left = 240
          Top = 75
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarWinLottery3Max: TScrollBar
          Left = 70
          Top = 100
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarWinLottery3MaxChange
        end
        object EditWinLottery3Max: TEdit
          Left = 240
          Top = 100
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarWinLottery4Max: TScrollBar
          Left = 70
          Top = 125
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarWinLottery4MaxChange
        end
        object EditWinLottery4Max: TEdit
          Left = 240
          Top = 125
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditWinLottery5Max: TEdit
          Left = 240
          Top = 150
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarWinLottery5Max: TScrollBar
          Left = 70
          Top = 150
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarWinLottery5MaxChange
        end
        object ScrollBarWinLottery6Max: TScrollBar
          Left = 70
          Top = 175
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 10
          OnChange = ScrollBarWinLottery6MaxChange
        end
        object EditWinLottery6Max: TEdit
          Left = 240
          Top = 175
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
        end
        object EditWinLotteryRate: TEdit
          Left = 240
          Top = 20
          Width = 91
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 12
        end
        object ScrollBarWinLotteryRate: TScrollBar
          Left = 70
          Top = 20
          Width = 161
          Height = 19
          Max = 100000
          PageSize = 0
          TabOrder = 13
          OnChange = ScrollBarWinLotteryRateChange
        end
      end
      object GroupBox28: TGroupBox
        Left = 360
        Top = 10
        Width = 181
        Height = 211
        Caption = #22870#37329#35774#32622
        TabOrder = 3
        object Label50: TLabel
          Left = 10
          Top = 23
          Width = 36
          Height = 12
          Caption = '1'#31561#22870':'
        end
        object Label51: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 12
          Caption = '2'#31561#22870':'
        end
        object Label52: TLabel
          Left = 10
          Top = 83
          Width = 36
          Height = 12
          Caption = '3'#31561#22870':'
        end
        object Label53: TLabel
          Left = 10
          Top = 113
          Width = 36
          Height = 12
          Caption = '4'#31561#22870':'
        end
        object Label54: TLabel
          Left = 10
          Top = 143
          Width = 36
          Height = 12
          Caption = '5'#31561#22870':'
        end
        object Label55: TLabel
          Left = 10
          Top = 173
          Width = 36
          Height = 12
          Caption = '6'#31561#22870':'
        end
        object EditWinLottery1Gold: TSpinEdit
          Left = 70
          Top = 19
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 0
          Value = 100000000
          OnChange = EditWinLottery1GoldChange
        end
        object EditWinLottery2Gold: TSpinEdit
          Left = 70
          Top = 49
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditWinLottery2GoldChange
        end
        object EditWinLottery3Gold: TSpinEdit
          Left = 70
          Top = 79
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditWinLottery3GoldChange
        end
        object EditWinLottery4Gold: TSpinEdit
          Left = 70
          Top = 109
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 3
          Value = 10
          OnChange = EditWinLottery4GoldChange
        end
        object EditWinLottery5Gold: TSpinEdit
          Left = 70
          Top = 139
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 4
          Value = 10
          OnChange = EditWinLottery5GoldChange
        end
        object EditWinLottery6Gold: TSpinEdit
          Left = 70
          Top = 169
          Width = 101
          Height = 21
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 5
          Value = 10
          OnChange = EditWinLottery6GoldChange
        end
      end
    end
    object TabSheet40: TTabSheet
      Caption = #31048#31095#29983#25928
      ImageIndex = 11
      object ButtonSpiritMutinySave: TButton
        Left = 488
        Top = 354
        Width = 87
        Height = 34
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonSpiritMutinySaveClick
      end
      object GroupBox36: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 111
        TabOrder = 1
        object Label94: TLabel
          Left = 14
          Top = 50
          Width = 54
          Height = 12
          Caption = #29983#25928#26102#38271':'
        end
        object Label96: TLabel
          Left = 14
          Top = 80
          Width = 54
          Height = 12
          Caption = #33021#37327#20493#25968':'
          Enabled = False
          Transparent = False
        end
        object CheckBoxSpiritMutiny: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = #21551#29992#31048#31095#29305#27530#21151#33021
          TabOrder = 0
          OnClick = CheckBoxSpiritMutinyClick
        end
        object EditSpiritMutinyTime: TSpinEdit
          Left = 90
          Top = 45
          Width = 61
          Height = 21
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditSpiritMutinyTimeChange
        end
        object EditSpiritPowerRate: TSpinEdit
          Left = 90
          Top = 75
          Width = 61
          Height = 21
          EditorEnabled = False
          Enabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditSpiritPowerRateChange
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #25216#33021#24310#36831#12289#25345#32493#26102#38388
      ImageIndex = 12
      object ButtonMagDelaySave: TButton
        Left = 499
        Top = 365
        Width = 89
        Height = 31
        Hint = '??? ??? ?????.'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonMagDelaySaveClick
      end
      object GroupBox50: TGroupBox
        Left = 16
        Top = 16
        Width = 161
        Height = 129
        Caption = #37197#32622
        TabOrder = 1
        object Label121: TLabel
          Left = 8
          Top = 24
          Width = 30
          Height = 12
          Caption = #33539#22260':'
        end
        object EditMagMassPoisonDelay: TSpinEdit
          Left = 91
          Top = 19
          Width = 56
          Height = 21
          Hint = '?? ???? ?????.(??: 4?)'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 0
          Value = 4
          OnChange = EditMagMassPoisonDelayChange
        end
      end
      object ButtonMagDelayCancel: TButton
        Left = 400
        Top = 365
        Width = 89
        Height = 31
        Hint = '??? ??? ???????.'
        Caption = #40664#35748'(&D)'
        TabOrder = 2
        OnClick = ButtonMagDelayCancelClick
      end
      object GroupBox51: TGroupBox
        Left = 184
        Top = 16
        Width = 161
        Height = 129
        Caption = #25216#33021#26102#38388
        TabOrder = 3
      end
    end
  end
end
