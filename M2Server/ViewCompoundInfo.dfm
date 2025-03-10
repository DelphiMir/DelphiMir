object FrmViewCompoundInfo: TFrmViewCompoundInfo
  Left = 699
  Top = 226
  Width = 576
  Height = 638
  Caption = #29289#21697#21512#25104#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object GroupBox1: TGroupBox
    Left = 0
    Top = 8
    Width = 560
    Height = 97
    Caption = #29289#21697#35273#37266
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 8
      Top = 15
      Width = 190
      Height = 70
      Caption = #29289#21697#31561#32423#39068#33394
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 30
        Height = 12
        Caption = #19968#33324':'
      end
      object Label2: TLabel
        Left = 100
        Top = 19
        Width = 30
        Height = 12
        Caption = #23453#29289':'
      end
      object Label3: TLabel
        Left = 8
        Top = 43
        Width = 30
        Height = 12
        Caption = #22307#29289':'
      end
      object Label4: TLabel
        Left = 100
        Top = 43
        Width = 30
        Height = 12
        Caption = #31070#29289':'
      end
      object seColor1: TSpinEdit
        Left = 44
        Top = 16
        Width = 48
        Height = 21
        MaxValue = 255
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = seColorChange
      end
      object seColor2: TSpinEdit
        Left = 136
        Top = 16
        Width = 48
        Height = 21
        MaxValue = 255
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = seColorChange
      end
      object seColor3: TSpinEdit
        Left = 44
        Top = 41
        Width = 48
        Height = 21
        MaxValue = 255
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = seColorChange
      end
      object seColor4: TSpinEdit
        Left = 136
        Top = 41
        Width = 48
        Height = 21
        MaxValue = 255
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = seColorChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 210
      Top = 15
      Width = 240
      Height = 70
      Caption = #29289#21697#35273#37266#36153#29992'('#37329#24065')'
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 19
        Width = 30
        Height = 12
        Caption = #19968#33324':'
      end
      object Label6: TLabel
        Left = 128
        Top = 19
        Width = 30
        Height = 12
        Caption = #23453#29289':'
      end
      object Label7: TLabel
        Left = 8
        Top = 43
        Width = 30
        Height = 12
        Caption = #22307#29289':'
      end
      object Label8: TLabel
        Left = 128
        Top = 43
        Width = 30
        Height = 12
        Caption = #31070#29289':'
      end
      object eGoldFee1: TEdit
        Left = 44
        Top = 16
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGoldFee2: TEdit
        Left = 163
        Top = 16
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGoldFee3: TEdit
        Left = 44
        Top = 41
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGoldFee4: TEdit
        Left = 164
        Top = 41
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = '0'
        OnChange = eGoldFeeChange
      end
    end
    object GroupBox4: TGroupBox
      Left = 622
      Top = 15
      Width = 240
      Height = 70
      Caption = '??? ?? ??(?)'
      TabOrder = 2
      Visible = False
      object Label9: TLabel
        Left = 8
        Top = 19
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label10: TLabel
        Left = 128
        Top = 19
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label11: TLabel
        Left = 8
        Top = 43
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label12: TLabel
        Left = 128
        Top = 43
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object eGameGoldFee1: TEdit
        Left = 44
        Top = 16
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 0
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGameGoldFee2: TEdit
        Left = 163
        Top = 16
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 1
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGameGoldFee3: TEdit
        Left = 44
        Top = 41
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 2
        Text = '0'
        OnChange = eGoldFeeChange
      end
      object eGameGoldFee4: TEdit
        Left = 164
        Top = 41
        Width = 70
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        TabOrder = 3
        Text = '0'
        OnChange = eGoldFeeChange
      end
    end
    object GroupBox5: TGroupBox
      Left = 714
      Top = 15
      Width = 190
      Height = 70
      Caption = '??? ?? ??'
      TabOrder = 3
      Visible = False
      object Label13: TLabel
        Left = 8
        Top = 19
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label14: TLabel
        Left = 100
        Top = 19
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label15: TLabel
        Left = 8
        Top = 43
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object Label16: TLabel
        Left = 100
        Top = 43
        Width = 18
        Height = 12
        Caption = '??:'
      end
      object seDropRate1: TSpinEdit
        Left = 44
        Top = 16
        Width = 48
        Height = 21
        MaxValue = 100
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = seDropRateChange
      end
      object seDropRate2: TSpinEdit
        Left = 136
        Top = 16
        Width = 48
        Height = 21
        MaxValue = 100
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = seDropRateChange
      end
      object seDropRate3: TSpinEdit
        Left = 44
        Top = 41
        Width = 48
        Height = 21
        MaxValue = 100
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = seDropRateChange
      end
      object seDropRate4: TSpinEdit
        Left = 136
        Top = 41
        Width = 48
        Height = 21
        MaxValue = 100
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = seDropRateChange
      end
    end
    object BtnSave: TButton
      Left = 454
      Top = 59
      Width = 91
      Height = 25
      Caption = #20445#23384'(&S)'
      TabOrder = 4
      OnClick = BtnSaveClick
    end
    object GroupBox6: TGroupBox
      Left = 454
      Top = 15
      Width = 91
      Height = 40
      Caption = #35273#37266#27425#25968
      TabOrder = 5
      object seValueLimit: TSpinEdit
        Left = 10
        Top = 14
        Width = 71
        Height = 21
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 10
        OnChange = seDropRateChange
      end
    end
  end
  object lvCompoundInfo: TListView
    Left = 0
    Top = 104
    Width = 560
    Height = 477
    Columns = <
      item
        AutoSize = True
        Caption = #29289#21697
      end
      item
        Caption = #31561#32423
        Width = 40
      end
      item
        Caption = #25104#21151#29575
      end
      item
        Caption = #38450#24481
        Width = 65
      end
      item
        Caption = #39764#27861#38450#24481
        Width = 65
      end
      item
        Caption = #25915#20987
        Width = 65
      end
      item
        Caption = #39764#27861
        Width = 65
      end
      item
        Caption = #36947#26415
        Width = 65
      end>
    GridLines = True
    HotTrackStyles = [htHandPoint]
    MultiSelect = True
    OwnerData = True
    RowSelect = True
    ShowWorkAreas = True
    TabOrder = 1
    ViewStyle = vsReport
    OnCustomDrawItem = lvCompoundInfoCustomDrawItem
    OnData = lvCompoundInfoData
    OnMouseDown = lvCompoundInfoMouseDown
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 581
    Width = 560
    Height = 19
    Panels = <
      item
        Text = #36873#20013#21518#25353'Ctrl + '#40736#26631#24038#38190#36827#34892#20462#25913#12290
        Width = 50
      end>
  end
end
