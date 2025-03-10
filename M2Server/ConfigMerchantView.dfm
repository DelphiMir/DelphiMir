object frmConfigMerchantView: TfrmConfigMerchantView
  Left = 319
  Top = 318
  Width = 674
  Height = 601
  Caption = 'frmConfigMerchantView'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 658
    Height = 563
    Align = alClient
    TabOrder = 0
    object ListView: TListView
      Left = 1
      Top = 1
      Width = 656
      Height = 561
      Align = alClient
      Columns = <
        item
          Caption = '??'
        end
        item
          Caption = '?????'
          Width = 100
        end
        item
          Caption = #22352#26631
          Width = 80
        end
        item
          Caption = #21830#24215'NPC'
          Width = 60
        end
        item
          Caption = #19968#33324' NPC'
          Width = 60
        end
        item
          Caption = #38544#34255#65288#19981#26174#31034#65289' '
          Width = 110
        end
        item
          Caption = #36733#20837
          Width = 200
        end>
      GridLines = True
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenu
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewClick
      OnDblClick = ListViewDblClick
    end
  end
  object PopupMenu: TPopupMenu
    Left = 344
    Top = 160
    object PopupMenu_Ref: TMenuItem
      Caption = #21047#26032'(&R)'
      OnClick = PopupMenu_RefClick
    end
    object PopupMenu_AutoRef: TMenuItem
      Caption = #33258#21160#21047#26032'(&A)'
      Enabled = False
    end
    object PopupMenu_: TMenuItem
      Caption = '-'
    end
    object PopupMenu_Load: TMenuItem
      Caption = '?????(&K)'
      OnClick = PopupMenu_LoadClick
    end
    object PopupMenu_Clear: TMenuItem
      Caption = '?????(&C)'
      OnClick = PopupMenu_ClearClick
    end
    object PopupMenu_Open: TMenuItem
      Caption = '?????(&O)'
      OnClick = PopupMenu_OpenClick
    end
    object PopupMenu_1: TMenuItem
      Caption = '-'
    end
    object PopupMenu_Del: TMenuItem
      Caption = '?????(&D)'
      OnClick = PopupMenu_DelClick
    end
  end
end
