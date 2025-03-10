object frmIPaddrFilter: TfrmIPaddrFilter
  Left = 212
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23433#20840#36807#28388
  ClientHeight = 388
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435'?'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBoxActive: TGroupBox
    Left = 10
    Top = 10
    Width = 171
    Height = 361
    Caption = #24403#21069#36830#25509
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 30
      Width = 51
      Height = 15
      Caption = #36830#25509#21015#34920':'
    end
    object ListBoxActiveList: TListBox
      Left = 10
      Top = 50
      Width = 151
      Height = 301
      Hint = '?'#21069'?'#25509#30340'IP'#22320#22336#21015#34920
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 15
      Items.Strings = (
        '888.888.888.888')
      ParentShowHint = False
      PopupMenu = ActiveListPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 190
    Top = 10
    Width = 331
    Height = 361
    Caption = #36807#28388#21015#34920
    TabOrder = 1
    object LabelTempList: TLabel
      Left = 10
      Top = 30
      Width = 48
      Height = 15
      Caption = #21160#24577#36807#28388
    end
    object Label1: TLabel
      Left = 170
      Top = 30
      Width = 48
      Height = 15
      Caption = #27704#20037#36807#28388
    end
    object ListBoxTempList: TListBox
      Left = 10
      Top = 50
      Width = 151
      Height = 301
      Hint = '????'#21015#34920#65292#22312#27492#21015#34920#20013#30340'IP?'#26080#27861#24314#31435'?'#25509#65292#20294#22312#31243#24207#37325#26032'???'#27492#21015#34920#30340#20449#24687'?'#34987'?'#31354
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 15
      Items.Strings = (
        '888.888.888.888')
      ParentShowHint = False
      PopupMenu = TempBlockListPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 0
    end
    object ListBoxBlockList: TListBox
      Left = 170
      Top = 50
      Width = 151
      Height = 301
      Hint = #27704#20037'??'#21015#34920#65292#22312#27492#21015#34920#20013#30340'IP?'#26080#27861#24314#31435'?'#25509#65292#27492#21015#34920'?'#20445#23384#20110#37197#32622#25991#20214#20013#65292#22312#31243#24207#37325#26032'????'#37325#26032#21152'?'#27492#21015#34920
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 15
      Items.Strings = (
        '888.888.888.888')
      ParentShowHint = False
      PopupMenu = BlockListPopupMenu
      ShowHint = True
      Sorted = True
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 530
    Top = 10
    Width = 231
    Height = 331
    Caption = #25915#20987#20445#25252
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 25
      Width = 48
      Height = 15
      Caption = #36830#25509#38480#21046
    end
    object Label9: TLabel
      Left = 10
      Top = 55
      Width = 51
      Height = 15
      Caption = #36830#25509#36229#26102':'
    end
    object Label10: TLabel
      Left = 209
      Top = 55
      Width = 12
      Height = 15
      Caption = #31186
    end
    object EditMaxConnect: TSpinEdit
      Left = 144
      Top = 20
      Width = 81
      Height = 24
      Hint = '??IP'#22320#22336#65292#26368#22810#21487#20197#24314#31435'?'#25509'?'#65292#36229'?'#25351#23450'?'#25509'??'#25353#19979#38754#30340#25805#20316'?'#29702
      EditorEnabled = False
      MaxValue = 1000
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 50
      OnChange = EditMaxConnectChange
    end
    object GroupBox3: TGroupBox
      Left = 10
      Top = 230
      Width = 211
      Height = 91
      Caption = #25915#20987#25805#20316
      TabOrder = 1
      object RadioAddBlockList: TRadioButton
        Left = 20
        Top = 60
        Width = 161
        Height = 21
        Hint = '?'#27492'?'#25509#30340'IP'#21152#20837#27704#20037'??'#21015#34920#65292'??'#27492'IP'#30340#25152#26377'?'#25509#24378#34892#20013'?'
        Caption = #21152#20837#27704#20037#36807#28388#21015#34920
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = RadioAddBlockListClick
      end
      object RadioAddTempList: TRadioButton
        Left = 20
        Top = 40
        Width = 161
        Height = 21
        Hint = '?'#27492'?'#25509#30340'IP'#21152#20837'????'#21015#34920#65292'??'#27492'IP'#30340#25152#26377'?'#25509#24378#34892#20013'?'
        Caption = #21152#20837#21160#24577#36807#28388#21015#34920
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = RadioAddTempListClick
      end
      object RadioDisConnect: TRadioButton
        Left = 20
        Top = 20
        Width = 161
        Height = 21
        Hint = '??'#25509'??'#30340'???'#29702
        Caption = #26029#24320#36830#25509
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = RadioDisConnectClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 10
      Top = 80
      Width = 211
      Height = 141
      Caption = #27969#37327#25511#21046
      TabOrder = 2
      object Label6: TLabel
        Left = 10
        Top = 55
        Width = 51
        Height = 15
        Caption = #26368#22823#38480#21046':'
      end
      object Label8: TLabel
        Left = 10
        Top = 85
        Width = 51
        Height = 15
        Caption = #25968#37327#38480#21046':'
      end
      object Label5: TLabel
        Left = 10
        Top = 25
        Width = 51
        Height = 15
        Caption = #20020#30028#22823#23567':'
      end
      object EditMaxSize: TSpinEdit
        Left = 80
        Top = 50
        Width = 81
        Height = 24
        Hint = #25509#25910#21040#30340'?'#25454#20449#24687#26368#22823#38480#21046#65292#22914#26524#36229'?'#27492#22823#23567#65292'?'#34987'??'#25915'?'#12290
        EditorEnabled = False
        Increment = 10
        MaxValue = 10000
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 6000
        OnChange = EditMaxSizeChange
      end
      object EditMaxClientMsgCount: TSpinEdit
        Left = 80
        Top = 80
        Width = 81
        Height = 24
        Hint = #19968#27425#25509#25910#21040'?'#25454#20449#24687#30340'?'#37327#22810#23569#65292#36229'?'#25351#23450'?'#37327'?'#34987'??'#25915'?'#12290
        EditorEnabled = False
        MaxValue = 100
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 5
        OnChange = EditMaxClientMsgCountChange
      end
      object CheckBoxLostLine: TCheckBox
        Left = 80
        Top = 110
        Width = 121
        Height = 21
        Hint = #25171'?'#27492#21151#33021#21518#65292#22914#26524#23458'?'#31471#30340'?'#36865#30340'?'#25454#36229'?'#25351#23450#38480#21046'??'#30452#25509'?'#20854#25481'?'
        BiDiMode = bdLeftToRight
        Caption = #24322#24120#25481#32447#22788#29702
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = CheckBoxLostLineClick
      end
      object EditNomSize: TSpinEdit
        Left = 80
        Top = 20
        Width = 81
        Height = 24
        Hint = #25509#25910#21040#30340'?'#25454#20449#24687'?'#30028#22823#23567#65292#22914#26524#36229'?'#27492#22823#23567#65292'?'#34987#29305#27530'?'#29702#12290
        EditorEnabled = False
        Increment = 10
        MaxValue = 1000
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Value = 100
        OnChange = EditNomSizeChange
      end
    end
    object EditClientTimeOutTime: TSpinEdit
      Left = 120
      Top = 50
      Width = 81
      Height = 24
      EditorEnabled = False
      MaxValue = 10
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Value = 5
      OnChange = EditClientTimeOutTimeChange
    end
  end
  object ButtonOK: TButton
    Left = 650
    Top = 350
    Width = 111
    Height = 31
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object BlockListPopupMenu: TPopupMenu
    OnPopup = BlockListPopupMenuPopup
    Left = 336
    Top = 168
    object BPOPMENU_REFLIST: TMenuItem
      Caption = '????(&R)'
      OnClick = BPOPMENU_REFLISTClick
    end
    object BPOPMENU_SORT: TMenuItem
      Caption = '??(&S)'
      OnClick = BPOPMENU_SORTClick
    end
    object BPOPMENU_ADD: TMenuItem
      Caption = '??(&A)'
      OnClick = BPOPMENU_ADDClick
    end
    object BPOPMENU_ADDTEMPLIST: TMenuItem
      Caption = '??(1)??(&D)'
      OnClick = BPOPMENU_ADDTEMPLISTClick
    end
    object BPOPMENU_DELETE: TMenuItem
      Caption = '??(&D)'
      OnClick = BPOPMENU_DELETEClick
    end
  end
  object TempBlockListPopupMenu: TPopupMenu
    OnPopup = TempBlockListPopupMenuPopup
    Left = 216
    Top = 160
    object TPOPMENU_REFLIST: TMenuItem
      Caption = '????(&R)'
      OnClick = TPOPMENU_REFLISTClick
    end
    object TPOPMENU_SORT: TMenuItem
      Caption = '??(&S)'
      OnClick = TPOPMENU_SORTClick
    end
    object TPOPMENU_ADD: TMenuItem
      Caption = '??(&A)'
      OnClick = TPOPMENU_ADDClick
    end
    object TPOPMENU_BLOCKLIST: TMenuItem
      Caption = '??(2)??(&D)'
      OnClick = TPOPMENU_BLOCKLISTClick
    end
    object TPOPMENU_DELETE: TMenuItem
      Caption = '??(&D)'
      OnClick = TPOPMENU_DELETEClick
    end
  end
  object ActiveListPopupMenu: TPopupMenu
    OnPopup = ActiveListPopupMenuPopup
    Left = 56
    Top = 160
    object APOPMENU_REFLIST: TMenuItem
      Caption = '????(&R)'
      OnClick = APOPMENU_REFLISTClick
    end
    object APOPMENU_SORT: TMenuItem
      Caption = '??(&S)'
      OnClick = APOPMENU_SORTClick
    end
    object APOPMENU_ADDTEMPLIST: TMenuItem
      Caption = '??(1)??(&A)'
      OnClick = APOPMENU_ADDTEMPLISTClick
    end
    object APOPMENU_BLOCKLIST: TMenuItem
      Caption = '??(2)??(&D)'
      OnClick = APOPMENU_BLOCKLISTClick
    end
    object APOPMENU_KICK: TMenuItem
      Caption = '????(&K)'
      OnClick = APOPMENU_KICKClick
    end
  end
end
