object frmIPaddrFilter: TfrmIPaddrFilter
  Left = 198
  Top = 273
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'IP'#52264#45800#49444#51221
  ClientHeight = 383
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
    Caption = #51217#49549#51473' IP'#47785#47197
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 30
      Width = 27
      Height = 15
      Caption = #47785#47197':'
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
    Caption = #52264#45800' IP'#47785#47197
    TabOrder = 1
    object LabelTempList: TLabel
      Left = 10
      Top = 30
      Width = 42
      Height = 15
      Caption = #52264#45800'(1):'
    end
    object Label1: TLabel
      Left = 170
      Top = 30
      Width = 42
      Height = 15
      Caption = #52264#45800'(2):'
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
    Height = 321
    Caption = #49444#51221
    TabOrder = 2
    object Label2: TLabel
      Left = 10
      Top = 25
      Width = 116
      Height = 15
      Caption = #46041#49884#51217#49549' '#54728#50857' IP'#44079#49688':'
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
      Top = 170
      Width = 211
      Height = 111
      Caption = #51217#49549#52488#44284' '#49884' '#49444#51221
      TabOrder = 1
      object RadioAddBlockList: TRadioButton
        Left = 20
        Top = 80
        Width = 161
        Height = 21
        Hint = '?'#27492'?'#25509#30340'IP'#21152#20837#27704#20037'??'#21015#34920#65292'??'#27492'IP'#30340#25152#26377'?'#25509#24378#34892#20013'?'
        Caption = #52264#45800' IP '#46321#47197'(2)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = RadioAddBlockListClick
      end
      object RadioAddTempList: TRadioButton
        Left = 20
        Top = 50
        Width = 161
        Height = 21
        Hint = '?'#27492'?'#25509#30340'IP'#21152#20837'????'#21015#34920#65292'??'#27492'IP'#30340#25152#26377'?'#25509#24378#34892#20013'?'
        Caption = #52264#45800'IP '#46321#47197' (1)'
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
        Caption = #51217#49549#52264#45800
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = RadioDisConnectClick
      end
    end
  end
  object ButtonOK: TButton
    Left = 650
    Top = 340
    Width = 111
    Height = 31
    Caption = #51200#51109'(&O)'
    Default = True
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object BlockListPopupMenu: TPopupMenu
    OnPopup = BlockListPopupMenuPopup
    Left = 336
    Top = 168
    object BPOPMENU_REFLIST: TMenuItem
      Caption = #49352#47196#44256#52840'(&R)'
      OnClick = BPOPMENU_REFLISTClick
    end
    object BPOPMENU_SORT: TMenuItem
      Caption = #51221#47148'(&S)'
      OnClick = BPOPMENU_SORTClick
    end
    object BPOPMENU_ADD: TMenuItem
      Caption = #52628#44032'(&A)'
      OnClick = BPOPMENU_ADDClick
    end
    object BPOPMENU_ADDTEMPLIST: TMenuItem
      Caption = #52264#45800'(1)'#46321#47197'(&D)'
      OnClick = BPOPMENU_ADDTEMPLISTClick
    end
    object BPOPMENU_DELETE: TMenuItem
      Caption = #49325#51228'(&D)'
      OnClick = BPOPMENU_DELETEClick
    end
  end
  object TempBlockListPopupMenu: TPopupMenu
    OnPopup = TempBlockListPopupMenuPopup
    Left = 216
    Top = 160
    object TPOPMENU_REFLIST: TMenuItem
      Caption = #49352#47196#44256#52840'(&R)'
      OnClick = TPOPMENU_REFLISTClick
    end
    object TPOPMENU_SORT: TMenuItem
      Caption = #51221#47148'(&S)'
      OnClick = TPOPMENU_SORTClick
    end
    object TPOPMENU_ADD: TMenuItem
      Caption = #52628#44032'(&A)'
      OnClick = TPOPMENU_ADDClick
    end
    object TPOPMENU_BLOCKLIST: TMenuItem
      Caption = #52264#45800'(2)'#46321#47197'(&D)'
      OnClick = TPOPMENU_BLOCKLISTClick
    end
    object TPOPMENU_DELETE: TMenuItem
      Caption = #49325#51228'(&D)'
      OnClick = TPOPMENU_DELETEClick
    end
  end
  object ActiveListPopupMenu: TPopupMenu
    OnPopup = ActiveListPopupMenuPopup
    Left = 56
    Top = 160
    object APOPMENU_REFLIST: TMenuItem
      Caption = #49352#47196#44256#52840'(&R)'
      OnClick = APOPMENU_REFLISTClick
    end
    object APOPMENU_SORT: TMenuItem
      Caption = #51221#47148'(&S)'
      OnClick = APOPMENU_SORTClick
    end
    object APOPMENU_ADDTEMPLIST: TMenuItem
      Caption = #52264#45800'(1)'#46321#47197'(&A)'
      OnClick = APOPMENU_ADDTEMPLISTClick
    end
    object APOPMENU_BLOCKLIST: TMenuItem
      Caption = #52264#45800'(2)'#46321#47197'(&D)'
      OnClick = APOPMENU_BLOCKLISTClick
    end
    object APOPMENU_KICK: TMenuItem
      Caption = #51217#49549#52264#45800'(&K)'
      OnClick = APOPMENU_KICKClick
    end
  end
end
