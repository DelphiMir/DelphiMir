object FrmLogManage: TFrmLogManage
  Left = 391
  Top = 120
  Width = 1024
  Height = 732
  Caption = #47196#44536
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = #52572#49548#45216#51676':'
    end
    object Label2: TLabel
      Left = 192
      Top = 16
      Width = 51
      Height = 13
      Caption = #52572#45824#45216#51676':'
    end
    object Label3: TLabel
      Left = 376
      Top = 16
      Width = 27
      Height = 13
      Caption = #44396#48516':'
    end
    object DateTimeEditBegin: TRzDateTimeEdit
      Left = 68
      Top = 13
      Width = 109
      Height = 21
      EditType = etDate
      OnDateTimeChange = DateTimeEditBeginDateTimeChange
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
    end
    object DateTimeEditEnd: TRzDateTimeEdit
      Left = 252
      Top = 13
      Width = 109
      Height = 21
      EditType = etDate
      OnDateTimeChange = DateTimeEditEndDateTimeChange
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
    end
    object ComboBoxCondition: TComboBox
      Left = 436
      Top = 13
      Width = 101
      Height = 21
      Style = csDropDownList
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        #51204#52404
        #52880#47533#47749
        #50500#51060#53596
        #50500#51060#53596#44050
        #45824#49345
        #49444#47749)
    end
    object EditSearch: TEdit
      Left = 543
      Top = 13
      Width = 103
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeName = 'Microsoft Office IME 2007'
      ParentFont = False
      TabOrder = 3
    end
    object ButtonStart: TButton
      Left = 652
      Top = 11
      Width = 75
      Height = 25
      Caption = #44160#49353
      Font.Charset = HANGEUL_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = ButtonStartClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 140
    Height = 626
    Align = alLeft
    TabOrder = 1
    object CheckListBox: TCheckListBox
      Left = 1
      Top = 1
      Width = 138
      Height = 624
      OnClickCheck = CheckListBoxClickCheck
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImeMode = imHanguel
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 13
      Items.Strings = (
        #51204#52404
        #50668#44288#52286#51020
        #50668#44288#47585#44608
        #51228#51312
        #50500#51060#53596#51452#44592
        #50500#51060#53596#51469#45796
        #49373#49328
        #50500#51060#53596#49325#51228
        #50500#51060#53596#48260#47548
        #50500#51060#53596#44144#47000
        #49345#51216#54925#46301
        #49345#51216#51075#51020
        #50500#51060#53596#49324#50857
        #47112#48296#49345#49849
        #44552#51204#51075#51020
        #44552#51204#54925#46301
        #47801#46300#46989
        #50500#51060#53596#46504#44412
        #45824#47144#44277#44201
        #51228#47144#49457#44277
        #51228#47144#49892#54056
        #49457#51088#44552#51064#52636
        #49457#51088#44552#51077#44552
        #51228#47144#52286#51020
        #51228#47144#47585#44608
        #51228#47144#51116#47308#49324#50857
        #44277#49457#51221#48372
        #54872#51204
        #50500#51060#53596#45824#50668
        #54872
        #44172#51076#54252#51064#53944
        #50948#53441#46321#47197
        #50948#53441#54925#46301
        #50948#53441#52712#49548
        #44060#51064#49345#51216
        #48372#50725'/'#49888#51452' '#49457#44277
        #48372#50725'/'#49888#51452' '#47924#48320
        #48372#50725'/'#49888#51452' '#49892#54056
        #51068#48152' '#48516#54644
        #44033#49457' '#48516#54644
        #44033#49457' '#49457#44277
        #44033#49457' '#49892#54056
        #44221#47588' '#46321#47197
        #44221#47588' '#51077#52272
        #44221#47588' '#45209#52272
        #44221#47588' '#50976#52272
        #50689#50885#50668#44288#52286#51020
        #50689#50885#50668#44288#47585#44608
        #44032#50948#48148#50948#48372
        #52292#54021)
      ParentFont = False
      TabOrder = 0
    end
  end
  object ListView: TListView
    Left = 140
    Top = 49
    Width = 868
    Height = 626
    Align = alClient
    Columns = <
      item
        Caption = #49692#49436
      end
      item
        Caption = #44396#48516
        Width = 80
      end
      item
        Caption = #47605
        Width = 60
      end
      item
        Caption = 'X'
        Width = 45
      end
      item
        Caption = 'Y'
        Width = 45
      end
      item
        Caption = #52992#47533#47749
        Width = 90
      end
      item
        Caption = #50500#51060#53596
        Width = 90
      end
      item
        Caption = #50500#51060#53596#44050
        Width = 90
      end
      item
        Caption = #45824#49345
        Width = 70
      end
      item
        Caption = #49444#47749
        Width = 120
      end
      item
        Caption = #45216#51676
        Width = 120
      end>
    GridLines = True
    MultiSelect = True
    RowSelect = True
    PopupMenu = PopupMenu
    TabOrder = 2
    ViewStyle = vsReport
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 675
    Width = 1008
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 400
      end
      item
        Width = 50
      end>
  end
  object PopupMenu: TPopupMenu
    Left = 368
    Top = 248
    object PopupMenu_COPY: TMenuItem
      Caption = #48373#49324
      OnClick = PopupMenu_COPYClick
    end
    object PopupMenu_SELECTALL: TMenuItem
      Caption = #51204#52404#49440#53469
      OnClick = PopupMenu_SELECTALLClick
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 424
    Top = 328
  end
end
