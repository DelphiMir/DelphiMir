object frmSysManager: TfrmSysManager
  Left = 345
  Top = 233
  Width = 888
  Height = 418
  Caption = #31649#29702#31995#32479' '
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
    Width = 872
    Height = 380
    Align = alClient
    TabOrder = 0
    object ListView: TListView
      Left = 1
      Top = 1
      Width = 870
      Height = 359
      Align = alClient
      Columns = <
        item
          Caption = #22320#22270
        end
        item
          Alignment = taCenter
          Caption = #22320#22270#21517#31216
          Width = 120
        end
        item
          Alignment = taCenter
          Caption = #22352#26631#20301#32622
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #33521#38596
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #24618#29289
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #22825#20351
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #29289#21697
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #33258#21160#21047#24618
          Width = 60
        end
        item
          Alignment = taCenter
          Caption = #20154#29289#36827#20837#21047#24618
          Width = 115
        end
        item
          Alignment = taCenter
          Caption = #25511#21046#29575#22686#21152
          Width = 140
        end
        item
          Alignment = taCenter
          Caption = #22351#29575#22686#21152
          Width = 80
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PopupMenu
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListViewClick
    end
    object StatusBar: TStatusBar
      Left = 1
      Top = 360
      Width = 870
      Height = 19
      Panels = <
        item
          Width = 110
        end
        item
          Width = 110
        end
        item
          Width = 110
        end
        item
          Width = 110
        end
        item
          Width = 110
        end
        item
          Width = 110
        end
        item
          Width = 110
        end>
    end
  end
  object PopupMenu: TPopupMenu
    Left = 224
    Top = 160
    object PopupMenu_Ref: TMenuItem
      Caption = #21047#26032'(&R)'
      OnClick = PopupMenu_RefClick
    end
    object PopupMenu_AutoRef: TMenuItem
      Caption = #33258#21160#21047#26032'(&A)'
      OnClick = PopupMenu_AutoRefClick
    end
    object PopupMenu__: TMenuItem
      Caption = '-'
    end
    object PopupMenu_MonGen: TMenuItem
      Caption = #20801#35768#21047#24618
      OnClick = PopupMenu_MonGenClick
    end
    object PopupMenu_RunHum: TMenuItem
      Caption = #20154#29289#36827#20837#21047#24618
      OnClick = PopupMenu_MonGenClick
    end
    object PopupMenu_: TMenuItem
      Caption = '-'
    end
    object PopupMenu_ShowHum: TMenuItem
      Caption = #26597#30475#29992#25143'(&H)'
      OnClick = PopupMenu_ShowHumClick
    end
    object PopupMenu_ShowMon: TMenuItem
      Caption = #26597#30475#24618#29289'(&M)'
      OnClick = PopupMenu_ShowMonClick
    end
    object PopupMenu_ShowNpc: TMenuItem
      Caption = #26597#30475'NPC(&N)'
      OnClick = PopupMenu_ShowNpcClick
    end
    object PopupMenu_1: TMenuItem
      Caption = '-'
    end
    object PopupMenu_ClearMon: TMenuItem
      Caption = #28165#38500#24618#29289
      OnClick = PopupMenu_ClearMonClick
    end
    object PopupMenu_2: TMenuItem
      Caption = '-'
    end
    object PopupMenu_IncMob: TMenuItem
      Caption = #24618#29289#24310#26102#22686#21152'(+10%)'
      OnClick = PopupMenu_IncMobClick
    end
    object PopupMenu_DecMob: TMenuItem
      Caption = #24618#29289#24310#26102#20943#23569'(-10%)'
      OnClick = PopupMenu_IncMobClick
    end
    object PopupMenu_AllIncMob: TMenuItem
      Caption = #20840#37096#24618#29289#24310#26102#22686#21152'(+10%)'
      OnClick = PopupMenu_AllIncMobClick
    end
    object PopupMenu_AllDecMob: TMenuItem
      Caption = #20840#37096#24618#29289#24310#26102#20943#23569'(-10%)'
      OnClick = PopupMenu_AllIncMobClick
    end
    object PopupMenu_3: TMenuItem
      Caption = '-'
    end
    object PopupMenu_IncMobZen: TMenuItem
      Caption = #24618#29289#22686#21152'(+10%)'
      OnClick = PopupMenu_IncMobZenClick
    end
    object PopupMenu_DecMobZen: TMenuItem
      Caption = #24618#29289#20943#23569'(-10%)'
      OnClick = PopupMenu_IncMobZenClick
    end
    object PopupMenu_IncAllMobZen: TMenuItem
      Caption = #20840#37096#24618#29289#22686#21152'(+10%)'
      OnClick = PopupMenu_IncAllMobZenClick
    end
    object PopupMenu_DecAllMobZen: TMenuItem
      Caption = #20840#37096#24618#29289#20943#23569'(-10%)'
      OnClick = PopupMenu_IncAllMobZenClick
    end
    object PopupMenu_4: TMenuItem
      Caption = '-'
    end
    object PopupMenu_IMobZen: TMenuItem
      Caption = #22686#21152#20801#35768#26356#25913#30340#24618#25968
      OnClick = PopupMenu_IMobZenClick
    end
    object PopupMenu_DMobZen: TMenuItem
      Caption = #20943#23569#20801#35768#26356#25913#30340#24618#25968
      OnClick = PopupMenu_IMobZenClick
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 192
    Top = 160
  end
end
