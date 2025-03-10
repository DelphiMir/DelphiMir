object frmViewList: TfrmViewList
  Left = 412
  Top = 308
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21015#34920#20449#24687
  ClientHeight = 581
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object PageControlViewList: TPageControl
    Left = 10
    Top = 10
    Width = 983
    Height = 559
    ActivePage = TabSheet14
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #31105#27490#21046#36896
      object GroupBox3: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = #31105#27490#21046#36896#29289#21697#21015#34920
        TabOrder = 0
        object ListBoxDisableMakeList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = '???'
          Font.Style = []
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          OnClick = ListBoxDisableMakeListClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = #29289#21697#21015#34920
        TabOrder = 1
        object ListBoxitemList1: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          MultiSelect = True
          TabOrder = 0
          OnClick = ListBoxitemList1Click
        end
      end
      object ButtonDisableMakeAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = #22686#21152'(&A)'
        TabOrder = 2
        OnClick = ButtonDisableMakeAddClick
      end
      object ButtonDisableMakeDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = #21024#38500'(&D)'
        TabOrder = 3
        OnClick = ButtonDisableMakeDeleteClick
      end
      object ButtonDisableMakeSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 4
        OnClick = ButtonDisableMakeSaveClick
      end
      object ButtonDisableMakeAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = #20840#37096#22686#21152'(&A)'
        TabOrder = 5
        OnClick = ButtonDisableMakeAddAllClick
      end
      object ButtonDisableMakeDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = #20840#37096#21024#38500'(&D)'
        TabOrder = 6
        OnClick = ButtonDisableMakeDeleteAllClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #20801#35768#21046#36896
      ImageIndex = 1
      TabVisible = False
      object GroupBox2: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '??????'
        TabOrder = 0
        object ListBoxItemList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxItemListClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '?? ?? ???'
        TabOrder = 1
        object ListBoxEnableMakeList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxEnableMakeListClick
        end
      end
      object ButtonEnableMakeAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 2
        OnClick = ButtonEnableMakeAddClick
      end
      object ButtonEnableMakeDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 3
        OnClick = ButtonEnableMakeDeleteClick
      end
      object ButtonEnableMakeSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 4
        OnClick = ButtonEnableMakeSaveClick
      end
      object ButtonEnableMakeAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 5
        OnClick = ButtonEnableMakeAddAllClick
      end
      object ButtonEnableMakeDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 6
        OnClick = ButtonEnableMakeDeleteAllClick
      end
    end
    object TabSheet8: TTabSheet
      Caption = #26085#24535#36807#28388
      ImageIndex = 8
      object GroupBox8: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = #26085#24535#35760#24405#29289#21697#21015#34920
        TabOrder = 0
        object ListBoxGameLogList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxGameLogListClick
        end
      end
      object ButtonGameLogAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = #22686#21152'(&A)'
        TabOrder = 1
        OnClick = ButtonGameLogAddClick
      end
      object ButtonGameLogDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = #21024#38500'(&D)'
        TabOrder = 2
        OnClick = ButtonGameLogDelClick
      end
      object ButtonGameLogAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = #20840#37096#22686#21152'(&A)'
        TabOrder = 3
        OnClick = ButtonGameLogAddAllClick
      end
      object ButtonGameLogDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = #20840#37096#21024#38500'(&D)'
        TabOrder = 4
        OnClick = ButtonGameLogDelAllClick
      end
      object ButtonGameLogSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 5
        OnClick = ButtonGameLogSaveClick
      end
      object GroupBox9: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = #29289#21697#21015#34920
        TabOrder = 6
        object ListBoxitemList2: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxitemList2Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #31105#27490#20256#36865
      ImageIndex = 2
      object GroupBox5: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = #31105#27490#20256#36865#22320#22270#21015#34920
        TabOrder = 0
        object ListBoxDisableMoveMap: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxDisableMoveMapClick
        end
      end
      object ButtonDisableMoveMapAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = #22686#21152'(&A)'
        TabOrder = 1
        OnClick = ButtonDisableMoveMapAddClick
      end
      object ButtonDisableMoveMapDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = #21024#38500'(&D)'
        TabOrder = 2
        OnClick = ButtonDisableMoveMapDeleteClick
      end
      object ButtonDisableMoveMapAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = #20840#37096#22686#21152'(&A)'
        TabOrder = 3
        OnClick = ButtonDisableMoveMapAddAllClick
      end
      object ButtonDisableMoveMapDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = #20840#37096#21024#38500'(&D)'
        TabOrder = 4
        OnClick = ButtonDisableMoveMapDeleteAllClick
      end
      object ButtonDisableMoveMapSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 5
        OnClick = ButtonDisableMoveMapSaveClick
      end
      object GroupBox6: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = #22320#22270#21015#34920
        TabOrder = 6
        object ListBoxMapList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxMapListClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #31105#35328#21015#34920
      ImageIndex = 3
      TabVisible = False
    end
    object TabSheet5: TTabSheet
      Caption = #29289#21697#32465#23450#36134#21495
      ImageIndex = 4
      object GridItemBindAccount: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = #21152#20837#27492#21015#34920#20013#30340#29289#21697'??'#25351#23450#30340#30331'????'#23450#65292#21482#26377#20197'?'#23450#30340#30331'???'#30331'?'#30340#20154#29289#25165#21487#20197#25140#19978#27492#29289#21697#12290
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindAccountClick
        ColWidths = (
          129
          85
          95
          102)
      end
      object GroupBox16: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = #35774#32622
        TabOrder = 1
        object Label6: TLabel
          Left = 10
          Top = 53
          Width = 48
          Height = 12
          Caption = #29289#21697'IDX:'
        end
        object Label7: TLabel
          Left = 10
          Top = 83
          Width = 42
          Height = 12
          Caption = #29289#21697'ID:'
        end
        object Label8: TLabel
          Left = 10
          Top = 113
          Width = 54
          Height = 12
          Caption = #28216#25103#36134#21495':'
        end
        object Label9: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #29289#21697#21517#23383':'
        end
        object ButtonItemBindAcountMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = #20462#25913'(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindAcountModClick
        end
        object EditItemBindAccountItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindAccountItemIdxChange
        end
        object EditItemBindAccountItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindAccountItemMakeIdxChange
        end
        object EditItemBindAccountItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindAcountAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindAcountAddClick
        end
        object ButtonItemBindAcountRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = #21047#26032'(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindAcountRefClick
        end
        object ButtonItemBindAcountDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindAcountDelClick
        end
        object EditItemBindAccountName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          OnChange = EditItemBindAccountNameChange
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #29289#21697#32465#23450#20154#29289
      ImageIndex = 5
      object GridItemBindCharName: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = #21152#20837#27492#21015#34920#20013#30340#29289#21697'??'#25351#23450#30340#20154#29289#21517'??'#23450#65292#21482#26377'?'#23450#30340#20154#29289#25165#21487#20197#25140#19978#27492#29289#21697#12290
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindCharNameClick
        ColWidths = (
          106
          87
          96
          125)
      end
      object GroupBox17: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = #35774#32622
        TabOrder = 1
        object Label10: TLabel
          Left = 10
          Top = 53
          Width = 48
          Height = 12
          Caption = #29289#21697'IDX:'
        end
        object Label11: TLabel
          Left = 10
          Top = 83
          Width = 42
          Height = 12
          Caption = #29289#21697'ID:'
        end
        object Label12: TLabel
          Left = 10
          Top = 113
          Width = 54
          Height = 12
          Caption = #20154#29289#21517#23383':'
        end
        object Label13: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #29289#21697#21517#23383':'
        end
        object ButtonItemBindCharNameMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = #20462#25913'(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindCharNameModClick
        end
        object EditItemBindCharNameItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindCharNameItemIdxChange
        end
        object EditItemBindCharNameItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindCharNameItemMakeIdxChange
        end
        object EditItemBindCharNameItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindCharNameAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindCharNameAddClick
        end
        object ButtonItemBindCharNameRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = #21047#26032'(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindCharNameRefClick
        end
        object ButtonItemBindCharNameDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindCharNameDelClick
        end
        object EditItemBindCharNameName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          OnChange = EditItemBindCharNameNameChange
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = #29289#21697#32465#23450'IP'
      ImageIndex = 6
      object GridItemBindIPaddr: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = #21152#20837#27492#21015#34920#20013#30340#29289#21697'??'#25351#23450#30340#30331'?IP'#22320#22336'?'#23450#65292#21482#26377#20197'?'#23450#30340#30331'?IP'#22320#22336#30331'?'#30340#20154#29289#25165#21487#20197#25140#19978#27492#29289#21697#12290
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindIPaddrClick
        ColWidths = (
          110
          95
          96
          110)
      end
      object GroupBox18: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = #35774#32622
        TabOrder = 1
        object Label14: TLabel
          Left = 10
          Top = 53
          Width = 48
          Height = 12
          Caption = #29289#21697'IDX:'
        end
        object Label15: TLabel
          Left = 10
          Top = 83
          Width = 42
          Height = 12
          Caption = #29289#21697'ID:'
        end
        object Label16: TLabel
          Left = 10
          Top = 113
          Width = 42
          Height = 12
          Caption = 'IP'#22320#22336':'
        end
        object Label17: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #29289#21697#21517#23383':'
        end
        object ButtonItemBindIPaddrMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = #20462#25913'(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindIPaddrModClick
        end
        object EditItemBindIPaddrItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindIPaddrItemIdxChange
        end
        object EditItemBindIPaddrItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindIPaddrItemMakeIdxChange
        end
        object EditItemBindIPaddrItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindIPaddrAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindIPaddrAddClick
        end
        object ButtonItemBindIPaddrRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = #21047#26032'(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindIPaddrRefClick
        end
        object ButtonItemBindIPaddrDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindIPaddrDelClick
        end
        object EditItemBindIPaddrName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          OnChange = EditItemBindIPaddrNameChange
        end
      end
    end
    object TabSheet12: TTabSheet
      Caption = #29289#21697#25913#21517
      ImageIndex = 12
      object GridItemNameList: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        ColCount = 3
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemNameListClick
        ColWidths = (
          149
          109
          154)
      end
      object GroupBox19: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = #35774#32622
        TabOrder = 1
        object Label18: TLabel
          Left = 10
          Top = 53
          Width = 48
          Height = 12
          Caption = #29289#21697'IDX:'
        end
        object Label19: TLabel
          Left = 10
          Top = 83
          Width = 42
          Height = 12
          Caption = #29289#21697'ID:'
        end
        object Label20: TLabel
          Left = 10
          Top = 113
          Width = 54
          Height = 12
          Caption = #20154#29289#21517#23383':'
        end
        object Label21: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #29289#21697#21517#23383':'
        end
        object ButtonItemNameMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = #20462#25913'(&S)'
          TabOrder = 0
          OnClick = ButtonItemNameModClick
        end
        object EditItemNameIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemNameIdxChange
        end
        object EditItemNameMakeIndex: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemNameMakeIndexChange
        end
        object EditItemNameOldName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemNameAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 4
          OnClick = ButtonItemNameAddClick
        end
        object ButtonItemNameRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = #21047#26032'(&R)'
          TabOrder = 5
          OnClick = ButtonItemNameRefClick
        end
        object ButtonItemNameDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 6
          OnClick = ButtonItemNameDelClick
        end
        object EditItemNameNewName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 7
          OnChange = EditItemNameNewNameChange
        end
      end
    end
    object TabSheetMonDrop: TTabSheet
      Caption = #24618#29289#29190#20986#29289#21697
      ImageIndex = 7
      object StringGridMonDropLimit: TStringGrid
        Left = 10
        Top = 10
        Width = 567
        Height = 221
        ColCount = 6
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = StringGridMonDropLimitClick
        ColWidths = (
          81
          75
          85
          89
          69
          155)
      end
      object GroupBox7: TGroupBox
        Left = 584
        Top = 10
        Width = 377
        Height = 221
        Caption = #37197#32622#21015#34920' '
        TabOrder = 1
        object Label29: TLabel
          Left = 10
          Top = 53
          Width = 66
          Height = 12
          Caption = #24050#29190#20986#25968#37327':'
        end
        object Label1: TLabel
          Left = 10
          Top = 83
          Width = 66
          Height = 12
          Caption = #20801#35768#29190#20986#25968':'
        end
        object Label2: TLabel
          Left = 10
          Top = 113
          Width = 66
          Height = 12
          Caption = #26410#25253#20986#25968#37327':'
        end
        object Label3: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 12
          Caption = #29289#21697#21517#31216':'
        end
        object Label64: TLabel
          Left = 250
          Top = 19
          Width = 48
          Height = 12
          Caption = #26102#38388#38480#21046
        end
        object Label65: TLabel
          Left = 250
          Top = 59
          Width = 48
          Height = 12
          Caption = #26085#26399#35774#23450
        end
        object Label66: TLabel
          Left = 338
          Top = 83
          Width = 30
          Height = 12
          Caption = #22825#21518' '
        end
        object ButtonMonDropLimitSave: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = #20445#23384'(&S)'
          TabOrder = 0
          OnClick = ButtonMonDropLimitSaveClick
        end
        object EditDropCount: TSpinEdit
          Left = 96
          Top = 48
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditDropCountChange
        end
        object EditCountLimit: TSpinEdit
          Left = 96
          Top = 78
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditCountLimitChange
        end
        object EditNoDropCount: TSpinEdit
          Left = 96
          Top = 108
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 3
          Value = 10
          OnChange = EditNoDropCountChange
        end
        object EditItemName: TEdit
          Left = 96
          Top = 19
          Width = 111
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 4
        end
        object ButtonMonDropLimitAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 5
          OnClick = ButtonMonDropLimitAddClick
        end
        object ButtonMonDropLimitRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = #21047#26032'(&R)'
          TabOrder = 6
          OnClick = ButtonMonDropLimitRefClick
        end
        object ButtonMonDropLimitDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 7
          OnClick = ButtonMonDropLimitDelClick
        end
        object CheckDropData: TCheckBox
          Left = 250
          Top = 34
          Width = 121
          Height = 21
          Caption = #21551#29992#26102#38388#38480#21046
          TabOrder = 8
        end
        object DropDateSpin: TSpinEdit
          Left = 248
          Top = 80
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 9
          Value = 10
          OnChange = DropDateSpinChange
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = #31105#27490#33073#19979#21015#34920
      ImageIndex = 9
      object GroupBox10: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = #31105#27490#33073#19979#29289#21697#21015#34920
        TabOrder = 0
        object ListBoxDisableTakeOffList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          Hint = #31105#27490#21462#19979#29289#21697'?'#32622#65292#21152#20837#27492#21015#34920#30340#29289#21697#25140#22312#36523#19978#21518'?'#19981#21487#20197#21462#19979'?'#65292#27515#20129#20063#19981'?'#25481#33853#12290
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxDisableTakeOffListClick
        end
      end
      object ButtonDisableTakeOffAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = #22686#21152'(&A)'
        TabOrder = 1
        OnClick = ButtonDisableTakeOffAddClick
      end
      object ButtonDisableTakeOffDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = #21024#38500'(&D)'
        TabOrder = 2
        OnClick = ButtonDisableTakeOffDelClick
      end
      object ButtonDisableTakeOffAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = #20840#37096#22686#21152'(&A)'
        TabOrder = 3
        OnClick = ButtonDisableTakeOffAddAllClick
      end
      object ButtonDisableTakeOffDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = #20840#37096#21024#38500'(&D)'
        TabOrder = 4
        OnClick = ButtonDisableTakeOffDelAllClick
      end
      object ButtonDisableTakeOffSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 5
        OnClick = ButtonDisableTakeOffSaveClick
      end
      object GroupBox11: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = #29289#21697#21015#34920
        TabOrder = 6
        object ListBoxitemList3: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxitemList3Click
        end
      end
    end
    object TabSheet11: TTabSheet
      Caption = #31105#27490#28165#38500#24618#29289
      ImageIndex = 11
      object GroupBox13: TGroupBox
        Left = 10
        Top = 4
        Width = 221
        Height = 221
        Caption = #31105#27490#28165#38500#24618#29289#21015#34920
        TabOrder = 0
        object ListBoxNoClearMonList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          Hint = #31105#27490'?'#38500#24618#29289'?'#32622#65292#29992#20110#33050#26412#21629#20196'CLEARMAPMON'#65292#21152#20837#27492#21015#34920#30340#24618#29289#65292#22312#20351#29992#27492#33050#26412#21629#20196'?'#19981'?'#34987'?'#38500#12290
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxNoClearMonListClick
        end
      end
      object ButtonNoClearMonAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = #22686#21152'(&A)'
        TabOrder = 1
        OnClick = ButtonNoClearMonAddClick
      end
      object ButtonNoClearMonDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = #21024#38500'(&D)'
        TabOrder = 2
        OnClick = ButtonNoClearMonDelClick
      end
      object ButtonNoClearMonAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = #20840#37096#22686#21152'(&A)'
        TabOrder = 3
        OnClick = ButtonNoClearMonAddAllClick
      end
      object ButtonNoClearMonDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = #20840#37096#21024#38500'(&D)'
        TabOrder = 4
        OnClick = ButtonNoClearMonDelAllClick
      end
      object ButtonNoClearMonSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 5
        OnClick = ButtonNoClearMonSaveClick
      end
      object GroupBox14: TGroupBox
        Left = 360
        Top = 4
        Width = 221
        Height = 221
        Caption = #24618#29289#21015#34920
        TabOrder = 6
        object ListBoxMonList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxMonListClick
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = #31649#29702#21592#21015#34920
      ImageIndex = 10
      object GroupBox12: TGroupBox
        Left = 10
        Top = 5
        Width = 341
        Height = 221
        Caption = #31649#29702#21592#21015#34920
        TabOrder = 0
        object ListBoxAdminList: TListBox
          Left = 10
          Top = 20
          Width = 321
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxAdminListClick
        end
      end
      object GroupBox15: TGroupBox
        Left = 390
        Top = 5
        Width = 261
        Height = 176
        Caption = #35774#32622#20449#24687
        TabOrder = 1
        object Label4: TLabel
          Left = 25
          Top = 45
          Width = 54
          Height = 12
          Caption = #35282#33394#21517#23383':'
        end
        object Label5: TLabel
          Left = 25
          Top = 75
          Width = 54
          Height = 12
          Caption = #26435#38480#31561#32423':'
        end
        object LabelAdminIPaddr: TLabel
          Left = 25
          Top = 105
          Width = 42
          Height = 12
          Caption = 'IP'#22320#22336':'
          Visible = False
        end
        object EditAdminName: TEdit
          Left = 100
          Top = 40
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
        end
        object EditAdminPremission: TSpinEdit
          Left = 100
          Top = 69
          Width = 76
          Height = 21
          MaxValue = 10
          MinValue = 1
          TabOrder = 1
          Value = 10
        end
        object ButtonAdminListAdd: TButton
          Left = 20
          Top = 130
          Width = 71
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 2
          OnClick = ButtonAdminListAddClick
        end
        object ButtonAdminListChange: TButton
          Left = 100
          Top = 130
          Width = 71
          Height = 31
          Caption = #20462#25913'(&M)'
          TabOrder = 3
          OnClick = ButtonAdminListChangeClick
        end
        object ButtonAdminListDel: TButton
          Left = 180
          Top = 130
          Width = 71
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 4
          OnClick = ButtonAdminListDelClick
        end
        object EditAdminIPaddr: TEdit
          Left = 85
          Top = 100
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 5
          Visible = False
        end
      end
      object ButtonAdminLitsSave: TButton
        Left = 580
        Top = 190
        Width = 71
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 2
        OnClick = ButtonAdminLitsSaveClick
      end
    end
    object TabSheet13: TTabSheet
      Caption = #23459#20256#22242#21015#34920
      ImageIndex = 13
      object GroupBox20: TGroupBox
        Left = 10
        Top = 5
        Width = 341
        Height = 221
        Caption = #23459#20256#22242#21015#34920
        TabOrder = 0
        object ListBoxColumnList: TListBox
          Left = 10
          Top = 20
          Width = 321
          Height = 191
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxColumnListClick
        end
      end
      object GroupBox21: TGroupBox
        Left = 390
        Top = 5
        Width = 261
        Height = 176
        Caption = #37197#32622
        TabOrder = 1
        object Label22: TLabel
          Left = 25
          Top = 45
          Width = 54
          Height = 12
          Caption = #35282#33394#21517#23383':'
        end
        object Label23: TLabel
          Left = 25
          Top = 75
          Width = 54
          Height = 12
          Caption = #26435#38480#31561#32423':'
        end
        object LabelColumnIPaddr: TLabel
          Left = 25
          Top = 104
          Width = 42
          Height = 12
          Caption = 'IP'#22320#22336':'
          Visible = False
        end
        object EditColumnName: TEdit
          Left = 104
          Top = 40
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 0
        end
        object EditColumnPremission: TSpinEdit
          Left = 104
          Top = 72
          Width = 121
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object EditColumnIPaddr: TEdit
          Left = 104
          Top = 104
          Width = 121
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 2
          Visible = False
        end
        object ButtonColumnListAdd: TButton
          Left = 20
          Top = 130
          Width = 71
          Height = 31
          Caption = #22686#21152'(&A)'
          TabOrder = 3
          OnClick = ButtonColumnListAddClick
        end
        object ButtonColumnListChange: TButton
          Left = 100
          Top = 130
          Width = 71
          Height = 31
          Caption = #20462#25913'(&M)'
          TabOrder = 4
          OnClick = ButtonColumnListChangeClick
        end
        object ButtonColumnListDel: TButton
          Left = 180
          Top = 130
          Width = 71
          Height = 31
          Caption = #21024#38500'(&D)'
          TabOrder = 5
          OnClick = ButtonColumnListDelClick
        end
      end
      object ButtonColumnLitsSave: TButton
        Left = 580
        Top = 190
        Width = 71
        Height = 31
        Caption = #20445#23384'(&S)'
        TabOrder = 2
        OnClick = ButtonColumnLitsSaveClick
      end
    end
    object TabSheet14: TTabSheet
      Caption = #22871#35013#35774#32622
      ImageIndex = 14
      object GroupBox22: TGroupBox
        Left = 8
        Top = 4
        Width = 177
        Height = 501
        Caption = #29289#21697#21015#34920'('#26597#25214':Ctrl+F)'
        TabOrder = 0
        object ListBoxSetItems: TListBox
          Left = 7
          Top = 18
          Width = 161
          Height = 471
          Style = lbOwnerDrawFixed
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 12
          MultiSelect = True
          PopupMenu = PopupMenu1
          TabOrder = 0
          OnDblClick = ListBoxSetItemsDblClick
          OnKeyDown = ListBoxSetItemsKeyDown
        end
      end
      object GroupBox23: TGroupBox
        Left = 190
        Top = 8
        Width = 771
        Height = 125
        Caption = #22871#35013#29289#21697#21015#34920
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object ListViewSuit: TListView
          Left = 11
          Top = 16
          Width = 742
          Height = 98
          Columns = <
            item
              Caption = #22871#35013#21517#31216
              Width = 160
            end
            item
              Caption = #22871#35013#29289#21697
              Width = 220
            end
            item
              AutoSize = True
              Caption = #22871#35013#29289#21697#25928#26524
            end
            item
              Caption = #22871#35013#25552#31034
              Width = 60
            end>
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          GridLines = True
          ReadOnly = True
          RowSelect = True
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          OnClick = ListViewSuitClick
        end
      end
      object GroupBox24: TGroupBox
        Left = 191
        Top = 136
        Width = 770
        Height = 369
        Caption = #22871#35013#36873#39033
        TabOrder = 2
        object Label24: TLabel
          Left = 620
          Top = 139
          Width = 30
          Height = 12
          Caption = 'MaxHP'
        end
        object Label25: TLabel
          Left = 620
          Top = 161
          Width = 30
          Height = 12
          Caption = 'MaxMP'
        end
        object Label26: TLabel
          Left = 488
          Top = 94
          Width = 54
          Height = 12
          Caption = #26368#22823#38450#24481':'
        end
        object Label27: TLabel
          Left = 488
          Top = 116
          Width = 54
          Height = 12
          Caption = #26368#22823#39764#24481':'
        end
        object Label28: TLabel
          Left = 488
          Top = 29
          Width = 54
          Height = 12
          Caption = #26368#22823#25915#20987':'
        end
        object Label30: TLabel
          Left = 488
          Top = 50
          Width = 54
          Height = 12
          Caption = #26368#22823#39764#27861':'
        end
        object Label31: TLabel
          Left = 488
          Top = 72
          Width = 54
          Height = 12
          Caption = #26368#22823#36947#26415':'
        end
        object Label32: TLabel
          Left = 488
          Top = 205
          Width = 30
          Height = 12
          Caption = #20934#30830':'
        end
        object Label33: TLabel
          Left = 620
          Top = 29
          Width = 54
          Height = 12
          Caption = #29983#21629#24674#22797':'
        end
        object Label34: TLabel
          Left = 620
          Top = 50
          Width = 54
          Height = 12
          Caption = #39764#27861#24674#22797':'
        end
        object Label35: TLabel
          Left = 620
          Top = 94
          Width = 54
          Height = 12
          Caption = #39764#27861#36530#36991':'
        end
        object Label36: TLabel
          Left = 620
          Top = 116
          Width = 54
          Height = 12
          Caption = #27602#29289#36530#36991':'
        end
        object Label37: TLabel
          Left = 356
          Top = 29
          Width = 54
          Height = 12
          Caption = #26368#23567#25915#20987':'
        end
        object Label38: TLabel
          Left = 356
          Top = 51
          Width = 54
          Height = 12
          Caption = #26368#23567#39764#27861':'
        end
        object Label39: TLabel
          Left = 620
          Top = 205
          Width = 30
          Height = 12
          Caption = #25935#25463':'
        end
        object Label40: TLabel
          Left = 620
          Top = 72
          Width = 54
          Height = 12
          Caption = #20013#27602#24674#22797':'
        end
        object Label41: TLabel
          Left = 356
          Top = 227
          Width = 30
          Height = 12
          Caption = #21560#34880':'
        end
        object Label42: TLabel
          Left = 356
          Top = 73
          Width = 54
          Height = 12
          Caption = #26368#23567#36947#26415':'
        end
        object Label43: TLabel
          Left = 488
          Top = 139
          Width = 54
          Height = 12
          Caption = #31359#25140#36127#37325':'
        end
        object Label44: TLabel
          Left = 356
          Top = 117
          Width = 54
          Height = 12
          Caption = #26368#23567#39764#24481':'
        end
        object Label45: TLabel
          Left = 356
          Top = 95
          Width = 54
          Height = 12
          Caption = #26368#23567#38450#24481':'
        end
        object Label46: TLabel
          Left = 15
          Top = 288
          Width = 60
          Height = 12
          Caption = #22871#35013#21517#31216' :'
        end
        object Label47: TLabel
          Left = 620
          Top = 227
          Width = 42
          Height = 12
          Caption = #20813#21161#36305':'
        end
        object Label48: TLabel
          Left = 356
          Top = 183
          Width = 54
          Height = 12
          Caption = #25915#20987#36895#24230':'
        end
        object Label49: TLabel
          Left = 356
          Top = 139
          Width = 54
          Height = 12
          Caption = #32972#21253#37325#37327':'
        end
        object Label50: TLabel
          Left = 488
          Top = 161
          Width = 30
          Height = 12
          Caption = #24184#36816':'
        end
        object Label51: TLabel
          Left = 356
          Top = 161
          Width = 54
          Height = 12
          Caption = #21452#25163#36127#37325':'
        end
        object Label67: TLabel
          Left = 488
          Top = 227
          Width = 30
          Height = 12
          Caption = #21560#34013':'
        end
        object Label68: TLabel
          Left = 356
          Top = 249
          Width = 54
          Height = 12
          Caption = #29983#21629#24674#22797':'
        end
        object Label69: TLabel
          Left = 488
          Top = 249
          Width = 54
          Height = 12
          Caption = 'MP>HP'#36716#25442
        end
        object Label70: TLabel
          Left = 356
          Top = 205
          Width = 30
          Height = 12
          Caption = #31070#22307':'
        end
        object Label71: TLabel
          Left = 356
          Top = 271
          Width = 30
          Height = 12
          Caption = #40635#30201':'
        end
        object Label72: TLabel
          Left = 488
          Top = 271
          Width = 30
          Height = 12
          Caption = #25252#36523':'
        end
        object Label73: TLabel
          Left = 356
          Top = 293
          Width = 54
          Height = 12
          Caption = #32463#39564#22686#21152':'
        end
        object Label74: TLabel
          Left = 620
          Top = 271
          Width = 54
          Height = 12
          Caption = #25915#20987#22686#21152':'
        end
        object Label75: TLabel
          Left = 620
          Top = 249
          Width = 30
          Height = 12
          Caption = #20256#36865':'
        end
        object EditHP: TSpinEdit
          Tag = 13
          Left = 686
          Top = 135
          Width = 52
          Height = 21
          Color = clWhite
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = EditHPChange
        end
        object EditMP: TSpinEdit
          Tag = 14
          Left = 686
          Top = 157
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = EditHPChange
        end
        object EditACt: TSpinEdit
          Tag = 9
          Left = 554
          Top = 91
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 0
          OnChange = EditHPChange
        end
        object EditMAC3: TSpinEdit
          Tag = 10
          Left = 554
          Top = 113
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 0
          OnChange = EditHPChange
        end
        object EditDC: TSpinEdit
          Tag = 4
          Left = 554
          Top = 25
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 0
          OnChange = EditHPChange
        end
        object EditMC: TSpinEdit
          Tag = 5
          Left = 554
          Top = 47
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnChange = EditHPChange
        end
        object EditSC: TSpinEdit
          Tag = 6
          Left = 554
          Top = 69
          Width = 52
          Height = 21
          Color = clWhite
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 0
          OnChange = EditHPChange
        end
        object EditSC2: TSpinEdit
          Tag = 11
          Left = 554
          Top = 201
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 0
          OnChange = EditHPChange
        end
        object EditAC: TSpinEdit
          Tag = 15
          Left = 686
          Top = 25
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 8
          Value = 0
          OnChange = EditHPChange
        end
        object EditAC2: TSpinEdit
          Tag = 16
          Left = 686
          Top = 47
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 9
          Value = 0
          OnChange = EditHPChange
        end
        object EditMAC: TSpinEdit
          Tag = 18
          Left = 686
          Top = 91
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 10
          Value = 0
          OnChange = EditHPChange
        end
        object EditMAC2: TSpinEdit
          Tag = 19
          Left = 686
          Top = 113
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 11
          Value = 0
          OnChange = EditHPChange
        end
        object EditHitPoint: TSpinEdit
          Tag = 1
          Left = 422
          Top = 25
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 12
          Value = 0
          OnChange = EditHPChange
        end
        object EditSpeedPoint: TSpinEdit
          Tag = 2
          Left = 422
          Top = 47
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 13
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit1: TSpinEdit
          Tag = 12
          Left = 686
          Top = 201
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 14
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit2: TSpinEdit
          Tag = 17
          Left = 686
          Top = 69
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 15
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit3: TSpinEdit
          Tag = 27
          Left = 422
          Top = 223
          Width = 52
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 16
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit4: TSpinEdit
          Tag = 3
          Left = 422
          Top = 69
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 17
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit8: TSpinEdit
          Tag = 21
          Left = 554
          Top = 135
          Width = 52
          Height = 21
          MaxValue = 200
          MinValue = 0
          TabOrder = 18
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit9: TSpinEdit
          Tag = 8
          Left = 422
          Top = 113
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 19
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit10: TSpinEdit
          Tag = 7
          Left = 422
          Top = 91
          Width = 52
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 20
          Value = 0
          OnChange = EditHPChange
        end
        object Button1: TButton
          Left = 16
          Top = 315
          Width = 62
          Height = 25
          Caption = #22686#21152'(&A)'
          Enabled = False
          TabOrder = 21
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 92
          Top = 315
          Width = 62
          Height = 25
          Caption = #20462#25913'(&E)'
          Enabled = False
          TabOrder = 22
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 168
          Top = 315
          Width = 62
          Height = 25
          Caption = #21024#38500'(&D)'
          Enabled = False
          TabOrder = 23
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 244
          Top = 315
          Width = 62
          Height = 25
          Caption = #20445#23384'(&S)'
          Enabled = False
          TabOrder = 24
          OnClick = Button4Click
        end
        object Edit1: TEdit
          Tag = -1
          Left = 69
          Top = 285
          Width = 276
          Height = 20
          ImeName = 'Microsoft Office IME 2007'
          MaxLength = 50
          TabOrder = 25
        end
        object SpinEdit5: TSpinEdit
          Tag = 26
          Left = 686
          Top = 223
          Width = 52
          Height = 21
          MaxValue = 1
          MinValue = 0
          TabOrder = 26
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit6: TSpinEdit
          Tag = 24
          Left = 422
          Top = 179
          Width = 52
          Height = 21
          MaxValue = 20
          MinValue = 0
          TabOrder = 27
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit7: TSpinEdit
          Tag = 22
          Left = 422
          Top = 135
          Width = 52
          Height = 21
          MaxValue = 200
          MinValue = 0
          TabOrder = 28
          Value = 0
          OnChange = EditHPChange
        end
        object GroupBox25: TGroupBox
          Left = 12
          Top = 15
          Width = 333
          Height = 258
          Caption = #22871#35013#35774#32622
          TabOrder = 29
          object Label52: TLabel
            Left = 10
            Top = 22
            Width = 54
            Height = 12
            Caption = #34915#26381'('#30007'):'
          end
          object Label53: TLabel
            Left = 167
            Top = 23
            Width = 54
            Height = 12
            Caption = #34915#26381'('#22899'):'
          end
          object Label54: TLabel
            Left = 10
            Top = 48
            Width = 30
            Height = 12
            Caption = #27494#22120':'
          end
          object Label55: TLabel
            Left = 10
            Top = 74
            Width = 30
            Height = 12
            Caption = #39033#38142':'
          end
          object Label56: TLabel
            Left = 10
            Top = 100
            Width = 30
            Height = 12
            Caption = #22836#30420':'
          end
          object Label57: TLabel
            Left = 10
            Top = 126
            Width = 30
            Height = 12
            Caption = #34593#28891':'
          end
          object Label58: TLabel
            Left = 10
            Top = 152
            Width = 30
            Height = 12
            Caption = #25163#38255':'
          end
          object Label59: TLabel
            Left = 167
            Top = 152
            Width = 30
            Height = 12
            Caption = #25163#38255':'
          end
          object Label60: TLabel
            Left = 167
            Top = 178
            Width = 30
            Height = 12
            Caption = #25106#25351':'
          end
          object Label61: TLabel
            Left = 10
            Top = 178
            Width = 30
            Height = 12
            Caption = #25106#25351':'
          end
          object Label62: TLabel
            Left = 10
            Top = 204
            Width = 30
            Height = 12
            Caption = #33136#24102':'
          end
          object Label63: TLabel
            Left = 10
            Top = 230
            Width = 30
            Height = 12
            Caption = #38772#23376':'
          end
          object Label76: TLabel
            Left = 167
            Top = 230
            Width = 48
            Height = 12
            Caption = #23432#25252#30707': '
          end
          object Edit2: TEdit
            Left = 64
            Top = 19
            Width = 97
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 0
          end
          object Edit3: TEdit
            Tag = 1
            Left = 46
            Top = 45
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 1
          end
          object Edit4: TEdit
            Tag = 3
            Left = 46
            Top = 71
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 2
          end
          object Edit5: TEdit
            Tag = 4
            Left = 46
            Top = 97
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 3
          end
          object Edit6: TEdit
            Tag = 2
            Left = 46
            Top = 123
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 4
          end
          object Edit7: TEdit
            Tag = 5
            Left = 46
            Top = 149
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 5
          end
          object Edit8: TEdit
            Tag = 7
            Left = 46
            Top = 175
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 6
          end
          object Edit9: TEdit
            Tag = 10
            Left = 46
            Top = 201
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 7
          end
          object Edit10: TEdit
            Tag = 11
            Left = 46
            Top = 227
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 8
          end
          object Edit11: TEdit
            Tag = 9
            Left = 224
            Top = 19
            Width = 94
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 9
          end
          object Edit12: TEdit
            Tag = 6
            Left = 203
            Top = 149
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 10
          end
          object Edit13: TEdit
            Tag = 8
            Left = 211
            Top = 175
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 11
          end
          object Edit14: TEdit
            Tag = 12
            Left = 211
            Top = 227
            Width = 107
            Height = 20
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 12
          end
        end
        object SpinEdit11: TSpinEdit
          Tag = 20
          Left = 554
          Top = 157
          Width = 52
          Height = 21
          MaxValue = 9
          MinValue = 0
          TabOrder = 30
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit12: TSpinEdit
          Tag = 23
          Left = 422
          Top = 157
          Width = 52
          Height = 21
          MaxValue = 200
          MinValue = 0
          TabOrder = 31
          Value = 0
          OnChange = EditHPChange
        end
        object CheckBox2: TCheckBox
          Left = 344
          Top = 318
          Width = 177
          Height = 17
          Caption = #19981#26174#31034#35774#32622#29289#21697#20449#24687
          TabOrder = 32
        end
        object SpinEdit13: TSpinEdit
          Tag = 28
          Left = 554
          Top = 223
          Width = 52
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 33
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit14: TSpinEdit
          Tag = 30
          Left = 422
          Top = 245
          Width = 52
          Height = 21
          MaxValue = 100
          MinValue = 0
          TabOrder = 34
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit15: TSpinEdit
          Tag = 25
          Left = 554
          Top = 245
          Width = 52
          Height = 21
          MaxValue = 1000
          MinValue = 0
          TabOrder = 35
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit16: TSpinEdit
          Tag = 29
          Left = 422
          Top = 201
          Width = 52
          Height = 21
          MaxValue = 10
          MinValue = 0
          TabOrder = 36
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit17: TSpinEdit
          Tag = 32
          Left = 422
          Top = 267
          Width = 52
          Height = 21
          MaxValue = 1
          MinValue = 0
          TabOrder = 37
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit18: TSpinEdit
          Tag = 33
          Left = 554
          Top = 267
          Width = 52
          Height = 21
          MaxValue = 1
          MinValue = 0
          TabOrder = 38
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit19: TSpinEdit
          Tag = 35
          Left = 422
          Top = 289
          Width = 52
          Height = 21
          MaxValue = 1000
          MinValue = 0
          TabOrder = 39
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit20: TSpinEdit
          Tag = 34
          Left = 686
          Top = 267
          Width = 52
          Height = 21
          MaxValue = 1000
          MinValue = 0
          TabOrder = 40
          Value = 0
          OnChange = EditHPChange
        end
        object SpinEdit21: TSpinEdit
          Tag = 31
          Left = 686
          Top = 245
          Width = 52
          Height = 21
          MaxValue = 1
          MinValue = 0
          TabOrder = 41
          Value = 0
          OnChange = EditHPChange
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 40
    Top = 144
    object A1: TMenuItem
      Caption = '????(&A)'
      OnClick = A1Click
    end
  end
end
