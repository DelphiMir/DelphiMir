object frmGameConfig: TfrmGameConfig
  Left = 469
  Top = 327
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28216#25103#21442#25968
  ClientHeight = 352
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object GameConfigControl: TPageControl
    Left = 5
    Top = 3
    Width = 548
    Height = 342
    ActivePage = GameSpeedSheet
    Align = alCustom
    MultiLine = True
    TabOrder = 0
    OnChanging = GameConfigControlChanging
    object GeneralSheet: TTabSheet
      Caption = #29615#22659#35774#32622
      ImageIndex = 2
      object ButtonGeneralSave: TButton
        Left = 438
        Top = 213
        Width = 91
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = 15
        Font.Name = #23435'?'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonGeneralSaveClick
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 126
        Width = 167
        Height = 125
        Caption = #28216#25103#20844#21578#26174#31034#26102#38388#38388#38548'('#31186')'
        TabOrder = 1
        object Label18: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #26174#31034#38388#38548':'
        end
        object Label19: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #25991#23383#39068#33394':'
        end
        object Label21: TLabel
          Left = 10
          Top = 85
          Width = 54
          Height = 12
          Caption = #21069#32512#25991#23383':'
        end
        object EditShowLineNoticeTime: TSpinEdit
          Left = 80
          Top = 19
          Width = 57
          Height = 21
          Hint = #28216'?'#20013#20844#21578#20449#24687'?'#31034'???'#38548'??'#12290
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditShowLineNoticeTimeChange
        end
        object ComboBoxLineNoticeColor: TComboBox
          Left = 80
          Top = 50
          Width = 57
          Height = 20
          Hint = #20844#21578#25991#23383'?'#31034#40664'??'#33394#12290
          Style = csDropDownList
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 0
          TabOrder = 1
          OnChange = ComboBoxLineNoticeColorChange
        end
        object EditLineNoticePreFix: TEdit
          Left = 80
          Top = 80
          Width = 57
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          MaxLength = 20
          TabOrder = 2
          Text = '(!)'
          OnChange = EditLineNoticePreFixChange
        end
      end
      object GroupBox51: TGroupBox
        Left = 10
        Top = 6
        Width = 167
        Height = 115
        Caption = #24191#25773#22312#32447#20154#25968
        TabOrder = 2
        object Label98: TLabel
          Left = 10
          Top = 45
          Width = 30
          Height = 12
          Caption = #20493#29575':'
        end
        object Label99: TLabel
          Left = 10
          Top = 75
          Width = 54
          Height = 12
          Caption = #38388#38548#26102#38388':'
        end
        object Label100: TLabel
          Left = 138
          Top = 75
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditSendOnlineCountRate: TSpinEdit
          Left = 55
          Top = 40
          Width = 66
          Height = 21
          Hint = '?'#25773#22312'?'#20154#29289'?'#20551#20154'?'#20493#29575#65292'???'#25454'?'#38500#20197'10'#65292#40664'??10'#23601#26159#19968#20493#65292'11 '#23601#26159'1.1'#20493#12290
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditSendOnlineCountRateChange
        end
        object EditSendOnlineTime: TSpinEdit
          Left = 69
          Top = 70
          Width = 60
          Height = 21
          Hint = '?'#25773#22312'?'#20154'??'#38548'??'#12290
          EditorEnabled = False
          Increment = 10
          MaxValue = 200000
          MinValue = 5
          TabOrder = 1
          Value = 10
          OnChange = EditSendOnlineTimeChange
        end
        object CheckBoxSendOnlineCount: TCheckBox
          Left = 10
          Top = 18
          Width = 103
          Height = 21
          Hint = #26159#21542'?'#29992#22312'??'#25773#22312'?'#20154'?'#21151#33021#65292#25171'?'#27492#21151#33021#21518#22312#28216'?'#37324'?'#20197'?'#23383#26041#24335'?'#31034#22312'?'#20154'?'#12290
          Caption = #24191#25773#22312#32447#20154#25968
          TabOrder = 2
          OnClick = CheckBoxSendOnlineCountClick
        end
      end
      object GroupBox5: TGroupBox
        Left = 186
        Top = 6
        Width = 181
        Height = 55
        Caption = #25511#21046#21488#26174#31034#20154#25968#26102#38388'('#31186')'
        TabOrder = 3
        object Label17: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #26174#31034#38388#38548':'
        end
        object EditConsoleShowUserCountTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 76
          Height = 21
          Hint = #31243#24207#25511#21046#21488'?'#31034#22312'?'#20154'????'#38548#12290
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditConsoleShowUserCountTimeChange
        end
      end
      object GroupBoxInfo: TGroupBox
        Left = 186
        Top = 66
        Width = 181
        Height = 55
        Caption = #23458#25143#31471#29256#26412#21495
        TabOrder = 4
        object Label16: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #29256#26412#26085#26399':'
        end
        object EditSoftVersionDate: TEdit
          Left = 80
          Top = 20
          Width = 91
          Height = 20
          Hint = #23458'?'#31471#29256#26412#26085#26399'?'#32622#65292#27492#26085#26399'?'#23383#24517'??'#23458'?'#31471#19978#30340#26085#26399'??'#19968#33268#65292#21542'??'#20837#28216'???'#25552#31034#29256#26412'??'#12290#28857#20445#23384#25353'?'#21518#29983#25928#12290
          ImeMode = imHanguel
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = '20020522'
          OnChange = EditSoftVersionDateChange
        end
      end
      object GroupBox52: TGroupBox
        Left = 186
        Top = 126
        Width = 181
        Height = 121
        Caption = #29289#21697#24618#29289#25968#25454#24211#20493#29575
        TabOrder = 5
        object Label101: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #24618#29289':'
        end
        object Label102: TLabel
          Left = 10
          Top = 55
          Width = 36
          Height = 12
          Caption = #29289#21697'1:'
        end
        object Label103: TLabel
          Left = 10
          Top = 85
          Width = 36
          Height = 12
          Caption = #29289#21697'2:'
        end
        object EditMonsterPowerRate: TSpinEdit
          Left = 85
          Top = 20
          Width = 86
          Height = 21
          Hint = #24618#29289'?'#24615#20493#29575'(HP'#12289'MP'#12289'DC'#12289'MC'#12289'SC)'#65292'???'#23383'??'#21069'?'#25454#38500#20197'10'#12290
          EditorEnabled = False
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditMonsterPowerRateChange
        end
        object EditEditItemsPowerRate: TSpinEdit
          Left = 85
          Top = 50
          Width = 86
          Height = 21
          Hint = #29289#21697'?'#24615#20493#29575'(DC'#12289'MC'#12289'SC)'#65292'???'#23383'??'#21069'?'#25454#38500#20197'10'#12290
          EditorEnabled = False
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditEditItemsPowerRateChange
        end
        object EditItemsACPowerRate: TSpinEdit
          Left = 85
          Top = 80
          Width = 86
          Height = 21
          Hint = #29289#21697'?'#24615#20493#29575'(AC'#12289'MAC'#20108'?)'#65292'???'#23383'??'#21069'?'#25454#38500#20197'10'#12290
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditItemsACPowerRateChange
        end
      end
      object GroupBox73: TGroupBox
        Left = 376
        Top = 126
        Width = 153
        Height = 61
        Caption = #23458#25143#31471#29256#26412#25511#21046
        TabOrder = 7
        object CheckBoxCanOldClientLogon: TCheckBox
          Left = 10
          Top = 20
          Width = 135
          Height = 21
          Hint = #26159#21542#20801'?'#26222#36890'?'#23458'?'#31471#30331'?'#28216'?'#65292'?'#19978'?'#25171'?'#65292#22914#26524'??'#27492#21151#33021#65292'?'#32769#23458'?'#31471'?'#26080#27861#30331'?'#21040#28216'?'#12290
          Caption = #20801#35768#26222#36890#23458#25143#31471#30331#24405
          TabOrder = 0
          OnClick = CheckBoxCanOldClientLogonClick
        end
      end
      object GroupBox35: TGroupBox
        Left = 376
        Top = 8
        Width = 153
        Height = 111
        Caption = #25511#21046#21488#26174#31034#20449#24687
        TabOrder = 6
        object CheckBoxShowMakeItemMsg: TCheckBox
          Left = 10
          Top = 18
          Width = 121
          Height = 21
          Caption = 'GM'#25805#20316#20449#24687
          TabOrder = 0
          OnClick = CheckBoxShowMakeItemMsgClick
        end
        object CbViewHack: TCheckBox
          Left = 10
          Top = 38
          Width = 121
          Height = 21
          Caption = #36895#24230#24322#24120#20449#24687
          TabOrder = 1
          OnClick = CbViewHackClick
        end
        object CkViewAdmfail: TCheckBox
          Left = 10
          Top = 58
          Width = 121
          Height = 21
          Caption = #38750#27861#30331#24405#20449#24687
          TabOrder = 2
          OnClick = CkViewAdmfailClick
        end
        object CheckBoxShowExceptionMsg: TCheckBox
          Left = 10
          Top = 78
          Width = 121
          Height = 21
          Caption = #24322#24120#38169#35823#20449#24687
          TabOrder = 3
          OnClick = CheckBoxShowExceptionMsgClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #28216#25103#36873#39033'(2)'
      ImageIndex = 7
      object ButtonOptionSave0: TButton
        Left = 452
        Top = 226
        Width = 77
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonOptionSave0Click
      end
      object GroupBox28: TGroupBox
        Left = 10
        Top = 10
        Width = 127
        Height = 103
        Caption = #28216#25103#27169#24335
        TabOrder = 1
        object CheckBoxTestServer: TCheckBox
          Left = 10
          Top = 18
          Width = 91
          Height = 21
          Hint = '??'#27169#24335#65292#25171'?'#27492#27169#24335#65292#21487'?'#26381'?'#22120#21508'???'#21450#21151#33021'?'#34892'??'#12290
          Caption = #27979#35797#27169#24335
          TabOrder = 0
          OnClick = CheckBoxTestServerClick
        end
        object CheckBoxServiceMode: TCheckBox
          Left = 10
          Top = 38
          Width = 91
          Height = 21
          Hint = #20813'?'#27169#24335#65292#25171'?'#27492#20808'??'#19981'?'#29992'???'#12290
          Caption = #20813#36153#27169#24335
          TabOrder = 1
          OnClick = CheckBoxServiceModeClick
        end
        object CheckBoxVentureMode: TCheckBox
          Left = 10
          Top = 58
          Width = 101
          Height = 21
          Caption = #19981#21047#24618#27169#24335
          TabOrder = 2
          OnClick = CheckBoxVentureModeClick
        end
        object CheckBoxNonPKMode: TCheckBox
          Left = 10
          Top = 78
          Width = 101
          Height = 21
          Caption = #31105#27490'PK'#27169#24335
          TabOrder = 3
          OnClick = CheckBoxNonPKModeClick
        end
      end
      object GroupBox29: TGroupBox
        Left = 10
        Top = 122
        Width = 167
        Height = 87
        Caption = #27979#35797#27169#24335
        TabOrder = 2
        object Label61: TLabel
          Left = 10
          Top = 17
          Width = 54
          Height = 12
          Caption = #24320#22987#31561#32423':'
        end
        object Label62: TLabel
          Left = 10
          Top = 39
          Width = 54
          Height = 12
          Caption = #24320#22987#37329#24065':'
        end
        object Label63: TLabel
          Left = 10
          Top = 61
          Width = 54
          Height = 12
          Caption = #20154#25968#38480#21046':'
        end
        object EditTestLevel: TSpinEdit
          Left = 69
          Top = 12
          Width = 86
          Height = 21
          Hint = #20154#29289#36215#22987#31561'?'#12290
          MaxValue = 20000
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = EditTestLevelChange
          OnKeyDown = EditTestLevelKeyDown
        end
        object EditTestGold: TSpinEdit
          Left = 69
          Top = 34
          Width = 86
          Height = 21
          Hint = '??'#27169#24335#20154#29289#36215#22987#37329'??'#12290
          Increment = 1000
          MaxValue = 20000000
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditTestGoldChange
        end
        object EditTestUserLimit: TSpinEdit
          Left = 69
          Top = 56
          Width = 86
          Height = 21
          Hint = '??'#27169#24335#26368#39640#21487#19978'?'#20154'?'#38480#21046#12290
          Increment = 10
          MaxValue = 2000
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditTestUserLimitChange
        end
      end
      object GroupBox34: TGroupBox
        Left = 184
        Top = 105
        Width = 193
        Height = 76
        Caption = #35797#29609#31561#32423#38480#21046
        TabOrder = 3
        object Label70: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #31561#32423#38480#21046':'
        end
        object EditTryModeLevel: TSpinEdit
          Left = 69
          Top = 20
          Width = 52
          Height = 21
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditTryModeLevelChange
        end
        object CheckBoxTryModeUseStorage: TCheckBox
          Left = 10
          Top = 48
          Width = 127
          Height = 21
          Hint = '?'#29609#27169#24335#20801'?'#20351#29992'??'#12290
          Caption = #35797#29609#27169#24335#20351#29992#20179#24211
          TabOrder = 1
          OnClick = CheckBoxTryModeUseStorageClick
        end
      end
      object GroupBox33: TGroupBox
        Left = 146
        Top = 10
        Width = 231
        Height = 87
        Caption = #20154#29289#36523#19978#37329#24065#25968#38480#21046
        TabOrder = 4
        object Label68: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #27491#24335#27169#24335':'
        end
        object Label69: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #35797#29609#27169#24335':'
        end
        object EditHumanMaxGold: TSpinEdit
          Left = 69
          Top = 20
          Width = 106
          Height = 21
          Increment = 10000
          MaxValue = 2100000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditHumanMaxGoldChange
        end
        object EditHumanTryModeMaxGold: TSpinEdit
          Left = 69
          Top = 50
          Width = 106
          Height = 21
          Increment = 10000
          MaxValue = 2100000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditHumanTryModeMaxGoldChange
        end
      end
      object GroupBox30: TGroupBox
        Left = 388
        Top = 10
        Width = 141
        Height = 55
        Caption = #20154#29289#36215#22987#26435#38480#35774#32622
        TabOrder = 5
        object Label60: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #36215#22987#26435#38480':'
        end
        object EditStartPermission: TSpinEdit
          Left = 69
          Top = 20
          Width = 66
          Height = 21
          Hint = #20154#29289#28216'?'#36215#22987'?'#38480#65292#40664'??0'#12290
          EditorEnabled = False
          MaxValue = 10
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = EditStartPermissionChange
        end
      end
      object GroupBox31: TGroupBox
        Left = 387
        Top = 71
        Width = 142
        Height = 54
        Caption = #20154#25968#19978#38480#38480#21046
        TabOrder = 6
        object Label64: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #20154#25968#38480#21046':'
        end
        object EditUserFull: TSpinEdit
          Left = 71
          Top = 20
          Width = 58
          Height = 21
          Hint = #26368#26032#21487#19978'?'#20154'?'#38480#21046#65292#36229'?'#27492#20154'?'#21518#19978'??'#25552#31034'?'#23383#12290
          MaxValue = 10000
          MinValue = 0
          TabOrder = 0
          Value = 1000
          OnChange = EditUserFullChange
        end
      end
      object GroupBox19: TGroupBox
        Left = 388
        Top = 126
        Width = 141
        Height = 51
        Caption = #32452#38431#25104#21592#25968#37327
        TabOrder = 7
        object Label41: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #20154#25968':'
        end
        object EditGroupMembersMax: TSpinEdit
          Left = 55
          Top = 20
          Width = 46
          Height = 21
          Hint = '??'#25104'??'#37327#12290
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditGroupMembersMaxChange
        end
      end
      object GroupBox78: TGroupBox
        Left = 184
        Top = 184
        Width = 193
        Height = 73
        Caption = #20817#25442#27604#20363
        TabOrder = 8
        object Label149: TLabel
          Left = 8
          Top = 24
          Width = 66
          Height = 12
          Caption = #37329#24065' - PC'#28857
        end
        object Label150: TLabel
          Left = 8
          Top = 48
          Width = 66
          Height = 12
          Caption = 'PC'#28857' - '#37329#24065
        end
        object EditChangeGameGoldRate: TEdit
          Left = 80
          Top = 21
          Width = 57
          Height = 20
          Hint = '??? ???? ??? ?? ???. (? = ?? * ???)'
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = '0.005'
          OnChange = EditChangeGameGoldRateChange
        end
        object EditChangeGoldRate: TEdit
          Left = 80
          Top = 45
          Width = 57
          Height = 20
          Hint = '??? ???? ??? ?? ???. (?? = ? * ???)'
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 1
          Text = '200'
          OnChange = EditChangeGoldRateChange
        end
      end
      object GroupBox79: TGroupBox
        Left = 384
        Top = 184
        Width = 145
        Height = 41
        Caption = #28216#25103#24065#35774#32622
        TabOrder = 9
        object Label151: TLabel
          Left = 8
          Top = 17
          Width = 66
          Height = 12
          Caption = #28216#25103#24065#25968#20540':'
        end
        object EditAllowGameGoldLevel: TEdit
          Left = 83
          Top = 15
          Width = 46
          Height = 20
          Hint = '??? ??? INCGAMEGOLD? ???? ??? ?? ????'
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = '50'
          OnChange = EditAllowGameGoldLevelChange
        end
      end
      object grp2: TGroupBox
        Left = 10
        Top = 216
        Width = 167
        Height = 41
        Caption = 'PC??? ?? ??'
        TabOrder = 10
        object lbl2: TLabel
          Left = 12
          Top = 17
          Width = 30
          Height = 12
          Caption = '?? ??'
        end
        object EditAllowPCPointLevel: TEdit
          Left = 75
          Top = 15
          Width = 65
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = '50'
          OnChange = EditAllowPCPointLevelChange
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = #22352#26631#33539#22260
      ImageIndex = 4
      object ButtonOptionSave: TButton
        Left = 351
        Top = 202
        Width = 91
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonOptionSaveClick
      end
      object GroupBox18: TGroupBox
        Left = 10
        Top = 72
        Width = 127
        Height = 57
        Caption = #26032#20154#20986#29983#28857#20010#25968
        TabOrder = 1
        object Label40: TLabel
          Left = 10
          Top = 25
          Width = 42
          Height = 12
          Caption = #20986#29983#28857':'
        end
        object EditStartPointSize: TSpinEdit
          Left = 55
          Top = 20
          Width = 56
          Height = 21
          Hint = #26032#20154#20986#29983#28857#25511#21046#65292#40664'??'#21069#19977'?'#23433#20840'??'#32622#12290
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditStartPointSizeChange
        end
      end
      object GroupBox16: TGroupBox
        Left = 10
        Top = 10
        Width = 127
        Height = 55
        Caption = #23433#20840#21306#33539#22260
        TabOrder = 2
        object Label39: TLabel
          Left = 10
          Top = 25
          Width = 42
          Height = 12
          Caption = #23433#20840#21306':'
        end
        object EditSafeZoneSize: TSpinEdit
          Left = 55
          Top = 20
          Width = 56
          Height = 21
          Hint = #23433#20840'?'#33539'?'#22823#23567#12290
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditSafeZoneSizeChange
        end
      end
      object GroupBox20: TGroupBox
        Left = 146
        Top = 10
        Width = 139
        Height = 111
        Caption = #32418#21517#26449
        TabOrder = 3
        object Label42: TLabel
          Left = 10
          Top = 55
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object Label43: TLabel
          Left = 10
          Top = 85
          Width = 36
          Height = 12
          Caption = #22352#26631'Y:'
        end
        object Label44: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #22320#22270':'
        end
        object EditRedHomeX: TSpinEdit
          Left = 49
          Top = 50
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditRedHomeXChange
        end
        object EditRedHomeY: TSpinEdit
          Left = 49
          Top = 80
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditRedHomeYChange
        end
        object EditRedHomeMap: TEdit
          Left = 49
          Top = 20
          Width = 80
          Height = 20
          Hint = '?'#21517#20154#29289#38598#20013#28857#22320'?'#21517'?'#12290
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435'?'
          Font.Style = []
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 2
          Text = '3'
          OnChange = EditRedHomeMapChange
        end
      end
      object GroupBox21: TGroupBox
        Left = 146
        Top = 130
        Width = 139
        Height = 111
        Caption = #32418#21517#27515#20129#22238#22478#28857
        TabOrder = 4
        object Label45: TLabel
          Left = 10
          Top = 55
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object Label46: TLabel
          Left = 10
          Top = 85
          Width = 36
          Height = 12
          Caption = #22352#26631'Y:'
        end
        object Label47: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #22320#22270':'
        end
        object EditRedDieHomeX: TSpinEdit
          Left = 49
          Top = 50
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditRedDieHomeXChange
        end
        object EditRedDieHomeY: TSpinEdit
          Left = 49
          Top = 80
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditRedDieHomeYChange
        end
        object EditRedDieHomeMap: TEdit
          Left = 49
          Top = 20
          Width = 80
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
          Text = '3'
          OnChange = EditRedDieHomeMapChange
        end
      end
      object GroupBox22: TGroupBox
        Left = 292
        Top = 10
        Width = 149
        Height = 111
        Caption = #24212#24613#22238#22478#28857
        TabOrder = 5
        object Label48: TLabel
          Left = 10
          Top = 55
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object Label49: TLabel
          Left = 10
          Top = 85
          Width = 36
          Height = 12
          Caption = #22352#26631'Y:'
        end
        object Label50: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #22320#22270':'
        end
        object EditHomeX: TSpinEdit
          Left = 65
          Top = 50
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditHomeXChange
        end
        object EditHomeY: TSpinEdit
          Left = 65
          Top = 80
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditHomeYChange
        end
        object EditHomeMap: TEdit
          Left = 65
          Top = 20
          Width = 72
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
          Text = '3'
          OnChange = EditHomeMapChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'PK'#25511#21046
      ImageIndex = 6
      object ButtonOptionSave2: TButton
        Left = 460
        Top = 220
        Width = 69
        Height = 29
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonOptionSave2Click
      end
      object GroupBox32: TGroupBox
        Left = 210
        Top = 10
        Width = 319
        Height = 199
        Caption = 'PK'#35268#21017
        TabOrder = 1
        object Label58: TLabel
          Left = 140
          Top = 25
          Width = 66
          Height = 12
          Caption = #22686#21152#31561#32423#25968':'
        end
        object Label65: TLabel
          Left = 140
          Top = 55
          Width = 66
          Height = 12
          Caption = #20943#23569#31561#32423#25968':'
        end
        object Label66: TLabel
          Left = 140
          Top = 85
          Width = 66
          Height = 12
          Caption = #22686#21152#32463#39564#25968':'
        end
        object Label56: TLabel
          Left = 140
          Top = 115
          Width = 66
          Height = 12
          Caption = #20943#23569#32463#39564#25968':'
        end
        object Label67: TLabel
          Left = 10
          Top = 115
          Width = 42
          Height = 12
          Caption = 'PK'#31561#32423':'
        end
        object Label114: TLabel
          Left = 140
          Top = 145
          Width = 66
          Height = 12
          Caption = 'PK'#20445#25252#31561#32423':'
        end
        object Label115: TLabel
          Left = 116
          Top = 175
          Width = 90
          Height = 12
          Caption = #32418#21517'PK'#20445#25252#31561#32423':'
        end
        object CheckBoxKillHumanWinLevel: TCheckBox
          Left = 10
          Top = 23
          Width = 121
          Height = 21
          Caption = #26432#20154#22686#21152#31561#32423
          TabOrder = 0
          OnClick = CheckBoxKillHumanWinLevelClick
        end
        object CheckBoxKilledLostLevel: TCheckBox
          Left = 10
          Top = 45
          Width = 121
          Height = 21
          Caption = #34987#26432#20943#31561#32423
          TabOrder = 1
          OnClick = CheckBoxKilledLostLevelClick
        end
        object CheckBoxKilledLostExp: TCheckBox
          Left = 10
          Top = 85
          Width = 121
          Height = 21
          Caption = #34987#26432#20943#32463#39564
          TabOrder = 2
          OnClick = CheckBoxKilledLostExpClick
        end
        object CheckBoxKillHumanWinExp: TCheckBox
          Left = 10
          Top = 65
          Width = 121
          Height = 21
          Caption = #26432#20154#22686#21152#32463#39564
          TabOrder = 3
          OnClick = CheckBoxKillHumanWinExpClick
        end
        object EditKillHumanWinLevel: TSpinEdit
          Left = 206
          Top = 20
          Width = 91
          Height = 21
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 4
          Value = 10
          OnChange = EditKillHumanWinLevelChange
        end
        object EditKilledLostLevel: TSpinEdit
          Left = 206
          Top = 50
          Width = 91
          Height = 21
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 5
          Value = 10
          OnChange = EditKilledLostLevelChange
        end
        object EditKillHumanWinExp: TSpinEdit
          Left = 206
          Top = 80
          Width = 91
          Height = 21
          Increment = 1000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 6
          Value = 10
          OnChange = EditKillHumanWinExpChange
        end
        object EditKillHumanLostExp: TSpinEdit
          Left = 206
          Top = 110
          Width = 91
          Height = 21
          Increment = 1000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 7
          Value = 10
          OnChange = EditKillHumanLostExpChange
        end
        object EditHumanLevelDiffer: TSpinEdit
          Left = 70
          Top = 110
          Width = 61
          Height = 21
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 8
          Value = 10
          OnChange = EditHumanLevelDifferChange
        end
        object CheckBoxPKLevelProtect: TCheckBox
          Left = 10
          Top = 145
          Width = 111
          Height = 21
          Hint = 
            '?'#29992'PK'#20445'?'#21151#33021#65292#25171'?'#27492#21151#33021#21518#65292#28216'?'#20013#39640#20110#20445'?'#31561'?'#30340#20154#29289'?'#19981#21487#20197'?'#20302#20110#20445'?'#31561'?'#30340#20154#29289'('#20302#31561'?'#20154#29289#20808#25915'??'#33394#38500#22806')'#65292#20302#20110#20445'?'#31561'?'#30340 +
            #20154#29289#20063#19981#21487#20197'?'#39640#20110#20445'?'#31561'?'#30340#20154#29289'('#39640#31561'?'#20154#29289#20808#25915'??'#33394#38500#22806')'#12290
          Caption = #26222#36890'PK'#20445#25252
          TabOrder = 9
          OnClick = CheckBoxPKLevelProtectClick
        end
        object EditPKProtectLevel: TSpinEdit
          Left = 206
          Top = 140
          Width = 91
          Height = 21
          Hint = #20445'?'#31561'?'#12290#27492#31561'?'#20197#19979#20154#29289#21463#20445'?'#65292#20294#20808#25915'??'#33394'?'#19981#21463#20445'?'#12290
          EditorEnabled = False
          MaxValue = 65535
          MinValue = 1
          TabOrder = 10
          Value = 10
          OnChange = EditPKProtectLevelChange
        end
        object EditRedPKProtectLevel: TSpinEdit
          Left = 206
          Top = 170
          Width = 91
          Height = 21
          Hint = 
            '?'#21517#20154#29289'PK'#20445'?'#65292#39640#20110#20445'?'#31561'?'#30340'?'#21517#20154#29289#19981#21487#20197'?'#20302#20110#20445'?'#31561'?'#26410'?'#21517#20154#29289#12290#20302#20110#20445'?'#31561'?'#26410'?'#21517#30340#20154#29289#20063#19981#21487#20197'?'#39640#20110#20445'?'#31561'?'#30340'?'#21517#20154#29289 +
            #12290
          EditorEnabled = False
          MaxValue = 65535
          MinValue = 1
          TabOrder = 11
          Value = 10
          OnChange = EditRedPKProtectLevelChange
        end
      end
      object GroupBox23: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 91
        Caption = #33258#21160#20943'PK'#28857#25511#21046
        TabOrder = 2
        object Label51: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #38388#38548#26102#38388':'
        end
        object Label52: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 12
          Caption = #19968#27425#28857#25968':'
        end
        object Label53: TLabel
          Left = 160
          Top = 25
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditDecPkPointTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditDecPkPointTimeChange
        end
        object EditDecPkPointCount: TSpinEdit
          Left = 85
          Top = 50
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditDecPkPointCountChange
        end
      end
      object GroupBox24: TGroupBox
        Left = 10
        Top = 110
        Width = 151
        Height = 61
        Caption = 'PK'#29366#24577#21464#33394'('#31186')'
        TabOrder = 3
        object Label54: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #21464#33394#26102#38388':'
        end
        object EditPKFlagTime: TSpinEdit
          Left = 71
          Top = 20
          Width = 66
          Height = 21
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPKFlagTimeChange
        end
      end
      object GroupBox25: TGroupBox
        Left = 10
        Top = 180
        Width = 151
        Height = 61
        Caption = #26432#20154#22686#21152'PK'#28857#25968
        TabOrder = 4
        object Label55: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #22686#21152#28857#25968':'
        end
        object EditKillHumanAddPKPoint: TSpinEdit
          Left = 71
          Top = 20
          Width = 66
          Height = 21
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditKillHumanAddPKPointChange
        end
      end
      object GroupBox75: TGroupBox
        Left = 208
        Top = 216
        Width = 241
        Height = 41
        Caption = 'PK'#26381#21153#22120'('#26432#25932'/'#27515#20129#30456#20851')'
        TabOrder = 5
        object CheckPKKDPoint: TCheckBox
          Left = 8
          Top = 16
          Width = 225
          Height = 17
          Hint = 
            '?? ???? ?? pk?? ?.?? ???? ??? ??, ?? ??? ??? ????? ?/?? ???? ?? ' +
            '? ??.'
          Caption = #25915#22478#12289#34892#20250#25112#33719#24471#26432#25932#31215#20998
          TabOrder = 0
          OnClick = CheckPKKDPointClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #28216#25103#36873#39033'(3)'
      ImageIndex = 5
      object GroupBox17: TGroupBox
        Left = 332
        Top = 3
        Width = 189
        Height = 190
        Caption = #36305#27493#31359#20154#25511#21046
        TabOrder = 0
        object CheckBoxDisHumRun: TCheckBox
          Left = 16
          Top = 18
          Width = 121
          Height = 22
          Hint = 'Enable to disable the player from running through:'
          Caption = #31105#27490#36305#27493#31359#20154
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBoxDisHumRunClick
        end
        object CheckBoxRunHum: TCheckBox
          Left = 16
          Top = 42
          Width = 78
          Height = 20
          Hint = 'Other players'
          Caption = #20801#35768#31359#36807#20154#29289
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = CheckBoxRunHumClick
        end
        object CheckBoxRunMon: TCheckBox
          Left = 16
          Top = 67
          Width = 78
          Height = 20
          Hint = 'Mobs'
          Caption = #20801#35768#31359#36807#24618#29289
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CheckBoxRunMonClick
        end
        object CheckBoxWarDisHumRun: TCheckBox
          Left = 16
          Top = 142
          Width = 110
          Height = 21
          Caption = #25915#22478#21306#22495#20840#37096#31105#27490
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CheckBoxWarDisHumRunClick
        end
        object CheckBoxRunNpc: TCheckBox
          Left = 16
          Top = 92
          Width = 86
          Height = 20
          Hint = 'NPC'#39's'
          Caption = #20801#35768#31359#36807'NPC'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = CheckBoxRunNpcClick
        end
        object CheckBoxGMRunAll: TCheckBox
          Left = 16
          Top = 168
          Width = 102
          Height = 20
          Hint = 'When disabled a GM player will always run'
          Caption = #31649#29702#21592#19981#21463#38480#21046
          TabOrder = 5
          OnClick = CheckBoxGMRunAllClick
        end
        object CheckBoxRunGuard: TCheckBox
          Left = 16
          Top = 117
          Width = 94
          Height = 20
          Hint = 'Guards (Archers are classed as mobs)'
          Caption = #20801#35768#31359#36807#23432#21355
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = CheckBoxRunGuardClick
        end
      end
      object ButtonOptionSave3: TButton
        Left = 428
        Top = 228
        Width = 86
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonOptionSave3Click
      end
      object GroupBox53: TGroupBox
        Left = 10
        Top = 2
        Width = 151
        Height = 119
        Caption = #20132#26131#25511#21046
        TabOrder = 2
        object Label20: TLabel
          Left = 14
          Top = 25
          Width = 54
          Height = 12
          Caption = #20132#26131#38388#38548':'
        end
        object Label104: TLabel
          Left = 14
          Top = 52
          Width = 54
          Height = 12
          Caption = #30830#35748#20132#26131':'
        end
        object Label105: TLabel
          Left = 118
          Top = 25
          Width = 12
          Height = 12
          Caption = #31186
        end
        object Label106: TLabel
          Left = 118
          Top = 54
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditTryDealTime: TSpinEdit
          Left = 69
          Top = 20
          Width = 46
          Height = 21
          Hint = '??'#20132#26131#21518#65292#20877#37325#26032#20132#26131#24517'??'#38548#25351#23450'??'#12290
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditTryDealTimeChange
        end
        object EditDealOKTime: TSpinEdit
          Left = 69
          Top = 50
          Width = 46
          Height = 21
          Hint = #25918#19978#20132#26131#29289#21697#21518#65292#24517'?'#31561#25351#23450'??'#20877#25353'??'#25353'?'#12290
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditDealOKTimeChange
        end
        object CheckBoxCanNotGetBackDeal: TCheckBox
          Left = 14
          Top = 78
          Width = 99
          Height = 16
          Hint = #25171'?'#27492#21151#33021#21518#65292#20132#26131#30340#29289#21697#25918#19978#20102#21518'?'#19981#21487#20197#21462#22238#65292#21482#33021#21462#28040#20132#26131#20877#37325#26032#20132#26131#12290
          Caption = #31105#27490#21462#22238#29289#21697
          TabOrder = 2
          OnClick = CheckBoxCanNotGetBackDealClick
        end
        object CheckBoxDisableDeal: TCheckBox
          Left = 14
          Top = 98
          Width = 91
          Height = 16
          Hint = #31105#27490#20132#26131#21518#65292#22312#28216'?'#20013'?'#19981#20801'??'#34892#20132#26131#12290
          Caption = #31105#27490#20132#26131
          TabOrder = 3
          OnClick = CheckBoxDisableDealClick
        end
      end
      object GroupBox64: TGroupBox
        Left = 172
        Top = 2
        Width = 149
        Height = 119
        Caption = #25172#29289#21697#25511#21046
        TabOrder = 3
        object Label118: TLabel
          Left = 10
          Top = 47
          Width = 54
          Height = 12
          Caption = #29289#21697#20215#26684':'
        end
        object Label119: TLabel
          Left = 10
          Top = 77
          Width = 30
          Height = 12
          Caption = #37329#24065':'
        end
        object EditCanDropPrice: TSpinEdit
          Left = 69
          Top = 42
          Width = 66
          Height = 21
          Hint = #23567#20110#27492#20215#26684#30340#29289#21697#65292'?'#20986#21518#31435'?'#28040#22833#65292#19981'?'#20986'?'#22312#22320#19978#12290
          Increment = 100
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditCanDropPriceChange
        end
        object CheckBoxControlDropItem: TCheckBox
          Left = 14
          Top = 17
          Width = 107
          Height = 16
          Hint = #25171'?'#27492#21151#33021#21518#65292'??'#20154#29289'?'#19979'?'#30340#29289#21697#21450#37329'??'#34892'??'#65292#23567#20110#25351#23450'??'#37329'?'#25110#20215#26684#30340#29289#21697'?'#19981#20801'??'#19979'?'#65292#25110'?'#19979'?'#31435'?'#28040#22833#12290
          Caption = #21551#29992#25172#29289#21697#25511#21046
          TabOrder = 1
          OnClick = CheckBoxControlDropItemClick
        end
        object EditCanDropGold: TSpinEdit
          Left = 69
          Top = 72
          Width = 66
          Height = 21
          Hint = #23567#20110#25351#23450'?'#37327#30340#37329'?'#65292'?'#31105#27490'?'#20986#12290
          Increment = 100
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditCanDropGoldChange
        end
        object CheckBoxIsSafeDisableDrop: TCheckBox
          Left = 14
          Top = 99
          Width = 107
          Height = 16
          Hint = #25171'?'#27492#21151#33021#21518#65292#22312#23433#20840'??'#19981#20801'??'#29289#21697#12290
          Caption = #23433#20840#21306#31105#27490#25172
          TabOrder = 3
          OnClick = CheckBoxIsSafeDisableDropClick
        end
      end
      object GroupBox26: TGroupBox
        Left = 10
        Top = 128
        Width = 151
        Height = 61
        Caption = #32511#27602#20943'HP'#26102#38388#38388#38548'('#27627#31186')'
        TabOrder = 4
        object Label57: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 12
          Caption = #38388#38548#26102#38388':'
        end
        object EditPosionDecHealthTime: TSpinEdit
          Left = 69
          Top = 20
          Width = 66
          Height = 21
          Hint = #20154#29289#20013'?'#27602#21518#65292'?'#23569#29983#21629#28857'???'#38548#12290
          Increment = 100
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPosionDecHealthTimeChange
        end
      end
      object GroupBox27: TGroupBox
        Left = 172
        Top = 128
        Width = 149
        Height = 65
        Caption = #32418#27602#20943#38450#24481#21450#25345#20037
        TabOrder = 5
        object Label59: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Hint = '?? ???  ???? ??/??? ?? ?? ?? ??'
          Caption = #27604#29575':'
        end
        object EditPosionDamagarmor: TSpinEdit
          Left = 47
          Top = 20
          Width = 66
          Height = 21
          Hint = '?? ???  ???? ??/??? ?? ?? ?? ??'
          EditorEnabled = False
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPosionDamagarmorChange
        end
      end
      object GroupBox81: TGroupBox
        Left = 10
        Top = 194
        Width = 199
        Height = 79
        Caption = #30331#38470#21518#36192#36865#29289#21697
        TabOrder = 6
        object Label164: TLabel
          Left = 5
          Top = 25
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label165: TLabel
          Left = 90
          Top = 23
          Width = 24
          Height = 12
          Caption = #20998#38047
        end
        object SpinHourEvent: TSpinEdit
          Left = 37
          Top = 20
          Width = 46
          Height = 21
          EditorEnabled = False
          MaxValue = 24
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = SpinHourEventChange
        end
        object SpinMinEvent: TSpinEdit
          Left = 125
          Top = 18
          Width = 46
          Height = 21
          EditorEnabled = False
          MaxValue = 59
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = SpinMinEventChange
        end
        object CheckTimeEventUse: TCheckBox
          Left = 6
          Top = 56
          Width = 179
          Height = 16
          Caption = #21246#36873#26102#27599#27425#30331#38470#37117#20250#36192#36865#29289#21697
          TabOrder = 2
          OnClick = CheckTimeEventUseClick
        end
      end
      object GroupBox77: TGroupBox
        Left = 216
        Top = 194
        Width = 121
        Height = 79
        Caption = #35273#37266#26426#29575#25511#21046
        TabOrder = 7
        object Label77: TLabel
          Left = 13
          Top = 30
          Width = 54
          Height = 12
          Caption = #35273#37266#27010#29575':'
        end
        object SpinWakeUp: TSpinEdit
          Left = 67
          Top = 26
          Width = 46
          Height = 21
          EditorEnabled = False
          MaxValue = 99
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = SpinWakeUpChange
        end
      end
    end
    object GameSpeedSheet: TTabSheet
      Caption = #28216#25103#36895#24230
      object ButtonGameSpeedSave: TButton
        Left = 457
        Top = 234
        Width = 78
        Height = 32
        Hint = 'Save settings'
        Caption = #21047#26032'(&S)'
        TabOrder = 0
        OnClick = ButtonGameSpeedSaveClick
      end
      object ButtonGameSpeedDefault: TButton
        Left = 365
        Top = 234
        Width = 80
        Height = 32
        Hint = 'Reload defaults'
        Caption = #30830#23450'(&D)'
        TabOrder = 1
        OnClick = ButtonGameSpeedDefaultClick
      end
      object GroupBox15: TGroupBox
        Left = 18
        Top = 10
        Width = 159
        Height = 63
        TabOrder = 2
        object CheckBoxSpellSendUpdateMsg: TCheckBox
          Left = 10
          Top = 15
          Width = 111
          Height = 21
          Hint = #25511#21046#20154#29289#21516'?'#30456#21516#39764#27861#25805#20316'?'#25454#65292#21516'?'#21482#33021#26377#19968'?'#39764#27861#25915'?'#25805#20316
          Caption = #25552#31034#29256#26412#26356#26032
          TabOrder = 0
          OnClick = CheckBoxSpellSendUpdateMsgClick
        end
        object CheckBoxActionSendActionMsg: TCheckBox
          Left = 10
          Top = 35
          Width = 119
          Height = 21
          Hint = #25511#21046#20154#29289#21516'?'#30456#21516#25915'?'#25805#20316'?'#25454#65292#21516'?'#21482#33021#26377#19968'?'#39764#27861#25915'?'#25805#20316
          Caption = #21160#20316#28040#24687
          TabOrder = 1
          OnClick = CheckBoxActionSendActionMsgClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 18
        Top = 80
        Width = 161
        Height = 101
        Caption = #20154#29289#24367#33136#25511#21046
        TabOrder = 3
        object Label22: TLabel
          Left = 14
          Top = 30
          Width = 54
          Height = 12
          Caption = #20572#30041#26102#38388':'
        end
        object EditStruckTime: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 21
          EditorEnabled = False
          Enabled = False
          MaxValue = 1000
          MinValue = 10
          TabOrder = 0
          Value = 100
          OnChange = EditStruckTimeChange
        end
        object CheckBoxDisableStruck: TCheckBox
          Left = 14
          Top = 56
          Width = 131
          Height = 22
          Caption = #20154#29289#26080#24367#33136#21160#20316
          Enabled = False
          TabOrder = 1
          OnClick = CheckBoxDisableStruckClick
        end
        object CheckBoxDisableSelfStruck: TCheckBox
          Left = 14
          Top = 76
          Width = 131
          Height = 22
          Caption = #20219#21153#33258#24049#19981#24367#33136
          Enabled = False
          TabOrder = 2
          OnClick = CheckBoxDisableSelfStruckClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 218
        Top = 10
        Width = 141
        Height = 71
        Caption = #36895#24230#25511#21046#27169#24335
        TabOrder = 4
        object RadioButtonDelyMode: TRadioButton
          Left = 10
          Top = 20
          Width = 121
          Height = 21
          Hint = '?'#36229'?'#36895#24230#30340#25805#20316'?'#34892#24310'??'#29702#65292#20197#20445#25345#27491#24120#36895#24230#65292#20351#29992#27492'?'#27169#24335#23458'?'#31471#20351#29992#21152#36895'?'#36896#25104'?'#30340'?'#35937#12290
          Caption = #20572#39039#25805#20316#22788#29702
          Enabled = False
          TabOrder = 0
        end
        object RadioButtonFilterMode: TRadioButton
          Left = 10
          Top = 40
          Width = 121
          Height = 21
          Hint = '?'#36229'?'#36895#24230#30340#25805#20316#30452#25509'???'#29702#65292'??'#36229#36895#24230#30340#25805#20316#65292#20351#29992#27492'?'#27169#24335#23458'?'#31471#20351#29992#21152#36895'?'#36896#25104'?'#20992#65292#21453'?'#30340'?'#35937#12290
          Caption = #21453#24377#21345#20992#22788#29702
          Enabled = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 218
        Top = 90
        Width = 141
        Height = 47
        Caption = #35013#22791#36895#24230
        TabOrder = 5
        object Label13: TLabel
          Left = 24
          Top = 22
          Width = 30
          Height = 12
          Caption = #36895#24230':'
        end
        object EditItemSpeedTime: TSpinEdit
          Left = 67
          Top = 17
          Width = 56
          Height = 21
          Hint = #25511#21046'??'#21152#36895#24773'?'#65292'?'#23383#36234#22823#36234'?'#65292#36234#23567'?'#36234'?'
          EditorEnabled = False
          Enabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditItemSpeedTimeChange
        end
      end
      object grp1: TGroupBox
        Left = 16
        Top = 192
        Width = 161
        Height = 57
        Caption = #21507#33647#27700#30340#36895#24230'('#25481#32447')'
        TabOrder = 6
        object lbl1: TLabel
          Left = 11
          Top = 28
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object EditEatTick: TSpinEdit
          Left = 60
          Top = 24
          Width = 50
          Height = 21
          Enabled = False
          MaxValue = 6000000
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = EditEatTickChange
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = #29366#24577#25511#21046
      ImageIndex = 13
      object ButtonCharStatusSave: TButton
        Left = 444
        Top = 244
        Width = 91
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonCharStatusSaveClick
      end
      object GroupBox72: TGroupBox
        Left = 10
        Top = 10
        Width = 161
        Height = 111
        Caption = #40635#30201#25511#21046
        TabOrder = 1
        object CheckBoxParalyCanRun: TCheckBox
          Left = 10
          Top = 20
          Width = 91
          Height = 21
          Hint = #20154#29289#34987#40635'?'#21518#26159#21542#20801'???'#65292'?'#19978'?'#20801'???'
          Caption = #31105#27490#36305#21160
          TabOrder = 0
          OnClick = CheckBoxParalyCanRunClick
        end
        object CheckBoxParalyCanWalk: TCheckBox
          Left = 10
          Top = 40
          Width = 91
          Height = 21
          Hint = #20154#29289#34987#40635'?'#21518#26159#21542#20801'???'#65292'?'#19978'?'#20801'?'#36208'?'
          Caption = #31105#27490#36208#21160
          TabOrder = 1
          OnClick = CheckBoxParalyCanWalkClick
        end
        object CheckBoxParalyCanHit: TCheckBox
          Left = 10
          Top = 60
          Width = 91
          Height = 21
          Hint = #20154#29289#34987#40635'?'#21518#26159#21542#20801'???'#65292'?'#19978'?'#20801'?'#25915'?'
          Caption = #31105#27490#25915#20987
          TabOrder = 2
          OnClick = CheckBoxParalyCanHitClick
        end
        object CheckBoxParalyCanSpell: TCheckBox
          Left = 10
          Top = 80
          Width = 111
          Height = 21
          Hint = #20154#29289#34987#40635'?'#21518#26159#21542#20801'???'#65292'?'#19978'?'#20801'?'#39764#27861
          Caption = #31105#27490#39764#27861
          TabOrder = 3
          OnClick = CheckBoxParalyCanSpellClick
        end
      end
      object GroupBox82: TGroupBox
        Left = 8
        Top = 128
        Width = 161
        Height = 49
        Caption = #35843#25972#40635#30201#25106#25351#30340#40635#30201#26426#29575
        TabOrder = 2
        object Label148: TLabel
          Left = 8
          Top = 24
          Width = 60
          Height = 12
          Caption = #40635#30201#26426#29575': '
        end
        object Label167: TLabel
          Left = 136
          Top = 24
          Width = 6
          Height = 12
          Caption = '%'
        end
        object EditSuperPosion: TSpinEdit
          Left = 70
          Top = 20
          Width = 61
          Height = 21
          Hint = '???? ??? ??'
          MaxValue = 100
          MinValue = 0
          TabOrder = 0
          Value = 1
          OnChange = EditSuperPosionChange
        end
      end
    end
    object ExpSheet: TTabSheet
      Caption = #21319#32423#32463#39564
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435'?'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object GroupBox8: TGroupBox
        Left = 227
        Top = 10
        Width = 190
        Height = 95
        Caption = #26432#24618#32463#39564#27604#20363#35774#32622
        TabOrder = 0
        object Label23: TLabel
          Left = 21
          Top = 31
          Width = 75
          Height = 15
          Caption = #26432#24618#32463#39564#20493#29575':'
        end
        object EditKillMonExpMultiple: TSpinEdit
          Left = 110
          Top = 28
          Width = 61
          Height = 24
          Hint = '???? ??? ??'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnChange = EditKillMonExpMultipleChange
        end
        object CheckBoxHighLevelKillMonFixExp: TCheckBox
          Left = 21
          Top = 60
          Width = 140
          Height = 28
          Hint = '?? ??? ?? ?? 10???? ???(??? ????)'
          Caption = #39640#31561#32423#26432#24618#32463#39564#19981#21464
          TabOrder = 1
          OnClick = CheckBoxHighLevelKillMonFixExpClick
        end
      end
      object ButtonExpSave: TButton
        Left = 442
        Top = 236
        Width = 91
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = ButtonExpSaveClick
      end
      object GroupBoxLevelExp: TGroupBox
        Left = 10
        Top = 10
        Width = 211
        Height = 231
        Caption = #32463#39564#35774#23450
        TabOrder = 2
        object Label37: TLabel
          Left = 2
          Top = 202
          Width = 63
          Height = 15
          Caption = #32463#39564#20540#36873#25321':'
        end
        object ComboBoxLevelExp: TComboBox
          Left = 68
          Top = 200
          Width = 133
          Height = 23
          Style = csDropDownList
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 0
          TabOrder = 0
          OnClick = ComboBoxLevelExpClick
        end
        object GridLevelExp: TStringGrid
          Left = 10
          Top = 20
          Width = 191
          Height = 171
          ColCount = 2
          DefaultRowHeight = 18
          RowCount = 501
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          TabOrder = 1
          OnSetEditText = GridLevelExpSetEditText
          ColWidths = (
            64
            104)
          RowHeights = (
            18
            18
            19
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
        end
      end
    end
    object CastleSheet: TTabSheet
      Caption = #22478#22561#21442#25968
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object ButtonCastleSave: TButton
        Left = 442
        Top = 239
        Width = 86
        Height = 33
        Hint = 'Save setings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonCastleSaveClick
      end
      object GroupBox9: TGroupBox
        Left = 10
        Top = 10
        Width = 200
        Height = 141
        Caption = #36153#29992#25910#20837
        TabOrder = 1
        object Label24: TLabel
          Left = 14
          Top = 20
          Width = 54
          Height = 12
          Caption = #32500#20462#22478#38376':'
        end
        object Label25: TLabel
          Left = 14
          Top = 50
          Width = 54
          Height = 12
          Caption = #32500#20462#22478#22681':'
        end
        object Label26: TLabel
          Left = 14
          Top = 80
          Width = 54
          Height = 12
          Caption = #38599#29992#24339#31661':'
        end
        object Label27: TLabel
          Left = 14
          Top = 110
          Width = 54
          Height = 12
          Caption = #38599#20323#21355#22763':'
        end
        object EditRepairDoorPrice: TSpinEdit
          Left = 90
          Top = 15
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 0
          Value = 2000000
          OnChange = EditRepairDoorPriceChange
        end
        object EditRepairWallPrice: TSpinEdit
          Left = 90
          Top = 45
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 1
          Value = 500000
          OnChange = EditRepairWallPriceChange
        end
        object EditHireArcherPrice: TSpinEdit
          Left = 90
          Top = 75
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 2
          Value = 300000
          OnChange = EditHireArcherPriceChange
        end
        object EditHireGuardPrice: TSpinEdit
          Left = 90
          Top = 105
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 3
          Value = 300000
          OnChange = EditHireGuardPriceChange
        end
      end
      object GroupBox10: TGroupBox
        Left = 10
        Top = 148
        Width = 200
        Height = 77
        Caption = #37329#24065#19978#38480
        TabOrder = 2
        object Label31: TLabel
          Left = 14
          Top = 20
          Width = 54
          Height = 12
          Caption = #22478#20869#36164#37329':'
        end
        object Label32: TLabel
          Left = 14
          Top = 50
          Width = 54
          Height = 12
          Caption = #19968#22825#25910#20837':'
        end
        object EditCastleGoldMax: TSpinEdit
          Left = 90
          Top = 15
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 0
          Value = 10000000
          OnChange = EditCastleGoldMaxChange
        end
        object EditCastleOneDayGold: TSpinEdit
          Left = 90
          Top = 45
          Width = 101
          Height = 21
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 1
          Value = 2000000
          OnChange = EditCastleOneDayGoldChange
        end
      end
      object GroupBox13: TGroupBox
        Left = 402
        Top = 61
        Width = 135
        Height = 68
        Caption = #22478#22561#21830#20154#31246#25910
        TabOrder = 3
        object Label36: TLabel
          Left = 14
          Top = 42
          Width = 42
          Height = 12
          Caption = #31246#25910#29575':'
        end
        object EditTaxRate: TSpinEdit
          Left = 62
          Top = 37
          Width = 61
          Height = 21
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 5
          OnChange = EditTaxRateChange
        end
        object CheckBoxGetAllNpcTax: TCheckBox
          Left = 14
          Top = 16
          Width = 91
          Height = 22
          Caption = #25152#26377#21830#20154#20132#31246
          TabOrder = 1
          OnClick = CheckBoxGetAllNpcTaxClick
        end
      end
      object GroupBox14: TGroupBox
        Left = 218
        Top = 10
        Width = 175
        Height = 47
        Caption = #27801#24052#20811#22478#22561#21517#23383
        TabOrder = 4
        object Label33: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #21517#23383':'
        end
        object EditCastleName: TEdit
          Left = 50
          Top = 20
          Width = 111
          Height = 20
          ImeMode = imHanguel
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = #27801#24052#20811
          OnChange = EditCastleNameChange
        end
      end
      object GroupBox54: TGroupBox
        Left = 402
        Top = 15
        Width = 135
        Height = 42
        Caption = #22478#22561#25104#21592#25240#25187
        TabOrder = 5
        object Label107: TLabel
          Left = 14
          Top = 20
          Width = 42
          Height = 12
          Caption = #25240#25187#29575':'
        end
        object EditCastleMemberPriceRate: TSpinEdit
          Left = 62
          Top = 15
          Width = 61
          Height = 21
          Hint = '???'
          MaxValue = 200
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditCastleMemberPriceRateChange
        end
      end
      object GroupBox11: TGroupBox
        Left = 218
        Top = 57
        Width = 175
        Height = 88
        Caption = #27801#24052#20811#22238#22478#28857
        TabOrder = 6
        object Label28: TLabel
          Left = 14
          Top = 20
          Width = 30
          Height = 12
          Caption = #22320#22270':'
        end
        object Label29: TLabel
          Left = 14
          Top = 42
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object Label30: TLabel
          Left = 14
          Top = 64
          Width = 36
          Height = 12
          Caption = #22352#26631'Y:'
        end
        object EditCastleHomeX: TSpinEdit
          Left = 70
          Top = 37
          Width = 71
          Height = 21
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 644
          OnChange = EditCastleHomeXChange
        end
        object EditCastleHomeY: TSpinEdit
          Left = 70
          Top = 59
          Width = 71
          Height = 21
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 290
          OnChange = EditCastleHomeYChange
        end
        object EditCastleHomeMap: TEdit
          Left = 70
          Top = 15
          Width = 99
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          MaxLength = 20
          TabOrder = 2
          Text = 'SABUK_CASTLE1'
          OnChange = EditCastleHomeMapChange
        end
      end
      object GroupBox12: TGroupBox
        Left = 218
        Top = 146
        Width = 175
        Height = 47
        Caption = #21335#28385#22478#22561#21517#23383
        TabOrder = 7
        object Label14: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 12
          Caption = #21517#23383':'
        end
        object EditNCastleName: TEdit
          Left = 50
          Top = 20
          Width = 111
          Height = 20
          ImeMode = imHanguel
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = #21335#28385
          OnChange = EditNCastleNameChange
        end
      end
      object GroupBox39: TGroupBox
        Left = 218
        Top = 193
        Width = 175
        Height = 88
        Caption = #21335#28385#22238#22478#28857
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        object Label34: TLabel
          Left = 14
          Top = 20
          Width = 30
          Height = 12
          Caption = #22320#22270':'
        end
        object Label35: TLabel
          Left = 14
          Top = 42
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object Label74: TLabel
          Left = 14
          Top = 64
          Width = 36
          Height = 12
          Caption = #22352#26631'X:'
        end
        object EditNCastleHomeX: TSpinEdit
          Left = 70
          Top = 37
          Width = 71
          Height = 21
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 644
          OnChange = EditNCastleHomeXChange
        end
        object EditNCastleHomeY: TSpinEdit
          Left = 70
          Top = 59
          Width = 71
          Height = 21
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 290
          OnChange = EditNCastleHomeYChange
        end
        object EditNCastleHomeMap: TEdit
          Left = 70
          Top = 15
          Width = 99
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          MaxLength = 20
          TabOrder = 2
          Text = 'NAMMAN_CASTLE'
          OnChange = EditNCastleHomeMapChange
        end
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 226
        Width = 200
        Height = 55
        Caption = #35774#32622#21344#39046#21344#39046#26071#24092#26102#38388
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        object Label1: TLabel
          Left = 22
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label2: TLabel
          Left = 122
          Top = 30
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditCastleFlagTime: TSpinEdit
          Left = 63
          Top = 25
          Width = 56
          Height = 21
          Hint = '???? ???? ??'
          MaxValue = 60
          MinValue = 1
          TabOrder = 0
          Value = 60
          OnChange = EditCastleFlagTimeChange
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #20449#24687#25511#21046
      ImageIndex = 8
      object ButtonMsgSave: TButton
        Left = 442
        Top = 236
        Width = 86
        Height = 33
        Hint = #20445#23384#35774#32622
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonMsgSaveClick
      end
      object GroupBox36: TGroupBox
        Left = 10
        Top = 10
        Width = 161
        Height = 91
        Caption = #21457#36865#20449#24687#38271#24230
        TabOrder = 1
        object Label71: TLabel
          Left = 14
          Top = 30
          Width = 54
          Height = 12
          Caption = #32842#22825#20449#24687':'
        end
        object Label72: TLabel
          Left = 14
          Top = 58
          Width = 54
          Height = 12
          Caption = #24191#25773#20449#24687':'
        end
        object EditSayMsgMaxLen: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 21
          Hint = '?'#36865#25991#23383#20449#24687#26368#22823'?'#24230#12290
          MaxValue = 255
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditSayMsgMaxLenChange
        end
        object EditSayRedMsgMaxLen: TSpinEdit
          Left = 85
          Top = 55
          Width = 66
          Height = 21
          Hint = 'GM??'#33394'?'#25773#25991#23383#26368#22823'?'#24230#12290
          MaxValue = 255
          MinValue = 1
          TabOrder = 1
          Value = 50
          OnChange = EditSayRedMsgMaxLenChange
        end
      end
      object GroupBox37: TGroupBox
        Left = 10
        Top = 110
        Width = 161
        Height = 61
        Caption = #20801#35768#21898#35805#31561#32423
        TabOrder = 2
        object Label73: TLabel
          Left = 14
          Top = 30
          Width = 54
          Height = 12
          Caption = #20154#29289#31561#32423':'
        end
        object EditCanShoutMsgLevel: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 21
          Hint = #20801'?'#21898'?'#31561'?'#65292#20154#29289#24517'?'#21040'?'#25351#23450#31561'?'#21518#25165#21487#20197#21898'?'#12290
          MaxValue = 65535
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditCanShoutMsgLevelChange
        end
      end
      object GroupBox71: TGroupBox
        Left = 10
        Top = 180
        Width = 161
        Height = 61
        Caption = #26174#31034#21069#32512#20449#24687
        TabOrder = 3
        object CheckBoxShowPreFixMsg: TCheckBox
          Left = 10
          Top = 20
          Width = 131
          Height = 21
          Hint = #28216'?'#20013#32842#22825'?'#20013'?'#31034#30340#20449#24687#26159#21542'?'#31034#21069'?'#20449#24687#12290
          Caption = #26174#31034#21069#32512#20449#24687
          TabOrder = 0
          OnClick = CheckBoxShowPreFixMsgClick
        end
      end
      object GroupBox68: TGroupBox
        Left = 180
        Top = 100
        Width = 171
        Height = 121
        Caption = #21457#36865#20449#24687#36895#24230#25511#21046
        TabOrder = 4
        object Label135: TLabel
          Left = 14
          Top = 30
          Width = 54
          Height = 12
          Caption = #21457#36865#38388#38548':'
        end
        object Label138: TLabel
          Left = 14
          Top = 60
          Width = 54
          Height = 12
          Caption = #21457#36865#25968#37327':'
        end
        object Label139: TLabel
          Left = 14
          Top = 90
          Width = 54
          Height = 12
          Caption = #31105#35328#26102#38388':'
        end
        object Label140: TLabel
          Left = 144
          Top = 30
          Width = 12
          Height = 12
          Caption = #31186
        end
        object Label141: TLabel
          Left = 144
          Top = 90
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditSayMsgTime: TSpinEdit
          Left = 85
          Top = 25
          Width = 56
          Height = 21
          MaxValue = 1000000
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditSayMsgTimeChange
        end
        object EditSayMsgCount: TSpinEdit
          Left = 85
          Top = 55
          Width = 56
          Height = 21
          MaxValue = 255
          MinValue = 1
          TabOrder = 1
          Value = 50
          OnChange = EditSayMsgCountChange
        end
        object EditDisableSayMsgTime: TSpinEdit
          Left = 85
          Top = 85
          Width = 56
          Height = 21
          MaxValue = 100000
          MinValue = 1
          TabOrder = 2
          Value = 50
          OnChange = EditDisableSayMsgTimeChange
        end
      end
      object GroupBox38: TGroupBox
        Left = 180
        Top = 10
        Width = 171
        Height = 81
        Caption = #21457#36865#24191#25773#20449#24687
        TabOrder = 5
        object Label75: TLabel
          Left = 14
          Top = 50
          Width = 54
          Height = 12
          Caption = #21457#36865#21629#20196':'
        end
        object CheckBoxShutRedMsgShowGMName: TCheckBox
          Left = 10
          Top = 20
          Width = 135
          Height = 21
          Hint = 'GM'#21457#36865#32418#33394#24191#25773#25991#20214#20449#24687#21518#26159#21542#26174#31034#20154#29289#30340#21517#23383#12290
          Caption = #26174#31034#20154#29289#21517#31216
          TabOrder = 0
          OnClick = CheckBoxShutRedMsgShowGMNameClick
        end
        object EditGMRedMsgCmd: TEdit
          Left = 90
          Top = 46
          Width = 51
          Height = 20
          Hint = #21457#36865#32418#33394#24191#25773#25991#20214#20449#24687#21629#20196#31526#12290#40664#35748#20026#8216'!'#8217#12290
          ImeName = 'Microsoft Office IME 2007'
          MaxLength = 20
          TabOrder = 1
          OnChange = EditGMRedMsgCmdChange
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #25991#23383#39068#33394
      ImageIndex = 11
      object ButtonMsgColorSave: TButton
        Left = 442
        Top = 239
        Width = 91
        Height = 33
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonMsgColorSaveClick
      end
      object GroupBox55: TGroupBox
        Left = 10
        Top = 10
        Width = 124
        Height = 79
        Caption = #32842#22825#25991#23383
        TabOrder = 1
        object Label108: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label109: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabeltHearMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelHearMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditHearMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditHearMsgFColorChange
        end
        object EdittHearMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EdittHearMsgBColorChange
        end
      end
      object GroupBox56: TGroupBox
        Left = 10
        Top = 95
        Width = 124
        Height = 79
        Caption = #31169#32842#25991#23383
        TabOrder = 2
        object Label110: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label111: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelWhisperMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelWhisperMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditWhisperMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditWhisperMsgFColorChange
        end
        object EditWhisperMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditWhisperMsgBColorChange
        end
      end
      object GroupBox57: TGroupBox
        Left = 10
        Top = 180
        Width = 124
        Height = 79
        Caption = #31649#29702#21592#31169#32842#25991#23383
        TabOrder = 3
        object Label112: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label113: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelGMWhisperMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGMWhisperMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGMWhisperMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGMWhisperMsgFColorChange
        end
        object EditGMWhisperMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGMWhisperMsgBColorChange
        end
      end
      object GroupBox60: TGroupBox
        Left = 139
        Top = 180
        Width = 124
        Height = 79
        Caption = #34013#33394#25552#31034#25991#23383
        TabOrder = 4
        object Label124: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label125: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelBlueMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelBlueMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditBlueMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditBlueMsgFColorChange
        end
        object EditBlueMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditBlueMsgBColorChange
        end
      end
      object GroupBox59: TGroupBox
        Left = 139
        Top = 95
        Width = 124
        Height = 79
        Caption = #32511#33394#25552#31034#25991#23383
        TabOrder = 5
        object Label120: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label121: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelGreenMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGreenMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGreenMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGreenMsgFColorChange
        end
        object EditGreenMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGreenMsgBColorChange
        end
      end
      object GroupBox58: TGroupBox
        Left = 139
        Top = 10
        Width = 124
        Height = 79
        Caption = #32418#33394#25552#31034#25991#23383
        TabOrder = 6
        object Label116: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label117: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelRedMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelRedMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditRedMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditRedMsgFColorChange
        end
        object EditRedMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditRedMsgBColorChange
        end
      end
      object GroupBox61: TGroupBox
        Left = 268
        Top = 10
        Width = 124
        Height = 79
        Caption = #21898#35805#25991#23383
        TabOrder = 7
        object Label128: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label129: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelCryMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelCryMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditCryMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditCryMsgFColorChange
        end
        object EditCryMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditCryMsgBColorChange
        end
      end
      object GroupBox62: TGroupBox
        Left = 268
        Top = 95
        Width = 124
        Height = 79
        Caption = #34892#20250#32842#22825#25991#23383
        TabOrder = 8
        object Label132: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label133: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelGuildMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGuildMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGuildMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGuildMsgFColorChange
        end
        object EditGuildMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGuildMsgBColorChange
        end
      end
      object GroupBox63: TGroupBox
        Left = 268
        Top = 180
        Width = 124
        Height = 79
        Caption = #32452#38431#32842#22825#25991#23383
        TabOrder = 9
        object Label136: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label137: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelGroupMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGroupMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGroupMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGroupMsgFColorChange
        end
        object EditGroupMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGroupMsgBColorChange
        end
      end
      object GroupBox65: TGroupBox
        Left = 397
        Top = 10
        Width = 124
        Height = 79
        Caption = #31069#31119#35821#25991#23383
        TabOrder = 10
        object Label122: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label123: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelCustMsgFColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelCustMsgBColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditCustMsgFColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditCustMsgFColorChange
        end
        object EditCustMsgBColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditCustMsgBColorChange
        end
      end
      object GroupBox74: TGroupBox
        Left = 397
        Top = 98
        Width = 124
        Height = 79
        Caption = #24191#25773#25991#23383
        TabOrder = 11
        object Label15: TLabel
          Left = 10
          Top = 20
          Width = 30
          Height = 12
          Caption = #25991#23383':'
        end
        object Label145: TLabel
          Left = 10
          Top = 50
          Width = 30
          Height = 12
          Caption = #32972#26223':'
        end
        object LabelCustMsg1FColor: TLabel
          Left = 102
          Top = 16
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelCustMsg1BColor: TLabel
          Left = 102
          Top = 46
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditCustMsg1FColor: TSpinEdit
          Left = 42
          Top = 15
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditCustMsg1FColorChange
        end
        object EditCustMsg1BColor: TSpinEdit
          Left = 42
          Top = 45
          Width = 51
          Height = 21
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditCustMsg1BColorChange
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #26102#38388#25511#21046
      ImageIndex = 9
      object ButtonTimeSave: TButton
        Left = 448
        Top = 249
        Width = 88
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonTimeSaveClick
      end
      object GroupBox45: TGroupBox
        Left = 416
        Top = 6
        Width = 113
        Height = 61
        Caption = #20154#29289#36864#20986#37322#25918
        TabOrder = 1
        object Label87: TLabel
          Left = 10
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label88: TLabel
          Left = 88
          Top = 30
          Width = 12
          Height = 12
          Caption = #20998
        end
        object EditHumanFreeDelayTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 46
          Height = 21
          Hint = #20154#29289#36864#21518#25351#23450'??'#21518'?'#25918'??'#65292'????'#19981#33021#22826#30701#65292#21542'?'#21487#33021#24341#36215'??'#12290
          Enabled = False
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 5
          OnChange = EditHumanFreeDelayTimeChange
        end
      end
      object GroupBox44: TGroupBox
        Left = 284
        Top = 6
        Width = 125
        Height = 61
        Caption = #20154#29289#25968#25454#20445#23384#38388#38548
        TabOrder = 2
        object Label85: TLabel
          Left = 14
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label86: TLabel
          Left = 96
          Top = 30
          Width = 12
          Height = 12
          Caption = #20998
        end
        object EditSaveHumanRcdTime: TSpinEdit
          Left = 47
          Top = 25
          Width = 46
          Height = 21
          Hint = #20154#29289'?'#25454#33258'?'#20445#23384'?'#38548'??'#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditSaveHumanRcdTimeChange
        end
      end
      object GroupBox42: TGroupBox
        Left = 142
        Top = 6
        Width = 131
        Height = 61
        Caption = #25915#22478#25112#25345#32493#26102#38388
        TabOrder = 3
        object Label81: TLabel
          Left = 10
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label82: TLabel
          Left = 106
          Top = 30
          Width = 12
          Height = 12
          Caption = #20998
        end
        object EditCastleWarTime: TSpinEdit
          Left = 47
          Top = 25
          Width = 56
          Height = 21
          Hint = '?? ?? ????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 180
          OnChange = EditCastleWarTimeChange
        end
      end
      object GroupBox40: TGroupBox
        Left = 298
        Top = 136
        Width = 111
        Height = 81
        Caption = #25915#22478#24320#22987#26102#38388
        TabOrder = 4
        object Label76: TLabel
          Left = 10
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label78: TLabel
          Left = 88
          Top = 30
          Width = 12
          Height = 12
          Caption = #26102
        end
        object Label166: TLabel
          Left = 88
          Top = 54
          Width = 12
          Height = 12
          Caption = #20998
        end
        object EditStartCastlewarTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 46
          Height = 21
          Hint = '???? ??'
          MaxValue = 24
          MinValue = 0
          TabOrder = 0
          Value = 20
          OnChange = EditStartCastlewarTimeChange
        end
        object EditStartCastlewarMin: TSpinEdit
          Left = 39
          Top = 49
          Width = 46
          Height = 21
          Hint = '???? ?'
          MaxValue = 59
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = EditStartCastlewarMinChange
        end
      end
      object GroupBox43: TGroupBox
        Left = 142
        Top = 72
        Width = 131
        Height = 61
        Caption = #34892#20250#25112#32467#26463#25552#31034
        TabOrder = 5
        object Label83: TLabel
          Left = 10
          Top = 28
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label84: TLabel
          Left = 104
          Top = 28
          Width = 12
          Height = 12
          Caption = #20998
        end
        object EditGetCastleTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 58
          Height = 21
          Hint = '?? ???? ??????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
        end
      end
      object GroupBox41: TGroupBox
        Left = 6
        Top = 70
        Width = 131
        Height = 61
        Caption = #25915#22478#32467#26463#25552#31034
        TabOrder = 6
        object Label79: TLabel
          Left = 10
          Top = 28
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label80: TLabel
          Left = 88
          Top = 28
          Width = 36
          Height = 12
          Caption = #20998#38047#21069
        end
        object EditShowCastleWarEndMsgTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 46
          Height = 21
          Hint = #25915#22478'??'#26463#21069#25351#23450'??'#25552#31034#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditShowCastleWarEndMsgTimeChange
        end
      end
      object GroupBox70: TGroupBox
        Left = 6
        Top = 6
        Width = 131
        Height = 61
        Caption = #34892#20250#25112#25345#32493#26102#38388
        TabOrder = 7
        object Label143: TLabel
          Left = 10
          Top = 28
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label144: TLabel
          Left = 98
          Top = 28
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditGuildWarTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 56
          Height = 21
          Hint = #34892'?????'#24230#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditGuildWarTimeChange
        end
      end
      object GroupBox46: TGroupBox
        Left = 416
        Top = 72
        Width = 113
        Height = 91
        Caption = #28165#29702#26102#38388
        TabOrder = 8
        object Label89: TLabel
          Left = 10
          Top = 30
          Width = 30
          Height = 12
          Caption = #27515#23608':'
        end
        object Label90: TLabel
          Left = 92
          Top = 30
          Width = 12
          Height = 12
          Caption = #31186
        end
        object Label91: TLabel
          Left = 10
          Top = 60
          Width = 30
          Height = 12
          Caption = #29289#21697':'
        end
        object Label92: TLabel
          Left = 92
          Top = 60
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditMakeGhostTime: TSpinEdit
          Left = 39
          Top = 25
          Width = 50
          Height = 21
          Hint = '?'#38500#22320#19978#27515#23608'??'#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 180
          OnChange = EditMakeGhostTimeChange
        end
        object EditClearDropOnFloorItemTime: TSpinEdit
          Left = 39
          Top = 55
          Width = 50
          Height = 21
          Hint = '?'#38500#22320#19978#29289#21697'??'#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 1
          Value = 3600
          OnChange = EditClearDropOnFloorItemTimeChange
        end
      end
      object GroupBox47: TGroupBox
        Left = 282
        Top = 72
        Width = 127
        Height = 61
        Caption = #29190#20986#29289#21697#21487#25441#26102#38388
        TabOrder = 9
        object Label93: TLabel
          Left = 14
          Top = 30
          Width = 30
          Height = 12
          Caption = #26102#38388':'
        end
        object Label94: TLabel
          Left = 90
          Top = 30
          Width = 12
          Height = 12
          Caption = #31186
        end
        object EditFloorItemCanPickUpTime: TSpinEdit
          Left = 47
          Top = 25
          Width = 42
          Height = 21
          Hint = #20182#20154#29190#24618#29289#25110#25481#22320#19978#29289#21697#21487'??'#38548'??'#12290
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditFloorItemCanPickUpTimeChange
        end
      end
      object CastleWarDayGroup: TRadioGroup
        Left = 8
        Top = 136
        Width = 89
        Height = 145
        Caption = #31532#19968#27425#25915#22478
        ItemIndex = 1
        Items.Strings = (
          #26143#26399#19968
          #26143#26399#20108
          #26143#26399#19977
          #26143#26399#22235
          #26143#26399#20116
          #26143#26399#20845
          #26143#26399#26085)
        TabOrder = 10
        OnClick = CastleWarDayGroupClick
      end
      object CastleWarDayGroup2: TRadioGroup
        Left = 104
        Top = 136
        Width = 89
        Height = 145
        Caption = #31532#20108#27425#25915#22478
        ItemIndex = 2
        Items.Strings = (
          #26143#26399#19968
          #26143#26399#20108
          #26143#26399#19977
          #26143#26399#22235
          #26143#26399#20116
          #26143#26399#20845
          #26143#26399#26085)
        TabOrder = 11
        OnClick = CastleWarDayGroup2Click
      end
      object CastleWarDayGroup3: TRadioGroup
        Left = 200
        Top = 136
        Width = 89
        Height = 145
        Caption = #31532#19977#27425#25915#22478
        ItemIndex = 5
        Items.Strings = (
          #26143#26399#19968
          #26143#26399#20108
          #26143#26399#19977
          #26143#26399#22235
          #26143#26399#20116
          #26143#26399#20845
          #26143#26399#26085)
        TabOrder = 12
        OnClick = CastleWarDayGroup3Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = #20215#26684#36153#29992
      ImageIndex = 10
      object ButtonPriceSave: TButton
        Left = 449
        Top = 244
        Width = 83
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonPriceSaveClick
      end
      object GroupBox48: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 61
        Caption = #30003#35831#34892#20250#36153#29992
        TabOrder = 1
        object Label95: TLabel
          Left = 14
          Top = 30
          Width = 30
          Height = 12
          Caption = #36153#29992':'
        end
        object EditBuildGuildPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 21
          Hint = #30003'??'#24314#34892'?'#25152#38656'?'#29992#12290
          MaxValue = 100000000
          MinValue = 1000
          TabOrder = 0
          Value = 1000000
          OnChange = EditBuildGuildPriceChange
        end
      end
      object GroupBox49: TGroupBox
        Left = 10
        Top = 80
        Width = 171
        Height = 61
        Caption = #30003#35831#34892#20250#25112#36153#29992
        TabOrder = 2
        object Label96: TLabel
          Left = 14
          Top = 30
          Width = 30
          Height = 12
          Caption = #36153#29992':'
        end
        object EditGuildWarPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 21
          Hint = #30003'?'#34892'???'#25152#38656'?'#29992#12290
          MaxValue = 100000000
          MinValue = 1000
          TabOrder = 0
          Value = 30000
          OnChange = EditGuildWarPriceChange
        end
      end
      object GroupBox50: TGroupBox
        Left = 10
        Top = 150
        Width = 171
        Height = 61
        Caption = #33647#21697#28860#21046#20215#26684
        TabOrder = 3
        object Label97: TLabel
          Left = 14
          Top = 30
          Width = 30
          Height = 12
          Caption = #36153#29992':'
        end
        object EditMakeDurgPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 21
          Hint = '?'#21046'?'#21697#25152#38656'?'#29992#12290
          MaxValue = 100000000
          MinValue = 10
          TabOrder = 0
          Value = 100
          OnChange = EditMakeDurgPriceChange
        end
      end
      object GroupBox66: TGroupBox
        Left = 190
        Top = 10
        Width = 171
        Height = 91
        Caption = #20462#29702#29289#21697
        TabOrder = 4
        object Label126: TLabel
          Left = 14
          Top = 30
          Width = 78
          Height = 12
          Caption = #29305#20462#20215#26684#20493#25968':'
        end
        object Label127: TLabel
          Left = 14
          Top = 60
          Width = 78
          Height = 12
          Caption = #26222#20462#25481#25345#20037#28857':'
        end
        object EditSuperRepairPriceRate: TSpinEdit
          Left = 115
          Top = 25
          Width = 46
          Height = 21
          Hint = #29305#20462#29289#21697#20215#26684#20493'?'#65292#40664'??'#19977#20493#12290
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 3
          OnChange = EditSuperRepairPriceRateChange
        end
        object EditRepairItemDecDura: TSpinEdit
          Left = 110
          Top = 55
          Width = 51
          Height = 21
          Hint = #26222#36890#20462#29702#25481#25345#20037#28857'?'#12290
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 1
          Value = 3
          OnChange = EditRepairItemDecDuraChange
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = #20154#29289#27515#20129
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 12
      ParentFont = False
      object ButtonHumanDieSave: TButton
        Left = 445
        Top = 241
        Width = 86
        Height = 31
        Hint = 'Save settings'
        Caption = #20445#23384'(&S)'
        TabOrder = 0
        OnClick = ButtonHumanDieSaveClick
      end
      object GroupBox67: TGroupBox
        Left = 10
        Top = 10
        Width = 159
        Height = 167
        Caption = #27515#20129#25481#29289#21697#35268#21017
        TabOrder = 1
        object CheckBoxKillByMonstDropUseItem: TCheckBox
          Left = 10
          Top = 20
          Width = 119
          Height = 21
          Hint = '?'#20154#29289#34987#24618#29289'?'#27515'??'#25353#25481#33853#26426#29575#25481#33853#36523#19978#25140#30340#29289#21697#12290
          Caption = #34987#24618#29289#26432#27515#25481#35013#22791
          TabOrder = 0
          OnClick = CheckBoxKillByMonstDropUseItemClick
        end
        object CheckBoxKillByHumanDropUseItem: TCheckBox
          Left = 10
          Top = 40
          Width = 143
          Height = 21
          Hint = '?'#20154#29289#34987'?'#20154'?'#27515'??'#25353#25481#33853#26426#29575#25481#33853#36523#19978#25140#30340#29289#21697#12290
          Caption = #34987#20154#29289#26432#27515#25481#35013#22791
          TabOrder = 1
          OnClick = CheckBoxKillByHumanDropUseItemClick
        end
        object CheckBoxDieScatterBag: TCheckBox
          Left = 10
          Top = 60
          Width = 135
          Height = 21
          Hint = '?'#20154#29289#27515#20129'??'#25353#25481#33853#26426#29575#25481#33853#32972#21253#37324#30340#29289#21697#12290
          Caption = #27515#20129#25481#33853#32972#21253#29289#21697
          TabOrder = 2
          OnClick = CheckBoxDieScatterBagClick
        end
        object CheckBoxDieDropGold: TCheckBox
          Left = 10
          Top = 80
          Width = 119
          Height = 21
          Hint = '?'#20154#29289#27515#20129'??'#25481#33853#36523#19978#30340#37329'?'#12290
          Caption = #27515#20129#25481#33853#37329#24065
          TabOrder = 3
          OnClick = CheckBoxDieDropGoldClick
        end
        object CheckBoxDieRedScatterBagAll: TCheckBox
          Left = 10
          Top = 100
          Width = 143
          Height = 21
          Hint = '?'#21517#20154#29289#27515#20129'?'#25481#33853#32972#21253#20013#20840#37096#29289#21697#12290
          Caption = #32418#21517#25481#20840#37096#32972#21253#29289#21697
          TabOrder = 4
          OnClick = CheckBoxDieRedScatterBagAllClick
        end
        object Checkr64dell: TCheckBox
          Left = 10
          Top = 123
          Width = 143
          Height = 21
          Hint = '??? ??? ??'
          Caption = #27515#20129#29289#21697#28040#22833
          TabOrder = 5
          OnClick = Checkr64dellClick
        end
      end
      object GroupBox69: TGroupBox
        Left = 182
        Top = 10
        Width = 331
        Height = 111
        Caption = #25481#29289#21697#26426#29575
        TabOrder = 2
        object Label130: TLabel
          Left = 12
          Top = 23
          Width = 78
          Height = 12
          Caption = #19968#33324#35013#22791#25481#33853':'
        end
        object Label131: TLabel
          Left = 13
          Top = 55
          Width = 78
          Height = 12
          Caption = #32418#21517#35013#22791#25481#33853':'
        end
        object Label134: TLabel
          Left = 12
          Top = 83
          Width = 78
          Height = 12
          Caption = #32972#21253#29289#21697#25481#33853':'
        end
        object ScrollBarDieDropUseItemRate: TScrollBar
          Left = 96
          Top = 20
          Width = 169
          Height = 21
          Hint = #20154#29289#27515#20129#25481#33853#36523#19978#25140#30340#29289#21697#26426#29575#65292'?'#32622#30340'?'#23383#36234#23567#65292#26426#29575#36234#22823#12290
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarDieDropUseItemRateChange
        end
        object EditDieDropUseItemRate: TEdit
          Left = 270
          Top = 20
          Width = 51
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarDieRedDropUseItemRate: TScrollBar
          Left = 96
          Top = 50
          Width = 169
          Height = 21
          Hint = '?'#21517#20154#29289#27515#20129#25481#33853#36523#19978#25140#30340#29289#21697#26426#29575#65292'?'#32622#30340'?'#23383#36234#23567#65292#26426#29575#36234#22823#12290
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarDieRedDropUseItemRateChange
        end
        object EditDieRedDropUseItemRate: TEdit
          Left = 270
          Top = 50
          Width = 51
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarDieScatterBagRate: TScrollBar
          Left = 96
          Top = 80
          Width = 169
          Height = 21
          Hint = #20154#29289#27515#20129#25481#33853#32972#21253#20013#30340#29289#21697#26426#29575#65292'?'#32622#30340'?'#23383#36234#23567#65292#26426#29575#36234#22823#12290
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarDieScatterBagRateChange
        end
        object EditDieScatterBagRate: TEdit
          Left = 270
          Top = 80
          Width = 51
          Height = 18
          Ctl3D = False
          Enabled = False
          ImeName = 'Microsoft Office IME 2007'
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object GroupBox76: TGroupBox
        Left = 184
        Top = 128
        Width = 169
        Height = 49
        Caption = #38035#40060#20986#29289#21697#26426#29575
        TabOrder = 3
        object Label146: TLabel
          Left = 8
          Top = 24
          Width = 54
          Height = 12
          Caption = #38035#40060#26426#29575':'
        end
        object EditFishDropRate: TSpinEdit
          Left = 85
          Top = 20
          Width = 66
          Height = 21
          Hint = '?? ??? ?? ???? ?????.'
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditFishDropRateChange
        end
      end
    end
    object TabSheet11: TTabSheet
      Caption = #32452#38431#32463#39564
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ImageIndex = 14
      ParentFont = False
      object Label163: TLabel
        Left = 16
        Top = 256
        Width = 261
        Height = 15
        Caption = '1'#20154#26159#22522#20934#32463#39564#65292#20174'2'#20010#20154#24320#22987#20139#21463#32463#39564#21152#25104#12290
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #23435'?'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox80: TGroupBox
        Left = 16
        Top = 16
        Width = 321
        Height = 217
        Caption = #35774#32622#32452#38431#32463#39564
        TabOrder = 0
        object Label152: TLabel
          Left = 16
          Top = 24
          Width = 24
          Height = 12
          Caption = '1'#20154':'
        end
        object Label153: TLabel
          Left = 16
          Top = 49
          Width = 24
          Height = 12
          Caption = '2'#20154':'
        end
        object Label154: TLabel
          Left = 16
          Top = 74
          Width = 24
          Height = 12
          Caption = '3'#20154':'
        end
        object Label155: TLabel
          Left = 16
          Top = 98
          Width = 24
          Height = 12
          Caption = '4'#20154':'
        end
        object Label156: TLabel
          Left = 16
          Top = 123
          Width = 24
          Height = 12
          Caption = '5'#20154':'
        end
        object Label157: TLabel
          Left = 16
          Top = 146
          Width = 24
          Height = 12
          Caption = '6'#20154':'
        end
        object Label158: TLabel
          Left = 16
          Top = 168
          Width = 24
          Height = 12
          Caption = '7'#20154':'
        end
        object Label159: TLabel
          Left = 160
          Top = 27
          Width = 24
          Height = 12
          Caption = '8'#20154':'
        end
        object Label160: TLabel
          Left = 160
          Top = 51
          Width = 24
          Height = 12
          Caption = '9'#20154':'
        end
        object Label161: TLabel
          Left = 160
          Top = 75
          Width = 30
          Height = 12
          Caption = '10'#20154':'
        end
        object Label162: TLabel
          Left = 160
          Top = 100
          Width = 30
          Height = 12
          Caption = '11'#20154':'
        end
        object lbl3: TLabel
          Left = 160
          Top = 124
          Width = 30
          Height = 12
          Caption = '12'#20154':'
        end
        object lbl4: TLabel
          Left = 160
          Top = 148
          Width = 30
          Height = 12
          Caption = '13'#20154':'
        end
        object EditGroupExpRate1: TEdit
          Left = 48
          Top = 24
          Width = 100
          Height = 20
          Hint = '???? ???? ?????'
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
          Text = '1'
          OnChange = EditGroupExpRate1Change
        end
        object EditGroupExpRate2: TEdit
          Left = 48
          Top = 48
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 1
          Text = '1.9'
          OnChange = EditGroupExpRate2Change
        end
        object EditGroupExpRate3: TEdit
          Left = 48
          Top = 72
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
          Text = '2.7'
          OnChange = EditGroupExpRate3Change
        end
        object EditGroupExpRate4: TEdit
          Left = 48
          Top = 96
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 3
          Text = '3.4'
          OnChange = EditGroupExpRate4Change
        end
        object EditGroupExpRate5: TEdit
          Left = 48
          Top = 120
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 4
          Text = '4.5'
          OnChange = EditGroupExpRate5Change
        end
        object EditGroupExpRate6: TEdit
          Left = 48
          Top = 144
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 5
          Text = '4.9'
          OnChange = EditGroupExpRate6Change
        end
        object EditGroupExpRate7: TEdit
          Left = 48
          Top = 168
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 6
          Text = '5.2'
          OnChange = EditGroupExpRate7Change
        end
        object EditGroupExpRate8: TEdit
          Left = 200
          Top = 24
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          Text = '5.4'
          OnChange = EditGroupExpRate8Change
        end
        object EditGroupExpRate9: TEdit
          Left = 200
          Top = 48
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 8
          Text = '5.5'
          OnChange = EditGroupExpRate9Change
        end
        object EditGroupExpRate10: TEdit
          Left = 200
          Top = 72
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 9
          Text = '5.5'
          OnChange = EditGroupExpRate10Change
        end
        object EditGroupExpRate11: TEdit
          Left = 200
          Top = 96
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 10
          Text = '5.4'
          OnChange = EditGroupExpRate11Change
        end
        object EditGroupExpRate12: TEdit
          Left = 200
          Top = 120
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 11
          Text = '5.4'
          OnChange = EditGroupExpRate12Change
        end
        object EditGroupExpRate13: TEdit
          Left = 200
          Top = 146
          Width = 100
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 12
          Text = '5.4'
          OnChange = EditGroupExpRate13Change
        end
      end
      object GroupExpRateSave: TButton
        Left = 448
        Top = 240
        Width = 83
        Height = 33
        Hint = '?? ??'
        Caption = #20445#23384'(&S)'
        TabOrder = 1
        OnClick = GroupExpRateSaveClick
      end
      object GroupBox83: TGroupBox
        Left = 352
        Top = 16
        Width = 177
        Height = 121
        Caption = #32452#38431'BUFF'
        TabOrder = 2
        object Label168: TLabel
          Left = 16
          Top = 24
          Width = 66
          Height = 12
          Caption = 'Max   HP : '
        end
        object Label169: TLabel
          Left = 16
          Top = 48
          Width = 66
          Height = 12
          Caption = #20307#21147#24674#22797' : '
        end
        object Label170: TLabel
          Left = 16
          Top = 72
          Width = 66
          Height = 12
          Caption = #32463' '#39564' '#20540' : '
        end
        object Label171: TLabel
          Left = 16
          Top = 96
          Width = 66
          Height = 12
          Caption = #25915' '#20987' '#21147' : '
        end
        object SpinGroupHp: TSpinEdit
          Left = 80
          Top = 17
          Width = 79
          Height = 21
          Hint = '?? ?? ???'
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 180
          OnChange = SpinGroupHpChange
        end
        object SpinGroupRecHp: TSpinEdit
          Left = 80
          Top = 41
          Width = 79
          Height = 21
          Hint = '????'
          MaxValue = 500
          MinValue = 1
          TabOrder = 1
          Value = 180
          OnChange = SpinGroupRecHpChange
        end
        object SpinGroupExp: TSpinEdit
          Left = 80
          Top = 65
          Width = 79
          Height = 21
          Hint = '?? ?? ???'
          MaxValue = 500
          MinValue = 1
          TabOrder = 2
          Value = 180
          OnChange = SpinGroupExpChange
        end
        object SpinGroupPo: TSpinEdit
          Left = 80
          Top = 89
          Width = 79
          Height = 21
          Hint = '?? ?? ???'
          MaxValue = 500
          MinValue = 1
          TabOrder = 3
          Value = 180
          OnChange = SpinGroupPoChange
        end
      end
    end
  end
end
