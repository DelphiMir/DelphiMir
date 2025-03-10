object GradBuilder: TGradBuilder
  Left = 328
  Top = 269
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Gradient builder'
  ClientHeight = 236
  ClientWidth = 292
  Color = clBtnFace
  Constraints.MaxHeight = 263
  Constraints.MaxWidth = 300
  Constraints.MinHeight = 263
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TsLabel
    Left = 164
    Top = 22
    Width = 110
    Height = 117
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'For gradient changing use the panel located at the left. Click o' +
      'n this bar for new point creation, click right mouse button on t' +
      'his point for color changing or point removing.'
    Layout = tlCenter
    WordWrap = True
  end
  object PaintPanel: TPanel
    Left = 14
    Top = 20
    Width = 89
    Height = 198
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Caption = ' '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 87
      Height = 196
      Align = alClient
      OnPaint = PaintBox1Paint
    end
  end
  object Panel2: TsPanel
    Left = 113
    Top = 17
    Width = 43
    Height = 204
    BorderWidth = 4
    TabOrder = 1
    OnClick = Panel2Click
    Ctl3D = False
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsPanel_Lowered'
    sStyle.Painting.Bevel = cbLoweredSoft
    sStyle.Painting.Color = clBtnFace
    BevelOuter = cbLoweredSoft
    Caption = ' '
    object TemplatePanel: TPanel
      Left = 4
      Top = 107
      Width = 33
      Height = 28
      Caption = ' '
      DragCursor = crHandPoint
      PopupMenu = PopupMenu1
      TabOrder = 0
      Visible = False
      OnDblClick = TemplatePanelDblClick
      OnMouseDown = TemplatePanelMouseDown
      OnMouseMove = TemplatePanelMouseMove
      OnMouseUp = TemplatePanelMouseUp
    end
  end
  object ComboBox1: TComboBox
    Left = 183
    Top = 153
    Width = 83
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = ComboBox1Change
    Items.Strings = (
      'Vertical'
      'Horizontal')
  end
  object BitBtn1: TsButton
    Left = 188
    Top = 190
    Width = 75
    Height = 25
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = '8421504;16777215;99;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;8421504;10;0;0;8421504;16777215;43;0;0;16777215;10658466' +
      ';28;0;0;10658466;13816530;18;0;0;13816530;13816530;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    Caption = 'Close'
    OnClick = BitBtn1Click
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 248
    Top = 32
    object Changecolor1: TMenuItem
      Caption = 'Change color'
      Default = True
      OnClick = Changecolor1Click
    end
    object Delete1: TMenuItem
      Caption = 'Delete'
      OnClick = Delete1Click
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 180
    Top = 16
  end
  object sSkinProvider1: TsSkinProvider
    BorderIcons = []
    CaptionAlignment = taCenter
    MakeSkinMenu = False
    ShowAppIcon = False
    TitleButtons = <>
    Left = 210
    Top = 16
  end
end
