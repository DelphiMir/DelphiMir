object FormInternalSkins: TFormInternalSkins
  Left = 183
  Top = 116
  Width = 340
  Height = 250
  BorderIcons = []
  Caption = 'Internal skins'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 140
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 10
    Top = 11
    Width = 195
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    Sorted = True
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object sBitBtn1: TsButton
    Left = 223
    Top = 175
    Width = 94
    Height = 36
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TSBUTTON_BIG'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Action = ActionClose
    Anchors = [akRight, akBottom]
    TabOrder = 1
  end
  object sPanel1: TsPanel
    Left = 216
    Top = 9
    Width = 109
    Height = 155
    Anchors = [akTop, akRight]
    TabOrder = 2
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsPanel_Lowered'
    sStyle.Painting.Color = clBtnFace
    Caption = ' '
    object sButton2: TsButton
      Left = 9
      Top = 12
      Width = 90
      Height = 25
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsButton'
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
      sStyle.HotStyle.HotBackground.Gradient.Data = 
        '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
        ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
      sStyle.HotStyle.HotPainting.Transparency = 0
      Action = ActionAddNew
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object sButton3: TsButton
      Left = 9
      Top = 39
      Width = 90
      Height = 25
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsButton'
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
      sStyle.HotStyle.HotBackground.Gradient.Data = 
        '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
        ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
      sStyle.HotStyle.HotPainting.Transparency = 0
      Action = ActionRename
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object sButton4: TsButton
      Left = 9
      Top = 66
      Width = 90
      Height = 25
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsButton'
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
      sStyle.HotStyle.HotBackground.Gradient.Data = 
        '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
        ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
      sStyle.HotStyle.HotPainting.Transparency = 0
      Action = ActionExtract
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object sButton1: TsButton
      Left = 9
      Top = 93
      Width = 90
      Height = 25
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsButton'
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
      sStyle.HotStyle.HotBackground.Gradient.Data = 
        '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
        ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
      sStyle.HotStyle.HotPainting.Transparency = 0
      Action = ActionDelete
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object sButton5: TsButton
      Left = 9
      Top = 120
      Width = 90
      Height = 25
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsButton'
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
      sStyle.HotStyle.HotBackground.Gradient.Data = 
        '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
        ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
      sStyle.HotStyle.HotPainting.Transparency = 0
      Action = ActionClear
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
  end
  object ActionList1: TActionList
    Left = 75
    Top = 91
    object ActionAddNew: TAction
      Caption = 'Add new'
      OnExecute = ActionAddNewExecute
    end
    object ActionDelete: TAction
      Caption = 'Delete'
      Enabled = False
      OnExecute = ActionDeleteExecute
    end
    object ActionRename: TAction
      Caption = 'Rename'
      Enabled = False
      OnExecute = ActionRenameExecute
    end
    object ActionClose: TAction
      Caption = 'Close'
      ShortCut = 27
      OnExecute = ActionCloseExecute
    end
    object ActionClear: TAction
      Caption = 'Clear'
      OnExecute = ActionClearExecute
    end
    object ActionExtract: TAction
      Caption = 'Extract'
      OnExecute = ActionExtractExecute
    end
  end
  object sSkinProvider1: TsSkinProvider
    BorderIcons = []
    CaptionAlignment = taCenter
    GripMode = gmRightBottom
    TitleButtons = <>
    Left = 104
    Top = 93
  end
end
